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
////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 131
AM=M+1 // 132
A=A-1 // 133
M=0 // 134

////PushPopPair {
//  push: PushInstruction("constant 8000")
//  pop:  PopInstruction{address=local 0}
//}

@8000 // 135
D=A // 136
@LCL // 137
A=M // 138
M=D // 139

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 2"), PushInstruction("constant 3")], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 140
A=M // 141
D=M // 142
@SP // 143
AM=M+1 // 144
A=A-1 // 145
M=D // 146
@2 // 147
D=A // 148
@SP // 149
AM=M+1 // 150
A=A-1 // 151
M=D // 152
@3 // 153
D=A // 154
@SP // 155
AM=M+1 // 156
A=A-1 // 157
M=D // 158
// call Math.multiply
@7 // 159
D=A // 160
@14 // 161
M=D // 162
@Math.multiply // 163
D=A // 164
@13 // 165
M=D // 166
@Main.main.ret.0 // 167
D=A // 168
@CALL // 169
0;JMP // 170
(Main.main.ret.0)
@SP // 171
AM=M-1 // 172
D=M // 173
@SP // 174
AM=M-1 // 175
A=M // 176
M=D // 177

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 0"),
//            binaryOp: "ADD"
//        )
//), UnaryPushGroup(    PushInstruction("constant 30"),
//NEG)], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 178
A=M // 179
D=M // 180
@SP // 181
AM=M+1 // 182
A=A-1 // 183
M=D+1 // 184
@LCL // 185
A=M // 186
D=M // 187
@0 // 188
A=D+A // 189
D=M // 190
@SP // 191
AM=M+1 // 192
A=A-1 // 193
M=D // 194
@30 // 195
D=-A // 196
@SP // 197
AM=M+1 // 198
A=A-1 // 199
M=D // 200
// call Math.multiply
@7 // 201
D=A // 202
@14 // 203
M=D // 204
@Math.multiply // 205
D=A // 206
@13 // 207
M=D // 208
@Main.main.ret.1 // 209
D=A // 210
@CALL // 211
0;JMP // 212
(Main.main.ret.1)
@SP // 213
AM=M-1 // 214
D=M // 215
@SP // 216
AM=M-1 // 217
A=M // 218
M=D // 219

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 1"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 100")], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 220
A=M // 221
D=M // 222
@2 // 223
D=D+A // 224
@SP // 225
AM=M+1 // 226
A=A-1 // 227
M=D // 228
@LCL // 229
A=M // 230
D=M // 231
A=D+1 // 232
D=M // 233
@SP // 234
AM=M+1 // 235
A=A-1 // 236
M=D // 237
@100 // 238
D=A // 239
@SP // 240
AM=M+1 // 241
A=A-1 // 242
M=D // 243
// call Math.multiply
@7 // 244
D=A // 245
@14 // 246
M=D // 247
@Math.multiply // 248
D=A // 249
@13 // 250
M=D // 251
@Main.main.ret.2 // 252
D=A // 253
@CALL // 254
0;JMP // 255
(Main.main.ret.2)
@SP // 256
AM=M-1 // 257
D=M // 258
@SP // 259
AM=M-1 // 260
A=M // 261
M=D // 262

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 1"), Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 2"),
//            binaryOp: "ADD"
//        )
//)], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 263
A=M // 264
D=M // 265
@3 // 266
D=D+A // 267
@SP // 268
AM=M+1 // 269
A=A-1 // 270
M=D // 271
@SP // 272
AM=M+1 // 273
A=A-1 // 274
M=1 // 275
@LCL // 276
A=M // 277
D=M // 278
@2 // 279
A=D+A // 280
D=M // 281
@SP // 282
AM=M+1 // 283
A=A-1 // 284
M=D // 285
@LCL // 286
A=M // 287
D=M // 288
@2 // 289
A=D+A // 290
D=M // 291
@SP // 292
AM=M+1 // 293
A=A-1 // 294
M=D // 295
// call Math.multiply
@7 // 296
D=A // 297
@14 // 298
M=D // 299
@Math.multiply // 300
D=A // 301
@13 // 302
M=D // 303
@Main.main.ret.3 // 304
D=A // 305
@CALL // 306
0;JMP // 307
(Main.main.ret.3)
@SP // 308
AM=M-1 // 309
D=M // 310
@SP // 311
AM=M-1 // 312
A=M // 313
M=D // 314

