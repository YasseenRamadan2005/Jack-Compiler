// Set 256 to be the start of the stack
@256 // 0
D=A // 1
@SP // 2
M=D // 3
// Set up the comparison ops subroutines
@SKIP // 4
0;JMP // 5
// gt: D > 0
(DO_GT)
@RETURN_TRUE // 6
D;JGT // 7
@RETURN_FALSE // 8
0;JMP // 9
// eq: D == 0
(DO_EQ)
@RETURN_TRUE // 10
D;JEQ // 11
@RETURN_FALSE // 12
0;JMP // 13
// lt: D < 0
(DO_LT)
@RETURN_TRUE // 14
D;JLT // 15
@RETURN_FALSE // 16
0;JMP // 17
// Set boolean in D
(RETURN_TRUE)
D=-1 // 18
@WRITE_BACK // 19
0;JMP // 20
(RETURN_FALSE)
D=0 // 21
@WRITE_BACK // 22
0;JMP // 23
// Collapse stack and return
(WRITE_BACK)
@SP // 24
AM=M-1 // 25
A=M // 26
0;JMP // 27
// Function call/return setup
(SKIP)
@SKIP1 // 28
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
(PUSH_D)
@SP // 119
AM=M+1 // 120
A=A-1 // 121
M=D // 122
@13 // 123
A=M // 124
0;JMP // 125
(ARG_PUSH)
@ARG // 126
A=D+M // 127
D=M // 128
@PUSH_D // 129
0;JMP // 130
(LCL_PUSH)
@LCL // 131
A=D+M // 132
D=M // 133
@PUSH_D // 134
0;JMP // 135
(THIS_PUSH)
@THIS // 136
A=D+M // 137
D=M // 138
@PUSH_D // 139
0;JMP // 140
(THAT_PUSH)
@THAT // 141
A=D+M // 142
D=M // 143
@PUSH_D // 144
0;JMP // 145
(SKIP1)
// call Sys.init
@5 // 146
D=A // 147
@14 // 148
M=D // 149
@Sys.init // 150
D=A // 151
@13 // 152
M=D // 153
@global.ret.0 // 154
D=A // 155
@CALL // 156
0;JMP // 157
(global.ret.0)
////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={}}
// function String.dispose with 0
(String.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 158
A=M // 159
D=M // 160
@3 // 161
M=D // 162

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("this 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='String.dispose$IF_TRUE1}}
@String.dispose.EQ.0 // 163
D=A // 164
@SP // 165
AM=M+1 // 166
A=A-1 // 167
M=D // 168
@THIS // 169
A=M // 170
D=M // 171
@DO_EQ // 172
0;JMP // 173
(String.dispose.EQ.0)
D=!D // 174
@String.dispose$IF_TRUE1 // 175
D;JNE // 176

////GotoInstruction{label='String.dispose$IF_END1}
// goto String.dispose$IF_END1
@String.dispose$IF_END1 // 177
0;JMP // 178

////LabelInstruction{label='String.dispose$IF_TRUE1}
// label String.dispose$IF_TRUE1
(String.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 179
A=M // 180
D=M // 181
@SP // 182
AM=M+1 // 183
A=A-1 // 184
M=D // 185
// call Memory.deAlloc
@6 // 186
D=A // 187
@14 // 188
M=D // 189
@Memory.deAlloc // 190
D=A // 191
@13 // 192
M=D // 193
@String.dispose.ret.0 // 194
D=A // 195
@CALL // 196
0;JMP // 197
(String.dispose.ret.0)
@SP // 198
M=M-1 // 199

////LabelInstruction{label='String.dispose$IF_END1}
// label String.dispose$IF_END1
(String.dispose$IF_END1)

////PushInstruction("constant 0")
@SP // 200
AM=M+1 // 201
A=A-1 // 202
M=0 // 203
@RETURN // 204
0;JMP // 205

////FunctionInstruction{functionName='Int32.initial_sqrt_guess', numLocals=2, funcMapping={}}
// function Int32.initial_sqrt_guess with 2
(Int32.initial_sqrt_guess)
@SP // 206
M=M+1 // 207
AM=M+1 // 208
A=A-1 // 209
M=0 // 210
A=A-1 // 211
M=0 // 212

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 213
A=M // 214
D=M // 215
@3 // 216
M=D // 217

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
@Int32.initial_sqrt_guess.GT.1 // 218
D=A // 219
@SP // 220
AM=M+1 // 221
A=A-1 // 222
M=D // 223
@THIS // 224
A=M // 225
D=M // 226
@THIS // 227
A=M // 228
D=M // 229
@3 // 230
D=D+A // 231
A=D // 232
D=M // 233
@DO_GT // 234
0;JMP // 235
(Int32.initial_sqrt_guess.GT.1)
@Int32.initial_sqrt_guess$IF_TRUE1 // 236
D;JNE // 237

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END1}
// goto Int32.initial_sqrt_guess$IF_END1
@Int32.initial_sqrt_guess$IF_END1 // 238
0;JMP // 239

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE1}
// label Int32.initial_sqrt_guess$IF_TRUE1
(Int32.initial_sqrt_guess$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 240
D=A // 241
@SP // 242
AM=M+1 // 243
A=A-1 // 244
M=D // 245
// call Int32.new
@6 // 246
D=A // 247
@14 // 248
M=D // 249
@Int32.new // 250
D=A // 251
@13 // 252
M=D // 253
@Int32.initial_sqrt_guess.ret.0 // 254
D=A // 255
@CALL // 256
0;JMP // 257
(Int32.initial_sqrt_guess.ret.0)
@SP // 258
AM=M-1 // 259
D=M // 260
@LCL // 261
A=M // 262
M=D // 263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4096")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@4096 // 264
D=A // 265
@SP // 266
AM=M+1 // 267
A=A-1 // 268
M=D // 269
// call Int32.new
@6 // 270
D=A // 271
@14 // 272
M=D // 273
@Int32.new // 274
D=A // 275
@13 // 276
M=D // 277
@Int32.initial_sqrt_guess.ret.1 // 278
D=A // 279
@CALL // 280
0;JMP // 281
(Int32.initial_sqrt_guess.ret.1)
@SP // 282
AM=M-1 // 283
D=M // 284
@LCL // 285
A=M+1 // 286
M=D // 287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 288
A=M // 289
D=M // 290
@SP // 291
AM=M+1 // 292
A=A-1 // 293
M=D // 294
@LCL // 295
A=M+1 // 296
D=M // 297
@SP // 298
AM=M+1 // 299
A=A-1 // 300
M=D // 301
// call Int32.do_mul
@7 // 302
D=A // 303
@14 // 304
M=D // 305
@Int32.do_mul // 306
D=A // 307
@13 // 308
M=D // 309
@Int32.initial_sqrt_guess.ret.2 // 310
D=A // 311
@CALL // 312
0;JMP // 313
(Int32.initial_sqrt_guess.ret.2)
@SP // 314
M=M-1 // 315

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 316
A=M+1 // 317
D=M // 318
@SP // 319
AM=M+1 // 320
A=A-1 // 321
M=D // 322
// call Int32.dispose
@6 // 323
D=A // 324
@14 // 325
M=D // 326
@Int32.dispose // 327
D=A // 328
@13 // 329
M=D // 330
@Int32.initial_sqrt_guess.ret.3 // 331
D=A // 332
@CALL // 333
0;JMP // 334
(Int32.initial_sqrt_guess.ret.3)
@SP // 335
M=M-1 // 336

////PushInstruction("local 0")
@LCL // 337
A=M // 338
D=M // 339
@SP // 340
AM=M+1 // 341
A=A-1 // 342
M=D // 343
@RETURN // 344
0;JMP // 345

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
@Int32.initial_sqrt_guess.GT.2 // 346
D=A // 347
@SP // 348
AM=M+1 // 349
A=A-1 // 350
M=D // 351
@THIS // 352
A=M // 353
D=M // 354
@THIS // 355
A=M // 356
D=M // 357
@2 // 358
D=D+A // 359
A=D // 360
D=M // 361
@DO_GT // 362
0;JMP // 363
(Int32.initial_sqrt_guess.GT.2)
@Int32.initial_sqrt_guess$IF_TRUE2 // 364
D;JNE // 365

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END2}
// goto Int32.initial_sqrt_guess$IF_END2
@Int32.initial_sqrt_guess$IF_END2 // 366
0;JMP // 367

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE2}
// label Int32.initial_sqrt_guess$IF_TRUE2
(Int32.initial_sqrt_guess$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 368
D=A // 369
@SP // 370
AM=M+1 // 371
A=A-1 // 372
M=D // 373
// call Int32.new
@6 // 374
D=A // 375
@14 // 376
M=D // 377
@Int32.new // 378
D=A // 379
@13 // 380
M=D // 381
@Int32.initial_sqrt_guess.ret.4 // 382
D=A // 383
@CALL // 384
0;JMP // 385
(Int32.initial_sqrt_guess.ret.4)
@SP // 386
AM=M-1 // 387
D=M // 388
@LCL // 389
A=M // 390
M=D // 391

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 256")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@256 // 392
D=A // 393
@SP // 394
AM=M+1 // 395
A=A-1 // 396
M=D // 397
// call Int32.new
@6 // 398
D=A // 399
@14 // 400
M=D // 401
@Int32.new // 402
D=A // 403
@13 // 404
M=D // 405
@Int32.initial_sqrt_guess.ret.5 // 406
D=A // 407
@CALL // 408
0;JMP // 409
(Int32.initial_sqrt_guess.ret.5)
@SP // 410
AM=M-1 // 411
D=M // 412
@LCL // 413
A=M+1 // 414
M=D // 415

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 416
A=M // 417
D=M // 418
@SP // 419
AM=M+1 // 420
A=A-1 // 421
M=D // 422
@LCL // 423
A=M+1 // 424
D=M // 425
@SP // 426
AM=M+1 // 427
A=A-1 // 428
M=D // 429
// call Int32.do_mul
@7 // 430
D=A // 431
@14 // 432
M=D // 433
@Int32.do_mul // 434
D=A // 435
@13 // 436
M=D // 437
@Int32.initial_sqrt_guess.ret.6 // 438
D=A // 439
@CALL // 440
0;JMP // 441
(Int32.initial_sqrt_guess.ret.6)
@SP // 442
M=M-1 // 443

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 444
A=M+1 // 445
D=M // 446
@SP // 447
AM=M+1 // 448
A=A-1 // 449
M=D // 450
// call Int32.dispose
@6 // 451
D=A // 452
@14 // 453
M=D // 454
@Int32.dispose // 455
D=A // 456
@13 // 457
M=D // 458
@Int32.initial_sqrt_guess.ret.7 // 459
D=A // 460
@CALL // 461
0;JMP // 462
(Int32.initial_sqrt_guess.ret.7)
@SP // 463
M=M-1 // 464

////PushInstruction("local 0")
@LCL // 465
A=M // 466
D=M // 467
@SP // 468
AM=M+1 // 469
A=A-1 // 470
M=D // 471
@RETURN // 472
0;JMP // 473

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
@Int32.initial_sqrt_guess.GT.3 // 474
D=A // 475
@SP // 476
AM=M+1 // 477
A=A-1 // 478
M=D // 479
@THIS // 480
A=M // 481
A=M+1 // 482
D=M // 483
@DO_GT // 484
0;JMP // 485
(Int32.initial_sqrt_guess.GT.3)
@Int32.initial_sqrt_guess$IF_TRUE3 // 486
D;JNE // 487

////GotoInstruction{label='Int32.initial_sqrt_guess$IF_END3}
// goto Int32.initial_sqrt_guess$IF_END3
@Int32.initial_sqrt_guess$IF_END3 // 488
0;JMP // 489

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_TRUE3}
// label Int32.initial_sqrt_guess$IF_TRUE3
(Int32.initial_sqrt_guess$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 490
D=A // 491
@SP // 492
AM=M+1 // 493
A=A-1 // 494
M=D // 495
// call Int32.new
@6 // 496
D=A // 497
@14 // 498
M=D // 499
@Int32.new // 500
D=A // 501
@13 // 502
M=D // 503
@Int32.initial_sqrt_guess.ret.8 // 504
D=A // 505
@CALL // 506
0;JMP // 507
(Int32.initial_sqrt_guess.ret.8)
@SP // 508
AM=M-1 // 509
D=M // 510
@LCL // 511
A=M // 512
M=D // 513

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@16 // 514
D=A // 515
@SP // 516
AM=M+1 // 517
A=A-1 // 518
M=D // 519
// call Int32.new
@6 // 520
D=A // 521
@14 // 522
M=D // 523
@Int32.new // 524
D=A // 525
@13 // 526
M=D // 527
@Int32.initial_sqrt_guess.ret.9 // 528
D=A // 529
@CALL // 530
0;JMP // 531
(Int32.initial_sqrt_guess.ret.9)
@SP // 532
AM=M-1 // 533
D=M // 534
@LCL // 535
A=M+1 // 536
M=D // 537

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 538
A=M // 539
D=M // 540
@SP // 541
AM=M+1 // 542
A=A-1 // 543
M=D // 544
@LCL // 545
A=M+1 // 546
D=M // 547
@SP // 548
AM=M+1 // 549
A=A-1 // 550
M=D // 551
// call Int32.do_mul
@7 // 552
D=A // 553
@14 // 554
M=D // 555
@Int32.do_mul // 556
D=A // 557
@13 // 558
M=D // 559
@Int32.initial_sqrt_guess.ret.10 // 560
D=A // 561
@CALL // 562
0;JMP // 563
(Int32.initial_sqrt_guess.ret.10)
@SP // 564
M=M-1 // 565

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 566
A=M+1 // 567
D=M // 568
@SP // 569
AM=M+1 // 570
A=A-1 // 571
M=D // 572
// call Int32.dispose
@6 // 573
D=A // 574
@14 // 575
M=D // 576
@Int32.dispose // 577
D=A // 578
@13 // 579
M=D // 580
@Int32.initial_sqrt_guess.ret.11 // 581
D=A // 582
@CALL // 583
0;JMP // 584
(Int32.initial_sqrt_guess.ret.11)
@SP // 585
M=M-1 // 586

////PushInstruction("local 0")
@LCL // 587
A=M // 588
D=M // 589
@SP // 590
AM=M+1 // 591
A=A-1 // 592
M=D // 593
@RETURN // 594
0;JMP // 595

////LabelInstruction{label='Int32.initial_sqrt_guess$IF_END3}
// label Int32.initial_sqrt_guess$IF_END3
(Int32.initial_sqrt_guess$IF_END3)

////CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Int32.new}}
@11 // 596
D=A // 597
@SP // 598
AM=M+1 // 599
A=A-1 // 600
M=D // 601
// call Int32.new
@6 // 602
D=A // 603
@14 // 604
M=D // 605
@Int32.new // 606
D=A // 607
@13 // 608
M=D // 609
@Int32.initial_sqrt_guess.ret.12 // 610
D=A // 611
@CALL // 612
0;JMP // 613
(Int32.initial_sqrt_guess.ret.12)
@RETURN // 614
0;JMP // 615

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 616
M=0 // 617

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.4 // 618
D=A // 619
@SP // 620
AM=M+1 // 621
A=A-1 // 622
M=D // 623
@Output.2 // 624
D=M // 625
@22 // 626
D=D-A // 627
@DO_EQ // 628
0;JMP // 629
(Output.println.EQ.4)
@Output.println$IF_TRUE1 // 630
D;JNE // 631

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 632
0;JMP // 633

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 634
M=0 // 635

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 636
0;JMP // 637

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

@Output.2 // 638
M=M+1 // 639

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 640
AM=M+1 // 641
A=A-1 // 642
M=0 // 643
@RETURN // 644
0;JMP // 645

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 646
AM=M+1 // 647
A=A-1 // 648
M=0 // 649

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

@ARG // 650
A=M // 651
A=M // 652
D=M // 653
@LCL // 654
A=M // 655
M=D // 656

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
@Memory.get_best_fit.LT.5 // 657
D=A // 658
@SP // 659
AM=M+1 // 660
A=A-1 // 661
M=D // 662
@LCL // 663
A=M // 664
A=M // 665
D=M // 666
@SP // 667
AM=M+1 // 668
A=A-1 // 669
M=D // 670
@ARG // 671
A=M+1 // 672
D=M // 673
@SP // 674
AM=M-1 // 675
D=M-D // 676
@DO_LT // 677
0;JMP // 678
(Memory.get_best_fit.LT.5)
D=!D // 679
@Memory.get_best_fit$IF_TRUE1 // 680
D;JNE // 681

////GotoInstruction{label='Memory.get_best_fit$IF_END1}
// goto Memory.get_best_fit$IF_END1
@Memory.get_best_fit$IF_END1 // 682
0;JMP // 683

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 684
A=M // 685
D=M // 686
@SP // 687
AM=M+1 // 688
A=A-1 // 689
M=D // 690
@RETURN // 691
0;JMP // 692

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
@Memory.get_best_fit.EQ.6 // 693
D=A // 694
@SP // 695
AM=M+1 // 696
A=A-1 // 697
M=D // 698
@LCL // 699
A=M // 700
D=M // 701
@LCL // 702
A=M // 703
D=M // 704
@3 // 705
D=D+A // 706
A=D // 707
D=M // 708
@DO_EQ // 709
0;JMP // 710
(Memory.get_best_fit.EQ.6)
@Memory.get_best_fit_WHILE_END1 // 711
D;JNE // 712

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

@LCL // 713
A=M // 714
D=M // 715
@LCL // 716
A=M // 717
D=M // 718
@3 // 719
D=D+A // 720
A=D // 721
D=M // 722
@LCL // 723
A=M // 724
M=D // 725

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
@Memory.get_best_fit.LT.7 // 726
D=A // 727
@SP // 728
AM=M+1 // 729
A=A-1 // 730
M=D // 731
@LCL // 732
A=M // 733
A=M // 734
D=M // 735
@SP // 736
AM=M+1 // 737
A=A-1 // 738
M=D // 739
@ARG // 740
A=M+1 // 741
D=M // 742
@SP // 743
AM=M-1 // 744
D=M-D // 745
@DO_LT // 746
0;JMP // 747
(Memory.get_best_fit.LT.7)
D=!D // 748
@Memory.get_best_fit$IF_TRUE2 // 749
D;JNE // 750

////GotoInstruction{label='Memory.get_best_fit$IF_END2}
// goto Memory.get_best_fit$IF_END2
@Memory.get_best_fit$IF_END2 // 751
0;JMP // 752

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 753
A=M // 754
D=M // 755
@SP // 756
AM=M+1 // 757
A=A-1 // 758
M=D // 759
@RETURN // 760
0;JMP // 761

////LabelInstruction{label='Memory.get_best_fit$IF_END2}
// label Memory.get_best_fit$IF_END2
(Memory.get_best_fit$IF_END2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 762
0;JMP // 763

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 764
AM=M+1 // 765
A=A-1 // 766
M=0 // 767
@RETURN // 768
0;JMP // 769

////FunctionInstruction{functionName='Number.clone', numLocals=0, funcMapping={}}
// function Number.clone with 0
(Number.clone)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 770
A=M // 771
D=M // 772
@3 // 773
M=D // 774

////CallGroup{pushes=[CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.clone}}], call=CallInstruction{Number.new_from_int32}}
@THIS // 775
A=M // 776
D=M // 777
@SP // 778
AM=M+1 // 779
A=A-1 // 780
M=D // 781
// call Int32.clone
@6 // 782
D=A // 783
@14 // 784
M=D // 785
@Int32.clone // 786
D=A // 787
@13 // 788
M=D // 789
@Number.clone.ret.0 // 790
D=A // 791
@CALL // 792
0;JMP // 793
(Number.clone.ret.0)
// call Number.new_from_int32
@6 // 794
D=A // 795
@14 // 796
M=D // 797
@Number.new_from_int32 // 798
D=A // 799
@13 // 800
M=D // 801
@Number.clone.ret.1 // 802
D=A // 803
@CALL // 804
0;JMP // 805
(Number.clone.ret.1)
@RETURN // 806
0;JMP // 807

////FunctionInstruction{functionName='Int32.new_from_parts', numLocals=0, funcMapping={Int32.initial_sqrt_guess=13}}
// function Int32.new_from_parts with 0
(Int32.new_from_parts)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 808
AM=M+1 // 809
A=A-1 // 810
M=1 // 811
// call Memory.alloc
@6 // 812
D=A // 813
@14 // 814
M=D // 815
@Memory.alloc // 816
D=A // 817
@13 // 818
M=D // 819
@Int32.new_from_parts.ret.0 // 820
D=A // 821
@CALL // 822
0;JMP // 823
(Int32.new_from_parts.ret.0)
@SP // 824
AM=M-1 // 825
D=M // 826
@3 // 827
M=D // 828

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

@Int32.0 // 829
M=M+1 // 830

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 831
A=M // 832
D=M // 833
@THIS // 834
A=M // 835
M=D // 836

////PushInstruction("pointer 0")
@3 // 837
D=M // 838
@SP // 839
AM=M+1 // 840
A=A-1 // 841
M=D // 842
@RETURN // 843
0;JMP // 844

////FunctionInstruction{functionName='Intersection.dispose', numLocals=0, funcMapping={}}
// function Intersection.dispose with 0
(Intersection.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 845
A=M // 846
D=M // 847
@3 // 848
M=D // 849

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

@Intersection.0 // 850
M=M-1 // 851

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 852
A=M // 853
D=M // 854
@SP // 855
AM=M+1 // 856
A=A-1 // 857
M=D // 858
// call Number.dispose
@6 // 859
D=A // 860
@14 // 861
M=D // 862
@Number.dispose // 863
D=A // 864
@13 // 865
M=D // 866
@Intersection.dispose.ret.0 // 867
D=A // 868
@CALL // 869
0;JMP // 870
(Intersection.dispose.ret.0)
@SP // 871
M=M-1 // 872

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 873
D=M // 874
@SP // 875
AM=M+1 // 876
A=A-1 // 877
M=D // 878
// call Memory.deAlloc
@6 // 879
D=A // 880
@14 // 881
M=D // 882
@Memory.deAlloc // 883
D=A // 884
@13 // 885
M=D // 886
@Intersection.dispose.ret.1 // 887
D=A // 888
@CALL // 889
0;JMP // 890
(Intersection.dispose.ret.1)
@SP // 891
M=M-1 // 892

////PushInstruction("constant 0")
@SP // 893
AM=M+1 // 894
A=A-1 // 895
M=0 // 896
@RETURN // 897
0;JMP // 898

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
@Output.getMap.LT.8 // 899
D=A // 900
@SP // 901
AM=M+1 // 902
A=A-1 // 903
M=D // 904
@ARG // 905
A=M // 906
D=M // 907
@32 // 908
D=D-A // 909
@DO_LT // 910
0;JMP // 911
(Output.getMap.LT.8)
@SP // 912
AM=M+1 // 913
A=A-1 // 914
M=D // 915
@Output.getMap.GT.9 // 916
D=A // 917
@SP // 918
AM=M+1 // 919
A=A-1 // 920
M=D // 921
@ARG // 922
A=M // 923
D=M // 924
@126 // 925
D=D-A // 926
@DO_GT // 927
0;JMP // 928
(Output.getMap.GT.9)
@SP // 929
AM=M-1 // 930
D=D|M // 931
@Output.getMap$IF_TRUE1 // 932
D;JNE // 933

////GotoInstruction{label='Output.getMap$IF_END1}
// goto Output.getMap$IF_END1
@Output.getMap$IF_END1 // 934
0;JMP // 935

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 936
A=M // 937
M=0 // 938

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
@Output.0 // 939
D=M // 940
@ARG // 941
A=M // 942
A=D+M // 943
D=M // 944
@SP // 945
AM=M+1 // 946
A=A-1 // 947
M=D // 948
@RETURN // 949
0;JMP // 950

////FunctionInstruction{functionName='Vec3.do_add', numLocals=0, funcMapping={}}
// function Vec3.do_add with 0
(Vec3.do_add)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 951
A=M // 952
D=M // 953
@3 // 954
M=D // 955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 956
A=M // 957
D=M // 958
@SP // 959
AM=M+1 // 960
A=A-1 // 961
M=D // 962
@ARG // 963
A=M+1 // 964
D=M // 965
@SP // 966
AM=M+1 // 967
A=A-1 // 968
M=D // 969
// call Vec3.getX
@6 // 970
D=A // 971
@14 // 972
M=D // 973
@Vec3.getX // 974
D=A // 975
@13 // 976
M=D // 977
@Vec3.do_add.ret.0 // 978
D=A // 979
@CALL // 980
0;JMP // 981
(Vec3.do_add.ret.0)
// call Number.do_add
@7 // 982
D=A // 983
@14 // 984
M=D // 985
@Number.do_add // 986
D=A // 987
@13 // 988
M=D // 989
@Vec3.do_add.ret.1 // 990
D=A // 991
@CALL // 992
0;JMP // 993
(Vec3.do_add.ret.1)
@SP // 994
M=M-1 // 995

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 996
A=M+1 // 997
D=M // 998
@SP // 999
AM=M+1 // 1000
A=A-1 // 1001
M=D // 1002
@ARG // 1003
A=M+1 // 1004
D=M // 1005
@SP // 1006
AM=M+1 // 1007
A=A-1 // 1008
M=D // 1009
// call Vec3.getY
@6 // 1010
D=A // 1011
@14 // 1012
M=D // 1013
@Vec3.getY // 1014
D=A // 1015
@13 // 1016
M=D // 1017
@Vec3.do_add.ret.2 // 1018
D=A // 1019
@CALL // 1020
0;JMP // 1021
(Vec3.do_add.ret.2)
// call Number.do_add
@7 // 1022
D=A // 1023
@14 // 1024
M=D // 1025
@Number.do_add // 1026
D=A // 1027
@13 // 1028
M=D // 1029
@Vec3.do_add.ret.3 // 1030
D=A // 1031
@CALL // 1032
0;JMP // 1033
(Vec3.do_add.ret.3)
@SP // 1034
M=M-1 // 1035

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1036
A=M+1 // 1037
A=A+1 // 1038
D=M // 1039
@SP // 1040
AM=M+1 // 1041
A=A-1 // 1042
M=D // 1043
@ARG // 1044
A=M+1 // 1045
D=M // 1046
@SP // 1047
AM=M+1 // 1048
A=A-1 // 1049
M=D // 1050
// call Vec3.getZ
@6 // 1051
D=A // 1052
@14 // 1053
M=D // 1054
@Vec3.getZ // 1055
D=A // 1056
@13 // 1057
M=D // 1058
@Vec3.do_add.ret.4 // 1059
D=A // 1060
@CALL // 1061
0;JMP // 1062
(Vec3.do_add.ret.4)
// call Number.do_add
@7 // 1063
D=A // 1064
@14 // 1065
M=D // 1066
@Number.do_add // 1067
D=A // 1068
@13 // 1069
M=D // 1070
@Vec3.do_add.ret.5 // 1071
D=A // 1072
@CALL // 1073
0;JMP // 1074
(Vec3.do_add.ret.5)
@SP // 1075
M=M-1 // 1076

////PushInstruction("constant 0")
@SP // 1077
AM=M+1 // 1078
A=A-1 // 1079
M=0 // 1080
@RETURN // 1081
0;JMP // 1082

////FunctionInstruction{functionName='Int32.is_positive', numLocals=0, funcMapping={Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.is_positive with 0
(Int32.is_positive)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1083
A=M // 1084
D=M // 1085
@3 // 1086
M=D // 1087

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
@3 // 1088
D=M // 1089
@SP // 1090
AM=M+1 // 1091
A=A-1 // 1092
M=D // 1093
// call Int32.is_zero
@6 // 1094
D=A // 1095
@14 // 1096
M=D // 1097
@Int32.is_zero // 1098
D=A // 1099
@13 // 1100
M=D // 1101
@Int32.is_positive.ret.0 // 1102
D=A // 1103
@CALL // 1104
0;JMP // 1105
(Int32.is_positive.ret.0)
@SP // 1106
A=M-1 // 1107
M=!D // 1108
@Int32.is_positive.LT.10 // 1109
D=A // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114
@THIS // 1115
A=M // 1116
D=M // 1117
@THIS // 1118
A=M // 1119
D=M // 1120
@3 // 1121
D=D+A // 1122
A=D // 1123
D=M // 1124
@128 // 1125
D=D-A // 1126
@DO_LT // 1127
0;JMP // 1128
(Int32.is_positive.LT.10)
@SP // 1129
AM=M-1 // 1130
D=D&M // 1131
@SP // 1132
AM=M+1 // 1133
A=A-1 // 1134
M=D // 1135
@RETURN // 1136
0;JMP // 1137

////FunctionInstruction{functionName='Int32.do_sub', numLocals=1, funcMapping={Int32.is_positive=1, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.do_sub with 1
(Int32.do_sub)
@SP // 1138
AM=M+1 // 1139
A=A-1 // 1140
M=0 // 1141

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1142
A=M // 1143
D=M // 1144
@3 // 1145
M=D // 1146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1147
A=M+1 // 1148
D=M // 1149
@SP // 1150
AM=M+1 // 1151
A=A-1 // 1152
M=D // 1153
// call Int32.clone
@6 // 1154
D=A // 1155
@14 // 1156
M=D // 1157
@Int32.clone // 1158
D=A // 1159
@13 // 1160
M=D // 1161
@Int32.do_sub.ret.0 // 1162
D=A // 1163
@CALL // 1164
0;JMP // 1165
(Int32.do_sub.ret.0)
@SP // 1166
AM=M-1 // 1167
D=M // 1168
@LCL // 1169
A=M // 1170
M=D // 1171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1172
A=M // 1173
D=M // 1174
@SP // 1175
AM=M+1 // 1176
A=A-1 // 1177
M=D // 1178
// call Int32.do_neg
@6 // 1179
D=A // 1180
@14 // 1181
M=D // 1182
@Int32.do_neg // 1183
D=A // 1184
@13 // 1185
M=D // 1186
@Int32.do_sub.ret.1 // 1187
D=A // 1188
@CALL // 1189
0;JMP // 1190
(Int32.do_sub.ret.1)
@SP // 1191
M=M-1 // 1192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("local 0")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 1193
D=M // 1194
@SP // 1195
AM=M+1 // 1196
A=A-1 // 1197
M=D // 1198
@LCL // 1199
A=M // 1200
D=M // 1201
@SP // 1202
AM=M+1 // 1203
A=A-1 // 1204
M=D // 1205
// call Int32.do_add
@7 // 1206
D=A // 1207
@14 // 1208
M=D // 1209
@Int32.do_add // 1210
D=A // 1211
@13 // 1212
M=D // 1213
@Int32.do_sub.ret.2 // 1214
D=A // 1215
@CALL // 1216
0;JMP // 1217
(Int32.do_sub.ret.2)
@SP // 1218
M=M-1 // 1219

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1220
A=M // 1221
D=M // 1222
@SP // 1223
AM=M+1 // 1224
A=A-1 // 1225
M=D // 1226
// call Int32.dispose
@6 // 1227
D=A // 1228
@14 // 1229
M=D // 1230
@Int32.dispose // 1231
D=A // 1232
@13 // 1233
M=D // 1234
@Int32.do_sub.ret.3 // 1235
D=A // 1236
@CALL // 1237
0;JMP // 1238
(Int32.do_sub.ret.3)
@SP // 1239
M=M-1 // 1240

////PushInstruction("constant 0")
@SP // 1241
AM=M+1 // 1242
A=A-1 // 1243
M=0 // 1244
@RETURN // 1245
0;JMP // 1246

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1247
M=-1 // 1248

////PushInstruction("constant 0")
@SP // 1249
AM=M+1 // 1250
A=A-1 // 1251
M=0 // 1252
@RETURN // 1253
0;JMP // 1254

////FunctionInstruction{functionName='Plane.initialize', numLocals=1, funcMapping={}}
// function Plane.initialize with 1
(Plane.initialize)
@SP // 1255
AM=M+1 // 1256
A=A-1 // 1257
M=0 // 1258

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=static 0}
//}

@SP // 1259
AM=M+1 // 1260
A=A-1 // 1261
M=0 // 1262
// call Number.new
@6 // 1263
D=A // 1264
@14 // 1265
M=D // 1266
@Number.new // 1267
D=A // 1268
@13 // 1269
M=D // 1270
@Plane.initialize.ret.0 // 1271
D=A // 1272
@CALL // 1273
0;JMP // 1274
(Plane.initialize.ret.0)
@SP // 1275
AM=M+1 // 1276
A=A-1 // 1277
M=0 // 1278
// call Number.new
@6 // 1279
D=A // 1280
@14 // 1281
M=D // 1282
@Number.new // 1283
D=A // 1284
@13 // 1285
M=D // 1286
@Plane.initialize.ret.1 // 1287
D=A // 1288
@CALL // 1289
0;JMP // 1290
(Plane.initialize.ret.1)
@SP // 1291
AM=M+1 // 1292
A=A-1 // 1293
M=1 // 1294
// call Number.new
@6 // 1295
D=A // 1296
@14 // 1297
M=D // 1298
@Number.new // 1299
D=A // 1300
@13 // 1301
M=D // 1302
@Plane.initialize.ret.2 // 1303
D=A // 1304
@CALL // 1305
0;JMP // 1306
(Plane.initialize.ret.2)
// call Vec3.new
@8 // 1307
D=A // 1308
@14 // 1309
M=D // 1310
@Vec3.new // 1311
D=A // 1312
@13 // 1313
M=D // 1314
@Plane.initialize.ret.3 // 1315
D=A // 1316
@CALL // 1317
0;JMP // 1318
(Plane.initialize.ret.3)
@SP // 1319
AM=M-1 // 1320
D=M // 1321
@Plane.0 // 1322
M=D // 1323

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=static 1}
//}

@SP // 1324
AM=M+1 // 1325
A=A-1 // 1326
M=0 // 1327
// call Number.new
@6 // 1328
D=A // 1329
@14 // 1330
M=D // 1331
@Number.new // 1332
D=A // 1333
@13 // 1334
M=D // 1335
@Plane.initialize.ret.4 // 1336
D=A // 1337
@CALL // 1338
0;JMP // 1339
(Plane.initialize.ret.4)
@SP // 1340
AM=M+1 // 1341
A=A-1 // 1342
M=1 // 1343
// call Number.new
@6 // 1344
D=A // 1345
@14 // 1346
M=D // 1347
@Number.new // 1348
D=A // 1349
@13 // 1350
M=D // 1351
@Plane.initialize.ret.5 // 1352
D=A // 1353
@CALL // 1354
0;JMP // 1355
(Plane.initialize.ret.5)
@SP // 1356
AM=M+1 // 1357
A=A-1 // 1358
M=0 // 1359
// call Number.new
@6 // 1360
D=A // 1361
@14 // 1362
M=D // 1363
@Number.new // 1364
D=A // 1365
@13 // 1366
M=D // 1367
@Plane.initialize.ret.6 // 1368
D=A // 1369
@CALL // 1370
0;JMP // 1371
(Plane.initialize.ret.6)
// call Vec3.new
@8 // 1372
D=A // 1373
@14 // 1374
M=D // 1375
@Vec3.new // 1376
D=A // 1377
@13 // 1378
M=D // 1379
@Plane.initialize.ret.7 // 1380
D=A // 1381
@CALL // 1382
0;JMP // 1383
(Plane.initialize.ret.7)
@SP // 1384
AM=M-1 // 1385
D=M // 1386
@Plane.1 // 1387
M=D // 1388

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1000")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 2}
//}

@1000 // 1389
D=A // 1390
@SP // 1391
AM=M+1 // 1392
A=A-1 // 1393
M=D // 1394
// call Number.new
@6 // 1395
D=A // 1396
@14 // 1397
M=D // 1398
@Number.new // 1399
D=A // 1400
@13 // 1401
M=D // 1402
@Plane.initialize.ret.8 // 1403
D=A // 1404
@CALL // 1405
0;JMP // 1406
(Plane.initialize.ret.8)
@SP // 1407
AM=M-1 // 1408
D=M // 1409
@Plane.2 // 1410
M=D // 1411

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 3}
//}

@SP // 1412
AM=M+1 // 1413
A=A-1 // 1414
M=1 // 1415
// call Number.new
@6 // 1416
D=A // 1417
@14 // 1418
M=D // 1419
@Number.new // 1420
D=A // 1421
@13 // 1422
M=D // 1423
@Plane.initialize.ret.9 // 1424
D=A // 1425
@CALL // 1426
0;JMP // 1427
(Plane.initialize.ret.9)
@SP // 1428
AM=M-1 // 1429
D=M // 1430
@Plane.3 // 1431
M=D // 1432

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 4}
//}

@90 // 1433
D=A // 1434
@SP // 1435
AM=M+1 // 1436
A=A-1 // 1437
M=D // 1438
// call Number.new
@6 // 1439
D=A // 1440
@14 // 1441
M=D // 1442
@Number.new // 1443
D=A // 1444
@13 // 1445
M=D // 1446
@Plane.initialize.ret.10 // 1447
D=A // 1448
@CALL // 1449
0;JMP // 1450
(Plane.initialize.ret.10)
@SP // 1451
AM=M-1 // 1452
D=M // 1453
@Plane.4 // 1454
M=D // 1455

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=static 5}
//}

@3 // 1456
D=A // 1457
@SP // 1458
AM=M+1 // 1459
A=A-1 // 1460
M=D // 1461
// call Number.new
@6 // 1462
D=A // 1463
@14 // 1464
M=D // 1465
@Number.new // 1466
D=A // 1467
@13 // 1468
M=D // 1469
@Plane.initialize.ret.11 // 1470
D=A // 1471
@CALL // 1472
0;JMP // 1473
(Plane.initialize.ret.11)
@SP // 1474
AM=M-1 // 1475
D=M // 1476
@Plane.5 // 1477
M=D // 1478

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@100 // 1479
D=A // 1480
@SP // 1481
AM=M+1 // 1482
A=A-1 // 1483
M=D // 1484
// call Number.new
@6 // 1485
D=A // 1486
@14 // 1487
M=D // 1488
@Number.new // 1489
D=A // 1490
@13 // 1491
M=D // 1492
@Plane.initialize.ret.12 // 1493
D=A // 1494
@CALL // 1495
0;JMP // 1496
(Plane.initialize.ret.12)
@SP // 1497
AM=M-1 // 1498
D=M // 1499
@LCL // 1500
A=M // 1501
M=D // 1502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 4"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@Plane.4 // 1503
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
@Plane.initialize.ret.13 // 1524
D=A // 1525
@CALL // 1526
0;JMP // 1527
(Plane.initialize.ret.13)
@SP // 1528
M=M-1 // 1529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 5"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@Plane.5 // 1530
D=M // 1531
@SP // 1532
AM=M+1 // 1533
A=A-1 // 1534
M=D // 1535
@LCL // 1536
A=M // 1537
D=M // 1538
@SP // 1539
AM=M+1 // 1540
A=A-1 // 1541
M=D // 1542
// call Number.do_div
@7 // 1543
D=A // 1544
@14 // 1545
M=D // 1546
@Number.do_div // 1547
D=A // 1548
@13 // 1549
M=D // 1550
@Plane.initialize.ret.14 // 1551
D=A // 1552
@CALL // 1553
0;JMP // 1554
(Plane.initialize.ret.14)
@SP // 1555
M=M-1 // 1556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1557
A=M // 1558
D=M // 1559
@SP // 1560
AM=M+1 // 1561
A=A-1 // 1562
M=D // 1563
// call Number.dispose
@6 // 1564
D=A // 1565
@14 // 1566
M=D // 1567
@Number.dispose // 1568
D=A // 1569
@13 // 1570
M=D // 1571
@Plane.initialize.ret.15 // 1572
D=A // 1573
@CALL // 1574
0;JMP // 1575
(Plane.initialize.ret.15)
@SP // 1576
M=M-1 // 1577

////PushInstruction("constant 0")
@SP // 1578
AM=M+1 // 1579
A=A-1 // 1580
M=0 // 1581
@RETURN // 1582
0;JMP // 1583

////FunctionInstruction{functionName='Plane.new', numLocals=0, funcMapping={Plane.initialize=16}}
// function Plane.new with 0
(Plane.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@4 // 1584
D=A // 1585
@SP // 1586
AM=M+1 // 1587
A=A-1 // 1588
M=D // 1589
// call Memory.alloc
@6 // 1590
D=A // 1591
@14 // 1592
M=D // 1593
@Memory.alloc // 1594
D=A // 1595
@13 // 1596
M=D // 1597
@Plane.new.ret.0 // 1598
D=A // 1599
@CALL // 1600
0;JMP // 1601
(Plane.new.ret.0)
@SP // 1602
AM=M-1 // 1603
D=M // 1604
@3 // 1605
M=D // 1606

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 1607
A=M // 1608
D=M // 1609
@THIS // 1610
A=M // 1611
M=D // 1612

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 1613
A=M+1 // 1614
D=M // 1615
@THIS // 1616
A=M+1 // 1617
M=D // 1618

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 1619
A=M+1 // 1620
A=A+1 // 1621
D=M // 1622
@THIS // 1623
A=M+1 // 1624
A=A+1 // 1625
M=D // 1626

////PushPopPair {
//  push: PushInstruction("argument 3")
//  pop:  PopInstruction{address=this 3}
//}

@ARG // 1627
A=M+1 // 1628
A=A+1 // 1629
A=A+1 // 1630
D=M // 1631
@THIS // 1632
A=M+1 // 1633
A=A+1 // 1634
A=A+1 // 1635
M=D // 1636

////PushInstruction("pointer 0")
@3 // 1637
D=M // 1638
@SP // 1639
AM=M+1 // 1640
A=A-1 // 1641
M=D // 1642
@RETURN // 1643
0;JMP // 1644

////FunctionInstruction{functionName='Number.do_mul', numLocals=0, funcMapping={Number.clone=2}}
// function Number.do_mul with 0
(Number.do_mul)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 1645
A=M // 1646
D=M // 1647
@3 // 1648
M=D // 1649

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}},
//    right:
//CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.is_zero}},
//    binaryOp: "OR"
//), ifGoto=IfGotoInstruction{label='Number.do_mul$IF_TRUE1}}
@THIS // 1650
A=M // 1651
D=M // 1652
@SP // 1653
AM=M+1 // 1654
A=A-1 // 1655
M=D // 1656
// call Int32.is_zero
@6 // 1657
D=A // 1658
@14 // 1659
M=D // 1660
@Int32.is_zero // 1661
D=A // 1662
@13 // 1663
M=D // 1664
@Number.do_mul.ret.0 // 1665
D=A // 1666
@CALL // 1667
0;JMP // 1668
(Number.do_mul.ret.0)
@ARG // 1669
A=M+1 // 1670
D=M // 1671
@SP // 1672
AM=M+1 // 1673
A=A-1 // 1674
M=D // 1675
// call Number.is_zero
@6 // 1676
D=A // 1677
@14 // 1678
M=D // 1679
@Number.is_zero // 1680
D=A // 1681
@13 // 1682
M=D // 1683
@Number.do_mul.ret.1 // 1684
D=A // 1685
@CALL // 1686
0;JMP // 1687
(Number.do_mul.ret.1)
@SP // 1688
AM=M-1 // 1689
D=M // 1690
@SP // 1691
AM=M-1 // 1692
D=D|M // 1693
@Number.do_mul$IF_TRUE1 // 1694
D;JNE // 1695

////GotoInstruction{label='Number.do_mul$IF_END1}
// goto Number.do_mul$IF_END1
@Number.do_mul$IF_END1 // 1696
0;JMP // 1697

////LabelInstruction{label='Number.do_mul$IF_TRUE1}
// label Number.do_mul$IF_TRUE1
(Number.do_mul$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_zero}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1698
A=M // 1699
D=M // 1700
@SP // 1701
AM=M+1 // 1702
A=A-1 // 1703
M=D // 1704
// call Int32.do_zero
@6 // 1705
D=A // 1706
@14 // 1707
M=D // 1708
@Int32.do_zero // 1709
D=A // 1710
@13 // 1711
M=D // 1712
@Number.do_mul.ret.2 // 1713
D=A // 1714
@CALL // 1715
0;JMP // 1716
(Number.do_mul.ret.2)
@SP // 1717
M=M-1 // 1718

////PushInstruction("constant 0")
@SP // 1719
AM=M+1 // 1720
A=A-1 // 1721
M=0 // 1722
@RETURN // 1723
0;JMP // 1724

////LabelInstruction{label='Number.do_mul$IF_END1}
// label Number.do_mul$IF_END1
(Number.do_mul$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}, PushInstruction("constant 2")], call=CallInstruction{Int32.do_mul_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 1725
A=M // 1726
D=M // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D // 1731
@ARG // 1732
A=M+1 // 1733
D=M // 1734
@SP // 1735
AM=M+1 // 1736
A=A-1 // 1737
M=D // 1738
// call Number.getV
@6 // 1739
D=A // 1740
@14 // 1741
M=D // 1742
@Number.getV // 1743
D=A // 1744
@13 // 1745
M=D // 1746
@Number.do_mul.ret.3 // 1747
D=A // 1748
@CALL // 1749
0;JMP // 1750
(Number.do_mul.ret.3)
@2 // 1751
D=A // 1752
@SP // 1753
AM=M+1 // 1754
A=A-1 // 1755
M=D // 1756
// call Int32.do_mul_right_shift_bytes
@8 // 1757
D=A // 1758
@14 // 1759
M=D // 1760
@Int32.do_mul_right_shift_bytes // 1761
D=A // 1762
@13 // 1763
M=D // 1764
@Number.do_mul.ret.4 // 1765
D=A // 1766
@CALL // 1767
0;JMP // 1768
(Number.do_mul.ret.4)
@SP // 1769
M=M-1 // 1770

////PushInstruction("constant 0")
@SP // 1771
AM=M+1 // 1772
A=A-1 // 1773
M=0 // 1774
@RETURN // 1775
0;JMP // 1776

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 1777
AM=M+1 // 1778
A=A-1 // 1779
M=0 // 1780

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 1781
D=A // 1782
@SP // 1783
AM=M+1 // 1784
A=A-1 // 1785
M=D // 1786
// call Memory.alloc
@6 // 1787
D=A // 1788
@14 // 1789
M=D // 1790
@Memory.alloc // 1791
D=A // 1792
@13 // 1793
M=D // 1794
@Output.create.ret.0 // 1795
D=A // 1796
@CALL // 1797
0;JMP // 1798
(Output.create.ret.0)
@SP // 1799
AM=M-1 // 1800
D=M // 1801
@LCL // 1802
A=M // 1803
M=D // 1804

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 1805
D=M // 1806
@ARG // 1807
A=M // 1808
D=D+M // 1809
@SP // 1810
AM=M+1 // 1811
A=A-1 // 1812
M=D // 1813
@LCL // 1814
A=M // 1815
D=M // 1816
@SP // 1817
AM=M-1 // 1818
A=M // 1819
M=D // 1820

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 1821
A=M // 1822
D=M // 1823
@0 // 1824
D=D+A // 1825
@SP // 1826
AM=M+1 // 1827
A=A-1 // 1828
M=D // 1829
@ARG // 1830
A=M+1 // 1831
D=M // 1832
@SP // 1833
AM=M-1 // 1834
A=M // 1835
M=D // 1836

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1837
A=M // 1838
D=M // 1839
D=D+1 // 1840
@SP // 1841
AM=M+1 // 1842
A=A-1 // 1843
M=D // 1844
@ARG // 1845
A=M+1 // 1846
A=A+1 // 1847
D=M // 1848
@SP // 1849
AM=M-1 // 1850
A=M // 1851
M=D // 1852

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 1853
A=M // 1854
D=M // 1855
@2 // 1856
D=D+A // 1857
@SP // 1858
AM=M+1 // 1859
A=A-1 // 1860
M=D // 1861
@ARG // 1862
A=M+1 // 1863
A=A+1 // 1864
A=A+1 // 1865
D=M // 1866
@SP // 1867
AM=M-1 // 1868
A=M // 1869
M=D // 1870

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 1871
A=M // 1872
D=M // 1873
@3 // 1874
D=D+A // 1875
@SP // 1876
AM=M+1 // 1877
A=A-1 // 1878
M=D // 1879
@ARG // 1880
D=M // 1881
@4 // 1882
A=D+A // 1883
D=M // 1884
@SP // 1885
AM=M-1 // 1886
A=M // 1887
M=D // 1888

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 1889
A=M // 1890
D=M // 1891
@4 // 1892
D=D+A // 1893
@SP // 1894
AM=M+1 // 1895
A=A-1 // 1896
M=D // 1897
@ARG // 1898
D=M // 1899
@5 // 1900
A=D+A // 1901
D=M // 1902
@SP // 1903
AM=M-1 // 1904
A=M // 1905
M=D // 1906

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 1907
A=M // 1908
D=M // 1909
@5 // 1910
D=D+A // 1911
@SP // 1912
AM=M+1 // 1913
A=A-1 // 1914
M=D // 1915
@ARG // 1916
D=M // 1917
@6 // 1918
A=D+A // 1919
D=M // 1920
@SP // 1921
AM=M-1 // 1922
A=M // 1923
M=D // 1924

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 1925
A=M // 1926
D=M // 1927
@6 // 1928
D=D+A // 1929
@SP // 1930
AM=M+1 // 1931
A=A-1 // 1932
M=D // 1933
@ARG // 1934
D=M // 1935
@7 // 1936
A=D+A // 1937
D=M // 1938
@SP // 1939
AM=M-1 // 1940
A=M // 1941
M=D // 1942

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1943
A=M // 1944
D=M // 1945
@7 // 1946
D=D+A // 1947
@SP // 1948
AM=M+1 // 1949
A=A-1 // 1950
M=D // 1951
@ARG // 1952
D=M // 1953
@8 // 1954
A=D+A // 1955
D=M // 1956
@SP // 1957
AM=M-1 // 1958
A=M // 1959
M=D // 1960

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 1961
A=M // 1962
D=M // 1963
@8 // 1964
D=D+A // 1965
@SP // 1966
AM=M+1 // 1967
A=A-1 // 1968
M=D // 1969
@ARG // 1970
D=M // 1971
@9 // 1972
A=D+A // 1973
D=M // 1974
@SP // 1975
AM=M-1 // 1976
A=M // 1977
M=D // 1978

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 1979
A=M // 1980
D=M // 1981
@9 // 1982
D=D+A // 1983
@SP // 1984
AM=M+1 // 1985
A=A-1 // 1986
M=D // 1987
@ARG // 1988
D=M // 1989
@10 // 1990
A=D+A // 1991
D=M // 1992
@SP // 1993
AM=M-1 // 1994
A=M // 1995
M=D // 1996

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 1997
A=M // 1998
D=M // 1999
@10 // 2000
D=D+A // 2001
@SP // 2002
AM=M+1 // 2003
A=A-1 // 2004
M=D // 2005
@ARG // 2006
D=M // 2007
@11 // 2008
A=D+A // 2009
D=M // 2010
@SP // 2011
AM=M-1 // 2012
A=M // 2013
M=D // 2014

////PushInstruction("constant 0")
@SP // 2015
AM=M+1 // 2016
A=A-1 // 2017
M=0 // 2018
@RETURN // 2019
0;JMP // 2020

////FunctionInstruction{functionName='Int32.clone', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1}}
// function Int32.clone with 2
(Int32.clone)
@SP // 2021
M=M+1 // 2022
AM=M+1 // 2023
A=A-1 // 2024
M=0 // 2025
A=A-1 // 2026
M=0 // 2027

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2028
A=M // 2029
D=M // 2030
@3 // 2031
M=D // 2032

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@4 // 2033
D=A // 2034
@SP // 2035
AM=M+1 // 2036
A=A-1 // 2037
M=D // 2038
// call Memory.alloc
@6 // 2039
D=A // 2040
@14 // 2041
M=D // 2042
@Memory.alloc // 2043
D=A // 2044
@13 // 2045
M=D // 2046
@Int32.clone.ret.0 // 2047
D=A // 2048
@CALL // 2049
0;JMP // 2050
(Int32.clone.ret.0)
@SP // 2051
AM=M-1 // 2052
D=M // 2053
@LCL // 2054
A=M // 2055
M=D // 2056

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2057
A=M+1 // 2058
M=0 // 2059

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
@Int32.clone.LT.11 // 2060
D=A // 2061
@SP // 2062
AM=M+1 // 2063
A=A-1 // 2064
M=D // 2065
@LCL // 2066
A=M+1 // 2067
D=M // 2068
@4 // 2069
D=D-A // 2070
@DO_LT // 2071
0;JMP // 2072
(Int32.clone.LT.11)
D=!D // 2073
@Int32.clone_WHILE_END1 // 2074
D;JNE // 2075

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
@LCL // 2076
A=M+1 // 2077
D=M // 2078
A=A-1 // 2079
D=D+M // 2080
@SP // 2081
AM=M+1 // 2082
A=A-1 // 2083
M=D // 2084
@THIS // 2085
A=M // 2086
D=M // 2087
@LCL // 2088
A=M+1 // 2089
A=D+M // 2090
D=M // 2091
@SP // 2092
AM=M-1 // 2093
A=M // 2094
M=D // 2095

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

@LCL // 2096
A=M+1 // 2097
M=M+1 // 2098

////GotoInstruction{label='Int32.clone_WHILE_EXP1}
// goto Int32.clone_WHILE_EXP1
@Int32.clone_WHILE_EXP1 // 2099
0;JMP // 2100

////LabelInstruction{label='Int32.clone_WHILE_END1}
// label Int32.clone_WHILE_END1
(Int32.clone_WHILE_END1)

////CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.new_from_parts}}
@LCL // 2101
A=M // 2102
D=M // 2103
@SP // 2104
AM=M+1 // 2105
A=A-1 // 2106
M=D // 2107
// call Int32.new_from_parts
@6 // 2108
D=A // 2109
@14 // 2110
M=D // 2111
@Int32.new_from_parts // 2112
D=A // 2113
@13 // 2114
M=D // 2115
@Int32.clone.ret.1 // 2116
D=A // 2117
@CALL // 2118
0;JMP // 2119
(Int32.clone.ret.1)
@RETURN // 2120
0;JMP // 2121

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2122
A=M // 2123
D=M // 2124
@3 // 2125
M=D // 2126

////PushInstruction("this 1")
@THIS // 2127
A=M+1 // 2128
D=M // 2129
@SP // 2130
AM=M+1 // 2131
A=A-1 // 2132
M=D // 2133
@RETURN // 2134
0;JMP // 2135

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2136
AM=M+1 // 2137
A=A-1 // 2138
M=0 // 2139

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2140
A=M // 2141
M=0 // 2142

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
@Memory.getBinIndex.LT.12 // 2143
D=A // 2144
@SP // 2145
AM=M+1 // 2146
A=A-1 // 2147
M=D // 2148
@LCL // 2149
A=M // 2150
D=M // 2151
@7 // 2152
D=D-A // 2153
@DO_LT // 2154
0;JMP // 2155
(Memory.getBinIndex.LT.12)
@SP // 2156
AM=M+1 // 2157
A=A-1 // 2158
M=D // 2159
@Memory.getBinIndex.EQ.13 // 2160
D=A // 2161
@SP // 2162
AM=M+1 // 2163
A=A-1 // 2164
M=D // 2165
@LCL // 2166
A=M // 2167
D=M // 2168
@LCL // 2169
A=M // 2170
D=M // 2171
@2048 // 2172
D=D+A // 2173
A=D // 2174
D=M // 2175
@DO_EQ // 2176
0;JMP // 2177
(Memory.getBinIndex.EQ.13)
D=!D // 2178
@SP // 2179
AM=M-1 // 2180
D=D&M // 2181
D=!D // 2182
@Memory.getBinIndex_WHILE_END1 // 2183
D;JNE // 2184

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
@Memory.getBinIndex.GT.14 // 2185
D=A // 2186
@SP // 2187
AM=M+1 // 2188
A=A-1 // 2189
M=D // 2190
@ARG // 2191
A=M // 2192
D=M // 2193
@SP // 2194
AM=M+1 // 2195
A=A-1 // 2196
M=D // 2197
@LCL // 2198
A=M // 2199
D=M // 2200
D=D+1 // 2201
@SP // 2202
AM=M+1 // 2203
A=A-1 // 2204
M=D // 2205
@16 // 2206
D=A // 2207
@SP // 2208
AM=M+1 // 2209
A=A-1 // 2210
M=D // 2211
// call Math.multiply
@7 // 2212
D=A // 2213
@14 // 2214
M=D // 2215
@Math.multiply // 2216
D=A // 2217
@13 // 2218
M=D // 2219
@Memory.getBinIndex.ret.0 // 2220
D=A // 2221
@CALL // 2222
0;JMP // 2223
(Memory.getBinIndex.ret.0)
@SP // 2224
AM=M-1 // 2225
D=M // 2226
@SP // 2227
AM=M-1 // 2228
D=M-D // 2229
@DO_GT // 2230
0;JMP // 2231
(Memory.getBinIndex.GT.14)
D=!D // 2232
@Memory.getBinIndex$IF_TRUE1 // 2233
D;JNE // 2234

////GotoInstruction{label='Memory.getBinIndex$IF_END1}
// goto Memory.getBinIndex$IF_END1
@Memory.getBinIndex$IF_END1 // 2235
0;JMP // 2236

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2237
A=M // 2238
D=M // 2239
@SP // 2240
AM=M+1 // 2241
A=A-1 // 2242
M=D // 2243
@RETURN // 2244
0;JMP // 2245

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

@LCL // 2246
A=M // 2247
M=M+1 // 2248

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2249
0;JMP // 2250

////LabelInstruction{label='Memory.getBinIndex_WHILE_END1}
// label Memory.getBinIndex_WHILE_END1
(Memory.getBinIndex_WHILE_END1)

////PushInstruction("constant 6")
@6 // 2251
D=A // 2252
@SP // 2253
AM=M+1 // 2254
A=A-1 // 2255
M=D // 2256
@RETURN // 2257
0;JMP // 2258

////FunctionInstruction{functionName='Sphere.new', numLocals=0, funcMapping={}}
// function Sphere.new with 0
(Sphere.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2259
D=A // 2260
@SP // 2261
AM=M+1 // 2262
A=A-1 // 2263
M=D // 2264
// call Memory.alloc
@6 // 2265
D=A // 2266
@14 // 2267
M=D // 2268
@Memory.alloc // 2269
D=A // 2270
@13 // 2271
M=D // 2272
@Sphere.new.ret.0 // 2273
D=A // 2274
@CALL // 2275
0;JMP // 2276
(Sphere.new.ret.0)
@SP // 2277
AM=M-1 // 2278
D=M // 2279
@3 // 2280
M=D // 2281

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2282
A=M // 2283
D=M // 2284
@THIS // 2285
A=M // 2286
M=D // 2287

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 2288
A=M+1 // 2289
D=M // 2290
@THIS // 2291
A=M+1 // 2292
M=D // 2293

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2294
A=M+1 // 2295
A=A+1 // 2296
D=M // 2297
@THIS // 2298
A=M+1 // 2299
A=A+1 // 2300
M=D // 2301

////PushInstruction("pointer 0")
@3 // 2302
D=M // 2303
@SP // 2304
AM=M+1 // 2305
A=A-1 // 2306
M=D // 2307
@RETURN // 2308
0;JMP // 2309

////FunctionInstruction{functionName='Number.cmp', numLocals=0, funcMapping={Number.clone=2, Number.do_mul=5}}
// function Number.cmp with 0
(Number.cmp)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2310
A=M // 2311
D=M // 2312
@3 // 2313
M=D // 2314

////CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.cmp}}
@THIS // 2315
A=M // 2316
D=M // 2317
@SP // 2318
AM=M+1 // 2319
A=A-1 // 2320
M=D // 2321
@ARG // 2322
A=M+1 // 2323
D=M // 2324
@SP // 2325
AM=M+1 // 2326
A=A-1 // 2327
M=D // 2328
// call Number.getV
@6 // 2329
D=A // 2330
@14 // 2331
M=D // 2332
@Number.getV // 2333
D=A // 2334
@13 // 2335
M=D // 2336
@Number.cmp.ret.0 // 2337
D=A // 2338
@CALL // 2339
0;JMP // 2340
(Number.cmp.ret.0)
// call Int32.cmp
@7 // 2341
D=A // 2342
@14 // 2343
M=D // 2344
@Int32.cmp // 2345
D=A // 2346
@13 // 2347
M=D // 2348
@Number.cmp.ret.1 // 2349
D=A // 2350
@CALL // 2351
0;JMP // 2352
(Number.cmp.ret.1)
@RETURN // 2353
0;JMP // 2354

////FunctionInstruction{functionName='Int32.do_abs', numLocals=0, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_abs with 0
(Int32.do_abs)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2355
A=M // 2356
D=M // 2357
@3 // 2358
M=D // 2359

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_abs$IF_TRUE1}}
@3 // 2360
D=M // 2361
@SP // 2362
AM=M+1 // 2363
A=A-1 // 2364
M=D // 2365
// call Int32.is_negative
@6 // 2366
D=A // 2367
@14 // 2368
M=D // 2369
@Int32.is_negative // 2370
D=A // 2371
@13 // 2372
M=D // 2373
@Int32.do_abs.ret.0 // 2374
D=A // 2375
@CALL // 2376
0;JMP // 2377
(Int32.do_abs.ret.0)
@SP // 2378
AM=M-1 // 2379
D=M // 2380
@Int32.do_abs$IF_TRUE1 // 2381
D;JNE // 2382

////GotoInstruction{label='Int32.do_abs$IF_END1}
// goto Int32.do_abs$IF_END1
@Int32.do_abs$IF_END1 // 2383
0;JMP // 2384

////LabelInstruction{label='Int32.do_abs$IF_TRUE1}
// label Int32.do_abs$IF_TRUE1
(Int32.do_abs$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2385
D=M // 2386
@SP // 2387
AM=M+1 // 2388
A=A-1 // 2389
M=D // 2390
// call Int32.do_neg
@6 // 2391
D=A // 2392
@14 // 2393
M=D // 2394
@Int32.do_neg // 2395
D=A // 2396
@13 // 2397
M=D // 2398
@Int32.do_abs.ret.1 // 2399
D=A // 2400
@CALL // 2401
0;JMP // 2402
(Int32.do_abs.ret.1)
@SP // 2403
M=M-1 // 2404

////LabelInstruction{label='Int32.do_abs$IF_END1}
// label Int32.do_abs$IF_END1
(Int32.do_abs$IF_END1)

////PushInstruction("constant 0")
@SP // 2405
AM=M+1 // 2406
A=A-1 // 2407
M=0 // 2408
@RETURN // 2409
0;JMP // 2410

////FunctionInstruction{functionName='Int32.do_right_shift_bytes', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_right_shift_bytes with 2
(Int32.do_right_shift_bytes)
@SP // 2411
M=M+1 // 2412
AM=M+1 // 2413
A=A-1 // 2414
M=0 // 2415
A=A-1 // 2416
M=0 // 2417

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2418
A=M // 2419
D=M // 2420
@3 // 2421
M=D // 2422

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE1}}
@Int32.do_right_shift_bytes.GT.15 // 2423
D=A // 2424
@SP // 2425
AM=M+1 // 2426
A=A-1 // 2427
M=D // 2428
@ARG // 2429
A=M+1 // 2430
D=M // 2431
@DO_GT // 2432
0;JMP // 2433
(Int32.do_right_shift_bytes.GT.15)
D=!D // 2434
@Int32.do_right_shift_bytes$IF_TRUE1 // 2435
D;JNE // 2436

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END1}
// goto Int32.do_right_shift_bytes$IF_END1
@Int32.do_right_shift_bytes$IF_END1 // 2437
0;JMP // 2438

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE1}
// label Int32.do_right_shift_bytes$IF_TRUE1
(Int32.do_right_shift_bytes$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2439
AM=M+1 // 2440
A=A-1 // 2441
M=0 // 2442
@RETURN // 2443
0;JMP // 2444

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END1}
// label Int32.do_right_shift_bytes$IF_END1
(Int32.do_right_shift_bytes$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}
//  pop:  PopInstruction{address=local 1}
//}

@3 // 2445
D=M // 2446
@SP // 2447
AM=M+1 // 2448
A=A-1 // 2449
M=D // 2450
// call Int32.is_negative
@6 // 2451
D=A // 2452
@14 // 2453
M=D // 2454
@Int32.is_negative // 2455
D=A // 2456
@13 // 2457
M=D // 2458
@Int32.do_right_shift_bytes.ret.0 // 2459
D=A // 2460
@CALL // 2461
0;JMP // 2462
(Int32.do_right_shift_bytes.ret.0)
@SP // 2463
AM=M-1 // 2464
D=M // 2465
@LCL // 2466
A=M+1 // 2467
M=D // 2468

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE2}}
@LCL // 2469
A=M+1 // 2470
D=M // 2471
@Int32.do_right_shift_bytes$IF_TRUE2 // 2472
D;JNE // 2473

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END2}
// goto Int32.do_right_shift_bytes$IF_END2
@Int32.do_right_shift_bytes$IF_END2 // 2474
0;JMP // 2475

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE2}
// label Int32.do_right_shift_bytes$IF_TRUE2
(Int32.do_right_shift_bytes$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2476
D=M // 2477
@SP // 2478
AM=M+1 // 2479
A=A-1 // 2480
M=D // 2481
// call Int32.do_neg
@6 // 2482
D=A // 2483
@14 // 2484
M=D // 2485
@Int32.do_neg // 2486
D=A // 2487
@13 // 2488
M=D // 2489
@Int32.do_right_shift_bytes.ret.1 // 2490
D=A // 2491
@CALL // 2492
0;JMP // 2493
(Int32.do_right_shift_bytes.ret.1)
@SP // 2494
M=M-1 // 2495

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END2}
// label Int32.do_right_shift_bytes$IF_END2
(Int32.do_right_shift_bytes$IF_END2)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2496
A=M // 2497
M=0 // 2498

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
@Int32.do_right_shift_bytes.LT.16 // 2499
D=A // 2500
@SP // 2501
AM=M+1 // 2502
A=A-1 // 2503
M=D // 2504
@LCL // 2505
A=M // 2506
D=M // 2507
@4 // 2508
D=D-A // 2509
@DO_LT // 2510
0;JMP // 2511
(Int32.do_right_shift_bytes.LT.16)
D=!D // 2512
@Int32.do_right_shift_bytes_WHILE_END1 // 2513
D;JNE // 2514

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
@Int32.do_right_shift_bytes.GT.17 // 2515
D=A // 2516
@SP // 2517
AM=M+1 // 2518
A=A-1 // 2519
M=D // 2520
@LCL // 2521
A=M // 2522
D=M // 2523
@ARG // 2524
A=M+1 // 2525
D=D+M // 2526
@3 // 2527
D=D-A // 2528
@DO_GT // 2529
0;JMP // 2530
(Int32.do_right_shift_bytes.GT.17)
D=!D // 2531
@Int32.do_right_shift_bytes$IF_TRUE3 // 2532
D;JNE // 2533

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_FALSE3}
// goto Int32.do_right_shift_bytes$IF_FALSE3
@Int32.do_right_shift_bytes$IF_FALSE3 // 2534
0;JMP // 2535

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
@THIS // 2536
A=M // 2537
D=M // 2538
@LCL // 2539
A=M // 2540
D=D+M // 2541
@SP // 2542
AM=M+1 // 2543
A=A-1 // 2544
M=D // 2545
@THIS // 2546
A=M // 2547
D=M // 2548
@SP // 2549
AM=M+1 // 2550
A=A-1 // 2551
M=D // 2552
@LCL // 2553
A=M // 2554
D=M // 2555
@ARG // 2556
A=M+1 // 2557
D=D+M // 2558
@SP // 2559
AM=M-1 // 2560
A=D+M // 2561
D=M // 2562
@SP // 2563
AM=M-1 // 2564
A=M // 2565
M=D // 2566

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END3}
// goto Int32.do_right_shift_bytes$IF_END3
@Int32.do_right_shift_bytes$IF_END3 // 2567
0;JMP // 2568

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
@THIS // 2569
A=M // 2570
D=M // 2571
@LCL // 2572
A=M // 2573
D=D+M // 2574
@SP // 2575
AM=M+1 // 2576
A=A-1 // 2577
M=D // 2578
D=0 // 2579
@SP // 2580
AM=M-1 // 2581
A=M // 2582
M=D // 2583

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

@LCL // 2584
A=M // 2585
M=M+1 // 2586

////GotoInstruction{label='Int32.do_right_shift_bytes_WHILE_EXP1}
// goto Int32.do_right_shift_bytes_WHILE_EXP1
@Int32.do_right_shift_bytes_WHILE_EXP1 // 2587
0;JMP // 2588

////LabelInstruction{label='Int32.do_right_shift_bytes_WHILE_END1}
// label Int32.do_right_shift_bytes_WHILE_END1
(Int32.do_right_shift_bytes_WHILE_END1)

////ConditionalGroup{push=PushInstruction("local 1"), ifGoto=IfGotoInstruction{label='Int32.do_right_shift_bytes$IF_TRUE4}}
@LCL // 2589
A=M+1 // 2590
D=M // 2591
@Int32.do_right_shift_bytes$IF_TRUE4 // 2592
D;JNE // 2593

////GotoInstruction{label='Int32.do_right_shift_bytes$IF_END4}
// goto Int32.do_right_shift_bytes$IF_END4
@Int32.do_right_shift_bytes$IF_END4 // 2594
0;JMP // 2595

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_TRUE4}
// label Int32.do_right_shift_bytes$IF_TRUE4
(Int32.do_right_shift_bytes$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2596
D=M // 2597
@SP // 2598
AM=M+1 // 2599
A=A-1 // 2600
M=D // 2601
// call Int32.do_neg
@6 // 2602
D=A // 2603
@14 // 2604
M=D // 2605
@Int32.do_neg // 2606
D=A // 2607
@13 // 2608
M=D // 2609
@Int32.do_right_shift_bytes.ret.2 // 2610
D=A // 2611
@CALL // 2612
0;JMP // 2613
(Int32.do_right_shift_bytes.ret.2)
@SP // 2614
M=M-1 // 2615

////LabelInstruction{label='Int32.do_right_shift_bytes$IF_END4}
// label Int32.do_right_shift_bytes$IF_END4
(Int32.do_right_shift_bytes$IF_END4)

////PushInstruction("constant 0")
@SP // 2616
AM=M+1 // 2617
A=A-1 // 2618
M=0 // 2619
@RETURN // 2620
0;JMP // 2621

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
@Math.max.GT.18 // 2622
D=A // 2623
@SP // 2624
AM=M+1 // 2625
A=A-1 // 2626
M=D // 2627
@ARG // 2628
A=M+1 // 2629
D=M // 2630
A=A-1 // 2631
D=M-D // 2632
@DO_GT // 2633
0;JMP // 2634
(Math.max.GT.18)
@Math.max$IF_TRUE1 // 2635
D;JNE // 2636

////GotoInstruction{label='Math.max$IF_END1}
// goto Math.max$IF_END1
@Math.max$IF_END1 // 2637
0;JMP // 2638

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 2639
A=M // 2640
D=M // 2641
@SP // 2642
AM=M+1 // 2643
A=A-1 // 2644
M=D // 2645
@RETURN // 2646
0;JMP // 2647

////LabelInstruction{label='Math.max$IF_END1}
// label Math.max$IF_END1
(Math.max$IF_END1)

////PushInstruction("argument 1")
@ARG // 2648
A=M+1 // 2649
D=M // 2650
@SP // 2651
AM=M+1 // 2652
A=A-1 // 2653
M=D // 2654
@RETURN // 2655
0;JMP // 2656

////FunctionInstruction{functionName='Number.do_div', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5}}
// function Number.do_div with 0
(Number.do_div)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2657
A=M // 2658
D=M // 2659
@3 // 2660
M=D // 2661

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}},
//    right:
//        UnaryPushGroup(CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.is_zero}},
//NOT),
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Number.do_div$IF_TRUE1}}
@THIS // 2662
A=M // 2663
D=M // 2664
@SP // 2665
AM=M+1 // 2666
A=A-1 // 2667
M=D // 2668
// call Int32.is_zero
@6 // 2669
D=A // 2670
@14 // 2671
M=D // 2672
@Int32.is_zero // 2673
D=A // 2674
@13 // 2675
M=D // 2676
@Number.do_div.ret.0 // 2677
D=A // 2678
@CALL // 2679
0;JMP // 2680
(Number.do_div.ret.0)
@ARG // 2681
A=M+1 // 2682
D=M // 2683
@SP // 2684
AM=M+1 // 2685
A=A-1 // 2686
M=D // 2687
// call Number.is_zero
@6 // 2688
D=A // 2689
@14 // 2690
M=D // 2691
@Number.is_zero // 2692
D=A // 2693
@13 // 2694
M=D // 2695
@Number.do_div.ret.1 // 2696
D=A // 2697
@CALL // 2698
0;JMP // 2699
(Number.do_div.ret.1)
@SP // 2700
AM=M-1 // 2701
D=M // 2702
D=!D // 2703
@SP // 2704
AM=M-1 // 2705
D=D&M // 2706
@Number.do_div$IF_TRUE1 // 2707
D;JNE // 2708

////GotoInstruction{label='Number.do_div$IF_END1}
// goto Number.do_div$IF_END1
@Number.do_div$IF_END1 // 2709
0;JMP // 2710

////LabelInstruction{label='Number.do_div$IF_TRUE1}
// label Number.do_div$IF_TRUE1
(Number.do_div$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_zero}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 2711
A=M // 2712
D=M // 2713
@SP // 2714
AM=M+1 // 2715
A=A-1 // 2716
M=D // 2717
// call Int32.do_zero
@6 // 2718
D=A // 2719
@14 // 2720
M=D // 2721
@Int32.do_zero // 2722
D=A // 2723
@13 // 2724
M=D // 2725
@Number.do_div.ret.2 // 2726
D=A // 2727
@CALL // 2728
0;JMP // 2729
(Number.do_div.ret.2)
@SP // 2730
M=M-1 // 2731

////PushInstruction("constant 0")
@SP // 2732
AM=M+1 // 2733
A=A-1 // 2734
M=0 // 2735
@RETURN // 2736
0;JMP // 2737

////LabelInstruction{label='Number.do_div$IF_END1}
// label Number.do_div$IF_END1
(Number.do_div$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_left_shift_bytes_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 2738
A=M // 2739
D=M // 2740
@SP // 2741
AM=M+1 // 2742
A=A-1 // 2743
M=D // 2744
@2 // 2745
D=A // 2746
@SP // 2747
AM=M+1 // 2748
A=A-1 // 2749
M=D // 2750
@ARG // 2751
A=M+1 // 2752
D=M // 2753
@SP // 2754
AM=M+1 // 2755
A=A-1 // 2756
M=D // 2757
// call Number.getV
@6 // 2758
D=A // 2759
@14 // 2760
M=D // 2761
@Number.getV // 2762
D=A // 2763
@13 // 2764
M=D // 2765
@Number.do_div.ret.3 // 2766
D=A // 2767
@CALL // 2768
0;JMP // 2769
(Number.do_div.ret.3)
// call Int32.do_left_shift_bytes_div
@8 // 2770
D=A // 2771
@14 // 2772
M=D // 2773
@Int32.do_left_shift_bytes_div // 2774
D=A // 2775
@13 // 2776
M=D // 2777
@Number.do_div.ret.4 // 2778
D=A // 2779
@CALL // 2780
0;JMP // 2781
(Number.do_div.ret.4)
@SP // 2782
M=M-1 // 2783

////PushInstruction("constant 0")
@SP // 2784
AM=M+1 // 2785
A=A-1 // 2786
M=0 // 2787
@RETURN // 2788
0;JMP // 2789

////FunctionInstruction{functionName='Int32.do_mul_right_shift_bytes', numLocals=10, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.clone=2}}
// function Int32.do_mul_right_shift_bytes with 10
(Int32.do_mul_right_shift_bytes)
@10 // 2790
D=A // 2791
@SP // 2792
AM=D+M // 2793
A=A-1 // 2794
M=0 // 2795
A=A-1 // 2796
M=0 // 2797
A=A-1 // 2798
M=0 // 2799
A=A-1 // 2800
M=0 // 2801
A=A-1 // 2802
M=0 // 2803
A=A-1 // 2804
M=0 // 2805
A=A-1 // 2806
M=0 // 2807
A=A-1 // 2808
M=0 // 2809
A=A-1 // 2810
M=0 // 2811
A=A-1 // 2812
M=0 // 2813

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2814
A=M // 2815
D=M // 2816
@3 // 2817
M=D // 2818

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.is_negative}}], call=CallInstruction{Int32.xor}}
//  pop:  PopInstruction{address=local 7}
//}

@3 // 2819
D=M // 2820
@SP // 2821
AM=M+1 // 2822
A=A-1 // 2823
M=D // 2824
// call Int32.is_negative
@6 // 2825
D=A // 2826
@14 // 2827
M=D // 2828
@Int32.is_negative // 2829
D=A // 2830
@13 // 2831
M=D // 2832
@Int32.do_mul_right_shift_bytes.ret.0 // 2833
D=A // 2834
@CALL // 2835
0;JMP // 2836
(Int32.do_mul_right_shift_bytes.ret.0)
@ARG // 2837
A=M+1 // 2838
D=M // 2839
@SP // 2840
AM=M+1 // 2841
A=A-1 // 2842
M=D // 2843
// call Int32.is_negative
@6 // 2844
D=A // 2845
@14 // 2846
M=D // 2847
@Int32.is_negative // 2848
D=A // 2849
@13 // 2850
M=D // 2851
@Int32.do_mul_right_shift_bytes.ret.1 // 2852
D=A // 2853
@CALL // 2854
0;JMP // 2855
(Int32.do_mul_right_shift_bytes.ret.1)
// call Int32.xor
@7 // 2856
D=A // 2857
@14 // 2858
M=D // 2859
@Int32.xor // 2860
D=A // 2861
@13 // 2862
M=D // 2863
@Int32.do_mul_right_shift_bytes.ret.2 // 2864
D=A // 2865
@CALL // 2866
0;JMP // 2867
(Int32.do_mul_right_shift_bytes.ret.2)
@LCL // 2868
D=M // 2869
@7 // 2870
A=D+A // 2871
D=A // 2872
@R13 // 2873
M=D // 2874
@SP // 2875
AM=M-1 // 2876
D=M // 2877
@R13 // 2878
A=M // 2879
M=D // 2880

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE1}}
@3 // 2881
D=M // 2882
@SP // 2883
AM=M+1 // 2884
A=A-1 // 2885
M=D // 2886
// call Int32.is_negative
@6 // 2887
D=A // 2888
@14 // 2889
M=D // 2890
@Int32.is_negative // 2891
D=A // 2892
@13 // 2893
M=D // 2894
@Int32.do_mul_right_shift_bytes.ret.3 // 2895
D=A // 2896
@CALL // 2897
0;JMP // 2898
(Int32.do_mul_right_shift_bytes.ret.3)
@SP // 2899
AM=M-1 // 2900
D=M // 2901
@Int32.do_mul_right_shift_bytes$IF_TRUE1 // 2902
D;JNE // 2903

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE1}
// goto Int32.do_mul_right_shift_bytes$IF_FALSE1
@Int32.do_mul_right_shift_bytes$IF_FALSE1 // 2904
0;JMP // 2905

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE1}
// label Int32.do_mul_right_shift_bytes$IF_TRUE1
(Int32.do_mul_right_shift_bytes$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@3 // 2906
D=M // 2907
@SP // 2908
AM=M+1 // 2909
A=A-1 // 2910
M=D // 2911
// call Int32.clone
@6 // 2912
D=A // 2913
@14 // 2914
M=D // 2915
@Int32.clone // 2916
D=A // 2917
@13 // 2918
M=D // 2919
@Int32.do_mul_right_shift_bytes.ret.4 // 2920
D=A // 2921
@CALL // 2922
0;JMP // 2923
(Int32.do_mul_right_shift_bytes.ret.4)
@LCL // 2924
D=M // 2925
@5 // 2926
A=D+A // 2927
D=A // 2928
@R13 // 2929
M=D // 2930
@SP // 2931
AM=M-1 // 2932
D=M // 2933
@R13 // 2934
A=M // 2935
M=D // 2936

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_0 // 2937
D=A // 2938
@13 // 2939
M=D // 2940
@5 // 2941
D=A // 2942
@LCL_PUSH // 2943
0;JMP // 2944
(RETURN_PUSH_LABEL_0)
// call Int32.do_abs
@6 // 2945
D=A // 2946
@14 // 2947
M=D // 2948
@Int32.do_abs // 2949
D=A // 2950
@13 // 2951
M=D // 2952
@Int32.do_mul_right_shift_bytes.ret.5 // 2953
D=A // 2954
@CALL // 2955
0;JMP // 2956
(Int32.do_mul_right_shift_bytes.ret.5)
@SP // 2957
M=M-1 // 2958

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@RETURN_PUSH_LABEL_1 // 2959
D=A // 2960
@13 // 2961
M=D // 2962
@5 // 2963
D=A // 2964
@LCL_PUSH // 2965
0;JMP // 2966
(RETURN_PUSH_LABEL_1)
// call Int32.getParts
@6 // 2967
D=A // 2968
@14 // 2969
M=D // 2970
@Int32.getParts // 2971
D=A // 2972
@13 // 2973
M=D // 2974
@Int32.do_mul_right_shift_bytes.ret.6 // 2975
D=A // 2976
@CALL // 2977
0;JMP // 2978
(Int32.do_mul_right_shift_bytes.ret.6)
@SP // 2979
AM=M-1 // 2980
D=M // 2981
@LCL // 2982
A=M // 2983
M=D // 2984

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END1}
// goto Int32.do_mul_right_shift_bytes$IF_END1
@Int32.do_mul_right_shift_bytes$IF_END1 // 2985
0;JMP // 2986

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE1}
// label Int32.do_mul_right_shift_bytes$IF_FALSE1
(Int32.do_mul_right_shift_bytes$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("this 0")
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 2987
A=M // 2988
D=M // 2989
@LCL // 2990
A=M // 2991
M=D // 2992

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END1}
// label Int32.do_mul_right_shift_bytes$IF_END1
(Int32.do_mul_right_shift_bytes$IF_END1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE2}}
@ARG // 2993
A=M+1 // 2994
D=M // 2995
@SP // 2996
AM=M+1 // 2997
A=A-1 // 2998
M=D // 2999
// call Int32.is_negative
@6 // 3000
D=A // 3001
@14 // 3002
M=D // 3003
@Int32.is_negative // 3004
D=A // 3005
@13 // 3006
M=D // 3007
@Int32.do_mul_right_shift_bytes.ret.7 // 3008
D=A // 3009
@CALL // 3010
0;JMP // 3011
(Int32.do_mul_right_shift_bytes.ret.7)
@SP // 3012
AM=M-1 // 3013
D=M // 3014
@Int32.do_mul_right_shift_bytes$IF_TRUE2 // 3015
D;JNE // 3016

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE2}
// goto Int32.do_mul_right_shift_bytes$IF_FALSE2
@Int32.do_mul_right_shift_bytes$IF_FALSE2 // 3017
0;JMP // 3018

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE2}
// label Int32.do_mul_right_shift_bytes$IF_TRUE2
(Int32.do_mul_right_shift_bytes$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@ARG // 3019
A=M+1 // 3020
D=M // 3021
@SP // 3022
AM=M+1 // 3023
A=A-1 // 3024
M=D // 3025
// call Int32.clone
@6 // 3026
D=A // 3027
@14 // 3028
M=D // 3029
@Int32.clone // 3030
D=A // 3031
@13 // 3032
M=D // 3033
@Int32.do_mul_right_shift_bytes.ret.8 // 3034
D=A // 3035
@CALL // 3036
0;JMP // 3037
(Int32.do_mul_right_shift_bytes.ret.8)
@LCL // 3038
D=M // 3039
@6 // 3040
A=D+A // 3041
D=A // 3042
@R13 // 3043
M=D // 3044
@SP // 3045
AM=M-1 // 3046
D=M // 3047
@R13 // 3048
A=M // 3049
M=D // 3050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_2 // 3051
D=A // 3052
@13 // 3053
M=D // 3054
@6 // 3055
D=A // 3056
@LCL_PUSH // 3057
0;JMP // 3058
(RETURN_PUSH_LABEL_2)
// call Int32.do_abs
@6 // 3059
D=A // 3060
@14 // 3061
M=D // 3062
@Int32.do_abs // 3063
D=A // 3064
@13 // 3065
M=D // 3066
@Int32.do_mul_right_shift_bytes.ret.9 // 3067
D=A // 3068
@CALL // 3069
0;JMP // 3070
(Int32.do_mul_right_shift_bytes.ret.9)
@SP // 3071
M=M-1 // 3072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@RETURN_PUSH_LABEL_3 // 3073
D=A // 3074
@13 // 3075
M=D // 3076
@6 // 3077
D=A // 3078
@LCL_PUSH // 3079
0;JMP // 3080
(RETURN_PUSH_LABEL_3)
// call Int32.getParts
@6 // 3081
D=A // 3082
@14 // 3083
M=D // 3084
@Int32.getParts // 3085
D=A // 3086
@13 // 3087
M=D // 3088
@Int32.do_mul_right_shift_bytes.ret.10 // 3089
D=A // 3090
@CALL // 3091
0;JMP // 3092
(Int32.do_mul_right_shift_bytes.ret.10)
@SP // 3093
AM=M-1 // 3094
D=M // 3095
@LCL // 3096
A=M+1 // 3097
M=D // 3098

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END2}
// goto Int32.do_mul_right_shift_bytes$IF_END2
@Int32.do_mul_right_shift_bytes$IF_END2 // 3099
0;JMP // 3100

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_FALSE2}
// label Int32.do_mul_right_shift_bytes$IF_FALSE2
(Int32.do_mul_right_shift_bytes$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3101
A=M+1 // 3102
D=M // 3103
@SP // 3104
AM=M+1 // 3105
A=A-1 // 3106
M=D // 3107
// call Int32.getParts
@6 // 3108
D=A // 3109
@14 // 3110
M=D // 3111
@Int32.getParts // 3112
D=A // 3113
@13 // 3114
M=D // 3115
@Int32.do_mul_right_shift_bytes.ret.11 // 3116
D=A // 3117
@CALL // 3118
0;JMP // 3119
(Int32.do_mul_right_shift_bytes.ret.11)
@SP // 3120
AM=M-1 // 3121
D=M // 3122
@LCL // 3123
A=M+1 // 3124
M=D // 3125

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END2}
// label Int32.do_mul_right_shift_bytes$IF_END2
(Int32.do_mul_right_shift_bytes$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 2}
//}

@8 // 3126
D=A // 3127
@SP // 3128
AM=M+1 // 3129
A=A-1 // 3130
M=D // 3131
// call Memory.alloc
@6 // 3132
D=A // 3133
@14 // 3134
M=D // 3135
@Memory.alloc // 3136
D=A // 3137
@13 // 3138
M=D // 3139
@Int32.do_mul_right_shift_bytes.ret.12 // 3140
D=A // 3141
@CALL // 3142
0;JMP // 3143
(Int32.do_mul_right_shift_bytes.ret.12)
@SP // 3144
AM=M-1 // 3145
D=M // 3146
@LCL // 3147
A=M+1 // 3148
A=A+1 // 3149
M=D // 3150

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 3}
//}

@8 // 3151
D=A // 3152
@SP // 3153
AM=M+1 // 3154
A=A-1 // 3155
M=D // 3156
// call Memory.alloc
@6 // 3157
D=A // 3158
@14 // 3159
M=D // 3160
@Memory.alloc // 3161
D=A // 3162
@13 // 3163
M=D // 3164
@Int32.do_mul_right_shift_bytes.ret.13 // 3165
D=A // 3166
@CALL // 3167
0;JMP // 3168
(Int32.do_mul_right_shift_bytes.ret.13)
@SP // 3169
AM=M-1 // 3170
D=M // 3171
@LCL // 3172
A=M+1 // 3173
A=A+1 // 3174
A=A+1 // 3175
M=D // 3176

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 3177
D=M // 3178
@8 // 3179
A=D+A // 3180
M=0 // 3181

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
@Int32.do_mul_right_shift_bytes.LT.19 // 3182
D=A // 3183
@SP // 3184
AM=M+1 // 3185
A=A-1 // 3186
M=D // 3187
@LCL // 3188
D=M // 3189
@8 // 3190
A=D+A // 3191
D=M // 3192
@4 // 3193
D=D-A // 3194
@DO_LT // 3195
0;JMP // 3196
(Int32.do_mul_right_shift_bytes.LT.19)
D=!D // 3197
@Int32.do_mul_right_shift_bytes_WHILE_END1 // 3198
D;JNE // 3199

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
@LCL // 3200
A=M+1 // 3201
A=A+1 // 3202
D=M // 3203
@SP // 3204
AM=M+1 // 3205
A=A-1 // 3206
M=D // 3207
@LCL // 3208
D=M // 3209
@8 // 3210
A=D+A // 3211
D=M // 3212
D=D+M // 3213
@SP // 3214
AM=M-1 // 3215
D=D+M // 3216
@SP // 3217
AM=M+1 // 3218
A=A-1 // 3219
M=D // 3220
@LCL // 3221
A=M // 3222
D=M // 3223
@SP // 3224
AM=M+1 // 3225
A=A-1 // 3226
M=D // 3227
@LCL // 3228
D=M // 3229
@8 // 3230
A=D+A // 3231
D=M // 3232
@SP // 3233
AM=M-1 // 3234
A=D+M // 3235
D=M // 3236
@15 // 3237
D=D&A // 3238
@SP // 3239
AM=M-1 // 3240
A=M // 3241
M=D // 3242

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
@LCL // 3243
A=M+1 // 3244
A=A+1 // 3245
D=M // 3246
@SP // 3247
AM=M+1 // 3248
A=A-1 // 3249
M=D // 3250
@LCL // 3251
D=M // 3252
@8 // 3253
A=D+A // 3254
D=M // 3255
D=D+M // 3256
D=D+1 // 3257
@SP // 3258
AM=M-1 // 3259
D=D+M // 3260
@SP // 3261
AM=M+1 // 3262
A=A-1 // 3263
M=D // 3264
@LCL // 3265
A=M // 3266
D=M // 3267
@SP // 3268
AM=M+1 // 3269
A=A-1 // 3270
M=D // 3271
@LCL // 3272
D=M // 3273
@8 // 3274
A=D+A // 3275
D=M // 3276
@SP // 3277
AM=M-1 // 3278
A=D+M // 3279
D=M // 3280
@SP // 3281
AM=M+1 // 3282
A=A-1 // 3283
M=D // 3284
@4 // 3285
D=A // 3286
@SP // 3287
AM=M+1 // 3288
A=A-1 // 3289
M=D // 3290
// call Int32.arith_rightshift
@7 // 3291
D=A // 3292
@14 // 3293
M=D // 3294
@Int32.arith_rightshift // 3295
D=A // 3296
@13 // 3297
M=D // 3298
@Int32.do_mul_right_shift_bytes.ret.14 // 3299
D=A // 3300
@CALL // 3301
0;JMP // 3302
(Int32.do_mul_right_shift_bytes.ret.14)
@SP // 3303
AM=M-1 // 3304
D=M // 3305
@SP // 3306
AM=M-1 // 3307
A=M // 3308
M=D // 3309

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
@LCL // 3310
A=M+1 // 3311
A=A+1 // 3312
A=A+1 // 3313
D=M // 3314
@SP // 3315
AM=M+1 // 3316
A=A-1 // 3317
M=D // 3318
@LCL // 3319
D=M // 3320
@8 // 3321
A=D+A // 3322
D=M // 3323
D=D+M // 3324
@SP // 3325
AM=M-1 // 3326
D=D+M // 3327
@SP // 3328
AM=M+1 // 3329
A=A-1 // 3330
M=D // 3331
@LCL // 3332
A=M+1 // 3333
D=M // 3334
@SP // 3335
AM=M+1 // 3336
A=A-1 // 3337
M=D // 3338
@LCL // 3339
D=M // 3340
@8 // 3341
A=D+A // 3342
D=M // 3343
@SP // 3344
AM=M-1 // 3345
A=D+M // 3346
D=M // 3347
@15 // 3348
D=D&A // 3349
@SP // 3350
AM=M-1 // 3351
A=M // 3352
M=D // 3353

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
@LCL // 3354
A=M+1 // 3355
A=A+1 // 3356
A=A+1 // 3357
D=M // 3358
@SP // 3359
AM=M+1 // 3360
A=A-1 // 3361
M=D // 3362
@LCL // 3363
D=M // 3364
@8 // 3365
A=D+A // 3366
D=M // 3367
D=D+M // 3368
D=D+1 // 3369
@SP // 3370
AM=M-1 // 3371
D=D+M // 3372
@SP // 3373
AM=M+1 // 3374
A=A-1 // 3375
M=D // 3376
@LCL // 3377
A=M+1 // 3378
D=M // 3379
@SP // 3380
AM=M+1 // 3381
A=A-1 // 3382
M=D // 3383
@LCL // 3384
D=M // 3385
@8 // 3386
A=D+A // 3387
D=M // 3388
@SP // 3389
AM=M-1 // 3390
A=D+M // 3391
D=M // 3392
@SP // 3393
AM=M+1 // 3394
A=A-1 // 3395
M=D // 3396
@4 // 3397
D=A // 3398
@SP // 3399
AM=M+1 // 3400
A=A-1 // 3401
M=D // 3402
// call Int32.arith_rightshift
@7 // 3403
D=A // 3404
@14 // 3405
M=D // 3406
@Int32.arith_rightshift // 3407
D=A // 3408
@13 // 3409
M=D // 3410
@Int32.do_mul_right_shift_bytes.ret.15 // 3411
D=A // 3412
@CALL // 3413
0;JMP // 3414
(Int32.do_mul_right_shift_bytes.ret.15)
@SP // 3415
AM=M-1 // 3416
D=M // 3417
@SP // 3418
AM=M-1 // 3419
A=M // 3420
M=D // 3421

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

@LCL // 3422
D=M // 3423
@8 // 3424
A=D+A // 3425
M=M+1 // 3426

////GotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP1}
// goto Int32.do_mul_right_shift_bytes_WHILE_EXP1
@Int32.do_mul_right_shift_bytes_WHILE_EXP1 // 3427
0;JMP // 3428

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END1}
// label Int32.do_mul_right_shift_bytes_WHILE_END1
(Int32.do_mul_right_shift_bytes_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 3")], call=CallInstruction{Int32.u4_array_mul_u4_array}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 3429
A=M+1 // 3430
A=A+1 // 3431
D=M // 3432
@SP // 3433
AM=M+1 // 3434
A=A-1 // 3435
M=D // 3436
@LCL // 3437
A=M+1 // 3438
A=A+1 // 3439
A=A+1 // 3440
D=M // 3441
@SP // 3442
AM=M+1 // 3443
A=A-1 // 3444
M=D // 3445
// call Int32.u4_array_mul_u4_array
@7 // 3446
D=A // 3447
@14 // 3448
M=D // 3449
@Int32.u4_array_mul_u4_array // 3450
D=A // 3451
@13 // 3452
M=D // 3453
@Int32.do_mul_right_shift_bytes.ret.16 // 3454
D=A // 3455
@CALL // 3456
0;JMP // 3457
(Int32.do_mul_right_shift_bytes.ret.16)
@LCL // 3458
D=M // 3459
@4 // 3460
A=D+A // 3461
D=A // 3462
@R13 // 3463
M=D // 3464
@SP // 3465
AM=M-1 // 3466
D=M // 3467
@R13 // 3468
A=M // 3469
M=D // 3470

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

@ARG // 3471
A=M+1 // 3472
A=A+1 // 3473
D=M // 3474
D=D+M // 3475
@SP // 3476
AM=M+1 // 3477
A=A-1 // 3478
M=D // 3479
@LCL // 3480
D=M // 3481
@9 // 3482
A=D+A // 3483
D=A // 3484
@R13 // 3485
M=D // 3486
@SP // 3487
AM=M-1 // 3488
D=M // 3489
@R13 // 3490
A=M // 3491
M=D // 3492

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 8}
//}

@LCL // 3493
D=M // 3494
@8 // 3495
A=D+A // 3496
M=0 // 3497

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
@Int32.do_mul_right_shift_bytes.LT.20 // 3498
D=A // 3499
@SP // 3500
AM=M+1 // 3501
A=A-1 // 3502
M=D // 3503
@LCL // 3504
D=M // 3505
@8 // 3506
A=D+A // 3507
D=M // 3508
@4 // 3509
D=D-A // 3510
@DO_LT // 3511
0;JMP // 3512
(Int32.do_mul_right_shift_bytes.LT.20)
D=!D // 3513
@Int32.do_mul_right_shift_bytes_WHILE_END2 // 3514
D;JNE // 3515

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
@THIS // 3516
A=M // 3517
D=M // 3518
@SP // 3519
AM=M+1 // 3520
A=A-1 // 3521
M=D // 3522
@LCL // 3523
D=M // 3524
@8 // 3525
A=D+A // 3526
D=M // 3527
@SP // 3528
AM=M-1 // 3529
D=D+M // 3530
@SP // 3531
AM=M+1 // 3532
A=A-1 // 3533
M=D // 3534
@RETURN_PUSH_LABEL_4 // 3535
D=A // 3536
@13 // 3537
M=D // 3538
@4 // 3539
D=A // 3540
@LCL_PUSH // 3541
0;JMP // 3542
(RETURN_PUSH_LABEL_4)
@LCL // 3543
D=M // 3544
@9 // 3545
A=D+A // 3546
D=M // 3547
A=A-1 // 3548
D=D+M // 3549
@SP // 3550
AM=M+1 // 3551
A=A-1 // 3552
M=D // 3553
@LCL // 3554
D=M // 3555
@8 // 3556
A=D+A // 3557
D=M // 3558
@SP // 3559
AM=M-1 // 3560
D=D+M // 3561
@SP // 3562
AM=M-1 // 3563
A=D+M // 3564
D=M // 3565
@SP // 3566
AM=M+1 // 3567
A=A-1 // 3568
M=D // 3569
@RETURN_PUSH_LABEL_5 // 3570
D=A // 3571
@13 // 3572
M=D // 3573
@4 // 3574
D=A // 3575
@LCL_PUSH // 3576
0;JMP // 3577
(RETURN_PUSH_LABEL_5)
@LCL // 3578
D=M // 3579
@9 // 3580
A=D+A // 3581
D=M // 3582
A=A-1 // 3583
D=D+M // 3584
@SP // 3585
AM=M+1 // 3586
A=A-1 // 3587
M=D // 3588
@LCL // 3589
D=M // 3590
@8 // 3591
A=D+A // 3592
D=M // 3593
@SP // 3594
AM=M-1 // 3595
D=D+M // 3596
D=D+1 // 3597
@SP // 3598
AM=M-1 // 3599
A=D+M // 3600
D=M // 3601
@SP // 3602
AM=M-1 // 3603
D=D+M // 3604
@SP // 3605
AM=M+1 // 3606
A=A-1 // 3607
M=D // 3608
@16 // 3609
D=A // 3610
@SP // 3611
AM=M+1 // 3612
A=A-1 // 3613
M=D // 3614
// call Math.multiply
@7 // 3615
D=A // 3616
@14 // 3617
M=D // 3618
@Math.multiply // 3619
D=A // 3620
@13 // 3621
M=D // 3622
@Int32.do_mul_right_shift_bytes.ret.17 // 3623
D=A // 3624
@CALL // 3625
0;JMP // 3626
(Int32.do_mul_right_shift_bytes.ret.17)
@SP // 3627
AM=M-1 // 3628
D=M // 3629
@SP // 3630
AM=M-1 // 3631
A=M // 3632
M=D // 3633

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

@LCL // 3634
D=M // 3635
@8 // 3636
A=D+A // 3637
M=M+1 // 3638

////GotoInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_EXP2}
// goto Int32.do_mul_right_shift_bytes_WHILE_EXP2
@Int32.do_mul_right_shift_bytes_WHILE_EXP2 // 3639
0;JMP // 3640

////LabelInstruction{label='Int32.do_mul_right_shift_bytes_WHILE_END2}
// label Int32.do_mul_right_shift_bytes_WHILE_END2
(Int32.do_mul_right_shift_bytes_WHILE_END2)

////ConditionalGroup{push=PushInstruction("local 7"), ifGoto=IfGotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE3}}
@LCL // 3641
D=M // 3642
@7 // 3643
A=D+A // 3644
D=M // 3645
@Int32.do_mul_right_shift_bytes$IF_TRUE3 // 3646
D;JNE // 3647

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END3}
// goto Int32.do_mul_right_shift_bytes$IF_END3
@Int32.do_mul_right_shift_bytes$IF_END3 // 3648
0;JMP // 3649

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE3}
// label Int32.do_mul_right_shift_bytes$IF_TRUE3
(Int32.do_mul_right_shift_bytes$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 3650
D=M // 3651
@SP // 3652
AM=M+1 // 3653
A=A-1 // 3654
M=D // 3655
// call Int32.do_neg
@6 // 3656
D=A // 3657
@14 // 3658
M=D // 3659
@Int32.do_neg // 3660
D=A // 3661
@13 // 3662
M=D // 3663
@Int32.do_mul_right_shift_bytes.ret.18 // 3664
D=A // 3665
@CALL // 3666
0;JMP // 3667
(Int32.do_mul_right_shift_bytes.ret.18)
@SP // 3668
M=M-1 // 3669

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
@Int32.do_mul_right_shift_bytes.EQ.21 // 3670
D=A // 3671
@SP // 3672
AM=M+1 // 3673
A=A-1 // 3674
M=D // 3675
@LCL // 3676
D=M // 3677
@5 // 3678
A=D+A // 3679
D=M // 3680
@DO_EQ // 3681
0;JMP // 3682
(Int32.do_mul_right_shift_bytes.EQ.21)
D=!D // 3683
@Int32.do_mul_right_shift_bytes$IF_TRUE4 // 3684
D;JNE // 3685

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END4}
// goto Int32.do_mul_right_shift_bytes$IF_END4
@Int32.do_mul_right_shift_bytes$IF_END4 // 3686
0;JMP // 3687

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE4}
// label Int32.do_mul_right_shift_bytes$IF_TRUE4
(Int32.do_mul_right_shift_bytes$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_6 // 3688
D=A // 3689
@13 // 3690
M=D // 3691
@5 // 3692
D=A // 3693
@LCL_PUSH // 3694
0;JMP // 3695
(RETURN_PUSH_LABEL_6)
// call Int32.dispose
@6 // 3696
D=A // 3697
@14 // 3698
M=D // 3699
@Int32.dispose // 3700
D=A // 3701
@13 // 3702
M=D // 3703
@Int32.do_mul_right_shift_bytes.ret.19 // 3704
D=A // 3705
@CALL // 3706
0;JMP // 3707
(Int32.do_mul_right_shift_bytes.ret.19)
@SP // 3708
M=M-1 // 3709

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
@Int32.do_mul_right_shift_bytes.EQ.22 // 3710
D=A // 3711
@SP // 3712
AM=M+1 // 3713
A=A-1 // 3714
M=D // 3715
@LCL // 3716
D=M // 3717
@6 // 3718
A=D+A // 3719
D=M // 3720
@DO_EQ // 3721
0;JMP // 3722
(Int32.do_mul_right_shift_bytes.EQ.22)
D=!D // 3723
@Int32.do_mul_right_shift_bytes$IF_TRUE5 // 3724
D;JNE // 3725

////GotoInstruction{label='Int32.do_mul_right_shift_bytes$IF_END5}
// goto Int32.do_mul_right_shift_bytes$IF_END5
@Int32.do_mul_right_shift_bytes$IF_END5 // 3726
0;JMP // 3727

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_TRUE5}
// label Int32.do_mul_right_shift_bytes$IF_TRUE5
(Int32.do_mul_right_shift_bytes$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_7 // 3728
D=A // 3729
@13 // 3730
M=D // 3731
@6 // 3732
D=A // 3733
@LCL_PUSH // 3734
0;JMP // 3735
(RETURN_PUSH_LABEL_7)
// call Int32.dispose
@6 // 3736
D=A // 3737
@14 // 3738
M=D // 3739
@Int32.dispose // 3740
D=A // 3741
@13 // 3742
M=D // 3743
@Int32.do_mul_right_shift_bytes.ret.20 // 3744
D=A // 3745
@CALL // 3746
0;JMP // 3747
(Int32.do_mul_right_shift_bytes.ret.20)
@SP // 3748
M=M-1 // 3749

////LabelInstruction{label='Int32.do_mul_right_shift_bytes$IF_END5}
// label Int32.do_mul_right_shift_bytes$IF_END5
(Int32.do_mul_right_shift_bytes$IF_END5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3750
A=M+1 // 3751
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
@Int32.do_mul_right_shift_bytes.ret.21 // 3766
D=A // 3767
@CALL // 3768
0;JMP // 3769
(Int32.do_mul_right_shift_bytes.ret.21)
@SP // 3770
M=M-1 // 3771

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3772
A=M+1 // 3773
A=A+1 // 3774
A=A+1 // 3775
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
@Int32.do_mul_right_shift_bytes.ret.22 // 3789
D=A // 3790
@CALL // 3791
0;JMP // 3792
(Int32.do_mul_right_shift_bytes.ret.22)
@SP // 3793
M=M-1 // 3794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_8 // 3795
D=A // 3796
@13 // 3797
M=D // 3798
@4 // 3799
D=A // 3800
@LCL_PUSH // 3801
0;JMP // 3802
(RETURN_PUSH_LABEL_8)
// call Memory.deAlloc
@6 // 3803
D=A // 3804
@14 // 3805
M=D // 3806
@Memory.deAlloc // 3807
D=A // 3808
@13 // 3809
M=D // 3810
@Int32.do_mul_right_shift_bytes.ret.23 // 3811
D=A // 3812
@CALL // 3813
0;JMP // 3814
(Int32.do_mul_right_shift_bytes.ret.23)
@SP // 3815
M=M-1 // 3816

////PushInstruction("constant 0")
@SP // 3817
AM=M+1 // 3818
A=A-1 // 3819
M=0 // 3820
@RETURN // 3821
0;JMP // 3822

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 3823
@Sys.halt_WHILE_END1 // 3824
D;JNE // 3825

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 3826
0;JMP // 3827

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3828
AM=M+1 // 3829
A=A-1 // 3830
M=0 // 3831
@RETURN // 3832
0;JMP // 3833

////FunctionInstruction{functionName='Vec3.clone', numLocals=0, funcMapping={Vec3.do_add=6}}
// function Vec3.clone with 0
(Vec3.clone)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3834
A=M // 3835
D=M // 3836
@3 // 3837
M=D // 3838

////CallGroup{pushes=[CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}, CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}, CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}], call=CallInstruction{Vec3.new}}
@THIS // 3839
A=M // 3840
D=M // 3841
@SP // 3842
AM=M+1 // 3843
A=A-1 // 3844
M=D // 3845
// call Number.clone
@6 // 3846
D=A // 3847
@14 // 3848
M=D // 3849
@Number.clone // 3850
D=A // 3851
@13 // 3852
M=D // 3853
@Vec3.clone.ret.0 // 3854
D=A // 3855
@CALL // 3856
0;JMP // 3857
(Vec3.clone.ret.0)
@THIS // 3858
A=M+1 // 3859
D=M // 3860
@SP // 3861
AM=M+1 // 3862
A=A-1 // 3863
M=D // 3864
// call Number.clone
@6 // 3865
D=A // 3866
@14 // 3867
M=D // 3868
@Number.clone // 3869
D=A // 3870
@13 // 3871
M=D // 3872
@Vec3.clone.ret.1 // 3873
D=A // 3874
@CALL // 3875
0;JMP // 3876
(Vec3.clone.ret.1)
@THIS // 3877
A=M+1 // 3878
A=A+1 // 3879
D=M // 3880
@SP // 3881
AM=M+1 // 3882
A=A-1 // 3883
M=D // 3884
// call Number.clone
@6 // 3885
D=A // 3886
@14 // 3887
M=D // 3888
@Number.clone // 3889
D=A // 3890
@13 // 3891
M=D // 3892
@Vec3.clone.ret.2 // 3893
D=A // 3894
@CALL // 3895
0;JMP // 3896
(Vec3.clone.ret.2)
// call Vec3.new
@8 // 3897
D=A // 3898
@14 // 3899
M=D // 3900
@Vec3.new // 3901
D=A // 3902
@13 // 3903
M=D // 3904
@Vec3.clone.ret.3 // 3905
D=A // 3906
@CALL // 3907
0;JMP // 3908
(Vec3.clone.ret.3)
@RETURN // 3909
0;JMP // 3910

////FunctionInstruction{functionName='Element.color', numLocals=0, funcMapping={}}
// function Element.color with 0
(Element.color)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3911
A=M // 3912
D=M // 3913
@3 // 3914
M=D // 3915

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.color$IF_TRUE1}}
@THIS // 3916
A=M // 3917
D=M // 3918
@Element.color$IF_TRUE1 // 3919
D;JNE // 3920

////GotoInstruction{label='Element.color$IF_END1}
// goto Element.color$IF_END1
@Element.color$IF_END1 // 3921
0;JMP // 3922

////LabelInstruction{label='Element.color$IF_TRUE1}
// label Element.color$IF_TRUE1
(Element.color$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Plane.color}}
@THIS // 3923
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
AM=M+1 // 3934
A=A-1 // 3935
M=D // 3936
// call Plane.color
@7 // 3937
D=A // 3938
@14 // 3939
M=D // 3940
@Plane.color // 3941
D=A // 3942
@13 // 3943
M=D // 3944
@Element.color.ret.0 // 3945
D=A // 3946
@CALL // 3947
0;JMP // 3948
(Element.color.ret.0)
@RETURN // 3949
0;JMP // 3950

////LabelInstruction{label='Element.color$IF_END1}
// label Element.color$IF_END1
(Element.color$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.color$IF_TRUE2}}
@THIS // 3951
A=M+1 // 3952
D=M // 3953
@Element.color$IF_TRUE2 // 3954
D;JNE // 3955

////GotoInstruction{label='Element.color$IF_END2}
// goto Element.color$IF_END2
@Element.color$IF_END2 // 3956
0;JMP // 3957

////LabelInstruction{label='Element.color$IF_TRUE2}
// label Element.color$IF_TRUE2
(Element.color$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Sphere.color}}
@THIS // 3958
A=M+1 // 3959
D=M // 3960
@SP // 3961
AM=M+1 // 3962
A=A-1 // 3963
M=D // 3964
// call Sphere.color
@6 // 3965
D=A // 3966
@14 // 3967
M=D // 3968
@Sphere.color // 3969
D=A // 3970
@13 // 3971
M=D // 3972
@Element.color.ret.1 // 3973
D=A // 3974
@CALL // 3975
0;JMP // 3976
(Element.color.ret.1)
@RETURN // 3977
0;JMP // 3978

////LabelInstruction{label='Element.color$IF_END2}
// label Element.color$IF_END2
(Element.color$IF_END2)

////PushInstruction("constant 0")
@SP // 3979
AM=M+1 // 3980
A=A-1 // 3981
M=0 // 3982
@RETURN // 3983
0;JMP // 3984

////FunctionInstruction{functionName='Number.do_neg', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5}}
// function Number.do_neg with 0
(Number.do_neg)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3985
A=M // 3986
D=M // 3987
@3 // 3988
M=D // 3989

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 3990
A=M // 3991
D=M // 3992
@SP // 3993
AM=M+1 // 3994
A=A-1 // 3995
M=D // 3996
// call Int32.do_neg
@6 // 3997
D=A // 3998
@14 // 3999
M=D // 4000
@Int32.do_neg // 4001
D=A // 4002
@13 // 4003
M=D // 4004
@Number.do_neg.ret.0 // 4005
D=A // 4006
@CALL // 4007
0;JMP // 4008
(Number.do_neg.ret.0)
@SP // 4009
M=M-1 // 4010

////PushInstruction("constant 0")
@SP // 4011
AM=M+1 // 4012
A=A-1 // 4013
M=0 // 4014
@RETURN // 4015
0;JMP // 4016

////FunctionInstruction{functionName='Plane.color', numLocals=8, funcMapping={Plane.initialize=16, Plane.new=1}}
// function Plane.color with 8
(Plane.color)
@8 // 4017
D=A // 4018
@SP // 4019
AM=D+M // 4020
A=A-1 // 4021
M=0 // 4022
A=A-1 // 4023
M=0 // 4024
A=A-1 // 4025
M=0 // 4026
A=A-1 // 4027
M=0 // 4028
A=A-1 // 4029
M=0 // 4030
A=A-1 // 4031
M=0 // 4032
A=A-1 // 4033
M=0 // 4034
A=A-1 // 4035
M=0 // 4036

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 4037
A=M // 4038
D=M // 4039
@3 // 4040
M=D // 4041

////ConditionalGroup{push=PushInstruction("this 3"), ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE1}}
@THIS // 4042
A=M+1 // 4043
A=A+1 // 4044
A=A+1 // 4045
D=M // 4046
@Plane.color$IF_TRUE1 // 4047
D;JNE // 4048

////GotoInstruction{label='Plane.color$IF_FALSE1}
// goto Plane.color$IF_FALSE1
@Plane.color$IF_FALSE1 // 4049
0;JMP // 4050

////LabelInstruction{label='Plane.color$IF_TRUE1}
// label Plane.color$IF_TRUE1
(Plane.color$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 4051
A=M+1 // 4052
D=M // 4053
@SP // 4054
AM=M+1 // 4055
A=A-1 // 4056
M=D // 4057
// call Vec3.clone
@6 // 4058
D=A // 4059
@14 // 4060
M=D // 4061
@Vec3.clone // 4062
D=A // 4063
@13 // 4064
M=D // 4065
@Plane.color.ret.0 // 4066
D=A // 4067
@CALL // 4068
0;JMP // 4069
(Plane.color.ret.0)
@SP // 4070
AM=M-1 // 4071
D=M // 4072
@LCL // 4073
A=M // 4074
M=D // 4075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("static 0")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4076
A=M // 4077
D=M // 4078
@SP // 4079
AM=M+1 // 4080
A=A-1 // 4081
M=D // 4082
@Plane.0 // 4083
D=M // 4084
@SP // 4085
AM=M+1 // 4086
A=A-1 // 4087
M=D // 4088
// call Vec3.do_cross
@7 // 4089
D=A // 4090
@14 // 4091
M=D // 4092
@Vec3.do_cross // 4093
D=A // 4094
@13 // 4095
M=D // 4096
@Plane.color.ret.1 // 4097
D=A // 4098
@CALL // 4099
0;JMP // 4100
(Plane.color.ret.1)
@SP // 4101
M=M-1 // 4102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dist_sq}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4103
A=M // 4104
D=M // 4105
@SP // 4106
AM=M+1 // 4107
A=A-1 // 4108
M=D // 4109
// call Vec3.dist_sq
@6 // 4110
D=A // 4111
@14 // 4112
M=D // 4113
@Vec3.dist_sq // 4114
D=A // 4115
@13 // 4116
M=D // 4117
@Plane.color.ret.2 // 4118
D=A // 4119
@CALL // 4120
0;JMP // 4121
(Plane.color.ret.2)
@SP // 4122
AM=M-1 // 4123
D=M // 4124
@LCL // 4125
A=M+1 // 4126
A=A+1 // 4127
M=D // 4128

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.is_zero}}, ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE2}}
@LCL // 4129
A=M+1 // 4130
A=A+1 // 4131
D=M // 4132
@SP // 4133
AM=M+1 // 4134
A=A-1 // 4135
M=D // 4136
// call Number.is_zero
@6 // 4137
D=A // 4138
@14 // 4139
M=D // 4140
@Number.is_zero // 4141
D=A // 4142
@13 // 4143
M=D // 4144
@Plane.color.ret.3 // 4145
D=A // 4146
@CALL // 4147
0;JMP // 4148
(Plane.color.ret.3)
@SP // 4149
AM=M-1 // 4150
D=M // 4151
@Plane.color$IF_TRUE2 // 4152
D;JNE // 4153

////GotoInstruction{label='Plane.color$IF_END2}
// goto Plane.color$IF_END2
@Plane.color$IF_END2 // 4154
0;JMP // 4155

////LabelInstruction{label='Plane.color$IF_TRUE2}
// label Plane.color$IF_TRUE2
(Plane.color$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4156
A=M // 4157
D=M // 4158
@SP // 4159
AM=M+1 // 4160
A=A-1 // 4161
M=D // 4162
// call Vec3.dispose
@6 // 4163
D=A // 4164
@14 // 4165
M=D // 4166
@Vec3.dispose // 4167
D=A // 4168
@13 // 4169
M=D // 4170
@Plane.color.ret.4 // 4171
D=A // 4172
@CALL // 4173
0;JMP // 4174
(Plane.color.ret.4)
@SP // 4175
M=M-1 // 4176

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 4177
A=M+1 // 4178
D=M // 4179
@SP // 4180
AM=M+1 // 4181
A=A-1 // 4182
M=D // 4183
// call Vec3.clone
@6 // 4184
D=A // 4185
@14 // 4186
M=D // 4187
@Vec3.clone // 4188
D=A // 4189
@13 // 4190
M=D // 4191
@Plane.color.ret.5 // 4192
D=A // 4193
@CALL // 4194
0;JMP // 4195
(Plane.color.ret.5)
@SP // 4196
AM=M-1 // 4197
D=M // 4198
@LCL // 4199
A=M // 4200
M=D // 4201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("static 1")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4202
A=M // 4203
D=M // 4204
@SP // 4205
AM=M+1 // 4206
A=A-1 // 4207
M=D // 4208
@Plane.1 // 4209
D=M // 4210
@SP // 4211
AM=M+1 // 4212
A=A-1 // 4213
M=D // 4214
// call Vec3.do_cross
@7 // 4215
D=A // 4216
@14 // 4217
M=D // 4218
@Vec3.do_cross // 4219
D=A // 4220
@13 // 4221
M=D // 4222
@Plane.color.ret.6 // 4223
D=A // 4224
@CALL // 4225
0;JMP // 4226
(Plane.color.ret.6)
@SP // 4227
M=M-1 // 4228

////LabelInstruction{label='Plane.color$IF_END2}
// label Plane.color$IF_END2
(Plane.color$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 4229
A=M+1 // 4230
D=M // 4231
@SP // 4232
AM=M+1 // 4233
A=A-1 // 4234
M=D // 4235
// call Vec3.clone
@6 // 4236
D=A // 4237
@14 // 4238
M=D // 4239
@Vec3.clone // 4240
D=A // 4241
@13 // 4242
M=D // 4243
@Plane.color.ret.7 // 4244
D=A // 4245
@CALL // 4246
0;JMP // 4247
(Plane.color.ret.7)
@SP // 4248
AM=M-1 // 4249
D=M // 4250
@LCL // 4251
A=M+1 // 4252
M=D // 4253

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_cross}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4254
A=M+1 // 4255
D=M // 4256
@SP // 4257
AM=M+1 // 4258
A=A-1 // 4259
M=D // 4260
@LCL // 4261
A=M // 4262
D=M // 4263
@SP // 4264
AM=M+1 // 4265
A=A-1 // 4266
M=D // 4267
// call Vec3.do_cross
@7 // 4268
D=A // 4269
@14 // 4270
M=D // 4271
@Vec3.do_cross // 4272
D=A // 4273
@13 // 4274
M=D // 4275
@Plane.color.ret.8 // 4276
D=A // 4277
@CALL // 4278
0;JMP // 4279
(Plane.color.ret.8)
@SP // 4280
M=M-1 // 4281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 4282
A=M+1 // 4283
D=M // 4284
@SP // 4285
AM=M+1 // 4286
A=A-1 // 4287
M=D // 4288
@LCL // 4289
A=M // 4290
D=M // 4291
@SP // 4292
AM=M+1 // 4293
A=A-1 // 4294
M=D // 4295
// call Vec3.dot
@7 // 4296
D=A // 4297
@14 // 4298
M=D // 4299
@Vec3.dot // 4300
D=A // 4301
@13 // 4302
M=D // 4303
@Plane.color.ret.9 // 4304
D=A // 4305
@CALL // 4306
0;JMP // 4307
(Plane.color.ret.9)
@SP // 4308
AM=M-1 // 4309
D=M // 4310
@LCL // 4311
A=M+1 // 4312
A=A+1 // 4313
A=A+1 // 4314
M=D // 4315

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 3")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4316
A=M+1 // 4317
A=A+1 // 4318
A=A+1 // 4319
D=M // 4320
@SP // 4321
AM=M+1 // 4322
A=A-1 // 4323
M=D // 4324
@Plane.3 // 4325
D=M // 4326
@SP // 4327
AM=M+1 // 4328
A=A-1 // 4329
M=D // 4330
// call Number.do_mul
@7 // 4331
D=A // 4332
@14 // 4333
M=D // 4334
@Number.do_mul // 4335
D=A // 4336
@13 // 4337
M=D // 4338
@Plane.color.ret.10 // 4339
D=A // 4340
@CALL // 4341
0;JMP // 4342
(Plane.color.ret.10)
@SP // 4343
M=M-1 // 4344

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4345
A=M+1 // 4346
A=A+1 // 4347
A=A+1 // 4348
D=M // 4349
@SP // 4350
AM=M+1 // 4351
A=A-1 // 4352
M=D // 4353
@Plane.2 // 4354
D=M // 4355
@SP // 4356
AM=M+1 // 4357
A=A-1 // 4358
M=D // 4359
// call Number.do_add
@7 // 4360
D=A // 4361
@14 // 4362
M=D // 4363
@Number.do_add // 4364
D=A // 4365
@13 // 4366
M=D // 4367
@Plane.color.ret.11 // 4368
D=A // 4369
@CALL // 4370
0;JMP // 4371
(Plane.color.ret.11)
@SP // 4372
M=M-1 // 4373

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.to_int32}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 4374
A=M+1 // 4375
A=A+1 // 4376
A=A+1 // 4377
D=M // 4378
@SP // 4379
AM=M+1 // 4380
A=A-1 // 4381
M=D // 4382
// call Number.to_int32
@6 // 4383
D=A // 4384
@14 // 4385
M=D // 4386
@Number.to_int32 // 4387
D=A // 4388
@13 // 4389
M=D // 4390
@Plane.color.ret.12 // 4391
D=A // 4392
@CALL // 4393
0;JMP // 4394
(Plane.color.ret.12)
@LCL // 4395
D=M // 4396
@4 // 4397
A=D+A // 4398
D=A // 4399
@R13 // 4400
M=D // 4401
@SP // 4402
AM=M-1 // 4403
D=M // 4404
@R13 // 4405
A=M // 4406
M=D // 4407

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("local 1")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 4408
A=M+1 // 4409
D=M // 4410
@SP // 4411
AM=M+1 // 4412
A=A-1 // 4413
M=D // 4414
@LCL // 4415
A=M+1 // 4416
D=M // 4417
@SP // 4418
AM=M+1 // 4419
A=A-1 // 4420
M=D // 4421
// call Vec3.dot
@7 // 4422
D=A // 4423
@14 // 4424
M=D // 4425
@Vec3.dot // 4426
D=A // 4427
@13 // 4428
M=D // 4429
@Plane.color.ret.13 // 4430
D=A // 4431
@CALL // 4432
0;JMP // 4433
(Plane.color.ret.13)
@SP // 4434
AM=M-1 // 4435
D=M // 4436
@LCL // 4437
A=M+1 // 4438
A=A+1 // 4439
A=A+1 // 4440
M=D // 4441

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 3")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4442
A=M+1 // 4443
A=A+1 // 4444
A=A+1 // 4445
D=M // 4446
@SP // 4447
AM=M+1 // 4448
A=A-1 // 4449
M=D // 4450
@Plane.3 // 4451
D=M // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
// call Number.do_mul
@7 // 4457
D=A // 4458
@14 // 4459
M=D // 4460
@Number.do_mul // 4461
D=A // 4462
@13 // 4463
M=D // 4464
@Plane.color.ret.14 // 4465
D=A // 4466
@CALL // 4467
0;JMP // 4468
(Plane.color.ret.14)
@SP // 4469
M=M-1 // 4470

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("static 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4471
A=M+1 // 4472
A=A+1 // 4473
A=A+1 // 4474
D=M // 4475
@SP // 4476
AM=M+1 // 4477
A=A-1 // 4478
M=D // 4479
@Plane.2 // 4480
D=M // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=D // 4485
// call Number.do_add
@7 // 4486
D=A // 4487
@14 // 4488
M=D // 4489
@Number.do_add // 4490
D=A // 4491
@13 // 4492
M=D // 4493
@Plane.color.ret.15 // 4494
D=A // 4495
@CALL // 4496
0;JMP // 4497
(Plane.color.ret.15)
@SP // 4498
M=M-1 // 4499

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.to_int32}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 4500
A=M+1 // 4501
A=A+1 // 4502
A=A+1 // 4503
D=M // 4504
@SP // 4505
AM=M+1 // 4506
A=A-1 // 4507
M=D // 4508
// call Number.to_int32
@6 // 4509
D=A // 4510
@14 // 4511
M=D // 4512
@Number.to_int32 // 4513
D=A // 4514
@13 // 4515
M=D // 4516
@Plane.color.ret.16 // 4517
D=A // 4518
@CALL // 4519
0;JMP // 4520
(Plane.color.ret.16)
@LCL // 4521
D=M // 4522
@5 // 4523
A=D+A // 4524
D=A // 4525
@R13 // 4526
M=D // 4527
@SP // 4528
AM=M-1 // 4529
D=M // 4530
@R13 // 4531
A=M // 4532
M=D // 4533

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@RETURN_PUSH_LABEL_9 // 4534
D=A // 4535
@13 // 4536
M=D // 4537
@4 // 4538
D=A // 4539
@LCL_PUSH // 4540
0;JMP // 4541
(RETURN_PUSH_LABEL_9)
// call Int32.clone
@6 // 4542
D=A // 4543
@14 // 4544
M=D // 4545
@Int32.clone // 4546
D=A // 4547
@13 // 4548
M=D // 4549
@Plane.color.ret.17 // 4550
D=A // 4551
@CALL // 4552
0;JMP // 4553
(Plane.color.ret.17)
@LCL // 4554
D=M // 4555
@6 // 4556
A=D+A // 4557
D=A // 4558
@R13 // 4559
M=D // 4560
@SP // 4561
AM=M-1 // 4562
D=M // 4563
@R13 // 4564
A=M // 4565
M=D // 4566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 5")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_10 // 4567
D=A // 4568
@13 // 4569
M=D // 4570
@6 // 4571
D=A // 4572
@LCL_PUSH // 4573
0;JMP // 4574
(RETURN_PUSH_LABEL_10)
@RETURN_PUSH_LABEL_11 // 4575
D=A // 4576
@13 // 4577
M=D // 4578
@5 // 4579
D=A // 4580
@LCL_PUSH // 4581
0;JMP // 4582
(RETURN_PUSH_LABEL_11)
// call Int32.do_add
@7 // 4583
D=A // 4584
@14 // 4585
M=D // 4586
@Int32.do_add // 4587
D=A // 4588
@13 // 4589
M=D // 4590
@Plane.color.ret.18 // 4591
D=A // 4592
@CALL // 4593
0;JMP // 4594
(Plane.color.ret.18)
@SP // 4595
M=M-1 // 4596

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.is_even}}, ifGoto=IfGotoInstruction{label='Plane.color$IF_TRUE3}}
@RETURN_PUSH_LABEL_12 // 4597
D=A // 4598
@13 // 4599
M=D // 4600
@6 // 4601
D=A // 4602
@LCL_PUSH // 4603
0;JMP // 4604
(RETURN_PUSH_LABEL_12)
// call Int32.is_even
@6 // 4605
D=A // 4606
@14 // 4607
M=D // 4608
@Int32.is_even // 4609
D=A // 4610
@13 // 4611
M=D // 4612
@Plane.color.ret.19 // 4613
D=A // 4614
@CALL // 4615
0;JMP // 4616
(Plane.color.ret.19)
@SP // 4617
AM=M-1 // 4618
D=M // 4619
@Plane.color$IF_TRUE3 // 4620
D;JNE // 4621

////GotoInstruction{label='Plane.color$IF_FALSE3}
// goto Plane.color$IF_FALSE3
@Plane.color$IF_FALSE3 // 4622
0;JMP // 4623

////LabelInstruction{label='Plane.color$IF_TRUE3}
// label Plane.color$IF_TRUE3
(Plane.color$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 4")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@Plane.4 // 4624
D=M // 4625
@SP // 4626
AM=M+1 // 4627
A=A-1 // 4628
M=D // 4629
// call Number.clone
@6 // 4630
D=A // 4631
@14 // 4632
M=D // 4633
@Number.clone // 4634
D=A // 4635
@13 // 4636
M=D // 4637
@Plane.color.ret.20 // 4638
D=A // 4639
@CALL // 4640
0;JMP // 4641
(Plane.color.ret.20)
@LCL // 4642
D=M // 4643
@7 // 4644
A=D+A // 4645
D=A // 4646
@R13 // 4647
M=D // 4648
@SP // 4649
AM=M-1 // 4650
D=M // 4651
@R13 // 4652
A=M // 4653
M=D // 4654

////GotoInstruction{label='Plane.color$IF_END3}
// goto Plane.color$IF_END3
@Plane.color$IF_END3 // 4655
0;JMP // 4656

////LabelInstruction{label='Plane.color$IF_FALSE3}
// label Plane.color$IF_FALSE3
(Plane.color$IF_FALSE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 5")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@Plane.5 // 4657
D=M // 4658
@SP // 4659
AM=M+1 // 4660
A=A-1 // 4661
M=D // 4662
// call Number.clone
@6 // 4663
D=A // 4664
@14 // 4665
M=D // 4666
@Number.clone // 4667
D=A // 4668
@13 // 4669
M=D // 4670
@Plane.color.ret.21 // 4671
D=A // 4672
@CALL // 4673
0;JMP // 4674
(Plane.color.ret.21)
@LCL // 4675
D=M // 4676
@7 // 4677
A=D+A // 4678
D=A // 4679
@R13 // 4680
M=D // 4681
@SP // 4682
AM=M-1 // 4683
D=M // 4684
@R13 // 4685
A=M // 4686
M=D // 4687

////LabelInstruction{label='Plane.color$IF_END3}
// label Plane.color$IF_END3
(Plane.color$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4688
A=M // 4689
D=M // 4690
@SP // 4691
AM=M+1 // 4692
A=A-1 // 4693
M=D // 4694
// call Vec3.dispose
@6 // 4695
D=A // 4696
@14 // 4697
M=D // 4698
@Vec3.dispose // 4699
D=A // 4700
@13 // 4701
M=D // 4702
@Plane.color.ret.22 // 4703
D=A // 4704
@CALL // 4705
0;JMP // 4706
(Plane.color.ret.22)
@SP // 4707
M=M-1 // 4708

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4709
A=M+1 // 4710
D=M // 4711
@SP // 4712
AM=M+1 // 4713
A=A-1 // 4714
M=D // 4715
// call Vec3.dispose
@6 // 4716
D=A // 4717
@14 // 4718
M=D // 4719
@Vec3.dispose // 4720
D=A // 4721
@13 // 4722
M=D // 4723
@Plane.color.ret.23 // 4724
D=A // 4725
@CALL // 4726
0;JMP // 4727
(Plane.color.ret.23)
@SP // 4728
M=M-1 // 4729

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 4730
A=M+1 // 4731
A=A+1 // 4732
D=M // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=D // 4737
// call Number.dispose
@6 // 4738
D=A // 4739
@14 // 4740
M=D // 4741
@Number.dispose // 4742
D=A // 4743
@13 // 4744
M=D // 4745
@Plane.color.ret.24 // 4746
D=A // 4747
@CALL // 4748
0;JMP // 4749
(Plane.color.ret.24)
@SP // 4750
M=M-1 // 4751

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_13 // 4752
D=A // 4753
@13 // 4754
M=D // 4755
@4 // 4756
D=A // 4757
@LCL_PUSH // 4758
0;JMP // 4759
(RETURN_PUSH_LABEL_13)
// call Int32.dispose
@6 // 4760
D=A // 4761
@14 // 4762
M=D // 4763
@Int32.dispose // 4764
D=A // 4765
@13 // 4766
M=D // 4767
@Plane.color.ret.25 // 4768
D=A // 4769
@CALL // 4770
0;JMP // 4771
(Plane.color.ret.25)
@SP // 4772
M=M-1 // 4773

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_14 // 4774
D=A // 4775
@13 // 4776
M=D // 4777
@5 // 4778
D=A // 4779
@LCL_PUSH // 4780
0;JMP // 4781
(RETURN_PUSH_LABEL_14)
// call Int32.dispose
@6 // 4782
D=A // 4783
@14 // 4784
M=D // 4785
@Int32.dispose // 4786
D=A // 4787
@13 // 4788
M=D // 4789
@Plane.color.ret.26 // 4790
D=A // 4791
@CALL // 4792
0;JMP // 4793
(Plane.color.ret.26)
@SP // 4794
M=M-1 // 4795

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_15 // 4796
D=A // 4797
@13 // 4798
M=D // 4799
@6 // 4800
D=A // 4801
@LCL_PUSH // 4802
0;JMP // 4803
(RETURN_PUSH_LABEL_15)
// call Int32.dispose
@6 // 4804
D=A // 4805
@14 // 4806
M=D // 4807
@Int32.dispose // 4808
D=A // 4809
@13 // 4810
M=D // 4811
@Plane.color.ret.27 // 4812
D=A // 4813
@CALL // 4814
0;JMP // 4815
(Plane.color.ret.27)
@SP // 4816
M=M-1 // 4817

////PushInstruction("local 7")
@RETURN_PUSH_LABEL_16 // 4818
D=A // 4819
@13 // 4820
M=D // 4821
@7 // 4822
D=A // 4823
@LCL_PUSH // 4824
0;JMP // 4825
(RETURN_PUSH_LABEL_16)
@RETURN // 4826
0;JMP // 4827

////GotoInstruction{label='Plane.color$IF_END1}
// goto Plane.color$IF_END1
@Plane.color$IF_END1 // 4828
0;JMP // 4829

////LabelInstruction{label='Plane.color$IF_FALSE1}
// label Plane.color$IF_FALSE1
(Plane.color$IF_FALSE1)

////CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
@THIS // 4830
A=M+1 // 4831
A=A+1 // 4832
D=M // 4833
@SP // 4834
AM=M+1 // 4835
A=A-1 // 4836
M=D // 4837
// call Number.clone
@6 // 4838
D=A // 4839
@14 // 4840
M=D // 4841
@Number.clone // 4842
D=A // 4843
@13 // 4844
M=D // 4845
@Plane.color.ret.28 // 4846
D=A // 4847
@CALL // 4848
0;JMP // 4849
(Plane.color.ret.28)
@RETURN // 4850
0;JMP // 4851

////LabelInstruction{label='Plane.color$IF_END1}
// label Plane.color$IF_END1
(Plane.color$IF_END1)

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.getMap=0, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 4852
AM=M+1 // 4853
A=A-1 // 4854
M=0 // 4855

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 4856
D=A // 4857
@SP // 4858
AM=M+1 // 4859
A=A-1 // 4860
M=D // 4861
// call Memory.alloc
@6 // 4862
D=A // 4863
@14 // 4864
M=D // 4865
@Memory.alloc // 4866
D=A // 4867
@13 // 4868
M=D // 4869
@Output.init.ret.0 // 4870
D=A // 4871
@CALL // 4872
0;JMP // 4873
(Output.init.ret.0)
@SP // 4874
AM=M-1 // 4875
D=M // 4876
@Output.0 // 4877
M=D // 4878

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4879
D=A // 4880
@SP // 4881
M=D+M // 4882
@63 // 4883
D=A // 4884
@SP // 4885
A=M-1 // 4886
M=0 // 4887
A=A-1 // 4888
M=0 // 4889
A=A-1 // 4890
M=D // 4891
A=A-1 // 4892
M=D // 4893
A=A-1 // 4894
M=D // 4895
A=A-1 // 4896
M=D // 4897
A=A-1 // 4898
M=D // 4899
A=A-1 // 4900
M=D // 4901
A=A-1 // 4902
M=D // 4903
A=A-1 // 4904
M=D // 4905
A=A-1 // 4906
M=D // 4907
A=A-1 // 4908
M=0 // 4909
// call Output.create
@17 // 4910
D=A // 4911
@14 // 4912
M=D // 4913
@Output.create // 4914
D=A // 4915
@13 // 4916
M=D // 4917
@Output.init.ret.1 // 4918
D=A // 4919
@CALL // 4920
0;JMP // 4921
(Output.init.ret.1)
@SP // 4922
M=M-1 // 4923

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 4924
D=A // 4925
@SP // 4926
M=D+M // 4927
@32 // 4928
D=A // 4929
@SP // 4930
A=M-1 // 4931
M=0 // 4932
A=A-1 // 4933
M=0 // 4934
A=A-1 // 4935
M=0 // 4936
A=A-1 // 4937
M=0 // 4938
A=A-1 // 4939
M=0 // 4940
A=A-1 // 4941
M=0 // 4942
A=A-1 // 4943
M=0 // 4944
A=A-1 // 4945
M=0 // 4946
A=A-1 // 4947
M=0 // 4948
A=A-1 // 4949
M=0 // 4950
A=A-1 // 4951
M=0 // 4952
A=A-1 // 4953
M=D // 4954
A=A-1 // 4955
// call Output.create
@17 // 4956
D=A // 4957
@14 // 4958
M=D // 4959
@Output.create // 4960
D=A // 4961
@13 // 4962
M=D // 4963
@Output.init.ret.2 // 4964
D=A // 4965
@CALL // 4966
0;JMP // 4967
(Output.init.ret.2)
@SP // 4968
M=M-1 // 4969

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 4970
D=A // 4971
@SP // 4972
AM=M+1 // 4973
A=A-1 // 4974
M=D // 4975
@12 // 4976
D=A // 4977
@SP // 4978
AM=M+1 // 4979
A=A-1 // 4980
M=D // 4981
@30 // 4982
D=A // 4983
@SP // 4984
AM=M+1 // 4985
A=A-1 // 4986
M=D // 4987
@30 // 4988
D=A // 4989
@SP // 4990
AM=M+1 // 4991
A=A-1 // 4992
M=D // 4993
@30 // 4994
D=A // 4995
@SP // 4996
AM=M+1 // 4997
A=A-1 // 4998
M=D // 4999
@12 // 5000
D=A // 5001
@SP // 5002
AM=M+1 // 5003
A=A-1 // 5004
M=D // 5005
@12 // 5006
D=A // 5007
@SP // 5008
AM=M+1 // 5009
A=A-1 // 5010
M=D // 5011
@SP // 5012
AM=M+1 // 5013
A=A-1 // 5014
M=0 // 5015
@4 // 5016
D=A // 5017
@SP // 5018
M=D+M // 5019
@12 // 5020
D=A // 5021
@SP // 5022
A=M-1 // 5023
M=0 // 5024
A=A-1 // 5025
M=0 // 5026
A=A-1 // 5027
M=D // 5028
A=A-1 // 5029
M=D // 5030
A=A-1 // 5031
// call Output.create
@17 // 5032
D=A // 5033
@14 // 5034
M=D // 5035
@Output.create // 5036
D=A // 5037
@13 // 5038
M=D // 5039
@Output.init.ret.3 // 5040
D=A // 5041
@CALL // 5042
0;JMP // 5043
(Output.init.ret.3)
@SP // 5044
M=M-1 // 5045

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5046
D=A // 5047
@SP // 5048
AM=M+1 // 5049
A=A-1 // 5050
M=D // 5051
@54 // 5052
D=A // 5053
@SP // 5054
AM=M+1 // 5055
A=A-1 // 5056
M=D // 5057
@54 // 5058
D=A // 5059
@SP // 5060
AM=M+1 // 5061
A=A-1 // 5062
M=D // 5063
@20 // 5064
D=A // 5065
@SP // 5066
AM=M+1 // 5067
A=A-1 // 5068
M=D // 5069
@SP // 5070
AM=M+1 // 5071
A=A-1 // 5072
M=0 // 5073
@SP // 5074
AM=M+1 // 5075
A=A-1 // 5076
M=0 // 5077
@SP // 5078
AM=M+1 // 5079
A=A-1 // 5080
M=0 // 5081
@SP // 5082
AM=M+1 // 5083
A=A-1 // 5084
M=0 // 5085
@SP // 5086
AM=M+1 // 5087
A=A-1 // 5088
M=0 // 5089
@SP // 5090
AM=M+1 // 5091
A=A-1 // 5092
M=0 // 5093
@SP // 5094
AM=M+1 // 5095
A=A-1 // 5096
M=0 // 5097
@SP // 5098
AM=M+1 // 5099
A=A-1 // 5100
M=0 // 5101
// call Output.create
@17 // 5102
D=A // 5103
@14 // 5104
M=D // 5105
@Output.create // 5106
D=A // 5107
@13 // 5108
M=D // 5109
@Output.init.ret.4 // 5110
D=A // 5111
@CALL // 5112
0;JMP // 5113
(Output.init.ret.4)
@SP // 5114
M=M-1 // 5115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5116
D=A // 5117
@SP // 5118
M=D+M // 5119
@35 // 5120
D=A // 5121
@SP // 5122
A=M-1 // 5123
M=0 // 5124
A=A-1 // 5125
M=D // 5126
A=A-1 // 5127
@18 // 5128
D=A // 5129
@SP // 5130
AM=M+1 // 5131
A=A-1 // 5132
M=D // 5133
@18 // 5134
D=A // 5135
@SP // 5136
AM=M+1 // 5137
A=A-1 // 5138
M=D // 5139
@63 // 5140
D=A // 5141
@SP // 5142
AM=M+1 // 5143
A=A-1 // 5144
M=D // 5145
@18 // 5146
D=A // 5147
@SP // 5148
AM=M+1 // 5149
A=A-1 // 5150
M=D // 5151
@18 // 5152
D=A // 5153
@SP // 5154
AM=M+1 // 5155
A=A-1 // 5156
M=D // 5157
@63 // 5158
D=A // 5159
@SP // 5160
AM=M+1 // 5161
A=A-1 // 5162
M=D // 5163
@18 // 5164
D=A // 5165
@SP // 5166
AM=M+1 // 5167
A=A-1 // 5168
M=D // 5169
@18 // 5170
D=A // 5171
@SP // 5172
AM=M+1 // 5173
A=A-1 // 5174
M=D // 5175
@SP // 5176
AM=M+1 // 5177
A=A-1 // 5178
M=0 // 5179
@SP // 5180
AM=M+1 // 5181
A=A-1 // 5182
M=0 // 5183
// call Output.create
@17 // 5184
D=A // 5185
@14 // 5186
M=D // 5187
@Output.create // 5188
D=A // 5189
@13 // 5190
M=D // 5191
@Output.init.ret.5 // 5192
D=A // 5193
@CALL // 5194
0;JMP // 5195
(Output.init.ret.5)
@SP // 5196
M=M-1 // 5197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 5198
D=A // 5199
@SP // 5200
AM=M+1 // 5201
A=A-1 // 5202
M=D // 5203
@12 // 5204
D=A // 5205
@SP // 5206
AM=M+1 // 5207
A=A-1 // 5208
M=D // 5209
@30 // 5210
D=A // 5211
@SP // 5212
AM=M+1 // 5213
A=A-1 // 5214
M=D // 5215
@51 // 5216
D=A // 5217
@SP // 5218
AM=M+1 // 5219
A=A-1 // 5220
M=D // 5221
@3 // 5222
D=A // 5223
@SP // 5224
AM=M+1 // 5225
A=A-1 // 5226
M=D // 5227
@30 // 5228
D=A // 5229
@SP // 5230
AM=M+1 // 5231
A=A-1 // 5232
M=D // 5233
@48 // 5234
D=A // 5235
@SP // 5236
AM=M+1 // 5237
A=A-1 // 5238
M=D // 5239
@51 // 5240
D=A // 5241
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=D // 5245
@30 // 5246
D=A // 5247
@SP // 5248
AM=M+1 // 5249
A=A-1 // 5250
M=D // 5251
@12 // 5252
D=A // 5253
@SP // 5254
AM=M+1 // 5255
A=A-1 // 5256
M=D // 5257
@12 // 5258
D=A // 5259
@SP // 5260
AM=M+1 // 5261
A=A-1 // 5262
M=D // 5263
@SP // 5264
AM=M+1 // 5265
A=A-1 // 5266
M=0 // 5267
// call Output.create
@17 // 5268
D=A // 5269
@14 // 5270
M=D // 5271
@Output.create // 5272
D=A // 5273
@13 // 5274
M=D // 5275
@Output.init.ret.6 // 5276
D=A // 5277
@CALL // 5278
0;JMP // 5279
(Output.init.ret.6)
@SP // 5280
M=M-1 // 5281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5282
D=A // 5283
@SP // 5284
M=D+M // 5285
@37 // 5286
D=A // 5287
@SP // 5288
A=M-1 // 5289
M=0 // 5290
A=A-1 // 5291
M=0 // 5292
A=A-1 // 5293
M=D // 5294
A=A-1 // 5295
@35 // 5296
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
@24 // 5308
D=A // 5309
@SP // 5310
AM=M+1 // 5311
A=A-1 // 5312
M=D // 5313
@12 // 5314
D=A // 5315
@SP // 5316
AM=M+1 // 5317
A=A-1 // 5318
M=D // 5319
@6 // 5320
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
@49 // 5332
D=A // 5333
@SP // 5334
AM=M+1 // 5335
A=A-1 // 5336
M=D // 5337
@SP // 5338
AM=M+1 // 5339
A=A-1 // 5340
M=0 // 5341
@SP // 5342
AM=M+1 // 5343
A=A-1 // 5344
M=0 // 5345
// call Output.create
@17 // 5346
D=A // 5347
@14 // 5348
M=D // 5349
@Output.create // 5350
D=A // 5351
@13 // 5352
M=D // 5353
@Output.init.ret.7 // 5354
D=A // 5355
@CALL // 5356
0;JMP // 5357
(Output.init.ret.7)
@SP // 5358
M=M-1 // 5359

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 5360
D=A // 5361
@SP // 5362
AM=M+1 // 5363
A=A-1 // 5364
M=D // 5365
@12 // 5366
D=A // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=D // 5371
@30 // 5372
D=A // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@30 // 5378
D=A // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=D // 5383
@12 // 5384
D=A // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=D // 5389
@54 // 5390
D=A // 5391
@SP // 5392
AM=M+1 // 5393
A=A-1 // 5394
M=D // 5395
@27 // 5396
D=A // 5397
@SP // 5398
AM=M+1 // 5399
A=A-1 // 5400
M=D // 5401
@27 // 5402
D=A // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=D // 5407
@27 // 5408
D=A // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=D // 5413
@54 // 5414
D=A // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=D // 5419
@SP // 5420
AM=M+1 // 5421
A=A-1 // 5422
M=0 // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=0 // 5427
// call Output.create
@17 // 5428
D=A // 5429
@14 // 5430
M=D // 5431
@Output.create // 5432
D=A // 5433
@13 // 5434
M=D // 5435
@Output.init.ret.8 // 5436
D=A // 5437
@CALL // 5438
0;JMP // 5439
(Output.init.ret.8)
@SP // 5440
M=M-1 // 5441

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 5442
D=A // 5443
@SP // 5444
AM=M+1 // 5445
A=A-1 // 5446
M=D // 5447
@12 // 5448
D=A // 5449
@SP // 5450
AM=M+1 // 5451
A=A-1 // 5452
M=D // 5453
@12 // 5454
D=A // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=D // 5459
@6 // 5460
D=A // 5461
@SP // 5462
AM=M+1 // 5463
A=A-1 // 5464
M=D // 5465
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=0 // 5469
@SP // 5470
AM=M+1 // 5471
A=A-1 // 5472
M=0 // 5473
@SP // 5474
AM=M+1 // 5475
A=A-1 // 5476
M=0 // 5477
@SP // 5478
AM=M+1 // 5479
A=A-1 // 5480
M=0 // 5481
@SP // 5482
AM=M+1 // 5483
A=A-1 // 5484
M=0 // 5485
@SP // 5486
AM=M+1 // 5487
A=A-1 // 5488
M=0 // 5489
@SP // 5490
AM=M+1 // 5491
A=A-1 // 5492
M=0 // 5493
@SP // 5494
AM=M+1 // 5495
A=A-1 // 5496
M=0 // 5497
// call Output.create
@17 // 5498
D=A // 5499
@14 // 5500
M=D // 5501
@Output.create // 5502
D=A // 5503
@13 // 5504
M=D // 5505
@Output.init.ret.9 // 5506
D=A // 5507
@CALL // 5508
0;JMP // 5509
(Output.init.ret.9)
@SP // 5510
M=M-1 // 5511

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 5512
D=A // 5513
@SP // 5514
AM=M+1 // 5515
A=A-1 // 5516
M=D // 5517
@24 // 5518
D=A // 5519
@SP // 5520
AM=M+1 // 5521
A=A-1 // 5522
M=D // 5523
@12 // 5524
D=A // 5525
@SP // 5526
AM=M+1 // 5527
A=A-1 // 5528
M=D // 5529
@6 // 5530
D=A // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=D // 5535
@6 // 5536
D=A // 5537
@SP // 5538
AM=M+1 // 5539
A=A-1 // 5540
M=D // 5541
@6 // 5542
D=A // 5543
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=D // 5547
@6 // 5548
D=A // 5549
@SP // 5550
AM=M+1 // 5551
A=A-1 // 5552
M=D // 5553
@6 // 5554
D=A // 5555
@SP // 5556
AM=M+1 // 5557
A=A-1 // 5558
M=D // 5559
@12 // 5560
D=A // 5561
@SP // 5562
AM=M+1 // 5563
A=A-1 // 5564
M=D // 5565
@24 // 5566
D=A // 5567
@SP // 5568
AM=M+1 // 5569
A=A-1 // 5570
M=D // 5571
@SP // 5572
AM=M+1 // 5573
A=A-1 // 5574
M=0 // 5575
@SP // 5576
AM=M+1 // 5577
A=A-1 // 5578
M=0 // 5579
// call Output.create
@17 // 5580
D=A // 5581
@14 // 5582
M=D // 5583
@Output.create // 5584
D=A // 5585
@13 // 5586
M=D // 5587
@Output.init.ret.10 // 5588
D=A // 5589
@CALL // 5590
0;JMP // 5591
(Output.init.ret.10)
@SP // 5592
M=M-1 // 5593

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 5594
D=A // 5595
@SP // 5596
AM=M+1 // 5597
A=A-1 // 5598
M=D // 5599
@6 // 5600
D=A // 5601
@SP // 5602
AM=M+1 // 5603
A=A-1 // 5604
M=D // 5605
@12 // 5606
D=A // 5607
@SP // 5608
AM=M+1 // 5609
A=A-1 // 5610
M=D // 5611
@24 // 5612
D=A // 5613
@SP // 5614
AM=M+1 // 5615
A=A-1 // 5616
M=D // 5617
@24 // 5618
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
@24 // 5630
D=A // 5631
@SP // 5632
AM=M+1 // 5633
A=A-1 // 5634
M=D // 5635
@24 // 5636
D=A // 5637
@SP // 5638
AM=M+1 // 5639
A=A-1 // 5640
M=D // 5641
@12 // 5642
D=A // 5643
@SP // 5644
AM=M+1 // 5645
A=A-1 // 5646
M=D // 5647
@6 // 5648
D=A // 5649
@SP // 5650
AM=M+1 // 5651
A=A-1 // 5652
M=D // 5653
@SP // 5654
AM=M+1 // 5655
A=A-1 // 5656
M=0 // 5657
@SP // 5658
AM=M+1 // 5659
A=A-1 // 5660
M=0 // 5661
// call Output.create
@17 // 5662
D=A // 5663
@14 // 5664
M=D // 5665
@Output.create // 5666
D=A // 5667
@13 // 5668
M=D // 5669
@Output.init.ret.11 // 5670
D=A // 5671
@CALL // 5672
0;JMP // 5673
(Output.init.ret.11)
@SP // 5674
M=M-1 // 5675

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5676
D=A // 5677
@SP // 5678
M=D+M // 5679
@42 // 5680
D=A // 5681
@SP // 5682
A=M-1 // 5683
M=0 // 5684
A=A-1 // 5685
M=0 // 5686
A=A-1 // 5687
M=0 // 5688
A=A-1 // 5689
M=D // 5690
A=A-1 // 5691
@51 // 5692
D=A // 5693
@SP // 5694
AM=M+1 // 5695
A=A-1 // 5696
M=D // 5697
@30 // 5698
D=A // 5699
@SP // 5700
AM=M+1 // 5701
A=A-1 // 5702
M=D // 5703
@63 // 5704
D=A // 5705
@SP // 5706
AM=M+1 // 5707
A=A-1 // 5708
M=D // 5709
@30 // 5710
D=A // 5711
@SP // 5712
AM=M+1 // 5713
A=A-1 // 5714
M=D // 5715
@51 // 5716
D=A // 5717
@SP // 5718
AM=M+1 // 5719
A=A-1 // 5720
M=D // 5721
@SP // 5722
AM=M+1 // 5723
A=A-1 // 5724
M=0 // 5725
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
@Output.init.ret.12 // 5742
D=A // 5743
@CALL // 5744
0;JMP // 5745
(Output.init.ret.12)
@SP // 5746
M=M-1 // 5747

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 5748
D=A // 5749
@SP // 5750
M=D+M // 5751
@43 // 5752
D=A // 5753
@SP // 5754
A=M-1 // 5755
M=0 // 5756
A=A-1 // 5757
M=0 // 5758
A=A-1 // 5759
M=0 // 5760
A=A-1 // 5761
M=D // 5762
A=A-1 // 5763
@12 // 5764
D=A // 5765
@SP // 5766
AM=M+1 // 5767
A=A-1 // 5768
M=D // 5769
@12 // 5770
D=A // 5771
@SP // 5772
AM=M+1 // 5773
A=A-1 // 5774
M=D // 5775
@63 // 5776
D=A // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=D // 5781
@12 // 5782
D=A // 5783
@SP // 5784
AM=M+1 // 5785
A=A-1 // 5786
M=D // 5787
@12 // 5788
D=A // 5789
@SP // 5790
AM=M+1 // 5791
A=A-1 // 5792
M=D // 5793
@SP // 5794
AM=M+1 // 5795
A=A-1 // 5796
M=0 // 5797
@SP // 5798
AM=M+1 // 5799
A=A-1 // 5800
M=0 // 5801
@SP // 5802
AM=M+1 // 5803
A=A-1 // 5804
M=0 // 5805
// call Output.create
@17 // 5806
D=A // 5807
@14 // 5808
M=D // 5809
@Output.create // 5810
D=A // 5811
@13 // 5812
M=D // 5813
@Output.init.ret.13 // 5814
D=A // 5815
@CALL // 5816
0;JMP // 5817
(Output.init.ret.13)
@SP // 5818
M=M-1 // 5819

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5820
D=A // 5821
@SP // 5822
M=D+M // 5823
@44 // 5824
D=A // 5825
@SP // 5826
A=M-1 // 5827
M=0 // 5828
A=A-1 // 5829
M=0 // 5830
A=A-1 // 5831
M=0 // 5832
A=A-1 // 5833
M=0 // 5834
A=A-1 // 5835
M=0 // 5836
A=A-1 // 5837
M=0 // 5838
A=A-1 // 5839
M=0 // 5840
A=A-1 // 5841
M=D // 5842
A=A-1 // 5843
@12 // 5844
D=A // 5845
@SP // 5846
AM=M+1 // 5847
A=A-1 // 5848
M=D // 5849
@12 // 5850
D=A // 5851
@SP // 5852
AM=M+1 // 5853
A=A-1 // 5854
M=D // 5855
@6 // 5856
D=A // 5857
@SP // 5858
AM=M+1 // 5859
A=A-1 // 5860
M=D // 5861
@SP // 5862
AM=M+1 // 5863
A=A-1 // 5864
M=0 // 5865
// call Output.create
@17 // 5866
D=A // 5867
@14 // 5868
M=D // 5869
@Output.create // 5870
D=A // 5871
@13 // 5872
M=D // 5873
@Output.init.ret.14 // 5874
D=A // 5875
@CALL // 5876
0;JMP // 5877
(Output.init.ret.14)
@SP // 5878
M=M-1 // 5879

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 5880
D=A // 5881
@SP // 5882
M=D+M // 5883
@45 // 5884
D=A // 5885
@SP // 5886
A=M-1 // 5887
M=0 // 5888
A=A-1 // 5889
M=0 // 5890
A=A-1 // 5891
M=0 // 5892
A=A-1 // 5893
M=0 // 5894
A=A-1 // 5895
M=0 // 5896
A=A-1 // 5897
M=D // 5898
A=A-1 // 5899
@6 // 5900
D=A // 5901
@SP // 5902
M=D+M // 5903
@63 // 5904
D=A // 5905
@SP // 5906
A=M-1 // 5907
M=0 // 5908
A=A-1 // 5909
M=0 // 5910
A=A-1 // 5911
M=0 // 5912
A=A-1 // 5913
M=0 // 5914
A=A-1 // 5915
M=0 // 5916
A=A-1 // 5917
M=D // 5918
A=A-1 // 5919
// call Output.create
@17 // 5920
D=A // 5921
@14 // 5922
M=D // 5923
@Output.create // 5924
D=A // 5925
@13 // 5926
M=D // 5927
@Output.init.ret.15 // 5928
D=A // 5929
@CALL // 5930
0;JMP // 5931
(Output.init.ret.15)
@SP // 5932
M=M-1 // 5933

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 5934
D=A // 5935
@SP // 5936
M=D+M // 5937
@46 // 5938
D=A // 5939
@SP // 5940
A=M-1 // 5941
M=0 // 5942
A=A-1 // 5943
M=0 // 5944
A=A-1 // 5945
M=0 // 5946
A=A-1 // 5947
M=0 // 5948
A=A-1 // 5949
M=0 // 5950
A=A-1 // 5951
M=0 // 5952
A=A-1 // 5953
M=0 // 5954
A=A-1 // 5955
M=D // 5956
A=A-1 // 5957
@4 // 5958
D=A // 5959
@SP // 5960
M=D+M // 5961
@12 // 5962
D=A // 5963
@SP // 5964
A=M-1 // 5965
M=0 // 5966
A=A-1 // 5967
M=0 // 5968
A=A-1 // 5969
M=D // 5970
A=A-1 // 5971
M=D // 5972
A=A-1 // 5973
// call Output.create
@17 // 5974
D=A // 5975
@14 // 5976
M=D // 5977
@Output.create // 5978
D=A // 5979
@13 // 5980
M=D // 5981
@Output.init.ret.16 // 5982
D=A // 5983
@CALL // 5984
0;JMP // 5985
(Output.init.ret.16)
@SP // 5986
M=M-1 // 5987

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 5988
D=A // 5989
@SP // 5990
M=D+M // 5991
@47 // 5992
D=A // 5993
@SP // 5994
A=M-1 // 5995
M=0 // 5996
A=A-1 // 5997
M=0 // 5998
A=A-1 // 5999
M=D // 6000
A=A-1 // 6001
@32 // 6002
D=A // 6003
@SP // 6004
AM=M+1 // 6005
A=A-1 // 6006
M=D // 6007
@48 // 6008
D=A // 6009
@SP // 6010
AM=M+1 // 6011
A=A-1 // 6012
M=D // 6013
@24 // 6014
D=A // 6015
@SP // 6016
AM=M+1 // 6017
A=A-1 // 6018
M=D // 6019
@12 // 6020
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
@3 // 6032
D=A // 6033
@SP // 6034
AM=M+1 // 6035
A=A-1 // 6036
M=D // 6037
@SP // 6038
AM=M+1 // 6039
A=A-1 // 6040
M=1 // 6041
@SP // 6042
AM=M+1 // 6043
A=A-1 // 6044
M=0 // 6045
@SP // 6046
AM=M+1 // 6047
A=A-1 // 6048
M=0 // 6049
// call Output.create
@17 // 6050
D=A // 6051
@14 // 6052
M=D // 6053
@Output.create // 6054
D=A // 6055
@13 // 6056
M=D // 6057
@Output.init.ret.17 // 6058
D=A // 6059
@CALL // 6060
0;JMP // 6061
(Output.init.ret.17)
@SP // 6062
M=M-1 // 6063

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6064
D=A // 6065
@SP // 6066
AM=M+1 // 6067
A=A-1 // 6068
M=D // 6069
@12 // 6070
D=A // 6071
@SP // 6072
AM=M+1 // 6073
A=A-1 // 6074
M=D // 6075
@30 // 6076
D=A // 6077
@SP // 6078
AM=M+1 // 6079
A=A-1 // 6080
M=D // 6081
@51 // 6082
D=A // 6083
@SP // 6084
AM=M+1 // 6085
A=A-1 // 6086
M=D // 6087
@51 // 6088
D=A // 6089
@SP // 6090
AM=M+1 // 6091
A=A-1 // 6092
M=D // 6093
@51 // 6094
D=A // 6095
@SP // 6096
AM=M+1 // 6097
A=A-1 // 6098
M=D // 6099
@51 // 6100
D=A // 6101
@SP // 6102
AM=M+1 // 6103
A=A-1 // 6104
M=D // 6105
@51 // 6106
D=A // 6107
@SP // 6108
AM=M+1 // 6109
A=A-1 // 6110
M=D // 6111
@30 // 6112
D=A // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=D // 6117
@12 // 6118
D=A // 6119
@SP // 6120
AM=M+1 // 6121
A=A-1 // 6122
M=D // 6123
@SP // 6124
AM=M+1 // 6125
A=A-1 // 6126
M=0 // 6127
@SP // 6128
AM=M+1 // 6129
A=A-1 // 6130
M=0 // 6131
// call Output.create
@17 // 6132
D=A // 6133
@14 // 6134
M=D // 6135
@Output.create // 6136
D=A // 6137
@13 // 6138
M=D // 6139
@Output.init.ret.18 // 6140
D=A // 6141
@CALL // 6142
0;JMP // 6143
(Output.init.ret.18)
@SP // 6144
M=M-1 // 6145

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6146
D=A // 6147
@SP // 6148
AM=M+1 // 6149
A=A-1 // 6150
M=D // 6151
@12 // 6152
D=A // 6153
@SP // 6154
AM=M+1 // 6155
A=A-1 // 6156
M=D // 6157
@14 // 6158
D=A // 6159
@SP // 6160
AM=M+1 // 6161
A=A-1 // 6162
M=D // 6163
@15 // 6164
D=A // 6165
@SP // 6166
AM=M+1 // 6167
A=A-1 // 6168
M=D // 6169
@12 // 6170
D=A // 6171
@SP // 6172
AM=M+1 // 6173
A=A-1 // 6174
M=D // 6175
@12 // 6176
D=A // 6177
@SP // 6178
AM=M+1 // 6179
A=A-1 // 6180
M=D // 6181
@12 // 6182
D=A // 6183
@SP // 6184
AM=M+1 // 6185
A=A-1 // 6186
M=D // 6187
@12 // 6188
D=A // 6189
@SP // 6190
AM=M+1 // 6191
A=A-1 // 6192
M=D // 6193
@12 // 6194
D=A // 6195
@SP // 6196
AM=M+1 // 6197
A=A-1 // 6198
M=D // 6199
@63 // 6200
D=A // 6201
@SP // 6202
AM=M+1 // 6203
A=A-1 // 6204
M=D // 6205
@SP // 6206
AM=M+1 // 6207
A=A-1 // 6208
M=0 // 6209
@SP // 6210
AM=M+1 // 6211
A=A-1 // 6212
M=0 // 6213
// call Output.create
@17 // 6214
D=A // 6215
@14 // 6216
M=D // 6217
@Output.create // 6218
D=A // 6219
@13 // 6220
M=D // 6221
@Output.init.ret.19 // 6222
D=A // 6223
@CALL // 6224
0;JMP // 6225
(Output.init.ret.19)
@SP // 6226
M=M-1 // 6227

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 6228
D=A // 6229
@SP // 6230
AM=M+1 // 6231
A=A-1 // 6232
M=D // 6233
@30 // 6234
D=A // 6235
@SP // 6236
AM=M+1 // 6237
A=A-1 // 6238
M=D // 6239
@51 // 6240
D=A // 6241
@SP // 6242
AM=M+1 // 6243
A=A-1 // 6244
M=D // 6245
@48 // 6246
D=A // 6247
@SP // 6248
AM=M+1 // 6249
A=A-1 // 6250
M=D // 6251
@24 // 6252
D=A // 6253
@SP // 6254
AM=M+1 // 6255
A=A-1 // 6256
M=D // 6257
@12 // 6258
D=A // 6259
@SP // 6260
AM=M+1 // 6261
A=A-1 // 6262
M=D // 6263
@6 // 6264
D=A // 6265
@SP // 6266
AM=M+1 // 6267
A=A-1 // 6268
M=D // 6269
@3 // 6270
D=A // 6271
@SP // 6272
AM=M+1 // 6273
A=A-1 // 6274
M=D // 6275
@51 // 6276
D=A // 6277
@SP // 6278
AM=M+1 // 6279
A=A-1 // 6280
M=D // 6281
@63 // 6282
D=A // 6283
@SP // 6284
AM=M+1 // 6285
A=A-1 // 6286
M=D // 6287
@SP // 6288
AM=M+1 // 6289
A=A-1 // 6290
M=0 // 6291
@SP // 6292
AM=M+1 // 6293
A=A-1 // 6294
M=0 // 6295
// call Output.create
@17 // 6296
D=A // 6297
@14 // 6298
M=D // 6299
@Output.create // 6300
D=A // 6301
@13 // 6302
M=D // 6303
@Output.init.ret.20 // 6304
D=A // 6305
@CALL // 6306
0;JMP // 6307
(Output.init.ret.20)
@SP // 6308
M=M-1 // 6309

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 6310
D=A // 6311
@SP // 6312
AM=M+1 // 6313
A=A-1 // 6314
M=D // 6315
@30 // 6316
D=A // 6317
@SP // 6318
AM=M+1 // 6319
A=A-1 // 6320
M=D // 6321
@51 // 6322
D=A // 6323
@SP // 6324
AM=M+1 // 6325
A=A-1 // 6326
M=D // 6327
@48 // 6328
D=A // 6329
@SP // 6330
AM=M+1 // 6331
A=A-1 // 6332
M=D // 6333
@48 // 6334
D=A // 6335
@SP // 6336
AM=M+1 // 6337
A=A-1 // 6338
M=D // 6339
@28 // 6340
D=A // 6341
@SP // 6342
AM=M+1 // 6343
A=A-1 // 6344
M=D // 6345
@48 // 6346
D=A // 6347
@SP // 6348
AM=M+1 // 6349
A=A-1 // 6350
M=D // 6351
@48 // 6352
D=A // 6353
@SP // 6354
AM=M+1 // 6355
A=A-1 // 6356
M=D // 6357
@51 // 6358
D=A // 6359
@SP // 6360
AM=M+1 // 6361
A=A-1 // 6362
M=D // 6363
@30 // 6364
D=A // 6365
@SP // 6366
AM=M+1 // 6367
A=A-1 // 6368
M=D // 6369
@SP // 6370
AM=M+1 // 6371
A=A-1 // 6372
M=0 // 6373
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=0 // 6377
// call Output.create
@17 // 6378
D=A // 6379
@14 // 6380
M=D // 6381
@Output.create // 6382
D=A // 6383
@13 // 6384
M=D // 6385
@Output.init.ret.21 // 6386
D=A // 6387
@CALL // 6388
0;JMP // 6389
(Output.init.ret.21)
@SP // 6390
M=M-1 // 6391

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 6392
D=A // 6393
@SP // 6394
AM=M+1 // 6395
A=A-1 // 6396
M=D // 6397
@16 // 6398
D=A // 6399
@SP // 6400
AM=M+1 // 6401
A=A-1 // 6402
M=D // 6403
@24 // 6404
D=A // 6405
@SP // 6406
AM=M+1 // 6407
A=A-1 // 6408
M=D // 6409
@28 // 6410
D=A // 6411
@SP // 6412
AM=M+1 // 6413
A=A-1 // 6414
M=D // 6415
@26 // 6416
D=A // 6417
@SP // 6418
AM=M+1 // 6419
A=A-1 // 6420
M=D // 6421
@25 // 6422
D=A // 6423
@SP // 6424
AM=M+1 // 6425
A=A-1 // 6426
M=D // 6427
@63 // 6428
D=A // 6429
@SP // 6430
AM=M+1 // 6431
A=A-1 // 6432
M=D // 6433
@24 // 6434
D=A // 6435
@SP // 6436
AM=M+1 // 6437
A=A-1 // 6438
M=D // 6439
@24 // 6440
D=A // 6441
@SP // 6442
AM=M+1 // 6443
A=A-1 // 6444
M=D // 6445
@60 // 6446
D=A // 6447
@SP // 6448
AM=M+1 // 6449
A=A-1 // 6450
M=D // 6451
@SP // 6452
AM=M+1 // 6453
A=A-1 // 6454
M=0 // 6455
@SP // 6456
AM=M+1 // 6457
A=A-1 // 6458
M=0 // 6459
// call Output.create
@17 // 6460
D=A // 6461
@14 // 6462
M=D // 6463
@Output.create // 6464
D=A // 6465
@13 // 6466
M=D // 6467
@Output.init.ret.22 // 6468
D=A // 6469
@CALL // 6470
0;JMP // 6471
(Output.init.ret.22)
@SP // 6472
M=M-1 // 6473

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 6474
D=A // 6475
@SP // 6476
AM=M+1 // 6477
A=A-1 // 6478
M=D // 6479
@63 // 6480
D=A // 6481
@SP // 6482
AM=M+1 // 6483
A=A-1 // 6484
M=D // 6485
@3 // 6486
D=A // 6487
@SP // 6488
AM=M+1 // 6489
A=A-1 // 6490
M=D // 6491
@3 // 6492
D=A // 6493
@SP // 6494
AM=M+1 // 6495
A=A-1 // 6496
M=D // 6497
@31 // 6498
D=A // 6499
@SP // 6500
AM=M+1 // 6501
A=A-1 // 6502
M=D // 6503
@48 // 6504
D=A // 6505
@SP // 6506
AM=M+1 // 6507
A=A-1 // 6508
M=D // 6509
@48 // 6510
D=A // 6511
@SP // 6512
AM=M+1 // 6513
A=A-1 // 6514
M=D // 6515
@48 // 6516
D=A // 6517
@SP // 6518
AM=M+1 // 6519
A=A-1 // 6520
M=D // 6521
@51 // 6522
D=A // 6523
@SP // 6524
AM=M+1 // 6525
A=A-1 // 6526
M=D // 6527
@30 // 6528
D=A // 6529
@SP // 6530
AM=M+1 // 6531
A=A-1 // 6532
M=D // 6533
@SP // 6534
AM=M+1 // 6535
A=A-1 // 6536
M=0 // 6537
@SP // 6538
AM=M+1 // 6539
A=A-1 // 6540
M=0 // 6541
// call Output.create
@17 // 6542
D=A // 6543
@14 // 6544
M=D // 6545
@Output.create // 6546
D=A // 6547
@13 // 6548
M=D // 6549
@Output.init.ret.23 // 6550
D=A // 6551
@CALL // 6552
0;JMP // 6553
(Output.init.ret.23)
@SP // 6554
M=M-1 // 6555

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 6556
D=A // 6557
@SP // 6558
AM=M+1 // 6559
A=A-1 // 6560
M=D // 6561
@28 // 6562
D=A // 6563
@SP // 6564
AM=M+1 // 6565
A=A-1 // 6566
M=D // 6567
@6 // 6568
D=A // 6569
@SP // 6570
AM=M+1 // 6571
A=A-1 // 6572
M=D // 6573
@3 // 6574
D=A // 6575
@SP // 6576
AM=M+1 // 6577
A=A-1 // 6578
M=D // 6579
@3 // 6580
D=A // 6581
@SP // 6582
AM=M+1 // 6583
A=A-1 // 6584
M=D // 6585
@31 // 6586
D=A // 6587
@SP // 6588
AM=M+1 // 6589
A=A-1 // 6590
M=D // 6591
@51 // 6592
D=A // 6593
@SP // 6594
AM=M+1 // 6595
A=A-1 // 6596
M=D // 6597
@51 // 6598
D=A // 6599
@SP // 6600
AM=M+1 // 6601
A=A-1 // 6602
M=D // 6603
@51 // 6604
D=A // 6605
@SP // 6606
AM=M+1 // 6607
A=A-1 // 6608
M=D // 6609
@30 // 6610
D=A // 6611
@SP // 6612
AM=M+1 // 6613
A=A-1 // 6614
M=D // 6615
@SP // 6616
AM=M+1 // 6617
A=A-1 // 6618
M=0 // 6619
@SP // 6620
AM=M+1 // 6621
A=A-1 // 6622
M=0 // 6623
// call Output.create
@17 // 6624
D=A // 6625
@14 // 6626
M=D // 6627
@Output.create // 6628
D=A // 6629
@13 // 6630
M=D // 6631
@Output.init.ret.24 // 6632
D=A // 6633
@CALL // 6634
0;JMP // 6635
(Output.init.ret.24)
@SP // 6636
M=M-1 // 6637

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 6638
D=A // 6639
@SP // 6640
AM=M+1 // 6641
A=A-1 // 6642
M=D // 6643
@63 // 6644
D=A // 6645
@SP // 6646
AM=M+1 // 6647
A=A-1 // 6648
M=D // 6649
@49 // 6650
D=A // 6651
@SP // 6652
AM=M+1 // 6653
A=A-1 // 6654
M=D // 6655
@48 // 6656
D=A // 6657
@SP // 6658
AM=M+1 // 6659
A=A-1 // 6660
M=D // 6661
@48 // 6662
D=A // 6663
@SP // 6664
AM=M+1 // 6665
A=A-1 // 6666
M=D // 6667
@24 // 6668
D=A // 6669
@SP // 6670
AM=M+1 // 6671
A=A-1 // 6672
M=D // 6673
@12 // 6674
D=A // 6675
@SP // 6676
AM=M+1 // 6677
A=A-1 // 6678
M=D // 6679
@12 // 6680
D=A // 6681
@SP // 6682
AM=M+1 // 6683
A=A-1 // 6684
M=D // 6685
@12 // 6686
D=A // 6687
@SP // 6688
AM=M+1 // 6689
A=A-1 // 6690
M=D // 6691
@12 // 6692
D=A // 6693
@SP // 6694
AM=M+1 // 6695
A=A-1 // 6696
M=D // 6697
@SP // 6698
AM=M+1 // 6699
A=A-1 // 6700
M=0 // 6701
@SP // 6702
AM=M+1 // 6703
A=A-1 // 6704
M=0 // 6705
// call Output.create
@17 // 6706
D=A // 6707
@14 // 6708
M=D // 6709
@Output.create // 6710
D=A // 6711
@13 // 6712
M=D // 6713
@Output.init.ret.25 // 6714
D=A // 6715
@CALL // 6716
0;JMP // 6717
(Output.init.ret.25)
@SP // 6718
M=M-1 // 6719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 6720
D=A // 6721
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=D // 6725
@30 // 6726
D=A // 6727
@SP // 6728
AM=M+1 // 6729
A=A-1 // 6730
M=D // 6731
@51 // 6732
D=A // 6733
@SP // 6734
AM=M+1 // 6735
A=A-1 // 6736
M=D // 6737
@51 // 6738
D=A // 6739
@SP // 6740
AM=M+1 // 6741
A=A-1 // 6742
M=D // 6743
@51 // 6744
D=A // 6745
@SP // 6746
AM=M+1 // 6747
A=A-1 // 6748
M=D // 6749
@30 // 6750
D=A // 6751
@SP // 6752
AM=M+1 // 6753
A=A-1 // 6754
M=D // 6755
@51 // 6756
D=A // 6757
@SP // 6758
AM=M+1 // 6759
A=A-1 // 6760
M=D // 6761
@51 // 6762
D=A // 6763
@SP // 6764
AM=M+1 // 6765
A=A-1 // 6766
M=D // 6767
@51 // 6768
D=A // 6769
@SP // 6770
AM=M+1 // 6771
A=A-1 // 6772
M=D // 6773
@30 // 6774
D=A // 6775
@SP // 6776
AM=M+1 // 6777
A=A-1 // 6778
M=D // 6779
@SP // 6780
AM=M+1 // 6781
A=A-1 // 6782
M=0 // 6783
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=0 // 6787
// call Output.create
@17 // 6788
D=A // 6789
@14 // 6790
M=D // 6791
@Output.create // 6792
D=A // 6793
@13 // 6794
M=D // 6795
@Output.init.ret.26 // 6796
D=A // 6797
@CALL // 6798
0;JMP // 6799
(Output.init.ret.26)
@SP // 6800
M=M-1 // 6801

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 6802
D=A // 6803
@SP // 6804
AM=M+1 // 6805
A=A-1 // 6806
M=D // 6807
@30 // 6808
D=A // 6809
@SP // 6810
AM=M+1 // 6811
A=A-1 // 6812
M=D // 6813
@51 // 6814
D=A // 6815
@SP // 6816
AM=M+1 // 6817
A=A-1 // 6818
M=D // 6819
@51 // 6820
D=A // 6821
@SP // 6822
AM=M+1 // 6823
A=A-1 // 6824
M=D // 6825
@51 // 6826
D=A // 6827
@SP // 6828
AM=M+1 // 6829
A=A-1 // 6830
M=D // 6831
@62 // 6832
D=A // 6833
@SP // 6834
AM=M+1 // 6835
A=A-1 // 6836
M=D // 6837
@48 // 6838
D=A // 6839
@SP // 6840
AM=M+1 // 6841
A=A-1 // 6842
M=D // 6843
@48 // 6844
D=A // 6845
@SP // 6846
AM=M+1 // 6847
A=A-1 // 6848
M=D // 6849
@24 // 6850
D=A // 6851
@SP // 6852
AM=M+1 // 6853
A=A-1 // 6854
M=D // 6855
@14 // 6856
D=A // 6857
@SP // 6858
AM=M+1 // 6859
A=A-1 // 6860
M=D // 6861
@SP // 6862
AM=M+1 // 6863
A=A-1 // 6864
M=0 // 6865
@SP // 6866
AM=M+1 // 6867
A=A-1 // 6868
M=0 // 6869
// call Output.create
@17 // 6870
D=A // 6871
@14 // 6872
M=D // 6873
@Output.create // 6874
D=A // 6875
@13 // 6876
M=D // 6877
@Output.init.ret.27 // 6878
D=A // 6879
@CALL // 6880
0;JMP // 6881
(Output.init.ret.27)
@SP // 6882
M=M-1 // 6883

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6884
D=A // 6885
@SP // 6886
M=D+M // 6887
@58 // 6888
D=A // 6889
@SP // 6890
A=M-1 // 6891
M=0 // 6892
A=A-1 // 6893
M=0 // 6894
A=A-1 // 6895
M=D // 6896
A=A-1 // 6897
@4 // 6898
D=A // 6899
@SP // 6900
M=D+M // 6901
@12 // 6902
D=A // 6903
@SP // 6904
A=M-1 // 6905
M=0 // 6906
A=A-1 // 6907
M=0 // 6908
A=A-1 // 6909
M=D // 6910
A=A-1 // 6911
M=D // 6912
A=A-1 // 6913
@5 // 6914
D=A // 6915
@SP // 6916
M=D+M // 6917
@12 // 6918
D=A // 6919
@SP // 6920
A=M-1 // 6921
M=0 // 6922
A=A-1 // 6923
M=0 // 6924
A=A-1 // 6925
M=0 // 6926
A=A-1 // 6927
M=D // 6928
A=A-1 // 6929
M=D // 6930
A=A-1 // 6931
// call Output.create
@17 // 6932
D=A // 6933
@14 // 6934
M=D // 6935
@Output.create // 6936
D=A // 6937
@13 // 6938
M=D // 6939
@Output.init.ret.28 // 6940
D=A // 6941
@CALL // 6942
0;JMP // 6943
(Output.init.ret.28)
@SP // 6944
M=M-1 // 6945

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6946
D=A // 6947
@SP // 6948
M=D+M // 6949
@59 // 6950
D=A // 6951
@SP // 6952
A=M-1 // 6953
M=0 // 6954
A=A-1 // 6955
M=0 // 6956
A=A-1 // 6957
M=D // 6958
A=A-1 // 6959
@4 // 6960
D=A // 6961
@SP // 6962
M=D+M // 6963
@12 // 6964
D=A // 6965
@SP // 6966
A=M-1 // 6967
M=0 // 6968
A=A-1 // 6969
M=0 // 6970
A=A-1 // 6971
M=D // 6972
A=A-1 // 6973
M=D // 6974
A=A-1 // 6975
@12 // 6976
D=A // 6977
@SP // 6978
AM=M+1 // 6979
A=A-1 // 6980
M=D // 6981
@12 // 6982
D=A // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=D // 6987
@6 // 6988
D=A // 6989
@SP // 6990
AM=M+1 // 6991
A=A-1 // 6992
M=D // 6993
@SP // 6994
AM=M+1 // 6995
A=A-1 // 6996
M=0 // 6997
@SP // 6998
AM=M+1 // 6999
A=A-1 // 7000
M=0 // 7001
// call Output.create
@17 // 7002
D=A // 7003
@14 // 7004
M=D // 7005
@Output.create // 7006
D=A // 7007
@13 // 7008
M=D // 7009
@Output.init.ret.29 // 7010
D=A // 7011
@CALL // 7012
0;JMP // 7013
(Output.init.ret.29)
@SP // 7014
M=M-1 // 7015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7016
D=A // 7017
@SP // 7018
M=D+M // 7019
@60 // 7020
D=A // 7021
@SP // 7022
A=M-1 // 7023
M=0 // 7024
A=A-1 // 7025
M=0 // 7026
A=A-1 // 7027
M=D // 7028
A=A-1 // 7029
@24 // 7030
D=A // 7031
@SP // 7032
AM=M+1 // 7033
A=A-1 // 7034
M=D // 7035
@12 // 7036
D=A // 7037
@SP // 7038
AM=M+1 // 7039
A=A-1 // 7040
M=D // 7041
@6 // 7042
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
@6 // 7054
D=A // 7055
@SP // 7056
AM=M+1 // 7057
A=A-1 // 7058
M=D // 7059
@12 // 7060
D=A // 7061
@SP // 7062
AM=M+1 // 7063
A=A-1 // 7064
M=D // 7065
@24 // 7066
D=A // 7067
@SP // 7068
AM=M+1 // 7069
A=A-1 // 7070
M=D // 7071
@SP // 7072
AM=M+1 // 7073
A=A-1 // 7074
M=0 // 7075
@SP // 7076
AM=M+1 // 7077
A=A-1 // 7078
M=0 // 7079
// call Output.create
@17 // 7080
D=A // 7081
@14 // 7082
M=D // 7083
@Output.create // 7084
D=A // 7085
@13 // 7086
M=D // 7087
@Output.init.ret.30 // 7088
D=A // 7089
@CALL // 7090
0;JMP // 7091
(Output.init.ret.30)
@SP // 7092
M=M-1 // 7093

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7094
D=A // 7095
@SP // 7096
M=D+M // 7097
@61 // 7098
D=A // 7099
@SP // 7100
A=M-1 // 7101
M=0 // 7102
A=A-1 // 7103
M=0 // 7104
A=A-1 // 7105
M=0 // 7106
A=A-1 // 7107
M=D // 7108
A=A-1 // 7109
@3 // 7110
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
M=D // 7122
A=A-1 // 7123
@5 // 7124
D=A // 7125
@SP // 7126
M=D+M // 7127
@63 // 7128
D=A // 7129
@SP // 7130
A=M-1 // 7131
M=0 // 7132
A=A-1 // 7133
M=0 // 7134
A=A-1 // 7135
M=0 // 7136
A=A-1 // 7137
M=0 // 7138
A=A-1 // 7139
M=D // 7140
A=A-1 // 7141
// call Output.create
@17 // 7142
D=A // 7143
@14 // 7144
M=D // 7145
@Output.create // 7146
D=A // 7147
@13 // 7148
M=D // 7149
@Output.init.ret.31 // 7150
D=A // 7151
@CALL // 7152
0;JMP // 7153
(Output.init.ret.31)
@SP // 7154
M=M-1 // 7155

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7156
D=A // 7157
@SP // 7158
M=D+M // 7159
@62 // 7160
D=A // 7161
@SP // 7162
A=M-1 // 7163
M=0 // 7164
A=A-1 // 7165
M=0 // 7166
A=A-1 // 7167
M=D // 7168
A=A-1 // 7169
@3 // 7170
D=A // 7171
@SP // 7172
AM=M+1 // 7173
A=A-1 // 7174
M=D // 7175
@6 // 7176
D=A // 7177
@SP // 7178
AM=M+1 // 7179
A=A-1 // 7180
M=D // 7181
@12 // 7182
D=A // 7183
@SP // 7184
AM=M+1 // 7185
A=A-1 // 7186
M=D // 7187
@24 // 7188
D=A // 7189
@SP // 7190
AM=M+1 // 7191
A=A-1 // 7192
M=D // 7193
@12 // 7194
D=A // 7195
@SP // 7196
AM=M+1 // 7197
A=A-1 // 7198
M=D // 7199
@6 // 7200
D=A // 7201
@SP // 7202
AM=M+1 // 7203
A=A-1 // 7204
M=D // 7205
@3 // 7206
D=A // 7207
@SP // 7208
AM=M+1 // 7209
A=A-1 // 7210
M=D // 7211
@SP // 7212
AM=M+1 // 7213
A=A-1 // 7214
M=0 // 7215
@SP // 7216
AM=M+1 // 7217
A=A-1 // 7218
M=0 // 7219
// call Output.create
@17 // 7220
D=A // 7221
@14 // 7222
M=D // 7223
@Output.create // 7224
D=A // 7225
@13 // 7226
M=D // 7227
@Output.init.ret.32 // 7228
D=A // 7229
@CALL // 7230
0;JMP // 7231
(Output.init.ret.32)
@SP // 7232
M=M-1 // 7233

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 7234
D=A // 7235
@SP // 7236
AM=M+1 // 7237
A=A-1 // 7238
M=D // 7239
@30 // 7240
D=A // 7241
@SP // 7242
AM=M+1 // 7243
A=A-1 // 7244
M=D // 7245
@51 // 7246
D=A // 7247
@SP // 7248
AM=M+1 // 7249
A=A-1 // 7250
M=D // 7251
@51 // 7252
D=A // 7253
@SP // 7254
AM=M+1 // 7255
A=A-1 // 7256
M=D // 7257
@59 // 7258
D=A // 7259
@SP // 7260
AM=M+1 // 7261
A=A-1 // 7262
M=D // 7263
@59 // 7264
D=A // 7265
@SP // 7266
AM=M+1 // 7267
A=A-1 // 7268
M=D // 7269
@59 // 7270
D=A // 7271
@SP // 7272
AM=M+1 // 7273
A=A-1 // 7274
M=D // 7275
@27 // 7276
D=A // 7277
@SP // 7278
AM=M+1 // 7279
A=A-1 // 7280
M=D // 7281
@3 // 7282
D=A // 7283
@SP // 7284
AM=M+1 // 7285
A=A-1 // 7286
M=D // 7287
@30 // 7288
D=A // 7289
@SP // 7290
AM=M+1 // 7291
A=A-1 // 7292
M=D // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=0 // 7297
@SP // 7298
AM=M+1 // 7299
A=A-1 // 7300
M=0 // 7301
// call Output.create
@17 // 7302
D=A // 7303
@14 // 7304
M=D // 7305
@Output.create // 7306
D=A // 7307
@13 // 7308
M=D // 7309
@Output.init.ret.33 // 7310
D=A // 7311
@CALL // 7312
0;JMP // 7313
(Output.init.ret.33)
@SP // 7314
M=M-1 // 7315

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 7316
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
@24 // 7340
D=A // 7341
@SP // 7342
AM=M+1 // 7343
A=A-1 // 7344
M=D // 7345
@12 // 7346
D=A // 7347
@SP // 7348
AM=M+1 // 7349
A=A-1 // 7350
M=D // 7351
@12 // 7352
D=A // 7353
@SP // 7354
AM=M+1 // 7355
A=A-1 // 7356
M=D // 7357
@SP // 7358
AM=M+1 // 7359
A=A-1 // 7360
M=0 // 7361
@4 // 7362
D=A // 7363
@SP // 7364
M=D+M // 7365
@12 // 7366
D=A // 7367
@SP // 7368
A=M-1 // 7369
M=0 // 7370
A=A-1 // 7371
M=0 // 7372
A=A-1 // 7373
M=D // 7374
A=A-1 // 7375
M=D // 7376
A=A-1 // 7377
// call Output.create
@17 // 7378
D=A // 7379
@14 // 7380
M=D // 7381
@Output.create // 7382
D=A // 7383
@13 // 7384
M=D // 7385
@Output.init.ret.34 // 7386
D=A // 7387
@CALL // 7388
0;JMP // 7389
(Output.init.ret.34)
@SP // 7390
M=M-1 // 7391

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 7392
D=A // 7393
@SP // 7394
AM=M+1 // 7395
A=A-1 // 7396
M=D // 7397
@12 // 7398
D=A // 7399
@SP // 7400
AM=M+1 // 7401
A=A-1 // 7402
M=D // 7403
@30 // 7404
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
@63 // 7422
D=A // 7423
@SP // 7424
AM=M+1 // 7425
A=A-1 // 7426
M=D // 7427
@51 // 7428
D=A // 7429
@SP // 7430
AM=M+1 // 7431
A=A-1 // 7432
M=D // 7433
@51 // 7434
D=A // 7435
@SP // 7436
AM=M+1 // 7437
A=A-1 // 7438
M=D // 7439
@51 // 7440
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
@SP // 7452
AM=M+1 // 7453
A=A-1 // 7454
M=0 // 7455
@SP // 7456
AM=M+1 // 7457
A=A-1 // 7458
M=0 // 7459
// call Output.create
@17 // 7460
D=A // 7461
@14 // 7462
M=D // 7463
@Output.create // 7464
D=A // 7465
@13 // 7466
M=D // 7467
@Output.init.ret.35 // 7468
D=A // 7469
@CALL // 7470
0;JMP // 7471
(Output.init.ret.35)
@SP // 7472
M=M-1 // 7473

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 7474
D=A // 7475
@SP // 7476
AM=M+1 // 7477
A=A-1 // 7478
M=D // 7479
@31 // 7480
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
@51 // 7492
D=A // 7493
@SP // 7494
AM=M+1 // 7495
A=A-1 // 7496
M=D // 7497
@51 // 7498
D=A // 7499
@SP // 7500
AM=M+1 // 7501
A=A-1 // 7502
M=D // 7503
@31 // 7504
D=A // 7505
@SP // 7506
AM=M+1 // 7507
A=A-1 // 7508
M=D // 7509
@51 // 7510
D=A // 7511
@SP // 7512
AM=M+1 // 7513
A=A-1 // 7514
M=D // 7515
@51 // 7516
D=A // 7517
@SP // 7518
AM=M+1 // 7519
A=A-1 // 7520
M=D // 7521
@51 // 7522
D=A // 7523
@SP // 7524
AM=M+1 // 7525
A=A-1 // 7526
M=D // 7527
@31 // 7528
D=A // 7529
@SP // 7530
AM=M+1 // 7531
A=A-1 // 7532
M=D // 7533
@SP // 7534
AM=M+1 // 7535
A=A-1 // 7536
M=0 // 7537
@SP // 7538
AM=M+1 // 7539
A=A-1 // 7540
M=0 // 7541
// call Output.create
@17 // 7542
D=A // 7543
@14 // 7544
M=D // 7545
@Output.create // 7546
D=A // 7547
@13 // 7548
M=D // 7549
@Output.init.ret.36 // 7550
D=A // 7551
@CALL // 7552
0;JMP // 7553
(Output.init.ret.36)
@SP // 7554
M=M-1 // 7555

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 7556
D=A // 7557
@SP // 7558
AM=M+1 // 7559
A=A-1 // 7560
M=D // 7561
@28 // 7562
D=A // 7563
@SP // 7564
AM=M+1 // 7565
A=A-1 // 7566
M=D // 7567
@54 // 7568
D=A // 7569
@SP // 7570
AM=M+1 // 7571
A=A-1 // 7572
M=D // 7573
@35 // 7574
D=A // 7575
@SP // 7576
AM=M+1 // 7577
A=A-1 // 7578
M=D // 7579
@3 // 7580
D=A // 7581
@SP // 7582
AM=M+1 // 7583
A=A-1 // 7584
M=D // 7585
@3 // 7586
D=A // 7587
@SP // 7588
AM=M+1 // 7589
A=A-1 // 7590
M=D // 7591
@3 // 7592
D=A // 7593
@SP // 7594
AM=M+1 // 7595
A=A-1 // 7596
M=D // 7597
@35 // 7598
D=A // 7599
@SP // 7600
AM=M+1 // 7601
A=A-1 // 7602
M=D // 7603
@54 // 7604
D=A // 7605
@SP // 7606
AM=M+1 // 7607
A=A-1 // 7608
M=D // 7609
@28 // 7610
D=A // 7611
@SP // 7612
AM=M+1 // 7613
A=A-1 // 7614
M=D // 7615
@SP // 7616
AM=M+1 // 7617
A=A-1 // 7618
M=0 // 7619
@SP // 7620
AM=M+1 // 7621
A=A-1 // 7622
M=0 // 7623
// call Output.create
@17 // 7624
D=A // 7625
@14 // 7626
M=D // 7627
@Output.create // 7628
D=A // 7629
@13 // 7630
M=D // 7631
@Output.init.ret.37 // 7632
D=A // 7633
@CALL // 7634
0;JMP // 7635
(Output.init.ret.37)
@SP // 7636
M=M-1 // 7637

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 7638
D=A // 7639
@SP // 7640
AM=M+1 // 7641
A=A-1 // 7642
M=D // 7643
@15 // 7644
D=A // 7645
@SP // 7646
AM=M+1 // 7647
A=A-1 // 7648
M=D // 7649
@27 // 7650
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
@51 // 7668
D=A // 7669
@SP // 7670
AM=M+1 // 7671
A=A-1 // 7672
M=D // 7673
@51 // 7674
D=A // 7675
@SP // 7676
AM=M+1 // 7677
A=A-1 // 7678
M=D // 7679
@51 // 7680
D=A // 7681
@SP // 7682
AM=M+1 // 7683
A=A-1 // 7684
M=D // 7685
@27 // 7686
D=A // 7687
@SP // 7688
AM=M+1 // 7689
A=A-1 // 7690
M=D // 7691
@15 // 7692
D=A // 7693
@SP // 7694
AM=M+1 // 7695
A=A-1 // 7696
M=D // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=0 // 7701
@SP // 7702
AM=M+1 // 7703
A=A-1 // 7704
M=0 // 7705
// call Output.create
@17 // 7706
D=A // 7707
@14 // 7708
M=D // 7709
@Output.create // 7710
D=A // 7711
@13 // 7712
M=D // 7713
@Output.init.ret.38 // 7714
D=A // 7715
@CALL // 7716
0;JMP // 7717
(Output.init.ret.38)
@SP // 7718
M=M-1 // 7719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 7720
D=A // 7721
@SP // 7722
AM=M+1 // 7723
A=A-1 // 7724
M=D // 7725
@63 // 7726
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
@35 // 7738
D=A // 7739
@SP // 7740
AM=M+1 // 7741
A=A-1 // 7742
M=D // 7743
@11 // 7744
D=A // 7745
@SP // 7746
AM=M+1 // 7747
A=A-1 // 7748
M=D // 7749
@15 // 7750
D=A // 7751
@SP // 7752
AM=M+1 // 7753
A=A-1 // 7754
M=D // 7755
@11 // 7756
D=A // 7757
@SP // 7758
AM=M+1 // 7759
A=A-1 // 7760
M=D // 7761
@35 // 7762
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
@63 // 7774
D=A // 7775
@SP // 7776
AM=M+1 // 7777
A=A-1 // 7778
M=D // 7779
@SP // 7780
AM=M+1 // 7781
A=A-1 // 7782
M=0 // 7783
@SP // 7784
AM=M+1 // 7785
A=A-1 // 7786
M=0 // 7787
// call Output.create
@17 // 7788
D=A // 7789
@14 // 7790
M=D // 7791
@Output.create // 7792
D=A // 7793
@13 // 7794
M=D // 7795
@Output.init.ret.39 // 7796
D=A // 7797
@CALL // 7798
0;JMP // 7799
(Output.init.ret.39)
@SP // 7800
M=M-1 // 7801

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 7802
D=A // 7803
@SP // 7804
AM=M+1 // 7805
A=A-1 // 7806
M=D // 7807
@63 // 7808
D=A // 7809
@SP // 7810
AM=M+1 // 7811
A=A-1 // 7812
M=D // 7813
@51 // 7814
D=A // 7815
@SP // 7816
AM=M+1 // 7817
A=A-1 // 7818
M=D // 7819
@35 // 7820
D=A // 7821
@SP // 7822
AM=M+1 // 7823
A=A-1 // 7824
M=D // 7825
@11 // 7826
D=A // 7827
@SP // 7828
AM=M+1 // 7829
A=A-1 // 7830
M=D // 7831
@15 // 7832
D=A // 7833
@SP // 7834
AM=M+1 // 7835
A=A-1 // 7836
M=D // 7837
@11 // 7838
D=A // 7839
@SP // 7840
AM=M+1 // 7841
A=A-1 // 7842
M=D // 7843
@3 // 7844
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
@SP // 7862
AM=M+1 // 7863
A=A-1 // 7864
M=0 // 7865
@SP // 7866
AM=M+1 // 7867
A=A-1 // 7868
M=0 // 7869
// call Output.create
@17 // 7870
D=A // 7871
@14 // 7872
M=D // 7873
@Output.create // 7874
D=A // 7875
@13 // 7876
M=D // 7877
@Output.init.ret.40 // 7878
D=A // 7879
@CALL // 7880
0;JMP // 7881
(Output.init.ret.40)
@SP // 7882
M=M-1 // 7883

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 7884
D=A // 7885
@SP // 7886
AM=M+1 // 7887
A=A-1 // 7888
M=D // 7889
@28 // 7890
D=A // 7891
@SP // 7892
AM=M+1 // 7893
A=A-1 // 7894
M=D // 7895
@54 // 7896
D=A // 7897
@SP // 7898
AM=M+1 // 7899
A=A-1 // 7900
M=D // 7901
@35 // 7902
D=A // 7903
@SP // 7904
AM=M+1 // 7905
A=A-1 // 7906
M=D // 7907
@3 // 7908
D=A // 7909
@SP // 7910
AM=M+1 // 7911
A=A-1 // 7912
M=D // 7913
@59 // 7914
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
@54 // 7932
D=A // 7933
@SP // 7934
AM=M+1 // 7935
A=A-1 // 7936
M=D // 7937
@44 // 7938
D=A // 7939
@SP // 7940
AM=M+1 // 7941
A=A-1 // 7942
M=D // 7943
@SP // 7944
AM=M+1 // 7945
A=A-1 // 7946
M=0 // 7947
@SP // 7948
AM=M+1 // 7949
A=A-1 // 7950
M=0 // 7951
// call Output.create
@17 // 7952
D=A // 7953
@14 // 7954
M=D // 7955
@Output.create // 7956
D=A // 7957
@13 // 7958
M=D // 7959
@Output.init.ret.41 // 7960
D=A // 7961
@CALL // 7962
0;JMP // 7963
(Output.init.ret.41)
@SP // 7964
M=M-1 // 7965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 7966
D=A // 7967
@SP // 7968
AM=M+1 // 7969
A=A-1 // 7970
M=D // 7971
@51 // 7972
D=A // 7973
@SP // 7974
AM=M+1 // 7975
A=A-1 // 7976
M=D // 7977
@51 // 7978
D=A // 7979
@SP // 7980
AM=M+1 // 7981
A=A-1 // 7982
M=D // 7983
@51 // 7984
D=A // 7985
@SP // 7986
AM=M+1 // 7987
A=A-1 // 7988
M=D // 7989
@51 // 7990
D=A // 7991
@SP // 7992
AM=M+1 // 7993
A=A-1 // 7994
M=D // 7995
@63 // 7996
D=A // 7997
@SP // 7998
AM=M+1 // 7999
A=A-1 // 8000
M=D // 8001
@51 // 8002
D=A // 8003
@SP // 8004
AM=M+1 // 8005
A=A-1 // 8006
M=D // 8007
@51 // 8008
D=A // 8009
@SP // 8010
AM=M+1 // 8011
A=A-1 // 8012
M=D // 8013
@51 // 8014
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
@SP // 8026
AM=M+1 // 8027
A=A-1 // 8028
M=0 // 8029
@SP // 8030
AM=M+1 // 8031
A=A-1 // 8032
M=0 // 8033
// call Output.create
@17 // 8034
D=A // 8035
@14 // 8036
M=D // 8037
@Output.create // 8038
D=A // 8039
@13 // 8040
M=D // 8041
@Output.init.ret.42 // 8042
D=A // 8043
@CALL // 8044
0;JMP // 8045
(Output.init.ret.42)
@SP // 8046
M=M-1 // 8047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8048
D=A // 8049
@SP // 8050
AM=M+1 // 8051
A=A-1 // 8052
M=D // 8053
@30 // 8054
D=A // 8055
@SP // 8056
AM=M+1 // 8057
A=A-1 // 8058
M=D // 8059
@12 // 8060
D=A // 8061
@SP // 8062
AM=M+1 // 8063
A=A-1 // 8064
M=D // 8065
@12 // 8066
D=A // 8067
@SP // 8068
AM=M+1 // 8069
A=A-1 // 8070
M=D // 8071
@12 // 8072
D=A // 8073
@SP // 8074
AM=M+1 // 8075
A=A-1 // 8076
M=D // 8077
@12 // 8078
D=A // 8079
@SP // 8080
AM=M+1 // 8081
A=A-1 // 8082
M=D // 8083
@12 // 8084
D=A // 8085
@SP // 8086
AM=M+1 // 8087
A=A-1 // 8088
M=D // 8089
@12 // 8090
D=A // 8091
@SP // 8092
AM=M+1 // 8093
A=A-1 // 8094
M=D // 8095
@12 // 8096
D=A // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=D // 8101
@30 // 8102
D=A // 8103
@SP // 8104
AM=M+1 // 8105
A=A-1 // 8106
M=D // 8107
@SP // 8108
AM=M+1 // 8109
A=A-1 // 8110
M=0 // 8111
@SP // 8112
AM=M+1 // 8113
A=A-1 // 8114
M=0 // 8115
// call Output.create
@17 // 8116
D=A // 8117
@14 // 8118
M=D // 8119
@Output.create // 8120
D=A // 8121
@13 // 8122
M=D // 8123
@Output.init.ret.43 // 8124
D=A // 8125
@CALL // 8126
0;JMP // 8127
(Output.init.ret.43)
@SP // 8128
M=M-1 // 8129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8130
D=A // 8131
@SP // 8132
AM=M+1 // 8133
A=A-1 // 8134
M=D // 8135
@60 // 8136
D=A // 8137
@SP // 8138
AM=M+1 // 8139
A=A-1 // 8140
M=D // 8141
@24 // 8142
D=A // 8143
@SP // 8144
AM=M+1 // 8145
A=A-1 // 8146
M=D // 8147
@24 // 8148
D=A // 8149
@SP // 8150
AM=M+1 // 8151
A=A-1 // 8152
M=D // 8153
@24 // 8154
D=A // 8155
@SP // 8156
AM=M+1 // 8157
A=A-1 // 8158
M=D // 8159
@24 // 8160
D=A // 8161
@SP // 8162
AM=M+1 // 8163
A=A-1 // 8164
M=D // 8165
@24 // 8166
D=A // 8167
@SP // 8168
AM=M+1 // 8169
A=A-1 // 8170
M=D // 8171
@27 // 8172
D=A // 8173
@SP // 8174
AM=M+1 // 8175
A=A-1 // 8176
M=D // 8177
@27 // 8178
D=A // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=D // 8183
@14 // 8184
D=A // 8185
@SP // 8186
AM=M+1 // 8187
A=A-1 // 8188
M=D // 8189
@SP // 8190
AM=M+1 // 8191
A=A-1 // 8192
M=0 // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=0 // 8197
// call Output.create
@17 // 8198
D=A // 8199
@14 // 8200
M=D // 8201
@Output.create // 8202
D=A // 8203
@13 // 8204
M=D // 8205
@Output.init.ret.44 // 8206
D=A // 8207
@CALL // 8208
0;JMP // 8209
(Output.init.ret.44)
@SP // 8210
M=M-1 // 8211

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 8212
D=A // 8213
@SP // 8214
AM=M+1 // 8215
A=A-1 // 8216
M=D // 8217
@51 // 8218
D=A // 8219
@SP // 8220
AM=M+1 // 8221
A=A-1 // 8222
M=D // 8223
@51 // 8224
D=A // 8225
@SP // 8226
AM=M+1 // 8227
A=A-1 // 8228
M=D // 8229
@51 // 8230
D=A // 8231
@SP // 8232
AM=M+1 // 8233
A=A-1 // 8234
M=D // 8235
@27 // 8236
D=A // 8237
@SP // 8238
AM=M+1 // 8239
A=A-1 // 8240
M=D // 8241
@15 // 8242
D=A // 8243
@SP // 8244
AM=M+1 // 8245
A=A-1 // 8246
M=D // 8247
@27 // 8248
D=A // 8249
@SP // 8250
AM=M+1 // 8251
A=A-1 // 8252
M=D // 8253
@51 // 8254
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
@SP // 8272
AM=M+1 // 8273
A=A-1 // 8274
M=0 // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=0 // 8279
// call Output.create
@17 // 8280
D=A // 8281
@14 // 8282
M=D // 8283
@Output.create // 8284
D=A // 8285
@13 // 8286
M=D // 8287
@Output.init.ret.45 // 8288
D=A // 8289
@CALL // 8290
0;JMP // 8291
(Output.init.ret.45)
@SP // 8292
M=M-1 // 8293

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 8294
D=A // 8295
@SP // 8296
AM=M+1 // 8297
A=A-1 // 8298
M=D // 8299
@3 // 8300
D=A // 8301
@SP // 8302
AM=M+1 // 8303
A=A-1 // 8304
M=D // 8305
@3 // 8306
D=A // 8307
@SP // 8308
AM=M+1 // 8309
A=A-1 // 8310
M=D // 8311
@3 // 8312
D=A // 8313
@SP // 8314
AM=M+1 // 8315
A=A-1 // 8316
M=D // 8317
@3 // 8318
D=A // 8319
@SP // 8320
AM=M+1 // 8321
A=A-1 // 8322
M=D // 8323
@3 // 8324
D=A // 8325
@SP // 8326
AM=M+1 // 8327
A=A-1 // 8328
M=D // 8329
@3 // 8330
D=A // 8331
@SP // 8332
AM=M+1 // 8333
A=A-1 // 8334
M=D // 8335
@35 // 8336
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
@63 // 8348
D=A // 8349
@SP // 8350
AM=M+1 // 8351
A=A-1 // 8352
M=D // 8353
@SP // 8354
AM=M+1 // 8355
A=A-1 // 8356
M=0 // 8357
@SP // 8358
AM=M+1 // 8359
A=A-1 // 8360
M=0 // 8361
// call Output.create
@17 // 8362
D=A // 8363
@14 // 8364
M=D // 8365
@Output.create // 8366
D=A // 8367
@13 // 8368
M=D // 8369
@Output.init.ret.46 // 8370
D=A // 8371
@CALL // 8372
0;JMP // 8373
(Output.init.ret.46)
@SP // 8374
M=M-1 // 8375

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 8376
D=A // 8377
@SP // 8378
AM=M+1 // 8379
A=A-1 // 8380
M=D // 8381
@33 // 8382
D=A // 8383
@SP // 8384
AM=M+1 // 8385
A=A-1 // 8386
M=D // 8387
@51 // 8388
D=A // 8389
@SP // 8390
AM=M+1 // 8391
A=A-1 // 8392
M=D // 8393
@63 // 8394
D=A // 8395
@SP // 8396
AM=M+1 // 8397
A=A-1 // 8398
M=D // 8399
@63 // 8400
D=A // 8401
@SP // 8402
AM=M+1 // 8403
A=A-1 // 8404
M=D // 8405
@51 // 8406
D=A // 8407
@SP // 8408
AM=M+1 // 8409
A=A-1 // 8410
M=D // 8411
@51 // 8412
D=A // 8413
@SP // 8414
AM=M+1 // 8415
A=A-1 // 8416
M=D // 8417
@51 // 8418
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
@SP // 8436
AM=M+1 // 8437
A=A-1 // 8438
M=0 // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=0 // 8443
// call Output.create
@17 // 8444
D=A // 8445
@14 // 8446
M=D // 8447
@Output.create // 8448
D=A // 8449
@13 // 8450
M=D // 8451
@Output.init.ret.47 // 8452
D=A // 8453
@CALL // 8454
0;JMP // 8455
(Output.init.ret.47)
@SP // 8456
M=M-1 // 8457

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 8458
D=A // 8459
@SP // 8460
AM=M+1 // 8461
A=A-1 // 8462
M=D // 8463
@51 // 8464
D=A // 8465
@SP // 8466
AM=M+1 // 8467
A=A-1 // 8468
M=D // 8469
@51 // 8470
D=A // 8471
@SP // 8472
AM=M+1 // 8473
A=A-1 // 8474
M=D // 8475
@55 // 8476
D=A // 8477
@SP // 8478
AM=M+1 // 8479
A=A-1 // 8480
M=D // 8481
@55 // 8482
D=A // 8483
@SP // 8484
AM=M+1 // 8485
A=A-1 // 8486
M=D // 8487
@63 // 8488
D=A // 8489
@SP // 8490
AM=M+1 // 8491
A=A-1 // 8492
M=D // 8493
@59 // 8494
D=A // 8495
@SP // 8496
AM=M+1 // 8497
A=A-1 // 8498
M=D // 8499
@59 // 8500
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
@SP // 8518
AM=M+1 // 8519
A=A-1 // 8520
M=0 // 8521
@SP // 8522
AM=M+1 // 8523
A=A-1 // 8524
M=0 // 8525
// call Output.create
@17 // 8526
D=A // 8527
@14 // 8528
M=D // 8529
@Output.create // 8530
D=A // 8531
@13 // 8532
M=D // 8533
@Output.init.ret.48 // 8534
D=A // 8535
@CALL // 8536
0;JMP // 8537
(Output.init.ret.48)
@SP // 8538
M=M-1 // 8539

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 8540
D=A // 8541
@SP // 8542
AM=M+1 // 8543
A=A-1 // 8544
M=D // 8545
@30 // 8546
D=A // 8547
@SP // 8548
AM=M+1 // 8549
A=A-1 // 8550
M=D // 8551
@51 // 8552
D=A // 8553
@SP // 8554
AM=M+1 // 8555
A=A-1 // 8556
M=D // 8557
@51 // 8558
D=A // 8559
@SP // 8560
AM=M+1 // 8561
A=A-1 // 8562
M=D // 8563
@51 // 8564
D=A // 8565
@SP // 8566
AM=M+1 // 8567
A=A-1 // 8568
M=D // 8569
@51 // 8570
D=A // 8571
@SP // 8572
AM=M+1 // 8573
A=A-1 // 8574
M=D // 8575
@51 // 8576
D=A // 8577
@SP // 8578
AM=M+1 // 8579
A=A-1 // 8580
M=D // 8581
@51 // 8582
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
@30 // 8594
D=A // 8595
@SP // 8596
AM=M+1 // 8597
A=A-1 // 8598
M=D // 8599
@SP // 8600
AM=M+1 // 8601
A=A-1 // 8602
M=0 // 8603
@SP // 8604
AM=M+1 // 8605
A=A-1 // 8606
M=0 // 8607
// call Output.create
@17 // 8608
D=A // 8609
@14 // 8610
M=D // 8611
@Output.create // 8612
D=A // 8613
@13 // 8614
M=D // 8615
@Output.init.ret.49 // 8616
D=A // 8617
@CALL // 8618
0;JMP // 8619
(Output.init.ret.49)
@SP // 8620
M=M-1 // 8621

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 8622
D=A // 8623
@SP // 8624
AM=M+1 // 8625
A=A-1 // 8626
M=D // 8627
@31 // 8628
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
@31 // 8652
D=A // 8653
@SP // 8654
AM=M+1 // 8655
A=A-1 // 8656
M=D // 8657
@3 // 8658
D=A // 8659
@SP // 8660
AM=M+1 // 8661
A=A-1 // 8662
M=D // 8663
@3 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669
@3 // 8670
D=A // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=D // 8675
@3 // 8676
D=A // 8677
@SP // 8678
AM=M+1 // 8679
A=A-1 // 8680
M=D // 8681
@SP // 8682
AM=M+1 // 8683
A=A-1 // 8684
M=0 // 8685
@SP // 8686
AM=M+1 // 8687
A=A-1 // 8688
M=0 // 8689
// call Output.create
@17 // 8690
D=A // 8691
@14 // 8692
M=D // 8693
@Output.create // 8694
D=A // 8695
@13 // 8696
M=D // 8697
@Output.init.ret.50 // 8698
D=A // 8699
@CALL // 8700
0;JMP // 8701
(Output.init.ret.50)
@SP // 8702
M=M-1 // 8703

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 8704
D=A // 8705
@SP // 8706
AM=M+1 // 8707
A=A-1 // 8708
M=D // 8709
@30 // 8710
D=A // 8711
@SP // 8712
AM=M+1 // 8713
A=A-1 // 8714
M=D // 8715
@51 // 8716
D=A // 8717
@SP // 8718
AM=M+1 // 8719
A=A-1 // 8720
M=D // 8721
@51 // 8722
D=A // 8723
@SP // 8724
AM=M+1 // 8725
A=A-1 // 8726
M=D // 8727
@51 // 8728
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
@63 // 8746
D=A // 8747
@SP // 8748
AM=M+1 // 8749
A=A-1 // 8750
M=D // 8751
@59 // 8752
D=A // 8753
@SP // 8754
AM=M+1 // 8755
A=A-1 // 8756
M=D // 8757
@30 // 8758
D=A // 8759
@SP // 8760
AM=M+1 // 8761
A=A-1 // 8762
M=D // 8763
@48 // 8764
D=A // 8765
@SP // 8766
AM=M+1 // 8767
A=A-1 // 8768
M=D // 8769
@SP // 8770
AM=M+1 // 8771
A=A-1 // 8772
M=0 // 8773
// call Output.create
@17 // 8774
D=A // 8775
@14 // 8776
M=D // 8777
@Output.create // 8778
D=A // 8779
@13 // 8780
M=D // 8781
@Output.init.ret.51 // 8782
D=A // 8783
@CALL // 8784
0;JMP // 8785
(Output.init.ret.51)
@SP // 8786
M=M-1 // 8787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 8788
D=A // 8789
@SP // 8790
AM=M+1 // 8791
A=A-1 // 8792
M=D // 8793
@31 // 8794
D=A // 8795
@SP // 8796
AM=M+1 // 8797
A=A-1 // 8798
M=D // 8799
@51 // 8800
D=A // 8801
@SP // 8802
AM=M+1 // 8803
A=A-1 // 8804
M=D // 8805
@51 // 8806
D=A // 8807
@SP // 8808
AM=M+1 // 8809
A=A-1 // 8810
M=D // 8811
@51 // 8812
D=A // 8813
@SP // 8814
AM=M+1 // 8815
A=A-1 // 8816
M=D // 8817
@31 // 8818
D=A // 8819
@SP // 8820
AM=M+1 // 8821
A=A-1 // 8822
M=D // 8823
@27 // 8824
D=A // 8825
@SP // 8826
AM=M+1 // 8827
A=A-1 // 8828
M=D // 8829
@51 // 8830
D=A // 8831
@SP // 8832
AM=M+1 // 8833
A=A-1 // 8834
M=D // 8835
@51 // 8836
D=A // 8837
@SP // 8838
AM=M+1 // 8839
A=A-1 // 8840
M=D // 8841
@51 // 8842
D=A // 8843
@SP // 8844
AM=M+1 // 8845
A=A-1 // 8846
M=D // 8847
@SP // 8848
AM=M+1 // 8849
A=A-1 // 8850
M=0 // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=0 // 8855
// call Output.create
@17 // 8856
D=A // 8857
@14 // 8858
M=D // 8859
@Output.create // 8860
D=A // 8861
@13 // 8862
M=D // 8863
@Output.init.ret.52 // 8864
D=A // 8865
@CALL // 8866
0;JMP // 8867
(Output.init.ret.52)
@SP // 8868
M=M-1 // 8869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 8870
D=A // 8871
@SP // 8872
AM=M+1 // 8873
A=A-1 // 8874
M=D // 8875
@30 // 8876
D=A // 8877
@SP // 8878
AM=M+1 // 8879
A=A-1 // 8880
M=D // 8881
@51 // 8882
D=A // 8883
@SP // 8884
AM=M+1 // 8885
A=A-1 // 8886
M=D // 8887
@51 // 8888
D=A // 8889
@SP // 8890
AM=M+1 // 8891
A=A-1 // 8892
M=D // 8893
@6 // 8894
D=A // 8895
@SP // 8896
AM=M+1 // 8897
A=A-1 // 8898
M=D // 8899
@28 // 8900
D=A // 8901
@SP // 8902
AM=M+1 // 8903
A=A-1 // 8904
M=D // 8905
@48 // 8906
D=A // 8907
@SP // 8908
AM=M+1 // 8909
A=A-1 // 8910
M=D // 8911
@51 // 8912
D=A // 8913
@SP // 8914
AM=M+1 // 8915
A=A-1 // 8916
M=D // 8917
@51 // 8918
D=A // 8919
@SP // 8920
AM=M+1 // 8921
A=A-1 // 8922
M=D // 8923
@30 // 8924
D=A // 8925
@SP // 8926
AM=M+1 // 8927
A=A-1 // 8928
M=D // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=0 // 8933
@SP // 8934
AM=M+1 // 8935
A=A-1 // 8936
M=0 // 8937
// call Output.create
@17 // 8938
D=A // 8939
@14 // 8940
M=D // 8941
@Output.create // 8942
D=A // 8943
@13 // 8944
M=D // 8945
@Output.init.ret.53 // 8946
D=A // 8947
@CALL // 8948
0;JMP // 8949
(Output.init.ret.53)
@SP // 8950
M=M-1 // 8951

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 8952
D=A // 8953
@SP // 8954
AM=M+1 // 8955
A=A-1 // 8956
M=D // 8957
@63 // 8958
D=A // 8959
@SP // 8960
AM=M+1 // 8961
A=A-1 // 8962
M=D // 8963
@63 // 8964
D=A // 8965
@SP // 8966
AM=M+1 // 8967
A=A-1 // 8968
M=D // 8969
@45 // 8970
D=A // 8971
@SP // 8972
AM=M+1 // 8973
A=A-1 // 8974
M=D // 8975
@12 // 8976
D=A // 8977
@SP // 8978
AM=M+1 // 8979
A=A-1 // 8980
M=D // 8981
@12 // 8982
D=A // 8983
@SP // 8984
AM=M+1 // 8985
A=A-1 // 8986
M=D // 8987
@12 // 8988
D=A // 8989
@SP // 8990
AM=M+1 // 8991
A=A-1 // 8992
M=D // 8993
@12 // 8994
D=A // 8995
@SP // 8996
AM=M+1 // 8997
A=A-1 // 8998
M=D // 8999
@12 // 9000
D=A // 9001
@SP // 9002
AM=M+1 // 9003
A=A-1 // 9004
M=D // 9005
@30 // 9006
D=A // 9007
@SP // 9008
AM=M+1 // 9009
A=A-1 // 9010
M=D // 9011
@SP // 9012
AM=M+1 // 9013
A=A-1 // 9014
M=0 // 9015
@SP // 9016
AM=M+1 // 9017
A=A-1 // 9018
M=0 // 9019
// call Output.create
@17 // 9020
D=A // 9021
@14 // 9022
M=D // 9023
@Output.create // 9024
D=A // 9025
@13 // 9026
M=D // 9027
@Output.init.ret.54 // 9028
D=A // 9029
@CALL // 9030
0;JMP // 9031
(Output.init.ret.54)
@SP // 9032
M=M-1 // 9033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9034
D=A // 9035
@SP // 9036
AM=M+1 // 9037
A=A-1 // 9038
M=D // 9039
@51 // 9040
D=A // 9041
@SP // 9042
AM=M+1 // 9043
A=A-1 // 9044
M=D // 9045
@51 // 9046
D=A // 9047
@SP // 9048
AM=M+1 // 9049
A=A-1 // 9050
M=D // 9051
@51 // 9052
D=A // 9053
@SP // 9054
AM=M+1 // 9055
A=A-1 // 9056
M=D // 9057
@51 // 9058
D=A // 9059
@SP // 9060
AM=M+1 // 9061
A=A-1 // 9062
M=D // 9063
@51 // 9064
D=A // 9065
@SP // 9066
AM=M+1 // 9067
A=A-1 // 9068
M=D // 9069
@51 // 9070
D=A // 9071
@SP // 9072
AM=M+1 // 9073
A=A-1 // 9074
M=D // 9075
@51 // 9076
D=A // 9077
@SP // 9078
AM=M+1 // 9079
A=A-1 // 9080
M=D // 9081
@51 // 9082
D=A // 9083
@SP // 9084
AM=M+1 // 9085
A=A-1 // 9086
M=D // 9087
@30 // 9088
D=A // 9089
@SP // 9090
AM=M+1 // 9091
A=A-1 // 9092
M=D // 9093
@SP // 9094
AM=M+1 // 9095
A=A-1 // 9096
M=0 // 9097
@SP // 9098
AM=M+1 // 9099
A=A-1 // 9100
M=0 // 9101
// call Output.create
@17 // 9102
D=A // 9103
@14 // 9104
M=D // 9105
@Output.create // 9106
D=A // 9107
@13 // 9108
M=D // 9109
@Output.init.ret.55 // 9110
D=A // 9111
@CALL // 9112
0;JMP // 9113
(Output.init.ret.55)
@SP // 9114
M=M-1 // 9115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9116
D=A // 9117
@SP // 9118
AM=M+1 // 9119
A=A-1 // 9120
M=D // 9121
@51 // 9122
D=A // 9123
@SP // 9124
AM=M+1 // 9125
A=A-1 // 9126
M=D // 9127
@51 // 9128
D=A // 9129
@SP // 9130
AM=M+1 // 9131
A=A-1 // 9132
M=D // 9133
@51 // 9134
D=A // 9135
@SP // 9136
AM=M+1 // 9137
A=A-1 // 9138
M=D // 9139
@51 // 9140
D=A // 9141
@SP // 9142
AM=M+1 // 9143
A=A-1 // 9144
M=D // 9145
@51 // 9146
D=A // 9147
@SP // 9148
AM=M+1 // 9149
A=A-1 // 9150
M=D // 9151
@30 // 9152
D=A // 9153
@SP // 9154
AM=M+1 // 9155
A=A-1 // 9156
M=D // 9157
@30 // 9158
D=A // 9159
@SP // 9160
AM=M+1 // 9161
A=A-1 // 9162
M=D // 9163
@12 // 9164
D=A // 9165
@SP // 9166
AM=M+1 // 9167
A=A-1 // 9168
M=D // 9169
@12 // 9170
D=A // 9171
@SP // 9172
AM=M+1 // 9173
A=A-1 // 9174
M=D // 9175
@SP // 9176
AM=M+1 // 9177
A=A-1 // 9178
M=0 // 9179
@SP // 9180
AM=M+1 // 9181
A=A-1 // 9182
M=0 // 9183
// call Output.create
@17 // 9184
D=A // 9185
@14 // 9186
M=D // 9187
@Output.create // 9188
D=A // 9189
@13 // 9190
M=D // 9191
@Output.init.ret.56 // 9192
D=A // 9193
@CALL // 9194
0;JMP // 9195
(Output.init.ret.56)
@SP // 9196
M=M-1 // 9197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 9198
D=A // 9199
@SP // 9200
AM=M+1 // 9201
A=A-1 // 9202
M=D // 9203
@51 // 9204
D=A // 9205
@SP // 9206
AM=M+1 // 9207
A=A-1 // 9208
M=D // 9209
@51 // 9210
D=A // 9211
@SP // 9212
AM=M+1 // 9213
A=A-1 // 9214
M=D // 9215
@51 // 9216
D=A // 9217
@SP // 9218
AM=M+1 // 9219
A=A-1 // 9220
M=D // 9221
@51 // 9222
D=A // 9223
@SP // 9224
AM=M+1 // 9225
A=A-1 // 9226
M=D // 9227
@51 // 9228
D=A // 9229
@SP // 9230
AM=M+1 // 9231
A=A-1 // 9232
M=D // 9233
@63 // 9234
D=A // 9235
@SP // 9236
AM=M+1 // 9237
A=A-1 // 9238
M=D // 9239
@63 // 9240
D=A // 9241
@SP // 9242
AM=M+1 // 9243
A=A-1 // 9244
M=D // 9245
@63 // 9246
D=A // 9247
@SP // 9248
AM=M+1 // 9249
A=A-1 // 9250
M=D // 9251
@18 // 9252
D=A // 9253
@SP // 9254
AM=M+1 // 9255
A=A-1 // 9256
M=D // 9257
@SP // 9258
AM=M+1 // 9259
A=A-1 // 9260
M=0 // 9261
@SP // 9262
AM=M+1 // 9263
A=A-1 // 9264
M=0 // 9265
// call Output.create
@17 // 9266
D=A // 9267
@14 // 9268
M=D // 9269
@Output.create // 9270
D=A // 9271
@13 // 9272
M=D // 9273
@Output.init.ret.57 // 9274
D=A // 9275
@CALL // 9276
0;JMP // 9277
(Output.init.ret.57)
@SP // 9278
M=M-1 // 9279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 9280
D=A // 9281
@SP // 9282
AM=M+1 // 9283
A=A-1 // 9284
M=D // 9285
@51 // 9286
D=A // 9287
@SP // 9288
AM=M+1 // 9289
A=A-1 // 9290
M=D // 9291
@51 // 9292
D=A // 9293
@SP // 9294
AM=M+1 // 9295
A=A-1 // 9296
M=D // 9297
@30 // 9298
D=A // 9299
@SP // 9300
AM=M+1 // 9301
A=A-1 // 9302
M=D // 9303
@30 // 9304
D=A // 9305
@SP // 9306
AM=M+1 // 9307
A=A-1 // 9308
M=D // 9309
@12 // 9310
D=A // 9311
@SP // 9312
AM=M+1 // 9313
A=A-1 // 9314
M=D // 9315
@30 // 9316
D=A // 9317
@SP // 9318
AM=M+1 // 9319
A=A-1 // 9320
M=D // 9321
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
@51 // 9334
D=A // 9335
@SP // 9336
AM=M+1 // 9337
A=A-1 // 9338
M=D // 9339
@SP // 9340
AM=M+1 // 9341
A=A-1 // 9342
M=0 // 9343
@SP // 9344
AM=M+1 // 9345
A=A-1 // 9346
M=0 // 9347
// call Output.create
@17 // 9348
D=A // 9349
@14 // 9350
M=D // 9351
@Output.create // 9352
D=A // 9353
@13 // 9354
M=D // 9355
@Output.init.ret.58 // 9356
D=A // 9357
@CALL // 9358
0;JMP // 9359
(Output.init.ret.58)
@SP // 9360
M=M-1 // 9361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 9362
D=A // 9363
@SP // 9364
AM=M+1 // 9365
A=A-1 // 9366
M=D // 9367
@51 // 9368
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
@51 // 9380
D=A // 9381
@SP // 9382
AM=M+1 // 9383
A=A-1 // 9384
M=D // 9385
@51 // 9386
D=A // 9387
@SP // 9388
AM=M+1 // 9389
A=A-1 // 9390
M=D // 9391
@30 // 9392
D=A // 9393
@SP // 9394
AM=M+1 // 9395
A=A-1 // 9396
M=D // 9397
@12 // 9398
D=A // 9399
@SP // 9400
AM=M+1 // 9401
A=A-1 // 9402
M=D // 9403
@12 // 9404
D=A // 9405
@SP // 9406
AM=M+1 // 9407
A=A-1 // 9408
M=D // 9409
@12 // 9410
D=A // 9411
@SP // 9412
AM=M+1 // 9413
A=A-1 // 9414
M=D // 9415
@30 // 9416
D=A // 9417
@SP // 9418
AM=M+1 // 9419
A=A-1 // 9420
M=D // 9421
@SP // 9422
AM=M+1 // 9423
A=A-1 // 9424
M=0 // 9425
@SP // 9426
AM=M+1 // 9427
A=A-1 // 9428
M=0 // 9429
// call Output.create
@17 // 9430
D=A // 9431
@14 // 9432
M=D // 9433
@Output.create // 9434
D=A // 9435
@13 // 9436
M=D // 9437
@Output.init.ret.59 // 9438
D=A // 9439
@CALL // 9440
0;JMP // 9441
(Output.init.ret.59)
@SP // 9442
M=M-1 // 9443

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 9444
D=A // 9445
@SP // 9446
AM=M+1 // 9447
A=A-1 // 9448
M=D // 9449
@63 // 9450
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
@49 // 9462
D=A // 9463
@SP // 9464
AM=M+1 // 9465
A=A-1 // 9466
M=D // 9467
@24 // 9468
D=A // 9469
@SP // 9470
AM=M+1 // 9471
A=A-1 // 9472
M=D // 9473
@12 // 9474
D=A // 9475
@SP // 9476
AM=M+1 // 9477
A=A-1 // 9478
M=D // 9479
@6 // 9480
D=A // 9481
@SP // 9482
AM=M+1 // 9483
A=A-1 // 9484
M=D // 9485
@35 // 9486
D=A // 9487
@SP // 9488
AM=M+1 // 9489
A=A-1 // 9490
M=D // 9491
@51 // 9492
D=A // 9493
@SP // 9494
AM=M+1 // 9495
A=A-1 // 9496
M=D // 9497
@63 // 9498
D=A // 9499
@SP // 9500
AM=M+1 // 9501
A=A-1 // 9502
M=D // 9503
@SP // 9504
AM=M+1 // 9505
A=A-1 // 9506
M=0 // 9507
@SP // 9508
AM=M+1 // 9509
A=A-1 // 9510
M=0 // 9511
// call Output.create
@17 // 9512
D=A // 9513
@14 // 9514
M=D // 9515
@Output.create // 9516
D=A // 9517
@13 // 9518
M=D // 9519
@Output.init.ret.60 // 9520
D=A // 9521
@CALL // 9522
0;JMP // 9523
(Output.init.ret.60)
@SP // 9524
M=M-1 // 9525

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 9526
D=A // 9527
@SP // 9528
AM=M+1 // 9529
A=A-1 // 9530
M=D // 9531
@30 // 9532
D=A // 9533
@SP // 9534
AM=M+1 // 9535
A=A-1 // 9536
M=D // 9537
@6 // 9538
D=A // 9539
@SP // 9540
AM=M+1 // 9541
A=A-1 // 9542
M=D // 9543
@6 // 9544
D=A // 9545
@SP // 9546
AM=M+1 // 9547
A=A-1 // 9548
M=D // 9549
@6 // 9550
D=A // 9551
@SP // 9552
AM=M+1 // 9553
A=A-1 // 9554
M=D // 9555
@6 // 9556
D=A // 9557
@SP // 9558
AM=M+1 // 9559
A=A-1 // 9560
M=D // 9561
@6 // 9562
D=A // 9563
@SP // 9564
AM=M+1 // 9565
A=A-1 // 9566
M=D // 9567
@6 // 9568
D=A // 9569
@SP // 9570
AM=M+1 // 9571
A=A-1 // 9572
M=D // 9573
@6 // 9574
D=A // 9575
@SP // 9576
AM=M+1 // 9577
A=A-1 // 9578
M=D // 9579
@30 // 9580
D=A // 9581
@SP // 9582
AM=M+1 // 9583
A=A-1 // 9584
M=D // 9585
@SP // 9586
AM=M+1 // 9587
A=A-1 // 9588
M=0 // 9589
@SP // 9590
AM=M+1 // 9591
A=A-1 // 9592
M=0 // 9593
// call Output.create
@17 // 9594
D=A // 9595
@14 // 9596
M=D // 9597
@Output.create // 9598
D=A // 9599
@13 // 9600
M=D // 9601
@Output.init.ret.61 // 9602
D=A // 9603
@CALL // 9604
0;JMP // 9605
(Output.init.ret.61)
@SP // 9606
M=M-1 // 9607

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9608
D=A // 9609
@SP // 9610
M=D+M // 9611
@92 // 9612
D=A // 9613
@SP // 9614
A=M-1 // 9615
M=1 // 9616
A=A-1 // 9617
M=0 // 9618
A=A-1 // 9619
M=0 // 9620
A=A-1 // 9621
M=D // 9622
A=A-1 // 9623
@3 // 9624
D=A // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=D // 9629
@6 // 9630
D=A // 9631
@SP // 9632
AM=M+1 // 9633
A=A-1 // 9634
M=D // 9635
@12 // 9636
D=A // 9637
@SP // 9638
AM=M+1 // 9639
A=A-1 // 9640
M=D // 9641
@24 // 9642
D=A // 9643
@SP // 9644
AM=M+1 // 9645
A=A-1 // 9646
M=D // 9647
@48 // 9648
D=A // 9649
@SP // 9650
AM=M+1 // 9651
A=A-1 // 9652
M=D // 9653
@32 // 9654
D=A // 9655
@SP // 9656
AM=M+1 // 9657
A=A-1 // 9658
M=D // 9659
@SP // 9660
AM=M+1 // 9661
A=A-1 // 9662
M=0 // 9663
@SP // 9664
AM=M+1 // 9665
A=A-1 // 9666
M=0 // 9667
// call Output.create
@17 // 9668
D=A // 9669
@14 // 9670
M=D // 9671
@Output.create // 9672
D=A // 9673
@13 // 9674
M=D // 9675
@Output.init.ret.62 // 9676
D=A // 9677
@CALL // 9678
0;JMP // 9679
(Output.init.ret.62)
@SP // 9680
M=M-1 // 9681

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 9682
D=A // 9683
@SP // 9684
AM=M+1 // 9685
A=A-1 // 9686
M=D // 9687
@30 // 9688
D=A // 9689
@SP // 9690
AM=M+1 // 9691
A=A-1 // 9692
M=D // 9693
@24 // 9694
D=A // 9695
@SP // 9696
AM=M+1 // 9697
A=A-1 // 9698
M=D // 9699
@24 // 9700
D=A // 9701
@SP // 9702
AM=M+1 // 9703
A=A-1 // 9704
M=D // 9705
@24 // 9706
D=A // 9707
@SP // 9708
AM=M+1 // 9709
A=A-1 // 9710
M=D // 9711
@24 // 9712
D=A // 9713
@SP // 9714
AM=M+1 // 9715
A=A-1 // 9716
M=D // 9717
@24 // 9718
D=A // 9719
@SP // 9720
AM=M+1 // 9721
A=A-1 // 9722
M=D // 9723
@24 // 9724
D=A // 9725
@SP // 9726
AM=M+1 // 9727
A=A-1 // 9728
M=D // 9729
@24 // 9730
D=A // 9731
@SP // 9732
AM=M+1 // 9733
A=A-1 // 9734
M=D // 9735
@30 // 9736
D=A // 9737
@SP // 9738
AM=M+1 // 9739
A=A-1 // 9740
M=D // 9741
@SP // 9742
AM=M+1 // 9743
A=A-1 // 9744
M=0 // 9745
@SP // 9746
AM=M+1 // 9747
A=A-1 // 9748
M=0 // 9749
// call Output.create
@17 // 9750
D=A // 9751
@14 // 9752
M=D // 9753
@Output.create // 9754
D=A // 9755
@13 // 9756
M=D // 9757
@Output.init.ret.63 // 9758
D=A // 9759
@CALL // 9760
0;JMP // 9761
(Output.init.ret.63)
@SP // 9762
M=M-1 // 9763

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 9764
D=A // 9765
@SP // 9766
AM=M+1 // 9767
A=A-1 // 9768
M=D // 9769
@8 // 9770
D=A // 9771
@SP // 9772
AM=M+1 // 9773
A=A-1 // 9774
M=D // 9775
@28 // 9776
D=A // 9777
@SP // 9778
AM=M+1 // 9779
A=A-1 // 9780
M=D // 9781
@54 // 9782
D=A // 9783
@SP // 9784
AM=M+1 // 9785
A=A-1 // 9786
M=D // 9787
@SP // 9788
AM=M+1 // 9789
A=A-1 // 9790
M=0 // 9791
@SP // 9792
AM=M+1 // 9793
A=A-1 // 9794
M=0 // 9795
@SP // 9796
AM=M+1 // 9797
A=A-1 // 9798
M=0 // 9799
@SP // 9800
AM=M+1 // 9801
A=A-1 // 9802
M=0 // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=0 // 9807
@SP // 9808
AM=M+1 // 9809
A=A-1 // 9810
M=0 // 9811
@SP // 9812
AM=M+1 // 9813
A=A-1 // 9814
M=0 // 9815
@SP // 9816
AM=M+1 // 9817
A=A-1 // 9818
M=0 // 9819
// call Output.create
@17 // 9820
D=A // 9821
@14 // 9822
M=D // 9823
@Output.create // 9824
D=A // 9825
@13 // 9826
M=D // 9827
@Output.init.ret.64 // 9828
D=A // 9829
@CALL // 9830
0;JMP // 9831
(Output.init.ret.64)
@SP // 9832
M=M-1 // 9833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 9834
D=A // 9835
@SP // 9836
M=D+M // 9837
@95 // 9838
D=A // 9839
@SP // 9840
A=M-1 // 9841
M=0 // 9842
A=A-1 // 9843
M=0 // 9844
A=A-1 // 9845
M=0 // 9846
A=A-1 // 9847
M=0 // 9848
A=A-1 // 9849
M=0 // 9850
A=A-1 // 9851
M=0 // 9852
A=A-1 // 9853
M=0 // 9854
A=A-1 // 9855
M=0 // 9856
A=A-1 // 9857
M=0 // 9858
A=A-1 // 9859
M=D // 9860
A=A-1 // 9861
@2 // 9862
D=A // 9863
@SP // 9864
M=D+M // 9865
@63 // 9866
D=A // 9867
@SP // 9868
A=M-1 // 9869
M=0 // 9870
A=A-1 // 9871
M=D // 9872
A=A-1 // 9873
// call Output.create
@17 // 9874
D=A // 9875
@14 // 9876
M=D // 9877
@Output.create // 9878
D=A // 9879
@13 // 9880
M=D // 9881
@Output.init.ret.65 // 9882
D=A // 9883
@CALL // 9884
0;JMP // 9885
(Output.init.ret.65)
@SP // 9886
M=M-1 // 9887

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 9888
D=A // 9889
@SP // 9890
AM=M+1 // 9891
A=A-1 // 9892
M=D // 9893
@6 // 9894
D=A // 9895
@SP // 9896
AM=M+1 // 9897
A=A-1 // 9898
M=D // 9899
@12 // 9900
D=A // 9901
@SP // 9902
AM=M+1 // 9903
A=A-1 // 9904
M=D // 9905
@24 // 9906
D=A // 9907
@SP // 9908
AM=M+1 // 9909
A=A-1 // 9910
M=D // 9911
@SP // 9912
AM=M+1 // 9913
A=A-1 // 9914
M=0 // 9915
@SP // 9916
AM=M+1 // 9917
A=A-1 // 9918
M=0 // 9919
@SP // 9920
AM=M+1 // 9921
A=A-1 // 9922
M=0 // 9923
@SP // 9924
AM=M+1 // 9925
A=A-1 // 9926
M=0 // 9927
@SP // 9928
AM=M+1 // 9929
A=A-1 // 9930
M=0 // 9931
@SP // 9932
AM=M+1 // 9933
A=A-1 // 9934
M=0 // 9935
@SP // 9936
AM=M+1 // 9937
A=A-1 // 9938
M=0 // 9939
@SP // 9940
AM=M+1 // 9941
A=A-1 // 9942
M=0 // 9943
// call Output.create
@17 // 9944
D=A // 9945
@14 // 9946
M=D // 9947
@Output.create // 9948
D=A // 9949
@13 // 9950
M=D // 9951
@Output.init.ret.66 // 9952
D=A // 9953
@CALL // 9954
0;JMP // 9955
(Output.init.ret.66)
@SP // 9956
M=M-1 // 9957

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 9958
D=A // 9959
@SP // 9960
M=D+M // 9961
@97 // 9962
D=A // 9963
@SP // 9964
A=M-1 // 9965
M=0 // 9966
A=A-1 // 9967
M=0 // 9968
A=A-1 // 9969
M=0 // 9970
A=A-1 // 9971
M=D // 9972
A=A-1 // 9973
@14 // 9974
D=A // 9975
@SP // 9976
AM=M+1 // 9977
A=A-1 // 9978
M=D // 9979
@24 // 9980
D=A // 9981
@SP // 9982
AM=M+1 // 9983
A=A-1 // 9984
M=D // 9985
@30 // 9986
D=A // 9987
@SP // 9988
AM=M+1 // 9989
A=A-1 // 9990
M=D // 9991
@27 // 9992
D=A // 9993
@SP // 9994
AM=M+1 // 9995
A=A-1 // 9996
M=D // 9997
@27 // 9998
D=A // 9999
@SP // 10000
AM=M+1 // 10001
A=A-1 // 10002
M=D // 10003
@54 // 10004
D=A // 10005
@SP // 10006
AM=M+1 // 10007
A=A-1 // 10008
M=D // 10009
@SP // 10010
AM=M+1 // 10011
A=A-1 // 10012
M=0 // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=0 // 10017
// call Output.create
@17 // 10018
D=A // 10019
@14 // 10020
M=D // 10021
@Output.create // 10022
D=A // 10023
@13 // 10024
M=D // 10025
@Output.init.ret.67 // 10026
D=A // 10027
@CALL // 10028
0;JMP // 10029
(Output.init.ret.67)
@SP // 10030
M=M-1 // 10031

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10032
D=A // 10033
@SP // 10034
AM=M+1 // 10035
A=A-1 // 10036
M=D // 10037
@3 // 10038
D=A // 10039
@SP // 10040
AM=M+1 // 10041
A=A-1 // 10042
M=D // 10043
@3 // 10044
D=A // 10045
@SP // 10046
AM=M+1 // 10047
A=A-1 // 10048
M=D // 10049
@3 // 10050
D=A // 10051
@SP // 10052
AM=M+1 // 10053
A=A-1 // 10054
M=D // 10055
@15 // 10056
D=A // 10057
@SP // 10058
AM=M+1 // 10059
A=A-1 // 10060
M=D // 10061
@27 // 10062
D=A // 10063
@SP // 10064
AM=M+1 // 10065
A=A-1 // 10066
M=D // 10067
@51 // 10068
D=A // 10069
@SP // 10070
AM=M+1 // 10071
A=A-1 // 10072
M=D // 10073
@51 // 10074
D=A // 10075
@SP // 10076
AM=M+1 // 10077
A=A-1 // 10078
M=D // 10079
@51 // 10080
D=A // 10081
@SP // 10082
AM=M+1 // 10083
A=A-1 // 10084
M=D // 10085
@30 // 10086
D=A // 10087
@SP // 10088
AM=M+1 // 10089
A=A-1 // 10090
M=D // 10091
@SP // 10092
AM=M+1 // 10093
A=A-1 // 10094
M=0 // 10095
@SP // 10096
AM=M+1 // 10097
A=A-1 // 10098
M=0 // 10099
// call Output.create
@17 // 10100
D=A // 10101
@14 // 10102
M=D // 10103
@Output.create // 10104
D=A // 10105
@13 // 10106
M=D // 10107
@Output.init.ret.68 // 10108
D=A // 10109
@CALL // 10110
0;JMP // 10111
(Output.init.ret.68)
@SP // 10112
M=M-1 // 10113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10114
D=A // 10115
@SP // 10116
M=D+M // 10117
@99 // 10118
D=A // 10119
@SP // 10120
A=M-1 // 10121
M=0 // 10122
A=A-1 // 10123
M=0 // 10124
A=A-1 // 10125
M=0 // 10126
A=A-1 // 10127
M=D // 10128
A=A-1 // 10129
@30 // 10130
D=A // 10131
@SP // 10132
AM=M+1 // 10133
A=A-1 // 10134
M=D // 10135
@51 // 10136
D=A // 10137
@SP // 10138
AM=M+1 // 10139
A=A-1 // 10140
M=D // 10141
@3 // 10142
D=A // 10143
@SP // 10144
AM=M+1 // 10145
A=A-1 // 10146
M=D // 10147
@3 // 10148
D=A // 10149
@SP // 10150
AM=M+1 // 10151
A=A-1 // 10152
M=D // 10153
@51 // 10154
D=A // 10155
@SP // 10156
AM=M+1 // 10157
A=A-1 // 10158
M=D // 10159
@30 // 10160
D=A // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=D // 10165
@SP // 10166
AM=M+1 // 10167
A=A-1 // 10168
M=0 // 10169
@SP // 10170
AM=M+1 // 10171
A=A-1 // 10172
M=0 // 10173
// call Output.create
@17 // 10174
D=A // 10175
@14 // 10176
M=D // 10177
@Output.create // 10178
D=A // 10179
@13 // 10180
M=D // 10181
@Output.init.ret.69 // 10182
D=A // 10183
@CALL // 10184
0;JMP // 10185
(Output.init.ret.69)
@SP // 10186
M=M-1 // 10187

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 10188
D=A // 10189
@SP // 10190
AM=M+1 // 10191
A=A-1 // 10192
M=D // 10193
@48 // 10194
D=A // 10195
@SP // 10196
AM=M+1 // 10197
A=A-1 // 10198
M=D // 10199
@48 // 10200
D=A // 10201
@SP // 10202
AM=M+1 // 10203
A=A-1 // 10204
M=D // 10205
@48 // 10206
D=A // 10207
@SP // 10208
AM=M+1 // 10209
A=A-1 // 10210
M=D // 10211
@60 // 10212
D=A // 10213
@SP // 10214
AM=M+1 // 10215
A=A-1 // 10216
M=D // 10217
@54 // 10218
D=A // 10219
@SP // 10220
AM=M+1 // 10221
A=A-1 // 10222
M=D // 10223
@51 // 10224
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
@30 // 10242
D=A // 10243
@SP // 10244
AM=M+1 // 10245
A=A-1 // 10246
M=D // 10247
@SP // 10248
AM=M+1 // 10249
A=A-1 // 10250
M=0 // 10251
@SP // 10252
AM=M+1 // 10253
A=A-1 // 10254
M=0 // 10255
// call Output.create
@17 // 10256
D=A // 10257
@14 // 10258
M=D // 10259
@Output.create // 10260
D=A // 10261
@13 // 10262
M=D // 10263
@Output.init.ret.70 // 10264
D=A // 10265
@CALL // 10266
0;JMP // 10267
(Output.init.ret.70)
@SP // 10268
M=M-1 // 10269

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10270
D=A // 10271
@SP // 10272
M=D+M // 10273
@101 // 10274
D=A // 10275
@SP // 10276
A=M-1 // 10277
M=0 // 10278
A=A-1 // 10279
M=0 // 10280
A=A-1 // 10281
M=0 // 10282
A=A-1 // 10283
M=D // 10284
A=A-1 // 10285
@30 // 10286
D=A // 10287
@SP // 10288
AM=M+1 // 10289
A=A-1 // 10290
M=D // 10291
@51 // 10292
D=A // 10293
@SP // 10294
AM=M+1 // 10295
A=A-1 // 10296
M=D // 10297
@63 // 10298
D=A // 10299
@SP // 10300
AM=M+1 // 10301
A=A-1 // 10302
M=D // 10303
@3 // 10304
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
@30 // 10316
D=A // 10317
@SP // 10318
AM=M+1 // 10319
A=A-1 // 10320
M=D // 10321
@SP // 10322
AM=M+1 // 10323
A=A-1 // 10324
M=0 // 10325
@SP // 10326
AM=M+1 // 10327
A=A-1 // 10328
M=0 // 10329
// call Output.create
@17 // 10330
D=A // 10331
@14 // 10332
M=D // 10333
@Output.create // 10334
D=A // 10335
@13 // 10336
M=D // 10337
@Output.init.ret.71 // 10338
D=A // 10339
@CALL // 10340
0;JMP // 10341
(Output.init.ret.71)
@SP // 10342
M=M-1 // 10343

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 10344
D=A // 10345
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=D // 10349
@28 // 10350
D=A // 10351
@SP // 10352
AM=M+1 // 10353
A=A-1 // 10354
M=D // 10355
@54 // 10356
D=A // 10357
@SP // 10358
AM=M+1 // 10359
A=A-1 // 10360
M=D // 10361
@38 // 10362
D=A // 10363
@SP // 10364
AM=M+1 // 10365
A=A-1 // 10366
M=D // 10367
@6 // 10368
D=A // 10369
@SP // 10370
AM=M+1 // 10371
A=A-1 // 10372
M=D // 10373
@15 // 10374
D=A // 10375
@SP // 10376
AM=M+1 // 10377
A=A-1 // 10378
M=D // 10379
@6 // 10380
D=A // 10381
@SP // 10382
AM=M+1 // 10383
A=A-1 // 10384
M=D // 10385
@6 // 10386
D=A // 10387
@SP // 10388
AM=M+1 // 10389
A=A-1 // 10390
M=D // 10391
@6 // 10392
D=A // 10393
@SP // 10394
AM=M+1 // 10395
A=A-1 // 10396
M=D // 10397
@15 // 10398
D=A // 10399
@SP // 10400
AM=M+1 // 10401
A=A-1 // 10402
M=D // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=0 // 10407
@SP // 10408
AM=M+1 // 10409
A=A-1 // 10410
M=0 // 10411
// call Output.create
@17 // 10412
D=A // 10413
@14 // 10414
M=D // 10415
@Output.create // 10416
D=A // 10417
@13 // 10418
M=D // 10419
@Output.init.ret.72 // 10420
D=A // 10421
@CALL // 10422
0;JMP // 10423
(Output.init.ret.72)
@SP // 10424
M=M-1 // 10425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 10426
D=A // 10427
@SP // 10428
M=D+M // 10429
@103 // 10430
D=A // 10431
@SP // 10432
A=M-1 // 10433
M=0 // 10434
A=A-1 // 10435
M=0 // 10436
A=A-1 // 10437
M=D // 10438
A=A-1 // 10439
@30 // 10440
D=A // 10441
@SP // 10442
AM=M+1 // 10443
A=A-1 // 10444
M=D // 10445
@51 // 10446
D=A // 10447
@SP // 10448
AM=M+1 // 10449
A=A-1 // 10450
M=D // 10451
@51 // 10452
D=A // 10453
@SP // 10454
AM=M+1 // 10455
A=A-1 // 10456
M=D // 10457
@51 // 10458
D=A // 10459
@SP // 10460
AM=M+1 // 10461
A=A-1 // 10462
M=D // 10463
@62 // 10464
D=A // 10465
@SP // 10466
AM=M+1 // 10467
A=A-1 // 10468
M=D // 10469
@48 // 10470
D=A // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=D // 10475
@51 // 10476
D=A // 10477
@SP // 10478
AM=M+1 // 10479
A=A-1 // 10480
M=D // 10481
@30 // 10482
D=A // 10483
@SP // 10484
AM=M+1 // 10485
A=A-1 // 10486
M=D // 10487
@SP // 10488
AM=M+1 // 10489
A=A-1 // 10490
M=0 // 10491
// call Output.create
@17 // 10492
D=A // 10493
@14 // 10494
M=D // 10495
@Output.create // 10496
D=A // 10497
@13 // 10498
M=D // 10499
@Output.init.ret.73 // 10500
D=A // 10501
@CALL // 10502
0;JMP // 10503
(Output.init.ret.73)
@SP // 10504
M=M-1 // 10505

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 10506
D=A // 10507
@SP // 10508
AM=M+1 // 10509
A=A-1 // 10510
M=D // 10511
@3 // 10512
D=A // 10513
@SP // 10514
AM=M+1 // 10515
A=A-1 // 10516
M=D // 10517
@3 // 10518
D=A // 10519
@SP // 10520
AM=M+1 // 10521
A=A-1 // 10522
M=D // 10523
@3 // 10524
D=A // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=D // 10529
@27 // 10530
D=A // 10531
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=D // 10535
@55 // 10536
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
@51 // 10548
D=A // 10549
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=D // 10553
@51 // 10554
D=A // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=D // 10559
@51 // 10560
D=A // 10561
@SP // 10562
AM=M+1 // 10563
A=A-1 // 10564
M=D // 10565
@SP // 10566
AM=M+1 // 10567
A=A-1 // 10568
M=0 // 10569
@SP // 10570
AM=M+1 // 10571
A=A-1 // 10572
M=0 // 10573
// call Output.create
@17 // 10574
D=A // 10575
@14 // 10576
M=D // 10577
@Output.create // 10578
D=A // 10579
@13 // 10580
M=D // 10581
@Output.init.ret.74 // 10582
D=A // 10583
@CALL // 10584
0;JMP // 10585
(Output.init.ret.74)
@SP // 10586
M=M-1 // 10587

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 10588
D=A // 10589
@SP // 10590
AM=M+1 // 10591
A=A-1 // 10592
M=D // 10593
@12 // 10594
D=A // 10595
@SP // 10596
AM=M+1 // 10597
A=A-1 // 10598
M=D // 10599
@12 // 10600
D=A // 10601
@SP // 10602
AM=M+1 // 10603
A=A-1 // 10604
M=D // 10605
@SP // 10606
AM=M+1 // 10607
A=A-1 // 10608
M=0 // 10609
@14 // 10610
D=A // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=D // 10615
@12 // 10616
D=A // 10617
@SP // 10618
AM=M+1 // 10619
A=A-1 // 10620
M=D // 10621
@12 // 10622
D=A // 10623
@SP // 10624
AM=M+1 // 10625
A=A-1 // 10626
M=D // 10627
@12 // 10628
D=A // 10629
@SP // 10630
AM=M+1 // 10631
A=A-1 // 10632
M=D // 10633
@12 // 10634
D=A // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=D // 10639
@30 // 10640
D=A // 10641
@SP // 10642
AM=M+1 // 10643
A=A-1 // 10644
M=D // 10645
@SP // 10646
AM=M+1 // 10647
A=A-1 // 10648
M=0 // 10649
@SP // 10650
AM=M+1 // 10651
A=A-1 // 10652
M=0 // 10653
// call Output.create
@17 // 10654
D=A // 10655
@14 // 10656
M=D // 10657
@Output.create // 10658
D=A // 10659
@13 // 10660
M=D // 10661
@Output.init.ret.75 // 10662
D=A // 10663
@CALL // 10664
0;JMP // 10665
(Output.init.ret.75)
@SP // 10666
M=M-1 // 10667

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 10668
D=A // 10669
@SP // 10670
AM=M+1 // 10671
A=A-1 // 10672
M=D // 10673
@48 // 10674
D=A // 10675
@SP // 10676
AM=M+1 // 10677
A=A-1 // 10678
M=D // 10679
@48 // 10680
D=A // 10681
@SP // 10682
AM=M+1 // 10683
A=A-1 // 10684
M=D // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=0 // 10689
@56 // 10690
D=A // 10691
@SP // 10692
AM=M+1 // 10693
A=A-1 // 10694
M=D // 10695
@48 // 10696
D=A // 10697
@SP // 10698
AM=M+1 // 10699
A=A-1 // 10700
M=D // 10701
@48 // 10702
D=A // 10703
@SP // 10704
AM=M+1 // 10705
A=A-1 // 10706
M=D // 10707
@48 // 10708
D=A // 10709
@SP // 10710
AM=M+1 // 10711
A=A-1 // 10712
M=D // 10713
@48 // 10714
D=A // 10715
@SP // 10716
AM=M+1 // 10717
A=A-1 // 10718
M=D // 10719
@51 // 10720
D=A // 10721
@SP // 10722
AM=M+1 // 10723
A=A-1 // 10724
M=D // 10725
@30 // 10726
D=A // 10727
@SP // 10728
AM=M+1 // 10729
A=A-1 // 10730
M=D // 10731
@SP // 10732
AM=M+1 // 10733
A=A-1 // 10734
M=0 // 10735
// call Output.create
@17 // 10736
D=A // 10737
@14 // 10738
M=D // 10739
@Output.create // 10740
D=A // 10741
@13 // 10742
M=D // 10743
@Output.init.ret.76 // 10744
D=A // 10745
@CALL // 10746
0;JMP // 10747
(Output.init.ret.76)
@SP // 10748
M=M-1 // 10749

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 10750
D=A // 10751
@SP // 10752
AM=M+1 // 10753
A=A-1 // 10754
M=D // 10755
@3 // 10756
D=A // 10757
@SP // 10758
AM=M+1 // 10759
A=A-1 // 10760
M=D // 10761
@3 // 10762
D=A // 10763
@SP // 10764
AM=M+1 // 10765
A=A-1 // 10766
M=D // 10767
@3 // 10768
D=A // 10769
@SP // 10770
AM=M+1 // 10771
A=A-1 // 10772
M=D // 10773
@51 // 10774
D=A // 10775
@SP // 10776
AM=M+1 // 10777
A=A-1 // 10778
M=D // 10779
@27 // 10780
D=A // 10781
@SP // 10782
AM=M+1 // 10783
A=A-1 // 10784
M=D // 10785
@15 // 10786
D=A // 10787
@SP // 10788
AM=M+1 // 10789
A=A-1 // 10790
M=D // 10791
@15 // 10792
D=A // 10793
@SP // 10794
AM=M+1 // 10795
A=A-1 // 10796
M=D // 10797
@27 // 10798
D=A // 10799
@SP // 10800
AM=M+1 // 10801
A=A-1 // 10802
M=D // 10803
@51 // 10804
D=A // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=D // 10809
@SP // 10810
AM=M+1 // 10811
A=A-1 // 10812
M=0 // 10813
@SP // 10814
AM=M+1 // 10815
A=A-1 // 10816
M=0 // 10817
// call Output.create
@17 // 10818
D=A // 10819
@14 // 10820
M=D // 10821
@Output.create // 10822
D=A // 10823
@13 // 10824
M=D // 10825
@Output.init.ret.77 // 10826
D=A // 10827
@CALL // 10828
0;JMP // 10829
(Output.init.ret.77)
@SP // 10830
M=M-1 // 10831

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 10832
D=A // 10833
@SP // 10834
AM=M+1 // 10835
A=A-1 // 10836
M=D // 10837
@14 // 10838
D=A // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=D // 10843
@12 // 10844
D=A // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=D // 10849
@12 // 10850
D=A // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=D // 10855
@12 // 10856
D=A // 10857
@SP // 10858
AM=M+1 // 10859
A=A-1 // 10860
M=D // 10861
@12 // 10862
D=A // 10863
@SP // 10864
AM=M+1 // 10865
A=A-1 // 10866
M=D // 10867
@12 // 10868
D=A // 10869
@SP // 10870
AM=M+1 // 10871
A=A-1 // 10872
M=D // 10873
@12 // 10874
D=A // 10875
@SP // 10876
AM=M+1 // 10877
A=A-1 // 10878
M=D // 10879
@12 // 10880
D=A // 10881
@SP // 10882
AM=M+1 // 10883
A=A-1 // 10884
M=D // 10885
@30 // 10886
D=A // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=D // 10891
@SP // 10892
AM=M+1 // 10893
A=A-1 // 10894
M=0 // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=0 // 10899
// call Output.create
@17 // 10900
D=A // 10901
@14 // 10902
M=D // 10903
@Output.create // 10904
D=A // 10905
@13 // 10906
M=D // 10907
@Output.init.ret.78 // 10908
D=A // 10909
@CALL // 10910
0;JMP // 10911
(Output.init.ret.78)
@SP // 10912
M=M-1 // 10913

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10914
D=A // 10915
@SP // 10916
M=D+M // 10917
@109 // 10918
D=A // 10919
@SP // 10920
A=M-1 // 10921
M=0 // 10922
A=A-1 // 10923
M=0 // 10924
A=A-1 // 10925
M=0 // 10926
A=A-1 // 10927
M=D // 10928
A=A-1 // 10929
@29 // 10930
D=A // 10931
@SP // 10932
AM=M+1 // 10933
A=A-1 // 10934
M=D // 10935
@63 // 10936
D=A // 10937
@SP // 10938
AM=M+1 // 10939
A=A-1 // 10940
M=D // 10941
@43 // 10942
D=A // 10943
@SP // 10944
AM=M+1 // 10945
A=A-1 // 10946
M=D // 10947
@43 // 10948
D=A // 10949
@SP // 10950
AM=M+1 // 10951
A=A-1 // 10952
M=D // 10953
@43 // 10954
D=A // 10955
@SP // 10956
AM=M+1 // 10957
A=A-1 // 10958
M=D // 10959
@43 // 10960
D=A // 10961
@SP // 10962
AM=M+1 // 10963
A=A-1 // 10964
M=D // 10965
@SP // 10966
AM=M+1 // 10967
A=A-1 // 10968
M=0 // 10969
@SP // 10970
AM=M+1 // 10971
A=A-1 // 10972
M=0 // 10973
// call Output.create
@17 // 10974
D=A // 10975
@14 // 10976
M=D // 10977
@Output.create // 10978
D=A // 10979
@13 // 10980
M=D // 10981
@Output.init.ret.79 // 10982
D=A // 10983
@CALL // 10984
0;JMP // 10985
(Output.init.ret.79)
@SP // 10986
M=M-1 // 10987

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10988
D=A // 10989
@SP // 10990
M=D+M // 10991
@110 // 10992
D=A // 10993
@SP // 10994
A=M-1 // 10995
M=0 // 10996
A=A-1 // 10997
M=0 // 10998
A=A-1 // 10999
M=0 // 11000
A=A-1 // 11001
M=D // 11002
A=A-1 // 11003
@29 // 11004
D=A // 11005
@SP // 11006
AM=M+1 // 11007
A=A-1 // 11008
M=D // 11009
@51 // 11010
D=A // 11011
@SP // 11012
AM=M+1 // 11013
A=A-1 // 11014
M=D // 11015
@51 // 11016
D=A // 11017
@SP // 11018
AM=M+1 // 11019
A=A-1 // 11020
M=D // 11021
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
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=0 // 11043
@SP // 11044
AM=M+1 // 11045
A=A-1 // 11046
M=0 // 11047
// call Output.create
@17 // 11048
D=A // 11049
@14 // 11050
M=D // 11051
@Output.create // 11052
D=A // 11053
@13 // 11054
M=D // 11055
@Output.init.ret.80 // 11056
D=A // 11057
@CALL // 11058
0;JMP // 11059
(Output.init.ret.80)
@SP // 11060
M=M-1 // 11061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11062
D=A // 11063
@SP // 11064
M=D+M // 11065
@111 // 11066
D=A // 11067
@SP // 11068
A=M-1 // 11069
M=0 // 11070
A=A-1 // 11071
M=0 // 11072
A=A-1 // 11073
M=0 // 11074
A=A-1 // 11075
M=D // 11076
A=A-1 // 11077
@30 // 11078
D=A // 11079
@SP // 11080
AM=M+1 // 11081
A=A-1 // 11082
M=D // 11083
@51 // 11084
D=A // 11085
@SP // 11086
AM=M+1 // 11087
A=A-1 // 11088
M=D // 11089
@51 // 11090
D=A // 11091
@SP // 11092
AM=M+1 // 11093
A=A-1 // 11094
M=D // 11095
@51 // 11096
D=A // 11097
@SP // 11098
AM=M+1 // 11099
A=A-1 // 11100
M=D // 11101
@51 // 11102
D=A // 11103
@SP // 11104
AM=M+1 // 11105
A=A-1 // 11106
M=D // 11107
@30 // 11108
D=A // 11109
@SP // 11110
AM=M+1 // 11111
A=A-1 // 11112
M=D // 11113
@SP // 11114
AM=M+1 // 11115
A=A-1 // 11116
M=0 // 11117
@SP // 11118
AM=M+1 // 11119
A=A-1 // 11120
M=0 // 11121
// call Output.create
@17 // 11122
D=A // 11123
@14 // 11124
M=D // 11125
@Output.create // 11126
D=A // 11127
@13 // 11128
M=D // 11129
@Output.init.ret.81 // 11130
D=A // 11131
@CALL // 11132
0;JMP // 11133
(Output.init.ret.81)
@SP // 11134
M=M-1 // 11135

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11136
D=A // 11137
@SP // 11138
M=D+M // 11139
@112 // 11140
D=A // 11141
@SP // 11142
A=M-1 // 11143
M=0 // 11144
A=A-1 // 11145
M=0 // 11146
A=A-1 // 11147
M=0 // 11148
A=A-1 // 11149
M=D // 11150
A=A-1 // 11151
@30 // 11152
D=A // 11153
@SP // 11154
AM=M+1 // 11155
A=A-1 // 11156
M=D // 11157
@51 // 11158
D=A // 11159
@SP // 11160
AM=M+1 // 11161
A=A-1 // 11162
M=D // 11163
@51 // 11164
D=A // 11165
@SP // 11166
AM=M+1 // 11167
A=A-1 // 11168
M=D // 11169
@51 // 11170
D=A // 11171
@SP // 11172
AM=M+1 // 11173
A=A-1 // 11174
M=D // 11175
@31 // 11176
D=A // 11177
@SP // 11178
AM=M+1 // 11179
A=A-1 // 11180
M=D // 11181
@3 // 11182
D=A // 11183
@SP // 11184
AM=M+1 // 11185
A=A-1 // 11186
M=D // 11187
@3 // 11188
D=A // 11189
@SP // 11190
AM=M+1 // 11191
A=A-1 // 11192
M=D // 11193
@SP // 11194
AM=M+1 // 11195
A=A-1 // 11196
M=0 // 11197
// call Output.create
@17 // 11198
D=A // 11199
@14 // 11200
M=D // 11201
@Output.create // 11202
D=A // 11203
@13 // 11204
M=D // 11205
@Output.init.ret.82 // 11206
D=A // 11207
@CALL // 11208
0;JMP // 11209
(Output.init.ret.82)
@SP // 11210
M=M-1 // 11211

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11212
D=A // 11213
@SP // 11214
M=D+M // 11215
@113 // 11216
D=A // 11217
@SP // 11218
A=M-1 // 11219
M=0 // 11220
A=A-1 // 11221
M=0 // 11222
A=A-1 // 11223
M=0 // 11224
A=A-1 // 11225
M=D // 11226
A=A-1 // 11227
@30 // 11228
D=A // 11229
@SP // 11230
AM=M+1 // 11231
A=A-1 // 11232
M=D // 11233
@51 // 11234
D=A // 11235
@SP // 11236
AM=M+1 // 11237
A=A-1 // 11238
M=D // 11239
@51 // 11240
D=A // 11241
@SP // 11242
AM=M+1 // 11243
A=A-1 // 11244
M=D // 11245
@51 // 11246
D=A // 11247
@SP // 11248
AM=M+1 // 11249
A=A-1 // 11250
M=D // 11251
@62 // 11252
D=A // 11253
@SP // 11254
AM=M+1 // 11255
A=A-1 // 11256
M=D // 11257
@48 // 11258
D=A // 11259
@SP // 11260
AM=M+1 // 11261
A=A-1 // 11262
M=D // 11263
@48 // 11264
D=A // 11265
@SP // 11266
AM=M+1 // 11267
A=A-1 // 11268
M=D // 11269
@SP // 11270
AM=M+1 // 11271
A=A-1 // 11272
M=0 // 11273
// call Output.create
@17 // 11274
D=A // 11275
@14 // 11276
M=D // 11277
@Output.create // 11278
D=A // 11279
@13 // 11280
M=D // 11281
@Output.init.ret.83 // 11282
D=A // 11283
@CALL // 11284
0;JMP // 11285
(Output.init.ret.83)
@SP // 11286
M=M-1 // 11287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11288
D=A // 11289
@SP // 11290
M=D+M // 11291
@114 // 11292
D=A // 11293
@SP // 11294
A=M-1 // 11295
M=0 // 11296
A=A-1 // 11297
M=0 // 11298
A=A-1 // 11299
M=0 // 11300
A=A-1 // 11301
M=D // 11302
A=A-1 // 11303
@29 // 11304
D=A // 11305
@SP // 11306
AM=M+1 // 11307
A=A-1 // 11308
M=D // 11309
@55 // 11310
D=A // 11311
@SP // 11312
AM=M+1 // 11313
A=A-1 // 11314
M=D // 11315
@51 // 11316
D=A // 11317
@SP // 11318
AM=M+1 // 11319
A=A-1 // 11320
M=D // 11321
@3 // 11322
D=A // 11323
@SP // 11324
AM=M+1 // 11325
A=A-1 // 11326
M=D // 11327
@3 // 11328
D=A // 11329
@SP // 11330
AM=M+1 // 11331
A=A-1 // 11332
M=D // 11333
@7 // 11334
D=A // 11335
@SP // 11336
AM=M+1 // 11337
A=A-1 // 11338
M=D // 11339
@SP // 11340
AM=M+1 // 11341
A=A-1 // 11342
M=0 // 11343
@SP // 11344
AM=M+1 // 11345
A=A-1 // 11346
M=0 // 11347
// call Output.create
@17 // 11348
D=A // 11349
@14 // 11350
M=D // 11351
@Output.create // 11352
D=A // 11353
@13 // 11354
M=D // 11355
@Output.init.ret.84 // 11356
D=A // 11357
@CALL // 11358
0;JMP // 11359
(Output.init.ret.84)
@SP // 11360
M=M-1 // 11361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11362
D=A // 11363
@SP // 11364
M=D+M // 11365
@115 // 11366
D=A // 11367
@SP // 11368
A=M-1 // 11369
M=0 // 11370
A=A-1 // 11371
M=0 // 11372
A=A-1 // 11373
M=0 // 11374
A=A-1 // 11375
M=D // 11376
A=A-1 // 11377
@30 // 11378
D=A // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=D // 11383
@51 // 11384
D=A // 11385
@SP // 11386
AM=M+1 // 11387
A=A-1 // 11388
M=D // 11389
@6 // 11390
D=A // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=D // 11395
@24 // 11396
D=A // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=D // 11401
@51 // 11402
D=A // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=D // 11407
@30 // 11408
D=A // 11409
@SP // 11410
AM=M+1 // 11411
A=A-1 // 11412
M=D // 11413
@SP // 11414
AM=M+1 // 11415
A=A-1 // 11416
M=0 // 11417
@SP // 11418
AM=M+1 // 11419
A=A-1 // 11420
M=0 // 11421
// call Output.create
@17 // 11422
D=A // 11423
@14 // 11424
M=D // 11425
@Output.create // 11426
D=A // 11427
@13 // 11428
M=D // 11429
@Output.init.ret.85 // 11430
D=A // 11431
@CALL // 11432
0;JMP // 11433
(Output.init.ret.85)
@SP // 11434
M=M-1 // 11435

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 11436
D=A // 11437
@SP // 11438
AM=M+1 // 11439
A=A-1 // 11440
M=D // 11441
@4 // 11442
D=A // 11443
@SP // 11444
AM=M+1 // 11445
A=A-1 // 11446
M=D // 11447
@6 // 11448
D=A // 11449
@SP // 11450
AM=M+1 // 11451
A=A-1 // 11452
M=D // 11453
@6 // 11454
D=A // 11455
@SP // 11456
AM=M+1 // 11457
A=A-1 // 11458
M=D // 11459
@15 // 11460
D=A // 11461
@SP // 11462
AM=M+1 // 11463
A=A-1 // 11464
M=D // 11465
@6 // 11466
D=A // 11467
@SP // 11468
AM=M+1 // 11469
A=A-1 // 11470
M=D // 11471
@6 // 11472
D=A // 11473
@SP // 11474
AM=M+1 // 11475
A=A-1 // 11476
M=D // 11477
@6 // 11478
D=A // 11479
@SP // 11480
AM=M+1 // 11481
A=A-1 // 11482
M=D // 11483
@54 // 11484
D=A // 11485
@SP // 11486
AM=M+1 // 11487
A=A-1 // 11488
M=D // 11489
@28 // 11490
D=A // 11491
@SP // 11492
AM=M+1 // 11493
A=A-1 // 11494
M=D // 11495
@SP // 11496
AM=M+1 // 11497
A=A-1 // 11498
M=0 // 11499
@SP // 11500
AM=M+1 // 11501
A=A-1 // 11502
M=0 // 11503
// call Output.create
@17 // 11504
D=A // 11505
@14 // 11506
M=D // 11507
@Output.create // 11508
D=A // 11509
@13 // 11510
M=D // 11511
@Output.init.ret.86 // 11512
D=A // 11513
@CALL // 11514
0;JMP // 11515
(Output.init.ret.86)
@SP // 11516
M=M-1 // 11517

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11518
D=A // 11519
@SP // 11520
M=D+M // 11521
@117 // 11522
D=A // 11523
@SP // 11524
A=M-1 // 11525
M=0 // 11526
A=A-1 // 11527
M=0 // 11528
A=A-1 // 11529
M=0 // 11530
A=A-1 // 11531
M=D // 11532
A=A-1 // 11533
@27 // 11534
D=A // 11535
@SP // 11536
AM=M+1 // 11537
A=A-1 // 11538
M=D // 11539
@27 // 11540
D=A // 11541
@SP // 11542
AM=M+1 // 11543
A=A-1 // 11544
M=D // 11545
@27 // 11546
D=A // 11547
@SP // 11548
AM=M+1 // 11549
A=A-1 // 11550
M=D // 11551
@27 // 11552
D=A // 11553
@SP // 11554
AM=M+1 // 11555
A=A-1 // 11556
M=D // 11557
@27 // 11558
D=A // 11559
@SP // 11560
AM=M+1 // 11561
A=A-1 // 11562
M=D // 11563
@54 // 11564
D=A // 11565
@SP // 11566
AM=M+1 // 11567
A=A-1 // 11568
M=D // 11569
@SP // 11570
AM=M+1 // 11571
A=A-1 // 11572
M=0 // 11573
@SP // 11574
AM=M+1 // 11575
A=A-1 // 11576
M=0 // 11577
// call Output.create
@17 // 11578
D=A // 11579
@14 // 11580
M=D // 11581
@Output.create // 11582
D=A // 11583
@13 // 11584
M=D // 11585
@Output.init.ret.87 // 11586
D=A // 11587
@CALL // 11588
0;JMP // 11589
(Output.init.ret.87)
@SP // 11590
M=M-1 // 11591

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11592
D=A // 11593
@SP // 11594
M=D+M // 11595
@118 // 11596
D=A // 11597
@SP // 11598
A=M-1 // 11599
M=0 // 11600
A=A-1 // 11601
M=0 // 11602
A=A-1 // 11603
M=0 // 11604
A=A-1 // 11605
M=D // 11606
A=A-1 // 11607
@51 // 11608
D=A // 11609
@SP // 11610
AM=M+1 // 11611
A=A-1 // 11612
M=D // 11613
@51 // 11614
D=A // 11615
@SP // 11616
AM=M+1 // 11617
A=A-1 // 11618
M=D // 11619
@51 // 11620
D=A // 11621
@SP // 11622
AM=M+1 // 11623
A=A-1 // 11624
M=D // 11625
@51 // 11626
D=A // 11627
@SP // 11628
AM=M+1 // 11629
A=A-1 // 11630
M=D // 11631
@30 // 11632
D=A // 11633
@SP // 11634
AM=M+1 // 11635
A=A-1 // 11636
M=D // 11637
@12 // 11638
D=A // 11639
@SP // 11640
AM=M+1 // 11641
A=A-1 // 11642
M=D // 11643
@SP // 11644
AM=M+1 // 11645
A=A-1 // 11646
M=0 // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=0 // 11651
// call Output.create
@17 // 11652
D=A // 11653
@14 // 11654
M=D // 11655
@Output.create // 11656
D=A // 11657
@13 // 11658
M=D // 11659
@Output.init.ret.88 // 11660
D=A // 11661
@CALL // 11662
0;JMP // 11663
(Output.init.ret.88)
@SP // 11664
M=M-1 // 11665

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11666
D=A // 11667
@SP // 11668
M=D+M // 11669
@119 // 11670
D=A // 11671
@SP // 11672
A=M-1 // 11673
M=0 // 11674
A=A-1 // 11675
M=0 // 11676
A=A-1 // 11677
M=0 // 11678
A=A-1 // 11679
M=D // 11680
A=A-1 // 11681
@51 // 11682
D=A // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=D // 11687
@51 // 11688
D=A // 11689
@SP // 11690
AM=M+1 // 11691
A=A-1 // 11692
M=D // 11693
@51 // 11694
D=A // 11695
@SP // 11696
AM=M+1 // 11697
A=A-1 // 11698
M=D // 11699
@63 // 11700
D=A // 11701
@SP // 11702
AM=M+1 // 11703
A=A-1 // 11704
M=D // 11705
@63 // 11706
D=A // 11707
@SP // 11708
AM=M+1 // 11709
A=A-1 // 11710
M=D // 11711
@18 // 11712
D=A // 11713
@SP // 11714
AM=M+1 // 11715
A=A-1 // 11716
M=D // 11717
@SP // 11718
AM=M+1 // 11719
A=A-1 // 11720
M=0 // 11721
@SP // 11722
AM=M+1 // 11723
A=A-1 // 11724
M=0 // 11725
// call Output.create
@17 // 11726
D=A // 11727
@14 // 11728
M=D // 11729
@Output.create // 11730
D=A // 11731
@13 // 11732
M=D // 11733
@Output.init.ret.89 // 11734
D=A // 11735
@CALL // 11736
0;JMP // 11737
(Output.init.ret.89)
@SP // 11738
M=M-1 // 11739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11740
D=A // 11741
@SP // 11742
M=D+M // 11743
@120 // 11744
D=A // 11745
@SP // 11746
A=M-1 // 11747
M=0 // 11748
A=A-1 // 11749
M=0 // 11750
A=A-1 // 11751
M=0 // 11752
A=A-1 // 11753
M=D // 11754
A=A-1 // 11755
@51 // 11756
D=A // 11757
@SP // 11758
AM=M+1 // 11759
A=A-1 // 11760
M=D // 11761
@30 // 11762
D=A // 11763
@SP // 11764
AM=M+1 // 11765
A=A-1 // 11766
M=D // 11767
@12 // 11768
D=A // 11769
@SP // 11770
AM=M+1 // 11771
A=A-1 // 11772
M=D // 11773
@12 // 11774
D=A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779
@30 // 11780
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
@SP // 11792
AM=M+1 // 11793
A=A-1 // 11794
M=0 // 11795
@SP // 11796
AM=M+1 // 11797
A=A-1 // 11798
M=0 // 11799
// call Output.create
@17 // 11800
D=A // 11801
@14 // 11802
M=D // 11803
@Output.create // 11804
D=A // 11805
@13 // 11806
M=D // 11807
@Output.init.ret.90 // 11808
D=A // 11809
@CALL // 11810
0;JMP // 11811
(Output.init.ret.90)
@SP // 11812
M=M-1 // 11813

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11814
D=A // 11815
@SP // 11816
M=D+M // 11817
@121 // 11818
D=A // 11819
@SP // 11820
A=M-1 // 11821
M=0 // 11822
A=A-1 // 11823
M=0 // 11824
A=A-1 // 11825
M=0 // 11826
A=A-1 // 11827
M=D // 11828
A=A-1 // 11829
@51 // 11830
D=A // 11831
@SP // 11832
AM=M+1 // 11833
A=A-1 // 11834
M=D // 11835
@51 // 11836
D=A // 11837
@SP // 11838
AM=M+1 // 11839
A=A-1 // 11840
M=D // 11841
@51 // 11842
D=A // 11843
@SP // 11844
AM=M+1 // 11845
A=A-1 // 11846
M=D // 11847
@62 // 11848
D=A // 11849
@SP // 11850
AM=M+1 // 11851
A=A-1 // 11852
M=D // 11853
@48 // 11854
D=A // 11855
@SP // 11856
AM=M+1 // 11857
A=A-1 // 11858
M=D // 11859
@24 // 11860
D=A // 11861
@SP // 11862
AM=M+1 // 11863
A=A-1 // 11864
M=D // 11865
@15 // 11866
D=A // 11867
@SP // 11868
AM=M+1 // 11869
A=A-1 // 11870
M=D // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=0 // 11875
// call Output.create
@17 // 11876
D=A // 11877
@14 // 11878
M=D // 11879
@Output.create // 11880
D=A // 11881
@13 // 11882
M=D // 11883
@Output.init.ret.91 // 11884
D=A // 11885
@CALL // 11886
0;JMP // 11887
(Output.init.ret.91)
@SP // 11888
M=M-1 // 11889

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11890
D=A // 11891
@SP // 11892
M=D+M // 11893
@122 // 11894
D=A // 11895
@SP // 11896
A=M-1 // 11897
M=0 // 11898
A=A-1 // 11899
M=0 // 11900
A=A-1 // 11901
M=0 // 11902
A=A-1 // 11903
M=D // 11904
A=A-1 // 11905
@63 // 11906
D=A // 11907
@SP // 11908
AM=M+1 // 11909
A=A-1 // 11910
M=D // 11911
@27 // 11912
D=A // 11913
@SP // 11914
AM=M+1 // 11915
A=A-1 // 11916
M=D // 11917
@12 // 11918
D=A // 11919
@SP // 11920
AM=M+1 // 11921
A=A-1 // 11922
M=D // 11923
@6 // 11924
D=A // 11925
@SP // 11926
AM=M+1 // 11927
A=A-1 // 11928
M=D // 11929
@51 // 11930
D=A // 11931
@SP // 11932
AM=M+1 // 11933
A=A-1 // 11934
M=D // 11935
@63 // 11936
D=A // 11937
@SP // 11938
AM=M+1 // 11939
A=A-1 // 11940
M=D // 11941
@SP // 11942
AM=M+1 // 11943
A=A-1 // 11944
M=0 // 11945
@SP // 11946
AM=M+1 // 11947
A=A-1 // 11948
M=0 // 11949
// call Output.create
@17 // 11950
D=A // 11951
@14 // 11952
M=D // 11953
@Output.create // 11954
D=A // 11955
@13 // 11956
M=D // 11957
@Output.init.ret.92 // 11958
D=A // 11959
@CALL // 11960
0;JMP // 11961
(Output.init.ret.92)
@SP // 11962
M=M-1 // 11963

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 11964
D=A // 11965
@SP // 11966
AM=M+1 // 11967
A=A-1 // 11968
M=D // 11969
@56 // 11970
D=A // 11971
@SP // 11972
AM=M+1 // 11973
A=A-1 // 11974
M=D // 11975
@12 // 11976
D=A // 11977
@SP // 11978
AM=M+1 // 11979
A=A-1 // 11980
M=D // 11981
@12 // 11982
D=A // 11983
@SP // 11984
AM=M+1 // 11985
A=A-1 // 11986
M=D // 11987
@12 // 11988
D=A // 11989
@SP // 11990
AM=M+1 // 11991
A=A-1 // 11992
M=D // 11993
@7 // 11994
D=A // 11995
@SP // 11996
AM=M+1 // 11997
A=A-1 // 11998
M=D // 11999
@12 // 12000
D=A // 12001
@SP // 12002
AM=M+1 // 12003
A=A-1 // 12004
M=D // 12005
@12 // 12006
D=A // 12007
@SP // 12008
AM=M+1 // 12009
A=A-1 // 12010
M=D // 12011
@12 // 12012
D=A // 12013
@SP // 12014
AM=M+1 // 12015
A=A-1 // 12016
M=D // 12017
@56 // 12018
D=A // 12019
@SP // 12020
AM=M+1 // 12021
A=A-1 // 12022
M=D // 12023
@SP // 12024
AM=M+1 // 12025
A=A-1 // 12026
M=0 // 12027
@SP // 12028
AM=M+1 // 12029
A=A-1 // 12030
M=0 // 12031
// call Output.create
@17 // 12032
D=A // 12033
@14 // 12034
M=D // 12035
@Output.create // 12036
D=A // 12037
@13 // 12038
M=D // 12039
@Output.init.ret.93 // 12040
D=A // 12041
@CALL // 12042
0;JMP // 12043
(Output.init.ret.93)
@SP // 12044
M=M-1 // 12045

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12046
D=A // 12047
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=D // 12051
@12 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057
@12 // 12058
D=A // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=D // 12063
@12 // 12064
D=A // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=D // 12069
@12 // 12070
D=A // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=D // 12075
@12 // 12076
D=A // 12077
@SP // 12078
AM=M+1 // 12079
A=A-1 // 12080
M=D // 12081
@12 // 12082
D=A // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=D // 12087
@12 // 12088
D=A // 12089
@SP // 12090
AM=M+1 // 12091
A=A-1 // 12092
M=D // 12093
@12 // 12094
D=A // 12095
@SP // 12096
AM=M+1 // 12097
A=A-1 // 12098
M=D // 12099
@12 // 12100
D=A // 12101
@SP // 12102
AM=M+1 // 12103
A=A-1 // 12104
M=D // 12105
@SP // 12106
AM=M+1 // 12107
A=A-1 // 12108
M=0 // 12109
@SP // 12110
AM=M+1 // 12111
A=A-1 // 12112
M=0 // 12113
// call Output.create
@17 // 12114
D=A // 12115
@14 // 12116
M=D // 12117
@Output.create // 12118
D=A // 12119
@13 // 12120
M=D // 12121
@Output.init.ret.94 // 12122
D=A // 12123
@CALL // 12124
0;JMP // 12125
(Output.init.ret.94)
@SP // 12126
M=M-1 // 12127

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12128
D=A // 12129
@SP // 12130
AM=M+1 // 12131
A=A-1 // 12132
M=D // 12133
@7 // 12134
D=A // 12135
@SP // 12136
AM=M+1 // 12137
A=A-1 // 12138
M=D // 12139
@12 // 12140
D=A // 12141
@SP // 12142
AM=M+1 // 12143
A=A-1 // 12144
M=D // 12145
@12 // 12146
D=A // 12147
@SP // 12148
AM=M+1 // 12149
A=A-1 // 12150
M=D // 12151
@12 // 12152
D=A // 12153
@SP // 12154
AM=M+1 // 12155
A=A-1 // 12156
M=D // 12157
@56 // 12158
D=A // 12159
@SP // 12160
AM=M+1 // 12161
A=A-1 // 12162
M=D // 12163
@12 // 12164
D=A // 12165
@SP // 12166
AM=M+1 // 12167
A=A-1 // 12168
M=D // 12169
@12 // 12170
D=A // 12171
@SP // 12172
AM=M+1 // 12173
A=A-1 // 12174
M=D // 12175
@12 // 12176
D=A // 12177
@SP // 12178
AM=M+1 // 12179
A=A-1 // 12180
M=D // 12181
@7 // 12182
D=A // 12183
@SP // 12184
AM=M+1 // 12185
A=A-1 // 12186
M=D // 12187
@SP // 12188
AM=M+1 // 12189
A=A-1 // 12190
M=0 // 12191
@SP // 12192
AM=M+1 // 12193
A=A-1 // 12194
M=0 // 12195
// call Output.create
@17 // 12196
D=A // 12197
@14 // 12198
M=D // 12199
@Output.create // 12200
D=A // 12201
@13 // 12202
M=D // 12203
@Output.init.ret.95 // 12204
D=A // 12205
@CALL // 12206
0;JMP // 12207
(Output.init.ret.95)
@SP // 12208
M=M-1 // 12209

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 12210
D=A // 12211
@SP // 12212
AM=M+1 // 12213
A=A-1 // 12214
M=D // 12215
@38 // 12216
D=A // 12217
@SP // 12218
AM=M+1 // 12219
A=A-1 // 12220
M=D // 12221
@45 // 12222
D=A // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=D // 12227
@25 // 12228
D=A // 12229
@SP // 12230
AM=M+1 // 12231
A=A-1 // 12232
M=D // 12233
@SP // 12234
AM=M+1 // 12235
A=A-1 // 12236
M=0 // 12237
@SP // 12238
AM=M+1 // 12239
A=A-1 // 12240
M=0 // 12241
@SP // 12242
AM=M+1 // 12243
A=A-1 // 12244
M=0 // 12245
@SP // 12246
AM=M+1 // 12247
A=A-1 // 12248
M=0 // 12249
@SP // 12250
AM=M+1 // 12251
A=A-1 // 12252
M=0 // 12253
@SP // 12254
AM=M+1 // 12255
A=A-1 // 12256
M=0 // 12257
@SP // 12258
AM=M+1 // 12259
A=A-1 // 12260
M=0 // 12261
@SP // 12262
AM=M+1 // 12263
A=A-1 // 12264
M=0 // 12265
// call Output.create
@17 // 12266
D=A // 12267
@14 // 12268
M=D // 12269
@Output.create // 12270
D=A // 12271
@13 // 12272
M=D // 12273
@Output.init.ret.96 // 12274
D=A // 12275
@CALL // 12276
0;JMP // 12277
(Output.init.ret.96)
@SP // 12278
M=M-1 // 12279

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 12280
M=0 // 12281

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 12282
M=0 // 12283

////PushInstruction("constant 0")
@SP // 12284
AM=M+1 // 12285
A=A-1 // 12286
M=0 // 12287
@RETURN // 12288
0;JMP // 12289

////FunctionInstruction{functionName='Number.do_add', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_neg=1}}
// function Number.do_add with 0
(Number.do_add)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12290
A=M // 12291
D=M // 12292
@3 // 12293
M=D // 12294

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 12295
A=M // 12296
D=M // 12297
@SP // 12298
AM=M+1 // 12299
A=A-1 // 12300
M=D // 12301
@ARG // 12302
A=M+1 // 12303
D=M // 12304
@SP // 12305
AM=M+1 // 12306
A=A-1 // 12307
M=D // 12308
// call Number.getV
@6 // 12309
D=A // 12310
@14 // 12311
M=D // 12312
@Number.getV // 12313
D=A // 12314
@13 // 12315
M=D // 12316
@Number.do_add.ret.0 // 12317
D=A // 12318
@CALL // 12319
0;JMP // 12320
(Number.do_add.ret.0)
// call Int32.do_add
@7 // 12321
D=A // 12322
@14 // 12323
M=D // 12324
@Int32.do_add // 12325
D=A // 12326
@13 // 12327
M=D // 12328
@Number.do_add.ret.1 // 12329
D=A // 12330
@CALL // 12331
0;JMP // 12332
(Number.do_add.ret.1)
@SP // 12333
M=M-1 // 12334

////PushInstruction("constant 0")
@SP // 12335
AM=M+1 // 12336
A=A-1 // 12337
M=0 // 12338
@RETURN // 12339
0;JMP // 12340

////FunctionInstruction{functionName='Int32.leftshift', numLocals=2, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2}}
// function Int32.leftshift with 2
(Int32.leftshift)
@SP // 12341
M=M+1 // 12342
AM=M+1 // 12343
A=A-1 // 12344
M=0 // 12345
A=A-1 // 12346
M=0 // 12347

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 12348
A=M // 12349
D=M // 12350
@LCL // 12351
A=M // 12352
M=D // 12353

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 12354
A=M+1 // 12355
M=0 // 12356

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
@Int32.leftshift.LT.23 // 12357
D=A // 12358
@SP // 12359
AM=M+1 // 12360
A=A-1 // 12361
M=D // 12362
@LCL // 12363
A=M+1 // 12364
D=M // 12365
@ARG // 12366
A=M+1 // 12367
D=D-M // 12368
@DO_LT // 12369
0;JMP // 12370
(Int32.leftshift.LT.23)
D=!D // 12371
@Int32.leftshift_WHILE_END1 // 12372
D;JNE // 12373

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

@LCL // 12374
A=M // 12375
D=M // 12376
@LCL // 12377
A=M // 12378
M=D+M // 12379

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

@LCL // 12380
A=M+1 // 12381
M=M+1 // 12382

////GotoInstruction{label='Int32.leftshift_WHILE_EXP1}
// goto Int32.leftshift_WHILE_EXP1
@Int32.leftshift_WHILE_EXP1 // 12383
0;JMP // 12384

////LabelInstruction{label='Int32.leftshift_WHILE_END1}
// label Int32.leftshift_WHILE_END1
(Int32.leftshift_WHILE_END1)

////PushInstruction("local 0")
@LCL // 12385
A=M // 12386
D=M // 12387
@SP // 12388
AM=M+1 // 12389
A=A-1 // 12390
M=D // 12391
@RETURN // 12392
0;JMP // 12393

////FunctionInstruction{functionName='Vec3.new', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.clone=4}}
// function Vec3.new with 0
(Vec3.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 12394
D=A // 12395
@SP // 12396
AM=M+1 // 12397
A=A-1 // 12398
M=D // 12399
// call Memory.alloc
@6 // 12400
D=A // 12401
@14 // 12402
M=D // 12403
@Memory.alloc // 12404
D=A // 12405
@13 // 12406
M=D // 12407
@Vec3.new.ret.0 // 12408
D=A // 12409
@CALL // 12410
0;JMP // 12411
(Vec3.new.ret.0)
@SP // 12412
AM=M-1 // 12413
D=M // 12414
@3 // 12415
M=D // 12416

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

@Vec3.0 // 12417
M=M+1 // 12418

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 12419
A=M // 12420
D=M // 12421
@THIS // 12422
A=M // 12423
M=D // 12424

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 12425
A=M+1 // 12426
D=M // 12427
@THIS // 12428
A=M+1 // 12429
M=D // 12430

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 12431
A=M+1 // 12432
A=A+1 // 12433
D=M // 12434
@THIS // 12435
A=M+1 // 12436
A=A+1 // 12437
M=D // 12438

////PushInstruction("pointer 0")
@3 // 12439
D=M // 12440
@SP // 12441
AM=M+1 // 12442
A=A-1 // 12443
M=D // 12444
@RETURN // 12445
0;JMP // 12446

////FunctionInstruction{functionName='Int32.initialize', numLocals=3, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0}}
// function Int32.initialize with 3
(Int32.initialize)
@3 // 12447
D=A // 12448
@SP // 12449
AM=D+M // 12450
A=A-1 // 12451
M=0 // 12452
A=A-1 // 12453
M=0 // 12454
A=A-1 // 12455
M=0 // 12456

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 15")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 1}
//}

@15 // 12457
D=A // 12458
@SP // 12459
AM=M+1 // 12460
A=A-1 // 12461
M=D // 12462
// call Memory.alloc
@6 // 12463
D=A // 12464
@14 // 12465
M=D // 12466
@Memory.alloc // 12467
D=A // 12468
@13 // 12469
M=D // 12470
@Int32.initialize.ret.0 // 12471
D=A // 12472
@CALL // 12473
0;JMP // 12474
(Int32.initialize.ret.0)
@SP // 12475
AM=M-1 // 12476
D=M // 12477
@Int32.1 // 12478
M=D // 12479

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 12480
A=M+1 // 12481
M=0 // 12482

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 12483
A=M+1 // 12484
A=A+1 // 12485
M=1 // 12486

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
@Int32.initialize.LT.24 // 12487
D=A // 12488
@SP // 12489
AM=M+1 // 12490
A=A-1 // 12491
M=D // 12492
@LCL // 12493
A=M+1 // 12494
D=M // 12495
@15 // 12496
D=D-A // 12497
@DO_LT // 12498
0;JMP // 12499
(Int32.initialize.LT.24)
D=!D // 12500
@Int32.initialize_WHILE_END1 // 12501
D;JNE // 12502

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 1"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Int32.1 // 12503
D=M // 12504
@LCL // 12505
A=M+1 // 12506
D=D+M // 12507
@SP // 12508
AM=M+1 // 12509
A=A-1 // 12510
M=D // 12511
@LCL // 12512
A=M+1 // 12513
A=A+1 // 12514
D=M // 12515
@SP // 12516
AM=M-1 // 12517
A=M // 12518
M=D // 12519

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

@LCL // 12520
A=M+1 // 12521
A=A+1 // 12522
D=M // 12523
@LCL // 12524
A=M+1 // 12525
A=A+1 // 12526
M=D+M // 12527

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

@LCL // 12528
A=M+1 // 12529
M=M+1 // 12530

////GotoInstruction{label='Int32.initialize_WHILE_EXP1}
// goto Int32.initialize_WHILE_EXP1
@Int32.initialize_WHILE_EXP1 // 12531
0;JMP // 12532

////LabelInstruction{label='Int32.initialize_WHILE_END1}
// label Int32.initialize_WHILE_END1
(Int32.initialize_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12533
AM=M+1 // 12534
A=A-1 // 12535
M=0 // 12536
@RETURN // 12537
0;JMP // 12538

////FunctionInstruction{functionName='Int32.do_div', numLocals=0, funcMapping={Int32.is_positive=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_div with 0
(Int32.do_div)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12539
A=M // 12540
D=M // 12541
@3 // 12542
M=D // 12543

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 0"), PushInstruction("argument 1")], call=CallInstruction{Int32.do_left_shift_bytes_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 12544
D=A // 12545
@SP // 12546
M=D+M // 12547
@3 // 12548
D=M // 12549
@SP // 12550
A=M-1 // 12551
M=0 // 12552
A=A-1 // 12553
M=D // 12554
A=A-1 // 12555
@1 // 12556
D=A // 12557
@SP // 12558
M=D+M // 12559
@ARG // 12560
A=M+1 // 12561
D=M // 12562
@SP // 12563
A=M-1 // 12564
M=D // 12565
A=A-1 // 12566
// call Int32.do_left_shift_bytes_div
@8 // 12567
D=A // 12568
@14 // 12569
M=D // 12570
@Int32.do_left_shift_bytes_div // 12571
D=A // 12572
@13 // 12573
M=D // 12574
@Int32.do_div.ret.0 // 12575
D=A // 12576
@CALL // 12577
0;JMP // 12578
(Int32.do_div.ret.0)
@SP // 12579
M=M-1 // 12580

////PushInstruction("constant 0")
@SP // 12581
AM=M+1 // 12582
A=A-1 // 12583
M=0 // 12584
@RETURN // 12585
0;JMP // 12586

////FunctionInstruction{functionName='Int32.do_neg', numLocals=1, funcMapping={Int32.is_positive=1, Int32.do_div=1, Int32.do_sub=4, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_neg with 1
(Int32.do_neg)
@SP // 12587
AM=M+1 // 12588
A=A-1 // 12589
M=0 // 12590

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12591
A=M // 12592
D=M // 12593
@3 // 12594
M=D // 12595

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
@THIS // 12596
A=M // 12597
D=M // 12598
@0 // 12599
D=D+A // 12600
@SP // 12601
AM=M+1 // 12602
A=A-1 // 12603
M=D // 12604
@THIS // 12605
A=M // 12606
A=M // 12607
D=M // 12608
D=-D // 12609
@255 // 12610
D=D&A // 12611
@SP // 12612
AM=M-1 // 12613
A=M // 12614
M=D // 12615

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
@THIS // 12616
A=M // 12617
D=M // 12618
D=D+1 // 12619
@SP // 12620
AM=M+1 // 12621
A=A-1 // 12622
M=D // 12623
@THIS // 12624
A=M // 12625
A=M+1 // 12626
D=M // 12627
D=!D // 12628
@255 // 12629
D=D&A // 12630
@SP // 12631
AM=M-1 // 12632
A=M // 12633
M=D // 12634

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
@THIS // 12635
A=M // 12636
D=M // 12637
@2 // 12638
D=D+A // 12639
@SP // 12640
AM=M+1 // 12641
A=A-1 // 12642
M=D // 12643
@THIS // 12644
A=M // 12645
D=M // 12646
@THIS // 12647
A=M // 12648
D=M // 12649
@2 // 12650
D=D+A // 12651
A=D // 12652
D=M // 12653
D=!D // 12654
@255 // 12655
D=D&A // 12656
@SP // 12657
AM=M-1 // 12658
A=M // 12659
M=D // 12660

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
@THIS // 12661
A=M // 12662
D=M // 12663
@3 // 12664
D=D+A // 12665
@SP // 12666
AM=M+1 // 12667
A=A-1 // 12668
M=D // 12669
@THIS // 12670
A=M // 12671
D=M // 12672
@THIS // 12673
A=M // 12674
D=M // 12675
@3 // 12676
D=D+A // 12677
A=D // 12678
D=M // 12679
D=!D // 12680
@255 // 12681
D=D&A // 12682
@SP // 12683
AM=M-1 // 12684
A=M // 12685
M=D // 12686

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 12687
A=M // 12688
M=0 // 12689

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
@Int32.do_neg.LT.25 // 12690
D=A // 12691
@SP // 12692
AM=M+1 // 12693
A=A-1 // 12694
M=D // 12695
@LCL // 12696
A=M // 12697
D=M // 12698
@4 // 12699
D=D-A // 12700
@DO_LT // 12701
0;JMP // 12702
(Int32.do_neg.LT.25)
D=!D // 12703
@Int32.do_neg_WHILE_END1 // 12704
D;JNE // 12705

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
@THIS // 12706
A=M // 12707
D=M // 12708
@LCL // 12709
A=M // 12710
D=D+M // 12711
@SP // 12712
AM=M+1 // 12713
A=A-1 // 12714
M=D // 12715
@THIS // 12716
A=M // 12717
D=M // 12718
@LCL // 12719
A=M // 12720
A=D+M // 12721
D=M // 12722
D=D+1 // 12723
@SP // 12724
AM=M-1 // 12725
A=M // 12726
M=D // 12727

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
@Int32.do_neg.LT.26 // 12728
D=A // 12729
@SP // 12730
AM=M+1 // 12731
A=A-1 // 12732
M=D // 12733
@THIS // 12734
A=M // 12735
D=M // 12736
@LCL // 12737
A=M // 12738
A=D+M // 12739
D=M // 12740
@256 // 12741
D=D-A // 12742
@DO_LT // 12743
0;JMP // 12744
(Int32.do_neg.LT.26)
@Int32.do_neg$IF_TRUE1 // 12745
D;JNE // 12746

////GotoInstruction{label='Int32.do_neg$IF_FALSE1}
// goto Int32.do_neg$IF_FALSE1
@Int32.do_neg$IF_FALSE1 // 12747
0;JMP // 12748

////LabelInstruction{label='Int32.do_neg$IF_TRUE1}
// label Int32.do_neg$IF_TRUE1
(Int32.do_neg$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 4")
//  pop:  PopInstruction{address=local 0}
//}

@4 // 12749
D=A // 12750
@LCL // 12751
A=M // 12752
M=D // 12753

////GotoInstruction{label='Int32.do_neg$IF_END1}
// goto Int32.do_neg$IF_END1
@Int32.do_neg$IF_END1 // 12754
0;JMP // 12755

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
@THIS // 12756
A=M // 12757
D=M // 12758
@LCL // 12759
A=M // 12760
D=D+M // 12761
@SP // 12762
AM=M+1 // 12763
A=A-1 // 12764
M=D // 12765
D=0 // 12766
@SP // 12767
AM=M-1 // 12768
A=M // 12769
M=D // 12770

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

@LCL // 12771
A=M // 12772
M=M+1 // 12773

////LabelInstruction{label='Int32.do_neg$IF_END1}
// label Int32.do_neg$IF_END1
(Int32.do_neg$IF_END1)

////GotoInstruction{label='Int32.do_neg_WHILE_EXP1}
// goto Int32.do_neg_WHILE_EXP1
@Int32.do_neg_WHILE_EXP1 // 12774
0;JMP // 12775

////LabelInstruction{label='Int32.do_neg_WHILE_END1}
// label Int32.do_neg_WHILE_END1
(Int32.do_neg_WHILE_END1)

////PushInstruction("constant 0")
@SP // 12776
AM=M+1 // 12777
A=A-1 // 12778
M=0 // 12779
@RETURN // 12780
0;JMP // 12781

////FunctionInstruction{functionName='Int32.do_sqrt', numLocals=6, funcMapping={Int32.is_positive=1, Int32.do_div=1, Int32.do_sub=4, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_sqrt with 6
(Int32.do_sqrt)
@6 // 12782
D=A // 12783
@SP // 12784
AM=D+M // 12785
A=A-1 // 12786
M=0 // 12787
A=A-1 // 12788
M=0 // 12789
A=A-1 // 12790
M=0 // 12791
A=A-1 // 12792
M=0 // 12793
A=A-1 // 12794
M=0 // 12795
A=A-1 // 12796
M=0 // 12797

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 12798
A=M // 12799
D=M // 12800
@3 // 12801
M=D // 12802

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_zero}}, ifGoto=IfGotoInstruction{label='Int32.do_sqrt$IF_TRUE1}}
@3 // 12803
D=M // 12804
@SP // 12805
AM=M+1 // 12806
A=A-1 // 12807
M=D // 12808
// call Int32.is_zero
@6 // 12809
D=A // 12810
@14 // 12811
M=D // 12812
@Int32.is_zero // 12813
D=A // 12814
@13 // 12815
M=D // 12816
@Int32.do_sqrt.ret.0 // 12817
D=A // 12818
@CALL // 12819
0;JMP // 12820
(Int32.do_sqrt.ret.0)
@SP // 12821
AM=M-1 // 12822
D=M // 12823
@Int32.do_sqrt$IF_TRUE1 // 12824
D;JNE // 12825

////GotoInstruction{label='Int32.do_sqrt$IF_END1}
// goto Int32.do_sqrt$IF_END1
@Int32.do_sqrt$IF_END1 // 12826
0;JMP // 12827

////LabelInstruction{label='Int32.do_sqrt$IF_TRUE1}
// label Int32.do_sqrt$IF_TRUE1
(Int32.do_sqrt$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 12828
AM=M+1 // 12829
A=A-1 // 12830
M=0 // 12831
@RETURN // 12832
0;JMP // 12833

////LabelInstruction{label='Int32.do_sqrt$IF_END1}
// label Int32.do_sqrt$IF_END1
(Int32.do_sqrt$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 2}
//}

@2 // 12834
D=A // 12835
@SP // 12836
AM=M+1 // 12837
A=A-1 // 12838
M=D // 12839
// call Int32.new
@6 // 12840
D=A // 12841
@14 // 12842
M=D // 12843
@Int32.new // 12844
D=A // 12845
@13 // 12846
M=D // 12847
@Int32.do_sqrt.ret.1 // 12848
D=A // 12849
@CALL // 12850
0;JMP // 12851
(Int32.do_sqrt.ret.1)
@SP // 12852
AM=M-1 // 12853
D=M // 12854
@LCL // 12855
A=M+1 // 12856
A=A+1 // 12857
M=D // 12858

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 12859
AM=M+1 // 12860
A=A-1 // 12861
M=-1 // 12862
// call Int32.new
@6 // 12863
D=A // 12864
@14 // 12865
M=D // 12866
@Int32.new // 12867
D=A // 12868
@13 // 12869
M=D // 12870
@Int32.do_sqrt.ret.2 // 12871
D=A // 12872
@CALL // 12873
0;JMP // 12874
(Int32.do_sqrt.ret.2)
@SP // 12875
AM=M-1 // 12876
D=M // 12877
@LCL // 12878
A=M // 12879
M=D // 12880

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.initial_sqrt_guess}}
//  pop:  PopInstruction{address=local 1}
//}

@3 // 12881
D=M // 12882
@SP // 12883
AM=M+1 // 12884
A=A-1 // 12885
M=D // 12886
// call Int32.initial_sqrt_guess
@6 // 12887
D=A // 12888
@14 // 12889
M=D // 12890
@Int32.initial_sqrt_guess // 12891
D=A // 12892
@13 // 12893
M=D // 12894
@Int32.do_sqrt.ret.3 // 12895
D=A // 12896
@CALL // 12897
0;JMP // 12898
(Int32.do_sqrt.ret.3)
@SP // 12899
AM=M-1 // 12900
D=M // 12901
@LCL // 12902
A=M+1 // 12903
M=D // 12904

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 12905
D=M // 12906
@4 // 12907
A=D+A // 12908
M=0 // 12909

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
@Int32.do_sqrt.LT.27 // 12910
D=A // 12911
@SP // 12912
AM=M+1 // 12913
A=A-1 // 12914
M=D // 12915
@LCL // 12916
D=M // 12917
@4 // 12918
A=D+A // 12919
D=M // 12920
@20 // 12921
D=D-A // 12922
@DO_LT // 12923
0;JMP // 12924
(Int32.do_sqrt.LT.27)
@SP // 12925
AM=M+1 // 12926
A=A-1 // 12927
M=D // 12928
@Int32.do_sqrt.EQ.28 // 12929
D=A // 12930
@SP // 12931
AM=M+1 // 12932
A=A-1 // 12933
M=D // 12934
@LCL // 12935
A=M // 12936
D=M // 12937
@SP // 12938
AM=M+1 // 12939
A=A-1 // 12940
M=D // 12941
@LCL // 12942
A=M+1 // 12943
D=M // 12944
@SP // 12945
AM=M+1 // 12946
A=A-1 // 12947
M=D // 12948
// call Int32.cmp
@7 // 12949
D=A // 12950
@14 // 12951
M=D // 12952
@Int32.cmp // 12953
D=A // 12954
@13 // 12955
M=D // 12956
@Int32.do_sqrt.ret.4 // 12957
D=A // 12958
@CALL // 12959
0;JMP // 12960
(Int32.do_sqrt.ret.4)
@SP // 12961
AM=M-1 // 12962
D=M // 12963
@DO_EQ // 12964
0;JMP // 12965
(Int32.do_sqrt.EQ.28)
D=!D // 12966
@SP // 12967
AM=M-1 // 12968
D=D&M // 12969
D=!D // 12970
@Int32.do_sqrt_WHILE_END1 // 12971
D;JNE // 12972

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@3 // 12973
D=M // 12974
@SP // 12975
AM=M+1 // 12976
A=A-1 // 12977
M=D // 12978
// call Int32.clone
@6 // 12979
D=A // 12980
@14 // 12981
M=D // 12982
@Int32.clone // 12983
D=A // 12984
@13 // 12985
M=D // 12986
@Int32.do_sqrt.ret.5 // 12987
D=A // 12988
@CALL // 12989
0;JMP // 12990
(Int32.do_sqrt.ret.5)
@SP // 12991
AM=M-1 // 12992
D=M // 12993
@LCL // 12994
A=M+1 // 12995
A=A+1 // 12996
A=A+1 // 12997
M=D // 12998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 1")], call=CallInstruction{Int32.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 12999
A=M+1 // 13000
A=A+1 // 13001
A=A+1 // 13002
D=M // 13003
@SP // 13004
AM=M+1 // 13005
A=A-1 // 13006
M=D // 13007
@LCL // 13008
A=M+1 // 13009
D=M // 13010
@SP // 13011
AM=M+1 // 13012
A=A-1 // 13013
M=D // 13014
// call Int32.do_div
@7 // 13015
D=A // 13016
@14 // 13017
M=D // 13018
@Int32.do_div // 13019
D=A // 13020
@13 // 13021
M=D // 13022
@Int32.do_sqrt.ret.6 // 13023
D=A // 13024
@CALL // 13025
0;JMP // 13026
(Int32.do_sqrt.ret.6)
@SP // 13027
M=M-1 // 13028

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13029
A=M // 13030
D=M // 13031
@SP // 13032
AM=M+1 // 13033
A=A-1 // 13034
M=D // 13035
// call Int32.dispose
@6 // 13036
D=A // 13037
@14 // 13038
M=D // 13039
@Int32.dispose // 13040
D=A // 13041
@13 // 13042
M=D // 13043
@Int32.do_sqrt.ret.7 // 13044
D=A // 13045
@CALL // 13046
0;JMP // 13047
(Int32.do_sqrt.ret.7)
@SP // 13048
M=M-1 // 13049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13050
A=M+1 // 13051
D=M // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=D // 13056
// call Int32.clone
@6 // 13057
D=A // 13058
@14 // 13059
M=D // 13060
@Int32.clone // 13061
D=A // 13062
@13 // 13063
M=D // 13064
@Int32.do_sqrt.ret.8 // 13065
D=A // 13066
@CALL // 13067
0;JMP // 13068
(Int32.do_sqrt.ret.8)
@SP // 13069
AM=M-1 // 13070
D=M // 13071
@LCL // 13072
A=M // 13073
M=D // 13074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 3")], call=CallInstruction{Int32.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13075
A=M+1 // 13076
D=M // 13077
@SP // 13078
AM=M+1 // 13079
A=A-1 // 13080
M=D // 13081
@LCL // 13082
A=M+1 // 13083
A=A+1 // 13084
A=A+1 // 13085
D=M // 13086
@SP // 13087
AM=M+1 // 13088
A=A-1 // 13089
M=D // 13090
// call Int32.do_add
@7 // 13091
D=A // 13092
@14 // 13093
M=D // 13094
@Int32.do_add // 13095
D=A // 13096
@13 // 13097
M=D // 13098
@Int32.do_sqrt.ret.9 // 13099
D=A // 13100
@CALL // 13101
0;JMP // 13102
(Int32.do_sqrt.ret.9)
@SP // 13103
M=M-1 // 13104

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Int32.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13105
A=M+1 // 13106
D=M // 13107
@SP // 13108
AM=M+1 // 13109
A=A-1 // 13110
M=D // 13111
@LCL // 13112
A=M+1 // 13113
A=A+1 // 13114
D=M // 13115
@SP // 13116
AM=M+1 // 13117
A=A-1 // 13118
M=D // 13119
// call Int32.do_div
@7 // 13120
D=A // 13121
@14 // 13122
M=D // 13123
@Int32.do_div // 13124
D=A // 13125
@13 // 13126
M=D // 13127
@Int32.do_sqrt.ret.10 // 13128
D=A // 13129
@CALL // 13130
0;JMP // 13131
(Int32.do_sqrt.ret.10)
@SP // 13132
M=M-1 // 13133

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13134
A=M+1 // 13135
A=A+1 // 13136
A=A+1 // 13137
D=M // 13138
@SP // 13139
AM=M+1 // 13140
A=A-1 // 13141
M=D // 13142
// call Int32.dispose
@6 // 13143
D=A // 13144
@14 // 13145
M=D // 13146
@Int32.dispose // 13147
D=A // 13148
@13 // 13149
M=D // 13150
@Int32.do_sqrt.ret.11 // 13151
D=A // 13152
@CALL // 13153
0;JMP // 13154
(Int32.do_sqrt.ret.11)
@SP // 13155
M=M-1 // 13156

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

@LCL // 13157
D=M // 13158
@4 // 13159
A=D+A // 13160
M=M+1 // 13161

////GotoInstruction{label='Int32.do_sqrt_WHILE_EXP1}
// goto Int32.do_sqrt_WHILE_EXP1
@Int32.do_sqrt_WHILE_EXP1 // 13162
0;JMP // 13163

////LabelInstruction{label='Int32.do_sqrt_WHILE_END1}
// label Int32.do_sqrt_WHILE_END1
(Int32.do_sqrt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 13164
A=M+1 // 13165
D=M // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=D // 13170
// call Int32.getParts
@6 // 13171
D=A // 13172
@14 // 13173
M=D // 13174
@Int32.getParts // 13175
D=A // 13176
@13 // 13177
M=D // 13178
@Int32.do_sqrt.ret.12 // 13179
D=A // 13180
@CALL // 13181
0;JMP // 13182
(Int32.do_sqrt.ret.12)
@LCL // 13183
D=M // 13184
@5 // 13185
A=D+A // 13186
D=A // 13187
@R13 // 13188
M=D // 13189
@SP // 13190
AM=M-1 // 13191
D=M // 13192
@R13 // 13193
A=M // 13194
M=D // 13195

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 13196
D=M // 13197
@4 // 13198
A=D+A // 13199
M=0 // 13200

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
@Int32.do_sqrt.LT.29 // 13201
D=A // 13202
@SP // 13203
AM=M+1 // 13204
A=A-1 // 13205
M=D // 13206
@LCL // 13207
D=M // 13208
@4 // 13209
A=D+A // 13210
D=M // 13211
@4 // 13212
D=D-A // 13213
@DO_LT // 13214
0;JMP // 13215
(Int32.do_sqrt.LT.29)
D=!D // 13216
@Int32.do_sqrt_WHILE_END2 // 13217
D;JNE // 13218

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
@THIS // 13219
A=M // 13220
D=M // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225
@LCL // 13226
D=M // 13227
@4 // 13228
A=D+A // 13229
D=M // 13230
@SP // 13231
AM=M-1 // 13232
D=D+M // 13233
@SP // 13234
AM=M+1 // 13235
A=A-1 // 13236
M=D // 13237
@LCL // 13238
D=M // 13239
@5 // 13240
A=D+A // 13241
D=M // 13242
A=A-1 // 13243
A=D+M // 13244
D=M // 13245
@SP // 13246
AM=M-1 // 13247
A=M // 13248
M=D // 13249

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

@LCL // 13250
D=M // 13251
@4 // 13252
A=D+A // 13253
M=M+1 // 13254

////GotoInstruction{label='Int32.do_sqrt_WHILE_EXP2}
// goto Int32.do_sqrt_WHILE_EXP2
@Int32.do_sqrt_WHILE_EXP2 // 13255
0;JMP // 13256

////LabelInstruction{label='Int32.do_sqrt_WHILE_END2}
// label Int32.do_sqrt_WHILE_END2
(Int32.do_sqrt_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13257
A=M+1 // 13258
A=A+1 // 13259
D=M // 13260
@SP // 13261
AM=M+1 // 13262
A=A-1 // 13263
M=D // 13264
// call Int32.dispose
@6 // 13265
D=A // 13266
@14 // 13267
M=D // 13268
@Int32.dispose // 13269
D=A // 13270
@13 // 13271
M=D // 13272
@Int32.do_sqrt.ret.13 // 13273
D=A // 13274
@CALL // 13275
0;JMP // 13276
(Int32.do_sqrt.ret.13)
@SP // 13277
M=M-1 // 13278

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13279
A=M+1 // 13280
D=M // 13281
@SP // 13282
AM=M+1 // 13283
A=A-1 // 13284
M=D // 13285
// call Int32.dispose
@6 // 13286
D=A // 13287
@14 // 13288
M=D // 13289
@Int32.dispose // 13290
D=A // 13291
@13 // 13292
M=D // 13293
@Int32.do_sqrt.ret.14 // 13294
D=A // 13295
@CALL // 13296
0;JMP // 13297
(Int32.do_sqrt.ret.14)
@SP // 13298
M=M-1 // 13299

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13300
A=M // 13301
D=M // 13302
@SP // 13303
AM=M+1 // 13304
A=A-1 // 13305
M=D // 13306
// call Int32.dispose
@6 // 13307
D=A // 13308
@14 // 13309
M=D // 13310
@Int32.dispose // 13311
D=A // 13312
@13 // 13313
M=D // 13314
@Int32.do_sqrt.ret.15 // 13315
D=A // 13316
@CALL // 13317
0;JMP // 13318
(Int32.do_sqrt.ret.15)
@SP // 13319
M=M-1 // 13320

////PushInstruction("constant 0")
@SP // 13321
AM=M+1 // 13322
A=A-1 // 13323
M=0 // 13324
@RETURN // 13325
0;JMP // 13326

////FunctionInstruction{functionName='Int32.u4_array_div_u4_array', numLocals=15, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.u4_array_div_u4_array with 15
(Int32.u4_array_div_u4_array)
@15 // 13327
D=A // 13328
@SP // 13329
AM=D+M // 13330
A=A-1 // 13331
M=0 // 13332
A=A-1 // 13333
M=0 // 13334
A=A-1 // 13335
M=0 // 13336
A=A-1 // 13337
M=0 // 13338
A=A-1 // 13339
M=0 // 13340
A=A-1 // 13341
M=0 // 13342
A=A-1 // 13343
M=0 // 13344
A=A-1 // 13345
M=0 // 13346
A=A-1 // 13347
M=0 // 13348
A=A-1 // 13349
M=0 // 13350
A=A-1 // 13351
M=0 // 13352
A=A-1 // 13353
M=0 // 13354
A=A-1 // 13355
M=0 // 13356
A=A-1 // 13357
M=0 // 13358
A=A-1 // 13359
M=0 // 13360

////PushPopPair {
//  push: PushInstruction("constant 16")
//  pop:  PopInstruction{address=local 0}
//}

@16 // 13361
D=A // 13362
@LCL // 13363
A=M // 13364
M=D // 13365

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 6}
//}

@16 // 13366
D=A // 13367
@SP // 13368
AM=M+1 // 13369
A=A-1 // 13370
M=D // 13371
// call Memory.alloc
@6 // 13372
D=A // 13373
@14 // 13374
M=D // 13375
@Memory.alloc // 13376
D=A // 13377
@13 // 13378
M=D // 13379
@Int32.u4_array_div_u4_array.ret.0 // 13380
D=A // 13381
@CALL // 13382
0;JMP // 13383
(Int32.u4_array_div_u4_array.ret.0)
@LCL // 13384
D=M // 13385
@6 // 13386
A=D+A // 13387
D=A // 13388
@R13 // 13389
M=D // 13390
@SP // 13391
AM=M-1 // 13392
D=M // 13393
@R13 // 13394
A=M // 13395
M=D // 13396

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE1}}
@Int32.u4_array_div_u4_array.EQ.30 // 13397
D=A // 13398
@SP // 13399
AM=M+1 // 13400
A=A-1 // 13401
M=D // 13402
@ARG // 13403
A=M+1 // 13404
A=A+1 // 13405
D=M // 13406
D=D-1 // 13407
@DO_EQ // 13408
0;JMP // 13409
(Int32.u4_array_div_u4_array.EQ.30)
@Int32.u4_array_div_u4_array$IF_TRUE1 // 13410
D;JNE // 13411

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END1}
// goto Int32.u4_array_div_u4_array$IF_END1
@Int32.u4_array_div_u4_array$IF_END1 // 13412
0;JMP // 13413

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE1}
// label Int32.u4_array_div_u4_array$IF_TRUE1
(Int32.u4_array_div_u4_array$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 13414
A=M+1 // 13415
A=A+1 // 13416
A=A+1 // 13417
M=0 // 13418

////PushPopPair {
//  push: PushInstruction("constant 15")
//  pop:  PopInstruction{address=local 2}
//}

@15 // 13419
D=A // 13420
@LCL // 13421
A=M+1 // 13422
A=A+1 // 13423
M=D // 13424

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
@Int32.u4_array_div_u4_array.LT.31 // 13425
D=A // 13426
@SP // 13427
AM=M+1 // 13428
A=A-1 // 13429
M=D // 13430
@LCL // 13431
A=M+1 // 13432
A=A+1 // 13433
D=M // 13434
@DO_LT // 13435
0;JMP // 13436
(Int32.u4_array_div_u4_array.LT.31)
@Int32.u4_array_div_u4_array_WHILE_END1 // 13437
D;JNE // 13438

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

@LCL // 13439
A=M+1 // 13440
A=A+1 // 13441
A=A+1 // 13442
D=M // 13443
@SP // 13444
AM=M+1 // 13445
A=A-1 // 13446
M=D // 13447
@LCL // 13448
A=M // 13449
D=M // 13450
@SP // 13451
AM=M+1 // 13452
A=A-1 // 13453
M=D // 13454
// call Math.multiply
@7 // 13455
D=A // 13456
@14 // 13457
M=D // 13458
@Math.multiply // 13459
D=A // 13460
@13 // 13461
M=D // 13462
@Int32.u4_array_div_u4_array.ret.1 // 13463
D=A // 13464
@CALL // 13465
0;JMP // 13466
(Int32.u4_array_div_u4_array.ret.1)
@ARG // 13467
A=M // 13468
D=M // 13469
@LCL // 13470
A=M+1 // 13471
A=A+1 // 13472
A=D+M // 13473
D=M // 13474
@SP // 13475
AM=M-1 // 13476
D=D+M // 13477
@SP // 13478
AM=M+1 // 13479
A=A-1 // 13480
M=D // 13481
@LCL // 13482
D=M // 13483
@4 // 13484
A=D+A // 13485
D=A // 13486
@R13 // 13487
M=D // 13488
@SP // 13489
AM=M-1 // 13490
D=M // 13491
@R13 // 13492
A=M // 13493
M=D // 13494

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
@RETURN_PUSH_LABEL_17 // 13495
D=A // 13496
@13 // 13497
M=D // 13498
@6 // 13499
D=A // 13500
@LCL_PUSH // 13501
0;JMP // 13502
(RETURN_PUSH_LABEL_17)
@LCL // 13503
A=M+1 // 13504
A=A+1 // 13505
D=M // 13506
@SP // 13507
AM=M-1 // 13508
D=D+M // 13509
@SP // 13510
AM=M+1 // 13511
A=A-1 // 13512
M=D // 13513
@RETURN_PUSH_LABEL_18 // 13514
D=A // 13515
@13 // 13516
M=D // 13517
@4 // 13518
D=A // 13519
@LCL_PUSH // 13520
0;JMP // 13521
(RETURN_PUSH_LABEL_18)
@ARG // 13522
A=M+1 // 13523
A=M // 13524
D=M // 13525
@SP // 13526
AM=M+1 // 13527
A=A-1 // 13528
M=D // 13529
// call Math.divide
@7 // 13530
D=A // 13531
@14 // 13532
M=D // 13533
@Math.divide // 13534
D=A // 13535
@13 // 13536
M=D // 13537
@Int32.u4_array_div_u4_array.ret.2 // 13538
D=A // 13539
@CALL // 13540
0;JMP // 13541
(Int32.u4_array_div_u4_array.ret.2)
@SP // 13542
AM=M-1 // 13543
D=M // 13544
@SP // 13545
AM=M-1 // 13546
A=M // 13547
M=D // 13548

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

@RETURN_PUSH_LABEL_19 // 13549
D=A // 13550
@13 // 13551
M=D // 13552
@4 // 13553
D=A // 13554
@LCL_PUSH // 13555
0;JMP // 13556
(RETURN_PUSH_LABEL_19)
@RETURN_PUSH_LABEL_20 // 13557
D=A // 13558
@13 // 13559
M=D // 13560
@6 // 13561
D=A // 13562
@LCL_PUSH // 13563
0;JMP // 13564
(RETURN_PUSH_LABEL_20)
@LCL // 13565
A=M+1 // 13566
A=A+1 // 13567
D=M // 13568
@SP // 13569
AM=M-1 // 13570
A=D+M // 13571
D=M // 13572
@SP // 13573
AM=M+1 // 13574
A=A-1 // 13575
M=D // 13576
@ARG // 13577
A=M+1 // 13578
A=M // 13579
D=M // 13580
@SP // 13581
AM=M+1 // 13582
A=A-1 // 13583
M=D // 13584
// call Math.multiply
@7 // 13585
D=A // 13586
@14 // 13587
M=D // 13588
@Math.multiply // 13589
D=A // 13590
@13 // 13591
M=D // 13592
@Int32.u4_array_div_u4_array.ret.3 // 13593
D=A // 13594
@CALL // 13595
0;JMP // 13596
(Int32.u4_array_div_u4_array.ret.3)
@SP // 13597
AM=M-1 // 13598
D=M // 13599
@SP // 13600
AM=M-1 // 13601
D=M-D // 13602
@LCL // 13603
A=M+1 // 13604
A=A+1 // 13605
A=A+1 // 13606
M=D // 13607

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

@LCL // 13608
A=M+1 // 13609
A=A+1 // 13610
M=M-1 // 13611

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP1}
// goto Int32.u4_array_div_u4_array_WHILE_EXP1
@Int32.u4_array_div_u4_array_WHILE_EXP1 // 13612
0;JMP // 13613

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END1}
// label Int32.u4_array_div_u4_array_WHILE_END1
(Int32.u4_array_div_u4_array_WHILE_END1)

////PushInstruction("local 6")
@RETURN_PUSH_LABEL_21 // 13614
D=A // 13615
@13 // 13616
M=D // 13617
@6 // 13618
D=A // 13619
@LCL_PUSH // 13620
0;JMP // 13621
(RETURN_PUSH_LABEL_21)
@RETURN // 13622
0;JMP // 13623

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

@ARG // 13624
A=M+1 // 13625
D=M // 13626
@SP // 13627
AM=M+1 // 13628
A=A-1 // 13629
M=D // 13630
@ARG // 13631
A=M+1 // 13632
A=A+1 // 13633
D=M // 13634
D=D-1 // 13635
@SP // 13636
AM=M-1 // 13637
A=D+M // 13638
D=M // 13639
@SP // 13640
AM=M+1 // 13641
A=A-1 // 13642
M=D // 13643
// call Int32.nlz_u4
@6 // 13644
D=A // 13645
@14 // 13646
M=D // 13647
@Int32.nlz_u4 // 13648
D=A // 13649
@13 // 13650
M=D // 13651
@Int32.u4_array_div_u4_array.ret.4 // 13652
D=A // 13653
@CALL // 13654
0;JMP // 13655
(Int32.u4_array_div_u4_array.ret.4)
@LCL // 13656
D=M // 13657
@5 // 13658
A=D+A // 13659
D=A // 13660
@R13 // 13661
M=D // 13662
@SP // 13663
AM=M-1 // 13664
D=M // 13665
@R13 // 13666
A=M // 13667
M=D // 13668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 7}
//}

@8 // 13669
D=A // 13670
@SP // 13671
AM=M+1 // 13672
A=A-1 // 13673
M=D // 13674
// call Memory.alloc
@6 // 13675
D=A // 13676
@14 // 13677
M=D // 13678
@Memory.alloc // 13679
D=A // 13680
@13 // 13681
M=D // 13682
@Int32.u4_array_div_u4_array.ret.5 // 13683
D=A // 13684
@CALL // 13685
0;JMP // 13686
(Int32.u4_array_div_u4_array.ret.5)
@LCL // 13687
D=M // 13688
@7 // 13689
A=D+A // 13690
D=A // 13691
@R13 // 13692
M=D // 13693
@SP // 13694
AM=M-1 // 13695
D=M // 13696
@R13 // 13697
A=M // 13698
M=D // 13699

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

@ARG // 13700
A=M+1 // 13701
A=A+1 // 13702
D=M // 13703
D=D-1 // 13704
@LCL // 13705
A=M+1 // 13706
M=D // 13707

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
@Int32.u4_array_div_u4_array.LT.32 // 13708
D=A // 13709
@SP // 13710
AM=M+1 // 13711
A=A-1 // 13712
M=D // 13713
@LCL // 13714
A=M+1 // 13715
D=M // 13716
D=D-1 // 13717
@DO_LT // 13718
0;JMP // 13719
(Int32.u4_array_div_u4_array.LT.32)
@Int32.u4_array_div_u4_array_WHILE_END2 // 13720
D;JNE // 13721

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
@RETURN_PUSH_LABEL_22 // 13722
D=A // 13723
@13 // 13724
M=D // 13725
@7 // 13726
D=A // 13727
@LCL_PUSH // 13728
0;JMP // 13729
(RETURN_PUSH_LABEL_22)
@LCL // 13730
A=M+1 // 13731
D=M // 13732
@SP // 13733
AM=M-1 // 13734
D=D+M // 13735
@SP // 13736
AM=M+1 // 13737
A=A-1 // 13738
M=D // 13739
@ARG // 13740
A=M+1 // 13741
D=M // 13742
@LCL // 13743
A=M+1 // 13744
A=D+M // 13745
D=M // 13746
@SP // 13747
AM=M+1 // 13748
A=A-1 // 13749
M=D // 13750
@RETURN_PUSH_LABEL_23 // 13751
D=A // 13752
@13 // 13753
M=D // 13754
@5 // 13755
D=A // 13756
@LCL_PUSH // 13757
0;JMP // 13758
(RETURN_PUSH_LABEL_23)
// call Int32.leftshift
@7 // 13759
D=A // 13760
@14 // 13761
M=D // 13762
@Int32.leftshift // 13763
D=A // 13764
@13 // 13765
M=D // 13766
@Int32.u4_array_div_u4_array.ret.6 // 13767
D=A // 13768
@CALL // 13769
0;JMP // 13770
(Int32.u4_array_div_u4_array.ret.6)
@ARG // 13771
A=M+1 // 13772
D=M // 13773
@SP // 13774
AM=M+1 // 13775
A=A-1 // 13776
M=D // 13777
@LCL // 13778
A=M+1 // 13779
D=M // 13780
D=D-1 // 13781
@SP // 13782
AM=M-1 // 13783
A=D+M // 13784
D=M // 13785
@SP // 13786
AM=M+1 // 13787
A=A-1 // 13788
M=D // 13789
@LCL // 13790
D=M // 13791
@5 // 13792
A=D+A // 13793
D=M // 13794
@4 // 13795
D=A-D // 13796
@SP // 13797
AM=M+1 // 13798
A=A-1 // 13799
M=D // 13800
// call Int32.arith_rightshift
@7 // 13801
D=A // 13802
@14 // 13803
M=D // 13804
@Int32.arith_rightshift // 13805
D=A // 13806
@13 // 13807
M=D // 13808
@Int32.u4_array_div_u4_array.ret.7 // 13809
D=A // 13810
@CALL // 13811
0;JMP // 13812
(Int32.u4_array_div_u4_array.ret.7)
@SP // 13813
AM=M-1 // 13814
D=M // 13815
@SP // 13816
AM=M-1 // 13817
D=D|M // 13818
@15 // 13819
D=D&A // 13820
@SP // 13821
AM=M-1 // 13822
A=M // 13823
M=D // 13824

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

@LCL // 13825
A=M+1 // 13826
M=M-1 // 13827

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP2}
// goto Int32.u4_array_div_u4_array_WHILE_EXP2
@Int32.u4_array_div_u4_array_WHILE_EXP2 // 13828
0;JMP // 13829

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
@LCL // 13830
D=M // 13831
@7 // 13832
A=D+A // 13833
D=M // 13834
@0 // 13835
D=D+A // 13836
@SP // 13837
AM=M+1 // 13838
A=A-1 // 13839
M=D // 13840
@ARG // 13841
A=M+1 // 13842
A=M // 13843
D=M // 13844
@SP // 13845
AM=M+1 // 13846
A=A-1 // 13847
M=D // 13848
@RETURN_PUSH_LABEL_24 // 13849
D=A // 13850
@13 // 13851
M=D // 13852
@5 // 13853
D=A // 13854
@LCL_PUSH // 13855
0;JMP // 13856
(RETURN_PUSH_LABEL_24)
// call Int32.leftshift
@7 // 13857
D=A // 13858
@14 // 13859
M=D // 13860
@Int32.leftshift // 13861
D=A // 13862
@13 // 13863
M=D // 13864
@Int32.u4_array_div_u4_array.ret.8 // 13865
D=A // 13866
@CALL // 13867
0;JMP // 13868
(Int32.u4_array_div_u4_array.ret.8)
@SP // 13869
AM=M-1 // 13870
D=M // 13871
@15 // 13872
D=D&A // 13873
@SP // 13874
AM=M-1 // 13875
A=M // 13876
M=D // 13877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 17")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 8}
//}

@17 // 13878
D=A // 13879
@SP // 13880
AM=M+1 // 13881
A=A-1 // 13882
M=D // 13883
// call Memory.alloc
@6 // 13884
D=A // 13885
@14 // 13886
M=D // 13887
@Memory.alloc // 13888
D=A // 13889
@13 // 13890
M=D // 13891
@Int32.u4_array_div_u4_array.ret.9 // 13892
D=A // 13893
@CALL // 13894
0;JMP // 13895
(Int32.u4_array_div_u4_array.ret.9)
@LCL // 13896
D=M // 13897
@8 // 13898
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
@LCL // 13909
D=M // 13910
@8 // 13911
A=D+A // 13912
D=M // 13913
@16 // 13914
D=D+A // 13915
@SP // 13916
AM=M+1 // 13917
A=A-1 // 13918
M=D // 13919
@ARG // 13920
A=M // 13921
D=M // 13922
@ARG // 13923
A=M // 13924
D=M // 13925
@15 // 13926
D=D+A // 13927
A=D // 13928
D=M // 13929
@SP // 13930
AM=M+1 // 13931
A=A-1 // 13932
M=D // 13933
@LCL // 13934
D=M // 13935
@5 // 13936
A=D+A // 13937
D=M // 13938
@4 // 13939
D=A-D // 13940
@SP // 13941
AM=M+1 // 13942
A=A-1 // 13943
M=D // 13944
// call Int32.arith_rightshift
@7 // 13945
D=A // 13946
@14 // 13947
M=D // 13948
@Int32.arith_rightshift // 13949
D=A // 13950
@13 // 13951
M=D // 13952
@Int32.u4_array_div_u4_array.ret.10 // 13953
D=A // 13954
@CALL // 13955
0;JMP // 13956
(Int32.u4_array_div_u4_array.ret.10)
@SP // 13957
AM=M-1 // 13958
D=M // 13959
@SP // 13960
AM=M-1 // 13961
A=M // 13962
M=D // 13963

////PushPopPair {
//  push: PushInstruction("constant 15")
//  pop:  PopInstruction{address=local 1}
//}

@15 // 13964
D=A // 13965
@LCL // 13966
A=M+1 // 13967
M=D // 13968

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
@Int32.u4_array_div_u4_array.LT.33 // 13969
D=A // 13970
@SP // 13971
AM=M+1 // 13972
A=A-1 // 13973
M=D // 13974
@LCL // 13975
A=M+1 // 13976
D=M // 13977
D=D-1 // 13978
@DO_LT // 13979
0;JMP // 13980
(Int32.u4_array_div_u4_array.LT.33)
@Int32.u4_array_div_u4_array_WHILE_END3 // 13981
D;JNE // 13982

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
@RETURN_PUSH_LABEL_25 // 13983
D=A // 13984
@13 // 13985
M=D // 13986
@8 // 13987
D=A // 13988
@LCL_PUSH // 13989
0;JMP // 13990
(RETURN_PUSH_LABEL_25)
@LCL // 13991
A=M+1 // 13992
D=M // 13993
@SP // 13994
AM=M-1 // 13995
D=D+M // 13996
@SP // 13997
AM=M+1 // 13998
A=A-1 // 13999
M=D // 14000
@ARG // 14001
A=M // 14002
D=M // 14003
@LCL // 14004
A=M+1 // 14005
A=D+M // 14006
D=M // 14007
@SP // 14008
AM=M+1 // 14009
A=A-1 // 14010
M=D // 14011
@RETURN_PUSH_LABEL_26 // 14012
D=A // 14013
@13 // 14014
M=D // 14015
@5 // 14016
D=A // 14017
@LCL_PUSH // 14018
0;JMP // 14019
(RETURN_PUSH_LABEL_26)
// call Int32.leftshift
@7 // 14020
D=A // 14021
@14 // 14022
M=D // 14023
@Int32.leftshift // 14024
D=A // 14025
@13 // 14026
M=D // 14027
@Int32.u4_array_div_u4_array.ret.11 // 14028
D=A // 14029
@CALL // 14030
0;JMP // 14031
(Int32.u4_array_div_u4_array.ret.11)
@ARG // 14032
A=M // 14033
D=M // 14034
@SP // 14035
AM=M+1 // 14036
A=A-1 // 14037
M=D // 14038
@LCL // 14039
A=M+1 // 14040
D=M // 14041
D=D-1 // 14042
@SP // 14043
AM=M-1 // 14044
A=D+M // 14045
D=M // 14046
@SP // 14047
AM=M+1 // 14048
A=A-1 // 14049
M=D // 14050
@LCL // 14051
D=M // 14052
@5 // 14053
A=D+A // 14054
D=M // 14055
@4 // 14056
D=A-D // 14057
@SP // 14058
AM=M+1 // 14059
A=A-1 // 14060
M=D // 14061
// call Int32.arith_rightshift
@7 // 14062
D=A // 14063
@14 // 14064
M=D // 14065
@Int32.arith_rightshift // 14066
D=A // 14067
@13 // 14068
M=D // 14069
@Int32.u4_array_div_u4_array.ret.12 // 14070
D=A // 14071
@CALL // 14072
0;JMP // 14073
(Int32.u4_array_div_u4_array.ret.12)
@SP // 14074
AM=M-1 // 14075
D=M // 14076
@SP // 14077
AM=M-1 // 14078
D=D|M // 14079
@15 // 14080
D=D&A // 14081
@SP // 14082
AM=M-1 // 14083
A=M // 14084
M=D // 14085

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

@LCL // 14086
A=M+1 // 14087
M=M-1 // 14088

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP3}
// goto Int32.u4_array_div_u4_array_WHILE_EXP3
@Int32.u4_array_div_u4_array_WHILE_EXP3 // 14089
0;JMP // 14090

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
@LCL // 14091
D=M // 14092
@8 // 14093
A=D+A // 14094
D=M // 14095
@0 // 14096
D=D+A // 14097
@SP // 14098
AM=M+1 // 14099
A=A-1 // 14100
M=D // 14101
@ARG // 14102
A=M // 14103
A=M // 14104
D=M // 14105
@SP // 14106
AM=M+1 // 14107
A=A-1 // 14108
M=D // 14109
@RETURN_PUSH_LABEL_27 // 14110
D=A // 14111
@13 // 14112
M=D // 14113
@5 // 14114
D=A // 14115
@LCL_PUSH // 14116
0;JMP // 14117
(RETURN_PUSH_LABEL_27)
// call Int32.leftshift
@7 // 14118
D=A // 14119
@14 // 14120
M=D // 14121
@Int32.leftshift // 14122
D=A // 14123
@13 // 14124
M=D // 14125
@Int32.u4_array_div_u4_array.ret.13 // 14126
D=A // 14127
@CALL // 14128
0;JMP // 14129
(Int32.u4_array_div_u4_array.ret.13)
@SP // 14130
AM=M-1 // 14131
D=M // 14132
@15 // 14133
D=D&A // 14134
@SP // 14135
AM=M-1 // 14136
A=M // 14137
M=D // 14138

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

@ARG // 14139
A=M+1 // 14140
A=A+1 // 14141
D=M // 14142
@16 // 14143
D=A-D // 14144
@LCL // 14145
A=M+1 // 14146
A=A+1 // 14147
M=D // 14148

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
@Int32.u4_array_div_u4_array.LT.34 // 14149
D=A // 14150
@SP // 14151
AM=M+1 // 14152
A=A-1 // 14153
M=D // 14154
@LCL // 14155
A=M+1 // 14156
A=A+1 // 14157
D=M // 14158
@DO_LT // 14159
0;JMP // 14160
(Int32.u4_array_div_u4_array.LT.34)
@Int32.u4_array_div_u4_array_WHILE_END4 // 14161
D;JNE // 14162

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

@RETURN_PUSH_LABEL_28 // 14163
D=A // 14164
@13 // 14165
M=D // 14166
@8 // 14167
D=A // 14168
@LCL_PUSH // 14169
0;JMP // 14170
(RETURN_PUSH_LABEL_28)
@LCL // 14171
A=M+1 // 14172
A=A+1 // 14173
D=M // 14174
@ARG // 14175
A=M+1 // 14176
A=A+1 // 14177
D=D+M // 14178
@SP // 14179
AM=M-1 // 14180
A=D+M // 14181
D=M // 14182
@SP // 14183
AM=M+1 // 14184
A=A-1 // 14185
M=D // 14186
@LCL // 14187
A=M // 14188
D=M // 14189
@SP // 14190
AM=M+1 // 14191
A=A-1 // 14192
M=D // 14193
// call Math.multiply
@7 // 14194
D=A // 14195
@14 // 14196
M=D // 14197
@Math.multiply // 14198
D=A // 14199
@13 // 14200
M=D // 14201
@Int32.u4_array_div_u4_array.ret.14 // 14202
D=A // 14203
@CALL // 14204
0;JMP // 14205
(Int32.u4_array_div_u4_array.ret.14)
@RETURN_PUSH_LABEL_29 // 14206
D=A // 14207
@13 // 14208
M=D // 14209
@8 // 14210
D=A // 14211
@LCL_PUSH // 14212
0;JMP // 14213
(RETURN_PUSH_LABEL_29)
@LCL // 14214
A=M+1 // 14215
A=A+1 // 14216
D=M // 14217
@ARG // 14218
A=M+1 // 14219
A=A+1 // 14220
D=D+M // 14221
D=D-1 // 14222
@SP // 14223
AM=M-1 // 14224
A=D+M // 14225
D=M // 14226
@SP // 14227
AM=M-1 // 14228
D=D+M // 14229
@SP // 14230
AM=M+1 // 14231
A=A-1 // 14232
M=D // 14233
@LCL // 14234
D=M // 14235
@4 // 14236
A=D+A // 14237
D=A // 14238
@R13 // 14239
M=D // 14240
@SP // 14241
AM=M-1 // 14242
D=M // 14243
@R13 // 14244
A=M // 14245
M=D // 14246

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

@RETURN_PUSH_LABEL_30 // 14247
D=A // 14248
@13 // 14249
M=D // 14250
@4 // 14251
D=A // 14252
@LCL_PUSH // 14253
0;JMP // 14254
(RETURN_PUSH_LABEL_30)
@RETURN_PUSH_LABEL_31 // 14255
D=A // 14256
@13 // 14257
M=D // 14258
@7 // 14259
D=A // 14260
@LCL_PUSH // 14261
0;JMP // 14262
(RETURN_PUSH_LABEL_31)
@ARG // 14263
A=M+1 // 14264
A=A+1 // 14265
D=M // 14266
D=D-1 // 14267
@SP // 14268
AM=M-1 // 14269
A=D+M // 14270
D=M // 14271
@SP // 14272
AM=M+1 // 14273
A=A-1 // 14274
M=D // 14275
// call Math.divide
@7 // 14276
D=A // 14277
@14 // 14278
M=D // 14279
@Math.divide // 14280
D=A // 14281
@13 // 14282
M=D // 14283
@Int32.u4_array_div_u4_array.ret.15 // 14284
D=A // 14285
@CALL // 14286
0;JMP // 14287
(Int32.u4_array_div_u4_array.ret.15)
@LCL // 14288
D=M // 14289
@9 // 14290
A=D+A // 14291
D=A // 14292
@R13 // 14293
M=D // 14294
@SP // 14295
AM=M-1 // 14296
D=M // 14297
@R13 // 14298
A=M // 14299
M=D // 14300

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

@RETURN_PUSH_LABEL_32 // 14301
D=A // 14302
@13 // 14303
M=D // 14304
@4 // 14305
D=A // 14306
@LCL_PUSH // 14307
0;JMP // 14308
(RETURN_PUSH_LABEL_32)
@RETURN_PUSH_LABEL_33 // 14309
D=A // 14310
@13 // 14311
M=D // 14312
@9 // 14313
D=A // 14314
@LCL_PUSH // 14315
0;JMP // 14316
(RETURN_PUSH_LABEL_33)
@RETURN_PUSH_LABEL_34 // 14317
D=A // 14318
@13 // 14319
M=D // 14320
@7 // 14321
D=A // 14322
@LCL_PUSH // 14323
0;JMP // 14324
(RETURN_PUSH_LABEL_34)
@ARG // 14325
A=M+1 // 14326
A=A+1 // 14327
D=M // 14328
D=D-1 // 14329
@SP // 14330
AM=M-1 // 14331
A=D+M // 14332
D=M // 14333
@SP // 14334
AM=M+1 // 14335
A=A-1 // 14336
M=D // 14337
// call Math.multiply
@7 // 14338
D=A // 14339
@14 // 14340
M=D // 14341
@Math.multiply // 14342
D=A // 14343
@13 // 14344
M=D // 14345
@Int32.u4_array_div_u4_array.ret.16 // 14346
D=A // 14347
@CALL // 14348
0;JMP // 14349
(Int32.u4_array_div_u4_array.ret.16)
@SP // 14350
AM=M-1 // 14351
D=M // 14352
@SP // 14353
AM=M-1 // 14354
D=M-D // 14355
@SP // 14356
AM=M+1 // 14357
A=A-1 // 14358
M=D // 14359
@LCL // 14360
D=M // 14361
@10 // 14362
A=D+A // 14363
D=A // 14364
@R13 // 14365
M=D // 14366
@SP // 14367
AM=M-1 // 14368
D=M // 14369
@R13 // 14370
A=M // 14371
M=D // 14372

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14373
D=M // 14374
@11 // 14375
A=D+A // 14376
M=0 // 14377

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP5}
// label Int32.u4_array_div_u4_array_WHILE_EXP5
(Int32.u4_array_div_u4_array_WHILE_EXP5)

////ConditionalGroup{push=PushInstruction("local 11"), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_END5}}
@LCL // 14378
D=M // 14379
@11 // 14380
A=D+A // 14381
D=M // 14382
@Int32.u4_array_div_u4_array_WHILE_END5 // 14383
D;JNE // 14384

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14385
D=M // 14386
@11 // 14387
A=D+A // 14388
M=-1 // 14389

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
@Int32.u4_array_div_u4_array.LT.35 // 14390
D=A // 14391
@SP // 14392
AM=M+1 // 14393
A=A-1 // 14394
M=D // 14395
@RETURN_PUSH_LABEL_35 // 14396
D=A // 14397
@13 // 14398
M=D // 14399
@9 // 14400
D=A // 14401
@LCL_PUSH // 14402
0;JMP // 14403
(RETURN_PUSH_LABEL_35)
@LCL // 14404
A=M // 14405
D=M // 14406
@SP // 14407
AM=M-1 // 14408
D=M-D // 14409
@DO_LT // 14410
0;JMP // 14411
(Int32.u4_array_div_u4_array.LT.35)
@SP // 14412
AM=M+1 // 14413
A=A-1 // 14414
M=D // 14415
@SP // 14416
A=M-1 // 14417
M=!D // 14418
@Int32.u4_array_div_u4_array.GT.36 // 14419
D=A // 14420
@SP // 14421
AM=M+1 // 14422
A=A-1 // 14423
M=D // 14424
@RETURN_PUSH_LABEL_36 // 14425
D=A // 14426
@13 // 14427
M=D // 14428
@9 // 14429
D=A // 14430
@LCL_PUSH // 14431
0;JMP // 14432
(RETURN_PUSH_LABEL_36)
@RETURN_PUSH_LABEL_37 // 14433
D=A // 14434
@13 // 14435
M=D // 14436
@7 // 14437
D=A // 14438
@LCL_PUSH // 14439
0;JMP // 14440
(RETURN_PUSH_LABEL_37)
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
@RETURN_PUSH_LABEL_38 // 14474
D=A // 14475
@13 // 14476
M=D // 14477
@10 // 14478
D=A // 14479
@LCL_PUSH // 14480
0;JMP // 14481
(RETURN_PUSH_LABEL_38)
// call Math.multiply
@7 // 14482
D=A // 14483
@14 // 14484
M=D // 14485
@Math.multiply // 14486
D=A // 14487
@13 // 14488
M=D // 14489
@Int32.u4_array_div_u4_array.ret.18 // 14490
D=A // 14491
@CALL // 14492
0;JMP // 14493
(Int32.u4_array_div_u4_array.ret.18)
@RETURN_PUSH_LABEL_39 // 14494
D=A // 14495
@13 // 14496
M=D // 14497
@8 // 14498
D=A // 14499
@LCL_PUSH // 14500
0;JMP // 14501
(RETURN_PUSH_LABEL_39)
@LCL // 14502
A=M+1 // 14503
A=A+1 // 14504
D=M // 14505
@ARG // 14506
A=M+1 // 14507
A=A+1 // 14508
D=D+M // 14509
@2 // 14510
D=D-A // 14511
@SP // 14512
AM=M-1 // 14513
A=D+M // 14514
D=M // 14515
@SP // 14516
AM=M-1 // 14517
D=D+M // 14518
@SP // 14519
AM=M-1 // 14520
D=M-D // 14521
@DO_GT // 14522
0;JMP // 14523
(Int32.u4_array_div_u4_array.GT.36)
@SP // 14524
AM=M-1 // 14525
D=D|M // 14526
@Int32.u4_array_div_u4_array$IF_TRUE2 // 14527
D;JNE // 14528

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END2}
// goto Int32.u4_array_div_u4_array$IF_END2
@Int32.u4_array_div_u4_array$IF_END2 // 14529
0;JMP // 14530

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

@LCL // 14531
D=M // 14532
@9 // 14533
A=D+A // 14534
M=M-1 // 14535

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

@RETURN_PUSH_LABEL_40 // 14536
D=A // 14537
@13 // 14538
M=D // 14539
@10 // 14540
D=A // 14541
@LCL_PUSH // 14542
0;JMP // 14543
(RETURN_PUSH_LABEL_40)
@RETURN_PUSH_LABEL_41 // 14544
D=A // 14545
@13 // 14546
M=D // 14547
@7 // 14548
D=A // 14549
@LCL_PUSH // 14550
0;JMP // 14551
(RETURN_PUSH_LABEL_41)
@ARG // 14552
A=M+1 // 14553
A=A+1 // 14554
D=M // 14555
D=D-1 // 14556
@SP // 14557
AM=M-1 // 14558
A=D+M // 14559
D=M // 14560
@SP // 14561
AM=M-1 // 14562
D=D+M // 14563
@SP // 14564
AM=M+1 // 14565
A=A-1 // 14566
M=D // 14567
@LCL // 14568
D=M // 14569
@10 // 14570
A=D+A // 14571
D=A // 14572
@R13 // 14573
M=D // 14574
@SP // 14575
AM=M-1 // 14576
D=M // 14577
@R13 // 14578
A=M // 14579
M=D // 14580

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 10"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE3}}
@Int32.u4_array_div_u4_array.LT.37 // 14581
D=A // 14582
@SP // 14583
AM=M+1 // 14584
A=A-1 // 14585
M=D // 14586
@RETURN_PUSH_LABEL_42 // 14587
D=A // 14588
@13 // 14589
M=D // 14590
@10 // 14591
D=A // 14592
@LCL_PUSH // 14593
0;JMP // 14594
(RETURN_PUSH_LABEL_42)
@LCL // 14595
A=M // 14596
D=M // 14597
@SP // 14598
AM=M-1 // 14599
D=M-D // 14600
@DO_LT // 14601
0;JMP // 14602
(Int32.u4_array_div_u4_array.LT.37)
@Int32.u4_array_div_u4_array$IF_TRUE3 // 14603
D;JNE // 14604

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END3}
// goto Int32.u4_array_div_u4_array$IF_END3
@Int32.u4_array_div_u4_array$IF_END3 // 14605
0;JMP // 14606

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE3}
// label Int32.u4_array_div_u4_array$IF_TRUE3
(Int32.u4_array_div_u4_array$IF_TRUE3)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 14607
D=M // 14608
@11 // 14609
A=D+A // 14610
M=0 // 14611

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END3}
// label Int32.u4_array_div_u4_array$IF_END3
(Int32.u4_array_div_u4_array$IF_END3)

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_END2}
// label Int32.u4_array_div_u4_array$IF_END2
(Int32.u4_array_div_u4_array$IF_END2)

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP5}
// goto Int32.u4_array_div_u4_array_WHILE_EXP5
@Int32.u4_array_div_u4_array_WHILE_EXP5 // 14612
0;JMP // 14613

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END5}
// label Int32.u4_array_div_u4_array_WHILE_END5
(Int32.u4_array_div_u4_array_WHILE_END5)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 14614
D=M // 14615
@12 // 14616
A=D+A // 14617
M=0 // 14618

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14619
A=M+1 // 14620
M=0 // 14621

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
@Int32.u4_array_div_u4_array.LT.38 // 14622
D=A // 14623
@SP // 14624
AM=M+1 // 14625
A=A-1 // 14626
M=D // 14627
@LCL // 14628
A=M+1 // 14629
D=M // 14630
@ARG // 14631
A=M+1 // 14632
A=A+1 // 14633
D=D-M // 14634
@DO_LT // 14635
0;JMP // 14636
(Int32.u4_array_div_u4_array.LT.38)
D=!D // 14637
@Int32.u4_array_div_u4_array_WHILE_END6 // 14638
D;JNE // 14639

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

@RETURN_PUSH_LABEL_43 // 14640
D=A // 14641
@13 // 14642
M=D // 14643
@9 // 14644
D=A // 14645
@LCL_PUSH // 14646
0;JMP // 14647
(RETURN_PUSH_LABEL_43)
@RETURN_PUSH_LABEL_44 // 14648
D=A // 14649
@13 // 14650
M=D // 14651
@7 // 14652
D=A // 14653
@LCL_PUSH // 14654
0;JMP // 14655
(RETURN_PUSH_LABEL_44)
@LCL // 14656
A=M+1 // 14657
D=M // 14658
@SP // 14659
AM=M-1 // 14660
A=D+M // 14661
D=M // 14662
@SP // 14663
AM=M+1 // 14664
A=A-1 // 14665
M=D // 14666
// call Math.multiply
@7 // 14667
D=A // 14668
@14 // 14669
M=D // 14670
@Math.multiply // 14671
D=A // 14672
@13 // 14673
M=D // 14674
@Int32.u4_array_div_u4_array.ret.19 // 14675
D=A // 14676
@CALL // 14677
0;JMP // 14678
(Int32.u4_array_div_u4_array.ret.19)
@LCL // 14679
D=M // 14680
@13 // 14681
A=D+A // 14682
D=A // 14683
@R13 // 14684
M=D // 14685
@SP // 14686
AM=M-1 // 14687
D=M // 14688
@R13 // 14689
A=M // 14690
M=D // 14691

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

@RETURN_PUSH_LABEL_45 // 14692
D=A // 14693
@13 // 14694
M=D // 14695
@8 // 14696
D=A // 14697
@LCL_PUSH // 14698
0;JMP // 14699
(RETURN_PUSH_LABEL_45)
@LCL // 14700
A=M+1 // 14701
A=A+1 // 14702
D=M // 14703
A=A-1 // 14704
D=D+M // 14705
@SP // 14706
AM=M-1 // 14707
A=D+M // 14708
D=M // 14709
@SP // 14710
AM=M+1 // 14711
A=A-1 // 14712
M=D // 14713
@LCL // 14714
D=M // 14715
@12 // 14716
A=D+A // 14717
D=M // 14718
@SP // 14719
AM=M-1 // 14720
D=M-D // 14721
@SP // 14722
AM=M+1 // 14723
A=A-1 // 14724
M=D // 14725
@LCL // 14726
D=M // 14727
@13 // 14728
A=D+A // 14729
D=M // 14730
@15 // 14731
D=D&A // 14732
@SP // 14733
AM=M-1 // 14734
D=M-D // 14735
@SP // 14736
AM=M+1 // 14737
A=A-1 // 14738
M=D // 14739
@LCL // 14740
D=M // 14741
@14 // 14742
A=D+A // 14743
D=A // 14744
@R13 // 14745
M=D // 14746
@SP // 14747
AM=M-1 // 14748
D=M // 14749
@R13 // 14750
A=M // 14751
M=D // 14752

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
@RETURN_PUSH_LABEL_46 // 14753
D=A // 14754
@13 // 14755
M=D // 14756
@8 // 14757
D=A // 14758
@LCL_PUSH // 14759
0;JMP // 14760
(RETURN_PUSH_LABEL_46)
@LCL // 14761
A=M+1 // 14762
A=A+1 // 14763
D=M // 14764
A=A-1 // 14765
D=D+M // 14766
@SP // 14767
AM=M-1 // 14768
D=D+M // 14769
@SP // 14770
AM=M+1 // 14771
A=A-1 // 14772
M=D // 14773
@LCL // 14774
D=M // 14775
@14 // 14776
A=D+A // 14777
D=M // 14778
@15 // 14779
D=D&A // 14780
@SP // 14781
AM=M-1 // 14782
A=M // 14783
M=D // 14784

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

@RETURN_PUSH_LABEL_47 // 14785
D=A // 14786
@13 // 14787
M=D // 14788
@13 // 14789
D=A // 14790
@LCL_PUSH // 14791
0;JMP // 14792
(RETURN_PUSH_LABEL_47)
@4 // 14793
D=A // 14794
@SP // 14795
AM=M+1 // 14796
A=A-1 // 14797
M=D // 14798
// call Int32.arith_rightshift
@7 // 14799
D=A // 14800
@14 // 14801
M=D // 14802
@Int32.arith_rightshift // 14803
D=A // 14804
@13 // 14805
M=D // 14806
@Int32.u4_array_div_u4_array.ret.20 // 14807
D=A // 14808
@CALL // 14809
0;JMP // 14810
(Int32.u4_array_div_u4_array.ret.20)
@RETURN_PUSH_LABEL_48 // 14811
D=A // 14812
@13 // 14813
M=D // 14814
@14 // 14815
D=A // 14816
@LCL_PUSH // 14817
0;JMP // 14818
(RETURN_PUSH_LABEL_48)
@4 // 14819
D=A // 14820
@SP // 14821
AM=M+1 // 14822
A=A-1 // 14823
M=D // 14824
// call Int32.arith_rightshift
@7 // 14825
D=A // 14826
@14 // 14827
M=D // 14828
@Int32.arith_rightshift // 14829
D=A // 14830
@13 // 14831
M=D // 14832
@Int32.u4_array_div_u4_array.ret.21 // 14833
D=A // 14834
@CALL // 14835
0;JMP // 14836
(Int32.u4_array_div_u4_array.ret.21)
@SP // 14837
AM=M-1 // 14838
D=M // 14839
@SP // 14840
AM=M-1 // 14841
D=M-D // 14842
@SP // 14843
AM=M+1 // 14844
A=A-1 // 14845
M=D // 14846
@LCL // 14847
D=M // 14848
@12 // 14849
A=D+A // 14850
D=A // 14851
@R13 // 14852
M=D // 14853
@SP // 14854
AM=M-1 // 14855
D=M // 14856
@R13 // 14857
A=M // 14858
M=D // 14859

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

@LCL // 14860
A=M+1 // 14861
M=M+1 // 14862

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP6}
// goto Int32.u4_array_div_u4_array_WHILE_EXP6
@Int32.u4_array_div_u4_array_WHILE_EXP6 // 14863
0;JMP // 14864

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

@RETURN_PUSH_LABEL_49 // 14865
D=A // 14866
@13 // 14867
M=D // 14868
@8 // 14869
D=A // 14870
@LCL_PUSH // 14871
0;JMP // 14872
(RETURN_PUSH_LABEL_49)
@LCL // 14873
A=M+1 // 14874
A=A+1 // 14875
D=M // 14876
@ARG // 14877
A=M+1 // 14878
A=A+1 // 14879
D=D+M // 14880
@SP // 14881
AM=M-1 // 14882
A=D+M // 14883
D=M // 14884
@SP // 14885
AM=M+1 // 14886
A=A-1 // 14887
M=D // 14888
@LCL // 14889
D=M // 14890
@12 // 14891
A=D+A // 14892
D=M // 14893
@SP // 14894
AM=M-1 // 14895
D=M-D // 14896
@SP // 14897
AM=M+1 // 14898
A=A-1 // 14899
M=D // 14900
@LCL // 14901
D=M // 14902
@14 // 14903
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
@RETURN_PUSH_LABEL_50 // 14914
D=A // 14915
@13 // 14916
M=D // 14917
@8 // 14918
D=A // 14919
@LCL_PUSH // 14920
0;JMP // 14921
(RETURN_PUSH_LABEL_50)
@LCL // 14922
A=M+1 // 14923
A=A+1 // 14924
D=M // 14925
@ARG // 14926
A=M+1 // 14927
A=A+1 // 14928
D=D+M // 14929
@SP // 14930
AM=M-1 // 14931
D=D+M // 14932
@SP // 14933
AM=M+1 // 14934
A=A-1 // 14935
M=D // 14936
@LCL // 14937
D=M // 14938
@14 // 14939
A=D+A // 14940
D=M // 14941
@SP // 14942
AM=M-1 // 14943
A=M // 14944
M=D // 14945

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 6"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "ADD"
//)}
@RETURN_PUSH_LABEL_51 // 14946
D=A // 14947
@13 // 14948
M=D // 14949
@6 // 14950
D=A // 14951
@LCL_PUSH // 14952
0;JMP // 14953
(RETURN_PUSH_LABEL_51)
@LCL // 14954
A=M+1 // 14955
A=A+1 // 14956
D=M // 14957
@SP // 14958
AM=M-1 // 14959
D=D+M // 14960
@SP // 14961
AM=M+1 // 14962
A=A-1 // 14963
M=D // 14964
@LCL // 14965
D=M // 14966
@9 // 14967
A=D+A // 14968
D=M // 14969
@SP // 14970
AM=M-1 // 14971
A=M // 14972
M=D // 14973

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE4}}
@Int32.u4_array_div_u4_array.LT.39 // 14974
D=A // 14975
@SP // 14976
AM=M+1 // 14977
A=A-1 // 14978
M=D // 14979
@LCL // 14980
D=M // 14981
@14 // 14982
A=D+A // 14983
D=M // 14984
@DO_LT // 14985
0;JMP // 14986
(Int32.u4_array_div_u4_array.LT.39)
@Int32.u4_array_div_u4_array$IF_TRUE4 // 14987
D;JNE // 14988

////GotoInstruction{label='Int32.u4_array_div_u4_array$IF_END4}
// goto Int32.u4_array_div_u4_array$IF_END4
@Int32.u4_array_div_u4_array$IF_END4 // 14989
0;JMP // 14990

////LabelInstruction{label='Int32.u4_array_div_u4_array$IF_TRUE4}
// label Int32.u4_array_div_u4_array$IF_TRUE4
(Int32.u4_array_div_u4_array$IF_TRUE4)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 14991
D=M // 14992
@12 // 14993
A=D+A // 14994
M=0 // 14995

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
@RETURN_PUSH_LABEL_52 // 14996
D=A // 14997
@13 // 14998
M=D // 14999
@6 // 15000
D=A // 15001
@LCL_PUSH // 15002
0;JMP // 15003
(RETURN_PUSH_LABEL_52)
@LCL // 15004
A=M+1 // 15005
A=A+1 // 15006
D=M // 15007
@SP // 15008
AM=M-1 // 15009
D=D+M // 15010
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=D // 15014
@RETURN_PUSH_LABEL_53 // 15015
D=A // 15016
@13 // 15017
M=D // 15018
@6 // 15019
D=A // 15020
@LCL_PUSH // 15021
0;JMP // 15022
(RETURN_PUSH_LABEL_53)
@LCL // 15023
A=M+1 // 15024
A=A+1 // 15025
D=M // 15026
@SP // 15027
AM=M-1 // 15028
A=D+M // 15029
D=M // 15030
D=D-1 // 15031
@SP // 15032
AM=M-1 // 15033
A=M // 15034
M=D // 15035

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 15036
A=M+1 // 15037
M=0 // 15038

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
@Int32.u4_array_div_u4_array.LT.40 // 15039
D=A // 15040
@SP // 15041
AM=M+1 // 15042
A=A-1 // 15043
M=D // 15044
@LCL // 15045
A=M+1 // 15046
D=M // 15047
@ARG // 15048
A=M+1 // 15049
A=A+1 // 15050
D=D-M // 15051
@DO_LT // 15052
0;JMP // 15053
(Int32.u4_array_div_u4_array.LT.40)
D=!D // 15054
@Int32.u4_array_div_u4_array_WHILE_END7 // 15055
D;JNE // 15056

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

@RETURN_PUSH_LABEL_54 // 15057
D=A // 15058
@13 // 15059
M=D // 15060
@8 // 15061
D=A // 15062
@LCL_PUSH // 15063
0;JMP // 15064
(RETURN_PUSH_LABEL_54)
@LCL // 15065
A=M+1 // 15066
A=A+1 // 15067
D=M // 15068
A=A-1 // 15069
D=D+M // 15070
@SP // 15071
AM=M-1 // 15072
A=D+M // 15073
D=M // 15074
@SP // 15075
AM=M+1 // 15076
A=A-1 // 15077
M=D // 15078
@RETURN_PUSH_LABEL_55 // 15079
D=A // 15080
@13 // 15081
M=D // 15082
@7 // 15083
D=A // 15084
@LCL_PUSH // 15085
0;JMP // 15086
(RETURN_PUSH_LABEL_55)
@LCL // 15087
A=M+1 // 15088
D=M // 15089
@SP // 15090
AM=M-1 // 15091
A=D+M // 15092
D=M // 15093
@SP // 15094
AM=M-1 // 15095
D=D+M // 15096
@SP // 15097
AM=M+1 // 15098
A=A-1 // 15099
M=D // 15100
@LCL // 15101
D=M // 15102
@12 // 15103
A=D+A // 15104
D=M // 15105
@SP // 15106
AM=M-1 // 15107
D=D+M // 15108
@SP // 15109
AM=M+1 // 15110
A=A-1 // 15111
M=D // 15112
@LCL // 15113
D=M // 15114
@14 // 15115
A=D+A // 15116
D=A // 15117
@R13 // 15118
M=D // 15119
@SP // 15120
AM=M-1 // 15121
D=M // 15122
@R13 // 15123
A=M // 15124
M=D // 15125

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
@RETURN_PUSH_LABEL_56 // 15126
D=A // 15127
@13 // 15128
M=D // 15129
@8 // 15130
D=A // 15131
@LCL_PUSH // 15132
0;JMP // 15133
(RETURN_PUSH_LABEL_56)
@LCL // 15134
A=M+1 // 15135
A=A+1 // 15136
D=M // 15137
A=A-1 // 15138
D=D+M // 15139
@SP // 15140
AM=M-1 // 15141
D=D+M // 15142
@SP // 15143
AM=M+1 // 15144
A=A-1 // 15145
M=D // 15146
@LCL // 15147
D=M // 15148
@14 // 15149
A=D+A // 15150
D=M // 15151
@15 // 15152
D=D&A // 15153
@SP // 15154
AM=M-1 // 15155
A=M // 15156
M=D // 15157

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 14"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}
//  pop:  PopInstruction{address=local 12}
//}

@RETURN_PUSH_LABEL_57 // 15158
D=A // 15159
@13 // 15160
M=D // 15161
@14 // 15162
D=A // 15163
@LCL_PUSH // 15164
0;JMP // 15165
(RETURN_PUSH_LABEL_57)
@4 // 15166
D=A // 15167
@SP // 15168
AM=M+1 // 15169
A=A-1 // 15170
M=D // 15171
// call Int32.arith_rightshift
@7 // 15172
D=A // 15173
@14 // 15174
M=D // 15175
@Int32.arith_rightshift // 15176
D=A // 15177
@13 // 15178
M=D // 15179
@Int32.u4_array_div_u4_array.ret.22 // 15180
D=A // 15181
@CALL // 15182
0;JMP // 15183
(Int32.u4_array_div_u4_array.ret.22)
@LCL // 15184
D=M // 15185
@12 // 15186
A=D+A // 15187
D=A // 15188
@R13 // 15189
M=D // 15190
@SP // 15191
AM=M-1 // 15192
D=M // 15193
@R13 // 15194
A=M // 15195
M=D // 15196

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

@LCL // 15197
A=M+1 // 15198
M=M+1 // 15199

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP7}
// goto Int32.u4_array_div_u4_array_WHILE_EXP7
@Int32.u4_array_div_u4_array_WHILE_EXP7 // 15200
0;JMP // 15201

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
@RETURN_PUSH_LABEL_58 // 15202
D=A // 15203
@13 // 15204
M=D // 15205
@8 // 15206
D=A // 15207
@LCL_PUSH // 15208
0;JMP // 15209
(RETURN_PUSH_LABEL_58)
@LCL // 15210
A=M+1 // 15211
A=A+1 // 15212
D=M // 15213
@ARG // 15214
A=M+1 // 15215
A=A+1 // 15216
D=D+M // 15217
@SP // 15218
AM=M-1 // 15219
D=D+M // 15220
@SP // 15221
AM=M+1 // 15222
A=A-1 // 15223
M=D // 15224
@RETURN_PUSH_LABEL_59 // 15225
D=A // 15226
@13 // 15227
M=D // 15228
@8 // 15229
D=A // 15230
@LCL_PUSH // 15231
0;JMP // 15232
(RETURN_PUSH_LABEL_59)
@LCL // 15233
A=M+1 // 15234
A=A+1 // 15235
D=M // 15236
@ARG // 15237
A=M+1 // 15238
A=A+1 // 15239
D=D+M // 15240
@SP // 15241
AM=M-1 // 15242
A=D+M // 15243
D=M // 15244
@SP // 15245
AM=M+1 // 15246
A=A-1 // 15247
M=D // 15248
@LCL // 15249
D=M // 15250
@12 // 15251
A=D+A // 15252
D=M // 15253
@SP // 15254
AM=M-1 // 15255
D=D+M // 15256
@SP // 15257
AM=M-1 // 15258
A=M // 15259
M=D // 15260

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

@LCL // 15261
A=M+1 // 15262
A=A+1 // 15263
M=M-1 // 15264

////GotoInstruction{label='Int32.u4_array_div_u4_array_WHILE_EXP4}
// goto Int32.u4_array_div_u4_array_WHILE_EXP4
@Int32.u4_array_div_u4_array_WHILE_EXP4 // 15265
0;JMP // 15266

////LabelInstruction{label='Int32.u4_array_div_u4_array_WHILE_END4}
// label Int32.u4_array_div_u4_array_WHILE_END4
(Int32.u4_array_div_u4_array_WHILE_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_60 // 15267
D=A // 15268
@13 // 15269
M=D // 15270
@7 // 15271
D=A // 15272
@LCL_PUSH // 15273
0;JMP // 15274
(RETURN_PUSH_LABEL_60)
// call Memory.deAlloc
@6 // 15275
D=A // 15276
@14 // 15277
M=D // 15278
@Memory.deAlloc // 15279
D=A // 15280
@13 // 15281
M=D // 15282
@Int32.u4_array_div_u4_array.ret.23 // 15283
D=A // 15284
@CALL // 15285
0;JMP // 15286
(Int32.u4_array_div_u4_array.ret.23)
@SP // 15287
M=M-1 // 15288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_61 // 15289
D=A // 15290
@13 // 15291
M=D // 15292
@8 // 15293
D=A // 15294
@LCL_PUSH // 15295
0;JMP // 15296
(RETURN_PUSH_LABEL_61)
// call Memory.deAlloc
@6 // 15297
D=A // 15298
@14 // 15299
M=D // 15300
@Memory.deAlloc // 15301
D=A // 15302
@13 // 15303
M=D // 15304
@Int32.u4_array_div_u4_array.ret.24 // 15305
D=A // 15306
@CALL // 15307
0;JMP // 15308
(Int32.u4_array_div_u4_array.ret.24)
@SP // 15309
M=M-1 // 15310

////PushInstruction("local 6")
@RETURN_PUSH_LABEL_62 // 15311
D=A // 15312
@13 // 15313
M=D // 15314
@6 // 15315
D=A // 15316
@LCL_PUSH // 15317
0;JMP // 15318
(RETURN_PUSH_LABEL_62)
@RETURN // 15319
0;JMP // 15320

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.length=0}}
// function String.appendChar with 1
(String.appendChar)
@SP // 15321
AM=M+1 // 15322
A=A-1 // 15323
M=0 // 15324

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 15325
A=M // 15326
D=M // 15327
@3 // 15328
M=D // 15329

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.41 // 15330
D=A // 15331
@SP // 15332
AM=M+1 // 15333
A=A-1 // 15334
M=D // 15335
@THIS // 15336
A=M+1 // 15337
A=A+1 // 15338
D=M // 15339
A=A-1 // 15340
D=M-D // 15341
@DO_EQ // 15342
0;JMP // 15343
(String.appendChar.EQ.41)
@String.appendChar$IF_TRUE1 // 15344
D;JNE // 15345

////GotoInstruction{label='String.appendChar$IF_END1}
// goto String.appendChar$IF_END1
@String.appendChar$IF_END1 // 15346
0;JMP // 15347

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

@THIS // 15348
A=M+1 // 15349
A=A+1 // 15350
D=M // 15351
D=D+M // 15352
@SP // 15353
AM=M+1 // 15354
A=A-1 // 15355
M=D // 15356
// call Memory.alloc
@6 // 15357
D=A // 15358
@14 // 15359
M=D // 15360
@Memory.alloc // 15361
D=A // 15362
@13 // 15363
M=D // 15364
@String.appendChar.ret.0 // 15365
D=A // 15366
@CALL // 15367
0;JMP // 15368
(String.appendChar.ret.0)
@SP // 15369
AM=M-1 // 15370
D=M // 15371
@LCL // 15372
A=M // 15373
M=D // 15374

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15375
A=M // 15376
D=M // 15377
@SP // 15378
AM=M+1 // 15379
A=A-1 // 15380
M=D // 15381
@LCL // 15382
A=M // 15383
D=M // 15384
@SP // 15385
AM=M+1 // 15386
A=A-1 // 15387
M=D // 15388
@THIS // 15389
A=M+1 // 15390
D=M // 15391
@SP // 15392
AM=M+1 // 15393
A=A-1 // 15394
M=D // 15395
// call Memory.copy
@8 // 15396
D=A // 15397
@14 // 15398
M=D // 15399
@Memory.copy // 15400
D=A // 15401
@13 // 15402
M=D // 15403
@String.appendChar.ret.1 // 15404
D=A // 15405
@CALL // 15406
0;JMP // 15407
(String.appendChar.ret.1)
@SP // 15408
M=M-1 // 15409

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 15410
A=M // 15411
D=M // 15412
@SP // 15413
AM=M+1 // 15414
A=A-1 // 15415
M=D // 15416
// call Memory.deAlloc
@6 // 15417
D=A // 15418
@14 // 15419
M=D // 15420
@Memory.deAlloc // 15421
D=A // 15422
@13 // 15423
M=D // 15424
@String.appendChar.ret.2 // 15425
D=A // 15426
@CALL // 15427
0;JMP // 15428
(String.appendChar.ret.2)
@SP // 15429
M=M-1 // 15430

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

@THIS // 15431
A=M+1 // 15432
A=A+1 // 15433
D=M // 15434
@THIS // 15435
A=M+1 // 15436
A=A+1 // 15437
M=D+M // 15438

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 15439
A=M // 15440
D=M // 15441
@THIS // 15442
A=M // 15443
M=D // 15444

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
@THIS // 15445
A=M+1 // 15446
D=M // 15447
A=A-1 // 15448
D=D+M // 15449
@SP // 15450
AM=M+1 // 15451
A=A-1 // 15452
M=D // 15453
@ARG // 15454
A=M+1 // 15455
D=M // 15456
@SP // 15457
AM=M-1 // 15458
A=M // 15459
M=D // 15460

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

@THIS // 15461
A=M+1 // 15462
M=M+1 // 15463

////PushInstruction("pointer 0")
@3 // 15464
D=M // 15465
@SP // 15466
AM=M+1 // 15467
A=A-1 // 15468
M=D // 15469
@RETURN // 15470
0;JMP // 15471

////FunctionInstruction{functionName='Main.getSomething', numLocals=2, funcMapping={}}
// function Main.getSomething with 2
(Main.getSomething)
@SP // 15472
M=M+1 // 15473
AM=M+1 // 15474
A=A-1 // 15475
M=0 // 15476
A=A-1 // 15477
M=0 // 15478

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 15479
A=M // 15480
D=M // 15481
@SP // 15482
AM=M+1 // 15483
A=A-1 // 15484
M=D // 15485
// call Number.new
@6 // 15486
D=A // 15487
@14 // 15488
M=D // 15489
@Number.new // 15490
D=A // 15491
@13 // 15492
M=D // 15493
@Main.getSomething.ret.0 // 15494
D=A // 15495
@CALL // 15496
0;JMP // 15497
(Main.getSomething.ret.0)
@SP // 15498
AM=M-1 // 15499
D=M // 15500
@LCL // 15501
A=M // 15502
M=D // 15503

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 15504
A=M+1 // 15505
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
@Main.getSomething.ret.1 // 15519
D=A // 15520
@CALL // 15521
0;JMP // 15522
(Main.getSomething.ret.1)
@SP // 15523
AM=M-1 // 15524
D=M // 15525
@LCL // 15526
A=M+1 // 15527
M=D // 15528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15529
A=M // 15530
D=M // 15531
@SP // 15532
AM=M+1 // 15533
A=A-1 // 15534
M=D // 15535
@LCL // 15536
A=M+1 // 15537
D=M // 15538
@SP // 15539
AM=M+1 // 15540
A=A-1 // 15541
M=D // 15542
// call Number.do_div
@7 // 15543
D=A // 15544
@14 // 15545
M=D // 15546
@Number.do_div // 15547
D=A // 15548
@13 // 15549
M=D // 15550
@Main.getSomething.ret.2 // 15551
D=A // 15552
@CALL // 15553
0;JMP // 15554
(Main.getSomething.ret.2)
@SP // 15555
M=M-1 // 15556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 15557
A=M+1 // 15558
D=M // 15559
@SP // 15560
AM=M+1 // 15561
A=A-1 // 15562
M=D // 15563
// call Number.dispose
@6 // 15564
D=A // 15565
@14 // 15566
M=D // 15567
@Number.dispose // 15568
D=A // 15569
@13 // 15570
M=D // 15571
@Main.getSomething.ret.3 // 15572
D=A // 15573
@CALL // 15574
0;JMP // 15575
(Main.getSomething.ret.3)
@SP // 15576
M=M-1 // 15577

////PushInstruction("local 0")
@LCL // 15578
A=M // 15579
D=M // 15580
@SP // 15581
AM=M+1 // 15582
A=A-1 // 15583
M=D // 15584
@RETURN // 15585
0;JMP // 15586

////FunctionInstruction{functionName='Main.render', numLocals=29, funcMapping={Main.getSomething=4}}
// function Main.render with 29
(Main.render)
@29 // 15587
D=A // 15588
@SP // 15589
AM=D+M // 15590
A=A-1 // 15591
M=0 // 15592
A=A-1 // 15593
M=0 // 15594
A=A-1 // 15595
M=0 // 15596
A=A-1 // 15597
M=0 // 15598
A=A-1 // 15599
M=0 // 15600
A=A-1 // 15601
M=0 // 15602
A=A-1 // 15603
M=0 // 15604
A=A-1 // 15605
M=0 // 15606
A=A-1 // 15607
M=0 // 15608
A=A-1 // 15609
M=0 // 15610
A=A-1 // 15611
M=0 // 15612
A=A-1 // 15613
M=0 // 15614
A=A-1 // 15615
M=0 // 15616
A=A-1 // 15617
M=0 // 15618
A=A-1 // 15619
M=0 // 15620
A=A-1 // 15621
M=0 // 15622
A=A-1 // 15623
M=0 // 15624
A=A-1 // 15625
M=0 // 15626
A=A-1 // 15627
M=0 // 15628
A=A-1 // 15629
M=0 // 15630
A=A-1 // 15631
M=0 // 15632
A=A-1 // 15633
M=0 // 15634
A=A-1 // 15635
M=0 // 15636
A=A-1 // 15637
M=0 // 15638
A=A-1 // 15639
M=0 // 15640
A=A-1 // 15641
M=0 // 15642
A=A-1 // 15643
M=0 // 15644
A=A-1 // 15645
M=0 // 15646
A=A-1 // 15647
M=0 // 15648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getWidth}}
//  pop:  PopInstruction{address=local 12}
//}

@ARG // 15649
A=M // 15650
D=M // 15651
@SP // 15652
AM=M+1 // 15653
A=A-1 // 15654
M=D // 15655
// call Scene.getWidth
@6 // 15656
D=A // 15657
@14 // 15658
M=D // 15659
@Scene.getWidth // 15660
D=A // 15661
@13 // 15662
M=D // 15663
@Main.render.ret.0 // 15664
D=A // 15665
@CALL // 15666
0;JMP // 15667
(Main.render.ret.0)
@LCL // 15668
D=M // 15669
@12 // 15670
A=D+A // 15671
D=A // 15672
@R13 // 15673
M=D // 15674
@SP // 15675
AM=M-1 // 15676
D=M // 15677
@R13 // 15678
A=M // 15679
M=D // 15680

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 13}
//}

@RETURN_PUSH_LABEL_63 // 15681
D=A // 15682
@13 // 15683
M=D // 15684
@12 // 15685
D=A // 15686
@LCL_PUSH // 15687
0;JMP // 15688
(RETURN_PUSH_LABEL_63)
// call Memory.alloc
@6 // 15689
D=A // 15690
@14 // 15691
M=D // 15692
@Memory.alloc // 15693
D=A // 15694
@13 // 15695
M=D // 15696
@Main.render.ret.1 // 15697
D=A // 15698
@CALL // 15699
0;JMP // 15700
(Main.render.ret.1)
@LCL // 15701
D=M // 15702
@13 // 15703
A=D+A // 15704
D=A // 15705
@R13 // 15706
M=D // 15707
@SP // 15708
AM=M-1 // 15709
D=M // 15710
@R13 // 15711
A=M // 15712
M=D // 15713

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 14}
//}

@RETURN_PUSH_LABEL_64 // 15714
D=A // 15715
@13 // 15716
M=D // 15717
@12 // 15718
D=A // 15719
@LCL_PUSH // 15720
0;JMP // 15721
(RETURN_PUSH_LABEL_64)
// call Memory.alloc
@6 // 15722
D=A // 15723
@14 // 15724
M=D // 15725
@Memory.alloc // 15726
D=A // 15727
@13 // 15728
M=D // 15729
@Main.render.ret.2 // 15730
D=A // 15731
@CALL // 15732
0;JMP // 15733
(Main.render.ret.2)
@LCL // 15734
D=M // 15735
@14 // 15736
A=D+A // 15737
D=A // 15738
@R13 // 15739
M=D // 15740
@SP // 15741
AM=M-1 // 15742
D=M // 15743
@R13 // 15744
A=M // 15745
M=D // 15746

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 16}
//}

@LCL // 15747
D=M // 15748
@16 // 15749
A=D+A // 15750
M=0 // 15751

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 15752
D=M // 15753
@11 // 15754
A=D+A // 15755
M=0 // 15756

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
@Main.render.LT.42 // 15757
D=A // 15758
@SP // 15759
AM=M+1 // 15760
A=A-1 // 15761
M=D // 15762
@LCL // 15763
D=M // 15764
@12 // 15765
A=D+A // 15766
D=M // 15767
A=A-1 // 15768
D=M-D // 15769
@DO_LT // 15770
0;JMP // 15771
(Main.render.LT.42)
D=!D // 15772
@Main.render_WHILE_END1 // 15773
D;JNE // 15774

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 13"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 15775
D=M // 15776
@13 // 15777
A=D+A // 15778
D=M // 15779
A=A-1 // 15780
A=A-1 // 15781
D=D+M // 15782
@SP // 15783
AM=M+1 // 15784
A=A-1 // 15785
M=D // 15786
D=0 // 15787
@SP // 15788
AM=M-1 // 15789
A=M // 15790
M=D // 15791

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 15792
D=M // 15793
@14 // 15794
A=D+A // 15795
D=M // 15796
A=A-1 // 15797
A=A-1 // 15798
A=A-1 // 15799
D=D+M // 15800
@SP // 15801
AM=M+1 // 15802
A=A-1 // 15803
M=D // 15804
D=0 // 15805
@SP // 15806
AM=M-1 // 15807
A=M // 15808
M=D // 15809

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

@LCL // 15810
D=M // 15811
@11 // 15812
A=D+A // 15813
M=M+1 // 15814

////GotoInstruction{label='Main.render_WHILE_EXP1}
// goto Main.render_WHILE_EXP1
@Main.render_WHILE_EXP1 // 15815
0;JMP // 15816

////LabelInstruction{label='Main.render_WHILE_END1}
// label Main.render_WHILE_END1
(Main.render_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}
//  pop:  PopInstruction{address=local 0}
//}

@2 // 15817
D=A // 15818
@SP // 15819
M=D+M // 15820
@2 // 15821
D=A // 15822
@SP // 15823
A=M-1 // 15824
M=D // 15825
A=A-1 // 15826
M=1 // 15827
// call Main.getSomething
@7 // 15828
D=A // 15829
@14 // 15830
M=D // 15831
@Main.getSomething // 15832
D=A // 15833
@13 // 15834
M=D // 15835
@Main.render.ret.3 // 15836
D=A // 15837
@CALL // 15838
0;JMP // 15839
(Main.render.ret.3)
@SP // 15840
AM=M-1 // 15841
D=M // 15842
@LCL // 15843
A=M // 15844
M=D // 15845

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@SP // 15846
AM=M+1 // 15847
A=A-1 // 15848
M=0 // 15849
// call Number.new
@6 // 15850
D=A // 15851
@14 // 15852
M=D // 15853
@Number.new // 15854
D=A // 15855
@13 // 15856
M=D // 15857
@Main.render.ret.4 // 15858
D=A // 15859
@CALL // 15860
0;JMP // 15861
(Main.render.ret.4)
@SP // 15862
AM=M-1 // 15863
D=M // 15864
@LCL // 15865
A=M+1 // 15866
M=D // 15867

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 2}
//}

@SP // 15868
AM=M+1 // 15869
A=A-1 // 15870
M=1 // 15871
// call Number.new
@6 // 15872
D=A // 15873
@14 // 15874
M=D // 15875
@Number.new // 15876
D=A // 15877
@13 // 15878
M=D // 15879
@Main.render.ret.5 // 15880
D=A // 15881
@CALL // 15882
0;JMP // 15883
(Main.render.ret.5)
@SP // 15884
AM=M-1 // 15885
D=M // 15886
@LCL // 15887
A=M+1 // 15888
A=A+1 // 15889
M=D // 15890

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 15891
D=A // 15892
@SP // 15893
AM=M+1 // 15894
A=A-1 // 15895
M=D // 15896
// call Number.new
@6 // 15897
D=A // 15898
@14 // 15899
M=D // 15900
@Number.new // 15901
D=A // 15902
@13 // 15903
M=D // 15904
@Main.render.ret.6 // 15905
D=A // 15906
@CALL // 15907
0;JMP // 15908
(Main.render.ret.6)
@SP // 15909
AM=M-1 // 15910
D=M // 15911
@LCL // 15912
A=M+1 // 15913
A=A+1 // 15914
A=A+1 // 15915
M=D // 15916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 4}
//}

@3 // 15917
D=A // 15918
@SP // 15919
AM=M+1 // 15920
A=A-1 // 15921
M=D // 15922
// call Number.new
@6 // 15923
D=A // 15924
@14 // 15925
M=D // 15926
@Number.new // 15927
D=A // 15928
@13 // 15929
M=D // 15930
@Main.render.ret.7 // 15931
D=A // 15932
@CALL // 15933
0;JMP // 15934
(Main.render.ret.7)
@LCL // 15935
D=M // 15936
@4 // 15937
A=D+A // 15938
D=A // 15939
@R13 // 15940
M=D // 15941
@SP // 15942
AM=M-1 // 15943
D=M // 15944
@R13 // 15945
A=M // 15946
M=D // 15947

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 5")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 5}
//}

@5 // 15948
D=A // 15949
@SP // 15950
AM=M+1 // 15951
A=A-1 // 15952
M=D // 15953
// call Number.new
@6 // 15954
D=A // 15955
@14 // 15956
M=D // 15957
@Number.new // 15958
D=A // 15959
@13 // 15960
M=D // 15961
@Main.render.ret.8 // 15962
D=A // 15963
@CALL // 15964
0;JMP // 15965
(Main.render.ret.8)
@LCL // 15966
D=M // 15967
@5 // 15968
A=D+A // 15969
D=A // 15970
@R13 // 15971
M=D // 15972
@SP // 15973
AM=M-1 // 15974
D=M // 15975
@R13 // 15976
A=M // 15977
M=D // 15978

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 7")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 6}
//}

@7 // 15979
D=A // 15980
@SP // 15981
AM=M+1 // 15982
A=A-1 // 15983
M=D // 15984
// call Number.new
@6 // 15985
D=A // 15986
@14 // 15987
M=D // 15988
@Number.new // 15989
D=A // 15990
@13 // 15991
M=D // 15992
@Main.render.ret.9 // 15993
D=A // 15994
@CALL // 15995
0;JMP // 15996
(Main.render.ret.9)
@LCL // 15997
D=M // 15998
@6 // 15999
A=D+A // 16000
D=A // 16001
@R13 // 16002
M=D // 16003
@SP // 16004
AM=M-1 // 16005
D=M // 16006
@R13 // 16007
A=M // 16008
M=D // 16009

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 7}
//}

@16 // 16010
D=A // 16011
@SP // 16012
AM=M+1 // 16013
A=A-1 // 16014
M=D // 16015
// call Number.new
@6 // 16016
D=A // 16017
@14 // 16018
M=D // 16019
@Number.new // 16020
D=A // 16021
@13 // 16022
M=D // 16023
@Main.render.ret.10 // 16024
D=A // 16025
@CALL // 16026
0;JMP // 16027
(Main.render.ret.10)
@LCL // 16028
D=M // 16029
@7 // 16030
A=D+A // 16031
D=A // 16032
@R13 // 16033
M=D // 16034
@SP // 16035
AM=M-1 // 16036
D=M // 16037
@R13 // 16038
A=M // 16039
M=D // 16040

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 8}
//}

@SP // 16041
AM=M+1 // 16042
A=A-1 // 16043
M=-1 // 16044
// call Number.new
@6 // 16045
D=A // 16046
@14 // 16047
M=D // 16048
@Number.new // 16049
D=A // 16050
@13 // 16051
M=D // 16052
@Main.render.ret.11 // 16053
D=A // 16054
@CALL // 16055
0;JMP // 16056
(Main.render.ret.11)
@LCL // 16057
D=M // 16058
@8 // 16059
A=D+A // 16060
D=A // 16061
@R13 // 16062
M=D // 16063
@SP // 16064
AM=M-1 // 16065
D=M // 16066
@R13 // 16067
A=M // 16068
M=D // 16069

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 16070
D=M // 16071
@9 // 16072
A=D+A // 16073
M=0 // 16074

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
@Main.render.LT.43 // 16075
D=A // 16076
@SP // 16077
AM=M+1 // 16078
A=A-1 // 16079
M=D // 16080
@RETURN_PUSH_LABEL_65 // 16081
D=A // 16082
@13 // 16083
M=D // 16084
@9 // 16085
D=A // 16086
@LCL_PUSH // 16087
0;JMP // 16088
(RETURN_PUSH_LABEL_65)
@ARG // 16089
A=M // 16090
D=M // 16091
@SP // 16092
AM=M+1 // 16093
A=A-1 // 16094
M=D // 16095
// call Scene.getHeight
@6 // 16096
D=A // 16097
@14 // 16098
M=D // 16099
@Scene.getHeight // 16100
D=A // 16101
@13 // 16102
M=D // 16103
@Main.render.ret.12 // 16104
D=A // 16105
@CALL // 16106
0;JMP // 16107
(Main.render.ret.12)
@SP // 16108
AM=M-1 // 16109
D=M // 16110
@SP // 16111
AM=M-1 // 16112
D=M-D // 16113
@DO_LT // 16114
0;JMP // 16115
(Main.render.LT.43)
D=!D // 16116
@Main.render_WHILE_END2 // 16117
D;JNE // 16118

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

@LCL // 16119
D=M // 16120
@9 // 16121
A=D+A // 16122
D=M // 16123
@1 // 16124
D=D&A // 16125
@SP // 16126
AM=M+1 // 16127
A=A-1 // 16128
M=D // 16129
@LCL // 16130
D=M // 16131
@27 // 16132
A=D+A // 16133
D=A // 16134
@R13 // 16135
M=D // 16136
@SP // 16137
AM=M-1 // 16138
D=M // 16139
@R13 // 16140
A=M // 16141
M=D // 16142

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 28}
//}

@LCL // 16143
D=M // 16144
@28 // 16145
A=D+A // 16146
M=-1 // 16147

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE1}}
@LCL // 16148
D=M // 16149
@27 // 16150
A=D+A // 16151
D=M // 16152
@Main.render$IF_TRUE1 // 16153
D;JNE // 16154

////GotoInstruction{label='Main.render$IF_FALSE1}
// goto Main.render$IF_FALSE1
@Main.render$IF_FALSE1 // 16155
0;JMP // 16156

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

@LCL // 16157
D=M // 16158
@12 // 16159
A=D+A // 16160
D=M // 16161
D=D-1 // 16162
@SP // 16163
AM=M+1 // 16164
A=A-1 // 16165
M=D // 16166
@LCL // 16167
D=M // 16168
@10 // 16169
A=D+A // 16170
D=A // 16171
@R13 // 16172
M=D // 16173
@SP // 16174
AM=M-1 // 16175
D=M // 16176
@R13 // 16177
A=M // 16178
M=D // 16179

////GotoInstruction{label='Main.render$IF_END1}
// goto Main.render$IF_END1
@Main.render$IF_END1 // 16180
0;JMP // 16181

////LabelInstruction{label='Main.render$IF_FALSE1}
// label Main.render$IF_FALSE1
(Main.render$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 16182
D=M // 16183
@10 // 16184
A=D+A // 16185
M=0 // 16186

////LabelInstruction{label='Main.render$IF_END1}
// label Main.render$IF_END1
(Main.render$IF_END1)

////LabelInstruction{label='Main.render_WHILE_EXP3}
// label Main.render_WHILE_EXP3
(Main.render_WHILE_EXP3)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 28"),
//NOT), ifGoto=IfGotoInstruction{label='Main.render_WHILE_END3}}
@LCL // 16187
D=M // 16188
@28 // 16189
A=D+A // 16190
D=!M // 16191
@Main.render_WHILE_END3 // 16192
D;JNE // 16193

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 10"), PushInstruction("local 9"), PushInstruction("local 8"), PushInstruction("local 2"), PushInstruction("local 3"), PushInstruction("local 0")], call=CallInstruction{Main.getRawPixelColor}}
//  pop:  PopInstruction{address=local 25}
//}

@ARG // 16194
A=M // 16195
D=M // 16196
@SP // 16197
AM=M+1 // 16198
A=A-1 // 16199
M=D // 16200
@RETURN_PUSH_LABEL_66 // 16201
D=A // 16202
@13 // 16203
M=D // 16204
@10 // 16205
D=A // 16206
@LCL_PUSH // 16207
0;JMP // 16208
(RETURN_PUSH_LABEL_66)
@RETURN_PUSH_LABEL_67 // 16209
D=A // 16210
@13 // 16211
M=D // 16212
@9 // 16213
D=A // 16214
@LCL_PUSH // 16215
0;JMP // 16216
(RETURN_PUSH_LABEL_67)
@RETURN_PUSH_LABEL_68 // 16217
D=A // 16218
@13 // 16219
M=D // 16220
@8 // 16221
D=A // 16222
@LCL_PUSH // 16223
0;JMP // 16224
(RETURN_PUSH_LABEL_68)
@LCL // 16225
A=M+1 // 16226
A=A+1 // 16227
D=M // 16228
@SP // 16229
AM=M+1 // 16230
A=A-1 // 16231
M=D // 16232
@LCL // 16233
A=M+1 // 16234
A=A+1 // 16235
A=A+1 // 16236
D=M // 16237
@SP // 16238
AM=M+1 // 16239
A=A-1 // 16240
M=D // 16241
@LCL // 16242
A=M // 16243
D=M // 16244
@SP // 16245
AM=M+1 // 16246
A=A-1 // 16247
M=D // 16248
// call Main.getRawPixelColor
@12 // 16249
D=A // 16250
@14 // 16251
M=D // 16252
@Main.getRawPixelColor // 16253
D=A // 16254
@13 // 16255
M=D // 16256
@Main.render.ret.13 // 16257
D=A // 16258
@CALL // 16259
0;JMP // 16260
(Main.render.ret.13)
@LCL // 16261
D=M // 16262
@25 // 16263
A=D+A // 16264
D=A // 16265
@R13 // 16266
M=D // 16267
@SP // 16268
AM=M-1 // 16269
D=M // 16270
@R13 // 16271
A=M // 16272
M=D // 16273

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_69 // 16274
D=A // 16275
@13 // 16276
M=D // 16277
@25 // 16278
D=A // 16279
@LCL_PUSH // 16280
0;JMP // 16281
(RETURN_PUSH_LABEL_69)
// call Number.do_sqrt
@6 // 16282
D=A // 16283
@14 // 16284
M=D // 16285
@Number.do_sqrt // 16286
D=A // 16287
@13 // 16288
M=D // 16289
@Main.render.ret.14 // 16290
D=A // 16291
@CALL // 16292
0;JMP // 16293
(Main.render.ret.14)
@SP // 16294
M=M-1 // 16295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 16")], call=CallInstruction{Number.new_from_int_frac}}
//  pop:  PopInstruction{address=local 26}
//}

@RETURN_PUSH_LABEL_70 // 16296
D=A // 16297
@13 // 16298
M=D // 16299
@16 // 16300
D=A // 16301
@LCL_PUSH // 16302
0;JMP // 16303
(RETURN_PUSH_LABEL_70)
// call Number.new_from_int_frac
@6 // 16304
D=A // 16305
@14 // 16306
M=D // 16307
@Number.new_from_int_frac // 16308
D=A // 16309
@13 // 16310
M=D // 16311
@Main.render.ret.15 // 16312
D=A // 16313
@CALL // 16314
0;JMP // 16315
(Main.render.ret.15)
@LCL // 16316
D=M // 16317
@26 // 16318
A=D+A // 16319
D=A // 16320
@R13 // 16321
M=D // 16322
@SP // 16323
AM=M-1 // 16324
D=M // 16325
@R13 // 16326
A=M // 16327
M=D // 16328

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 26")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_71 // 16329
D=A // 16330
@13 // 16331
M=D // 16332
@25 // 16333
D=A // 16334
@LCL_PUSH // 16335
0;JMP // 16336
(RETURN_PUSH_LABEL_71)
@RETURN_PUSH_LABEL_72 // 16337
D=A // 16338
@13 // 16339
M=D // 16340
@26 // 16341
D=A // 16342
@LCL_PUSH // 16343
0;JMP // 16344
(RETURN_PUSH_LABEL_72)
// call Number.do_add
@7 // 16345
D=A // 16346
@14 // 16347
M=D // 16348
@Number.do_add // 16349
D=A // 16350
@13 // 16351
M=D // 16352
@Main.render.ret.16 // 16353
D=A // 16354
@CALL // 16355
0;JMP // 16356
(Main.render.ret.16)
@SP // 16357
M=M-1 // 16358

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 26")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_73 // 16359
D=A // 16360
@13 // 16361
M=D // 16362
@26 // 16363
D=A // 16364
@LCL_PUSH // 16365
0;JMP // 16366
(RETURN_PUSH_LABEL_73)
// call Number.dispose
@6 // 16367
D=A // 16368
@14 // 16369
M=D // 16370
@Number.dispose // 16371
D=A // 16372
@13 // 16373
M=D // 16374
@Main.render.ret.17 // 16375
D=A // 16376
@CALL // 16377
0;JMP // 16378
(Main.render.ret.17)
@SP // 16379
M=M-1 // 16380

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

@LCL // 16381
D=M // 16382
@13 // 16383
A=D+A // 16384
D=M // 16385
A=A-1 // 16386
A=A-1 // 16387
A=A-1 // 16388
A=D+M // 16389
D=M // 16390
@SP // 16391
AM=M+1 // 16392
A=A-1 // 16393
M=D // 16394
// call Number.new_from_int_frac
@6 // 16395
D=A // 16396
@14 // 16397
M=D // 16398
@Number.new_from_int_frac // 16399
D=A // 16400
@13 // 16401
M=D // 16402
@Main.render.ret.18 // 16403
D=A // 16404
@CALL // 16405
0;JMP // 16406
(Main.render.ret.18)
@LCL // 16407
D=M // 16408
@26 // 16409
A=D+A // 16410
D=A // 16411
@R13 // 16412
M=D // 16413
@SP // 16414
AM=M-1 // 16415
D=M // 16416
@R13 // 16417
A=M // 16418
M=D // 16419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 26")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_74 // 16420
D=A // 16421
@13 // 16422
M=D // 16423
@25 // 16424
D=A // 16425
@LCL_PUSH // 16426
0;JMP // 16427
(RETURN_PUSH_LABEL_74)
@RETURN_PUSH_LABEL_75 // 16428
D=A // 16429
@13 // 16430
M=D // 16431
@26 // 16432
D=A // 16433
@LCL_PUSH // 16434
0;JMP // 16435
(RETURN_PUSH_LABEL_75)
// call Number.do_add
@7 // 16436
D=A // 16437
@14 // 16438
M=D // 16439
@Number.do_add // 16440
D=A // 16441
@13 // 16442
M=D // 16443
@Main.render.ret.19 // 16444
D=A // 16445
@CALL // 16446
0;JMP // 16447
(Main.render.ret.19)
@SP // 16448
M=M-1 // 16449

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 26")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_76 // 16450
D=A // 16451
@13 // 16452
M=D // 16453
@26 // 16454
D=A // 16455
@LCL_PUSH // 16456
0;JMP // 16457
(RETURN_PUSH_LABEL_76)
// call Number.dispose
@6 // 16458
D=A // 16459
@14 // 16460
M=D // 16461
@Number.dispose // 16462
D=A // 16463
@13 // 16464
M=D // 16465
@Main.render.ret.20 // 16466
D=A // 16467
@CALL // 16468
0;JMP // 16469
(Main.render.ret.20)
@SP // 16470
M=M-1 // 16471

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25"), PushInstruction("local 0")], call=CallInstruction{Number.cmp}}
//  pop:  PopInstruction{address=local 18}
//}

@RETURN_PUSH_LABEL_77 // 16472
D=A // 16473
@13 // 16474
M=D // 16475
@25 // 16476
D=A // 16477
@LCL_PUSH // 16478
0;JMP // 16479
(RETURN_PUSH_LABEL_77)
@LCL // 16480
A=M // 16481
D=M // 16482
@SP // 16483
AM=M+1 // 16484
A=A-1 // 16485
M=D // 16486
// call Number.cmp
@7 // 16487
D=A // 16488
@14 // 16489
M=D // 16490
@Number.cmp // 16491
D=A // 16492
@13 // 16493
M=D // 16494
@Main.render.ret.21 // 16495
D=A // 16496
@CALL // 16497
0;JMP // 16498
(Main.render.ret.21)
@LCL // 16499
D=M // 16500
@18 // 16501
A=D+A // 16502
D=A // 16503
@R13 // 16504
M=D // 16505
@SP // 16506
AM=M-1 // 16507
D=M // 16508
@R13 // 16509
A=M // 16510
M=D // 16511

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

@Main.render.LT.44 // 16512
D=A // 16513
@SP // 16514
AM=M+1 // 16515
A=A-1 // 16516
M=D // 16517
@LCL // 16518
D=M // 16519
@18 // 16520
A=D+A // 16521
D=M // 16522
@DO_LT // 16523
0;JMP // 16524
(Main.render.LT.44)
@SP // 16525
AM=M+1 // 16526
A=A-1 // 16527
M=D // 16528
@SP // 16529
A=M-1 // 16530
M=!D // 16531
@LCL // 16532
D=M // 16533
@24 // 16534
A=D+A // 16535
D=A // 16536
@R13 // 16537
M=D // 16538
@SP // 16539
AM=M-1 // 16540
D=M // 16541
@R13 // 16542
A=M // 16543
M=D // 16544

////ConditionalGroup{push=PushInstruction("local 24"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE2}}
@LCL // 16545
D=M // 16546
@24 // 16547
A=D+A // 16548
D=M // 16549
@Main.render$IF_TRUE2 // 16550
D;JNE // 16551

////GotoInstruction{label='Main.render$IF_FALSE2}
// goto Main.render$IF_FALSE2
@Main.render$IF_FALSE2 // 16552
0;JMP // 16553

////LabelInstruction{label='Main.render$IF_TRUE2}
// label Main.render$IF_TRUE2
(Main.render$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 17}
//}

@LCL // 16554
A=M+1 // 16555
A=A+1 // 16556
D=M // 16557
@SP // 16558
AM=M+1 // 16559
A=A-1 // 16560
M=D // 16561
@LCL // 16562
D=M // 16563
@17 // 16564
A=D+A // 16565
D=A // 16566
@R13 // 16567
M=D // 16568
@SP // 16569
AM=M-1 // 16570
D=M // 16571
@R13 // 16572
A=M // 16573
M=D // 16574

////GotoInstruction{label='Main.render$IF_END2}
// goto Main.render$IF_END2
@Main.render$IF_END2 // 16575
0;JMP // 16576

////LabelInstruction{label='Main.render$IF_FALSE2}
// label Main.render$IF_FALSE2
(Main.render$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 17}
//}

@LCL // 16577
A=M+1 // 16578
D=M // 16579
@SP // 16580
AM=M+1 // 16581
A=A-1 // 16582
M=D // 16583
@LCL // 16584
D=M // 16585
@17 // 16586
A=D+A // 16587
D=A // 16588
@R13 // 16589
M=D // 16590
@SP // 16591
AM=M-1 // 16592
D=M // 16593
@R13 // 16594
A=M // 16595
M=D // 16596

////LabelInstruction{label='Main.render$IF_END2}
// label Main.render$IF_END2
(Main.render$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 19}
//}

@RETURN_PUSH_LABEL_78 // 16597
D=A // 16598
@13 // 16599
M=D // 16600
@25 // 16601
D=A // 16602
@LCL_PUSH // 16603
0;JMP // 16604
(RETURN_PUSH_LABEL_78)
// call Number.clone
@6 // 16605
D=A // 16606
@14 // 16607
M=D // 16608
@Number.clone // 16609
D=A // 16610
@13 // 16611
M=D // 16612
@Main.render.ret.22 // 16613
D=A // 16614
@CALL // 16615
0;JMP // 16616
(Main.render.ret.22)
@LCL // 16617
D=M // 16618
@19 // 16619
A=D+A // 16620
D=A // 16621
@R13 // 16622
M=D // 16623
@SP // 16624
AM=M-1 // 16625
D=M // 16626
@R13 // 16627
A=M // 16628
M=D // 16629

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19"), PushInstruction("local 17")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_79 // 16630
D=A // 16631
@13 // 16632
M=D // 16633
@19 // 16634
D=A // 16635
@LCL_PUSH // 16636
0;JMP // 16637
(RETURN_PUSH_LABEL_79)
@RETURN_PUSH_LABEL_80 // 16638
D=A // 16639
@13 // 16640
M=D // 16641
@17 // 16642
D=A // 16643
@LCL_PUSH // 16644
0;JMP // 16645
(RETURN_PUSH_LABEL_80)
// call Number.do_sub
@7 // 16646
D=A // 16647
@14 // 16648
M=D // 16649
@Number.do_sub // 16650
D=A // 16651
@13 // 16652
M=D // 16653
@Main.render.ret.23 // 16654
D=A // 16655
@CALL // 16656
0;JMP // 16657
(Main.render.ret.23)
@SP // 16658
M=M-1 // 16659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19"), PushInstruction("local 7")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_81 // 16660
D=A // 16661
@13 // 16662
M=D // 16663
@19 // 16664
D=A // 16665
@LCL_PUSH // 16666
0;JMP // 16667
(RETURN_PUSH_LABEL_81)
@RETURN_PUSH_LABEL_82 // 16668
D=A // 16669
@13 // 16670
M=D // 16671
@7 // 16672
D=A // 16673
@LCL_PUSH // 16674
0;JMP // 16675
(RETURN_PUSH_LABEL_82)
// call Number.do_div
@7 // 16676
D=A // 16677
@14 // 16678
M=D // 16679
@Number.do_div // 16680
D=A // 16681
@13 // 16682
M=D // 16683
@Main.render.ret.24 // 16684
D=A // 16685
@CALL // 16686
0;JMP // 16687
(Main.render.ret.24)
@SP // 16688
M=M-1 // 16689

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
@Main.render.LT.45 // 16690
D=A // 16691
@SP // 16692
AM=M+1 // 16693
A=A-1 // 16694
M=D // 16695
@LCL // 16696
D=M // 16697
@10 // 16698
A=D+A // 16699
D=M // 16700
D=D+1 // 16701
@SP // 16702
AM=M+1 // 16703
A=A-1 // 16704
M=D // 16705
@LCL // 16706
D=M // 16707
@12 // 16708
A=D+A // 16709
D=M // 16710
@SP // 16711
AM=M-1 // 16712
D=M-D // 16713
@DO_LT // 16714
0;JMP // 16715
(Main.render.LT.45)
@Main.render$IF_TRUE3 // 16716
D;JNE // 16717

////GotoInstruction{label='Main.render$IF_END3}
// goto Main.render$IF_END3
@Main.render$IF_END3 // 16718
0;JMP // 16719

////LabelInstruction{label='Main.render$IF_TRUE3}
// label Main.render$IF_TRUE3
(Main.render$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 21}
//}

@RETURN_PUSH_LABEL_83 // 16720
D=A // 16721
@13 // 16722
M=D // 16723
@19 // 16724
D=A // 16725
@LCL_PUSH // 16726
0;JMP // 16727
(RETURN_PUSH_LABEL_83)
// call Number.clone
@6 // 16728
D=A // 16729
@14 // 16730
M=D // 16731
@Number.clone // 16732
D=A // 16733
@13 // 16734
M=D // 16735
@Main.render.ret.25 // 16736
D=A // 16737
@CALL // 16738
0;JMP // 16739
(Main.render.ret.25)
@LCL // 16740
D=M // 16741
@21 // 16742
A=D+A // 16743
D=A // 16744
@R13 // 16745
M=D // 16746
@SP // 16747
AM=M-1 // 16748
D=M // 16749
@R13 // 16750
A=M // 16751
M=D // 16752

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21"), PushInstruction("local 6")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_84 // 16753
D=A // 16754
@13 // 16755
M=D // 16756
@21 // 16757
D=A // 16758
@LCL_PUSH // 16759
0;JMP // 16760
(RETURN_PUSH_LABEL_84)
@RETURN_PUSH_LABEL_85 // 16761
D=A // 16762
@13 // 16763
M=D // 16764
@6 // 16765
D=A // 16766
@LCL_PUSH // 16767
0;JMP // 16768
(RETURN_PUSH_LABEL_85)
// call Number.do_mul
@7 // 16769
D=A // 16770
@14 // 16771
M=D // 16772
@Number.do_mul // 16773
D=A // 16774
@13 // 16775
M=D // 16776
@Main.render.ret.26 // 16777
D=A // 16778
@CALL // 16779
0;JMP // 16780
(Main.render.ret.26)
@SP // 16781
M=M-1 // 16782

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21")], call=CallInstruction{Number.frac_to_i16}}
//  pop:  PopInstruction{address=local 16}
//}

@RETURN_PUSH_LABEL_86 // 16783
D=A // 16784
@13 // 16785
M=D // 16786
@21 // 16787
D=A // 16788
@LCL_PUSH // 16789
0;JMP // 16790
(RETURN_PUSH_LABEL_86)
// call Number.frac_to_i16
@6 // 16791
D=A // 16792
@14 // 16793
M=D // 16794
@Number.frac_to_i16 // 16795
D=A // 16796
@13 // 16797
M=D // 16798
@Main.render.ret.27 // 16799
D=A // 16800
@CALL // 16801
0;JMP // 16802
(Main.render.ret.27)
@LCL // 16803
D=M // 16804
@16 // 16805
A=D+A // 16806
D=A // 16807
@R13 // 16808
M=D // 16809
@SP // 16810
AM=M-1 // 16811
D=M // 16812
@R13 // 16813
A=M // 16814
M=D // 16815

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 21")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_87 // 16816
D=A // 16817
@13 // 16818
M=D // 16819
@21 // 16820
D=A // 16821
@LCL_PUSH // 16822
0;JMP // 16823
(RETURN_PUSH_LABEL_87)
// call Number.dispose
@6 // 16824
D=A // 16825
@14 // 16826
M=D // 16827
@Number.dispose // 16828
D=A // 16829
@13 // 16830
M=D // 16831
@Main.render.ret.28 // 16832
D=A // 16833
@CALL // 16834
0;JMP // 16835
(Main.render.ret.28)
@SP // 16836
M=M-1 // 16837

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
@Main.render.LT.46 // 16838
D=A // 16839
@SP // 16840
AM=M+1 // 16841
A=A-1 // 16842
M=D // 16843
@LCL // 16844
D=M // 16845
@9 // 16846
A=D+A // 16847
D=M // 16848
D=D+1 // 16849
@SP // 16850
AM=M+1 // 16851
A=A-1 // 16852
M=D // 16853
@ARG // 16854
A=M // 16855
D=M // 16856
@SP // 16857
AM=M+1 // 16858
A=A-1 // 16859
M=D // 16860
// call Scene.getHeight
@6 // 16861
D=A // 16862
@14 // 16863
M=D // 16864
@Scene.getHeight // 16865
D=A // 16866
@13 // 16867
M=D // 16868
@Main.render.ret.29 // 16869
D=A // 16870
@CALL // 16871
0;JMP // 16872
(Main.render.ret.29)
@SP // 16873
AM=M-1 // 16874
D=M // 16875
@SP // 16876
AM=M-1 // 16877
D=M-D // 16878
@DO_LT // 16879
0;JMP // 16880
(Main.render.LT.46)
@Main.render$IF_TRUE4 // 16881
D;JNE // 16882

////GotoInstruction{label='Main.render$IF_END4}
// goto Main.render$IF_END4
@Main.render$IF_END4 // 16883
0;JMP // 16884

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
@Main.render.GT.47 // 16885
D=A // 16886
@SP // 16887
AM=M+1 // 16888
A=A-1 // 16889
M=D // 16890
@LCL // 16891
D=M // 16892
@10 // 16893
A=D+A // 16894
D=M // 16895
@DO_GT // 16896
0;JMP // 16897
(Main.render.GT.47)
@Main.render$IF_TRUE5 // 16898
D;JNE // 16899

////GotoInstruction{label='Main.render$IF_END5}
// goto Main.render$IF_END5
@Main.render$IF_END5 // 16900
0;JMP // 16901

////LabelInstruction{label='Main.render$IF_TRUE5}
// label Main.render$IF_TRUE5
(Main.render$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 22}
//}

@RETURN_PUSH_LABEL_88 // 16902
D=A // 16903
@13 // 16904
M=D // 16905
@19 // 16906
D=A // 16907
@LCL_PUSH // 16908
0;JMP // 16909
(RETURN_PUSH_LABEL_88)
// call Number.clone
@6 // 16910
D=A // 16911
@14 // 16912
M=D // 16913
@Number.clone // 16914
D=A // 16915
@13 // 16916
M=D // 16917
@Main.render.ret.30 // 16918
D=A // 16919
@CALL // 16920
0;JMP // 16921
(Main.render.ret.30)
@LCL // 16922
D=M // 16923
@22 // 16924
A=D+A // 16925
D=A // 16926
@R13 // 16927
M=D // 16928
@SP // 16929
AM=M-1 // 16930
D=M // 16931
@R13 // 16932
A=M // 16933
M=D // 16934

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 27"),
//NOT), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE6}}
@LCL // 16935
D=M // 16936
@27 // 16937
A=D+A // 16938
D=!M // 16939
@Main.render$IF_TRUE6 // 16940
D;JNE // 16941

////GotoInstruction{label='Main.render$IF_END6}
// goto Main.render$IF_END6
@Main.render$IF_END6 // 16942
0;JMP // 16943

////LabelInstruction{label='Main.render$IF_TRUE6}
// label Main.render$IF_TRUE6
(Main.render$IF_TRUE6)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 22"), PushInstruction("local 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_89 // 16944
D=A // 16945
@13 // 16946
M=D // 16947
@22 // 16948
D=A // 16949
@LCL_PUSH // 16950
0;JMP // 16951
(RETURN_PUSH_LABEL_89)
@RETURN_PUSH_LABEL_90 // 16952
D=A // 16953
@13 // 16954
M=D // 16955
@4 // 16956
D=A // 16957
@LCL_PUSH // 16958
0;JMP // 16959
(RETURN_PUSH_LABEL_90)
// call Number.do_mul
@7 // 16960
D=A // 16961
@14 // 16962
M=D // 16963
@Number.do_mul // 16964
D=A // 16965
@13 // 16966
M=D // 16967
@Main.render.ret.31 // 16968
D=A // 16969
@CALL // 16970
0;JMP // 16971
(Main.render.ret.31)
@SP // 16972
M=M-1 // 16973

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
@RETURN_PUSH_LABEL_91 // 16974
D=A // 16975
@13 // 16976
M=D // 16977
@14 // 16978
D=A // 16979
@LCL_PUSH // 16980
0;JMP // 16981
(RETURN_PUSH_LABEL_91)
@LCL // 16982
D=M // 16983
@10 // 16984
A=D+A // 16985
D=M // 16986
D=D-1 // 16987
@SP // 16988
AM=M-1 // 16989
D=D+M // 16990
@SP // 16991
AM=M+1 // 16992
A=A-1 // 16993
M=D // 16994
@RETURN_PUSH_LABEL_92 // 16995
D=A // 16996
@13 // 16997
M=D // 16998
@14 // 16999
D=A // 17000
@LCL_PUSH // 17001
0;JMP // 17002
(RETURN_PUSH_LABEL_92)
@LCL // 17003
D=M // 17004
@10 // 17005
A=D+A // 17006
D=M // 17007
D=D-1 // 17008
@SP // 17009
AM=M-1 // 17010
A=D+M // 17011
D=M // 17012
@SP // 17013
AM=M+1 // 17014
A=A-1 // 17015
M=D // 17016
@RETURN_PUSH_LABEL_93 // 17017
D=A // 17018
@13 // 17019
M=D // 17020
@22 // 17021
D=A // 17022
@LCL_PUSH // 17023
0;JMP // 17024
(RETURN_PUSH_LABEL_93)
// call Number.frac_to_i16
@6 // 17025
D=A // 17026
@14 // 17027
M=D // 17028
@Number.frac_to_i16 // 17029
D=A // 17030
@13 // 17031
M=D // 17032
@Main.render.ret.32 // 17033
D=A // 17034
@CALL // 17035
0;JMP // 17036
(Main.render.ret.32)
@SP // 17037
AM=M-1 // 17038
D=M // 17039
@SP // 17040
AM=M-1 // 17041
D=D+M // 17042
@SP // 17043
AM=M-1 // 17044
A=M // 17045
M=D // 17046

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 22")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_94 // 17047
D=A // 17048
@13 // 17049
M=D // 17050
@22 // 17051
D=A // 17052
@LCL_PUSH // 17053
0;JMP // 17054
(RETURN_PUSH_LABEL_94)
// call Number.dispose
@6 // 17055
D=A // 17056
@14 // 17057
M=D // 17058
@Number.dispose // 17059
D=A // 17060
@13 // 17061
M=D // 17062
@Main.render.ret.33 // 17063
D=A // 17064
@CALL // 17065
0;JMP // 17066
(Main.render.ret.33)
@SP // 17067
M=M-1 // 17068

////LabelInstruction{label='Main.render$IF_END5}
// label Main.render$IF_END5
(Main.render$IF_END5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 20}
//}

@RETURN_PUSH_LABEL_95 // 17069
D=A // 17070
@13 // 17071
M=D // 17072
@19 // 17073
D=A // 17074
@LCL_PUSH // 17075
0;JMP // 17076
(RETURN_PUSH_LABEL_95)
// call Number.clone
@6 // 17077
D=A // 17078
@14 // 17079
M=D // 17080
@Number.clone // 17081
D=A // 17082
@13 // 17083
M=D // 17084
@Main.render.ret.34 // 17085
D=A // 17086
@CALL // 17087
0;JMP // 17088
(Main.render.ret.34)
@LCL // 17089
D=M // 17090
@20 // 17091
A=D+A // 17092
D=A // 17093
@R13 // 17094
M=D // 17095
@SP // 17096
AM=M-1 // 17097
D=M // 17098
@R13 // 17099
A=M // 17100
M=D // 17101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 20"), PushInstruction("local 5")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_96 // 17102
D=A // 17103
@13 // 17104
M=D // 17105
@20 // 17106
D=A // 17107
@LCL_PUSH // 17108
0;JMP // 17109
(RETURN_PUSH_LABEL_96)
@RETURN_PUSH_LABEL_97 // 17110
D=A // 17111
@13 // 17112
M=D // 17113
@5 // 17114
D=A // 17115
@LCL_PUSH // 17116
0;JMP // 17117
(RETURN_PUSH_LABEL_97)
// call Number.do_mul
@7 // 17118
D=A // 17119
@14 // 17120
M=D // 17121
@Number.do_mul // 17122
D=A // 17123
@13 // 17124
M=D // 17125
@Main.render.ret.35 // 17126
D=A // 17127
@CALL // 17128
0;JMP // 17129
(Main.render.ret.35)
@SP // 17130
M=M-1 // 17131

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
@RETURN_PUSH_LABEL_98 // 17132
D=A // 17133
@13 // 17134
M=D // 17135
@14 // 17136
D=A // 17137
@LCL_PUSH // 17138
0;JMP // 17139
(RETURN_PUSH_LABEL_98)
@LCL // 17140
D=M // 17141
@10 // 17142
A=D+A // 17143
D=M // 17144
@SP // 17145
AM=M-1 // 17146
D=D+M // 17147
@SP // 17148
AM=M+1 // 17149
A=A-1 // 17150
M=D // 17151
@RETURN_PUSH_LABEL_99 // 17152
D=A // 17153
@13 // 17154
M=D // 17155
@14 // 17156
D=A // 17157
@LCL_PUSH // 17158
0;JMP // 17159
(RETURN_PUSH_LABEL_99)
@LCL // 17160
D=M // 17161
@10 // 17162
A=D+A // 17163
D=M // 17164
@SP // 17165
AM=M-1 // 17166
A=D+M // 17167
D=M // 17168
@SP // 17169
AM=M+1 // 17170
A=A-1 // 17171
M=D // 17172
@RETURN_PUSH_LABEL_100 // 17173
D=A // 17174
@13 // 17175
M=D // 17176
@20 // 17177
D=A // 17178
@LCL_PUSH // 17179
0;JMP // 17180
(RETURN_PUSH_LABEL_100)
// call Number.frac_to_i16
@6 // 17181
D=A // 17182
@14 // 17183
M=D // 17184
@Number.frac_to_i16 // 17185
D=A // 17186
@13 // 17187
M=D // 17188
@Main.render.ret.36 // 17189
D=A // 17190
@CALL // 17191
0;JMP // 17192
(Main.render.ret.36)
@SP // 17193
AM=M-1 // 17194
D=M // 17195
@SP // 17196
AM=M-1 // 17197
D=D+M // 17198
@SP // 17199
AM=M-1 // 17200
A=M // 17201
M=D // 17202

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 20")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_101 // 17203
D=A // 17204
@13 // 17205
M=D // 17206
@20 // 17207
D=A // 17208
@LCL_PUSH // 17209
0;JMP // 17210
(RETURN_PUSH_LABEL_101)
// call Number.dispose
@6 // 17211
D=A // 17212
@14 // 17213
M=D // 17214
@Number.dispose // 17215
D=A // 17216
@13 // 17217
M=D // 17218
@Main.render.ret.37 // 17219
D=A // 17220
@CALL // 17221
0;JMP // 17222
(Main.render.ret.37)
@SP // 17223
M=M-1 // 17224

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
@Main.render.LT.48 // 17225
D=A // 17226
@SP // 17227
AM=M+1 // 17228
A=A-1 // 17229
M=D // 17230
@LCL // 17231
D=M // 17232
@10 // 17233
A=D+A // 17234
D=M // 17235
D=D+1 // 17236
@SP // 17237
AM=M+1 // 17238
A=A-1 // 17239
M=D // 17240
@LCL // 17241
D=M // 17242
@12 // 17243
A=D+A // 17244
D=M // 17245
@SP // 17246
AM=M-1 // 17247
D=M-D // 17248
@DO_LT // 17249
0;JMP // 17250
(Main.render.LT.48)
@Main.render$IF_TRUE7 // 17251
D;JNE // 17252

////GotoInstruction{label='Main.render$IF_END7}
// goto Main.render$IF_END7
@Main.render$IF_END7 // 17253
0;JMP // 17254

////LabelInstruction{label='Main.render$IF_TRUE7}
// label Main.render$IF_TRUE7
(Main.render$IF_TRUE7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 19")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 23}
//}

@RETURN_PUSH_LABEL_102 // 17255
D=A // 17256
@13 // 17257
M=D // 17258
@19 // 17259
D=A // 17260
@LCL_PUSH // 17261
0;JMP // 17262
(RETURN_PUSH_LABEL_102)
// call Number.clone
@6 // 17263
D=A // 17264
@14 // 17265
M=D // 17266
@Number.clone // 17267
D=A // 17268
@13 // 17269
M=D // 17270
@Main.render.ret.38 // 17271
D=A // 17272
@CALL // 17273
0;JMP // 17274
(Main.render.ret.38)
@LCL // 17275
D=M // 17276
@23 // 17277
A=D+A // 17278
D=A // 17279
@R13 // 17280
M=D // 17281
@SP // 17282
AM=M-1 // 17283
D=M // 17284
@R13 // 17285
A=M // 17286
M=D // 17287

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE8}}
@LCL // 17288
D=M // 17289
@27 // 17290
A=D+A // 17291
D=M // 17292
@Main.render$IF_TRUE8 // 17293
D;JNE // 17294

////GotoInstruction{label='Main.render$IF_END8}
// goto Main.render$IF_END8
@Main.render$IF_END8 // 17295
0;JMP // 17296

////LabelInstruction{label='Main.render$IF_TRUE8}
// label Main.render$IF_TRUE8
(Main.render$IF_TRUE8)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 23"), PushInstruction("local 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_103 // 17297
D=A // 17298
@13 // 17299
M=D // 17300
@23 // 17301
D=A // 17302
@LCL_PUSH // 17303
0;JMP // 17304
(RETURN_PUSH_LABEL_103)
@RETURN_PUSH_LABEL_104 // 17305
D=A // 17306
@13 // 17307
M=D // 17308
@4 // 17309
D=A // 17310
@LCL_PUSH // 17311
0;JMP // 17312
(RETURN_PUSH_LABEL_104)
// call Number.do_mul
@7 // 17313
D=A // 17314
@14 // 17315
M=D // 17316
@Number.do_mul // 17317
D=A // 17318
@13 // 17319
M=D // 17320
@Main.render.ret.39 // 17321
D=A // 17322
@CALL // 17323
0;JMP // 17324
(Main.render.ret.39)
@SP // 17325
M=M-1 // 17326

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
@RETURN_PUSH_LABEL_105 // 17327
D=A // 17328
@13 // 17329
M=D // 17330
@14 // 17331
D=A // 17332
@LCL_PUSH // 17333
0;JMP // 17334
(RETURN_PUSH_LABEL_105)
@LCL // 17335
D=M // 17336
@10 // 17337
A=D+A // 17338
D=M // 17339
D=D+1 // 17340
@SP // 17341
AM=M-1 // 17342
D=D+M // 17343
@SP // 17344
AM=M+1 // 17345
A=A-1 // 17346
M=D // 17347
@RETURN_PUSH_LABEL_106 // 17348
D=A // 17349
@13 // 17350
M=D // 17351
@14 // 17352
D=A // 17353
@LCL_PUSH // 17354
0;JMP // 17355
(RETURN_PUSH_LABEL_106)
@LCL // 17356
D=M // 17357
@10 // 17358
A=D+A // 17359
D=M // 17360
D=D+1 // 17361
@SP // 17362
AM=M-1 // 17363
A=D+M // 17364
D=M // 17365
@SP // 17366
AM=M+1 // 17367
A=A-1 // 17368
M=D // 17369
@RETURN_PUSH_LABEL_107 // 17370
D=A // 17371
@13 // 17372
M=D // 17373
@23 // 17374
D=A // 17375
@LCL_PUSH // 17376
0;JMP // 17377
(RETURN_PUSH_LABEL_107)
// call Number.frac_to_i16
@6 // 17378
D=A // 17379
@14 // 17380
M=D // 17381
@Number.frac_to_i16 // 17382
D=A // 17383
@13 // 17384
M=D // 17385
@Main.render.ret.40 // 17386
D=A // 17387
@CALL // 17388
0;JMP // 17389
(Main.render.ret.40)
@SP // 17390
AM=M-1 // 17391
D=M // 17392
@SP // 17393
AM=M-1 // 17394
D=D+M // 17395
@SP // 17396
AM=M-1 // 17397
A=M // 17398
M=D // 17399

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 23")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_108 // 17400
D=A // 17401
@13 // 17402
M=D // 17403
@23 // 17404
D=A // 17405
@LCL_PUSH // 17406
0;JMP // 17407
(RETURN_PUSH_LABEL_108)
// call Number.dispose
@6 // 17408
D=A // 17409
@14 // 17410
M=D // 17411
@Number.dispose // 17412
D=A // 17413
@13 // 17414
M=D // 17415
@Main.render.ret.41 // 17416
D=A // 17417
@CALL // 17418
0;JMP // 17419
(Main.render.ret.41)
@SP // 17420
M=M-1 // 17421

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

@RETURN_PUSH_LABEL_109 // 17422
D=A // 17423
@13 // 17424
M=D // 17425
@19 // 17426
D=A // 17427
@LCL_PUSH // 17428
0;JMP // 17429
(RETURN_PUSH_LABEL_109)
// call Number.dispose
@6 // 17430
D=A // 17431
@14 // 17432
M=D // 17433
@Number.dispose // 17434
D=A // 17435
@13 // 17436
M=D // 17437
@Main.render.ret.42 // 17438
D=A // 17439
@CALL // 17440
0;JMP // 17441
(Main.render.ret.42)
@SP // 17442
M=M-1 // 17443

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("local 24"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_110 // 17444
D=A // 17445
@13 // 17446
M=D // 17447
@24 // 17448
D=A // 17449
@LCL_PUSH // 17450
0;JMP // 17451
(RETURN_PUSH_LABEL_110)
@SP // 17452
A=M-1 // 17453
M=!D // 17454
// call Screen.setColor
@6 // 17455
D=A // 17456
@14 // 17457
M=D // 17458
@Screen.setColor // 17459
D=A // 17460
@13 // 17461
M=D // 17462
@Main.render.ret.43 // 17463
D=A // 17464
@CALL // 17465
0;JMP // 17466
(Main.render.ret.43)
@SP // 17467
M=M-1 // 17468

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 10"), PushInstruction("local 9")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_111 // 17469
D=A // 17470
@13 // 17471
M=D // 17472
@10 // 17473
D=A // 17474
@LCL_PUSH // 17475
0;JMP // 17476
(RETURN_PUSH_LABEL_111)
@RETURN_PUSH_LABEL_112 // 17477
D=A // 17478
@13 // 17479
M=D // 17480
@9 // 17481
D=A // 17482
@LCL_PUSH // 17483
0;JMP // 17484
(RETURN_PUSH_LABEL_112)
// call Screen.drawPixel
@7 // 17485
D=A // 17486
@14 // 17487
M=D // 17488
@Screen.drawPixel // 17489
D=A // 17490
@13 // 17491
M=D // 17492
@Main.render.ret.44 // 17493
D=A // 17494
@CALL // 17495
0;JMP // 17496
(Main.render.ret.44)
@SP // 17497
M=M-1 // 17498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 25")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_113 // 17499
D=A // 17500
@13 // 17501
M=D // 17502
@25 // 17503
D=A // 17504
@LCL_PUSH // 17505
0;JMP // 17506
(RETURN_PUSH_LABEL_113)
// call Number.dispose
@6 // 17507
D=A // 17508
@14 // 17509
M=D // 17510
@Number.dispose // 17511
D=A // 17512
@13 // 17513
M=D // 17514
@Main.render.ret.45 // 17515
D=A // 17516
@CALL // 17517
0;JMP // 17518
(Main.render.ret.45)
@SP // 17519
M=M-1 // 17520

////ConditionalGroup{push=PushInstruction("local 27"), ifGoto=IfGotoInstruction{label='Main.render$IF_TRUE9}}
@LCL // 17521
D=M // 17522
@27 // 17523
A=D+A // 17524
D=M // 17525
@Main.render$IF_TRUE9 // 17526
D;JNE // 17527

////GotoInstruction{label='Main.render$IF_FALSE9}
// goto Main.render$IF_FALSE9
@Main.render$IF_FALSE9 // 17528
0;JMP // 17529

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

@LCL // 17530
D=M // 17531
@10 // 17532
A=D+A // 17533
M=M-1 // 17534

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

@Main.render.GT.49 // 17535
D=A // 17536
@SP // 17537
AM=M+1 // 17538
A=A-1 // 17539
M=D // 17540
@LCL // 17541
D=M // 17542
@10 // 17543
A=D+A // 17544
D=M // 17545
D=D+1 // 17546
@DO_GT // 17547
0;JMP // 17548
(Main.render.GT.49)
@SP // 17549
AM=M+1 // 17550
A=A-1 // 17551
M=D // 17552
@LCL // 17553
D=M // 17554
@28 // 17555
A=D+A // 17556
D=A // 17557
@R13 // 17558
M=D // 17559
@SP // 17560
AM=M-1 // 17561
D=M // 17562
@R13 // 17563
A=M // 17564
M=D // 17565

////GotoInstruction{label='Main.render$IF_END9}
// goto Main.render$IF_END9
@Main.render$IF_END9 // 17566
0;JMP // 17567

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

@LCL // 17568
D=M // 17569
@10 // 17570
A=D+A // 17571
M=M+1 // 17572

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

@Main.render.LT.50 // 17573
D=A // 17574
@SP // 17575
AM=M+1 // 17576
A=A-1 // 17577
M=D // 17578
@LCL // 17579
D=M // 17580
@12 // 17581
A=D+A // 17582
D=M // 17583
A=A-1 // 17584
A=A-1 // 17585
D=M-D // 17586
@DO_LT // 17587
0;JMP // 17588
(Main.render.LT.50)
@SP // 17589
AM=M+1 // 17590
A=A-1 // 17591
M=D // 17592
@LCL // 17593
D=M // 17594
@28 // 17595
A=D+A // 17596
D=A // 17597
@R13 // 17598
M=D // 17599
@SP // 17600
AM=M-1 // 17601
D=M // 17602
@R13 // 17603
A=M // 17604
M=D // 17605

////LabelInstruction{label='Main.render$IF_END9}
// label Main.render$IF_END9
(Main.render$IF_END9)

////GotoInstruction{label='Main.render_WHILE_EXP3}
// goto Main.render_WHILE_EXP3
@Main.render_WHILE_EXP3 // 17606
0;JMP // 17607

////LabelInstruction{label='Main.render_WHILE_END3}
// label Main.render_WHILE_END3
(Main.render_WHILE_END3)

////PushPopPair {
//  push: PushInstruction("local 13")
//  pop:  PopInstruction{address=local 15}
//}

@RETURN_PUSH_LABEL_114 // 17608
D=A // 17609
@13 // 17610
M=D // 17611
@13 // 17612
D=A // 17613
@LCL_PUSH // 17614
0;JMP // 17615
(RETURN_PUSH_LABEL_114)
@LCL // 17616
D=M // 17617
@15 // 17618
A=D+A // 17619
D=A // 17620
@R13 // 17621
M=D // 17622
@SP // 17623
AM=M-1 // 17624
D=M // 17625
@R13 // 17626
A=M // 17627
M=D // 17628

////PushPopPair {
//  push: PushInstruction("local 14")
//  pop:  PopInstruction{address=local 13}
//}

@RETURN_PUSH_LABEL_115 // 17629
D=A // 17630
@13 // 17631
M=D // 17632
@14 // 17633
D=A // 17634
@LCL_PUSH // 17635
0;JMP // 17636
(RETURN_PUSH_LABEL_115)
@LCL // 17637
D=M // 17638
@13 // 17639
A=D+A // 17640
D=A // 17641
@R13 // 17642
M=D // 17643
@SP // 17644
AM=M-1 // 17645
D=M // 17646
@R13 // 17647
A=M // 17648
M=D // 17649

////PushPopPair {
//  push: PushInstruction("local 15")
//  pop:  PopInstruction{address=local 14}
//}

@RETURN_PUSH_LABEL_116 // 17650
D=A // 17651
@13 // 17652
M=D // 17653
@15 // 17654
D=A // 17655
@LCL_PUSH // 17656
0;JMP // 17657
(RETURN_PUSH_LABEL_116)
@LCL // 17658
D=M // 17659
@14 // 17660
A=D+A // 17661
D=A // 17662
@R13 // 17663
M=D // 17664
@SP // 17665
AM=M-1 // 17666
D=M // 17667
@R13 // 17668
A=M // 17669
M=D // 17670

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 11}
//}

@LCL // 17671
D=M // 17672
@11 // 17673
A=D+A // 17674
M=0 // 17675

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
@Main.render.LT.51 // 17676
D=A // 17677
@SP // 17678
AM=M+1 // 17679
A=A-1 // 17680
M=D // 17681
@LCL // 17682
D=M // 17683
@12 // 17684
A=D+A // 17685
D=M // 17686
A=A-1 // 17687
D=M-D // 17688
@DO_LT // 17689
0;JMP // 17690
(Main.render.LT.51)
D=!D // 17691
@Main.render_WHILE_END4 // 17692
D;JNE // 17693

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 14"),
//    right:
//        PushInstruction("local 11"),
//    binaryOp: "ADD"
//)}
@LCL // 17694
D=M // 17695
@14 // 17696
A=D+A // 17697
D=M // 17698
A=A-1 // 17699
A=A-1 // 17700
A=A-1 // 17701
D=D+M // 17702
@SP // 17703
AM=M+1 // 17704
A=A-1 // 17705
M=D // 17706
D=0 // 17707
@SP // 17708
AM=M-1 // 17709
A=M // 17710
M=D // 17711

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

@LCL // 17712
D=M // 17713
@11 // 17714
A=D+A // 17715
M=M+1 // 17716

////GotoInstruction{label='Main.render_WHILE_EXP4}
// goto Main.render_WHILE_EXP4
@Main.render_WHILE_EXP4 // 17717
0;JMP // 17718

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

@LCL // 17719
D=M // 17720
@9 // 17721
A=D+A // 17722
M=M+1 // 17723

////GotoInstruction{label='Main.render_WHILE_EXP2}
// goto Main.render_WHILE_EXP2
@Main.render_WHILE_EXP2 // 17724
0;JMP // 17725

////LabelInstruction{label='Main.render_WHILE_END2}
// label Main.render_WHILE_END2
(Main.render_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17726
A=M // 17727
D=M // 17728
@SP // 17729
AM=M+1 // 17730
A=A-1 // 17731
M=D // 17732
// call Number.dispose
@6 // 17733
D=A // 17734
@14 // 17735
M=D // 17736
@Number.dispose // 17737
D=A // 17738
@13 // 17739
M=D // 17740
@Main.render.ret.46 // 17741
D=A // 17742
@CALL // 17743
0;JMP // 17744
(Main.render.ret.46)
@SP // 17745
M=M-1 // 17746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17747
A=M+1 // 17748
D=M // 17749
@SP // 17750
AM=M+1 // 17751
A=A-1 // 17752
M=D // 17753
// call Number.dispose
@6 // 17754
D=A // 17755
@14 // 17756
M=D // 17757
@Number.dispose // 17758
D=A // 17759
@13 // 17760
M=D // 17761
@Main.render.ret.47 // 17762
D=A // 17763
@CALL // 17764
0;JMP // 17765
(Main.render.ret.47)
@SP // 17766
M=M-1 // 17767

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 17768
A=M+1 // 17769
A=A+1 // 17770
D=M // 17771
@SP // 17772
AM=M+1 // 17773
A=A-1 // 17774
M=D // 17775
// call Number.dispose
@6 // 17776
D=A // 17777
@14 // 17778
M=D // 17779
@Number.dispose // 17780
D=A // 17781
@13 // 17782
M=D // 17783
@Main.render.ret.48 // 17784
D=A // 17785
@CALL // 17786
0;JMP // 17787
(Main.render.ret.48)
@SP // 17788
M=M-1 // 17789

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_117 // 17790
D=A // 17791
@13 // 17792
M=D // 17793
@4 // 17794
D=A // 17795
@LCL_PUSH // 17796
0;JMP // 17797
(RETURN_PUSH_LABEL_117)
// call Number.dispose
@6 // 17798
D=A // 17799
@14 // 17800
M=D // 17801
@Number.dispose // 17802
D=A // 17803
@13 // 17804
M=D // 17805
@Main.render.ret.49 // 17806
D=A // 17807
@CALL // 17808
0;JMP // 17809
(Main.render.ret.49)
@SP // 17810
M=M-1 // 17811

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_118 // 17812
D=A // 17813
@13 // 17814
M=D // 17815
@5 // 17816
D=A // 17817
@LCL_PUSH // 17818
0;JMP // 17819
(RETURN_PUSH_LABEL_118)
// call Number.dispose
@6 // 17820
D=A // 17821
@14 // 17822
M=D // 17823
@Number.dispose // 17824
D=A // 17825
@13 // 17826
M=D // 17827
@Main.render.ret.50 // 17828
D=A // 17829
@CALL // 17830
0;JMP // 17831
(Main.render.ret.50)
@SP // 17832
M=M-1 // 17833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_119 // 17834
D=A // 17835
@13 // 17836
M=D // 17837
@6 // 17838
D=A // 17839
@LCL_PUSH // 17840
0;JMP // 17841
(RETURN_PUSH_LABEL_119)
// call Number.dispose
@6 // 17842
D=A // 17843
@14 // 17844
M=D // 17845
@Number.dispose // 17846
D=A // 17847
@13 // 17848
M=D // 17849
@Main.render.ret.51 // 17850
D=A // 17851
@CALL // 17852
0;JMP // 17853
(Main.render.ret.51)
@SP // 17854
M=M-1 // 17855

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_120 // 17856
D=A // 17857
@13 // 17858
M=D // 17859
@7 // 17860
D=A // 17861
@LCL_PUSH // 17862
0;JMP // 17863
(RETURN_PUSH_LABEL_120)
// call Number.dispose
@6 // 17864
D=A // 17865
@14 // 17866
M=D // 17867
@Number.dispose // 17868
D=A // 17869
@13 // 17870
M=D // 17871
@Main.render.ret.52 // 17872
D=A // 17873
@CALL // 17874
0;JMP // 17875
(Main.render.ret.52)
@SP // 17876
M=M-1 // 17877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_121 // 17878
D=A // 17879
@13 // 17880
M=D // 17881
@13 // 17882
D=A // 17883
@LCL_PUSH // 17884
0;JMP // 17885
(RETURN_PUSH_LABEL_121)
// call Memory.deAlloc
@6 // 17886
D=A // 17887
@14 // 17888
M=D // 17889
@Memory.deAlloc // 17890
D=A // 17891
@13 // 17892
M=D // 17893
@Main.render.ret.53 // 17894
D=A // 17895
@CALL // 17896
0;JMP // 17897
(Main.render.ret.53)
@SP // 17898
M=M-1 // 17899

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 14")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_122 // 17900
D=A // 17901
@13 // 17902
M=D // 17903
@14 // 17904
D=A // 17905
@LCL_PUSH // 17906
0;JMP // 17907
(RETURN_PUSH_LABEL_122)
// call Memory.deAlloc
@6 // 17908
D=A // 17909
@14 // 17910
M=D // 17911
@Memory.deAlloc // 17912
D=A // 17913
@13 // 17914
M=D // 17915
@Main.render.ret.54 // 17916
D=A // 17917
@CALL // 17918
0;JMP // 17919
(Main.render.ret.54)
@SP // 17920
M=M-1 // 17921

////PushInstruction("constant 0")
@SP // 17922
AM=M+1 // 17923
A=A-1 // 17924
M=0 // 17925
@RETURN // 17926
0;JMP // 17927

////FunctionInstruction{functionName='Int32.is_even', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_even with 0
(Int32.is_even)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 17928
A=M // 17929
D=M // 17930
@3 // 17931
M=D // 17932

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
@Int32.is_even.EQ.52 // 17933
D=A // 17934
@SP // 17935
AM=M+1 // 17936
A=A-1 // 17937
M=D // 17938
@THIS // 17939
A=M // 17940
A=M // 17941
D=M // 17942
@1 // 17943
D=D&A // 17944
@DO_EQ // 17945
0;JMP // 17946
(Int32.is_even.EQ.52)
@SP // 17947
AM=M+1 // 17948
A=A-1 // 17949
M=D // 17950
@RETURN // 17951
0;JMP // 17952

////FunctionInstruction{functionName='Element.surface_normal', numLocals=0, funcMapping={Element.color=2}}
// function Element.surface_normal with 0
(Element.surface_normal)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 17953
A=M // 17954
D=M // 17955
@3 // 17956
M=D // 17957

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.surface_normal$IF_TRUE1}}
@THIS // 17958
A=M // 17959
D=M // 17960
@Element.surface_normal$IF_TRUE1 // 17961
D;JNE // 17962

////GotoInstruction{label='Element.surface_normal$IF_END1}
// goto Element.surface_normal$IF_END1
@Element.surface_normal$IF_END1 // 17963
0;JMP // 17964

////LabelInstruction{label='Element.surface_normal$IF_TRUE1}
// label Element.surface_normal$IF_TRUE1
(Element.surface_normal$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Plane.surface_normal}}
@THIS // 17965
A=M // 17966
D=M // 17967
@SP // 17968
AM=M+1 // 17969
A=A-1 // 17970
M=D // 17971
// call Plane.surface_normal
@6 // 17972
D=A // 17973
@14 // 17974
M=D // 17975
@Plane.surface_normal // 17976
D=A // 17977
@13 // 17978
M=D // 17979
@Element.surface_normal.ret.0 // 17980
D=A // 17981
@CALL // 17982
0;JMP // 17983
(Element.surface_normal.ret.0)
@RETURN // 17984
0;JMP // 17985

////LabelInstruction{label='Element.surface_normal$IF_END1}
// label Element.surface_normal$IF_END1
(Element.surface_normal$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.surface_normal$IF_TRUE2}}
@THIS // 17986
A=M+1 // 17987
D=M // 17988
@Element.surface_normal$IF_TRUE2 // 17989
D;JNE // 17990

////GotoInstruction{label='Element.surface_normal$IF_END2}
// goto Element.surface_normal$IF_END2
@Element.surface_normal$IF_END2 // 17991
0;JMP // 17992

////LabelInstruction{label='Element.surface_normal$IF_TRUE2}
// label Element.surface_normal$IF_TRUE2
(Element.surface_normal$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Sphere.surface_normal}}
@THIS // 17993
A=M+1 // 17994
D=M // 17995
@SP // 17996
AM=M+1 // 17997
A=A-1 // 17998
M=D // 17999
@ARG // 18000
A=M+1 // 18001
D=M // 18002
@SP // 18003
AM=M+1 // 18004
A=A-1 // 18005
M=D // 18006
// call Sphere.surface_normal
@7 // 18007
D=A // 18008
@14 // 18009
M=D // 18010
@Sphere.surface_normal // 18011
D=A // 18012
@13 // 18013
M=D // 18014
@Element.surface_normal.ret.1 // 18015
D=A // 18016
@CALL // 18017
0;JMP // 18018
(Element.surface_normal.ret.1)
@RETURN // 18019
0;JMP // 18020

////LabelInstruction{label='Element.surface_normal$IF_END2}
// label Element.surface_normal$IF_END2
(Element.surface_normal$IF_END2)

////PushInstruction("constant 0")
@SP // 18021
AM=M+1 // 18022
A=A-1 // 18023
M=0 // 18024
@RETURN // 18025
0;JMP // 18026

////FunctionInstruction{functionName='Vec3.dot', numLocals=3, funcMapping={Vec3.do_add=6, Vec3.clone=4, Vec3.new=1}}
// function Vec3.dot with 3
(Vec3.dot)
@3 // 18027
D=A // 18028
@SP // 18029
AM=D+M // 18030
A=A-1 // 18031
M=0 // 18032
A=A-1 // 18033
M=0 // 18034
A=A-1 // 18035
M=0 // 18036

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18037
A=M // 18038
D=M // 18039
@3 // 18040
M=D // 18041

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 18042
A=M // 18043
D=M // 18044
@SP // 18045
AM=M+1 // 18046
A=A-1 // 18047
M=D // 18048
// call Number.clone
@6 // 18049
D=A // 18050
@14 // 18051
M=D // 18052
@Number.clone // 18053
D=A // 18054
@13 // 18055
M=D // 18056
@Vec3.dot.ret.0 // 18057
D=A // 18058
@CALL // 18059
0;JMP // 18060
(Vec3.dot.ret.0)
@SP // 18061
AM=M-1 // 18062
D=M // 18063
@LCL // 18064
A=M // 18065
M=D // 18066

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18067
A=M // 18068
D=M // 18069
@SP // 18070
AM=M+1 // 18071
A=A-1 // 18072
M=D // 18073
@ARG // 18074
A=M+1 // 18075
D=M // 18076
@SP // 18077
AM=M+1 // 18078
A=A-1 // 18079
M=D // 18080
// call Vec3.getX
@6 // 18081
D=A // 18082
@14 // 18083
M=D // 18084
@Vec3.getX // 18085
D=A // 18086
@13 // 18087
M=D // 18088
@Vec3.dot.ret.1 // 18089
D=A // 18090
@CALL // 18091
0;JMP // 18092
(Vec3.dot.ret.1)
// call Number.do_mul
@7 // 18093
D=A // 18094
@14 // 18095
M=D // 18096
@Number.do_mul // 18097
D=A // 18098
@13 // 18099
M=D // 18100
@Vec3.dot.ret.2 // 18101
D=A // 18102
@CALL // 18103
0;JMP // 18104
(Vec3.dot.ret.2)
@SP // 18105
M=M-1 // 18106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 18107
A=M+1 // 18108
D=M // 18109
@SP // 18110
AM=M+1 // 18111
A=A-1 // 18112
M=D // 18113
// call Number.clone
@6 // 18114
D=A // 18115
@14 // 18116
M=D // 18117
@Number.clone // 18118
D=A // 18119
@13 // 18120
M=D // 18121
@Vec3.dot.ret.3 // 18122
D=A // 18123
@CALL // 18124
0;JMP // 18125
(Vec3.dot.ret.3)
@SP // 18126
AM=M-1 // 18127
D=M // 18128
@LCL // 18129
A=M+1 // 18130
M=D // 18131

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18132
A=M+1 // 18133
D=M // 18134
@SP // 18135
AM=M+1 // 18136
A=A-1 // 18137
M=D // 18138
@ARG // 18139
A=M+1 // 18140
D=M // 18141
@SP // 18142
AM=M+1 // 18143
A=A-1 // 18144
M=D // 18145
// call Vec3.getY
@6 // 18146
D=A // 18147
@14 // 18148
M=D // 18149
@Vec3.getY // 18150
D=A // 18151
@13 // 18152
M=D // 18153
@Vec3.dot.ret.4 // 18154
D=A // 18155
@CALL // 18156
0;JMP // 18157
(Vec3.dot.ret.4)
// call Number.do_mul
@7 // 18158
D=A // 18159
@14 // 18160
M=D // 18161
@Number.do_mul // 18162
D=A // 18163
@13 // 18164
M=D // 18165
@Vec3.dot.ret.5 // 18166
D=A // 18167
@CALL // 18168
0;JMP // 18169
(Vec3.dot.ret.5)
@SP // 18170
M=M-1 // 18171

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 18172
A=M+1 // 18173
A=A+1 // 18174
D=M // 18175
@SP // 18176
AM=M+1 // 18177
A=A-1 // 18178
M=D // 18179
// call Number.clone
@6 // 18180
D=A // 18181
@14 // 18182
M=D // 18183
@Number.clone // 18184
D=A // 18185
@13 // 18186
M=D // 18187
@Vec3.dot.ret.6 // 18188
D=A // 18189
@CALL // 18190
0;JMP // 18191
(Vec3.dot.ret.6)
@SP // 18192
AM=M-1 // 18193
D=M // 18194
@LCL // 18195
A=M+1 // 18196
A=A+1 // 18197
M=D // 18198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18199
A=M+1 // 18200
A=A+1 // 18201
D=M // 18202
@SP // 18203
AM=M+1 // 18204
A=A-1 // 18205
M=D // 18206
@ARG // 18207
A=M+1 // 18208
D=M // 18209
@SP // 18210
AM=M+1 // 18211
A=A-1 // 18212
M=D // 18213
// call Vec3.getZ
@6 // 18214
D=A // 18215
@14 // 18216
M=D // 18217
@Vec3.getZ // 18218
D=A // 18219
@13 // 18220
M=D // 18221
@Vec3.dot.ret.7 // 18222
D=A // 18223
@CALL // 18224
0;JMP // 18225
(Vec3.dot.ret.7)
// call Number.do_mul
@7 // 18226
D=A // 18227
@14 // 18228
M=D // 18229
@Number.do_mul // 18230
D=A // 18231
@13 // 18232
M=D // 18233
@Vec3.dot.ret.8 // 18234
D=A // 18235
@CALL // 18236
0;JMP // 18237
(Vec3.dot.ret.8)
@SP // 18238
M=M-1 // 18239

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18240
A=M // 18241
D=M // 18242
@SP // 18243
AM=M+1 // 18244
A=A-1 // 18245
M=D // 18246
@LCL // 18247
A=M+1 // 18248
D=M // 18249
@SP // 18250
AM=M+1 // 18251
A=A-1 // 18252
M=D // 18253
// call Number.do_add
@7 // 18254
D=A // 18255
@14 // 18256
M=D // 18257
@Number.do_add // 18258
D=A // 18259
@13 // 18260
M=D // 18261
@Vec3.dot.ret.9 // 18262
D=A // 18263
@CALL // 18264
0;JMP // 18265
(Vec3.dot.ret.9)
@SP // 18266
M=M-1 // 18267

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18268
A=M // 18269
D=M // 18270
@SP // 18271
AM=M+1 // 18272
A=A-1 // 18273
M=D // 18274
@LCL // 18275
A=M+1 // 18276
A=A+1 // 18277
D=M // 18278
@SP // 18279
AM=M+1 // 18280
A=A-1 // 18281
M=D // 18282
// call Number.do_add
@7 // 18283
D=A // 18284
@14 // 18285
M=D // 18286
@Number.do_add // 18287
D=A // 18288
@13 // 18289
M=D // 18290
@Vec3.dot.ret.10 // 18291
D=A // 18292
@CALL // 18293
0;JMP // 18294
(Vec3.dot.ret.10)
@SP // 18295
M=M-1 // 18296

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18297
A=M+1 // 18298
D=M // 18299
@SP // 18300
AM=M+1 // 18301
A=A-1 // 18302
M=D // 18303
// call Number.dispose
@6 // 18304
D=A // 18305
@14 // 18306
M=D // 18307
@Number.dispose // 18308
D=A // 18309
@13 // 18310
M=D // 18311
@Vec3.dot.ret.11 // 18312
D=A // 18313
@CALL // 18314
0;JMP // 18315
(Vec3.dot.ret.11)
@SP // 18316
M=M-1 // 18317

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18318
A=M+1 // 18319
A=A+1 // 18320
D=M // 18321
@SP // 18322
AM=M+1 // 18323
A=A-1 // 18324
M=D // 18325
// call Number.dispose
@6 // 18326
D=A // 18327
@14 // 18328
M=D // 18329
@Number.dispose // 18330
D=A // 18331
@13 // 18332
M=D // 18333
@Vec3.dot.ret.12 // 18334
D=A // 18335
@CALL // 18336
0;JMP // 18337
(Vec3.dot.ret.12)
@SP // 18338
M=M-1 // 18339

////PushInstruction("local 0")
@LCL // 18340
A=M // 18341
D=M // 18342
@SP // 18343
AM=M+1 // 18344
A=A-1 // 18345
M=D // 18346
@RETURN // 18347
0;JMP // 18348

////FunctionInstruction{functionName='Int32.new', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.new with 3
(Int32.new)
@3 // 18349
D=A // 18350
@SP // 18351
AM=D+M // 18352
A=A-1 // 18353
M=0 // 18354
A=A-1 // 18355
M=0 // 18356
A=A-1 // 18357
M=0 // 18358

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 18359
AM=M+1 // 18360
A=A-1 // 18361
M=1 // 18362
// call Memory.alloc
@6 // 18363
D=A // 18364
@14 // 18365
M=D // 18366
@Memory.alloc // 18367
D=A // 18368
@13 // 18369
M=D // 18370
@Int32.new.ret.0 // 18371
D=A // 18372
@CALL // 18373
0;JMP // 18374
(Int32.new.ret.0)
@SP // 18375
AM=M-1 // 18376
D=M // 18377
@3 // 18378
M=D // 18379

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

@Int32.0 // 18380
M=M+1 // 18381

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

@ARG // 18382
A=M // 18383
D=M // 18384
@255 // 18385
D=D&A // 18386
@LCL // 18387
A=M // 18388
M=D // 18389

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

@ARG // 18390
A=M // 18391
D=M // 18392
@SP // 18393
AM=M+1 // 18394
A=A-1 // 18395
M=D // 18396
@8 // 18397
D=A // 18398
@SP // 18399
AM=M+1 // 18400
A=A-1 // 18401
M=D // 18402
// call Int32.arith_rightshift
@7 // 18403
D=A // 18404
@14 // 18405
M=D // 18406
@Int32.arith_rightshift // 18407
D=A // 18408
@13 // 18409
M=D // 18410
@Int32.new.ret.1 // 18411
D=A // 18412
@CALL // 18413
0;JMP // 18414
(Int32.new.ret.1)
@SP // 18415
AM=M-1 // 18416
D=M // 18417
@255 // 18418
D=D&A // 18419
@LCL // 18420
A=M+1 // 18421
M=D // 18422

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Int32.new$IF_TRUE1}}
@Int32.new.LT.53 // 18423
D=A // 18424
@SP // 18425
AM=M+1 // 18426
A=A-1 // 18427
M=D // 18428
@ARG // 18429
A=M // 18430
D=M // 18431
@DO_LT // 18432
0;JMP // 18433
(Int32.new.LT.53)
@Int32.new$IF_TRUE1 // 18434
D;JNE // 18435

////GotoInstruction{label='Int32.new$IF_FALSE1}
// goto Int32.new$IF_FALSE1
@Int32.new$IF_FALSE1 // 18436
0;JMP // 18437

////LabelInstruction{label='Int32.new$IF_TRUE1}
// label Int32.new$IF_TRUE1
(Int32.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 255")
//  pop:  PopInstruction{address=local 2}
//}

@255 // 18438
D=A // 18439
@LCL // 18440
A=M+1 // 18441
A=A+1 // 18442
M=D // 18443

////GotoInstruction{label='Int32.new$IF_END1}
// goto Int32.new$IF_END1
@Int32.new$IF_END1 // 18444
0;JMP // 18445

////LabelInstruction{label='Int32.new$IF_FALSE1}
// label Int32.new$IF_FALSE1
(Int32.new$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 18446
A=M+1 // 18447
A=A+1 // 18448
M=0 // 18449

////LabelInstruction{label='Int32.new$IF_END1}
// label Int32.new$IF_END1
(Int32.new$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@4 // 18450
D=A // 18451
@SP // 18452
AM=M+1 // 18453
A=A-1 // 18454
M=D // 18455
// call Memory.alloc
@6 // 18456
D=A // 18457
@14 // 18458
M=D // 18459
@Memory.alloc // 18460
D=A // 18461
@13 // 18462
M=D // 18463
@Int32.new.ret.2 // 18464
D=A // 18465
@CALL // 18466
0;JMP // 18467
(Int32.new.ret.2)
@SP // 18468
AM=M-1 // 18469
D=M // 18470
@THIS // 18471
A=M // 18472
M=D // 18473

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@THIS // 18474
A=M // 18475
D=M // 18476
@0 // 18477
D=D+A // 18478
@SP // 18479
AM=M+1 // 18480
A=A-1 // 18481
M=D // 18482
@LCL // 18483
A=M // 18484
D=M // 18485
@SP // 18486
AM=M-1 // 18487
A=M // 18488
M=D // 18489

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@THIS // 18490
A=M // 18491
D=M // 18492
D=D+1 // 18493
@SP // 18494
AM=M+1 // 18495
A=A-1 // 18496
M=D // 18497
@LCL // 18498
A=M+1 // 18499
D=M // 18500
@SP // 18501
AM=M-1 // 18502
A=M // 18503
M=D // 18504

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@THIS // 18505
A=M // 18506
D=M // 18507
@2 // 18508
D=D+A // 18509
@SP // 18510
AM=M+1 // 18511
A=A-1 // 18512
M=D // 18513
@LCL // 18514
A=M+1 // 18515
A=A+1 // 18516
D=M // 18517
@SP // 18518
AM=M-1 // 18519
A=M // 18520
M=D // 18521

////PushWriter{source=PushInstruction("local 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@THIS // 18522
A=M // 18523
D=M // 18524
@3 // 18525
D=D+A // 18526
@SP // 18527
AM=M+1 // 18528
A=A-1 // 18529
M=D // 18530
@LCL // 18531
A=M+1 // 18532
A=A+1 // 18533
D=M // 18534
@SP // 18535
AM=M-1 // 18536
A=M // 18537
M=D // 18538

////PushInstruction("pointer 0")
@3 // 18539
D=M // 18540
@SP // 18541
AM=M+1 // 18542
A=A-1 // 18543
M=D // 18544
@RETURN // 18545
0;JMP // 18546

////FunctionInstruction{functionName='Plane.dispose', numLocals=0, funcMapping={Plane.initialize=16, Plane.new=1, Plane.color=29}}
// function Plane.dispose with 0
(Plane.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18547
A=M // 18548
D=M // 18549
@3 // 18550
M=D // 18551

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18552
A=M // 18553
D=M // 18554
@SP // 18555
AM=M+1 // 18556
A=A-1 // 18557
M=D // 18558
// call Vec3.dispose
@6 // 18559
D=A // 18560
@14 // 18561
M=D // 18562
@Vec3.dispose // 18563
D=A // 18564
@13 // 18565
M=D // 18566
@Plane.dispose.ret.0 // 18567
D=A // 18568
@CALL // 18569
0;JMP // 18570
(Plane.dispose.ret.0)
@SP // 18571
M=M-1 // 18572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18573
A=M+1 // 18574
D=M // 18575
@SP // 18576
AM=M+1 // 18577
A=A-1 // 18578
M=D // 18579
// call Vec3.dispose
@6 // 18580
D=A // 18581
@14 // 18582
M=D // 18583
@Vec3.dispose // 18584
D=A // 18585
@13 // 18586
M=D // 18587
@Plane.dispose.ret.1 // 18588
D=A // 18589
@CALL // 18590
0;JMP // 18591
(Plane.dispose.ret.1)
@SP // 18592
M=M-1 // 18593

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 18594
A=M+1 // 18595
A=A+1 // 18596
D=M // 18597
@SP // 18598
AM=M+1 // 18599
A=A-1 // 18600
M=D // 18601
// call Number.dispose
@6 // 18602
D=A // 18603
@14 // 18604
M=D // 18605
@Number.dispose // 18606
D=A // 18607
@13 // 18608
M=D // 18609
@Plane.dispose.ret.2 // 18610
D=A // 18611
@CALL // 18612
0;JMP // 18613
(Plane.dispose.ret.2)
@SP // 18614
M=M-1 // 18615

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 18616
D=M // 18617
@SP // 18618
AM=M+1 // 18619
A=A-1 // 18620
M=D // 18621
// call Memory.deAlloc
@6 // 18622
D=A // 18623
@14 // 18624
M=D // 18625
@Memory.deAlloc // 18626
D=A // 18627
@13 // 18628
M=D // 18629
@Plane.dispose.ret.3 // 18630
D=A // 18631
@CALL // 18632
0;JMP // 18633
(Plane.dispose.ret.3)
@SP // 18634
M=M-1 // 18635

////PushInstruction("constant 0")
@SP // 18636
AM=M+1 // 18637
A=A-1 // 18638
M=0 // 18639
@RETURN // 18640
0;JMP // 18641

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.init=97, Output.println=0, Output.getMap=0, Output.create=1}}
// function Output.printString with 2
(Output.printString)
@SP // 18642
M=M+1 // 18643
AM=M+1 // 18644
A=A-1 // 18645
M=0 // 18646
A=A-1 // 18647
M=0 // 18648

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 18649
A=M // 18650
M=0 // 18651

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 18652
A=M // 18653
D=M // 18654
@SP // 18655
AM=M+1 // 18656
A=A-1 // 18657
M=D // 18658
// call String.length
@6 // 18659
D=A // 18660
@14 // 18661
M=D // 18662
@String.length // 18663
D=A // 18664
@13 // 18665
M=D // 18666
@Output.printString.ret.0 // 18667
D=A // 18668
@CALL // 18669
0;JMP // 18670
(Output.printString.ret.0)
@SP // 18671
AM=M-1 // 18672
D=M // 18673
@LCL // 18674
A=M+1 // 18675
M=D // 18676

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
@Output.printString.LT.54 // 18677
D=A // 18678
@SP // 18679
AM=M+1 // 18680
A=A-1 // 18681
M=D // 18682
@LCL // 18683
A=M+1 // 18684
D=M // 18685
A=A-1 // 18686
D=M-D // 18687
@DO_LT // 18688
0;JMP // 18689
(Output.printString.LT.54)
D=!D // 18690
@Output.printString_WHILE_END1 // 18691
D;JNE // 18692

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 18693
A=M // 18694
D=M // 18695
@SP // 18696
AM=M+1 // 18697
A=A-1 // 18698
M=D // 18699
@LCL // 18700
A=M // 18701
D=M // 18702
@SP // 18703
AM=M+1 // 18704
A=A-1 // 18705
M=D // 18706
// call String.charAt
@7 // 18707
D=A // 18708
@14 // 18709
M=D // 18710
@String.charAt // 18711
D=A // 18712
@13 // 18713
M=D // 18714
@Output.printString.ret.1 // 18715
D=A // 18716
@CALL // 18717
0;JMP // 18718
(Output.printString.ret.1)
// call Output.printChar
@6 // 18719
D=A // 18720
@14 // 18721
M=D // 18722
@Output.printChar // 18723
D=A // 18724
@13 // 18725
M=D // 18726
@Output.printString.ret.2 // 18727
D=A // 18728
@CALL // 18729
0;JMP // 18730
(Output.printString.ret.2)
@SP // 18731
M=M-1 // 18732

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

@LCL // 18733
A=M // 18734
M=M+1 // 18735

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 18736
0;JMP // 18737

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 18738
AM=M+1 // 18739
A=A-1 // 18740
M=0 // 18741
@RETURN // 18742
0;JMP // 18743

////FunctionInstruction{functionName='Number.is_less_than', numLocals=0, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.do_neg=1}}
// function Number.is_less_than with 0
(Number.is_less_than)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18744
A=M // 18745
D=M // 18746
@3 // 18747
M=D // 18748

////BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.cmp}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//)
@Number.is_less_than.LT.55 // 18749
D=A // 18750
@SP // 18751
AM=M+1 // 18752
A=A-1 // 18753
M=D // 18754
@THIS // 18755
A=M // 18756
D=M // 18757
@SP // 18758
AM=M+1 // 18759
A=A-1 // 18760
M=D // 18761
@ARG // 18762
A=M+1 // 18763
D=M // 18764
@SP // 18765
AM=M+1 // 18766
A=A-1 // 18767
M=D // 18768
// call Number.getV
@6 // 18769
D=A // 18770
@14 // 18771
M=D // 18772
@Number.getV // 18773
D=A // 18774
@13 // 18775
M=D // 18776
@Number.is_less_than.ret.0 // 18777
D=A // 18778
@CALL // 18779
0;JMP // 18780
(Number.is_less_than.ret.0)
// call Int32.cmp
@7 // 18781
D=A // 18782
@14 // 18783
M=D // 18784
@Int32.cmp // 18785
D=A // 18786
@13 // 18787
M=D // 18788
@Number.is_less_than.ret.1 // 18789
D=A // 18790
@CALL // 18791
0;JMP // 18792
(Number.is_less_than.ret.1)
@SP // 18793
AM=M-1 // 18794
D=M // 18795
@DO_LT // 18796
0;JMP // 18797
(Number.is_less_than.LT.55)
@SP // 18798
AM=M+1 // 18799
A=A-1 // 18800
M=D // 18801
@RETURN // 18802
0;JMP // 18803

////FunctionInstruction{functionName='Vec3.do_cross', numLocals=6, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.clone=4, Vec3.new=1}}
// function Vec3.do_cross with 6
(Vec3.do_cross)
@6 // 18804
D=A // 18805
@SP // 18806
AM=D+M // 18807
A=A-1 // 18808
M=0 // 18809
A=A-1 // 18810
M=0 // 18811
A=A-1 // 18812
M=0 // 18813
A=A-1 // 18814
M=0 // 18815
A=A-1 // 18816
M=0 // 18817
A=A-1 // 18818
M=0 // 18819

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 18820
A=M // 18821
D=M // 18822
@3 // 18823
M=D // 18824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 18825
A=M+1 // 18826
D=M // 18827
@SP // 18828
AM=M+1 // 18829
A=A-1 // 18830
M=D // 18831
// call Number.clone
@6 // 18832
D=A // 18833
@14 // 18834
M=D // 18835
@Number.clone // 18836
D=A // 18837
@13 // 18838
M=D // 18839
@Vec3.do_cross.ret.0 // 18840
D=A // 18841
@CALL // 18842
0;JMP // 18843
(Vec3.do_cross.ret.0)
@SP // 18844
AM=M-1 // 18845
D=M // 18846
@LCL // 18847
A=M // 18848
M=D // 18849

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18850
A=M // 18851
D=M // 18852
@SP // 18853
AM=M+1 // 18854
A=A-1 // 18855
M=D // 18856
@ARG // 18857
A=M+1 // 18858
D=M // 18859
@SP // 18860
AM=M+1 // 18861
A=A-1 // 18862
M=D // 18863
// call Vec3.getZ
@6 // 18864
D=A // 18865
@14 // 18866
M=D // 18867
@Vec3.getZ // 18868
D=A // 18869
@13 // 18870
M=D // 18871
@Vec3.do_cross.ret.1 // 18872
D=A // 18873
@CALL // 18874
0;JMP // 18875
(Vec3.do_cross.ret.1)
// call Number.do_mul
@7 // 18876
D=A // 18877
@14 // 18878
M=D // 18879
@Number.do_mul // 18880
D=A // 18881
@13 // 18882
M=D // 18883
@Vec3.do_cross.ret.2 // 18884
D=A // 18885
@CALL // 18886
0;JMP // 18887
(Vec3.do_cross.ret.2)
@SP // 18888
M=M-1 // 18889

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 18890
A=M+1 // 18891
A=A+1 // 18892
D=M // 18893
@SP // 18894
AM=M+1 // 18895
A=A-1 // 18896
M=D // 18897
// call Number.clone
@6 // 18898
D=A // 18899
@14 // 18900
M=D // 18901
@Number.clone // 18902
D=A // 18903
@13 // 18904
M=D // 18905
@Vec3.do_cross.ret.3 // 18906
D=A // 18907
@CALL // 18908
0;JMP // 18909
(Vec3.do_cross.ret.3)
@SP // 18910
AM=M-1 // 18911
D=M // 18912
@LCL // 18913
A=M+1 // 18914
M=D // 18915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18916
A=M+1 // 18917
D=M // 18918
@SP // 18919
AM=M+1 // 18920
A=A-1 // 18921
M=D // 18922
@ARG // 18923
A=M+1 // 18924
D=M // 18925
@SP // 18926
AM=M+1 // 18927
A=A-1 // 18928
M=D // 18929
// call Vec3.getY
@6 // 18930
D=A // 18931
@14 // 18932
M=D // 18933
@Vec3.getY // 18934
D=A // 18935
@13 // 18936
M=D // 18937
@Vec3.do_cross.ret.4 // 18938
D=A // 18939
@CALL // 18940
0;JMP // 18941
(Vec3.do_cross.ret.4)
// call Number.do_mul
@7 // 18942
D=A // 18943
@14 // 18944
M=D // 18945
@Number.do_mul // 18946
D=A // 18947
@13 // 18948
M=D // 18949
@Vec3.do_cross.ret.5 // 18950
D=A // 18951
@CALL // 18952
0;JMP // 18953
(Vec3.do_cross.ret.5)
@SP // 18954
M=M-1 // 18955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 18956
A=M // 18957
D=M // 18958
@SP // 18959
AM=M+1 // 18960
A=A-1 // 18961
M=D // 18962
@LCL // 18963
A=M+1 // 18964
D=M // 18965
@SP // 18966
AM=M+1 // 18967
A=A-1 // 18968
M=D // 18969
// call Number.do_sub
@7 // 18970
D=A // 18971
@14 // 18972
M=D // 18973
@Number.do_sub // 18974
D=A // 18975
@13 // 18976
M=D // 18977
@Vec3.do_cross.ret.6 // 18978
D=A // 18979
@CALL // 18980
0;JMP // 18981
(Vec3.do_cross.ret.6)
@SP // 18982
M=M-1 // 18983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 18984
A=M+1 // 18985
A=A+1 // 18986
D=M // 18987
@SP // 18988
AM=M+1 // 18989
A=A-1 // 18990
M=D // 18991
// call Number.clone
@6 // 18992
D=A // 18993
@14 // 18994
M=D // 18995
@Number.clone // 18996
D=A // 18997
@13 // 18998
M=D // 18999
@Vec3.do_cross.ret.7 // 19000
D=A // 19001
@CALL // 19002
0;JMP // 19003
(Vec3.do_cross.ret.7)
@SP // 19004
AM=M-1 // 19005
D=M // 19006
@LCL // 19007
A=M+1 // 19008
A=A+1 // 19009
M=D // 19010

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19011
A=M+1 // 19012
A=A+1 // 19013
D=M // 19014
@SP // 19015
AM=M+1 // 19016
A=A-1 // 19017
M=D // 19018
@ARG // 19019
A=M+1 // 19020
D=M // 19021
@SP // 19022
AM=M+1 // 19023
A=A-1 // 19024
M=D // 19025
// call Vec3.getX
@6 // 19026
D=A // 19027
@14 // 19028
M=D // 19029
@Vec3.getX // 19030
D=A // 19031
@13 // 19032
M=D // 19033
@Vec3.do_cross.ret.8 // 19034
D=A // 19035
@CALL // 19036
0;JMP // 19037
(Vec3.do_cross.ret.8)
// call Number.do_mul
@7 // 19038
D=A // 19039
@14 // 19040
M=D // 19041
@Number.do_mul // 19042
D=A // 19043
@13 // 19044
M=D // 19045
@Vec3.do_cross.ret.9 // 19046
D=A // 19047
@CALL // 19048
0;JMP // 19049
(Vec3.do_cross.ret.9)
@SP // 19050
M=M-1 // 19051

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@THIS // 19052
A=M // 19053
D=M // 19054
@SP // 19055
AM=M+1 // 19056
A=A-1 // 19057
M=D // 19058
// call Number.clone
@6 // 19059
D=A // 19060
@14 // 19061
M=D // 19062
@Number.clone // 19063
D=A // 19064
@13 // 19065
M=D // 19066
@Vec3.do_cross.ret.10 // 19067
D=A // 19068
@CALL // 19069
0;JMP // 19070
(Vec3.do_cross.ret.10)
@SP // 19071
AM=M-1 // 19072
D=M // 19073
@LCL // 19074
A=M+1 // 19075
A=A+1 // 19076
A=A+1 // 19077
M=D // 19078

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19079
A=M+1 // 19080
A=A+1 // 19081
A=A+1 // 19082
D=M // 19083
@SP // 19084
AM=M+1 // 19085
A=A-1 // 19086
M=D // 19087
@ARG // 19088
A=M+1 // 19089
D=M // 19090
@SP // 19091
AM=M+1 // 19092
A=A-1 // 19093
M=D // 19094
// call Vec3.getZ
@6 // 19095
D=A // 19096
@14 // 19097
M=D // 19098
@Vec3.getZ // 19099
D=A // 19100
@13 // 19101
M=D // 19102
@Vec3.do_cross.ret.11 // 19103
D=A // 19104
@CALL // 19105
0;JMP // 19106
(Vec3.do_cross.ret.11)
// call Number.do_mul
@7 // 19107
D=A // 19108
@14 // 19109
M=D // 19110
@Number.do_mul // 19111
D=A // 19112
@13 // 19113
M=D // 19114
@Vec3.do_cross.ret.12 // 19115
D=A // 19116
@CALL // 19117
0;JMP // 19118
(Vec3.do_cross.ret.12)
@SP // 19119
M=M-1 // 19120

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 3")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19121
A=M+1 // 19122
A=A+1 // 19123
D=M // 19124
@SP // 19125
AM=M+1 // 19126
A=A-1 // 19127
M=D // 19128
@LCL // 19129
A=M+1 // 19130
A=A+1 // 19131
A=A+1 // 19132
D=M // 19133
@SP // 19134
AM=M+1 // 19135
A=A-1 // 19136
M=D // 19137
// call Number.do_sub
@7 // 19138
D=A // 19139
@14 // 19140
M=D // 19141
@Number.do_sub // 19142
D=A // 19143
@13 // 19144
M=D // 19145
@Vec3.do_cross.ret.13 // 19146
D=A // 19147
@CALL // 19148
0;JMP // 19149
(Vec3.do_cross.ret.13)
@SP // 19150
M=M-1 // 19151

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 4}
//}

@THIS // 19152
A=M // 19153
D=M // 19154
@SP // 19155
AM=M+1 // 19156
A=A-1 // 19157
M=D // 19158
// call Number.clone
@6 // 19159
D=A // 19160
@14 // 19161
M=D // 19162
@Number.clone // 19163
D=A // 19164
@13 // 19165
M=D // 19166
@Vec3.do_cross.ret.14 // 19167
D=A // 19168
@CALL // 19169
0;JMP // 19170
(Vec3.do_cross.ret.14)
@LCL // 19171
D=M // 19172
@4 // 19173
A=D+A // 19174
D=A // 19175
@R13 // 19176
M=D // 19177
@SP // 19178
AM=M-1 // 19179
D=M // 19180
@R13 // 19181
A=M // 19182
M=D // 19183

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_123 // 19184
D=A // 19185
@13 // 19186
M=D // 19187
@4 // 19188
D=A // 19189
@LCL_PUSH // 19190
0;JMP // 19191
(RETURN_PUSH_LABEL_123)
@ARG // 19192
A=M+1 // 19193
D=M // 19194
@SP // 19195
AM=M+1 // 19196
A=A-1 // 19197
M=D // 19198
// call Vec3.getY
@6 // 19199
D=A // 19200
@14 // 19201
M=D // 19202
@Vec3.getY // 19203
D=A // 19204
@13 // 19205
M=D // 19206
@Vec3.do_cross.ret.15 // 19207
D=A // 19208
@CALL // 19209
0;JMP // 19210
(Vec3.do_cross.ret.15)
// call Number.do_mul
@7 // 19211
D=A // 19212
@14 // 19213
M=D // 19214
@Number.do_mul // 19215
D=A // 19216
@13 // 19217
M=D // 19218
@Vec3.do_cross.ret.16 // 19219
D=A // 19220
@CALL // 19221
0;JMP // 19222
(Vec3.do_cross.ret.16)
@SP // 19223
M=M-1 // 19224

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@THIS // 19225
A=M+1 // 19226
D=M // 19227
@SP // 19228
AM=M+1 // 19229
A=A-1 // 19230
M=D // 19231
// call Number.clone
@6 // 19232
D=A // 19233
@14 // 19234
M=D // 19235
@Number.clone // 19236
D=A // 19237
@13 // 19238
M=D // 19239
@Vec3.do_cross.ret.17 // 19240
D=A // 19241
@CALL // 19242
0;JMP // 19243
(Vec3.do_cross.ret.17)
@LCL // 19244
D=M // 19245
@5 // 19246
A=D+A // 19247
D=A // 19248
@R13 // 19249
M=D // 19250
@SP // 19251
AM=M-1 // 19252
D=M // 19253
@R13 // 19254
A=M // 19255
M=D // 19256

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_124 // 19257
D=A // 19258
@13 // 19259
M=D // 19260
@5 // 19261
D=A // 19262
@LCL_PUSH // 19263
0;JMP // 19264
(RETURN_PUSH_LABEL_124)
@ARG // 19265
A=M+1 // 19266
D=M // 19267
@SP // 19268
AM=M+1 // 19269
A=A-1 // 19270
M=D // 19271
// call Vec3.getX
@6 // 19272
D=A // 19273
@14 // 19274
M=D // 19275
@Vec3.getX // 19276
D=A // 19277
@13 // 19278
M=D // 19279
@Vec3.do_cross.ret.18 // 19280
D=A // 19281
@CALL // 19282
0;JMP // 19283
(Vec3.do_cross.ret.18)
// call Number.do_mul
@7 // 19284
D=A // 19285
@14 // 19286
M=D // 19287
@Number.do_mul // 19288
D=A // 19289
@13 // 19290
M=D // 19291
@Vec3.do_cross.ret.19 // 19292
D=A // 19293
@CALL // 19294
0;JMP // 19295
(Vec3.do_cross.ret.19)
@SP // 19296
M=M-1 // 19297

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 5")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_125 // 19298
D=A // 19299
@13 // 19300
M=D // 19301
@4 // 19302
D=A // 19303
@LCL_PUSH // 19304
0;JMP // 19305
(RETURN_PUSH_LABEL_125)
@RETURN_PUSH_LABEL_126 // 19306
D=A // 19307
@13 // 19308
M=D // 19309
@5 // 19310
D=A // 19311
@LCL_PUSH // 19312
0;JMP // 19313
(RETURN_PUSH_LABEL_126)
// call Number.do_sub
@7 // 19314
D=A // 19315
@14 // 19316
M=D // 19317
@Number.do_sub // 19318
D=A // 19319
@13 // 19320
M=D // 19321
@Vec3.do_cross.ret.20 // 19322
D=A // 19323
@CALL // 19324
0;JMP // 19325
(Vec3.do_cross.ret.20)
@SP // 19326
M=M-1 // 19327

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19328
A=M+1 // 19329
D=M // 19330
@SP // 19331
AM=M+1 // 19332
A=A-1 // 19333
M=D // 19334
// call Number.dispose
@6 // 19335
D=A // 19336
@14 // 19337
M=D // 19338
@Number.dispose // 19339
D=A // 19340
@13 // 19341
M=D // 19342
@Vec3.do_cross.ret.21 // 19343
D=A // 19344
@CALL // 19345
0;JMP // 19346
(Vec3.do_cross.ret.21)
@SP // 19347
M=M-1 // 19348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 19349
A=M+1 // 19350
A=A+1 // 19351
A=A+1 // 19352
D=M // 19353
@SP // 19354
AM=M+1 // 19355
A=A-1 // 19356
M=D // 19357
// call Number.dispose
@6 // 19358
D=A // 19359
@14 // 19360
M=D // 19361
@Number.dispose // 19362
D=A // 19363
@13 // 19364
M=D // 19365
@Vec3.do_cross.ret.22 // 19366
D=A // 19367
@CALL // 19368
0;JMP // 19369
(Vec3.do_cross.ret.22)
@SP // 19370
M=M-1 // 19371

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_127 // 19372
D=A // 19373
@13 // 19374
M=D // 19375
@5 // 19376
D=A // 19377
@LCL_PUSH // 19378
0;JMP // 19379
(RETURN_PUSH_LABEL_127)
// call Number.dispose
@6 // 19380
D=A // 19381
@14 // 19382
M=D // 19383
@Number.dispose // 19384
D=A // 19385
@13 // 19386
M=D // 19387
@Vec3.do_cross.ret.23 // 19388
D=A // 19389
@CALL // 19390
0;JMP // 19391
(Vec3.do_cross.ret.23)
@SP // 19392
M=M-1 // 19393

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19394
A=M // 19395
D=M // 19396
@SP // 19397
AM=M+1 // 19398
A=A-1 // 19399
M=D // 19400
// call Number.dispose
@6 // 19401
D=A // 19402
@14 // 19403
M=D // 19404
@Number.dispose // 19405
D=A // 19406
@13 // 19407
M=D // 19408
@Vec3.do_cross.ret.24 // 19409
D=A // 19410
@CALL // 19411
0;JMP // 19412
(Vec3.do_cross.ret.24)
@SP // 19413
M=M-1 // 19414

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19415
A=M+1 // 19416
D=M // 19417
@SP // 19418
AM=M+1 // 19419
A=A-1 // 19420
M=D // 19421
// call Number.dispose
@6 // 19422
D=A // 19423
@14 // 19424
M=D // 19425
@Number.dispose // 19426
D=A // 19427
@13 // 19428
M=D // 19429
@Vec3.do_cross.ret.25 // 19430
D=A // 19431
@CALL // 19432
0;JMP // 19433
(Vec3.do_cross.ret.25)
@SP // 19434
M=M-1 // 19435

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 19436
A=M+1 // 19437
A=A+1 // 19438
D=M // 19439
@SP // 19440
AM=M+1 // 19441
A=A-1 // 19442
M=D // 19443
// call Number.dispose
@6 // 19444
D=A // 19445
@14 // 19446
M=D // 19447
@Number.dispose // 19448
D=A // 19449
@13 // 19450
M=D // 19451
@Vec3.do_cross.ret.26 // 19452
D=A // 19453
@CALL // 19454
0;JMP // 19455
(Vec3.do_cross.ret.26)
@SP // 19456
M=M-1 // 19457

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 19458
A=M // 19459
D=M // 19460
@THIS // 19461
A=M // 19462
M=D // 19463

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=this 1}
//}

@LCL // 19464
A=M+1 // 19465
A=A+1 // 19466
D=M // 19467
@THIS // 19468
A=M+1 // 19469
M=D // 19470

////PushPopPair {
//  push: PushInstruction("local 4")
//  pop:  PopInstruction{address=this 2}
//}

@LCL // 19471
D=M // 19472
@4 // 19473
A=D+A // 19474
D=M // 19475
@THIS // 19476
A=M+1 // 19477
A=A+1 // 19478
M=D // 19479

////PushInstruction("constant 0")
@SP // 19480
AM=M+1 // 19481
A=A-1 // 19482
M=0 // 19483
@RETURN // 19484
0;JMP // 19485

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.max=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 19486
D=A // 19487
@SP // 19488
AM=D+M // 19489
A=A-1 // 19490
M=0 // 19491
A=A-1 // 19492
M=0 // 19493
A=A-1 // 19494
M=0 // 19495

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
@Math.multiply.EQ.56 // 19496
D=A // 19497
@SP // 19498
AM=M+1 // 19499
A=A-1 // 19500
M=D // 19501
@ARG // 19502
A=M // 19503
D=M // 19504
@DO_EQ // 19505
0;JMP // 19506
(Math.multiply.EQ.56)
@SP // 19507
AM=M+1 // 19508
A=A-1 // 19509
M=D // 19510
@Math.multiply.EQ.57 // 19511
D=A // 19512
@SP // 19513
AM=M+1 // 19514
A=A-1 // 19515
M=D // 19516
@ARG // 19517
A=M+1 // 19518
D=M // 19519
@DO_EQ // 19520
0;JMP // 19521
(Math.multiply.EQ.57)
@SP // 19522
AM=M-1 // 19523
D=D|M // 19524
@Math.multiply$IF_TRUE1 // 19525
D;JNE // 19526

////GotoInstruction{label='Math.multiply$IF_END1}
// goto Math.multiply$IF_END1
@Math.multiply$IF_END1 // 19527
0;JMP // 19528

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 19529
AM=M+1 // 19530
A=A-1 // 19531
M=0 // 19532
@RETURN // 19533
0;JMP // 19534

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
@Math.multiply.EQ.58 // 19535
D=A // 19536
@SP // 19537
AM=M+1 // 19538
A=A-1 // 19539
M=D // 19540
@ARG // 19541
A=M // 19542
D=M // 19543
D=D-1 // 19544
@DO_EQ // 19545
0;JMP // 19546
(Math.multiply.EQ.58)
@Math.multiply$IF_TRUE2 // 19547
D;JNE // 19548

////GotoInstruction{label='Math.multiply$IF_END2}
// goto Math.multiply$IF_END2
@Math.multiply$IF_END2 // 19549
0;JMP // 19550

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 19551
A=M+1 // 19552
D=M // 19553
@SP // 19554
AM=M+1 // 19555
A=A-1 // 19556
M=D // 19557
@RETURN // 19558
0;JMP // 19559

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
@Math.multiply.EQ.59 // 19560
D=A // 19561
@SP // 19562
AM=M+1 // 19563
A=A-1 // 19564
M=D // 19565
@ARG // 19566
A=M+1 // 19567
D=M // 19568
D=D-1 // 19569
@DO_EQ // 19570
0;JMP // 19571
(Math.multiply.EQ.59)
@Math.multiply$IF_TRUE3 // 19572
D;JNE // 19573

////GotoInstruction{label='Math.multiply$IF_END3}
// goto Math.multiply$IF_END3
@Math.multiply$IF_END3 // 19574
0;JMP // 19575

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 19576
A=M // 19577
D=M // 19578
@SP // 19579
AM=M+1 // 19580
A=A-1 // 19581
M=D // 19582
@RETURN // 19583
0;JMP // 19584

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
@Math.multiply.EQ.60 // 19585
D=A // 19586
@SP // 19587
AM=M+1 // 19588
A=A-1 // 19589
M=D // 19590
@ARG // 19591
A=M // 19592
D=M // 19593
@2 // 19594
D=D-A // 19595
@DO_EQ // 19596
0;JMP // 19597
(Math.multiply.EQ.60)
@Math.multiply$IF_TRUE4 // 19598
D;JNE // 19599

////GotoInstruction{label='Math.multiply$IF_END4}
// goto Math.multiply$IF_END4
@Math.multiply$IF_END4 // 19600
0;JMP // 19601

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
@ARG // 19602
A=M+1 // 19603
D=M // 19604
D=D+M // 19605
@SP // 19606
AM=M+1 // 19607
A=A-1 // 19608
M=D // 19609
@RETURN // 19610
0;JMP // 19611

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
@Math.multiply.EQ.61 // 19612
D=A // 19613
@SP // 19614
AM=M+1 // 19615
A=A-1 // 19616
M=D // 19617
@ARG // 19618
A=M+1 // 19619
D=M // 19620
@2 // 19621
D=D-A // 19622
@DO_EQ // 19623
0;JMP // 19624
(Math.multiply.EQ.61)
@Math.multiply$IF_TRUE5 // 19625
D;JNE // 19626

////GotoInstruction{label='Math.multiply$IF_END5}
// goto Math.multiply$IF_END5
@Math.multiply$IF_END5 // 19627
0;JMP // 19628

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
@ARG // 19629
A=M // 19630
D=M // 19631
D=D+M // 19632
@SP // 19633
AM=M+1 // 19634
A=A-1 // 19635
M=D // 19636
@RETURN // 19637
0;JMP // 19638

////LabelInstruction{label='Math.multiply$IF_END5}
// label Math.multiply$IF_END5
(Math.multiply$IF_END5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 19639
A=M+1 // 19640
A=A+1 // 19641
M=1 // 19642

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 19643
A=M+1 // 19644
M=0 // 19645

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 19646
A=M // 19647
M=0 // 19648

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
@Math.multiply.LT.62 // 19649
D=A // 19650
@SP // 19651
AM=M+1 // 19652
A=A-1 // 19653
M=D // 19654
@LCL // 19655
A=M+1 // 19656
D=M // 19657
@16 // 19658
D=D-A // 19659
@DO_LT // 19660
0;JMP // 19661
(Math.multiply.LT.62)
D=!D // 19662
@Math.multiply_WHILE_END1 // 19663
D;JNE // 19664

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
@Math.multiply.EQ.63 // 19665
D=A // 19666
@SP // 19667
AM=M+1 // 19668
A=A-1 // 19669
M=D // 19670
@ARG // 19671
A=M+1 // 19672
D=M // 19673
@LCL // 19674
A=M+1 // 19675
A=A+1 // 19676
D=D&M // 19677
@DO_EQ // 19678
0;JMP // 19679
(Math.multiply.EQ.63)
D=!D // 19680
@Math.multiply$IF_TRUE6 // 19681
D;JNE // 19682

////GotoInstruction{label='Math.multiply$IF_END6}
// goto Math.multiply$IF_END6
@Math.multiply$IF_END6 // 19683
0;JMP // 19684

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

@ARG // 19685
A=M // 19686
D=M // 19687
@LCL // 19688
A=M // 19689
M=D+M // 19690

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

@ARG // 19691
A=M // 19692
D=M // 19693
@ARG // 19694
A=M // 19695
M=D+M // 19696

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

@LCL // 19697
A=M+1 // 19698
M=M+1 // 19699

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

@LCL // 19700
A=M+1 // 19701
A=A+1 // 19702
D=M // 19703
@LCL // 19704
A=M+1 // 19705
A=A+1 // 19706
M=D+M // 19707

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 19708
0;JMP // 19709

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 19710
A=M // 19711
D=M // 19712
@SP // 19713
AM=M+1 // 19714
A=A-1 // 19715
M=D // 19716
@RETURN // 19717
0;JMP // 19718

////FunctionInstruction{functionName='Int32.do_left_shift_bytes', numLocals=1, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_left_shift_bytes with 1
(Int32.do_left_shift_bytes)
@SP // 19719
AM=M+1 // 19720
A=A-1 // 19721
M=0 // 19722

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 19723
A=M // 19724
D=M // 19725
@3 // 19726
M=D // 19727

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("argument 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes$IF_TRUE1}}
@Int32.do_left_shift_bytes.GT.64 // 19728
D=A // 19729
@SP // 19730
AM=M+1 // 19731
A=A-1 // 19732
M=D // 19733
@ARG // 19734
A=M+1 // 19735
D=M // 19736
@DO_GT // 19737
0;JMP // 19738
(Int32.do_left_shift_bytes.GT.64)
D=!D // 19739
@Int32.do_left_shift_bytes$IF_TRUE1 // 19740
D;JNE // 19741

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_END1}
// goto Int32.do_left_shift_bytes$IF_END1
@Int32.do_left_shift_bytes$IF_END1 // 19742
0;JMP // 19743

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_TRUE1}
// label Int32.do_left_shift_bytes$IF_TRUE1
(Int32.do_left_shift_bytes$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 19744
AM=M+1 // 19745
A=A-1 // 19746
M=0 // 19747
@RETURN // 19748
0;JMP // 19749

////LabelInstruction{label='Int32.do_left_shift_bytes$IF_END1}
// label Int32.do_left_shift_bytes$IF_END1
(Int32.do_left_shift_bytes$IF_END1)

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 0}
//}

@3 // 19750
D=A // 19751
@LCL // 19752
A=M // 19753
M=D // 19754

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
@Int32.do_left_shift_bytes.LT.65 // 19755
D=A // 19756
@SP // 19757
AM=M+1 // 19758
A=A-1 // 19759
M=D // 19760
@LCL // 19761
A=M // 19762
D=M // 19763
@DO_LT // 19764
0;JMP // 19765
(Int32.do_left_shift_bytes.LT.65)
@Int32.do_left_shift_bytes_WHILE_END1 // 19766
D;JNE // 19767

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
@Int32.do_left_shift_bytes.LT.66 // 19768
D=A // 19769
@SP // 19770
AM=M+1 // 19771
A=A-1 // 19772
M=D // 19773
@LCL // 19774
A=M // 19775
D=M // 19776
@ARG // 19777
A=M+1 // 19778
D=D-M // 19779
@DO_LT // 19780
0;JMP // 19781
(Int32.do_left_shift_bytes.LT.66)
D=!D // 19782
@Int32.do_left_shift_bytes$IF_TRUE2 // 19783
D;JNE // 19784

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_FALSE2}
// goto Int32.do_left_shift_bytes$IF_FALSE2
@Int32.do_left_shift_bytes$IF_FALSE2 // 19785
0;JMP // 19786

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
@THIS // 19787
A=M // 19788
D=M // 19789
@LCL // 19790
A=M // 19791
D=D+M // 19792
@SP // 19793
AM=M+1 // 19794
A=A-1 // 19795
M=D // 19796
@THIS // 19797
A=M // 19798
D=M // 19799
@SP // 19800
AM=M+1 // 19801
A=A-1 // 19802
M=D // 19803
@LCL // 19804
A=M // 19805
D=M // 19806
@ARG // 19807
A=M+1 // 19808
D=D-M // 19809
@SP // 19810
AM=M-1 // 19811
A=D+M // 19812
D=M // 19813
@SP // 19814
AM=M-1 // 19815
A=M // 19816
M=D // 19817

////GotoInstruction{label='Int32.do_left_shift_bytes$IF_END2}
// goto Int32.do_left_shift_bytes$IF_END2
@Int32.do_left_shift_bytes$IF_END2 // 19818
0;JMP // 19819

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
@THIS // 19820
A=M // 19821
D=M // 19822
@LCL // 19823
A=M // 19824
D=D+M // 19825
@SP // 19826
AM=M+1 // 19827
A=A-1 // 19828
M=D // 19829
D=0 // 19830
@SP // 19831
AM=M-1 // 19832
A=M // 19833
M=D // 19834

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

@LCL // 19835
A=M // 19836
M=M-1 // 19837

////GotoInstruction{label='Int32.do_left_shift_bytes_WHILE_EXP1}
// goto Int32.do_left_shift_bytes_WHILE_EXP1
@Int32.do_left_shift_bytes_WHILE_EXP1 // 19838
0;JMP // 19839

////LabelInstruction{label='Int32.do_left_shift_bytes_WHILE_END1}
// label Int32.do_left_shift_bytes_WHILE_END1
(Int32.do_left_shift_bytes_WHILE_END1)

////PushInstruction("constant 0")
@SP // 19840
AM=M+1 // 19841
A=A-1 // 19842
M=0 // 19843
@RETURN // 19844
0;JMP // 19845

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 19846
AM=M+1 // 19847
A=A-1 // 19848
M=0 // 19849

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 19850
A=M // 19851
M=0 // 19852

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
@Memory.copy.LT.67 // 19853
D=A // 19854
@SP // 19855
AM=M+1 // 19856
A=A-1 // 19857
M=D // 19858
@LCL // 19859
A=M // 19860
D=M // 19861
@ARG // 19862
A=M+1 // 19863
A=A+1 // 19864
D=D-M // 19865
@DO_LT // 19866
0;JMP // 19867
(Memory.copy.LT.67)
D=!D // 19868
@Memory.copy_WHILE_END1 // 19869
D;JNE // 19870

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
@ARG // 19871
A=M+1 // 19872
D=M // 19873
@LCL // 19874
A=M // 19875
D=D+M // 19876
@SP // 19877
AM=M+1 // 19878
A=A-1 // 19879
M=D // 19880
@ARG // 19881
A=M // 19882
D=M // 19883
@LCL // 19884
A=M // 19885
A=D+M // 19886
D=M // 19887
@SP // 19888
AM=M-1 // 19889
A=M // 19890
M=D // 19891

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

@LCL // 19892
A=M // 19893
M=M+1 // 19894

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 19895
0;JMP // 19896

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 19897
AM=M+1 // 19898
A=A-1 // 19899
M=0 // 19900
@RETURN // 19901
0;JMP // 19902

////FunctionInstruction{functionName='Ray.getDirection', numLocals=0, funcMapping={}}
// function Ray.getDirection with 0
(Ray.getDirection)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 19903
A=M // 19904
D=M // 19905
@3 // 19906
M=D // 19907

////PushInstruction("this 1")
@THIS // 19908
A=M+1 // 19909
D=M // 19910
@SP // 19911
AM=M+1 // 19912
A=A-1 // 19913
M=D // 19914
@RETURN // 19915
0;JMP // 19916

////FunctionInstruction{functionName='Int32.arith_rightshift', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.arith_rightshift with 3
(Int32.arith_rightshift)
@3 // 19917
D=A // 19918
@SP // 19919
AM=D+M // 19920
A=A-1 // 19921
M=0 // 19922
A=A-1 // 19923
M=0 // 19924
A=A-1 // 19925
M=0 // 19926

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.arith_rightshift$IF_TRUE1}}
@Int32.arith_rightshift.EQ.68 // 19927
D=A // 19928
@SP // 19929
AM=M+1 // 19930
A=A-1 // 19931
M=D // 19932
@ARG // 19933
A=M // 19934
D=M // 19935
@DO_EQ // 19936
0;JMP // 19937
(Int32.arith_rightshift.EQ.68)
@Int32.arith_rightshift$IF_TRUE1 // 19938
D;JNE // 19939

////GotoInstruction{label='Int32.arith_rightshift$IF_END1}
// goto Int32.arith_rightshift$IF_END1
@Int32.arith_rightshift$IF_END1 // 19940
0;JMP // 19941

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE1}
// label Int32.arith_rightshift$IF_TRUE1
(Int32.arith_rightshift$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 19942
AM=M+1 // 19943
A=A-1 // 19944
M=0 // 19945
@RETURN // 19946
0;JMP // 19947

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
@Int32.arith_rightshift.EQ.69 // 19948
D=A // 19949
@SP // 19950
AM=M+1 // 19951
A=A-1 // 19952
M=D // 19953
@ARG // 19954
A=M+1 // 19955
D=M // 19956
@DO_EQ // 19957
0;JMP // 19958
(Int32.arith_rightshift.EQ.69)
@Int32.arith_rightshift$IF_TRUE2 // 19959
D;JNE // 19960

////GotoInstruction{label='Int32.arith_rightshift$IF_END2}
// goto Int32.arith_rightshift$IF_END2
@Int32.arith_rightshift$IF_END2 // 19961
0;JMP // 19962

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE2}
// label Int32.arith_rightshift$IF_TRUE2
(Int32.arith_rightshift$IF_TRUE2)

////PushInstruction("argument 0")
@ARG // 19963
A=M // 19964
D=M // 19965
@SP // 19966
AM=M+1 // 19967
A=A-1 // 19968
M=D // 19969
@RETURN // 19970
0;JMP // 19971

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
@Int32.arith_rightshift.GT.70 // 19972
D=A // 19973
@SP // 19974
AM=M+1 // 19975
A=A-1 // 19976
M=D // 19977
@ARG // 19978
A=M // 19979
D=M // 19980
@DO_GT // 19981
0;JMP // 19982
(Int32.arith_rightshift.GT.70)
@Int32.arith_rightshift$IF_TRUE3 // 19983
D;JNE // 19984

////GotoInstruction{label='Int32.arith_rightshift$IF_FALSE3}
// goto Int32.arith_rightshift$IF_FALSE3
@Int32.arith_rightshift$IF_FALSE3 // 19985
0;JMP // 19986

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

@ARG // 19987
A=M // 19988
D=M // 19989
@SP // 19990
AM=M+1 // 19991
A=A-1 // 19992
M=D // 19993
@Int32.1 // 19994
D=M // 19995
@ARG // 19996
A=M+1 // 19997
A=D+M // 19998
D=M // 19999
@SP // 20000
AM=M+1 // 20001
A=A-1 // 20002
M=D // 20003
// call Math.divide
@7 // 20004
D=A // 20005
@14 // 20006
M=D // 20007
@Math.divide // 20008
D=A // 20009
@13 // 20010
M=D // 20011
@Int32.arith_rightshift.ret.0 // 20012
D=A // 20013
@CALL // 20014
0;JMP // 20015
(Int32.arith_rightshift.ret.0)
@SP // 20016
AM=M-1 // 20017
D=M // 20018
@LCL // 20019
A=M // 20020
M=D // 20021

////GotoInstruction{label='Int32.arith_rightshift$IF_END3}
// goto Int32.arith_rightshift$IF_END3
@Int32.arith_rightshift$IF_END3 // 20022
0;JMP // 20023

////LabelInstruction{label='Int32.arith_rightshift$IF_FALSE3}
// label Int32.arith_rightshift$IF_FALSE3
(Int32.arith_rightshift$IF_FALSE3)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 20024
A=M // 20025
D=M // 20026
@LCL // 20027
A=M // 20028
M=D // 20029

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 20030
A=M+1 // 20031
M=0 // 20032

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
@Int32.arith_rightshift.LT.71 // 20033
D=A // 20034
@SP // 20035
AM=M+1 // 20036
A=A-1 // 20037
M=D // 20038
@LCL // 20039
A=M+1 // 20040
D=M // 20041
@ARG // 20042
A=M+1 // 20043
D=D-M // 20044
@DO_LT // 20045
0;JMP // 20046
(Int32.arith_rightshift.LT.71)
D=!D // 20047
@Int32.arith_rightshift_WHILE_END1 // 20048
D;JNE // 20049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 2")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 20050
A=M // 20051
D=M // 20052
@SP // 20053
AM=M+1 // 20054
A=A-1 // 20055
M=D // 20056
@2 // 20057
D=A // 20058
@SP // 20059
AM=M+1 // 20060
A=A-1 // 20061
M=D // 20062
// call Math.divide
@7 // 20063
D=A // 20064
@14 // 20065
M=D // 20066
@Math.divide // 20067
D=A // 20068
@13 // 20069
M=D // 20070
@Int32.arith_rightshift.ret.1 // 20071
D=A // 20072
@CALL // 20073
0;JMP // 20074
(Int32.arith_rightshift.ret.1)
@SP // 20075
AM=M-1 // 20076
D=M // 20077
@LCL // 20078
A=M+1 // 20079
A=A+1 // 20080
M=D // 20081

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
@Int32.arith_rightshift.EQ.72 // 20082
D=A // 20083
@SP // 20084
AM=M+1 // 20085
A=A-1 // 20086
M=D // 20087
@LCL // 20088
A=M // 20089
D=M // 20090
@1 // 20091
D=D&A // 20092
@DO_EQ // 20093
0;JMP // 20094
(Int32.arith_rightshift.EQ.72)
@Int32.arith_rightshift$IF_TRUE4 // 20095
D;JNE // 20096

////GotoInstruction{label='Int32.arith_rightshift$IF_FALSE4}
// goto Int32.arith_rightshift$IF_FALSE4
@Int32.arith_rightshift$IF_FALSE4 // 20097
0;JMP // 20098

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE4}
// label Int32.arith_rightshift$IF_TRUE4
(Int32.arith_rightshift$IF_TRUE4)

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 20099
A=M+1 // 20100
A=A+1 // 20101
D=M // 20102
@LCL // 20103
A=M // 20104
M=D // 20105

////GotoInstruction{label='Int32.arith_rightshift$IF_END4}
// goto Int32.arith_rightshift$IF_END4
@Int32.arith_rightshift$IF_END4 // 20106
0;JMP // 20107

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

@LCL // 20108
A=M+1 // 20109
A=A+1 // 20110
D=M // 20111
D=D-1 // 20112
@LCL // 20113
A=M // 20114
M=D // 20115

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
@Int32.arith_rightshift.EQ.73 // 20116
D=A // 20117
@SP // 20118
AM=M+1 // 20119
A=A-1 // 20120
M=D // 20121
@LCL // 20122
A=M // 20123
D=M // 20124
D=D+1 // 20125
@DO_EQ // 20126
0;JMP // 20127
(Int32.arith_rightshift.EQ.73)
@Int32.arith_rightshift$IF_TRUE5 // 20128
D;JNE // 20129

////GotoInstruction{label='Int32.arith_rightshift$IF_END5}
// goto Int32.arith_rightshift$IF_END5
@Int32.arith_rightshift$IF_END5 // 20130
0;JMP // 20131

////LabelInstruction{label='Int32.arith_rightshift$IF_TRUE5}
// label Int32.arith_rightshift$IF_TRUE5
(Int32.arith_rightshift$IF_TRUE5)

////PushInstruction("local 0")
@LCL // 20132
A=M // 20133
D=M // 20134
@SP // 20135
AM=M+1 // 20136
A=A-1 // 20137
M=D // 20138
@RETURN // 20139
0;JMP // 20140

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

@LCL // 20141
A=M+1 // 20142
M=M+1 // 20143

////GotoInstruction{label='Int32.arith_rightshift_WHILE_EXP1}
// goto Int32.arith_rightshift_WHILE_EXP1
@Int32.arith_rightshift_WHILE_EXP1 // 20144
0;JMP // 20145

////LabelInstruction{label='Int32.arith_rightshift_WHILE_END1}
// label Int32.arith_rightshift_WHILE_END1
(Int32.arith_rightshift_WHILE_END1)

////LabelInstruction{label='Int32.arith_rightshift$IF_END3}
// label Int32.arith_rightshift$IF_END3
(Int32.arith_rightshift$IF_END3)

////PushInstruction("local 0")
@LCL // 20146
A=M // 20147
D=M // 20148
@SP // 20149
AM=M+1 // 20150
A=A-1 // 20151
M=D // 20152
@RETURN // 20153
0;JMP // 20154

////FunctionInstruction{functionName='Main.main', numLocals=9, funcMapping={Main.render=55, Main.getSomething=4}}
// function Main.main with 9
(Main.main)
@9 // 20155
D=A // 20156
@SP // 20157
AM=D+M // 20158
A=A-1 // 20159
M=0 // 20160
A=A-1 // 20161
M=0 // 20162
A=A-1 // 20163
M=0 // 20164
A=A-1 // 20165
M=0 // 20166
A=A-1 // 20167
M=0 // 20168
A=A-1 // 20169
M=0 // 20170
A=A-1 // 20171
M=0 // 20172
A=A-1 // 20173
M=0 // 20174
A=A-1 // 20175
M=0 // 20176

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Int32.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Int32.initialize
@5 // 20177
D=A // 20178
@14 // 20179
M=D // 20180
@Int32.initialize // 20181
D=A // 20182
@13 // 20183
M=D // 20184
@Main.main.ret.0 // 20185
D=A // 20186
@CALL // 20187
0;JMP // 20188
(Main.main.ret.0)
@SP // 20189
M=M-1 // 20190

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Number.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Number.initialize
@5 // 20191
D=A // 20192
@14 // 20193
M=D // 20194
@Number.initialize // 20195
D=A // 20196
@13 // 20197
M=D // 20198
@Main.main.ret.1 // 20199
D=A // 20200
@CALL // 20201
0;JMP // 20202
(Main.main.ret.1)
@SP // 20203
M=M-1 // 20204

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Plane.initialize}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Plane.initialize
@5 // 20205
D=A // 20206
@14 // 20207
M=D // 20208
@Plane.initialize // 20209
D=A // 20210
@13 // 20211
M=D // 20212
@Main.main.ret.2 // 20213
D=A // 20214
@CALL // 20215
0;JMP // 20216
(Main.main.ret.2)
@SP // 20217
M=M-1 // 20218

////PushPopPair {
//  push: PushInstruction("constant 5")
//  pop:  PopInstruction{address=local 1}
//}

@5 // 20219
D=A // 20220
@LCL // 20221
A=M+1 // 20222
M=D // 20223

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 20224
A=M+1 // 20225
D=M // 20226
@SP // 20227
AM=M+1 // 20228
A=A-1 // 20229
M=D // 20230
// call Memory.alloc
@6 // 20231
D=A // 20232
@14 // 20233
M=D // 20234
@Memory.alloc // 20235
D=A // 20236
@13 // 20237
M=D // 20238
@Main.main.ret.3 // 20239
D=A // 20240
@CALL // 20241
0;JMP // 20242
(Main.main.ret.3)
@SP // 20243
AM=M-1 // 20244
D=M // 20245
@LCL // 20246
A=M+1 // 20247
A=A+1 // 20248
M=D // 20249

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 3}
//}

@3 // 20250
D=A // 20251
@LCL // 20252
A=M+1 // 20253
A=A+1 // 20254
A=A+1 // 20255
M=D // 20256

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 20257
A=M+1 // 20258
A=A+1 // 20259
A=A+1 // 20260
D=M // 20261
@SP // 20262
AM=M+1 // 20263
A=A-1 // 20264
M=D // 20265
// call Memory.alloc
@6 // 20266
D=A // 20267
@14 // 20268
M=D // 20269
@Memory.alloc // 20270
D=A // 20271
@13 // 20272
M=D // 20273
@Main.main.ret.4 // 20274
D=A // 20275
@CALL // 20276
0;JMP // 20277
(Main.main.ret.4)
@LCL // 20278
D=M // 20279
@4 // 20280
A=D+A // 20281
D=A // 20282
@R13 // 20283
M=D // 20284
@SP // 20285
AM=M-1 // 20286
D=M // 20287
@R13 // 20288
A=M // 20289
M=D // 20290

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -6")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant -5")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant 4"), PushInstruction("constant 5")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 20291
A=M+1 // 20292
A=A+1 // 20293
D=M // 20294
@0 // 20295
D=D+A // 20296
@SP // 20297
AM=M+1 // 20298
A=A-1 // 20299
M=D // 20300
@6 // 20301
D=-A // 20302
@SP // 20303
AM=M+1 // 20304
A=A-1 // 20305
M=D // 20306
// call Number.new
@6 // 20307
D=A // 20308
@14 // 20309
M=D // 20310
@Number.new // 20311
D=A // 20312
@13 // 20313
M=D // 20314
@Main.main.ret.5 // 20315
D=A // 20316
@CALL // 20317
0;JMP // 20318
(Main.main.ret.5)
@2 // 20319
D=A // 20320
@SP // 20321
M=D+M // 20322
@2 // 20323
D=A // 20324
@SP // 20325
A=M-1 // 20326
M=D // 20327
A=A-1 // 20328
M=-1 // 20329
// call Main.getSomething
@7 // 20330
D=A // 20331
@14 // 20332
M=D // 20333
@Main.getSomething // 20334
D=A // 20335
@13 // 20336
M=D // 20337
@Main.main.ret.6 // 20338
D=A // 20339
@CALL // 20340
0;JMP // 20341
(Main.main.ret.6)
@5 // 20342
D=-A // 20343
@SP // 20344
AM=M+1 // 20345
A=A-1 // 20346
M=D // 20347
// call Number.new
@6 // 20348
D=A // 20349
@14 // 20350
M=D // 20351
@Number.new // 20352
D=A // 20353
@13 // 20354
M=D // 20355
@Main.main.ret.7 // 20356
D=A // 20357
@CALL // 20358
0;JMP // 20359
(Main.main.ret.7)
// call Vec3.new
@8 // 20360
D=A // 20361
@14 // 20362
M=D // 20363
@Vec3.new // 20364
D=A // 20365
@13 // 20366
M=D // 20367
@Main.main.ret.8 // 20368
D=A // 20369
@CALL // 20370
0;JMP // 20371
(Main.main.ret.8)
@3 // 20372
D=A // 20373
@SP // 20374
AM=M+1 // 20375
A=A-1 // 20376
M=D // 20377
@2 // 20378
D=A // 20379
@SP // 20380
AM=M+1 // 20381
A=A-1 // 20382
M=D // 20383
// call Main.getSomething
@7 // 20384
D=A // 20385
@14 // 20386
M=D // 20387
@Main.getSomething // 20388
D=A // 20389
@13 // 20390
M=D // 20391
@Main.main.ret.9 // 20392
D=A // 20393
@CALL // 20394
0;JMP // 20395
(Main.main.ret.9)
@4 // 20396
D=A // 20397
@SP // 20398
AM=M+1 // 20399
A=A-1 // 20400
M=D // 20401
@5 // 20402
D=A // 20403
@SP // 20404
AM=M+1 // 20405
A=A-1 // 20406
M=D // 20407
// call Main.getSomething
@7 // 20408
D=A // 20409
@14 // 20410
M=D // 20411
@Main.getSomething // 20412
D=A // 20413
@13 // 20414
M=D // 20415
@Main.main.ret.10 // 20416
D=A // 20417
@CALL // 20418
0;JMP // 20419
(Main.main.ret.10)
// call Sphere.new
@8 // 20420
D=A // 20421
@14 // 20422
M=D // 20423
@Sphere.new // 20424
D=A // 20425
@13 // 20426
M=D // 20427
@Main.main.ret.11 // 20428
D=A // 20429
@CALL // 20430
0;JMP // 20431
(Main.main.ret.11)
// call Element.sphere
@6 // 20432
D=A // 20433
@14 // 20434
M=D // 20435
@Element.sphere // 20436
D=A // 20437
@13 // 20438
M=D // 20439
@Main.main.ret.12 // 20440
D=A // 20441
@CALL // 20442
0;JMP // 20443
(Main.main.ret.12)
@SP // 20444
AM=M-1 // 20445
D=M // 20446
@SP // 20447
AM=M-1 // 20448
A=M // 20449
M=D // 20450

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -5")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 5")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 20451
A=M+1 // 20452
A=A+1 // 20453
D=M // 20454
D=D+1 // 20455
@SP // 20456
AM=M+1 // 20457
A=A-1 // 20458
M=D // 20459
@SP // 20460
AM=M+1 // 20461
A=A-1 // 20462
M=-1 // 20463
// call Number.new
@6 // 20464
D=A // 20465
@14 // 20466
M=D // 20467
@Number.new // 20468
D=A // 20469
@13 // 20470
M=D // 20471
@Main.main.ret.13 // 20472
D=A // 20473
@CALL // 20474
0;JMP // 20475
(Main.main.ret.13)
@SP // 20476
AM=M+1 // 20477
A=A-1 // 20478
M=-1 // 20479
// call Number.new
@6 // 20480
D=A // 20481
@14 // 20482
M=D // 20483
@Number.new // 20484
D=A // 20485
@13 // 20486
M=D // 20487
@Main.main.ret.14 // 20488
D=A // 20489
@CALL // 20490
0;JMP // 20491
(Main.main.ret.14)
@5 // 20492
D=-A // 20493
@SP // 20494
AM=M+1 // 20495
A=A-1 // 20496
M=D // 20497
// call Number.new
@6 // 20498
D=A // 20499
@14 // 20500
M=D // 20501
@Number.new // 20502
D=A // 20503
@13 // 20504
M=D // 20505
@Main.main.ret.15 // 20506
D=A // 20507
@CALL // 20508
0;JMP // 20509
(Main.main.ret.15)
// call Vec3.new
@8 // 20510
D=A // 20511
@14 // 20512
M=D // 20513
@Vec3.new // 20514
D=A // 20515
@13 // 20516
M=D // 20517
@Main.main.ret.16 // 20518
D=A // 20519
@CALL // 20520
0;JMP // 20521
(Main.main.ret.16)
@SP // 20522
AM=M+1 // 20523
A=A-1 // 20524
M=1 // 20525
// call Number.new
@6 // 20526
D=A // 20527
@14 // 20528
M=D // 20529
@Number.new // 20530
D=A // 20531
@13 // 20532
M=D // 20533
@Main.main.ret.17 // 20534
D=A // 20535
@CALL // 20536
0;JMP // 20537
(Main.main.ret.17)
@3 // 20538
D=A // 20539
@SP // 20540
AM=M+1 // 20541
A=A-1 // 20542
M=D // 20543
@5 // 20544
D=A // 20545
@SP // 20546
AM=M+1 // 20547
A=A-1 // 20548
M=D // 20549
// call Main.getSomething
@7 // 20550
D=A // 20551
@14 // 20552
M=D // 20553
@Main.getSomething // 20554
D=A // 20555
@13 // 20556
M=D // 20557
@Main.main.ret.18 // 20558
D=A // 20559
@CALL // 20560
0;JMP // 20561
(Main.main.ret.18)
// call Sphere.new
@8 // 20562
D=A // 20563
@14 // 20564
M=D // 20565
@Sphere.new // 20566
D=A // 20567
@13 // 20568
M=D // 20569
@Main.main.ret.19 // 20570
D=A // 20571
@CALL // 20572
0;JMP // 20573
(Main.main.ret.19)
// call Element.sphere
@6 // 20574
D=A // 20575
@14 // 20576
M=D // 20577
@Element.sphere // 20578
D=A // 20579
@13 // 20580
M=D // 20581
@Main.main.ret.20 // 20582
D=A // 20583
@CALL // 20584
0;JMP // 20585
(Main.main.ret.20)
@SP // 20586
AM=M-1 // 20587
D=M // 20588
@SP // 20589
AM=M-1 // 20590
A=M // 20591
M=D // 20592

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -3")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}], call=CallInstruction{Sphere.new}}], call=CallInstruction{Element.sphere}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 20593
A=M+1 // 20594
A=A+1 // 20595
D=M // 20596
@2 // 20597
D=D+A // 20598
@SP // 20599
AM=M+1 // 20600
A=A-1 // 20601
M=D // 20602
@2 // 20603
D=A // 20604
@SP // 20605
AM=M+1 // 20606
A=A-1 // 20607
M=D // 20608
// call Number.new
@6 // 20609
D=A // 20610
@14 // 20611
M=D // 20612
@Number.new // 20613
D=A // 20614
@13 // 20615
M=D // 20616
@Main.main.ret.21 // 20617
D=A // 20618
@CALL // 20619
0;JMP // 20620
(Main.main.ret.21)
@SP // 20621
AM=M+1 // 20622
A=A-1 // 20623
M=0 // 20624
// call Number.new
@6 // 20625
D=A // 20626
@14 // 20627
M=D // 20628
@Number.new // 20629
D=A // 20630
@13 // 20631
M=D // 20632
@Main.main.ret.22 // 20633
D=A // 20634
@CALL // 20635
0;JMP // 20636
(Main.main.ret.22)
@3 // 20637
D=-A // 20638
@SP // 20639
AM=M+1 // 20640
A=A-1 // 20641
M=D // 20642
// call Number.new
@6 // 20643
D=A // 20644
@14 // 20645
M=D // 20646
@Number.new // 20647
D=A // 20648
@13 // 20649
M=D // 20650
@Main.main.ret.23 // 20651
D=A // 20652
@CALL // 20653
0;JMP // 20654
(Main.main.ret.23)
// call Vec3.new
@8 // 20655
D=A // 20656
@14 // 20657
M=D // 20658
@Vec3.new // 20659
D=A // 20660
@13 // 20661
M=D // 20662
@Main.main.ret.24 // 20663
D=A // 20664
@CALL // 20665
0;JMP // 20666
(Main.main.ret.24)
@2 // 20667
D=A // 20668
@SP // 20669
AM=M+1 // 20670
A=A-1 // 20671
M=D // 20672
// call Number.new
@6 // 20673
D=A // 20674
@14 // 20675
M=D // 20676
@Number.new // 20677
D=A // 20678
@13 // 20679
M=D // 20680
@Main.main.ret.25 // 20681
D=A // 20682
@CALL // 20683
0;JMP // 20684
(Main.main.ret.25)
@SP // 20685
AM=M+1 // 20686
A=A-1 // 20687
M=1 // 20688
// call Number.new
@6 // 20689
D=A // 20690
@14 // 20691
M=D // 20692
@Number.new // 20693
D=A // 20694
@13 // 20695
M=D // 20696
@Main.main.ret.26 // 20697
D=A // 20698
@CALL // 20699
0;JMP // 20700
(Main.main.ret.26)
// call Sphere.new
@8 // 20701
D=A // 20702
@14 // 20703
M=D // 20704
@Sphere.new // 20705
D=A // 20706
@13 // 20707
M=D // 20708
@Main.main.ret.27 // 20709
D=A // 20710
@CALL // 20711
0;JMP // 20712
(Main.main.ret.27)
// call Element.sphere
@6 // 20713
D=A // 20714
@14 // 20715
M=D // 20716
@Element.sphere // 20717
D=A // 20718
@13 // 20719
M=D // 20720
@Main.main.ret.28 // 20721
D=A // 20722
@CALL // 20723
0;JMP // 20724
(Main.main.ret.28)
@SP // 20725
AM=M-1 // 20726
D=M // 20727
@SP // 20728
AM=M-1 // 20729
A=M // 20730
M=D // 20731

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -25")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Number.new}}, PushInstruction("constant 0")], call=CallInstruction{Plane.new}}], call=CallInstruction{Element.plane}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 20732
A=M+1 // 20733
A=A+1 // 20734
D=M // 20735
@3 // 20736
D=D+A // 20737
@SP // 20738
AM=M+1 // 20739
A=A-1 // 20740
M=D // 20741
@SP // 20742
AM=M+1 // 20743
A=A-1 // 20744
M=0 // 20745
// call Number.new
@6 // 20746
D=A // 20747
@14 // 20748
M=D // 20749
@Number.new // 20750
D=A // 20751
@13 // 20752
M=D // 20753
@Main.main.ret.29 // 20754
D=A // 20755
@CALL // 20756
0;JMP // 20757
(Main.main.ret.29)
@SP // 20758
AM=M+1 // 20759
A=A-1 // 20760
M=0 // 20761
// call Number.new
@6 // 20762
D=A // 20763
@14 // 20764
M=D // 20765
@Number.new // 20766
D=A // 20767
@13 // 20768
M=D // 20769
@Main.main.ret.30 // 20770
D=A // 20771
@CALL // 20772
0;JMP // 20773
(Main.main.ret.30)
@25 // 20774
D=-A // 20775
@SP // 20776
AM=M+1 // 20777
A=A-1 // 20778
M=D // 20779
// call Number.new
@6 // 20780
D=A // 20781
@14 // 20782
M=D // 20783
@Number.new // 20784
D=A // 20785
@13 // 20786
M=D // 20787
@Main.main.ret.31 // 20788
D=A // 20789
@CALL // 20790
0;JMP // 20791
(Main.main.ret.31)
// call Vec3.new
@8 // 20792
D=A // 20793
@14 // 20794
M=D // 20795
@Vec3.new // 20796
D=A // 20797
@13 // 20798
M=D // 20799
@Main.main.ret.32 // 20800
D=A // 20801
@CALL // 20802
0;JMP // 20803
(Main.main.ret.32)
@SP // 20804
AM=M+1 // 20805
A=A-1 // 20806
M=0 // 20807
// call Number.new
@6 // 20808
D=A // 20809
@14 // 20810
M=D // 20811
@Number.new // 20812
D=A // 20813
@13 // 20814
M=D // 20815
@Main.main.ret.33 // 20816
D=A // 20817
@CALL // 20818
0;JMP // 20819
(Main.main.ret.33)
@SP // 20820
AM=M+1 // 20821
A=A-1 // 20822
M=0 // 20823
// call Number.new
@6 // 20824
D=A // 20825
@14 // 20826
M=D // 20827
@Number.new // 20828
D=A // 20829
@13 // 20830
M=D // 20831
@Main.main.ret.34 // 20832
D=A // 20833
@CALL // 20834
0;JMP // 20835
(Main.main.ret.34)
@SP // 20836
AM=M+1 // 20837
A=A-1 // 20838
M=-1 // 20839
// call Number.new
@6 // 20840
D=A // 20841
@14 // 20842
M=D // 20843
@Number.new // 20844
D=A // 20845
@13 // 20846
M=D // 20847
@Main.main.ret.35 // 20848
D=A // 20849
@CALL // 20850
0;JMP // 20851
(Main.main.ret.35)
// call Vec3.new
@8 // 20852
D=A // 20853
@14 // 20854
M=D // 20855
@Vec3.new // 20856
D=A // 20857
@13 // 20858
M=D // 20859
@Main.main.ret.36 // 20860
D=A // 20861
@CALL // 20862
0;JMP // 20863
(Main.main.ret.36)
@SP // 20864
AM=M+1 // 20865
A=A-1 // 20866
M=1 // 20867
// call Number.new
@6 // 20868
D=A // 20869
@14 // 20870
M=D // 20871
@Number.new // 20872
D=A // 20873
@13 // 20874
M=D // 20875
@Main.main.ret.37 // 20876
D=A // 20877
@CALL // 20878
0;JMP // 20879
(Main.main.ret.37)
@SP // 20880
AM=M+1 // 20881
A=A-1 // 20882
M=0 // 20883
// call Plane.new
@9 // 20884
D=A // 20885
@14 // 20886
M=D // 20887
@Plane.new // 20888
D=A // 20889
@13 // 20890
M=D // 20891
@Main.main.ret.38 // 20892
D=A // 20893
@CALL // 20894
0;JMP // 20895
(Main.main.ret.38)
// call Element.plane
@6 // 20896
D=A // 20897
@14 // 20898
M=D // 20899
@Element.plane // 20900
D=A // 20901
@13 // 20902
M=D // 20903
@Main.main.ret.39 // 20904
D=A // 20905
@CALL // 20906
0;JMP // 20907
(Main.main.ret.39)
@SP // 20908
AM=M-1 // 20909
D=M // 20910
@SP // 20911
AM=M-1 // 20912
A=M // 20913
M=D // 20914

////PushWriter{source=CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -2")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, PushInstruction("constant -1")], call=CallInstruction{Plane.new}}], call=CallInstruction{Element.plane}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 20915
A=M+1 // 20916
A=A+1 // 20917
D=M // 20918
@4 // 20919
D=D+A // 20920
@SP // 20921
AM=M+1 // 20922
A=A-1 // 20923
M=D // 20924
@SP // 20925
AM=M+1 // 20926
A=A-1 // 20927
M=0 // 20928
// call Number.new
@6 // 20929
D=A // 20930
@14 // 20931
M=D // 20932
@Number.new // 20933
D=A // 20934
@13 // 20935
M=D // 20936
@Main.main.ret.40 // 20937
D=A // 20938
@CALL // 20939
0;JMP // 20940
(Main.main.ret.40)
@2 // 20941
D=-A // 20942
@SP // 20943
AM=M+1 // 20944
A=A-1 // 20945
M=D // 20946
// call Number.new
@6 // 20947
D=A // 20948
@14 // 20949
M=D // 20950
@Number.new // 20951
D=A // 20952
@13 // 20953
M=D // 20954
@Main.main.ret.41 // 20955
D=A // 20956
@CALL // 20957
0;JMP // 20958
(Main.main.ret.41)
@SP // 20959
AM=M+1 // 20960
A=A-1 // 20961
M=0 // 20962
// call Number.new
@6 // 20963
D=A // 20964
@14 // 20965
M=D // 20966
@Number.new // 20967
D=A // 20968
@13 // 20969
M=D // 20970
@Main.main.ret.42 // 20971
D=A // 20972
@CALL // 20973
0;JMP // 20974
(Main.main.ret.42)
// call Vec3.new
@8 // 20975
D=A // 20976
@14 // 20977
M=D // 20978
@Vec3.new // 20979
D=A // 20980
@13 // 20981
M=D // 20982
@Main.main.ret.43 // 20983
D=A // 20984
@CALL // 20985
0;JMP // 20986
(Main.main.ret.43)
@SP // 20987
AM=M+1 // 20988
A=A-1 // 20989
M=0 // 20990
// call Number.new
@6 // 20991
D=A // 20992
@14 // 20993
M=D // 20994
@Number.new // 20995
D=A // 20996
@13 // 20997
M=D // 20998
@Main.main.ret.44 // 20999
D=A // 21000
@CALL // 21001
0;JMP // 21002
(Main.main.ret.44)
@SP // 21003
AM=M+1 // 21004
A=A-1 // 21005
M=-1 // 21006
// call Number.new
@6 // 21007
D=A // 21008
@14 // 21009
M=D // 21010
@Number.new // 21011
D=A // 21012
@13 // 21013
M=D // 21014
@Main.main.ret.45 // 21015
D=A // 21016
@CALL // 21017
0;JMP // 21018
(Main.main.ret.45)
@SP // 21019
AM=M+1 // 21020
A=A-1 // 21021
M=0 // 21022
// call Number.new
@6 // 21023
D=A // 21024
@14 // 21025
M=D // 21026
@Number.new // 21027
D=A // 21028
@13 // 21029
M=D // 21030
@Main.main.ret.46 // 21031
D=A // 21032
@CALL // 21033
0;JMP // 21034
(Main.main.ret.46)
// call Vec3.new
@8 // 21035
D=A // 21036
@14 // 21037
M=D // 21038
@Vec3.new // 21039
D=A // 21040
@13 // 21041
M=D // 21042
@Main.main.ret.47 // 21043
D=A // 21044
@CALL // 21045
0;JMP // 21046
(Main.main.ret.47)
@SP // 21047
AM=M+1 // 21048
A=A-1 // 21049
M=-1 // 21050
// call Number.new
@6 // 21051
D=A // 21052
@14 // 21053
M=D // 21054
@Number.new // 21055
D=A // 21056
@13 // 21057
M=D // 21058
@Main.main.ret.48 // 21059
D=A // 21060
@CALL // 21061
0;JMP // 21062
(Main.main.ret.48)
@SP // 21063
AM=M+1 // 21064
A=A-1 // 21065
M=-1 // 21066
// call Plane.new
@9 // 21067
D=A // 21068
@14 // 21069
M=D // 21070
@Plane.new // 21071
D=A // 21072
@13 // 21073
M=D // 21074
@Main.main.ret.49 // 21075
D=A // 21076
@CALL // 21077
0;JMP // 21078
(Main.main.ret.49)
// call Element.plane
@6 // 21079
D=A // 21080
@14 // 21081
M=D // 21082
@Element.plane // 21083
D=A // 21084
@13 // 21085
M=D // 21086
@Main.main.ret.50 // 21087
D=A // 21088
@CALL // 21089
0;JMP // 21090
(Main.main.ret.50)
@SP // 21091
AM=M-1 // 21092
D=M // 21093
@SP // 21094
AM=M-1 // 21095
A=M // 21096
M=D // 21097

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 5}
//}

@SP // 21098
AM=M+1 // 21099
A=A-1 // 21100
M=0 // 21101
// call Number.new
@6 // 21102
D=A // 21103
@14 // 21104
M=D // 21105
@Number.new // 21106
D=A // 21107
@13 // 21108
M=D // 21109
@Main.main.ret.51 // 21110
D=A // 21111
@CALL // 21112
0;JMP // 21113
(Main.main.ret.51)
@SP // 21114
AM=M+1 // 21115
A=A-1 // 21116
M=-1 // 21117
// call Number.new
@6 // 21118
D=A // 21119
@14 // 21120
M=D // 21121
@Number.new // 21122
D=A // 21123
@13 // 21124
M=D // 21125
@Main.main.ret.52 // 21126
D=A // 21127
@CALL // 21128
0;JMP // 21129
(Main.main.ret.52)
@SP // 21130
AM=M+1 // 21131
A=A-1 // 21132
M=-1 // 21133
// call Number.new
@6 // 21134
D=A // 21135
@14 // 21136
M=D // 21137
@Number.new // 21138
D=A // 21139
@13 // 21140
M=D // 21141
@Main.main.ret.53 // 21142
D=A // 21143
@CALL // 21144
0;JMP // 21145
(Main.main.ret.53)
// call Vec3.new
@8 // 21146
D=A // 21147
@14 // 21148
M=D // 21149
@Vec3.new // 21150
D=A // 21151
@13 // 21152
M=D // 21153
@Main.main.ret.54 // 21154
D=A // 21155
@CALL // 21156
0;JMP // 21157
(Main.main.ret.54)
@LCL // 21158
D=M // 21159
@5 // 21160
A=D+A // 21161
D=A // 21162
@R13 // 21163
M=D // 21164
@SP // 21165
AM=M-1 // 21166
D=M // 21167
@R13 // 21168
A=M // 21169
M=D // 21170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_128 // 21171
D=A // 21172
@13 // 21173
M=D // 21174
@5 // 21175
D=A // 21176
@LCL_PUSH // 21177
0;JMP // 21178
(RETURN_PUSH_LABEL_128)
// call Vec3.do_normalize
@6 // 21179
D=A // 21180
@14 // 21181
M=D // 21182
@Vec3.do_normalize // 21183
D=A // 21184
@13 // 21185
M=D // 21186
@Main.main.ret.55 // 21187
D=A // 21188
@CALL // 21189
0;JMP // 21190
(Main.main.ret.55)
@SP // 21191
M=M-1 // 21192

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 6}
//}

@SP // 21193
AM=M+1 // 21194
A=A-1 // 21195
M=-1 // 21196
// call Number.new
@6 // 21197
D=A // 21198
@14 // 21199
M=D // 21200
@Number.new // 21201
D=A // 21202
@13 // 21203
M=D // 21204
@Main.main.ret.56 // 21205
D=A // 21206
@CALL // 21207
0;JMP // 21208
(Main.main.ret.56)
@SP // 21209
AM=M+1 // 21210
A=A-1 // 21211
M=-1 // 21212
// call Number.new
@6 // 21213
D=A // 21214
@14 // 21215
M=D // 21216
@Number.new // 21217
D=A // 21218
@13 // 21219
M=D // 21220
@Main.main.ret.57 // 21221
D=A // 21222
@CALL // 21223
0;JMP // 21224
(Main.main.ret.57)
@SP // 21225
AM=M+1 // 21226
A=A-1 // 21227
M=0 // 21228
// call Number.new
@6 // 21229
D=A // 21230
@14 // 21231
M=D // 21232
@Number.new // 21233
D=A // 21234
@13 // 21235
M=D // 21236
@Main.main.ret.58 // 21237
D=A // 21238
@CALL // 21239
0;JMP // 21240
(Main.main.ret.58)
// call Vec3.new
@8 // 21241
D=A // 21242
@14 // 21243
M=D // 21244
@Vec3.new // 21245
D=A // 21246
@13 // 21247
M=D // 21248
@Main.main.ret.59 // 21249
D=A // 21250
@CALL // 21251
0;JMP // 21252
(Main.main.ret.59)
@LCL // 21253
D=M // 21254
@6 // 21255
A=D+A // 21256
D=A // 21257
@R13 // 21258
M=D // 21259
@SP // 21260
AM=M-1 // 21261
D=M // 21262
@R13 // 21263
A=M // 21264
M=D // 21265

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_129 // 21266
D=A // 21267
@13 // 21268
M=D // 21269
@6 // 21270
D=A // 21271
@LCL_PUSH // 21272
0;JMP // 21273
(RETURN_PUSH_LABEL_129)
// call Vec3.do_normalize
@6 // 21274
D=A // 21275
@14 // 21276
M=D // 21277
@Vec3.do_normalize // 21278
D=A // 21279
@13 // 21280
M=D // 21281
@Main.main.ret.60 // 21282
D=A // 21283
@CALL // 21284
0;JMP // 21285
(Main.main.ret.60)
@SP // 21286
M=M-1 // 21287

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 2")], call=CallInstruction{Main.getSomething}}, CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 7}
//}

@2 // 21288
D=A // 21289
@SP // 21290
M=D+M // 21291
@2 // 21292
D=A // 21293
@SP // 21294
A=M-1 // 21295
M=D // 21296
A=A-1 // 21297
M=1 // 21298
// call Main.getSomething
@7 // 21299
D=A // 21300
@14 // 21301
M=D // 21302
@Main.getSomething // 21303
D=A // 21304
@13 // 21305
M=D // 21306
@Main.main.ret.61 // 21307
D=A // 21308
@CALL // 21309
0;JMP // 21310
(Main.main.ret.61)
@SP // 21311
AM=M+1 // 21312
A=A-1 // 21313
M=-1 // 21314
// call Number.new
@6 // 21315
D=A // 21316
@14 // 21317
M=D // 21318
@Number.new // 21319
D=A // 21320
@13 // 21321
M=D // 21322
@Main.main.ret.62 // 21323
D=A // 21324
@CALL // 21325
0;JMP // 21326
(Main.main.ret.62)
@SP // 21327
AM=M+1 // 21328
A=A-1 // 21329
M=0 // 21330
// call Number.new
@6 // 21331
D=A // 21332
@14 // 21333
M=D // 21334
@Number.new // 21335
D=A // 21336
@13 // 21337
M=D // 21338
@Main.main.ret.63 // 21339
D=A // 21340
@CALL // 21341
0;JMP // 21342
(Main.main.ret.63)
// call Vec3.new
@8 // 21343
D=A // 21344
@14 // 21345
M=D // 21346
@Vec3.new // 21347
D=A // 21348
@13 // 21349
M=D // 21350
@Main.main.ret.64 // 21351
D=A // 21352
@CALL // 21353
0;JMP // 21354
(Main.main.ret.64)
@LCL // 21355
D=M // 21356
@7 // 21357
A=D+A // 21358
D=A // 21359
@R13 // 21360
M=D // 21361
@SP // 21362
AM=M-1 // 21363
D=M // 21364
@R13 // 21365
A=M // 21366
M=D // 21367

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_130 // 21368
D=A // 21369
@13 // 21370
M=D // 21371
@7 // 21372
D=A // 21373
@LCL_PUSH // 21374
0;JMP // 21375
(RETURN_PUSH_LABEL_130)
// call Vec3.do_normalize
@6 // 21376
D=A // 21377
@14 // 21378
M=D // 21379
@Vec3.do_normalize // 21380
D=A // 21381
@13 // 21382
M=D // 21383
@Main.main.ret.65 // 21384
D=A // 21385
@CALL // 21386
0;JMP // 21387
(Main.main.ret.65)
@SP // 21388
M=M-1 // 21389

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 50")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 21390
D=M // 21391
@4 // 21392
A=D+A // 21393
D=M // 21394
@0 // 21395
D=D+A // 21396
@SP // 21397
AM=M+1 // 21398
A=A-1 // 21399
M=D // 21400
@RETURN_PUSH_LABEL_131 // 21401
D=A // 21402
@13 // 21403
M=D // 21404
@5 // 21405
D=A // 21406
@LCL_PUSH // 21407
0;JMP // 21408
(RETURN_PUSH_LABEL_131)
@2 // 21409
D=A // 21410
@SP // 21411
M=D+M // 21412
@50 // 21413
D=A // 21414
@SP // 21415
A=M-1 // 21416
M=D // 21417
A=A-1 // 21418
M=1 // 21419
// call Main.getSomething
@7 // 21420
D=A // 21421
@14 // 21422
M=D // 21423
@Main.getSomething // 21424
D=A // 21425
@13 // 21426
M=D // 21427
@Main.main.ret.66 // 21428
D=A // 21429
@CALL // 21430
0;JMP // 21431
(Main.main.ret.66)
// call DirectionalLight.new
@7 // 21432
D=A // 21433
@14 // 21434
M=D // 21435
@DirectionalLight.new // 21436
D=A // 21437
@13 // 21438
M=D // 21439
@Main.main.ret.67 // 21440
D=A // 21441
@CALL // 21442
0;JMP // 21443
(Main.main.ret.67)
@SP // 21444
AM=M-1 // 21445
D=M // 21446
@SP // 21447
AM=M-1 // 21448
A=M // 21449
M=D // 21450

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("constant 9"), PushInstruction("constant 10")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 21451
D=M // 21452
@4 // 21453
A=D+A // 21454
D=M // 21455
D=D+1 // 21456
@SP // 21457
AM=M+1 // 21458
A=A-1 // 21459
M=D // 21460
@RETURN_PUSH_LABEL_132 // 21461
D=A // 21462
@13 // 21463
M=D // 21464
@6 // 21465
D=A // 21466
@LCL_PUSH // 21467
0;JMP // 21468
(RETURN_PUSH_LABEL_132)
@9 // 21469
D=A // 21470
@SP // 21471
AM=M+1 // 21472
A=A-1 // 21473
M=D // 21474
@10 // 21475
D=A // 21476
@SP // 21477
AM=M+1 // 21478
A=A-1 // 21479
M=D // 21480
// call Main.getSomething
@7 // 21481
D=A // 21482
@14 // 21483
M=D // 21484
@Main.getSomething // 21485
D=A // 21486
@13 // 21487
M=D // 21488
@Main.main.ret.68 // 21489
D=A // 21490
@CALL // 21491
0;JMP // 21492
(Main.main.ret.68)
// call DirectionalLight.new
@7 // 21493
D=A // 21494
@14 // 21495
M=D // 21496
@DirectionalLight.new // 21497
D=A // 21498
@13 // 21499
M=D // 21500
@Main.main.ret.69 // 21501
D=A // 21502
@CALL // 21503
0;JMP // 21504
(Main.main.ret.69)
@SP // 21505
AM=M-1 // 21506
D=M // 21507
@SP // 21508
AM=M-1 // 21509
A=M // 21510
M=D // 21511

////PushWriter{source=CallGroup{pushes=[PushInstruction("local 7"), CallGroup{pushes=[PushInstruction("constant 3"), PushInstruction("constant 10")], call=CallInstruction{Main.getSomething}}], call=CallInstruction{DirectionalLight.new}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 21512
D=M // 21513
@4 // 21514
A=D+A // 21515
D=M // 21516
@2 // 21517
D=D+A // 21518
@SP // 21519
AM=M+1 // 21520
A=A-1 // 21521
M=D // 21522
@RETURN_PUSH_LABEL_133 // 21523
D=A // 21524
@13 // 21525
M=D // 21526
@7 // 21527
D=A // 21528
@LCL_PUSH // 21529
0;JMP // 21530
(RETURN_PUSH_LABEL_133)
@3 // 21531
D=A // 21532
@SP // 21533
AM=M+1 // 21534
A=A-1 // 21535
M=D // 21536
@10 // 21537
D=A // 21538
@SP // 21539
AM=M+1 // 21540
A=A-1 // 21541
M=D // 21542
// call Main.getSomething
@7 // 21543
D=A // 21544
@14 // 21545
M=D // 21546
@Main.getSomething // 21547
D=A // 21548
@13 // 21549
M=D // 21550
@Main.main.ret.70 // 21551
D=A // 21552
@CALL // 21553
0;JMP // 21554
(Main.main.ret.70)
// call DirectionalLight.new
@7 // 21555
D=A // 21556
@14 // 21557
M=D // 21558
@DirectionalLight.new // 21559
D=A // 21560
@13 // 21561
M=D // 21562
@Main.main.ret.71 // 21563
D=A // 21564
@CALL // 21565
0;JMP // 21566
(Main.main.ret.71)
@SP // 21567
AM=M-1 // 21568
D=M // 21569
@SP // 21570
AM=M-1 // 21571
A=M // 21572
M=D // 21573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 512"), PushInstruction("constant 256"), PushInstruction("local 2"), PushInstruction("local 1"), PushInstruction("local 4"), PushInstruction("local 3")], call=CallInstruction{Scene.new}}
//  pop:  PopInstruction{address=local 0}
//}

@512 // 21574
D=A // 21575
@SP // 21576
AM=M+1 // 21577
A=A-1 // 21578
M=D // 21579
@256 // 21580
D=A // 21581
@SP // 21582
AM=M+1 // 21583
A=A-1 // 21584
M=D // 21585
@LCL // 21586
A=M+1 // 21587
A=A+1 // 21588
D=M // 21589
@SP // 21590
AM=M+1 // 21591
A=A-1 // 21592
M=D // 21593
@LCL // 21594
A=M+1 // 21595
D=M // 21596
@SP // 21597
AM=M+1 // 21598
A=A-1 // 21599
M=D // 21600
@RETURN_PUSH_LABEL_134 // 21601
D=A // 21602
@13 // 21603
M=D // 21604
@4 // 21605
D=A // 21606
@LCL_PUSH // 21607
0;JMP // 21608
(RETURN_PUSH_LABEL_134)
@LCL // 21609
A=M+1 // 21610
A=A+1 // 21611
A=A+1 // 21612
D=M // 21613
@SP // 21614
AM=M+1 // 21615
A=A-1 // 21616
M=D // 21617
// call Scene.new
@11 // 21618
D=A // 21619
@14 // 21620
M=D // 21621
@Scene.new // 21622
D=A // 21623
@13 // 21624
M=D // 21625
@Main.main.ret.72 // 21626
D=A // 21627
@CALL // 21628
0;JMP // 21629
(Main.main.ret.72)
@SP // 21630
AM=M-1 // 21631
D=M // 21632
@LCL // 21633
A=M // 21634
M=D // 21635

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Main.render}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21636
A=M // 21637
D=M // 21638
@SP // 21639
AM=M+1 // 21640
A=A-1 // 21641
M=D // 21642
// call Main.render
@6 // 21643
D=A // 21644
@14 // 21645
M=D // 21646
@Main.render // 21647
D=A // 21648
@13 // 21649
M=D // 21650
@Main.main.ret.73 // 21651
D=A // 21652
@CALL // 21653
0;JMP // 21654
(Main.main.ret.73)
@SP // 21655
M=M-1 // 21656

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Scene.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21657
A=M // 21658
D=M // 21659
@SP // 21660
AM=M+1 // 21661
A=A-1 // 21662
M=D // 21663
// call Scene.dispose
@6 // 21664
D=A // 21665
@14 // 21666
M=D // 21667
@Scene.dispose // 21668
D=A // 21669
@13 // 21670
M=D // 21671
@Main.main.ret.74 // 21672
D=A // 21673
@CALL // 21674
0;JMP // 21675
(Main.main.ret.74)
@SP // 21676
M=M-1 // 21677

////PushInstruction("constant 0")
@SP // 21678
AM=M+1 // 21679
A=A-1 // 21680
M=0 // 21681
@RETURN // 21682
0;JMP // 21683

////FunctionInstruction{functionName='Plane.intersect', numLocals=3, funcMapping={Plane.initialize=16, Plane.new=1, Plane.dispose=4, Plane.color=29}}
// function Plane.intersect with 3
(Plane.intersect)
@3 // 21684
D=A // 21685
@SP // 21686
AM=D+M // 21687
A=A-1 // 21688
M=0 // 21689
A=A-1 // 21690
M=0 // 21691
A=A-1 // 21692
M=0 // 21693

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 21694
A=M // 21695
D=M // 21696
@3 // 21697
M=D // 21698

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 21699
A=M+1 // 21700
D=M // 21701
@SP // 21702
AM=M+1 // 21703
A=A-1 // 21704
M=D // 21705
@ARG // 21706
A=M+1 // 21707
D=M // 21708
@SP // 21709
AM=M+1 // 21710
A=A-1 // 21711
M=D // 21712
// call Ray.getDirection
@6 // 21713
D=A // 21714
@14 // 21715
M=D // 21716
@Ray.getDirection // 21717
D=A // 21718
@13 // 21719
M=D // 21720
@Plane.intersect.ret.0 // 21721
D=A // 21722
@CALL // 21723
0;JMP // 21724
(Plane.intersect.ret.0)
// call Vec3.dot
@7 // 21725
D=A // 21726
@14 // 21727
M=D // 21728
@Vec3.dot // 21729
D=A // 21730
@13 // 21731
M=D // 21732
@Plane.intersect.ret.1 // 21733
D=A // 21734
@CALL // 21735
0;JMP // 21736
(Plane.intersect.ret.1)
@SP // 21737
AM=M-1 // 21738
D=M // 21739
@LCL // 21740
A=M // 21741
M=D // 21742

////ConditionalGroup{push=UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.is_positive}},
//NOT), ifGoto=IfGotoInstruction{label='Plane.intersect$IF_TRUE1}}
@LCL // 21743
A=M // 21744
D=M // 21745
@SP // 21746
AM=M+1 // 21747
A=A-1 // 21748
M=D // 21749
// call Number.is_positive
@6 // 21750
D=A // 21751
@14 // 21752
M=D // 21753
@Number.is_positive // 21754
D=A // 21755
@13 // 21756
M=D // 21757
@Plane.intersect.ret.2 // 21758
D=A // 21759
@CALL // 21760
0;JMP // 21761
(Plane.intersect.ret.2)
@SP // 21762
AM=M-1 // 21763
D=M // 21764
D=!D // 21765
@Plane.intersect$IF_TRUE1 // 21766
D;JNE // 21767

////GotoInstruction{label='Plane.intersect$IF_END1}
// goto Plane.intersect$IF_END1
@Plane.intersect$IF_END1 // 21768
0;JMP // 21769

////LabelInstruction{label='Plane.intersect$IF_TRUE1}
// label Plane.intersect$IF_TRUE1
(Plane.intersect$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21770
A=M // 21771
D=M // 21772
@SP // 21773
AM=M+1 // 21774
A=A-1 // 21775
M=D // 21776
// call Number.dispose
@6 // 21777
D=A // 21778
@14 // 21779
M=D // 21780
@Number.dispose // 21781
D=A // 21782
@13 // 21783
M=D // 21784
@Plane.intersect.ret.3 // 21785
D=A // 21786
@CALL // 21787
0;JMP // 21788
(Plane.intersect.ret.3)
@SP // 21789
M=M-1 // 21790

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 21791
AM=M+1 // 21792
A=A-1 // 21793
M=-1 // 21794
// call Number.new
@6 // 21795
D=A // 21796
@14 // 21797
M=D // 21798
@Number.new // 21799
D=A // 21800
@13 // 21801
M=D // 21802
@Plane.intersect.ret.4 // 21803
D=A // 21804
@CALL // 21805
0;JMP // 21806
(Plane.intersect.ret.4)
@RETURN // 21807
0;JMP // 21808

////LabelInstruction{label='Plane.intersect$IF_END1}
// label Plane.intersect$IF_END1
(Plane.intersect$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 21809
A=M // 21810
D=M // 21811
@SP // 21812
AM=M+1 // 21813
A=A-1 // 21814
M=D // 21815
// call Vec3.clone
@6 // 21816
D=A // 21817
@14 // 21818
M=D // 21819
@Vec3.clone // 21820
D=A // 21821
@13 // 21822
M=D // 21823
@Plane.intersect.ret.5 // 21824
D=A // 21825
@CALL // 21826
0;JMP // 21827
(Plane.intersect.ret.5)
@SP // 21828
AM=M-1 // 21829
D=M // 21830
@LCL // 21831
A=M+1 // 21832
M=D // 21833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getOrigin}}], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21834
A=M+1 // 21835
D=M // 21836
@SP // 21837
AM=M+1 // 21838
A=A-1 // 21839
M=D // 21840
@ARG // 21841
A=M+1 // 21842
D=M // 21843
@SP // 21844
AM=M+1 // 21845
A=A-1 // 21846
M=D // 21847
// call Ray.getOrigin
@6 // 21848
D=A // 21849
@14 // 21850
M=D // 21851
@Ray.getOrigin // 21852
D=A // 21853
@13 // 21854
M=D // 21855
@Plane.intersect.ret.6 // 21856
D=A // 21857
@CALL // 21858
0;JMP // 21859
(Plane.intersect.ret.6)
// call Vec3.do_sub
@7 // 21860
D=A // 21861
@14 // 21862
M=D // 21863
@Vec3.do_sub // 21864
D=A // 21865
@13 // 21866
M=D // 21867
@Plane.intersect.ret.7 // 21868
D=A // 21869
@CALL // 21870
0;JMP // 21871
(Plane.intersect.ret.7)
@SP // 21872
M=M-1 // 21873

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 1")], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 21874
A=M+1 // 21875
D=M // 21876
@SP // 21877
AM=M+1 // 21878
A=A-1 // 21879
M=D // 21880
@THIS // 21881
A=M+1 // 21882
D=M // 21883
@SP // 21884
AM=M+1 // 21885
A=A-1 // 21886
M=D // 21887
// call Vec3.dot
@7 // 21888
D=A // 21889
@14 // 21890
M=D // 21891
@Vec3.dot // 21892
D=A // 21893
@13 // 21894
M=D // 21895
@Plane.intersect.ret.8 // 21896
D=A // 21897
@CALL // 21898
0;JMP // 21899
(Plane.intersect.ret.8)
@SP // 21900
AM=M-1 // 21901
D=M // 21902
@LCL // 21903
A=M+1 // 21904
A=A+1 // 21905
M=D // 21906

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21907
A=M+1 // 21908
A=A+1 // 21909
D=M // 21910
@SP // 21911
AM=M+1 // 21912
A=A-1 // 21913
M=D // 21914
@LCL // 21915
A=M // 21916
D=M // 21917
@SP // 21918
AM=M+1 // 21919
A=A-1 // 21920
M=D // 21921
// call Number.do_div
@7 // 21922
D=A // 21923
@14 // 21924
M=D // 21925
@Number.do_div // 21926
D=A // 21927
@13 // 21928
M=D // 21929
@Plane.intersect.ret.9 // 21930
D=A // 21931
@CALL // 21932
0;JMP // 21933
(Plane.intersect.ret.9)
@SP // 21934
M=M-1 // 21935

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21936
A=M // 21937
D=M // 21938
@SP // 21939
AM=M+1 // 21940
A=A-1 // 21941
M=D // 21942
// call Number.dispose
@6 // 21943
D=A // 21944
@14 // 21945
M=D // 21946
@Number.dispose // 21947
D=A // 21948
@13 // 21949
M=D // 21950
@Plane.intersect.ret.10 // 21951
D=A // 21952
@CALL // 21953
0;JMP // 21954
(Plane.intersect.ret.10)
@SP // 21955
M=M-1 // 21956

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 21957
A=M+1 // 21958
D=M // 21959
@SP // 21960
AM=M+1 // 21961
A=A-1 // 21962
M=D // 21963
// call Vec3.dispose
@6 // 21964
D=A // 21965
@14 // 21966
M=D // 21967
@Vec3.dispose // 21968
D=A // 21969
@13 // 21970
M=D // 21971
@Plane.intersect.ret.11 // 21972
D=A // 21973
@CALL // 21974
0;JMP // 21975
(Plane.intersect.ret.11)
@SP // 21976
M=M-1 // 21977

////ConditionalGroup{push=UnaryPushGroup(CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.is_negative}},
//NOT), ifGoto=IfGotoInstruction{label='Plane.intersect$IF_TRUE2}}
@LCL // 21978
A=M+1 // 21979
A=A+1 // 21980
D=M // 21981
@SP // 21982
AM=M+1 // 21983
A=A-1 // 21984
M=D // 21985
// call Number.is_negative
@6 // 21986
D=A // 21987
@14 // 21988
M=D // 21989
@Number.is_negative // 21990
D=A // 21991
@13 // 21992
M=D // 21993
@Plane.intersect.ret.12 // 21994
D=A // 21995
@CALL // 21996
0;JMP // 21997
(Plane.intersect.ret.12)
@SP // 21998
AM=M-1 // 21999
D=M // 22000
D=!D // 22001
@Plane.intersect$IF_TRUE2 // 22002
D;JNE // 22003

////GotoInstruction{label='Plane.intersect$IF_FALSE2}
// goto Plane.intersect$IF_FALSE2
@Plane.intersect$IF_FALSE2 // 22004
0;JMP // 22005

////LabelInstruction{label='Plane.intersect$IF_TRUE2}
// label Plane.intersect$IF_TRUE2
(Plane.intersect$IF_TRUE2)

////PushInstruction("local 2")
@LCL // 22006
A=M+1 // 22007
A=A+1 // 22008
D=M // 22009
@SP // 22010
AM=M+1 // 22011
A=A-1 // 22012
M=D // 22013
@RETURN // 22014
0;JMP // 22015

////GotoInstruction{label='Plane.intersect$IF_END2}
// goto Plane.intersect$IF_END2
@Plane.intersect$IF_END2 // 22016
0;JMP // 22017

////LabelInstruction{label='Plane.intersect$IF_FALSE2}
// label Plane.intersect$IF_FALSE2
(Plane.intersect$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22018
A=M+1 // 22019
A=A+1 // 22020
D=M // 22021
@SP // 22022
AM=M+1 // 22023
A=A-1 // 22024
M=D // 22025
// call Number.dispose
@6 // 22026
D=A // 22027
@14 // 22028
M=D // 22029
@Number.dispose // 22030
D=A // 22031
@13 // 22032
M=D // 22033
@Plane.intersect.ret.13 // 22034
D=A // 22035
@CALL // 22036
0;JMP // 22037
(Plane.intersect.ret.13)
@SP // 22038
M=M-1 // 22039

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 22040
AM=M+1 // 22041
A=A-1 // 22042
M=-1 // 22043
// call Number.new
@6 // 22044
D=A // 22045
@14 // 22046
M=D // 22047
@Number.new // 22048
D=A // 22049
@13 // 22050
M=D // 22051
@Plane.intersect.ret.14 // 22052
D=A // 22053
@CALL // 22054
0;JMP // 22055
(Plane.intersect.ret.14)
@RETURN // 22056
0;JMP // 22057

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

@9 // 22058
D=A // 22059
@SP // 22060
AM=M+1 // 22061
A=A-1 // 22062
M=D // 22063
// call Memory.alloc
@6 // 22064
D=A // 22065
@14 // 22066
M=D // 22067
@Memory.alloc // 22068
D=A // 22069
@13 // 22070
M=D // 22071
@Scene.new.ret.0 // 22072
D=A // 22073
@CALL // 22074
0;JMP // 22075
(Scene.new.ret.0)
@SP // 22076
AM=M-1 // 22077
D=M // 22078
@3 // 22079
M=D // 22080

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 22081
A=M // 22082
D=M // 22083
@THIS // 22084
A=M // 22085
M=D // 22086

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 22087
A=M+1 // 22088
D=M // 22089
@THIS // 22090
A=M+1 // 22091
M=D // 22092

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=this 5}
//}

@ARG // 22093
A=M+1 // 22094
A=A+1 // 22095
D=M // 22096
@SP // 22097
AM=M+1 // 22098
A=A-1 // 22099
M=D // 22100
@THIS // 22101
D=M // 22102
@5 // 22103
A=D+A // 22104
D=A // 22105
@R13 // 22106
M=D // 22107
@SP // 22108
AM=M-1 // 22109
D=M // 22110
@R13 // 22111
A=M // 22112
M=D // 22113

////PushPopPair {
//  push: PushInstruction("argument 3")
//  pop:  PopInstruction{address=this 6}
//}

@ARG // 22114
A=M+1 // 22115
A=A+1 // 22116
A=A+1 // 22117
D=M // 22118
@SP // 22119
AM=M+1 // 22120
A=A-1 // 22121
M=D // 22122
@THIS // 22123
D=M // 22124
@6 // 22125
A=D+A // 22126
D=A // 22127
@R13 // 22128
M=D // 22129
@SP // 22130
AM=M-1 // 22131
D=M // 22132
@R13 // 22133
A=M // 22134
M=D // 22135

////PushPopPair {
//  push: PushInstruction("argument 4")
//  pop:  PopInstruction{address=this 7}
//}

@RETURN_PUSH_LABEL_135 // 22136
D=A // 22137
@13 // 22138
M=D // 22139
@4 // 22140
D=A // 22141
@ARG_PUSH // 22142
0;JMP // 22143
(RETURN_PUSH_LABEL_135)
@THIS // 22144
D=M // 22145
@7 // 22146
A=D+A // 22147
D=A // 22148
@R13 // 22149
M=D // 22150
@SP // 22151
AM=M-1 // 22152
D=M // 22153
@R13 // 22154
A=M // 22155
M=D // 22156

////PushPopPair {
//  push: PushInstruction("argument 5")
//  pop:  PopInstruction{address=this 8}
//}

@RETURN_PUSH_LABEL_136 // 22157
D=A // 22158
@13 // 22159
M=D // 22160
@5 // 22161
D=A // 22162
@ARG_PUSH // 22163
0;JMP // 22164
(RETURN_PUSH_LABEL_136)
@THIS // 22165
D=M // 22166
@8 // 22167
A=D+A // 22168
D=A // 22169
@R13 // 22170
M=D // 22171
@SP // 22172
AM=M-1 // 22173
D=M // 22174
@R13 // 22175
A=M // 22176
M=D // 22177

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=this 3}
//}

@THIS // 22178
A=M // 22179
D=M // 22180
@SP // 22181
AM=M+1 // 22182
A=A-1 // 22183
M=D // 22184
// call Number.new
@6 // 22185
D=A // 22186
@14 // 22187
M=D // 22188
@Number.new // 22189
D=A // 22190
@13 // 22191
M=D // 22192
@Scene.new.ret.1 // 22193
D=A // 22194
@CALL // 22195
0;JMP // 22196
(Scene.new.ret.1)
@SP // 22197
AM=M-1 // 22198
D=M // 22199
@THIS // 22200
A=M+1 // 22201
A=A+1 // 22202
A=A+1 // 22203
M=D // 22204

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=this 4}
//}

@THIS // 22205
A=M+1 // 22206
D=M // 22207
@SP // 22208
AM=M+1 // 22209
A=A-1 // 22210
M=D // 22211
// call Number.new
@6 // 22212
D=A // 22213
@14 // 22214
M=D // 22215
@Number.new // 22216
D=A // 22217
@13 // 22218
M=D // 22219
@Scene.new.ret.2 // 22220
D=A // 22221
@CALL // 22222
0;JMP // 22223
(Scene.new.ret.2)
@THIS // 22224
D=M // 22225
@4 // 22226
A=D+A // 22227
D=A // 22228
@R13 // 22229
M=D // 22230
@SP // 22231
AM=M-1 // 22232
D=M // 22233
@R13 // 22234
A=M // 22235
M=D // 22236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=this 2}
//}

@THIS // 22237
A=M+1 // 22238
A=A+1 // 22239
A=A+1 // 22240
D=M // 22241
@SP // 22242
AM=M+1 // 22243
A=A-1 // 22244
M=D // 22245
// call Number.clone
@6 // 22246
D=A // 22247
@14 // 22248
M=D // 22249
@Number.clone // 22250
D=A // 22251
@13 // 22252
M=D // 22253
@Scene.new.ret.3 // 22254
D=A // 22255
@CALL // 22256
0;JMP // 22257
(Scene.new.ret.3)
@SP // 22258
AM=M-1 // 22259
D=M // 22260
@THIS // 22261
A=M+1 // 22262
A=A+1 // 22263
M=D // 22264

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("this 4")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22265
A=M+1 // 22266
A=A+1 // 22267
D=M // 22268
@SP // 22269
AM=M+1 // 22270
A=A-1 // 22271
M=D // 22272
@RETURN_PUSH_LABEL_137 // 22273
D=A // 22274
@13 // 22275
M=D // 22276
@4 // 22277
D=A // 22278
@THIS_PUSH // 22279
0;JMP // 22280
(RETURN_PUSH_LABEL_137)
// call Number.do_div
@7 // 22281
D=A // 22282
@14 // 22283
M=D // 22284
@Number.do_div // 22285
D=A // 22286
@13 // 22287
M=D // 22288
@Scene.new.ret.4 // 22289
D=A // 22290
@CALL // 22291
0;JMP // 22292
(Scene.new.ret.4)
@SP // 22293
M=M-1 // 22294

////PushInstruction("pointer 0")
@3 // 22295
D=M // 22296
@SP // 22297
AM=M+1 // 22298
A=A-1 // 22299
M=D // 22300
@RETURN // 22301
0;JMP // 22302

////FunctionInstruction{functionName='Scene.create_prime_ray', numLocals=3, funcMapping={Scene.new=5}}
// function Scene.create_prime_ray with 3
(Scene.create_prime_ray)
@3 // 22303
D=A // 22304
@SP // 22305
AM=D+M // 22306
A=A-1 // 22307
M=0 // 22308
A=A-1 // 22309
M=0 // 22310
A=A-1 // 22311
M=0 // 22312

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 22313
A=M // 22314
D=M // 22315
@3 // 22316
M=D // 22317

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 22318
A=M+1 // 22319
D=M // 22320
@SP // 22321
AM=M+1 // 22322
A=A-1 // 22323
M=D // 22324
// call Number.new
@6 // 22325
D=A // 22326
@14 // 22327
M=D // 22328
@Number.new // 22329
D=A // 22330
@13 // 22331
M=D // 22332
@Scene.create_prime_ray.ret.0 // 22333
D=A // 22334
@CALL // 22335
0;JMP // 22336
(Scene.create_prime_ray.ret.0)
@SP // 22337
AM=M-1 // 22338
D=M // 22339
@LCL // 22340
A=M // 22341
M=D // 22342

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22343
A=M // 22344
D=M // 22345
@SP // 22346
AM=M+1 // 22347
A=A-1 // 22348
M=D // 22349
@RETURN_PUSH_LABEL_138 // 22350
D=A // 22351
@13 // 22352
M=D // 22353
@5 // 22354
D=A // 22355
@ARG_PUSH // 22356
0;JMP // 22357
(RETURN_PUSH_LABEL_138)
// call Number.do_add
@7 // 22358
D=A // 22359
@14 // 22360
M=D // 22361
@Number.do_add // 22362
D=A // 22363
@13 // 22364
M=D // 22365
@Scene.create_prime_ray.ret.1 // 22366
D=A // 22367
@CALL // 22368
0;JMP // 22369
(Scene.create_prime_ray.ret.1)
@SP // 22370
M=M-1 // 22371

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 3")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22372
A=M // 22373
D=M // 22374
@SP // 22375
AM=M+1 // 22376
A=A-1 // 22377
M=D // 22378
@THIS // 22379
A=M+1 // 22380
A=A+1 // 22381
A=A+1 // 22382
D=M // 22383
@SP // 22384
AM=M+1 // 22385
A=A-1 // 22386
M=D // 22387
// call Number.do_div
@7 // 22388
D=A // 22389
@14 // 22390
M=D // 22391
@Number.do_div // 22392
D=A // 22393
@13 // 22394
M=D // 22395
@Scene.create_prime_ray.ret.2 // 22396
D=A // 22397
@CALL // 22398
0;JMP // 22399
(Scene.create_prime_ray.ret.2)
@SP // 22400
M=M-1 // 22401

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22402
A=M // 22403
D=M // 22404
@SP // 22405
AM=M+1 // 22406
A=A-1 // 22407
M=D // 22408
@RETURN_PUSH_LABEL_139 // 22409
D=A // 22410
@13 // 22411
M=D // 22412
@4 // 22413
D=A // 22414
@ARG_PUSH // 22415
0;JMP // 22416
(RETURN_PUSH_LABEL_139)
// call Number.do_mul
@7 // 22417
D=A // 22418
@14 // 22419
M=D // 22420
@Number.do_mul // 22421
D=A // 22422
@13 // 22423
M=D // 22424
@Scene.create_prime_ray.ret.3 // 22425
D=A // 22426
@CALL // 22427
0;JMP // 22428
(Scene.create_prime_ray.ret.3)
@SP // 22429
M=M-1 // 22430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 3")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22431
A=M // 22432
D=M // 22433
@SP // 22434
AM=M+1 // 22435
A=A-1 // 22436
M=D // 22437
@ARG // 22438
A=M+1 // 22439
A=A+1 // 22440
A=A+1 // 22441
D=M // 22442
@SP // 22443
AM=M+1 // 22444
A=A-1 // 22445
M=D // 22446
// call Number.do_sub
@7 // 22447
D=A // 22448
@14 // 22449
M=D // 22450
@Number.do_sub // 22451
D=A // 22452
@13 // 22453
M=D // 22454
@Scene.create_prime_ray.ret.4 // 22455
D=A // 22456
@CALL // 22457
0;JMP // 22458
(Scene.create_prime_ray.ret.4)
@SP // 22459
M=M-1 // 22460

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 2")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22461
A=M // 22462
D=M // 22463
@SP // 22464
AM=M+1 // 22465
A=A-1 // 22466
M=D // 22467
@THIS // 22468
A=M+1 // 22469
A=A+1 // 22470
D=M // 22471
@SP // 22472
AM=M+1 // 22473
A=A-1 // 22474
M=D // 22475
// call Number.do_mul
@7 // 22476
D=A // 22477
@14 // 22478
M=D // 22479
@Number.do_mul // 22480
D=A // 22481
@13 // 22482
M=D // 22483
@Scene.create_prime_ray.ret.5 // 22484
D=A // 22485
@CALL // 22486
0;JMP // 22487
(Scene.create_prime_ray.ret.5)
@SP // 22488
M=M-1 // 22489

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 22490
A=M+1 // 22491
A=A+1 // 22492
D=M // 22493
@SP // 22494
AM=M+1 // 22495
A=A-1 // 22496
M=D // 22497
// call Number.new
@6 // 22498
D=A // 22499
@14 // 22500
M=D // 22501
@Number.new // 22502
D=A // 22503
@13 // 22504
M=D // 22505
@Scene.create_prime_ray.ret.6 // 22506
D=A // 22507
@CALL // 22508
0;JMP // 22509
(Scene.create_prime_ray.ret.6)
@SP // 22510
AM=M-1 // 22511
D=M // 22512
@LCL // 22513
A=M+1 // 22514
M=D // 22515

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22516
A=M+1 // 22517
D=M // 22518
@SP // 22519
AM=M+1 // 22520
A=A-1 // 22521
M=D // 22522
@RETURN_PUSH_LABEL_140 // 22523
D=A // 22524
@13 // 22525
M=D // 22526
@5 // 22527
D=A // 22528
@ARG_PUSH // 22529
0;JMP // 22530
(RETURN_PUSH_LABEL_140)
// call Number.do_add
@7 // 22531
D=A // 22532
@14 // 22533
M=D // 22534
@Number.do_add // 22535
D=A // 22536
@13 // 22537
M=D // 22538
@Scene.create_prime_ray.ret.7 // 22539
D=A // 22540
@CALL // 22541
0;JMP // 22542
(Scene.create_prime_ray.ret.7)
@SP // 22543
M=M-1 // 22544

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 4")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22545
A=M+1 // 22546
D=M // 22547
@SP // 22548
AM=M+1 // 22549
A=A-1 // 22550
M=D // 22551
@RETURN_PUSH_LABEL_141 // 22552
D=A // 22553
@13 // 22554
M=D // 22555
@4 // 22556
D=A // 22557
@THIS_PUSH // 22558
0;JMP // 22559
(RETURN_PUSH_LABEL_141)
// call Number.do_div
@7 // 22560
D=A // 22561
@14 // 22562
M=D // 22563
@Number.do_div // 22564
D=A // 22565
@13 // 22566
M=D // 22567
@Scene.create_prime_ray.ret.8 // 22568
D=A // 22569
@CALL // 22570
0;JMP // 22571
(Scene.create_prime_ray.ret.8)
@SP // 22572
M=M-1 // 22573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22574
A=M+1 // 22575
D=M // 22576
@SP // 22577
AM=M+1 // 22578
A=A-1 // 22579
M=D // 22580
// call Number.do_neg
@6 // 22581
D=A // 22582
@14 // 22583
M=D // 22584
@Number.do_neg // 22585
D=A // 22586
@13 // 22587
M=D // 22588
@Scene.create_prime_ray.ret.9 // 22589
D=A // 22590
@CALL // 22591
0;JMP // 22592
(Scene.create_prime_ray.ret.9)
@SP // 22593
M=M-1 // 22594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 4")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22595
A=M+1 // 22596
D=M // 22597
@SP // 22598
AM=M+1 // 22599
A=A-1 // 22600
M=D // 22601
@RETURN_PUSH_LABEL_142 // 22602
D=A // 22603
@13 // 22604
M=D // 22605
@4 // 22606
D=A // 22607
@ARG_PUSH // 22608
0;JMP // 22609
(RETURN_PUSH_LABEL_142)
// call Number.do_mul
@7 // 22610
D=A // 22611
@14 // 22612
M=D // 22613
@Number.do_mul // 22614
D=A // 22615
@13 // 22616
M=D // 22617
@Scene.create_prime_ray.ret.10 // 22618
D=A // 22619
@CALL // 22620
0;JMP // 22621
(Scene.create_prime_ray.ret.10)
@SP // 22622
M=M-1 // 22623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 3")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22624
A=M+1 // 22625
D=M // 22626
@SP // 22627
AM=M+1 // 22628
A=A-1 // 22629
M=D // 22630
@ARG // 22631
A=M+1 // 22632
A=A+1 // 22633
A=A+1 // 22634
D=M // 22635
@SP // 22636
AM=M+1 // 22637
A=A-1 // 22638
M=D // 22639
// call Number.do_add
@7 // 22640
D=A // 22641
@14 // 22642
M=D // 22643
@Number.do_add // 22644
D=A // 22645
@13 // 22646
M=D // 22647
@Scene.create_prime_ray.ret.11 // 22648
D=A // 22649
@CALL // 22650
0;JMP // 22651
(Scene.create_prime_ray.ret.11)
@SP // 22652
M=M-1 // 22653

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1"), CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 22654
A=M // 22655
D=M // 22656
@SP // 22657
AM=M+1 // 22658
A=A-1 // 22659
M=D // 22660
@LCL // 22661
A=M+1 // 22662
D=M // 22663
@SP // 22664
AM=M+1 // 22665
A=A-1 // 22666
M=D // 22667
@SP // 22668
AM=M+1 // 22669
A=A-1 // 22670
M=-1 // 22671
// call Number.new
@6 // 22672
D=A // 22673
@14 // 22674
M=D // 22675
@Number.new // 22676
D=A // 22677
@13 // 22678
M=D // 22679
@Scene.create_prime_ray.ret.12 // 22680
D=A // 22681
@CALL // 22682
0;JMP // 22683
(Scene.create_prime_ray.ret.12)
// call Vec3.new
@8 // 22684
D=A // 22685
@14 // 22686
M=D // 22687
@Vec3.new // 22688
D=A // 22689
@13 // 22690
M=D // 22691
@Scene.create_prime_ray.ret.13 // 22692
D=A // 22693
@CALL // 22694
0;JMP // 22695
(Scene.create_prime_ray.ret.13)
@SP // 22696
AM=M-1 // 22697
D=M // 22698
@LCL // 22699
A=M+1 // 22700
A=A+1 // 22701
M=D // 22702

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 22703
A=M+1 // 22704
A=A+1 // 22705
D=M // 22706
@SP // 22707
AM=M+1 // 22708
A=A-1 // 22709
M=D // 22710
// call Vec3.do_normalize
@6 // 22711
D=A // 22712
@14 // 22713
M=D // 22714
@Vec3.do_normalize // 22715
D=A // 22716
@13 // 22717
M=D // 22718
@Scene.create_prime_ray.ret.14 // 22719
D=A // 22720
@CALL // 22721
0;JMP // 22722
(Scene.create_prime_ray.ret.14)
@SP // 22723
M=M-1 // 22724

////CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}, CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}], call=CallInstruction{Vec3.new}}, PushInstruction("local 2")], call=CallInstruction{Ray.new}}
@SP // 22725
AM=M+1 // 22726
A=A-1 // 22727
M=0 // 22728
// call Number.new
@6 // 22729
D=A // 22730
@14 // 22731
M=D // 22732
@Number.new // 22733
D=A // 22734
@13 // 22735
M=D // 22736
@Scene.create_prime_ray.ret.15 // 22737
D=A // 22738
@CALL // 22739
0;JMP // 22740
(Scene.create_prime_ray.ret.15)
@SP // 22741
AM=M+1 // 22742
A=A-1 // 22743
M=0 // 22744
// call Number.new
@6 // 22745
D=A // 22746
@14 // 22747
M=D // 22748
@Number.new // 22749
D=A // 22750
@13 // 22751
M=D // 22752
@Scene.create_prime_ray.ret.16 // 22753
D=A // 22754
@CALL // 22755
0;JMP // 22756
(Scene.create_prime_ray.ret.16)
@SP // 22757
AM=M+1 // 22758
A=A-1 // 22759
M=0 // 22760
// call Number.new
@6 // 22761
D=A // 22762
@14 // 22763
M=D // 22764
@Number.new // 22765
D=A // 22766
@13 // 22767
M=D // 22768
@Scene.create_prime_ray.ret.17 // 22769
D=A // 22770
@CALL // 22771
0;JMP // 22772
(Scene.create_prime_ray.ret.17)
// call Vec3.new
@8 // 22773
D=A // 22774
@14 // 22775
M=D // 22776
@Vec3.new // 22777
D=A // 22778
@13 // 22779
M=D // 22780
@Scene.create_prime_ray.ret.18 // 22781
D=A // 22782
@CALL // 22783
0;JMP // 22784
(Scene.create_prime_ray.ret.18)
@LCL // 22785
A=M+1 // 22786
A=A+1 // 22787
D=M // 22788
@SP // 22789
AM=M+1 // 22790
A=A-1 // 22791
M=D // 22792
// call Ray.new
@7 // 22793
D=A // 22794
@14 // 22795
M=D // 22796
@Ray.new // 22797
D=A // 22798
@13 // 22799
M=D // 22800
@Scene.create_prime_ray.ret.19 // 22801
D=A // 22802
@CALL // 22803
0;JMP // 22804
(Scene.create_prime_ray.ret.19)
@RETURN // 22805
0;JMP // 22806

////FunctionInstruction{functionName='Sphere.dispose', numLocals=0, funcMapping={Sphere.new=1}}
// function Sphere.dispose with 0
(Sphere.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 22807
A=M // 22808
D=M // 22809
@3 // 22810
M=D // 22811

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22812
A=M // 22813
D=M // 22814
@SP // 22815
AM=M+1 // 22816
A=A-1 // 22817
M=D // 22818
// call Vec3.dispose
@6 // 22819
D=A // 22820
@14 // 22821
M=D // 22822
@Vec3.dispose // 22823
D=A // 22824
@13 // 22825
M=D // 22826
@Sphere.dispose.ret.0 // 22827
D=A // 22828
@CALL // 22829
0;JMP // 22830
(Sphere.dispose.ret.0)
@SP // 22831
M=M-1 // 22832

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22833
A=M+1 // 22834
D=M // 22835
@SP // 22836
AM=M+1 // 22837
A=A-1 // 22838
M=D // 22839
// call Number.dispose
@6 // 22840
D=A // 22841
@14 // 22842
M=D // 22843
@Number.dispose // 22844
D=A // 22845
@13 // 22846
M=D // 22847
@Sphere.dispose.ret.1 // 22848
D=A // 22849
@CALL // 22850
0;JMP // 22851
(Sphere.dispose.ret.1)
@SP // 22852
M=M-1 // 22853

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 22854
A=M+1 // 22855
A=A+1 // 22856
D=M // 22857
@SP // 22858
AM=M+1 // 22859
A=A-1 // 22860
M=D // 22861
// call Number.dispose
@6 // 22862
D=A // 22863
@14 // 22864
M=D // 22865
@Number.dispose // 22866
D=A // 22867
@13 // 22868
M=D // 22869
@Sphere.dispose.ret.2 // 22870
D=A // 22871
@CALL // 22872
0;JMP // 22873
(Sphere.dispose.ret.2)
@SP // 22874
M=M-1 // 22875

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 22876
D=M // 22877
@SP // 22878
AM=M+1 // 22879
A=A-1 // 22880
M=D // 22881
// call Memory.deAlloc
@6 // 22882
D=A // 22883
@14 // 22884
M=D // 22885
@Memory.deAlloc // 22886
D=A // 22887
@13 // 22888
M=D // 22889
@Sphere.dispose.ret.3 // 22890
D=A // 22891
@CALL // 22892
0;JMP // 22893
(Sphere.dispose.ret.3)
@SP // 22894
M=M-1 // 22895

////PushInstruction("constant 0")
@SP // 22896
AM=M+1 // 22897
A=A-1 // 22898
M=0 // 22899
@RETURN // 22900
0;JMP // 22901

////FunctionInstruction{functionName='Int32.do_add', numLocals=3, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_add with 3
(Int32.do_add)
@3 // 22902
D=A // 22903
@SP // 22904
AM=D+M // 22905
A=A-1 // 22906
M=0 // 22907
A=A-1 // 22908
M=0 // 22909
A=A-1 // 22910
M=0 // 22911

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 22912
A=M // 22913
D=M // 22914
@3 // 22915
M=D // 22916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 22917
A=M+1 // 22918
D=M // 22919
@SP // 22920
AM=M+1 // 22921
A=A-1 // 22922
M=D // 22923
// call Int32.getParts
@6 // 22924
D=A // 22925
@14 // 22926
M=D // 22927
@Int32.getParts // 22928
D=A // 22929
@13 // 22930
M=D // 22931
@Int32.do_add.ret.0 // 22932
D=A // 22933
@CALL // 22934
0;JMP // 22935
(Int32.do_add.ret.0)
@SP // 22936
AM=M-1 // 22937
D=M // 22938
@LCL // 22939
A=M // 22940
M=D // 22941

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 22942
A=M+1 // 22943
A=A+1 // 22944
M=0 // 22945

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 22946
A=M+1 // 22947
M=0 // 22948

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
@Int32.do_add.LT.74 // 22949
D=A // 22950
@SP // 22951
AM=M+1 // 22952
A=A-1 // 22953
M=D // 22954
@LCL // 22955
A=M+1 // 22956
D=M // 22957
@4 // 22958
D=D-A // 22959
@DO_LT // 22960
0;JMP // 22961
(Int32.do_add.LT.74)
D=!D // 22962
@Int32.do_add_WHILE_END1 // 22963
D;JNE // 22964

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
@THIS // 22965
A=M // 22966
D=M // 22967
@LCL // 22968
A=M+1 // 22969
D=D+M // 22970
@SP // 22971
AM=M+1 // 22972
A=A-1 // 22973
M=D // 22974
@THIS // 22975
A=M // 22976
D=M // 22977
@LCL // 22978
A=M+1 // 22979
A=D+M // 22980
D=M // 22981
@SP // 22982
AM=M+1 // 22983
A=A-1 // 22984
M=D // 22985
@LCL // 22986
A=M+1 // 22987
D=M // 22988
A=A-1 // 22989
A=D+M // 22990
D=M // 22991
@SP // 22992
AM=M-1 // 22993
D=D+M // 22994
@SP // 22995
AM=M+1 // 22996
A=A-1 // 22997
M=D // 22998
@LCL // 22999
A=M+1 // 23000
A=A+1 // 23001
D=M // 23002
@SP // 23003
AM=M-1 // 23004
D=D+M // 23005
@SP // 23006
AM=M-1 // 23007
A=M // 23008
M=D // 23009

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
@Int32.do_add.LT.75 // 23010
D=A // 23011
@SP // 23012
AM=M+1 // 23013
A=A-1 // 23014
M=D // 23015
@THIS // 23016
A=M // 23017
D=M // 23018
@LCL // 23019
A=M+1 // 23020
A=D+M // 23021
D=M // 23022
@256 // 23023
D=D-A // 23024
@DO_LT // 23025
0;JMP // 23026
(Int32.do_add.LT.75)
D=!D // 23027
@Int32.do_add$IF_TRUE1 // 23028
D;JNE // 23029

////GotoInstruction{label='Int32.do_add$IF_FALSE1}
// goto Int32.do_add$IF_FALSE1
@Int32.do_add$IF_FALSE1 // 23030
0;JMP // 23031

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
@THIS // 23032
A=M // 23033
D=M // 23034
@LCL // 23035
A=M+1 // 23036
D=D+M // 23037
@SP // 23038
AM=M+1 // 23039
A=A-1 // 23040
M=D // 23041
@THIS // 23042
A=M // 23043
D=M // 23044
@LCL // 23045
A=M+1 // 23046
A=D+M // 23047
D=M // 23048
@256 // 23049
D=D-A // 23050
@SP // 23051
AM=M-1 // 23052
A=M // 23053
M=D // 23054

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 23055
A=M+1 // 23056
A=A+1 // 23057
M=1 // 23058

////GotoInstruction{label='Int32.do_add$IF_END1}
// goto Int32.do_add$IF_END1
@Int32.do_add$IF_END1 // 23059
0;JMP // 23060

////LabelInstruction{label='Int32.do_add$IF_FALSE1}
// label Int32.do_add$IF_FALSE1
(Int32.do_add$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 23061
A=M+1 // 23062
A=A+1 // 23063
M=0 // 23064

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

@LCL // 23065
A=M+1 // 23066
M=M+1 // 23067

////GotoInstruction{label='Int32.do_add_WHILE_EXP1}
// goto Int32.do_add_WHILE_EXP1
@Int32.do_add_WHILE_EXP1 // 23068
0;JMP // 23069

////LabelInstruction{label='Int32.do_add_WHILE_END1}
// label Int32.do_add_WHILE_END1
(Int32.do_add_WHILE_END1)

////PushInstruction("constant 0")
@SP // 23070
AM=M+1 // 23071
A=A-1 // 23072
M=0 // 23073
@RETURN // 23074
0;JMP // 23075

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.copy=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 23076
M=M+1 // 23077
AM=M+1 // 23078
A=A-1 // 23079
M=0 // 23080
A=A-1 // 23081
M=0 // 23082

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 23083
A=M+1 // 23084
D=M // 23085
@2 // 23086
D=D+A // 23087
@SP // 23088
AM=M+1 // 23089
A=A-1 // 23090
M=D // 23091
D=0 // 23092
@SP // 23093
AM=M-1 // 23094
A=M // 23095
M=D // 23096

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 23097
A=M+1 // 23098
D=M // 23099
@3 // 23100
D=D+A // 23101
@SP // 23102
AM=M+1 // 23103
A=A-1 // 23104
M=D // 23105
D=0 // 23106
@SP // 23107
AM=M-1 // 23108
A=M // 23109
M=D // 23110

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
@Memory.add_node.EQ.76 // 23111
D=A // 23112
@SP // 23113
AM=M+1 // 23114
A=A-1 // 23115
M=D // 23116
@ARG // 23117
A=M // 23118
A=M // 23119
D=M // 23120
@DO_EQ // 23121
0;JMP // 23122
(Memory.add_node.EQ.76)
@Memory.add_node$IF_TRUE1 // 23123
D;JNE // 23124

////GotoInstruction{label='Memory.add_node$IF_END1}
// goto Memory.add_node$IF_END1
@Memory.add_node$IF_END1 // 23125
0;JMP // 23126

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
@ARG // 23127
A=M // 23128
D=M // 23129
@0 // 23130
D=D+A // 23131
@SP // 23132
AM=M+1 // 23133
A=A-1 // 23134
M=D // 23135
@ARG // 23136
A=M+1 // 23137
D=M // 23138
@SP // 23139
AM=M-1 // 23140
A=M // 23141
M=D // 23142

////PushInstruction("constant 0")
@SP // 23143
AM=M+1 // 23144
A=A-1 // 23145
M=0 // 23146
@RETURN // 23147
0;JMP // 23148

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

@ARG // 23149
A=M // 23150
A=M // 23151
D=M // 23152
@LCL // 23153
A=M // 23154
M=D // 23155

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 23156
A=M+1 // 23157
M=0 // 23158

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
@Memory.add_node.EQ.77 // 23159
D=A // 23160
@SP // 23161
AM=M+1 // 23162
A=A-1 // 23163
M=D // 23164
@LCL // 23165
A=M // 23166
D=M // 23167
@DO_EQ // 23168
0;JMP // 23169
(Memory.add_node.EQ.77)
@SP // 23170
AM=M+1 // 23171
A=A-1 // 23172
M=D // 23173
@SP // 23174
A=M-1 // 23175
M=!D // 23176
@Memory.add_node.GT.78 // 23177
D=A // 23178
@SP // 23179
AM=M+1 // 23180
A=A-1 // 23181
M=D // 23182
@LCL // 23183
A=M // 23184
A=M // 23185
D=M // 23186
@SP // 23187
AM=M+1 // 23188
A=A-1 // 23189
M=D // 23190
@ARG // 23191
A=M+1 // 23192
A=M // 23193
D=M // 23194
@SP // 23195
AM=M-1 // 23196
D=M-D // 23197
@DO_GT // 23198
0;JMP // 23199
(Memory.add_node.GT.78)
D=!D // 23200
@SP // 23201
AM=M-1 // 23202
D=D&M // 23203
D=!D // 23204
@Memory.add_node_WHILE_END1 // 23205
D;JNE // 23206

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 23207
A=M // 23208
D=M // 23209
@LCL // 23210
A=M+1 // 23211
M=D // 23212

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

@LCL // 23213
A=M // 23214
D=M // 23215
@LCL // 23216
A=M // 23217
D=M // 23218
@3 // 23219
D=D+A // 23220
A=D // 23221
D=M // 23222
@LCL // 23223
A=M // 23224
M=D // 23225

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 23226
0;JMP // 23227

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
@Memory.add_node.EQ.79 // 23228
D=A // 23229
@SP // 23230
AM=M+1 // 23231
A=A-1 // 23232
M=D // 23233
@LCL // 23234
A=M+1 // 23235
D=M // 23236
@DO_EQ // 23237
0;JMP // 23238
(Memory.add_node.EQ.79)
@Memory.add_node$IF_TRUE2 // 23239
D;JNE // 23240

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 23241
0;JMP // 23242

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
@ARG // 23243
A=M+1 // 23244
D=M // 23245
@3 // 23246
D=D+A // 23247
@SP // 23248
AM=M+1 // 23249
A=A-1 // 23250
M=D // 23251
@ARG // 23252
A=M // 23253
A=M // 23254
D=M // 23255
@SP // 23256
AM=M-1 // 23257
A=M // 23258
M=D // 23259

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
@ARG // 23260
A=M // 23261
A=M // 23262
D=M // 23263
@2 // 23264
D=D+A // 23265
@SP // 23266
AM=M+1 // 23267
A=A-1 // 23268
M=D // 23269
@ARG // 23270
A=M+1 // 23271
D=M // 23272
@SP // 23273
AM=M-1 // 23274
A=M // 23275
M=D // 23276

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 23277
A=M // 23278
D=M // 23279
@0 // 23280
D=D+A // 23281
@SP // 23282
AM=M+1 // 23283
A=A-1 // 23284
M=D // 23285
@ARG // 23286
A=M+1 // 23287
D=M // 23288
@SP // 23289
AM=M-1 // 23290
A=M // 23291
M=D // 23292

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 23293
0;JMP // 23294

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
@ARG // 23295
A=M+1 // 23296
D=M // 23297
@3 // 23298
D=D+A // 23299
@SP // 23300
AM=M+1 // 23301
A=A-1 // 23302
M=D // 23303
@LCL // 23304
A=M // 23305
D=M // 23306
@SP // 23307
AM=M-1 // 23308
A=M // 23309
M=D // 23310

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 23311
A=M+1 // 23312
D=M // 23313
@2 // 23314
D=D+A // 23315
@SP // 23316
AM=M+1 // 23317
A=A-1 // 23318
M=D // 23319
@LCL // 23320
A=M+1 // 23321
D=M // 23322
@SP // 23323
AM=M-1 // 23324
A=M // 23325
M=D // 23326

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 23327
A=M // 23328
D=M // 23329
@Memory.add_node$IF_TRUE3 // 23330
D;JNE // 23331

////GotoInstruction{label='Memory.add_node$IF_END3}
// goto Memory.add_node$IF_END3
@Memory.add_node$IF_END3 // 23332
0;JMP // 23333

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
@LCL // 23334
A=M // 23335
D=M // 23336
@2 // 23337
D=D+A // 23338
@SP // 23339
AM=M+1 // 23340
A=A-1 // 23341
M=D // 23342
@ARG // 23343
A=M+1 // 23344
D=M // 23345
@SP // 23346
AM=M-1 // 23347
A=M // 23348
M=D // 23349

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
@LCL // 23350
A=M+1 // 23351
D=M // 23352
@3 // 23353
D=D+A // 23354
@SP // 23355
AM=M+1 // 23356
A=A-1 // 23357
M=D // 23358
@ARG // 23359
A=M+1 // 23360
D=M // 23361
@SP // 23362
AM=M-1 // 23363
A=M // 23364
M=D // 23365

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 23366
AM=M+1 // 23367
A=A-1 // 23368
M=0 // 23369
@RETURN // 23370
0;JMP // 23371

////FunctionInstruction{functionName='Vec3.do_sub', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.clone=4, Vec3.do_cross=27, Vec3.new=1}}
// function Vec3.do_sub with 0
(Vec3.do_sub)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23372
A=M // 23373
D=M // 23374
@3 // 23375
M=D // 23376

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getX}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23377
A=M // 23378
D=M // 23379
@SP // 23380
AM=M+1 // 23381
A=A-1 // 23382
M=D // 23383
@ARG // 23384
A=M+1 // 23385
D=M // 23386
@SP // 23387
AM=M+1 // 23388
A=A-1 // 23389
M=D // 23390
// call Vec3.getX
@6 // 23391
D=A // 23392
@14 // 23393
M=D // 23394
@Vec3.getX // 23395
D=A // 23396
@13 // 23397
M=D // 23398
@Vec3.do_sub.ret.0 // 23399
D=A // 23400
@CALL // 23401
0;JMP // 23402
(Vec3.do_sub.ret.0)
// call Number.do_sub
@7 // 23403
D=A // 23404
@14 // 23405
M=D // 23406
@Number.do_sub // 23407
D=A // 23408
@13 // 23409
M=D // 23410
@Vec3.do_sub.ret.1 // 23411
D=A // 23412
@CALL // 23413
0;JMP // 23414
(Vec3.do_sub.ret.1)
@SP // 23415
M=M-1 // 23416

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getY}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23417
A=M+1 // 23418
D=M // 23419
@SP // 23420
AM=M+1 // 23421
A=A-1 // 23422
M=D // 23423
@ARG // 23424
A=M+1 // 23425
D=M // 23426
@SP // 23427
AM=M+1 // 23428
A=A-1 // 23429
M=D // 23430
// call Vec3.getY
@6 // 23431
D=A // 23432
@14 // 23433
M=D // 23434
@Vec3.getY // 23435
D=A // 23436
@13 // 23437
M=D // 23438
@Vec3.do_sub.ret.2 // 23439
D=A // 23440
@CALL // 23441
0;JMP // 23442
(Vec3.do_sub.ret.2)
// call Number.do_sub
@7 // 23443
D=A // 23444
@14 // 23445
M=D // 23446
@Number.do_sub // 23447
D=A // 23448
@13 // 23449
M=D // 23450
@Vec3.do_sub.ret.3 // 23451
D=A // 23452
@CALL // 23453
0;JMP // 23454
(Vec3.do_sub.ret.3)
@SP // 23455
M=M-1 // 23456

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.getZ}}], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 23457
A=M+1 // 23458
A=A+1 // 23459
D=M // 23460
@SP // 23461
AM=M+1 // 23462
A=A-1 // 23463
M=D // 23464
@ARG // 23465
A=M+1 // 23466
D=M // 23467
@SP // 23468
AM=M+1 // 23469
A=A-1 // 23470
M=D // 23471
// call Vec3.getZ
@6 // 23472
D=A // 23473
@14 // 23474
M=D // 23475
@Vec3.getZ // 23476
D=A // 23477
@13 // 23478
M=D // 23479
@Vec3.do_sub.ret.4 // 23480
D=A // 23481
@CALL // 23482
0;JMP // 23483
(Vec3.do_sub.ret.4)
// call Number.do_sub
@7 // 23484
D=A // 23485
@14 // 23486
M=D // 23487
@Number.do_sub // 23488
D=A // 23489
@13 // 23490
M=D // 23491
@Vec3.do_sub.ret.5 // 23492
D=A // 23493
@CALL // 23494
0;JMP // 23495
(Vec3.do_sub.ret.5)
@SP // 23496
M=M-1 // 23497

////PushInstruction("constant 0")
@SP // 23498
AM=M+1 // 23499
A=A-1 // 23500
M=0 // 23501
@RETURN // 23502
0;JMP // 23503

////FunctionInstruction{functionName='Scene.trace', numLocals=6, funcMapping={Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.trace with 6
(Scene.trace)
@6 // 23504
D=A // 23505
@SP // 23506
AM=D+M // 23507
A=A-1 // 23508
M=0 // 23509
A=A-1 // 23510
M=0 // 23511
A=A-1 // 23512
M=0 // 23513
A=A-1 // 23514
M=0 // 23515
A=A-1 // 23516
M=0 // 23517
A=A-1 // 23518
M=0 // 23519

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23520
A=M // 23521
D=M // 23522
@3 // 23523
M=D // 23524

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 23525
A=M // 23526
M=0 // 23527

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
@Scene.trace.LT.80 // 23528
D=A // 23529
@SP // 23530
AM=M+1 // 23531
A=A-1 // 23532
M=D // 23533
@LCL // 23534
A=M+1 // 23535
D=M // 23536
@SP // 23537
AM=M+1 // 23538
A=A-1 // 23539
M=D // 23540
@THIS // 23541
D=M // 23542
@6 // 23543
A=D+A // 23544
D=M // 23545
@SP // 23546
AM=M-1 // 23547
D=M-D // 23548
@DO_LT // 23549
0;JMP // 23550
(Scene.trace.LT.80)
D=!D // 23551
@Scene.trace_WHILE_END1 // 23552
D;JNE // 23553

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

@RETURN_PUSH_LABEL_143 // 23554
D=A // 23555
@13 // 23556
M=D // 23557
@5 // 23558
D=A // 23559
@THIS_PUSH // 23560
0;JMP // 23561
(RETURN_PUSH_LABEL_143)
@LCL // 23562
A=M+1 // 23563
D=M // 23564
@SP // 23565
AM=M-1 // 23566
A=D+M // 23567
D=M // 23568
@LCL // 23569
A=M+1 // 23570
A=A+1 // 23571
M=D // 23572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("argument 1")], call=CallInstruction{Element.intersect}}
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 23573
A=M+1 // 23574
A=A+1 // 23575
D=M // 23576
@SP // 23577
AM=M+1 // 23578
A=A-1 // 23579
M=D // 23580
@ARG // 23581
A=M+1 // 23582
D=M // 23583
@SP // 23584
AM=M+1 // 23585
A=A-1 // 23586
M=D // 23587
// call Element.intersect
@7 // 23588
D=A // 23589
@14 // 23590
M=D // 23591
@Element.intersect // 23592
D=A // 23593
@13 // 23594
M=D // 23595
@Scene.trace.ret.0 // 23596
D=A // 23597
@CALL // 23598
0;JMP // 23599
(Scene.trace.ret.0)
@SP // 23600
AM=M-1 // 23601
D=M // 23602
@LCL // 23603
A=M+1 // 23604
A=A+1 // 23605
A=A+1 // 23606
M=D // 23607

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 23608
D=M // 23609
@5 // 23610
A=D+A // 23611
M=0 // 23612

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Scene.trace$IF_TRUE1}}
@Scene.trace.EQ.81 // 23613
D=A // 23614
@SP // 23615
AM=M+1 // 23616
A=A-1 // 23617
M=D // 23618
@LCL // 23619
A=M // 23620
D=M // 23621
@DO_EQ // 23622
0;JMP // 23623
(Scene.trace.EQ.81)
D=!D // 23624
@Scene.trace$IF_TRUE1 // 23625
D;JNE // 23626

////GotoInstruction{label='Scene.trace$IF_END1}
// goto Scene.trace$IF_END1
@Scene.trace$IF_END1 // 23627
0;JMP // 23628

////LabelInstruction{label='Scene.trace$IF_TRUE1}
// label Scene.trace$IF_TRUE1
(Scene.trace$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Intersection.getDistanceFromOrigin}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 23629
A=M // 23630
D=M // 23631
@SP // 23632
AM=M+1 // 23633
A=A-1 // 23634
M=D // 23635
// call Intersection.getDistanceFromOrigin
@6 // 23636
D=A // 23637
@14 // 23638
M=D // 23639
@Intersection.getDistanceFromOrigin // 23640
D=A // 23641
@13 // 23642
M=D // 23643
@Scene.trace.ret.1 // 23644
D=A // 23645
@CALL // 23646
0;JMP // 23647
(Scene.trace.ret.1)
@LCL // 23648
D=M // 23649
@4 // 23650
A=D+A // 23651
D=A // 23652
@R13 // 23653
M=D // 23654
@SP // 23655
AM=M-1 // 23656
D=M // 23657
@R13 // 23658
A=M // 23659
M=D // 23660

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 4")], call=CallInstruction{Number.is_less_than}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 23661
A=M+1 // 23662
A=A+1 // 23663
A=A+1 // 23664
D=M // 23665
@SP // 23666
AM=M+1 // 23667
A=A-1 // 23668
M=D // 23669
@RETURN_PUSH_LABEL_144 // 23670
D=A // 23671
@13 // 23672
M=D // 23673
@4 // 23674
D=A // 23675
@LCL_PUSH // 23676
0;JMP // 23677
(RETURN_PUSH_LABEL_144)
// call Number.is_less_than
@7 // 23678
D=A // 23679
@14 // 23680
M=D // 23681
@Number.is_less_than // 23682
D=A // 23683
@13 // 23684
M=D // 23685
@Scene.trace.ret.2 // 23686
D=A // 23687
@CALL // 23688
0;JMP // 23689
(Scene.trace.ret.2)
@LCL // 23690
D=M // 23691
@5 // 23692
A=D+A // 23693
D=A // 23694
@R13 // 23695
M=D // 23696
@SP // 23697
AM=M-1 // 23698
D=M // 23699
@R13 // 23700
A=M // 23701
M=D // 23702

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
@LCL // 23703
A=M+1 // 23704
A=A+1 // 23705
A=A+1 // 23706
D=M // 23707
@SP // 23708
AM=M+1 // 23709
A=A-1 // 23710
M=D // 23711
// call Number.is_negative
@6 // 23712
D=A // 23713
@14 // 23714
M=D // 23715
@Number.is_negative // 23716
D=A // 23717
@13 // 23718
M=D // 23719
@Scene.trace.ret.3 // 23720
D=A // 23721
@CALL // 23722
0;JMP // 23723
(Scene.trace.ret.3)
@SP // 23724
A=M-1 // 23725
M=!D // 23726
@Scene.trace.EQ.82 // 23727
D=A // 23728
@SP // 23729
AM=M+1 // 23730
A=A-1 // 23731
M=D // 23732
@LCL // 23733
A=M // 23734
D=M // 23735
@DO_EQ // 23736
0;JMP // 23737
(Scene.trace.EQ.82)
@SP // 23738
AM=M+1 // 23739
A=A-1 // 23740
M=D // 23741
@LCL // 23742
D=M // 23743
@5 // 23744
A=D+A // 23745
D=M // 23746
@SP // 23747
AM=M-1 // 23748
D=D|M // 23749
@SP // 23750
AM=M-1 // 23751
D=D&M // 23752
@Scene.trace$IF_TRUE2 // 23753
D;JNE // 23754

////GotoInstruction{label='Scene.trace$IF_FALSE2}
// goto Scene.trace$IF_FALSE2
@Scene.trace$IF_FALSE2 // 23755
0;JMP // 23756

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
@Scene.trace.EQ.83 // 23757
D=A // 23758
@SP // 23759
AM=M+1 // 23760
A=A-1 // 23761
M=D // 23762
@LCL // 23763
A=M // 23764
D=M // 23765
@DO_EQ // 23766
0;JMP // 23767
(Scene.trace.EQ.83)
D=!D // 23768
@Scene.trace$IF_TRUE3 // 23769
D;JNE // 23770

////GotoInstruction{label='Scene.trace$IF_END3}
// goto Scene.trace$IF_END3
@Scene.trace$IF_END3 // 23771
0;JMP // 23772

////LabelInstruction{label='Scene.trace$IF_TRUE3}
// label Scene.trace$IF_TRUE3
(Scene.trace$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 23773
A=M // 23774
D=M // 23775
@SP // 23776
AM=M+1 // 23777
A=A-1 // 23778
M=D // 23779
// call Intersection.dispose
@6 // 23780
D=A // 23781
@14 // 23782
M=D // 23783
@Intersection.dispose // 23784
D=A // 23785
@13 // 23786
M=D // 23787
@Scene.trace.ret.4 // 23788
D=A // 23789
@CALL // 23790
0;JMP // 23791
(Scene.trace.ret.4)
@SP // 23792
M=M-1 // 23793

////LabelInstruction{label='Scene.trace$IF_END3}
// label Scene.trace$IF_END3
(Scene.trace$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 2")], call=CallInstruction{Intersection.new}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 23794
A=M+1 // 23795
A=A+1 // 23796
A=A+1 // 23797
D=M // 23798
@SP // 23799
AM=M+1 // 23800
A=A-1 // 23801
M=D // 23802
@LCL // 23803
A=M+1 // 23804
A=A+1 // 23805
D=M // 23806
@SP // 23807
AM=M+1 // 23808
A=A-1 // 23809
M=D // 23810
// call Intersection.new
@7 // 23811
D=A // 23812
@14 // 23813
M=D // 23814
@Intersection.new // 23815
D=A // 23816
@13 // 23817
M=D // 23818
@Scene.trace.ret.5 // 23819
D=A // 23820
@CALL // 23821
0;JMP // 23822
(Scene.trace.ret.5)
@SP // 23823
AM=M-1 // 23824
D=M // 23825
@LCL // 23826
A=M // 23827
M=D // 23828

////GotoInstruction{label='Scene.trace$IF_END2}
// goto Scene.trace$IF_END2
@Scene.trace$IF_END2 // 23829
0;JMP // 23830

////LabelInstruction{label='Scene.trace$IF_FALSE2}
// label Scene.trace$IF_FALSE2
(Scene.trace$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 23831
A=M+1 // 23832
A=A+1 // 23833
A=A+1 // 23834
D=M // 23835
@SP // 23836
AM=M+1 // 23837
A=A-1 // 23838
M=D // 23839
// call Number.dispose
@6 // 23840
D=A // 23841
@14 // 23842
M=D // 23843
@Number.dispose // 23844
D=A // 23845
@13 // 23846
M=D // 23847
@Scene.trace.ret.6 // 23848
D=A // 23849
@CALL // 23850
0;JMP // 23851
(Scene.trace.ret.6)
@SP // 23852
M=M-1 // 23853

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

@LCL // 23854
A=M+1 // 23855
M=M+1 // 23856

////GotoInstruction{label='Scene.trace_WHILE_EXP1}
// goto Scene.trace_WHILE_EXP1
@Scene.trace_WHILE_EXP1 // 23857
0;JMP // 23858

////LabelInstruction{label='Scene.trace_WHILE_END1}
// label Scene.trace_WHILE_END1
(Scene.trace_WHILE_END1)

////PushInstruction("local 0")
@LCL // 23859
A=M // 23860
D=M // 23861
@SP // 23862
AM=M+1 // 23863
A=A-1 // 23864
M=D // 23865
@RETURN // 23866
0;JMP // 23867

////FunctionInstruction{functionName='Int32.is_negative', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_negative with 0
(Int32.is_negative)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 23868
A=M // 23869
D=M // 23870
@3 // 23871
M=D // 23872

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
@Int32.is_negative.LT.84 // 23873
D=A // 23874
@SP // 23875
AM=M+1 // 23876
A=A-1 // 23877
M=D // 23878
@THIS // 23879
A=M // 23880
D=M // 23881
@THIS // 23882
A=M // 23883
D=M // 23884
@3 // 23885
D=D+A // 23886
A=D // 23887
D=M // 23888
@128 // 23889
D=D-A // 23890
@DO_LT // 23891
0;JMP // 23892
(Int32.is_negative.LT.84)
@SP // 23893
AM=M+1 // 23894
A=A-1 // 23895
M=D // 23896
@SP // 23897
A=M-1 // 23898
M=!D // 23899
@RETURN // 23900
0;JMP // 23901

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 23902
D=A // 23903
@14 // 23904
M=D // 23905
@Memory.init // 23906
D=A // 23907
@13 // 23908
M=D // 23909
@Sys.init.ret.0 // 23910
D=A // 23911
@CALL // 23912
0;JMP // 23913
(Sys.init.ret.0)
@SP // 23914
M=M-1 // 23915

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 23916
D=A // 23917
@14 // 23918
M=D // 23919
@Math.init // 23920
D=A // 23921
@13 // 23922
M=D // 23923
@Sys.init.ret.1 // 23924
D=A // 23925
@CALL // 23926
0;JMP // 23927
(Sys.init.ret.1)
@SP // 23928
M=M-1 // 23929

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 23930
D=A // 23931
@14 // 23932
M=D // 23933
@Screen.init // 23934
D=A // 23935
@13 // 23936
M=D // 23937
@Sys.init.ret.2 // 23938
D=A // 23939
@CALL // 23940
0;JMP // 23941
(Sys.init.ret.2)
@SP // 23942
M=M-1 // 23943

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 23944
D=A // 23945
@14 // 23946
M=D // 23947
@Output.init // 23948
D=A // 23949
@13 // 23950
M=D // 23951
@Sys.init.ret.3 // 23952
D=A // 23953
@CALL // 23954
0;JMP // 23955
(Sys.init.ret.3)
@SP // 23956
M=M-1 // 23957

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 23958
D=A // 23959
@14 // 23960
M=D // 23961
@Main.main // 23962
D=A // 23963
@13 // 23964
M=D // 23965
@Sys.init.ret.4 // 23966
D=A // 23967
@CALL // 23968
0;JMP // 23969
(Sys.init.ret.4)
@SP // 23970
M=M-1 // 23971

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 23972
D=A // 23973
@14 // 23974
M=D // 23975
@Sys.halt // 23976
D=A // 23977
@13 // 23978
M=D // 23979
@Sys.init.ret.5 // 23980
D=A // 23981
@CALL // 23982
0;JMP // 23983
(Sys.init.ret.5)
@SP // 23984
M=M-1 // 23985

////PushInstruction("constant 0")
@SP // 23986
AM=M+1 // 23987
A=A-1 // 23988
M=0 // 23989
@RETURN // 23990
0;JMP // 23991

////FunctionInstruction{functionName='Element.plane', numLocals=0, funcMapping={Element.surface_normal=2, Element.color=2}}
// function Element.plane with 0
(Element.plane)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 23992
D=A // 23993
@SP // 23994
AM=M+1 // 23995
A=A-1 // 23996
M=D // 23997
// call Memory.alloc
@6 // 23998
D=A // 23999
@14 // 24000
M=D // 24001
@Memory.alloc // 24002
D=A // 24003
@13 // 24004
M=D // 24005
@Element.plane.ret.0 // 24006
D=A // 24007
@CALL // 24008
0;JMP // 24009
(Element.plane.ret.0)
@SP // 24010
AM=M-1 // 24011
D=M // 24012
@3 // 24013
M=D // 24014

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 24015
A=M // 24016
D=M // 24017
@THIS // 24018
A=M // 24019
M=D // 24020

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 24021
A=M+1 // 24022
M=0 // 24023

////PushInstruction("pointer 0")
@3 // 24024
D=M // 24025
@SP // 24026
AM=M+1 // 24027
A=A-1 // 24028
M=D // 24029
@RETURN // 24030
0;JMP // 24031

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 24032
A=M // 24033
D=M // 24034
@Screen.0 // 24035
M=D // 24036

////PushInstruction("constant 0")
@SP // 24037
AM=M+1 // 24038
A=A-1 // 24039
M=0 // 24040
@RETURN // 24041
0;JMP // 24042

////FunctionInstruction{functionName='Vec3.dispose', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.new=1}}
// function Vec3.dispose with 0
(Vec3.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24043
A=M // 24044
D=M // 24045
@3 // 24046
M=D // 24047

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

@Vec3.0 // 24048
M=M-1 // 24049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24050
A=M // 24051
D=M // 24052
@SP // 24053
AM=M+1 // 24054
A=A-1 // 24055
M=D // 24056
// call Number.dispose
@6 // 24057
D=A // 24058
@14 // 24059
M=D // 24060
@Number.dispose // 24061
D=A // 24062
@13 // 24063
M=D // 24064
@Vec3.dispose.ret.0 // 24065
D=A // 24066
@CALL // 24067
0;JMP // 24068
(Vec3.dispose.ret.0)
@SP // 24069
M=M-1 // 24070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24071
A=M+1 // 24072
D=M // 24073
@SP // 24074
AM=M+1 // 24075
A=A-1 // 24076
M=D // 24077
// call Number.dispose
@6 // 24078
D=A // 24079
@14 // 24080
M=D // 24081
@Number.dispose // 24082
D=A // 24083
@13 // 24084
M=D // 24085
@Vec3.dispose.ret.1 // 24086
D=A // 24087
@CALL // 24088
0;JMP // 24089
(Vec3.dispose.ret.1)
@SP // 24090
M=M-1 // 24091

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24092
A=M+1 // 24093
A=A+1 // 24094
D=M // 24095
@SP // 24096
AM=M+1 // 24097
A=A-1 // 24098
M=D // 24099
// call Number.dispose
@6 // 24100
D=A // 24101
@14 // 24102
M=D // 24103
@Number.dispose // 24104
D=A // 24105
@13 // 24106
M=D // 24107
@Vec3.dispose.ret.2 // 24108
D=A // 24109
@CALL // 24110
0;JMP // 24111
(Vec3.dispose.ret.2)
@SP // 24112
M=M-1 // 24113

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 24114
D=M // 24115
@SP // 24116
AM=M+1 // 24117
A=A-1 // 24118
M=D // 24119
// call Memory.deAlloc
@6 // 24120
D=A // 24121
@14 // 24122
M=D // 24123
@Memory.deAlloc // 24124
D=A // 24125
@13 // 24126
M=D // 24127
@Vec3.dispose.ret.3 // 24128
D=A // 24129
@CALL // 24130
0;JMP // 24131
(Vec3.dispose.ret.3)
@SP // 24132
M=M-1 // 24133

////PushInstruction("constant 0")
@SP // 24134
AM=M+1 // 24135
A=A-1 // 24136
M=0 // 24137
@RETURN // 24138
0;JMP // 24139

////FunctionInstruction{functionName='DirectionalLight.getColor', numLocals=0, funcMapping={}}
// function DirectionalLight.getColor with 0
(DirectionalLight.getColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24140
A=M // 24141
D=M // 24142
@3 // 24143
M=D // 24144

////PushInstruction("this 1")
@THIS // 24145
A=M+1 // 24146
D=M // 24147
@SP // 24148
AM=M+1 // 24149
A=A-1 // 24150
M=D // 24151
@RETURN // 24152
0;JMP // 24153

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 24154
M=M+1 // 24155
AM=M+1 // 24156
A=A-1 // 24157
M=0 // 24158
A=A-1 // 24159
M=0 // 24160

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24161
A=M // 24162
M=1 // 24163

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 24164
A=M+1 // 24165
M=0 // 24166

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 24167
D=A // 24168
@SP // 24169
AM=M+1 // 24170
A=A-1 // 24171
M=D // 24172
// call Memory.alloc
@6 // 24173
D=A // 24174
@14 // 24175
M=D // 24176
@Memory.alloc // 24177
D=A // 24178
@13 // 24179
M=D // 24180
@Math.init.ret.0 // 24181
D=A // 24182
@CALL // 24183
0;JMP // 24184
(Math.init.ret.0)
@SP // 24185
AM=M-1 // 24186
D=M // 24187
@Math.0 // 24188
M=D // 24189

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
@Math.init.LT.85 // 24190
D=A // 24191
@SP // 24192
AM=M+1 // 24193
A=A-1 // 24194
M=D // 24195
@LCL // 24196
A=M+1 // 24197
D=M // 24198
@16 // 24199
D=D-A // 24200
@DO_LT // 24201
0;JMP // 24202
(Math.init.LT.85)
D=!D // 24203
@Math.init_WHILE_END1 // 24204
D;JNE // 24205

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 24206
D=M // 24207
@LCL // 24208
A=M+1 // 24209
D=D+M // 24210
@SP // 24211
AM=M+1 // 24212
A=A-1 // 24213
M=D // 24214
@LCL // 24215
A=M // 24216
D=M // 24217
@SP // 24218
AM=M-1 // 24219
A=M // 24220
M=D // 24221

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

@LCL // 24222
A=M // 24223
D=M // 24224
@LCL // 24225
A=M // 24226
M=D+M // 24227

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

@LCL // 24228
A=M+1 // 24229
M=M+1 // 24230

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 24231
0;JMP // 24232

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 24233
AM=M+1 // 24234
A=A-1 // 24235
M=0 // 24236
@RETURN // 24237
0;JMP // 24238

////FunctionInstruction{functionName='Number.frac_to_i16', numLocals=1, funcMapping={Number.cmp=2, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.is_less_than=2, Number.do_neg=1}}
// function Number.frac_to_i16 with 1
(Number.frac_to_i16)
@SP // 24239
AM=M+1 // 24240
A=A-1 // 24241
M=0 // 24242

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24243
A=M // 24244
D=M // 24245
@3 // 24246
M=D // 24247

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 24248
A=M // 24249
D=M // 24250
@SP // 24251
AM=M+1 // 24252
A=A-1 // 24253
M=D // 24254
// call Int32.getParts
@6 // 24255
D=A // 24256
@14 // 24257
M=D // 24258
@Int32.getParts // 24259
D=A // 24260
@13 // 24261
M=D // 24262
@Number.frac_to_i16.ret.0 // 24263
D=A // 24264
@CALL // 24265
0;JMP // 24266
(Number.frac_to_i16.ret.0)
@SP // 24267
AM=M-1 // 24268
D=M // 24269
@LCL // 24270
A=M // 24271
M=D // 24272

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Number.is_negative}}, ifGoto=IfGotoInstruction{label='Number.frac_to_i16$IF_TRUE1}}
@3 // 24273
D=M // 24274
@SP // 24275
AM=M+1 // 24276
A=A-1 // 24277
M=D // 24278
// call Number.is_negative
@6 // 24279
D=A // 24280
@14 // 24281
M=D // 24282
@Number.is_negative // 24283
D=A // 24284
@13 // 24285
M=D // 24286
@Number.frac_to_i16.ret.1 // 24287
D=A // 24288
@CALL // 24289
0;JMP // 24290
(Number.frac_to_i16.ret.1)
@SP // 24291
AM=M-1 // 24292
D=M // 24293
@Number.frac_to_i16$IF_TRUE1 // 24294
D;JNE // 24295

////GotoInstruction{label='Number.frac_to_i16$IF_FALSE1}
// goto Number.frac_to_i16$IF_FALSE1
@Number.frac_to_i16$IF_FALSE1 // 24296
0;JMP // 24297

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
@LCL // 24298
A=M // 24299
A=M+1 // 24300
D=M // 24301
@255 // 24302
D=A-D // 24303
@SP // 24304
AM=M+1 // 24305
A=A-1 // 24306
M=D // 24307
@128 // 24308
D=A // 24309
@SP // 24310
AM=M+1 // 24311
A=A-1 // 24312
M=D // 24313
// call Math.multiply
@7 // 24314
D=A // 24315
@14 // 24316
M=D // 24317
@Math.multiply // 24318
D=A // 24319
@13 // 24320
M=D // 24321
@Number.frac_to_i16.ret.2 // 24322
D=A // 24323
@CALL // 24324
0;JMP // 24325
(Number.frac_to_i16.ret.2)
@LCL // 24326
A=M // 24327
A=M // 24328
D=M // 24329
@256 // 24330
D=A-D // 24331
@SP // 24332
AM=M-1 // 24333
D=D+M // 24334
@SP // 24335
AM=M+1 // 24336
A=A-1 // 24337
M=D // 24338
@2 // 24339
D=A // 24340
@SP // 24341
AM=M+1 // 24342
A=A-1 // 24343
M=D // 24344
// call Math.divide
@7 // 24345
D=A // 24346
@14 // 24347
M=D // 24348
@Math.divide // 24349
D=A // 24350
@13 // 24351
M=D // 24352
@Number.frac_to_i16.ret.3 // 24353
D=A // 24354
@CALL // 24355
0;JMP // 24356
(Number.frac_to_i16.ret.3)
@SP // 24357
A=M-1 // 24358
M=-D // 24359
@RETURN // 24360
0;JMP // 24361

////GotoInstruction{label='Number.frac_to_i16$IF_END1}
// goto Number.frac_to_i16$IF_END1
@Number.frac_to_i16$IF_END1 // 24362
0;JMP // 24363

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
@LCL // 24364
A=M // 24365
A=M+1 // 24366
D=M // 24367
@SP // 24368
AM=M+1 // 24369
A=A-1 // 24370
M=D // 24371
@128 // 24372
D=A // 24373
@SP // 24374
AM=M+1 // 24375
A=A-1 // 24376
M=D // 24377
// call Math.multiply
@7 // 24378
D=A // 24379
@14 // 24380
M=D // 24381
@Math.multiply // 24382
D=A // 24383
@13 // 24384
M=D // 24385
@Number.frac_to_i16.ret.4 // 24386
D=A // 24387
@CALL // 24388
0;JMP // 24389
(Number.frac_to_i16.ret.4)
@LCL // 24390
A=M // 24391
A=M // 24392
D=M // 24393
@SP // 24394
AM=M+1 // 24395
A=A-1 // 24396
M=D // 24397
@2 // 24398
D=A // 24399
@SP // 24400
AM=M+1 // 24401
A=A-1 // 24402
M=D // 24403
// call Math.divide
@7 // 24404
D=A // 24405
@14 // 24406
M=D // 24407
@Math.divide // 24408
D=A // 24409
@13 // 24410
M=D // 24411
@Number.frac_to_i16.ret.5 // 24412
D=A // 24413
@CALL // 24414
0;JMP // 24415
(Number.frac_to_i16.ret.5)
@SP // 24416
AM=M-1 // 24417
D=M // 24418
@SP // 24419
AM=M-1 // 24420
D=D+M // 24421
@SP // 24422
AM=M+1 // 24423
A=A-1 // 24424
M=D // 24425
@RETURN // 24426
0;JMP // 24427

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

@ARG // 24428
A=M // 24429
D=M // 24430
@3 // 24431
M=D // 24432

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24433
A=M // 24434
D=M // 24435
@SP // 24436
AM=M+1 // 24437
A=A-1 // 24438
M=D // 24439
@ARG // 24440
A=M+1 // 24441
D=M // 24442
@SP // 24443
AM=M+1 // 24444
A=A-1 // 24445
M=D // 24446
// call Number.do_mul
@7 // 24447
D=A // 24448
@14 // 24449
M=D // 24450
@Number.do_mul // 24451
D=A // 24452
@13 // 24453
M=D // 24454
@Vec3.do_scale.ret.0 // 24455
D=A // 24456
@CALL // 24457
0;JMP // 24458
(Vec3.do_scale.ret.0)
@SP // 24459
M=M-1 // 24460

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24461
A=M+1 // 24462
D=M // 24463
@SP // 24464
AM=M+1 // 24465
A=A-1 // 24466
M=D // 24467
@ARG // 24468
A=M+1 // 24469
D=M // 24470
@SP // 24471
AM=M+1 // 24472
A=A-1 // 24473
M=D // 24474
// call Number.do_mul
@7 // 24475
D=A // 24476
@14 // 24477
M=D // 24478
@Number.do_mul // 24479
D=A // 24480
@13 // 24481
M=D // 24482
@Vec3.do_scale.ret.1 // 24483
D=A // 24484
@CALL // 24485
0;JMP // 24486
(Vec3.do_scale.ret.1)
@SP // 24487
M=M-1 // 24488

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("argument 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24489
A=M+1 // 24490
A=A+1 // 24491
D=M // 24492
@SP // 24493
AM=M+1 // 24494
A=A-1 // 24495
M=D // 24496
@ARG // 24497
A=M+1 // 24498
D=M // 24499
@SP // 24500
AM=M+1 // 24501
A=A-1 // 24502
M=D // 24503
// call Number.do_mul
@7 // 24504
D=A // 24505
@14 // 24506
M=D // 24507
@Number.do_mul // 24508
D=A // 24509
@13 // 24510
M=D // 24511
@Vec3.do_scale.ret.2 // 24512
D=A // 24513
@CALL // 24514
0;JMP // 24515
(Vec3.do_scale.ret.2)
@SP // 24516
M=M-1 // 24517

////PushInstruction("constant 0")
@SP // 24518
AM=M+1 // 24519
A=A-1 // 24520
M=0 // 24521
@RETURN // 24522
0;JMP // 24523

////FunctionInstruction{functionName='Scene.getNumLights', numLocals=0, funcMapping={Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.getNumLights with 0
(Scene.getNumLights)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24524
A=M // 24525
D=M // 24526
@3 // 24527
M=D // 24528

////PushInstruction("this 8")
@RETURN_PUSH_LABEL_145 // 24529
D=A // 24530
@13 // 24531
M=D // 24532
@8 // 24533
D=A // 24534
@THIS_PUSH // 24535
0;JMP // 24536
(RETURN_PUSH_LABEL_145)
@RETURN // 24537
0;JMP // 24538

////FunctionInstruction{functionName='Intersection.new', numLocals=0, funcMapping={Intersection.dispose=2}}
// function Intersection.new with 0
(Intersection.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 24539
D=A // 24540
@SP // 24541
AM=M+1 // 24542
A=A-1 // 24543
M=D // 24544
// call Memory.alloc
@6 // 24545
D=A // 24546
@14 // 24547
M=D // 24548
@Memory.alloc // 24549
D=A // 24550
@13 // 24551
M=D // 24552
@Intersection.new.ret.0 // 24553
D=A // 24554
@CALL // 24555
0;JMP // 24556
(Intersection.new.ret.0)
@SP // 24557
AM=M-1 // 24558
D=M // 24559
@3 // 24560
M=D // 24561

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

@Intersection.0 // 24562
M=M+1 // 24563

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 24564
A=M // 24565
D=M // 24566
@THIS // 24567
A=M // 24568
M=D // 24569

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 24570
A=M+1 // 24571
D=M // 24572
@THIS // 24573
A=M+1 // 24574
M=D // 24575

////PushInstruction("pointer 0")
@3 // 24576
D=M // 24577
@SP // 24578
AM=M+1 // 24579
A=A-1 // 24580
M=D // 24581
@RETURN // 24582
0;JMP // 24583

////FunctionInstruction{functionName='Number.getV', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.is_less_than=2, Number.do_neg=1}}
// function Number.getV with 0
(Number.getV)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24584
A=M // 24585
D=M // 24586
@3 // 24587
M=D // 24588

////PushInstruction("this 0")
@THIS // 24589
A=M // 24590
D=M // 24591
@SP // 24592
AM=M+1 // 24593
A=A-1 // 24594
M=D // 24595
@RETURN // 24596
0;JMP // 24597

////FunctionInstruction{functionName='Int32.do_mul', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_mul with 0
(Int32.do_mul)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24598
A=M // 24599
D=M // 24600
@3 // 24601
M=D // 24602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("argument 1"), PushInstruction("constant 0")], call=CallInstruction{Int32.do_mul_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 24603
D=M // 24604
@SP // 24605
AM=M+1 // 24606
A=A-1 // 24607
M=D // 24608
@2 // 24609
D=A // 24610
@SP // 24611
M=D+M // 24612
@ARG // 24613
A=M+1 // 24614
D=M // 24615
@SP // 24616
A=M-1 // 24617
M=D // 24618
A=A-1 // 24619
M=0 // 24620
// call Int32.do_mul_right_shift_bytes
@8 // 24621
D=A // 24622
@14 // 24623
M=D // 24624
@Int32.do_mul_right_shift_bytes // 24625
D=A // 24626
@13 // 24627
M=D // 24628
@Int32.do_mul.ret.0 // 24629
D=A // 24630
@CALL // 24631
0;JMP // 24632
(Int32.do_mul.ret.0)
@SP // 24633
M=M-1 // 24634

////PushInstruction("constant 0")
@SP // 24635
AM=M+1 // 24636
A=A-1 // 24637
M=0 // 24638
@RETURN // 24639
0;JMP // 24640

////FunctionInstruction{functionName='Vec3.getX', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.new=1}}
// function Vec3.getX with 0
(Vec3.getX)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24641
A=M // 24642
D=M // 24643
@3 // 24644
M=D // 24645

////PushInstruction("this 0")
@THIS // 24646
A=M // 24647
D=M // 24648
@SP // 24649
AM=M+1 // 24650
A=A-1 // 24651
M=D // 24652
@RETURN // 24653
0;JMP // 24654

////FunctionInstruction{functionName='Int32.nlz_u4', numLocals=2, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.nlz_u4 with 2
(Int32.nlz_u4)
@SP // 24655
M=M+1 // 24656
AM=M+1 // 24657
A=A-1 // 24658
M=0 // 24659
A=A-1 // 24660
M=0 // 24661

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24662
A=M // 24663
M=0 // 24664

////PushPopPair {
//  push: PushInstruction("constant 3")
//  pop:  PopInstruction{address=local 1}
//}

@3 // 24665
D=A // 24666
@LCL // 24667
A=M+1 // 24668
M=D // 24669

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
@Int32.nlz_u4.LT.86 // 24670
D=A // 24671
@SP // 24672
AM=M+1 // 24673
A=A-1 // 24674
M=D // 24675
@LCL // 24676
A=M+1 // 24677
D=M // 24678
@DO_LT // 24679
0;JMP // 24680
(Int32.nlz_u4.LT.86)
@Int32.nlz_u4_WHILE_END1 // 24681
D;JNE // 24682

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1")], call=CallInstruction{Int32.arith_rightshift}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Int32.nlz_u4$IF_TRUE1}}
@Int32.nlz_u4.EQ.87 // 24683
D=A // 24684
@SP // 24685
AM=M+1 // 24686
A=A-1 // 24687
M=D // 24688
@ARG // 24689
A=M // 24690
D=M // 24691
@SP // 24692
AM=M+1 // 24693
A=A-1 // 24694
M=D // 24695
@LCL // 24696
A=M+1 // 24697
D=M // 24698
@SP // 24699
AM=M+1 // 24700
A=A-1 // 24701
M=D // 24702
// call Int32.arith_rightshift
@7 // 24703
D=A // 24704
@14 // 24705
M=D // 24706
@Int32.arith_rightshift // 24707
D=A // 24708
@13 // 24709
M=D // 24710
@Int32.nlz_u4.ret.0 // 24711
D=A // 24712
@CALL // 24713
0;JMP // 24714
(Int32.nlz_u4.ret.0)
@SP // 24715
AM=M-1 // 24716
D=M // 24717
@DO_EQ // 24718
0;JMP // 24719
(Int32.nlz_u4.EQ.87)
@Int32.nlz_u4$IF_TRUE1 // 24720
D;JNE // 24721

////GotoInstruction{label='Int32.nlz_u4$IF_FALSE1}
// goto Int32.nlz_u4$IF_FALSE1
@Int32.nlz_u4$IF_FALSE1 // 24722
0;JMP // 24723

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

@LCL // 24724
A=M // 24725
M=M+1 // 24726

////GotoInstruction{label='Int32.nlz_u4$IF_END1}
// goto Int32.nlz_u4$IF_END1
@Int32.nlz_u4$IF_END1 // 24727
0;JMP // 24728

////LabelInstruction{label='Int32.nlz_u4$IF_FALSE1}
// label Int32.nlz_u4$IF_FALSE1
(Int32.nlz_u4$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 24729
A=M+1 // 24730
M=-1 // 24731

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

@LCL // 24732
A=M+1 // 24733
M=M-1 // 24734

////GotoInstruction{label='Int32.nlz_u4_WHILE_EXP1}
// goto Int32.nlz_u4_WHILE_EXP1
@Int32.nlz_u4_WHILE_EXP1 // 24735
0;JMP // 24736

////LabelInstruction{label='Int32.nlz_u4_WHILE_END1}
// label Int32.nlz_u4_WHILE_END1
(Int32.nlz_u4_WHILE_END1)

////PushInstruction("local 0")
@LCL // 24737
A=M // 24738
D=M // 24739
@SP // 24740
AM=M+1 // 24741
A=A-1 // 24742
M=D // 24743
@RETURN // 24744
0;JMP // 24745

////FunctionInstruction{functionName='Vec3.getY', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1}}
// function Vec3.getY with 0
(Vec3.getY)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24746
A=M // 24747
D=M // 24748
@3 // 24749
M=D // 24750

////PushInstruction("this 1")
@THIS // 24751
A=M+1 // 24752
D=M // 24753
@SP // 24754
AM=M+1 // 24755
A=A-1 // 24756
M=D // 24757
@RETURN // 24758
0;JMP // 24759

////FunctionInstruction{functionName='Scene.dispose', numLocals=3, funcMapping={Scene.getNumLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20}}
// function Scene.dispose with 3
(Scene.dispose)
@3 // 24760
D=A // 24761
@SP // 24762
AM=D+M // 24763
A=A-1 // 24764
M=0 // 24765
A=A-1 // 24766
M=0 // 24767
A=A-1 // 24768
M=0 // 24769

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 24770
A=M // 24771
D=M // 24772
@3 // 24773
M=D // 24774

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24775
A=M // 24776
M=0 // 24777

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
@Scene.dispose.LT.88 // 24778
D=A // 24779
@SP // 24780
AM=M+1 // 24781
A=A-1 // 24782
M=D // 24783
@LCL // 24784
A=M // 24785
D=M // 24786
@SP // 24787
AM=M+1 // 24788
A=A-1 // 24789
M=D // 24790
@THIS // 24791
D=M // 24792
@6 // 24793
A=D+A // 24794
D=M // 24795
@SP // 24796
AM=M-1 // 24797
D=M-D // 24798
@DO_LT // 24799
0;JMP // 24800
(Scene.dispose.LT.88)
D=!D // 24801
@Scene.dispose_WHILE_END1 // 24802
D;JNE // 24803

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

@RETURN_PUSH_LABEL_146 // 24804
D=A // 24805
@13 // 24806
M=D // 24807
@5 // 24808
D=A // 24809
@THIS_PUSH // 24810
0;JMP // 24811
(RETURN_PUSH_LABEL_146)
@LCL // 24812
A=M // 24813
D=M // 24814
@SP // 24815
AM=M-1 // 24816
A=D+M // 24817
D=M // 24818
@LCL // 24819
A=M+1 // 24820
M=D // 24821

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Element.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 24822
A=M+1 // 24823
D=M // 24824
@SP // 24825
AM=M+1 // 24826
A=A-1 // 24827
M=D // 24828
// call Element.dispose
@6 // 24829
D=A // 24830
@14 // 24831
M=D // 24832
@Element.dispose // 24833
D=A // 24834
@13 // 24835
M=D // 24836
@Scene.dispose.ret.0 // 24837
D=A // 24838
@CALL // 24839
0;JMP // 24840
(Scene.dispose.ret.0)
@SP // 24841
M=M-1 // 24842

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

@LCL // 24843
A=M // 24844
M=M+1 // 24845

////GotoInstruction{label='Scene.dispose_WHILE_EXP1}
// goto Scene.dispose_WHILE_EXP1
@Scene.dispose_WHILE_EXP1 // 24846
0;JMP // 24847

////LabelInstruction{label='Scene.dispose_WHILE_END1}
// label Scene.dispose_WHILE_END1
(Scene.dispose_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_147 // 24848
D=A // 24849
@13 // 24850
M=D // 24851
@5 // 24852
D=A // 24853
@THIS_PUSH // 24854
0;JMP // 24855
(RETURN_PUSH_LABEL_147)
// call Memory.deAlloc
@6 // 24856
D=A // 24857
@14 // 24858
M=D // 24859
@Memory.deAlloc // 24860
D=A // 24861
@13 // 24862
M=D // 24863
@Scene.dispose.ret.1 // 24864
D=A // 24865
@CALL // 24866
0;JMP // 24867
(Scene.dispose.ret.1)
@SP // 24868
M=M-1 // 24869

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 24870
A=M // 24871
M=0 // 24872

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
@Scene.dispose.LT.89 // 24873
D=A // 24874
@SP // 24875
AM=M+1 // 24876
A=A-1 // 24877
M=D // 24878
@LCL // 24879
A=M // 24880
D=M // 24881
@SP // 24882
AM=M+1 // 24883
A=A-1 // 24884
M=D // 24885
@THIS // 24886
D=M // 24887
@8 // 24888
A=D+A // 24889
D=M // 24890
@SP // 24891
AM=M-1 // 24892
D=M-D // 24893
@DO_LT // 24894
0;JMP // 24895
(Scene.dispose.LT.89)
D=!D // 24896
@Scene.dispose_WHILE_END2 // 24897
D;JNE // 24898

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

@RETURN_PUSH_LABEL_148 // 24899
D=A // 24900
@13 // 24901
M=D // 24902
@7 // 24903
D=A // 24904
@THIS_PUSH // 24905
0;JMP // 24906
(RETURN_PUSH_LABEL_148)
@LCL // 24907
A=M // 24908
D=M // 24909
@SP // 24910
AM=M-1 // 24911
A=D+M // 24912
D=M // 24913
@LCL // 24914
A=M+1 // 24915
A=A+1 // 24916
M=D // 24917

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{DirectionalLight.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 24918
A=M+1 // 24919
A=A+1 // 24920
D=M // 24921
@SP // 24922
AM=M+1 // 24923
A=A-1 // 24924
M=D // 24925
// call DirectionalLight.dispose
@6 // 24926
D=A // 24927
@14 // 24928
M=D // 24929
@DirectionalLight.dispose // 24930
D=A // 24931
@13 // 24932
M=D // 24933
@Scene.dispose.ret.2 // 24934
D=A // 24935
@CALL // 24936
0;JMP // 24937
(Scene.dispose.ret.2)
@SP // 24938
M=M-1 // 24939

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

@LCL // 24940
A=M // 24941
M=M+1 // 24942

////GotoInstruction{label='Scene.dispose_WHILE_EXP2}
// goto Scene.dispose_WHILE_EXP2
@Scene.dispose_WHILE_EXP2 // 24943
0;JMP // 24944

////LabelInstruction{label='Scene.dispose_WHILE_END2}
// label Scene.dispose_WHILE_END2
(Scene.dispose_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_149 // 24945
D=A // 24946
@13 // 24947
M=D // 24948
@7 // 24949
D=A // 24950
@THIS_PUSH // 24951
0;JMP // 24952
(RETURN_PUSH_LABEL_149)
// call Memory.deAlloc
@6 // 24953
D=A // 24954
@14 // 24955
M=D // 24956
@Memory.deAlloc // 24957
D=A // 24958
@13 // 24959
M=D // 24960
@Scene.dispose.ret.3 // 24961
D=A // 24962
@CALL // 24963
0;JMP // 24964
(Scene.dispose.ret.3)
@SP // 24965
M=M-1 // 24966

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24967
A=M+1 // 24968
A=A+1 // 24969
D=M // 24970
@SP // 24971
AM=M+1 // 24972
A=A-1 // 24973
M=D // 24974
// call Number.dispose
@6 // 24975
D=A // 24976
@14 // 24977
M=D // 24978
@Number.dispose // 24979
D=A // 24980
@13 // 24981
M=D // 24982
@Scene.dispose.ret.4 // 24983
D=A // 24984
@CALL // 24985
0;JMP // 24986
(Scene.dispose.ret.4)
@SP // 24987
M=M-1 // 24988

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 24989
A=M+1 // 24990
A=A+1 // 24991
A=A+1 // 24992
D=M // 24993
@SP // 24994
AM=M+1 // 24995
A=A-1 // 24996
M=D // 24997
// call Number.dispose
@6 // 24998
D=A // 24999
@14 // 25000
M=D // 25001
@Number.dispose // 25002
D=A // 25003
@13 // 25004
M=D // 25005
@Scene.dispose.ret.5 // 25006
D=A // 25007
@CALL // 25008
0;JMP // 25009
(Scene.dispose.ret.5)
@SP // 25010
M=M-1 // 25011

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_150 // 25012
D=A // 25013
@13 // 25014
M=D // 25015
@4 // 25016
D=A // 25017
@THIS_PUSH // 25018
0;JMP // 25019
(RETURN_PUSH_LABEL_150)
// call Number.dispose
@6 // 25020
D=A // 25021
@14 // 25022
M=D // 25023
@Number.dispose // 25024
D=A // 25025
@13 // 25026
M=D // 25027
@Scene.dispose.ret.6 // 25028
D=A // 25029
@CALL // 25030
0;JMP // 25031
(Scene.dispose.ret.6)
@SP // 25032
M=M-1 // 25033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 25034
D=M // 25035
@SP // 25036
AM=M+1 // 25037
A=A-1 // 25038
M=D // 25039
// call Memory.deAlloc
@6 // 25040
D=A // 25041
@14 // 25042
M=D // 25043
@Memory.deAlloc // 25044
D=A // 25045
@13 // 25046
M=D // 25047
@Scene.dispose.ret.7 // 25048
D=A // 25049
@CALL // 25050
0;JMP // 25051
(Scene.dispose.ret.7)
@SP // 25052
M=M-1 // 25053

////PushInstruction("constant 0")
@SP // 25054
AM=M+1 // 25055
A=A-1 // 25056
M=0 // 25057
@RETURN // 25058
0;JMP // 25059

////FunctionInstruction{functionName='Vec3.getZ', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0}}
// function Vec3.getZ with 0
(Vec3.getZ)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25060
A=M // 25061
D=M // 25062
@3 // 25063
M=D // 25064

////PushInstruction("this 2")
@THIS // 25065
A=M+1 // 25066
A=A+1 // 25067
D=M // 25068
@SP // 25069
AM=M+1 // 25070
A=A-1 // 25071
M=D // 25072
@RETURN // 25073
0;JMP // 25074

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 25075
AM=M+1 // 25076
A=A-1 // 25077
M=0 // 25078

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{String.new}}
//  pop:  PopInstruction{address=local 0}
//}

@10 // 25079
D=A // 25080
@SP // 25081
AM=M+1 // 25082
A=A-1 // 25083
M=D // 25084
// call String.new
@6 // 25085
D=A // 25086
@14 // 25087
M=D // 25088
@String.new // 25089
D=A // 25090
@13 // 25091
M=D // 25092
@Output.printInt.ret.0 // 25093
D=A // 25094
@CALL // 25095
0;JMP // 25096
(Output.printInt.ret.0)
@SP // 25097
AM=M-1 // 25098
D=M // 25099
@LCL // 25100
A=M // 25101
M=D // 25102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 0")], call=CallInstruction{String.setInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25103
A=M // 25104
D=M // 25105
@SP // 25106
AM=M+1 // 25107
A=A-1 // 25108
M=D // 25109
@ARG // 25110
A=M // 25111
D=M // 25112
@SP // 25113
AM=M+1 // 25114
A=A-1 // 25115
M=D // 25116
// call String.setInt
@7 // 25117
D=A // 25118
@14 // 25119
M=D // 25120
@String.setInt // 25121
D=A // 25122
@13 // 25123
M=D // 25124
@Output.printInt.ret.1 // 25125
D=A // 25126
@CALL // 25127
0;JMP // 25128
(Output.printInt.ret.1)
@SP // 25129
M=M-1 // 25130

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25131
A=M // 25132
D=M // 25133
@SP // 25134
AM=M+1 // 25135
A=A-1 // 25136
M=D // 25137
// call Output.printString
@6 // 25138
D=A // 25139
@14 // 25140
M=D // 25141
@Output.printString // 25142
D=A // 25143
@13 // 25144
M=D // 25145
@Output.printInt.ret.2 // 25146
D=A // 25147
@CALL // 25148
0;JMP // 25149
(Output.printInt.ret.2)
@SP // 25150
M=M-1 // 25151

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25152
A=M // 25153
D=M // 25154
@SP // 25155
AM=M+1 // 25156
A=A-1 // 25157
M=D // 25158
// call String.dispose
@6 // 25159
D=A // 25160
@14 // 25161
M=D // 25162
@String.dispose // 25163
D=A // 25164
@13 // 25165
M=D // 25166
@Output.printInt.ret.3 // 25167
D=A // 25168
@CALL // 25169
0;JMP // 25170
(Output.printInt.ret.3)
@SP // 25171
M=M-1 // 25172

////PushInstruction("constant 0")
@SP // 25173
AM=M+1 // 25174
A=A-1 // 25175
M=0 // 25176
@RETURN // 25177
0;JMP // 25178

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.copy=0, Memory.add_node=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 25179
D=A // 25180
@SP // 25181
AM=D+M // 25182
A=A-1 // 25183
M=0 // 25184
A=A-1 // 25185
M=0 // 25186
A=A-1 // 25187
M=0 // 25188
A=A-1 // 25189
M=0 // 25190
A=A-1 // 25191
M=0 // 25192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 25193
A=M // 25194
D=M // 25195
@SP // 25196
AM=M+1 // 25197
A=A-1 // 25198
M=D // 25199
// call Memory.getBinIndex
@6 // 25200
D=A // 25201
@14 // 25202
M=D // 25203
@Memory.getBinIndex // 25204
D=A // 25205
@13 // 25206
M=D // 25207
@Memory.alloc.ret.0 // 25208
D=A // 25209
@CALL // 25210
0;JMP // 25211
(Memory.alloc.ret.0)
@SP // 25212
AM=M-1 // 25213
D=M // 25214
@LCL // 25215
A=M // 25216
M=D // 25217

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

@LCL // 25218
A=M // 25219
D=M // 25220
@2048 // 25221
D=D+A // 25222
@LCL // 25223
A=M+1 // 25224
M=D // 25225

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 25226
A=M+1 // 25227
D=M // 25228
@SP // 25229
AM=M+1 // 25230
A=A-1 // 25231
M=D // 25232
@ARG // 25233
A=M // 25234
D=M // 25235
@SP // 25236
AM=M+1 // 25237
A=A-1 // 25238
M=D // 25239
// call Memory.get_best_fit
@7 // 25240
D=A // 25241
@14 // 25242
M=D // 25243
@Memory.get_best_fit // 25244
D=A // 25245
@13 // 25246
M=D // 25247
@Memory.alloc.ret.1 // 25248
D=A // 25249
@CALL // 25250
0;JMP // 25251
(Memory.alloc.ret.1)
@SP // 25252
AM=M-1 // 25253
D=M // 25254
@LCL // 25255
A=M+1 // 25256
A=A+1 // 25257
M=D // 25258

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
@Memory.alloc.EQ.90 // 25259
D=A // 25260
@SP // 25261
AM=M+1 // 25262
A=A-1 // 25263
M=D // 25264
@LCL // 25265
A=M+1 // 25266
A=A+1 // 25267
D=M // 25268
@DO_EQ // 25269
0;JMP // 25270
(Memory.alloc.EQ.90)
D=!D // 25271
@Memory.alloc_WHILE_END1 // 25272
D;JNE // 25273

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
@Memory.alloc.LT.91 // 25274
D=A // 25275
@SP // 25276
AM=M+1 // 25277
A=A-1 // 25278
M=D // 25279
@LCL // 25280
A=M // 25281
D=M // 25282
D=D+1 // 25283
@7 // 25284
D=D-A // 25285
@DO_LT // 25286
0;JMP // 25287
(Memory.alloc.LT.91)
D=!D // 25288
@Memory.alloc$IF_TRUE1 // 25289
D;JNE // 25290

////GotoInstruction{label='Memory.alloc$IF_END1}
// goto Memory.alloc$IF_END1
@Memory.alloc$IF_END1 // 25291
0;JMP // 25292

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 10")], call=CallInstruction{Sys.error}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 25293
D=A // 25294
@SP // 25295
AM=M+1 // 25296
A=A-1 // 25297
M=D // 25298
// call Sys.error
@6 // 25299
D=A // 25300
@14 // 25301
M=D // 25302
@Sys.error // 25303
D=A // 25304
@13 // 25305
M=D // 25306
@Memory.alloc.ret.2 // 25307
D=A // 25308
@CALL // 25309
0;JMP // 25310
(Memory.alloc.ret.2)
@SP // 25311
M=M-1 // 25312

////PushInstruction("constant 0")
@SP // 25313
AM=M+1 // 25314
A=A-1 // 25315
M=0 // 25316
@RETURN // 25317
0;JMP // 25318

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

@LCL // 25319
A=M // 25320
M=M+1 // 25321

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

@LCL // 25322
A=M // 25323
D=M // 25324
@2048 // 25325
D=D+A // 25326
@LCL // 25327
A=M+1 // 25328
M=D // 25329

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 25330
A=M+1 // 25331
D=M // 25332
@SP // 25333
AM=M+1 // 25334
A=A-1 // 25335
M=D // 25336
@ARG // 25337
A=M // 25338
D=M // 25339
@SP // 25340
AM=M+1 // 25341
A=A-1 // 25342
M=D // 25343
// call Memory.get_best_fit
@7 // 25344
D=A // 25345
@14 // 25346
M=D // 25347
@Memory.get_best_fit // 25348
D=A // 25349
@13 // 25350
M=D // 25351
@Memory.alloc.ret.3 // 25352
D=A // 25353
@CALL // 25354
0;JMP // 25355
(Memory.alloc.ret.3)
@SP // 25356
AM=M-1 // 25357
D=M // 25358
@LCL // 25359
A=M+1 // 25360
A=A+1 // 25361
M=D // 25362

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 25363
0;JMP // 25364

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

@LCL // 25365
A=M+1 // 25366
A=A+1 // 25367
A=M // 25368
D=M // 25369
@SP // 25370
AM=M+1 // 25371
A=A-1 // 25372
M=D // 25373
// call Memory.getBinIndex
@6 // 25374
D=A // 25375
@14 // 25376
M=D // 25377
@Memory.getBinIndex // 25378
D=A // 25379
@13 // 25380
M=D // 25381
@Memory.alloc.ret.4 // 25382
D=A // 25383
@CALL // 25384
0;JMP // 25385
(Memory.alloc.ret.4)
@SP // 25386
AM=M-1 // 25387
D=M // 25388
@2048 // 25389
D=D+A // 25390
@SP // 25391
AM=M+1 // 25392
A=A-1 // 25393
M=D // 25394
@LCL // 25395
A=M+1 // 25396
A=A+1 // 25397
D=M // 25398
@SP // 25399
AM=M+1 // 25400
A=A-1 // 25401
M=D // 25402
// call Memory.remove_node
@7 // 25403
D=A // 25404
@14 // 25405
M=D // 25406
@Memory.remove_node // 25407
D=A // 25408
@13 // 25409
M=D // 25410
@Memory.alloc.ret.5 // 25411
D=A // 25412
@CALL // 25413
0;JMP // 25414
(Memory.alloc.ret.5)
@SP // 25415
M=M-1 // 25416

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

@LCL // 25417
A=M+1 // 25418
A=A+1 // 25419
A=M // 25420
D=M // 25421
@SP // 25422
AM=M+1 // 25423
A=A-1 // 25424
M=D // 25425
@ARG // 25426
A=M // 25427
D=M // 25428
@SP // 25429
AM=M-1 // 25430
D=M-D // 25431
@LCL // 25432
A=M+1 // 25433
A=A+1 // 25434
A=A+1 // 25435
M=D // 25436

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.92 // 25437
D=A // 25438
@SP // 25439
AM=M+1 // 25440
A=A-1 // 25441
M=D // 25442
@LCL // 25443
A=M+1 // 25444
A=A+1 // 25445
A=A+1 // 25446
D=M // 25447
@5 // 25448
D=D-A // 25449
@DO_GT // 25450
0;JMP // 25451
(Memory.alloc.GT.92)
@Memory.alloc$IF_TRUE2 // 25452
D;JNE // 25453

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 25454
0;JMP // 25455

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
@LCL // 25456
A=M+1 // 25457
A=A+1 // 25458
D=M // 25459
@0 // 25460
D=D+A // 25461
@SP // 25462
AM=M+1 // 25463
A=A-1 // 25464
M=D // 25465
@ARG // 25466
A=M // 25467
D=M // 25468
@SP // 25469
AM=M-1 // 25470
A=M // 25471
M=D // 25472

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 25473
A=M+1 // 25474
A=A+1 // 25475
D=M // 25476
D=D+1 // 25477
@SP // 25478
AM=M+1 // 25479
A=A-1 // 25480
M=D // 25481
D=0 // 25482
@SP // 25483
AM=M-1 // 25484
A=M // 25485
M=D // 25486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25487
A=M+1 // 25488
A=A+1 // 25489
D=M // 25490
@SP // 25491
AM=M+1 // 25492
A=A-1 // 25493
M=D // 25494
// call Memory.create_foot
@6 // 25495
D=A // 25496
@14 // 25497
M=D // 25498
@Memory.create_foot // 25499
D=A // 25500
@13 // 25501
M=D // 25502
@Memory.alloc.ret.6 // 25503
D=A // 25504
@CALL // 25505
0;JMP // 25506
(Memory.alloc.ret.6)
@SP // 25507
M=M-1 // 25508

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

@LCL // 25509
A=M+1 // 25510
A=A+1 // 25511
D=M // 25512
@ARG // 25513
A=M // 25514
D=D+M // 25515
@5 // 25516
D=D+A // 25517
@SP // 25518
AM=M+1 // 25519
A=A-1 // 25520
M=D // 25521
@LCL // 25522
D=M // 25523
@4 // 25524
A=D+A // 25525
D=A // 25526
@R13 // 25527
M=D // 25528
@SP // 25529
AM=M-1 // 25530
D=M // 25531
@R13 // 25532
A=M // 25533
M=D // 25534

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
@LCL // 25535
D=M // 25536
@4 // 25537
A=D+A // 25538
D=M // 25539
@0 // 25540
D=D+A // 25541
@SP // 25542
AM=M+1 // 25543
A=A-1 // 25544
M=D // 25545
@LCL // 25546
A=M+1 // 25547
A=A+1 // 25548
A=A+1 // 25549
D=M // 25550
@5 // 25551
D=D-A // 25552
@SP // 25553
AM=M-1 // 25554
A=M // 25555
M=D // 25556

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 25557
D=M // 25558
@4 // 25559
A=D+A // 25560
D=M // 25561
D=D+1 // 25562
@SP // 25563
AM=M+1 // 25564
A=A-1 // 25565
M=D // 25566
D=1 // 25567
@SP // 25568
AM=M-1 // 25569
A=M // 25570
M=D // 25571

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_151 // 25572
D=A // 25573
@13 // 25574
M=D // 25575
@4 // 25576
D=A // 25577
@LCL_PUSH // 25578
0;JMP // 25579
(RETURN_PUSH_LABEL_151)
// call Memory.create_foot
@6 // 25580
D=A // 25581
@14 // 25582
M=D // 25583
@Memory.create_foot // 25584
D=A // 25585
@13 // 25586
M=D // 25587
@Memory.alloc.ret.7 // 25588
D=A // 25589
@CALL // 25590
0;JMP // 25591
(Memory.alloc.ret.7)
@SP // 25592
M=M-1 // 25593

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

@LCL // 25594
A=M+1 // 25595
A=A+1 // 25596
A=A+1 // 25597
D=M // 25598
@SP // 25599
AM=M+1 // 25600
A=A-1 // 25601
M=D // 25602
// call Memory.getBinIndex
@6 // 25603
D=A // 25604
@14 // 25605
M=D // 25606
@Memory.getBinIndex // 25607
D=A // 25608
@13 // 25609
M=D // 25610
@Memory.alloc.ret.8 // 25611
D=A // 25612
@CALL // 25613
0;JMP // 25614
(Memory.alloc.ret.8)
@SP // 25615
AM=M-1 // 25616
D=M // 25617
@2048 // 25618
D=D+A // 25619
@SP // 25620
AM=M+1 // 25621
A=A-1 // 25622
M=D // 25623
@RETURN_PUSH_LABEL_152 // 25624
D=A // 25625
@13 // 25626
M=D // 25627
@4 // 25628
D=A // 25629
@LCL_PUSH // 25630
0;JMP // 25631
(RETURN_PUSH_LABEL_152)
// call Memory.add_node
@7 // 25632
D=A // 25633
@14 // 25634
M=D // 25635
@Memory.add_node // 25636
D=A // 25637
@13 // 25638
M=D // 25639
@Memory.alloc.ret.9 // 25640
D=A // 25641
@CALL // 25642
0;JMP // 25643
(Memory.alloc.ret.9)
@SP // 25644
M=M-1 // 25645

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 25646
0;JMP // 25647

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
@LCL // 25648
A=M+1 // 25649
A=A+1 // 25650
D=M // 25651
D=D+1 // 25652
@SP // 25653
AM=M+1 // 25654
A=A-1 // 25655
M=D // 25656
D=0 // 25657
@SP // 25658
AM=M-1 // 25659
A=M // 25660
M=D // 25661

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 25662
A=M+1 // 25663
A=A+1 // 25664
D=M // 25665
@SP // 25666
AM=M+1 // 25667
A=A-1 // 25668
M=D // 25669
// call Memory.create_foot
@6 // 25670
D=A // 25671
@14 // 25672
M=D // 25673
@Memory.create_foot // 25674
D=A // 25675
@13 // 25676
M=D // 25677
@Memory.alloc.ret.10 // 25678
D=A // 25679
@CALL // 25680
0;JMP // 25681
(Memory.alloc.ret.10)
@SP // 25682
M=M-1 // 25683

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
@LCL // 25684
A=M+1 // 25685
A=A+1 // 25686
D=M // 25687
@4 // 25688
D=D+A // 25689
@SP // 25690
AM=M+1 // 25691
A=A-1 // 25692
M=D // 25693
@RETURN // 25694
0;JMP // 25695

////FunctionInstruction{functionName='Number.new_from_int32', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.new_from_int32 with 0
(Number.new_from_int32)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 25696
AM=M+1 // 25697
A=A-1 // 25698
M=1 // 25699
// call Memory.alloc
@6 // 25700
D=A // 25701
@14 // 25702
M=D // 25703
@Memory.alloc // 25704
D=A // 25705
@13 // 25706
M=D // 25707
@Number.new_from_int32.ret.0 // 25708
D=A // 25709
@CALL // 25710
0;JMP // 25711
(Number.new_from_int32.ret.0)
@SP // 25712
AM=M-1 // 25713
D=M // 25714
@3 // 25715
M=D // 25716

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

@Number.5 // 25717
M=M+1 // 25718

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 25719
A=M // 25720
D=M // 25721
@THIS // 25722
A=M // 25723
M=D // 25724

////PushInstruction("pointer 0")
@3 // 25725
D=M // 25726
@SP // 25727
AM=M+1 // 25728
A=A-1 // 25729
M=D // 25730
@RETURN // 25731
0;JMP // 25732

////FunctionInstruction{functionName='DirectionalLight.dispose', numLocals=0, funcMapping={DirectionalLight.getColor=0}}
// function DirectionalLight.dispose with 0
(DirectionalLight.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25733
A=M // 25734
D=M // 25735
@3 // 25736
M=D // 25737

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25738
A=M // 25739
D=M // 25740
@SP // 25741
AM=M+1 // 25742
A=A-1 // 25743
M=D // 25744
// call Vec3.dispose
@6 // 25745
D=A // 25746
@14 // 25747
M=D // 25748
@Vec3.dispose // 25749
D=A // 25750
@13 // 25751
M=D // 25752
@DirectionalLight.dispose.ret.0 // 25753
D=A // 25754
@CALL // 25755
0;JMP // 25756
(DirectionalLight.dispose.ret.0)
@SP // 25757
M=M-1 // 25758

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25759
A=M+1 // 25760
D=M // 25761
@SP // 25762
AM=M+1 // 25763
A=A-1 // 25764
M=D // 25765
// call Number.dispose
@6 // 25766
D=A // 25767
@14 // 25768
M=D // 25769
@Number.dispose // 25770
D=A // 25771
@13 // 25772
M=D // 25773
@DirectionalLight.dispose.ret.1 // 25774
D=A // 25775
@CALL // 25776
0;JMP // 25777
(DirectionalLight.dispose.ret.1)
@SP // 25778
M=M-1 // 25779

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 25780
D=M // 25781
@SP // 25782
AM=M+1 // 25783
A=A-1 // 25784
M=D // 25785
// call Memory.deAlloc
@6 // 25786
D=A // 25787
@14 // 25788
M=D // 25789
@Memory.deAlloc // 25790
D=A // 25791
@13 // 25792
M=D // 25793
@DirectionalLight.dispose.ret.2 // 25794
D=A // 25795
@CALL // 25796
0;JMP // 25797
(DirectionalLight.dispose.ret.2)
@SP // 25798
M=M-1 // 25799

////PushInstruction("constant 0")
@SP // 25800
AM=M+1 // 25801
A=A-1 // 25802
M=0 // 25803
@RETURN // 25804
0;JMP // 25805

////FunctionInstruction{functionName='Number.do_sqrt', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.do_sqrt with 0
(Number.do_sqrt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25806
A=M // 25807
D=M // 25808
@3 // 25809
M=D // 25810

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 1")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25811
A=M // 25812
D=M // 25813
@SP // 25814
AM=M+1 // 25815
A=A-1 // 25816
M=D // 25817
@Number.1 // 25818
D=M // 25819
@SP // 25820
AM=M+1 // 25821
A=A-1 // 25822
M=D // 25823
// call Int32.do_mul
@7 // 25824
D=A // 25825
@14 // 25826
M=D // 25827
@Int32.do_mul // 25828
D=A // 25829
@13 // 25830
M=D // 25831
@Number.do_sqrt.ret.0 // 25832
D=A // 25833
@CALL // 25834
0;JMP // 25835
(Number.do_sqrt.ret.0)
@SP // 25836
M=M-1 // 25837

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25838
A=M // 25839
D=M // 25840
@SP // 25841
AM=M+1 // 25842
A=A-1 // 25843
M=D // 25844
// call Int32.do_sqrt
@6 // 25845
D=A // 25846
@14 // 25847
M=D // 25848
@Int32.do_sqrt // 25849
D=A // 25850
@13 // 25851
M=D // 25852
@Number.do_sqrt.ret.1 // 25853
D=A // 25854
@CALL // 25855
0;JMP // 25856
(Number.do_sqrt.ret.1)
@SP // 25857
M=M-1 // 25858

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 2")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25859
A=M // 25860
D=M // 25861
@SP // 25862
AM=M+1 // 25863
A=A-1 // 25864
M=D // 25865
@Number.2 // 25866
D=M // 25867
@SP // 25868
AM=M+1 // 25869
A=A-1 // 25870
M=D // 25871
// call Int32.do_mul
@7 // 25872
D=A // 25873
@14 // 25874
M=D // 25875
@Int32.do_mul // 25876
D=A // 25877
@13 // 25878
M=D // 25879
@Number.do_sqrt.ret.2 // 25880
D=A // 25881
@CALL // 25882
0;JMP // 25883
(Number.do_sqrt.ret.2)
@SP // 25884
M=M-1 // 25885

////PushInstruction("constant 0")
@SP // 25886
AM=M+1 // 25887
A=A-1 // 25888
M=0 // 25889
@RETURN // 25890
0;JMP // 25891

////FunctionInstruction{functionName='Int32.getParts', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.getParts with 0
(Int32.getParts)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25892
A=M // 25893
D=M // 25894
@3 // 25895
M=D // 25896

////PushInstruction("this 0")
@THIS // 25897
A=M // 25898
D=M // 25899
@SP // 25900
AM=M+1 // 25901
A=A-1 // 25902
M=D // 25903
@RETURN // 25904
0;JMP // 25905

////FunctionInstruction{functionName='Sphere.color', numLocals=0, funcMapping={Sphere.new=1, Sphere.dispose=4}}
// function Sphere.color with 0
(Sphere.color)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25906
A=M // 25907
D=M // 25908
@3 // 25909
M=D // 25910

////CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
@THIS // 25911
A=M+1 // 25912
A=A+1 // 25913
D=M // 25914
@SP // 25915
AM=M+1 // 25916
A=A-1 // 25917
M=D // 25918
// call Number.clone
@6 // 25919
D=A // 25920
@14 // 25921
M=D // 25922
@Number.clone // 25923
D=A // 25924
@13 // 25925
M=D // 25926
@Sphere.color.ret.0 // 25927
D=A // 25928
@CALL // 25929
0;JMP // 25930
(Sphere.color.ret.0)
@RETURN // 25931
0;JMP // 25932

////FunctionInstruction{functionName='Number.do_sub', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1}}
// function Number.do_sub with 0
(Number.do_sub)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 25933
A=M // 25934
D=M // 25935
@3 // 25936
M=D // 25937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Number.getV}}], call=CallInstruction{Int32.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 25938
A=M // 25939
D=M // 25940
@SP // 25941
AM=M+1 // 25942
A=A-1 // 25943
M=D // 25944
@ARG // 25945
A=M+1 // 25946
D=M // 25947
@SP // 25948
AM=M+1 // 25949
A=A-1 // 25950
M=D // 25951
// call Number.getV
@6 // 25952
D=A // 25953
@14 // 25954
M=D // 25955
@Number.getV // 25956
D=A // 25957
@13 // 25958
M=D // 25959
@Number.do_sub.ret.0 // 25960
D=A // 25961
@CALL // 25962
0;JMP // 25963
(Number.do_sub.ret.0)
// call Int32.do_sub
@7 // 25964
D=A // 25965
@14 // 25966
M=D // 25967
@Int32.do_sub // 25968
D=A // 25969
@13 // 25970
M=D // 25971
@Number.do_sub.ret.1 // 25972
D=A // 25973
@CALL // 25974
0;JMP // 25975
(Number.do_sub.ret.1)
@SP // 25976
M=M-1 // 25977

////PushInstruction("constant 0")
@SP // 25978
AM=M+1 // 25979
A=A-1 // 25980
M=0 // 25981
@RETURN // 25982
0;JMP // 25983

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 25984
D=A // 25985
@SP // 25986
AM=M+1 // 25987
A=A-1 // 25988
M=D // 25989
// call Memory.alloc
@6 // 25990
D=A // 25991
@14 // 25992
M=D // 25993
@Memory.alloc // 25994
D=A // 25995
@13 // 25996
M=D // 25997
@String.new.ret.0 // 25998
D=A // 25999
@CALL // 26000
0;JMP // 26001
(String.new.ret.0)
@SP // 26002
AM=M-1 // 26003
D=M // 26004
@3 // 26005
M=D // 26006

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.93 // 26007
D=A // 26008
@SP // 26009
AM=M+1 // 26010
A=A-1 // 26011
M=D // 26012
@ARG // 26013
A=M // 26014
D=M // 26015
@DO_EQ // 26016
0;JMP // 26017
(String.new.EQ.93)
@String.new$IF_TRUE1 // 26018
D;JNE // 26019

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 26020
0;JMP // 26021

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 26022
A=M // 26023
M=0 // 26024

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 26025
0;JMP // 26026

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 26027
A=M // 26028
D=M // 26029
@SP // 26030
AM=M+1 // 26031
A=A-1 // 26032
M=D // 26033
// call Memory.alloc
@6 // 26034
D=A // 26035
@14 // 26036
M=D // 26037
@Memory.alloc // 26038
D=A // 26039
@13 // 26040
M=D // 26041
@String.new.ret.1 // 26042
D=A // 26043
@CALL // 26044
0;JMP // 26045
(String.new.ret.1)
@SP // 26046
AM=M-1 // 26047
D=M // 26048
@THIS // 26049
A=M // 26050
M=D // 26051

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 26052
A=M // 26053
D=M // 26054
@THIS // 26055
A=M+1 // 26056
A=A+1 // 26057
M=D // 26058

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 26059
A=M+1 // 26060
M=0 // 26061

////PushInstruction("pointer 0")
@3 // 26062
D=M // 26063
@SP // 26064
AM=M+1 // 26065
A=A-1 // 26066
M=D // 26067
@RETURN // 26068
0;JMP // 26069

////FunctionInstruction{functionName='Number.to_int32', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_div=5, Number.do_add=2, Number.getV=0, Number.is_less_than=2, Number.do_neg=1, Number.do_sub=2}}
// function Number.to_int32 with 0
(Number.to_int32)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26070
A=M // 26071
D=M // 26072
@3 // 26073
M=D // 26074

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

@Number.5 // 26075
M=M-1 // 26076

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2")], call=CallInstruction{Int32.do_right_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 26077
A=M // 26078
D=M // 26079
@SP // 26080
AM=M+1 // 26081
A=A-1 // 26082
M=D // 26083
@2 // 26084
D=A // 26085
@SP // 26086
AM=M+1 // 26087
A=A-1 // 26088
M=D // 26089
// call Int32.do_right_shift_bytes
@7 // 26090
D=A // 26091
@14 // 26092
M=D // 26093
@Int32.do_right_shift_bytes // 26094
D=A // 26095
@13 // 26096
M=D // 26097
@Number.to_int32.ret.0 // 26098
D=A // 26099
@CALL // 26100
0;JMP // 26101
(Number.to_int32.ret.0)
@SP // 26102
M=M-1 // 26103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 26104
D=M // 26105
@SP // 26106
AM=M+1 // 26107
A=A-1 // 26108
M=D // 26109
// call Memory.deAlloc
@6 // 26110
D=A // 26111
@14 // 26112
M=D // 26113
@Memory.deAlloc // 26114
D=A // 26115
@13 // 26116
M=D // 26117
@Number.to_int32.ret.1 // 26118
D=A // 26119
@CALL // 26120
0;JMP // 26121
(Number.to_int32.ret.1)
@SP // 26122
M=M-1 // 26123

////PushInstruction("this 0")
@THIS // 26124
A=M // 26125
D=M // 26126
@SP // 26127
AM=M+1 // 26128
A=A-1 // 26129
M=D // 26130
@RETURN // 26131
0;JMP // 26132

////FunctionInstruction{functionName='Intersection.getDistanceFromOrigin', numLocals=0, funcMapping={Intersection.new=1, Intersection.dispose=2}}
// function Intersection.getDistanceFromOrigin with 0
(Intersection.getDistanceFromOrigin)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26133
A=M // 26134
D=M // 26135
@3 // 26136
M=D // 26137

////PushInstruction("this 0")
@THIS // 26138
A=M // 26139
D=M // 26140
@SP // 26141
AM=M+1 // 26142
A=A-1 // 26143
M=D // 26144
@RETURN // 26145
0;JMP // 26146

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=4, funcMapping={Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 4
(Memory.deAlloc)
@4 // 26147
D=A // 26148
@SP // 26149
AM=D+M // 26150
A=A-1 // 26151
M=0 // 26152
A=A-1 // 26153
M=0 // 26154
A=A-1 // 26155
M=0 // 26156
A=A-1 // 26157
M=0 // 26158

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

@ARG // 26159
A=M // 26160
D=M // 26161
@4 // 26162
D=D-A // 26163
@LCL // 26164
A=M // 26165
M=D // 26166

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 26167
A=M // 26168
D=M // 26169
D=D+1 // 26170
@SP // 26171
AM=M+1 // 26172
A=A-1 // 26173
M=D // 26174
D=1 // 26175
@SP // 26176
AM=M-1 // 26177
A=M // 26178
M=D // 26179

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

@LCL // 26180
A=M // 26181
D=M // 26182
D=D-1 // 26183
@LCL // 26184
A=M+1 // 26185
A=A+1 // 26186
A=A+1 // 26187
M=D // 26188

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

@LCL // 26189
A=M+1 // 26190
A=A+1 // 26191
A=A+1 // 26192
A=M // 26193
D=M // 26194
@LCL // 26195
A=M+1 // 26196
M=D // 26197

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
@Memory.deAlloc.EQ.94 // 26198
D=A // 26199
@SP // 26200
AM=M+1 // 26201
A=A-1 // 26202
M=D // 26203
@Memory.deAlloc.LT.95 // 26204
D=A // 26205
@SP // 26206
AM=M+1 // 26207
A=A-1 // 26208
M=D // 26209
@LCL // 26210
A=M+1 // 26211
D=M // 26212
@2048 // 26213
D=D-A // 26214
@DO_LT // 26215
0;JMP // 26216
(Memory.deAlloc.LT.95)
@SP // 26217
AM=M+1 // 26218
A=A-1 // 26219
M=D // 26220
@SP // 26221
A=M-1 // 26222
M=!D // 26223
@LCL // 26224
A=M+1 // 26225
A=M+1 // 26226
D=M // 26227
@SP // 26228
AM=M-1 // 26229
D=D&M // 26230
D=D-1 // 26231
@DO_EQ // 26232
0;JMP // 26233
(Memory.deAlloc.EQ.94)
@Memory.deAlloc$IF_TRUE1 // 26234
D;JNE // 26235

////GotoInstruction{label='Memory.deAlloc$IF_END1}
// goto Memory.deAlloc$IF_END1
@Memory.deAlloc$IF_END1 // 26236
0;JMP // 26237

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

@LCL // 26238
A=M+1 // 26239
A=M // 26240
D=M // 26241
@SP // 26242
AM=M+1 // 26243
A=A-1 // 26244
M=D // 26245
// call Memory.getBinIndex
@6 // 26246
D=A // 26247
@14 // 26248
M=D // 26249
@Memory.getBinIndex // 26250
D=A // 26251
@13 // 26252
M=D // 26253
@Memory.deAlloc.ret.0 // 26254
D=A // 26255
@CALL // 26256
0;JMP // 26257
(Memory.deAlloc.ret.0)
@SP // 26258
AM=M-1 // 26259
D=M // 26260
@2048 // 26261
D=D+A // 26262
@SP // 26263
AM=M+1 // 26264
A=A-1 // 26265
M=D // 26266
@LCL // 26267
A=M+1 // 26268
D=M // 26269
@SP // 26270
AM=M+1 // 26271
A=A-1 // 26272
M=D // 26273
// call Memory.remove_node
@7 // 26274
D=A // 26275
@14 // 26276
M=D // 26277
@Memory.remove_node // 26278
D=A // 26279
@13 // 26280
M=D // 26281
@Memory.deAlloc.ret.1 // 26282
D=A // 26283
@CALL // 26284
0;JMP // 26285
(Memory.deAlloc.ret.1)
@SP // 26286
M=M-1 // 26287

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
@LCL // 26288
A=M+1 // 26289
D=M // 26290
@0 // 26291
D=D+A // 26292
@SP // 26293
AM=M+1 // 26294
A=A-1 // 26295
M=D // 26296
@LCL // 26297
A=M+1 // 26298
A=M // 26299
D=M // 26300
@SP // 26301
AM=M+1 // 26302
A=A-1 // 26303
M=D // 26304
@LCL // 26305
A=M // 26306
A=M // 26307
D=M // 26308
@SP // 26309
AM=M-1 // 26310
D=D+M // 26311
@5 // 26312
D=D+A // 26313
@SP // 26314
AM=M-1 // 26315
A=M // 26316
M=D // 26317

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26318
A=M+1 // 26319
D=M // 26320
@SP // 26321
AM=M+1 // 26322
A=A-1 // 26323
M=D // 26324
// call Memory.create_foot
@6 // 26325
D=A // 26326
@14 // 26327
M=D // 26328
@Memory.create_foot // 26329
D=A // 26330
@13 // 26331
M=D // 26332
@Memory.deAlloc.ret.2 // 26333
D=A // 26334
@CALL // 26335
0;JMP // 26336
(Memory.deAlloc.ret.2)
@SP // 26337
M=M-1 // 26338

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 26339
A=M+1 // 26340
D=M // 26341
@LCL // 26342
A=M // 26343
M=D // 26344

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

@LCL // 26345
A=M // 26346
D=M // 26347
@SP // 26348
AM=M+1 // 26349
A=A-1 // 26350
M=D // 26351
@LCL // 26352
A=M // 26353
A=M // 26354
D=M // 26355
@SP // 26356
AM=M-1 // 26357
D=D+M // 26358
@5 // 26359
D=D+A // 26360
@LCL // 26361
A=M+1 // 26362
A=A+1 // 26363
M=D // 26364

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
@Memory.deAlloc.EQ.96 // 26365
D=A // 26366
@SP // 26367
AM=M+1 // 26368
A=A-1 // 26369
M=D // 26370
@Memory.deAlloc.LT.97 // 26371
D=A // 26372
@SP // 26373
AM=M+1 // 26374
A=A-1 // 26375
M=D // 26376
@LCL // 26377
A=M+1 // 26378
A=A+1 // 26379
D=M // 26380
@16384 // 26381
D=D-A // 26382
@DO_LT // 26383
0;JMP // 26384
(Memory.deAlloc.LT.97)
@SP // 26385
AM=M+1 // 26386
A=A-1 // 26387
M=D // 26388
@LCL // 26389
A=M+1 // 26390
A=A+1 // 26391
A=M+1 // 26392
D=M // 26393
@SP // 26394
AM=M-1 // 26395
D=D&M // 26396
D=D-1 // 26397
@DO_EQ // 26398
0;JMP // 26399
(Memory.deAlloc.EQ.96)
@Memory.deAlloc$IF_TRUE2 // 26400
D;JNE // 26401

////GotoInstruction{label='Memory.deAlloc$IF_END2}
// goto Memory.deAlloc$IF_END2
@Memory.deAlloc$IF_END2 // 26402
0;JMP // 26403

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

@LCL // 26404
A=M+1 // 26405
A=A+1 // 26406
A=M // 26407
D=M // 26408
@SP // 26409
AM=M+1 // 26410
A=A-1 // 26411
M=D // 26412
// call Memory.getBinIndex
@6 // 26413
D=A // 26414
@14 // 26415
M=D // 26416
@Memory.getBinIndex // 26417
D=A // 26418
@13 // 26419
M=D // 26420
@Memory.deAlloc.ret.3 // 26421
D=A // 26422
@CALL // 26423
0;JMP // 26424
(Memory.deAlloc.ret.3)
@SP // 26425
AM=M-1 // 26426
D=M // 26427
@2048 // 26428
D=D+A // 26429
@SP // 26430
AM=M+1 // 26431
A=A-1 // 26432
M=D // 26433
@LCL // 26434
A=M+1 // 26435
A=A+1 // 26436
D=M // 26437
@SP // 26438
AM=M+1 // 26439
A=A-1 // 26440
M=D // 26441
// call Memory.remove_node
@7 // 26442
D=A // 26443
@14 // 26444
M=D // 26445
@Memory.remove_node // 26446
D=A // 26447
@13 // 26448
M=D // 26449
@Memory.deAlloc.ret.4 // 26450
D=A // 26451
@CALL // 26452
0;JMP // 26453
(Memory.deAlloc.ret.4)
@SP // 26454
M=M-1 // 26455

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
@LCL // 26456
A=M // 26457
D=M // 26458
@0 // 26459
D=D+A // 26460
@SP // 26461
AM=M+1 // 26462
A=A-1 // 26463
M=D // 26464
@LCL // 26465
A=M // 26466
A=M // 26467
D=M // 26468
@SP // 26469
AM=M+1 // 26470
A=A-1 // 26471
M=D // 26472
@LCL // 26473
A=M+1 // 26474
A=A+1 // 26475
A=M // 26476
D=M // 26477
@SP // 26478
AM=M-1 // 26479
D=D+M // 26480
@5 // 26481
D=D+A // 26482
@SP // 26483
AM=M-1 // 26484
A=M // 26485
M=D // 26486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26487
A=M // 26488
D=M // 26489
@SP // 26490
AM=M+1 // 26491
A=A-1 // 26492
M=D // 26493
// call Memory.create_foot
@6 // 26494
D=A // 26495
@14 // 26496
M=D // 26497
@Memory.create_foot // 26498
D=A // 26499
@13 // 26500
M=D // 26501
@Memory.deAlloc.ret.5 // 26502
D=A // 26503
@CALL // 26504
0;JMP // 26505
(Memory.deAlloc.ret.5)
@SP // 26506
M=M-1 // 26507

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

@LCL // 26508
A=M // 26509
A=M // 26510
D=M // 26511
@SP // 26512
AM=M+1 // 26513
A=A-1 // 26514
M=D // 26515
// call Memory.getBinIndex
@6 // 26516
D=A // 26517
@14 // 26518
M=D // 26519
@Memory.getBinIndex // 26520
D=A // 26521
@13 // 26522
M=D // 26523
@Memory.deAlloc.ret.6 // 26524
D=A // 26525
@CALL // 26526
0;JMP // 26527
(Memory.deAlloc.ret.6)
@SP // 26528
AM=M-1 // 26529
D=M // 26530
@2048 // 26531
D=D+A // 26532
@SP // 26533
AM=M+1 // 26534
A=A-1 // 26535
M=D // 26536
@LCL // 26537
A=M // 26538
D=M // 26539
@SP // 26540
AM=M+1 // 26541
A=A-1 // 26542
M=D // 26543
// call Memory.add_node
@7 // 26544
D=A // 26545
@14 // 26546
M=D // 26547
@Memory.add_node // 26548
D=A // 26549
@13 // 26550
M=D // 26551
@Memory.deAlloc.ret.7 // 26552
D=A // 26553
@CALL // 26554
0;JMP // 26555
(Memory.deAlloc.ret.7)
@SP // 26556
M=M-1 // 26557

////PushInstruction("constant 0")
@SP // 26558
AM=M+1 // 26559
A=A-1 // 26560
M=0 // 26561
@RETURN // 26562
0;JMP // 26563

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26564
A=M // 26565
D=M // 26566
@3 // 26567
M=D // 26568

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
@THIS // 26569
A=M // 26570
D=M // 26571
@ARG // 26572
A=M+1 // 26573
A=D+M // 26574
D=M // 26575
@SP // 26576
AM=M+1 // 26577
A=A-1 // 26578
M=D // 26579
@RETURN // 26580
0;JMP // 26581

////FunctionInstruction{functionName='Plane.surface_normal', numLocals=2, funcMapping={Plane.initialize=16, Plane.new=1, Plane.dispose=4, Plane.intersect=15, Plane.color=29}}
// function Plane.surface_normal with 2
(Plane.surface_normal)
@SP // 26582
M=M+1 // 26583
AM=M+1 // 26584
A=A-1 // 26585
M=0 // 26586
A=A-1 // 26587
M=0 // 26588

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 26589
A=M // 26590
D=M // 26591
@3 // 26592
M=D // 26593

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 26594
AM=M+1 // 26595
A=A-1 // 26596
M=-1 // 26597
// call Number.new
@6 // 26598
D=A // 26599
@14 // 26600
M=D // 26601
@Number.new // 26602
D=A // 26603
@13 // 26604
M=D // 26605
@Plane.surface_normal.ret.0 // 26606
D=A // 26607
@CALL // 26608
0;JMP // 26609
(Plane.surface_normal.ret.0)
@SP // 26610
AM=M-1 // 26611
D=M // 26612
@LCL // 26613
A=M // 26614
M=D // 26615

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 26616
A=M+1 // 26617
D=M // 26618
@SP // 26619
AM=M+1 // 26620
A=A-1 // 26621
M=D // 26622
// call Vec3.clone
@6 // 26623
D=A // 26624
@14 // 26625
M=D // 26626
@Vec3.clone // 26627
D=A // 26628
@13 // 26629
M=D // 26630
@Plane.surface_normal.ret.1 // 26631
D=A // 26632
@CALL // 26633
0;JMP // 26634
(Plane.surface_normal.ret.1)
@SP // 26635
AM=M-1 // 26636
D=M // 26637
@LCL // 26638
A=M+1 // 26639
M=D // 26640

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26641
A=M+1 // 26642
D=M // 26643
@SP // 26644
AM=M+1 // 26645
A=A-1 // 26646
M=D // 26647
@LCL // 26648
A=M // 26649
D=M // 26650
@SP // 26651
AM=M+1 // 26652
A=A-1 // 26653
M=D // 26654
// call Vec3.do_scale
@7 // 26655
D=A // 26656
@14 // 26657
M=D // 26658
@Vec3.do_scale // 26659
D=A // 26660
@13 // 26661
M=D // 26662
@Plane.surface_normal.ret.2 // 26663
D=A // 26664
@CALL // 26665
0;JMP // 26666
(Plane.surface_normal.ret.2)
@SP // 26667
M=M-1 // 26668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26669
A=M // 26670
D=M // 26671
@SP // 26672
AM=M+1 // 26673
A=A-1 // 26674
M=D // 26675
// call Number.dispose
@6 // 26676
D=A // 26677
@14 // 26678
M=D // 26679
@Number.dispose // 26680
D=A // 26681
@13 // 26682
M=D // 26683
@Plane.surface_normal.ret.3 // 26684
D=A // 26685
@CALL // 26686
0;JMP // 26687
(Plane.surface_normal.ret.3)
@SP // 26688
M=M-1 // 26689

////PushInstruction("local 1")
@LCL // 26690
A=M+1 // 26691
D=M // 26692
@SP // 26693
AM=M+1 // 26694
A=A-1 // 26695
M=D // 26696
@RETURN // 26697
0;JMP // 26698

////FunctionInstruction{functionName='Number.initialize', numLocals=3, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.clone=2, Number.do_div=5, Number.getV=0, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.initialize with 3
(Number.initialize)
@3 // 26699
D=A // 26700
@SP // 26701
AM=D+M // 26702
A=A-1 // 26703
M=0 // 26704
A=A-1 // 26705
M=0 // 26706
A=A-1 // 26707
M=0 // 26708

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 256")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=static 0}
//}

@256 // 26709
D=A // 26710
@SP // 26711
AM=M+1 // 26712
A=A-1 // 26713
M=D // 26714
// call Int32.new
@6 // 26715
D=A // 26716
@14 // 26717
M=D // 26718
@Int32.new // 26719
D=A // 26720
@13 // 26721
M=D // 26722
@Number.initialize.ret.0 // 26723
D=A // 26724
@CALL // 26725
0;JMP // 26726
(Number.initialize.ret.0)
@SP // 26727
AM=M-1 // 26728
D=M // 26729
@Number.0 // 26730
M=D // 26731

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 0"), PushInstruction("static 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 26732
D=A // 26733
@SP // 26734
M=D+M // 26735
@Number.0 // 26736
D=M // 26737
@SP // 26738
A=M-1 // 26739
M=D // 26740
A=A-1 // 26741
M=D // 26742
// call Int32.do_mul
@7 // 26743
D=A // 26744
@14 // 26745
M=D // 26746
@Int32.do_mul // 26747
D=A // 26748
@13 // 26749
M=D // 26750
@Number.initialize.ret.1 // 26751
D=A // 26752
@CALL // 26753
0;JMP // 26754
(Number.initialize.ret.1)
@SP // 26755
M=M-1 // 26756

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 561")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 1}
//}

@561 // 26757
D=A // 26758
@SP // 26759
AM=M+1 // 26760
A=A-1 // 26761
M=D // 26762
// call Int32.new
@6 // 26763
D=A // 26764
@14 // 26765
M=D // 26766
@Int32.new // 26767
D=A // 26768
@13 // 26769
M=D // 26770
@Number.initialize.ret.2 // 26771
D=A // 26772
@CALL // 26773
0;JMP // 26774
(Number.initialize.ret.2)
@SP // 26775
AM=M-1 // 26776
D=M // 26777
@LCL // 26778
A=M+1 // 26779
M=D // 26780

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 367")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=local 2}
//}

@367 // 26781
D=A // 26782
@SP // 26783
AM=M+1 // 26784
A=A-1 // 26785
M=D // 26786
// call Int32.new
@6 // 26787
D=A // 26788
@14 // 26789
M=D // 26790
@Int32.new // 26791
D=A // 26792
@13 // 26793
M=D // 26794
@Number.initialize.ret.3 // 26795
D=A // 26796
@CALL // 26797
0;JMP // 26798
(Number.initialize.ret.3)
@SP // 26799
AM=M-1 // 26800
D=M // 26801
@LCL // 26802
A=M+1 // 26803
A=A+1 // 26804
M=D // 26805

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("local 2")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 26806
A=M+1 // 26807
D=M // 26808
@SP // 26809
AM=M+1 // 26810
A=A-1 // 26811
M=D // 26812
@LCL // 26813
A=M+1 // 26814
A=A+1 // 26815
D=M // 26816
@SP // 26817
AM=M+1 // 26818
A=A-1 // 26819
M=D // 26820
// call Int32.do_mul
@7 // 26821
D=A // 26822
@14 // 26823
M=D // 26824
@Int32.do_mul // 26825
D=A // 26826
@13 // 26827
M=D // 26828
@Number.initialize.ret.4 // 26829
D=A // 26830
@CALL // 26831
0;JMP // 26832
(Number.initialize.ret.4)
@SP // 26833
M=M-1 // 26834

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.new_from_int32}}
//  pop:  PopInstruction{address=static 3}
//}

@LCL // 26835
A=M+1 // 26836
D=M // 26837
@SP // 26838
AM=M+1 // 26839
A=A-1 // 26840
M=D // 26841
// call Number.new_from_int32
@6 // 26842
D=A // 26843
@14 // 26844
M=D // 26845
@Number.new_from_int32 // 26846
D=A // 26847
@13 // 26848
M=D // 26849
@Number.initialize.ret.5 // 26850
D=A // 26851
@CALL // 26852
0;JMP // 26853
(Number.initialize.ret.5)
@SP // 26854
AM=M-1 // 26855
D=M // 26856
@Number.3 // 26857
M=D // 26858

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=static 1}
//}

@Number.0 // 26859
D=M // 26860
@SP // 26861
AM=M+1 // 26862
A=A-1 // 26863
M=D // 26864
// call Int32.clone
@6 // 26865
D=A // 26866
@14 // 26867
M=D // 26868
@Int32.clone // 26869
D=A // 26870
@13 // 26871
M=D // 26872
@Number.initialize.ret.6 // 26873
D=A // 26874
@CALL // 26875
0;JMP // 26876
(Number.initialize.ret.6)
@SP // 26877
AM=M-1 // 26878
D=M // 26879
@Number.1 // 26880
M=D // 26881

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.1 // 26882
D=M // 26883
@SP // 26884
AM=M+1 // 26885
A=A-1 // 26886
M=D // 26887
// call Int32.do_sqrt
@6 // 26888
D=A // 26889
@14 // 26890
M=D // 26891
@Int32.do_sqrt // 26892
D=A // 26893
@13 // 26894
M=D // 26895
@Number.initialize.ret.7 // 26896
D=A // 26897
@CALL // 26898
0;JMP // 26899
(Number.initialize.ret.7)
@SP // 26900
M=M-1 // 26901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.1 // 26902
D=M // 26903
@SP // 26904
AM=M+1 // 26905
A=A-1 // 26906
M=D // 26907
// call Int32.do_sqrt
@6 // 26908
D=A // 26909
@14 // 26910
M=D // 26911
@Int32.do_sqrt // 26912
D=A // 26913
@13 // 26914
M=D // 26915
@Number.initialize.ret.8 // 26916
D=A // 26917
@CALL // 26918
0;JMP // 26919
(Number.initialize.ret.8)
@SP // 26920
M=M-1 // 26921

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 1")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=static 2}
//}

@Number.1 // 26922
D=M // 26923
@SP // 26924
AM=M+1 // 26925
A=A-1 // 26926
M=D // 26927
// call Int32.clone
@6 // 26928
D=A // 26929
@14 // 26930
M=D // 26931
@Int32.clone // 26932
D=A // 26933
@13 // 26934
M=D // 26935
@Number.initialize.ret.9 // 26936
D=A // 26937
@CALL // 26938
0;JMP // 26939
(Number.initialize.ret.9)
@SP // 26940
AM=M-1 // 26941
D=M // 26942
@Number.2 // 26943
M=D // 26944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2")], call=CallInstruction{Int32.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 26945
D=M // 26946
@SP // 26947
AM=M+1 // 26948
A=A-1 // 26949
M=D // 26950
// call Int32.do_sqrt
@6 // 26951
D=A // 26952
@14 // 26953
M=D // 26954
@Int32.do_sqrt // 26955
D=A // 26956
@13 // 26957
M=D // 26958
@Number.initialize.ret.10 // 26959
D=A // 26960
@CALL // 26961
0;JMP // 26962
(Number.initialize.ret.10)
@SP // 26963
M=M-1 // 26964

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@Number.2 // 26965
D=M // 26966
@SP // 26967
AM=M+1 // 26968
A=A-1 // 26969
M=D // 26970
// call Int32.clone
@6 // 26971
D=A // 26972
@14 // 26973
M=D // 26974
@Int32.clone // 26975
D=A // 26976
@13 // 26977
M=D // 26978
@Number.initialize.ret.11 // 26979
D=A // 26980
@CALL // 26981
0;JMP // 26982
(Number.initialize.ret.11)
@SP // 26983
AM=M-1 // 26984
D=M // 26985
@LCL // 26986
A=M // 26987
M=D // 26988

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("local 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 26989
D=M // 26990
@SP // 26991
AM=M+1 // 26992
A=A-1 // 26993
M=D // 26994
@LCL // 26995
A=M // 26996
D=M // 26997
@SP // 26998
AM=M+1 // 26999
A=A-1 // 27000
M=D // 27001
// call Int32.do_mul
@7 // 27002
D=A // 27003
@14 // 27004
M=D // 27005
@Int32.do_mul // 27006
D=A // 27007
@13 // 27008
M=D // 27009
@Number.initialize.ret.12 // 27010
D=A // 27011
@CALL // 27012
0;JMP // 27013
(Number.initialize.ret.12)
@SP // 27014
M=M-1 // 27015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("static 2"), PushInstruction("local 0")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@Number.2 // 27016
D=M // 27017
@SP // 27018
AM=M+1 // 27019
A=A-1 // 27020
M=D // 27021
@LCL // 27022
A=M // 27023
D=M // 27024
@SP // 27025
AM=M+1 // 27026
A=A-1 // 27027
M=D // 27028
// call Int32.do_mul
@7 // 27029
D=A // 27030
@14 // 27031
M=D // 27032
@Int32.do_mul // 27033
D=A // 27034
@13 // 27035
M=D // 27036
@Number.initialize.ret.13 // 27037
D=A // 27038
@CALL // 27039
0;JMP // 27040
(Number.initialize.ret.13)
@SP // 27041
M=M-1 // 27042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27043
A=M+1 // 27044
A=A+1 // 27045
D=M // 27046
@SP // 27047
AM=M+1 // 27048
A=A-1 // 27049
M=D // 27050
// call Int32.dispose
@6 // 27051
D=A // 27052
@14 // 27053
M=D // 27054
@Int32.dispose // 27055
D=A // 27056
@13 // 27057
M=D // 27058
@Number.initialize.ret.14 // 27059
D=A // 27060
@CALL // 27061
0;JMP // 27062
(Number.initialize.ret.14)
@SP // 27063
M=M-1 // 27064

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27065
A=M // 27066
D=M // 27067
@SP // 27068
AM=M+1 // 27069
A=A-1 // 27070
M=D // 27071
// call Int32.dispose
@6 // 27072
D=A // 27073
@14 // 27074
M=D // 27075
@Int32.dispose // 27076
D=A // 27077
@13 // 27078
M=D // 27079
@Number.initialize.ret.15 // 27080
D=A // 27081
@CALL // 27082
0;JMP // 27083
(Number.initialize.ret.15)
@SP // 27084
M=M-1 // 27085

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=static 4}
//}

@2 // 27086
D=A // 27087
@SP // 27088
AM=M+1 // 27089
A=A-1 // 27090
M=D // 27091
// call Int32.new
@6 // 27092
D=A // 27093
@14 // 27094
M=D // 27095
@Int32.new // 27096
D=A // 27097
@13 // 27098
M=D // 27099
@Number.initialize.ret.16 // 27100
D=A // 27101
@CALL // 27102
0;JMP // 27103
(Number.initialize.ret.16)
@SP // 27104
AM=M-1 // 27105
D=M // 27106
@Number.4 // 27107
M=D // 27108

////PushInstruction("constant 0")
@SP // 27109
AM=M+1 // 27110
A=A-1 // 27111
M=0 // 27112
@RETURN // 27113
0;JMP // 27114

////FunctionInstruction{functionName='Scene.getLights', numLocals=0, funcMapping={Scene.getNumLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getLights with 0
(Scene.getLights)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27115
A=M // 27116
D=M // 27117
@3 // 27118
M=D // 27119

////PushInstruction("this 7")
@RETURN_PUSH_LABEL_153 // 27120
D=A // 27121
@13 // 27122
M=D // 27123
@7 // 27124
D=A // 27125
@THIS_PUSH // 27126
0;JMP // 27127
(RETURN_PUSH_LABEL_153)
@RETURN // 27128
0;JMP // 27129

////FunctionInstruction{functionName='Number.dispose', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.dispose with 0
(Number.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27130
A=M // 27131
D=M // 27132
@3 // 27133
M=D // 27134

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

@Number.5 // 27135
M=M-1 // 27136

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27137
A=M // 27138
D=M // 27139
@SP // 27140
AM=M+1 // 27141
A=A-1 // 27142
M=D // 27143
// call Int32.dispose
@6 // 27144
D=A // 27145
@14 // 27146
M=D // 27147
@Int32.dispose // 27148
D=A // 27149
@13 // 27150
M=D // 27151
@Number.dispose.ret.0 // 27152
D=A // 27153
@CALL // 27154
0;JMP // 27155
(Number.dispose.ret.0)
@SP // 27156
M=M-1 // 27157

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 27158
D=M // 27159
@SP // 27160
AM=M+1 // 27161
A=A-1 // 27162
M=D // 27163
// call Memory.deAlloc
@6 // 27164
D=A // 27165
@14 // 27166
M=D // 27167
@Memory.deAlloc // 27168
D=A // 27169
@13 // 27170
M=D // 27171
@Number.dispose.ret.1 // 27172
D=A // 27173
@CALL // 27174
0;JMP // 27175
(Number.dispose.ret.1)
@SP // 27176
M=M-1 // 27177

////PushInstruction("constant 0")
@SP // 27178
AM=M+1 // 27179
A=A-1 // 27180
M=0 // 27181
@RETURN // 27182
0;JMP // 27183

////FunctionInstruction{functionName='Number.is_negative', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.is_negative with 0
(Number.is_negative)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27184
A=M // 27185
D=M // 27186
@3 // 27187
M=D // 27188

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_negative}}
@THIS // 27189
A=M // 27190
D=M // 27191
@SP // 27192
AM=M+1 // 27193
A=A-1 // 27194
M=D // 27195
// call Int32.is_negative
@6 // 27196
D=A // 27197
@14 // 27198
M=D // 27199
@Int32.is_negative // 27200
D=A // 27201
@13 // 27202
M=D // 27203
@Number.is_negative.ret.0 // 27204
D=A // 27205
@CALL // 27206
0;JMP // 27207
(Number.is_negative.ret.0)
@RETURN // 27208
0;JMP // 27209

////FunctionInstruction{functionName='Element.intersect', numLocals=0, funcMapping={Element.surface_normal=2, Element.plane=1, Element.color=2}}
// function Element.intersect with 0
(Element.intersect)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27210
A=M // 27211
D=M // 27212
@3 // 27213
M=D // 27214

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.intersect$IF_TRUE1}}
@THIS // 27215
A=M // 27216
D=M // 27217
@Element.intersect$IF_TRUE1 // 27218
D;JNE // 27219

////GotoInstruction{label='Element.intersect$IF_END1}
// goto Element.intersect$IF_END1
@Element.intersect$IF_END1 // 27220
0;JMP // 27221

////LabelInstruction{label='Element.intersect$IF_TRUE1}
// label Element.intersect$IF_TRUE1
(Element.intersect$IF_TRUE1)

////CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("argument 1")], call=CallInstruction{Plane.intersect}}
@THIS // 27222
A=M // 27223
D=M // 27224
@SP // 27225
AM=M+1 // 27226
A=A-1 // 27227
M=D // 27228
@ARG // 27229
A=M+1 // 27230
D=M // 27231
@SP // 27232
AM=M+1 // 27233
A=A-1 // 27234
M=D // 27235
// call Plane.intersect
@7 // 27236
D=A // 27237
@14 // 27238
M=D // 27239
@Plane.intersect // 27240
D=A // 27241
@13 // 27242
M=D // 27243
@Element.intersect.ret.0 // 27244
D=A // 27245
@CALL // 27246
0;JMP // 27247
(Element.intersect.ret.0)
@RETURN // 27248
0;JMP // 27249

////LabelInstruction{label='Element.intersect$IF_END1}
// label Element.intersect$IF_END1
(Element.intersect$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.intersect$IF_TRUE2}}
@THIS // 27250
A=M+1 // 27251
D=M // 27252
@Element.intersect$IF_TRUE2 // 27253
D;JNE // 27254

////GotoInstruction{label='Element.intersect$IF_END2}
// goto Element.intersect$IF_END2
@Element.intersect$IF_END2 // 27255
0;JMP // 27256

////LabelInstruction{label='Element.intersect$IF_TRUE2}
// label Element.intersect$IF_TRUE2
(Element.intersect$IF_TRUE2)

////CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("argument 1")], call=CallInstruction{Sphere.intersect}}
@THIS // 27257
A=M+1 // 27258
D=M // 27259
@SP // 27260
AM=M+1 // 27261
A=A-1 // 27262
M=D // 27263
@ARG // 27264
A=M+1 // 27265
D=M // 27266
@SP // 27267
AM=M+1 // 27268
A=A-1 // 27269
M=D // 27270
// call Sphere.intersect
@7 // 27271
D=A // 27272
@14 // 27273
M=D // 27274
@Sphere.intersect // 27275
D=A // 27276
@13 // 27277
M=D // 27278
@Element.intersect.ret.1 // 27279
D=A // 27280
@CALL // 27281
0;JMP // 27282
(Element.intersect.ret.1)
@RETURN // 27283
0;JMP // 27284

////LabelInstruction{label='Element.intersect$IF_END2}
// label Element.intersect$IF_END2
(Element.intersect$IF_END2)

////PushInstruction("constant 0")
@SP // 27285
AM=M+1 // 27286
A=A-1 // 27287
M=0 // 27288
@RETURN // 27289
0;JMP // 27290

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
@ARG // 27291
A=M+1 // 27292
D=M // 27293
A=A-1 // 27294
D=D|M // 27295
@SP // 27296
AM=M+1 // 27297
A=A-1 // 27298
M=D // 27299
@ARG // 27300
A=M+1 // 27301
D=M // 27302
A=A-1 // 27303
D=D&M // 27304
D=!D // 27305
@SP // 27306
AM=M-1 // 27307
D=D&M // 27308
@SP // 27309
AM=M+1 // 27310
A=A-1 // 27311
M=D // 27312
@RETURN // 27313
0;JMP // 27314

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
@Memory.remove_node.EQ.98 // 27315
D=A // 27316
@SP // 27317
AM=M+1 // 27318
A=A-1 // 27319
M=D // 27320
@ARG // 27321
A=M+1 // 27322
D=M // 27323
@ARG // 27324
A=M+1 // 27325
D=M // 27326
@2 // 27327
D=D+A // 27328
A=D // 27329
D=M // 27330
@DO_EQ // 27331
0;JMP // 27332
(Memory.remove_node.EQ.98)
D=!D // 27333
@Memory.remove_node$IF_TRUE1 // 27334
D;JNE // 27335

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 27336
0;JMP // 27337

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
@ARG // 27338
A=M+1 // 27339
D=M // 27340
@ARG // 27341
A=M+1 // 27342
D=M // 27343
@2 // 27344
D=D+A // 27345
A=D // 27346
D=M // 27347
@3 // 27348
D=D+A // 27349
@SP // 27350
AM=M+1 // 27351
A=A-1 // 27352
M=D // 27353
@ARG // 27354
A=M+1 // 27355
D=M // 27356
@ARG // 27357
A=M+1 // 27358
D=M // 27359
@3 // 27360
D=D+A // 27361
A=D // 27362
D=M // 27363
@SP // 27364
AM=M-1 // 27365
A=M // 27366
M=D // 27367

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 27368
0;JMP // 27369

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
@ARG // 27370
A=M // 27371
D=M // 27372
@0 // 27373
D=D+A // 27374
@SP // 27375
AM=M+1 // 27376
A=A-1 // 27377
M=D // 27378
@ARG // 27379
A=M+1 // 27380
D=M // 27381
@ARG // 27382
A=M+1 // 27383
D=M // 27384
@3 // 27385
D=D+A // 27386
A=D // 27387
D=M // 27388
@SP // 27389
AM=M-1 // 27390
A=M // 27391
M=D // 27392

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
@Memory.remove_node.EQ.99 // 27393
D=A // 27394
@SP // 27395
AM=M+1 // 27396
A=A-1 // 27397
M=D // 27398
@ARG // 27399
A=M+1 // 27400
D=M // 27401
@ARG // 27402
A=M+1 // 27403
D=M // 27404
@3 // 27405
D=D+A // 27406
A=D // 27407
D=M // 27408
@DO_EQ // 27409
0;JMP // 27410
(Memory.remove_node.EQ.99)
D=!D // 27411
@Memory.remove_node$IF_TRUE2 // 27412
D;JNE // 27413

////GotoInstruction{label='Memory.remove_node$IF_END2}
// goto Memory.remove_node$IF_END2
@Memory.remove_node$IF_END2 // 27414
0;JMP // 27415

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
@ARG // 27416
A=M+1 // 27417
D=M // 27418
@ARG // 27419
A=M+1 // 27420
D=M // 27421
@3 // 27422
D=D+A // 27423
A=D // 27424
D=M // 27425
@2 // 27426
D=D+A // 27427
@SP // 27428
AM=M+1 // 27429
A=A-1 // 27430
M=D // 27431
@ARG // 27432
A=M+1 // 27433
D=M // 27434
@ARG // 27435
A=M+1 // 27436
D=M // 27437
@2 // 27438
D=D+A // 27439
A=D // 27440
D=M // 27441
@SP // 27442
AM=M-1 // 27443
A=M // 27444
M=D // 27445

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
@ARG // 27446
A=M+1 // 27447
D=M // 27448
@2 // 27449
D=D+A // 27450
@SP // 27451
AM=M+1 // 27452
A=A-1 // 27453
M=D // 27454
D=0 // 27455
@SP // 27456
AM=M-1 // 27457
A=M // 27458
M=D // 27459

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 27460
A=M+1 // 27461
D=M // 27462
@3 // 27463
D=D+A // 27464
@SP // 27465
AM=M+1 // 27466
A=A-1 // 27467
M=D // 27468
D=0 // 27469
@SP // 27470
AM=M-1 // 27471
A=M // 27472
M=D // 27473

////PushInstruction("constant 0")
@SP // 27474
AM=M+1 // 27475
A=A-1 // 27476
M=0 // 27477
@RETURN // 27478
0;JMP // 27479

////FunctionInstruction{functionName='DirectionalLight.new', numLocals=2, funcMapping={DirectionalLight.dispose=3, DirectionalLight.getColor=0}}
// function DirectionalLight.new with 2
(DirectionalLight.new)
@SP // 27480
M=M+1 // 27481
AM=M+1 // 27482
A=A-1 // 27483
M=0 // 27484
A=A-1 // 27485
M=0 // 27486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 4")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@4 // 27487
D=A // 27488
@SP // 27489
AM=M+1 // 27490
A=A-1 // 27491
M=D // 27492
// call Memory.alloc
@6 // 27493
D=A // 27494
@14 // 27495
M=D // 27496
@Memory.alloc // 27497
D=A // 27498
@13 // 27499
M=D // 27500
@DirectionalLight.new.ret.0 // 27501
D=A // 27502
@CALL // 27503
0;JMP // 27504
(DirectionalLight.new.ret.0)
@SP // 27505
AM=M-1 // 27506
D=M // 27507
@3 // 27508
M=D // 27509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 27510
AM=M+1 // 27511
A=A-1 // 27512
M=-1 // 27513
// call Number.new
@6 // 27514
D=A // 27515
@14 // 27516
M=D // 27517
@Number.new // 27518
D=A // 27519
@13 // 27520
M=D // 27521
@DirectionalLight.new.ret.1 // 27522
D=A // 27523
@CALL // 27524
0;JMP // 27525
(DirectionalLight.new.ret.1)
@SP // 27526
AM=M-1 // 27527
D=M // 27528
@LCL // 27529
A=M // 27530
M=D // 27531

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1"), PushInstruction("constant 20")], call=CallInstruction{Main.getSomething}}
//  pop:  PopInstruction{address=local 1}
//}

@2 // 27532
D=A // 27533
@SP // 27534
M=D+M // 27535
@20 // 27536
D=A // 27537
@SP // 27538
A=M-1 // 27539
M=D // 27540
A=A-1 // 27541
M=1 // 27542
// call Main.getSomething
@7 // 27543
D=A // 27544
@14 // 27545
M=D // 27546
@Main.getSomething // 27547
D=A // 27548
@13 // 27549
M=D // 27550
@DirectionalLight.new.ret.2 // 27551
D=A // 27552
@CALL // 27553
0;JMP // 27554
(DirectionalLight.new.ret.2)
@SP // 27555
AM=M-1 // 27556
D=M // 27557
@LCL // 27558
A=M+1 // 27559
M=D // 27560

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 27561
A=M // 27562
D=M // 27563
@THIS // 27564
A=M // 27565
M=D // 27566

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 27567
A=M+1 // 27568
D=M // 27569
@THIS // 27570
A=M+1 // 27571
M=D // 27572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=this 2}
//}

@THIS // 27573
A=M // 27574
D=M // 27575
@SP // 27576
AM=M+1 // 27577
A=A-1 // 27578
M=D // 27579
// call Vec3.clone
@6 // 27580
D=A // 27581
@14 // 27582
M=D // 27583
@Vec3.clone // 27584
D=A // 27585
@13 // 27586
M=D // 27587
@DirectionalLight.new.ret.3 // 27588
D=A // 27589
@CALL // 27590
0;JMP // 27591
(DirectionalLight.new.ret.3)
@SP // 27592
AM=M-1 // 27593
D=M // 27594
@THIS // 27595
A=M+1 // 27596
A=A+1 // 27597
M=D // 27598

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("local 0")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27599
A=M+1 // 27600
A=A+1 // 27601
D=M // 27602
@SP // 27603
AM=M+1 // 27604
A=A-1 // 27605
M=D // 27606
@LCL // 27607
A=M // 27608
D=M // 27609
@SP // 27610
AM=M+1 // 27611
A=A-1 // 27612
M=D // 27613
// call Vec3.do_scale
@7 // 27614
D=A // 27615
@14 // 27616
M=D // 27617
@Vec3.do_scale // 27618
D=A // 27619
@13 // 27620
M=D // 27621
@DirectionalLight.new.ret.4 // 27622
D=A // 27623
@CALL // 27624
0;JMP // 27625
(DirectionalLight.new.ret.4)
@SP // 27626
M=M-1 // 27627

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=this 3}
//}

@THIS // 27628
A=M+1 // 27629
A=A+1 // 27630
D=M // 27631
@SP // 27632
AM=M+1 // 27633
A=A-1 // 27634
M=D // 27635
// call Vec3.clone
@6 // 27636
D=A // 27637
@14 // 27638
M=D // 27639
@Vec3.clone // 27640
D=A // 27641
@13 // 27642
M=D // 27643
@DirectionalLight.new.ret.5 // 27644
D=A // 27645
@CALL // 27646
0;JMP // 27647
(DirectionalLight.new.ret.5)
@SP // 27648
AM=M-1 // 27649
D=M // 27650
@THIS // 27651
A=M+1 // 27652
A=A+1 // 27653
A=A+1 // 27654
M=D // 27655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 3"), PushInstruction("local 1")], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 27656
A=M+1 // 27657
A=A+1 // 27658
A=A+1 // 27659
D=M // 27660
@SP // 27661
AM=M+1 // 27662
A=A-1 // 27663
M=D // 27664
@LCL // 27665
A=M+1 // 27666
D=M // 27667
@SP // 27668
AM=M+1 // 27669
A=A-1 // 27670
M=D // 27671
// call Vec3.do_scale
@7 // 27672
D=A // 27673
@14 // 27674
M=D // 27675
@Vec3.do_scale // 27676
D=A // 27677
@13 // 27678
M=D // 27679
@DirectionalLight.new.ret.6 // 27680
D=A // 27681
@CALL // 27682
0;JMP // 27683
(DirectionalLight.new.ret.6)
@SP // 27684
M=M-1 // 27685

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27686
A=M // 27687
D=M // 27688
@SP // 27689
AM=M+1 // 27690
A=A-1 // 27691
M=D // 27692
// call Number.dispose
@6 // 27693
D=A // 27694
@14 // 27695
M=D // 27696
@Number.dispose // 27697
D=A // 27698
@13 // 27699
M=D // 27700
@DirectionalLight.new.ret.7 // 27701
D=A // 27702
@CALL // 27703
0;JMP // 27704
(DirectionalLight.new.ret.7)
@SP // 27705
M=M-1 // 27706

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27707
A=M+1 // 27708
D=M // 27709
@SP // 27710
AM=M+1 // 27711
A=A-1 // 27712
M=D // 27713
// call Number.dispose
@6 // 27714
D=A // 27715
@14 // 27716
M=D // 27717
@Number.dispose // 27718
D=A // 27719
@13 // 27720
M=D // 27721
@DirectionalLight.new.ret.8 // 27722
D=A // 27723
@CALL // 27724
0;JMP // 27725
(DirectionalLight.new.ret.8)
@SP // 27726
M=M-1 // 27727

////PushInstruction("pointer 0")
@3 // 27728
D=M // 27729
@SP // 27730
AM=M+1 // 27731
A=A-1 // 27732
M=D // 27733
@RETURN // 27734
0;JMP // 27735

////FunctionInstruction{functionName='Scene.getHeight', numLocals=0, funcMapping={Scene.getNumLights=0, Scene.getLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getHeight with 0
(Scene.getHeight)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27736
A=M // 27737
D=M // 27738
@3 // 27739
M=D // 27740

////PushInstruction("this 1")
@THIS // 27741
A=M+1 // 27742
D=M // 27743
@SP // 27744
AM=M+1 // 27745
A=A-1 // 27746
M=D // 27747
@RETURN // 27748
0;JMP // 27749

////FunctionInstruction{functionName='Vec3.do_normalize', numLocals=3, funcMapping={Vec3.do_add=6, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0, Vec3.getZ=0}}
// function Vec3.do_normalize with 3
(Vec3.do_normalize)
@3 // 27750
D=A // 27751
@SP // 27752
AM=D+M // 27753
A=A-1 // 27754
M=0 // 27755
A=A-1 // 27756
M=0 // 27757
A=A-1 // 27758
M=0 // 27759

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 27760
A=M // 27761
D=M // 27762
@3 // 27763
M=D // 27764

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 27765
A=M // 27766
D=M // 27767
@SP // 27768
AM=M+1 // 27769
A=A-1 // 27770
M=D // 27771
// call Number.clone
@6 // 27772
D=A // 27773
@14 // 27774
M=D // 27775
@Number.clone // 27776
D=A // 27777
@13 // 27778
M=D // 27779
@Vec3.do_normalize.ret.0 // 27780
D=A // 27781
@CALL // 27782
0;JMP // 27783
(Vec3.do_normalize.ret.0)
@SP // 27784
AM=M-1 // 27785
D=M // 27786
@LCL // 27787
A=M // 27788
M=D // 27789

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 0")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27790
A=M // 27791
D=M // 27792
@SP // 27793
AM=M+1 // 27794
A=A-1 // 27795
M=D // 27796
@THIS // 27797
A=M // 27798
D=M // 27799
@SP // 27800
AM=M+1 // 27801
A=A-1 // 27802
M=D // 27803
// call Number.do_mul
@7 // 27804
D=A // 27805
@14 // 27806
M=D // 27807
@Number.do_mul // 27808
D=A // 27809
@13 // 27810
M=D // 27811
@Vec3.do_normalize.ret.1 // 27812
D=A // 27813
@CALL // 27814
0;JMP // 27815
(Vec3.do_normalize.ret.1)
@SP // 27816
M=M-1 // 27817

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 1}
//}

@THIS // 27818
A=M+1 // 27819
D=M // 27820
@SP // 27821
AM=M+1 // 27822
A=A-1 // 27823
M=D // 27824
// call Number.clone
@6 // 27825
D=A // 27826
@14 // 27827
M=D // 27828
@Number.clone // 27829
D=A // 27830
@13 // 27831
M=D // 27832
@Vec3.do_normalize.ret.2 // 27833
D=A // 27834
@CALL // 27835
0;JMP // 27836
(Vec3.do_normalize.ret.2)
@SP // 27837
AM=M-1 // 27838
D=M // 27839
@LCL // 27840
A=M+1 // 27841
M=D // 27842

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("this 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27843
A=M+1 // 27844
D=M // 27845
@SP // 27846
AM=M+1 // 27847
A=A-1 // 27848
M=D // 27849
@THIS // 27850
A=M+1 // 27851
D=M // 27852
@SP // 27853
AM=M+1 // 27854
A=A-1 // 27855
M=D // 27856
// call Number.do_mul
@7 // 27857
D=A // 27858
@14 // 27859
M=D // 27860
@Number.do_mul // 27861
D=A // 27862
@13 // 27863
M=D // 27864
@Vec3.do_normalize.ret.3 // 27865
D=A // 27866
@CALL // 27867
0;JMP // 27868
(Vec3.do_normalize.ret.3)
@SP // 27869
M=M-1 // 27870

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@THIS // 27871
A=M+1 // 27872
A=A+1 // 27873
D=M // 27874
@SP // 27875
AM=M+1 // 27876
A=A-1 // 27877
M=D // 27878
// call Number.clone
@6 // 27879
D=A // 27880
@14 // 27881
M=D // 27882
@Number.clone // 27883
D=A // 27884
@13 // 27885
M=D // 27886
@Vec3.do_normalize.ret.4 // 27887
D=A // 27888
@CALL // 27889
0;JMP // 27890
(Vec3.do_normalize.ret.4)
@SP // 27891
AM=M-1 // 27892
D=M // 27893
@LCL // 27894
A=M+1 // 27895
A=A+1 // 27896
M=D // 27897

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("this 2")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27898
A=M+1 // 27899
A=A+1 // 27900
D=M // 27901
@SP // 27902
AM=M+1 // 27903
A=A-1 // 27904
M=D // 27905
@THIS // 27906
A=M+1 // 27907
A=A+1 // 27908
D=M // 27909
@SP // 27910
AM=M+1 // 27911
A=A-1 // 27912
M=D // 27913
// call Number.do_mul
@7 // 27914
D=A // 27915
@14 // 27916
M=D // 27917
@Number.do_mul // 27918
D=A // 27919
@13 // 27920
M=D // 27921
@Vec3.do_normalize.ret.5 // 27922
D=A // 27923
@CALL // 27924
0;JMP // 27925
(Vec3.do_normalize.ret.5)
@SP // 27926
M=M-1 // 27927

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 1")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27928
A=M // 27929
D=M // 27930
@SP // 27931
AM=M+1 // 27932
A=A-1 // 27933
M=D // 27934
@LCL // 27935
A=M+1 // 27936
D=M // 27937
@SP // 27938
AM=M+1 // 27939
A=A-1 // 27940
M=D // 27941
// call Number.do_add
@7 // 27942
D=A // 27943
@14 // 27944
M=D // 27945
@Number.do_add // 27946
D=A // 27947
@13 // 27948
M=D // 27949
@Vec3.do_normalize.ret.6 // 27950
D=A // 27951
@CALL // 27952
0;JMP // 27953
(Vec3.do_normalize.ret.6)
@SP // 27954
M=M-1 // 27955

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 2")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27956
A=M // 27957
D=M // 27958
@SP // 27959
AM=M+1 // 27960
A=A-1 // 27961
M=D // 27962
@LCL // 27963
A=M+1 // 27964
A=A+1 // 27965
D=M // 27966
@SP // 27967
AM=M+1 // 27968
A=A-1 // 27969
M=D // 27970
// call Number.do_add
@7 // 27971
D=A // 27972
@14 // 27973
M=D // 27974
@Number.do_add // 27975
D=A // 27976
@13 // 27977
M=D // 27978
@Vec3.do_normalize.ret.7 // 27979
D=A // 27980
@CALL // 27981
0;JMP // 27982
(Vec3.do_normalize.ret.7)
@SP // 27983
M=M-1 // 27984

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 27985
A=M // 27986
D=M // 27987
@SP // 27988
AM=M+1 // 27989
A=A-1 // 27990
M=D // 27991
// call Number.do_sqrt
@6 // 27992
D=A // 27993
@14 // 27994
M=D // 27995
@Number.do_sqrt // 27996
D=A // 27997
@13 // 27998
M=D // 27999
@Vec3.do_normalize.ret.8 // 28000
D=A // 28001
@CALL // 28002
0;JMP // 28003
(Vec3.do_normalize.ret.8)
@SP // 28004
M=M-1 // 28005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28006
A=M // 28007
D=M // 28008
@SP // 28009
AM=M+1 // 28010
A=A-1 // 28011
M=D // 28012
@LCL // 28013
A=M // 28014
D=M // 28015
@SP // 28016
AM=M+1 // 28017
A=A-1 // 28018
M=D // 28019
// call Number.do_div
@7 // 28020
D=A // 28021
@14 // 28022
M=D // 28023
@Number.do_div // 28024
D=A // 28025
@13 // 28026
M=D // 28027
@Vec3.do_normalize.ret.9 // 28028
D=A // 28029
@CALL // 28030
0;JMP // 28031
(Vec3.do_normalize.ret.9)
@SP // 28032
M=M-1 // 28033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28034
A=M+1 // 28035
D=M // 28036
@SP // 28037
AM=M+1 // 28038
A=A-1 // 28039
M=D // 28040
@LCL // 28041
A=M // 28042
D=M // 28043
@SP // 28044
AM=M+1 // 28045
A=A-1 // 28046
M=D // 28047
// call Number.do_div
@7 // 28048
D=A // 28049
@14 // 28050
M=D // 28051
@Number.do_div // 28052
D=A // 28053
@13 // 28054
M=D // 28055
@Vec3.do_normalize.ret.10 // 28056
D=A // 28057
@CALL // 28058
0;JMP // 28059
(Vec3.do_normalize.ret.10)
@SP // 28060
M=M-1 // 28061

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 2"), PushInstruction("local 0")], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 28062
A=M+1 // 28063
A=A+1 // 28064
D=M // 28065
@SP // 28066
AM=M+1 // 28067
A=A-1 // 28068
M=D // 28069
@LCL // 28070
A=M // 28071
D=M // 28072
@SP // 28073
AM=M+1 // 28074
A=A-1 // 28075
M=D // 28076
// call Number.do_div
@7 // 28077
D=A // 28078
@14 // 28079
M=D // 28080
@Number.do_div // 28081
D=A // 28082
@13 // 28083
M=D // 28084
@Vec3.do_normalize.ret.11 // 28085
D=A // 28086
@CALL // 28087
0;JMP // 28088
(Vec3.do_normalize.ret.11)
@SP // 28089
M=M-1 // 28090

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28091
A=M // 28092
D=M // 28093
@SP // 28094
AM=M+1 // 28095
A=A-1 // 28096
M=D // 28097
// call Number.dispose
@6 // 28098
D=A // 28099
@14 // 28100
M=D // 28101
@Number.dispose // 28102
D=A // 28103
@13 // 28104
M=D // 28105
@Vec3.do_normalize.ret.12 // 28106
D=A // 28107
@CALL // 28108
0;JMP // 28109
(Vec3.do_normalize.ret.12)
@SP // 28110
M=M-1 // 28111

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28112
A=M+1 // 28113
D=M // 28114
@SP // 28115
AM=M+1 // 28116
A=A-1 // 28117
M=D // 28118
// call Number.dispose
@6 // 28119
D=A // 28120
@14 // 28121
M=D // 28122
@Number.dispose // 28123
D=A // 28124
@13 // 28125
M=D // 28126
@Vec3.do_normalize.ret.13 // 28127
D=A // 28128
@CALL // 28129
0;JMP // 28130
(Vec3.do_normalize.ret.13)
@SP // 28131
M=M-1 // 28132

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28133
A=M+1 // 28134
A=A+1 // 28135
D=M // 28136
@SP // 28137
AM=M+1 // 28138
A=A-1 // 28139
M=D // 28140
// call Number.dispose
@6 // 28141
D=A // 28142
@14 // 28143
M=D // 28144
@Number.dispose // 28145
D=A // 28146
@13 // 28147
M=D // 28148
@Vec3.do_normalize.ret.14 // 28149
D=A // 28150
@CALL // 28151
0;JMP // 28152
(Vec3.do_normalize.ret.14)
@SP // 28153
M=M-1 // 28154

////PushInstruction("constant 0")
@SP // 28155
AM=M+1 // 28156
A=A-1 // 28157
M=0 // 28158
@RETURN // 28159
0;JMP // 28160

////FunctionInstruction{functionName='Int32.cmp', numLocals=2, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.arith_rightshift=2, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul_right_shift_bytes=24, Int32.do_mul=1, Int32.nlz_u4=1, Int32.xor=0, Int32.is_positive=1, Int32.do_add=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.is_negative=0, Int32.getParts=0, Int32.clone=2, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.cmp with 2
(Int32.cmp)
@SP // 28161
M=M+1 // 28162
AM=M+1 // 28163
A=A-1 // 28164
M=0 // 28165
A=A-1 // 28166
M=0 // 28167

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 28168
A=M // 28169
D=M // 28170
@3 // 28171
M=D // 28172

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@3 // 28173
D=M // 28174
@SP // 28175
AM=M+1 // 28176
A=A-1 // 28177
M=D // 28178
// call Int32.clone
@6 // 28179
D=A // 28180
@14 // 28181
M=D // 28182
@Int32.clone // 28183
D=A // 28184
@13 // 28185
M=D // 28186
@Int32.cmp.ret.0 // 28187
D=A // 28188
@CALL // 28189
0;JMP // 28190
(Int32.cmp.ret.0)
@SP // 28191
AM=M-1 // 28192
D=M // 28193
@LCL // 28194
A=M // 28195
M=D // 28196

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 1")], call=CallInstruction{Int32.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28197
A=M // 28198
D=M // 28199
@SP // 28200
AM=M+1 // 28201
A=A-1 // 28202
M=D // 28203
@ARG // 28204
A=M+1 // 28205
D=M // 28206
@SP // 28207
AM=M+1 // 28208
A=A-1 // 28209
M=D // 28210
// call Int32.do_sub
@7 // 28211
D=A // 28212
@14 // 28213
M=D // 28214
@Int32.do_sub // 28215
D=A // 28216
@13 // 28217
M=D // 28218
@Int32.cmp.ret.1 // 28219
D=A // 28220
@CALL // 28221
0;JMP // 28222
(Int32.cmp.ret.1)
@SP // 28223
M=M-1 // 28224

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.is_zero}}, ifGoto=IfGotoInstruction{label='Int32.cmp$IF_TRUE1}}
@LCL // 28225
A=M // 28226
D=M // 28227
@SP // 28228
AM=M+1 // 28229
A=A-1 // 28230
M=D // 28231
// call Int32.is_zero
@6 // 28232
D=A // 28233
@14 // 28234
M=D // 28235
@Int32.is_zero // 28236
D=A // 28237
@13 // 28238
M=D // 28239
@Int32.cmp.ret.2 // 28240
D=A // 28241
@CALL // 28242
0;JMP // 28243
(Int32.cmp.ret.2)
@SP // 28244
AM=M-1 // 28245
D=M // 28246
@Int32.cmp$IF_TRUE1 // 28247
D;JNE // 28248

////GotoInstruction{label='Int32.cmp$IF_FALSE1}
// goto Int32.cmp$IF_FALSE1
@Int32.cmp$IF_FALSE1 // 28249
0;JMP // 28250

////LabelInstruction{label='Int32.cmp$IF_TRUE1}
// label Int32.cmp$IF_TRUE1
(Int32.cmp$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28251
A=M+1 // 28252
M=0 // 28253

////GotoInstruction{label='Int32.cmp$IF_END1}
// goto Int32.cmp$IF_END1
@Int32.cmp$IF_END1 // 28254
0;JMP // 28255

////LabelInstruction{label='Int32.cmp$IF_FALSE1}
// label Int32.cmp$IF_FALSE1
(Int32.cmp$IF_FALSE1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.cmp$IF_TRUE2}}
@LCL // 28256
A=M // 28257
D=M // 28258
@SP // 28259
AM=M+1 // 28260
A=A-1 // 28261
M=D // 28262
// call Int32.is_negative
@6 // 28263
D=A // 28264
@14 // 28265
M=D // 28266
@Int32.is_negative // 28267
D=A // 28268
@13 // 28269
M=D // 28270
@Int32.cmp.ret.3 // 28271
D=A // 28272
@CALL // 28273
0;JMP // 28274
(Int32.cmp.ret.3)
@SP // 28275
AM=M-1 // 28276
D=M // 28277
@Int32.cmp$IF_TRUE2 // 28278
D;JNE // 28279

////GotoInstruction{label='Int32.cmp$IF_FALSE2}
// goto Int32.cmp$IF_FALSE2
@Int32.cmp$IF_FALSE2 // 28280
0;JMP // 28281

////LabelInstruction{label='Int32.cmp$IF_TRUE2}
// label Int32.cmp$IF_TRUE2
(Int32.cmp$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28282
A=M+1 // 28283
M=-1 // 28284

////GotoInstruction{label='Int32.cmp$IF_END2}
// goto Int32.cmp$IF_END2
@Int32.cmp$IF_END2 // 28285
0;JMP // 28286

////LabelInstruction{label='Int32.cmp$IF_FALSE2}
// label Int32.cmp$IF_FALSE2
(Int32.cmp$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28287
A=M+1 // 28288
M=1 // 28289

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

@LCL // 28290
A=M // 28291
D=M // 28292
@SP // 28293
AM=M+1 // 28294
A=A-1 // 28295
M=D // 28296
// call Int32.dispose
@6 // 28297
D=A // 28298
@14 // 28299
M=D // 28300
@Int32.dispose // 28301
D=A // 28302
@13 // 28303
M=D // 28304
@Int32.cmp.ret.4 // 28305
D=A // 28306
@CALL // 28307
0;JMP // 28308
(Int32.cmp.ret.4)
@SP // 28309
M=M-1 // 28310

////PushInstruction("local 1")
@LCL // 28311
A=M+1 // 28312
D=M // 28313
@SP // 28314
AM=M+1 // 28315
A=A-1 // 28316
M=D // 28317
@RETURN // 28318
0;JMP // 28319

////FunctionInstruction{functionName='Int32.do_left_shift_bytes_div', numLocals=11, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_left_shift_bytes_div with 11
(Int32.do_left_shift_bytes_div)
@11 // 28320
D=A // 28321
@SP // 28322
AM=D+M // 28323
A=A-1 // 28324
M=0 // 28325
A=A-1 // 28326
M=0 // 28327
A=A-1 // 28328
M=0 // 28329
A=A-1 // 28330
M=0 // 28331
A=A-1 // 28332
M=0 // 28333
A=A-1 // 28334
M=0 // 28335
A=A-1 // 28336
M=0 // 28337
A=A-1 // 28338
M=0 // 28339
A=A-1 // 28340
M=0 // 28341
A=A-1 // 28342
M=0 // 28343
A=A-1 // 28344
M=0 // 28345

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 28346
A=M // 28347
D=M // 28348
@3 // 28349
M=D // 28350

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 28351
A=M+1 // 28352
A=A+1 // 28353
M=0 // 28354

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 28355
A=M+1 // 28356
A=A+1 // 28357
A=A+1 // 28358
M=0 // 28359

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.is_negative}}], call=CallInstruction{Int32.xor}}
//  pop:  PopInstruction{address=local 4}
//}

@3 // 28360
D=M // 28361
@SP // 28362
AM=M+1 // 28363
A=A-1 // 28364
M=D // 28365
// call Int32.is_negative
@6 // 28366
D=A // 28367
@14 // 28368
M=D // 28369
@Int32.is_negative // 28370
D=A // 28371
@13 // 28372
M=D // 28373
@Int32.do_left_shift_bytes_div.ret.0 // 28374
D=A // 28375
@CALL // 28376
0;JMP // 28377
(Int32.do_left_shift_bytes_div.ret.0)
@ARG // 28378
A=M+1 // 28379
A=A+1 // 28380
D=M // 28381
@SP // 28382
AM=M+1 // 28383
A=A-1 // 28384
M=D // 28385
// call Int32.is_negative
@6 // 28386
D=A // 28387
@14 // 28388
M=D // 28389
@Int32.is_negative // 28390
D=A // 28391
@13 // 28392
M=D // 28393
@Int32.do_left_shift_bytes_div.ret.1 // 28394
D=A // 28395
@CALL // 28396
0;JMP // 28397
(Int32.do_left_shift_bytes_div.ret.1)
// call Int32.xor
@7 // 28398
D=A // 28399
@14 // 28400
M=D // 28401
@Int32.xor // 28402
D=A // 28403
@13 // 28404
M=D // 28405
@Int32.do_left_shift_bytes_div.ret.2 // 28406
D=A // 28407
@CALL // 28408
0;JMP // 28409
(Int32.do_left_shift_bytes_div.ret.2)
@LCL // 28410
D=M // 28411
@4 // 28412
A=D+A // 28413
D=A // 28414
@R13 // 28415
M=D // 28416
@SP // 28417
AM=M-1 // 28418
D=M // 28419
@R13 // 28420
A=M // 28421
M=D // 28422

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE1}}
@3 // 28423
D=M // 28424
@SP // 28425
AM=M+1 // 28426
A=A-1 // 28427
M=D // 28428
// call Int32.is_negative
@6 // 28429
D=A // 28430
@14 // 28431
M=D // 28432
@Int32.is_negative // 28433
D=A // 28434
@13 // 28435
M=D // 28436
@Int32.do_left_shift_bytes_div.ret.3 // 28437
D=A // 28438
@CALL // 28439
0;JMP // 28440
(Int32.do_left_shift_bytes_div.ret.3)
@SP // 28441
AM=M-1 // 28442
D=M // 28443
@Int32.do_left_shift_bytes_div$IF_TRUE1 // 28444
D;JNE // 28445

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE1}
// goto Int32.do_left_shift_bytes_div$IF_FALSE1
@Int32.do_left_shift_bytes_div$IF_FALSE1 // 28446
0;JMP // 28447

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE1}
// label Int32.do_left_shift_bytes_div$IF_TRUE1
(Int32.do_left_shift_bytes_div$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@3 // 28448
D=M // 28449
@SP // 28450
AM=M+1 // 28451
A=A-1 // 28452
M=D // 28453
// call Int32.clone
@6 // 28454
D=A // 28455
@14 // 28456
M=D // 28457
@Int32.clone // 28458
D=A // 28459
@13 // 28460
M=D // 28461
@Int32.do_left_shift_bytes_div.ret.4 // 28462
D=A // 28463
@CALL // 28464
0;JMP // 28465
(Int32.do_left_shift_bytes_div.ret.4)
@SP // 28466
AM=M-1 // 28467
D=M // 28468
@LCL // 28469
A=M+1 // 28470
A=A+1 // 28471
M=D // 28472

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28473
A=M+1 // 28474
A=A+1 // 28475
D=M // 28476
@SP // 28477
AM=M+1 // 28478
A=A-1 // 28479
M=D // 28480
// call Int32.do_abs
@6 // 28481
D=A // 28482
@14 // 28483
M=D // 28484
@Int32.do_abs // 28485
D=A // 28486
@13 // 28487
M=D // 28488
@Int32.do_left_shift_bytes_div.ret.5 // 28489
D=A // 28490
@CALL // 28491
0;JMP // 28492
(Int32.do_left_shift_bytes_div.ret.5)
@SP // 28493
M=M-1 // 28494

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 28495
A=M+1 // 28496
A=A+1 // 28497
D=M // 28498
@SP // 28499
AM=M+1 // 28500
A=A-1 // 28501
M=D // 28502
// call Int32.getParts
@6 // 28503
D=A // 28504
@14 // 28505
M=D // 28506
@Int32.getParts // 28507
D=A // 28508
@13 // 28509
M=D // 28510
@Int32.do_left_shift_bytes_div.ret.6 // 28511
D=A // 28512
@CALL // 28513
0;JMP // 28514
(Int32.do_left_shift_bytes_div.ret.6)
@SP // 28515
AM=M-1 // 28516
D=M // 28517
@LCL // 28518
A=M // 28519
M=D // 28520

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END1}
// goto Int32.do_left_shift_bytes_div$IF_END1
@Int32.do_left_shift_bytes_div$IF_END1 // 28521
0;JMP // 28522

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE1}
// label Int32.do_left_shift_bytes_div$IF_FALSE1
(Int32.do_left_shift_bytes_div$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("this 0")
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 28523
A=M // 28524
D=M // 28525
@LCL // 28526
A=M // 28527
M=D // 28528

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END1}
// label Int32.do_left_shift_bytes_div$IF_END1
(Int32.do_left_shift_bytes_div$IF_END1)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.is_negative}}, ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE2}}
@ARG // 28529
A=M+1 // 28530
A=A+1 // 28531
D=M // 28532
@SP // 28533
AM=M+1 // 28534
A=A-1 // 28535
M=D // 28536
// call Int32.is_negative
@6 // 28537
D=A // 28538
@14 // 28539
M=D // 28540
@Int32.is_negative // 28541
D=A // 28542
@13 // 28543
M=D // 28544
@Int32.do_left_shift_bytes_div.ret.7 // 28545
D=A // 28546
@CALL // 28547
0;JMP // 28548
(Int32.do_left_shift_bytes_div.ret.7)
@SP // 28549
AM=M-1 // 28550
D=M // 28551
@Int32.do_left_shift_bytes_div$IF_TRUE2 // 28552
D;JNE // 28553

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE2}
// goto Int32.do_left_shift_bytes_div$IF_FALSE2
@Int32.do_left_shift_bytes_div$IF_FALSE2 // 28554
0;JMP // 28555

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE2}
// label Int32.do_left_shift_bytes_div$IF_TRUE2
(Int32.do_left_shift_bytes_div$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@ARG // 28556
A=M+1 // 28557
A=A+1 // 28558
D=M // 28559
@SP // 28560
AM=M+1 // 28561
A=A-1 // 28562
M=D // 28563
// call Int32.clone
@6 // 28564
D=A // 28565
@14 // 28566
M=D // 28567
@Int32.clone // 28568
D=A // 28569
@13 // 28570
M=D // 28571
@Int32.do_left_shift_bytes_div.ret.8 // 28572
D=A // 28573
@CALL // 28574
0;JMP // 28575
(Int32.do_left_shift_bytes_div.ret.8)
@SP // 28576
AM=M-1 // 28577
D=M // 28578
@LCL // 28579
A=M+1 // 28580
A=A+1 // 28581
A=A+1 // 28582
M=D // 28583

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.do_abs}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 28584
A=M+1 // 28585
A=A+1 // 28586
A=A+1 // 28587
D=M // 28588
@SP // 28589
AM=M+1 // 28590
A=A-1 // 28591
M=D // 28592
// call Int32.do_abs
@6 // 28593
D=A // 28594
@14 // 28595
M=D // 28596
@Int32.do_abs // 28597
D=A // 28598
@13 // 28599
M=D // 28600
@Int32.do_left_shift_bytes_div.ret.9 // 28601
D=A // 28602
@CALL // 28603
0;JMP // 28604
(Int32.do_left_shift_bytes_div.ret.9)
@SP // 28605
M=M-1 // 28606

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 28607
A=M+1 // 28608
A=A+1 // 28609
A=A+1 // 28610
D=M // 28611
@SP // 28612
AM=M+1 // 28613
A=A-1 // 28614
M=D // 28615
// call Int32.getParts
@6 // 28616
D=A // 28617
@14 // 28618
M=D // 28619
@Int32.getParts // 28620
D=A // 28621
@13 // 28622
M=D // 28623
@Int32.do_left_shift_bytes_div.ret.10 // 28624
D=A // 28625
@CALL // 28626
0;JMP // 28627
(Int32.do_left_shift_bytes_div.ret.10)
@SP // 28628
AM=M-1 // 28629
D=M // 28630
@LCL // 28631
A=M+1 // 28632
M=D // 28633

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END2}
// goto Int32.do_left_shift_bytes_div$IF_END2
@Int32.do_left_shift_bytes_div$IF_END2 // 28634
0;JMP // 28635

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE2}
// label Int32.do_left_shift_bytes_div$IF_FALSE2
(Int32.do_left_shift_bytes_div$IF_FALSE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2")], call=CallInstruction{Int32.getParts}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 28636
A=M+1 // 28637
A=A+1 // 28638
D=M // 28639
@SP // 28640
AM=M+1 // 28641
A=A-1 // 28642
M=D // 28643
// call Int32.getParts
@6 // 28644
D=A // 28645
@14 // 28646
M=D // 28647
@Int32.getParts // 28648
D=A // 28649
@13 // 28650
M=D // 28651
@Int32.do_left_shift_bytes_div.ret.11 // 28652
D=A // 28653
@CALL // 28654
0;JMP // 28655
(Int32.do_left_shift_bytes_div.ret.11)
@SP // 28656
AM=M-1 // 28657
D=M // 28658
@LCL // 28659
A=M+1 // 28660
M=D // 28661

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END2}
// label Int32.do_left_shift_bytes_div$IF_END2
(Int32.do_left_shift_bytes_div$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 5}
//}

@8 // 28662
D=A // 28663
@SP // 28664
AM=M+1 // 28665
A=A-1 // 28666
M=D // 28667
// call Memory.alloc
@6 // 28668
D=A // 28669
@14 // 28670
M=D // 28671
@Memory.alloc // 28672
D=A // 28673
@13 // 28674
M=D // 28675
@Int32.do_left_shift_bytes_div.ret.12 // 28676
D=A // 28677
@CALL // 28678
0;JMP // 28679
(Int32.do_left_shift_bytes_div.ret.12)
@LCL // 28680
D=M // 28681
@5 // 28682
A=D+A // 28683
D=A // 28684
@R13 // 28685
M=D // 28686
@SP // 28687
AM=M-1 // 28688
D=M // 28689
@R13 // 28690
A=M // 28691
M=D // 28692

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 28693
D=M // 28694
@10 // 28695
A=D+A // 28696
M=0 // 28697

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
@Int32.do_left_shift_bytes_div.LT.100 // 28698
D=A // 28699
@SP // 28700
AM=M+1 // 28701
A=A-1 // 28702
M=D // 28703
@LCL // 28704
D=M // 28705
@10 // 28706
A=D+A // 28707
D=M // 28708
@8 // 28709
D=D-A // 28710
@DO_LT // 28711
0;JMP // 28712
(Int32.do_left_shift_bytes_div.LT.100)
D=!D // 28713
@Int32.do_left_shift_bytes_div_WHILE_END1 // 28714
D;JNE // 28715

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
@Int32.do_left_shift_bytes_div.LT.101 // 28716
D=A // 28717
@SP // 28718
AM=M+1 // 28719
A=A-1 // 28720
M=D // 28721
@Int32.do_left_shift_bytes_div.LT.102 // 28722
D=A // 28723
@SP // 28724
AM=M+1 // 28725
A=A-1 // 28726
M=D // 28727
@RETURN_PUSH_LABEL_154 // 28728
D=A // 28729
@13 // 28730
M=D // 28731
@10 // 28732
D=A // 28733
@LCL_PUSH // 28734
0;JMP // 28735
(RETURN_PUSH_LABEL_154)
@ARG // 28736
A=M+1 // 28737
D=M // 28738
@SP // 28739
AM=M-1 // 28740
D=M-D // 28741
@DO_LT // 28742
0;JMP // 28743
(Int32.do_left_shift_bytes_div.LT.102)
@SP // 28744
AM=M+1 // 28745
A=A-1 // 28746
M=D // 28747
@SP // 28748
A=M-1 // 28749
M=!D // 28750
@RETURN_PUSH_LABEL_155 // 28751
D=A // 28752
@13 // 28753
M=D // 28754
@10 // 28755
D=A // 28756
@LCL_PUSH // 28757
0;JMP // 28758
(RETURN_PUSH_LABEL_155)
@ARG // 28759
A=M+1 // 28760
D=M // 28761
@SP // 28762
AM=M-1 // 28763
D=M-D // 28764
@SP // 28765
AM=M-1 // 28766
D=D&M // 28767
@4 // 28768
D=D-A // 28769
@DO_LT // 28770
0;JMP // 28771
(Int32.do_left_shift_bytes_div.LT.101)
@Int32.do_left_shift_bytes_div$IF_TRUE3 // 28772
D;JNE // 28773

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_FALSE3}
// goto Int32.do_left_shift_bytes_div$IF_FALSE3
@Int32.do_left_shift_bytes_div$IF_FALSE3 // 28774
0;JMP // 28775

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
@RETURN_PUSH_LABEL_156 // 28776
D=A // 28777
@13 // 28778
M=D // 28779
@5 // 28780
D=A // 28781
@LCL_PUSH // 28782
0;JMP // 28783
(RETURN_PUSH_LABEL_156)
@LCL // 28784
D=M // 28785
@10 // 28786
A=D+A // 28787
D=M // 28788
@SP // 28789
AM=M-1 // 28790
D=D+M // 28791
@SP // 28792
AM=M+1 // 28793
A=A-1 // 28794
M=D // 28795
@LCL // 28796
A=M // 28797
D=M // 28798
@SP // 28799
AM=M+1 // 28800
A=A-1 // 28801
M=D // 28802
@RETURN_PUSH_LABEL_157 // 28803
D=A // 28804
@13 // 28805
M=D // 28806
@10 // 28807
D=A // 28808
@LCL_PUSH // 28809
0;JMP // 28810
(RETURN_PUSH_LABEL_157)
@ARG // 28811
A=M+1 // 28812
D=M // 28813
@SP // 28814
AM=M-1 // 28815
D=M-D // 28816
@SP // 28817
AM=M-1 // 28818
A=D+M // 28819
D=M // 28820
@SP // 28821
AM=M-1 // 28822
A=M // 28823
M=D // 28824

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END3}
// goto Int32.do_left_shift_bytes_div$IF_END3
@Int32.do_left_shift_bytes_div$IF_END3 // 28825
0;JMP // 28826

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
@RETURN_PUSH_LABEL_158 // 28827
D=A // 28828
@13 // 28829
M=D // 28830
@5 // 28831
D=A // 28832
@LCL_PUSH // 28833
0;JMP // 28834
(RETURN_PUSH_LABEL_158)
@LCL // 28835
D=M // 28836
@10 // 28837
A=D+A // 28838
D=M // 28839
@SP // 28840
AM=M-1 // 28841
D=D+M // 28842
@SP // 28843
AM=M+1 // 28844
A=A-1 // 28845
M=D // 28846
D=0 // 28847
@SP // 28848
AM=M-1 // 28849
A=M // 28850
M=D // 28851

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

@LCL // 28852
D=M // 28853
@10 // 28854
A=D+A // 28855
M=M+1 // 28856

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP1}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP1
@Int32.do_left_shift_bytes_div_WHILE_EXP1 // 28857
0;JMP // 28858

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END1}
// label Int32.do_left_shift_bytes_div_WHILE_END1
(Int32.do_left_shift_bytes_div_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 6}
//}

@16 // 28859
D=A // 28860
@SP // 28861
AM=M+1 // 28862
A=A-1 // 28863
M=D // 28864
// call Memory.alloc
@6 // 28865
D=A // 28866
@14 // 28867
M=D // 28868
@Memory.alloc // 28869
D=A // 28870
@13 // 28871
M=D // 28872
@Int32.do_left_shift_bytes_div.ret.13 // 28873
D=A // 28874
@CALL // 28875
0;JMP // 28876
(Int32.do_left_shift_bytes_div.ret.13)
@LCL // 28877
D=M // 28878
@6 // 28879
A=D+A // 28880
D=A // 28881
@R13 // 28882
M=D // 28883
@SP // 28884
AM=M-1 // 28885
D=M // 28886
@R13 // 28887
A=M // 28888
M=D // 28889

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 28890
D=M // 28891
@10 // 28892
A=D+A // 28893
M=0 // 28894

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
@Int32.do_left_shift_bytes_div.LT.103 // 28895
D=A // 28896
@SP // 28897
AM=M+1 // 28898
A=A-1 // 28899
M=D // 28900
@LCL // 28901
D=M // 28902
@10 // 28903
A=D+A // 28904
D=M // 28905
@8 // 28906
D=D-A // 28907
@DO_LT // 28908
0;JMP // 28909
(Int32.do_left_shift_bytes_div.LT.103)
D=!D // 28910
@Int32.do_left_shift_bytes_div_WHILE_END2 // 28911
D;JNE // 28912

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
@RETURN_PUSH_LABEL_159 // 28913
D=A // 28914
@13 // 28915
M=D // 28916
@6 // 28917
D=A // 28918
@LCL_PUSH // 28919
0;JMP // 28920
(RETURN_PUSH_LABEL_159)
@LCL // 28921
D=M // 28922
@10 // 28923
A=D+A // 28924
D=M // 28925
D=D+1 // 28926
@SP // 28927
AM=M-1 // 28928
D=D+M // 28929
@SP // 28930
AM=M+1 // 28931
A=A-1 // 28932
M=D // 28933
@RETURN_PUSH_LABEL_160 // 28934
D=A // 28935
@13 // 28936
M=D // 28937
@5 // 28938
D=A // 28939
@LCL_PUSH // 28940
0;JMP // 28941
(RETURN_PUSH_LABEL_160)
@LCL // 28942
D=M // 28943
@10 // 28944
A=D+A // 28945
D=M // 28946
@SP // 28947
AM=M-1 // 28948
A=D+M // 28949
D=M // 28950
@15 // 28951
D=D&A // 28952
@SP // 28953
AM=M-1 // 28954
A=M // 28955
M=D // 28956

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
@RETURN_PUSH_LABEL_161 // 28957
D=A // 28958
@13 // 28959
M=D // 28960
@6 // 28961
D=A // 28962
@LCL_PUSH // 28963
0;JMP // 28964
(RETURN_PUSH_LABEL_161)
@LCL // 28965
D=M // 28966
@10 // 28967
A=D+A // 28968
D=M // 28969
D=D+1 // 28970
D=D+1 // 28971
@SP // 28972
AM=M-1 // 28973
D=D+M // 28974
@SP // 28975
AM=M+1 // 28976
A=A-1 // 28977
M=D // 28978
@RETURN_PUSH_LABEL_162 // 28979
D=A // 28980
@13 // 28981
M=D // 28982
@5 // 28983
D=A // 28984
@LCL_PUSH // 28985
0;JMP // 28986
(RETURN_PUSH_LABEL_162)
@LCL // 28987
D=M // 28988
@10 // 28989
A=D+A // 28990
D=M // 28991
@SP // 28992
AM=M-1 // 28993
A=D+M // 28994
D=M // 28995
@SP // 28996
AM=M+1 // 28997
A=A-1 // 28998
M=D // 28999
@4 // 29000
D=A // 29001
@SP // 29002
AM=M+1 // 29003
A=A-1 // 29004
M=D // 29005
// call Int32.arith_rightshift
@7 // 29006
D=A // 29007
@14 // 29008
M=D // 29009
@Int32.arith_rightshift // 29010
D=A // 29011
@13 // 29012
M=D // 29013
@Int32.do_left_shift_bytes_div.ret.14 // 29014
D=A // 29015
@CALL // 29016
0;JMP // 29017
(Int32.do_left_shift_bytes_div.ret.14)
@SP // 29018
AM=M-1 // 29019
D=M // 29020
@SP // 29021
AM=M-1 // 29022
A=M // 29023
M=D // 29024

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

@LCL // 29025
D=M // 29026
@10 // 29027
A=D+A // 29028
M=M+1 // 29029

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP2}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP2
@Int32.do_left_shift_bytes_div_WHILE_EXP2 // 29030
0;JMP // 29031

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END2}
// label Int32.do_left_shift_bytes_div_WHILE_END2
(Int32.do_left_shift_bytes_div_WHILE_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 8")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 7}
//}

@8 // 29032
D=A // 29033
@SP // 29034
AM=M+1 // 29035
A=A-1 // 29036
M=D // 29037
// call Memory.alloc
@6 // 29038
D=A // 29039
@14 // 29040
M=D // 29041
@Memory.alloc // 29042
D=A // 29043
@13 // 29044
M=D // 29045
@Int32.do_left_shift_bytes_div.ret.15 // 29046
D=A // 29047
@CALL // 29048
0;JMP // 29049
(Int32.do_left_shift_bytes_div.ret.15)
@LCL // 29050
D=M // 29051
@7 // 29052
A=D+A // 29053
D=A // 29054
@R13 // 29055
M=D // 29056
@SP // 29057
AM=M-1 // 29058
D=M // 29059
@R13 // 29060
A=M // 29061
M=D // 29062

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29063
D=M // 29064
@10 // 29065
A=D+A // 29066
M=0 // 29067

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
@Int32.do_left_shift_bytes_div.LT.104 // 29068
D=A // 29069
@SP // 29070
AM=M+1 // 29071
A=A-1 // 29072
M=D // 29073
@LCL // 29074
D=M // 29075
@10 // 29076
A=D+A // 29077
D=M // 29078
@4 // 29079
D=D-A // 29080
@DO_LT // 29081
0;JMP // 29082
(Int32.do_left_shift_bytes_div.LT.104)
D=!D // 29083
@Int32.do_left_shift_bytes_div_WHILE_END3 // 29084
D;JNE // 29085

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
@RETURN_PUSH_LABEL_163 // 29086
D=A // 29087
@13 // 29088
M=D // 29089
@7 // 29090
D=A // 29091
@LCL_PUSH // 29092
0;JMP // 29093
(RETURN_PUSH_LABEL_163)
@LCL // 29094
D=M // 29095
@10 // 29096
A=D+A // 29097
D=M // 29098
D=D+M // 29099
@SP // 29100
AM=M-1 // 29101
D=D+M // 29102
@SP // 29103
AM=M+1 // 29104
A=A-1 // 29105
M=D // 29106
@LCL // 29107
A=M+1 // 29108
D=M // 29109
@SP // 29110
AM=M+1 // 29111
A=A-1 // 29112
M=D // 29113
@LCL // 29114
D=M // 29115
@10 // 29116
A=D+A // 29117
D=M // 29118
@SP // 29119
AM=M-1 // 29120
A=D+M // 29121
D=M // 29122
@15 // 29123
D=D&A // 29124
@SP // 29125
AM=M-1 // 29126
A=M // 29127
M=D // 29128

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
@RETURN_PUSH_LABEL_164 // 29129
D=A // 29130
@13 // 29131
M=D // 29132
@7 // 29133
D=A // 29134
@LCL_PUSH // 29135
0;JMP // 29136
(RETURN_PUSH_LABEL_164)
@LCL // 29137
D=M // 29138
@10 // 29139
A=D+A // 29140
D=M // 29141
D=D+M // 29142
D=D+1 // 29143
@SP // 29144
AM=M-1 // 29145
D=D+M // 29146
@SP // 29147
AM=M+1 // 29148
A=A-1 // 29149
M=D // 29150
@LCL // 29151
A=M+1 // 29152
D=M // 29153
@SP // 29154
AM=M+1 // 29155
A=A-1 // 29156
M=D // 29157
@LCL // 29158
D=M // 29159
@10 // 29160
A=D+A // 29161
D=M // 29162
@SP // 29163
AM=M-1 // 29164
A=D+M // 29165
D=M // 29166
@SP // 29167
AM=M+1 // 29168
A=A-1 // 29169
M=D // 29170
@4 // 29171
D=A // 29172
@SP // 29173
AM=M+1 // 29174
A=A-1 // 29175
M=D // 29176
// call Int32.arith_rightshift
@7 // 29177
D=A // 29178
@14 // 29179
M=D // 29180
@Int32.arith_rightshift // 29181
D=A // 29182
@13 // 29183
M=D // 29184
@Int32.do_left_shift_bytes_div.ret.16 // 29185
D=A // 29186
@CALL // 29187
0;JMP // 29188
(Int32.do_left_shift_bytes_div.ret.16)
@SP // 29189
AM=M-1 // 29190
D=M // 29191
@SP // 29192
AM=M-1 // 29193
A=M // 29194
M=D // 29195

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

@LCL // 29196
D=M // 29197
@10 // 29198
A=D+A // 29199
M=M+1 // 29200

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP3}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP3
@Int32.do_left_shift_bytes_div_WHILE_EXP3 // 29201
0;JMP // 29202

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END3}
// label Int32.do_left_shift_bytes_div_WHILE_END3
(Int32.do_left_shift_bytes_div_WHILE_END3)

////PushPopPair {
//  push: PushInstruction("constant 255")
//  pop:  PopInstruction{address=local 9}
//}

@255 // 29203
D=A // 29204
@SP // 29205
AM=M+1 // 29206
A=A-1 // 29207
M=D // 29208
@LCL // 29209
D=M // 29210
@9 // 29211
A=D+A // 29212
D=A // 29213
@R13 // 29214
M=D // 29215
@SP // 29216
AM=M-1 // 29217
D=M // 29218
@R13 // 29219
A=M // 29220
M=D // 29221

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 10}
//}

@7 // 29222
D=A // 29223
@SP // 29224
AM=M+1 // 29225
A=A-1 // 29226
M=D // 29227
@LCL // 29228
D=M // 29229
@10 // 29230
A=D+A // 29231
D=A // 29232
@R13 // 29233
M=D // 29234
@SP // 29235
AM=M-1 // 29236
D=M // 29237
@R13 // 29238
A=M // 29239
M=D // 29240

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
@Int32.do_left_shift_bytes_div.LT.105 // 29241
D=A // 29242
@SP // 29243
AM=M+1 // 29244
A=A-1 // 29245
M=D // 29246
@LCL // 29247
D=M // 29248
@10 // 29249
A=D+A // 29250
D=M // 29251
@DO_LT // 29252
0;JMP // 29253
(Int32.do_left_shift_bytes_div.LT.105)
@Int32.do_left_shift_bytes_div_WHILE_END4 // 29254
D;JNE // 29255

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
@Int32.do_left_shift_bytes_div.GT.106 // 29256
D=A // 29257
@SP // 29258
AM=M+1 // 29259
A=A-1 // 29260
M=D // 29261
@LCL // 29262
D=M // 29263
@10 // 29264
A=D+A // 29265
D=M // 29266
A=A-1 // 29267
A=A-1 // 29268
A=A-1 // 29269
A=D+M // 29270
D=M // 29271
@DO_GT // 29272
0;JMP // 29273
(Int32.do_left_shift_bytes_div.GT.106)
@Int32.do_left_shift_bytes_div$IF_TRUE4 // 29274
D;JNE // 29275

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END4}
// goto Int32.do_left_shift_bytes_div$IF_END4
@Int32.do_left_shift_bytes_div$IF_END4 // 29276
0;JMP // 29277

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

@LCL // 29278
D=M // 29279
@10 // 29280
A=D+A // 29281
D=M // 29282
D=D+1 // 29283
@SP // 29284
AM=M+1 // 29285
A=A-1 // 29286
M=D // 29287
@LCL // 29288
D=M // 29289
@9 // 29290
A=D+A // 29291
D=A // 29292
@R13 // 29293
M=D // 29294
@SP // 29295
AM=M-1 // 29296
D=M // 29297
@R13 // 29298
A=M // 29299
M=D // 29300

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29301
D=M // 29302
@10 // 29303
A=D+A // 29304
M=-1 // 29305

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

@LCL // 29306
D=M // 29307
@10 // 29308
A=D+A // 29309
M=M-1 // 29310

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP4}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP4
@Int32.do_left_shift_bytes_div_WHILE_EXP4 // 29311
0;JMP // 29312

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END4}
// label Int32.do_left_shift_bytes_div_WHILE_END4
(Int32.do_left_shift_bytes_div_WHILE_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 7"), PushInstruction("local 9")], call=CallInstruction{Int32.u4_array_div_u4_array}}
//  pop:  PopInstruction{address=local 8}
//}

@RETURN_PUSH_LABEL_165 // 29313
D=A // 29314
@13 // 29315
M=D // 29316
@6 // 29317
D=A // 29318
@LCL_PUSH // 29319
0;JMP // 29320
(RETURN_PUSH_LABEL_165)
@RETURN_PUSH_LABEL_166 // 29321
D=A // 29322
@13 // 29323
M=D // 29324
@7 // 29325
D=A // 29326
@LCL_PUSH // 29327
0;JMP // 29328
(RETURN_PUSH_LABEL_166)
@RETURN_PUSH_LABEL_167 // 29329
D=A // 29330
@13 // 29331
M=D // 29332
@9 // 29333
D=A // 29334
@LCL_PUSH // 29335
0;JMP // 29336
(RETURN_PUSH_LABEL_167)
// call Int32.u4_array_div_u4_array
@8 // 29337
D=A // 29338
@14 // 29339
M=D // 29340
@Int32.u4_array_div_u4_array // 29341
D=A // 29342
@13 // 29343
M=D // 29344
@Int32.do_left_shift_bytes_div.ret.17 // 29345
D=A // 29346
@CALL // 29347
0;JMP // 29348
(Int32.do_left_shift_bytes_div.ret.17)
@LCL // 29349
D=M // 29350
@8 // 29351
A=D+A // 29352
D=A // 29353
@R13 // 29354
M=D // 29355
@SP // 29356
AM=M-1 // 29357
D=M // 29358
@R13 // 29359
A=M // 29360
M=D // 29361

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 10}
//}

@LCL // 29362
D=M // 29363
@10 // 29364
A=D+A // 29365
M=0 // 29366

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
@Int32.do_left_shift_bytes_div.LT.107 // 29367
D=A // 29368
@SP // 29369
AM=M+1 // 29370
A=A-1 // 29371
M=D // 29372
@LCL // 29373
D=M // 29374
@10 // 29375
A=D+A // 29376
D=M // 29377
@4 // 29378
D=D-A // 29379
@DO_LT // 29380
0;JMP // 29381
(Int32.do_left_shift_bytes_div.LT.107)
D=!D // 29382
@Int32.do_left_shift_bytes_div_WHILE_END5 // 29383
D;JNE // 29384

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
@THIS // 29385
A=M // 29386
D=M // 29387
@SP // 29388
AM=M+1 // 29389
A=A-1 // 29390
M=D // 29391
@LCL // 29392
D=M // 29393
@10 // 29394
A=D+A // 29395
D=M // 29396
@SP // 29397
AM=M-1 // 29398
D=D+M // 29399
@SP // 29400
AM=M+1 // 29401
A=A-1 // 29402
M=D // 29403
@RETURN_PUSH_LABEL_168 // 29404
D=A // 29405
@13 // 29406
M=D // 29407
@8 // 29408
D=A // 29409
@LCL_PUSH // 29410
0;JMP // 29411
(RETURN_PUSH_LABEL_168)
@LCL // 29412
D=M // 29413
@10 // 29414
A=D+A // 29415
D=M // 29416
D=D+M // 29417
@SP // 29418
AM=M-1 // 29419
A=D+M // 29420
D=M // 29421
@SP // 29422
AM=M+1 // 29423
A=A-1 // 29424
M=D // 29425
@RETURN_PUSH_LABEL_169 // 29426
D=A // 29427
@13 // 29428
M=D // 29429
@8 // 29430
D=A // 29431
@LCL_PUSH // 29432
0;JMP // 29433
(RETURN_PUSH_LABEL_169)
@LCL // 29434
D=M // 29435
@10 // 29436
A=D+A // 29437
D=M // 29438
D=D+M // 29439
D=D+1 // 29440
@SP // 29441
AM=M-1 // 29442
A=D+M // 29443
D=M // 29444
@SP // 29445
AM=M+1 // 29446
A=A-1 // 29447
M=D // 29448
@16 // 29449
D=A // 29450
@SP // 29451
AM=M+1 // 29452
A=A-1 // 29453
M=D // 29454
// call Math.multiply
@7 // 29455
D=A // 29456
@14 // 29457
M=D // 29458
@Math.multiply // 29459
D=A // 29460
@13 // 29461
M=D // 29462
@Int32.do_left_shift_bytes_div.ret.18 // 29463
D=A // 29464
@CALL // 29465
0;JMP // 29466
(Int32.do_left_shift_bytes_div.ret.18)
@SP // 29467
AM=M-1 // 29468
D=M // 29469
@SP // 29470
AM=M-1 // 29471
D=D+M // 29472
@SP // 29473
AM=M-1 // 29474
A=M // 29475
M=D // 29476

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

@LCL // 29477
D=M // 29478
@10 // 29479
A=D+A // 29480
M=M+1 // 29481

////GotoInstruction{label='Int32.do_left_shift_bytes_div_WHILE_EXP5}
// goto Int32.do_left_shift_bytes_div_WHILE_EXP5
@Int32.do_left_shift_bytes_div_WHILE_EXP5 // 29482
0;JMP // 29483

////LabelInstruction{label='Int32.do_left_shift_bytes_div_WHILE_END5}
// label Int32.do_left_shift_bytes_div_WHILE_END5
(Int32.do_left_shift_bytes_div_WHILE_END5)

////ConditionalGroup{push=PushInstruction("local 4"), ifGoto=IfGotoInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE5}}
@LCL // 29484
D=M // 29485
@4 // 29486
A=D+A // 29487
D=M // 29488
@Int32.do_left_shift_bytes_div$IF_TRUE5 // 29489
D;JNE // 29490

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END5}
// goto Int32.do_left_shift_bytes_div$IF_END5
@Int32.do_left_shift_bytes_div$IF_END5 // 29491
0;JMP // 29492

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE5}
// label Int32.do_left_shift_bytes_div$IF_TRUE5
(Int32.do_left_shift_bytes_div$IF_TRUE5)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Int32.do_neg}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 29493
D=M // 29494
@SP // 29495
AM=M+1 // 29496
A=A-1 // 29497
M=D // 29498
// call Int32.do_neg
@6 // 29499
D=A // 29500
@14 // 29501
M=D // 29502
@Int32.do_neg // 29503
D=A // 29504
@13 // 29505
M=D // 29506
@Int32.do_left_shift_bytes_div.ret.19 // 29507
D=A // 29508
@CALL // 29509
0;JMP // 29510
(Int32.do_left_shift_bytes_div.ret.19)
@SP // 29511
M=M-1 // 29512

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
@Int32.do_left_shift_bytes_div.EQ.108 // 29513
D=A // 29514
@SP // 29515
AM=M+1 // 29516
A=A-1 // 29517
M=D // 29518
@LCL // 29519
A=M+1 // 29520
A=A+1 // 29521
D=M // 29522
@DO_EQ // 29523
0;JMP // 29524
(Int32.do_left_shift_bytes_div.EQ.108)
D=!D // 29525
@Int32.do_left_shift_bytes_div$IF_TRUE6 // 29526
D;JNE // 29527

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END6}
// goto Int32.do_left_shift_bytes_div$IF_END6
@Int32.do_left_shift_bytes_div$IF_END6 // 29528
0;JMP // 29529

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE6}
// label Int32.do_left_shift_bytes_div$IF_TRUE6
(Int32.do_left_shift_bytes_div$IF_TRUE6)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29530
A=M+1 // 29531
A=A+1 // 29532
D=M // 29533
@SP // 29534
AM=M+1 // 29535
A=A-1 // 29536
M=D // 29537
// call Int32.dispose
@6 // 29538
D=A // 29539
@14 // 29540
M=D // 29541
@Int32.dispose // 29542
D=A // 29543
@13 // 29544
M=D // 29545
@Int32.do_left_shift_bytes_div.ret.20 // 29546
D=A // 29547
@CALL // 29548
0;JMP // 29549
(Int32.do_left_shift_bytes_div.ret.20)
@SP // 29550
M=M-1 // 29551

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
@Int32.do_left_shift_bytes_div.EQ.109 // 29552
D=A // 29553
@SP // 29554
AM=M+1 // 29555
A=A-1 // 29556
M=D // 29557
@LCL // 29558
A=M+1 // 29559
A=A+1 // 29560
A=A+1 // 29561
D=M // 29562
@DO_EQ // 29563
0;JMP // 29564
(Int32.do_left_shift_bytes_div.EQ.109)
D=!D // 29565
@Int32.do_left_shift_bytes_div$IF_TRUE7 // 29566
D;JNE // 29567

////GotoInstruction{label='Int32.do_left_shift_bytes_div$IF_END7}
// goto Int32.do_left_shift_bytes_div$IF_END7
@Int32.do_left_shift_bytes_div$IF_END7 // 29568
0;JMP // 29569

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_TRUE7}
// label Int32.do_left_shift_bytes_div$IF_TRUE7
(Int32.do_left_shift_bytes_div$IF_TRUE7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Int32.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29570
A=M+1 // 29571
A=A+1 // 29572
A=A+1 // 29573
D=M // 29574
@SP // 29575
AM=M+1 // 29576
A=A-1 // 29577
M=D // 29578
// call Int32.dispose
@6 // 29579
D=A // 29580
@14 // 29581
M=D // 29582
@Int32.dispose // 29583
D=A // 29584
@13 // 29585
M=D // 29586
@Int32.do_left_shift_bytes_div.ret.21 // 29587
D=A // 29588
@CALL // 29589
0;JMP // 29590
(Int32.do_left_shift_bytes_div.ret.21)
@SP // 29591
M=M-1 // 29592

////LabelInstruction{label='Int32.do_left_shift_bytes_div$IF_END7}
// label Int32.do_left_shift_bytes_div$IF_END7
(Int32.do_left_shift_bytes_div$IF_END7)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_170 // 29593
D=A // 29594
@13 // 29595
M=D // 29596
@5 // 29597
D=A // 29598
@LCL_PUSH // 29599
0;JMP // 29600
(RETURN_PUSH_LABEL_170)
// call Memory.deAlloc
@6 // 29601
D=A // 29602
@14 // 29603
M=D // 29604
@Memory.deAlloc // 29605
D=A // 29606
@13 // 29607
M=D // 29608
@Int32.do_left_shift_bytes_div.ret.22 // 29609
D=A // 29610
@CALL // 29611
0;JMP // 29612
(Int32.do_left_shift_bytes_div.ret.22)
@SP // 29613
M=M-1 // 29614

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_171 // 29615
D=A // 29616
@13 // 29617
M=D // 29618
@6 // 29619
D=A // 29620
@LCL_PUSH // 29621
0;JMP // 29622
(RETURN_PUSH_LABEL_171)
// call Memory.deAlloc
@6 // 29623
D=A // 29624
@14 // 29625
M=D // 29626
@Memory.deAlloc // 29627
D=A // 29628
@13 // 29629
M=D // 29630
@Int32.do_left_shift_bytes_div.ret.23 // 29631
D=A // 29632
@CALL // 29633
0;JMP // 29634
(Int32.do_left_shift_bytes_div.ret.23)
@SP // 29635
M=M-1 // 29636

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_172 // 29637
D=A // 29638
@13 // 29639
M=D // 29640
@7 // 29641
D=A // 29642
@LCL_PUSH // 29643
0;JMP // 29644
(RETURN_PUSH_LABEL_172)
// call Memory.deAlloc
@6 // 29645
D=A // 29646
@14 // 29647
M=D // 29648
@Memory.deAlloc // 29649
D=A // 29650
@13 // 29651
M=D // 29652
@Int32.do_left_shift_bytes_div.ret.24 // 29653
D=A // 29654
@CALL // 29655
0;JMP // 29656
(Int32.do_left_shift_bytes_div.ret.24)
@SP // 29657
M=M-1 // 29658

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_173 // 29659
D=A // 29660
@13 // 29661
M=D // 29662
@8 // 29663
D=A // 29664
@LCL_PUSH // 29665
0;JMP // 29666
(RETURN_PUSH_LABEL_173)
// call Memory.deAlloc
@6 // 29667
D=A // 29668
@14 // 29669
M=D // 29670
@Memory.deAlloc // 29671
D=A // 29672
@13 // 29673
M=D // 29674
@Int32.do_left_shift_bytes_div.ret.25 // 29675
D=A // 29676
@CALL // 29677
0;JMP // 29678
(Int32.do_left_shift_bytes_div.ret.25)
@SP // 29679
M=M-1 // 29680

////PushInstruction("constant 0")
@SP // 29681
AM=M+1 // 29682
A=A-1 // 29683
M=0 // 29684
@RETURN // 29685
0;JMP // 29686

////FunctionInstruction{functionName='Ray.getOrigin', numLocals=0, funcMapping={Ray.getDirection=0}}
// function Ray.getOrigin with 0
(Ray.getOrigin)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29687
A=M // 29688
D=M // 29689
@3 // 29690
M=D // 29691

////PushInstruction("this 0")
@THIS // 29692
A=M // 29693
D=M // 29694
@SP // 29695
AM=M+1 // 29696
A=A-1 // 29697
M=D // 29698
@RETURN // 29699
0;JMP // 29700

////FunctionInstruction{functionName='Ray.dispose', numLocals=0, funcMapping={Ray.getOrigin=0, Ray.getDirection=0}}
// function Ray.dispose with 0
(Ray.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29701
A=M // 29702
D=M // 29703
@3 // 29704
M=D // 29705

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

@Ray.0 // 29706
M=M-1 // 29707

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29708
A=M // 29709
D=M // 29710
@SP // 29711
AM=M+1 // 29712
A=A-1 // 29713
M=D // 29714
// call Vec3.dispose
@6 // 29715
D=A // 29716
@14 // 29717
M=D // 29718
@Vec3.dispose // 29719
D=A // 29720
@13 // 29721
M=D // 29722
@Ray.dispose.ret.0 // 29723
D=A // 29724
@CALL // 29725
0;JMP // 29726
(Ray.dispose.ret.0)
@SP // 29727
M=M-1 // 29728

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29729
A=M+1 // 29730
D=M // 29731
@SP // 29732
AM=M+1 // 29733
A=A-1 // 29734
M=D // 29735
// call Vec3.dispose
@6 // 29736
D=A // 29737
@14 // 29738
M=D // 29739
@Vec3.dispose // 29740
D=A // 29741
@13 // 29742
M=D // 29743
@Ray.dispose.ret.1 // 29744
D=A // 29745
@CALL // 29746
0;JMP // 29747
(Ray.dispose.ret.1)
@SP // 29748
M=M-1 // 29749

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 29750
D=M // 29751
@SP // 29752
AM=M+1 // 29753
A=A-1 // 29754
M=D // 29755
// call Memory.deAlloc
@6 // 29756
D=A // 29757
@14 // 29758
M=D // 29759
@Memory.deAlloc // 29760
D=A // 29761
@13 // 29762
M=D // 29763
@Ray.dispose.ret.2 // 29764
D=A // 29765
@CALL // 29766
0;JMP // 29767
(Ray.dispose.ret.2)
@SP // 29768
M=M-1 // 29769

////PushInstruction("constant 0")
@SP // 29770
AM=M+1 // 29771
A=A-1 // 29772
M=0 // 29773
@RETURN // 29774
0;JMP // 29775

////FunctionInstruction{functionName='Number.is_zero', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.is_zero with 0
(Number.is_zero)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29776
A=M // 29777
D=M // 29778
@3 // 29779
M=D // 29780

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_zero}}
@THIS // 29781
A=M // 29782
D=M // 29783
@SP // 29784
AM=M+1 // 29785
A=A-1 // 29786
M=D // 29787
// call Int32.is_zero
@6 // 29788
D=A // 29789
@14 // 29790
M=D // 29791
@Int32.is_zero // 29792
D=A // 29793
@13 // 29794
M=D // 29795
@Number.is_zero.ret.0 // 29796
D=A // 29797
@CALL // 29798
0;JMP // 29799
(Number.is_zero.ret.0)
@RETURN // 29800
0;JMP // 29801

////FunctionInstruction{functionName='Ray.new', numLocals=0, funcMapping={Ray.getOrigin=0, Ray.dispose=3, Ray.getDirection=0}}
// function Ray.new with 0
(Ray.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 29802
D=A // 29803
@SP // 29804
AM=M+1 // 29805
A=A-1 // 29806
M=D // 29807
// call Memory.alloc
@6 // 29808
D=A // 29809
@14 // 29810
M=D // 29811
@Memory.alloc // 29812
D=A // 29813
@13 // 29814
M=D // 29815
@Ray.new.ret.0 // 29816
D=A // 29817
@CALL // 29818
0;JMP // 29819
(Ray.new.ret.0)
@SP // 29820
AM=M-1 // 29821
D=M // 29822
@3 // 29823
M=D // 29824

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

@Ray.0 // 29825
M=M+1 // 29826

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 29827
A=M // 29828
D=M // 29829
@THIS // 29830
A=M // 29831
M=D // 29832

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 29833
A=M+1 // 29834
D=M // 29835
@THIS // 29836
A=M+1 // 29837
M=D // 29838

////PushInstruction("pointer 0")
@3 // 29839
D=M // 29840
@SP // 29841
AM=M+1 // 29842
A=A-1 // 29843
M=D // 29844
@RETURN // 29845
0;JMP // 29846

////FunctionInstruction{functionName='Number.new_from_int_frac', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.to_int32=2}}
// function Number.new_from_int_frac with 0
(Number.new_from_int_frac)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 29847
AM=M+1 // 29848
A=A-1 // 29849
M=1 // 29850
// call Memory.alloc
@6 // 29851
D=A // 29852
@14 // 29853
M=D // 29854
@Memory.alloc // 29855
D=A // 29856
@13 // 29857
M=D // 29858
@Number.new_from_int_frac.ret.0 // 29859
D=A // 29860
@CALL // 29861
0;JMP // 29862
(Number.new_from_int_frac.ret.0)
@SP // 29863
AM=M-1 // 29864
D=M // 29865
@3 // 29866
M=D // 29867

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

@Number.5 // 29868
M=M+1 // 29869

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 29870
A=M // 29871
D=M // 29872
@SP // 29873
AM=M+1 // 29874
A=A-1 // 29875
M=D // 29876
// call Int32.new
@6 // 29877
D=A // 29878
@14 // 29879
M=D // 29880
@Int32.new // 29881
D=A // 29882
@13 // 29883
M=D // 29884
@Number.new_from_int_frac.ret.1 // 29885
D=A // 29886
@CALL // 29887
0;JMP // 29888
(Number.new_from_int_frac.ret.1)
@SP // 29889
AM=M-1 // 29890
D=M // 29891
@THIS // 29892
A=M // 29893
M=D // 29894

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("static 4")], call=CallInstruction{Int32.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 29895
A=M // 29896
D=M // 29897
@SP // 29898
AM=M+1 // 29899
A=A-1 // 29900
M=D // 29901
@Number.4 // 29902
D=M // 29903
@SP // 29904
AM=M+1 // 29905
A=A-1 // 29906
M=D // 29907
// call Int32.do_mul
@7 // 29908
D=A // 29909
@14 // 29910
M=D // 29911
@Int32.do_mul // 29912
D=A // 29913
@13 // 29914
M=D // 29915
@Number.new_from_int_frac.ret.2 // 29916
D=A // 29917
@CALL // 29918
0;JMP // 29919
(Number.new_from_int_frac.ret.2)
@SP // 29920
M=M-1 // 29921

////PushInstruction("pointer 0")
@3 // 29922
D=M // 29923
@SP // 29924
AM=M+1 // 29925
A=A-1 // 29926
M=D // 29927
@RETURN // 29928
0;JMP // 29929

////FunctionInstruction{functionName='Scene.getWidth', numLocals=0, funcMapping={Scene.getHeight=0, Scene.getNumLights=0, Scene.getLights=0, Scene.trace=7, Scene.new=5, Scene.create_prime_ray=20, Scene.dispose=8}}
// function Scene.getWidth with 0
(Scene.getWidth)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29930
A=M // 29931
D=M // 29932
@3 // 29933
M=D // 29934

////PushInstruction("this 0")
@THIS // 29935
A=M // 29936
D=M // 29937
@SP // 29938
AM=M+1 // 29939
A=A-1 // 29940
M=D // 29941
@RETURN // 29942
0;JMP // 29943

////FunctionInstruction{functionName='Sphere.intersect', numLocals=8, funcMapping={Sphere.new=1, Sphere.color=1, Sphere.dispose=4}}
// function Sphere.intersect with 8
(Sphere.intersect)
@8 // 29944
D=A // 29945
@SP // 29946
AM=D+M // 29947
A=A-1 // 29948
M=0 // 29949
A=A-1 // 29950
M=0 // 29951
A=A-1 // 29952
M=0 // 29953
A=A-1 // 29954
M=0 // 29955
A=A-1 // 29956
M=0 // 29957
A=A-1 // 29958
M=0 // 29959
A=A-1 // 29960
M=0 // 29961
A=A-1 // 29962
M=0 // 29963

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 29964
A=M // 29965
D=M // 29966
@3 // 29967
M=D // 29968

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@THIS // 29969
A=M // 29970
D=M // 29971
@SP // 29972
AM=M+1 // 29973
A=A-1 // 29974
M=D // 29975
// call Vec3.clone
@6 // 29976
D=A // 29977
@14 // 29978
M=D // 29979
@Vec3.clone // 29980
D=A // 29981
@13 // 29982
M=D // 29983
@Sphere.intersect.ret.0 // 29984
D=A // 29985
@CALL // 29986
0;JMP // 29987
(Sphere.intersect.ret.0)
@SP // 29988
AM=M-1 // 29989
D=M // 29990
@LCL // 29991
A=M // 29992
M=D // 29993

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getOrigin}}], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 29994
A=M // 29995
D=M // 29996
@SP // 29997
AM=M+1 // 29998
A=A-1 // 29999
M=D // 30000
@ARG // 30001
A=M+1 // 30002
D=M // 30003
@SP // 30004
AM=M+1 // 30005
A=A-1 // 30006
M=D // 30007
// call Ray.getOrigin
@6 // 30008
D=A // 30009
@14 // 30010
M=D // 30011
@Ray.getOrigin // 30012
D=A // 30013
@13 // 30014
M=D // 30015
@Sphere.intersect.ret.1 // 30016
D=A // 30017
@CALL // 30018
0;JMP // 30019
(Sphere.intersect.ret.1)
// call Vec3.do_sub
@7 // 30020
D=A // 30021
@14 // 30022
M=D // 30023
@Vec3.do_sub // 30024
D=A // 30025
@13 // 30026
M=D // 30027
@Sphere.intersect.ret.2 // 30028
D=A // 30029
@CALL // 30030
0;JMP // 30031
(Sphere.intersect.ret.2)
@SP // 30032
M=M-1 // 30033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Ray.getDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 30034
A=M // 30035
D=M // 30036
@SP // 30037
AM=M+1 // 30038
A=A-1 // 30039
M=D // 30040
@ARG // 30041
A=M+1 // 30042
D=M // 30043
@SP // 30044
AM=M+1 // 30045
A=A-1 // 30046
M=D // 30047
// call Ray.getDirection
@6 // 30048
D=A // 30049
@14 // 30050
M=D // 30051
@Ray.getDirection // 30052
D=A // 30053
@13 // 30054
M=D // 30055
@Sphere.intersect.ret.3 // 30056
D=A // 30057
@CALL // 30058
0;JMP // 30059
(Sphere.intersect.ret.3)
// call Vec3.dot
@7 // 30060
D=A // 30061
@14 // 30062
M=D // 30063
@Vec3.dot // 30064
D=A // 30065
@13 // 30066
M=D // 30067
@Sphere.intersect.ret.4 // 30068
D=A // 30069
@CALL // 30070
0;JMP // 30071
(Sphere.intersect.ret.4)
@SP // 30072
AM=M-1 // 30073
D=M // 30074
@LCL // 30075
A=M+1 // 30076
M=D // 30077

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 30078
A=M+1 // 30079
D=M // 30080
@SP // 30081
AM=M+1 // 30082
A=A-1 // 30083
M=D // 30084
// call Number.clone
@6 // 30085
D=A // 30086
@14 // 30087
M=D // 30088
@Number.clone // 30089
D=A // 30090
@13 // 30091
M=D // 30092
@Sphere.intersect.ret.5 // 30093
D=A // 30094
@CALL // 30095
0;JMP // 30096
(Sphere.intersect.ret.5)
@SP // 30097
AM=M-1 // 30098
D=M // 30099
@LCL // 30100
A=M+1 // 30101
A=A+1 // 30102
M=D // 30103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30104
A=M+1 // 30105
A=A+1 // 30106
D=M // 30107
@SP // 30108
AM=M+1 // 30109
A=A-1 // 30110
M=D // 30111
@LCL // 30112
A=M+1 // 30113
D=M // 30114
@SP // 30115
AM=M+1 // 30116
A=A-1 // 30117
M=D // 30118
// call Number.do_mul
@7 // 30119
D=A // 30120
@14 // 30121
M=D // 30122
@Number.do_mul // 30123
D=A // 30124
@13 // 30125
M=D // 30126
@Sphere.intersect.ret.6 // 30127
D=A // 30128
@CALL // 30129
0;JMP // 30130
(Sphere.intersect.ret.6)
@SP // 30131
M=M-1 // 30132

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@THIS // 30133
A=M+1 // 30134
D=M // 30135
@SP // 30136
AM=M+1 // 30137
A=A-1 // 30138
M=D // 30139
// call Number.clone
@6 // 30140
D=A // 30141
@14 // 30142
M=D // 30143
@Number.clone // 30144
D=A // 30145
@13 // 30146
M=D // 30147
@Sphere.intersect.ret.7 // 30148
D=A // 30149
@CALL // 30150
0;JMP // 30151
(Sphere.intersect.ret.7)
@SP // 30152
AM=M-1 // 30153
D=M // 30154
@LCL // 30155
A=M+1 // 30156
A=A+1 // 30157
A=A+1 // 30158
M=D // 30159

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("this 1")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30160
A=M+1 // 30161
A=A+1 // 30162
A=A+1 // 30163
D=M // 30164
@SP // 30165
AM=M+1 // 30166
A=A-1 // 30167
M=D // 30168
@THIS // 30169
A=M+1 // 30170
D=M // 30171
@SP // 30172
AM=M+1 // 30173
A=A-1 // 30174
M=D // 30175
// call Number.do_mul
@7 // 30176
D=A // 30177
@14 // 30178
M=D // 30179
@Number.do_mul // 30180
D=A // 30181
@13 // 30182
M=D // 30183
@Sphere.intersect.ret.8 // 30184
D=A // 30185
@CALL // 30186
0;JMP // 30187
(Sphere.intersect.ret.8)
@SP // 30188
M=M-1 // 30189

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dist_sq}}
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 30190
A=M // 30191
D=M // 30192
@SP // 30193
AM=M+1 // 30194
A=A-1 // 30195
M=D // 30196
// call Vec3.dist_sq
@6 // 30197
D=A // 30198
@14 // 30199
M=D // 30200
@Vec3.dist_sq // 30201
D=A // 30202
@13 // 30203
M=D // 30204
@Sphere.intersect.ret.9 // 30205
D=A // 30206
@CALL // 30207
0;JMP // 30208
(Sphere.intersect.ret.9)
@LCL // 30209
D=M // 30210
@4 // 30211
A=D+A // 30212
D=A // 30213
@R13 // 30214
M=D // 30215
@SP // 30216
AM=M-1 // 30217
D=M // 30218
@R13 // 30219
A=M // 30220
M=D // 30221

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 2")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_174 // 30222
D=A // 30223
@13 // 30224
M=D // 30225
@4 // 30226
D=A // 30227
@LCL_PUSH // 30228
0;JMP // 30229
(RETURN_PUSH_LABEL_174)
@LCL // 30230
A=M+1 // 30231
A=A+1 // 30232
D=M // 30233
@SP // 30234
AM=M+1 // 30235
A=A-1 // 30236
M=D // 30237
// call Number.do_sub
@7 // 30238
D=A // 30239
@14 // 30240
M=D // 30241
@Number.do_sub // 30242
D=A // 30243
@13 // 30244
M=D // 30245
@Sphere.intersect.ret.10 // 30246
D=A // 30247
@CALL // 30248
0;JMP // 30249
(Sphere.intersect.ret.10)
@SP // 30250
M=M-1 // 30251

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("local 3")], call=CallInstruction{Number.cmp}},
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE1}}
@Sphere.intersect.GT.110 // 30252
D=A // 30253
@SP // 30254
AM=M+1 // 30255
A=A-1 // 30256
M=D // 30257
@RETURN_PUSH_LABEL_175 // 30258
D=A // 30259
@13 // 30260
M=D // 30261
@4 // 30262
D=A // 30263
@LCL_PUSH // 30264
0;JMP // 30265
(RETURN_PUSH_LABEL_175)
@LCL // 30266
A=M+1 // 30267
A=A+1 // 30268
A=A+1 // 30269
D=M // 30270
@SP // 30271
AM=M+1 // 30272
A=A-1 // 30273
M=D // 30274
// call Number.cmp
@7 // 30275
D=A // 30276
@14 // 30277
M=D // 30278
@Number.cmp // 30279
D=A // 30280
@13 // 30281
M=D // 30282
@Sphere.intersect.ret.11 // 30283
D=A // 30284
@CALL // 30285
0;JMP // 30286
(Sphere.intersect.ret.11)
@SP // 30287
AM=M-1 // 30288
D=M // 30289
@DO_GT // 30290
0;JMP // 30291
(Sphere.intersect.GT.110)
@Sphere.intersect$IF_TRUE1 // 30292
D;JNE // 30293

////GotoInstruction{label='Sphere.intersect$IF_END1}
// goto Sphere.intersect$IF_END1
@Sphere.intersect$IF_END1 // 30294
0;JMP // 30295

////LabelInstruction{label='Sphere.intersect$IF_TRUE1}
// label Sphere.intersect$IF_TRUE1
(Sphere.intersect$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30296
A=M // 30297
D=M // 30298
@SP // 30299
AM=M+1 // 30300
A=A-1 // 30301
M=D // 30302
// call Vec3.dispose
@6 // 30303
D=A // 30304
@14 // 30305
M=D // 30306
@Vec3.dispose // 30307
D=A // 30308
@13 // 30309
M=D // 30310
@Sphere.intersect.ret.12 // 30311
D=A // 30312
@CALL // 30313
0;JMP // 30314
(Sphere.intersect.ret.12)
@SP // 30315
M=M-1 // 30316

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30317
A=M+1 // 30318
D=M // 30319
@SP // 30320
AM=M+1 // 30321
A=A-1 // 30322
M=D // 30323
// call Number.dispose
@6 // 30324
D=A // 30325
@14 // 30326
M=D // 30327
@Number.dispose // 30328
D=A // 30329
@13 // 30330
M=D // 30331
@Sphere.intersect.ret.13 // 30332
D=A // 30333
@CALL // 30334
0;JMP // 30335
(Sphere.intersect.ret.13)
@SP // 30336
M=M-1 // 30337

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30338
A=M+1 // 30339
A=A+1 // 30340
D=M // 30341
@SP // 30342
AM=M+1 // 30343
A=A-1 // 30344
M=D // 30345
// call Number.dispose
@6 // 30346
D=A // 30347
@14 // 30348
M=D // 30349
@Number.dispose // 30350
D=A // 30351
@13 // 30352
M=D // 30353
@Sphere.intersect.ret.14 // 30354
D=A // 30355
@CALL // 30356
0;JMP // 30357
(Sphere.intersect.ret.14)
@SP // 30358
M=M-1 // 30359

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30360
A=M+1 // 30361
A=A+1 // 30362
A=A+1 // 30363
D=M // 30364
@SP // 30365
AM=M+1 // 30366
A=A-1 // 30367
M=D // 30368
// call Number.dispose
@6 // 30369
D=A // 30370
@14 // 30371
M=D // 30372
@Number.dispose // 30373
D=A // 30374
@13 // 30375
M=D // 30376
@Sphere.intersect.ret.15 // 30377
D=A // 30378
@CALL // 30379
0;JMP // 30380
(Sphere.intersect.ret.15)
@SP // 30381
M=M-1 // 30382

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_176 // 30383
D=A // 30384
@13 // 30385
M=D // 30386
@4 // 30387
D=A // 30388
@LCL_PUSH // 30389
0;JMP // 30390
(RETURN_PUSH_LABEL_176)
// call Number.dispose
@6 // 30391
D=A // 30392
@14 // 30393
M=D // 30394
@Number.dispose // 30395
D=A // 30396
@13 // 30397
M=D // 30398
@Sphere.intersect.ret.16 // 30399
D=A // 30400
@CALL // 30401
0;JMP // 30402
(Sphere.intersect.ret.16)
@SP // 30403
M=M-1 // 30404

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 30405
AM=M+1 // 30406
A=A-1 // 30407
M=-1 // 30408
// call Number.new
@6 // 30409
D=A // 30410
@14 // 30411
M=D // 30412
@Number.new // 30413
D=A // 30414
@13 // 30415
M=D // 30416
@Sphere.intersect.ret.17 // 30417
D=A // 30418
@CALL // 30419
0;JMP // 30420
(Sphere.intersect.ret.17)
@RETURN // 30421
0;JMP // 30422

////LabelInstruction{label='Sphere.intersect$IF_END1}
// label Sphere.intersect$IF_END1
(Sphere.intersect$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 30423
A=M+1 // 30424
A=A+1 // 30425
A=A+1 // 30426
D=M // 30427
@SP // 30428
AM=M+1 // 30429
A=A-1 // 30430
M=D // 30431
// call Number.clone
@6 // 30432
D=A // 30433
@14 // 30434
M=D // 30435
@Number.clone // 30436
D=A // 30437
@13 // 30438
M=D // 30439
@Sphere.intersect.ret.18 // 30440
D=A // 30441
@CALL // 30442
0;JMP // 30443
(Sphere.intersect.ret.18)
@LCL // 30444
D=M // 30445
@5 // 30446
A=D+A // 30447
D=A // 30448
@R13 // 30449
M=D // 30450
@SP // 30451
AM=M-1 // 30452
D=M // 30453
@R13 // 30454
A=M // 30455
M=D // 30456

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), PushInstruction("local 4")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_177 // 30457
D=A // 30458
@13 // 30459
M=D // 30460
@5 // 30461
D=A // 30462
@LCL_PUSH // 30463
0;JMP // 30464
(RETURN_PUSH_LABEL_177)
@RETURN_PUSH_LABEL_178 // 30465
D=A // 30466
@13 // 30467
M=D // 30468
@4 // 30469
D=A // 30470
@LCL_PUSH // 30471
0;JMP // 30472
(RETURN_PUSH_LABEL_178)
// call Number.do_sub
@7 // 30473
D=A // 30474
@14 // 30475
M=D // 30476
@Number.do_sub // 30477
D=A // 30478
@13 // 30479
M=D // 30480
@Sphere.intersect.ret.19 // 30481
D=A // 30482
@CALL // 30483
0;JMP // 30484
(Sphere.intersect.ret.19)
@SP // 30485
M=M-1 // 30486

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.do_sqrt}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_179 // 30487
D=A // 30488
@13 // 30489
M=D // 30490
@5 // 30491
D=A // 30492
@LCL_PUSH // 30493
0;JMP // 30494
(RETURN_PUSH_LABEL_179)
// call Number.do_sqrt
@6 // 30495
D=A // 30496
@14 // 30497
M=D // 30498
@Number.do_sqrt // 30499
D=A // 30500
@13 // 30501
M=D // 30502
@Sphere.intersect.ret.20 // 30503
D=A // 30504
@CALL // 30505
0;JMP // 30506
(Sphere.intersect.ret.20)
@SP // 30507
M=M-1 // 30508

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 30509
A=M+1 // 30510
D=M // 30511
@SP // 30512
AM=M+1 // 30513
A=A-1 // 30514
M=D // 30515
// call Number.clone
@6 // 30516
D=A // 30517
@14 // 30518
M=D // 30519
@Number.clone // 30520
D=A // 30521
@13 // 30522
M=D // 30523
@Sphere.intersect.ret.21 // 30524
D=A // 30525
@CALL // 30526
0;JMP // 30527
(Sphere.intersect.ret.21)
@LCL // 30528
D=M // 30529
@6 // 30530
A=D+A // 30531
D=A // 30532
@R13 // 30533
M=D // 30534
@SP // 30535
AM=M-1 // 30536
D=M // 30537
@R13 // 30538
A=M // 30539
M=D // 30540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 5")], call=CallInstruction{Number.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_180 // 30541
D=A // 30542
@13 // 30543
M=D // 30544
@6 // 30545
D=A // 30546
@LCL_PUSH // 30547
0;JMP // 30548
(RETURN_PUSH_LABEL_180)
@RETURN_PUSH_LABEL_181 // 30549
D=A // 30550
@13 // 30551
M=D // 30552
@5 // 30553
D=A // 30554
@LCL_PUSH // 30555
0;JMP // 30556
(RETURN_PUSH_LABEL_181)
// call Number.do_sub
@7 // 30557
D=A // 30558
@14 // 30559
M=D // 30560
@Number.do_sub // 30561
D=A // 30562
@13 // 30563
M=D // 30564
@Sphere.intersect.ret.22 // 30565
D=A // 30566
@CALL // 30567
0;JMP // 30568
(Sphere.intersect.ret.22)
@SP // 30569
M=M-1 // 30570

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 7}
//}

@LCL // 30571
A=M+1 // 30572
D=M // 30573
@SP // 30574
AM=M+1 // 30575
A=A-1 // 30576
M=D // 30577
// call Number.clone
@6 // 30578
D=A // 30579
@14 // 30580
M=D // 30581
@Number.clone // 30582
D=A // 30583
@13 // 30584
M=D // 30585
@Sphere.intersect.ret.23 // 30586
D=A // 30587
@CALL // 30588
0;JMP // 30589
(Sphere.intersect.ret.23)
@LCL // 30590
D=M // 30591
@7 // 30592
A=D+A // 30593
D=A // 30594
@R13 // 30595
M=D // 30596
@SP // 30597
AM=M-1 // 30598
D=M // 30599
@R13 // 30600
A=M // 30601
M=D // 30602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7"), PushInstruction("local 5")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_182 // 30603
D=A // 30604
@13 // 30605
M=D // 30606
@7 // 30607
D=A // 30608
@LCL_PUSH // 30609
0;JMP // 30610
(RETURN_PUSH_LABEL_182)
@RETURN_PUSH_LABEL_183 // 30611
D=A // 30612
@13 // 30613
M=D // 30614
@5 // 30615
D=A // 30616
@LCL_PUSH // 30617
0;JMP // 30618
(RETURN_PUSH_LABEL_183)
// call Number.do_add
@7 // 30619
D=A // 30620
@14 // 30621
M=D // 30622
@Number.do_add // 30623
D=A // 30624
@13 // 30625
M=D // 30626
@Sphere.intersect.ret.24 // 30627
D=A // 30628
@CALL // 30629
0;JMP // 30630
(Sphere.intersect.ret.24)
@SP // 30631
M=M-1 // 30632

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30633
A=M // 30634
D=M // 30635
@SP // 30636
AM=M+1 // 30637
A=A-1 // 30638
M=D // 30639
// call Vec3.dispose
@6 // 30640
D=A // 30641
@14 // 30642
M=D // 30643
@Vec3.dispose // 30644
D=A // 30645
@13 // 30646
M=D // 30647
@Sphere.intersect.ret.25 // 30648
D=A // 30649
@CALL // 30650
0;JMP // 30651
(Sphere.intersect.ret.25)
@SP // 30652
M=M-1 // 30653

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30654
A=M+1 // 30655
D=M // 30656
@SP // 30657
AM=M+1 // 30658
A=A-1 // 30659
M=D // 30660
// call Number.dispose
@6 // 30661
D=A // 30662
@14 // 30663
M=D // 30664
@Number.dispose // 30665
D=A // 30666
@13 // 30667
M=D // 30668
@Sphere.intersect.ret.26 // 30669
D=A // 30670
@CALL // 30671
0;JMP // 30672
(Sphere.intersect.ret.26)
@SP // 30673
M=M-1 // 30674

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30675
A=M+1 // 30676
A=A+1 // 30677
D=M // 30678
@SP // 30679
AM=M+1 // 30680
A=A-1 // 30681
M=D // 30682
// call Number.dispose
@6 // 30683
D=A // 30684
@14 // 30685
M=D // 30686
@Number.dispose // 30687
D=A // 30688
@13 // 30689
M=D // 30690
@Sphere.intersect.ret.27 // 30691
D=A // 30692
@CALL // 30693
0;JMP // 30694
(Sphere.intersect.ret.27)
@SP // 30695
M=M-1 // 30696

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 30697
A=M+1 // 30698
A=A+1 // 30699
A=A+1 // 30700
D=M // 30701
@SP // 30702
AM=M+1 // 30703
A=A-1 // 30704
M=D // 30705
// call Number.dispose
@6 // 30706
D=A // 30707
@14 // 30708
M=D // 30709
@Number.dispose // 30710
D=A // 30711
@13 // 30712
M=D // 30713
@Sphere.intersect.ret.28 // 30714
D=A // 30715
@CALL // 30716
0;JMP // 30717
(Sphere.intersect.ret.28)
@SP // 30718
M=M-1 // 30719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_184 // 30720
D=A // 30721
@13 // 30722
M=D // 30723
@4 // 30724
D=A // 30725
@LCL_PUSH // 30726
0;JMP // 30727
(RETURN_PUSH_LABEL_184)
// call Number.dispose
@6 // 30728
D=A // 30729
@14 // 30730
M=D // 30731
@Number.dispose // 30732
D=A // 30733
@13 // 30734
M=D // 30735
@Sphere.intersect.ret.29 // 30736
D=A // 30737
@CALL // 30738
0;JMP // 30739
(Sphere.intersect.ret.29)
@SP // 30740
M=M-1 // 30741

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_185 // 30742
D=A // 30743
@13 // 30744
M=D // 30745
@5 // 30746
D=A // 30747
@LCL_PUSH // 30748
0;JMP // 30749
(RETURN_PUSH_LABEL_185)
// call Number.dispose
@6 // 30750
D=A // 30751
@14 // 30752
M=D // 30753
@Number.dispose // 30754
D=A // 30755
@13 // 30756
M=D // 30757
@Sphere.intersect.ret.30 // 30758
D=A // 30759
@CALL // 30760
0;JMP // 30761
(Sphere.intersect.ret.30)
@SP // 30762
M=M-1 // 30763

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.is_negative}},
//    right:
//CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.is_negative}},
//    binaryOp: "AND"
//), ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE2}}
@RETURN_PUSH_LABEL_186 // 30764
D=A // 30765
@13 // 30766
M=D // 30767
@6 // 30768
D=A // 30769
@LCL_PUSH // 30770
0;JMP // 30771
(RETURN_PUSH_LABEL_186)
// call Number.is_negative
@6 // 30772
D=A // 30773
@14 // 30774
M=D // 30775
@Number.is_negative // 30776
D=A // 30777
@13 // 30778
M=D // 30779
@Sphere.intersect.ret.31 // 30780
D=A // 30781
@CALL // 30782
0;JMP // 30783
(Sphere.intersect.ret.31)
@RETURN_PUSH_LABEL_187 // 30784
D=A // 30785
@13 // 30786
M=D // 30787
@7 // 30788
D=A // 30789
@LCL_PUSH // 30790
0;JMP // 30791
(RETURN_PUSH_LABEL_187)
// call Number.is_negative
@6 // 30792
D=A // 30793
@14 // 30794
M=D // 30795
@Number.is_negative // 30796
D=A // 30797
@13 // 30798
M=D // 30799
@Sphere.intersect.ret.32 // 30800
D=A // 30801
@CALL // 30802
0;JMP // 30803
(Sphere.intersect.ret.32)
@SP // 30804
AM=M-1 // 30805
D=M // 30806
@SP // 30807
AM=M-1 // 30808
D=D&M // 30809
@Sphere.intersect$IF_TRUE2 // 30810
D;JNE // 30811

////GotoInstruction{label='Sphere.intersect$IF_END2}
// goto Sphere.intersect$IF_END2
@Sphere.intersect$IF_END2 // 30812
0;JMP // 30813

////LabelInstruction{label='Sphere.intersect$IF_TRUE2}
// label Sphere.intersect$IF_TRUE2
(Sphere.intersect$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_188 // 30814
D=A // 30815
@13 // 30816
M=D // 30817
@6 // 30818
D=A // 30819
@LCL_PUSH // 30820
0;JMP // 30821
(RETURN_PUSH_LABEL_188)
// call Number.dispose
@6 // 30822
D=A // 30823
@14 // 30824
M=D // 30825
@Number.dispose // 30826
D=A // 30827
@13 // 30828
M=D // 30829
@Sphere.intersect.ret.33 // 30830
D=A // 30831
@CALL // 30832
0;JMP // 30833
(Sphere.intersect.ret.33)
@SP // 30834
M=M-1 // 30835

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_189 // 30836
D=A // 30837
@13 // 30838
M=D // 30839
@7 // 30840
D=A // 30841
@LCL_PUSH // 30842
0;JMP // 30843
(RETURN_PUSH_LABEL_189)
// call Number.dispose
@6 // 30844
D=A // 30845
@14 // 30846
M=D // 30847
@Number.dispose // 30848
D=A // 30849
@13 // 30850
M=D // 30851
@Sphere.intersect.ret.34 // 30852
D=A // 30853
@CALL // 30854
0;JMP // 30855
(Sphere.intersect.ret.34)
@SP // 30856
M=M-1 // 30857

////CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Number.new}}
@SP // 30858
AM=M+1 // 30859
A=A-1 // 30860
M=-1 // 30861
// call Number.new
@6 // 30862
D=A // 30863
@14 // 30864
M=D // 30865
@Number.new // 30866
D=A // 30867
@13 // 30868
M=D // 30869
@Sphere.intersect.ret.35 // 30870
D=A // 30871
@CALL // 30872
0;JMP // 30873
(Sphere.intersect.ret.35)
@RETURN // 30874
0;JMP // 30875

////LabelInstruction{label='Sphere.intersect$IF_END2}
// label Sphere.intersect$IF_END2
(Sphere.intersect$IF_END2)

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 6"), PushInstruction("local 7")], call=CallInstruction{Number.is_less_than}}, ifGoto=IfGotoInstruction{label='Sphere.intersect$IF_TRUE3}}
@RETURN_PUSH_LABEL_190 // 30876
D=A // 30877
@13 // 30878
M=D // 30879
@6 // 30880
D=A // 30881
@LCL_PUSH // 30882
0;JMP // 30883
(RETURN_PUSH_LABEL_190)
@RETURN_PUSH_LABEL_191 // 30884
D=A // 30885
@13 // 30886
M=D // 30887
@7 // 30888
D=A // 30889
@LCL_PUSH // 30890
0;JMP // 30891
(RETURN_PUSH_LABEL_191)
// call Number.is_less_than
@7 // 30892
D=A // 30893
@14 // 30894
M=D // 30895
@Number.is_less_than // 30896
D=A // 30897
@13 // 30898
M=D // 30899
@Sphere.intersect.ret.36 // 30900
D=A // 30901
@CALL // 30902
0;JMP // 30903
(Sphere.intersect.ret.36)
@SP // 30904
AM=M-1 // 30905
D=M // 30906
@Sphere.intersect$IF_TRUE3 // 30907
D;JNE // 30908

////GotoInstruction{label='Sphere.intersect$IF_FALSE3}
// goto Sphere.intersect$IF_FALSE3
@Sphere.intersect$IF_FALSE3 // 30909
0;JMP // 30910

////LabelInstruction{label='Sphere.intersect$IF_TRUE3}
// label Sphere.intersect$IF_TRUE3
(Sphere.intersect$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_192 // 30911
D=A // 30912
@13 // 30913
M=D // 30914
@7 // 30915
D=A // 30916
@LCL_PUSH // 30917
0;JMP // 30918
(RETURN_PUSH_LABEL_192)
// call Number.dispose
@6 // 30919
D=A // 30920
@14 // 30921
M=D // 30922
@Number.dispose // 30923
D=A // 30924
@13 // 30925
M=D // 30926
@Sphere.intersect.ret.37 // 30927
D=A // 30928
@CALL // 30929
0;JMP // 30930
(Sphere.intersect.ret.37)
@SP // 30931
M=M-1 // 30932

////PushInstruction("local 6")
@RETURN_PUSH_LABEL_193 // 30933
D=A // 30934
@13 // 30935
M=D // 30936
@6 // 30937
D=A // 30938
@LCL_PUSH // 30939
0;JMP // 30940
(RETURN_PUSH_LABEL_193)
@RETURN // 30941
0;JMP // 30942

////GotoInstruction{label='Sphere.intersect$IF_END3}
// goto Sphere.intersect$IF_END3
@Sphere.intersect$IF_END3 // 30943
0;JMP // 30944

////LabelInstruction{label='Sphere.intersect$IF_FALSE3}
// label Sphere.intersect$IF_FALSE3
(Sphere.intersect$IF_FALSE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_194 // 30945
D=A // 30946
@13 // 30947
M=D // 30948
@6 // 30949
D=A // 30950
@LCL_PUSH // 30951
0;JMP // 30952
(RETURN_PUSH_LABEL_194)
// call Number.dispose
@6 // 30953
D=A // 30954
@14 // 30955
M=D // 30956
@Number.dispose // 30957
D=A // 30958
@13 // 30959
M=D // 30960
@Sphere.intersect.ret.38 // 30961
D=A // 30962
@CALL // 30963
0;JMP // 30964
(Sphere.intersect.ret.38)
@SP // 30965
M=M-1 // 30966

////PushInstruction("local 7")
@RETURN_PUSH_LABEL_195 // 30967
D=A // 30968
@13 // 30969
M=D // 30970
@7 // 30971
D=A // 30972
@LCL_PUSH // 30973
0;JMP // 30974
(RETURN_PUSH_LABEL_195)
@RETURN // 30975
0;JMP // 30976

////LabelInstruction{label='Sphere.intersect$IF_END3}
// label Sphere.intersect$IF_END3
(Sphere.intersect$IF_END3)

////FunctionInstruction{functionName='Int32.do_zero', numLocals=1, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.do_zero with 1
(Int32.do_zero)
@SP // 30977
AM=M+1 // 30978
A=A-1 // 30979
M=0 // 30980

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 30981
A=M // 30982
D=M // 30983
@3 // 30984
M=D // 30985

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 30986
A=M // 30987
M=0 // 30988

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
@Int32.do_zero.LT.111 // 30989
D=A // 30990
@SP // 30991
AM=M+1 // 30992
A=A-1 // 30993
M=D // 30994
@LCL // 30995
A=M // 30996
D=M // 30997
@4 // 30998
D=D-A // 30999
@DO_LT // 31000
0;JMP // 31001
(Int32.do_zero.LT.111)
D=!D // 31002
@Int32.do_zero_WHILE_END1 // 31003
D;JNE // 31004

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("this 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)}
@THIS // 31005
A=M // 31006
D=M // 31007
@LCL // 31008
A=M // 31009
D=D+M // 31010
@SP // 31011
AM=M+1 // 31012
A=A-1 // 31013
M=D // 31014
@LCL // 31015
A=M // 31016
D=M // 31017
@SP // 31018
AM=M-1 // 31019
A=M // 31020
M=D // 31021

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

@LCL // 31022
A=M // 31023
M=M+1 // 31024

////GotoInstruction{label='Int32.do_zero_WHILE_EXP1}
// goto Int32.do_zero_WHILE_EXP1
@Int32.do_zero_WHILE_EXP1 // 31025
0;JMP // 31026

////LabelInstruction{label='Int32.do_zero_WHILE_END1}
// label Int32.do_zero_WHILE_END1
(Int32.do_zero_WHILE_END1)

////PushInstruction("constant 0")
@SP // 31027
AM=M+1 // 31028
A=A-1 // 31029
M=0 // 31030
@RETURN // 31031
0;JMP // 31032

////FunctionInstruction{functionName='Sys.error', numLocals=1, funcMapping={Sys.halt=0, Sys.init=6}}
// function Sys.error with 1
(Sys.error)
@SP // 31033
AM=M+1 // 31034
A=A-1 // 31035
M=0 // 31036

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 31037
A=M // 31038
M=0 // 31039

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
@Sys.error.LT.112 // 31040
D=A // 31041
@SP // 31042
AM=M+1 // 31043
A=A-1 // 31044
M=D // 31045
@LCL // 31046
A=M // 31047
D=M // 31048
@8192 // 31049
D=D-A // 31050
@DO_LT // 31051
0;JMP // 31052
(Sys.error.LT.112)
D=!D // 31053
@Sys.error_WHILE_END1 // 31054
D;JNE // 31055

////PushWriter{source=PushInstruction("constant -1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 16384"),
//    binaryOp: "ADD"
//)}
@LCL // 31056
A=M // 31057
D=M // 31058
@16384 // 31059
D=D+A // 31060
@SP // 31061
AM=M+1 // 31062
A=A-1 // 31063
M=D // 31064
D=-1 // 31065
@SP // 31066
AM=M-1 // 31067
A=M // 31068
M=D // 31069

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

@LCL // 31070
A=M // 31071
M=M+1 // 31072

////GotoInstruction{label='Sys.error_WHILE_EXP1}
// goto Sys.error_WHILE_EXP1
@Sys.error_WHILE_EXP1 // 31073
0;JMP // 31074

////LabelInstruction{label='Sys.error_WHILE_END1}
// label Sys.error_WHILE_END1
(Sys.error_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.printInt}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 31075
A=M // 31076
D=M // 31077
@SP // 31078
AM=M+1 // 31079
A=A-1 // 31080
M=D // 31081
// call Output.printInt
@6 // 31082
D=A // 31083
@14 // 31084
M=D // 31085
@Output.printInt // 31086
D=A // 31087
@13 // 31088
M=D // 31089
@Sys.error.ret.0 // 31090
D=A // 31091
@CALL // 31092
0;JMP // 31093
(Sys.error.ret.0)
@SP // 31094
M=M-1 // 31095

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 31096
D=A // 31097
@14 // 31098
M=D // 31099
@Output.println // 31100
D=A // 31101
@13 // 31102
M=D // 31103
@Sys.error.ret.1 // 31104
D=A // 31105
@CALL // 31106
0;JMP // 31107
(Sys.error.ret.1)
@SP // 31108
M=M-1 // 31109

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 31110
D=A // 31111
@14 // 31112
M=D // 31113
@Sys.halt // 31114
D=A // 31115
@13 // 31116
M=D // 31117
@Sys.error.ret.2 // 31118
D=A // 31119
@CALL // 31120
0;JMP // 31121
(Sys.error.ret.2)
@SP // 31122
M=M-1 // 31123

////PushInstruction("constant 0")
@SP // 31124
AM=M+1 // 31125
A=A-1 // 31126
M=0 // 31127
@RETURN // 31128
0;JMP // 31129

////FunctionInstruction{functionName='DirectionalLight.getShadowBias', numLocals=0, funcMapping={DirectionalLight.new=9, DirectionalLight.dispose=3, DirectionalLight.getColor=0}}
// function DirectionalLight.getShadowBias with 0
(DirectionalLight.getShadowBias)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31130
A=M // 31131
D=M // 31132
@3 // 31133
M=D // 31134

////PushInstruction("this 3")
@THIS // 31135
A=M+1 // 31136
A=A+1 // 31137
A=A+1 // 31138
D=M // 31139
@SP // 31140
AM=M+1 // 31141
A=A-1 // 31142
M=D // 31143
@RETURN // 31144
0;JMP // 31145

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 31146
M=M+1 // 31147
AM=M+1 // 31148
A=A-1 // 31149
M=0 // 31150
A=A-1 // 31151
M=0 // 31152

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

@ARG // 31153
A=M+1 // 31154
D=M // 31155
@SP // 31156
AM=M+1 // 31157
A=A-1 // 31158
M=D // 31159
@32 // 31160
D=A // 31161
@SP // 31162
AM=M+1 // 31163
A=A-1 // 31164
M=D // 31165
// call Math.multiply
@7 // 31166
D=A // 31167
@14 // 31168
M=D // 31169
@Math.multiply // 31170
D=A // 31171
@13 // 31172
M=D // 31173
@Screen.drawPixel.ret.0 // 31174
D=A // 31175
@CALL // 31176
0;JMP // 31177
(Screen.drawPixel.ret.0)
@ARG // 31178
A=M // 31179
D=M // 31180
@SP // 31181
AM=M+1 // 31182
A=A-1 // 31183
M=D // 31184
@16 // 31185
D=A // 31186
@SP // 31187
AM=M+1 // 31188
A=A-1 // 31189
M=D // 31190
// call Math.divide
@7 // 31191
D=A // 31192
@14 // 31193
M=D // 31194
@Math.divide // 31195
D=A // 31196
@13 // 31197
M=D // 31198
@Screen.drawPixel.ret.1 // 31199
D=A // 31200
@CALL // 31201
0;JMP // 31202
(Screen.drawPixel.ret.1)
@SP // 31203
AM=M-1 // 31204
D=M // 31205
@SP // 31206
AM=M-1 // 31207
D=D+M // 31208
@16384 // 31209
D=D+A // 31210
@LCL // 31211
A=M // 31212
M=D // 31213

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

@ARG // 31214
A=M // 31215
D=M // 31216
@15 // 31217
D=D&A // 31218
@LCL // 31219
A=M+1 // 31220
M=D // 31221

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 31222
D=M // 31223
@Screen.drawPixel$IF_TRUE1 // 31224
D;JNE // 31225

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 31226
0;JMP // 31227

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
@LCL // 31228
A=M // 31229
D=M // 31230
@0 // 31231
D=D+A // 31232
@SP // 31233
AM=M+1 // 31234
A=A-1 // 31235
M=D // 31236
@LCL // 31237
A=M // 31238
A=M // 31239
D=M // 31240
@SP // 31241
AM=M+1 // 31242
A=A-1 // 31243
M=D // 31244
@LCL // 31245
A=M+1 // 31246
D=M // 31247
@SP // 31248
AM=M+1 // 31249
A=A-1 // 31250
M=D // 31251
// call Math.twoToThe
@6 // 31252
D=A // 31253
@14 // 31254
M=D // 31255
@Math.twoToThe // 31256
D=A // 31257
@13 // 31258
M=D // 31259
@Screen.drawPixel.ret.2 // 31260
D=A // 31261
@CALL // 31262
0;JMP // 31263
(Screen.drawPixel.ret.2)
@SP // 31264
AM=M-1 // 31265
D=M // 31266
@SP // 31267
AM=M-1 // 31268
D=D|M // 31269
@SP // 31270
AM=M-1 // 31271
A=M // 31272
M=D // 31273

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 31274
0;JMP // 31275

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
@LCL // 31276
A=M // 31277
D=M // 31278
@0 // 31279
D=D+A // 31280
@SP // 31281
AM=M+1 // 31282
A=A-1 // 31283
M=D // 31284
@LCL // 31285
A=M // 31286
A=M // 31287
D=M // 31288
@SP // 31289
AM=M+1 // 31290
A=A-1 // 31291
M=D // 31292
@LCL // 31293
A=M+1 // 31294
D=M // 31295
@SP // 31296
AM=M+1 // 31297
A=A-1 // 31298
M=D // 31299
// call Math.twoToThe
@6 // 31300
D=A // 31301
@14 // 31302
M=D // 31303
@Math.twoToThe // 31304
D=A // 31305
@13 // 31306
M=D // 31307
@Screen.drawPixel.ret.3 // 31308
D=A // 31309
@CALL // 31310
0;JMP // 31311
(Screen.drawPixel.ret.3)
@SP // 31312
AM=M-1 // 31313
D=M // 31314
D=!D // 31315
@SP // 31316
AM=M-1 // 31317
D=D&M // 31318
@SP // 31319
AM=M-1 // 31320
A=M // 31321
M=D // 31322

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 31323
AM=M+1 // 31324
A=A-1 // 31325
M=0 // 31326
@RETURN // 31327
0;JMP // 31328

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
@ARG // 31329
A=M // 31330
D=M // 31331
@SP // 31332
AM=M+1 // 31333
A=A-1 // 31334
M=D // 31335
@ARG // 31336
A=M // 31337
A=M // 31338
D=M // 31339
@4 // 31340
D=D+A // 31341
@SP // 31342
AM=M-1 // 31343
D=D+M // 31344
@SP // 31345
AM=M+1 // 31346
A=A-1 // 31347
M=D // 31348
@ARG // 31349
A=M // 31350
D=M // 31351
@SP // 31352
AM=M-1 // 31353
A=M // 31354
M=D // 31355

////PushInstruction("constant 0")
@SP // 31356
AM=M+1 // 31357
A=A-1 // 31358
M=0 // 31359
@RETURN // 31360
0;JMP // 31361

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
@Math.0 // 31362
D=M // 31363
@ARG // 31364
A=M // 31365
A=D+M // 31366
D=M // 31367
@SP // 31368
AM=M+1 // 31369
A=A-1 // 31370
M=D // 31371
@RETURN // 31372
0;JMP // 31373

////FunctionInstruction{functionName='Intersection.getObject', numLocals=0, funcMapping={Intersection.getDistanceFromOrigin=0, Intersection.new=1, Intersection.dispose=2}}
// function Intersection.getObject with 0
(Intersection.getObject)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31374
A=M // 31375
D=M // 31376
@3 // 31377
M=D // 31378

////PushInstruction("this 1")
@THIS // 31379
A=M+1 // 31380
D=M // 31381
@SP // 31382
AM=M+1 // 31383
A=A-1 // 31384
M=D // 31385
@RETURN // 31386
0;JMP // 31387

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@6 // 31388
D=A // 31389
@SP // 31390
AM=D+M // 31391
A=A-1 // 31392
M=0 // 31393
A=A-1 // 31394
M=0 // 31395
A=A-1 // 31396
M=0 // 31397
A=A-1 // 31398
M=0 // 31399
A=A-1 // 31400
M=0 // 31401
A=A-1 // 31402
M=0 // 31403

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 31404
A=M // 31405
D=M // 31406
@3 // 31407
M=D // 31408

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 31409
A=M+1 // 31410
M=0 // 31411

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 31412
D=M // 31413
@4 // 31414
A=D+A // 31415
M=0 // 31416

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.setInt$IF_TRUE1}}
@String.setInt.EQ.113 // 31417
D=A // 31418
@SP // 31419
AM=M+1 // 31420
A=A-1 // 31421
M=D // 31422
@ARG // 31423
A=M+1 // 31424
D=M // 31425
@DO_EQ // 31426
0;JMP // 31427
(String.setInt.EQ.113)
@String.setInt$IF_TRUE1 // 31428
D;JNE // 31429

////GotoInstruction{label='String.setInt$IF_END1}
// goto String.setInt$IF_END1
@String.setInt$IF_END1 // 31430
0;JMP // 31431

////LabelInstruction{label='String.setInt$IF_TRUE1}
// label String.setInt$IF_TRUE1
(String.setInt$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 48")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31432
D=M // 31433
@SP // 31434
AM=M+1 // 31435
A=A-1 // 31436
M=D // 31437
@48 // 31438
D=A // 31439
@SP // 31440
AM=M+1 // 31441
A=A-1 // 31442
M=D // 31443
// call String.appendChar
@7 // 31444
D=A // 31445
@14 // 31446
M=D // 31447
@String.appendChar // 31448
D=A // 31449
@13 // 31450
M=D // 31451
@String.setInt.ret.0 // 31452
D=A // 31453
@CALL // 31454
0;JMP // 31455
(String.setInt.ret.0)
@SP // 31456
M=M-1 // 31457

////PushInstruction("constant 0")
@SP // 31458
AM=M+1 // 31459
A=A-1 // 31460
M=0 // 31461
@RETURN // 31462
0;JMP // 31463

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
@String.setInt.LT.114 // 31464
D=A // 31465
@SP // 31466
AM=M+1 // 31467
A=A-1 // 31468
M=D // 31469
@ARG // 31470
A=M+1 // 31471
D=M // 31472
@DO_LT // 31473
0;JMP // 31474
(String.setInt.LT.114)
@String.setInt$IF_TRUE2 // 31475
D;JNE // 31476

////GotoInstruction{label='String.setInt$IF_END2}
// goto String.setInt$IF_END2
@String.setInt$IF_END2 // 31477
0;JMP // 31478

////LabelInstruction{label='String.setInt$IF_TRUE2}
// label String.setInt$IF_TRUE2
(String.setInt$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 4}
//}

@LCL // 31479
D=M // 31480
@4 // 31481
A=D+A // 31482
M=1 // 31483

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
@String.setInt.LT.115 // 31484
D=A // 31485
@SP // 31486
AM=M+1 // 31487
A=A-1 // 31488
M=D // 31489
@ARG // 31490
A=M+1 // 31491
D=M // 31492
@DO_LT // 31493
0;JMP // 31494
(String.setInt.LT.115)
@SP // 31495
AM=M+1 // 31496
A=A-1 // 31497
M=D // 31498
@String.setInt.EQ.116 // 31499
D=A // 31500
@SP // 31501
AM=M+1 // 31502
A=A-1 // 31503
M=D // 31504
@ARG // 31505
A=M+1 // 31506
D=M // 31507
@32767 // 31508
D=D&A // 31509
@32767 // 31510
D=D-A // 31511
@DO_EQ // 31512
0;JMP // 31513
(String.setInt.EQ.116)
@SP // 31514
AM=M-1 // 31515
D=D&M // 31516
@String.setInt$IF_TRUE3 // 31517
D;JNE // 31518

////GotoInstruction{label='String.setInt$IF_END3}
// goto String.setInt$IF_END3
@String.setInt$IF_END3 // 31519
0;JMP // 31520

////LabelInstruction{label='String.setInt$IF_TRUE3}
// label String.setInt$IF_TRUE3
(String.setInt$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31521
D=M // 31522
@SP // 31523
AM=M+1 // 31524
A=A-1 // 31525
M=D // 31526
@45 // 31527
D=A // 31528
@SP // 31529
AM=M+1 // 31530
A=A-1 // 31531
M=D // 31532
// call String.appendChar
@7 // 31533
D=A // 31534
@14 // 31535
M=D // 31536
@String.appendChar // 31537
D=A // 31538
@13 // 31539
M=D // 31540
@String.setInt.ret.1 // 31541
D=A // 31542
@CALL // 31543
0;JMP // 31544
(String.setInt.ret.1)
@SP // 31545
M=M-1 // 31546

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 51")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31547
D=M // 31548
@SP // 31549
AM=M+1 // 31550
A=A-1 // 31551
M=D // 31552
@51 // 31553
D=A // 31554
@SP // 31555
AM=M+1 // 31556
A=A-1 // 31557
M=D // 31558
// call String.appendChar
@7 // 31559
D=A // 31560
@14 // 31561
M=D // 31562
@String.appendChar // 31563
D=A // 31564
@13 // 31565
M=D // 31566
@String.setInt.ret.2 // 31567
D=A // 31568
@CALL // 31569
0;JMP // 31570
(String.setInt.ret.2)
@SP // 31571
M=M-1 // 31572

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 50")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31573
D=M // 31574
@SP // 31575
AM=M+1 // 31576
A=A-1 // 31577
M=D // 31578
@50 // 31579
D=A // 31580
@SP // 31581
AM=M+1 // 31582
A=A-1 // 31583
M=D // 31584
// call String.appendChar
@7 // 31585
D=A // 31586
@14 // 31587
M=D // 31588
@String.appendChar // 31589
D=A // 31590
@13 // 31591
M=D // 31592
@String.setInt.ret.3 // 31593
D=A // 31594
@CALL // 31595
0;JMP // 31596
(String.setInt.ret.3)
@SP // 31597
M=M-1 // 31598

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 55")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31599
D=M // 31600
@SP // 31601
AM=M+1 // 31602
A=A-1 // 31603
M=D // 31604
@55 // 31605
D=A // 31606
@SP // 31607
AM=M+1 // 31608
A=A-1 // 31609
M=D // 31610
// call String.appendChar
@7 // 31611
D=A // 31612
@14 // 31613
M=D // 31614
@String.appendChar // 31615
D=A // 31616
@13 // 31617
M=D // 31618
@String.setInt.ret.4 // 31619
D=A // 31620
@CALL // 31621
0;JMP // 31622
(String.setInt.ret.4)
@SP // 31623
M=M-1 // 31624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 54")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31625
D=M // 31626
@SP // 31627
AM=M+1 // 31628
A=A-1 // 31629
M=D // 31630
@54 // 31631
D=A // 31632
@SP // 31633
AM=M+1 // 31634
A=A-1 // 31635
M=D // 31636
// call String.appendChar
@7 // 31637
D=A // 31638
@14 // 31639
M=D // 31640
@String.appendChar // 31641
D=A // 31642
@13 // 31643
M=D // 31644
@String.setInt.ret.5 // 31645
D=A // 31646
@CALL // 31647
0;JMP // 31648
(String.setInt.ret.5)
@SP // 31649
M=M-1 // 31650

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 56")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31651
D=M // 31652
@SP // 31653
AM=M+1 // 31654
A=A-1 // 31655
M=D // 31656
@56 // 31657
D=A // 31658
@SP // 31659
AM=M+1 // 31660
A=A-1 // 31661
M=D // 31662
// call String.appendChar
@7 // 31663
D=A // 31664
@14 // 31665
M=D // 31666
@String.appendChar // 31667
D=A // 31668
@13 // 31669
M=D // 31670
@String.setInt.ret.6 // 31671
D=A // 31672
@CALL // 31673
0;JMP // 31674
(String.setInt.ret.6)
@SP // 31675
M=M-1 // 31676

////PushInstruction("constant 0")
@SP // 31677
AM=M+1 // 31678
A=A-1 // 31679
M=0 // 31680
@RETURN // 31681
0;JMP // 31682

////LabelInstruction{label='String.setInt$IF_END3}
// label String.setInt$IF_END3
(String.setInt$IF_END3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 31683
A=M+1 // 31684
D=-M // 31685
@ARG // 31686
A=M+1 // 31687
M=D // 31688

////LabelInstruction{label='String.setInt$IF_END2}
// label String.setInt$IF_END2
(String.setInt$IF_END2)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 31689
A=M+1 // 31690
D=M // 31691
@LCL // 31692
A=M+1 // 31693
A=A+1 // 31694
M=D // 31695

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 31696
A=M+1 // 31697
A=A+1 // 31698
A=A+1 // 31699
M=0 // 31700

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
@String.setInt.GT.117 // 31701
D=A // 31702
@SP // 31703
AM=M+1 // 31704
A=A-1 // 31705
M=D // 31706
@LCL // 31707
A=M+1 // 31708
A=A+1 // 31709
D=M // 31710
@DO_GT // 31711
0;JMP // 31712
(String.setInt.GT.117)
D=!D // 31713
@String.setInt_WHILE_END1 // 31714
D;JNE // 31715

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 31716
A=M+1 // 31717
A=A+1 // 31718
D=M // 31719
@SP // 31720
AM=M+1 // 31721
A=A-1 // 31722
M=D // 31723
@10 // 31724
D=A // 31725
@SP // 31726
AM=M+1 // 31727
A=A-1 // 31728
M=D // 31729
// call Math.divide
@7 // 31730
D=A // 31731
@14 // 31732
M=D // 31733
@Math.divide // 31734
D=A // 31735
@13 // 31736
M=D // 31737
@String.setInt.ret.7 // 31738
D=A // 31739
@CALL // 31740
0;JMP // 31741
(String.setInt.ret.7)
@SP // 31742
AM=M-1 // 31743
D=M // 31744
@LCL // 31745
A=M+1 // 31746
A=A+1 // 31747
M=D // 31748

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

@LCL // 31749
A=M+1 // 31750
A=A+1 // 31751
A=A+1 // 31752
M=M+1 // 31753

////GotoInstruction{label='String.setInt_WHILE_EXP1}
// goto String.setInt_WHILE_EXP1
@String.setInt_WHILE_EXP1 // 31754
0;JMP // 31755

////LabelInstruction{label='String.setInt_WHILE_END1}
// label String.setInt_WHILE_END1
(String.setInt_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 31756
A=M+1 // 31757
A=A+1 // 31758
A=A+1 // 31759
D=M // 31760
@SP // 31761
AM=M+1 // 31762
A=A-1 // 31763
M=D // 31764
// call Memory.alloc
@6 // 31765
D=A // 31766
@14 // 31767
M=D // 31768
@Memory.alloc // 31769
D=A // 31770
@13 // 31771
M=D // 31772
@String.setInt.ret.8 // 31773
D=A // 31774
@CALL // 31775
0;JMP // 31776
(String.setInt.ret.8)
@LCL // 31777
D=M // 31778
@5 // 31779
A=D+A // 31780
D=A // 31781
@R13 // 31782
M=D // 31783
@SP // 31784
AM=M-1 // 31785
D=M // 31786
@R13 // 31787
A=M // 31788
M=D // 31789

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 31790
A=M+1 // 31791
M=0 // 31792

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
@String.setInt.GT.118 // 31793
D=A // 31794
@SP // 31795
AM=M+1 // 31796
A=A-1 // 31797
M=D // 31798
@ARG // 31799
A=M+1 // 31800
D=M // 31801
@DO_GT // 31802
0;JMP // 31803
(String.setInt.GT.118)
D=!D // 31804
@String.setInt_WHILE_END2 // 31805
D;JNE // 31806

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

@ARG // 31807
A=M+1 // 31808
D=M // 31809
@SP // 31810
AM=M+1 // 31811
A=A-1 // 31812
M=D // 31813
@ARG // 31814
A=M+1 // 31815
D=M // 31816
@SP // 31817
AM=M+1 // 31818
A=A-1 // 31819
M=D // 31820
@10 // 31821
D=A // 31822
@SP // 31823
AM=M+1 // 31824
A=A-1 // 31825
M=D // 31826
// call Math.divide
@7 // 31827
D=A // 31828
@14 // 31829
M=D // 31830
@Math.divide // 31831
D=A // 31832
@13 // 31833
M=D // 31834
@String.setInt.ret.9 // 31835
D=A // 31836
@CALL // 31837
0;JMP // 31838
(String.setInt.ret.9)
@10 // 31839
D=A // 31840
@SP // 31841
AM=M+1 // 31842
A=A-1 // 31843
M=D // 31844
// call Math.multiply
@7 // 31845
D=A // 31846
@14 // 31847
M=D // 31848
@Math.multiply // 31849
D=A // 31850
@13 // 31851
M=D // 31852
@String.setInt.ret.10 // 31853
D=A // 31854
@CALL // 31855
0;JMP // 31856
(String.setInt.ret.10)
@SP // 31857
AM=M-1 // 31858
D=M // 31859
@SP // 31860
AM=M-1 // 31861
D=M-D // 31862
@LCL // 31863
A=M // 31864
M=D // 31865

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
@RETURN_PUSH_LABEL_196 // 31866
D=A // 31867
@13 // 31868
M=D // 31869
@5 // 31870
D=A // 31871
@LCL_PUSH // 31872
0;JMP // 31873
(RETURN_PUSH_LABEL_196)
@LCL // 31874
A=M+1 // 31875
D=M // 31876
@SP // 31877
AM=M-1 // 31878
D=D+M // 31879
@SP // 31880
AM=M+1 // 31881
A=A-1 // 31882
M=D // 31883
@LCL // 31884
A=M // 31885
D=M // 31886
@48 // 31887
D=D+A // 31888
@SP // 31889
AM=M-1 // 31890
A=M // 31891
M=D // 31892

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), PushInstruction("constant 10")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=argument 1}
//}

@ARG // 31893
A=M+1 // 31894
D=M // 31895
@SP // 31896
AM=M+1 // 31897
A=A-1 // 31898
M=D // 31899
@10 // 31900
D=A // 31901
@SP // 31902
AM=M+1 // 31903
A=A-1 // 31904
M=D // 31905
// call Math.divide
@7 // 31906
D=A // 31907
@14 // 31908
M=D // 31909
@Math.divide // 31910
D=A // 31911
@13 // 31912
M=D // 31913
@String.setInt.ret.11 // 31914
D=A // 31915
@CALL // 31916
0;JMP // 31917
(String.setInt.ret.11)
@SP // 31918
AM=M-1 // 31919
D=M // 31920
@ARG // 31921
A=M+1 // 31922
M=D // 31923

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

@LCL // 31924
A=M+1 // 31925
M=M+1 // 31926

////GotoInstruction{label='String.setInt_WHILE_EXP2}
// goto String.setInt_WHILE_EXP2
@String.setInt_WHILE_EXP2 // 31927
0;JMP // 31928

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
@String.setInt.EQ.119 // 31929
D=A // 31930
@SP // 31931
AM=M+1 // 31932
A=A-1 // 31933
M=D // 31934
@LCL // 31935
D=M // 31936
@4 // 31937
A=D+A // 31938
D=M // 31939
D=D-1 // 31940
@DO_EQ // 31941
0;JMP // 31942
(String.setInt.EQ.119)
@String.setInt$IF_TRUE4 // 31943
D;JNE // 31944

////GotoInstruction{label='String.setInt$IF_END4}
// goto String.setInt$IF_END4
@String.setInt$IF_END4 // 31945
0;JMP // 31946

////LabelInstruction{label='String.setInt$IF_TRUE4}
// label String.setInt$IF_TRUE4
(String.setInt$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("constant 45")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 31947
D=M // 31948
@SP // 31949
AM=M+1 // 31950
A=A-1 // 31951
M=D // 31952
@45 // 31953
D=A // 31954
@SP // 31955
AM=M+1 // 31956
A=A-1 // 31957
M=D // 31958
// call String.appendChar
@7 // 31959
D=A // 31960
@14 // 31961
M=D // 31962
@String.appendChar // 31963
D=A // 31964
@13 // 31965
M=D // 31966
@String.setInt.ret.12 // 31967
D=A // 31968
@CALL // 31969
0;JMP // 31970
(String.setInt.ret.12)
@SP // 31971
M=M-1 // 31972

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
@String.setInt.GT.120 // 31973
D=A // 31974
@SP // 31975
AM=M+1 // 31976
A=A-1 // 31977
M=D // 31978
@LCL // 31979
A=M+1 // 31980
D=M // 31981
@DO_GT // 31982
0;JMP // 31983
(String.setInt.GT.120)
D=!D // 31984
@String.setInt_WHILE_END3 // 31985
D;JNE // 31986

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

@LCL // 31987
A=M+1 // 31988
M=M-1 // 31989

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

@3 // 31990
D=M // 31991
@SP // 31992
AM=M+1 // 31993
A=A-1 // 31994
M=D // 31995
@RETURN_PUSH_LABEL_197 // 31996
D=A // 31997
@13 // 31998
M=D // 31999
@5 // 32000
D=A // 32001
@LCL_PUSH // 32002
0;JMP // 32003
(RETURN_PUSH_LABEL_197)
@LCL // 32004
A=M+1 // 32005
D=M // 32006
@SP // 32007
AM=M-1 // 32008
A=D+M // 32009
D=M // 32010
@SP // 32011
AM=M+1 // 32012
A=A-1 // 32013
M=D // 32014
// call String.appendChar
@7 // 32015
D=A // 32016
@14 // 32017
M=D // 32018
@String.appendChar // 32019
D=A // 32020
@13 // 32021
M=D // 32022
@String.setInt.ret.13 // 32023
D=A // 32024
@CALL // 32025
0;JMP // 32026
(String.setInt.ret.13)
@SP // 32027
M=M-1 // 32028

////GotoInstruction{label='String.setInt_WHILE_EXP3}
// goto String.setInt_WHILE_EXP3
@String.setInt_WHILE_EXP3 // 32029
0;JMP // 32030

////LabelInstruction{label='String.setInt_WHILE_END3}
// label String.setInt_WHILE_END3
(String.setInt_WHILE_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_198 // 32031
D=A // 32032
@13 // 32033
M=D // 32034
@5 // 32035
D=A // 32036
@LCL_PUSH // 32037
0;JMP // 32038
(RETURN_PUSH_LABEL_198)
// call Memory.deAlloc
@6 // 32039
D=A // 32040
@14 // 32041
M=D // 32042
@Memory.deAlloc // 32043
D=A // 32044
@13 // 32045
M=D // 32046
@String.setInt.ret.14 // 32047
D=A // 32048
@CALL // 32049
0;JMP // 32050
(String.setInt.ret.14)
@SP // 32051
M=M-1 // 32052

////PushInstruction("constant 0")
@SP // 32053
AM=M+1 // 32054
A=A-1 // 32055
M=0 // 32056
@RETURN // 32057
0;JMP // 32058

////FunctionInstruction{functionName='Int32.u4_array_mul_u4_array', numLocals=6, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.u4_array_mul_u4_array with 6
(Int32.u4_array_mul_u4_array)
@6 // 32059
D=A // 32060
@SP // 32061
AM=D+M // 32062
A=A-1 // 32063
M=0 // 32064
A=A-1 // 32065
M=0 // 32066
A=A-1 // 32067
M=0 // 32068
A=A-1 // 32069
M=0 // 32070
A=A-1 // 32071
M=0 // 32072
A=A-1 // 32073
M=0 // 32074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@16 // 32075
D=A // 32076
@SP // 32077
AM=M+1 // 32078
A=A-1 // 32079
M=D // 32080
// call Memory.alloc
@6 // 32081
D=A // 32082
@14 // 32083
M=D // 32084
@Memory.alloc // 32085
D=A // 32086
@13 // 32087
M=D // 32088
@Int32.u4_array_mul_u4_array.ret.0 // 32089
D=A // 32090
@CALL // 32091
0;JMP // 32092
(Int32.u4_array_mul_u4_array.ret.0)
@SP // 32093
AM=M-1 // 32094
D=M // 32095
@LCL // 32096
A=M // 32097
M=D // 32098

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 32099
A=M+1 // 32100
A=A+1 // 32101
A=A+1 // 32102
M=0 // 32103

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
@Int32.u4_array_mul_u4_array.LT.121 // 32104
D=A // 32105
@SP // 32106
AM=M+1 // 32107
A=A-1 // 32108
M=D // 32109
@LCL // 32110
A=M+1 // 32111
A=A+1 // 32112
A=A+1 // 32113
D=M // 32114
@16 // 32115
D=D-A // 32116
@DO_LT // 32117
0;JMP // 32118
(Int32.u4_array_mul_u4_array.LT.121)
D=!D // 32119
@Int32.u4_array_mul_u4_array_WHILE_END1 // 32120
D;JNE // 32121

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 3"),
//    binaryOp: "ADD"
//)}
@LCL // 32122
A=M+1 // 32123
A=A+1 // 32124
A=A+1 // 32125
D=M // 32126
A=A-1 // 32127
A=A-1 // 32128
A=A-1 // 32129
D=D+M // 32130
@SP // 32131
AM=M+1 // 32132
A=A-1 // 32133
M=D // 32134
D=0 // 32135
@SP // 32136
AM=M-1 // 32137
A=M // 32138
M=D // 32139

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

@LCL // 32140
A=M+1 // 32141
A=A+1 // 32142
A=A+1 // 32143
M=M+1 // 32144

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP1}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP1
@Int32.u4_array_mul_u4_array_WHILE_EXP1 // 32145
0;JMP // 32146

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END1}
// label Int32.u4_array_mul_u4_array_WHILE_END1
(Int32.u4_array_mul_u4_array_WHILE_END1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 32147
A=M+1 // 32148
M=0 // 32149

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
@Int32.u4_array_mul_u4_array.LT.122 // 32150
D=A // 32151
@SP // 32152
AM=M+1 // 32153
A=A-1 // 32154
M=D // 32155
@LCL // 32156
A=M+1 // 32157
D=M // 32158
@8 // 32159
D=D-A // 32160
@DO_LT // 32161
0;JMP // 32162
(Int32.u4_array_mul_u4_array.LT.122)
D=!D // 32163
@Int32.u4_array_mul_u4_array_WHILE_END2 // 32164
D;JNE // 32165

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 32166
A=M+1 // 32167
A=A+1 // 32168
M=0 // 32169

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

@ARG // 32170
A=M+1 // 32171
D=M // 32172
@LCL // 32173
A=M+1 // 32174
A=D+M // 32175
D=M // 32176
@SP // 32177
AM=M+1 // 32178
A=A-1 // 32179
M=D // 32180
@LCL // 32181
D=M // 32182
@5 // 32183
A=D+A // 32184
D=A // 32185
@R13 // 32186
M=D // 32187
@SP // 32188
AM=M-1 // 32189
D=M // 32190
@R13 // 32191
A=M // 32192
M=D // 32193

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 32194
A=M+1 // 32195
A=A+1 // 32196
A=A+1 // 32197
M=0 // 32198

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
@Int32.u4_array_mul_u4_array.LT.123 // 32199
D=A // 32200
@SP // 32201
AM=M+1 // 32202
A=A-1 // 32203
M=D // 32204
@LCL // 32205
A=M+1 // 32206
A=A+1 // 32207
A=A+1 // 32208
D=M // 32209
@8 // 32210
D=D-A // 32211
@DO_LT // 32212
0;JMP // 32213
(Int32.u4_array_mul_u4_array.LT.123)
D=!D // 32214
@Int32.u4_array_mul_u4_array_WHILE_END3 // 32215
D;JNE // 32216

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

@ARG // 32217
A=M // 32218
D=M // 32219
@LCL // 32220
A=M+1 // 32221
A=A+1 // 32222
A=A+1 // 32223
A=D+M // 32224
D=M // 32225
@SP // 32226
AM=M+1 // 32227
A=A-1 // 32228
M=D // 32229
@RETURN_PUSH_LABEL_199 // 32230
D=A // 32231
@13 // 32232
M=D // 32233
@5 // 32234
D=A // 32235
@LCL_PUSH // 32236
0;JMP // 32237
(RETURN_PUSH_LABEL_199)
// call Math.multiply
@7 // 32238
D=A // 32239
@14 // 32240
M=D // 32241
@Math.multiply // 32242
D=A // 32243
@13 // 32244
M=D // 32245
@Int32.u4_array_mul_u4_array.ret.1 // 32246
D=A // 32247
@CALL // 32248
0;JMP // 32249
(Int32.u4_array_mul_u4_array.ret.1)
@LCL // 32250
A=M // 32251
D=M // 32252
@SP // 32253
AM=M+1 // 32254
A=A-1 // 32255
M=D // 32256
@LCL // 32257
A=M+1 // 32258
A=A+1 // 32259
A=A+1 // 32260
D=M // 32261
A=A-1 // 32262
A=A-1 // 32263
D=D+M // 32264
@SP // 32265
AM=M-1 // 32266
A=D+M // 32267
D=M // 32268
@SP // 32269
AM=M-1 // 32270
D=D+M // 32271
@SP // 32272
AM=M+1 // 32273
A=A-1 // 32274
M=D // 32275
@LCL // 32276
A=M+1 // 32277
A=A+1 // 32278
D=M // 32279
@SP // 32280
AM=M-1 // 32281
D=D+M // 32282
@SP // 32283
AM=M+1 // 32284
A=A-1 // 32285
M=D // 32286
@LCL // 32287
D=M // 32288
@4 // 32289
A=D+A // 32290
D=A // 32291
@R13 // 32292
M=D // 32293
@SP // 32294
AM=M-1 // 32295
D=M // 32296
@R13 // 32297
A=M // 32298
M=D // 32299

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
@LCL // 32300
A=M // 32301
D=M // 32302
@SP // 32303
AM=M+1 // 32304
A=A-1 // 32305
M=D // 32306
@LCL // 32307
A=M+1 // 32308
A=A+1 // 32309
A=A+1 // 32310
D=M // 32311
A=A-1 // 32312
A=A-1 // 32313
D=D+M // 32314
@SP // 32315
AM=M-1 // 32316
D=D+M // 32317
@SP // 32318
AM=M+1 // 32319
A=A-1 // 32320
M=D // 32321
@LCL // 32322
D=M // 32323
@4 // 32324
A=D+A // 32325
D=M // 32326
@15 // 32327
D=D&A // 32328
@SP // 32329
AM=M-1 // 32330
A=M // 32331
M=D // 32332

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), PushInstruction("constant 4")], call=CallInstruction{Int32.arith_rightshift}}
//  pop:  PopInstruction{address=local 2}
//}

@RETURN_PUSH_LABEL_200 // 32333
D=A // 32334
@13 // 32335
M=D // 32336
@4 // 32337
D=A // 32338
@LCL_PUSH // 32339
0;JMP // 32340
(RETURN_PUSH_LABEL_200)
@4 // 32341
D=A // 32342
@SP // 32343
AM=M+1 // 32344
A=A-1 // 32345
M=D // 32346
// call Int32.arith_rightshift
@7 // 32347
D=A // 32348
@14 // 32349
M=D // 32350
@Int32.arith_rightshift // 32351
D=A // 32352
@13 // 32353
M=D // 32354
@Int32.u4_array_mul_u4_array.ret.2 // 32355
D=A // 32356
@CALL // 32357
0;JMP // 32358
(Int32.u4_array_mul_u4_array.ret.2)
@SP // 32359
AM=M-1 // 32360
D=M // 32361
@LCL // 32362
A=M+1 // 32363
A=A+1 // 32364
M=D // 32365

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

@LCL // 32366
A=M+1 // 32367
A=A+1 // 32368
A=A+1 // 32369
M=M+1 // 32370

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP3}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP3
@Int32.u4_array_mul_u4_array_WHILE_EXP3 // 32371
0;JMP // 32372

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
@LCL // 32373
A=M // 32374
D=M // 32375
@SP // 32376
AM=M+1 // 32377
A=A-1 // 32378
M=D // 32379
@LCL // 32380
A=M+1 // 32381
D=M // 32382
@8 // 32383
D=D+A // 32384
@SP // 32385
AM=M-1 // 32386
D=D+M // 32387
@SP // 32388
AM=M+1 // 32389
A=A-1 // 32390
M=D // 32391
@LCL // 32392
A=M+1 // 32393
A=A+1 // 32394
D=M // 32395
@SP // 32396
AM=M-1 // 32397
A=M // 32398
M=D // 32399

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

@LCL // 32400
A=M+1 // 32401
M=M+1 // 32402

////GotoInstruction{label='Int32.u4_array_mul_u4_array_WHILE_EXP2}
// goto Int32.u4_array_mul_u4_array_WHILE_EXP2
@Int32.u4_array_mul_u4_array_WHILE_EXP2 // 32403
0;JMP // 32404

////LabelInstruction{label='Int32.u4_array_mul_u4_array_WHILE_END2}
// label Int32.u4_array_mul_u4_array_WHILE_END2
(Int32.u4_array_mul_u4_array_WHILE_END2)

////PushInstruction("local 0")
@LCL // 32405
A=M // 32406
D=M // 32407
@SP // 32408
AM=M+1 // 32409
A=A-1 // 32410
M=D // 32411
@RETURN // 32412
0;JMP // 32413

////FunctionInstruction{functionName='Main.getRawPixelColor', numLocals=18, funcMapping={Main.render=55, Main.main=75, Main.getSomething=4}}
// function Main.getRawPixelColor with 18
(Main.getRawPixelColor)
@18 // 32414
D=A // 32415
@SP // 32416
AM=D+M // 32417
A=A-1 // 32418
M=0 // 32419
A=A-1 // 32420
M=0 // 32421
A=A-1 // 32422
M=0 // 32423
A=A-1 // 32424
M=0 // 32425
A=A-1 // 32426
M=0 // 32427
A=A-1 // 32428
M=0 // 32429
A=A-1 // 32430
M=0 // 32431
A=A-1 // 32432
M=0 // 32433
A=A-1 // 32434
M=0 // 32435
A=A-1 // 32436
M=0 // 32437
A=A-1 // 32438
M=0 // 32439
A=A-1 // 32440
M=0 // 32441
A=A-1 // 32442
M=0 // 32443
A=A-1 // 32444
M=0 // 32445
A=A-1 // 32446
M=0 // 32447
A=A-1 // 32448
M=0 // 32449
A=A-1 // 32450
M=0 // 32451
A=A-1 // 32452
M=0 // 32453

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Number.new}}
//  pop:  PopInstruction{address=local 0}
//}

@SP // 32454
AM=M+1 // 32455
A=A-1 // 32456
M=0 // 32457
// call Number.new
@6 // 32458
D=A // 32459
@14 // 32460
M=D // 32461
@Number.new // 32462
D=A // 32463
@13 // 32464
M=D // 32465
@Main.getRawPixelColor.ret.0 // 32466
D=A // 32467
@CALL // 32468
0;JMP // 32469
(Main.getRawPixelColor.ret.0)
@SP // 32470
AM=M-1 // 32471
D=M // 32472
@LCL // 32473
A=M // 32474
M=D // 32475

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1"), PushInstruction("argument 2"), PushInstruction("argument 4"), PushInstruction("argument 5"), PushInstruction("argument 6")], call=CallInstruction{Scene.create_prime_ray}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 32476
A=M // 32477
D=M // 32478
@SP // 32479
AM=M+1 // 32480
A=A-1 // 32481
M=D // 32482
@ARG // 32483
A=M+1 // 32484
D=M // 32485
@SP // 32486
AM=M+1 // 32487
A=A-1 // 32488
M=D // 32489
@ARG // 32490
A=M+1 // 32491
A=A+1 // 32492
D=M // 32493
@SP // 32494
AM=M+1 // 32495
A=A-1 // 32496
M=D // 32497
@RETURN_PUSH_LABEL_201 // 32498
D=A // 32499
@13 // 32500
M=D // 32501
@4 // 32502
D=A // 32503
@ARG_PUSH // 32504
0;JMP // 32505
(RETURN_PUSH_LABEL_201)
@RETURN_PUSH_LABEL_202 // 32506
D=A // 32507
@13 // 32508
M=D // 32509
@5 // 32510
D=A // 32511
@ARG_PUSH // 32512
0;JMP // 32513
(RETURN_PUSH_LABEL_202)
@RETURN_PUSH_LABEL_203 // 32514
D=A // 32515
@13 // 32516
M=D // 32517
@6 // 32518
D=A // 32519
@ARG_PUSH // 32520
0;JMP // 32521
(RETURN_PUSH_LABEL_203)
// call Scene.create_prime_ray
@11 // 32522
D=A // 32523
@14 // 32524
M=D // 32525
@Scene.create_prime_ray // 32526
D=A // 32527
@13 // 32528
M=D // 32529
@Main.getRawPixelColor.ret.1 // 32530
D=A // 32531
@CALL // 32532
0;JMP // 32533
(Main.getRawPixelColor.ret.1)
@SP // 32534
AM=M-1 // 32535
D=M // 32536
@LCL // 32537
A=M+1 // 32538
M=D // 32539

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 1")], call=CallInstruction{Scene.trace}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 32540
A=M // 32541
D=M // 32542
@SP // 32543
AM=M+1 // 32544
A=A-1 // 32545
M=D // 32546
@LCL // 32547
A=M+1 // 32548
D=M // 32549
@SP // 32550
AM=M+1 // 32551
A=A-1 // 32552
M=D // 32553
// call Scene.trace
@7 // 32554
D=A // 32555
@14 // 32556
M=D // 32557
@Scene.trace // 32558
D=A // 32559
@13 // 32560
M=D // 32561
@Main.getRawPixelColor.ret.2 // 32562
D=A // 32563
@CALL // 32564
0;JMP // 32565
(Main.getRawPixelColor.ret.2)
@SP // 32566
AM=M-1 // 32567
D=M // 32568
@LCL // 32569
A=M+1 // 32570
A=A+1 // 32571
M=D // 32572

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE1}}
@Main.getRawPixelColor.EQ.124 // 32573
D=A // 32574
@SP // 32575
AM=M+1 // 32576
A=A-1 // 32577
M=D // 32578
@LCL // 32579
A=M+1 // 32580
A=A+1 // 32581
D=M // 32582
@DO_EQ // 32583
0;JMP // 32584
(Main.getRawPixelColor.EQ.124)
D=!D // 32585
@Main.getRawPixelColor$IF_TRUE1 // 32586
D;JNE // 32587

////GotoInstruction{label='Main.getRawPixelColor$IF_END1}
// goto Main.getRawPixelColor$IF_END1
@Main.getRawPixelColor$IF_END1 // 32588
0;JMP // 32589

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE1}
// label Main.getRawPixelColor$IF_TRUE1
(Main.getRawPixelColor$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.getOrigin}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 32590
A=M+1 // 32591
D=M // 32592
@SP // 32593
AM=M+1 // 32594
A=A-1 // 32595
M=D // 32596
// call Ray.getOrigin
@6 // 32597
D=A // 32598
@14 // 32599
M=D // 32600
@Ray.getOrigin // 32601
D=A // 32602
@13 // 32603
M=D // 32604
@Main.getRawPixelColor.ret.3 // 32605
D=A // 32606
@CALL // 32607
0;JMP // 32608
(Main.getRawPixelColor.ret.3)
@LCL // 32609
D=M // 32610
@12 // 32611
A=D+A // 32612
D=A // 32613
@R13 // 32614
M=D // 32615
@SP // 32616
AM=M-1 // 32617
D=M // 32618
@R13 // 32619
A=M // 32620
M=D // 32621

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 3}
//}

@RETURN_PUSH_LABEL_204 // 32622
D=A // 32623
@13 // 32624
M=D // 32625
@12 // 32626
D=A // 32627
@LCL_PUSH // 32628
0;JMP // 32629
(RETURN_PUSH_LABEL_204)
// call Vec3.clone
@6 // 32630
D=A // 32631
@14 // 32632
M=D // 32633
@Vec3.clone // 32634
D=A // 32635
@13 // 32636
M=D // 32637
@Main.getRawPixelColor.ret.4 // 32638
D=A // 32639
@CALL // 32640
0;JMP // 32641
(Main.getRawPixelColor.ret.4)
@SP // 32642
AM=M-1 // 32643
D=M // 32644
@LCL // 32645
A=M+1 // 32646
A=A+1 // 32647
A=A+1 // 32648
M=D // 32649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.getDirection}}
//  pop:  PopInstruction{address=local 12}
//}

@LCL // 32650
A=M+1 // 32651
D=M // 32652
@SP // 32653
AM=M+1 // 32654
A=A-1 // 32655
M=D // 32656
// call Ray.getDirection
@6 // 32657
D=A // 32658
@14 // 32659
M=D // 32660
@Ray.getDirection // 32661
D=A // 32662
@13 // 32663
M=D // 32664
@Main.getRawPixelColor.ret.5 // 32665
D=A // 32666
@CALL // 32667
0;JMP // 32668
(Main.getRawPixelColor.ret.5)
@LCL // 32669
D=M // 32670
@12 // 32671
A=D+A // 32672
D=A // 32673
@R13 // 32674
M=D // 32675
@SP // 32676
AM=M-1 // 32677
D=M // 32678
@R13 // 32679
A=M // 32680
M=D // 32681

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 4}
//}

@RETURN_PUSH_LABEL_205 // 32682
D=A // 32683
@13 // 32684
M=D // 32685
@12 // 32686
D=A // 32687
@LCL_PUSH // 32688
0;JMP // 32689
(RETURN_PUSH_LABEL_205)
// call Vec3.clone
@6 // 32690
D=A // 32691
@14 // 32692
M=D // 32693
@Vec3.clone // 32694
D=A // 32695
@13 // 32696
M=D // 32697
@Main.getRawPixelColor.ret.6 // 32698
D=A // 32699
@CALL // 32700
0;JMP // 32701
(Main.getRawPixelColor.ret.6)
@LCL // 32702
D=M // 32703
@4 // 32704
A=D+A // 32705
D=A // 32706
@R13 // 32707
M=D // 32708
@SP // 32709
AM=M-1 // 32710
D=M // 32711
@R13 // 32712
A=M // 32713
M=D // 32714

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4"), CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getDistanceFromOrigin}}], call=CallInstruction{Vec3.do_scale}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_206 // 32715
D=A // 32716
@13 // 32717
M=D // 32718
@4 // 32719
D=A // 32720
@LCL_PUSH // 32721
0;JMP // 32722
(RETURN_PUSH_LABEL_206)
@LCL // 32723
A=M+1 // 32724
A=A+1 // 32725
D=M // 32726
@SP // 32727
AM=M+1 // 32728
A=A-1 // 32729
M=D // 32730
// call Intersection.getDistanceFromOrigin
@6 // 32731
D=A // 32732
@14 // 32733
M=D // 32734
@Intersection.getDistanceFromOrigin // 32735
D=A // 32736
@13 // 32737
M=D // 32738
@Main.getRawPixelColor.ret.7 // 32739
D=A // 32740
@CALL // 32741
0;JMP // 32742
(Main.getRawPixelColor.ret.7)
// call Vec3.do_scale
@7 // 32743
D=A // 32744
@14 // 32745
M=D // 32746
@Vec3.do_scale // 32747
D=A // 32748
@13 // 32749
M=D // 32750
@Main.getRawPixelColor.ret.8 // 32751
D=A // 32752
@CALL // 32753
0;JMP // 32754
(Main.getRawPixelColor.ret.8)
@SP // 32755
M=M-1 // 32756

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3"), PushInstruction("local 4")], call=CallInstruction{Vec3.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 32757
A=M+1 // 32758
A=A+1 // 32759
A=A+1 // 32760
D=M // 32761
@SP // 32762
AM=M+1 // 32763
A=A-1 // 32764
M=D // 32765
@RETURN_PUSH_LABEL_207 // 32766
D=A // 32767
@13 // 32768
M=D // 32769
@4 // 32770
D=A // 32771
@LCL_PUSH // 32772
0;JMP // 32773
(RETURN_PUSH_LABEL_207)
// call Vec3.do_add
@7 // 32774
D=A // 32775
@14 // 32776
M=D // 32777
@Vec3.do_add // 32778
D=A // 32779
@13 // 32780
M=D // 32781
@Main.getRawPixelColor.ret.9 // 32782
D=A // 32783
@CALL // 32784
0;JMP // 32785
(Main.getRawPixelColor.ret.9)
@SP // 32786
M=M-1 // 32787

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getObject}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 32788
A=M+1 // 32789
A=A+1 // 32790
D=M // 32791
@SP // 32792
AM=M+1 // 32793
A=A-1 // 32794
M=D // 32795
// call Intersection.getObject
@6 // 32796
D=A // 32797
@14 // 32798
M=D // 32799
@Intersection.getObject // 32800
D=A // 32801
@13 // 32802
M=D // 32803
@Main.getRawPixelColor.ret.10 // 32804
D=A // 32805
@CALL // 32806
0;JMP // 32807
(Main.getRawPixelColor.ret.10)
@LCL // 32808
D=M // 32809
@13 // 32810
A=D+A // 32811
D=A // 32812
@R13 // 32813
M=D // 32814
@SP // 32815
AM=M-1 // 32816
D=M // 32817
@R13 // 32818
A=M // 32819
M=D // 32820

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13"), PushInstruction("local 3")], call=CallInstruction{Element.surface_normal}}
//  pop:  PopInstruction{address=local 5}
//}

@RETURN_PUSH_LABEL_208 // 32821
D=A // 32822
@13 // 32823
M=D // 32824
@13 // 32825
D=A // 32826
@LCL_PUSH // 32827
0;JMP // 32828
(RETURN_PUSH_LABEL_208)
@LCL // 32829
A=M+1 // 32830
A=A+1 // 32831
A=A+1 // 32832
D=M // 32833
@SP // 32834
AM=M+1 // 32835
A=A-1 // 32836
M=D // 32837
// call Element.surface_normal
@7 // 32838
D=A // 32839
@14 // 32840
M=D // 32841
@Element.surface_normal // 32842
D=A // 32843
@13 // 32844
M=D // 32845
@Main.getRawPixelColor.ret.11 // 32846
D=A // 32847
@CALL // 32848
0;JMP // 32849
(Main.getRawPixelColor.ret.11)
@LCL // 32850
D=M // 32851
@5 // 32852
A=D+A // 32853
D=A // 32854
@R13 // 32855
M=D // 32856
@SP // 32857
AM=M-1 // 32858
D=M // 32859
@R13 // 32860
A=M // 32861
M=D // 32862

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
@Main.getRawPixelColor.LT.125 // 32863
D=A // 32864
@SP // 32865
AM=M+1 // 32866
A=A-1 // 32867
M=D // 32868
@RETURN_PUSH_LABEL_209 // 32869
D=A // 32870
@13 // 32871
M=D // 32872
@14 // 32873
D=A // 32874
@LCL_PUSH // 32875
0;JMP // 32876
(RETURN_PUSH_LABEL_209)
@ARG // 32877
A=M // 32878
D=M // 32879
@SP // 32880
AM=M+1 // 32881
A=A-1 // 32882
M=D // 32883
// call Scene.getNumLights
@6 // 32884
D=A // 32885
@14 // 32886
M=D // 32887
@Scene.getNumLights // 32888
D=A // 32889
@13 // 32890
M=D // 32891
@Main.getRawPixelColor.ret.12 // 32892
D=A // 32893
@CALL // 32894
0;JMP // 32895
(Main.getRawPixelColor.ret.12)
@SP // 32896
AM=M-1 // 32897
D=M // 32898
@SP // 32899
AM=M-1 // 32900
D=M-D // 32901
@DO_LT // 32902
0;JMP // 32903
(Main.getRawPixelColor.LT.125)
D=!D // 32904
@Main.getRawPixelColor_WHILE_END1 // 32905
D;JNE // 32906

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Scene.getLights}}
//  pop:  PopInstruction{address=local 16}
//}

@ARG // 32907
A=M // 32908
D=M // 32909
@SP // 32910
AM=M+1 // 32911
A=A-1 // 32912
M=D // 32913
// call Scene.getLights
@6 // 32914
D=A // 32915
@14 // 32916
M=D // 32917
@Scene.getLights // 32918
D=A // 32919
@13 // 32920
M=D // 32921
@Main.getRawPixelColor.ret.13 // 32922
D=A // 32923
@CALL // 32924
0;JMP // 32925
(Main.getRawPixelColor.ret.13)
@LCL // 32926
D=M // 32927
@16 // 32928
A=D+A // 32929
D=A // 32930
@R13 // 32931
M=D // 32932
@SP // 32933
AM=M-1 // 32934
D=M // 32935
@R13 // 32936
A=M // 32937
M=D // 32938

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

@LCL // 32939
D=M // 32940
@16 // 32941
A=D+A // 32942
D=M // 32943
A=A-1 // 32944
A=A-1 // 32945
A=D+M // 32946
D=M // 32947
@SP // 32948
AM=M+1 // 32949
A=A-1 // 32950
M=D // 32951
@LCL // 32952
D=M // 32953
@17 // 32954
A=D+A // 32955
D=A // 32956
@R13 // 32957
M=D // 32958
@SP // 32959
AM=M-1 // 32960
D=M // 32961
@R13 // 32962
A=M // 32963
M=D // 32964

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 6}
//}

@LCL // 32965
A=M+1 // 32966
A=A+1 // 32967
A=A+1 // 32968
D=M // 32969
@SP // 32970
AM=M+1 // 32971
A=A-1 // 32972
M=D // 32973
// call Vec3.clone
@6 // 32974
D=A // 32975
@14 // 32976
M=D // 32977
@Vec3.clone // 32978
D=A // 32979
@13 // 32980
M=D // 32981
@Main.getRawPixelColor.ret.14 // 32982
D=A // 32983
@CALL // 32984
0;JMP // 32985
(Main.getRawPixelColor.ret.14)
@LCL // 32986
D=M // 32987
@6 // 32988
A=D+A // 32989
D=A // 32990
@R13 // 32991
M=D // 32992
@SP // 32993
AM=M-1 // 32994
D=M // 32995
@R13 // 32996
A=M // 32997
M=D // 32998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getShadowBias}}], call=CallInstruction{Vec3.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_210 // 32999
D=A // 33000
@13 // 33001
M=D // 33002
@6 // 33003
D=A // 33004
@LCL_PUSH // 33005
0;JMP // 33006
(RETURN_PUSH_LABEL_210)
@RETURN_PUSH_LABEL_211 // 33007
D=A // 33008
@13 // 33009
M=D // 33010
@17 // 33011
D=A // 33012
@LCL_PUSH // 33013
0;JMP // 33014
(RETURN_PUSH_LABEL_211)
// call DirectionalLight.getShadowBias
@6 // 33015
D=A // 33016
@14 // 33017
M=D // 33018
@DirectionalLight.getShadowBias // 33019
D=A // 33020
@13 // 33021
M=D // 33022
@Main.getRawPixelColor.ret.15 // 33023
D=A // 33024
@CALL // 33025
0;JMP // 33026
(Main.getRawPixelColor.ret.15)
// call Vec3.do_add
@7 // 33027
D=A // 33028
@14 // 33029
M=D // 33030
@Vec3.do_add // 33031
D=A // 33032
@13 // 33033
M=D // 33034
@Main.getRawPixelColor.ret.16 // 33035
D=A // 33036
@CALL // 33037
0;JMP // 33038
(Main.getRawPixelColor.ret.16)
@SP // 33039
M=M-1 // 33040

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getNegDirection}}
//  pop:  PopInstruction{address=local 12}
//}

@RETURN_PUSH_LABEL_212 // 33041
D=A // 33042
@13 // 33043
M=D // 33044
@17 // 33045
D=A // 33046
@LCL_PUSH // 33047
0;JMP // 33048
(RETURN_PUSH_LABEL_212)
// call DirectionalLight.getNegDirection
@6 // 33049
D=A // 33050
@14 // 33051
M=D // 33052
@DirectionalLight.getNegDirection // 33053
D=A // 33054
@13 // 33055
M=D // 33056
@Main.getRawPixelColor.ret.17 // 33057
D=A // 33058
@CALL // 33059
0;JMP // 33060
(Main.getRawPixelColor.ret.17)
@LCL // 33061
D=M // 33062
@12 // 33063
A=D+A // 33064
D=A // 33065
@R13 // 33066
M=D // 33067
@SP // 33068
AM=M-1 // 33069
D=M // 33070
@R13 // 33071
A=M // 33072
M=D // 33073

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 6"), CallGroup{pushes=[PushInstruction("local 12")], call=CallInstruction{Vec3.clone}}], call=CallInstruction{Ray.new}}
//  pop:  PopInstruction{address=local 7}
//}

@RETURN_PUSH_LABEL_213 // 33074
D=A // 33075
@13 // 33076
M=D // 33077
@6 // 33078
D=A // 33079
@LCL_PUSH // 33080
0;JMP // 33081
(RETURN_PUSH_LABEL_213)
@RETURN_PUSH_LABEL_214 // 33082
D=A // 33083
@13 // 33084
M=D // 33085
@12 // 33086
D=A // 33087
@LCL_PUSH // 33088
0;JMP // 33089
(RETURN_PUSH_LABEL_214)
// call Vec3.clone
@6 // 33090
D=A // 33091
@14 // 33092
M=D // 33093
@Vec3.clone // 33094
D=A // 33095
@13 // 33096
M=D // 33097
@Main.getRawPixelColor.ret.18 // 33098
D=A // 33099
@CALL // 33100
0;JMP // 33101
(Main.getRawPixelColor.ret.18)
// call Ray.new
@7 // 33102
D=A // 33103
@14 // 33104
M=D // 33105
@Ray.new // 33106
D=A // 33107
@13 // 33108
M=D // 33109
@Main.getRawPixelColor.ret.19 // 33110
D=A // 33111
@CALL // 33112
0;JMP // 33113
(Main.getRawPixelColor.ret.19)
@LCL // 33114
D=M // 33115
@7 // 33116
A=D+A // 33117
D=A // 33118
@R13 // 33119
M=D // 33120
@SP // 33121
AM=M-1 // 33122
D=M // 33123
@R13 // 33124
A=M // 33125
M=D // 33126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 7")], call=CallInstruction{Scene.trace}}
//  pop:  PopInstruction{address=local 8}
//}

@ARG // 33127
A=M // 33128
D=M // 33129
@SP // 33130
AM=M+1 // 33131
A=A-1 // 33132
M=D // 33133
@RETURN_PUSH_LABEL_215 // 33134
D=A // 33135
@13 // 33136
M=D // 33137
@7 // 33138
D=A // 33139
@LCL_PUSH // 33140
0;JMP // 33141
(RETURN_PUSH_LABEL_215)
// call Scene.trace
@7 // 33142
D=A // 33143
@14 // 33144
M=D // 33145
@Scene.trace // 33146
D=A // 33147
@13 // 33148
M=D // 33149
@Main.getRawPixelColor.ret.20 // 33150
D=A // 33151
@CALL // 33152
0;JMP // 33153
(Main.getRawPixelColor.ret.20)
@LCL // 33154
D=M // 33155
@8 // 33156
A=D+A // 33157
D=A // 33158
@R13 // 33159
M=D // 33160
@SP // 33161
AM=M-1 // 33162
D=M // 33163
@R13 // 33164
A=M // 33165
M=D // 33166

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

@Main.getRawPixelColor.EQ.126 // 33167
D=A // 33168
@SP // 33169
AM=M+1 // 33170
A=A-1 // 33171
M=D // 33172
@LCL // 33173
D=M // 33174
@8 // 33175
A=D+A // 33176
D=M // 33177
@DO_EQ // 33178
0;JMP // 33179
(Main.getRawPixelColor.EQ.126)
@SP // 33180
AM=M+1 // 33181
A=A-1 // 33182
M=D // 33183
@LCL // 33184
D=M // 33185
@9 // 33186
A=D+A // 33187
D=A // 33188
@R13 // 33189
M=D // 33190
@SP // 33191
AM=M-1 // 33192
D=M // 33193
@R13 // 33194
A=M // 33195
M=D // 33196

////ConditionalGroup{push=PushInstruction("local 8"), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE2}}
@LCL // 33197
D=M // 33198
@8 // 33199
A=D+A // 33200
D=M // 33201
@Main.getRawPixelColor$IF_TRUE2 // 33202
D;JNE // 33203

////GotoInstruction{label='Main.getRawPixelColor$IF_END2}
// goto Main.getRawPixelColor$IF_END2
@Main.getRawPixelColor$IF_END2 // 33204
0;JMP // 33205

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE2}
// label Main.getRawPixelColor$IF_TRUE2
(Main.getRawPixelColor$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 8")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_216 // 33206
D=A // 33207
@13 // 33208
M=D // 33209
@8 // 33210
D=A // 33211
@LCL_PUSH // 33212
0;JMP // 33213
(RETURN_PUSH_LABEL_216)
// call Intersection.dispose
@6 // 33214
D=A // 33215
@14 // 33216
M=D // 33217
@Intersection.dispose // 33218
D=A // 33219
@13 // 33220
M=D // 33221
@Main.getRawPixelColor.ret.21 // 33222
D=A // 33223
@CALL // 33224
0;JMP // 33225
(Main.getRawPixelColor.ret.21)
@SP // 33226
M=M-1 // 33227

////LabelInstruction{label='Main.getRawPixelColor$IF_END2}
// label Main.getRawPixelColor$IF_END2
(Main.getRawPixelColor$IF_END2)

////ConditionalGroup{push=PushInstruction("local 9"), ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE3}}
@LCL // 33228
D=M // 33229
@9 // 33230
A=D+A // 33231
D=M // 33232
@Main.getRawPixelColor$IF_TRUE3 // 33233
D;JNE // 33234

////GotoInstruction{label='Main.getRawPixelColor$IF_END3}
// goto Main.getRawPixelColor$IF_END3
@Main.getRawPixelColor$IF_END3 // 33235
0;JMP // 33236

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE3}
// label Main.getRawPixelColor$IF_TRUE3
(Main.getRawPixelColor$IF_TRUE3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5"), CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getNegDirection}}], call=CallInstruction{Vec3.dot}}
//  pop:  PopInstruction{address=local 10}
//}

@RETURN_PUSH_LABEL_217 // 33237
D=A // 33238
@13 // 33239
M=D // 33240
@5 // 33241
D=A // 33242
@LCL_PUSH // 33243
0;JMP // 33244
(RETURN_PUSH_LABEL_217)
@RETURN_PUSH_LABEL_218 // 33245
D=A // 33246
@13 // 33247
M=D // 33248
@17 // 33249
D=A // 33250
@LCL_PUSH // 33251
0;JMP // 33252
(RETURN_PUSH_LABEL_218)
// call DirectionalLight.getNegDirection
@6 // 33253
D=A // 33254
@14 // 33255
M=D // 33256
@DirectionalLight.getNegDirection // 33257
D=A // 33258
@13 // 33259
M=D // 33260
@Main.getRawPixelColor.ret.22 // 33261
D=A // 33262
@CALL // 33263
0;JMP // 33264
(Main.getRawPixelColor.ret.22)
// call Vec3.dot
@7 // 33265
D=A // 33266
@14 // 33267
M=D // 33268
@Vec3.dot // 33269
D=A // 33270
@13 // 33271
M=D // 33272
@Main.getRawPixelColor.ret.23 // 33273
D=A // 33274
@CALL // 33275
0;JMP // 33276
(Main.getRawPixelColor.ret.23)
@LCL // 33277
D=M // 33278
@10 // 33279
A=D+A // 33280
D=A // 33281
@R13 // 33282
M=D // 33283
@SP // 33284
AM=M-1 // 33285
D=M // 33286
@R13 // 33287
A=M // 33288
M=D // 33289

////ConditionalGroup{push=CallGroup{pushes=[PushInstruction("local 10")], call=CallInstruction{Number.is_positive}}, ifGoto=IfGotoInstruction{label='Main.getRawPixelColor$IF_TRUE4}}
@RETURN_PUSH_LABEL_219 // 33290
D=A // 33291
@13 // 33292
M=D // 33293
@10 // 33294
D=A // 33295
@LCL_PUSH // 33296
0;JMP // 33297
(RETURN_PUSH_LABEL_219)
// call Number.is_positive
@6 // 33298
D=A // 33299
@14 // 33300
M=D // 33301
@Number.is_positive // 33302
D=A // 33303
@13 // 33304
M=D // 33305
@Main.getRawPixelColor.ret.24 // 33306
D=A // 33307
@CALL // 33308
0;JMP // 33309
(Main.getRawPixelColor.ret.24)
@SP // 33310
AM=M-1 // 33311
D=M // 33312
@Main.getRawPixelColor$IF_TRUE4 // 33313
D;JNE // 33314

////GotoInstruction{label='Main.getRawPixelColor$IF_END4}
// goto Main.getRawPixelColor$IF_END4
@Main.getRawPixelColor$IF_END4 // 33315
0;JMP // 33316

////LabelInstruction{label='Main.getRawPixelColor$IF_TRUE4}
// label Main.getRawPixelColor$IF_TRUE4
(Main.getRawPixelColor$IF_TRUE4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 17")], call=CallInstruction{DirectionalLight.getColor}}
//  pop:  PopInstruction{address=local 15}
//}

@RETURN_PUSH_LABEL_220 // 33317
D=A // 33318
@13 // 33319
M=D // 33320
@17 // 33321
D=A // 33322
@LCL_PUSH // 33323
0;JMP // 33324
(RETURN_PUSH_LABEL_220)
// call DirectionalLight.getColor
@6 // 33325
D=A // 33326
@14 // 33327
M=D // 33328
@DirectionalLight.getColor // 33329
D=A // 33330
@13 // 33331
M=D // 33332
@Main.getRawPixelColor.ret.25 // 33333
D=A // 33334
@CALL // 33335
0;JMP // 33336
(Main.getRawPixelColor.ret.25)
@LCL // 33337
D=M // 33338
@15 // 33339
A=D+A // 33340
D=A // 33341
@R13 // 33342
M=D // 33343
@SP // 33344
AM=M-1 // 33345
D=M // 33346
@R13 // 33347
A=M // 33348
M=D // 33349

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 15")], call=CallInstruction{Number.clone}}
//  pop:  PopInstruction{address=local 11}
//}

@RETURN_PUSH_LABEL_221 // 33350
D=A // 33351
@13 // 33352
M=D // 33353
@15 // 33354
D=A // 33355
@LCL_PUSH // 33356
0;JMP // 33357
(RETURN_PUSH_LABEL_221)
// call Number.clone
@6 // 33358
D=A // 33359
@14 // 33360
M=D // 33361
@Number.clone // 33362
D=A // 33363
@13 // 33364
M=D // 33365
@Main.getRawPixelColor.ret.26 // 33366
D=A // 33367
@CALL // 33368
0;JMP // 33369
(Main.getRawPixelColor.ret.26)
@LCL // 33370
D=M // 33371
@11 // 33372
A=D+A // 33373
D=A // 33374
@R13 // 33375
M=D // 33376
@SP // 33377
AM=M-1 // 33378
D=M // 33379
@R13 // 33380
A=M // 33381
M=D // 33382

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), PushInstruction("local 10")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_222 // 33383
D=A // 33384
@13 // 33385
M=D // 33386
@11 // 33387
D=A // 33388
@LCL_PUSH // 33389
0;JMP // 33390
(RETURN_PUSH_LABEL_222)
@RETURN_PUSH_LABEL_223 // 33391
D=A // 33392
@13 // 33393
M=D // 33394
@10 // 33395
D=A // 33396
@LCL_PUSH // 33397
0;JMP // 33398
(RETURN_PUSH_LABEL_223)
// call Number.do_mul
@7 // 33399
D=A // 33400
@14 // 33401
M=D // 33402
@Number.do_mul // 33403
D=A // 33404
@13 // 33405
M=D // 33406
@Main.getRawPixelColor.ret.27 // 33407
D=A // 33408
@CALL // 33409
0;JMP // 33410
(Main.getRawPixelColor.ret.27)
@SP // 33411
M=M-1 // 33412

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), CallGroup{pushes=[], call=CallInstruction{Number.getPi}}], call=CallInstruction{Number.do_div}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_224 // 33413
D=A // 33414
@13 // 33415
M=D // 33416
@11 // 33417
D=A // 33418
@LCL_PUSH // 33419
0;JMP // 33420
(RETURN_PUSH_LABEL_224)
// call Number.getPi
@5 // 33421
D=A // 33422
@14 // 33423
M=D // 33424
@Number.getPi // 33425
D=A // 33426
@13 // 33427
M=D // 33428
@Main.getRawPixelColor.ret.28 // 33429
D=A // 33430
@CALL // 33431
0;JMP // 33432
(Main.getRawPixelColor.ret.28)
// call Number.do_div
@7 // 33433
D=A // 33434
@14 // 33435
M=D // 33436
@Number.do_div // 33437
D=A // 33438
@13 // 33439
M=D // 33440
@Main.getRawPixelColor.ret.29 // 33441
D=A // 33442
@CALL // 33443
0;JMP // 33444
(Main.getRawPixelColor.ret.29)
@SP // 33445
M=M-1 // 33446

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.getObject}}
//  pop:  PopInstruction{address=local 13}
//}

@LCL // 33447
A=M+1 // 33448
A=A+1 // 33449
D=M // 33450
@SP // 33451
AM=M+1 // 33452
A=A-1 // 33453
M=D // 33454
// call Intersection.getObject
@6 // 33455
D=A // 33456
@14 // 33457
M=D // 33458
@Intersection.getObject // 33459
D=A // 33460
@13 // 33461
M=D // 33462
@Main.getRawPixelColor.ret.30 // 33463
D=A // 33464
@CALL // 33465
0;JMP // 33466
(Main.getRawPixelColor.ret.30)
@LCL // 33467
D=M // 33468
@13 // 33469
A=D+A // 33470
D=A // 33471
@R13 // 33472
M=D // 33473
@SP // 33474
AM=M-1 // 33475
D=M // 33476
@R13 // 33477
A=M // 33478
M=D // 33479

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 13"), PushInstruction("local 3")], call=CallInstruction{Element.color}}
//  pop:  PopInstruction{address=local 15}
//}

@RETURN_PUSH_LABEL_225 // 33480
D=A // 33481
@13 // 33482
M=D // 33483
@13 // 33484
D=A // 33485
@LCL_PUSH // 33486
0;JMP // 33487
(RETURN_PUSH_LABEL_225)
@LCL // 33488
A=M+1 // 33489
A=A+1 // 33490
A=A+1 // 33491
D=M // 33492
@SP // 33493
AM=M+1 // 33494
A=A-1 // 33495
M=D // 33496
// call Element.color
@7 // 33497
D=A // 33498
@14 // 33499
M=D // 33500
@Element.color // 33501
D=A // 33502
@13 // 33503
M=D // 33504
@Main.getRawPixelColor.ret.31 // 33505
D=A // 33506
@CALL // 33507
0;JMP // 33508
(Main.getRawPixelColor.ret.31)
@LCL // 33509
D=M // 33510
@15 // 33511
A=D+A // 33512
D=A // 33513
@R13 // 33514
M=D // 33515
@SP // 33516
AM=M-1 // 33517
D=M // 33518
@R13 // 33519
A=M // 33520
M=D // 33521

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11"), PushInstruction("local 15")], call=CallInstruction{Number.do_mul}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_226 // 33522
D=A // 33523
@13 // 33524
M=D // 33525
@11 // 33526
D=A // 33527
@LCL_PUSH // 33528
0;JMP // 33529
(RETURN_PUSH_LABEL_226)
@RETURN_PUSH_LABEL_227 // 33530
D=A // 33531
@13 // 33532
M=D // 33533
@15 // 33534
D=A // 33535
@LCL_PUSH // 33536
0;JMP // 33537
(RETURN_PUSH_LABEL_227)
// call Number.do_mul
@7 // 33538
D=A // 33539
@14 // 33540
M=D // 33541
@Number.do_mul // 33542
D=A // 33543
@13 // 33544
M=D // 33545
@Main.getRawPixelColor.ret.32 // 33546
D=A // 33547
@CALL // 33548
0;JMP // 33549
(Main.getRawPixelColor.ret.32)
@SP // 33550
M=M-1 // 33551

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 15")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_228 // 33552
D=A // 33553
@13 // 33554
M=D // 33555
@15 // 33556
D=A // 33557
@LCL_PUSH // 33558
0;JMP // 33559
(RETURN_PUSH_LABEL_228)
// call Number.dispose
@6 // 33560
D=A // 33561
@14 // 33562
M=D // 33563
@Number.dispose // 33564
D=A // 33565
@13 // 33566
M=D // 33567
@Main.getRawPixelColor.ret.33 // 33568
D=A // 33569
@CALL // 33570
0;JMP // 33571
(Main.getRawPixelColor.ret.33)
@SP // 33572
M=M-1 // 33573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("local 11")], call=CallInstruction{Number.do_add}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33574
A=M // 33575
D=M // 33576
@SP // 33577
AM=M+1 // 33578
A=A-1 // 33579
M=D // 33580
@RETURN_PUSH_LABEL_229 // 33581
D=A // 33582
@13 // 33583
M=D // 33584
@11 // 33585
D=A // 33586
@LCL_PUSH // 33587
0;JMP // 33588
(RETURN_PUSH_LABEL_229)
// call Number.do_add
@7 // 33589
D=A // 33590
@14 // 33591
M=D // 33592
@Number.do_add // 33593
D=A // 33594
@13 // 33595
M=D // 33596
@Main.getRawPixelColor.ret.34 // 33597
D=A // 33598
@CALL // 33599
0;JMP // 33600
(Main.getRawPixelColor.ret.34)
@SP // 33601
M=M-1 // 33602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 11")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_230 // 33603
D=A // 33604
@13 // 33605
M=D // 33606
@11 // 33607
D=A // 33608
@LCL_PUSH // 33609
0;JMP // 33610
(RETURN_PUSH_LABEL_230)
// call Number.dispose
@6 // 33611
D=A // 33612
@14 // 33613
M=D // 33614
@Number.dispose // 33615
D=A // 33616
@13 // 33617
M=D // 33618
@Main.getRawPixelColor.ret.35 // 33619
D=A // 33620
@CALL // 33621
0;JMP // 33622
(Main.getRawPixelColor.ret.35)
@SP // 33623
M=M-1 // 33624

////LabelInstruction{label='Main.getRawPixelColor$IF_END4}
// label Main.getRawPixelColor$IF_END4
(Main.getRawPixelColor$IF_END4)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 10")], call=CallInstruction{Number.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_231 // 33625
D=A // 33626
@13 // 33627
M=D // 33628
@10 // 33629
D=A // 33630
@LCL_PUSH // 33631
0;JMP // 33632
(RETURN_PUSH_LABEL_231)
// call Number.dispose
@6 // 33633
D=A // 33634
@14 // 33635
M=D // 33636
@Number.dispose // 33637
D=A // 33638
@13 // 33639
M=D // 33640
@Main.getRawPixelColor.ret.36 // 33641
D=A // 33642
@CALL // 33643
0;JMP // 33644
(Main.getRawPixelColor.ret.36)
@SP // 33645
M=M-1 // 33646

////LabelInstruction{label='Main.getRawPixelColor$IF_END3}
// label Main.getRawPixelColor$IF_END3
(Main.getRawPixelColor$IF_END3)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 7")], call=CallInstruction{Ray.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_232 // 33647
D=A // 33648
@13 // 33649
M=D // 33650
@7 // 33651
D=A // 33652
@LCL_PUSH // 33653
0;JMP // 33654
(RETURN_PUSH_LABEL_232)
// call Ray.dispose
@6 // 33655
D=A // 33656
@14 // 33657
M=D // 33658
@Ray.dispose // 33659
D=A // 33660
@13 // 33661
M=D // 33662
@Main.getRawPixelColor.ret.37 // 33663
D=A // 33664
@CALL // 33665
0;JMP // 33666
(Main.getRawPixelColor.ret.37)
@SP // 33667
M=M-1 // 33668

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

@LCL // 33669
D=M // 33670
@14 // 33671
A=D+A // 33672
M=M+1 // 33673

////GotoInstruction{label='Main.getRawPixelColor_WHILE_EXP1}
// goto Main.getRawPixelColor_WHILE_EXP1
@Main.getRawPixelColor_WHILE_EXP1 // 33674
0;JMP // 33675

////LabelInstruction{label='Main.getRawPixelColor_WHILE_END1}
// label Main.getRawPixelColor_WHILE_END1
(Main.getRawPixelColor_WHILE_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Intersection.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33676
A=M+1 // 33677
A=A+1 // 33678
D=M // 33679
@SP // 33680
AM=M+1 // 33681
A=A-1 // 33682
M=D // 33683
// call Intersection.dispose
@6 // 33684
D=A // 33685
@14 // 33686
M=D // 33687
@Intersection.dispose // 33688
D=A // 33689
@13 // 33690
M=D // 33691
@Main.getRawPixelColor.ret.38 // 33692
D=A // 33693
@CALL // 33694
0;JMP // 33695
(Main.getRawPixelColor.ret.38)
@SP // 33696
M=M-1 // 33697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 3")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33698
A=M+1 // 33699
A=A+1 // 33700
A=A+1 // 33701
D=M // 33702
@SP // 33703
AM=M+1 // 33704
A=A-1 // 33705
M=D // 33706
// call Vec3.dispose
@6 // 33707
D=A // 33708
@14 // 33709
M=D // 33710
@Vec3.dispose // 33711
D=A // 33712
@13 // 33713
M=D // 33714
@Main.getRawPixelColor.ret.39 // 33715
D=A // 33716
@CALL // 33717
0;JMP // 33718
(Main.getRawPixelColor.ret.39)
@SP // 33719
M=M-1 // 33720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_233 // 33721
D=A // 33722
@13 // 33723
M=D // 33724
@4 // 33725
D=A // 33726
@LCL_PUSH // 33727
0;JMP // 33728
(RETURN_PUSH_LABEL_233)
// call Vec3.dispose
@6 // 33729
D=A // 33730
@14 // 33731
M=D // 33732
@Vec3.dispose // 33733
D=A // 33734
@13 // 33735
M=D // 33736
@Main.getRawPixelColor.ret.40 // 33737
D=A // 33738
@CALL // 33739
0;JMP // 33740
(Main.getRawPixelColor.ret.40)
@SP // 33741
M=M-1 // 33742

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 5")], call=CallInstruction{Vec3.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_234 // 33743
D=A // 33744
@13 // 33745
M=D // 33746
@5 // 33747
D=A // 33748
@LCL_PUSH // 33749
0;JMP // 33750
(RETURN_PUSH_LABEL_234)
// call Vec3.dispose
@6 // 33751
D=A // 33752
@14 // 33753
M=D // 33754
@Vec3.dispose // 33755
D=A // 33756
@13 // 33757
M=D // 33758
@Main.getRawPixelColor.ret.41 // 33759
D=A // 33760
@CALL // 33761
0;JMP // 33762
(Main.getRawPixelColor.ret.41)
@SP // 33763
M=M-1 // 33764

////LabelInstruction{label='Main.getRawPixelColor$IF_END1}
// label Main.getRawPixelColor$IF_END1
(Main.getRawPixelColor$IF_END1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Ray.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 33765
A=M+1 // 33766
D=M // 33767
@SP // 33768
AM=M+1 // 33769
A=A-1 // 33770
M=D // 33771
// call Ray.dispose
@6 // 33772
D=A // 33773
@14 // 33774
M=D // 33775
@Ray.dispose // 33776
D=A // 33777
@13 // 33778
M=D // 33779
@Main.getRawPixelColor.ret.42 // 33780
D=A // 33781
@CALL // 33782
0;JMP // 33783
(Main.getRawPixelColor.ret.42)
@SP // 33784
M=M-1 // 33785

////PushInstruction("local 0")
@LCL // 33786
A=M // 33787
D=M // 33788
@SP // 33789
AM=M+1 // 33790
A=A-1 // 33791
M=D // 33792
@RETURN // 33793
0;JMP // 33794

////FunctionInstruction{functionName='Number.is_positive', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2}}
// function Number.is_positive with 0
(Number.is_positive)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 33795
A=M // 33796
D=M // 33797
@3 // 33798
M=D // 33799

////CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Int32.is_positive}}
@THIS // 33800
A=M // 33801
D=M // 33802
@SP // 33803
AM=M+1 // 33804
A=A-1 // 33805
M=D // 33806
// call Int32.is_positive
@6 // 33807
D=A // 33808
@14 // 33809
M=D // 33810
@Int32.is_positive // 33811
D=A // 33812
@13 // 33813
M=D // 33814
@Number.is_positive.ret.0 // 33815
D=A // 33816
@CALL // 33817
0;JMP // 33818
(Number.is_positive.ret.0)
@RETURN // 33819
0;JMP // 33820

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.twoToThe=0, Math.max=0, Math.init=1, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 33821
D=A // 33822
@SP // 33823
AM=D+M // 33824
A=A-1 // 33825
M=0 // 33826
A=A-1 // 33827
M=0 // 33828
A=A-1 // 33829
M=0 // 33830

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.EQ.127 // 33831
D=A // 33832
@SP // 33833
AM=M+1 // 33834
A=A-1 // 33835
M=D // 33836
@ARG // 33837
A=M+1 // 33838
D=M // 33839
@DO_EQ // 33840
0;JMP // 33841
(Math.divide.EQ.127)
@Math.divide$IF_TRUE1 // 33842
D;JNE // 33843

////GotoInstruction{label='Math.divide$IF_END1}
// goto Math.divide$IF_END1
@Math.divide$IF_END1 // 33844
0;JMP // 33845

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 33846
AM=M+1 // 33847
A=A-1 // 33848
M=0 // 33849
@RETURN // 33850
0;JMP // 33851

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
@Math.divide.EQ.128 // 33852
D=A // 33853
@SP // 33854
AM=M+1 // 33855
A=A-1 // 33856
M=D // 33857
@ARG // 33858
A=M+1 // 33859
D=M // 33860
A=A-1 // 33861
D=M-D // 33862
@DO_EQ // 33863
0;JMP // 33864
(Math.divide.EQ.128)
@Math.divide$IF_TRUE2 // 33865
D;JNE // 33866

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 33867
0;JMP // 33868

////LabelInstruction{label='Math.divide$IF_TRUE2}
// label Math.divide$IF_TRUE2
(Math.divide$IF_TRUE2)

////PushInstruction("constant 1")
@SP // 33869
AM=M+1 // 33870
A=A-1 // 33871
M=1 // 33872
@RETURN // 33873
0;JMP // 33874

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 33875
A=M // 33876
D=M // 33877
@SP // 33878
AM=M+1 // 33879
A=A-1 // 33880
M=D // 33881
@ARG // 33882
A=M // 33883
D=M // 33884
@SP // 33885
AM=M+1 // 33886
A=A-1 // 33887
M=D // 33888
@SP // 33889
A=M-1 // 33890
M=-D // 33891
// call Math.max
@7 // 33892
D=A // 33893
@14 // 33894
M=D // 33895
@Math.max // 33896
D=A // 33897
@13 // 33898
M=D // 33899
@Math.divide.ret.0 // 33900
D=A // 33901
@CALL // 33902
0;JMP // 33903
(Math.divide.ret.0)
@SP // 33904
AM=M-1 // 33905
D=M // 33906
@LCL // 33907
A=M+1 // 33908
M=D // 33909

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1"), UnaryPushGroup(    PushInstruction("argument 1"),
//NEG)], call=CallInstruction{Math.max}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 33910
A=M+1 // 33911
D=M // 33912
@SP // 33913
AM=M+1 // 33914
A=A-1 // 33915
M=D // 33916
@ARG // 33917
A=M+1 // 33918
D=M // 33919
@SP // 33920
AM=M+1 // 33921
A=A-1 // 33922
M=D // 33923
@SP // 33924
A=M-1 // 33925
M=-D // 33926
// call Math.max
@7 // 33927
D=A // 33928
@14 // 33929
M=D // 33930
@Math.max // 33931
D=A // 33932
@13 // 33933
M=D // 33934
@Math.divide.ret.1 // 33935
D=A // 33936
@CALL // 33937
0;JMP // 33938
(Math.divide.ret.1)
@SP // 33939
AM=M-1 // 33940
D=M // 33941
@LCL // 33942
A=M+1 // 33943
A=A+1 // 33944
M=D // 33945

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE3}}
@Math.divide.GT.129 // 33946
D=A // 33947
@SP // 33948
AM=M+1 // 33949
A=A-1 // 33950
M=D // 33951
@LCL // 33952
A=M+1 // 33953
A=A+1 // 33954
D=M // 33955
A=A-1 // 33956
D=D-M // 33957
@DO_GT // 33958
0;JMP // 33959
(Math.divide.GT.129)
@Math.divide$IF_TRUE3 // 33960
D;JNE // 33961

////GotoInstruction{label='Math.divide$IF_END3}
// goto Math.divide$IF_END3
@Math.divide$IF_END3 // 33962
0;JMP // 33963

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 33964
AM=M+1 // 33965
A=A-1 // 33966
M=0 // 33967
@RETURN // 33968
0;JMP // 33969

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

@LCL // 33970
A=M+1 // 33971
D=M // 33972
@SP // 33973
AM=M+1 // 33974
A=A-1 // 33975
M=D // 33976
@LCL // 33977
A=M+1 // 33978
A=A+1 // 33979
D=M // 33980
D=D+M // 33981
@SP // 33982
AM=M+1 // 33983
A=A-1 // 33984
M=D // 33985
// call Math.divide
@7 // 33986
D=A // 33987
@14 // 33988
M=D // 33989
@Math.divide // 33990
D=A // 33991
@13 // 33992
M=D // 33993
@Math.divide.ret.2 // 33994
D=A // 33995
@CALL // 33996
0;JMP // 33997
(Math.divide.ret.2)
@SP // 33998
AM=M-1 // 33999
D=M // 34000
@LCL // 34001
A=M // 34002
M=D // 34003

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
@Math.divide.LT.130 // 34004
D=A // 34005
@SP // 34006
AM=M+1 // 34007
A=A-1 // 34008
M=D // 34009
@LCL // 34010
A=M+1 // 34011
D=M // 34012
@SP // 34013
AM=M+1 // 34014
A=A-1 // 34015
M=D // 34016
@LCL // 34017
A=M // 34018
D=M // 34019
D=D+M // 34020
@SP // 34021
AM=M+1 // 34022
A=A-1 // 34023
M=D // 34024
@LCL // 34025
A=M+1 // 34026
A=A+1 // 34027
D=M // 34028
@SP // 34029
AM=M+1 // 34030
A=A-1 // 34031
M=D // 34032
// call Math.multiply
@7 // 34033
D=A // 34034
@14 // 34035
M=D // 34036
@Math.multiply // 34037
D=A // 34038
@13 // 34039
M=D // 34040
@Math.divide.ret.3 // 34041
D=A // 34042
@CALL // 34043
0;JMP // 34044
(Math.divide.ret.3)
@SP // 34045
AM=M-1 // 34046
D=M // 34047
@SP // 34048
AM=M-1 // 34049
D=M-D // 34050
@SP // 34051
AM=M+1 // 34052
A=A-1 // 34053
M=D // 34054
@LCL // 34055
A=M+1 // 34056
A=A+1 // 34057
D=M // 34058
@SP // 34059
AM=M-1 // 34060
D=M-D // 34061
@DO_LT // 34062
0;JMP // 34063
(Math.divide.LT.130)
@Math.divide$IF_TRUE4 // 34064
D;JNE // 34065

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 34066
0;JMP // 34067

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
@Math.divide.LT.131 // 34068
D=A // 34069
@SP // 34070
AM=M+1 // 34071
A=A-1 // 34072
M=D // 34073
@ARG // 34074
A=M // 34075
D=M // 34076
@DO_LT // 34077
0;JMP // 34078
(Math.divide.LT.131)
@SP // 34079
AM=M+1 // 34080
A=A-1 // 34081
M=D // 34082
@Math.divide.GT.132 // 34083
D=A // 34084
@SP // 34085
AM=M+1 // 34086
A=A-1 // 34087
M=D // 34088
@ARG // 34089
A=M+1 // 34090
D=M // 34091
@DO_GT // 34092
0;JMP // 34093
(Math.divide.GT.132)
@SP // 34094
AM=M-1 // 34095
D=D&M // 34096
@SP // 34097
AM=M+1 // 34098
A=A-1 // 34099
M=D // 34100
@Math.divide.GT.133 // 34101
D=A // 34102
@SP // 34103
AM=M+1 // 34104
A=A-1 // 34105
M=D // 34106
@ARG // 34107
A=M // 34108
D=M // 34109
@DO_GT // 34110
0;JMP // 34111
(Math.divide.GT.133)
@SP // 34112
AM=M+1 // 34113
A=A-1 // 34114
M=D // 34115
@Math.divide.LT.134 // 34116
D=A // 34117
@SP // 34118
AM=M+1 // 34119
A=A-1 // 34120
M=D // 34121
@ARG // 34122
A=M+1 // 34123
D=M // 34124
@DO_LT // 34125
0;JMP // 34126
(Math.divide.LT.134)
@SP // 34127
AM=M-1 // 34128
D=D&M // 34129
@SP // 34130
AM=M-1 // 34131
D=D|M // 34132
@Math.divide$IF_TRUE5 // 34133
D;JNE // 34134

////GotoInstruction{label='Math.divide$IF_END5}
// goto Math.divide$IF_END5
@Math.divide$IF_END5 // 34135
0;JMP // 34136

////LabelInstruction{label='Math.divide$IF_TRUE5}
// label Math.divide$IF_TRUE5
(Math.divide$IF_TRUE5)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 34137
A=M // 34138
D=-M // 34139
@LCL // 34140
A=M // 34141
M=D // 34142

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
@LCL // 34143
A=M // 34144
D=M // 34145
D=D+M // 34146
@SP // 34147
AM=M+1 // 34148
A=A-1 // 34149
M=D // 34150
@RETURN // 34151
0;JMP // 34152

////GotoInstruction{label='Math.divide$IF_END4}
// goto Math.divide$IF_END4
@Math.divide$IF_END4 // 34153
0;JMP // 34154

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
@Math.divide.LT.135 // 34155
D=A // 34156
@SP // 34157
AM=M+1 // 34158
A=A-1 // 34159
M=D // 34160
@ARG // 34161
A=M // 34162
D=M // 34163
@DO_LT // 34164
0;JMP // 34165
(Math.divide.LT.135)
@SP // 34166
AM=M+1 // 34167
A=A-1 // 34168
M=D // 34169
@Math.divide.GT.136 // 34170
D=A // 34171
@SP // 34172
AM=M+1 // 34173
A=A-1 // 34174
M=D // 34175
@ARG // 34176
A=M+1 // 34177
D=M // 34178
@DO_GT // 34179
0;JMP // 34180
(Math.divide.GT.136)
@SP // 34181
AM=M-1 // 34182
D=D&M // 34183
@SP // 34184
AM=M+1 // 34185
A=A-1 // 34186
M=D // 34187
@Math.divide.GT.137 // 34188
D=A // 34189
@SP // 34190
AM=M+1 // 34191
A=A-1 // 34192
M=D // 34193
@ARG // 34194
A=M // 34195
D=M // 34196
@DO_GT // 34197
0;JMP // 34198
(Math.divide.GT.137)
@SP // 34199
AM=M+1 // 34200
A=A-1 // 34201
M=D // 34202
@Math.divide.LT.138 // 34203
D=A // 34204
@SP // 34205
AM=M+1 // 34206
A=A-1 // 34207
M=D // 34208
@ARG // 34209
A=M+1 // 34210
D=M // 34211
@DO_LT // 34212
0;JMP // 34213
(Math.divide.LT.138)
@SP // 34214
AM=M-1 // 34215
D=D&M // 34216
@SP // 34217
AM=M-1 // 34218
D=D|M // 34219
@Math.divide$IF_TRUE6 // 34220
D;JNE // 34221

////GotoInstruction{label='Math.divide$IF_END6}
// goto Math.divide$IF_END6
@Math.divide$IF_END6 // 34222
0;JMP // 34223

////LabelInstruction{label='Math.divide$IF_TRUE6}
// label Math.divide$IF_TRUE6
(Math.divide$IF_TRUE6)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 34224
A=M // 34225
D=-M // 34226
@LCL // 34227
A=M // 34228
M=D // 34229

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
@LCL // 34230
A=M // 34231
D=M // 34232
D=D+M // 34233
D=D+1 // 34234
@SP // 34235
AM=M+1 // 34236
A=A-1 // 34237
M=D // 34238
@RETURN // 34239
0;JMP // 34240

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

@ARG // 34241
A=M // 34242
D=M // 34243
@3 // 34244
M=D // 34245

////PushInstruction("this 2")
@THIS // 34246
A=M+1 // 34247
A=A+1 // 34248
D=M // 34249
@SP // 34250
AM=M+1 // 34251
A=A-1 // 34252
M=D // 34253
@RETURN // 34254
0;JMP // 34255

////FunctionInstruction{functionName='Vec3.dist_sq', numLocals=0, funcMapping={Vec3.do_add=6, Vec3.do_normalize=15, Vec3.do_scale=3, Vec3.dot=13, Vec3.do_sub=6, Vec3.clone=4, Vec3.do_cross=27, Vec3.dispose=4, Vec3.getX=0, Vec3.new=1, Vec3.getY=0, Vec3.getZ=0}}
// function Vec3.dist_sq with 0
(Vec3.dist_sq)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34256
A=M // 34257
D=M // 34258
@3 // 34259
M=D // 34260

////CallGroup{pushes=[PushInstruction("pointer 0"), PushInstruction("pointer 0")], call=CallInstruction{Vec3.dot}}
@2 // 34261
D=A // 34262
@SP // 34263
M=D+M // 34264
@3 // 34265
D=M // 34266
@SP // 34267
A=M-1 // 34268
M=D // 34269
A=A-1 // 34270
M=D // 34271
// call Vec3.dot
@7 // 34272
D=A // 34273
@14 // 34274
M=D // 34275
@Vec3.dot // 34276
D=A // 34277
@13 // 34278
M=D // 34279
@Vec3.dist_sq.ret.0 // 34280
D=A // 34281
@CALL // 34282
0;JMP // 34283
(Vec3.dist_sq.ret.0)
@RETURN // 34284
0;JMP // 34285

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.printInt=4, Output.init=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 34286
D=A // 34287
@SP // 34288
AM=D+M // 34289
A=A-1 // 34290
M=0 // 34291
A=A-1 // 34292
M=0 // 34293
A=A-1 // 34294
M=0 // 34295
A=A-1 // 34296
M=0 // 34297

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 34298
A=M // 34299
D=M // 34300
@SP // 34301
AM=M+1 // 34302
A=A-1 // 34303
M=D // 34304
// call Output.getMap
@6 // 34305
D=A // 34306
@14 // 34307
M=D // 34308
@Output.getMap // 34309
D=A // 34310
@13 // 34311
M=D // 34312
@Output.printChar.ret.0 // 34313
D=A // 34314
@CALL // 34315
0;JMP // 34316
(Output.printChar.ret.0)
@SP // 34317
AM=M-1 // 34318
D=M // 34319
@LCL // 34320
A=M // 34321
M=D // 34322

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 34323
A=M+1 // 34324
A=A+1 // 34325
A=A+1 // 34326
M=0 // 34327

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
@Output.printChar.LT.139 // 34328
D=A // 34329
@SP // 34330
AM=M+1 // 34331
A=A-1 // 34332
M=D // 34333
@LCL // 34334
A=M+1 // 34335
A=A+1 // 34336
A=A+1 // 34337
D=M // 34338
@11 // 34339
D=D-A // 34340
@DO_LT // 34341
0;JMP // 34342
(Output.printChar.LT.139)
D=!D // 34343
@Output.printChar_WHILE_END1 // 34344
D;JNE // 34345

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

@Output.2 // 34346
D=M // 34347
@SP // 34348
AM=M+1 // 34349
A=A-1 // 34350
M=D // 34351
@11 // 34352
D=A // 34353
@SP // 34354
AM=M+1 // 34355
A=A-1 // 34356
M=D // 34357
// call Math.multiply
@7 // 34358
D=A // 34359
@14 // 34360
M=D // 34361
@Math.multiply // 34362
D=A // 34363
@13 // 34364
M=D // 34365
@Output.printChar.ret.1 // 34366
D=A // 34367
@CALL // 34368
0;JMP // 34369
(Output.printChar.ret.1)
@LCL // 34370
A=M+1 // 34371
A=A+1 // 34372
A=A+1 // 34373
D=M // 34374
@SP // 34375
AM=M-1 // 34376
D=D+M // 34377
@SP // 34378
AM=M+1 // 34379
A=A-1 // 34380
M=D // 34381
@32 // 34382
D=A // 34383
@SP // 34384
AM=M+1 // 34385
A=A-1 // 34386
M=D // 34387
// call Math.multiply
@7 // 34388
D=A // 34389
@14 // 34390
M=D // 34391
@Math.multiply // 34392
D=A // 34393
@13 // 34394
M=D // 34395
@Output.printChar.ret.2 // 34396
D=A // 34397
@CALL // 34398
0;JMP // 34399
(Output.printChar.ret.2)
@SP // 34400
AM=M-1 // 34401
D=M // 34402
@16384 // 34403
D=D+A // 34404
@SP // 34405
AM=M+1 // 34406
A=A-1 // 34407
M=D // 34408
@Output.1 // 34409
D=M // 34410
@SP // 34411
AM=M+1 // 34412
A=A-1 // 34413
M=D // 34414
@2 // 34415
D=A // 34416
@SP // 34417
AM=M+1 // 34418
A=A-1 // 34419
M=D // 34420
// call Math.divide
@7 // 34421
D=A // 34422
@14 // 34423
M=D // 34424
@Math.divide // 34425
D=A // 34426
@13 // 34427
M=D // 34428
@Output.printChar.ret.3 // 34429
D=A // 34430
@CALL // 34431
0;JMP // 34432
(Output.printChar.ret.3)
@SP // 34433
AM=M-1 // 34434
D=M // 34435
@SP // 34436
AM=M-1 // 34437
D=D+M // 34438
@LCL // 34439
A=M+1 // 34440
M=D // 34441

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
@Output.printChar.EQ.140 // 34442
D=A // 34443
@SP // 34444
AM=M+1 // 34445
A=A-1 // 34446
M=D // 34447
@Output.1 // 34448
D=M // 34449
@1 // 34450
D=D&A // 34451
@DO_EQ // 34452
0;JMP // 34453
(Output.printChar.EQ.140)
@Output.printChar$IF_TRUE1 // 34454
D;JNE // 34455

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 34456
0;JMP // 34457

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

@LCL // 34458
A=M+1 // 34459
A=A+1 // 34460
A=A+1 // 34461
D=M // 34462
A=A-1 // 34463
A=A-1 // 34464
A=A-1 // 34465
A=D+M // 34466
D=M // 34467
@LCL // 34468
A=M+1 // 34469
A=A+1 // 34470
M=D // 34471

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 34472
0;JMP // 34473

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

@LCL // 34474
A=M+1 // 34475
A=A+1 // 34476
A=A+1 // 34477
D=M // 34478
A=A-1 // 34479
A=A-1 // 34480
A=A-1 // 34481
A=D+M // 34482
D=M // 34483
@SP // 34484
AM=M+1 // 34485
A=A-1 // 34486
M=D // 34487
@256 // 34488
D=A // 34489
@SP // 34490
AM=M+1 // 34491
A=A-1 // 34492
M=D // 34493
// call Math.multiply
@7 // 34494
D=A // 34495
@14 // 34496
M=D // 34497
@Math.multiply // 34498
D=A // 34499
@13 // 34500
M=D // 34501
@Output.printChar.ret.4 // 34502
D=A // 34503
@CALL // 34504
0;JMP // 34505
(Output.printChar.ret.4)
@SP // 34506
AM=M-1 // 34507
D=M // 34508
@LCL // 34509
A=M+1 // 34510
A=A+1 // 34511
M=D // 34512

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
@LCL // 34513
A=M+1 // 34514
D=M // 34515
@0 // 34516
D=D+A // 34517
@SP // 34518
AM=M+1 // 34519
A=A-1 // 34520
M=D // 34521
@LCL // 34522
A=M+1 // 34523
A=M // 34524
D=M // 34525
@SP // 34526
AM=M+1 // 34527
A=A-1 // 34528
M=D // 34529
@LCL // 34530
A=M+1 // 34531
A=A+1 // 34532
D=M // 34533
@SP // 34534
AM=M-1 // 34535
D=D|M // 34536
@SP // 34537
AM=M-1 // 34538
A=M // 34539
M=D // 34540

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

@LCL // 34541
A=M+1 // 34542
A=A+1 // 34543
A=A+1 // 34544
M=M+1 // 34545

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 34546
0;JMP // 34547

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
@Output.printChar.EQ.141 // 34548
D=A // 34549
@SP // 34550
AM=M+1 // 34551
A=A-1 // 34552
M=D // 34553
@Output.1 // 34554
D=M // 34555
@63 // 34556
D=D-A // 34557
@DO_EQ // 34558
0;JMP // 34559
(Output.printChar.EQ.141)
@Output.printChar$IF_TRUE2 // 34560
D;JNE // 34561

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 34562
0;JMP // 34563

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 34564
D=A // 34565
@14 // 34566
M=D // 34567
@Output.println // 34568
D=A // 34569
@13 // 34570
M=D // 34571
@Output.printChar.ret.5 // 34572
D=A // 34573
@CALL // 34574
0;JMP // 34575
(Output.printChar.ret.5)
@SP // 34576
M=M-1 // 34577

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 34578
0;JMP // 34579

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

@Output.1 // 34580
M=M+1 // 34581

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 34582
AM=M+1 // 34583
A=A-1 // 34584
M=0 // 34585
@RETURN // 34586
0;JMP // 34587

////FunctionInstruction{functionName='Int32.dispose', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.u4_array_mul_u4_array=3, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.dispose with 0
(Int32.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34588
A=M // 34589
D=M // 34590
@3 // 34591
M=D // 34592

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

@Int32.0 // 34593
M=M-1 // 34594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 34595
A=M // 34596
D=M // 34597
@SP // 34598
AM=M+1 // 34599
A=A-1 // 34600
M=D // 34601
// call Memory.deAlloc
@6 // 34602
D=A // 34603
@14 // 34604
M=D // 34605
@Memory.deAlloc // 34606
D=A // 34607
@13 // 34608
M=D // 34609
@Int32.dispose.ret.0 // 34610
D=A // 34611
@CALL // 34612
0;JMP // 34613
(Int32.dispose.ret.0)
@SP // 34614
M=M-1 // 34615

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 34616
D=M // 34617
@SP // 34618
AM=M+1 // 34619
A=A-1 // 34620
M=D // 34621
// call Memory.deAlloc
@6 // 34622
D=A // 34623
@14 // 34624
M=D // 34625
@Memory.deAlloc // 34626
D=A // 34627
@13 // 34628
M=D // 34629
@Int32.dispose.ret.1 // 34630
D=A // 34631
@CALL // 34632
0;JMP // 34633
(Int32.dispose.ret.1)
@SP // 34634
M=M-1 // 34635

////PushInstruction("constant 0")
@SP // 34636
AM=M+1 // 34637
A=A-1 // 34638
M=0 // 34639
@RETURN // 34640
0;JMP // 34641

////FunctionInstruction{functionName='Element.sphere', numLocals=0, funcMapping={Element.surface_normal=2, Element.intersect=2, Element.plane=1, Element.color=2}}
// function Element.sphere with 0
(Element.sphere)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@2 // 34642
D=A // 34643
@SP // 34644
AM=M+1 // 34645
A=A-1 // 34646
M=D // 34647
// call Memory.alloc
@6 // 34648
D=A // 34649
@14 // 34650
M=D // 34651
@Memory.alloc // 34652
D=A // 34653
@13 // 34654
M=D // 34655
@Element.sphere.ret.0 // 34656
D=A // 34657
@CALL // 34658
0;JMP // 34659
(Element.sphere.ret.0)
@SP // 34660
AM=M-1 // 34661
D=M // 34662
@3 // 34663
M=D // 34664

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 1}
//}

@ARG // 34665
A=M // 34666
D=M // 34667
@THIS // 34668
A=M+1 // 34669
M=D // 34670

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 34671
A=M // 34672
M=0 // 34673

////PushInstruction("pointer 0")
@3 // 34674
D=M // 34675
@SP // 34676
AM=M+1 // 34677
A=A-1 // 34678
M=D // 34679
@RETURN // 34680
0;JMP // 34681

////FunctionInstruction{functionName='Int32.is_zero', numLocals=0, funcMapping={Int32.do_div=1, Int32.do_neg=0, Int32.initial_sqrt_guess=13, Int32.do_sqrt=16, Int32.u4_array_div_u4_array=25, Int32.do_zero=0, Int32.new_from_parts=1, Int32.do_mul=1, Int32.nlz_u4=1, Int32.is_positive=1, Int32.do_sub=4, Int32.is_even=0, Int32.new=3, Int32.getParts=0, Int32.u4_array_mul_u4_array=3, Int32.clone=2, Int32.do_left_shift_bytes=0, Int32.do_abs=2, Int32.do_right_shift_bytes=3, Int32.arith_rightshift=2, Int32.do_mul_right_shift_bytes=24, Int32.xor=0, Int32.do_add=1, Int32.dispose=2, Int32.cmp=5, Int32.do_left_shift_bytes_div=26, Int32.is_negative=0, Int32.leftshift=0, Int32.initialize=1}}
// function Int32.is_zero with 0
(Int32.is_zero)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34682
A=M // 34683
D=M // 34684
@3 // 34685
M=D // 34686

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
@Int32.is_zero.EQ.142 // 34687
D=A // 34688
@SP // 34689
AM=M+1 // 34690
A=A-1 // 34691
M=D // 34692
@THIS // 34693
A=M // 34694
A=M // 34695
D=M // 34696
@DO_EQ // 34697
0;JMP // 34698
(Int32.is_zero.EQ.142)
@SP // 34699
AM=M+1 // 34700
A=A-1 // 34701
M=D // 34702
@Int32.is_zero.EQ.143 // 34703
D=A // 34704
@SP // 34705
AM=M+1 // 34706
A=A-1 // 34707
M=D // 34708
@THIS // 34709
A=M // 34710
A=M+1 // 34711
D=M // 34712
@DO_EQ // 34713
0;JMP // 34714
(Int32.is_zero.EQ.143)
@SP // 34715
AM=M-1 // 34716
D=D&M // 34717
@SP // 34718
AM=M+1 // 34719
A=A-1 // 34720
M=D // 34721
@Int32.is_zero.EQ.144 // 34722
D=A // 34723
@SP // 34724
AM=M+1 // 34725
A=A-1 // 34726
M=D // 34727
@THIS // 34728
A=M // 34729
D=M // 34730
@THIS // 34731
A=M // 34732
D=M // 34733
@2 // 34734
D=D+A // 34735
A=D // 34736
D=M // 34737
@DO_EQ // 34738
0;JMP // 34739
(Int32.is_zero.EQ.144)
@SP // 34740
AM=M-1 // 34741
D=D&M // 34742
@SP // 34743
AM=M+1 // 34744
A=A-1 // 34745
M=D // 34746
@Int32.is_zero.EQ.145 // 34747
D=A // 34748
@SP // 34749
AM=M+1 // 34750
A=A-1 // 34751
M=D // 34752
@THIS // 34753
A=M // 34754
D=M // 34755
@THIS // 34756
A=M // 34757
D=M // 34758
@3 // 34759
D=D+A // 34760
A=D // 34761
D=M // 34762
@DO_EQ // 34763
0;JMP // 34764
(Int32.is_zero.EQ.145)
@SP // 34765
AM=M-1 // 34766
D=D&M // 34767
@SP // 34768
AM=M+1 // 34769
A=A-1 // 34770
M=D // 34771
@RETURN // 34772
0;JMP // 34773

////FunctionInstruction{functionName='Sphere.surface_normal', numLocals=1, funcMapping={Sphere.new=1, Sphere.intersect=39, Sphere.color=1, Sphere.dispose=4}}
// function Sphere.surface_normal with 1
(Sphere.surface_normal)
@SP // 34774
AM=M+1 // 34775
A=A-1 // 34776
M=0 // 34777

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34778
A=M // 34779
D=M // 34780
@3 // 34781
M=D // 34782

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Vec3.clone}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 34783
A=M+1 // 34784
D=M // 34785
@SP // 34786
AM=M+1 // 34787
A=A-1 // 34788
M=D // 34789
// call Vec3.clone
@6 // 34790
D=A // 34791
@14 // 34792
M=D // 34793
@Vec3.clone // 34794
D=A // 34795
@13 // 34796
M=D // 34797
@Sphere.surface_normal.ret.0 // 34798
D=A // 34799
@CALL // 34800
0;JMP // 34801
(Sphere.surface_normal.ret.0)
@SP // 34802
AM=M-1 // 34803
D=M // 34804
@LCL // 34805
A=M // 34806
M=D // 34807

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("this 0")], call=CallInstruction{Vec3.do_sub}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 34808
A=M // 34809
D=M // 34810
@SP // 34811
AM=M+1 // 34812
A=A-1 // 34813
M=D // 34814
@THIS // 34815
A=M // 34816
D=M // 34817
@SP // 34818
AM=M+1 // 34819
A=A-1 // 34820
M=D // 34821
// call Vec3.do_sub
@7 // 34822
D=A // 34823
@14 // 34824
M=D // 34825
@Vec3.do_sub // 34826
D=A // 34827
@13 // 34828
M=D // 34829
@Sphere.surface_normal.ret.1 // 34830
D=A // 34831
@CALL // 34832
0;JMP // 34833
(Sphere.surface_normal.ret.1)
@SP // 34834
M=M-1 // 34835

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Vec3.do_normalize}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 34836
A=M // 34837
D=M // 34838
@SP // 34839
AM=M+1 // 34840
A=A-1 // 34841
M=D // 34842
// call Vec3.do_normalize
@6 // 34843
D=A // 34844
@14 // 34845
M=D // 34846
@Vec3.do_normalize // 34847
D=A // 34848
@13 // 34849
M=D // 34850
@Sphere.surface_normal.ret.2 // 34851
D=A // 34852
@CALL // 34853
0;JMP // 34854
(Sphere.surface_normal.ret.2)
@SP // 34855
M=M-1 // 34856

////PushInstruction("local 0")
@LCL // 34857
A=M // 34858
D=M // 34859
@SP // 34860
AM=M+1 // 34861
A=A-1 // 34862
M=D // 34863
@RETURN // 34864
0;JMP // 34865

////FunctionInstruction{functionName='Number.new', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2, Number.is_positive=1}}
// function Number.new with 0
(Number.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 1")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@SP // 34866
AM=M+1 // 34867
A=A-1 // 34868
M=1 // 34869
// call Memory.alloc
@6 // 34870
D=A // 34871
@14 // 34872
M=D // 34873
@Memory.alloc // 34874
D=A // 34875
@13 // 34876
M=D // 34877
@Number.new.ret.0 // 34878
D=A // 34879
@CALL // 34880
0;JMP // 34881
(Number.new.ret.0)
@SP // 34882
AM=M-1 // 34883
D=M // 34884
@3 // 34885
M=D // 34886

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

@Number.5 // 34887
M=M+1 // 34888

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Int32.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 34889
A=M // 34890
D=M // 34891
@SP // 34892
AM=M+1 // 34893
A=A-1 // 34894
M=D // 34895
// call Int32.new
@6 // 34896
D=A // 34897
@14 // 34898
M=D // 34899
@Int32.new // 34900
D=A // 34901
@13 // 34902
M=D // 34903
@Number.new.ret.1 // 34904
D=A // 34905
@CALL // 34906
0;JMP // 34907
(Number.new.ret.1)
@SP // 34908
AM=M-1 // 34909
D=M // 34910
@THIS // 34911
A=M // 34912
M=D // 34913

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("constant 2")], call=CallInstruction{Int32.do_left_shift_bytes}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 34914
A=M // 34915
D=M // 34916
@SP // 34917
AM=M+1 // 34918
A=A-1 // 34919
M=D // 34920
@2 // 34921
D=A // 34922
@SP // 34923
AM=M+1 // 34924
A=A-1 // 34925
M=D // 34926
// call Int32.do_left_shift_bytes
@7 // 34927
D=A // 34928
@14 // 34929
M=D // 34930
@Int32.do_left_shift_bytes // 34931
D=A // 34932
@13 // 34933
M=D // 34934
@Number.new.ret.2 // 34935
D=A // 34936
@CALL // 34937
0;JMP // 34938
(Number.new.ret.2)
@SP // 34939
M=M-1 // 34940

////PushInstruction("pointer 0")
@3 // 34941
D=M // 34942
@SP // 34943
AM=M+1 // 34944
A=A-1 // 34945
M=D // 34946
@RETURN // 34947
0;JMP // 34948

////FunctionInstruction{functionName='Element.dispose', numLocals=0, funcMapping={Element.surface_normal=2, Element.intersect=2, Element.sphere=1, Element.plane=1, Element.color=2}}
// function Element.dispose with 0
(Element.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 34949
A=M // 34950
D=M // 34951
@3 // 34952
M=D // 34953

////ConditionalGroup{push=PushInstruction("this 0"), ifGoto=IfGotoInstruction{label='Element.dispose$IF_TRUE1}}
@THIS // 34954
A=M // 34955
D=M // 34956
@Element.dispose$IF_TRUE1 // 34957
D;JNE // 34958

////GotoInstruction{label='Element.dispose$IF_END1}
// goto Element.dispose$IF_END1
@Element.dispose$IF_END1 // 34959
0;JMP // 34960

////LabelInstruction{label='Element.dispose$IF_TRUE1}
// label Element.dispose$IF_TRUE1
(Element.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Plane.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 34961
A=M // 34962
D=M // 34963
@SP // 34964
AM=M+1 // 34965
A=A-1 // 34966
M=D // 34967
// call Plane.dispose
@6 // 34968
D=A // 34969
@14 // 34970
M=D // 34971
@Plane.dispose // 34972
D=A // 34973
@13 // 34974
M=D // 34975
@Element.dispose.ret.0 // 34976
D=A // 34977
@CALL // 34978
0;JMP // 34979
(Element.dispose.ret.0)
@SP // 34980
M=M-1 // 34981

////LabelInstruction{label='Element.dispose$IF_END1}
// label Element.dispose$IF_END1
(Element.dispose$IF_END1)

////ConditionalGroup{push=PushInstruction("this 1"), ifGoto=IfGotoInstruction{label='Element.dispose$IF_TRUE2}}
@THIS // 34982
A=M+1 // 34983
D=M // 34984
@Element.dispose$IF_TRUE2 // 34985
D;JNE // 34986

////GotoInstruction{label='Element.dispose$IF_END2}
// goto Element.dispose$IF_END2
@Element.dispose$IF_END2 // 34987
0;JMP // 34988

////LabelInstruction{label='Element.dispose$IF_TRUE2}
// label Element.dispose$IF_TRUE2
(Element.dispose$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 1")], call=CallInstruction{Sphere.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 34989
A=M+1 // 34990
D=M // 34991
@SP // 34992
AM=M+1 // 34993
A=A-1 // 34994
M=D // 34995
// call Sphere.dispose
@6 // 34996
D=A // 34997
@14 // 34998
M=D // 34999
@Sphere.dispose // 35000
D=A // 35001
@13 // 35002
M=D // 35003
@Element.dispose.ret.1 // 35004
D=A // 35005
@CALL // 35006
0;JMP // 35007
(Element.dispose.ret.1)
@SP // 35008
M=M-1 // 35009

////LabelInstruction{label='Element.dispose$IF_END2}
// label Element.dispose$IF_END2
(Element.dispose$IF_END2)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 35010
D=M // 35011
@SP // 35012
AM=M+1 // 35013
A=A-1 // 35014
M=D // 35015
// call Memory.deAlloc
@6 // 35016
D=A // 35017
@14 // 35018
M=D // 35019
@Memory.deAlloc // 35020
D=A // 35021
@13 // 35022
M=D // 35023
@Element.dispose.ret.2 // 35024
D=A // 35025
@CALL // 35026
0;JMP // 35027
(Element.dispose.ret.2)
@SP // 35028
M=M-1 // 35029

////PushInstruction("constant 0")
@SP // 35030
AM=M+1 // 35031
A=A-1 // 35032
M=0 // 35033
@RETURN // 35034
0;JMP // 35035

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.add_node=0, Memory.alloc=11, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 35036
M=M+1 // 35037
AM=M+1 // 35038
A=A-1 // 35039
M=0 // 35040
A=A-1 // 35041
M=0 // 35042

////PushPopPair {
//  push: PushInstruction("constant 2055")
//  pop:  PopInstruction{address=local 0}
//}

@2055 // 35043
D=A // 35044
@LCL // 35045
A=M // 35046
M=D // 35047

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
@LCL // 35048
A=M // 35049
D=M // 35050
@0 // 35051
D=D+A // 35052
@SP // 35053
AM=M+1 // 35054
A=A-1 // 35055
M=D // 35056
@LCL // 35057
A=M // 35058
D=M // 35059
@16384 // 35060
D=A-D // 35061
@5 // 35062
D=D-A // 35063
@SP // 35064
AM=M-1 // 35065
A=M // 35066
M=D // 35067

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 35068
A=M // 35069
D=M // 35070
D=D+1 // 35071
@SP // 35072
AM=M+1 // 35073
A=A-1 // 35074
M=D // 35075
D=1 // 35076
@SP // 35077
AM=M-1 // 35078
A=M // 35079
M=D // 35080

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 35081
A=M // 35082
D=M // 35083
@2 // 35084
D=D+A // 35085
@SP // 35086
AM=M+1 // 35087
A=A-1 // 35088
M=D // 35089
D=0 // 35090
@SP // 35091
AM=M-1 // 35092
A=M // 35093
M=D // 35094

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 35095
A=M // 35096
D=M // 35097
@3 // 35098
D=D+A // 35099
@SP // 35100
AM=M+1 // 35101
A=A-1 // 35102
M=D // 35103
D=0 // 35104
@SP // 35105
AM=M-1 // 35106
A=M // 35107
M=D // 35108

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 35109
A=M // 35110
D=M // 35111
@SP // 35112
AM=M+1 // 35113
A=A-1 // 35114
M=D // 35115
// call Memory.create_foot
@6 // 35116
D=A // 35117
@14 // 35118
M=D // 35119
@Memory.create_foot // 35120
D=A // 35121
@13 // 35122
M=D // 35123
@Memory.init.ret.0 // 35124
D=A // 35125
@CALL // 35126
0;JMP // 35127
(Memory.init.ret.0)
@SP // 35128
M=M-1 // 35129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2054"), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 35130
D=A // 35131
@SP // 35132
AM=M+1 // 35133
A=A-1 // 35134
M=D // 35135
@LCL // 35136
A=M // 35137
D=M // 35138
@SP // 35139
AM=M+1 // 35140
A=A-1 // 35141
M=D // 35142
// call Memory.add_node
@7 // 35143
D=A // 35144
@14 // 35145
M=D // 35146
@Memory.add_node // 35147
D=A // 35148
@13 // 35149
M=D // 35150
@Memory.init.ret.1 // 35151
D=A // 35152
@CALL // 35153
0;JMP // 35154
(Memory.init.ret.1)
@SP // 35155
M=M-1 // 35156

////PushInstruction("constant 0")
@SP // 35157
AM=M+1 // 35158
A=A-1 // 35159
M=0 // 35160
@RETURN // 35161
0;JMP // 35162

////FunctionInstruction{functionName='Number.getPi', numLocals=0, funcMapping={Number.cmp=2, Number.frac_to_i16=6, Number.initialize=17, Number.clone=2, Number.do_div=5, Number.getV=0, Number.dispose=2, Number.is_negative=1, Number.do_neg=1, Number.is_zero=1, Number.new_from_int32=1, Number.do_sqrt=3, Number.do_mul=5, Number.do_add=2, Number.new=3, Number.is_less_than=2, Number.do_sub=2, Number.new_from_int_frac=3, Number.to_int32=2, Number.is_positive=1}}
// function Number.getPi with 0
(Number.getPi)

////PushInstruction("static 3")
@Number.3 // 35163
D=M // 35164
@SP // 35165
AM=M+1 // 35166
A=A-1 // 35167
M=D // 35168
@RETURN // 35169
0;JMP // 35170

