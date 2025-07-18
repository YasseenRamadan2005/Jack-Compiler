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
////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 131
A=M // 132
D=M // 133
@3 // 134
M=D // 135

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.dispose$IF_TRUE1}}
@String.dispose.EQ.0 // 136
D=A // 137
@SP // 138
AM=M+1 // 139
A=A-1 // 140
M=D // 141
@THIS // 142
A=M // 143
D=M // 144
@DO_EQ // 145
0;JMP // 146
(String.dispose.EQ.0)
D=!D // 147
@String.dispose$IF_TRUE1 // 148
D;JNE // 149

////GotoInstruction{label='String.dispose$IF_END1}
// goto String.dispose$IF_END1
@String.dispose$IF_END1 // 150
0;JMP // 151

////LabelInstruction{label='String.dispose$IF_TRUE1}
// label String.dispose$IF_TRUE1
(String.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 152
A=M // 153
D=M // 154
@SP // 155
AM=M+1 // 156
A=A-1 // 157
M=D // 158
// call Memory.deAlloc
@6 // 159
D=A // 160
@14 // 161
M=D // 162
@Memory.deAlloc // 163
D=A // 164
@13 // 165
M=D // 166
@String.dispose.ret.0 // 167
D=A // 168
@CALL // 169
0;JMP // 170
(String.dispose.ret.0)
@SP // 171
M=M-1 // 172

////LabelInstruction{label='String.dispose$IF_END1}
// label String.dispose$IF_END1
(String.dispose$IF_END1)

////PushInstruction("constant 0")
@SP // 173
AM=M+1 // 174
A=A-1 // 175
M=0 // 176
@RETURN // 177
0;JMP // 178

////FunctionInstruction{functionName='Int32.initial_sqrt_guess', numLocals=2, funcMapping={}}
// function Int32.initial_sqrt_guess with 2
(Int32.initial_sqrt_guess)
@SP // 179
M=M+1 // 180
AM=M+1 // 181
A=A-1 // 182
M=0 // 183
A=A-1 // 184
M=0 // 185

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 186
A=M // 187
D=M // 188
@3 // 189
M=D // 190

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("constant 3"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Int32.initial_sqrt_guess$IF_TRUE1}}
@Int32.initial_sqrt_guess.GT.1 // 191
D=A // 192
@SP // 193
AM=M+1 // 194
A=A-1 // 195
M=D // 196
@THIS // 197
A=M // 198
D=M // 199
@THIS // 200
A=M // 201
D=M // 202
@3 // 203
D=D+A // 204
A=D // 205
D=M // 206
@DO_GT // 207
0;JMP // 208
(Int32.initial_sqrt_guess.GT.1)
@Int32.initial_sqrt_guess$IF_TRUE1 // 209
D;JNE // 210

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END1}
// goto Int32.initial_sqrt_guess$IF_END1
@Int32.initial_sqrt_guess$IF_END1 // 211
0;JMP // 212

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE1}
// label Int32.initial_sqrt_guess$IF_TRUE1
(Int32.initial_sqrt_guess$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 213
D=A // 214
@SP // 215
AM=M+1 // 216
A=A-1 // 217
M=D // 218
// call Int32.new
@6 // 219
D=A // 220
@14 // 221
M=D // 222
@Int32.new // 223
D=A // 224
@13 // 225
M=D // 226
@Int32.initial_sqrt_guess.ret.0 // 227
D=A // 228
@CALL // 229
0;JMP // 230
(Int32.initial_sqrt_guess.ret.0)
@SP // 231
AM=M-1 // 232
D=M // 233
@LCL // 234
A=M // 235
M=D // 236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4096")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@4096 // 237
D=A // 238
@SP // 239
AM=M+1 // 240
A=A-1 // 241
M=D // 242
// call Int32.new
@6 // 243
D=A // 244
@14 // 245
M=D // 246
@Int32.new // 247
D=A // 248
@13 // 249
M=D // 250
@Int32.initial_sqrt_guess.ret.1 // 251
D=A // 252
@CALL // 253
0;JMP // 254
(Int32.initial_sqrt_guess.ret.1)
@SP // 255
AM=M-1 // 256
D=M // 257
@LCL // 258
A=M+1 // 259
M=D // 260

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 261
A=M // 262
D=M // 263
@SP // 264
AM=M+1 // 265
A=A-1 // 266
M=D // 267
@LCL // 268
A=M+1 // 269
D=M // 270
@SP // 271
AM=M+1 // 272
A=A-1 // 273
M=D // 274
// call Int32.do_mul
@7 // 275
D=A // 276
@14 // 277
M=D // 278
@Int32.do_mul // 279
D=A // 280
@13 // 281
M=D // 282
@Int32.initial_sqrt_guess.ret.2 // 283
D=A // 284
@CALL // 285
0;JMP // 286
(Int32.initial_sqrt_guess.ret.2)
@SP // 287
M=M-1 // 288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 289
A=M+1 // 290
D=M // 291
@SP // 292
AM=M+1 // 293
A=A-1 // 294
M=D // 295
// call Int32.dispose
@6 // 296
D=A // 297
@14 // 298
M=D // 299
@Int32.dispose // 300
D=A // 301
@13 // 302
M=D // 303
@Int32.initial_sqrt_guess.ret.3 // 304
D=A // 305
@CALL // 306
0;JMP // 307
(Int32.initial_sqrt_guess.ret.3)
@SP // 308
M=M-1 // 309

////PushInstruction("local 0")
@LCL // 310
A=M // 311
D=M // 312
@SP // 313
AM=M+1 // 314
A=A-1 // 315
M=D // 316
@RETURN // 317
0;JMP // 318

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_END1}
// label Int32.initial_sqrt_guess$IF_END1
(Int32.initial_sqrt_guess$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("constant 2"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Int32.initial_sqrt_guess$IF_TRUE2}}
@Int32.initial_sqrt_guess.GT.2 // 319
D=A // 320
@SP // 321
AM=M+1 // 322
A=A-1 // 323
M=D // 324
@THIS // 325
A=M // 326
D=M // 327
@THIS // 328
A=M // 329
D=M // 330
@2 // 331
D=D+A // 332
A=D // 333
D=M // 334
@DO_GT // 335
0;JMP // 336
(Int32.initial_sqrt_guess.GT.2)
@Int32.initial_sqrt_guess$IF_TRUE2 // 337
D;JNE // 338

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END2}
// goto Int32.initial_sqrt_guess$IF_END2
@Int32.initial_sqrt_guess$IF_END2 // 339
0;JMP // 340

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE2}
// label Int32.initial_sqrt_guess$IF_TRUE2
(Int32.initial_sqrt_guess$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 341
D=A // 342
@SP // 343
AM=M+1 // 344
A=A-1 // 345
M=D // 346
// call Int32.new
@6 // 347
D=A // 348
@14 // 349
M=D // 350
@Int32.new // 351
D=A // 352
@13 // 353
M=D // 354
@Int32.initial_sqrt_guess.ret.4 // 355
D=A // 356
@CALL // 357
0;JMP // 358
(Int32.initial_sqrt_guess.ret.4)
@SP // 359
AM=M-1 // 360
D=M // 361
@LCL // 362
A=M // 363
M=D // 364

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 256")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@256 // 365
D=A // 366
@SP // 367
AM=M+1 // 368
A=A-1 // 369
M=D // 370
// call Int32.new
@6 // 371
D=A // 372
@14 // 373
M=D // 374
@Int32.new // 375
D=A // 376
@13 // 377
M=D // 378
@Int32.initial_sqrt_guess.ret.5 // 379
D=A // 380
@CALL // 381
0;JMP // 382
(Int32.initial_sqrt_guess.ret.5)
@SP // 383
AM=M-1 // 384
D=M // 385
@LCL // 386
A=M+1 // 387
M=D // 388

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
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
// call Int32.do_mul
@7 // 403
D=A // 404
@14 // 405
M=D // 406
@Int32.do_mul // 407
D=A // 408
@13 // 409
M=D // 410
@Int32.initial_sqrt_guess.ret.6 // 411
D=A // 412
@CALL // 413
0;JMP // 414
(Int32.initial_sqrt_guess.ret.6)
@SP // 415
M=M-1 // 416

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 417
A=M+1 // 418
D=M // 419
@SP // 420
AM=M+1 // 421
A=A-1 // 422
M=D // 423
// call Int32.dispose
@6 // 424
D=A // 425
@14 // 426
M=D // 427
@Int32.dispose // 428
D=A // 429
@13 // 430
M=D // 431
@Int32.initial_sqrt_guess.ret.7 // 432
D=A // 433
@CALL // 434
0;JMP // 435
(Int32.initial_sqrt_guess.ret.7)
@SP // 436
M=M-1 // 437

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

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_END2}
// label Int32.initial_sqrt_guess$IF_END2
(Int32.initial_sqrt_guess$IF_END2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Int32.initial_sqrt_guess$IF_TRUE3}}
@Int32.initial_sqrt_guess.GT.3 // 447
D=A // 448
@SP // 449
AM=M+1 // 450
A=A-1 // 451
M=D // 452
@THIS // 453
A=M // 454
A=M+1 // 455
D=M // 456
@DO_GT // 457
0;JMP // 458
(Int32.initial_sqrt_guess.GT.3)
@Int32.initial_sqrt_guess$IF_TRUE3 // 459
D;JNE // 460

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END3}
// goto Int32.initial_sqrt_guess$IF_END3
@Int32.initial_sqrt_guess$IF_END3 // 461
0;JMP // 462

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE3}
// label Int32.initial_sqrt_guess$IF_TRUE3
(Int32.initial_sqrt_guess$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 463
D=A // 464
@SP // 465
AM=M+1 // 466
A=A-1 // 467
M=D // 468
// call Int32.new
@6 // 469
D=A // 470
@14 // 471
M=D // 472
@Int32.new // 473
D=A // 474
@13 // 475
M=D // 476
@Int32.initial_sqrt_guess.ret.8 // 477
D=A // 478
@CALL // 479
0;JMP // 480
(Int32.initial_sqrt_guess.ret.8)
@SP // 481
AM=M-1 // 482
D=M // 483
@LCL // 484
A=M // 485
M=D // 486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@16 // 487
D=A // 488
@SP // 489
AM=M+1 // 490
A=A-1 // 491
M=D // 492
// call Int32.new
@6 // 493
D=A // 494
@14 // 495
M=D // 496
@Int32.new // 497
D=A // 498
@13 // 499
M=D // 500
@Int32.initial_sqrt_guess.ret.9 // 501
D=A // 502
@CALL // 503
0;JMP // 504
(Int32.initial_sqrt_guess.ret.9)
@SP // 505
AM=M-1 // 506
D=M // 507
@LCL // 508
A=M+1 // 509
M=D // 510

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 511
A=M // 512
D=M // 513
@SP // 514
AM=M+1 // 515
A=A-1 // 516
M=D // 517
@LCL // 518
A=M+1 // 519
D=M // 520
@SP // 521
AM=M+1 // 522
A=A-1 // 523
M=D // 524
// call Int32.do_mul
@7 // 525
D=A // 526
@14 // 527
M=D // 528
@Int32.do_mul // 529
D=A // 530
@13 // 531
M=D // 532
@Int32.initial_sqrt_guess.ret.10 // 533
D=A // 534
@CALL // 535
0;JMP // 536
(Int32.initial_sqrt_guess.ret.10)
@SP // 537
M=M-1 // 538

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 539
A=M+1 // 540
D=M // 541
@SP // 542
AM=M+1 // 543
A=A-1 // 544
M=D // 545
// call Int32.dispose
@6 // 546
D=A // 547
@14 // 548
M=D // 549
@Int32.dispose // 550
D=A // 551
@13 // 552
M=D // 553
@Int32.initial_sqrt_guess.ret.11 // 554
D=A // 555
@CALL // 556
0;JMP // 557
(Int32.initial_sqrt_guess.ret.11)
@SP // 558
M=M-1 // 559

////PushInstruction("local 0")
@LCL // 560
A=M // 561
D=M // 562
@SP // 563
AM=M+1 // 564
A=A-1 // 565
M=D // 566
@RETURN // 567
0;JMP // 568

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_END3}
// label Int32.initial_sqrt_guess$IF_END3
(Int32.initial_sqrt_guess$IF_END3)

////CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
@11 // 569
D=A // 570
@SP // 571
AM=M+1 // 572
A=A-1 // 573
M=D // 574
// call Int32.new
@6 // 575
D=A // 576
@14 // 577
M=D // 578
@Int32.new // 579
D=A // 580
@13 // 581
M=D // 582
@Int32.initial_sqrt_guess.ret.12 // 583
D=A // 584
@CALL // 585
0;JMP // 586
(Int32.initial_sqrt_guess.ret.12)
@RETURN // 587
0;JMP // 588

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 589
M=0 // 590

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.4 // 591
D=A // 592
@SP // 593
AM=M+1 // 594
A=A-1 // 595
M=D // 596
@Output.2 // 597
D=M // 598
@22 // 599
D=D-A // 600
@DO_EQ // 601
0;JMP // 602
(Output.println.EQ.4)
@Output.println$IF_TRUE1 // 603
D;JNE // 604

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 605
0;JMP // 606

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 607
M=0 // 608

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 609
0;JMP // 610

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

@Output.2 // 611
M=M+1 // 612

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 613
AM=M+1 // 614
A=A-1 // 615
M=0 // 616
@RETURN // 617
0;JMP // 618

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 619
AM=M+1 // 620
A=A-1 // 621
M=0 // 622

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

@ARG // 623
A=M // 624
A=M // 625
D=M // 626
@LCL // 627
A=M // 628
M=D // 629

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
@Memory.get_best_fit.LT.5 // 630
D=A // 631
@SP // 632
AM=M+1 // 633
A=A-1 // 634
M=D // 635
@LCL // 636
A=M // 637
A=M // 638
D=M // 639
@SP // 640
AM=M+1 // 641
A=A-1 // 642
M=D // 643
@ARG // 644
A=M+1 // 645
D=M // 646
@SP // 647
AM=M-1 // 648
D=M-D // 649
@DO_LT // 650
0;JMP // 651
(Memory.get_best_fit.LT.5)
D=!D // 652
@Memory.get_best_fit$IF_TRUE1 // 653
D;JNE // 654

////GotoInstruction{label='Memory.get_best_fit$IF_END1}
// goto Memory.get_best_fit$IF_END1
@Memory.get_best_fit$IF_END1 // 655
0;JMP // 656

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 657
A=M // 658
D=M // 659
@SP // 660
AM=M+1 // 661
A=A-1 // 662
M=D // 663
@RETURN // 664
0;JMP // 665

////LabelInstruction{label='Memory.get_best_fit$IF_END1}
// label Memory.get_best_fit$IF_END1
(Memory.get_best_fit$IF_END1)

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
@Memory.get_best_fit.EQ.6 // 666
D=A // 667
@SP // 668
AM=M+1 // 669
A=A-1 // 670
M=D // 671
@LCL // 672
A=M // 673
D=M // 674
@LCL // 675
A=M // 676
D=M // 677
@3 // 678
D=D+A // 679
A=D // 680
D=M // 681
@DO_EQ // 682
0;JMP // 683
(Memory.get_best_fit.EQ.6)
@Memory.get_best_fit_WHILE_END1 // 684
D;JNE // 685

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

@LCL // 686
A=M // 687
D=M // 688
@LCL // 689
A=M // 690
D=M // 691
@3 // 692
D=D+A // 693
A=D // 694
D=M // 695
@LCL // 696
A=M // 697
M=D // 698

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
@Memory.get_best_fit.LT.7 // 699
D=A // 700
@SP // 701
AM=M+1 // 702
A=A-1 // 703
M=D // 704
@LCL // 705
A=M // 706
A=M // 707
D=M // 708
@SP // 709
AM=M+1 // 710
A=A-1 // 711
M=D // 712
@ARG // 713
A=M+1 // 714
D=M // 715
@SP // 716
AM=M-1 // 717
D=M-D // 718
@DO_LT // 719
0;JMP // 720
(Memory.get_best_fit.LT.7)
D=!D // 721
@Memory.get_best_fit$IF_TRUE2 // 722
D;JNE // 723

////GotoInstruction{label='Memory.get_best_fit$IF_END2}
// goto Memory.get_best_fit$IF_END2
@Memory.get_best_fit$IF_END2 // 724
0;JMP // 725

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 726
A=M // 727
D=M // 728
@SP // 729
AM=M+1 // 730
A=A-1 // 731
M=D // 732
@RETURN // 733
0;JMP // 734

////LabelInstruction{label='Memory.get_best_fit$IF_END2}
// label Memory.get_best_fit$IF_END2
(Memory.get_best_fit$IF_END2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 735
0;JMP // 736

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 737
AM=M+1 // 738
A=A-1 // 739
M=0 // 740
@RETURN // 741
0;JMP // 742

////FunctionInstruction{functionName='Number.clone', numLocals=0, funcMapping={}}
// function Number.clone with 0
(Number.clone)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 743
A=M // 744
D=M // 745
@3 // 746
M=D // 747

////CallGroup{pushes=[CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.clone}}], call=CallInstruction{Number.new_from_int32}}
@THIS // 748
A=M // 749
D=M // 750
@SP // 751
AM=M+1 // 752
A=A-1 // 753
M=D // 754
// call Int32.clone
@6 // 755
D=A // 756
@14 // 757
M=D // 758
@Int32.clone // 759
D=A // 760
@13 // 761
M=D // 762
@Number.clone.ret.0 // 763
D=A // 764
@CALL // 765
0;JMP // 766
(Number.clone.ret.0)
// call Number.new_from_int32
@6 // 767
D=A // 768
@14 // 769
M=D // 770
@Number.new_from_int32 // 771
D=A // 772
@13 // 773
M=D // 774
@Number.clone.ret.1 // 775
D=A // 776
@CALL // 777
0;JMP // 778
(Number.clone.ret.1)
@RETURN // 779
0;JMP // 780

////FunctionInstruction{functionName='Int32.new_from_parts', numLocals=0, funcMapping={Int32.initial_sqrt_guess=13}}
// function Int32.new_from_parts with 0
(Int32.new_from_parts)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 781
AM=M+1 // 782
A=A-1 // 783
M=1 // 784
// call Memory.alloc
@6 // 785
D=A // 786
@14 // 787
M=D // 788
@Memory.alloc // 789
D=A // 790
@13 // 791
M=D // 792
@Int32.new_from_parts.ret.0 // 793
D=A // 794
@CALL // 795
0;JMP // 796
(Int32.new_from_parts.ret.0)
@SP // 797
AM=M-1 // 798
D=M // 799
@3 // 800
M=D // 801

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Int32.0 // 802
M=M+1 // 803

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 804
A=M // 805
D=M // 806
@THIS // 807
A=M // 808
M=D // 809

////PushInstruction("pointer 0")
@3 // 810
D=M // 811
@SP // 812
AM=M+1 // 813
A=A-1 // 814
M=D // 815
@RETURN // 816
0;JMP // 817

////FunctionInstruction{functionName='Intersection.dispose', numLocals=0, funcMapping={}}
// function Intersection.dispose with 0
(Intersection.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 818
A=M // 819
D=M // 820
@3 // 821
M=D // 822

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Intersection.0 // 823
M=M-1 // 824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 825
A=M // 826
D=M // 827
@SP // 828
AM=M+1 // 829
A=A-1 // 830
M=D // 831
// call Number.dispose
@6 // 832
D=A // 833
@14 // 834
M=D // 835
@Number.dispose // 836
D=A // 837
@13 // 838
M=D // 839
@Intersection.dispose.ret.0 // 840
D=A // 841
@CALL // 842
0;JMP // 843
(Intersection.dispose.ret.0)
@SP // 844
M=M-1 // 845

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 846
D=M // 847
@SP // 848
AM=M+1 // 849
A=A-1 // 850
M=D // 851
// call Memory.deAlloc
@6 // 852
D=A // 853
@14 // 854
M=D // 855
@Memory.deAlloc // 856
D=A // 857
@13 // 858
M=D // 859
@Intersection.dispose.ret.1 // 860
D=A // 861
@CALL // 862
0;JMP // 863
(Intersection.dispose.ret.1)
@SP // 864
M=M-1 // 865

////PushInstruction("constant 0")
@SP // 866
AM=M+1 // 867
A=A-1 // 868
M=0 // 869
@RETURN // 870
0;JMP // 871

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.println=0}}
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
@Output.getMap.LT.8 // 872
D=A // 873
@SP // 874
AM=M+1 // 875
A=A-1 // 876
M=D // 877
@ARG // 878
A=M // 879
D=M // 880
@32 // 881
D=D-A // 882
@DO_LT // 883
0;JMP // 884
(Output.getMap.LT.8)
@SP // 885
AM=M+1 // 886
A=A-1 // 887
M=D // 888
@Output.getMap.GT.9 // 889
D=A // 890
@SP // 891
AM=M+1 // 892
A=A-1 // 893
M=D // 894
@ARG // 895
A=M // 896
D=M // 897
@126 // 898
D=D-A // 899
@DO_GT // 900
0;JMP // 901
(Output.getMap.GT.9)
@SP // 902
AM=M-1 // 903
D=D|M // 904
@Output.getMap$IF_TRUE1 // 905
D;JNE // 906

////GotoInstruction{label='Output.getMap$IF_END1}
// goto Output.getMap$IF_END1
@Output.getMap$IF_END1 // 907
0;JMP // 908

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 909
A=M // 910
M=0 // 911

////LabelInstruction{label='Output.getMap$IF_END1}
// label Output.getMap$IF_END1
(Output.getMap$IF_END1)

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
@Output.0 // 912
D=M // 913
@ARG // 914
A=M // 915
A=D+M // 916
D=M // 917
@SP // 918
AM=M+1 // 919
A=A-1 // 920
M=D // 921
@RETURN // 922
0;JMP // 923

////FunctionInstruction{functionName='Vec3.do_add', numLocals=0, funcMapping={}}
// function Vec3.do_add with 0
(Vec3.do_add)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 924
A=M // 925
D=M // 926
@3 // 927
M=D // 928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 929
A=M // 930
D=M // 931
@SP // 932
AM=M+1 // 933
A=A-1 // 934
M=D // 935
@ARG // 936
A=M+1 // 937
D=M // 938
@SP // 939
AM=M+1 // 940
A=A-1 // 941
M=D // 942
// call Vec3.getX
@6 // 943
D=A // 944
@14 // 945
M=D // 946
@Vec3.getX // 947
D=A // 948
@13 // 949
M=D // 950
@Vec3.do_add.ret.0 // 951
D=A // 952
@CALL // 953
0;JMP // 954
(Vec3.do_add.ret.0)
// call Number.do_add
@7 // 955
D=A // 956
@14 // 957
M=D // 958
@Number.do_add // 959
D=A // 960
@13 // 961
M=D // 962
@Vec3.do_add.ret.1 // 963
D=A // 964
@CALL // 965
0;JMP // 966
(Vec3.do_add.ret.1)
@SP // 967
M=M-1 // 968

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 969
A=M+1 // 970
D=M // 971
@SP // 972
AM=M+1 // 973
A=A-1 // 974
M=D // 975
@ARG // 976
A=M+1 // 977
D=M // 978
@SP // 979
AM=M+1 // 980
A=A-1 // 981
M=D // 982
// call Vec3.getY
@6 // 983
D=A // 984
@14 // 985
M=D // 986
@Vec3.getY // 987
D=A // 988
@13 // 989
M=D // 990
@Vec3.do_add.ret.2 // 991
D=A // 992
@CALL // 993
0;JMP // 994
(Vec3.do_add.ret.2)
// call Number.do_add
@7 // 995
D=A // 996
@14 // 997
M=D // 998
@Number.do_add // 999
D=A // 1000
@13 // 1001
M=D // 1002
@Vec3.do_add.ret.3 // 1003
D=A // 1004
@CALL // 1005
0;JMP // 1006
(Vec3.do_add.ret.3)
@SP // 1007
M=M-1 // 1008

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1009
A=M+1 // 1010
A=A+1 // 1011
D=M // 1012
@SP // 1013
AM=M+1 // 1014
A=A-1 // 1015
M=D // 1016
@ARG // 1017
A=M+1 // 1018
D=M // 1019
@SP // 1020
AM=M+1 // 1021
A=A-1 // 1022
M=D // 1023
// call Vec3.getZ
@6 // 1024
D=A // 1025
@14 // 1026
M=D // 1027
@Vec3.getZ // 1028
D=A // 1029
@13 // 1030
M=D // 1031
@Vec3.do_add.ret.4 // 1032
D=A // 1033
@CALL // 1034
0;JMP // 1035
(Vec3.do_add.ret.4)
// call Number.do_add
@7 // 1036
D=A // 1037
@14 // 1038
M=D // 1039
@Number.do_add // 1040
D=A // 1041
@13 // 1042
M=D // 1043
@Vec3.do_add.ret.5 // 1044
D=A // 1045
@CALL // 1046
0;JMP // 1047
(Vec3.do_add.ret.5)
@SP // 1048
M=M-1 // 1049

////PushInstruction("constant 0")
@SP // 1050
AM=M+1 // 1051
A=A-1 // 1052
M=0 // 1053
@RETURN // 1054
0;JMP // 1055

////FunctionInstruction{functionName='Int32.is_positive', numLocals=0, funcMapping={Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.is_positive with 0
(Int32.is_positive)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1056
A=M // 1057
D=M // 1058
@3 // 1059
M=D // 1060

////BinaryPushGroup(
//    left:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_zero}},
//NOT),
//    right:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("this 0"),
//                            right:
//                                PushInstruction("constant 3"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 128"),
//            binaryOp: "LT"
//        ),
//    binaryOp: "AND"
//)
@3 // 1061
D=M // 1062
@SP // 1063
AM=M+1 // 1064
A=A-1 // 1065
M=D // 1066
// call Int32.is_zero
@6 // 1067
D=A // 1068
@14 // 1069
M=D // 1070
@Int32.is_zero // 1071
D=A // 1072
@13 // 1073
M=D // 1074
@Int32.is_positive.ret.0 // 1075
D=A // 1076
@CALL // 1077
0;JMP // 1078
(Int32.is_positive.ret.0)
@SP // 1079
A=M-1 // 1080
M=!D // 1081
@Int32.is_positive.LT.10 // 1082
D=A // 1083
@SP // 1084
AM=M+1 // 1085
A=A-1 // 1086
M=D // 1087
@THIS // 1088
A=M // 1089
D=M // 1090
@THIS // 1091
A=M // 1092
D=M // 1093
@3 // 1094
D=D+A // 1095
A=D // 1096
D=M // 1097
@128 // 1098
D=D-A // 1099
@DO_LT // 1100
0;JMP // 1101
(Int32.is_positive.LT.10)
@SP // 1102
AM=M-1 // 1103
D=D&M // 1104
@SP // 1105
AM=M+1 // 1106
A=A-1 // 1107
M=D // 1108
@RETURN // 1109
0;JMP // 1110

////FunctionInstruction{functionName='Int32.do_sub', numLocals=1, funcMapping={Int32.is_positive=1, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.do_sub with 1
(Int32.do_sub)
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=0 // 1114

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1115
A=M // 1116
D=M // 1117
@3 // 1118
M=D // 1119

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1120
A=M+1 // 1121
D=M // 1122
@SP // 1123
AM=M+1 // 1124
A=A-1 // 1125
M=D // 1126
// call Int32.clone
@6 // 1127
D=A // 1128
@14 // 1129
M=D // 1130
@Int32.clone // 1131
D=A // 1132
@13 // 1133
M=D // 1134
@Int32.do_sub.ret.0 // 1135
D=A // 1136
@CALL // 1137
0;JMP // 1138
(Int32.do_sub.ret.0)
@SP // 1139
AM=M-1 // 1140
D=M // 1141
@LCL // 1142
A=M // 1143
M=D // 1144

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1145
A=M // 1146
D=M // 1147
@SP // 1148
AM=M+1 // 1149
A=A-1 // 1150
M=D // 1151
// call Int32.do_neg
@6 // 1152
D=A // 1153
@14 // 1154
M=D // 1155
@Int32.do_neg // 1156
D=A // 1157
@13 // 1158
M=D // 1159
@Int32.do_sub.ret.1 // 1160
D=A // 1161
@CALL // 1162
0;JMP // 1163
(Int32.do_sub.ret.1)
@SP // 1164
M=M-1 // 1165

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("local 0")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 1166
D=M // 1167
@SP // 1168
AM=M+1 // 1169
A=A-1 // 1170
M=D // 1171
@LCL // 1172
A=M // 1173
D=M // 1174
@SP // 1175
AM=M+1 // 1176
A=A-1 // 1177
M=D // 1178
// call Int32.do_add
@7 // 1179
D=A // 1180
@14 // 1181
M=D // 1182
@Int32.do_add // 1183
D=A // 1184
@13 // 1185
M=D // 1186
@Int32.do_sub.ret.2 // 1187
D=A // 1188
@CALL // 1189
0;JMP // 1190
(Int32.do_sub.ret.2)
@SP // 1191
M=M-1 // 1192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1193
A=M // 1194
D=M // 1195
@SP // 1196
AM=M+1 // 1197
A=A-1 // 1198
M=D // 1199
// call Int32.dispose
@6 // 1200
D=A // 1201
@14 // 1202
M=D // 1203
@Int32.dispose // 1204
D=A // 1205
@13 // 1206
M=D // 1207
@Int32.do_sub.ret.3 // 1208
D=A // 1209
@CALL // 1210
0;JMP // 1211
(Int32.do_sub.ret.3)
@SP // 1212
M=M-1 // 1213

////PushInstruction("constant 0")
@SP // 1214
AM=M+1 // 1215
A=A-1 // 1216
M=0 // 1217
@RETURN // 1218
0;JMP // 1219

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1220
M=-1 // 1221

////PushInstruction("constant 0")
@SP // 1222
AM=M+1 // 1223
A=A-1 // 1224
M=0 // 1225
@RETURN // 1226
0;JMP // 1227

////FunctionInstruction{functionName='Plane.initialize', numLocals=1, funcMapping={}}
// function Plane.initialize with 1
(Plane.initialize)
@SP // 1228
AM=M+1 // 1229
A=A-1 // 1230
M=0 // 1231

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=static 0}
//}

@SP // 1232
AM=M+1 // 1233
A=A-1 // 1234
M=0 // 1235
// call Number.new
@6 // 1236
D=A // 1237
@14 // 1238
M=D // 1239
@Number.new // 1240
D=A // 1241
@13 // 1242
M=D // 1243
@Plane.initialize.ret.0 // 1244
D=A // 1245
@CALL // 1246
0;JMP // 1247
(Plane.initialize.ret.0)
@SP // 1248
AM=M+1 // 1249
A=A-1 // 1250
M=0 // 1251
// call Number.new
@6 // 1252
D=A // 1253
@14 // 1254
M=D // 1255
@Number.new // 1256
D=A // 1257
@13 // 1258
M=D // 1259
@Plane.initialize.ret.1 // 1260
D=A // 1261
@CALL // 1262
0;JMP // 1263
(Plane.initialize.ret.1)
@SP // 1264
AM=M+1 // 1265
A=A-1 // 1266
M=1 // 1267
// call Number.new
@6 // 1268
D=A // 1269
@14 // 1270
M=D // 1271
@Number.new // 1272
D=A // 1273
@13 // 1274
M=D // 1275
@Plane.initialize.ret.2 // 1276
D=A // 1277
@CALL // 1278
0;JMP // 1279
(Plane.initialize.ret.2)
// call Vec3.new
@8 // 1280
D=A // 1281
@14 // 1282
M=D // 1283
@Vec3.new // 1284
D=A // 1285
@13 // 1286
M=D // 1287
@Plane.initialize.ret.3 // 1288
D=A // 1289
@CALL // 1290
0;JMP // 1291
(Plane.initialize.ret.3)
@SP // 1292
AM=M-1 // 1293
D=M // 1294
@Plane.0 // 1295
M=D // 1296

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=static 1}
//}

@SP // 1297
AM=M+1 // 1298
A=A-1 // 1299
M=0 // 1300
// call Number.new
@6 // 1301
D=A // 1302
@14 // 1303
M=D // 1304
@Number.new // 1305
D=A // 1306
@13 // 1307
M=D // 1308
@Plane.initialize.ret.4 // 1309
D=A // 1310
@CALL // 1311
0;JMP // 1312
(Plane.initialize.ret.4)
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=1 // 1316
// call Number.new
@6 // 1317
D=A // 1318
@14 // 1319
M=D // 1320
@Number.new // 1321
D=A // 1322
@13 // 1323
M=D // 1324
@Plane.initialize.ret.5 // 1325
D=A // 1326
@CALL // 1327
0;JMP // 1328
(Plane.initialize.ret.5)
@SP // 1329
AM=M+1 // 1330
A=A-1 // 1331
M=0 // 1332
// call Number.new
@6 // 1333
D=A // 1334
@14 // 1335
M=D // 1336
@Number.new // 1337
D=A // 1338
@13 // 1339
M=D // 1340
@Plane.initialize.ret.6 // 1341
D=A // 1342
@CALL // 1343
0;JMP // 1344
(Plane.initialize.ret.6)
// call Vec3.new
@8 // 1345
D=A // 1346
@14 // 1347
M=D // 1348
@Vec3.new // 1349
D=A // 1350
@13 // 1351
M=D // 1352
@Plane.initialize.ret.7 // 1353
D=A // 1354
@CALL // 1355
0;JMP // 1356
(Plane.initialize.ret.7)
@SP // 1357
AM=M-1 // 1358
D=M // 1359
@Plane.1 // 1360
M=D // 1361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1000")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 2}
//}

@1000 // 1362
D=A // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=D // 1367
// call Number.new
@6 // 1368
D=A // 1369
@14 // 1370
M=D // 1371
@Number.new // 1372
D=A // 1373
@13 // 1374
M=D // 1375
@Plane.initialize.ret.8 // 1376
D=A // 1377
@CALL // 1378
0;JMP // 1379
(Plane.initialize.ret.8)
@SP // 1380
AM=M-1 // 1381
D=M // 1382
@Plane.2 // 1383
M=D // 1384

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 3}
//}

@SP // 1385
AM=M+1 // 1386
A=A-1 // 1387
M=1 // 1388
// call Number.new
@6 // 1389
D=A // 1390
@14 // 1391
M=D // 1392
@Number.new // 1393
D=A // 1394
@13 // 1395
M=D // 1396
@Plane.initialize.ret.9 // 1397
D=A // 1398
@CALL // 1399
0;JMP // 1400
(Plane.initialize.ret.9)
@SP // 1401
AM=M-1 // 1402
D=M // 1403
@Plane.3 // 1404
M=D // 1405

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 4}
//}

@90 // 1406
D=A // 1407
@SP // 1408
AM=M+1 // 1409
A=A-1 // 1410
M=D // 1411
// call Number.new
@6 // 1412
D=A // 1413
@14 // 1414
M=D // 1415
@Number.new // 1416
D=A // 1417
@13 // 1418
M=D // 1419
@Plane.initialize.ret.10 // 1420
D=A // 1421
@CALL // 1422
0;JMP // 1423
(Plane.initialize.ret.10)
@SP // 1424
AM=M-1 // 1425
D=M // 1426
@Plane.4 // 1427
M=D // 1428

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 5}
//}

@3 // 1429
D=A // 1430
@SP // 1431
AM=M+1 // 1432
A=A-1 // 1433
M=D // 1434
// call Number.new
@6 // 1435
D=A // 1436
@14 // 1437
M=D // 1438
@Number.new // 1439
D=A // 1440
@13 // 1441
M=D // 1442
@Plane.initialize.ret.11 // 1443
D=A // 1444
@CALL // 1445
0;JMP // 1446
(Plane.initialize.ret.11)
@SP // 1447
AM=M-1 // 1448
D=M // 1449
@Plane.5 // 1450
M=D // 1451

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@100 // 1452
D=A // 1453
@SP // 1454
AM=M+1 // 1455
A=A-1 // 1456
M=D // 1457
// call Number.new
@6 // 1458
D=A // 1459
@14 // 1460
M=D // 1461
@Number.new // 1462
D=A // 1463
@13 // 1464
M=D // 1465
@Plane.initialize.ret.12 // 1466
D=A // 1467
@CALL // 1468
0;JMP // 1469
(Plane.initialize.ret.12)
@SP // 1470
AM=M-1 // 1471
D=M // 1472
@LCL // 1473
A=M // 1474
M=D // 1475

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 4"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@Plane.4 // 1476
D=M // 1477
@SP // 1478
AM=M+1 // 1479
A=A-1 // 1480
M=D // 1481
@LCL // 1482
A=M // 1483
D=M // 1484
@SP // 1485
AM=M+1 // 1486
A=A-1 // 1487
M=D // 1488
// call Number.do_div
@7 // 1489
D=A // 1490
@14 // 1491
M=D // 1492
@Number.do_div // 1493
D=A // 1494
@13 // 1495
M=D // 1496
@Plane.initialize.ret.13 // 1497
D=A // 1498
@CALL // 1499
0;JMP // 1500
(Plane.initialize.ret.13)
@SP // 1501
M=M-1 // 1502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 5"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@Plane.5 // 1503
D=M // 1504
@SP // 1505
AM=M+1 // 1506
A=A-1 // 1507
M=D // 1508
@LCL // 1509
A=M // 1510
D=M // 1511
@SP // 1512
AM=M+1 // 1513
A=A-1 // 1514
M=D // 1515
// call Number.do_div
@7 // 1516
D=A // 1517
@14 // 1518
M=D // 1519
@Number.do_div // 1520
D=A // 1521
@13 // 1522
M=D // 1523
@Plane.initialize.ret.14 // 1524
D=A // 1525
@CALL // 1526
0;JMP // 1527
(Plane.initialize.ret.14)
@SP // 1528
M=M-1 // 1529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1530
A=M // 1531
D=M // 1532
@SP // 1533
AM=M+1 // 1534
A=A-1 // 1535
M=D // 1536
// call Number.dispose
@6 // 1537
D=A // 1538
@14 // 1539
M=D // 1540
@Number.dispose // 1541
D=A // 1542
@13 // 1543
M=D // 1544
@Plane.initialize.ret.15 // 1545
D=A // 1546
@CALL // 1547
0;JMP // 1548
(Plane.initialize.ret.15)
@SP // 1549
M=M-1 // 1550

////PushInstruction("constant 0")
@SP // 1551
AM=M+1 // 1552
A=A-1 // 1553
M=0 // 1554
@RETURN // 1555
0;JMP // 1556

////FunctionInstruction{functionName='Plane.new', numLocals=0, funcMapping={Plane.initialize=16}}
// function Plane.new with 0
(Plane.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@4 // 1557
D=A // 1558
@SP // 1559
AM=M+1 // 1560
A=A-1 // 1561
M=D // 1562
// call Memory.alloc
@6 // 1563
D=A // 1564
@14 // 1565
M=D // 1566
@Memory.alloc // 1567
D=A // 1568
@13 // 1569
M=D // 1570
@Plane.new.ret.0 // 1571
D=A // 1572
@CALL // 1573
0;JMP // 1574
(Plane.new.ret.0)
@SP // 1575
AM=M-1 // 1576
D=M // 1577
@3 // 1578
M=D // 1579

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 1580
A=M // 1581
D=M // 1582
@THIS // 1583
A=M // 1584
M=D // 1585

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 1586
A=M+1 // 1587
D=M // 1588
@THIS // 1589
A=M+1 // 1590
M=D // 1591

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 1592
A=M+1 // 1593
A=A+1 // 1594
D=M // 1595
@THIS // 1596
A=M+1 // 1597
A=A+1 // 1598
M=D // 1599

////PushPopPair {
//  push: PushInstruction("argument 3")
//  pop:  PopInstruction{address=this 3}
//}

@ARG // 1600
A=M+1 // 1601
A=A+1 // 1602
A=A+1 // 1603
D=M // 1604
@THIS // 1605
A=M+1 // 1606
A=A+1 // 1607
A=A+1 // 1608
M=D // 1609

////PushInstruction("pointer 0")
@3 // 1610
D=M // 1611
@SP // 1612
AM=M+1 // 1613
A=A-1 // 1614
M=D // 1615
@RETURN // 1616
0;JMP // 1617

////FunctionInstruction{functionName='Number.do_mul', numLocals=0, funcMapping={Number.clone=2}}
// function Number.do_mul with 0
(Number.do_mul)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1618
A=M // 1619
D=M // 1620
@3 // 1621
M=D // 1622

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}},
//    right:
//CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.is_zero}},
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Number.do_mul$IF_TRUE1}}
@THIS // 1623
A=M // 1624
D=M // 1625
@SP // 1626
AM=M+1 // 1627
A=A-1 // 1628
M=D // 1629
// call Int32.is_zero
@6 // 1630
D=A // 1631
@14 // 1632
M=D // 1633
@Int32.is_zero // 1634
D=A // 1635
@13 // 1636
M=D // 1637
@Number.do_mul.ret.0 // 1638
D=A // 1639
@CALL // 1640
0;JMP // 1641
(Number.do_mul.ret.0)
@ARG // 1642
A=M+1 // 1643
D=M // 1644
@SP // 1645
AM=M+1 // 1646
A=A-1 // 1647
M=D // 1648
// call Number.is_zero
@6 // 1649
D=A // 1650
@14 // 1651
M=D // 1652
@Number.is_zero // 1653
D=A // 1654
@13 // 1655
M=D // 1656
@Number.do_mul.ret.1 // 1657
D=A // 1658
@CALL // 1659
0;JMP // 1660
(Number.do_mul.ret.1)
@SP // 1661
AM=M-1 // 1662
D=M // 1663
@SP // 1664
AM=M-1 // 1665
D=D|M // 1666
@Number.do_mul$IF_TRUE1 // 1667
D;JNE // 1668

////GotoInstruction{label='Number.do_mul$IF_END1}
// goto Number.do_mul$IF_END1
@Number.do_mul$IF_END1 // 1669
0;JMP // 1670

////LabelInstruction{label='Number.do_mul$IF_TRUE1}
// label Number.do_mul$IF_TRUE1
(Number.do_mul$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_zero}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1671
A=M // 1672
D=M // 1673
@SP // 1674
AM=M+1 // 1675
A=A-1 // 1676
M=D // 1677
// call Int32.do_zero
@6 // 1678
D=A // 1679
@14 // 1680
M=D // 1681
@Int32.do_zero // 1682
D=A // 1683
@13 // 1684
M=D // 1685
@Number.do_mul.ret.2 // 1686
D=A // 1687
@CALL // 1688
0;JMP // 1689
(Number.do_mul.ret.2)
@SP // 1690
M=M-1 // 1691

////PushInstruction("constant 0")
@SP // 1692
AM=M+1 // 1693
A=A-1 // 1694
M=0 // 1695
@RETURN // 1696
0;JMP // 1697

////LabelInstruction{label='Number.do_mul$IF_END1}
// label Number.do_mul$IF_END1
(Number.do_mul$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}, PushInstruction("constant 2")], call=CallInstruction{Int32.do_mul_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1698
A=M // 1699
D=M // 1700
@SP // 1701
AM=M+1 // 1702
A=A-1 // 1703
M=D // 1704
@ARG // 1705
A=M+1 // 1706
D=M // 1707
@SP // 1708
AM=M+1 // 1709
A=A-1 // 1710
M=D // 1711
// call Number.getV
@6 // 1712
D=A // 1713
@14 // 1714
M=D // 1715
@Number.getV // 1716
D=A // 1717
@13 // 1718
M=D // 1719
@Number.do_mul.ret.3 // 1720
D=A // 1721
@CALL // 1722
0;JMP // 1723
(Number.do_mul.ret.3)
@2 // 1724
D=A // 1725
@SP // 1726
AM=M+1 // 1727
A=A-1 // 1728
M=D // 1729
// call Int32.do_mul_right_shift_bytes
@8 // 1730
D=A // 1731
@14 // 1732
M=D // 1733
@Int32.do_mul_right_shift_bytes // 1734
D=A // 1735
@13 // 1736
M=D // 1737
@Number.do_mul.ret.4 // 1738
D=A // 1739
@CALL // 1740
0;JMP // 1741
(Number.do_mul.ret.4)
@SP // 1742
M=M-1 // 1743

////PushInstruction("constant 0")
@SP // 1744
AM=M+1 // 1745
A=A-1 // 1746
M=0 // 1747
@RETURN // 1748
0;JMP // 1749

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 1750
AM=M+1 // 1751
A=A-1 // 1752
M=0 // 1753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 1754
D=A // 1755
@SP // 1756
AM=M+1 // 1757
A=A-1 // 1758
M=D // 1759
// call Memory.alloc
@6 // 1760
D=A // 1761
@14 // 1762
M=D // 1763
@Memory.alloc // 1764
D=A // 1765
@13 // 1766
M=D // 1767
@Output.create.ret.0 // 1768
D=A // 1769
@CALL // 1770
0;JMP // 1771
(Output.create.ret.0)
@SP // 1772
AM=M-1 // 1773
D=M // 1774
@LCL // 1775
A=M // 1776
M=D // 1777

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 1778
D=M // 1779
@ARG // 1780
A=M // 1781
D=D+M // 1782
@SP // 1783
AM=M+1 // 1784
A=A-1 // 1785
M=D // 1786
@LCL // 1787
A=M // 1788
D=M // 1789
@SP // 1790
AM=M-1 // 1791
A=M // 1792
M=D // 1793

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 1794
A=M // 1795
D=M // 1796
@SP // 1797
AM=M+1 // 1798
A=A-1 // 1799
M=D // 1800
@ARG // 1801
A=M+1 // 1802
D=M // 1803
@SP // 1804
AM=M-1 // 1805
A=M // 1806
M=D // 1807

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1808
A=M // 1809
D=M // 1810
@SP // 1811
AM=M+1 // 1812
A=A-1 // 1813
M=D+1 // 1814
@ARG // 1815
A=M+1 // 1816
A=A+1 // 1817
D=M // 1818
@SP // 1819
AM=M-1 // 1820
A=M // 1821
M=D // 1822

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1823
A=M // 1824
D=M // 1825
@2 // 1826
D=D+A // 1827
@SP // 1828
AM=M+1 // 1829
A=A-1 // 1830
M=D // 1831
@ARG // 1832
A=M+1 // 1833
A=A+1 // 1834
A=A+1 // 1835
D=M // 1836
@SP // 1837
AM=M-1 // 1838
A=M // 1839
M=D // 1840

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1841
A=M // 1842
D=M // 1843
@3 // 1844
D=D+A // 1845
@SP // 1846
AM=M+1 // 1847
A=A-1 // 1848
M=D // 1849
@ARG // 1850
D=M // 1851
@4 // 1852
A=D+A // 1853
D=M // 1854
@SP // 1855
AM=M-1 // 1856
A=M // 1857
M=D // 1858

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 1859
A=M // 1860
D=M // 1861
@4 // 1862
D=D+A // 1863
@SP // 1864
AM=M+1 // 1865
A=A-1 // 1866
M=D // 1867
@ARG // 1868
D=M // 1869
@5 // 1870
A=D+A // 1871
D=M // 1872
@SP // 1873
AM=M-1 // 1874
A=M // 1875
M=D // 1876

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 1877
A=M // 1878
D=M // 1879
@5 // 1880
D=D+A // 1881
@SP // 1882
AM=M+1 // 1883
A=A-1 // 1884
M=D // 1885
@ARG // 1886
D=M // 1887
@6 // 1888
A=D+A // 1889
D=M // 1890
@SP // 1891
AM=M-1 // 1892
A=M // 1893
M=D // 1894

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 1895
A=M // 1896
D=M // 1897
@6 // 1898
D=D+A // 1899
@SP // 1900
AM=M+1 // 1901
A=A-1 // 1902
M=D // 1903
@ARG // 1904
D=M // 1905
@7 // 1906
A=D+A // 1907
D=M // 1908
@SP // 1909
AM=M-1 // 1910
A=M // 1911
M=D // 1912

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1913
A=M // 1914
D=M // 1915
@7 // 1916
D=D+A // 1917
@SP // 1918
AM=M+1 // 1919
A=A-1 // 1920
M=D // 1921
@ARG // 1922
D=M // 1923
@8 // 1924
A=D+A // 1925
D=M // 1926
@SP // 1927
AM=M-1 // 1928
A=M // 1929
M=D // 1930

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 1931
A=M // 1932
D=M // 1933
@8 // 1934
D=D+A // 1935
@SP // 1936
AM=M+1 // 1937
A=A-1 // 1938
M=D // 1939
@ARG // 1940
D=M // 1941
@9 // 1942
A=D+A // 1943
D=M // 1944
@SP // 1945
AM=M-1 // 1946
A=M // 1947
M=D // 1948

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 1949
A=M // 1950
D=M // 1951
@9 // 1952
D=D+A // 1953
@SP // 1954
AM=M+1 // 1955
A=A-1 // 1956
M=D // 1957
@ARG // 1958
D=M // 1959
@10 // 1960
A=D+A // 1961
D=M // 1962
@SP // 1963
AM=M-1 // 1964
A=M // 1965
M=D // 1966

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 1967
A=M // 1968
D=M // 1969
@10 // 1970
D=D+A // 1971
@SP // 1972
AM=M+1 // 1973
A=A-1 // 1974
M=D // 1975
@ARG // 1976
D=M // 1977
@11 // 1978
A=D+A // 1979
D=M // 1980
@SP // 1981
AM=M-1 // 1982
A=M // 1983
M=D // 1984

////PushInstruction("constant 0")
@SP // 1985
AM=M+1 // 1986
A=A-1 // 1987
M=0 // 1988
@RETURN // 1989
0;JMP // 1990

////FunctionInstruction{functionName='Int32.clone', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.clone with 2
(Int32.clone)
@SP // 1991
M=M+1 // 1992
AM=M+1 // 1993
A=A-1 // 1994
M=0 // 1995
A=A-1 // 1996
M=0 // 1997

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1998
A=M // 1999
D=M // 2000
@3 // 2001
M=D // 2002

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@4 // 2003
D=A // 2004
@SP // 2005
AM=M+1 // 2006
A=A-1 // 2007
M=D // 2008
// call Memory.alloc
@6 // 2009
D=A // 2010
@14 // 2011
M=D // 2012
@Memory.alloc // 2013
D=A // 2014
@13 // 2015
M=D // 2016
@Int32.clone.ret.0 // 2017
D=A // 2018
@CALL // 2019
0;JMP // 2020
(Int32.clone.ret.0)
@SP // 2021
AM=M-1 // 2022
D=M // 2023
@LCL // 2024
A=M // 2025
M=D // 2026

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2027
A=M+1 // 2028
M=0 // 2029

////LabelInstruction{label='Int32.clone_WHILE_EXP1}
// label Int32.clone_WHILE_EXP1
(Int32.clone_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.clone_WHILE_END1}}
@Int32.clone.LT.11 // 2030
D=A // 2031
@SP // 2032
AM=M+1 // 2033
A=A-1 // 2034
M=D // 2035
@LCL // 2036
A=M+1 // 2037
D=M // 2038
@4 // 2039
D=D-A // 2040
@DO_LT // 2041
0;JMP // 2042
(Int32.clone.LT.11)
D=!D // 2043
@Int32.clone_WHILE_END1 // 2044
D;JNE // 2045

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 0"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2046
A=M+1 // 2047
D=M // 2048
A=A-1 // 2049
D=D+M // 2050
@SP // 2051
AM=M+1 // 2052
A=A-1 // 2053
M=D // 2054
@THIS // 2055
A=M // 2056
D=M // 2057
@LCL // 2058
A=M+1 // 2059
A=D+M // 2060
D=M // 2061
@SP // 2062
AM=M-1 // 2063
A=M // 2064
M=D // 2065

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

@LCL // 2066
A=M+1 // 2067
M=M+1 // 2068

////GotoInstruction{label='Int32.clone_WHILE_EXP1}
// goto Int32.clone_WHILE_EXP1
@Int32.clone_WHILE_EXP1 // 2069
0;JMP // 2070

////LabelInstruction{label='Int32.clone_WHILE_END1}
// label Int32.clone_WHILE_END1
(Int32.clone_WHILE_END1)

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.new_from_parts}}
@LCL // 2071
A=M // 2072
D=M // 2073
@SP // 2074
AM=M+1 // 2075
A=A-1 // 2076
M=D // 2077
// call Int32.new_from_parts
@6 // 2078
D=A // 2079
@14 // 2080
M=D // 2081
@Int32.new_from_parts // 2082
D=A // 2083
@13 // 2084
M=D // 2085
@Int32.clone.ret.1 // 2086
D=A // 2087
@CALL // 2088
0;JMP // 2089
(Int32.clone.ret.1)
@RETURN // 2090
0;JMP // 2091

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2092
A=M // 2093
D=M // 2094
@3 // 2095
M=D // 2096

////PushInstruction("this 1")
@THIS // 2097
A=M+1 // 2098
D=M // 2099
@SP // 2100
AM=M+1 // 2101
A=A-1 // 2102
M=D // 2103
@RETURN // 2104
0;JMP // 2105

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2106
AM=M+1 // 2107
A=A-1 // 2108
M=0 // 2109

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2110
A=M // 2111
M=0 // 2112

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
@Memory.getBinIndex.LT.12 // 2113
D=A // 2114
@SP // 2115
AM=M+1 // 2116
A=A-1 // 2117
M=D // 2118
@LCL // 2119
A=M // 2120
D=M // 2121
@7 // 2122
D=D-A // 2123
@DO_LT // 2124
0;JMP // 2125
(Memory.getBinIndex.LT.12)
@SP // 2126
AM=M+1 // 2127
A=A-1 // 2128
M=D // 2129
@Memory.getBinIndex.EQ.13 // 2130
D=A // 2131
@SP // 2132
AM=M+1 // 2133
A=A-1 // 2134
M=D // 2135
@LCL // 2136
A=M // 2137
D=M // 2138
@LCL // 2139
A=M // 2140
D=M // 2141
@2048 // 2142
D=D+A // 2143
A=D // 2144
D=M // 2145
@DO_EQ // 2146
0;JMP // 2147
(Memory.getBinIndex.EQ.13)
D=!D // 2148
@SP // 2149
AM=M-1 // 2150
D=D&M // 2151
D=!D // 2152
@Memory.getBinIndex_WHILE_END1 // 2153
D;JNE // 2154

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
@Memory.getBinIndex.GT.14 // 2155
D=A // 2156
@SP // 2157
AM=M+1 // 2158
A=A-1 // 2159
M=D // 2160
@ARG // 2161
A=M // 2162
D=M // 2163
@SP // 2164
AM=M+1 // 2165
A=A-1 // 2166
M=D // 2167
@LCL // 2168
A=M // 2169
D=M // 2170
@SP // 2171
AM=M+1 // 2172
A=A-1 // 2173
M=D+1 // 2174
@16 // 2175
D=A // 2176
@SP // 2177
AM=M+1 // 2178
A=A-1 // 2179
M=D // 2180
// call Math.multiply
@7 // 2181
D=A // 2182
@14 // 2183
M=D // 2184
@Math.multiply // 2185
D=A // 2186
@13 // 2187
M=D // 2188
@Memory.getBinIndex.ret.0 // 2189
D=A // 2190
@CALL // 2191
0;JMP // 2192
(Memory.getBinIndex.ret.0)
@SP // 2193
AM=M-1 // 2194
D=M // 2195
@SP // 2196
AM=M-1 // 2197
D=M-D // 2198
@DO_GT // 2199
0;JMP // 2200
(Memory.getBinIndex.GT.14)
D=!D // 2201
@Memory.getBinIndex$IF_TRUE1 // 2202
D;JNE // 2203

////GotoInstruction{label='Memory.getBinIndex$IF_END1}
// goto Memory.getBinIndex$IF_END1
@Memory.getBinIndex$IF_END1 // 2204
0;JMP // 2205

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2206
A=M // 2207
D=M // 2208
@SP // 2209
AM=M+1 // 2210
A=A-1 // 2211
M=D // 2212
@RETURN // 2213
0;JMP // 2214

////LabelInstruction{label='Memory.getBinIndex$IF_END1}
// label Memory.getBinIndex$IF_END1
(Memory.getBinIndex$IF_END1)

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

@LCL // 2215
A=M // 2216
M=M+1 // 2217

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2218
0;JMP // 2219

////LabelInstruction{label='Memory.getBinIndex_WHILE_END1}
// label Memory.getBinIndex_WHILE_END1
(Memory.getBinIndex_WHILE_END1)

////PushInstruction("constant 6")
@6 // 2220
D=A // 2221
@SP // 2222
AM=M+1 // 2223
A=A-1 // 2224
M=D // 2225
@RETURN // 2226
0;JMP // 2227

////FunctionInstruction{functionName='Sphere.new', numLocals=0, funcMapping={}}
// function Sphere.new with 0
(Sphere.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2228
D=A // 2229
@SP // 2230
AM=M+1 // 2231
A=A-1 // 2232
M=D // 2233
// call Memory.alloc
@6 // 2234
D=A // 2235
@14 // 2236
M=D // 2237
@Memory.alloc // 2238
D=A // 2239
@13 // 2240
M=D // 2241
@Sphere.new.ret.0 // 2242
D=A // 2243
@CALL // 2244
0;JMP // 2245
(Sphere.new.ret.0)
@SP // 2246
AM=M-1 // 2247
D=M // 2248
@3 // 2249
M=D // 2250

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2251
A=M // 2252
D=M // 2253
@THIS // 2254
A=M // 2255
M=D // 2256

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 2257
A=M+1 // 2258
D=M // 2259
@THIS // 2260
A=M+1 // 2261
M=D // 2262

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2263
A=M+1 // 2264
A=A+1 // 2265
D=M // 2266
@THIS // 2267
A=M+1 // 2268
A=A+1 // 2269
M=D // 2270

////PushInstruction("pointer 0")
@3 // 2271
D=M // 2272
@SP // 2273
AM=M+1 // 2274
A=A-1 // 2275
M=D // 2276
@RETURN // 2277
0;JMP // 2278

////FunctionInstruction{functionName='Number.cmp', numLocals=0, funcMapping={Number.clone=2, Number.do_mul=5}}
// function Number.cmp with 0
(Number.cmp)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2279
A=M // 2280
D=M // 2281
@3 // 2282
M=D // 2283

////CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.cmp}}
@THIS // 2284
A=M // 2285
D=M // 2286
@SP // 2287
AM=M+1 // 2288
A=A-1 // 2289
M=D // 2290
@ARG // 2291
A=M+1 // 2292
D=M // 2293
@SP // 2294
AM=M+1 // 2295
A=A-1 // 2296
M=D // 2297
// call Number.getV
@6 // 2298
D=A // 2299
@14 // 2300
M=D // 2301
@Number.getV // 2302
D=A // 2303
@13 // 2304
M=D // 2305
@Number.cmp.ret.0 // 2306
D=A // 2307
@CALL // 2308
0;JMP // 2309
(Number.cmp.ret.0)
// call Int32.cmp
@7 // 2310
D=A // 2311
@14 // 2312
M=D // 2313
@Int32.cmp // 2314
D=A // 2315
@13 // 2316
M=D // 2317
@Number.cmp.ret.1 // 2318
D=A // 2319
@CALL // 2320
0;JMP // 2321
(Number.cmp.ret.1)
@RETURN // 2322
0;JMP // 2323

////FunctionInstruction{functionName='Int32.do_abs', numLocals=0, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_abs with 0
(Int32.do_abs)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2324
A=M // 2325
D=M // 2326
@3 // 2327
M=D // 2328

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_abs$IF_TRUE1}}
@3 // 2329
D=M // 2330
@SP // 2331
AM=M+1 // 2332
A=A-1 // 2333
M=D // 2334
// call Int32.is_negative
@6 // 2335
D=A // 2336
@14 // 2337
M=D // 2338
@Int32.is_negative // 2339
D=A // 2340
@13 // 2341
M=D // 2342
@Int32.do_abs.ret.0 // 2343
D=A // 2344
@CALL // 2345
0;JMP // 2346
(Int32.do_abs.ret.0)
@SP // 2347
AM=M-1 // 2348
D=M // 2349
@Int32.do_abs$IF_TRUE1 // 2350
D;JNE // 2351

////GotoInstruction{label='Int32.do_abs$IF_END1}
// goto Int32.do_abs$IF_END1
@Int32.do_abs$IF_END1 // 2352
0;JMP // 2353

////LabelInstruction{label='Int32.do_abs$IF_TRUE1}
// label Int32.do_abs$IF_TRUE1
(Int32.do_abs$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2354
D=M // 2355
@SP // 2356
AM=M+1 // 2357
A=A-1 // 2358
M=D // 2359
// call Int32.do_neg
@6 // 2360
D=A // 2361
@14 // 2362
M=D // 2363
@Int32.do_neg // 2364
D=A // 2365
@13 // 2366
M=D // 2367
@Int32.do_abs.ret.1 // 2368
D=A // 2369
@CALL // 2370
0;JMP // 2371
(Int32.do_abs.ret.1)
@SP // 2372
M=M-1 // 2373

////LabelInstruction{label='Int32.do_abs$IF_END1}
// label Int32.do_abs$IF_END1
(Int32.do_abs$IF_END1)

////PushInstruction("constant 0")
@SP // 2374
AM=M+1 // 2375
A=A-1 // 2376
M=0 // 2377
@RETURN // 2378
0;JMP // 2379

////FunctionInstruction{functionName='Int32.do_right_shift_bytes', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_right_shift_bytes with 2
(Int32.do_right_shift_bytes)
@SP // 2380
M=M+1 // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=0 // 2384
A=A-1 // 2385
M=0 // 2386

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2387
A=M // 2388
D=M // 2389
@3 // 2390
M=D // 2391

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE1}}
@Int32.do_right_shift_bytes.GT.15 // 2392
D=A // 2393
@SP // 2394
AM=M+1 // 2395
A=A-1 // 2396
M=D // 2397
@ARG // 2398
A=M+1 // 2399
D=M // 2400
@DO_GT // 2401
0;JMP // 2402
(Int32.do_right_shift_bytes.GT.15)
D=!D // 2403
@Int32.do_right_shift_bytes$IF_TRUE1 // 2404
D;JNE // 2405

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END1}
// goto Int32.do_right_shift_bytes$IF_END1
@Int32.do_right_shift_bytes$IF_END1 // 2406
0;JMP // 2407

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE1}
// label Int32.do_right_shift_bytes$IF_TRUE1
(Int32.do_right_shift_bytes$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2408
AM=M+1 // 2409
A=A-1 // 2410
M=0 // 2411
@RETURN // 2412
0;JMP // 2413

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END1}
// label Int32.do_right_shift_bytes$IF_END1
(Int32.do_right_shift_bytes$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}
//  pop:  PopInstruction{address=local 1}
//}

@3 // 2414
D=M // 2415
@SP // 2416
AM=M+1 // 2417
A=A-1 // 2418
M=D // 2419
// call Int32.is_negative
@6 // 2420
D=A // 2421
@14 // 2422
M=D // 2423
@Int32.is_negative // 2424
D=A // 2425
@13 // 2426
M=D // 2427
@Int32.do_right_shift_bytes.ret.0 // 2428
D=A // 2429
@CALL // 2430
0;JMP // 2431
(Int32.do_right_shift_bytes.ret.0)
@SP // 2432
AM=M-1 // 2433
D=M // 2434
@LCL // 2435
A=M+1 // 2436
M=D // 2437

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE2}}
@LCL // 2438
A=M+1 // 2439
D=M // 2440
@Int32.do_right_shift_bytes$IF_TRUE2 // 2441
D;JNE // 2442

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END2}
// goto Int32.do_right_shift_bytes$IF_END2
@Int32.do_right_shift_bytes$IF_END2 // 2443
0;JMP // 2444

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE2}
// label Int32.do_right_shift_bytes$IF_TRUE2
(Int32.do_right_shift_bytes$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2445
D=M // 2446
@SP // 2447
AM=M+1 // 2448
A=A-1 // 2449
M=D // 2450
// call Int32.do_neg
@6 // 2451
D=A // 2452
@14 // 2453
M=D // 2454
@Int32.do_neg // 2455
D=A // 2456
@13 // 2457
M=D // 2458
@Int32.do_right_shift_bytes.ret.1 // 2459
D=A // 2460
@CALL // 2461
0;JMP // 2462
(Int32.do_right_shift_bytes.ret.1)
@SP // 2463
M=M-1 // 2464

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END2}
// label Int32.do_right_shift_bytes$IF_END2
(Int32.do_right_shift_bytes$IF_END2)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2465
A=M // 2466
M=0 // 2467

////LabelInstruction{label='Int32.do_right_shift_bytes_WHILE_EXP1}
// label Int32.do_right_shift_bytes_WHILE_EXP1
(Int32.do_right_shift_bytes_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes_WHILE_END1}}
@Int32.do_right_shift_bytes.LT.16 // 2468
D=A // 2469
@SP // 2470
AM=M+1 // 2471
A=A-1 // 2472
M=D // 2473
@LCL // 2474
A=M // 2475
D=M // 2476
@4 // 2477
D=D-A // 2478
@DO_LT // 2479
0;JMP // 2480
(Int32.do_right_shift_bytes.LT.16)
D=!D // 2481
@Int32.do_right_shift_bytes_WHILE_END1 // 2482
D;JNE // 2483

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "ADD"
//            ),
//        right:
//            PushInstruction("constant 3"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE3}}
@Int32.do_right_shift_bytes.GT.17 // 2484
D=A // 2485
@SP // 2486
AM=M+1 // 2487
A=A-1 // 2488
M=D // 2489
@LCL // 2490
A=M // 2491
D=M // 2492
@ARG // 2493
A=M+1 // 2494
D=D+M // 2495
@3 // 2496
D=D-A // 2497
@DO_GT // 2498
0;JMP // 2499
(Int32.do_right_shift_bytes.GT.17)
D=!D // 2500
@Int32.do_right_shift_bytes$IF_TRUE3 // 2501
D;JNE // 2502

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_FALSE3}
// goto Int32.do_right_shift_bytes$IF_FALSE3
@Int32.do_right_shift_bytes$IF_FALSE3 // 2503
0;JMP // 2504

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE3}
// label Int32.do_right_shift_bytes$IF_TRUE3
(Int32.do_right_shift_bytes$IF_TRUE3)

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 0"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("argument 1"),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 2505
A=M // 2506
D=M // 2507
@LCL // 2508
A=M // 2509
D=D+M // 2510
@SP // 2511
AM=M+1 // 2512
A=A-1 // 2513
M=D // 2514
@THIS // 2515
A=M // 2516
D=M // 2517
@SP // 2518
AM=M+1 // 2519
A=A-1 // 2520
M=D // 2521
@LCL // 2522
A=M // 2523
D=M // 2524
@ARG // 2525
A=M+1 // 2526
D=D+M // 2527
@SP // 2528
AM=M-1 // 2529
A=D+M // 2530
D=M // 2531
@SP // 2532
AM=M-1 // 2533
A=M // 2534
M=D // 2535

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END3}
// goto Int32.do_right_shift_bytes$IF_END3
@Int32.do_right_shift_bytes$IF_END3 // 2536
0;JMP // 2537

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_FALSE3}
// label Int32.do_right_shift_bytes$IF_FALSE3
(Int32.do_right_shift_bytes$IF_FALSE3)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 2538
A=M // 2539
D=M // 2540
@LCL // 2541
A=M // 2542
D=D+M // 2543
@SP // 2544
AM=M+1 // 2545
A=A-1 // 2546
M=D // 2547
D=0 // 2548
@SP // 2549
AM=M-1 // 2550
A=M // 2551
M=D // 2552

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END3}
// label Int32.do_right_shift_bytes$IF_END3
(Int32.do_right_shift_bytes$IF_END3)

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

@LCL // 2553
A=M // 2554
M=M+1 // 2555

////GotoInstruction{label='Int32.do_right_shift_bytes_WHILE_EXP1}
// goto Int32.do_right_shift_bytes_WHILE_EXP1
@Int32.do_right_shift_bytes_WHILE_EXP1 // 2556
0;JMP // 2557

////LabelInstruction{label='Int32.do_right_shift_bytes_WHILE_END1}
// label Int32.do_right_shift_bytes_WHILE_END1
(Int32.do_right_shift_bytes_WHILE_END1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE4}}
@LCL // 2558
A=M+1 // 2559
D=M // 2560
@Int32.do_right_shift_bytes$IF_TRUE4 // 2561
D;JNE // 2562

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END4}
// goto Int32.do_right_shift_bytes$IF_END4
@Int32.do_right_shift_bytes$IF_END4 // 2563
0;JMP // 2564

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE4}
// label Int32.do_right_shift_bytes$IF_TRUE4
(Int32.do_right_shift_bytes$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2565
D=M // 2566
@SP // 2567
AM=M+1 // 2568
A=A-1 // 2569
M=D // 2570
// call Int32.do_neg
@6 // 2571
D=A // 2572
@14 // 2573
M=D // 2574
@Int32.do_neg // 2575
D=A // 2576
@13 // 2577
M=D // 2578
@Int32.do_right_shift_bytes.ret.2 // 2579
D=A // 2580
@CALL // 2581
0;JMP // 2582
(Int32.do_right_shift_bytes.ret.2)
@SP // 2583
M=M-1 // 2584

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END4}
// label Int32.do_right_shift_bytes$IF_END4
(Int32.do_right_shift_bytes$IF_END4)

////PushInstruction("constant 0")
@SP // 2585
AM=M+1 // 2586
A=A-1 // 2587
M=0 // 2588
@RETURN // 2589
0;JMP // 2590

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.max$IF_TRUE1}}
@Math.max.GT.18 // 2591
D=A // 2592
@SP // 2593
AM=M+1 // 2594
A=A-1 // 2595
M=D // 2596
@ARG // 2597
A=M+1 // 2598
D=M // 2599
A=A-1 // 2600
D=M-D // 2601
@DO_GT // 2602
0;JMP // 2603
(Math.max.GT.18)
@Math.max$IF_TRUE1 // 2604
D;JNE // 2605

////GotoInstruction{label='Math.max$IF_END1}
// goto Math.max$IF_END1
@Math.max$IF_END1 // 2606
0;JMP // 2607

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 2608
A=M // 2609
D=M // 2610
@SP // 2611
AM=M+1 // 2612
A=A-1 // 2613
M=D // 2614
@RETURN // 2615
0;JMP // 2616

////LabelInstruction{label='Math.max$IF_END1}
// label Math.max$IF_END1
(Math.max$IF_END1)

////PushInstruction("argument 1")
@ARG // 2617
A=M+1 // 2618
D=M // 2619
@SP // 2620
AM=M+1 // 2621
A=A-1 // 2622
M=D // 2623
@RETURN // 2624
0;JMP // 2625

////FunctionInstruction{functionName='Number.do_div', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5}}
// function Number.do_div with 0
(Number.do_div)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2626
A=M // 2627
D=M // 2628
@3 // 2629
M=D // 2630

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}},
//    right:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.is_zero}},
//NOT),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Number.do_div$IF_TRUE1}}
@THIS // 2631
A=M // 2632
D=M // 2633
@SP // 2634
AM=M+1 // 2635
A=A-1 // 2636
M=D // 2637
// call Int32.is_zero
@6 // 2638
D=A // 2639
@14 // 2640
M=D // 2641
@Int32.is_zero // 2642
D=A // 2643
@13 // 2644
M=D // 2645
@Number.do_div.ret.0 // 2646
D=A // 2647
@CALL // 2648
0;JMP // 2649
(Number.do_div.ret.0)
@ARG // 2650
A=M+1 // 2651
D=M // 2652
@SP // 2653
AM=M+1 // 2654
A=A-1 // 2655
M=D // 2656
// call Number.is_zero
@6 // 2657
D=A // 2658
@14 // 2659
M=D // 2660
@Number.is_zero // 2661
D=A // 2662
@13 // 2663
M=D // 2664
@Number.do_div.ret.1 // 2665
D=A // 2666
@CALL // 2667
0;JMP // 2668
(Number.do_div.ret.1)
@SP // 2669
AM=M-1 // 2670
D=M // 2671
D=!D // 2672
@SP // 2673
AM=M-1 // 2674
D=D&M // 2675
@Number.do_div$IF_TRUE1 // 2676
D;JNE // 2677

////GotoInstruction{label='Number.do_div$IF_END1}
// goto Number.do_div$IF_END1
@Number.do_div$IF_END1 // 2678
0;JMP // 2679

////LabelInstruction{label='Number.do_div$IF_TRUE1}
// label Number.do_div$IF_TRUE1
(Number.do_div$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_zero}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 2680
A=M // 2681
D=M // 2682
@SP // 2683
AM=M+1 // 2684
A=A-1 // 2685
M=D // 2686
// call Int32.do_zero
@6 // 2687
D=A // 2688
@14 // 2689
M=D // 2690
@Int32.do_zero // 2691
D=A // 2692
@13 // 2693
M=D // 2694
@Number.do_div.ret.2 // 2695
D=A // 2696
@CALL // 2697
0;JMP // 2698
(Number.do_div.ret.2)
@SP // 2699
M=M-1 // 2700

////PushInstruction("constant 0")
@SP // 2701
AM=M+1 // 2702
A=A-1 // 2703
M=0 // 2704
@RETURN // 2705
0;JMP // 2706

////LabelInstruction{label='Number.do_div$IF_END1}
// label Number.do_div$IF_END1
(Number.do_div$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_left_shift_bytes_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 2707
A=M // 2708
D=M // 2709
@SP // 2710
AM=M+1 // 2711
A=A-1 // 2712
M=D // 2713
@2 // 2714
D=A // 2715
@SP // 2716
AM=M+1 // 2717
A=A-1 // 2718
M=D // 2719
@ARG // 2720
A=M+1 // 2721
D=M // 2722
@SP // 2723
AM=M+1 // 2724
A=A-1 // 2725
M=D // 2726
// call Number.getV
@6 // 2727
D=A // 2728
@14 // 2729
M=D // 2730
@Number.getV // 2731
D=A // 2732
@13 // 2733
M=D // 2734
@Number.do_div.ret.3 // 2735
D=A // 2736
@CALL // 2737
0;JMP // 2738
(Number.do_div.ret.3)
// call Int32.do_left_shift_bytes_div
@8 // 2739
D=A // 2740
@14 // 2741
M=D // 2742
@Int32.do_left_shift_bytes_div // 2743
D=A // 2744
@13 // 2745
M=D // 2746
@Number.do_div.ret.4 // 2747
D=A // 2748
@CALL // 2749
0;JMP // 2750
(Number.do_div.ret.4)
@SP // 2751
M=M-1 // 2752

////PushInstruction("constant 0")
@SP // 2753
AM=M+1 // 2754
A=A-1 // 2755
M=0 // 2756
@RETURN // 2757
0;JMP // 2758

////FunctionInstruction{functionName='Int32.do_mul_right_shift_bytes', numLocals=10, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_mul_right_shift_bytes with 10
(Int32.do_mul_right_shift_bytes)
@10 // 2759
D=A // 2760
@SP // 2761
AM=D+M // 2762
A=A-1 // 2763
M=0 // 2764
A=A-1 // 2765
M=0 // 2766
A=A-1 // 2767
M=0 // 2768
A=A-1 // 2769
M=0 // 2770
A=A-1 // 2771
M=0 // 2772
A=A-1 // 2773
M=0 // 2774
A=A-1 // 2775
M=0 // 2776
A=A-1 // 2777
M=0 // 2778
A=A-1 // 2779
M=0 // 2780
A=A-1 // 2781
M=0 // 2782

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2783
A=M // 2784
D=M // 2785
@3 // 2786
M=D // 2787

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.is_negative}}], call=CallInstruction{Int32.xor}}
//  pop:  PopInstruction{address=local 7}
//}

@3 // 2788
D=M // 2789
@SP // 2790
AM=M+1 // 2791
A=A-1 // 2792
M=D // 2793
// call Int32.is_negative
@6 // 2794
D=A // 2795
@14 // 2796
M=D // 2797
@Int32.is_negative // 2798
D=A // 2799
@13 // 2800
M=D // 2801
@Int32.do_mul_right_shift_bytes.ret.0 // 2802
D=A // 2803
@CALL // 2804
0;JMP // 2805
(Int32.do_mul_right_shift_bytes.ret.0)
@ARG // 2806
A=M+1 // 2807
D=M // 2808
@SP // 2809
AM=M+1 // 2810
A=A-1 // 2811
M=D // 2812
// call Int32.is_negative
@6 // 2813
D=A // 2814
@14 // 2815
M=D // 2816
@Int32.is_negative // 2817
D=A // 2818
@13 // 2819
M=D // 2820
@Int32.do_mul_right_shift_bytes.ret.1 // 2821
D=A // 2822
@CALL // 2823
0;JMP // 2824
(Int32.do_mul_right_shift_bytes.ret.1)
// call Int32.xor
@7 // 2825
D=A // 2826
@14 // 2827
M=D // 2828
@Int32.xor // 2829
D=A // 2830
@13 // 2831
M=D // 2832
@Int32.do_mul_right_shift_bytes.ret.2 // 2833
D=A // 2834
@CALL // 2835
0;JMP // 2836
(Int32.do_mul_right_shift_bytes.ret.2)
@LCL // 2837
D=M // 2838
@7 // 2839
A=D+A // 2840
D=A // 2841
@R13 // 2842
M=D // 2843
@SP // 2844
AM=M-1 // 2845
D=M // 2846
@R13 // 2847
A=M // 2848
M=D // 2849

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE1}}
@3 // 2850
D=M // 2851
@SP // 2852
AM=M+1 // 2853
A=A-1 // 2854
M=D // 2855
// call Int32.is_negative
@6 // 2856
D=A // 2857
@14 // 2858
M=D // 2859
@Int32.is_negative // 2860
D=A // 2861
@13 // 2862
M=D // 2863
@Int32.do_mul_right_shift_bytes.ret.3 // 2864
D=A // 2865
@CALL // 2866
0;JMP // 2867
(Int32.do_mul_right_shift_bytes.ret.3)
@SP // 2868
AM=M-1 // 2869
D=M // 2870
@Int32.do_mul_right_shift_bytes$IF_TRUE1 // 2871
D;JNE // 2872

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE1}
// goto Int32.do_mul_right_shift_bytes$IF_FALSE1
@Int32.do_mul_right_shift_bytes$IF_FALSE1 // 2873
0;JMP // 2874

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE1}
// label Int32.do_mul_right_shift_bytes$IF_TRUE1
(Int32.do_mul_right_shift_bytes$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@3 // 2875
D=M // 2876
@SP // 2877
AM=M+1 // 2878
A=A-1 // 2879
M=D // 2880
// call Int32.clone
@6 // 2881
D=A // 2882
@14 // 2883
M=D // 2884
@Int32.clone // 2885
D=A // 2886
@13 // 2887
M=D // 2888
@Int32.do_mul_right_shift_bytes.ret.4 // 2889
D=A // 2890
@CALL // 2891
0;JMP // 2892
(Int32.do_mul_right_shift_bytes.ret.4)
@LCL // 2893
D=M // 2894
@5 // 2895
A=D+A // 2896
D=A // 2897
@R13 // 2898
M=D // 2899
@SP // 2900
AM=M-1 // 2901
D=M // 2902
@R13 // 2903
A=M // 2904
M=D // 2905

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2906
D=M // 2907
@5 // 2908
A=D+A // 2909
D=M // 2910
@SP // 2911
AM=M+1 // 2912
A=A-1 // 2913
M=D // 2914
// call Int32.do_abs
@6 // 2915
D=A // 2916
@14 // 2917
M=D // 2918
@Int32.do_abs // 2919
D=A // 2920
@13 // 2921
M=D // 2922
@Int32.do_mul_right_shift_bytes.ret.5 // 2923
D=A // 2924
@CALL // 2925
0;JMP // 2926
(Int32.do_mul_right_shift_bytes.ret.5)
@SP // 2927
M=M-1 // 2928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2929
D=M // 2930
@5 // 2931
A=D+A // 2932
D=M // 2933
@SP // 2934
AM=M+1 // 2935
A=A-1 // 2936
M=D // 2937
// call Int32.getParts
@6 // 2938
D=A // 2939
@14 // 2940
M=D // 2941
@Int32.getParts // 2942
D=A // 2943
@13 // 2944
M=D // 2945
@Int32.do_mul_right_shift_bytes.ret.6 // 2946
D=A // 2947
@CALL // 2948
0;JMP // 2949
(Int32.do_mul_right_shift_bytes.ret.6)
@SP // 2950
AM=M-1 // 2951
D=M // 2952
@LCL // 2953
A=M // 2954
M=D // 2955

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END1}
// goto Int32.do_mul_right_shift_bytes$IF_END1
@Int32.do_mul_right_shift_bytes$IF_END1 // 2956
0;JMP // 2957

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE1}
// label Int32.do_mul_right_shift_bytes$IF_FALSE1
(Int32.do_mul_right_shift_bytes$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("this 0")
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 2958
A=M // 2959
D=M // 2960
@LCL // 2961
A=M // 2962
M=D // 2963

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END1}
// label Int32.do_mul_right_shift_bytes$IF_END1
(Int32.do_mul_right_shift_bytes$IF_END1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE2}}
@ARG // 2964
A=M+1 // 2965
D=M // 2966
@SP // 2967
AM=M+1 // 2968
A=A-1 // 2969
M=D // 2970
// call Int32.is_negative
@6 // 2971
D=A // 2972
@14 // 2973
M=D // 2974
@Int32.is_negative // 2975
D=A // 2976
@13 // 2977
M=D // 2978
@Int32.do_mul_right_shift_bytes.ret.7 // 2979
D=A // 2980
@CALL // 2981
0;JMP // 2982
(Int32.do_mul_right_shift_bytes.ret.7)
@SP // 2983
AM=M-1 // 2984
D=M // 2985
@Int32.do_mul_right_shift_bytes$IF_TRUE2 // 2986
D;JNE // 2987

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE2}
// goto Int32.do_mul_right_shift_bytes$IF_FALSE2
@Int32.do_mul_right_shift_bytes$IF_FALSE2 // 2988
0;JMP // 2989

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE2}
// label Int32.do_mul_right_shift_bytes$IF_TRUE2
(Int32.do_mul_right_shift_bytes$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@ARG // 2990
A=M+1 // 2991
D=M // 2992
@SP // 2993
AM=M+1 // 2994
A=A-1 // 2995
M=D // 2996
// call Int32.clone
@6 // 2997
D=A // 2998
@14 // 2999
M=D // 3000
@Int32.clone // 3001
D=A // 3002
@13 // 3003
M=D // 3004
@Int32.do_mul_right_shift_bytes.ret.8 // 3005
D=A // 3006
@CALL // 3007
0;JMP // 3008
(Int32.do_mul_right_shift_bytes.ret.8)
@LCL // 3009
D=M // 3010
@6 // 3011
A=D+A // 3012
D=A // 3013
@R13 // 3014
M=D // 3015
@SP // 3016
AM=M-1 // 3017
D=M // 3018
@R13 // 3019
A=M // 3020
M=D // 3021

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3022
D=M // 3023
@6 // 3024
A=D+A // 3025
D=M // 3026
@SP // 3027
AM=M+1 // 3028
A=A-1 // 3029
M=D // 3030
// call Int32.do_abs
@6 // 3031
D=A // 3032
@14 // 3033
M=D // 3034
@Int32.do_abs // 3035
D=A // 3036
@13 // 3037
M=D // 3038
@Int32.do_mul_right_shift_bytes.ret.9 // 3039
D=A // 3040
@CALL // 3041
0;JMP // 3042
(Int32.do_mul_right_shift_bytes.ret.9)
@SP // 3043
M=M-1 // 3044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 3045
D=M // 3046
@6 // 3047
A=D+A // 3048
D=M // 3049
@SP // 3050
AM=M+1 // 3051
A=A-1 // 3052
M=D // 3053
// call Int32.getParts
@6 // 3054
D=A // 3055
@14 // 3056
M=D // 3057
@Int32.getParts // 3058
D=A // 3059
@13 // 3060
M=D // 3061
@Int32.do_mul_right_shift_bytes.ret.10 // 3062
D=A // 3063
@CALL // 3064
0;JMP // 3065
(Int32.do_mul_right_shift_bytes.ret.10)
@SP // 3066
AM=M-1 // 3067
D=M // 3068
@LCL // 3069
A=M+1 // 3070
M=D // 3071

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END2}
// goto Int32.do_mul_right_shift_bytes$IF_END2
@Int32.do_mul_right_shift_bytes$IF_END2 // 3072
0;JMP // 3073

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE2}
// label Int32.do_mul_right_shift_bytes$IF_FALSE2
(Int32.do_mul_right_shift_bytes$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3074
A=M+1 // 3075
D=M // 3076
@SP // 3077
AM=M+1 // 3078
A=A-1 // 3079
M=D // 3080
// call Int32.getParts
@6 // 3081
D=A // 3082
@14 // 3083
M=D // 3084
@Int32.getParts // 3085
D=A // 3086
@13 // 3087
M=D // 3088
@Int32.do_mul_right_shift_bytes.ret.11 // 3089
D=A // 3090
@CALL // 3091
0;JMP // 3092
(Int32.do_mul_right_shift_bytes.ret.11)
@SP // 3093
AM=M-1 // 3094
D=M // 3095
@LCL // 3096
A=M+1 // 3097
M=D // 3098

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END2}
// label Int32.do_mul_right_shift_bytes$IF_END2
(Int32.do_mul_right_shift_bytes$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 2}
//}

@8 // 3099
D=A // 3100
@SP // 3101
AM=M+1 // 3102
A=A-1 // 3103
M=D // 3104
// call Memory.alloc
@6 // 3105
D=A // 3106
@14 // 3107
M=D // 3108
@Memory.alloc // 3109
D=A // 3110
@13 // 3111
M=D // 3112
@Int32.do_mul_right_shift_bytes.ret.12 // 3113
D=A // 3114
@CALL // 3115
0;JMP // 3116
(Int32.do_mul_right_shift_bytes.ret.12)
@SP // 3117
AM=M-1 // 3118
D=M // 3119
@LCL // 3120
A=M+1 // 3121
A=A+1 // 3122
M=D // 3123

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 3}
//}

@8 // 3124
D=A // 3125
@SP // 3126
AM=M+1 // 3127
A=A-1 // 3128
M=D // 3129
// call Memory.alloc
@6 // 3130
D=A // 3131
@14 // 3132
M=D // 3133
@Memory.alloc // 3134
D=A // 3135
@13 // 3136
M=D // 3137
@Int32.do_mul_right_shift_bytes.ret.13 // 3138
D=A // 3139
@CALL // 3140
0;JMP // 3141
(Int32.do_mul_right_shift_bytes.ret.13)
@SP // 3142
AM=M-1 // 3143
D=M // 3144
@LCL // 3145
A=M+1 // 3146
A=A+1 // 3147
A=A+1 // 3148
M=D // 3149

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 3150
D=M // 3151
@8 // 3152
A=D+A // 3153
M=0 // 3154

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP1}
// label Int32.do_mul_right_shift_bytes_WHILE_EXP1
(Int32.do_mul_right_shift_bytes_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 8"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END1}}
@Int32.do_mul_right_shift_bytes.LT.19 // 3155
D=A // 3156
@SP // 3157
AM=M+1 // 3158
A=A-1 // 3159
M=D // 3160
@LCL // 3161
D=M // 3162
@8 // 3163
A=D+A // 3164
D=M // 3165
@4 // 3166
D=D-A // 3167
@DO_LT // 3168
0;JMP // 3169
(Int32.do_mul_right_shift_bytes.LT.19)
D=!D // 3170
@Int32.do_mul_right_shift_bytes_WHILE_END1 // 3171
D;JNE // 3172

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("local 8"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 8"),
//            right:
//                PushInstruction("local 8"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 3173
A=M+1 // 3174
A=A+1 // 3175
D=M // 3176
@SP // 3177
AM=M+1 // 3178
A=A-1 // 3179
M=D // 3180
@LCL // 3181
D=M // 3182
@8 // 3183
A=D+A // 3184
D=M // 3185
D=D+M // 3186
@SP // 3187
AM=M-1 // 3188
D=D+M // 3189
@SP // 3190
AM=M+1 // 3191
A=A-1 // 3192
M=D // 3193
@LCL // 3194
A=M // 3195
D=M // 3196
@SP // 3197
AM=M+1 // 3198
A=A-1 // 3199
M=D // 3200
@LCL // 3201
D=M // 3202
@8 // 3203
A=D+A // 3204
D=M // 3205
@SP // 3206
AM=M-1 // 3207
A=D+M // 3208
D=M // 3209
@15 // 3210
D=D&A // 3211
@SP // 3212
AM=M-1 // 3213
A=M // 3214
M=D // 3215

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("local 8"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        PushInstruction("local 8"),
//                    binaryOp: "ADD"
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 3216
A=M+1 // 3217
A=A+1 // 3218
D=M // 3219
@SP // 3220
AM=M+1 // 3221
A=A-1 // 3222
M=D // 3223
@LCL // 3224
D=M // 3225
@8 // 3226
A=D+A // 3227
D=M // 3228
D=D+M // 3229
D=D+1 // 3230
@SP // 3231
AM=M-1 // 3232
D=D+M // 3233
@SP // 3234
AM=M+1 // 3235
A=A-1 // 3236
M=D // 3237
@LCL // 3238
A=M // 3239
D=M // 3240
@SP // 3241
AM=M+1 // 3242
A=A-1 // 3243
M=D // 3244
@LCL // 3245
D=M // 3246
@8 // 3247
A=D+A // 3248
D=M // 3249
@SP // 3250
AM=M-1 // 3251
A=D+M // 3252
D=M // 3253
@SP // 3254
AM=M+1 // 3255
A=A-1 // 3256
M=D // 3257
@4 // 3258
D=A // 3259
@SP // 3260
AM=M+1 // 3261
A=A-1 // 3262
M=D // 3263
// call Int32.arith_rightshift
@7 // 3264
D=A // 3265
@14 // 3266
M=D // 3267
@Int32.arith_rightshift // 3268
D=A // 3269
@13 // 3270
M=D // 3271
@Int32.do_mul_right_shift_bytes.ret.14 // 3272
D=A // 3273
@CALL // 3274
0;JMP // 3275
(Int32.do_mul_right_shift_bytes.ret.14)
@SP // 3276
AM=M-1 // 3277
D=M // 3278
@SP // 3279
AM=M-1 // 3280
A=M // 3281
M=D // 3282

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("local 8"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 8"),
//            right:
//                PushInstruction("local 8"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 3283
A=M+1 // 3284
A=A+1 // 3285
A=A+1 // 3286
D=M // 3287
@SP // 3288
AM=M+1 // 3289
A=A-1 // 3290
M=D // 3291
@LCL // 3292
D=M // 3293
@8 // 3294
A=D+A // 3295
D=M // 3296
D=D+M // 3297
@SP // 3298
AM=M-1 // 3299
D=D+M // 3300
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=D // 3304
@LCL // 3305
A=M+1 // 3306
D=M // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=D // 3311
@LCL // 3312
D=M // 3313
@8 // 3314
A=D+A // 3315
D=M // 3316
@SP // 3317
AM=M-1 // 3318
A=D+M // 3319
D=M // 3320
@15 // 3321
D=D&A // 3322
@SP // 3323
AM=M-1 // 3324
A=M // 3325
M=D // 3326

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("local 8"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        PushInstruction("local 8"),
//                    binaryOp: "ADD"
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 3327
A=M+1 // 3328
A=A+1 // 3329
A=A+1 // 3330
D=M // 3331
@SP // 3332
AM=M+1 // 3333
A=A-1 // 3334
M=D // 3335
@LCL // 3336
D=M // 3337
@8 // 3338
A=D+A // 3339
D=M // 3340
D=D+M // 3341
D=D+1 // 3342
@SP // 3343
AM=M-1 // 3344
D=D+M // 3345
@SP // 3346
AM=M+1 // 3347
A=A-1 // 3348
M=D // 3349
@LCL // 3350
A=M+1 // 3351
D=M // 3352
@SP // 3353
AM=M+1 // 3354
A=A-1 // 3355
M=D // 3356
@LCL // 3357
D=M // 3358
@8 // 3359
A=D+A // 3360
D=M // 3361
@SP // 3362
AM=M-1 // 3363
A=D+M // 3364
D=M // 3365
@SP // 3366
AM=M+1 // 3367
A=A-1 // 3368
M=D // 3369
@4 // 3370
D=A // 3371
@SP // 3372
AM=M+1 // 3373
A=A-1 // 3374
M=D // 3375
// call Int32.arith_rightshift
@7 // 3376
D=A // 3377
@14 // 3378
M=D // 3379
@Int32.arith_rightshift // 3380
D=A // 3381
@13 // 3382
M=D // 3383
@Int32.do_mul_right_shift_bytes.ret.15 // 3384
D=A // 3385
@CALL // 3386
0;JMP // 3387
(Int32.do_mul_right_shift_bytes.ret.15)
@SP // 3388
AM=M-1 // 3389
D=M // 3390
@SP // 3391
AM=M-1 // 3392
A=M // 3393
M=D // 3394

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

@LCL // 3395
D=M // 3396
@8 // 3397
A=D+A // 3398
M=M+1 // 3399

////GotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP1}
// goto Int32.do_mul_right_shift_bytes_WHILE_EXP1
@Int32.do_mul_right_shift_bytes_WHILE_EXP1 // 3400
0;JMP // 3401

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END1}
// label Int32.do_mul_right_shift_bytes_WHILE_END1
(Int32.do_mul_right_shift_bytes_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 3")], call=CallInstruction{Int32.u4_array_mul_u4_array}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 3402
A=M+1 // 3403
A=A+1 // 3404
D=M // 3405
@SP // 3406
AM=M+1 // 3407
A=A-1 // 3408
M=D // 3409
@LCL // 3410
A=M+1 // 3411
A=A+1 // 3412
A=A+1 // 3413
D=M // 3414
@SP // 3415
AM=M+1 // 3416
A=A-1 // 3417
M=D // 3418
// call Int32.u4_array_mul_u4_array
@7 // 3419
D=A // 3420
@14 // 3421
M=D // 3422
@Int32.u4_array_mul_u4_array // 3423
D=A // 3424
@13 // 3425
M=D // 3426
@Int32.do_mul_right_shift_bytes.ret.16 // 3427
D=A // 3428
@CALL // 3429
0;JMP // 3430
(Int32.do_mul_right_shift_bytes.ret.16)
@LCL // 3431
D=M // 3432
@4 // 3433
A=D+A // 3434
D=A // 3435
@R13 // 3436
M=D // 3437
@SP // 3438
AM=M-1 // 3439
D=M // 3440
@R13 // 3441
A=M // 3442
M=D // 3443

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 9}
//}

@ARG // 3444
A=M+1 // 3445
A=A+1 // 3446
D=M // 3447
D=D+M // 3448
@SP // 3449
AM=M+1 // 3450
A=A-1 // 3451
M=D // 3452
@LCL // 3453
D=M // 3454
@9 // 3455
A=D+A // 3456
D=A // 3457
@R13 // 3458
M=D // 3459
@SP // 3460
AM=M-1 // 3461
D=M // 3462
@R13 // 3463
A=M // 3464
M=D // 3465

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 3466
D=M // 3467
@8 // 3468
A=D+A // 3469
M=0 // 3470

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP2}
// label Int32.do_mul_right_shift_bytes_WHILE_EXP2
(Int32.do_mul_right_shift_bytes_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 8"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END2}}
@Int32.do_mul_right_shift_bytes.LT.20 // 3471
D=A // 3472
@SP // 3473
AM=M+1 // 3474
A=A-1 // 3475
M=D // 3476
@LCL // 3477
D=M // 3478
@8 // 3479
A=D+A // 3480
D=M // 3481
@4 // 3482
D=D-A // 3483
@DO_LT // 3484
0;JMP // 3485
(Int32.do_mul_right_shift_bytes.LT.20)
D=!D // 3486
@Int32.do_mul_right_shift_bytes_WHILE_END2 // 3487
D;JNE // 3488

////PushWriter{source=CallGroup{pushes=[BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 4"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 9"),
//                                    right:
//                                        PushInstruction("local 8"),
//                                    binaryOp: "ADD"
//                                ),
//                            right:
//                                PushInstruction("local 8"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 4"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        BinaryPushGroup(
//                                            left:
//                                                PushInstruction("local 9"),
//                                            right:
//                                                PushInstruction("local 8"),
//                                            binaryOp: "ADD"
//                                        ),
//                                    right:
//                                        PushInstruction("local 8"),
//                                    binaryOp: "ADD"
//                                ),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "ADD"
//), PushInstruction("constant 16")], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 8"),
//    binaryOp: "ADD"
//)}
@THIS // 3489
A=M // 3490
D=M // 3491
@SP // 3492
AM=M+1 // 3493
A=A-1 // 3494
M=D // 3495
@LCL // 3496
D=M // 3497
@8 // 3498
A=D+A // 3499
D=M // 3500
@SP // 3501
AM=M-1 // 3502
D=D+M // 3503
@SP // 3504
AM=M+1 // 3505
A=A-1 // 3506
M=D // 3507
@LCL // 3508
D=M // 3509
@4 // 3510
A=D+A // 3511
D=M // 3512
@SP // 3513
AM=M+1 // 3514
A=A-1 // 3515
M=D // 3516
@LCL // 3517
D=M // 3518
@9 // 3519
A=D+A // 3520
D=M // 3521
A=A-1 // 3522
D=D+M // 3523
@SP // 3524
AM=M+1 // 3525
A=A-1 // 3526
M=D // 3527
@LCL // 3528
D=M // 3529
@8 // 3530
A=D+A // 3531
D=M // 3532
@SP // 3533
AM=M-1 // 3534
D=D+M // 3535
@SP // 3536
AM=M-1 // 3537
A=D+M // 3538
D=M // 3539
@SP // 3540
AM=M+1 // 3541
A=A-1 // 3542
M=D // 3543
@LCL // 3544
D=M // 3545
@4 // 3546
A=D+A // 3547
D=M // 3548
@SP // 3549
AM=M+1 // 3550
A=A-1 // 3551
M=D // 3552
@LCL // 3553
D=M // 3554
@9 // 3555
A=D+A // 3556
D=M // 3557
A=A-1 // 3558
D=D+M // 3559
@SP // 3560
AM=M+1 // 3561
A=A-1 // 3562
M=D // 3563
@LCL // 3564
D=M // 3565
@8 // 3566
A=D+A // 3567
D=M // 3568
@SP // 3569
AM=M-1 // 3570
D=D+M // 3571
D=D+1 // 3572
@SP // 3573
AM=M-1 // 3574
A=D+M // 3575
D=M // 3576
@SP // 3577
AM=M-1 // 3578
D=D+M // 3579
@SP // 3580
AM=M+1 // 3581
A=A-1 // 3582
M=D // 3583
@16 // 3584
D=A // 3585
@SP // 3586
AM=M+1 // 3587
A=A-1 // 3588
M=D // 3589
// call Math.multiply
@7 // 3590
D=A // 3591
@14 // 3592
M=D // 3593
@Math.multiply // 3594
D=A // 3595
@13 // 3596
M=D // 3597
@Int32.do_mul_right_shift_bytes.ret.17 // 3598
D=A // 3599
@CALL // 3600
0;JMP // 3601
(Int32.do_mul_right_shift_bytes.ret.17)
@SP // 3602
AM=M-1 // 3603
D=M // 3604
@SP // 3605
AM=M-1 // 3606
A=M // 3607
M=D // 3608

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

@LCL // 3609
D=M // 3610
@8 // 3611
A=D+A // 3612
M=M+1 // 3613

////GotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP2}
// goto Int32.do_mul_right_shift_bytes_WHILE_EXP2
@Int32.do_mul_right_shift_bytes_WHILE_EXP2 // 3614
0;JMP // 3615

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END2}
// label Int32.do_mul_right_shift_bytes_WHILE_END2
(Int32.do_mul_right_shift_bytes_WHILE_END2)

////ConditionalGroup{push=PushInstruction("local 7"), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE3}}
@LCL // 3616
D=M // 3617
@7 // 3618
A=D+A // 3619
D=M // 3620
@Int32.do_mul_right_shift_bytes$IF_TRUE3 // 3621
D;JNE // 3622

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END3}
// goto Int32.do_mul_right_shift_bytes$IF_END3
@Int32.do_mul_right_shift_bytes$IF_END3 // 3623
0;JMP // 3624

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE3}
// label Int32.do_mul_right_shift_bytes$IF_TRUE3
(Int32.do_mul_right_shift_bytes$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 3625
D=M // 3626
@SP // 3627
AM=M+1 // 3628
A=A-1 // 3629
M=D // 3630
// call Int32.do_neg
@6 // 3631
D=A // 3632
@14 // 3633
M=D // 3634
@Int32.do_neg // 3635
D=A // 3636
@13 // 3637
M=D // 3638
@Int32.do_mul_right_shift_bytes.ret.18 // 3639
D=A // 3640
@CALL // 3641
0;JMP // 3642
(Int32.do_mul_right_shift_bytes.ret.18)
@SP // 3643
M=M-1 // 3644

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END3}
// label Int32.do_mul_right_shift_bytes$IF_END3
(Int32.do_mul_right_shift_bytes$IF_END3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 5"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE4}}
@Int32.do_mul_right_shift_bytes.EQ.21 // 3645
D=A // 3646
@SP // 3647
AM=M+1 // 3648
A=A-1 // 3649
M=D // 3650
@LCL // 3651
D=M // 3652
@5 // 3653
A=D+A // 3654
D=M // 3655
@DO_EQ // 3656
0;JMP // 3657
(Int32.do_mul_right_shift_bytes.EQ.21)
D=!D // 3658
@Int32.do_mul_right_shift_bytes$IF_TRUE4 // 3659
D;JNE // 3660

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END4}
// goto Int32.do_mul_right_shift_bytes$IF_END4
@Int32.do_mul_right_shift_bytes$IF_END4 // 3661
0;JMP // 3662

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE4}
// label Int32.do_mul_right_shift_bytes$IF_TRUE4
(Int32.do_mul_right_shift_bytes$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3663
D=M // 3664
@5 // 3665
A=D+A // 3666
D=M // 3667
@SP // 3668
AM=M+1 // 3669
A=A-1 // 3670
M=D // 3671
// call Int32.dispose
@6 // 3672
D=A // 3673
@14 // 3674
M=D // 3675
@Int32.dispose // 3676
D=A // 3677
@13 // 3678
M=D // 3679
@Int32.do_mul_right_shift_bytes.ret.19 // 3680
D=A // 3681
@CALL // 3682
0;JMP // 3683
(Int32.do_mul_right_shift_bytes.ret.19)
@SP // 3684
M=M-1 // 3685

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END4}
// label Int32.do_mul_right_shift_bytes$IF_END4
(Int32.do_mul_right_shift_bytes$IF_END4)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 6"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE5}}
@Int32.do_mul_right_shift_bytes.EQ.22 // 3686
D=A // 3687
@SP // 3688
AM=M+1 // 3689
A=A-1 // 3690
M=D // 3691
@LCL // 3692
D=M // 3693
@6 // 3694
A=D+A // 3695
D=M // 3696
@DO_EQ // 3697
0;JMP // 3698
(Int32.do_mul_right_shift_bytes.EQ.22)
D=!D // 3699
@Int32.do_mul_right_shift_bytes$IF_TRUE5 // 3700
D;JNE // 3701

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END5}
// goto Int32.do_mul_right_shift_bytes$IF_END5
@Int32.do_mul_right_shift_bytes$IF_END5 // 3702
0;JMP // 3703

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE5}
// label Int32.do_mul_right_shift_bytes$IF_TRUE5
(Int32.do_mul_right_shift_bytes$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3704
D=M // 3705
@6 // 3706
A=D+A // 3707
D=M // 3708
@SP // 3709
AM=M+1 // 3710
A=A-1 // 3711
M=D // 3712
// call Int32.dispose
@6 // 3713
D=A // 3714
@14 // 3715
M=D // 3716
@Int32.dispose // 3717
D=A // 3718
@13 // 3719
M=D // 3720
@Int32.do_mul_right_shift_bytes.ret.20 // 3721
D=A // 3722
@CALL // 3723
0;JMP // 3724
(Int32.do_mul_right_shift_bytes.ret.20)
@SP // 3725
M=M-1 // 3726

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END5}
// label Int32.do_mul_right_shift_bytes$IF_END5
(Int32.do_mul_right_shift_bytes$IF_END5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3727
A=M+1 // 3728
A=A+1 // 3729
D=M // 3730
@SP // 3731
AM=M+1 // 3732
A=A-1 // 3733
M=D // 3734
// call Memory.deAlloc
@6 // 3735
D=A // 3736
@14 // 3737
M=D // 3738
@Memory.deAlloc // 3739
D=A // 3740
@13 // 3741
M=D // 3742
@Int32.do_mul_right_shift_bytes.ret.21 // 3743
D=A // 3744
@CALL // 3745
0;JMP // 3746
(Int32.do_mul_right_shift_bytes.ret.21)
@SP // 3747
M=M-1 // 3748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3749
A=M+1 // 3750
A=A+1 // 3751
A=A+1 // 3752
D=M // 3753
@SP // 3754
AM=M+1 // 3755
A=A-1 // 3756
M=D // 3757
// call Memory.deAlloc
@6 // 3758
D=A // 3759
@14 // 3760
M=D // 3761
@Memory.deAlloc // 3762
D=A // 3763
@13 // 3764
M=D // 3765
@Int32.do_mul_right_shift_bytes.ret.22 // 3766
D=A // 3767
@CALL // 3768
0;JMP // 3769
(Int32.do_mul_right_shift_bytes.ret.22)
@SP // 3770
M=M-1 // 3771

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3772
D=M // 3773
@4 // 3774
A=D+A // 3775
D=M // 3776
@SP // 3777
AM=M+1 // 3778
A=A-1 // 3779
M=D // 3780
// call Memory.deAlloc
@6 // 3781
D=A // 3782
@14 // 3783
M=D // 3784
@Memory.deAlloc // 3785
D=A // 3786
@13 // 3787
M=D // 3788
@Int32.do_mul_right_shift_bytes.ret.23 // 3789
D=A // 3790
@CALL // 3791
0;JMP // 3792
(Int32.do_mul_right_shift_bytes.ret.23)
@SP // 3793
M=M-1 // 3794

////PushInstruction("constant 0")
@SP // 3795
AM=M+1 // 3796
A=A-1 // 3797
M=0 // 3798
@RETURN // 3799
0;JMP // 3800

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 3801
@Sys.halt_WHILE_END1 // 3802
D;JNE // 3803

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 3804
0;JMP // 3805

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3806
AM=M+1 // 3807
A=A-1 // 3808
M=0 // 3809
@RETURN // 3810
0;JMP // 3811

////FunctionInstruction{functionName='Vec3.clone', numLocals=0, funcMapping={Vec3.do_add=6}}
// function Vec3.clone with 0
(Vec3.clone)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3812
A=M // 3813
D=M // 3814
@3 // 3815
M=D // 3816

////CallGroup{pushes=[CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}, CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}, CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}], call=CallInstruction{Vec3.new}}
@THIS // 3817
A=M // 3818
D=M // 3819
@SP // 3820
AM=M+1 // 3821
A=A-1 // 3822
M=D // 3823
// call Number.clone
@6 // 3824
D=A // 3825
@14 // 3826
M=D // 3827
@Number.clone // 3828
D=A // 3829
@13 // 3830
M=D // 3831
@Vec3.clone.ret.0 // 3832
D=A // 3833
@CALL // 3834
0;JMP // 3835
(Vec3.clone.ret.0)
@THIS // 3836
A=M+1 // 3837
D=M // 3838
@SP // 3839
AM=M+1 // 3840
A=A-1 // 3841
M=D // 3842
// call Number.clone
@6 // 3843
D=A // 3844
@14 // 3845
M=D // 3846
@Number.clone // 3847
D=A // 3848
@13 // 3849
M=D // 3850
@Vec3.clone.ret.1 // 3851
D=A // 3852
@CALL // 3853
0;JMP // 3854
(Vec3.clone.ret.1)
@THIS // 3855
A=M+1 // 3856
A=A+1 // 3857
D=M // 3858
@SP // 3859
AM=M+1 // 3860
A=A-1 // 3861
M=D // 3862
// call Number.clone
@6 // 3863
D=A // 3864
@14 // 3865
M=D // 3866
@Number.clone // 3867
D=A // 3868
@13 // 3869
M=D // 3870
@Vec3.clone.ret.2 // 3871
D=A // 3872
@CALL // 3873
0;JMP // 3874
(Vec3.clone.ret.2)
// call Vec3.new
@8 // 3875
D=A // 3876
@14 // 3877
M=D // 3878
@Vec3.new // 3879
D=A // 3880
@13 // 3881
M=D // 3882
@Vec3.clone.ret.3 // 3883
D=A // 3884
@CALL // 3885
0;JMP // 3886
(Vec3.clone.ret.3)
@RETURN // 3887
0;JMP // 3888

////FunctionInstruction{functionName='Element.color', numLocals=0, funcMapping={}}
// function Element.color with 0
(Element.color)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3889
A=M // 3890
D=M // 3891
@3 // 3892
M=D // 3893

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.color$IF_TRUE1}}
@THIS // 3894
A=M // 3895
D=M // 3896
@Element.color$IF_TRUE1 // 3897
D;JNE // 3898

////GotoInstruction{label='Element.color$IF_END1}
// goto Element.color$IF_END1
@Element.color$IF_END1 // 3899
0;JMP // 3900

////LabelInstruction{label='Element.color$IF_TRUE1}
// label Element.color$IF_TRUE1
(Element.color$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Plane.color}}
@THIS // 3901
A=M // 3902
D=M // 3903
@SP // 3904
AM=M+1 // 3905
A=A-1 // 3906
M=D // 3907
@ARG // 3908
A=M+1 // 3909
D=M // 3910
@SP // 3911
AM=M+1 // 3912
A=A-1 // 3913
M=D // 3914
// call Plane.color
@7 // 3915
D=A // 3916
@14 // 3917
M=D // 3918
@Plane.color // 3919
D=A // 3920
@13 // 3921
M=D // 3922
@Element.color.ret.0 // 3923
D=A // 3924
@CALL // 3925
0;JMP // 3926
(Element.color.ret.0)
@RETURN // 3927
0;JMP // 3928

////LabelInstruction{label='Element.color$IF_END1}
// label Element.color$IF_END1
(Element.color$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.color$IF_TRUE2}}
@THIS // 3929
A=M+1 // 3930
D=M // 3931
@Element.color$IF_TRUE2 // 3932
D;JNE // 3933

////GotoInstruction{label='Element.color$IF_END2}
// goto Element.color$IF_END2
@Element.color$IF_END2 // 3934
0;JMP // 3935

////LabelInstruction{label='Element.color$IF_TRUE2}
// label Element.color$IF_TRUE2
(Element.color$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Sphere.color}}
@THIS // 3936
A=M+1 // 3937
D=M // 3938
@SP // 3939
AM=M+1 // 3940
A=A-1 // 3941
M=D // 3942
// call Sphere.color
@6 // 3943
D=A // 3944
@14 // 3945
M=D // 3946
@Sphere.color // 3947
D=A // 3948
@13 // 3949
M=D // 3950
@Element.color.ret.1 // 3951
D=A // 3952
@CALL // 3953
0;JMP // 3954
(Element.color.ret.1)
@RETURN // 3955
0;JMP // 3956

////LabelInstruction{label='Element.color$IF_END2}
// label Element.color$IF_END2
(Element.color$IF_END2)

////PushInstruction("constant 0")
@SP // 3957
AM=M+1 // 3958
A=A-1 // 3959
M=0 // 3960
@RETURN // 3961
0;JMP // 3962

////FunctionInstruction{functionName='Number.do_neg', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5}}
// function Number.do_neg with 0
(Number.do_neg)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3963
A=M // 3964
D=M // 3965
@3 // 3966
M=D // 3967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 3968
A=M // 3969
D=M // 3970
@SP // 3971
AM=M+1 // 3972
A=A-1 // 3973
M=D // 3974
// call Int32.do_neg
@6 // 3975
D=A // 3976
@14 // 3977
M=D // 3978
@Int32.do_neg // 3979
D=A // 3980
@13 // 3981
M=D // 3982
@Number.do_neg.ret.0 // 3983
D=A // 3984
@CALL // 3985
0;JMP // 3986
(Number.do_neg.ret.0)
@SP // 3987
M=M-1 // 3988

////PushInstruction("constant 0")
@SP // 3989
AM=M+1 // 3990
A=A-1 // 3991
M=0 // 3992
@RETURN // 3993
0;JMP // 3994

////FunctionInstruction{functionName='Plane.color', numLocals=8, funcMapping={Plane.initialize=16, Plane.new=1}}
// function Plane.color with 8
(Plane.color)
@8 // 3995
D=A // 3996
@SP // 3997
AM=D+M // 3998
A=A-1 // 3999
M=0 // 4000
A=A-1 // 4001
M=0 // 4002
A=A-1 // 4003
M=0 // 4004
A=A-1 // 4005
M=0 // 4006
A=A-1 // 4007
M=0 // 4008
A=A-1 // 4009
M=0 // 4010
A=A-1 // 4011
M=0 // 4012
A=A-1 // 4013
M=0 // 4014

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 4015
A=M // 4016
D=M // 4017
@3 // 4018
M=D // 4019

////ConditionalGroup{push=PushInstruction("this 3"), ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE1}}
@THIS // 4020
A=M+1 // 4021
A=A+1 // 4022
A=A+1 // 4023
D=M // 4024
@Plane.color$IF_TRUE1 // 4025
D;JNE // 4026

////GotoInstruction{label='Plane.color$IF_FALSE1}
// goto Plane.color$IF_FALSE1
@Plane.color$IF_FALSE1 // 4027
0;JMP // 4028

////LabelInstruction{label='Plane.color$IF_TRUE1}
// label Plane.color$IF_TRUE1
(Plane.color$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 4029
A=M+1 // 4030
D=M // 4031
@SP // 4032
AM=M+1 // 4033
A=A-1 // 4034
M=D // 4035
// call Vec3.clone
@6 // 4036
D=A // 4037
@14 // 4038
M=D // 4039
@Vec3.clone // 4040
D=A // 4041
@13 // 4042
M=D // 4043
@Plane.color.ret.0 // 4044
D=A // 4045
@CALL // 4046
0;JMP // 4047
(Plane.color.ret.0)
@SP // 4048
AM=M-1 // 4049
D=M // 4050
@LCL // 4051
A=M // 4052
M=D // 4053

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("static 0")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4054
A=M // 4055
D=M // 4056
@SP // 4057
AM=M+1 // 4058
A=A-1 // 4059
M=D // 4060
@Plane.0 // 4061
D=M // 4062
@SP // 4063
AM=M+1 // 4064
A=A-1 // 4065
M=D // 4066
// call Vec3.do_cross
@7 // 4067
D=A // 4068
@14 // 4069
M=D // 4070
@Vec3.do_cross // 4071
D=A // 4072
@13 // 4073
M=D // 4074
@Plane.color.ret.1 // 4075
D=A // 4076
@CALL // 4077
0;JMP // 4078
(Plane.color.ret.1)
@SP // 4079
M=M-1 // 4080

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dist_sq}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4081
A=M // 4082
D=M // 4083
@SP // 4084
AM=M+1 // 4085
A=A-1 // 4086
M=D // 4087
// call Vec3.dist_sq
@6 // 4088
D=A // 4089
@14 // 4090
M=D // 4091
@Vec3.dist_sq // 4092
D=A // 4093
@13 // 4094
M=D // 4095
@Plane.color.ret.2 // 4096
D=A // 4097
@CALL // 4098
0;JMP // 4099
(Plane.color.ret.2)
@SP // 4100
AM=M-1 // 4101
D=M // 4102
@LCL // 4103
A=M+1 // 4104
A=A+1 // 4105
M=D // 4106

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.is_zero}}, ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE2}}
@LCL // 4107
A=M+1 // 4108
A=A+1 // 4109
D=M // 4110
@SP // 4111
AM=M+1 // 4112
A=A-1 // 4113
M=D // 4114
// call Number.is_zero
@6 // 4115
D=A // 4116
@14 // 4117
M=D // 4118
@Number.is_zero // 4119
D=A // 4120
@13 // 4121
M=D // 4122
@Plane.color.ret.3 // 4123
D=A // 4124
@CALL // 4125
0;JMP // 4126
(Plane.color.ret.3)
@SP // 4127
AM=M-1 // 4128
D=M // 4129
@Plane.color$IF_TRUE2 // 4130
D;JNE // 4131

////GotoInstruction{label='Plane.color$IF_END2}
// goto Plane.color$IF_END2
@Plane.color$IF_END2 // 4132
0;JMP // 4133

////LabelInstruction{label='Plane.color$IF_TRUE2}
// label Plane.color$IF_TRUE2
(Plane.color$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4134
A=M // 4135
D=M // 4136
@SP // 4137
AM=M+1 // 4138
A=A-1 // 4139
M=D // 4140
// call Vec3.dispose
@6 // 4141
D=A // 4142
@14 // 4143
M=D // 4144
@Vec3.dispose // 4145
D=A // 4146
@13 // 4147
M=D // 4148
@Plane.color.ret.4 // 4149
D=A // 4150
@CALL // 4151
0;JMP // 4152
(Plane.color.ret.4)
@SP // 4153
M=M-1 // 4154

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 4155
A=M+1 // 4156
D=M // 4157
@SP // 4158
AM=M+1 // 4159
A=A-1 // 4160
M=D // 4161
// call Vec3.clone
@6 // 4162
D=A // 4163
@14 // 4164
M=D // 4165
@Vec3.clone // 4166
D=A // 4167
@13 // 4168
M=D // 4169
@Plane.color.ret.5 // 4170
D=A // 4171
@CALL // 4172
0;JMP // 4173
(Plane.color.ret.5)
@SP // 4174
AM=M-1 // 4175
D=M // 4176
@LCL // 4177
A=M // 4178
M=D // 4179

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("static 1")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4180
A=M // 4181
D=M // 4182
@SP // 4183
AM=M+1 // 4184
A=A-1 // 4185
M=D // 4186
@Plane.1 // 4187
D=M // 4188
@SP // 4189
AM=M+1 // 4190
A=A-1 // 4191
M=D // 4192
// call Vec3.do_cross
@7 // 4193
D=A // 4194
@14 // 4195
M=D // 4196
@Vec3.do_cross // 4197
D=A // 4198
@13 // 4199
M=D // 4200
@Plane.color.ret.6 // 4201
D=A // 4202
@CALL // 4203
0;JMP // 4204
(Plane.color.ret.6)
@SP // 4205
M=M-1 // 4206

////LabelInstruction{label='Plane.color$IF_END2}
// label Plane.color$IF_END2
(Plane.color$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 4207
A=M+1 // 4208
D=M // 4209
@SP // 4210
AM=M+1 // 4211
A=A-1 // 4212
M=D // 4213
// call Vec3.clone
@6 // 4214
D=A // 4215
@14 // 4216
M=D // 4217
@Vec3.clone // 4218
D=A // 4219
@13 // 4220
M=D // 4221
@Plane.color.ret.7 // 4222
D=A // 4223
@CALL // 4224
0;JMP // 4225
(Plane.color.ret.7)
@SP // 4226
AM=M-1 // 4227
D=M // 4228
@LCL // 4229
A=M+1 // 4230
M=D // 4231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4232
A=M+1 // 4233
D=M // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=D // 4238
@LCL // 4239
A=M // 4240
D=M // 4241
@SP // 4242
AM=M+1 // 4243
A=A-1 // 4244
M=D // 4245
// call Vec3.do_cross
@7 // 4246
D=A // 4247
@14 // 4248
M=D // 4249
@Vec3.do_cross // 4250
D=A // 4251
@13 // 4252
M=D // 4253
@Plane.color.ret.8 // 4254
D=A // 4255
@CALL // 4256
0;JMP // 4257
(Plane.color.ret.8)
@SP // 4258
M=M-1 // 4259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 4260
A=M+1 // 4261
D=M // 4262
@SP // 4263
AM=M+1 // 4264
A=A-1 // 4265
M=D // 4266
@LCL // 4267
A=M // 4268
D=M // 4269
@SP // 4270
AM=M+1 // 4271
A=A-1 // 4272
M=D // 4273
// call Vec3.dot
@7 // 4274
D=A // 4275
@14 // 4276
M=D // 4277
@Vec3.dot // 4278
D=A // 4279
@13 // 4280
M=D // 4281
@Plane.color.ret.9 // 4282
D=A // 4283
@CALL // 4284
0;JMP // 4285
(Plane.color.ret.9)
@SP // 4286
AM=M-1 // 4287
D=M // 4288
@LCL // 4289
A=M+1 // 4290
A=A+1 // 4291
A=A+1 // 4292
M=D // 4293

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 3")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4294
A=M+1 // 4295
A=A+1 // 4296
A=A+1 // 4297
D=M // 4298
@SP // 4299
AM=M+1 // 4300
A=A-1 // 4301
M=D // 4302
@Plane.3 // 4303
D=M // 4304
@SP // 4305
AM=M+1 // 4306
A=A-1 // 4307
M=D // 4308
// call Number.do_mul
@7 // 4309
D=A // 4310
@14 // 4311
M=D // 4312
@Number.do_mul // 4313
D=A // 4314
@13 // 4315
M=D // 4316
@Plane.color.ret.10 // 4317
D=A // 4318
@CALL // 4319
0;JMP // 4320
(Plane.color.ret.10)
@SP // 4321
M=M-1 // 4322

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4323
A=M+1 // 4324
A=A+1 // 4325
A=A+1 // 4326
D=M // 4327
@SP // 4328
AM=M+1 // 4329
A=A-1 // 4330
M=D // 4331
@Plane.2 // 4332
D=M // 4333
@SP // 4334
AM=M+1 // 4335
A=A-1 // 4336
M=D // 4337
// call Number.do_add
@7 // 4338
D=A // 4339
@14 // 4340
M=D // 4341
@Number.do_add // 4342
D=A // 4343
@13 // 4344
M=D // 4345
@Plane.color.ret.11 // 4346
D=A // 4347
@CALL // 4348
0;JMP // 4349
(Plane.color.ret.11)
@SP // 4350
M=M-1 // 4351

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.to_int32}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 4352
A=M+1 // 4353
A=A+1 // 4354
A=A+1 // 4355
D=M // 4356
@SP // 4357
AM=M+1 // 4358
A=A-1 // 4359
M=D // 4360
// call Number.to_int32
@6 // 4361
D=A // 4362
@14 // 4363
M=D // 4364
@Number.to_int32 // 4365
D=A // 4366
@13 // 4367
M=D // 4368
@Plane.color.ret.12 // 4369
D=A // 4370
@CALL // 4371
0;JMP // 4372
(Plane.color.ret.12)
@LCL // 4373
D=M // 4374
@4 // 4375
A=D+A // 4376
D=A // 4377
@R13 // 4378
M=D // 4379
@SP // 4380
AM=M-1 // 4381
D=M // 4382
@R13 // 4383
A=M // 4384
M=D // 4385

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("local 1")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 4386
A=M+1 // 4387
D=M // 4388
@SP // 4389
AM=M+1 // 4390
A=A-1 // 4391
M=D // 4392
@LCL // 4393
A=M+1 // 4394
D=M // 4395
@SP // 4396
AM=M+1 // 4397
A=A-1 // 4398
M=D // 4399
// call Vec3.dot
@7 // 4400
D=A // 4401
@14 // 4402
M=D // 4403
@Vec3.dot // 4404
D=A // 4405
@13 // 4406
M=D // 4407
@Plane.color.ret.13 // 4408
D=A // 4409
@CALL // 4410
0;JMP // 4411
(Plane.color.ret.13)
@SP // 4412
AM=M-1 // 4413
D=M // 4414
@LCL // 4415
A=M+1 // 4416
A=A+1 // 4417
A=A+1 // 4418
M=D // 4419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 3")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4420
A=M+1 // 4421
A=A+1 // 4422
A=A+1 // 4423
D=M // 4424
@SP // 4425
AM=M+1 // 4426
A=A-1 // 4427
M=D // 4428
@Plane.3 // 4429
D=M // 4430
@SP // 4431
AM=M+1 // 4432
A=A-1 // 4433
M=D // 4434
// call Number.do_mul
@7 // 4435
D=A // 4436
@14 // 4437
M=D // 4438
@Number.do_mul // 4439
D=A // 4440
@13 // 4441
M=D // 4442
@Plane.color.ret.14 // 4443
D=A // 4444
@CALL // 4445
0;JMP // 4446
(Plane.color.ret.14)
@SP // 4447
M=M-1 // 4448

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4449
A=M+1 // 4450
A=A+1 // 4451
A=A+1 // 4452
D=M // 4453
@SP // 4454
AM=M+1 // 4455
A=A-1 // 4456
M=D // 4457
@Plane.2 // 4458
D=M // 4459
@SP // 4460
AM=M+1 // 4461
A=A-1 // 4462
M=D // 4463
// call Number.do_add
@7 // 4464
D=A // 4465
@14 // 4466
M=D // 4467
@Number.do_add // 4468
D=A // 4469
@13 // 4470
M=D // 4471
@Plane.color.ret.15 // 4472
D=A // 4473
@CALL // 4474
0;JMP // 4475
(Plane.color.ret.15)
@SP // 4476
M=M-1 // 4477

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.to_int32}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 4478
A=M+1 // 4479
A=A+1 // 4480
A=A+1 // 4481
D=M // 4482
@SP // 4483
AM=M+1 // 4484
A=A-1 // 4485
M=D // 4486
// call Number.to_int32
@6 // 4487
D=A // 4488
@14 // 4489
M=D // 4490
@Number.to_int32 // 4491
D=A // 4492
@13 // 4493
M=D // 4494
@Plane.color.ret.16 // 4495
D=A // 4496
@CALL // 4497
0;JMP // 4498
(Plane.color.ret.16)
@LCL // 4499
D=M // 4500
@5 // 4501
A=D+A // 4502
D=A // 4503
@R13 // 4504
M=D // 4505
@SP // 4506
AM=M-1 // 4507
D=M // 4508
@R13 // 4509
A=M // 4510
M=D // 4511

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 4512
D=M // 4513
@4 // 4514
A=D+A // 4515
D=M // 4516
@SP // 4517
AM=M+1 // 4518
A=A-1 // 4519
M=D // 4520
// call Int32.clone
@6 // 4521
D=A // 4522
@14 // 4523
M=D // 4524
@Int32.clone // 4525
D=A // 4526
@13 // 4527
M=D // 4528
@Plane.color.ret.17 // 4529
D=A // 4530
@CALL // 4531
0;JMP // 4532
(Plane.color.ret.17)
@LCL // 4533
D=M // 4534
@6 // 4535
A=D+A // 4536
D=A // 4537
@R13 // 4538
M=D // 4539
@SP // 4540
AM=M-1 // 4541
D=M // 4542
@R13 // 4543
A=M // 4544
M=D // 4545

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 5")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4546
D=M // 4547
@6 // 4548
A=D+A // 4549
D=M // 4550
@SP // 4551
AM=M+1 // 4552
A=A-1 // 4553
M=D // 4554
@LCL // 4555
D=M // 4556
@5 // 4557
A=D+A // 4558
D=M // 4559
@SP // 4560
AM=M+1 // 4561
A=A-1 // 4562
M=D // 4563
// call Int32.do_add
@7 // 4564
D=A // 4565
@14 // 4566
M=D // 4567
@Int32.do_add // 4568
D=A // 4569
@13 // 4570
M=D // 4571
@Plane.color.ret.18 // 4572
D=A // 4573
@CALL // 4574
0;JMP // 4575
(Plane.color.ret.18)
@SP // 4576
M=M-1 // 4577

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.is_even}}, ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE3}}
@LCL // 4578
D=M // 4579
@6 // 4580
A=D+A // 4581
D=M // 4582
@SP // 4583
AM=M+1 // 4584
A=A-1 // 4585
M=D // 4586
// call Int32.is_even
@6 // 4587
D=A // 4588
@14 // 4589
M=D // 4590
@Int32.is_even // 4591
D=A // 4592
@13 // 4593
M=D // 4594
@Plane.color.ret.19 // 4595
D=A // 4596
@CALL // 4597
0;JMP // 4598
(Plane.color.ret.19)
@SP // 4599
AM=M-1 // 4600
D=M // 4601
@Plane.color$IF_TRUE3 // 4602
D;JNE // 4603

////GotoInstruction{label='Plane.color$IF_FALSE3}
// goto Plane.color$IF_FALSE3
@Plane.color$IF_FALSE3 // 4604
0;JMP // 4605

////LabelInstruction{label='Plane.color$IF_TRUE3}
// label Plane.color$IF_TRUE3
(Plane.color$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 4")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@Plane.4 // 4606
D=M // 4607
@SP // 4608
AM=M+1 // 4609
A=A-1 // 4610
M=D // 4611
// call Number.clone
@6 // 4612
D=A // 4613
@14 // 4614
M=D // 4615
@Number.clone // 4616
D=A // 4617
@13 // 4618
M=D // 4619
@Plane.color.ret.20 // 4620
D=A // 4621
@CALL // 4622
0;JMP // 4623
(Plane.color.ret.20)
@LCL // 4624
D=M // 4625
@7 // 4626
A=D+A // 4627
D=A // 4628
@R13 // 4629
M=D // 4630
@SP // 4631
AM=M-1 // 4632
D=M // 4633
@R13 // 4634
A=M // 4635
M=D // 4636

////GotoInstruction{label='Plane.color$IF_END3}
// goto Plane.color$IF_END3
@Plane.color$IF_END3 // 4637
0;JMP // 4638

////LabelInstruction{label='Plane.color$IF_FALSE3}
// label Plane.color$IF_FALSE3
(Plane.color$IF_FALSE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 5")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@Plane.5 // 4639
D=M // 4640
@SP // 4641
AM=M+1 // 4642
A=A-1 // 4643
M=D // 4644
// call Number.clone
@6 // 4645
D=A // 4646
@14 // 4647
M=D // 4648
@Number.clone // 4649
D=A // 4650
@13 // 4651
M=D // 4652
@Plane.color.ret.21 // 4653
D=A // 4654
@CALL // 4655
0;JMP // 4656
(Plane.color.ret.21)
@LCL // 4657
D=M // 4658
@7 // 4659
A=D+A // 4660
D=A // 4661
@R13 // 4662
M=D // 4663
@SP // 4664
AM=M-1 // 4665
D=M // 4666
@R13 // 4667
A=M // 4668
M=D // 4669

////LabelInstruction{label='Plane.color$IF_END3}
// label Plane.color$IF_END3
(Plane.color$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4670
A=M // 4671
D=M // 4672
@SP // 4673
AM=M+1 // 4674
A=A-1 // 4675
M=D // 4676
// call Vec3.dispose
@6 // 4677
D=A // 4678
@14 // 4679
M=D // 4680
@Vec3.dispose // 4681
D=A // 4682
@13 // 4683
M=D // 4684
@Plane.color.ret.22 // 4685
D=A // 4686
@CALL // 4687
0;JMP // 4688
(Plane.color.ret.22)
@SP // 4689
M=M-1 // 4690

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4691
A=M+1 // 4692
D=M // 4693
@SP // 4694
AM=M+1 // 4695
A=A-1 // 4696
M=D // 4697
// call Vec3.dispose
@6 // 4698
D=A // 4699
@14 // 4700
M=D // 4701
@Vec3.dispose // 4702
D=A // 4703
@13 // 4704
M=D // 4705
@Plane.color.ret.23 // 4706
D=A // 4707
@CALL // 4708
0;JMP // 4709
(Plane.color.ret.23)
@SP // 4710
M=M-1 // 4711

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4712
A=M+1 // 4713
A=A+1 // 4714
D=M // 4715
@SP // 4716
AM=M+1 // 4717
A=A-1 // 4718
M=D // 4719
// call Number.dispose
@6 // 4720
D=A // 4721
@14 // 4722
M=D // 4723
@Number.dispose // 4724
D=A // 4725
@13 // 4726
M=D // 4727
@Plane.color.ret.24 // 4728
D=A // 4729
@CALL // 4730
0;JMP // 4731
(Plane.color.ret.24)
@SP // 4732
M=M-1 // 4733

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4734
D=M // 4735
@4 // 4736
A=D+A // 4737
D=M // 4738
@SP // 4739
AM=M+1 // 4740
A=A-1 // 4741
M=D // 4742
// call Int32.dispose
@6 // 4743
D=A // 4744
@14 // 4745
M=D // 4746
@Int32.dispose // 4747
D=A // 4748
@13 // 4749
M=D // 4750
@Plane.color.ret.25 // 4751
D=A // 4752
@CALL // 4753
0;JMP // 4754
(Plane.color.ret.25)
@SP // 4755
M=M-1 // 4756

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4757
D=M // 4758
@5 // 4759
A=D+A // 4760
D=M // 4761
@SP // 4762
AM=M+1 // 4763
A=A-1 // 4764
M=D // 4765
// call Int32.dispose
@6 // 4766
D=A // 4767
@14 // 4768
M=D // 4769
@Int32.dispose // 4770
D=A // 4771
@13 // 4772
M=D // 4773
@Plane.color.ret.26 // 4774
D=A // 4775
@CALL // 4776
0;JMP // 4777
(Plane.color.ret.26)
@SP // 4778
M=M-1 // 4779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4780
D=M // 4781
@6 // 4782
A=D+A // 4783
D=M // 4784
@SP // 4785
AM=M+1 // 4786
A=A-1 // 4787
M=D // 4788
// call Int32.dispose
@6 // 4789
D=A // 4790
@14 // 4791
M=D // 4792
@Int32.dispose // 4793
D=A // 4794
@13 // 4795
M=D // 4796
@Plane.color.ret.27 // 4797
D=A // 4798
@CALL // 4799
0;JMP // 4800
(Plane.color.ret.27)
@SP // 4801
M=M-1 // 4802

////PushInstruction("local 7")
@LCL // 4803
D=M // 4804
@7 // 4805
A=D+A // 4806
D=M // 4807
@SP // 4808
AM=M+1 // 4809
A=A-1 // 4810
M=D // 4811
@RETURN // 4812
0;JMP // 4813

////GotoInstruction{label='Plane.color$IF_END1}
// goto Plane.color$IF_END1
@Plane.color$IF_END1 // 4814
0;JMP // 4815

////LabelInstruction{label='Plane.color$IF_FALSE1}
// label Plane.color$IF_FALSE1
(Plane.color$IF_FALSE1)

////CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
@THIS // 4816
A=M+1 // 4817
A=A+1 // 4818
D=M // 4819
@SP // 4820
AM=M+1 // 4821
A=A-1 // 4822
M=D // 4823
// call Number.clone
@6 // 4824
D=A // 4825
@14 // 4826
M=D // 4827
@Number.clone // 4828
D=A // 4829
@13 // 4830
M=D // 4831
@Plane.color.ret.28 // 4832
D=A // 4833
@CALL // 4834
0;JMP // 4835
(Plane.color.ret.28)
@RETURN // 4836
0;JMP // 4837

////LabelInstruction{label='Plane.color$IF_END1}
// label Plane.color$IF_END1
(Plane.color$IF_END1)

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.getMap=0, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 4838
AM=M+1 // 4839
A=A-1 // 4840
M=0 // 4841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4842
D=A // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847
// call Memory.alloc
@6 // 4848
D=A // 4849
@14 // 4850
M=D // 4851
@Memory.alloc // 4852
D=A // 4853
@13 // 4854
M=D // 4855
@Output.init.ret.0 // 4856
D=A // 4857
@CALL // 4858
0;JMP // 4859
(Output.init.ret.0)
@SP // 4860
AM=M-1 // 4861
D=M // 4862
@Output.0 // 4863
M=D // 4864

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4865
D=A // 4866
@SP // 4867
M=D+M // 4868
@63 // 4869
D=A // 4870
@SP // 4871
A=M-1 // 4872
M=0 // 4873
A=A-1 // 4874
M=0 // 4875
A=A-1 // 4876
M=D // 4877
A=A-1 // 4878
M=D // 4879
A=A-1 // 4880
M=D // 4881
A=A-1 // 4882
M=D // 4883
A=A-1 // 4884
M=D // 4885
A=A-1 // 4886
M=D // 4887
A=A-1 // 4888
M=D // 4889
A=A-1 // 4890
M=D // 4891
A=A-1 // 4892
M=D // 4893
A=A-1 // 4894
M=0 // 4895
// call Output.create
@17 // 4896
D=A // 4897
@14 // 4898
M=D // 4899
@Output.create // 4900
D=A // 4901
@13 // 4902
M=D // 4903
@Output.init.ret.1 // 4904
D=A // 4905
@CALL // 4906
0;JMP // 4907
(Output.init.ret.1)
@SP // 4908
M=M-1 // 4909

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4910
D=A // 4911
@SP // 4912
M=D+M // 4913
@32 // 4914
D=A // 4915
@SP // 4916
A=M-1 // 4917
M=0 // 4918
A=A-1 // 4919
M=0 // 4920
A=A-1 // 4921
M=0 // 4922
A=A-1 // 4923
M=0 // 4924
A=A-1 // 4925
M=0 // 4926
A=A-1 // 4927
M=0 // 4928
A=A-1 // 4929
M=0 // 4930
A=A-1 // 4931
M=0 // 4932
A=A-1 // 4933
M=0 // 4934
A=A-1 // 4935
M=0 // 4936
A=A-1 // 4937
M=0 // 4938
A=A-1 // 4939
M=D // 4940
A=A-1 // 4941
// call Output.create
@17 // 4942
D=A // 4943
@14 // 4944
M=D // 4945
@Output.create // 4946
D=A // 4947
@13 // 4948
M=D // 4949
@Output.init.ret.2 // 4950
D=A // 4951
@CALL // 4952
0;JMP // 4953
(Output.init.ret.2)
@SP // 4954
M=M-1 // 4955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4956
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
@30 // 4968
D=A // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=D // 4973
@30 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@30 // 4980
D=A // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985
@12 // 4986
D=A // 4987
@SP // 4988
AM=M+1 // 4989
A=A-1 // 4990
M=D // 4991
@12 // 4992
D=A // 4993
@SP // 4994
AM=M+1 // 4995
A=A-1 // 4996
M=D // 4997
@SP // 4998
AM=M+1 // 4999
A=A-1 // 5000
M=0 // 5001
@4 // 5002
D=A // 5003
@SP // 5004
M=D+M // 5005
@12 // 5006
D=A // 5007
@SP // 5008
A=M-1 // 5009
M=0 // 5010
A=A-1 // 5011
M=0 // 5012
A=A-1 // 5013
M=D // 5014
A=A-1 // 5015
M=D // 5016
A=A-1 // 5017
// call Output.create
@17 // 5018
D=A // 5019
@14 // 5020
M=D // 5021
@Output.create // 5022
D=A // 5023
@13 // 5024
M=D // 5025
@Output.init.ret.3 // 5026
D=A // 5027
@CALL // 5028
0;JMP // 5029
(Output.init.ret.3)
@SP // 5030
M=M-1 // 5031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5032
D=A // 5033
@SP // 5034
AM=M+1 // 5035
A=A-1 // 5036
M=D // 5037
@54 // 5038
D=A // 5039
@SP // 5040
AM=M+1 // 5041
A=A-1 // 5042
M=D // 5043
@54 // 5044
D=A // 5045
@SP // 5046
AM=M+1 // 5047
A=A-1 // 5048
M=D // 5049
@20 // 5050
D=A // 5051
@SP // 5052
AM=M+1 // 5053
A=A-1 // 5054
M=D // 5055
@SP // 5056
AM=M+1 // 5057
A=A-1 // 5058
M=0 // 5059
@SP // 5060
AM=M+1 // 5061
A=A-1 // 5062
M=0 // 5063
@SP // 5064
AM=M+1 // 5065
A=A-1 // 5066
M=0 // 5067
@SP // 5068
AM=M+1 // 5069
A=A-1 // 5070
M=0 // 5071
@SP // 5072
AM=M+1 // 5073
A=A-1 // 5074
M=0 // 5075
@SP // 5076
AM=M+1 // 5077
A=A-1 // 5078
M=0 // 5079
@SP // 5080
AM=M+1 // 5081
A=A-1 // 5082
M=0 // 5083
@SP // 5084
AM=M+1 // 5085
A=A-1 // 5086
M=0 // 5087
// call Output.create
@17 // 5088
D=A // 5089
@14 // 5090
M=D // 5091
@Output.create // 5092
D=A // 5093
@13 // 5094
M=D // 5095
@Output.init.ret.4 // 5096
D=A // 5097
@CALL // 5098
0;JMP // 5099
(Output.init.ret.4)
@SP // 5100
M=M-1 // 5101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5102
D=A // 5103
@SP // 5104
M=D+M // 5105
@35 // 5106
D=A // 5107
@SP // 5108
A=M-1 // 5109
M=0 // 5110
A=A-1 // 5111
M=D // 5112
A=A-1 // 5113
@18 // 5114
D=A // 5115
@SP // 5116
AM=M+1 // 5117
A=A-1 // 5118
M=D // 5119
@18 // 5120
D=A // 5121
@SP // 5122
AM=M+1 // 5123
A=A-1 // 5124
M=D // 5125
@63 // 5126
D=A // 5127
@SP // 5128
AM=M+1 // 5129
A=A-1 // 5130
M=D // 5131
@18 // 5132
D=A // 5133
@SP // 5134
AM=M+1 // 5135
A=A-1 // 5136
M=D // 5137
@18 // 5138
D=A // 5139
@SP // 5140
AM=M+1 // 5141
A=A-1 // 5142
M=D // 5143
@63 // 5144
D=A // 5145
@SP // 5146
AM=M+1 // 5147
A=A-1 // 5148
M=D // 5149
@18 // 5150
D=A // 5151
@SP // 5152
AM=M+1 // 5153
A=A-1 // 5154
M=D // 5155
@18 // 5156
D=A // 5157
@SP // 5158
AM=M+1 // 5159
A=A-1 // 5160
M=D // 5161
@SP // 5162
AM=M+1 // 5163
A=A-1 // 5164
M=0 // 5165
@SP // 5166
AM=M+1 // 5167
A=A-1 // 5168
M=0 // 5169
// call Output.create
@17 // 5170
D=A // 5171
@14 // 5172
M=D // 5173
@Output.create // 5174
D=A // 5175
@13 // 5176
M=D // 5177
@Output.init.ret.5 // 5178
D=A // 5179
@CALL // 5180
0;JMP // 5181
(Output.init.ret.5)
@SP // 5182
M=M-1 // 5183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5184
D=A // 5185
@SP // 5186
AM=M+1 // 5187
A=A-1 // 5188
M=D // 5189
@12 // 5190
D=A // 5191
@SP // 5192
AM=M+1 // 5193
A=A-1 // 5194
M=D // 5195
@30 // 5196
D=A // 5197
@SP // 5198
AM=M+1 // 5199
A=A-1 // 5200
M=D // 5201
@51 // 5202
D=A // 5203
@SP // 5204
AM=M+1 // 5205
A=A-1 // 5206
M=D // 5207
@3 // 5208
D=A // 5209
@SP // 5210
AM=M+1 // 5211
A=A-1 // 5212
M=D // 5213
@30 // 5214
D=A // 5215
@SP // 5216
AM=M+1 // 5217
A=A-1 // 5218
M=D // 5219
@48 // 5220
D=A // 5221
@SP // 5222
AM=M+1 // 5223
A=A-1 // 5224
M=D // 5225
@51 // 5226
D=A // 5227
@SP // 5228
AM=M+1 // 5229
A=A-1 // 5230
M=D // 5231
@30 // 5232
D=A // 5233
@SP // 5234
AM=M+1 // 5235
A=A-1 // 5236
M=D // 5237
@12 // 5238
D=A // 5239
@SP // 5240
AM=M+1 // 5241
A=A-1 // 5242
M=D // 5243
@12 // 5244
D=A // 5245
@SP // 5246
AM=M+1 // 5247
A=A-1 // 5248
M=D // 5249
@SP // 5250
AM=M+1 // 5251
A=A-1 // 5252
M=0 // 5253
// call Output.create
@17 // 5254
D=A // 5255
@14 // 5256
M=D // 5257
@Output.create // 5258
D=A // 5259
@13 // 5260
M=D // 5261
@Output.init.ret.6 // 5262
D=A // 5263
@CALL // 5264
0;JMP // 5265
(Output.init.ret.6)
@SP // 5266
M=M-1 // 5267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5268
D=A // 5269
@SP // 5270
M=D+M // 5271
@37 // 5272
D=A // 5273
@SP // 5274
A=M-1 // 5275
M=0 // 5276
A=A-1 // 5277
M=0 // 5278
A=A-1 // 5279
M=D // 5280
A=A-1 // 5281
@35 // 5282
D=A // 5283
@SP // 5284
AM=M+1 // 5285
A=A-1 // 5286
M=D // 5287
@51 // 5288
D=A // 5289
@SP // 5290
AM=M+1 // 5291
A=A-1 // 5292
M=D // 5293
@24 // 5294
D=A // 5295
@SP // 5296
AM=M+1 // 5297
A=A-1 // 5298
M=D // 5299
@12 // 5300
D=A // 5301
@SP // 5302
AM=M+1 // 5303
A=A-1 // 5304
M=D // 5305
@6 // 5306
D=A // 5307
@SP // 5308
AM=M+1 // 5309
A=A-1 // 5310
M=D // 5311
@51 // 5312
D=A // 5313
@SP // 5314
AM=M+1 // 5315
A=A-1 // 5316
M=D // 5317
@49 // 5318
D=A // 5319
@SP // 5320
AM=M+1 // 5321
A=A-1 // 5322
M=D // 5323
@SP // 5324
AM=M+1 // 5325
A=A-1 // 5326
M=0 // 5327
@SP // 5328
AM=M+1 // 5329
A=A-1 // 5330
M=0 // 5331
// call Output.create
@17 // 5332
D=A // 5333
@14 // 5334
M=D // 5335
@Output.create // 5336
D=A // 5337
@13 // 5338
M=D // 5339
@Output.init.ret.7 // 5340
D=A // 5341
@CALL // 5342
0;JMP // 5343
(Output.init.ret.7)
@SP // 5344
M=M-1 // 5345

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5346
D=A // 5347
@SP // 5348
AM=M+1 // 5349
A=A-1 // 5350
M=D // 5351
@12 // 5352
D=A // 5353
@SP // 5354
AM=M+1 // 5355
A=A-1 // 5356
M=D // 5357
@30 // 5358
D=A // 5359
@SP // 5360
AM=M+1 // 5361
A=A-1 // 5362
M=D // 5363
@30 // 5364
D=A // 5365
@SP // 5366
AM=M+1 // 5367
A=A-1 // 5368
M=D // 5369
@12 // 5370
D=A // 5371
@SP // 5372
AM=M+1 // 5373
A=A-1 // 5374
M=D // 5375
@54 // 5376
D=A // 5377
@SP // 5378
AM=M+1 // 5379
A=A-1 // 5380
M=D // 5381
@27 // 5382
D=A // 5383
@SP // 5384
AM=M+1 // 5385
A=A-1 // 5386
M=D // 5387
@27 // 5388
D=A // 5389
@SP // 5390
AM=M+1 // 5391
A=A-1 // 5392
M=D // 5393
@27 // 5394
D=A // 5395
@SP // 5396
AM=M+1 // 5397
A=A-1 // 5398
M=D // 5399
@54 // 5400
D=A // 5401
@SP // 5402
AM=M+1 // 5403
A=A-1 // 5404
M=D // 5405
@SP // 5406
AM=M+1 // 5407
A=A-1 // 5408
M=0 // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=0 // 5413
// call Output.create
@17 // 5414
D=A // 5415
@14 // 5416
M=D // 5417
@Output.create // 5418
D=A // 5419
@13 // 5420
M=D // 5421
@Output.init.ret.8 // 5422
D=A // 5423
@CALL // 5424
0;JMP // 5425
(Output.init.ret.8)
@SP // 5426
M=M-1 // 5427

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5428
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
@6 // 5446
D=A // 5447
@SP // 5448
AM=M+1 // 5449
A=A-1 // 5450
M=D // 5451
@SP // 5452
AM=M+1 // 5453
A=A-1 // 5454
M=0 // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=0 // 5459
@SP // 5460
AM=M+1 // 5461
A=A-1 // 5462
M=0 // 5463
@SP // 5464
AM=M+1 // 5465
A=A-1 // 5466
M=0 // 5467
@SP // 5468
AM=M+1 // 5469
A=A-1 // 5470
M=0 // 5471
@SP // 5472
AM=M+1 // 5473
A=A-1 // 5474
M=0 // 5475
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
@Output.init.ret.9 // 5492
D=A // 5493
@CALL // 5494
0;JMP // 5495
(Output.init.ret.9)
@SP // 5496
M=M-1 // 5497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5498
D=A // 5499
@SP // 5500
AM=M+1 // 5501
A=A-1 // 5502
M=D // 5503
@24 // 5504
D=A // 5505
@SP // 5506
AM=M+1 // 5507
A=A-1 // 5508
M=D // 5509
@12 // 5510
D=A // 5511
@SP // 5512
AM=M+1 // 5513
A=A-1 // 5514
M=D // 5515
@6 // 5516
D=A // 5517
@SP // 5518
AM=M+1 // 5519
A=A-1 // 5520
M=D // 5521
@6 // 5522
D=A // 5523
@SP // 5524
AM=M+1 // 5525
A=A-1 // 5526
M=D // 5527
@6 // 5528
D=A // 5529
@SP // 5530
AM=M+1 // 5531
A=A-1 // 5532
M=D // 5533
@6 // 5534
D=A // 5535
@SP // 5536
AM=M+1 // 5537
A=A-1 // 5538
M=D // 5539
@6 // 5540
D=A // 5541
@SP // 5542
AM=M+1 // 5543
A=A-1 // 5544
M=D // 5545
@12 // 5546
D=A // 5547
@SP // 5548
AM=M+1 // 5549
A=A-1 // 5550
M=D // 5551
@24 // 5552
D=A // 5553
@SP // 5554
AM=M+1 // 5555
A=A-1 // 5556
M=D // 5557
@SP // 5558
AM=M+1 // 5559
A=A-1 // 5560
M=0 // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=0 // 5565
// call Output.create
@17 // 5566
D=A // 5567
@14 // 5568
M=D // 5569
@Output.create // 5570
D=A // 5571
@13 // 5572
M=D // 5573
@Output.init.ret.10 // 5574
D=A // 5575
@CALL // 5576
0;JMP // 5577
(Output.init.ret.10)
@SP // 5578
M=M-1 // 5579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 5580
D=A // 5581
@SP // 5582
AM=M+1 // 5583
A=A-1 // 5584
M=D // 5585
@6 // 5586
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
@24 // 5598
D=A // 5599
@SP // 5600
AM=M+1 // 5601
A=A-1 // 5602
M=D // 5603
@24 // 5604
D=A // 5605
@SP // 5606
AM=M+1 // 5607
A=A-1 // 5608
M=D // 5609
@24 // 5610
D=A // 5611
@SP // 5612
AM=M+1 // 5613
A=A-1 // 5614
M=D // 5615
@24 // 5616
D=A // 5617
@SP // 5618
AM=M+1 // 5619
A=A-1 // 5620
M=D // 5621
@24 // 5622
D=A // 5623
@SP // 5624
AM=M+1 // 5625
A=A-1 // 5626
M=D // 5627
@12 // 5628
D=A // 5629
@SP // 5630
AM=M+1 // 5631
A=A-1 // 5632
M=D // 5633
@6 // 5634
D=A // 5635
@SP // 5636
AM=M+1 // 5637
A=A-1 // 5638
M=D // 5639
@SP // 5640
AM=M+1 // 5641
A=A-1 // 5642
M=0 // 5643
@SP // 5644
AM=M+1 // 5645
A=A-1 // 5646
M=0 // 5647
// call Output.create
@17 // 5648
D=A // 5649
@14 // 5650
M=D // 5651
@Output.create // 5652
D=A // 5653
@13 // 5654
M=D // 5655
@Output.init.ret.11 // 5656
D=A // 5657
@CALL // 5658
0;JMP // 5659
(Output.init.ret.11)
@SP // 5660
M=M-1 // 5661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5662
D=A // 5663
@SP // 5664
M=D+M // 5665
@42 // 5666
D=A // 5667
@SP // 5668
A=M-1 // 5669
M=0 // 5670
A=A-1 // 5671
M=0 // 5672
A=A-1 // 5673
M=0 // 5674
A=A-1 // 5675
M=D // 5676
A=A-1 // 5677
@51 // 5678
D=A // 5679
@SP // 5680
AM=M+1 // 5681
A=A-1 // 5682
M=D // 5683
@30 // 5684
D=A // 5685
@SP // 5686
AM=M+1 // 5687
A=A-1 // 5688
M=D // 5689
@63 // 5690
D=A // 5691
@SP // 5692
AM=M+1 // 5693
A=A-1 // 5694
M=D // 5695
@30 // 5696
D=A // 5697
@SP // 5698
AM=M+1 // 5699
A=A-1 // 5700
M=D // 5701
@51 // 5702
D=A // 5703
@SP // 5704
AM=M+1 // 5705
A=A-1 // 5706
M=D // 5707
@SP // 5708
AM=M+1 // 5709
A=A-1 // 5710
M=0 // 5711
@SP // 5712
AM=M+1 // 5713
A=A-1 // 5714
M=0 // 5715
@SP // 5716
AM=M+1 // 5717
A=A-1 // 5718
M=0 // 5719
// call Output.create
@17 // 5720
D=A // 5721
@14 // 5722
M=D // 5723
@Output.create // 5724
D=A // 5725
@13 // 5726
M=D // 5727
@Output.init.ret.12 // 5728
D=A // 5729
@CALL // 5730
0;JMP // 5731
(Output.init.ret.12)
@SP // 5732
M=M-1 // 5733

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5734
D=A // 5735
@SP // 5736
M=D+M // 5737
@43 // 5738
D=A // 5739
@SP // 5740
A=M-1 // 5741
M=0 // 5742
A=A-1 // 5743
M=0 // 5744
A=A-1 // 5745
M=0 // 5746
A=A-1 // 5747
M=D // 5748
A=A-1 // 5749
@12 // 5750
D=A // 5751
@SP // 5752
AM=M+1 // 5753
A=A-1 // 5754
M=D // 5755
@12 // 5756
D=A // 5757
@SP // 5758
AM=M+1 // 5759
A=A-1 // 5760
M=D // 5761
@63 // 5762
D=A // 5763
@SP // 5764
AM=M+1 // 5765
A=A-1 // 5766
M=D // 5767
@12 // 5768
D=A // 5769
@SP // 5770
AM=M+1 // 5771
A=A-1 // 5772
M=D // 5773
@12 // 5774
D=A // 5775
@SP // 5776
AM=M+1 // 5777
A=A-1 // 5778
M=D // 5779
@SP // 5780
AM=M+1 // 5781
A=A-1 // 5782
M=0 // 5783
@SP // 5784
AM=M+1 // 5785
A=A-1 // 5786
M=0 // 5787
@SP // 5788
AM=M+1 // 5789
A=A-1 // 5790
M=0 // 5791
// call Output.create
@17 // 5792
D=A // 5793
@14 // 5794
M=D // 5795
@Output.create // 5796
D=A // 5797
@13 // 5798
M=D // 5799
@Output.init.ret.13 // 5800
D=A // 5801
@CALL // 5802
0;JMP // 5803
(Output.init.ret.13)
@SP // 5804
M=M-1 // 5805

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5806
D=A // 5807
@SP // 5808
M=D+M // 5809
@44 // 5810
D=A // 5811
@SP // 5812
A=M-1 // 5813
M=0 // 5814
A=A-1 // 5815
M=0 // 5816
A=A-1 // 5817
M=0 // 5818
A=A-1 // 5819
M=0 // 5820
A=A-1 // 5821
M=0 // 5822
A=A-1 // 5823
M=0 // 5824
A=A-1 // 5825
M=0 // 5826
A=A-1 // 5827
M=D // 5828
A=A-1 // 5829
@12 // 5830
D=A // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=D // 5835
@12 // 5836
D=A // 5837
@SP // 5838
AM=M+1 // 5839
A=A-1 // 5840
M=D // 5841
@6 // 5842
D=A // 5843
@SP // 5844
AM=M+1 // 5845
A=A-1 // 5846
M=D // 5847
@SP // 5848
AM=M+1 // 5849
A=A-1 // 5850
M=0 // 5851
// call Output.create
@17 // 5852
D=A // 5853
@14 // 5854
M=D // 5855
@Output.create // 5856
D=A // 5857
@13 // 5858
M=D // 5859
@Output.init.ret.14 // 5860
D=A // 5861
@CALL // 5862
0;JMP // 5863
(Output.init.ret.14)
@SP // 5864
M=M-1 // 5865

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5866
D=A // 5867
@SP // 5868
M=D+M // 5869
@45 // 5870
D=A // 5871
@SP // 5872
A=M-1 // 5873
M=0 // 5874
A=A-1 // 5875
M=0 // 5876
A=A-1 // 5877
M=0 // 5878
A=A-1 // 5879
M=0 // 5880
A=A-1 // 5881
M=0 // 5882
A=A-1 // 5883
M=D // 5884
A=A-1 // 5885
@6 // 5886
D=A // 5887
@SP // 5888
M=D+M // 5889
@63 // 5890
D=A // 5891
@SP // 5892
A=M-1 // 5893
M=0 // 5894
A=A-1 // 5895
M=0 // 5896
A=A-1 // 5897
M=0 // 5898
A=A-1 // 5899
M=0 // 5900
A=A-1 // 5901
M=0 // 5902
A=A-1 // 5903
M=D // 5904
A=A-1 // 5905
// call Output.create
@17 // 5906
D=A // 5907
@14 // 5908
M=D // 5909
@Output.create // 5910
D=A // 5911
@13 // 5912
M=D // 5913
@Output.init.ret.15 // 5914
D=A // 5915
@CALL // 5916
0;JMP // 5917
(Output.init.ret.15)
@SP // 5918
M=M-1 // 5919

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5920
D=A // 5921
@SP // 5922
M=D+M // 5923
@46 // 5924
D=A // 5925
@SP // 5926
A=M-1 // 5927
M=0 // 5928
A=A-1 // 5929
M=0 // 5930
A=A-1 // 5931
M=0 // 5932
A=A-1 // 5933
M=0 // 5934
A=A-1 // 5935
M=0 // 5936
A=A-1 // 5937
M=0 // 5938
A=A-1 // 5939
M=0 // 5940
A=A-1 // 5941
M=D // 5942
A=A-1 // 5943
@4 // 5944
D=A // 5945
@SP // 5946
M=D+M // 5947
@12 // 5948
D=A // 5949
@SP // 5950
A=M-1 // 5951
M=0 // 5952
A=A-1 // 5953
M=0 // 5954
A=A-1 // 5955
M=D // 5956
A=A-1 // 5957
M=D // 5958
A=A-1 // 5959
// call Output.create
@17 // 5960
D=A // 5961
@14 // 5962
M=D // 5963
@Output.create // 5964
D=A // 5965
@13 // 5966
M=D // 5967
@Output.init.ret.16 // 5968
D=A // 5969
@CALL // 5970
0;JMP // 5971
(Output.init.ret.16)
@SP // 5972
M=M-1 // 5973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5974
D=A // 5975
@SP // 5976
M=D+M // 5977
@47 // 5978
D=A // 5979
@SP // 5980
A=M-1 // 5981
M=0 // 5982
A=A-1 // 5983
M=0 // 5984
A=A-1 // 5985
M=D // 5986
A=A-1 // 5987
@32 // 5988
D=A // 5989
@SP // 5990
AM=M+1 // 5991
A=A-1 // 5992
M=D // 5993
@48 // 5994
D=A // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=D // 5999
@24 // 6000
D=A // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=D // 6005
@12 // 6006
D=A // 6007
@SP // 6008
AM=M+1 // 6009
A=A-1 // 6010
M=D // 6011
@6 // 6012
D=A // 6013
@SP // 6014
AM=M+1 // 6015
A=A-1 // 6016
M=D // 6017
@3 // 6018
D=A // 6019
@SP // 6020
AM=M+1 // 6021
A=A-1 // 6022
M=D // 6023
@SP // 6024
AM=M+1 // 6025
A=A-1 // 6026
M=1 // 6027
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
@Output.init.ret.17 // 6044
D=A // 6045
@CALL // 6046
0;JMP // 6047
(Output.init.ret.17)
@SP // 6048
M=M-1 // 6049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6050
D=A // 6051
@SP // 6052
AM=M+1 // 6053
A=A-1 // 6054
M=D // 6055
@12 // 6056
D=A // 6057
@SP // 6058
AM=M+1 // 6059
A=A-1 // 6060
M=D // 6061
@30 // 6062
D=A // 6063
@SP // 6064
AM=M+1 // 6065
A=A-1 // 6066
M=D // 6067
@51 // 6068
D=A // 6069
@SP // 6070
AM=M+1 // 6071
A=A-1 // 6072
M=D // 6073
@51 // 6074
D=A // 6075
@SP // 6076
AM=M+1 // 6077
A=A-1 // 6078
M=D // 6079
@51 // 6080
D=A // 6081
@SP // 6082
AM=M+1 // 6083
A=A-1 // 6084
M=D // 6085
@51 // 6086
D=A // 6087
@SP // 6088
AM=M+1 // 6089
A=A-1 // 6090
M=D // 6091
@51 // 6092
D=A // 6093
@SP // 6094
AM=M+1 // 6095
A=A-1 // 6096
M=D // 6097
@30 // 6098
D=A // 6099
@SP // 6100
AM=M+1 // 6101
A=A-1 // 6102
M=D // 6103
@12 // 6104
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
@Output.init.ret.18 // 6126
D=A // 6127
@CALL // 6128
0;JMP // 6129
(Output.init.ret.18)
@SP // 6130
M=M-1 // 6131

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6132
D=A // 6133
@SP // 6134
AM=M+1 // 6135
A=A-1 // 6136
M=D // 6137
@12 // 6138
D=A // 6139
@SP // 6140
AM=M+1 // 6141
A=A-1 // 6142
M=D // 6143
@14 // 6144
D=A // 6145
@SP // 6146
AM=M+1 // 6147
A=A-1 // 6148
M=D // 6149
@15 // 6150
D=A // 6151
@SP // 6152
AM=M+1 // 6153
A=A-1 // 6154
M=D // 6155
@12 // 6156
D=A // 6157
@SP // 6158
AM=M+1 // 6159
A=A-1 // 6160
M=D // 6161
@12 // 6162
D=A // 6163
@SP // 6164
AM=M+1 // 6165
A=A-1 // 6166
M=D // 6167
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
@12 // 6180
D=A // 6181
@SP // 6182
AM=M+1 // 6183
A=A-1 // 6184
M=D // 6185
@63 // 6186
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
@Output.init.ret.19 // 6208
D=A // 6209
@CALL // 6210
0;JMP // 6211
(Output.init.ret.19)
@SP // 6212
M=M-1 // 6213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6214
D=A // 6215
@SP // 6216
AM=M+1 // 6217
A=A-1 // 6218
M=D // 6219
@30 // 6220
D=A // 6221
@SP // 6222
AM=M+1 // 6223
A=A-1 // 6224
M=D // 6225
@51 // 6226
D=A // 6227
@SP // 6228
AM=M+1 // 6229
A=A-1 // 6230
M=D // 6231
@48 // 6232
D=A // 6233
@SP // 6234
AM=M+1 // 6235
A=A-1 // 6236
M=D // 6237
@24 // 6238
D=A // 6239
@SP // 6240
AM=M+1 // 6241
A=A-1 // 6242
M=D // 6243
@12 // 6244
D=A // 6245
@SP // 6246
AM=M+1 // 6247
A=A-1 // 6248
M=D // 6249
@6 // 6250
D=A // 6251
@SP // 6252
AM=M+1 // 6253
A=A-1 // 6254
M=D // 6255
@3 // 6256
D=A // 6257
@SP // 6258
AM=M+1 // 6259
A=A-1 // 6260
M=D // 6261
@51 // 6262
D=A // 6263
@SP // 6264
AM=M+1 // 6265
A=A-1 // 6266
M=D // 6267
@63 // 6268
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
@Output.init.ret.20 // 6290
D=A // 6291
@CALL // 6292
0;JMP // 6293
(Output.init.ret.20)
@SP // 6294
M=M-1 // 6295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6296
D=A // 6297
@SP // 6298
AM=M+1 // 6299
A=A-1 // 6300
M=D // 6301
@30 // 6302
D=A // 6303
@SP // 6304
AM=M+1 // 6305
A=A-1 // 6306
M=D // 6307
@51 // 6308
D=A // 6309
@SP // 6310
AM=M+1 // 6311
A=A-1 // 6312
M=D // 6313
@48 // 6314
D=A // 6315
@SP // 6316
AM=M+1 // 6317
A=A-1 // 6318
M=D // 6319
@48 // 6320
D=A // 6321
@SP // 6322
AM=M+1 // 6323
A=A-1 // 6324
M=D // 6325
@28 // 6326
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
@Output.init.ret.21 // 6372
D=A // 6373
@CALL // 6374
0;JMP // 6375
(Output.init.ret.21)
@SP // 6376
M=M-1 // 6377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6378
D=A // 6379
@SP // 6380
AM=M+1 // 6381
A=A-1 // 6382
M=D // 6383
@16 // 6384
D=A // 6385
@SP // 6386
AM=M+1 // 6387
A=A-1 // 6388
M=D // 6389
@24 // 6390
D=A // 6391
@SP // 6392
AM=M+1 // 6393
A=A-1 // 6394
M=D // 6395
@28 // 6396
D=A // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401
@26 // 6402
D=A // 6403
@SP // 6404
AM=M+1 // 6405
A=A-1 // 6406
M=D // 6407
@25 // 6408
D=A // 6409
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=D // 6413
@63 // 6414
D=A // 6415
@SP // 6416
AM=M+1 // 6417
A=A-1 // 6418
M=D // 6419
@24 // 6420
D=A // 6421
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=D // 6425
@24 // 6426
D=A // 6427
@SP // 6428
AM=M+1 // 6429
A=A-1 // 6430
M=D // 6431
@60 // 6432
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
@Output.init.ret.22 // 6454
D=A // 6455
@CALL // 6456
0;JMP // 6457
(Output.init.ret.22)
@SP // 6458
M=M-1 // 6459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6460
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
@3 // 6472
D=A // 6473
@SP // 6474
AM=M+1 // 6475
A=A-1 // 6476
M=D // 6477
@3 // 6478
D=A // 6479
@SP // 6480
AM=M+1 // 6481
A=A-1 // 6482
M=D // 6483
@31 // 6484
D=A // 6485
@SP // 6486
AM=M+1 // 6487
A=A-1 // 6488
M=D // 6489
@48 // 6490
D=A // 6491
@SP // 6492
AM=M+1 // 6493
A=A-1 // 6494
M=D // 6495
@48 // 6496
D=A // 6497
@SP // 6498
AM=M+1 // 6499
A=A-1 // 6500
M=D // 6501
@48 // 6502
D=A // 6503
@SP // 6504
AM=M+1 // 6505
A=A-1 // 6506
M=D // 6507
@51 // 6508
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
@Output.init.ret.23 // 6536
D=A // 6537
@CALL // 6538
0;JMP // 6539
(Output.init.ret.23)
@SP // 6540
M=M-1 // 6541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 6542
D=A // 6543
@SP // 6544
AM=M+1 // 6545
A=A-1 // 6546
M=D // 6547
@28 // 6548
D=A // 6549
@SP // 6550
AM=M+1 // 6551
A=A-1 // 6552
M=D // 6553
@6 // 6554
D=A // 6555
@SP // 6556
AM=M+1 // 6557
A=A-1 // 6558
M=D // 6559
@3 // 6560
D=A // 6561
@SP // 6562
AM=M+1 // 6563
A=A-1 // 6564
M=D // 6565
@3 // 6566
D=A // 6567
@SP // 6568
AM=M+1 // 6569
A=A-1 // 6570
M=D // 6571
@31 // 6572
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
@Output.init.ret.24 // 6618
D=A // 6619
@CALL // 6620
0;JMP // 6621
(Output.init.ret.24)
@SP // 6622
M=M-1 // 6623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6624
D=A // 6625
@SP // 6626
AM=M+1 // 6627
A=A-1 // 6628
M=D // 6629
@63 // 6630
D=A // 6631
@SP // 6632
AM=M+1 // 6633
A=A-1 // 6634
M=D // 6635
@49 // 6636
D=A // 6637
@SP // 6638
AM=M+1 // 6639
A=A-1 // 6640
M=D // 6641
@48 // 6642
D=A // 6643
@SP // 6644
AM=M+1 // 6645
A=A-1 // 6646
M=D // 6647
@48 // 6648
D=A // 6649
@SP // 6650
AM=M+1 // 6651
A=A-1 // 6652
M=D // 6653
@24 // 6654
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
@12 // 6666
D=A // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=D // 6671
@12 // 6672
D=A // 6673
@SP // 6674
AM=M+1 // 6675
A=A-1 // 6676
M=D // 6677
@12 // 6678
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
@Output.init.ret.25 // 6700
D=A // 6701
@CALL // 6702
0;JMP // 6703
(Output.init.ret.25)
@SP // 6704
M=M-1 // 6705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 6706
D=A // 6707
@SP // 6708
AM=M+1 // 6709
A=A-1 // 6710
M=D // 6711
@30 // 6712
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
@51 // 6724
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
@30 // 6736
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
@51 // 6748
D=A // 6749
@SP // 6750
AM=M+1 // 6751
A=A-1 // 6752
M=D // 6753
@51 // 6754
D=A // 6755
@SP // 6756
AM=M+1 // 6757
A=A-1 // 6758
M=D // 6759
@30 // 6760
D=A // 6761
@SP // 6762
AM=M+1 // 6763
A=A-1 // 6764
M=D // 6765
@SP // 6766
AM=M+1 // 6767
A=A-1 // 6768
M=0 // 6769
@SP // 6770
AM=M+1 // 6771
A=A-1 // 6772
M=0 // 6773
// call Output.create
@17 // 6774
D=A // 6775
@14 // 6776
M=D // 6777
@Output.create // 6778
D=A // 6779
@13 // 6780
M=D // 6781
@Output.init.ret.26 // 6782
D=A // 6783
@CALL // 6784
0;JMP // 6785
(Output.init.ret.26)
@SP // 6786
M=M-1 // 6787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6788
D=A // 6789
@SP // 6790
AM=M+1 // 6791
A=A-1 // 6792
M=D // 6793
@30 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799
@51 // 6800
D=A // 6801
@SP // 6802
AM=M+1 // 6803
A=A-1 // 6804
M=D // 6805
@51 // 6806
D=A // 6807
@SP // 6808
AM=M+1 // 6809
A=A-1 // 6810
M=D // 6811
@51 // 6812
D=A // 6813
@SP // 6814
AM=M+1 // 6815
A=A-1 // 6816
M=D // 6817
@62 // 6818
D=A // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823
@48 // 6824
D=A // 6825
@SP // 6826
AM=M+1 // 6827
A=A-1 // 6828
M=D // 6829
@48 // 6830
D=A // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=D // 6835
@24 // 6836
D=A // 6837
@SP // 6838
AM=M+1 // 6839
A=A-1 // 6840
M=D // 6841
@14 // 6842
D=A // 6843
@SP // 6844
AM=M+1 // 6845
A=A-1 // 6846
M=D // 6847
@SP // 6848
AM=M+1 // 6849
A=A-1 // 6850
M=0 // 6851
@SP // 6852
AM=M+1 // 6853
A=A-1 // 6854
M=0 // 6855
// call Output.create
@17 // 6856
D=A // 6857
@14 // 6858
M=D // 6859
@Output.create // 6860
D=A // 6861
@13 // 6862
M=D // 6863
@Output.init.ret.27 // 6864
D=A // 6865
@CALL // 6866
0;JMP // 6867
(Output.init.ret.27)
@SP // 6868
M=M-1 // 6869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6870
D=A // 6871
@SP // 6872
M=D+M // 6873
@58 // 6874
D=A // 6875
@SP // 6876
A=M-1 // 6877
M=0 // 6878
A=A-1 // 6879
M=0 // 6880
A=A-1 // 6881
M=D // 6882
A=A-1 // 6883
@4 // 6884
D=A // 6885
@SP // 6886
M=D+M // 6887
@12 // 6888
D=A // 6889
@SP // 6890
A=M-1 // 6891
M=0 // 6892
A=A-1 // 6893
M=0 // 6894
A=A-1 // 6895
M=D // 6896
A=A-1 // 6897
M=D // 6898
A=A-1 // 6899
@5 // 6900
D=A // 6901
@SP // 6902
M=D+M // 6903
@12 // 6904
D=A // 6905
@SP // 6906
A=M-1 // 6907
M=0 // 6908
A=A-1 // 6909
M=0 // 6910
A=A-1 // 6911
M=0 // 6912
A=A-1 // 6913
M=D // 6914
A=A-1 // 6915
M=D // 6916
A=A-1 // 6917
// call Output.create
@17 // 6918
D=A // 6919
@14 // 6920
M=D // 6921
@Output.create // 6922
D=A // 6923
@13 // 6924
M=D // 6925
@Output.init.ret.28 // 6926
D=A // 6927
@CALL // 6928
0;JMP // 6929
(Output.init.ret.28)
@SP // 6930
M=M-1 // 6931

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6932
D=A // 6933
@SP // 6934
M=D+M // 6935
@59 // 6936
D=A // 6937
@SP // 6938
A=M-1 // 6939
M=0 // 6940
A=A-1 // 6941
M=0 // 6942
A=A-1 // 6943
M=D // 6944
A=A-1 // 6945
@4 // 6946
D=A // 6947
@SP // 6948
M=D+M // 6949
@12 // 6950
D=A // 6951
@SP // 6952
A=M-1 // 6953
M=0 // 6954
A=A-1 // 6955
M=0 // 6956
A=A-1 // 6957
M=D // 6958
A=A-1 // 6959
M=D // 6960
A=A-1 // 6961
@12 // 6962
D=A // 6963
@SP // 6964
AM=M+1 // 6965
A=A-1 // 6966
M=D // 6967
@12 // 6968
D=A // 6969
@SP // 6970
AM=M+1 // 6971
A=A-1 // 6972
M=D // 6973
@6 // 6974
D=A // 6975
@SP // 6976
AM=M+1 // 6977
A=A-1 // 6978
M=D // 6979
@SP // 6980
AM=M+1 // 6981
A=A-1 // 6982
M=0 // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=0 // 6987
// call Output.create
@17 // 6988
D=A // 6989
@14 // 6990
M=D // 6991
@Output.create // 6992
D=A // 6993
@13 // 6994
M=D // 6995
@Output.init.ret.29 // 6996
D=A // 6997
@CALL // 6998
0;JMP // 6999
(Output.init.ret.29)
@SP // 7000
M=M-1 // 7001

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7002
D=A // 7003
@SP // 7004
M=D+M // 7005
@60 // 7006
D=A // 7007
@SP // 7008
A=M-1 // 7009
M=0 // 7010
A=A-1 // 7011
M=0 // 7012
A=A-1 // 7013
M=D // 7014
A=A-1 // 7015
@24 // 7016
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
@6 // 7028
D=A // 7029
@SP // 7030
AM=M+1 // 7031
A=A-1 // 7032
M=D // 7033
@3 // 7034
D=A // 7035
@SP // 7036
AM=M+1 // 7037
A=A-1 // 7038
M=D // 7039
@6 // 7040
D=A // 7041
@SP // 7042
AM=M+1 // 7043
A=A-1 // 7044
M=D // 7045
@12 // 7046
D=A // 7047
@SP // 7048
AM=M+1 // 7049
A=A-1 // 7050
M=D // 7051
@24 // 7052
D=A // 7053
@SP // 7054
AM=M+1 // 7055
A=A-1 // 7056
M=D // 7057
@SP // 7058
AM=M+1 // 7059
A=A-1 // 7060
M=0 // 7061
@SP // 7062
AM=M+1 // 7063
A=A-1 // 7064
M=0 // 7065
// call Output.create
@17 // 7066
D=A // 7067
@14 // 7068
M=D // 7069
@Output.create // 7070
D=A // 7071
@13 // 7072
M=D // 7073
@Output.init.ret.30 // 7074
D=A // 7075
@CALL // 7076
0;JMP // 7077
(Output.init.ret.30)
@SP // 7078
M=M-1 // 7079

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7080
D=A // 7081
@SP // 7082
M=D+M // 7083
@61 // 7084
D=A // 7085
@SP // 7086
A=M-1 // 7087
M=0 // 7088
A=A-1 // 7089
M=0 // 7090
A=A-1 // 7091
M=0 // 7092
A=A-1 // 7093
M=D // 7094
A=A-1 // 7095
@3 // 7096
D=A // 7097
@SP // 7098
M=D+M // 7099
@63 // 7100
D=A // 7101
@SP // 7102
A=M-1 // 7103
M=0 // 7104
A=A-1 // 7105
M=0 // 7106
A=A-1 // 7107
M=D // 7108
A=A-1 // 7109
@5 // 7110
D=A // 7111
@SP // 7112
M=D+M // 7113
@63 // 7114
D=A // 7115
@SP // 7116
A=M-1 // 7117
M=0 // 7118
A=A-1 // 7119
M=0 // 7120
A=A-1 // 7121
M=0 // 7122
A=A-1 // 7123
M=0 // 7124
A=A-1 // 7125
M=D // 7126
A=A-1 // 7127
// call Output.create
@17 // 7128
D=A // 7129
@14 // 7130
M=D // 7131
@Output.create // 7132
D=A // 7133
@13 // 7134
M=D // 7135
@Output.init.ret.31 // 7136
D=A // 7137
@CALL // 7138
0;JMP // 7139
(Output.init.ret.31)
@SP // 7140
M=M-1 // 7141

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7142
D=A // 7143
@SP // 7144
M=D+M // 7145
@62 // 7146
D=A // 7147
@SP // 7148
A=M-1 // 7149
M=0 // 7150
A=A-1 // 7151
M=0 // 7152
A=A-1 // 7153
M=D // 7154
A=A-1 // 7155
@3 // 7156
D=A // 7157
@SP // 7158
AM=M+1 // 7159
A=A-1 // 7160
M=D // 7161
@6 // 7162
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
@24 // 7174
D=A // 7175
@SP // 7176
AM=M+1 // 7177
A=A-1 // 7178
M=D // 7179
@12 // 7180
D=A // 7181
@SP // 7182
AM=M+1 // 7183
A=A-1 // 7184
M=D // 7185
@6 // 7186
D=A // 7187
@SP // 7188
AM=M+1 // 7189
A=A-1 // 7190
M=D // 7191
@3 // 7192
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
@Output.init.ret.32 // 7214
D=A // 7215
@CALL // 7216
0;JMP // 7217
(Output.init.ret.32)
@SP // 7218
M=M-1 // 7219

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7220
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
@59 // 7244
D=A // 7245
@SP // 7246
AM=M+1 // 7247
A=A-1 // 7248
M=D // 7249
@59 // 7250
D=A // 7251
@SP // 7252
AM=M+1 // 7253
A=A-1 // 7254
M=D // 7255
@59 // 7256
D=A // 7257
@SP // 7258
AM=M+1 // 7259
A=A-1 // 7260
M=D // 7261
@27 // 7262
D=A // 7263
@SP // 7264
AM=M+1 // 7265
A=A-1 // 7266
M=D // 7267
@3 // 7268
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
@SP // 7280
AM=M+1 // 7281
A=A-1 // 7282
M=0 // 7283
@SP // 7284
AM=M+1 // 7285
A=A-1 // 7286
M=0 // 7287
// call Output.create
@17 // 7288
D=A // 7289
@14 // 7290
M=D // 7291
@Output.create // 7292
D=A // 7293
@13 // 7294
M=D // 7295
@Output.init.ret.33 // 7296
D=A // 7297
@CALL // 7298
0;JMP // 7299
(Output.init.ret.33)
@SP // 7300
M=M-1 // 7301

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7302
D=A // 7303
@SP // 7304
AM=M+1 // 7305
A=A-1 // 7306
M=D // 7307
@30 // 7308
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
@24 // 7326
D=A // 7327
@SP // 7328
AM=M+1 // 7329
A=A-1 // 7330
M=D // 7331
@12 // 7332
D=A // 7333
@SP // 7334
AM=M+1 // 7335
A=A-1 // 7336
M=D // 7337
@12 // 7338
D=A // 7339
@SP // 7340
AM=M+1 // 7341
A=A-1 // 7342
M=D // 7343
@SP // 7344
AM=M+1 // 7345
A=A-1 // 7346
M=0 // 7347
@4 // 7348
D=A // 7349
@SP // 7350
M=D+M // 7351
@12 // 7352
D=A // 7353
@SP // 7354
A=M-1 // 7355
M=0 // 7356
A=A-1 // 7357
M=0 // 7358
A=A-1 // 7359
M=D // 7360
A=A-1 // 7361
M=D // 7362
A=A-1 // 7363
// call Output.create
@17 // 7364
D=A // 7365
@14 // 7366
M=D // 7367
@Output.create // 7368
D=A // 7369
@13 // 7370
M=D // 7371
@Output.init.ret.34 // 7372
D=A // 7373
@CALL // 7374
0;JMP // 7375
(Output.init.ret.34)
@SP // 7376
M=M-1 // 7377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 7378
D=A // 7379
@SP // 7380
AM=M+1 // 7381
A=A-1 // 7382
M=D // 7383
@12 // 7384
D=A // 7385
@SP // 7386
AM=M+1 // 7387
A=A-1 // 7388
M=D // 7389
@30 // 7390
D=A // 7391
@SP // 7392
AM=M+1 // 7393
A=A-1 // 7394
M=D // 7395
@51 // 7396
D=A // 7397
@SP // 7398
AM=M+1 // 7399
A=A-1 // 7400
M=D // 7401
@51 // 7402
D=A // 7403
@SP // 7404
AM=M+1 // 7405
A=A-1 // 7406
M=D // 7407
@63 // 7408
D=A // 7409
@SP // 7410
AM=M+1 // 7411
A=A-1 // 7412
M=D // 7413
@51 // 7414
D=A // 7415
@SP // 7416
AM=M+1 // 7417
A=A-1 // 7418
M=D // 7419
@51 // 7420
D=A // 7421
@SP // 7422
AM=M+1 // 7423
A=A-1 // 7424
M=D // 7425
@51 // 7426
D=A // 7427
@SP // 7428
AM=M+1 // 7429
A=A-1 // 7430
M=D // 7431
@51 // 7432
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
@Output.init.ret.35 // 7454
D=A // 7455
@CALL // 7456
0;JMP // 7457
(Output.init.ret.35)
@SP // 7458
M=M-1 // 7459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7460
D=A // 7461
@SP // 7462
AM=M+1 // 7463
A=A-1 // 7464
M=D // 7465
@31 // 7466
D=A // 7467
@SP // 7468
AM=M+1 // 7469
A=A-1 // 7470
M=D // 7471
@51 // 7472
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
@31 // 7490
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
@51 // 7508
D=A // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=D // 7513
@31 // 7514
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
@Output.init.ret.36 // 7536
D=A // 7537
@CALL // 7538
0;JMP // 7539
(Output.init.ret.36)
@SP // 7540
M=M-1 // 7541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 7542
D=A // 7543
@SP // 7544
AM=M+1 // 7545
A=A-1 // 7546
M=D // 7547
@28 // 7548
D=A // 7549
@SP // 7550
AM=M+1 // 7551
A=A-1 // 7552
M=D // 7553
@54 // 7554
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
@3 // 7566
D=A // 7567
@SP // 7568
AM=M+1 // 7569
A=A-1 // 7570
M=D // 7571
@3 // 7572
D=A // 7573
@SP // 7574
AM=M+1 // 7575
A=A-1 // 7576
M=D // 7577
@3 // 7578
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
@54 // 7590
D=A // 7591
@SP // 7592
AM=M+1 // 7593
A=A-1 // 7594
M=D // 7595
@28 // 7596
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
@Output.init.ret.37 // 7618
D=A // 7619
@CALL // 7620
0;JMP // 7621
(Output.init.ret.37)
@SP // 7622
M=M-1 // 7623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7624
D=A // 7625
@SP // 7626
AM=M+1 // 7627
A=A-1 // 7628
M=D // 7629
@15 // 7630
D=A // 7631
@SP // 7632
AM=M+1 // 7633
A=A-1 // 7634
M=D // 7635
@27 // 7636
D=A // 7637
@SP // 7638
AM=M+1 // 7639
A=A-1 // 7640
M=D // 7641
@51 // 7642
D=A // 7643
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=D // 7647
@51 // 7648
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
@51 // 7666
D=A // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671
@27 // 7672
D=A // 7673
@SP // 7674
AM=M+1 // 7675
A=A-1 // 7676
M=D // 7677
@15 // 7678
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
@Output.init.ret.38 // 7700
D=A // 7701
@CALL // 7702
0;JMP // 7703
(Output.init.ret.38)
@SP // 7704
M=M-1 // 7705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 7706
D=A // 7707
@SP // 7708
AM=M+1 // 7709
A=A-1 // 7710
M=D // 7711
@63 // 7712
D=A // 7713
@SP // 7714
AM=M+1 // 7715
A=A-1 // 7716
M=D // 7717
@51 // 7718
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
@11 // 7730
D=A // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=D // 7735
@15 // 7736
D=A // 7737
@SP // 7738
AM=M+1 // 7739
A=A-1 // 7740
M=D // 7741
@11 // 7742
D=A // 7743
@SP // 7744
AM=M+1 // 7745
A=A-1 // 7746
M=D // 7747
@35 // 7748
D=A // 7749
@SP // 7750
AM=M+1 // 7751
A=A-1 // 7752
M=D // 7753
@51 // 7754
D=A // 7755
@SP // 7756
AM=M+1 // 7757
A=A-1 // 7758
M=D // 7759
@63 // 7760
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
@Output.init.ret.39 // 7782
D=A // 7783
@CALL // 7784
0;JMP // 7785
(Output.init.ret.39)
@SP // 7786
M=M-1 // 7787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7788
D=A // 7789
@SP // 7790
AM=M+1 // 7791
A=A-1 // 7792
M=D // 7793
@63 // 7794
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
@35 // 7806
D=A // 7807
@SP // 7808
AM=M+1 // 7809
A=A-1 // 7810
M=D // 7811
@11 // 7812
D=A // 7813
@SP // 7814
AM=M+1 // 7815
A=A-1 // 7816
M=D // 7817
@15 // 7818
D=A // 7819
@SP // 7820
AM=M+1 // 7821
A=A-1 // 7822
M=D // 7823
@11 // 7824
D=A // 7825
@SP // 7826
AM=M+1 // 7827
A=A-1 // 7828
M=D // 7829
@3 // 7830
D=A // 7831
@SP // 7832
AM=M+1 // 7833
A=A-1 // 7834
M=D // 7835
@3 // 7836
D=A // 7837
@SP // 7838
AM=M+1 // 7839
A=A-1 // 7840
M=D // 7841
@3 // 7842
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
@Output.init.ret.40 // 7864
D=A // 7865
@CALL // 7866
0;JMP // 7867
(Output.init.ret.40)
@SP // 7868
M=M-1 // 7869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7870
D=A // 7871
@SP // 7872
AM=M+1 // 7873
A=A-1 // 7874
M=D // 7875
@28 // 7876
D=A // 7877
@SP // 7878
AM=M+1 // 7879
A=A-1 // 7880
M=D // 7881
@54 // 7882
D=A // 7883
@SP // 7884
AM=M+1 // 7885
A=A-1 // 7886
M=D // 7887
@35 // 7888
D=A // 7889
@SP // 7890
AM=M+1 // 7891
A=A-1 // 7892
M=D // 7893
@3 // 7894
D=A // 7895
@SP // 7896
AM=M+1 // 7897
A=A-1 // 7898
M=D // 7899
@59 // 7900
D=A // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=D // 7905
@51 // 7906
D=A // 7907
@SP // 7908
AM=M+1 // 7909
A=A-1 // 7910
M=D // 7911
@51 // 7912
D=A // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=D // 7917
@54 // 7918
D=A // 7919
@SP // 7920
AM=M+1 // 7921
A=A-1 // 7922
M=D // 7923
@44 // 7924
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
@Output.init.ret.41 // 7946
D=A // 7947
@CALL // 7948
0;JMP // 7949
(Output.init.ret.41)
@SP // 7950
M=M-1 // 7951

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7952
D=A // 7953
@SP // 7954
AM=M+1 // 7955
A=A-1 // 7956
M=D // 7957
@51 // 7958
D=A // 7959
@SP // 7960
AM=M+1 // 7961
A=A-1 // 7962
M=D // 7963
@51 // 7964
D=A // 7965
@SP // 7966
AM=M+1 // 7967
A=A-1 // 7968
M=D // 7969
@51 // 7970
D=A // 7971
@SP // 7972
AM=M+1 // 7973
A=A-1 // 7974
M=D // 7975
@51 // 7976
D=A // 7977
@SP // 7978
AM=M+1 // 7979
A=A-1 // 7980
M=D // 7981
@63 // 7982
D=A // 7983
@SP // 7984
AM=M+1 // 7985
A=A-1 // 7986
M=D // 7987
@51 // 7988
D=A // 7989
@SP // 7990
AM=M+1 // 7991
A=A-1 // 7992
M=D // 7993
@51 // 7994
D=A // 7995
@SP // 7996
AM=M+1 // 7997
A=A-1 // 7998
M=D // 7999
@51 // 8000
D=A // 8001
@SP // 8002
AM=M+1 // 8003
A=A-1 // 8004
M=D // 8005
@51 // 8006
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
@Output.init.ret.42 // 8028
D=A // 8029
@CALL // 8030
0;JMP // 8031
(Output.init.ret.42)
@SP // 8032
M=M-1 // 8033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8034
D=A // 8035
@SP // 8036
AM=M+1 // 8037
A=A-1 // 8038
M=D // 8039
@30 // 8040
D=A // 8041
@SP // 8042
AM=M+1 // 8043
A=A-1 // 8044
M=D // 8045
@12 // 8046
D=A // 8047
@SP // 8048
AM=M+1 // 8049
A=A-1 // 8050
M=D // 8051
@12 // 8052
D=A // 8053
@SP // 8054
AM=M+1 // 8055
A=A-1 // 8056
M=D // 8057
@12 // 8058
D=A // 8059
@SP // 8060
AM=M+1 // 8061
A=A-1 // 8062
M=D // 8063
@12 // 8064
D=A // 8065
@SP // 8066
AM=M+1 // 8067
A=A-1 // 8068
M=D // 8069
@12 // 8070
D=A // 8071
@SP // 8072
AM=M+1 // 8073
A=A-1 // 8074
M=D // 8075
@12 // 8076
D=A // 8077
@SP // 8078
AM=M+1 // 8079
A=A-1 // 8080
M=D // 8081
@12 // 8082
D=A // 8083
@SP // 8084
AM=M+1 // 8085
A=A-1 // 8086
M=D // 8087
@30 // 8088
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
@Output.init.ret.43 // 8110
D=A // 8111
@CALL // 8112
0;JMP // 8113
(Output.init.ret.43)
@SP // 8114
M=M-1 // 8115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8116
D=A // 8117
@SP // 8118
AM=M+1 // 8119
A=A-1 // 8120
M=D // 8121
@60 // 8122
D=A // 8123
@SP // 8124
AM=M+1 // 8125
A=A-1 // 8126
M=D // 8127
@24 // 8128
D=A // 8129
@SP // 8130
AM=M+1 // 8131
A=A-1 // 8132
M=D // 8133
@24 // 8134
D=A // 8135
@SP // 8136
AM=M+1 // 8137
A=A-1 // 8138
M=D // 8139
@24 // 8140
D=A // 8141
@SP // 8142
AM=M+1 // 8143
A=A-1 // 8144
M=D // 8145
@24 // 8146
D=A // 8147
@SP // 8148
AM=M+1 // 8149
A=A-1 // 8150
M=D // 8151
@24 // 8152
D=A // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=D // 8157
@27 // 8158
D=A // 8159
@SP // 8160
AM=M+1 // 8161
A=A-1 // 8162
M=D // 8163
@27 // 8164
D=A // 8165
@SP // 8166
AM=M+1 // 8167
A=A-1 // 8168
M=D // 8169
@14 // 8170
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
@Output.init.ret.44 // 8192
D=A // 8193
@CALL // 8194
0;JMP // 8195
(Output.init.ret.44)
@SP // 8196
M=M-1 // 8197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8198
D=A // 8199
@SP // 8200
AM=M+1 // 8201
A=A-1 // 8202
M=D // 8203
@51 // 8204
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
@51 // 8216
D=A // 8217
@SP // 8218
AM=M+1 // 8219
A=A-1 // 8220
M=D // 8221
@27 // 8222
D=A // 8223
@SP // 8224
AM=M+1 // 8225
A=A-1 // 8226
M=D // 8227
@15 // 8228
D=A // 8229
@SP // 8230
AM=M+1 // 8231
A=A-1 // 8232
M=D // 8233
@27 // 8234
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
@Output.init.ret.45 // 8274
D=A // 8275
@CALL // 8276
0;JMP // 8277
(Output.init.ret.45)
@SP // 8278
M=M-1 // 8279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8280
D=A // 8281
@SP // 8282
AM=M+1 // 8283
A=A-1 // 8284
M=D // 8285
@3 // 8286
D=A // 8287
@SP // 8288
AM=M+1 // 8289
A=A-1 // 8290
M=D // 8291
@3 // 8292
D=A // 8293
@SP // 8294
AM=M+1 // 8295
A=A-1 // 8296
M=D // 8297
@3 // 8298
D=A // 8299
@SP // 8300
AM=M+1 // 8301
A=A-1 // 8302
M=D // 8303
@3 // 8304
D=A // 8305
@SP // 8306
AM=M+1 // 8307
A=A-1 // 8308
M=D // 8309
@3 // 8310
D=A // 8311
@SP // 8312
AM=M+1 // 8313
A=A-1 // 8314
M=D // 8315
@3 // 8316
D=A // 8317
@SP // 8318
AM=M+1 // 8319
A=A-1 // 8320
M=D // 8321
@35 // 8322
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
@63 // 8334
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
@Output.init.ret.46 // 8356
D=A // 8357
@CALL // 8358
0;JMP // 8359
(Output.init.ret.46)
@SP // 8360
M=M-1 // 8361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 8362
D=A // 8363
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=D // 8367
@33 // 8368
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
@63 // 8380
D=A // 8381
@SP // 8382
AM=M+1 // 8383
A=A-1 // 8384
M=D // 8385
@63 // 8386
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
@51 // 8416
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
@Output.init.ret.47 // 8438
D=A // 8439
@CALL // 8440
0;JMP // 8441
(Output.init.ret.47)
@SP // 8442
M=M-1 // 8443

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449
@51 // 8450
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
@55 // 8462
D=A // 8463
@SP // 8464
AM=M+1 // 8465
A=A-1 // 8466
M=D // 8467
@55 // 8468
D=A // 8469
@SP // 8470
AM=M+1 // 8471
A=A-1 // 8472
M=D // 8473
@63 // 8474
D=A // 8475
@SP // 8476
AM=M+1 // 8477
A=A-1 // 8478
M=D // 8479
@59 // 8480
D=A // 8481
@SP // 8482
AM=M+1 // 8483
A=A-1 // 8484
M=D // 8485
@59 // 8486
D=A // 8487
@SP // 8488
AM=M+1 // 8489
A=A-1 // 8490
M=D // 8491
@51 // 8492
D=A // 8493
@SP // 8494
AM=M+1 // 8495
A=A-1 // 8496
M=D // 8497
@51 // 8498
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
@Output.init.ret.48 // 8520
D=A // 8521
@CALL // 8522
0;JMP // 8523
(Output.init.ret.48)
@SP // 8524
M=M-1 // 8525

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 8526
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
@51 // 8568
D=A // 8569
@SP // 8570
AM=M+1 // 8571
A=A-1 // 8572
M=D // 8573
@51 // 8574
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
@SP // 8586
AM=M+1 // 8587
A=A-1 // 8588
M=0 // 8589
@SP // 8590
AM=M+1 // 8591
A=A-1 // 8592
M=0 // 8593
// call Output.create
@17 // 8594
D=A // 8595
@14 // 8596
M=D // 8597
@Output.create // 8598
D=A // 8599
@13 // 8600
M=D // 8601
@Output.init.ret.49 // 8602
D=A // 8603
@CALL // 8604
0;JMP // 8605
(Output.init.ret.49)
@SP // 8606
M=M-1 // 8607

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8608
D=A // 8609
@SP // 8610
AM=M+1 // 8611
A=A-1 // 8612
M=D // 8613
@31 // 8614
D=A // 8615
@SP // 8616
AM=M+1 // 8617
A=A-1 // 8618
M=D // 8619
@51 // 8620
D=A // 8621
@SP // 8622
AM=M+1 // 8623
A=A-1 // 8624
M=D // 8625
@51 // 8626
D=A // 8627
@SP // 8628
AM=M+1 // 8629
A=A-1 // 8630
M=D // 8631
@51 // 8632
D=A // 8633
@SP // 8634
AM=M+1 // 8635
A=A-1 // 8636
M=D // 8637
@31 // 8638
D=A // 8639
@SP // 8640
AM=M+1 // 8641
A=A-1 // 8642
M=D // 8643
@3 // 8644
D=A // 8645
@SP // 8646
AM=M+1 // 8647
A=A-1 // 8648
M=D // 8649
@3 // 8650
D=A // 8651
@SP // 8652
AM=M+1 // 8653
A=A-1 // 8654
M=D // 8655
@3 // 8656
D=A // 8657
@SP // 8658
AM=M+1 // 8659
A=A-1 // 8660
M=D // 8661
@3 // 8662
D=A // 8663
@SP // 8664
AM=M+1 // 8665
A=A-1 // 8666
M=D // 8667
@SP // 8668
AM=M+1 // 8669
A=A-1 // 8670
M=0 // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=0 // 8675
// call Output.create
@17 // 8676
D=A // 8677
@14 // 8678
M=D // 8679
@Output.create // 8680
D=A // 8681
@13 // 8682
M=D // 8683
@Output.init.ret.50 // 8684
D=A // 8685
@CALL // 8686
0;JMP // 8687
(Output.init.ret.50)
@SP // 8688
M=M-1 // 8689

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 8690
D=A // 8691
@SP // 8692
AM=M+1 // 8693
A=A-1 // 8694
M=D // 8695
@30 // 8696
D=A // 8697
@SP // 8698
AM=M+1 // 8699
A=A-1 // 8700
M=D // 8701
@51 // 8702
D=A // 8703
@SP // 8704
AM=M+1 // 8705
A=A-1 // 8706
M=D // 8707
@51 // 8708
D=A // 8709
@SP // 8710
AM=M+1 // 8711
A=A-1 // 8712
M=D // 8713
@51 // 8714
D=A // 8715
@SP // 8716
AM=M+1 // 8717
A=A-1 // 8718
M=D // 8719
@51 // 8720
D=A // 8721
@SP // 8722
AM=M+1 // 8723
A=A-1 // 8724
M=D // 8725
@51 // 8726
D=A // 8727
@SP // 8728
AM=M+1 // 8729
A=A-1 // 8730
M=D // 8731
@63 // 8732
D=A // 8733
@SP // 8734
AM=M+1 // 8735
A=A-1 // 8736
M=D // 8737
@59 // 8738
D=A // 8739
@SP // 8740
AM=M+1 // 8741
A=A-1 // 8742
M=D // 8743
@30 // 8744
D=A // 8745
@SP // 8746
AM=M+1 // 8747
A=A-1 // 8748
M=D // 8749
@48 // 8750
D=A // 8751
@SP // 8752
AM=M+1 // 8753
A=A-1 // 8754
M=D // 8755
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
@Output.init.ret.51 // 8768
D=A // 8769
@CALL // 8770
0;JMP // 8771
(Output.init.ret.51)
@SP // 8772
M=M-1 // 8773

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8774
D=A // 8775
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=D // 8779
@31 // 8780
D=A // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=D // 8785
@51 // 8786
D=A // 8787
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=D // 8791
@51 // 8792
D=A // 8793
@SP // 8794
AM=M+1 // 8795
A=A-1 // 8796
M=D // 8797
@51 // 8798
D=A // 8799
@SP // 8800
AM=M+1 // 8801
A=A-1 // 8802
M=D // 8803
@31 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@27 // 8810
D=A // 8811
@SP // 8812
AM=M+1 // 8813
A=A-1 // 8814
M=D // 8815
@51 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@51 // 8822
D=A // 8823
@SP // 8824
AM=M+1 // 8825
A=A-1 // 8826
M=D // 8827
@51 // 8828
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
@Output.init.ret.52 // 8850
D=A // 8851
@CALL // 8852
0;JMP // 8853
(Output.init.ret.52)
@SP // 8854
M=M-1 // 8855

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861
@30 // 8862
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
@6 // 8880
D=A // 8881
@SP // 8882
AM=M+1 // 8883
A=A-1 // 8884
M=D // 8885
@28 // 8886
D=A // 8887
@SP // 8888
AM=M+1 // 8889
A=A-1 // 8890
M=D // 8891
@48 // 8892
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
@Output.init.ret.53 // 8932
D=A // 8933
@CALL // 8934
0;JMP // 8935
(Output.init.ret.53)
@SP // 8936
M=M-1 // 8937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8938
D=A // 8939
@SP // 8940
AM=M+1 // 8941
A=A-1 // 8942
M=D // 8943
@63 // 8944
D=A // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=D // 8949
@63 // 8950
D=A // 8951
@SP // 8952
AM=M+1 // 8953
A=A-1 // 8954
M=D // 8955
@45 // 8956
D=A // 8957
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=D // 8961
@12 // 8962
D=A // 8963
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=D // 8967
@12 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@12 // 8974
D=A // 8975
@SP // 8976
AM=M+1 // 8977
A=A-1 // 8978
M=D // 8979
@12 // 8980
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
@30 // 8992
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
@Output.init.ret.54 // 9014
D=A // 9015
@CALL // 9016
0;JMP // 9017
(Output.init.ret.54)
@SP // 9018
M=M-1 // 9019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9020
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
@51 // 9056
D=A // 9057
@SP // 9058
AM=M+1 // 9059
A=A-1 // 9060
M=D // 9061
@51 // 9062
D=A // 9063
@SP // 9064
AM=M+1 // 9065
A=A-1 // 9066
M=D // 9067
@51 // 9068
D=A // 9069
@SP // 9070
AM=M+1 // 9071
A=A-1 // 9072
M=D // 9073
@30 // 9074
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
@Output.init.ret.55 // 9096
D=A // 9097
@CALL // 9098
0;JMP // 9099
(Output.init.ret.55)
@SP // 9100
M=M-1 // 9101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9102
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
@51 // 9132
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
@12 // 9150
D=A // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=D // 9155
@12 // 9156
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
@Output.init.ret.56 // 9178
D=A // 9179
@CALL // 9180
0;JMP // 9181
(Output.init.ret.56)
@SP // 9182
M=M-1 // 9183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9184
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
@51 // 9214
D=A // 9215
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=D // 9219
@63 // 9220
D=A // 9221
@SP // 9222
AM=M+1 // 9223
A=A-1 // 9224
M=D // 9225
@63 // 9226
D=A // 9227
@SP // 9228
AM=M+1 // 9229
A=A-1 // 9230
M=D // 9231
@63 // 9232
D=A // 9233
@SP // 9234
AM=M+1 // 9235
A=A-1 // 9236
M=D // 9237
@18 // 9238
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
@Output.init.ret.57 // 9260
D=A // 9261
@CALL // 9262
0;JMP // 9263
(Output.init.ret.57)
@SP // 9264
M=M-1 // 9265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9266
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
@51 // 9278
D=A // 9279
@SP // 9280
AM=M+1 // 9281
A=A-1 // 9282
M=D // 9283
@30 // 9284
D=A // 9285
@SP // 9286
AM=M+1 // 9287
A=A-1 // 9288
M=D // 9289
@30 // 9290
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
@30 // 9302
D=A // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=D // 9307
@30 // 9308
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
@51 // 9320
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
@Output.init.ret.58 // 9342
D=A // 9343
@CALL // 9344
0;JMP // 9345
(Output.init.ret.58)
@SP // 9346
M=M-1 // 9347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 9348
D=A // 9349
@SP // 9350
AM=M+1 // 9351
A=A-1 // 9352
M=D // 9353
@51 // 9354
D=A // 9355
@SP // 9356
AM=M+1 // 9357
A=A-1 // 9358
M=D // 9359
@51 // 9360
D=A // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=D // 9365
@51 // 9366
D=A // 9367
@SP // 9368
AM=M+1 // 9369
A=A-1 // 9370
M=D // 9371
@51 // 9372
D=A // 9373
@SP // 9374
AM=M+1 // 9375
A=A-1 // 9376
M=D // 9377
@30 // 9378
D=A // 9379
@SP // 9380
AM=M+1 // 9381
A=A-1 // 9382
M=D // 9383
@12 // 9384
D=A // 9385
@SP // 9386
AM=M+1 // 9387
A=A-1 // 9388
M=D // 9389
@12 // 9390
D=A // 9391
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=D // 9395
@12 // 9396
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
@Output.init.ret.59 // 9424
D=A // 9425
@CALL // 9426
0;JMP // 9427
(Output.init.ret.59)
@SP // 9428
M=M-1 // 9429

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9430
D=A // 9431
@SP // 9432
AM=M+1 // 9433
A=A-1 // 9434
M=D // 9435
@63 // 9436
D=A // 9437
@SP // 9438
AM=M+1 // 9439
A=A-1 // 9440
M=D // 9441
@51 // 9442
D=A // 9443
@SP // 9444
AM=M+1 // 9445
A=A-1 // 9446
M=D // 9447
@49 // 9448
D=A // 9449
@SP // 9450
AM=M+1 // 9451
A=A-1 // 9452
M=D // 9453
@24 // 9454
D=A // 9455
@SP // 9456
AM=M+1 // 9457
A=A-1 // 9458
M=D // 9459
@12 // 9460
D=A // 9461
@SP // 9462
AM=M+1 // 9463
A=A-1 // 9464
M=D // 9465
@6 // 9466
D=A // 9467
@SP // 9468
AM=M+1 // 9469
A=A-1 // 9470
M=D // 9471
@35 // 9472
D=A // 9473
@SP // 9474
AM=M+1 // 9475
A=A-1 // 9476
M=D // 9477
@51 // 9478
D=A // 9479
@SP // 9480
AM=M+1 // 9481
A=A-1 // 9482
M=D // 9483
@63 // 9484
D=A // 9485
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=D // 9489
@SP // 9490
AM=M+1 // 9491
A=A-1 // 9492
M=0 // 9493
@SP // 9494
AM=M+1 // 9495
A=A-1 // 9496
M=0 // 9497
// call Output.create
@17 // 9498
D=A // 9499
@14 // 9500
M=D // 9501
@Output.create // 9502
D=A // 9503
@13 // 9504
M=D // 9505
@Output.init.ret.60 // 9506
D=A // 9507
@CALL // 9508
0;JMP // 9509
(Output.init.ret.60)
@SP // 9510
M=M-1 // 9511

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 9512
D=A // 9513
@SP // 9514
AM=M+1 // 9515
A=A-1 // 9516
M=D // 9517
@30 // 9518
D=A // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=D // 9523
@6 // 9524
D=A // 9525
@SP // 9526
AM=M+1 // 9527
A=A-1 // 9528
M=D // 9529
@6 // 9530
D=A // 9531
@SP // 9532
AM=M+1 // 9533
A=A-1 // 9534
M=D // 9535
@6 // 9536
D=A // 9537
@SP // 9538
AM=M+1 // 9539
A=A-1 // 9540
M=D // 9541
@6 // 9542
D=A // 9543
@SP // 9544
AM=M+1 // 9545
A=A-1 // 9546
M=D // 9547
@6 // 9548
D=A // 9549
@SP // 9550
AM=M+1 // 9551
A=A-1 // 9552
M=D // 9553
@6 // 9554
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
@30 // 9566
D=A // 9567
@SP // 9568
AM=M+1 // 9569
A=A-1 // 9570
M=D // 9571
@SP // 9572
AM=M+1 // 9573
A=A-1 // 9574
M=0 // 9575
@SP // 9576
AM=M+1 // 9577
A=A-1 // 9578
M=0 // 9579
// call Output.create
@17 // 9580
D=A // 9581
@14 // 9582
M=D // 9583
@Output.create // 9584
D=A // 9585
@13 // 9586
M=D // 9587
@Output.init.ret.61 // 9588
D=A // 9589
@CALL // 9590
0;JMP // 9591
(Output.init.ret.61)
@SP // 9592
M=M-1 // 9593

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9594
D=A // 9595
@SP // 9596
M=D+M // 9597
@92 // 9598
D=A // 9599
@SP // 9600
A=M-1 // 9601
M=1 // 9602
A=A-1 // 9603
M=0 // 9604
A=A-1 // 9605
M=0 // 9606
A=A-1 // 9607
M=D // 9608
A=A-1 // 9609
@3 // 9610
D=A // 9611
@SP // 9612
AM=M+1 // 9613
A=A-1 // 9614
M=D // 9615
@6 // 9616
D=A // 9617
@SP // 9618
AM=M+1 // 9619
A=A-1 // 9620
M=D // 9621
@12 // 9622
D=A // 9623
@SP // 9624
AM=M+1 // 9625
A=A-1 // 9626
M=D // 9627
@24 // 9628
D=A // 9629
@SP // 9630
AM=M+1 // 9631
A=A-1 // 9632
M=D // 9633
@48 // 9634
D=A // 9635
@SP // 9636
AM=M+1 // 9637
A=A-1 // 9638
M=D // 9639
@32 // 9640
D=A // 9641
@SP // 9642
AM=M+1 // 9643
A=A-1 // 9644
M=D // 9645
@SP // 9646
AM=M+1 // 9647
A=A-1 // 9648
M=0 // 9649
@SP // 9650
AM=M+1 // 9651
A=A-1 // 9652
M=0 // 9653
// call Output.create
@17 // 9654
D=A // 9655
@14 // 9656
M=D // 9657
@Output.create // 9658
D=A // 9659
@13 // 9660
M=D // 9661
@Output.init.ret.62 // 9662
D=A // 9663
@CALL // 9664
0;JMP // 9665
(Output.init.ret.62)
@SP // 9666
M=M-1 // 9667

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 9668
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
@24 // 9680
D=A // 9681
@SP // 9682
AM=M+1 // 9683
A=A-1 // 9684
M=D // 9685
@24 // 9686
D=A // 9687
@SP // 9688
AM=M+1 // 9689
A=A-1 // 9690
M=D // 9691
@24 // 9692
D=A // 9693
@SP // 9694
AM=M+1 // 9695
A=A-1 // 9696
M=D // 9697
@24 // 9698
D=A // 9699
@SP // 9700
AM=M+1 // 9701
A=A-1 // 9702
M=D // 9703
@24 // 9704
D=A // 9705
@SP // 9706
AM=M+1 // 9707
A=A-1 // 9708
M=D // 9709
@24 // 9710
D=A // 9711
@SP // 9712
AM=M+1 // 9713
A=A-1 // 9714
M=D // 9715
@24 // 9716
D=A // 9717
@SP // 9718
AM=M+1 // 9719
A=A-1 // 9720
M=D // 9721
@30 // 9722
D=A // 9723
@SP // 9724
AM=M+1 // 9725
A=A-1 // 9726
M=D // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=0 // 9731
@SP // 9732
AM=M+1 // 9733
A=A-1 // 9734
M=0 // 9735
// call Output.create
@17 // 9736
D=A // 9737
@14 // 9738
M=D // 9739
@Output.create // 9740
D=A // 9741
@13 // 9742
M=D // 9743
@Output.init.ret.63 // 9744
D=A // 9745
@CALL // 9746
0;JMP // 9747
(Output.init.ret.63)
@SP // 9748
M=M-1 // 9749

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 9750
D=A // 9751
@SP // 9752
AM=M+1 // 9753
A=A-1 // 9754
M=D // 9755
@8 // 9756
D=A // 9757
@SP // 9758
AM=M+1 // 9759
A=A-1 // 9760
M=D // 9761
@28 // 9762
D=A // 9763
@SP // 9764
AM=M+1 // 9765
A=A-1 // 9766
M=D // 9767
@54 // 9768
D=A // 9769
@SP // 9770
AM=M+1 // 9771
A=A-1 // 9772
M=D // 9773
@SP // 9774
AM=M+1 // 9775
A=A-1 // 9776
M=0 // 9777
@SP // 9778
AM=M+1 // 9779
A=A-1 // 9780
M=0 // 9781
@SP // 9782
AM=M+1 // 9783
A=A-1 // 9784
M=0 // 9785
@SP // 9786
AM=M+1 // 9787
A=A-1 // 9788
M=0 // 9789
@SP // 9790
AM=M+1 // 9791
A=A-1 // 9792
M=0 // 9793
@SP // 9794
AM=M+1 // 9795
A=A-1 // 9796
M=0 // 9797
@SP // 9798
AM=M+1 // 9799
A=A-1 // 9800
M=0 // 9801
@SP // 9802
AM=M+1 // 9803
A=A-1 // 9804
M=0 // 9805
// call Output.create
@17 // 9806
D=A // 9807
@14 // 9808
M=D // 9809
@Output.create // 9810
D=A // 9811
@13 // 9812
M=D // 9813
@Output.init.ret.64 // 9814
D=A // 9815
@CALL // 9816
0;JMP // 9817
(Output.init.ret.64)
@SP // 9818
M=M-1 // 9819

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9820
D=A // 9821
@SP // 9822
M=D+M // 9823
@95 // 9824
D=A // 9825
@SP // 9826
A=M-1 // 9827
M=0 // 9828
A=A-1 // 9829
M=0 // 9830
A=A-1 // 9831
M=0 // 9832
A=A-1 // 9833
M=0 // 9834
A=A-1 // 9835
M=0 // 9836
A=A-1 // 9837
M=0 // 9838
A=A-1 // 9839
M=0 // 9840
A=A-1 // 9841
M=0 // 9842
A=A-1 // 9843
M=0 // 9844
A=A-1 // 9845
M=D // 9846
A=A-1 // 9847
@2 // 9848
D=A // 9849
@SP // 9850
M=D+M // 9851
@63 // 9852
D=A // 9853
@SP // 9854
A=M-1 // 9855
M=0 // 9856
A=A-1 // 9857
M=D // 9858
A=A-1 // 9859
// call Output.create
@17 // 9860
D=A // 9861
@14 // 9862
M=D // 9863
@Output.create // 9864
D=A // 9865
@13 // 9866
M=D // 9867
@Output.init.ret.65 // 9868
D=A // 9869
@CALL // 9870
0;JMP // 9871
(Output.init.ret.65)
@SP // 9872
M=M-1 // 9873

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9874
D=A // 9875
@SP // 9876
AM=M+1 // 9877
A=A-1 // 9878
M=D // 9879
@6 // 9880
D=A // 9881
@SP // 9882
AM=M+1 // 9883
A=A-1 // 9884
M=D // 9885
@12 // 9886
D=A // 9887
@SP // 9888
AM=M+1 // 9889
A=A-1 // 9890
M=D // 9891
@24 // 9892
D=A // 9893
@SP // 9894
AM=M+1 // 9895
A=A-1 // 9896
M=D // 9897
@SP // 9898
AM=M+1 // 9899
A=A-1 // 9900
M=0 // 9901
@SP // 9902
AM=M+1 // 9903
A=A-1 // 9904
M=0 // 9905
@SP // 9906
AM=M+1 // 9907
A=A-1 // 9908
M=0 // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=0 // 9913
@SP // 9914
AM=M+1 // 9915
A=A-1 // 9916
M=0 // 9917
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=0 // 9921
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
@Output.init.ret.66 // 9938
D=A // 9939
@CALL // 9940
0;JMP // 9941
(Output.init.ret.66)
@SP // 9942
M=M-1 // 9943

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9944
D=A // 9945
@SP // 9946
M=D+M // 9947
@97 // 9948
D=A // 9949
@SP // 9950
A=M-1 // 9951
M=0 // 9952
A=A-1 // 9953
M=0 // 9954
A=A-1 // 9955
M=0 // 9956
A=A-1 // 9957
M=D // 9958
A=A-1 // 9959
@14 // 9960
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
@30 // 9972
D=A // 9973
@SP // 9974
AM=M+1 // 9975
A=A-1 // 9976
M=D // 9977
@27 // 9978
D=A // 9979
@SP // 9980
AM=M+1 // 9981
A=A-1 // 9982
M=D // 9983
@27 // 9984
D=A // 9985
@SP // 9986
AM=M+1 // 9987
A=A-1 // 9988
M=D // 9989
@54 // 9990
D=A // 9991
@SP // 9992
AM=M+1 // 9993
A=A-1 // 9994
M=D // 9995
@SP // 9996
AM=M+1 // 9997
A=A-1 // 9998
M=0 // 9999
@SP // 10000
AM=M+1 // 10001
A=A-1 // 10002
M=0 // 10003
// call Output.create
@17 // 10004
D=A // 10005
@14 // 10006
M=D // 10007
@Output.create // 10008
D=A // 10009
@13 // 10010
M=D // 10011
@Output.init.ret.67 // 10012
D=A // 10013
@CALL // 10014
0;JMP // 10015
(Output.init.ret.67)
@SP // 10016
M=M-1 // 10017

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10018
D=A // 10019
@SP // 10020
AM=M+1 // 10021
A=A-1 // 10022
M=D // 10023
@3 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029
@3 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035
@3 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041
@15 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047
@27 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053
@51 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059
@51 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065
@51 // 10066
D=A // 10067
@SP // 10068
AM=M+1 // 10069
A=A-1 // 10070
M=D // 10071
@30 // 10072
D=A // 10073
@SP // 10074
AM=M+1 // 10075
A=A-1 // 10076
M=D // 10077
@SP // 10078
AM=M+1 // 10079
A=A-1 // 10080
M=0 // 10081
@SP // 10082
AM=M+1 // 10083
A=A-1 // 10084
M=0 // 10085
// call Output.create
@17 // 10086
D=A // 10087
@14 // 10088
M=D // 10089
@Output.create // 10090
D=A // 10091
@13 // 10092
M=D // 10093
@Output.init.ret.68 // 10094
D=A // 10095
@CALL // 10096
0;JMP // 10097
(Output.init.ret.68)
@SP // 10098
M=M-1 // 10099

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10100
D=A // 10101
@SP // 10102
M=D+M // 10103
@99 // 10104
D=A // 10105
@SP // 10106
A=M-1 // 10107
M=0 // 10108
A=A-1 // 10109
M=0 // 10110
A=A-1 // 10111
M=0 // 10112
A=A-1 // 10113
M=D // 10114
A=A-1 // 10115
@30 // 10116
D=A // 10117
@SP // 10118
AM=M+1 // 10119
A=A-1 // 10120
M=D // 10121
@51 // 10122
D=A // 10123
@SP // 10124
AM=M+1 // 10125
A=A-1 // 10126
M=D // 10127
@3 // 10128
D=A // 10129
@SP // 10130
AM=M+1 // 10131
A=A-1 // 10132
M=D // 10133
@3 // 10134
D=A // 10135
@SP // 10136
AM=M+1 // 10137
A=A-1 // 10138
M=D // 10139
@51 // 10140
D=A // 10141
@SP // 10142
AM=M+1 // 10143
A=A-1 // 10144
M=D // 10145
@30 // 10146
D=A // 10147
@SP // 10148
AM=M+1 // 10149
A=A-1 // 10150
M=D // 10151
@SP // 10152
AM=M+1 // 10153
A=A-1 // 10154
M=0 // 10155
@SP // 10156
AM=M+1 // 10157
A=A-1 // 10158
M=0 // 10159
// call Output.create
@17 // 10160
D=A // 10161
@14 // 10162
M=D // 10163
@Output.create // 10164
D=A // 10165
@13 // 10166
M=D // 10167
@Output.init.ret.69 // 10168
D=A // 10169
@CALL // 10170
0;JMP // 10171
(Output.init.ret.69)
@SP // 10172
M=M-1 // 10173

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10174
D=A // 10175
@SP // 10176
AM=M+1 // 10177
A=A-1 // 10178
M=D // 10179
@48 // 10180
D=A // 10181
@SP // 10182
AM=M+1 // 10183
A=A-1 // 10184
M=D // 10185
@48 // 10186
D=A // 10187
@SP // 10188
AM=M+1 // 10189
A=A-1 // 10190
M=D // 10191
@48 // 10192
D=A // 10193
@SP // 10194
AM=M+1 // 10195
A=A-1 // 10196
M=D // 10197
@60 // 10198
D=A // 10199
@SP // 10200
AM=M+1 // 10201
A=A-1 // 10202
M=D // 10203
@54 // 10204
D=A // 10205
@SP // 10206
AM=M+1 // 10207
A=A-1 // 10208
M=D // 10209
@51 // 10210
D=A // 10211
@SP // 10212
AM=M+1 // 10213
A=A-1 // 10214
M=D // 10215
@51 // 10216
D=A // 10217
@SP // 10218
AM=M+1 // 10219
A=A-1 // 10220
M=D // 10221
@51 // 10222
D=A // 10223
@SP // 10224
AM=M+1 // 10225
A=A-1 // 10226
M=D // 10227
@30 // 10228
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
// call Output.create
@17 // 10242
D=A // 10243
@14 // 10244
M=D // 10245
@Output.create // 10246
D=A // 10247
@13 // 10248
M=D // 10249
@Output.init.ret.70 // 10250
D=A // 10251
@CALL // 10252
0;JMP // 10253
(Output.init.ret.70)
@SP // 10254
M=M-1 // 10255

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10256
D=A // 10257
@SP // 10258
M=D+M // 10259
@101 // 10260
D=A // 10261
@SP // 10262
A=M-1 // 10263
M=0 // 10264
A=A-1 // 10265
M=0 // 10266
A=A-1 // 10267
M=0 // 10268
A=A-1 // 10269
M=D // 10270
A=A-1 // 10271
@30 // 10272
D=A // 10273
@SP // 10274
AM=M+1 // 10275
A=A-1 // 10276
M=D // 10277
@51 // 10278
D=A // 10279
@SP // 10280
AM=M+1 // 10281
A=A-1 // 10282
M=D // 10283
@63 // 10284
D=A // 10285
@SP // 10286
AM=M+1 // 10287
A=A-1 // 10288
M=D // 10289
@3 // 10290
D=A // 10291
@SP // 10292
AM=M+1 // 10293
A=A-1 // 10294
M=D // 10295
@51 // 10296
D=A // 10297
@SP // 10298
AM=M+1 // 10299
A=A-1 // 10300
M=D // 10301
@30 // 10302
D=A // 10303
@SP // 10304
AM=M+1 // 10305
A=A-1 // 10306
M=D // 10307
@SP // 10308
AM=M+1 // 10309
A=A-1 // 10310
M=0 // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=0 // 10315
// call Output.create
@17 // 10316
D=A // 10317
@14 // 10318
M=D // 10319
@Output.create // 10320
D=A // 10321
@13 // 10322
M=D // 10323
@Output.init.ret.71 // 10324
D=A // 10325
@CALL // 10326
0;JMP // 10327
(Output.init.ret.71)
@SP // 10328
M=M-1 // 10329

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 10330
D=A // 10331
@SP // 10332
AM=M+1 // 10333
A=A-1 // 10334
M=D // 10335
@28 // 10336
D=A // 10337
@SP // 10338
AM=M+1 // 10339
A=A-1 // 10340
M=D // 10341
@54 // 10342
D=A // 10343
@SP // 10344
AM=M+1 // 10345
A=A-1 // 10346
M=D // 10347
@38 // 10348
D=A // 10349
@SP // 10350
AM=M+1 // 10351
A=A-1 // 10352
M=D // 10353
@6 // 10354
D=A // 10355
@SP // 10356
AM=M+1 // 10357
A=A-1 // 10358
M=D // 10359
@15 // 10360
D=A // 10361
@SP // 10362
AM=M+1 // 10363
A=A-1 // 10364
M=D // 10365
@6 // 10366
D=A // 10367
@SP // 10368
AM=M+1 // 10369
A=A-1 // 10370
M=D // 10371
@6 // 10372
D=A // 10373
@SP // 10374
AM=M+1 // 10375
A=A-1 // 10376
M=D // 10377
@6 // 10378
D=A // 10379
@SP // 10380
AM=M+1 // 10381
A=A-1 // 10382
M=D // 10383
@15 // 10384
D=A // 10385
@SP // 10386
AM=M+1 // 10387
A=A-1 // 10388
M=D // 10389
@SP // 10390
AM=M+1 // 10391
A=A-1 // 10392
M=0 // 10393
@SP // 10394
AM=M+1 // 10395
A=A-1 // 10396
M=0 // 10397
// call Output.create
@17 // 10398
D=A // 10399
@14 // 10400
M=D // 10401
@Output.create // 10402
D=A // 10403
@13 // 10404
M=D // 10405
@Output.init.ret.72 // 10406
D=A // 10407
@CALL // 10408
0;JMP // 10409
(Output.init.ret.72)
@SP // 10410
M=M-1 // 10411

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 10412
D=A // 10413
@SP // 10414
M=D+M // 10415
@103 // 10416
D=A // 10417
@SP // 10418
A=M-1 // 10419
M=0 // 10420
A=A-1 // 10421
M=0 // 10422
A=A-1 // 10423
M=D // 10424
A=A-1 // 10425
@30 // 10426
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
@51 // 10444
D=A // 10445
@SP // 10446
AM=M+1 // 10447
A=A-1 // 10448
M=D // 10449
@62 // 10450
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
@51 // 10462
D=A // 10463
@SP // 10464
AM=M+1 // 10465
A=A-1 // 10466
M=D // 10467
@30 // 10468
D=A // 10469
@SP // 10470
AM=M+1 // 10471
A=A-1 // 10472
M=D // 10473
@SP // 10474
AM=M+1 // 10475
A=A-1 // 10476
M=0 // 10477
// call Output.create
@17 // 10478
D=A // 10479
@14 // 10480
M=D // 10481
@Output.create // 10482
D=A // 10483
@13 // 10484
M=D // 10485
@Output.init.ret.73 // 10486
D=A // 10487
@CALL // 10488
0;JMP // 10489
(Output.init.ret.73)
@SP // 10490
M=M-1 // 10491

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 10492
D=A // 10493
@SP // 10494
AM=M+1 // 10495
A=A-1 // 10496
M=D // 10497
@3 // 10498
D=A // 10499
@SP // 10500
AM=M+1 // 10501
A=A-1 // 10502
M=D // 10503
@3 // 10504
D=A // 10505
@SP // 10506
AM=M+1 // 10507
A=A-1 // 10508
M=D // 10509
@3 // 10510
D=A // 10511
@SP // 10512
AM=M+1 // 10513
A=A-1 // 10514
M=D // 10515
@27 // 10516
D=A // 10517
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=D // 10521
@55 // 10522
D=A // 10523
@SP // 10524
AM=M+1 // 10525
A=A-1 // 10526
M=D // 10527
@51 // 10528
D=A // 10529
@SP // 10530
AM=M+1 // 10531
A=A-1 // 10532
M=D // 10533
@51 // 10534
D=A // 10535
@SP // 10536
AM=M+1 // 10537
A=A-1 // 10538
M=D // 10539
@51 // 10540
D=A // 10541
@SP // 10542
AM=M+1 // 10543
A=A-1 // 10544
M=D // 10545
@51 // 10546
D=A // 10547
@SP // 10548
AM=M+1 // 10549
A=A-1 // 10550
M=D // 10551
@SP // 10552
AM=M+1 // 10553
A=A-1 // 10554
M=0 // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=0 // 10559
// call Output.create
@17 // 10560
D=A // 10561
@14 // 10562
M=D // 10563
@Output.create // 10564
D=A // 10565
@13 // 10566
M=D // 10567
@Output.init.ret.74 // 10568
D=A // 10569
@CALL // 10570
0;JMP // 10571
(Output.init.ret.74)
@SP // 10572
M=M-1 // 10573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 10574
D=A // 10575
@SP // 10576
AM=M+1 // 10577
A=A-1 // 10578
M=D // 10579
@12 // 10580
D=A // 10581
@SP // 10582
AM=M+1 // 10583
A=A-1 // 10584
M=D // 10585
@12 // 10586
D=A // 10587
@SP // 10588
AM=M+1 // 10589
A=A-1 // 10590
M=D // 10591
@SP // 10592
AM=M+1 // 10593
A=A-1 // 10594
M=0 // 10595
@14 // 10596
D=A // 10597
@SP // 10598
AM=M+1 // 10599
A=A-1 // 10600
M=D // 10601
@12 // 10602
D=A // 10603
@SP // 10604
AM=M+1 // 10605
A=A-1 // 10606
M=D // 10607
@12 // 10608
D=A // 10609
@SP // 10610
AM=M+1 // 10611
A=A-1 // 10612
M=D // 10613
@12 // 10614
D=A // 10615
@SP // 10616
AM=M+1 // 10617
A=A-1 // 10618
M=D // 10619
@12 // 10620
D=A // 10621
@SP // 10622
AM=M+1 // 10623
A=A-1 // 10624
M=D // 10625
@30 // 10626
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
@Output.init.ret.75 // 10648
D=A // 10649
@CALL // 10650
0;JMP // 10651
(Output.init.ret.75)
@SP // 10652
M=M-1 // 10653

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10654
D=A // 10655
@SP // 10656
AM=M+1 // 10657
A=A-1 // 10658
M=D // 10659
@48 // 10660
D=A // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=D // 10665
@48 // 10666
D=A // 10667
@SP // 10668
AM=M+1 // 10669
A=A-1 // 10670
M=D // 10671
@SP // 10672
AM=M+1 // 10673
A=A-1 // 10674
M=0 // 10675
@56 // 10676
D=A // 10677
@SP // 10678
AM=M+1 // 10679
A=A-1 // 10680
M=D // 10681
@48 // 10682
D=A // 10683
@SP // 10684
AM=M+1 // 10685
A=A-1 // 10686
M=D // 10687
@48 // 10688
D=A // 10689
@SP // 10690
AM=M+1 // 10691
A=A-1 // 10692
M=D // 10693
@48 // 10694
D=A // 10695
@SP // 10696
AM=M+1 // 10697
A=A-1 // 10698
M=D // 10699
@48 // 10700
D=A // 10701
@SP // 10702
AM=M+1 // 10703
A=A-1 // 10704
M=D // 10705
@51 // 10706
D=A // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=D // 10711
@30 // 10712
D=A // 10713
@SP // 10714
AM=M+1 // 10715
A=A-1 // 10716
M=D // 10717
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
@Output.init.ret.76 // 10730
D=A // 10731
@CALL // 10732
0;JMP // 10733
(Output.init.ret.76)
@SP // 10734
M=M-1 // 10735

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 10736
D=A // 10737
@SP // 10738
AM=M+1 // 10739
A=A-1 // 10740
M=D // 10741
@3 // 10742
D=A // 10743
@SP // 10744
AM=M+1 // 10745
A=A-1 // 10746
M=D // 10747
@3 // 10748
D=A // 10749
@SP // 10750
AM=M+1 // 10751
A=A-1 // 10752
M=D // 10753
@3 // 10754
D=A // 10755
@SP // 10756
AM=M+1 // 10757
A=A-1 // 10758
M=D // 10759
@51 // 10760
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
@15 // 10772
D=A // 10773
@SP // 10774
AM=M+1 // 10775
A=A-1 // 10776
M=D // 10777
@15 // 10778
D=A // 10779
@SP // 10780
AM=M+1 // 10781
A=A-1 // 10782
M=D // 10783
@27 // 10784
D=A // 10785
@SP // 10786
AM=M+1 // 10787
A=A-1 // 10788
M=D // 10789
@51 // 10790
D=A // 10791
@SP // 10792
AM=M+1 // 10793
A=A-1 // 10794
M=D // 10795
@SP // 10796
AM=M+1 // 10797
A=A-1 // 10798
M=0 // 10799
@SP // 10800
AM=M+1 // 10801
A=A-1 // 10802
M=0 // 10803
// call Output.create
@17 // 10804
D=A // 10805
@14 // 10806
M=D // 10807
@Output.create // 10808
D=A // 10809
@13 // 10810
M=D // 10811
@Output.init.ret.77 // 10812
D=A // 10813
@CALL // 10814
0;JMP // 10815
(Output.init.ret.77)
@SP // 10816
M=M-1 // 10817

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10818
D=A // 10819
@SP // 10820
AM=M+1 // 10821
A=A-1 // 10822
M=D // 10823
@14 // 10824
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
@12 // 10836
D=A // 10837
@SP // 10838
AM=M+1 // 10839
A=A-1 // 10840
M=D // 10841
@12 // 10842
D=A // 10843
@SP // 10844
AM=M+1 // 10845
A=A-1 // 10846
M=D // 10847
@12 // 10848
D=A // 10849
@SP // 10850
AM=M+1 // 10851
A=A-1 // 10852
M=D // 10853
@12 // 10854
D=A // 10855
@SP // 10856
AM=M+1 // 10857
A=A-1 // 10858
M=D // 10859
@12 // 10860
D=A // 10861
@SP // 10862
AM=M+1 // 10863
A=A-1 // 10864
M=D // 10865
@12 // 10866
D=A // 10867
@SP // 10868
AM=M+1 // 10869
A=A-1 // 10870
M=D // 10871
@30 // 10872
D=A // 10873
@SP // 10874
AM=M+1 // 10875
A=A-1 // 10876
M=D // 10877
@SP // 10878
AM=M+1 // 10879
A=A-1 // 10880
M=0 // 10881
@SP // 10882
AM=M+1 // 10883
A=A-1 // 10884
M=0 // 10885
// call Output.create
@17 // 10886
D=A // 10887
@14 // 10888
M=D // 10889
@Output.create // 10890
D=A // 10891
@13 // 10892
M=D // 10893
@Output.init.ret.78 // 10894
D=A // 10895
@CALL // 10896
0;JMP // 10897
(Output.init.ret.78)
@SP // 10898
M=M-1 // 10899

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10900
D=A // 10901
@SP // 10902
M=D+M // 10903
@109 // 10904
D=A // 10905
@SP // 10906
A=M-1 // 10907
M=0 // 10908
A=A-1 // 10909
M=0 // 10910
A=A-1 // 10911
M=0 // 10912
A=A-1 // 10913
M=D // 10914
A=A-1 // 10915
@29 // 10916
D=A // 10917
@SP // 10918
AM=M+1 // 10919
A=A-1 // 10920
M=D // 10921
@63 // 10922
D=A // 10923
@SP // 10924
AM=M+1 // 10925
A=A-1 // 10926
M=D // 10927
@43 // 10928
D=A // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=D // 10933
@43 // 10934
D=A // 10935
@SP // 10936
AM=M+1 // 10937
A=A-1 // 10938
M=D // 10939
@43 // 10940
D=A // 10941
@SP // 10942
AM=M+1 // 10943
A=A-1 // 10944
M=D // 10945
@43 // 10946
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
// call Output.create
@17 // 10960
D=A // 10961
@14 // 10962
M=D // 10963
@Output.create // 10964
D=A // 10965
@13 // 10966
M=D // 10967
@Output.init.ret.79 // 10968
D=A // 10969
@CALL // 10970
0;JMP // 10971
(Output.init.ret.79)
@SP // 10972
M=M-1 // 10973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10974
D=A // 10975
@SP // 10976
M=D+M // 10977
@110 // 10978
D=A // 10979
@SP // 10980
A=M-1 // 10981
M=0 // 10982
A=A-1 // 10983
M=0 // 10984
A=A-1 // 10985
M=0 // 10986
A=A-1 // 10987
M=D // 10988
A=A-1 // 10989
@29 // 10990
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
@51 // 11002
D=A // 11003
@SP // 11004
AM=M+1 // 11005
A=A-1 // 11006
M=D // 11007
@51 // 11008
D=A // 11009
@SP // 11010
AM=M+1 // 11011
A=A-1 // 11012
M=D // 11013
@51 // 11014
D=A // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=D // 11019
@51 // 11020
D=A // 11021
@SP // 11022
AM=M+1 // 11023
A=A-1 // 11024
M=D // 11025
@SP // 11026
AM=M+1 // 11027
A=A-1 // 11028
M=0 // 11029
@SP // 11030
AM=M+1 // 11031
A=A-1 // 11032
M=0 // 11033
// call Output.create
@17 // 11034
D=A // 11035
@14 // 11036
M=D // 11037
@Output.create // 11038
D=A // 11039
@13 // 11040
M=D // 11041
@Output.init.ret.80 // 11042
D=A // 11043
@CALL // 11044
0;JMP // 11045
(Output.init.ret.80)
@SP // 11046
M=M-1 // 11047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11048
D=A // 11049
@SP // 11050
M=D+M // 11051
@111 // 11052
D=A // 11053
@SP // 11054
A=M-1 // 11055
M=0 // 11056
A=A-1 // 11057
M=0 // 11058
A=A-1 // 11059
M=0 // 11060
A=A-1 // 11061
M=D // 11062
A=A-1 // 11063
@30 // 11064
D=A // 11065
@SP // 11066
AM=M+1 // 11067
A=A-1 // 11068
M=D // 11069
@51 // 11070
D=A // 11071
@SP // 11072
AM=M+1 // 11073
A=A-1 // 11074
M=D // 11075
@51 // 11076
D=A // 11077
@SP // 11078
AM=M+1 // 11079
A=A-1 // 11080
M=D // 11081
@51 // 11082
D=A // 11083
@SP // 11084
AM=M+1 // 11085
A=A-1 // 11086
M=D // 11087
@51 // 11088
D=A // 11089
@SP // 11090
AM=M+1 // 11091
A=A-1 // 11092
M=D // 11093
@30 // 11094
D=A // 11095
@SP // 11096
AM=M+1 // 11097
A=A-1 // 11098
M=D // 11099
@SP // 11100
AM=M+1 // 11101
A=A-1 // 11102
M=0 // 11103
@SP // 11104
AM=M+1 // 11105
A=A-1 // 11106
M=0 // 11107
// call Output.create
@17 // 11108
D=A // 11109
@14 // 11110
M=D // 11111
@Output.create // 11112
D=A // 11113
@13 // 11114
M=D // 11115
@Output.init.ret.81 // 11116
D=A // 11117
@CALL // 11118
0;JMP // 11119
(Output.init.ret.81)
@SP // 11120
M=M-1 // 11121

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11122
D=A // 11123
@SP // 11124
M=D+M // 11125
@112 // 11126
D=A // 11127
@SP // 11128
A=M-1 // 11129
M=0 // 11130
A=A-1 // 11131
M=0 // 11132
A=A-1 // 11133
M=0 // 11134
A=A-1 // 11135
M=D // 11136
A=A-1 // 11137
@30 // 11138
D=A // 11139
@SP // 11140
AM=M+1 // 11141
A=A-1 // 11142
M=D // 11143
@51 // 11144
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
@51 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@31 // 11162
D=A // 11163
@SP // 11164
AM=M+1 // 11165
A=A-1 // 11166
M=D // 11167
@3 // 11168
D=A // 11169
@SP // 11170
AM=M+1 // 11171
A=A-1 // 11172
M=D // 11173
@3 // 11174
D=A // 11175
@SP // 11176
AM=M+1 // 11177
A=A-1 // 11178
M=D // 11179
@SP // 11180
AM=M+1 // 11181
A=A-1 // 11182
M=0 // 11183
// call Output.create
@17 // 11184
D=A // 11185
@14 // 11186
M=D // 11187
@Output.create // 11188
D=A // 11189
@13 // 11190
M=D // 11191
@Output.init.ret.82 // 11192
D=A // 11193
@CALL // 11194
0;JMP // 11195
(Output.init.ret.82)
@SP // 11196
M=M-1 // 11197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11198
D=A // 11199
@SP // 11200
M=D+M // 11201
@113 // 11202
D=A // 11203
@SP // 11204
A=M-1 // 11205
M=0 // 11206
A=A-1 // 11207
M=0 // 11208
A=A-1 // 11209
M=0 // 11210
A=A-1 // 11211
M=D // 11212
A=A-1 // 11213
@30 // 11214
D=A // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=D // 11219
@51 // 11220
D=A // 11221
@SP // 11222
AM=M+1 // 11223
A=A-1 // 11224
M=D // 11225
@51 // 11226
D=A // 11227
@SP // 11228
AM=M+1 // 11229
A=A-1 // 11230
M=D // 11231
@51 // 11232
D=A // 11233
@SP // 11234
AM=M+1 // 11235
A=A-1 // 11236
M=D // 11237
@62 // 11238
D=A // 11239
@SP // 11240
AM=M+1 // 11241
A=A-1 // 11242
M=D // 11243
@48 // 11244
D=A // 11245
@SP // 11246
AM=M+1 // 11247
A=A-1 // 11248
M=D // 11249
@48 // 11250
D=A // 11251
@SP // 11252
AM=M+1 // 11253
A=A-1 // 11254
M=D // 11255
@SP // 11256
AM=M+1 // 11257
A=A-1 // 11258
M=0 // 11259
// call Output.create
@17 // 11260
D=A // 11261
@14 // 11262
M=D // 11263
@Output.create // 11264
D=A // 11265
@13 // 11266
M=D // 11267
@Output.init.ret.83 // 11268
D=A // 11269
@CALL // 11270
0;JMP // 11271
(Output.init.ret.83)
@SP // 11272
M=M-1 // 11273

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11274
D=A // 11275
@SP // 11276
M=D+M // 11277
@114 // 11278
D=A // 11279
@SP // 11280
A=M-1 // 11281
M=0 // 11282
A=A-1 // 11283
M=0 // 11284
A=A-1 // 11285
M=0 // 11286
A=A-1 // 11287
M=D // 11288
A=A-1 // 11289
@29 // 11290
D=A // 11291
@SP // 11292
AM=M+1 // 11293
A=A-1 // 11294
M=D // 11295
@55 // 11296
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
@3 // 11308
D=A // 11309
@SP // 11310
AM=M+1 // 11311
A=A-1 // 11312
M=D // 11313
@3 // 11314
D=A // 11315
@SP // 11316
AM=M+1 // 11317
A=A-1 // 11318
M=D // 11319
@7 // 11320
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
@Output.init.ret.84 // 11342
D=A // 11343
@CALL // 11344
0;JMP // 11345
(Output.init.ret.84)
@SP // 11346
M=M-1 // 11347

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11348
D=A // 11349
@SP // 11350
M=D+M // 11351
@115 // 11352
D=A // 11353
@SP // 11354
A=M-1 // 11355
M=0 // 11356
A=A-1 // 11357
M=0 // 11358
A=A-1 // 11359
M=0 // 11360
A=A-1 // 11361
M=D // 11362
A=A-1 // 11363
@30 // 11364
D=A // 11365
@SP // 11366
AM=M+1 // 11367
A=A-1 // 11368
M=D // 11369
@51 // 11370
D=A // 11371
@SP // 11372
AM=M+1 // 11373
A=A-1 // 11374
M=D // 11375
@6 // 11376
D=A // 11377
@SP // 11378
AM=M+1 // 11379
A=A-1 // 11380
M=D // 11381
@24 // 11382
D=A // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=D // 11387
@51 // 11388
D=A // 11389
@SP // 11390
AM=M+1 // 11391
A=A-1 // 11392
M=D // 11393
@30 // 11394
D=A // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=D // 11399
@SP // 11400
AM=M+1 // 11401
A=A-1 // 11402
M=0 // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=0 // 11407
// call Output.create
@17 // 11408
D=A // 11409
@14 // 11410
M=D // 11411
@Output.create // 11412
D=A // 11413
@13 // 11414
M=D // 11415
@Output.init.ret.85 // 11416
D=A // 11417
@CALL // 11418
0;JMP // 11419
(Output.init.ret.85)
@SP // 11420
M=M-1 // 11421

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11422
D=A // 11423
@SP // 11424
AM=M+1 // 11425
A=A-1 // 11426
M=D // 11427
@4 // 11428
D=A // 11429
@SP // 11430
AM=M+1 // 11431
A=A-1 // 11432
M=D // 11433
@6 // 11434
D=A // 11435
@SP // 11436
AM=M+1 // 11437
A=A-1 // 11438
M=D // 11439
@6 // 11440
D=A // 11441
@SP // 11442
AM=M+1 // 11443
A=A-1 // 11444
M=D // 11445
@15 // 11446
D=A // 11447
@SP // 11448
AM=M+1 // 11449
A=A-1 // 11450
M=D // 11451
@6 // 11452
D=A // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=D // 11457
@6 // 11458
D=A // 11459
@SP // 11460
AM=M+1 // 11461
A=A-1 // 11462
M=D // 11463
@6 // 11464
D=A // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=D // 11469
@54 // 11470
D=A // 11471
@SP // 11472
AM=M+1 // 11473
A=A-1 // 11474
M=D // 11475
@28 // 11476
D=A // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=D // 11481
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=0 // 11485
@SP // 11486
AM=M+1 // 11487
A=A-1 // 11488
M=0 // 11489
// call Output.create
@17 // 11490
D=A // 11491
@14 // 11492
M=D // 11493
@Output.create // 11494
D=A // 11495
@13 // 11496
M=D // 11497
@Output.init.ret.86 // 11498
D=A // 11499
@CALL // 11500
0;JMP // 11501
(Output.init.ret.86)
@SP // 11502
M=M-1 // 11503

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11504
D=A // 11505
@SP // 11506
M=D+M // 11507
@117 // 11508
D=A // 11509
@SP // 11510
A=M-1 // 11511
M=0 // 11512
A=A-1 // 11513
M=0 // 11514
A=A-1 // 11515
M=0 // 11516
A=A-1 // 11517
M=D // 11518
A=A-1 // 11519
@27 // 11520
D=A // 11521
@SP // 11522
AM=M+1 // 11523
A=A-1 // 11524
M=D // 11525
@27 // 11526
D=A // 11527
@SP // 11528
AM=M+1 // 11529
A=A-1 // 11530
M=D // 11531
@27 // 11532
D=A // 11533
@SP // 11534
AM=M+1 // 11535
A=A-1 // 11536
M=D // 11537
@27 // 11538
D=A // 11539
@SP // 11540
AM=M+1 // 11541
A=A-1 // 11542
M=D // 11543
@27 // 11544
D=A // 11545
@SP // 11546
AM=M+1 // 11547
A=A-1 // 11548
M=D // 11549
@54 // 11550
D=A // 11551
@SP // 11552
AM=M+1 // 11553
A=A-1 // 11554
M=D // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=0 // 11559
@SP // 11560
AM=M+1 // 11561
A=A-1 // 11562
M=0 // 11563
// call Output.create
@17 // 11564
D=A // 11565
@14 // 11566
M=D // 11567
@Output.create // 11568
D=A // 11569
@13 // 11570
M=D // 11571
@Output.init.ret.87 // 11572
D=A // 11573
@CALL // 11574
0;JMP // 11575
(Output.init.ret.87)
@SP // 11576
M=M-1 // 11577

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11578
D=A // 11579
@SP // 11580
M=D+M // 11581
@118 // 11582
D=A // 11583
@SP // 11584
A=M-1 // 11585
M=0 // 11586
A=A-1 // 11587
M=0 // 11588
A=A-1 // 11589
M=0 // 11590
A=A-1 // 11591
M=D // 11592
A=A-1 // 11593
@51 // 11594
D=A // 11595
@SP // 11596
AM=M+1 // 11597
A=A-1 // 11598
M=D // 11599
@51 // 11600
D=A // 11601
@SP // 11602
AM=M+1 // 11603
A=A-1 // 11604
M=D // 11605
@51 // 11606
D=A // 11607
@SP // 11608
AM=M+1 // 11609
A=A-1 // 11610
M=D // 11611
@51 // 11612
D=A // 11613
@SP // 11614
AM=M+1 // 11615
A=A-1 // 11616
M=D // 11617
@30 // 11618
D=A // 11619
@SP // 11620
AM=M+1 // 11621
A=A-1 // 11622
M=D // 11623
@12 // 11624
D=A // 11625
@SP // 11626
AM=M+1 // 11627
A=A-1 // 11628
M=D // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=0 // 11633
@SP // 11634
AM=M+1 // 11635
A=A-1 // 11636
M=0 // 11637
// call Output.create
@17 // 11638
D=A // 11639
@14 // 11640
M=D // 11641
@Output.create // 11642
D=A // 11643
@13 // 11644
M=D // 11645
@Output.init.ret.88 // 11646
D=A // 11647
@CALL // 11648
0;JMP // 11649
(Output.init.ret.88)
@SP // 11650
M=M-1 // 11651

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11652
D=A // 11653
@SP // 11654
M=D+M // 11655
@119 // 11656
D=A // 11657
@SP // 11658
A=M-1 // 11659
M=0 // 11660
A=A-1 // 11661
M=0 // 11662
A=A-1 // 11663
M=0 // 11664
A=A-1 // 11665
M=D // 11666
A=A-1 // 11667
@51 // 11668
D=A // 11669
@SP // 11670
AM=M+1 // 11671
A=A-1 // 11672
M=D // 11673
@51 // 11674
D=A // 11675
@SP // 11676
AM=M+1 // 11677
A=A-1 // 11678
M=D // 11679
@51 // 11680
D=A // 11681
@SP // 11682
AM=M+1 // 11683
A=A-1 // 11684
M=D // 11685
@63 // 11686
D=A // 11687
@SP // 11688
AM=M+1 // 11689
A=A-1 // 11690
M=D // 11691
@63 // 11692
D=A // 11693
@SP // 11694
AM=M+1 // 11695
A=A-1 // 11696
M=D // 11697
@18 // 11698
D=A // 11699
@SP // 11700
AM=M+1 // 11701
A=A-1 // 11702
M=D // 11703
@SP // 11704
AM=M+1 // 11705
A=A-1 // 11706
M=0 // 11707
@SP // 11708
AM=M+1 // 11709
A=A-1 // 11710
M=0 // 11711
// call Output.create
@17 // 11712
D=A // 11713
@14 // 11714
M=D // 11715
@Output.create // 11716
D=A // 11717
@13 // 11718
M=D // 11719
@Output.init.ret.89 // 11720
D=A // 11721
@CALL // 11722
0;JMP // 11723
(Output.init.ret.89)
@SP // 11724
M=M-1 // 11725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11726
D=A // 11727
@SP // 11728
M=D+M // 11729
@120 // 11730
D=A // 11731
@SP // 11732
A=M-1 // 11733
M=0 // 11734
A=A-1 // 11735
M=0 // 11736
A=A-1 // 11737
M=0 // 11738
A=A-1 // 11739
M=D // 11740
A=A-1 // 11741
@51 // 11742
D=A // 11743
@SP // 11744
AM=M+1 // 11745
A=A-1 // 11746
M=D // 11747
@30 // 11748
D=A // 11749
@SP // 11750
AM=M+1 // 11751
A=A-1 // 11752
M=D // 11753
@12 // 11754
D=A // 11755
@SP // 11756
AM=M+1 // 11757
A=A-1 // 11758
M=D // 11759
@12 // 11760
D=A // 11761
@SP // 11762
AM=M+1 // 11763
A=A-1 // 11764
M=D // 11765
@30 // 11766
D=A // 11767
@SP // 11768
AM=M+1 // 11769
A=A-1 // 11770
M=D // 11771
@51 // 11772
D=A // 11773
@SP // 11774
AM=M+1 // 11775
A=A-1 // 11776
M=D // 11777
@SP // 11778
AM=M+1 // 11779
A=A-1 // 11780
M=0 // 11781
@SP // 11782
AM=M+1 // 11783
A=A-1 // 11784
M=0 // 11785
// call Output.create
@17 // 11786
D=A // 11787
@14 // 11788
M=D // 11789
@Output.create // 11790
D=A // 11791
@13 // 11792
M=D // 11793
@Output.init.ret.90 // 11794
D=A // 11795
@CALL // 11796
0;JMP // 11797
(Output.init.ret.90)
@SP // 11798
M=M-1 // 11799

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11800
D=A // 11801
@SP // 11802
M=D+M // 11803
@121 // 11804
D=A // 11805
@SP // 11806
A=M-1 // 11807
M=0 // 11808
A=A-1 // 11809
M=0 // 11810
A=A-1 // 11811
M=0 // 11812
A=A-1 // 11813
M=D // 11814
A=A-1 // 11815
@51 // 11816
D=A // 11817
@SP // 11818
AM=M+1 // 11819
A=A-1 // 11820
M=D // 11821
@51 // 11822
D=A // 11823
@SP // 11824
AM=M+1 // 11825
A=A-1 // 11826
M=D // 11827
@51 // 11828
D=A // 11829
@SP // 11830
AM=M+1 // 11831
A=A-1 // 11832
M=D // 11833
@62 // 11834
D=A // 11835
@SP // 11836
AM=M+1 // 11837
A=A-1 // 11838
M=D // 11839
@48 // 11840
D=A // 11841
@SP // 11842
AM=M+1 // 11843
A=A-1 // 11844
M=D // 11845
@24 // 11846
D=A // 11847
@SP // 11848
AM=M+1 // 11849
A=A-1 // 11850
M=D // 11851
@15 // 11852
D=A // 11853
@SP // 11854
AM=M+1 // 11855
A=A-1 // 11856
M=D // 11857
@SP // 11858
AM=M+1 // 11859
A=A-1 // 11860
M=0 // 11861
// call Output.create
@17 // 11862
D=A // 11863
@14 // 11864
M=D // 11865
@Output.create // 11866
D=A // 11867
@13 // 11868
M=D // 11869
@Output.init.ret.91 // 11870
D=A // 11871
@CALL // 11872
0;JMP // 11873
(Output.init.ret.91)
@SP // 11874
M=M-1 // 11875

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11876
D=A // 11877
@SP // 11878
M=D+M // 11879
@122 // 11880
D=A // 11881
@SP // 11882
A=M-1 // 11883
M=0 // 11884
A=A-1 // 11885
M=0 // 11886
A=A-1 // 11887
M=0 // 11888
A=A-1 // 11889
M=D // 11890
A=A-1 // 11891
@63 // 11892
D=A // 11893
@SP // 11894
AM=M+1 // 11895
A=A-1 // 11896
M=D // 11897
@27 // 11898
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
@6 // 11910
D=A // 11911
@SP // 11912
AM=M+1 // 11913
A=A-1 // 11914
M=D // 11915
@51 // 11916
D=A // 11917
@SP // 11918
AM=M+1 // 11919
A=A-1 // 11920
M=D // 11921
@63 // 11922
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
@Output.init.ret.92 // 11944
D=A // 11945
@CALL // 11946
0;JMP // 11947
(Output.init.ret.92)
@SP // 11948
M=M-1 // 11949

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955
@56 // 11956
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
@7 // 11980
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
@56 // 12004
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
@Output.init.ret.93 // 12026
D=A // 12027
@CALL // 12028
0;JMP // 12029
(Output.init.ret.93)
@SP // 12030
M=M-1 // 12031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12032
D=A // 12033
@SP // 12034
AM=M+1 // 12035
A=A-1 // 12036
M=D // 12037
@12 // 12038
D=A // 12039
@SP // 12040
AM=M+1 // 12041
A=A-1 // 12042
M=D // 12043
@12 // 12044
D=A // 12045
@SP // 12046
AM=M+1 // 12047
A=A-1 // 12048
M=D // 12049
@12 // 12050
D=A // 12051
@SP // 12052
AM=M+1 // 12053
A=A-1 // 12054
M=D // 12055
@12 // 12056
D=A // 12057
@SP // 12058
AM=M+1 // 12059
A=A-1 // 12060
M=D // 12061
@12 // 12062
D=A // 12063
@SP // 12064
AM=M+1 // 12065
A=A-1 // 12066
M=D // 12067
@12 // 12068
D=A // 12069
@SP // 12070
AM=M+1 // 12071
A=A-1 // 12072
M=D // 12073
@12 // 12074
D=A // 12075
@SP // 12076
AM=M+1 // 12077
A=A-1 // 12078
M=D // 12079
@12 // 12080
D=A // 12081
@SP // 12082
AM=M+1 // 12083
A=A-1 // 12084
M=D // 12085
@12 // 12086
D=A // 12087
@SP // 12088
AM=M+1 // 12089
A=A-1 // 12090
M=D // 12091
@SP // 12092
AM=M+1 // 12093
A=A-1 // 12094
M=0 // 12095
@SP // 12096
AM=M+1 // 12097
A=A-1 // 12098
M=0 // 12099
// call Output.create
@17 // 12100
D=A // 12101
@14 // 12102
M=D // 12103
@Output.create // 12104
D=A // 12105
@13 // 12106
M=D // 12107
@Output.init.ret.94 // 12108
D=A // 12109
@CALL // 12110
0;JMP // 12111
(Output.init.ret.94)
@SP // 12112
M=M-1 // 12113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12114
D=A // 12115
@SP // 12116
AM=M+1 // 12117
A=A-1 // 12118
M=D // 12119
@7 // 12120
D=A // 12121
@SP // 12122
AM=M+1 // 12123
A=A-1 // 12124
M=D // 12125
@12 // 12126
D=A // 12127
@SP // 12128
AM=M+1 // 12129
A=A-1 // 12130
M=D // 12131
@12 // 12132
D=A // 12133
@SP // 12134
AM=M+1 // 12135
A=A-1 // 12136
M=D // 12137
@12 // 12138
D=A // 12139
@SP // 12140
AM=M+1 // 12141
A=A-1 // 12142
M=D // 12143
@56 // 12144
D=A // 12145
@SP // 12146
AM=M+1 // 12147
A=A-1 // 12148
M=D // 12149
@12 // 12150
D=A // 12151
@SP // 12152
AM=M+1 // 12153
A=A-1 // 12154
M=D // 12155
@12 // 12156
D=A // 12157
@SP // 12158
AM=M+1 // 12159
A=A-1 // 12160
M=D // 12161
@12 // 12162
D=A // 12163
@SP // 12164
AM=M+1 // 12165
A=A-1 // 12166
M=D // 12167
@7 // 12168
D=A // 12169
@SP // 12170
AM=M+1 // 12171
A=A-1 // 12172
M=D // 12173
@SP // 12174
AM=M+1 // 12175
A=A-1 // 12176
M=0 // 12177
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
@Output.init.ret.95 // 12190
D=A // 12191
@CALL // 12192
0;JMP // 12193
(Output.init.ret.95)
@SP // 12194
M=M-1 // 12195

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 12196
D=A // 12197
@SP // 12198
AM=M+1 // 12199
A=A-1 // 12200
M=D // 12201
@38 // 12202
D=A // 12203
@SP // 12204
AM=M+1 // 12205
A=A-1 // 12206
M=D // 12207
@45 // 12208
D=A // 12209
@SP // 12210
AM=M+1 // 12211
A=A-1 // 12212
M=D // 12213
@25 // 12214
D=A // 12215
@SP // 12216
AM=M+1 // 12217
A=A-1 // 12218
M=D // 12219
@SP // 12220
AM=M+1 // 12221
A=A-1 // 12222
M=0 // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=0 // 12227
@SP // 12228
AM=M+1 // 12229
A=A-1 // 12230
M=0 // 12231
@SP // 12232
AM=M+1 // 12233
A=A-1 // 12234
M=0 // 12235
@SP // 12236
AM=M+1 // 12237
A=A-1 // 12238
M=0 // 12239
@SP // 12240
AM=M+1 // 12241
A=A-1 // 12242
M=0 // 12243
@SP // 12244
AM=M+1 // 12245
A=A-1 // 12246
M=0 // 12247
@SP // 12248
AM=M+1 // 12249
A=A-1 // 12250
M=0 // 12251
// call Output.create
@17 // 12252
D=A // 12253
@14 // 12254
M=D // 12255
@Output.create // 12256
D=A // 12257
@13 // 12258
M=D // 12259
@Output.init.ret.96 // 12260
D=A // 12261
@CALL // 12262
0;JMP // 12263
(Output.init.ret.96)
@SP // 12264
M=M-1 // 12265

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12266
M=0 // 12267

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12268
M=0 // 12269

////PushInstruction("constant 0")
@SP // 12270
AM=M+1 // 12271
A=A-1 // 12272
M=0 // 12273
@RETURN // 12274
0;JMP // 12275

////FunctionInstruction{functionName='Number.do_add', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_neg=1}}
// function Number.do_add with 0
(Number.do_add)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12276
A=M // 12277
D=M // 12278
@3 // 12279
M=D // 12280

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 12281
A=M // 12282
D=M // 12283
@SP // 12284
AM=M+1 // 12285
A=A-1 // 12286
M=D // 12287
@ARG // 12288
A=M+1 // 12289
D=M // 12290
@SP // 12291
AM=M+1 // 12292
A=A-1 // 12293
M=D // 12294
// call Number.getV
@6 // 12295
D=A // 12296
@14 // 12297
M=D // 12298
@Number.getV // 12299
D=A // 12300
@13 // 12301
M=D // 12302
@Number.do_add.ret.0 // 12303
D=A // 12304
@CALL // 12305
0;JMP // 12306
(Number.do_add.ret.0)
// call Int32.do_add
@7 // 12307
D=A // 12308
@14 // 12309
M=D // 12310
@Int32.do_add // 12311
D=A // 12312
@13 // 12313
M=D // 12314
@Number.do_add.ret.1 // 12315
D=A // 12316
@CALL // 12317
0;JMP // 12318
(Number.do_add.ret.1)
@SP // 12319
M=M-1 // 12320

////PushInstruction("constant 0")
@SP // 12321
AM=M+1 // 12322
A=A-1 // 12323
M=0 // 12324
@RETURN // 12325
0;JMP // 12326

////FunctionInstruction{functionName='Int32.leftshift', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2}}
// function Int32.leftshift with 2
(Int32.leftshift)
@SP // 12327
M=M+1 // 12328
AM=M+1 // 12329
A=A-1 // 12330
M=0 // 12331
A=A-1 // 12332
M=0 // 12333

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12334
A=M // 12335
D=M // 12336
@LCL // 12337
A=M // 12338
M=D // 12339

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 12340
A=M+1 // 12341
M=0 // 12342

////LabelInstruction{label='Int32.leftshift_WHILE_EXP1}
// label Int32.leftshift_WHILE_EXP1
(Int32.leftshift_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.leftshift_WHILE_END1}}
@Int32.leftshift.LT.23 // 12343
D=A // 12344
@SP // 12345
AM=M+1 // 12346
A=A-1 // 12347
M=D // 12348
@LCL // 12349
A=M+1 // 12350
D=M // 12351
@ARG // 12352
A=M+1 // 12353
D=M-D // 12354
@DO_LT // 12355
0;JMP // 12356
(Int32.leftshift.LT.23)
D=!D // 12357
@Int32.leftshift_WHILE_END1 // 12358
D;JNE // 12359

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

@LCL // 12360
A=M // 12361
D=M // 12362
@LCL // 12363
A=M // 12364
M=D+M // 12365

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

@LCL // 12366
A=M+1 // 12367
M=M+1 // 12368

////GotoInstruction{label='Int32.leftshift_WHILE_EXP1}
// goto Int32.leftshift_WHILE_EXP1
@Int32.leftshift_WHILE_EXP1 // 12369
0;JMP // 12370

////LabelInstruction{label='Int32.leftshift_WHILE_END1}
// label Int32.leftshift_WHILE_END1
(Int32.leftshift_WHILE_END1)

////PushInstruction("local 0")
@LCL // 12371
A=M // 12372
D=M // 12373
@SP // 12374
AM=M+1 // 12375
A=A-1 // 12376
M=D // 12377
@RETURN // 12378
0;JMP // 12379

////FunctionInstruction{functionName='Vec3.new', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.clone=4}}
// function Vec3.new with 0
(Vec3.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 12380
D=A // 12381
@SP // 12382
AM=M+1 // 12383
A=A-1 // 12384
M=D // 12385
// call Memory.alloc
@6 // 12386
D=A // 12387
@14 // 12388
M=D // 12389
@Memory.alloc // 12390
D=A // 12391
@13 // 12392
M=D // 12393
@Vec3.new.ret.0 // 12394
D=A // 12395
@CALL // 12396
0;JMP // 12397
(Vec3.new.ret.0)
@SP // 12398
AM=M-1 // 12399
D=M // 12400
@3 // 12401
M=D // 12402

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Vec3.0 // 12403
M=M+1 // 12404

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 12405
A=M // 12406
D=M // 12407
@THIS // 12408
A=M // 12409
M=D // 12410

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 12411
A=M+1 // 12412
D=M // 12413
@THIS // 12414
A=M+1 // 12415
M=D // 12416

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 12417
A=M+1 // 12418
A=A+1 // 12419
D=M // 12420
@THIS // 12421
A=M+1 // 12422
A=A+1 // 12423
M=D // 12424

////PushInstruction("pointer 0")
@3 // 12425
D=M // 12426
@SP // 12427
AM=M+1 // 12428
A=A-1 // 12429
M=D // 12430
@RETURN // 12431
0;JMP // 12432

////FunctionInstruction{functionName='Int32.initialize', numLocals=3, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0}}
// function Int32.initialize with 3
(Int32.initialize)
@3 // 12433
D=A // 12434
@SP // 12435
AM=D+M // 12436
A=A-1 // 12437
M=0 // 12438
A=A-1 // 12439
M=0 // 12440
A=A-1 // 12441
M=0 // 12442

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 15")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 1}
//}

@15 // 12443
D=A // 12444
@SP // 12445
AM=M+1 // 12446
A=A-1 // 12447
M=D // 12448
// call Memory.alloc
@6 // 12449
D=A // 12450
@14 // 12451
M=D // 12452
@Memory.alloc // 12453
D=A // 12454
@13 // 12455
M=D // 12456
@Int32.initialize.ret.0 // 12457
D=A // 12458
@CALL // 12459
0;JMP // 12460
(Int32.initialize.ret.0)
@SP // 12461
AM=M-1 // 12462
D=M // 12463
@Int32.1 // 12464
M=D // 12465

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 12466
A=M+1 // 12467
M=0 // 12468

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12469
A=M+1 // 12470
A=A+1 // 12471
M=1 // 12472

////LabelInstruction{label='Int32.initialize_WHILE_EXP1}
// label Int32.initialize_WHILE_EXP1
(Int32.initialize_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 15"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.initialize_WHILE_END1}}
@Int32.initialize.LT.24 // 12473
D=A // 12474
@SP // 12475
AM=M+1 // 12476
A=A-1 // 12477
M=D // 12478
@LCL // 12479
A=M+1 // 12480
D=M // 12481
@15 // 12482
D=D-A // 12483
@DO_LT // 12484
0;JMP // 12485
(Int32.initialize.LT.24)
D=!D // 12486
@Int32.initialize_WHILE_END1 // 12487
D;JNE // 12488

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Int32.1 // 12489
D=M // 12490
@LCL // 12491
A=M+1 // 12492
D=D+M // 12493
@SP // 12494
AM=M+1 // 12495
A=A-1 // 12496
M=D // 12497
@LCL // 12498
A=M+1 // 12499
A=A+1 // 12500
D=M // 12501
@SP // 12502
AM=M-1 // 12503
A=M // 12504
M=D // 12505

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

@LCL // 12506
A=M+1 // 12507
A=A+1 // 12508
D=M // 12509
@LCL // 12510
A=M+1 // 12511
A=A+1 // 12512
M=D+M // 12513

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

@LCL // 12514
A=M+1 // 12515
M=M+1 // 12516

////GotoInstruction{label='Int32.initialize_WHILE_EXP1}
// goto Int32.initialize_WHILE_EXP1
@Int32.initialize_WHILE_EXP1 // 12517
0;JMP // 12518

////LabelInstruction{label='Int32.initialize_WHILE_END1}
// label Int32.initialize_WHILE_END1
(Int32.initialize_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12519
AM=M+1 // 12520
A=A-1 // 12521
M=0 // 12522
@RETURN // 12523
0;JMP // 12524

////FunctionInstruction{functionName='Int32.do_div', numLocals=0, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_div with 0
(Int32.do_div)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12525
A=M // 12526
D=M // 12527
@3 // 12528
M=D // 12529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 0"), PushInstruction("argument 1")], call=CallInstruction{Int32.do_left_shift_bytes_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 12530
D=A // 12531
@SP // 12532
M=D+M // 12533
@3 // 12534
D=M // 12535
@SP // 12536
A=M-1 // 12537
M=0 // 12538
A=A-1 // 12539
M=D // 12540
A=A-1 // 12541
@1 // 12542
D=A // 12543
@SP // 12544
M=D+M // 12545
@ARG // 12546
A=M+1 // 12547
D=M // 12548
@SP // 12549
A=M-1 // 12550
M=D // 12551
A=A-1 // 12552
// call Int32.do_left_shift_bytes_div
@8 // 12553
D=A // 12554
@14 // 12555
M=D // 12556
@Int32.do_left_shift_bytes_div // 12557
D=A // 12558
@13 // 12559
M=D // 12560
@Int32.do_div.ret.0 // 12561
D=A // 12562
@CALL // 12563
0;JMP // 12564
(Int32.do_div.ret.0)
@SP // 12565
M=M-1 // 12566

////PushInstruction("constant 0")
@SP // 12567
AM=M+1 // 12568
A=A-1 // 12569
M=0 // 12570
@RETURN // 12571
0;JMP // 12572

////FunctionInstruction{functionName='Int32.do_neg', numLocals=1, funcMapping={Int32.is_positive=1, Int32.do_div=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_neg with 1
(Int32.do_neg)
@SP // 12573
AM=M+1 // 12574
A=A-1 // 12575
M=0 // 12576

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12577
A=M // 12578
D=M // 12579
@3 // 12580
M=D // 12581

////PushWriter{source=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "ADD"
//                    )
//            ),
//NEG),
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@THIS // 12582
A=M // 12583
D=M // 12584
@SP // 12585
AM=M+1 // 12586
A=A-1 // 12587
M=D // 12588
@THIS // 12589
A=M // 12590
A=M // 12591
D=M // 12592
D=-D // 12593
@255 // 12594
D=D&A // 12595
@SP // 12596
AM=M-1 // 12597
A=M // 12598
M=D // 12599

////PushWriter{source=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("constant 1"),
//                        binaryOp: "ADD"
//                    )
//            ),
//NOT),
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@THIS // 12600
A=M // 12601
D=M // 12602
@SP // 12603
AM=M+1 // 12604
A=A-1 // 12605
M=D+1 // 12606
@THIS // 12607
A=M // 12608
A=M+1 // 12609
D=M // 12610
D=!D // 12611
@255 // 12612
D=D&A // 12613
@SP // 12614
AM=M-1 // 12615
A=M // 12616
M=D // 12617

////PushWriter{source=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("constant 2"),
//                        binaryOp: "ADD"
//                    )
//            ),
//NOT),
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@THIS // 12618
A=M // 12619
D=M // 12620
@2 // 12621
D=D+A // 12622
@SP // 12623
AM=M+1 // 12624
A=A-1 // 12625
M=D // 12626
@THIS // 12627
A=M // 12628
D=M // 12629
@THIS // 12630
A=M // 12631
D=M // 12632
@2 // 12633
D=D+A // 12634
A=D // 12635
D=M // 12636
D=!D // 12637
@255 // 12638
D=D&A // 12639
@SP // 12640
AM=M-1 // 12641
A=M // 12642
M=D // 12643

////PushWriter{source=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("constant 3"),
//                        binaryOp: "ADD"
//                    )
//            ),
//NOT),
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@THIS // 12644
A=M // 12645
D=M // 12646
@3 // 12647
D=D+A // 12648
@SP // 12649
AM=M+1 // 12650
A=A-1 // 12651
M=D // 12652
@THIS // 12653
A=M // 12654
D=M // 12655
@THIS // 12656
A=M // 12657
D=M // 12658
@3 // 12659
D=D+A // 12660
A=D // 12661
D=M // 12662
D=!D // 12663
@255 // 12664
D=D&A // 12665
@SP // 12666
AM=M-1 // 12667
A=M // 12668
M=D // 12669

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12670
A=M // 12671
M=0 // 12672

////LabelInstruction{label='Int32.do_neg_WHILE_EXP1}
// label Int32.do_neg_WHILE_EXP1
(Int32.do_neg_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_neg_WHILE_END1}}
@Int32.do_neg.LT.25 // 12673
D=A // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678
@LCL // 12679
A=M // 12680
D=M // 12681
@4 // 12682
D=D-A // 12683
@DO_LT // 12684
0;JMP // 12685
(Int32.do_neg.LT.25)
D=!D // 12686
@Int32.do_neg_WHILE_END1 // 12687
D;JNE // 12688

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("local 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 12689
A=M // 12690
D=M // 12691
@LCL // 12692
A=M // 12693
D=D+M // 12694
@SP // 12695
AM=M+1 // 12696
A=A-1 // 12697
M=D // 12698
@THIS // 12699
A=M // 12700
D=M // 12701
@LCL // 12702
A=M // 12703
A=D+M // 12704
D=M // 12705
D=D+1 // 12706
@SP // 12707
AM=M-1 // 12708
A=M // 12709
M=D // 12710

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("local 0"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 256"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.do_neg$IF_TRUE1}}
@Int32.do_neg.LT.26 // 12711
D=A // 12712
@SP // 12713
AM=M+1 // 12714
A=A-1 // 12715
M=D // 12716
@THIS // 12717
A=M // 12718
D=M // 12719
@LCL // 12720
A=M // 12721
A=D+M // 12722
D=M // 12723
@256 // 12724
D=D-A // 12725
@DO_LT // 12726
0;JMP // 12727
(Int32.do_neg.LT.26)
@Int32.do_neg$IF_TRUE1 // 12728
D;JNE // 12729

////GotoInstruction{label='Int32.do_neg$IF_FALSE1}
// goto Int32.do_neg$IF_FALSE1
@Int32.do_neg$IF_FALSE1 // 12730
0;JMP // 12731

////LabelInstruction{label='Int32.do_neg$IF_TRUE1}
// label Int32.do_neg$IF_TRUE1
(Int32.do_neg$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 4")
//  pop:  PopInstruction{address=local 0}
//}

@4 // 12732
D=A // 12733
@LCL // 12734
A=M // 12735
M=D // 12736

////GotoInstruction{label='Int32.do_neg$IF_END1}
// goto Int32.do_neg$IF_END1
@Int32.do_neg$IF_END1 // 12737
0;JMP // 12738

////LabelInstruction{label='Int32.do_neg$IF_FALSE1}
// label Int32.do_neg$IF_FALSE1
(Int32.do_neg$IF_FALSE1)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 12739
A=M // 12740
D=M // 12741
@LCL // 12742
A=M // 12743
D=D+M // 12744
@SP // 12745
AM=M+1 // 12746
A=A-1 // 12747
M=D // 12748
D=0 // 12749
@SP // 12750
AM=M-1 // 12751
A=M // 12752
M=D // 12753

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

@LCL // 12754
A=M // 12755
M=M+1 // 12756

////LabelInstruction{label='Int32.do_neg$IF_END1}
// label Int32.do_neg$IF_END1
(Int32.do_neg$IF_END1)

////GotoInstruction{label='Int32.do_neg_WHILE_EXP1}
// goto Int32.do_neg_WHILE_EXP1
@Int32.do_neg_WHILE_EXP1 // 12757
0;JMP // 12758

////LabelInstruction{label='Int32.do_neg_WHILE_END1}
// label Int32.do_neg_WHILE_END1
(Int32.do_neg_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12759
AM=M+1 // 12760
A=A-1 // 12761
M=0 // 12762
@RETURN // 12763
0;JMP // 12764

////FunctionInstruction{functionName='Int32.do_sqrt', numLocals=6, funcMapping={Int32.is_positive=1, Int32.do_div=1, Int32.do_sub=4, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_sqrt with 6
(Int32.do_sqrt)
@6 // 12765
D=A // 12766
@SP // 12767
AM=D+M // 12768
A=A-1 // 12769
M=0 // 12770
A=A-1 // 12771
M=0 // 12772
A=A-1 // 12773
M=0 // 12774
A=A-1 // 12775
M=0 // 12776
A=A-1 // 12777
M=0 // 12778
A=A-1 // 12779
M=0 // 12780

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12781
A=M // 12782
D=M // 12783
@3 // 12784
M=D // 12785

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_zero}}, ifGoto=IfGotoInstruction{label='Int32.do_sqrt$IF_TRUE1}}
@3 // 12786
D=M // 12787
@SP // 12788
AM=M+1 // 12789
A=A-1 // 12790
M=D // 12791
// call Int32.is_zero
@6 // 12792
D=A // 12793
@14 // 12794
M=D // 12795
@Int32.is_zero // 12796
D=A // 12797
@13 // 12798
M=D // 12799
@Int32.do_sqrt.ret.0 // 12800
D=A // 12801
@CALL // 12802
0;JMP // 12803
(Int32.do_sqrt.ret.0)
@SP // 12804
AM=M-1 // 12805
D=M // 12806
@Int32.do_sqrt$IF_TRUE1 // 12807
D;JNE // 12808

////GotoInstruction{label='Int32.do_sqrt$IF_END1}
// goto Int32.do_sqrt$IF_END1
@Int32.do_sqrt$IF_END1 // 12809
0;JMP // 12810

////LabelInstruction{label='Int32.do_sqrt$IF_TRUE1}
// label Int32.do_sqrt$IF_TRUE1
(Int32.do_sqrt$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 12811
AM=M+1 // 12812
A=A-1 // 12813
M=0 // 12814
@RETURN // 12815
0;JMP // 12816

////LabelInstruction{label='Int32.do_sqrt$IF_END1}
// label Int32.do_sqrt$IF_END1
(Int32.do_sqrt$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 2}
//}

@2 // 12817
D=A // 12818
@SP // 12819
AM=M+1 // 12820
A=A-1 // 12821
M=D // 12822
// call Int32.new
@6 // 12823
D=A // 12824
@14 // 12825
M=D // 12826
@Int32.new // 12827
D=A // 12828
@13 // 12829
M=D // 12830
@Int32.do_sqrt.ret.1 // 12831
D=A // 12832
@CALL // 12833
0;JMP // 12834
(Int32.do_sqrt.ret.1)
@SP // 12835
AM=M-1 // 12836
D=M // 12837
@LCL // 12838
A=M+1 // 12839
A=A+1 // 12840
M=D // 12841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 12842
AM=M+1 // 12843
A=A-1 // 12844
M=-1 // 12845
// call Int32.new
@6 // 12846
D=A // 12847
@14 // 12848
M=D // 12849
@Int32.new // 12850
D=A // 12851
@13 // 12852
M=D // 12853
@Int32.do_sqrt.ret.2 // 12854
D=A // 12855
@CALL // 12856
0;JMP // 12857
(Int32.do_sqrt.ret.2)
@SP // 12858
AM=M-1 // 12859
D=M // 12860
@LCL // 12861
A=M // 12862
M=D // 12863

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.initial_sqrt_guess}}
//  pop:  PopInstruction{address=local 1}
//}

@3 // 12864
D=M // 12865
@SP // 12866
AM=M+1 // 12867
A=A-1 // 12868
M=D // 12869
// call Int32.initial_sqrt_guess
@6 // 12870
D=A // 12871
@14 // 12872
M=D // 12873
@Int32.initial_sqrt_guess // 12874
D=A // 12875
@13 // 12876
M=D // 12877
@Int32.do_sqrt.ret.3 // 12878
D=A // 12879
@CALL // 12880
0;JMP // 12881
(Int32.do_sqrt.ret.3)
@SP // 12882
AM=M-1 // 12883
D=M // 12884
@LCL // 12885
A=M+1 // 12886
M=D // 12887

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 12888
D=M // 12889
@4 // 12890
A=D+A // 12891
M=0 // 12892

////LabelInstruction{label='Int32.do_sqrt_WHILE_EXP1}
// label Int32.do_sqrt_WHILE_EXP1
(Int32.do_sqrt_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 4"),
//                right:
//                    PushInstruction("constant 20"),
//                binaryOp: "LT"
//            ),
//        right:
//            UnaryPushGroup(                BinaryPushGroup(
//                    left:
//CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.cmp}},
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//NOT),
//        binaryOp: "AND"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_sqrt_WHILE_END1}}
@Int32.do_sqrt.LT.27 // 12893
D=A // 12894
@SP // 12895
AM=M+1 // 12896
A=A-1 // 12897
M=D // 12898
@LCL // 12899
D=M // 12900
@4 // 12901
A=D+A // 12902
D=M // 12903
@20 // 12904
D=D-A // 12905
@DO_LT // 12906
0;JMP // 12907
(Int32.do_sqrt.LT.27)
@SP // 12908
AM=M+1 // 12909
A=A-1 // 12910
M=D // 12911
@Int32.do_sqrt.EQ.28 // 12912
D=A // 12913
@SP // 12914
AM=M+1 // 12915
A=A-1 // 12916
M=D // 12917
@LCL // 12918
A=M // 12919
D=M // 12920
@SP // 12921
AM=M+1 // 12922
A=A-1 // 12923
M=D // 12924
@LCL // 12925
A=M+1 // 12926
D=M // 12927
@SP // 12928
AM=M+1 // 12929
A=A-1 // 12930
M=D // 12931
// call Int32.cmp
@7 // 12932
D=A // 12933
@14 // 12934
M=D // 12935
@Int32.cmp // 12936
D=A // 12937
@13 // 12938
M=D // 12939
@Int32.do_sqrt.ret.4 // 12940
D=A // 12941
@CALL // 12942
0;JMP // 12943
(Int32.do_sqrt.ret.4)
@SP // 12944
AM=M-1 // 12945
D=M // 12946
@DO_EQ // 12947
0;JMP // 12948
(Int32.do_sqrt.EQ.28)
D=!D // 12949
@SP // 12950
AM=M-1 // 12951
D=D&M // 12952
D=!D // 12953
@Int32.do_sqrt_WHILE_END1 // 12954
D;JNE // 12955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@3 // 12956
D=M // 12957
@SP // 12958
AM=M+1 // 12959
A=A-1 // 12960
M=D // 12961
// call Int32.clone
@6 // 12962
D=A // 12963
@14 // 12964
M=D // 12965
@Int32.clone // 12966
D=A // 12967
@13 // 12968
M=D // 12969
@Int32.do_sqrt.ret.5 // 12970
D=A // 12971
@CALL // 12972
0;JMP // 12973
(Int32.do_sqrt.ret.5)
@SP // 12974
AM=M-1 // 12975
D=M // 12976
@LCL // 12977
A=M+1 // 12978
A=A+1 // 12979
A=A+1 // 12980
M=D // 12981

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 1")], call=CallInstruction{Int32.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12982
A=M+1 // 12983
A=A+1 // 12984
A=A+1 // 12985
D=M // 12986
@SP // 12987
AM=M+1 // 12988
A=A-1 // 12989
M=D // 12990
@LCL // 12991
A=M+1 // 12992
D=M // 12993
@SP // 12994
AM=M+1 // 12995
A=A-1 // 12996
M=D // 12997
// call Int32.do_div
@7 // 12998
D=A // 12999
@14 // 13000
M=D // 13001
@Int32.do_div // 13002
D=A // 13003
@13 // 13004
M=D // 13005
@Int32.do_sqrt.ret.6 // 13006
D=A // 13007
@CALL // 13008
0;JMP // 13009
(Int32.do_sqrt.ret.6)
@SP // 13010
M=M-1 // 13011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13012
A=M // 13013
D=M // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018
// call Int32.dispose
@6 // 13019
D=A // 13020
@14 // 13021
M=D // 13022
@Int32.dispose // 13023
D=A // 13024
@13 // 13025
M=D // 13026
@Int32.do_sqrt.ret.7 // 13027
D=A // 13028
@CALL // 13029
0;JMP // 13030
(Int32.do_sqrt.ret.7)
@SP // 13031
M=M-1 // 13032

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13033
A=M+1 // 13034
D=M // 13035
@SP // 13036
AM=M+1 // 13037
A=A-1 // 13038
M=D // 13039
// call Int32.clone
@6 // 13040
D=A // 13041
@14 // 13042
M=D // 13043
@Int32.clone // 13044
D=A // 13045
@13 // 13046
M=D // 13047
@Int32.do_sqrt.ret.8 // 13048
D=A // 13049
@CALL // 13050
0;JMP // 13051
(Int32.do_sqrt.ret.8)
@SP // 13052
AM=M-1 // 13053
D=M // 13054
@LCL // 13055
A=M // 13056
M=D // 13057

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 3")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13058
A=M+1 // 13059
D=M // 13060
@SP // 13061
AM=M+1 // 13062
A=A-1 // 13063
M=D // 13064
@LCL // 13065
A=M+1 // 13066
A=A+1 // 13067
A=A+1 // 13068
D=M // 13069
@SP // 13070
AM=M+1 // 13071
A=A-1 // 13072
M=D // 13073
// call Int32.do_add
@7 // 13074
D=A // 13075
@14 // 13076
M=D // 13077
@Int32.do_add // 13078
D=A // 13079
@13 // 13080
M=D // 13081
@Int32.do_sqrt.ret.9 // 13082
D=A // 13083
@CALL // 13084
0;JMP // 13085
(Int32.do_sqrt.ret.9)
@SP // 13086
M=M-1 // 13087

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Int32.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13088
A=M+1 // 13089
D=M // 13090
@SP // 13091
AM=M+1 // 13092
A=A-1 // 13093
M=D // 13094
@LCL // 13095
A=M+1 // 13096
A=A+1 // 13097
D=M // 13098
@SP // 13099
AM=M+1 // 13100
A=A-1 // 13101
M=D // 13102
// call Int32.do_div
@7 // 13103
D=A // 13104
@14 // 13105
M=D // 13106
@Int32.do_div // 13107
D=A // 13108
@13 // 13109
M=D // 13110
@Int32.do_sqrt.ret.10 // 13111
D=A // 13112
@CALL // 13113
0;JMP // 13114
(Int32.do_sqrt.ret.10)
@SP // 13115
M=M-1 // 13116

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13117
A=M+1 // 13118
A=A+1 // 13119
A=A+1 // 13120
D=M // 13121
@SP // 13122
AM=M+1 // 13123
A=A-1 // 13124
M=D // 13125
// call Int32.dispose
@6 // 13126
D=A // 13127
@14 // 13128
M=D // 13129
@Int32.dispose // 13130
D=A // 13131
@13 // 13132
M=D // 13133
@Int32.do_sqrt.ret.11 // 13134
D=A // 13135
@CALL // 13136
0;JMP // 13137
(Int32.do_sqrt.ret.11)
@SP // 13138
M=M-1 // 13139

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13140
D=M // 13141
@4 // 13142
A=D+A // 13143
M=M+1 // 13144

////GotoInstruction{label='Int32.do_sqrt_WHILE_EXP1}
// goto Int32.do_sqrt_WHILE_EXP1
@Int32.do_sqrt_WHILE_EXP1 // 13145
0;JMP // 13146

////LabelInstruction{label='Int32.do_sqrt_WHILE_END1}
// label Int32.do_sqrt_WHILE_END1
(Int32.do_sqrt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13147
A=M+1 // 13148
D=M // 13149
@SP // 13150
AM=M+1 // 13151
A=A-1 // 13152
M=D // 13153
// call Int32.getParts
@6 // 13154
D=A // 13155
@14 // 13156
M=D // 13157
@Int32.getParts // 13158
D=A // 13159
@13 // 13160
M=D // 13161
@Int32.do_sqrt.ret.12 // 13162
D=A // 13163
@CALL // 13164
0;JMP // 13165
(Int32.do_sqrt.ret.12)
@LCL // 13166
D=M // 13167
@5 // 13168
A=D+A // 13169
D=A // 13170
@R13 // 13171
M=D // 13172
@SP // 13173
AM=M-1 // 13174
D=M // 13175
@R13 // 13176
A=M // 13177
M=D // 13178

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13179
D=M // 13180
@4 // 13181
A=D+A // 13182
M=0 // 13183

////LabelInstruction{label='Int32.do_sqrt_WHILE_EXP2}
// label Int32.do_sqrt_WHILE_EXP2
(Int32.do_sqrt_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 4"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_sqrt_WHILE_END2}}
@Int32.do_sqrt.LT.29 // 13184
D=A // 13185
@SP // 13186
AM=M+1 // 13187
A=A-1 // 13188
M=D // 13189
@LCL // 13190
D=M // 13191
@4 // 13192
A=D+A // 13193
D=M // 13194
@4 // 13195
D=D-A // 13196
@DO_LT // 13197
0;JMP // 13198
(Int32.do_sqrt.LT.29)
D=!D // 13199
@Int32.do_sqrt_WHILE_END2 // 13200
D;JNE // 13201

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 4"),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 4"),
//    binaryOp: "ADD"
//)}
@THIS // 13202
A=M // 13203
D=M // 13204
@SP // 13205
AM=M+1 // 13206
A=A-1 // 13207
M=D // 13208
@LCL // 13209
D=M // 13210
@4 // 13211
A=D+A // 13212
D=M // 13213
@SP // 13214
AM=M-1 // 13215
D=D+M // 13216
@SP // 13217
AM=M+1 // 13218
A=A-1 // 13219
M=D // 13220
@LCL // 13221
D=M // 13222
@5 // 13223
A=D+A // 13224
D=M // 13225
A=A-1 // 13226
A=D+M // 13227
D=M // 13228
@SP // 13229
AM=M-1 // 13230
A=M // 13231
M=D // 13232

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13233
D=M // 13234
@4 // 13235
A=D+A // 13236
M=M+1 // 13237

////GotoInstruction{label='Int32.do_sqrt_WHILE_EXP2}
// goto Int32.do_sqrt_WHILE_EXP2
@Int32.do_sqrt_WHILE_EXP2 // 13238
0;JMP // 13239

////LabelInstruction{label='Int32.do_sqrt_WHILE_END2}
// label Int32.do_sqrt_WHILE_END2
(Int32.do_sqrt_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13240
A=M+1 // 13241
A=A+1 // 13242
D=M // 13243
@SP // 13244
AM=M+1 // 13245
A=A-1 // 13246
M=D // 13247
// call Int32.dispose
@6 // 13248
D=A // 13249
@14 // 13250
M=D // 13251
@Int32.dispose // 13252
D=A // 13253
@13 // 13254
M=D // 13255
@Int32.do_sqrt.ret.13 // 13256
D=A // 13257
@CALL // 13258
0;JMP // 13259
(Int32.do_sqrt.ret.13)
@SP // 13260
M=M-1 // 13261

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13262
A=M+1 // 13263
D=M // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
// call Int32.dispose
@6 // 13269
D=A // 13270
@14 // 13271
M=D // 13272
@Int32.dispose // 13273
D=A // 13274
@13 // 13275
M=D // 13276
@Int32.do_sqrt.ret.14 // 13277
D=A // 13278
@CALL // 13279
0;JMP // 13280
(Int32.do_sqrt.ret.14)
@SP // 13281
M=M-1 // 13282

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13283
A=M // 13284
D=M // 13285
@SP // 13286
AM=M+1 // 13287
A=A-1 // 13288
M=D // 13289
// call Int32.dispose
@6 // 13290
D=A // 13291
@14 // 13292
M=D // 13293
@Int32.dispose // 13294
D=A // 13295
@13 // 13296
M=D // 13297
@Int32.do_sqrt.ret.15 // 13298
D=A // 13299
@CALL // 13300
0;JMP // 13301
(Int32.do_sqrt.ret.15)
@SP // 13302
M=M-1 // 13303

////PushInstruction("constant 0")
@SP // 13304
AM=M+1 // 13305
A=A-1 // 13306
M=0 // 13307
@RETURN // 13308
0;JMP // 13309

////FunctionInstruction{functionName='Int32.u4_array_div_u4_array', numLocals=15, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.u4_array_div_u4_array with 15
(Int32.u4_array_div_u4_array)
@15 // 13310
D=A // 13311
@SP // 13312
AM=D+M // 13313
A=A-1 // 13314
M=0 // 13315
A=A-1 // 13316
M=0 // 13317
A=A-1 // 13318
M=0 // 13319
A=A-1 // 13320
M=0 // 13321
A=A-1 // 13322
M=0 // 13323
A=A-1 // 13324
M=0 // 13325
A=A-1 // 13326
M=0 // 13327
A=A-1 // 13328
M=0 // 13329
A=A-1 // 13330
M=0 // 13331
A=A-1 // 13332
M=0 // 13333
A=A-1 // 13334
M=0 // 13335
A=A-1 // 13336
M=0 // 13337
A=A-1 // 13338
M=0 // 13339
A=A-1 // 13340
M=0 // 13341
A=A-1 // 13342
M=0 // 13343

////PushPopPair {
//  push: PushInstruction("constant 16")
//  pop:  PopInstruction{address=local 0}
//}

@16 // 13344
D=A // 13345
@LCL // 13346
A=M // 13347
M=D // 13348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 6}
//}

@16 // 13349
D=A // 13350
@SP // 13351
AM=M+1 // 13352
A=A-1 // 13353
M=D // 13354
// call Memory.alloc
@6 // 13355
D=A // 13356
@14 // 13357
M=D // 13358
@Memory.alloc // 13359
D=A // 13360
@13 // 13361
M=D // 13362
@Int32.u4_array_div_u4_array.ret.0 // 13363
D=A // 13364
@CALL // 13365
0;JMP // 13366
(Int32.u4_array_div_u4_array.ret.0)
@LCL // 13367
D=M // 13368
@6 // 13369
A=D+A // 13370
D=A // 13371
@R13 // 13372
M=D // 13373
@SP // 13374
AM=M-1 // 13375
D=M // 13376
@R13 // 13377
A=M // 13378
M=D // 13379

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE1}}
@Int32.u4_array_div_u4_array.EQ.30 // 13380
D=A // 13381
@SP // 13382
AM=M+1 // 13383
A=A-1 // 13384
M=D // 13385
@ARG // 13386
A=M+1 // 13387
A=A+1 // 13388
D=M // 13389
D=D-1 // 13390
@DO_EQ // 13391
0;JMP // 13392
(Int32.u4_array_div_u4_array.EQ.30)
@Int32.u4_array_div_u4_array$IF_TRUE1 // 13393
D;JNE // 13394

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END1}
// goto Int32.u4_array_div_u4_array$IF_END1
@Int32.u4_array_div_u4_array$IF_END1 // 13395
0;JMP // 13396

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE1}
// label Int32.u4_array_div_u4_array$IF_TRUE1
(Int32.u4_array_div_u4_array$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13397
A=M+1 // 13398
A=A+1 // 13399
A=A+1 // 13400
M=0 // 13401

////PushPopPair {
//  push: PushInstruction("constant 15")
//  pop:  PopInstruction{address=local 2}
//}

@15 // 13402
D=A // 13403
@LCL // 13404
A=M+1 // 13405
A=A+1 // 13406
M=D // 13407

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP1}
// label Int32.u4_array_div_u4_array_WHILE_EXP1
(Int32.u4_array_div_u4_array_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END1}}
@Int32.u4_array_div_u4_array.LT.31 // 13408
D=A // 13409
@SP // 13410
AM=M+1 // 13411
A=A-1 // 13412
M=D // 13413
@LCL // 13414
A=M+1 // 13415
A=A+1 // 13416
D=M // 13417
@DO_LT // 13418
0;JMP // 13419
(Int32.u4_array_div_u4_array.LT.31)
@Int32.u4_array_div_u4_array_WHILE_END1 // 13420
D;JNE // 13421

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 0")], call=CallInstruction{Math.multiply}},
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 0"),
//                    right:
//                        PushInstruction("local 2"),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13422
A=M+1 // 13423
A=A+1 // 13424
A=A+1 // 13425
D=M // 13426
@SP // 13427
AM=M+1 // 13428
A=A-1 // 13429
M=D // 13430
@LCL // 13431
A=M // 13432
D=M // 13433
@SP // 13434
AM=M+1 // 13435
A=A-1 // 13436
M=D // 13437
// call Math.multiply
@7 // 13438
D=A // 13439
@14 // 13440
M=D // 13441
@Math.multiply // 13442
D=A // 13443
@13 // 13444
M=D // 13445
@Int32.u4_array_div_u4_array.ret.1 // 13446
D=A // 13447
@CALL // 13448
0;JMP // 13449
(Int32.u4_array_div_u4_array.ret.1)
@ARG // 13450
A=M // 13451
D=M // 13452
@LCL // 13453
A=M+1 // 13454
A=A+1 // 13455
A=D+M // 13456
D=M // 13457
@SP // 13458
AM=M-1 // 13459
D=D+M // 13460
@SP // 13461
AM=M+1 // 13462
A=A-1 // 13463
M=D // 13464
@LCL // 13465
D=M // 13466
@4 // 13467
A=D+A // 13468
D=A // 13469
@R13 // 13470
M=D // 13471
@SP // 13472
AM=M-1 // 13473
D=M // 13474
@R13 // 13475
A=M // 13476
M=D // 13477

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 4"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.divide}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)}
@LCL // 13478
D=M // 13479
@6 // 13480
A=D+A // 13481
D=M // 13482
@SP // 13483
AM=M+1 // 13484
A=A-1 // 13485
M=D // 13486
@LCL // 13487
A=M+1 // 13488
A=A+1 // 13489
D=M // 13490
@SP // 13491
AM=M-1 // 13492
D=D+M // 13493
@SP // 13494
AM=M+1 // 13495
A=A-1 // 13496
M=D // 13497
@LCL // 13498
D=M // 13499
@4 // 13500
A=D+A // 13501
D=M // 13502
@SP // 13503
AM=M+1 // 13504
A=A-1 // 13505
M=D // 13506
@ARG // 13507
A=M+1 // 13508
A=M // 13509
D=M // 13510
@SP // 13511
AM=M+1 // 13512
A=A-1 // 13513
M=D // 13514
// call Math.divide
@7 // 13515
D=A // 13516
@14 // 13517
M=D // 13518
@Math.divide // 13519
D=A // 13520
@13 // 13521
M=D // 13522
@Int32.u4_array_div_u4_array.ret.2 // 13523
D=A // 13524
@CALL // 13525
0;JMP // 13526
(Int32.u4_array_div_u4_array.ret.2)
@SP // 13527
AM=M-1 // 13528
D=M // 13529
@SP // 13530
AM=M-1 // 13531
A=M // 13532
M=D // 13533

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 6"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "ADD"
//        )
//), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13534
D=M // 13535
@4 // 13536
A=D+A // 13537
D=M // 13538
@SP // 13539
AM=M+1 // 13540
A=A-1 // 13541
M=D // 13542
@LCL // 13543
D=M // 13544
@6 // 13545
A=D+A // 13546
D=M // 13547
@SP // 13548
AM=M+1 // 13549
A=A-1 // 13550
M=D // 13551
@LCL // 13552
A=M+1 // 13553
A=A+1 // 13554
D=M // 13555
@SP // 13556
AM=M-1 // 13557
A=D+M // 13558
D=M // 13559
@SP // 13560
AM=M+1 // 13561
A=A-1 // 13562
M=D // 13563
@ARG // 13564
A=M+1 // 13565
A=M // 13566
D=M // 13567
@SP // 13568
AM=M+1 // 13569
A=A-1 // 13570
M=D // 13571
// call Math.multiply
@7 // 13572
D=A // 13573
@14 // 13574
M=D // 13575
@Math.multiply // 13576
D=A // 13577
@13 // 13578
M=D // 13579
@Int32.u4_array_div_u4_array.ret.3 // 13580
D=A // 13581
@CALL // 13582
0;JMP // 13583
(Int32.u4_array_div_u4_array.ret.3)
@SP // 13584
AM=M-1 // 13585
D=M // 13586
@SP // 13587
AM=M-1 // 13588
D=M-D // 13589
@LCL // 13590
A=M+1 // 13591
A=A+1 // 13592
A=A+1 // 13593
M=D // 13594

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 13595
A=M+1 // 13596
A=A+1 // 13597
M=M-1 // 13598

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP1}
// goto Int32.u4_array_div_u4_array_WHILE_EXP1
@Int32.u4_array_div_u4_array_WHILE_EXP1 // 13599
0;JMP // 13600

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END1}
// label Int32.u4_array_div_u4_array_WHILE_END1
(Int32.u4_array_div_u4_array_WHILE_END1)

////PushInstruction("local 6")
@LCL // 13601
D=M // 13602
@6 // 13603
A=D+A // 13604
D=M // 13605
@SP // 13606
AM=M+1 // 13607
A=A-1 // 13608
M=D // 13609
@RETURN // 13610
0;JMP // 13611

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END1}
// label Int32.u4_array_div_u4_array$IF_END1
(Int32.u4_array_div_u4_array$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 2"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Int32.nlz_u4}}
//  pop:  PopInstruction{address=local 5}
//}

@ARG // 13612
A=M+1 // 13613
D=M // 13614
@SP // 13615
AM=M+1 // 13616
A=A-1 // 13617
M=D // 13618
@ARG // 13619
A=M+1 // 13620
A=A+1 // 13621
D=M // 13622
D=D-1 // 13623
@SP // 13624
AM=M-1 // 13625
A=D+M // 13626
D=M // 13627
@SP // 13628
AM=M+1 // 13629
A=A-1 // 13630
M=D // 13631
// call Int32.nlz_u4
@6 // 13632
D=A // 13633
@14 // 13634
M=D // 13635
@Int32.nlz_u4 // 13636
D=A // 13637
@13 // 13638
M=D // 13639
@Int32.u4_array_div_u4_array.ret.4 // 13640
D=A // 13641
@CALL // 13642
0;JMP // 13643
(Int32.u4_array_div_u4_array.ret.4)
@LCL // 13644
D=M // 13645
@5 // 13646
A=D+A // 13647
D=A // 13648
@R13 // 13649
M=D // 13650
@SP // 13651
AM=M-1 // 13652
D=M // 13653
@R13 // 13654
A=M // 13655
M=D // 13656

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 7}
//}

@8 // 13657
D=A // 13658
@SP // 13659
AM=M+1 // 13660
A=A-1 // 13661
M=D // 13662
// call Memory.alloc
@6 // 13663
D=A // 13664
@14 // 13665
M=D // 13666
@Memory.alloc // 13667
D=A // 13668
@13 // 13669
M=D // 13670
@Int32.u4_array_div_u4_array.ret.5 // 13671
D=A // 13672
@CALL // 13673
0;JMP // 13674
(Int32.u4_array_div_u4_array.ret.5)
@LCL // 13675
D=M // 13676
@7 // 13677
A=D+A // 13678
D=A // 13679
@R13 // 13680
M=D // 13681
@SP // 13682
AM=M-1 // 13683
D=M // 13684
@R13 // 13685
A=M // 13686
M=D // 13687

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13688
A=M+1 // 13689
A=A+1 // 13690
D=M // 13691
D=D-1 // 13692
@LCL // 13693
A=M+1 // 13694
M=D // 13695

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP2}
// label Int32.u4_array_div_u4_array_WHILE_EXP2
(Int32.u4_array_div_u4_array_WHILE_EXP2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END2}}
@Int32.u4_array_div_u4_array.LT.32 // 13696
D=A // 13697
@SP // 13698
AM=M+1 // 13699
A=A-1 // 13700
M=D // 13701
@LCL // 13702
A=M+1 // 13703
D=M // 13704
D=D-1 // 13705
@DO_LT // 13706
0;JMP // 13707
(Int32.u4_array_div_u4_array.LT.32)
@Int32.u4_array_div_u4_array_WHILE_END2 // 13708
D;JNE // 13709

////PushWriter{source=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 5")], call=CallInstruction{Int32.leftshift}},
//            right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//), BinaryPushGroup(
//    left:
//        PushInstruction("constant 4"),
//    right:
//        PushInstruction("local 5"),
//    binaryOp: "SUB"
//)], call=CallInstruction{Int32.arith_rightshift}},
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 7"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13710
D=M // 13711
@7 // 13712
A=D+A // 13713
D=M // 13714
@SP // 13715
AM=M+1 // 13716
A=A-1 // 13717
M=D // 13718
@LCL // 13719
A=M+1 // 13720
D=M // 13721
@SP // 13722
AM=M-1 // 13723
D=D+M // 13724
@SP // 13725
AM=M+1 // 13726
A=A-1 // 13727
M=D // 13728
@ARG // 13729
A=M+1 // 13730
D=M // 13731
@LCL // 13732
A=M+1 // 13733
A=D+M // 13734
D=M // 13735
@SP // 13736
AM=M+1 // 13737
A=A-1 // 13738
M=D // 13739
@LCL // 13740
D=M // 13741
@5 // 13742
A=D+A // 13743
D=M // 13744
@SP // 13745
AM=M+1 // 13746
A=A-1 // 13747
M=D // 13748
// call Int32.leftshift
@7 // 13749
D=A // 13750
@14 // 13751
M=D // 13752
@Int32.leftshift // 13753
D=A // 13754
@13 // 13755
M=D // 13756
@Int32.u4_array_div_u4_array.ret.6 // 13757
D=A // 13758
@CALL // 13759
0;JMP // 13760
(Int32.u4_array_div_u4_array.ret.6)
@ARG // 13761
A=M+1 // 13762
D=M // 13763
@SP // 13764
AM=M+1 // 13765
A=A-1 // 13766
M=D // 13767
@LCL // 13768
A=M+1 // 13769
D=M // 13770
D=D-1 // 13771
@SP // 13772
AM=M-1 // 13773
A=D+M // 13774
D=M // 13775
@SP // 13776
AM=M+1 // 13777
A=A-1 // 13778
M=D // 13779
@LCL // 13780
D=M // 13781
@5 // 13782
A=D+A // 13783
D=M // 13784
@4 // 13785
D=A-D // 13786
@SP // 13787
AM=M+1 // 13788
A=A-1 // 13789
M=D // 13790
// call Int32.arith_rightshift
@7 // 13791
D=A // 13792
@14 // 13793
M=D // 13794
@Int32.arith_rightshift // 13795
D=A // 13796
@13 // 13797
M=D // 13798
@Int32.u4_array_div_u4_array.ret.7 // 13799
D=A // 13800
@CALL // 13801
0;JMP // 13802
(Int32.u4_array_div_u4_array.ret.7)
@SP // 13803
AM=M-1 // 13804
D=M // 13805
@SP // 13806
AM=M-1 // 13807
D=D|M // 13808
@15 // 13809
D=D&A // 13810
@SP // 13811
AM=M-1 // 13812
A=M // 13813
M=D // 13814

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

@LCL // 13815
A=M+1 // 13816
M=M-1 // 13817

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP2}
// goto Int32.u4_array_div_u4_array_WHILE_EXP2
@Int32.u4_array_div_u4_array_WHILE_EXP2 // 13818
0;JMP // 13819

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END2}
// label Int32.u4_array_div_u4_array_WHILE_END2
(Int32.u4_array_div_u4_array_WHILE_END2)

////PushWriter{source=BinaryPushGroup(
//    left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 5")], call=CallInstruction{Int32.leftshift}},
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 7"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 13820
D=M // 13821
@7 // 13822
A=D+A // 13823
D=M // 13824
@SP // 13825
AM=M+1 // 13826
A=A-1 // 13827
M=D // 13828
@ARG // 13829
A=M+1 // 13830
A=M // 13831
D=M // 13832
@SP // 13833
AM=M+1 // 13834
A=A-1 // 13835
M=D // 13836
@LCL // 13837
D=M // 13838
@5 // 13839
A=D+A // 13840
D=M // 13841
@SP // 13842
AM=M+1 // 13843
A=A-1 // 13844
M=D // 13845
// call Int32.leftshift
@7 // 13846
D=A // 13847
@14 // 13848
M=D // 13849
@Int32.leftshift // 13850
D=A // 13851
@13 // 13852
M=D // 13853
@Int32.u4_array_div_u4_array.ret.8 // 13854
D=A // 13855
@CALL // 13856
0;JMP // 13857
(Int32.u4_array_div_u4_array.ret.8)
@SP // 13858
AM=M-1 // 13859
D=M // 13860
@15 // 13861
D=D&A // 13862
@SP // 13863
AM=M-1 // 13864
A=M // 13865
M=D // 13866

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 17")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 8}
//}

@17 // 13867
D=A // 13868
@SP // 13869
AM=M+1 // 13870
A=A-1 // 13871
M=D // 13872
// call Memory.alloc
@6 // 13873
D=A // 13874
@14 // 13875
M=D // 13876
@Memory.alloc // 13877
D=A // 13878
@13 // 13879
M=D // 13880
@Int32.u4_array_div_u4_array.ret.9 // 13881
D=A // 13882
@CALL // 13883
0;JMP // 13884
(Int32.u4_array_div_u4_array.ret.9)
@LCL // 13885
D=M // 13886
@8 // 13887
A=D+A // 13888
D=A // 13889
@R13 // 13890
M=D // 13891
@SP // 13892
AM=M-1 // 13893
D=M // 13894
@R13 // 13895
A=M // 13896
M=D // 13897

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 15"),
//            binaryOp: "ADD"
//        )
//), BinaryPushGroup(
//    left:
//        PushInstruction("constant 4"),
//    right:
//        PushInstruction("local 5"),
//    binaryOp: "SUB"
//)], call=CallInstruction{Int32.arith_rightshift}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 16"),
//    binaryOp: "ADD"
//)}
@LCL // 13898
D=M // 13899
@8 // 13900
A=D+A // 13901
D=M // 13902
@16 // 13903
D=D+A // 13904
@SP // 13905
AM=M+1 // 13906
A=A-1 // 13907
M=D // 13908
@ARG // 13909
A=M // 13910
D=M // 13911
@ARG // 13912
A=M // 13913
D=M // 13914
@15 // 13915
D=D+A // 13916
A=D // 13917
D=M // 13918
@SP // 13919
AM=M+1 // 13920
A=A-1 // 13921
M=D // 13922
@LCL // 13923
D=M // 13924
@5 // 13925
A=D+A // 13926
D=M // 13927
@4 // 13928
D=A-D // 13929
@SP // 13930
AM=M+1 // 13931
A=A-1 // 13932
M=D // 13933
// call Int32.arith_rightshift
@7 // 13934
D=A // 13935
@14 // 13936
M=D // 13937
@Int32.arith_rightshift // 13938
D=A // 13939
@13 // 13940
M=D // 13941
@Int32.u4_array_div_u4_array.ret.10 // 13942
D=A // 13943
@CALL // 13944
0;JMP // 13945
(Int32.u4_array_div_u4_array.ret.10)
@SP // 13946
AM=M-1 // 13947
D=M // 13948
@SP // 13949
AM=M-1 // 13950
A=M // 13951
M=D // 13952

////PushPopPair {
//  push: PushInstruction("constant 15")
//  pop:  PopInstruction{address=local 1}
//}

@15 // 13953
D=A // 13954
@LCL // 13955
A=M+1 // 13956
M=D // 13957

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP3}
// label Int32.u4_array_div_u4_array_WHILE_EXP3
(Int32.u4_array_div_u4_array_WHILE_EXP3)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END3}}
@Int32.u4_array_div_u4_array.LT.33 // 13958
D=A // 13959
@SP // 13960
AM=M+1 // 13961
A=A-1 // 13962
M=D // 13963
@LCL // 13964
A=M+1 // 13965
D=M // 13966
D=D-1 // 13967
@DO_LT // 13968
0;JMP // 13969
(Int32.u4_array_div_u4_array.LT.33)
@Int32.u4_array_div_u4_array_WHILE_END3 // 13970
D;JNE // 13971

////PushWriter{source=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 5")], call=CallInstruction{Int32.leftshift}},
//            right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//), BinaryPushGroup(
//    left:
//        PushInstruction("constant 4"),
//    right:
//        PushInstruction("local 5"),
//    binaryOp: "SUB"
//)], call=CallInstruction{Int32.arith_rightshift}},
//            binaryOp: "OR"
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13972
D=M // 13973
@8 // 13974
A=D+A // 13975
D=M // 13976
@SP // 13977
AM=M+1 // 13978
A=A-1 // 13979
M=D // 13980
@LCL // 13981
A=M+1 // 13982
D=M // 13983
@SP // 13984
AM=M-1 // 13985
D=D+M // 13986
@SP // 13987
AM=M+1 // 13988
A=A-1 // 13989
M=D // 13990
@ARG // 13991
A=M // 13992
D=M // 13993
@LCL // 13994
A=M+1 // 13995
A=D+M // 13996
D=M // 13997
@SP // 13998
AM=M+1 // 13999
A=A-1 // 14000
M=D // 14001
@LCL // 14002
D=M // 14003
@5 // 14004
A=D+A // 14005
D=M // 14006
@SP // 14007
AM=M+1 // 14008
A=A-1 // 14009
M=D // 14010
// call Int32.leftshift
@7 // 14011
D=A // 14012
@14 // 14013
M=D // 14014
@Int32.leftshift // 14015
D=A // 14016
@13 // 14017
M=D // 14018
@Int32.u4_array_div_u4_array.ret.11 // 14019
D=A // 14020
@CALL // 14021
0;JMP // 14022
(Int32.u4_array_div_u4_array.ret.11)
@ARG // 14023
A=M // 14024
D=M // 14025
@SP // 14026
AM=M+1 // 14027
A=A-1 // 14028
M=D // 14029
@LCL // 14030
A=M+1 // 14031
D=M // 14032
D=D-1 // 14033
@SP // 14034
AM=M-1 // 14035
A=D+M // 14036
D=M // 14037
@SP // 14038
AM=M+1 // 14039
A=A-1 // 14040
M=D // 14041
@LCL // 14042
D=M // 14043
@5 // 14044
A=D+A // 14045
D=M // 14046
@4 // 14047
D=A-D // 14048
@SP // 14049
AM=M+1 // 14050
A=A-1 // 14051
M=D // 14052
// call Int32.arith_rightshift
@7 // 14053
D=A // 14054
@14 // 14055
M=D // 14056
@Int32.arith_rightshift // 14057
D=A // 14058
@13 // 14059
M=D // 14060
@Int32.u4_array_div_u4_array.ret.12 // 14061
D=A // 14062
@CALL // 14063
0;JMP // 14064
(Int32.u4_array_div_u4_array.ret.12)
@SP // 14065
AM=M-1 // 14066
D=M // 14067
@SP // 14068
AM=M-1 // 14069
D=D|M // 14070
@15 // 14071
D=D&A // 14072
@SP // 14073
AM=M-1 // 14074
A=M // 14075
M=D // 14076

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

@LCL // 14077
A=M+1 // 14078
M=M-1 // 14079

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP3}
// goto Int32.u4_array_div_u4_array_WHILE_EXP3
@Int32.u4_array_div_u4_array_WHILE_EXP3 // 14080
0;JMP // 14081

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END3}
// label Int32.u4_array_div_u4_array_WHILE_END3
(Int32.u4_array_div_u4_array_WHILE_END3)

////PushWriter{source=BinaryPushGroup(
//    left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 5")], call=CallInstruction{Int32.leftshift}},
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 14082
D=M // 14083
@8 // 14084
A=D+A // 14085
D=M // 14086
@SP // 14087
AM=M+1 // 14088
A=A-1 // 14089
M=D // 14090
@ARG // 14091
A=M // 14092
A=M // 14093
D=M // 14094
@SP // 14095
AM=M+1 // 14096
A=A-1 // 14097
M=D // 14098
@LCL // 14099
D=M // 14100
@5 // 14101
A=D+A // 14102
D=M // 14103
@SP // 14104
AM=M+1 // 14105
A=A-1 // 14106
M=D // 14107
// call Int32.leftshift
@7 // 14108
D=A // 14109
@14 // 14110
M=D // 14111
@Int32.leftshift // 14112
D=A // 14113
@13 // 14114
M=D // 14115
@Int32.u4_array_div_u4_array.ret.13 // 14116
D=A // 14117
@CALL // 14118
0;JMP // 14119
(Int32.u4_array_div_u4_array.ret.13)
@SP // 14120
AM=M-1 // 14121
D=M // 14122
@15 // 14123
D=D&A // 14124
@SP // 14125
AM=M-1 // 14126
A=M // 14127
M=D // 14128

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("constant 16"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 14129
A=M+1 // 14130
A=A+1 // 14131
D=M // 14132
@16 // 14133
D=A-D // 14134
@LCL // 14135
A=M+1 // 14136
A=A+1 // 14137
M=D // 14138

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP4}
// label Int32.u4_array_div_u4_array_WHILE_EXP4
(Int32.u4_array_div_u4_array_WHILE_EXP4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END4}}
@Int32.u4_array_div_u4_array.LT.34 // 14139
D=A // 14140
@SP // 14141
AM=M+1 // 14142
A=A-1 // 14143
M=D // 14144
@LCL // 14145
A=M+1 // 14146
A=A+1 // 14147
D=M // 14148
@DO_LT // 14149
0;JMP // 14150
(Int32.u4_array_div_u4_array.LT.34)
@Int32.u4_array_div_u4_array_WHILE_END4 // 14151
D;JNE // 14152

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 8"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 2"),
//                    right:
//                        PushInstruction("argument 2"),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 0")], call=CallInstruction{Math.multiply}},
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 2"),
//                                    right:
//                                        PushInstruction("argument 2"),
//                                    binaryOp: "ADD"
//                                ),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "SUB"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 14153
D=M // 14154
@8 // 14155
A=D+A // 14156
D=M // 14157
@SP // 14158
AM=M+1 // 14159
A=A-1 // 14160
M=D // 14161
@LCL // 14162
A=M+1 // 14163
A=A+1 // 14164
D=M // 14165
@ARG // 14166
A=M+1 // 14167
A=A+1 // 14168
D=D+M // 14169
@SP // 14170
AM=M-1 // 14171
A=D+M // 14172
D=M // 14173
@SP // 14174
AM=M+1 // 14175
A=A-1 // 14176
M=D // 14177
@LCL // 14178
A=M // 14179
D=M // 14180
@SP // 14181
AM=M+1 // 14182
A=A-1 // 14183
M=D // 14184
// call Math.multiply
@7 // 14185
D=A // 14186
@14 // 14187
M=D // 14188
@Math.multiply // 14189
D=A // 14190
@13 // 14191
M=D // 14192
@Int32.u4_array_div_u4_array.ret.14 // 14193
D=A // 14194
@CALL // 14195
0;JMP // 14196
(Int32.u4_array_div_u4_array.ret.14)
@LCL // 14197
D=M // 14198
@8 // 14199
A=D+A // 14200
D=M // 14201
@SP // 14202
AM=M+1 // 14203
A=A-1 // 14204
M=D // 14205
@LCL // 14206
A=M+1 // 14207
A=A+1 // 14208
D=M // 14209
@ARG // 14210
A=M+1 // 14211
A=A+1 // 14212
D=D+M // 14213
D=D-1 // 14214
@SP // 14215
AM=M-1 // 14216
A=D+M // 14217
D=M // 14218
@SP // 14219
AM=M-1 // 14220
D=D+M // 14221
@SP // 14222
AM=M+1 // 14223
A=A-1 // 14224
M=D // 14225
@LCL // 14226
D=M // 14227
@4 // 14228
A=D+A // 14229
D=A // 14230
@R13 // 14231
M=D // 14232
@SP // 14233
AM=M-1 // 14234
D=M // 14235
@R13 // 14236
A=M // 14237
M=D // 14238

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 7"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 2"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14239
D=M // 14240
@4 // 14241
A=D+A // 14242
D=M // 14243
@SP // 14244
AM=M+1 // 14245
A=A-1 // 14246
M=D // 14247
@LCL // 14248
D=M // 14249
@7 // 14250
A=D+A // 14251
D=M // 14252
@SP // 14253
AM=M+1 // 14254
A=A-1 // 14255
M=D // 14256
@ARG // 14257
A=M+1 // 14258
A=A+1 // 14259
D=M // 14260
D=D-1 // 14261
@SP // 14262
AM=M-1 // 14263
A=D+M // 14264
D=M // 14265
@SP // 14266
AM=M+1 // 14267
A=A-1 // 14268
M=D // 14269
// call Math.divide
@7 // 14270
D=A // 14271
@14 // 14272
M=D // 14273
@Math.divide // 14274
D=A // 14275
@13 // 14276
M=D // 14277
@Int32.u4_array_div_u4_array.ret.15 // 14278
D=A // 14279
@CALL // 14280
0;JMP // 14281
(Int32.u4_array_div_u4_array.ret.15)
@LCL // 14282
D=M // 14283
@9 // 14284
A=D+A // 14285
D=A // 14286
@R13 // 14287
M=D // 14288
@SP // 14289
AM=M-1 // 14290
D=M // 14291
@R13 // 14292
A=M // 14293
M=D // 14294

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//CallGroup{pushes=[PushInstruction("local 9"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 7"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 2"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.multiply}},
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 14295
D=M // 14296
@4 // 14297
A=D+A // 14298
D=M // 14299
@SP // 14300
AM=M+1 // 14301
A=A-1 // 14302
M=D // 14303
@LCL // 14304
D=M // 14305
@9 // 14306
A=D+A // 14307
D=M // 14308
@SP // 14309
AM=M+1 // 14310
A=A-1 // 14311
M=D // 14312
@LCL // 14313
D=M // 14314
@7 // 14315
A=D+A // 14316
D=M // 14317
@SP // 14318
AM=M+1 // 14319
A=A-1 // 14320
M=D // 14321
@ARG // 14322
A=M+1 // 14323
A=A+1 // 14324
D=M // 14325
D=D-1 // 14326
@SP // 14327
AM=M-1 // 14328
A=D+M // 14329
D=M // 14330
@SP // 14331
AM=M+1 // 14332
A=A-1 // 14333
M=D // 14334
// call Math.multiply
@7 // 14335
D=A // 14336
@14 // 14337
M=D // 14338
@Math.multiply // 14339
D=A // 14340
@13 // 14341
M=D // 14342
@Int32.u4_array_div_u4_array.ret.16 // 14343
D=A // 14344
@CALL // 14345
0;JMP // 14346
(Int32.u4_array_div_u4_array.ret.16)
@SP // 14347
AM=M-1 // 14348
D=M // 14349
@SP // 14350
AM=M-1 // 14351
D=M-D // 14352
@SP // 14353
AM=M+1 // 14354
A=A-1 // 14355
M=D // 14356
@LCL // 14357
D=M // 14358
@10 // 14359
A=D+A // 14360
D=A // 14361
@R13 // 14362
M=D // 14363
@SP // 14364
AM=M-1 // 14365
D=M // 14366
@R13 // 14367
A=M // 14368
M=D // 14369

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14370
D=M // 14371
@11 // 14372
A=D+A // 14373
M=0 // 14374

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP5}
// label Int32.u4_array_div_u4_array_WHILE_EXP5
(Int32.u4_array_div_u4_array_WHILE_EXP5)

////ConditionalGroup{push=PushInstruction("local 11"), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END5}}
@LCL // 14375
D=M // 14376
@11 // 14377
A=D+A // 14378
D=M // 14379
@Int32.u4_array_div_u4_array_WHILE_END5 // 14380
D;JNE // 14381

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14382
D=M // 14383
@11 // 14384
A=D+A // 14385
M=-1 // 14386

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("local 9"),
//                right:
//                    PushInstruction("local 0"),
//                binaryOp: "LT"
//            ),
//NOT),
//    right:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[PushInstruction("local 9"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 7"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("argument 2"),
//                    right:
//                        PushInstruction("constant 2"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.multiply}},
//            right:
//                BinaryPushGroup(
//                    left:
//CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 10")], call=CallInstruction{Math.multiply}},
//                    right:
//                        Dereference(
//                            base:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 8"),
//                                    right:
//                                        BinaryPushGroup(
//                                            left:
//                                                BinaryPushGroup(
//                                                    left:
//                                                        PushInstruction("local 2"),
//                                                    right:
//                                                        PushInstruction("argument 2"),
//                                                    binaryOp: "ADD"
//                                                ),
//                                            right:
//                                                PushInstruction("constant 2"),
//                                            binaryOp: "SUB"
//                                        ),
//                                    binaryOp: "ADD"
//                                )
//                        ),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "GT"
//        ),
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE2}}
@Int32.u4_array_div_u4_array.LT.35 // 14387
D=A // 14388
@SP // 14389
AM=M+1 // 14390
A=A-1 // 14391
M=D // 14392
@LCL // 14393
D=M // 14394
@9 // 14395
A=D+A // 14396
D=M // 14397
@SP // 14398
AM=M+1 // 14399
A=A-1 // 14400
M=D // 14401
@LCL // 14402
A=M // 14403
D=M // 14404
@SP // 14405
AM=M-1 // 14406
D=M-D // 14407
@DO_LT // 14408
0;JMP // 14409
(Int32.u4_array_div_u4_array.LT.35)
@SP // 14410
AM=M+1 // 14411
A=A-1 // 14412
M=D // 14413
@SP // 14414
A=M-1 // 14415
M=!D // 14416
@Int32.u4_array_div_u4_array.GT.36 // 14417
D=A // 14418
@SP // 14419
AM=M+1 // 14420
A=A-1 // 14421
M=D // 14422
@LCL // 14423
D=M // 14424
@9 // 14425
A=D+A // 14426
D=M // 14427
@SP // 14428
AM=M+1 // 14429
A=A-1 // 14430
M=D // 14431
@LCL // 14432
D=M // 14433
@7 // 14434
A=D+A // 14435
D=M // 14436
@SP // 14437
AM=M+1 // 14438
A=A-1 // 14439
M=D // 14440
@ARG // 14441
A=M+1 // 14442
A=A+1 // 14443
D=M // 14444
@2 // 14445
D=D-A // 14446
@SP // 14447
AM=M-1 // 14448
A=D+M // 14449
D=M // 14450
@SP // 14451
AM=M+1 // 14452
A=A-1 // 14453
M=D // 14454
// call Math.multiply
@7 // 14455
D=A // 14456
@14 // 14457
M=D // 14458
@Math.multiply // 14459
D=A // 14460
@13 // 14461
M=D // 14462
@Int32.u4_array_div_u4_array.ret.17 // 14463
D=A // 14464
@CALL // 14465
0;JMP // 14466
(Int32.u4_array_div_u4_array.ret.17)
@LCL // 14467
A=M // 14468
D=M // 14469
@SP // 14470
AM=M+1 // 14471
A=A-1 // 14472
M=D // 14473
@LCL // 14474
D=M // 14475
@10 // 14476
A=D+A // 14477
D=M // 14478
@SP // 14479
AM=M+1 // 14480
A=A-1 // 14481
M=D // 14482
// call Math.multiply
@7 // 14483
D=A // 14484
@14 // 14485
M=D // 14486
@Math.multiply // 14487
D=A // 14488
@13 // 14489
M=D // 14490
@Int32.u4_array_div_u4_array.ret.18 // 14491
D=A // 14492
@CALL // 14493
0;JMP // 14494
(Int32.u4_array_div_u4_array.ret.18)
@LCL // 14495
D=M // 14496
@8 // 14497
A=D+A // 14498
D=M // 14499
@SP // 14500
AM=M+1 // 14501
A=A-1 // 14502
M=D // 14503
@LCL // 14504
A=M+1 // 14505
A=A+1 // 14506
D=M // 14507
@ARG // 14508
A=M+1 // 14509
A=A+1 // 14510
D=D+M // 14511
@2 // 14512
D=D-A // 14513
@SP // 14514
AM=M-1 // 14515
A=D+M // 14516
D=M // 14517
@SP // 14518
AM=M-1 // 14519
D=D+M // 14520
@SP // 14521
AM=M-1 // 14522
D=M-D // 14523
@DO_GT // 14524
0;JMP // 14525
(Int32.u4_array_div_u4_array.GT.36)
@SP // 14526
AM=M-1 // 14527
D=D|M // 14528
@Int32.u4_array_div_u4_array$IF_TRUE2 // 14529
D;JNE // 14530

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END2}
// goto Int32.u4_array_div_u4_array$IF_END2
@Int32.u4_array_div_u4_array$IF_END2 // 14531
0;JMP // 14532

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE2}
// label Int32.u4_array_div_u4_array$IF_TRUE2
(Int32.u4_array_div_u4_array$IF_TRUE2)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 9"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 14533
D=M // 14534
@9 // 14535
A=D+A // 14536
M=M-1 // 14537

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 7"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("argument 2"),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "SUB"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 14538
D=M // 14539
@10 // 14540
A=D+A // 14541
D=M // 14542
@SP // 14543
AM=M+1 // 14544
A=A-1 // 14545
M=D // 14546
@LCL // 14547
D=M // 14548
@7 // 14549
A=D+A // 14550
D=M // 14551
@SP // 14552
AM=M+1 // 14553
A=A-1 // 14554
M=D // 14555
@ARG // 14556
A=M+1 // 14557
A=A+1 // 14558
D=M // 14559
D=D-1 // 14560
@SP // 14561
AM=M-1 // 14562
A=D+M // 14563
D=M // 14564
@SP // 14565
AM=M-1 // 14566
D=D+M // 14567
@SP // 14568
AM=M+1 // 14569
A=A-1 // 14570
M=D // 14571
@LCL // 14572
D=M // 14573
@10 // 14574
A=D+A // 14575
D=A // 14576
@R13 // 14577
M=D // 14578
@SP // 14579
AM=M-1 // 14580
D=M // 14581
@R13 // 14582
A=M // 14583
M=D // 14584

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE3}}
@Int32.u4_array_div_u4_array.LT.37 // 14585
D=A // 14586
@SP // 14587
AM=M+1 // 14588
A=A-1 // 14589
M=D // 14590
@LCL // 14591
D=M // 14592
@10 // 14593
A=D+A // 14594
D=M // 14595
@SP // 14596
AM=M+1 // 14597
A=A-1 // 14598
M=D // 14599
@LCL // 14600
A=M // 14601
D=M // 14602
@SP // 14603
AM=M-1 // 14604
D=M-D // 14605
@DO_LT // 14606
0;JMP // 14607
(Int32.u4_array_div_u4_array.LT.37)
@Int32.u4_array_div_u4_array$IF_TRUE3 // 14608
D;JNE // 14609

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END3}
// goto Int32.u4_array_div_u4_array$IF_END3
@Int32.u4_array_div_u4_array$IF_END3 // 14610
0;JMP // 14611

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE3}
// label Int32.u4_array_div_u4_array$IF_TRUE3
(Int32.u4_array_div_u4_array$IF_TRUE3)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14612
D=M // 14613
@11 // 14614
A=D+A // 14615
M=0 // 14616

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END3}
// label Int32.u4_array_div_u4_array$IF_END3
(Int32.u4_array_div_u4_array$IF_END3)

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END2}
// label Int32.u4_array_div_u4_array$IF_END2
(Int32.u4_array_div_u4_array$IF_END2)

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP5}
// goto Int32.u4_array_div_u4_array_WHILE_EXP5
@Int32.u4_array_div_u4_array_WHILE_EXP5 // 14617
0;JMP // 14618

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END5}
// label Int32.u4_array_div_u4_array_WHILE_END5
(Int32.u4_array_div_u4_array_WHILE_END5)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 14619
D=M // 14620
@12 // 14621
A=D+A // 14622
M=0 // 14623

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14624
A=M+1 // 14625
M=0 // 14626

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP6}
// label Int32.u4_array_div_u4_array_WHILE_EXP6
(Int32.u4_array_div_u4_array_WHILE_EXP6)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END6}}
@Int32.u4_array_div_u4_array.LT.38 // 14627
D=A // 14628
@SP // 14629
AM=M+1 // 14630
A=A-1 // 14631
M=D // 14632
@LCL // 14633
A=M+1 // 14634
D=M // 14635
@ARG // 14636
A=M+1 // 14637
A=A+1 // 14638
D=M-D // 14639
@DO_LT // 14640
0;JMP // 14641
(Int32.u4_array_div_u4_array.LT.38)
D=!D // 14642
@Int32.u4_array_div_u4_array_WHILE_END6 // 14643
D;JNE // 14644

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 9"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 7"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 14645
D=M // 14646
@9 // 14647
A=D+A // 14648
D=M // 14649
@SP // 14650
AM=M+1 // 14651
A=A-1 // 14652
M=D // 14653
@LCL // 14654
D=M // 14655
@7 // 14656
A=D+A // 14657
D=M // 14658
@SP // 14659
AM=M+1 // 14660
A=A-1 // 14661
M=D // 14662
@LCL // 14663
A=M+1 // 14664
D=M // 14665
@SP // 14666
AM=M-1 // 14667
A=D+M // 14668
D=M // 14669
@SP // 14670
AM=M+1 // 14671
A=A-1 // 14672
M=D // 14673
// call Math.multiply
@7 // 14674
D=A // 14675
@14 // 14676
M=D // 14677
@Math.multiply // 14678
D=A // 14679
@13 // 14680
M=D // 14681
@Int32.u4_array_div_u4_array.ret.19 // 14682
D=A // 14683
@CALL // 14684
0;JMP // 14685
(Int32.u4_array_div_u4_array.ret.19)
@LCL // 14686
D=M // 14687
@13 // 14688
A=D+A // 14689
D=A // 14690
@R13 // 14691
M=D // 14692
@SP // 14693
AM=M-1 // 14694
D=M // 14695
@R13 // 14696
A=M // 14697
M=D // 14698

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 8"),
//                            right:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 1"),
//                                    right:
//                                        PushInstruction("local 2"),
//                                    binaryOp: "ADD"
//                                ),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("local 12"),
//            binaryOp: "SUB"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 13"),
//            right:
//                PushInstruction("constant 15"),
//            binaryOp: "AND"
//        ),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 14699
D=M // 14700
@8 // 14701
A=D+A // 14702
D=M // 14703
@SP // 14704
AM=M+1 // 14705
A=A-1 // 14706
M=D // 14707
@LCL // 14708
A=M+1 // 14709
A=A+1 // 14710
D=M // 14711
A=A-1 // 14712
D=D+M // 14713
@SP // 14714
AM=M-1 // 14715
A=D+M // 14716
D=M // 14717
@SP // 14718
AM=M+1 // 14719
A=A-1 // 14720
M=D // 14721
@LCL // 14722
D=M // 14723
@12 // 14724
A=D+A // 14725
D=M // 14726
@SP // 14727
AM=M-1 // 14728
D=M-D // 14729
@SP // 14730
AM=M+1 // 14731
A=A-1 // 14732
M=D // 14733
@LCL // 14734
D=M // 14735
@13 // 14736
A=D+A // 14737
D=M // 14738
@15 // 14739
D=D&A // 14740
@SP // 14741
AM=M-1 // 14742
D=M-D // 14743
@SP // 14744
AM=M+1 // 14745
A=A-1 // 14746
M=D // 14747
@LCL // 14748
D=M // 14749
@14 // 14750
A=D+A // 14751
D=A // 14752
@R13 // 14753
M=D // 14754
@SP // 14755
AM=M-1 // 14756
D=M // 14757
@R13 // 14758
A=M // 14759
M=D // 14760

////PushWriter{source=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 14761
D=M // 14762
@8 // 14763
A=D+A // 14764
D=M // 14765
@SP // 14766
AM=M+1 // 14767
A=A-1 // 14768
M=D // 14769
@LCL // 14770
A=M+1 // 14771
A=A+1 // 14772
D=M // 14773
A=A-1 // 14774
D=D+M // 14775
@SP // 14776
AM=M-1 // 14777
D=D+M // 14778
@SP // 14779
AM=M+1 // 14780
A=A-1 // 14781
M=D // 14782
@LCL // 14783
D=M // 14784
@14 // 14785
A=D+A // 14786
D=M // 14787
@15 // 14788
D=D&A // 14789
@SP // 14790
AM=M-1 // 14791
A=M // 14792
M=D // 14793

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 13"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}},
//    right:
//CallGroup{pushes=[PushInstruction("local 14"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}},
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 14794
D=M // 14795
@13 // 14796
A=D+A // 14797
D=M // 14798
@SP // 14799
AM=M+1 // 14800
A=A-1 // 14801
M=D // 14802
@4 // 14803
D=A // 14804
@SP // 14805
AM=M+1 // 14806
A=A-1 // 14807
M=D // 14808
// call Int32.arith_rightshift
@7 // 14809
D=A // 14810
@14 // 14811
M=D // 14812
@Int32.arith_rightshift // 14813
D=A // 14814
@13 // 14815
M=D // 14816
@Int32.u4_array_div_u4_array.ret.20 // 14817
D=A // 14818
@CALL // 14819
0;JMP // 14820
(Int32.u4_array_div_u4_array.ret.20)
@LCL // 14821
D=M // 14822
@14 // 14823
A=D+A // 14824
D=M // 14825
@SP // 14826
AM=M+1 // 14827
A=A-1 // 14828
M=D // 14829
@4 // 14830
D=A // 14831
@SP // 14832
AM=M+1 // 14833
A=A-1 // 14834
M=D // 14835
// call Int32.arith_rightshift
@7 // 14836
D=A // 14837
@14 // 14838
M=D // 14839
@Int32.arith_rightshift // 14840
D=A // 14841
@13 // 14842
M=D // 14843
@Int32.u4_array_div_u4_array.ret.21 // 14844
D=A // 14845
@CALL // 14846
0;JMP // 14847
(Int32.u4_array_div_u4_array.ret.21)
@SP // 14848
AM=M-1 // 14849
D=M // 14850
@SP // 14851
AM=M-1 // 14852
D=M-D // 14853
@SP // 14854
AM=M+1 // 14855
A=A-1 // 14856
M=D // 14857
@LCL // 14858
D=M // 14859
@12 // 14860
A=D+A // 14861
D=A // 14862
@R13 // 14863
M=D // 14864
@SP // 14865
AM=M-1 // 14866
D=M // 14867
@R13 // 14868
A=M // 14869
M=D // 14870

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

@LCL // 14871
A=M+1 // 14872
M=M+1 // 14873

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP6}
// goto Int32.u4_array_div_u4_array_WHILE_EXP6
@Int32.u4_array_div_u4_array_WHILE_EXP6 // 14874
0;JMP // 14875

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END6}
// label Int32.u4_array_div_u4_array_WHILE_END6
(Int32.u4_array_div_u4_array_WHILE_END6)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 2"),
//                            right:
//                                PushInstruction("argument 2"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 14876
D=M // 14877
@8 // 14878
A=D+A // 14879
D=M // 14880
@SP // 14881
AM=M+1 // 14882
A=A-1 // 14883
M=D // 14884
@LCL // 14885
A=M+1 // 14886
A=A+1 // 14887
D=M // 14888
@ARG // 14889
A=M+1 // 14890
A=A+1 // 14891
D=D+M // 14892
@SP // 14893
AM=M-1 // 14894
A=D+M // 14895
D=M // 14896
@SP // 14897
AM=M+1 // 14898
A=A-1 // 14899
M=D // 14900
@LCL // 14901
D=M // 14902
@12 // 14903
A=D+A // 14904
D=M // 14905
@SP // 14906
AM=M-1 // 14907
D=M-D // 14908
@SP // 14909
AM=M+1 // 14910
A=A-1 // 14911
M=D // 14912
@LCL // 14913
D=M // 14914
@14 // 14915
A=D+A // 14916
D=A // 14917
@R13 // 14918
M=D // 14919
@SP // 14920
AM=M-1 // 14921
D=M // 14922
@R13 // 14923
A=M // 14924
M=D // 14925

////PushWriter{source=PushInstruction("local 14"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("argument 2"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 14926
D=M // 14927
@8 // 14928
A=D+A // 14929
D=M // 14930
@SP // 14931
AM=M+1 // 14932
A=A-1 // 14933
M=D // 14934
@LCL // 14935
A=M+1 // 14936
A=A+1 // 14937
D=M // 14938
@ARG // 14939
A=M+1 // 14940
A=A+1 // 14941
D=D+M // 14942
@SP // 14943
AM=M-1 // 14944
D=D+M // 14945
@SP // 14946
AM=M+1 // 14947
A=A-1 // 14948
M=D // 14949
@LCL // 14950
D=M // 14951
@14 // 14952
A=D+A // 14953
D=M // 14954
@SP // 14955
AM=M-1 // 14956
A=M // 14957
M=D // 14958

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)}
@LCL // 14959
D=M // 14960
@6 // 14961
A=D+A // 14962
D=M // 14963
@SP // 14964
AM=M+1 // 14965
A=A-1 // 14966
M=D // 14967
@LCL // 14968
A=M+1 // 14969
A=A+1 // 14970
D=M // 14971
@SP // 14972
AM=M-1 // 14973
D=D+M // 14974
@SP // 14975
AM=M+1 // 14976
A=A-1 // 14977
M=D // 14978
@LCL // 14979
D=M // 14980
@9 // 14981
A=D+A // 14982
D=M // 14983
@SP // 14984
AM=M-1 // 14985
A=M // 14986
M=D // 14987

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE4}}
@Int32.u4_array_div_u4_array.LT.39 // 14988
D=A // 14989
@SP // 14990
AM=M+1 // 14991
A=A-1 // 14992
M=D // 14993
@LCL // 14994
D=M // 14995
@14 // 14996
A=D+A // 14997
D=M // 14998
@DO_LT // 14999
0;JMP // 15000
(Int32.u4_array_div_u4_array.LT.39)
@Int32.u4_array_div_u4_array$IF_TRUE4 // 15001
D;JNE // 15002

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END4}
// goto Int32.u4_array_div_u4_array$IF_END4
@Int32.u4_array_div_u4_array$IF_END4 // 15003
0;JMP // 15004

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE4}
// label Int32.u4_array_div_u4_array$IF_TRUE4
(Int32.u4_array_div_u4_array$IF_TRUE4)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 15005
D=M // 15006
@12 // 15007
A=D+A // 15008
M=0 // 15009

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 6"),
//                    right:
//                        PushInstruction("local 2"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)}
@LCL // 15010
D=M // 15011
@6 // 15012
A=D+A // 15013
D=M // 15014
@SP // 15015
AM=M+1 // 15016
A=A-1 // 15017
M=D // 15018
@LCL // 15019
A=M+1 // 15020
A=A+1 // 15021
D=M // 15022
@SP // 15023
AM=M-1 // 15024
D=D+M // 15025
@SP // 15026
AM=M+1 // 15027
A=A-1 // 15028
M=D // 15029
@LCL // 15030
D=M // 15031
@6 // 15032
A=D+A // 15033
D=M // 15034
@SP // 15035
AM=M+1 // 15036
A=A-1 // 15037
M=D // 15038
@LCL // 15039
A=M+1 // 15040
A=A+1 // 15041
D=M // 15042
@SP // 15043
AM=M-1 // 15044
A=D+M // 15045
D=M // 15046
D=D-1 // 15047
@SP // 15048
AM=M-1 // 15049
A=M // 15050
M=D // 15051

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15052
A=M+1 // 15053
M=0 // 15054

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP7}
// label Int32.u4_array_div_u4_array_WHILE_EXP7
(Int32.u4_array_div_u4_array_WHILE_EXP7)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("argument 2"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END7}}
@Int32.u4_array_div_u4_array.LT.40 // 15055
D=A // 15056
@SP // 15057
AM=M+1 // 15058
A=A-1 // 15059
M=D // 15060
@LCL // 15061
A=M+1 // 15062
D=M // 15063
@ARG // 15064
A=M+1 // 15065
A=A+1 // 15066
D=M-D // 15067
@DO_LT // 15068
0;JMP // 15069
(Int32.u4_array_div_u4_array.LT.40)
D=!D // 15070
@Int32.u4_array_div_u4_array_WHILE_END7 // 15071
D;JNE // 15072

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 8"),
//                            right:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 1"),
//                                    right:
//                                        PushInstruction("local 2"),
//                                    binaryOp: "ADD"
//                                ),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 7"),
//                            right:
//                                PushInstruction("local 1"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 15073
D=M // 15074
@8 // 15075
A=D+A // 15076
D=M // 15077
@SP // 15078
AM=M+1 // 15079
A=A-1 // 15080
M=D // 15081
@LCL // 15082
A=M+1 // 15083
A=A+1 // 15084
D=M // 15085
A=A-1 // 15086
D=D+M // 15087
@SP // 15088
AM=M-1 // 15089
A=D+M // 15090
D=M // 15091
@SP // 15092
AM=M+1 // 15093
A=A-1 // 15094
M=D // 15095
@LCL // 15096
D=M // 15097
@7 // 15098
A=D+A // 15099
D=M // 15100
@SP // 15101
AM=M+1 // 15102
A=A-1 // 15103
M=D // 15104
@LCL // 15105
A=M+1 // 15106
D=M // 15107
@SP // 15108
AM=M-1 // 15109
A=D+M // 15110
D=M // 15111
@SP // 15112
AM=M-1 // 15113
D=D+M // 15114
@SP // 15115
AM=M+1 // 15116
A=A-1 // 15117
M=D // 15118
@LCL // 15119
D=M // 15120
@12 // 15121
A=D+A // 15122
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
@14 // 15133
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

////PushWriter{source=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("local 2"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 15144
D=M // 15145
@8 // 15146
A=D+A // 15147
D=M // 15148
@SP // 15149
AM=M+1 // 15150
A=A-1 // 15151
M=D // 15152
@LCL // 15153
A=M+1 // 15154
A=A+1 // 15155
D=M // 15156
A=A-1 // 15157
D=D+M // 15158
@SP // 15159
AM=M-1 // 15160
D=D+M // 15161
@SP // 15162
AM=M+1 // 15163
A=A-1 // 15164
M=D // 15165
@LCL // 15166
D=M // 15167
@14 // 15168
A=D+A // 15169
D=M // 15170
@15 // 15171
D=D&A // 15172
@SP // 15173
AM=M-1 // 15174
A=M // 15175
M=D // 15176

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 14"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 15177
D=M // 15178
@14 // 15179
A=D+A // 15180
D=M // 15181
@SP // 15182
AM=M+1 // 15183
A=A-1 // 15184
M=D // 15185
@4 // 15186
D=A // 15187
@SP // 15188
AM=M+1 // 15189
A=A-1 // 15190
M=D // 15191
// call Int32.arith_rightshift
@7 // 15192
D=A // 15193
@14 // 15194
M=D // 15195
@Int32.arith_rightshift // 15196
D=A // 15197
@13 // 15198
M=D // 15199
@Int32.u4_array_div_u4_array.ret.22 // 15200
D=A // 15201
@CALL // 15202
0;JMP // 15203
(Int32.u4_array_div_u4_array.ret.22)
@LCL // 15204
D=M // 15205
@12 // 15206
A=D+A // 15207
D=A // 15208
@R13 // 15209
M=D // 15210
@SP // 15211
AM=M-1 // 15212
D=M // 15213
@R13 // 15214
A=M // 15215
M=D // 15216

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

@LCL // 15217
A=M+1 // 15218
M=M+1 // 15219

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP7}
// goto Int32.u4_array_div_u4_array_WHILE_EXP7
@Int32.u4_array_div_u4_array_WHILE_EXP7 // 15220
0;JMP // 15221

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END7}
// label Int32.u4_array_div_u4_array_WHILE_END7
(Int32.u4_array_div_u4_array_WHILE_END7)

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 2"),
//                            right:
//                                PushInstruction("argument 2"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 2"),
//            right:
//                PushInstruction("argument 2"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 15222
D=M // 15223
@8 // 15224
A=D+A // 15225
D=M // 15226
@SP // 15227
AM=M+1 // 15228
A=A-1 // 15229
M=D // 15230
@LCL // 15231
A=M+1 // 15232
A=A+1 // 15233
D=M // 15234
@ARG // 15235
A=M+1 // 15236
A=A+1 // 15237
D=D+M // 15238
@SP // 15239
AM=M-1 // 15240
D=D+M // 15241
@SP // 15242
AM=M+1 // 15243
A=A-1 // 15244
M=D // 15245
@LCL // 15246
D=M // 15247
@8 // 15248
A=D+A // 15249
D=M // 15250
@SP // 15251
AM=M+1 // 15252
A=A-1 // 15253
M=D // 15254
@LCL // 15255
A=M+1 // 15256
A=A+1 // 15257
D=M // 15258
@ARG // 15259
A=M+1 // 15260
A=A+1 // 15261
D=D+M // 15262
@SP // 15263
AM=M-1 // 15264
A=D+M // 15265
D=M // 15266
@SP // 15267
AM=M+1 // 15268
A=A-1 // 15269
M=D // 15270
@LCL // 15271
D=M // 15272
@12 // 15273
A=D+A // 15274
D=M // 15275
@SP // 15276
AM=M-1 // 15277
D=D+M // 15278
@SP // 15279
AM=M-1 // 15280
A=M // 15281
M=D // 15282

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END4}
// label Int32.u4_array_div_u4_array$IF_END4
(Int32.u4_array_div_u4_array$IF_END4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 15283
A=M+1 // 15284
A=A+1 // 15285
M=M-1 // 15286

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP4}
// goto Int32.u4_array_div_u4_array_WHILE_EXP4
@Int32.u4_array_div_u4_array_WHILE_EXP4 // 15287
0;JMP // 15288

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END4}
// label Int32.u4_array_div_u4_array_WHILE_END4
(Int32.u4_array_div_u4_array_WHILE_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15289
D=M // 15290
@7 // 15291
A=D+A // 15292
D=M // 15293
@SP // 15294
AM=M+1 // 15295
A=A-1 // 15296
M=D // 15297
// call Memory.deAlloc
@6 // 15298
D=A // 15299
@14 // 15300
M=D // 15301
@Memory.deAlloc // 15302
D=A // 15303
@13 // 15304
M=D // 15305
@Int32.u4_array_div_u4_array.ret.23 // 15306
D=A // 15307
@CALL // 15308
0;JMP // 15309
(Int32.u4_array_div_u4_array.ret.23)
@SP // 15310
M=M-1 // 15311

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15312
D=M // 15313
@8 // 15314
A=D+A // 15315
D=M // 15316
@SP // 15317
AM=M+1 // 15318
A=A-1 // 15319
M=D // 15320
// call Memory.deAlloc
@6 // 15321
D=A // 15322
@14 // 15323
M=D // 15324
@Memory.deAlloc // 15325
D=A // 15326
@13 // 15327
M=D // 15328
@Int32.u4_array_div_u4_array.ret.24 // 15329
D=A // 15330
@CALL // 15331
0;JMP // 15332
(Int32.u4_array_div_u4_array.ret.24)
@SP // 15333
M=M-1 // 15334

////PushInstruction("local 6")
@LCL // 15335
D=M // 15336
@6 // 15337
A=D+A // 15338
D=M // 15339
@SP // 15340
AM=M+1 // 15341
A=A-1 // 15342
M=D // 15343
@RETURN // 15344
0;JMP // 15345

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.length=0}}
// function String.appendChar with 1
(String.appendChar)
@SP // 15346
AM=M+1 // 15347
A=A-1 // 15348
M=0 // 15349

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15350
A=M // 15351
D=M // 15352
@3 // 15353
M=D // 15354

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.41 // 15355
D=A // 15356
@SP // 15357
AM=M+1 // 15358
A=A-1 // 15359
M=D // 15360
@THIS // 15361
A=M+1 // 15362
A=A+1 // 15363
D=M // 15364
A=A-1 // 15365
D=M-D // 15366
@DO_EQ // 15367
0;JMP // 15368
(String.appendChar.EQ.41)
@String.appendChar$IF_TRUE1 // 15369
D;JNE // 15370

////GotoInstruction{label='String.appendChar$IF_END1}
// goto String.appendChar$IF_END1
@String.appendChar$IF_END1 // 15371
0;JMP // 15372

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
//)], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 15373
A=M+1 // 15374
A=A+1 // 15375
D=M // 15376
D=D+M // 15377
@SP // 15378
AM=M+1 // 15379
A=A-1 // 15380
M=D // 15381
// call Memory.alloc
@6 // 15382
D=A // 15383
@14 // 15384
M=D // 15385
@Memory.alloc // 15386
D=A // 15387
@13 // 15388
M=D // 15389
@String.appendChar.ret.0 // 15390
D=A // 15391
@CALL // 15392
0;JMP // 15393
(String.appendChar.ret.0)
@SP // 15394
AM=M-1 // 15395
D=M // 15396
@LCL // 15397
A=M // 15398
M=D // 15399

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15400
A=M // 15401
D=M // 15402
@SP // 15403
AM=M+1 // 15404
A=A-1 // 15405
M=D // 15406
@LCL // 15407
A=M // 15408
D=M // 15409
@SP // 15410
AM=M+1 // 15411
A=A-1 // 15412
M=D // 15413
@THIS // 15414
A=M+1 // 15415
D=M // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420
// call Memory.copy
@8 // 15421
D=A // 15422
@14 // 15423
M=D // 15424
@Memory.copy // 15425
D=A // 15426
@13 // 15427
M=D // 15428
@String.appendChar.ret.1 // 15429
D=A // 15430
@CALL // 15431
0;JMP // 15432
(String.appendChar.ret.1)
@SP // 15433
M=M-1 // 15434

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15435
A=M // 15436
D=M // 15437
@SP // 15438
AM=M+1 // 15439
A=A-1 // 15440
M=D // 15441
// call Memory.deAlloc
@6 // 15442
D=A // 15443
@14 // 15444
M=D // 15445
@Memory.deAlloc // 15446
D=A // 15447
@13 // 15448
M=D // 15449
@String.appendChar.ret.2 // 15450
D=A // 15451
@CALL // 15452
0;JMP // 15453
(String.appendChar.ret.2)
@SP // 15454
M=M-1 // 15455

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

@THIS // 15456
A=M+1 // 15457
A=A+1 // 15458
D=M // 15459
@THIS // 15460
A=M+1 // 15461
A=A+1 // 15462
M=D+M // 15463

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 15464
A=M // 15465
D=M // 15466
@THIS // 15467
A=M // 15468
M=D // 15469

////LabelInstruction{label='String.appendChar$IF_END1}
// label String.appendChar$IF_END1
(String.appendChar$IF_END1)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("this 1"),
//    binaryOp: "ADD"
//)}
@THIS // 15470
A=M+1 // 15471
D=M // 15472
A=A-1 // 15473
D=D+M // 15474
@SP // 15475
AM=M+1 // 15476
A=A-1 // 15477
M=D // 15478
@ARG // 15479
A=M+1 // 15480
D=M // 15481
@SP // 15482
AM=M-1 // 15483
A=M // 15484
M=D // 15485

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

@THIS // 15486
A=M+1 // 15487
M=M+1 // 15488

////PushInstruction("pointer 0")
@3 // 15489
D=M // 15490
@SP // 15491
AM=M+1 // 15492
A=A-1 // 15493
M=D // 15494
@RETURN // 15495
0;JMP // 15496

////FunctionInstruction{functionName='Main.getSomething', numLocals=2, funcMapping={}}
// function Main.getSomething with 2
(Main.getSomething)
@SP // 15497
M=M+1 // 15498
AM=M+1 // 15499
A=A-1 // 15500
M=0 // 15501
A=A-1 // 15502
M=0 // 15503

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 15504
A=M // 15505
D=M // 15506
@SP // 15507
AM=M+1 // 15508
A=A-1 // 15509
M=D // 15510
// call Number.new
@6 // 15511
D=A // 15512
@14 // 15513
M=D // 15514
@Number.new // 15515
D=A // 15516
@13 // 15517
M=D // 15518
@Main.getSomething.ret.0 // 15519
D=A // 15520
@CALL // 15521
0;JMP // 15522
(Main.getSomething.ret.0)
@SP // 15523
AM=M-1 // 15524
D=M // 15525
@LCL // 15526
A=M // 15527
M=D // 15528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15529
A=M+1 // 15530
D=M // 15531
@SP // 15532
AM=M+1 // 15533
A=A-1 // 15534
M=D // 15535
// call Number.new
@6 // 15536
D=A // 15537
@14 // 15538
M=D // 15539
@Number.new // 15540
D=A // 15541
@13 // 15542
M=D // 15543
@Main.getSomething.ret.1 // 15544
D=A // 15545
@CALL // 15546
0;JMP // 15547
(Main.getSomething.ret.1)
@SP // 15548
AM=M-1 // 15549
D=M // 15550
@LCL // 15551
A=M+1 // 15552
M=D // 15553

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15554
A=M // 15555
D=M // 15556
@SP // 15557
AM=M+1 // 15558
A=A-1 // 15559
M=D // 15560
@LCL // 15561
A=M+1 // 15562
D=M // 15563
@SP // 15564
AM=M+1 // 15565
A=A-1 // 15566
M=D // 15567
// call Number.do_div
@7 // 15568
D=A // 15569
@14 // 15570
M=D // 15571
@Number.do_div // 15572
D=A // 15573
@13 // 15574
M=D // 15575
@Main.getSomething.ret.2 // 15576
D=A // 15577
@CALL // 15578
0;JMP // 15579
(Main.getSomething.ret.2)
@SP // 15580
M=M-1 // 15581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15582
A=M+1 // 15583
D=M // 15584
@SP // 15585
AM=M+1 // 15586
A=A-1 // 15587
M=D // 15588
// call Number.dispose
@6 // 15589
D=A // 15590
@14 // 15591
M=D // 15592
@Number.dispose // 15593
D=A // 15594
@13 // 15595
M=D // 15596
@Main.getSomething.ret.3 // 15597
D=A // 15598
@CALL // 15599
0;JMP // 15600
(Main.getSomething.ret.3)
@SP // 15601
M=M-1 // 15602

////PushInstruction("local 0")
@LCL // 15603
A=M // 15604
D=M // 15605
@SP // 15606
AM=M+1 // 15607
A=A-1 // 15608
M=D // 15609
@RETURN // 15610
0;JMP // 15611

////FunctionInstruction{functionName='Main.render', numLocals=29, funcMapping={Main.getSomething=4}}
// function Main.render with 29
(Main.render)
@29 // 15612
D=A // 15613
@SP // 15614
AM=D+M // 15615
A=A-1 // 15616
M=0 // 15617
A=A-1 // 15618
M=0 // 15619
A=A-1 // 15620
M=0 // 15621
A=A-1 // 15622
M=0 // 15623
A=A-1 // 15624
M=0 // 15625
A=A-1 // 15626
M=0 // 15627
A=A-1 // 15628
M=0 // 15629
A=A-1 // 15630
M=0 // 15631
A=A-1 // 15632
M=0 // 15633
A=A-1 // 15634
M=0 // 15635
A=A-1 // 15636
M=0 // 15637
A=A-1 // 15638
M=0 // 15639
A=A-1 // 15640
M=0 // 15641
A=A-1 // 15642
M=0 // 15643
A=A-1 // 15644
M=0 // 15645
A=A-1 // 15646
M=0 // 15647
A=A-1 // 15648
M=0 // 15649
A=A-1 // 15650
M=0 // 15651
A=A-1 // 15652
M=0 // 15653
A=A-1 // 15654
M=0 // 15655
A=A-1 // 15656
M=0 // 15657
A=A-1 // 15658
M=0 // 15659
A=A-1 // 15660
M=0 // 15661
A=A-1 // 15662
M=0 // 15663
A=A-1 // 15664
M=0 // 15665
A=A-1 // 15666
M=0 // 15667
A=A-1 // 15668
M=0 // 15669
A=A-1 // 15670
M=0 // 15671
A=A-1 // 15672
M=0 // 15673

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getWidth}}
//  pop:  PopInstruction{address=local 12}
//}

@ARG // 15674
A=M // 15675
D=M // 15676
@SP // 15677
AM=M+1 // 15678
A=A-1 // 15679
M=D // 15680
// call Scene.getWidth
@6 // 15681
D=A // 15682
@14 // 15683
M=D // 15684
@Scene.getWidth // 15685
D=A // 15686
@13 // 15687
M=D // 15688
@Main.render.ret.0 // 15689
D=A // 15690
@CALL // 15691
0;JMP // 15692
(Main.render.ret.0)
@LCL // 15693
D=M // 15694
@12 // 15695
A=D+A // 15696
D=A // 15697
@R13 // 15698
M=D // 15699
@SP // 15700
AM=M-1 // 15701
D=M // 15702
@R13 // 15703
A=M // 15704
M=D // 15705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 15706
D=M // 15707
@12 // 15708
A=D+A // 15709
D=M // 15710
@SP // 15711
AM=M+1 // 15712
A=A-1 // 15713
M=D // 15714
// call Memory.alloc
@6 // 15715
D=A // 15716
@14 // 15717
M=D // 15718
@Memory.alloc // 15719
D=A // 15720
@13 // 15721
M=D // 15722
@Main.render.ret.1 // 15723
D=A // 15724
@CALL // 15725
0;JMP // 15726
(Main.render.ret.1)
@LCL // 15727
D=M // 15728
@13 // 15729
A=D+A // 15730
D=A // 15731
@R13 // 15732
M=D // 15733
@SP // 15734
AM=M-1 // 15735
D=M // 15736
@R13 // 15737
A=M // 15738
M=D // 15739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 15740
D=M // 15741
@12 // 15742
A=D+A // 15743
D=M // 15744
@SP // 15745
AM=M+1 // 15746
A=A-1 // 15747
M=D // 15748
// call Memory.alloc
@6 // 15749
D=A // 15750
@14 // 15751
M=D // 15752
@Memory.alloc // 15753
D=A // 15754
@13 // 15755
M=D // 15756
@Main.render.ret.2 // 15757
D=A // 15758
@CALL // 15759
0;JMP // 15760
(Main.render.ret.2)
@LCL // 15761
D=M // 15762
@14 // 15763
A=D+A // 15764
D=A // 15765
@R13 // 15766
M=D // 15767
@SP // 15768
AM=M-1 // 15769
D=M // 15770
@R13 // 15771
A=M // 15772
M=D // 15773

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 16}
//}

@LCL // 15774
D=M // 15775
@16 // 15776
A=D+A // 15777
M=0 // 15778

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 15779
D=M // 15780
@11 // 15781
A=D+A // 15782
M=0 // 15783

////LabelInstruction{label='Main.render_WHILE_EXP1}
// label Main.render_WHILE_EXP1
(Main.render_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 11"),
//        right:
//            PushInstruction("local 12"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.render_WHILE_END1}}
@Main.render.LT.42 // 15784
D=A // 15785
@SP // 15786
AM=M+1 // 15787
A=A-1 // 15788
M=D // 15789
@LCL // 15790
D=M // 15791
@12 // 15792
A=D+A // 15793
D=M // 15794
A=A-1 // 15795
D=M-D // 15796
@DO_LT // 15797
0;JMP // 15798
(Main.render.LT.42)
D=!D // 15799
@Main.render_WHILE_END1 // 15800
D;JNE // 15801

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 13"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 15802
D=M // 15803
@13 // 15804
A=D+A // 15805
D=M // 15806
A=A-1 // 15807
A=A-1 // 15808
D=D+M // 15809
@SP // 15810
AM=M+1 // 15811
A=A-1 // 15812
M=D // 15813
D=0 // 15814
@SP // 15815
AM=M-1 // 15816
A=M // 15817
M=D // 15818

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 15819
D=M // 15820
@14 // 15821
A=D+A // 15822
D=M // 15823
A=A-1 // 15824
A=A-1 // 15825
A=A-1 // 15826
D=D+M // 15827
@SP // 15828
AM=M+1 // 15829
A=A-1 // 15830
M=D // 15831
D=0 // 15832
@SP // 15833
AM=M-1 // 15834
A=M // 15835
M=D // 15836

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 11"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 15837
D=M // 15838
@11 // 15839
A=D+A // 15840
M=M+1 // 15841

////GotoInstruction{label='Main.render_WHILE_EXP1}
// goto Main.render_WHILE_EXP1
@Main.render_WHILE_EXP1 // 15842
0;JMP // 15843

////LabelInstruction{label='Main.render_WHILE_END1}
// label Main.render_WHILE_END1
(Main.render_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}
//  pop:  PopInstruction{address=local 0}
//}

@2 // 15844
D=A // 15845
@SP // 15846
M=D+M // 15847
@2 // 15848
D=A // 15849
@SP // 15850
A=M-1 // 15851
M=D // 15852
A=A-1 // 15853
M=1 // 15854
// call Main.getSomething
@7 // 15855
D=A // 15856
@14 // 15857
M=D // 15858
@Main.getSomething // 15859
D=A // 15860
@13 // 15861
M=D // 15862
@Main.render.ret.3 // 15863
D=A // 15864
@CALL // 15865
0;JMP // 15866
(Main.render.ret.3)
@SP // 15867
AM=M-1 // 15868
D=M // 15869
@LCL // 15870
A=M // 15871
M=D // 15872

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@SP // 15873
AM=M+1 // 15874
A=A-1 // 15875
M=0 // 15876
// call Number.new
@6 // 15877
D=A // 15878
@14 // 15879
M=D // 15880
@Number.new // 15881
D=A // 15882
@13 // 15883
M=D // 15884
@Main.render.ret.4 // 15885
D=A // 15886
@CALL // 15887
0;JMP // 15888
(Main.render.ret.4)
@SP // 15889
AM=M-1 // 15890
D=M // 15891
@LCL // 15892
A=M+1 // 15893
M=D // 15894

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 2}
//}

@SP // 15895
AM=M+1 // 15896
A=A-1 // 15897
M=1 // 15898
// call Number.new
@6 // 15899
D=A // 15900
@14 // 15901
M=D // 15902
@Number.new // 15903
D=A // 15904
@13 // 15905
M=D // 15906
@Main.render.ret.5 // 15907
D=A // 15908
@CALL // 15909
0;JMP // 15910
(Main.render.ret.5)
@SP // 15911
AM=M-1 // 15912
D=M // 15913
@LCL // 15914
A=M+1 // 15915
A=A+1 // 15916
M=D // 15917

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 15918
D=A // 15919
@SP // 15920
AM=M+1 // 15921
A=A-1 // 15922
M=D // 15923
// call Number.new
@6 // 15924
D=A // 15925
@14 // 15926
M=D // 15927
@Number.new // 15928
D=A // 15929
@13 // 15930
M=D // 15931
@Main.render.ret.6 // 15932
D=A // 15933
@CALL // 15934
0;JMP // 15935
(Main.render.ret.6)
@SP // 15936
AM=M-1 // 15937
D=M // 15938
@LCL // 15939
A=M+1 // 15940
A=A+1 // 15941
A=A+1 // 15942
M=D // 15943

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 4}
//}

@3 // 15944
D=A // 15945
@SP // 15946
AM=M+1 // 15947
A=A-1 // 15948
M=D // 15949
// call Number.new
@6 // 15950
D=A // 15951
@14 // 15952
M=D // 15953
@Number.new // 15954
D=A // 15955
@13 // 15956
M=D // 15957
@Main.render.ret.7 // 15958
D=A // 15959
@CALL // 15960
0;JMP // 15961
(Main.render.ret.7)
@LCL // 15962
D=M // 15963
@4 // 15964
A=D+A // 15965
D=A // 15966
@R13 // 15967
M=D // 15968
@SP // 15969
AM=M-1 // 15970
D=M // 15971
@R13 // 15972
A=M // 15973
M=D // 15974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 5")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 5}
//}

@5 // 15975
D=A // 15976
@SP // 15977
AM=M+1 // 15978
A=A-1 // 15979
M=D // 15980
// call Number.new
@6 // 15981
D=A // 15982
@14 // 15983
M=D // 15984
@Number.new // 15985
D=A // 15986
@13 // 15987
M=D // 15988
@Main.render.ret.8 // 15989
D=A // 15990
@CALL // 15991
0;JMP // 15992
(Main.render.ret.8)
@LCL // 15993
D=M // 15994
@5 // 15995
A=D+A // 15996
D=A // 15997
@R13 // 15998
M=D // 15999
@SP // 16000
AM=M-1 // 16001
D=M // 16002
@R13 // 16003
A=M // 16004
M=D // 16005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 7")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 6}
//}

@7 // 16006
D=A // 16007
@SP // 16008
AM=M+1 // 16009
A=A-1 // 16010
M=D // 16011
// call Number.new
@6 // 16012
D=A // 16013
@14 // 16014
M=D // 16015
@Number.new // 16016
D=A // 16017
@13 // 16018
M=D // 16019
@Main.render.ret.9 // 16020
D=A // 16021
@CALL // 16022
0;JMP // 16023
(Main.render.ret.9)
@LCL // 16024
D=M // 16025
@6 // 16026
A=D+A // 16027
D=A // 16028
@R13 // 16029
M=D // 16030
@SP // 16031
AM=M-1 // 16032
D=M // 16033
@R13 // 16034
A=M // 16035
M=D // 16036

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 7}
//}

@16 // 16037
D=A // 16038
@SP // 16039
AM=M+1 // 16040
A=A-1 // 16041
M=D // 16042
// call Number.new
@6 // 16043
D=A // 16044
@14 // 16045
M=D // 16046
@Number.new // 16047
D=A // 16048
@13 // 16049
M=D // 16050
@Main.render.ret.10 // 16051
D=A // 16052
@CALL // 16053
0;JMP // 16054
(Main.render.ret.10)
@LCL // 16055
D=M // 16056
@7 // 16057
A=D+A // 16058
D=A // 16059
@R13 // 16060
M=D // 16061
@SP // 16062
AM=M-1 // 16063
D=M // 16064
@R13 // 16065
A=M // 16066
M=D // 16067

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 8}
//}

@SP // 16068
AM=M+1 // 16069
A=A-1 // 16070
M=-1 // 16071
// call Number.new
@6 // 16072
D=A // 16073
@14 // 16074
M=D // 16075
@Number.new // 16076
D=A // 16077
@13 // 16078
M=D // 16079
@Main.render.ret.11 // 16080
D=A // 16081
@CALL // 16082
0;JMP // 16083
(Main.render.ret.11)
@LCL // 16084
D=M // 16085
@8 // 16086
A=D+A // 16087
D=A // 16088
@R13 // 16089
M=D // 16090
@SP // 16091
AM=M-1 // 16092
D=M // 16093
@R13 // 16094
A=M // 16095
M=D // 16096

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 16097
D=M // 16098
@9 // 16099
A=D+A // 16100
M=0 // 16101

////LabelInstruction{label='Main.render_WHILE_EXP2}
// label Main.render_WHILE_EXP2
(Main.render_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 9"),
//        right:
//CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getHeight}},
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.render_WHILE_END2}}
@Main.render.LT.43 // 16102
D=A // 16103
@SP // 16104
AM=M+1 // 16105
A=A-1 // 16106
M=D // 16107
@LCL // 16108
D=M // 16109
@9 // 16110
A=D+A // 16111
D=M // 16112
@SP // 16113
AM=M+1 // 16114
A=A-1 // 16115
M=D // 16116
@ARG // 16117
A=M // 16118
D=M // 16119
@SP // 16120
AM=M+1 // 16121
A=A-1 // 16122
M=D // 16123
// call Scene.getHeight
@6 // 16124
D=A // 16125
@14 // 16126
M=D // 16127
@Scene.getHeight // 16128
D=A // 16129
@13 // 16130
M=D // 16131
@Main.render.ret.12 // 16132
D=A // 16133
@CALL // 16134
0;JMP // 16135
(Main.render.ret.12)
@SP // 16136
AM=M-1 // 16137
D=M // 16138
@SP // 16139
AM=M-1 // 16140
D=M-D // 16141
@DO_LT // 16142
0;JMP // 16143
(Main.render.LT.43)
D=!D // 16144
@Main.render_WHILE_END2 // 16145
D;JNE // 16146

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 9"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 27}
//}

@LCL // 16147
D=M // 16148
@9 // 16149
A=D+A // 16150
D=M // 16151
@1 // 16152
D=D&A // 16153
@SP // 16154
AM=M+1 // 16155
A=A-1 // 16156
M=D // 16157
@LCL // 16158
D=M // 16159
@27 // 16160
A=D+A // 16161
D=A // 16162
@R13 // 16163
M=D // 16164
@SP // 16165
AM=M-1 // 16166
D=M // 16167
@R13 // 16168
A=M // 16169
M=D // 16170

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 28}
//}

@LCL // 16171
D=M // 16172
@28 // 16173
A=D+A // 16174
M=-1 // 16175

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE1}}
@LCL // 16176
D=M // 16177
@27 // 16178
A=D+A // 16179
D=M // 16180
@Main.render$IF_TRUE1 // 16181
D;JNE // 16182

////GotoInstruction{label='Main.render$IF_FALSE1}
// goto Main.render$IF_FALSE1
@Main.render$IF_FALSE1 // 16183
0;JMP // 16184

////LabelInstruction{label='Main.render$IF_TRUE1}
// label Main.render$IF_TRUE1
(Main.render$IF_TRUE1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 12"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 16185
D=M // 16186
@12 // 16187
A=D+A // 16188
D=M // 16189
@SP // 16190
AM=M+1 // 16191
A=A-1 // 16192
M=D-1 // 16193
@LCL // 16194
D=M // 16195
@10 // 16196
A=D+A // 16197
D=A // 16198
@R13 // 16199
M=D // 16200
@SP // 16201
AM=M-1 // 16202
D=M // 16203
@R13 // 16204
A=M // 16205
M=D // 16206

////GotoInstruction{label='Main.render$IF_END1}
// goto Main.render$IF_END1
@Main.render$IF_END1 // 16207
0;JMP // 16208

////LabelInstruction{label='Main.render$IF_FALSE1}
// label Main.render$IF_FALSE1
(Main.render$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 16209
D=M // 16210
@10 // 16211
A=D+A // 16212
M=0 // 16213

////LabelInstruction{label='Main.render$IF_END1}
// label Main.render$IF_END1
(Main.render$IF_END1)

////LabelInstruction{label='Main.render_WHILE_EXP3}
// label Main.render_WHILE_EXP3
(Main.render_WHILE_EXP3)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 28"),
//NOT), ifGoto=IfGotoInstruction{label='Main.render_WHILE_END3}}
@LCL // 16214
D=M // 16215
@28 // 16216
A=D+A // 16217
D=!M // 16218
@Main.render_WHILE_END3 // 16219
D;JNE // 16220

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 10"), PushInstruction("local 9"), PushInstruction("local 8"), PushInstruction("local 2"), PushInstruction("local 3"), PushInstruction("local 0")], call=CallInstruction{Main.getRawPixelColor}}
//  pop:  PopInstruction{address=local 25}
//}

@ARG // 16221
A=M // 16222
D=M // 16223
@SP // 16224
AM=M+1 // 16225
A=A-1 // 16226
M=D // 16227
@LCL // 16228
D=M // 16229
@10 // 16230
A=D+A // 16231
D=M // 16232
@SP // 16233
AM=M+1 // 16234
A=A-1 // 16235
M=D // 16236
@LCL // 16237
D=M // 16238
@9 // 16239
A=D+A // 16240
D=M // 16241
@SP // 16242
AM=M+1 // 16243
A=A-1 // 16244
M=D // 16245
@LCL // 16246
D=M // 16247
@8 // 16248
A=D+A // 16249
D=M // 16250
@SP // 16251
AM=M+1 // 16252
A=A-1 // 16253
M=D // 16254
@LCL // 16255
A=M+1 // 16256
A=A+1 // 16257
D=M // 16258
@SP // 16259
AM=M+1 // 16260
A=A-1 // 16261
M=D // 16262
@LCL // 16263
A=M+1 // 16264
A=A+1 // 16265
A=A+1 // 16266
D=M // 16267
@SP // 16268
AM=M+1 // 16269
A=A-1 // 16270
M=D // 16271
@LCL // 16272
A=M // 16273
D=M // 16274
@SP // 16275
AM=M+1 // 16276
A=A-1 // 16277
M=D // 16278
// call Main.getRawPixelColor
@12 // 16279
D=A // 16280
@14 // 16281
M=D // 16282
@Main.getRawPixelColor // 16283
D=A // 16284
@13 // 16285
M=D // 16286
@Main.render.ret.13 // 16287
D=A // 16288
@CALL // 16289
0;JMP // 16290
(Main.render.ret.13)
@LCL // 16291
D=M // 16292
@25 // 16293
A=D+A // 16294
D=A // 16295
@R13 // 16296
M=D // 16297
@SP // 16298
AM=M-1 // 16299
D=M // 16300
@R13 // 16301
A=M // 16302
M=D // 16303

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16304
D=M // 16305
@25 // 16306
A=D+A // 16307
D=M // 16308
@SP // 16309
AM=M+1 // 16310
A=A-1 // 16311
M=D // 16312
// call Number.do_sqrt
@6 // 16313
D=A // 16314
@14 // 16315
M=D // 16316
@Number.do_sqrt // 16317
D=A // 16318
@13 // 16319
M=D // 16320
@Main.render.ret.14 // 16321
D=A // 16322
@CALL // 16323
0;JMP // 16324
(Main.render.ret.14)
@SP // 16325
M=M-1 // 16326

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 16")], call=CallInstruction{Number.new_from_int_frac}}
//  pop:  PopInstruction{address=local 26}
//}

@LCL // 16327
D=M // 16328
@16 // 16329
A=D+A // 16330
D=M // 16331
@SP // 16332
AM=M+1 // 16333
A=A-1 // 16334
M=D // 16335
// call Number.new_from_int_frac
@6 // 16336
D=A // 16337
@14 // 16338
M=D // 16339
@Number.new_from_int_frac // 16340
D=A // 16341
@13 // 16342
M=D // 16343
@Main.render.ret.15 // 16344
D=A // 16345
@CALL // 16346
0;JMP // 16347
(Main.render.ret.15)
@LCL // 16348
D=M // 16349
@26 // 16350
A=D+A // 16351
D=A // 16352
@R13 // 16353
M=D // 16354
@SP // 16355
AM=M-1 // 16356
D=M // 16357
@R13 // 16358
A=M // 16359
M=D // 16360

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 26")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16361
D=M // 16362
@25 // 16363
A=D+A // 16364
D=M // 16365
@SP // 16366
AM=M+1 // 16367
A=A-1 // 16368
M=D // 16369
@LCL // 16370
D=M // 16371
@26 // 16372
A=D+A // 16373
D=M // 16374
@SP // 16375
AM=M+1 // 16376
A=A-1 // 16377
M=D // 16378
// call Number.do_add
@7 // 16379
D=A // 16380
@14 // 16381
M=D // 16382
@Number.do_add // 16383
D=A // 16384
@13 // 16385
M=D // 16386
@Main.render.ret.16 // 16387
D=A // 16388
@CALL // 16389
0;JMP // 16390
(Main.render.ret.16)
@SP // 16391
M=M-1 // 16392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 26")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16393
D=M // 16394
@26 // 16395
A=D+A // 16396
D=M // 16397
@SP // 16398
AM=M+1 // 16399
A=A-1 // 16400
M=D // 16401
// call Number.dispose
@6 // 16402
D=A // 16403
@14 // 16404
M=D // 16405
@Number.dispose // 16406
D=A // 16407
@13 // 16408
M=D // 16409
@Main.render.ret.17 // 16410
D=A // 16411
@CALL // 16412
0;JMP // 16413
(Main.render.ret.17)
@SP // 16414
M=M-1 // 16415

////PushPopPair {
//  push: CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 13"),
//            right:
//                PushInstruction("local 10"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Number.new_from_int_frac}}
//  pop:  PopInstruction{address=local 26}
//}

@LCL // 16416
D=M // 16417
@13 // 16418
A=D+A // 16419
D=M // 16420
A=A-1 // 16421
A=A-1 // 16422
A=A-1 // 16423
A=D+M // 16424
D=M // 16425
@SP // 16426
AM=M+1 // 16427
A=A-1 // 16428
M=D // 16429
// call Number.new_from_int_frac
@6 // 16430
D=A // 16431
@14 // 16432
M=D // 16433
@Number.new_from_int_frac // 16434
D=A // 16435
@13 // 16436
M=D // 16437
@Main.render.ret.18 // 16438
D=A // 16439
@CALL // 16440
0;JMP // 16441
(Main.render.ret.18)
@LCL // 16442
D=M // 16443
@26 // 16444
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

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 26")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16455
D=M // 16456
@25 // 16457
A=D+A // 16458
D=M // 16459
@SP // 16460
AM=M+1 // 16461
A=A-1 // 16462
M=D // 16463
@LCL // 16464
D=M // 16465
@26 // 16466
A=D+A // 16467
D=M // 16468
@SP // 16469
AM=M+1 // 16470
A=A-1 // 16471
M=D // 16472
// call Number.do_add
@7 // 16473
D=A // 16474
@14 // 16475
M=D // 16476
@Number.do_add // 16477
D=A // 16478
@13 // 16479
M=D // 16480
@Main.render.ret.19 // 16481
D=A // 16482
@CALL // 16483
0;JMP // 16484
(Main.render.ret.19)
@SP // 16485
M=M-1 // 16486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 26")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16487
D=M // 16488
@26 // 16489
A=D+A // 16490
D=M // 16491
@SP // 16492
AM=M+1 // 16493
A=A-1 // 16494
M=D // 16495
// call Number.dispose
@6 // 16496
D=A // 16497
@14 // 16498
M=D // 16499
@Number.dispose // 16500
D=A // 16501
@13 // 16502
M=D // 16503
@Main.render.ret.20 // 16504
D=A // 16505
@CALL // 16506
0;JMP // 16507
(Main.render.ret.20)
@SP // 16508
M=M-1 // 16509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 0")], call=CallInstruction{Number.cmp}}
//  pop:  PopInstruction{address=local 18}
//}

@LCL // 16510
D=M // 16511
@25 // 16512
A=D+A // 16513
D=M // 16514
@SP // 16515
AM=M+1 // 16516
A=A-1 // 16517
M=D // 16518
@LCL // 16519
A=M // 16520
D=M // 16521
@SP // 16522
AM=M+1 // 16523
A=A-1 // 16524
M=D // 16525
// call Number.cmp
@7 // 16526
D=A // 16527
@14 // 16528
M=D // 16529
@Number.cmp // 16530
D=A // 16531
@13 // 16532
M=D // 16533
@Main.render.ret.21 // 16534
D=A // 16535
@CALL // 16536
0;JMP // 16537
(Main.render.ret.21)
@LCL // 16538
D=M // 16539
@18 // 16540
A=D+A // 16541
D=A // 16542
@R13 // 16543
M=D // 16544
@SP // 16545
AM=M-1 // 16546
D=M // 16547
@R13 // 16548
A=M // 16549
M=D // 16550

////PushPopPair {
//  push: UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 18"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT)
//  pop:  PopInstruction{address=local 24}
//}

@Main.render.LT.44 // 16551
D=A // 16552
@SP // 16553
AM=M+1 // 16554
A=A-1 // 16555
M=D // 16556
@LCL // 16557
D=M // 16558
@18 // 16559
A=D+A // 16560
D=M // 16561
@DO_LT // 16562
0;JMP // 16563
(Main.render.LT.44)
@SP // 16564
AM=M+1 // 16565
A=A-1 // 16566
M=D // 16567
@SP // 16568
A=M-1 // 16569
M=!D // 16570
@LCL // 16571
D=M // 16572
@24 // 16573
A=D+A // 16574
D=A // 16575
@R13 // 16576
M=D // 16577
@SP // 16578
AM=M-1 // 16579
D=M // 16580
@R13 // 16581
A=M // 16582
M=D // 16583

////ConditionalGroup{push=PushInstruction("local 24"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE2}}
@LCL // 16584
D=M // 16585
@24 // 16586
A=D+A // 16587
D=M // 16588
@Main.render$IF_TRUE2 // 16589
D;JNE // 16590

////GotoInstruction{label='Main.render$IF_FALSE2}
// goto Main.render$IF_FALSE2
@Main.render$IF_FALSE2 // 16591
0;JMP // 16592

////LabelInstruction{label='Main.render$IF_TRUE2}
// label Main.render$IF_TRUE2
(Main.render$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 17}
//}

@LCL // 16593
A=M+1 // 16594
A=A+1 // 16595
D=M // 16596
@SP // 16597
AM=M+1 // 16598
A=A-1 // 16599
M=D // 16600
@LCL // 16601
D=M // 16602
@17 // 16603
A=D+A // 16604
D=A // 16605
@R13 // 16606
M=D // 16607
@SP // 16608
AM=M-1 // 16609
D=M // 16610
@R13 // 16611
A=M // 16612
M=D // 16613

////GotoInstruction{label='Main.render$IF_END2}
// goto Main.render$IF_END2
@Main.render$IF_END2 // 16614
0;JMP // 16615

////LabelInstruction{label='Main.render$IF_FALSE2}
// label Main.render$IF_FALSE2
(Main.render$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 17}
//}

@LCL // 16616
A=M+1 // 16617
D=M // 16618
@SP // 16619
AM=M+1 // 16620
A=A-1 // 16621
M=D // 16622
@LCL // 16623
D=M // 16624
@17 // 16625
A=D+A // 16626
D=A // 16627
@R13 // 16628
M=D // 16629
@SP // 16630
AM=M-1 // 16631
D=M // 16632
@R13 // 16633
A=M // 16634
M=D // 16635

////LabelInstruction{label='Main.render$IF_END2}
// label Main.render$IF_END2
(Main.render$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 19}
//}

@LCL // 16636
D=M // 16637
@25 // 16638
A=D+A // 16639
D=M // 16640
@SP // 16641
AM=M+1 // 16642
A=A-1 // 16643
M=D // 16644
// call Number.clone
@6 // 16645
D=A // 16646
@14 // 16647
M=D // 16648
@Number.clone // 16649
D=A // 16650
@13 // 16651
M=D // 16652
@Main.render.ret.22 // 16653
D=A // 16654
@CALL // 16655
0;JMP // 16656
(Main.render.ret.22)
@LCL // 16657
D=M // 16658
@19 // 16659
A=D+A // 16660
D=A // 16661
@R13 // 16662
M=D // 16663
@SP // 16664
AM=M-1 // 16665
D=M // 16666
@R13 // 16667
A=M // 16668
M=D // 16669

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19"), PushInstruction("local 17")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16670
D=M // 16671
@19 // 16672
A=D+A // 16673
D=M // 16674
@SP // 16675
AM=M+1 // 16676
A=A-1 // 16677
M=D // 16678
@LCL // 16679
D=M // 16680
@17 // 16681
A=D+A // 16682
D=M // 16683
@SP // 16684
AM=M+1 // 16685
A=A-1 // 16686
M=D // 16687
// call Number.do_sub
@7 // 16688
D=A // 16689
@14 // 16690
M=D // 16691
@Number.do_sub // 16692
D=A // 16693
@13 // 16694
M=D // 16695
@Main.render.ret.23 // 16696
D=A // 16697
@CALL // 16698
0;JMP // 16699
(Main.render.ret.23)
@SP // 16700
M=M-1 // 16701

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19"), PushInstruction("local 7")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16702
D=M // 16703
@19 // 16704
A=D+A // 16705
D=M // 16706
@SP // 16707
AM=M+1 // 16708
A=A-1 // 16709
M=D // 16710
@LCL // 16711
D=M // 16712
@7 // 16713
A=D+A // 16714
D=M // 16715
@SP // 16716
AM=M+1 // 16717
A=A-1 // 16718
M=D // 16719
// call Number.do_div
@7 // 16720
D=A // 16721
@14 // 16722
M=D // 16723
@Number.do_div // 16724
D=A // 16725
@13 // 16726
M=D // 16727
@Main.render.ret.24 // 16728
D=A // 16729
@CALL // 16730
0;JMP // 16731
(Main.render.ret.24)
@SP // 16732
M=M-1 // 16733

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE3}}
@Main.render.LT.45 // 16734
D=A // 16735
@SP // 16736
AM=M+1 // 16737
A=A-1 // 16738
M=D // 16739
@LCL // 16740
D=M // 16741
@10 // 16742
A=D+A // 16743
D=M // 16744
@SP // 16745
AM=M+1 // 16746
A=A-1 // 16747
M=D+1 // 16748
@LCL // 16749
D=M // 16750
@12 // 16751
A=D+A // 16752
D=M // 16753
@SP // 16754
AM=M-1 // 16755
D=M-D // 16756
@DO_LT // 16757
0;JMP // 16758
(Main.render.LT.45)
@Main.render$IF_TRUE3 // 16759
D;JNE // 16760

////GotoInstruction{label='Main.render$IF_END3}
// goto Main.render$IF_END3
@Main.render$IF_END3 // 16761
0;JMP // 16762

////LabelInstruction{label='Main.render$IF_TRUE3}
// label Main.render$IF_TRUE3
(Main.render$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 21}
//}

@LCL // 16763
D=M // 16764
@19 // 16765
A=D+A // 16766
D=M // 16767
@SP // 16768
AM=M+1 // 16769
A=A-1 // 16770
M=D // 16771
// call Number.clone
@6 // 16772
D=A // 16773
@14 // 16774
M=D // 16775
@Number.clone // 16776
D=A // 16777
@13 // 16778
M=D // 16779
@Main.render.ret.25 // 16780
D=A // 16781
@CALL // 16782
0;JMP // 16783
(Main.render.ret.25)
@LCL // 16784
D=M // 16785
@21 // 16786
A=D+A // 16787
D=A // 16788
@R13 // 16789
M=D // 16790
@SP // 16791
AM=M-1 // 16792
D=M // 16793
@R13 // 16794
A=M // 16795
M=D // 16796

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21"), PushInstruction("local 6")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16797
D=M // 16798
@21 // 16799
A=D+A // 16800
D=M // 16801
@SP // 16802
AM=M+1 // 16803
A=A-1 // 16804
M=D // 16805
@LCL // 16806
D=M // 16807
@6 // 16808
A=D+A // 16809
D=M // 16810
@SP // 16811
AM=M+1 // 16812
A=A-1 // 16813
M=D // 16814
// call Number.do_mul
@7 // 16815
D=A // 16816
@14 // 16817
M=D // 16818
@Number.do_mul // 16819
D=A // 16820
@13 // 16821
M=D // 16822
@Main.render.ret.26 // 16823
D=A // 16824
@CALL // 16825
0;JMP // 16826
(Main.render.ret.26)
@SP // 16827
M=M-1 // 16828

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21")], call=CallInstruction{Number.frac_to_i16}}
//  pop:  PopInstruction{address=local 16}
//}

@LCL // 16829
D=M // 16830
@21 // 16831
A=D+A // 16832
D=M // 16833
@SP // 16834
AM=M+1 // 16835
A=A-1 // 16836
M=D // 16837
// call Number.frac_to_i16
@6 // 16838
D=A // 16839
@14 // 16840
M=D // 16841
@Number.frac_to_i16 // 16842
D=A // 16843
@13 // 16844
M=D // 16845
@Main.render.ret.27 // 16846
D=A // 16847
@CALL // 16848
0;JMP // 16849
(Main.render.ret.27)
@LCL // 16850
D=M // 16851
@16 // 16852
A=D+A // 16853
D=A // 16854
@R13 // 16855
M=D // 16856
@SP // 16857
AM=M-1 // 16858
D=M // 16859
@R13 // 16860
A=M // 16861
M=D // 16862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16863
D=M // 16864
@21 // 16865
A=D+A // 16866
D=M // 16867
@SP // 16868
AM=M+1 // 16869
A=A-1 // 16870
M=D // 16871
// call Number.dispose
@6 // 16872
D=A // 16873
@14 // 16874
M=D // 16875
@Number.dispose // 16876
D=A // 16877
@13 // 16878
M=D // 16879
@Main.render.ret.28 // 16880
D=A // 16881
@CALL // 16882
0;JMP // 16883
(Main.render.ret.28)
@SP // 16884
M=M-1 // 16885

////LabelInstruction{label='Main.render$IF_END3}
// label Main.render$IF_END3
(Main.render$IF_END3)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 9"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getHeight}},
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE4}}
@Main.render.LT.46 // 16886
D=A // 16887
@SP // 16888
AM=M+1 // 16889
A=A-1 // 16890
M=D // 16891
@LCL // 16892
D=M // 16893
@9 // 16894
A=D+A // 16895
D=M // 16896
@SP // 16897
AM=M+1 // 16898
A=A-1 // 16899
M=D+1 // 16900
@ARG // 16901
A=M // 16902
D=M // 16903
@SP // 16904
AM=M+1 // 16905
A=A-1 // 16906
M=D // 16907
// call Scene.getHeight
@6 // 16908
D=A // 16909
@14 // 16910
M=D // 16911
@Scene.getHeight // 16912
D=A // 16913
@13 // 16914
M=D // 16915
@Main.render.ret.29 // 16916
D=A // 16917
@CALL // 16918
0;JMP // 16919
(Main.render.ret.29)
@SP // 16920
AM=M-1 // 16921
D=M // 16922
@SP // 16923
AM=M-1 // 16924
D=M-D // 16925
@DO_LT // 16926
0;JMP // 16927
(Main.render.LT.46)
@Main.render$IF_TRUE4 // 16928
D;JNE // 16929

////GotoInstruction{label='Main.render$IF_END4}
// goto Main.render$IF_END4
@Main.render$IF_END4 // 16930
0;JMP // 16931

////LabelInstruction{label='Main.render$IF_TRUE4}
// label Main.render$IF_TRUE4
(Main.render$IF_TRUE4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE5}}
@Main.render.GT.47 // 16932
D=A // 16933
@SP // 16934
AM=M+1 // 16935
A=A-1 // 16936
M=D // 16937
@LCL // 16938
D=M // 16939
@10 // 16940
A=D+A // 16941
D=M // 16942
@DO_GT // 16943
0;JMP // 16944
(Main.render.GT.47)
@Main.render$IF_TRUE5 // 16945
D;JNE // 16946

////GotoInstruction{label='Main.render$IF_END5}
// goto Main.render$IF_END5
@Main.render$IF_END5 // 16947
0;JMP // 16948

////LabelInstruction{label='Main.render$IF_TRUE5}
// label Main.render$IF_TRUE5
(Main.render$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 22}
//}

@LCL // 16949
D=M // 16950
@19 // 16951
A=D+A // 16952
D=M // 16953
@SP // 16954
AM=M+1 // 16955
A=A-1 // 16956
M=D // 16957
// call Number.clone
@6 // 16958
D=A // 16959
@14 // 16960
M=D // 16961
@Number.clone // 16962
D=A // 16963
@13 // 16964
M=D // 16965
@Main.render.ret.30 // 16966
D=A // 16967
@CALL // 16968
0;JMP // 16969
(Main.render.ret.30)
@LCL // 16970
D=M // 16971
@22 // 16972
A=D+A // 16973
D=A // 16974
@R13 // 16975
M=D // 16976
@SP // 16977
AM=M-1 // 16978
D=M // 16979
@R13 // 16980
A=M // 16981
M=D // 16982

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 27"),
//NOT), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE6}}
@LCL // 16983
D=M // 16984
@27 // 16985
A=D+A // 16986
D=!M // 16987
@Main.render$IF_TRUE6 // 16988
D;JNE // 16989

////GotoInstruction{label='Main.render$IF_END6}
// goto Main.render$IF_END6
@Main.render$IF_END6 // 16990
0;JMP // 16991

////LabelInstruction{label='Main.render$IF_TRUE6}
// label Main.render$IF_TRUE6
(Main.render$IF_TRUE6)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 22"), PushInstruction("local 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 16992
D=M // 16993
@22 // 16994
A=D+A // 16995
D=M // 16996
@SP // 16997
AM=M+1 // 16998
A=A-1 // 16999
M=D // 17000
@LCL // 17001
D=M // 17002
@4 // 17003
A=D+A // 17004
D=M // 17005
@SP // 17006
AM=M+1 // 17007
A=A-1 // 17008
M=D // 17009
// call Number.do_mul
@7 // 17010
D=A // 17011
@14 // 17012
M=D // 17013
@Number.do_mul // 17014
D=A // 17015
@13 // 17016
M=D // 17017
@Main.render.ret.31 // 17018
D=A // 17019
@CALL // 17020
0;JMP // 17021
(Main.render.ret.31)
@SP // 17022
M=M-1 // 17023

////LabelInstruction{label='Main.render$IF_END6}
// label Main.render$IF_END6
(Main.render$IF_END6)

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 14"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 10"),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "SUB"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("local 22")], call=CallInstruction{Number.frac_to_i16}},
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "SUB"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 17024
D=M // 17025
@14 // 17026
A=D+A // 17027
D=M // 17028
@SP // 17029
AM=M+1 // 17030
A=A-1 // 17031
M=D // 17032
@LCL // 17033
D=M // 17034
@10 // 17035
A=D+A // 17036
D=M // 17037
D=D-1 // 17038
@SP // 17039
AM=M-1 // 17040
D=D+M // 17041
@SP // 17042
AM=M+1 // 17043
A=A-1 // 17044
M=D // 17045
@LCL // 17046
D=M // 17047
@14 // 17048
A=D+A // 17049
D=M // 17050
@SP // 17051
AM=M+1 // 17052
A=A-1 // 17053
M=D // 17054
@LCL // 17055
D=M // 17056
@10 // 17057
A=D+A // 17058
D=M // 17059
D=D-1 // 17060
@SP // 17061
AM=M-1 // 17062
A=D+M // 17063
D=M // 17064
@SP // 17065
AM=M+1 // 17066
A=A-1 // 17067
M=D // 17068
@LCL // 17069
D=M // 17070
@22 // 17071
A=D+A // 17072
D=M // 17073
@SP // 17074
AM=M+1 // 17075
A=A-1 // 17076
M=D // 17077
// call Number.frac_to_i16
@6 // 17078
D=A // 17079
@14 // 17080
M=D // 17081
@Number.frac_to_i16 // 17082
D=A // 17083
@13 // 17084
M=D // 17085
@Main.render.ret.32 // 17086
D=A // 17087
@CALL // 17088
0;JMP // 17089
(Main.render.ret.32)
@SP // 17090
AM=M-1 // 17091
D=M // 17092
@SP // 17093
AM=M-1 // 17094
D=D+M // 17095
@SP // 17096
AM=M-1 // 17097
A=M // 17098
M=D // 17099

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 22")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17100
D=M // 17101
@22 // 17102
A=D+A // 17103
D=M // 17104
@SP // 17105
AM=M+1 // 17106
A=A-1 // 17107
M=D // 17108
// call Number.dispose
@6 // 17109
D=A // 17110
@14 // 17111
M=D // 17112
@Number.dispose // 17113
D=A // 17114
@13 // 17115
M=D // 17116
@Main.render.ret.33 // 17117
D=A // 17118
@CALL // 17119
0;JMP // 17120
(Main.render.ret.33)
@SP // 17121
M=M-1 // 17122

////LabelInstruction{label='Main.render$IF_END5}
// label Main.render$IF_END5
(Main.render$IF_END5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 20}
//}

@LCL // 17123
D=M // 17124
@19 // 17125
A=D+A // 17126
D=M // 17127
@SP // 17128
AM=M+1 // 17129
A=A-1 // 17130
M=D // 17131
// call Number.clone
@6 // 17132
D=A // 17133
@14 // 17134
M=D // 17135
@Number.clone // 17136
D=A // 17137
@13 // 17138
M=D // 17139
@Main.render.ret.34 // 17140
D=A // 17141
@CALL // 17142
0;JMP // 17143
(Main.render.ret.34)
@LCL // 17144
D=M // 17145
@20 // 17146
A=D+A // 17147
D=A // 17148
@R13 // 17149
M=D // 17150
@SP // 17151
AM=M-1 // 17152
D=M // 17153
@R13 // 17154
A=M // 17155
M=D // 17156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 20"), PushInstruction("local 5")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17157
D=M // 17158
@20 // 17159
A=D+A // 17160
D=M // 17161
@SP // 17162
AM=M+1 // 17163
A=A-1 // 17164
M=D // 17165
@LCL // 17166
D=M // 17167
@5 // 17168
A=D+A // 17169
D=M // 17170
@SP // 17171
AM=M+1 // 17172
A=A-1 // 17173
M=D // 17174
// call Number.do_mul
@7 // 17175
D=A // 17176
@14 // 17177
M=D // 17178
@Number.do_mul // 17179
D=A // 17180
@13 // 17181
M=D // 17182
@Main.render.ret.35 // 17183
D=A // 17184
@CALL // 17185
0;JMP // 17186
(Main.render.ret.35)
@SP // 17187
M=M-1 // 17188

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 14"),
//                    right:
//                        PushInstruction("local 10"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("local 20")], call=CallInstruction{Number.frac_to_i16}},
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("local 10"),
//    binaryOp: "ADD"
//)}
@LCL // 17189
D=M // 17190
@14 // 17191
A=D+A // 17192
D=M // 17193
@SP // 17194
AM=M+1 // 17195
A=A-1 // 17196
M=D // 17197
@LCL // 17198
D=M // 17199
@10 // 17200
A=D+A // 17201
D=M // 17202
@SP // 17203
AM=M-1 // 17204
D=D+M // 17205
@SP // 17206
AM=M+1 // 17207
A=A-1 // 17208
M=D // 17209
@LCL // 17210
D=M // 17211
@14 // 17212
A=D+A // 17213
D=M // 17214
@SP // 17215
AM=M+1 // 17216
A=A-1 // 17217
M=D // 17218
@LCL // 17219
D=M // 17220
@10 // 17221
A=D+A // 17222
D=M // 17223
@SP // 17224
AM=M-1 // 17225
A=D+M // 17226
D=M // 17227
@SP // 17228
AM=M+1 // 17229
A=A-1 // 17230
M=D // 17231
@LCL // 17232
D=M // 17233
@20 // 17234
A=D+A // 17235
D=M // 17236
@SP // 17237
AM=M+1 // 17238
A=A-1 // 17239
M=D // 17240
// call Number.frac_to_i16
@6 // 17241
D=A // 17242
@14 // 17243
M=D // 17244
@Number.frac_to_i16 // 17245
D=A // 17246
@13 // 17247
M=D // 17248
@Main.render.ret.36 // 17249
D=A // 17250
@CALL // 17251
0;JMP // 17252
(Main.render.ret.36)
@SP // 17253
AM=M-1 // 17254
D=M // 17255
@SP // 17256
AM=M-1 // 17257
D=D+M // 17258
@SP // 17259
AM=M-1 // 17260
A=M // 17261
M=D // 17262

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 20")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17263
D=M // 17264
@20 // 17265
A=D+A // 17266
D=M // 17267
@SP // 17268
AM=M+1 // 17269
A=A-1 // 17270
M=D // 17271
// call Number.dispose
@6 // 17272
D=A // 17273
@14 // 17274
M=D // 17275
@Number.dispose // 17276
D=A // 17277
@13 // 17278
M=D // 17279
@Main.render.ret.37 // 17280
D=A // 17281
@CALL // 17282
0;JMP // 17283
(Main.render.ret.37)
@SP // 17284
M=M-1 // 17285

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE7}}
@Main.render.LT.48 // 17286
D=A // 17287
@SP // 17288
AM=M+1 // 17289
A=A-1 // 17290
M=D // 17291
@LCL // 17292
D=M // 17293
@10 // 17294
A=D+A // 17295
D=M // 17296
@SP // 17297
AM=M+1 // 17298
A=A-1 // 17299
M=D+1 // 17300
@LCL // 17301
D=M // 17302
@12 // 17303
A=D+A // 17304
D=M // 17305
@SP // 17306
AM=M-1 // 17307
D=M-D // 17308
@DO_LT // 17309
0;JMP // 17310
(Main.render.LT.48)
@Main.render$IF_TRUE7 // 17311
D;JNE // 17312

////GotoInstruction{label='Main.render$IF_END7}
// goto Main.render$IF_END7
@Main.render$IF_END7 // 17313
0;JMP // 17314

////LabelInstruction{label='Main.render$IF_TRUE7}
// label Main.render$IF_TRUE7
(Main.render$IF_TRUE7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 23}
//}

@LCL // 17315
D=M // 17316
@19 // 17317
A=D+A // 17318
D=M // 17319
@SP // 17320
AM=M+1 // 17321
A=A-1 // 17322
M=D // 17323
// call Number.clone
@6 // 17324
D=A // 17325
@14 // 17326
M=D // 17327
@Number.clone // 17328
D=A // 17329
@13 // 17330
M=D // 17331
@Main.render.ret.38 // 17332
D=A // 17333
@CALL // 17334
0;JMP // 17335
(Main.render.ret.38)
@LCL // 17336
D=M // 17337
@23 // 17338
A=D+A // 17339
D=A // 17340
@R13 // 17341
M=D // 17342
@SP // 17343
AM=M-1 // 17344
D=M // 17345
@R13 // 17346
A=M // 17347
M=D // 17348

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE8}}
@LCL // 17349
D=M // 17350
@27 // 17351
A=D+A // 17352
D=M // 17353
@Main.render$IF_TRUE8 // 17354
D;JNE // 17355

////GotoInstruction{label='Main.render$IF_END8}
// goto Main.render$IF_END8
@Main.render$IF_END8 // 17356
0;JMP // 17357

////LabelInstruction{label='Main.render$IF_TRUE8}
// label Main.render$IF_TRUE8
(Main.render$IF_TRUE8)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 23"), PushInstruction("local 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17358
D=M // 17359
@23 // 17360
A=D+A // 17361
D=M // 17362
@SP // 17363
AM=M+1 // 17364
A=A-1 // 17365
M=D // 17366
@LCL // 17367
D=M // 17368
@4 // 17369
A=D+A // 17370
D=M // 17371
@SP // 17372
AM=M+1 // 17373
A=A-1 // 17374
M=D // 17375
// call Number.do_mul
@7 // 17376
D=A // 17377
@14 // 17378
M=D // 17379
@Number.do_mul // 17380
D=A // 17381
@13 // 17382
M=D // 17383
@Main.render.ret.39 // 17384
D=A // 17385
@CALL // 17386
0;JMP // 17387
(Main.render.ret.39)
@SP // 17388
M=M-1 // 17389

////LabelInstruction{label='Main.render$IF_END8}
// label Main.render$IF_END8
(Main.render$IF_END8)

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 14"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 10"),
//                            right:
//                                PushInstruction("constant 1"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//CallGroup{pushes=[PushInstruction("local 23")], call=CallInstruction{Number.frac_to_i16}},
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 17390
D=M // 17391
@14 // 17392
A=D+A // 17393
D=M // 17394
@SP // 17395
AM=M+1 // 17396
A=A-1 // 17397
M=D // 17398
@LCL // 17399
D=M // 17400
@10 // 17401
A=D+A // 17402
D=M // 17403
D=D+1 // 17404
@SP // 17405
AM=M-1 // 17406
D=D+M // 17407
@SP // 17408
AM=M+1 // 17409
A=A-1 // 17410
M=D // 17411
@LCL // 17412
D=M // 17413
@14 // 17414
A=D+A // 17415
D=M // 17416
@SP // 17417
AM=M+1 // 17418
A=A-1 // 17419
M=D // 17420
@LCL // 17421
D=M // 17422
@10 // 17423
A=D+A // 17424
D=M // 17425
D=D+1 // 17426
@SP // 17427
AM=M-1 // 17428
A=D+M // 17429
D=M // 17430
@SP // 17431
AM=M+1 // 17432
A=A-1 // 17433
M=D // 17434
@LCL // 17435
D=M // 17436
@23 // 17437
A=D+A // 17438
D=M // 17439
@SP // 17440
AM=M+1 // 17441
A=A-1 // 17442
M=D // 17443
// call Number.frac_to_i16
@6 // 17444
D=A // 17445
@14 // 17446
M=D // 17447
@Number.frac_to_i16 // 17448
D=A // 17449
@13 // 17450
M=D // 17451
@Main.render.ret.40 // 17452
D=A // 17453
@CALL // 17454
0;JMP // 17455
(Main.render.ret.40)
@SP // 17456
AM=M-1 // 17457
D=M // 17458
@SP // 17459
AM=M-1 // 17460
D=D+M // 17461
@SP // 17462
AM=M-1 // 17463
A=M // 17464
M=D // 17465

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 23")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17466
D=M // 17467
@23 // 17468
A=D+A // 17469
D=M // 17470
@SP // 17471
AM=M+1 // 17472
A=A-1 // 17473
M=D // 17474
// call Number.dispose
@6 // 17475
D=A // 17476
@14 // 17477
M=D // 17478
@Number.dispose // 17479
D=A // 17480
@13 // 17481
M=D // 17482
@Main.render.ret.41 // 17483
D=A // 17484
@CALL // 17485
0;JMP // 17486
(Main.render.ret.41)
@SP // 17487
M=M-1 // 17488

////LabelInstruction{label='Main.render$IF_END7}
// label Main.render$IF_END7
(Main.render$IF_END7)

////LabelInstruction{label='Main.render$IF_END4}
// label Main.render$IF_END4
(Main.render$IF_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17489
D=M // 17490
@19 // 17491
A=D+A // 17492
D=M // 17493
@SP // 17494
AM=M+1 // 17495
A=A-1 // 17496
M=D // 17497
// call Number.dispose
@6 // 17498
D=A // 17499
@14 // 17500
M=D // 17501
@Number.dispose // 17502
D=A // 17503
@13 // 17504
M=D // 17505
@Main.render.ret.42 // 17506
D=A // 17507
@CALL // 17508
0;JMP // 17509
(Main.render.ret.42)
@SP // 17510
M=M-1 // 17511

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("local 24"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17512
D=M // 17513
@24 // 17514
A=D+A // 17515
D=M // 17516
@SP // 17517
AM=M+1 // 17518
A=A-1 // 17519
M=D // 17520
@SP // 17521
A=M-1 // 17522
M=!D // 17523
// call Screen.setColor
@6 // 17524
D=A // 17525
@14 // 17526
M=D // 17527
@Screen.setColor // 17528
D=A // 17529
@13 // 17530
M=D // 17531
@Main.render.ret.43 // 17532
D=A // 17533
@CALL // 17534
0;JMP // 17535
(Main.render.ret.43)
@SP // 17536
M=M-1 // 17537

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 10"), PushInstruction("local 9")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17538
D=M // 17539
@10 // 17540
A=D+A // 17541
D=M // 17542
@SP // 17543
AM=M+1 // 17544
A=A-1 // 17545
M=D // 17546
@LCL // 17547
D=M // 17548
@9 // 17549
A=D+A // 17550
D=M // 17551
@SP // 17552
AM=M+1 // 17553
A=A-1 // 17554
M=D // 17555
// call Screen.drawPixel
@7 // 17556
D=A // 17557
@14 // 17558
M=D // 17559
@Screen.drawPixel // 17560
D=A // 17561
@13 // 17562
M=D // 17563
@Main.render.ret.44 // 17564
D=A // 17565
@CALL // 17566
0;JMP // 17567
(Main.render.ret.44)
@SP // 17568
M=M-1 // 17569

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17570
D=M // 17571
@25 // 17572
A=D+A // 17573
D=M // 17574
@SP // 17575
AM=M+1 // 17576
A=A-1 // 17577
M=D // 17578
// call Number.dispose
@6 // 17579
D=A // 17580
@14 // 17581
M=D // 17582
@Number.dispose // 17583
D=A // 17584
@13 // 17585
M=D // 17586
@Main.render.ret.45 // 17587
D=A // 17588
@CALL // 17589
0;JMP // 17590
(Main.render.ret.45)
@SP // 17591
M=M-1 // 17592

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE9}}
@LCL // 17593
D=M // 17594
@27 // 17595
A=D+A // 17596
D=M // 17597
@Main.render$IF_TRUE9 // 17598
D;JNE // 17599

////GotoInstruction{label='Main.render$IF_FALSE9}
// goto Main.render$IF_FALSE9
@Main.render$IF_FALSE9 // 17600
0;JMP // 17601

////LabelInstruction{label='Main.render$IF_TRUE9}
// label Main.render$IF_TRUE9
(Main.render$IF_TRUE9)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 17602
D=M // 17603
@10 // 17604
A=D+A // 17605
M=M-1 // 17606

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant -1"),
//    binaryOp: "GT"
//)
//  pop:  PopInstruction{address=local 28}
//}

@Main.render.GT.49 // 17607
D=A // 17608
@SP // 17609
AM=M+1 // 17610
A=A-1 // 17611
M=D // 17612
@LCL // 17613
D=M // 17614
@10 // 17615
A=D+A // 17616
D=M // 17617
D=D+1 // 17618
@DO_GT // 17619
0;JMP // 17620
(Main.render.GT.49)
@SP // 17621
AM=M+1 // 17622
A=A-1 // 17623
M=D // 17624
@LCL // 17625
D=M // 17626
@28 // 17627
A=D+A // 17628
D=A // 17629
@R13 // 17630
M=D // 17631
@SP // 17632
AM=M-1 // 17633
D=M // 17634
@R13 // 17635
A=M // 17636
M=D // 17637

////GotoInstruction{label='Main.render$IF_END9}
// goto Main.render$IF_END9
@Main.render$IF_END9 // 17638
0;JMP // 17639

////LabelInstruction{label='Main.render$IF_FALSE9}
// label Main.render$IF_FALSE9
(Main.render$IF_FALSE9)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 17640
D=M // 17641
@10 // 17642
A=D+A // 17643
M=M+1 // 17644

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("local 12"),
//    binaryOp: "LT"
//)
//  pop:  PopInstruction{address=local 28}
//}

@Main.render.LT.50 // 17645
D=A // 17646
@SP // 17647
AM=M+1 // 17648
A=A-1 // 17649
M=D // 17650
@LCL // 17651
D=M // 17652
@12 // 17653
A=D+A // 17654
D=M // 17655
A=A-1 // 17656
A=A-1 // 17657
D=M-D // 17658
@DO_LT // 17659
0;JMP // 17660
(Main.render.LT.50)
@SP // 17661
AM=M+1 // 17662
A=A-1 // 17663
M=D // 17664
@LCL // 17665
D=M // 17666
@28 // 17667
A=D+A // 17668
D=A // 17669
@R13 // 17670
M=D // 17671
@SP // 17672
AM=M-1 // 17673
D=M // 17674
@R13 // 17675
A=M // 17676
M=D // 17677

////LabelInstruction{label='Main.render$IF_END9}
// label Main.render$IF_END9
(Main.render$IF_END9)

////GotoInstruction{label='Main.render_WHILE_EXP3}
// goto Main.render_WHILE_EXP3
@Main.render_WHILE_EXP3 // 17678
0;JMP // 17679

////LabelInstruction{label='Main.render_WHILE_END3}
// label Main.render_WHILE_END3
(Main.render_WHILE_END3)

////PushPopPair {
//  push: PushInstruction("local 13")
//  pop:  PopInstruction{address=local 15}
//}

@LCL // 17680
D=M // 17681
@13 // 17682
A=D+A // 17683
D=M // 17684
@SP // 17685
AM=M+1 // 17686
A=A-1 // 17687
M=D // 17688
@LCL // 17689
D=M // 17690
@15 // 17691
A=D+A // 17692
D=A // 17693
@R13 // 17694
M=D // 17695
@SP // 17696
AM=M-1 // 17697
D=M // 17698
@R13 // 17699
A=M // 17700
M=D // 17701

////PushPopPair {
//  push: PushInstruction("local 14")
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 17702
D=M // 17703
@14 // 17704
A=D+A // 17705
D=M // 17706
@SP // 17707
AM=M+1 // 17708
A=A-1 // 17709
M=D // 17710
@LCL // 17711
D=M // 17712
@13 // 17713
A=D+A // 17714
D=A // 17715
@R13 // 17716
M=D // 17717
@SP // 17718
AM=M-1 // 17719
D=M // 17720
@R13 // 17721
A=M // 17722
M=D // 17723

////PushPopPair {
//  push: PushInstruction("local 15")
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 17724
D=M // 17725
@15 // 17726
A=D+A // 17727
D=M // 17728
@SP // 17729
AM=M+1 // 17730
A=A-1 // 17731
M=D // 17732
@LCL // 17733
D=M // 17734
@14 // 17735
A=D+A // 17736
D=A // 17737
@R13 // 17738
M=D // 17739
@SP // 17740
AM=M-1 // 17741
D=M // 17742
@R13 // 17743
A=M // 17744
M=D // 17745

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 17746
D=M // 17747
@11 // 17748
A=D+A // 17749
M=0 // 17750

////LabelInstruction{label='Main.render_WHILE_EXP4}
// label Main.render_WHILE_EXP4
(Main.render_WHILE_EXP4)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 11"),
//        right:
//            PushInstruction("local 12"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.render_WHILE_END4}}
@Main.render.LT.51 // 17751
D=A // 17752
@SP // 17753
AM=M+1 // 17754
A=A-1 // 17755
M=D // 17756
@LCL // 17757
D=M // 17758
@12 // 17759
A=D+A // 17760
D=M // 17761
A=A-1 // 17762
D=M-D // 17763
@DO_LT // 17764
0;JMP // 17765
(Main.render.LT.51)
D=!D // 17766
@Main.render_WHILE_END4 // 17767
D;JNE // 17768

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 17769
D=M // 17770
@14 // 17771
A=D+A // 17772
D=M // 17773
A=A-1 // 17774
A=A-1 // 17775
A=A-1 // 17776
D=D+M // 17777
@SP // 17778
AM=M+1 // 17779
A=A-1 // 17780
M=D // 17781
D=0 // 17782
@SP // 17783
AM=M-1 // 17784
A=M // 17785
M=D // 17786

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 11"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 17787
D=M // 17788
@11 // 17789
A=D+A // 17790
M=M+1 // 17791

////GotoInstruction{label='Main.render_WHILE_EXP4}
// goto Main.render_WHILE_EXP4
@Main.render_WHILE_EXP4 // 17792
0;JMP // 17793

////LabelInstruction{label='Main.render_WHILE_END4}
// label Main.render_WHILE_END4
(Main.render_WHILE_END4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 9"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 17794
D=M // 17795
@9 // 17796
A=D+A // 17797
M=M+1 // 17798

////GotoInstruction{label='Main.render_WHILE_EXP2}
// goto Main.render_WHILE_EXP2
@Main.render_WHILE_EXP2 // 17799
0;JMP // 17800

////LabelInstruction{label='Main.render_WHILE_END2}
// label Main.render_WHILE_END2
(Main.render_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17801
A=M // 17802
D=M // 17803
@SP // 17804
AM=M+1 // 17805
A=A-1 // 17806
M=D // 17807
// call Number.dispose
@6 // 17808
D=A // 17809
@14 // 17810
M=D // 17811
@Number.dispose // 17812
D=A // 17813
@13 // 17814
M=D // 17815
@Main.render.ret.46 // 17816
D=A // 17817
@CALL // 17818
0;JMP // 17819
(Main.render.ret.46)
@SP // 17820
M=M-1 // 17821

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17822
A=M+1 // 17823
D=M // 17824
@SP // 17825
AM=M+1 // 17826
A=A-1 // 17827
M=D // 17828
// call Number.dispose
@6 // 17829
D=A // 17830
@14 // 17831
M=D // 17832
@Number.dispose // 17833
D=A // 17834
@13 // 17835
M=D // 17836
@Main.render.ret.47 // 17837
D=A // 17838
@CALL // 17839
0;JMP // 17840
(Main.render.ret.47)
@SP // 17841
M=M-1 // 17842

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17843
A=M+1 // 17844
A=A+1 // 17845
D=M // 17846
@SP // 17847
AM=M+1 // 17848
A=A-1 // 17849
M=D // 17850
// call Number.dispose
@6 // 17851
D=A // 17852
@14 // 17853
M=D // 17854
@Number.dispose // 17855
D=A // 17856
@13 // 17857
M=D // 17858
@Main.render.ret.48 // 17859
D=A // 17860
@CALL // 17861
0;JMP // 17862
(Main.render.ret.48)
@SP // 17863
M=M-1 // 17864

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17865
D=M // 17866
@4 // 17867
A=D+A // 17868
D=M // 17869
@SP // 17870
AM=M+1 // 17871
A=A-1 // 17872
M=D // 17873
// call Number.dispose
@6 // 17874
D=A // 17875
@14 // 17876
M=D // 17877
@Number.dispose // 17878
D=A // 17879
@13 // 17880
M=D // 17881
@Main.render.ret.49 // 17882
D=A // 17883
@CALL // 17884
0;JMP // 17885
(Main.render.ret.49)
@SP // 17886
M=M-1 // 17887

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17888
D=M // 17889
@5 // 17890
A=D+A // 17891
D=M // 17892
@SP // 17893
AM=M+1 // 17894
A=A-1 // 17895
M=D // 17896
// call Number.dispose
@6 // 17897
D=A // 17898
@14 // 17899
M=D // 17900
@Number.dispose // 17901
D=A // 17902
@13 // 17903
M=D // 17904
@Main.render.ret.50 // 17905
D=A // 17906
@CALL // 17907
0;JMP // 17908
(Main.render.ret.50)
@SP // 17909
M=M-1 // 17910

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17911
D=M // 17912
@6 // 17913
A=D+A // 17914
D=M // 17915
@SP // 17916
AM=M+1 // 17917
A=A-1 // 17918
M=D // 17919
// call Number.dispose
@6 // 17920
D=A // 17921
@14 // 17922
M=D // 17923
@Number.dispose // 17924
D=A // 17925
@13 // 17926
M=D // 17927
@Main.render.ret.51 // 17928
D=A // 17929
@CALL // 17930
0;JMP // 17931
(Main.render.ret.51)
@SP // 17932
M=M-1 // 17933

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17934
D=M // 17935
@7 // 17936
A=D+A // 17937
D=M // 17938
@SP // 17939
AM=M+1 // 17940
A=A-1 // 17941
M=D // 17942
// call Number.dispose
@6 // 17943
D=A // 17944
@14 // 17945
M=D // 17946
@Number.dispose // 17947
D=A // 17948
@13 // 17949
M=D // 17950
@Main.render.ret.52 // 17951
D=A // 17952
@CALL // 17953
0;JMP // 17954
(Main.render.ret.52)
@SP // 17955
M=M-1 // 17956

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17957
D=M // 17958
@13 // 17959
A=D+A // 17960
D=M // 17961
@SP // 17962
AM=M+1 // 17963
A=A-1 // 17964
M=D // 17965
// call Memory.deAlloc
@6 // 17966
D=A // 17967
@14 // 17968
M=D // 17969
@Memory.deAlloc // 17970
D=A // 17971
@13 // 17972
M=D // 17973
@Main.render.ret.53 // 17974
D=A // 17975
@CALL // 17976
0;JMP // 17977
(Main.render.ret.53)
@SP // 17978
M=M-1 // 17979

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 14")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17980
D=M // 17981
@14 // 17982
A=D+A // 17983
D=M // 17984
@SP // 17985
AM=M+1 // 17986
A=A-1 // 17987
M=D // 17988
// call Memory.deAlloc
@6 // 17989
D=A // 17990
@14 // 17991
M=D // 17992
@Memory.deAlloc // 17993
D=A // 17994
@13 // 17995
M=D // 17996
@Main.render.ret.54 // 17997
D=A // 17998
@CALL // 17999
0;JMP // 18000
(Main.render.ret.54)
@SP // 18001
M=M-1 // 18002

////PushInstruction("constant 0")
@SP // 18003
AM=M+1 // 18004
A=A-1 // 18005
M=0 // 18006
@RETURN // 18007
0;JMP // 18008

////FunctionInstruction{functionName='Int32.is_even', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_even with 0
(Int32.is_even)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18009
A=M // 18010
D=M // 18011
@3 // 18012
M=D // 18013

////BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("this 0"),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//)
@Int32.is_even.EQ.52 // 18014
D=A // 18015
@SP // 18016
AM=M+1 // 18017
A=A-1 // 18018
M=D // 18019
@THIS // 18020
A=M // 18021
A=M // 18022
D=M // 18023
@1 // 18024
D=D&A // 18025
@DO_EQ // 18026
0;JMP // 18027
(Int32.is_even.EQ.52)
@SP // 18028
AM=M+1 // 18029
A=A-1 // 18030
M=D // 18031
@RETURN // 18032
0;JMP // 18033

////FunctionInstruction{functionName='Element.surface_normal', numLocals=0, funcMapping={Element.color=2}}
// function Element.surface_normal with 0
(Element.surface_normal)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18034
A=M // 18035
D=M // 18036
@3 // 18037
M=D // 18038

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.surface_normal$IF_TRUE1}}
@THIS // 18039
A=M // 18040
D=M // 18041
@Element.surface_normal$IF_TRUE1 // 18042
D;JNE // 18043

////GotoInstruction{label='Element.surface_normal$IF_END1}
// goto Element.surface_normal$IF_END1
@Element.surface_normal$IF_END1 // 18044
0;JMP // 18045

////LabelInstruction{label='Element.surface_normal$IF_TRUE1}
// label Element.surface_normal$IF_TRUE1
(Element.surface_normal$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Plane.surface_normal}}
@THIS // 18046
A=M // 18047
D=M // 18048
@SP // 18049
AM=M+1 // 18050
A=A-1 // 18051
M=D // 18052
// call Plane.surface_normal
@6 // 18053
D=A // 18054
@14 // 18055
M=D // 18056
@Plane.surface_normal // 18057
D=A // 18058
@13 // 18059
M=D // 18060
@Element.surface_normal.ret.0 // 18061
D=A // 18062
@CALL // 18063
0;JMP // 18064
(Element.surface_normal.ret.0)
@RETURN // 18065
0;JMP // 18066

////LabelInstruction{label='Element.surface_normal$IF_END1}
// label Element.surface_normal$IF_END1
(Element.surface_normal$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.surface_normal$IF_TRUE2}}
@THIS // 18067
A=M+1 // 18068
D=M // 18069
@Element.surface_normal$IF_TRUE2 // 18070
D;JNE // 18071

////GotoInstruction{label='Element.surface_normal$IF_END2}
// goto Element.surface_normal$IF_END2
@Element.surface_normal$IF_END2 // 18072
0;JMP // 18073

////LabelInstruction{label='Element.surface_normal$IF_TRUE2}
// label Element.surface_normal$IF_TRUE2
(Element.surface_normal$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Sphere.surface_normal}}
@THIS // 18074
A=M+1 // 18075
D=M // 18076
@SP // 18077
AM=M+1 // 18078
A=A-1 // 18079
M=D // 18080
@ARG // 18081
A=M+1 // 18082
D=M // 18083
@SP // 18084
AM=M+1 // 18085
A=A-1 // 18086
M=D // 18087
// call Sphere.surface_normal
@7 // 18088
D=A // 18089
@14 // 18090
M=D // 18091
@Sphere.surface_normal // 18092
D=A // 18093
@13 // 18094
M=D // 18095
@Element.surface_normal.ret.1 // 18096
D=A // 18097
@CALL // 18098
0;JMP // 18099
(Element.surface_normal.ret.1)
@RETURN // 18100
0;JMP // 18101

////LabelInstruction{label='Element.surface_normal$IF_END2}
// label Element.surface_normal$IF_END2
(Element.surface_normal$IF_END2)

////PushInstruction("constant 0")
@SP // 18102
AM=M+1 // 18103
A=A-1 // 18104
M=0 // 18105
@RETURN // 18106
0;JMP // 18107

////FunctionInstruction{functionName='Vec3.dot', numLocals=3, funcMapping={Vec3.do_add=6, Vec3.clone=4, Vec3.new=1}}
// function Vec3.dot with 3
(Vec3.dot)
@3 // 18108
D=A // 18109
@SP // 18110
AM=D+M // 18111
A=A-1 // 18112
M=0 // 18113
A=A-1 // 18114
M=0 // 18115
A=A-1 // 18116
M=0 // 18117

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18118
A=M // 18119
D=M // 18120
@3 // 18121
M=D // 18122

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 18123
A=M // 18124
D=M // 18125
@SP // 18126
AM=M+1 // 18127
A=A-1 // 18128
M=D // 18129
// call Number.clone
@6 // 18130
D=A // 18131
@14 // 18132
M=D // 18133
@Number.clone // 18134
D=A // 18135
@13 // 18136
M=D // 18137
@Vec3.dot.ret.0 // 18138
D=A // 18139
@CALL // 18140
0;JMP // 18141
(Vec3.dot.ret.0)
@SP // 18142
AM=M-1 // 18143
D=M // 18144
@LCL // 18145
A=M // 18146
M=D // 18147

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18148
A=M // 18149
D=M // 18150
@SP // 18151
AM=M+1 // 18152
A=A-1 // 18153
M=D // 18154
@ARG // 18155
A=M+1 // 18156
D=M // 18157
@SP // 18158
AM=M+1 // 18159
A=A-1 // 18160
M=D // 18161
// call Vec3.getX
@6 // 18162
D=A // 18163
@14 // 18164
M=D // 18165
@Vec3.getX // 18166
D=A // 18167
@13 // 18168
M=D // 18169
@Vec3.dot.ret.1 // 18170
D=A // 18171
@CALL // 18172
0;JMP // 18173
(Vec3.dot.ret.1)
// call Number.do_mul
@7 // 18174
D=A // 18175
@14 // 18176
M=D // 18177
@Number.do_mul // 18178
D=A // 18179
@13 // 18180
M=D // 18181
@Vec3.dot.ret.2 // 18182
D=A // 18183
@CALL // 18184
0;JMP // 18185
(Vec3.dot.ret.2)
@SP // 18186
M=M-1 // 18187

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 18188
A=M+1 // 18189
D=M // 18190
@SP // 18191
AM=M+1 // 18192
A=A-1 // 18193
M=D // 18194
// call Number.clone
@6 // 18195
D=A // 18196
@14 // 18197
M=D // 18198
@Number.clone // 18199
D=A // 18200
@13 // 18201
M=D // 18202
@Vec3.dot.ret.3 // 18203
D=A // 18204
@CALL // 18205
0;JMP // 18206
(Vec3.dot.ret.3)
@SP // 18207
AM=M-1 // 18208
D=M // 18209
@LCL // 18210
A=M+1 // 18211
M=D // 18212

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18213
A=M+1 // 18214
D=M // 18215
@SP // 18216
AM=M+1 // 18217
A=A-1 // 18218
M=D // 18219
@ARG // 18220
A=M+1 // 18221
D=M // 18222
@SP // 18223
AM=M+1 // 18224
A=A-1 // 18225
M=D // 18226
// call Vec3.getY
@6 // 18227
D=A // 18228
@14 // 18229
M=D // 18230
@Vec3.getY // 18231
D=A // 18232
@13 // 18233
M=D // 18234
@Vec3.dot.ret.4 // 18235
D=A // 18236
@CALL // 18237
0;JMP // 18238
(Vec3.dot.ret.4)
// call Number.do_mul
@7 // 18239
D=A // 18240
@14 // 18241
M=D // 18242
@Number.do_mul // 18243
D=A // 18244
@13 // 18245
M=D // 18246
@Vec3.dot.ret.5 // 18247
D=A // 18248
@CALL // 18249
0;JMP // 18250
(Vec3.dot.ret.5)
@SP // 18251
M=M-1 // 18252

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 18253
A=M+1 // 18254
A=A+1 // 18255
D=M // 18256
@SP // 18257
AM=M+1 // 18258
A=A-1 // 18259
M=D // 18260
// call Number.clone
@6 // 18261
D=A // 18262
@14 // 18263
M=D // 18264
@Number.clone // 18265
D=A // 18266
@13 // 18267
M=D // 18268
@Vec3.dot.ret.6 // 18269
D=A // 18270
@CALL // 18271
0;JMP // 18272
(Vec3.dot.ret.6)
@SP // 18273
AM=M-1 // 18274
D=M // 18275
@LCL // 18276
A=M+1 // 18277
A=A+1 // 18278
M=D // 18279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18280
A=M+1 // 18281
A=A+1 // 18282
D=M // 18283
@SP // 18284
AM=M+1 // 18285
A=A-1 // 18286
M=D // 18287
@ARG // 18288
A=M+1 // 18289
D=M // 18290
@SP // 18291
AM=M+1 // 18292
A=A-1 // 18293
M=D // 18294
// call Vec3.getZ
@6 // 18295
D=A // 18296
@14 // 18297
M=D // 18298
@Vec3.getZ // 18299
D=A // 18300
@13 // 18301
M=D // 18302
@Vec3.dot.ret.7 // 18303
D=A // 18304
@CALL // 18305
0;JMP // 18306
(Vec3.dot.ret.7)
// call Number.do_mul
@7 // 18307
D=A // 18308
@14 // 18309
M=D // 18310
@Number.do_mul // 18311
D=A // 18312
@13 // 18313
M=D // 18314
@Vec3.dot.ret.8 // 18315
D=A // 18316
@CALL // 18317
0;JMP // 18318
(Vec3.dot.ret.8)
@SP // 18319
M=M-1 // 18320

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18321
A=M // 18322
D=M // 18323
@SP // 18324
AM=M+1 // 18325
A=A-1 // 18326
M=D // 18327
@LCL // 18328
A=M+1 // 18329
D=M // 18330
@SP // 18331
AM=M+1 // 18332
A=A-1 // 18333
M=D // 18334
// call Number.do_add
@7 // 18335
D=A // 18336
@14 // 18337
M=D // 18338
@Number.do_add // 18339
D=A // 18340
@13 // 18341
M=D // 18342
@Vec3.dot.ret.9 // 18343
D=A // 18344
@CALL // 18345
0;JMP // 18346
(Vec3.dot.ret.9)
@SP // 18347
M=M-1 // 18348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18349
A=M // 18350
D=M // 18351
@SP // 18352
AM=M+1 // 18353
A=A-1 // 18354
M=D // 18355
@LCL // 18356
A=M+1 // 18357
A=A+1 // 18358
D=M // 18359
@SP // 18360
AM=M+1 // 18361
A=A-1 // 18362
M=D // 18363
// call Number.do_add
@7 // 18364
D=A // 18365
@14 // 18366
M=D // 18367
@Number.do_add // 18368
D=A // 18369
@13 // 18370
M=D // 18371
@Vec3.dot.ret.10 // 18372
D=A // 18373
@CALL // 18374
0;JMP // 18375
(Vec3.dot.ret.10)
@SP // 18376
M=M-1 // 18377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18378
A=M+1 // 18379
D=M // 18380
@SP // 18381
AM=M+1 // 18382
A=A-1 // 18383
M=D // 18384
// call Number.dispose
@6 // 18385
D=A // 18386
@14 // 18387
M=D // 18388
@Number.dispose // 18389
D=A // 18390
@13 // 18391
M=D // 18392
@Vec3.dot.ret.11 // 18393
D=A // 18394
@CALL // 18395
0;JMP // 18396
(Vec3.dot.ret.11)
@SP // 18397
M=M-1 // 18398

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18399
A=M+1 // 18400
A=A+1 // 18401
D=M // 18402
@SP // 18403
AM=M+1 // 18404
A=A-1 // 18405
M=D // 18406
// call Number.dispose
@6 // 18407
D=A // 18408
@14 // 18409
M=D // 18410
@Number.dispose // 18411
D=A // 18412
@13 // 18413
M=D // 18414
@Vec3.dot.ret.12 // 18415
D=A // 18416
@CALL // 18417
0;JMP // 18418
(Vec3.dot.ret.12)
@SP // 18419
M=M-1 // 18420

////PushInstruction("local 0")
@LCL // 18421
A=M // 18422
D=M // 18423
@SP // 18424
AM=M+1 // 18425
A=A-1 // 18426
M=D // 18427
@RETURN // 18428
0;JMP // 18429

////FunctionInstruction{functionName='Int32.new', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.new with 3
(Int32.new)
@3 // 18430
D=A // 18431
@SP // 18432
AM=D+M // 18433
A=A-1 // 18434
M=0 // 18435
A=A-1 // 18436
M=0 // 18437
A=A-1 // 18438
M=0 // 18439

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 18440
AM=M+1 // 18441
A=A-1 // 18442
M=1 // 18443
// call Memory.alloc
@6 // 18444
D=A // 18445
@14 // 18446
M=D // 18447
@Memory.alloc // 18448
D=A // 18449
@13 // 18450
M=D // 18451
@Int32.new.ret.0 // 18452
D=A // 18453
@CALL // 18454
0;JMP // 18455
(Int32.new.ret.0)
@SP // 18456
AM=M-1 // 18457
D=M // 18458
@3 // 18459
M=D // 18460

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Int32.0 // 18461
M=M+1 // 18462

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 18463
A=M // 18464
D=M // 18465
@255 // 18466
D=D&A // 18467
@LCL // 18468
A=M // 18469
M=D // 18470

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 8")], call=CallInstruction{Int32.arith_rightshift}},
//    right:
//        PushInstruction("constant 255"),
//    binaryOp: "AND"
//)
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 18471
A=M // 18472
D=M // 18473
@SP // 18474
AM=M+1 // 18475
A=A-1 // 18476
M=D // 18477
@8 // 18478
D=A // 18479
@SP // 18480
AM=M+1 // 18481
A=A-1 // 18482
M=D // 18483
// call Int32.arith_rightshift
@7 // 18484
D=A // 18485
@14 // 18486
M=D // 18487
@Int32.arith_rightshift // 18488
D=A // 18489
@13 // 18490
M=D // 18491
@Int32.new.ret.1 // 18492
D=A // 18493
@CALL // 18494
0;JMP // 18495
(Int32.new.ret.1)
@SP // 18496
AM=M-1 // 18497
D=M // 18498
@255 // 18499
D=D&A // 18500
@LCL // 18501
A=M+1 // 18502
M=D // 18503

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.new$IF_TRUE1}}
@Int32.new.LT.53 // 18504
D=A // 18505
@SP // 18506
AM=M+1 // 18507
A=A-1 // 18508
M=D // 18509
@ARG // 18510
A=M // 18511
D=M // 18512
@DO_LT // 18513
0;JMP // 18514
(Int32.new.LT.53)
@Int32.new$IF_TRUE1 // 18515
D;JNE // 18516

////GotoInstruction{label='Int32.new$IF_FALSE1}
// goto Int32.new$IF_FALSE1
@Int32.new$IF_FALSE1 // 18517
0;JMP // 18518

////LabelInstruction{label='Int32.new$IF_TRUE1}
// label Int32.new$IF_TRUE1
(Int32.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 255")
//  pop:  PopInstruction{address=local 2}
//}

@255 // 18519
D=A // 18520
@LCL // 18521
A=M+1 // 18522
A=A+1 // 18523
M=D // 18524

////GotoInstruction{label='Int32.new$IF_END1}
// goto Int32.new$IF_END1
@Int32.new$IF_END1 // 18525
0;JMP // 18526

////LabelInstruction{label='Int32.new$IF_FALSE1}
// label Int32.new$IF_FALSE1
(Int32.new$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 18527
A=M+1 // 18528
A=A+1 // 18529
M=0 // 18530

////LabelInstruction{label='Int32.new$IF_END1}
// label Int32.new$IF_END1
(Int32.new$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@4 // 18531
D=A // 18532
@SP // 18533
AM=M+1 // 18534
A=A-1 // 18535
M=D // 18536
// call Memory.alloc
@6 // 18537
D=A // 18538
@14 // 18539
M=D // 18540
@Memory.alloc // 18541
D=A // 18542
@13 // 18543
M=D // 18544
@Int32.new.ret.2 // 18545
D=A // 18546
@CALL // 18547
0;JMP // 18548
(Int32.new.ret.2)
@SP // 18549
AM=M-1 // 18550
D=M // 18551
@THIS // 18552
A=M // 18553
M=D // 18554

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@THIS // 18555
A=M // 18556
D=M // 18557
@SP // 18558
AM=M+1 // 18559
A=A-1 // 18560
M=D // 18561
@LCL // 18562
A=M // 18563
D=M // 18564
@SP // 18565
AM=M-1 // 18566
A=M // 18567
M=D // 18568

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@THIS // 18569
A=M // 18570
D=M // 18571
@SP // 18572
AM=M+1 // 18573
A=A-1 // 18574
M=D+1 // 18575
@LCL // 18576
A=M+1 // 18577
D=M // 18578
@SP // 18579
AM=M-1 // 18580
A=M // 18581
M=D // 18582

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@THIS // 18583
A=M // 18584
D=M // 18585
@2 // 18586
D=D+A // 18587
@SP // 18588
AM=M+1 // 18589
A=A-1 // 18590
M=D // 18591
@LCL // 18592
A=M+1 // 18593
A=A+1 // 18594
D=M // 18595
@SP // 18596
AM=M-1 // 18597
A=M // 18598
M=D // 18599

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@THIS // 18600
A=M // 18601
D=M // 18602
@3 // 18603
D=D+A // 18604
@SP // 18605
AM=M+1 // 18606
A=A-1 // 18607
M=D // 18608
@LCL // 18609
A=M+1 // 18610
A=A+1 // 18611
D=M // 18612
@SP // 18613
AM=M-1 // 18614
A=M // 18615
M=D // 18616

////PushInstruction("pointer 0")
@3 // 18617
D=M // 18618
@SP // 18619
AM=M+1 // 18620
A=A-1 // 18621
M=D // 18622
@RETURN // 18623
0;JMP // 18624

////FunctionInstruction{functionName='Plane.dispose', numLocals=0, funcMapping={Plane.initialize=16, Plane.new=1, Plane.color=29}}
// function Plane.dispose with 0
(Plane.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18625
A=M // 18626
D=M // 18627
@3 // 18628
M=D // 18629

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18630
A=M // 18631
D=M // 18632
@SP // 18633
AM=M+1 // 18634
A=A-1 // 18635
M=D // 18636
// call Vec3.dispose
@6 // 18637
D=A // 18638
@14 // 18639
M=D // 18640
@Vec3.dispose // 18641
D=A // 18642
@13 // 18643
M=D // 18644
@Plane.dispose.ret.0 // 18645
D=A // 18646
@CALL // 18647
0;JMP // 18648
(Plane.dispose.ret.0)
@SP // 18649
M=M-1 // 18650

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18651
A=M+1 // 18652
D=M // 18653
@SP // 18654
AM=M+1 // 18655
A=A-1 // 18656
M=D // 18657
// call Vec3.dispose
@6 // 18658
D=A // 18659
@14 // 18660
M=D // 18661
@Vec3.dispose // 18662
D=A // 18663
@13 // 18664
M=D // 18665
@Plane.dispose.ret.1 // 18666
D=A // 18667
@CALL // 18668
0;JMP // 18669
(Plane.dispose.ret.1)
@SP // 18670
M=M-1 // 18671

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18672
A=M+1 // 18673
A=A+1 // 18674
D=M // 18675
@SP // 18676
AM=M+1 // 18677
A=A-1 // 18678
M=D // 18679
// call Number.dispose
@6 // 18680
D=A // 18681
@14 // 18682
M=D // 18683
@Number.dispose // 18684
D=A // 18685
@13 // 18686
M=D // 18687
@Plane.dispose.ret.2 // 18688
D=A // 18689
@CALL // 18690
0;JMP // 18691
(Plane.dispose.ret.2)
@SP // 18692
M=M-1 // 18693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 18694
D=M // 18695
@SP // 18696
AM=M+1 // 18697
A=A-1 // 18698
M=D // 18699
// call Memory.deAlloc
@6 // 18700
D=A // 18701
@14 // 18702
M=D // 18703
@Memory.deAlloc // 18704
D=A // 18705
@13 // 18706
M=D // 18707
@Plane.dispose.ret.3 // 18708
D=A // 18709
@CALL // 18710
0;JMP // 18711
(Plane.dispose.ret.3)
@SP // 18712
M=M-1 // 18713

////PushInstruction("constant 0")
@SP // 18714
AM=M+1 // 18715
A=A-1 // 18716
M=0 // 18717
@RETURN // 18718
0;JMP // 18719

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=97, Output.println=0, Output.getMap=0, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 18720
M=M+1 // 18721
AM=M+1 // 18722
A=A-1 // 18723
M=0 // 18724
A=A-1 // 18725
M=0 // 18726

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 18727
A=M // 18728
M=0 // 18729

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 18730
A=M // 18731
D=M // 18732
@SP // 18733
AM=M+1 // 18734
A=A-1 // 18735
M=D // 18736
// call String.length
@6 // 18737
D=A // 18738
@14 // 18739
M=D // 18740
@String.length // 18741
D=A // 18742
@13 // 18743
M=D // 18744
@Output.printString.ret.0 // 18745
D=A // 18746
@CALL // 18747
0;JMP // 18748
(Output.printString.ret.0)
@SP // 18749
AM=M-1 // 18750
D=M // 18751
@LCL // 18752
A=M+1 // 18753
M=D // 18754

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
@Output.printString.LT.54 // 18755
D=A // 18756
@SP // 18757
AM=M+1 // 18758
A=A-1 // 18759
M=D // 18760
@LCL // 18761
A=M+1 // 18762
D=M // 18763
A=A-1 // 18764
D=M-D // 18765
@DO_LT // 18766
0;JMP // 18767
(Output.printString.LT.54)
D=!D // 18768
@Output.printString_WHILE_END1 // 18769
D;JNE // 18770

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 18771
A=M // 18772
D=M // 18773
@SP // 18774
AM=M+1 // 18775
A=A-1 // 18776
M=D // 18777
@LCL // 18778
A=M // 18779
D=M // 18780
@SP // 18781
AM=M+1 // 18782
A=A-1 // 18783
M=D // 18784
// call String.charAt
@7 // 18785
D=A // 18786
@14 // 18787
M=D // 18788
@String.charAt // 18789
D=A // 18790
@13 // 18791
M=D // 18792
@Output.printString.ret.1 // 18793
D=A // 18794
@CALL // 18795
0;JMP // 18796
(Output.printString.ret.1)
// call Output.printChar
@6 // 18797
D=A // 18798
@14 // 18799
M=D // 18800
@Output.printChar // 18801
D=A // 18802
@13 // 18803
M=D // 18804
@Output.printString.ret.2 // 18805
D=A // 18806
@CALL // 18807
0;JMP // 18808
(Output.printString.ret.2)
@SP // 18809
M=M-1 // 18810

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

@LCL // 18811
A=M // 18812
M=M+1 // 18813

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 18814
0;JMP // 18815

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 18816
AM=M+1 // 18817
A=A-1 // 18818
M=0 // 18819
@RETURN // 18820
0;JMP // 18821

////FunctionInstruction{functionName='Number.is_less_than', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.do_neg=1}}
// function Number.is_less_than with 0
(Number.is_less_than)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18822
A=M // 18823
D=M // 18824
@3 // 18825
M=D // 18826

////BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.cmp}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//)
@Number.is_less_than.LT.55 // 18827
D=A // 18828
@SP // 18829
AM=M+1 // 18830
A=A-1 // 18831
M=D // 18832
@THIS // 18833
A=M // 18834
D=M // 18835
@SP // 18836
AM=M+1 // 18837
A=A-1 // 18838
M=D // 18839
@ARG // 18840
A=M+1 // 18841
D=M // 18842
@SP // 18843
AM=M+1 // 18844
A=A-1 // 18845
M=D // 18846
// call Number.getV
@6 // 18847
D=A // 18848
@14 // 18849
M=D // 18850
@Number.getV // 18851
D=A // 18852
@13 // 18853
M=D // 18854
@Number.is_less_than.ret.0 // 18855
D=A // 18856
@CALL // 18857
0;JMP // 18858
(Number.is_less_than.ret.0)
// call Int32.cmp
@7 // 18859
D=A // 18860
@14 // 18861
M=D // 18862
@Int32.cmp // 18863
D=A // 18864
@13 // 18865
M=D // 18866
@Number.is_less_than.ret.1 // 18867
D=A // 18868
@CALL // 18869
0;JMP // 18870
(Number.is_less_than.ret.1)
@SP // 18871
AM=M-1 // 18872
D=M // 18873
@DO_LT // 18874
0;JMP // 18875
(Number.is_less_than.LT.55)
@SP // 18876
AM=M+1 // 18877
A=A-1 // 18878
M=D // 18879
@RETURN // 18880
0;JMP // 18881

////FunctionInstruction{functionName='Vec3.do_cross', numLocals=6, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.clone=4, Vec3.new=1}}
// function Vec3.do_cross with 6
(Vec3.do_cross)
@6 // 18882
D=A // 18883
@SP // 18884
AM=D+M // 18885
A=A-1 // 18886
M=0 // 18887
A=A-1 // 18888
M=0 // 18889
A=A-1 // 18890
M=0 // 18891
A=A-1 // 18892
M=0 // 18893
A=A-1 // 18894
M=0 // 18895
A=A-1 // 18896
M=0 // 18897

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18898
A=M // 18899
D=M // 18900
@3 // 18901
M=D // 18902

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 18903
A=M+1 // 18904
D=M // 18905
@SP // 18906
AM=M+1 // 18907
A=A-1 // 18908
M=D // 18909
// call Number.clone
@6 // 18910
D=A // 18911
@14 // 18912
M=D // 18913
@Number.clone // 18914
D=A // 18915
@13 // 18916
M=D // 18917
@Vec3.do_cross.ret.0 // 18918
D=A // 18919
@CALL // 18920
0;JMP // 18921
(Vec3.do_cross.ret.0)
@SP // 18922
AM=M-1 // 18923
D=M // 18924
@LCL // 18925
A=M // 18926
M=D // 18927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18928
A=M // 18929
D=M // 18930
@SP // 18931
AM=M+1 // 18932
A=A-1 // 18933
M=D // 18934
@ARG // 18935
A=M+1 // 18936
D=M // 18937
@SP // 18938
AM=M+1 // 18939
A=A-1 // 18940
M=D // 18941
// call Vec3.getZ
@6 // 18942
D=A // 18943
@14 // 18944
M=D // 18945
@Vec3.getZ // 18946
D=A // 18947
@13 // 18948
M=D // 18949
@Vec3.do_cross.ret.1 // 18950
D=A // 18951
@CALL // 18952
0;JMP // 18953
(Vec3.do_cross.ret.1)
// call Number.do_mul
@7 // 18954
D=A // 18955
@14 // 18956
M=D // 18957
@Number.do_mul // 18958
D=A // 18959
@13 // 18960
M=D // 18961
@Vec3.do_cross.ret.2 // 18962
D=A // 18963
@CALL // 18964
0;JMP // 18965
(Vec3.do_cross.ret.2)
@SP // 18966
M=M-1 // 18967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 18968
A=M+1 // 18969
A=A+1 // 18970
D=M // 18971
@SP // 18972
AM=M+1 // 18973
A=A-1 // 18974
M=D // 18975
// call Number.clone
@6 // 18976
D=A // 18977
@14 // 18978
M=D // 18979
@Number.clone // 18980
D=A // 18981
@13 // 18982
M=D // 18983
@Vec3.do_cross.ret.3 // 18984
D=A // 18985
@CALL // 18986
0;JMP // 18987
(Vec3.do_cross.ret.3)
@SP // 18988
AM=M-1 // 18989
D=M // 18990
@LCL // 18991
A=M+1 // 18992
M=D // 18993

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18994
A=M+1 // 18995
D=M // 18996
@SP // 18997
AM=M+1 // 18998
A=A-1 // 18999
M=D // 19000
@ARG // 19001
A=M+1 // 19002
D=M // 19003
@SP // 19004
AM=M+1 // 19005
A=A-1 // 19006
M=D // 19007
// call Vec3.getY
@6 // 19008
D=A // 19009
@14 // 19010
M=D // 19011
@Vec3.getY // 19012
D=A // 19013
@13 // 19014
M=D // 19015
@Vec3.do_cross.ret.4 // 19016
D=A // 19017
@CALL // 19018
0;JMP // 19019
(Vec3.do_cross.ret.4)
// call Number.do_mul
@7 // 19020
D=A // 19021
@14 // 19022
M=D // 19023
@Number.do_mul // 19024
D=A // 19025
@13 // 19026
M=D // 19027
@Vec3.do_cross.ret.5 // 19028
D=A // 19029
@CALL // 19030
0;JMP // 19031
(Vec3.do_cross.ret.5)
@SP // 19032
M=M-1 // 19033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19034
A=M // 19035
D=M // 19036
@SP // 19037
AM=M+1 // 19038
A=A-1 // 19039
M=D // 19040
@LCL // 19041
A=M+1 // 19042
D=M // 19043
@SP // 19044
AM=M+1 // 19045
A=A-1 // 19046
M=D // 19047
// call Number.do_sub
@7 // 19048
D=A // 19049
@14 // 19050
M=D // 19051
@Number.do_sub // 19052
D=A // 19053
@13 // 19054
M=D // 19055
@Vec3.do_cross.ret.6 // 19056
D=A // 19057
@CALL // 19058
0;JMP // 19059
(Vec3.do_cross.ret.6)
@SP // 19060
M=M-1 // 19061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 19062
A=M+1 // 19063
A=A+1 // 19064
D=M // 19065
@SP // 19066
AM=M+1 // 19067
A=A-1 // 19068
M=D // 19069
// call Number.clone
@6 // 19070
D=A // 19071
@14 // 19072
M=D // 19073
@Number.clone // 19074
D=A // 19075
@13 // 19076
M=D // 19077
@Vec3.do_cross.ret.7 // 19078
D=A // 19079
@CALL // 19080
0;JMP // 19081
(Vec3.do_cross.ret.7)
@SP // 19082
AM=M-1 // 19083
D=M // 19084
@LCL // 19085
A=M+1 // 19086
A=A+1 // 19087
M=D // 19088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19089
A=M+1 // 19090
A=A+1 // 19091
D=M // 19092
@SP // 19093
AM=M+1 // 19094
A=A-1 // 19095
M=D // 19096
@ARG // 19097
A=M+1 // 19098
D=M // 19099
@SP // 19100
AM=M+1 // 19101
A=A-1 // 19102
M=D // 19103
// call Vec3.getX
@6 // 19104
D=A // 19105
@14 // 19106
M=D // 19107
@Vec3.getX // 19108
D=A // 19109
@13 // 19110
M=D // 19111
@Vec3.do_cross.ret.8 // 19112
D=A // 19113
@CALL // 19114
0;JMP // 19115
(Vec3.do_cross.ret.8)
// call Number.do_mul
@7 // 19116
D=A // 19117
@14 // 19118
M=D // 19119
@Number.do_mul // 19120
D=A // 19121
@13 // 19122
M=D // 19123
@Vec3.do_cross.ret.9 // 19124
D=A // 19125
@CALL // 19126
0;JMP // 19127
(Vec3.do_cross.ret.9)
@SP // 19128
M=M-1 // 19129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@THIS // 19130
A=M // 19131
D=M // 19132
@SP // 19133
AM=M+1 // 19134
A=A-1 // 19135
M=D // 19136
// call Number.clone
@6 // 19137
D=A // 19138
@14 // 19139
M=D // 19140
@Number.clone // 19141
D=A // 19142
@13 // 19143
M=D // 19144
@Vec3.do_cross.ret.10 // 19145
D=A // 19146
@CALL // 19147
0;JMP // 19148
(Vec3.do_cross.ret.10)
@SP // 19149
AM=M-1 // 19150
D=M // 19151
@LCL // 19152
A=M+1 // 19153
A=A+1 // 19154
A=A+1 // 19155
M=D // 19156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19157
A=M+1 // 19158
A=A+1 // 19159
A=A+1 // 19160
D=M // 19161
@SP // 19162
AM=M+1 // 19163
A=A-1 // 19164
M=D // 19165
@ARG // 19166
A=M+1 // 19167
D=M // 19168
@SP // 19169
AM=M+1 // 19170
A=A-1 // 19171
M=D // 19172
// call Vec3.getZ
@6 // 19173
D=A // 19174
@14 // 19175
M=D // 19176
@Vec3.getZ // 19177
D=A // 19178
@13 // 19179
M=D // 19180
@Vec3.do_cross.ret.11 // 19181
D=A // 19182
@CALL // 19183
0;JMP // 19184
(Vec3.do_cross.ret.11)
// call Number.do_mul
@7 // 19185
D=A // 19186
@14 // 19187
M=D // 19188
@Number.do_mul // 19189
D=A // 19190
@13 // 19191
M=D // 19192
@Vec3.do_cross.ret.12 // 19193
D=A // 19194
@CALL // 19195
0;JMP // 19196
(Vec3.do_cross.ret.12)
@SP // 19197
M=M-1 // 19198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 3")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19199
A=M+1 // 19200
A=A+1 // 19201
D=M // 19202
@SP // 19203
AM=M+1 // 19204
A=A-1 // 19205
M=D // 19206
@LCL // 19207
A=M+1 // 19208
A=A+1 // 19209
A=A+1 // 19210
D=M // 19211
@SP // 19212
AM=M+1 // 19213
A=A-1 // 19214
M=D // 19215
// call Number.do_sub
@7 // 19216
D=A // 19217
@14 // 19218
M=D // 19219
@Number.do_sub // 19220
D=A // 19221
@13 // 19222
M=D // 19223
@Vec3.do_cross.ret.13 // 19224
D=A // 19225
@CALL // 19226
0;JMP // 19227
(Vec3.do_cross.ret.13)
@SP // 19228
M=M-1 // 19229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 4}
//}

@THIS // 19230
A=M // 19231
D=M // 19232
@SP // 19233
AM=M+1 // 19234
A=A-1 // 19235
M=D // 19236
// call Number.clone
@6 // 19237
D=A // 19238
@14 // 19239
M=D // 19240
@Number.clone // 19241
D=A // 19242
@13 // 19243
M=D // 19244
@Vec3.do_cross.ret.14 // 19245
D=A // 19246
@CALL // 19247
0;JMP // 19248
(Vec3.do_cross.ret.14)
@LCL // 19249
D=M // 19250
@4 // 19251
A=D+A // 19252
D=A // 19253
@R13 // 19254
M=D // 19255
@SP // 19256
AM=M-1 // 19257
D=M // 19258
@R13 // 19259
A=M // 19260
M=D // 19261

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19262
D=M // 19263
@4 // 19264
A=D+A // 19265
D=M // 19266
@SP // 19267
AM=M+1 // 19268
A=A-1 // 19269
M=D // 19270
@ARG // 19271
A=M+1 // 19272
D=M // 19273
@SP // 19274
AM=M+1 // 19275
A=A-1 // 19276
M=D // 19277
// call Vec3.getY
@6 // 19278
D=A // 19279
@14 // 19280
M=D // 19281
@Vec3.getY // 19282
D=A // 19283
@13 // 19284
M=D // 19285
@Vec3.do_cross.ret.15 // 19286
D=A // 19287
@CALL // 19288
0;JMP // 19289
(Vec3.do_cross.ret.15)
// call Number.do_mul
@7 // 19290
D=A // 19291
@14 // 19292
M=D // 19293
@Number.do_mul // 19294
D=A // 19295
@13 // 19296
M=D // 19297
@Vec3.do_cross.ret.16 // 19298
D=A // 19299
@CALL // 19300
0;JMP // 19301
(Vec3.do_cross.ret.16)
@SP // 19302
M=M-1 // 19303

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@THIS // 19304
A=M+1 // 19305
D=M // 19306
@SP // 19307
AM=M+1 // 19308
A=A-1 // 19309
M=D // 19310
// call Number.clone
@6 // 19311
D=A // 19312
@14 // 19313
M=D // 19314
@Number.clone // 19315
D=A // 19316
@13 // 19317
M=D // 19318
@Vec3.do_cross.ret.17 // 19319
D=A // 19320
@CALL // 19321
0;JMP // 19322
(Vec3.do_cross.ret.17)
@LCL // 19323
D=M // 19324
@5 // 19325
A=D+A // 19326
D=A // 19327
@R13 // 19328
M=D // 19329
@SP // 19330
AM=M-1 // 19331
D=M // 19332
@R13 // 19333
A=M // 19334
M=D // 19335

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19336
D=M // 19337
@5 // 19338
A=D+A // 19339
D=M // 19340
@SP // 19341
AM=M+1 // 19342
A=A-1 // 19343
M=D // 19344
@ARG // 19345
A=M+1 // 19346
D=M // 19347
@SP // 19348
AM=M+1 // 19349
A=A-1 // 19350
M=D // 19351
// call Vec3.getX
@6 // 19352
D=A // 19353
@14 // 19354
M=D // 19355
@Vec3.getX // 19356
D=A // 19357
@13 // 19358
M=D // 19359
@Vec3.do_cross.ret.18 // 19360
D=A // 19361
@CALL // 19362
0;JMP // 19363
(Vec3.do_cross.ret.18)
// call Number.do_mul
@7 // 19364
D=A // 19365
@14 // 19366
M=D // 19367
@Number.do_mul // 19368
D=A // 19369
@13 // 19370
M=D // 19371
@Vec3.do_cross.ret.19 // 19372
D=A // 19373
@CALL // 19374
0;JMP // 19375
(Vec3.do_cross.ret.19)
@SP // 19376
M=M-1 // 19377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 5")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19378
D=M // 19379
@4 // 19380
A=D+A // 19381
D=M // 19382
@SP // 19383
AM=M+1 // 19384
A=A-1 // 19385
M=D // 19386
@LCL // 19387
D=M // 19388
@5 // 19389
A=D+A // 19390
D=M // 19391
@SP // 19392
AM=M+1 // 19393
A=A-1 // 19394
M=D // 19395
// call Number.do_sub
@7 // 19396
D=A // 19397
@14 // 19398
M=D // 19399
@Number.do_sub // 19400
D=A // 19401
@13 // 19402
M=D // 19403
@Vec3.do_cross.ret.20 // 19404
D=A // 19405
@CALL // 19406
0;JMP // 19407
(Vec3.do_cross.ret.20)
@SP // 19408
M=M-1 // 19409

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19410
A=M+1 // 19411
D=M // 19412
@SP // 19413
AM=M+1 // 19414
A=A-1 // 19415
M=D // 19416
// call Number.dispose
@6 // 19417
D=A // 19418
@14 // 19419
M=D // 19420
@Number.dispose // 19421
D=A // 19422
@13 // 19423
M=D // 19424
@Vec3.do_cross.ret.21 // 19425
D=A // 19426
@CALL // 19427
0;JMP // 19428
(Vec3.do_cross.ret.21)
@SP // 19429
M=M-1 // 19430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19431
A=M+1 // 19432
A=A+1 // 19433
A=A+1 // 19434
D=M // 19435
@SP // 19436
AM=M+1 // 19437
A=A-1 // 19438
M=D // 19439
// call Number.dispose
@6 // 19440
D=A // 19441
@14 // 19442
M=D // 19443
@Number.dispose // 19444
D=A // 19445
@13 // 19446
M=D // 19447
@Vec3.do_cross.ret.22 // 19448
D=A // 19449
@CALL // 19450
0;JMP // 19451
(Vec3.do_cross.ret.22)
@SP // 19452
M=M-1 // 19453

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19454
D=M // 19455
@5 // 19456
A=D+A // 19457
D=M // 19458
@SP // 19459
AM=M+1 // 19460
A=A-1 // 19461
M=D // 19462
// call Number.dispose
@6 // 19463
D=A // 19464
@14 // 19465
M=D // 19466
@Number.dispose // 19467
D=A // 19468
@13 // 19469
M=D // 19470
@Vec3.do_cross.ret.23 // 19471
D=A // 19472
@CALL // 19473
0;JMP // 19474
(Vec3.do_cross.ret.23)
@SP // 19475
M=M-1 // 19476

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19477
A=M // 19478
D=M // 19479
@SP // 19480
AM=M+1 // 19481
A=A-1 // 19482
M=D // 19483
// call Number.dispose
@6 // 19484
D=A // 19485
@14 // 19486
M=D // 19487
@Number.dispose // 19488
D=A // 19489
@13 // 19490
M=D // 19491
@Vec3.do_cross.ret.24 // 19492
D=A // 19493
@CALL // 19494
0;JMP // 19495
(Vec3.do_cross.ret.24)
@SP // 19496
M=M-1 // 19497

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19498
A=M+1 // 19499
D=M // 19500
@SP // 19501
AM=M+1 // 19502
A=A-1 // 19503
M=D // 19504
// call Number.dispose
@6 // 19505
D=A // 19506
@14 // 19507
M=D // 19508
@Number.dispose // 19509
D=A // 19510
@13 // 19511
M=D // 19512
@Vec3.do_cross.ret.25 // 19513
D=A // 19514
@CALL // 19515
0;JMP // 19516
(Vec3.do_cross.ret.25)
@SP // 19517
M=M-1 // 19518

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19519
A=M+1 // 19520
A=A+1 // 19521
D=M // 19522
@SP // 19523
AM=M+1 // 19524
A=A-1 // 19525
M=D // 19526
// call Number.dispose
@6 // 19527
D=A // 19528
@14 // 19529
M=D // 19530
@Number.dispose // 19531
D=A // 19532
@13 // 19533
M=D // 19534
@Vec3.do_cross.ret.26 // 19535
D=A // 19536
@CALL // 19537
0;JMP // 19538
(Vec3.do_cross.ret.26)
@SP // 19539
M=M-1 // 19540

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 19541
A=M // 19542
D=M // 19543
@THIS // 19544
A=M // 19545
M=D // 19546

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=this 1}
//}

@LCL // 19547
A=M+1 // 19548
A=A+1 // 19549
D=M // 19550
@THIS // 19551
A=M+1 // 19552
M=D // 19553

////PushPopPair {
//  push: PushInstruction("local 4")
//  pop:  PopInstruction{address=this 2}
//}

@LCL // 19554
D=M // 19555
@4 // 19556
A=D+A // 19557
D=M // 19558
@THIS // 19559
A=M+1 // 19560
A=A+1 // 19561
M=D // 19562

////PushInstruction("constant 0")
@SP // 19563
AM=M+1 // 19564
A=A-1 // 19565
M=0 // 19566
@RETURN // 19567
0;JMP // 19568

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.max=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 19569
D=A // 19570
@SP // 19571
AM=D+M // 19572
A=A-1 // 19573
M=0 // 19574
A=A-1 // 19575
M=0 // 19576
A=A-1 // 19577
M=0 // 19578

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
@Math.multiply.EQ.56 // 19579
D=A // 19580
@SP // 19581
AM=M+1 // 19582
A=A-1 // 19583
M=D // 19584
@ARG // 19585
A=M // 19586
D=M // 19587
@DO_EQ // 19588
0;JMP // 19589
(Math.multiply.EQ.56)
@SP // 19590
AM=M+1 // 19591
A=A-1 // 19592
M=D // 19593
@Math.multiply.EQ.57 // 19594
D=A // 19595
@SP // 19596
AM=M+1 // 19597
A=A-1 // 19598
M=D // 19599
@ARG // 19600
A=M+1 // 19601
D=M // 19602
@DO_EQ // 19603
0;JMP // 19604
(Math.multiply.EQ.57)
@SP // 19605
AM=M-1 // 19606
D=D|M // 19607
@Math.multiply$IF_TRUE1 // 19608
D;JNE // 19609

////GotoInstruction{label='Math.multiply$IF_END1}
// goto Math.multiply$IF_END1
@Math.multiply$IF_END1 // 19610
0;JMP // 19611

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 19612
AM=M+1 // 19613
A=A-1 // 19614
M=0 // 19615
@RETURN // 19616
0;JMP // 19617

////LabelInstruction{label='Math.multiply$IF_END1}
// label Math.multiply$IF_END1
(Math.multiply$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE2}}
@Math.multiply.EQ.58 // 19618
D=A // 19619
@SP // 19620
AM=M+1 // 19621
A=A-1 // 19622
M=D // 19623
@ARG // 19624
A=M // 19625
D=M // 19626
D=D-1 // 19627
@DO_EQ // 19628
0;JMP // 19629
(Math.multiply.EQ.58)
@Math.multiply$IF_TRUE2 // 19630
D;JNE // 19631

////GotoInstruction{label='Math.multiply$IF_END2}
// goto Math.multiply$IF_END2
@Math.multiply$IF_END2 // 19632
0;JMP // 19633

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 19634
A=M+1 // 19635
D=M // 19636
@SP // 19637
AM=M+1 // 19638
A=A-1 // 19639
M=D // 19640
@RETURN // 19641
0;JMP // 19642

////LabelInstruction{label='Math.multiply$IF_END2}
// label Math.multiply$IF_END2
(Math.multiply$IF_END2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE3}}
@Math.multiply.EQ.59 // 19643
D=A // 19644
@SP // 19645
AM=M+1 // 19646
A=A-1 // 19647
M=D // 19648
@ARG // 19649
A=M+1 // 19650
D=M // 19651
D=D-1 // 19652
@DO_EQ // 19653
0;JMP // 19654
(Math.multiply.EQ.59)
@Math.multiply$IF_TRUE3 // 19655
D;JNE // 19656

////GotoInstruction{label='Math.multiply$IF_END3}
// goto Math.multiply$IF_END3
@Math.multiply$IF_END3 // 19657
0;JMP // 19658

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 19659
A=M // 19660
D=M // 19661
@SP // 19662
AM=M+1 // 19663
A=A-1 // 19664
M=D // 19665
@RETURN // 19666
0;JMP // 19667

////LabelInstruction{label='Math.multiply$IF_END3}
// label Math.multiply$IF_END3
(Math.multiply$IF_END3)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE4}}
@Math.multiply.EQ.60 // 19668
D=A // 19669
@SP // 19670
AM=M+1 // 19671
A=A-1 // 19672
M=D // 19673
@ARG // 19674
A=M // 19675
D=M // 19676
@2 // 19677
D=D-A // 19678
@DO_EQ // 19679
0;JMP // 19680
(Math.multiply.EQ.60)
@Math.multiply$IF_TRUE4 // 19681
D;JNE // 19682

////GotoInstruction{label='Math.multiply$IF_END4}
// goto Math.multiply$IF_END4
@Math.multiply$IF_END4 // 19683
0;JMP // 19684

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
@ARG // 19685
A=M+1 // 19686
D=M // 19687
D=D+M // 19688
@SP // 19689
AM=M+1 // 19690
A=A-1 // 19691
M=D // 19692
@RETURN // 19693
0;JMP // 19694

////LabelInstruction{label='Math.multiply$IF_END4}
// label Math.multiply$IF_END4
(Math.multiply$IF_END4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.multiply$IF_TRUE5}}
@Math.multiply.EQ.61 // 19695
D=A // 19696
@SP // 19697
AM=M+1 // 19698
A=A-1 // 19699
M=D // 19700
@ARG // 19701
A=M+1 // 19702
D=M // 19703
@2 // 19704
D=D-A // 19705
@DO_EQ // 19706
0;JMP // 19707
(Math.multiply.EQ.61)
@Math.multiply$IF_TRUE5 // 19708
D;JNE // 19709

////GotoInstruction{label='Math.multiply$IF_END5}
// goto Math.multiply$IF_END5
@Math.multiply$IF_END5 // 19710
0;JMP // 19711

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
@ARG // 19712
A=M // 19713
D=M // 19714
D=D+M // 19715
@SP // 19716
AM=M+1 // 19717
A=A-1 // 19718
M=D // 19719
@RETURN // 19720
0;JMP // 19721

////LabelInstruction{label='Math.multiply$IF_END5}
// label Math.multiply$IF_END5
(Math.multiply$IF_END5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 19722
A=M+1 // 19723
A=A+1 // 19724
M=1 // 19725

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 19726
A=M+1 // 19727
M=0 // 19728

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 19729
A=M // 19730
M=0 // 19731

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
@Math.multiply.LT.62 // 19732
D=A // 19733
@SP // 19734
AM=M+1 // 19735
A=A-1 // 19736
M=D // 19737
@LCL // 19738
A=M+1 // 19739
D=M // 19740
@16 // 19741
D=D-A // 19742
@DO_LT // 19743
0;JMP // 19744
(Math.multiply.LT.62)
D=!D // 19745
@Math.multiply_WHILE_END1 // 19746
D;JNE // 19747

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
@Math.multiply.EQ.63 // 19748
D=A // 19749
@SP // 19750
AM=M+1 // 19751
A=A-1 // 19752
M=D // 19753
@ARG // 19754
A=M+1 // 19755
D=M // 19756
@LCL // 19757
A=M+1 // 19758
A=A+1 // 19759
D=D&M // 19760
@DO_EQ // 19761
0;JMP // 19762
(Math.multiply.EQ.63)
D=!D // 19763
@Math.multiply$IF_TRUE6 // 19764
D;JNE // 19765

////GotoInstruction{label='Math.multiply$IF_END6}
// goto Math.multiply$IF_END6
@Math.multiply$IF_END6 // 19766
0;JMP // 19767

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

@ARG // 19768
A=M // 19769
D=M // 19770
@LCL // 19771
A=M // 19772
M=D+M // 19773

////LabelInstruction{label='Math.multiply$IF_END6}
// label Math.multiply$IF_END6
(Math.multiply$IF_END6)

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

@ARG // 19774
A=M // 19775
D=M // 19776
@ARG // 19777
A=M // 19778
M=D+M // 19779

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

@LCL // 19780
A=M+1 // 19781
M=M+1 // 19782

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

@LCL // 19783
A=M+1 // 19784
A=A+1 // 19785
D=M // 19786
@LCL // 19787
A=M+1 // 19788
A=A+1 // 19789
M=D+M // 19790

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 19791
0;JMP // 19792

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 19793
A=M // 19794
D=M // 19795
@SP // 19796
AM=M+1 // 19797
A=A-1 // 19798
M=D // 19799
@RETURN // 19800
0;JMP // 19801

////FunctionInstruction{functionName='Int32.do_left_shift_bytes', numLocals=1, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_left_shift_bytes with 1
(Int32.do_left_shift_bytes)
@SP // 19802
AM=M+1 // 19803
A=A-1 // 19804
M=0 // 19805

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 19806
A=M // 19807
D=M // 19808
@3 // 19809
M=D // 19810

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes$IF_TRUE1}}
@Int32.do_left_shift_bytes.GT.64 // 19811
D=A // 19812
@SP // 19813
AM=M+1 // 19814
A=A-1 // 19815
M=D // 19816
@ARG // 19817
A=M+1 // 19818
D=M // 19819
@DO_GT // 19820
0;JMP // 19821
(Int32.do_left_shift_bytes.GT.64)
D=!D // 19822
@Int32.do_left_shift_bytes$IF_TRUE1 // 19823
D;JNE // 19824

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_END1}
// goto Int32.do_left_shift_bytes$IF_END1
@Int32.do_left_shift_bytes$IF_END1 // 19825
0;JMP // 19826

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_TRUE1}
// label Int32.do_left_shift_bytes$IF_TRUE1
(Int32.do_left_shift_bytes$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 19827
AM=M+1 // 19828
A=A-1 // 19829
M=0 // 19830
@RETURN // 19831
0;JMP // 19832

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_END1}
// label Int32.do_left_shift_bytes$IF_END1
(Int32.do_left_shift_bytes$IF_END1)

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 0}
//}

@3 // 19833
D=A // 19834
@LCL // 19835
A=M // 19836
M=D // 19837

////LabelInstruction{label='Int32.do_left_shift_bytes_WHILE_EXP1}
// label Int32.do_left_shift_bytes_WHILE_EXP1
(Int32.do_left_shift_bytes_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_WHILE_END1}}
@Int32.do_left_shift_bytes.LT.65 // 19838
D=A // 19839
@SP // 19840
AM=M+1 // 19841
A=A-1 // 19842
M=D // 19843
@LCL // 19844
A=M // 19845
D=M // 19846
@DO_LT // 19847
0;JMP // 19848
(Int32.do_left_shift_bytes.LT.65)
@Int32.do_left_shift_bytes_WHILE_END1 // 19849
D;JNE // 19850

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            BinaryPushGroup(
//                left:
//                    PushInstruction("local 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "SUB"
//            ),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes$IF_TRUE2}}
@Int32.do_left_shift_bytes.LT.66 // 19851
D=A // 19852
@SP // 19853
AM=M+1 // 19854
A=A-1 // 19855
M=D // 19856
@LCL // 19857
A=M // 19858
D=M // 19859
@ARG // 19860
A=M+1 // 19861
D=M-D // 19862
@DO_LT // 19863
0;JMP // 19864
(Int32.do_left_shift_bytes.LT.66)
D=!D // 19865
@Int32.do_left_shift_bytes$IF_TRUE2 // 19866
D;JNE // 19867

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_FALSE2}
// goto Int32.do_left_shift_bytes$IF_FALSE2
@Int32.do_left_shift_bytes$IF_FALSE2 // 19868
0;JMP // 19869

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_TRUE2}
// label Int32.do_left_shift_bytes$IF_TRUE2
(Int32.do_left_shift_bytes$IF_TRUE2)

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 0"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("argument 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 19870
A=M // 19871
D=M // 19872
@LCL // 19873
A=M // 19874
D=D+M // 19875
@SP // 19876
AM=M+1 // 19877
A=A-1 // 19878
M=D // 19879
@THIS // 19880
A=M // 19881
D=M // 19882
@SP // 19883
AM=M+1 // 19884
A=A-1 // 19885
M=D // 19886
@LCL // 19887
A=M // 19888
D=M // 19889
@ARG // 19890
A=M+1 // 19891
D=M-D // 19892
@SP // 19893
AM=M-1 // 19894
A=D+M // 19895
D=M // 19896
@SP // 19897
AM=M-1 // 19898
A=M // 19899
M=D // 19900

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_END2}
// goto Int32.do_left_shift_bytes$IF_END2
@Int32.do_left_shift_bytes$IF_END2 // 19901
0;JMP // 19902

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_FALSE2}
// label Int32.do_left_shift_bytes$IF_FALSE2
(Int32.do_left_shift_bytes$IF_FALSE2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 19903
A=M // 19904
D=M // 19905
@LCL // 19906
A=M // 19907
D=D+M // 19908
@SP // 19909
AM=M+1 // 19910
A=A-1 // 19911
M=D // 19912
D=0 // 19913
@SP // 19914
AM=M-1 // 19915
A=M // 19916
M=D // 19917

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_END2}
// label Int32.do_left_shift_bytes$IF_END2
(Int32.do_left_shift_bytes$IF_END2)

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

@LCL // 19918
A=M // 19919
M=M-1 // 19920

////GotoInstruction{label='Int32.do_left_shift_bytes_WHILE_EXP1}
// goto Int32.do_left_shift_bytes_WHILE_EXP1
@Int32.do_left_shift_bytes_WHILE_EXP1 // 19921
0;JMP // 19922

////LabelInstruction{label='Int32.do_left_shift_bytes_WHILE_END1}
// label Int32.do_left_shift_bytes_WHILE_END1
(Int32.do_left_shift_bytes_WHILE_END1)

////PushInstruction("constant 0")
@SP // 19923
AM=M+1 // 19924
A=A-1 // 19925
M=0 // 19926
@RETURN // 19927
0;JMP // 19928

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 19929
AM=M+1 // 19930
A=A-1 // 19931
M=0 // 19932

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 19933
A=M // 19934
M=0 // 19935

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
@Memory.copy.LT.67 // 19936
D=A // 19937
@SP // 19938
AM=M+1 // 19939
A=A-1 // 19940
M=D // 19941
@LCL // 19942
A=M // 19943
D=M // 19944
@ARG // 19945
A=M+1 // 19946
A=A+1 // 19947
D=M-D // 19948
@DO_LT // 19949
0;JMP // 19950
(Memory.copy.LT.67)
D=!D // 19951
@Memory.copy_WHILE_END1 // 19952
D;JNE // 19953

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
@ARG // 19954
A=M+1 // 19955
D=M // 19956
@LCL // 19957
A=M // 19958
D=D+M // 19959
@SP // 19960
AM=M+1 // 19961
A=A-1 // 19962
M=D // 19963
@ARG // 19964
A=M // 19965
D=M // 19966
@LCL // 19967
A=M // 19968
A=D+M // 19969
D=M // 19970
@SP // 19971
AM=M-1 // 19972
A=M // 19973
M=D // 19974

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

@LCL // 19975
A=M // 19976
M=M+1 // 19977

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 19978
0;JMP // 19979

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 19980
AM=M+1 // 19981
A=A-1 // 19982
M=0 // 19983
@RETURN // 19984
0;JMP // 19985

////FunctionInstruction{functionName='Ray.getDirection', numLocals=0, funcMapping={}}
// function Ray.getDirection with 0
(Ray.getDirection)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 19986
A=M // 19987
D=M // 19988
@3 // 19989
M=D // 19990

////PushInstruction("this 1")
@THIS // 19991
A=M+1 // 19992
D=M // 19993
@SP // 19994
AM=M+1 // 19995
A=A-1 // 19996
M=D // 19997
@RETURN // 19998
0;JMP // 19999

////FunctionInstruction{functionName='Int32.arith_rightshift', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.arith_rightshift with 3
(Int32.arith_rightshift)
@3 // 20000
D=A // 20001
@SP // 20002
AM=D+M // 20003
A=A-1 // 20004
M=0 // 20005
A=A-1 // 20006
M=0 // 20007
A=A-1 // 20008
M=0 // 20009

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE1}}
@Int32.arith_rightshift.EQ.68 // 20010
D=A // 20011
@SP // 20012
AM=M+1 // 20013
A=A-1 // 20014
M=D // 20015
@ARG // 20016
A=M // 20017
D=M // 20018
@DO_EQ // 20019
0;JMP // 20020
(Int32.arith_rightshift.EQ.68)
@Int32.arith_rightshift$IF_TRUE1 // 20021
D;JNE // 20022

////GotoInstruction{label='Int32.arith_rightshift$IF_END1}
// goto Int32.arith_rightshift$IF_END1
@Int32.arith_rightshift$IF_END1 // 20023
0;JMP // 20024

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE1}
// label Int32.arith_rightshift$IF_TRUE1
(Int32.arith_rightshift$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 20025
AM=M+1 // 20026
A=A-1 // 20027
M=0 // 20028
@RETURN // 20029
0;JMP // 20030

////LabelInstruction{label='Int32.arith_rightshift$IF_END1}
// label Int32.arith_rightshift$IF_END1
(Int32.arith_rightshift$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE2}}
@Int32.arith_rightshift.EQ.69 // 20031
D=A // 20032
@SP // 20033
AM=M+1 // 20034
A=A-1 // 20035
M=D // 20036
@ARG // 20037
A=M+1 // 20038
D=M // 20039
@DO_EQ // 20040
0;JMP // 20041
(Int32.arith_rightshift.EQ.69)
@Int32.arith_rightshift$IF_TRUE2 // 20042
D;JNE // 20043

////GotoInstruction{label='Int32.arith_rightshift$IF_END2}
// goto Int32.arith_rightshift$IF_END2
@Int32.arith_rightshift$IF_END2 // 20044
0;JMP // 20045

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE2}
// label Int32.arith_rightshift$IF_TRUE2
(Int32.arith_rightshift$IF_TRUE2)

////PushInstruction("argument 0")
@ARG // 20046
A=M // 20047
D=M // 20048
@SP // 20049
AM=M+1 // 20050
A=A-1 // 20051
M=D // 20052
@RETURN // 20053
0;JMP // 20054

////LabelInstruction{label='Int32.arith_rightshift$IF_END2}
// label Int32.arith_rightshift$IF_END2
(Int32.arith_rightshift$IF_END2)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE3}}
@Int32.arith_rightshift.GT.70 // 20055
D=A // 20056
@SP // 20057
AM=M+1 // 20058
A=A-1 // 20059
M=D // 20060
@ARG // 20061
A=M // 20062
D=M // 20063
@DO_GT // 20064
0;JMP // 20065
(Int32.arith_rightshift.GT.70)
@Int32.arith_rightshift$IF_TRUE3 // 20066
D;JNE // 20067

////GotoInstruction{label='Int32.arith_rightshift$IF_FALSE3}
// goto Int32.arith_rightshift$IF_FALSE3
@Int32.arith_rightshift$IF_FALSE3 // 20068
0;JMP // 20069

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE3}
// label Int32.arith_rightshift$IF_TRUE3
(Int32.arith_rightshift$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("static 1"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 20070
A=M // 20071
D=M // 20072
@SP // 20073
AM=M+1 // 20074
A=A-1 // 20075
M=D // 20076
@Int32.1 // 20077
D=M // 20078
@ARG // 20079
A=M+1 // 20080
A=D+M // 20081
D=M // 20082
@SP // 20083
AM=M+1 // 20084
A=A-1 // 20085
M=D // 20086
// call Math.divide
@7 // 20087
D=A // 20088
@14 // 20089
M=D // 20090
@Math.divide // 20091
D=A // 20092
@13 // 20093
M=D // 20094
@Int32.arith_rightshift.ret.0 // 20095
D=A // 20096
@CALL // 20097
0;JMP // 20098
(Int32.arith_rightshift.ret.0)
@SP // 20099
AM=M-1 // 20100
D=M // 20101
@LCL // 20102
A=M // 20103
M=D // 20104

////GotoInstruction{label='Int32.arith_rightshift$IF_END3}
// goto Int32.arith_rightshift$IF_END3
@Int32.arith_rightshift$IF_END3 // 20105
0;JMP // 20106

////LabelInstruction{label='Int32.arith_rightshift$IF_FALSE3}
// label Int32.arith_rightshift$IF_FALSE3
(Int32.arith_rightshift$IF_FALSE3)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 20107
A=M // 20108
D=M // 20109
@LCL // 20110
A=M // 20111
M=D // 20112

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 20113
A=M+1 // 20114
M=0 // 20115

////LabelInstruction{label='Int32.arith_rightshift_WHILE_EXP1}
// label Int32.arith_rightshift_WHILE_EXP1
(Int32.arith_rightshift_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("argument 1"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift_WHILE_END1}}
@Int32.arith_rightshift.LT.71 // 20116
D=A // 20117
@SP // 20118
AM=M+1 // 20119
A=A-1 // 20120
M=D // 20121
@LCL // 20122
A=M+1 // 20123
D=M // 20124
@ARG // 20125
A=M+1 // 20126
D=M-D // 20127
@DO_LT // 20128
0;JMP // 20129
(Int32.arith_rightshift.LT.71)
D=!D // 20130
@Int32.arith_rightshift_WHILE_END1 // 20131
D;JNE // 20132

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 2")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 20133
A=M // 20134
D=M // 20135
@SP // 20136
AM=M+1 // 20137
A=A-1 // 20138
M=D // 20139
@2 // 20140
D=A // 20141
@SP // 20142
AM=M+1 // 20143
A=A-1 // 20144
M=D // 20145
// call Math.divide
@7 // 20146
D=A // 20147
@14 // 20148
M=D // 20149
@Math.divide // 20150
D=A // 20151
@13 // 20152
M=D // 20153
@Int32.arith_rightshift.ret.1 // 20154
D=A // 20155
@CALL // 20156
0;JMP // 20157
(Int32.arith_rightshift.ret.1)
@SP // 20158
AM=M-1 // 20159
D=M // 20160
@LCL // 20161
A=M+1 // 20162
A=A+1 // 20163
M=D // 20164

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE4}}
@Int32.arith_rightshift.EQ.72 // 20165
D=A // 20166
@SP // 20167
AM=M+1 // 20168
A=A-1 // 20169
M=D // 20170
@LCL // 20171
A=M // 20172
D=M // 20173
@1 // 20174
D=D&A // 20175
@DO_EQ // 20176
0;JMP // 20177
(Int32.arith_rightshift.EQ.72)
@Int32.arith_rightshift$IF_TRUE4 // 20178
D;JNE // 20179

////GotoInstruction{label='Int32.arith_rightshift$IF_FALSE4}
// goto Int32.arith_rightshift$IF_FALSE4
@Int32.arith_rightshift$IF_FALSE4 // 20180
0;JMP // 20181

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE4}
// label Int32.arith_rightshift$IF_TRUE4
(Int32.arith_rightshift$IF_TRUE4)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 20182
A=M+1 // 20183
A=A+1 // 20184
D=M // 20185
@LCL // 20186
A=M // 20187
M=D // 20188

////GotoInstruction{label='Int32.arith_rightshift$IF_END4}
// goto Int32.arith_rightshift$IF_END4
@Int32.arith_rightshift$IF_END4 // 20189
0;JMP // 20190

////LabelInstruction{label='Int32.arith_rightshift$IF_FALSE4}
// label Int32.arith_rightshift$IF_FALSE4
(Int32.arith_rightshift$IF_FALSE4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 20191
A=M+1 // 20192
A=A+1 // 20193
D=M // 20194
D=D-1 // 20195
@LCL // 20196
A=M // 20197
M=D // 20198

////LabelInstruction{label='Int32.arith_rightshift$IF_END4}
// label Int32.arith_rightshift$IF_END4
(Int32.arith_rightshift$IF_END4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant -1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE5}}
@Int32.arith_rightshift.EQ.73 // 20199
D=A // 20200
@SP // 20201
AM=M+1 // 20202
A=A-1 // 20203
M=D // 20204
@LCL // 20205
A=M // 20206
D=M // 20207
D=D+1 // 20208
@DO_EQ // 20209
0;JMP // 20210
(Int32.arith_rightshift.EQ.73)
@Int32.arith_rightshift$IF_TRUE5 // 20211
D;JNE // 20212

////GotoInstruction{label='Int32.arith_rightshift$IF_END5}
// goto Int32.arith_rightshift$IF_END5
@Int32.arith_rightshift$IF_END5 // 20213
0;JMP // 20214

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE5}
// label Int32.arith_rightshift$IF_TRUE5
(Int32.arith_rightshift$IF_TRUE5)

////PushInstruction("local 0")
@LCL // 20215
A=M // 20216
D=M // 20217
@SP // 20218
AM=M+1 // 20219
A=A-1 // 20220
M=D // 20221
@RETURN // 20222
0;JMP // 20223

////LabelInstruction{label='Int32.arith_rightshift$IF_END5}
// label Int32.arith_rightshift$IF_END5
(Int32.arith_rightshift$IF_END5)

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

@LCL // 20224
A=M+1 // 20225
M=M+1 // 20226

////GotoInstruction{label='Int32.arith_rightshift_WHILE_EXP1}
// goto Int32.arith_rightshift_WHILE_EXP1
@Int32.arith_rightshift_WHILE_EXP1 // 20227
0;JMP // 20228

////LabelInstruction{label='Int32.arith_rightshift_WHILE_END1}
// label Int32.arith_rightshift_WHILE_END1
(Int32.arith_rightshift_WHILE_END1)

////LabelInstruction{label='Int32.arith_rightshift$IF_END3}
// label Int32.arith_rightshift$IF_END3
(Int32.arith_rightshift$IF_END3)

////PushInstruction("local 0")
@LCL // 20229
A=M // 20230
D=M // 20231
@SP // 20232
AM=M+1 // 20233
A=A-1 // 20234
M=D // 20235
@RETURN // 20236
0;JMP // 20237

////FunctionInstruction{functionName='Main.main', numLocals=9, funcMapping={Main.render=55, Main.getSomething=4}}
// function Main.main with 9
(Main.main)
@9 // 20238
D=A // 20239
@SP // 20240
AM=D+M // 20241
A=A-1 // 20242
M=0 // 20243
A=A-1 // 20244
M=0 // 20245
A=A-1 // 20246
M=0 // 20247
A=A-1 // 20248
M=0 // 20249
A=A-1 // 20250
M=0 // 20251
A=A-1 // 20252
M=0 // 20253
A=A-1 // 20254
M=0 // 20255
A=A-1 // 20256
M=0 // 20257
A=A-1 // 20258
M=0 // 20259

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Int32.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Int32.initialize
@5 // 20260
D=A // 20261
@14 // 20262
M=D // 20263
@Int32.initialize // 20264
D=A // 20265
@13 // 20266
M=D // 20267
@Main.main.ret.0 // 20268
D=A // 20269
@CALL // 20270
0;JMP // 20271
(Main.main.ret.0)
@SP // 20272
M=M-1 // 20273

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Number.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Number.initialize
@5 // 20274
D=A // 20275
@14 // 20276
M=D // 20277
@Number.initialize // 20278
D=A // 20279
@13 // 20280
M=D // 20281
@Main.main.ret.1 // 20282
D=A // 20283
@CALL // 20284
0;JMP // 20285
(Main.main.ret.1)
@SP // 20286
M=M-1 // 20287

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Plane.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Plane.initialize
@5 // 20288
D=A // 20289
@14 // 20290
M=D // 20291
@Plane.initialize // 20292
D=A // 20293
@13 // 20294
M=D // 20295
@Main.main.ret.2 // 20296
D=A // 20297
@CALL // 20298
0;JMP // 20299
(Main.main.ret.2)
@SP // 20300
M=M-1 // 20301

////PushPopPair {
//  push: PushInstruction("constant 5")
//  pop:  PopInstruction{address=local 1}
//}

@5 // 20302
D=A // 20303
@LCL // 20304
A=M+1 // 20305
M=D // 20306

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 20307
A=M+1 // 20308
D=M // 20309
@SP // 20310
AM=M+1 // 20311
A=A-1 // 20312
M=D // 20313
// call Memory.alloc
@6 // 20314
D=A // 20315
@14 // 20316
M=D // 20317
@Memory.alloc // 20318
D=A // 20319
@13 // 20320
M=D // 20321
@Main.main.ret.3 // 20322
D=A // 20323
@CALL // 20324
0;JMP // 20325
(Main.main.ret.3)
@SP // 20326
AM=M-1 // 20327
D=M // 20328
@LCL // 20329
A=M+1 // 20330
A=A+1 // 20331
M=D // 20332

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 3}
//}

@3 // 20333
D=A // 20334
@LCL // 20335
A=M+1 // 20336
A=A+1 // 20337
A=A+1 // 20338
M=D // 20339

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 20340
A=M+1 // 20341
A=A+1 // 20342
A=A+1 // 20343
D=M // 20344
@SP // 20345
AM=M+1 // 20346
A=A-1 // 20347
M=D // 20348
// call Memory.alloc
@6 // 20349
D=A // 20350
@14 // 20351
M=D // 20352
@Memory.alloc // 20353
D=A // 20354
@13 // 20355
M=D // 20356
@Main.main.ret.4 // 20357
D=A // 20358
@CALL // 20359
0;JMP // 20360
(Main.main.ret.4)
@LCL // 20361
D=M // 20362
@4 // 20363
A=D+A // 20364
D=A // 20365
@R13 // 20366
M=D // 20367
@SP // 20368
AM=M-1 // 20369
D=M // 20370
@R13 // 20371
A=M // 20372
M=D // 20373

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -6")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant -5")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant 4"), PushInstruction("constant 5")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 20374
A=M+1 // 20375
A=A+1 // 20376
D=M // 20377
@SP // 20378
AM=M+1 // 20379
A=A-1 // 20380
M=D // 20381
@6 // 20382
D=-A // 20383
@SP // 20384
AM=M+1 // 20385
A=A-1 // 20386
M=D // 20387
// call Number.new
@6 // 20388
D=A // 20389
@14 // 20390
M=D // 20391
@Number.new // 20392
D=A // 20393
@13 // 20394
M=D // 20395
@Main.main.ret.5 // 20396
D=A // 20397
@CALL // 20398
0;JMP // 20399
(Main.main.ret.5)
@2 // 20400
D=A // 20401
@SP // 20402
M=D+M // 20403
@2 // 20404
D=A // 20405
@SP // 20406
A=M-1 // 20407
M=D // 20408
A=A-1 // 20409
M=-1 // 20410
// call Main.getSomething
@7 // 20411
D=A // 20412
@14 // 20413
M=D // 20414
@Main.getSomething // 20415
D=A // 20416
@13 // 20417
M=D // 20418
@Main.main.ret.6 // 20419
D=A // 20420
@CALL // 20421
0;JMP // 20422
(Main.main.ret.6)
@5 // 20423
D=-A // 20424
@SP // 20425
AM=M+1 // 20426
A=A-1 // 20427
M=D // 20428
// call Number.new
@6 // 20429
D=A // 20430
@14 // 20431
M=D // 20432
@Number.new // 20433
D=A // 20434
@13 // 20435
M=D // 20436
@Main.main.ret.7 // 20437
D=A // 20438
@CALL // 20439
0;JMP // 20440
(Main.main.ret.7)
// call Vec3.new
@8 // 20441
D=A // 20442
@14 // 20443
M=D // 20444
@Vec3.new // 20445
D=A // 20446
@13 // 20447
M=D // 20448
@Main.main.ret.8 // 20449
D=A // 20450
@CALL // 20451
0;JMP // 20452
(Main.main.ret.8)
@3 // 20453
D=A // 20454
@SP // 20455
AM=M+1 // 20456
A=A-1 // 20457
M=D // 20458
@2 // 20459
D=A // 20460
@SP // 20461
AM=M+1 // 20462
A=A-1 // 20463
M=D // 20464
// call Main.getSomething
@7 // 20465
D=A // 20466
@14 // 20467
M=D // 20468
@Main.getSomething // 20469
D=A // 20470
@13 // 20471
M=D // 20472
@Main.main.ret.9 // 20473
D=A // 20474
@CALL // 20475
0;JMP // 20476
(Main.main.ret.9)
@4 // 20477
D=A // 20478
@SP // 20479
AM=M+1 // 20480
A=A-1 // 20481
M=D // 20482
@5 // 20483
D=A // 20484
@SP // 20485
AM=M+1 // 20486
A=A-1 // 20487
M=D // 20488
// call Main.getSomething
@7 // 20489
D=A // 20490
@14 // 20491
M=D // 20492
@Main.getSomething // 20493
D=A // 20494
@13 // 20495
M=D // 20496
@Main.main.ret.10 // 20497
D=A // 20498
@CALL // 20499
0;JMP // 20500
(Main.main.ret.10)
// call Sphere.new
@8 // 20501
D=A // 20502
@14 // 20503
M=D // 20504
@Sphere.new // 20505
D=A // 20506
@13 // 20507
M=D // 20508
@Main.main.ret.11 // 20509
D=A // 20510
@CALL // 20511
0;JMP // 20512
(Main.main.ret.11)
// call Element.sphere
@6 // 20513
D=A // 20514
@14 // 20515
M=D // 20516
@Element.sphere // 20517
D=A // 20518
@13 // 20519
M=D // 20520
@Main.main.ret.12 // 20521
D=A // 20522
@CALL // 20523
0;JMP // 20524
(Main.main.ret.12)
@SP // 20525
AM=M-1 // 20526
D=M // 20527
@SP // 20528
AM=M-1 // 20529
A=M // 20530
M=D // 20531

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -5")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 5")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 20532
A=M+1 // 20533
A=A+1 // 20534
D=M // 20535
@SP // 20536
AM=M+1 // 20537
A=A-1 // 20538
M=D+1 // 20539
@SP // 20540
AM=M+1 // 20541
A=A-1 // 20542
M=-1 // 20543
// call Number.new
@6 // 20544
D=A // 20545
@14 // 20546
M=D // 20547
@Number.new // 20548
D=A // 20549
@13 // 20550
M=D // 20551
@Main.main.ret.13 // 20552
D=A // 20553
@CALL // 20554
0;JMP // 20555
(Main.main.ret.13)
@SP // 20556
AM=M+1 // 20557
A=A-1 // 20558
M=-1 // 20559
// call Number.new
@6 // 20560
D=A // 20561
@14 // 20562
M=D // 20563
@Number.new // 20564
D=A // 20565
@13 // 20566
M=D // 20567
@Main.main.ret.14 // 20568
D=A // 20569
@CALL // 20570
0;JMP // 20571
(Main.main.ret.14)
@5 // 20572
D=-A // 20573
@SP // 20574
AM=M+1 // 20575
A=A-1 // 20576
M=D // 20577
// call Number.new
@6 // 20578
D=A // 20579
@14 // 20580
M=D // 20581
@Number.new // 20582
D=A // 20583
@13 // 20584
M=D // 20585
@Main.main.ret.15 // 20586
D=A // 20587
@CALL // 20588
0;JMP // 20589
(Main.main.ret.15)
// call Vec3.new
@8 // 20590
D=A // 20591
@14 // 20592
M=D // 20593
@Vec3.new // 20594
D=A // 20595
@13 // 20596
M=D // 20597
@Main.main.ret.16 // 20598
D=A // 20599
@CALL // 20600
0;JMP // 20601
(Main.main.ret.16)
@SP // 20602
AM=M+1 // 20603
A=A-1 // 20604
M=1 // 20605
// call Number.new
@6 // 20606
D=A // 20607
@14 // 20608
M=D // 20609
@Number.new // 20610
D=A // 20611
@13 // 20612
M=D // 20613
@Main.main.ret.17 // 20614
D=A // 20615
@CALL // 20616
0;JMP // 20617
(Main.main.ret.17)
@3 // 20618
D=A // 20619
@SP // 20620
AM=M+1 // 20621
A=A-1 // 20622
M=D // 20623
@5 // 20624
D=A // 20625
@SP // 20626
AM=M+1 // 20627
A=A-1 // 20628
M=D // 20629
// call Main.getSomething
@7 // 20630
D=A // 20631
@14 // 20632
M=D // 20633
@Main.getSomething // 20634
D=A // 20635
@13 // 20636
M=D // 20637
@Main.main.ret.18 // 20638
D=A // 20639
@CALL // 20640
0;JMP // 20641
(Main.main.ret.18)
// call Sphere.new
@8 // 20642
D=A // 20643
@14 // 20644
M=D // 20645
@Sphere.new // 20646
D=A // 20647
@13 // 20648
M=D // 20649
@Main.main.ret.19 // 20650
D=A // 20651
@CALL // 20652
0;JMP // 20653
(Main.main.ret.19)
// call Element.sphere
@6 // 20654
D=A // 20655
@14 // 20656
M=D // 20657
@Element.sphere // 20658
D=A // 20659
@13 // 20660
M=D // 20661
@Main.main.ret.20 // 20662
D=A // 20663
@CALL // 20664
0;JMP // 20665
(Main.main.ret.20)
@SP // 20666
AM=M-1 // 20667
D=M // 20668
@SP // 20669
AM=M-1 // 20670
A=M // 20671
M=D // 20672

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -3")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 20673
A=M+1 // 20674
A=A+1 // 20675
D=M // 20676
@2 // 20677
D=D+A // 20678
@SP // 20679
AM=M+1 // 20680
A=A-1 // 20681
M=D // 20682
@2 // 20683
D=A // 20684
@SP // 20685
AM=M+1 // 20686
A=A-1 // 20687
M=D // 20688
// call Number.new
@6 // 20689
D=A // 20690
@14 // 20691
M=D // 20692
@Number.new // 20693
D=A // 20694
@13 // 20695
M=D // 20696
@Main.main.ret.21 // 20697
D=A // 20698
@CALL // 20699
0;JMP // 20700
(Main.main.ret.21)
@SP // 20701
AM=M+1 // 20702
A=A-1 // 20703
M=0 // 20704
// call Number.new
@6 // 20705
D=A // 20706
@14 // 20707
M=D // 20708
@Number.new // 20709
D=A // 20710
@13 // 20711
M=D // 20712
@Main.main.ret.22 // 20713
D=A // 20714
@CALL // 20715
0;JMP // 20716
(Main.main.ret.22)
@3 // 20717
D=-A // 20718
@SP // 20719
AM=M+1 // 20720
A=A-1 // 20721
M=D // 20722
// call Number.new
@6 // 20723
D=A // 20724
@14 // 20725
M=D // 20726
@Number.new // 20727
D=A // 20728
@13 // 20729
M=D // 20730
@Main.main.ret.23 // 20731
D=A // 20732
@CALL // 20733
0;JMP // 20734
(Main.main.ret.23)
// call Vec3.new
@8 // 20735
D=A // 20736
@14 // 20737
M=D // 20738
@Vec3.new // 20739
D=A // 20740
@13 // 20741
M=D // 20742
@Main.main.ret.24 // 20743
D=A // 20744
@CALL // 20745
0;JMP // 20746
(Main.main.ret.24)
@2 // 20747
D=A // 20748
@SP // 20749
AM=M+1 // 20750
A=A-1 // 20751
M=D // 20752
// call Number.new
@6 // 20753
D=A // 20754
@14 // 20755
M=D // 20756
@Number.new // 20757
D=A // 20758
@13 // 20759
M=D // 20760
@Main.main.ret.25 // 20761
D=A // 20762
@CALL // 20763
0;JMP // 20764
(Main.main.ret.25)
@SP // 20765
AM=M+1 // 20766
A=A-1 // 20767
M=1 // 20768
// call Number.new
@6 // 20769
D=A // 20770
@14 // 20771
M=D // 20772
@Number.new // 20773
D=A // 20774
@13 // 20775
M=D // 20776
@Main.main.ret.26 // 20777
D=A // 20778
@CALL // 20779
0;JMP // 20780
(Main.main.ret.26)
// call Sphere.new
@8 // 20781
D=A // 20782
@14 // 20783
M=D // 20784
@Sphere.new // 20785
D=A // 20786
@13 // 20787
M=D // 20788
@Main.main.ret.27 // 20789
D=A // 20790
@CALL // 20791
0;JMP // 20792
(Main.main.ret.27)
// call Element.sphere
@6 // 20793
D=A // 20794
@14 // 20795
M=D // 20796
@Element.sphere // 20797
D=A // 20798
@13 // 20799
M=D // 20800
@Main.main.ret.28 // 20801
D=A // 20802
@CALL // 20803
0;JMP // 20804
(Main.main.ret.28)
@SP // 20805
AM=M-1 // 20806
D=M // 20807
@SP // 20808
AM=M-1 // 20809
A=M // 20810
M=D // 20811

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -25")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, PushInstruction("constant 0")], call=CallInstruction{Plane.new}}], call=CallInstruction{Element.plane}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 20812
A=M+1 // 20813
A=A+1 // 20814
D=M // 20815
@3 // 20816
D=D+A // 20817
@SP // 20818
AM=M+1 // 20819
A=A-1 // 20820
M=D // 20821
@SP // 20822
AM=M+1 // 20823
A=A-1 // 20824
M=0 // 20825
// call Number.new
@6 // 20826
D=A // 20827
@14 // 20828
M=D // 20829
@Number.new // 20830
D=A // 20831
@13 // 20832
M=D // 20833
@Main.main.ret.29 // 20834
D=A // 20835
@CALL // 20836
0;JMP // 20837
(Main.main.ret.29)
@SP // 20838
AM=M+1 // 20839
A=A-1 // 20840
M=0 // 20841
// call Number.new
@6 // 20842
D=A // 20843
@14 // 20844
M=D // 20845
@Number.new // 20846
D=A // 20847
@13 // 20848
M=D // 20849
@Main.main.ret.30 // 20850
D=A // 20851
@CALL // 20852
0;JMP // 20853
(Main.main.ret.30)
@25 // 20854
D=-A // 20855
@SP // 20856
AM=M+1 // 20857
A=A-1 // 20858
M=D // 20859
// call Number.new
@6 // 20860
D=A // 20861
@14 // 20862
M=D // 20863
@Number.new // 20864
D=A // 20865
@13 // 20866
M=D // 20867
@Main.main.ret.31 // 20868
D=A // 20869
@CALL // 20870
0;JMP // 20871
(Main.main.ret.31)
// call Vec3.new
@8 // 20872
D=A // 20873
@14 // 20874
M=D // 20875
@Vec3.new // 20876
D=A // 20877
@13 // 20878
M=D // 20879
@Main.main.ret.32 // 20880
D=A // 20881
@CALL // 20882
0;JMP // 20883
(Main.main.ret.32)
@SP // 20884
AM=M+1 // 20885
A=A-1 // 20886
M=0 // 20887
// call Number.new
@6 // 20888
D=A // 20889
@14 // 20890
M=D // 20891
@Number.new // 20892
D=A // 20893
@13 // 20894
M=D // 20895
@Main.main.ret.33 // 20896
D=A // 20897
@CALL // 20898
0;JMP // 20899
(Main.main.ret.33)
@SP // 20900
AM=M+1 // 20901
A=A-1 // 20902
M=0 // 20903
// call Number.new
@6 // 20904
D=A // 20905
@14 // 20906
M=D // 20907
@Number.new // 20908
D=A // 20909
@13 // 20910
M=D // 20911
@Main.main.ret.34 // 20912
D=A // 20913
@CALL // 20914
0;JMP // 20915
(Main.main.ret.34)
@SP // 20916
AM=M+1 // 20917
A=A-1 // 20918
M=-1 // 20919
// call Number.new
@6 // 20920
D=A // 20921
@14 // 20922
M=D // 20923
@Number.new // 20924
D=A // 20925
@13 // 20926
M=D // 20927
@Main.main.ret.35 // 20928
D=A // 20929
@CALL // 20930
0;JMP // 20931
(Main.main.ret.35)
// call Vec3.new
@8 // 20932
D=A // 20933
@14 // 20934
M=D // 20935
@Vec3.new // 20936
D=A // 20937
@13 // 20938
M=D // 20939
@Main.main.ret.36 // 20940
D=A // 20941
@CALL // 20942
0;JMP // 20943
(Main.main.ret.36)
@SP // 20944
AM=M+1 // 20945
A=A-1 // 20946
M=1 // 20947
// call Number.new
@6 // 20948
D=A // 20949
@14 // 20950
M=D // 20951
@Number.new // 20952
D=A // 20953
@13 // 20954
M=D // 20955
@Main.main.ret.37 // 20956
D=A // 20957
@CALL // 20958
0;JMP // 20959
(Main.main.ret.37)
@SP // 20960
AM=M+1 // 20961
A=A-1 // 20962
M=0 // 20963
// call Plane.new
@9 // 20964
D=A // 20965
@14 // 20966
M=D // 20967
@Plane.new // 20968
D=A // 20969
@13 // 20970
M=D // 20971
@Main.main.ret.38 // 20972
D=A // 20973
@CALL // 20974
0;JMP // 20975
(Main.main.ret.38)
// call Element.plane
@6 // 20976
D=A // 20977
@14 // 20978
M=D // 20979
@Element.plane // 20980
D=A // 20981
@13 // 20982
M=D // 20983
@Main.main.ret.39 // 20984
D=A // 20985
@CALL // 20986
0;JMP // 20987
(Main.main.ret.39)
@SP // 20988
AM=M-1 // 20989
D=M // 20990
@SP // 20991
AM=M-1 // 20992
A=M // 20993
M=D // 20994

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, PushInstruction("constant -1")], call=CallInstruction{Plane.new}}], call=CallInstruction{Element.plane}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 20995
A=M+1 // 20996
A=A+1 // 20997
D=M // 20998
@4 // 20999
D=D+A // 21000
@SP // 21001
AM=M+1 // 21002
A=A-1 // 21003
M=D // 21004
@SP // 21005
AM=M+1 // 21006
A=A-1 // 21007
M=0 // 21008
// call Number.new
@6 // 21009
D=A // 21010
@14 // 21011
M=D // 21012
@Number.new // 21013
D=A // 21014
@13 // 21015
M=D // 21016
@Main.main.ret.40 // 21017
D=A // 21018
@CALL // 21019
0;JMP // 21020
(Main.main.ret.40)
@2 // 21021
D=-A // 21022
@SP // 21023
AM=M+1 // 21024
A=A-1 // 21025
M=D // 21026
// call Number.new
@6 // 21027
D=A // 21028
@14 // 21029
M=D // 21030
@Number.new // 21031
D=A // 21032
@13 // 21033
M=D // 21034
@Main.main.ret.41 // 21035
D=A // 21036
@CALL // 21037
0;JMP // 21038
(Main.main.ret.41)
@SP // 21039
AM=M+1 // 21040
A=A-1 // 21041
M=0 // 21042
// call Number.new
@6 // 21043
D=A // 21044
@14 // 21045
M=D // 21046
@Number.new // 21047
D=A // 21048
@13 // 21049
M=D // 21050
@Main.main.ret.42 // 21051
D=A // 21052
@CALL // 21053
0;JMP // 21054
(Main.main.ret.42)
// call Vec3.new
@8 // 21055
D=A // 21056
@14 // 21057
M=D // 21058
@Vec3.new // 21059
D=A // 21060
@13 // 21061
M=D // 21062
@Main.main.ret.43 // 21063
D=A // 21064
@CALL // 21065
0;JMP // 21066
(Main.main.ret.43)
@SP // 21067
AM=M+1 // 21068
A=A-1 // 21069
M=0 // 21070
// call Number.new
@6 // 21071
D=A // 21072
@14 // 21073
M=D // 21074
@Number.new // 21075
D=A // 21076
@13 // 21077
M=D // 21078
@Main.main.ret.44 // 21079
D=A // 21080
@CALL // 21081
0;JMP // 21082
(Main.main.ret.44)
@SP // 21083
AM=M+1 // 21084
A=A-1 // 21085
M=-1 // 21086
// call Number.new
@6 // 21087
D=A // 21088
@14 // 21089
M=D // 21090
@Number.new // 21091
D=A // 21092
@13 // 21093
M=D // 21094
@Main.main.ret.45 // 21095
D=A // 21096
@CALL // 21097
0;JMP // 21098
(Main.main.ret.45)
@SP // 21099
AM=M+1 // 21100
A=A-1 // 21101
M=0 // 21102
// call Number.new
@6 // 21103
D=A // 21104
@14 // 21105
M=D // 21106
@Number.new // 21107
D=A // 21108
@13 // 21109
M=D // 21110
@Main.main.ret.46 // 21111
D=A // 21112
@CALL // 21113
0;JMP // 21114
(Main.main.ret.46)
// call Vec3.new
@8 // 21115
D=A // 21116
@14 // 21117
M=D // 21118
@Vec3.new // 21119
D=A // 21120
@13 // 21121
M=D // 21122
@Main.main.ret.47 // 21123
D=A // 21124
@CALL // 21125
0;JMP // 21126
(Main.main.ret.47)
@SP // 21127
AM=M+1 // 21128
A=A-1 // 21129
M=-1 // 21130
// call Number.new
@6 // 21131
D=A // 21132
@14 // 21133
M=D // 21134
@Number.new // 21135
D=A // 21136
@13 // 21137
M=D // 21138
@Main.main.ret.48 // 21139
D=A // 21140
@CALL // 21141
0;JMP // 21142
(Main.main.ret.48)
@SP // 21143
AM=M+1 // 21144
A=A-1 // 21145
M=-1 // 21146
// call Plane.new
@9 // 21147
D=A // 21148
@14 // 21149
M=D // 21150
@Plane.new // 21151
D=A // 21152
@13 // 21153
M=D // 21154
@Main.main.ret.49 // 21155
D=A // 21156
@CALL // 21157
0;JMP // 21158
(Main.main.ret.49)
// call Element.plane
@6 // 21159
D=A // 21160
@14 // 21161
M=D // 21162
@Element.plane // 21163
D=A // 21164
@13 // 21165
M=D // 21166
@Main.main.ret.50 // 21167
D=A // 21168
@CALL // 21169
0;JMP // 21170
(Main.main.ret.50)
@SP // 21171
AM=M-1 // 21172
D=M // 21173
@SP // 21174
AM=M-1 // 21175
A=M // 21176
M=D // 21177

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 5}
//}

@SP // 21178
AM=M+1 // 21179
A=A-1 // 21180
M=0 // 21181
// call Number.new
@6 // 21182
D=A // 21183
@14 // 21184
M=D // 21185
@Number.new // 21186
D=A // 21187
@13 // 21188
M=D // 21189
@Main.main.ret.51 // 21190
D=A // 21191
@CALL // 21192
0;JMP // 21193
(Main.main.ret.51)
@SP // 21194
AM=M+1 // 21195
A=A-1 // 21196
M=-1 // 21197
// call Number.new
@6 // 21198
D=A // 21199
@14 // 21200
M=D // 21201
@Number.new // 21202
D=A // 21203
@13 // 21204
M=D // 21205
@Main.main.ret.52 // 21206
D=A // 21207
@CALL // 21208
0;JMP // 21209
(Main.main.ret.52)
@SP // 21210
AM=M+1 // 21211
A=A-1 // 21212
M=-1 // 21213
// call Number.new
@6 // 21214
D=A // 21215
@14 // 21216
M=D // 21217
@Number.new // 21218
D=A // 21219
@13 // 21220
M=D // 21221
@Main.main.ret.53 // 21222
D=A // 21223
@CALL // 21224
0;JMP // 21225
(Main.main.ret.53)
// call Vec3.new
@8 // 21226
D=A // 21227
@14 // 21228
M=D // 21229
@Vec3.new // 21230
D=A // 21231
@13 // 21232
M=D // 21233
@Main.main.ret.54 // 21234
D=A // 21235
@CALL // 21236
0;JMP // 21237
(Main.main.ret.54)
@LCL // 21238
D=M // 21239
@5 // 21240
A=D+A // 21241
D=A // 21242
@R13 // 21243
M=D // 21244
@SP // 21245
AM=M-1 // 21246
D=M // 21247
@R13 // 21248
A=M // 21249
M=D // 21250

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21251
D=M // 21252
@5 // 21253
A=D+A // 21254
D=M // 21255
@SP // 21256
AM=M+1 // 21257
A=A-1 // 21258
M=D // 21259
// call Vec3.do_normalize
@6 // 21260
D=A // 21261
@14 // 21262
M=D // 21263
@Vec3.do_normalize // 21264
D=A // 21265
@13 // 21266
M=D // 21267
@Main.main.ret.55 // 21268
D=A // 21269
@CALL // 21270
0;JMP // 21271
(Main.main.ret.55)
@SP // 21272
M=M-1 // 21273

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 6}
//}

@SP // 21274
AM=M+1 // 21275
A=A-1 // 21276
M=-1 // 21277
// call Number.new
@6 // 21278
D=A // 21279
@14 // 21280
M=D // 21281
@Number.new // 21282
D=A // 21283
@13 // 21284
M=D // 21285
@Main.main.ret.56 // 21286
D=A // 21287
@CALL // 21288
0;JMP // 21289
(Main.main.ret.56)
@SP // 21290
AM=M+1 // 21291
A=A-1 // 21292
M=-1 // 21293
// call Number.new
@6 // 21294
D=A // 21295
@14 // 21296
M=D // 21297
@Number.new // 21298
D=A // 21299
@13 // 21300
M=D // 21301
@Main.main.ret.57 // 21302
D=A // 21303
@CALL // 21304
0;JMP // 21305
(Main.main.ret.57)
@SP // 21306
AM=M+1 // 21307
A=A-1 // 21308
M=0 // 21309
// call Number.new
@6 // 21310
D=A // 21311
@14 // 21312
M=D // 21313
@Number.new // 21314
D=A // 21315
@13 // 21316
M=D // 21317
@Main.main.ret.58 // 21318
D=A // 21319
@CALL // 21320
0;JMP // 21321
(Main.main.ret.58)
// call Vec3.new
@8 // 21322
D=A // 21323
@14 // 21324
M=D // 21325
@Vec3.new // 21326
D=A // 21327
@13 // 21328
M=D // 21329
@Main.main.ret.59 // 21330
D=A // 21331
@CALL // 21332
0;JMP // 21333
(Main.main.ret.59)
@LCL // 21334
D=M // 21335
@6 // 21336
A=D+A // 21337
D=A // 21338
@R13 // 21339
M=D // 21340
@SP // 21341
AM=M-1 // 21342
D=M // 21343
@R13 // 21344
A=M // 21345
M=D // 21346

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21347
D=M // 21348
@6 // 21349
A=D+A // 21350
D=M // 21351
@SP // 21352
AM=M+1 // 21353
A=A-1 // 21354
M=D // 21355
// call Vec3.do_normalize
@6 // 21356
D=A // 21357
@14 // 21358
M=D // 21359
@Vec3.do_normalize // 21360
D=A // 21361
@13 // 21362
M=D // 21363
@Main.main.ret.60 // 21364
D=A // 21365
@CALL // 21366
0;JMP // 21367
(Main.main.ret.60)
@SP // 21368
M=M-1 // 21369

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 7}
//}

@2 // 21370
D=A // 21371
@SP // 21372
M=D+M // 21373
@2 // 21374
D=A // 21375
@SP // 21376
A=M-1 // 21377
M=D // 21378
A=A-1 // 21379
M=1 // 21380
// call Main.getSomething
@7 // 21381
D=A // 21382
@14 // 21383
M=D // 21384
@Main.getSomething // 21385
D=A // 21386
@13 // 21387
M=D // 21388
@Main.main.ret.61 // 21389
D=A // 21390
@CALL // 21391
0;JMP // 21392
(Main.main.ret.61)
@SP // 21393
AM=M+1 // 21394
A=A-1 // 21395
M=-1 // 21396
// call Number.new
@6 // 21397
D=A // 21398
@14 // 21399
M=D // 21400
@Number.new // 21401
D=A // 21402
@13 // 21403
M=D // 21404
@Main.main.ret.62 // 21405
D=A // 21406
@CALL // 21407
0;JMP // 21408
(Main.main.ret.62)
@SP // 21409
AM=M+1 // 21410
A=A-1 // 21411
M=0 // 21412
// call Number.new
@6 // 21413
D=A // 21414
@14 // 21415
M=D // 21416
@Number.new // 21417
D=A // 21418
@13 // 21419
M=D // 21420
@Main.main.ret.63 // 21421
D=A // 21422
@CALL // 21423
0;JMP // 21424
(Main.main.ret.63)
// call Vec3.new
@8 // 21425
D=A // 21426
@14 // 21427
M=D // 21428
@Vec3.new // 21429
D=A // 21430
@13 // 21431
M=D // 21432
@Main.main.ret.64 // 21433
D=A // 21434
@CALL // 21435
0;JMP // 21436
(Main.main.ret.64)
@LCL // 21437
D=M // 21438
@7 // 21439
A=D+A // 21440
D=A // 21441
@R13 // 21442
M=D // 21443
@SP // 21444
AM=M-1 // 21445
D=M // 21446
@R13 // 21447
A=M // 21448
M=D // 21449

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21450
D=M // 21451
@7 // 21452
A=D+A // 21453
D=M // 21454
@SP // 21455
AM=M+1 // 21456
A=A-1 // 21457
M=D // 21458
// call Vec3.do_normalize
@6 // 21459
D=A // 21460
@14 // 21461
M=D // 21462
@Vec3.do_normalize // 21463
D=A // 21464
@13 // 21465
M=D // 21466
@Main.main.ret.65 // 21467
D=A // 21468
@CALL // 21469
0;JMP // 21470
(Main.main.ret.65)
@SP // 21471
M=M-1 // 21472

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 50")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 21473
D=M // 21474
@4 // 21475
A=D+A // 21476
D=M // 21477
@SP // 21478
AM=M+1 // 21479
A=A-1 // 21480
M=D // 21481
@LCL // 21482
D=M // 21483
@5 // 21484
A=D+A // 21485
D=M // 21486
@SP // 21487
AM=M+1 // 21488
A=A-1 // 21489
M=D // 21490
@2 // 21491
D=A // 21492
@SP // 21493
M=D+M // 21494
@50 // 21495
D=A // 21496
@SP // 21497
A=M-1 // 21498
M=D // 21499
A=A-1 // 21500
M=1 // 21501
// call Main.getSomething
@7 // 21502
D=A // 21503
@14 // 21504
M=D // 21505
@Main.getSomething // 21506
D=A // 21507
@13 // 21508
M=D // 21509
@Main.main.ret.66 // 21510
D=A // 21511
@CALL // 21512
0;JMP // 21513
(Main.main.ret.66)
// call DirectionalLight.new
@7 // 21514
D=A // 21515
@14 // 21516
M=D // 21517
@DirectionalLight.new // 21518
D=A // 21519
@13 // 21520
M=D // 21521
@Main.main.ret.67 // 21522
D=A // 21523
@CALL // 21524
0;JMP // 21525
(Main.main.ret.67)
@SP // 21526
AM=M-1 // 21527
D=M // 21528
@SP // 21529
AM=M-1 // 21530
A=M // 21531
M=D // 21532

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("constant 9"), PushInstruction("constant 10")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 21533
D=M // 21534
@4 // 21535
A=D+A // 21536
D=M // 21537
@SP // 21538
AM=M+1 // 21539
A=A-1 // 21540
M=D+1 // 21541
@LCL // 21542
D=M // 21543
@6 // 21544
A=D+A // 21545
D=M // 21546
@SP // 21547
AM=M+1 // 21548
A=A-1 // 21549
M=D // 21550
@9 // 21551
D=A // 21552
@SP // 21553
AM=M+1 // 21554
A=A-1 // 21555
M=D // 21556
@10 // 21557
D=A // 21558
@SP // 21559
AM=M+1 // 21560
A=A-1 // 21561
M=D // 21562
// call Main.getSomething
@7 // 21563
D=A // 21564
@14 // 21565
M=D // 21566
@Main.getSomething // 21567
D=A // 21568
@13 // 21569
M=D // 21570
@Main.main.ret.68 // 21571
D=A // 21572
@CALL // 21573
0;JMP // 21574
(Main.main.ret.68)
// call DirectionalLight.new
@7 // 21575
D=A // 21576
@14 // 21577
M=D // 21578
@DirectionalLight.new // 21579
D=A // 21580
@13 // 21581
M=D // 21582
@Main.main.ret.69 // 21583
D=A // 21584
@CALL // 21585
0;JMP // 21586
(Main.main.ret.69)
@SP // 21587
AM=M-1 // 21588
D=M // 21589
@SP // 21590
AM=M-1 // 21591
A=M // 21592
M=D // 21593

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 7"), CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 10")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 21594
D=M // 21595
@4 // 21596
A=D+A // 21597
D=M // 21598
@2 // 21599
D=D+A // 21600
@SP // 21601
AM=M+1 // 21602
A=A-1 // 21603
M=D // 21604
@LCL // 21605
D=M // 21606
@7 // 21607
A=D+A // 21608
D=M // 21609
@SP // 21610
AM=M+1 // 21611
A=A-1 // 21612
M=D // 21613
@3 // 21614
D=A // 21615
@SP // 21616
AM=M+1 // 21617
A=A-1 // 21618
M=D // 21619
@10 // 21620
D=A // 21621
@SP // 21622
AM=M+1 // 21623
A=A-1 // 21624
M=D // 21625
// call Main.getSomething
@7 // 21626
D=A // 21627
@14 // 21628
M=D // 21629
@Main.getSomething // 21630
D=A // 21631
@13 // 21632
M=D // 21633
@Main.main.ret.70 // 21634
D=A // 21635
@CALL // 21636
0;JMP // 21637
(Main.main.ret.70)
// call DirectionalLight.new
@7 // 21638
D=A // 21639
@14 // 21640
M=D // 21641
@DirectionalLight.new // 21642
D=A // 21643
@13 // 21644
M=D // 21645
@Main.main.ret.71 // 21646
D=A // 21647
@CALL // 21648
0;JMP // 21649
(Main.main.ret.71)
@SP // 21650
AM=M-1 // 21651
D=M // 21652
@SP // 21653
AM=M-1 // 21654
A=M // 21655
M=D // 21656

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 512"), PushInstruction("constant 256"), PushInstruction("local 2"), PushInstruction("local 1"), PushInstruction("local 4"), PushInstruction("local 3")], call=CallInstruction{Scene.new}}
//  pop:  PopInstruction{address=local 0}
//}

@512 // 21657
D=A // 21658
@SP // 21659
AM=M+1 // 21660
A=A-1 // 21661
M=D // 21662
@256 // 21663
D=A // 21664
@SP // 21665
AM=M+1 // 21666
A=A-1 // 21667
M=D // 21668
@LCL // 21669
A=M+1 // 21670
A=A+1 // 21671
D=M // 21672
@SP // 21673
AM=M+1 // 21674
A=A-1 // 21675
M=D // 21676
@LCL // 21677
A=M+1 // 21678
D=M // 21679
@SP // 21680
AM=M+1 // 21681
A=A-1 // 21682
M=D // 21683
@LCL // 21684
D=M // 21685
@4 // 21686
A=D+A // 21687
D=M // 21688
@SP // 21689
AM=M+1 // 21690
A=A-1 // 21691
M=D // 21692
@LCL // 21693
A=M+1 // 21694
A=A+1 // 21695
A=A+1 // 21696
D=M // 21697
@SP // 21698
AM=M+1 // 21699
A=A-1 // 21700
M=D // 21701
// call Scene.new
@11 // 21702
D=A // 21703
@14 // 21704
M=D // 21705
@Scene.new // 21706
D=A // 21707
@13 // 21708
M=D // 21709
@Main.main.ret.72 // 21710
D=A // 21711
@CALL // 21712
0;JMP // 21713
(Main.main.ret.72)
@SP // 21714
AM=M-1 // 21715
D=M // 21716
@LCL // 21717
A=M // 21718
M=D // 21719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Main.render}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21720
A=M // 21721
D=M // 21722
@SP // 21723
AM=M+1 // 21724
A=A-1 // 21725
M=D // 21726
// call Main.render
@6 // 21727
D=A // 21728
@14 // 21729
M=D // 21730
@Main.render // 21731
D=A // 21732
@13 // 21733
M=D // 21734
@Main.main.ret.73 // 21735
D=A // 21736
@CALL // 21737
0;JMP // 21738
(Main.main.ret.73)
@SP // 21739
M=M-1 // 21740

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Scene.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21741
A=M // 21742
D=M // 21743
@SP // 21744
AM=M+1 // 21745
A=A-1 // 21746
M=D // 21747
// call Scene.dispose
@6 // 21748
D=A // 21749
@14 // 21750
M=D // 21751
@Scene.dispose // 21752
D=A // 21753
@13 // 21754
M=D // 21755
@Main.main.ret.74 // 21756
D=A // 21757
@CALL // 21758
0;JMP // 21759
(Main.main.ret.74)
@SP // 21760
M=M-1 // 21761

////PushInstruction("constant 0")
@SP // 21762
AM=M+1 // 21763
A=A-1 // 21764
M=0 // 21765
@RETURN // 21766
0;JMP // 21767

////FunctionInstruction{functionName='Plane.intersect', numLocals=3, funcMapping={Plane.initialize=16, Plane.new=1, Plane.dispose=4, Plane.color=29}}
// function Plane.intersect with 3
(Plane.intersect)
@3 // 21768
D=A // 21769
@SP // 21770
AM=D+M // 21771
A=A-1 // 21772
M=0 // 21773
A=A-1 // 21774
M=0 // 21775
A=A-1 // 21776
M=0 // 21777

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 21778
A=M // 21779
D=M // 21780
@3 // 21781
M=D // 21782

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 21783
A=M+1 // 21784
D=M // 21785
@SP // 21786
AM=M+1 // 21787
A=A-1 // 21788
M=D // 21789
@ARG // 21790
A=M+1 // 21791
D=M // 21792
@SP // 21793
AM=M+1 // 21794
A=A-1 // 21795
M=D // 21796
// call Ray.getDirection
@6 // 21797
D=A // 21798
@14 // 21799
M=D // 21800
@Ray.getDirection // 21801
D=A // 21802
@13 // 21803
M=D // 21804
@Plane.intersect.ret.0 // 21805
D=A // 21806
@CALL // 21807
0;JMP // 21808
(Plane.intersect.ret.0)
// call Vec3.dot
@7 // 21809
D=A // 21810
@14 // 21811
M=D // 21812
@Vec3.dot // 21813
D=A // 21814
@13 // 21815
M=D // 21816
@Plane.intersect.ret.1 // 21817
D=A // 21818
@CALL // 21819
0;JMP // 21820
(Plane.intersect.ret.1)
@SP // 21821
AM=M-1 // 21822
D=M // 21823
@LCL // 21824
A=M // 21825
M=D // 21826

////ConditionalGroup{push=UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.is_positive}},
//NOT), ifGoto=IfGotoInstruction{label='Plane.intersect$IF_TRUE1}}
@LCL // 21827
A=M // 21828
D=M // 21829
@SP // 21830
AM=M+1 // 21831
A=A-1 // 21832
M=D // 21833
// call Number.is_positive
@6 // 21834
D=A // 21835
@14 // 21836
M=D // 21837
@Number.is_positive // 21838
D=A // 21839
@13 // 21840
M=D // 21841
@Plane.intersect.ret.2 // 21842
D=A // 21843
@CALL // 21844
0;JMP // 21845
(Plane.intersect.ret.2)
@SP // 21846
AM=M-1 // 21847
D=M // 21848
D=!D // 21849
@Plane.intersect$IF_TRUE1 // 21850
D;JNE // 21851

////GotoInstruction{label='Plane.intersect$IF_END1}
// goto Plane.intersect$IF_END1
@Plane.intersect$IF_END1 // 21852
0;JMP // 21853

////LabelInstruction{label='Plane.intersect$IF_TRUE1}
// label Plane.intersect$IF_TRUE1
(Plane.intersect$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21854
A=M // 21855
D=M // 21856
@SP // 21857
AM=M+1 // 21858
A=A-1 // 21859
M=D // 21860
// call Number.dispose
@6 // 21861
D=A // 21862
@14 // 21863
M=D // 21864
@Number.dispose // 21865
D=A // 21866
@13 // 21867
M=D // 21868
@Plane.intersect.ret.3 // 21869
D=A // 21870
@CALL // 21871
0;JMP // 21872
(Plane.intersect.ret.3)
@SP // 21873
M=M-1 // 21874

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 21875
AM=M+1 // 21876
A=A-1 // 21877
M=-1 // 21878
// call Number.new
@6 // 21879
D=A // 21880
@14 // 21881
M=D // 21882
@Number.new // 21883
D=A // 21884
@13 // 21885
M=D // 21886
@Plane.intersect.ret.4 // 21887
D=A // 21888
@CALL // 21889
0;JMP // 21890
(Plane.intersect.ret.4)
@RETURN // 21891
0;JMP // 21892

////LabelInstruction{label='Plane.intersect$IF_END1}
// label Plane.intersect$IF_END1
(Plane.intersect$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 21893
A=M // 21894
D=M // 21895
@SP // 21896
AM=M+1 // 21897
A=A-1 // 21898
M=D // 21899
// call Vec3.clone
@6 // 21900
D=A // 21901
@14 // 21902
M=D // 21903
@Vec3.clone // 21904
D=A // 21905
@13 // 21906
M=D // 21907
@Plane.intersect.ret.5 // 21908
D=A // 21909
@CALL // 21910
0;JMP // 21911
(Plane.intersect.ret.5)
@SP // 21912
AM=M-1 // 21913
D=M // 21914
@LCL // 21915
A=M+1 // 21916
M=D // 21917

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getOrigin}}], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21918
A=M+1 // 21919
D=M // 21920
@SP // 21921
AM=M+1 // 21922
A=A-1 // 21923
M=D // 21924
@ARG // 21925
A=M+1 // 21926
D=M // 21927
@SP // 21928
AM=M+1 // 21929
A=A-1 // 21930
M=D // 21931
// call Ray.getOrigin
@6 // 21932
D=A // 21933
@14 // 21934
M=D // 21935
@Ray.getOrigin // 21936
D=A // 21937
@13 // 21938
M=D // 21939
@Plane.intersect.ret.6 // 21940
D=A // 21941
@CALL // 21942
0;JMP // 21943
(Plane.intersect.ret.6)
// call Vec3.do_sub
@7 // 21944
D=A // 21945
@14 // 21946
M=D // 21947
@Vec3.do_sub // 21948
D=A // 21949
@13 // 21950
M=D // 21951
@Plane.intersect.ret.7 // 21952
D=A // 21953
@CALL // 21954
0;JMP // 21955
(Plane.intersect.ret.7)
@SP // 21956
M=M-1 // 21957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 1")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 21958
A=M+1 // 21959
D=M // 21960
@SP // 21961
AM=M+1 // 21962
A=A-1 // 21963
M=D // 21964
@THIS // 21965
A=M+1 // 21966
D=M // 21967
@SP // 21968
AM=M+1 // 21969
A=A-1 // 21970
M=D // 21971
// call Vec3.dot
@7 // 21972
D=A // 21973
@14 // 21974
M=D // 21975
@Vec3.dot // 21976
D=A // 21977
@13 // 21978
M=D // 21979
@Plane.intersect.ret.8 // 21980
D=A // 21981
@CALL // 21982
0;JMP // 21983
(Plane.intersect.ret.8)
@SP // 21984
AM=M-1 // 21985
D=M // 21986
@LCL // 21987
A=M+1 // 21988
A=A+1 // 21989
M=D // 21990

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21991
A=M+1 // 21992
A=A+1 // 21993
D=M // 21994
@SP // 21995
AM=M+1 // 21996
A=A-1 // 21997
M=D // 21998
@LCL // 21999
A=M // 22000
D=M // 22001
@SP // 22002
AM=M+1 // 22003
A=A-1 // 22004
M=D // 22005
// call Number.do_div
@7 // 22006
D=A // 22007
@14 // 22008
M=D // 22009
@Number.do_div // 22010
D=A // 22011
@13 // 22012
M=D // 22013
@Plane.intersect.ret.9 // 22014
D=A // 22015
@CALL // 22016
0;JMP // 22017
(Plane.intersect.ret.9)
@SP // 22018
M=M-1 // 22019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22020
A=M // 22021
D=M // 22022
@SP // 22023
AM=M+1 // 22024
A=A-1 // 22025
M=D // 22026
// call Number.dispose
@6 // 22027
D=A // 22028
@14 // 22029
M=D // 22030
@Number.dispose // 22031
D=A // 22032
@13 // 22033
M=D // 22034
@Plane.intersect.ret.10 // 22035
D=A // 22036
@CALL // 22037
0;JMP // 22038
(Plane.intersect.ret.10)
@SP // 22039
M=M-1 // 22040

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22041
A=M+1 // 22042
D=M // 22043
@SP // 22044
AM=M+1 // 22045
A=A-1 // 22046
M=D // 22047
// call Vec3.dispose
@6 // 22048
D=A // 22049
@14 // 22050
M=D // 22051
@Vec3.dispose // 22052
D=A // 22053
@13 // 22054
M=D // 22055
@Plane.intersect.ret.11 // 22056
D=A // 22057
@CALL // 22058
0;JMP // 22059
(Plane.intersect.ret.11)
@SP // 22060
M=M-1 // 22061

////ConditionalGroup{push=UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.is_negative}},
//NOT), ifGoto=IfGotoInstruction{label='Plane.intersect$IF_TRUE2}}
@LCL // 22062
A=M+1 // 22063
A=A+1 // 22064
D=M // 22065
@SP // 22066
AM=M+1 // 22067
A=A-1 // 22068
M=D // 22069
// call Number.is_negative
@6 // 22070
D=A // 22071
@14 // 22072
M=D // 22073
@Number.is_negative // 22074
D=A // 22075
@13 // 22076
M=D // 22077
@Plane.intersect.ret.12 // 22078
D=A // 22079
@CALL // 22080
0;JMP // 22081
(Plane.intersect.ret.12)
@SP // 22082
AM=M-1 // 22083
D=M // 22084
D=!D // 22085
@Plane.intersect$IF_TRUE2 // 22086
D;JNE // 22087

////GotoInstruction{label='Plane.intersect$IF_FALSE2}
// goto Plane.intersect$IF_FALSE2
@Plane.intersect$IF_FALSE2 // 22088
0;JMP // 22089

////LabelInstruction{label='Plane.intersect$IF_TRUE2}
// label Plane.intersect$IF_TRUE2
(Plane.intersect$IF_TRUE2)

////PushInstruction("local 2")
@LCL // 22090
A=M+1 // 22091
A=A+1 // 22092
D=M // 22093
@SP // 22094
AM=M+1 // 22095
A=A-1 // 22096
M=D // 22097
@RETURN // 22098
0;JMP // 22099

////GotoInstruction{label='Plane.intersect$IF_END2}
// goto Plane.intersect$IF_END2
@Plane.intersect$IF_END2 // 22100
0;JMP // 22101

////LabelInstruction{label='Plane.intersect$IF_FALSE2}
// label Plane.intersect$IF_FALSE2
(Plane.intersect$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22102
A=M+1 // 22103
A=A+1 // 22104
D=M // 22105
@SP // 22106
AM=M+1 // 22107
A=A-1 // 22108
M=D // 22109
// call Number.dispose
@6 // 22110
D=A // 22111
@14 // 22112
M=D // 22113
@Number.dispose // 22114
D=A // 22115
@13 // 22116
M=D // 22117
@Plane.intersect.ret.13 // 22118
D=A // 22119
@CALL // 22120
0;JMP // 22121
(Plane.intersect.ret.13)
@SP // 22122
M=M-1 // 22123

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 22124
AM=M+1 // 22125
A=A-1 // 22126
M=-1 // 22127
// call Number.new
@6 // 22128
D=A // 22129
@14 // 22130
M=D // 22131
@Number.new // 22132
D=A // 22133
@13 // 22134
M=D // 22135
@Plane.intersect.ret.14 // 22136
D=A // 22137
@CALL // 22138
0;JMP // 22139
(Plane.intersect.ret.14)
@RETURN // 22140
0;JMP // 22141

////LabelInstruction{label='Plane.intersect$IF_END2}
// label Plane.intersect$IF_END2
(Plane.intersect$IF_END2)

////FunctionInstruction{functionName='Scene.new', numLocals=0, funcMapping={}}
// function Scene.new with 0
(Scene.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 9")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@9 // 22142
D=A // 22143
@SP // 22144
AM=M+1 // 22145
A=A-1 // 22146
M=D // 22147
// call Memory.alloc
@6 // 22148
D=A // 22149
@14 // 22150
M=D // 22151
@Memory.alloc // 22152
D=A // 22153
@13 // 22154
M=D // 22155
@Scene.new.ret.0 // 22156
D=A // 22157
@CALL // 22158
0;JMP // 22159
(Scene.new.ret.0)
@SP // 22160
AM=M-1 // 22161
D=M // 22162
@3 // 22163
M=D // 22164

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 22165
A=M // 22166
D=M // 22167
@THIS // 22168
A=M // 22169
M=D // 22170

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 22171
A=M+1 // 22172
D=M // 22173
@THIS // 22174
A=M+1 // 22175
M=D // 22176

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 5}
//}

@ARG // 22177
A=M+1 // 22178
A=A+1 // 22179
D=M // 22180
@SP // 22181
AM=M+1 // 22182
A=A-1 // 22183
M=D // 22184
@THIS // 22185
D=M // 22186
@5 // 22187
A=D+A // 22188
D=A // 22189
@R13 // 22190
M=D // 22191
@SP // 22192
AM=M-1 // 22193
D=M // 22194
@R13 // 22195
A=M // 22196
M=D // 22197

////PushPopPair {
//  push: PushInstruction("argument 3")
//  pop:  PopInstruction{address=this 6}
//}

@ARG // 22198
A=M+1 // 22199
A=A+1 // 22200
A=A+1 // 22201
D=M // 22202
@SP // 22203
AM=M+1 // 22204
A=A-1 // 22205
M=D // 22206
@THIS // 22207
D=M // 22208
@6 // 22209
A=D+A // 22210
D=A // 22211
@R13 // 22212
M=D // 22213
@SP // 22214
AM=M-1 // 22215
D=M // 22216
@R13 // 22217
A=M // 22218
M=D // 22219

////PushPopPair {
//  push: PushInstruction("argument 4")
//  pop:  PopInstruction{address=this 7}
//}

@ARG // 22220
D=M // 22221
@4 // 22222
A=D+A // 22223
D=M // 22224
@SP // 22225
AM=M+1 // 22226
A=A-1 // 22227
M=D // 22228
@THIS // 22229
D=M // 22230
@7 // 22231
A=D+A // 22232
D=A // 22233
@R13 // 22234
M=D // 22235
@SP // 22236
AM=M-1 // 22237
D=M // 22238
@R13 // 22239
A=M // 22240
M=D // 22241

////PushPopPair {
//  push: PushInstruction("argument 5")
//  pop:  PopInstruction{address=this 8}
//}

@ARG // 22242
D=M // 22243
@5 // 22244
A=D+A // 22245
D=M // 22246
@SP // 22247
AM=M+1 // 22248
A=A-1 // 22249
M=D // 22250
@THIS // 22251
D=M // 22252
@8 // 22253
A=D+A // 22254
D=A // 22255
@R13 // 22256
M=D // 22257
@SP // 22258
AM=M-1 // 22259
D=M // 22260
@R13 // 22261
A=M // 22262
M=D // 22263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=this 3}
//}

@THIS // 22264
A=M // 22265
D=M // 22266
@SP // 22267
AM=M+1 // 22268
A=A-1 // 22269
M=D // 22270
// call Number.new
@6 // 22271
D=A // 22272
@14 // 22273
M=D // 22274
@Number.new // 22275
D=A // 22276
@13 // 22277
M=D // 22278
@Scene.new.ret.1 // 22279
D=A // 22280
@CALL // 22281
0;JMP // 22282
(Scene.new.ret.1)
@SP // 22283
AM=M-1 // 22284
D=M // 22285
@THIS // 22286
A=M+1 // 22287
A=A+1 // 22288
A=A+1 // 22289
M=D // 22290

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=this 4}
//}

@THIS // 22291
A=M+1 // 22292
D=M // 22293
@SP // 22294
AM=M+1 // 22295
A=A-1 // 22296
M=D // 22297
// call Number.new
@6 // 22298
D=A // 22299
@14 // 22300
M=D // 22301
@Number.new // 22302
D=A // 22303
@13 // 22304
M=D // 22305
@Scene.new.ret.2 // 22306
D=A // 22307
@CALL // 22308
0;JMP // 22309
(Scene.new.ret.2)
@THIS // 22310
D=M // 22311
@4 // 22312
A=D+A // 22313
D=A // 22314
@R13 // 22315
M=D // 22316
@SP // 22317
AM=M-1 // 22318
D=M // 22319
@R13 // 22320
A=M // 22321
M=D // 22322

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=this 2}
//}

@THIS // 22323
A=M+1 // 22324
A=A+1 // 22325
A=A+1 // 22326
D=M // 22327
@SP // 22328
AM=M+1 // 22329
A=A-1 // 22330
M=D // 22331
// call Number.clone
@6 // 22332
D=A // 22333
@14 // 22334
M=D // 22335
@Number.clone // 22336
D=A // 22337
@13 // 22338
M=D // 22339
@Scene.new.ret.3 // 22340
D=A // 22341
@CALL // 22342
0;JMP // 22343
(Scene.new.ret.3)
@SP // 22344
AM=M-1 // 22345
D=M // 22346
@THIS // 22347
A=M+1 // 22348
A=A+1 // 22349
M=D // 22350

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("this 4")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22351
A=M+1 // 22352
A=A+1 // 22353
D=M // 22354
@SP // 22355
AM=M+1 // 22356
A=A-1 // 22357
M=D // 22358
@THIS // 22359
D=M // 22360
@4 // 22361
A=D+A // 22362
D=M // 22363
@SP // 22364
AM=M+1 // 22365
A=A-1 // 22366
M=D // 22367
// call Number.do_div
@7 // 22368
D=A // 22369
@14 // 22370
M=D // 22371
@Number.do_div // 22372
D=A // 22373
@13 // 22374
M=D // 22375
@Scene.new.ret.4 // 22376
D=A // 22377
@CALL // 22378
0;JMP // 22379
(Scene.new.ret.4)
@SP // 22380
M=M-1 // 22381

////PushInstruction("pointer 0")
@3 // 22382
D=M // 22383
@SP // 22384
AM=M+1 // 22385
A=A-1 // 22386
M=D // 22387
@RETURN // 22388
0;JMP // 22389

////FunctionInstruction{functionName='Scene.create_prime_ray', numLocals=3, funcMapping={Scene.new=5}}
// function Scene.create_prime_ray with 3
(Scene.create_prime_ray)
@3 // 22390
D=A // 22391
@SP // 22392
AM=D+M // 22393
A=A-1 // 22394
M=0 // 22395
A=A-1 // 22396
M=0 // 22397
A=A-1 // 22398
M=0 // 22399

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 22400
A=M // 22401
D=M // 22402
@3 // 22403
M=D // 22404

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 22405
A=M+1 // 22406
D=M // 22407
@SP // 22408
AM=M+1 // 22409
A=A-1 // 22410
M=D // 22411
// call Number.new
@6 // 22412
D=A // 22413
@14 // 22414
M=D // 22415
@Number.new // 22416
D=A // 22417
@13 // 22418
M=D // 22419
@Scene.create_prime_ray.ret.0 // 22420
D=A // 22421
@CALL // 22422
0;JMP // 22423
(Scene.create_prime_ray.ret.0)
@SP // 22424
AM=M-1 // 22425
D=M // 22426
@LCL // 22427
A=M // 22428
M=D // 22429

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22430
A=M // 22431
D=M // 22432
@SP // 22433
AM=M+1 // 22434
A=A-1 // 22435
M=D // 22436
@ARG // 22437
D=M // 22438
@5 // 22439
A=D+A // 22440
D=M // 22441
@SP // 22442
AM=M+1 // 22443
A=A-1 // 22444
M=D // 22445
// call Number.do_add
@7 // 22446
D=A // 22447
@14 // 22448
M=D // 22449
@Number.do_add // 22450
D=A // 22451
@13 // 22452
M=D // 22453
@Scene.create_prime_ray.ret.1 // 22454
D=A // 22455
@CALL // 22456
0;JMP // 22457
(Scene.create_prime_ray.ret.1)
@SP // 22458
M=M-1 // 22459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 3")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22460
A=M // 22461
D=M // 22462
@SP // 22463
AM=M+1 // 22464
A=A-1 // 22465
M=D // 22466
@THIS // 22467
A=M+1 // 22468
A=A+1 // 22469
A=A+1 // 22470
D=M // 22471
@SP // 22472
AM=M+1 // 22473
A=A-1 // 22474
M=D // 22475
// call Number.do_div
@7 // 22476
D=A // 22477
@14 // 22478
M=D // 22479
@Number.do_div // 22480
D=A // 22481
@13 // 22482
M=D // 22483
@Scene.create_prime_ray.ret.2 // 22484
D=A // 22485
@CALL // 22486
0;JMP // 22487
(Scene.create_prime_ray.ret.2)
@SP // 22488
M=M-1 // 22489

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22490
A=M // 22491
D=M // 22492
@SP // 22493
AM=M+1 // 22494
A=A-1 // 22495
M=D // 22496
@ARG // 22497
D=M // 22498
@4 // 22499
A=D+A // 22500
D=M // 22501
@SP // 22502
AM=M+1 // 22503
A=A-1 // 22504
M=D // 22505
// call Number.do_mul
@7 // 22506
D=A // 22507
@14 // 22508
M=D // 22509
@Number.do_mul // 22510
D=A // 22511
@13 // 22512
M=D // 22513
@Scene.create_prime_ray.ret.3 // 22514
D=A // 22515
@CALL // 22516
0;JMP // 22517
(Scene.create_prime_ray.ret.3)
@SP // 22518
M=M-1 // 22519

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 3")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22520
A=M // 22521
D=M // 22522
@SP // 22523
AM=M+1 // 22524
A=A-1 // 22525
M=D // 22526
@ARG // 22527
A=M+1 // 22528
A=A+1 // 22529
A=A+1 // 22530
D=M // 22531
@SP // 22532
AM=M+1 // 22533
A=A-1 // 22534
M=D // 22535
// call Number.do_sub
@7 // 22536
D=A // 22537
@14 // 22538
M=D // 22539
@Number.do_sub // 22540
D=A // 22541
@13 // 22542
M=D // 22543
@Scene.create_prime_ray.ret.4 // 22544
D=A // 22545
@CALL // 22546
0;JMP // 22547
(Scene.create_prime_ray.ret.4)
@SP // 22548
M=M-1 // 22549

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 2")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22550
A=M // 22551
D=M // 22552
@SP // 22553
AM=M+1 // 22554
A=A-1 // 22555
M=D // 22556
@THIS // 22557
A=M+1 // 22558
A=A+1 // 22559
D=M // 22560
@SP // 22561
AM=M+1 // 22562
A=A-1 // 22563
M=D // 22564
// call Number.do_mul
@7 // 22565
D=A // 22566
@14 // 22567
M=D // 22568
@Number.do_mul // 22569
D=A // 22570
@13 // 22571
M=D // 22572
@Scene.create_prime_ray.ret.5 // 22573
D=A // 22574
@CALL // 22575
0;JMP // 22576
(Scene.create_prime_ray.ret.5)
@SP // 22577
M=M-1 // 22578

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 22579
A=M+1 // 22580
A=A+1 // 22581
D=M // 22582
@SP // 22583
AM=M+1 // 22584
A=A-1 // 22585
M=D // 22586
// call Number.new
@6 // 22587
D=A // 22588
@14 // 22589
M=D // 22590
@Number.new // 22591
D=A // 22592
@13 // 22593
M=D // 22594
@Scene.create_prime_ray.ret.6 // 22595
D=A // 22596
@CALL // 22597
0;JMP // 22598
(Scene.create_prime_ray.ret.6)
@SP // 22599
AM=M-1 // 22600
D=M // 22601
@LCL // 22602
A=M+1 // 22603
M=D // 22604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22605
A=M+1 // 22606
D=M // 22607
@SP // 22608
AM=M+1 // 22609
A=A-1 // 22610
M=D // 22611
@ARG // 22612
D=M // 22613
@5 // 22614
A=D+A // 22615
D=M // 22616
@SP // 22617
AM=M+1 // 22618
A=A-1 // 22619
M=D // 22620
// call Number.do_add
@7 // 22621
D=A // 22622
@14 // 22623
M=D // 22624
@Number.do_add // 22625
D=A // 22626
@13 // 22627
M=D // 22628
@Scene.create_prime_ray.ret.7 // 22629
D=A // 22630
@CALL // 22631
0;JMP // 22632
(Scene.create_prime_ray.ret.7)
@SP // 22633
M=M-1 // 22634

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 4")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22635
A=M+1 // 22636
D=M // 22637
@SP // 22638
AM=M+1 // 22639
A=A-1 // 22640
M=D // 22641
@THIS // 22642
D=M // 22643
@4 // 22644
A=D+A // 22645
D=M // 22646
@SP // 22647
AM=M+1 // 22648
A=A-1 // 22649
M=D // 22650
// call Number.do_div
@7 // 22651
D=A // 22652
@14 // 22653
M=D // 22654
@Number.do_div // 22655
D=A // 22656
@13 // 22657
M=D // 22658
@Scene.create_prime_ray.ret.8 // 22659
D=A // 22660
@CALL // 22661
0;JMP // 22662
(Scene.create_prime_ray.ret.8)
@SP // 22663
M=M-1 // 22664

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22665
A=M+1 // 22666
D=M // 22667
@SP // 22668
AM=M+1 // 22669
A=A-1 // 22670
M=D // 22671
// call Number.do_neg
@6 // 22672
D=A // 22673
@14 // 22674
M=D // 22675
@Number.do_neg // 22676
D=A // 22677
@13 // 22678
M=D // 22679
@Scene.create_prime_ray.ret.9 // 22680
D=A // 22681
@CALL // 22682
0;JMP // 22683
(Scene.create_prime_ray.ret.9)
@SP // 22684
M=M-1 // 22685

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22686
A=M+1 // 22687
D=M // 22688
@SP // 22689
AM=M+1 // 22690
A=A-1 // 22691
M=D // 22692
@ARG // 22693
D=M // 22694
@4 // 22695
A=D+A // 22696
D=M // 22697
@SP // 22698
AM=M+1 // 22699
A=A-1 // 22700
M=D // 22701
// call Number.do_mul
@7 // 22702
D=A // 22703
@14 // 22704
M=D // 22705
@Number.do_mul // 22706
D=A // 22707
@13 // 22708
M=D // 22709
@Scene.create_prime_ray.ret.10 // 22710
D=A // 22711
@CALL // 22712
0;JMP // 22713
(Scene.create_prime_ray.ret.10)
@SP // 22714
M=M-1 // 22715

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 3")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22716
A=M+1 // 22717
D=M // 22718
@SP // 22719
AM=M+1 // 22720
A=A-1 // 22721
M=D // 22722
@ARG // 22723
A=M+1 // 22724
A=A+1 // 22725
A=A+1 // 22726
D=M // 22727
@SP // 22728
AM=M+1 // 22729
A=A-1 // 22730
M=D // 22731
// call Number.do_add
@7 // 22732
D=A // 22733
@14 // 22734
M=D // 22735
@Number.do_add // 22736
D=A // 22737
@13 // 22738
M=D // 22739
@Scene.create_prime_ray.ret.11 // 22740
D=A // 22741
@CALL // 22742
0;JMP // 22743
(Scene.create_prime_ray.ret.11)
@SP // 22744
M=M-1 // 22745

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 22746
A=M // 22747
D=M // 22748
@SP // 22749
AM=M+1 // 22750
A=A-1 // 22751
M=D // 22752
@LCL // 22753
A=M+1 // 22754
D=M // 22755
@SP // 22756
AM=M+1 // 22757
A=A-1 // 22758
M=D // 22759
@SP // 22760
AM=M+1 // 22761
A=A-1 // 22762
M=-1 // 22763
// call Number.new
@6 // 22764
D=A // 22765
@14 // 22766
M=D // 22767
@Number.new // 22768
D=A // 22769
@13 // 22770
M=D // 22771
@Scene.create_prime_ray.ret.12 // 22772
D=A // 22773
@CALL // 22774
0;JMP // 22775
(Scene.create_prime_ray.ret.12)
// call Vec3.new
@8 // 22776
D=A // 22777
@14 // 22778
M=D // 22779
@Vec3.new // 22780
D=A // 22781
@13 // 22782
M=D // 22783
@Scene.create_prime_ray.ret.13 // 22784
D=A // 22785
@CALL // 22786
0;JMP // 22787
(Scene.create_prime_ray.ret.13)
@SP // 22788
AM=M-1 // 22789
D=M // 22790
@LCL // 22791
A=M+1 // 22792
A=A+1 // 22793
M=D // 22794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22795
A=M+1 // 22796
A=A+1 // 22797
D=M // 22798
@SP // 22799
AM=M+1 // 22800
A=A-1 // 22801
M=D // 22802
// call Vec3.do_normalize
@6 // 22803
D=A // 22804
@14 // 22805
M=D // 22806
@Vec3.do_normalize // 22807
D=A // 22808
@13 // 22809
M=D // 22810
@Scene.create_prime_ray.ret.14 // 22811
D=A // 22812
@CALL // 22813
0;JMP // 22814
(Scene.create_prime_ray.ret.14)
@SP // 22815
M=M-1 // 22816

////CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, PushInstruction("local 2")], call=CallInstruction{Ray.new}}
@SP // 22817
AM=M+1 // 22818
A=A-1 // 22819
M=0 // 22820
// call Number.new
@6 // 22821
D=A // 22822
@14 // 22823
M=D // 22824
@Number.new // 22825
D=A // 22826
@13 // 22827
M=D // 22828
@Scene.create_prime_ray.ret.15 // 22829
D=A // 22830
@CALL // 22831
0;JMP // 22832
(Scene.create_prime_ray.ret.15)
@SP // 22833
AM=M+1 // 22834
A=A-1 // 22835
M=0 // 22836
// call Number.new
@6 // 22837
D=A // 22838
@14 // 22839
M=D // 22840
@Number.new // 22841
D=A // 22842
@13 // 22843
M=D // 22844
@Scene.create_prime_ray.ret.16 // 22845
D=A // 22846
@CALL // 22847
0;JMP // 22848
(Scene.create_prime_ray.ret.16)
@SP // 22849
AM=M+1 // 22850
A=A-1 // 22851
M=0 // 22852
// call Number.new
@6 // 22853
D=A // 22854
@14 // 22855
M=D // 22856
@Number.new // 22857
D=A // 22858
@13 // 22859
M=D // 22860
@Scene.create_prime_ray.ret.17 // 22861
D=A // 22862
@CALL // 22863
0;JMP // 22864
(Scene.create_prime_ray.ret.17)
// call Vec3.new
@8 // 22865
D=A // 22866
@14 // 22867
M=D // 22868
@Vec3.new // 22869
D=A // 22870
@13 // 22871
M=D // 22872
@Scene.create_prime_ray.ret.18 // 22873
D=A // 22874
@CALL // 22875
0;JMP // 22876
(Scene.create_prime_ray.ret.18)
@LCL // 22877
A=M+1 // 22878
A=A+1 // 22879
D=M // 22880
@SP // 22881
AM=M+1 // 22882
A=A-1 // 22883
M=D // 22884
// call Ray.new
@7 // 22885
D=A // 22886
@14 // 22887
M=D // 22888
@Ray.new // 22889
D=A // 22890
@13 // 22891
M=D // 22892
@Scene.create_prime_ray.ret.19 // 22893
D=A // 22894
@CALL // 22895
0;JMP // 22896
(Scene.create_prime_ray.ret.19)
@RETURN // 22897
0;JMP // 22898

////FunctionInstruction{functionName='Sphere.dispose', numLocals=0, funcMapping={Sphere.new=1}}
// function Sphere.dispose with 0
(Sphere.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 22899
A=M // 22900
D=M // 22901
@3 // 22902
M=D // 22903

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22904
A=M // 22905
D=M // 22906
@SP // 22907
AM=M+1 // 22908
A=A-1 // 22909
M=D // 22910
// call Vec3.dispose
@6 // 22911
D=A // 22912
@14 // 22913
M=D // 22914
@Vec3.dispose // 22915
D=A // 22916
@13 // 22917
M=D // 22918
@Sphere.dispose.ret.0 // 22919
D=A // 22920
@CALL // 22921
0;JMP // 22922
(Sphere.dispose.ret.0)
@SP // 22923
M=M-1 // 22924

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22925
A=M+1 // 22926
D=M // 22927
@SP // 22928
AM=M+1 // 22929
A=A-1 // 22930
M=D // 22931
// call Number.dispose
@6 // 22932
D=A // 22933
@14 // 22934
M=D // 22935
@Number.dispose // 22936
D=A // 22937
@13 // 22938
M=D // 22939
@Sphere.dispose.ret.1 // 22940
D=A // 22941
@CALL // 22942
0;JMP // 22943
(Sphere.dispose.ret.1)
@SP // 22944
M=M-1 // 22945

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22946
A=M+1 // 22947
A=A+1 // 22948
D=M // 22949
@SP // 22950
AM=M+1 // 22951
A=A-1 // 22952
M=D // 22953
// call Number.dispose
@6 // 22954
D=A // 22955
@14 // 22956
M=D // 22957
@Number.dispose // 22958
D=A // 22959
@13 // 22960
M=D // 22961
@Sphere.dispose.ret.2 // 22962
D=A // 22963
@CALL // 22964
0;JMP // 22965
(Sphere.dispose.ret.2)
@SP // 22966
M=M-1 // 22967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 22968
D=M // 22969
@SP // 22970
AM=M+1 // 22971
A=A-1 // 22972
M=D // 22973
// call Memory.deAlloc
@6 // 22974
D=A // 22975
@14 // 22976
M=D // 22977
@Memory.deAlloc // 22978
D=A // 22979
@13 // 22980
M=D // 22981
@Sphere.dispose.ret.3 // 22982
D=A // 22983
@CALL // 22984
0;JMP // 22985
(Sphere.dispose.ret.3)
@SP // 22986
M=M-1 // 22987

////PushInstruction("constant 0")
@SP // 22988
AM=M+1 // 22989
A=A-1 // 22990
M=0 // 22991
@RETURN // 22992
0;JMP // 22993

////FunctionInstruction{functionName='Int32.do_add', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_add with 3
(Int32.do_add)
@3 // 22994
D=A // 22995
@SP // 22996
AM=D+M // 22997
A=A-1 // 22998
M=0 // 22999
A=A-1 // 23000
M=0 // 23001
A=A-1 // 23002
M=0 // 23003

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23004
A=M // 23005
D=M // 23006
@3 // 23007
M=D // 23008

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 23009
A=M+1 // 23010
D=M // 23011
@SP // 23012
AM=M+1 // 23013
A=A-1 // 23014
M=D // 23015
// call Int32.getParts
@6 // 23016
D=A // 23017
@14 // 23018
M=D // 23019
@Int32.getParts // 23020
D=A // 23021
@13 // 23022
M=D // 23023
@Int32.do_add.ret.0 // 23024
D=A // 23025
@CALL // 23026
0;JMP // 23027
(Int32.do_add.ret.0)
@SP // 23028
AM=M-1 // 23029
D=M // 23030
@LCL // 23031
A=M // 23032
M=D // 23033

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 23034
A=M+1 // 23035
A=A+1 // 23036
M=0 // 23037

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 23038
A=M+1 // 23039
M=0 // 23040

////LabelInstruction{label='Int32.do_add_WHILE_EXP1}
// label Int32.do_add_WHILE_EXP1
(Int32.do_add_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_add_WHILE_END1}}
@Int32.do_add.LT.74 // 23041
D=A // 23042
@SP // 23043
AM=M+1 // 23044
A=A-1 // 23045
M=D // 23046
@LCL // 23047
A=M+1 // 23048
D=M // 23049
@4 // 23050
D=D-A // 23051
@DO_LT // 23052
0;JMP // 23053
(Int32.do_add.LT.74)
D=!D // 23054
@Int32.do_add_WHILE_END1 // 23055
D;JNE // 23056

////PushWriter{source=BinaryPushGroup(
//    left:
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
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 0"),
//                            right:
//                                PushInstruction("local 1"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@THIS // 23057
A=M // 23058
D=M // 23059
@LCL // 23060
A=M+1 // 23061
D=D+M // 23062
@SP // 23063
AM=M+1 // 23064
A=A-1 // 23065
M=D // 23066
@THIS // 23067
A=M // 23068
D=M // 23069
@LCL // 23070
A=M+1 // 23071
A=D+M // 23072
D=M // 23073
@SP // 23074
AM=M+1 // 23075
A=A-1 // 23076
M=D // 23077
@LCL // 23078
A=M+1 // 23079
D=M // 23080
A=A-1 // 23081
A=D+M // 23082
D=M // 23083
@SP // 23084
AM=M-1 // 23085
D=D+M // 23086
@SP // 23087
AM=M+1 // 23088
A=A-1 // 23089
M=D // 23090
@LCL // 23091
A=M+1 // 23092
A=A+1 // 23093
D=M // 23094
@SP // 23095
AM=M-1 // 23096
D=D+M // 23097
@SP // 23098
AM=M-1 // 23099
A=M // 23100
M=D // 23101

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("local 1"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 256"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_add$IF_TRUE1}}
@Int32.do_add.LT.75 // 23102
D=A // 23103
@SP // 23104
AM=M+1 // 23105
A=A-1 // 23106
M=D // 23107
@THIS // 23108
A=M // 23109
D=M // 23110
@LCL // 23111
A=M+1 // 23112
A=D+M // 23113
D=M // 23114
@256 // 23115
D=D-A // 23116
@DO_LT // 23117
0;JMP // 23118
(Int32.do_add.LT.75)
D=!D // 23119
@Int32.do_add$IF_TRUE1 // 23120
D;JNE // 23121

////GotoInstruction{label='Int32.do_add$IF_FALSE1}
// goto Int32.do_add$IF_FALSE1
@Int32.do_add$IF_FALSE1 // 23122
0;JMP // 23123

////LabelInstruction{label='Int32.do_add$IF_TRUE1}
// label Int32.do_add$IF_TRUE1
(Int32.do_add$IF_TRUE1)

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("this 0"),
//                    right:
//                        PushInstruction("local 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 256"),
//    binaryOp: "SUB"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@THIS // 23124
A=M // 23125
D=M // 23126
@LCL // 23127
A=M+1 // 23128
D=D+M // 23129
@SP // 23130
AM=M+1 // 23131
A=A-1 // 23132
M=D // 23133
@THIS // 23134
A=M // 23135
D=M // 23136
@LCL // 23137
A=M+1 // 23138
A=D+M // 23139
D=M // 23140
@256 // 23141
D=D-A // 23142
@SP // 23143
AM=M-1 // 23144
A=M // 23145
M=D // 23146

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 23147
A=M+1 // 23148
A=A+1 // 23149
M=1 // 23150

////GotoInstruction{label='Int32.do_add$IF_END1}
// goto Int32.do_add$IF_END1
@Int32.do_add$IF_END1 // 23151
0;JMP // 23152

////LabelInstruction{label='Int32.do_add$IF_FALSE1}
// label Int32.do_add$IF_FALSE1
(Int32.do_add$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 23153
A=M+1 // 23154
A=A+1 // 23155
M=0 // 23156

////LabelInstruction{label='Int32.do_add$IF_END1}
// label Int32.do_add$IF_END1
(Int32.do_add$IF_END1)

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

@LCL // 23157
A=M+1 // 23158
M=M+1 // 23159

////GotoInstruction{label='Int32.do_add_WHILE_EXP1}
// goto Int32.do_add_WHILE_EXP1
@Int32.do_add_WHILE_EXP1 // 23160
0;JMP // 23161

////LabelInstruction{label='Int32.do_add_WHILE_END1}
// label Int32.do_add_WHILE_END1
(Int32.do_add_WHILE_END1)

////PushInstruction("constant 0")
@SP // 23162
AM=M+1 // 23163
A=A-1 // 23164
M=0 // 23165
@RETURN // 23166
0;JMP // 23167

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.copy=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 23168
M=M+1 // 23169
AM=M+1 // 23170
A=A-1 // 23171
M=0 // 23172
A=A-1 // 23173
M=0 // 23174

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 23175
A=M+1 // 23176
D=M // 23177
@2 // 23178
D=D+A // 23179
@SP // 23180
AM=M+1 // 23181
A=A-1 // 23182
M=D // 23183
D=0 // 23184
@SP // 23185
AM=M-1 // 23186
A=M // 23187
M=D // 23188

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 23189
A=M+1 // 23190
D=M // 23191
@3 // 23192
D=D+A // 23193
@SP // 23194
AM=M+1 // 23195
A=A-1 // 23196
M=D // 23197
D=0 // 23198
@SP // 23199
AM=M-1 // 23200
A=M // 23201
M=D // 23202

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
@Memory.add_node.EQ.76 // 23203
D=A // 23204
@SP // 23205
AM=M+1 // 23206
A=A-1 // 23207
M=D // 23208
@ARG // 23209
A=M // 23210
A=M // 23211
D=M // 23212
@DO_EQ // 23213
0;JMP // 23214
(Memory.add_node.EQ.76)
@Memory.add_node$IF_TRUE1 // 23215
D;JNE // 23216

////GotoInstruction{label='Memory.add_node$IF_END1}
// goto Memory.add_node$IF_END1
@Memory.add_node$IF_END1 // 23217
0;JMP // 23218

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
@ARG // 23219
A=M // 23220
D=M // 23221
@SP // 23222
AM=M+1 // 23223
A=A-1 // 23224
M=D // 23225
@ARG // 23226
A=M+1 // 23227
D=M // 23228
@SP // 23229
AM=M-1 // 23230
A=M // 23231
M=D // 23232

////PushInstruction("constant 0")
@SP // 23233
AM=M+1 // 23234
A=A-1 // 23235
M=0 // 23236
@RETURN // 23237
0;JMP // 23238

////LabelInstruction{label='Memory.add_node$IF_END1}
// label Memory.add_node$IF_END1
(Memory.add_node$IF_END1)

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

@ARG // 23239
A=M // 23240
A=M // 23241
D=M // 23242
@LCL // 23243
A=M // 23244
M=D // 23245

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 23246
A=M+1 // 23247
M=0 // 23248

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
@Memory.add_node.EQ.77 // 23249
D=A // 23250
@SP // 23251
AM=M+1 // 23252
A=A-1 // 23253
M=D // 23254
@LCL // 23255
A=M // 23256
D=M // 23257
@DO_EQ // 23258
0;JMP // 23259
(Memory.add_node.EQ.77)
@SP // 23260
AM=M+1 // 23261
A=A-1 // 23262
M=D // 23263
@SP // 23264
A=M-1 // 23265
M=!D // 23266
@Memory.add_node.GT.78 // 23267
D=A // 23268
@SP // 23269
AM=M+1 // 23270
A=A-1 // 23271
M=D // 23272
@LCL // 23273
A=M // 23274
A=M // 23275
D=M // 23276
@SP // 23277
AM=M+1 // 23278
A=A-1 // 23279
M=D // 23280
@ARG // 23281
A=M+1 // 23282
A=M // 23283
D=M // 23284
@SP // 23285
AM=M-1 // 23286
D=M-D // 23287
@DO_GT // 23288
0;JMP // 23289
(Memory.add_node.GT.78)
D=!D // 23290
@SP // 23291
AM=M-1 // 23292
D=D&M // 23293
D=!D // 23294
@Memory.add_node_WHILE_END1 // 23295
D;JNE // 23296

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 23297
A=M // 23298
D=M // 23299
@LCL // 23300
A=M+1 // 23301
M=D // 23302

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

@LCL // 23303
A=M // 23304
D=M // 23305
@LCL // 23306
A=M // 23307
D=M // 23308
@3 // 23309
D=D+A // 23310
A=D // 23311
D=M // 23312
@LCL // 23313
A=M // 23314
M=D // 23315

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 23316
0;JMP // 23317

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@Memory.add_node.EQ.79 // 23318
D=A // 23319
@SP // 23320
AM=M+1 // 23321
A=A-1 // 23322
M=D // 23323
@LCL // 23324
A=M+1 // 23325
D=M // 23326
@DO_EQ // 23327
0;JMP // 23328
(Memory.add_node.EQ.79)
@Memory.add_node$IF_TRUE2 // 23329
D;JNE // 23330

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 23331
0;JMP // 23332

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
@ARG // 23333
A=M+1 // 23334
D=M // 23335
@3 // 23336
D=D+A // 23337
@SP // 23338
AM=M+1 // 23339
A=A-1 // 23340
M=D // 23341
@ARG // 23342
A=M // 23343
A=M // 23344
D=M // 23345
@SP // 23346
AM=M-1 // 23347
A=M // 23348
M=D // 23349

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
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
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 23350
A=M // 23351
A=M // 23352
D=M // 23353
@2 // 23354
D=D+A // 23355
@SP // 23356
AM=M+1 // 23357
A=A-1 // 23358
M=D // 23359
@ARG // 23360
A=M+1 // 23361
D=M // 23362
@SP // 23363
AM=M-1 // 23364
A=M // 23365
M=D // 23366

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 23367
A=M // 23368
D=M // 23369
@SP // 23370
AM=M+1 // 23371
A=A-1 // 23372
M=D // 23373
@ARG // 23374
A=M+1 // 23375
D=M // 23376
@SP // 23377
AM=M-1 // 23378
A=M // 23379
M=D // 23380

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 23381
0;JMP // 23382

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
@ARG // 23383
A=M+1 // 23384
D=M // 23385
@3 // 23386
D=D+A // 23387
@SP // 23388
AM=M+1 // 23389
A=A-1 // 23390
M=D // 23391
@LCL // 23392
A=M // 23393
D=M // 23394
@SP // 23395
AM=M-1 // 23396
A=M // 23397
M=D // 23398

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 23399
A=M+1 // 23400
D=M // 23401
@2 // 23402
D=D+A // 23403
@SP // 23404
AM=M+1 // 23405
A=A-1 // 23406
M=D // 23407
@LCL // 23408
A=M+1 // 23409
D=M // 23410
@SP // 23411
AM=M-1 // 23412
A=M // 23413
M=D // 23414

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 23415
A=M // 23416
D=M // 23417
@Memory.add_node$IF_TRUE3 // 23418
D;JNE // 23419

////GotoInstruction{label='Memory.add_node$IF_END3}
// goto Memory.add_node$IF_END3
@Memory.add_node$IF_END3 // 23420
0;JMP // 23421

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
@LCL // 23422
A=M // 23423
D=M // 23424
@2 // 23425
D=D+A // 23426
@SP // 23427
AM=M+1 // 23428
A=A-1 // 23429
M=D // 23430
@ARG // 23431
A=M+1 // 23432
D=M // 23433
@SP // 23434
AM=M-1 // 23435
A=M // 23436
M=D // 23437

////LabelInstruction{label='Memory.add_node$IF_END3}
// label Memory.add_node$IF_END3
(Memory.add_node$IF_END3)

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 23438
A=M+1 // 23439
D=M // 23440
@3 // 23441
D=D+A // 23442
@SP // 23443
AM=M+1 // 23444
A=A-1 // 23445
M=D // 23446
@ARG // 23447
A=M+1 // 23448
D=M // 23449
@SP // 23450
AM=M-1 // 23451
A=M // 23452
M=D // 23453

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 23454
AM=M+1 // 23455
A=A-1 // 23456
M=0 // 23457
@RETURN // 23458
0;JMP // 23459

////FunctionInstruction{functionName='Vec3.do_sub', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.clone=4, Vec3.do_cross=27, Vec3.new=1}}
// function Vec3.do_sub with 0
(Vec3.do_sub)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23460
A=M // 23461
D=M // 23462
@3 // 23463
M=D // 23464

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23465
A=M // 23466
D=M // 23467
@SP // 23468
AM=M+1 // 23469
A=A-1 // 23470
M=D // 23471
@ARG // 23472
A=M+1 // 23473
D=M // 23474
@SP // 23475
AM=M+1 // 23476
A=A-1 // 23477
M=D // 23478
// call Vec3.getX
@6 // 23479
D=A // 23480
@14 // 23481
M=D // 23482
@Vec3.getX // 23483
D=A // 23484
@13 // 23485
M=D // 23486
@Vec3.do_sub.ret.0 // 23487
D=A // 23488
@CALL // 23489
0;JMP // 23490
(Vec3.do_sub.ret.0)
// call Number.do_sub
@7 // 23491
D=A // 23492
@14 // 23493
M=D // 23494
@Number.do_sub // 23495
D=A // 23496
@13 // 23497
M=D // 23498
@Vec3.do_sub.ret.1 // 23499
D=A // 23500
@CALL // 23501
0;JMP // 23502
(Vec3.do_sub.ret.1)
@SP // 23503
M=M-1 // 23504

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23505
A=M+1 // 23506
D=M // 23507
@SP // 23508
AM=M+1 // 23509
A=A-1 // 23510
M=D // 23511
@ARG // 23512
A=M+1 // 23513
D=M // 23514
@SP // 23515
AM=M+1 // 23516
A=A-1 // 23517
M=D // 23518
// call Vec3.getY
@6 // 23519
D=A // 23520
@14 // 23521
M=D // 23522
@Vec3.getY // 23523
D=A // 23524
@13 // 23525
M=D // 23526
@Vec3.do_sub.ret.2 // 23527
D=A // 23528
@CALL // 23529
0;JMP // 23530
(Vec3.do_sub.ret.2)
// call Number.do_sub
@7 // 23531
D=A // 23532
@14 // 23533
M=D // 23534
@Number.do_sub // 23535
D=A // 23536
@13 // 23537
M=D // 23538
@Vec3.do_sub.ret.3 // 23539
D=A // 23540
@CALL // 23541
0;JMP // 23542
(Vec3.do_sub.ret.3)
@SP // 23543
M=M-1 // 23544

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23545
A=M+1 // 23546
A=A+1 // 23547
D=M // 23548
@SP // 23549
AM=M+1 // 23550
A=A-1 // 23551
M=D // 23552
@ARG // 23553
A=M+1 // 23554
D=M // 23555
@SP // 23556
AM=M+1 // 23557
A=A-1 // 23558
M=D // 23559
// call Vec3.getZ
@6 // 23560
D=A // 23561
@14 // 23562
M=D // 23563
@Vec3.getZ // 23564
D=A // 23565
@13 // 23566
M=D // 23567
@Vec3.do_sub.ret.4 // 23568
D=A // 23569
@CALL // 23570
0;JMP // 23571
(Vec3.do_sub.ret.4)
// call Number.do_sub
@7 // 23572
D=A // 23573
@14 // 23574
M=D // 23575
@Number.do_sub // 23576
D=A // 23577
@13 // 23578
M=D // 23579
@Vec3.do_sub.ret.5 // 23580
D=A // 23581
@CALL // 23582
0;JMP // 23583
(Vec3.do_sub.ret.5)
@SP // 23584
M=M-1 // 23585

////PushInstruction("constant 0")
@SP // 23586
AM=M+1 // 23587
A=A-1 // 23588
M=0 // 23589
@RETURN // 23590
0;JMP // 23591

////FunctionInstruction{functionName='Scene.trace', numLocals=6, funcMapping={Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.trace with 6
(Scene.trace)
@6 // 23592
D=A // 23593
@SP // 23594
AM=D+M // 23595
A=A-1 // 23596
M=0 // 23597
A=A-1 // 23598
M=0 // 23599
A=A-1 // 23600
M=0 // 23601
A=A-1 // 23602
M=0 // 23603
A=A-1 // 23604
M=0 // 23605
A=A-1 // 23606
M=0 // 23607

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23608
A=M // 23609
D=M // 23610
@3 // 23611
M=D // 23612

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 23613
A=M // 23614
M=0 // 23615

////LabelInstruction{label='Scene.trace_WHILE_EXP1}
// label Scene.trace_WHILE_EXP1
(Scene.trace_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("this 6"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.trace_WHILE_END1}}
@Scene.trace.LT.80 // 23616
D=A // 23617
@SP // 23618
AM=M+1 // 23619
A=A-1 // 23620
M=D // 23621
@LCL // 23622
A=M+1 // 23623
D=M // 23624
@SP // 23625
AM=M+1 // 23626
A=A-1 // 23627
M=D // 23628
@THIS // 23629
D=M // 23630
@6 // 23631
A=D+A // 23632
D=M // 23633
@SP // 23634
AM=M-1 // 23635
D=M-D // 23636
@DO_LT // 23637
0;JMP // 23638
(Scene.trace.LT.80)
D=!D // 23639
@Scene.trace_WHILE_END1 // 23640
D;JNE // 23641

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 5"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 23642
D=M // 23643
@5 // 23644
A=D+A // 23645
D=M // 23646
@SP // 23647
AM=M+1 // 23648
A=A-1 // 23649
M=D // 23650
@LCL // 23651
A=M+1 // 23652
D=M // 23653
@SP // 23654
AM=M-1 // 23655
A=D+M // 23656
D=M // 23657
@LCL // 23658
A=M+1 // 23659
A=A+1 // 23660
M=D // 23661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("argument 1")], call=CallInstruction{Element.intersect}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 23662
A=M+1 // 23663
A=A+1 // 23664
D=M // 23665
@SP // 23666
AM=M+1 // 23667
A=A-1 // 23668
M=D // 23669
@ARG // 23670
A=M+1 // 23671
D=M // 23672
@SP // 23673
AM=M+1 // 23674
A=A-1 // 23675
M=D // 23676
// call Element.intersect
@7 // 23677
D=A // 23678
@14 // 23679
M=D // 23680
@Element.intersect // 23681
D=A // 23682
@13 // 23683
M=D // 23684
@Scene.trace.ret.0 // 23685
D=A // 23686
@CALL // 23687
0;JMP // 23688
(Scene.trace.ret.0)
@SP // 23689
AM=M-1 // 23690
D=M // 23691
@LCL // 23692
A=M+1 // 23693
A=A+1 // 23694
A=A+1 // 23695
M=D // 23696

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 23697
D=M // 23698
@5 // 23699
A=D+A // 23700
M=0 // 23701

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.trace$IF_TRUE1}}
@Scene.trace.EQ.81 // 23702
D=A // 23703
@SP // 23704
AM=M+1 // 23705
A=A-1 // 23706
M=D // 23707
@LCL // 23708
A=M // 23709
D=M // 23710
@DO_EQ // 23711
0;JMP // 23712
(Scene.trace.EQ.81)
D=!D // 23713
@Scene.trace$IF_TRUE1 // 23714
D;JNE // 23715

////GotoInstruction{label='Scene.trace$IF_END1}
// goto Scene.trace$IF_END1
@Scene.trace$IF_END1 // 23716
0;JMP // 23717

////LabelInstruction{label='Scene.trace$IF_TRUE1}
// label Scene.trace$IF_TRUE1
(Scene.trace$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Intersection.getDistanceFromOrigin}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 23718
A=M // 23719
D=M // 23720
@SP // 23721
AM=M+1 // 23722
A=A-1 // 23723
M=D // 23724
// call Intersection.getDistanceFromOrigin
@6 // 23725
D=A // 23726
@14 // 23727
M=D // 23728
@Intersection.getDistanceFromOrigin // 23729
D=A // 23730
@13 // 23731
M=D // 23732
@Scene.trace.ret.1 // 23733
D=A // 23734
@CALL // 23735
0;JMP // 23736
(Scene.trace.ret.1)
@LCL // 23737
D=M // 23738
@4 // 23739
A=D+A // 23740
D=A // 23741
@R13 // 23742
M=D // 23743
@SP // 23744
AM=M-1 // 23745
D=M // 23746
@R13 // 23747
A=M // 23748
M=D // 23749

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 4")], call=CallInstruction{Number.is_less_than}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 23750
A=M+1 // 23751
A=A+1 // 23752
A=A+1 // 23753
D=M // 23754
@SP // 23755
AM=M+1 // 23756
A=A-1 // 23757
M=D // 23758
@LCL // 23759
D=M // 23760
@4 // 23761
A=D+A // 23762
D=M // 23763
@SP // 23764
AM=M+1 // 23765
A=A-1 // 23766
M=D // 23767
// call Number.is_less_than
@7 // 23768
D=A // 23769
@14 // 23770
M=D // 23771
@Number.is_less_than // 23772
D=A // 23773
@13 // 23774
M=D // 23775
@Scene.trace.ret.2 // 23776
D=A // 23777
@CALL // 23778
0;JMP // 23779
(Scene.trace.ret.2)
@LCL // 23780
D=M // 23781
@5 // 23782
A=D+A // 23783
D=A // 23784
@R13 // 23785
M=D // 23786
@SP // 23787
AM=M-1 // 23788
D=M // 23789
@R13 // 23790
A=M // 23791
M=D // 23792

////LabelInstruction{label='Scene.trace$IF_END1}
// label Scene.trace$IF_END1
(Scene.trace$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.is_negative}},
//NOT),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//            right:
//                PushInstruction("local 5"),
//            binaryOp: "OR"
//        ),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Scene.trace$IF_TRUE2}}
@LCL // 23793
A=M+1 // 23794
A=A+1 // 23795
A=A+1 // 23796
D=M // 23797
@SP // 23798
AM=M+1 // 23799
A=A-1 // 23800
M=D // 23801
// call Number.is_negative
@6 // 23802
D=A // 23803
@14 // 23804
M=D // 23805
@Number.is_negative // 23806
D=A // 23807
@13 // 23808
M=D // 23809
@Scene.trace.ret.3 // 23810
D=A // 23811
@CALL // 23812
0;JMP // 23813
(Scene.trace.ret.3)
@SP // 23814
A=M-1 // 23815
M=!D // 23816
@Scene.trace.EQ.82 // 23817
D=A // 23818
@SP // 23819
AM=M+1 // 23820
A=A-1 // 23821
M=D // 23822
@LCL // 23823
A=M // 23824
D=M // 23825
@DO_EQ // 23826
0;JMP // 23827
(Scene.trace.EQ.82)
@SP // 23828
AM=M+1 // 23829
A=A-1 // 23830
M=D // 23831
@LCL // 23832
D=M // 23833
@5 // 23834
A=D+A // 23835
D=M // 23836
@SP // 23837
AM=M-1 // 23838
D=D|M // 23839
@SP // 23840
AM=M-1 // 23841
D=D&M // 23842
@Scene.trace$IF_TRUE2 // 23843
D;JNE // 23844

////GotoInstruction{label='Scene.trace$IF_FALSE2}
// goto Scene.trace$IF_FALSE2
@Scene.trace$IF_FALSE2 // 23845
0;JMP // 23846

////LabelInstruction{label='Scene.trace$IF_TRUE2}
// label Scene.trace$IF_TRUE2
(Scene.trace$IF_TRUE2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.trace$IF_TRUE3}}
@Scene.trace.EQ.83 // 23847
D=A // 23848
@SP // 23849
AM=M+1 // 23850
A=A-1 // 23851
M=D // 23852
@LCL // 23853
A=M // 23854
D=M // 23855
@DO_EQ // 23856
0;JMP // 23857
(Scene.trace.EQ.83)
D=!D // 23858
@Scene.trace$IF_TRUE3 // 23859
D;JNE // 23860

////GotoInstruction{label='Scene.trace$IF_END3}
// goto Scene.trace$IF_END3
@Scene.trace$IF_END3 // 23861
0;JMP // 23862

////LabelInstruction{label='Scene.trace$IF_TRUE3}
// label Scene.trace$IF_TRUE3
(Scene.trace$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 23863
A=M // 23864
D=M // 23865
@SP // 23866
AM=M+1 // 23867
A=A-1 // 23868
M=D // 23869
// call Intersection.dispose
@6 // 23870
D=A // 23871
@14 // 23872
M=D // 23873
@Intersection.dispose // 23874
D=A // 23875
@13 // 23876
M=D // 23877
@Scene.trace.ret.4 // 23878
D=A // 23879
@CALL // 23880
0;JMP // 23881
(Scene.trace.ret.4)
@SP // 23882
M=M-1 // 23883

////LabelInstruction{label='Scene.trace$IF_END3}
// label Scene.trace$IF_END3
(Scene.trace$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 2")], call=CallInstruction{Intersection.new}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 23884
A=M+1 // 23885
A=A+1 // 23886
A=A+1 // 23887
D=M // 23888
@SP // 23889
AM=M+1 // 23890
A=A-1 // 23891
M=D // 23892
@LCL // 23893
A=M+1 // 23894
A=A+1 // 23895
D=M // 23896
@SP // 23897
AM=M+1 // 23898
A=A-1 // 23899
M=D // 23900
// call Intersection.new
@7 // 23901
D=A // 23902
@14 // 23903
M=D // 23904
@Intersection.new // 23905
D=A // 23906
@13 // 23907
M=D // 23908
@Scene.trace.ret.5 // 23909
D=A // 23910
@CALL // 23911
0;JMP // 23912
(Scene.trace.ret.5)
@SP // 23913
AM=M-1 // 23914
D=M // 23915
@LCL // 23916
A=M // 23917
M=D // 23918

////GotoInstruction{label='Scene.trace$IF_END2}
// goto Scene.trace$IF_END2
@Scene.trace$IF_END2 // 23919
0;JMP // 23920

////LabelInstruction{label='Scene.trace$IF_FALSE2}
// label Scene.trace$IF_FALSE2
(Scene.trace$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 23921
A=M+1 // 23922
A=A+1 // 23923
A=A+1 // 23924
D=M // 23925
@SP // 23926
AM=M+1 // 23927
A=A-1 // 23928
M=D // 23929
// call Number.dispose
@6 // 23930
D=A // 23931
@14 // 23932
M=D // 23933
@Number.dispose // 23934
D=A // 23935
@13 // 23936
M=D // 23937
@Scene.trace.ret.6 // 23938
D=A // 23939
@CALL // 23940
0;JMP // 23941
(Scene.trace.ret.6)
@SP // 23942
M=M-1 // 23943

////LabelInstruction{label='Scene.trace$IF_END2}
// label Scene.trace$IF_END2
(Scene.trace$IF_END2)

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

@LCL // 23944
A=M+1 // 23945
M=M+1 // 23946

////GotoInstruction{label='Scene.trace_WHILE_EXP1}
// goto Scene.trace_WHILE_EXP1
@Scene.trace_WHILE_EXP1 // 23947
0;JMP // 23948

////LabelInstruction{label='Scene.trace_WHILE_END1}
// label Scene.trace_WHILE_END1
(Scene.trace_WHILE_END1)

////PushInstruction("local 0")
@LCL // 23949
A=M // 23950
D=M // 23951
@SP // 23952
AM=M+1 // 23953
A=A-1 // 23954
M=D // 23955
@RETURN // 23956
0;JMP // 23957

////FunctionInstruction{functionName='Int32.is_negative', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_negative with 0
(Int32.is_negative)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23958
A=M // 23959
D=M // 23960
@3 // 23961
M=D // 23962

////UnaryPushGroup(    BinaryPushGroup(
//        left:
//            Dereference(
//                base:
//                    BinaryPushGroup(
//                        left:
//                            PushInstruction("this 0"),
//                        right:
//                            PushInstruction("constant 3"),
//                        binaryOp: "ADD"
//                    )
//            ),
//        right:
//            PushInstruction("constant 128"),
//        binaryOp: "LT"
//    ),
//NOT)
@Int32.is_negative.LT.84 // 23963
D=A // 23964
@SP // 23965
AM=M+1 // 23966
A=A-1 // 23967
M=D // 23968
@THIS // 23969
A=M // 23970
D=M // 23971
@THIS // 23972
A=M // 23973
D=M // 23974
@3 // 23975
D=D+A // 23976
A=D // 23977
D=M // 23978
@128 // 23979
D=D-A // 23980
@DO_LT // 23981
0;JMP // 23982
(Int32.is_negative.LT.84)
@SP // 23983
AM=M+1 // 23984
A=A-1 // 23985
M=D // 23986
@SP // 23987
A=M-1 // 23988
M=!D // 23989
@RETURN // 23990
0;JMP // 23991

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 23992
D=A // 23993
@14 // 23994
M=D // 23995
@Memory.init // 23996
D=A // 23997
@13 // 23998
M=D // 23999
@Sys.init.ret.0 // 24000
D=A // 24001
@CALL // 24002
0;JMP // 24003
(Sys.init.ret.0)
@SP // 24004
M=M-1 // 24005

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 24006
D=A // 24007
@14 // 24008
M=D // 24009
@Math.init // 24010
D=A // 24011
@13 // 24012
M=D // 24013
@Sys.init.ret.1 // 24014
D=A // 24015
@CALL // 24016
0;JMP // 24017
(Sys.init.ret.1)
@SP // 24018
M=M-1 // 24019

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 24020
D=A // 24021
@14 // 24022
M=D // 24023
@Screen.init // 24024
D=A // 24025
@13 // 24026
M=D // 24027
@Sys.init.ret.2 // 24028
D=A // 24029
@CALL // 24030
0;JMP // 24031
(Sys.init.ret.2)
@SP // 24032
M=M-1 // 24033

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 24034
D=A // 24035
@14 // 24036
M=D // 24037
@Output.init // 24038
D=A // 24039
@13 // 24040
M=D // 24041
@Sys.init.ret.3 // 24042
D=A // 24043
@CALL // 24044
0;JMP // 24045
(Sys.init.ret.3)
@SP // 24046
M=M-1 // 24047

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 24048
D=A // 24049
@14 // 24050
M=D // 24051
@Main.main // 24052
D=A // 24053
@13 // 24054
M=D // 24055
@Sys.init.ret.4 // 24056
D=A // 24057
@CALL // 24058
0;JMP // 24059
(Sys.init.ret.4)
@SP // 24060
M=M-1 // 24061

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 24062
D=A // 24063
@14 // 24064
M=D // 24065
@Sys.halt // 24066
D=A // 24067
@13 // 24068
M=D // 24069
@Sys.init.ret.5 // 24070
D=A // 24071
@CALL // 24072
0;JMP // 24073
(Sys.init.ret.5)
@SP // 24074
M=M-1 // 24075

////PushInstruction("constant 0")
@SP // 24076
AM=M+1 // 24077
A=A-1 // 24078
M=0 // 24079
@RETURN // 24080
0;JMP // 24081

////FunctionInstruction{functionName='Element.plane', numLocals=0, funcMapping={Element.surface_normal=2, Element.color=2}}
// function Element.plane with 0
(Element.plane)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 24082
D=A // 24083
@SP // 24084
AM=M+1 // 24085
A=A-1 // 24086
M=D // 24087
// call Memory.alloc
@6 // 24088
D=A // 24089
@14 // 24090
M=D // 24091
@Memory.alloc // 24092
D=A // 24093
@13 // 24094
M=D // 24095
@Element.plane.ret.0 // 24096
D=A // 24097
@CALL // 24098
0;JMP // 24099
(Element.plane.ret.0)
@SP // 24100
AM=M-1 // 24101
D=M // 24102
@3 // 24103
M=D // 24104

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 24105
A=M // 24106
D=M // 24107
@THIS // 24108
A=M // 24109
M=D // 24110

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 24111
A=M+1 // 24112
M=0 // 24113

////PushInstruction("pointer 0")
@3 // 24114
D=M // 24115
@SP // 24116
AM=M+1 // 24117
A=A-1 // 24118
M=D // 24119
@RETURN // 24120
0;JMP // 24121

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 24122
A=M // 24123
D=M // 24124
@Screen.0 // 24125
M=D // 24126

////PushInstruction("constant 0")
@SP // 24127
AM=M+1 // 24128
A=A-1 // 24129
M=0 // 24130
@RETURN // 24131
0;JMP // 24132

////FunctionInstruction{functionName='Vec3.dispose', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.new=1}}
// function Vec3.dispose with 0
(Vec3.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24133
A=M // 24134
D=M // 24135
@3 // 24136
M=D // 24137

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Vec3.0 // 24138
M=M-1 // 24139

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24140
A=M // 24141
D=M // 24142
@SP // 24143
AM=M+1 // 24144
A=A-1 // 24145
M=D // 24146
// call Number.dispose
@6 // 24147
D=A // 24148
@14 // 24149
M=D // 24150
@Number.dispose // 24151
D=A // 24152
@13 // 24153
M=D // 24154
@Vec3.dispose.ret.0 // 24155
D=A // 24156
@CALL // 24157
0;JMP // 24158
(Vec3.dispose.ret.0)
@SP // 24159
M=M-1 // 24160

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24161
A=M+1 // 24162
D=M // 24163
@SP // 24164
AM=M+1 // 24165
A=A-1 // 24166
M=D // 24167
// call Number.dispose
@6 // 24168
D=A // 24169
@14 // 24170
M=D // 24171
@Number.dispose // 24172
D=A // 24173
@13 // 24174
M=D // 24175
@Vec3.dispose.ret.1 // 24176
D=A // 24177
@CALL // 24178
0;JMP // 24179
(Vec3.dispose.ret.1)
@SP // 24180
M=M-1 // 24181

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24182
A=M+1 // 24183
A=A+1 // 24184
D=M // 24185
@SP // 24186
AM=M+1 // 24187
A=A-1 // 24188
M=D // 24189
// call Number.dispose
@6 // 24190
D=A // 24191
@14 // 24192
M=D // 24193
@Number.dispose // 24194
D=A // 24195
@13 // 24196
M=D // 24197
@Vec3.dispose.ret.2 // 24198
D=A // 24199
@CALL // 24200
0;JMP // 24201
(Vec3.dispose.ret.2)
@SP // 24202
M=M-1 // 24203

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 24204
D=M // 24205
@SP // 24206
AM=M+1 // 24207
A=A-1 // 24208
M=D // 24209
// call Memory.deAlloc
@6 // 24210
D=A // 24211
@14 // 24212
M=D // 24213
@Memory.deAlloc // 24214
D=A // 24215
@13 // 24216
M=D // 24217
@Vec3.dispose.ret.3 // 24218
D=A // 24219
@CALL // 24220
0;JMP // 24221
(Vec3.dispose.ret.3)
@SP // 24222
M=M-1 // 24223

////PushInstruction("constant 0")
@SP // 24224
AM=M+1 // 24225
A=A-1 // 24226
M=0 // 24227
@RETURN // 24228
0;JMP // 24229

////FunctionInstruction{functionName='DirectionalLight.getColor', numLocals=0, funcMapping={}}
// function DirectionalLight.getColor with 0
(DirectionalLight.getColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24230
A=M // 24231
D=M // 24232
@3 // 24233
M=D // 24234

////PushInstruction("this 1")
@THIS // 24235
A=M+1 // 24236
D=M // 24237
@SP // 24238
AM=M+1 // 24239
A=A-1 // 24240
M=D // 24241
@RETURN // 24242
0;JMP // 24243

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 24244
M=M+1 // 24245
AM=M+1 // 24246
A=A-1 // 24247
M=0 // 24248
A=A-1 // 24249
M=0 // 24250

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24251
A=M // 24252
M=1 // 24253

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 24254
A=M+1 // 24255
M=0 // 24256

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 24257
D=A // 24258
@SP // 24259
AM=M+1 // 24260
A=A-1 // 24261
M=D // 24262
// call Memory.alloc
@6 // 24263
D=A // 24264
@14 // 24265
M=D // 24266
@Memory.alloc // 24267
D=A // 24268
@13 // 24269
M=D // 24270
@Math.init.ret.0 // 24271
D=A // 24272
@CALL // 24273
0;JMP // 24274
(Math.init.ret.0)
@SP // 24275
AM=M-1 // 24276
D=M // 24277
@Math.0 // 24278
M=D // 24279

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
@Math.init.LT.85 // 24280
D=A // 24281
@SP // 24282
AM=M+1 // 24283
A=A-1 // 24284
M=D // 24285
@LCL // 24286
A=M+1 // 24287
D=M // 24288
@16 // 24289
D=D-A // 24290
@DO_LT // 24291
0;JMP // 24292
(Math.init.LT.85)
D=!D // 24293
@Math.init_WHILE_END1 // 24294
D;JNE // 24295

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 24296
D=M // 24297
@LCL // 24298
A=M+1 // 24299
D=D+M // 24300
@SP // 24301
AM=M+1 // 24302
A=A-1 // 24303
M=D // 24304
@LCL // 24305
A=M // 24306
D=M // 24307
@SP // 24308
AM=M-1 // 24309
A=M // 24310
M=D // 24311

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

@LCL // 24312
A=M // 24313
D=M // 24314
@LCL // 24315
A=M // 24316
M=D+M // 24317

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

@LCL // 24318
A=M+1 // 24319
M=M+1 // 24320

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 24321
0;JMP // 24322

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 24323
AM=M+1 // 24324
A=A-1 // 24325
M=0 // 24326
@RETURN // 24327
0;JMP // 24328

////FunctionInstruction{functionName='Number.frac_to_i16', numLocals=1, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.is_less_than=2, Number.do_neg=1}}
// function Number.frac_to_i16 with 1
(Number.frac_to_i16)
@SP // 24329
AM=M+1 // 24330
A=A-1 // 24331
M=0 // 24332

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24333
A=M // 24334
D=M // 24335
@3 // 24336
M=D // 24337

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 24338
A=M // 24339
D=M // 24340
@SP // 24341
AM=M+1 // 24342
A=A-1 // 24343
M=D // 24344
// call Int32.getParts
@6 // 24345
D=A // 24346
@14 // 24347
M=D // 24348
@Int32.getParts // 24349
D=A // 24350
@13 // 24351
M=D // 24352
@Number.frac_to_i16.ret.0 // 24353
D=A // 24354
@CALL // 24355
0;JMP // 24356
(Number.frac_to_i16.ret.0)
@SP // 24357
AM=M-1 // 24358
D=M // 24359
@LCL // 24360
A=M // 24361
M=D // 24362

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Number.is_negative}}, ifGoto=IfGotoInstruction{label='Number.frac_to_i16$IF_TRUE1}}
@3 // 24363
D=M // 24364
@SP // 24365
AM=M+1 // 24366
A=A-1 // 24367
M=D // 24368
// call Number.is_negative
@6 // 24369
D=A // 24370
@14 // 24371
M=D // 24372
@Number.is_negative // 24373
D=A // 24374
@13 // 24375
M=D // 24376
@Number.frac_to_i16.ret.1 // 24377
D=A // 24378
@CALL // 24379
0;JMP // 24380
(Number.frac_to_i16.ret.1)
@SP // 24381
AM=M-1 // 24382
D=M // 24383
@Number.frac_to_i16$IF_TRUE1 // 24384
D;JNE // 24385

////GotoInstruction{label='Number.frac_to_i16$IF_FALSE1}
// goto Number.frac_to_i16$IF_FALSE1
@Number.frac_to_i16$IF_FALSE1 // 24386
0;JMP // 24387

////LabelInstruction{label='Number.frac_to_i16$IF_TRUE1}
// label Number.frac_to_i16$IF_TRUE1
(Number.frac_to_i16$IF_TRUE1)

////UnaryPushGroup(CallGroup{pushes=[BinaryPushGroup(
//    left:
//CallGroup{pushes=[BinaryPushGroup(
//    left:
//        PushInstruction("constant 255"),
//    right:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 0"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                )
//        ),
//    binaryOp: "SUB"
//), PushInstruction("constant 128")], call=CallInstruction{Math.multiply}},
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("constant 256"),
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
//            binaryOp: "SUB"
//        ),
//    binaryOp: "ADD"
//), PushInstruction("constant 2")], call=CallInstruction{Math.divide}},
//NEG)
@LCL // 24388
A=M // 24389
A=M+1 // 24390
D=M // 24391
@255 // 24392
D=A-D // 24393
@SP // 24394
AM=M+1 // 24395
A=A-1 // 24396
M=D // 24397
@128 // 24398
D=A // 24399
@SP // 24400
AM=M+1 // 24401
A=A-1 // 24402
M=D // 24403
// call Math.multiply
@7 // 24404
D=A // 24405
@14 // 24406
M=D // 24407
@Math.multiply // 24408
D=A // 24409
@13 // 24410
M=D // 24411
@Number.frac_to_i16.ret.2 // 24412
D=A // 24413
@CALL // 24414
0;JMP // 24415
(Number.frac_to_i16.ret.2)
@LCL // 24416
A=M // 24417
A=M // 24418
D=M // 24419
@256 // 24420
D=A-D // 24421
@SP // 24422
AM=M-1 // 24423
D=D+M // 24424
@SP // 24425
AM=M+1 // 24426
A=A-1 // 24427
M=D // 24428
@2 // 24429
D=A // 24430
@SP // 24431
AM=M+1 // 24432
A=A-1 // 24433
M=D // 24434
// call Math.divide
@7 // 24435
D=A // 24436
@14 // 24437
M=D // 24438
@Math.divide // 24439
D=A // 24440
@13 // 24441
M=D // 24442
@Number.frac_to_i16.ret.3 // 24443
D=A // 24444
@CALL // 24445
0;JMP // 24446
(Number.frac_to_i16.ret.3)
@SP // 24447
A=M-1 // 24448
M=-D // 24449
@RETURN // 24450
0;JMP // 24451

////GotoInstruction{label='Number.frac_to_i16$IF_END1}
// goto Number.frac_to_i16$IF_END1
@Number.frac_to_i16$IF_END1 // 24452
0;JMP // 24453

////LabelInstruction{label='Number.frac_to_i16$IF_FALSE1}
// label Number.frac_to_i16$IF_FALSE1
(Number.frac_to_i16$IF_FALSE1)

////BinaryPushGroup(
//    left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 128")], call=CallInstruction{Math.multiply}},
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
//), PushInstruction("constant 2")], call=CallInstruction{Math.divide}},
//    binaryOp: "ADD"
//)
@LCL // 24454
A=M // 24455
A=M+1 // 24456
D=M // 24457
@SP // 24458
AM=M+1 // 24459
A=A-1 // 24460
M=D // 24461
@128 // 24462
D=A // 24463
@SP // 24464
AM=M+1 // 24465
A=A-1 // 24466
M=D // 24467
// call Math.multiply
@7 // 24468
D=A // 24469
@14 // 24470
M=D // 24471
@Math.multiply // 24472
D=A // 24473
@13 // 24474
M=D // 24475
@Number.frac_to_i16.ret.4 // 24476
D=A // 24477
@CALL // 24478
0;JMP // 24479
(Number.frac_to_i16.ret.4)
@LCL // 24480
A=M // 24481
A=M // 24482
D=M // 24483
@SP // 24484
AM=M+1 // 24485
A=A-1 // 24486
M=D // 24487
@2 // 24488
D=A // 24489
@SP // 24490
AM=M+1 // 24491
A=A-1 // 24492
M=D // 24493
// call Math.divide
@7 // 24494
D=A // 24495
@14 // 24496
M=D // 24497
@Math.divide // 24498
D=A // 24499
@13 // 24500
M=D // 24501
@Number.frac_to_i16.ret.5 // 24502
D=A // 24503
@CALL // 24504
0;JMP // 24505
(Number.frac_to_i16.ret.5)
@SP // 24506
AM=M-1 // 24507
D=M // 24508
@SP // 24509
AM=M-1 // 24510
D=D+M // 24511
@SP // 24512
AM=M+1 // 24513
A=A-1 // 24514
M=D // 24515
@RETURN // 24516
0;JMP // 24517

////LabelInstruction{label='Number.frac_to_i16$IF_END1}
// label Number.frac_to_i16$IF_END1
(Number.frac_to_i16$IF_END1)

////FunctionInstruction{functionName='Vec3.do_scale', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.new=1}}
// function Vec3.do_scale with 0
(Vec3.do_scale)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24518
A=M // 24519
D=M // 24520
@3 // 24521
M=D // 24522

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24523
A=M // 24524
D=M // 24525
@SP // 24526
AM=M+1 // 24527
A=A-1 // 24528
M=D // 24529
@ARG // 24530
A=M+1 // 24531
D=M // 24532
@SP // 24533
AM=M+1 // 24534
A=A-1 // 24535
M=D // 24536
// call Number.do_mul
@7 // 24537
D=A // 24538
@14 // 24539
M=D // 24540
@Number.do_mul // 24541
D=A // 24542
@13 // 24543
M=D // 24544
@Vec3.do_scale.ret.0 // 24545
D=A // 24546
@CALL // 24547
0;JMP // 24548
(Vec3.do_scale.ret.0)
@SP // 24549
M=M-1 // 24550

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24551
A=M+1 // 24552
D=M // 24553
@SP // 24554
AM=M+1 // 24555
A=A-1 // 24556
M=D // 24557
@ARG // 24558
A=M+1 // 24559
D=M // 24560
@SP // 24561
AM=M+1 // 24562
A=A-1 // 24563
M=D // 24564
// call Number.do_mul
@7 // 24565
D=A // 24566
@14 // 24567
M=D // 24568
@Number.do_mul // 24569
D=A // 24570
@13 // 24571
M=D // 24572
@Vec3.do_scale.ret.1 // 24573
D=A // 24574
@CALL // 24575
0;JMP // 24576
(Vec3.do_scale.ret.1)
@SP // 24577
M=M-1 // 24578

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24579
A=M+1 // 24580
A=A+1 // 24581
D=M // 24582
@SP // 24583
AM=M+1 // 24584
A=A-1 // 24585
M=D // 24586
@ARG // 24587
A=M+1 // 24588
D=M // 24589
@SP // 24590
AM=M+1 // 24591
A=A-1 // 24592
M=D // 24593
// call Number.do_mul
@7 // 24594
D=A // 24595
@14 // 24596
M=D // 24597
@Number.do_mul // 24598
D=A // 24599
@13 // 24600
M=D // 24601
@Vec3.do_scale.ret.2 // 24602
D=A // 24603
@CALL // 24604
0;JMP // 24605
(Vec3.do_scale.ret.2)
@SP // 24606
M=M-1 // 24607

////PushInstruction("constant 0")
@SP // 24608
AM=M+1 // 24609
A=A-1 // 24610
M=0 // 24611
@RETURN // 24612
0;JMP // 24613

////FunctionInstruction{functionName='Scene.getNumLights', numLocals=0, funcMapping={Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.getNumLights with 0
(Scene.getNumLights)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24614
A=M // 24615
D=M // 24616
@3 // 24617
M=D // 24618

////PushInstruction("this 8")
@THIS // 24619
D=M // 24620
@8 // 24621
A=D+A // 24622
D=M // 24623
@SP // 24624
AM=M+1 // 24625
A=A-1 // 24626
M=D // 24627
@RETURN // 24628
0;JMP // 24629

////FunctionInstruction{functionName='Intersection.new', numLocals=0, funcMapping={Intersection.dispose=2}}
// function Intersection.new with 0
(Intersection.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 24630
D=A // 24631
@SP // 24632
AM=M+1 // 24633
A=A-1 // 24634
M=D // 24635
// call Memory.alloc
@6 // 24636
D=A // 24637
@14 // 24638
M=D // 24639
@Memory.alloc // 24640
D=A // 24641
@13 // 24642
M=D // 24643
@Intersection.new.ret.0 // 24644
D=A // 24645
@CALL // 24646
0;JMP // 24647
(Intersection.new.ret.0)
@SP // 24648
AM=M-1 // 24649
D=M // 24650
@3 // 24651
M=D // 24652

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Intersection.0 // 24653
M=M+1 // 24654

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 24655
A=M // 24656
D=M // 24657
@THIS // 24658
A=M // 24659
M=D // 24660

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 24661
A=M+1 // 24662
D=M // 24663
@THIS // 24664
A=M+1 // 24665
M=D // 24666

////PushInstruction("pointer 0")
@3 // 24667
D=M // 24668
@SP // 24669
AM=M+1 // 24670
A=A-1 // 24671
M=D // 24672
@RETURN // 24673
0;JMP // 24674

////FunctionInstruction{functionName='Number.getV', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.is_less_than=2, Number.do_neg=1}}
// function Number.getV with 0
(Number.getV)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24675
A=M // 24676
D=M // 24677
@3 // 24678
M=D // 24679

////PushInstruction("this 0")
@THIS // 24680
A=M // 24681
D=M // 24682
@SP // 24683
AM=M+1 // 24684
A=A-1 // 24685
M=D // 24686
@RETURN // 24687
0;JMP // 24688

////FunctionInstruction{functionName='Int32.do_mul', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_mul with 0
(Int32.do_mul)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24689
A=M // 24690
D=M // 24691
@3 // 24692
M=D // 24693

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("argument 1"), PushInstruction("constant 0")], call=CallInstruction{Int32.do_mul_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 24694
D=M // 24695
@SP // 24696
AM=M+1 // 24697
A=A-1 // 24698
M=D // 24699
@2 // 24700
D=A // 24701
@SP // 24702
M=D+M // 24703
@ARG // 24704
A=M+1 // 24705
D=M // 24706
@SP // 24707
A=M-1 // 24708
M=D // 24709
A=A-1 // 24710
M=0 // 24711
// call Int32.do_mul_right_shift_bytes
@8 // 24712
D=A // 24713
@14 // 24714
M=D // 24715
@Int32.do_mul_right_shift_bytes // 24716
D=A // 24717
@13 // 24718
M=D // 24719
@Int32.do_mul.ret.0 // 24720
D=A // 24721
@CALL // 24722
0;JMP // 24723
(Int32.do_mul.ret.0)
@SP // 24724
M=M-1 // 24725

////PushInstruction("constant 0")
@SP // 24726
AM=M+1 // 24727
A=A-1 // 24728
M=0 // 24729
@RETURN // 24730
0;JMP // 24731

////FunctionInstruction{functionName='Vec3.getX', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.new=1}}
// function Vec3.getX with 0
(Vec3.getX)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24732
A=M // 24733
D=M // 24734
@3 // 24735
M=D // 24736

////PushInstruction("this 0")
@THIS // 24737
A=M // 24738
D=M // 24739
@SP // 24740
AM=M+1 // 24741
A=A-1 // 24742
M=D // 24743
@RETURN // 24744
0;JMP // 24745

////FunctionInstruction{functionName='Int32.nlz_u4', numLocals=2, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.nlz_u4 with 2
(Int32.nlz_u4)
@SP // 24746
M=M+1 // 24747
AM=M+1 // 24748
A=A-1 // 24749
M=0 // 24750
A=A-1 // 24751
M=0 // 24752

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24753
A=M // 24754
M=0 // 24755

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 1}
//}

@3 // 24756
D=A // 24757
@LCL // 24758
A=M+1 // 24759
M=D // 24760

////LabelInstruction{label='Int32.nlz_u4_WHILE_EXP1}
// label Int32.nlz_u4_WHILE_EXP1
(Int32.nlz_u4_WHILE_EXP1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.nlz_u4_WHILE_END1}}
@Int32.nlz_u4.LT.86 // 24761
D=A // 24762
@SP // 24763
AM=M+1 // 24764
A=A-1 // 24765
M=D // 24766
@LCL // 24767
A=M+1 // 24768
D=M // 24769
@DO_LT // 24770
0;JMP // 24771
(Int32.nlz_u4.LT.86)
@Int32.nlz_u4_WHILE_END1 // 24772
D;JNE // 24773

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1")], call=CallInstruction{Int32.arith_rightshift}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.nlz_u4$IF_TRUE1}}
@Int32.nlz_u4.EQ.87 // 24774
D=A // 24775
@SP // 24776
AM=M+1 // 24777
A=A-1 // 24778
M=D // 24779
@ARG // 24780
A=M // 24781
D=M // 24782
@SP // 24783
AM=M+1 // 24784
A=A-1 // 24785
M=D // 24786
@LCL // 24787
A=M+1 // 24788
D=M // 24789
@SP // 24790
AM=M+1 // 24791
A=A-1 // 24792
M=D // 24793
// call Int32.arith_rightshift
@7 // 24794
D=A // 24795
@14 // 24796
M=D // 24797
@Int32.arith_rightshift // 24798
D=A // 24799
@13 // 24800
M=D // 24801
@Int32.nlz_u4.ret.0 // 24802
D=A // 24803
@CALL // 24804
0;JMP // 24805
(Int32.nlz_u4.ret.0)
@SP // 24806
AM=M-1 // 24807
D=M // 24808
@DO_EQ // 24809
0;JMP // 24810
(Int32.nlz_u4.EQ.87)
@Int32.nlz_u4$IF_TRUE1 // 24811
D;JNE // 24812

////GotoInstruction{label='Int32.nlz_u4$IF_FALSE1}
// goto Int32.nlz_u4$IF_FALSE1
@Int32.nlz_u4$IF_FALSE1 // 24813
0;JMP // 24814

////LabelInstruction{label='Int32.nlz_u4$IF_TRUE1}
// label Int32.nlz_u4$IF_TRUE1
(Int32.nlz_u4$IF_TRUE1)

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

@LCL // 24815
A=M // 24816
M=M+1 // 24817

////GotoInstruction{label='Int32.nlz_u4$IF_END1}
// goto Int32.nlz_u4$IF_END1
@Int32.nlz_u4$IF_END1 // 24818
0;JMP // 24819

////LabelInstruction{label='Int32.nlz_u4$IF_FALSE1}
// label Int32.nlz_u4$IF_FALSE1
(Int32.nlz_u4$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 24820
A=M+1 // 24821
M=-1 // 24822

////LabelInstruction{label='Int32.nlz_u4$IF_END1}
// label Int32.nlz_u4$IF_END1
(Int32.nlz_u4$IF_END1)

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

@LCL // 24823
A=M+1 // 24824
M=M-1 // 24825

////GotoInstruction{label='Int32.nlz_u4_WHILE_EXP1}
// goto Int32.nlz_u4_WHILE_EXP1
@Int32.nlz_u4_WHILE_EXP1 // 24826
0;JMP // 24827

////LabelInstruction{label='Int32.nlz_u4_WHILE_END1}
// label Int32.nlz_u4_WHILE_END1
(Int32.nlz_u4_WHILE_END1)

////PushInstruction("local 0")
@LCL // 24828
A=M // 24829
D=M // 24830
@SP // 24831
AM=M+1 // 24832
A=A-1 // 24833
M=D // 24834
@RETURN // 24835
0;JMP // 24836

////FunctionInstruction{functionName='Vec3.getY', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1}}
// function Vec3.getY with 0
(Vec3.getY)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24837
A=M // 24838
D=M // 24839
@3 // 24840
M=D // 24841

////PushInstruction("this 1")
@THIS // 24842
A=M+1 // 24843
D=M // 24844
@SP // 24845
AM=M+1 // 24846
A=A-1 // 24847
M=D // 24848
@RETURN // 24849
0;JMP // 24850

////FunctionInstruction{functionName='Scene.dispose', numLocals=3, funcMapping={Scene.getNumLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.dispose with 3
(Scene.dispose)
@3 // 24851
D=A // 24852
@SP // 24853
AM=D+M // 24854
A=A-1 // 24855
M=0 // 24856
A=A-1 // 24857
M=0 // 24858
A=A-1 // 24859
M=0 // 24860

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24861
A=M // 24862
D=M // 24863
@3 // 24864
M=D // 24865

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24866
A=M // 24867
M=0 // 24868

////LabelInstruction{label='Scene.dispose_WHILE_EXP1}
// label Scene.dispose_WHILE_EXP1
(Scene.dispose_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("this 6"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.dispose_WHILE_END1}}
@Scene.dispose.LT.88 // 24869
D=A // 24870
@SP // 24871
AM=M+1 // 24872
A=A-1 // 24873
M=D // 24874
@LCL // 24875
A=M // 24876
D=M // 24877
@SP // 24878
AM=M+1 // 24879
A=A-1 // 24880
M=D // 24881
@THIS // 24882
D=M // 24883
@6 // 24884
A=D+A // 24885
D=M // 24886
@SP // 24887
AM=M-1 // 24888
D=M-D // 24889
@DO_LT // 24890
0;JMP // 24891
(Scene.dispose.LT.88)
D=!D // 24892
@Scene.dispose_WHILE_END1 // 24893
D;JNE // 24894

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 5"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 24895
D=M // 24896
@5 // 24897
A=D+A // 24898
D=M // 24899
@SP // 24900
AM=M+1 // 24901
A=A-1 // 24902
M=D // 24903
@LCL // 24904
A=M // 24905
D=M // 24906
@SP // 24907
AM=M-1 // 24908
A=D+M // 24909
D=M // 24910
@LCL // 24911
A=M+1 // 24912
M=D // 24913

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Element.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 24914
A=M+1 // 24915
D=M // 24916
@SP // 24917
AM=M+1 // 24918
A=A-1 // 24919
M=D // 24920
// call Element.dispose
@6 // 24921
D=A // 24922
@14 // 24923
M=D // 24924
@Element.dispose // 24925
D=A // 24926
@13 // 24927
M=D // 24928
@Scene.dispose.ret.0 // 24929
D=A // 24930
@CALL // 24931
0;JMP // 24932
(Scene.dispose.ret.0)
@SP // 24933
M=M-1 // 24934

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

@LCL // 24935
A=M // 24936
M=M+1 // 24937

////GotoInstruction{label='Scene.dispose_WHILE_EXP1}
// goto Scene.dispose_WHILE_EXP1
@Scene.dispose_WHILE_EXP1 // 24938
0;JMP // 24939

////LabelInstruction{label='Scene.dispose_WHILE_END1}
// label Scene.dispose_WHILE_END1
(Scene.dispose_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24940
D=M // 24941
@5 // 24942
A=D+A // 24943
D=M // 24944
@SP // 24945
AM=M+1 // 24946
A=A-1 // 24947
M=D // 24948
// call Memory.deAlloc
@6 // 24949
D=A // 24950
@14 // 24951
M=D // 24952
@Memory.deAlloc // 24953
D=A // 24954
@13 // 24955
M=D // 24956
@Scene.dispose.ret.1 // 24957
D=A // 24958
@CALL // 24959
0;JMP // 24960
(Scene.dispose.ret.1)
@SP // 24961
M=M-1 // 24962

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24963
A=M // 24964
M=0 // 24965

////LabelInstruction{label='Scene.dispose_WHILE_EXP2}
// label Scene.dispose_WHILE_EXP2
(Scene.dispose_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("this 8"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.dispose_WHILE_END2}}
@Scene.dispose.LT.89 // 24966
D=A // 24967
@SP // 24968
AM=M+1 // 24969
A=A-1 // 24970
M=D // 24971
@LCL // 24972
A=M // 24973
D=M // 24974
@SP // 24975
AM=M+1 // 24976
A=A-1 // 24977
M=D // 24978
@THIS // 24979
D=M // 24980
@8 // 24981
A=D+A // 24982
D=M // 24983
@SP // 24984
AM=M-1 // 24985
D=M-D // 24986
@DO_LT // 24987
0;JMP // 24988
(Scene.dispose.LT.89)
D=!D // 24989
@Scene.dispose_WHILE_END2 // 24990
D;JNE // 24991

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("this 7"),
//            right:
//                PushInstruction("local 0"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 24992
D=M // 24993
@7 // 24994
A=D+A // 24995
D=M // 24996
@SP // 24997
AM=M+1 // 24998
A=A-1 // 24999
M=D // 25000
@LCL // 25001
A=M // 25002
D=M // 25003
@SP // 25004
AM=M-1 // 25005
A=D+M // 25006
D=M // 25007
@LCL // 25008
A=M+1 // 25009
A=A+1 // 25010
M=D // 25011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{DirectionalLight.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25012
A=M+1 // 25013
A=A+1 // 25014
D=M // 25015
@SP // 25016
AM=M+1 // 25017
A=A-1 // 25018
M=D // 25019
// call DirectionalLight.dispose
@6 // 25020
D=A // 25021
@14 // 25022
M=D // 25023
@DirectionalLight.dispose // 25024
D=A // 25025
@13 // 25026
M=D // 25027
@Scene.dispose.ret.2 // 25028
D=A // 25029
@CALL // 25030
0;JMP // 25031
(Scene.dispose.ret.2)
@SP // 25032
M=M-1 // 25033

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

@LCL // 25034
A=M // 25035
M=M+1 // 25036

////GotoInstruction{label='Scene.dispose_WHILE_EXP2}
// goto Scene.dispose_WHILE_EXP2
@Scene.dispose_WHILE_EXP2 // 25037
0;JMP // 25038

////LabelInstruction{label='Scene.dispose_WHILE_END2}
// label Scene.dispose_WHILE_END2
(Scene.dispose_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25039
D=M // 25040
@7 // 25041
A=D+A // 25042
D=M // 25043
@SP // 25044
AM=M+1 // 25045
A=A-1 // 25046
M=D // 25047
// call Memory.deAlloc
@6 // 25048
D=A // 25049
@14 // 25050
M=D // 25051
@Memory.deAlloc // 25052
D=A // 25053
@13 // 25054
M=D // 25055
@Scene.dispose.ret.3 // 25056
D=A // 25057
@CALL // 25058
0;JMP // 25059
(Scene.dispose.ret.3)
@SP // 25060
M=M-1 // 25061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25062
A=M+1 // 25063
A=A+1 // 25064
D=M // 25065
@SP // 25066
AM=M+1 // 25067
A=A-1 // 25068
M=D // 25069
// call Number.dispose
@6 // 25070
D=A // 25071
@14 // 25072
M=D // 25073
@Number.dispose // 25074
D=A // 25075
@13 // 25076
M=D // 25077
@Scene.dispose.ret.4 // 25078
D=A // 25079
@CALL // 25080
0;JMP // 25081
(Scene.dispose.ret.4)
@SP // 25082
M=M-1 // 25083

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25084
A=M+1 // 25085
A=A+1 // 25086
A=A+1 // 25087
D=M // 25088
@SP // 25089
AM=M+1 // 25090
A=A-1 // 25091
M=D // 25092
// call Number.dispose
@6 // 25093
D=A // 25094
@14 // 25095
M=D // 25096
@Number.dispose // 25097
D=A // 25098
@13 // 25099
M=D // 25100
@Scene.dispose.ret.5 // 25101
D=A // 25102
@CALL // 25103
0;JMP // 25104
(Scene.dispose.ret.5)
@SP // 25105
M=M-1 // 25106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25107
D=M // 25108
@4 // 25109
A=D+A // 25110
D=M // 25111
@SP // 25112
AM=M+1 // 25113
A=A-1 // 25114
M=D // 25115
// call Number.dispose
@6 // 25116
D=A // 25117
@14 // 25118
M=D // 25119
@Number.dispose // 25120
D=A // 25121
@13 // 25122
M=D // 25123
@Scene.dispose.ret.6 // 25124
D=A // 25125
@CALL // 25126
0;JMP // 25127
(Scene.dispose.ret.6)
@SP // 25128
M=M-1 // 25129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 25130
D=M // 25131
@SP // 25132
AM=M+1 // 25133
A=A-1 // 25134
M=D // 25135
// call Memory.deAlloc
@6 // 25136
D=A // 25137
@14 // 25138
M=D // 25139
@Memory.deAlloc // 25140
D=A // 25141
@13 // 25142
M=D // 25143
@Scene.dispose.ret.7 // 25144
D=A // 25145
@CALL // 25146
0;JMP // 25147
(Scene.dispose.ret.7)
@SP // 25148
M=M-1 // 25149

////PushInstruction("constant 0")
@SP // 25150
AM=M+1 // 25151
A=A-1 // 25152
M=0 // 25153
@RETURN // 25154
0;JMP // 25155

////FunctionInstruction{functionName='Vec3.getZ', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0}}
// function Vec3.getZ with 0
(Vec3.getZ)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25156
A=M // 25157
D=M // 25158
@3 // 25159
M=D // 25160

////PushInstruction("this 2")
@THIS // 25161
A=M+1 // 25162
A=A+1 // 25163
D=M // 25164
@SP // 25165
AM=M+1 // 25166
A=A-1 // 25167
M=D // 25168
@RETURN // 25169
0;JMP // 25170

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 25171
AM=M+1 // 25172
A=A-1 // 25173
M=0 // 25174

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 25175
D=A // 25176
@SP // 25177
AM=M+1 // 25178
A=A-1 // 25179
M=D // 25180
// call String.new
@6 // 25181
D=A // 25182
@14 // 25183
M=D // 25184
@String.new // 25185
D=A // 25186
@13 // 25187
M=D // 25188
@Output.printInt.ret.0 // 25189
D=A // 25190
@CALL // 25191
0;JMP // 25192
(Output.printInt.ret.0)
@SP // 25193
AM=M-1 // 25194
D=M // 25195
@LCL // 25196
A=M // 25197
M=D // 25198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25199
A=M // 25200
D=M // 25201
@SP // 25202
AM=M+1 // 25203
A=A-1 // 25204
M=D // 25205
@ARG // 25206
A=M // 25207
D=M // 25208
@SP // 25209
AM=M+1 // 25210
A=A-1 // 25211
M=D // 25212
// call String.setInt
@7 // 25213
D=A // 25214
@14 // 25215
M=D // 25216
@String.setInt // 25217
D=A // 25218
@13 // 25219
M=D // 25220
@Output.printInt.ret.1 // 25221
D=A // 25222
@CALL // 25223
0;JMP // 25224
(Output.printInt.ret.1)
@SP // 25225
M=M-1 // 25226

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25227
A=M // 25228
D=M // 25229
@SP // 25230
AM=M+1 // 25231
A=A-1 // 25232
M=D // 25233
// call Output.printString
@6 // 25234
D=A // 25235
@14 // 25236
M=D // 25237
@Output.printString // 25238
D=A // 25239
@13 // 25240
M=D // 25241
@Output.printInt.ret.2 // 25242
D=A // 25243
@CALL // 25244
0;JMP // 25245
(Output.printInt.ret.2)
@SP // 25246
M=M-1 // 25247

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25248
A=M // 25249
D=M // 25250
@SP // 25251
AM=M+1 // 25252
A=A-1 // 25253
M=D // 25254
// call String.dispose
@6 // 25255
D=A // 25256
@14 // 25257
M=D // 25258
@String.dispose // 25259
D=A // 25260
@13 // 25261
M=D // 25262
@Output.printInt.ret.3 // 25263
D=A // 25264
@CALL // 25265
0;JMP // 25266
(Output.printInt.ret.3)
@SP // 25267
M=M-1 // 25268

////PushInstruction("constant 0")
@SP // 25269
AM=M+1 // 25270
A=A-1 // 25271
M=0 // 25272
@RETURN // 25273
0;JMP // 25274

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.copy=0, Memory.add_node=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 25275
D=A // 25276
@SP // 25277
AM=D+M // 25278
A=A-1 // 25279
M=0 // 25280
A=A-1 // 25281
M=0 // 25282
A=A-1 // 25283
M=0 // 25284
A=A-1 // 25285
M=0 // 25286
A=A-1 // 25287
M=0 // 25288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 25289
A=M // 25290
D=M // 25291
@SP // 25292
AM=M+1 // 25293
A=A-1 // 25294
M=D // 25295
// call Memory.getBinIndex
@6 // 25296
D=A // 25297
@14 // 25298
M=D // 25299
@Memory.getBinIndex // 25300
D=A // 25301
@13 // 25302
M=D // 25303
@Memory.alloc.ret.0 // 25304
D=A // 25305
@CALL // 25306
0;JMP // 25307
(Memory.alloc.ret.0)
@SP // 25308
AM=M-1 // 25309
D=M // 25310
@LCL // 25311
A=M // 25312
M=D // 25313

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

@LCL // 25314
A=M // 25315
D=M // 25316
@2048 // 25317
D=D+A // 25318
@LCL // 25319
A=M+1 // 25320
M=D // 25321

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 25322
A=M+1 // 25323
D=M // 25324
@SP // 25325
AM=M+1 // 25326
A=A-1 // 25327
M=D // 25328
@ARG // 25329
A=M // 25330
D=M // 25331
@SP // 25332
AM=M+1 // 25333
A=A-1 // 25334
M=D // 25335
// call Memory.get_best_fit
@7 // 25336
D=A // 25337
@14 // 25338
M=D // 25339
@Memory.get_best_fit // 25340
D=A // 25341
@13 // 25342
M=D // 25343
@Memory.alloc.ret.1 // 25344
D=A // 25345
@CALL // 25346
0;JMP // 25347
(Memory.alloc.ret.1)
@SP // 25348
AM=M-1 // 25349
D=M // 25350
@LCL // 25351
A=M+1 // 25352
A=A+1 // 25353
M=D // 25354

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
@Memory.alloc.EQ.90 // 25355
D=A // 25356
@SP // 25357
AM=M+1 // 25358
A=A-1 // 25359
M=D // 25360
@LCL // 25361
A=M+1 // 25362
A=A+1 // 25363
D=M // 25364
@DO_EQ // 25365
0;JMP // 25366
(Memory.alloc.EQ.90)
D=!D // 25367
@Memory.alloc_WHILE_END1 // 25368
D;JNE // 25369

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
@Memory.alloc.LT.91 // 25370
D=A // 25371
@SP // 25372
AM=M+1 // 25373
A=A-1 // 25374
M=D // 25375
@LCL // 25376
A=M // 25377
D=M // 25378
D=D+1 // 25379
@7 // 25380
D=D-A // 25381
@DO_LT // 25382
0;JMP // 25383
(Memory.alloc.LT.91)
D=!D // 25384
@Memory.alloc$IF_TRUE1 // 25385
D;JNE // 25386

////GotoInstruction{label='Memory.alloc$IF_END1}
// goto Memory.alloc$IF_END1
@Memory.alloc$IF_END1 // 25387
0;JMP // 25388

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{Sys.error}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 25389
D=A // 25390
@SP // 25391
AM=M+1 // 25392
A=A-1 // 25393
M=D // 25394
// call Sys.error
@6 // 25395
D=A // 25396
@14 // 25397
M=D // 25398
@Sys.error // 25399
D=A // 25400
@13 // 25401
M=D // 25402
@Memory.alloc.ret.2 // 25403
D=A // 25404
@CALL // 25405
0;JMP // 25406
(Memory.alloc.ret.2)
@SP // 25407
M=M-1 // 25408

////PushInstruction("constant 0")
@SP // 25409
AM=M+1 // 25410
A=A-1 // 25411
M=0 // 25412
@RETURN // 25413
0;JMP // 25414

////LabelInstruction{label='Memory.alloc$IF_END1}
// label Memory.alloc$IF_END1
(Memory.alloc$IF_END1)

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

@LCL // 25415
A=M // 25416
M=M+1 // 25417

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

@LCL // 25418
A=M // 25419
D=M // 25420
@2048 // 25421
D=D+A // 25422
@LCL // 25423
A=M+1 // 25424
M=D // 25425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 25426
A=M+1 // 25427
D=M // 25428
@SP // 25429
AM=M+1 // 25430
A=A-1 // 25431
M=D // 25432
@ARG // 25433
A=M // 25434
D=M // 25435
@SP // 25436
AM=M+1 // 25437
A=A-1 // 25438
M=D // 25439
// call Memory.get_best_fit
@7 // 25440
D=A // 25441
@14 // 25442
M=D // 25443
@Memory.get_best_fit // 25444
D=A // 25445
@13 // 25446
M=D // 25447
@Memory.alloc.ret.3 // 25448
D=A // 25449
@CALL // 25450
0;JMP // 25451
(Memory.alloc.ret.3)
@SP // 25452
AM=M-1 // 25453
D=M // 25454
@LCL // 25455
A=M+1 // 25456
A=A+1 // 25457
M=D // 25458

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 25459
0;JMP // 25460

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

@LCL // 25461
A=M+1 // 25462
A=A+1 // 25463
A=M // 25464
D=M // 25465
@SP // 25466
AM=M+1 // 25467
A=A-1 // 25468
M=D // 25469
// call Memory.getBinIndex
@6 // 25470
D=A // 25471
@14 // 25472
M=D // 25473
@Memory.getBinIndex // 25474
D=A // 25475
@13 // 25476
M=D // 25477
@Memory.alloc.ret.4 // 25478
D=A // 25479
@CALL // 25480
0;JMP // 25481
(Memory.alloc.ret.4)
@SP // 25482
AM=M-1 // 25483
D=M // 25484
@2048 // 25485
D=D+A // 25486
@SP // 25487
AM=M+1 // 25488
A=A-1 // 25489
M=D // 25490
@LCL // 25491
A=M+1 // 25492
A=A+1 // 25493
D=M // 25494
@SP // 25495
AM=M+1 // 25496
A=A-1 // 25497
M=D // 25498
// call Memory.remove_node
@7 // 25499
D=A // 25500
@14 // 25501
M=D // 25502
@Memory.remove_node // 25503
D=A // 25504
@13 // 25505
M=D // 25506
@Memory.alloc.ret.5 // 25507
D=A // 25508
@CALL // 25509
0;JMP // 25510
(Memory.alloc.ret.5)
@SP // 25511
M=M-1 // 25512

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

@LCL // 25513
A=M+1 // 25514
A=A+1 // 25515
A=M // 25516
D=M // 25517
@SP // 25518
AM=M+1 // 25519
A=A-1 // 25520
M=D // 25521
@ARG // 25522
A=M // 25523
D=M // 25524
@SP // 25525
AM=M-1 // 25526
D=M-D // 25527
@LCL // 25528
A=M+1 // 25529
A=A+1 // 25530
A=A+1 // 25531
M=D // 25532

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.92 // 25533
D=A // 25534
@SP // 25535
AM=M+1 // 25536
A=A-1 // 25537
M=D // 25538
@LCL // 25539
A=M+1 // 25540
A=A+1 // 25541
A=A+1 // 25542
D=M // 25543
@5 // 25544
D=D-A // 25545
@DO_GT // 25546
0;JMP // 25547
(Memory.alloc.GT.92)
@Memory.alloc$IF_TRUE2 // 25548
D;JNE // 25549

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 25550
0;JMP // 25551

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
@LCL // 25552
A=M+1 // 25553
A=A+1 // 25554
D=M // 25555
@SP // 25556
AM=M+1 // 25557
A=A-1 // 25558
M=D // 25559
@ARG // 25560
A=M // 25561
D=M // 25562
@SP // 25563
AM=M-1 // 25564
A=M // 25565
M=D // 25566

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 25567
A=M+1 // 25568
A=A+1 // 25569
D=M // 25570
@SP // 25571
AM=M+1 // 25572
A=A-1 // 25573
M=D+1 // 25574
D=0 // 25575
@SP // 25576
AM=M-1 // 25577
A=M // 25578
M=D // 25579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25580
A=M+1 // 25581
A=A+1 // 25582
D=M // 25583
@SP // 25584
AM=M+1 // 25585
A=A-1 // 25586
M=D // 25587
// call Memory.create_foot
@6 // 25588
D=A // 25589
@14 // 25590
M=D // 25591
@Memory.create_foot // 25592
D=A // 25593
@13 // 25594
M=D // 25595
@Memory.alloc.ret.6 // 25596
D=A // 25597
@CALL // 25598
0;JMP // 25599
(Memory.alloc.ret.6)
@SP // 25600
M=M-1 // 25601

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

@LCL // 25602
A=M+1 // 25603
A=A+1 // 25604
D=M // 25605
@ARG // 25606
A=M // 25607
D=D+M // 25608
@5 // 25609
D=D+A // 25610
@SP // 25611
AM=M+1 // 25612
A=A-1 // 25613
M=D // 25614
@LCL // 25615
D=M // 25616
@4 // 25617
A=D+A // 25618
D=A // 25619
@R13 // 25620
M=D // 25621
@SP // 25622
AM=M-1 // 25623
D=M // 25624
@R13 // 25625
A=M // 25626
M=D // 25627

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
@LCL // 25628
D=M // 25629
@4 // 25630
A=D+A // 25631
D=M // 25632
@SP // 25633
AM=M+1 // 25634
A=A-1 // 25635
M=D // 25636
@LCL // 25637
A=M+1 // 25638
A=A+1 // 25639
A=A+1 // 25640
D=M // 25641
@5 // 25642
D=D-A // 25643
@SP // 25644
AM=M-1 // 25645
A=M // 25646
M=D // 25647

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 25648
D=M // 25649
@4 // 25650
A=D+A // 25651
D=M // 25652
@SP // 25653
AM=M+1 // 25654
A=A-1 // 25655
M=D+1 // 25656
D=1 // 25657
@SP // 25658
AM=M-1 // 25659
A=M // 25660
M=D // 25661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25662
D=M // 25663
@4 // 25664
A=D+A // 25665
D=M // 25666
@SP // 25667
AM=M+1 // 25668
A=A-1 // 25669
M=D // 25670
// call Memory.create_foot
@6 // 25671
D=A // 25672
@14 // 25673
M=D // 25674
@Memory.create_foot // 25675
D=A // 25676
@13 // 25677
M=D // 25678
@Memory.alloc.ret.7 // 25679
D=A // 25680
@CALL // 25681
0;JMP // 25682
(Memory.alloc.ret.7)
@SP // 25683
M=M-1 // 25684

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

@LCL // 25685
A=M+1 // 25686
A=A+1 // 25687
A=A+1 // 25688
D=M // 25689
@SP // 25690
AM=M+1 // 25691
A=A-1 // 25692
M=D // 25693
// call Memory.getBinIndex
@6 // 25694
D=A // 25695
@14 // 25696
M=D // 25697
@Memory.getBinIndex // 25698
D=A // 25699
@13 // 25700
M=D // 25701
@Memory.alloc.ret.8 // 25702
D=A // 25703
@CALL // 25704
0;JMP // 25705
(Memory.alloc.ret.8)
@SP // 25706
AM=M-1 // 25707
D=M // 25708
@2048 // 25709
D=D+A // 25710
@SP // 25711
AM=M+1 // 25712
A=A-1 // 25713
M=D // 25714
@LCL // 25715
D=M // 25716
@4 // 25717
A=D+A // 25718
D=M // 25719
@SP // 25720
AM=M+1 // 25721
A=A-1 // 25722
M=D // 25723
// call Memory.add_node
@7 // 25724
D=A // 25725
@14 // 25726
M=D // 25727
@Memory.add_node // 25728
D=A // 25729
@13 // 25730
M=D // 25731
@Memory.alloc.ret.9 // 25732
D=A // 25733
@CALL // 25734
0;JMP // 25735
(Memory.alloc.ret.9)
@SP // 25736
M=M-1 // 25737

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 25738
0;JMP // 25739

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
@LCL // 25740
A=M+1 // 25741
A=A+1 // 25742
D=M // 25743
@SP // 25744
AM=M+1 // 25745
A=A-1 // 25746
M=D+1 // 25747
D=0 // 25748
@SP // 25749
AM=M-1 // 25750
A=M // 25751
M=D // 25752

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25753
A=M+1 // 25754
A=A+1 // 25755
D=M // 25756
@SP // 25757
AM=M+1 // 25758
A=A-1 // 25759
M=D // 25760
// call Memory.create_foot
@6 // 25761
D=A // 25762
@14 // 25763
M=D // 25764
@Memory.create_foot // 25765
D=A // 25766
@13 // 25767
M=D // 25768
@Memory.alloc.ret.10 // 25769
D=A // 25770
@CALL // 25771
0;JMP // 25772
(Memory.alloc.ret.10)
@SP // 25773
M=M-1 // 25774

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
@LCL // 25775
A=M+1 // 25776
A=A+1 // 25777
D=M // 25778
@4 // 25779
D=D+A // 25780
@SP // 25781
AM=M+1 // 25782
A=A-1 // 25783
M=D // 25784
@RETURN // 25785
0;JMP // 25786

////FunctionInstruction{functionName='Number.new_from_int32', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.new_from_int32 with 0
(Number.new_from_int32)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 25787
AM=M+1 // 25788
A=A-1 // 25789
M=1 // 25790
// call Memory.alloc
@6 // 25791
D=A // 25792
@14 // 25793
M=D // 25794
@Memory.alloc // 25795
D=A // 25796
@13 // 25797
M=D // 25798
@Number.new_from_int32.ret.0 // 25799
D=A // 25800
@CALL // 25801
0;JMP // 25802
(Number.new_from_int32.ret.0)
@SP // 25803
AM=M-1 // 25804
D=M // 25805
@3 // 25806
M=D // 25807

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 5"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 5}
//}

@Number.5 // 25808
M=M+1 // 25809

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 25810
A=M // 25811
D=M // 25812
@THIS // 25813
A=M // 25814
M=D // 25815

////PushInstruction("pointer 0")
@3 // 25816
D=M // 25817
@SP // 25818
AM=M+1 // 25819
A=A-1 // 25820
M=D // 25821
@RETURN // 25822
0;JMP // 25823

////FunctionInstruction{functionName='DirectionalLight.dispose', numLocals=0, funcMapping={DirectionalLight.getColor=0}}
// function DirectionalLight.dispose with 0
(DirectionalLight.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25824
A=M // 25825
D=M // 25826
@3 // 25827
M=D // 25828

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25829
A=M // 25830
D=M // 25831
@SP // 25832
AM=M+1 // 25833
A=A-1 // 25834
M=D // 25835
// call Vec3.dispose
@6 // 25836
D=A // 25837
@14 // 25838
M=D // 25839
@Vec3.dispose // 25840
D=A // 25841
@13 // 25842
M=D // 25843
@DirectionalLight.dispose.ret.0 // 25844
D=A // 25845
@CALL // 25846
0;JMP // 25847
(DirectionalLight.dispose.ret.0)
@SP // 25848
M=M-1 // 25849

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25850
A=M+1 // 25851
D=M // 25852
@SP // 25853
AM=M+1 // 25854
A=A-1 // 25855
M=D // 25856
// call Number.dispose
@6 // 25857
D=A // 25858
@14 // 25859
M=D // 25860
@Number.dispose // 25861
D=A // 25862
@13 // 25863
M=D // 25864
@DirectionalLight.dispose.ret.1 // 25865
D=A // 25866
@CALL // 25867
0;JMP // 25868
(DirectionalLight.dispose.ret.1)
@SP // 25869
M=M-1 // 25870

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 25871
D=M // 25872
@SP // 25873
AM=M+1 // 25874
A=A-1 // 25875
M=D // 25876
// call Memory.deAlloc
@6 // 25877
D=A // 25878
@14 // 25879
M=D // 25880
@Memory.deAlloc // 25881
D=A // 25882
@13 // 25883
M=D // 25884
@DirectionalLight.dispose.ret.2 // 25885
D=A // 25886
@CALL // 25887
0;JMP // 25888
(DirectionalLight.dispose.ret.2)
@SP // 25889
M=M-1 // 25890

////PushInstruction("constant 0")
@SP // 25891
AM=M+1 // 25892
A=A-1 // 25893
M=0 // 25894
@RETURN // 25895
0;JMP // 25896

////FunctionInstruction{functionName='Number.do_sqrt', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.do_sqrt with 0
(Number.do_sqrt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25897
A=M // 25898
D=M // 25899
@3 // 25900
M=D // 25901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25902
A=M // 25903
D=M // 25904
@SP // 25905
AM=M+1 // 25906
A=A-1 // 25907
M=D // 25908
@Number.1 // 25909
D=M // 25910
@SP // 25911
AM=M+1 // 25912
A=A-1 // 25913
M=D // 25914
// call Int32.do_mul
@7 // 25915
D=A // 25916
@14 // 25917
M=D // 25918
@Int32.do_mul // 25919
D=A // 25920
@13 // 25921
M=D // 25922
@Number.do_sqrt.ret.0 // 25923
D=A // 25924
@CALL // 25925
0;JMP // 25926
(Number.do_sqrt.ret.0)
@SP // 25927
M=M-1 // 25928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25929
A=M // 25930
D=M // 25931
@SP // 25932
AM=M+1 // 25933
A=A-1 // 25934
M=D // 25935
// call Int32.do_sqrt
@6 // 25936
D=A // 25937
@14 // 25938
M=D // 25939
@Int32.do_sqrt // 25940
D=A // 25941
@13 // 25942
M=D // 25943
@Number.do_sqrt.ret.1 // 25944
D=A // 25945
@CALL // 25946
0;JMP // 25947
(Number.do_sqrt.ret.1)
@SP // 25948
M=M-1 // 25949

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 2")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25950
A=M // 25951
D=M // 25952
@SP // 25953
AM=M+1 // 25954
A=A-1 // 25955
M=D // 25956
@Number.2 // 25957
D=M // 25958
@SP // 25959
AM=M+1 // 25960
A=A-1 // 25961
M=D // 25962
// call Int32.do_mul
@7 // 25963
D=A // 25964
@14 // 25965
M=D // 25966
@Int32.do_mul // 25967
D=A // 25968
@13 // 25969
M=D // 25970
@Number.do_sqrt.ret.2 // 25971
D=A // 25972
@CALL // 25973
0;JMP // 25974
(Number.do_sqrt.ret.2)
@SP // 25975
M=M-1 // 25976

////PushInstruction("constant 0")
@SP // 25977
AM=M+1 // 25978
A=A-1 // 25979
M=0 // 25980
@RETURN // 25981
0;JMP // 25982

////FunctionInstruction{functionName='Int32.getParts', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.getParts with 0
(Int32.getParts)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25983
A=M // 25984
D=M // 25985
@3 // 25986
M=D // 25987

////PushInstruction("this 0")
@THIS // 25988
A=M // 25989
D=M // 25990
@SP // 25991
AM=M+1 // 25992
A=A-1 // 25993
M=D // 25994
@RETURN // 25995
0;JMP // 25996

////FunctionInstruction{functionName='Sphere.color', numLocals=0, funcMapping={Sphere.new=1, Sphere.dispose=4}}
// function Sphere.color with 0
(Sphere.color)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25997
A=M // 25998
D=M // 25999
@3 // 26000
M=D // 26001

////CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
@THIS // 26002
A=M+1 // 26003
A=A+1 // 26004
D=M // 26005
@SP // 26006
AM=M+1 // 26007
A=A-1 // 26008
M=D // 26009
// call Number.clone
@6 // 26010
D=A // 26011
@14 // 26012
M=D // 26013
@Number.clone // 26014
D=A // 26015
@13 // 26016
M=D // 26017
@Sphere.color.ret.0 // 26018
D=A // 26019
@CALL // 26020
0;JMP // 26021
(Sphere.color.ret.0)
@RETURN // 26022
0;JMP // 26023

////FunctionInstruction{functionName='Number.do_sub', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.do_sub with 0
(Number.do_sub)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26024
A=M // 26025
D=M // 26026
@3 // 26027
M=D // 26028

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 26029
A=M // 26030
D=M // 26031
@SP // 26032
AM=M+1 // 26033
A=A-1 // 26034
M=D // 26035
@ARG // 26036
A=M+1 // 26037
D=M // 26038
@SP // 26039
AM=M+1 // 26040
A=A-1 // 26041
M=D // 26042
// call Number.getV
@6 // 26043
D=A // 26044
@14 // 26045
M=D // 26046
@Number.getV // 26047
D=A // 26048
@13 // 26049
M=D // 26050
@Number.do_sub.ret.0 // 26051
D=A // 26052
@CALL // 26053
0;JMP // 26054
(Number.do_sub.ret.0)
// call Int32.do_sub
@7 // 26055
D=A // 26056
@14 // 26057
M=D // 26058
@Int32.do_sub // 26059
D=A // 26060
@13 // 26061
M=D // 26062
@Number.do_sub.ret.1 // 26063
D=A // 26064
@CALL // 26065
0;JMP // 26066
(Number.do_sub.ret.1)
@SP // 26067
M=M-1 // 26068

////PushInstruction("constant 0")
@SP // 26069
AM=M+1 // 26070
A=A-1 // 26071
M=0 // 26072
@RETURN // 26073
0;JMP // 26074

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 26075
D=A // 26076
@SP // 26077
AM=M+1 // 26078
A=A-1 // 26079
M=D // 26080
// call Memory.alloc
@6 // 26081
D=A // 26082
@14 // 26083
M=D // 26084
@Memory.alloc // 26085
D=A // 26086
@13 // 26087
M=D // 26088
@String.new.ret.0 // 26089
D=A // 26090
@CALL // 26091
0;JMP // 26092
(String.new.ret.0)
@SP // 26093
AM=M-1 // 26094
D=M // 26095
@3 // 26096
M=D // 26097

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.93 // 26098
D=A // 26099
@SP // 26100
AM=M+1 // 26101
A=A-1 // 26102
M=D // 26103
@ARG // 26104
A=M // 26105
D=M // 26106
@DO_EQ // 26107
0;JMP // 26108
(String.new.EQ.93)
@String.new$IF_TRUE1 // 26109
D;JNE // 26110

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 26111
0;JMP // 26112

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 26113
A=M // 26114
M=0 // 26115

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 26116
0;JMP // 26117

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 26118
A=M // 26119
D=M // 26120
@SP // 26121
AM=M+1 // 26122
A=A-1 // 26123
M=D // 26124
// call Memory.alloc
@6 // 26125
D=A // 26126
@14 // 26127
M=D // 26128
@Memory.alloc // 26129
D=A // 26130
@13 // 26131
M=D // 26132
@String.new.ret.1 // 26133
D=A // 26134
@CALL // 26135
0;JMP // 26136
(String.new.ret.1)
@SP // 26137
AM=M-1 // 26138
D=M // 26139
@THIS // 26140
A=M // 26141
M=D // 26142

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 26143
A=M // 26144
D=M // 26145
@THIS // 26146
A=M+1 // 26147
A=A+1 // 26148
M=D // 26149

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 26150
A=M+1 // 26151
M=0 // 26152

////PushInstruction("pointer 0")
@3 // 26153
D=M // 26154
@SP // 26155
AM=M+1 // 26156
A=A-1 // 26157
M=D // 26158
@RETURN // 26159
0;JMP // 26160

////FunctionInstruction{functionName='Number.to_int32', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1, Number.do_sub=2}}
// function Number.to_int32 with 0
(Number.to_int32)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26161
A=M // 26162
D=M // 26163
@3 // 26164
M=D // 26165

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 5"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 5}
//}

@Number.5 // 26166
M=M-1 // 26167

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2")], call=CallInstruction{Int32.do_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 26168
A=M // 26169
D=M // 26170
@SP // 26171
AM=M+1 // 26172
A=A-1 // 26173
M=D // 26174
@2 // 26175
D=A // 26176
@SP // 26177
AM=M+1 // 26178
A=A-1 // 26179
M=D // 26180
// call Int32.do_right_shift_bytes
@7 // 26181
D=A // 26182
@14 // 26183
M=D // 26184
@Int32.do_right_shift_bytes // 26185
D=A // 26186
@13 // 26187
M=D // 26188
@Number.to_int32.ret.0 // 26189
D=A // 26190
@CALL // 26191
0;JMP // 26192
(Number.to_int32.ret.0)
@SP // 26193
M=M-1 // 26194

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 26195
D=M // 26196
@SP // 26197
AM=M+1 // 26198
A=A-1 // 26199
M=D // 26200
// call Memory.deAlloc
@6 // 26201
D=A // 26202
@14 // 26203
M=D // 26204
@Memory.deAlloc // 26205
D=A // 26206
@13 // 26207
M=D // 26208
@Number.to_int32.ret.1 // 26209
D=A // 26210
@CALL // 26211
0;JMP // 26212
(Number.to_int32.ret.1)
@SP // 26213
M=M-1 // 26214

////PushInstruction("this 0")
@THIS // 26215
A=M // 26216
D=M // 26217
@SP // 26218
AM=M+1 // 26219
A=A-1 // 26220
M=D // 26221
@RETURN // 26222
0;JMP // 26223

////FunctionInstruction{functionName='Intersection.getDistanceFromOrigin', numLocals=0, funcMapping={Intersection.new=1, Intersection.dispose=2}}
// function Intersection.getDistanceFromOrigin with 0
(Intersection.getDistanceFromOrigin)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26224
A=M // 26225
D=M // 26226
@3 // 26227
M=D // 26228

////PushInstruction("this 0")
@THIS // 26229
A=M // 26230
D=M // 26231
@SP // 26232
AM=M+1 // 26233
A=A-1 // 26234
M=D // 26235
@RETURN // 26236
0;JMP // 26237

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=4, funcMapping={Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 4
(Memory.deAlloc)
@4 // 26238
D=A // 26239
@SP // 26240
AM=D+M // 26241
A=A-1 // 26242
M=0 // 26243
A=A-1 // 26244
M=0 // 26245
A=A-1 // 26246
M=0 // 26247
A=A-1 // 26248
M=0 // 26249

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

@ARG // 26250
A=M // 26251
D=M // 26252
@4 // 26253
D=D-A // 26254
@LCL // 26255
A=M // 26256
M=D // 26257

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 26258
A=M // 26259
D=M // 26260
@SP // 26261
AM=M+1 // 26262
A=A-1 // 26263
M=D+1 // 26264
D=1 // 26265
@SP // 26266
AM=M-1 // 26267
A=M // 26268
M=D // 26269

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 26270
A=M // 26271
D=M // 26272
D=D-1 // 26273
@LCL // 26274
A=M+1 // 26275
A=A+1 // 26276
A=A+1 // 26277
M=D // 26278

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
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 26279
A=M+1 // 26280
A=A+1 // 26281
A=A+1 // 26282
A=M // 26283
D=M // 26284
@LCL // 26285
A=M+1 // 26286
M=D // 26287

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            PushInstruction("local 1"),
//                        right:
//                            PushInstruction("constant 2048"),
//                        binaryOp: "LT"
//                    ),
//NOT),
//            right:
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
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.94 // 26288
D=A // 26289
@SP // 26290
AM=M+1 // 26291
A=A-1 // 26292
M=D // 26293
@Memory.deAlloc.LT.95 // 26294
D=A // 26295
@SP // 26296
AM=M+1 // 26297
A=A-1 // 26298
M=D // 26299
@LCL // 26300
A=M+1 // 26301
D=M // 26302
@2048 // 26303
D=D-A // 26304
@DO_LT // 26305
0;JMP // 26306
(Memory.deAlloc.LT.95)
@SP // 26307
AM=M+1 // 26308
A=A-1 // 26309
M=D // 26310
@SP // 26311
A=M-1 // 26312
M=!D // 26313
@LCL // 26314
A=M+1 // 26315
A=M+1 // 26316
D=M // 26317
@SP // 26318
AM=M-1 // 26319
D=D&M // 26320
D=D-1 // 26321
@DO_EQ // 26322
0;JMP // 26323
(Memory.deAlloc.EQ.94)
@Memory.deAlloc$IF_TRUE1 // 26324
D;JNE // 26325

////GotoInstruction{label='Memory.deAlloc$IF_END1}
// goto Memory.deAlloc$IF_END1
@Memory.deAlloc$IF_END1 // 26326
0;JMP // 26327

////LabelInstruction{label='Memory.deAlloc$IF_TRUE1}
// label Memory.deAlloc$IF_TRUE1
(Memory.deAlloc$IF_TRUE1)

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

@LCL // 26328
A=M+1 // 26329
A=M // 26330
D=M // 26331
@SP // 26332
AM=M+1 // 26333
A=A-1 // 26334
M=D // 26335
// call Memory.getBinIndex
@6 // 26336
D=A // 26337
@14 // 26338
M=D // 26339
@Memory.getBinIndex // 26340
D=A // 26341
@13 // 26342
M=D // 26343
@Memory.deAlloc.ret.0 // 26344
D=A // 26345
@CALL // 26346
0;JMP // 26347
(Memory.deAlloc.ret.0)
@SP // 26348
AM=M-1 // 26349
D=M // 26350
@2048 // 26351
D=D+A // 26352
@SP // 26353
AM=M+1 // 26354
A=A-1 // 26355
M=D // 26356
@LCL // 26357
A=M+1 // 26358
D=M // 26359
@SP // 26360
AM=M+1 // 26361
A=A-1 // 26362
M=D // 26363
// call Memory.remove_node
@7 // 26364
D=A // 26365
@14 // 26366
M=D // 26367
@Memory.remove_node // 26368
D=A // 26369
@13 // 26370
M=D // 26371
@Memory.deAlloc.ret.1 // 26372
D=A // 26373
@CALL // 26374
0;JMP // 26375
(Memory.deAlloc.ret.1)
@SP // 26376
M=M-1 // 26377

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
@LCL // 26378
A=M+1 // 26379
D=M // 26380
@SP // 26381
AM=M+1 // 26382
A=A-1 // 26383
M=D // 26384
@LCL // 26385
A=M+1 // 26386
A=M // 26387
D=M // 26388
@SP // 26389
AM=M+1 // 26390
A=A-1 // 26391
M=D // 26392
@LCL // 26393
A=M // 26394
A=M // 26395
D=M // 26396
@SP // 26397
AM=M-1 // 26398
D=D+M // 26399
@5 // 26400
D=D+A // 26401
@SP // 26402
AM=M-1 // 26403
A=M // 26404
M=D // 26405

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26406
A=M+1 // 26407
D=M // 26408
@SP // 26409
AM=M+1 // 26410
A=A-1 // 26411
M=D // 26412
// call Memory.create_foot
@6 // 26413
D=A // 26414
@14 // 26415
M=D // 26416
@Memory.create_foot // 26417
D=A // 26418
@13 // 26419
M=D // 26420
@Memory.deAlloc.ret.2 // 26421
D=A // 26422
@CALL // 26423
0;JMP // 26424
(Memory.deAlloc.ret.2)
@SP // 26425
M=M-1 // 26426

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 26427
A=M+1 // 26428
D=M // 26429
@LCL // 26430
A=M // 26431
M=D // 26432

////LabelInstruction{label='Memory.deAlloc$IF_END1}
// label Memory.deAlloc$IF_END1
(Memory.deAlloc$IF_END1)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
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
//)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 26433
A=M // 26434
D=M // 26435
@SP // 26436
AM=M+1 // 26437
A=A-1 // 26438
M=D // 26439
@LCL // 26440
A=M // 26441
A=M // 26442
D=M // 26443
@SP // 26444
AM=M-1 // 26445
D=D+M // 26446
@5 // 26447
D=D+A // 26448
@LCL // 26449
A=M+1 // 26450
A=A+1 // 26451
M=D // 26452

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 2"),
//                    right:
//                        PushInstruction("constant 16384"),
//                    binaryOp: "LT"
//                ),
//            right:
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
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE2}}
@Memory.deAlloc.EQ.96 // 26453
D=A // 26454
@SP // 26455
AM=M+1 // 26456
A=A-1 // 26457
M=D // 26458
@Memory.deAlloc.LT.97 // 26459
D=A // 26460
@SP // 26461
AM=M+1 // 26462
A=A-1 // 26463
M=D // 26464
@LCL // 26465
A=M+1 // 26466
A=A+1 // 26467
D=M // 26468
@16384 // 26469
D=D-A // 26470
@DO_LT // 26471
0;JMP // 26472
(Memory.deAlloc.LT.97)
@SP // 26473
AM=M+1 // 26474
A=A-1 // 26475
M=D // 26476
@LCL // 26477
A=M+1 // 26478
A=A+1 // 26479
A=M+1 // 26480
D=M // 26481
@SP // 26482
AM=M-1 // 26483
D=D&M // 26484
D=D-1 // 26485
@DO_EQ // 26486
0;JMP // 26487
(Memory.deAlloc.EQ.96)
@Memory.deAlloc$IF_TRUE2 // 26488
D;JNE // 26489

////GotoInstruction{label='Memory.deAlloc$IF_END2}
// goto Memory.deAlloc$IF_END2
@Memory.deAlloc$IF_END2 // 26490
0;JMP // 26491

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

@LCL // 26492
A=M+1 // 26493
A=A+1 // 26494
A=M // 26495
D=M // 26496
@SP // 26497
AM=M+1 // 26498
A=A-1 // 26499
M=D // 26500
// call Memory.getBinIndex
@6 // 26501
D=A // 26502
@14 // 26503
M=D // 26504
@Memory.getBinIndex // 26505
D=A // 26506
@13 // 26507
M=D // 26508
@Memory.deAlloc.ret.3 // 26509
D=A // 26510
@CALL // 26511
0;JMP // 26512
(Memory.deAlloc.ret.3)
@SP // 26513
AM=M-1 // 26514
D=M // 26515
@2048 // 26516
D=D+A // 26517
@SP // 26518
AM=M+1 // 26519
A=A-1 // 26520
M=D // 26521
@LCL // 26522
A=M+1 // 26523
A=A+1 // 26524
D=M // 26525
@SP // 26526
AM=M+1 // 26527
A=A-1 // 26528
M=D // 26529
// call Memory.remove_node
@7 // 26530
D=A // 26531
@14 // 26532
M=D // 26533
@Memory.remove_node // 26534
D=A // 26535
@13 // 26536
M=D // 26537
@Memory.deAlloc.ret.4 // 26538
D=A // 26539
@CALL // 26540
0;JMP // 26541
(Memory.deAlloc.ret.4)
@SP // 26542
M=M-1 // 26543

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
@LCL // 26544
A=M // 26545
D=M // 26546
@SP // 26547
AM=M+1 // 26548
A=A-1 // 26549
M=D // 26550
@LCL // 26551
A=M // 26552
A=M // 26553
D=M // 26554
@SP // 26555
AM=M+1 // 26556
A=A-1 // 26557
M=D // 26558
@LCL // 26559
A=M+1 // 26560
A=A+1 // 26561
A=M // 26562
D=M // 26563
@SP // 26564
AM=M-1 // 26565
D=D+M // 26566
@5 // 26567
D=D+A // 26568
@SP // 26569
AM=M-1 // 26570
A=M // 26571
M=D // 26572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26573
A=M // 26574
D=M // 26575
@SP // 26576
AM=M+1 // 26577
A=A-1 // 26578
M=D // 26579
// call Memory.create_foot
@6 // 26580
D=A // 26581
@14 // 26582
M=D // 26583
@Memory.create_foot // 26584
D=A // 26585
@13 // 26586
M=D // 26587
@Memory.deAlloc.ret.5 // 26588
D=A // 26589
@CALL // 26590
0;JMP // 26591
(Memory.deAlloc.ret.5)
@SP // 26592
M=M-1 // 26593

////LabelInstruction{label='Memory.deAlloc$IF_END2}
// label Memory.deAlloc$IF_END2
(Memory.deAlloc$IF_END2)

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

@LCL // 26594
A=M // 26595
A=M // 26596
D=M // 26597
@SP // 26598
AM=M+1 // 26599
A=A-1 // 26600
M=D // 26601
// call Memory.getBinIndex
@6 // 26602
D=A // 26603
@14 // 26604
M=D // 26605
@Memory.getBinIndex // 26606
D=A // 26607
@13 // 26608
M=D // 26609
@Memory.deAlloc.ret.6 // 26610
D=A // 26611
@CALL // 26612
0;JMP // 26613
(Memory.deAlloc.ret.6)
@SP // 26614
AM=M-1 // 26615
D=M // 26616
@2048 // 26617
D=D+A // 26618
@SP // 26619
AM=M+1 // 26620
A=A-1 // 26621
M=D // 26622
@LCL // 26623
A=M // 26624
D=M // 26625
@SP // 26626
AM=M+1 // 26627
A=A-1 // 26628
M=D // 26629
// call Memory.add_node
@7 // 26630
D=A // 26631
@14 // 26632
M=D // 26633
@Memory.add_node // 26634
D=A // 26635
@13 // 26636
M=D // 26637
@Memory.deAlloc.ret.7 // 26638
D=A // 26639
@CALL // 26640
0;JMP // 26641
(Memory.deAlloc.ret.7)
@SP // 26642
M=M-1 // 26643

////PushInstruction("constant 0")
@SP // 26644
AM=M+1 // 26645
A=A-1 // 26646
M=0 // 26647
@RETURN // 26648
0;JMP // 26649

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26650
A=M // 26651
D=M // 26652
@3 // 26653
M=D // 26654

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
@THIS // 26655
A=M // 26656
D=M // 26657
@ARG // 26658
A=M+1 // 26659
A=D+M // 26660
D=M // 26661
@SP // 26662
AM=M+1 // 26663
A=A-1 // 26664
M=D // 26665
@RETURN // 26666
0;JMP // 26667

////FunctionInstruction{functionName='Plane.surface_normal', numLocals=2, funcMapping={Plane.initialize=16, Plane.new=1, Plane.dispose=4, Plane.intersect=15, Plane.color=29}}
// function Plane.surface_normal with 2
(Plane.surface_normal)
@SP // 26668
M=M+1 // 26669
AM=M+1 // 26670
A=A-1 // 26671
M=0 // 26672
A=A-1 // 26673
M=0 // 26674

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26675
A=M // 26676
D=M // 26677
@3 // 26678
M=D // 26679

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 26680
AM=M+1 // 26681
A=A-1 // 26682
M=-1 // 26683
// call Number.new
@6 // 26684
D=A // 26685
@14 // 26686
M=D // 26687
@Number.new // 26688
D=A // 26689
@13 // 26690
M=D // 26691
@Plane.surface_normal.ret.0 // 26692
D=A // 26693
@CALL // 26694
0;JMP // 26695
(Plane.surface_normal.ret.0)
@SP // 26696
AM=M-1 // 26697
D=M // 26698
@LCL // 26699
A=M // 26700
M=D // 26701

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 26702
A=M+1 // 26703
D=M // 26704
@SP // 26705
AM=M+1 // 26706
A=A-1 // 26707
M=D // 26708
// call Vec3.clone
@6 // 26709
D=A // 26710
@14 // 26711
M=D // 26712
@Vec3.clone // 26713
D=A // 26714
@13 // 26715
M=D // 26716
@Plane.surface_normal.ret.1 // 26717
D=A // 26718
@CALL // 26719
0;JMP // 26720
(Plane.surface_normal.ret.1)
@SP // 26721
AM=M-1 // 26722
D=M // 26723
@LCL // 26724
A=M+1 // 26725
M=D // 26726

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26727
A=M+1 // 26728
D=M // 26729
@SP // 26730
AM=M+1 // 26731
A=A-1 // 26732
M=D // 26733
@LCL // 26734
A=M // 26735
D=M // 26736
@SP // 26737
AM=M+1 // 26738
A=A-1 // 26739
M=D // 26740
// call Vec3.do_scale
@7 // 26741
D=A // 26742
@14 // 26743
M=D // 26744
@Vec3.do_scale // 26745
D=A // 26746
@13 // 26747
M=D // 26748
@Plane.surface_normal.ret.2 // 26749
D=A // 26750
@CALL // 26751
0;JMP // 26752
(Plane.surface_normal.ret.2)
@SP // 26753
M=M-1 // 26754

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26755
A=M // 26756
D=M // 26757
@SP // 26758
AM=M+1 // 26759
A=A-1 // 26760
M=D // 26761
// call Number.dispose
@6 // 26762
D=A // 26763
@14 // 26764
M=D // 26765
@Number.dispose // 26766
D=A // 26767
@13 // 26768
M=D // 26769
@Plane.surface_normal.ret.3 // 26770
D=A // 26771
@CALL // 26772
0;JMP // 26773
(Plane.surface_normal.ret.3)
@SP // 26774
M=M-1 // 26775

////PushInstruction("local 1")
@LCL // 26776
A=M+1 // 26777
D=M // 26778
@SP // 26779
AM=M+1 // 26780
A=A-1 // 26781
M=D // 26782
@RETURN // 26783
0;JMP // 26784

////FunctionInstruction{functionName='Number.initialize', numLocals=3, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_div=5, Number.getV=0, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.initialize with 3
(Number.initialize)
@3 // 26785
D=A // 26786
@SP // 26787
AM=D+M // 26788
A=A-1 // 26789
M=0 // 26790
A=A-1 // 26791
M=0 // 26792
A=A-1 // 26793
M=0 // 26794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 256")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=static 0}
//}

@256 // 26795
D=A // 26796
@SP // 26797
AM=M+1 // 26798
A=A-1 // 26799
M=D // 26800
// call Int32.new
@6 // 26801
D=A // 26802
@14 // 26803
M=D // 26804
@Int32.new // 26805
D=A // 26806
@13 // 26807
M=D // 26808
@Number.initialize.ret.0 // 26809
D=A // 26810
@CALL // 26811
0;JMP // 26812
(Number.initialize.ret.0)
@SP // 26813
AM=M-1 // 26814
D=M // 26815
@Number.0 // 26816
M=D // 26817

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 0"), PushInstruction("static 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 26818
D=A // 26819
@SP // 26820
M=D+M // 26821
@Number.0 // 26822
D=M // 26823
@SP // 26824
A=M-1 // 26825
M=D // 26826
A=A-1 // 26827
M=D // 26828
// call Int32.do_mul
@7 // 26829
D=A // 26830
@14 // 26831
M=D // 26832
@Int32.do_mul // 26833
D=A // 26834
@13 // 26835
M=D // 26836
@Number.initialize.ret.1 // 26837
D=A // 26838
@CALL // 26839
0;JMP // 26840
(Number.initialize.ret.1)
@SP // 26841
M=M-1 // 26842

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 561")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@561 // 26843
D=A // 26844
@SP // 26845
AM=M+1 // 26846
A=A-1 // 26847
M=D // 26848
// call Int32.new
@6 // 26849
D=A // 26850
@14 // 26851
M=D // 26852
@Int32.new // 26853
D=A // 26854
@13 // 26855
M=D // 26856
@Number.initialize.ret.2 // 26857
D=A // 26858
@CALL // 26859
0;JMP // 26860
(Number.initialize.ret.2)
@SP // 26861
AM=M-1 // 26862
D=M // 26863
@LCL // 26864
A=M+1 // 26865
M=D // 26866

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 367")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 2}
//}

@367 // 26867
D=A // 26868
@SP // 26869
AM=M+1 // 26870
A=A-1 // 26871
M=D // 26872
// call Int32.new
@6 // 26873
D=A // 26874
@14 // 26875
M=D // 26876
@Int32.new // 26877
D=A // 26878
@13 // 26879
M=D // 26880
@Number.initialize.ret.3 // 26881
D=A // 26882
@CALL // 26883
0;JMP // 26884
(Number.initialize.ret.3)
@SP // 26885
AM=M-1 // 26886
D=M // 26887
@LCL // 26888
A=M+1 // 26889
A=A+1 // 26890
M=D // 26891

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26892
A=M+1 // 26893
D=M // 26894
@SP // 26895
AM=M+1 // 26896
A=A-1 // 26897
M=D // 26898
@LCL // 26899
A=M+1 // 26900
A=A+1 // 26901
D=M // 26902
@SP // 26903
AM=M+1 // 26904
A=A-1 // 26905
M=D // 26906
// call Int32.do_mul
@7 // 26907
D=A // 26908
@14 // 26909
M=D // 26910
@Int32.do_mul // 26911
D=A // 26912
@13 // 26913
M=D // 26914
@Number.initialize.ret.4 // 26915
D=A // 26916
@CALL // 26917
0;JMP // 26918
(Number.initialize.ret.4)
@SP // 26919
M=M-1 // 26920

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.new_from_int32}}
//  pop:  PopInstruction{address=static 3}
//}

@LCL // 26921
A=M+1 // 26922
D=M // 26923
@SP // 26924
AM=M+1 // 26925
A=A-1 // 26926
M=D // 26927
// call Number.new_from_int32
@6 // 26928
D=A // 26929
@14 // 26930
M=D // 26931
@Number.new_from_int32 // 26932
D=A // 26933
@13 // 26934
M=D // 26935
@Number.initialize.ret.5 // 26936
D=A // 26937
@CALL // 26938
0;JMP // 26939
(Number.initialize.ret.5)
@SP // 26940
AM=M-1 // 26941
D=M // 26942
@Number.3 // 26943
M=D // 26944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=static 1}
//}

@Number.0 // 26945
D=M // 26946
@SP // 26947
AM=M+1 // 26948
A=A-1 // 26949
M=D // 26950
// call Int32.clone
@6 // 26951
D=A // 26952
@14 // 26953
M=D // 26954
@Int32.clone // 26955
D=A // 26956
@13 // 26957
M=D // 26958
@Number.initialize.ret.6 // 26959
D=A // 26960
@CALL // 26961
0;JMP // 26962
(Number.initialize.ret.6)
@SP // 26963
AM=M-1 // 26964
D=M // 26965
@Number.1 // 26966
M=D // 26967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.1 // 26968
D=M // 26969
@SP // 26970
AM=M+1 // 26971
A=A-1 // 26972
M=D // 26973
// call Int32.do_sqrt
@6 // 26974
D=A // 26975
@14 // 26976
M=D // 26977
@Int32.do_sqrt // 26978
D=A // 26979
@13 // 26980
M=D // 26981
@Number.initialize.ret.7 // 26982
D=A // 26983
@CALL // 26984
0;JMP // 26985
(Number.initialize.ret.7)
@SP // 26986
M=M-1 // 26987

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.1 // 26988
D=M // 26989
@SP // 26990
AM=M+1 // 26991
A=A-1 // 26992
M=D // 26993
// call Int32.do_sqrt
@6 // 26994
D=A // 26995
@14 // 26996
M=D // 26997
@Int32.do_sqrt // 26998
D=A // 26999
@13 // 27000
M=D // 27001
@Number.initialize.ret.8 // 27002
D=A // 27003
@CALL // 27004
0;JMP // 27005
(Number.initialize.ret.8)
@SP // 27006
M=M-1 // 27007

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=static 2}
//}

@Number.1 // 27008
D=M // 27009
@SP // 27010
AM=M+1 // 27011
A=A-1 // 27012
M=D // 27013
// call Int32.clone
@6 // 27014
D=A // 27015
@14 // 27016
M=D // 27017
@Int32.clone // 27018
D=A // 27019
@13 // 27020
M=D // 27021
@Number.initialize.ret.9 // 27022
D=A // 27023
@CALL // 27024
0;JMP // 27025
(Number.initialize.ret.9)
@SP // 27026
AM=M-1 // 27027
D=M // 27028
@Number.2 // 27029
M=D // 27030

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 27031
D=M // 27032
@SP // 27033
AM=M+1 // 27034
A=A-1 // 27035
M=D // 27036
// call Int32.do_sqrt
@6 // 27037
D=A // 27038
@14 // 27039
M=D // 27040
@Int32.do_sqrt // 27041
D=A // 27042
@13 // 27043
M=D // 27044
@Number.initialize.ret.10 // 27045
D=A // 27046
@CALL // 27047
0;JMP // 27048
(Number.initialize.ret.10)
@SP // 27049
M=M-1 // 27050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@Number.2 // 27051
D=M // 27052
@SP // 27053
AM=M+1 // 27054
A=A-1 // 27055
M=D // 27056
// call Int32.clone
@6 // 27057
D=A // 27058
@14 // 27059
M=D // 27060
@Int32.clone // 27061
D=A // 27062
@13 // 27063
M=D // 27064
@Number.initialize.ret.11 // 27065
D=A // 27066
@CALL // 27067
0;JMP // 27068
(Number.initialize.ret.11)
@SP // 27069
AM=M-1 // 27070
D=M // 27071
@LCL // 27072
A=M // 27073
M=D // 27074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("local 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 27075
D=M // 27076
@SP // 27077
AM=M+1 // 27078
A=A-1 // 27079
M=D // 27080
@LCL // 27081
A=M // 27082
D=M // 27083
@SP // 27084
AM=M+1 // 27085
A=A-1 // 27086
M=D // 27087
// call Int32.do_mul
@7 // 27088
D=A // 27089
@14 // 27090
M=D // 27091
@Int32.do_mul // 27092
D=A // 27093
@13 // 27094
M=D // 27095
@Number.initialize.ret.12 // 27096
D=A // 27097
@CALL // 27098
0;JMP // 27099
(Number.initialize.ret.12)
@SP // 27100
M=M-1 // 27101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("local 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 27102
D=M // 27103
@SP // 27104
AM=M+1 // 27105
A=A-1 // 27106
M=D // 27107
@LCL // 27108
A=M // 27109
D=M // 27110
@SP // 27111
AM=M+1 // 27112
A=A-1 // 27113
M=D // 27114
// call Int32.do_mul
@7 // 27115
D=A // 27116
@14 // 27117
M=D // 27118
@Int32.do_mul // 27119
D=A // 27120
@13 // 27121
M=D // 27122
@Number.initialize.ret.13 // 27123
D=A // 27124
@CALL // 27125
0;JMP // 27126
(Number.initialize.ret.13)
@SP // 27127
M=M-1 // 27128

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27129
A=M+1 // 27130
A=A+1 // 27131
D=M // 27132
@SP // 27133
AM=M+1 // 27134
A=A-1 // 27135
M=D // 27136
// call Int32.dispose
@6 // 27137
D=A // 27138
@14 // 27139
M=D // 27140
@Int32.dispose // 27141
D=A // 27142
@13 // 27143
M=D // 27144
@Number.initialize.ret.14 // 27145
D=A // 27146
@CALL // 27147
0;JMP // 27148
(Number.initialize.ret.14)
@SP // 27149
M=M-1 // 27150

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27151
A=M // 27152
D=M // 27153
@SP // 27154
AM=M+1 // 27155
A=A-1 // 27156
M=D // 27157
// call Int32.dispose
@6 // 27158
D=A // 27159
@14 // 27160
M=D // 27161
@Int32.dispose // 27162
D=A // 27163
@13 // 27164
M=D // 27165
@Number.initialize.ret.15 // 27166
D=A // 27167
@CALL // 27168
0;JMP // 27169
(Number.initialize.ret.15)
@SP // 27170
M=M-1 // 27171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=static 4}
//}

@2 // 27172
D=A // 27173
@SP // 27174
AM=M+1 // 27175
A=A-1 // 27176
M=D // 27177
// call Int32.new
@6 // 27178
D=A // 27179
@14 // 27180
M=D // 27181
@Int32.new // 27182
D=A // 27183
@13 // 27184
M=D // 27185
@Number.initialize.ret.16 // 27186
D=A // 27187
@CALL // 27188
0;JMP // 27189
(Number.initialize.ret.16)
@SP // 27190
AM=M-1 // 27191
D=M // 27192
@Number.4 // 27193
M=D // 27194

////PushInstruction("constant 0")
@SP // 27195
AM=M+1 // 27196
A=A-1 // 27197
M=0 // 27198
@RETURN // 27199
0;JMP // 27200

////FunctionInstruction{functionName='Scene.getLights', numLocals=0, funcMapping={Scene.getNumLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getLights with 0
(Scene.getLights)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27201
A=M // 27202
D=M // 27203
@3 // 27204
M=D // 27205

////PushInstruction("this 7")
@THIS // 27206
D=M // 27207
@7 // 27208
A=D+A // 27209
D=M // 27210
@SP // 27211
AM=M+1 // 27212
A=A-1 // 27213
M=D // 27214
@RETURN // 27215
0;JMP // 27216

////FunctionInstruction{functionName='Number.dispose', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.dispose with 0
(Number.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27217
A=M // 27218
D=M // 27219
@3 // 27220
M=D // 27221

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 5"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 5}
//}

@Number.5 // 27222
M=M-1 // 27223

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27224
A=M // 27225
D=M // 27226
@SP // 27227
AM=M+1 // 27228
A=A-1 // 27229
M=D // 27230
// call Int32.dispose
@6 // 27231
D=A // 27232
@14 // 27233
M=D // 27234
@Int32.dispose // 27235
D=A // 27236
@13 // 27237
M=D // 27238
@Number.dispose.ret.0 // 27239
D=A // 27240
@CALL // 27241
0;JMP // 27242
(Number.dispose.ret.0)
@SP // 27243
M=M-1 // 27244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 27245
D=M // 27246
@SP // 27247
AM=M+1 // 27248
A=A-1 // 27249
M=D // 27250
// call Memory.deAlloc
@6 // 27251
D=A // 27252
@14 // 27253
M=D // 27254
@Memory.deAlloc // 27255
D=A // 27256
@13 // 27257
M=D // 27258
@Number.dispose.ret.1 // 27259
D=A // 27260
@CALL // 27261
0;JMP // 27262
(Number.dispose.ret.1)
@SP // 27263
M=M-1 // 27264

////PushInstruction("constant 0")
@SP // 27265
AM=M+1 // 27266
A=A-1 // 27267
M=0 // 27268
@RETURN // 27269
0;JMP // 27270

////FunctionInstruction{functionName='Number.is_negative', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.is_negative with 0
(Number.is_negative)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27271
A=M // 27272
D=M // 27273
@3 // 27274
M=D // 27275

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_negative}}
@THIS // 27276
A=M // 27277
D=M // 27278
@SP // 27279
AM=M+1 // 27280
A=A-1 // 27281
M=D // 27282
// call Int32.is_negative
@6 // 27283
D=A // 27284
@14 // 27285
M=D // 27286
@Int32.is_negative // 27287
D=A // 27288
@13 // 27289
M=D // 27290
@Number.is_negative.ret.0 // 27291
D=A // 27292
@CALL // 27293
0;JMP // 27294
(Number.is_negative.ret.0)
@RETURN // 27295
0;JMP // 27296

////FunctionInstruction{functionName='Element.intersect', numLocals=0, funcMapping={Element.surface_normal=2, Element.plane=1, Element.color=2}}
// function Element.intersect with 0
(Element.intersect)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27297
A=M // 27298
D=M // 27299
@3 // 27300
M=D // 27301

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.intersect$IF_TRUE1}}
@THIS // 27302
A=M // 27303
D=M // 27304
@Element.intersect$IF_TRUE1 // 27305
D;JNE // 27306

////GotoInstruction{label='Element.intersect$IF_END1}
// goto Element.intersect$IF_END1
@Element.intersect$IF_END1 // 27307
0;JMP // 27308

////LabelInstruction{label='Element.intersect$IF_TRUE1}
// label Element.intersect$IF_TRUE1
(Element.intersect$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Plane.intersect}}
@THIS // 27309
A=M // 27310
D=M // 27311
@SP // 27312
AM=M+1 // 27313
A=A-1 // 27314
M=D // 27315
@ARG // 27316
A=M+1 // 27317
D=M // 27318
@SP // 27319
AM=M+1 // 27320
A=A-1 // 27321
M=D // 27322
// call Plane.intersect
@7 // 27323
D=A // 27324
@14 // 27325
M=D // 27326
@Plane.intersect // 27327
D=A // 27328
@13 // 27329
M=D // 27330
@Element.intersect.ret.0 // 27331
D=A // 27332
@CALL // 27333
0;JMP // 27334
(Element.intersect.ret.0)
@RETURN // 27335
0;JMP // 27336

////LabelInstruction{label='Element.intersect$IF_END1}
// label Element.intersect$IF_END1
(Element.intersect$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.intersect$IF_TRUE2}}
@THIS // 27337
A=M+1 // 27338
D=M // 27339
@Element.intersect$IF_TRUE2 // 27340
D;JNE // 27341

////GotoInstruction{label='Element.intersect$IF_END2}
// goto Element.intersect$IF_END2
@Element.intersect$IF_END2 // 27342
0;JMP // 27343

////LabelInstruction{label='Element.intersect$IF_TRUE2}
// label Element.intersect$IF_TRUE2
(Element.intersect$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Sphere.intersect}}
@THIS // 27344
A=M+1 // 27345
D=M // 27346
@SP // 27347
AM=M+1 // 27348
A=A-1 // 27349
M=D // 27350
@ARG // 27351
A=M+1 // 27352
D=M // 27353
@SP // 27354
AM=M+1 // 27355
A=A-1 // 27356
M=D // 27357
// call Sphere.intersect
@7 // 27358
D=A // 27359
@14 // 27360
M=D // 27361
@Sphere.intersect // 27362
D=A // 27363
@13 // 27364
M=D // 27365
@Element.intersect.ret.1 // 27366
D=A // 27367
@CALL // 27368
0;JMP // 27369
(Element.intersect.ret.1)
@RETURN // 27370
0;JMP // 27371

////LabelInstruction{label='Element.intersect$IF_END2}
// label Element.intersect$IF_END2
(Element.intersect$IF_END2)

////PushInstruction("constant 0")
@SP // 27372
AM=M+1 // 27373
A=A-1 // 27374
M=0 // 27375
@RETURN // 27376
0;JMP // 27377

////FunctionInstruction{functionName='Int32.xor', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.getParts=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.xor with 0
(Int32.xor)

////BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("argument 1"),
//            binaryOp: "OR"
//        ),
//    right:
//        UnaryPushGroup(            BinaryPushGroup(
//                left:
//                    PushInstruction("argument 0"),
//                right:
//                    PushInstruction("argument 1"),
//                binaryOp: "AND"
//            ),
//NOT),
//    binaryOp: "AND"
//)
@ARG // 27378
A=M+1 // 27379
D=M // 27380
A=A-1 // 27381
D=D|M // 27382
@SP // 27383
AM=M+1 // 27384
A=A-1 // 27385
M=D // 27386
@ARG // 27387
A=M+1 // 27388
D=M // 27389
A=A-1 // 27390
D=D&M // 27391
D=!D // 27392
@SP // 27393
AM=M-1 // 27394
D=D&M // 27395
@SP // 27396
AM=M+1 // 27397
A=A-1 // 27398
M=D // 27399
@RETURN // 27400
0;JMP // 27401

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.get_best_fit=0, Memory.getBinIndex=1}}
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
@Memory.remove_node.EQ.98 // 27402
D=A // 27403
@SP // 27404
AM=M+1 // 27405
A=A-1 // 27406
M=D // 27407
@ARG // 27408
A=M+1 // 27409
D=M // 27410
@ARG // 27411
A=M+1 // 27412
D=M // 27413
@2 // 27414
D=D+A // 27415
A=D // 27416
D=M // 27417
@DO_EQ // 27418
0;JMP // 27419
(Memory.remove_node.EQ.98)
D=!D // 27420
@Memory.remove_node$IF_TRUE1 // 27421
D;JNE // 27422

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 27423
0;JMP // 27424

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
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 27425
A=M+1 // 27426
D=M // 27427
@ARG // 27428
A=M+1 // 27429
D=M // 27430
@2 // 27431
D=D+A // 27432
A=D // 27433
D=M // 27434
@3 // 27435
D=D+A // 27436
@SP // 27437
AM=M+1 // 27438
A=A-1 // 27439
M=D // 27440
@ARG // 27441
A=M+1 // 27442
D=M // 27443
@ARG // 27444
A=M+1 // 27445
D=M // 27446
@3 // 27447
D=D+A // 27448
A=D // 27449
D=M // 27450
@SP // 27451
AM=M-1 // 27452
A=M // 27453
M=D // 27454

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 27455
0;JMP // 27456

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
@ARG // 27457
A=M // 27458
D=M // 27459
@SP // 27460
AM=M+1 // 27461
A=A-1 // 27462
M=D // 27463
@ARG // 27464
A=M+1 // 27465
D=M // 27466
@ARG // 27467
A=M+1 // 27468
D=M // 27469
@3 // 27470
D=D+A // 27471
A=D // 27472
D=M // 27473
@SP // 27474
AM=M-1 // 27475
A=M // 27476
M=D // 27477

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
@Memory.remove_node.EQ.99 // 27478
D=A // 27479
@SP // 27480
AM=M+1 // 27481
A=A-1 // 27482
M=D // 27483
@ARG // 27484
A=M+1 // 27485
D=M // 27486
@ARG // 27487
A=M+1 // 27488
D=M // 27489
@3 // 27490
D=D+A // 27491
A=D // 27492
D=M // 27493
@DO_EQ // 27494
0;JMP // 27495
(Memory.remove_node.EQ.99)
D=!D // 27496
@Memory.remove_node$IF_TRUE2 // 27497
D;JNE // 27498

////GotoInstruction{label='Memory.remove_node$IF_END2}
// goto Memory.remove_node$IF_END2
@Memory.remove_node$IF_END2 // 27499
0;JMP // 27500

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
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 27501
A=M+1 // 27502
D=M // 27503
@ARG // 27504
A=M+1 // 27505
D=M // 27506
@3 // 27507
D=D+A // 27508
A=D // 27509
D=M // 27510
@2 // 27511
D=D+A // 27512
@SP // 27513
AM=M+1 // 27514
A=A-1 // 27515
M=D // 27516
@ARG // 27517
A=M+1 // 27518
D=M // 27519
@ARG // 27520
A=M+1 // 27521
D=M // 27522
@2 // 27523
D=D+A // 27524
A=D // 27525
D=M // 27526
@SP // 27527
AM=M-1 // 27528
A=M // 27529
M=D // 27530

////LabelInstruction{label='Memory.remove_node$IF_END2}
// label Memory.remove_node$IF_END2
(Memory.remove_node$IF_END2)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 27531
A=M+1 // 27532
D=M // 27533
@2 // 27534
D=D+A // 27535
@SP // 27536
AM=M+1 // 27537
A=A-1 // 27538
M=D // 27539
D=0 // 27540
@SP // 27541
AM=M-1 // 27542
A=M // 27543
M=D // 27544

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 27545
A=M+1 // 27546
D=M // 27547
@3 // 27548
D=D+A // 27549
@SP // 27550
AM=M+1 // 27551
A=A-1 // 27552
M=D // 27553
D=0 // 27554
@SP // 27555
AM=M-1 // 27556
A=M // 27557
M=D // 27558

////PushInstruction("constant 0")
@SP // 27559
AM=M+1 // 27560
A=A-1 // 27561
M=0 // 27562
@RETURN // 27563
0;JMP // 27564

////FunctionInstruction{functionName='DirectionalLight.new', numLocals=2, funcMapping={DirectionalLight.dispose=3, DirectionalLight.getColor=0}}
// function DirectionalLight.new with 2
(DirectionalLight.new)
@SP // 27565
M=M+1 // 27566
AM=M+1 // 27567
A=A-1 // 27568
M=0 // 27569
A=A-1 // 27570
M=0 // 27571

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@4 // 27572
D=A // 27573
@SP // 27574
AM=M+1 // 27575
A=A-1 // 27576
M=D // 27577
// call Memory.alloc
@6 // 27578
D=A // 27579
@14 // 27580
M=D // 27581
@Memory.alloc // 27582
D=A // 27583
@13 // 27584
M=D // 27585
@DirectionalLight.new.ret.0 // 27586
D=A // 27587
@CALL // 27588
0;JMP // 27589
(DirectionalLight.new.ret.0)
@SP // 27590
AM=M-1 // 27591
D=M // 27592
@3 // 27593
M=D // 27594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 27595
AM=M+1 // 27596
A=A-1 // 27597
M=-1 // 27598
// call Number.new
@6 // 27599
D=A // 27600
@14 // 27601
M=D // 27602
@Number.new // 27603
D=A // 27604
@13 // 27605
M=D // 27606
@DirectionalLight.new.ret.1 // 27607
D=A // 27608
@CALL // 27609
0;JMP // 27610
(DirectionalLight.new.ret.1)
@SP // 27611
AM=M-1 // 27612
D=M // 27613
@LCL // 27614
A=M // 27615
M=D // 27616

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 20")], call=CallInstruction{Main.getSomething}}
//  pop:  PopInstruction{address=local 1}
//}

@2 // 27617
D=A // 27618
@SP // 27619
M=D+M // 27620
@20 // 27621
D=A // 27622
@SP // 27623
A=M-1 // 27624
M=D // 27625
A=A-1 // 27626
M=1 // 27627
// call Main.getSomething
@7 // 27628
D=A // 27629
@14 // 27630
M=D // 27631
@Main.getSomething // 27632
D=A // 27633
@13 // 27634
M=D // 27635
@DirectionalLight.new.ret.2 // 27636
D=A // 27637
@CALL // 27638
0;JMP // 27639
(DirectionalLight.new.ret.2)
@SP // 27640
AM=M-1 // 27641
D=M // 27642
@LCL // 27643
A=M+1 // 27644
M=D // 27645

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 27646
A=M // 27647
D=M // 27648
@THIS // 27649
A=M // 27650
M=D // 27651

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 27652
A=M+1 // 27653
D=M // 27654
@THIS // 27655
A=M+1 // 27656
M=D // 27657

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=this 2}
//}

@THIS // 27658
A=M // 27659
D=M // 27660
@SP // 27661
AM=M+1 // 27662
A=A-1 // 27663
M=D // 27664
// call Vec3.clone
@6 // 27665
D=A // 27666
@14 // 27667
M=D // 27668
@Vec3.clone // 27669
D=A // 27670
@13 // 27671
M=D // 27672
@DirectionalLight.new.ret.3 // 27673
D=A // 27674
@CALL // 27675
0;JMP // 27676
(DirectionalLight.new.ret.3)
@SP // 27677
AM=M-1 // 27678
D=M // 27679
@THIS // 27680
A=M+1 // 27681
A=A+1 // 27682
M=D // 27683

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27684
A=M+1 // 27685
A=A+1 // 27686
D=M // 27687
@SP // 27688
AM=M+1 // 27689
A=A-1 // 27690
M=D // 27691
@LCL // 27692
A=M // 27693
D=M // 27694
@SP // 27695
AM=M+1 // 27696
A=A-1 // 27697
M=D // 27698
// call Vec3.do_scale
@7 // 27699
D=A // 27700
@14 // 27701
M=D // 27702
@Vec3.do_scale // 27703
D=A // 27704
@13 // 27705
M=D // 27706
@DirectionalLight.new.ret.4 // 27707
D=A // 27708
@CALL // 27709
0;JMP // 27710
(DirectionalLight.new.ret.4)
@SP // 27711
M=M-1 // 27712

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=this 3}
//}

@THIS // 27713
A=M+1 // 27714
A=A+1 // 27715
D=M // 27716
@SP // 27717
AM=M+1 // 27718
A=A-1 // 27719
M=D // 27720
// call Vec3.clone
@6 // 27721
D=A // 27722
@14 // 27723
M=D // 27724
@Vec3.clone // 27725
D=A // 27726
@13 // 27727
M=D // 27728
@DirectionalLight.new.ret.5 // 27729
D=A // 27730
@CALL // 27731
0;JMP // 27732
(DirectionalLight.new.ret.5)
@SP // 27733
AM=M-1 // 27734
D=M // 27735
@THIS // 27736
A=M+1 // 27737
A=A+1 // 27738
A=A+1 // 27739
M=D // 27740

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3"), PushInstruction("local 1")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27741
A=M+1 // 27742
A=A+1 // 27743
A=A+1 // 27744
D=M // 27745
@SP // 27746
AM=M+1 // 27747
A=A-1 // 27748
M=D // 27749
@LCL // 27750
A=M+1 // 27751
D=M // 27752
@SP // 27753
AM=M+1 // 27754
A=A-1 // 27755
M=D // 27756
// call Vec3.do_scale
@7 // 27757
D=A // 27758
@14 // 27759
M=D // 27760
@Vec3.do_scale // 27761
D=A // 27762
@13 // 27763
M=D // 27764
@DirectionalLight.new.ret.6 // 27765
D=A // 27766
@CALL // 27767
0;JMP // 27768
(DirectionalLight.new.ret.6)
@SP // 27769
M=M-1 // 27770

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27771
A=M // 27772
D=M // 27773
@SP // 27774
AM=M+1 // 27775
A=A-1 // 27776
M=D // 27777
// call Number.dispose
@6 // 27778
D=A // 27779
@14 // 27780
M=D // 27781
@Number.dispose // 27782
D=A // 27783
@13 // 27784
M=D // 27785
@DirectionalLight.new.ret.7 // 27786
D=A // 27787
@CALL // 27788
0;JMP // 27789
(DirectionalLight.new.ret.7)
@SP // 27790
M=M-1 // 27791

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27792
A=M+1 // 27793
D=M // 27794
@SP // 27795
AM=M+1 // 27796
A=A-1 // 27797
M=D // 27798
// call Number.dispose
@6 // 27799
D=A // 27800
@14 // 27801
M=D // 27802
@Number.dispose // 27803
D=A // 27804
@13 // 27805
M=D // 27806
@DirectionalLight.new.ret.8 // 27807
D=A // 27808
@CALL // 27809
0;JMP // 27810
(DirectionalLight.new.ret.8)
@SP // 27811
M=M-1 // 27812

////PushInstruction("pointer 0")
@3 // 27813
D=M // 27814
@SP // 27815
AM=M+1 // 27816
A=A-1 // 27817
M=D // 27818
@RETURN // 27819
0;JMP // 27820

////FunctionInstruction{functionName='Scene.getHeight', numLocals=0, funcMapping={Scene.getNumLights=0, Scene.getLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getHeight with 0
(Scene.getHeight)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27821
A=M // 27822
D=M // 27823
@3 // 27824
M=D // 27825

////PushInstruction("this 1")
@THIS // 27826
A=M+1 // 27827
D=M // 27828
@SP // 27829
AM=M+1 // 27830
A=A-1 // 27831
M=D // 27832
@RETURN // 27833
0;JMP // 27834

////FunctionInstruction{functionName='Vec3.do_normalize', numLocals=3, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0, Vec3.getZ=0}}
// function Vec3.do_normalize with 3
(Vec3.do_normalize)
@3 // 27835
D=A // 27836
@SP // 27837
AM=D+M // 27838
A=A-1 // 27839
M=0 // 27840
A=A-1 // 27841
M=0 // 27842
A=A-1 // 27843
M=0 // 27844

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27845
A=M // 27846
D=M // 27847
@3 // 27848
M=D // 27849

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 27850
A=M // 27851
D=M // 27852
@SP // 27853
AM=M+1 // 27854
A=A-1 // 27855
M=D // 27856
// call Number.clone
@6 // 27857
D=A // 27858
@14 // 27859
M=D // 27860
@Number.clone // 27861
D=A // 27862
@13 // 27863
M=D // 27864
@Vec3.do_normalize.ret.0 // 27865
D=A // 27866
@CALL // 27867
0;JMP // 27868
(Vec3.do_normalize.ret.0)
@SP // 27869
AM=M-1 // 27870
D=M // 27871
@LCL // 27872
A=M // 27873
M=D // 27874

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 0")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27875
A=M // 27876
D=M // 27877
@SP // 27878
AM=M+1 // 27879
A=A-1 // 27880
M=D // 27881
@THIS // 27882
A=M // 27883
D=M // 27884
@SP // 27885
AM=M+1 // 27886
A=A-1 // 27887
M=D // 27888
// call Number.do_mul
@7 // 27889
D=A // 27890
@14 // 27891
M=D // 27892
@Number.do_mul // 27893
D=A // 27894
@13 // 27895
M=D // 27896
@Vec3.do_normalize.ret.1 // 27897
D=A // 27898
@CALL // 27899
0;JMP // 27900
(Vec3.do_normalize.ret.1)
@SP // 27901
M=M-1 // 27902

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 27903
A=M+1 // 27904
D=M // 27905
@SP // 27906
AM=M+1 // 27907
A=A-1 // 27908
M=D // 27909
// call Number.clone
@6 // 27910
D=A // 27911
@14 // 27912
M=D // 27913
@Number.clone // 27914
D=A // 27915
@13 // 27916
M=D // 27917
@Vec3.do_normalize.ret.2 // 27918
D=A // 27919
@CALL // 27920
0;JMP // 27921
(Vec3.do_normalize.ret.2)
@SP // 27922
AM=M-1 // 27923
D=M // 27924
@LCL // 27925
A=M+1 // 27926
M=D // 27927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27928
A=M+1 // 27929
D=M // 27930
@SP // 27931
AM=M+1 // 27932
A=A-1 // 27933
M=D // 27934
@THIS // 27935
A=M+1 // 27936
D=M // 27937
@SP // 27938
AM=M+1 // 27939
A=A-1 // 27940
M=D // 27941
// call Number.do_mul
@7 // 27942
D=A // 27943
@14 // 27944
M=D // 27945
@Number.do_mul // 27946
D=A // 27947
@13 // 27948
M=D // 27949
@Vec3.do_normalize.ret.3 // 27950
D=A // 27951
@CALL // 27952
0;JMP // 27953
(Vec3.do_normalize.ret.3)
@SP // 27954
M=M-1 // 27955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 27956
A=M+1 // 27957
A=A+1 // 27958
D=M // 27959
@SP // 27960
AM=M+1 // 27961
A=A-1 // 27962
M=D // 27963
// call Number.clone
@6 // 27964
D=A // 27965
@14 // 27966
M=D // 27967
@Number.clone // 27968
D=A // 27969
@13 // 27970
M=D // 27971
@Vec3.do_normalize.ret.4 // 27972
D=A // 27973
@CALL // 27974
0;JMP // 27975
(Vec3.do_normalize.ret.4)
@SP // 27976
AM=M-1 // 27977
D=M // 27978
@LCL // 27979
A=M+1 // 27980
A=A+1 // 27981
M=D // 27982

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("this 2")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27983
A=M+1 // 27984
A=A+1 // 27985
D=M // 27986
@SP // 27987
AM=M+1 // 27988
A=A-1 // 27989
M=D // 27990
@THIS // 27991
A=M+1 // 27992
A=A+1 // 27993
D=M // 27994
@SP // 27995
AM=M+1 // 27996
A=A-1 // 27997
M=D // 27998
// call Number.do_mul
@7 // 27999
D=A // 28000
@14 // 28001
M=D // 28002
@Number.do_mul // 28003
D=A // 28004
@13 // 28005
M=D // 28006
@Vec3.do_normalize.ret.5 // 28007
D=A // 28008
@CALL // 28009
0;JMP // 28010
(Vec3.do_normalize.ret.5)
@SP // 28011
M=M-1 // 28012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28013
A=M // 28014
D=M // 28015
@SP // 28016
AM=M+1 // 28017
A=A-1 // 28018
M=D // 28019
@LCL // 28020
A=M+1 // 28021
D=M // 28022
@SP // 28023
AM=M+1 // 28024
A=A-1 // 28025
M=D // 28026
// call Number.do_add
@7 // 28027
D=A // 28028
@14 // 28029
M=D // 28030
@Number.do_add // 28031
D=A // 28032
@13 // 28033
M=D // 28034
@Vec3.do_normalize.ret.6 // 28035
D=A // 28036
@CALL // 28037
0;JMP // 28038
(Vec3.do_normalize.ret.6)
@SP // 28039
M=M-1 // 28040

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28041
A=M // 28042
D=M // 28043
@SP // 28044
AM=M+1 // 28045
A=A-1 // 28046
M=D // 28047
@LCL // 28048
A=M+1 // 28049
A=A+1 // 28050
D=M // 28051
@SP // 28052
AM=M+1 // 28053
A=A-1 // 28054
M=D // 28055
// call Number.do_add
@7 // 28056
D=A // 28057
@14 // 28058
M=D // 28059
@Number.do_add // 28060
D=A // 28061
@13 // 28062
M=D // 28063
@Vec3.do_normalize.ret.7 // 28064
D=A // 28065
@CALL // 28066
0;JMP // 28067
(Vec3.do_normalize.ret.7)
@SP // 28068
M=M-1 // 28069

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28070
A=M // 28071
D=M // 28072
@SP // 28073
AM=M+1 // 28074
A=A-1 // 28075
M=D // 28076
// call Number.do_sqrt
@6 // 28077
D=A // 28078
@14 // 28079
M=D // 28080
@Number.do_sqrt // 28081
D=A // 28082
@13 // 28083
M=D // 28084
@Vec3.do_normalize.ret.8 // 28085
D=A // 28086
@CALL // 28087
0;JMP // 28088
(Vec3.do_normalize.ret.8)
@SP // 28089
M=M-1 // 28090

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28091
A=M // 28092
D=M // 28093
@SP // 28094
AM=M+1 // 28095
A=A-1 // 28096
M=D // 28097
@LCL // 28098
A=M // 28099
D=M // 28100
@SP // 28101
AM=M+1 // 28102
A=A-1 // 28103
M=D // 28104
// call Number.do_div
@7 // 28105
D=A // 28106
@14 // 28107
M=D // 28108
@Number.do_div // 28109
D=A // 28110
@13 // 28111
M=D // 28112
@Vec3.do_normalize.ret.9 // 28113
D=A // 28114
@CALL // 28115
0;JMP // 28116
(Vec3.do_normalize.ret.9)
@SP // 28117
M=M-1 // 28118

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28119
A=M+1 // 28120
D=M // 28121
@SP // 28122
AM=M+1 // 28123
A=A-1 // 28124
M=D // 28125
@LCL // 28126
A=M // 28127
D=M // 28128
@SP // 28129
AM=M+1 // 28130
A=A-1 // 28131
M=D // 28132
// call Number.do_div
@7 // 28133
D=A // 28134
@14 // 28135
M=D // 28136
@Number.do_div // 28137
D=A // 28138
@13 // 28139
M=D // 28140
@Vec3.do_normalize.ret.10 // 28141
D=A // 28142
@CALL // 28143
0;JMP // 28144
(Vec3.do_normalize.ret.10)
@SP // 28145
M=M-1 // 28146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28147
A=M+1 // 28148
A=A+1 // 28149
D=M // 28150
@SP // 28151
AM=M+1 // 28152
A=A-1 // 28153
M=D // 28154
@LCL // 28155
A=M // 28156
D=M // 28157
@SP // 28158
AM=M+1 // 28159
A=A-1 // 28160
M=D // 28161
// call Number.do_div
@7 // 28162
D=A // 28163
@14 // 28164
M=D // 28165
@Number.do_div // 28166
D=A // 28167
@13 // 28168
M=D // 28169
@Vec3.do_normalize.ret.11 // 28170
D=A // 28171
@CALL // 28172
0;JMP // 28173
(Vec3.do_normalize.ret.11)
@SP // 28174
M=M-1 // 28175

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28176
A=M // 28177
D=M // 28178
@SP // 28179
AM=M+1 // 28180
A=A-1 // 28181
M=D // 28182
// call Number.dispose
@6 // 28183
D=A // 28184
@14 // 28185
M=D // 28186
@Number.dispose // 28187
D=A // 28188
@13 // 28189
M=D // 28190
@Vec3.do_normalize.ret.12 // 28191
D=A // 28192
@CALL // 28193
0;JMP // 28194
(Vec3.do_normalize.ret.12)
@SP // 28195
M=M-1 // 28196

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28197
A=M+1 // 28198
D=M // 28199
@SP // 28200
AM=M+1 // 28201
A=A-1 // 28202
M=D // 28203
// call Number.dispose
@6 // 28204
D=A // 28205
@14 // 28206
M=D // 28207
@Number.dispose // 28208
D=A // 28209
@13 // 28210
M=D // 28211
@Vec3.do_normalize.ret.13 // 28212
D=A // 28213
@CALL // 28214
0;JMP // 28215
(Vec3.do_normalize.ret.13)
@SP // 28216
M=M-1 // 28217

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28218
A=M+1 // 28219
A=A+1 // 28220
D=M // 28221
@SP // 28222
AM=M+1 // 28223
A=A-1 // 28224
M=D // 28225
// call Number.dispose
@6 // 28226
D=A // 28227
@14 // 28228
M=D // 28229
@Number.dispose // 28230
D=A // 28231
@13 // 28232
M=D // 28233
@Vec3.do_normalize.ret.14 // 28234
D=A // 28235
@CALL // 28236
0;JMP // 28237
(Vec3.do_normalize.ret.14)
@SP // 28238
M=M-1 // 28239

////PushInstruction("constant 0")
@SP // 28240
AM=M+1 // 28241
A=A-1 // 28242
M=0 // 28243
@RETURN // 28244
0;JMP // 28245

////FunctionInstruction{functionName='Int32.cmp', numLocals=2, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.nlz_u4=1, Int32.xor=0, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.getParts=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.cmp with 2
(Int32.cmp)
@SP // 28246
M=M+1 // 28247
AM=M+1 // 28248
A=A-1 // 28249
M=0 // 28250
A=A-1 // 28251
M=0 // 28252

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 28253
A=M // 28254
D=M // 28255
@3 // 28256
M=D // 28257

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@3 // 28258
D=M // 28259
@SP // 28260
AM=M+1 // 28261
A=A-1 // 28262
M=D // 28263
// call Int32.clone
@6 // 28264
D=A // 28265
@14 // 28266
M=D // 28267
@Int32.clone // 28268
D=A // 28269
@13 // 28270
M=D // 28271
@Int32.cmp.ret.0 // 28272
D=A // 28273
@CALL // 28274
0;JMP // 28275
(Int32.cmp.ret.0)
@SP // 28276
AM=M-1 // 28277
D=M // 28278
@LCL // 28279
A=M // 28280
M=D // 28281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 1")], call=CallInstruction{Int32.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28282
A=M // 28283
D=M // 28284
@SP // 28285
AM=M+1 // 28286
A=A-1 // 28287
M=D // 28288
@ARG // 28289
A=M+1 // 28290
D=M // 28291
@SP // 28292
AM=M+1 // 28293
A=A-1 // 28294
M=D // 28295
// call Int32.do_sub
@7 // 28296
D=A // 28297
@14 // 28298
M=D // 28299
@Int32.do_sub // 28300
D=A // 28301
@13 // 28302
M=D // 28303
@Int32.cmp.ret.1 // 28304
D=A // 28305
@CALL // 28306
0;JMP // 28307
(Int32.cmp.ret.1)
@SP // 28308
M=M-1 // 28309

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.is_zero}}, ifGoto=IfGotoInstruction{label='Int32.cmp$IF_TRUE1}}
@LCL // 28310
A=M // 28311
D=M // 28312
@SP // 28313
AM=M+1 // 28314
A=A-1 // 28315
M=D // 28316
// call Int32.is_zero
@6 // 28317
D=A // 28318
@14 // 28319
M=D // 28320
@Int32.is_zero // 28321
D=A // 28322
@13 // 28323
M=D // 28324
@Int32.cmp.ret.2 // 28325
D=A // 28326
@CALL // 28327
0;JMP // 28328
(Int32.cmp.ret.2)
@SP // 28329
AM=M-1 // 28330
D=M // 28331
@Int32.cmp$IF_TRUE1 // 28332
D;JNE // 28333

////GotoInstruction{label='Int32.cmp$IF_FALSE1}
// goto Int32.cmp$IF_FALSE1
@Int32.cmp$IF_FALSE1 // 28334
0;JMP // 28335

////LabelInstruction{label='Int32.cmp$IF_TRUE1}
// label Int32.cmp$IF_TRUE1
(Int32.cmp$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28336
A=M+1 // 28337
M=0 // 28338

////GotoInstruction{label='Int32.cmp$IF_END1}
// goto Int32.cmp$IF_END1
@Int32.cmp$IF_END1 // 28339
0;JMP // 28340

////LabelInstruction{label='Int32.cmp$IF_FALSE1}
// label Int32.cmp$IF_FALSE1
(Int32.cmp$IF_FALSE1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.cmp$IF_TRUE2}}
@LCL // 28341
A=M // 28342
D=M // 28343
@SP // 28344
AM=M+1 // 28345
A=A-1 // 28346
M=D // 28347
// call Int32.is_negative
@6 // 28348
D=A // 28349
@14 // 28350
M=D // 28351
@Int32.is_negative // 28352
D=A // 28353
@13 // 28354
M=D // 28355
@Int32.cmp.ret.3 // 28356
D=A // 28357
@CALL // 28358
0;JMP // 28359
(Int32.cmp.ret.3)
@SP // 28360
AM=M-1 // 28361
D=M // 28362
@Int32.cmp$IF_TRUE2 // 28363
D;JNE // 28364

////GotoInstruction{label='Int32.cmp$IF_FALSE2}
// goto Int32.cmp$IF_FALSE2
@Int32.cmp$IF_FALSE2 // 28365
0;JMP // 28366

////LabelInstruction{label='Int32.cmp$IF_TRUE2}
// label Int32.cmp$IF_TRUE2
(Int32.cmp$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28367
A=M+1 // 28368
M=-1 // 28369

////GotoInstruction{label='Int32.cmp$IF_END2}
// goto Int32.cmp$IF_END2
@Int32.cmp$IF_END2 // 28370
0;JMP // 28371

////LabelInstruction{label='Int32.cmp$IF_FALSE2}
// label Int32.cmp$IF_FALSE2
(Int32.cmp$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28372
A=M+1 // 28373
M=1 // 28374

////LabelInstruction{label='Int32.cmp$IF_END2}
// label Int32.cmp$IF_END2
(Int32.cmp$IF_END2)

////LabelInstruction{label='Int32.cmp$IF_END1}
// label Int32.cmp$IF_END1
(Int32.cmp$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28375
A=M // 28376
D=M // 28377
@SP // 28378
AM=M+1 // 28379
A=A-1 // 28380
M=D // 28381
// call Int32.dispose
@6 // 28382
D=A // 28383
@14 // 28384
M=D // 28385
@Int32.dispose // 28386
D=A // 28387
@13 // 28388
M=D // 28389
@Int32.cmp.ret.4 // 28390
D=A // 28391
@CALL // 28392
0;JMP // 28393
(Int32.cmp.ret.4)
@SP // 28394
M=M-1 // 28395

////PushInstruction("local 1")
@LCL // 28396
A=M+1 // 28397
D=M // 28398
@SP // 28399
AM=M+1 // 28400
A=A-1 // 28401
M=D // 28402
@RETURN // 28403
0;JMP // 28404

////FunctionInstruction{functionName='Int32.do_left_shift_bytes_div', numLocals=11, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_left_shift_bytes_div with 11
(Int32.do_left_shift_bytes_div)
@11 // 28405
D=A // 28406
@SP // 28407
AM=D+M // 28408
A=A-1 // 28409
M=0 // 28410
A=A-1 // 28411
M=0 // 28412
A=A-1 // 28413
M=0 // 28414
A=A-1 // 28415
M=0 // 28416
A=A-1 // 28417
M=0 // 28418
A=A-1 // 28419
M=0 // 28420
A=A-1 // 28421
M=0 // 28422
A=A-1 // 28423
M=0 // 28424
A=A-1 // 28425
M=0 // 28426
A=A-1 // 28427
M=0 // 28428
A=A-1 // 28429
M=0 // 28430

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 28431
A=M // 28432
D=M // 28433
@3 // 28434
M=D // 28435

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 28436
A=M+1 // 28437
A=A+1 // 28438
M=0 // 28439

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 28440
A=M+1 // 28441
A=A+1 // 28442
A=A+1 // 28443
M=0 // 28444

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.is_negative}}], call=CallInstruction{Int32.xor}}
//  pop:  PopInstruction{address=local 4}
//}

@3 // 28445
D=M // 28446
@SP // 28447
AM=M+1 // 28448
A=A-1 // 28449
M=D // 28450
// call Int32.is_negative
@6 // 28451
D=A // 28452
@14 // 28453
M=D // 28454
@Int32.is_negative // 28455
D=A // 28456
@13 // 28457
M=D // 28458
@Int32.do_left_shift_bytes_div.ret.0 // 28459
D=A // 28460
@CALL // 28461
0;JMP // 28462
(Int32.do_left_shift_bytes_div.ret.0)
@ARG // 28463
A=M+1 // 28464
A=A+1 // 28465
D=M // 28466
@SP // 28467
AM=M+1 // 28468
A=A-1 // 28469
M=D // 28470
// call Int32.is_negative
@6 // 28471
D=A // 28472
@14 // 28473
M=D // 28474
@Int32.is_negative // 28475
D=A // 28476
@13 // 28477
M=D // 28478
@Int32.do_left_shift_bytes_div.ret.1 // 28479
D=A // 28480
@CALL // 28481
0;JMP // 28482
(Int32.do_left_shift_bytes_div.ret.1)
// call Int32.xor
@7 // 28483
D=A // 28484
@14 // 28485
M=D // 28486
@Int32.xor // 28487
D=A // 28488
@13 // 28489
M=D // 28490
@Int32.do_left_shift_bytes_div.ret.2 // 28491
D=A // 28492
@CALL // 28493
0;JMP // 28494
(Int32.do_left_shift_bytes_div.ret.2)
@LCL // 28495
D=M // 28496
@4 // 28497
A=D+A // 28498
D=A // 28499
@R13 // 28500
M=D // 28501
@SP // 28502
AM=M-1 // 28503
D=M // 28504
@R13 // 28505
A=M // 28506
M=D // 28507

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE1}}
@3 // 28508
D=M // 28509
@SP // 28510
AM=M+1 // 28511
A=A-1 // 28512
M=D // 28513
// call Int32.is_negative
@6 // 28514
D=A // 28515
@14 // 28516
M=D // 28517
@Int32.is_negative // 28518
D=A // 28519
@13 // 28520
M=D // 28521
@Int32.do_left_shift_bytes_div.ret.3 // 28522
D=A // 28523
@CALL // 28524
0;JMP // 28525
(Int32.do_left_shift_bytes_div.ret.3)
@SP // 28526
AM=M-1 // 28527
D=M // 28528
@Int32.do_left_shift_bytes_div$IF_TRUE1 // 28529
D;JNE // 28530

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE1}
// goto Int32.do_left_shift_bytes_div$IF_FALSE1
@Int32.do_left_shift_bytes_div$IF_FALSE1 // 28531
0;JMP // 28532

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE1}
// label Int32.do_left_shift_bytes_div$IF_TRUE1
(Int32.do_left_shift_bytes_div$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@3 // 28533
D=M // 28534
@SP // 28535
AM=M+1 // 28536
A=A-1 // 28537
M=D // 28538
// call Int32.clone
@6 // 28539
D=A // 28540
@14 // 28541
M=D // 28542
@Int32.clone // 28543
D=A // 28544
@13 // 28545
M=D // 28546
@Int32.do_left_shift_bytes_div.ret.4 // 28547
D=A // 28548
@CALL // 28549
0;JMP // 28550
(Int32.do_left_shift_bytes_div.ret.4)
@SP // 28551
AM=M-1 // 28552
D=M // 28553
@LCL // 28554
A=M+1 // 28555
A=A+1 // 28556
M=D // 28557

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28558
A=M+1 // 28559
A=A+1 // 28560
D=M // 28561
@SP // 28562
AM=M+1 // 28563
A=A-1 // 28564
M=D // 28565
// call Int32.do_abs
@6 // 28566
D=A // 28567
@14 // 28568
M=D // 28569
@Int32.do_abs // 28570
D=A // 28571
@13 // 28572
M=D // 28573
@Int32.do_left_shift_bytes_div.ret.5 // 28574
D=A // 28575
@CALL // 28576
0;JMP // 28577
(Int32.do_left_shift_bytes_div.ret.5)
@SP // 28578
M=M-1 // 28579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 28580
A=M+1 // 28581
A=A+1 // 28582
D=M // 28583
@SP // 28584
AM=M+1 // 28585
A=A-1 // 28586
M=D // 28587
// call Int32.getParts
@6 // 28588
D=A // 28589
@14 // 28590
M=D // 28591
@Int32.getParts // 28592
D=A // 28593
@13 // 28594
M=D // 28595
@Int32.do_left_shift_bytes_div.ret.6 // 28596
D=A // 28597
@CALL // 28598
0;JMP // 28599
(Int32.do_left_shift_bytes_div.ret.6)
@SP // 28600
AM=M-1 // 28601
D=M // 28602
@LCL // 28603
A=M // 28604
M=D // 28605

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END1}
// goto Int32.do_left_shift_bytes_div$IF_END1
@Int32.do_left_shift_bytes_div$IF_END1 // 28606
0;JMP // 28607

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE1}
// label Int32.do_left_shift_bytes_div$IF_FALSE1
(Int32.do_left_shift_bytes_div$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("this 0")
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 28608
A=M // 28609
D=M // 28610
@LCL // 28611
A=M // 28612
M=D // 28613

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END1}
// label Int32.do_left_shift_bytes_div$IF_END1
(Int32.do_left_shift_bytes_div$IF_END1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE2}}
@ARG // 28614
A=M+1 // 28615
A=A+1 // 28616
D=M // 28617
@SP // 28618
AM=M+1 // 28619
A=A-1 // 28620
M=D // 28621
// call Int32.is_negative
@6 // 28622
D=A // 28623
@14 // 28624
M=D // 28625
@Int32.is_negative // 28626
D=A // 28627
@13 // 28628
M=D // 28629
@Int32.do_left_shift_bytes_div.ret.7 // 28630
D=A // 28631
@CALL // 28632
0;JMP // 28633
(Int32.do_left_shift_bytes_div.ret.7)
@SP // 28634
AM=M-1 // 28635
D=M // 28636
@Int32.do_left_shift_bytes_div$IF_TRUE2 // 28637
D;JNE // 28638

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE2}
// goto Int32.do_left_shift_bytes_div$IF_FALSE2
@Int32.do_left_shift_bytes_div$IF_FALSE2 // 28639
0;JMP // 28640

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE2}
// label Int32.do_left_shift_bytes_div$IF_TRUE2
(Int32.do_left_shift_bytes_div$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 28641
A=M+1 // 28642
A=A+1 // 28643
D=M // 28644
@SP // 28645
AM=M+1 // 28646
A=A-1 // 28647
M=D // 28648
// call Int32.clone
@6 // 28649
D=A // 28650
@14 // 28651
M=D // 28652
@Int32.clone // 28653
D=A // 28654
@13 // 28655
M=D // 28656
@Int32.do_left_shift_bytes_div.ret.8 // 28657
D=A // 28658
@CALL // 28659
0;JMP // 28660
(Int32.do_left_shift_bytes_div.ret.8)
@SP // 28661
AM=M-1 // 28662
D=M // 28663
@LCL // 28664
A=M+1 // 28665
A=A+1 // 28666
A=A+1 // 28667
M=D // 28668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28669
A=M+1 // 28670
A=A+1 // 28671
A=A+1 // 28672
D=M // 28673
@SP // 28674
AM=M+1 // 28675
A=A-1 // 28676
M=D // 28677
// call Int32.do_abs
@6 // 28678
D=A // 28679
@14 // 28680
M=D // 28681
@Int32.do_abs // 28682
D=A // 28683
@13 // 28684
M=D // 28685
@Int32.do_left_shift_bytes_div.ret.9 // 28686
D=A // 28687
@CALL // 28688
0;JMP // 28689
(Int32.do_left_shift_bytes_div.ret.9)
@SP // 28690
M=M-1 // 28691

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28692
A=M+1 // 28693
A=A+1 // 28694
A=A+1 // 28695
D=M // 28696
@SP // 28697
AM=M+1 // 28698
A=A-1 // 28699
M=D // 28700
// call Int32.getParts
@6 // 28701
D=A // 28702
@14 // 28703
M=D // 28704
@Int32.getParts // 28705
D=A // 28706
@13 // 28707
M=D // 28708
@Int32.do_left_shift_bytes_div.ret.10 // 28709
D=A // 28710
@CALL // 28711
0;JMP // 28712
(Int32.do_left_shift_bytes_div.ret.10)
@SP // 28713
AM=M-1 // 28714
D=M // 28715
@LCL // 28716
A=M+1 // 28717
M=D // 28718

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END2}
// goto Int32.do_left_shift_bytes_div$IF_END2
@Int32.do_left_shift_bytes_div$IF_END2 // 28719
0;JMP // 28720

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE2}
// label Int32.do_left_shift_bytes_div$IF_FALSE2
(Int32.do_left_shift_bytes_div$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 28721
A=M+1 // 28722
A=A+1 // 28723
D=M // 28724
@SP // 28725
AM=M+1 // 28726
A=A-1 // 28727
M=D // 28728
// call Int32.getParts
@6 // 28729
D=A // 28730
@14 // 28731
M=D // 28732
@Int32.getParts // 28733
D=A // 28734
@13 // 28735
M=D // 28736
@Int32.do_left_shift_bytes_div.ret.11 // 28737
D=A // 28738
@CALL // 28739
0;JMP // 28740
(Int32.do_left_shift_bytes_div.ret.11)
@SP // 28741
AM=M-1 // 28742
D=M // 28743
@LCL // 28744
A=M+1 // 28745
M=D // 28746

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END2}
// label Int32.do_left_shift_bytes_div$IF_END2
(Int32.do_left_shift_bytes_div$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 5}
//}

@8 // 28747
D=A // 28748
@SP // 28749
AM=M+1 // 28750
A=A-1 // 28751
M=D // 28752
// call Memory.alloc
@6 // 28753
D=A // 28754
@14 // 28755
M=D // 28756
@Memory.alloc // 28757
D=A // 28758
@13 // 28759
M=D // 28760
@Int32.do_left_shift_bytes_div.ret.12 // 28761
D=A // 28762
@CALL // 28763
0;JMP // 28764
(Int32.do_left_shift_bytes_div.ret.12)
@LCL // 28765
D=M // 28766
@5 // 28767
A=D+A // 28768
D=A // 28769
@R13 // 28770
M=D // 28771
@SP // 28772
AM=M-1 // 28773
D=M // 28774
@R13 // 28775
A=M // 28776
M=D // 28777

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 28778
D=M // 28779
@10 // 28780
A=D+A // 28781
M=0 // 28782

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP1}
// label Int32.do_left_shift_bytes_div_WHILE_EXP1
(Int32.do_left_shift_bytes_div_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 10"),
//        right:
//            PushInstruction("constant 8"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END1}}
@Int32.do_left_shift_bytes_div.LT.100 // 28783
D=A // 28784
@SP // 28785
AM=M+1 // 28786
A=A-1 // 28787
M=D // 28788
@LCL // 28789
D=M // 28790
@10 // 28791
A=D+A // 28792
D=M // 28793
@8 // 28794
D=D-A // 28795
@DO_LT // 28796
0;JMP // 28797
(Int32.do_left_shift_bytes_div.LT.100)
D=!D // 28798
@Int32.do_left_shift_bytes_div_WHILE_END1 // 28799
D;JNE // 28800

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                UnaryPushGroup(                    BinaryPushGroup(
//                        left:
//                            BinaryPushGroup(
//                                left:
//                                    PushInstruction("local 10"),
//                                right:
//                                    PushInstruction("argument 1"),
//                                binaryOp: "SUB"
//                            ),
//                        right:
//                            PushInstruction("constant 0"),
//                        binaryOp: "LT"
//                    ),
//NOT),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 10"),
//                    right:
//                        PushInstruction("argument 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE3}}
@Int32.do_left_shift_bytes_div.LT.101 // 28801
D=A // 28802
@SP // 28803
AM=M+1 // 28804
A=A-1 // 28805
M=D // 28806
@Int32.do_left_shift_bytes_div.LT.102 // 28807
D=A // 28808
@SP // 28809
AM=M+1 // 28810
A=A-1 // 28811
M=D // 28812
@LCL // 28813
D=M // 28814
@10 // 28815
A=D+A // 28816
D=M // 28817
@SP // 28818
AM=M+1 // 28819
A=A-1 // 28820
M=D // 28821
@ARG // 28822
A=M+1 // 28823
D=M // 28824
@SP // 28825
AM=M-1 // 28826
D=M-D // 28827
@DO_LT // 28828
0;JMP // 28829
(Int32.do_left_shift_bytes_div.LT.102)
@SP // 28830
AM=M+1 // 28831
A=A-1 // 28832
M=D // 28833
@SP // 28834
A=M-1 // 28835
M=!D // 28836
@LCL // 28837
D=M // 28838
@10 // 28839
A=D+A // 28840
D=M // 28841
@SP // 28842
AM=M+1 // 28843
A=A-1 // 28844
M=D // 28845
@ARG // 28846
A=M+1 // 28847
D=M // 28848
@SP // 28849
AM=M-1 // 28850
D=M-D // 28851
@SP // 28852
AM=M-1 // 28853
D=D&M // 28854
@4 // 28855
D=D-A // 28856
@DO_LT // 28857
0;JMP // 28858
(Int32.do_left_shift_bytes_div.LT.101)
@Int32.do_left_shift_bytes_div$IF_TRUE3 // 28859
D;JNE // 28860

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE3}
// goto Int32.do_left_shift_bytes_div$IF_FALSE3
@Int32.do_left_shift_bytes_div$IF_FALSE3 // 28861
0;JMP // 28862

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE3}
// label Int32.do_left_shift_bytes_div$IF_TRUE3
(Int32.do_left_shift_bytes_div$IF_TRUE3)

////PushWriter{source=Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 10"),
//                    right:
//                        PushInstruction("argument 1"),
//                    binaryOp: "SUB"
//                ),
//            binaryOp: "ADD"
//        )
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 10"),
//    binaryOp: "ADD"
//)}
@LCL // 28863
D=M // 28864
@5 // 28865
A=D+A // 28866
D=M // 28867
@SP // 28868
AM=M+1 // 28869
A=A-1 // 28870
M=D // 28871
@LCL // 28872
D=M // 28873
@10 // 28874
A=D+A // 28875
D=M // 28876
@SP // 28877
AM=M-1 // 28878
D=D+M // 28879
@SP // 28880
AM=M+1 // 28881
A=A-1 // 28882
M=D // 28883
@LCL // 28884
A=M // 28885
D=M // 28886
@SP // 28887
AM=M+1 // 28888
A=A-1 // 28889
M=D // 28890
@LCL // 28891
D=M // 28892
@10 // 28893
A=D+A // 28894
D=M // 28895
@SP // 28896
AM=M+1 // 28897
A=A-1 // 28898
M=D // 28899
@ARG // 28900
A=M+1 // 28901
D=M // 28902
@SP // 28903
AM=M-1 // 28904
D=M-D // 28905
@SP // 28906
AM=M-1 // 28907
A=D+M // 28908
D=M // 28909
@SP // 28910
AM=M-1 // 28911
A=M // 28912
M=D // 28913

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END3}
// goto Int32.do_left_shift_bytes_div$IF_END3
@Int32.do_left_shift_bytes_div$IF_END3 // 28914
0;JMP // 28915

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE3}
// label Int32.do_left_shift_bytes_div$IF_FALSE3
(Int32.do_left_shift_bytes_div$IF_FALSE3)

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 10"),
//    binaryOp: "ADD"
//)}
@LCL // 28916
D=M // 28917
@5 // 28918
A=D+A // 28919
D=M // 28920
@SP // 28921
AM=M+1 // 28922
A=A-1 // 28923
M=D // 28924
@LCL // 28925
D=M // 28926
@10 // 28927
A=D+A // 28928
D=M // 28929
@SP // 28930
AM=M-1 // 28931
D=D+M // 28932
@SP // 28933
AM=M+1 // 28934
A=A-1 // 28935
M=D // 28936
D=0 // 28937
@SP // 28938
AM=M-1 // 28939
A=M // 28940
M=D // 28941

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END3}
// label Int32.do_left_shift_bytes_div$IF_END3
(Int32.do_left_shift_bytes_div$IF_END3)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 28942
D=M // 28943
@10 // 28944
A=D+A // 28945
M=M+1 // 28946

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP1}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP1
@Int32.do_left_shift_bytes_div_WHILE_EXP1 // 28947
0;JMP // 28948

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END1}
// label Int32.do_left_shift_bytes_div_WHILE_END1
(Int32.do_left_shift_bytes_div_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 6}
//}

@16 // 28949
D=A // 28950
@SP // 28951
AM=M+1 // 28952
A=A-1 // 28953
M=D // 28954
// call Memory.alloc
@6 // 28955
D=A // 28956
@14 // 28957
M=D // 28958
@Memory.alloc // 28959
D=A // 28960
@13 // 28961
M=D // 28962
@Int32.do_left_shift_bytes_div.ret.13 // 28963
D=A // 28964
@CALL // 28965
0;JMP // 28966
(Int32.do_left_shift_bytes_div.ret.13)
@LCL // 28967
D=M // 28968
@6 // 28969
A=D+A // 28970
D=A // 28971
@R13 // 28972
M=D // 28973
@SP // 28974
AM=M-1 // 28975
D=M // 28976
@R13 // 28977
A=M // 28978
M=D // 28979

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 28980
D=M // 28981
@10 // 28982
A=D+A // 28983
M=0 // 28984

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP2}
// label Int32.do_left_shift_bytes_div_WHILE_EXP2
(Int32.do_left_shift_bytes_div_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 10"),
//        right:
//            PushInstruction("constant 8"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END2}}
@Int32.do_left_shift_bytes_div.LT.103 // 28985
D=A // 28986
@SP // 28987
AM=M+1 // 28988
A=A-1 // 28989
M=D // 28990
@LCL // 28991
D=M // 28992
@10 // 28993
A=D+A // 28994
D=M // 28995
@8 // 28996
D=D-A // 28997
@DO_LT // 28998
0;JMP // 28999
(Int32.do_left_shift_bytes_div.LT.103)
D=!D // 29000
@Int32.do_left_shift_bytes_div_WHILE_END2 // 29001
D;JNE // 29002

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 5"),
//                    right:
//                        PushInstruction("local 10"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 29003
D=M // 29004
@6 // 29005
A=D+A // 29006
D=M // 29007
@SP // 29008
AM=M+1 // 29009
A=A-1 // 29010
M=D // 29011
@LCL // 29012
D=M // 29013
@10 // 29014
A=D+A // 29015
D=M // 29016
D=D+1 // 29017
@SP // 29018
AM=M-1 // 29019
D=D+M // 29020
@SP // 29021
AM=M+1 // 29022
A=A-1 // 29023
M=D // 29024
@LCL // 29025
D=M // 29026
@5 // 29027
A=D+A // 29028
D=M // 29029
@SP // 29030
AM=M+1 // 29031
A=A-1 // 29032
M=D // 29033
@LCL // 29034
D=M // 29035
@10 // 29036
A=D+A // 29037
D=M // 29038
@SP // 29039
AM=M-1 // 29040
A=D+M // 29041
D=M // 29042
@15 // 29043
D=D&A // 29044
@SP // 29045
AM=M-1 // 29046
A=M // 29047
M=D // 29048

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 5"),
//            right:
//                PushInstruction("local 10"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 10"),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 29049
D=M // 29050
@6 // 29051
A=D+A // 29052
D=M // 29053
@SP // 29054
AM=M+1 // 29055
A=A-1 // 29056
M=D // 29057
@LCL // 29058
D=M // 29059
@10 // 29060
A=D+A // 29061
D=M // 29062
D=D+1 // 29063
D=D+1 // 29064
@SP // 29065
AM=M-1 // 29066
D=D+M // 29067
@SP // 29068
AM=M+1 // 29069
A=A-1 // 29070
M=D // 29071
@LCL // 29072
D=M // 29073
@5 // 29074
A=D+A // 29075
D=M // 29076
@SP // 29077
AM=M+1 // 29078
A=A-1 // 29079
M=D // 29080
@LCL // 29081
D=M // 29082
@10 // 29083
A=D+A // 29084
D=M // 29085
@SP // 29086
AM=M-1 // 29087
A=D+M // 29088
D=M // 29089
@SP // 29090
AM=M+1 // 29091
A=A-1 // 29092
M=D // 29093
@4 // 29094
D=A // 29095
@SP // 29096
AM=M+1 // 29097
A=A-1 // 29098
M=D // 29099
// call Int32.arith_rightshift
@7 // 29100
D=A // 29101
@14 // 29102
M=D // 29103
@Int32.arith_rightshift // 29104
D=A // 29105
@13 // 29106
M=D // 29107
@Int32.do_left_shift_bytes_div.ret.14 // 29108
D=A // 29109
@CALL // 29110
0;JMP // 29111
(Int32.do_left_shift_bytes_div.ret.14)
@SP // 29112
AM=M-1 // 29113
D=M // 29114
@SP // 29115
AM=M-1 // 29116
A=M // 29117
M=D // 29118

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29119
D=M // 29120
@10 // 29121
A=D+A // 29122
M=M+1 // 29123

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP2}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP2
@Int32.do_left_shift_bytes_div_WHILE_EXP2 // 29124
0;JMP // 29125

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END2}
// label Int32.do_left_shift_bytes_div_WHILE_END2
(Int32.do_left_shift_bytes_div_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 7}
//}

@8 // 29126
D=A // 29127
@SP // 29128
AM=M+1 // 29129
A=A-1 // 29130
M=D // 29131
// call Memory.alloc
@6 // 29132
D=A // 29133
@14 // 29134
M=D // 29135
@Memory.alloc // 29136
D=A // 29137
@13 // 29138
M=D // 29139
@Int32.do_left_shift_bytes_div.ret.15 // 29140
D=A // 29141
@CALL // 29142
0;JMP // 29143
(Int32.do_left_shift_bytes_div.ret.15)
@LCL // 29144
D=M // 29145
@7 // 29146
A=D+A // 29147
D=A // 29148
@R13 // 29149
M=D // 29150
@SP // 29151
AM=M-1 // 29152
D=M // 29153
@R13 // 29154
A=M // 29155
M=D // 29156

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29157
D=M // 29158
@10 // 29159
A=D+A // 29160
M=0 // 29161

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP3}
// label Int32.do_left_shift_bytes_div_WHILE_EXP3
(Int32.do_left_shift_bytes_div_WHILE_EXP3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 10"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END3}}
@Int32.do_left_shift_bytes_div.LT.104 // 29162
D=A // 29163
@SP // 29164
AM=M+1 // 29165
A=A-1 // 29166
M=D // 29167
@LCL // 29168
D=M // 29169
@10 // 29170
A=D+A // 29171
D=M // 29172
@4 // 29173
D=D-A // 29174
@DO_LT // 29175
0;JMP // 29176
(Int32.do_left_shift_bytes_div.LT.104)
D=!D // 29177
@Int32.do_left_shift_bytes_div_WHILE_END3 // 29178
D;JNE // 29179

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 1"),
//                    right:
//                        PushInstruction("local 10"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 7"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 10"),
//            right:
//                PushInstruction("local 10"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 29180
D=M // 29181
@7 // 29182
A=D+A // 29183
D=M // 29184
@SP // 29185
AM=M+1 // 29186
A=A-1 // 29187
M=D // 29188
@LCL // 29189
D=M // 29190
@10 // 29191
A=D+A // 29192
D=M // 29193
D=D+M // 29194
@SP // 29195
AM=M-1 // 29196
D=D+M // 29197
@SP // 29198
AM=M+1 // 29199
A=A-1 // 29200
M=D // 29201
@LCL // 29202
A=M+1 // 29203
D=M // 29204
@SP // 29205
AM=M+1 // 29206
A=A-1 // 29207
M=D // 29208
@LCL // 29209
D=M // 29210
@10 // 29211
A=D+A // 29212
D=M // 29213
@SP // 29214
AM=M-1 // 29215
A=D+M // 29216
D=M // 29217
@15 // 29218
D=D&A // 29219
@SP // 29220
AM=M-1 // 29221
A=M // 29222
M=D // 29223

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("local 10"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 7"),
//    right:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 10"),
//                    right:
//                        PushInstruction("local 10"),
//                    binaryOp: "ADD"
//                ),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 29224
D=M // 29225
@7 // 29226
A=D+A // 29227
D=M // 29228
@SP // 29229
AM=M+1 // 29230
A=A-1 // 29231
M=D // 29232
@LCL // 29233
D=M // 29234
@10 // 29235
A=D+A // 29236
D=M // 29237
D=D+M // 29238
D=D+1 // 29239
@SP // 29240
AM=M-1 // 29241
D=D+M // 29242
@SP // 29243
AM=M+1 // 29244
A=A-1 // 29245
M=D // 29246
@LCL // 29247
A=M+1 // 29248
D=M // 29249
@SP // 29250
AM=M+1 // 29251
A=A-1 // 29252
M=D // 29253
@LCL // 29254
D=M // 29255
@10 // 29256
A=D+A // 29257
D=M // 29258
@SP // 29259
AM=M-1 // 29260
A=D+M // 29261
D=M // 29262
@SP // 29263
AM=M+1 // 29264
A=A-1 // 29265
M=D // 29266
@4 // 29267
D=A // 29268
@SP // 29269
AM=M+1 // 29270
A=A-1 // 29271
M=D // 29272
// call Int32.arith_rightshift
@7 // 29273
D=A // 29274
@14 // 29275
M=D // 29276
@Int32.arith_rightshift // 29277
D=A // 29278
@13 // 29279
M=D // 29280
@Int32.do_left_shift_bytes_div.ret.16 // 29281
D=A // 29282
@CALL // 29283
0;JMP // 29284
(Int32.do_left_shift_bytes_div.ret.16)
@SP // 29285
AM=M-1 // 29286
D=M // 29287
@SP // 29288
AM=M-1 // 29289
A=M // 29290
M=D // 29291

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29292
D=M // 29293
@10 // 29294
A=D+A // 29295
M=M+1 // 29296

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP3}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP3
@Int32.do_left_shift_bytes_div_WHILE_EXP3 // 29297
0;JMP // 29298

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END3}
// label Int32.do_left_shift_bytes_div_WHILE_END3
(Int32.do_left_shift_bytes_div_WHILE_END3)

////PushPopPair {
//  push: PushInstruction("constant 255")
//  pop:  PopInstruction{address=local 9}
//}

@255 // 29299
D=A // 29300
@SP // 29301
AM=M+1 // 29302
A=A-1 // 29303
M=D // 29304
@LCL // 29305
D=M // 29306
@9 // 29307
A=D+A // 29308
D=A // 29309
@R13 // 29310
M=D // 29311
@SP // 29312
AM=M-1 // 29313
D=M // 29314
@R13 // 29315
A=M // 29316
M=D // 29317

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 10}
//}

@7 // 29318
D=A // 29319
@SP // 29320
AM=M+1 // 29321
A=A-1 // 29322
M=D // 29323
@LCL // 29324
D=M // 29325
@10 // 29326
A=D+A // 29327
D=A // 29328
@R13 // 29329
M=D // 29330
@SP // 29331
AM=M-1 // 29332
D=M // 29333
@R13 // 29334
A=M // 29335
M=D // 29336

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP4}
// label Int32.do_left_shift_bytes_div_WHILE_EXP4
(Int32.do_left_shift_bytes_div_WHILE_EXP4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END4}}
@Int32.do_left_shift_bytes_div.LT.105 // 29337
D=A // 29338
@SP // 29339
AM=M+1 // 29340
A=A-1 // 29341
M=D // 29342
@LCL // 29343
D=M // 29344
@10 // 29345
A=D+A // 29346
D=M // 29347
@DO_LT // 29348
0;JMP // 29349
(Int32.do_left_shift_bytes_div.LT.105)
@Int32.do_left_shift_bytes_div_WHILE_END4 // 29350
D;JNE // 29351

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 7"),
//                    right:
//                        PushInstruction("local 10"),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE4}}
@Int32.do_left_shift_bytes_div.GT.106 // 29352
D=A // 29353
@SP // 29354
AM=M+1 // 29355
A=A-1 // 29356
M=D // 29357
@LCL // 29358
D=M // 29359
@10 // 29360
A=D+A // 29361
D=M // 29362
A=A-1 // 29363
A=A-1 // 29364
A=A-1 // 29365
A=D+M // 29366
D=M // 29367
@DO_GT // 29368
0;JMP // 29369
(Int32.do_left_shift_bytes_div.GT.106)
@Int32.do_left_shift_bytes_div$IF_TRUE4 // 29370
D;JNE // 29371

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END4}
// goto Int32.do_left_shift_bytes_div$IF_END4
@Int32.do_left_shift_bytes_div$IF_END4 // 29372
0;JMP // 29373

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE4}
// label Int32.do_left_shift_bytes_div$IF_TRUE4
(Int32.do_left_shift_bytes_div$IF_TRUE4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 29374
D=M // 29375
@10 // 29376
A=D+A // 29377
D=M // 29378
@SP // 29379
AM=M+1 // 29380
A=A-1 // 29381
M=D+1 // 29382
@LCL // 29383
D=M // 29384
@9 // 29385
A=D+A // 29386
D=A // 29387
@R13 // 29388
M=D // 29389
@SP // 29390
AM=M-1 // 29391
D=M // 29392
@R13 // 29393
A=M // 29394
M=D // 29395

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29396
D=M // 29397
@10 // 29398
A=D+A // 29399
M=-1 // 29400

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END4}
// label Int32.do_left_shift_bytes_div$IF_END4
(Int32.do_left_shift_bytes_div$IF_END4)

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29401
D=M // 29402
@10 // 29403
A=D+A // 29404
M=M-1 // 29405

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP4}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP4
@Int32.do_left_shift_bytes_div_WHILE_EXP4 // 29406
0;JMP // 29407

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END4}
// label Int32.do_left_shift_bytes_div_WHILE_END4
(Int32.do_left_shift_bytes_div_WHILE_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 7"), PushInstruction("local 9")], call=CallInstruction{Int32.u4_array_div_u4_array}}
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 29408
D=M // 29409
@6 // 29410
A=D+A // 29411
D=M // 29412
@SP // 29413
AM=M+1 // 29414
A=A-1 // 29415
M=D // 29416
@LCL // 29417
D=M // 29418
@7 // 29419
A=D+A // 29420
D=M // 29421
@SP // 29422
AM=M+1 // 29423
A=A-1 // 29424
M=D // 29425
@LCL // 29426
D=M // 29427
@9 // 29428
A=D+A // 29429
D=M // 29430
@SP // 29431
AM=M+1 // 29432
A=A-1 // 29433
M=D // 29434
// call Int32.u4_array_div_u4_array
@8 // 29435
D=A // 29436
@14 // 29437
M=D // 29438
@Int32.u4_array_div_u4_array // 29439
D=A // 29440
@13 // 29441
M=D // 29442
@Int32.do_left_shift_bytes_div.ret.17 // 29443
D=A // 29444
@CALL // 29445
0;JMP // 29446
(Int32.do_left_shift_bytes_div.ret.17)
@LCL // 29447
D=M // 29448
@8 // 29449
A=D+A // 29450
D=A // 29451
@R13 // 29452
M=D // 29453
@SP // 29454
AM=M-1 // 29455
D=M // 29456
@R13 // 29457
A=M // 29458
M=D // 29459

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29460
D=M // 29461
@10 // 29462
A=D+A // 29463
M=0 // 29464

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP5}
// label Int32.do_left_shift_bytes_div_WHILE_EXP5
(Int32.do_left_shift_bytes_div_WHILE_EXP5)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 10"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END5}}
@Int32.do_left_shift_bytes_div.LT.107 // 29465
D=A // 29466
@SP // 29467
AM=M+1 // 29468
A=A-1 // 29469
M=D // 29470
@LCL // 29471
D=M // 29472
@10 // 29473
A=D+A // 29474
D=M // 29475
@4 // 29476
D=D-A // 29477
@DO_LT // 29478
0;JMP // 29479
(Int32.do_left_shift_bytes_div.LT.107)
D=!D // 29480
@Int32.do_left_shift_bytes_div_WHILE_END5 // 29481
D;JNE // 29482

////PushWriter{source=BinaryPushGroup(
//    left:
//        Dereference(
//            base:
//                BinaryPushGroup(
//                    left:
//                        PushInstruction("local 8"),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 10"),
//                            right:
//                                PushInstruction("local 10"),
//                            binaryOp: "ADD"
//                        ),
//                    binaryOp: "ADD"
//                )
//        ),
//    right:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 8"),
//            right:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 10"),
//                            right:
//                                PushInstruction("local 10"),
//                            binaryOp: "ADD"
//                        ),
//                    right:
//                        PushInstruction("constant 1"),
//                    binaryOp: "ADD"
//                ),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 16")], call=CallInstruction{Math.multiply}},
//    binaryOp: "ADD"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 10"),
//    binaryOp: "ADD"
//)}
@THIS // 29483
A=M // 29484
D=M // 29485
@SP // 29486
AM=M+1 // 29487
A=A-1 // 29488
M=D // 29489
@LCL // 29490
D=M // 29491
@10 // 29492
A=D+A // 29493
D=M // 29494
@SP // 29495
AM=M-1 // 29496
D=D+M // 29497
@SP // 29498
AM=M+1 // 29499
A=A-1 // 29500
M=D // 29501
@LCL // 29502
D=M // 29503
@8 // 29504
A=D+A // 29505
D=M // 29506
@SP // 29507
AM=M+1 // 29508
A=A-1 // 29509
M=D // 29510
@LCL // 29511
D=M // 29512
@10 // 29513
A=D+A // 29514
D=M // 29515
D=D+M // 29516
@SP // 29517
AM=M-1 // 29518
A=D+M // 29519
D=M // 29520
@SP // 29521
AM=M+1 // 29522
A=A-1 // 29523
M=D // 29524
@LCL // 29525
D=M // 29526
@8 // 29527
A=D+A // 29528
D=M // 29529
@SP // 29530
AM=M+1 // 29531
A=A-1 // 29532
M=D // 29533
@LCL // 29534
D=M // 29535
@10 // 29536
A=D+A // 29537
D=M // 29538
D=D+M // 29539
D=D+1 // 29540
@SP // 29541
AM=M-1 // 29542
A=D+M // 29543
D=M // 29544
@SP // 29545
AM=M+1 // 29546
A=A-1 // 29547
M=D // 29548
@16 // 29549
D=A // 29550
@SP // 29551
AM=M+1 // 29552
A=A-1 // 29553
M=D // 29554
// call Math.multiply
@7 // 29555
D=A // 29556
@14 // 29557
M=D // 29558
@Math.multiply // 29559
D=A // 29560
@13 // 29561
M=D // 29562
@Int32.do_left_shift_bytes_div.ret.18 // 29563
D=A // 29564
@CALL // 29565
0;JMP // 29566
(Int32.do_left_shift_bytes_div.ret.18)
@SP // 29567
AM=M-1 // 29568
D=M // 29569
@SP // 29570
AM=M-1 // 29571
D=D+M // 29572
@SP // 29573
AM=M-1 // 29574
A=M // 29575
M=D // 29576

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29577
D=M // 29578
@10 // 29579
A=D+A // 29580
M=M+1 // 29581

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP5}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP5
@Int32.do_left_shift_bytes_div_WHILE_EXP5 // 29582
0;JMP // 29583

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END5}
// label Int32.do_left_shift_bytes_div_WHILE_END5
(Int32.do_left_shift_bytes_div_WHILE_END5)

////ConditionalGroup{push=PushInstruction("local 4"), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE5}}
@LCL // 29584
D=M // 29585
@4 // 29586
A=D+A // 29587
D=M // 29588
@Int32.do_left_shift_bytes_div$IF_TRUE5 // 29589
D;JNE // 29590

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END5}
// goto Int32.do_left_shift_bytes_div$IF_END5
@Int32.do_left_shift_bytes_div$IF_END5 // 29591
0;JMP // 29592

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE5}
// label Int32.do_left_shift_bytes_div$IF_TRUE5
(Int32.do_left_shift_bytes_div$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 29593
D=M // 29594
@SP // 29595
AM=M+1 // 29596
A=A-1 // 29597
M=D // 29598
// call Int32.do_neg
@6 // 29599
D=A // 29600
@14 // 29601
M=D // 29602
@Int32.do_neg // 29603
D=A // 29604
@13 // 29605
M=D // 29606
@Int32.do_left_shift_bytes_div.ret.19 // 29607
D=A // 29608
@CALL // 29609
0;JMP // 29610
(Int32.do_left_shift_bytes_div.ret.19)
@SP // 29611
M=M-1 // 29612

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END5}
// label Int32.do_left_shift_bytes_div$IF_END5
(Int32.do_left_shift_bytes_div$IF_END5)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE6}}
@Int32.do_left_shift_bytes_div.EQ.108 // 29613
D=A // 29614
@SP // 29615
AM=M+1 // 29616
A=A-1 // 29617
M=D // 29618
@LCL // 29619
A=M+1 // 29620
A=A+1 // 29621
D=M // 29622
@DO_EQ // 29623
0;JMP // 29624
(Int32.do_left_shift_bytes_div.EQ.108)
D=!D // 29625
@Int32.do_left_shift_bytes_div$IF_TRUE6 // 29626
D;JNE // 29627

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END6}
// goto Int32.do_left_shift_bytes_div$IF_END6
@Int32.do_left_shift_bytes_div$IF_END6 // 29628
0;JMP // 29629

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE6}
// label Int32.do_left_shift_bytes_div$IF_TRUE6
(Int32.do_left_shift_bytes_div$IF_TRUE6)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29630
A=M+1 // 29631
A=A+1 // 29632
D=M // 29633
@SP // 29634
AM=M+1 // 29635
A=A-1 // 29636
M=D // 29637
// call Int32.dispose
@6 // 29638
D=A // 29639
@14 // 29640
M=D // 29641
@Int32.dispose // 29642
D=A // 29643
@13 // 29644
M=D // 29645
@Int32.do_left_shift_bytes_div.ret.20 // 29646
D=A // 29647
@CALL // 29648
0;JMP // 29649
(Int32.do_left_shift_bytes_div.ret.20)
@SP // 29650
M=M-1 // 29651

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END6}
// label Int32.do_left_shift_bytes_div$IF_END6
(Int32.do_left_shift_bytes_div$IF_END6)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE7}}
@Int32.do_left_shift_bytes_div.EQ.109 // 29652
D=A // 29653
@SP // 29654
AM=M+1 // 29655
A=A-1 // 29656
M=D // 29657
@LCL // 29658
A=M+1 // 29659
A=A+1 // 29660
A=A+1 // 29661
D=M // 29662
@DO_EQ // 29663
0;JMP // 29664
(Int32.do_left_shift_bytes_div.EQ.109)
D=!D // 29665
@Int32.do_left_shift_bytes_div$IF_TRUE7 // 29666
D;JNE // 29667

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END7}
// goto Int32.do_left_shift_bytes_div$IF_END7
@Int32.do_left_shift_bytes_div$IF_END7 // 29668
0;JMP // 29669

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE7}
// label Int32.do_left_shift_bytes_div$IF_TRUE7
(Int32.do_left_shift_bytes_div$IF_TRUE7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29670
A=M+1 // 29671
A=A+1 // 29672
A=A+1 // 29673
D=M // 29674
@SP // 29675
AM=M+1 // 29676
A=A-1 // 29677
M=D // 29678
// call Int32.dispose
@6 // 29679
D=A // 29680
@14 // 29681
M=D // 29682
@Int32.dispose // 29683
D=A // 29684
@13 // 29685
M=D // 29686
@Int32.do_left_shift_bytes_div.ret.21 // 29687
D=A // 29688
@CALL // 29689
0;JMP // 29690
(Int32.do_left_shift_bytes_div.ret.21)
@SP // 29691
M=M-1 // 29692

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END7}
// label Int32.do_left_shift_bytes_div$IF_END7
(Int32.do_left_shift_bytes_div$IF_END7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29693
D=M // 29694
@5 // 29695
A=D+A // 29696
D=M // 29697
@SP // 29698
AM=M+1 // 29699
A=A-1 // 29700
M=D // 29701
// call Memory.deAlloc
@6 // 29702
D=A // 29703
@14 // 29704
M=D // 29705
@Memory.deAlloc // 29706
D=A // 29707
@13 // 29708
M=D // 29709
@Int32.do_left_shift_bytes_div.ret.22 // 29710
D=A // 29711
@CALL // 29712
0;JMP // 29713
(Int32.do_left_shift_bytes_div.ret.22)
@SP // 29714
M=M-1 // 29715

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29716
D=M // 29717
@6 // 29718
A=D+A // 29719
D=M // 29720
@SP // 29721
AM=M+1 // 29722
A=A-1 // 29723
M=D // 29724
// call Memory.deAlloc
@6 // 29725
D=A // 29726
@14 // 29727
M=D // 29728
@Memory.deAlloc // 29729
D=A // 29730
@13 // 29731
M=D // 29732
@Int32.do_left_shift_bytes_div.ret.23 // 29733
D=A // 29734
@CALL // 29735
0;JMP // 29736
(Int32.do_left_shift_bytes_div.ret.23)
@SP // 29737
M=M-1 // 29738

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29739
D=M // 29740
@7 // 29741
A=D+A // 29742
D=M // 29743
@SP // 29744
AM=M+1 // 29745
A=A-1 // 29746
M=D // 29747
// call Memory.deAlloc
@6 // 29748
D=A // 29749
@14 // 29750
M=D // 29751
@Memory.deAlloc // 29752
D=A // 29753
@13 // 29754
M=D // 29755
@Int32.do_left_shift_bytes_div.ret.24 // 29756
D=A // 29757
@CALL // 29758
0;JMP // 29759
(Int32.do_left_shift_bytes_div.ret.24)
@SP // 29760
M=M-1 // 29761

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29762
D=M // 29763
@8 // 29764
A=D+A // 29765
D=M // 29766
@SP // 29767
AM=M+1 // 29768
A=A-1 // 29769
M=D // 29770
// call Memory.deAlloc
@6 // 29771
D=A // 29772
@14 // 29773
M=D // 29774
@Memory.deAlloc // 29775
D=A // 29776
@13 // 29777
M=D // 29778
@Int32.do_left_shift_bytes_div.ret.25 // 29779
D=A // 29780
@CALL // 29781
0;JMP // 29782
(Int32.do_left_shift_bytes_div.ret.25)
@SP // 29783
M=M-1 // 29784

////PushInstruction("constant 0")
@SP // 29785
AM=M+1 // 29786
A=A-1 // 29787
M=0 // 29788
@RETURN // 29789
0;JMP // 29790

////FunctionInstruction{functionName='Ray.getOrigin', numLocals=0, funcMapping={Ray.getDirection=0}}
// function Ray.getOrigin with 0
(Ray.getOrigin)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29791
A=M // 29792
D=M // 29793
@3 // 29794
M=D // 29795

////PushInstruction("this 0")
@THIS // 29796
A=M // 29797
D=M // 29798
@SP // 29799
AM=M+1 // 29800
A=A-1 // 29801
M=D // 29802
@RETURN // 29803
0;JMP // 29804

////FunctionInstruction{functionName='Ray.dispose', numLocals=0, funcMapping={Ray.getOrigin=0, Ray.getDirection=0}}
// function Ray.dispose with 0
(Ray.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29805
A=M // 29806
D=M // 29807
@3 // 29808
M=D // 29809

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Ray.0 // 29810
M=M-1 // 29811

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29812
A=M // 29813
D=M // 29814
@SP // 29815
AM=M+1 // 29816
A=A-1 // 29817
M=D // 29818
// call Vec3.dispose
@6 // 29819
D=A // 29820
@14 // 29821
M=D // 29822
@Vec3.dispose // 29823
D=A // 29824
@13 // 29825
M=D // 29826
@Ray.dispose.ret.0 // 29827
D=A // 29828
@CALL // 29829
0;JMP // 29830
(Ray.dispose.ret.0)
@SP // 29831
M=M-1 // 29832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29833
A=M+1 // 29834
D=M // 29835
@SP // 29836
AM=M+1 // 29837
A=A-1 // 29838
M=D // 29839
// call Vec3.dispose
@6 // 29840
D=A // 29841
@14 // 29842
M=D // 29843
@Vec3.dispose // 29844
D=A // 29845
@13 // 29846
M=D // 29847
@Ray.dispose.ret.1 // 29848
D=A // 29849
@CALL // 29850
0;JMP // 29851
(Ray.dispose.ret.1)
@SP // 29852
M=M-1 // 29853

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 29854
D=M // 29855
@SP // 29856
AM=M+1 // 29857
A=A-1 // 29858
M=D // 29859
// call Memory.deAlloc
@6 // 29860
D=A // 29861
@14 // 29862
M=D // 29863
@Memory.deAlloc // 29864
D=A // 29865
@13 // 29866
M=D // 29867
@Ray.dispose.ret.2 // 29868
D=A // 29869
@CALL // 29870
0;JMP // 29871
(Ray.dispose.ret.2)
@SP // 29872
M=M-1 // 29873

////PushInstruction("constant 0")
@SP // 29874
AM=M+1 // 29875
A=A-1 // 29876
M=0 // 29877
@RETURN // 29878
0;JMP // 29879

////FunctionInstruction{functionName='Number.is_zero', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.is_zero with 0
(Number.is_zero)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29880
A=M // 29881
D=M // 29882
@3 // 29883
M=D // 29884

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}}
@THIS // 29885
A=M // 29886
D=M // 29887
@SP // 29888
AM=M+1 // 29889
A=A-1 // 29890
M=D // 29891
// call Int32.is_zero
@6 // 29892
D=A // 29893
@14 // 29894
M=D // 29895
@Int32.is_zero // 29896
D=A // 29897
@13 // 29898
M=D // 29899
@Number.is_zero.ret.0 // 29900
D=A // 29901
@CALL // 29902
0;JMP // 29903
(Number.is_zero.ret.0)
@RETURN // 29904
0;JMP // 29905

////FunctionInstruction{functionName='Ray.new', numLocals=0, funcMapping={Ray.getOrigin=0, Ray.dispose=3, Ray.getDirection=0}}
// function Ray.new with 0
(Ray.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 29906
D=A // 29907
@SP // 29908
AM=M+1 // 29909
A=A-1 // 29910
M=D // 29911
// call Memory.alloc
@6 // 29912
D=A // 29913
@14 // 29914
M=D // 29915
@Memory.alloc // 29916
D=A // 29917
@13 // 29918
M=D // 29919
@Ray.new.ret.0 // 29920
D=A // 29921
@CALL // 29922
0;JMP // 29923
(Ray.new.ret.0)
@SP // 29924
AM=M-1 // 29925
D=M // 29926
@3 // 29927
M=D // 29928

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Ray.0 // 29929
M=M+1 // 29930

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 29931
A=M // 29932
D=M // 29933
@THIS // 29934
A=M // 29935
M=D // 29936

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 29937
A=M+1 // 29938
D=M // 29939
@THIS // 29940
A=M+1 // 29941
M=D // 29942

////PushInstruction("pointer 0")
@3 // 29943
D=M // 29944
@SP // 29945
AM=M+1 // 29946
A=A-1 // 29947
M=D // 29948
@RETURN // 29949
0;JMP // 29950

////FunctionInstruction{functionName='Number.new_from_int_frac', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.new_from_int_frac with 0
(Number.new_from_int_frac)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 29951
AM=M+1 // 29952
A=A-1 // 29953
M=1 // 29954
// call Memory.alloc
@6 // 29955
D=A // 29956
@14 // 29957
M=D // 29958
@Memory.alloc // 29959
D=A // 29960
@13 // 29961
M=D // 29962
@Number.new_from_int_frac.ret.0 // 29963
D=A // 29964
@CALL // 29965
0;JMP // 29966
(Number.new_from_int_frac.ret.0)
@SP // 29967
AM=M-1 // 29968
D=M // 29969
@3 // 29970
M=D // 29971

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 5"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 5}
//}

@Number.5 // 29972
M=M+1 // 29973

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 29974
A=M // 29975
D=M // 29976
@SP // 29977
AM=M+1 // 29978
A=A-1 // 29979
M=D // 29980
// call Int32.new
@6 // 29981
D=A // 29982
@14 // 29983
M=D // 29984
@Int32.new // 29985
D=A // 29986
@13 // 29987
M=D // 29988
@Number.new_from_int_frac.ret.1 // 29989
D=A // 29990
@CALL // 29991
0;JMP // 29992
(Number.new_from_int_frac.ret.1)
@SP // 29993
AM=M-1 // 29994
D=M // 29995
@THIS // 29996
A=M // 29997
M=D // 29998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 4")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29999
A=M // 30000
D=M // 30001
@SP // 30002
AM=M+1 // 30003
A=A-1 // 30004
M=D // 30005
@Number.4 // 30006
D=M // 30007
@SP // 30008
AM=M+1 // 30009
A=A-1 // 30010
M=D // 30011
// call Int32.do_mul
@7 // 30012
D=A // 30013
@14 // 30014
M=D // 30015
@Int32.do_mul // 30016
D=A // 30017
@13 // 30018
M=D // 30019
@Number.new_from_int_frac.ret.2 // 30020
D=A // 30021
@CALL // 30022
0;JMP // 30023
(Number.new_from_int_frac.ret.2)
@SP // 30024
M=M-1 // 30025

////PushInstruction("pointer 0")
@3 // 30026
D=M // 30027
@SP // 30028
AM=M+1 // 30029
A=A-1 // 30030
M=D // 30031
@RETURN // 30032
0;JMP // 30033

////FunctionInstruction{functionName='Scene.getWidth', numLocals=0, funcMapping={Scene.getHeight=0, Scene.getNumLights=0, Scene.getLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getWidth with 0
(Scene.getWidth)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 30034
A=M // 30035
D=M // 30036
@3 // 30037
M=D // 30038

////PushInstruction("this 0")
@THIS // 30039
A=M // 30040
D=M // 30041
@SP // 30042
AM=M+1 // 30043
A=A-1 // 30044
M=D // 30045
@RETURN // 30046
0;JMP // 30047

////FunctionInstruction{functionName='Sphere.intersect', numLocals=8, funcMapping={Sphere.new=1, Sphere.color=1, Sphere.dispose=4}}
// function Sphere.intersect with 8
(Sphere.intersect)
@8 // 30048
D=A // 30049
@SP // 30050
AM=D+M // 30051
A=A-1 // 30052
M=0 // 30053
A=A-1 // 30054
M=0 // 30055
A=A-1 // 30056
M=0 // 30057
A=A-1 // 30058
M=0 // 30059
A=A-1 // 30060
M=0 // 30061
A=A-1 // 30062
M=0 // 30063
A=A-1 // 30064
M=0 // 30065
A=A-1 // 30066
M=0 // 30067

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 30068
A=M // 30069
D=M // 30070
@3 // 30071
M=D // 30072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 30073
A=M // 30074
D=M // 30075
@SP // 30076
AM=M+1 // 30077
A=A-1 // 30078
M=D // 30079
// call Vec3.clone
@6 // 30080
D=A // 30081
@14 // 30082
M=D // 30083
@Vec3.clone // 30084
D=A // 30085
@13 // 30086
M=D // 30087
@Sphere.intersect.ret.0 // 30088
D=A // 30089
@CALL // 30090
0;JMP // 30091
(Sphere.intersect.ret.0)
@SP // 30092
AM=M-1 // 30093
D=M // 30094
@LCL // 30095
A=M // 30096
M=D // 30097

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getOrigin}}], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30098
A=M // 30099
D=M // 30100
@SP // 30101
AM=M+1 // 30102
A=A-1 // 30103
M=D // 30104
@ARG // 30105
A=M+1 // 30106
D=M // 30107
@SP // 30108
AM=M+1 // 30109
A=A-1 // 30110
M=D // 30111
// call Ray.getOrigin
@6 // 30112
D=A // 30113
@14 // 30114
M=D // 30115
@Ray.getOrigin // 30116
D=A // 30117
@13 // 30118
M=D // 30119
@Sphere.intersect.ret.1 // 30120
D=A // 30121
@CALL // 30122
0;JMP // 30123
(Sphere.intersect.ret.1)
// call Vec3.do_sub
@7 // 30124
D=A // 30125
@14 // 30126
M=D // 30127
@Vec3.do_sub // 30128
D=A // 30129
@13 // 30130
M=D // 30131
@Sphere.intersect.ret.2 // 30132
D=A // 30133
@CALL // 30134
0;JMP // 30135
(Sphere.intersect.ret.2)
@SP // 30136
M=M-1 // 30137

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 30138
A=M // 30139
D=M // 30140
@SP // 30141
AM=M+1 // 30142
A=A-1 // 30143
M=D // 30144
@ARG // 30145
A=M+1 // 30146
D=M // 30147
@SP // 30148
AM=M+1 // 30149
A=A-1 // 30150
M=D // 30151
// call Ray.getDirection
@6 // 30152
D=A // 30153
@14 // 30154
M=D // 30155
@Ray.getDirection // 30156
D=A // 30157
@13 // 30158
M=D // 30159
@Sphere.intersect.ret.3 // 30160
D=A // 30161
@CALL // 30162
0;JMP // 30163
(Sphere.intersect.ret.3)
// call Vec3.dot
@7 // 30164
D=A // 30165
@14 // 30166
M=D // 30167
@Vec3.dot // 30168
D=A // 30169
@13 // 30170
M=D // 30171
@Sphere.intersect.ret.4 // 30172
D=A // 30173
@CALL // 30174
0;JMP // 30175
(Sphere.intersect.ret.4)
@SP // 30176
AM=M-1 // 30177
D=M // 30178
@LCL // 30179
A=M+1 // 30180
M=D // 30181

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 30182
A=M+1 // 30183
D=M // 30184
@SP // 30185
AM=M+1 // 30186
A=A-1 // 30187
M=D // 30188
// call Number.clone
@6 // 30189
D=A // 30190
@14 // 30191
M=D // 30192
@Number.clone // 30193
D=A // 30194
@13 // 30195
M=D // 30196
@Sphere.intersect.ret.5 // 30197
D=A // 30198
@CALL // 30199
0;JMP // 30200
(Sphere.intersect.ret.5)
@SP // 30201
AM=M-1 // 30202
D=M // 30203
@LCL // 30204
A=M+1 // 30205
A=A+1 // 30206
M=D // 30207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30208
A=M+1 // 30209
A=A+1 // 30210
D=M // 30211
@SP // 30212
AM=M+1 // 30213
A=A-1 // 30214
M=D // 30215
@LCL // 30216
A=M+1 // 30217
D=M // 30218
@SP // 30219
AM=M+1 // 30220
A=A-1 // 30221
M=D // 30222
// call Number.do_mul
@7 // 30223
D=A // 30224
@14 // 30225
M=D // 30226
@Number.do_mul // 30227
D=A // 30228
@13 // 30229
M=D // 30230
@Sphere.intersect.ret.6 // 30231
D=A // 30232
@CALL // 30233
0;JMP // 30234
(Sphere.intersect.ret.6)
@SP // 30235
M=M-1 // 30236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@THIS // 30237
A=M+1 // 30238
D=M // 30239
@SP // 30240
AM=M+1 // 30241
A=A-1 // 30242
M=D // 30243
// call Number.clone
@6 // 30244
D=A // 30245
@14 // 30246
M=D // 30247
@Number.clone // 30248
D=A // 30249
@13 // 30250
M=D // 30251
@Sphere.intersect.ret.7 // 30252
D=A // 30253
@CALL // 30254
0;JMP // 30255
(Sphere.intersect.ret.7)
@SP // 30256
AM=M-1 // 30257
D=M // 30258
@LCL // 30259
A=M+1 // 30260
A=A+1 // 30261
A=A+1 // 30262
M=D // 30263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("this 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30264
A=M+1 // 30265
A=A+1 // 30266
A=A+1 // 30267
D=M // 30268
@SP // 30269
AM=M+1 // 30270
A=A-1 // 30271
M=D // 30272
@THIS // 30273
A=M+1 // 30274
D=M // 30275
@SP // 30276
AM=M+1 // 30277
A=A-1 // 30278
M=D // 30279
// call Number.do_mul
@7 // 30280
D=A // 30281
@14 // 30282
M=D // 30283
@Number.do_mul // 30284
D=A // 30285
@13 // 30286
M=D // 30287
@Sphere.intersect.ret.8 // 30288
D=A // 30289
@CALL // 30290
0;JMP // 30291
(Sphere.intersect.ret.8)
@SP // 30292
M=M-1 // 30293

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dist_sq}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 30294
A=M // 30295
D=M // 30296
@SP // 30297
AM=M+1 // 30298
A=A-1 // 30299
M=D // 30300
// call Vec3.dist_sq
@6 // 30301
D=A // 30302
@14 // 30303
M=D // 30304
@Vec3.dist_sq // 30305
D=A // 30306
@13 // 30307
M=D // 30308
@Sphere.intersect.ret.9 // 30309
D=A // 30310
@CALL // 30311
0;JMP // 30312
(Sphere.intersect.ret.9)
@LCL // 30313
D=M // 30314
@4 // 30315
A=D+A // 30316
D=A // 30317
@R13 // 30318
M=D // 30319
@SP // 30320
AM=M-1 // 30321
D=M // 30322
@R13 // 30323
A=M // 30324
M=D // 30325

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 2")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30326
D=M // 30327
@4 // 30328
A=D+A // 30329
D=M // 30330
@SP // 30331
AM=M+1 // 30332
A=A-1 // 30333
M=D // 30334
@LCL // 30335
A=M+1 // 30336
A=A+1 // 30337
D=M // 30338
@SP // 30339
AM=M+1 // 30340
A=A-1 // 30341
M=D // 30342
// call Number.do_sub
@7 // 30343
D=A // 30344
@14 // 30345
M=D // 30346
@Number.do_sub // 30347
D=A // 30348
@13 // 30349
M=D // 30350
@Sphere.intersect.ret.10 // 30351
D=A // 30352
@CALL // 30353
0;JMP // 30354
(Sphere.intersect.ret.10)
@SP // 30355
M=M-1 // 30356

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 3")], call=CallInstruction{Number.cmp}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE1}}
@Sphere.intersect.GT.110 // 30357
D=A // 30358
@SP // 30359
AM=M+1 // 30360
A=A-1 // 30361
M=D // 30362
@LCL // 30363
D=M // 30364
@4 // 30365
A=D+A // 30366
D=M // 30367
@SP // 30368
AM=M+1 // 30369
A=A-1 // 30370
M=D // 30371
@LCL // 30372
A=M+1 // 30373
A=A+1 // 30374
A=A+1 // 30375
D=M // 30376
@SP // 30377
AM=M+1 // 30378
A=A-1 // 30379
M=D // 30380
// call Number.cmp
@7 // 30381
D=A // 30382
@14 // 30383
M=D // 30384
@Number.cmp // 30385
D=A // 30386
@13 // 30387
M=D // 30388
@Sphere.intersect.ret.11 // 30389
D=A // 30390
@CALL // 30391
0;JMP // 30392
(Sphere.intersect.ret.11)
@SP // 30393
AM=M-1 // 30394
D=M // 30395
@DO_GT // 30396
0;JMP // 30397
(Sphere.intersect.GT.110)
@Sphere.intersect$IF_TRUE1 // 30398
D;JNE // 30399

////GotoInstruction{label='Sphere.intersect$IF_END1}
// goto Sphere.intersect$IF_END1
@Sphere.intersect$IF_END1 // 30400
0;JMP // 30401

////LabelInstruction{label='Sphere.intersect$IF_TRUE1}
// label Sphere.intersect$IF_TRUE1
(Sphere.intersect$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30402
A=M // 30403
D=M // 30404
@SP // 30405
AM=M+1 // 30406
A=A-1 // 30407
M=D // 30408
// call Vec3.dispose
@6 // 30409
D=A // 30410
@14 // 30411
M=D // 30412
@Vec3.dispose // 30413
D=A // 30414
@13 // 30415
M=D // 30416
@Sphere.intersect.ret.12 // 30417
D=A // 30418
@CALL // 30419
0;JMP // 30420
(Sphere.intersect.ret.12)
@SP // 30421
M=M-1 // 30422

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30423
A=M+1 // 30424
D=M // 30425
@SP // 30426
AM=M+1 // 30427
A=A-1 // 30428
M=D // 30429
// call Number.dispose
@6 // 30430
D=A // 30431
@14 // 30432
M=D // 30433
@Number.dispose // 30434
D=A // 30435
@13 // 30436
M=D // 30437
@Sphere.intersect.ret.13 // 30438
D=A // 30439
@CALL // 30440
0;JMP // 30441
(Sphere.intersect.ret.13)
@SP // 30442
M=M-1 // 30443

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30444
A=M+1 // 30445
A=A+1 // 30446
D=M // 30447
@SP // 30448
AM=M+1 // 30449
A=A-1 // 30450
M=D // 30451
// call Number.dispose
@6 // 30452
D=A // 30453
@14 // 30454
M=D // 30455
@Number.dispose // 30456
D=A // 30457
@13 // 30458
M=D // 30459
@Sphere.intersect.ret.14 // 30460
D=A // 30461
@CALL // 30462
0;JMP // 30463
(Sphere.intersect.ret.14)
@SP // 30464
M=M-1 // 30465

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30466
A=M+1 // 30467
A=A+1 // 30468
A=A+1 // 30469
D=M // 30470
@SP // 30471
AM=M+1 // 30472
A=A-1 // 30473
M=D // 30474
// call Number.dispose
@6 // 30475
D=A // 30476
@14 // 30477
M=D // 30478
@Number.dispose // 30479
D=A // 30480
@13 // 30481
M=D // 30482
@Sphere.intersect.ret.15 // 30483
D=A // 30484
@CALL // 30485
0;JMP // 30486
(Sphere.intersect.ret.15)
@SP // 30487
M=M-1 // 30488

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30489
D=M // 30490
@4 // 30491
A=D+A // 30492
D=M // 30493
@SP // 30494
AM=M+1 // 30495
A=A-1 // 30496
M=D // 30497
// call Number.dispose
@6 // 30498
D=A // 30499
@14 // 30500
M=D // 30501
@Number.dispose // 30502
D=A // 30503
@13 // 30504
M=D // 30505
@Sphere.intersect.ret.16 // 30506
D=A // 30507
@CALL // 30508
0;JMP // 30509
(Sphere.intersect.ret.16)
@SP // 30510
M=M-1 // 30511

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 30512
AM=M+1 // 30513
A=A-1 // 30514
M=-1 // 30515
// call Number.new
@6 // 30516
D=A // 30517
@14 // 30518
M=D // 30519
@Number.new // 30520
D=A // 30521
@13 // 30522
M=D // 30523
@Sphere.intersect.ret.17 // 30524
D=A // 30525
@CALL // 30526
0;JMP // 30527
(Sphere.intersect.ret.17)
@RETURN // 30528
0;JMP // 30529

////LabelInstruction{label='Sphere.intersect$IF_END1}
// label Sphere.intersect$IF_END1
(Sphere.intersect$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 30530
A=M+1 // 30531
A=A+1 // 30532
A=A+1 // 30533
D=M // 30534
@SP // 30535
AM=M+1 // 30536
A=A-1 // 30537
M=D // 30538
// call Number.clone
@6 // 30539
D=A // 30540
@14 // 30541
M=D // 30542
@Number.clone // 30543
D=A // 30544
@13 // 30545
M=D // 30546
@Sphere.intersect.ret.18 // 30547
D=A // 30548
@CALL // 30549
0;JMP // 30550
(Sphere.intersect.ret.18)
@LCL // 30551
D=M // 30552
@5 // 30553
A=D+A // 30554
D=A // 30555
@R13 // 30556
M=D // 30557
@SP // 30558
AM=M-1 // 30559
D=M // 30560
@R13 // 30561
A=M // 30562
M=D // 30563

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), PushInstruction("local 4")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30564
D=M // 30565
@5 // 30566
A=D+A // 30567
D=M // 30568
@SP // 30569
AM=M+1 // 30570
A=A-1 // 30571
M=D // 30572
@LCL // 30573
D=M // 30574
@4 // 30575
A=D+A // 30576
D=M // 30577
@SP // 30578
AM=M+1 // 30579
A=A-1 // 30580
M=D // 30581
// call Number.do_sub
@7 // 30582
D=A // 30583
@14 // 30584
M=D // 30585
@Number.do_sub // 30586
D=A // 30587
@13 // 30588
M=D // 30589
@Sphere.intersect.ret.19 // 30590
D=A // 30591
@CALL // 30592
0;JMP // 30593
(Sphere.intersect.ret.19)
@SP // 30594
M=M-1 // 30595

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30596
D=M // 30597
@5 // 30598
A=D+A // 30599
D=M // 30600
@SP // 30601
AM=M+1 // 30602
A=A-1 // 30603
M=D // 30604
// call Number.do_sqrt
@6 // 30605
D=A // 30606
@14 // 30607
M=D // 30608
@Number.do_sqrt // 30609
D=A // 30610
@13 // 30611
M=D // 30612
@Sphere.intersect.ret.20 // 30613
D=A // 30614
@CALL // 30615
0;JMP // 30616
(Sphere.intersect.ret.20)
@SP // 30617
M=M-1 // 30618

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 30619
A=M+1 // 30620
D=M // 30621
@SP // 30622
AM=M+1 // 30623
A=A-1 // 30624
M=D // 30625
// call Number.clone
@6 // 30626
D=A // 30627
@14 // 30628
M=D // 30629
@Number.clone // 30630
D=A // 30631
@13 // 30632
M=D // 30633
@Sphere.intersect.ret.21 // 30634
D=A // 30635
@CALL // 30636
0;JMP // 30637
(Sphere.intersect.ret.21)
@LCL // 30638
D=M // 30639
@6 // 30640
A=D+A // 30641
D=A // 30642
@R13 // 30643
M=D // 30644
@SP // 30645
AM=M-1 // 30646
D=M // 30647
@R13 // 30648
A=M // 30649
M=D // 30650

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 5")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30651
D=M // 30652
@6 // 30653
A=D+A // 30654
D=M // 30655
@SP // 30656
AM=M+1 // 30657
A=A-1 // 30658
M=D // 30659
@LCL // 30660
D=M // 30661
@5 // 30662
A=D+A // 30663
D=M // 30664
@SP // 30665
AM=M+1 // 30666
A=A-1 // 30667
M=D // 30668
// call Number.do_sub
@7 // 30669
D=A // 30670
@14 // 30671
M=D // 30672
@Number.do_sub // 30673
D=A // 30674
@13 // 30675
M=D // 30676
@Sphere.intersect.ret.22 // 30677
D=A // 30678
@CALL // 30679
0;JMP // 30680
(Sphere.intersect.ret.22)
@SP // 30681
M=M-1 // 30682

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 30683
A=M+1 // 30684
D=M // 30685
@SP // 30686
AM=M+1 // 30687
A=A-1 // 30688
M=D // 30689
// call Number.clone
@6 // 30690
D=A // 30691
@14 // 30692
M=D // 30693
@Number.clone // 30694
D=A // 30695
@13 // 30696
M=D // 30697
@Sphere.intersect.ret.23 // 30698
D=A // 30699
@CALL // 30700
0;JMP // 30701
(Sphere.intersect.ret.23)
@LCL // 30702
D=M // 30703
@7 // 30704
A=D+A // 30705
D=A // 30706
@R13 // 30707
M=D // 30708
@SP // 30709
AM=M-1 // 30710
D=M // 30711
@R13 // 30712
A=M // 30713
M=D // 30714

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7"), PushInstruction("local 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30715
D=M // 30716
@7 // 30717
A=D+A // 30718
D=M // 30719
@SP // 30720
AM=M+1 // 30721
A=A-1 // 30722
M=D // 30723
@LCL // 30724
D=M // 30725
@5 // 30726
A=D+A // 30727
D=M // 30728
@SP // 30729
AM=M+1 // 30730
A=A-1 // 30731
M=D // 30732
// call Number.do_add
@7 // 30733
D=A // 30734
@14 // 30735
M=D // 30736
@Number.do_add // 30737
D=A // 30738
@13 // 30739
M=D // 30740
@Sphere.intersect.ret.24 // 30741
D=A // 30742
@CALL // 30743
0;JMP // 30744
(Sphere.intersect.ret.24)
@SP // 30745
M=M-1 // 30746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30747
A=M // 30748
D=M // 30749
@SP // 30750
AM=M+1 // 30751
A=A-1 // 30752
M=D // 30753
// call Vec3.dispose
@6 // 30754
D=A // 30755
@14 // 30756
M=D // 30757
@Vec3.dispose // 30758
D=A // 30759
@13 // 30760
M=D // 30761
@Sphere.intersect.ret.25 // 30762
D=A // 30763
@CALL // 30764
0;JMP // 30765
(Sphere.intersect.ret.25)
@SP // 30766
M=M-1 // 30767

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30768
A=M+1 // 30769
D=M // 30770
@SP // 30771
AM=M+1 // 30772
A=A-1 // 30773
M=D // 30774
// call Number.dispose
@6 // 30775
D=A // 30776
@14 // 30777
M=D // 30778
@Number.dispose // 30779
D=A // 30780
@13 // 30781
M=D // 30782
@Sphere.intersect.ret.26 // 30783
D=A // 30784
@CALL // 30785
0;JMP // 30786
(Sphere.intersect.ret.26)
@SP // 30787
M=M-1 // 30788

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30789
A=M+1 // 30790
A=A+1 // 30791
D=M // 30792
@SP // 30793
AM=M+1 // 30794
A=A-1 // 30795
M=D // 30796
// call Number.dispose
@6 // 30797
D=A // 30798
@14 // 30799
M=D // 30800
@Number.dispose // 30801
D=A // 30802
@13 // 30803
M=D // 30804
@Sphere.intersect.ret.27 // 30805
D=A // 30806
@CALL // 30807
0;JMP // 30808
(Sphere.intersect.ret.27)
@SP // 30809
M=M-1 // 30810

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30811
A=M+1 // 30812
A=A+1 // 30813
A=A+1 // 30814
D=M // 30815
@SP // 30816
AM=M+1 // 30817
A=A-1 // 30818
M=D // 30819
// call Number.dispose
@6 // 30820
D=A // 30821
@14 // 30822
M=D // 30823
@Number.dispose // 30824
D=A // 30825
@13 // 30826
M=D // 30827
@Sphere.intersect.ret.28 // 30828
D=A // 30829
@CALL // 30830
0;JMP // 30831
(Sphere.intersect.ret.28)
@SP // 30832
M=M-1 // 30833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30834
D=M // 30835
@4 // 30836
A=D+A // 30837
D=M // 30838
@SP // 30839
AM=M+1 // 30840
A=A-1 // 30841
M=D // 30842
// call Number.dispose
@6 // 30843
D=A // 30844
@14 // 30845
M=D // 30846
@Number.dispose // 30847
D=A // 30848
@13 // 30849
M=D // 30850
@Sphere.intersect.ret.29 // 30851
D=A // 30852
@CALL // 30853
0;JMP // 30854
(Sphere.intersect.ret.29)
@SP // 30855
M=M-1 // 30856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30857
D=M // 30858
@5 // 30859
A=D+A // 30860
D=M // 30861
@SP // 30862
AM=M+1 // 30863
A=A-1 // 30864
M=D // 30865
// call Number.dispose
@6 // 30866
D=A // 30867
@14 // 30868
M=D // 30869
@Number.dispose // 30870
D=A // 30871
@13 // 30872
M=D // 30873
@Sphere.intersect.ret.30 // 30874
D=A // 30875
@CALL // 30876
0;JMP // 30877
(Sphere.intersect.ret.30)
@SP // 30878
M=M-1 // 30879

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.is_negative}},
//    right:
//CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.is_negative}},
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE2}}
@LCL // 30880
D=M // 30881
@6 // 30882
A=D+A // 30883
D=M // 30884
@SP // 30885
AM=M+1 // 30886
A=A-1 // 30887
M=D // 30888
// call Number.is_negative
@6 // 30889
D=A // 30890
@14 // 30891
M=D // 30892
@Number.is_negative // 30893
D=A // 30894
@13 // 30895
M=D // 30896
@Sphere.intersect.ret.31 // 30897
D=A // 30898
@CALL // 30899
0;JMP // 30900
(Sphere.intersect.ret.31)
@LCL // 30901
D=M // 30902
@7 // 30903
A=D+A // 30904
D=M // 30905
@SP // 30906
AM=M+1 // 30907
A=A-1 // 30908
M=D // 30909
// call Number.is_negative
@6 // 30910
D=A // 30911
@14 // 30912
M=D // 30913
@Number.is_negative // 30914
D=A // 30915
@13 // 30916
M=D // 30917
@Sphere.intersect.ret.32 // 30918
D=A // 30919
@CALL // 30920
0;JMP // 30921
(Sphere.intersect.ret.32)
@SP // 30922
AM=M-1 // 30923
D=M // 30924
@SP // 30925
AM=M-1 // 30926
D=D&M // 30927
@Sphere.intersect$IF_TRUE2 // 30928
D;JNE // 30929

////GotoInstruction{label='Sphere.intersect$IF_END2}
// goto Sphere.intersect$IF_END2
@Sphere.intersect$IF_END2 // 30930
0;JMP // 30931

////LabelInstruction{label='Sphere.intersect$IF_TRUE2}
// label Sphere.intersect$IF_TRUE2
(Sphere.intersect$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30932
D=M // 30933
@6 // 30934
A=D+A // 30935
D=M // 30936
@SP // 30937
AM=M+1 // 30938
A=A-1 // 30939
M=D // 30940
// call Number.dispose
@6 // 30941
D=A // 30942
@14 // 30943
M=D // 30944
@Number.dispose // 30945
D=A // 30946
@13 // 30947
M=D // 30948
@Sphere.intersect.ret.33 // 30949
D=A // 30950
@CALL // 30951
0;JMP // 30952
(Sphere.intersect.ret.33)
@SP // 30953
M=M-1 // 30954

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30955
D=M // 30956
@7 // 30957
A=D+A // 30958
D=M // 30959
@SP // 30960
AM=M+1 // 30961
A=A-1 // 30962
M=D // 30963
// call Number.dispose
@6 // 30964
D=A // 30965
@14 // 30966
M=D // 30967
@Number.dispose // 30968
D=A // 30969
@13 // 30970
M=D // 30971
@Sphere.intersect.ret.34 // 30972
D=A // 30973
@CALL // 30974
0;JMP // 30975
(Sphere.intersect.ret.34)
@SP // 30976
M=M-1 // 30977

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 30978
AM=M+1 // 30979
A=A-1 // 30980
M=-1 // 30981
// call Number.new
@6 // 30982
D=A // 30983
@14 // 30984
M=D // 30985
@Number.new // 30986
D=A // 30987
@13 // 30988
M=D // 30989
@Sphere.intersect.ret.35 // 30990
D=A // 30991
@CALL // 30992
0;JMP // 30993
(Sphere.intersect.ret.35)
@RETURN // 30994
0;JMP // 30995

////LabelInstruction{label='Sphere.intersect$IF_END2}
// label Sphere.intersect$IF_END2
(Sphere.intersect$IF_END2)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 7")], call=CallInstruction{Number.is_less_than}}, ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE3}}
@LCL // 30996
D=M // 30997
@6 // 30998
A=D+A // 30999
D=M // 31000
@SP // 31001
AM=M+1 // 31002
A=A-1 // 31003
M=D // 31004
@LCL // 31005
D=M // 31006
@7 // 31007
A=D+A // 31008
D=M // 31009
@SP // 31010
AM=M+1 // 31011
A=A-1 // 31012
M=D // 31013
// call Number.is_less_than
@7 // 31014
D=A // 31015
@14 // 31016
M=D // 31017
@Number.is_less_than // 31018
D=A // 31019
@13 // 31020
M=D // 31021
@Sphere.intersect.ret.36 // 31022
D=A // 31023
@CALL // 31024
0;JMP // 31025
(Sphere.intersect.ret.36)
@SP // 31026
AM=M-1 // 31027
D=M // 31028
@Sphere.intersect$IF_TRUE3 // 31029
D;JNE // 31030

////GotoInstruction{label='Sphere.intersect$IF_FALSE3}
// goto Sphere.intersect$IF_FALSE3
@Sphere.intersect$IF_FALSE3 // 31031
0;JMP // 31032

////LabelInstruction{label='Sphere.intersect$IF_TRUE3}
// label Sphere.intersect$IF_TRUE3
(Sphere.intersect$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 31033
D=M // 31034
@7 // 31035
A=D+A // 31036
D=M // 31037
@SP // 31038
AM=M+1 // 31039
A=A-1 // 31040
M=D // 31041
// call Number.dispose
@6 // 31042
D=A // 31043
@14 // 31044
M=D // 31045
@Number.dispose // 31046
D=A // 31047
@13 // 31048
M=D // 31049
@Sphere.intersect.ret.37 // 31050
D=A // 31051
@CALL // 31052
0;JMP // 31053
(Sphere.intersect.ret.37)
@SP // 31054
M=M-1 // 31055

////PushInstruction("local 6")
@LCL // 31056
D=M // 31057
@6 // 31058
A=D+A // 31059
D=M // 31060
@SP // 31061
AM=M+1 // 31062
A=A-1 // 31063
M=D // 31064
@RETURN // 31065
0;JMP // 31066

////GotoInstruction{label='Sphere.intersect$IF_END3}
// goto Sphere.intersect$IF_END3
@Sphere.intersect$IF_END3 // 31067
0;JMP // 31068

////LabelInstruction{label='Sphere.intersect$IF_FALSE3}
// label Sphere.intersect$IF_FALSE3
(Sphere.intersect$IF_FALSE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 31069
D=M // 31070
@6 // 31071
A=D+A // 31072
D=M // 31073
@SP // 31074
AM=M+1 // 31075
A=A-1 // 31076
M=D // 31077
// call Number.dispose
@6 // 31078
D=A // 31079
@14 // 31080
M=D // 31081
@Number.dispose // 31082
D=A // 31083
@13 // 31084
M=D // 31085
@Sphere.intersect.ret.38 // 31086
D=A // 31087
@CALL // 31088
0;JMP // 31089
(Sphere.intersect.ret.38)
@SP // 31090
M=M-1 // 31091

////PushInstruction("local 7")
@LCL // 31092
D=M // 31093
@7 // 31094
A=D+A // 31095
D=M // 31096
@SP // 31097
AM=M+1 // 31098
A=A-1 // 31099
M=D // 31100
@RETURN // 31101
0;JMP // 31102

////LabelInstruction{label='Sphere.intersect$IF_END3}
// label Sphere.intersect$IF_END3
(Sphere.intersect$IF_END3)

////FunctionInstruction{functionName='Int32.do_zero', numLocals=1, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_zero with 1
(Int32.do_zero)
@SP // 31103
AM=M+1 // 31104
A=A-1 // 31105
M=0 // 31106

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31107
A=M // 31108
D=M // 31109
@3 // 31110
M=D // 31111

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 31112
A=M // 31113
M=0 // 31114

////LabelInstruction{label='Int32.do_zero_WHILE_EXP1}
// label Int32.do_zero_WHILE_EXP1
(Int32.do_zero_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 4"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_zero_WHILE_END1}}
@Int32.do_zero.LT.111 // 31115
D=A // 31116
@SP // 31117
AM=M+1 // 31118
A=A-1 // 31119
M=D // 31120
@LCL // 31121
A=M // 31122
D=M // 31123
@4 // 31124
D=D-A // 31125
@DO_LT // 31126
0;JMP // 31127
(Int32.do_zero.LT.111)
D=!D // 31128
@Int32.do_zero_WHILE_END1 // 31129
D;JNE // 31130

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 31131
A=M // 31132
D=M // 31133
@LCL // 31134
A=M // 31135
D=D+M // 31136
@SP // 31137
AM=M+1 // 31138
A=A-1 // 31139
M=D // 31140
@LCL // 31141
A=M // 31142
D=M // 31143
@SP // 31144
AM=M-1 // 31145
A=M // 31146
M=D // 31147

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

@LCL // 31148
A=M // 31149
M=M+1 // 31150

////GotoInstruction{label='Int32.do_zero_WHILE_EXP1}
// goto Int32.do_zero_WHILE_EXP1
@Int32.do_zero_WHILE_EXP1 // 31151
0;JMP // 31152

////LabelInstruction{label='Int32.do_zero_WHILE_END1}
// label Int32.do_zero_WHILE_END1
(Int32.do_zero_WHILE_END1)

////PushInstruction("constant 0")
@SP // 31153
AM=M+1 // 31154
A=A-1 // 31155
M=0 // 31156
@RETURN // 31157
0;JMP // 31158

////FunctionInstruction{functionName='Sys.error', numLocals=1, funcMapping={Sys.halt=0, Sys.init=6}}
// function Sys.error with 1
(Sys.error)
@SP // 31159
AM=M+1 // 31160
A=A-1 // 31161
M=0 // 31162

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 31163
A=M // 31164
M=0 // 31165

////LabelInstruction{label='Sys.error_WHILE_EXP1}
// label Sys.error_WHILE_EXP1
(Sys.error_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 8192"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Sys.error_WHILE_END1}}
@Sys.error.LT.112 // 31166
D=A // 31167
@SP // 31168
AM=M+1 // 31169
A=A-1 // 31170
M=D // 31171
@LCL // 31172
A=M // 31173
D=M // 31174
@8192 // 31175
D=D-A // 31176
@DO_LT // 31177
0;JMP // 31178
(Sys.error.LT.112)
D=!D // 31179
@Sys.error_WHILE_END1 // 31180
D;JNE // 31181

////PushWriter{source=PushInstruction("constant -1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 16384"),
//    binaryOp: "ADD"
//)}
@LCL // 31182
A=M // 31183
D=M // 31184
@16384 // 31185
D=D+A // 31186
@SP // 31187
AM=M+1 // 31188
A=A-1 // 31189
M=D // 31190
D=-1 // 31191
@SP // 31192
AM=M-1 // 31193
A=M // 31194
M=D // 31195

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

@LCL // 31196
A=M // 31197
M=M+1 // 31198

////GotoInstruction{label='Sys.error_WHILE_EXP1}
// goto Sys.error_WHILE_EXP1
@Sys.error_WHILE_EXP1 // 31199
0;JMP // 31200

////LabelInstruction{label='Sys.error_WHILE_END1}
// label Sys.error_WHILE_END1
(Sys.error_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 31201
A=M // 31202
D=M // 31203
@SP // 31204
AM=M+1 // 31205
A=A-1 // 31206
M=D // 31207
// call Output.printInt
@6 // 31208
D=A // 31209
@14 // 31210
M=D // 31211
@Output.printInt // 31212
D=A // 31213
@13 // 31214
M=D // 31215
@Sys.error.ret.0 // 31216
D=A // 31217
@CALL // 31218
0;JMP // 31219
(Sys.error.ret.0)
@SP // 31220
M=M-1 // 31221

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 31222
D=A // 31223
@14 // 31224
M=D // 31225
@Output.println // 31226
D=A // 31227
@13 // 31228
M=D // 31229
@Sys.error.ret.1 // 31230
D=A // 31231
@CALL // 31232
0;JMP // 31233
(Sys.error.ret.1)
@SP // 31234
M=M-1 // 31235

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 31236
D=A // 31237
@14 // 31238
M=D // 31239
@Sys.halt // 31240
D=A // 31241
@13 // 31242
M=D // 31243
@Sys.error.ret.2 // 31244
D=A // 31245
@CALL // 31246
0;JMP // 31247
(Sys.error.ret.2)
@SP // 31248
M=M-1 // 31249

////PushInstruction("constant 0")
@SP // 31250
AM=M+1 // 31251
A=A-1 // 31252
M=0 // 31253
@RETURN // 31254
0;JMP // 31255

////FunctionInstruction{functionName='DirectionalLight.getShadowBias', numLocals=0, funcMapping={DirectionalLight.new=9, DirectionalLight.dispose=3, DirectionalLight.getColor=0}}
// function DirectionalLight.getShadowBias with 0
(DirectionalLight.getShadowBias)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31256
A=M // 31257
D=M // 31258
@3 // 31259
M=D // 31260

////PushInstruction("this 3")
@THIS // 31261
A=M+1 // 31262
A=A+1 // 31263
A=A+1 // 31264
D=M // 31265
@SP // 31266
AM=M+1 // 31267
A=A-1 // 31268
M=D // 31269
@RETURN // 31270
0;JMP // 31271

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 31272
M=M+1 // 31273
AM=M+1 // 31274
A=A-1 // 31275
M=0 // 31276
A=A-1 // 31277
M=0 // 31278

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

@ARG // 31279
A=M+1 // 31280
D=M // 31281
@SP // 31282
AM=M+1 // 31283
A=A-1 // 31284
M=D // 31285
@32 // 31286
D=A // 31287
@SP // 31288
AM=M+1 // 31289
A=A-1 // 31290
M=D // 31291
// call Math.multiply
@7 // 31292
D=A // 31293
@14 // 31294
M=D // 31295
@Math.multiply // 31296
D=A // 31297
@13 // 31298
M=D // 31299
@Screen.drawPixel.ret.0 // 31300
D=A // 31301
@CALL // 31302
0;JMP // 31303
(Screen.drawPixel.ret.0)
@ARG // 31304
A=M // 31305
D=M // 31306
@SP // 31307
AM=M+1 // 31308
A=A-1 // 31309
M=D // 31310
@16 // 31311
D=A // 31312
@SP // 31313
AM=M+1 // 31314
A=A-1 // 31315
M=D // 31316
// call Math.divide
@7 // 31317
D=A // 31318
@14 // 31319
M=D // 31320
@Math.divide // 31321
D=A // 31322
@13 // 31323
M=D // 31324
@Screen.drawPixel.ret.1 // 31325
D=A // 31326
@CALL // 31327
0;JMP // 31328
(Screen.drawPixel.ret.1)
@SP // 31329
AM=M-1 // 31330
D=M // 31331
@SP // 31332
AM=M-1 // 31333
D=D+M // 31334
@16384 // 31335
D=D+A // 31336
@LCL // 31337
A=M // 31338
M=D // 31339

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

@ARG // 31340
A=M // 31341
D=M // 31342
@15 // 31343
D=D&A // 31344
@LCL // 31345
A=M+1 // 31346
M=D // 31347

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 31348
D=M // 31349
@Screen.drawPixel$IF_TRUE1 // 31350
D;JNE // 31351

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 31352
0;JMP // 31353

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
@LCL // 31354
A=M // 31355
D=M // 31356
@SP // 31357
AM=M+1 // 31358
A=A-1 // 31359
M=D // 31360
@LCL // 31361
A=M // 31362
A=M // 31363
D=M // 31364
@SP // 31365
AM=M+1 // 31366
A=A-1 // 31367
M=D // 31368
@LCL // 31369
A=M+1 // 31370
D=M // 31371
@SP // 31372
AM=M+1 // 31373
A=A-1 // 31374
M=D // 31375
// call Math.twoToThe
@6 // 31376
D=A // 31377
@14 // 31378
M=D // 31379
@Math.twoToThe // 31380
D=A // 31381
@13 // 31382
M=D // 31383
@Screen.drawPixel.ret.2 // 31384
D=A // 31385
@CALL // 31386
0;JMP // 31387
(Screen.drawPixel.ret.2)
@SP // 31388
AM=M-1 // 31389
D=M // 31390
@SP // 31391
AM=M-1 // 31392
D=D|M // 31393
@SP // 31394
AM=M-1 // 31395
A=M // 31396
M=D // 31397

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 31398
0;JMP // 31399

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
@LCL // 31400
A=M // 31401
D=M // 31402
@SP // 31403
AM=M+1 // 31404
A=A-1 // 31405
M=D // 31406
@LCL // 31407
A=M // 31408
A=M // 31409
D=M // 31410
@SP // 31411
AM=M+1 // 31412
A=A-1 // 31413
M=D // 31414
@LCL // 31415
A=M+1 // 31416
D=M // 31417
@SP // 31418
AM=M+1 // 31419
A=A-1 // 31420
M=D // 31421
// call Math.twoToThe
@6 // 31422
D=A // 31423
@14 // 31424
M=D // 31425
@Math.twoToThe // 31426
D=A // 31427
@13 // 31428
M=D // 31429
@Screen.drawPixel.ret.3 // 31430
D=A // 31431
@CALL // 31432
0;JMP // 31433
(Screen.drawPixel.ret.3)
@SP // 31434
AM=M-1 // 31435
D=M // 31436
D=!D // 31437
@SP // 31438
AM=M-1 // 31439
D=D&M // 31440
@SP // 31441
AM=M-1 // 31442
A=M // 31443
M=D // 31444

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 31445
AM=M+1 // 31446
A=A-1 // 31447
M=0 // 31448
@RETURN // 31449
0;JMP // 31450

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
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
@ARG // 31451
A=M // 31452
D=M // 31453
@SP // 31454
AM=M+1 // 31455
A=A-1 // 31456
M=D // 31457
@ARG // 31458
A=M // 31459
A=M // 31460
D=M // 31461
@4 // 31462
D=D+A // 31463
@SP // 31464
AM=M-1 // 31465
D=D+M // 31466
@SP // 31467
AM=M+1 // 31468
A=A-1 // 31469
M=D // 31470
@ARG // 31471
A=M // 31472
D=M // 31473
@SP // 31474
AM=M-1 // 31475
A=M // 31476
M=D // 31477

////PushInstruction("constant 0")
@SP // 31478
AM=M+1 // 31479
A=A-1 // 31480
M=0 // 31481
@RETURN // 31482
0;JMP // 31483

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.max=0, Math.init=1, Math.multiply=0}}
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
@Math.0 // 31484
D=M // 31485
@ARG // 31486
A=M // 31487
A=D+M // 31488
D=M // 31489
@SP // 31490
AM=M+1 // 31491
A=A-1 // 31492
M=D // 31493
@RETURN // 31494
0;JMP // 31495

////FunctionInstruction{functionName='Intersection.getObject', numLocals=0, funcMapping={Intersection.getDistanceFromOrigin=0, Intersection.new=1, Intersection.dispose=2}}
// function Intersection.getObject with 0
(Intersection.getObject)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31496
A=M // 31497
D=M // 31498
@3 // 31499
M=D // 31500

////PushInstruction("this 1")
@THIS // 31501
A=M+1 // 31502
D=M // 31503
@SP // 31504
AM=M+1 // 31505
A=A-1 // 31506
M=D // 31507
@RETURN // 31508
0;JMP // 31509

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 31510
D=A // 31511
@SP // 31512
AM=D+M // 31513
A=A-1 // 31514
M=0 // 31515
A=A-1 // 31516
M=0 // 31517
A=A-1 // 31518
M=0 // 31519
A=A-1 // 31520
M=0 // 31521
A=A-1 // 31522
M=0 // 31523
A=A-1 // 31524
M=0 // 31525

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31526
A=M // 31527
D=M // 31528
@3 // 31529
M=D // 31530

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 31531
A=M+1 // 31532
M=0 // 31533

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 31534
D=M // 31535
@4 // 31536
A=D+A // 31537
M=0 // 31538

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE1}}
@String.setInt.EQ.113 // 31539
D=A // 31540
@SP // 31541
AM=M+1 // 31542
A=A-1 // 31543
M=D // 31544
@ARG // 31545
A=M+1 // 31546
D=M // 31547
@DO_EQ // 31548
0;JMP // 31549
(String.setInt.EQ.113)
@String.setInt$IF_TRUE1 // 31550
D;JNE // 31551

////GotoInstruction{label='String.setInt$IF_END1}
// goto String.setInt$IF_END1
@String.setInt$IF_END1 // 31552
0;JMP // 31553

////LabelInstruction{label='String.setInt$IF_TRUE1}
// label String.setInt$IF_TRUE1
(String.setInt$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31554
D=M // 31555
@SP // 31556
AM=M+1 // 31557
A=A-1 // 31558
M=D // 31559
@48 // 31560
D=A // 31561
@SP // 31562
AM=M+1 // 31563
A=A-1 // 31564
M=D // 31565
// call String.appendChar
@7 // 31566
D=A // 31567
@14 // 31568
M=D // 31569
@String.appendChar // 31570
D=A // 31571
@13 // 31572
M=D // 31573
@String.setInt.ret.0 // 31574
D=A // 31575
@CALL // 31576
0;JMP // 31577
(String.setInt.ret.0)
@SP // 31578
M=M-1 // 31579

////PushInstruction("constant 0")
@SP // 31580
AM=M+1 // 31581
A=A-1 // 31582
M=0 // 31583
@RETURN // 31584
0;JMP // 31585

////LabelInstruction{label='String.setInt$IF_END1}
// label String.setInt$IF_END1
(String.setInt$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE2}}
@String.setInt.LT.114 // 31586
D=A // 31587
@SP // 31588
AM=M+1 // 31589
A=A-1 // 31590
M=D // 31591
@ARG // 31592
A=M+1 // 31593
D=M // 31594
@DO_LT // 31595
0;JMP // 31596
(String.setInt.LT.114)
@String.setInt$IF_TRUE2 // 31597
D;JNE // 31598

////GotoInstruction{label='String.setInt$IF_END2}
// goto String.setInt$IF_END2
@String.setInt$IF_END2 // 31599
0;JMP // 31600

////LabelInstruction{label='String.setInt$IF_TRUE2}
// label String.setInt$IF_TRUE2
(String.setInt$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 31601
D=M // 31602
@4 // 31603
A=D+A // 31604
M=1 // 31605

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
@String.setInt.LT.115 // 31606
D=A // 31607
@SP // 31608
AM=M+1 // 31609
A=A-1 // 31610
M=D // 31611
@ARG // 31612
A=M+1 // 31613
D=M // 31614
@DO_LT // 31615
0;JMP // 31616
(String.setInt.LT.115)
@SP // 31617
AM=M+1 // 31618
A=A-1 // 31619
M=D // 31620
@String.setInt.EQ.116 // 31621
D=A // 31622
@SP // 31623
AM=M+1 // 31624
A=A-1 // 31625
M=D // 31626
@ARG // 31627
A=M+1 // 31628
D=M // 31629
@32767 // 31630
D=D&A // 31631
@32767 // 31632
D=D-A // 31633
@DO_EQ // 31634
0;JMP // 31635
(String.setInt.EQ.116)
@SP // 31636
AM=M-1 // 31637
D=D&M // 31638
@String.setInt$IF_TRUE3 // 31639
D;JNE // 31640

////GotoInstruction{label='String.setInt$IF_END3}
// goto String.setInt$IF_END3
@String.setInt$IF_END3 // 31641
0;JMP // 31642

////LabelInstruction{label='String.setInt$IF_TRUE3}
// label String.setInt$IF_TRUE3
(String.setInt$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31643
D=M // 31644
@SP // 31645
AM=M+1 // 31646
A=A-1 // 31647
M=D // 31648
@45 // 31649
D=A // 31650
@SP // 31651
AM=M+1 // 31652
A=A-1 // 31653
M=D // 31654
// call String.appendChar
@7 // 31655
D=A // 31656
@14 // 31657
M=D // 31658
@String.appendChar // 31659
D=A // 31660
@13 // 31661
M=D // 31662
@String.setInt.ret.1 // 31663
D=A // 31664
@CALL // 31665
0;JMP // 31666
(String.setInt.ret.1)
@SP // 31667
M=M-1 // 31668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31669
D=M // 31670
@SP // 31671
AM=M+1 // 31672
A=A-1 // 31673
M=D // 31674
@51 // 31675
D=A // 31676
@SP // 31677
AM=M+1 // 31678
A=A-1 // 31679
M=D // 31680
// call String.appendChar
@7 // 31681
D=A // 31682
@14 // 31683
M=D // 31684
@String.appendChar // 31685
D=A // 31686
@13 // 31687
M=D // 31688
@String.setInt.ret.2 // 31689
D=A // 31690
@CALL // 31691
0;JMP // 31692
(String.setInt.ret.2)
@SP // 31693
M=M-1 // 31694

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31695
D=M // 31696
@SP // 31697
AM=M+1 // 31698
A=A-1 // 31699
M=D // 31700
@50 // 31701
D=A // 31702
@SP // 31703
AM=M+1 // 31704
A=A-1 // 31705
M=D // 31706
// call String.appendChar
@7 // 31707
D=A // 31708
@14 // 31709
M=D // 31710
@String.appendChar // 31711
D=A // 31712
@13 // 31713
M=D // 31714
@String.setInt.ret.3 // 31715
D=A // 31716
@CALL // 31717
0;JMP // 31718
(String.setInt.ret.3)
@SP // 31719
M=M-1 // 31720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31721
D=M // 31722
@SP // 31723
AM=M+1 // 31724
A=A-1 // 31725
M=D // 31726
@55 // 31727
D=A // 31728
@SP // 31729
AM=M+1 // 31730
A=A-1 // 31731
M=D // 31732
// call String.appendChar
@7 // 31733
D=A // 31734
@14 // 31735
M=D // 31736
@String.appendChar // 31737
D=A // 31738
@13 // 31739
M=D // 31740
@String.setInt.ret.4 // 31741
D=A // 31742
@CALL // 31743
0;JMP // 31744
(String.setInt.ret.4)
@SP // 31745
M=M-1 // 31746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31747
D=M // 31748
@SP // 31749
AM=M+1 // 31750
A=A-1 // 31751
M=D // 31752
@54 // 31753
D=A // 31754
@SP // 31755
AM=M+1 // 31756
A=A-1 // 31757
M=D // 31758
// call String.appendChar
@7 // 31759
D=A // 31760
@14 // 31761
M=D // 31762
@String.appendChar // 31763
D=A // 31764
@13 // 31765
M=D // 31766
@String.setInt.ret.5 // 31767
D=A // 31768
@CALL // 31769
0;JMP // 31770
(String.setInt.ret.5)
@SP // 31771
M=M-1 // 31772

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31773
D=M // 31774
@SP // 31775
AM=M+1 // 31776
A=A-1 // 31777
M=D // 31778
@56 // 31779
D=A // 31780
@SP // 31781
AM=M+1 // 31782
A=A-1 // 31783
M=D // 31784
// call String.appendChar
@7 // 31785
D=A // 31786
@14 // 31787
M=D // 31788
@String.appendChar // 31789
D=A // 31790
@13 // 31791
M=D // 31792
@String.setInt.ret.6 // 31793
D=A // 31794
@CALL // 31795
0;JMP // 31796
(String.setInt.ret.6)
@SP // 31797
M=M-1 // 31798

////PushInstruction("constant 0")
@SP // 31799
AM=M+1 // 31800
A=A-1 // 31801
M=0 // 31802
@RETURN // 31803
0;JMP // 31804

////LabelInstruction{label='String.setInt$IF_END3}
// label String.setInt$IF_END3
(String.setInt$IF_END3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 31805
A=M+1 // 31806
D=-M // 31807
@ARG // 31808
A=M+1 // 31809
M=D // 31810

////LabelInstruction{label='String.setInt$IF_END2}
// label String.setInt$IF_END2
(String.setInt$IF_END2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 31811
A=M+1 // 31812
D=M // 31813
@LCL // 31814
A=M+1 // 31815
A=A+1 // 31816
M=D // 31817

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 31818
A=M+1 // 31819
A=A+1 // 31820
A=A+1 // 31821
M=0 // 31822

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
@String.setInt.GT.117 // 31823
D=A // 31824
@SP // 31825
AM=M+1 // 31826
A=A-1 // 31827
M=D // 31828
@LCL // 31829
A=M+1 // 31830
A=A+1 // 31831
D=M // 31832
@DO_GT // 31833
0;JMP // 31834
(String.setInt.GT.117)
D=!D // 31835
@String.setInt_WHILE_END1 // 31836
D;JNE // 31837

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 31838
A=M+1 // 31839
A=A+1 // 31840
D=M // 31841
@SP // 31842
AM=M+1 // 31843
A=A-1 // 31844
M=D // 31845
@10 // 31846
D=A // 31847
@SP // 31848
AM=M+1 // 31849
A=A-1 // 31850
M=D // 31851
// call Math.divide
@7 // 31852
D=A // 31853
@14 // 31854
M=D // 31855
@Math.divide // 31856
D=A // 31857
@13 // 31858
M=D // 31859
@String.setInt.ret.7 // 31860
D=A // 31861
@CALL // 31862
0;JMP // 31863
(String.setInt.ret.7)
@SP // 31864
AM=M-1 // 31865
D=M // 31866
@LCL // 31867
A=M+1 // 31868
A=A+1 // 31869
M=D // 31870

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

@LCL // 31871
A=M+1 // 31872
A=A+1 // 31873
A=A+1 // 31874
M=M+1 // 31875

////GotoInstruction{label='String.setInt_WHILE_EXP1}
// goto String.setInt_WHILE_EXP1
@String.setInt_WHILE_EXP1 // 31876
0;JMP // 31877

////LabelInstruction{label='String.setInt_WHILE_END1}
// label String.setInt_WHILE_END1
(String.setInt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 31878
A=M+1 // 31879
A=A+1 // 31880
A=A+1 // 31881
D=M // 31882
@SP // 31883
AM=M+1 // 31884
A=A-1 // 31885
M=D // 31886
// call Memory.alloc
@6 // 31887
D=A // 31888
@14 // 31889
M=D // 31890
@Memory.alloc // 31891
D=A // 31892
@13 // 31893
M=D // 31894
@String.setInt.ret.8 // 31895
D=A // 31896
@CALL // 31897
0;JMP // 31898
(String.setInt.ret.8)
@LCL // 31899
D=M // 31900
@5 // 31901
A=D+A // 31902
D=A // 31903
@R13 // 31904
M=D // 31905
@SP // 31906
AM=M-1 // 31907
D=M // 31908
@R13 // 31909
A=M // 31910
M=D // 31911

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 31912
A=M+1 // 31913
M=0 // 31914

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
@String.setInt.GT.118 // 31915
D=A // 31916
@SP // 31917
AM=M+1 // 31918
A=A-1 // 31919
M=D // 31920
@ARG // 31921
A=M+1 // 31922
D=M // 31923
@DO_GT // 31924
0;JMP // 31925
(String.setInt.GT.118)
D=!D // 31926
@String.setInt_WHILE_END2 // 31927
D;JNE // 31928

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

@ARG // 31929
A=M+1 // 31930
D=M // 31931
@SP // 31932
AM=M+1 // 31933
A=A-1 // 31934
M=D // 31935
@ARG // 31936
A=M+1 // 31937
D=M // 31938
@SP // 31939
AM=M+1 // 31940
A=A-1 // 31941
M=D // 31942
@10 // 31943
D=A // 31944
@SP // 31945
AM=M+1 // 31946
A=A-1 // 31947
M=D // 31948
// call Math.divide
@7 // 31949
D=A // 31950
@14 // 31951
M=D // 31952
@Math.divide // 31953
D=A // 31954
@13 // 31955
M=D // 31956
@String.setInt.ret.9 // 31957
D=A // 31958
@CALL // 31959
0;JMP // 31960
(String.setInt.ret.9)
@10 // 31961
D=A // 31962
@SP // 31963
AM=M+1 // 31964
A=A-1 // 31965
M=D // 31966
// call Math.multiply
@7 // 31967
D=A // 31968
@14 // 31969
M=D // 31970
@Math.multiply // 31971
D=A // 31972
@13 // 31973
M=D // 31974
@String.setInt.ret.10 // 31975
D=A // 31976
@CALL // 31977
0;JMP // 31978
(String.setInt.ret.10)
@SP // 31979
AM=M-1 // 31980
D=M // 31981
@SP // 31982
AM=M-1 // 31983
D=M-D // 31984
@LCL // 31985
A=M // 31986
M=D // 31987

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
@LCL // 31988
D=M // 31989
@5 // 31990
A=D+A // 31991
D=M // 31992
@SP // 31993
AM=M+1 // 31994
A=A-1 // 31995
M=D // 31996
@LCL // 31997
A=M+1 // 31998
D=M // 31999
@SP // 32000
AM=M-1 // 32001
D=D+M // 32002
@SP // 32003
AM=M+1 // 32004
A=A-1 // 32005
M=D // 32006
@LCL // 32007
A=M // 32008
D=M // 32009
@48 // 32010
D=D+A // 32011
@SP // 32012
AM=M-1 // 32013
A=M // 32014
M=D // 32015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 32016
A=M+1 // 32017
D=M // 32018
@SP // 32019
AM=M+1 // 32020
A=A-1 // 32021
M=D // 32022
@10 // 32023
D=A // 32024
@SP // 32025
AM=M+1 // 32026
A=A-1 // 32027
M=D // 32028
// call Math.divide
@7 // 32029
D=A // 32030
@14 // 32031
M=D // 32032
@Math.divide // 32033
D=A // 32034
@13 // 32035
M=D // 32036
@String.setInt.ret.11 // 32037
D=A // 32038
@CALL // 32039
0;JMP // 32040
(String.setInt.ret.11)
@SP // 32041
AM=M-1 // 32042
D=M // 32043
@ARG // 32044
A=M+1 // 32045
M=D // 32046

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

@LCL // 32047
A=M+1 // 32048
M=M+1 // 32049

////GotoInstruction{label='String.setInt_WHILE_EXP2}
// goto String.setInt_WHILE_EXP2
@String.setInt_WHILE_EXP2 // 32050
0;JMP // 32051

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
@String.setInt.EQ.119 // 32052
D=A // 32053
@SP // 32054
AM=M+1 // 32055
A=A-1 // 32056
M=D // 32057
@LCL // 32058
D=M // 32059
@4 // 32060
A=D+A // 32061
D=M // 32062
D=D-1 // 32063
@DO_EQ // 32064
0;JMP // 32065
(String.setInt.EQ.119)
@String.setInt$IF_TRUE4 // 32066
D;JNE // 32067

////GotoInstruction{label='String.setInt$IF_END4}
// goto String.setInt$IF_END4
@String.setInt$IF_END4 // 32068
0;JMP // 32069

////LabelInstruction{label='String.setInt$IF_TRUE4}
// label String.setInt$IF_TRUE4
(String.setInt$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 32070
D=M // 32071
@SP // 32072
AM=M+1 // 32073
A=A-1 // 32074
M=D // 32075
@45 // 32076
D=A // 32077
@SP // 32078
AM=M+1 // 32079
A=A-1 // 32080
M=D // 32081
// call String.appendChar
@7 // 32082
D=A // 32083
@14 // 32084
M=D // 32085
@String.appendChar // 32086
D=A // 32087
@13 // 32088
M=D // 32089
@String.setInt.ret.12 // 32090
D=A // 32091
@CALL // 32092
0;JMP // 32093
(String.setInt.ret.12)
@SP // 32094
M=M-1 // 32095

////LabelInstruction{label='String.setInt$IF_END4}
// label String.setInt$IF_END4
(String.setInt$IF_END4)

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
@String.setInt.GT.120 // 32096
D=A // 32097
@SP // 32098
AM=M+1 // 32099
A=A-1 // 32100
M=D // 32101
@LCL // 32102
A=M+1 // 32103
D=M // 32104
@DO_GT // 32105
0;JMP // 32106
(String.setInt.GT.120)
D=!D // 32107
@String.setInt_WHILE_END3 // 32108
D;JNE // 32109

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

@LCL // 32110
A=M+1 // 32111
M=M-1 // 32112

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

@3 // 32113
D=M // 32114
@SP // 32115
AM=M+1 // 32116
A=A-1 // 32117
M=D // 32118
@LCL // 32119
D=M // 32120
@5 // 32121
A=D+A // 32122
D=M // 32123
@SP // 32124
AM=M+1 // 32125
A=A-1 // 32126
M=D // 32127
@LCL // 32128
A=M+1 // 32129
D=M // 32130
@SP // 32131
AM=M-1 // 32132
A=D+M // 32133
D=M // 32134
@SP // 32135
AM=M+1 // 32136
A=A-1 // 32137
M=D // 32138
// call String.appendChar
@7 // 32139
D=A // 32140
@14 // 32141
M=D // 32142
@String.appendChar // 32143
D=A // 32144
@13 // 32145
M=D // 32146
@String.setInt.ret.13 // 32147
D=A // 32148
@CALL // 32149
0;JMP // 32150
(String.setInt.ret.13)
@SP // 32151
M=M-1 // 32152

////GotoInstruction{label='String.setInt_WHILE_EXP3}
// goto String.setInt_WHILE_EXP3
@String.setInt_WHILE_EXP3 // 32153
0;JMP // 32154

////LabelInstruction{label='String.setInt_WHILE_END3}
// label String.setInt_WHILE_END3
(String.setInt_WHILE_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 32155
D=M // 32156
@5 // 32157
A=D+A // 32158
D=M // 32159
@SP // 32160
AM=M+1 // 32161
A=A-1 // 32162
M=D // 32163
// call Memory.deAlloc
@6 // 32164
D=A // 32165
@14 // 32166
M=D // 32167
@Memory.deAlloc // 32168
D=A // 32169
@13 // 32170
M=D // 32171
@String.setInt.ret.14 // 32172
D=A // 32173
@CALL // 32174
0;JMP // 32175
(String.setInt.ret.14)
@SP // 32176
M=M-1 // 32177

////PushInstruction("constant 0")
@SP // 32178
AM=M+1 // 32179
A=A-1 // 32180
M=0 // 32181
@RETURN // 32182
0;JMP // 32183

////FunctionInstruction{functionName='Int32.u4_array_mul_u4_array', numLocals=6, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.u4_array_mul_u4_array with 6
(Int32.u4_array_mul_u4_array)
@6 // 32184
D=A // 32185
@SP // 32186
AM=D+M // 32187
A=A-1 // 32188
M=0 // 32189
A=A-1 // 32190
M=0 // 32191
A=A-1 // 32192
M=0 // 32193
A=A-1 // 32194
M=0 // 32195
A=A-1 // 32196
M=0 // 32197
A=A-1 // 32198
M=0 // 32199

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@16 // 32200
D=A // 32201
@SP // 32202
AM=M+1 // 32203
A=A-1 // 32204
M=D // 32205
// call Memory.alloc
@6 // 32206
D=A // 32207
@14 // 32208
M=D // 32209
@Memory.alloc // 32210
D=A // 32211
@13 // 32212
M=D // 32213
@Int32.u4_array_mul_u4_array.ret.0 // 32214
D=A // 32215
@CALL // 32216
0;JMP // 32217
(Int32.u4_array_mul_u4_array.ret.0)
@SP // 32218
AM=M-1 // 32219
D=M // 32220
@LCL // 32221
A=M // 32222
M=D // 32223

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 32224
A=M+1 // 32225
A=A+1 // 32226
A=A+1 // 32227
M=0 // 32228

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP1}
// label Int32.u4_array_mul_u4_array_WHILE_EXP1
(Int32.u4_array_mul_u4_array_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 16"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END1}}
@Int32.u4_array_mul_u4_array.LT.121 // 32229
D=A // 32230
@SP // 32231
AM=M+1 // 32232
A=A-1 // 32233
M=D // 32234
@LCL // 32235
A=M+1 // 32236
A=A+1 // 32237
A=A+1 // 32238
D=M // 32239
@16 // 32240
D=D-A // 32241
@DO_LT // 32242
0;JMP // 32243
(Int32.u4_array_mul_u4_array.LT.121)
D=!D // 32244
@Int32.u4_array_mul_u4_array_WHILE_END1 // 32245
D;JNE // 32246

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)}
@LCL // 32247
A=M+1 // 32248
A=A+1 // 32249
A=A+1 // 32250
D=M // 32251
A=A-1 // 32252
A=A-1 // 32253
A=A-1 // 32254
D=D+M // 32255
@SP // 32256
AM=M+1 // 32257
A=A-1 // 32258
M=D // 32259
D=0 // 32260
@SP // 32261
AM=M-1 // 32262
A=M // 32263
M=D // 32264

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

@LCL // 32265
A=M+1 // 32266
A=A+1 // 32267
A=A+1 // 32268
M=M+1 // 32269

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP1}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP1
@Int32.u4_array_mul_u4_array_WHILE_EXP1 // 32270
0;JMP // 32271

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END1}
// label Int32.u4_array_mul_u4_array_WHILE_END1
(Int32.u4_array_mul_u4_array_WHILE_END1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 32272
A=M+1 // 32273
M=0 // 32274

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP2}
// label Int32.u4_array_mul_u4_array_WHILE_EXP2
(Int32.u4_array_mul_u4_array_WHILE_EXP2)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 8"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END2}}
@Int32.u4_array_mul_u4_array.LT.122 // 32275
D=A // 32276
@SP // 32277
AM=M+1 // 32278
A=A-1 // 32279
M=D // 32280
@LCL // 32281
A=M+1 // 32282
D=M // 32283
@8 // 32284
D=D-A // 32285
@DO_LT // 32286
0;JMP // 32287
(Int32.u4_array_mul_u4_array.LT.122)
D=!D // 32288
@Int32.u4_array_mul_u4_array_WHILE_END2 // 32289
D;JNE // 32290

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 32291
A=M+1 // 32292
A=A+1 // 32293
M=0 // 32294

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 1"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 5}
//}

@ARG // 32295
A=M+1 // 32296
D=M // 32297
@LCL // 32298
A=M+1 // 32299
A=D+M // 32300
D=M // 32301
@SP // 32302
AM=M+1 // 32303
A=A-1 // 32304
M=D // 32305
@LCL // 32306
D=M // 32307
@5 // 32308
A=D+A // 32309
D=A // 32310
@R13 // 32311
M=D // 32312
@SP // 32313
AM=M-1 // 32314
D=M // 32315
@R13 // 32316
A=M // 32317
M=D // 32318

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 32319
A=M+1 // 32320
A=A+1 // 32321
A=A+1 // 32322
M=0 // 32323

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP3}
// label Int32.u4_array_mul_u4_array_WHILE_EXP3
(Int32.u4_array_mul_u4_array_WHILE_EXP3)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 3"),
//        right:
//            PushInstruction("constant 8"),
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END3}}
@Int32.u4_array_mul_u4_array.LT.123 // 32324
D=A // 32325
@SP // 32326
AM=M+1 // 32327
A=A-1 // 32328
M=D // 32329
@LCL // 32330
A=M+1 // 32331
A=A+1 // 32332
A=A+1 // 32333
D=M // 32334
@8 // 32335
D=D-A // 32336
@DO_LT // 32337
0;JMP // 32338
(Int32.u4_array_mul_u4_array.LT.123)
D=!D // 32339
@Int32.u4_array_mul_u4_array_WHILE_END3 // 32340
D;JNE // 32341

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("argument 0"),
//            right:
//                PushInstruction("local 3"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("local 5")], call=CallInstruction{Math.multiply}},
//            right:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("local 0"),
//                            right:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("local 3"),
//                                    right:
//                                        PushInstruction("local 1"),
//                                    binaryOp: "ADD"
//                                ),
//                            binaryOp: "ADD"
//                        )
//                ),
//            binaryOp: "ADD"
//        ),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 4}
//}

@ARG // 32342
A=M // 32343
D=M // 32344
@LCL // 32345
A=M+1 // 32346
A=A+1 // 32347
A=A+1 // 32348
A=D+M // 32349
D=M // 32350
@SP // 32351
AM=M+1 // 32352
A=A-1 // 32353
M=D // 32354
@LCL // 32355
D=M // 32356
@5 // 32357
A=D+A // 32358
D=M // 32359
@SP // 32360
AM=M+1 // 32361
A=A-1 // 32362
M=D // 32363
// call Math.multiply
@7 // 32364
D=A // 32365
@14 // 32366
M=D // 32367
@Math.multiply // 32368
D=A // 32369
@13 // 32370
M=D // 32371
@Int32.u4_array_mul_u4_array.ret.1 // 32372
D=A // 32373
@CALL // 32374
0;JMP // 32375
(Int32.u4_array_mul_u4_array.ret.1)
@LCL // 32376
A=M // 32377
D=M // 32378
@SP // 32379
AM=M+1 // 32380
A=A-1 // 32381
M=D // 32382
@LCL // 32383
A=M+1 // 32384
A=A+1 // 32385
A=A+1 // 32386
D=M // 32387
A=A-1 // 32388
A=A-1 // 32389
D=D+M // 32390
@SP // 32391
AM=M-1 // 32392
A=D+M // 32393
D=M // 32394
@SP // 32395
AM=M-1 // 32396
D=D+M // 32397
@SP // 32398
AM=M+1 // 32399
A=A-1 // 32400
M=D // 32401
@LCL // 32402
A=M+1 // 32403
A=A+1 // 32404
D=M // 32405
@SP // 32406
AM=M-1 // 32407
D=D+M // 32408
@SP // 32409
AM=M+1 // 32410
A=A-1 // 32411
M=D // 32412
@LCL // 32413
D=M // 32414
@4 // 32415
A=D+A // 32416
D=A // 32417
@R13 // 32418
M=D // 32419
@SP // 32420
AM=M-1 // 32421
D=M // 32422
@R13 // 32423
A=M // 32424
M=D // 32425

////PushWriter{source=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 15"),
//    binaryOp: "AND"
//), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 3"),
//            right:
//                PushInstruction("local 1"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 32426
A=M // 32427
D=M // 32428
@SP // 32429
AM=M+1 // 32430
A=A-1 // 32431
M=D // 32432
@LCL // 32433
A=M+1 // 32434
A=A+1 // 32435
A=A+1 // 32436
D=M // 32437
A=A-1 // 32438
A=A-1 // 32439
D=D+M // 32440
@SP // 32441
AM=M-1 // 32442
D=D+M // 32443
@SP // 32444
AM=M+1 // 32445
A=A-1 // 32446
M=D // 32447
@LCL // 32448
D=M // 32449
@4 // 32450
A=D+A // 32451
D=M // 32452
@15 // 32453
D=D&A // 32454
@SP // 32455
AM=M-1 // 32456
A=M // 32457
M=D // 32458

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 32459
D=M // 32460
@4 // 32461
A=D+A // 32462
D=M // 32463
@SP // 32464
AM=M+1 // 32465
A=A-1 // 32466
M=D // 32467
@4 // 32468
D=A // 32469
@SP // 32470
AM=M+1 // 32471
A=A-1 // 32472
M=D // 32473
// call Int32.arith_rightshift
@7 // 32474
D=A // 32475
@14 // 32476
M=D // 32477
@Int32.arith_rightshift // 32478
D=A // 32479
@13 // 32480
M=D // 32481
@Int32.u4_array_mul_u4_array.ret.2 // 32482
D=A // 32483
@CALL // 32484
0;JMP // 32485
(Int32.u4_array_mul_u4_array.ret.2)
@SP // 32486
AM=M-1 // 32487
D=M // 32488
@LCL // 32489
A=M+1 // 32490
A=A+1 // 32491
M=D // 32492

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

@LCL // 32493
A=M+1 // 32494
A=A+1 // 32495
A=A+1 // 32496
M=M+1 // 32497

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP3}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP3
@Int32.u4_array_mul_u4_array_WHILE_EXP3 // 32498
0;JMP // 32499

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END3}
// label Int32.u4_array_mul_u4_array_WHILE_END3
(Int32.u4_array_mul_u4_array_WHILE_END3)

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 1"),
//            right:
//                PushInstruction("constant 8"),
//            binaryOp: "ADD"
//        ),
//    binaryOp: "ADD"
//)}
@LCL // 32500
A=M // 32501
D=M // 32502
@SP // 32503
AM=M+1 // 32504
A=A-1 // 32505
M=D // 32506
@LCL // 32507
A=M+1 // 32508
D=M // 32509
@8 // 32510
D=D+A // 32511
@SP // 32512
AM=M-1 // 32513
D=D+M // 32514
@SP // 32515
AM=M+1 // 32516
A=A-1 // 32517
M=D // 32518
@LCL // 32519
A=M+1 // 32520
A=A+1 // 32521
D=M // 32522
@SP // 32523
AM=M-1 // 32524
A=M // 32525
M=D // 32526

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

@LCL // 32527
A=M+1 // 32528
M=M+1 // 32529

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP2}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP2
@Int32.u4_array_mul_u4_array_WHILE_EXP2 // 32530
0;JMP // 32531

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END2}
// label Int32.u4_array_mul_u4_array_WHILE_END2
(Int32.u4_array_mul_u4_array_WHILE_END2)

////PushInstruction("local 0")
@LCL // 32532
A=M // 32533
D=M // 32534
@SP // 32535
AM=M+1 // 32536
A=A-1 // 32537
M=D // 32538
@RETURN // 32539
0;JMP // 32540

////FunctionInstruction{functionName='Main.getRawPixelColor', numLocals=18, funcMapping={Main.render=55, Main.main=75, Main.getSomething=4}}
// function Main.getRawPixelColor with 18
(Main.getRawPixelColor)
@18 // 32541
D=A // 32542
@SP // 32543
AM=D+M // 32544
A=A-1 // 32545
M=0 // 32546
A=A-1 // 32547
M=0 // 32548
A=A-1 // 32549
M=0 // 32550
A=A-1 // 32551
M=0 // 32552
A=A-1 // 32553
M=0 // 32554
A=A-1 // 32555
M=0 // 32556
A=A-1 // 32557
M=0 // 32558
A=A-1 // 32559
M=0 // 32560
A=A-1 // 32561
M=0 // 32562
A=A-1 // 32563
M=0 // 32564
A=A-1 // 32565
M=0 // 32566
A=A-1 // 32567
M=0 // 32568
A=A-1 // 32569
M=0 // 32570
A=A-1 // 32571
M=0 // 32572
A=A-1 // 32573
M=0 // 32574
A=A-1 // 32575
M=0 // 32576
A=A-1 // 32577
M=0 // 32578
A=A-1 // 32579
M=0 // 32580

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 32581
AM=M+1 // 32582
A=A-1 // 32583
M=0 // 32584
// call Number.new
@6 // 32585
D=A // 32586
@14 // 32587
M=D // 32588
@Number.new // 32589
D=A // 32590
@13 // 32591
M=D // 32592
@Main.getRawPixelColor.ret.0 // 32593
D=A // 32594
@CALL // 32595
0;JMP // 32596
(Main.getRawPixelColor.ret.0)
@SP // 32597
AM=M-1 // 32598
D=M // 32599
@LCL // 32600
A=M // 32601
M=D // 32602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1"), PushInstruction("argument 2"), PushInstruction("argument 4"), PushInstruction("argument 5"), PushInstruction("argument 6")], call=CallInstruction{Scene.create_prime_ray}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 32603
A=M // 32604
D=M // 32605
@SP // 32606
AM=M+1 // 32607
A=A-1 // 32608
M=D // 32609
@ARG // 32610
A=M+1 // 32611
D=M // 32612
@SP // 32613
AM=M+1 // 32614
A=A-1 // 32615
M=D // 32616
@ARG // 32617
A=M+1 // 32618
A=A+1 // 32619
D=M // 32620
@SP // 32621
AM=M+1 // 32622
A=A-1 // 32623
M=D // 32624
@ARG // 32625
D=M // 32626
@4 // 32627
A=D+A // 32628
D=M // 32629
@SP // 32630
AM=M+1 // 32631
A=A-1 // 32632
M=D // 32633
@ARG // 32634
D=M // 32635
@5 // 32636
A=D+A // 32637
D=M // 32638
@SP // 32639
AM=M+1 // 32640
A=A-1 // 32641
M=D // 32642
@ARG // 32643
D=M // 32644
@6 // 32645
A=D+A // 32646
D=M // 32647
@SP // 32648
AM=M+1 // 32649
A=A-1 // 32650
M=D // 32651
// call Scene.create_prime_ray
@11 // 32652
D=A // 32653
@14 // 32654
M=D // 32655
@Scene.create_prime_ray // 32656
D=A // 32657
@13 // 32658
M=D // 32659
@Main.getRawPixelColor.ret.1 // 32660
D=A // 32661
@CALL // 32662
0;JMP // 32663
(Main.getRawPixelColor.ret.1)
@SP // 32664
AM=M-1 // 32665
D=M // 32666
@LCL // 32667
A=M+1 // 32668
M=D // 32669

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1")], call=CallInstruction{Scene.trace}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 32670
A=M // 32671
D=M // 32672
@SP // 32673
AM=M+1 // 32674
A=A-1 // 32675
M=D // 32676
@LCL // 32677
A=M+1 // 32678
D=M // 32679
@SP // 32680
AM=M+1 // 32681
A=A-1 // 32682
M=D // 32683
// call Scene.trace
@7 // 32684
D=A // 32685
@14 // 32686
M=D // 32687
@Scene.trace // 32688
D=A // 32689
@13 // 32690
M=D // 32691
@Main.getRawPixelColor.ret.2 // 32692
D=A // 32693
@CALL // 32694
0;JMP // 32695
(Main.getRawPixelColor.ret.2)
@SP // 32696
AM=M-1 // 32697
D=M // 32698
@LCL // 32699
A=M+1 // 32700
A=A+1 // 32701
M=D // 32702

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE1}}
@Main.getRawPixelColor.EQ.124 // 32703
D=A // 32704
@SP // 32705
AM=M+1 // 32706
A=A-1 // 32707
M=D // 32708
@LCL // 32709
A=M+1 // 32710
A=A+1 // 32711
D=M // 32712
@DO_EQ // 32713
0;JMP // 32714
(Main.getRawPixelColor.EQ.124)
D=!D // 32715
@Main.getRawPixelColor$IF_TRUE1 // 32716
D;JNE // 32717

////GotoInstruction{label='Main.getRawPixelColor$IF_END1}
// goto Main.getRawPixelColor$IF_END1
@Main.getRawPixelColor$IF_END1 // 32718
0;JMP // 32719

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE1}
// label Main.getRawPixelColor$IF_TRUE1
(Main.getRawPixelColor$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.getOrigin}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 32720
A=M+1 // 32721
D=M // 32722
@SP // 32723
AM=M+1 // 32724
A=A-1 // 32725
M=D // 32726
// call Ray.getOrigin
@6 // 32727
D=A // 32728
@14 // 32729
M=D // 32730
@Ray.getOrigin // 32731
D=A // 32732
@13 // 32733
M=D // 32734
@Main.getRawPixelColor.ret.3 // 32735
D=A // 32736
@CALL // 32737
0;JMP // 32738
(Main.getRawPixelColor.ret.3)
@LCL // 32739
D=M // 32740
@12 // 32741
A=D+A // 32742
D=A // 32743
@R13 // 32744
M=D // 32745
@SP // 32746
AM=M-1 // 32747
D=M // 32748
@R13 // 32749
A=M // 32750
M=D // 32751

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 32752
D=M // 32753
@12 // 32754
A=D+A // 32755
D=M // 32756
@SP // 32757
AM=M+1 // 32758
A=A-1 // 32759
M=D // 32760
// call Vec3.clone
@6 // 32761
D=A // 32762
@14 // 32763
M=D // 32764
@Vec3.clone // 32765
D=A // 32766
@13 // 32767
M=D // 32768
@Main.getRawPixelColor.ret.4 // 32769
D=A // 32770
@CALL // 32771
0;JMP // 32772
(Main.getRawPixelColor.ret.4)
@SP // 32773
AM=M-1 // 32774
D=M // 32775
@LCL // 32776
A=M+1 // 32777
A=A+1 // 32778
A=A+1 // 32779
M=D // 32780

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.getDirection}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 32781
A=M+1 // 32782
D=M // 32783
@SP // 32784
AM=M+1 // 32785
A=A-1 // 32786
M=D // 32787
// call Ray.getDirection
@6 // 32788
D=A // 32789
@14 // 32790
M=D // 32791
@Ray.getDirection // 32792
D=A // 32793
@13 // 32794
M=D // 32795
@Main.getRawPixelColor.ret.5 // 32796
D=A // 32797
@CALL // 32798
0;JMP // 32799
(Main.getRawPixelColor.ret.5)
@LCL // 32800
D=M // 32801
@12 // 32802
A=D+A // 32803
D=A // 32804
@R13 // 32805
M=D // 32806
@SP // 32807
AM=M-1 // 32808
D=M // 32809
@R13 // 32810
A=M // 32811
M=D // 32812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 32813
D=M // 32814
@12 // 32815
A=D+A // 32816
D=M // 32817
@SP // 32818
AM=M+1 // 32819
A=A-1 // 32820
M=D // 32821
// call Vec3.clone
@6 // 32822
D=A // 32823
@14 // 32824
M=D // 32825
@Vec3.clone // 32826
D=A // 32827
@13 // 32828
M=D // 32829
@Main.getRawPixelColor.ret.6 // 32830
D=A // 32831
@CALL // 32832
0;JMP // 32833
(Main.getRawPixelColor.ret.6)
@LCL // 32834
D=M // 32835
@4 // 32836
A=D+A // 32837
D=A // 32838
@R13 // 32839
M=D // 32840
@SP // 32841
AM=M-1 // 32842
D=M // 32843
@R13 // 32844
A=M // 32845
M=D // 32846

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getDistanceFromOrigin}}], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 32847
D=M // 32848
@4 // 32849
A=D+A // 32850
D=M // 32851
@SP // 32852
AM=M+1 // 32853
A=A-1 // 32854
M=D // 32855
@LCL // 32856
A=M+1 // 32857
A=A+1 // 32858
D=M // 32859
@SP // 32860
AM=M+1 // 32861
A=A-1 // 32862
M=D // 32863
// call Intersection.getDistanceFromOrigin
@6 // 32864
D=A // 32865
@14 // 32866
M=D // 32867
@Intersection.getDistanceFromOrigin // 32868
D=A // 32869
@13 // 32870
M=D // 32871
@Main.getRawPixelColor.ret.7 // 32872
D=A // 32873
@CALL // 32874
0;JMP // 32875
(Main.getRawPixelColor.ret.7)
// call Vec3.do_scale
@7 // 32876
D=A // 32877
@14 // 32878
M=D // 32879
@Vec3.do_scale // 32880
D=A // 32881
@13 // 32882
M=D // 32883
@Main.getRawPixelColor.ret.8 // 32884
D=A // 32885
@CALL // 32886
0;JMP // 32887
(Main.getRawPixelColor.ret.8)
@SP // 32888
M=M-1 // 32889

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 4")], call=CallInstruction{Vec3.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 32890
A=M+1 // 32891
A=A+1 // 32892
A=A+1 // 32893
D=M // 32894
@SP // 32895
AM=M+1 // 32896
A=A-1 // 32897
M=D // 32898
@LCL // 32899
D=M // 32900
@4 // 32901
A=D+A // 32902
D=M // 32903
@SP // 32904
AM=M+1 // 32905
A=A-1 // 32906
M=D // 32907
// call Vec3.do_add
@7 // 32908
D=A // 32909
@14 // 32910
M=D // 32911
@Vec3.do_add // 32912
D=A // 32913
@13 // 32914
M=D // 32915
@Main.getRawPixelColor.ret.9 // 32916
D=A // 32917
@CALL // 32918
0;JMP // 32919
(Main.getRawPixelColor.ret.9)
@SP // 32920
M=M-1 // 32921

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getObject}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 32922
A=M+1 // 32923
A=A+1 // 32924
D=M // 32925
@SP // 32926
AM=M+1 // 32927
A=A-1 // 32928
M=D // 32929
// call Intersection.getObject
@6 // 32930
D=A // 32931
@14 // 32932
M=D // 32933
@Intersection.getObject // 32934
D=A // 32935
@13 // 32936
M=D // 32937
@Main.getRawPixelColor.ret.10 // 32938
D=A // 32939
@CALL // 32940
0;JMP // 32941
(Main.getRawPixelColor.ret.10)
@LCL // 32942
D=M // 32943
@13 // 32944
A=D+A // 32945
D=A // 32946
@R13 // 32947
M=D // 32948
@SP // 32949
AM=M-1 // 32950
D=M // 32951
@R13 // 32952
A=M // 32953
M=D // 32954

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13"), PushInstruction("local 3")], call=CallInstruction{Element.surface_normal}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 32955
D=M // 32956
@13 // 32957
A=D+A // 32958
D=M // 32959
@SP // 32960
AM=M+1 // 32961
A=A-1 // 32962
M=D // 32963
@LCL // 32964
A=M+1 // 32965
A=A+1 // 32966
A=A+1 // 32967
D=M // 32968
@SP // 32969
AM=M+1 // 32970
A=A-1 // 32971
M=D // 32972
// call Element.surface_normal
@7 // 32973
D=A // 32974
@14 // 32975
M=D // 32976
@Element.surface_normal // 32977
D=A // 32978
@13 // 32979
M=D // 32980
@Main.getRawPixelColor.ret.11 // 32981
D=A // 32982
@CALL // 32983
0;JMP // 32984
(Main.getRawPixelColor.ret.11)
@LCL // 32985
D=M // 32986
@5 // 32987
A=D+A // 32988
D=A // 32989
@R13 // 32990
M=D // 32991
@SP // 32992
AM=M-1 // 32993
D=M // 32994
@R13 // 32995
A=M // 32996
M=D // 32997

////LabelInstruction{label='Main.getRawPixelColor_WHILE_EXP1}
// label Main.getRawPixelColor_WHILE_EXP1
(Main.getRawPixelColor_WHILE_EXP1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 14"),
//        right:
//CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getNumLights}},
//        binaryOp: "LT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor_WHILE_END1}}
@Main.getRawPixelColor.LT.125 // 32998
D=A // 32999
@SP // 33000
AM=M+1 // 33001
A=A-1 // 33002
M=D // 33003
@LCL // 33004
D=M // 33005
@14 // 33006
A=D+A // 33007
D=M // 33008
@SP // 33009
AM=M+1 // 33010
A=A-1 // 33011
M=D // 33012
@ARG // 33013
A=M // 33014
D=M // 33015
@SP // 33016
AM=M+1 // 33017
A=A-1 // 33018
M=D // 33019
// call Scene.getNumLights
@6 // 33020
D=A // 33021
@14 // 33022
M=D // 33023
@Scene.getNumLights // 33024
D=A // 33025
@13 // 33026
M=D // 33027
@Main.getRawPixelColor.ret.12 // 33028
D=A // 33029
@CALL // 33030
0;JMP // 33031
(Main.getRawPixelColor.ret.12)
@SP // 33032
AM=M-1 // 33033
D=M // 33034
@SP // 33035
AM=M-1 // 33036
D=M-D // 33037
@DO_LT // 33038
0;JMP // 33039
(Main.getRawPixelColor.LT.125)
D=!D // 33040
@Main.getRawPixelColor_WHILE_END1 // 33041
D;JNE // 33042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getLights}}
//  pop:  PopInstruction{address=local 16}
//}

@ARG // 33043
A=M // 33044
D=M // 33045
@SP // 33046
AM=M+1 // 33047
A=A-1 // 33048
M=D // 33049
// call Scene.getLights
@6 // 33050
D=A // 33051
@14 // 33052
M=D // 33053
@Scene.getLights // 33054
D=A // 33055
@13 // 33056
M=D // 33057
@Main.getRawPixelColor.ret.13 // 33058
D=A // 33059
@CALL // 33060
0;JMP // 33061
(Main.getRawPixelColor.ret.13)
@LCL // 33062
D=M // 33063
@16 // 33064
A=D+A // 33065
D=A // 33066
@R13 // 33067
M=D // 33068
@SP // 33069
AM=M-1 // 33070
D=M // 33071
@R13 // 33072
A=M // 33073
M=D // 33074

////PushPopPair {
//  push: Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 16"),
//            right:
//                PushInstruction("local 14"),
//            binaryOp: "ADD"
//        )
//)
//  pop:  PopInstruction{address=local 17}
//}

@LCL // 33075
D=M // 33076
@16 // 33077
A=D+A // 33078
D=M // 33079
A=A-1 // 33080
A=A-1 // 33081
A=D+M // 33082
D=M // 33083
@SP // 33084
AM=M+1 // 33085
A=A-1 // 33086
M=D // 33087
@LCL // 33088
D=M // 33089
@17 // 33090
A=D+A // 33091
D=A // 33092
@R13 // 33093
M=D // 33094
@SP // 33095
AM=M-1 // 33096
D=M // 33097
@R13 // 33098
A=M // 33099
M=D // 33100

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 33101
A=M+1 // 33102
A=A+1 // 33103
A=A+1 // 33104
D=M // 33105
@SP // 33106
AM=M+1 // 33107
A=A-1 // 33108
M=D // 33109
// call Vec3.clone
@6 // 33110
D=A // 33111
@14 // 33112
M=D // 33113
@Vec3.clone // 33114
D=A // 33115
@13 // 33116
M=D // 33117
@Main.getRawPixelColor.ret.14 // 33118
D=A // 33119
@CALL // 33120
0;JMP // 33121
(Main.getRawPixelColor.ret.14)
@LCL // 33122
D=M // 33123
@6 // 33124
A=D+A // 33125
D=A // 33126
@R13 // 33127
M=D // 33128
@SP // 33129
AM=M-1 // 33130
D=M // 33131
@R13 // 33132
A=M // 33133
M=D // 33134

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getShadowBias}}], call=CallInstruction{Vec3.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33135
D=M // 33136
@6 // 33137
A=D+A // 33138
D=M // 33139
@SP // 33140
AM=M+1 // 33141
A=A-1 // 33142
M=D // 33143
@LCL // 33144
D=M // 33145
@17 // 33146
A=D+A // 33147
D=M // 33148
@SP // 33149
AM=M+1 // 33150
A=A-1 // 33151
M=D // 33152
// call DirectionalLight.getShadowBias
@6 // 33153
D=A // 33154
@14 // 33155
M=D // 33156
@DirectionalLight.getShadowBias // 33157
D=A // 33158
@13 // 33159
M=D // 33160
@Main.getRawPixelColor.ret.15 // 33161
D=A // 33162
@CALL // 33163
0;JMP // 33164
(Main.getRawPixelColor.ret.15)
// call Vec3.do_add
@7 // 33165
D=A // 33166
@14 // 33167
M=D // 33168
@Vec3.do_add // 33169
D=A // 33170
@13 // 33171
M=D // 33172
@Main.getRawPixelColor.ret.16 // 33173
D=A // 33174
@CALL // 33175
0;JMP // 33176
(Main.getRawPixelColor.ret.16)
@SP // 33177
M=M-1 // 33178

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getNegDirection}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 33179
D=M // 33180
@17 // 33181
A=D+A // 33182
D=M // 33183
@SP // 33184
AM=M+1 // 33185
A=A-1 // 33186
M=D // 33187
// call DirectionalLight.getNegDirection
@6 // 33188
D=A // 33189
@14 // 33190
M=D // 33191
@DirectionalLight.getNegDirection // 33192
D=A // 33193
@13 // 33194
M=D // 33195
@Main.getRawPixelColor.ret.17 // 33196
D=A // 33197
@CALL // 33198
0;JMP // 33199
(Main.getRawPixelColor.ret.17)
@LCL // 33200
D=M // 33201
@12 // 33202
A=D+A // 33203
D=A // 33204
@R13 // 33205
M=D // 33206
@SP // 33207
AM=M-1 // 33208
D=M // 33209
@R13 // 33210
A=M // 33211
M=D // 33212

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}], call=CallInstruction{Ray.new}}
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 33213
D=M // 33214
@6 // 33215
A=D+A // 33216
D=M // 33217
@SP // 33218
AM=M+1 // 33219
A=A-1 // 33220
M=D // 33221
@LCL // 33222
D=M // 33223
@12 // 33224
A=D+A // 33225
D=M // 33226
@SP // 33227
AM=M+1 // 33228
A=A-1 // 33229
M=D // 33230
// call Vec3.clone
@6 // 33231
D=A // 33232
@14 // 33233
M=D // 33234
@Vec3.clone // 33235
D=A // 33236
@13 // 33237
M=D // 33238
@Main.getRawPixelColor.ret.18 // 33239
D=A // 33240
@CALL // 33241
0;JMP // 33242
(Main.getRawPixelColor.ret.18)
// call Ray.new
@7 // 33243
D=A // 33244
@14 // 33245
M=D // 33246
@Ray.new // 33247
D=A // 33248
@13 // 33249
M=D // 33250
@Main.getRawPixelColor.ret.19 // 33251
D=A // 33252
@CALL // 33253
0;JMP // 33254
(Main.getRawPixelColor.ret.19)
@LCL // 33255
D=M // 33256
@7 // 33257
A=D+A // 33258
D=A // 33259
@R13 // 33260
M=D // 33261
@SP // 33262
AM=M-1 // 33263
D=M // 33264
@R13 // 33265
A=M // 33266
M=D // 33267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 7")], call=CallInstruction{Scene.trace}}
//  pop:  PopInstruction{address=local 8}
//}

@ARG // 33268
A=M // 33269
D=M // 33270
@SP // 33271
AM=M+1 // 33272
A=A-1 // 33273
M=D // 33274
@LCL // 33275
D=M // 33276
@7 // 33277
A=D+A // 33278
D=M // 33279
@SP // 33280
AM=M+1 // 33281
A=A-1 // 33282
M=D // 33283
// call Scene.trace
@7 // 33284
D=A // 33285
@14 // 33286
M=D // 33287
@Scene.trace // 33288
D=A // 33289
@13 // 33290
M=D // 33291
@Main.getRawPixelColor.ret.20 // 33292
D=A // 33293
@CALL // 33294
0;JMP // 33295
(Main.getRawPixelColor.ret.20)
@LCL // 33296
D=M // 33297
@8 // 33298
A=D+A // 33299
D=A // 33300
@R13 // 33301
M=D // 33302
@SP // 33303
AM=M-1 // 33304
D=M // 33305
@R13 // 33306
A=M // 33307
M=D // 33308

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 8"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//)
//  pop:  PopInstruction{address=local 9}
//}

@Main.getRawPixelColor.EQ.126 // 33309
D=A // 33310
@SP // 33311
AM=M+1 // 33312
A=A-1 // 33313
M=D // 33314
@LCL // 33315
D=M // 33316
@8 // 33317
A=D+A // 33318
D=M // 33319
@DO_EQ // 33320
0;JMP // 33321
(Main.getRawPixelColor.EQ.126)
@SP // 33322
AM=M+1 // 33323
A=A-1 // 33324
M=D // 33325
@LCL // 33326
D=M // 33327
@9 // 33328
A=D+A // 33329
D=A // 33330
@R13 // 33331
M=D // 33332
@SP // 33333
AM=M-1 // 33334
D=M // 33335
@R13 // 33336
A=M // 33337
M=D // 33338

////ConditionalGroup{push=PushInstruction("local 8"), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE2}}
@LCL // 33339
D=M // 33340
@8 // 33341
A=D+A // 33342
D=M // 33343
@Main.getRawPixelColor$IF_TRUE2 // 33344
D;JNE // 33345

////GotoInstruction{label='Main.getRawPixelColor$IF_END2}
// goto Main.getRawPixelColor$IF_END2
@Main.getRawPixelColor$IF_END2 // 33346
0;JMP // 33347

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE2}
// label Main.getRawPixelColor$IF_TRUE2
(Main.getRawPixelColor$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33348
D=M // 33349
@8 // 33350
A=D+A // 33351
D=M // 33352
@SP // 33353
AM=M+1 // 33354
A=A-1 // 33355
M=D // 33356
// call Intersection.dispose
@6 // 33357
D=A // 33358
@14 // 33359
M=D // 33360
@Intersection.dispose // 33361
D=A // 33362
@13 // 33363
M=D // 33364
@Main.getRawPixelColor.ret.21 // 33365
D=A // 33366
@CALL // 33367
0;JMP // 33368
(Main.getRawPixelColor.ret.21)
@SP // 33369
M=M-1 // 33370

////LabelInstruction{label='Main.getRawPixelColor$IF_END2}
// label Main.getRawPixelColor$IF_END2
(Main.getRawPixelColor$IF_END2)

////ConditionalGroup{push=PushInstruction("local 9"), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE3}}
@LCL // 33371
D=M // 33372
@9 // 33373
A=D+A // 33374
D=M // 33375
@Main.getRawPixelColor$IF_TRUE3 // 33376
D;JNE // 33377

////GotoInstruction{label='Main.getRawPixelColor$IF_END3}
// goto Main.getRawPixelColor$IF_END3
@Main.getRawPixelColor$IF_END3 // 33378
0;JMP // 33379

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE3}
// label Main.getRawPixelColor$IF_TRUE3
(Main.getRawPixelColor$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getNegDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 33380
D=M // 33381
@5 // 33382
A=D+A // 33383
D=M // 33384
@SP // 33385
AM=M+1 // 33386
A=A-1 // 33387
M=D // 33388
@LCL // 33389
D=M // 33390
@17 // 33391
A=D+A // 33392
D=M // 33393
@SP // 33394
AM=M+1 // 33395
A=A-1 // 33396
M=D // 33397
// call DirectionalLight.getNegDirection
@6 // 33398
D=A // 33399
@14 // 33400
M=D // 33401
@DirectionalLight.getNegDirection // 33402
D=A // 33403
@13 // 33404
M=D // 33405
@Main.getRawPixelColor.ret.22 // 33406
D=A // 33407
@CALL // 33408
0;JMP // 33409
(Main.getRawPixelColor.ret.22)
// call Vec3.dot
@7 // 33410
D=A // 33411
@14 // 33412
M=D // 33413
@Vec3.dot // 33414
D=A // 33415
@13 // 33416
M=D // 33417
@Main.getRawPixelColor.ret.23 // 33418
D=A // 33419
@CALL // 33420
0;JMP // 33421
(Main.getRawPixelColor.ret.23)
@LCL // 33422
D=M // 33423
@10 // 33424
A=D+A // 33425
D=A // 33426
@R13 // 33427
M=D // 33428
@SP // 33429
AM=M-1 // 33430
D=M // 33431
@R13 // 33432
A=M // 33433
M=D // 33434

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 10")], call=CallInstruction{Number.is_positive}}, ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE4}}
@LCL // 33435
D=M // 33436
@10 // 33437
A=D+A // 33438
D=M // 33439
@SP // 33440
AM=M+1 // 33441
A=A-1 // 33442
M=D // 33443
// call Number.is_positive
@6 // 33444
D=A // 33445
@14 // 33446
M=D // 33447
@Number.is_positive // 33448
D=A // 33449
@13 // 33450
M=D // 33451
@Main.getRawPixelColor.ret.24 // 33452
D=A // 33453
@CALL // 33454
0;JMP // 33455
(Main.getRawPixelColor.ret.24)
@SP // 33456
AM=M-1 // 33457
D=M // 33458
@Main.getRawPixelColor$IF_TRUE4 // 33459
D;JNE // 33460

////GotoInstruction{label='Main.getRawPixelColor$IF_END4}
// goto Main.getRawPixelColor$IF_END4
@Main.getRawPixelColor$IF_END4 // 33461
0;JMP // 33462

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE4}
// label Main.getRawPixelColor$IF_TRUE4
(Main.getRawPixelColor$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getColor}}
//  pop:  PopInstruction{address=local 15}
//}

@LCL // 33463
D=M // 33464
@17 // 33465
A=D+A // 33466
D=M // 33467
@SP // 33468
AM=M+1 // 33469
A=A-1 // 33470
M=D // 33471
// call DirectionalLight.getColor
@6 // 33472
D=A // 33473
@14 // 33474
M=D // 33475
@DirectionalLight.getColor // 33476
D=A // 33477
@13 // 33478
M=D // 33479
@Main.getRawPixelColor.ret.25 // 33480
D=A // 33481
@CALL // 33482
0;JMP // 33483
(Main.getRawPixelColor.ret.25)
@LCL // 33484
D=M // 33485
@15 // 33486
A=D+A // 33487
D=A // 33488
@R13 // 33489
M=D // 33490
@SP // 33491
AM=M-1 // 33492
D=M // 33493
@R13 // 33494
A=M // 33495
M=D // 33496

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 15")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 33497
D=M // 33498
@15 // 33499
A=D+A // 33500
D=M // 33501
@SP // 33502
AM=M+1 // 33503
A=A-1 // 33504
M=D // 33505
// call Number.clone
@6 // 33506
D=A // 33507
@14 // 33508
M=D // 33509
@Number.clone // 33510
D=A // 33511
@13 // 33512
M=D // 33513
@Main.getRawPixelColor.ret.26 // 33514
D=A // 33515
@CALL // 33516
0;JMP // 33517
(Main.getRawPixelColor.ret.26)
@LCL // 33518
D=M // 33519
@11 // 33520
A=D+A // 33521
D=A // 33522
@R13 // 33523
M=D // 33524
@SP // 33525
AM=M-1 // 33526
D=M // 33527
@R13 // 33528
A=M // 33529
M=D // 33530

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), PushInstruction("local 10")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33531
D=M // 33532
@11 // 33533
A=D+A // 33534
D=M // 33535
@SP // 33536
AM=M+1 // 33537
A=A-1 // 33538
M=D // 33539
@LCL // 33540
D=M // 33541
@10 // 33542
A=D+A // 33543
D=M // 33544
@SP // 33545
AM=M+1 // 33546
A=A-1 // 33547
M=D // 33548
// call Number.do_mul
@7 // 33549
D=A // 33550
@14 // 33551
M=D // 33552
@Number.do_mul // 33553
D=A // 33554
@13 // 33555
M=D // 33556
@Main.getRawPixelColor.ret.27 // 33557
D=A // 33558
@CALL // 33559
0;JMP // 33560
(Main.getRawPixelColor.ret.27)
@SP // 33561
M=M-1 // 33562

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), CallGroup{pushes=[], call=CallInstruction{Number.getPi}}], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33563
D=M // 33564
@11 // 33565
A=D+A // 33566
D=M // 33567
@SP // 33568
AM=M+1 // 33569
A=A-1 // 33570
M=D // 33571
// call Number.getPi
@5 // 33572
D=A // 33573
@14 // 33574
M=D // 33575
@Number.getPi // 33576
D=A // 33577
@13 // 33578
M=D // 33579
@Main.getRawPixelColor.ret.28 // 33580
D=A // 33581
@CALL // 33582
0;JMP // 33583
(Main.getRawPixelColor.ret.28)
// call Number.do_div
@7 // 33584
D=A // 33585
@14 // 33586
M=D // 33587
@Number.do_div // 33588
D=A // 33589
@13 // 33590
M=D // 33591
@Main.getRawPixelColor.ret.29 // 33592
D=A // 33593
@CALL // 33594
0;JMP // 33595
(Main.getRawPixelColor.ret.29)
@SP // 33596
M=M-1 // 33597

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getObject}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 33598
A=M+1 // 33599
A=A+1 // 33600
D=M // 33601
@SP // 33602
AM=M+1 // 33603
A=A-1 // 33604
M=D // 33605
// call Intersection.getObject
@6 // 33606
D=A // 33607
@14 // 33608
M=D // 33609
@Intersection.getObject // 33610
D=A // 33611
@13 // 33612
M=D // 33613
@Main.getRawPixelColor.ret.30 // 33614
D=A // 33615
@CALL // 33616
0;JMP // 33617
(Main.getRawPixelColor.ret.30)
@LCL // 33618
D=M // 33619
@13 // 33620
A=D+A // 33621
D=A // 33622
@R13 // 33623
M=D // 33624
@SP // 33625
AM=M-1 // 33626
D=M // 33627
@R13 // 33628
A=M // 33629
M=D // 33630

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13"), PushInstruction("local 3")], call=CallInstruction{Element.color}}
//  pop:  PopInstruction{address=local 15}
//}

@LCL // 33631
D=M // 33632
@13 // 33633
A=D+A // 33634
D=M // 33635
@SP // 33636
AM=M+1 // 33637
A=A-1 // 33638
M=D // 33639
@LCL // 33640
A=M+1 // 33641
A=A+1 // 33642
A=A+1 // 33643
D=M // 33644
@SP // 33645
AM=M+1 // 33646
A=A-1 // 33647
M=D // 33648
// call Element.color
@7 // 33649
D=A // 33650
@14 // 33651
M=D // 33652
@Element.color // 33653
D=A // 33654
@13 // 33655
M=D // 33656
@Main.getRawPixelColor.ret.31 // 33657
D=A // 33658
@CALL // 33659
0;JMP // 33660
(Main.getRawPixelColor.ret.31)
@LCL // 33661
D=M // 33662
@15 // 33663
A=D+A // 33664
D=A // 33665
@R13 // 33666
M=D // 33667
@SP // 33668
AM=M-1 // 33669
D=M // 33670
@R13 // 33671
A=M // 33672
M=D // 33673

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), PushInstruction("local 15")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33674
D=M // 33675
@11 // 33676
A=D+A // 33677
D=M // 33678
@SP // 33679
AM=M+1 // 33680
A=A-1 // 33681
M=D // 33682
@LCL // 33683
D=M // 33684
@15 // 33685
A=D+A // 33686
D=M // 33687
@SP // 33688
AM=M+1 // 33689
A=A-1 // 33690
M=D // 33691
// call Number.do_mul
@7 // 33692
D=A // 33693
@14 // 33694
M=D // 33695
@Number.do_mul // 33696
D=A // 33697
@13 // 33698
M=D // 33699
@Main.getRawPixelColor.ret.32 // 33700
D=A // 33701
@CALL // 33702
0;JMP // 33703
(Main.getRawPixelColor.ret.32)
@SP // 33704
M=M-1 // 33705

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 15")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33706
D=M // 33707
@15 // 33708
A=D+A // 33709
D=M // 33710
@SP // 33711
AM=M+1 // 33712
A=A-1 // 33713
M=D // 33714
// call Number.dispose
@6 // 33715
D=A // 33716
@14 // 33717
M=D // 33718
@Number.dispose // 33719
D=A // 33720
@13 // 33721
M=D // 33722
@Main.getRawPixelColor.ret.33 // 33723
D=A // 33724
@CALL // 33725
0;JMP // 33726
(Main.getRawPixelColor.ret.33)
@SP // 33727
M=M-1 // 33728

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 11")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33729
A=M // 33730
D=M // 33731
@SP // 33732
AM=M+1 // 33733
A=A-1 // 33734
M=D // 33735
@LCL // 33736
D=M // 33737
@11 // 33738
A=D+A // 33739
D=M // 33740
@SP // 33741
AM=M+1 // 33742
A=A-1 // 33743
M=D // 33744
// call Number.do_add
@7 // 33745
D=A // 33746
@14 // 33747
M=D // 33748
@Number.do_add // 33749
D=A // 33750
@13 // 33751
M=D // 33752
@Main.getRawPixelColor.ret.34 // 33753
D=A // 33754
@CALL // 33755
0;JMP // 33756
(Main.getRawPixelColor.ret.34)
@SP // 33757
M=M-1 // 33758

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33759
D=M // 33760
@11 // 33761
A=D+A // 33762
D=M // 33763
@SP // 33764
AM=M+1 // 33765
A=A-1 // 33766
M=D // 33767
// call Number.dispose
@6 // 33768
D=A // 33769
@14 // 33770
M=D // 33771
@Number.dispose // 33772
D=A // 33773
@13 // 33774
M=D // 33775
@Main.getRawPixelColor.ret.35 // 33776
D=A // 33777
@CALL // 33778
0;JMP // 33779
(Main.getRawPixelColor.ret.35)
@SP // 33780
M=M-1 // 33781

////LabelInstruction{label='Main.getRawPixelColor$IF_END4}
// label Main.getRawPixelColor$IF_END4
(Main.getRawPixelColor$IF_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 10")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33782
D=M // 33783
@10 // 33784
A=D+A // 33785
D=M // 33786
@SP // 33787
AM=M+1 // 33788
A=A-1 // 33789
M=D // 33790
// call Number.dispose
@6 // 33791
D=A // 33792
@14 // 33793
M=D // 33794
@Number.dispose // 33795
D=A // 33796
@13 // 33797
M=D // 33798
@Main.getRawPixelColor.ret.36 // 33799
D=A // 33800
@CALL // 33801
0;JMP // 33802
(Main.getRawPixelColor.ret.36)
@SP // 33803
M=M-1 // 33804

////LabelInstruction{label='Main.getRawPixelColor$IF_END3}
// label Main.getRawPixelColor$IF_END3
(Main.getRawPixelColor$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Ray.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33805
D=M // 33806
@7 // 33807
A=D+A // 33808
D=M // 33809
@SP // 33810
AM=M+1 // 33811
A=A-1 // 33812
M=D // 33813
// call Ray.dispose
@6 // 33814
D=A // 33815
@14 // 33816
M=D // 33817
@Ray.dispose // 33818
D=A // 33819
@13 // 33820
M=D // 33821
@Main.getRawPixelColor.ret.37 // 33822
D=A // 33823
@CALL // 33824
0;JMP // 33825
(Main.getRawPixelColor.ret.37)
@SP // 33826
M=M-1 // 33827

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=local 14}
//}

@LCL // 33828
D=M // 33829
@14 // 33830
A=D+A // 33831
M=M+1 // 33832

////GotoInstruction{label='Main.getRawPixelColor_WHILE_EXP1}
// goto Main.getRawPixelColor_WHILE_EXP1
@Main.getRawPixelColor_WHILE_EXP1 // 33833
0;JMP // 33834

////LabelInstruction{label='Main.getRawPixelColor_WHILE_END1}
// label Main.getRawPixelColor_WHILE_END1
(Main.getRawPixelColor_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33835
A=M+1 // 33836
A=A+1 // 33837
D=M // 33838
@SP // 33839
AM=M+1 // 33840
A=A-1 // 33841
M=D // 33842
// call Intersection.dispose
@6 // 33843
D=A // 33844
@14 // 33845
M=D // 33846
@Intersection.dispose // 33847
D=A // 33848
@13 // 33849
M=D // 33850
@Main.getRawPixelColor.ret.38 // 33851
D=A // 33852
@CALL // 33853
0;JMP // 33854
(Main.getRawPixelColor.ret.38)
@SP // 33855
M=M-1 // 33856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33857
A=M+1 // 33858
A=A+1 // 33859
A=A+1 // 33860
D=M // 33861
@SP // 33862
AM=M+1 // 33863
A=A-1 // 33864
M=D // 33865
// call Vec3.dispose
@6 // 33866
D=A // 33867
@14 // 33868
M=D // 33869
@Vec3.dispose // 33870
D=A // 33871
@13 // 33872
M=D // 33873
@Main.getRawPixelColor.ret.39 // 33874
D=A // 33875
@CALL // 33876
0;JMP // 33877
(Main.getRawPixelColor.ret.39)
@SP // 33878
M=M-1 // 33879

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33880
D=M // 33881
@4 // 33882
A=D+A // 33883
D=M // 33884
@SP // 33885
AM=M+1 // 33886
A=A-1 // 33887
M=D // 33888
// call Vec3.dispose
@6 // 33889
D=A // 33890
@14 // 33891
M=D // 33892
@Vec3.dispose // 33893
D=A // 33894
@13 // 33895
M=D // 33896
@Main.getRawPixelColor.ret.40 // 33897
D=A // 33898
@CALL // 33899
0;JMP // 33900
(Main.getRawPixelColor.ret.40)
@SP // 33901
M=M-1 // 33902

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33903
D=M // 33904
@5 // 33905
A=D+A // 33906
D=M // 33907
@SP // 33908
AM=M+1 // 33909
A=A-1 // 33910
M=D // 33911
// call Vec3.dispose
@6 // 33912
D=A // 33913
@14 // 33914
M=D // 33915
@Vec3.dispose // 33916
D=A // 33917
@13 // 33918
M=D // 33919
@Main.getRawPixelColor.ret.41 // 33920
D=A // 33921
@CALL // 33922
0;JMP // 33923
(Main.getRawPixelColor.ret.41)
@SP // 33924
M=M-1 // 33925

////LabelInstruction{label='Main.getRawPixelColor$IF_END1}
// label Main.getRawPixelColor$IF_END1
(Main.getRawPixelColor$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33926
A=M+1 // 33927
D=M // 33928
@SP // 33929
AM=M+1 // 33930
A=A-1 // 33931
M=D // 33932
// call Ray.dispose
@6 // 33933
D=A // 33934
@14 // 33935
M=D // 33936
@Ray.dispose // 33937
D=A // 33938
@13 // 33939
M=D // 33940
@Main.getRawPixelColor.ret.42 // 33941
D=A // 33942
@CALL // 33943
0;JMP // 33944
(Main.getRawPixelColor.ret.42)
@SP // 33945
M=M-1 // 33946

////PushInstruction("local 0")
@LCL // 33947
A=M // 33948
D=M // 33949
@SP // 33950
AM=M+1 // 33951
A=A-1 // 33952
M=D // 33953
@RETURN // 33954
0;JMP // 33955

////FunctionInstruction{functionName='Number.is_positive', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2}}
// function Number.is_positive with 0
(Number.is_positive)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 33956
A=M // 33957
D=M // 33958
@3 // 33959
M=D // 33960

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_positive}}
@THIS // 33961
A=M // 33962
D=M // 33963
@SP // 33964
AM=M+1 // 33965
A=A-1 // 33966
M=D // 33967
// call Int32.is_positive
@6 // 33968
D=A // 33969
@14 // 33970
M=D // 33971
@Int32.is_positive // 33972
D=A // 33973
@13 // 33974
M=D // 33975
@Number.is_positive.ret.0 // 33976
D=A // 33977
@CALL // 33978
0;JMP // 33979
(Number.is_positive.ret.0)
@RETURN // 33980
0;JMP // 33981

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.twoToThe=0, Math.max=0, Math.init=1, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 33982
D=A // 33983
@SP // 33984
AM=D+M // 33985
A=A-1 // 33986
M=0 // 33987
A=A-1 // 33988
M=0 // 33989
A=A-1 // 33990
M=0 // 33991

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.EQ.127 // 33992
D=A // 33993
@SP // 33994
AM=M+1 // 33995
A=A-1 // 33996
M=D // 33997
@ARG // 33998
A=M+1 // 33999
D=M // 34000
@DO_EQ // 34001
0;JMP // 34002
(Math.divide.EQ.127)
@Math.divide$IF_TRUE1 // 34003
D;JNE // 34004

////GotoInstruction{label='Math.divide$IF_END1}
// goto Math.divide$IF_END1
@Math.divide$IF_END1 // 34005
0;JMP // 34006

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 34007
AM=M+1 // 34008
A=A-1 // 34009
M=0 // 34010
@RETURN // 34011
0;JMP // 34012

////LabelInstruction{label='Math.divide$IF_END1}
// label Math.divide$IF_END1
(Math.divide$IF_END1)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE2}}
@Math.divide.EQ.128 // 34013
D=A // 34014
@SP // 34015
AM=M+1 // 34016
A=A-1 // 34017
M=D // 34018
@ARG // 34019
A=M+1 // 34020
D=M // 34021
A=A-1 // 34022
D=M-D // 34023
@DO_EQ // 34024
0;JMP // 34025
(Math.divide.EQ.128)
@Math.divide$IF_TRUE2 // 34026
D;JNE // 34027

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 34028
0;JMP // 34029

////LabelInstruction{label='Math.divide$IF_TRUE2}
// label Math.divide$IF_TRUE2
(Math.divide$IF_TRUE2)

////PushInstruction("constant 1")
@SP // 34030
AM=M+1 // 34031
A=A-1 // 34032
M=1 // 34033
@RETURN // 34034
0;JMP // 34035

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 34036
A=M // 34037
D=M // 34038
@SP // 34039
AM=M+1 // 34040
A=A-1 // 34041
M=D // 34042
@ARG // 34043
A=M // 34044
D=M // 34045
@SP // 34046
AM=M+1 // 34047
A=A-1 // 34048
M=D // 34049
@SP // 34050
A=M-1 // 34051
M=-D // 34052
// call Math.max
@7 // 34053
D=A // 34054
@14 // 34055
M=D // 34056
@Math.max // 34057
D=A // 34058
@13 // 34059
M=D // 34060
@Math.divide.ret.0 // 34061
D=A // 34062
@CALL // 34063
0;JMP // 34064
(Math.divide.ret.0)
@SP // 34065
AM=M-1 // 34066
D=M // 34067
@LCL // 34068
A=M+1 // 34069
M=D // 34070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)], call=CallInstruction{Math.max}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 34071
A=M+1 // 34072
D=M // 34073
@SP // 34074
AM=M+1 // 34075
A=A-1 // 34076
M=D // 34077
@ARG // 34078
A=M+1 // 34079
D=M // 34080
@SP // 34081
AM=M+1 // 34082
A=A-1 // 34083
M=D // 34084
@SP // 34085
A=M-1 // 34086
M=-D // 34087
// call Math.max
@7 // 34088
D=A // 34089
@14 // 34090
M=D // 34091
@Math.max // 34092
D=A // 34093
@13 // 34094
M=D // 34095
@Math.divide.ret.1 // 34096
D=A // 34097
@CALL // 34098
0;JMP // 34099
(Math.divide.ret.1)
@SP // 34100
AM=M-1 // 34101
D=M // 34102
@LCL // 34103
A=M+1 // 34104
A=A+1 // 34105
M=D // 34106

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE3}}
@Math.divide.GT.129 // 34107
D=A // 34108
@SP // 34109
AM=M+1 // 34110
A=A-1 // 34111
M=D // 34112
@LCL // 34113
A=M+1 // 34114
A=A+1 // 34115
D=M // 34116
A=A-1 // 34117
D=D-M // 34118
@DO_GT // 34119
0;JMP // 34120
(Math.divide.GT.129)
@Math.divide$IF_TRUE3 // 34121
D;JNE // 34122

////GotoInstruction{label='Math.divide$IF_END3}
// goto Math.divide$IF_END3
@Math.divide$IF_END3 // 34123
0;JMP // 34124

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 34125
AM=M+1 // 34126
A=A-1 // 34127
M=0 // 34128
@RETURN // 34129
0;JMP // 34130

////LabelInstruction{label='Math.divide$IF_END3}
// label Math.divide$IF_END3
(Math.divide$IF_END3)

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

@LCL // 34131
A=M+1 // 34132
D=M // 34133
@SP // 34134
AM=M+1 // 34135
A=A-1 // 34136
M=D // 34137
@LCL // 34138
A=M+1 // 34139
A=A+1 // 34140
D=M // 34141
D=D+M // 34142
@SP // 34143
AM=M+1 // 34144
A=A-1 // 34145
M=D // 34146
// call Math.divide
@7 // 34147
D=A // 34148
@14 // 34149
M=D // 34150
@Math.divide // 34151
D=A // 34152
@13 // 34153
M=D // 34154
@Math.divide.ret.2 // 34155
D=A // 34156
@CALL // 34157
0;JMP // 34158
(Math.divide.ret.2)
@SP // 34159
AM=M-1 // 34160
D=M // 34161
@LCL // 34162
A=M // 34163
M=D // 34164

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
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE4}}
@Math.divide.LT.130 // 34165
D=A // 34166
@SP // 34167
AM=M+1 // 34168
A=A-1 // 34169
M=D // 34170
@LCL // 34171
A=M+1 // 34172
D=M // 34173
@SP // 34174
AM=M+1 // 34175
A=A-1 // 34176
M=D // 34177
@LCL // 34178
A=M // 34179
D=M // 34180
D=D+M // 34181
@SP // 34182
AM=M+1 // 34183
A=A-1 // 34184
M=D // 34185
@LCL // 34186
A=M+1 // 34187
A=A+1 // 34188
D=M // 34189
@SP // 34190
AM=M+1 // 34191
A=A-1 // 34192
M=D // 34193
// call Math.multiply
@7 // 34194
D=A // 34195
@14 // 34196
M=D // 34197
@Math.multiply // 34198
D=A // 34199
@13 // 34200
M=D // 34201
@Math.divide.ret.3 // 34202
D=A // 34203
@CALL // 34204
0;JMP // 34205
(Math.divide.ret.3)
@SP // 34206
AM=M-1 // 34207
D=M // 34208
@SP // 34209
AM=M-1 // 34210
D=M-D // 34211
@SP // 34212
AM=M+1 // 34213
A=A-1 // 34214
M=D // 34215
@LCL // 34216
A=M+1 // 34217
A=A+1 // 34218
D=M // 34219
@SP // 34220
AM=M-1 // 34221
D=M-D // 34222
@DO_LT // 34223
0;JMP // 34224
(Math.divide.LT.130)
@Math.divide$IF_TRUE4 // 34225
D;JNE // 34226

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 34227
0;JMP // 34228

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

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
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE5}}
@Math.divide.LT.131 // 34229
D=A // 34230
@SP // 34231
AM=M+1 // 34232
A=A-1 // 34233
M=D // 34234
@ARG // 34235
A=M // 34236
D=M // 34237
@DO_LT // 34238
0;JMP // 34239
(Math.divide.LT.131)
@SP // 34240
AM=M+1 // 34241
A=A-1 // 34242
M=D // 34243
@Math.divide.GT.132 // 34244
D=A // 34245
@SP // 34246
AM=M+1 // 34247
A=A-1 // 34248
M=D // 34249
@ARG // 34250
A=M+1 // 34251
D=M // 34252
@DO_GT // 34253
0;JMP // 34254
(Math.divide.GT.132)
@SP // 34255
AM=M-1 // 34256
D=D&M // 34257
@SP // 34258
AM=M+1 // 34259
A=A-1 // 34260
M=D // 34261
@Math.divide.GT.133 // 34262
D=A // 34263
@SP // 34264
AM=M+1 // 34265
A=A-1 // 34266
M=D // 34267
@ARG // 34268
A=M // 34269
D=M // 34270
@DO_GT // 34271
0;JMP // 34272
(Math.divide.GT.133)
@SP // 34273
AM=M+1 // 34274
A=A-1 // 34275
M=D // 34276
@Math.divide.LT.134 // 34277
D=A // 34278
@SP // 34279
AM=M+1 // 34280
A=A-1 // 34281
M=D // 34282
@ARG // 34283
A=M+1 // 34284
D=M // 34285
@DO_LT // 34286
0;JMP // 34287
(Math.divide.LT.134)
@SP // 34288
AM=M-1 // 34289
D=D&M // 34290
@SP // 34291
AM=M-1 // 34292
D=D|M // 34293
@Math.divide$IF_TRUE5 // 34294
D;JNE // 34295

////GotoInstruction{label='Math.divide$IF_END5}
// goto Math.divide$IF_END5
@Math.divide$IF_END5 // 34296
0;JMP // 34297

////LabelInstruction{label='Math.divide$IF_TRUE5}
// label Math.divide$IF_TRUE5
(Math.divide$IF_TRUE5)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 34298
A=M // 34299
D=-M // 34300
@LCL // 34301
A=M // 34302
M=D // 34303

////LabelInstruction{label='Math.divide$IF_END5}
// label Math.divide$IF_END5
(Math.divide$IF_END5)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 34304
A=M // 34305
D=M // 34306
D=D+M // 34307
@SP // 34308
AM=M+1 // 34309
A=A-1 // 34310
M=D // 34311
@RETURN // 34312
0;JMP // 34313

////GotoInstruction{label='Math.divide$IF_END4}
// goto Math.divide$IF_END4
@Math.divide$IF_END4 // 34314
0;JMP // 34315

////LabelInstruction{label='Math.divide$IF_FALSE4}
// label Math.divide$IF_FALSE4
(Math.divide$IF_FALSE4)

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
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE6}}
@Math.divide.LT.135 // 34316
D=A // 34317
@SP // 34318
AM=M+1 // 34319
A=A-1 // 34320
M=D // 34321
@ARG // 34322
A=M // 34323
D=M // 34324
@DO_LT // 34325
0;JMP // 34326
(Math.divide.LT.135)
@SP // 34327
AM=M+1 // 34328
A=A-1 // 34329
M=D // 34330
@Math.divide.GT.136 // 34331
D=A // 34332
@SP // 34333
AM=M+1 // 34334
A=A-1 // 34335
M=D // 34336
@ARG // 34337
A=M+1 // 34338
D=M // 34339
@DO_GT // 34340
0;JMP // 34341
(Math.divide.GT.136)
@SP // 34342
AM=M-1 // 34343
D=D&M // 34344
@SP // 34345
AM=M+1 // 34346
A=A-1 // 34347
M=D // 34348
@Math.divide.GT.137 // 34349
D=A // 34350
@SP // 34351
AM=M+1 // 34352
A=A-1 // 34353
M=D // 34354
@ARG // 34355
A=M // 34356
D=M // 34357
@DO_GT // 34358
0;JMP // 34359
(Math.divide.GT.137)
@SP // 34360
AM=M+1 // 34361
A=A-1 // 34362
M=D // 34363
@Math.divide.LT.138 // 34364
D=A // 34365
@SP // 34366
AM=M+1 // 34367
A=A-1 // 34368
M=D // 34369
@ARG // 34370
A=M+1 // 34371
D=M // 34372
@DO_LT // 34373
0;JMP // 34374
(Math.divide.LT.138)
@SP // 34375
AM=M-1 // 34376
D=D&M // 34377
@SP // 34378
AM=M-1 // 34379
D=D|M // 34380
@Math.divide$IF_TRUE6 // 34381
D;JNE // 34382

////GotoInstruction{label='Math.divide$IF_END6}
// goto Math.divide$IF_END6
@Math.divide$IF_END6 // 34383
0;JMP // 34384

////LabelInstruction{label='Math.divide$IF_TRUE6}
// label Math.divide$IF_TRUE6
(Math.divide$IF_TRUE6)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 34385
A=M // 34386
D=-M // 34387
@LCL // 34388
A=M // 34389
M=D // 34390

////LabelInstruction{label='Math.divide$IF_END6}
// label Math.divide$IF_END6
(Math.divide$IF_END6)

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
@LCL // 34391
A=M // 34392
D=M // 34393
D=D+M // 34394
D=D+1 // 34395
@SP // 34396
AM=M+1 // 34397
A=A-1 // 34398
M=D // 34399
@RETURN // 34400
0;JMP // 34401

////LabelInstruction{label='Math.divide$IF_END4}
// label Math.divide$IF_END4
(Math.divide$IF_END4)

////FunctionInstruction{functionName='DirectionalLight.getNegDirection', numLocals=0, funcMapping={DirectionalLight.new=9, DirectionalLight.dispose=3, DirectionalLight.getShadowBias=0, DirectionalLight.getColor=0}}
// function DirectionalLight.getNegDirection with 0
(DirectionalLight.getNegDirection)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34402
A=M // 34403
D=M // 34404
@3 // 34405
M=D // 34406

////PushInstruction("this 2")
@THIS // 34407
A=M+1 // 34408
A=A+1 // 34409
D=M // 34410
@SP // 34411
AM=M+1 // 34412
A=A-1 // 34413
M=D // 34414
@RETURN // 34415
0;JMP // 34416

////FunctionInstruction{functionName='Vec3.dist_sq', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_normalize=15, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0, Vec3.getZ=0}}
// function Vec3.dist_sq with 0
(Vec3.dist_sq)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34417
A=M // 34418
D=M // 34419
@3 // 34420
M=D // 34421

////CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("pointer 0")], call=CallInstruction{Vec3.dot}}
@2 // 34422
D=A // 34423
@SP // 34424
M=D+M // 34425
@3 // 34426
D=M // 34427
@SP // 34428
A=M-1 // 34429
M=D // 34430
A=A-1 // 34431
M=D // 34432
// call Vec3.dot
@7 // 34433
D=A // 34434
@14 // 34435
M=D // 34436
@Vec3.dot // 34437
D=A // 34438
@13 // 34439
M=D // 34440
@Vec3.dist_sq.ret.0 // 34441
D=A // 34442
@CALL // 34443
0;JMP // 34444
(Vec3.dist_sq.ret.0)
@RETURN // 34445
0;JMP // 34446

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.printInt=4, Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 34447
D=A // 34448
@SP // 34449
AM=D+M // 34450
A=A-1 // 34451
M=0 // 34452
A=A-1 // 34453
M=0 // 34454
A=A-1 // 34455
M=0 // 34456
A=A-1 // 34457
M=0 // 34458

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 34459
A=M // 34460
D=M // 34461
@SP // 34462
AM=M+1 // 34463
A=A-1 // 34464
M=D // 34465
// call Output.getMap
@6 // 34466
D=A // 34467
@14 // 34468
M=D // 34469
@Output.getMap // 34470
D=A // 34471
@13 // 34472
M=D // 34473
@Output.printChar.ret.0 // 34474
D=A // 34475
@CALL // 34476
0;JMP // 34477
(Output.printChar.ret.0)
@SP // 34478
AM=M-1 // 34479
D=M // 34480
@LCL // 34481
A=M // 34482
M=D // 34483

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 34484
A=M+1 // 34485
A=A+1 // 34486
A=A+1 // 34487
M=0 // 34488

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
@Output.printChar.LT.139 // 34489
D=A // 34490
@SP // 34491
AM=M+1 // 34492
A=A-1 // 34493
M=D // 34494
@LCL // 34495
A=M+1 // 34496
A=A+1 // 34497
A=A+1 // 34498
D=M // 34499
@11 // 34500
D=D-A // 34501
@DO_LT // 34502
0;JMP // 34503
(Output.printChar.LT.139)
D=!D // 34504
@Output.printChar_WHILE_END1 // 34505
D;JNE // 34506

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

@Output.2 // 34507
D=M // 34508
@SP // 34509
AM=M+1 // 34510
A=A-1 // 34511
M=D // 34512
@11 // 34513
D=A // 34514
@SP // 34515
AM=M+1 // 34516
A=A-1 // 34517
M=D // 34518
// call Math.multiply
@7 // 34519
D=A // 34520
@14 // 34521
M=D // 34522
@Math.multiply // 34523
D=A // 34524
@13 // 34525
M=D // 34526
@Output.printChar.ret.1 // 34527
D=A // 34528
@CALL // 34529
0;JMP // 34530
(Output.printChar.ret.1)
@LCL // 34531
A=M+1 // 34532
A=A+1 // 34533
A=A+1 // 34534
D=M // 34535
@SP // 34536
AM=M-1 // 34537
D=D+M // 34538
@SP // 34539
AM=M+1 // 34540
A=A-1 // 34541
M=D // 34542
@32 // 34543
D=A // 34544
@SP // 34545
AM=M+1 // 34546
A=A-1 // 34547
M=D // 34548
// call Math.multiply
@7 // 34549
D=A // 34550
@14 // 34551
M=D // 34552
@Math.multiply // 34553
D=A // 34554
@13 // 34555
M=D // 34556
@Output.printChar.ret.2 // 34557
D=A // 34558
@CALL // 34559
0;JMP // 34560
(Output.printChar.ret.2)
@SP // 34561
AM=M-1 // 34562
D=M // 34563
@16384 // 34564
D=D+A // 34565
@SP // 34566
AM=M+1 // 34567
A=A-1 // 34568
M=D // 34569
@Output.1 // 34570
D=M // 34571
@SP // 34572
AM=M+1 // 34573
A=A-1 // 34574
M=D // 34575
@2 // 34576
D=A // 34577
@SP // 34578
AM=M+1 // 34579
A=A-1 // 34580
M=D // 34581
// call Math.divide
@7 // 34582
D=A // 34583
@14 // 34584
M=D // 34585
@Math.divide // 34586
D=A // 34587
@13 // 34588
M=D // 34589
@Output.printChar.ret.3 // 34590
D=A // 34591
@CALL // 34592
0;JMP // 34593
(Output.printChar.ret.3)
@SP // 34594
AM=M-1 // 34595
D=M // 34596
@SP // 34597
AM=M-1 // 34598
D=D+M // 34599
@LCL // 34600
A=M+1 // 34601
M=D // 34602

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
@Output.printChar.EQ.140 // 34603
D=A // 34604
@SP // 34605
AM=M+1 // 34606
A=A-1 // 34607
M=D // 34608
@Output.1 // 34609
D=M // 34610
@1 // 34611
D=D&A // 34612
@DO_EQ // 34613
0;JMP // 34614
(Output.printChar.EQ.140)
@Output.printChar$IF_TRUE1 // 34615
D;JNE // 34616

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 34617
0;JMP // 34618

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

@LCL // 34619
A=M+1 // 34620
A=A+1 // 34621
A=A+1 // 34622
D=M // 34623
A=A-1 // 34624
A=A-1 // 34625
A=A-1 // 34626
A=D+M // 34627
D=M // 34628
@LCL // 34629
A=M+1 // 34630
A=A+1 // 34631
M=D // 34632

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 34633
0;JMP // 34634

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

@LCL // 34635
A=M+1 // 34636
A=A+1 // 34637
A=A+1 // 34638
D=M // 34639
A=A-1 // 34640
A=A-1 // 34641
A=A-1 // 34642
A=D+M // 34643
D=M // 34644
@SP // 34645
AM=M+1 // 34646
A=A-1 // 34647
M=D // 34648
@256 // 34649
D=A // 34650
@SP // 34651
AM=M+1 // 34652
A=A-1 // 34653
M=D // 34654
// call Math.multiply
@7 // 34655
D=A // 34656
@14 // 34657
M=D // 34658
@Math.multiply // 34659
D=A // 34660
@13 // 34661
M=D // 34662
@Output.printChar.ret.4 // 34663
D=A // 34664
@CALL // 34665
0;JMP // 34666
(Output.printChar.ret.4)
@SP // 34667
AM=M-1 // 34668
D=M // 34669
@LCL // 34670
A=M+1 // 34671
A=A+1 // 34672
M=D // 34673

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
@LCL // 34674
A=M+1 // 34675
D=M // 34676
@SP // 34677
AM=M+1 // 34678
A=A-1 // 34679
M=D // 34680
@LCL // 34681
A=M+1 // 34682
A=M // 34683
D=M // 34684
@SP // 34685
AM=M+1 // 34686
A=A-1 // 34687
M=D // 34688
@LCL // 34689
A=M+1 // 34690
A=A+1 // 34691
D=M // 34692
@SP // 34693
AM=M-1 // 34694
D=D|M // 34695
@SP // 34696
AM=M-1 // 34697
A=M // 34698
M=D // 34699

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

@LCL // 34700
A=M+1 // 34701
A=A+1 // 34702
A=A+1 // 34703
M=M+1 // 34704

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 34705
0;JMP // 34706

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
@Output.printChar.EQ.141 // 34707
D=A // 34708
@SP // 34709
AM=M+1 // 34710
A=A-1 // 34711
M=D // 34712
@Output.1 // 34713
D=M // 34714
@63 // 34715
D=D-A // 34716
@DO_EQ // 34717
0;JMP // 34718
(Output.printChar.EQ.141)
@Output.printChar$IF_TRUE2 // 34719
D;JNE // 34720

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 34721
0;JMP // 34722

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 34723
D=A // 34724
@14 // 34725
M=D // 34726
@Output.println // 34727
D=A // 34728
@13 // 34729
M=D // 34730
@Output.printChar.ret.5 // 34731
D=A // 34732
@CALL // 34733
0;JMP // 34734
(Output.printChar.ret.5)
@SP // 34735
M=M-1 // 34736

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 34737
0;JMP // 34738

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

@Output.1 // 34739
M=M+1 // 34740

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 34741
AM=M+1 // 34742
A=A-1 // 34743
M=0 // 34744
@RETURN // 34745
0;JMP // 34746

////FunctionInstruction{functionName='Int32.dispose', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.u4_array_mul_u4_array=3, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.dispose with 0
(Int32.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34747
A=M // 34748
D=M // 34749
@3 // 34750
M=D // 34751

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "SUB"
//)
//  pop:  PopInstruction{address=static 0}
//}

@Int32.0 // 34752
M=M-1 // 34753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 34754
A=M // 34755
D=M // 34756
@SP // 34757
AM=M+1 // 34758
A=A-1 // 34759
M=D // 34760
// call Memory.deAlloc
@6 // 34761
D=A // 34762
@14 // 34763
M=D // 34764
@Memory.deAlloc // 34765
D=A // 34766
@13 // 34767
M=D // 34768
@Int32.dispose.ret.0 // 34769
D=A // 34770
@CALL // 34771
0;JMP // 34772
(Int32.dispose.ret.0)
@SP // 34773
M=M-1 // 34774

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 34775
D=M // 34776
@SP // 34777
AM=M+1 // 34778
A=A-1 // 34779
M=D // 34780
// call Memory.deAlloc
@6 // 34781
D=A // 34782
@14 // 34783
M=D // 34784
@Memory.deAlloc // 34785
D=A // 34786
@13 // 34787
M=D // 34788
@Int32.dispose.ret.1 // 34789
D=A // 34790
@CALL // 34791
0;JMP // 34792
(Int32.dispose.ret.1)
@SP // 34793
M=M-1 // 34794

////PushInstruction("constant 0")
@SP // 34795
AM=M+1 // 34796
A=A-1 // 34797
M=0 // 34798
@RETURN // 34799
0;JMP // 34800

////FunctionInstruction{functionName='Element.sphere', numLocals=0, funcMapping={Element.surface_normal=2, Element.intersect=2, Element.plane=1, Element.color=2}}
// function Element.sphere with 0
(Element.sphere)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 34801
D=A // 34802
@SP // 34803
AM=M+1 // 34804
A=A-1 // 34805
M=D // 34806
// call Memory.alloc
@6 // 34807
D=A // 34808
@14 // 34809
M=D // 34810
@Memory.alloc // 34811
D=A // 34812
@13 // 34813
M=D // 34814
@Element.sphere.ret.0 // 34815
D=A // 34816
@CALL // 34817
0;JMP // 34818
(Element.sphere.ret.0)
@SP // 34819
AM=M-1 // 34820
D=M // 34821
@3 // 34822
M=D // 34823

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 34824
A=M // 34825
D=M // 34826
@THIS // 34827
A=M+1 // 34828
M=D // 34829

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 34830
A=M // 34831
M=0 // 34832

////PushInstruction("pointer 0")
@3 // 34833
D=M // 34834
@SP // 34835
AM=M+1 // 34836
A=A-1 // 34837
M=D // 34838
@RETURN // 34839
0;JMP // 34840

////FunctionInstruction{functionName='Int32.is_zero', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.u4_array_mul_u4_array=3, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.dispose=2, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_zero with 0
(Int32.is_zero)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34841
A=M // 34842
D=M // 34843
@3 // 34844
M=D // 34845

////BinaryPushGroup(
//    left:
//        BinaryPushGroup(
//            left:
//                BinaryPushGroup(
//                    left:
//                        BinaryPushGroup(
//                            left:
//                                Dereference(
//                                    base:
//                                        BinaryPushGroup(
//                                            left:
//                                                PushInstruction("this 0"),
//                                            right:
//                                                PushInstruction("constant 0"),
//                                            binaryOp: "ADD"
//                                        )
//                                ),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "EQ"
//                        ),
//                    right:
//                        BinaryPushGroup(
//                            left:
//                                Dereference(
//                                    base:
//                                        BinaryPushGroup(
//                                            left:
//                                                PushInstruction("this 0"),
//                                            right:
//                                                PushInstruction("constant 1"),
//                                            binaryOp: "ADD"
//                                        )
//                                ),
//                            right:
//                                PushInstruction("constant 0"),
//                            binaryOp: "EQ"
//                        ),
//                    binaryOp: "AND"
//                ),
//            right:
//                BinaryPushGroup(
//                    left:
//                        Dereference(
//                            base:
//                                BinaryPushGroup(
//                                    left:
//                                        PushInstruction("this 0"),
//                                    right:
//                                        PushInstruction("constant 2"),
//                                    binaryOp: "ADD"
//                                )
//                        ),
//                    right:
//                        PushInstruction("constant 0"),
//                    binaryOp: "EQ"
//                ),
//            binaryOp: "AND"
//        ),
//    right:
//        BinaryPushGroup(
//            left:
//                Dereference(
//                    base:
//                        BinaryPushGroup(
//                            left:
//                                PushInstruction("this 0"),
//                            right:
//                                PushInstruction("constant 3"),
//                            binaryOp: "ADD"
//                        )
//                ),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "EQ"
//        ),
//    binaryOp: "AND"
//)
@Int32.is_zero.EQ.142 // 34846
D=A // 34847
@SP // 34848
AM=M+1 // 34849
A=A-1 // 34850
M=D // 34851
@THIS // 34852
A=M // 34853
A=M // 34854
D=M // 34855
@DO_EQ // 34856
0;JMP // 34857
(Int32.is_zero.EQ.142)
@SP // 34858
AM=M+1 // 34859
A=A-1 // 34860
M=D // 34861
@Int32.is_zero.EQ.143 // 34862
D=A // 34863
@SP // 34864
AM=M+1 // 34865
A=A-1 // 34866
M=D // 34867
@THIS // 34868
A=M // 34869
A=M+1 // 34870
D=M // 34871
@DO_EQ // 34872
0;JMP // 34873
(Int32.is_zero.EQ.143)
@SP // 34874
AM=M-1 // 34875
D=D&M // 34876
@SP // 34877
AM=M+1 // 34878
A=A-1 // 34879
M=D // 34880
@Int32.is_zero.EQ.144 // 34881
D=A // 34882
@SP // 34883
AM=M+1 // 34884
A=A-1 // 34885
M=D // 34886
@THIS // 34887
A=M // 34888
D=M // 34889
@THIS // 34890
A=M // 34891
D=M // 34892
@2 // 34893
D=D+A // 34894
A=D // 34895
D=M // 34896
@DO_EQ // 34897
0;JMP // 34898
(Int32.is_zero.EQ.144)
@SP // 34899
AM=M-1 // 34900
D=D&M // 34901
@SP // 34902
AM=M+1 // 34903
A=A-1 // 34904
M=D // 34905
@Int32.is_zero.EQ.145 // 34906
D=A // 34907
@SP // 34908
AM=M+1 // 34909
A=A-1 // 34910
M=D // 34911
@THIS // 34912
A=M // 34913
D=M // 34914
@THIS // 34915
A=M // 34916
D=M // 34917
@3 // 34918
D=D+A // 34919
A=D // 34920
D=M // 34921
@DO_EQ // 34922
0;JMP // 34923
(Int32.is_zero.EQ.145)
@SP // 34924
AM=M-1 // 34925
D=D&M // 34926
@SP // 34927
AM=M+1 // 34928
A=A-1 // 34929
M=D // 34930
@RETURN // 34931
0;JMP // 34932

////FunctionInstruction{functionName='Sphere.surface_normal', numLocals=1, funcMapping={Sphere.new=1, Sphere.intersect=39, Sphere.color=1, Sphere.dispose=4}}
// function Sphere.surface_normal with 1
(Sphere.surface_normal)
@SP // 34933
AM=M+1 // 34934
A=A-1 // 34935
M=0 // 34936

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34937
A=M // 34938
D=M // 34939
@3 // 34940
M=D // 34941

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 34942
A=M+1 // 34943
D=M // 34944
@SP // 34945
AM=M+1 // 34946
A=A-1 // 34947
M=D // 34948
// call Vec3.clone
@6 // 34949
D=A // 34950
@14 // 34951
M=D // 34952
@Vec3.clone // 34953
D=A // 34954
@13 // 34955
M=D // 34956
@Sphere.surface_normal.ret.0 // 34957
D=A // 34958
@CALL // 34959
0;JMP // 34960
(Sphere.surface_normal.ret.0)
@SP // 34961
AM=M-1 // 34962
D=M // 34963
@LCL // 34964
A=M // 34965
M=D // 34966

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 0")], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 34967
A=M // 34968
D=M // 34969
@SP // 34970
AM=M+1 // 34971
A=A-1 // 34972
M=D // 34973
@THIS // 34974
A=M // 34975
D=M // 34976
@SP // 34977
AM=M+1 // 34978
A=A-1 // 34979
M=D // 34980
// call Vec3.do_sub
@7 // 34981
D=A // 34982
@14 // 34983
M=D // 34984
@Vec3.do_sub // 34985
D=A // 34986
@13 // 34987
M=D // 34988
@Sphere.surface_normal.ret.1 // 34989
D=A // 34990
@CALL // 34991
0;JMP // 34992
(Sphere.surface_normal.ret.1)
@SP // 34993
M=M-1 // 34994

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 34995
A=M // 34996
D=M // 34997
@SP // 34998
AM=M+1 // 34999
A=A-1 // 35000
M=D // 35001
// call Vec3.do_normalize
@6 // 35002
D=A // 35003
@14 // 35004
M=D // 35005
@Vec3.do_normalize // 35006
D=A // 35007
@13 // 35008
M=D // 35009
@Sphere.surface_normal.ret.2 // 35010
D=A // 35011
@CALL // 35012
0;JMP // 35013
(Sphere.surface_normal.ret.2)
@SP // 35014
M=M-1 // 35015

////PushInstruction("local 0")
@LCL // 35016
A=M // 35017
D=M // 35018
@SP // 35019
AM=M+1 // 35020
A=A-1 // 35021
M=D // 35022
@RETURN // 35023
0;JMP // 35024

////FunctionInstruction{functionName='Number.new', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2, Number.is_positive=1}}
// function Number.new with 0
(Number.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 35025
AM=M+1 // 35026
A=A-1 // 35027
M=1 // 35028
// call Memory.alloc
@6 // 35029
D=A // 35030
@14 // 35031
M=D // 35032
@Memory.alloc // 35033
D=A // 35034
@13 // 35035
M=D // 35036
@Number.new.ret.0 // 35037
D=A // 35038
@CALL // 35039
0;JMP // 35040
(Number.new.ret.0)
@SP // 35041
AM=M-1 // 35042
D=M // 35043
@3 // 35044
M=D // 35045

////PushPopPair {
//  push: BinaryPushGroup(
//    left:
//        PushInstruction("static 5"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)
//  pop:  PopInstruction{address=static 5}
//}

@Number.5 // 35046
M=M+1 // 35047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 35048
A=M // 35049
D=M // 35050
@SP // 35051
AM=M+1 // 35052
A=A-1 // 35053
M=D // 35054
// call Int32.new
@6 // 35055
D=A // 35056
@14 // 35057
M=D // 35058
@Int32.new // 35059
D=A // 35060
@13 // 35061
M=D // 35062
@Number.new.ret.1 // 35063
D=A // 35064
@CALL // 35065
0;JMP // 35066
(Number.new.ret.1)
@SP // 35067
AM=M-1 // 35068
D=M // 35069
@THIS // 35070
A=M // 35071
M=D // 35072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2")], call=CallInstruction{Int32.do_left_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 35073
A=M // 35074
D=M // 35075
@SP // 35076
AM=M+1 // 35077
A=A-1 // 35078
M=D // 35079
@2 // 35080
D=A // 35081
@SP // 35082
AM=M+1 // 35083
A=A-1 // 35084
M=D // 35085
// call Int32.do_left_shift_bytes
@7 // 35086
D=A // 35087
@14 // 35088
M=D // 35089
@Int32.do_left_shift_bytes // 35090
D=A // 35091
@13 // 35092
M=D // 35093
@Number.new.ret.2 // 35094
D=A // 35095
@CALL // 35096
0;JMP // 35097
(Number.new.ret.2)
@SP // 35098
M=M-1 // 35099

////PushInstruction("pointer 0")
@3 // 35100
D=M // 35101
@SP // 35102
AM=M+1 // 35103
A=A-1 // 35104
M=D // 35105
@RETURN // 35106
0;JMP // 35107

////FunctionInstruction{functionName='Element.dispose', numLocals=0, funcMapping={Element.surface_normal=2, Element.intersect=2, Element.sphere=1, Element.plane=1, Element.color=2}}
// function Element.dispose with 0
(Element.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 35108
A=M // 35109
D=M // 35110
@3 // 35111
M=D // 35112

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.dispose$IF_TRUE1}}
@THIS // 35113
A=M // 35114
D=M // 35115
@Element.dispose$IF_TRUE1 // 35116
D;JNE // 35117

////GotoInstruction{label='Element.dispose$IF_END1}
// goto Element.dispose$IF_END1
@Element.dispose$IF_END1 // 35118
0;JMP // 35119

////LabelInstruction{label='Element.dispose$IF_TRUE1}
// label Element.dispose$IF_TRUE1
(Element.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Plane.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 35120
A=M // 35121
D=M // 35122
@SP // 35123
AM=M+1 // 35124
A=A-1 // 35125
M=D // 35126
// call Plane.dispose
@6 // 35127
D=A // 35128
@14 // 35129
M=D // 35130
@Plane.dispose // 35131
D=A // 35132
@13 // 35133
M=D // 35134
@Element.dispose.ret.0 // 35135
D=A // 35136
@CALL // 35137
0;JMP // 35138
(Element.dispose.ret.0)
@SP // 35139
M=M-1 // 35140

////LabelInstruction{label='Element.dispose$IF_END1}
// label Element.dispose$IF_END1
(Element.dispose$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.dispose$IF_TRUE2}}
@THIS // 35141
A=M+1 // 35142
D=M // 35143
@Element.dispose$IF_TRUE2 // 35144
D;JNE // 35145

////GotoInstruction{label='Element.dispose$IF_END2}
// goto Element.dispose$IF_END2
@Element.dispose$IF_END2 // 35146
0;JMP // 35147

////LabelInstruction{label='Element.dispose$IF_TRUE2}
// label Element.dispose$IF_TRUE2
(Element.dispose$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Sphere.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 35148
A=M+1 // 35149
D=M // 35150
@SP // 35151
AM=M+1 // 35152
A=A-1 // 35153
M=D // 35154
// call Sphere.dispose
@6 // 35155
D=A // 35156
@14 // 35157
M=D // 35158
@Sphere.dispose // 35159
D=A // 35160
@13 // 35161
M=D // 35162
@Element.dispose.ret.1 // 35163
D=A // 35164
@CALL // 35165
0;JMP // 35166
(Element.dispose.ret.1)
@SP // 35167
M=M-1 // 35168

////LabelInstruction{label='Element.dispose$IF_END2}
// label Element.dispose$IF_END2
(Element.dispose$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 35169
D=M // 35170
@SP // 35171
AM=M+1 // 35172
A=A-1 // 35173
M=D // 35174
// call Memory.deAlloc
@6 // 35175
D=A // 35176
@14 // 35177
M=D // 35178
@Memory.deAlloc // 35179
D=A // 35180
@13 // 35181
M=D // 35182
@Element.dispose.ret.2 // 35183
D=A // 35184
@CALL // 35185
0;JMP // 35186
(Element.dispose.ret.2)
@SP // 35187
M=M-1 // 35188

////PushInstruction("constant 0")
@SP // 35189
AM=M+1 // 35190
A=A-1 // 35191
M=0 // 35192
@RETURN // 35193
0;JMP // 35194

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 35195
M=M+1 // 35196
AM=M+1 // 35197
A=A-1 // 35198
M=0 // 35199
A=A-1 // 35200
M=0 // 35201

////PushPopPair {
//  push: PushInstruction("constant 2055")
//  pop:  PopInstruction{address=local 0}
//}

@2055 // 35202
D=A // 35203
@LCL // 35204
A=M // 35205
M=D // 35206

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
@LCL // 35207
A=M // 35208
D=M // 35209
@SP // 35210
AM=M+1 // 35211
A=A-1 // 35212
M=D // 35213
@LCL // 35214
A=M // 35215
D=M // 35216
@16384 // 35217
D=A-D // 35218
@5 // 35219
D=D-A // 35220
@SP // 35221
AM=M-1 // 35222
A=M // 35223
M=D // 35224

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 35225
A=M // 35226
D=M // 35227
@SP // 35228
AM=M+1 // 35229
A=A-1 // 35230
M=D+1 // 35231
D=1 // 35232
@SP // 35233
AM=M-1 // 35234
A=M // 35235
M=D // 35236

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 35237
A=M // 35238
D=M // 35239
@2 // 35240
D=D+A // 35241
@SP // 35242
AM=M+1 // 35243
A=A-1 // 35244
M=D // 35245
D=0 // 35246
@SP // 35247
AM=M-1 // 35248
A=M // 35249
M=D // 35250

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 35251
A=M // 35252
D=M // 35253
@3 // 35254
D=D+A // 35255
@SP // 35256
AM=M+1 // 35257
A=A-1 // 35258
M=D // 35259
D=0 // 35260
@SP // 35261
AM=M-1 // 35262
A=M // 35263
M=D // 35264

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 35265
A=M // 35266
D=M // 35267
@SP // 35268
AM=M+1 // 35269
A=A-1 // 35270
M=D // 35271
// call Memory.create_foot
@6 // 35272
D=A // 35273
@14 // 35274
M=D // 35275
@Memory.create_foot // 35276
D=A // 35277
@13 // 35278
M=D // 35279
@Memory.init.ret.0 // 35280
D=A // 35281
@CALL // 35282
0;JMP // 35283
(Memory.init.ret.0)
@SP // 35284
M=M-1 // 35285

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2054"), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 35286
D=A // 35287
@SP // 35288
AM=M+1 // 35289
A=A-1 // 35290
M=D // 35291
@LCL // 35292
A=M // 35293
D=M // 35294
@SP // 35295
AM=M+1 // 35296
A=A-1 // 35297
M=D // 35298
// call Memory.add_node
@7 // 35299
D=A // 35300
@14 // 35301
M=D // 35302
@Memory.add_node // 35303
D=A // 35304
@13 // 35305
M=D // 35306
@Memory.init.ret.1 // 35307
D=A // 35308
@CALL // 35309
0;JMP // 35310
(Memory.init.ret.1)
@SP // 35311
M=M-1 // 35312

////PushInstruction("constant 0")
@SP // 35313
AM=M+1 // 35314
A=A-1 // 35315
M=0 // 35316
@RETURN // 35317
0;JMP // 35318

////FunctionInstruction{functionName='Number.getPi', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.new=3, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2, Number.is_positive=1}}
// function Number.getPi with 0
(Number.getPi)

////PushInstruction("static 3")
@Number.3 // 35319
D=M // 35320
@SP // 35321
AM=M+1 // 35322
A=A-1 // 35323
M=D // 35324
@RETURN // 35325
0;JMP // 35326