////PushWriter{source=CallGroup{pushes=[Dereference(
//    base:
//        BinaryPushGroup(
//            left:
//                PushInstruction("local 0"),
//            right:
//                PushInstruction("constant 3"),
//            binaryOp: "ADD"
//        )
//), PushInstruction("constant 0")], call=CallInstruction{Math.multiply}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 315
A=M // 316
D=M // 317
@4 // 318
D=D+A // 319
@SP // 320
AM=M+1 // 321
A=A-1 // 322
M=D // 323
@LCL // 324
A=M // 325
D=M // 326
@3 // 327
A=D+A // 328
D=M // 329
@SP // 330
AM=M+1 // 331
A=A-1 // 332
M=D // 333
@LCL // 334
A=M // 335
D=M // 336
@3 // 337
A=D+A // 338
D=M // 339
@SP // 340
AM=M+1 // 341
A=A-1 // 342
M=D // 343
@SP // 344
AM=M+1 // 345
A=A-1 // 346
M=0 // 347
// call Math.multiply
@7 // 348
D=A // 349
@14 // 350
M=D // 351
@Math.multiply // 352
D=A // 353
@13 // 354
M=D // 355
@Main.main.ret.4 // 356
D=A // 357
@CALL // 358
0;JMP // 359
(Main.main.ret.4)
@SP // 360
AM=M-1 // 361
D=M // 362
@SP // 363
AM=M-1 // 364
A=M // 365
M=D // 366

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 9"), PushInstruction("constant 3")], call=CallInstruction{Math.divide}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 367
A=M // 368
D=M // 369
@5 // 370
D=D+A // 371
@SP // 372
AM=M+1 // 373
A=A-1 // 374
M=D // 375
@9 // 376
D=A // 377
@SP // 378
AM=M+1 // 379
A=A-1 // 380
M=D // 381
@3 // 382
D=A // 383
@SP // 384
AM=M+1 // 385
A=A-1 // 386
M=D // 387
// call Math.divide
@7 // 388
D=A // 389
@14 // 390
M=D // 391
@Math.divide // 392
D=A // 393
@13 // 394
M=D // 395
@Main.main.ret.5 // 396
D=A // 397
@CALL // 398
0;JMP // 399
(Main.main.ret.5)
@SP // 400
AM=M-1 // 401
D=M // 402
@SP // 403
AM=M-1 // 404
A=M // 405
M=D // 406

////PushWriter{source=CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 18000"),
//NEG), PushInstruction("constant 6")], call=CallInstruction{Math.divide}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 407
A=M // 408
D=M // 409
@6 // 410
D=D+A // 411
@SP // 412
AM=M+1 // 413
A=A-1 // 414
M=D // 415
@18000 // 416
D=-A // 417
@SP // 418
AM=M+1 // 419
A=A-1 // 420
M=D // 421
@6 // 422
D=A // 423
@SP // 424
AM=M+1 // 425
A=A-1 // 426
M=D // 427
// call Math.divide
@7 // 428
D=A // 429
@14 // 430
M=D // 431
@Math.divide // 432
D=A // 433
@13 // 434
M=D // 435
@Main.main.ret.6 // 436
D=A // 437
@CALL // 438
0;JMP // 439
(Main.main.ret.6)
@SP // 440
AM=M-1 // 441
D=M // 442
@SP // 443
AM=M-1 // 444
A=M // 445
M=D // 446

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 32766"), UnaryPushGroup(    PushInstruction("constant 32767"),
//NEG)], call=CallInstruction{Math.divide}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 447
A=M // 448
D=M // 449
@7 // 450
D=D+A // 451
@SP // 452
AM=M+1 // 453
A=A-1 // 454
M=D // 455
@32766 // 456
D=A // 457
@SP // 458
AM=M+1 // 459
A=A-1 // 460
M=D // 461
@32767 // 462
D=-A // 463
@SP // 464
AM=M+1 // 465
A=A-1 // 466
M=D // 467
// call Math.divide
@7 // 468
D=A // 469
@14 // 470
M=D // 471
@Math.divide // 472
D=A // 473
@13 // 474
M=D // 475
@Main.main.ret.7 // 476
D=A // 477
@CALL // 478
0;JMP // 479
(Main.main.ret.7)
@SP // 480
AM=M-1 // 481
D=M // 482
@SP // 483
AM=M-1 // 484
A=M // 485
M=D // 486

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 9")], call=CallInstruction{Math.sqrt}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 487
A=M // 488
D=M // 489
@8 // 490
D=D+A // 491
@SP // 492
AM=M+1 // 493
A=A-1 // 494
M=D // 495
@9 // 496
D=A // 497
@SP // 498
AM=M+1 // 499
A=A-1 // 500
M=D // 501
// call Math.sqrt
@6 // 502
D=A // 503
@14 // 504
M=D // 505
@Math.sqrt // 506
D=A // 507
@13 // 508
M=D // 509
@Main.main.ret.8 // 510
D=A // 511
@CALL // 512
0;JMP // 513
(Main.main.ret.8)
@SP // 514
AM=M-1 // 515
D=M // 516
@SP // 517
AM=M-1 // 518
A=M // 519
M=D // 520

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 32767")], call=CallInstruction{Math.sqrt}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 521
A=M // 522
D=M // 523
@9 // 524
D=D+A // 525
@SP // 526
AM=M+1 // 527
A=A-1 // 528
M=D // 529
@32767 // 530
D=A // 531
@SP // 532
AM=M+1 // 533
A=A-1 // 534
M=D // 535
// call Math.sqrt
@6 // 536
D=A // 537
@14 // 538
M=D // 539
@Math.sqrt // 540
D=A // 541
@13 // 542
M=D // 543
@Main.main.ret.9 // 544
D=A // 545
@CALL // 546
0;JMP // 547
(Main.main.ret.9)
@SP // 548
AM=M-1 // 549
D=M // 550
@SP // 551
AM=M-1 // 552
A=M // 553
M=D // 554

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 123")], call=CallInstruction{Math.min}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 555
A=M // 556
D=M // 557
@10 // 558
D=D+A // 559
@SP // 560
AM=M+1 // 561
A=A-1 // 562
M=D // 563
@345 // 564
D=A // 565
@SP // 566
AM=M+1 // 567
A=A-1 // 568
M=D // 569
@123 // 570
D=A // 571
@SP // 572
AM=M+1 // 573
A=A-1 // 574
M=D // 575
// call Math.min
@7 // 576
D=A // 577
@14 // 578
M=D // 579
@Math.min // 580
D=A // 581
@13 // 582
M=D // 583
@Main.main.ret.10 // 584
D=A // 585
@CALL // 586
0;JMP // 587
(Main.main.ret.10)
@SP // 588
AM=M-1 // 589
D=M // 590
@SP // 591
AM=M-1 // 592
A=M // 593
M=D // 594

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 123"), UnaryPushGroup(    PushInstruction("constant 345"),
//NEG)], call=CallInstruction{Math.max}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 11"),
//    binaryOp: "ADD"
//)}
@LCL // 595
A=M // 596
D=M // 597
@11 // 598
D=D+A // 599
@SP // 600
AM=M+1 // 601
A=A-1 // 602
M=D // 603
@123 // 604
D=A // 605
@SP // 606
AM=M+1 // 607
A=A-1 // 608
M=D // 609
@345 // 610
D=-A // 611
@SP // 612
AM=M+1 // 613
A=A-1 // 614
M=D // 615
// call Math.max
@7 // 616
D=A // 617
@14 // 618
M=D // 619
@Math.max // 620
D=A // 621
@13 // 622
M=D // 623
@Main.main.ret.11 // 624
D=A // 625
@CALL // 626
0;JMP // 627
(Main.main.ret.11)
@SP // 628
AM=M-1 // 629
D=M // 630
@SP // 631
AM=M-1 // 632
A=M // 633
M=D // 634

