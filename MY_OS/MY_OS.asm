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
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 537
D=A // 538
@SP // 539
AM=M+1 // 540
A=A-1 // 541
M=D // 542
// call String.new
@6 // 543
D=A // 544
@14 // 545
M=D // 546
@String.new // 547
D=A // 548
@13 // 549
M=D // 550
@Main.main.ret.0 // 551
D=A // 552
@CALL // 553
0;JMP // 554
(Main.main.ret.0)
@72 // 555
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
@Main.main.ret.1 // 569
D=A // 570
@CALL // 571
0;JMP // 572
(Main.main.ret.1)
@101 // 573
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
@Main.main.ret.2 // 587
D=A // 588
@CALL // 589
0;JMP // 590
(Main.main.ret.2)
@108 // 591
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
@Main.main.ret.3 // 605
D=A // 606
@CALL // 607
0;JMP // 608
(Main.main.ret.3)
@108 // 609
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
@Main.main.ret.4 // 623
D=A // 624
@CALL // 625
0;JMP // 626
(Main.main.ret.4)
@111 // 627
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
@Main.main.ret.5 // 641
D=A // 642
@CALL // 643
0;JMP // 644
(Main.main.ret.5)
@44 // 645
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
@Main.main.ret.6 // 659
D=A // 660
@CALL // 661
0;JMP // 662
(Main.main.ret.6)
@32 // 663
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
@Main.main.ret.7 // 677
D=A // 678
@CALL // 679
0;JMP // 680
(Main.main.ret.7)
@119 // 681
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
@Main.main.ret.8 // 695
D=A // 696
@CALL // 697
0;JMP // 698
(Main.main.ret.8)
@111 // 699
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
@Main.main.ret.9 // 713
D=A // 714
@CALL // 715
0;JMP // 716
(Main.main.ret.9)
@114 // 717
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
@Main.main.ret.10 // 731
D=A // 732
@CALL // 733
0;JMP // 734
(Main.main.ret.10)
@108 // 735
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
@Main.main.ret.11 // 749
D=A // 750
@CALL // 751
0;JMP // 752
(Main.main.ret.11)
@100 // 753
D=A // 754
@SP // 755
AM=M+1 // 756
A=A-1 // 757
M=D // 758
// call String.appendChar
@7 // 759
D=A // 760
@14 // 761
M=D // 762
@String.appendChar // 763
D=A // 764
@13 // 765
M=D // 766
@Main.main.ret.12 // 767
D=A // 768
@CALL // 769
0;JMP // 770
(Main.main.ret.12)
@33 // 771
D=A // 772
@SP // 773
AM=M+1 // 774
A=A-1 // 775
M=D // 776
// call String.appendChar
@7 // 777
D=A // 778
@14 // 779
M=D // 780
@String.appendChar // 781
D=A // 782
@13 // 783
M=D // 784
@Main.main.ret.13 // 785
D=A // 786
@CALL // 787
0;JMP // 788
(Main.main.ret.13)
@SP // 789
AM=M-1 // 790
D=M // 791
@LCL // 792
A=M // 793
M=D // 794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 795
A=M // 796
D=M // 797
@SP // 798
AM=M+1 // 799
A=A-1 // 800
M=D // 801
// call Output.printString
@6 // 802
D=A // 803
@14 // 804
M=D // 805
@Output.printString // 806
D=A // 807
@13 // 808
M=D // 809
@Main.main.ret.14 // 810
D=A // 811
@CALL // 812
0;JMP // 813
(Main.main.ret.14)
@SP // 814
M=M-1 // 815

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 816
D=A // 817
@14 // 818
M=D // 819
@Output.println // 820
D=A // 821
@13 // 822
M=D // 823
@Main.main.ret.15 // 824
D=A // 825
@CALL // 826
0;JMP // 827
(Main.main.ret.15)
@SP // 828
M=M-1 // 829

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 830
A=M // 831
D=M // 832
@SP // 833
AM=M+1 // 834
A=A-1 // 835
M=D // 836
// call String.dispose
@6 // 837
D=A // 838
@14 // 839
M=D // 840
@String.dispose // 841
D=A // 842
@13 // 843
M=D // 844
@Main.main.ret.16 // 845
D=A // 846
@CALL // 847
0;JMP // 848
(Main.main.ret.16)
@SP // 849
M=M-1 // 850

////PushInstruction("constant 0")
@SP // 851
AM=M+1 // 852
A=A-1 // 853
M=0 // 854

////ReturnInstruction{}
@RETURN // 855
0;JMP // 856

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 857
M=M+1 // 858
AM=M+1 // 859
A=A-1 // 860
M=0 // 861
A=A-1 // 862
M=0 // 863

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 864
A=M // 865
M=1 // 866

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 867
A=M+1 // 868
M=0 // 869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 870
D=A // 871
@SP // 872
AM=M+1 // 873
A=A-1 // 874
M=D // 875
// call Array.new
@6 // 876
D=A // 877
@14 // 878
M=D // 879
@Array.new // 880
D=A // 881
@13 // 882
M=D // 883
@Math.init.ret.0 // 884
D=A // 885
@CALL // 886
0;JMP // 887
(Math.init.ret.0)
@SP // 888
AM=M-1 // 889
D=M // 890
@Math.0 // 891
M=D // 892

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
@Math.init.LT.0 // 893
D=A // 894
@SP // 895
AM=M+1 // 896
A=A-1 // 897
M=D // 898
@LCL // 899
A=M+1 // 900
D=M // 901
@16 // 902
D=D-A // 903
@DO_LT // 904
0;JMP // 905
(Math.init.LT.0)
D=!D // 906
@WHILE_END_Math.init1 // 907
D;JNE // 908

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 909
D=M // 910
@SP // 911
AM=M+1 // 912
A=A-1 // 913
M=D // 914
@LCL // 915
A=M+1 // 916
D=M // 917
@SP // 918
AM=M-1 // 919
D=D+M // 920
@SP // 921
AM=M+1 // 922
A=A-1 // 923
M=D // 924
@LCL // 925
A=M // 926
D=M // 927
@SP // 928
AM=M-1 // 929
A=M // 930
M=D // 931

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

@LCL // 932
A=M // 933
D=M // 934
@LCL // 935
A=M // 936
M=D+M // 937

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

@LCL // 938
A=M+1 // 939
M=M+1 // 940

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 941
0;JMP // 942

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 943
AM=M+1 // 944
A=A-1 // 945
M=0 // 946

////ReturnInstruction{}
@RETURN // 947
0;JMP // 948

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
@ARG // 949
A=M // 950
D=M // 951
@SP // 952
AM=M+1 // 953
A=A-1 // 954
M=D // 955
@Math.0 // 956
D=M // 957
@SP // 958
AM=M+1 // 959
A=A-1 // 960
M=D // 961
@ARG // 962
A=M+1 // 963
D=M // 964
@SP // 965
AM=M-1 // 966
A=D+M // 967
D=M // 968
@SP // 969
AM=M-1 // 970
D=D&M // 971
@SP // 972
AM=M+1 // 973
A=A-1 // 974
M=D // 975

////ReturnInstruction{}
@RETURN // 976
0;JMP // 977

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 978
D=A // 979
@SP // 980
AM=D+M // 981
A=A-1 // 982
M=0 // 983
A=A-1 // 984
M=0 // 985
A=A-1 // 986
M=0 // 987

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
@Math.multiply.EQ.1 // 988
D=A // 989
@SP // 990
AM=M+1 // 991
A=A-1 // 992
M=D // 993
@Math.multiply.EQ.2 // 994
D=A // 995
@SP // 996
AM=M+1 // 997
A=A-1 // 998
M=D // 999
@ARG // 1000
A=M // 1001
D=M // 1002
@DO_EQ // 1003
0;JMP // 1004
(Math.multiply.EQ.2)
@SP // 1005
AM=M+1 // 1006
A=A-1 // 1007
M=D // 1008
@Math.multiply.EQ.3 // 1009
D=A // 1010
@SP // 1011
AM=M+1 // 1012
A=A-1 // 1013
M=D // 1014
@ARG // 1015
A=M+1 // 1016
D=M // 1017
@DO_EQ // 1018
0;JMP // 1019
(Math.multiply.EQ.3)
@SP // 1020
AM=M-1 // 1021
D=D|M // 1022
@DO_EQ // 1023
0;JMP // 1024
(Math.multiply.EQ.1)
@Math.multiply.IfElse1 // 1025
D;JNE // 1026

////PushInstruction("constant 0")
@SP // 1027
AM=M+1 // 1028
A=A-1 // 1029
M=0 // 1030

////ReturnInstruction{}
@RETURN // 1031
0;JMP // 1032

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 1033
0;JMP // 1034

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
@Math.multiply.EQ.4 // 1035
D=A // 1036
@SP // 1037
AM=M+1 // 1038
A=A-1 // 1039
M=D // 1040
@ARG // 1041
A=M // 1042
D=M // 1043
D=D-1 // 1044
@DO_EQ // 1045
0;JMP // 1046
(Math.multiply.EQ.4)
D=!D // 1047
@Math.multiply.IfElse2 // 1048
D;JNE // 1049

////PushInstruction("argument 1")
@ARG // 1050
A=M+1 // 1051
D=M // 1052
@SP // 1053
AM=M+1 // 1054
A=A-1 // 1055
M=D // 1056

////ReturnInstruction{}
@RETURN // 1057
0;JMP // 1058

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 1059
0;JMP // 1060

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
@Math.multiply.EQ.5 // 1061
D=A // 1062
@SP // 1063
AM=M+1 // 1064
A=A-1 // 1065
M=D // 1066
@ARG // 1067
A=M+1 // 1068
D=M // 1069
D=D-1 // 1070
@DO_EQ // 1071
0;JMP // 1072
(Math.multiply.EQ.5)
D=!D // 1073
@Math.multiply.IfElse3 // 1074
D;JNE // 1075

////PushInstruction("argument 0")
@ARG // 1076
A=M // 1077
D=M // 1078
@SP // 1079
AM=M+1 // 1080
A=A-1 // 1081
M=D // 1082

////ReturnInstruction{}
@RETURN // 1083
0;JMP // 1084

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 1085
0;JMP // 1086

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
@Math.multiply.EQ.6 // 1087
D=A // 1088
@SP // 1089
AM=M+1 // 1090
A=A-1 // 1091
M=D // 1092
@ARG // 1093
A=M // 1094
D=M // 1095
@2 // 1096
D=D-A // 1097
@DO_EQ // 1098
0;JMP // 1099
(Math.multiply.EQ.6)
D=!D // 1100
@Math.multiply.IfElse4 // 1101
D;JNE // 1102

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 1103
A=M+1 // 1104
D=M // 1105
D=D+M // 1106
@SP // 1107
AM=M+1 // 1108
A=A-1 // 1109
M=D // 1110

////ReturnInstruction{}
@RETURN // 1111
0;JMP // 1112

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 1113
0;JMP // 1114

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
@Math.multiply.EQ.7 // 1115
D=A // 1116
@SP // 1117
AM=M+1 // 1118
A=A-1 // 1119
M=D // 1120
@ARG // 1121
A=M+1 // 1122
D=M // 1123
@2 // 1124
D=D-A // 1125
@DO_EQ // 1126
0;JMP // 1127
(Math.multiply.EQ.7)
D=!D // 1128
@Math.multiply.IfElse5 // 1129
D;JNE // 1130

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 1131
A=M // 1132
D=M // 1133
D=D+M // 1134
@SP // 1135
AM=M+1 // 1136
A=A-1 // 1137
M=D // 1138

////ReturnInstruction{}
@RETURN // 1139
0;JMP // 1140

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 1141
0;JMP // 1142

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

@LCL // 1143
A=M+1 // 1144
A=A+1 // 1145
M=1 // 1146

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
@Math.multiply.LT.8 // 1147
D=A // 1148
@SP // 1149
AM=M+1 // 1150
A=A-1 // 1151
M=D // 1152
@LCL // 1153
A=M+1 // 1154
D=M // 1155
@16 // 1156
D=D-A // 1157
@DO_LT // 1158
0;JMP // 1159
(Math.multiply.LT.8)
D=!D // 1160
@WHILE_END_Math.multiply1 // 1161
D;JNE // 1162

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
@Math.multiply.EQ.9 // 1163
D=A // 1164
@SP // 1165
AM=M+1 // 1166
A=A-1 // 1167
M=D // 1168
@ARG // 1169
A=M+1 // 1170
D=M // 1171
@SP // 1172
AM=M+1 // 1173
A=A-1 // 1174
M=D // 1175
@LCL // 1176
A=M+1 // 1177
A=A+1 // 1178
D=M // 1179
@SP // 1180
AM=M-1 // 1181
D=D&M // 1182
@DO_EQ // 1183
0;JMP // 1184
(Math.multiply.EQ.9)
@Math.multiply.IfElse6 // 1185
D;JNE // 1186

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

@ARG // 1187
A=M // 1188
D=M // 1189
@LCL // 1190
A=M // 1191
M=D+M // 1192

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 1193
0;JMP // 1194

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

@ARG // 1195
A=M // 1196
D=M // 1197
@ARG // 1198
A=M // 1199
M=D+M // 1200

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

@LCL // 1201
A=M+1 // 1202
M=M+1 // 1203

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

@LCL // 1204
A=M+1 // 1205
A=A+1 // 1206
D=M // 1207
@LCL // 1208
A=M+1 // 1209
A=A+1 // 1210
M=D+M // 1211

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1212
0;JMP // 1213

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1214
A=M // 1215
D=M // 1216
@SP // 1217
AM=M+1 // 1218
A=A-1 // 1219
M=D // 1220

////ReturnInstruction{}
@RETURN // 1221
0;JMP // 1222

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1223
D=A // 1224
@SP // 1225
AM=D+M // 1226
A=A-1 // 1227
M=0 // 1228
A=A-1 // 1229
M=0 // 1230
A=A-1 // 1231
M=0 // 1232

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1233
A=M // 1234
D=M // 1235
@SP // 1236
AM=M+1 // 1237
A=A-1 // 1238
M=D // 1239
// call Math.abs
@6 // 1240
D=A // 1241
@14 // 1242
M=D // 1243
@Math.abs // 1244
D=A // 1245
@13 // 1246
M=D // 1247
@Math.divide.ret.0 // 1248
D=A // 1249
@CALL // 1250
0;JMP // 1251
(Math.divide.ret.0)
@SP // 1252
AM=M-1 // 1253
D=M // 1254
@LCL // 1255
A=M+1 // 1256
M=D // 1257

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1258
A=M+1 // 1259
D=M // 1260
@SP // 1261
AM=M+1 // 1262
A=A-1 // 1263
M=D // 1264
// call Math.abs
@6 // 1265
D=A // 1266
@14 // 1267
M=D // 1268
@Math.abs // 1269
D=A // 1270
@13 // 1271
M=D // 1272
@Math.divide.ret.1 // 1273
D=A // 1274
@CALL // 1275
0;JMP // 1276
(Math.divide.ret.1)
@SP // 1277
AM=M-1 // 1278
D=M // 1279
@LCL // 1280
A=M+1 // 1281
A=A+1 // 1282
M=D // 1283

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
@Math.divide.GT.10 // 1284
D=A // 1285
@SP // 1286
AM=M+1 // 1287
A=A-1 // 1288
M=D // 1289
@LCL // 1290
A=M+1 // 1291
A=A+1 // 1292
D=M // 1293
A=A-1 // 1294
D=D-M // 1295
@DO_GT // 1296
0;JMP // 1297
(Math.divide.GT.10)
D=!D // 1298
@Math.divide.IfElse1 // 1299
D;JNE // 1300

////PushInstruction("constant 0")
@SP // 1301
AM=M+1 // 1302
A=A-1 // 1303
M=0 // 1304

////ReturnInstruction{}
@RETURN // 1305
0;JMP // 1306

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 1307
0;JMP // 1308

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

@LCL // 1309
A=M+1 // 1310
D=M // 1311
@SP // 1312
AM=M+1 // 1313
A=A-1 // 1314
M=D // 1315
@LCL // 1316
A=M+1 // 1317
A=A+1 // 1318
D=M // 1319
D=D+M // 1320
@SP // 1321
AM=M+1 // 1322
A=A-1 // 1323
M=D // 1324
// call Math.divide
@7 // 1325
D=A // 1326
@14 // 1327
M=D // 1328
@Math.divide // 1329
D=A // 1330
@13 // 1331
M=D // 1332
@Math.divide.ret.2 // 1333
D=A // 1334
@CALL // 1335
0;JMP // 1336
(Math.divide.ret.2)
@SP // 1337
AM=M-1 // 1338
D=M // 1339
@LCL // 1340
A=M // 1341
M=D // 1342

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//), PushInstruction("local 2")], call=CallInstruction{Math.multiply}},
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
@Math.divide.LT.11 // 1343
D=A // 1344
@SP // 1345
AM=M+1 // 1346
A=A-1 // 1347
M=D // 1348
@LCL // 1349
A=M+1 // 1350
D=M // 1351
@SP // 1352
AM=M+1 // 1353
A=A-1 // 1354
M=D // 1355
@LCL // 1356
A=M // 1357
D=M // 1358
D=D+M // 1359
@SP // 1360
AM=M+1 // 1361
A=A-1 // 1362
M=D // 1363
@LCL // 1364
A=M+1 // 1365
A=A+1 // 1366
D=M // 1367
@SP // 1368
AM=M+1 // 1369
A=A-1 // 1370
M=D // 1371
// call Math.multiply
@7 // 1372
D=A // 1373
@14 // 1374
M=D // 1375
@Math.multiply // 1376
D=A // 1377
@13 // 1378
M=D // 1379
@Math.divide.ret.3 // 1380
D=A // 1381
@CALL // 1382
0;JMP // 1383
(Math.divide.ret.3)
@SP // 1384
AM=M-1 // 1385
D=M // 1386
@SP // 1387
AM=M-1 // 1388
D=M-D // 1389
@SP // 1390
AM=M+1 // 1391
A=A-1 // 1392
M=D // 1393
@LCL // 1394
A=M+1 // 1395
A=A+1 // 1396
D=M // 1397
@SP // 1398
AM=M-1 // 1399
D=M-D // 1400
@DO_LT // 1401
0;JMP // 1402
(Math.divide.LT.11)
D=!D // 1403
@Math.divide.IfElse2 // 1404
D;JNE // 1405

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
@Math.divide.EQ.12 // 1406
D=A // 1407
@SP // 1408
AM=M+1 // 1409
A=A-1 // 1410
M=D // 1411
@Math.divide.GT.13 // 1412
D=A // 1413
@SP // 1414
AM=M+1 // 1415
A=A-1 // 1416
M=D // 1417
@Math.divide.LT.14 // 1418
D=A // 1419
@SP // 1420
AM=M+1 // 1421
A=A-1 // 1422
M=D // 1423
@ARG // 1424
A=M // 1425
D=M // 1426
@DO_LT // 1427
0;JMP // 1428
(Math.divide.LT.14)
@SP // 1429
AM=M+1 // 1430
A=A-1 // 1431
M=D // 1432
@ARG // 1433
A=M+1 // 1434
D=M // 1435
@SP // 1436
AM=M-1 // 1437
D=D&M // 1438
@DO_GT // 1439
0;JMP // 1440
(Math.divide.GT.13)
@SP // 1441
AM=M+1 // 1442
A=A-1 // 1443
M=D // 1444
@Math.divide.LT.15 // 1445
D=A // 1446
@SP // 1447
AM=M+1 // 1448
A=A-1 // 1449
M=D // 1450
@Math.divide.GT.16 // 1451
D=A // 1452
@SP // 1453
AM=M+1 // 1454
A=A-1 // 1455
M=D // 1456
@ARG // 1457
A=M // 1458
D=M // 1459
@DO_GT // 1460
0;JMP // 1461
(Math.divide.GT.16)
@SP // 1462
AM=M+1 // 1463
A=A-1 // 1464
M=D // 1465
@ARG // 1466
A=M+1 // 1467
D=M // 1468
@SP // 1469
AM=M-1 // 1470
D=D&M // 1471
@DO_LT // 1472
0;JMP // 1473
(Math.divide.LT.15)
@SP // 1474
AM=M-1 // 1475
D=D|M // 1476
@DO_EQ // 1477
0;JMP // 1478
(Math.divide.EQ.12)
@Math.divide.IfElse3 // 1479
D;JNE // 1480

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1481
A=M // 1482
D=-M // 1483
@LCL // 1484
A=M // 1485
M=D // 1486

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 1487
0;JMP // 1488

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
@LCL // 1489
A=M // 1490
D=M // 1491
D=D+M // 1492
@SP // 1493
AM=M+1 // 1494
A=A-1 // 1495
M=D // 1496

////ReturnInstruction{}
@RETURN // 1497
0;JMP // 1498

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1499
0;JMP // 1500

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
@Math.divide.EQ.17 // 1501
D=A // 1502
@SP // 1503
AM=M+1 // 1504
A=A-1 // 1505
M=D // 1506
@Math.divide.GT.18 // 1507
D=A // 1508
@SP // 1509
AM=M+1 // 1510
A=A-1 // 1511
M=D // 1512
@Math.divide.LT.19 // 1513
D=A // 1514
@SP // 1515
AM=M+1 // 1516
A=A-1 // 1517
M=D // 1518
@ARG // 1519
A=M // 1520
D=M // 1521
@DO_LT // 1522
0;JMP // 1523
(Math.divide.LT.19)
@SP // 1524
AM=M+1 // 1525
A=A-1 // 1526
M=D // 1527
@ARG // 1528
A=M+1 // 1529
D=M // 1530
@SP // 1531
AM=M-1 // 1532
D=D&M // 1533
@DO_GT // 1534
0;JMP // 1535
(Math.divide.GT.18)
@SP // 1536
AM=M+1 // 1537
A=A-1 // 1538
M=D // 1539
@Math.divide.LT.20 // 1540
D=A // 1541
@SP // 1542
AM=M+1 // 1543
A=A-1 // 1544
M=D // 1545
@Math.divide.GT.21 // 1546
D=A // 1547
@SP // 1548
AM=M+1 // 1549
A=A-1 // 1550
M=D // 1551
@ARG // 1552
A=M // 1553
D=M // 1554
@DO_GT // 1555
0;JMP // 1556
(Math.divide.GT.21)
@SP // 1557
AM=M+1 // 1558
A=A-1 // 1559
M=D // 1560
@ARG // 1561
A=M+1 // 1562
D=M // 1563
@SP // 1564
AM=M-1 // 1565
D=D&M // 1566
@DO_LT // 1567
0;JMP // 1568
(Math.divide.LT.20)
@SP // 1569
AM=M-1 // 1570
D=D|M // 1571
@DO_EQ // 1572
0;JMP // 1573
(Math.divide.EQ.17)
@Math.divide.IfElse4 // 1574
D;JNE // 1575

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1576
A=M // 1577
D=-M // 1578
@LCL // 1579
A=M // 1580
M=D // 1581

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 1582
0;JMP // 1583

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
@LCL // 1584
A=M // 1585
D=M // 1586
D=D+M // 1587
D=D+1 // 1588
@SP // 1589
AM=M+1 // 1590
A=A-1 // 1591
M=D // 1592

////ReturnInstruction{}
@RETURN // 1593
0;JMP // 1594

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
@ARG // 1595
A=M // 1596
D=M // 1597
@SP // 1598
AM=M+1 // 1599
A=A-1 // 1600
M=D // 1601
@ARG // 1602
A=M // 1603
D=M // 1604
@SP // 1605
AM=M+1 // 1606
A=A-1 // 1607
M=D // 1608
@ARG // 1609
A=M+1 // 1610
D=M // 1611
@SP // 1612
AM=M+1 // 1613
A=A-1 // 1614
M=D // 1615
// call Math.divide
@7 // 1616
D=A // 1617
@14 // 1618
M=D // 1619
@Math.divide // 1620
D=A // 1621
@13 // 1622
M=D // 1623
@Math.mod.ret.0 // 1624
D=A // 1625
@CALL // 1626
0;JMP // 1627
(Math.mod.ret.0)
@ARG // 1628
A=M+1 // 1629
D=M // 1630
@SP // 1631
AM=M+1 // 1632
A=A-1 // 1633
M=D // 1634
// call Math.multiply
@7 // 1635
D=A // 1636
@14 // 1637
M=D // 1638
@Math.multiply // 1639
D=A // 1640
@13 // 1641
M=D // 1642
@Math.mod.ret.1 // 1643
D=A // 1644
@CALL // 1645
0;JMP // 1646
(Math.mod.ret.1)
@SP // 1647
AM=M-1 // 1648
D=M // 1649
@SP // 1650
AM=M-1 // 1651
D=M-D // 1652
@SP // 1653
AM=M+1 // 1654
A=A-1 // 1655
M=D // 1656

////ReturnInstruction{}
@RETURN // 1657
0;JMP // 1658

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
@Math.0 // 1659
D=M // 1660
@SP // 1661
AM=M+1 // 1662
A=A-1 // 1663
M=D // 1664
@ARG // 1665
A=M // 1666
D=M // 1667
@SP // 1668
AM=M-1 // 1669
A=D+M // 1670
D=M // 1671
@SP // 1672
AM=M+1 // 1673
A=A-1 // 1674
M=D // 1675

////ReturnInstruction{}
@RETURN // 1676
0;JMP // 1677

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1678
D=A // 1679
@SP // 1680
AM=D+M // 1681
A=A-1 // 1682
M=0 // 1683
A=A-1 // 1684
M=0 // 1685
A=A-1 // 1686
M=0 // 1687
A=A-1 // 1688
M=0 // 1689

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1690
A=M // 1691
M=0 // 1692

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1693
D=A // 1694
@LCL // 1695
A=M+1 // 1696
M=D // 1697

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
@Math.sqrt.EQ.22 // 1698
D=A // 1699
@SP // 1700
AM=M+1 // 1701
A=A-1 // 1702
M=D // 1703
@Math.sqrt.LT.23 // 1704
D=A // 1705
@SP // 1706
AM=M+1 // 1707
A=A-1 // 1708
M=D // 1709
@LCL // 1710
A=M+1 // 1711
D=M // 1712
@DO_LT // 1713
0;JMP // 1714
(Math.sqrt.LT.23)
D=!D // 1715
@DO_EQ // 1716
0;JMP // 1717
(Math.sqrt.EQ.22)
@WHILE_END_Math.sqrt1 // 1718
D;JNE // 1719

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

@LCL // 1720
A=M // 1721
D=M // 1722
@SP // 1723
AM=M+1 // 1724
A=A-1 // 1725
M=D // 1726
@Math.0 // 1727
D=M // 1728
@SP // 1729
AM=M+1 // 1730
A=A-1 // 1731
M=D // 1732
@LCL // 1733
A=M+1 // 1734
D=M // 1735
@SP // 1736
AM=M-1 // 1737
A=D+M // 1738
D=M // 1739
@SP // 1740
AM=M-1 // 1741
D=D+M // 1742
@LCL // 1743
A=M+1 // 1744
A=A+1 // 1745
M=D // 1746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1747
D=A // 1748
@SP // 1749
M=D+M // 1750
@LCL // 1751
A=M+1 // 1752
A=A+1 // 1753
D=M // 1754
@SP // 1755
A=M-1 // 1756
M=D // 1757
A=A-1 // 1758
M=D // 1759
// call Math.multiply
@7 // 1760
D=A // 1761
@14 // 1762
M=D // 1763
@Math.multiply // 1764
D=A // 1765
@13 // 1766
M=D // 1767
@Math.sqrt.ret.0 // 1768
D=A // 1769
@CALL // 1770
0;JMP // 1771
(Math.sqrt.ret.0)
@SP // 1772
AM=M-1 // 1773
D=M // 1774
@LCL // 1775
A=M+1 // 1776
A=A+1 // 1777
A=A+1 // 1778
M=D // 1779

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
@Math.sqrt.EQ.24 // 1780
D=A // 1781
@SP // 1782
AM=M+1 // 1783
A=A-1 // 1784
M=D // 1785
@Math.sqrt.GT.25 // 1786
D=A // 1787
@SP // 1788
AM=M+1 // 1789
A=A-1 // 1790
M=D // 1791
@LCL // 1792
A=M+1 // 1793
A=A+1 // 1794
A=A+1 // 1795
D=M // 1796
@SP // 1797
AM=M+1 // 1798
A=A-1 // 1799
M=D // 1800
@ARG // 1801
A=M // 1802
D=M // 1803
@SP // 1804
AM=M-1 // 1805
D=M-D // 1806
@DO_GT // 1807
0;JMP // 1808
(Math.sqrt.GT.25)
@SP // 1809
AM=M+1 // 1810
A=A-1 // 1811
M=D // 1812
@SP // 1813
A=M-1 // 1814
M=!D // 1815
@Math.sqrt.GT.26 // 1816
D=A // 1817
@SP // 1818
AM=M+1 // 1819
A=A-1 // 1820
M=D // 1821
@LCL // 1822
A=M+1 // 1823
A=A+1 // 1824
A=A+1 // 1825
D=M // 1826
@DO_GT // 1827
0;JMP // 1828
(Math.sqrt.GT.26)
@SP // 1829
AM=M-1 // 1830
D=D&M // 1831
@DO_EQ // 1832
0;JMP // 1833
(Math.sqrt.EQ.24)
@Math.sqrt.IfElse1 // 1834
D;JNE // 1835

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1836
A=M+1 // 1837
A=A+1 // 1838
D=M // 1839
@LCL // 1840
A=M // 1841
M=D // 1842

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 1843
0;JMP // 1844

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

@LCL // 1845
A=M+1 // 1846
M=M-1 // 1847

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1848
0;JMP // 1849

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1850
A=M // 1851
D=M // 1852
@SP // 1853
AM=M+1 // 1854
A=A-1 // 1855
M=D // 1856

////ReturnInstruction{}
@RETURN // 1857
0;JMP // 1858

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.max.GT.27 // 1859
D=A // 1860
@SP // 1861
AM=M+1 // 1862
A=A-1 // 1863
M=D // 1864
@ARG // 1865
A=M+1 // 1866
D=M // 1867
A=A-1 // 1868
D=M-D // 1869
@DO_GT // 1870
0;JMP // 1871
(Math.max.GT.27)
D=!D // 1872
@Math.max.IfElse1 // 1873
D;JNE // 1874

////PushInstruction("argument 0")
@ARG // 1875
A=M // 1876
D=M // 1877
@SP // 1878
AM=M+1 // 1879
A=A-1 // 1880
M=D // 1881

////ReturnInstruction{}
@RETURN // 1882
0;JMP // 1883

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 1884
0;JMP // 1885

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1886
A=M+1 // 1887
D=M // 1888
@SP // 1889
AM=M+1 // 1890
A=A-1 // 1891
M=D // 1892

////ReturnInstruction{}
@RETURN // 1893
0;JMP // 1894

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
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
@Math.min.LT.28 // 1895
D=A // 1896
@SP // 1897
AM=M+1 // 1898
A=A-1 // 1899
M=D // 1900
@ARG // 1901
A=M+1 // 1902
D=M // 1903
A=A-1 // 1904
D=M-D // 1905
@DO_LT // 1906
0;JMP // 1907
(Math.min.LT.28)
D=!D // 1908
@Math.min.IfElse1 // 1909
D;JNE // 1910

////PushInstruction("argument 0")
@ARG // 1911
A=M // 1912
D=M // 1913
@SP // 1914
AM=M+1 // 1915
A=A-1 // 1916
M=D // 1917

////ReturnInstruction{}
@RETURN // 1918
0;JMP // 1919

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 1920
0;JMP // 1921

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1922
A=M+1 // 1923
D=M // 1924
@SP // 1925
AM=M+1 // 1926
A=A-1 // 1927
M=D // 1928

////ReturnInstruction{}
@RETURN // 1929
0;JMP // 1930

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1931
A=M // 1932
D=M // 1933
@SP // 1934
AM=M+1 // 1935
A=A-1 // 1936
M=D // 1937
@ARG // 1938
A=M // 1939
D=M // 1940
@SP // 1941
AM=M+1 // 1942
A=A-1 // 1943
M=D // 1944
@SP // 1945
A=M-1 // 1946
M=-D // 1947
// call Math.max
@7 // 1948
D=A // 1949
@14 // 1950
M=D // 1951
@Math.max // 1952
D=A // 1953
@13 // 1954
M=D // 1955
@Math.abs.ret.0 // 1956
D=A // 1957
@CALL // 1958
0;JMP // 1959
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 1960
0;JMP // 1961

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 1962
M=M+1 // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=0 // 1966
A=A-1 // 1967
M=0 // 1968

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

@2055 // 1969
D=A // 1970
@LCL // 1971
A=M // 1972
M=D // 1973

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
@LCL // 1974
A=M // 1975
D=M // 1976
@SP // 1977
AM=M+1 // 1978
A=A-1 // 1979
M=D // 1980
@LCL // 1981
A=M // 1982
D=M // 1983
@16384 // 1984
D=A-D // 1985
@5 // 1986
D=D-A // 1987
@SP // 1988
AM=M-1 // 1989
A=M // 1990
M=D // 1991

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1992
A=M // 1993
D=M // 1994
@SP // 1995
AM=M+1 // 1996
A=A-1 // 1997
M=D+1 // 1998
D=1 // 1999
@SP // 2000
AM=M-1 // 2001
A=M // 2002
M=D // 2003

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2004
A=M // 2005
D=M // 2006
@2 // 2007
D=D+A // 2008
@SP // 2009
AM=M+1 // 2010
A=A-1 // 2011
M=D // 2012
D=0 // 2013
@SP // 2014
AM=M-1 // 2015
A=M // 2016
M=D // 2017

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2018
A=M // 2019
D=M // 2020
@3 // 2021
D=D+A // 2022
@SP // 2023
AM=M+1 // 2024
A=A-1 // 2025
M=D // 2026
D=0 // 2027
@SP // 2028
AM=M-1 // 2029
A=M // 2030
M=D // 2031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2032
A=M // 2033
D=M // 2034
@SP // 2035
AM=M+1 // 2036
A=A-1 // 2037
M=D // 2038
// call Memory.create_foot
@6 // 2039
D=A // 2040
@14 // 2041
M=D // 2042
@Memory.create_foot // 2043
D=A // 2044
@13 // 2045
M=D // 2046
@Memory.init.ret.0 // 2047
D=A // 2048
@CALL // 2049
0;JMP // 2050
(Memory.init.ret.0)
@SP // 2051
M=M-1 // 2052

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

@2054 // 2053
D=A // 2054
@SP // 2055
AM=M+1 // 2056
A=A-1 // 2057
M=D // 2058
@2054 // 2059
D=A // 2060
@SP // 2061
AM=M+1 // 2062
A=A-1 // 2063
M=D // 2064
@LCL // 2065
A=M // 2066
D=M // 2067
@SP // 2068
AM=M+1 // 2069
A=A-1 // 2070
M=D // 2071
// call Memory.add_node
@7 // 2072
D=A // 2073
@14 // 2074
M=D // 2075
@Memory.add_node // 2076
D=A // 2077
@13 // 2078
M=D // 2079
@Memory.init.ret.1 // 2080
D=A // 2081
@CALL // 2082
0;JMP // 2083
(Memory.init.ret.1)
@SP // 2084
M=M-1 // 2085

////PushInstruction("constant 0")
@SP // 2086
AM=M+1 // 2087
A=A-1 // 2088
M=0 // 2089

////ReturnInstruction{}
@RETURN // 2090
0;JMP // 2091

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 2092
D=A // 2093
@SP // 2094
AM=D+M // 2095
A=A-1 // 2096
M=0 // 2097
A=A-1 // 2098
M=0 // 2099
A=A-1 // 2100
M=0 // 2101
A=A-1 // 2102
M=0 // 2103
A=A-1 // 2104
M=0 // 2105

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2106
A=M // 2107
D=M // 2108
@SP // 2109
AM=M+1 // 2110
A=A-1 // 2111
M=D // 2112
// call Memory.getBinIndex
@6 // 2113
D=A // 2114
@14 // 2115
M=D // 2116
@Memory.getBinIndex // 2117
D=A // 2118
@13 // 2119
M=D // 2120
@Memory.alloc.ret.0 // 2121
D=A // 2122
@CALL // 2123
0;JMP // 2124
(Memory.alloc.ret.0)
@SP // 2125
AM=M-1 // 2126
D=M // 2127
@LCL // 2128
A=M // 2129
M=D // 2130

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

@LCL // 2131
A=M // 2132
D=M // 2133
@2048 // 2134
D=D+A // 2135
@LCL // 2136
A=M+1 // 2137
M=D // 2138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2139
A=M+1 // 2140
D=M // 2141
@SP // 2142
AM=M+1 // 2143
A=A-1 // 2144
M=D // 2145
@ARG // 2146
A=M // 2147
D=M // 2148
@SP // 2149
AM=M+1 // 2150
A=A-1 // 2151
M=D // 2152
// call Memory.get_best_fit
@7 // 2153
D=A // 2154
@14 // 2155
M=D // 2156
@Memory.get_best_fit // 2157
D=A // 2158
@13 // 2159
M=D // 2160
@Memory.alloc.ret.1 // 2161
D=A // 2162
@CALL // 2163
0;JMP // 2164
(Memory.alloc.ret.1)
@SP // 2165
AM=M-1 // 2166
D=M // 2167
@LCL // 2168
A=M+1 // 2169
A=A+1 // 2170
M=D // 2171

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
@Memory.alloc.EQ.0 // 2172
D=A // 2173
@SP // 2174
AM=M+1 // 2175
A=A-1 // 2176
M=D // 2177
@LCL // 2178
A=M+1 // 2179
A=A+1 // 2180
D=M // 2181
@DO_EQ // 2182
0;JMP // 2183
(Memory.alloc.EQ.0)
@WHILE_END_Memory.alloc1 // 2184
D;JEQ // 2185

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
@Memory.alloc.EQ.1 // 2186
D=A // 2187
@SP // 2188
AM=M+1 // 2189
A=A-1 // 2190
M=D // 2191
@Memory.alloc.LT.2 // 2192
D=A // 2193
@SP // 2194
AM=M+1 // 2195
A=A-1 // 2196
M=D // 2197
@LCL // 2198
A=M // 2199
D=M // 2200
D=D+1 // 2201
@7 // 2202
D=D-A // 2203
@DO_LT // 2204
0;JMP // 2205
(Memory.alloc.LT.2)
D=!D // 2206
@DO_EQ // 2207
0;JMP // 2208
(Memory.alloc.EQ.1)
@Memory.alloc.IfElse1 // 2209
D;JNE // 2210

////PushInstruction("constant 0")
@SP // 2211
AM=M+1 // 2212
A=A-1 // 2213
M=0 // 2214

////ReturnInstruction{}
@RETURN // 2215
0;JMP // 2216

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 2217
0;JMP // 2218

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

@LCL // 2219
A=M // 2220
M=M+1 // 2221

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

@LCL // 2222
A=M // 2223
D=M // 2224
@2048 // 2225
D=D+A // 2226
@LCL // 2227
A=M+1 // 2228
M=D // 2229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2230
A=M+1 // 2231
D=M // 2232
@SP // 2233
AM=M+1 // 2234
A=A-1 // 2235
M=D // 2236
@ARG // 2237
A=M // 2238
D=M // 2239
@SP // 2240
AM=M+1 // 2241
A=A-1 // 2242
M=D // 2243
// call Memory.get_best_fit
@7 // 2244
D=A // 2245
@14 // 2246
M=D // 2247
@Memory.get_best_fit // 2248
D=A // 2249
@13 // 2250
M=D // 2251
@Memory.alloc.ret.2 // 2252
D=A // 2253
@CALL // 2254
0;JMP // 2255
(Memory.alloc.ret.2)
@SP // 2256
AM=M-1 // 2257
D=M // 2258
@LCL // 2259
A=M+1 // 2260
A=A+1 // 2261
M=D // 2262

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 2263
0;JMP // 2264

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

@LCL // 2265
A=M+1 // 2266
A=A+1 // 2267
D=M // 2268
@0 // 2269
A=D+A // 2270
D=M // 2271
@SP // 2272
AM=M+1 // 2273
A=A-1 // 2274
M=D // 2275
// call Memory.getBinIndex
@6 // 2276
D=A // 2277
@14 // 2278
M=D // 2279
@Memory.getBinIndex // 2280
D=A // 2281
@13 // 2282
M=D // 2283
@Memory.alloc.ret.3 // 2284
D=A // 2285
@CALL // 2286
0;JMP // 2287
(Memory.alloc.ret.3)
@SP // 2288
AM=M-1 // 2289
D=M // 2290
@2048 // 2291
D=D+A // 2292
@SP // 2293
AM=M+1 // 2294
A=A-1 // 2295
M=D // 2296
@LCL // 2297
A=M+1 // 2298
A=A+1 // 2299
D=M // 2300
@SP // 2301
AM=M+1 // 2302
A=A-1 // 2303
M=D // 2304
// call Memory.remove_node
@7 // 2305
D=A // 2306
@14 // 2307
M=D // 2308
@Memory.remove_node // 2309
D=A // 2310
@13 // 2311
M=D // 2312
@Memory.alloc.ret.4 // 2313
D=A // 2314
@CALL // 2315
0;JMP // 2316
(Memory.alloc.ret.4)
@SP // 2317
M=M-1 // 2318

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

@LCL // 2319
A=M+1 // 2320
A=A+1 // 2321
D=M // 2322
@0 // 2323
A=D+A // 2324
D=M // 2325
@SP // 2326
AM=M+1 // 2327
A=A-1 // 2328
M=D // 2329
@ARG // 2330
A=M // 2331
D=M // 2332
@SP // 2333
AM=M-1 // 2334
D=M-D // 2335
@LCL // 2336
A=M+1 // 2337
A=A+1 // 2338
A=A+1 // 2339
M=D // 2340

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
@Memory.alloc.GT.3 // 2341
D=A // 2342
@SP // 2343
AM=M+1 // 2344
A=A-1 // 2345
M=D // 2346
@LCL // 2347
A=M+1 // 2348
A=A+1 // 2349
A=A+1 // 2350
D=M // 2351
@5 // 2352
D=D-A // 2353
@DO_GT // 2354
0;JMP // 2355
(Memory.alloc.GT.3)
D=!D // 2356
@Memory.alloc.IfElse2 // 2357
D;JNE // 2358

////PushWriter{source=PushInstruction("argument 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2359
A=M+1 // 2360
A=A+1 // 2361
D=M // 2362
@SP // 2363
AM=M+1 // 2364
A=A-1 // 2365
M=D // 2366
@ARG // 2367
A=M // 2368
D=M // 2369
@SP // 2370
AM=M-1 // 2371
A=M // 2372
M=D // 2373

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2374
A=M+1 // 2375
A=A+1 // 2376
D=M // 2377
@SP // 2378
AM=M+1 // 2379
A=A-1 // 2380
M=D+1 // 2381
D=0 // 2382
@SP // 2383
AM=M-1 // 2384
A=M // 2385
M=D // 2386

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2387
A=M+1 // 2388
A=A+1 // 2389
D=M // 2390
@SP // 2391
AM=M+1 // 2392
A=A-1 // 2393
M=D // 2394
// call Memory.create_foot
@6 // 2395
D=A // 2396
@14 // 2397
M=D // 2398
@Memory.create_foot // 2399
D=A // 2400
@13 // 2401
M=D // 2402
@Memory.alloc.ret.5 // 2403
D=A // 2404
@CALL // 2405
0;JMP // 2406
(Memory.alloc.ret.5)
@SP // 2407
M=M-1 // 2408

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

@LCL // 2409
A=M+1 // 2410
A=A+1 // 2411
D=M // 2412
@SP // 2413
AM=M+1 // 2414
A=A-1 // 2415
M=D // 2416
@ARG // 2417
A=M // 2418
D=M // 2419
@SP // 2420
AM=M-1 // 2421
D=D+M // 2422
@5 // 2423
D=D+A // 2424
@SP // 2425
AM=M+1 // 2426
A=A-1 // 2427
M=D // 2428
@LCL // 2429
D=M // 2430
@4 // 2431
A=D+A // 2432
D=A // 2433
@R13 // 2434
M=D // 2435
@SP // 2436
AM=M-1 // 2437
D=M // 2438
@R13 // 2439
A=M // 2440
M=D // 2441

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
@LCL // 2442
D=M // 2443
@4 // 2444
A=D+A // 2445
D=M // 2446
@SP // 2447
AM=M+1 // 2448
A=A-1 // 2449
M=D // 2450
@LCL // 2451
A=M+1 // 2452
A=A+1 // 2453
A=A+1 // 2454
D=M // 2455
@5 // 2456
D=D-A // 2457
@SP // 2458
AM=M-1 // 2459
A=M // 2460
M=D // 2461

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2462
D=M // 2463
@4 // 2464
A=D+A // 2465
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

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2476
D=M // 2477
@4 // 2478
A=D+A // 2479
D=M // 2480
@SP // 2481
AM=M+1 // 2482
A=A-1 // 2483
M=D // 2484
// call Memory.create_foot
@6 // 2485
D=A // 2486
@14 // 2487
M=D // 2488
@Memory.create_foot // 2489
D=A // 2490
@13 // 2491
M=D // 2492
@Memory.alloc.ret.6 // 2493
D=A // 2494
@CALL // 2495
0;JMP // 2496
(Memory.alloc.ret.6)
@SP // 2497
M=M-1 // 2498

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

@LCL // 2499
A=M+1 // 2500
A=A+1 // 2501
A=A+1 // 2502
D=M // 2503
@SP // 2504
AM=M+1 // 2505
A=A-1 // 2506
M=D // 2507
// call Memory.getBinIndex
@6 // 2508
D=A // 2509
@14 // 2510
M=D // 2511
@Memory.getBinIndex // 2512
D=A // 2513
@13 // 2514
M=D // 2515
@Memory.alloc.ret.7 // 2516
D=A // 2517
@CALL // 2518
0;JMP // 2519
(Memory.alloc.ret.7)
@SP // 2520
AM=M-1 // 2521
D=M // 2522
@2048 // 2523
D=D+A // 2524
@SP // 2525
AM=M+1 // 2526
A=A-1 // 2527
M=D // 2528
@LCL // 2529
D=M // 2530
@4 // 2531
A=D+A // 2532
D=M // 2533
@SP // 2534
AM=M+1 // 2535
A=A-1 // 2536
M=D // 2537
// call Memory.add_node
@7 // 2538
D=A // 2539
@14 // 2540
M=D // 2541
@Memory.add_node // 2542
D=A // 2543
@13 // 2544
M=D // 2545
@Memory.alloc.ret.8 // 2546
D=A // 2547
@CALL // 2548
0;JMP // 2549
(Memory.alloc.ret.8)
@SP // 2550
M=M-1 // 2551

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 2552
0;JMP // 2553

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
@LCL // 2554
A=M+1 // 2555
A=A+1 // 2556
D=M // 2557
@SP // 2558
AM=M+1 // 2559
A=A-1 // 2560
M=D+1 // 2561
D=0 // 2562
@SP // 2563
AM=M-1 // 2564
A=M // 2565
M=D // 2566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2567
A=M+1 // 2568
A=A+1 // 2569
D=M // 2570
@SP // 2571
AM=M+1 // 2572
A=A-1 // 2573
M=D // 2574
// call Memory.create_foot
@6 // 2575
D=A // 2576
@14 // 2577
M=D // 2578
@Memory.create_foot // 2579
D=A // 2580
@13 // 2581
M=D // 2582
@Memory.alloc.ret.9 // 2583
D=A // 2584
@CALL // 2585
0;JMP // 2586
(Memory.alloc.ret.9)
@SP // 2587
M=M-1 // 2588

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
@LCL // 2589
A=M+1 // 2590
A=A+1 // 2591
D=M // 2592
@4 // 2593
D=D+A // 2594
@SP // 2595
AM=M+1 // 2596
A=A-1 // 2597
M=D // 2598

////ReturnInstruction{}
@RETURN // 2599
0;JMP // 2600

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 2601
AM=M+1 // 2602
A=A-1 // 2603
M=0 // 2604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 2605
A=M // 2606
D=M // 2607
@SP // 2608
AM=M+1 // 2609
A=A-1 // 2610
M=D // 2611
// call Memory.alloc
@6 // 2612
D=A // 2613
@14 // 2614
M=D // 2615
@Memory.alloc // 2616
D=A // 2617
@13 // 2618
M=D // 2619
@Memory.calloc.ret.0 // 2620
D=A // 2621
@CALL // 2622
0;JMP // 2623
(Memory.calloc.ret.0)
@SP // 2624
AM=M-1 // 2625
D=M // 2626
@LCL // 2627
A=M // 2628
M=D // 2629

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("local 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.calloc.IfElse1}}
@Memory.calloc.EQ.4 // 2630
D=A // 2631
@SP // 2632
AM=M+1 // 2633
A=A-1 // 2634
M=D // 2635
@LCL // 2636
A=M // 2637
D=!M // 2638
@DO_EQ // 2639
0;JMP // 2640
(Memory.calloc.EQ.4)
@Memory.calloc.IfElse1 // 2641
D;JNE // 2642

////PushInstruction("constant 0")
@SP // 2643
AM=M+1 // 2644
A=A-1 // 2645
M=0 // 2646

////ReturnInstruction{}
@RETURN // 2647
0;JMP // 2648

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 2649
0;JMP // 2650

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
@Memory.calloc.GT.5 // 2651
D=A // 2652
@SP // 2653
AM=M+1 // 2654
A=A-1 // 2655
M=D // 2656
@ARG // 2657
A=M // 2658
D=M // 2659
@DO_GT // 2660
0;JMP // 2661
(Memory.calloc.GT.5)
D=!D // 2662
@WHILE_END_Memory.calloc1 // 2663
D;JNE // 2664

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

@ARG // 2665
A=M // 2666
M=M-1 // 2667

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2668
A=M // 2669
D=M // 2670
@SP // 2671
AM=M+1 // 2672
A=A-1 // 2673
M=D // 2674
@ARG // 2675
A=M // 2676
D=M // 2677
@SP // 2678
AM=M-1 // 2679
D=D+M // 2680
@SP // 2681
AM=M+1 // 2682
A=A-1 // 2683
M=D // 2684
D=0 // 2685
@SP // 2686
AM=M-1 // 2687
A=M // 2688
M=D // 2689

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 2690
0;JMP // 2691

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 2692
A=M // 2693
D=M // 2694
@SP // 2695
AM=M+1 // 2696
A=A-1 // 2697
M=D // 2698

////ReturnInstruction{}
@RETURN // 2699
0;JMP // 2700

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 2701
D=A // 2702
@SP // 2703
AM=D+M // 2704
A=A-1 // 2705
M=0 // 2706
A=A-1 // 2707
M=0 // 2708
A=A-1 // 2709
M=0 // 2710

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

@ARG // 2711
A=M // 2712
D=M // 2713
@4 // 2714
D=D-A // 2715
@LCL // 2716
A=M // 2717
M=D // 2718

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2719
A=M // 2720
D=M // 2721
@SP // 2722
AM=M+1 // 2723
A=A-1 // 2724
M=D+1 // 2725
D=1 // 2726
@SP // 2727
AM=M-1 // 2728
A=M // 2729
M=D // 2730

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

@LCL // 2731
A=M // 2732
D=M // 2733
@2 // 2734
A=D+A // 2735
D=M // 2736
@LCL // 2737
A=M+1 // 2738
M=D // 2739

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

@LCL // 2740
A=M // 2741
D=M // 2742
@3 // 2743
A=D+A // 2744
D=M // 2745
@LCL // 2746
A=M+1 // 2747
A=A+1 // 2748
M=D // 2749

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
@Memory.deAlloc.EQ.6 // 2750
D=A // 2751
@SP // 2752
AM=M+1 // 2753
A=A-1 // 2754
M=D // 2755
@Memory.deAlloc.EQ.7 // 2756
D=A // 2757
@SP // 2758
AM=M+1 // 2759
A=A-1 // 2760
M=D // 2761
@LCL // 2762
A=M+1 // 2763
D=M // 2764
@DO_EQ // 2765
0;JMP // 2766
(Memory.deAlloc.EQ.7)
D=!D // 2767
@DO_EQ // 2768
0;JMP // 2769
(Memory.deAlloc.EQ.6)
@Memory.deAlloc.IfElse1 // 2770
D;JNE // 2771

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
@Memory.deAlloc.EQ.8 // 2772
D=A // 2773
@SP // 2774
AM=M+1 // 2775
A=A-1 // 2776
M=D // 2777
@LCL // 2778
A=M+1 // 2779
D=M // 2780
A=D+1 // 2781
D=M // 2782
D=D-1 // 2783
@DO_EQ // 2784
0;JMP // 2785
(Memory.deAlloc.EQ.8)
D=!D // 2786
@Memory.deAlloc.IfElse2 // 2787
D;JNE // 2788

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

@LCL // 2789
A=M+1 // 2790
D=M // 2791
@0 // 2792
A=D+A // 2793
D=M // 2794
@SP // 2795
AM=M+1 // 2796
A=A-1 // 2797
M=D // 2798
// call Memory.getBinIndex
@6 // 2799
D=A // 2800
@14 // 2801
M=D // 2802
@Memory.getBinIndex // 2803
D=A // 2804
@13 // 2805
M=D // 2806
@Memory.deAlloc.ret.0 // 2807
D=A // 2808
@CALL // 2809
0;JMP // 2810
(Memory.deAlloc.ret.0)
@SP // 2811
AM=M-1 // 2812
D=M // 2813
@2048 // 2814
D=D+A // 2815
@SP // 2816
AM=M+1 // 2817
A=A-1 // 2818
M=D // 2819
@LCL // 2820
A=M+1 // 2821
D=M // 2822
@SP // 2823
AM=M+1 // 2824
A=A-1 // 2825
M=D // 2826
// call Memory.remove_node
@7 // 2827
D=A // 2828
@14 // 2829
M=D // 2830
@Memory.remove_node // 2831
D=A // 2832
@13 // 2833
M=D // 2834
@Memory.deAlloc.ret.1 // 2835
D=A // 2836
@CALL // 2837
0;JMP // 2838
(Memory.deAlloc.ret.1)
@SP // 2839
M=M-1 // 2840

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
@LCL // 2841
A=M+1 // 2842
D=M // 2843
@SP // 2844
AM=M+1 // 2845
A=A-1 // 2846
M=D // 2847
@LCL // 2848
A=M+1 // 2849
D=M // 2850
@0 // 2851
A=D+A // 2852
D=M // 2853
@SP // 2854
AM=M+1 // 2855
A=A-1 // 2856
M=D // 2857
@LCL // 2858
A=M // 2859
D=M // 2860
@0 // 2861
A=D+A // 2862
D=M // 2863
@SP // 2864
AM=M-1 // 2865
D=D+M // 2866
@5 // 2867
D=D+A // 2868
@SP // 2869
AM=M-1 // 2870
A=M // 2871
M=D // 2872

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2873
A=M+1 // 2874
D=M // 2875
@SP // 2876
AM=M+1 // 2877
A=A-1 // 2878
M=D // 2879
// call Memory.create_foot
@6 // 2880
D=A // 2881
@14 // 2882
M=D // 2883
@Memory.create_foot // 2884
D=A // 2885
@13 // 2886
M=D // 2887
@Memory.deAlloc.ret.2 // 2888
D=A // 2889
@CALL // 2890
0;JMP // 2891
(Memory.deAlloc.ret.2)
@SP // 2892
M=M-1 // 2893

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2894
A=M+1 // 2895
D=M // 2896
@LCL // 2897
A=M // 2898
M=D // 2899

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 2900
0;JMP // 2901

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 2902
0;JMP // 2903

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
@Memory.deAlloc.EQ.9 // 2904
D=A // 2905
@SP // 2906
AM=M+1 // 2907
A=A-1 // 2908
M=D // 2909
@Memory.deAlloc.EQ.10 // 2910
D=A // 2911
@SP // 2912
AM=M+1 // 2913
A=A-1 // 2914
M=D // 2915
@LCL // 2916
A=M+1 // 2917
A=A+1 // 2918
D=M // 2919
@DO_EQ // 2920
0;JMP // 2921
(Memory.deAlloc.EQ.10)
D=!D // 2922
@DO_EQ // 2923
0;JMP // 2924
(Memory.deAlloc.EQ.9)
@Memory.deAlloc.IfElse3 // 2925
D;JNE // 2926

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
@Memory.deAlloc.EQ.11 // 2927
D=A // 2928
@SP // 2929
AM=M+1 // 2930
A=A-1 // 2931
M=D // 2932
@LCL // 2933
A=M+1 // 2934
A=A+1 // 2935
D=M // 2936
A=D+1 // 2937
D=M // 2938
D=D-1 // 2939
@DO_EQ // 2940
0;JMP // 2941
(Memory.deAlloc.EQ.11)
D=!D // 2942
@Memory.deAlloc.IfElse4 // 2943
D;JNE // 2944

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

@LCL // 2945
A=M+1 // 2946
A=A+1 // 2947
D=M // 2948
@0 // 2949
A=D+A // 2950
D=M // 2951
@SP // 2952
AM=M+1 // 2953
A=A-1 // 2954
M=D // 2955
// call Memory.getBinIndex
@6 // 2956
D=A // 2957
@14 // 2958
M=D // 2959
@Memory.getBinIndex // 2960
D=A // 2961
@13 // 2962
M=D // 2963
@Memory.deAlloc.ret.3 // 2964
D=A // 2965
@CALL // 2966
0;JMP // 2967
(Memory.deAlloc.ret.3)
@SP // 2968
AM=M-1 // 2969
D=M // 2970
@2048 // 2971
D=D+A // 2972
@SP // 2973
AM=M+1 // 2974
A=A-1 // 2975
M=D // 2976
@LCL // 2977
A=M+1 // 2978
A=A+1 // 2979
D=M // 2980
@SP // 2981
AM=M+1 // 2982
A=A-1 // 2983
M=D // 2984
// call Memory.remove_node
@7 // 2985
D=A // 2986
@14 // 2987
M=D // 2988
@Memory.remove_node // 2989
D=A // 2990
@13 // 2991
M=D // 2992
@Memory.deAlloc.ret.4 // 2993
D=A // 2994
@CALL // 2995
0;JMP // 2996
(Memory.deAlloc.ret.4)
@SP // 2997
M=M-1 // 2998

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
@LCL // 2999
A=M // 3000
D=M // 3001
@SP // 3002
AM=M+1 // 3003
A=A-1 // 3004
M=D // 3005
@LCL // 3006
A=M // 3007
D=M // 3008
@0 // 3009
A=D+A // 3010
D=M // 3011
@SP // 3012
AM=M+1 // 3013
A=A-1 // 3014
M=D // 3015
@LCL // 3016
A=M+1 // 3017
A=A+1 // 3018
D=M // 3019
@0 // 3020
A=D+A // 3021
D=M // 3022
@SP // 3023
AM=M-1 // 3024
D=D+M // 3025
@5 // 3026
D=D+A // 3027
@SP // 3028
AM=M-1 // 3029
A=M // 3030
M=D // 3031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3032
A=M // 3033
D=M // 3034
@SP // 3035
AM=M+1 // 3036
A=A-1 // 3037
M=D // 3038
// call Memory.create_foot
@6 // 3039
D=A // 3040
@14 // 3041
M=D // 3042
@Memory.create_foot // 3043
D=A // 3044
@13 // 3045
M=D // 3046
@Memory.deAlloc.ret.5 // 3047
D=A // 3048
@CALL // 3049
0;JMP // 3050
(Memory.deAlloc.ret.5)
@SP // 3051
M=M-1 // 3052

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 3053
0;JMP // 3054

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 3055
0;JMP // 3056

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

@LCL // 3057
A=M // 3058
D=M // 3059
@0 // 3060
A=D+A // 3061
D=M // 3062
@SP // 3063
AM=M+1 // 3064
A=A-1 // 3065
M=D // 3066
// call Memory.getBinIndex
@6 // 3067
D=A // 3068
@14 // 3069
M=D // 3070
@Memory.getBinIndex // 3071
D=A // 3072
@13 // 3073
M=D // 3074
@Memory.deAlloc.ret.6 // 3075
D=A // 3076
@CALL // 3077
0;JMP // 3078
(Memory.deAlloc.ret.6)
@SP // 3079
AM=M-1 // 3080
D=M // 3081
@2048 // 3082
D=D+A // 3083
@SP // 3084
AM=M+1 // 3085
A=A-1 // 3086
M=D // 3087
@LCL // 3088
A=M // 3089
D=M // 3090
@SP // 3091
AM=M+1 // 3092
A=A-1 // 3093
M=D // 3094
// call Memory.add_node
@7 // 3095
D=A // 3096
@14 // 3097
M=D // 3098
@Memory.add_node // 3099
D=A // 3100
@13 // 3101
M=D // 3102
@Memory.deAlloc.ret.7 // 3103
D=A // 3104
@CALL // 3105
0;JMP // 3106
(Memory.deAlloc.ret.7)
@SP // 3107
M=M-1 // 3108

////PushInstruction("constant 0")
@SP // 3109
AM=M+1 // 3110
A=A-1 // 3111
M=0 // 3112

////ReturnInstruction{}
@RETURN // 3113
0;JMP // 3114

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@4 // 3115
D=A // 3116
@SP // 3117
AM=D+M // 3118
A=A-1 // 3119
M=0 // 3120
A=A-1 // 3121
M=0 // 3122
A=A-1 // 3123
M=0 // 3124
A=A-1 // 3125
M=0 // 3126

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
@Memory.realloc.EQ.12 // 3127
D=A // 3128
@SP // 3129
AM=M+1 // 3130
A=A-1 // 3131
M=D // 3132
@ARG // 3133
A=M // 3134
D=M // 3135
@DO_EQ // 3136
0;JMP // 3137
(Memory.realloc.EQ.12)
@Memory.realloc.IfElse1 // 3138
D;JEQ // 3139

////CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
@ARG // 3140
A=M+1 // 3141
D=M // 3142
@SP // 3143
AM=M+1 // 3144
A=A-1 // 3145
M=D // 3146
// call Memory.alloc
@6 // 3147
D=A // 3148
@14 // 3149
M=D // 3150
@Memory.alloc // 3151
D=A // 3152
@13 // 3153
M=D // 3154
@Memory.realloc.ret.0 // 3155
D=A // 3156
@CALL // 3157
0;JMP // 3158
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 3159
0;JMP // 3160

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 3161
0;JMP // 3162

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

@ARG // 3163
A=M // 3164
D=M // 3165
D=D-1 // 3166
@LCL // 3167
A=M+1 // 3168
A=A+1 // 3169
A=A+1 // 3170
M=D // 3171

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

@LCL // 3172
A=M+1 // 3173
A=A+1 // 3174
A=A+1 // 3175
D=M // 3176
@0 // 3177
A=D+A // 3178
D=M // 3179
@LCL // 3180
A=M // 3181
M=D // 3182

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3183
A=M+1 // 3184
D=M // 3185
@SP // 3186
AM=M+1 // 3187
A=A-1 // 3188
M=D // 3189
// call Memory.alloc
@6 // 3190
D=A // 3191
@14 // 3192
M=D // 3193
@Memory.alloc // 3194
D=A // 3195
@13 // 3196
M=D // 3197
@Memory.realloc.ret.1 // 3198
D=A // 3199
@CALL // 3200
0;JMP // 3201
(Memory.realloc.ret.1)
@SP // 3202
AM=M-1 // 3203
D=M // 3204
@LCL // 3205
A=M+1 // 3206
M=D // 3207

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
@Memory.realloc.EQ.13 // 3208
D=A // 3209
@SP // 3210
AM=M+1 // 3211
A=A-1 // 3212
M=D // 3213
@LCL // 3214
A=M+1 // 3215
D=M // 3216
@DO_EQ // 3217
0;JMP // 3218
(Memory.realloc.EQ.13)
@Memory.realloc.IfElse2 // 3219
D;JEQ // 3220

////PushInstruction("constant 0")
@SP // 3221
AM=M+1 // 3222
A=A-1 // 3223
M=0 // 3224

////ReturnInstruction{}
@RETURN // 3225
0;JMP // 3226

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 3227
0;JMP // 3228

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
@Memory.realloc.EQ.14 // 3229
D=A // 3230
@SP // 3231
AM=M+1 // 3232
A=A-1 // 3233
M=D // 3234
@Memory.realloc.GT.15 // 3235
D=A // 3236
@SP // 3237
AM=M+1 // 3238
A=A-1 // 3239
M=D // 3240
@LCL // 3241
A=M // 3242
D=M // 3243
@SP // 3244
AM=M+1 // 3245
A=A-1 // 3246
M=D // 3247
@ARG // 3248
A=M+1 // 3249
D=M // 3250
@SP // 3251
AM=M-1 // 3252
D=M-D // 3253
@DO_GT // 3254
0;JMP // 3255
(Memory.realloc.GT.15)
D=!D // 3256
@DO_EQ // 3257
0;JMP // 3258
(Memory.realloc.EQ.14)
@Memory.realloc.IfElse3 // 3259
D;JNE // 3260

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3261
A=M // 3262
D=M // 3263
@LCL // 3264
A=M+1 // 3265
A=A+1 // 3266
M=D // 3267

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 3268
0;JMP // 3269

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3270
A=M+1 // 3271
D=M // 3272
@LCL // 3273
A=M+1 // 3274
A=A+1 // 3275
M=D // 3276

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3277
A=M // 3278
D=M // 3279
@SP // 3280
AM=M+1 // 3281
A=A-1 // 3282
M=D // 3283
@LCL // 3284
A=M+1 // 3285
D=M // 3286
@SP // 3287
AM=M+1 // 3288
A=A-1 // 3289
M=D // 3290
@LCL // 3291
A=M+1 // 3292
A=A+1 // 3293
D=M // 3294
@SP // 3295
AM=M+1 // 3296
A=A-1 // 3297
M=D // 3298
// call Memory.copy
@8 // 3299
D=A // 3300
@14 // 3301
M=D // 3302
@Memory.copy // 3303
D=A // 3304
@13 // 3305
M=D // 3306
@Memory.realloc.ret.2 // 3307
D=A // 3308
@CALL // 3309
0;JMP // 3310
(Memory.realloc.ret.2)
@SP // 3311
M=M-1 // 3312

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3313
A=M // 3314
D=M // 3315
@SP // 3316
AM=M+1 // 3317
A=A-1 // 3318
M=D // 3319
// call Memory.deAlloc
@6 // 3320
D=A // 3321
@14 // 3322
M=D // 3323
@Memory.deAlloc // 3324
D=A // 3325
@13 // 3326
M=D // 3327
@Memory.realloc.ret.3 // 3328
D=A // 3329
@CALL // 3330
0;JMP // 3331
(Memory.realloc.ret.3)
@SP // 3332
M=M-1 // 3333

////PushInstruction("local 1")
@LCL // 3334
A=M+1 // 3335
D=M // 3336
@SP // 3337
AM=M+1 // 3338
A=A-1 // 3339
M=D // 3340

////ReturnInstruction{}
@RETURN // 3341
0;JMP // 3342

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3343
AM=M+1 // 3344
A=A-1 // 3345
M=0 // 3346

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3347
A=M // 3348
M=0 // 3349

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
@Memory.copy.LT.16 // 3350
D=A // 3351
@SP // 3352
AM=M+1 // 3353
A=A-1 // 3354
M=D // 3355
@LCL // 3356
A=M // 3357
D=M // 3358
@SP // 3359
AM=M+1 // 3360
A=A-1 // 3361
M=D // 3362
@ARG // 3363
A=M+1 // 3364
A=A+1 // 3365
D=M // 3366
@SP // 3367
AM=M-1 // 3368
D=M-D // 3369
@DO_LT // 3370
0;JMP // 3371
(Memory.copy.LT.16)
D=!D // 3372
@WHILE_END_Memory.copy1 // 3373
D;JNE // 3374

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
@ARG // 3375
A=M+1 // 3376
D=M // 3377
@SP // 3378
AM=M+1 // 3379
A=A-1 // 3380
M=D // 3381
@LCL // 3382
A=M // 3383
D=M // 3384
@SP // 3385
AM=M-1 // 3386
D=D+M // 3387
@SP // 3388
AM=M+1 // 3389
A=A-1 // 3390
M=D // 3391
@ARG // 3392
A=M // 3393
D=M // 3394
@SP // 3395
AM=M+1 // 3396
A=A-1 // 3397
M=D // 3398
@LCL // 3399
A=M // 3400
D=M // 3401
@SP // 3402
AM=M-1 // 3403
A=D+M // 3404
D=M // 3405
@SP // 3406
AM=M-1 // 3407
A=M // 3408
M=D // 3409

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

@LCL // 3410
A=M // 3411
M=M+1 // 3412

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 3413
0;JMP // 3414

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 3415
AM=M+1 // 3416
A=A-1 // 3417
M=0 // 3418

////ReturnInstruction{}
@RETURN // 3419
0;JMP // 3420

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
@Memory.remove_node.EQ.17 // 3421
D=A // 3422
@SP // 3423
AM=M+1 // 3424
A=A-1 // 3425
M=D // 3426
@Memory.remove_node.EQ.18 // 3427
D=A // 3428
@SP // 3429
AM=M+1 // 3430
A=A-1 // 3431
M=D // 3432
@ARG // 3433
A=M+1 // 3434
D=M // 3435
@2 // 3436
A=D+A // 3437
D=M // 3438
@DO_EQ // 3439
0;JMP // 3440
(Memory.remove_node.EQ.18)
D=!D // 3441
@DO_EQ // 3442
0;JMP // 3443
(Memory.remove_node.EQ.17)
@Memory.remove_node.IfElse1 // 3444
D;JNE // 3445

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
@ARG // 3446
A=M+1 // 3447
D=M // 3448
@2 // 3449
D=D+A // 3450
@3 // 3451
D=D+A // 3452
@SP // 3453
AM=M+1 // 3454
A=A-1 // 3455
M=D // 3456
@ARG // 3457
A=M+1 // 3458
D=M // 3459
@3 // 3460
A=D+A // 3461
D=M // 3462
@SP // 3463
AM=M-1 // 3464
A=M // 3465
M=D // 3466

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 3467
0;JMP // 3468

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
@ARG // 3469
A=M // 3470
D=M // 3471
@SP // 3472
AM=M+1 // 3473
A=A-1 // 3474
M=D // 3475
@ARG // 3476
A=M+1 // 3477
D=M // 3478
@3 // 3479
A=D+A // 3480
D=M // 3481
@SP // 3482
AM=M-1 // 3483
A=M // 3484
M=D // 3485

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
@Memory.remove_node.EQ.19 // 3486
D=A // 3487
@SP // 3488
AM=M+1 // 3489
A=A-1 // 3490
M=D // 3491
@Memory.remove_node.EQ.20 // 3492
D=A // 3493
@SP // 3494
AM=M+1 // 3495
A=A-1 // 3496
M=D // 3497
@ARG // 3498
A=M+1 // 3499
D=M // 3500
@3 // 3501
A=D+A // 3502
D=M // 3503
@DO_EQ // 3504
0;JMP // 3505
(Memory.remove_node.EQ.20)
D=!D // 3506
@DO_EQ // 3507
0;JMP // 3508
(Memory.remove_node.EQ.19)
@Memory.remove_node.IfElse2 // 3509
D;JNE // 3510

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
@ARG // 3511
A=M+1 // 3512
D=M // 3513
@3 // 3514
D=D+A // 3515
@2 // 3516
D=D+A // 3517
@SP // 3518
AM=M+1 // 3519
A=A-1 // 3520
M=D // 3521
@ARG // 3522
A=M+1 // 3523
D=M // 3524
@2 // 3525
A=D+A // 3526
D=M // 3527
@SP // 3528
AM=M-1 // 3529
A=M // 3530
M=D // 3531

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 3532
0;JMP // 3533

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
@ARG // 3534
A=M+1 // 3535
D=M // 3536
@2 // 3537
D=D+A // 3538
@SP // 3539
AM=M+1 // 3540
A=A-1 // 3541
M=D // 3542
D=0 // 3543
@SP // 3544
AM=M-1 // 3545
A=M // 3546
M=D // 3547

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3548
A=M+1 // 3549
D=M // 3550
@3 // 3551
D=D+A // 3552
@SP // 3553
AM=M+1 // 3554
A=A-1 // 3555
M=D // 3556
D=0 // 3557
@SP // 3558
AM=M-1 // 3559
A=M // 3560
M=D // 3561

////PushInstruction("constant 0")
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=0 // 3565

////ReturnInstruction{}
@RETURN // 3566
0;JMP // 3567

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 3568
AM=M+1 // 3569
A=A-1 // 3570
M=0 // 3571

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3572
A=M // 3573
M=0 // 3574

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
@Memory.getBinIndex.EQ.21 // 3575
D=A // 3576
@SP // 3577
AM=M+1 // 3578
A=A-1 // 3579
M=D // 3580
@Memory.getBinIndex.LT.22 // 3581
D=A // 3582
@SP // 3583
AM=M+1 // 3584
A=A-1 // 3585
M=D // 3586
@LCL // 3587
A=M // 3588
D=M // 3589
@7 // 3590
D=D-A // 3591
@DO_LT // 3592
0;JMP // 3593
(Memory.getBinIndex.LT.22)
@SP // 3594
AM=M+1 // 3595
A=A-1 // 3596
M=D // 3597
@Memory.getBinIndex.EQ.23 // 3598
D=A // 3599
@SP // 3600
AM=M+1 // 3601
A=A-1 // 3602
M=D // 3603
@LCL // 3604
A=M // 3605
D=M // 3606
@2048 // 3607
A=D+A // 3608
D=M // 3609
@DO_EQ // 3610
0;JMP // 3611
(Memory.getBinIndex.EQ.23)
D=!D // 3612
@SP // 3613
AM=M-1 // 3614
D=D&M // 3615
@DO_EQ // 3616
0;JMP // 3617
(Memory.getBinIndex.EQ.21)
@WHILE_END_Memory.getBinIndex1 // 3618
D;JNE // 3619

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
@Memory.getBinIndex.EQ.24 // 3620
D=A // 3621
@SP // 3622
AM=M+1 // 3623
A=A-1 // 3624
M=D // 3625
@Memory.getBinIndex.GT.25 // 3626
D=A // 3627
@SP // 3628
AM=M+1 // 3629
A=A-1 // 3630
M=D // 3631
@ARG // 3632
A=M // 3633
D=M // 3634
@SP // 3635
AM=M+1 // 3636
A=A-1 // 3637
M=D // 3638
@LCL // 3639
A=M // 3640
D=M // 3641
@SP // 3642
AM=M+1 // 3643
A=A-1 // 3644
M=D+1 // 3645
@16 // 3646
D=A // 3647
@SP // 3648
AM=M+1 // 3649
A=A-1 // 3650
M=D // 3651
// call Math.multiply
@7 // 3652
D=A // 3653
@14 // 3654
M=D // 3655
@Math.multiply // 3656
D=A // 3657
@13 // 3658
M=D // 3659
@Memory.getBinIndex.ret.0 // 3660
D=A // 3661
@CALL // 3662
0;JMP // 3663
(Memory.getBinIndex.ret.0)
@SP // 3664
AM=M-1 // 3665
D=M // 3666
@SP // 3667
AM=M-1 // 3668
D=M-D // 3669
@DO_GT // 3670
0;JMP // 3671
(Memory.getBinIndex.GT.25)
D=!D // 3672
@DO_EQ // 3673
0;JMP // 3674
(Memory.getBinIndex.EQ.24)
@Memory.getBinIndex.IfElse1 // 3675
D;JNE // 3676

////PushInstruction("local 0")
@LCL // 3677
A=M // 3678
D=M // 3679
@SP // 3680
AM=M+1 // 3681
A=A-1 // 3682
M=D // 3683

////ReturnInstruction{}
@RETURN // 3684
0;JMP // 3685

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 3686
0;JMP // 3687

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

@LCL // 3688
A=M // 3689
M=M+1 // 3690

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 3691
0;JMP // 3692

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
@6 // 3693
D=A // 3694
@SP // 3695
AM=M+1 // 3696
A=A-1 // 3697
M=D // 3698
@7 // 3699
D=A // 3700
@SP // 3701
AM=M+1 // 3702
A=A-1 // 3703
M=D-1 // 3704

////ReturnInstruction{}
@RETURN // 3705
0;JMP // 3706

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 3707
AM=M+1 // 3708
A=A-1 // 3709
M=0 // 3710

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

@ARG // 3711
A=M // 3712
D=M // 3713
@0 // 3714
A=D+A // 3715
D=M // 3716
@LCL // 3717
A=M // 3718
M=D // 3719

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
@Memory.get_best_fit.EQ.26 // 3720
D=A // 3721
@SP // 3722
AM=M+1 // 3723
A=A-1 // 3724
M=D // 3725
@Memory.get_best_fit.LT.27 // 3726
D=A // 3727
@SP // 3728
AM=M+1 // 3729
A=A-1 // 3730
M=D // 3731
@LCL // 3732
A=M // 3733
D=M // 3734
@0 // 3735
A=D+A // 3736
D=M // 3737
@SP // 3738
AM=M+1 // 3739
A=A-1 // 3740
M=D // 3741
@ARG // 3742
A=M+1 // 3743
D=M // 3744
@SP // 3745
AM=M-1 // 3746
D=M-D // 3747
@DO_LT // 3748
0;JMP // 3749
(Memory.get_best_fit.LT.27)
D=!D // 3750
@DO_EQ // 3751
0;JMP // 3752
(Memory.get_best_fit.EQ.26)
@Memory.get_best_fit.IfElse1 // 3753
D;JNE // 3754

////PushInstruction("local 0")
@LCL // 3755
A=M // 3756
D=M // 3757
@SP // 3758
AM=M+1 // 3759
A=A-1 // 3760
M=D // 3761

////ReturnInstruction{}
@RETURN // 3762
0;JMP // 3763

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 3764
0;JMP // 3765

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
@Memory.get_best_fit.EQ.28 // 3766
D=A // 3767
@SP // 3768
AM=M+1 // 3769
A=A-1 // 3770
M=D // 3771
@Memory.get_best_fit.EQ.29 // 3772
D=A // 3773
@SP // 3774
AM=M+1 // 3775
A=A-1 // 3776
M=D // 3777
@LCL // 3778
A=M // 3779
D=M // 3780
@3 // 3781
A=D+A // 3782
D=M // 3783
@DO_EQ // 3784
0;JMP // 3785
(Memory.get_best_fit.EQ.29)
D=!D // 3786
@DO_EQ // 3787
0;JMP // 3788
(Memory.get_best_fit.EQ.28)
@WHILE_END_Memory.get_best_fit1 // 3789
D;JNE // 3790

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

@LCL // 3791
A=M // 3792
D=M // 3793
@3 // 3794
A=D+A // 3795
D=M // 3796
@LCL // 3797
A=M // 3798
M=D // 3799

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
@Memory.get_best_fit.EQ.30 // 3800
D=A // 3801
@SP // 3802
AM=M+1 // 3803
A=A-1 // 3804
M=D // 3805
@Memory.get_best_fit.LT.31 // 3806
D=A // 3807
@SP // 3808
AM=M+1 // 3809
A=A-1 // 3810
M=D // 3811
@LCL // 3812
A=M // 3813
D=M // 3814
@0 // 3815
A=D+A // 3816
D=M // 3817
@SP // 3818
AM=M+1 // 3819
A=A-1 // 3820
M=D // 3821
@ARG // 3822
A=M+1 // 3823
D=M // 3824
@SP // 3825
AM=M-1 // 3826
D=M-D // 3827
@DO_LT // 3828
0;JMP // 3829
(Memory.get_best_fit.LT.31)
D=!D // 3830
@DO_EQ // 3831
0;JMP // 3832
(Memory.get_best_fit.EQ.30)
@Memory.get_best_fit.IfElse2 // 3833
D;JNE // 3834

////PushInstruction("local 0")
@LCL // 3835
A=M // 3836
D=M // 3837
@SP // 3838
AM=M+1 // 3839
A=A-1 // 3840
M=D // 3841

////ReturnInstruction{}
@RETURN // 3842
0;JMP // 3843

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 3844
0;JMP // 3845

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 3846
0;JMP // 3847

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 3848
AM=M+1 // 3849
A=A-1 // 3850
M=0 // 3851

////ReturnInstruction{}
@RETURN // 3852
0;JMP // 3853

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
@ARG // 3854
A=M // 3855
D=M // 3856
@SP // 3857
AM=M+1 // 3858
A=A-1 // 3859
M=D // 3860
@ARG // 3861
A=M // 3862
D=M // 3863
@0 // 3864
A=D+A // 3865
D=M // 3866
@4 // 3867
D=D+A // 3868
@SP // 3869
AM=M-1 // 3870
D=D+M // 3871
@SP // 3872
AM=M+1 // 3873
A=A-1 // 3874
M=D // 3875
@ARG // 3876
A=M // 3877
D=M // 3878
@SP // 3879
AM=M-1 // 3880
A=M // 3881
M=D // 3882

////PushInstruction("constant 0")
@SP // 3883
AM=M+1 // 3884
A=A-1 // 3885
M=0 // 3886

////ReturnInstruction{}
@RETURN // 3887
0;JMP // 3888

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 3889
M=M+1 // 3890
AM=M+1 // 3891
A=A-1 // 3892
M=0 // 3893
A=A-1 // 3894
M=0 // 3895

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 3896
A=M+1 // 3897
D=M // 3898
@2 // 3899
D=D+A // 3900
@SP // 3901
AM=M+1 // 3902
A=A-1 // 3903
M=D // 3904
D=0 // 3905
@SP // 3906
AM=M-1 // 3907
A=M // 3908
M=D // 3909

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 3910
A=M+1 // 3911
D=M // 3912
@3 // 3913
D=D+A // 3914
@SP // 3915
AM=M+1 // 3916
A=A-1 // 3917
M=D // 3918
D=0 // 3919
@SP // 3920
AM=M-1 // 3921
A=M // 3922
M=D // 3923

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
@Memory.add_node.EQ.32 // 3924
D=A // 3925
@SP // 3926
AM=M+1 // 3927
A=A-1 // 3928
M=D // 3929
@ARG // 3930
A=M // 3931
D=M // 3932
@0 // 3933
A=D+A // 3934
D=M // 3935
@DO_EQ // 3936
0;JMP // 3937
(Memory.add_node.EQ.32)
@Memory.add_node.IfElse1 // 3938
D;JEQ // 3939

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 3940
A=M // 3941
D=M // 3942
@SP // 3943
AM=M+1 // 3944
A=A-1 // 3945
M=D // 3946
@ARG // 3947
A=M+1 // 3948
D=M // 3949
@SP // 3950
AM=M-1 // 3951
A=M // 3952
M=D // 3953

////PushInstruction("constant 0")
@SP // 3954
AM=M+1 // 3955
A=A-1 // 3956
M=0 // 3957

////ReturnInstruction{}
@RETURN // 3958
0;JMP // 3959

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 3960
0;JMP // 3961

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

@ARG // 3962
A=M // 3963
D=M // 3964
@0 // 3965
A=D+A // 3966
D=M // 3967
@LCL // 3968
A=M // 3969
M=D // 3970

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3971
A=M+1 // 3972
M=0 // 3973

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
@Memory.add_node.EQ.33 // 3974
D=A // 3975
@SP // 3976
AM=M+1 // 3977
A=A-1 // 3978
M=D // 3979
@Memory.add_node.EQ.34 // 3980
D=A // 3981
@SP // 3982
AM=M+1 // 3983
A=A-1 // 3984
M=D // 3985
@LCL // 3986
A=M // 3987
D=M // 3988
@DO_EQ // 3989
0;JMP // 3990
(Memory.add_node.EQ.34)
@SP // 3991
AM=M+1 // 3992
A=A-1 // 3993
M=D // 3994
@SP // 3995
A=M-1 // 3996
M=!D // 3997
@Memory.add_node.GT.35 // 3998
D=A // 3999
@SP // 4000
AM=M+1 // 4001
A=A-1 // 4002
M=D // 4003
@LCL // 4004
A=M // 4005
D=M // 4006
@0 // 4007
A=D+A // 4008
D=M // 4009
@SP // 4010
AM=M+1 // 4011
A=A-1 // 4012
M=D // 4013
@ARG // 4014
A=M+1 // 4015
D=M // 4016
@0 // 4017
A=D+A // 4018
D=M // 4019
@SP // 4020
AM=M-1 // 4021
D=M-D // 4022
@DO_GT // 4023
0;JMP // 4024
(Memory.add_node.GT.35)
D=!D // 4025
@SP // 4026
AM=M-1 // 4027
D=D&M // 4028
@DO_EQ // 4029
0;JMP // 4030
(Memory.add_node.EQ.33)
@WHILE_END_Memory.add_node1 // 4031
D;JNE // 4032

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 4033
A=M // 4034
D=M // 4035
@LCL // 4036
A=M+1 // 4037
M=D // 4038

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

@LCL // 4039
A=M // 4040
D=M // 4041
@3 // 4042
A=D+A // 4043
D=M // 4044
@LCL // 4045
A=M // 4046
M=D // 4047

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 4048
0;JMP // 4049

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
@Memory.add_node.EQ.36 // 4050
D=A // 4051
@SP // 4052
AM=M+1 // 4053
A=A-1 // 4054
M=D // 4055
@LCL // 4056
A=M+1 // 4057
D=!M // 4058
@DO_EQ // 4059
0;JMP // 4060
(Memory.add_node.EQ.36)
@Memory.add_node.IfElse2 // 4061
D;JNE // 4062

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
@ARG // 4063
A=M+1 // 4064
D=M // 4065
@3 // 4066
D=D+A // 4067
@SP // 4068
AM=M+1 // 4069
A=A-1 // 4070
M=D // 4071
@ARG // 4072
A=M // 4073
D=M // 4074
@0 // 4075
A=D+A // 4076
D=M // 4077
@SP // 4078
AM=M-1 // 4079
A=M // 4080
M=D // 4081

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
@ARG // 4082
A=M // 4083
D=M // 4084
@0 // 4085
D=D+A // 4086
@2 // 4087
D=D+A // 4088
@SP // 4089
AM=M+1 // 4090
A=A-1 // 4091
M=D // 4092
@ARG // 4093
A=M+1 // 4094
D=M // 4095
@SP // 4096
AM=M-1 // 4097
A=M // 4098
M=D // 4099

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 4100
A=M // 4101
D=M // 4102
@SP // 4103
AM=M+1 // 4104
A=A-1 // 4105
M=D // 4106
@ARG // 4107
A=M+1 // 4108
D=M // 4109
@SP // 4110
AM=M-1 // 4111
A=M // 4112
M=D // 4113

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 4114
0;JMP // 4115

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
@ARG // 4116
A=M+1 // 4117
D=M // 4118
@3 // 4119
D=D+A // 4120
@SP // 4121
AM=M+1 // 4122
A=A-1 // 4123
M=D // 4124
@LCL // 4125
A=M // 4126
D=M // 4127
@SP // 4128
AM=M-1 // 4129
A=M // 4130
M=D // 4131

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 4132
A=M+1 // 4133
D=M // 4134
@2 // 4135
D=D+A // 4136
@SP // 4137
AM=M+1 // 4138
A=A-1 // 4139
M=D // 4140
@LCL // 4141
A=M+1 // 4142
D=M // 4143
@SP // 4144
AM=M-1 // 4145
A=M // 4146
M=D // 4147

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node.IfElse3}}
@Memory.add_node.EQ.37 // 4148
D=A // 4149
@SP // 4150
AM=M+1 // 4151
A=A-1 // 4152
M=D // 4153
@LCL // 4154
A=M // 4155
D=M // 4156
@DO_EQ // 4157
0;JMP // 4158
(Memory.add_node.EQ.37)
@Memory.add_node.IfElse3 // 4159
D;JNE // 4160

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 4161
A=M // 4162
D=M // 4163
@2 // 4164
D=D+A // 4165
@SP // 4166
AM=M+1 // 4167
A=A-1 // 4168
M=D // 4169
@ARG // 4170
A=M+1 // 4171
D=M // 4172
@SP // 4173
AM=M-1 // 4174
A=M // 4175
M=D // 4176

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 4177
0;JMP // 4178

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
@LCL // 4179
A=M+1 // 4180
D=M // 4181
@3 // 4182
D=D+A // 4183
@SP // 4184
AM=M+1 // 4185
A=A-1 // 4186
M=D // 4187
@ARG // 4188
A=M+1 // 4189
D=M // 4190
@SP // 4191
AM=M-1 // 4192
A=M // 4193
M=D // 4194

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 4195
AM=M+1 // 4196
A=A-1 // 4197
M=0 // 4198

////ReturnInstruction{}
@RETURN // 4199
0;JMP // 4200

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
@ARG // 4201
A=M // 4202
D=M // 4203
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=D // 4207
@ARG // 4208
A=M+1 // 4209
D=M // 4210
@SP // 4211
AM=M-1 // 4212
A=M // 4213
M=D // 4214

////PushInstruction("constant 0")
@SP // 4215
AM=M+1 // 4216
A=A-1 // 4217
M=0 // 4218

////ReturnInstruction{}
@RETURN // 4219
0;JMP // 4220

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
@ARG // 4221
A=M // 4222
D=M // 4223
@0 // 4224
A=D+A // 4225
D=M // 4226
@SP // 4227
AM=M+1 // 4228
A=A-1 // 4229
M=D // 4230

////ReturnInstruction{}
@RETURN // 4231
0;JMP // 4232

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.initMap}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.initMap
@5 // 4233
D=A // 4234
@14 // 4235
M=D // 4236
@Output.initMap // 4237
D=A // 4238
@13 // 4239
M=D // 4240
@Output.init.ret.0 // 4241
D=A // 4242
@CALL // 4243
0;JMP // 4244
(Output.init.ret.0)
@SP // 4245
M=M-1 // 4246

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 4247
M=0 // 4248

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 4249
M=0 // 4250

////PushInstruction("constant 0")
@SP // 4251
AM=M+1 // 4252
A=A-1 // 4253
M=0 // 4254

////ReturnInstruction{}
@RETURN // 4255
0;JMP // 4256

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 4257
AM=M+1 // 4258
A=A-1 // 4259
M=0 // 4260

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4261
D=A // 4262
@SP // 4263
AM=M+1 // 4264
A=A-1 // 4265
M=D // 4266
// call Array.new
@6 // 4267
D=A // 4268
@14 // 4269
M=D // 4270
@Array.new // 4271
D=A // 4272
@13 // 4273
M=D // 4274
@Output.initMap.ret.0 // 4275
D=A // 4276
@CALL // 4277
0;JMP // 4278
(Output.initMap.ret.0)
@SP // 4279
AM=M-1 // 4280
D=M // 4281
@Output.0 // 4282
M=D // 4283

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4284
D=A // 4285
@SP // 4286
M=D+M // 4287
@63 // 4288
D=A // 4289
@SP // 4290
A=M-1 // 4291
M=0 // 4292
A=A-1 // 4293
M=0 // 4294
A=A-1 // 4295
M=D // 4296
A=A-1 // 4297
M=D // 4298
A=A-1 // 4299
M=D // 4300
A=A-1 // 4301
M=D // 4302
A=A-1 // 4303
M=D // 4304
A=A-1 // 4305
M=D // 4306
A=A-1 // 4307
M=D // 4308
A=A-1 // 4309
M=D // 4310
A=A-1 // 4311
M=D // 4312
A=A-1 // 4313
M=0 // 4314
// call Output.create
@17 // 4315
D=A // 4316
@14 // 4317
M=D // 4318
@Output.create // 4319
D=A // 4320
@13 // 4321
M=D // 4322
@Output.initMap.ret.1 // 4323
D=A // 4324
@CALL // 4325
0;JMP // 4326
(Output.initMap.ret.1)
@SP // 4327
M=M-1 // 4328

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4329
D=A // 4330
@SP // 4331
M=D+M // 4332
@32 // 4333
D=A // 4334
@SP // 4335
A=M-1 // 4336
M=0 // 4337
A=A-1 // 4338
M=0 // 4339
A=A-1 // 4340
M=0 // 4341
A=A-1 // 4342
M=0 // 4343
A=A-1 // 4344
M=0 // 4345
A=A-1 // 4346
M=0 // 4347
A=A-1 // 4348
M=0 // 4349
A=A-1 // 4350
M=0 // 4351
A=A-1 // 4352
M=0 // 4353
A=A-1 // 4354
M=0 // 4355
A=A-1 // 4356
M=0 // 4357
A=A-1 // 4358
M=D // 4359
A=A-1 // 4360
// call Output.create
@17 // 4361
D=A // 4362
@14 // 4363
M=D // 4364
@Output.create // 4365
D=A // 4366
@13 // 4367
M=D // 4368
@Output.initMap.ret.2 // 4369
D=A // 4370
@CALL // 4371
0;JMP // 4372
(Output.initMap.ret.2)
@SP // 4373
M=M-1 // 4374

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4375
D=A // 4376
@SP // 4377
AM=M+1 // 4378
A=A-1 // 4379
M=D // 4380
@12 // 4381
D=A // 4382
@SP // 4383
AM=M+1 // 4384
A=A-1 // 4385
M=D // 4386
@30 // 4387
D=A // 4388
@SP // 4389
AM=M+1 // 4390
A=A-1 // 4391
M=D // 4392
@30 // 4393
D=A // 4394
@SP // 4395
AM=M+1 // 4396
A=A-1 // 4397
M=D // 4398
@30 // 4399
D=A // 4400
@SP // 4401
AM=M+1 // 4402
A=A-1 // 4403
M=D // 4404
@12 // 4405
D=A // 4406
@SP // 4407
AM=M+1 // 4408
A=A-1 // 4409
M=D // 4410
@12 // 4411
D=A // 4412
@SP // 4413
AM=M+1 // 4414
A=A-1 // 4415
M=D // 4416
@SP // 4417
AM=M+1 // 4418
A=A-1 // 4419
M=0 // 4420
@4 // 4421
D=A // 4422
@SP // 4423
M=D+M // 4424
@12 // 4425
D=A // 4426
@SP // 4427
A=M-1 // 4428
M=0 // 4429
A=A-1 // 4430
M=0 // 4431
A=A-1 // 4432
M=D // 4433
A=A-1 // 4434
M=D // 4435
A=A-1 // 4436
// call Output.create
@17 // 4437
D=A // 4438
@14 // 4439
M=D // 4440
@Output.create // 4441
D=A // 4442
@13 // 4443
M=D // 4444
@Output.initMap.ret.3 // 4445
D=A // 4446
@CALL // 4447
0;JMP // 4448
(Output.initMap.ret.3)
@SP // 4449
M=M-1 // 4450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 4451
D=A // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
@54 // 4457
D=A // 4458
@SP // 4459
AM=M+1 // 4460
A=A-1 // 4461
M=D // 4462
@54 // 4463
D=A // 4464
@SP // 4465
AM=M+1 // 4466
A=A-1 // 4467
M=D // 4468
@20 // 4469
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
@SP // 4483
AM=M+1 // 4484
A=A-1 // 4485
M=0 // 4486
@SP // 4487
AM=M+1 // 4488
A=A-1 // 4489
M=0 // 4490
@SP // 4491
AM=M+1 // 4492
A=A-1 // 4493
M=0 // 4494
@SP // 4495
AM=M+1 // 4496
A=A-1 // 4497
M=0 // 4498
@SP // 4499
AM=M+1 // 4500
A=A-1 // 4501
M=0 // 4502
@SP // 4503
AM=M+1 // 4504
A=A-1 // 4505
M=0 // 4506
// call Output.create
@17 // 4507
D=A // 4508
@14 // 4509
M=D // 4510
@Output.create // 4511
D=A // 4512
@13 // 4513
M=D // 4514
@Output.initMap.ret.4 // 4515
D=A // 4516
@CALL // 4517
0;JMP // 4518
(Output.initMap.ret.4)
@SP // 4519
M=M-1 // 4520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 4521
D=A // 4522
@SP // 4523
M=D+M // 4524
@35 // 4525
D=A // 4526
@SP // 4527
A=M-1 // 4528
M=0 // 4529
A=A-1 // 4530
M=D // 4531
A=A-1 // 4532
@18 // 4533
D=A // 4534
@SP // 4535
AM=M+1 // 4536
A=A-1 // 4537
M=D // 4538
@18 // 4539
D=A // 4540
@SP // 4541
AM=M+1 // 4542
A=A-1 // 4543
M=D // 4544
@63 // 4545
D=A // 4546
@SP // 4547
AM=M+1 // 4548
A=A-1 // 4549
M=D // 4550
@18 // 4551
D=A // 4552
@SP // 4553
AM=M+1 // 4554
A=A-1 // 4555
M=D // 4556
@18 // 4557
D=A // 4558
@SP // 4559
AM=M+1 // 4560
A=A-1 // 4561
M=D // 4562
@63 // 4563
D=A // 4564
@SP // 4565
AM=M+1 // 4566
A=A-1 // 4567
M=D // 4568
@18 // 4569
D=A // 4570
@SP // 4571
AM=M+1 // 4572
A=A-1 // 4573
M=D // 4574
@18 // 4575
D=A // 4576
@SP // 4577
AM=M+1 // 4578
A=A-1 // 4579
M=D // 4580
@SP // 4581
AM=M+1 // 4582
A=A-1 // 4583
M=0 // 4584
@SP // 4585
AM=M+1 // 4586
A=A-1 // 4587
M=0 // 4588
// call Output.create
@17 // 4589
D=A // 4590
@14 // 4591
M=D // 4592
@Output.create // 4593
D=A // 4594
@13 // 4595
M=D // 4596
@Output.initMap.ret.5 // 4597
D=A // 4598
@CALL // 4599
0;JMP // 4600
(Output.initMap.ret.5)
@SP // 4601
M=M-1 // 4602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 4603
D=A // 4604
@SP // 4605
AM=M+1 // 4606
A=A-1 // 4607
M=D // 4608
@12 // 4609
D=A // 4610
@SP // 4611
AM=M+1 // 4612
A=A-1 // 4613
M=D // 4614
@30 // 4615
D=A // 4616
@SP // 4617
AM=M+1 // 4618
A=A-1 // 4619
M=D // 4620
@51 // 4621
D=A // 4622
@SP // 4623
AM=M+1 // 4624
A=A-1 // 4625
M=D // 4626
@3 // 4627
D=A // 4628
@SP // 4629
AM=M+1 // 4630
A=A-1 // 4631
M=D // 4632
@30 // 4633
D=A // 4634
@SP // 4635
AM=M+1 // 4636
A=A-1 // 4637
M=D // 4638
@48 // 4639
D=A // 4640
@SP // 4641
AM=M+1 // 4642
A=A-1 // 4643
M=D // 4644
@51 // 4645
D=A // 4646
@SP // 4647
AM=M+1 // 4648
A=A-1 // 4649
M=D // 4650
@30 // 4651
D=A // 4652
@SP // 4653
AM=M+1 // 4654
A=A-1 // 4655
M=D // 4656
@12 // 4657
D=A // 4658
@SP // 4659
AM=M+1 // 4660
A=A-1 // 4661
M=D // 4662
@12 // 4663
D=A // 4664
@SP // 4665
AM=M+1 // 4666
A=A-1 // 4667
M=D // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=0 // 4672
// call Output.create
@17 // 4673
D=A // 4674
@14 // 4675
M=D // 4676
@Output.create // 4677
D=A // 4678
@13 // 4679
M=D // 4680
@Output.initMap.ret.6 // 4681
D=A // 4682
@CALL // 4683
0;JMP // 4684
(Output.initMap.ret.6)
@SP // 4685
M=M-1 // 4686

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 4687
D=A // 4688
@SP // 4689
M=D+M // 4690
@37 // 4691
D=A // 4692
@SP // 4693
A=M-1 // 4694
M=0 // 4695
A=A-1 // 4696
M=0 // 4697
A=A-1 // 4698
M=D // 4699
A=A-1 // 4700
@35 // 4701
D=A // 4702
@SP // 4703
AM=M+1 // 4704
A=A-1 // 4705
M=D // 4706
@51 // 4707
D=A // 4708
@SP // 4709
AM=M+1 // 4710
A=A-1 // 4711
M=D // 4712
@24 // 4713
D=A // 4714
@SP // 4715
AM=M+1 // 4716
A=A-1 // 4717
M=D // 4718
@12 // 4719
D=A // 4720
@SP // 4721
AM=M+1 // 4722
A=A-1 // 4723
M=D // 4724
@6 // 4725
D=A // 4726
@SP // 4727
AM=M+1 // 4728
A=A-1 // 4729
M=D // 4730
@51 // 4731
D=A // 4732
@SP // 4733
AM=M+1 // 4734
A=A-1 // 4735
M=D // 4736
@49 // 4737
D=A // 4738
@SP // 4739
AM=M+1 // 4740
A=A-1 // 4741
M=D // 4742
@SP // 4743
AM=M+1 // 4744
A=A-1 // 4745
M=0 // 4746
@SP // 4747
AM=M+1 // 4748
A=A-1 // 4749
M=0 // 4750
// call Output.create
@17 // 4751
D=A // 4752
@14 // 4753
M=D // 4754
@Output.create // 4755
D=A // 4756
@13 // 4757
M=D // 4758
@Output.initMap.ret.7 // 4759
D=A // 4760
@CALL // 4761
0;JMP // 4762
(Output.initMap.ret.7)
@SP // 4763
M=M-1 // 4764

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 4765
D=A // 4766
@SP // 4767
AM=M+1 // 4768
A=A-1 // 4769
M=D // 4770
@12 // 4771
D=A // 4772
@SP // 4773
AM=M+1 // 4774
A=A-1 // 4775
M=D // 4776
@30 // 4777
D=A // 4778
@SP // 4779
AM=M+1 // 4780
A=A-1 // 4781
M=D // 4782
@30 // 4783
D=A // 4784
@SP // 4785
AM=M+1 // 4786
A=A-1 // 4787
M=D // 4788
@12 // 4789
D=A // 4790
@SP // 4791
AM=M+1 // 4792
A=A-1 // 4793
M=D // 4794
@54 // 4795
D=A // 4796
@SP // 4797
AM=M+1 // 4798
A=A-1 // 4799
M=D // 4800
@27 // 4801
D=A // 4802
@SP // 4803
AM=M+1 // 4804
A=A-1 // 4805
M=D // 4806
@27 // 4807
D=A // 4808
@SP // 4809
AM=M+1 // 4810
A=A-1 // 4811
M=D // 4812
@27 // 4813
D=A // 4814
@SP // 4815
AM=M+1 // 4816
A=A-1 // 4817
M=D // 4818
@54 // 4819
D=A // 4820
@SP // 4821
AM=M+1 // 4822
A=A-1 // 4823
M=D // 4824
@SP // 4825
AM=M+1 // 4826
A=A-1 // 4827
M=0 // 4828
@SP // 4829
AM=M+1 // 4830
A=A-1 // 4831
M=0 // 4832
// call Output.create
@17 // 4833
D=A // 4834
@14 // 4835
M=D // 4836
@Output.create // 4837
D=A // 4838
@13 // 4839
M=D // 4840
@Output.initMap.ret.8 // 4841
D=A // 4842
@CALL // 4843
0;JMP // 4844
(Output.initMap.ret.8)
@SP // 4845
M=M-1 // 4846

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 4847
D=A // 4848
@SP // 4849
AM=M+1 // 4850
A=A-1 // 4851
M=D // 4852
@12 // 4853
D=A // 4854
@SP // 4855
AM=M+1 // 4856
A=A-1 // 4857
M=D // 4858
@12 // 4859
D=A // 4860
@SP // 4861
AM=M+1 // 4862
A=A-1 // 4863
M=D // 4864
@6 // 4865
D=A // 4866
@SP // 4867
AM=M+1 // 4868
A=A-1 // 4869
M=D // 4870
@SP // 4871
AM=M+1 // 4872
A=A-1 // 4873
M=0 // 4874
@SP // 4875
AM=M+1 // 4876
A=A-1 // 4877
M=0 // 4878
@SP // 4879
AM=M+1 // 4880
A=A-1 // 4881
M=0 // 4882
@SP // 4883
AM=M+1 // 4884
A=A-1 // 4885
M=0 // 4886
@SP // 4887
AM=M+1 // 4888
A=A-1 // 4889
M=0 // 4890
@SP // 4891
AM=M+1 // 4892
A=A-1 // 4893
M=0 // 4894
@SP // 4895
AM=M+1 // 4896
A=A-1 // 4897
M=0 // 4898
@SP // 4899
AM=M+1 // 4900
A=A-1 // 4901
M=0 // 4902
// call Output.create
@17 // 4903
D=A // 4904
@14 // 4905
M=D // 4906
@Output.create // 4907
D=A // 4908
@13 // 4909
M=D // 4910
@Output.initMap.ret.9 // 4911
D=A // 4912
@CALL // 4913
0;JMP // 4914
(Output.initMap.ret.9)
@SP // 4915
M=M-1 // 4916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 4917
D=A // 4918
@SP // 4919
AM=M+1 // 4920
A=A-1 // 4921
M=D // 4922
@24 // 4923
D=A // 4924
@SP // 4925
AM=M+1 // 4926
A=A-1 // 4927
M=D // 4928
@12 // 4929
D=A // 4930
@SP // 4931
AM=M+1 // 4932
A=A-1 // 4933
M=D // 4934
@6 // 4935
D=A // 4936
@SP // 4937
AM=M+1 // 4938
A=A-1 // 4939
M=D // 4940
@6 // 4941
D=A // 4942
@SP // 4943
AM=M+1 // 4944
A=A-1 // 4945
M=D // 4946
@6 // 4947
D=A // 4948
@SP // 4949
AM=M+1 // 4950
A=A-1 // 4951
M=D // 4952
@6 // 4953
D=A // 4954
@SP // 4955
AM=M+1 // 4956
A=A-1 // 4957
M=D // 4958
@6 // 4959
D=A // 4960
@SP // 4961
AM=M+1 // 4962
A=A-1 // 4963
M=D // 4964
@12 // 4965
D=A // 4966
@SP // 4967
AM=M+1 // 4968
A=A-1 // 4969
M=D // 4970
@24 // 4971
D=A // 4972
@SP // 4973
AM=M+1 // 4974
A=A-1 // 4975
M=D // 4976
@SP // 4977
AM=M+1 // 4978
A=A-1 // 4979
M=0 // 4980
@SP // 4981
AM=M+1 // 4982
A=A-1 // 4983
M=0 // 4984
// call Output.create
@17 // 4985
D=A // 4986
@14 // 4987
M=D // 4988
@Output.create // 4989
D=A // 4990
@13 // 4991
M=D // 4992
@Output.initMap.ret.10 // 4993
D=A // 4994
@CALL // 4995
0;JMP // 4996
(Output.initMap.ret.10)
@SP // 4997
M=M-1 // 4998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 4999
D=A // 5000
@SP // 5001
AM=M+1 // 5002
A=A-1 // 5003
M=D // 5004
@6 // 5005
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
@24 // 5017
D=A // 5018
@SP // 5019
AM=M+1 // 5020
A=A-1 // 5021
M=D // 5022
@24 // 5023
D=A // 5024
@SP // 5025
AM=M+1 // 5026
A=A-1 // 5027
M=D // 5028
@24 // 5029
D=A // 5030
@SP // 5031
AM=M+1 // 5032
A=A-1 // 5033
M=D // 5034
@24 // 5035
D=A // 5036
@SP // 5037
AM=M+1 // 5038
A=A-1 // 5039
M=D // 5040
@24 // 5041
D=A // 5042
@SP // 5043
AM=M+1 // 5044
A=A-1 // 5045
M=D // 5046
@12 // 5047
D=A // 5048
@SP // 5049
AM=M+1 // 5050
A=A-1 // 5051
M=D // 5052
@6 // 5053
D=A // 5054
@SP // 5055
AM=M+1 // 5056
A=A-1 // 5057
M=D // 5058
@SP // 5059
AM=M+1 // 5060
A=A-1 // 5061
M=0 // 5062
@SP // 5063
AM=M+1 // 5064
A=A-1 // 5065
M=0 // 5066
// call Output.create
@17 // 5067
D=A // 5068
@14 // 5069
M=D // 5070
@Output.create // 5071
D=A // 5072
@13 // 5073
M=D // 5074
@Output.initMap.ret.11 // 5075
D=A // 5076
@CALL // 5077
0;JMP // 5078
(Output.initMap.ret.11)
@SP // 5079
M=M-1 // 5080

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5081
D=A // 5082
@SP // 5083
M=D+M // 5084
@42 // 5085
D=A // 5086
@SP // 5087
A=M-1 // 5088
M=0 // 5089
A=A-1 // 5090
M=0 // 5091
A=A-1 // 5092
M=0 // 5093
A=A-1 // 5094
M=D // 5095
A=A-1 // 5096
@51 // 5097
D=A // 5098
@SP // 5099
AM=M+1 // 5100
A=A-1 // 5101
M=D // 5102
@30 // 5103
D=A // 5104
@SP // 5105
AM=M+1 // 5106
A=A-1 // 5107
M=D // 5108
@63 // 5109
D=A // 5110
@SP // 5111
AM=M+1 // 5112
A=A-1 // 5113
M=D // 5114
@30 // 5115
D=A // 5116
@SP // 5117
AM=M+1 // 5118
A=A-1 // 5119
M=D // 5120
@51 // 5121
D=A // 5122
@SP // 5123
AM=M+1 // 5124
A=A-1 // 5125
M=D // 5126
@SP // 5127
AM=M+1 // 5128
A=A-1 // 5129
M=0 // 5130
@SP // 5131
AM=M+1 // 5132
A=A-1 // 5133
M=0 // 5134
@SP // 5135
AM=M+1 // 5136
A=A-1 // 5137
M=0 // 5138
// call Output.create
@17 // 5139
D=A // 5140
@14 // 5141
M=D // 5142
@Output.create // 5143
D=A // 5144
@13 // 5145
M=D // 5146
@Output.initMap.ret.12 // 5147
D=A // 5148
@CALL // 5149
0;JMP // 5150
(Output.initMap.ret.12)
@SP // 5151
M=M-1 // 5152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5153
D=A // 5154
@SP // 5155
M=D+M // 5156
@43 // 5157
D=A // 5158
@SP // 5159
A=M-1 // 5160
M=0 // 5161
A=A-1 // 5162
M=0 // 5163
A=A-1 // 5164
M=0 // 5165
A=A-1 // 5166
M=D // 5167
A=A-1 // 5168
@12 // 5169
D=A // 5170
@SP // 5171
AM=M+1 // 5172
A=A-1 // 5173
M=D // 5174
@12 // 5175
D=A // 5176
@SP // 5177
AM=M+1 // 5178
A=A-1 // 5179
M=D // 5180
@63 // 5181
D=A // 5182
@SP // 5183
AM=M+1 // 5184
A=A-1 // 5185
M=D // 5186
@12 // 5187
D=A // 5188
@SP // 5189
AM=M+1 // 5190
A=A-1 // 5191
M=D // 5192
@12 // 5193
D=A // 5194
@SP // 5195
AM=M+1 // 5196
A=A-1 // 5197
M=D // 5198
@SP // 5199
AM=M+1 // 5200
A=A-1 // 5201
M=0 // 5202
@SP // 5203
AM=M+1 // 5204
A=A-1 // 5205
M=0 // 5206
@SP // 5207
AM=M+1 // 5208
A=A-1 // 5209
M=0 // 5210
// call Output.create
@17 // 5211
D=A // 5212
@14 // 5213
M=D // 5214
@Output.create // 5215
D=A // 5216
@13 // 5217
M=D // 5218
@Output.initMap.ret.13 // 5219
D=A // 5220
@CALL // 5221
0;JMP // 5222
(Output.initMap.ret.13)
@SP // 5223
M=M-1 // 5224

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5225
D=A // 5226
@SP // 5227
M=D+M // 5228
@44 // 5229
D=A // 5230
@SP // 5231
A=M-1 // 5232
M=0 // 5233
A=A-1 // 5234
M=0 // 5235
A=A-1 // 5236
M=0 // 5237
A=A-1 // 5238
M=0 // 5239
A=A-1 // 5240
M=0 // 5241
A=A-1 // 5242
M=0 // 5243
A=A-1 // 5244
M=0 // 5245
A=A-1 // 5246
M=D // 5247
A=A-1 // 5248
@12 // 5249
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
@6 // 5261
D=A // 5262
@SP // 5263
AM=M+1 // 5264
A=A-1 // 5265
M=D // 5266
@SP // 5267
AM=M+1 // 5268
A=A-1 // 5269
M=0 // 5270
// call Output.create
@17 // 5271
D=A // 5272
@14 // 5273
M=D // 5274
@Output.create // 5275
D=A // 5276
@13 // 5277
M=D // 5278
@Output.initMap.ret.14 // 5279
D=A // 5280
@CALL // 5281
0;JMP // 5282
(Output.initMap.ret.14)
@SP // 5283
M=M-1 // 5284

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5285
D=A // 5286
@SP // 5287
M=D+M // 5288
@45 // 5289
D=A // 5290
@SP // 5291
A=M-1 // 5292
M=0 // 5293
A=A-1 // 5294
M=0 // 5295
A=A-1 // 5296
M=0 // 5297
A=A-1 // 5298
M=0 // 5299
A=A-1 // 5300
M=0 // 5301
A=A-1 // 5302
M=D // 5303
A=A-1 // 5304
@6 // 5305
D=A // 5306
@SP // 5307
M=D+M // 5308
@63 // 5309
D=A // 5310
@SP // 5311
A=M-1 // 5312
M=0 // 5313
A=A-1 // 5314
M=0 // 5315
A=A-1 // 5316
M=0 // 5317
A=A-1 // 5318
M=0 // 5319
A=A-1 // 5320
M=0 // 5321
A=A-1 // 5322
M=D // 5323
A=A-1 // 5324
// call Output.create
@17 // 5325
D=A // 5326
@14 // 5327
M=D // 5328
@Output.create // 5329
D=A // 5330
@13 // 5331
M=D // 5332
@Output.initMap.ret.15 // 5333
D=A // 5334
@CALL // 5335
0;JMP // 5336
(Output.initMap.ret.15)
@SP // 5337
M=M-1 // 5338

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5339
D=A // 5340
@SP // 5341
M=D+M // 5342
@46 // 5343
D=A // 5344
@SP // 5345
A=M-1 // 5346
M=0 // 5347
A=A-1 // 5348
M=0 // 5349
A=A-1 // 5350
M=0 // 5351
A=A-1 // 5352
M=0 // 5353
A=A-1 // 5354
M=0 // 5355
A=A-1 // 5356
M=0 // 5357
A=A-1 // 5358
M=0 // 5359
A=A-1 // 5360
M=D // 5361
A=A-1 // 5362
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
A=A-1 // 5378
// call Output.create
@17 // 5379
D=A // 5380
@14 // 5381
M=D // 5382
@Output.create // 5383
D=A // 5384
@13 // 5385
M=D // 5386
@Output.initMap.ret.16 // 5387
D=A // 5388
@CALL // 5389
0;JMP // 5390
(Output.initMap.ret.16)
@SP // 5391
M=M-1 // 5392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5393
D=A // 5394
@SP // 5395
M=D+M // 5396
@47 // 5397
D=A // 5398
@SP // 5399
A=M-1 // 5400
M=0 // 5401
A=A-1 // 5402
M=0 // 5403
A=A-1 // 5404
M=D // 5405
A=A-1 // 5406
@32 // 5407
D=A // 5408
@SP // 5409
AM=M+1 // 5410
A=A-1 // 5411
M=D // 5412
@48 // 5413
D=A // 5414
@SP // 5415
AM=M+1 // 5416
A=A-1 // 5417
M=D // 5418
@24 // 5419
D=A // 5420
@SP // 5421
AM=M+1 // 5422
A=A-1 // 5423
M=D // 5424
@12 // 5425
D=A // 5426
@SP // 5427
AM=M+1 // 5428
A=A-1 // 5429
M=D // 5430
@6 // 5431
D=A // 5432
@SP // 5433
AM=M+1 // 5434
A=A-1 // 5435
M=D // 5436
@3 // 5437
D=A // 5438
@SP // 5439
AM=M+1 // 5440
A=A-1 // 5441
M=D // 5442
@SP // 5443
AM=M+1 // 5444
A=A-1 // 5445
M=1 // 5446
@SP // 5447
AM=M+1 // 5448
A=A-1 // 5449
M=0 // 5450
@SP // 5451
AM=M+1 // 5452
A=A-1 // 5453
M=0 // 5454
// call Output.create
@17 // 5455
D=A // 5456
@14 // 5457
M=D // 5458
@Output.create // 5459
D=A // 5460
@13 // 5461
M=D // 5462
@Output.initMap.ret.17 // 5463
D=A // 5464
@CALL // 5465
0;JMP // 5466
(Output.initMap.ret.17)
@SP // 5467
M=M-1 // 5468

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 5469
D=A // 5470
@SP // 5471
AM=M+1 // 5472
A=A-1 // 5473
M=D // 5474
@12 // 5475
D=A // 5476
@SP // 5477
AM=M+1 // 5478
A=A-1 // 5479
M=D // 5480
@30 // 5481
D=A // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=D // 5486
@51 // 5487
D=A // 5488
@SP // 5489
AM=M+1 // 5490
A=A-1 // 5491
M=D // 5492
@51 // 5493
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
@51 // 5505
D=A // 5506
@SP // 5507
AM=M+1 // 5508
A=A-1 // 5509
M=D // 5510
@51 // 5511
D=A // 5512
@SP // 5513
AM=M+1 // 5514
A=A-1 // 5515
M=D // 5516
@30 // 5517
D=A // 5518
@SP // 5519
AM=M+1 // 5520
A=A-1 // 5521
M=D // 5522
@12 // 5523
D=A // 5524
@SP // 5525
AM=M+1 // 5526
A=A-1 // 5527
M=D // 5528
@SP // 5529
AM=M+1 // 5530
A=A-1 // 5531
M=0 // 5532
@SP // 5533
AM=M+1 // 5534
A=A-1 // 5535
M=0 // 5536
// call Output.create
@17 // 5537
D=A // 5538
@14 // 5539
M=D // 5540
@Output.create // 5541
D=A // 5542
@13 // 5543
M=D // 5544
@Output.initMap.ret.18 // 5545
D=A // 5546
@CALL // 5547
0;JMP // 5548
(Output.initMap.ret.18)
@SP // 5549
M=M-1 // 5550

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 5551
D=A // 5552
@SP // 5553
AM=M+1 // 5554
A=A-1 // 5555
M=D // 5556
@12 // 5557
D=A // 5558
@SP // 5559
AM=M+1 // 5560
A=A-1 // 5561
M=D // 5562
@14 // 5563
D=A // 5564
@SP // 5565
AM=M+1 // 5566
A=A-1 // 5567
M=D // 5568
@15 // 5569
D=A // 5570
@SP // 5571
AM=M+1 // 5572
A=A-1 // 5573
M=D // 5574
@12 // 5575
D=A // 5576
@SP // 5577
AM=M+1 // 5578
A=A-1 // 5579
M=D // 5580
@12 // 5581
D=A // 5582
@SP // 5583
AM=M+1 // 5584
A=A-1 // 5585
M=D // 5586
@12 // 5587
D=A // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=D // 5592
@12 // 5593
D=A // 5594
@SP // 5595
AM=M+1 // 5596
A=A-1 // 5597
M=D // 5598
@12 // 5599
D=A // 5600
@SP // 5601
AM=M+1 // 5602
A=A-1 // 5603
M=D // 5604
@63 // 5605
D=A // 5606
@SP // 5607
AM=M+1 // 5608
A=A-1 // 5609
M=D // 5610
@SP // 5611
AM=M+1 // 5612
A=A-1 // 5613
M=0 // 5614
@SP // 5615
AM=M+1 // 5616
A=A-1 // 5617
M=0 // 5618
// call Output.create
@17 // 5619
D=A // 5620
@14 // 5621
M=D // 5622
@Output.create // 5623
D=A // 5624
@13 // 5625
M=D // 5626
@Output.initMap.ret.19 // 5627
D=A // 5628
@CALL // 5629
0;JMP // 5630
(Output.initMap.ret.19)
@SP // 5631
M=M-1 // 5632

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 5633
D=A // 5634
@SP // 5635
AM=M+1 // 5636
A=A-1 // 5637
M=D // 5638
@30 // 5639
D=A // 5640
@SP // 5641
AM=M+1 // 5642
A=A-1 // 5643
M=D // 5644
@51 // 5645
D=A // 5646
@SP // 5647
AM=M+1 // 5648
A=A-1 // 5649
M=D // 5650
@48 // 5651
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
@12 // 5663
D=A // 5664
@SP // 5665
AM=M+1 // 5666
A=A-1 // 5667
M=D // 5668
@6 // 5669
D=A // 5670
@SP // 5671
AM=M+1 // 5672
A=A-1 // 5673
M=D // 5674
@3 // 5675
D=A // 5676
@SP // 5677
AM=M+1 // 5678
A=A-1 // 5679
M=D // 5680
@51 // 5681
D=A // 5682
@SP // 5683
AM=M+1 // 5684
A=A-1 // 5685
M=D // 5686
@63 // 5687
D=A // 5688
@SP // 5689
AM=M+1 // 5690
A=A-1 // 5691
M=D // 5692
@SP // 5693
AM=M+1 // 5694
A=A-1 // 5695
M=0 // 5696
@SP // 5697
AM=M+1 // 5698
A=A-1 // 5699
M=0 // 5700
// call Output.create
@17 // 5701
D=A // 5702
@14 // 5703
M=D // 5704
@Output.create // 5705
D=A // 5706
@13 // 5707
M=D // 5708
@Output.initMap.ret.20 // 5709
D=A // 5710
@CALL // 5711
0;JMP // 5712
(Output.initMap.ret.20)
@SP // 5713
M=M-1 // 5714

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 5715
D=A // 5716
@SP // 5717
AM=M+1 // 5718
A=A-1 // 5719
M=D // 5720
@30 // 5721
D=A // 5722
@SP // 5723
AM=M+1 // 5724
A=A-1 // 5725
M=D // 5726
@51 // 5727
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
@28 // 5745
D=A // 5746
@SP // 5747
AM=M+1 // 5748
A=A-1 // 5749
M=D // 5750
@48 // 5751
D=A // 5752
@SP // 5753
AM=M+1 // 5754
A=A-1 // 5755
M=D // 5756
@48 // 5757
D=A // 5758
@SP // 5759
AM=M+1 // 5760
A=A-1 // 5761
M=D // 5762
@51 // 5763
D=A // 5764
@SP // 5765
AM=M+1 // 5766
A=A-1 // 5767
M=D // 5768
@30 // 5769
D=A // 5770
@SP // 5771
AM=M+1 // 5772
A=A-1 // 5773
M=D // 5774
@SP // 5775
AM=M+1 // 5776
A=A-1 // 5777
M=0 // 5778
@SP // 5779
AM=M+1 // 5780
A=A-1 // 5781
M=0 // 5782
// call Output.create
@17 // 5783
D=A // 5784
@14 // 5785
M=D // 5786
@Output.create // 5787
D=A // 5788
@13 // 5789
M=D // 5790
@Output.initMap.ret.21 // 5791
D=A // 5792
@CALL // 5793
0;JMP // 5794
(Output.initMap.ret.21)
@SP // 5795
M=M-1 // 5796

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 5797
D=A // 5798
@SP // 5799
AM=M+1 // 5800
A=A-1 // 5801
M=D // 5802
@16 // 5803
D=A // 5804
@SP // 5805
AM=M+1 // 5806
A=A-1 // 5807
M=D // 5808
@24 // 5809
D=A // 5810
@SP // 5811
AM=M+1 // 5812
A=A-1 // 5813
M=D // 5814
@28 // 5815
D=A // 5816
@SP // 5817
AM=M+1 // 5818
A=A-1 // 5819
M=D // 5820
@26 // 5821
D=A // 5822
@SP // 5823
AM=M+1 // 5824
A=A-1 // 5825
M=D // 5826
@25 // 5827
D=A // 5828
@SP // 5829
AM=M+1 // 5830
A=A-1 // 5831
M=D // 5832
@63 // 5833
D=A // 5834
@SP // 5835
AM=M+1 // 5836
A=A-1 // 5837
M=D // 5838
@24 // 5839
D=A // 5840
@SP // 5841
AM=M+1 // 5842
A=A-1 // 5843
M=D // 5844
@24 // 5845
D=A // 5846
@SP // 5847
AM=M+1 // 5848
A=A-1 // 5849
M=D // 5850
@60 // 5851
D=A // 5852
@SP // 5853
AM=M+1 // 5854
A=A-1 // 5855
M=D // 5856
@SP // 5857
AM=M+1 // 5858
A=A-1 // 5859
M=0 // 5860
@SP // 5861
AM=M+1 // 5862
A=A-1 // 5863
M=0 // 5864
// call Output.create
@17 // 5865
D=A // 5866
@14 // 5867
M=D // 5868
@Output.create // 5869
D=A // 5870
@13 // 5871
M=D // 5872
@Output.initMap.ret.22 // 5873
D=A // 5874
@CALL // 5875
0;JMP // 5876
(Output.initMap.ret.22)
@SP // 5877
M=M-1 // 5878

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 5879
D=A // 5880
@SP // 5881
AM=M+1 // 5882
A=A-1 // 5883
M=D // 5884
@63 // 5885
D=A // 5886
@SP // 5887
AM=M+1 // 5888
A=A-1 // 5889
M=D // 5890
@3 // 5891
D=A // 5892
@SP // 5893
AM=M+1 // 5894
A=A-1 // 5895
M=D // 5896
@3 // 5897
D=A // 5898
@SP // 5899
AM=M+1 // 5900
A=A-1 // 5901
M=D // 5902
@31 // 5903
D=A // 5904
@SP // 5905
AM=M+1 // 5906
A=A-1 // 5907
M=D // 5908
@48 // 5909
D=A // 5910
@SP // 5911
AM=M+1 // 5912
A=A-1 // 5913
M=D // 5914
@48 // 5915
D=A // 5916
@SP // 5917
AM=M+1 // 5918
A=A-1 // 5919
M=D // 5920
@48 // 5921
D=A // 5922
@SP // 5923
AM=M+1 // 5924
A=A-1 // 5925
M=D // 5926
@51 // 5927
D=A // 5928
@SP // 5929
AM=M+1 // 5930
A=A-1 // 5931
M=D // 5932
@30 // 5933
D=A // 5934
@SP // 5935
AM=M+1 // 5936
A=A-1 // 5937
M=D // 5938
@SP // 5939
AM=M+1 // 5940
A=A-1 // 5941
M=0 // 5942
@SP // 5943
AM=M+1 // 5944
A=A-1 // 5945
M=0 // 5946
// call Output.create
@17 // 5947
D=A // 5948
@14 // 5949
M=D // 5950
@Output.create // 5951
D=A // 5952
@13 // 5953
M=D // 5954
@Output.initMap.ret.23 // 5955
D=A // 5956
@CALL // 5957
0;JMP // 5958
(Output.initMap.ret.23)
@SP // 5959
M=M-1 // 5960

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 5961
D=A // 5962
@SP // 5963
AM=M+1 // 5964
A=A-1 // 5965
M=D // 5966
@28 // 5967
D=A // 5968
@SP // 5969
AM=M+1 // 5970
A=A-1 // 5971
M=D // 5972
@6 // 5973
D=A // 5974
@SP // 5975
AM=M+1 // 5976
A=A-1 // 5977
M=D // 5978
@3 // 5979
D=A // 5980
@SP // 5981
AM=M+1 // 5982
A=A-1 // 5983
M=D // 5984
@3 // 5985
D=A // 5986
@SP // 5987
AM=M+1 // 5988
A=A-1 // 5989
M=D // 5990
@31 // 5991
D=A // 5992
@SP // 5993
AM=M+1 // 5994
A=A-1 // 5995
M=D // 5996
@51 // 5997
D=A // 5998
@SP // 5999
AM=M+1 // 6000
A=A-1 // 6001
M=D // 6002
@51 // 6003
D=A // 6004
@SP // 6005
AM=M+1 // 6006
A=A-1 // 6007
M=D // 6008
@51 // 6009
D=A // 6010
@SP // 6011
AM=M+1 // 6012
A=A-1 // 6013
M=D // 6014
@30 // 6015
D=A // 6016
@SP // 6017
AM=M+1 // 6018
A=A-1 // 6019
M=D // 6020
@SP // 6021
AM=M+1 // 6022
A=A-1 // 6023
M=0 // 6024
@SP // 6025
AM=M+1 // 6026
A=A-1 // 6027
M=0 // 6028
// call Output.create
@17 // 6029
D=A // 6030
@14 // 6031
M=D // 6032
@Output.create // 6033
D=A // 6034
@13 // 6035
M=D // 6036
@Output.initMap.ret.24 // 6037
D=A // 6038
@CALL // 6039
0;JMP // 6040
(Output.initMap.ret.24)
@SP // 6041
M=M-1 // 6042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6043
D=A // 6044
@SP // 6045
AM=M+1 // 6046
A=A-1 // 6047
M=D // 6048
@63 // 6049
D=A // 6050
@SP // 6051
AM=M+1 // 6052
A=A-1 // 6053
M=D // 6054
@49 // 6055
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
@12 // 6079
D=A // 6080
@SP // 6081
AM=M+1 // 6082
A=A-1 // 6083
M=D // 6084
@12 // 6085
D=A // 6086
@SP // 6087
AM=M+1 // 6088
A=A-1 // 6089
M=D // 6090
@12 // 6091
D=A // 6092
@SP // 6093
AM=M+1 // 6094
A=A-1 // 6095
M=D // 6096
@12 // 6097
D=A // 6098
@SP // 6099
AM=M+1 // 6100
A=A-1 // 6101
M=D // 6102
@SP // 6103
AM=M+1 // 6104
A=A-1 // 6105
M=0 // 6106
@SP // 6107
AM=M+1 // 6108
A=A-1 // 6109
M=0 // 6110
// call Output.create
@17 // 6111
D=A // 6112
@14 // 6113
M=D // 6114
@Output.create // 6115
D=A // 6116
@13 // 6117
M=D // 6118
@Output.initMap.ret.25 // 6119
D=A // 6120
@CALL // 6121
0;JMP // 6122
(Output.initMap.ret.25)
@SP // 6123
M=M-1 // 6124

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 6125
D=A // 6126
@SP // 6127
AM=M+1 // 6128
A=A-1 // 6129
M=D // 6130
@30 // 6131
D=A // 6132
@SP // 6133
AM=M+1 // 6134
A=A-1 // 6135
M=D // 6136
@51 // 6137
D=A // 6138
@SP // 6139
AM=M+1 // 6140
A=A-1 // 6141
M=D // 6142
@51 // 6143
D=A // 6144
@SP // 6145
AM=M+1 // 6146
A=A-1 // 6147
M=D // 6148
@51 // 6149
D=A // 6150
@SP // 6151
AM=M+1 // 6152
A=A-1 // 6153
M=D // 6154
@30 // 6155
D=A // 6156
@SP // 6157
AM=M+1 // 6158
A=A-1 // 6159
M=D // 6160
@51 // 6161
D=A // 6162
@SP // 6163
AM=M+1 // 6164
A=A-1 // 6165
M=D // 6166
@51 // 6167
D=A // 6168
@SP // 6169
AM=M+1 // 6170
A=A-1 // 6171
M=D // 6172
@51 // 6173
D=A // 6174
@SP // 6175
AM=M+1 // 6176
A=A-1 // 6177
M=D // 6178
@30 // 6179
D=A // 6180
@SP // 6181
AM=M+1 // 6182
A=A-1 // 6183
M=D // 6184
@SP // 6185
AM=M+1 // 6186
A=A-1 // 6187
M=0 // 6188
@SP // 6189
AM=M+1 // 6190
A=A-1 // 6191
M=0 // 6192
// call Output.create
@17 // 6193
D=A // 6194
@14 // 6195
M=D // 6196
@Output.create // 6197
D=A // 6198
@13 // 6199
M=D // 6200
@Output.initMap.ret.26 // 6201
D=A // 6202
@CALL // 6203
0;JMP // 6204
(Output.initMap.ret.26)
@SP // 6205
M=M-1 // 6206

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6207
D=A // 6208
@SP // 6209
AM=M+1 // 6210
A=A-1 // 6211
M=D // 6212
@30 // 6213
D=A // 6214
@SP // 6215
AM=M+1 // 6216
A=A-1 // 6217
M=D // 6218
@51 // 6219
D=A // 6220
@SP // 6221
AM=M+1 // 6222
A=A-1 // 6223
M=D // 6224
@51 // 6225
D=A // 6226
@SP // 6227
AM=M+1 // 6228
A=A-1 // 6229
M=D // 6230
@51 // 6231
D=A // 6232
@SP // 6233
AM=M+1 // 6234
A=A-1 // 6235
M=D // 6236
@62 // 6237
D=A // 6238
@SP // 6239
AM=M+1 // 6240
A=A-1 // 6241
M=D // 6242
@48 // 6243
D=A // 6244
@SP // 6245
AM=M+1 // 6246
A=A-1 // 6247
M=D // 6248
@48 // 6249
D=A // 6250
@SP // 6251
AM=M+1 // 6252
A=A-1 // 6253
M=D // 6254
@24 // 6255
D=A // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=D // 6260
@14 // 6261
D=A // 6262
@SP // 6263
AM=M+1 // 6264
A=A-1 // 6265
M=D // 6266
@SP // 6267
AM=M+1 // 6268
A=A-1 // 6269
M=0 // 6270
@SP // 6271
AM=M+1 // 6272
A=A-1 // 6273
M=0 // 6274
// call Output.create
@17 // 6275
D=A // 6276
@14 // 6277
M=D // 6278
@Output.create // 6279
D=A // 6280
@13 // 6281
M=D // 6282
@Output.initMap.ret.27 // 6283
D=A // 6284
@CALL // 6285
0;JMP // 6286
(Output.initMap.ret.27)
@SP // 6287
M=M-1 // 6288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6289
D=A // 6290
@SP // 6291
M=D+M // 6292
@58 // 6293
D=A // 6294
@SP // 6295
A=M-1 // 6296
M=0 // 6297
A=A-1 // 6298
M=0 // 6299
A=A-1 // 6300
M=D // 6301
A=A-1 // 6302
@4 // 6303
D=A // 6304
@SP // 6305
M=D+M // 6306
@12 // 6307
D=A // 6308
@SP // 6309
A=M-1 // 6310
M=0 // 6311
A=A-1 // 6312
M=0 // 6313
A=A-1 // 6314
M=D // 6315
A=A-1 // 6316
M=D // 6317
A=A-1 // 6318
@5 // 6319
D=A // 6320
@SP // 6321
M=D+M // 6322
@12 // 6323
D=A // 6324
@SP // 6325
A=M-1 // 6326
M=0 // 6327
A=A-1 // 6328
M=0 // 6329
A=A-1 // 6330
M=0 // 6331
A=A-1 // 6332
M=D // 6333
A=A-1 // 6334
M=D // 6335
A=A-1 // 6336
// call Output.create
@17 // 6337
D=A // 6338
@14 // 6339
M=D // 6340
@Output.create // 6341
D=A // 6342
@13 // 6343
M=D // 6344
@Output.initMap.ret.28 // 6345
D=A // 6346
@CALL // 6347
0;JMP // 6348
(Output.initMap.ret.28)
@SP // 6349
M=M-1 // 6350

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6351
D=A // 6352
@SP // 6353
M=D+M // 6354
@59 // 6355
D=A // 6356
@SP // 6357
A=M-1 // 6358
M=0 // 6359
A=A-1 // 6360
M=0 // 6361
A=A-1 // 6362
M=D // 6363
A=A-1 // 6364
@4 // 6365
D=A // 6366
@SP // 6367
M=D+M // 6368
@12 // 6369
D=A // 6370
@SP // 6371
A=M-1 // 6372
M=0 // 6373
A=A-1 // 6374
M=0 // 6375
A=A-1 // 6376
M=D // 6377
A=A-1 // 6378
M=D // 6379
A=A-1 // 6380
@12 // 6381
D=A // 6382
@SP // 6383
AM=M+1 // 6384
A=A-1 // 6385
M=D // 6386
@12 // 6387
D=A // 6388
@SP // 6389
AM=M+1 // 6390
A=A-1 // 6391
M=D // 6392
@6 // 6393
D=A // 6394
@SP // 6395
AM=M+1 // 6396
A=A-1 // 6397
M=D // 6398
@SP // 6399
AM=M+1 // 6400
A=A-1 // 6401
M=0 // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=0 // 6406
// call Output.create
@17 // 6407
D=A // 6408
@14 // 6409
M=D // 6410
@Output.create // 6411
D=A // 6412
@13 // 6413
M=D // 6414
@Output.initMap.ret.29 // 6415
D=A // 6416
@CALL // 6417
0;JMP // 6418
(Output.initMap.ret.29)
@SP // 6419
M=M-1 // 6420

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6421
D=A // 6422
@SP // 6423
M=D+M // 6424
@60 // 6425
D=A // 6426
@SP // 6427
A=M-1 // 6428
M=0 // 6429
A=A-1 // 6430
M=0 // 6431
A=A-1 // 6432
M=D // 6433
A=A-1 // 6434
@24 // 6435
D=A // 6436
@SP // 6437
AM=M+1 // 6438
A=A-1 // 6439
M=D // 6440
@12 // 6441
D=A // 6442
@SP // 6443
AM=M+1 // 6444
A=A-1 // 6445
M=D // 6446
@6 // 6447
D=A // 6448
@SP // 6449
AM=M+1 // 6450
A=A-1 // 6451
M=D // 6452
@3 // 6453
D=A // 6454
@SP // 6455
AM=M+1 // 6456
A=A-1 // 6457
M=D // 6458
@6 // 6459
D=A // 6460
@SP // 6461
AM=M+1 // 6462
A=A-1 // 6463
M=D // 6464
@12 // 6465
D=A // 6466
@SP // 6467
AM=M+1 // 6468
A=A-1 // 6469
M=D // 6470
@24 // 6471
D=A // 6472
@SP // 6473
AM=M+1 // 6474
A=A-1 // 6475
M=D // 6476
@SP // 6477
AM=M+1 // 6478
A=A-1 // 6479
M=0 // 6480
@SP // 6481
AM=M+1 // 6482
A=A-1 // 6483
M=0 // 6484
// call Output.create
@17 // 6485
D=A // 6486
@14 // 6487
M=D // 6488
@Output.create // 6489
D=A // 6490
@13 // 6491
M=D // 6492
@Output.initMap.ret.30 // 6493
D=A // 6494
@CALL // 6495
0;JMP // 6496
(Output.initMap.ret.30)
@SP // 6497
M=M-1 // 6498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6499
D=A // 6500
@SP // 6501
M=D+M // 6502
@61 // 6503
D=A // 6504
@SP // 6505
A=M-1 // 6506
M=0 // 6507
A=A-1 // 6508
M=0 // 6509
A=A-1 // 6510
M=0 // 6511
A=A-1 // 6512
M=D // 6513
A=A-1 // 6514
@3 // 6515
D=A // 6516
@SP // 6517
M=D+M // 6518
@63 // 6519
D=A // 6520
@SP // 6521
A=M-1 // 6522
M=0 // 6523
A=A-1 // 6524
M=0 // 6525
A=A-1 // 6526
M=D // 6527
A=A-1 // 6528
@5 // 6529
D=A // 6530
@SP // 6531
M=D+M // 6532
@63 // 6533
D=A // 6534
@SP // 6535
A=M-1 // 6536
M=0 // 6537
A=A-1 // 6538
M=0 // 6539
A=A-1 // 6540
M=0 // 6541
A=A-1 // 6542
M=0 // 6543
A=A-1 // 6544
M=D // 6545
A=A-1 // 6546
// call Output.create
@17 // 6547
D=A // 6548
@14 // 6549
M=D // 6550
@Output.create // 6551
D=A // 6552
@13 // 6553
M=D // 6554
@Output.initMap.ret.31 // 6555
D=A // 6556
@CALL // 6557
0;JMP // 6558
(Output.initMap.ret.31)
@SP // 6559
M=M-1 // 6560

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6561
D=A // 6562
@SP // 6563
M=D+M // 6564
@62 // 6565
D=A // 6566
@SP // 6567
A=M-1 // 6568
M=0 // 6569
A=A-1 // 6570
M=0 // 6571
A=A-1 // 6572
M=D // 6573
A=A-1 // 6574
@3 // 6575
D=A // 6576
@SP // 6577
AM=M+1 // 6578
A=A-1 // 6579
M=D // 6580
@6 // 6581
D=A // 6582
@SP // 6583
AM=M+1 // 6584
A=A-1 // 6585
M=D // 6586
@12 // 6587
D=A // 6588
@SP // 6589
AM=M+1 // 6590
A=A-1 // 6591
M=D // 6592
@24 // 6593
D=A // 6594
@SP // 6595
AM=M+1 // 6596
A=A-1 // 6597
M=D // 6598
@12 // 6599
D=A // 6600
@SP // 6601
AM=M+1 // 6602
A=A-1 // 6603
M=D // 6604
@6 // 6605
D=A // 6606
@SP // 6607
AM=M+1 // 6608
A=A-1 // 6609
M=D // 6610
@3 // 6611
D=A // 6612
@SP // 6613
AM=M+1 // 6614
A=A-1 // 6615
M=D // 6616
@SP // 6617
AM=M+1 // 6618
A=A-1 // 6619
M=0 // 6620
@SP // 6621
AM=M+1 // 6622
A=A-1 // 6623
M=0 // 6624
// call Output.create
@17 // 6625
D=A // 6626
@14 // 6627
M=D // 6628
@Output.create // 6629
D=A // 6630
@13 // 6631
M=D // 6632
@Output.initMap.ret.32 // 6633
D=A // 6634
@CALL // 6635
0;JMP // 6636
(Output.initMap.ret.32)
@SP // 6637
M=M-1 // 6638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 6639
D=A // 6640
@SP // 6641
AM=M+1 // 6642
A=A-1 // 6643
M=D // 6644
@30 // 6645
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
@59 // 6663
D=A // 6664
@SP // 6665
AM=M+1 // 6666
A=A-1 // 6667
M=D // 6668
@59 // 6669
D=A // 6670
@SP // 6671
AM=M+1 // 6672
A=A-1 // 6673
M=D // 6674
@59 // 6675
D=A // 6676
@SP // 6677
AM=M+1 // 6678
A=A-1 // 6679
M=D // 6680
@27 // 6681
D=A // 6682
@SP // 6683
AM=M+1 // 6684
A=A-1 // 6685
M=D // 6686
@3 // 6687
D=A // 6688
@SP // 6689
AM=M+1 // 6690
A=A-1 // 6691
M=D // 6692
@30 // 6693
D=A // 6694
@SP // 6695
AM=M+1 // 6696
A=A-1 // 6697
M=D // 6698
@SP // 6699
AM=M+1 // 6700
A=A-1 // 6701
M=0 // 6702
@SP // 6703
AM=M+1 // 6704
A=A-1 // 6705
M=0 // 6706
// call Output.create
@17 // 6707
D=A // 6708
@14 // 6709
M=D // 6710
@Output.create // 6711
D=A // 6712
@13 // 6713
M=D // 6714
@Output.initMap.ret.33 // 6715
D=A // 6716
@CALL // 6717
0;JMP // 6718
(Output.initMap.ret.33)
@SP // 6719
M=M-1 // 6720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 6721
D=A // 6722
@SP // 6723
AM=M+1 // 6724
A=A-1 // 6725
M=D // 6726
@30 // 6727
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
@24 // 6745
D=A // 6746
@SP // 6747
AM=M+1 // 6748
A=A-1 // 6749
M=D // 6750
@12 // 6751
D=A // 6752
@SP // 6753
AM=M+1 // 6754
A=A-1 // 6755
M=D // 6756
@12 // 6757
D=A // 6758
@SP // 6759
AM=M+1 // 6760
A=A-1 // 6761
M=D // 6762
@SP // 6763
AM=M+1 // 6764
A=A-1 // 6765
M=0 // 6766
@4 // 6767
D=A // 6768
@SP // 6769
M=D+M // 6770
@12 // 6771
D=A // 6772
@SP // 6773
A=M-1 // 6774
M=0 // 6775
A=A-1 // 6776
M=0 // 6777
A=A-1 // 6778
M=D // 6779
A=A-1 // 6780
M=D // 6781
A=A-1 // 6782
// call Output.create
@17 // 6783
D=A // 6784
@14 // 6785
M=D // 6786
@Output.create // 6787
D=A // 6788
@13 // 6789
M=D // 6790
@Output.initMap.ret.34 // 6791
D=A // 6792
@CALL // 6793
0;JMP // 6794
(Output.initMap.ret.34)
@SP // 6795
M=M-1 // 6796

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 6797
D=A // 6798
@SP // 6799
AM=M+1 // 6800
A=A-1 // 6801
M=D // 6802
@12 // 6803
D=A // 6804
@SP // 6805
AM=M+1 // 6806
A=A-1 // 6807
M=D // 6808
@30 // 6809
D=A // 6810
@SP // 6811
AM=M+1 // 6812
A=A-1 // 6813
M=D // 6814
@51 // 6815
D=A // 6816
@SP // 6817
AM=M+1 // 6818
A=A-1 // 6819
M=D // 6820
@51 // 6821
D=A // 6822
@SP // 6823
AM=M+1 // 6824
A=A-1 // 6825
M=D // 6826
@63 // 6827
D=A // 6828
@SP // 6829
AM=M+1 // 6830
A=A-1 // 6831
M=D // 6832
@51 // 6833
D=A // 6834
@SP // 6835
AM=M+1 // 6836
A=A-1 // 6837
M=D // 6838
@51 // 6839
D=A // 6840
@SP // 6841
AM=M+1 // 6842
A=A-1 // 6843
M=D // 6844
@51 // 6845
D=A // 6846
@SP // 6847
AM=M+1 // 6848
A=A-1 // 6849
M=D // 6850
@51 // 6851
D=A // 6852
@SP // 6853
AM=M+1 // 6854
A=A-1 // 6855
M=D // 6856
@SP // 6857
AM=M+1 // 6858
A=A-1 // 6859
M=0 // 6860
@SP // 6861
AM=M+1 // 6862
A=A-1 // 6863
M=0 // 6864
// call Output.create
@17 // 6865
D=A // 6866
@14 // 6867
M=D // 6868
@Output.create // 6869
D=A // 6870
@13 // 6871
M=D // 6872
@Output.initMap.ret.35 // 6873
D=A // 6874
@CALL // 6875
0;JMP // 6876
(Output.initMap.ret.35)
@SP // 6877
M=M-1 // 6878

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 6879
D=A // 6880
@SP // 6881
AM=M+1 // 6882
A=A-1 // 6883
M=D // 6884
@31 // 6885
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
@31 // 6909
D=A // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=D // 6914
@51 // 6915
D=A // 6916
@SP // 6917
AM=M+1 // 6918
A=A-1 // 6919
M=D // 6920
@51 // 6921
D=A // 6922
@SP // 6923
AM=M+1 // 6924
A=A-1 // 6925
M=D // 6926
@51 // 6927
D=A // 6928
@SP // 6929
AM=M+1 // 6930
A=A-1 // 6931
M=D // 6932
@31 // 6933
D=A // 6934
@SP // 6935
AM=M+1 // 6936
A=A-1 // 6937
M=D // 6938
@SP // 6939
AM=M+1 // 6940
A=A-1 // 6941
M=0 // 6942
@SP // 6943
AM=M+1 // 6944
A=A-1 // 6945
M=0 // 6946
// call Output.create
@17 // 6947
D=A // 6948
@14 // 6949
M=D // 6950
@Output.create // 6951
D=A // 6952
@13 // 6953
M=D // 6954
@Output.initMap.ret.36 // 6955
D=A // 6956
@CALL // 6957
0;JMP // 6958
(Output.initMap.ret.36)
@SP // 6959
M=M-1 // 6960

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 6961
D=A // 6962
@SP // 6963
AM=M+1 // 6964
A=A-1 // 6965
M=D // 6966
@28 // 6967
D=A // 6968
@SP // 6969
AM=M+1 // 6970
A=A-1 // 6971
M=D // 6972
@54 // 6973
D=A // 6974
@SP // 6975
AM=M+1 // 6976
A=A-1 // 6977
M=D // 6978
@35 // 6979
D=A // 6980
@SP // 6981
AM=M+1 // 6982
A=A-1 // 6983
M=D // 6984
@3 // 6985
D=A // 6986
@SP // 6987
AM=M+1 // 6988
A=A-1 // 6989
M=D // 6990
@3 // 6991
D=A // 6992
@SP // 6993
AM=M+1 // 6994
A=A-1 // 6995
M=D // 6996
@3 // 6997
D=A // 6998
@SP // 6999
AM=M+1 // 7000
A=A-1 // 7001
M=D // 7002
@35 // 7003
D=A // 7004
@SP // 7005
AM=M+1 // 7006
A=A-1 // 7007
M=D // 7008
@54 // 7009
D=A // 7010
@SP // 7011
AM=M+1 // 7012
A=A-1 // 7013
M=D // 7014
@28 // 7015
D=A // 7016
@SP // 7017
AM=M+1 // 7018
A=A-1 // 7019
M=D // 7020
@SP // 7021
AM=M+1 // 7022
A=A-1 // 7023
M=0 // 7024
@SP // 7025
AM=M+1 // 7026
A=A-1 // 7027
M=0 // 7028
// call Output.create
@17 // 7029
D=A // 7030
@14 // 7031
M=D // 7032
@Output.create // 7033
D=A // 7034
@13 // 7035
M=D // 7036
@Output.initMap.ret.37 // 7037
D=A // 7038
@CALL // 7039
0;JMP // 7040
(Output.initMap.ret.37)
@SP // 7041
M=M-1 // 7042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7043
D=A // 7044
@SP // 7045
AM=M+1 // 7046
A=A-1 // 7047
M=D // 7048
@15 // 7049
D=A // 7050
@SP // 7051
AM=M+1 // 7052
A=A-1 // 7053
M=D // 7054
@27 // 7055
D=A // 7056
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=D // 7060
@51 // 7061
D=A // 7062
@SP // 7063
AM=M+1 // 7064
A=A-1 // 7065
M=D // 7066
@51 // 7067
D=A // 7068
@SP // 7069
AM=M+1 // 7070
A=A-1 // 7071
M=D // 7072
@51 // 7073
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
@51 // 7085
D=A // 7086
@SP // 7087
AM=M+1 // 7088
A=A-1 // 7089
M=D // 7090
@27 // 7091
D=A // 7092
@SP // 7093
AM=M+1 // 7094
A=A-1 // 7095
M=D // 7096
@15 // 7097
D=A // 7098
@SP // 7099
AM=M+1 // 7100
A=A-1 // 7101
M=D // 7102
@SP // 7103
AM=M+1 // 7104
A=A-1 // 7105
M=0 // 7106
@SP // 7107
AM=M+1 // 7108
A=A-1 // 7109
M=0 // 7110
// call Output.create
@17 // 7111
D=A // 7112
@14 // 7113
M=D // 7114
@Output.create // 7115
D=A // 7116
@13 // 7117
M=D // 7118
@Output.initMap.ret.38 // 7119
D=A // 7120
@CALL // 7121
0;JMP // 7122
(Output.initMap.ret.38)
@SP // 7123
M=M-1 // 7124

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 7125
D=A // 7126
@SP // 7127
AM=M+1 // 7128
A=A-1 // 7129
M=D // 7130
@63 // 7131
D=A // 7132
@SP // 7133
AM=M+1 // 7134
A=A-1 // 7135
M=D // 7136
@51 // 7137
D=A // 7138
@SP // 7139
AM=M+1 // 7140
A=A-1 // 7141
M=D // 7142
@35 // 7143
D=A // 7144
@SP // 7145
AM=M+1 // 7146
A=A-1 // 7147
M=D // 7148
@11 // 7149
D=A // 7150
@SP // 7151
AM=M+1 // 7152
A=A-1 // 7153
M=D // 7154
@15 // 7155
D=A // 7156
@SP // 7157
AM=M+1 // 7158
A=A-1 // 7159
M=D // 7160
@11 // 7161
D=A // 7162
@SP // 7163
AM=M+1 // 7164
A=A-1 // 7165
M=D // 7166
@35 // 7167
D=A // 7168
@SP // 7169
AM=M+1 // 7170
A=A-1 // 7171
M=D // 7172
@51 // 7173
D=A // 7174
@SP // 7175
AM=M+1 // 7176
A=A-1 // 7177
M=D // 7178
@63 // 7179
D=A // 7180
@SP // 7181
AM=M+1 // 7182
A=A-1 // 7183
M=D // 7184
@SP // 7185
AM=M+1 // 7186
A=A-1 // 7187
M=0 // 7188
@SP // 7189
AM=M+1 // 7190
A=A-1 // 7191
M=0 // 7192
// call Output.create
@17 // 7193
D=A // 7194
@14 // 7195
M=D // 7196
@Output.create // 7197
D=A // 7198
@13 // 7199
M=D // 7200
@Output.initMap.ret.39 // 7201
D=A // 7202
@CALL // 7203
0;JMP // 7204
(Output.initMap.ret.39)
@SP // 7205
M=M-1 // 7206

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7207
D=A // 7208
@SP // 7209
AM=M+1 // 7210
A=A-1 // 7211
M=D // 7212
@63 // 7213
D=A // 7214
@SP // 7215
AM=M+1 // 7216
A=A-1 // 7217
M=D // 7218
@51 // 7219
D=A // 7220
@SP // 7221
AM=M+1 // 7222
A=A-1 // 7223
M=D // 7224
@35 // 7225
D=A // 7226
@SP // 7227
AM=M+1 // 7228
A=A-1 // 7229
M=D // 7230
@11 // 7231
D=A // 7232
@SP // 7233
AM=M+1 // 7234
A=A-1 // 7235
M=D // 7236
@15 // 7237
D=A // 7238
@SP // 7239
AM=M+1 // 7240
A=A-1 // 7241
M=D // 7242
@11 // 7243
D=A // 7244
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=D // 7248
@3 // 7249
D=A // 7250
@SP // 7251
AM=M+1 // 7252
A=A-1 // 7253
M=D // 7254
@3 // 7255
D=A // 7256
@SP // 7257
AM=M+1 // 7258
A=A-1 // 7259
M=D // 7260
@3 // 7261
D=A // 7262
@SP // 7263
AM=M+1 // 7264
A=A-1 // 7265
M=D // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=0 // 7270
@SP // 7271
AM=M+1 // 7272
A=A-1 // 7273
M=0 // 7274
// call Output.create
@17 // 7275
D=A // 7276
@14 // 7277
M=D // 7278
@Output.create // 7279
D=A // 7280
@13 // 7281
M=D // 7282
@Output.initMap.ret.40 // 7283
D=A // 7284
@CALL // 7285
0;JMP // 7286
(Output.initMap.ret.40)
@SP // 7287
M=M-1 // 7288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7289
D=A // 7290
@SP // 7291
AM=M+1 // 7292
A=A-1 // 7293
M=D // 7294
@28 // 7295
D=A // 7296
@SP // 7297
AM=M+1 // 7298
A=A-1 // 7299
M=D // 7300
@54 // 7301
D=A // 7302
@SP // 7303
AM=M+1 // 7304
A=A-1 // 7305
M=D // 7306
@35 // 7307
D=A // 7308
@SP // 7309
AM=M+1 // 7310
A=A-1 // 7311
M=D // 7312
@3 // 7313
D=A // 7314
@SP // 7315
AM=M+1 // 7316
A=A-1 // 7317
M=D // 7318
@59 // 7319
D=A // 7320
@SP // 7321
AM=M+1 // 7322
A=A-1 // 7323
M=D // 7324
@51 // 7325
D=A // 7326
@SP // 7327
AM=M+1 // 7328
A=A-1 // 7329
M=D // 7330
@51 // 7331
D=A // 7332
@SP // 7333
AM=M+1 // 7334
A=A-1 // 7335
M=D // 7336
@54 // 7337
D=A // 7338
@SP // 7339
AM=M+1 // 7340
A=A-1 // 7341
M=D // 7342
@44 // 7343
D=A // 7344
@SP // 7345
AM=M+1 // 7346
A=A-1 // 7347
M=D // 7348
@SP // 7349
AM=M+1 // 7350
A=A-1 // 7351
M=0 // 7352
@SP // 7353
AM=M+1 // 7354
A=A-1 // 7355
M=0 // 7356
// call Output.create
@17 // 7357
D=A // 7358
@14 // 7359
M=D // 7360
@Output.create // 7361
D=A // 7362
@13 // 7363
M=D // 7364
@Output.initMap.ret.41 // 7365
D=A // 7366
@CALL // 7367
0;JMP // 7368
(Output.initMap.ret.41)
@SP // 7369
M=M-1 // 7370

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7371
D=A // 7372
@SP // 7373
AM=M+1 // 7374
A=A-1 // 7375
M=D // 7376
@51 // 7377
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
@63 // 7401
D=A // 7402
@SP // 7403
AM=M+1 // 7404
A=A-1 // 7405
M=D // 7406
@51 // 7407
D=A // 7408
@SP // 7409
AM=M+1 // 7410
A=A-1 // 7411
M=D // 7412
@51 // 7413
D=A // 7414
@SP // 7415
AM=M+1 // 7416
A=A-1 // 7417
M=D // 7418
@51 // 7419
D=A // 7420
@SP // 7421
AM=M+1 // 7422
A=A-1 // 7423
M=D // 7424
@51 // 7425
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
@Output.initMap.ret.42 // 7447
D=A // 7448
@CALL // 7449
0;JMP // 7450
(Output.initMap.ret.42)
@SP // 7451
M=M-1 // 7452

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 7453
D=A // 7454
@SP // 7455
AM=M+1 // 7456
A=A-1 // 7457
M=D // 7458
@30 // 7459
D=A // 7460
@SP // 7461
AM=M+1 // 7462
A=A-1 // 7463
M=D // 7464
@12 // 7465
D=A // 7466
@SP // 7467
AM=M+1 // 7468
A=A-1 // 7469
M=D // 7470
@12 // 7471
D=A // 7472
@SP // 7473
AM=M+1 // 7474
A=A-1 // 7475
M=D // 7476
@12 // 7477
D=A // 7478
@SP // 7479
AM=M+1 // 7480
A=A-1 // 7481
M=D // 7482
@12 // 7483
D=A // 7484
@SP // 7485
AM=M+1 // 7486
A=A-1 // 7487
M=D // 7488
@12 // 7489
D=A // 7490
@SP // 7491
AM=M+1 // 7492
A=A-1 // 7493
M=D // 7494
@12 // 7495
D=A // 7496
@SP // 7497
AM=M+1 // 7498
A=A-1 // 7499
M=D // 7500
@12 // 7501
D=A // 7502
@SP // 7503
AM=M+1 // 7504
A=A-1 // 7505
M=D // 7506
@30 // 7507
D=A // 7508
@SP // 7509
AM=M+1 // 7510
A=A-1 // 7511
M=D // 7512
@SP // 7513
AM=M+1 // 7514
A=A-1 // 7515
M=0 // 7516
@SP // 7517
AM=M+1 // 7518
A=A-1 // 7519
M=0 // 7520
// call Output.create
@17 // 7521
D=A // 7522
@14 // 7523
M=D // 7524
@Output.create // 7525
D=A // 7526
@13 // 7527
M=D // 7528
@Output.initMap.ret.43 // 7529
D=A // 7530
@CALL // 7531
0;JMP // 7532
(Output.initMap.ret.43)
@SP // 7533
M=M-1 // 7534

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 7535
D=A // 7536
@SP // 7537
AM=M+1 // 7538
A=A-1 // 7539
M=D // 7540
@60 // 7541
D=A // 7542
@SP // 7543
AM=M+1 // 7544
A=A-1 // 7545
M=D // 7546
@24 // 7547
D=A // 7548
@SP // 7549
AM=M+1 // 7550
A=A-1 // 7551
M=D // 7552
@24 // 7553
D=A // 7554
@SP // 7555
AM=M+1 // 7556
A=A-1 // 7557
M=D // 7558
@24 // 7559
D=A // 7560
@SP // 7561
AM=M+1 // 7562
A=A-1 // 7563
M=D // 7564
@24 // 7565
D=A // 7566
@SP // 7567
AM=M+1 // 7568
A=A-1 // 7569
M=D // 7570
@24 // 7571
D=A // 7572
@SP // 7573
AM=M+1 // 7574
A=A-1 // 7575
M=D // 7576
@27 // 7577
D=A // 7578
@SP // 7579
AM=M+1 // 7580
A=A-1 // 7581
M=D // 7582
@27 // 7583
D=A // 7584
@SP // 7585
AM=M+1 // 7586
A=A-1 // 7587
M=D // 7588
@14 // 7589
D=A // 7590
@SP // 7591
AM=M+1 // 7592
A=A-1 // 7593
M=D // 7594
@SP // 7595
AM=M+1 // 7596
A=A-1 // 7597
M=0 // 7598
@SP // 7599
AM=M+1 // 7600
A=A-1 // 7601
M=0 // 7602
// call Output.create
@17 // 7603
D=A // 7604
@14 // 7605
M=D // 7606
@Output.create // 7607
D=A // 7608
@13 // 7609
M=D // 7610
@Output.initMap.ret.44 // 7611
D=A // 7612
@CALL // 7613
0;JMP // 7614
(Output.initMap.ret.44)
@SP // 7615
M=M-1 // 7616

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 7617
D=A // 7618
@SP // 7619
AM=M+1 // 7620
A=A-1 // 7621
M=D // 7622
@51 // 7623
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
@27 // 7641
D=A // 7642
@SP // 7643
AM=M+1 // 7644
A=A-1 // 7645
M=D // 7646
@15 // 7647
D=A // 7648
@SP // 7649
AM=M+1 // 7650
A=A-1 // 7651
M=D // 7652
@27 // 7653
D=A // 7654
@SP // 7655
AM=M+1 // 7656
A=A-1 // 7657
M=D // 7658
@51 // 7659
D=A // 7660
@SP // 7661
AM=M+1 // 7662
A=A-1 // 7663
M=D // 7664
@51 // 7665
D=A // 7666
@SP // 7667
AM=M+1 // 7668
A=A-1 // 7669
M=D // 7670
@51 // 7671
D=A // 7672
@SP // 7673
AM=M+1 // 7674
A=A-1 // 7675
M=D // 7676
@SP // 7677
AM=M+1 // 7678
A=A-1 // 7679
M=0 // 7680
@SP // 7681
AM=M+1 // 7682
A=A-1 // 7683
M=0 // 7684
// call Output.create
@17 // 7685
D=A // 7686
@14 // 7687
M=D // 7688
@Output.create // 7689
D=A // 7690
@13 // 7691
M=D // 7692
@Output.initMap.ret.45 // 7693
D=A // 7694
@CALL // 7695
0;JMP // 7696
(Output.initMap.ret.45)
@SP // 7697
M=M-1 // 7698

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 7699
D=A // 7700
@SP // 7701
AM=M+1 // 7702
A=A-1 // 7703
M=D // 7704
@3 // 7705
D=A // 7706
@SP // 7707
AM=M+1 // 7708
A=A-1 // 7709
M=D // 7710
@3 // 7711
D=A // 7712
@SP // 7713
AM=M+1 // 7714
A=A-1 // 7715
M=D // 7716
@3 // 7717
D=A // 7718
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=D // 7722
@3 // 7723
D=A // 7724
@SP // 7725
AM=M+1 // 7726
A=A-1 // 7727
M=D // 7728
@3 // 7729
D=A // 7730
@SP // 7731
AM=M+1 // 7732
A=A-1 // 7733
M=D // 7734
@3 // 7735
D=A // 7736
@SP // 7737
AM=M+1 // 7738
A=A-1 // 7739
M=D // 7740
@35 // 7741
D=A // 7742
@SP // 7743
AM=M+1 // 7744
A=A-1 // 7745
M=D // 7746
@51 // 7747
D=A // 7748
@SP // 7749
AM=M+1 // 7750
A=A-1 // 7751
M=D // 7752
@63 // 7753
D=A // 7754
@SP // 7755
AM=M+1 // 7756
A=A-1 // 7757
M=D // 7758
@SP // 7759
AM=M+1 // 7760
A=A-1 // 7761
M=0 // 7762
@SP // 7763
AM=M+1 // 7764
A=A-1 // 7765
M=0 // 7766
// call Output.create
@17 // 7767
D=A // 7768
@14 // 7769
M=D // 7770
@Output.create // 7771
D=A // 7772
@13 // 7773
M=D // 7774
@Output.initMap.ret.46 // 7775
D=A // 7776
@CALL // 7777
0;JMP // 7778
(Output.initMap.ret.46)
@SP // 7779
M=M-1 // 7780

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 7781
D=A // 7782
@SP // 7783
AM=M+1 // 7784
A=A-1 // 7785
M=D // 7786
@33 // 7787
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
@63 // 7799
D=A // 7800
@SP // 7801
AM=M+1 // 7802
A=A-1 // 7803
M=D // 7804
@63 // 7805
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
@51 // 7829
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
@SP // 7841
AM=M+1 // 7842
A=A-1 // 7843
M=0 // 7844
@SP // 7845
AM=M+1 // 7846
A=A-1 // 7847
M=0 // 7848
// call Output.create
@17 // 7849
D=A // 7850
@14 // 7851
M=D // 7852
@Output.create // 7853
D=A // 7854
@13 // 7855
M=D // 7856
@Output.initMap.ret.47 // 7857
D=A // 7858
@CALL // 7859
0;JMP // 7860
(Output.initMap.ret.47)
@SP // 7861
M=M-1 // 7862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 7863
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
@51 // 7875
D=A // 7876
@SP // 7877
AM=M+1 // 7878
A=A-1 // 7879
M=D // 7880
@55 // 7881
D=A // 7882
@SP // 7883
AM=M+1 // 7884
A=A-1 // 7885
M=D // 7886
@55 // 7887
D=A // 7888
@SP // 7889
AM=M+1 // 7890
A=A-1 // 7891
M=D // 7892
@63 // 7893
D=A // 7894
@SP // 7895
AM=M+1 // 7896
A=A-1 // 7897
M=D // 7898
@59 // 7899
D=A // 7900
@SP // 7901
AM=M+1 // 7902
A=A-1 // 7903
M=D // 7904
@59 // 7905
D=A // 7906
@SP // 7907
AM=M+1 // 7908
A=A-1 // 7909
M=D // 7910
@51 // 7911
D=A // 7912
@SP // 7913
AM=M+1 // 7914
A=A-1 // 7915
M=D // 7916
@51 // 7917
D=A // 7918
@SP // 7919
AM=M+1 // 7920
A=A-1 // 7921
M=D // 7922
@SP // 7923
AM=M+1 // 7924
A=A-1 // 7925
M=0 // 7926
@SP // 7927
AM=M+1 // 7928
A=A-1 // 7929
M=0 // 7930
// call Output.create
@17 // 7931
D=A // 7932
@14 // 7933
M=D // 7934
@Output.create // 7935
D=A // 7936
@13 // 7937
M=D // 7938
@Output.initMap.ret.48 // 7939
D=A // 7940
@CALL // 7941
0;JMP // 7942
(Output.initMap.ret.48)
@SP // 7943
M=M-1 // 7944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 7945
D=A // 7946
@SP // 7947
AM=M+1 // 7948
A=A-1 // 7949
M=D // 7950
@30 // 7951
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
@51 // 7969
D=A // 7970
@SP // 7971
AM=M+1 // 7972
A=A-1 // 7973
M=D // 7974
@51 // 7975
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
@30 // 7999
D=A // 8000
@SP // 8001
AM=M+1 // 8002
A=A-1 // 8003
M=D // 8004
@SP // 8005
AM=M+1 // 8006
A=A-1 // 8007
M=0 // 8008
@SP // 8009
AM=M+1 // 8010
A=A-1 // 8011
M=0 // 8012
// call Output.create
@17 // 8013
D=A // 8014
@14 // 8015
M=D // 8016
@Output.create // 8017
D=A // 8018
@13 // 8019
M=D // 8020
@Output.initMap.ret.49 // 8021
D=A // 8022
@CALL // 8023
0;JMP // 8024
(Output.initMap.ret.49)
@SP // 8025
M=M-1 // 8026

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8027
D=A // 8028
@SP // 8029
AM=M+1 // 8030
A=A-1 // 8031
M=D // 8032
@31 // 8033
D=A // 8034
@SP // 8035
AM=M+1 // 8036
A=A-1 // 8037
M=D // 8038
@51 // 8039
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
@31 // 8057
D=A // 8058
@SP // 8059
AM=M+1 // 8060
A=A-1 // 8061
M=D // 8062
@3 // 8063
D=A // 8064
@SP // 8065
AM=M+1 // 8066
A=A-1 // 8067
M=D // 8068
@3 // 8069
D=A // 8070
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=D // 8074
@3 // 8075
D=A // 8076
@SP // 8077
AM=M+1 // 8078
A=A-1 // 8079
M=D // 8080
@3 // 8081
D=A // 8082
@SP // 8083
AM=M+1 // 8084
A=A-1 // 8085
M=D // 8086
@SP // 8087
AM=M+1 // 8088
A=A-1 // 8089
M=0 // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=0 // 8094
// call Output.create
@17 // 8095
D=A // 8096
@14 // 8097
M=D // 8098
@Output.create // 8099
D=A // 8100
@13 // 8101
M=D // 8102
@Output.initMap.ret.50 // 8103
D=A // 8104
@CALL // 8105
0;JMP // 8106
(Output.initMap.ret.50)
@SP // 8107
M=M-1 // 8108

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 8109
D=A // 8110
@SP // 8111
AM=M+1 // 8112
A=A-1 // 8113
M=D // 8114
@30 // 8115
D=A // 8116
@SP // 8117
AM=M+1 // 8118
A=A-1 // 8119
M=D // 8120
@51 // 8121
D=A // 8122
@SP // 8123
AM=M+1 // 8124
A=A-1 // 8125
M=D // 8126
@51 // 8127
D=A // 8128
@SP // 8129
AM=M+1 // 8130
A=A-1 // 8131
M=D // 8132
@51 // 8133
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
@51 // 8145
D=A // 8146
@SP // 8147
AM=M+1 // 8148
A=A-1 // 8149
M=D // 8150
@63 // 8151
D=A // 8152
@SP // 8153
AM=M+1 // 8154
A=A-1 // 8155
M=D // 8156
@59 // 8157
D=A // 8158
@SP // 8159
AM=M+1 // 8160
A=A-1 // 8161
M=D // 8162
@30 // 8163
D=A // 8164
@SP // 8165
AM=M+1 // 8166
A=A-1 // 8167
M=D // 8168
@48 // 8169
D=A // 8170
@SP // 8171
AM=M+1 // 8172
A=A-1 // 8173
M=D // 8174
@SP // 8175
AM=M+1 // 8176
A=A-1 // 8177
M=0 // 8178
// call Output.create
@17 // 8179
D=A // 8180
@14 // 8181
M=D // 8182
@Output.create // 8183
D=A // 8184
@13 // 8185
M=D // 8186
@Output.initMap.ret.51 // 8187
D=A // 8188
@CALL // 8189
0;JMP // 8190
(Output.initMap.ret.51)
@SP // 8191
M=M-1 // 8192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8193
D=A // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=D // 8198
@31 // 8199
D=A // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204
@51 // 8205
D=A // 8206
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=D // 8210
@51 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216
@51 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222
@31 // 8223
D=A // 8224
@SP // 8225
AM=M+1 // 8226
A=A-1 // 8227
M=D // 8228
@27 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234
@51 // 8235
D=A // 8236
@SP // 8237
AM=M+1 // 8238
A=A-1 // 8239
M=D // 8240
@51 // 8241
D=A // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=D // 8246
@51 // 8247
D=A // 8248
@SP // 8249
AM=M+1 // 8250
A=A-1 // 8251
M=D // 8252
@SP // 8253
AM=M+1 // 8254
A=A-1 // 8255
M=0 // 8256
@SP // 8257
AM=M+1 // 8258
A=A-1 // 8259
M=0 // 8260
// call Output.create
@17 // 8261
D=A // 8262
@14 // 8263
M=D // 8264
@Output.create // 8265
D=A // 8266
@13 // 8267
M=D // 8268
@Output.initMap.ret.52 // 8269
D=A // 8270
@CALL // 8271
0;JMP // 8272
(Output.initMap.ret.52)
@SP // 8273
M=M-1 // 8274

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8275
D=A // 8276
@SP // 8277
AM=M+1 // 8278
A=A-1 // 8279
M=D // 8280
@30 // 8281
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
@6 // 8299
D=A // 8300
@SP // 8301
AM=M+1 // 8302
A=A-1 // 8303
M=D // 8304
@28 // 8305
D=A // 8306
@SP // 8307
AM=M+1 // 8308
A=A-1 // 8309
M=D // 8310
@48 // 8311
D=A // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=D // 8316
@51 // 8317
D=A // 8318
@SP // 8319
AM=M+1 // 8320
A=A-1 // 8321
M=D // 8322
@51 // 8323
D=A // 8324
@SP // 8325
AM=M+1 // 8326
A=A-1 // 8327
M=D // 8328
@30 // 8329
D=A // 8330
@SP // 8331
AM=M+1 // 8332
A=A-1 // 8333
M=D // 8334
@SP // 8335
AM=M+1 // 8336
A=A-1 // 8337
M=0 // 8338
@SP // 8339
AM=M+1 // 8340
A=A-1 // 8341
M=0 // 8342
// call Output.create
@17 // 8343
D=A // 8344
@14 // 8345
M=D // 8346
@Output.create // 8347
D=A // 8348
@13 // 8349
M=D // 8350
@Output.initMap.ret.53 // 8351
D=A // 8352
@CALL // 8353
0;JMP // 8354
(Output.initMap.ret.53)
@SP // 8355
M=M-1 // 8356

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8357
D=A // 8358
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=D // 8362
@63 // 8363
D=A // 8364
@SP // 8365
AM=M+1 // 8366
A=A-1 // 8367
M=D // 8368
@63 // 8369
D=A // 8370
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=D // 8374
@45 // 8375
D=A // 8376
@SP // 8377
AM=M+1 // 8378
A=A-1 // 8379
M=D // 8380
@12 // 8381
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
@12 // 8399
D=A // 8400
@SP // 8401
AM=M+1 // 8402
A=A-1 // 8403
M=D // 8404
@12 // 8405
D=A // 8406
@SP // 8407
AM=M+1 // 8408
A=A-1 // 8409
M=D // 8410
@30 // 8411
D=A // 8412
@SP // 8413
AM=M+1 // 8414
A=A-1 // 8415
M=D // 8416
@SP // 8417
AM=M+1 // 8418
A=A-1 // 8419
M=0 // 8420
@SP // 8421
AM=M+1 // 8422
A=A-1 // 8423
M=0 // 8424
// call Output.create
@17 // 8425
D=A // 8426
@14 // 8427
M=D // 8428
@Output.create // 8429
D=A // 8430
@13 // 8431
M=D // 8432
@Output.initMap.ret.54 // 8433
D=A // 8434
@CALL // 8435
0;JMP // 8436
(Output.initMap.ret.54)
@SP // 8437
M=M-1 // 8438

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 8439
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
@51 // 8457
D=A // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=D // 8462
@51 // 8463
D=A // 8464
@SP // 8465
AM=M+1 // 8466
A=A-1 // 8467
M=D // 8468
@51 // 8469
D=A // 8470
@SP // 8471
AM=M+1 // 8472
A=A-1 // 8473
M=D // 8474
@51 // 8475
D=A // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=D // 8480
@51 // 8481
D=A // 8482
@SP // 8483
AM=M+1 // 8484
A=A-1 // 8485
M=D // 8486
@51 // 8487
D=A // 8488
@SP // 8489
AM=M+1 // 8490
A=A-1 // 8491
M=D // 8492
@30 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=0 // 8502
@SP // 8503
AM=M+1 // 8504
A=A-1 // 8505
M=0 // 8506
// call Output.create
@17 // 8507
D=A // 8508
@14 // 8509
M=D // 8510
@Output.create // 8511
D=A // 8512
@13 // 8513
M=D // 8514
@Output.initMap.ret.55 // 8515
D=A // 8516
@CALL // 8517
0;JMP // 8518
(Output.initMap.ret.55)
@SP // 8519
M=M-1 // 8520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 8521
D=A // 8522
@SP // 8523
AM=M+1 // 8524
A=A-1 // 8525
M=D // 8526
@51 // 8527
D=A // 8528
@SP // 8529
AM=M+1 // 8530
A=A-1 // 8531
M=D // 8532
@51 // 8533
D=A // 8534
@SP // 8535
AM=M+1 // 8536
A=A-1 // 8537
M=D // 8538
@51 // 8539
D=A // 8540
@SP // 8541
AM=M+1 // 8542
A=A-1 // 8543
M=D // 8544
@51 // 8545
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
@30 // 8557
D=A // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=D // 8562
@30 // 8563
D=A // 8564
@SP // 8565
AM=M+1 // 8566
A=A-1 // 8567
M=D // 8568
@12 // 8569
D=A // 8570
@SP // 8571
AM=M+1 // 8572
A=A-1 // 8573
M=D // 8574
@12 // 8575
D=A // 8576
@SP // 8577
AM=M+1 // 8578
A=A-1 // 8579
M=D // 8580
@SP // 8581
AM=M+1 // 8582
A=A-1 // 8583
M=0 // 8584
@SP // 8585
AM=M+1 // 8586
A=A-1 // 8587
M=0 // 8588
// call Output.create
@17 // 8589
D=A // 8590
@14 // 8591
M=D // 8592
@Output.create // 8593
D=A // 8594
@13 // 8595
M=D // 8596
@Output.initMap.ret.56 // 8597
D=A // 8598
@CALL // 8599
0;JMP // 8600
(Output.initMap.ret.56)
@SP // 8601
M=M-1 // 8602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 8603
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
@51 // 8615
D=A // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=D // 8620
@51 // 8621
D=A // 8622
@SP // 8623
AM=M+1 // 8624
A=A-1 // 8625
M=D // 8626
@51 // 8627
D=A // 8628
@SP // 8629
AM=M+1 // 8630
A=A-1 // 8631
M=D // 8632
@51 // 8633
D=A // 8634
@SP // 8635
AM=M+1 // 8636
A=A-1 // 8637
M=D // 8638
@63 // 8639
D=A // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=D // 8644
@63 // 8645
D=A // 8646
@SP // 8647
AM=M+1 // 8648
A=A-1 // 8649
M=D // 8650
@63 // 8651
D=A // 8652
@SP // 8653
AM=M+1 // 8654
A=A-1 // 8655
M=D // 8656
@18 // 8657
D=A // 8658
@SP // 8659
AM=M+1 // 8660
A=A-1 // 8661
M=D // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=0 // 8666
@SP // 8667
AM=M+1 // 8668
A=A-1 // 8669
M=0 // 8670
// call Output.create
@17 // 8671
D=A // 8672
@14 // 8673
M=D // 8674
@Output.create // 8675
D=A // 8676
@13 // 8677
M=D // 8678
@Output.initMap.ret.57 // 8679
D=A // 8680
@CALL // 8681
0;JMP // 8682
(Output.initMap.ret.57)
@SP // 8683
M=M-1 // 8684

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690
@51 // 8691
D=A // 8692
@SP // 8693
AM=M+1 // 8694
A=A-1 // 8695
M=D // 8696
@51 // 8697
D=A // 8698
@SP // 8699
AM=M+1 // 8700
A=A-1 // 8701
M=D // 8702
@30 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708
@30 // 8709
D=A // 8710
@SP // 8711
AM=M+1 // 8712
A=A-1 // 8713
M=D // 8714
@12 // 8715
D=A // 8716
@SP // 8717
AM=M+1 // 8718
A=A-1 // 8719
M=D // 8720
@30 // 8721
D=A // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=D // 8726
@30 // 8727
D=A // 8728
@SP // 8729
AM=M+1 // 8730
A=A-1 // 8731
M=D // 8732
@51 // 8733
D=A // 8734
@SP // 8735
AM=M+1 // 8736
A=A-1 // 8737
M=D // 8738
@51 // 8739
D=A // 8740
@SP // 8741
AM=M+1 // 8742
A=A-1 // 8743
M=D // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=0 // 8748
@SP // 8749
AM=M+1 // 8750
A=A-1 // 8751
M=0 // 8752
// call Output.create
@17 // 8753
D=A // 8754
@14 // 8755
M=D // 8756
@Output.create // 8757
D=A // 8758
@13 // 8759
M=D // 8760
@Output.initMap.ret.58 // 8761
D=A // 8762
@CALL // 8763
0;JMP // 8764
(Output.initMap.ret.58)
@SP // 8765
M=M-1 // 8766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 8767
D=A // 8768
@SP // 8769
AM=M+1 // 8770
A=A-1 // 8771
M=D // 8772
@51 // 8773
D=A // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=D // 8778
@51 // 8779
D=A // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=D // 8784
@51 // 8785
D=A // 8786
@SP // 8787
AM=M+1 // 8788
A=A-1 // 8789
M=D // 8790
@51 // 8791
D=A // 8792
@SP // 8793
AM=M+1 // 8794
A=A-1 // 8795
M=D // 8796
@30 // 8797
D=A // 8798
@SP // 8799
AM=M+1 // 8800
A=A-1 // 8801
M=D // 8802
@12 // 8803
D=A // 8804
@SP // 8805
AM=M+1 // 8806
A=A-1 // 8807
M=D // 8808
@12 // 8809
D=A // 8810
@SP // 8811
AM=M+1 // 8812
A=A-1 // 8813
M=D // 8814
@12 // 8815
D=A // 8816
@SP // 8817
AM=M+1 // 8818
A=A-1 // 8819
M=D // 8820
@30 // 8821
D=A // 8822
@SP // 8823
AM=M+1 // 8824
A=A-1 // 8825
M=D // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=0 // 8830
@SP // 8831
AM=M+1 // 8832
A=A-1 // 8833
M=0 // 8834
// call Output.create
@17 // 8835
D=A // 8836
@14 // 8837
M=D // 8838
@Output.create // 8839
D=A // 8840
@13 // 8841
M=D // 8842
@Output.initMap.ret.59 // 8843
D=A // 8844
@CALL // 8845
0;JMP // 8846
(Output.initMap.ret.59)
@SP // 8847
M=M-1 // 8848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 8849
D=A // 8850
@SP // 8851
AM=M+1 // 8852
A=A-1 // 8853
M=D // 8854
@63 // 8855
D=A // 8856
@SP // 8857
AM=M+1 // 8858
A=A-1 // 8859
M=D // 8860
@51 // 8861
D=A // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=D // 8866
@49 // 8867
D=A // 8868
@SP // 8869
AM=M+1 // 8870
A=A-1 // 8871
M=D // 8872
@24 // 8873
D=A // 8874
@SP // 8875
AM=M+1 // 8876
A=A-1 // 8877
M=D // 8878
@12 // 8879
D=A // 8880
@SP // 8881
AM=M+1 // 8882
A=A-1 // 8883
M=D // 8884
@6 // 8885
D=A // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=D // 8890
@35 // 8891
D=A // 8892
@SP // 8893
AM=M+1 // 8894
A=A-1 // 8895
M=D // 8896
@51 // 8897
D=A // 8898
@SP // 8899
AM=M+1 // 8900
A=A-1 // 8901
M=D // 8902
@63 // 8903
D=A // 8904
@SP // 8905
AM=M+1 // 8906
A=A-1 // 8907
M=D // 8908
@SP // 8909
AM=M+1 // 8910
A=A-1 // 8911
M=0 // 8912
@SP // 8913
AM=M+1 // 8914
A=A-1 // 8915
M=0 // 8916
// call Output.create
@17 // 8917
D=A // 8918
@14 // 8919
M=D // 8920
@Output.create // 8921
D=A // 8922
@13 // 8923
M=D // 8924
@Output.initMap.ret.60 // 8925
D=A // 8926
@CALL // 8927
0;JMP // 8928
(Output.initMap.ret.60)
@SP // 8929
M=M-1 // 8930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 8931
D=A // 8932
@SP // 8933
AM=M+1 // 8934
A=A-1 // 8935
M=D // 8936
@30 // 8937
D=A // 8938
@SP // 8939
AM=M+1 // 8940
A=A-1 // 8941
M=D // 8942
@6 // 8943
D=A // 8944
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=D // 8948
@6 // 8949
D=A // 8950
@SP // 8951
AM=M+1 // 8952
A=A-1 // 8953
M=D // 8954
@6 // 8955
D=A // 8956
@SP // 8957
AM=M+1 // 8958
A=A-1 // 8959
M=D // 8960
@6 // 8961
D=A // 8962
@SP // 8963
AM=M+1 // 8964
A=A-1 // 8965
M=D // 8966
@6 // 8967
D=A // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=D // 8972
@6 // 8973
D=A // 8974
@SP // 8975
AM=M+1 // 8976
A=A-1 // 8977
M=D // 8978
@6 // 8979
D=A // 8980
@SP // 8981
AM=M+1 // 8982
A=A-1 // 8983
M=D // 8984
@30 // 8985
D=A // 8986
@SP // 8987
AM=M+1 // 8988
A=A-1 // 8989
M=D // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=0 // 8994
@SP // 8995
AM=M+1 // 8996
A=A-1 // 8997
M=0 // 8998
// call Output.create
@17 // 8999
D=A // 9000
@14 // 9001
M=D // 9002
@Output.create // 9003
D=A // 9004
@13 // 9005
M=D // 9006
@Output.initMap.ret.61 // 9007
D=A // 9008
@CALL // 9009
0;JMP // 9010
(Output.initMap.ret.61)
@SP // 9011
M=M-1 // 9012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9013
D=A // 9014
@SP // 9015
M=D+M // 9016
@92 // 9017
D=A // 9018
@SP // 9019
A=M-1 // 9020
M=1 // 9021
A=A-1 // 9022
M=0 // 9023
A=A-1 // 9024
M=0 // 9025
A=A-1 // 9026
M=D // 9027
A=A-1 // 9028
@3 // 9029
D=A // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=D // 9034
@6 // 9035
D=A // 9036
@SP // 9037
AM=M+1 // 9038
A=A-1 // 9039
M=D // 9040
@12 // 9041
D=A // 9042
@SP // 9043
AM=M+1 // 9044
A=A-1 // 9045
M=D // 9046
@24 // 9047
D=A // 9048
@SP // 9049
AM=M+1 // 9050
A=A-1 // 9051
M=D // 9052
@48 // 9053
D=A // 9054
@SP // 9055
AM=M+1 // 9056
A=A-1 // 9057
M=D // 9058
@32 // 9059
D=A // 9060
@SP // 9061
AM=M+1 // 9062
A=A-1 // 9063
M=D // 9064
@SP // 9065
AM=M+1 // 9066
A=A-1 // 9067
M=0 // 9068
@SP // 9069
AM=M+1 // 9070
A=A-1 // 9071
M=0 // 9072
// call Output.create
@17 // 9073
D=A // 9074
@14 // 9075
M=D // 9076
@Output.create // 9077
D=A // 9078
@13 // 9079
M=D // 9080
@Output.initMap.ret.62 // 9081
D=A // 9082
@CALL // 9083
0;JMP // 9084
(Output.initMap.ret.62)
@SP // 9085
M=M-1 // 9086

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 9087
D=A // 9088
@SP // 9089
AM=M+1 // 9090
A=A-1 // 9091
M=D // 9092
@30 // 9093
D=A // 9094
@SP // 9095
AM=M+1 // 9096
A=A-1 // 9097
M=D // 9098
@24 // 9099
D=A // 9100
@SP // 9101
AM=M+1 // 9102
A=A-1 // 9103
M=D // 9104
@24 // 9105
D=A // 9106
@SP // 9107
AM=M+1 // 9108
A=A-1 // 9109
M=D // 9110
@24 // 9111
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
@24 // 9123
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
@24 // 9135
D=A // 9136
@SP // 9137
AM=M+1 // 9138
A=A-1 // 9139
M=D // 9140
@30 // 9141
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
@Output.initMap.ret.63 // 9163
D=A // 9164
@CALL // 9165
0;JMP // 9166
(Output.initMap.ret.63)
@SP // 9167
M=M-1 // 9168

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 9169
D=A // 9170
@SP // 9171
AM=M+1 // 9172
A=A-1 // 9173
M=D // 9174
@8 // 9175
D=A // 9176
@SP // 9177
AM=M+1 // 9178
A=A-1 // 9179
M=D // 9180
@28 // 9181
D=A // 9182
@SP // 9183
AM=M+1 // 9184
A=A-1 // 9185
M=D // 9186
@54 // 9187
D=A // 9188
@SP // 9189
AM=M+1 // 9190
A=A-1 // 9191
M=D // 9192
@SP // 9193
AM=M+1 // 9194
A=A-1 // 9195
M=0 // 9196
@SP // 9197
AM=M+1 // 9198
A=A-1 // 9199
M=0 // 9200
@SP // 9201
AM=M+1 // 9202
A=A-1 // 9203
M=0 // 9204
@SP // 9205
AM=M+1 // 9206
A=A-1 // 9207
M=0 // 9208
@SP // 9209
AM=M+1 // 9210
A=A-1 // 9211
M=0 // 9212
@SP // 9213
AM=M+1 // 9214
A=A-1 // 9215
M=0 // 9216
@SP // 9217
AM=M+1 // 9218
A=A-1 // 9219
M=0 // 9220
@SP // 9221
AM=M+1 // 9222
A=A-1 // 9223
M=0 // 9224
// call Output.create
@17 // 9225
D=A // 9226
@14 // 9227
M=D // 9228
@Output.create // 9229
D=A // 9230
@13 // 9231
M=D // 9232
@Output.initMap.ret.64 // 9233
D=A // 9234
@CALL // 9235
0;JMP // 9236
(Output.initMap.ret.64)
@SP // 9237
M=M-1 // 9238

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9239
D=A // 9240
@SP // 9241
M=D+M // 9242
@95 // 9243
D=A // 9244
@SP // 9245
A=M-1 // 9246
M=0 // 9247
A=A-1 // 9248
M=0 // 9249
A=A-1 // 9250
M=0 // 9251
A=A-1 // 9252
M=0 // 9253
A=A-1 // 9254
M=0 // 9255
A=A-1 // 9256
M=0 // 9257
A=A-1 // 9258
M=0 // 9259
A=A-1 // 9260
M=0 // 9261
A=A-1 // 9262
M=0 // 9263
A=A-1 // 9264
M=D // 9265
A=A-1 // 9266
@2 // 9267
D=A // 9268
@SP // 9269
M=D+M // 9270
@63 // 9271
D=A // 9272
@SP // 9273
A=M-1 // 9274
M=0 // 9275
A=A-1 // 9276
M=D // 9277
A=A-1 // 9278
// call Output.create
@17 // 9279
D=A // 9280
@14 // 9281
M=D // 9282
@Output.create // 9283
D=A // 9284
@13 // 9285
M=D // 9286
@Output.initMap.ret.65 // 9287
D=A // 9288
@CALL // 9289
0;JMP // 9290
(Output.initMap.ret.65)
@SP // 9291
M=M-1 // 9292

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9293
D=A // 9294
@SP // 9295
AM=M+1 // 9296
A=A-1 // 9297
M=D // 9298
@6 // 9299
D=A // 9300
@SP // 9301
AM=M+1 // 9302
A=A-1 // 9303
M=D // 9304
@12 // 9305
D=A // 9306
@SP // 9307
AM=M+1 // 9308
A=A-1 // 9309
M=D // 9310
@24 // 9311
D=A // 9312
@SP // 9313
AM=M+1 // 9314
A=A-1 // 9315
M=D // 9316
@SP // 9317
AM=M+1 // 9318
A=A-1 // 9319
M=0 // 9320
@SP // 9321
AM=M+1 // 9322
A=A-1 // 9323
M=0 // 9324
@SP // 9325
AM=M+1 // 9326
A=A-1 // 9327
M=0 // 9328
@SP // 9329
AM=M+1 // 9330
A=A-1 // 9331
M=0 // 9332
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=0 // 9336
@SP // 9337
AM=M+1 // 9338
A=A-1 // 9339
M=0 // 9340
@SP // 9341
AM=M+1 // 9342
A=A-1 // 9343
M=0 // 9344
@SP // 9345
AM=M+1 // 9346
A=A-1 // 9347
M=0 // 9348
// call Output.create
@17 // 9349
D=A // 9350
@14 // 9351
M=D // 9352
@Output.create // 9353
D=A // 9354
@13 // 9355
M=D // 9356
@Output.initMap.ret.66 // 9357
D=A // 9358
@CALL // 9359
0;JMP // 9360
(Output.initMap.ret.66)
@SP // 9361
M=M-1 // 9362

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9363
D=A // 9364
@SP // 9365
M=D+M // 9366
@97 // 9367
D=A // 9368
@SP // 9369
A=M-1 // 9370
M=0 // 9371
A=A-1 // 9372
M=0 // 9373
A=A-1 // 9374
M=0 // 9375
A=A-1 // 9376
M=D // 9377
A=A-1 // 9378
@14 // 9379
D=A // 9380
@SP // 9381
AM=M+1 // 9382
A=A-1 // 9383
M=D // 9384
@24 // 9385
D=A // 9386
@SP // 9387
AM=M+1 // 9388
A=A-1 // 9389
M=D // 9390
@30 // 9391
D=A // 9392
@SP // 9393
AM=M+1 // 9394
A=A-1 // 9395
M=D // 9396
@27 // 9397
D=A // 9398
@SP // 9399
AM=M+1 // 9400
A=A-1 // 9401
M=D // 9402
@27 // 9403
D=A // 9404
@SP // 9405
AM=M+1 // 9406
A=A-1 // 9407
M=D // 9408
@54 // 9409
D=A // 9410
@SP // 9411
AM=M+1 // 9412
A=A-1 // 9413
M=D // 9414
@SP // 9415
AM=M+1 // 9416
A=A-1 // 9417
M=0 // 9418
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=0 // 9422
// call Output.create
@17 // 9423
D=A // 9424
@14 // 9425
M=D // 9426
@Output.create // 9427
D=A // 9428
@13 // 9429
M=D // 9430
@Output.initMap.ret.67 // 9431
D=A // 9432
@CALL // 9433
0;JMP // 9434
(Output.initMap.ret.67)
@SP // 9435
M=M-1 // 9436

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 9437
D=A // 9438
@SP // 9439
AM=M+1 // 9440
A=A-1 // 9441
M=D // 9442
@3 // 9443
D=A // 9444
@SP // 9445
AM=M+1 // 9446
A=A-1 // 9447
M=D // 9448
@3 // 9449
D=A // 9450
@SP // 9451
AM=M+1 // 9452
A=A-1 // 9453
M=D // 9454
@3 // 9455
D=A // 9456
@SP // 9457
AM=M+1 // 9458
A=A-1 // 9459
M=D // 9460
@15 // 9461
D=A // 9462
@SP // 9463
AM=M+1 // 9464
A=A-1 // 9465
M=D // 9466
@27 // 9467
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
@51 // 9479
D=A // 9480
@SP // 9481
AM=M+1 // 9482
A=A-1 // 9483
M=D // 9484
@51 // 9485
D=A // 9486
@SP // 9487
AM=M+1 // 9488
A=A-1 // 9489
M=D // 9490
@30 // 9491
D=A // 9492
@SP // 9493
AM=M+1 // 9494
A=A-1 // 9495
M=D // 9496
@SP // 9497
AM=M+1 // 9498
A=A-1 // 9499
M=0 // 9500
@SP // 9501
AM=M+1 // 9502
A=A-1 // 9503
M=0 // 9504
// call Output.create
@17 // 9505
D=A // 9506
@14 // 9507
M=D // 9508
@Output.create // 9509
D=A // 9510
@13 // 9511
M=D // 9512
@Output.initMap.ret.68 // 9513
D=A // 9514
@CALL // 9515
0;JMP // 9516
(Output.initMap.ret.68)
@SP // 9517
M=M-1 // 9518

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9519
D=A // 9520
@SP // 9521
M=D+M // 9522
@99 // 9523
D=A // 9524
@SP // 9525
A=M-1 // 9526
M=0 // 9527
A=A-1 // 9528
M=0 // 9529
A=A-1 // 9530
M=0 // 9531
A=A-1 // 9532
M=D // 9533
A=A-1 // 9534
@30 // 9535
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
@3 // 9547
D=A // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=D // 9552
@3 // 9553
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
@30 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570
@SP // 9571
AM=M+1 // 9572
A=A-1 // 9573
M=0 // 9574
@SP // 9575
AM=M+1 // 9576
A=A-1 // 9577
M=0 // 9578
// call Output.create
@17 // 9579
D=A // 9580
@14 // 9581
M=D // 9582
@Output.create // 9583
D=A // 9584
@13 // 9585
M=D // 9586
@Output.initMap.ret.69 // 9587
D=A // 9588
@CALL // 9589
0;JMP // 9590
(Output.initMap.ret.69)
@SP // 9591
M=M-1 // 9592

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 9593
D=A // 9594
@SP // 9595
AM=M+1 // 9596
A=A-1 // 9597
M=D // 9598
@48 // 9599
D=A // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=D // 9604
@48 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610
@48 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616
@60 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622
@54 // 9623
D=A // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=D // 9628
@51 // 9629
D=A // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=D // 9634
@51 // 9635
D=A // 9636
@SP // 9637
AM=M+1 // 9638
A=A-1 // 9639
M=D // 9640
@51 // 9641
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
@SP // 9653
AM=M+1 // 9654
A=A-1 // 9655
M=0 // 9656
@SP // 9657
AM=M+1 // 9658
A=A-1 // 9659
M=0 // 9660
// call Output.create
@17 // 9661
D=A // 9662
@14 // 9663
M=D // 9664
@Output.create // 9665
D=A // 9666
@13 // 9667
M=D // 9668
@Output.initMap.ret.70 // 9669
D=A // 9670
@CALL // 9671
0;JMP // 9672
(Output.initMap.ret.70)
@SP // 9673
M=M-1 // 9674

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9675
D=A // 9676
@SP // 9677
M=D+M // 9678
@101 // 9679
D=A // 9680
@SP // 9681
A=M-1 // 9682
M=0 // 9683
A=A-1 // 9684
M=0 // 9685
A=A-1 // 9686
M=0 // 9687
A=A-1 // 9688
M=D // 9689
A=A-1 // 9690
@30 // 9691
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
@63 // 9703
D=A // 9704
@SP // 9705
AM=M+1 // 9706
A=A-1 // 9707
M=D // 9708
@3 // 9709
D=A // 9710
@SP // 9711
AM=M+1 // 9712
A=A-1 // 9713
M=D // 9714
@51 // 9715
D=A // 9716
@SP // 9717
AM=M+1 // 9718
A=A-1 // 9719
M=D // 9720
@30 // 9721
D=A // 9722
@SP // 9723
AM=M+1 // 9724
A=A-1 // 9725
M=D // 9726
@SP // 9727
AM=M+1 // 9728
A=A-1 // 9729
M=0 // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=0 // 9734
// call Output.create
@17 // 9735
D=A // 9736
@14 // 9737
M=D // 9738
@Output.create // 9739
D=A // 9740
@13 // 9741
M=D // 9742
@Output.initMap.ret.71 // 9743
D=A // 9744
@CALL // 9745
0;JMP // 9746
(Output.initMap.ret.71)
@SP // 9747
M=M-1 // 9748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 9749
D=A // 9750
@SP // 9751
AM=M+1 // 9752
A=A-1 // 9753
M=D // 9754
@28 // 9755
D=A // 9756
@SP // 9757
AM=M+1 // 9758
A=A-1 // 9759
M=D // 9760
@54 // 9761
D=A // 9762
@SP // 9763
AM=M+1 // 9764
A=A-1 // 9765
M=D // 9766
@38 // 9767
D=A // 9768
@SP // 9769
AM=M+1 // 9770
A=A-1 // 9771
M=D // 9772
@6 // 9773
D=A // 9774
@SP // 9775
AM=M+1 // 9776
A=A-1 // 9777
M=D // 9778
@15 // 9779
D=A // 9780
@SP // 9781
AM=M+1 // 9782
A=A-1 // 9783
M=D // 9784
@6 // 9785
D=A // 9786
@SP // 9787
AM=M+1 // 9788
A=A-1 // 9789
M=D // 9790
@6 // 9791
D=A // 9792
@SP // 9793
AM=M+1 // 9794
A=A-1 // 9795
M=D // 9796
@6 // 9797
D=A // 9798
@SP // 9799
AM=M+1 // 9800
A=A-1 // 9801
M=D // 9802
@15 // 9803
D=A // 9804
@SP // 9805
AM=M+1 // 9806
A=A-1 // 9807
M=D // 9808
@SP // 9809
AM=M+1 // 9810
A=A-1 // 9811
M=0 // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=0 // 9816
// call Output.create
@17 // 9817
D=A // 9818
@14 // 9819
M=D // 9820
@Output.create // 9821
D=A // 9822
@13 // 9823
M=D // 9824
@Output.initMap.ret.72 // 9825
D=A // 9826
@CALL // 9827
0;JMP // 9828
(Output.initMap.ret.72)
@SP // 9829
M=M-1 // 9830

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 9831
D=A // 9832
@SP // 9833
M=D+M // 9834
@103 // 9835
D=A // 9836
@SP // 9837
A=M-1 // 9838
M=0 // 9839
A=A-1 // 9840
M=0 // 9841
A=A-1 // 9842
M=D // 9843
A=A-1 // 9844
@30 // 9845
D=A // 9846
@SP // 9847
AM=M+1 // 9848
A=A-1 // 9849
M=D // 9850
@51 // 9851
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
@51 // 9863
D=A // 9864
@SP // 9865
AM=M+1 // 9866
A=A-1 // 9867
M=D // 9868
@62 // 9869
D=A // 9870
@SP // 9871
AM=M+1 // 9872
A=A-1 // 9873
M=D // 9874
@48 // 9875
D=A // 9876
@SP // 9877
AM=M+1 // 9878
A=A-1 // 9879
M=D // 9880
@51 // 9881
D=A // 9882
@SP // 9883
AM=M+1 // 9884
A=A-1 // 9885
M=D // 9886
@30 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@SP // 9893
AM=M+1 // 9894
A=A-1 // 9895
M=0 // 9896
// call Output.create
@17 // 9897
D=A // 9898
@14 // 9899
M=D // 9900
@Output.create // 9901
D=A // 9902
@13 // 9903
M=D // 9904
@Output.initMap.ret.73 // 9905
D=A // 9906
@CALL // 9907
0;JMP // 9908
(Output.initMap.ret.73)
@SP // 9909
M=M-1 // 9910

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 9911
D=A // 9912
@SP // 9913
AM=M+1 // 9914
A=A-1 // 9915
M=D // 9916
@3 // 9917
D=A // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=D // 9922
@3 // 9923
D=A // 9924
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=D // 9928
@3 // 9929
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
@55 // 9941
D=A // 9942
@SP // 9943
AM=M+1 // 9944
A=A-1 // 9945
M=D // 9946
@51 // 9947
D=A // 9948
@SP // 9949
AM=M+1 // 9950
A=A-1 // 9951
M=D // 9952
@51 // 9953
D=A // 9954
@SP // 9955
AM=M+1 // 9956
A=A-1 // 9957
M=D // 9958
@51 // 9959
D=A // 9960
@SP // 9961
AM=M+1 // 9962
A=A-1 // 9963
M=D // 9964
@51 // 9965
D=A // 9966
@SP // 9967
AM=M+1 // 9968
A=A-1 // 9969
M=D // 9970
@SP // 9971
AM=M+1 // 9972
A=A-1 // 9973
M=0 // 9974
@SP // 9975
AM=M+1 // 9976
A=A-1 // 9977
M=0 // 9978
// call Output.create
@17 // 9979
D=A // 9980
@14 // 9981
M=D // 9982
@Output.create // 9983
D=A // 9984
@13 // 9985
M=D // 9986
@Output.initMap.ret.74 // 9987
D=A // 9988
@CALL // 9989
0;JMP // 9990
(Output.initMap.ret.74)
@SP // 9991
M=M-1 // 9992

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 9993
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
@SP // 10011
AM=M+1 // 10012
A=A-1 // 10013
M=0 // 10014
@14 // 10015
D=A // 10016
@SP // 10017
AM=M+1 // 10018
A=A-1 // 10019
M=D // 10020
@12 // 10021
D=A // 10022
@SP // 10023
AM=M+1 // 10024
A=A-1 // 10025
M=D // 10026
@12 // 10027
D=A // 10028
@SP // 10029
AM=M+1 // 10030
A=A-1 // 10031
M=D // 10032
@12 // 10033
D=A // 10034
@SP // 10035
AM=M+1 // 10036
A=A-1 // 10037
M=D // 10038
@12 // 10039
D=A // 10040
@SP // 10041
AM=M+1 // 10042
A=A-1 // 10043
M=D // 10044
@30 // 10045
D=A // 10046
@SP // 10047
AM=M+1 // 10048
A=A-1 // 10049
M=D // 10050
@SP // 10051
AM=M+1 // 10052
A=A-1 // 10053
M=0 // 10054
@SP // 10055
AM=M+1 // 10056
A=A-1 // 10057
M=0 // 10058
// call Output.create
@17 // 10059
D=A // 10060
@14 // 10061
M=D // 10062
@Output.create // 10063
D=A // 10064
@13 // 10065
M=D // 10066
@Output.initMap.ret.75 // 10067
D=A // 10068
@CALL // 10069
0;JMP // 10070
(Output.initMap.ret.75)
@SP // 10071
M=M-1 // 10072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10073
D=A // 10074
@SP // 10075
AM=M+1 // 10076
A=A-1 // 10077
M=D // 10078
@48 // 10079
D=A // 10080
@SP // 10081
AM=M+1 // 10082
A=A-1 // 10083
M=D // 10084
@48 // 10085
D=A // 10086
@SP // 10087
AM=M+1 // 10088
A=A-1 // 10089
M=D // 10090
@SP // 10091
AM=M+1 // 10092
A=A-1 // 10093
M=0 // 10094
@56 // 10095
D=A // 10096
@SP // 10097
AM=M+1 // 10098
A=A-1 // 10099
M=D // 10100
@48 // 10101
D=A // 10102
@SP // 10103
AM=M+1 // 10104
A=A-1 // 10105
M=D // 10106
@48 // 10107
D=A // 10108
@SP // 10109
AM=M+1 // 10110
A=A-1 // 10111
M=D // 10112
@48 // 10113
D=A // 10114
@SP // 10115
AM=M+1 // 10116
A=A-1 // 10117
M=D // 10118
@48 // 10119
D=A // 10120
@SP // 10121
AM=M+1 // 10122
A=A-1 // 10123
M=D // 10124
@51 // 10125
D=A // 10126
@SP // 10127
AM=M+1 // 10128
A=A-1 // 10129
M=D // 10130
@30 // 10131
D=A // 10132
@SP // 10133
AM=M+1 // 10134
A=A-1 // 10135
M=D // 10136
@SP // 10137
AM=M+1 // 10138
A=A-1 // 10139
M=0 // 10140
// call Output.create
@17 // 10141
D=A // 10142
@14 // 10143
M=D // 10144
@Output.create // 10145
D=A // 10146
@13 // 10147
M=D // 10148
@Output.initMap.ret.76 // 10149
D=A // 10150
@CALL // 10151
0;JMP // 10152
(Output.initMap.ret.76)
@SP // 10153
M=M-1 // 10154

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 10155
D=A // 10156
@SP // 10157
AM=M+1 // 10158
A=A-1 // 10159
M=D // 10160
@3 // 10161
D=A // 10162
@SP // 10163
AM=M+1 // 10164
A=A-1 // 10165
M=D // 10166
@3 // 10167
D=A // 10168
@SP // 10169
AM=M+1 // 10170
A=A-1 // 10171
M=D // 10172
@3 // 10173
D=A // 10174
@SP // 10175
AM=M+1 // 10176
A=A-1 // 10177
M=D // 10178
@51 // 10179
D=A // 10180
@SP // 10181
AM=M+1 // 10182
A=A-1 // 10183
M=D // 10184
@27 // 10185
D=A // 10186
@SP // 10187
AM=M+1 // 10188
A=A-1 // 10189
M=D // 10190
@15 // 10191
D=A // 10192
@SP // 10193
AM=M+1 // 10194
A=A-1 // 10195
M=D // 10196
@15 // 10197
D=A // 10198
@SP // 10199
AM=M+1 // 10200
A=A-1 // 10201
M=D // 10202
@27 // 10203
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
@SP // 10215
AM=M+1 // 10216
A=A-1 // 10217
M=0 // 10218
@SP // 10219
AM=M+1 // 10220
A=A-1 // 10221
M=0 // 10222
// call Output.create
@17 // 10223
D=A // 10224
@14 // 10225
M=D // 10226
@Output.create // 10227
D=A // 10228
@13 // 10229
M=D // 10230
@Output.initMap.ret.77 // 10231
D=A // 10232
@CALL // 10233
0;JMP // 10234
(Output.initMap.ret.77)
@SP // 10235
M=M-1 // 10236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10237
D=A // 10238
@SP // 10239
AM=M+1 // 10240
A=A-1 // 10241
M=D // 10242
@14 // 10243
D=A // 10244
@SP // 10245
AM=M+1 // 10246
A=A-1 // 10247
M=D // 10248
@12 // 10249
D=A // 10250
@SP // 10251
AM=M+1 // 10252
A=A-1 // 10253
M=D // 10254
@12 // 10255
D=A // 10256
@SP // 10257
AM=M+1 // 10258
A=A-1 // 10259
M=D // 10260
@12 // 10261
D=A // 10262
@SP // 10263
AM=M+1 // 10264
A=A-1 // 10265
M=D // 10266
@12 // 10267
D=A // 10268
@SP // 10269
AM=M+1 // 10270
A=A-1 // 10271
M=D // 10272
@12 // 10273
D=A // 10274
@SP // 10275
AM=M+1 // 10276
A=A-1 // 10277
M=D // 10278
@12 // 10279
D=A // 10280
@SP // 10281
AM=M+1 // 10282
A=A-1 // 10283
M=D // 10284
@12 // 10285
D=A // 10286
@SP // 10287
AM=M+1 // 10288
A=A-1 // 10289
M=D // 10290
@30 // 10291
D=A // 10292
@SP // 10293
AM=M+1 // 10294
A=A-1 // 10295
M=D // 10296
@SP // 10297
AM=M+1 // 10298
A=A-1 // 10299
M=0 // 10300
@SP // 10301
AM=M+1 // 10302
A=A-1 // 10303
M=0 // 10304
// call Output.create
@17 // 10305
D=A // 10306
@14 // 10307
M=D // 10308
@Output.create // 10309
D=A // 10310
@13 // 10311
M=D // 10312
@Output.initMap.ret.78 // 10313
D=A // 10314
@CALL // 10315
0;JMP // 10316
(Output.initMap.ret.78)
@SP // 10317
M=M-1 // 10318

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10319
D=A // 10320
@SP // 10321
M=D+M // 10322
@109 // 10323
D=A // 10324
@SP // 10325
A=M-1 // 10326
M=0 // 10327
A=A-1 // 10328
M=0 // 10329
A=A-1 // 10330
M=0 // 10331
A=A-1 // 10332
M=D // 10333
A=A-1 // 10334
@29 // 10335
D=A // 10336
@SP // 10337
AM=M+1 // 10338
A=A-1 // 10339
M=D // 10340
@63 // 10341
D=A // 10342
@SP // 10343
AM=M+1 // 10344
A=A-1 // 10345
M=D // 10346
@43 // 10347
D=A // 10348
@SP // 10349
AM=M+1 // 10350
A=A-1 // 10351
M=D // 10352
@43 // 10353
D=A // 10354
@SP // 10355
AM=M+1 // 10356
A=A-1 // 10357
M=D // 10358
@43 // 10359
D=A // 10360
@SP // 10361
AM=M+1 // 10362
A=A-1 // 10363
M=D // 10364
@43 // 10365
D=A // 10366
@SP // 10367
AM=M+1 // 10368
A=A-1 // 10369
M=D // 10370
@SP // 10371
AM=M+1 // 10372
A=A-1 // 10373
M=0 // 10374
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
@Output.initMap.ret.79 // 10387
D=A // 10388
@CALL // 10389
0;JMP // 10390
(Output.initMap.ret.79)
@SP // 10391
M=M-1 // 10392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10393
D=A // 10394
@SP // 10395
M=D+M // 10396
@110 // 10397
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
@29 // 10409
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
@51 // 10433
D=A // 10434
@SP // 10435
AM=M+1 // 10436
A=A-1 // 10437
M=D // 10438
@51 // 10439
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
@Output.initMap.ret.80 // 10461
D=A // 10462
@CALL // 10463
0;JMP // 10464
(Output.initMap.ret.80)
@SP // 10465
M=M-1 // 10466

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10467
D=A // 10468
@SP // 10469
M=D+M // 10470
@111 // 10471
D=A // 10472
@SP // 10473
A=M-1 // 10474
M=0 // 10475
A=A-1 // 10476
M=0 // 10477
A=A-1 // 10478
M=0 // 10479
A=A-1 // 10480
M=D // 10481
A=A-1 // 10482
@30 // 10483
D=A // 10484
@SP // 10485
AM=M+1 // 10486
A=A-1 // 10487
M=D // 10488
@51 // 10489
D=A // 10490
@SP // 10491
AM=M+1 // 10492
A=A-1 // 10493
M=D // 10494
@51 // 10495
D=A // 10496
@SP // 10497
AM=M+1 // 10498
A=A-1 // 10499
M=D // 10500
@51 // 10501
D=A // 10502
@SP // 10503
AM=M+1 // 10504
A=A-1 // 10505
M=D // 10506
@51 // 10507
D=A // 10508
@SP // 10509
AM=M+1 // 10510
A=A-1 // 10511
M=D // 10512
@30 // 10513
D=A // 10514
@SP // 10515
AM=M+1 // 10516
A=A-1 // 10517
M=D // 10518
@SP // 10519
AM=M+1 // 10520
A=A-1 // 10521
M=0 // 10522
@SP // 10523
AM=M+1 // 10524
A=A-1 // 10525
M=0 // 10526
// call Output.create
@17 // 10527
D=A // 10528
@14 // 10529
M=D // 10530
@Output.create // 10531
D=A // 10532
@13 // 10533
M=D // 10534
@Output.initMap.ret.81 // 10535
D=A // 10536
@CALL // 10537
0;JMP // 10538
(Output.initMap.ret.81)
@SP // 10539
M=M-1 // 10540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10541
D=A // 10542
@SP // 10543
M=D+M // 10544
@112 // 10545
D=A // 10546
@SP // 10547
A=M-1 // 10548
M=0 // 10549
A=A-1 // 10550
M=0 // 10551
A=A-1 // 10552
M=0 // 10553
A=A-1 // 10554
M=D // 10555
A=A-1 // 10556
@30 // 10557
D=A // 10558
@SP // 10559
AM=M+1 // 10560
A=A-1 // 10561
M=D // 10562
@51 // 10563
D=A // 10564
@SP // 10565
AM=M+1 // 10566
A=A-1 // 10567
M=D // 10568
@51 // 10569
D=A // 10570
@SP // 10571
AM=M+1 // 10572
A=A-1 // 10573
M=D // 10574
@51 // 10575
D=A // 10576
@SP // 10577
AM=M+1 // 10578
A=A-1 // 10579
M=D // 10580
@31 // 10581
D=A // 10582
@SP // 10583
AM=M+1 // 10584
A=A-1 // 10585
M=D // 10586
@3 // 10587
D=A // 10588
@SP // 10589
AM=M+1 // 10590
A=A-1 // 10591
M=D // 10592
@3 // 10593
D=A // 10594
@SP // 10595
AM=M+1 // 10596
A=A-1 // 10597
M=D // 10598
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
@Output.initMap.ret.82 // 10611
D=A // 10612
@CALL // 10613
0;JMP // 10614
(Output.initMap.ret.82)
@SP // 10615
M=M-1 // 10616

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10617
D=A // 10618
@SP // 10619
M=D+M // 10620
@113 // 10621
D=A // 10622
@SP // 10623
A=M-1 // 10624
M=0 // 10625
A=A-1 // 10626
M=0 // 10627
A=A-1 // 10628
M=0 // 10629
A=A-1 // 10630
M=D // 10631
A=A-1 // 10632
@30 // 10633
D=A // 10634
@SP // 10635
AM=M+1 // 10636
A=A-1 // 10637
M=D // 10638
@51 // 10639
D=A // 10640
@SP // 10641
AM=M+1 // 10642
A=A-1 // 10643
M=D // 10644
@51 // 10645
D=A // 10646
@SP // 10647
AM=M+1 // 10648
A=A-1 // 10649
M=D // 10650
@51 // 10651
D=A // 10652
@SP // 10653
AM=M+1 // 10654
A=A-1 // 10655
M=D // 10656
@62 // 10657
D=A // 10658
@SP // 10659
AM=M+1 // 10660
A=A-1 // 10661
M=D // 10662
@48 // 10663
D=A // 10664
@SP // 10665
AM=M+1 // 10666
A=A-1 // 10667
M=D // 10668
@48 // 10669
D=A // 10670
@SP // 10671
AM=M+1 // 10672
A=A-1 // 10673
M=D // 10674
@SP // 10675
AM=M+1 // 10676
A=A-1 // 10677
M=0 // 10678
// call Output.create
@17 // 10679
D=A // 10680
@14 // 10681
M=D // 10682
@Output.create // 10683
D=A // 10684
@13 // 10685
M=D // 10686
@Output.initMap.ret.83 // 10687
D=A // 10688
@CALL // 10689
0;JMP // 10690
(Output.initMap.ret.83)
@SP // 10691
M=M-1 // 10692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10693
D=A // 10694
@SP // 10695
M=D+M // 10696
@114 // 10697
D=A // 10698
@SP // 10699
A=M-1 // 10700
M=0 // 10701
A=A-1 // 10702
M=0 // 10703
A=A-1 // 10704
M=0 // 10705
A=A-1 // 10706
M=D // 10707
A=A-1 // 10708
@29 // 10709
D=A // 10710
@SP // 10711
AM=M+1 // 10712
A=A-1 // 10713
M=D // 10714
@55 // 10715
D=A // 10716
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=D // 10720
@51 // 10721
D=A // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=D // 10726
@3 // 10727
D=A // 10728
@SP // 10729
AM=M+1 // 10730
A=A-1 // 10731
M=D // 10732
@3 // 10733
D=A // 10734
@SP // 10735
AM=M+1 // 10736
A=A-1 // 10737
M=D // 10738
@7 // 10739
D=A // 10740
@SP // 10741
AM=M+1 // 10742
A=A-1 // 10743
M=D // 10744
@SP // 10745
AM=M+1 // 10746
A=A-1 // 10747
M=0 // 10748
@SP // 10749
AM=M+1 // 10750
A=A-1 // 10751
M=0 // 10752
// call Output.create
@17 // 10753
D=A // 10754
@14 // 10755
M=D // 10756
@Output.create // 10757
D=A // 10758
@13 // 10759
M=D // 10760
@Output.initMap.ret.84 // 10761
D=A // 10762
@CALL // 10763
0;JMP // 10764
(Output.initMap.ret.84)
@SP // 10765
M=M-1 // 10766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10767
D=A // 10768
@SP // 10769
M=D+M // 10770
@115 // 10771
D=A // 10772
@SP // 10773
A=M-1 // 10774
M=0 // 10775
A=A-1 // 10776
M=0 // 10777
A=A-1 // 10778
M=0 // 10779
A=A-1 // 10780
M=D // 10781
A=A-1 // 10782
@30 // 10783
D=A // 10784
@SP // 10785
AM=M+1 // 10786
A=A-1 // 10787
M=D // 10788
@51 // 10789
D=A // 10790
@SP // 10791
AM=M+1 // 10792
A=A-1 // 10793
M=D // 10794
@6 // 10795
D=A // 10796
@SP // 10797
AM=M+1 // 10798
A=A-1 // 10799
M=D // 10800
@24 // 10801
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
@SP // 10819
AM=M+1 // 10820
A=A-1 // 10821
M=0 // 10822
@SP // 10823
AM=M+1 // 10824
A=A-1 // 10825
M=0 // 10826
// call Output.create
@17 // 10827
D=A // 10828
@14 // 10829
M=D // 10830
@Output.create // 10831
D=A // 10832
@13 // 10833
M=D // 10834
@Output.initMap.ret.85 // 10835
D=A // 10836
@CALL // 10837
0;JMP // 10838
(Output.initMap.ret.85)
@SP // 10839
M=M-1 // 10840

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 10841
D=A // 10842
@SP // 10843
AM=M+1 // 10844
A=A-1 // 10845
M=D // 10846
@4 // 10847
D=A // 10848
@SP // 10849
AM=M+1 // 10850
A=A-1 // 10851
M=D // 10852
@6 // 10853
D=A // 10854
@SP // 10855
AM=M+1 // 10856
A=A-1 // 10857
M=D // 10858
@6 // 10859
D=A // 10860
@SP // 10861
AM=M+1 // 10862
A=A-1 // 10863
M=D // 10864
@15 // 10865
D=A // 10866
@SP // 10867
AM=M+1 // 10868
A=A-1 // 10869
M=D // 10870
@6 // 10871
D=A // 10872
@SP // 10873
AM=M+1 // 10874
A=A-1 // 10875
M=D // 10876
@6 // 10877
D=A // 10878
@SP // 10879
AM=M+1 // 10880
A=A-1 // 10881
M=D // 10882
@6 // 10883
D=A // 10884
@SP // 10885
AM=M+1 // 10886
A=A-1 // 10887
M=D // 10888
@54 // 10889
D=A // 10890
@SP // 10891
AM=M+1 // 10892
A=A-1 // 10893
M=D // 10894
@28 // 10895
D=A // 10896
@SP // 10897
AM=M+1 // 10898
A=A-1 // 10899
M=D // 10900
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=0 // 10904
@SP // 10905
AM=M+1 // 10906
A=A-1 // 10907
M=0 // 10908
// call Output.create
@17 // 10909
D=A // 10910
@14 // 10911
M=D // 10912
@Output.create // 10913
D=A // 10914
@13 // 10915
M=D // 10916
@Output.initMap.ret.86 // 10917
D=A // 10918
@CALL // 10919
0;JMP // 10920
(Output.initMap.ret.86)
@SP // 10921
M=M-1 // 10922

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10923
D=A // 10924
@SP // 10925
M=D+M // 10926
@117 // 10927
D=A // 10928
@SP // 10929
A=M-1 // 10930
M=0 // 10931
A=A-1 // 10932
M=0 // 10933
A=A-1 // 10934
M=0 // 10935
A=A-1 // 10936
M=D // 10937
A=A-1 // 10938
@27 // 10939
D=A // 10940
@SP // 10941
AM=M+1 // 10942
A=A-1 // 10943
M=D // 10944
@27 // 10945
D=A // 10946
@SP // 10947
AM=M+1 // 10948
A=A-1 // 10949
M=D // 10950
@27 // 10951
D=A // 10952
@SP // 10953
AM=M+1 // 10954
A=A-1 // 10955
M=D // 10956
@27 // 10957
D=A // 10958
@SP // 10959
AM=M+1 // 10960
A=A-1 // 10961
M=D // 10962
@27 // 10963
D=A // 10964
@SP // 10965
AM=M+1 // 10966
A=A-1 // 10967
M=D // 10968
@54 // 10969
D=A // 10970
@SP // 10971
AM=M+1 // 10972
A=A-1 // 10973
M=D // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=0 // 10978
@SP // 10979
AM=M+1 // 10980
A=A-1 // 10981
M=0 // 10982
// call Output.create
@17 // 10983
D=A // 10984
@14 // 10985
M=D // 10986
@Output.create // 10987
D=A // 10988
@13 // 10989
M=D // 10990
@Output.initMap.ret.87 // 10991
D=A // 10992
@CALL // 10993
0;JMP // 10994
(Output.initMap.ret.87)
@SP // 10995
M=M-1 // 10996

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10997
D=A // 10998
@SP // 10999
M=D+M // 11000
@118 // 11001
D=A // 11002
@SP // 11003
A=M-1 // 11004
M=0 // 11005
A=A-1 // 11006
M=0 // 11007
A=A-1 // 11008
M=0 // 11009
A=A-1 // 11010
M=D // 11011
A=A-1 // 11012
@51 // 11013
D=A // 11014
@SP // 11015
AM=M+1 // 11016
A=A-1 // 11017
M=D // 11018
@51 // 11019
D=A // 11020
@SP // 11021
AM=M+1 // 11022
A=A-1 // 11023
M=D // 11024
@51 // 11025
D=A // 11026
@SP // 11027
AM=M+1 // 11028
A=A-1 // 11029
M=D // 11030
@51 // 11031
D=A // 11032
@SP // 11033
AM=M+1 // 11034
A=A-1 // 11035
M=D // 11036
@30 // 11037
D=A // 11038
@SP // 11039
AM=M+1 // 11040
A=A-1 // 11041
M=D // 11042
@12 // 11043
D=A // 11044
@SP // 11045
AM=M+1 // 11046
A=A-1 // 11047
M=D // 11048
@SP // 11049
AM=M+1 // 11050
A=A-1 // 11051
M=0 // 11052
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
@Output.initMap.ret.88 // 11065
D=A // 11066
@CALL // 11067
0;JMP // 11068
(Output.initMap.ret.88)
@SP // 11069
M=M-1 // 11070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11071
D=A // 11072
@SP // 11073
M=D+M // 11074
@119 // 11075
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
@51 // 11087
D=A // 11088
@SP // 11089
AM=M+1 // 11090
A=A-1 // 11091
M=D // 11092
@51 // 11093
D=A // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=D // 11098
@51 // 11099
D=A // 11100
@SP // 11101
AM=M+1 // 11102
A=A-1 // 11103
M=D // 11104
@63 // 11105
D=A // 11106
@SP // 11107
AM=M+1 // 11108
A=A-1 // 11109
M=D // 11110
@63 // 11111
D=A // 11112
@SP // 11113
AM=M+1 // 11114
A=A-1 // 11115
M=D // 11116
@18 // 11117
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
@Output.initMap.ret.89 // 11139
D=A // 11140
@CALL // 11141
0;JMP // 11142
(Output.initMap.ret.89)
@SP // 11143
M=M-1 // 11144

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11145
D=A // 11146
@SP // 11147
M=D+M // 11148
@120 // 11149
D=A // 11150
@SP // 11151
A=M-1 // 11152
M=0 // 11153
A=A-1 // 11154
M=0 // 11155
A=A-1 // 11156
M=0 // 11157
A=A-1 // 11158
M=D // 11159
A=A-1 // 11160
@51 // 11161
D=A // 11162
@SP // 11163
AM=M+1 // 11164
A=A-1 // 11165
M=D // 11166
@30 // 11167
D=A // 11168
@SP // 11169
AM=M+1 // 11170
A=A-1 // 11171
M=D // 11172
@12 // 11173
D=A // 11174
@SP // 11175
AM=M+1 // 11176
A=A-1 // 11177
M=D // 11178
@12 // 11179
D=A // 11180
@SP // 11181
AM=M+1 // 11182
A=A-1 // 11183
M=D // 11184
@30 // 11185
D=A // 11186
@SP // 11187
AM=M+1 // 11188
A=A-1 // 11189
M=D // 11190
@51 // 11191
D=A // 11192
@SP // 11193
AM=M+1 // 11194
A=A-1 // 11195
M=D // 11196
@SP // 11197
AM=M+1 // 11198
A=A-1 // 11199
M=0 // 11200
@SP // 11201
AM=M+1 // 11202
A=A-1 // 11203
M=0 // 11204
// call Output.create
@17 // 11205
D=A // 11206
@14 // 11207
M=D // 11208
@Output.create // 11209
D=A // 11210
@13 // 11211
M=D // 11212
@Output.initMap.ret.90 // 11213
D=A // 11214
@CALL // 11215
0;JMP // 11216
(Output.initMap.ret.90)
@SP // 11217
M=M-1 // 11218

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11219
D=A // 11220
@SP // 11221
M=D+M // 11222
@121 // 11223
D=A // 11224
@SP // 11225
A=M-1 // 11226
M=0 // 11227
A=A-1 // 11228
M=0 // 11229
A=A-1 // 11230
M=0 // 11231
A=A-1 // 11232
M=D // 11233
A=A-1 // 11234
@51 // 11235
D=A // 11236
@SP // 11237
AM=M+1 // 11238
A=A-1 // 11239
M=D // 11240
@51 // 11241
D=A // 11242
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=D // 11246
@51 // 11247
D=A // 11248
@SP // 11249
AM=M+1 // 11250
A=A-1 // 11251
M=D // 11252
@62 // 11253
D=A // 11254
@SP // 11255
AM=M+1 // 11256
A=A-1 // 11257
M=D // 11258
@48 // 11259
D=A // 11260
@SP // 11261
AM=M+1 // 11262
A=A-1 // 11263
M=D // 11264
@24 // 11265
D=A // 11266
@SP // 11267
AM=M+1 // 11268
A=A-1 // 11269
M=D // 11270
@15 // 11271
D=A // 11272
@SP // 11273
AM=M+1 // 11274
A=A-1 // 11275
M=D // 11276
@SP // 11277
AM=M+1 // 11278
A=A-1 // 11279
M=0 // 11280
// call Output.create
@17 // 11281
D=A // 11282
@14 // 11283
M=D // 11284
@Output.create // 11285
D=A // 11286
@13 // 11287
M=D // 11288
@Output.initMap.ret.91 // 11289
D=A // 11290
@CALL // 11291
0;JMP // 11292
(Output.initMap.ret.91)
@SP // 11293
M=M-1 // 11294

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11295
D=A // 11296
@SP // 11297
M=D+M // 11298
@122 // 11299
D=A // 11300
@SP // 11301
A=M-1 // 11302
M=0 // 11303
A=A-1 // 11304
M=0 // 11305
A=A-1 // 11306
M=0 // 11307
A=A-1 // 11308
M=D // 11309
A=A-1 // 11310
@63 // 11311
D=A // 11312
@SP // 11313
AM=M+1 // 11314
A=A-1 // 11315
M=D // 11316
@27 // 11317
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
@6 // 11329
D=A // 11330
@SP // 11331
AM=M+1 // 11332
A=A-1 // 11333
M=D // 11334
@51 // 11335
D=A // 11336
@SP // 11337
AM=M+1 // 11338
A=A-1 // 11339
M=D // 11340
@63 // 11341
D=A // 11342
@SP // 11343
AM=M+1 // 11344
A=A-1 // 11345
M=D // 11346
@SP // 11347
AM=M+1 // 11348
A=A-1 // 11349
M=0 // 11350
@SP // 11351
AM=M+1 // 11352
A=A-1 // 11353
M=0 // 11354
// call Output.create
@17 // 11355
D=A // 11356
@14 // 11357
M=D // 11358
@Output.create // 11359
D=A // 11360
@13 // 11361
M=D // 11362
@Output.initMap.ret.92 // 11363
D=A // 11364
@CALL // 11365
0;JMP // 11366
(Output.initMap.ret.92)
@SP // 11367
M=M-1 // 11368

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11369
D=A // 11370
@SP // 11371
AM=M+1 // 11372
A=A-1 // 11373
M=D // 11374
@56 // 11375
D=A // 11376
@SP // 11377
AM=M+1 // 11378
A=A-1 // 11379
M=D // 11380
@12 // 11381
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
@7 // 11399
D=A // 11400
@SP // 11401
AM=M+1 // 11402
A=A-1 // 11403
M=D // 11404
@12 // 11405
D=A // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=D // 11410
@12 // 11411
D=A // 11412
@SP // 11413
AM=M+1 // 11414
A=A-1 // 11415
M=D // 11416
@12 // 11417
D=A // 11418
@SP // 11419
AM=M+1 // 11420
A=A-1 // 11421
M=D // 11422
@56 // 11423
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
@Output.initMap.ret.93 // 11445
D=A // 11446
@CALL // 11447
0;JMP // 11448
(Output.initMap.ret.93)
@SP // 11449
M=M-1 // 11450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 11451
D=A // 11452
@SP // 11453
AM=M+1 // 11454
A=A-1 // 11455
M=D // 11456
@12 // 11457
D=A // 11458
@SP // 11459
AM=M+1 // 11460
A=A-1 // 11461
M=D // 11462
@12 // 11463
D=A // 11464
@SP // 11465
AM=M+1 // 11466
A=A-1 // 11467
M=D // 11468
@12 // 11469
D=A // 11470
@SP // 11471
AM=M+1 // 11472
A=A-1 // 11473
M=D // 11474
@12 // 11475
D=A // 11476
@SP // 11477
AM=M+1 // 11478
A=A-1 // 11479
M=D // 11480
@12 // 11481
D=A // 11482
@SP // 11483
AM=M+1 // 11484
A=A-1 // 11485
M=D // 11486
@12 // 11487
D=A // 11488
@SP // 11489
AM=M+1 // 11490
A=A-1 // 11491
M=D // 11492
@12 // 11493
D=A // 11494
@SP // 11495
AM=M+1 // 11496
A=A-1 // 11497
M=D // 11498
@12 // 11499
D=A // 11500
@SP // 11501
AM=M+1 // 11502
A=A-1 // 11503
M=D // 11504
@12 // 11505
D=A // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=D // 11510
@SP // 11511
AM=M+1 // 11512
A=A-1 // 11513
M=0 // 11514
@SP // 11515
AM=M+1 // 11516
A=A-1 // 11517
M=0 // 11518
// call Output.create
@17 // 11519
D=A // 11520
@14 // 11521
M=D // 11522
@Output.create // 11523
D=A // 11524
@13 // 11525
M=D // 11526
@Output.initMap.ret.94 // 11527
D=A // 11528
@CALL // 11529
0;JMP // 11530
(Output.initMap.ret.94)
@SP // 11531
M=M-1 // 11532

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 11533
D=A // 11534
@SP // 11535
AM=M+1 // 11536
A=A-1 // 11537
M=D // 11538
@7 // 11539
D=A // 11540
@SP // 11541
AM=M+1 // 11542
A=A-1 // 11543
M=D // 11544
@12 // 11545
D=A // 11546
@SP // 11547
AM=M+1 // 11548
A=A-1 // 11549
M=D // 11550
@12 // 11551
D=A // 11552
@SP // 11553
AM=M+1 // 11554
A=A-1 // 11555
M=D // 11556
@12 // 11557
D=A // 11558
@SP // 11559
AM=M+1 // 11560
A=A-1 // 11561
M=D // 11562
@56 // 11563
D=A // 11564
@SP // 11565
AM=M+1 // 11566
A=A-1 // 11567
M=D // 11568
@12 // 11569
D=A // 11570
@SP // 11571
AM=M+1 // 11572
A=A-1 // 11573
M=D // 11574
@12 // 11575
D=A // 11576
@SP // 11577
AM=M+1 // 11578
A=A-1 // 11579
M=D // 11580
@12 // 11581
D=A // 11582
@SP // 11583
AM=M+1 // 11584
A=A-1 // 11585
M=D // 11586
@7 // 11587
D=A // 11588
@SP // 11589
AM=M+1 // 11590
A=A-1 // 11591
M=D // 11592
@SP // 11593
AM=M+1 // 11594
A=A-1 // 11595
M=0 // 11596
@SP // 11597
AM=M+1 // 11598
A=A-1 // 11599
M=0 // 11600
// call Output.create
@17 // 11601
D=A // 11602
@14 // 11603
M=D // 11604
@Output.create // 11605
D=A // 11606
@13 // 11607
M=D // 11608
@Output.initMap.ret.95 // 11609
D=A // 11610
@CALL // 11611
0;JMP // 11612
(Output.initMap.ret.95)
@SP // 11613
M=M-1 // 11614

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 11615
D=A // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=D // 11620
@38 // 11621
D=A // 11622
@SP // 11623
AM=M+1 // 11624
A=A-1 // 11625
M=D // 11626
@45 // 11627
D=A // 11628
@SP // 11629
AM=M+1 // 11630
A=A-1 // 11631
M=D // 11632
@25 // 11633
D=A // 11634
@SP // 11635
AM=M+1 // 11636
A=A-1 // 11637
M=D // 11638
@SP // 11639
AM=M+1 // 11640
A=A-1 // 11641
M=0 // 11642
@SP // 11643
AM=M+1 // 11644
A=A-1 // 11645
M=0 // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=0 // 11650
@SP // 11651
AM=M+1 // 11652
A=A-1 // 11653
M=0 // 11654
@SP // 11655
AM=M+1 // 11656
A=A-1 // 11657
M=0 // 11658
@SP // 11659
AM=M+1 // 11660
A=A-1 // 11661
M=0 // 11662
@SP // 11663
AM=M+1 // 11664
A=A-1 // 11665
M=0 // 11666
@SP // 11667
AM=M+1 // 11668
A=A-1 // 11669
M=0 // 11670
// call Output.create
@17 // 11671
D=A // 11672
@14 // 11673
M=D // 11674
@Output.create // 11675
D=A // 11676
@13 // 11677
M=D // 11678
@Output.initMap.ret.96 // 11679
D=A // 11680
@CALL // 11681
0;JMP // 11682
(Output.initMap.ret.96)
@SP // 11683
M=M-1 // 11684

////PushInstruction("constant 0")
@SP // 11685
AM=M+1 // 11686
A=A-1 // 11687
M=0 // 11688

////ReturnInstruction{}
@RETURN // 11689
0;JMP // 11690

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 11691
AM=M+1 // 11692
A=A-1 // 11693
M=0 // 11694

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 11695
D=A // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=D // 11700
// call Array.new
@6 // 11701
D=A // 11702
@14 // 11703
M=D // 11704
@Array.new // 11705
D=A // 11706
@13 // 11707
M=D // 11708
@Output.create.ret.0 // 11709
D=A // 11710
@CALL // 11711
0;JMP // 11712
(Output.create.ret.0)
@SP // 11713
AM=M-1 // 11714
D=M // 11715
@LCL // 11716
A=M // 11717
M=D // 11718

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 11719
D=M // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724
@ARG // 11725
A=M // 11726
D=M // 11727
@SP // 11728
AM=M-1 // 11729
D=D+M // 11730
@SP // 11731
AM=M+1 // 11732
A=A-1 // 11733
M=D // 11734
@LCL // 11735
A=M // 11736
D=M // 11737
@SP // 11738
AM=M-1 // 11739
A=M // 11740
M=D // 11741

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 11742
A=M // 11743
D=M // 11744
@SP // 11745
AM=M+1 // 11746
A=A-1 // 11747
M=D // 11748
@ARG // 11749
A=M+1 // 11750
D=M // 11751
@SP // 11752
AM=M-1 // 11753
A=M // 11754
M=D // 11755

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 11756
A=M // 11757
D=M // 11758
@SP // 11759
AM=M+1 // 11760
A=A-1 // 11761
M=D+1 // 11762
@ARG // 11763
A=M+1 // 11764
A=A+1 // 11765
D=M // 11766
@SP // 11767
AM=M-1 // 11768
A=M // 11769
M=D // 11770

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 11771
A=M // 11772
D=M // 11773
@2 // 11774
D=D+A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779
@ARG // 11780
A=M+1 // 11781
A=A+1 // 11782
A=A+1 // 11783
D=M // 11784
@SP // 11785
AM=M-1 // 11786
A=M // 11787
M=D // 11788

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 11789
A=M // 11790
D=M // 11791
@3 // 11792
D=D+A // 11793
@SP // 11794
AM=M+1 // 11795
A=A-1 // 11796
M=D // 11797
@ARG // 11798
D=M // 11799
@4 // 11800
A=D+A // 11801
D=M // 11802
@SP // 11803
AM=M-1 // 11804
A=M // 11805
M=D // 11806

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 11807
A=M // 11808
D=M // 11809
@4 // 11810
D=D+A // 11811
@SP // 11812
AM=M+1 // 11813
A=A-1 // 11814
M=D // 11815
@ARG // 11816
D=M // 11817
@5 // 11818
A=D+A // 11819
D=M // 11820
@SP // 11821
AM=M-1 // 11822
A=M // 11823
M=D // 11824

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 11825
A=M // 11826
D=M // 11827
@5 // 11828
D=D+A // 11829
@SP // 11830
AM=M+1 // 11831
A=A-1 // 11832
M=D // 11833
@ARG // 11834
D=M // 11835
@6 // 11836
A=D+A // 11837
D=M // 11838
@SP // 11839
AM=M-1 // 11840
A=M // 11841
M=D // 11842

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 11843
A=M // 11844
D=M // 11845
@6 // 11846
D=D+A // 11847
@SP // 11848
AM=M+1 // 11849
A=A-1 // 11850
M=D // 11851
@ARG // 11852
D=M // 11853
@7 // 11854
A=D+A // 11855
D=M // 11856
@SP // 11857
AM=M-1 // 11858
A=M // 11859
M=D // 11860

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 11861
A=M // 11862
D=M // 11863
@7 // 11864
D=D+A // 11865
@SP // 11866
AM=M+1 // 11867
A=A-1 // 11868
M=D // 11869
@ARG // 11870
D=M // 11871
@8 // 11872
A=D+A // 11873
D=M // 11874
@SP // 11875
AM=M-1 // 11876
A=M // 11877
M=D // 11878

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 11879
A=M // 11880
D=M // 11881
@8 // 11882
D=D+A // 11883
@SP // 11884
AM=M+1 // 11885
A=A-1 // 11886
M=D // 11887
@ARG // 11888
D=M // 11889
@9 // 11890
A=D+A // 11891
D=M // 11892
@SP // 11893
AM=M-1 // 11894
A=M // 11895
M=D // 11896

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 11897
A=M // 11898
D=M // 11899
@9 // 11900
D=D+A // 11901
@SP // 11902
AM=M+1 // 11903
A=A-1 // 11904
M=D // 11905
@ARG // 11906
D=M // 11907
@10 // 11908
A=D+A // 11909
D=M // 11910
@SP // 11911
AM=M-1 // 11912
A=M // 11913
M=D // 11914

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 11915
A=M // 11916
D=M // 11917
@10 // 11918
D=D+A // 11919
@SP // 11920
AM=M+1 // 11921
A=A-1 // 11922
M=D // 11923
@ARG // 11924
D=M // 11925
@11 // 11926
A=D+A // 11927
D=M // 11928
@SP // 11929
AM=M-1 // 11930
A=M // 11931
M=D // 11932

////PushInstruction("constant 0")
@SP // 11933
AM=M+1 // 11934
A=A-1 // 11935
M=0 // 11936

////ReturnInstruction{}
@RETURN // 11937
0;JMP // 11938

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
@Output.getMap.EQ.0 // 11939
D=A // 11940
@SP // 11941
AM=M+1 // 11942
A=A-1 // 11943
M=D // 11944
@Output.getMap.LT.1 // 11945
D=A // 11946
@SP // 11947
AM=M+1 // 11948
A=A-1 // 11949
M=D // 11950
@ARG // 11951
A=M // 11952
D=M // 11953
@32 // 11954
D=D-A // 11955
@DO_LT // 11956
0;JMP // 11957
(Output.getMap.LT.1)
@SP // 11958
AM=M+1 // 11959
A=A-1 // 11960
M=D // 11961
@Output.getMap.GT.2 // 11962
D=A // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D // 11967
@ARG // 11968
A=M // 11969
D=M // 11970
@126 // 11971
D=D-A // 11972
@DO_GT // 11973
0;JMP // 11974
(Output.getMap.GT.2)
@SP // 11975
AM=M-1 // 11976
D=D|M // 11977
@DO_EQ // 11978
0;JMP // 11979
(Output.getMap.EQ.0)
@Output.getMap.IfElse1 // 11980
D;JNE // 11981

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 11982
A=M // 11983
M=0 // 11984

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 11985
0;JMP // 11986

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
@Output.0 // 11987
D=M // 11988
@SP // 11989
AM=M+1 // 11990
A=A-1 // 11991
M=D // 11992
@ARG // 11993
A=M // 11994
D=M // 11995
@SP // 11996
AM=M-1 // 11997
A=D+M // 11998
D=M // 11999
@SP // 12000
AM=M+1 // 12001
A=A-1 // 12002
M=D // 12003

////ReturnInstruction{}
@RETURN // 12004
0;JMP // 12005

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=static 1}
//}

@ARG // 12006
A=M+1 // 12007
D=M // 12008
@Output.1 // 12009
M=D // 12010

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 2}
//}

@ARG // 12011
A=M // 12012
D=M // 12013
@Output.2 // 12014
M=D // 12015

////PushInstruction("constant 0")
@SP // 12016
AM=M+1 // 12017
A=A-1 // 12018
M=0 // 12019

////ReturnInstruction{}
@RETURN // 12020
0;JMP // 12021

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 12022
D=A // 12023
@SP // 12024
AM=D+M // 12025
A=A-1 // 12026
M=0 // 12027
A=A-1 // 12028
M=0 // 12029
A=A-1 // 12030
M=0 // 12031
A=A-1 // 12032
M=0 // 12033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12034
A=M // 12035
D=M // 12036
@SP // 12037
AM=M+1 // 12038
A=A-1 // 12039
M=D // 12040
// call Output.getMap
@6 // 12041
D=A // 12042
@14 // 12043
M=D // 12044
@Output.getMap // 12045
D=A // 12046
@13 // 12047
M=D // 12048
@Output.printChar.ret.0 // 12049
D=A // 12050
@CALL // 12051
0;JMP // 12052
(Output.printChar.ret.0)
@SP // 12053
AM=M-1 // 12054
D=M // 12055
@LCL // 12056
A=M // 12057
M=D // 12058

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12059
A=M+1 // 12060
A=A+1 // 12061
A=A+1 // 12062
M=0 // 12063

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
@Output.printChar.LT.3 // 12064
D=A // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=D // 12069
@LCL // 12070
A=M+1 // 12071
A=A+1 // 12072
A=A+1 // 12073
D=M // 12074
@11 // 12075
D=D-A // 12076
@DO_LT // 12077
0;JMP // 12078
(Output.printChar.LT.3)
D=!D // 12079
@WHILE_END_Output.printChar1 // 12080
D;JNE // 12081

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

@Output.2 // 12082
D=M // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=D // 12087
@11 // 12088
D=A // 12089
@SP // 12090
AM=M+1 // 12091
A=A-1 // 12092
M=D // 12093
// call Math.multiply
@7 // 12094
D=A // 12095
@14 // 12096
M=D // 12097
@Math.multiply // 12098
D=A // 12099
@13 // 12100
M=D // 12101
@Output.printChar.ret.1 // 12102
D=A // 12103
@CALL // 12104
0;JMP // 12105
(Output.printChar.ret.1)
@LCL // 12106
A=M+1 // 12107
A=A+1 // 12108
A=A+1 // 12109
D=M // 12110
@SP // 12111
AM=M-1 // 12112
D=D+M // 12113
@SP // 12114
AM=M+1 // 12115
A=A-1 // 12116
M=D // 12117
@32 // 12118
D=A // 12119
@SP // 12120
AM=M+1 // 12121
A=A-1 // 12122
M=D // 12123
// call Math.multiply
@7 // 12124
D=A // 12125
@14 // 12126
M=D // 12127
@Math.multiply // 12128
D=A // 12129
@13 // 12130
M=D // 12131
@Output.printChar.ret.2 // 12132
D=A // 12133
@CALL // 12134
0;JMP // 12135
(Output.printChar.ret.2)
@SP // 12136
AM=M-1 // 12137
D=M // 12138
@16384 // 12139
D=D+A // 12140
@SP // 12141
AM=M+1 // 12142
A=A-1 // 12143
M=D // 12144
@Output.1 // 12145
D=M // 12146
@SP // 12147
AM=M+1 // 12148
A=A-1 // 12149
M=D // 12150
@2 // 12151
D=A // 12152
@SP // 12153
AM=M+1 // 12154
A=A-1 // 12155
M=D // 12156
// call Math.divide
@7 // 12157
D=A // 12158
@14 // 12159
M=D // 12160
@Math.divide // 12161
D=A // 12162
@13 // 12163
M=D // 12164
@Output.printChar.ret.3 // 12165
D=A // 12166
@CALL // 12167
0;JMP // 12168
(Output.printChar.ret.3)
@SP // 12169
AM=M-1 // 12170
D=M // 12171
@SP // 12172
AM=M-1 // 12173
D=D+M // 12174
@LCL // 12175
A=M+1 // 12176
M=D // 12177

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
@Output.printChar.EQ.4 // 12178
D=A // 12179
@SP // 12180
AM=M+1 // 12181
A=A-1 // 12182
M=D // 12183
@Output.1 // 12184
D=M // 12185
@1 // 12186
D=D&A // 12187
@DO_EQ // 12188
0;JMP // 12189
(Output.printChar.EQ.4)
@Output.printChar.IfElse1 // 12190
D;JEQ // 12191

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

@LCL // 12192
A=M+1 // 12193
A=A+1 // 12194
A=A+1 // 12195
D=M // 12196
A=A-1 // 12197
A=A-1 // 12198
A=A-1 // 12199
A=D+M // 12200
D=M // 12201
@LCL // 12202
A=M+1 // 12203
A=A+1 // 12204
M=D // 12205

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 12206
0;JMP // 12207

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

@LCL // 12208
A=M+1 // 12209
A=A+1 // 12210
A=A+1 // 12211
D=M // 12212
A=A-1 // 12213
A=A-1 // 12214
A=A-1 // 12215
A=D+M // 12216
D=M // 12217
@SP // 12218
AM=M+1 // 12219
A=A-1 // 12220
M=D // 12221
@256 // 12222
D=A // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=D // 12227
// call Math.multiply
@7 // 12228
D=A // 12229
@14 // 12230
M=D // 12231
@Math.multiply // 12232
D=A // 12233
@13 // 12234
M=D // 12235
@Output.printChar.ret.4 // 12236
D=A // 12237
@CALL // 12238
0;JMP // 12239
(Output.printChar.ret.4)
@SP // 12240
AM=M-1 // 12241
D=M // 12242
@LCL // 12243
A=M+1 // 12244
A=A+1 // 12245
M=D // 12246

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
@LCL // 12247
A=M+1 // 12248
D=M // 12249
@SP // 12250
AM=M+1 // 12251
A=A-1 // 12252
M=D // 12253
@LCL // 12254
A=M+1 // 12255
D=M // 12256
@0 // 12257
A=D+A // 12258
D=M // 12259
@SP // 12260
AM=M+1 // 12261
A=A-1 // 12262
M=D // 12263
@LCL // 12264
A=M+1 // 12265
A=A+1 // 12266
D=M // 12267
@SP // 12268
AM=M-1 // 12269
D=D|M // 12270
@SP // 12271
AM=M-1 // 12272
A=M // 12273
M=D // 12274

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

@LCL // 12275
A=M+1 // 12276
A=A+1 // 12277
A=A+1 // 12278
M=M+1 // 12279

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 12280
0;JMP // 12281

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
@Output.printChar.EQ.5 // 12282
D=A // 12283
@SP // 12284
AM=M+1 // 12285
A=A-1 // 12286
M=D // 12287
@Output.1 // 12288
D=M // 12289
@63 // 12290
D=D-A // 12291
@DO_EQ // 12292
0;JMP // 12293
(Output.printChar.EQ.5)
D=!D // 12294
@Output.printChar.IfElse2 // 12295
D;JNE // 12296

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 12297
D=A // 12298
@14 // 12299
M=D // 12300
@Output.println // 12301
D=A // 12302
@13 // 12303
M=D // 12304
@Output.printChar.ret.5 // 12305
D=A // 12306
@CALL // 12307
0;JMP // 12308
(Output.printChar.ret.5)
@SP // 12309
M=M-1 // 12310

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 12311
0;JMP // 12312

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

@Output.1 // 12313
M=M+1 // 12314

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 12315
AM=M+1 // 12316
A=A-1 // 12317
M=0 // 12318

////ReturnInstruction{}
@RETURN // 12319
0;JMP // 12320

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 12321
M=M+1 // 12322
AM=M+1 // 12323
A=A-1 // 12324
M=0 // 12325
A=A-1 // 12326
M=0 // 12327

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12328
A=M // 12329
M=0 // 12330

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 12331
A=M // 12332
D=M // 12333
@SP // 12334
AM=M+1 // 12335
A=A-1 // 12336
M=D // 12337
// call String.length
@6 // 12338
D=A // 12339
@14 // 12340
M=D // 12341
@String.length // 12342
D=A // 12343
@13 // 12344
M=D // 12345
@Output.printString.ret.0 // 12346
D=A // 12347
@CALL // 12348
0;JMP // 12349
(Output.printString.ret.0)
@SP // 12350
AM=M-1 // 12351
D=M // 12352
@LCL // 12353
A=M+1 // 12354
M=D // 12355

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
@Output.printString.LT.6 // 12356
D=A // 12357
@SP // 12358
AM=M+1 // 12359
A=A-1 // 12360
M=D // 12361
@LCL // 12362
A=M+1 // 12363
D=M // 12364
A=A-1 // 12365
D=M-D // 12366
@DO_LT // 12367
0;JMP // 12368
(Output.printString.LT.6)
D=!D // 12369
@WHILE_END_Output.printString1 // 12370
D;JNE // 12371

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12372
A=M // 12373
D=M // 12374
@SP // 12375
AM=M+1 // 12376
A=A-1 // 12377
M=D // 12378
@LCL // 12379
A=M // 12380
D=M // 12381
@SP // 12382
AM=M+1 // 12383
A=A-1 // 12384
M=D // 12385
// call String.charAt
@7 // 12386
D=A // 12387
@14 // 12388
M=D // 12389
@String.charAt // 12390
D=A // 12391
@13 // 12392
M=D // 12393
@Output.printString.ret.1 // 12394
D=A // 12395
@CALL // 12396
0;JMP // 12397
(Output.printString.ret.1)
// call Output.printChar
@6 // 12398
D=A // 12399
@14 // 12400
M=D // 12401
@Output.printChar // 12402
D=A // 12403
@13 // 12404
M=D // 12405
@Output.printString.ret.2 // 12406
D=A // 12407
@CALL // 12408
0;JMP // 12409
(Output.printString.ret.2)
@SP // 12410
M=M-1 // 12411

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

@LCL // 12412
A=M // 12413
M=M+1 // 12414

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 12415
0;JMP // 12416

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 12417
AM=M+1 // 12418
A=A-1 // 12419
M=0 // 12420

////ReturnInstruction{}
@RETURN // 12421
0;JMP // 12422

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 12423
AM=M+1 // 12424
A=A-1 // 12425
M=0 // 12426

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 12427
D=A // 12428
@SP // 12429
AM=M+1 // 12430
A=A-1 // 12431
M=D // 12432
// call String.new
@6 // 12433
D=A // 12434
@14 // 12435
M=D // 12436
@String.new // 12437
D=A // 12438
@13 // 12439
M=D // 12440
@Output.printInt.ret.0 // 12441
D=A // 12442
@CALL // 12443
0;JMP // 12444
(Output.printInt.ret.0)
@SP // 12445
AM=M-1 // 12446
D=M // 12447
@LCL // 12448
A=M // 12449
M=D // 12450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12451
A=M // 12452
D=M // 12453
@SP // 12454
AM=M+1 // 12455
A=A-1 // 12456
M=D // 12457
@ARG // 12458
A=M // 12459
D=M // 12460
@SP // 12461
AM=M+1 // 12462
A=A-1 // 12463
M=D // 12464
// call String.setInt
@7 // 12465
D=A // 12466
@14 // 12467
M=D // 12468
@String.setInt // 12469
D=A // 12470
@13 // 12471
M=D // 12472
@Output.printInt.ret.1 // 12473
D=A // 12474
@CALL // 12475
0;JMP // 12476
(Output.printInt.ret.1)
@SP // 12477
M=M-1 // 12478

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12479
A=M // 12480
D=M // 12481
@SP // 12482
AM=M+1 // 12483
A=A-1 // 12484
M=D // 12485
// call Output.printString
@6 // 12486
D=A // 12487
@14 // 12488
M=D // 12489
@Output.printString // 12490
D=A // 12491
@13 // 12492
M=D // 12493
@Output.printInt.ret.2 // 12494
D=A // 12495
@CALL // 12496
0;JMP // 12497
(Output.printInt.ret.2)
@SP // 12498
M=M-1 // 12499

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12500
A=M // 12501
D=M // 12502
@SP // 12503
AM=M+1 // 12504
A=A-1 // 12505
M=D // 12506
// call String.dispose
@6 // 12507
D=A // 12508
@14 // 12509
M=D // 12510
@String.dispose // 12511
D=A // 12512
@13 // 12513
M=D // 12514
@Output.printInt.ret.3 // 12515
D=A // 12516
@CALL // 12517
0;JMP // 12518
(Output.printInt.ret.3)
@SP // 12519
M=M-1 // 12520

////PushInstruction("constant 0")
@SP // 12521
AM=M+1 // 12522
A=A-1 // 12523
M=0 // 12524

////ReturnInstruction{}
@RETURN // 12525
0;JMP // 12526

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12527
M=0 // 12528

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
@Output.println.EQ.7 // 12529
D=A // 12530
@SP // 12531
AM=M+1 // 12532
A=A-1 // 12533
M=D // 12534
@Output.2 // 12535
D=M // 12536
@22 // 12537
D=D-A // 12538
@DO_EQ // 12539
0;JMP // 12540
(Output.println.EQ.7)
D=!D // 12541
@Output.println.IfElse1 // 12542
D;JNE // 12543

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12544
M=0 // 12545

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 12546
0;JMP // 12547

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

@Output.2 // 12548
M=M+1 // 12549

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12550
AM=M+1 // 12551
A=A-1 // 12552
M=0 // 12553

////ReturnInstruction{}
@RETURN // 12554
0;JMP // 12555

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
@Output.backSpace.EQ.8 // 12556
D=A // 12557
@SP // 12558
AM=M+1 // 12559
A=A-1 // 12560
M=D // 12561
@Output.1 // 12562
D=M // 12563
@DO_EQ // 12564
0;JMP // 12565
(Output.backSpace.EQ.8)
@Output.backSpace.IfElse1 // 12566
D;JEQ // 12567

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

@Output.2 // 12568
M=M-1 // 12569

////PushPopPair {
//  push: PushInstruction("constant 63")
//  pop:  PopInstruction{address=static 1}
//}

@63 // 12570
D=A // 12571
@Output.1 // 12572
M=D // 12573

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 12574
0;JMP // 12575

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

@Output.1 // 12576
M=M-1 // 12577

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12578
AM=M+1 // 12579
A=A-1 // 12580
M=0 // 12581

////ReturnInstruction{}
@RETURN // 12582
0;JMP // 12583

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 12584
M=-1 // 12585

////PushInstruction("constant 0")
@SP // 12586
AM=M+1 // 12587
A=A-1 // 12588
M=0 // 12589

////ReturnInstruction{}
@RETURN // 12590
0;JMP // 12591

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 12592
A=M // 12593
D=M // 12594
@Screen.0 // 12595
M=D // 12596

////PushInstruction("constant 0")
@SP // 12597
AM=M+1 // 12598
A=A-1 // 12599
M=0 // 12600

////ReturnInstruction{}
@RETURN // 12601
0;JMP // 12602

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 12603
M=M+1 // 12604
AM=M+1 // 12605
A=A-1 // 12606
M=0 // 12607
A=A-1 // 12608
M=0 // 12609

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

@ARG // 12610
A=M+1 // 12611
D=M // 12612
@SP // 12613
AM=M+1 // 12614
A=A-1 // 12615
M=D // 12616
@32 // 12617
D=A // 12618
@SP // 12619
AM=M+1 // 12620
A=A-1 // 12621
M=D // 12622
// call Math.multiply
@7 // 12623
D=A // 12624
@14 // 12625
M=D // 12626
@Math.multiply // 12627
D=A // 12628
@13 // 12629
M=D // 12630
@Screen.drawPixel.ret.0 // 12631
D=A // 12632
@CALL // 12633
0;JMP // 12634
(Screen.drawPixel.ret.0)
@ARG // 12635
A=M // 12636
D=M // 12637
@SP // 12638
AM=M+1 // 12639
A=A-1 // 12640
M=D // 12641
@16 // 12642
D=A // 12643
@SP // 12644
AM=M+1 // 12645
A=A-1 // 12646
M=D // 12647
// call Math.divide
@7 // 12648
D=A // 12649
@14 // 12650
M=D // 12651
@Math.divide // 12652
D=A // 12653
@13 // 12654
M=D // 12655
@Screen.drawPixel.ret.1 // 12656
D=A // 12657
@CALL // 12658
0;JMP // 12659
(Screen.drawPixel.ret.1)
@SP // 12660
AM=M-1 // 12661
D=M // 12662
@SP // 12663
AM=M-1 // 12664
D=D+M // 12665
@16384 // 12666
D=D+A // 12667
@LCL // 12668
A=M // 12669
M=D // 12670

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

@ARG // 12671
A=M // 12672
D=M // 12673
@15 // 12674
D=D&A // 12675
@LCL // 12676
A=M+1 // 12677
M=D // 12678

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
@Screen.drawPixel.EQ.0 // 12679
D=A // 12680
@SP // 12681
AM=M+1 // 12682
A=A-1 // 12683
M=D // 12684
@Screen.drawPixel.EQ.1 // 12685
D=A // 12686
@SP // 12687
AM=M+1 // 12688
A=A-1 // 12689
M=D // 12690
@Screen.0 // 12691
D=M // 12692
@DO_EQ // 12693
0;JMP // 12694
(Screen.drawPixel.EQ.1)
D=!D // 12695
@DO_EQ // 12696
0;JMP // 12697
(Screen.drawPixel.EQ.0)
@Screen.drawPixel.IfElse1 // 12698
D;JNE // 12699

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
@LCL // 12700
A=M // 12701
D=M // 12702
@SP // 12703
AM=M+1 // 12704
A=A-1 // 12705
M=D // 12706
@LCL // 12707
A=M // 12708
D=M // 12709
@0 // 12710
A=D+A // 12711
D=M // 12712
@SP // 12713
AM=M+1 // 12714
A=A-1 // 12715
M=D // 12716
@LCL // 12717
A=M+1 // 12718
D=M // 12719
@SP // 12720
AM=M+1 // 12721
A=A-1 // 12722
M=D // 12723
// call Math.twoToThe
@6 // 12724
D=A // 12725
@14 // 12726
M=D // 12727
@Math.twoToThe // 12728
D=A // 12729
@13 // 12730
M=D // 12731
@Screen.drawPixel.ret.2 // 12732
D=A // 12733
@CALL // 12734
0;JMP // 12735
(Screen.drawPixel.ret.2)
@SP // 12736
AM=M-1 // 12737
D=M // 12738
@SP // 12739
AM=M-1 // 12740
D=D|M // 12741
@SP // 12742
AM=M-1 // 12743
A=M // 12744
M=D // 12745

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 12746
0;JMP // 12747

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
@LCL // 12748
A=M // 12749
D=M // 12750
@SP // 12751
AM=M+1 // 12752
A=A-1 // 12753
M=D // 12754
@LCL // 12755
A=M // 12756
D=M // 12757
@0 // 12758
A=D+A // 12759
D=M // 12760
@SP // 12761
AM=M+1 // 12762
A=A-1 // 12763
M=D // 12764
@LCL // 12765
A=M+1 // 12766
D=M // 12767
@SP // 12768
AM=M+1 // 12769
A=A-1 // 12770
M=D // 12771
// call Math.twoToThe
@6 // 12772
D=A // 12773
@14 // 12774
M=D // 12775
@Math.twoToThe // 12776
D=A // 12777
@13 // 12778
M=D // 12779
@Screen.drawPixel.ret.3 // 12780
D=A // 12781
@CALL // 12782
0;JMP // 12783
(Screen.drawPixel.ret.3)
@SP // 12784
AM=M-1 // 12785
D=M // 12786
D=!D // 12787
@SP // 12788
AM=M-1 // 12789
D=D&M // 12790
@SP // 12791
AM=M-1 // 12792
A=M // 12793
M=D // 12794

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 12795
AM=M+1 // 12796
A=A-1 // 12797
M=0 // 12798

////ReturnInstruction{}
@RETURN // 12799
0;JMP // 12800

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 12801
D=A // 12802
@SP // 12803
AM=D+M // 12804
A=A-1 // 12805
M=0 // 12806
A=A-1 // 12807
M=0 // 12808
A=A-1 // 12809
M=0 // 12810
A=A-1 // 12811
M=0 // 12812
A=A-1 // 12813
M=0 // 12814
A=A-1 // 12815
M=0 // 12816

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

@ARG // 12817
A=M+1 // 12818
A=A+1 // 12819
D=M // 12820
A=A-1 // 12821
A=A-1 // 12822
D=D-M // 12823
@SP // 12824
AM=M+1 // 12825
A=A-1 // 12826
M=D // 12827
// call Math.abs
@6 // 12828
D=A // 12829
@14 // 12830
M=D // 12831
@Math.abs // 12832
D=A // 12833
@13 // 12834
M=D // 12835
@Screen.drawLine.ret.0 // 12836
D=A // 12837
@CALL // 12838
0;JMP // 12839
(Screen.drawLine.ret.0)
@SP // 12840
AM=M-1 // 12841
D=M // 12842
@LCL // 12843
A=M // 12844
M=D // 12845

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

@ARG // 12846
A=M+1 // 12847
A=A+1 // 12848
A=A+1 // 12849
D=M // 12850
A=A-1 // 12851
A=A-1 // 12852
D=D-M // 12853
@SP // 12854
AM=M+1 // 12855
A=A-1 // 12856
M=D // 12857
// call Math.abs
@6 // 12858
D=A // 12859
@14 // 12860
M=D // 12861
@Math.abs // 12862
D=A // 12863
@13 // 12864
M=D // 12865
@Screen.drawLine.ret.1 // 12866
D=A // 12867
@CALL // 12868
0;JMP // 12869
(Screen.drawLine.ret.1)
@SP // 12870
AM=M-1 // 12871
D=M // 12872
@LCL // 12873
A=M+1 // 12874
M=D // 12875

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
@Screen.drawLine.LT.2 // 12876
D=A // 12877
@SP // 12878
AM=M+1 // 12879
A=A-1 // 12880
M=D // 12881
@ARG // 12882
A=M+1 // 12883
A=A+1 // 12884
D=M // 12885
A=A-1 // 12886
A=A-1 // 12887
D=M-D // 12888
@DO_LT // 12889
0;JMP // 12890
(Screen.drawLine.LT.2)
D=!D // 12891
@Screen.drawLine.IfElse1 // 12892
D;JNE // 12893

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12894
A=M+1 // 12895
A=A+1 // 12896
M=1 // 12897

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 12898
0;JMP // 12899

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12900
A=M+1 // 12901
A=A+1 // 12902
M=-1 // 12903

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
@Screen.drawLine.LT.3 // 12904
D=A // 12905
@SP // 12906
AM=M+1 // 12907
A=A-1 // 12908
M=D // 12909
@ARG // 12910
A=M+1 // 12911
A=A+1 // 12912
A=A+1 // 12913
D=M // 12914
A=A-1 // 12915
A=A-1 // 12916
D=M-D // 12917
@DO_LT // 12918
0;JMP // 12919
(Screen.drawLine.LT.3)
D=!D // 12920
@Screen.drawLine.IfElse2 // 12921
D;JNE // 12922

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12923
A=M+1 // 12924
A=A+1 // 12925
A=A+1 // 12926
M=1 // 12927

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 12928
0;JMP // 12929

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 12930
A=M+1 // 12931
A=A+1 // 12932
A=A+1 // 12933
M=-1 // 12934

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

@LCL // 12935
A=M+1 // 12936
D=M // 12937
A=A-1 // 12938
D=M-D // 12939
@SP // 12940
AM=M+1 // 12941
A=A-1 // 12942
M=D // 12943
@LCL // 12944
D=M // 12945
@4 // 12946
A=D+A // 12947
D=A // 12948
@R13 // 12949
M=D // 12950
@SP // 12951
AM=M-1 // 12952
D=M // 12953
@R13 // 12954
A=M // 12955
M=D // 12956

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
D=0 // 12957
@WHILE_END_Screen.drawLine1 // 12958
D;JNE // 12959

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 12960
A=M // 12961
D=M // 12962
@SP // 12963
AM=M+1 // 12964
A=A-1 // 12965
M=D // 12966
@ARG // 12967
A=M+1 // 12968
D=M // 12969
@SP // 12970
AM=M+1 // 12971
A=A-1 // 12972
M=D // 12973
// call Screen.drawPixel
@7 // 12974
D=A // 12975
@14 // 12976
M=D // 12977
@Screen.drawPixel // 12978
D=A // 12979
@13 // 12980
M=D // 12981
@Screen.drawLine.ret.2 // 12982
D=A // 12983
@CALL // 12984
0;JMP // 12985
(Screen.drawLine.ret.2)
@SP // 12986
M=M-1 // 12987

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
@Screen.drawLine.EQ.4 // 12988
D=A // 12989
@SP // 12990
AM=M+1 // 12991
A=A-1 // 12992
M=D // 12993
@Screen.drawLine.EQ.5 // 12994
D=A // 12995
@SP // 12996
AM=M+1 // 12997
A=A-1 // 12998
M=D // 12999
@ARG // 13000
A=M+1 // 13001
A=A+1 // 13002
D=M // 13003
A=A-1 // 13004
A=A-1 // 13005
D=M-D // 13006
@DO_EQ // 13007
0;JMP // 13008
(Screen.drawLine.EQ.5)
@SP // 13009
AM=M+1 // 13010
A=A-1 // 13011
M=D // 13012
@Screen.drawLine.EQ.6 // 13013
D=A // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018
@ARG // 13019
A=M+1 // 13020
A=A+1 // 13021
A=A+1 // 13022
D=M // 13023
A=A-1 // 13024
A=A-1 // 13025
D=M-D // 13026
@DO_EQ // 13027
0;JMP // 13028
(Screen.drawLine.EQ.6)
@SP // 13029
AM=M-1 // 13030
D=D&M // 13031
@DO_EQ // 13032
0;JMP // 13033
(Screen.drawLine.EQ.4)
@Screen.drawLine.IfElse3 // 13034
D;JNE // 13035

////PushInstruction("constant 0")
@SP // 13036
AM=M+1 // 13037
A=A-1 // 13038
M=0 // 13039

////ReturnInstruction{}
@RETURN // 13040
0;JMP // 13041

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 13042
0;JMP // 13043

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

@LCL // 13044
D=M // 13045
@4 // 13046
A=D+A // 13047
D=M // 13048
D=D+M // 13049
@SP // 13050
AM=M+1 // 13051
A=A-1 // 13052
M=D // 13053
@LCL // 13054
D=M // 13055
@5 // 13056
A=D+A // 13057
D=A // 13058
@R13 // 13059
M=D // 13060
@SP // 13061
AM=M-1 // 13062
D=M // 13063
@R13 // 13064
A=M // 13065
M=D // 13066

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
@Screen.drawLine.GT.7 // 13067
D=A // 13068
@SP // 13069
AM=M+1 // 13070
A=A-1 // 13071
M=D // 13072
@LCL // 13073
D=M // 13074
@5 // 13075
A=D+A // 13076
D=M // 13077
@SP // 13078
AM=M+1 // 13079
A=A-1 // 13080
M=D // 13081
@LCL // 13082
A=M+1 // 13083
D=M // 13084
@SP // 13085
AM=M-1 // 13086
D=D+M // 13087
@DO_GT // 13088
0;JMP // 13089
(Screen.drawLine.GT.7)
D=!D // 13090
@Screen.drawLine.IfElse4 // 13091
D;JNE // 13092

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

@LCL // 13093
D=M // 13094
@4 // 13095
A=D+A // 13096
D=M // 13097
A=A-1 // 13098
A=A-1 // 13099
A=A-1 // 13100
D=D-M // 13101
@SP // 13102
AM=M+1 // 13103
A=A-1 // 13104
M=D // 13105
@LCL // 13106
D=M // 13107
@4 // 13108
A=D+A // 13109
D=A // 13110
@R13 // 13111
M=D // 13112
@SP // 13113
AM=M-1 // 13114
D=M // 13115
@R13 // 13116
A=M // 13117
M=D // 13118

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

@LCL // 13119
A=M+1 // 13120
A=A+1 // 13121
D=M // 13122
@ARG // 13123
A=M // 13124
M=D+M // 13125

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 13126
0;JMP // 13127

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
@Screen.drawLine.LT.8 // 13128
D=A // 13129
@SP // 13130
AM=M+1 // 13131
A=A-1 // 13132
M=D // 13133
@LCL // 13134
D=M // 13135
@5 // 13136
A=D+A // 13137
D=M // 13138
@SP // 13139
AM=M+1 // 13140
A=A-1 // 13141
M=D // 13142
@LCL // 13143
A=M // 13144
D=M // 13145
@SP // 13146
AM=M-1 // 13147
D=M-D // 13148
@DO_LT // 13149
0;JMP // 13150
(Screen.drawLine.LT.8)
D=!D // 13151
@Screen.drawLine.IfElse5 // 13152
D;JNE // 13153

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

@LCL // 13154
D=M // 13155
@4 // 13156
A=D+A // 13157
D=M // 13158
@SP // 13159
AM=M+1 // 13160
A=A-1 // 13161
M=D // 13162
@LCL // 13163
A=M // 13164
D=M // 13165
@SP // 13166
AM=M-1 // 13167
D=D+M // 13168
@SP // 13169
AM=M+1 // 13170
A=A-1 // 13171
M=D // 13172
@LCL // 13173
D=M // 13174
@4 // 13175
A=D+A // 13176
D=A // 13177
@R13 // 13178
M=D // 13179
@SP // 13180
AM=M-1 // 13181
D=M // 13182
@R13 // 13183
A=M // 13184
M=D // 13185

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

@LCL // 13186
A=M+1 // 13187
A=A+1 // 13188
A=A+1 // 13189
D=M // 13190
@ARG // 13191
A=M+1 // 13192
M=D+M // 13193

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 13194
0;JMP // 13195

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 13196
0;JMP // 13197

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 13198
AM=M+1 // 13199
A=A-1 // 13200
M=0 // 13201

////ReturnInstruction{}
@RETURN // 13202
0;JMP // 13203

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 13204
AM=M+1 // 13205
A=A-1 // 13206
M=0 // 13207

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 13208
A=M // 13209
D=M // 13210
@LCL // 13211
A=M // 13212
M=D // 13213

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
@Screen.drawHorizontalLine.EQ.9 // 13214
D=A // 13215
@SP // 13216
AM=M+1 // 13217
A=A-1 // 13218
M=D // 13219
@Screen.drawHorizontalLine.GT.10 // 13220
D=A // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225
@LCL // 13226
A=M // 13227
D=M // 13228
@SP // 13229
AM=M+1 // 13230
A=A-1 // 13231
M=D // 13232
@ARG // 13233
A=M+1 // 13234
D=M // 13235
@SP // 13236
AM=M-1 // 13237
D=M-D // 13238
@DO_GT // 13239
0;JMP // 13240
(Screen.drawHorizontalLine.GT.10)
D=!D // 13241
@DO_EQ // 13242
0;JMP // 13243
(Screen.drawHorizontalLine.EQ.9)
@WHILE_END_Screen.drawHorizontalLine1 // 13244
D;JNE // 13245

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13246
A=M // 13247
D=M // 13248
@SP // 13249
AM=M+1 // 13250
A=A-1 // 13251
M=D // 13252
@ARG // 13253
A=M+1 // 13254
A=A+1 // 13255
D=M // 13256
@SP // 13257
AM=M+1 // 13258
A=A-1 // 13259
M=D // 13260
// call Screen.drawPixel
@7 // 13261
D=A // 13262
@14 // 13263
M=D // 13264
@Screen.drawPixel // 13265
D=A // 13266
@13 // 13267
M=D // 13268
@Screen.drawHorizontalLine.ret.0 // 13269
D=A // 13270
@CALL // 13271
0;JMP // 13272
(Screen.drawHorizontalLine.ret.0)
@SP // 13273
M=M-1 // 13274

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

@LCL // 13275
A=M // 13276
M=M+1 // 13277

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 13278
0;JMP // 13279

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 13280
AM=M+1 // 13281
A=A-1 // 13282
M=0 // 13283

////ReturnInstruction{}
@RETURN // 13284
0;JMP // 13285

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13286
D=A // 13287
@SP // 13288
AM=D+M // 13289
A=A-1 // 13290
M=0 // 13291
A=A-1 // 13292
M=0 // 13293
A=A-1 // 13294
M=0 // 13295
A=A-1 // 13296
M=0 // 13297
A=A-1 // 13298
M=0 // 13299

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13300
A=M // 13301
M=0 // 13302

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13303
A=M+1 // 13304
A=A+1 // 13305
D=M // 13306
@LCL // 13307
A=M+1 // 13308
M=D // 13309

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

@ARG // 13310
A=M+1 // 13311
A=A+1 // 13312
D=M // 13313
D=D-1 // 13314
D=-D // 13315
@LCL // 13316
A=M+1 // 13317
A=A+1 // 13318
M=D // 13319

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
@Screen.drawCircle.EQ.11 // 13320
D=A // 13321
@SP // 13322
AM=M+1 // 13323
A=A-1 // 13324
M=D // 13325
@Screen.drawCircle.GT.12 // 13326
D=A // 13327
@SP // 13328
AM=M+1 // 13329
A=A-1 // 13330
M=D // 13331
@LCL // 13332
A=M+1 // 13333
D=M // 13334
A=A-1 // 13335
D=M-D // 13336
@DO_GT // 13337
0;JMP // 13338
(Screen.drawCircle.GT.12)
D=!D // 13339
@DO_EQ // 13340
0;JMP // 13341
(Screen.drawCircle.EQ.11)
@WHILE_END_Screen.drawCircle1 // 13342
D;JNE // 13343

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

@ARG // 13344
A=M // 13345
D=M // 13346
@SP // 13347
AM=M+1 // 13348
A=A-1 // 13349
M=D // 13350
@LCL // 13351
A=M // 13352
D=M // 13353
@SP // 13354
AM=M-1 // 13355
D=M-D // 13356
@SP // 13357
AM=M+1 // 13358
A=A-1 // 13359
M=D // 13360
@ARG // 13361
A=M // 13362
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
D=D+M // 13373
@SP // 13374
AM=M+1 // 13375
A=A-1 // 13376
M=D // 13377
@ARG // 13378
A=M+1 // 13379
D=M // 13380
@SP // 13381
AM=M+1 // 13382
A=A-1 // 13383
M=D // 13384
@LCL // 13385
A=M+1 // 13386
D=M // 13387
@SP // 13388
AM=M-1 // 13389
D=D+M // 13390
@SP // 13391
AM=M+1 // 13392
A=A-1 // 13393
M=D // 13394
// call Screen.drawHorizontalLine
@8 // 13395
D=A // 13396
@14 // 13397
M=D // 13398
@Screen.drawHorizontalLine // 13399
D=A // 13400
@13 // 13401
M=D // 13402
@Screen.drawCircle.ret.0 // 13403
D=A // 13404
@CALL // 13405
0;JMP // 13406
(Screen.drawCircle.ret.0)
@SP // 13407
M=M-1 // 13408

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

@ARG // 13409
A=M // 13410
D=M // 13411
@SP // 13412
AM=M+1 // 13413
A=A-1 // 13414
M=D // 13415
@LCL // 13416
A=M // 13417
D=M // 13418
@SP // 13419
AM=M-1 // 13420
D=M-D // 13421
@SP // 13422
AM=M+1 // 13423
A=A-1 // 13424
M=D // 13425
@ARG // 13426
A=M // 13427
D=M // 13428
@SP // 13429
AM=M+1 // 13430
A=A-1 // 13431
M=D // 13432
@LCL // 13433
A=M // 13434
D=M // 13435
@SP // 13436
AM=M-1 // 13437
D=D+M // 13438
@SP // 13439
AM=M+1 // 13440
A=A-1 // 13441
M=D // 13442
@ARG // 13443
A=M+1 // 13444
D=M // 13445
@SP // 13446
AM=M+1 // 13447
A=A-1 // 13448
M=D // 13449
@LCL // 13450
A=M+1 // 13451
D=M // 13452
@SP // 13453
AM=M-1 // 13454
D=M-D // 13455
@SP // 13456
AM=M+1 // 13457
A=A-1 // 13458
M=D // 13459
// call Screen.drawHorizontalLine
@8 // 13460
D=A // 13461
@14 // 13462
M=D // 13463
@Screen.drawHorizontalLine // 13464
D=A // 13465
@13 // 13466
M=D // 13467
@Screen.drawCircle.ret.1 // 13468
D=A // 13469
@CALL // 13470
0;JMP // 13471
(Screen.drawCircle.ret.1)
@SP // 13472
M=M-1 // 13473

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

@ARG // 13474
A=M // 13475
D=M // 13476
@SP // 13477
AM=M+1 // 13478
A=A-1 // 13479
M=D // 13480
@LCL // 13481
A=M+1 // 13482
D=M // 13483
@SP // 13484
AM=M-1 // 13485
D=M-D // 13486
@SP // 13487
AM=M+1 // 13488
A=A-1 // 13489
M=D // 13490
@ARG // 13491
A=M // 13492
D=M // 13493
@SP // 13494
AM=M+1 // 13495
A=A-1 // 13496
M=D // 13497
@LCL // 13498
A=M+1 // 13499
D=M // 13500
@SP // 13501
AM=M-1 // 13502
D=D+M // 13503
@SP // 13504
AM=M+1 // 13505
A=A-1 // 13506
M=D // 13507
@ARG // 13508
A=M+1 // 13509
D=M // 13510
@SP // 13511
AM=M+1 // 13512
A=A-1 // 13513
M=D // 13514
@LCL // 13515
A=M // 13516
D=M // 13517
@SP // 13518
AM=M-1 // 13519
D=D+M // 13520
@SP // 13521
AM=M+1 // 13522
A=A-1 // 13523
M=D // 13524
// call Screen.drawHorizontalLine
@8 // 13525
D=A // 13526
@14 // 13527
M=D // 13528
@Screen.drawHorizontalLine // 13529
D=A // 13530
@13 // 13531
M=D // 13532
@Screen.drawCircle.ret.2 // 13533
D=A // 13534
@CALL // 13535
0;JMP // 13536
(Screen.drawCircle.ret.2)
@SP // 13537
M=M-1 // 13538

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

@ARG // 13539
A=M // 13540
D=M // 13541
@SP // 13542
AM=M+1 // 13543
A=A-1 // 13544
M=D // 13545
@LCL // 13546
A=M+1 // 13547
D=M // 13548
@SP // 13549
AM=M-1 // 13550
D=M-D // 13551
@SP // 13552
AM=M+1 // 13553
A=A-1 // 13554
M=D // 13555
@ARG // 13556
A=M // 13557
D=M // 13558
@SP // 13559
AM=M+1 // 13560
A=A-1 // 13561
M=D // 13562
@LCL // 13563
A=M+1 // 13564
D=M // 13565
@SP // 13566
AM=M-1 // 13567
D=D+M // 13568
@SP // 13569
AM=M+1 // 13570
A=A-1 // 13571
M=D // 13572
@ARG // 13573
A=M+1 // 13574
D=M // 13575
@SP // 13576
AM=M+1 // 13577
A=A-1 // 13578
M=D // 13579
@LCL // 13580
A=M // 13581
D=M // 13582
@SP // 13583
AM=M-1 // 13584
D=M-D // 13585
@SP // 13586
AM=M+1 // 13587
A=A-1 // 13588
M=D // 13589
// call Screen.drawHorizontalLine
@8 // 13590
D=A // 13591
@14 // 13592
M=D // 13593
@Screen.drawHorizontalLine // 13594
D=A // 13595
@13 // 13596
M=D // 13597
@Screen.drawCircle.ret.3 // 13598
D=A // 13599
@CALL // 13600
0;JMP // 13601
(Screen.drawCircle.ret.3)
@SP // 13602
M=M-1 // 13603

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
@Screen.drawCircle.LT.13 // 13604
D=A // 13605
@SP // 13606
AM=M+1 // 13607
A=A-1 // 13608
M=D // 13609
@LCL // 13610
A=M+1 // 13611
A=A+1 // 13612
D=M // 13613
@DO_LT // 13614
0;JMP // 13615
(Screen.drawCircle.LT.13)
D=!D // 13616
@Screen.drawCircle.IfElse1 // 13617
D;JNE // 13618

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

@LCL // 13619
A=M+1 // 13620
A=A+1 // 13621
D=M // 13622
@SP // 13623
AM=M+1 // 13624
A=A-1 // 13625
M=D // 13626
@LCL // 13627
A=M // 13628
D=M // 13629
D=D+M // 13630
@SP // 13631
AM=M-1 // 13632
D=D+M // 13633
@3 // 13634
D=D+A // 13635
@LCL // 13636
A=M+1 // 13637
A=A+1 // 13638
M=D // 13639

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 13640
0;JMP // 13641

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

@LCL // 13642
A=M+1 // 13643
A=A+1 // 13644
D=M // 13645
@SP // 13646
AM=M+1 // 13647
A=A-1 // 13648
M=D // 13649
@LCL // 13650
A=M+1 // 13651
D=M // 13652
A=A-1 // 13653
D=M-D // 13654
@R13 // 13655
M=D // 13656
D=D+M // 13657
@SP // 13658
AM=M-1 // 13659
D=D+M // 13660
@5 // 13661
D=D+A // 13662
@LCL // 13663
A=M+1 // 13664
A=A+1 // 13665
M=D // 13666

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

@LCL // 13667
A=M+1 // 13668
M=M-1 // 13669

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

@LCL // 13670
A=M // 13671
M=M+1 // 13672

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 13673
0;JMP // 13674

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 13675
AM=M+1 // 13676
A=A-1 // 13677
M=0 // 13678

////ReturnInstruction{}
@RETURN // 13679
0;JMP // 13680

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 13681
D=A // 13682
@SP // 13683
AM=D+M // 13684
A=A-1 // 13685
M=0 // 13686
A=A-1 // 13687
M=0 // 13688
A=A-1 // 13689
M=0 // 13690
A=A-1 // 13691
M=0 // 13692
A=A-1 // 13693
M=0 // 13694
A=A-1 // 13695
M=0 // 13696
A=A-1 // 13697
M=0 // 13698
A=A-1 // 13699
M=0 // 13700
A=A-1 // 13701
M=0 // 13702
A=A-1 // 13703
M=0 // 13704

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13705
D=M // 13706
@9 // 13707
A=D+A // 13708
M=-1 // 13709

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            PushInstruction("static 0"),
//NOT),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse1}}
@Screen.drawRectangle.EQ.14 // 13710
D=A // 13711
@SP // 13712
AM=M+1 // 13713
A=A-1 // 13714
M=D // 13715
@Screen.0 // 13716
D=!M // 13717
@DO_EQ // 13718
0;JMP // 13719
(Screen.drawRectangle.EQ.14)
@Screen.drawRectangle.IfElse1 // 13720
D;JNE // 13721

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 13722
D=M // 13723
@9 // 13724
A=D+A // 13725
M=0 // 13726

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 13727
0;JMP // 13728

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

@ARG // 13729
A=M+1 // 13730
D=M // 13731
@LCL // 13732
A=M // 13733
M=D // 13734

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
@Screen.drawRectangle.EQ.15 // 13735
D=A // 13736
@SP // 13737
AM=M+1 // 13738
A=A-1 // 13739
M=D // 13740
@Screen.drawRectangle.GT.16 // 13741
D=A // 13742
@SP // 13743
AM=M+1 // 13744
A=A-1 // 13745
M=D // 13746
@LCL // 13747
A=M // 13748
D=M // 13749
@SP // 13750
AM=M+1 // 13751
A=A-1 // 13752
M=D // 13753
@ARG // 13754
A=M+1 // 13755
A=A+1 // 13756
A=A+1 // 13757
D=M // 13758
@SP // 13759
AM=M-1 // 13760
D=M-D // 13761
@DO_GT // 13762
0;JMP // 13763
(Screen.drawRectangle.GT.16)
D=!D // 13764
@DO_EQ // 13765
0;JMP // 13766
(Screen.drawRectangle.EQ.15)
@WHILE_END_Screen.drawRectangle1 // 13767
D;JNE // 13768

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13769
A=M // 13770
D=M // 13771
@SP // 13772
AM=M+1 // 13773
A=A-1 // 13774
M=D // 13775
@16 // 13776
D=A // 13777
@SP // 13778
AM=M+1 // 13779
A=A-1 // 13780
M=D // 13781
// call Math.divide
@7 // 13782
D=A // 13783
@14 // 13784
M=D // 13785
@Math.divide // 13786
D=A // 13787
@13 // 13788
M=D // 13789
@Screen.drawRectangle.ret.0 // 13790
D=A // 13791
@CALL // 13792
0;JMP // 13793
(Screen.drawRectangle.ret.0)
@SP // 13794
AM=M-1 // 13795
D=M // 13796
@LCL // 13797
A=M+1 // 13798
M=D // 13799

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 13800
A=M+1 // 13801
A=A+1 // 13802
D=M // 13803
@SP // 13804
AM=M+1 // 13805
A=A-1 // 13806
M=D // 13807
@16 // 13808
D=A // 13809
@SP // 13810
AM=M+1 // 13811
A=A-1 // 13812
M=D // 13813
// call Math.divide
@7 // 13814
D=A // 13815
@14 // 13816
M=D // 13817
@Math.divide // 13818
D=A // 13819
@13 // 13820
M=D // 13821
@Screen.drawRectangle.ret.1 // 13822
D=A // 13823
@CALL // 13824
0;JMP // 13825
(Screen.drawRectangle.ret.1)
@SP // 13826
AM=M-1 // 13827
D=M // 13828
@LCL // 13829
A=M+1 // 13830
A=A+1 // 13831
M=D // 13832

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

@ARG // 13833
A=M // 13834
D=M // 13835
@15 // 13836
D=D&A // 13837
@LCL // 13838
A=M+1 // 13839
A=A+1 // 13840
A=A+1 // 13841
M=D // 13842

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

@ARG // 13843
A=M+1 // 13844
A=A+1 // 13845
D=M // 13846
@15 // 13847
D=D&A // 13848
@SP // 13849
AM=M+1 // 13850
A=A-1 // 13851
M=D // 13852
@LCL // 13853
D=M // 13854
@4 // 13855
A=D+A // 13856
D=A // 13857
@R13 // 13858
M=D // 13859
@SP // 13860
AM=M-1 // 13861
D=M // 13862
@R13 // 13863
A=M // 13864
M=D // 13865

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13866
A=M // 13867
D=M // 13868
@SP // 13869
AM=M+1 // 13870
A=A-1 // 13871
M=D // 13872
@32 // 13873
D=A // 13874
@SP // 13875
AM=M+1 // 13876
A=A-1 // 13877
M=D // 13878
// call Math.multiply
@7 // 13879
D=A // 13880
@14 // 13881
M=D // 13882
@Math.multiply // 13883
D=A // 13884
@13 // 13885
M=D // 13886
@Screen.drawRectangle.ret.2 // 13887
D=A // 13888
@CALL // 13889
0;JMP // 13890
(Screen.drawRectangle.ret.2)
@LCL // 13891
D=M // 13892
@5 // 13893
A=D+A // 13894
D=A // 13895
@R13 // 13896
M=D // 13897
@SP // 13898
AM=M-1 // 13899
D=M // 13900
@R13 // 13901
A=M // 13902
M=D // 13903

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
@Screen.drawRectangle.EQ.17 // 13904
D=A // 13905
@SP // 13906
AM=M+1 // 13907
A=A-1 // 13908
M=D // 13909
@LCL // 13910
A=M+1 // 13911
A=A+1 // 13912
D=M // 13913
A=A-1 // 13914
D=M-D // 13915
@DO_EQ // 13916
0;JMP // 13917
(Screen.drawRectangle.EQ.17)
D=!D // 13918
@Screen.drawRectangle.IfElse2 // 13919
D;JNE // 13920

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

@LCL // 13921
D=M // 13922
@4 // 13923
A=D+A // 13924
D=M // 13925
@SP // 13926
AM=M+1 // 13927
A=A-1 // 13928
M=D+1 // 13929
// call Math.twoToThe
@6 // 13930
D=A // 13931
@14 // 13932
M=D // 13933
@Math.twoToThe // 13934
D=A // 13935
@13 // 13936
M=D // 13937
@Screen.drawRectangle.ret.3 // 13938
D=A // 13939
@CALL // 13940
0;JMP // 13941
(Screen.drawRectangle.ret.3)
@SP // 13942
AM=M-1 // 13943
D=M // 13944
D=D-1 // 13945
@SP // 13946
AM=M+1 // 13947
A=A-1 // 13948
M=D // 13949
@LCL // 13950
A=M+1 // 13951
A=A+1 // 13952
A=A+1 // 13953
D=M // 13954
@SP // 13955
AM=M+1 // 13956
A=A-1 // 13957
M=D // 13958
// call Math.twoToThe
@6 // 13959
D=A // 13960
@14 // 13961
M=D // 13962
@Math.twoToThe // 13963
D=A // 13964
@13 // 13965
M=D // 13966
@Screen.drawRectangle.ret.4 // 13967
D=A // 13968
@CALL // 13969
0;JMP // 13970
(Screen.drawRectangle.ret.4)
@SP // 13971
AM=M-1 // 13972
D=M // 13973
D=D-1 // 13974
@SP // 13975
AM=M-1 // 13976
D=M-D // 13977
@SP // 13978
AM=M+1 // 13979
A=A-1 // 13980
M=D // 13981
@LCL // 13982
D=M // 13983
@6 // 13984
A=D+A // 13985
D=A // 13986
@R13 // 13987
M=D // 13988
@SP // 13989
AM=M-1 // 13990
D=M // 13991
@R13 // 13992
A=M // 13993
M=D // 13994

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
@SP // 14010
AM=M+1 // 14011
A=A-1 // 14012
M=D // 14013
@LCL // 14014
D=M // 14015
@7 // 14016
A=D+A // 14017
D=A // 14018
@R13 // 14019
M=D // 14020
@SP // 14021
AM=M-1 // 14022
D=M // 14023
@R13 // 14024
A=M // 14025
M=D // 14026

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse3}}
@Screen.drawRectangle.EQ.18 // 14027
D=A // 14028
@SP // 14029
AM=M+1 // 14030
A=A-1 // 14031
M=D // 14032
@Screen.0 // 14033
D=M // 14034
@DO_EQ // 14035
0;JMP // 14036
(Screen.drawRectangle.EQ.18)
@Screen.drawRectangle.IfElse3 // 14037
D;JNE // 14038

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
@LCL // 14039
D=M // 14040
@7 // 14041
A=D+A // 14042
D=M // 14043
@16384 // 14044
D=D+A // 14045
@SP // 14046
AM=M+1 // 14047
A=A-1 // 14048
M=D // 14049
@LCL // 14050
D=M // 14051
@7 // 14052
A=D+A // 14053
D=M // 14054
@16384 // 14055
A=D+A // 14056
D=M // 14057
@SP // 14058
AM=M+1 // 14059
A=A-1 // 14060
M=D // 14061
@LCL // 14062
D=M // 14063
@6 // 14064
A=D+A // 14065
D=M // 14066
@SP // 14067
AM=M-1 // 14068
D=D|M // 14069
@SP // 14070
AM=M-1 // 14071
A=M // 14072
M=D // 14073

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 14074
0;JMP // 14075

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
@LCL // 14076
D=M // 14077
@7 // 14078
A=D+A // 14079
D=M // 14080
@16384 // 14081
D=D+A // 14082
@SP // 14083
AM=M+1 // 14084
A=A-1 // 14085
M=D // 14086
@LCL // 14087
D=M // 14088
@7 // 14089
A=D+A // 14090
D=M // 14091
@16384 // 14092
A=D+A // 14093
D=M // 14094
@SP // 14095
AM=M+1 // 14096
A=A-1 // 14097
M=D // 14098
@LCL // 14099
D=M // 14100
@6 // 14101
A=D+A // 14102
D=!M // 14103
@SP // 14104
AM=M-1 // 14105
D=D&M // 14106
@SP // 14107
AM=M-1 // 14108
A=M // 14109
M=D // 14110

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 14111
0;JMP // 14112

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

@LCL // 14113
A=M+1 // 14114
A=A+1 // 14115
A=A+1 // 14116
D=M // 14117
@SP // 14118
AM=M+1 // 14119
A=A-1 // 14120
M=D // 14121
// call Math.twoToThe
@6 // 14122
D=A // 14123
@14 // 14124
M=D // 14125
@Math.twoToThe // 14126
D=A // 14127
@13 // 14128
M=D // 14129
@Screen.drawRectangle.ret.5 // 14130
D=A // 14131
@CALL // 14132
0;JMP // 14133
(Screen.drawRectangle.ret.5)
@SP // 14134
AM=M-1 // 14135
D=M // 14136
D=D-1 // 14137
@SP // 14138
AM=M+1 // 14139
A=A-1 // 14140
M=D // 14141
@SP // 14142
A=M-1 // 14143
M=!D // 14144
@LCL // 14145
D=M // 14146
@6 // 14147
A=D+A // 14148
D=A // 14149
@R13 // 14150
M=D // 14151
@SP // 14152
AM=M-1 // 14153
D=M // 14154
@R13 // 14155
A=M // 14156
M=D // 14157

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

@LCL // 14158
D=M // 14159
@5 // 14160
A=D+A // 14161
D=M // 14162
@SP // 14163
AM=M+1 // 14164
A=A-1 // 14165
M=D // 14166
@LCL // 14167
A=M+1 // 14168
D=M // 14169
@SP // 14170
AM=M-1 // 14171
D=D+M // 14172
@SP // 14173
AM=M+1 // 14174
A=A-1 // 14175
M=D // 14176
@LCL // 14177
D=M // 14178
@7 // 14179
A=D+A // 14180
D=A // 14181
@R13 // 14182
M=D // 14183
@SP // 14184
AM=M-1 // 14185
D=M // 14186
@R13 // 14187
A=M // 14188
M=D // 14189

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse4}}
@Screen.drawRectangle.EQ.19 // 14190
D=A // 14191
@SP // 14192
AM=M+1 // 14193
A=A-1 // 14194
M=D // 14195
@Screen.0 // 14196
D=M // 14197
@DO_EQ // 14198
0;JMP // 14199
(Screen.drawRectangle.EQ.19)
@Screen.drawRectangle.IfElse4 // 14200
D;JNE // 14201

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
@LCL // 14202
D=M // 14203
@7 // 14204
A=D+A // 14205
D=M // 14206
@16384 // 14207
D=D+A // 14208
@SP // 14209
AM=M+1 // 14210
A=A-1 // 14211
M=D // 14212
@LCL // 14213
D=M // 14214
@7 // 14215
A=D+A // 14216
D=M // 14217
@16384 // 14218
A=D+A // 14219
D=M // 14220
@SP // 14221
AM=M+1 // 14222
A=A-1 // 14223
M=D // 14224
@LCL // 14225
D=M // 14226
@6 // 14227
A=D+A // 14228
D=M // 14229
@SP // 14230
AM=M-1 // 14231
D=D|M // 14232
@SP // 14233
AM=M-1 // 14234
A=M // 14235
M=D // 14236

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 14237
0;JMP // 14238

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
@LCL // 14239
D=M // 14240
@7 // 14241
A=D+A // 14242
D=M // 14243
@16384 // 14244
D=D+A // 14245
@SP // 14246
AM=M+1 // 14247
A=A-1 // 14248
M=D // 14249
@LCL // 14250
D=M // 14251
@7 // 14252
A=D+A // 14253
D=M // 14254
@16384 // 14255
A=D+A // 14256
D=M // 14257
@SP // 14258
AM=M+1 // 14259
A=A-1 // 14260
M=D // 14261
@LCL // 14262
D=M // 14263
@6 // 14264
A=D+A // 14265
D=!M // 14266
@SP // 14267
AM=M-1 // 14268
D=D&M // 14269
@SP // 14270
AM=M-1 // 14271
A=M // 14272
M=D // 14273

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

@LCL // 14274
A=M+1 // 14275
D=M // 14276
@SP // 14277
AM=M+1 // 14278
A=A-1 // 14279
M=D+1 // 14280
@LCL // 14281
D=M // 14282
@8 // 14283
A=D+A // 14284
D=A // 14285
@R13 // 14286
M=D // 14287
@SP // 14288
AM=M-1 // 14289
D=M // 14290
@R13 // 14291
A=M // 14292
M=D // 14293

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
@Screen.drawRectangle.LT.20 // 14294
D=A // 14295
@SP // 14296
AM=M+1 // 14297
A=A-1 // 14298
M=D // 14299
@LCL // 14300
D=M // 14301
@8 // 14302
A=D+A // 14303
D=M // 14304
@SP // 14305
AM=M+1 // 14306
A=A-1 // 14307
M=D // 14308
@LCL // 14309
A=M+1 // 14310
A=A+1 // 14311
D=M // 14312
@SP // 14313
AM=M-1 // 14314
D=M-D // 14315
@DO_LT // 14316
0;JMP // 14317
(Screen.drawRectangle.LT.20)
D=!D // 14318
@WHILE_END_Screen.drawRectangle2 // 14319
D;JNE // 14320

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

@LCL // 14321
D=M // 14322
@8 // 14323
A=D+A // 14324
D=M // 14325
A=A-1 // 14326
A=A-1 // 14327
A=A-1 // 14328
D=D+M // 14329
@SP // 14330
AM=M+1 // 14331
A=A-1 // 14332
M=D // 14333
@LCL // 14334
D=M // 14335
@7 // 14336
A=D+A // 14337
D=A // 14338
@R13 // 14339
M=D // 14340
@SP // 14341
AM=M-1 // 14342
D=M // 14343
@R13 // 14344
A=M // 14345
M=D // 14346

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 14347
D=M // 14348
@7 // 14349
A=D+A // 14350
D=M // 14351
@16384 // 14352
D=D+A // 14353
@SP // 14354
AM=M+1 // 14355
A=A-1 // 14356
M=D // 14357
@LCL // 14358
D=M // 14359
@9 // 14360
A=D+A // 14361
D=M // 14362
@SP // 14363
AM=M-1 // 14364
A=M // 14365
M=D // 14366

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

@LCL // 14367
D=M // 14368
@8 // 14369
A=D+A // 14370
M=M+1 // 14371

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 14372
0;JMP // 14373

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

@LCL // 14374
D=M // 14375
@4 // 14376
A=D+A // 14377
D=M // 14378
@SP // 14379
AM=M+1 // 14380
A=A-1 // 14381
M=D+1 // 14382
// call Math.twoToThe
@6 // 14383
D=A // 14384
@14 // 14385
M=D // 14386
@Math.twoToThe // 14387
D=A // 14388
@13 // 14389
M=D // 14390
@Screen.drawRectangle.ret.6 // 14391
D=A // 14392
@CALL // 14393
0;JMP // 14394
(Screen.drawRectangle.ret.6)
@SP // 14395
AM=M-1 // 14396
D=M // 14397
D=D-1 // 14398
@SP // 14399
AM=M+1 // 14400
A=A-1 // 14401
M=D // 14402
@LCL // 14403
D=M // 14404
@6 // 14405
A=D+A // 14406
D=A // 14407
@R13 // 14408
M=D // 14409
@SP // 14410
AM=M-1 // 14411
D=M // 14412
@R13 // 14413
A=M // 14414
M=D // 14415

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

@LCL // 14416
D=M // 14417
@5 // 14418
A=D+A // 14419
D=M // 14420
A=A-1 // 14421
A=A-1 // 14422
A=A-1 // 14423
D=D+M // 14424
@SP // 14425
AM=M+1 // 14426
A=A-1 // 14427
M=D // 14428
@LCL // 14429
D=M // 14430
@7 // 14431
A=D+A // 14432
D=A // 14433
@R13 // 14434
M=D // 14435
@SP // 14436
AM=M-1 // 14437
D=M // 14438
@R13 // 14439
A=M // 14440
M=D // 14441

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle.IfElse5}}
@Screen.drawRectangle.EQ.21 // 14442
D=A // 14443
@SP // 14444
AM=M+1 // 14445
A=A-1 // 14446
M=D // 14447
@Screen.0 // 14448
D=M // 14449
@DO_EQ // 14450
0;JMP // 14451
(Screen.drawRectangle.EQ.21)
@Screen.drawRectangle.IfElse5 // 14452
D;JNE // 14453

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
@LCL // 14454
D=M // 14455
@7 // 14456
A=D+A // 14457
D=M // 14458
@16384 // 14459
D=D+A // 14460
@SP // 14461
AM=M+1 // 14462
A=A-1 // 14463
M=D // 14464
@LCL // 14465
D=M // 14466
@7 // 14467
A=D+A // 14468
D=M // 14469
@16384 // 14470
A=D+A // 14471
D=M // 14472
@SP // 14473
AM=M+1 // 14474
A=A-1 // 14475
M=D // 14476
@LCL // 14477
D=M // 14478
@6 // 14479
A=D+A // 14480
D=M // 14481
@SP // 14482
AM=M-1 // 14483
D=D|M // 14484
@SP // 14485
AM=M-1 // 14486
A=M // 14487
M=D // 14488

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 14489
0;JMP // 14490

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
@LCL // 14491
D=M // 14492
@7 // 14493
A=D+A // 14494
D=M // 14495
@16384 // 14496
D=D+A // 14497
@SP // 14498
AM=M+1 // 14499
A=A-1 // 14500
M=D // 14501
@LCL // 14502
D=M // 14503
@7 // 14504
A=D+A // 14505
D=M // 14506
@16384 // 14507
A=D+A // 14508
D=M // 14509
@SP // 14510
AM=M+1 // 14511
A=A-1 // 14512
M=D // 14513
@LCL // 14514
D=M // 14515
@6 // 14516
A=D+A // 14517
D=!M // 14518
@SP // 14519
AM=M-1 // 14520
D=D&M // 14521
@SP // 14522
AM=M-1 // 14523
A=M // 14524
M=D // 14525

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

@LCL // 14526
A=M // 14527
M=M+1 // 14528

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 14529
0;JMP // 14530

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 14531
AM=M+1 // 14532
A=A-1 // 14533
M=0 // 14534

////ReturnInstruction{}
@RETURN // 14535
0;JMP // 14536

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 14537
AM=M+1 // 14538
A=A-1 // 14539
M=0 // 14540

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14541
A=M // 14542
M=0 // 14543

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
@Screen.clearScreen.LT.22 // 14544
D=A // 14545
@SP // 14546
AM=M+1 // 14547
A=A-1 // 14548
M=D // 14549
@LCL // 14550
A=M // 14551
D=M // 14552
@8192 // 14553
D=D-A // 14554
@DO_LT // 14555
0;JMP // 14556
(Screen.clearScreen.LT.22)
D=!D // 14557
@WHILE_END_Screen.clearScreen1 // 14558
D;JNE // 14559

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14560
A=M // 14561
D=M // 14562
@16384 // 14563
D=D+A // 14564
@SP // 14565
AM=M+1 // 14566
A=A-1 // 14567
M=D // 14568
D=0 // 14569
@SP // 14570
AM=M-1 // 14571
A=M // 14572
M=D // 14573

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

@LCL // 14574
A=M // 14575
M=M+1 // 14576

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 14577
0;JMP // 14578

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 14579
AM=M+1 // 14580
A=A-1 // 14581
M=0 // 14582

////ReturnInstruction{}
@RETURN // 14583
0;JMP // 14584

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 14585
D=A // 14586
@SP // 14587
AM=M+1 // 14588
A=A-1 // 14589
M=D // 14590
// call Memory.alloc
@6 // 14591
D=A // 14592
@14 // 14593
M=D // 14594
@Memory.alloc // 14595
D=A // 14596
@13 // 14597
M=D // 14598
@String.new.ret.0 // 14599
D=A // 14600
@CALL // 14601
0;JMP // 14602
(String.new.ret.0)
@SP // 14603
AM=M-1 // 14604
D=M // 14605
@3 // 14606
M=D // 14607

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
@String.new.EQ.0 // 14608
D=A // 14609
@SP // 14610
AM=M+1 // 14611
A=A-1 // 14612
M=D // 14613
@ARG // 14614
A=M // 14615
D=M // 14616
@DO_EQ // 14617
0;JMP // 14618
(String.new.EQ.0)
@String.new.IfElse1 // 14619
D;JEQ // 14620

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 14621
A=M // 14622
M=0 // 14623

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 14624
0;JMP // 14625

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 14626
A=M // 14627
D=M // 14628
@SP // 14629
AM=M+1 // 14630
A=A-1 // 14631
M=D // 14632
// call Array.new
@6 // 14633
D=A // 14634
@14 // 14635
M=D // 14636
@Array.new // 14637
D=A // 14638
@13 // 14639
M=D // 14640
@String.new.ret.1 // 14641
D=A // 14642
@CALL // 14643
0;JMP // 14644
(String.new.ret.1)
@SP // 14645
AM=M-1 // 14646
D=M // 14647
@THIS // 14648
A=M // 14649
M=D // 14650

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 14651
A=M // 14652
D=M // 14653
@THIS // 14654
A=M+1 // 14655
A=A+1 // 14656
M=D // 14657

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 14658
A=M+1 // 14659
M=0 // 14660

////PushInstruction("pointer 0")
@3 // 14661
D=M // 14662
@SP // 14663
AM=M+1 // 14664
A=A-1 // 14665
M=D // 14666

////ReturnInstruction{}
@RETURN // 14667
0;JMP // 14668

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14669
A=M // 14670
D=M // 14671
@3 // 14672
M=D // 14673

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
@String.dispose.EQ.1 // 14674
D=A // 14675
@SP // 14676
AM=M+1 // 14677
A=A-1 // 14678
M=D // 14679
@String.dispose.EQ.2 // 14680
D=A // 14681
@SP // 14682
AM=M+1 // 14683
A=A-1 // 14684
M=D // 14685
@THIS // 14686
A=M // 14687
D=M // 14688
@DO_EQ // 14689
0;JMP // 14690
(String.dispose.EQ.2)
D=!D // 14691
@DO_EQ // 14692
0;JMP // 14693
(String.dispose.EQ.1)
@String.dispose.IfElse1 // 14694
D;JNE // 14695

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14696
A=M // 14697
D=M // 14698
@SP // 14699
AM=M+1 // 14700
A=A-1 // 14701
M=D // 14702
// call Array.dispose
@6 // 14703
D=A // 14704
@14 // 14705
M=D // 14706
@Array.dispose // 14707
D=A // 14708
@13 // 14709
M=D // 14710
@String.dispose.ret.0 // 14711
D=A // 14712
@CALL // 14713
0;JMP // 14714
(String.dispose.ret.0)
@SP // 14715
M=M-1 // 14716

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 14717
0;JMP // 14718

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 14719
AM=M+1 // 14720
A=A-1 // 14721
M=0 // 14722

////ReturnInstruction{}
@RETURN // 14723
0;JMP // 14724

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14725
A=M // 14726
D=M // 14727
@3 // 14728
M=D // 14729

////PushInstruction("this 1")
@THIS // 14730
A=M+1 // 14731
D=M // 14732
@SP // 14733
AM=M+1 // 14734
A=A-1 // 14735
M=D // 14736

////ReturnInstruction{}
@RETURN // 14737
0;JMP // 14738

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14739
A=M // 14740
D=M // 14741
@3 // 14742
M=D // 14743

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
@THIS // 14744
A=M // 14745
D=M // 14746
@SP // 14747
AM=M+1 // 14748
A=A-1 // 14749
M=D // 14750
@ARG // 14751
A=M+1 // 14752
D=M // 14753
@SP // 14754
AM=M-1 // 14755
A=D+M // 14756
D=M // 14757
@SP // 14758
AM=M+1 // 14759
A=A-1 // 14760
M=D // 14761

////ReturnInstruction{}
@RETURN // 14762
0;JMP // 14763

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14764
A=M // 14765
D=M // 14766
@3 // 14767
M=D // 14768

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)}
@THIS // 14769
A=M // 14770
D=M // 14771
@SP // 14772
AM=M+1 // 14773
A=A-1 // 14774
M=D // 14775
@ARG // 14776
A=M+1 // 14777
D=M // 14778
@SP // 14779
AM=M-1 // 14780
D=D+M // 14781
@SP // 14782
AM=M+1 // 14783
A=A-1 // 14784
M=D // 14785
@ARG // 14786
A=M+1 // 14787
A=A+1 // 14788
D=M // 14789
@SP // 14790
AM=M-1 // 14791
A=M // 14792
M=D // 14793

////PushInstruction("constant 0")
@SP // 14794
AM=M+1 // 14795
A=A-1 // 14796
M=0 // 14797

////ReturnInstruction{}
@RETURN // 14798
0;JMP // 14799

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 14800
AM=M+1 // 14801
A=A-1 // 14802
M=0 // 14803

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14804
A=M // 14805
D=M // 14806
@3 // 14807
M=D // 14808

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
@String.appendChar.EQ.3 // 14809
D=A // 14810
@SP // 14811
AM=M+1 // 14812
A=A-1 // 14813
M=D // 14814
@THIS // 14815
A=M+1 // 14816
A=A+1 // 14817
D=M // 14818
A=A-1 // 14819
D=M-D // 14820
@DO_EQ // 14821
0;JMP // 14822
(String.appendChar.EQ.3)
D=!D // 14823
@String.appendChar.IfElse1 // 14824
D;JNE // 14825

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

@THIS // 14826
A=M+1 // 14827
A=A+1 // 14828
D=M // 14829
D=D+M // 14830
@SP // 14831
AM=M+1 // 14832
A=A-1 // 14833
M=D // 14834
// call Array.new
@6 // 14835
D=A // 14836
@14 // 14837
M=D // 14838
@Array.new // 14839
D=A // 14840
@13 // 14841
M=D // 14842
@String.appendChar.ret.0 // 14843
D=A // 14844
@CALL // 14845
0;JMP // 14846
(String.appendChar.ret.0)
@SP // 14847
AM=M-1 // 14848
D=M // 14849
@LCL // 14850
A=M // 14851
M=D // 14852

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14853
A=M // 14854
D=M // 14855
@SP // 14856
AM=M+1 // 14857
A=A-1 // 14858
M=D // 14859
@LCL // 14860
A=M // 14861
D=M // 14862
@SP // 14863
AM=M+1 // 14864
A=A-1 // 14865
M=D // 14866
@THIS // 14867
A=M+1 // 14868
D=M // 14869
@SP // 14870
AM=M+1 // 14871
A=A-1 // 14872
M=D // 14873
// call Memory.copy
@8 // 14874
D=A // 14875
@14 // 14876
M=D // 14877
@Memory.copy // 14878
D=A // 14879
@13 // 14880
M=D // 14881
@String.appendChar.ret.1 // 14882
D=A // 14883
@CALL // 14884
0;JMP // 14885
(String.appendChar.ret.1)
@SP // 14886
M=M-1 // 14887

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 14888
A=M // 14889
D=M // 14890
@SP // 14891
AM=M+1 // 14892
A=A-1 // 14893
M=D // 14894
// call Array.dispose
@6 // 14895
D=A // 14896
@14 // 14897
M=D // 14898
@Array.dispose // 14899
D=A // 14900
@13 // 14901
M=D // 14902
@String.appendChar.ret.2 // 14903
D=A // 14904
@CALL // 14905
0;JMP // 14906
(String.appendChar.ret.2)
@SP // 14907
M=M-1 // 14908

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

@THIS // 14909
A=M+1 // 14910
A=A+1 // 14911
D=M // 14912
@THIS // 14913
A=M+1 // 14914
A=A+1 // 14915
M=D+M // 14916

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 14917
A=M // 14918
D=M // 14919
@THIS // 14920
A=M // 14921
M=D // 14922

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 14923
0;JMP // 14924

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
@THIS // 14925
A=M+1 // 14926
D=M // 14927
A=A-1 // 14928
D=D+M // 14929
@SP // 14930
AM=M+1 // 14931
A=A-1 // 14932
M=D // 14933
@ARG // 14934
A=M+1 // 14935
D=M // 14936
@SP // 14937
AM=M-1 // 14938
A=M // 14939
M=D // 14940

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

@THIS // 14941
A=M+1 // 14942
M=M+1 // 14943

////PushInstruction("pointer 0")
@3 // 14944
D=M // 14945
@SP // 14946
AM=M+1 // 14947
A=A-1 // 14948
M=D // 14949

////ReturnInstruction{}
@RETURN // 14950
0;JMP // 14951

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14952
A=M // 14953
D=M // 14954
@3 // 14955
M=D // 14956

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

@THIS // 14957
A=M+1 // 14958
M=M-1 // 14959

////PushInstruction("constant 0")
@SP // 14960
AM=M+1 // 14961
A=A-1 // 14962
M=0 // 14963

////ReturnInstruction{}
@RETURN // 14964
0;JMP // 14965

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 14966
M=M+1 // 14967
AM=M+1 // 14968
A=A-1 // 14969
M=0 // 14970
A=A-1 // 14971
M=0 // 14972

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 14973
A=M // 14974
D=M // 14975
@3 // 14976
M=D // 14977

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14978
A=M+1 // 14979
M=1 // 14980

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14981
A=M // 14982
M=0 // 14983

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
@String.intValue.LT.4 // 14984
D=A // 14985
@SP // 14986
AM=M+1 // 14987
A=A-1 // 14988
M=D // 14989
@LCL // 14990
A=M+1 // 14991
D=M // 14992
@SP // 14993
AM=M+1 // 14994
A=A-1 // 14995
M=D // 14996
@THIS // 14997
A=M+1 // 14998
D=M // 14999
@SP // 15000
AM=M-1 // 15001
D=M-D // 15002
@DO_LT // 15003
0;JMP // 15004
(String.intValue.LT.4)
D=!D // 15005
@WHILE_END_String.intValue1 // 15006
D;JNE // 15007

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

@LCL // 15008
A=M // 15009
D=M // 15010
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=D // 15014
@10 // 15015
D=A // 15016
@SP // 15017
AM=M+1 // 15018
A=A-1 // 15019
M=D // 15020
// call Math.multiply
@7 // 15021
D=A // 15022
@14 // 15023
M=D // 15024
@Math.multiply // 15025
D=A // 15026
@13 // 15027
M=D // 15028
@String.intValue.ret.0 // 15029
D=A // 15030
@CALL // 15031
0;JMP // 15032
(String.intValue.ret.0)
@THIS // 15033
A=M // 15034
D=M // 15035
@SP // 15036
AM=M+1 // 15037
A=A-1 // 15038
M=D // 15039
@LCL // 15040
A=M+1 // 15041
D=M // 15042
@SP // 15043
AM=M-1 // 15044
A=D+M // 15045
D=M // 15046
@48 // 15047
D=D-A // 15048
@SP // 15049
AM=M-1 // 15050
D=D+M // 15051
@LCL // 15052
A=M // 15053
M=D // 15054

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

@LCL // 15055
A=M+1 // 15056
M=M+1 // 15057

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 15058
0;JMP // 15059

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 15060
A=M // 15061
D=M // 15062
@SP // 15063
AM=M+1 // 15064
A=A-1 // 15065
M=D // 15066

////ReturnInstruction{}
@RETURN // 15067
0;JMP // 15068

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 15069
D=A // 15070
@SP // 15071
AM=D+M // 15072
A=A-1 // 15073
M=0 // 15074
A=A-1 // 15075
M=0 // 15076
A=A-1 // 15077
M=0 // 15078
A=A-1 // 15079
M=0 // 15080
A=A-1 // 15081
M=0 // 15082
A=A-1 // 15083
M=0 // 15084

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15085
A=M // 15086
D=M // 15087
@3 // 15088
M=D // 15089

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 15090
A=M+1 // 15091
M=0 // 15092

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15093
D=M // 15094
@4 // 15095
A=D+A // 15096
M=0 // 15097

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
@String.setInt.EQ.5 // 15098
D=A // 15099
@SP // 15100
AM=M+1 // 15101
A=A-1 // 15102
M=D // 15103
@ARG // 15104
A=M+1 // 15105
D=M // 15106
@DO_EQ // 15107
0;JMP // 15108
(String.setInt.EQ.5)
@String.setInt.IfElse1 // 15109
D;JEQ // 15110

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15111
D=M // 15112
@SP // 15113
AM=M+1 // 15114
A=A-1 // 15115
M=D // 15116
@48 // 15117
D=A // 15118
@SP // 15119
AM=M+1 // 15120
A=A-1 // 15121
M=D // 15122
// call String.appendChar
@7 // 15123
D=A // 15124
@14 // 15125
M=D // 15126
@String.appendChar // 15127
D=A // 15128
@13 // 15129
M=D // 15130
@String.setInt.ret.0 // 15131
D=A // 15132
@CALL // 15133
0;JMP // 15134
(String.setInt.ret.0)
@SP // 15135
M=M-1 // 15136

////PushInstruction("constant 0")
@SP // 15137
AM=M+1 // 15138
A=A-1 // 15139
M=0 // 15140

////ReturnInstruction{}
@RETURN // 15141
0;JMP // 15142

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 15143
0;JMP // 15144

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
@String.setInt.LT.6 // 15145
D=A // 15146
@SP // 15147
AM=M+1 // 15148
A=A-1 // 15149
M=D // 15150
@ARG // 15151
A=M+1 // 15152
D=M // 15153
@DO_LT // 15154
0;JMP // 15155
(String.setInt.LT.6)
D=!D // 15156
@String.setInt.IfElse2 // 15157
D;JNE // 15158

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 15159
D=M // 15160
@4 // 15161
A=D+A // 15162
M=1 // 15163

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
@String.setInt.EQ.7 // 15164
D=A // 15165
@SP // 15166
AM=M+1 // 15167
A=A-1 // 15168
M=D // 15169
@String.setInt.LT.8 // 15170
D=A // 15171
@SP // 15172
AM=M+1 // 15173
A=A-1 // 15174
M=D // 15175
@ARG // 15176
A=M+1 // 15177
D=M // 15178
@DO_LT // 15179
0;JMP // 15180
(String.setInt.LT.8)
@SP // 15181
AM=M+1 // 15182
A=A-1 // 15183
M=D // 15184
@String.setInt.EQ.9 // 15185
D=A // 15186
@SP // 15187
AM=M+1 // 15188
A=A-1 // 15189
M=D // 15190
@ARG // 15191
A=M+1 // 15192
D=M // 15193
@32767 // 15194
D=D&A // 15195
@32767 // 15196
D=D-A // 15197
@DO_EQ // 15198
0;JMP // 15199
(String.setInt.EQ.9)
@SP // 15200
AM=M-1 // 15201
D=D&M // 15202
@DO_EQ // 15203
0;JMP // 15204
(String.setInt.EQ.7)
@String.setInt.IfElse3 // 15205
D;JNE // 15206

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15207
D=M // 15208
@SP // 15209
AM=M+1 // 15210
A=A-1 // 15211
M=D // 15212
@45 // 15213
D=A // 15214
@SP // 15215
AM=M+1 // 15216
A=A-1 // 15217
M=D // 15218
// call String.appendChar
@7 // 15219
D=A // 15220
@14 // 15221
M=D // 15222
@String.appendChar // 15223
D=A // 15224
@13 // 15225
M=D // 15226
@String.setInt.ret.1 // 15227
D=A // 15228
@CALL // 15229
0;JMP // 15230
(String.setInt.ret.1)
@SP // 15231
M=M-1 // 15232

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15233
D=M // 15234
@SP // 15235
AM=M+1 // 15236
A=A-1 // 15237
M=D // 15238
@51 // 15239
D=A // 15240
@SP // 15241
AM=M+1 // 15242
A=A-1 // 15243
M=D // 15244
// call String.appendChar
@7 // 15245
D=A // 15246
@14 // 15247
M=D // 15248
@String.appendChar // 15249
D=A // 15250
@13 // 15251
M=D // 15252
@String.setInt.ret.2 // 15253
D=A // 15254
@CALL // 15255
0;JMP // 15256
(String.setInt.ret.2)
@SP // 15257
M=M-1 // 15258

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15259
D=M // 15260
@SP // 15261
AM=M+1 // 15262
A=A-1 // 15263
M=D // 15264
@50 // 15265
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
@String.setInt.ret.3 // 15279
D=A // 15280
@CALL // 15281
0;JMP // 15282
(String.setInt.ret.3)
@SP // 15283
M=M-1 // 15284

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15285
D=M // 15286
@SP // 15287
AM=M+1 // 15288
A=A-1 // 15289
M=D // 15290
@55 // 15291
D=A // 15292
@SP // 15293
AM=M+1 // 15294
A=A-1 // 15295
M=D // 15296
// call String.appendChar
@7 // 15297
D=A // 15298
@14 // 15299
M=D // 15300
@String.appendChar // 15301
D=A // 15302
@13 // 15303
M=D // 15304
@String.setInt.ret.4 // 15305
D=A // 15306
@CALL // 15307
0;JMP // 15308
(String.setInt.ret.4)
@SP // 15309
M=M-1 // 15310

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15311
D=M // 15312
@SP // 15313
AM=M+1 // 15314
A=A-1 // 15315
M=D // 15316
@54 // 15317
D=A // 15318
@SP // 15319
AM=M+1 // 15320
A=A-1 // 15321
M=D // 15322
// call String.appendChar
@7 // 15323
D=A // 15324
@14 // 15325
M=D // 15326
@String.appendChar // 15327
D=A // 15328
@13 // 15329
M=D // 15330
@String.setInt.ret.5 // 15331
D=A // 15332
@CALL // 15333
0;JMP // 15334
(String.setInt.ret.5)
@SP // 15335
M=M-1 // 15336

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15337
D=M // 15338
@SP // 15339
AM=M+1 // 15340
A=A-1 // 15341
M=D // 15342
@56 // 15343
D=A // 15344
@SP // 15345
AM=M+1 // 15346
A=A-1 // 15347
M=D // 15348
// call String.appendChar
@7 // 15349
D=A // 15350
@14 // 15351
M=D // 15352
@String.appendChar // 15353
D=A // 15354
@13 // 15355
M=D // 15356
@String.setInt.ret.6 // 15357
D=A // 15358
@CALL // 15359
0;JMP // 15360
(String.setInt.ret.6)
@SP // 15361
M=M-1 // 15362

////PushInstruction("constant 0")
@SP // 15363
AM=M+1 // 15364
A=A-1 // 15365
M=0 // 15366

////ReturnInstruction{}
@RETURN // 15367
0;JMP // 15368

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 15369
0;JMP // 15370

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

@ARG // 15371
A=M+1 // 15372
D=-M // 15373
@ARG // 15374
A=M+1 // 15375
M=D // 15376

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 15377
0;JMP // 15378

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

@ARG // 15379
A=M+1 // 15380
D=M // 15381
@LCL // 15382
A=M+1 // 15383
A=A+1 // 15384
M=D // 15385

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 15386
A=M+1 // 15387
A=A+1 // 15388
A=A+1 // 15389
M=0 // 15390

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
@String.setInt.GT.10 // 15391
D=A // 15392
@SP // 15393
AM=M+1 // 15394
A=A-1 // 15395
M=D // 15396
@LCL // 15397
A=M+1 // 15398
A=A+1 // 15399
D=M // 15400
@DO_GT // 15401
0;JMP // 15402
(String.setInt.GT.10)
D=!D // 15403
@WHILE_END_String.setInt1 // 15404
D;JNE // 15405

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15406
A=M+1 // 15407
A=A+1 // 15408
D=M // 15409
@SP // 15410
AM=M+1 // 15411
A=A-1 // 15412
M=D // 15413
@10 // 15414
D=A // 15415
@SP // 15416
AM=M+1 // 15417
A=A-1 // 15418
M=D // 15419
// call Math.divide
@7 // 15420
D=A // 15421
@14 // 15422
M=D // 15423
@Math.divide // 15424
D=A // 15425
@13 // 15426
M=D // 15427
@String.setInt.ret.7 // 15428
D=A // 15429
@CALL // 15430
0;JMP // 15431
(String.setInt.ret.7)
@SP // 15432
AM=M-1 // 15433
D=M // 15434
@LCL // 15435
A=M+1 // 15436
A=A+1 // 15437
M=D // 15438

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

@LCL // 15439
A=M+1 // 15440
A=A+1 // 15441
A=A+1 // 15442
M=M+1 // 15443

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 15444
0;JMP // 15445

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 15446
A=M+1 // 15447
A=A+1 // 15448
A=A+1 // 15449
D=M // 15450
@SP // 15451
AM=M+1 // 15452
A=A-1 // 15453
M=D // 15454
// call Array.new
@6 // 15455
D=A // 15456
@14 // 15457
M=D // 15458
@Array.new // 15459
D=A // 15460
@13 // 15461
M=D // 15462
@String.setInt.ret.8 // 15463
D=A // 15464
@CALL // 15465
0;JMP // 15466
(String.setInt.ret.8)
@LCL // 15467
D=M // 15468
@5 // 15469
A=D+A // 15470
D=A // 15471
@R13 // 15472
M=D // 15473
@SP // 15474
AM=M-1 // 15475
D=M // 15476
@R13 // 15477
A=M // 15478
M=D // 15479

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15480
A=M+1 // 15481
M=0 // 15482

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
@String.setInt.GT.11 // 15483
D=A // 15484
@SP // 15485
AM=M+1 // 15486
A=A-1 // 15487
M=D // 15488
@ARG // 15489
A=M+1 // 15490
D=M // 15491
@DO_GT // 15492
0;JMP // 15493
(String.setInt.GT.11)
D=!D // 15494
@WHILE_END_String.setInt2 // 15495
D;JNE // 15496

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

@ARG // 15497
A=M+1 // 15498
D=M // 15499
@SP // 15500
AM=M+1 // 15501
A=A-1 // 15502
M=D // 15503
@ARG // 15504
A=M+1 // 15505
D=M // 15506
@SP // 15507
AM=M+1 // 15508
A=A-1 // 15509
M=D // 15510
@10 // 15511
D=A // 15512
@SP // 15513
AM=M+1 // 15514
A=A-1 // 15515
M=D // 15516
// call Math.divide
@7 // 15517
D=A // 15518
@14 // 15519
M=D // 15520
@Math.divide // 15521
D=A // 15522
@13 // 15523
M=D // 15524
@String.setInt.ret.9 // 15525
D=A // 15526
@CALL // 15527
0;JMP // 15528
(String.setInt.ret.9)
@10 // 15529
D=A // 15530
@SP // 15531
AM=M+1 // 15532
A=A-1 // 15533
M=D // 15534
// call Math.multiply
@7 // 15535
D=A // 15536
@14 // 15537
M=D // 15538
@Math.multiply // 15539
D=A // 15540
@13 // 15541
M=D // 15542
@String.setInt.ret.10 // 15543
D=A // 15544
@CALL // 15545
0;JMP // 15546
(String.setInt.ret.10)
@SP // 15547
AM=M-1 // 15548
D=M // 15549
@SP // 15550
AM=M-1 // 15551
D=M-D // 15552
@LCL // 15553
A=M // 15554
M=D // 15555

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
@LCL // 15556
D=M // 15557
@5 // 15558
A=D+A // 15559
D=M // 15560
@SP // 15561
AM=M+1 // 15562
A=A-1 // 15563
M=D // 15564
@LCL // 15565
A=M+1 // 15566
D=M // 15567
@SP // 15568
AM=M-1 // 15569
D=D+M // 15570
@SP // 15571
AM=M+1 // 15572
A=A-1 // 15573
M=D // 15574
@LCL // 15575
A=M // 15576
D=M // 15577
@48 // 15578
D=D+A // 15579
@SP // 15580
AM=M-1 // 15581
A=M // 15582
M=D // 15583

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 15584
A=M+1 // 15585
D=M // 15586
@SP // 15587
AM=M+1 // 15588
A=A-1 // 15589
M=D // 15590
@10 // 15591
D=A // 15592
@SP // 15593
AM=M+1 // 15594
A=A-1 // 15595
M=D // 15596
// call Math.divide
@7 // 15597
D=A // 15598
@14 // 15599
M=D // 15600
@Math.divide // 15601
D=A // 15602
@13 // 15603
M=D // 15604
@String.setInt.ret.11 // 15605
D=A // 15606
@CALL // 15607
0;JMP // 15608
(String.setInt.ret.11)
@SP // 15609
AM=M-1 // 15610
D=M // 15611
@ARG // 15612
A=M+1 // 15613
M=D // 15614

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

@LCL // 15615
A=M+1 // 15616
M=M+1 // 15617

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 15618
0;JMP // 15619

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
@String.setInt.EQ.12 // 15620
D=A // 15621
@SP // 15622
AM=M+1 // 15623
A=A-1 // 15624
M=D // 15625
@LCL // 15626
D=M // 15627
@4 // 15628
A=D+A // 15629
D=M // 15630
D=D-1 // 15631
@DO_EQ // 15632
0;JMP // 15633
(String.setInt.EQ.12)
D=!D // 15634
@String.setInt.IfElse4 // 15635
D;JNE // 15636

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 15637
D=M // 15638
@SP // 15639
AM=M+1 // 15640
A=A-1 // 15641
M=D // 15642
@45 // 15643
D=A // 15644
@SP // 15645
AM=M+1 // 15646
A=A-1 // 15647
M=D // 15648
// call String.appendChar
@7 // 15649
D=A // 15650
@14 // 15651
M=D // 15652
@String.appendChar // 15653
D=A // 15654
@13 // 15655
M=D // 15656
@String.setInt.ret.12 // 15657
D=A // 15658
@CALL // 15659
0;JMP // 15660
(String.setInt.ret.12)
@SP // 15661
M=M-1 // 15662

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 15663
0;JMP // 15664

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
@String.setInt.GT.13 // 15665
D=A // 15666
@SP // 15667
AM=M+1 // 15668
A=A-1 // 15669
M=D // 15670
@LCL // 15671
A=M+1 // 15672
D=M // 15673
@DO_GT // 15674
0;JMP // 15675
(String.setInt.GT.13)
D=!D // 15676
@WHILE_END_String.setInt3 // 15677
D;JNE // 15678

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

@LCL // 15679
A=M+1 // 15680
M=M-1 // 15681

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

@3 // 15682
D=M // 15683
@SP // 15684
AM=M+1 // 15685
A=A-1 // 15686
M=D // 15687
@LCL // 15688
D=M // 15689
@5 // 15690
A=D+A // 15691
D=M // 15692
@SP // 15693
AM=M+1 // 15694
A=A-1 // 15695
M=D // 15696
@LCL // 15697
A=M+1 // 15698
D=M // 15699
@SP // 15700
AM=M-1 // 15701
A=D+M // 15702
D=M // 15703
@SP // 15704
AM=M+1 // 15705
A=A-1 // 15706
M=D // 15707
// call String.appendChar
@7 // 15708
D=A // 15709
@14 // 15710
M=D // 15711
@String.appendChar // 15712
D=A // 15713
@13 // 15714
M=D // 15715
@String.setInt.ret.13 // 15716
D=A // 15717
@CALL // 15718
0;JMP // 15719
(String.setInt.ret.13)
@SP // 15720
M=M-1 // 15721

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 15722
0;JMP // 15723

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15724
D=M // 15725
@5 // 15726
A=D+A // 15727
D=M // 15728
@SP // 15729
AM=M+1 // 15730
A=A-1 // 15731
M=D // 15732
// call Array.dispose
@6 // 15733
D=A // 15734
@14 // 15735
M=D // 15736
@Array.dispose // 15737
D=A // 15738
@13 // 15739
M=D // 15740
@String.setInt.ret.14 // 15741
D=A // 15742
@CALL // 15743
0;JMP // 15744
(String.setInt.ret.14)
@SP // 15745
M=M-1 // 15746

////PushInstruction("constant 0")
@SP // 15747
AM=M+1 // 15748
A=A-1 // 15749
M=0 // 15750

////ReturnInstruction{}
@RETURN // 15751
0;JMP // 15752

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 15753
D=A // 15754
@SP // 15755
AM=M+1 // 15756
A=A-1 // 15757
M=D // 15758

////ReturnInstruction{}
@RETURN // 15759
0;JMP // 15760

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 15761
D=A // 15762
@SP // 15763
AM=M+1 // 15764
A=A-1 // 15765
M=D // 15766

////ReturnInstruction{}
@RETURN // 15767
0;JMP // 15768

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 15769
D=A // 15770
@SP // 15771
AM=M+1 // 15772
A=A-1 // 15773
M=D // 15774

////ReturnInstruction{}
@RETURN // 15775
0;JMP // 15776

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 15777
D=A // 15778
@14 // 15779
M=D // 15780
@Memory.init // 15781
D=A // 15782
@13 // 15783
M=D // 15784
@Sys.init.ret.0 // 15785
D=A // 15786
@CALL // 15787
0;JMP // 15788
(Sys.init.ret.0)
@SP // 15789
M=M-1 // 15790

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 15791
D=A // 15792
@14 // 15793
M=D // 15794
@Math.init // 15795
D=A // 15796
@13 // 15797
M=D // 15798
@Sys.init.ret.1 // 15799
D=A // 15800
@CALL // 15801
0;JMP // 15802
(Sys.init.ret.1)
@SP // 15803
M=M-1 // 15804

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 15805
D=A // 15806
@14 // 15807
M=D // 15808
@Screen.init // 15809
D=A // 15810
@13 // 15811
M=D // 15812
@Sys.init.ret.2 // 15813
D=A // 15814
@CALL // 15815
0;JMP // 15816
(Sys.init.ret.2)
@SP // 15817
M=M-1 // 15818

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 15819
D=A // 15820
@14 // 15821
M=D // 15822
@Output.init // 15823
D=A // 15824
@13 // 15825
M=D // 15826
@Sys.init.ret.3 // 15827
D=A // 15828
@CALL // 15829
0;JMP // 15830
(Sys.init.ret.3)
@SP // 15831
M=M-1 // 15832

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 15833
D=A // 15834
@14 // 15835
M=D // 15836
@Keyboard.init // 15837
D=A // 15838
@13 // 15839
M=D // 15840
@Sys.init.ret.4 // 15841
D=A // 15842
@CALL // 15843
0;JMP // 15844
(Sys.init.ret.4)
@SP // 15845
M=M-1 // 15846

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 15847
D=A // 15848
@14 // 15849
M=D // 15850
@Main.main // 15851
D=A // 15852
@13 // 15853
M=D // 15854
@Sys.init.ret.5 // 15855
D=A // 15856
@CALL // 15857
0;JMP // 15858
(Sys.init.ret.5)
@SP // 15859
M=M-1 // 15860

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15861
D=A // 15862
@14 // 15863
M=D // 15864
@Sys.halt // 15865
D=A // 15866
@13 // 15867
M=D // 15868
@Sys.init.ret.6 // 15869
D=A // 15870
@CALL // 15871
0;JMP // 15872
(Sys.init.ret.6)
@SP // 15873
M=M-1 // 15874

////PushInstruction("constant 0")
@SP // 15875
AM=M+1 // 15876
A=A-1 // 15877
M=0 // 15878

////ReturnInstruction{}
@RETURN // 15879
0;JMP // 15880

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
D=0 // 15881
@WHILE_END_Sys.halt1 // 15882
D;JNE // 15883

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 15884
0;JMP // 15885

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 15886
AM=M+1 // 15887
A=A-1 // 15888
M=0 // 15889

////ReturnInstruction{}
@RETURN // 15890
0;JMP // 15891

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 15892
AM=M+1 // 15893
A=A-1 // 15894
M=0 // 15895

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
@Sys.wait.GT.0 // 15896
D=A // 15897
@SP // 15898
AM=M+1 // 15899
A=A-1 // 15900
M=D // 15901
@ARG // 15902
A=M // 15903
D=M // 15904
@DO_GT // 15905
0;JMP // 15906
(Sys.wait.GT.0)
D=!D // 15907
@WHILE_END_Sys.wait1 // 15908
D;JNE // 15909

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

@ARG // 15910
A=M // 15911
M=M-1 // 15912

////PushPopPair {
//  push: PushInstruction("constant 70")
//  pop:  PopInstruction{address=local 0}
//}

@70 // 15913
D=A // 15914
@LCL // 15915
A=M // 15916
M=D // 15917

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
@Sys.wait.GT.1 // 15918
D=A // 15919
@SP // 15920
AM=M+1 // 15921
A=A-1 // 15922
M=D // 15923
@LCL // 15924
A=M // 15925
D=M // 15926
@DO_GT // 15927
0;JMP // 15928
(Sys.wait.GT.1)
D=!D // 15929
@WHILE_END_Sys.wait2 // 15930
D;JNE // 15931

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

@LCL // 15932
A=M // 15933
M=M-1 // 15934

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 15935
0;JMP // 15936

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 15937
0;JMP // 15938

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 15939
AM=M+1 // 15940
A=A-1 // 15941
M=0 // 15942

////ReturnInstruction{}
@RETURN // 15943
0;JMP // 15944

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 15945
A=M // 15946
D=M // 15947
@SP // 15948
AM=M+1 // 15949
A=A-1 // 15950
M=D // 15951
// call Output.printInt
@6 // 15952
D=A // 15953
@14 // 15954
M=D // 15955
@Output.printInt // 15956
D=A // 15957
@13 // 15958
M=D // 15959
@Sys.error.ret.0 // 15960
D=A // 15961
@CALL // 15962
0;JMP // 15963
(Sys.error.ret.0)
@SP // 15964
M=M-1 // 15965

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 15966
D=A // 15967
@14 // 15968
M=D // 15969
@Output.println // 15970
D=A // 15971
@13 // 15972
M=D // 15973
@Sys.error.ret.1 // 15974
D=A // 15975
@CALL // 15976
0;JMP // 15977
(Sys.error.ret.1)
@SP // 15978
M=M-1 // 15979

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 15980
D=A // 15981
@14 // 15982
M=D // 15983
@Sys.halt // 15984
D=A // 15985
@13 // 15986
M=D // 15987
@Sys.error.ret.2 // 15988
D=A // 15989
@CALL // 15990
0;JMP // 15991
(Sys.error.ret.2)
@SP // 15992
M=M-1 // 15993

////PushInstruction("constant 0")
@SP // 15994
AM=M+1 // 15995
A=A-1 // 15996
M=0 // 15997

////ReturnInstruction{}
@RETURN // 15998
0;JMP // 15999