////PushWriter{source=CallGroup{pushes=[PushInstruction("constant 27")], call=CallInstruction{Math.abs}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 12"),
//    binaryOp: "ADD"
//)}
@LCL // 635
A=M // 636
D=M // 637
@12 // 638
D=D+A // 639
@SP // 640
AM=M+1 // 641
A=A-1 // 642
M=D // 643
@27 // 644
D=A // 645
@SP // 646
AM=M+1 // 647
A=A-1 // 648
M=D // 649
// call Math.abs
@6 // 650
D=A // 651
@14 // 652
M=D // 653
@Math.abs // 654
D=A // 655
@13 // 656
M=D // 657
@Main.main.ret.12 // 658
D=A // 659
@CALL // 660
0;JMP // 661
(Main.main.ret.12)
@SP // 662
AM=M-1 // 663
D=M // 664
@SP // 665
AM=M-1 // 666
A=M // 667
M=D // 668

////PushWriter{source=CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 32767"),
//NEG)], call=CallInstruction{Math.abs}}, dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 13"),
//    binaryOp: "ADD"
//)}
@LCL // 669
A=M // 670
D=M // 671
@13 // 672
D=D+A // 673
@SP // 674
AM=M+1 // 675
A=A-1 // 676
M=D // 677
@32767 // 678
D=-A // 679
@SP // 680
AM=M+1 // 681
A=A-1 // 682
M=D // 683
// call Math.abs
@6 // 684
D=A // 685
@14 // 686
M=D // 687
@Math.abs // 688
D=A // 689
@13 // 690
M=D // 691
@Main.main.ret.13 // 692
D=A // 693
@CALL // 694
0;JMP // 695
(Main.main.ret.13)
@SP // 696
AM=M-1 // 697
D=M // 698
@SP // 699
AM=M-1 // 700
A=M // 701
M=D // 702

////PushInstruction("constant 0")
@SP // 703
AM=M+1 // 704
A=A-1 // 705
M=0 // 706
@RETURN // 707
0;JMP // 708

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={}}
// function Math.init with 2
(Math.init)
@SP // 709
M=M+1 // 710
AM=M+1 // 711
A=A-1 // 712
M=0 // 713
A=A-1 // 714
M=0 // 715

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 716
A=M // 717
M=1 // 718

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 719
A=M+1 // 720
M=0 // 721

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 722
D=A // 723
@SP // 724
AM=M+1 // 725
A=A-1 // 726
M=D // 727
// call Array.new
@6 // 728
D=A // 729
@14 // 730
M=D // 731
@Array.new // 732
D=A // 733
@13 // 734
M=D // 735
@Math.init.ret.0 // 736
D=A // 737
@CALL // 738
0;JMP // 739
(Math.init.ret.0)
@SP // 740
AM=M-1 // 741
D=M // 742
@Math.0 // 743
M=D // 744

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
@Math.init.LT.0 // 745
D=A // 746
@SP // 747
AM=M+1 // 748
A=A-1 // 749
M=D // 750
@LCL // 751
A=M+1 // 752
D=M // 753
@16 // 754
D=D-A // 755
@DO_LT // 756
0;JMP // 757
(Math.init.LT.0)
D=!D // 758
@WHILE_END_Math.init1 // 759
D;JNE // 760

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 761
D=M // 762
@SP // 763
AM=M+1 // 764
A=A-1 // 765
M=D // 766
@LCL // 767
A=M+1 // 768
D=M // 769
@SP // 770
AM=M-1 // 771
D=D+M // 772
@SP // 773
AM=M+1 // 774
A=A-1 // 775
M=D // 776
@LCL // 777
A=M // 778
D=M // 779
@SP // 780
AM=M-1 // 781
A=M // 782
M=D // 783

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

@LCL // 784
A=M // 785
D=M // 786
@LCL // 787
A=M // 788
M=D+M // 789

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

@LCL // 790
A=M+1 // 791
M=M+1 // 792

////GotoInstruction{label='WHILE_START_Math.init1}
// goto WHILE_START_Math.init1
@WHILE_START_Math.init1 // 793
0;JMP // 794

////LabelInstruction{label='WHILE_END_Math.init1}
// label WHILE_END_Math.init1
(WHILE_END_Math.init1)

////PushInstruction("constant 0")
@SP // 795
AM=M+1 // 796
A=A-1 // 797
M=0 // 798
@RETURN // 799
0;JMP // 800

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
@ARG // 801
A=M // 802
D=M // 803
@SP // 804
AM=M+1 // 805
A=A-1 // 806
M=D // 807
@Math.0 // 808
D=M // 809
@SP // 810
AM=M+1 // 811
A=A-1 // 812
M=D // 813
@ARG // 814
A=M+1 // 815
D=M // 816
@SP // 817
AM=M-1 // 818
A=D+M // 819
D=M // 820
@SP // 821
AM=M-1 // 822
D=D&M // 823
@SP // 824
AM=M+1 // 825
A=A-1 // 826
M=D // 827
@RETURN // 828
0;JMP // 829

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 830
D=A // 831
@SP // 832
AM=D+M // 833
A=A-1 // 834
M=0 // 835
A=A-1 // 836
M=0 // 837
A=A-1 // 838
M=0 // 839

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
@Math.multiply.EQ.1 // 840
D=A // 841
@SP // 842
AM=M+1 // 843
A=A-1 // 844
M=D // 845
@ARG // 846
A=M // 847
D=M // 848
@DO_EQ // 849
0;JMP // 850
(Math.multiply.EQ.1)
@SP // 851
AM=M+1 // 852
A=A-1 // 853
M=D // 854
@Math.multiply.EQ.2 // 855
D=A // 856
@SP // 857
AM=M+1 // 858
A=A-1 // 859
M=D // 860
@ARG // 861
A=M+1 // 862
D=M // 863
@DO_EQ // 864
0;JMP // 865
(Math.multiply.EQ.2)
@SP // 866
AM=M-1 // 867
D=D|M // 868
D=!D // 869
@Math.multiply.IfElseEND1 // 870
D;JNE // 871

////PushInstruction("constant 0")
@SP // 872
AM=M+1 // 873
A=A-1 // 874
M=0 // 875
@RETURN // 876
0;JMP // 877

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
@Math.multiply.EQ.3 // 878
D=A // 879
@SP // 880
AM=M+1 // 881
A=A-1 // 882
M=D // 883
@ARG // 884
A=M // 885
D=M // 886
D=D-1 // 887
@DO_EQ // 888
0;JMP // 889
(Math.multiply.EQ.3)
D=!D // 890
@Math.multiply.IfElseEND2 // 891
D;JNE // 892

////PushInstruction("argument 1")
@ARG // 893
A=M+1 // 894
D=M // 895
@SP // 896
AM=M+1 // 897
A=A-1 // 898
M=D // 899
@RETURN // 900
0;JMP // 901

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
@Math.multiply.EQ.4 // 902
D=A // 903
@SP // 904
AM=M+1 // 905
A=A-1 // 906
M=D // 907
@ARG // 908
A=M+1 // 909
D=M // 910
D=D-1 // 911
@DO_EQ // 912
0;JMP // 913
(Math.multiply.EQ.4)
D=!D // 914
@Math.multiply.IfElseEND3 // 915
D;JNE // 916

////PushInstruction("argument 0")
@ARG // 917
A=M // 918
D=M // 919
@SP // 920
AM=M+1 // 921
A=A-1 // 922
M=D // 923
@RETURN // 924
0;JMP // 925

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
@Math.multiply.EQ.5 // 926
D=A // 927
@SP // 928
AM=M+1 // 929
A=A-1 // 930
M=D // 931
@ARG // 932
A=M // 933
D=M // 934
@2 // 935
D=D-A // 936
@DO_EQ // 937
0;JMP // 938
(Math.multiply.EQ.5)
D=!D // 939
@Math.multiply.IfElseEND4 // 940
D;JNE // 941

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "ADD"
//)
@ARG // 942
A=M+1 // 943
D=M // 944
D=D+M // 945
@SP // 946
AM=M+1 // 947
A=A-1 // 948
M=D // 949
@RETURN // 950
0;JMP // 951

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
@Math.multiply.EQ.6 // 952
D=A // 953
@SP // 954
AM=M+1 // 955
A=A-1 // 956
M=D // 957
@ARG // 958
A=M+1 // 959
D=M // 960
@2 // 961
D=D-A // 962
@DO_EQ // 963
0;JMP // 964
(Math.multiply.EQ.6)
D=!D // 965
@Math.multiply.IfElseEND5 // 966
D;JNE // 967

////BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)
@ARG // 968
A=M // 969
D=M // 970
D=D+M // 971
@SP // 972
AM=M+1 // 973
A=A-1 // 974
M=D // 975
@RETURN // 976
0;JMP // 977

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 978
A=M+1 // 979
A=A+1 // 980
M=1 // 981

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 982
A=M+1 // 983
M=0 // 984

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 985
A=M // 986
M=0 // 987

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
@Math.multiply.LT.7 // 988
D=A // 989
@SP // 990
AM=M+1 // 991
A=A-1 // 992
M=D // 993
@LCL // 994
A=M+1 // 995
D=M // 996
@16 // 997
D=D-A // 998
@DO_LT // 999
0;JMP // 1000
(Math.multiply.LT.7)
D=!D // 1001
@WHILE_END_Math.multiply1 // 1002
D;JNE // 1003

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
@Math.multiply.EQ.8 // 1004
D=A // 1005
@SP // 1006
AM=M+1 // 1007
A=A-1 // 1008
M=D // 1009
@ARG // 1010
A=M+1 // 1011
D=M // 1012
@SP // 1013
AM=M+1 // 1014
A=A-1 // 1015
M=D // 1016
@LCL // 1017
A=M+1 // 1018
A=A+1 // 1019
D=M // 1020
@SP // 1021
AM=M-1 // 1022
D=D&M // 1023
@DO_EQ // 1024
0;JMP // 1025
(Math.multiply.EQ.8)
@Math.multiply.IfElseEND6 // 1026
D;JNE // 1027

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

@ARG // 1028
A=M // 1029
D=M // 1030
@LCL // 1031
A=M // 1032
M=D+M // 1033

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

@ARG // 1034
A=M // 1035
D=M // 1036
@ARG // 1037
A=M // 1038
M=D+M // 1039

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

@LCL // 1040
A=M+1 // 1041
M=M+1 // 1042

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

@LCL // 1043
A=M+1 // 1044
A=A+1 // 1045
D=M // 1046
@LCL // 1047
A=M+1 // 1048
A=A+1 // 1049
M=D+M // 1050

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 1051
0;JMP // 1052

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 1053
A=M // 1054
D=M // 1055
@SP // 1056
AM=M+1 // 1057
A=A-1 // 1058
M=D // 1059
@RETURN // 1060
0;JMP // 1061

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 1062
D=A // 1063
@SP // 1064
AM=D+M // 1065
A=A-1 // 1066
M=0 // 1067
A=A-1 // 1068
M=0 // 1069
A=A-1 // 1070
M=0 // 1071

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 1072
A=M // 1073
D=M // 1074
@SP // 1075
AM=M+1 // 1076
A=A-1 // 1077
M=D // 1078
// call Math.abs
@6 // 1079
D=A // 1080
@14 // 1081
M=D // 1082
@Math.abs // 1083
D=A // 1084
@13 // 1085
M=D // 1086
@Math.divide.ret.0 // 1087
D=A // 1088
@CALL // 1089
0;JMP // 1090
(Math.divide.ret.0)
@SP // 1091
AM=M-1 // 1092
D=M // 1093
@LCL // 1094
A=M+1 // 1095
M=D // 1096

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 1097
A=M+1 // 1098
D=M // 1099
@SP // 1100
AM=M+1 // 1101
A=A-1 // 1102
M=D // 1103
// call Math.abs
@6 // 1104
D=A // 1105
@14 // 1106
M=D // 1107
@Math.abs // 1108
D=A // 1109
@13 // 1110
M=D // 1111
@Math.divide.ret.1 // 1112
D=A // 1113
@CALL // 1114
0;JMP // 1115
(Math.divide.ret.1)
@SP // 1116
AM=M-1 // 1117
D=M // 1118
@LCL // 1119
A=M+1 // 1120
A=A+1 // 1121
M=D // 1122

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("local 1"),
//        binaryOp: "GT"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Math.divide.IfElseEND1}}
@Math.divide.GT.9 // 1123
D=A // 1124
@SP // 1125
AM=M+1 // 1126
A=A-1 // 1127
M=D // 1128
@LCL // 1129
A=M+1 // 1130
A=A+1 // 1131
D=M // 1132
A=A-1 // 1133
D=D-M // 1134
@DO_GT // 1135
0;JMP // 1136
(Math.divide.GT.9)
D=!D // 1137
@Math.divide.IfElseEND1 // 1138
D;JNE // 1139

////PushInstruction("constant 0")
@SP // 1140
AM=M+1 // 1141
A=A-1 // 1142
M=0 // 1143
@RETURN // 1144
0;JMP // 1145

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

@LCL // 1146
A=M+1 // 1147
D=M // 1148
@SP // 1149
AM=M+1 // 1150
A=A-1 // 1151
M=D // 1152
@LCL // 1153
A=M+1 // 1154
A=A+1 // 1155
D=M // 1156
D=D+M // 1157
@SP // 1158
AM=M+1 // 1159
A=A-1 // 1160
M=D // 1161
// call Math.divide
@7 // 1162
D=A // 1163
@14 // 1164
M=D // 1165
@Math.divide // 1166
D=A // 1167
@13 // 1168
M=D // 1169
@Math.divide.ret.2 // 1170
D=A // 1171
@CALL // 1172
0;JMP // 1173
(Math.divide.ret.2)
@SP // 1174
AM=M-1 // 1175
D=M // 1176
@LCL // 1177
A=M // 1178
M=D // 1179

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
@Math.divide.LT.10 // 1180
D=A // 1181
@SP // 1182
AM=M+1 // 1183
A=A-1 // 1184
M=D // 1185
@LCL // 1186
A=M+1 // 1187
D=M // 1188
@SP // 1189
AM=M+1 // 1190
A=A-1 // 1191
M=D // 1192
@LCL // 1193
A=M // 1194
D=M // 1195
D=D+M // 1196
@SP // 1197
AM=M+1 // 1198
A=A-1 // 1199
M=D // 1200
@LCL // 1201
A=M+1 // 1202
A=A+1 // 1203
D=M // 1204
@SP // 1205
AM=M+1 // 1206
A=A-1 // 1207
M=D // 1208
// call Math.multiply
@7 // 1209
D=A // 1210
@14 // 1211
M=D // 1212
@Math.multiply // 1213
D=A // 1214
@13 // 1215
M=D // 1216
@Math.divide.ret.3 // 1217
D=A // 1218
@CALL // 1219
0;JMP // 1220
(Math.divide.ret.3)
@SP // 1221
AM=M-1 // 1222
D=M // 1223
@SP // 1224
AM=M-1 // 1225
D=M-D // 1226
@SP // 1227
AM=M+1 // 1228
A=A-1 // 1229
M=D // 1230
@LCL // 1231
A=M+1 // 1232
A=A+1 // 1233
D=M // 1234
@SP // 1235
AM=M-1 // 1236
D=M-D // 1237
@DO_LT // 1238
0;JMP // 1239
(Math.divide.LT.10)
D=!D // 1240
@Math.divide.IfElse2 // 1241
D;JNE // 1242

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
@Math.divide.GT.11 // 1243
D=A // 1244
@SP // 1245
AM=M+1 // 1246
A=A-1 // 1247
M=D // 1248
@Math.divide.LT.12 // 1249
D=A // 1250
@SP // 1251
AM=M+1 // 1252
A=A-1 // 1253
M=D // 1254
@ARG // 1255
A=M // 1256
D=M // 1257
@DO_LT // 1258
0;JMP // 1259
(Math.divide.LT.12)
@SP // 1260
AM=M+1 // 1261
A=A-1 // 1262
M=D // 1263
@ARG // 1264
A=M+1 // 1265
D=M // 1266
@SP // 1267
AM=M-1 // 1268
D=D&M // 1269
@DO_GT // 1270
0;JMP // 1271
(Math.divide.GT.11)
@SP // 1272
AM=M+1 // 1273
A=A-1 // 1274
M=D // 1275
@Math.divide.LT.13 // 1276
D=A // 1277
@SP // 1278
AM=M+1 // 1279
A=A-1 // 1280
M=D // 1281
@Math.divide.GT.14 // 1282
D=A // 1283
@SP // 1284
AM=M+1 // 1285
A=A-1 // 1286
M=D // 1287
@ARG // 1288
A=M // 1289
D=M // 1290
@DO_GT // 1291
0;JMP // 1292
(Math.divide.GT.14)
@SP // 1293
AM=M+1 // 1294
A=A-1 // 1295
M=D // 1296
@ARG // 1297
A=M+1 // 1298
D=M // 1299
@SP // 1300
AM=M-1 // 1301
D=D&M // 1302
@DO_LT // 1303
0;JMP // 1304
(Math.divide.LT.13)
@SP // 1305
AM=M-1 // 1306
D=D|M // 1307
D=!D // 1308
@Math.divide.IfElseEND3 // 1309
D;JNE // 1310

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1311
A=M // 1312
D=-M // 1313
@LCL // 1314
A=M // 1315
M=D // 1316

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
@LCL // 1317
A=M // 1318
D=M // 1319
D=D+M // 1320
@SP // 1321
AM=M+1 // 1322
A=A-1 // 1323
M=D // 1324
@RETURN // 1325
0;JMP // 1326

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 1327
0;JMP // 1328

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
@Math.divide.GT.15 // 1329
D=A // 1330
@SP // 1331
AM=M+1 // 1332
A=A-1 // 1333
M=D // 1334
@Math.divide.LT.16 // 1335
D=A // 1336
@SP // 1337
AM=M+1 // 1338
A=A-1 // 1339
M=D // 1340
@ARG // 1341
A=M // 1342
D=M // 1343
@DO_LT // 1344
0;JMP // 1345
(Math.divide.LT.16)
@SP // 1346
AM=M+1 // 1347
A=A-1 // 1348
M=D // 1349
@ARG // 1350
A=M+1 // 1351
D=M // 1352
@SP // 1353
AM=M-1 // 1354
D=D&M // 1355
@DO_GT // 1356
0;JMP // 1357
(Math.divide.GT.15)
@SP // 1358
AM=M+1 // 1359
A=A-1 // 1360
M=D // 1361
@Math.divide.LT.17 // 1362
D=A // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=D // 1367
@Math.divide.GT.18 // 1368
D=A // 1369
@SP // 1370
AM=M+1 // 1371
A=A-1 // 1372
M=D // 1373
@ARG // 1374
A=M // 1375
D=M // 1376
@DO_GT // 1377
0;JMP // 1378
(Math.divide.GT.18)
@SP // 1379
AM=M+1 // 1380
A=A-1 // 1381
M=D // 1382
@ARG // 1383
A=M+1 // 1384
D=M // 1385
@SP // 1386
AM=M-1 // 1387
D=D&M // 1388
@DO_LT // 1389
0;JMP // 1390
(Math.divide.LT.17)
@SP // 1391
AM=M-1 // 1392
D=D|M // 1393
D=!D // 1394
@Math.divide.IfElseEND4 // 1395
D;JNE // 1396

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1397
A=M // 1398
D=-M // 1399
@LCL // 1400
A=M // 1401
M=D // 1402

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
@LCL // 1403
A=M // 1404
D=M // 1405
D=D+M // 1406
D=D+1 // 1407
@SP // 1408
AM=M+1 // 1409
A=A-1 // 1410
M=D // 1411
@RETURN // 1412
0;JMP // 1413

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
@ARG // 1414
A=M // 1415
D=M // 1416
@SP // 1417
AM=M+1 // 1418
A=A-1 // 1419
M=D // 1420
@ARG // 1421
A=M // 1422
D=M // 1423
@SP // 1424
AM=M+1 // 1425
A=A-1 // 1426
M=D // 1427
@ARG // 1428
A=M+1 // 1429
D=M // 1430
@SP // 1431
AM=M+1 // 1432
A=A-1 // 1433
M=D // 1434
// call Math.divide
@7 // 1435
D=A // 1436
@14 // 1437
M=D // 1438
@Math.divide // 1439
D=A // 1440
@13 // 1441
M=D // 1442
@Math.mod.ret.0 // 1443
D=A // 1444
@CALL // 1445
0;JMP // 1446
(Math.mod.ret.0)
@ARG // 1447
A=M+1 // 1448
D=M // 1449
@SP // 1450
AM=M+1 // 1451
A=A-1 // 1452
M=D // 1453
// call Math.multiply
@7 // 1454
D=A // 1455
@14 // 1456
M=D // 1457
@Math.multiply // 1458
D=A // 1459
@13 // 1460
M=D // 1461
@Math.mod.ret.1 // 1462
D=A // 1463
@CALL // 1464
0;JMP // 1465
(Math.mod.ret.1)
@SP // 1466
AM=M-1 // 1467
D=M // 1468
@SP // 1469
AM=M-1 // 1470
D=M-D // 1471
@SP // 1472
AM=M+1 // 1473
A=A-1 // 1474
M=D // 1475
@RETURN // 1476
0;JMP // 1477

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
@Math.0 // 1478
D=M // 1479
@SP // 1480
AM=M+1 // 1481
A=A-1 // 1482
M=D // 1483
@ARG // 1484
A=M // 1485
D=M // 1486
@SP // 1487
AM=M-1 // 1488
A=D+M // 1489
D=M // 1490
@SP // 1491
AM=M+1 // 1492
A=A-1 // 1493
M=D // 1494
@RETURN // 1495
0;JMP // 1496

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=4, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@4 // 1497
D=A // 1498
@SP // 1499
AM=D+M // 1500
A=A-1 // 1501
M=0 // 1502
A=A-1 // 1503
M=0 // 1504
A=A-1 // 1505
M=0 // 1506
A=A-1 // 1507
M=0 // 1508

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1509
A=M // 1510
M=0 // 1511

////PushPopPair {
//  push: PushInstruction("constant 7")
//  pop:  PopInstruction{address=local 1}
//}

@7 // 1512
D=A // 1513
@LCL // 1514
A=M+1 // 1515
M=D // 1516

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
@Math.sqrt.LT.19 // 1517
D=A // 1518
@SP // 1519
AM=M+1 // 1520
A=A-1 // 1521
M=D // 1522
@LCL // 1523
A=M+1 // 1524
D=M // 1525
@DO_LT // 1526
0;JMP // 1527
(Math.sqrt.LT.19)
@WHILE_END_Math.sqrt1 // 1528
D;JNE // 1529

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

@LCL // 1530
A=M // 1531
D=M // 1532
@SP // 1533
AM=M+1 // 1534
A=A-1 // 1535
M=D // 1536
@Math.0 // 1537
D=M // 1538
@SP // 1539
AM=M+1 // 1540
A=A-1 // 1541
M=D // 1542
@LCL // 1543
A=M+1 // 1544
D=M // 1545
@SP // 1546
AM=M-1 // 1547
A=D+M // 1548
D=M // 1549
@SP // 1550
AM=M-1 // 1551
D=D+M // 1552
@LCL // 1553
A=M+1 // 1554
A=A+1 // 1555
M=D // 1556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2"), PushInstruction("local 2")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 3}
//}

@2 // 1557
D=A // 1558
@SP // 1559
M=D+M // 1560
@LCL // 1561
A=M+1 // 1562
A=A+1 // 1563
D=M // 1564
@SP // 1565
A=M-1 // 1566
M=D // 1567
A=A-1 // 1568
M=D // 1569
// call Math.multiply
@7 // 1570
D=A // 1571
@14 // 1572
M=D // 1573
@Math.multiply // 1574
D=A // 1575
@13 // 1576
M=D // 1577
@Math.sqrt.ret.0 // 1578
D=A // 1579
@CALL // 1580
0;JMP // 1581
(Math.sqrt.ret.0)
@SP // 1582
AM=M-1 // 1583
D=M // 1584
@LCL // 1585
A=M+1 // 1586
A=A+1 // 1587
A=A+1 // 1588
M=D // 1589

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
@Math.sqrt.GT.20 // 1590
D=A // 1591
@SP // 1592
AM=M+1 // 1593
A=A-1 // 1594
M=D // 1595
@LCL // 1596
A=M+1 // 1597
A=A+1 // 1598
A=A+1 // 1599
D=M // 1600
@SP // 1601
AM=M+1 // 1602
A=A-1 // 1603
M=D // 1604
@ARG // 1605
A=M // 1606
D=M // 1607
@SP // 1608
AM=M-1 // 1609
D=M-D // 1610
@DO_GT // 1611
0;JMP // 1612
(Math.sqrt.GT.20)
@SP // 1613
AM=M+1 // 1614
A=A-1 // 1615
M=D // 1616
@SP // 1617
A=M-1 // 1618
M=!D // 1619
@Math.sqrt.GT.21 // 1620
D=A // 1621
@SP // 1622
AM=M+1 // 1623
A=A-1 // 1624
M=D // 1625
@LCL // 1626
A=M+1 // 1627
A=A+1 // 1628
A=A+1 // 1629
D=M // 1630
@DO_GT // 1631
0;JMP // 1632
(Math.sqrt.GT.21)
@SP // 1633
AM=M-1 // 1634
D=D&M // 1635
D=!D // 1636
@Math.sqrt.IfElseEND1 // 1637
D;JNE // 1638

////PushPopPair {
//  push: PushInstruction("local 2")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 1639
A=M+1 // 1640
A=A+1 // 1641
D=M // 1642
@LCL // 1643
A=M // 1644
M=D // 1645

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

@LCL // 1646
A=M+1 // 1647
M=M-1 // 1648

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 1649
0;JMP // 1650

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 1651
A=M // 1652
D=M // 1653
@SP // 1654
AM=M+1 // 1655
A=A-1 // 1656
M=D // 1657
@RETURN // 1658
0;JMP // 1659

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
@Math.max.GT.22 // 1660
D=A // 1661
@SP // 1662
AM=M+1 // 1663
A=A-1 // 1664
M=D // 1665
@ARG // 1666
A=M+1 // 1667
D=M // 1668
A=A-1 // 1669
D=M-D // 1670
@DO_GT // 1671
0;JMP // 1672
(Math.max.GT.22)
D=!D // 1673
@Math.max.IfElseEND1 // 1674
D;JNE // 1675

////PushInstruction("argument 0")
@ARG // 1676
A=M // 1677
D=M // 1678
@SP // 1679
AM=M+1 // 1680
A=A-1 // 1681
M=D // 1682
@RETURN // 1683
0;JMP // 1684

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1685
A=M+1 // 1686
D=M // 1687
@SP // 1688
AM=M+1 // 1689
A=A-1 // 1690
M=D // 1691
@RETURN // 1692
0;JMP // 1693

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
@Math.min.LT.23 // 1694
D=A // 1695
@SP // 1696
AM=M+1 // 1697
A=A-1 // 1698
M=D // 1699
@ARG // 1700
A=M+1 // 1701
D=M // 1702
A=A-1 // 1703
D=M-D // 1704
@DO_LT // 1705
0;JMP // 1706
(Math.min.LT.23)
D=!D // 1707
@Math.min.IfElseEND1 // 1708
D;JNE // 1709

////PushInstruction("argument 0")
@ARG // 1710
A=M // 1711
D=M // 1712
@SP // 1713
AM=M+1 // 1714
A=A-1 // 1715
M=D // 1716
@RETURN // 1717
0;JMP // 1718

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 1719
A=M+1 // 1720
D=M // 1721
@SP // 1722
AM=M+1 // 1723
A=A-1 // 1724
M=D // 1725
@RETURN // 1726
0;JMP // 1727

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=4, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 1728
A=M // 1729
D=M // 1730
@SP // 1731
AM=M+1 // 1732
A=A-1 // 1733
M=D // 1734
@ARG // 1735
A=M // 1736
D=M // 1737
@SP // 1738
AM=M+1 // 1739
A=A-1 // 1740
M=D // 1741
@SP // 1742
A=M-1 // 1743
M=-D // 1744
// call Math.max
@7 // 1745
D=A // 1746
@14 // 1747
M=D // 1748
@Math.max // 1749
D=A // 1750
@13 // 1751
M=D // 1752
@Math.abs.ret.0 // 1753
D=A // 1754
@CALL // 1755
0;JMP // 1756
(Math.abs.ret.0)
@RETURN // 1757
0;JMP // 1758

