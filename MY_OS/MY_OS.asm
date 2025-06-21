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
//R13  – return address
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
@13 // 24
A=M // 25
0;JMP // 26
(SKIP)
//Set up calling and returning from functions
@SKIPo // 27
0;JMP // 28
(CALL)
@SP // 29
AM=M+1 // 30
A=A-1 // 31
M=D // 32
@LCL // 33
D=M // 34
@SP // 35
AM=M+1 // 36
A=A-1 // 37
M=D // 38
@ARG // 39
D=M // 40
@SP // 41
AM=M+1 // 42
A=A-1 // 43
M=D // 44
@THIS // 45
D=M // 46
@SP // 47
AM=M+1 // 48
A=A-1 // 49
M=D // 50
@THAT // 51
D=M // 52
@SP // 53
AM=M+1 // 54
A=A-1 // 55
M=D // 56
@14 // 57
D=M // 58
@SP // 59
D=M-D // 60
@ARG // 61
M=D // 62
@SP // 63
D=M // 64
@LCL // 65
M=D // 66
@13 // 67
A=M // 68
0;JMP // 69
(RETURN)
@LCL // 70
D=M // 71
@14 // 72
M=D // 73
@5 // 74
A=D-A // 75
D=M // 76
@15 // 77
M=D // 78
@SP // 79
AM=M-1 // 80
D=M // 81
@ARG // 82
A=M // 83
M=D // 84
@ARG // 85
D=M // 86
@SP // 87
M=D+1 // 88
@14 // 89
A=M-1 // 90
D=M // 91
@THAT // 92
M=D // 93
@14 // 94
A=M-1 // 95
A=A-1 // 96
D=M // 97
@THIS // 98
M=D // 99
@14 // 100
A=M-1 // 101
A=A-1 // 102
A=A-1 // 103
D=M // 104
@ARG // 105
M=D // 106
@14 // 107
A=M-1 // 108
A=A-1 // 109
A=A-1 // 110
A=A-1 // 111
D=M // 112
@LCL // 113
M=D // 114
@15 // 115
A=M // 116
0;JMP // 117
(SKIPo)
// call Sys.init
@5 // 118
D=A // 119
@14 // 120
M=D // 121
@Sys.init // 122
D=A // 123
@13 // 124
M=D // 125
@global.ret.0 // 126
D=A // 127
@CALL // 128
0;JMP // 129
(global.ret.0)
////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushInstruction("constant 0")
@SP // 130
AM=M+1 // 131
A=A-1 // 132
M=0 // 133

////ArithmeticInstruction{NOT}
@SP // 134
A=M-1 // 135
M=!M // 136

////PopInstruction{address=Screen.0}
@SP // 137
AM=M-1 // 138
D=M // 139
@Screen.0 // 140
M=D // 141

////PushInstruction("constant 0")
@SP // 142
AM=M+1 // 143
A=A-1 // 144
M=0 // 145

////ReturnInstruction{}
@RETURN // 146
0;JMP // 147

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushInstruction("argument 0")
@ARG // 148
A=M // 149
D=M // 150
@SP // 151
AM=M+1 // 152
A=A-1 // 153
M=D // 154

////PopInstruction{address=Screen.0}
@SP // 155
AM=M-1 // 156
D=M // 157
@Screen.0 // 158
M=D // 159

////PushInstruction("constant 0")
@SP // 160
AM=M+1 // 161
A=A-1 // 162
M=0 // 163

////ReturnInstruction{}
@RETURN // 164
0;JMP // 165

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 166
AM=M+1 // 167
A=A-1 // 168
M=0 // 169
@SP // 170
AM=M+1 // 171
A=A-1 // 172
M=0 // 173

////PushInstruction("constant 16384")
@16384 // 174
D=A // 175
@SP // 176
AM=M+1 // 177
A=A-1 // 178
M=D // 179

////PushInstruction("argument 1")
@ARG // 180
A=M+1 // 181
D=M // 182
@SP // 183
AM=M+1 // 184
A=A-1 // 185
M=D // 186

////PushInstruction("constant 32")
@32 // 187
D=A // 188
@SP // 189
AM=M+1 // 190
A=A-1 // 191
M=D // 192

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}
// call Math.multiply
@7 // 193
D=A // 194
@14 // 195
M=D // 196
@Math.multiply // 197
D=A // 198
@13 // 199
M=D // 200
@Screen.drawPixel.ret.0 // 201
D=A // 202
@CALL // 203
0;JMP // 204
(Screen.drawPixel.ret.0)

////PushInstruction("argument 0")
@ARG // 205
A=M // 206
D=M // 207
@SP // 208
AM=M+1 // 209
A=A-1 // 210
M=D // 211

////PushInstruction("constant 16")
@16 // 212
D=A // 213
@SP // 214
AM=M+1 // 215
A=A-1 // 216
M=D // 217

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=1}, currentFunction='Screen.drawPixel'}
// call Math.divide
@7 // 218
D=A // 219
@14 // 220
M=D // 221
@Math.divide // 222
D=A // 223
@13 // 224
M=D // 225
@Screen.drawPixel.ret.1 // 226
D=A // 227
@CALL // 228
0;JMP // 229
(Screen.drawPixel.ret.1)

////ArithmeticInstruction{ADD}
@SP // 230
AM=M-1 // 231
D=M // 232
A=A-1 // 233
M=D+M // 234

////ArithmeticInstruction{ADD}
@SP // 235
AM=M-1 // 236
D=M // 237
A=A-1 // 238
M=D+M // 239

////PopInstruction{address=local 0}
@SP // 240
AM=M-1 // 241
D=M // 242
@LCL // 243
A=M // 244
M=D // 245

////PushInstruction("argument 0")
@ARG // 246
A=M // 247
D=M // 248
@SP // 249
AM=M+1 // 250
A=A-1 // 251
M=D // 252

////PushInstruction("constant 15")
@15 // 253
D=A // 254
@SP // 255
AM=M+1 // 256
A=A-1 // 257
M=D // 258

////ArithmeticInstruction{AND}
@SP // 259
AM=M-1 // 260
D=M // 261
A=A-1 // 262
M=D&M // 263

////PopInstruction{address=local 1}
@SP // 264
AM=M-1 // 265
D=M // 266
@LCL // 267
A=M+1 // 268
M=D // 269

////PushInstruction("static 0")
@Screen.0 // 270
D=M // 271
@SP // 272
AM=M+1 // 273
A=A-1 // 274
M=D // 275

////PushInstruction("constant 0")
@SP // 276
AM=M+1 // 277
A=A-1 // 278
M=0 // 279

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawPixel_eq0 // 280
D=A // 281
@13 // 282
M=D // 283
@SP // 284
AM=M-1 // 285
D=M // 286
A=A-1 // 287
D=M-D // 288
@DO_EQ // 289
0;JMP // 290
(COMPARE_Screen.drawPixel_eq0)
@SP // 291
A=M-1 // 292
M=D // 293

////ArithmeticInstruction{NOT}
@SP // 294
A=M-1 // 295
M=!M // 296

////PushInstruction("constant 0")
@SP // 297
AM=M+1 // 298
A=A-1 // 299
M=0 // 300

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawPixel_eq1 // 301
D=A // 302
@13 // 303
M=D // 304
@SP // 305
AM=M-1 // 306
D=M // 307
A=A-1 // 308
D=M-D // 309
@DO_EQ // 310
0;JMP // 311
(COMPARE_Screen.drawPixel_eq1)
@SP // 312
A=M-1 // 313
M=D // 314

////IfGotoInstruction{label='Screen.drawPixel.IfElse1}
// if-goto Screen.drawPixel.IfElse1
@SP // 315
AM=M-1 // 316
D=M // 317
@Screen.drawPixel.IfElse1 // 318
D;JNE // 319

////PushInstruction("local 0")
@LCL // 320
A=M // 321
D=M // 322
@SP // 323
AM=M+1 // 324
A=A-1 // 325
M=D // 326

////PushInstruction("constant 0")
@SP // 327
AM=M+1 // 328
A=A-1 // 329
M=0 // 330

////ArithmeticInstruction{ADD}
@SP // 331
AM=M-1 // 332
D=M // 333
A=A-1 // 334
M=D+M // 335

////PopInstruction{address=pointer 1}
@SP // 336
AM=M-1 // 337
D=M // 338
@4 // 339
M=D // 340

////PushInstruction("that 0")
@THAT // 341
A=M // 342
D=M // 343
@SP // 344
AM=M+1 // 345
A=A-1 // 346
M=D // 347

////PushInstruction("local 1")
@LCL // 348
A=M+1 // 349
D=M // 350
@SP // 351
AM=M+1 // 352
A=A-1 // 353
M=D // 354

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=2}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 355
D=A // 356
@14 // 357
M=D // 358
@Math.twoToThe // 359
D=A // 360
@13 // 361
M=D // 362
@Screen.drawPixel.ret.2 // 363
D=A // 364
@CALL // 365
0;JMP // 366
(Screen.drawPixel.ret.2)

////ArithmeticInstruction{OR}
@SP // 367
AM=M-1 // 368
D=M // 369
A=A-1 // 370
M=D|M // 371

////PushInstruction("local 0")
@LCL // 372
A=M // 373
D=M // 374
@SP // 375
AM=M+1 // 376
A=A-1 // 377
M=D // 378

////PushInstruction("constant 0")
@SP // 379
AM=M+1 // 380
A=A-1 // 381
M=0 // 382

////ArithmeticInstruction{ADD}
@SP // 383
AM=M-1 // 384
D=M // 385
A=A-1 // 386
M=D+M // 387

////PopInstruction{address=pointer 1}
@SP // 388
AM=M-1 // 389
D=M // 390
@4 // 391
M=D // 392

////PopInstruction{address=that 0}
@SP // 393
AM=M-1 // 394
D=M // 395
@THAT // 396
A=M // 397
M=D // 398

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 399
0;JMP // 400

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushInstruction("local 0")
@LCL // 401
A=M // 402
D=M // 403
@SP // 404
AM=M+1 // 405
A=A-1 // 406
M=D // 407

////PushInstruction("constant 0")
@SP // 408
AM=M+1 // 409
A=A-1 // 410
M=0 // 411

////ArithmeticInstruction{ADD}
@SP // 412
AM=M-1 // 413
D=M // 414
A=A-1 // 415
M=D+M // 416

////PopInstruction{address=pointer 1}
@SP // 417
AM=M-1 // 418
D=M // 419
@4 // 420
M=D // 421

////PushInstruction("that 0")
@THAT // 422
A=M // 423
D=M // 424
@SP // 425
AM=M+1 // 426
A=A-1 // 427
M=D // 428

////PushInstruction("local 1")
@LCL // 429
A=M+1 // 430
D=M // 431
@SP // 432
AM=M+1 // 433
A=A-1 // 434
M=D // 435

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=3}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 436
D=A // 437
@14 // 438
M=D // 439
@Math.twoToThe // 440
D=A // 441
@13 // 442
M=D // 443
@Screen.drawPixel.ret.3 // 444
D=A // 445
@CALL // 446
0;JMP // 447
(Screen.drawPixel.ret.3)

////ArithmeticInstruction{NOT}
@SP // 448
A=M-1 // 449
M=!M // 450

////ArithmeticInstruction{AND}
@SP // 451
AM=M-1 // 452
D=M // 453
A=A-1 // 454
M=D&M // 455

////PushInstruction("local 0")
@LCL // 456
A=M // 457
D=M // 458
@SP // 459
AM=M+1 // 460
A=A-1 // 461
M=D // 462

////PushInstruction("constant 0")
@SP // 463
AM=M+1 // 464
A=A-1 // 465
M=0 // 466

////ArithmeticInstruction{ADD}
@SP // 467
AM=M-1 // 468
D=M // 469
A=A-1 // 470
M=D+M // 471

////PopInstruction{address=pointer 1}
@SP // 472
AM=M-1 // 473
D=M // 474
@4 // 475
M=D // 476

////PopInstruction{address=that 0}
@SP // 477
AM=M-1 // 478
D=M // 479
@THAT // 480
A=M // 481
M=D // 482

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 483
AM=M+1 // 484
A=A-1 // 485
M=0 // 486

////ReturnInstruction{}
@RETURN // 487
0;JMP // 488

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 489
AM=M+1 // 490
A=A-1 // 491
M=0 // 492
@SP // 493
AM=M+1 // 494
A=A-1 // 495
M=0 // 496
@SP // 497
AM=M+1 // 498
A=A-1 // 499
M=0 // 500
@SP // 501
AM=M+1 // 502
A=A-1 // 503
M=0 // 504
@SP // 505
AM=M+1 // 506
A=A-1 // 507
M=0 // 508
@SP // 509
AM=M+1 // 510
A=A-1 // 511
M=0 // 512

////PushInstruction("argument 2")
@ARG // 513
A=M+1 // 514
A=A+1 // 515
D=M // 516
@SP // 517
AM=M+1 // 518
A=A-1 // 519
M=D // 520

////PushInstruction("argument 0")
@ARG // 521
A=M // 522
D=M // 523
@SP // 524
AM=M+1 // 525
A=A-1 // 526
M=D // 527

////ArithmeticInstruction{SUB}
@SP // 528
AM=M-1 // 529
D=M // 530
A=A-1 // 531
M=M-D // 532

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 533
D=A // 534
@14 // 535
M=D // 536
@Math.abs // 537
D=A // 538
@13 // 539
M=D // 540
@Screen.drawLine.ret.0 // 541
D=A // 542
@CALL // 543
0;JMP // 544
(Screen.drawLine.ret.0)

////PopInstruction{address=local 0}
@SP // 545
AM=M-1 // 546
D=M // 547
@LCL // 548
A=M // 549
M=D // 550

////PushInstruction("argument 3")
@ARG // 551
A=M+1 // 552
A=A+1 // 553
A=A+1 // 554
D=M // 555
@SP // 556
AM=M+1 // 557
A=A-1 // 558
M=D // 559

////PushInstruction("argument 1")
@ARG // 560
A=M+1 // 561
D=M // 562
@SP // 563
AM=M+1 // 564
A=A-1 // 565
M=D // 566

////ArithmeticInstruction{SUB}
@SP // 567
AM=M-1 // 568
D=M // 569
A=A-1 // 570
M=M-D // 571

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 572
D=A // 573
@14 // 574
M=D // 575
@Math.abs // 576
D=A // 577
@13 // 578
M=D // 579
@Screen.drawLine.ret.1 // 580
D=A // 581
@CALL // 582
0;JMP // 583
(Screen.drawLine.ret.1)

////PopInstruction{address=local 1}
@SP // 584
AM=M-1 // 585
D=M // 586
@LCL // 587
A=M+1 // 588
M=D // 589

////PushInstruction("argument 0")
@ARG // 590
A=M // 591
D=M // 592
@SP // 593
AM=M+1 // 594
A=A-1 // 595
M=D // 596

////PushInstruction("argument 2")
@ARG // 597
A=M+1 // 598
A=A+1 // 599
D=M // 600
@SP // 601
AM=M+1 // 602
A=A-1 // 603
M=D // 604

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt2 // 605
D=A // 606
@13 // 607
M=D // 608
@SP // 609
AM=M-1 // 610
D=M // 611
A=A-1 // 612
D=M-D // 613
@DO_LT // 614
0;JMP // 615
(COMPARE_Screen.drawLine_lt2)
@SP // 616
A=M-1 // 617
M=D // 618

////PushInstruction("constant 0")
@SP // 619
AM=M+1 // 620
A=A-1 // 621
M=0 // 622

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq3 // 623
D=A // 624
@13 // 625
M=D // 626
@SP // 627
AM=M-1 // 628
D=M // 629
A=A-1 // 630
D=M-D // 631
@DO_EQ // 632
0;JMP // 633
(COMPARE_Screen.drawLine_eq3)
@SP // 634
A=M-1 // 635
M=D // 636

////IfGotoInstruction{label='Screen.drawLine.IfElse1}
// if-goto Screen.drawLine.IfElse1
@SP // 637
AM=M-1 // 638
D=M // 639
@Screen.drawLine.IfElse1 // 640
D;JNE // 641

////PushInstruction("constant 1")
@SP // 642
AM=M+1 // 643
A=A-1 // 644
M=1 // 645

////PopInstruction{address=local 2}
@SP // 646
AM=M-1 // 647
D=M // 648
@LCL // 649
A=M+1 // 650
A=A+1 // 651
M=D // 652

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 653
0;JMP // 654

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushInstruction("constant 1")
@SP // 655
AM=M+1 // 656
A=A-1 // 657
M=1 // 658

////ArithmeticInstruction{NEG}
@SP // 659
A=M-1 // 660
M=-M // 661

////PopInstruction{address=local 2}
@SP // 662
AM=M-1 // 663
D=M // 664
@LCL // 665
A=M+1 // 666
A=A+1 // 667
M=D // 668

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 669
A=M+1 // 670
D=M // 671
@SP // 672
AM=M+1 // 673
A=A-1 // 674
M=D // 675

////PushInstruction("argument 3")
@ARG // 676
A=M+1 // 677
A=A+1 // 678
A=A+1 // 679
D=M // 680
@SP // 681
AM=M+1 // 682
A=A-1 // 683
M=D // 684

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt4 // 685
D=A // 686
@13 // 687
M=D // 688
@SP // 689
AM=M-1 // 690
D=M // 691
A=A-1 // 692
D=M-D // 693
@DO_LT // 694
0;JMP // 695
(COMPARE_Screen.drawLine_lt4)
@SP // 696
A=M-1 // 697
M=D // 698

////PushInstruction("constant 0")
@SP // 699
AM=M+1 // 700
A=A-1 // 701
M=0 // 702

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq5 // 703
D=A // 704
@13 // 705
M=D // 706
@SP // 707
AM=M-1 // 708
D=M // 709
A=A-1 // 710
D=M-D // 711
@DO_EQ // 712
0;JMP // 713
(COMPARE_Screen.drawLine_eq5)
@SP // 714
A=M-1 // 715
M=D // 716

////IfGotoInstruction{label='Screen.drawLine.IfElse2}
// if-goto Screen.drawLine.IfElse2
@SP // 717
AM=M-1 // 718
D=M // 719
@Screen.drawLine.IfElse2 // 720
D;JNE // 721

////PushInstruction("constant 1")
@SP // 722
AM=M+1 // 723
A=A-1 // 724
M=1 // 725

////PopInstruction{address=local 3}
@SP // 726
AM=M-1 // 727
D=M // 728
@LCL // 729
A=M+1 // 730
A=A+1 // 731
A=A+1 // 732
M=D // 733

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 734
0;JMP // 735

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushInstruction("constant 1")
@SP // 736
AM=M+1 // 737
A=A-1 // 738
M=1 // 739

////ArithmeticInstruction{NEG}
@SP // 740
A=M-1 // 741
M=-M // 742

////PopInstruction{address=local 3}
@SP // 743
AM=M-1 // 744
D=M // 745
@LCL // 746
A=M+1 // 747
A=A+1 // 748
A=A+1 // 749
M=D // 750

////LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)

////PushInstruction("local 0")
@LCL // 751
A=M // 752
D=M // 753
@SP // 754
AM=M+1 // 755
A=A-1 // 756
M=D // 757

////PushInstruction("local 1")
@LCL // 758
A=M+1 // 759
D=M // 760
@SP // 761
AM=M+1 // 762
A=A-1 // 763
M=D // 764

////ArithmeticInstruction{SUB}
@SP // 765
AM=M-1 // 766
D=M // 767
A=A-1 // 768
M=M-D // 769

////PopInstruction{address=local 4}
@LCL // 770
D=M // 771
@4 // 772
A=D+A // 773
D=A // 774
@R13 // 775
M=D // 776
@SP // 777
AM=M-1 // 778
D=M // 779
@R13 // 780
A=M // 781
M=D // 782

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 783
AM=M+1 // 784
A=A-1 // 785
M=0 // 786

////ArithmeticInstruction{NOT}
@SP // 787
A=M-1 // 788
M=!M // 789

////PushInstruction("constant 0")
@SP // 790
AM=M+1 // 791
A=A-1 // 792
M=0 // 793

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq6 // 794
D=A // 795
@13 // 796
M=D // 797
@SP // 798
AM=M-1 // 799
D=M // 800
A=A-1 // 801
D=M-D // 802
@DO_EQ // 803
0;JMP // 804
(COMPARE_Screen.drawLine_eq6)
@SP // 805
A=M-1 // 806
M=D // 807

////IfGotoInstruction{label='WHILE_END_Screen.drawLine1}
// if-goto WHILE_END_Screen.drawLine1
@SP // 808
AM=M-1 // 809
D=M // 810
@WHILE_END_Screen.drawLine1 // 811
D;JNE // 812

////PushInstruction("argument 0")
@ARG // 813
A=M // 814
D=M // 815
@SP // 816
AM=M+1 // 817
A=A-1 // 818
M=D // 819

////PushInstruction("argument 1")
@ARG // 820
A=M+1 // 821
D=M // 822
@SP // 823
AM=M+1 // 824
A=A-1 // 825
M=D // 826

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Screen.drawPixel
@7 // 827
D=A // 828
@14 // 829
M=D // 830
@Screen.drawPixel // 831
D=A // 832
@13 // 833
M=D // 834
@Screen.drawLine.ret.2 // 835
D=A // 836
@CALL // 837
0;JMP // 838
(Screen.drawLine.ret.2)

////PopInstruction{address=temp 0}
@SP // 839
AM=M-1 // 840
D=M // 841
@5 // 842
M=D // 843

////PushInstruction("argument 0")
@ARG // 844
A=M // 845
D=M // 846
@SP // 847
AM=M+1 // 848
A=A-1 // 849
M=D // 850

////PushInstruction("argument 2")
@ARG // 851
A=M+1 // 852
A=A+1 // 853
D=M // 854
@SP // 855
AM=M+1 // 856
A=A-1 // 857
M=D // 858

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq7 // 859
D=A // 860
@13 // 861
M=D // 862
@SP // 863
AM=M-1 // 864
D=M // 865
A=A-1 // 866
D=M-D // 867
@DO_EQ // 868
0;JMP // 869
(COMPARE_Screen.drawLine_eq7)
@SP // 870
A=M-1 // 871
M=D // 872

////PushInstruction("argument 1")
@ARG // 873
A=M+1 // 874
D=M // 875
@SP // 876
AM=M+1 // 877
A=A-1 // 878
M=D // 879

////PushInstruction("argument 3")
@ARG // 880
A=M+1 // 881
A=A+1 // 882
A=A+1 // 883
D=M // 884
@SP // 885
AM=M+1 // 886
A=A-1 // 887
M=D // 888

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq8 // 889
D=A // 890
@13 // 891
M=D // 892
@SP // 893
AM=M-1 // 894
D=M // 895
A=A-1 // 896
D=M-D // 897
@DO_EQ // 898
0;JMP // 899
(COMPARE_Screen.drawLine_eq8)
@SP // 900
A=M-1 // 901
M=D // 902

////ArithmeticInstruction{AND}
@SP // 903
AM=M-1 // 904
D=M // 905
A=A-1 // 906
M=D&M // 907

////PushInstruction("constant 0")
@SP // 908
AM=M+1 // 909
A=A-1 // 910
M=0 // 911

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq9 // 912
D=A // 913
@13 // 914
M=D // 915
@SP // 916
AM=M-1 // 917
D=M // 918
A=A-1 // 919
D=M-D // 920
@DO_EQ // 921
0;JMP // 922
(COMPARE_Screen.drawLine_eq9)
@SP // 923
A=M-1 // 924
M=D // 925

////IfGotoInstruction{label='Screen.drawLine.IfElse3}
// if-goto Screen.drawLine.IfElse3
@SP // 926
AM=M-1 // 927
D=M // 928
@Screen.drawLine.IfElse3 // 929
D;JNE // 930

////PushInstruction("constant 0")
@SP // 931
AM=M+1 // 932
A=A-1 // 933
M=0 // 934

////ReturnInstruction{}
@RETURN // 935
0;JMP // 936

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 937
0;JMP // 938

////LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)

////LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)

////PushInstruction("local 4")
@LCL // 939
D=M // 940
@4 // 941
A=D+A // 942
D=M // 943
@SP // 944
AM=M+1 // 945
A=A-1 // 946
M=D // 947

////PushInstruction("local 4")
@LCL // 948
D=M // 949
@4 // 950
A=D+A // 951
D=M // 952
@SP // 953
AM=M+1 // 954
A=A-1 // 955
M=D // 956

////ArithmeticInstruction{ADD}
@SP // 957
AM=M-1 // 958
D=M // 959
A=A-1 // 960
M=D+M // 961

////PopInstruction{address=local 5}
@LCL // 962
D=M // 963
@5 // 964
A=D+A // 965
D=A // 966
@R13 // 967
M=D // 968
@SP // 969
AM=M-1 // 970
D=M // 971
@R13 // 972
A=M // 973
M=D // 974

////PushInstruction("local 5")
@LCL // 975
D=M // 976
@5 // 977
A=D+A // 978
D=M // 979
@SP // 980
AM=M+1 // 981
A=A-1 // 982
M=D // 983

////PushInstruction("local 1")
@LCL // 984
A=M+1 // 985
D=M // 986
@SP // 987
AM=M+1 // 988
A=A-1 // 989
M=D // 990

////ArithmeticInstruction{ADD}
@SP // 991
AM=M-1 // 992
D=M // 993
A=A-1 // 994
M=D+M // 995

////PushInstruction("constant 0")
@SP // 996
AM=M+1 // 997
A=A-1 // 998
M=0 // 999

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawLine_gt10 // 1000
D=A // 1001
@13 // 1002
M=D // 1003
@SP // 1004
AM=M-1 // 1005
D=M // 1006
A=A-1 // 1007
D=M-D // 1008
@DO_GT // 1009
0;JMP // 1010
(COMPARE_Screen.drawLine_gt10)
@SP // 1011
A=M-1 // 1012
M=D // 1013

////PushInstruction("constant 0")
@SP // 1014
AM=M+1 // 1015
A=A-1 // 1016
M=0 // 1017

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq11 // 1018
D=A // 1019
@13 // 1020
M=D // 1021
@SP // 1022
AM=M-1 // 1023
D=M // 1024
A=A-1 // 1025
D=M-D // 1026
@DO_EQ // 1027
0;JMP // 1028
(COMPARE_Screen.drawLine_eq11)
@SP // 1029
A=M-1 // 1030
M=D // 1031

////IfGotoInstruction{label='Screen.drawLine.IfElse4}
// if-goto Screen.drawLine.IfElse4
@SP // 1032
AM=M-1 // 1033
D=M // 1034
@Screen.drawLine.IfElse4 // 1035
D;JNE // 1036

////PushInstruction("local 4")
@LCL // 1037
D=M // 1038
@4 // 1039
A=D+A // 1040
D=M // 1041
@SP // 1042
AM=M+1 // 1043
A=A-1 // 1044
M=D // 1045

////PushInstruction("local 1")
@LCL // 1046
A=M+1 // 1047
D=M // 1048
@SP // 1049
AM=M+1 // 1050
A=A-1 // 1051
M=D // 1052

////ArithmeticInstruction{SUB}
@SP // 1053
AM=M-1 // 1054
D=M // 1055
A=A-1 // 1056
M=M-D // 1057

////PopInstruction{address=local 4}
@LCL // 1058
D=M // 1059
@4 // 1060
A=D+A // 1061
D=A // 1062
@R13 // 1063
M=D // 1064
@SP // 1065
AM=M-1 // 1066
D=M // 1067
@R13 // 1068
A=M // 1069
M=D // 1070

////PushInstruction("argument 0")
@ARG // 1071
A=M // 1072
D=M // 1073
@SP // 1074
AM=M+1 // 1075
A=A-1 // 1076
M=D // 1077

////PushInstruction("local 2")
@LCL // 1078
A=M+1 // 1079
A=A+1 // 1080
D=M // 1081
@SP // 1082
AM=M+1 // 1083
A=A-1 // 1084
M=D // 1085

////ArithmeticInstruction{ADD}
@SP // 1086
AM=M-1 // 1087
D=M // 1088
A=A-1 // 1089
M=D+M // 1090

////PopInstruction{address=argument 0}
@SP // 1091
AM=M-1 // 1092
D=M // 1093
@ARG // 1094
A=M // 1095
M=D // 1096

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 1097
0;JMP // 1098

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////PushInstruction("local 5")
@LCL // 1099
D=M // 1100
@5 // 1101
A=D+A // 1102
D=M // 1103
@SP // 1104
AM=M+1 // 1105
A=A-1 // 1106
M=D // 1107

////PushInstruction("local 0")
@LCL // 1108
A=M // 1109
D=M // 1110
@SP // 1111
AM=M+1 // 1112
A=A-1 // 1113
M=D // 1114

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt12 // 1115
D=A // 1116
@13 // 1117
M=D // 1118
@SP // 1119
AM=M-1 // 1120
D=M // 1121
A=A-1 // 1122
D=M-D // 1123
@DO_LT // 1124
0;JMP // 1125
(COMPARE_Screen.drawLine_lt12)
@SP // 1126
A=M-1 // 1127
M=D // 1128

////PushInstruction("constant 0")
@SP // 1129
AM=M+1 // 1130
A=A-1 // 1131
M=0 // 1132

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq13 // 1133
D=A // 1134
@13 // 1135
M=D // 1136
@SP // 1137
AM=M-1 // 1138
D=M // 1139
A=A-1 // 1140
D=M-D // 1141
@DO_EQ // 1142
0;JMP // 1143
(COMPARE_Screen.drawLine_eq13)
@SP // 1144
A=M-1 // 1145
M=D // 1146

////IfGotoInstruction{label='Screen.drawLine.IfElse5}
// if-goto Screen.drawLine.IfElse5
@SP // 1147
AM=M-1 // 1148
D=M // 1149
@Screen.drawLine.IfElse5 // 1150
D;JNE // 1151

////PushInstruction("local 4")
@LCL // 1152
D=M // 1153
@4 // 1154
A=D+A // 1155
D=M // 1156
@SP // 1157
AM=M+1 // 1158
A=A-1 // 1159
M=D // 1160

////PushInstruction("local 0")
@LCL // 1161
A=M // 1162
D=M // 1163
@SP // 1164
AM=M+1 // 1165
A=A-1 // 1166
M=D // 1167

////ArithmeticInstruction{ADD}
@SP // 1168
AM=M-1 // 1169
D=M // 1170
A=A-1 // 1171
M=D+M // 1172

////PopInstruction{address=local 4}
@LCL // 1173
D=M // 1174
@4 // 1175
A=D+A // 1176
D=A // 1177
@R13 // 1178
M=D // 1179
@SP // 1180
AM=M-1 // 1181
D=M // 1182
@R13 // 1183
A=M // 1184
M=D // 1185

////PushInstruction("argument 1")
@ARG // 1186
A=M+1 // 1187
D=M // 1188
@SP // 1189
AM=M+1 // 1190
A=A-1 // 1191
M=D // 1192

////PushInstruction("local 3")
@LCL // 1193
A=M+1 // 1194
A=A+1 // 1195
A=A+1 // 1196
D=M // 1197
@SP // 1198
AM=M+1 // 1199
A=A-1 // 1200
M=D // 1201

////ArithmeticInstruction{ADD}
@SP // 1202
AM=M-1 // 1203
D=M // 1204
A=A-1 // 1205
M=D+M // 1206

////PopInstruction{address=argument 1}
@SP // 1207
AM=M-1 // 1208
D=M // 1209
@ARG // 1210
A=M+1 // 1211
M=D // 1212

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 1213
0;JMP // 1214

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 1215
0;JMP // 1216

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 1217
AM=M+1 // 1218
A=A-1 // 1219
M=0 // 1220

////ReturnInstruction{}
@RETURN // 1221
0;JMP // 1222

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 1223
AM=M+1 // 1224
A=A-1 // 1225
M=0 // 1226

////PushInstruction("argument 0")
@ARG // 1227
A=M // 1228
D=M // 1229
@SP // 1230
AM=M+1 // 1231
A=A-1 // 1232
M=D // 1233

////PopInstruction{address=local 0}
@SP // 1234
AM=M-1 // 1235
D=M // 1236
@LCL // 1237
A=M // 1238
M=D // 1239

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////PushInstruction("local 0")
@LCL // 1240
A=M // 1241
D=M // 1242
@SP // 1243
AM=M+1 // 1244
A=A-1 // 1245
M=D // 1246

////PushInstruction("argument 1")
@ARG // 1247
A=M+1 // 1248
D=M // 1249
@SP // 1250
AM=M+1 // 1251
A=A-1 // 1252
M=D // 1253

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawHorizontalLine_gt14 // 1254
D=A // 1255
@13 // 1256
M=D // 1257
@SP // 1258
AM=M-1 // 1259
D=M // 1260
A=A-1 // 1261
D=M-D // 1262
@DO_GT // 1263
0;JMP // 1264
(COMPARE_Screen.drawHorizontalLine_gt14)
@SP // 1265
A=M-1 // 1266
M=D // 1267

////ArithmeticInstruction{NOT}
@SP // 1268
A=M-1 // 1269
M=!M // 1270

////PushInstruction("constant 0")
@SP // 1271
AM=M+1 // 1272
A=A-1 // 1273
M=0 // 1274

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawHorizontalLine_eq15 // 1275
D=A // 1276
@13 // 1277
M=D // 1278
@SP // 1279
AM=M-1 // 1280
D=M // 1281
A=A-1 // 1282
D=M-D // 1283
@DO_EQ // 1284
0;JMP // 1285
(COMPARE_Screen.drawHorizontalLine_eq15)
@SP // 1286
A=M-1 // 1287
M=D // 1288

////IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// if-goto WHILE_END_Screen.drawHorizontalLine1
@SP // 1289
AM=M-1 // 1290
D=M // 1291
@WHILE_END_Screen.drawHorizontalLine1 // 1292
D;JNE // 1293

////PushInstruction("local 0")
@LCL // 1294
A=M // 1295
D=M // 1296
@SP // 1297
AM=M+1 // 1298
A=A-1 // 1299
M=D // 1300

////PushInstruction("argument 2")
@ARG // 1301
A=M+1 // 1302
A=A+1 // 1303
D=M // 1304
@SP // 1305
AM=M+1 // 1306
A=A-1 // 1307
M=D // 1308

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawHorizontalLine'}
// call Screen.drawPixel
@7 // 1309
D=A // 1310
@14 // 1311
M=D // 1312
@Screen.drawPixel // 1313
D=A // 1314
@13 // 1315
M=D // 1316
@Screen.drawHorizontalLine.ret.0 // 1317
D=A // 1318
@CALL // 1319
0;JMP // 1320
(Screen.drawHorizontalLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 1321
AM=M-1 // 1322
D=M // 1323
@5 // 1324
M=D // 1325

////PushInstruction("local 0")
@LCL // 1326
A=M // 1327
D=M // 1328
@SP // 1329
AM=M+1 // 1330
A=A-1 // 1331
M=D // 1332

////PushInstruction("constant 1")
@SP // 1333
AM=M+1 // 1334
A=A-1 // 1335
M=1 // 1336

////ArithmeticInstruction{ADD}
@SP // 1337
AM=M-1 // 1338
D=M // 1339
A=A-1 // 1340
M=D+M // 1341

////PopInstruction{address=local 0}
@SP // 1342
AM=M-1 // 1343
D=M // 1344
@LCL // 1345
A=M // 1346
M=D // 1347

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 1348
0;JMP // 1349

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 1350
AM=M+1 // 1351
A=A-1 // 1352
M=0 // 1353

////ReturnInstruction{}
@RETURN // 1354
0;JMP // 1355

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 1356
AM=M+1 // 1357
A=A-1 // 1358
M=0 // 1359
@SP // 1360
AM=M+1 // 1361
A=A-1 // 1362
M=0 // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=0 // 1367
@SP // 1368
AM=M+1 // 1369
A=A-1 // 1370
M=0 // 1371
@SP // 1372
AM=M+1 // 1373
A=A-1 // 1374
M=0 // 1375

////PushInstruction("constant 0")
@SP // 1376
AM=M+1 // 1377
A=A-1 // 1378
M=0 // 1379

////PopInstruction{address=local 0}
@SP // 1380
AM=M-1 // 1381
D=M // 1382
@LCL // 1383
A=M // 1384
M=D // 1385

////PushInstruction("argument 2")
@ARG // 1386
A=M+1 // 1387
A=A+1 // 1388
D=M // 1389
@SP // 1390
AM=M+1 // 1391
A=A-1 // 1392
M=D // 1393

////PopInstruction{address=local 1}
@SP // 1394
AM=M-1 // 1395
D=M // 1396
@LCL // 1397
A=M+1 // 1398
M=D // 1399

////PushInstruction("constant 1")
@SP // 1400
AM=M+1 // 1401
A=A-1 // 1402
M=1 // 1403

////PushInstruction("argument 2")
@ARG // 1404
A=M+1 // 1405
A=A+1 // 1406
D=M // 1407
@SP // 1408
AM=M+1 // 1409
A=A-1 // 1410
M=D // 1411

////ArithmeticInstruction{SUB}
@SP // 1412
AM=M-1 // 1413
D=M // 1414
A=A-1 // 1415
M=M-D // 1416

////PopInstruction{address=local 2}
@SP // 1417
AM=M-1 // 1418
D=M // 1419
@LCL // 1420
A=M+1 // 1421
A=A+1 // 1422
M=D // 1423

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////PushInstruction("local 0")
@LCL // 1424
A=M // 1425
D=M // 1426
@SP // 1427
AM=M+1 // 1428
A=A-1 // 1429
M=D // 1430

////PushInstruction("local 1")
@LCL // 1431
A=M+1 // 1432
D=M // 1433
@SP // 1434
AM=M+1 // 1435
A=A-1 // 1436
M=D // 1437

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawCircle_gt16 // 1438
D=A // 1439
@13 // 1440
M=D // 1441
@SP // 1442
AM=M-1 // 1443
D=M // 1444
A=A-1 // 1445
D=M-D // 1446
@DO_GT // 1447
0;JMP // 1448
(COMPARE_Screen.drawCircle_gt16)
@SP // 1449
A=M-1 // 1450
M=D // 1451

////ArithmeticInstruction{NOT}
@SP // 1452
A=M-1 // 1453
M=!M // 1454

////PushInstruction("constant 0")
@SP // 1455
AM=M+1 // 1456
A=A-1 // 1457
M=0 // 1458

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq17 // 1459
D=A // 1460
@13 // 1461
M=D // 1462
@SP // 1463
AM=M-1 // 1464
D=M // 1465
A=A-1 // 1466
D=M-D // 1467
@DO_EQ // 1468
0;JMP // 1469
(COMPARE_Screen.drawCircle_eq17)
@SP // 1470
A=M-1 // 1471
M=D // 1472

////IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}
// if-goto WHILE_END_Screen.drawCircle1
@SP // 1473
AM=M-1 // 1474
D=M // 1475
@WHILE_END_Screen.drawCircle1 // 1476
D;JNE // 1477

////PushInstruction("argument 0")
@ARG // 1478
A=M // 1479
D=M // 1480
@SP // 1481
AM=M+1 // 1482
A=A-1 // 1483
M=D // 1484

////PushInstruction("local 0")
@LCL // 1485
A=M // 1486
D=M // 1487
@SP // 1488
AM=M+1 // 1489
A=A-1 // 1490
M=D // 1491

////ArithmeticInstruction{SUB}
@SP // 1492
AM=M-1 // 1493
D=M // 1494
A=A-1 // 1495
M=M-D // 1496

////PushInstruction("argument 0")
@ARG // 1497
A=M // 1498
D=M // 1499
@SP // 1500
AM=M+1 // 1501
A=A-1 // 1502
M=D // 1503

////PushInstruction("local 0")
@LCL // 1504
A=M // 1505
D=M // 1506
@SP // 1507
AM=M+1 // 1508
A=A-1 // 1509
M=D // 1510

////ArithmeticInstruction{ADD}
@SP // 1511
AM=M-1 // 1512
D=M // 1513
A=A-1 // 1514
M=D+M // 1515

////PushInstruction("argument 1")
@ARG // 1516
A=M+1 // 1517
D=M // 1518
@SP // 1519
AM=M+1 // 1520
A=A-1 // 1521
M=D // 1522

////PushInstruction("local 1")
@LCL // 1523
A=M+1 // 1524
D=M // 1525
@SP // 1526
AM=M+1 // 1527
A=A-1 // 1528
M=D // 1529

////ArithmeticInstruction{ADD}
@SP // 1530
AM=M-1 // 1531
D=M // 1532
A=A-1 // 1533
M=D+M // 1534

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1535
D=A // 1536
@14 // 1537
M=D // 1538
@Screen.drawHorizontalLine // 1539
D=A // 1540
@13 // 1541
M=D // 1542
@Screen.drawCircle.ret.0 // 1543
D=A // 1544
@CALL // 1545
0;JMP // 1546
(Screen.drawCircle.ret.0)

////PopInstruction{address=temp 0}
@SP // 1547
AM=M-1 // 1548
D=M // 1549
@5 // 1550
M=D // 1551

////PushInstruction("argument 0")
@ARG // 1552
A=M // 1553
D=M // 1554
@SP // 1555
AM=M+1 // 1556
A=A-1 // 1557
M=D // 1558

////PushInstruction("local 0")
@LCL // 1559
A=M // 1560
D=M // 1561
@SP // 1562
AM=M+1 // 1563
A=A-1 // 1564
M=D // 1565

////ArithmeticInstruction{SUB}
@SP // 1566
AM=M-1 // 1567
D=M // 1568
A=A-1 // 1569
M=M-D // 1570

////PushInstruction("argument 0")
@ARG // 1571
A=M // 1572
D=M // 1573
@SP // 1574
AM=M+1 // 1575
A=A-1 // 1576
M=D // 1577

////PushInstruction("local 0")
@LCL // 1578
A=M // 1579
D=M // 1580
@SP // 1581
AM=M+1 // 1582
A=A-1 // 1583
M=D // 1584

////ArithmeticInstruction{ADD}
@SP // 1585
AM=M-1 // 1586
D=M // 1587
A=A-1 // 1588
M=D+M // 1589

////PushInstruction("argument 1")
@ARG // 1590
A=M+1 // 1591
D=M // 1592
@SP // 1593
AM=M+1 // 1594
A=A-1 // 1595
M=D // 1596

////PushInstruction("local 1")
@LCL // 1597
A=M+1 // 1598
D=M // 1599
@SP // 1600
AM=M+1 // 1601
A=A-1 // 1602
M=D // 1603

////ArithmeticInstruction{SUB}
@SP // 1604
AM=M-1 // 1605
D=M // 1606
A=A-1 // 1607
M=M-D // 1608

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=1, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1609
D=A // 1610
@14 // 1611
M=D // 1612
@Screen.drawHorizontalLine // 1613
D=A // 1614
@13 // 1615
M=D // 1616
@Screen.drawCircle.ret.1 // 1617
D=A // 1618
@CALL // 1619
0;JMP // 1620
(Screen.drawCircle.ret.1)

////PopInstruction{address=temp 0}
@SP // 1621
AM=M-1 // 1622
D=M // 1623
@5 // 1624
M=D // 1625

////PushInstruction("argument 0")
@ARG // 1626
A=M // 1627
D=M // 1628
@SP // 1629
AM=M+1 // 1630
A=A-1 // 1631
M=D // 1632

////PushInstruction("local 1")
@LCL // 1633
A=M+1 // 1634
D=M // 1635
@SP // 1636
AM=M+1 // 1637
A=A-1 // 1638
M=D // 1639

////ArithmeticInstruction{SUB}
@SP // 1640
AM=M-1 // 1641
D=M // 1642
A=A-1 // 1643
M=M-D // 1644

////PushInstruction("argument 0")
@ARG // 1645
A=M // 1646
D=M // 1647
@SP // 1648
AM=M+1 // 1649
A=A-1 // 1650
M=D // 1651

////PushInstruction("local 1")
@LCL // 1652
A=M+1 // 1653
D=M // 1654
@SP // 1655
AM=M+1 // 1656
A=A-1 // 1657
M=D // 1658

////ArithmeticInstruction{ADD}
@SP // 1659
AM=M-1 // 1660
D=M // 1661
A=A-1 // 1662
M=D+M // 1663

////PushInstruction("argument 1")
@ARG // 1664
A=M+1 // 1665
D=M // 1666
@SP // 1667
AM=M+1 // 1668
A=A-1 // 1669
M=D // 1670

////PushInstruction("local 0")
@LCL // 1671
A=M // 1672
D=M // 1673
@SP // 1674
AM=M+1 // 1675
A=A-1 // 1676
M=D // 1677

////ArithmeticInstruction{ADD}
@SP // 1678
AM=M-1 // 1679
D=M // 1680
A=A-1 // 1681
M=D+M // 1682

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=2, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1683
D=A // 1684
@14 // 1685
M=D // 1686
@Screen.drawHorizontalLine // 1687
D=A // 1688
@13 // 1689
M=D // 1690
@Screen.drawCircle.ret.2 // 1691
D=A // 1692
@CALL // 1693
0;JMP // 1694
(Screen.drawCircle.ret.2)

////PopInstruction{address=temp 0}
@SP // 1695
AM=M-1 // 1696
D=M // 1697
@5 // 1698
M=D // 1699

////PushInstruction("argument 0")
@ARG // 1700
A=M // 1701
D=M // 1702
@SP // 1703
AM=M+1 // 1704
A=A-1 // 1705
M=D // 1706

////PushInstruction("local 1")
@LCL // 1707
A=M+1 // 1708
D=M // 1709
@SP // 1710
AM=M+1 // 1711
A=A-1 // 1712
M=D // 1713

////ArithmeticInstruction{SUB}
@SP // 1714
AM=M-1 // 1715
D=M // 1716
A=A-1 // 1717
M=M-D // 1718

////PushInstruction("argument 0")
@ARG // 1719
A=M // 1720
D=M // 1721
@SP // 1722
AM=M+1 // 1723
A=A-1 // 1724
M=D // 1725

////PushInstruction("local 1")
@LCL // 1726
A=M+1 // 1727
D=M // 1728
@SP // 1729
AM=M+1 // 1730
A=A-1 // 1731
M=D // 1732

////ArithmeticInstruction{ADD}
@SP // 1733
AM=M-1 // 1734
D=M // 1735
A=A-1 // 1736
M=D+M // 1737

////PushInstruction("argument 1")
@ARG // 1738
A=M+1 // 1739
D=M // 1740
@SP // 1741
AM=M+1 // 1742
A=A-1 // 1743
M=D // 1744

////PushInstruction("local 0")
@LCL // 1745
A=M // 1746
D=M // 1747
@SP // 1748
AM=M+1 // 1749
A=A-1 // 1750
M=D // 1751

////ArithmeticInstruction{SUB}
@SP // 1752
AM=M-1 // 1753
D=M // 1754
A=A-1 // 1755
M=M-D // 1756

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1757
D=A // 1758
@14 // 1759
M=D // 1760
@Screen.drawHorizontalLine // 1761
D=A // 1762
@13 // 1763
M=D // 1764
@Screen.drawCircle.ret.3 // 1765
D=A // 1766
@CALL // 1767
0;JMP // 1768
(Screen.drawCircle.ret.3)

////PopInstruction{address=temp 0}
@SP // 1769
AM=M-1 // 1770
D=M // 1771
@5 // 1772
M=D // 1773

////PushInstruction("local 2")
@LCL // 1774
A=M+1 // 1775
A=A+1 // 1776
D=M // 1777
@SP // 1778
AM=M+1 // 1779
A=A-1 // 1780
M=D // 1781

////PushInstruction("constant 0")
@SP // 1782
AM=M+1 // 1783
A=A-1 // 1784
M=0 // 1785

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawCircle_lt18 // 1786
D=A // 1787
@13 // 1788
M=D // 1789
@SP // 1790
AM=M-1 // 1791
D=M // 1792
A=A-1 // 1793
D=M-D // 1794
@DO_LT // 1795
0;JMP // 1796
(COMPARE_Screen.drawCircle_lt18)
@SP // 1797
A=M-1 // 1798
M=D // 1799

////PushInstruction("constant 0")
@SP // 1800
AM=M+1 // 1801
A=A-1 // 1802
M=0 // 1803

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq19 // 1804
D=A // 1805
@13 // 1806
M=D // 1807
@SP // 1808
AM=M-1 // 1809
D=M // 1810
A=A-1 // 1811
D=M-D // 1812
@DO_EQ // 1813
0;JMP // 1814
(COMPARE_Screen.drawCircle_eq19)
@SP // 1815
A=M-1 // 1816
M=D // 1817

////IfGotoInstruction{label='Screen.drawCircle.IfElse1}
// if-goto Screen.drawCircle.IfElse1
@SP // 1818
AM=M-1 // 1819
D=M // 1820
@Screen.drawCircle.IfElse1 // 1821
D;JNE // 1822

////PushInstruction("local 2")
@LCL // 1823
A=M+1 // 1824
A=A+1 // 1825
D=M // 1826
@SP // 1827
AM=M+1 // 1828
A=A-1 // 1829
M=D // 1830

////PushInstruction("local 0")
@LCL // 1831
A=M // 1832
D=M // 1833
@SP // 1834
AM=M+1 // 1835
A=A-1 // 1836
M=D // 1837

////PushInstruction("local 0")
@LCL // 1838
A=M // 1839
D=M // 1840
@SP // 1841
AM=M+1 // 1842
A=A-1 // 1843
M=D // 1844

////ArithmeticInstruction{ADD}
@SP // 1845
AM=M-1 // 1846
D=M // 1847
A=A-1 // 1848
M=D+M // 1849

////ArithmeticInstruction{ADD}
@SP // 1850
AM=M-1 // 1851
D=M // 1852
A=A-1 // 1853
M=D+M // 1854

////PushInstruction("constant 3")
@3 // 1855
D=A // 1856
@SP // 1857
AM=M+1 // 1858
A=A-1 // 1859
M=D // 1860

////ArithmeticInstruction{ADD}
@SP // 1861
AM=M-1 // 1862
D=M // 1863
A=A-1 // 1864
M=D+M // 1865

////PopInstruction{address=local 2}
@SP // 1866
AM=M-1 // 1867
D=M // 1868
@LCL // 1869
A=M+1 // 1870
A=A+1 // 1871
M=D // 1872

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 1873
0;JMP // 1874

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushInstruction("local 2")
@LCL // 1875
A=M+1 // 1876
A=A+1 // 1877
D=M // 1878
@SP // 1879
AM=M+1 // 1880
A=A-1 // 1881
M=D // 1882

////PushInstruction("local 0")
@LCL // 1883
A=M // 1884
D=M // 1885
@SP // 1886
AM=M+1 // 1887
A=A-1 // 1888
M=D // 1889

////PushInstruction("local 1")
@LCL // 1890
A=M+1 // 1891
D=M // 1892
@SP // 1893
AM=M+1 // 1894
A=A-1 // 1895
M=D // 1896

////ArithmeticInstruction{SUB}
@SP // 1897
AM=M-1 // 1898
D=M // 1899
A=A-1 // 1900
M=M-D // 1901

////PushInstruction("local 0")
@LCL // 1902
A=M // 1903
D=M // 1904
@SP // 1905
AM=M+1 // 1906
A=A-1 // 1907
M=D // 1908

////PushInstruction("local 1")
@LCL // 1909
A=M+1 // 1910
D=M // 1911
@SP // 1912
AM=M+1 // 1913
A=A-1 // 1914
M=D // 1915

////ArithmeticInstruction{SUB}
@SP // 1916
AM=M-1 // 1917
D=M // 1918
A=A-1 // 1919
M=M-D // 1920

////ArithmeticInstruction{ADD}
@SP // 1921
AM=M-1 // 1922
D=M // 1923
A=A-1 // 1924
M=D+M // 1925

////ArithmeticInstruction{ADD}
@SP // 1926
AM=M-1 // 1927
D=M // 1928
A=A-1 // 1929
M=D+M // 1930

////PushInstruction("constant 5")
@5 // 1931
D=A // 1932
@SP // 1933
AM=M+1 // 1934
A=A-1 // 1935
M=D // 1936

////ArithmeticInstruction{ADD}
@SP // 1937
AM=M-1 // 1938
D=M // 1939
A=A-1 // 1940
M=D+M // 1941

////PopInstruction{address=local 2}
@SP // 1942
AM=M-1 // 1943
D=M // 1944
@LCL // 1945
A=M+1 // 1946
A=A+1 // 1947
M=D // 1948

////PushInstruction("local 1")
@LCL // 1949
A=M+1 // 1950
D=M // 1951
@SP // 1952
AM=M+1 // 1953
A=A-1 // 1954
M=D // 1955

////PushInstruction("constant 1")
@SP // 1956
AM=M+1 // 1957
A=A-1 // 1958
M=1 // 1959

////ArithmeticInstruction{SUB}
@SP // 1960
AM=M-1 // 1961
D=M // 1962
A=A-1 // 1963
M=M-D // 1964

////PopInstruction{address=local 1}
@SP // 1965
AM=M-1 // 1966
D=M // 1967
@LCL // 1968
A=M+1 // 1969
M=D // 1970

////LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)

////PushInstruction("local 0")
@LCL // 1971
A=M // 1972
D=M // 1973
@SP // 1974
AM=M+1 // 1975
A=A-1 // 1976
M=D // 1977

////PushInstruction("constant 1")
@SP // 1978
AM=M+1 // 1979
A=A-1 // 1980
M=1 // 1981

////ArithmeticInstruction{ADD}
@SP // 1982
AM=M-1 // 1983
D=M // 1984
A=A-1 // 1985
M=D+M // 1986

////PopInstruction{address=local 0}
@SP // 1987
AM=M-1 // 1988
D=M // 1989
@LCL // 1990
A=M // 1991
M=D // 1992

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 1993
0;JMP // 1994

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 1995
AM=M+1 // 1996
A=A-1 // 1997
M=0 // 1998

////ReturnInstruction{}
@RETURN // 1999
0;JMP // 2000

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 2001
AM=M+1 // 2002
A=A-1 // 2003
M=0 // 2004
@SP // 2005
AM=M+1 // 2006
A=A-1 // 2007
M=0 // 2008
@SP // 2009
AM=M+1 // 2010
A=A-1 // 2011
M=0 // 2012
@SP // 2013
AM=M+1 // 2014
A=A-1 // 2015
M=0 // 2016
@SP // 2017
AM=M+1 // 2018
A=A-1 // 2019
M=0 // 2020
@SP // 2021
AM=M+1 // 2022
A=A-1 // 2023
M=0 // 2024
@SP // 2025
AM=M+1 // 2026
A=A-1 // 2027
M=0 // 2028
@SP // 2029
AM=M+1 // 2030
A=A-1 // 2031
M=0 // 2032
@SP // 2033
AM=M+1 // 2034
A=A-1 // 2035
M=0 // 2036
@SP // 2037
AM=M+1 // 2038
A=A-1 // 2039
M=0 // 2040

////PushInstruction("constant 1")
@SP // 2041
AM=M+1 // 2042
A=A-1 // 2043
M=1 // 2044

////ArithmeticInstruction{NEG}
@SP // 2045
A=M-1 // 2046
M=-M // 2047

////PopInstruction{address=local 9}
@LCL // 2048
D=M // 2049
@9 // 2050
A=D+A // 2051
D=A // 2052
@R13 // 2053
M=D // 2054
@SP // 2055
AM=M-1 // 2056
D=M // 2057
@R13 // 2058
A=M // 2059
M=D // 2060

////PushInstruction("static 0")
@Screen.0 // 2061
D=M // 2062
@SP // 2063
AM=M+1 // 2064
A=A-1 // 2065
M=D // 2066

////ArithmeticInstruction{NOT}
@SP // 2067
A=M-1 // 2068
M=!M // 2069

////PushInstruction("constant 0")
@SP // 2070
AM=M+1 // 2071
A=A-1 // 2072
M=0 // 2073

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq20 // 2074
D=A // 2075
@13 // 2076
M=D // 2077
@SP // 2078
AM=M-1 // 2079
D=M // 2080
A=A-1 // 2081
D=M-D // 2082
@DO_EQ // 2083
0;JMP // 2084
(COMPARE_Screen.drawRectangle_eq20)
@SP // 2085
A=M-1 // 2086
M=D // 2087

////IfGotoInstruction{label='Screen.drawRectangle.IfElse1}
// if-goto Screen.drawRectangle.IfElse1
@SP // 2088
AM=M-1 // 2089
D=M // 2090
@Screen.drawRectangle.IfElse1 // 2091
D;JNE // 2092

////PushInstruction("constant 0")
@SP // 2093
AM=M+1 // 2094
A=A-1 // 2095
M=0 // 2096

////PopInstruction{address=local 9}
@LCL // 2097
D=M // 2098
@9 // 2099
A=D+A // 2100
D=A // 2101
@R13 // 2102
M=D // 2103
@SP // 2104
AM=M-1 // 2105
D=M // 2106
@R13 // 2107
A=M // 2108
M=D // 2109

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 2110
0;JMP // 2111

////LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2112
A=M+1 // 2113
D=M // 2114
@SP // 2115
AM=M+1 // 2116
A=A-1 // 2117
M=D // 2118

////PopInstruction{address=local 0}
@SP // 2119
AM=M-1 // 2120
D=M // 2121
@LCL // 2122
A=M // 2123
M=D // 2124

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////PushInstruction("local 0")
@LCL // 2125
A=M // 2126
D=M // 2127
@SP // 2128
AM=M+1 // 2129
A=A-1 // 2130
M=D // 2131

////PushInstruction("argument 3")
@ARG // 2132
A=M+1 // 2133
A=A+1 // 2134
A=A+1 // 2135
D=M // 2136
@SP // 2137
AM=M+1 // 2138
A=A-1 // 2139
M=D // 2140

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawRectangle_gt21 // 2141
D=A // 2142
@13 // 2143
M=D // 2144
@SP // 2145
AM=M-1 // 2146
D=M // 2147
A=A-1 // 2148
D=M-D // 2149
@DO_GT // 2150
0;JMP // 2151
(COMPARE_Screen.drawRectangle_gt21)
@SP // 2152
A=M-1 // 2153
M=D // 2154

////ArithmeticInstruction{NOT}
@SP // 2155
A=M-1 // 2156
M=!M // 2157

////PushInstruction("constant 0")
@SP // 2158
AM=M+1 // 2159
A=A-1 // 2160
M=0 // 2161

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq22 // 2162
D=A // 2163
@13 // 2164
M=D // 2165
@SP // 2166
AM=M-1 // 2167
D=M // 2168
A=A-1 // 2169
D=M-D // 2170
@DO_EQ // 2171
0;JMP // 2172
(COMPARE_Screen.drawRectangle_eq22)
@SP // 2173
A=M-1 // 2174
M=D // 2175

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}
// if-goto WHILE_END_Screen.drawRectangle1
@SP // 2176
AM=M-1 // 2177
D=M // 2178
@WHILE_END_Screen.drawRectangle1 // 2179
D;JNE // 2180

////PushInstruction("argument 0")
@ARG // 2181
A=M // 2182
D=M // 2183
@SP // 2184
AM=M+1 // 2185
A=A-1 // 2186
M=D // 2187

////PushInstruction("constant 16")
@16 // 2188
D=A // 2189
@SP // 2190
AM=M+1 // 2191
A=A-1 // 2192
M=D // 2193

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 2194
D=A // 2195
@14 // 2196
M=D // 2197
@Math.divide // 2198
D=A // 2199
@13 // 2200
M=D // 2201
@Screen.drawRectangle.ret.0 // 2202
D=A // 2203
@CALL // 2204
0;JMP // 2205
(Screen.drawRectangle.ret.0)

////PopInstruction{address=local 1}
@SP // 2206
AM=M-1 // 2207
D=M // 2208
@LCL // 2209
A=M+1 // 2210
M=D // 2211

////PushInstruction("argument 2")
@ARG // 2212
A=M+1 // 2213
A=A+1 // 2214
D=M // 2215
@SP // 2216
AM=M+1 // 2217
A=A-1 // 2218
M=D // 2219

////PushInstruction("constant 16")
@16 // 2220
D=A // 2221
@SP // 2222
AM=M+1 // 2223
A=A-1 // 2224
M=D // 2225

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 2226
D=A // 2227
@14 // 2228
M=D // 2229
@Math.divide // 2230
D=A // 2231
@13 // 2232
M=D // 2233
@Screen.drawRectangle.ret.1 // 2234
D=A // 2235
@CALL // 2236
0;JMP // 2237
(Screen.drawRectangle.ret.1)

////PopInstruction{address=local 2}
@SP // 2238
AM=M-1 // 2239
D=M // 2240
@LCL // 2241
A=M+1 // 2242
A=A+1 // 2243
M=D // 2244

////PushInstruction("argument 0")
@ARG // 2245
A=M // 2246
D=M // 2247
@SP // 2248
AM=M+1 // 2249
A=A-1 // 2250
M=D // 2251

////PushInstruction("constant 15")
@15 // 2252
D=A // 2253
@SP // 2254
AM=M+1 // 2255
A=A-1 // 2256
M=D // 2257

////ArithmeticInstruction{AND}
@SP // 2258
AM=M-1 // 2259
D=M // 2260
A=A-1 // 2261
M=D&M // 2262

////PopInstruction{address=local 3}
@SP // 2263
AM=M-1 // 2264
D=M // 2265
@LCL // 2266
A=M+1 // 2267
A=A+1 // 2268
A=A+1 // 2269
M=D // 2270

////PushInstruction("argument 2")
@ARG // 2271
A=M+1 // 2272
A=A+1 // 2273
D=M // 2274
@SP // 2275
AM=M+1 // 2276
A=A-1 // 2277
M=D // 2278

////PushInstruction("constant 15")
@15 // 2279
D=A // 2280
@SP // 2281
AM=M+1 // 2282
A=A-1 // 2283
M=D // 2284

////ArithmeticInstruction{AND}
@SP // 2285
AM=M-1 // 2286
D=M // 2287
A=A-1 // 2288
M=D&M // 2289

////PopInstruction{address=local 4}
@LCL // 2290
D=M // 2291
@4 // 2292
A=D+A // 2293
D=A // 2294
@R13 // 2295
M=D // 2296
@SP // 2297
AM=M-1 // 2298
D=M // 2299
@R13 // 2300
A=M // 2301
M=D // 2302

////PushInstruction("local 0")
@LCL // 2303
A=M // 2304
D=M // 2305
@SP // 2306
AM=M+1 // 2307
A=A-1 // 2308
M=D // 2309

////PushInstruction("constant 32")
@32 // 2310
D=A // 2311
@SP // 2312
AM=M+1 // 2313
A=A-1 // 2314
M=D // 2315

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.multiply
@7 // 2316
D=A // 2317
@14 // 2318
M=D // 2319
@Math.multiply // 2320
D=A // 2321
@13 // 2322
M=D // 2323
@Screen.drawRectangle.ret.2 // 2324
D=A // 2325
@CALL // 2326
0;JMP // 2327
(Screen.drawRectangle.ret.2)

////PopInstruction{address=local 5}
@LCL // 2328
D=M // 2329
@5 // 2330
A=D+A // 2331
D=A // 2332
@R13 // 2333
M=D // 2334
@SP // 2335
AM=M-1 // 2336
D=M // 2337
@R13 // 2338
A=M // 2339
M=D // 2340

////PushInstruction("local 1")
@LCL // 2341
A=M+1 // 2342
D=M // 2343
@SP // 2344
AM=M+1 // 2345
A=A-1 // 2346
M=D // 2347

////PushInstruction("local 2")
@LCL // 2348
A=M+1 // 2349
A=A+1 // 2350
D=M // 2351
@SP // 2352
AM=M+1 // 2353
A=A-1 // 2354
M=D // 2355

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq23 // 2356
D=A // 2357
@13 // 2358
M=D // 2359
@SP // 2360
AM=M-1 // 2361
D=M // 2362
A=A-1 // 2363
D=M-D // 2364
@DO_EQ // 2365
0;JMP // 2366
(COMPARE_Screen.drawRectangle_eq23)
@SP // 2367
A=M-1 // 2368
M=D // 2369

////PushInstruction("constant 0")
@SP // 2370
AM=M+1 // 2371
A=A-1 // 2372
M=0 // 2373

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq24 // 2374
D=A // 2375
@13 // 2376
M=D // 2377
@SP // 2378
AM=M-1 // 2379
D=M // 2380
A=A-1 // 2381
D=M-D // 2382
@DO_EQ // 2383
0;JMP // 2384
(COMPARE_Screen.drawRectangle_eq24)
@SP // 2385
A=M-1 // 2386
M=D // 2387

////IfGotoInstruction{label='Screen.drawRectangle.IfElse2}
// if-goto Screen.drawRectangle.IfElse2
@SP // 2388
AM=M-1 // 2389
D=M // 2390
@Screen.drawRectangle.IfElse2 // 2391
D;JNE // 2392

////PushInstruction("local 4")
@LCL // 2393
D=M // 2394
@4 // 2395
A=D+A // 2396
D=M // 2397
@SP // 2398
AM=M+1 // 2399
A=A-1 // 2400
M=D // 2401

////PushInstruction("constant 1")
@SP // 2402
AM=M+1 // 2403
A=A-1 // 2404
M=1 // 2405

////ArithmeticInstruction{ADD}
@SP // 2406
AM=M-1 // 2407
D=M // 2408
A=A-1 // 2409
M=D+M // 2410

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2411
D=A // 2412
@14 // 2413
M=D // 2414
@Math.twoToThe // 2415
D=A // 2416
@13 // 2417
M=D // 2418
@Screen.drawRectangle.ret.3 // 2419
D=A // 2420
@CALL // 2421
0;JMP // 2422
(Screen.drawRectangle.ret.3)

////PushInstruction("constant 1")
@SP // 2423
AM=M+1 // 2424
A=A-1 // 2425
M=1 // 2426

////ArithmeticInstruction{SUB}
@SP // 2427
AM=M-1 // 2428
D=M // 2429
A=A-1 // 2430
M=M-D // 2431

////PushInstruction("local 3")
@LCL // 2432
A=M+1 // 2433
A=A+1 // 2434
A=A+1 // 2435
D=M // 2436
@SP // 2437
AM=M+1 // 2438
A=A-1 // 2439
M=D // 2440

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=4, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2441
D=A // 2442
@14 // 2443
M=D // 2444
@Math.twoToThe // 2445
D=A // 2446
@13 // 2447
M=D // 2448
@Screen.drawRectangle.ret.4 // 2449
D=A // 2450
@CALL // 2451
0;JMP // 2452
(Screen.drawRectangle.ret.4)

////PushInstruction("constant 1")
@SP // 2453
AM=M+1 // 2454
A=A-1 // 2455
M=1 // 2456

////ArithmeticInstruction{SUB}
@SP // 2457
AM=M-1 // 2458
D=M // 2459
A=A-1 // 2460
M=M-D // 2461

////ArithmeticInstruction{SUB}
@SP // 2462
AM=M-1 // 2463
D=M // 2464
A=A-1 // 2465
M=M-D // 2466

////PopInstruction{address=local 6}
@LCL // 2467
D=M // 2468
@6 // 2469
A=D+A // 2470
D=A // 2471
@R13 // 2472
M=D // 2473
@SP // 2474
AM=M-1 // 2475
D=M // 2476
@R13 // 2477
A=M // 2478
M=D // 2479

////PushInstruction("local 5")
@LCL // 2480
D=M // 2481
@5 // 2482
A=D+A // 2483
D=M // 2484
@SP // 2485
AM=M+1 // 2486
A=A-1 // 2487
M=D // 2488

////PushInstruction("local 1")
@LCL // 2489
A=M+1 // 2490
D=M // 2491
@SP // 2492
AM=M+1 // 2493
A=A-1 // 2494
M=D // 2495

////ArithmeticInstruction{ADD}
@SP // 2496
AM=M-1 // 2497
D=M // 2498
A=A-1 // 2499
M=D+M // 2500

////PopInstruction{address=local 7}
@LCL // 2501
D=M // 2502
@7 // 2503
A=D+A // 2504
D=A // 2505
@R13 // 2506
M=D // 2507
@SP // 2508
AM=M-1 // 2509
D=M // 2510
@R13 // 2511
A=M // 2512
M=D // 2513

////PushInstruction("static 0")
@Screen.0 // 2514
D=M // 2515
@SP // 2516
AM=M+1 // 2517
A=A-1 // 2518
M=D // 2519

////PushInstruction("constant 0")
@SP // 2520
AM=M+1 // 2521
A=A-1 // 2522
M=0 // 2523

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq25 // 2524
D=A // 2525
@13 // 2526
M=D // 2527
@SP // 2528
AM=M-1 // 2529
D=M // 2530
A=A-1 // 2531
D=M-D // 2532
@DO_EQ // 2533
0;JMP // 2534
(COMPARE_Screen.drawRectangle_eq25)
@SP // 2535
A=M-1 // 2536
M=D // 2537

////IfGotoInstruction{label='Screen.drawRectangle.IfElse3}
// if-goto Screen.drawRectangle.IfElse3
@SP // 2538
AM=M-1 // 2539
D=M // 2540
@Screen.drawRectangle.IfElse3 // 2541
D;JNE // 2542

////PushInstruction("constant 16384")
@16384 // 2543
D=A // 2544
@SP // 2545
AM=M+1 // 2546
A=A-1 // 2547
M=D // 2548

////PushInstruction("local 7")
@LCL // 2549
D=M // 2550
@7 // 2551
A=D+A // 2552
D=M // 2553
@SP // 2554
AM=M+1 // 2555
A=A-1 // 2556
M=D // 2557

////ArithmeticInstruction{ADD}
@SP // 2558
AM=M-1 // 2559
D=M // 2560
A=A-1 // 2561
M=D+M // 2562

////PopInstruction{address=pointer 1}
@SP // 2563
AM=M-1 // 2564
D=M // 2565
@4 // 2566
M=D // 2567

////PushInstruction("that 0")
@THAT // 2568
A=M // 2569
D=M // 2570
@SP // 2571
AM=M+1 // 2572
A=A-1 // 2573
M=D // 2574

////PushInstruction("local 6")
@LCL // 2575
D=M // 2576
@6 // 2577
A=D+A // 2578
D=M // 2579
@SP // 2580
AM=M+1 // 2581
A=A-1 // 2582
M=D // 2583

////ArithmeticInstruction{OR}
@SP // 2584
AM=M-1 // 2585
D=M // 2586
A=A-1 // 2587
M=D|M // 2588

////PushInstruction("constant 16384")
@16384 // 2589
D=A // 2590
@SP // 2591
AM=M+1 // 2592
A=A-1 // 2593
M=D // 2594

////PushInstruction("local 7")
@LCL // 2595
D=M // 2596
@7 // 2597
A=D+A // 2598
D=M // 2599
@SP // 2600
AM=M+1 // 2601
A=A-1 // 2602
M=D // 2603

////ArithmeticInstruction{ADD}
@SP // 2604
AM=M-1 // 2605
D=M // 2606
A=A-1 // 2607
M=D+M // 2608

////PopInstruction{address=pointer 1}
@SP // 2609
AM=M-1 // 2610
D=M // 2611
@4 // 2612
M=D // 2613

////PopInstruction{address=that 0}
@SP // 2614
AM=M-1 // 2615
D=M // 2616
@THAT // 2617
A=M // 2618
M=D // 2619

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 2620
0;JMP // 2621

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushInstruction("constant 16384")
@16384 // 2622
D=A // 2623
@SP // 2624
AM=M+1 // 2625
A=A-1 // 2626
M=D // 2627

////PushInstruction("local 7")
@LCL // 2628
D=M // 2629
@7 // 2630
A=D+A // 2631
D=M // 2632
@SP // 2633
AM=M+1 // 2634
A=A-1 // 2635
M=D // 2636

////ArithmeticInstruction{ADD}
@SP // 2637
AM=M-1 // 2638
D=M // 2639
A=A-1 // 2640
M=D+M // 2641

////PopInstruction{address=pointer 1}
@SP // 2642
AM=M-1 // 2643
D=M // 2644
@4 // 2645
M=D // 2646

////PushInstruction("that 0")
@THAT // 2647
A=M // 2648
D=M // 2649
@SP // 2650
AM=M+1 // 2651
A=A-1 // 2652
M=D // 2653

////PushInstruction("local 6")
@LCL // 2654
D=M // 2655
@6 // 2656
A=D+A // 2657
D=M // 2658
@SP // 2659
AM=M+1 // 2660
A=A-1 // 2661
M=D // 2662

////ArithmeticInstruction{NOT}
@SP // 2663
A=M-1 // 2664
M=!M // 2665

////ArithmeticInstruction{AND}
@SP // 2666
AM=M-1 // 2667
D=M // 2668
A=A-1 // 2669
M=D&M // 2670

////PushInstruction("constant 16384")
@16384 // 2671
D=A // 2672
@SP // 2673
AM=M+1 // 2674
A=A-1 // 2675
M=D // 2676

////PushInstruction("local 7")
@LCL // 2677
D=M // 2678
@7 // 2679
A=D+A // 2680
D=M // 2681
@SP // 2682
AM=M+1 // 2683
A=A-1 // 2684
M=D // 2685

////ArithmeticInstruction{ADD}
@SP // 2686
AM=M-1 // 2687
D=M // 2688
A=A-1 // 2689
M=D+M // 2690

////PopInstruction{address=pointer 1}
@SP // 2691
AM=M-1 // 2692
D=M // 2693
@4 // 2694
M=D // 2695

////PopInstruction{address=that 0}
@SP // 2696
AM=M-1 // 2697
D=M // 2698
@THAT // 2699
A=M // 2700
M=D // 2701

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 2702
0;JMP // 2703

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushInstruction("local 3")
@LCL // 2704
A=M+1 // 2705
A=A+1 // 2706
A=A+1 // 2707
D=M // 2708
@SP // 2709
AM=M+1 // 2710
A=A-1 // 2711
M=D // 2712

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2713
D=A // 2714
@14 // 2715
M=D // 2716
@Math.twoToThe // 2717
D=A // 2718
@13 // 2719
M=D // 2720
@Screen.drawRectangle.ret.5 // 2721
D=A // 2722
@CALL // 2723
0;JMP // 2724
(Screen.drawRectangle.ret.5)

////PushInstruction("constant 1")
@SP // 2725
AM=M+1 // 2726
A=A-1 // 2727
M=1 // 2728

////ArithmeticInstruction{SUB}
@SP // 2729
AM=M-1 // 2730
D=M // 2731
A=A-1 // 2732
M=M-D // 2733

////ArithmeticInstruction{NOT}
@SP // 2734
A=M-1 // 2735
M=!M // 2736

////PopInstruction{address=local 6}
@LCL // 2737
D=M // 2738
@6 // 2739
A=D+A // 2740
D=A // 2741
@R13 // 2742
M=D // 2743
@SP // 2744
AM=M-1 // 2745
D=M // 2746
@R13 // 2747
A=M // 2748
M=D // 2749

////PushInstruction("local 5")
@LCL // 2750
D=M // 2751
@5 // 2752
A=D+A // 2753
D=M // 2754
@SP // 2755
AM=M+1 // 2756
A=A-1 // 2757
M=D // 2758

////PushInstruction("local 1")
@LCL // 2759
A=M+1 // 2760
D=M // 2761
@SP // 2762
AM=M+1 // 2763
A=A-1 // 2764
M=D // 2765

////ArithmeticInstruction{ADD}
@SP // 2766
AM=M-1 // 2767
D=M // 2768
A=A-1 // 2769
M=D+M // 2770

////PopInstruction{address=local 7}
@LCL // 2771
D=M // 2772
@7 // 2773
A=D+A // 2774
D=A // 2775
@R13 // 2776
M=D // 2777
@SP // 2778
AM=M-1 // 2779
D=M // 2780
@R13 // 2781
A=M // 2782
M=D // 2783

////PushInstruction("static 0")
@Screen.0 // 2784
D=M // 2785
@SP // 2786
AM=M+1 // 2787
A=A-1 // 2788
M=D // 2789

////PushInstruction("constant 0")
@SP // 2790
AM=M+1 // 2791
A=A-1 // 2792
M=0 // 2793

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq26 // 2794
D=A // 2795
@13 // 2796
M=D // 2797
@SP // 2798
AM=M-1 // 2799
D=M // 2800
A=A-1 // 2801
D=M-D // 2802
@DO_EQ // 2803
0;JMP // 2804
(COMPARE_Screen.drawRectangle_eq26)
@SP // 2805
A=M-1 // 2806
M=D // 2807

////IfGotoInstruction{label='Screen.drawRectangle.IfElse4}
// if-goto Screen.drawRectangle.IfElse4
@SP // 2808
AM=M-1 // 2809
D=M // 2810
@Screen.drawRectangle.IfElse4 // 2811
D;JNE // 2812

////PushInstruction("constant 16384")
@16384 // 2813
D=A // 2814
@SP // 2815
AM=M+1 // 2816
A=A-1 // 2817
M=D // 2818

////PushInstruction("local 7")
@LCL // 2819
D=M // 2820
@7 // 2821
A=D+A // 2822
D=M // 2823
@SP // 2824
AM=M+1 // 2825
A=A-1 // 2826
M=D // 2827

////ArithmeticInstruction{ADD}
@SP // 2828
AM=M-1 // 2829
D=M // 2830
A=A-1 // 2831
M=D+M // 2832

////PopInstruction{address=pointer 1}
@SP // 2833
AM=M-1 // 2834
D=M // 2835
@4 // 2836
M=D // 2837

////PushInstruction("that 0")
@THAT // 2838
A=M // 2839
D=M // 2840
@SP // 2841
AM=M+1 // 2842
A=A-1 // 2843
M=D // 2844

////PushInstruction("local 6")
@LCL // 2845
D=M // 2846
@6 // 2847
A=D+A // 2848
D=M // 2849
@SP // 2850
AM=M+1 // 2851
A=A-1 // 2852
M=D // 2853

////ArithmeticInstruction{OR}
@SP // 2854
AM=M-1 // 2855
D=M // 2856
A=A-1 // 2857
M=D|M // 2858

////PushInstruction("constant 16384")
@16384 // 2859
D=A // 2860
@SP // 2861
AM=M+1 // 2862
A=A-1 // 2863
M=D // 2864

////PushInstruction("local 7")
@LCL // 2865
D=M // 2866
@7 // 2867
A=D+A // 2868
D=M // 2869
@SP // 2870
AM=M+1 // 2871
A=A-1 // 2872
M=D // 2873

////ArithmeticInstruction{ADD}
@SP // 2874
AM=M-1 // 2875
D=M // 2876
A=A-1 // 2877
M=D+M // 2878

////PopInstruction{address=pointer 1}
@SP // 2879
AM=M-1 // 2880
D=M // 2881
@4 // 2882
M=D // 2883

////PopInstruction{address=that 0}
@SP // 2884
AM=M-1 // 2885
D=M // 2886
@THAT // 2887
A=M // 2888
M=D // 2889

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 2890
0;JMP // 2891

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushInstruction("constant 16384")
@16384 // 2892
D=A // 2893
@SP // 2894
AM=M+1 // 2895
A=A-1 // 2896
M=D // 2897

////PushInstruction("local 7")
@LCL // 2898
D=M // 2899
@7 // 2900
A=D+A // 2901
D=M // 2902
@SP // 2903
AM=M+1 // 2904
A=A-1 // 2905
M=D // 2906

////ArithmeticInstruction{ADD}
@SP // 2907
AM=M-1 // 2908
D=M // 2909
A=A-1 // 2910
M=D+M // 2911

////PopInstruction{address=pointer 1}
@SP // 2912
AM=M-1 // 2913
D=M // 2914
@4 // 2915
M=D // 2916

////PushInstruction("that 0")
@THAT // 2917
A=M // 2918
D=M // 2919
@SP // 2920
AM=M+1 // 2921
A=A-1 // 2922
M=D // 2923

////PushInstruction("local 6")
@LCL // 2924
D=M // 2925
@6 // 2926
A=D+A // 2927
D=M // 2928
@SP // 2929
AM=M+1 // 2930
A=A-1 // 2931
M=D // 2932

////ArithmeticInstruction{NOT}
@SP // 2933
A=M-1 // 2934
M=!M // 2935

////ArithmeticInstruction{AND}
@SP // 2936
AM=M-1 // 2937
D=M // 2938
A=A-1 // 2939
M=D&M // 2940

////PushInstruction("constant 16384")
@16384 // 2941
D=A // 2942
@SP // 2943
AM=M+1 // 2944
A=A-1 // 2945
M=D // 2946

////PushInstruction("local 7")
@LCL // 2947
D=M // 2948
@7 // 2949
A=D+A // 2950
D=M // 2951
@SP // 2952
AM=M+1 // 2953
A=A-1 // 2954
M=D // 2955

////ArithmeticInstruction{ADD}
@SP // 2956
AM=M-1 // 2957
D=M // 2958
A=A-1 // 2959
M=D+M // 2960

////PopInstruction{address=pointer 1}
@SP // 2961
AM=M-1 // 2962
D=M // 2963
@4 // 2964
M=D // 2965

////PopInstruction{address=that 0}
@SP // 2966
AM=M-1 // 2967
D=M // 2968
@THAT // 2969
A=M // 2970
M=D // 2971

////LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)

////PushInstruction("local 1")
@LCL // 2972
A=M+1 // 2973
D=M // 2974
@SP // 2975
AM=M+1 // 2976
A=A-1 // 2977
M=D // 2978

////PushInstruction("constant 1")
@SP // 2979
AM=M+1 // 2980
A=A-1 // 2981
M=1 // 2982

////ArithmeticInstruction{ADD}
@SP // 2983
AM=M-1 // 2984
D=M // 2985
A=A-1 // 2986
M=D+M // 2987

////PopInstruction{address=local 8}
@LCL // 2988
D=M // 2989
@8 // 2990
A=D+A // 2991
D=A // 2992
@R13 // 2993
M=D // 2994
@SP // 2995
AM=M-1 // 2996
D=M // 2997
@R13 // 2998
A=M // 2999
M=D // 3000

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////PushInstruction("local 8")
@LCL // 3001
D=M // 3002
@8 // 3003
A=D+A // 3004
D=M // 3005
@SP // 3006
AM=M+1 // 3007
A=A-1 // 3008
M=D // 3009

////PushInstruction("local 2")
@LCL // 3010
A=M+1 // 3011
A=A+1 // 3012
D=M // 3013
@SP // 3014
AM=M+1 // 3015
A=A-1 // 3016
M=D // 3017

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawRectangle_lt27 // 3018
D=A // 3019
@13 // 3020
M=D // 3021
@SP // 3022
AM=M-1 // 3023
D=M // 3024
A=A-1 // 3025
D=M-D // 3026
@DO_LT // 3027
0;JMP // 3028
(COMPARE_Screen.drawRectangle_lt27)
@SP // 3029
A=M-1 // 3030
M=D // 3031

////PushInstruction("constant 0")
@SP // 3032
AM=M+1 // 3033
A=A-1 // 3034
M=0 // 3035

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq28 // 3036
D=A // 3037
@13 // 3038
M=D // 3039
@SP // 3040
AM=M-1 // 3041
D=M // 3042
A=A-1 // 3043
D=M-D // 3044
@DO_EQ // 3045
0;JMP // 3046
(COMPARE_Screen.drawRectangle_eq28)
@SP // 3047
A=M-1 // 3048
M=D // 3049

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}
// if-goto WHILE_END_Screen.drawRectangle2
@SP // 3050
AM=M-1 // 3051
D=M // 3052
@WHILE_END_Screen.drawRectangle2 // 3053
D;JNE // 3054

////PushInstruction("local 5")
@LCL // 3055
D=M // 3056
@5 // 3057
A=D+A // 3058
D=M // 3059
@SP // 3060
AM=M+1 // 3061
A=A-1 // 3062
M=D // 3063

////PushInstruction("local 8")
@LCL // 3064
D=M // 3065
@8 // 3066
A=D+A // 3067
D=M // 3068
@SP // 3069
AM=M+1 // 3070
A=A-1 // 3071
M=D // 3072

////ArithmeticInstruction{ADD}
@SP // 3073
AM=M-1 // 3074
D=M // 3075
A=A-1 // 3076
M=D+M // 3077

////PopInstruction{address=local 7}
@LCL // 3078
D=M // 3079
@7 // 3080
A=D+A // 3081
D=A // 3082
@R13 // 3083
M=D // 3084
@SP // 3085
AM=M-1 // 3086
D=M // 3087
@R13 // 3088
A=M // 3089
M=D // 3090

////PushInstruction("local 9")
@LCL // 3091
D=M // 3092
@9 // 3093
A=D+A // 3094
D=M // 3095
@SP // 3096
AM=M+1 // 3097
A=A-1 // 3098
M=D // 3099

////PushInstruction("constant 16384")
@16384 // 3100
D=A // 3101
@SP // 3102
AM=M+1 // 3103
A=A-1 // 3104
M=D // 3105

////PushInstruction("local 7")
@LCL // 3106
D=M // 3107
@7 // 3108
A=D+A // 3109
D=M // 3110
@SP // 3111
AM=M+1 // 3112
A=A-1 // 3113
M=D // 3114

////ArithmeticInstruction{ADD}
@SP // 3115
AM=M-1 // 3116
D=M // 3117
A=A-1 // 3118
M=D+M // 3119

////PopInstruction{address=pointer 1}
@SP // 3120
AM=M-1 // 3121
D=M // 3122
@4 // 3123
M=D // 3124

////PopInstruction{address=that 0}
@SP // 3125
AM=M-1 // 3126
D=M // 3127
@THAT // 3128
A=M // 3129
M=D // 3130

////PushInstruction("local 8")
@LCL // 3131
D=M // 3132
@8 // 3133
A=D+A // 3134
D=M // 3135
@SP // 3136
AM=M+1 // 3137
A=A-1 // 3138
M=D // 3139

////PushInstruction("constant 1")
@SP // 3140
AM=M+1 // 3141
A=A-1 // 3142
M=1 // 3143

////ArithmeticInstruction{ADD}
@SP // 3144
AM=M-1 // 3145
D=M // 3146
A=A-1 // 3147
M=D+M // 3148

////PopInstruction{address=local 8}
@LCL // 3149
D=M // 3150
@8 // 3151
A=D+A // 3152
D=A // 3153
@R13 // 3154
M=D // 3155
@SP // 3156
AM=M-1 // 3157
D=M // 3158
@R13 // 3159
A=M // 3160
M=D // 3161

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 3162
0;JMP // 3163

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushInstruction("local 4")
@LCL // 3164
D=M // 3165
@4 // 3166
A=D+A // 3167
D=M // 3168
@SP // 3169
AM=M+1 // 3170
A=A-1 // 3171
M=D // 3172

////PushInstruction("constant 1")
@SP // 3173
AM=M+1 // 3174
A=A-1 // 3175
M=1 // 3176

////ArithmeticInstruction{ADD}
@SP // 3177
AM=M-1 // 3178
D=M // 3179
A=A-1 // 3180
M=D+M // 3181

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=6, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 3182
D=A // 3183
@14 // 3184
M=D // 3185
@Math.twoToThe // 3186
D=A // 3187
@13 // 3188
M=D // 3189
@Screen.drawRectangle.ret.6 // 3190
D=A // 3191
@CALL // 3192
0;JMP // 3193
(Screen.drawRectangle.ret.6)

////PushInstruction("constant 1")
@SP // 3194
AM=M+1 // 3195
A=A-1 // 3196
M=1 // 3197

////ArithmeticInstruction{SUB}
@SP // 3198
AM=M-1 // 3199
D=M // 3200
A=A-1 // 3201
M=M-D // 3202

////PopInstruction{address=local 6}
@LCL // 3203
D=M // 3204
@6 // 3205
A=D+A // 3206
D=A // 3207
@R13 // 3208
M=D // 3209
@SP // 3210
AM=M-1 // 3211
D=M // 3212
@R13 // 3213
A=M // 3214
M=D // 3215

////PushInstruction("local 5")
@LCL // 3216
D=M // 3217
@5 // 3218
A=D+A // 3219
D=M // 3220
@SP // 3221
AM=M+1 // 3222
A=A-1 // 3223
M=D // 3224

////PushInstruction("local 2")
@LCL // 3225
A=M+1 // 3226
A=A+1 // 3227
D=M // 3228
@SP // 3229
AM=M+1 // 3230
A=A-1 // 3231
M=D // 3232

////ArithmeticInstruction{ADD}
@SP // 3233
AM=M-1 // 3234
D=M // 3235
A=A-1 // 3236
M=D+M // 3237

////PopInstruction{address=local 7}
@LCL // 3238
D=M // 3239
@7 // 3240
A=D+A // 3241
D=A // 3242
@R13 // 3243
M=D // 3244
@SP // 3245
AM=M-1 // 3246
D=M // 3247
@R13 // 3248
A=M // 3249
M=D // 3250

////PushInstruction("static 0")
@Screen.0 // 3251
D=M // 3252
@SP // 3253
AM=M+1 // 3254
A=A-1 // 3255
M=D // 3256

////PushInstruction("constant 0")
@SP // 3257
AM=M+1 // 3258
A=A-1 // 3259
M=0 // 3260

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq29 // 3261
D=A // 3262
@13 // 3263
M=D // 3264
@SP // 3265
AM=M-1 // 3266
D=M // 3267
A=A-1 // 3268
D=M-D // 3269
@DO_EQ // 3270
0;JMP // 3271
(COMPARE_Screen.drawRectangle_eq29)
@SP // 3272
A=M-1 // 3273
M=D // 3274

////IfGotoInstruction{label='Screen.drawRectangle.IfElse5}
// if-goto Screen.drawRectangle.IfElse5
@SP // 3275
AM=M-1 // 3276
D=M // 3277
@Screen.drawRectangle.IfElse5 // 3278
D;JNE // 3279

////PushInstruction("constant 16384")
@16384 // 3280
D=A // 3281
@SP // 3282
AM=M+1 // 3283
A=A-1 // 3284
M=D // 3285

////PushInstruction("local 7")
@LCL // 3286
D=M // 3287
@7 // 3288
A=D+A // 3289
D=M // 3290
@SP // 3291
AM=M+1 // 3292
A=A-1 // 3293
M=D // 3294

////ArithmeticInstruction{ADD}
@SP // 3295
AM=M-1 // 3296
D=M // 3297
A=A-1 // 3298
M=D+M // 3299

////PopInstruction{address=pointer 1}
@SP // 3300
AM=M-1 // 3301
D=M // 3302
@4 // 3303
M=D // 3304

////PushInstruction("that 0")
@THAT // 3305
A=M // 3306
D=M // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=D // 3311

////PushInstruction("local 6")
@LCL // 3312
D=M // 3313
@6 // 3314
A=D+A // 3315
D=M // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=D // 3320

////ArithmeticInstruction{OR}
@SP // 3321
AM=M-1 // 3322
D=M // 3323
A=A-1 // 3324
M=D|M // 3325

////PushInstruction("constant 16384")
@16384 // 3326
D=A // 3327
@SP // 3328
AM=M+1 // 3329
A=A-1 // 3330
M=D // 3331

////PushInstruction("local 7")
@LCL // 3332
D=M // 3333
@7 // 3334
A=D+A // 3335
D=M // 3336
@SP // 3337
AM=M+1 // 3338
A=A-1 // 3339
M=D // 3340

////ArithmeticInstruction{ADD}
@SP // 3341
AM=M-1 // 3342
D=M // 3343
A=A-1 // 3344
M=D+M // 3345

////PopInstruction{address=pointer 1}
@SP // 3346
AM=M-1 // 3347
D=M // 3348
@4 // 3349
M=D // 3350

////PopInstruction{address=that 0}
@SP // 3351
AM=M-1 // 3352
D=M // 3353
@THAT // 3354
A=M // 3355
M=D // 3356

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 3357
0;JMP // 3358

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushInstruction("constant 16384")
@16384 // 3359
D=A // 3360
@SP // 3361
AM=M+1 // 3362
A=A-1 // 3363
M=D // 3364

////PushInstruction("local 7")
@LCL // 3365
D=M // 3366
@7 // 3367
A=D+A // 3368
D=M // 3369
@SP // 3370
AM=M+1 // 3371
A=A-1 // 3372
M=D // 3373

////ArithmeticInstruction{ADD}
@SP // 3374
AM=M-1 // 3375
D=M // 3376
A=A-1 // 3377
M=D+M // 3378

////PopInstruction{address=pointer 1}
@SP // 3379
AM=M-1 // 3380
D=M // 3381
@4 // 3382
M=D // 3383

////PushInstruction("that 0")
@THAT // 3384
A=M // 3385
D=M // 3386
@SP // 3387
AM=M+1 // 3388
A=A-1 // 3389
M=D // 3390

////PushInstruction("local 6")
@LCL // 3391
D=M // 3392
@6 // 3393
A=D+A // 3394
D=M // 3395
@SP // 3396
AM=M+1 // 3397
A=A-1 // 3398
M=D // 3399

////ArithmeticInstruction{NOT}
@SP // 3400
A=M-1 // 3401
M=!M // 3402

////ArithmeticInstruction{AND}
@SP // 3403
AM=M-1 // 3404
D=M // 3405
A=A-1 // 3406
M=D&M // 3407

////PushInstruction("constant 16384")
@16384 // 3408
D=A // 3409
@SP // 3410
AM=M+1 // 3411
A=A-1 // 3412
M=D // 3413

////PushInstruction("local 7")
@LCL // 3414
D=M // 3415
@7 // 3416
A=D+A // 3417
D=M // 3418
@SP // 3419
AM=M+1 // 3420
A=A-1 // 3421
M=D // 3422

////ArithmeticInstruction{ADD}
@SP // 3423
AM=M-1 // 3424
D=M // 3425
A=A-1 // 3426
M=D+M // 3427

////PopInstruction{address=pointer 1}
@SP // 3428
AM=M-1 // 3429
D=M // 3430
@4 // 3431
M=D // 3432

////PopInstruction{address=that 0}
@SP // 3433
AM=M-1 // 3434
D=M // 3435
@THAT // 3436
A=M // 3437
M=D // 3438

////LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)

////PushInstruction("local 0")
@LCL // 3439
A=M // 3440
D=M // 3441
@SP // 3442
AM=M+1 // 3443
A=A-1 // 3444
M=D // 3445

////PushInstruction("constant 1")
@SP // 3446
AM=M+1 // 3447
A=A-1 // 3448
M=1 // 3449

////ArithmeticInstruction{ADD}
@SP // 3450
AM=M-1 // 3451
D=M // 3452
A=A-1 // 3453
M=D+M // 3454

////PopInstruction{address=local 0}
@SP // 3455
AM=M-1 // 3456
D=M // 3457
@LCL // 3458
A=M // 3459
M=D // 3460

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 3461
0;JMP // 3462

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 3463
AM=M+1 // 3464
A=A-1 // 3465
M=0 // 3466

////ReturnInstruction{}
@RETURN // 3467
0;JMP // 3468

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 3469
AM=M+1 // 3470
A=A-1 // 3471
M=0 // 3472

////PushInstruction("constant 0")
@SP // 3473
AM=M+1 // 3474
A=A-1 // 3475
M=0 // 3476

////PopInstruction{address=local 0}
@SP // 3477
AM=M-1 // 3478
D=M // 3479
@LCL // 3480
A=M // 3481
M=D // 3482

////LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)

////PushInstruction("local 0")
@LCL // 3483
A=M // 3484
D=M // 3485
@SP // 3486
AM=M+1 // 3487
A=A-1 // 3488
M=D // 3489

////PushInstruction("constant 8192")
@8192 // 3490
D=A // 3491
@SP // 3492
AM=M+1 // 3493
A=A-1 // 3494
M=D // 3495

////ArithmeticInstruction{LT}
@COMPARE_Screen.clearScreen_lt30 // 3496
D=A // 3497
@13 // 3498
M=D // 3499
@SP // 3500
AM=M-1 // 3501
D=M // 3502
A=A-1 // 3503
D=M-D // 3504
@DO_LT // 3505
0;JMP // 3506
(COMPARE_Screen.clearScreen_lt30)
@SP // 3507
A=M-1 // 3508
M=D // 3509

////PushInstruction("constant 0")
@SP // 3510
AM=M+1 // 3511
A=A-1 // 3512
M=0 // 3513

////ArithmeticInstruction{EQ}
@COMPARE_Screen.clearScreen_eq31 // 3514
D=A // 3515
@13 // 3516
M=D // 3517
@SP // 3518
AM=M-1 // 3519
D=M // 3520
A=A-1 // 3521
D=M-D // 3522
@DO_EQ // 3523
0;JMP // 3524
(COMPARE_Screen.clearScreen_eq31)
@SP // 3525
A=M-1 // 3526
M=D // 3527

////IfGotoInstruction{label='WHILE_END_Screen.clearScreen1}
// if-goto WHILE_END_Screen.clearScreen1
@SP // 3528
AM=M-1 // 3529
D=M // 3530
@WHILE_END_Screen.clearScreen1 // 3531
D;JNE // 3532

////PushInstruction("constant 0")
@SP // 3533
AM=M+1 // 3534
A=A-1 // 3535
M=0 // 3536

////PushInstruction("constant 16384")
@16384 // 3537
D=A // 3538
@SP // 3539
AM=M+1 // 3540
A=A-1 // 3541
M=D // 3542

////PushInstruction("local 0")
@LCL // 3543
A=M // 3544
D=M // 3545
@SP // 3546
AM=M+1 // 3547
A=A-1 // 3548
M=D // 3549

////ArithmeticInstruction{ADD}
@SP // 3550
AM=M-1 // 3551
D=M // 3552
A=A-1 // 3553
M=D+M // 3554

////PopInstruction{address=pointer 1}
@SP // 3555
AM=M-1 // 3556
D=M // 3557
@4 // 3558
M=D // 3559

////PopInstruction{address=that 0}
@SP // 3560
AM=M-1 // 3561
D=M // 3562
@THAT // 3563
A=M // 3564
M=D // 3565

////PushInstruction("local 0")
@LCL // 3566
A=M // 3567
D=M // 3568
@SP // 3569
AM=M+1 // 3570
A=A-1 // 3571
M=D // 3572

////PushInstruction("constant 1")
@SP // 3573
AM=M+1 // 3574
A=A-1 // 3575
M=1 // 3576

////ArithmeticInstruction{ADD}
@SP // 3577
AM=M-1 // 3578
D=M // 3579
A=A-1 // 3580
M=D+M // 3581

////PopInstruction{address=local 0}
@SP // 3582
AM=M-1 // 3583
D=M // 3584
@LCL // 3585
A=M // 3586
M=D // 3587

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 3588
0;JMP // 3589

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 3590
AM=M+1 // 3591
A=A-1 // 3592
M=0 // 3593

////ReturnInstruction{}
@RETURN // 3594
0;JMP // 3595

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushInstruction("constant 3")
@3 // 3596
D=A // 3597
@SP // 3598
AM=M+1 // 3599
A=A-1 // 3600
M=D // 3601

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}
// call Memory.alloc
@6 // 3602
D=A // 3603
@14 // 3604
M=D // 3605
@Memory.alloc // 3606
D=A // 3607
@13 // 3608
M=D // 3609
@String.new.ret.0 // 3610
D=A // 3611
@CALL // 3612
0;JMP // 3613
(String.new.ret.0)

////PopInstruction{address=pointer 0}
@SP // 3614
AM=M-1 // 3615
D=M // 3616
@3 // 3617
M=D // 3618

////PushInstruction("argument 0")
@ARG // 3619
A=M // 3620
D=M // 3621
@SP // 3622
AM=M+1 // 3623
A=A-1 // 3624
M=D // 3625

////PushInstruction("constant 0")
@SP // 3626
AM=M+1 // 3627
A=A-1 // 3628
M=0 // 3629

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq0 // 3630
D=A // 3631
@13 // 3632
M=D // 3633
@SP // 3634
AM=M-1 // 3635
D=M // 3636
A=A-1 // 3637
D=M-D // 3638
@DO_EQ // 3639
0;JMP // 3640
(COMPARE_String.new_eq0)
@SP // 3641
A=M-1 // 3642
M=D // 3643

////PushInstruction("constant 0")
@SP // 3644
AM=M+1 // 3645
A=A-1 // 3646
M=0 // 3647

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq1 // 3648
D=A // 3649
@13 // 3650
M=D // 3651
@SP // 3652
AM=M-1 // 3653
D=M // 3654
A=A-1 // 3655
D=M-D // 3656
@DO_EQ // 3657
0;JMP // 3658
(COMPARE_String.new_eq1)
@SP // 3659
A=M-1 // 3660
M=D // 3661

////IfGotoInstruction{label='String.new.IfElse1}
// if-goto String.new.IfElse1
@SP // 3662
AM=M-1 // 3663
D=M // 3664
@String.new.IfElse1 // 3665
D;JNE // 3666

////PushInstruction("constant 0")
@SP // 3667
AM=M+1 // 3668
A=A-1 // 3669
M=0 // 3670

////PopInstruction{address=this 0}
@SP // 3671
AM=M-1 // 3672
D=M // 3673
@THIS // 3674
A=M // 3675
M=D // 3676

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 3677
0;JMP // 3678

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushInstruction("argument 0")
@ARG // 3679
A=M // 3680
D=M // 3681
@SP // 3682
AM=M+1 // 3683
A=A-1 // 3684
M=D // 3685

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}
// call Array.new
@6 // 3686
D=A // 3687
@14 // 3688
M=D // 3689
@Array.new // 3690
D=A // 3691
@13 // 3692
M=D // 3693
@String.new.ret.1 // 3694
D=A // 3695
@CALL // 3696
0;JMP // 3697
(String.new.ret.1)

////PopInstruction{address=this 0}
@SP // 3698
AM=M-1 // 3699
D=M // 3700
@THIS // 3701
A=M // 3702
M=D // 3703

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 3704
A=M // 3705
D=M // 3706
@SP // 3707
AM=M+1 // 3708
A=A-1 // 3709
M=D // 3710

////PopInstruction{address=this 2}
@SP // 3711
AM=M-1 // 3712
D=M // 3713
@THIS // 3714
A=M+1 // 3715
A=A+1 // 3716
M=D // 3717

////PushInstruction("constant 0")
@SP // 3718
AM=M+1 // 3719
A=A-1 // 3720
M=0 // 3721

////PopInstruction{address=this 1}
@SP // 3722
AM=M-1 // 3723
D=M // 3724
@THIS // 3725
A=M+1 // 3726
M=D // 3727

////PushInstruction("pointer 0")
@3 // 3728
D=M // 3729
@SP // 3730
AM=M+1 // 3731
A=A-1 // 3732
M=D // 3733

////ReturnInstruction{}
@RETURN // 3734
0;JMP // 3735

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushInstruction("argument 0")
@ARG // 3736
A=M // 3737
D=M // 3738
@SP // 3739
AM=M+1 // 3740
A=A-1 // 3741
M=D // 3742

////PopInstruction{address=pointer 0}
@SP // 3743
AM=M-1 // 3744
D=M // 3745
@3 // 3746
M=D // 3747

////PushInstruction("this 0")
@THIS // 3748
A=M // 3749
D=M // 3750
@SP // 3751
AM=M+1 // 3752
A=A-1 // 3753
M=D // 3754

////PushInstruction("constant 0")
@SP // 3755
AM=M+1 // 3756
A=A-1 // 3757
M=0 // 3758

////ArithmeticInstruction{EQ}
@COMPARE_String.dispose_eq2 // 3759
D=A // 3760
@13 // 3761
M=D // 3762
@SP // 3763
AM=M-1 // 3764
D=M // 3765
A=A-1 // 3766
D=M-D // 3767
@DO_EQ // 3768
0;JMP // 3769
(COMPARE_String.dispose_eq2)
@SP // 3770
A=M-1 // 3771
M=D // 3772

////ArithmeticInstruction{NOT}
@SP // 3773
A=M-1 // 3774
M=!M // 3775

////PushInstruction("constant 0")
@SP // 3776
AM=M+1 // 3777
A=A-1 // 3778
M=0 // 3779

////ArithmeticInstruction{EQ}
@COMPARE_String.dispose_eq3 // 3780
D=A // 3781
@13 // 3782
M=D // 3783
@SP // 3784
AM=M-1 // 3785
D=M // 3786
A=A-1 // 3787
D=M-D // 3788
@DO_EQ // 3789
0;JMP // 3790
(COMPARE_String.dispose_eq3)
@SP // 3791
A=M-1 // 3792
M=D // 3793

////IfGotoInstruction{label='String.dispose.IfElse1}
// if-goto String.dispose.IfElse1
@SP // 3794
AM=M-1 // 3795
D=M // 3796
@String.dispose.IfElse1 // 3797
D;JNE // 3798

////PushInstruction("this 0")
@THIS // 3799
A=M // 3800
D=M // 3801
@SP // 3802
AM=M+1 // 3803
A=A-1 // 3804
M=D // 3805

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}
// call Array.dispose
@6 // 3806
D=A // 3807
@14 // 3808
M=D // 3809
@Array.dispose // 3810
D=A // 3811
@13 // 3812
M=D // 3813
@String.dispose.ret.0 // 3814
D=A // 3815
@CALL // 3816
0;JMP // 3817
(String.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 3818
AM=M-1 // 3819
D=M // 3820
@5 // 3821
M=D // 3822

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 3823
0;JMP // 3824

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 3825
AM=M+1 // 3826
A=A-1 // 3827
M=0 // 3828

////ReturnInstruction{}
@RETURN // 3829
0;JMP // 3830

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushInstruction("argument 0")
@ARG // 3831
A=M // 3832
D=M // 3833
@SP // 3834
AM=M+1 // 3835
A=A-1 // 3836
M=D // 3837

////PopInstruction{address=pointer 0}
@SP // 3838
AM=M-1 // 3839
D=M // 3840
@3 // 3841
M=D // 3842

////PushInstruction("this 1")
@THIS // 3843
A=M+1 // 3844
D=M // 3845
@SP // 3846
AM=M+1 // 3847
A=A-1 // 3848
M=D // 3849

////ReturnInstruction{}
@RETURN // 3850
0;JMP // 3851

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushInstruction("argument 0")
@ARG // 3852
A=M // 3853
D=M // 3854
@SP // 3855
AM=M+1 // 3856
A=A-1 // 3857
M=D // 3858

////PopInstruction{address=pointer 0}
@SP // 3859
AM=M-1 // 3860
D=M // 3861
@3 // 3862
M=D // 3863

////PushInstruction("this 0")
@THIS // 3864
A=M // 3865
D=M // 3866
@SP // 3867
AM=M+1 // 3868
A=A-1 // 3869
M=D // 3870

////PushInstruction("argument 1")
@ARG // 3871
A=M+1 // 3872
D=M // 3873
@SP // 3874
AM=M+1 // 3875
A=A-1 // 3876
M=D // 3877

////ArithmeticInstruction{ADD}
@SP // 3878
AM=M-1 // 3879
D=M // 3880
A=A-1 // 3881
M=D+M // 3882

////PopInstruction{address=pointer 1}
@SP // 3883
AM=M-1 // 3884
D=M // 3885
@4 // 3886
M=D // 3887

////PushInstruction("that 0")
@THAT // 3888
A=M // 3889
D=M // 3890
@SP // 3891
AM=M+1 // 3892
A=A-1 // 3893
M=D // 3894

////ReturnInstruction{}
@RETURN // 3895
0;JMP // 3896

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushInstruction("argument 0")
@ARG // 3897
A=M // 3898
D=M // 3899
@SP // 3900
AM=M+1 // 3901
A=A-1 // 3902
M=D // 3903

////PopInstruction{address=pointer 0}
@SP // 3904
AM=M-1 // 3905
D=M // 3906
@3 // 3907
M=D // 3908

////PushInstruction("argument 2")
@ARG // 3909
A=M+1 // 3910
A=A+1 // 3911
D=M // 3912
@SP // 3913
AM=M+1 // 3914
A=A-1 // 3915
M=D // 3916

////PushInstruction("this 0")
@THIS // 3917
A=M // 3918
D=M // 3919
@SP // 3920
AM=M+1 // 3921
A=A-1 // 3922
M=D // 3923

////PushInstruction("argument 1")
@ARG // 3924
A=M+1 // 3925
D=M // 3926
@SP // 3927
AM=M+1 // 3928
A=A-1 // 3929
M=D // 3930

////ArithmeticInstruction{ADD}
@SP // 3931
AM=M-1 // 3932
D=M // 3933
A=A-1 // 3934
M=D+M // 3935

////PopInstruction{address=pointer 1}
@SP // 3936
AM=M-1 // 3937
D=M // 3938
@4 // 3939
M=D // 3940

////PopInstruction{address=that 0}
@SP // 3941
AM=M-1 // 3942
D=M // 3943
@THAT // 3944
A=M // 3945
M=D // 3946

////PushInstruction("constant 0")
@SP // 3947
AM=M+1 // 3948
A=A-1 // 3949
M=0 // 3950

////ReturnInstruction{}
@RETURN // 3951
0;JMP // 3952

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 3953
AM=M+1 // 3954
A=A-1 // 3955
M=0 // 3956

////PushInstruction("argument 0")
@ARG // 3957
A=M // 3958
D=M // 3959
@SP // 3960
AM=M+1 // 3961
A=A-1 // 3962
M=D // 3963

////PopInstruction{address=pointer 0}
@SP // 3964
AM=M-1 // 3965
D=M // 3966
@3 // 3967
M=D // 3968

////PushInstruction("this 1")
@THIS // 3969
A=M+1 // 3970
D=M // 3971
@SP // 3972
AM=M+1 // 3973
A=A-1 // 3974
M=D // 3975

////PushInstruction("this 2")
@THIS // 3976
A=M+1 // 3977
A=A+1 // 3978
D=M // 3979
@SP // 3980
AM=M+1 // 3981
A=A-1 // 3982
M=D // 3983

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq4 // 3984
D=A // 3985
@13 // 3986
M=D // 3987
@SP // 3988
AM=M-1 // 3989
D=M // 3990
A=A-1 // 3991
D=M-D // 3992
@DO_EQ // 3993
0;JMP // 3994
(COMPARE_String.appendChar_eq4)
@SP // 3995
A=M-1 // 3996
M=D // 3997

////PushInstruction("constant 0")
@SP // 3998
AM=M+1 // 3999
A=A-1 // 4000
M=0 // 4001

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq5 // 4002
D=A // 4003
@13 // 4004
M=D // 4005
@SP // 4006
AM=M-1 // 4007
D=M // 4008
A=A-1 // 4009
D=M-D // 4010
@DO_EQ // 4011
0;JMP // 4012
(COMPARE_String.appendChar_eq5)
@SP // 4013
A=M-1 // 4014
M=D // 4015

////IfGotoInstruction{label='String.appendChar.IfElse1}
// if-goto String.appendChar.IfElse1
@SP // 4016
AM=M-1 // 4017
D=M // 4018
@String.appendChar.IfElse1 // 4019
D;JNE // 4020

////PushInstruction("this 2")
@THIS // 4021
A=M+1 // 4022
A=A+1 // 4023
D=M // 4024
@SP // 4025
AM=M+1 // 4026
A=A-1 // 4027
M=D // 4028

////PushInstruction("this 2")
@THIS // 4029
A=M+1 // 4030
A=A+1 // 4031
D=M // 4032
@SP // 4033
AM=M+1 // 4034
A=A-1 // 4035
M=D // 4036

////ArithmeticInstruction{ADD}
@SP // 4037
AM=M-1 // 4038
D=M // 4039
A=A-1 // 4040
M=D+M // 4041

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.new
@6 // 4042
D=A // 4043
@14 // 4044
M=D // 4045
@Array.new // 4046
D=A // 4047
@13 // 4048
M=D // 4049
@String.appendChar.ret.0 // 4050
D=A // 4051
@CALL // 4052
0;JMP // 4053
(String.appendChar.ret.0)

////PopInstruction{address=local 0}
@SP // 4054
AM=M-1 // 4055
D=M // 4056
@LCL // 4057
A=M // 4058
M=D // 4059

////PushInstruction("this 0")
@THIS // 4060
A=M // 4061
D=M // 4062
@SP // 4063
AM=M+1 // 4064
A=A-1 // 4065
M=D // 4066

////PushInstruction("local 0")
@LCL // 4067
A=M // 4068
D=M // 4069
@SP // 4070
AM=M+1 // 4071
A=A-1 // 4072
M=D // 4073

////PushInstruction("this 1")
@THIS // 4074
A=M+1 // 4075
D=M // 4076
@SP // 4077
AM=M+1 // 4078
A=A-1 // 4079
M=D // 4080

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Memory.copy
@8 // 4081
D=A // 4082
@14 // 4083
M=D // 4084
@Memory.copy // 4085
D=A // 4086
@13 // 4087
M=D // 4088
@String.appendChar.ret.1 // 4089
D=A // 4090
@CALL // 4091
0;JMP // 4092
(String.appendChar.ret.1)

////PopInstruction{address=temp 0}
@SP // 4093
AM=M-1 // 4094
D=M // 4095
@5 // 4096
M=D // 4097

////PushInstruction("this 0")
@THIS // 4098
A=M // 4099
D=M // 4100
@SP // 4101
AM=M+1 // 4102
A=A-1 // 4103
M=D // 4104

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.dispose
@6 // 4105
D=A // 4106
@14 // 4107
M=D // 4108
@Array.dispose // 4109
D=A // 4110
@13 // 4111
M=D // 4112
@String.appendChar.ret.2 // 4113
D=A // 4114
@CALL // 4115
0;JMP // 4116
(String.appendChar.ret.2)

////PopInstruction{address=temp 0}
@SP // 4117
AM=M-1 // 4118
D=M // 4119
@5 // 4120
M=D // 4121

////PushInstruction("this 2")
@THIS // 4122
A=M+1 // 4123
A=A+1 // 4124
D=M // 4125
@SP // 4126
AM=M+1 // 4127
A=A-1 // 4128
M=D // 4129

////PushInstruction("this 2")
@THIS // 4130
A=M+1 // 4131
A=A+1 // 4132
D=M // 4133
@SP // 4134
AM=M+1 // 4135
A=A-1 // 4136
M=D // 4137

////ArithmeticInstruction{ADD}
@SP // 4138
AM=M-1 // 4139
D=M // 4140
A=A-1 // 4141
M=D+M // 4142

////PopInstruction{address=this 2}
@SP // 4143
AM=M-1 // 4144
D=M // 4145
@THIS // 4146
A=M+1 // 4147
A=A+1 // 4148
M=D // 4149

////PushInstruction("local 0")
@LCL // 4150
A=M // 4151
D=M // 4152
@SP // 4153
AM=M+1 // 4154
A=A-1 // 4155
M=D // 4156

////PopInstruction{address=this 0}
@SP // 4157
AM=M-1 // 4158
D=M // 4159
@THIS // 4160
A=M // 4161
M=D // 4162

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 4163
0;JMP // 4164

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4165
A=M+1 // 4166
D=M // 4167
@SP // 4168
AM=M+1 // 4169
A=A-1 // 4170
M=D // 4171

////PushInstruction("this 0")
@THIS // 4172
A=M // 4173
D=M // 4174
@SP // 4175
AM=M+1 // 4176
A=A-1 // 4177
M=D // 4178

////PushInstruction("this 1")
@THIS // 4179
A=M+1 // 4180
D=M // 4181
@SP // 4182
AM=M+1 // 4183
A=A-1 // 4184
M=D // 4185

////ArithmeticInstruction{ADD}
@SP // 4186
AM=M-1 // 4187
D=M // 4188
A=A-1 // 4189
M=D+M // 4190

////PopInstruction{address=pointer 1}
@SP // 4191
AM=M-1 // 4192
D=M // 4193
@4 // 4194
M=D // 4195

////PopInstruction{address=that 0}
@SP // 4196
AM=M-1 // 4197
D=M // 4198
@THAT // 4199
A=M // 4200
M=D // 4201

////PushInstruction("this 1")
@THIS // 4202
A=M+1 // 4203
D=M // 4204
@SP // 4205
AM=M+1 // 4206
A=A-1 // 4207
M=D // 4208

////PushInstruction("constant 1")
@SP // 4209
AM=M+1 // 4210
A=A-1 // 4211
M=1 // 4212

////ArithmeticInstruction{ADD}
@SP // 4213
AM=M-1 // 4214
D=M // 4215
A=A-1 // 4216
M=D+M // 4217

////PopInstruction{address=this 1}
@SP // 4218
AM=M-1 // 4219
D=M // 4220
@THIS // 4221
A=M+1 // 4222
M=D // 4223

////PushInstruction("pointer 0")
@3 // 4224
D=M // 4225
@SP // 4226
AM=M+1 // 4227
A=A-1 // 4228
M=D // 4229

////ReturnInstruction{}
@RETURN // 4230
0;JMP // 4231

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushInstruction("argument 0")
@ARG // 4232
A=M // 4233
D=M // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=D // 4238

////PopInstruction{address=pointer 0}
@SP // 4239
AM=M-1 // 4240
D=M // 4241
@3 // 4242
M=D // 4243

////PushInstruction("this 1")
@THIS // 4244
A=M+1 // 4245
D=M // 4246
@SP // 4247
AM=M+1 // 4248
A=A-1 // 4249
M=D // 4250

////PushInstruction("constant 1")
@SP // 4251
AM=M+1 // 4252
A=A-1 // 4253
M=1 // 4254

////ArithmeticInstruction{SUB}
@SP // 4255
AM=M-1 // 4256
D=M // 4257
A=A-1 // 4258
M=M-D // 4259

////PopInstruction{address=this 1}
@SP // 4260
AM=M-1 // 4261
D=M // 4262
@THIS // 4263
A=M+1 // 4264
M=D // 4265

////PushInstruction("constant 0")
@SP // 4266
AM=M+1 // 4267
A=A-1 // 4268
M=0 // 4269

////ReturnInstruction{}
@RETURN // 4270
0;JMP // 4271

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 4272
AM=M+1 // 4273
A=A-1 // 4274
M=0 // 4275
@SP // 4276
AM=M+1 // 4277
A=A-1 // 4278
M=0 // 4279

////PushInstruction("argument 0")
@ARG // 4280
A=M // 4281
D=M // 4282
@SP // 4283
AM=M+1 // 4284
A=A-1 // 4285
M=D // 4286

////PopInstruction{address=pointer 0}
@SP // 4287
AM=M-1 // 4288
D=M // 4289
@3 // 4290
M=D // 4291

////PushInstruction("constant 1")
@SP // 4292
AM=M+1 // 4293
A=A-1 // 4294
M=1 // 4295

////PopInstruction{address=local 1}
@SP // 4296
AM=M-1 // 4297
D=M // 4298
@LCL // 4299
A=M+1 // 4300
M=D // 4301

////PushInstruction("constant 0")
@SP // 4302
AM=M+1 // 4303
A=A-1 // 4304
M=0 // 4305

////PopInstruction{address=local 0}
@SP // 4306
AM=M-1 // 4307
D=M // 4308
@LCL // 4309
A=M // 4310
M=D // 4311

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////PushInstruction("local 1")
@LCL // 4312
A=M+1 // 4313
D=M // 4314
@SP // 4315
AM=M+1 // 4316
A=A-1 // 4317
M=D // 4318

////PushInstruction("this 1")
@THIS // 4319
A=M+1 // 4320
D=M // 4321
@SP // 4322
AM=M+1 // 4323
A=A-1 // 4324
M=D // 4325

////ArithmeticInstruction{LT}
@COMPARE_String.intValue_lt6 // 4326
D=A // 4327
@13 // 4328
M=D // 4329
@SP // 4330
AM=M-1 // 4331
D=M // 4332
A=A-1 // 4333
D=M-D // 4334
@DO_LT // 4335
0;JMP // 4336
(COMPARE_String.intValue_lt6)
@SP // 4337
A=M-1 // 4338
M=D // 4339

////PushInstruction("constant 0")
@SP // 4340
AM=M+1 // 4341
A=A-1 // 4342
M=0 // 4343

////ArithmeticInstruction{EQ}
@COMPARE_String.intValue_eq7 // 4344
D=A // 4345
@13 // 4346
M=D // 4347
@SP // 4348
AM=M-1 // 4349
D=M // 4350
A=A-1 // 4351
D=M-D // 4352
@DO_EQ // 4353
0;JMP // 4354
(COMPARE_String.intValue_eq7)
@SP // 4355
A=M-1 // 4356
M=D // 4357

////IfGotoInstruction{label='WHILE_END_String.intValue1}
// if-goto WHILE_END_String.intValue1
@SP // 4358
AM=M-1 // 4359
D=M // 4360
@WHILE_END_String.intValue1 // 4361
D;JNE // 4362

////PushInstruction("local 0")
@LCL // 4363
A=M // 4364
D=M // 4365
@SP // 4366
AM=M+1 // 4367
A=A-1 // 4368
M=D // 4369

////PushInstruction("constant 10")
@10 // 4370
D=A // 4371
@SP // 4372
AM=M+1 // 4373
A=A-1 // 4374
M=D // 4375

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}
// call Math.multiply
@7 // 4376
D=A // 4377
@14 // 4378
M=D // 4379
@Math.multiply // 4380
D=A // 4381
@13 // 4382
M=D // 4383
@String.intValue.ret.0 // 4384
D=A // 4385
@CALL // 4386
0;JMP // 4387
(String.intValue.ret.0)

////PushInstruction("this 0")
@THIS // 4388
A=M // 4389
D=M // 4390
@SP // 4391
AM=M+1 // 4392
A=A-1 // 4393
M=D // 4394

////PushInstruction("local 1")
@LCL // 4395
A=M+1 // 4396
D=M // 4397
@SP // 4398
AM=M+1 // 4399
A=A-1 // 4400
M=D // 4401

////ArithmeticInstruction{ADD}
@SP // 4402
AM=M-1 // 4403
D=M // 4404
A=A-1 // 4405
M=D+M // 4406

////PopInstruction{address=pointer 1}
@SP // 4407
AM=M-1 // 4408
D=M // 4409
@4 // 4410
M=D // 4411

////PushInstruction("that 0")
@THAT // 4412
A=M // 4413
D=M // 4414
@SP // 4415
AM=M+1 // 4416
A=A-1 // 4417
M=D // 4418

////PushInstruction("constant 48")
@48 // 4419
D=A // 4420
@SP // 4421
AM=M+1 // 4422
A=A-1 // 4423
M=D // 4424

////ArithmeticInstruction{SUB}
@SP // 4425
AM=M-1 // 4426
D=M // 4427
A=A-1 // 4428
M=M-D // 4429

////ArithmeticInstruction{ADD}
@SP // 4430
AM=M-1 // 4431
D=M // 4432
A=A-1 // 4433
M=D+M // 4434

////PopInstruction{address=local 0}
@SP // 4435
AM=M-1 // 4436
D=M // 4437
@LCL // 4438
A=M // 4439
M=D // 4440

////PushInstruction("local 1")
@LCL // 4441
A=M+1 // 4442
D=M // 4443
@SP // 4444
AM=M+1 // 4445
A=A-1 // 4446
M=D // 4447

////PushInstruction("constant 1")
@SP // 4448
AM=M+1 // 4449
A=A-1 // 4450
M=1 // 4451

////ArithmeticInstruction{ADD}
@SP // 4452
AM=M-1 // 4453
D=M // 4454
A=A-1 // 4455
M=D+M // 4456

////PopInstruction{address=local 1}
@SP // 4457
AM=M-1 // 4458
D=M // 4459
@LCL // 4460
A=M+1 // 4461
M=D // 4462

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 4463
0;JMP // 4464

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 4465
A=M // 4466
D=M // 4467
@SP // 4468
AM=M+1 // 4469
A=A-1 // 4470
M=D // 4471

////ReturnInstruction{}
@RETURN // 4472
0;JMP // 4473

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 4474
AM=M+1 // 4475
A=A-1 // 4476
M=0 // 4477
@SP // 4478
AM=M+1 // 4479
A=A-1 // 4480
M=0 // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=0 // 4485
@SP // 4486
AM=M+1 // 4487
A=A-1 // 4488
M=0 // 4489
@SP // 4490
AM=M+1 // 4491
A=A-1 // 4492
M=0 // 4493
@SP // 4494
AM=M+1 // 4495
A=A-1 // 4496
M=0 // 4497

////PushInstruction("argument 0")
@ARG // 4498
A=M // 4499
D=M // 4500
@SP // 4501
AM=M+1 // 4502
A=A-1 // 4503
M=D // 4504

////PopInstruction{address=pointer 0}
@SP // 4505
AM=M-1 // 4506
D=M // 4507
@3 // 4508
M=D // 4509

////PushInstruction("constant 0")
@SP // 4510
AM=M+1 // 4511
A=A-1 // 4512
M=0 // 4513

////PopInstruction{address=this 1}
@SP // 4514
AM=M-1 // 4515
D=M // 4516
@THIS // 4517
A=M+1 // 4518
M=D // 4519

////PushInstruction("constant 0")
@SP // 4520
AM=M+1 // 4521
A=A-1 // 4522
M=0 // 4523

////PopInstruction{address=local 4}
@LCL // 4524
D=M // 4525
@4 // 4526
A=D+A // 4527
D=A // 4528
@R13 // 4529
M=D // 4530
@SP // 4531
AM=M-1 // 4532
D=M // 4533
@R13 // 4534
A=M // 4535
M=D // 4536

////PushInstruction("argument 1")
@ARG // 4537
A=M+1 // 4538
D=M // 4539
@SP // 4540
AM=M+1 // 4541
A=A-1 // 4542
M=D // 4543

////PushInstruction("constant 0")
@SP // 4544
AM=M+1 // 4545
A=A-1 // 4546
M=0 // 4547

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq8 // 4548
D=A // 4549
@13 // 4550
M=D // 4551
@SP // 4552
AM=M-1 // 4553
D=M // 4554
A=A-1 // 4555
D=M-D // 4556
@DO_EQ // 4557
0;JMP // 4558
(COMPARE_String.setInt_eq8)
@SP // 4559
A=M-1 // 4560
M=D // 4561

////PushInstruction("constant 0")
@SP // 4562
AM=M+1 // 4563
A=A-1 // 4564
M=0 // 4565

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq9 // 4566
D=A // 4567
@13 // 4568
M=D // 4569
@SP // 4570
AM=M-1 // 4571
D=M // 4572
A=A-1 // 4573
D=M-D // 4574
@DO_EQ // 4575
0;JMP // 4576
(COMPARE_String.setInt_eq9)
@SP // 4577
A=M-1 // 4578
M=D // 4579

////IfGotoInstruction{label='String.setInt.IfElse1}
// if-goto String.setInt.IfElse1
@SP // 4580
AM=M-1 // 4581
D=M // 4582
@String.setInt.IfElse1 // 4583
D;JNE // 4584

////PushInstruction("pointer 0")
@3 // 4585
D=M // 4586
@SP // 4587
AM=M+1 // 4588
A=A-1 // 4589
M=D // 4590

////PushInstruction("constant 48")
@48 // 4591
D=A // 4592
@SP // 4593
AM=M+1 // 4594
A=A-1 // 4595
M=D // 4596

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4597
D=A // 4598
@14 // 4599
M=D // 4600
@String.appendChar // 4601
D=A // 4602
@13 // 4603
M=D // 4604
@String.setInt.ret.0 // 4605
D=A // 4606
@CALL // 4607
0;JMP // 4608
(String.setInt.ret.0)

////PopInstruction{address=temp 0}
@SP // 4609
AM=M-1 // 4610
D=M // 4611
@5 // 4612
M=D // 4613

////PushInstruction("constant 0")
@SP // 4614
AM=M+1 // 4615
A=A-1 // 4616
M=0 // 4617

////ReturnInstruction{}
@RETURN // 4618
0;JMP // 4619

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 4620
0;JMP // 4621

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4622
A=M+1 // 4623
D=M // 4624
@SP // 4625
AM=M+1 // 4626
A=A-1 // 4627
M=D // 4628

////PushInstruction("constant 0")
@SP // 4629
AM=M+1 // 4630
A=A-1 // 4631
M=0 // 4632

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt10 // 4633
D=A // 4634
@13 // 4635
M=D // 4636
@SP // 4637
AM=M-1 // 4638
D=M // 4639
A=A-1 // 4640
D=M-D // 4641
@DO_LT // 4642
0;JMP // 4643
(COMPARE_String.setInt_lt10)
@SP // 4644
A=M-1 // 4645
M=D // 4646

////PushInstruction("constant 0")
@SP // 4647
AM=M+1 // 4648
A=A-1 // 4649
M=0 // 4650

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq11 // 4651
D=A // 4652
@13 // 4653
M=D // 4654
@SP // 4655
AM=M-1 // 4656
D=M // 4657
A=A-1 // 4658
D=M-D // 4659
@DO_EQ // 4660
0;JMP // 4661
(COMPARE_String.setInt_eq11)
@SP // 4662
A=M-1 // 4663
M=D // 4664

////IfGotoInstruction{label='String.setInt.IfElse2}
// if-goto String.setInt.IfElse2
@SP // 4665
AM=M-1 // 4666
D=M // 4667
@String.setInt.IfElse2 // 4668
D;JNE // 4669

////PushInstruction("constant 1")
@SP // 4670
AM=M+1 // 4671
A=A-1 // 4672
M=1 // 4673

////PopInstruction{address=local 4}
@LCL // 4674
D=M // 4675
@4 // 4676
A=D+A // 4677
D=A // 4678
@R13 // 4679
M=D // 4680
@SP // 4681
AM=M-1 // 4682
D=M // 4683
@R13 // 4684
A=M // 4685
M=D // 4686

////PushInstruction("argument 1")
@ARG // 4687
A=M+1 // 4688
D=M // 4689
@SP // 4690
AM=M+1 // 4691
A=A-1 // 4692
M=D // 4693

////PushInstruction("constant 0")
@SP // 4694
AM=M+1 // 4695
A=A-1 // 4696
M=0 // 4697

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt12 // 4698
D=A // 4699
@13 // 4700
M=D // 4701
@SP // 4702
AM=M-1 // 4703
D=M // 4704
A=A-1 // 4705
D=M-D // 4706
@DO_LT // 4707
0;JMP // 4708
(COMPARE_String.setInt_lt12)
@SP // 4709
A=M-1 // 4710
M=D // 4711

////PushInstruction("argument 1")
@ARG // 4712
A=M+1 // 4713
D=M // 4714
@SP // 4715
AM=M+1 // 4716
A=A-1 // 4717
M=D // 4718

////PushInstruction("constant 32767")
@32767 // 4719
D=A // 4720
@SP // 4721
AM=M+1 // 4722
A=A-1 // 4723
M=D // 4724

////ArithmeticInstruction{AND}
@SP // 4725
AM=M-1 // 4726
D=M // 4727
A=A-1 // 4728
M=D&M // 4729

////PushInstruction("constant 32767")
@32767 // 4730
D=A // 4731
@SP // 4732
AM=M+1 // 4733
A=A-1 // 4734
M=D // 4735

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq13 // 4736
D=A // 4737
@13 // 4738
M=D // 4739
@SP // 4740
AM=M-1 // 4741
D=M // 4742
A=A-1 // 4743
D=M-D // 4744
@DO_EQ // 4745
0;JMP // 4746
(COMPARE_String.setInt_eq13)
@SP // 4747
A=M-1 // 4748
M=D // 4749

////ArithmeticInstruction{AND}
@SP // 4750
AM=M-1 // 4751
D=M // 4752
A=A-1 // 4753
M=D&M // 4754

////PushInstruction("constant 0")
@SP // 4755
AM=M+1 // 4756
A=A-1 // 4757
M=0 // 4758

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq14 // 4759
D=A // 4760
@13 // 4761
M=D // 4762
@SP // 4763
AM=M-1 // 4764
D=M // 4765
A=A-1 // 4766
D=M-D // 4767
@DO_EQ // 4768
0;JMP // 4769
(COMPARE_String.setInt_eq14)
@SP // 4770
A=M-1 // 4771
M=D // 4772

////IfGotoInstruction{label='String.setInt.IfElse3}
// if-goto String.setInt.IfElse3
@SP // 4773
AM=M-1 // 4774
D=M // 4775
@String.setInt.IfElse3 // 4776
D;JNE // 4777

////PushInstruction("pointer 0")
@3 // 4778
D=M // 4779
@SP // 4780
AM=M+1 // 4781
A=A-1 // 4782
M=D // 4783

////PushInstruction("constant 45")
@45 // 4784
D=A // 4785
@SP // 4786
AM=M+1 // 4787
A=A-1 // 4788
M=D // 4789

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4790
D=A // 4791
@14 // 4792
M=D // 4793
@String.appendChar // 4794
D=A // 4795
@13 // 4796
M=D // 4797
@String.setInt.ret.1 // 4798
D=A // 4799
@CALL // 4800
0;JMP // 4801
(String.setInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 4802
AM=M-1 // 4803
D=M // 4804
@5 // 4805
M=D // 4806

////PushInstruction("pointer 0")
@3 // 4807
D=M // 4808
@SP // 4809
AM=M+1 // 4810
A=A-1 // 4811
M=D // 4812

////PushInstruction("constant 51")
@51 // 4813
D=A // 4814
@SP // 4815
AM=M+1 // 4816
A=A-1 // 4817
M=D // 4818

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4819
D=A // 4820
@14 // 4821
M=D // 4822
@String.appendChar // 4823
D=A // 4824
@13 // 4825
M=D // 4826
@String.setInt.ret.2 // 4827
D=A // 4828
@CALL // 4829
0;JMP // 4830
(String.setInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 4831
AM=M-1 // 4832
D=M // 4833
@5 // 4834
M=D // 4835

////PushInstruction("pointer 0")
@3 // 4836
D=M // 4837
@SP // 4838
AM=M+1 // 4839
A=A-1 // 4840
M=D // 4841

////PushInstruction("constant 50")
@50 // 4842
D=A // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4848
D=A // 4849
@14 // 4850
M=D // 4851
@String.appendChar // 4852
D=A // 4853
@13 // 4854
M=D // 4855
@String.setInt.ret.3 // 4856
D=A // 4857
@CALL // 4858
0;JMP // 4859
(String.setInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 4860
AM=M-1 // 4861
D=M // 4862
@5 // 4863
M=D // 4864

////PushInstruction("pointer 0")
@3 // 4865
D=M // 4866
@SP // 4867
AM=M+1 // 4868
A=A-1 // 4869
M=D // 4870

////PushInstruction("constant 55")
@55 // 4871
D=A // 4872
@SP // 4873
AM=M+1 // 4874
A=A-1 // 4875
M=D // 4876

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=4, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4877
D=A // 4878
@14 // 4879
M=D // 4880
@String.appendChar // 4881
D=A // 4882
@13 // 4883
M=D // 4884
@String.setInt.ret.4 // 4885
D=A // 4886
@CALL // 4887
0;JMP // 4888
(String.setInt.ret.4)

////PopInstruction{address=temp 0}
@SP // 4889
AM=M-1 // 4890
D=M // 4891
@5 // 4892
M=D // 4893

////PushInstruction("pointer 0")
@3 // 4894
D=M // 4895
@SP // 4896
AM=M+1 // 4897
A=A-1 // 4898
M=D // 4899

////PushInstruction("constant 54")
@54 // 4900
D=A // 4901
@SP // 4902
AM=M+1 // 4903
A=A-1 // 4904
M=D // 4905

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=5, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4906
D=A // 4907
@14 // 4908
M=D // 4909
@String.appendChar // 4910
D=A // 4911
@13 // 4912
M=D // 4913
@String.setInt.ret.5 // 4914
D=A // 4915
@CALL // 4916
0;JMP // 4917
(String.setInt.ret.5)

////PopInstruction{address=temp 0}
@SP // 4918
AM=M-1 // 4919
D=M // 4920
@5 // 4921
M=D // 4922

////PushInstruction("pointer 0")
@3 // 4923
D=M // 4924
@SP // 4925
AM=M+1 // 4926
A=A-1 // 4927
M=D // 4928

////PushInstruction("constant 56")
@56 // 4929
D=A // 4930
@SP // 4931
AM=M+1 // 4932
A=A-1 // 4933
M=D // 4934

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=6, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4935
D=A // 4936
@14 // 4937
M=D // 4938
@String.appendChar // 4939
D=A // 4940
@13 // 4941
M=D // 4942
@String.setInt.ret.6 // 4943
D=A // 4944
@CALL // 4945
0;JMP // 4946
(String.setInt.ret.6)

////PopInstruction{address=temp 0}
@SP // 4947
AM=M-1 // 4948
D=M // 4949
@5 // 4950
M=D // 4951

////PushInstruction("constant 0")
@SP // 4952
AM=M+1 // 4953
A=A-1 // 4954
M=0 // 4955

////ReturnInstruction{}
@RETURN // 4956
0;JMP // 4957

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 4958
0;JMP // 4959

////LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 4960
A=M+1 // 4961
D=M // 4962
@SP // 4963
AM=M+1 // 4964
A=A-1 // 4965
M=D // 4966

////ArithmeticInstruction{NEG}
@SP // 4967
A=M-1 // 4968
M=-M // 4969

////PopInstruction{address=argument 1}
@SP // 4970
AM=M-1 // 4971
D=M // 4972
@ARG // 4973
A=M+1 // 4974
M=D // 4975

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 4976
0;JMP // 4977

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 4978
A=M+1 // 4979
D=M // 4980
@SP // 4981
AM=M+1 // 4982
A=A-1 // 4983
M=D // 4984

////PopInstruction{address=local 2}
@SP // 4985
AM=M-1 // 4986
D=M // 4987
@LCL // 4988
A=M+1 // 4989
A=A+1 // 4990
M=D // 4991

////PushInstruction("constant 0")
@SP // 4992
AM=M+1 // 4993
A=A-1 // 4994
M=0 // 4995

////PopInstruction{address=local 3}
@SP // 4996
AM=M-1 // 4997
D=M // 4998
@LCL // 4999
A=M+1 // 5000
A=A+1 // 5001
A=A+1 // 5002
M=D // 5003

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////PushInstruction("local 2")
@LCL // 5004
A=M+1 // 5005
A=A+1 // 5006
D=M // 5007
@SP // 5008
AM=M+1 // 5009
A=A-1 // 5010
M=D // 5011

////PushInstruction("constant 0")
@SP // 5012
AM=M+1 // 5013
A=A-1 // 5014
M=0 // 5015

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt15 // 5016
D=A // 5017
@13 // 5018
M=D // 5019
@SP // 5020
AM=M-1 // 5021
D=M // 5022
A=A-1 // 5023
D=M-D // 5024
@DO_GT // 5025
0;JMP // 5026
(COMPARE_String.setInt_gt15)
@SP // 5027
A=M-1 // 5028
M=D // 5029

////PushInstruction("constant 0")
@SP // 5030
AM=M+1 // 5031
A=A-1 // 5032
M=0 // 5033

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq16 // 5034
D=A // 5035
@13 // 5036
M=D // 5037
@SP // 5038
AM=M-1 // 5039
D=M // 5040
A=A-1 // 5041
D=M-D // 5042
@DO_EQ // 5043
0;JMP // 5044
(COMPARE_String.setInt_eq16)
@SP // 5045
A=M-1 // 5046
M=D // 5047

////IfGotoInstruction{label='WHILE_END_String.setInt1}
// if-goto WHILE_END_String.setInt1
@SP // 5048
AM=M-1 // 5049
D=M // 5050
@WHILE_END_String.setInt1 // 5051
D;JNE // 5052

////PushInstruction("local 2")
@LCL // 5053
A=M+1 // 5054
A=A+1 // 5055
D=M // 5056
@SP // 5057
AM=M+1 // 5058
A=A-1 // 5059
M=D // 5060

////PushInstruction("constant 10")
@10 // 5061
D=A // 5062
@SP // 5063
AM=M+1 // 5064
A=A-1 // 5065
M=D // 5066

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5067
D=A // 5068
@14 // 5069
M=D // 5070
@Math.divide // 5071
D=A // 5072
@13 // 5073
M=D // 5074
@String.setInt.ret.7 // 5075
D=A // 5076
@CALL // 5077
0;JMP // 5078
(String.setInt.ret.7)

////PopInstruction{address=local 2}
@SP // 5079
AM=M-1 // 5080
D=M // 5081
@LCL // 5082
A=M+1 // 5083
A=A+1 // 5084
M=D // 5085

////PushInstruction("local 3")
@LCL // 5086
A=M+1 // 5087
A=A+1 // 5088
A=A+1 // 5089
D=M // 5090
@SP // 5091
AM=M+1 // 5092
A=A-1 // 5093
M=D // 5094

////PushInstruction("constant 1")
@SP // 5095
AM=M+1 // 5096
A=A-1 // 5097
M=1 // 5098

////ArithmeticInstruction{ADD}
@SP // 5099
AM=M-1 // 5100
D=M // 5101
A=A-1 // 5102
M=D+M // 5103

////PopInstruction{address=local 3}
@SP // 5104
AM=M-1 // 5105
D=M // 5106
@LCL // 5107
A=M+1 // 5108
A=A+1 // 5109
A=A+1 // 5110
M=D // 5111

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 5112
0;JMP // 5113

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushInstruction("local 3")
@LCL // 5114
A=M+1 // 5115
A=A+1 // 5116
A=A+1 // 5117
D=M // 5118
@SP // 5119
AM=M+1 // 5120
A=A-1 // 5121
M=D // 5122

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.new
@6 // 5123
D=A // 5124
@14 // 5125
M=D // 5126
@Array.new // 5127
D=A // 5128
@13 // 5129
M=D // 5130
@String.setInt.ret.8 // 5131
D=A // 5132
@CALL // 5133
0;JMP // 5134
(String.setInt.ret.8)

////PopInstruction{address=local 5}
@LCL // 5135
D=M // 5136
@5 // 5137
A=D+A // 5138
D=A // 5139
@R13 // 5140
M=D // 5141
@SP // 5142
AM=M-1 // 5143
D=M // 5144
@R13 // 5145
A=M // 5146
M=D // 5147

////PushInstruction("constant 0")
@SP // 5148
AM=M+1 // 5149
A=A-1 // 5150
M=0 // 5151

////PopInstruction{address=local 1}
@SP // 5152
AM=M-1 // 5153
D=M // 5154
@LCL // 5155
A=M+1 // 5156
M=D // 5157

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////PushInstruction("argument 1")
@ARG // 5158
A=M+1 // 5159
D=M // 5160
@SP // 5161
AM=M+1 // 5162
A=A-1 // 5163
M=D // 5164

////PushInstruction("constant 0")
@SP // 5165
AM=M+1 // 5166
A=A-1 // 5167
M=0 // 5168

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt17 // 5169
D=A // 5170
@13 // 5171
M=D // 5172
@SP // 5173
AM=M-1 // 5174
D=M // 5175
A=A-1 // 5176
D=M-D // 5177
@DO_GT // 5178
0;JMP // 5179
(COMPARE_String.setInt_gt17)
@SP // 5180
A=M-1 // 5181
M=D // 5182

////PushInstruction("constant 0")
@SP // 5183
AM=M+1 // 5184
A=A-1 // 5185
M=0 // 5186

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq18 // 5187
D=A // 5188
@13 // 5189
M=D // 5190
@SP // 5191
AM=M-1 // 5192
D=M // 5193
A=A-1 // 5194
D=M-D // 5195
@DO_EQ // 5196
0;JMP // 5197
(COMPARE_String.setInt_eq18)
@SP // 5198
A=M-1 // 5199
M=D // 5200

////IfGotoInstruction{label='WHILE_END_String.setInt2}
// if-goto WHILE_END_String.setInt2
@SP // 5201
AM=M-1 // 5202
D=M // 5203
@WHILE_END_String.setInt2 // 5204
D;JNE // 5205

////PushInstruction("argument 1")
@ARG // 5206
A=M+1 // 5207
D=M // 5208
@SP // 5209
AM=M+1 // 5210
A=A-1 // 5211
M=D // 5212

////PushInstruction("argument 1")
@ARG // 5213
A=M+1 // 5214
D=M // 5215
@SP // 5216
AM=M+1 // 5217
A=A-1 // 5218
M=D // 5219

////PushInstruction("constant 10")
@10 // 5220
D=A // 5221
@SP // 5222
AM=M+1 // 5223
A=A-1 // 5224
M=D // 5225

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5226
D=A // 5227
@14 // 5228
M=D // 5229
@Math.divide // 5230
D=A // 5231
@13 // 5232
M=D // 5233
@String.setInt.ret.9 // 5234
D=A // 5235
@CALL // 5236
0;JMP // 5237
(String.setInt.ret.9)

////PushInstruction("constant 10")
@10 // 5238
D=A // 5239
@SP // 5240
AM=M+1 // 5241
A=A-1 // 5242
M=D // 5243

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=10, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.multiply
@7 // 5244
D=A // 5245
@14 // 5246
M=D // 5247
@Math.multiply // 5248
D=A // 5249
@13 // 5250
M=D // 5251
@String.setInt.ret.10 // 5252
D=A // 5253
@CALL // 5254
0;JMP // 5255
(String.setInt.ret.10)

////ArithmeticInstruction{SUB}
@SP // 5256
AM=M-1 // 5257
D=M // 5258
A=A-1 // 5259
M=M-D // 5260

////PopInstruction{address=local 0}
@SP // 5261
AM=M-1 // 5262
D=M // 5263
@LCL // 5264
A=M // 5265
M=D // 5266

////PushInstruction("local 0")
@LCL // 5267
A=M // 5268
D=M // 5269
@SP // 5270
AM=M+1 // 5271
A=A-1 // 5272
M=D // 5273

////PushInstruction("constant 48")
@48 // 5274
D=A // 5275
@SP // 5276
AM=M+1 // 5277
A=A-1 // 5278
M=D // 5279

////ArithmeticInstruction{ADD}
@SP // 5280
AM=M-1 // 5281
D=M // 5282
A=A-1 // 5283
M=D+M // 5284

////PushInstruction("local 5")
@LCL // 5285
D=M // 5286
@5 // 5287
A=D+A // 5288
D=M // 5289
@SP // 5290
AM=M+1 // 5291
A=A-1 // 5292
M=D // 5293

////PushInstruction("local 1")
@LCL // 5294
A=M+1 // 5295
D=M // 5296
@SP // 5297
AM=M+1 // 5298
A=A-1 // 5299
M=D // 5300

////ArithmeticInstruction{ADD}
@SP // 5301
AM=M-1 // 5302
D=M // 5303
A=A-1 // 5304
M=D+M // 5305

////PopInstruction{address=pointer 1}
@SP // 5306
AM=M-1 // 5307
D=M // 5308
@4 // 5309
M=D // 5310

////PopInstruction{address=that 0}
@SP // 5311
AM=M-1 // 5312
D=M // 5313
@THAT // 5314
A=M // 5315
M=D // 5316

////PushInstruction("argument 1")
@ARG // 5317
A=M+1 // 5318
D=M // 5319
@SP // 5320
AM=M+1 // 5321
A=A-1 // 5322
M=D // 5323

////PushInstruction("constant 10")
@10 // 5324
D=A // 5325
@SP // 5326
AM=M+1 // 5327
A=A-1 // 5328
M=D // 5329

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5330
D=A // 5331
@14 // 5332
M=D // 5333
@Math.divide // 5334
D=A // 5335
@13 // 5336
M=D // 5337
@String.setInt.ret.11 // 5338
D=A // 5339
@CALL // 5340
0;JMP // 5341
(String.setInt.ret.11)

////PopInstruction{address=argument 1}
@SP // 5342
AM=M-1 // 5343
D=M // 5344
@ARG // 5345
A=M+1 // 5346
M=D // 5347

////PushInstruction("local 1")
@LCL // 5348
A=M+1 // 5349
D=M // 5350
@SP // 5351
AM=M+1 // 5352
A=A-1 // 5353
M=D // 5354

////PushInstruction("constant 1")
@SP // 5355
AM=M+1 // 5356
A=A-1 // 5357
M=1 // 5358

////ArithmeticInstruction{ADD}
@SP // 5359
AM=M-1 // 5360
D=M // 5361
A=A-1 // 5362
M=D+M // 5363

////PopInstruction{address=local 1}
@SP // 5364
AM=M-1 // 5365
D=M // 5366
@LCL // 5367
A=M+1 // 5368
M=D // 5369

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 5370
0;JMP // 5371

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////PushInstruction("local 4")
@LCL // 5372
D=M // 5373
@4 // 5374
A=D+A // 5375
D=M // 5376
@SP // 5377
AM=M+1 // 5378
A=A-1 // 5379
M=D // 5380

////PushInstruction("constant 1")
@SP // 5381
AM=M+1 // 5382
A=A-1 // 5383
M=1 // 5384

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq19 // 5385
D=A // 5386
@13 // 5387
M=D // 5388
@SP // 5389
AM=M-1 // 5390
D=M // 5391
A=A-1 // 5392
D=M-D // 5393
@DO_EQ // 5394
0;JMP // 5395
(COMPARE_String.setInt_eq19)
@SP // 5396
A=M-1 // 5397
M=D // 5398

////PushInstruction("constant 0")
@SP // 5399
AM=M+1 // 5400
A=A-1 // 5401
M=0 // 5402

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq20 // 5403
D=A // 5404
@13 // 5405
M=D // 5406
@SP // 5407
AM=M-1 // 5408
D=M // 5409
A=A-1 // 5410
D=M-D // 5411
@DO_EQ // 5412
0;JMP // 5413
(COMPARE_String.setInt_eq20)
@SP // 5414
A=M-1 // 5415
M=D // 5416

////IfGotoInstruction{label='String.setInt.IfElse4}
// if-goto String.setInt.IfElse4
@SP // 5417
AM=M-1 // 5418
D=M // 5419
@String.setInt.IfElse4 // 5420
D;JNE // 5421

////PushInstruction("pointer 0")
@3 // 5422
D=M // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=D // 5427

////PushInstruction("constant 45")
@45 // 5428
D=A // 5429
@SP // 5430
AM=M+1 // 5431
A=A-1 // 5432
M=D // 5433

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 5434
D=A // 5435
@14 // 5436
M=D // 5437
@String.appendChar // 5438
D=A // 5439
@13 // 5440
M=D // 5441
@String.setInt.ret.12 // 5442
D=A // 5443
@CALL // 5444
0;JMP // 5445
(String.setInt.ret.12)

////PopInstruction{address=temp 0}
@SP // 5446
AM=M-1 // 5447
D=M // 5448
@5 // 5449
M=D // 5450

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 5451
0;JMP // 5452

////LabelInstruction{label='String.setInt.IfElse4}
// label String.setInt.IfElse4
(String.setInt.IfElse4)

////LabelInstruction{label='String.setInt.IfElseEND4}
// label String.setInt.IfElseEND4
(String.setInt.IfElseEND4)

////LabelInstruction{label='WHILE_START_String.setInt3}
// label WHILE_START_String.setInt3
(WHILE_START_String.setInt3)

////PushInstruction("local 1")
@LCL // 5453
A=M+1 // 5454
D=M // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=D // 5459

////PushInstruction("constant 0")
@SP // 5460
AM=M+1 // 5461
A=A-1 // 5462
M=0 // 5463

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt21 // 5464
D=A // 5465
@13 // 5466
M=D // 5467
@SP // 5468
AM=M-1 // 5469
D=M // 5470
A=A-1 // 5471
D=M-D // 5472
@DO_GT // 5473
0;JMP // 5474
(COMPARE_String.setInt_gt21)
@SP // 5475
A=M-1 // 5476
M=D // 5477

////PushInstruction("constant 0")
@SP // 5478
AM=M+1 // 5479
A=A-1 // 5480
M=0 // 5481

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq22 // 5482
D=A // 5483
@13 // 5484
M=D // 5485
@SP // 5486
AM=M-1 // 5487
D=M // 5488
A=A-1 // 5489
D=M-D // 5490
@DO_EQ // 5491
0;JMP // 5492
(COMPARE_String.setInt_eq22)
@SP // 5493
A=M-1 // 5494
M=D // 5495

////IfGotoInstruction{label='WHILE_END_String.setInt3}
// if-goto WHILE_END_String.setInt3
@SP // 5496
AM=M-1 // 5497
D=M // 5498
@WHILE_END_String.setInt3 // 5499
D;JNE // 5500

////PushInstruction("local 1")
@LCL // 5501
A=M+1 // 5502
D=M // 5503
@SP // 5504
AM=M+1 // 5505
A=A-1 // 5506
M=D // 5507

////PushInstruction("constant 1")
@SP // 5508
AM=M+1 // 5509
A=A-1 // 5510
M=1 // 5511

////ArithmeticInstruction{SUB}
@SP // 5512
AM=M-1 // 5513
D=M // 5514
A=A-1 // 5515
M=M-D // 5516

////PopInstruction{address=local 1}
@SP // 5517
AM=M-1 // 5518
D=M // 5519
@LCL // 5520
A=M+1 // 5521
M=D // 5522

////PushInstruction("pointer 0")
@3 // 5523
D=M // 5524
@SP // 5525
AM=M+1 // 5526
A=A-1 // 5527
M=D // 5528

////PushInstruction("local 5")
@LCL // 5529
D=M // 5530
@5 // 5531
A=D+A // 5532
D=M // 5533
@SP // 5534
AM=M+1 // 5535
A=A-1 // 5536
M=D // 5537

////PushInstruction("local 1")
@LCL // 5538
A=M+1 // 5539
D=M // 5540
@SP // 5541
AM=M+1 // 5542
A=A-1 // 5543
M=D // 5544

////ArithmeticInstruction{ADD}
@SP // 5545
AM=M-1 // 5546
D=M // 5547
A=A-1 // 5548
M=D+M // 5549

////PopInstruction{address=pointer 1}
@SP // 5550
AM=M-1 // 5551
D=M // 5552
@4 // 5553
M=D // 5554

////PushInstruction("that 0")
@THAT // 5555
A=M // 5556
D=M // 5557
@SP // 5558
AM=M+1 // 5559
A=A-1 // 5560
M=D // 5561

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 5562
D=A // 5563
@14 // 5564
M=D // 5565
@String.appendChar // 5566
D=A // 5567
@13 // 5568
M=D // 5569
@String.setInt.ret.13 // 5570
D=A // 5571
@CALL // 5572
0;JMP // 5573
(String.setInt.ret.13)

////PopInstruction{address=temp 0}
@SP // 5574
AM=M-1 // 5575
D=M // 5576
@5 // 5577
M=D // 5578

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 5579
0;JMP // 5580

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushInstruction("local 5")
@LCL // 5581
D=M // 5582
@5 // 5583
A=D+A // 5584
D=M // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=D // 5589

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.dispose
@6 // 5590
D=A // 5591
@14 // 5592
M=D // 5593
@Array.dispose // 5594
D=A // 5595
@13 // 5596
M=D // 5597
@String.setInt.ret.14 // 5598
D=A // 5599
@CALL // 5600
0;JMP // 5601
(String.setInt.ret.14)

////PopInstruction{address=temp 0}
@SP // 5602
AM=M-1 // 5603
D=M // 5604
@5 // 5605
M=D // 5606

////PushInstruction("constant 0")
@SP // 5607
AM=M+1 // 5608
A=A-1 // 5609
M=0 // 5610

////ReturnInstruction{}
@RETURN // 5611
0;JMP // 5612

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 5613
D=A // 5614
@SP // 5615
AM=M+1 // 5616
A=A-1 // 5617
M=D // 5618

////ReturnInstruction{}
@RETURN // 5619
0;JMP // 5620

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 5621
D=A // 5622
@SP // 5623
AM=M+1 // 5624
A=A-1 // 5625
M=D // 5626

////ReturnInstruction{}
@RETURN // 5627
0;JMP // 5628

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 5629
D=A // 5630
@SP // 5631
AM=M+1 // 5632
A=A-1 // 5633
M=D // 5634

////ReturnInstruction{}
@RETURN // 5635
0;JMP // 5636

////FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)

////PushInstruction("constant 16")
@16 // 5637
D=A // 5638
@SP // 5639
AM=M+1 // 5640
A=A-1 // 5641
M=D // 5642

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}
// call Array.new
@6 // 5643
D=A // 5644
@14 // 5645
M=D // 5646
@Array.new // 5647
D=A // 5648
@13 // 5649
M=D // 5650
@Math.init.ret.0 // 5651
D=A // 5652
@CALL // 5653
0;JMP // 5654
(Math.init.ret.0)

////PopInstruction{address=Math.0}
@SP // 5655
AM=M-1 // 5656
D=M // 5657
@Math.0 // 5658
M=D // 5659

////PushInstruction("constant 1")
@SP // 5660
AM=M+1 // 5661
A=A-1 // 5662
M=1 // 5663

////PushInstruction("static 0")
@Math.0 // 5664
D=M // 5665
@SP // 5666
AM=M+1 // 5667
A=A-1 // 5668
M=D // 5669

////PushInstruction("constant 0")
@SP // 5670
AM=M+1 // 5671
A=A-1 // 5672
M=0 // 5673

////ArithmeticInstruction{ADD}
@SP // 5674
AM=M-1 // 5675
D=M // 5676
A=A-1 // 5677
M=D+M // 5678

////PopInstruction{address=pointer 1}
@SP // 5679
AM=M-1 // 5680
D=M // 5681
@4 // 5682
M=D // 5683

////PopInstruction{address=that 0}
@SP // 5684
AM=M-1 // 5685
D=M // 5686
@THAT // 5687
A=M // 5688
M=D // 5689

////PushInstruction("constant 2")
@2 // 5690
D=A // 5691
@SP // 5692
AM=M+1 // 5693
A=A-1 // 5694
M=D // 5695

////PushInstruction("static 0")
@Math.0 // 5696
D=M // 5697
@SP // 5698
AM=M+1 // 5699
A=A-1 // 5700
M=D // 5701

////PushInstruction("constant 1")
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=1 // 5705

////ArithmeticInstruction{ADD}
@SP // 5706
AM=M-1 // 5707
D=M // 5708
A=A-1 // 5709
M=D+M // 5710

////PopInstruction{address=pointer 1}
@SP // 5711
AM=M-1 // 5712
D=M // 5713
@4 // 5714
M=D // 5715

////PopInstruction{address=that 0}
@SP // 5716
AM=M-1 // 5717
D=M // 5718
@THAT // 5719
A=M // 5720
M=D // 5721

////PushInstruction("constant 4")
@4 // 5722
D=A // 5723
@SP // 5724
AM=M+1 // 5725
A=A-1 // 5726
M=D // 5727

////PushInstruction("static 0")
@Math.0 // 5728
D=M // 5729
@SP // 5730
AM=M+1 // 5731
A=A-1 // 5732
M=D // 5733

////PushInstruction("constant 2")
@2 // 5734
D=A // 5735
@SP // 5736
AM=M+1 // 5737
A=A-1 // 5738
M=D // 5739

////ArithmeticInstruction{ADD}
@SP // 5740
AM=M-1 // 5741
D=M // 5742
A=A-1 // 5743
M=D+M // 5744

////PopInstruction{address=pointer 1}
@SP // 5745
AM=M-1 // 5746
D=M // 5747
@4 // 5748
M=D // 5749

////PopInstruction{address=that 0}
@SP // 5750
AM=M-1 // 5751
D=M // 5752
@THAT // 5753
A=M // 5754
M=D // 5755

////PushInstruction("constant 8")
@8 // 5756
D=A // 5757
@SP // 5758
AM=M+1 // 5759
A=A-1 // 5760
M=D // 5761

////PushInstruction("static 0")
@Math.0 // 5762
D=M // 5763
@SP // 5764
AM=M+1 // 5765
A=A-1 // 5766
M=D // 5767

////PushInstruction("constant 3")
@3 // 5768
D=A // 5769
@SP // 5770
AM=M+1 // 5771
A=A-1 // 5772
M=D // 5773

////ArithmeticInstruction{ADD}
@SP // 5774
AM=M-1 // 5775
D=M // 5776
A=A-1 // 5777
M=D+M // 5778

////PopInstruction{address=pointer 1}
@SP // 5779
AM=M-1 // 5780
D=M // 5781
@4 // 5782
M=D // 5783

////PopInstruction{address=that 0}
@SP // 5784
AM=M-1 // 5785
D=M // 5786
@THAT // 5787
A=M // 5788
M=D // 5789

////PushInstruction("constant 16")
@16 // 5790
D=A // 5791
@SP // 5792
AM=M+1 // 5793
A=A-1 // 5794
M=D // 5795

////PushInstruction("static 0")
@Math.0 // 5796
D=M // 5797
@SP // 5798
AM=M+1 // 5799
A=A-1 // 5800
M=D // 5801

////PushInstruction("constant 4")
@4 // 5802
D=A // 5803
@SP // 5804
AM=M+1 // 5805
A=A-1 // 5806
M=D // 5807

////ArithmeticInstruction{ADD}
@SP // 5808
AM=M-1 // 5809
D=M // 5810
A=A-1 // 5811
M=D+M // 5812

////PopInstruction{address=pointer 1}
@SP // 5813
AM=M-1 // 5814
D=M // 5815
@4 // 5816
M=D // 5817

////PopInstruction{address=that 0}
@SP // 5818
AM=M-1 // 5819
D=M // 5820
@THAT // 5821
A=M // 5822
M=D // 5823

////PushInstruction("constant 32")
@32 // 5824
D=A // 5825
@SP // 5826
AM=M+1 // 5827
A=A-1 // 5828
M=D // 5829

////PushInstruction("static 0")
@Math.0 // 5830
D=M // 5831
@SP // 5832
AM=M+1 // 5833
A=A-1 // 5834
M=D // 5835

////PushInstruction("constant 5")
@5 // 5836
D=A // 5837
@SP // 5838
AM=M+1 // 5839
A=A-1 // 5840
M=D // 5841

////ArithmeticInstruction{ADD}
@SP // 5842
AM=M-1 // 5843
D=M // 5844
A=A-1 // 5845
M=D+M // 5846

////PopInstruction{address=pointer 1}
@SP // 5847
AM=M-1 // 5848
D=M // 5849
@4 // 5850
M=D // 5851

////PopInstruction{address=that 0}
@SP // 5852
AM=M-1 // 5853
D=M // 5854
@THAT // 5855
A=M // 5856
M=D // 5857

////PushInstruction("constant 64")
@64 // 5858
D=A // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=D // 5863

////PushInstruction("static 0")
@Math.0 // 5864
D=M // 5865
@SP // 5866
AM=M+1 // 5867
A=A-1 // 5868
M=D // 5869

////PushInstruction("constant 6")
@6 // 5870
D=A // 5871
@SP // 5872
AM=M+1 // 5873
A=A-1 // 5874
M=D // 5875

////ArithmeticInstruction{ADD}
@SP // 5876
AM=M-1 // 5877
D=M // 5878
A=A-1 // 5879
M=D+M // 5880

////PopInstruction{address=pointer 1}
@SP // 5881
AM=M-1 // 5882
D=M // 5883
@4 // 5884
M=D // 5885

////PopInstruction{address=that 0}
@SP // 5886
AM=M-1 // 5887
D=M // 5888
@THAT // 5889
A=M // 5890
M=D // 5891

////PushInstruction("constant 128")
@128 // 5892
D=A // 5893
@SP // 5894
AM=M+1 // 5895
A=A-1 // 5896
M=D // 5897

////PushInstruction("static 0")
@Math.0 // 5898
D=M // 5899
@SP // 5900
AM=M+1 // 5901
A=A-1 // 5902
M=D // 5903

////PushInstruction("constant 7")
@7 // 5904
D=A // 5905
@SP // 5906
AM=M+1 // 5907
A=A-1 // 5908
M=D // 5909

////ArithmeticInstruction{ADD}
@SP // 5910
AM=M-1 // 5911
D=M // 5912
A=A-1 // 5913
M=D+M // 5914

////PopInstruction{address=pointer 1}
@SP // 5915
AM=M-1 // 5916
D=M // 5917
@4 // 5918
M=D // 5919

////PopInstruction{address=that 0}
@SP // 5920
AM=M-1 // 5921
D=M // 5922
@THAT // 5923
A=M // 5924
M=D // 5925

////PushInstruction("constant 256")
@256 // 5926
D=A // 5927
@SP // 5928
AM=M+1 // 5929
A=A-1 // 5930
M=D // 5931

////PushInstruction("static 0")
@Math.0 // 5932
D=M // 5933
@SP // 5934
AM=M+1 // 5935
A=A-1 // 5936
M=D // 5937

////PushInstruction("constant 8")
@8 // 5938
D=A // 5939
@SP // 5940
AM=M+1 // 5941
A=A-1 // 5942
M=D // 5943

////ArithmeticInstruction{ADD}
@SP // 5944
AM=M-1 // 5945
D=M // 5946
A=A-1 // 5947
M=D+M // 5948

////PopInstruction{address=pointer 1}
@SP // 5949
AM=M-1 // 5950
D=M // 5951
@4 // 5952
M=D // 5953

////PopInstruction{address=that 0}
@SP // 5954
AM=M-1 // 5955
D=M // 5956
@THAT // 5957
A=M // 5958
M=D // 5959

////PushInstruction("constant 512")
@512 // 5960
D=A // 5961
@SP // 5962
AM=M+1 // 5963
A=A-1 // 5964
M=D // 5965

////PushInstruction("static 0")
@Math.0 // 5966
D=M // 5967
@SP // 5968
AM=M+1 // 5969
A=A-1 // 5970
M=D // 5971

////PushInstruction("constant 9")
@9 // 5972
D=A // 5973
@SP // 5974
AM=M+1 // 5975
A=A-1 // 5976
M=D // 5977

////ArithmeticInstruction{ADD}
@SP // 5978
AM=M-1 // 5979
D=M // 5980
A=A-1 // 5981
M=D+M // 5982

////PopInstruction{address=pointer 1}
@SP // 5983
AM=M-1 // 5984
D=M // 5985
@4 // 5986
M=D // 5987

////PopInstruction{address=that 0}
@SP // 5988
AM=M-1 // 5989
D=M // 5990
@THAT // 5991
A=M // 5992
M=D // 5993

////PushInstruction("constant 1024")
@1024 // 5994
D=A // 5995
@SP // 5996
AM=M+1 // 5997
A=A-1 // 5998
M=D // 5999

////PushInstruction("static 0")
@Math.0 // 6000
D=M // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=D // 6005

////PushInstruction("constant 10")
@10 // 6006
D=A // 6007
@SP // 6008
AM=M+1 // 6009
A=A-1 // 6010
M=D // 6011

////ArithmeticInstruction{ADD}
@SP // 6012
AM=M-1 // 6013
D=M // 6014
A=A-1 // 6015
M=D+M // 6016

////PopInstruction{address=pointer 1}
@SP // 6017
AM=M-1 // 6018
D=M // 6019
@4 // 6020
M=D // 6021

////PopInstruction{address=that 0}
@SP // 6022
AM=M-1 // 6023
D=M // 6024
@THAT // 6025
A=M // 6026
M=D // 6027

////PushInstruction("constant 2048")
@2048 // 6028
D=A // 6029
@SP // 6030
AM=M+1 // 6031
A=A-1 // 6032
M=D // 6033

////PushInstruction("static 0")
@Math.0 // 6034
D=M // 6035
@SP // 6036
AM=M+1 // 6037
A=A-1 // 6038
M=D // 6039

////PushInstruction("constant 11")
@11 // 6040
D=A // 6041
@SP // 6042
AM=M+1 // 6043
A=A-1 // 6044
M=D // 6045

////ArithmeticInstruction{ADD}
@SP // 6046
AM=M-1 // 6047
D=M // 6048
A=A-1 // 6049
M=D+M // 6050

////PopInstruction{address=pointer 1}
@SP // 6051
AM=M-1 // 6052
D=M // 6053
@4 // 6054
M=D // 6055

////PopInstruction{address=that 0}
@SP // 6056
AM=M-1 // 6057
D=M // 6058
@THAT // 6059
A=M // 6060
M=D // 6061

////PushInstruction("constant 4096")
@4096 // 6062
D=A // 6063
@SP // 6064
AM=M+1 // 6065
A=A-1 // 6066
M=D // 6067

////PushInstruction("static 0")
@Math.0 // 6068
D=M // 6069
@SP // 6070
AM=M+1 // 6071
A=A-1 // 6072
M=D // 6073

////PushInstruction("constant 12")
@12 // 6074
D=A // 6075
@SP // 6076
AM=M+1 // 6077
A=A-1 // 6078
M=D // 6079

////ArithmeticInstruction{ADD}
@SP // 6080
AM=M-1 // 6081
D=M // 6082
A=A-1 // 6083
M=D+M // 6084

////PopInstruction{address=pointer 1}
@SP // 6085
AM=M-1 // 6086
D=M // 6087
@4 // 6088
M=D // 6089

////PopInstruction{address=that 0}
@SP // 6090
AM=M-1 // 6091
D=M // 6092
@THAT // 6093
A=M // 6094
M=D // 6095

////PushInstruction("constant 8192")
@8192 // 6096
D=A // 6097
@SP // 6098
AM=M+1 // 6099
A=A-1 // 6100
M=D // 6101

////PushInstruction("static 0")
@Math.0 // 6102
D=M // 6103
@SP // 6104
AM=M+1 // 6105
A=A-1 // 6106
M=D // 6107

////PushInstruction("constant 13")
@13 // 6108
D=A // 6109
@SP // 6110
AM=M+1 // 6111
A=A-1 // 6112
M=D // 6113

////ArithmeticInstruction{ADD}
@SP // 6114
AM=M-1 // 6115
D=M // 6116
A=A-1 // 6117
M=D+M // 6118

////PopInstruction{address=pointer 1}
@SP // 6119
AM=M-1 // 6120
D=M // 6121
@4 // 6122
M=D // 6123

////PopInstruction{address=that 0}
@SP // 6124
AM=M-1 // 6125
D=M // 6126
@THAT // 6127
A=M // 6128
M=D // 6129

////PushInstruction("constant 16384")
@16384 // 6130
D=A // 6131
@SP // 6132
AM=M+1 // 6133
A=A-1 // 6134
M=D // 6135

////PushInstruction("static 0")
@Math.0 // 6136
D=M // 6137
@SP // 6138
AM=M+1 // 6139
A=A-1 // 6140
M=D // 6141

////PushInstruction("constant 14")
@14 // 6142
D=A // 6143
@SP // 6144
AM=M+1 // 6145
A=A-1 // 6146
M=D // 6147

////ArithmeticInstruction{ADD}
@SP // 6148
AM=M-1 // 6149
D=M // 6150
A=A-1 // 6151
M=D+M // 6152

////PopInstruction{address=pointer 1}
@SP // 6153
AM=M-1 // 6154
D=M // 6155
@4 // 6156
M=D // 6157

////PopInstruction{address=that 0}
@SP // 6158
AM=M-1 // 6159
D=M // 6160
@THAT // 6161
A=M // 6162
M=D // 6163

////PushInstruction("constant 16384")
@16384 // 6164
D=A // 6165
@SP // 6166
AM=M+1 // 6167
A=A-1 // 6168
M=D // 6169

////PushInstruction("constant 16384")
@16384 // 6170
D=A // 6171
@SP // 6172
AM=M+1 // 6173
A=A-1 // 6174
M=D // 6175

////ArithmeticInstruction{ADD}
@SP // 6176
AM=M-1 // 6177
D=M // 6178
A=A-1 // 6179
M=D+M // 6180

////PushInstruction("static 0")
@Math.0 // 6181
D=M // 6182
@SP // 6183
AM=M+1 // 6184
A=A-1 // 6185
M=D // 6186

////PushInstruction("constant 15")
@15 // 6187
D=A // 6188
@SP // 6189
AM=M+1 // 6190
A=A-1 // 6191
M=D // 6192

////ArithmeticInstruction{ADD}
@SP // 6193
AM=M-1 // 6194
D=M // 6195
A=A-1 // 6196
M=D+M // 6197

////PopInstruction{address=pointer 1}
@SP // 6198
AM=M-1 // 6199
D=M // 6200
@4 // 6201
M=D // 6202

////PopInstruction{address=that 0}
@SP // 6203
AM=M-1 // 6204
D=M // 6205
@THAT // 6206
A=M // 6207
M=D // 6208

////PushInstruction("constant 0")
@SP // 6209
AM=M+1 // 6210
A=A-1 // 6211
M=0 // 6212

////ReturnInstruction{}
@RETURN // 6213
0;JMP // 6214

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////PushInstruction("argument 0")
@ARG // 6215
A=M // 6216
D=M // 6217
@SP // 6218
AM=M+1 // 6219
A=A-1 // 6220
M=D // 6221

////PushInstruction("static 0")
@Math.0 // 6222
D=M // 6223
@SP // 6224
AM=M+1 // 6225
A=A-1 // 6226
M=D // 6227

////PushInstruction("argument 1")
@ARG // 6228
A=M+1 // 6229
D=M // 6230
@SP // 6231
AM=M+1 // 6232
A=A-1 // 6233
M=D // 6234

////ArithmeticInstruction{ADD}
@SP // 6235
AM=M-1 // 6236
D=M // 6237
A=A-1 // 6238
M=D+M // 6239

////PopInstruction{address=pointer 1}
@SP // 6240
AM=M-1 // 6241
D=M // 6242
@4 // 6243
M=D // 6244

////PushInstruction("that 0")
@THAT // 6245
A=M // 6246
D=M // 6247
@SP // 6248
AM=M+1 // 6249
A=A-1 // 6250
M=D // 6251

////ArithmeticInstruction{AND}
@SP // 6252
AM=M-1 // 6253
D=M // 6254
A=A-1 // 6255
M=D&M // 6256

////ReturnInstruction{}
@RETURN // 6257
0;JMP // 6258

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 6259
AM=M+1 // 6260
A=A-1 // 6261
M=0 // 6262
@SP // 6263
AM=M+1 // 6264
A=A-1 // 6265
M=0 // 6266
@SP // 6267
AM=M+1 // 6268
A=A-1 // 6269
M=0 // 6270

////PushInstruction("argument 0")
@ARG // 6271
A=M // 6272
D=M // 6273
@SP // 6274
AM=M+1 // 6275
A=A-1 // 6276
M=D // 6277

////PushInstruction("constant 0")
@SP // 6278
AM=M+1 // 6279
A=A-1 // 6280
M=0 // 6281

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq0 // 6282
D=A // 6283
@13 // 6284
M=D // 6285
@SP // 6286
AM=M-1 // 6287
D=M // 6288
A=A-1 // 6289
D=M-D // 6290
@DO_EQ // 6291
0;JMP // 6292
(COMPARE_Math.multiply_eq0)
@SP // 6293
A=M-1 // 6294
M=D // 6295

////PushInstruction("argument 1")
@ARG // 6296
A=M+1 // 6297
D=M // 6298
@SP // 6299
AM=M+1 // 6300
A=A-1 // 6301
M=D // 6302

////PushInstruction("constant 0")
@SP // 6303
AM=M+1 // 6304
A=A-1 // 6305
M=0 // 6306

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq1 // 6307
D=A // 6308
@13 // 6309
M=D // 6310
@SP // 6311
AM=M-1 // 6312
D=M // 6313
A=A-1 // 6314
D=M-D // 6315
@DO_EQ // 6316
0;JMP // 6317
(COMPARE_Math.multiply_eq1)
@SP // 6318
A=M-1 // 6319
M=D // 6320

////ArithmeticInstruction{OR}
@SP // 6321
AM=M-1 // 6322
D=M // 6323
A=A-1 // 6324
M=D|M // 6325

////PushInstruction("constant 0")
@SP // 6326
AM=M+1 // 6327
A=A-1 // 6328
M=0 // 6329

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq2 // 6330
D=A // 6331
@13 // 6332
M=D // 6333
@SP // 6334
AM=M-1 // 6335
D=M // 6336
A=A-1 // 6337
D=M-D // 6338
@DO_EQ // 6339
0;JMP // 6340
(COMPARE_Math.multiply_eq2)
@SP // 6341
A=M-1 // 6342
M=D // 6343

////IfGotoInstruction{label='Math.multiply.IfElse1}
// if-goto Math.multiply.IfElse1
@SP // 6344
AM=M-1 // 6345
D=M // 6346
@Math.multiply.IfElse1 // 6347
D;JNE // 6348

////PushInstruction("constant 0")
@SP // 6349
AM=M+1 // 6350
A=A-1 // 6351
M=0 // 6352

////ReturnInstruction{}
@RETURN // 6353
0;JMP // 6354

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 6355
0;JMP // 6356

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 6357
A=M // 6358
D=M // 6359
@SP // 6360
AM=M+1 // 6361
A=A-1 // 6362
M=D // 6363

////PushInstruction("constant 1")
@SP // 6364
AM=M+1 // 6365
A=A-1 // 6366
M=1 // 6367

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq3 // 6368
D=A // 6369
@13 // 6370
M=D // 6371
@SP // 6372
AM=M-1 // 6373
D=M // 6374
A=A-1 // 6375
D=M-D // 6376
@DO_EQ // 6377
0;JMP // 6378
(COMPARE_Math.multiply_eq3)
@SP // 6379
A=M-1 // 6380
M=D // 6381

////PushInstruction("constant 0")
@SP // 6382
AM=M+1 // 6383
A=A-1 // 6384
M=0 // 6385

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq4 // 6386
D=A // 6387
@13 // 6388
M=D // 6389
@SP // 6390
AM=M-1 // 6391
D=M // 6392
A=A-1 // 6393
D=M-D // 6394
@DO_EQ // 6395
0;JMP // 6396
(COMPARE_Math.multiply_eq4)
@SP // 6397
A=M-1 // 6398
M=D // 6399

////IfGotoInstruction{label='Math.multiply.IfElse2}
// if-goto Math.multiply.IfElse2
@SP // 6400
AM=M-1 // 6401
D=M // 6402
@Math.multiply.IfElse2 // 6403
D;JNE // 6404

////PushInstruction("argument 1")
@ARG // 6405
A=M+1 // 6406
D=M // 6407
@SP // 6408
AM=M+1 // 6409
A=A-1 // 6410
M=D // 6411

////ReturnInstruction{}
@RETURN // 6412
0;JMP // 6413

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 6414
0;JMP // 6415

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 6416
A=M+1 // 6417
D=M // 6418
@SP // 6419
AM=M+1 // 6420
A=A-1 // 6421
M=D // 6422

////PushInstruction("constant 1")
@SP // 6423
AM=M+1 // 6424
A=A-1 // 6425
M=1 // 6426

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq5 // 6427
D=A // 6428
@13 // 6429
M=D // 6430
@SP // 6431
AM=M-1 // 6432
D=M // 6433
A=A-1 // 6434
D=M-D // 6435
@DO_EQ // 6436
0;JMP // 6437
(COMPARE_Math.multiply_eq5)
@SP // 6438
A=M-1 // 6439
M=D // 6440

////PushInstruction("constant 0")
@SP // 6441
AM=M+1 // 6442
A=A-1 // 6443
M=0 // 6444

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq6 // 6445
D=A // 6446
@13 // 6447
M=D // 6448
@SP // 6449
AM=M-1 // 6450
D=M // 6451
A=A-1 // 6452
D=M-D // 6453
@DO_EQ // 6454
0;JMP // 6455
(COMPARE_Math.multiply_eq6)
@SP // 6456
A=M-1 // 6457
M=D // 6458

////IfGotoInstruction{label='Math.multiply.IfElse3}
// if-goto Math.multiply.IfElse3
@SP // 6459
AM=M-1 // 6460
D=M // 6461
@Math.multiply.IfElse3 // 6462
D;JNE // 6463

////PushInstruction("argument 0")
@ARG // 6464
A=M // 6465
D=M // 6466
@SP // 6467
AM=M+1 // 6468
A=A-1 // 6469
M=D // 6470

////ReturnInstruction{}
@RETURN // 6471
0;JMP // 6472

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 6473
0;JMP // 6474

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 6475
A=M // 6476
D=M // 6477
@SP // 6478
AM=M+1 // 6479
A=A-1 // 6480
M=D // 6481

////PushInstruction("constant 2")
@2 // 6482
D=A // 6483
@SP // 6484
AM=M+1 // 6485
A=A-1 // 6486
M=D // 6487

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq7 // 6488
D=A // 6489
@13 // 6490
M=D // 6491
@SP // 6492
AM=M-1 // 6493
D=M // 6494
A=A-1 // 6495
D=M-D // 6496
@DO_EQ // 6497
0;JMP // 6498
(COMPARE_Math.multiply_eq7)
@SP // 6499
A=M-1 // 6500
M=D // 6501

////PushInstruction("constant 0")
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=0 // 6505

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq8 // 6506
D=A // 6507
@13 // 6508
M=D // 6509
@SP // 6510
AM=M-1 // 6511
D=M // 6512
A=A-1 // 6513
D=M-D // 6514
@DO_EQ // 6515
0;JMP // 6516
(COMPARE_Math.multiply_eq8)
@SP // 6517
A=M-1 // 6518
M=D // 6519

////IfGotoInstruction{label='Math.multiply.IfElse4}
// if-goto Math.multiply.IfElse4
@SP // 6520
AM=M-1 // 6521
D=M // 6522
@Math.multiply.IfElse4 // 6523
D;JNE // 6524

////PushInstruction("argument 1")
@ARG // 6525
A=M+1 // 6526
D=M // 6527
@SP // 6528
AM=M+1 // 6529
A=A-1 // 6530
M=D // 6531

////PushInstruction("argument 1")
@ARG // 6532
A=M+1 // 6533
D=M // 6534
@SP // 6535
AM=M+1 // 6536
A=A-1 // 6537
M=D // 6538

////ArithmeticInstruction{ADD}
@SP // 6539
AM=M-1 // 6540
D=M // 6541
A=A-1 // 6542
M=D+M // 6543

////ReturnInstruction{}
@RETURN // 6544
0;JMP // 6545

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 6546
0;JMP // 6547

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////PushInstruction("argument 1")
@ARG // 6548
A=M+1 // 6549
D=M // 6550
@SP // 6551
AM=M+1 // 6552
A=A-1 // 6553
M=D // 6554

////PushInstruction("constant 2")
@2 // 6555
D=A // 6556
@SP // 6557
AM=M+1 // 6558
A=A-1 // 6559
M=D // 6560

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq9 // 6561
D=A // 6562
@13 // 6563
M=D // 6564
@SP // 6565
AM=M-1 // 6566
D=M // 6567
A=A-1 // 6568
D=M-D // 6569
@DO_EQ // 6570
0;JMP // 6571
(COMPARE_Math.multiply_eq9)
@SP // 6572
A=M-1 // 6573
M=D // 6574

////PushInstruction("constant 0")
@SP // 6575
AM=M+1 // 6576
A=A-1 // 6577
M=0 // 6578

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq10 // 6579
D=A // 6580
@13 // 6581
M=D // 6582
@SP // 6583
AM=M-1 // 6584
D=M // 6585
A=A-1 // 6586
D=M-D // 6587
@DO_EQ // 6588
0;JMP // 6589
(COMPARE_Math.multiply_eq10)
@SP // 6590
A=M-1 // 6591
M=D // 6592

////IfGotoInstruction{label='Math.multiply.IfElse5}
// if-goto Math.multiply.IfElse5
@SP // 6593
AM=M-1 // 6594
D=M // 6595
@Math.multiply.IfElse5 // 6596
D;JNE // 6597

////PushInstruction("argument 0")
@ARG // 6598
A=M // 6599
D=M // 6600
@SP // 6601
AM=M+1 // 6602
A=A-1 // 6603
M=D // 6604

////PushInstruction("argument 0")
@ARG // 6605
A=M // 6606
D=M // 6607
@SP // 6608
AM=M+1 // 6609
A=A-1 // 6610
M=D // 6611

////ArithmeticInstruction{ADD}
@SP // 6612
AM=M-1 // 6613
D=M // 6614
A=A-1 // 6615
M=D+M // 6616

////ReturnInstruction{}
@RETURN // 6617
0;JMP // 6618

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 6619
0;JMP // 6620

////LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushInstruction("constant 1")
@SP // 6621
AM=M+1 // 6622
A=A-1 // 6623
M=1 // 6624

////PopInstruction{address=local 2}
@SP // 6625
AM=M-1 // 6626
D=M // 6627
@LCL // 6628
A=M+1 // 6629
A=A+1 // 6630
M=D // 6631

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////PushInstruction("local 1")
@LCL // 6632
A=M+1 // 6633
D=M // 6634
@SP // 6635
AM=M+1 // 6636
A=A-1 // 6637
M=D // 6638

////PushInstruction("constant 16")
@16 // 6639
D=A // 6640
@SP // 6641
AM=M+1 // 6642
A=A-1 // 6643
M=D // 6644

////ArithmeticInstruction{LT}
@COMPARE_Math.multiply_lt11 // 6645
D=A // 6646
@13 // 6647
M=D // 6648
@SP // 6649
AM=M-1 // 6650
D=M // 6651
A=A-1 // 6652
D=M-D // 6653
@DO_LT // 6654
0;JMP // 6655
(COMPARE_Math.multiply_lt11)
@SP // 6656
A=M-1 // 6657
M=D // 6658

////PushInstruction("constant 0")
@SP // 6659
AM=M+1 // 6660
A=A-1 // 6661
M=0 // 6662

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq12 // 6663
D=A // 6664
@13 // 6665
M=D // 6666
@SP // 6667
AM=M-1 // 6668
D=M // 6669
A=A-1 // 6670
D=M-D // 6671
@DO_EQ // 6672
0;JMP // 6673
(COMPARE_Math.multiply_eq12)
@SP // 6674
A=M-1 // 6675
M=D // 6676

////IfGotoInstruction{label='WHILE_END_Math.multiply1}
// if-goto WHILE_END_Math.multiply1
@SP // 6677
AM=M-1 // 6678
D=M // 6679
@WHILE_END_Math.multiply1 // 6680
D;JNE // 6681

////PushInstruction("argument 1")
@ARG // 6682
A=M+1 // 6683
D=M // 6684
@SP // 6685
AM=M+1 // 6686
A=A-1 // 6687
M=D // 6688

////PushInstruction("local 2")
@LCL // 6689
A=M+1 // 6690
A=A+1 // 6691
D=M // 6692
@SP // 6693
AM=M+1 // 6694
A=A-1 // 6695
M=D // 6696

////ArithmeticInstruction{AND}
@SP // 6697
AM=M-1 // 6698
D=M // 6699
A=A-1 // 6700
M=D&M // 6701

////PushInstruction("constant 0")
@SP // 6702
AM=M+1 // 6703
A=A-1 // 6704
M=0 // 6705

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq13 // 6706
D=A // 6707
@13 // 6708
M=D // 6709
@SP // 6710
AM=M-1 // 6711
D=M // 6712
A=A-1 // 6713
D=M-D // 6714
@DO_EQ // 6715
0;JMP // 6716
(COMPARE_Math.multiply_eq13)
@SP // 6717
A=M-1 // 6718
M=D // 6719

////IfGotoInstruction{label='Math.multiply.IfElse6}
// if-goto Math.multiply.IfElse6
@SP // 6720
AM=M-1 // 6721
D=M // 6722
@Math.multiply.IfElse6 // 6723
D;JNE // 6724

////PushInstruction("local 0")
@LCL // 6725
A=M // 6726
D=M // 6727
@SP // 6728
AM=M+1 // 6729
A=A-1 // 6730
M=D // 6731

////PushInstruction("argument 0")
@ARG // 6732
A=M // 6733
D=M // 6734
@SP // 6735
AM=M+1 // 6736
A=A-1 // 6737
M=D // 6738

////ArithmeticInstruction{ADD}
@SP // 6739
AM=M-1 // 6740
D=M // 6741
A=A-1 // 6742
M=D+M // 6743

////PopInstruction{address=local 0}
@SP // 6744
AM=M-1 // 6745
D=M // 6746
@LCL // 6747
A=M // 6748
M=D // 6749

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 6750
0;JMP // 6751

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushInstruction("argument 0")
@ARG // 6752
A=M // 6753
D=M // 6754
@SP // 6755
AM=M+1 // 6756
A=A-1 // 6757
M=D // 6758

////PushInstruction("argument 0")
@ARG // 6759
A=M // 6760
D=M // 6761
@SP // 6762
AM=M+1 // 6763
A=A-1 // 6764
M=D // 6765

////ArithmeticInstruction{ADD}
@SP // 6766
AM=M-1 // 6767
D=M // 6768
A=A-1 // 6769
M=D+M // 6770

////PopInstruction{address=argument 0}
@SP // 6771
AM=M-1 // 6772
D=M // 6773
@ARG // 6774
A=M // 6775
M=D // 6776

////PushInstruction("local 1")
@LCL // 6777
A=M+1 // 6778
D=M // 6779
@SP // 6780
AM=M+1 // 6781
A=A-1 // 6782
M=D // 6783

////PushInstruction("constant 1")
@SP // 6784
AM=M+1 // 6785
A=A-1 // 6786
M=1 // 6787

////ArithmeticInstruction{ADD}
@SP // 6788
AM=M-1 // 6789
D=M // 6790
A=A-1 // 6791
M=D+M // 6792

////PopInstruction{address=local 1}
@SP // 6793
AM=M-1 // 6794
D=M // 6795
@LCL // 6796
A=M+1 // 6797
M=D // 6798

////PushInstruction("local 2")
@LCL // 6799
A=M+1 // 6800
A=A+1 // 6801
D=M // 6802
@SP // 6803
AM=M+1 // 6804
A=A-1 // 6805
M=D // 6806

////PushInstruction("local 2")
@LCL // 6807
A=M+1 // 6808
A=A+1 // 6809
D=M // 6810
@SP // 6811
AM=M+1 // 6812
A=A-1 // 6813
M=D // 6814

////ArithmeticInstruction{ADD}
@SP // 6815
AM=M-1 // 6816
D=M // 6817
A=A-1 // 6818
M=D+M // 6819

////PopInstruction{address=local 2}
@SP // 6820
AM=M-1 // 6821
D=M // 6822
@LCL // 6823
A=M+1 // 6824
A=A+1 // 6825
M=D // 6826

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 6827
0;JMP // 6828

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 6829
A=M // 6830
D=M // 6831
@SP // 6832
AM=M+1 // 6833
A=A-1 // 6834
M=D // 6835

////ReturnInstruction{}
@RETURN // 6836
0;JMP // 6837

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 6838
AM=M+1 // 6839
A=A-1 // 6840
M=0 // 6841
@SP // 6842
AM=M+1 // 6843
A=A-1 // 6844
M=0 // 6845
@SP // 6846
AM=M+1 // 6847
A=A-1 // 6848
M=0 // 6849

////PushInstruction("argument 0")
@ARG // 6850
A=M // 6851
D=M // 6852
@SP // 6853
AM=M+1 // 6854
A=A-1 // 6855
M=D // 6856

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 6857
D=A // 6858
@14 // 6859
M=D // 6860
@Math.abs // 6861
D=A // 6862
@13 // 6863
M=D // 6864
@Math.divide.ret.0 // 6865
D=A // 6866
@CALL // 6867
0;JMP // 6868
(Math.divide.ret.0)

////PopInstruction{address=local 2}
@SP // 6869
AM=M-1 // 6870
D=M // 6871
@LCL // 6872
A=M+1 // 6873
A=A+1 // 6874
M=D // 6875

////PushInstruction("argument 1")
@ARG // 6876
A=M+1 // 6877
D=M // 6878
@SP // 6879
AM=M+1 // 6880
A=A-1 // 6881
M=D // 6882

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 6883
D=A // 6884
@14 // 6885
M=D // 6886
@Math.abs // 6887
D=A // 6888
@13 // 6889
M=D // 6890
@Math.divide.ret.1 // 6891
D=A // 6892
@CALL // 6893
0;JMP // 6894
(Math.divide.ret.1)

////PopInstruction{address=local 1}
@SP // 6895
AM=M-1 // 6896
D=M // 6897
@LCL // 6898
A=M+1 // 6899
M=D // 6900

////PushInstruction("argument 0")
@ARG // 6901
A=M // 6902
D=M // 6903
@SP // 6904
AM=M+1 // 6905
A=A-1 // 6906
M=D // 6907

////PushInstruction("constant 0")
@SP // 6908
AM=M+1 // 6909
A=A-1 // 6910
M=0 // 6911

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq14 // 6912
D=A // 6913
@13 // 6914
M=D // 6915
@SP // 6916
AM=M-1 // 6917
D=M // 6918
A=A-1 // 6919
D=M-D // 6920
@DO_EQ // 6921
0;JMP // 6922
(COMPARE_Math.divide_eq14)
@SP // 6923
A=M-1 // 6924
M=D // 6925

////PushInstruction("local 1")
@LCL // 6926
A=M+1 // 6927
D=M // 6928
@SP // 6929
AM=M+1 // 6930
A=A-1 // 6931
M=D // 6932

////PushInstruction("local 2")
@LCL // 6933
A=M+1 // 6934
A=A+1 // 6935
D=M // 6936
@SP // 6937
AM=M+1 // 6938
A=A-1 // 6939
M=D // 6940

////ArithmeticInstruction{GT}
@COMPARE_Math.divide_gt15 // 6941
D=A // 6942
@13 // 6943
M=D // 6944
@SP // 6945
AM=M-1 // 6946
D=M // 6947
A=A-1 // 6948
D=M-D // 6949
@DO_GT // 6950
0;JMP // 6951
(COMPARE_Math.divide_gt15)
@SP // 6952
A=M-1 // 6953
M=D // 6954

////ArithmeticInstruction{OR}
@SP // 6955
AM=M-1 // 6956
D=M // 6957
A=A-1 // 6958
M=D|M // 6959

////PushInstruction("constant 0")
@SP // 6960
AM=M+1 // 6961
A=A-1 // 6962
M=0 // 6963

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq16 // 6964
D=A // 6965
@13 // 6966
M=D // 6967
@SP // 6968
AM=M-1 // 6969
D=M // 6970
A=A-1 // 6971
D=M-D // 6972
@DO_EQ // 6973
0;JMP // 6974
(COMPARE_Math.divide_eq16)
@SP // 6975
A=M-1 // 6976
M=D // 6977

////IfGotoInstruction{label='Math.divide.IfElse1}
// if-goto Math.divide.IfElse1
@SP // 6978
AM=M-1 // 6979
D=M // 6980
@Math.divide.IfElse1 // 6981
D;JNE // 6982

////PushInstruction("constant 0")
@SP // 6983
AM=M+1 // 6984
A=A-1 // 6985
M=0 // 6986

////ReturnInstruction{}
@RETURN // 6987
0;JMP // 6988

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 6989
0;JMP // 6990

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 6991
A=M // 6992
D=M // 6993
@SP // 6994
AM=M+1 // 6995
A=A-1 // 6996
M=D // 6997

////PushInstruction("argument 1")
@ARG // 6998
A=M+1 // 6999
D=M // 7000
@SP // 7001
AM=M+1 // 7002
A=A-1 // 7003
M=D // 7004

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq17 // 7005
D=A // 7006
@13 // 7007
M=D // 7008
@SP // 7009
AM=M-1 // 7010
D=M // 7011
A=A-1 // 7012
D=M-D // 7013
@DO_EQ // 7014
0;JMP // 7015
(COMPARE_Math.divide_eq17)
@SP // 7016
A=M-1 // 7017
M=D // 7018

////PushInstruction("constant 0")
@SP // 7019
AM=M+1 // 7020
A=A-1 // 7021
M=0 // 7022

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq18 // 7023
D=A // 7024
@13 // 7025
M=D // 7026
@SP // 7027
AM=M-1 // 7028
D=M // 7029
A=A-1 // 7030
D=M-D // 7031
@DO_EQ // 7032
0;JMP // 7033
(COMPARE_Math.divide_eq18)
@SP // 7034
A=M-1 // 7035
M=D // 7036

////IfGotoInstruction{label='Math.divide.IfElse2}
// if-goto Math.divide.IfElse2
@SP // 7037
AM=M-1 // 7038
D=M // 7039
@Math.divide.IfElse2 // 7040
D;JNE // 7041

////PushInstruction("constant 1")
@SP // 7042
AM=M+1 // 7043
A=A-1 // 7044
M=1 // 7045

////ReturnInstruction{}
@RETURN // 7046
0;JMP // 7047

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 7048
0;JMP // 7049

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////PushInstruction("argument 0")
@ARG // 7050
A=M // 7051
D=M // 7052
@SP // 7053
AM=M+1 // 7054
A=A-1 // 7055
M=D // 7056

////PushInstruction("constant 0")
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=0 // 7060

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt19 // 7061
D=A // 7062
@13 // 7063
M=D // 7064
@SP // 7065
AM=M-1 // 7066
D=M // 7067
A=A-1 // 7068
D=M-D // 7069
@DO_LT // 7070
0;JMP // 7071
(COMPARE_Math.divide_lt19)
@SP // 7072
A=M-1 // 7073
M=D // 7074

////PushInstruction("argument 1")
@ARG // 7075
A=M+1 // 7076
D=M // 7077
@SP // 7078
AM=M+1 // 7079
A=A-1 // 7080
M=D // 7081

////PushInstruction("constant 0")
@SP // 7082
AM=M+1 // 7083
A=A-1 // 7084
M=0 // 7085

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt20 // 7086
D=A // 7087
@13 // 7088
M=D // 7089
@SP // 7090
AM=M-1 // 7091
D=M // 7092
A=A-1 // 7093
D=M-D // 7094
@DO_LT // 7095
0;JMP // 7096
(COMPARE_Math.divide_lt20)
@SP // 7097
A=M-1 // 7098
M=D // 7099

////ArithmeticInstruction{OR}
@SP // 7100
AM=M-1 // 7101
D=M // 7102
A=A-1 // 7103
M=D|M // 7104

////PushInstruction("constant 0")
@SP // 7105
AM=M+1 // 7106
A=A-1 // 7107
M=0 // 7108

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq21 // 7109
D=A // 7110
@13 // 7111
M=D // 7112
@SP // 7113
AM=M-1 // 7114
D=M // 7115
A=A-1 // 7116
D=M-D // 7117
@DO_EQ // 7118
0;JMP // 7119
(COMPARE_Math.divide_eq21)
@SP // 7120
A=M-1 // 7121
M=D // 7122

////IfGotoInstruction{label='Math.divide.IfElse3}
// if-goto Math.divide.IfElse3
@SP // 7123
AM=M-1 // 7124
D=M // 7125
@Math.divide.IfElse3 // 7126
D;JNE // 7127

////PushInstruction("local 2")
@LCL // 7128
A=M+1 // 7129
A=A+1 // 7130
D=M // 7131
@SP // 7132
AM=M+1 // 7133
A=A-1 // 7134
M=D // 7135

////PushInstruction("local 1")
@LCL // 7136
A=M+1 // 7137
D=M // 7138
@SP // 7139
AM=M+1 // 7140
A=A-1 // 7141
M=D // 7142

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 7143
D=A // 7144
@14 // 7145
M=D // 7146
@Math.divide // 7147
D=A // 7148
@13 // 7149
M=D // 7150
@Math.divide.ret.2 // 7151
D=A // 7152
@CALL // 7153
0;JMP // 7154
(Math.divide.ret.2)

////PopInstruction{address=local 0}
@SP // 7155
AM=M-1 // 7156
D=M // 7157
@LCL // 7158
A=M // 7159
M=D // 7160

////PushInstruction("argument 0")
@ARG // 7161
A=M // 7162
D=M // 7163
@SP // 7164
AM=M+1 // 7165
A=A-1 // 7166
M=D // 7167

////PushInstruction("constant 0")
@SP // 7168
AM=M+1 // 7169
A=A-1 // 7170
M=0 // 7171

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt22 // 7172
D=A // 7173
@13 // 7174
M=D // 7175
@SP // 7176
AM=M-1 // 7177
D=M // 7178
A=A-1 // 7179
D=M-D // 7180
@DO_LT // 7181
0;JMP // 7182
(COMPARE_Math.divide_lt22)
@SP // 7183
A=M-1 // 7184
M=D // 7185

////PushInstruction("argument 1")
@ARG // 7186
A=M+1 // 7187
D=M // 7188
@SP // 7189
AM=M+1 // 7190
A=A-1 // 7191
M=D // 7192

////PushInstruction("constant 0")
@SP // 7193
AM=M+1 // 7194
A=A-1 // 7195
M=0 // 7196

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt23 // 7197
D=A // 7198
@13 // 7199
M=D // 7200
@SP // 7201
AM=M-1 // 7202
D=M // 7203
A=A-1 // 7204
D=M-D // 7205
@DO_LT // 7206
0;JMP // 7207
(COMPARE_Math.divide_lt23)
@SP // 7208
A=M-1 // 7209
M=D // 7210

////ArithmeticInstruction{AND}
@SP // 7211
AM=M-1 // 7212
D=M // 7213
A=A-1 // 7214
M=D&M // 7215

////PushInstruction("constant 0")
@SP // 7216
AM=M+1 // 7217
A=A-1 // 7218
M=0 // 7219

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq24 // 7220
D=A // 7221
@13 // 7222
M=D // 7223
@SP // 7224
AM=M-1 // 7225
D=M // 7226
A=A-1 // 7227
D=M-D // 7228
@DO_EQ // 7229
0;JMP // 7230
(COMPARE_Math.divide_eq24)
@SP // 7231
A=M-1 // 7232
M=D // 7233

////IfGotoInstruction{label='Math.divide.IfElse4}
// if-goto Math.divide.IfElse4
@SP // 7234
AM=M-1 // 7235
D=M // 7236
@Math.divide.IfElse4 // 7237
D;JNE // 7238

////PushInstruction("local 0")
@LCL // 7239
A=M // 7240
D=M // 7241
@SP // 7242
AM=M+1 // 7243
A=A-1 // 7244
M=D // 7245

////ReturnInstruction{}
@RETURN // 7246
0;JMP // 7247

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 7248
0;JMP // 7249

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////PushInstruction("local 0")
@LCL // 7250
A=M // 7251
D=M // 7252
@SP // 7253
AM=M+1 // 7254
A=A-1 // 7255
M=D // 7256

////ArithmeticInstruction{NEG}
@SP // 7257
A=M-1 // 7258
M=-M // 7259

////ReturnInstruction{}
@RETURN // 7260
0;JMP // 7261

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 7262
0;JMP // 7263

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 7264
A=M // 7265
D=M // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270

////PushInstruction("argument 1")
@ARG // 7271
A=M+1 // 7272
D=M // 7273
@SP // 7274
AM=M+1 // 7275
A=A-1 // 7276
M=D // 7277

////PushInstruction("argument 1")
@ARG // 7278
A=M+1 // 7279
D=M // 7280
@SP // 7281
AM=M+1 // 7282
A=A-1 // 7283
M=D // 7284

////ArithmeticInstruction{ADD}
@SP // 7285
AM=M-1 // 7286
D=M // 7287
A=A-1 // 7288
M=D+M // 7289

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 7290
D=A // 7291
@14 // 7292
M=D // 7293
@Math.divide // 7294
D=A // 7295
@13 // 7296
M=D // 7297
@Math.divide.ret.3 // 7298
D=A // 7299
@CALL // 7300
0;JMP // 7301
(Math.divide.ret.3)

////PopInstruction{address=local 0}
@SP // 7302
AM=M-1 // 7303
D=M // 7304
@LCL // 7305
A=M // 7306
M=D // 7307

////PushInstruction("argument 0")
@ARG // 7308
A=M // 7309
D=M // 7310
@SP // 7311
AM=M+1 // 7312
A=A-1 // 7313
M=D // 7314

////PushInstruction("local 0")
@LCL // 7315
A=M // 7316
D=M // 7317
@SP // 7318
AM=M+1 // 7319
A=A-1 // 7320
M=D // 7321

////PushInstruction("local 0")
@LCL // 7322
A=M // 7323
D=M // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=D // 7328

////ArithmeticInstruction{ADD}
@SP // 7329
AM=M-1 // 7330
D=M // 7331
A=A-1 // 7332
M=D+M // 7333

////PushInstruction("argument 1")
@ARG // 7334
A=M+1 // 7335
D=M // 7336
@SP // 7337
AM=M+1 // 7338
A=A-1 // 7339
M=D // 7340

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.multiply
@7 // 7341
D=A // 7342
@14 // 7343
M=D // 7344
@Math.multiply // 7345
D=A // 7346
@13 // 7347
M=D // 7348
@Math.divide.ret.4 // 7349
D=A // 7350
@CALL // 7351
0;JMP // 7352
(Math.divide.ret.4)

////ArithmeticInstruction{SUB}
@SP // 7353
AM=M-1 // 7354
D=M // 7355
A=A-1 // 7356
M=M-D // 7357

////PushInstruction("argument 1")
@ARG // 7358
A=M+1 // 7359
D=M // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt25 // 7365
D=A // 7366
@13 // 7367
M=D // 7368
@SP // 7369
AM=M-1 // 7370
D=M // 7371
A=A-1 // 7372
D=M-D // 7373
@DO_LT // 7374
0;JMP // 7375
(COMPARE_Math.divide_lt25)
@SP // 7376
A=M-1 // 7377
M=D // 7378

////PushInstruction("constant 0")
@SP // 7379
AM=M+1 // 7380
A=A-1 // 7381
M=0 // 7382

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq26 // 7383
D=A // 7384
@13 // 7385
M=D // 7386
@SP // 7387
AM=M-1 // 7388
D=M // 7389
A=A-1 // 7390
D=M-D // 7391
@DO_EQ // 7392
0;JMP // 7393
(COMPARE_Math.divide_eq26)
@SP // 7394
A=M-1 // 7395
M=D // 7396

////IfGotoInstruction{label='Math.divide.IfElse5}
// if-goto Math.divide.IfElse5
@SP // 7397
AM=M-1 // 7398
D=M // 7399
@Math.divide.IfElse5 // 7400
D;JNE // 7401

////PushInstruction("local 0")
@LCL // 7402
A=M // 7403
D=M // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408

////PushInstruction("local 0")
@LCL // 7409
A=M // 7410
D=M // 7411
@SP // 7412
AM=M+1 // 7413
A=A-1 // 7414
M=D // 7415

////ArithmeticInstruction{ADD}
@SP // 7416
AM=M-1 // 7417
D=M // 7418
A=A-1 // 7419
M=D+M // 7420

////ReturnInstruction{}
@RETURN // 7421
0;JMP // 7422

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 7423
0;JMP // 7424

////LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)

////LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)

////PushInstruction("local 0")
@LCL // 7425
A=M // 7426
D=M // 7427
@SP // 7428
AM=M+1 // 7429
A=A-1 // 7430
M=D // 7431

////PushInstruction("local 0")
@LCL // 7432
A=M // 7433
D=M // 7434
@SP // 7435
AM=M+1 // 7436
A=A-1 // 7437
M=D // 7438

////ArithmeticInstruction{ADD}
@SP // 7439
AM=M-1 // 7440
D=M // 7441
A=A-1 // 7442
M=D+M // 7443

////PushInstruction("constant 1")
@SP // 7444
AM=M+1 // 7445
A=A-1 // 7446
M=1 // 7447

////ArithmeticInstruction{ADD}
@SP // 7448
AM=M-1 // 7449
D=M // 7450
A=A-1 // 7451
M=D+M // 7452

////ReturnInstruction{}
@RETURN // 7453
0;JMP // 7454

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=5, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////PushInstruction("argument 0")
@ARG // 7455
A=M // 7456
D=M // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=D // 7461

////PushInstruction("argument 0")
@ARG // 7462
A=M // 7463
D=M // 7464
@SP // 7465
AM=M+1 // 7466
A=A-1 // 7467
M=D // 7468

////PushInstruction("argument 1")
@ARG // 7469
A=M+1 // 7470
D=M // 7471
@SP // 7472
AM=M+1 // 7473
A=A-1 // 7474
M=D // 7475

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=5, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.divide
@7 // 7476
D=A // 7477
@14 // 7478
M=D // 7479
@Math.divide // 7480
D=A // 7481
@13 // 7482
M=D // 7483
@Math.mod.ret.0 // 7484
D=A // 7485
@CALL // 7486
0;JMP // 7487
(Math.mod.ret.0)

////PushInstruction("argument 1")
@ARG // 7488
A=M+1 // 7489
D=M // 7490
@SP // 7491
AM=M+1 // 7492
A=A-1 // 7493
M=D // 7494

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.multiply
@7 // 7495
D=A // 7496
@14 // 7497
M=D // 7498
@Math.multiply // 7499
D=A // 7500
@13 // 7501
M=D // 7502
@Math.mod.ret.1 // 7503
D=A // 7504
@CALL // 7505
0;JMP // 7506
(Math.mod.ret.1)

////ArithmeticInstruction{SUB}
@SP // 7507
AM=M-1 // 7508
D=M // 7509
A=A-1 // 7510
M=M-D // 7511

////ReturnInstruction{}
@RETURN // 7512
0;JMP // 7513

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////PushInstruction("static 0")
@Math.0 // 7514
D=M // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519

////PushInstruction("argument 0")
@ARG // 7520
A=M // 7521
D=M // 7522
@SP // 7523
AM=M+1 // 7524
A=A-1 // 7525
M=D // 7526

////ArithmeticInstruction{ADD}
@SP // 7527
AM=M-1 // 7528
D=M // 7529
A=A-1 // 7530
M=D+M // 7531

////PopInstruction{address=pointer 1}
@SP // 7532
AM=M-1 // 7533
D=M // 7534
@4 // 7535
M=D // 7536

////PushInstruction("that 0")
@THAT // 7537
A=M // 7538
D=M // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543

////ReturnInstruction{}
@RETURN // 7544
0;JMP // 7545

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=0 // 7549
@SP // 7550
AM=M+1 // 7551
A=A-1 // 7552
M=0 // 7553
@SP // 7554
AM=M+1 // 7555
A=A-1 // 7556
M=0 // 7557
@SP // 7558
AM=M+1 // 7559
A=A-1 // 7560
M=0 // 7561

////PushInstruction("constant 0")
@SP // 7562
AM=M+1 // 7563
A=A-1 // 7564
M=0 // 7565

////PopInstruction{address=local 0}
@SP // 7566
AM=M-1 // 7567
D=M // 7568
@LCL // 7569
A=M // 7570
M=D // 7571

////PushInstruction("constant 7")
@7 // 7572
D=A // 7573
@SP // 7574
AM=M+1 // 7575
A=A-1 // 7576
M=D // 7577

////PopInstruction{address=local 1}
@SP // 7578
AM=M-1 // 7579
D=M // 7580
@LCL // 7581
A=M+1 // 7582
M=D // 7583

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////PushInstruction("local 1")
@LCL // 7584
A=M+1 // 7585
D=M // 7586
@SP // 7587
AM=M+1 // 7588
A=A-1 // 7589
M=D // 7590

////PushInstruction("constant 0")
@SP // 7591
AM=M+1 // 7592
A=A-1 // 7593
M=0 // 7594

////ArithmeticInstruction{LT}
@COMPARE_Math.sqrt_lt27 // 7595
D=A // 7596
@13 // 7597
M=D // 7598
@SP // 7599
AM=M-1 // 7600
D=M // 7601
A=A-1 // 7602
D=M-D // 7603
@DO_LT // 7604
0;JMP // 7605
(COMPARE_Math.sqrt_lt27)
@SP // 7606
A=M-1 // 7607
M=D // 7608

////ArithmeticInstruction{NOT}
@SP // 7609
A=M-1 // 7610
M=!M // 7611

////PushInstruction("constant 0")
@SP // 7612
AM=M+1 // 7613
A=A-1 // 7614
M=0 // 7615

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq28 // 7616
D=A // 7617
@13 // 7618
M=D // 7619
@SP // 7620
AM=M-1 // 7621
D=M // 7622
A=A-1 // 7623
D=M-D // 7624
@DO_EQ // 7625
0;JMP // 7626
(COMPARE_Math.sqrt_eq28)
@SP // 7627
A=M-1 // 7628
M=D // 7629

////IfGotoInstruction{label='WHILE_END_Math.sqrt1}
// if-goto WHILE_END_Math.sqrt1
@SP // 7630
AM=M-1 // 7631
D=M // 7632
@WHILE_END_Math.sqrt1 // 7633
D;JNE // 7634

////PushInstruction("local 0")
@LCL // 7635
A=M // 7636
D=M // 7637
@SP // 7638
AM=M+1 // 7639
A=A-1 // 7640
M=D // 7641

////PushInstruction("static 0")
@Math.0 // 7642
D=M // 7643
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=D // 7647

////PushInstruction("local 1")
@LCL // 7648
A=M+1 // 7649
D=M // 7650
@SP // 7651
AM=M+1 // 7652
A=A-1 // 7653
M=D // 7654

////ArithmeticInstruction{ADD}
@SP // 7655
AM=M-1 // 7656
D=M // 7657
A=A-1 // 7658
M=D+M // 7659

////PopInstruction{address=pointer 1}
@SP // 7660
AM=M-1 // 7661
D=M // 7662
@4 // 7663
M=D // 7664

////PushInstruction("that 0")
@THAT // 7665
A=M // 7666
D=M // 7667
@SP // 7668
AM=M+1 // 7669
A=A-1 // 7670
M=D // 7671

////ArithmeticInstruction{ADD}
@SP // 7672
AM=M-1 // 7673
D=M // 7674
A=A-1 // 7675
M=D+M // 7676

////PopInstruction{address=local 2}
@SP // 7677
AM=M-1 // 7678
D=M // 7679
@LCL // 7680
A=M+1 // 7681
A=A+1 // 7682
M=D // 7683

////PushInstruction("local 2")
@LCL // 7684
A=M+1 // 7685
A=A+1 // 7686
D=M // 7687
@SP // 7688
AM=M+1 // 7689
A=A-1 // 7690
M=D // 7691

////PushInstruction("local 2")
@LCL // 7692
A=M+1 // 7693
A=A+1 // 7694
D=M // 7695
@SP // 7696
AM=M+1 // 7697
A=A-1 // 7698
M=D // 7699

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}
// call Math.multiply
@7 // 7700
D=A // 7701
@14 // 7702
M=D // 7703
@Math.multiply // 7704
D=A // 7705
@13 // 7706
M=D // 7707
@Math.sqrt.ret.0 // 7708
D=A // 7709
@CALL // 7710
0;JMP // 7711
(Math.sqrt.ret.0)

////PopInstruction{address=local 3}
@SP // 7712
AM=M-1 // 7713
D=M // 7714
@LCL // 7715
A=M+1 // 7716
A=A+1 // 7717
A=A+1 // 7718
M=D // 7719

////PushInstruction("local 3")
@LCL // 7720
A=M+1 // 7721
A=A+1 // 7722
A=A+1 // 7723
D=M // 7724
@SP // 7725
AM=M+1 // 7726
A=A-1 // 7727
M=D // 7728

////PushInstruction("argument 0")
@ARG // 7729
A=M // 7730
D=M // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=D // 7735

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt29 // 7736
D=A // 7737
@13 // 7738
M=D // 7739
@SP // 7740
AM=M-1 // 7741
D=M // 7742
A=A-1 // 7743
D=M-D // 7744
@DO_GT // 7745
0;JMP // 7746
(COMPARE_Math.sqrt_gt29)
@SP // 7747
A=M-1 // 7748
M=D // 7749

////ArithmeticInstruction{NOT}
@SP // 7750
A=M-1 // 7751
M=!M // 7752

////PushInstruction("local 3")
@LCL // 7753
A=M+1 // 7754
A=A+1 // 7755
A=A+1 // 7756
D=M // 7757
@SP // 7758
AM=M+1 // 7759
A=A-1 // 7760
M=D // 7761

////PushInstruction("constant 0")
@SP // 7762
AM=M+1 // 7763
A=A-1 // 7764
M=0 // 7765

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt30 // 7766
D=A // 7767
@13 // 7768
M=D // 7769
@SP // 7770
AM=M-1 // 7771
D=M // 7772
A=A-1 // 7773
D=M-D // 7774
@DO_GT // 7775
0;JMP // 7776
(COMPARE_Math.sqrt_gt30)
@SP // 7777
A=M-1 // 7778
M=D // 7779

////ArithmeticInstruction{AND}
@SP // 7780
AM=M-1 // 7781
D=M // 7782
A=A-1 // 7783
M=D&M // 7784

////PushInstruction("constant 0")
@SP // 7785
AM=M+1 // 7786
A=A-1 // 7787
M=0 // 7788

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq31 // 7789
D=A // 7790
@13 // 7791
M=D // 7792
@SP // 7793
AM=M-1 // 7794
D=M // 7795
A=A-1 // 7796
D=M-D // 7797
@DO_EQ // 7798
0;JMP // 7799
(COMPARE_Math.sqrt_eq31)
@SP // 7800
A=M-1 // 7801
M=D // 7802

////IfGotoInstruction{label='Math.sqrt.IfElse1}
// if-goto Math.sqrt.IfElse1
@SP // 7803
AM=M-1 // 7804
D=M // 7805
@Math.sqrt.IfElse1 // 7806
D;JNE // 7807

////PushInstruction("local 2")
@LCL // 7808
A=M+1 // 7809
A=A+1 // 7810
D=M // 7811
@SP // 7812
AM=M+1 // 7813
A=A-1 // 7814
M=D // 7815

////PopInstruction{address=local 0}
@SP // 7816
AM=M-1 // 7817
D=M // 7818
@LCL // 7819
A=M // 7820
M=D // 7821

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 7822
0;JMP // 7823

////LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)

////LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)

////PushInstruction("local 1")
@LCL // 7824
A=M+1 // 7825
D=M // 7826
@SP // 7827
AM=M+1 // 7828
A=A-1 // 7829
M=D // 7830

////PushInstruction("constant 1")
@SP // 7831
AM=M+1 // 7832
A=A-1 // 7833
M=1 // 7834

////ArithmeticInstruction{SUB}
@SP // 7835
AM=M-1 // 7836
D=M // 7837
A=A-1 // 7838
M=M-D // 7839

////PopInstruction{address=local 1}
@SP // 7840
AM=M-1 // 7841
D=M // 7842
@LCL // 7843
A=M+1 // 7844
M=D // 7845

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 7846
0;JMP // 7847

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 7848
A=M // 7849
D=M // 7850
@SP // 7851
AM=M+1 // 7852
A=A-1 // 7853
M=D // 7854

////ReturnInstruction{}
@RETURN // 7855
0;JMP // 7856

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////PushInstruction("argument 0")
@ARG // 7857
A=M // 7858
D=M // 7859
@SP // 7860
AM=M+1 // 7861
A=A-1 // 7862
M=D // 7863

////PushInstruction("argument 1")
@ARG // 7864
A=M+1 // 7865
D=M // 7866
@SP // 7867
AM=M+1 // 7868
A=A-1 // 7869
M=D // 7870

////ArithmeticInstruction{GT}
@COMPARE_Math.max_gt32 // 7871
D=A // 7872
@13 // 7873
M=D // 7874
@SP // 7875
AM=M-1 // 7876
D=M // 7877
A=A-1 // 7878
D=M-D // 7879
@DO_GT // 7880
0;JMP // 7881
(COMPARE_Math.max_gt32)
@SP // 7882
A=M-1 // 7883
M=D // 7884

////PushInstruction("constant 0")
@SP // 7885
AM=M+1 // 7886
A=A-1 // 7887
M=0 // 7888

////ArithmeticInstruction{EQ}
@COMPARE_Math.max_eq33 // 7889
D=A // 7890
@13 // 7891
M=D // 7892
@SP // 7893
AM=M-1 // 7894
D=M // 7895
A=A-1 // 7896
D=M-D // 7897
@DO_EQ // 7898
0;JMP // 7899
(COMPARE_Math.max_eq33)
@SP // 7900
A=M-1 // 7901
M=D // 7902

////IfGotoInstruction{label='Math.max.IfElse1}
// if-goto Math.max.IfElse1
@SP // 7903
AM=M-1 // 7904
D=M // 7905
@Math.max.IfElse1 // 7906
D;JNE // 7907

////PushInstruction("argument 0")
@ARG // 7908
A=M // 7909
D=M // 7910
@SP // 7911
AM=M+1 // 7912
A=A-1 // 7913
M=D // 7914

////ReturnInstruction{}
@RETURN // 7915
0;JMP // 7916

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 7917
0;JMP // 7918

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 7919
A=M+1 // 7920
D=M // 7921
@SP // 7922
AM=M+1 // 7923
A=A-1 // 7924
M=D // 7925

////ReturnInstruction{}
@RETURN // 7926
0;JMP // 7927

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////PushInstruction("argument 0")
@ARG // 7928
A=M // 7929
D=M // 7930
@SP // 7931
AM=M+1 // 7932
A=A-1 // 7933
M=D // 7934

////PushInstruction("argument 1")
@ARG // 7935
A=M+1 // 7936
D=M // 7937
@SP // 7938
AM=M+1 // 7939
A=A-1 // 7940
M=D // 7941

////ArithmeticInstruction{LT}
@COMPARE_Math.min_lt34 // 7942
D=A // 7943
@13 // 7944
M=D // 7945
@SP // 7946
AM=M-1 // 7947
D=M // 7948
A=A-1 // 7949
D=M-D // 7950
@DO_LT // 7951
0;JMP // 7952
(COMPARE_Math.min_lt34)
@SP // 7953
A=M-1 // 7954
M=D // 7955

////PushInstruction("constant 0")
@SP // 7956
AM=M+1 // 7957
A=A-1 // 7958
M=0 // 7959

////ArithmeticInstruction{EQ}
@COMPARE_Math.min_eq35 // 7960
D=A // 7961
@13 // 7962
M=D // 7963
@SP // 7964
AM=M-1 // 7965
D=M // 7966
A=A-1 // 7967
D=M-D // 7968
@DO_EQ // 7969
0;JMP // 7970
(COMPARE_Math.min_eq35)
@SP // 7971
A=M-1 // 7972
M=D // 7973

////IfGotoInstruction{label='Math.min.IfElse1}
// if-goto Math.min.IfElse1
@SP // 7974
AM=M-1 // 7975
D=M // 7976
@Math.min.IfElse1 // 7977
D;JNE // 7978

////PushInstruction("argument 0")
@ARG // 7979
A=M // 7980
D=M // 7981
@SP // 7982
AM=M+1 // 7983
A=A-1 // 7984
M=D // 7985

////ReturnInstruction{}
@RETURN // 7986
0;JMP // 7987

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 7988
0;JMP // 7989

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 7990
A=M+1 // 7991
D=M // 7992
@SP // 7993
AM=M+1 // 7994
A=A-1 // 7995
M=D // 7996

////ReturnInstruction{}
@RETURN // 7997
0;JMP // 7998

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////PushInstruction("argument 0")
@ARG // 7999
A=M // 8000
D=M // 8001
@SP // 8002
AM=M+1 // 8003
A=A-1 // 8004
M=D // 8005

////PushInstruction("argument 0")
@ARG // 8006
A=M // 8007
D=M // 8008
@SP // 8009
AM=M+1 // 8010
A=A-1 // 8011
M=D // 8012

////ArithmeticInstruction{NEG}
@SP // 8013
A=M-1 // 8014
M=-M // 8015

////CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.abs=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.abs'}
// call Math.max
@7 // 8016
D=A // 8017
@14 // 8018
M=D // 8019
@Math.max // 8020
D=A // 8021
@13 // 8022
M=D // 8023
@Math.abs.ret.0 // 8024
D=A // 8025
@CALL // 8026
0;JMP // 8027
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 8028
0;JMP // 8029

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}
// call Output.initMap
@5 // 8030
D=A // 8031
@14 // 8032
M=D // 8033
@Output.initMap // 8034
D=A // 8035
@13 // 8036
M=D // 8037
@Output.init.ret.0 // 8038
D=A // 8039
@CALL // 8040
0;JMP // 8041
(Output.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 8042
AM=M-1 // 8043
D=M // 8044
@5 // 8045
M=D // 8046

////PushInstruction("constant 0")
@SP // 8047
AM=M+1 // 8048
A=A-1 // 8049
M=0 // 8050

////PopInstruction{address=Output.1}
@SP // 8051
AM=M-1 // 8052
D=M // 8053
@Output.1 // 8054
M=D // 8055

////PushInstruction("constant 0")
@SP // 8056
AM=M+1 // 8057
A=A-1 // 8058
M=0 // 8059

////PopInstruction{address=Output.2}
@SP // 8060
AM=M-1 // 8061
D=M // 8062
@Output.2 // 8063
M=D // 8064

////PushInstruction("constant 0")
@SP // 8065
AM=M+1 // 8066
A=A-1 // 8067
M=0 // 8068

////ReturnInstruction{}
@RETURN // 8069
0;JMP // 8070

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 8071
AM=M+1 // 8072
A=A-1 // 8073
M=0 // 8074

////PushInstruction("constant 127")
@127 // 8075
D=A // 8076
@SP // 8077
AM=M+1 // 8078
A=A-1 // 8079
M=D // 8080

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}
// call Array.new
@6 // 8081
D=A // 8082
@14 // 8083
M=D // 8084
@Array.new // 8085
D=A // 8086
@13 // 8087
M=D // 8088
@Output.initMap.ret.0 // 8089
D=A // 8090
@CALL // 8091
0;JMP // 8092
(Output.initMap.ret.0)

////PopInstruction{address=Output.0}
@SP // 8093
AM=M-1 // 8094
D=M // 8095
@Output.0 // 8096
M=D // 8097

////PushInstruction("constant 0")
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=0 // 8101

////PushInstruction("constant 63")
@63 // 8102
D=A // 8103
@SP // 8104
AM=M+1 // 8105
A=A-1 // 8106
M=D // 8107

////PushInstruction("constant 63")
@63 // 8108
D=A // 8109
@SP // 8110
AM=M+1 // 8111
A=A-1 // 8112
M=D // 8113

////PushInstruction("constant 63")
@63 // 8114
D=A // 8115
@SP // 8116
AM=M+1 // 8117
A=A-1 // 8118
M=D // 8119

////PushInstruction("constant 63")
@63 // 8120
D=A // 8121
@SP // 8122
AM=M+1 // 8123
A=A-1 // 8124
M=D // 8125

////PushInstruction("constant 63")
@63 // 8126
D=A // 8127
@SP // 8128
AM=M+1 // 8129
A=A-1 // 8130
M=D // 8131

////PushInstruction("constant 63")
@63 // 8132
D=A // 8133
@SP // 8134
AM=M+1 // 8135
A=A-1 // 8136
M=D // 8137

////PushInstruction("constant 63")
@63 // 8138
D=A // 8139
@SP // 8140
AM=M+1 // 8141
A=A-1 // 8142
M=D // 8143

////PushInstruction("constant 63")
@63 // 8144
D=A // 8145
@SP // 8146
AM=M+1 // 8147
A=A-1 // 8148
M=D // 8149

////PushInstruction("constant 63")
@63 // 8150
D=A // 8151
@SP // 8152
AM=M+1 // 8153
A=A-1 // 8154
M=D // 8155

////PushInstruction("constant 0")
@SP // 8156
AM=M+1 // 8157
A=A-1 // 8158
M=0 // 8159

////PushInstruction("constant 0")
@SP // 8160
AM=M+1 // 8161
A=A-1 // 8162
M=0 // 8163

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=1}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8164
D=A // 8165
@14 // 8166
M=D // 8167
@Output.create // 8168
D=A // 8169
@13 // 8170
M=D // 8171
@Output.initMap.ret.1 // 8172
D=A // 8173
@CALL // 8174
0;JMP // 8175
(Output.initMap.ret.1)

////PopInstruction{address=temp 0}
@SP // 8176
AM=M-1 // 8177
D=M // 8178
@5 // 8179
M=D // 8180

////PushInstruction("constant 32")
@32 // 8181
D=A // 8182
@SP // 8183
AM=M+1 // 8184
A=A-1 // 8185
M=D // 8186

////PushInstruction("constant 0")
@SP // 8187
AM=M+1 // 8188
A=A-1 // 8189
M=0 // 8190

////PushInstruction("constant 0")
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=0 // 8194

////PushInstruction("constant 0")
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=0 // 8198

////PushInstruction("constant 0")
@SP // 8199
AM=M+1 // 8200
A=A-1 // 8201
M=0 // 8202

////PushInstruction("constant 0")
@SP // 8203
AM=M+1 // 8204
A=A-1 // 8205
M=0 // 8206

////PushInstruction("constant 0")
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=0 // 8210

////PushInstruction("constant 0")
@SP // 8211
AM=M+1 // 8212
A=A-1 // 8213
M=0 // 8214

////PushInstruction("constant 0")
@SP // 8215
AM=M+1 // 8216
A=A-1 // 8217
M=0 // 8218

////PushInstruction("constant 0")
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=0 // 8222

////PushInstruction("constant 0")
@SP // 8223
AM=M+1 // 8224
A=A-1 // 8225
M=0 // 8226

////PushInstruction("constant 0")
@SP // 8227
AM=M+1 // 8228
A=A-1 // 8229
M=0 // 8230

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=2}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8231
D=A // 8232
@14 // 8233
M=D // 8234
@Output.create // 8235
D=A // 8236
@13 // 8237
M=D // 8238
@Output.initMap.ret.2 // 8239
D=A // 8240
@CALL // 8241
0;JMP // 8242
(Output.initMap.ret.2)

////PopInstruction{address=temp 0}
@SP // 8243
AM=M-1 // 8244
D=M // 8245
@5 // 8246
M=D // 8247

////PushInstruction("constant 33")
@33 // 8248
D=A // 8249
@SP // 8250
AM=M+1 // 8251
A=A-1 // 8252
M=D // 8253

////PushInstruction("constant 12")
@12 // 8254
D=A // 8255
@SP // 8256
AM=M+1 // 8257
A=A-1 // 8258
M=D // 8259

////PushInstruction("constant 30")
@30 // 8260
D=A // 8261
@SP // 8262
AM=M+1 // 8263
A=A-1 // 8264
M=D // 8265

////PushInstruction("constant 30")
@30 // 8266
D=A // 8267
@SP // 8268
AM=M+1 // 8269
A=A-1 // 8270
M=D // 8271

////PushInstruction("constant 30")
@30 // 8272
D=A // 8273
@SP // 8274
AM=M+1 // 8275
A=A-1 // 8276
M=D // 8277

////PushInstruction("constant 12")
@12 // 8278
D=A // 8279
@SP // 8280
AM=M+1 // 8281
A=A-1 // 8282
M=D // 8283

////PushInstruction("constant 12")
@12 // 8284
D=A // 8285
@SP // 8286
AM=M+1 // 8287
A=A-1 // 8288
M=D // 8289

////PushInstruction("constant 0")
@SP // 8290
AM=M+1 // 8291
A=A-1 // 8292
M=0 // 8293

////PushInstruction("constant 12")
@12 // 8294
D=A // 8295
@SP // 8296
AM=M+1 // 8297
A=A-1 // 8298
M=D // 8299

////PushInstruction("constant 12")
@12 // 8300
D=A // 8301
@SP // 8302
AM=M+1 // 8303
A=A-1 // 8304
M=D // 8305

////PushInstruction("constant 0")
@SP // 8306
AM=M+1 // 8307
A=A-1 // 8308
M=0 // 8309

////PushInstruction("constant 0")
@SP // 8310
AM=M+1 // 8311
A=A-1 // 8312
M=0 // 8313

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=3}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8314
D=A // 8315
@14 // 8316
M=D // 8317
@Output.create // 8318
D=A // 8319
@13 // 8320
M=D // 8321
@Output.initMap.ret.3 // 8322
D=A // 8323
@CALL // 8324
0;JMP // 8325
(Output.initMap.ret.3)

////PopInstruction{address=temp 0}
@SP // 8326
AM=M-1 // 8327
D=M // 8328
@5 // 8329
M=D // 8330

////PushInstruction("constant 34")
@34 // 8331
D=A // 8332
@SP // 8333
AM=M+1 // 8334
A=A-1 // 8335
M=D // 8336

////PushInstruction("constant 54")
@54 // 8337
D=A // 8338
@SP // 8339
AM=M+1 // 8340
A=A-1 // 8341
M=D // 8342

////PushInstruction("constant 54")
@54 // 8343
D=A // 8344
@SP // 8345
AM=M+1 // 8346
A=A-1 // 8347
M=D // 8348

////PushInstruction("constant 20")
@20 // 8349
D=A // 8350
@SP // 8351
AM=M+1 // 8352
A=A-1 // 8353
M=D // 8354

////PushInstruction("constant 0")
@SP // 8355
AM=M+1 // 8356
A=A-1 // 8357
M=0 // 8358

////PushInstruction("constant 0")
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=0 // 8362

////PushInstruction("constant 0")
@SP // 8363
AM=M+1 // 8364
A=A-1 // 8365
M=0 // 8366

////PushInstruction("constant 0")
@SP // 8367
AM=M+1 // 8368
A=A-1 // 8369
M=0 // 8370

////PushInstruction("constant 0")
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=0 // 8374

////PushInstruction("constant 0")
@SP // 8375
AM=M+1 // 8376
A=A-1 // 8377
M=0 // 8378

////PushInstruction("constant 0")
@SP // 8379
AM=M+1 // 8380
A=A-1 // 8381
M=0 // 8382

////PushInstruction("constant 0")
@SP // 8383
AM=M+1 // 8384
A=A-1 // 8385
M=0 // 8386

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=4}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8387
D=A // 8388
@14 // 8389
M=D // 8390
@Output.create // 8391
D=A // 8392
@13 // 8393
M=D // 8394
@Output.initMap.ret.4 // 8395
D=A // 8396
@CALL // 8397
0;JMP // 8398
(Output.initMap.ret.4)

////PopInstruction{address=temp 0}
@SP // 8399
AM=M-1 // 8400
D=M // 8401
@5 // 8402
M=D // 8403

////PushInstruction("constant 35")
@35 // 8404
D=A // 8405
@SP // 8406
AM=M+1 // 8407
A=A-1 // 8408
M=D // 8409

////PushInstruction("constant 0")
@SP // 8410
AM=M+1 // 8411
A=A-1 // 8412
M=0 // 8413

////PushInstruction("constant 18")
@18 // 8414
D=A // 8415
@SP // 8416
AM=M+1 // 8417
A=A-1 // 8418
M=D // 8419

////PushInstruction("constant 18")
@18 // 8420
D=A // 8421
@SP // 8422
AM=M+1 // 8423
A=A-1 // 8424
M=D // 8425

////PushInstruction("constant 63")
@63 // 8426
D=A // 8427
@SP // 8428
AM=M+1 // 8429
A=A-1 // 8430
M=D // 8431

////PushInstruction("constant 18")
@18 // 8432
D=A // 8433
@SP // 8434
AM=M+1 // 8435
A=A-1 // 8436
M=D // 8437

////PushInstruction("constant 18")
@18 // 8438
D=A // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=D // 8443

////PushInstruction("constant 63")
@63 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449

////PushInstruction("constant 18")
@18 // 8450
D=A // 8451
@SP // 8452
AM=M+1 // 8453
A=A-1 // 8454
M=D // 8455

////PushInstruction("constant 18")
@18 // 8456
D=A // 8457
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=D // 8461

////PushInstruction("constant 0")
@SP // 8462
AM=M+1 // 8463
A=A-1 // 8464
M=0 // 8465

////PushInstruction("constant 0")
@SP // 8466
AM=M+1 // 8467
A=A-1 // 8468
M=0 // 8469

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=5}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8470
D=A // 8471
@14 // 8472
M=D // 8473
@Output.create // 8474
D=A // 8475
@13 // 8476
M=D // 8477
@Output.initMap.ret.5 // 8478
D=A // 8479
@CALL // 8480
0;JMP // 8481
(Output.initMap.ret.5)

////PopInstruction{address=temp 0}
@SP // 8482
AM=M-1 // 8483
D=M // 8484
@5 // 8485
M=D // 8486

////PushInstruction("constant 36")
@36 // 8487
D=A // 8488
@SP // 8489
AM=M+1 // 8490
A=A-1 // 8491
M=D // 8492

////PushInstruction("constant 12")
@12 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498

////PushInstruction("constant 30")
@30 // 8499
D=A // 8500
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=D // 8504

////PushInstruction("constant 51")
@51 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510

////PushInstruction("constant 3")
@3 // 8511
D=A // 8512
@SP // 8513
AM=M+1 // 8514
A=A-1 // 8515
M=D // 8516

////PushInstruction("constant 30")
@30 // 8517
D=A // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=D // 8522

////PushInstruction("constant 48")
@48 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528

////PushInstruction("constant 51")
@51 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534

////PushInstruction("constant 30")
@30 // 8535
D=A // 8536
@SP // 8537
AM=M+1 // 8538
A=A-1 // 8539
M=D // 8540

////PushInstruction("constant 12")
@12 // 8541
D=A // 8542
@SP // 8543
AM=M+1 // 8544
A=A-1 // 8545
M=D // 8546

////PushInstruction("constant 12")
@12 // 8547
D=A // 8548
@SP // 8549
AM=M+1 // 8550
A=A-1 // 8551
M=D // 8552

////PushInstruction("constant 0")
@SP // 8553
AM=M+1 // 8554
A=A-1 // 8555
M=0 // 8556

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=6}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8557
D=A // 8558
@14 // 8559
M=D // 8560
@Output.create // 8561
D=A // 8562
@13 // 8563
M=D // 8564
@Output.initMap.ret.6 // 8565
D=A // 8566
@CALL // 8567
0;JMP // 8568
(Output.initMap.ret.6)

////PopInstruction{address=temp 0}
@SP // 8569
AM=M-1 // 8570
D=M // 8571
@5 // 8572
M=D // 8573

////PushInstruction("constant 37")
@37 // 8574
D=A // 8575
@SP // 8576
AM=M+1 // 8577
A=A-1 // 8578
M=D // 8579

////PushInstruction("constant 0")
@SP // 8580
AM=M+1 // 8581
A=A-1 // 8582
M=0 // 8583

////PushInstruction("constant 0")
@SP // 8584
AM=M+1 // 8585
A=A-1 // 8586
M=0 // 8587

////PushInstruction("constant 35")
@35 // 8588
D=A // 8589
@SP // 8590
AM=M+1 // 8591
A=A-1 // 8592
M=D // 8593

////PushInstruction("constant 51")
@51 // 8594
D=A // 8595
@SP // 8596
AM=M+1 // 8597
A=A-1 // 8598
M=D // 8599

////PushInstruction("constant 24")
@24 // 8600
D=A // 8601
@SP // 8602
AM=M+1 // 8603
A=A-1 // 8604
M=D // 8605

////PushInstruction("constant 12")
@12 // 8606
D=A // 8607
@SP // 8608
AM=M+1 // 8609
A=A-1 // 8610
M=D // 8611

////PushInstruction("constant 6")
@6 // 8612
D=A // 8613
@SP // 8614
AM=M+1 // 8615
A=A-1 // 8616
M=D // 8617

////PushInstruction("constant 51")
@51 // 8618
D=A // 8619
@SP // 8620
AM=M+1 // 8621
A=A-1 // 8622
M=D // 8623

////PushInstruction("constant 49")
@49 // 8624
D=A // 8625
@SP // 8626
AM=M+1 // 8627
A=A-1 // 8628
M=D // 8629

////PushInstruction("constant 0")
@SP // 8630
AM=M+1 // 8631
A=A-1 // 8632
M=0 // 8633

////PushInstruction("constant 0")
@SP // 8634
AM=M+1 // 8635
A=A-1 // 8636
M=0 // 8637

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=7}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8638
D=A // 8639
@14 // 8640
M=D // 8641
@Output.create // 8642
D=A // 8643
@13 // 8644
M=D // 8645
@Output.initMap.ret.7 // 8646
D=A // 8647
@CALL // 8648
0;JMP // 8649
(Output.initMap.ret.7)

////PopInstruction{address=temp 0}
@SP // 8650
AM=M-1 // 8651
D=M // 8652
@5 // 8653
M=D // 8654

////PushInstruction("constant 38")
@38 // 8655
D=A // 8656
@SP // 8657
AM=M+1 // 8658
A=A-1 // 8659
M=D // 8660

////PushInstruction("constant 12")
@12 // 8661
D=A // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=D // 8666

////PushInstruction("constant 30")
@30 // 8667
D=A // 8668
@SP // 8669
AM=M+1 // 8670
A=A-1 // 8671
M=D // 8672

////PushInstruction("constant 30")
@30 // 8673
D=A // 8674
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=D // 8678

////PushInstruction("constant 12")
@12 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684

////PushInstruction("constant 54")
@54 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690

////PushInstruction("constant 27")
@27 // 8691
D=A // 8692
@SP // 8693
AM=M+1 // 8694
A=A-1 // 8695
M=D // 8696

////PushInstruction("constant 27")
@27 // 8697
D=A // 8698
@SP // 8699
AM=M+1 // 8700
A=A-1 // 8701
M=D // 8702

////PushInstruction("constant 27")
@27 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708

////PushInstruction("constant 54")
@54 // 8709
D=A // 8710
@SP // 8711
AM=M+1 // 8712
A=A-1 // 8713
M=D // 8714

////PushInstruction("constant 0")
@SP // 8715
AM=M+1 // 8716
A=A-1 // 8717
M=0 // 8718

////PushInstruction("constant 0")
@SP // 8719
AM=M+1 // 8720
A=A-1 // 8721
M=0 // 8722

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=8}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8723
D=A // 8724
@14 // 8725
M=D // 8726
@Output.create // 8727
D=A // 8728
@13 // 8729
M=D // 8730
@Output.initMap.ret.8 // 8731
D=A // 8732
@CALL // 8733
0;JMP // 8734
(Output.initMap.ret.8)

////PopInstruction{address=temp 0}
@SP // 8735
AM=M-1 // 8736
D=M // 8737
@5 // 8738
M=D // 8739

////PushInstruction("constant 39")
@39 // 8740
D=A // 8741
@SP // 8742
AM=M+1 // 8743
A=A-1 // 8744
M=D // 8745

////PushInstruction("constant 12")
@12 // 8746
D=A // 8747
@SP // 8748
AM=M+1 // 8749
A=A-1 // 8750
M=D // 8751

////PushInstruction("constant 12")
@12 // 8752
D=A // 8753
@SP // 8754
AM=M+1 // 8755
A=A-1 // 8756
M=D // 8757

////PushInstruction("constant 6")
@6 // 8758
D=A // 8759
@SP // 8760
AM=M+1 // 8761
A=A-1 // 8762
M=D // 8763

////PushInstruction("constant 0")
@SP // 8764
AM=M+1 // 8765
A=A-1 // 8766
M=0 // 8767

////PushInstruction("constant 0")
@SP // 8768
AM=M+1 // 8769
A=A-1 // 8770
M=0 // 8771

////PushInstruction("constant 0")
@SP // 8772
AM=M+1 // 8773
A=A-1 // 8774
M=0 // 8775

////PushInstruction("constant 0")
@SP // 8776
AM=M+1 // 8777
A=A-1 // 8778
M=0 // 8779

////PushInstruction("constant 0")
@SP // 8780
AM=M+1 // 8781
A=A-1 // 8782
M=0 // 8783

////PushInstruction("constant 0")
@SP // 8784
AM=M+1 // 8785
A=A-1 // 8786
M=0 // 8787

////PushInstruction("constant 0")
@SP // 8788
AM=M+1 // 8789
A=A-1 // 8790
M=0 // 8791

////PushInstruction("constant 0")
@SP // 8792
AM=M+1 // 8793
A=A-1 // 8794
M=0 // 8795

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=9}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8796
D=A // 8797
@14 // 8798
M=D // 8799
@Output.create // 8800
D=A // 8801
@13 // 8802
M=D // 8803
@Output.initMap.ret.9 // 8804
D=A // 8805
@CALL // 8806
0;JMP // 8807
(Output.initMap.ret.9)

////PopInstruction{address=temp 0}
@SP // 8808
AM=M-1 // 8809
D=M // 8810
@5 // 8811
M=D // 8812

////PushInstruction("constant 40")
@40 // 8813
D=A // 8814
@SP // 8815
AM=M+1 // 8816
A=A-1 // 8817
M=D // 8818

////PushInstruction("constant 24")
@24 // 8819
D=A // 8820
@SP // 8821
AM=M+1 // 8822
A=A-1 // 8823
M=D // 8824

////PushInstruction("constant 12")
@12 // 8825
D=A // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=D // 8830

////PushInstruction("constant 6")
@6 // 8831
D=A // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=D // 8836

////PushInstruction("constant 6")
@6 // 8837
D=A // 8838
@SP // 8839
AM=M+1 // 8840
A=A-1 // 8841
M=D // 8842

////PushInstruction("constant 6")
@6 // 8843
D=A // 8844
@SP // 8845
AM=M+1 // 8846
A=A-1 // 8847
M=D // 8848

////PushInstruction("constant 6")
@6 // 8849
D=A // 8850
@SP // 8851
AM=M+1 // 8852
A=A-1 // 8853
M=D // 8854

////PushInstruction("constant 6")
@6 // 8855
D=A // 8856
@SP // 8857
AM=M+1 // 8858
A=A-1 // 8859
M=D // 8860

////PushInstruction("constant 12")
@12 // 8861
D=A // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=D // 8866

////PushInstruction("constant 24")
@24 // 8867
D=A // 8868
@SP // 8869
AM=M+1 // 8870
A=A-1 // 8871
M=D // 8872

////PushInstruction("constant 0")
@SP // 8873
AM=M+1 // 8874
A=A-1 // 8875
M=0 // 8876

////PushInstruction("constant 0")
@SP // 8877
AM=M+1 // 8878
A=A-1 // 8879
M=0 // 8880

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=10}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8881
D=A // 8882
@14 // 8883
M=D // 8884
@Output.create // 8885
D=A // 8886
@13 // 8887
M=D // 8888
@Output.initMap.ret.10 // 8889
D=A // 8890
@CALL // 8891
0;JMP // 8892
(Output.initMap.ret.10)

////PopInstruction{address=temp 0}
@SP // 8893
AM=M-1 // 8894
D=M // 8895
@5 // 8896
M=D // 8897

////PushInstruction("constant 41")
@41 // 8898
D=A // 8899
@SP // 8900
AM=M+1 // 8901
A=A-1 // 8902
M=D // 8903

////PushInstruction("constant 6")
@6 // 8904
D=A // 8905
@SP // 8906
AM=M+1 // 8907
A=A-1 // 8908
M=D // 8909

////PushInstruction("constant 12")
@12 // 8910
D=A // 8911
@SP // 8912
AM=M+1 // 8913
A=A-1 // 8914
M=D // 8915

////PushInstruction("constant 24")
@24 // 8916
D=A // 8917
@SP // 8918
AM=M+1 // 8919
A=A-1 // 8920
M=D // 8921

////PushInstruction("constant 24")
@24 // 8922
D=A // 8923
@SP // 8924
AM=M+1 // 8925
A=A-1 // 8926
M=D // 8927

////PushInstruction("constant 24")
@24 // 8928
D=A // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=D // 8933

////PushInstruction("constant 24")
@24 // 8934
D=A // 8935
@SP // 8936
AM=M+1 // 8937
A=A-1 // 8938
M=D // 8939

////PushInstruction("constant 24")
@24 // 8940
D=A // 8941
@SP // 8942
AM=M+1 // 8943
A=A-1 // 8944
M=D // 8945

////PushInstruction("constant 12")
@12 // 8946
D=A // 8947
@SP // 8948
AM=M+1 // 8949
A=A-1 // 8950
M=D // 8951

////PushInstruction("constant 6")
@6 // 8952
D=A // 8953
@SP // 8954
AM=M+1 // 8955
A=A-1 // 8956
M=D // 8957

////PushInstruction("constant 0")
@SP // 8958
AM=M+1 // 8959
A=A-1 // 8960
M=0 // 8961

////PushInstruction("constant 0")
@SP // 8962
AM=M+1 // 8963
A=A-1 // 8964
M=0 // 8965

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=11}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8966
D=A // 8967
@14 // 8968
M=D // 8969
@Output.create // 8970
D=A // 8971
@13 // 8972
M=D // 8973
@Output.initMap.ret.11 // 8974
D=A // 8975
@CALL // 8976
0;JMP // 8977
(Output.initMap.ret.11)

////PopInstruction{address=temp 0}
@SP // 8978
AM=M-1 // 8979
D=M // 8980
@5 // 8981
M=D // 8982

////PushInstruction("constant 42")
@42 // 8983
D=A // 8984
@SP // 8985
AM=M+1 // 8986
A=A-1 // 8987
M=D // 8988

////PushInstruction("constant 0")
@SP // 8989
AM=M+1 // 8990
A=A-1 // 8991
M=0 // 8992

////PushInstruction("constant 0")
@SP // 8993
AM=M+1 // 8994
A=A-1 // 8995
M=0 // 8996

////PushInstruction("constant 0")
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=0 // 9000

////PushInstruction("constant 51")
@51 // 9001
D=A // 9002
@SP // 9003
AM=M+1 // 9004
A=A-1 // 9005
M=D // 9006

////PushInstruction("constant 30")
@30 // 9007
D=A // 9008
@SP // 9009
AM=M+1 // 9010
A=A-1 // 9011
M=D // 9012

////PushInstruction("constant 63")
@63 // 9013
D=A // 9014
@SP // 9015
AM=M+1 // 9016
A=A-1 // 9017
M=D // 9018

////PushInstruction("constant 30")
@30 // 9019
D=A // 9020
@SP // 9021
AM=M+1 // 9022
A=A-1 // 9023
M=D // 9024

////PushInstruction("constant 51")
@51 // 9025
D=A // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=D // 9030

////PushInstruction("constant 0")
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=0 // 9034

////PushInstruction("constant 0")
@SP // 9035
AM=M+1 // 9036
A=A-1 // 9037
M=0 // 9038

////PushInstruction("constant 0")
@SP // 9039
AM=M+1 // 9040
A=A-1 // 9041
M=0 // 9042

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=12}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9043
D=A // 9044
@14 // 9045
M=D // 9046
@Output.create // 9047
D=A // 9048
@13 // 9049
M=D // 9050
@Output.initMap.ret.12 // 9051
D=A // 9052
@CALL // 9053
0;JMP // 9054
(Output.initMap.ret.12)

////PopInstruction{address=temp 0}
@SP // 9055
AM=M-1 // 9056
D=M // 9057
@5 // 9058
M=D // 9059

////PushInstruction("constant 43")
@43 // 9060
D=A // 9061
@SP // 9062
AM=M+1 // 9063
A=A-1 // 9064
M=D // 9065

////PushInstruction("constant 0")
@SP // 9066
AM=M+1 // 9067
A=A-1 // 9068
M=0 // 9069

////PushInstruction("constant 0")
@SP // 9070
AM=M+1 // 9071
A=A-1 // 9072
M=0 // 9073

////PushInstruction("constant 0")
@SP // 9074
AM=M+1 // 9075
A=A-1 // 9076
M=0 // 9077

////PushInstruction("constant 12")
@12 // 9078
D=A // 9079
@SP // 9080
AM=M+1 // 9081
A=A-1 // 9082
M=D // 9083

////PushInstruction("constant 12")
@12 // 9084
D=A // 9085
@SP // 9086
AM=M+1 // 9087
A=A-1 // 9088
M=D // 9089

////PushInstruction("constant 63")
@63 // 9090
D=A // 9091
@SP // 9092
AM=M+1 // 9093
A=A-1 // 9094
M=D // 9095

////PushInstruction("constant 12")
@12 // 9096
D=A // 9097
@SP // 9098
AM=M+1 // 9099
A=A-1 // 9100
M=D // 9101

////PushInstruction("constant 12")
@12 // 9102
D=A // 9103
@SP // 9104
AM=M+1 // 9105
A=A-1 // 9106
M=D // 9107

////PushInstruction("constant 0")
@SP // 9108
AM=M+1 // 9109
A=A-1 // 9110
M=0 // 9111

////PushInstruction("constant 0")
@SP // 9112
AM=M+1 // 9113
A=A-1 // 9114
M=0 // 9115

////PushInstruction("constant 0")
@SP // 9116
AM=M+1 // 9117
A=A-1 // 9118
M=0 // 9119

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=13}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9120
D=A // 9121
@14 // 9122
M=D // 9123
@Output.create // 9124
D=A // 9125
@13 // 9126
M=D // 9127
@Output.initMap.ret.13 // 9128
D=A // 9129
@CALL // 9130
0;JMP // 9131
(Output.initMap.ret.13)

////PopInstruction{address=temp 0}
@SP // 9132
AM=M-1 // 9133
D=M // 9134
@5 // 9135
M=D // 9136

////PushInstruction("constant 44")
@44 // 9137
D=A // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=D // 9142

////PushInstruction("constant 0")
@SP // 9143
AM=M+1 // 9144
A=A-1 // 9145
M=0 // 9146

////PushInstruction("constant 0")
@SP // 9147
AM=M+1 // 9148
A=A-1 // 9149
M=0 // 9150

////PushInstruction("constant 0")
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=0 // 9154

////PushInstruction("constant 0")
@SP // 9155
AM=M+1 // 9156
A=A-1 // 9157
M=0 // 9158

////PushInstruction("constant 0")
@SP // 9159
AM=M+1 // 9160
A=A-1 // 9161
M=0 // 9162

////PushInstruction("constant 0")
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=0 // 9166

////PushInstruction("constant 0")
@SP // 9167
AM=M+1 // 9168
A=A-1 // 9169
M=0 // 9170

////PushInstruction("constant 12")
@12 // 9171
D=A // 9172
@SP // 9173
AM=M+1 // 9174
A=A-1 // 9175
M=D // 9176

////PushInstruction("constant 12")
@12 // 9177
D=A // 9178
@SP // 9179
AM=M+1 // 9180
A=A-1 // 9181
M=D // 9182

////PushInstruction("constant 6")
@6 // 9183
D=A // 9184
@SP // 9185
AM=M+1 // 9186
A=A-1 // 9187
M=D // 9188

////PushInstruction("constant 0")
@SP // 9189
AM=M+1 // 9190
A=A-1 // 9191
M=0 // 9192

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=14}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9193
D=A // 9194
@14 // 9195
M=D // 9196
@Output.create // 9197
D=A // 9198
@13 // 9199
M=D // 9200
@Output.initMap.ret.14 // 9201
D=A // 9202
@CALL // 9203
0;JMP // 9204
(Output.initMap.ret.14)

////PopInstruction{address=temp 0}
@SP // 9205
AM=M-1 // 9206
D=M // 9207
@5 // 9208
M=D // 9209

////PushInstruction("constant 45")
@45 // 9210
D=A // 9211
@SP // 9212
AM=M+1 // 9213
A=A-1 // 9214
M=D // 9215

////PushInstruction("constant 0")
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=0 // 9219

////PushInstruction("constant 0")
@SP // 9220
AM=M+1 // 9221
A=A-1 // 9222
M=0 // 9223

////PushInstruction("constant 0")
@SP // 9224
AM=M+1 // 9225
A=A-1 // 9226
M=0 // 9227

////PushInstruction("constant 0")
@SP // 9228
AM=M+1 // 9229
A=A-1 // 9230
M=0 // 9231

////PushInstruction("constant 0")
@SP // 9232
AM=M+1 // 9233
A=A-1 // 9234
M=0 // 9235

////PushInstruction("constant 63")
@63 // 9236
D=A // 9237
@SP // 9238
AM=M+1 // 9239
A=A-1 // 9240
M=D // 9241

////PushInstruction("constant 0")
@SP // 9242
AM=M+1 // 9243
A=A-1 // 9244
M=0 // 9245

////PushInstruction("constant 0")
@SP // 9246
AM=M+1 // 9247
A=A-1 // 9248
M=0 // 9249

////PushInstruction("constant 0")
@SP // 9250
AM=M+1 // 9251
A=A-1 // 9252
M=0 // 9253

////PushInstruction("constant 0")
@SP // 9254
AM=M+1 // 9255
A=A-1 // 9256
M=0 // 9257

////PushInstruction("constant 0")
@SP // 9258
AM=M+1 // 9259
A=A-1 // 9260
M=0 // 9261

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=15}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9262
D=A // 9263
@14 // 9264
M=D // 9265
@Output.create // 9266
D=A // 9267
@13 // 9268
M=D // 9269
@Output.initMap.ret.15 // 9270
D=A // 9271
@CALL // 9272
0;JMP // 9273
(Output.initMap.ret.15)

////PopInstruction{address=temp 0}
@SP // 9274
AM=M-1 // 9275
D=M // 9276
@5 // 9277
M=D // 9278

////PushInstruction("constant 46")
@46 // 9279
D=A // 9280
@SP // 9281
AM=M+1 // 9282
A=A-1 // 9283
M=D // 9284

////PushInstruction("constant 0")
@SP // 9285
AM=M+1 // 9286
A=A-1 // 9287
M=0 // 9288

////PushInstruction("constant 0")
@SP // 9289
AM=M+1 // 9290
A=A-1 // 9291
M=0 // 9292

////PushInstruction("constant 0")
@SP // 9293
AM=M+1 // 9294
A=A-1 // 9295
M=0 // 9296

////PushInstruction("constant 0")
@SP // 9297
AM=M+1 // 9298
A=A-1 // 9299
M=0 // 9300

////PushInstruction("constant 0")
@SP // 9301
AM=M+1 // 9302
A=A-1 // 9303
M=0 // 9304

////PushInstruction("constant 0")
@SP // 9305
AM=M+1 // 9306
A=A-1 // 9307
M=0 // 9308

////PushInstruction("constant 0")
@SP // 9309
AM=M+1 // 9310
A=A-1 // 9311
M=0 // 9312

////PushInstruction("constant 12")
@12 // 9313
D=A // 9314
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=D // 9318

////PushInstruction("constant 12")
@12 // 9319
D=A // 9320
@SP // 9321
AM=M+1 // 9322
A=A-1 // 9323
M=D // 9324

////PushInstruction("constant 0")
@SP // 9325
AM=M+1 // 9326
A=A-1 // 9327
M=0 // 9328

////PushInstruction("constant 0")
@SP // 9329
AM=M+1 // 9330
A=A-1 // 9331
M=0 // 9332

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=16}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9333
D=A // 9334
@14 // 9335
M=D // 9336
@Output.create // 9337
D=A // 9338
@13 // 9339
M=D // 9340
@Output.initMap.ret.16 // 9341
D=A // 9342
@CALL // 9343
0;JMP // 9344
(Output.initMap.ret.16)

////PopInstruction{address=temp 0}
@SP // 9345
AM=M-1 // 9346
D=M // 9347
@5 // 9348
M=D // 9349

////PushInstruction("constant 47")
@47 // 9350
D=A // 9351
@SP // 9352
AM=M+1 // 9353
A=A-1 // 9354
M=D // 9355

////PushInstruction("constant 0")
@SP // 9356
AM=M+1 // 9357
A=A-1 // 9358
M=0 // 9359

////PushInstruction("constant 0")
@SP // 9360
AM=M+1 // 9361
A=A-1 // 9362
M=0 // 9363

////PushInstruction("constant 32")
@32 // 9364
D=A // 9365
@SP // 9366
AM=M+1 // 9367
A=A-1 // 9368
M=D // 9369

////PushInstruction("constant 48")
@48 // 9370
D=A // 9371
@SP // 9372
AM=M+1 // 9373
A=A-1 // 9374
M=D // 9375

////PushInstruction("constant 24")
@24 // 9376
D=A // 9377
@SP // 9378
AM=M+1 // 9379
A=A-1 // 9380
M=D // 9381

////PushInstruction("constant 12")
@12 // 9382
D=A // 9383
@SP // 9384
AM=M+1 // 9385
A=A-1 // 9386
M=D // 9387

////PushInstruction("constant 6")
@6 // 9388
D=A // 9389
@SP // 9390
AM=M+1 // 9391
A=A-1 // 9392
M=D // 9393

////PushInstruction("constant 3")
@3 // 9394
D=A // 9395
@SP // 9396
AM=M+1 // 9397
A=A-1 // 9398
M=D // 9399

////PushInstruction("constant 1")
@SP // 9400
AM=M+1 // 9401
A=A-1 // 9402
M=1 // 9403

////PushInstruction("constant 0")
@SP // 9404
AM=M+1 // 9405
A=A-1 // 9406
M=0 // 9407

////PushInstruction("constant 0")
@SP // 9408
AM=M+1 // 9409
A=A-1 // 9410
M=0 // 9411

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=17}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9412
D=A // 9413
@14 // 9414
M=D // 9415
@Output.create // 9416
D=A // 9417
@13 // 9418
M=D // 9419
@Output.initMap.ret.17 // 9420
D=A // 9421
@CALL // 9422
0;JMP // 9423
(Output.initMap.ret.17)

////PopInstruction{address=temp 0}
@SP // 9424
AM=M-1 // 9425
D=M // 9426
@5 // 9427
M=D // 9428

////PushInstruction("constant 48")
@48 // 9429
D=A // 9430
@SP // 9431
AM=M+1 // 9432
A=A-1 // 9433
M=D // 9434

////PushInstruction("constant 12")
@12 // 9435
D=A // 9436
@SP // 9437
AM=M+1 // 9438
A=A-1 // 9439
M=D // 9440

////PushInstruction("constant 30")
@30 // 9441
D=A // 9442
@SP // 9443
AM=M+1 // 9444
A=A-1 // 9445
M=D // 9446

////PushInstruction("constant 51")
@51 // 9447
D=A // 9448
@SP // 9449
AM=M+1 // 9450
A=A-1 // 9451
M=D // 9452

////PushInstruction("constant 51")
@51 // 9453
D=A // 9454
@SP // 9455
AM=M+1 // 9456
A=A-1 // 9457
M=D // 9458

////PushInstruction("constant 51")
@51 // 9459
D=A // 9460
@SP // 9461
AM=M+1 // 9462
A=A-1 // 9463
M=D // 9464

////PushInstruction("constant 51")
@51 // 9465
D=A // 9466
@SP // 9467
AM=M+1 // 9468
A=A-1 // 9469
M=D // 9470

////PushInstruction("constant 51")
@51 // 9471
D=A // 9472
@SP // 9473
AM=M+1 // 9474
A=A-1 // 9475
M=D // 9476

////PushInstruction("constant 30")
@30 // 9477
D=A // 9478
@SP // 9479
AM=M+1 // 9480
A=A-1 // 9481
M=D // 9482

////PushInstruction("constant 12")
@12 // 9483
D=A // 9484
@SP // 9485
AM=M+1 // 9486
A=A-1 // 9487
M=D // 9488

////PushInstruction("constant 0")
@SP // 9489
AM=M+1 // 9490
A=A-1 // 9491
M=0 // 9492

////PushInstruction("constant 0")
@SP // 9493
AM=M+1 // 9494
A=A-1 // 9495
M=0 // 9496

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=18}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9497
D=A // 9498
@14 // 9499
M=D // 9500
@Output.create // 9501
D=A // 9502
@13 // 9503
M=D // 9504
@Output.initMap.ret.18 // 9505
D=A // 9506
@CALL // 9507
0;JMP // 9508
(Output.initMap.ret.18)

////PopInstruction{address=temp 0}
@SP // 9509
AM=M-1 // 9510
D=M // 9511
@5 // 9512
M=D // 9513

////PushInstruction("constant 49")
@49 // 9514
D=A // 9515
@SP // 9516
AM=M+1 // 9517
A=A-1 // 9518
M=D // 9519

////PushInstruction("constant 12")
@12 // 9520
D=A // 9521
@SP // 9522
AM=M+1 // 9523
A=A-1 // 9524
M=D // 9525

////PushInstruction("constant 14")
@14 // 9526
D=A // 9527
@SP // 9528
AM=M+1 // 9529
A=A-1 // 9530
M=D // 9531

////PushInstruction("constant 15")
@15 // 9532
D=A // 9533
@SP // 9534
AM=M+1 // 9535
A=A-1 // 9536
M=D // 9537

////PushInstruction("constant 12")
@12 // 9538
D=A // 9539
@SP // 9540
AM=M+1 // 9541
A=A-1 // 9542
M=D // 9543

////PushInstruction("constant 12")
@12 // 9544
D=A // 9545
@SP // 9546
AM=M+1 // 9547
A=A-1 // 9548
M=D // 9549

////PushInstruction("constant 12")
@12 // 9550
D=A // 9551
@SP // 9552
AM=M+1 // 9553
A=A-1 // 9554
M=D // 9555

////PushInstruction("constant 12")
@12 // 9556
D=A // 9557
@SP // 9558
AM=M+1 // 9559
A=A-1 // 9560
M=D // 9561

////PushInstruction("constant 12")
@12 // 9562
D=A // 9563
@SP // 9564
AM=M+1 // 9565
A=A-1 // 9566
M=D // 9567

////PushInstruction("constant 63")
@63 // 9568
D=A // 9569
@SP // 9570
AM=M+1 // 9571
A=A-1 // 9572
M=D // 9573

////PushInstruction("constant 0")
@SP // 9574
AM=M+1 // 9575
A=A-1 // 9576
M=0 // 9577

////PushInstruction("constant 0")
@SP // 9578
AM=M+1 // 9579
A=A-1 // 9580
M=0 // 9581

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=19}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9582
D=A // 9583
@14 // 9584
M=D // 9585
@Output.create // 9586
D=A // 9587
@13 // 9588
M=D // 9589
@Output.initMap.ret.19 // 9590
D=A // 9591
@CALL // 9592
0;JMP // 9593
(Output.initMap.ret.19)

////PopInstruction{address=temp 0}
@SP // 9594
AM=M-1 // 9595
D=M // 9596
@5 // 9597
M=D // 9598

////PushInstruction("constant 50")
@50 // 9599
D=A // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=D // 9604

////PushInstruction("constant 30")
@30 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610

////PushInstruction("constant 51")
@51 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616

////PushInstruction("constant 48")
@48 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622

////PushInstruction("constant 24")
@24 // 9623
D=A // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=D // 9628

////PushInstruction("constant 12")
@12 // 9629
D=A // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=D // 9634

////PushInstruction("constant 6")
@6 // 9635
D=A // 9636
@SP // 9637
AM=M+1 // 9638
A=A-1 // 9639
M=D // 9640

////PushInstruction("constant 3")
@3 // 9641
D=A // 9642
@SP // 9643
AM=M+1 // 9644
A=A-1 // 9645
M=D // 9646

////PushInstruction("constant 51")
@51 // 9647
D=A // 9648
@SP // 9649
AM=M+1 // 9650
A=A-1 // 9651
M=D // 9652

////PushInstruction("constant 63")
@63 // 9653
D=A // 9654
@SP // 9655
AM=M+1 // 9656
A=A-1 // 9657
M=D // 9658

////PushInstruction("constant 0")
@SP // 9659
AM=M+1 // 9660
A=A-1 // 9661
M=0 // 9662

////PushInstruction("constant 0")
@SP // 9663
AM=M+1 // 9664
A=A-1 // 9665
M=0 // 9666

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=20}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9667
D=A // 9668
@14 // 9669
M=D // 9670
@Output.create // 9671
D=A // 9672
@13 // 9673
M=D // 9674
@Output.initMap.ret.20 // 9675
D=A // 9676
@CALL // 9677
0;JMP // 9678
(Output.initMap.ret.20)

////PopInstruction{address=temp 0}
@SP // 9679
AM=M-1 // 9680
D=M // 9681
@5 // 9682
M=D // 9683

////PushInstruction("constant 51")
@51 // 9684
D=A // 9685
@SP // 9686
AM=M+1 // 9687
A=A-1 // 9688
M=D // 9689

////PushInstruction("constant 30")
@30 // 9690
D=A // 9691
@SP // 9692
AM=M+1 // 9693
A=A-1 // 9694
M=D // 9695

////PushInstruction("constant 51")
@51 // 9696
D=A // 9697
@SP // 9698
AM=M+1 // 9699
A=A-1 // 9700
M=D // 9701

////PushInstruction("constant 48")
@48 // 9702
D=A // 9703
@SP // 9704
AM=M+1 // 9705
A=A-1 // 9706
M=D // 9707

////PushInstruction("constant 48")
@48 // 9708
D=A // 9709
@SP // 9710
AM=M+1 // 9711
A=A-1 // 9712
M=D // 9713

////PushInstruction("constant 28")
@28 // 9714
D=A // 9715
@SP // 9716
AM=M+1 // 9717
A=A-1 // 9718
M=D // 9719

////PushInstruction("constant 48")
@48 // 9720
D=A // 9721
@SP // 9722
AM=M+1 // 9723
A=A-1 // 9724
M=D // 9725

////PushInstruction("constant 48")
@48 // 9726
D=A // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=D // 9731

////PushInstruction("constant 51")
@51 // 9732
D=A // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=D // 9737

////PushInstruction("constant 30")
@30 // 9738
D=A // 9739
@SP // 9740
AM=M+1 // 9741
A=A-1 // 9742
M=D // 9743

////PushInstruction("constant 0")
@SP // 9744
AM=M+1 // 9745
A=A-1 // 9746
M=0 // 9747

////PushInstruction("constant 0")
@SP // 9748
AM=M+1 // 9749
A=A-1 // 9750
M=0 // 9751

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=21}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9752
D=A // 9753
@14 // 9754
M=D // 9755
@Output.create // 9756
D=A // 9757
@13 // 9758
M=D // 9759
@Output.initMap.ret.21 // 9760
D=A // 9761
@CALL // 9762
0;JMP // 9763
(Output.initMap.ret.21)

////PopInstruction{address=temp 0}
@SP // 9764
AM=M-1 // 9765
D=M // 9766
@5 // 9767
M=D // 9768

////PushInstruction("constant 52")
@52 // 9769
D=A // 9770
@SP // 9771
AM=M+1 // 9772
A=A-1 // 9773
M=D // 9774

////PushInstruction("constant 16")
@16 // 9775
D=A // 9776
@SP // 9777
AM=M+1 // 9778
A=A-1 // 9779
M=D // 9780

////PushInstruction("constant 24")
@24 // 9781
D=A // 9782
@SP // 9783
AM=M+1 // 9784
A=A-1 // 9785
M=D // 9786

////PushInstruction("constant 28")
@28 // 9787
D=A // 9788
@SP // 9789
AM=M+1 // 9790
A=A-1 // 9791
M=D // 9792

////PushInstruction("constant 26")
@26 // 9793
D=A // 9794
@SP // 9795
AM=M+1 // 9796
A=A-1 // 9797
M=D // 9798

////PushInstruction("constant 25")
@25 // 9799
D=A // 9800
@SP // 9801
AM=M+1 // 9802
A=A-1 // 9803
M=D // 9804

////PushInstruction("constant 63")
@63 // 9805
D=A // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=D // 9810

////PushInstruction("constant 24")
@24 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816

////PushInstruction("constant 24")
@24 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822

////PushInstruction("constant 60")
@60 // 9823
D=A // 9824
@SP // 9825
AM=M+1 // 9826
A=A-1 // 9827
M=D // 9828

////PushInstruction("constant 0")
@SP // 9829
AM=M+1 // 9830
A=A-1 // 9831
M=0 // 9832

////PushInstruction("constant 0")
@SP // 9833
AM=M+1 // 9834
A=A-1 // 9835
M=0 // 9836

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=22}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9837
D=A // 9838
@14 // 9839
M=D // 9840
@Output.create // 9841
D=A // 9842
@13 // 9843
M=D // 9844
@Output.initMap.ret.22 // 9845
D=A // 9846
@CALL // 9847
0;JMP // 9848
(Output.initMap.ret.22)

////PopInstruction{address=temp 0}
@SP // 9849
AM=M-1 // 9850
D=M // 9851
@5 // 9852
M=D // 9853

////PushInstruction("constant 53")
@53 // 9854
D=A // 9855
@SP // 9856
AM=M+1 // 9857
A=A-1 // 9858
M=D // 9859

////PushInstruction("constant 63")
@63 // 9860
D=A // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=D // 9865

////PushInstruction("constant 3")
@3 // 9866
D=A // 9867
@SP // 9868
AM=M+1 // 9869
A=A-1 // 9870
M=D // 9871

////PushInstruction("constant 3")
@3 // 9872
D=A // 9873
@SP // 9874
AM=M+1 // 9875
A=A-1 // 9876
M=D // 9877

////PushInstruction("constant 31")
@31 // 9878
D=A // 9879
@SP // 9880
AM=M+1 // 9881
A=A-1 // 9882
M=D // 9883

////PushInstruction("constant 48")
@48 // 9884
D=A // 9885
@SP // 9886
AM=M+1 // 9887
A=A-1 // 9888
M=D // 9889

////PushInstruction("constant 48")
@48 // 9890
D=A // 9891
@SP // 9892
AM=M+1 // 9893
A=A-1 // 9894
M=D // 9895

////PushInstruction("constant 48")
@48 // 9896
D=A // 9897
@SP // 9898
AM=M+1 // 9899
A=A-1 // 9900
M=D // 9901

////PushInstruction("constant 51")
@51 // 9902
D=A // 9903
@SP // 9904
AM=M+1 // 9905
A=A-1 // 9906
M=D // 9907

////PushInstruction("constant 30")
@30 // 9908
D=A // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=D // 9913

////PushInstruction("constant 0")
@SP // 9914
AM=M+1 // 9915
A=A-1 // 9916
M=0 // 9917

////PushInstruction("constant 0")
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=0 // 9921

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=23}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9922
D=A // 9923
@14 // 9924
M=D // 9925
@Output.create // 9926
D=A // 9927
@13 // 9928
M=D // 9929
@Output.initMap.ret.23 // 9930
D=A // 9931
@CALL // 9932
0;JMP // 9933
(Output.initMap.ret.23)

////PopInstruction{address=temp 0}
@SP // 9934
AM=M-1 // 9935
D=M // 9936
@5 // 9937
M=D // 9938

////PushInstruction("constant 54")
@54 // 9939
D=A // 9940
@SP // 9941
AM=M+1 // 9942
A=A-1 // 9943
M=D // 9944

////PushInstruction("constant 28")
@28 // 9945
D=A // 9946
@SP // 9947
AM=M+1 // 9948
A=A-1 // 9949
M=D // 9950

////PushInstruction("constant 6")
@6 // 9951
D=A // 9952
@SP // 9953
AM=M+1 // 9954
A=A-1 // 9955
M=D // 9956

////PushInstruction("constant 3")
@3 // 9957
D=A // 9958
@SP // 9959
AM=M+1 // 9960
A=A-1 // 9961
M=D // 9962

////PushInstruction("constant 3")
@3 // 9963
D=A // 9964
@SP // 9965
AM=M+1 // 9966
A=A-1 // 9967
M=D // 9968

////PushInstruction("constant 31")
@31 // 9969
D=A // 9970
@SP // 9971
AM=M+1 // 9972
A=A-1 // 9973
M=D // 9974

////PushInstruction("constant 51")
@51 // 9975
D=A // 9976
@SP // 9977
AM=M+1 // 9978
A=A-1 // 9979
M=D // 9980

////PushInstruction("constant 51")
@51 // 9981
D=A // 9982
@SP // 9983
AM=M+1 // 9984
A=A-1 // 9985
M=D // 9986

////PushInstruction("constant 51")
@51 // 9987
D=A // 9988
@SP // 9989
AM=M+1 // 9990
A=A-1 // 9991
M=D // 9992

////PushInstruction("constant 30")
@30 // 9993
D=A // 9994
@SP // 9995
AM=M+1 // 9996
A=A-1 // 9997
M=D // 9998

////PushInstruction("constant 0")
@SP // 9999
AM=M+1 // 10000
A=A-1 // 10001
M=0 // 10002

////PushInstruction("constant 0")
@SP // 10003
AM=M+1 // 10004
A=A-1 // 10005
M=0 // 10006

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=24}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10007
D=A // 10008
@14 // 10009
M=D // 10010
@Output.create // 10011
D=A // 10012
@13 // 10013
M=D // 10014
@Output.initMap.ret.24 // 10015
D=A // 10016
@CALL // 10017
0;JMP // 10018
(Output.initMap.ret.24)

////PopInstruction{address=temp 0}
@SP // 10019
AM=M-1 // 10020
D=M // 10021
@5 // 10022
M=D // 10023

////PushInstruction("constant 55")
@55 // 10024
D=A // 10025
@SP // 10026
AM=M+1 // 10027
A=A-1 // 10028
M=D // 10029

////PushInstruction("constant 63")
@63 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035

////PushInstruction("constant 49")
@49 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041

////PushInstruction("constant 48")
@48 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047

////PushInstruction("constant 48")
@48 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053

////PushInstruction("constant 24")
@24 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059

////PushInstruction("constant 12")
@12 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065

////PushInstruction("constant 12")
@12 // 10066
D=A // 10067
@SP // 10068
AM=M+1 // 10069
A=A-1 // 10070
M=D // 10071

////PushInstruction("constant 12")
@12 // 10072
D=A // 10073
@SP // 10074
AM=M+1 // 10075
A=A-1 // 10076
M=D // 10077

////PushInstruction("constant 12")
@12 // 10078
D=A // 10079
@SP // 10080
AM=M+1 // 10081
A=A-1 // 10082
M=D // 10083

////PushInstruction("constant 0")
@SP // 10084
AM=M+1 // 10085
A=A-1 // 10086
M=0 // 10087

////PushInstruction("constant 0")
@SP // 10088
AM=M+1 // 10089
A=A-1 // 10090
M=0 // 10091

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=25}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10092
D=A // 10093
@14 // 10094
M=D // 10095
@Output.create // 10096
D=A // 10097
@13 // 10098
M=D // 10099
@Output.initMap.ret.25 // 10100
D=A // 10101
@CALL // 10102
0;JMP // 10103
(Output.initMap.ret.25)

////PopInstruction{address=temp 0}
@SP // 10104
AM=M-1 // 10105
D=M // 10106
@5 // 10107
M=D // 10108

////PushInstruction("constant 56")
@56 // 10109
D=A // 10110
@SP // 10111
AM=M+1 // 10112
A=A-1 // 10113
M=D // 10114

////PushInstruction("constant 30")
@30 // 10115
D=A // 10116
@SP // 10117
AM=M+1 // 10118
A=A-1 // 10119
M=D // 10120

////PushInstruction("constant 51")
@51 // 10121
D=A // 10122
@SP // 10123
AM=M+1 // 10124
A=A-1 // 10125
M=D // 10126

////PushInstruction("constant 51")
@51 // 10127
D=A // 10128
@SP // 10129
AM=M+1 // 10130
A=A-1 // 10131
M=D // 10132

////PushInstruction("constant 51")
@51 // 10133
D=A // 10134
@SP // 10135
AM=M+1 // 10136
A=A-1 // 10137
M=D // 10138

////PushInstruction("constant 30")
@30 // 10139
D=A // 10140
@SP // 10141
AM=M+1 // 10142
A=A-1 // 10143
M=D // 10144

////PushInstruction("constant 51")
@51 // 10145
D=A // 10146
@SP // 10147
AM=M+1 // 10148
A=A-1 // 10149
M=D // 10150

////PushInstruction("constant 51")
@51 // 10151
D=A // 10152
@SP // 10153
AM=M+1 // 10154
A=A-1 // 10155
M=D // 10156

////PushInstruction("constant 51")
@51 // 10157
D=A // 10158
@SP // 10159
AM=M+1 // 10160
A=A-1 // 10161
M=D // 10162

////PushInstruction("constant 30")
@30 // 10163
D=A // 10164
@SP // 10165
AM=M+1 // 10166
A=A-1 // 10167
M=D // 10168

////PushInstruction("constant 0")
@SP // 10169
AM=M+1 // 10170
A=A-1 // 10171
M=0 // 10172

////PushInstruction("constant 0")
@SP // 10173
AM=M+1 // 10174
A=A-1 // 10175
M=0 // 10176

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=26}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10177
D=A // 10178
@14 // 10179
M=D // 10180
@Output.create // 10181
D=A // 10182
@13 // 10183
M=D // 10184
@Output.initMap.ret.26 // 10185
D=A // 10186
@CALL // 10187
0;JMP // 10188
(Output.initMap.ret.26)

////PopInstruction{address=temp 0}
@SP // 10189
AM=M-1 // 10190
D=M // 10191
@5 // 10192
M=D // 10193

////PushInstruction("constant 57")
@57 // 10194
D=A // 10195
@SP // 10196
AM=M+1 // 10197
A=A-1 // 10198
M=D // 10199

////PushInstruction("constant 30")
@30 // 10200
D=A // 10201
@SP // 10202
AM=M+1 // 10203
A=A-1 // 10204
M=D // 10205

////PushInstruction("constant 51")
@51 // 10206
D=A // 10207
@SP // 10208
AM=M+1 // 10209
A=A-1 // 10210
M=D // 10211

////PushInstruction("constant 51")
@51 // 10212
D=A // 10213
@SP // 10214
AM=M+1 // 10215
A=A-1 // 10216
M=D // 10217

////PushInstruction("constant 51")
@51 // 10218
D=A // 10219
@SP // 10220
AM=M+1 // 10221
A=A-1 // 10222
M=D // 10223

////PushInstruction("constant 62")
@62 // 10224
D=A // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=D // 10229

////PushInstruction("constant 48")
@48 // 10230
D=A // 10231
@SP // 10232
AM=M+1 // 10233
A=A-1 // 10234
M=D // 10235

////PushInstruction("constant 48")
@48 // 10236
D=A // 10237
@SP // 10238
AM=M+1 // 10239
A=A-1 // 10240
M=D // 10241

////PushInstruction("constant 24")
@24 // 10242
D=A // 10243
@SP // 10244
AM=M+1 // 10245
A=A-1 // 10246
M=D // 10247

////PushInstruction("constant 14")
@14 // 10248
D=A // 10249
@SP // 10250
AM=M+1 // 10251
A=A-1 // 10252
M=D // 10253

////PushInstruction("constant 0")
@SP // 10254
AM=M+1 // 10255
A=A-1 // 10256
M=0 // 10257

////PushInstruction("constant 0")
@SP // 10258
AM=M+1 // 10259
A=A-1 // 10260
M=0 // 10261

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=27}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10262
D=A // 10263
@14 // 10264
M=D // 10265
@Output.create // 10266
D=A // 10267
@13 // 10268
M=D // 10269
@Output.initMap.ret.27 // 10270
D=A // 10271
@CALL // 10272
0;JMP // 10273
(Output.initMap.ret.27)

////PopInstruction{address=temp 0}
@SP // 10274
AM=M-1 // 10275
D=M // 10276
@5 // 10277
M=D // 10278

////PushInstruction("constant 58")
@58 // 10279
D=A // 10280
@SP // 10281
AM=M+1 // 10282
A=A-1 // 10283
M=D // 10284

////PushInstruction("constant 0")
@SP // 10285
AM=M+1 // 10286
A=A-1 // 10287
M=0 // 10288

////PushInstruction("constant 0")
@SP // 10289
AM=M+1 // 10290
A=A-1 // 10291
M=0 // 10292

////PushInstruction("constant 12")
@12 // 10293
D=A // 10294
@SP // 10295
AM=M+1 // 10296
A=A-1 // 10297
M=D // 10298

////PushInstruction("constant 12")
@12 // 10299
D=A // 10300
@SP // 10301
AM=M+1 // 10302
A=A-1 // 10303
M=D // 10304

////PushInstruction("constant 0")
@SP // 10305
AM=M+1 // 10306
A=A-1 // 10307
M=0 // 10308

////PushInstruction("constant 0")
@SP // 10309
AM=M+1 // 10310
A=A-1 // 10311
M=0 // 10312

////PushInstruction("constant 12")
@12 // 10313
D=A // 10314
@SP // 10315
AM=M+1 // 10316
A=A-1 // 10317
M=D // 10318

////PushInstruction("constant 12")
@12 // 10319
D=A // 10320
@SP // 10321
AM=M+1 // 10322
A=A-1 // 10323
M=D // 10324

////PushInstruction("constant 0")
@SP // 10325
AM=M+1 // 10326
A=A-1 // 10327
M=0 // 10328

////PushInstruction("constant 0")
@SP // 10329
AM=M+1 // 10330
A=A-1 // 10331
M=0 // 10332

////PushInstruction("constant 0")
@SP // 10333
AM=M+1 // 10334
A=A-1 // 10335
M=0 // 10336

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=28}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10337
D=A // 10338
@14 // 10339
M=D // 10340
@Output.create // 10341
D=A // 10342
@13 // 10343
M=D // 10344
@Output.initMap.ret.28 // 10345
D=A // 10346
@CALL // 10347
0;JMP // 10348
(Output.initMap.ret.28)

////PopInstruction{address=temp 0}
@SP // 10349
AM=M-1 // 10350
D=M // 10351
@5 // 10352
M=D // 10353

////PushInstruction("constant 59")
@59 // 10354
D=A // 10355
@SP // 10356
AM=M+1 // 10357
A=A-1 // 10358
M=D // 10359

////PushInstruction("constant 0")
@SP // 10360
AM=M+1 // 10361
A=A-1 // 10362
M=0 // 10363

////PushInstruction("constant 0")
@SP // 10364
AM=M+1 // 10365
A=A-1 // 10366
M=0 // 10367

////PushInstruction("constant 12")
@12 // 10368
D=A // 10369
@SP // 10370
AM=M+1 // 10371
A=A-1 // 10372
M=D // 10373

////PushInstruction("constant 12")
@12 // 10374
D=A // 10375
@SP // 10376
AM=M+1 // 10377
A=A-1 // 10378
M=D // 10379

////PushInstruction("constant 0")
@SP // 10380
AM=M+1 // 10381
A=A-1 // 10382
M=0 // 10383

////PushInstruction("constant 0")
@SP // 10384
AM=M+1 // 10385
A=A-1 // 10386
M=0 // 10387

////PushInstruction("constant 12")
@12 // 10388
D=A // 10389
@SP // 10390
AM=M+1 // 10391
A=A-1 // 10392
M=D // 10393

////PushInstruction("constant 12")
@12 // 10394
D=A // 10395
@SP // 10396
AM=M+1 // 10397
A=A-1 // 10398
M=D // 10399

////PushInstruction("constant 6")
@6 // 10400
D=A // 10401
@SP // 10402
AM=M+1 // 10403
A=A-1 // 10404
M=D // 10405

////PushInstruction("constant 0")
@SP // 10406
AM=M+1 // 10407
A=A-1 // 10408
M=0 // 10409

////PushInstruction("constant 0")
@SP // 10410
AM=M+1 // 10411
A=A-1 // 10412
M=0 // 10413

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=29}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10414
D=A // 10415
@14 // 10416
M=D // 10417
@Output.create // 10418
D=A // 10419
@13 // 10420
M=D // 10421
@Output.initMap.ret.29 // 10422
D=A // 10423
@CALL // 10424
0;JMP // 10425
(Output.initMap.ret.29)

////PopInstruction{address=temp 0}
@SP // 10426
AM=M-1 // 10427
D=M // 10428
@5 // 10429
M=D // 10430

////PushInstruction("constant 60")
@60 // 10431
D=A // 10432
@SP // 10433
AM=M+1 // 10434
A=A-1 // 10435
M=D // 10436

////PushInstruction("constant 0")
@SP // 10437
AM=M+1 // 10438
A=A-1 // 10439
M=0 // 10440

////PushInstruction("constant 0")
@SP // 10441
AM=M+1 // 10442
A=A-1 // 10443
M=0 // 10444

////PushInstruction("constant 24")
@24 // 10445
D=A // 10446
@SP // 10447
AM=M+1 // 10448
A=A-1 // 10449
M=D // 10450

////PushInstruction("constant 12")
@12 // 10451
D=A // 10452
@SP // 10453
AM=M+1 // 10454
A=A-1 // 10455
M=D // 10456

////PushInstruction("constant 6")
@6 // 10457
D=A // 10458
@SP // 10459
AM=M+1 // 10460
A=A-1 // 10461
M=D // 10462

////PushInstruction("constant 3")
@3 // 10463
D=A // 10464
@SP // 10465
AM=M+1 // 10466
A=A-1 // 10467
M=D // 10468

////PushInstruction("constant 6")
@6 // 10469
D=A // 10470
@SP // 10471
AM=M+1 // 10472
A=A-1 // 10473
M=D // 10474

////PushInstruction("constant 12")
@12 // 10475
D=A // 10476
@SP // 10477
AM=M+1 // 10478
A=A-1 // 10479
M=D // 10480

////PushInstruction("constant 24")
@24 // 10481
D=A // 10482
@SP // 10483
AM=M+1 // 10484
A=A-1 // 10485
M=D // 10486

////PushInstruction("constant 0")
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=0 // 10490

////PushInstruction("constant 0")
@SP // 10491
AM=M+1 // 10492
A=A-1 // 10493
M=0 // 10494

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=30}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10495
D=A // 10496
@14 // 10497
M=D // 10498
@Output.create // 10499
D=A // 10500
@13 // 10501
M=D // 10502
@Output.initMap.ret.30 // 10503
D=A // 10504
@CALL // 10505
0;JMP // 10506
(Output.initMap.ret.30)

////PopInstruction{address=temp 0}
@SP // 10507
AM=M-1 // 10508
D=M // 10509
@5 // 10510
M=D // 10511

////PushInstruction("constant 61")
@61 // 10512
D=A // 10513
@SP // 10514
AM=M+1 // 10515
A=A-1 // 10516
M=D // 10517

////PushInstruction("constant 0")
@SP // 10518
AM=M+1 // 10519
A=A-1 // 10520
M=0 // 10521

////PushInstruction("constant 0")
@SP // 10522
AM=M+1 // 10523
A=A-1 // 10524
M=0 // 10525

////PushInstruction("constant 0")
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=0 // 10529

////PushInstruction("constant 63")
@63 // 10530
D=A // 10531
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=D // 10535

////PushInstruction("constant 0")
@SP // 10536
AM=M+1 // 10537
A=A-1 // 10538
M=0 // 10539

////PushInstruction("constant 0")
@SP // 10540
AM=M+1 // 10541
A=A-1 // 10542
M=0 // 10543

////PushInstruction("constant 63")
@63 // 10544
D=A // 10545
@SP // 10546
AM=M+1 // 10547
A=A-1 // 10548
M=D // 10549

////PushInstruction("constant 0")
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=0 // 10553

////PushInstruction("constant 0")
@SP // 10554
AM=M+1 // 10555
A=A-1 // 10556
M=0 // 10557

////PushInstruction("constant 0")
@SP // 10558
AM=M+1 // 10559
A=A-1 // 10560
M=0 // 10561

////PushInstruction("constant 0")
@SP // 10562
AM=M+1 // 10563
A=A-1 // 10564
M=0 // 10565

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=31}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10566
D=A // 10567
@14 // 10568
M=D // 10569
@Output.create // 10570
D=A // 10571
@13 // 10572
M=D // 10573
@Output.initMap.ret.31 // 10574
D=A // 10575
@CALL // 10576
0;JMP // 10577
(Output.initMap.ret.31)

////PopInstruction{address=temp 0}
@SP // 10578
AM=M-1 // 10579
D=M // 10580
@5 // 10581
M=D // 10582

////PushInstruction("constant 62")
@62 // 10583
D=A // 10584
@SP // 10585
AM=M+1 // 10586
A=A-1 // 10587
M=D // 10588

////PushInstruction("constant 0")
@SP // 10589
AM=M+1 // 10590
A=A-1 // 10591
M=0 // 10592

////PushInstruction("constant 0")
@SP // 10593
AM=M+1 // 10594
A=A-1 // 10595
M=0 // 10596

////PushInstruction("constant 3")
@3 // 10597
D=A // 10598
@SP // 10599
AM=M+1 // 10600
A=A-1 // 10601
M=D // 10602

////PushInstruction("constant 6")
@6 // 10603
D=A // 10604
@SP // 10605
AM=M+1 // 10606
A=A-1 // 10607
M=D // 10608

////PushInstruction("constant 12")
@12 // 10609
D=A // 10610
@SP // 10611
AM=M+1 // 10612
A=A-1 // 10613
M=D // 10614

////PushInstruction("constant 24")
@24 // 10615
D=A // 10616
@SP // 10617
AM=M+1 // 10618
A=A-1 // 10619
M=D // 10620

////PushInstruction("constant 12")
@12 // 10621
D=A // 10622
@SP // 10623
AM=M+1 // 10624
A=A-1 // 10625
M=D // 10626

////PushInstruction("constant 6")
@6 // 10627
D=A // 10628
@SP // 10629
AM=M+1 // 10630
A=A-1 // 10631
M=D // 10632

////PushInstruction("constant 3")
@3 // 10633
D=A // 10634
@SP // 10635
AM=M+1 // 10636
A=A-1 // 10637
M=D // 10638

////PushInstruction("constant 0")
@SP // 10639
AM=M+1 // 10640
A=A-1 // 10641
M=0 // 10642

////PushInstruction("constant 0")
@SP // 10643
AM=M+1 // 10644
A=A-1 // 10645
M=0 // 10646

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=32}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10647
D=A // 10648
@14 // 10649
M=D // 10650
@Output.create // 10651
D=A // 10652
@13 // 10653
M=D // 10654
@Output.initMap.ret.32 // 10655
D=A // 10656
@CALL // 10657
0;JMP // 10658
(Output.initMap.ret.32)

////PopInstruction{address=temp 0}
@SP // 10659
AM=M-1 // 10660
D=M // 10661
@5 // 10662
M=D // 10663

////PushInstruction("constant 64")
@64 // 10664
D=A // 10665
@SP // 10666
AM=M+1 // 10667
A=A-1 // 10668
M=D // 10669

////PushInstruction("constant 30")
@30 // 10670
D=A // 10671
@SP // 10672
AM=M+1 // 10673
A=A-1 // 10674
M=D // 10675

////PushInstruction("constant 51")
@51 // 10676
D=A // 10677
@SP // 10678
AM=M+1 // 10679
A=A-1 // 10680
M=D // 10681

////PushInstruction("constant 51")
@51 // 10682
D=A // 10683
@SP // 10684
AM=M+1 // 10685
A=A-1 // 10686
M=D // 10687

////PushInstruction("constant 59")
@59 // 10688
D=A // 10689
@SP // 10690
AM=M+1 // 10691
A=A-1 // 10692
M=D // 10693

////PushInstruction("constant 59")
@59 // 10694
D=A // 10695
@SP // 10696
AM=M+1 // 10697
A=A-1 // 10698
M=D // 10699

////PushInstruction("constant 59")
@59 // 10700
D=A // 10701
@SP // 10702
AM=M+1 // 10703
A=A-1 // 10704
M=D // 10705

////PushInstruction("constant 27")
@27 // 10706
D=A // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=D // 10711

////PushInstruction("constant 3")
@3 // 10712
D=A // 10713
@SP // 10714
AM=M+1 // 10715
A=A-1 // 10716
M=D // 10717

////PushInstruction("constant 30")
@30 // 10718
D=A // 10719
@SP // 10720
AM=M+1 // 10721
A=A-1 // 10722
M=D // 10723

////PushInstruction("constant 0")
@SP // 10724
AM=M+1 // 10725
A=A-1 // 10726
M=0 // 10727

////PushInstruction("constant 0")
@SP // 10728
AM=M+1 // 10729
A=A-1 // 10730
M=0 // 10731

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=33}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10732
D=A // 10733
@14 // 10734
M=D // 10735
@Output.create // 10736
D=A // 10737
@13 // 10738
M=D // 10739
@Output.initMap.ret.33 // 10740
D=A // 10741
@CALL // 10742
0;JMP // 10743
(Output.initMap.ret.33)

////PopInstruction{address=temp 0}
@SP // 10744
AM=M-1 // 10745
D=M // 10746
@5 // 10747
M=D // 10748

////PushInstruction("constant 63")
@63 // 10749
D=A // 10750
@SP // 10751
AM=M+1 // 10752
A=A-1 // 10753
M=D // 10754

////PushInstruction("constant 30")
@30 // 10755
D=A // 10756
@SP // 10757
AM=M+1 // 10758
A=A-1 // 10759
M=D // 10760

////PushInstruction("constant 51")
@51 // 10761
D=A // 10762
@SP // 10763
AM=M+1 // 10764
A=A-1 // 10765
M=D // 10766

////PushInstruction("constant 51")
@51 // 10767
D=A // 10768
@SP // 10769
AM=M+1 // 10770
A=A-1 // 10771
M=D // 10772

////PushInstruction("constant 24")
@24 // 10773
D=A // 10774
@SP // 10775
AM=M+1 // 10776
A=A-1 // 10777
M=D // 10778

////PushInstruction("constant 12")
@12 // 10779
D=A // 10780
@SP // 10781
AM=M+1 // 10782
A=A-1 // 10783
M=D // 10784

////PushInstruction("constant 12")
@12 // 10785
D=A // 10786
@SP // 10787
AM=M+1 // 10788
A=A-1 // 10789
M=D // 10790

////PushInstruction("constant 0")
@SP // 10791
AM=M+1 // 10792
A=A-1 // 10793
M=0 // 10794

////PushInstruction("constant 12")
@12 // 10795
D=A // 10796
@SP // 10797
AM=M+1 // 10798
A=A-1 // 10799
M=D // 10800

////PushInstruction("constant 12")
@12 // 10801
D=A // 10802
@SP // 10803
AM=M+1 // 10804
A=A-1 // 10805
M=D // 10806

////PushInstruction("constant 0")
@SP // 10807
AM=M+1 // 10808
A=A-1 // 10809
M=0 // 10810

////PushInstruction("constant 0")
@SP // 10811
AM=M+1 // 10812
A=A-1 // 10813
M=0 // 10814

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=34}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10815
D=A // 10816
@14 // 10817
M=D // 10818
@Output.create // 10819
D=A // 10820
@13 // 10821
M=D // 10822
@Output.initMap.ret.34 // 10823
D=A // 10824
@CALL // 10825
0;JMP // 10826
(Output.initMap.ret.34)

////PopInstruction{address=temp 0}
@SP // 10827
AM=M-1 // 10828
D=M // 10829
@5 // 10830
M=D // 10831

////PushInstruction("constant 65")
@65 // 10832
D=A // 10833
@SP // 10834
AM=M+1 // 10835
A=A-1 // 10836
M=D // 10837

////PushInstruction("constant 12")
@12 // 10838
D=A // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=D // 10843

////PushInstruction("constant 30")
@30 // 10844
D=A // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=D // 10849

////PushInstruction("constant 51")
@51 // 10850
D=A // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=D // 10855

////PushInstruction("constant 51")
@51 // 10856
D=A // 10857
@SP // 10858
AM=M+1 // 10859
A=A-1 // 10860
M=D // 10861

////PushInstruction("constant 63")
@63 // 10862
D=A // 10863
@SP // 10864
AM=M+1 // 10865
A=A-1 // 10866
M=D // 10867

////PushInstruction("constant 51")
@51 // 10868
D=A // 10869
@SP // 10870
AM=M+1 // 10871
A=A-1 // 10872
M=D // 10873

////PushInstruction("constant 51")
@51 // 10874
D=A // 10875
@SP // 10876
AM=M+1 // 10877
A=A-1 // 10878
M=D // 10879

////PushInstruction("constant 51")
@51 // 10880
D=A // 10881
@SP // 10882
AM=M+1 // 10883
A=A-1 // 10884
M=D // 10885

////PushInstruction("constant 51")
@51 // 10886
D=A // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=D // 10891

////PushInstruction("constant 0")
@SP // 10892
AM=M+1 // 10893
A=A-1 // 10894
M=0 // 10895

////PushInstruction("constant 0")
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=0 // 10899

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=35}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10900
D=A // 10901
@14 // 10902
M=D // 10903
@Output.create // 10904
D=A // 10905
@13 // 10906
M=D // 10907
@Output.initMap.ret.35 // 10908
D=A // 10909
@CALL // 10910
0;JMP // 10911
(Output.initMap.ret.35)

////PopInstruction{address=temp 0}
@SP // 10912
AM=M-1 // 10913
D=M // 10914
@5 // 10915
M=D // 10916

////PushInstruction("constant 66")
@66 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922

////PushInstruction("constant 31")
@31 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928

////PushInstruction("constant 51")
@51 // 10929
D=A // 10930
@SP // 10931
AM=M+1 // 10932
A=A-1 // 10933
M=D // 10934

////PushInstruction("constant 51")
@51 // 10935
D=A // 10936
@SP // 10937
AM=M+1 // 10938
A=A-1 // 10939
M=D // 10940

////PushInstruction("constant 51")
@51 // 10941
D=A // 10942
@SP // 10943
AM=M+1 // 10944
A=A-1 // 10945
M=D // 10946

////PushInstruction("constant 31")
@31 // 10947
D=A // 10948
@SP // 10949
AM=M+1 // 10950
A=A-1 // 10951
M=D // 10952

////PushInstruction("constant 51")
@51 // 10953
D=A // 10954
@SP // 10955
AM=M+1 // 10956
A=A-1 // 10957
M=D // 10958

////PushInstruction("constant 51")
@51 // 10959
D=A // 10960
@SP // 10961
AM=M+1 // 10962
A=A-1 // 10963
M=D // 10964

////PushInstruction("constant 51")
@51 // 10965
D=A // 10966
@SP // 10967
AM=M+1 // 10968
A=A-1 // 10969
M=D // 10970

////PushInstruction("constant 31")
@31 // 10971
D=A // 10972
@SP // 10973
AM=M+1 // 10974
A=A-1 // 10975
M=D // 10976

////PushInstruction("constant 0")
@SP // 10977
AM=M+1 // 10978
A=A-1 // 10979
M=0 // 10980

////PushInstruction("constant 0")
@SP // 10981
AM=M+1 // 10982
A=A-1 // 10983
M=0 // 10984

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=36}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10985
D=A // 10986
@14 // 10987
M=D // 10988
@Output.create // 10989
D=A // 10990
@13 // 10991
M=D // 10992
@Output.initMap.ret.36 // 10993
D=A // 10994
@CALL // 10995
0;JMP // 10996
(Output.initMap.ret.36)

////PopInstruction{address=temp 0}
@SP // 10997
AM=M-1 // 10998
D=M // 10999
@5 // 11000
M=D // 11001

////PushInstruction("constant 67")
@67 // 11002
D=A // 11003
@SP // 11004
AM=M+1 // 11005
A=A-1 // 11006
M=D // 11007

////PushInstruction("constant 28")
@28 // 11008
D=A // 11009
@SP // 11010
AM=M+1 // 11011
A=A-1 // 11012
M=D // 11013

////PushInstruction("constant 54")
@54 // 11014
D=A // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=D // 11019

////PushInstruction("constant 35")
@35 // 11020
D=A // 11021
@SP // 11022
AM=M+1 // 11023
A=A-1 // 11024
M=D // 11025

////PushInstruction("constant 3")
@3 // 11026
D=A // 11027
@SP // 11028
AM=M+1 // 11029
A=A-1 // 11030
M=D // 11031

////PushInstruction("constant 3")
@3 // 11032
D=A // 11033
@SP // 11034
AM=M+1 // 11035
A=A-1 // 11036
M=D // 11037

////PushInstruction("constant 3")
@3 // 11038
D=A // 11039
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=D // 11043

////PushInstruction("constant 35")
@35 // 11044
D=A // 11045
@SP // 11046
AM=M+1 // 11047
A=A-1 // 11048
M=D // 11049

////PushInstruction("constant 54")
@54 // 11050
D=A // 11051
@SP // 11052
AM=M+1 // 11053
A=A-1 // 11054
M=D // 11055

////PushInstruction("constant 28")
@28 // 11056
D=A // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=D // 11061

////PushInstruction("constant 0")
@SP // 11062
AM=M+1 // 11063
A=A-1 // 11064
M=0 // 11065

////PushInstruction("constant 0")
@SP // 11066
AM=M+1 // 11067
A=A-1 // 11068
M=0 // 11069

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=37}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11070
D=A // 11071
@14 // 11072
M=D // 11073
@Output.create // 11074
D=A // 11075
@13 // 11076
M=D // 11077
@Output.initMap.ret.37 // 11078
D=A // 11079
@CALL // 11080
0;JMP // 11081
(Output.initMap.ret.37)

////PopInstruction{address=temp 0}
@SP // 11082
AM=M-1 // 11083
D=M // 11084
@5 // 11085
M=D // 11086

////PushInstruction("constant 68")
@68 // 11087
D=A // 11088
@SP // 11089
AM=M+1 // 11090
A=A-1 // 11091
M=D // 11092

////PushInstruction("constant 15")
@15 // 11093
D=A // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=D // 11098

////PushInstruction("constant 27")
@27 // 11099
D=A // 11100
@SP // 11101
AM=M+1 // 11102
A=A-1 // 11103
M=D // 11104

////PushInstruction("constant 51")
@51 // 11105
D=A // 11106
@SP // 11107
AM=M+1 // 11108
A=A-1 // 11109
M=D // 11110

////PushInstruction("constant 51")
@51 // 11111
D=A // 11112
@SP // 11113
AM=M+1 // 11114
A=A-1 // 11115
M=D // 11116

////PushInstruction("constant 51")
@51 // 11117
D=A // 11118
@SP // 11119
AM=M+1 // 11120
A=A-1 // 11121
M=D // 11122

////PushInstruction("constant 51")
@51 // 11123
D=A // 11124
@SP // 11125
AM=M+1 // 11126
A=A-1 // 11127
M=D // 11128

////PushInstruction("constant 51")
@51 // 11129
D=A // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=D // 11134

////PushInstruction("constant 27")
@27 // 11135
D=A // 11136
@SP // 11137
AM=M+1 // 11138
A=A-1 // 11139
M=D // 11140

////PushInstruction("constant 15")
@15 // 11141
D=A // 11142
@SP // 11143
AM=M+1 // 11144
A=A-1 // 11145
M=D // 11146

////PushInstruction("constant 0")
@SP // 11147
AM=M+1 // 11148
A=A-1 // 11149
M=0 // 11150

////PushInstruction("constant 0")
@SP // 11151
AM=M+1 // 11152
A=A-1 // 11153
M=0 // 11154

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=38}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11155
D=A // 11156
@14 // 11157
M=D // 11158
@Output.create // 11159
D=A // 11160
@13 // 11161
M=D // 11162
@Output.initMap.ret.38 // 11163
D=A // 11164
@CALL // 11165
0;JMP // 11166
(Output.initMap.ret.38)

////PopInstruction{address=temp 0}
@SP // 11167
AM=M-1 // 11168
D=M // 11169
@5 // 11170
M=D // 11171

////PushInstruction("constant 69")
@69 // 11172
D=A // 11173
@SP // 11174
AM=M+1 // 11175
A=A-1 // 11176
M=D // 11177

////PushInstruction("constant 63")
@63 // 11178
D=A // 11179
@SP // 11180
AM=M+1 // 11181
A=A-1 // 11182
M=D // 11183

////PushInstruction("constant 51")
@51 // 11184
D=A // 11185
@SP // 11186
AM=M+1 // 11187
A=A-1 // 11188
M=D // 11189

////PushInstruction("constant 35")
@35 // 11190
D=A // 11191
@SP // 11192
AM=M+1 // 11193
A=A-1 // 11194
M=D // 11195

////PushInstruction("constant 11")
@11 // 11196
D=A // 11197
@SP // 11198
AM=M+1 // 11199
A=A-1 // 11200
M=D // 11201

////PushInstruction("constant 15")
@15 // 11202
D=A // 11203
@SP // 11204
AM=M+1 // 11205
A=A-1 // 11206
M=D // 11207

////PushInstruction("constant 11")
@11 // 11208
D=A // 11209
@SP // 11210
AM=M+1 // 11211
A=A-1 // 11212
M=D // 11213

////PushInstruction("constant 35")
@35 // 11214
D=A // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=D // 11219

////PushInstruction("constant 51")
@51 // 11220
D=A // 11221
@SP // 11222
AM=M+1 // 11223
A=A-1 // 11224
M=D // 11225

////PushInstruction("constant 63")
@63 // 11226
D=A // 11227
@SP // 11228
AM=M+1 // 11229
A=A-1 // 11230
M=D // 11231

////PushInstruction("constant 0")
@SP // 11232
AM=M+1 // 11233
A=A-1 // 11234
M=0 // 11235

////PushInstruction("constant 0")
@SP // 11236
AM=M+1 // 11237
A=A-1 // 11238
M=0 // 11239

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=39}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11240
D=A // 11241
@14 // 11242
M=D // 11243
@Output.create // 11244
D=A // 11245
@13 // 11246
M=D // 11247
@Output.initMap.ret.39 // 11248
D=A // 11249
@CALL // 11250
0;JMP // 11251
(Output.initMap.ret.39)

////PopInstruction{address=temp 0}
@SP // 11252
AM=M-1 // 11253
D=M // 11254
@5 // 11255
M=D // 11256

////PushInstruction("constant 70")
@70 // 11257
D=A // 11258
@SP // 11259
AM=M+1 // 11260
A=A-1 // 11261
M=D // 11262

////PushInstruction("constant 63")
@63 // 11263
D=A // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=D // 11268

////PushInstruction("constant 51")
@51 // 11269
D=A // 11270
@SP // 11271
AM=M+1 // 11272
A=A-1 // 11273
M=D // 11274

////PushInstruction("constant 35")
@35 // 11275
D=A // 11276
@SP // 11277
AM=M+1 // 11278
A=A-1 // 11279
M=D // 11280

////PushInstruction("constant 11")
@11 // 11281
D=A // 11282
@SP // 11283
AM=M+1 // 11284
A=A-1 // 11285
M=D // 11286

////PushInstruction("constant 15")
@15 // 11287
D=A // 11288
@SP // 11289
AM=M+1 // 11290
A=A-1 // 11291
M=D // 11292

////PushInstruction("constant 11")
@11 // 11293
D=A // 11294
@SP // 11295
AM=M+1 // 11296
A=A-1 // 11297
M=D // 11298

////PushInstruction("constant 3")
@3 // 11299
D=A // 11300
@SP // 11301
AM=M+1 // 11302
A=A-1 // 11303
M=D // 11304

////PushInstruction("constant 3")
@3 // 11305
D=A // 11306
@SP // 11307
AM=M+1 // 11308
A=A-1 // 11309
M=D // 11310

////PushInstruction("constant 3")
@3 // 11311
D=A // 11312
@SP // 11313
AM=M+1 // 11314
A=A-1 // 11315
M=D // 11316

////PushInstruction("constant 0")
@SP // 11317
AM=M+1 // 11318
A=A-1 // 11319
M=0 // 11320

////PushInstruction("constant 0")
@SP // 11321
AM=M+1 // 11322
A=A-1 // 11323
M=0 // 11324

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=40}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11325
D=A // 11326
@14 // 11327
M=D // 11328
@Output.create // 11329
D=A // 11330
@13 // 11331
M=D // 11332
@Output.initMap.ret.40 // 11333
D=A // 11334
@CALL // 11335
0;JMP // 11336
(Output.initMap.ret.40)

////PopInstruction{address=temp 0}
@SP // 11337
AM=M-1 // 11338
D=M // 11339
@5 // 11340
M=D // 11341

////PushInstruction("constant 71")
@71 // 11342
D=A // 11343
@SP // 11344
AM=M+1 // 11345
A=A-1 // 11346
M=D // 11347

////PushInstruction("constant 28")
@28 // 11348
D=A // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=D // 11353

////PushInstruction("constant 54")
@54 // 11354
D=A // 11355
@SP // 11356
AM=M+1 // 11357
A=A-1 // 11358
M=D // 11359

////PushInstruction("constant 35")
@35 // 11360
D=A // 11361
@SP // 11362
AM=M+1 // 11363
A=A-1 // 11364
M=D // 11365

////PushInstruction("constant 3")
@3 // 11366
D=A // 11367
@SP // 11368
AM=M+1 // 11369
A=A-1 // 11370
M=D // 11371

////PushInstruction("constant 59")
@59 // 11372
D=A // 11373
@SP // 11374
AM=M+1 // 11375
A=A-1 // 11376
M=D // 11377

////PushInstruction("constant 51")
@51 // 11378
D=A // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=D // 11383

////PushInstruction("constant 51")
@51 // 11384
D=A // 11385
@SP // 11386
AM=M+1 // 11387
A=A-1 // 11388
M=D // 11389

////PushInstruction("constant 54")
@54 // 11390
D=A // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=D // 11395

////PushInstruction("constant 44")
@44 // 11396
D=A // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=D // 11401

////PushInstruction("constant 0")
@SP // 11402
AM=M+1 // 11403
A=A-1 // 11404
M=0 // 11405

////PushInstruction("constant 0")
@SP // 11406
AM=M+1 // 11407
A=A-1 // 11408
M=0 // 11409

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=41}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11410
D=A // 11411
@14 // 11412
M=D // 11413
@Output.create // 11414
D=A // 11415
@13 // 11416
M=D // 11417
@Output.initMap.ret.41 // 11418
D=A // 11419
@CALL // 11420
0;JMP // 11421
(Output.initMap.ret.41)

////PopInstruction{address=temp 0}
@SP // 11422
AM=M-1 // 11423
D=M // 11424
@5 // 11425
M=D // 11426

////PushInstruction("constant 72")
@72 // 11427
D=A // 11428
@SP // 11429
AM=M+1 // 11430
A=A-1 // 11431
M=D // 11432

////PushInstruction("constant 51")
@51 // 11433
D=A // 11434
@SP // 11435
AM=M+1 // 11436
A=A-1 // 11437
M=D // 11438

////PushInstruction("constant 51")
@51 // 11439
D=A // 11440
@SP // 11441
AM=M+1 // 11442
A=A-1 // 11443
M=D // 11444

////PushInstruction("constant 51")
@51 // 11445
D=A // 11446
@SP // 11447
AM=M+1 // 11448
A=A-1 // 11449
M=D // 11450

////PushInstruction("constant 51")
@51 // 11451
D=A // 11452
@SP // 11453
AM=M+1 // 11454
A=A-1 // 11455
M=D // 11456

////PushInstruction("constant 63")
@63 // 11457
D=A // 11458
@SP // 11459
AM=M+1 // 11460
A=A-1 // 11461
M=D // 11462

////PushInstruction("constant 51")
@51 // 11463
D=A // 11464
@SP // 11465
AM=M+1 // 11466
A=A-1 // 11467
M=D // 11468

////PushInstruction("constant 51")
@51 // 11469
D=A // 11470
@SP // 11471
AM=M+1 // 11472
A=A-1 // 11473
M=D // 11474

////PushInstruction("constant 51")
@51 // 11475
D=A // 11476
@SP // 11477
AM=M+1 // 11478
A=A-1 // 11479
M=D // 11480

////PushInstruction("constant 51")
@51 // 11481
D=A // 11482
@SP // 11483
AM=M+1 // 11484
A=A-1 // 11485
M=D // 11486

////PushInstruction("constant 0")
@SP // 11487
AM=M+1 // 11488
A=A-1 // 11489
M=0 // 11490

////PushInstruction("constant 0")
@SP // 11491
AM=M+1 // 11492
A=A-1 // 11493
M=0 // 11494

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=42}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11495
D=A // 11496
@14 // 11497
M=D // 11498
@Output.create // 11499
D=A // 11500
@13 // 11501
M=D // 11502
@Output.initMap.ret.42 // 11503
D=A // 11504
@CALL // 11505
0;JMP // 11506
(Output.initMap.ret.42)

////PopInstruction{address=temp 0}
@SP // 11507
AM=M-1 // 11508
D=M // 11509
@5 // 11510
M=D // 11511

////PushInstruction("constant 73")
@73 // 11512
D=A // 11513
@SP // 11514
AM=M+1 // 11515
A=A-1 // 11516
M=D // 11517

////PushInstruction("constant 30")
@30 // 11518
D=A // 11519
@SP // 11520
AM=M+1 // 11521
A=A-1 // 11522
M=D // 11523

////PushInstruction("constant 12")
@12 // 11524
D=A // 11525
@SP // 11526
AM=M+1 // 11527
A=A-1 // 11528
M=D // 11529

////PushInstruction("constant 12")
@12 // 11530
D=A // 11531
@SP // 11532
AM=M+1 // 11533
A=A-1 // 11534
M=D // 11535

////PushInstruction("constant 12")
@12 // 11536
D=A // 11537
@SP // 11538
AM=M+1 // 11539
A=A-1 // 11540
M=D // 11541

////PushInstruction("constant 12")
@12 // 11542
D=A // 11543
@SP // 11544
AM=M+1 // 11545
A=A-1 // 11546
M=D // 11547

////PushInstruction("constant 12")
@12 // 11548
D=A // 11549
@SP // 11550
AM=M+1 // 11551
A=A-1 // 11552
M=D // 11553

////PushInstruction("constant 12")
@12 // 11554
D=A // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=D // 11559

////PushInstruction("constant 12")
@12 // 11560
D=A // 11561
@SP // 11562
AM=M+1 // 11563
A=A-1 // 11564
M=D // 11565

////PushInstruction("constant 30")
@30 // 11566
D=A // 11567
@SP // 11568
AM=M+1 // 11569
A=A-1 // 11570
M=D // 11571

////PushInstruction("constant 0")
@SP // 11572
AM=M+1 // 11573
A=A-1 // 11574
M=0 // 11575

////PushInstruction("constant 0")
@SP // 11576
AM=M+1 // 11577
A=A-1 // 11578
M=0 // 11579

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=43}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11580
D=A // 11581
@14 // 11582
M=D // 11583
@Output.create // 11584
D=A // 11585
@13 // 11586
M=D // 11587
@Output.initMap.ret.43 // 11588
D=A // 11589
@CALL // 11590
0;JMP // 11591
(Output.initMap.ret.43)

////PopInstruction{address=temp 0}
@SP // 11592
AM=M-1 // 11593
D=M // 11594
@5 // 11595
M=D // 11596

////PushInstruction("constant 74")
@74 // 11597
D=A // 11598
@SP // 11599
AM=M+1 // 11600
A=A-1 // 11601
M=D // 11602

////PushInstruction("constant 60")
@60 // 11603
D=A // 11604
@SP // 11605
AM=M+1 // 11606
A=A-1 // 11607
M=D // 11608

////PushInstruction("constant 24")
@24 // 11609
D=A // 11610
@SP // 11611
AM=M+1 // 11612
A=A-1 // 11613
M=D // 11614

////PushInstruction("constant 24")
@24 // 11615
D=A // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=D // 11620

////PushInstruction("constant 24")
@24 // 11621
D=A // 11622
@SP // 11623
AM=M+1 // 11624
A=A-1 // 11625
M=D // 11626

////PushInstruction("constant 24")
@24 // 11627
D=A // 11628
@SP // 11629
AM=M+1 // 11630
A=A-1 // 11631
M=D // 11632

////PushInstruction("constant 24")
@24 // 11633
D=A // 11634
@SP // 11635
AM=M+1 // 11636
A=A-1 // 11637
M=D // 11638

////PushInstruction("constant 27")
@27 // 11639
D=A // 11640
@SP // 11641
AM=M+1 // 11642
A=A-1 // 11643
M=D // 11644

////PushInstruction("constant 27")
@27 // 11645
D=A // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=D // 11650

////PushInstruction("constant 14")
@14 // 11651
D=A // 11652
@SP // 11653
AM=M+1 // 11654
A=A-1 // 11655
M=D // 11656

////PushInstruction("constant 0")
@SP // 11657
AM=M+1 // 11658
A=A-1 // 11659
M=0 // 11660

////PushInstruction("constant 0")
@SP // 11661
AM=M+1 // 11662
A=A-1 // 11663
M=0 // 11664

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=44}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11665
D=A // 11666
@14 // 11667
M=D // 11668
@Output.create // 11669
D=A // 11670
@13 // 11671
M=D // 11672
@Output.initMap.ret.44 // 11673
D=A // 11674
@CALL // 11675
0;JMP // 11676
(Output.initMap.ret.44)

////PopInstruction{address=temp 0}
@SP // 11677
AM=M-1 // 11678
D=M // 11679
@5 // 11680
M=D // 11681

////PushInstruction("constant 75")
@75 // 11682
D=A // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=D // 11687

////PushInstruction("constant 51")
@51 // 11688
D=A // 11689
@SP // 11690
AM=M+1 // 11691
A=A-1 // 11692
M=D // 11693

////PushInstruction("constant 51")
@51 // 11694
D=A // 11695
@SP // 11696
AM=M+1 // 11697
A=A-1 // 11698
M=D // 11699

////PushInstruction("constant 51")
@51 // 11700
D=A // 11701
@SP // 11702
AM=M+1 // 11703
A=A-1 // 11704
M=D // 11705

////PushInstruction("constant 27")
@27 // 11706
D=A // 11707
@SP // 11708
AM=M+1 // 11709
A=A-1 // 11710
M=D // 11711

////PushInstruction("constant 15")
@15 // 11712
D=A // 11713
@SP // 11714
AM=M+1 // 11715
A=A-1 // 11716
M=D // 11717

////PushInstruction("constant 27")
@27 // 11718
D=A // 11719
@SP // 11720
AM=M+1 // 11721
A=A-1 // 11722
M=D // 11723

////PushInstruction("constant 51")
@51 // 11724
D=A // 11725
@SP // 11726
AM=M+1 // 11727
A=A-1 // 11728
M=D // 11729

////PushInstruction("constant 51")
@51 // 11730
D=A // 11731
@SP // 11732
AM=M+1 // 11733
A=A-1 // 11734
M=D // 11735

////PushInstruction("constant 51")
@51 // 11736
D=A // 11737
@SP // 11738
AM=M+1 // 11739
A=A-1 // 11740
M=D // 11741

////PushInstruction("constant 0")
@SP // 11742
AM=M+1 // 11743
A=A-1 // 11744
M=0 // 11745

////PushInstruction("constant 0")
@SP // 11746
AM=M+1 // 11747
A=A-1 // 11748
M=0 // 11749

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=45}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11750
D=A // 11751
@14 // 11752
M=D // 11753
@Output.create // 11754
D=A // 11755
@13 // 11756
M=D // 11757
@Output.initMap.ret.45 // 11758
D=A // 11759
@CALL // 11760
0;JMP // 11761
(Output.initMap.ret.45)

////PopInstruction{address=temp 0}
@SP // 11762
AM=M-1 // 11763
D=M // 11764
@5 // 11765
M=D // 11766

////PushInstruction("constant 76")
@76 // 11767
D=A // 11768
@SP // 11769
AM=M+1 // 11770
A=A-1 // 11771
M=D // 11772

////PushInstruction("constant 3")
@3 // 11773
D=A // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=D // 11778

////PushInstruction("constant 3")
@3 // 11779
D=A // 11780
@SP // 11781
AM=M+1 // 11782
A=A-1 // 11783
M=D // 11784

////PushInstruction("constant 3")
@3 // 11785
D=A // 11786
@SP // 11787
AM=M+1 // 11788
A=A-1 // 11789
M=D // 11790

////PushInstruction("constant 3")
@3 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796

////PushInstruction("constant 3")
@3 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802

////PushInstruction("constant 3")
@3 // 11803
D=A // 11804
@SP // 11805
AM=M+1 // 11806
A=A-1 // 11807
M=D // 11808

////PushInstruction("constant 35")
@35 // 11809
D=A // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=D // 11814

////PushInstruction("constant 51")
@51 // 11815
D=A // 11816
@SP // 11817
AM=M+1 // 11818
A=A-1 // 11819
M=D // 11820

////PushInstruction("constant 63")
@63 // 11821
D=A // 11822
@SP // 11823
AM=M+1 // 11824
A=A-1 // 11825
M=D // 11826

////PushInstruction("constant 0")
@SP // 11827
AM=M+1 // 11828
A=A-1 // 11829
M=0 // 11830

////PushInstruction("constant 0")
@SP // 11831
AM=M+1 // 11832
A=A-1 // 11833
M=0 // 11834

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=46}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11835
D=A // 11836
@14 // 11837
M=D // 11838
@Output.create // 11839
D=A // 11840
@13 // 11841
M=D // 11842
@Output.initMap.ret.46 // 11843
D=A // 11844
@CALL // 11845
0;JMP // 11846
(Output.initMap.ret.46)

////PopInstruction{address=temp 0}
@SP // 11847
AM=M-1 // 11848
D=M // 11849
@5 // 11850
M=D // 11851

////PushInstruction("constant 77")
@77 // 11852
D=A // 11853
@SP // 11854
AM=M+1 // 11855
A=A-1 // 11856
M=D // 11857

////PushInstruction("constant 33")
@33 // 11858
D=A // 11859
@SP // 11860
AM=M+1 // 11861
A=A-1 // 11862
M=D // 11863

////PushInstruction("constant 51")
@51 // 11864
D=A // 11865
@SP // 11866
AM=M+1 // 11867
A=A-1 // 11868
M=D // 11869

////PushInstruction("constant 63")
@63 // 11870
D=A // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=D // 11875

////PushInstruction("constant 63")
@63 // 11876
D=A // 11877
@SP // 11878
AM=M+1 // 11879
A=A-1 // 11880
M=D // 11881

////PushInstruction("constant 51")
@51 // 11882
D=A // 11883
@SP // 11884
AM=M+1 // 11885
A=A-1 // 11886
M=D // 11887

////PushInstruction("constant 51")
@51 // 11888
D=A // 11889
@SP // 11890
AM=M+1 // 11891
A=A-1 // 11892
M=D // 11893

////PushInstruction("constant 51")
@51 // 11894
D=A // 11895
@SP // 11896
AM=M+1 // 11897
A=A-1 // 11898
M=D // 11899

////PushInstruction("constant 51")
@51 // 11900
D=A // 11901
@SP // 11902
AM=M+1 // 11903
A=A-1 // 11904
M=D // 11905

////PushInstruction("constant 51")
@51 // 11906
D=A // 11907
@SP // 11908
AM=M+1 // 11909
A=A-1 // 11910
M=D // 11911

////PushInstruction("constant 0")
@SP // 11912
AM=M+1 // 11913
A=A-1 // 11914
M=0 // 11915

////PushInstruction("constant 0")
@SP // 11916
AM=M+1 // 11917
A=A-1 // 11918
M=0 // 11919

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=47}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11920
D=A // 11921
@14 // 11922
M=D // 11923
@Output.create // 11924
D=A // 11925
@13 // 11926
M=D // 11927
@Output.initMap.ret.47 // 11928
D=A // 11929
@CALL // 11930
0;JMP // 11931
(Output.initMap.ret.47)

////PopInstruction{address=temp 0}
@SP // 11932
AM=M-1 // 11933
D=M // 11934
@5 // 11935
M=D // 11936

////PushInstruction("constant 78")
@78 // 11937
D=A // 11938
@SP // 11939
AM=M+1 // 11940
A=A-1 // 11941
M=D // 11942

////PushInstruction("constant 51")
@51 // 11943
D=A // 11944
@SP // 11945
AM=M+1 // 11946
A=A-1 // 11947
M=D // 11948

////PushInstruction("constant 51")
@51 // 11949
D=A // 11950
@SP // 11951
AM=M+1 // 11952
A=A-1 // 11953
M=D // 11954

////PushInstruction("constant 55")
@55 // 11955
D=A // 11956
@SP // 11957
AM=M+1 // 11958
A=A-1 // 11959
M=D // 11960

////PushInstruction("constant 55")
@55 // 11961
D=A // 11962
@SP // 11963
AM=M+1 // 11964
A=A-1 // 11965
M=D // 11966

////PushInstruction("constant 63")
@63 // 11967
D=A // 11968
@SP // 11969
AM=M+1 // 11970
A=A-1 // 11971
M=D // 11972

////PushInstruction("constant 59")
@59 // 11973
D=A // 11974
@SP // 11975
AM=M+1 // 11976
A=A-1 // 11977
M=D // 11978

////PushInstruction("constant 59")
@59 // 11979
D=A // 11980
@SP // 11981
AM=M+1 // 11982
A=A-1 // 11983
M=D // 11984

////PushInstruction("constant 51")
@51 // 11985
D=A // 11986
@SP // 11987
AM=M+1 // 11988
A=A-1 // 11989
M=D // 11990

////PushInstruction("constant 51")
@51 // 11991
D=A // 11992
@SP // 11993
AM=M+1 // 11994
A=A-1 // 11995
M=D // 11996

////PushInstruction("constant 0")
@SP // 11997
AM=M+1 // 11998
A=A-1 // 11999
M=0 // 12000

////PushInstruction("constant 0")
@SP // 12001
AM=M+1 // 12002
A=A-1 // 12003
M=0 // 12004

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=48}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12005
D=A // 12006
@14 // 12007
M=D // 12008
@Output.create // 12009
D=A // 12010
@13 // 12011
M=D // 12012
@Output.initMap.ret.48 // 12013
D=A // 12014
@CALL // 12015
0;JMP // 12016
(Output.initMap.ret.48)

////PopInstruction{address=temp 0}
@SP // 12017
AM=M-1 // 12018
D=M // 12019
@5 // 12020
M=D // 12021

////PushInstruction("constant 79")
@79 // 12022
D=A // 12023
@SP // 12024
AM=M+1 // 12025
A=A-1 // 12026
M=D // 12027

////PushInstruction("constant 30")
@30 // 12028
D=A // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=D // 12033

////PushInstruction("constant 51")
@51 // 12034
D=A // 12035
@SP // 12036
AM=M+1 // 12037
A=A-1 // 12038
M=D // 12039

////PushInstruction("constant 51")
@51 // 12040
D=A // 12041
@SP // 12042
AM=M+1 // 12043
A=A-1 // 12044
M=D // 12045

////PushInstruction("constant 51")
@51 // 12046
D=A // 12047
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=D // 12051

////PushInstruction("constant 51")
@51 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057

////PushInstruction("constant 51")
@51 // 12058
D=A // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=D // 12063

////PushInstruction("constant 51")
@51 // 12064
D=A // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=D // 12069

////PushInstruction("constant 51")
@51 // 12070
D=A // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=D // 12075

////PushInstruction("constant 30")
@30 // 12076
D=A // 12077
@SP // 12078
AM=M+1 // 12079
A=A-1 // 12080
M=D // 12081

////PushInstruction("constant 0")
@SP // 12082
AM=M+1 // 12083
A=A-1 // 12084
M=0 // 12085

////PushInstruction("constant 0")
@SP // 12086
AM=M+1 // 12087
A=A-1 // 12088
M=0 // 12089

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=49}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12090
D=A // 12091
@14 // 12092
M=D // 12093
@Output.create // 12094
D=A // 12095
@13 // 12096
M=D // 12097
@Output.initMap.ret.49 // 12098
D=A // 12099
@CALL // 12100
0;JMP // 12101
(Output.initMap.ret.49)

////PopInstruction{address=temp 0}
@SP // 12102
AM=M-1 // 12103
D=M // 12104
@5 // 12105
M=D // 12106

////PushInstruction("constant 80")
@80 // 12107
D=A // 12108
@SP // 12109
AM=M+1 // 12110
A=A-1 // 12111
M=D // 12112

////PushInstruction("constant 31")
@31 // 12113
D=A // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118

////PushInstruction("constant 51")
@51 // 12119
D=A // 12120
@SP // 12121
AM=M+1 // 12122
A=A-1 // 12123
M=D // 12124

////PushInstruction("constant 51")
@51 // 12125
D=A // 12126
@SP // 12127
AM=M+1 // 12128
A=A-1 // 12129
M=D // 12130

////PushInstruction("constant 51")
@51 // 12131
D=A // 12132
@SP // 12133
AM=M+1 // 12134
A=A-1 // 12135
M=D // 12136

////PushInstruction("constant 31")
@31 // 12137
D=A // 12138
@SP // 12139
AM=M+1 // 12140
A=A-1 // 12141
M=D // 12142

////PushInstruction("constant 3")
@3 // 12143
D=A // 12144
@SP // 12145
AM=M+1 // 12146
A=A-1 // 12147
M=D // 12148

////PushInstruction("constant 3")
@3 // 12149
D=A // 12150
@SP // 12151
AM=M+1 // 12152
A=A-1 // 12153
M=D // 12154

////PushInstruction("constant 3")
@3 // 12155
D=A // 12156
@SP // 12157
AM=M+1 // 12158
A=A-1 // 12159
M=D // 12160

////PushInstruction("constant 3")
@3 // 12161
D=A // 12162
@SP // 12163
AM=M+1 // 12164
A=A-1 // 12165
M=D // 12166

////PushInstruction("constant 0")
@SP // 12167
AM=M+1 // 12168
A=A-1 // 12169
M=0 // 12170

////PushInstruction("constant 0")
@SP // 12171
AM=M+1 // 12172
A=A-1 // 12173
M=0 // 12174

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=50}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12175
D=A // 12176
@14 // 12177
M=D // 12178
@Output.create // 12179
D=A // 12180
@13 // 12181
M=D // 12182
@Output.initMap.ret.50 // 12183
D=A // 12184
@CALL // 12185
0;JMP // 12186
(Output.initMap.ret.50)

////PopInstruction{address=temp 0}
@SP // 12187
AM=M-1 // 12188
D=M // 12189
@5 // 12190
M=D // 12191

////PushInstruction("constant 81")
@81 // 12192
D=A // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197

////PushInstruction("constant 30")
@30 // 12198
D=A // 12199
@SP // 12200
AM=M+1 // 12201
A=A-1 // 12202
M=D // 12203

////PushInstruction("constant 51")
@51 // 12204
D=A // 12205
@SP // 12206
AM=M+1 // 12207
A=A-1 // 12208
M=D // 12209

////PushInstruction("constant 51")
@51 // 12210
D=A // 12211
@SP // 12212
AM=M+1 // 12213
A=A-1 // 12214
M=D // 12215

////PushInstruction("constant 51")
@51 // 12216
D=A // 12217
@SP // 12218
AM=M+1 // 12219
A=A-1 // 12220
M=D // 12221

////PushInstruction("constant 51")
@51 // 12222
D=A // 12223
@SP // 12224
AM=M+1 // 12225
A=A-1 // 12226
M=D // 12227

////PushInstruction("constant 51")
@51 // 12228
D=A // 12229
@SP // 12230
AM=M+1 // 12231
A=A-1 // 12232
M=D // 12233

////PushInstruction("constant 63")
@63 // 12234
D=A // 12235
@SP // 12236
AM=M+1 // 12237
A=A-1 // 12238
M=D // 12239

////PushInstruction("constant 59")
@59 // 12240
D=A // 12241
@SP // 12242
AM=M+1 // 12243
A=A-1 // 12244
M=D // 12245

////PushInstruction("constant 30")
@30 // 12246
D=A // 12247
@SP // 12248
AM=M+1 // 12249
A=A-1 // 12250
M=D // 12251

////PushInstruction("constant 48")
@48 // 12252
D=A // 12253
@SP // 12254
AM=M+1 // 12255
A=A-1 // 12256
M=D // 12257

////PushInstruction("constant 0")
@SP // 12258
AM=M+1 // 12259
A=A-1 // 12260
M=0 // 12261

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=51}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12262
D=A // 12263
@14 // 12264
M=D // 12265
@Output.create // 12266
D=A // 12267
@13 // 12268
M=D // 12269
@Output.initMap.ret.51 // 12270
D=A // 12271
@CALL // 12272
0;JMP // 12273
(Output.initMap.ret.51)

////PopInstruction{address=temp 0}
@SP // 12274
AM=M-1 // 12275
D=M // 12276
@5 // 12277
M=D // 12278

////PushInstruction("constant 82")
@82 // 12279
D=A // 12280
@SP // 12281
AM=M+1 // 12282
A=A-1 // 12283
M=D // 12284

////PushInstruction("constant 31")
@31 // 12285
D=A // 12286
@SP // 12287
AM=M+1 // 12288
A=A-1 // 12289
M=D // 12290

////PushInstruction("constant 51")
@51 // 12291
D=A // 12292
@SP // 12293
AM=M+1 // 12294
A=A-1 // 12295
M=D // 12296

////PushInstruction("constant 51")
@51 // 12297
D=A // 12298
@SP // 12299
AM=M+1 // 12300
A=A-1 // 12301
M=D // 12302

////PushInstruction("constant 51")
@51 // 12303
D=A // 12304
@SP // 12305
AM=M+1 // 12306
A=A-1 // 12307
M=D // 12308

////PushInstruction("constant 31")
@31 // 12309
D=A // 12310
@SP // 12311
AM=M+1 // 12312
A=A-1 // 12313
M=D // 12314

////PushInstruction("constant 27")
@27 // 12315
D=A // 12316
@SP // 12317
AM=M+1 // 12318
A=A-1 // 12319
M=D // 12320

////PushInstruction("constant 51")
@51 // 12321
D=A // 12322
@SP // 12323
AM=M+1 // 12324
A=A-1 // 12325
M=D // 12326

////PushInstruction("constant 51")
@51 // 12327
D=A // 12328
@SP // 12329
AM=M+1 // 12330
A=A-1 // 12331
M=D // 12332

////PushInstruction("constant 51")
@51 // 12333
D=A // 12334
@SP // 12335
AM=M+1 // 12336
A=A-1 // 12337
M=D // 12338

////PushInstruction("constant 0")
@SP // 12339
AM=M+1 // 12340
A=A-1 // 12341
M=0 // 12342

////PushInstruction("constant 0")
@SP // 12343
AM=M+1 // 12344
A=A-1 // 12345
M=0 // 12346

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=52}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12347
D=A // 12348
@14 // 12349
M=D // 12350
@Output.create // 12351
D=A // 12352
@13 // 12353
M=D // 12354
@Output.initMap.ret.52 // 12355
D=A // 12356
@CALL // 12357
0;JMP // 12358
(Output.initMap.ret.52)

////PopInstruction{address=temp 0}
@SP // 12359
AM=M-1 // 12360
D=M // 12361
@5 // 12362
M=D // 12363

////PushInstruction("constant 83")
@83 // 12364
D=A // 12365
@SP // 12366
AM=M+1 // 12367
A=A-1 // 12368
M=D // 12369

////PushInstruction("constant 30")
@30 // 12370
D=A // 12371
@SP // 12372
AM=M+1 // 12373
A=A-1 // 12374
M=D // 12375

////PushInstruction("constant 51")
@51 // 12376
D=A // 12377
@SP // 12378
AM=M+1 // 12379
A=A-1 // 12380
M=D // 12381

////PushInstruction("constant 51")
@51 // 12382
D=A // 12383
@SP // 12384
AM=M+1 // 12385
A=A-1 // 12386
M=D // 12387

////PushInstruction("constant 6")
@6 // 12388
D=A // 12389
@SP // 12390
AM=M+1 // 12391
A=A-1 // 12392
M=D // 12393

////PushInstruction("constant 28")
@28 // 12394
D=A // 12395
@SP // 12396
AM=M+1 // 12397
A=A-1 // 12398
M=D // 12399

////PushInstruction("constant 48")
@48 // 12400
D=A // 12401
@SP // 12402
AM=M+1 // 12403
A=A-1 // 12404
M=D // 12405

////PushInstruction("constant 51")
@51 // 12406
D=A // 12407
@SP // 12408
AM=M+1 // 12409
A=A-1 // 12410
M=D // 12411

////PushInstruction("constant 51")
@51 // 12412
D=A // 12413
@SP // 12414
AM=M+1 // 12415
A=A-1 // 12416
M=D // 12417

////PushInstruction("constant 30")
@30 // 12418
D=A // 12419
@SP // 12420
AM=M+1 // 12421
A=A-1 // 12422
M=D // 12423

////PushInstruction("constant 0")
@SP // 12424
AM=M+1 // 12425
A=A-1 // 12426
M=0 // 12427

////PushInstruction("constant 0")
@SP // 12428
AM=M+1 // 12429
A=A-1 // 12430
M=0 // 12431

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=53}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12432
D=A // 12433
@14 // 12434
M=D // 12435
@Output.create // 12436
D=A // 12437
@13 // 12438
M=D // 12439
@Output.initMap.ret.53 // 12440
D=A // 12441
@CALL // 12442
0;JMP // 12443
(Output.initMap.ret.53)

////PopInstruction{address=temp 0}
@SP // 12444
AM=M-1 // 12445
D=M // 12446
@5 // 12447
M=D // 12448

////PushInstruction("constant 84")
@84 // 12449
D=A // 12450
@SP // 12451
AM=M+1 // 12452
A=A-1 // 12453
M=D // 12454

////PushInstruction("constant 63")
@63 // 12455
D=A // 12456
@SP // 12457
AM=M+1 // 12458
A=A-1 // 12459
M=D // 12460

////PushInstruction("constant 63")
@63 // 12461
D=A // 12462
@SP // 12463
AM=M+1 // 12464
A=A-1 // 12465
M=D // 12466

////PushInstruction("constant 45")
@45 // 12467
D=A // 12468
@SP // 12469
AM=M+1 // 12470
A=A-1 // 12471
M=D // 12472

////PushInstruction("constant 12")
@12 // 12473
D=A // 12474
@SP // 12475
AM=M+1 // 12476
A=A-1 // 12477
M=D // 12478

////PushInstruction("constant 12")
@12 // 12479
D=A // 12480
@SP // 12481
AM=M+1 // 12482
A=A-1 // 12483
M=D // 12484

////PushInstruction("constant 12")
@12 // 12485
D=A // 12486
@SP // 12487
AM=M+1 // 12488
A=A-1 // 12489
M=D // 12490

////PushInstruction("constant 12")
@12 // 12491
D=A // 12492
@SP // 12493
AM=M+1 // 12494
A=A-1 // 12495
M=D // 12496

////PushInstruction("constant 12")
@12 // 12497
D=A // 12498
@SP // 12499
AM=M+1 // 12500
A=A-1 // 12501
M=D // 12502

////PushInstruction("constant 30")
@30 // 12503
D=A // 12504
@SP // 12505
AM=M+1 // 12506
A=A-1 // 12507
M=D // 12508

////PushInstruction("constant 0")
@SP // 12509
AM=M+1 // 12510
A=A-1 // 12511
M=0 // 12512

////PushInstruction("constant 0")
@SP // 12513
AM=M+1 // 12514
A=A-1 // 12515
M=0 // 12516

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=54}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12517
D=A // 12518
@14 // 12519
M=D // 12520
@Output.create // 12521
D=A // 12522
@13 // 12523
M=D // 12524
@Output.initMap.ret.54 // 12525
D=A // 12526
@CALL // 12527
0;JMP // 12528
(Output.initMap.ret.54)

////PopInstruction{address=temp 0}
@SP // 12529
AM=M-1 // 12530
D=M // 12531
@5 // 12532
M=D // 12533

////PushInstruction("constant 85")
@85 // 12534
D=A // 12535
@SP // 12536
AM=M+1 // 12537
A=A-1 // 12538
M=D // 12539

////PushInstruction("constant 51")
@51 // 12540
D=A // 12541
@SP // 12542
AM=M+1 // 12543
A=A-1 // 12544
M=D // 12545

////PushInstruction("constant 51")
@51 // 12546
D=A // 12547
@SP // 12548
AM=M+1 // 12549
A=A-1 // 12550
M=D // 12551

////PushInstruction("constant 51")
@51 // 12552
D=A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557

////PushInstruction("constant 51")
@51 // 12558
D=A // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563

////PushInstruction("constant 51")
@51 // 12564
D=A // 12565
@SP // 12566
AM=M+1 // 12567
A=A-1 // 12568
M=D // 12569

////PushInstruction("constant 51")
@51 // 12570
D=A // 12571
@SP // 12572
AM=M+1 // 12573
A=A-1 // 12574
M=D // 12575

////PushInstruction("constant 51")
@51 // 12576
D=A // 12577
@SP // 12578
AM=M+1 // 12579
A=A-1 // 12580
M=D // 12581

////PushInstruction("constant 51")
@51 // 12582
D=A // 12583
@SP // 12584
AM=M+1 // 12585
A=A-1 // 12586
M=D // 12587

////PushInstruction("constant 30")
@30 // 12588
D=A // 12589
@SP // 12590
AM=M+1 // 12591
A=A-1 // 12592
M=D // 12593

////PushInstruction("constant 0")
@SP // 12594
AM=M+1 // 12595
A=A-1 // 12596
M=0 // 12597

////PushInstruction("constant 0")
@SP // 12598
AM=M+1 // 12599
A=A-1 // 12600
M=0 // 12601

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=55}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12602
D=A // 12603
@14 // 12604
M=D // 12605
@Output.create // 12606
D=A // 12607
@13 // 12608
M=D // 12609
@Output.initMap.ret.55 // 12610
D=A // 12611
@CALL // 12612
0;JMP // 12613
(Output.initMap.ret.55)

////PopInstruction{address=temp 0}
@SP // 12614
AM=M-1 // 12615
D=M // 12616
@5 // 12617
M=D // 12618

////PushInstruction("constant 86")
@86 // 12619
D=A // 12620
@SP // 12621
AM=M+1 // 12622
A=A-1 // 12623
M=D // 12624

////PushInstruction("constant 51")
@51 // 12625
D=A // 12626
@SP // 12627
AM=M+1 // 12628
A=A-1 // 12629
M=D // 12630

////PushInstruction("constant 51")
@51 // 12631
D=A // 12632
@SP // 12633
AM=M+1 // 12634
A=A-1 // 12635
M=D // 12636

////PushInstruction("constant 51")
@51 // 12637
D=A // 12638
@SP // 12639
AM=M+1 // 12640
A=A-1 // 12641
M=D // 12642

////PushInstruction("constant 51")
@51 // 12643
D=A // 12644
@SP // 12645
AM=M+1 // 12646
A=A-1 // 12647
M=D // 12648

////PushInstruction("constant 51")
@51 // 12649
D=A // 12650
@SP // 12651
AM=M+1 // 12652
A=A-1 // 12653
M=D // 12654

////PushInstruction("constant 30")
@30 // 12655
D=A // 12656
@SP // 12657
AM=M+1 // 12658
A=A-1 // 12659
M=D // 12660

////PushInstruction("constant 30")
@30 // 12661
D=A // 12662
@SP // 12663
AM=M+1 // 12664
A=A-1 // 12665
M=D // 12666

////PushInstruction("constant 12")
@12 // 12667
D=A // 12668
@SP // 12669
AM=M+1 // 12670
A=A-1 // 12671
M=D // 12672

////PushInstruction("constant 12")
@12 // 12673
D=A // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678

////PushInstruction("constant 0")
@SP // 12679
AM=M+1 // 12680
A=A-1 // 12681
M=0 // 12682

////PushInstruction("constant 0")
@SP // 12683
AM=M+1 // 12684
A=A-1 // 12685
M=0 // 12686

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=56}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12687
D=A // 12688
@14 // 12689
M=D // 12690
@Output.create // 12691
D=A // 12692
@13 // 12693
M=D // 12694
@Output.initMap.ret.56 // 12695
D=A // 12696
@CALL // 12697
0;JMP // 12698
(Output.initMap.ret.56)

////PopInstruction{address=temp 0}
@SP // 12699
AM=M-1 // 12700
D=M // 12701
@5 // 12702
M=D // 12703

////PushInstruction("constant 87")
@87 // 12704
D=A // 12705
@SP // 12706
AM=M+1 // 12707
A=A-1 // 12708
M=D // 12709

////PushInstruction("constant 51")
@51 // 12710
D=A // 12711
@SP // 12712
AM=M+1 // 12713
A=A-1 // 12714
M=D // 12715

////PushInstruction("constant 51")
@51 // 12716
D=A // 12717
@SP // 12718
AM=M+1 // 12719
A=A-1 // 12720
M=D // 12721

////PushInstruction("constant 51")
@51 // 12722
D=A // 12723
@SP // 12724
AM=M+1 // 12725
A=A-1 // 12726
M=D // 12727

////PushInstruction("constant 51")
@51 // 12728
D=A // 12729
@SP // 12730
AM=M+1 // 12731
A=A-1 // 12732
M=D // 12733

////PushInstruction("constant 51")
@51 // 12734
D=A // 12735
@SP // 12736
AM=M+1 // 12737
A=A-1 // 12738
M=D // 12739

////PushInstruction("constant 63")
@63 // 12740
D=A // 12741
@SP // 12742
AM=M+1 // 12743
A=A-1 // 12744
M=D // 12745

////PushInstruction("constant 63")
@63 // 12746
D=A // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751

////PushInstruction("constant 63")
@63 // 12752
D=A // 12753
@SP // 12754
AM=M+1 // 12755
A=A-1 // 12756
M=D // 12757

////PushInstruction("constant 18")
@18 // 12758
D=A // 12759
@SP // 12760
AM=M+1 // 12761
A=A-1 // 12762
M=D // 12763

////PushInstruction("constant 0")
@SP // 12764
AM=M+1 // 12765
A=A-1 // 12766
M=0 // 12767

////PushInstruction("constant 0")
@SP // 12768
AM=M+1 // 12769
A=A-1 // 12770
M=0 // 12771

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=57}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12772
D=A // 12773
@14 // 12774
M=D // 12775
@Output.create // 12776
D=A // 12777
@13 // 12778
M=D // 12779
@Output.initMap.ret.57 // 12780
D=A // 12781
@CALL // 12782
0;JMP // 12783
(Output.initMap.ret.57)

////PopInstruction{address=temp 0}
@SP // 12784
AM=M-1 // 12785
D=M // 12786
@5 // 12787
M=D // 12788

////PushInstruction("constant 88")
@88 // 12789
D=A // 12790
@SP // 12791
AM=M+1 // 12792
A=A-1 // 12793
M=D // 12794

////PushInstruction("constant 51")
@51 // 12795
D=A // 12796
@SP // 12797
AM=M+1 // 12798
A=A-1 // 12799
M=D // 12800

////PushInstruction("constant 51")
@51 // 12801
D=A // 12802
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=D // 12806

////PushInstruction("constant 30")
@30 // 12807
D=A // 12808
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=D // 12812

////PushInstruction("constant 30")
@30 // 12813
D=A // 12814
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=D // 12818

////PushInstruction("constant 12")
@12 // 12819
D=A // 12820
@SP // 12821
AM=M+1 // 12822
A=A-1 // 12823
M=D // 12824

////PushInstruction("constant 30")
@30 // 12825
D=A // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830

////PushInstruction("constant 30")
@30 // 12831
D=A // 12832
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=D // 12836

////PushInstruction("constant 51")
@51 // 12837
D=A // 12838
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=D // 12842

////PushInstruction("constant 51")
@51 // 12843
D=A // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848

////PushInstruction("constant 0")
@SP // 12849
AM=M+1 // 12850
A=A-1 // 12851
M=0 // 12852

////PushInstruction("constant 0")
@SP // 12853
AM=M+1 // 12854
A=A-1 // 12855
M=0 // 12856

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=58}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12857
D=A // 12858
@14 // 12859
M=D // 12860
@Output.create // 12861
D=A // 12862
@13 // 12863
M=D // 12864
@Output.initMap.ret.58 // 12865
D=A // 12866
@CALL // 12867
0;JMP // 12868
(Output.initMap.ret.58)

////PopInstruction{address=temp 0}
@SP // 12869
AM=M-1 // 12870
D=M // 12871
@5 // 12872
M=D // 12873

////PushInstruction("constant 89")
@89 // 12874
D=A // 12875
@SP // 12876
AM=M+1 // 12877
A=A-1 // 12878
M=D // 12879

////PushInstruction("constant 51")
@51 // 12880
D=A // 12881
@SP // 12882
AM=M+1 // 12883
A=A-1 // 12884
M=D // 12885

////PushInstruction("constant 51")
@51 // 12886
D=A // 12887
@SP // 12888
AM=M+1 // 12889
A=A-1 // 12890
M=D // 12891

////PushInstruction("constant 51")
@51 // 12892
D=A // 12893
@SP // 12894
AM=M+1 // 12895
A=A-1 // 12896
M=D // 12897

////PushInstruction("constant 51")
@51 // 12898
D=A // 12899
@SP // 12900
AM=M+1 // 12901
A=A-1 // 12902
M=D // 12903

////PushInstruction("constant 30")
@30 // 12904
D=A // 12905
@SP // 12906
AM=M+1 // 12907
A=A-1 // 12908
M=D // 12909

////PushInstruction("constant 12")
@12 // 12910
D=A // 12911
@SP // 12912
AM=M+1 // 12913
A=A-1 // 12914
M=D // 12915

////PushInstruction("constant 12")
@12 // 12916
D=A // 12917
@SP // 12918
AM=M+1 // 12919
A=A-1 // 12920
M=D // 12921

////PushInstruction("constant 12")
@12 // 12922
D=A // 12923
@SP // 12924
AM=M+1 // 12925
A=A-1 // 12926
M=D // 12927

////PushInstruction("constant 30")
@30 // 12928
D=A // 12929
@SP // 12930
AM=M+1 // 12931
A=A-1 // 12932
M=D // 12933

////PushInstruction("constant 0")
@SP // 12934
AM=M+1 // 12935
A=A-1 // 12936
M=0 // 12937

////PushInstruction("constant 0")
@SP // 12938
AM=M+1 // 12939
A=A-1 // 12940
M=0 // 12941

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=59}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12942
D=A // 12943
@14 // 12944
M=D // 12945
@Output.create // 12946
D=A // 12947
@13 // 12948
M=D // 12949
@Output.initMap.ret.59 // 12950
D=A // 12951
@CALL // 12952
0;JMP // 12953
(Output.initMap.ret.59)

////PopInstruction{address=temp 0}
@SP // 12954
AM=M-1 // 12955
D=M // 12956
@5 // 12957
M=D // 12958

////PushInstruction("constant 90")
@90 // 12959
D=A // 12960
@SP // 12961
AM=M+1 // 12962
A=A-1 // 12963
M=D // 12964

////PushInstruction("constant 63")
@63 // 12965
D=A // 12966
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=D // 12970

////PushInstruction("constant 51")
@51 // 12971
D=A // 12972
@SP // 12973
AM=M+1 // 12974
A=A-1 // 12975
M=D // 12976

////PushInstruction("constant 49")
@49 // 12977
D=A // 12978
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=D // 12982

////PushInstruction("constant 24")
@24 // 12983
D=A // 12984
@SP // 12985
AM=M+1 // 12986
A=A-1 // 12987
M=D // 12988

////PushInstruction("constant 12")
@12 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994

////PushInstruction("constant 6")
@6 // 12995
D=A // 12996
@SP // 12997
AM=M+1 // 12998
A=A-1 // 12999
M=D // 13000

////PushInstruction("constant 35")
@35 // 13001
D=A // 13002
@SP // 13003
AM=M+1 // 13004
A=A-1 // 13005
M=D // 13006

////PushInstruction("constant 51")
@51 // 13007
D=A // 13008
@SP // 13009
AM=M+1 // 13010
A=A-1 // 13011
M=D // 13012

////PushInstruction("constant 63")
@63 // 13013
D=A // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018

////PushInstruction("constant 0")
@SP // 13019
AM=M+1 // 13020
A=A-1 // 13021
M=0 // 13022

////PushInstruction("constant 0")
@SP // 13023
AM=M+1 // 13024
A=A-1 // 13025
M=0 // 13026

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=60}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13027
D=A // 13028
@14 // 13029
M=D // 13030
@Output.create // 13031
D=A // 13032
@13 // 13033
M=D // 13034
@Output.initMap.ret.60 // 13035
D=A // 13036
@CALL // 13037
0;JMP // 13038
(Output.initMap.ret.60)

////PopInstruction{address=temp 0}
@SP // 13039
AM=M-1 // 13040
D=M // 13041
@5 // 13042
M=D // 13043

////PushInstruction("constant 91")
@91 // 13044
D=A // 13045
@SP // 13046
AM=M+1 // 13047
A=A-1 // 13048
M=D // 13049

////PushInstruction("constant 30")
@30 // 13050
D=A // 13051
@SP // 13052
AM=M+1 // 13053
A=A-1 // 13054
M=D // 13055

////PushInstruction("constant 6")
@6 // 13056
D=A // 13057
@SP // 13058
AM=M+1 // 13059
A=A-1 // 13060
M=D // 13061

////PushInstruction("constant 6")
@6 // 13062
D=A // 13063
@SP // 13064
AM=M+1 // 13065
A=A-1 // 13066
M=D // 13067

////PushInstruction("constant 6")
@6 // 13068
D=A // 13069
@SP // 13070
AM=M+1 // 13071
A=A-1 // 13072
M=D // 13073

////PushInstruction("constant 6")
@6 // 13074
D=A // 13075
@SP // 13076
AM=M+1 // 13077
A=A-1 // 13078
M=D // 13079

////PushInstruction("constant 6")
@6 // 13080
D=A // 13081
@SP // 13082
AM=M+1 // 13083
A=A-1 // 13084
M=D // 13085

////PushInstruction("constant 6")
@6 // 13086
D=A // 13087
@SP // 13088
AM=M+1 // 13089
A=A-1 // 13090
M=D // 13091

////PushInstruction("constant 6")
@6 // 13092
D=A // 13093
@SP // 13094
AM=M+1 // 13095
A=A-1 // 13096
M=D // 13097

////PushInstruction("constant 30")
@30 // 13098
D=A // 13099
@SP // 13100
AM=M+1 // 13101
A=A-1 // 13102
M=D // 13103

////PushInstruction("constant 0")
@SP // 13104
AM=M+1 // 13105
A=A-1 // 13106
M=0 // 13107

////PushInstruction("constant 0")
@SP // 13108
AM=M+1 // 13109
A=A-1 // 13110
M=0 // 13111

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=61}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13112
D=A // 13113
@14 // 13114
M=D // 13115
@Output.create // 13116
D=A // 13117
@13 // 13118
M=D // 13119
@Output.initMap.ret.61 // 13120
D=A // 13121
@CALL // 13122
0;JMP // 13123
(Output.initMap.ret.61)

////PopInstruction{address=temp 0}
@SP // 13124
AM=M-1 // 13125
D=M // 13126
@5 // 13127
M=D // 13128

////PushInstruction("constant 92")
@92 // 13129
D=A // 13130
@SP // 13131
AM=M+1 // 13132
A=A-1 // 13133
M=D // 13134

////PushInstruction("constant 0")
@SP // 13135
AM=M+1 // 13136
A=A-1 // 13137
M=0 // 13138

////PushInstruction("constant 0")
@SP // 13139
AM=M+1 // 13140
A=A-1 // 13141
M=0 // 13142

////PushInstruction("constant 1")
@SP // 13143
AM=M+1 // 13144
A=A-1 // 13145
M=1 // 13146

////PushInstruction("constant 3")
@3 // 13147
D=A // 13148
@SP // 13149
AM=M+1 // 13150
A=A-1 // 13151
M=D // 13152

////PushInstruction("constant 6")
@6 // 13153
D=A // 13154
@SP // 13155
AM=M+1 // 13156
A=A-1 // 13157
M=D // 13158

////PushInstruction("constant 12")
@12 // 13159
D=A // 13160
@SP // 13161
AM=M+1 // 13162
A=A-1 // 13163
M=D // 13164

////PushInstruction("constant 24")
@24 // 13165
D=A // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=D // 13170

////PushInstruction("constant 48")
@48 // 13171
D=A // 13172
@SP // 13173
AM=M+1 // 13174
A=A-1 // 13175
M=D // 13176

////PushInstruction("constant 32")
@32 // 13177
D=A // 13178
@SP // 13179
AM=M+1 // 13180
A=A-1 // 13181
M=D // 13182

////PushInstruction("constant 0")
@SP // 13183
AM=M+1 // 13184
A=A-1 // 13185
M=0 // 13186

////PushInstruction("constant 0")
@SP // 13187
AM=M+1 // 13188
A=A-1 // 13189
M=0 // 13190

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=62}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13191
D=A // 13192
@14 // 13193
M=D // 13194
@Output.create // 13195
D=A // 13196
@13 // 13197
M=D // 13198
@Output.initMap.ret.62 // 13199
D=A // 13200
@CALL // 13201
0;JMP // 13202
(Output.initMap.ret.62)

////PopInstruction{address=temp 0}
@SP // 13203
AM=M-1 // 13204
D=M // 13205
@5 // 13206
M=D // 13207

////PushInstruction("constant 93")
@93 // 13208
D=A // 13209
@SP // 13210
AM=M+1 // 13211
A=A-1 // 13212
M=D // 13213

////PushInstruction("constant 30")
@30 // 13214
D=A // 13215
@SP // 13216
AM=M+1 // 13217
A=A-1 // 13218
M=D // 13219

////PushInstruction("constant 24")
@24 // 13220
D=A // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225

////PushInstruction("constant 24")
@24 // 13226
D=A // 13227
@SP // 13228
AM=M+1 // 13229
A=A-1 // 13230
M=D // 13231

////PushInstruction("constant 24")
@24 // 13232
D=A // 13233
@SP // 13234
AM=M+1 // 13235
A=A-1 // 13236
M=D // 13237

////PushInstruction("constant 24")
@24 // 13238
D=A // 13239
@SP // 13240
AM=M+1 // 13241
A=A-1 // 13242
M=D // 13243

////PushInstruction("constant 24")
@24 // 13244
D=A // 13245
@SP // 13246
AM=M+1 // 13247
A=A-1 // 13248
M=D // 13249

////PushInstruction("constant 24")
@24 // 13250
D=A // 13251
@SP // 13252
AM=M+1 // 13253
A=A-1 // 13254
M=D // 13255

////PushInstruction("constant 24")
@24 // 13256
D=A // 13257
@SP // 13258
AM=M+1 // 13259
A=A-1 // 13260
M=D // 13261

////PushInstruction("constant 30")
@30 // 13262
D=A // 13263
@SP // 13264
AM=M+1 // 13265
A=A-1 // 13266
M=D // 13267

////PushInstruction("constant 0")
@SP // 13268
AM=M+1 // 13269
A=A-1 // 13270
M=0 // 13271

////PushInstruction("constant 0")
@SP // 13272
AM=M+1 // 13273
A=A-1 // 13274
M=0 // 13275

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=63}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13276
D=A // 13277
@14 // 13278
M=D // 13279
@Output.create // 13280
D=A // 13281
@13 // 13282
M=D // 13283
@Output.initMap.ret.63 // 13284
D=A // 13285
@CALL // 13286
0;JMP // 13287
(Output.initMap.ret.63)

////PopInstruction{address=temp 0}
@SP // 13288
AM=M-1 // 13289
D=M // 13290
@5 // 13291
M=D // 13292

////PushInstruction("constant 94")
@94 // 13293
D=A // 13294
@SP // 13295
AM=M+1 // 13296
A=A-1 // 13297
M=D // 13298

////PushInstruction("constant 8")
@8 // 13299
D=A // 13300
@SP // 13301
AM=M+1 // 13302
A=A-1 // 13303
M=D // 13304

////PushInstruction("constant 28")
@28 // 13305
D=A // 13306
@SP // 13307
AM=M+1 // 13308
A=A-1 // 13309
M=D // 13310

////PushInstruction("constant 54")
@54 // 13311
D=A // 13312
@SP // 13313
AM=M+1 // 13314
A=A-1 // 13315
M=D // 13316

////PushInstruction("constant 0")
@SP // 13317
AM=M+1 // 13318
A=A-1 // 13319
M=0 // 13320

////PushInstruction("constant 0")
@SP // 13321
AM=M+1 // 13322
A=A-1 // 13323
M=0 // 13324

////PushInstruction("constant 0")
@SP // 13325
AM=M+1 // 13326
A=A-1 // 13327
M=0 // 13328

////PushInstruction("constant 0")
@SP // 13329
AM=M+1 // 13330
A=A-1 // 13331
M=0 // 13332

////PushInstruction("constant 0")
@SP // 13333
AM=M+1 // 13334
A=A-1 // 13335
M=0 // 13336

////PushInstruction("constant 0")
@SP // 13337
AM=M+1 // 13338
A=A-1 // 13339
M=0 // 13340

////PushInstruction("constant 0")
@SP // 13341
AM=M+1 // 13342
A=A-1 // 13343
M=0 // 13344

////PushInstruction("constant 0")
@SP // 13345
AM=M+1 // 13346
A=A-1 // 13347
M=0 // 13348

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=64}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13349
D=A // 13350
@14 // 13351
M=D // 13352
@Output.create // 13353
D=A // 13354
@13 // 13355
M=D // 13356
@Output.initMap.ret.64 // 13357
D=A // 13358
@CALL // 13359
0;JMP // 13360
(Output.initMap.ret.64)

////PopInstruction{address=temp 0}
@SP // 13361
AM=M-1 // 13362
D=M // 13363
@5 // 13364
M=D // 13365

////PushInstruction("constant 95")
@95 // 13366
D=A // 13367
@SP // 13368
AM=M+1 // 13369
A=A-1 // 13370
M=D // 13371

////PushInstruction("constant 0")
@SP // 13372
AM=M+1 // 13373
A=A-1 // 13374
M=0 // 13375

////PushInstruction("constant 0")
@SP // 13376
AM=M+1 // 13377
A=A-1 // 13378
M=0 // 13379

////PushInstruction("constant 0")
@SP // 13380
AM=M+1 // 13381
A=A-1 // 13382
M=0 // 13383

////PushInstruction("constant 0")
@SP // 13384
AM=M+1 // 13385
A=A-1 // 13386
M=0 // 13387

////PushInstruction("constant 0")
@SP // 13388
AM=M+1 // 13389
A=A-1 // 13390
M=0 // 13391

////PushInstruction("constant 0")
@SP // 13392
AM=M+1 // 13393
A=A-1 // 13394
M=0 // 13395

////PushInstruction("constant 0")
@SP // 13396
AM=M+1 // 13397
A=A-1 // 13398
M=0 // 13399

////PushInstruction("constant 0")
@SP // 13400
AM=M+1 // 13401
A=A-1 // 13402
M=0 // 13403

////PushInstruction("constant 0")
@SP // 13404
AM=M+1 // 13405
A=A-1 // 13406
M=0 // 13407

////PushInstruction("constant 63")
@63 // 13408
D=A // 13409
@SP // 13410
AM=M+1 // 13411
A=A-1 // 13412
M=D // 13413

////PushInstruction("constant 0")
@SP // 13414
AM=M+1 // 13415
A=A-1 // 13416
M=0 // 13417

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=65}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13418
D=A // 13419
@14 // 13420
M=D // 13421
@Output.create // 13422
D=A // 13423
@13 // 13424
M=D // 13425
@Output.initMap.ret.65 // 13426
D=A // 13427
@CALL // 13428
0;JMP // 13429
(Output.initMap.ret.65)

////PopInstruction{address=temp 0}
@SP // 13430
AM=M-1 // 13431
D=M // 13432
@5 // 13433
M=D // 13434

////PushInstruction("constant 96")
@96 // 13435
D=A // 13436
@SP // 13437
AM=M+1 // 13438
A=A-1 // 13439
M=D // 13440

////PushInstruction("constant 6")
@6 // 13441
D=A // 13442
@SP // 13443
AM=M+1 // 13444
A=A-1 // 13445
M=D // 13446

////PushInstruction("constant 12")
@12 // 13447
D=A // 13448
@SP // 13449
AM=M+1 // 13450
A=A-1 // 13451
M=D // 13452

////PushInstruction("constant 24")
@24 // 13453
D=A // 13454
@SP // 13455
AM=M+1 // 13456
A=A-1 // 13457
M=D // 13458

////PushInstruction("constant 0")
@SP // 13459
AM=M+1 // 13460
A=A-1 // 13461
M=0 // 13462

////PushInstruction("constant 0")
@SP // 13463
AM=M+1 // 13464
A=A-1 // 13465
M=0 // 13466

////PushInstruction("constant 0")
@SP // 13467
AM=M+1 // 13468
A=A-1 // 13469
M=0 // 13470

////PushInstruction("constant 0")
@SP // 13471
AM=M+1 // 13472
A=A-1 // 13473
M=0 // 13474

////PushInstruction("constant 0")
@SP // 13475
AM=M+1 // 13476
A=A-1 // 13477
M=0 // 13478

////PushInstruction("constant 0")
@SP // 13479
AM=M+1 // 13480
A=A-1 // 13481
M=0 // 13482

////PushInstruction("constant 0")
@SP // 13483
AM=M+1 // 13484
A=A-1 // 13485
M=0 // 13486

////PushInstruction("constant 0")
@SP // 13487
AM=M+1 // 13488
A=A-1 // 13489
M=0 // 13490

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=66}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13491
D=A // 13492
@14 // 13493
M=D // 13494
@Output.create // 13495
D=A // 13496
@13 // 13497
M=D // 13498
@Output.initMap.ret.66 // 13499
D=A // 13500
@CALL // 13501
0;JMP // 13502
(Output.initMap.ret.66)

////PopInstruction{address=temp 0}
@SP // 13503
AM=M-1 // 13504
D=M // 13505
@5 // 13506
M=D // 13507

////PushInstruction("constant 97")
@97 // 13508
D=A // 13509
@SP // 13510
AM=M+1 // 13511
A=A-1 // 13512
M=D // 13513

////PushInstruction("constant 0")
@SP // 13514
AM=M+1 // 13515
A=A-1 // 13516
M=0 // 13517

////PushInstruction("constant 0")
@SP // 13518
AM=M+1 // 13519
A=A-1 // 13520
M=0 // 13521

////PushInstruction("constant 0")
@SP // 13522
AM=M+1 // 13523
A=A-1 // 13524
M=0 // 13525

////PushInstruction("constant 14")
@14 // 13526
D=A // 13527
@SP // 13528
AM=M+1 // 13529
A=A-1 // 13530
M=D // 13531

////PushInstruction("constant 24")
@24 // 13532
D=A // 13533
@SP // 13534
AM=M+1 // 13535
A=A-1 // 13536
M=D // 13537

////PushInstruction("constant 30")
@30 // 13538
D=A // 13539
@SP // 13540
AM=M+1 // 13541
A=A-1 // 13542
M=D // 13543

////PushInstruction("constant 27")
@27 // 13544
D=A // 13545
@SP // 13546
AM=M+1 // 13547
A=A-1 // 13548
M=D // 13549

////PushInstruction("constant 27")
@27 // 13550
D=A // 13551
@SP // 13552
AM=M+1 // 13553
A=A-1 // 13554
M=D // 13555

////PushInstruction("constant 54")
@54 // 13556
D=A // 13557
@SP // 13558
AM=M+1 // 13559
A=A-1 // 13560
M=D // 13561

////PushInstruction("constant 0")
@SP // 13562
AM=M+1 // 13563
A=A-1 // 13564
M=0 // 13565

////PushInstruction("constant 0")
@SP // 13566
AM=M+1 // 13567
A=A-1 // 13568
M=0 // 13569

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=67}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13570
D=A // 13571
@14 // 13572
M=D // 13573
@Output.create // 13574
D=A // 13575
@13 // 13576
M=D // 13577
@Output.initMap.ret.67 // 13578
D=A // 13579
@CALL // 13580
0;JMP // 13581
(Output.initMap.ret.67)

////PopInstruction{address=temp 0}
@SP // 13582
AM=M-1 // 13583
D=M // 13584
@5 // 13585
M=D // 13586

////PushInstruction("constant 98")
@98 // 13587
D=A // 13588
@SP // 13589
AM=M+1 // 13590
A=A-1 // 13591
M=D // 13592

////PushInstruction("constant 3")
@3 // 13593
D=A // 13594
@SP // 13595
AM=M+1 // 13596
A=A-1 // 13597
M=D // 13598

////PushInstruction("constant 3")
@3 // 13599
D=A // 13600
@SP // 13601
AM=M+1 // 13602
A=A-1 // 13603
M=D // 13604

////PushInstruction("constant 3")
@3 // 13605
D=A // 13606
@SP // 13607
AM=M+1 // 13608
A=A-1 // 13609
M=D // 13610

////PushInstruction("constant 15")
@15 // 13611
D=A // 13612
@SP // 13613
AM=M+1 // 13614
A=A-1 // 13615
M=D // 13616

////PushInstruction("constant 27")
@27 // 13617
D=A // 13618
@SP // 13619
AM=M+1 // 13620
A=A-1 // 13621
M=D // 13622

////PushInstruction("constant 51")
@51 // 13623
D=A // 13624
@SP // 13625
AM=M+1 // 13626
A=A-1 // 13627
M=D // 13628

////PushInstruction("constant 51")
@51 // 13629
D=A // 13630
@SP // 13631
AM=M+1 // 13632
A=A-1 // 13633
M=D // 13634

////PushInstruction("constant 51")
@51 // 13635
D=A // 13636
@SP // 13637
AM=M+1 // 13638
A=A-1 // 13639
M=D // 13640

////PushInstruction("constant 30")
@30 // 13641
D=A // 13642
@SP // 13643
AM=M+1 // 13644
A=A-1 // 13645
M=D // 13646

////PushInstruction("constant 0")
@SP // 13647
AM=M+1 // 13648
A=A-1 // 13649
M=0 // 13650

////PushInstruction("constant 0")
@SP // 13651
AM=M+1 // 13652
A=A-1 // 13653
M=0 // 13654

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=68}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13655
D=A // 13656
@14 // 13657
M=D // 13658
@Output.create // 13659
D=A // 13660
@13 // 13661
M=D // 13662
@Output.initMap.ret.68 // 13663
D=A // 13664
@CALL // 13665
0;JMP // 13666
(Output.initMap.ret.68)

////PopInstruction{address=temp 0}
@SP // 13667
AM=M-1 // 13668
D=M // 13669
@5 // 13670
M=D // 13671

////PushInstruction("constant 99")
@99 // 13672
D=A // 13673
@SP // 13674
AM=M+1 // 13675
A=A-1 // 13676
M=D // 13677

////PushInstruction("constant 0")
@SP // 13678
AM=M+1 // 13679
A=A-1 // 13680
M=0 // 13681

////PushInstruction("constant 0")
@SP // 13682
AM=M+1 // 13683
A=A-1 // 13684
M=0 // 13685

////PushInstruction("constant 0")
@SP // 13686
AM=M+1 // 13687
A=A-1 // 13688
M=0 // 13689

////PushInstruction("constant 30")
@30 // 13690
D=A // 13691
@SP // 13692
AM=M+1 // 13693
A=A-1 // 13694
M=D // 13695

////PushInstruction("constant 51")
@51 // 13696
D=A // 13697
@SP // 13698
AM=M+1 // 13699
A=A-1 // 13700
M=D // 13701

////PushInstruction("constant 3")
@3 // 13702
D=A // 13703
@SP // 13704
AM=M+1 // 13705
A=A-1 // 13706
M=D // 13707

////PushInstruction("constant 3")
@3 // 13708
D=A // 13709
@SP // 13710
AM=M+1 // 13711
A=A-1 // 13712
M=D // 13713

////PushInstruction("constant 51")
@51 // 13714
D=A // 13715
@SP // 13716
AM=M+1 // 13717
A=A-1 // 13718
M=D // 13719

////PushInstruction("constant 30")
@30 // 13720
D=A // 13721
@SP // 13722
AM=M+1 // 13723
A=A-1 // 13724
M=D // 13725

////PushInstruction("constant 0")
@SP // 13726
AM=M+1 // 13727
A=A-1 // 13728
M=0 // 13729

////PushInstruction("constant 0")
@SP // 13730
AM=M+1 // 13731
A=A-1 // 13732
M=0 // 13733

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=69}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13734
D=A // 13735
@14 // 13736
M=D // 13737
@Output.create // 13738
D=A // 13739
@13 // 13740
M=D // 13741
@Output.initMap.ret.69 // 13742
D=A // 13743
@CALL // 13744
0;JMP // 13745
(Output.initMap.ret.69)

////PopInstruction{address=temp 0}
@SP // 13746
AM=M-1 // 13747
D=M // 13748
@5 // 13749
M=D // 13750

////PushInstruction("constant 100")
@100 // 13751
D=A // 13752
@SP // 13753
AM=M+1 // 13754
A=A-1 // 13755
M=D // 13756

////PushInstruction("constant 48")
@48 // 13757
D=A // 13758
@SP // 13759
AM=M+1 // 13760
A=A-1 // 13761
M=D // 13762

////PushInstruction("constant 48")
@48 // 13763
D=A // 13764
@SP // 13765
AM=M+1 // 13766
A=A-1 // 13767
M=D // 13768

////PushInstruction("constant 48")
@48 // 13769
D=A // 13770
@SP // 13771
AM=M+1 // 13772
A=A-1 // 13773
M=D // 13774

////PushInstruction("constant 60")
@60 // 13775
D=A // 13776
@SP // 13777
AM=M+1 // 13778
A=A-1 // 13779
M=D // 13780

////PushInstruction("constant 54")
@54 // 13781
D=A // 13782
@SP // 13783
AM=M+1 // 13784
A=A-1 // 13785
M=D // 13786

////PushInstruction("constant 51")
@51 // 13787
D=A // 13788
@SP // 13789
AM=M+1 // 13790
A=A-1 // 13791
M=D // 13792

////PushInstruction("constant 51")
@51 // 13793
D=A // 13794
@SP // 13795
AM=M+1 // 13796
A=A-1 // 13797
M=D // 13798

////PushInstruction("constant 51")
@51 // 13799
D=A // 13800
@SP // 13801
AM=M+1 // 13802
A=A-1 // 13803
M=D // 13804

////PushInstruction("constant 30")
@30 // 13805
D=A // 13806
@SP // 13807
AM=M+1 // 13808
A=A-1 // 13809
M=D // 13810

////PushInstruction("constant 0")
@SP // 13811
AM=M+1 // 13812
A=A-1 // 13813
M=0 // 13814

////PushInstruction("constant 0")
@SP // 13815
AM=M+1 // 13816
A=A-1 // 13817
M=0 // 13818

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=70}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13819
D=A // 13820
@14 // 13821
M=D // 13822
@Output.create // 13823
D=A // 13824
@13 // 13825
M=D // 13826
@Output.initMap.ret.70 // 13827
D=A // 13828
@CALL // 13829
0;JMP // 13830
(Output.initMap.ret.70)

////PopInstruction{address=temp 0}
@SP // 13831
AM=M-1 // 13832
D=M // 13833
@5 // 13834
M=D // 13835

////PushInstruction("constant 101")
@101 // 13836
D=A // 13837
@SP // 13838
AM=M+1 // 13839
A=A-1 // 13840
M=D // 13841

////PushInstruction("constant 0")
@SP // 13842
AM=M+1 // 13843
A=A-1 // 13844
M=0 // 13845

////PushInstruction("constant 0")
@SP // 13846
AM=M+1 // 13847
A=A-1 // 13848
M=0 // 13849

////PushInstruction("constant 0")
@SP // 13850
AM=M+1 // 13851
A=A-1 // 13852
M=0 // 13853

////PushInstruction("constant 30")
@30 // 13854
D=A // 13855
@SP // 13856
AM=M+1 // 13857
A=A-1 // 13858
M=D // 13859

////PushInstruction("constant 51")
@51 // 13860
D=A // 13861
@SP // 13862
AM=M+1 // 13863
A=A-1 // 13864
M=D // 13865

////PushInstruction("constant 63")
@63 // 13866
D=A // 13867
@SP // 13868
AM=M+1 // 13869
A=A-1 // 13870
M=D // 13871

////PushInstruction("constant 3")
@3 // 13872
D=A // 13873
@SP // 13874
AM=M+1 // 13875
A=A-1 // 13876
M=D // 13877

////PushInstruction("constant 51")
@51 // 13878
D=A // 13879
@SP // 13880
AM=M+1 // 13881
A=A-1 // 13882
M=D // 13883

////PushInstruction("constant 30")
@30 // 13884
D=A // 13885
@SP // 13886
AM=M+1 // 13887
A=A-1 // 13888
M=D // 13889

////PushInstruction("constant 0")
@SP // 13890
AM=M+1 // 13891
A=A-1 // 13892
M=0 // 13893

////PushInstruction("constant 0")
@SP // 13894
AM=M+1 // 13895
A=A-1 // 13896
M=0 // 13897

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=71}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13898
D=A // 13899
@14 // 13900
M=D // 13901
@Output.create // 13902
D=A // 13903
@13 // 13904
M=D // 13905
@Output.initMap.ret.71 // 13906
D=A // 13907
@CALL // 13908
0;JMP // 13909
(Output.initMap.ret.71)

////PopInstruction{address=temp 0}
@SP // 13910
AM=M-1 // 13911
D=M // 13912
@5 // 13913
M=D // 13914

////PushInstruction("constant 102")
@102 // 13915
D=A // 13916
@SP // 13917
AM=M+1 // 13918
A=A-1 // 13919
M=D // 13920

////PushInstruction("constant 28")
@28 // 13921
D=A // 13922
@SP // 13923
AM=M+1 // 13924
A=A-1 // 13925
M=D // 13926

////PushInstruction("constant 54")
@54 // 13927
D=A // 13928
@SP // 13929
AM=M+1 // 13930
A=A-1 // 13931
M=D // 13932

////PushInstruction("constant 38")
@38 // 13933
D=A // 13934
@SP // 13935
AM=M+1 // 13936
A=A-1 // 13937
M=D // 13938

////PushInstruction("constant 6")
@6 // 13939
D=A // 13940
@SP // 13941
AM=M+1 // 13942
A=A-1 // 13943
M=D // 13944

////PushInstruction("constant 15")
@15 // 13945
D=A // 13946
@SP // 13947
AM=M+1 // 13948
A=A-1 // 13949
M=D // 13950

////PushInstruction("constant 6")
@6 // 13951
D=A // 13952
@SP // 13953
AM=M+1 // 13954
A=A-1 // 13955
M=D // 13956

////PushInstruction("constant 6")
@6 // 13957
D=A // 13958
@SP // 13959
AM=M+1 // 13960
A=A-1 // 13961
M=D // 13962

////PushInstruction("constant 6")
@6 // 13963
D=A // 13964
@SP // 13965
AM=M+1 // 13966
A=A-1 // 13967
M=D // 13968

////PushInstruction("constant 15")
@15 // 13969
D=A // 13970
@SP // 13971
AM=M+1 // 13972
A=A-1 // 13973
M=D // 13974

////PushInstruction("constant 0")
@SP // 13975
AM=M+1 // 13976
A=A-1 // 13977
M=0 // 13978

////PushInstruction("constant 0")
@SP // 13979
AM=M+1 // 13980
A=A-1 // 13981
M=0 // 13982

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=72}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13983
D=A // 13984
@14 // 13985
M=D // 13986
@Output.create // 13987
D=A // 13988
@13 // 13989
M=D // 13990
@Output.initMap.ret.72 // 13991
D=A // 13992
@CALL // 13993
0;JMP // 13994
(Output.initMap.ret.72)

////PopInstruction{address=temp 0}
@SP // 13995
AM=M-1 // 13996
D=M // 13997
@5 // 13998
M=D // 13999

////PushInstruction("constant 103")
@103 // 14000
D=A // 14001
@SP // 14002
AM=M+1 // 14003
A=A-1 // 14004
M=D // 14005

////PushInstruction("constant 0")
@SP // 14006
AM=M+1 // 14007
A=A-1 // 14008
M=0 // 14009

////PushInstruction("constant 0")
@SP // 14010
AM=M+1 // 14011
A=A-1 // 14012
M=0 // 14013

////PushInstruction("constant 30")
@30 // 14014
D=A // 14015
@SP // 14016
AM=M+1 // 14017
A=A-1 // 14018
M=D // 14019

////PushInstruction("constant 51")
@51 // 14020
D=A // 14021
@SP // 14022
AM=M+1 // 14023
A=A-1 // 14024
M=D // 14025

////PushInstruction("constant 51")
@51 // 14026
D=A // 14027
@SP // 14028
AM=M+1 // 14029
A=A-1 // 14030
M=D // 14031

////PushInstruction("constant 51")
@51 // 14032
D=A // 14033
@SP // 14034
AM=M+1 // 14035
A=A-1 // 14036
M=D // 14037

////PushInstruction("constant 62")
@62 // 14038
D=A // 14039
@SP // 14040
AM=M+1 // 14041
A=A-1 // 14042
M=D // 14043

////PushInstruction("constant 48")
@48 // 14044
D=A // 14045
@SP // 14046
AM=M+1 // 14047
A=A-1 // 14048
M=D // 14049

////PushInstruction("constant 51")
@51 // 14050
D=A // 14051
@SP // 14052
AM=M+1 // 14053
A=A-1 // 14054
M=D // 14055

////PushInstruction("constant 30")
@30 // 14056
D=A // 14057
@SP // 14058
AM=M+1 // 14059
A=A-1 // 14060
M=D // 14061

////PushInstruction("constant 0")
@SP // 14062
AM=M+1 // 14063
A=A-1 // 14064
M=0 // 14065

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=73}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14066
D=A // 14067
@14 // 14068
M=D // 14069
@Output.create // 14070
D=A // 14071
@13 // 14072
M=D // 14073
@Output.initMap.ret.73 // 14074
D=A // 14075
@CALL // 14076
0;JMP // 14077
(Output.initMap.ret.73)

////PopInstruction{address=temp 0}
@SP // 14078
AM=M-1 // 14079
D=M // 14080
@5 // 14081
M=D // 14082

////PushInstruction("constant 104")
@104 // 14083
D=A // 14084
@SP // 14085
AM=M+1 // 14086
A=A-1 // 14087
M=D // 14088

////PushInstruction("constant 3")
@3 // 14089
D=A // 14090
@SP // 14091
AM=M+1 // 14092
A=A-1 // 14093
M=D // 14094

////PushInstruction("constant 3")
@3 // 14095
D=A // 14096
@SP // 14097
AM=M+1 // 14098
A=A-1 // 14099
M=D // 14100

////PushInstruction("constant 3")
@3 // 14101
D=A // 14102
@SP // 14103
AM=M+1 // 14104
A=A-1 // 14105
M=D // 14106

////PushInstruction("constant 27")
@27 // 14107
D=A // 14108
@SP // 14109
AM=M+1 // 14110
A=A-1 // 14111
M=D // 14112

////PushInstruction("constant 55")
@55 // 14113
D=A // 14114
@SP // 14115
AM=M+1 // 14116
A=A-1 // 14117
M=D // 14118

////PushInstruction("constant 51")
@51 // 14119
D=A // 14120
@SP // 14121
AM=M+1 // 14122
A=A-1 // 14123
M=D // 14124

////PushInstruction("constant 51")
@51 // 14125
D=A // 14126
@SP // 14127
AM=M+1 // 14128
A=A-1 // 14129
M=D // 14130

////PushInstruction("constant 51")
@51 // 14131
D=A // 14132
@SP // 14133
AM=M+1 // 14134
A=A-1 // 14135
M=D // 14136

////PushInstruction("constant 51")
@51 // 14137
D=A // 14138
@SP // 14139
AM=M+1 // 14140
A=A-1 // 14141
M=D // 14142

////PushInstruction("constant 0")
@SP // 14143
AM=M+1 // 14144
A=A-1 // 14145
M=0 // 14146

////PushInstruction("constant 0")
@SP // 14147
AM=M+1 // 14148
A=A-1 // 14149
M=0 // 14150

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=74}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14151
D=A // 14152
@14 // 14153
M=D // 14154
@Output.create // 14155
D=A // 14156
@13 // 14157
M=D // 14158
@Output.initMap.ret.74 // 14159
D=A // 14160
@CALL // 14161
0;JMP // 14162
(Output.initMap.ret.74)

////PopInstruction{address=temp 0}
@SP // 14163
AM=M-1 // 14164
D=M // 14165
@5 // 14166
M=D // 14167

////PushInstruction("constant 105")
@105 // 14168
D=A // 14169
@SP // 14170
AM=M+1 // 14171
A=A-1 // 14172
M=D // 14173

////PushInstruction("constant 12")
@12 // 14174
D=A // 14175
@SP // 14176
AM=M+1 // 14177
A=A-1 // 14178
M=D // 14179

////PushInstruction("constant 12")
@12 // 14180
D=A // 14181
@SP // 14182
AM=M+1 // 14183
A=A-1 // 14184
M=D // 14185

////PushInstruction("constant 0")
@SP // 14186
AM=M+1 // 14187
A=A-1 // 14188
M=0 // 14189

////PushInstruction("constant 14")
@14 // 14190
D=A // 14191
@SP // 14192
AM=M+1 // 14193
A=A-1 // 14194
M=D // 14195

////PushInstruction("constant 12")
@12 // 14196
D=A // 14197
@SP // 14198
AM=M+1 // 14199
A=A-1 // 14200
M=D // 14201

////PushInstruction("constant 12")
@12 // 14202
D=A // 14203
@SP // 14204
AM=M+1 // 14205
A=A-1 // 14206
M=D // 14207

////PushInstruction("constant 12")
@12 // 14208
D=A // 14209
@SP // 14210
AM=M+1 // 14211
A=A-1 // 14212
M=D // 14213

////PushInstruction("constant 12")
@12 // 14214
D=A // 14215
@SP // 14216
AM=M+1 // 14217
A=A-1 // 14218
M=D // 14219

////PushInstruction("constant 30")
@30 // 14220
D=A // 14221
@SP // 14222
AM=M+1 // 14223
A=A-1 // 14224
M=D // 14225

////PushInstruction("constant 0")
@SP // 14226
AM=M+1 // 14227
A=A-1 // 14228
M=0 // 14229

////PushInstruction("constant 0")
@SP // 14230
AM=M+1 // 14231
A=A-1 // 14232
M=0 // 14233

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=75}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14234
D=A // 14235
@14 // 14236
M=D // 14237
@Output.create // 14238
D=A // 14239
@13 // 14240
M=D // 14241
@Output.initMap.ret.75 // 14242
D=A // 14243
@CALL // 14244
0;JMP // 14245
(Output.initMap.ret.75)

////PopInstruction{address=temp 0}
@SP // 14246
AM=M-1 // 14247
D=M // 14248
@5 // 14249
M=D // 14250

////PushInstruction("constant 106")
@106 // 14251
D=A // 14252
@SP // 14253
AM=M+1 // 14254
A=A-1 // 14255
M=D // 14256

////PushInstruction("constant 48")
@48 // 14257
D=A // 14258
@SP // 14259
AM=M+1 // 14260
A=A-1 // 14261
M=D // 14262

////PushInstruction("constant 48")
@48 // 14263
D=A // 14264
@SP // 14265
AM=M+1 // 14266
A=A-1 // 14267
M=D // 14268

////PushInstruction("constant 0")
@SP // 14269
AM=M+1 // 14270
A=A-1 // 14271
M=0 // 14272

////PushInstruction("constant 56")
@56 // 14273
D=A // 14274
@SP // 14275
AM=M+1 // 14276
A=A-1 // 14277
M=D // 14278

////PushInstruction("constant 48")
@48 // 14279
D=A // 14280
@SP // 14281
AM=M+1 // 14282
A=A-1 // 14283
M=D // 14284

////PushInstruction("constant 48")
@48 // 14285
D=A // 14286
@SP // 14287
AM=M+1 // 14288
A=A-1 // 14289
M=D // 14290

////PushInstruction("constant 48")
@48 // 14291
D=A // 14292
@SP // 14293
AM=M+1 // 14294
A=A-1 // 14295
M=D // 14296

////PushInstruction("constant 48")
@48 // 14297
D=A // 14298
@SP // 14299
AM=M+1 // 14300
A=A-1 // 14301
M=D // 14302

////PushInstruction("constant 51")
@51 // 14303
D=A // 14304
@SP // 14305
AM=M+1 // 14306
A=A-1 // 14307
M=D // 14308

////PushInstruction("constant 30")
@30 // 14309
D=A // 14310
@SP // 14311
AM=M+1 // 14312
A=A-1 // 14313
M=D // 14314

////PushInstruction("constant 0")
@SP // 14315
AM=M+1 // 14316
A=A-1 // 14317
M=0 // 14318

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=76}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14319
D=A // 14320
@14 // 14321
M=D // 14322
@Output.create // 14323
D=A // 14324
@13 // 14325
M=D // 14326
@Output.initMap.ret.76 // 14327
D=A // 14328
@CALL // 14329
0;JMP // 14330
(Output.initMap.ret.76)

////PopInstruction{address=temp 0}
@SP // 14331
AM=M-1 // 14332
D=M // 14333
@5 // 14334
M=D // 14335

////PushInstruction("constant 107")
@107 // 14336
D=A // 14337
@SP // 14338
AM=M+1 // 14339
A=A-1 // 14340
M=D // 14341

////PushInstruction("constant 3")
@3 // 14342
D=A // 14343
@SP // 14344
AM=M+1 // 14345
A=A-1 // 14346
M=D // 14347

////PushInstruction("constant 3")
@3 // 14348
D=A // 14349
@SP // 14350
AM=M+1 // 14351
A=A-1 // 14352
M=D // 14353

////PushInstruction("constant 3")
@3 // 14354
D=A // 14355
@SP // 14356
AM=M+1 // 14357
A=A-1 // 14358
M=D // 14359

////PushInstruction("constant 51")
@51 // 14360
D=A // 14361
@SP // 14362
AM=M+1 // 14363
A=A-1 // 14364
M=D // 14365

////PushInstruction("constant 27")
@27 // 14366
D=A // 14367
@SP // 14368
AM=M+1 // 14369
A=A-1 // 14370
M=D // 14371

////PushInstruction("constant 15")
@15 // 14372
D=A // 14373
@SP // 14374
AM=M+1 // 14375
A=A-1 // 14376
M=D // 14377

////PushInstruction("constant 15")
@15 // 14378
D=A // 14379
@SP // 14380
AM=M+1 // 14381
A=A-1 // 14382
M=D // 14383

////PushInstruction("constant 27")
@27 // 14384
D=A // 14385
@SP // 14386
AM=M+1 // 14387
A=A-1 // 14388
M=D // 14389

////PushInstruction("constant 51")
@51 // 14390
D=A // 14391
@SP // 14392
AM=M+1 // 14393
A=A-1 // 14394
M=D // 14395

////PushInstruction("constant 0")
@SP // 14396
AM=M+1 // 14397
A=A-1 // 14398
M=0 // 14399

////PushInstruction("constant 0")
@SP // 14400
AM=M+1 // 14401
A=A-1 // 14402
M=0 // 14403

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=77}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14404
D=A // 14405
@14 // 14406
M=D // 14407
@Output.create // 14408
D=A // 14409
@13 // 14410
M=D // 14411
@Output.initMap.ret.77 // 14412
D=A // 14413
@CALL // 14414
0;JMP // 14415
(Output.initMap.ret.77)

////PopInstruction{address=temp 0}
@SP // 14416
AM=M-1 // 14417
D=M // 14418
@5 // 14419
M=D // 14420

////PushInstruction("constant 108")
@108 // 14421
D=A // 14422
@SP // 14423
AM=M+1 // 14424
A=A-1 // 14425
M=D // 14426

////PushInstruction("constant 14")
@14 // 14427
D=A // 14428
@SP // 14429
AM=M+1 // 14430
A=A-1 // 14431
M=D // 14432

////PushInstruction("constant 12")
@12 // 14433
D=A // 14434
@SP // 14435
AM=M+1 // 14436
A=A-1 // 14437
M=D // 14438

////PushInstruction("constant 12")
@12 // 14439
D=A // 14440
@SP // 14441
AM=M+1 // 14442
A=A-1 // 14443
M=D // 14444

////PushInstruction("constant 12")
@12 // 14445
D=A // 14446
@SP // 14447
AM=M+1 // 14448
A=A-1 // 14449
M=D // 14450

////PushInstruction("constant 12")
@12 // 14451
D=A // 14452
@SP // 14453
AM=M+1 // 14454
A=A-1 // 14455
M=D // 14456

////PushInstruction("constant 12")
@12 // 14457
D=A // 14458
@SP // 14459
AM=M+1 // 14460
A=A-1 // 14461
M=D // 14462

////PushInstruction("constant 12")
@12 // 14463
D=A // 14464
@SP // 14465
AM=M+1 // 14466
A=A-1 // 14467
M=D // 14468

////PushInstruction("constant 12")
@12 // 14469
D=A // 14470
@SP // 14471
AM=M+1 // 14472
A=A-1 // 14473
M=D // 14474

////PushInstruction("constant 30")
@30 // 14475
D=A // 14476
@SP // 14477
AM=M+1 // 14478
A=A-1 // 14479
M=D // 14480

////PushInstruction("constant 0")
@SP // 14481
AM=M+1 // 14482
A=A-1 // 14483
M=0 // 14484

////PushInstruction("constant 0")
@SP // 14485
AM=M+1 // 14486
A=A-1 // 14487
M=0 // 14488

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=78}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14489
D=A // 14490
@14 // 14491
M=D // 14492
@Output.create // 14493
D=A // 14494
@13 // 14495
M=D // 14496
@Output.initMap.ret.78 // 14497
D=A // 14498
@CALL // 14499
0;JMP // 14500
(Output.initMap.ret.78)

////PopInstruction{address=temp 0}
@SP // 14501
AM=M-1 // 14502
D=M // 14503
@5 // 14504
M=D // 14505

////PushInstruction("constant 109")
@109 // 14506
D=A // 14507
@SP // 14508
AM=M+1 // 14509
A=A-1 // 14510
M=D // 14511

////PushInstruction("constant 0")
@SP // 14512
AM=M+1 // 14513
A=A-1 // 14514
M=0 // 14515

////PushInstruction("constant 0")
@SP // 14516
AM=M+1 // 14517
A=A-1 // 14518
M=0 // 14519

////PushInstruction("constant 0")
@SP // 14520
AM=M+1 // 14521
A=A-1 // 14522
M=0 // 14523

////PushInstruction("constant 29")
@29 // 14524
D=A // 14525
@SP // 14526
AM=M+1 // 14527
A=A-1 // 14528
M=D // 14529

////PushInstruction("constant 63")
@63 // 14530
D=A // 14531
@SP // 14532
AM=M+1 // 14533
A=A-1 // 14534
M=D // 14535

////PushInstruction("constant 43")
@43 // 14536
D=A // 14537
@SP // 14538
AM=M+1 // 14539
A=A-1 // 14540
M=D // 14541

////PushInstruction("constant 43")
@43 // 14542
D=A // 14543
@SP // 14544
AM=M+1 // 14545
A=A-1 // 14546
M=D // 14547

////PushInstruction("constant 43")
@43 // 14548
D=A // 14549
@SP // 14550
AM=M+1 // 14551
A=A-1 // 14552
M=D // 14553

////PushInstruction("constant 43")
@43 // 14554
D=A // 14555
@SP // 14556
AM=M+1 // 14557
A=A-1 // 14558
M=D // 14559

////PushInstruction("constant 0")
@SP // 14560
AM=M+1 // 14561
A=A-1 // 14562
M=0 // 14563

////PushInstruction("constant 0")
@SP // 14564
AM=M+1 // 14565
A=A-1 // 14566
M=0 // 14567

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=79}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14568
D=A // 14569
@14 // 14570
M=D // 14571
@Output.create // 14572
D=A // 14573
@13 // 14574
M=D // 14575
@Output.initMap.ret.79 // 14576
D=A // 14577
@CALL // 14578
0;JMP // 14579
(Output.initMap.ret.79)

////PopInstruction{address=temp 0}
@SP // 14580
AM=M-1 // 14581
D=M // 14582
@5 // 14583
M=D // 14584

////PushInstruction("constant 110")
@110 // 14585
D=A // 14586
@SP // 14587
AM=M+1 // 14588
A=A-1 // 14589
M=D // 14590

////PushInstruction("constant 0")
@SP // 14591
AM=M+1 // 14592
A=A-1 // 14593
M=0 // 14594

////PushInstruction("constant 0")
@SP // 14595
AM=M+1 // 14596
A=A-1 // 14597
M=0 // 14598

////PushInstruction("constant 0")
@SP // 14599
AM=M+1 // 14600
A=A-1 // 14601
M=0 // 14602

////PushInstruction("constant 29")
@29 // 14603
D=A // 14604
@SP // 14605
AM=M+1 // 14606
A=A-1 // 14607
M=D // 14608

////PushInstruction("constant 51")
@51 // 14609
D=A // 14610
@SP // 14611
AM=M+1 // 14612
A=A-1 // 14613
M=D // 14614

////PushInstruction("constant 51")
@51 // 14615
D=A // 14616
@SP // 14617
AM=M+1 // 14618
A=A-1 // 14619
M=D // 14620

////PushInstruction("constant 51")
@51 // 14621
D=A // 14622
@SP // 14623
AM=M+1 // 14624
A=A-1 // 14625
M=D // 14626

////PushInstruction("constant 51")
@51 // 14627
D=A // 14628
@SP // 14629
AM=M+1 // 14630
A=A-1 // 14631
M=D // 14632

////PushInstruction("constant 51")
@51 // 14633
D=A // 14634
@SP // 14635
AM=M+1 // 14636
A=A-1 // 14637
M=D // 14638

////PushInstruction("constant 0")
@SP // 14639
AM=M+1 // 14640
A=A-1 // 14641
M=0 // 14642

////PushInstruction("constant 0")
@SP // 14643
AM=M+1 // 14644
A=A-1 // 14645
M=0 // 14646

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=80}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14647
D=A // 14648
@14 // 14649
M=D // 14650
@Output.create // 14651
D=A // 14652
@13 // 14653
M=D // 14654
@Output.initMap.ret.80 // 14655
D=A // 14656
@CALL // 14657
0;JMP // 14658
(Output.initMap.ret.80)

////PopInstruction{address=temp 0}
@SP // 14659
AM=M-1 // 14660
D=M // 14661
@5 // 14662
M=D // 14663

////PushInstruction("constant 111")
@111 // 14664
D=A // 14665
@SP // 14666
AM=M+1 // 14667
A=A-1 // 14668
M=D // 14669

////PushInstruction("constant 0")
@SP // 14670
AM=M+1 // 14671
A=A-1 // 14672
M=0 // 14673

////PushInstruction("constant 0")
@SP // 14674
AM=M+1 // 14675
A=A-1 // 14676
M=0 // 14677

////PushInstruction("constant 0")
@SP // 14678
AM=M+1 // 14679
A=A-1 // 14680
M=0 // 14681

////PushInstruction("constant 30")
@30 // 14682
D=A // 14683
@SP // 14684
AM=M+1 // 14685
A=A-1 // 14686
M=D // 14687

////PushInstruction("constant 51")
@51 // 14688
D=A // 14689
@SP // 14690
AM=M+1 // 14691
A=A-1 // 14692
M=D // 14693

////PushInstruction("constant 51")
@51 // 14694
D=A // 14695
@SP // 14696
AM=M+1 // 14697
A=A-1 // 14698
M=D // 14699

////PushInstruction("constant 51")
@51 // 14700
D=A // 14701
@SP // 14702
AM=M+1 // 14703
A=A-1 // 14704
M=D // 14705

////PushInstruction("constant 51")
@51 // 14706
D=A // 14707
@SP // 14708
AM=M+1 // 14709
A=A-1 // 14710
M=D // 14711

////PushInstruction("constant 30")
@30 // 14712
D=A // 14713
@SP // 14714
AM=M+1 // 14715
A=A-1 // 14716
M=D // 14717

////PushInstruction("constant 0")
@SP // 14718
AM=M+1 // 14719
A=A-1 // 14720
M=0 // 14721

////PushInstruction("constant 0")
@SP // 14722
AM=M+1 // 14723
A=A-1 // 14724
M=0 // 14725

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=81}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14726
D=A // 14727
@14 // 14728
M=D // 14729
@Output.create // 14730
D=A // 14731
@13 // 14732
M=D // 14733
@Output.initMap.ret.81 // 14734
D=A // 14735
@CALL // 14736
0;JMP // 14737
(Output.initMap.ret.81)

////PopInstruction{address=temp 0}
@SP // 14738
AM=M-1 // 14739
D=M // 14740
@5 // 14741
M=D // 14742

////PushInstruction("constant 112")
@112 // 14743
D=A // 14744
@SP // 14745
AM=M+1 // 14746
A=A-1 // 14747
M=D // 14748

////PushInstruction("constant 0")
@SP // 14749
AM=M+1 // 14750
A=A-1 // 14751
M=0 // 14752

////PushInstruction("constant 0")
@SP // 14753
AM=M+1 // 14754
A=A-1 // 14755
M=0 // 14756

////PushInstruction("constant 0")
@SP // 14757
AM=M+1 // 14758
A=A-1 // 14759
M=0 // 14760

////PushInstruction("constant 30")
@30 // 14761
D=A // 14762
@SP // 14763
AM=M+1 // 14764
A=A-1 // 14765
M=D // 14766

////PushInstruction("constant 51")
@51 // 14767
D=A // 14768
@SP // 14769
AM=M+1 // 14770
A=A-1 // 14771
M=D // 14772

////PushInstruction("constant 51")
@51 // 14773
D=A // 14774
@SP // 14775
AM=M+1 // 14776
A=A-1 // 14777
M=D // 14778

////PushInstruction("constant 51")
@51 // 14779
D=A // 14780
@SP // 14781
AM=M+1 // 14782
A=A-1 // 14783
M=D // 14784

////PushInstruction("constant 31")
@31 // 14785
D=A // 14786
@SP // 14787
AM=M+1 // 14788
A=A-1 // 14789
M=D // 14790

////PushInstruction("constant 3")
@3 // 14791
D=A // 14792
@SP // 14793
AM=M+1 // 14794
A=A-1 // 14795
M=D // 14796

////PushInstruction("constant 3")
@3 // 14797
D=A // 14798
@SP // 14799
AM=M+1 // 14800
A=A-1 // 14801
M=D // 14802

////PushInstruction("constant 0")
@SP // 14803
AM=M+1 // 14804
A=A-1 // 14805
M=0 // 14806

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=82}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14807
D=A // 14808
@14 // 14809
M=D // 14810
@Output.create // 14811
D=A // 14812
@13 // 14813
M=D // 14814
@Output.initMap.ret.82 // 14815
D=A // 14816
@CALL // 14817
0;JMP // 14818
(Output.initMap.ret.82)

////PopInstruction{address=temp 0}
@SP // 14819
AM=M-1 // 14820
D=M // 14821
@5 // 14822
M=D // 14823

////PushInstruction("constant 113")
@113 // 14824
D=A // 14825
@SP // 14826
AM=M+1 // 14827
A=A-1 // 14828
M=D // 14829

////PushInstruction("constant 0")
@SP // 14830
AM=M+1 // 14831
A=A-1 // 14832
M=0 // 14833

////PushInstruction("constant 0")
@SP // 14834
AM=M+1 // 14835
A=A-1 // 14836
M=0 // 14837

////PushInstruction("constant 0")
@SP // 14838
AM=M+1 // 14839
A=A-1 // 14840
M=0 // 14841

////PushInstruction("constant 30")
@30 // 14842
D=A // 14843
@SP // 14844
AM=M+1 // 14845
A=A-1 // 14846
M=D // 14847

////PushInstruction("constant 51")
@51 // 14848
D=A // 14849
@SP // 14850
AM=M+1 // 14851
A=A-1 // 14852
M=D // 14853

////PushInstruction("constant 51")
@51 // 14854
D=A // 14855
@SP // 14856
AM=M+1 // 14857
A=A-1 // 14858
M=D // 14859

////PushInstruction("constant 51")
@51 // 14860
D=A // 14861
@SP // 14862
AM=M+1 // 14863
A=A-1 // 14864
M=D // 14865

////PushInstruction("constant 62")
@62 // 14866
D=A // 14867
@SP // 14868
AM=M+1 // 14869
A=A-1 // 14870
M=D // 14871

////PushInstruction("constant 48")
@48 // 14872
D=A // 14873
@SP // 14874
AM=M+1 // 14875
A=A-1 // 14876
M=D // 14877

////PushInstruction("constant 48")
@48 // 14878
D=A // 14879
@SP // 14880
AM=M+1 // 14881
A=A-1 // 14882
M=D // 14883

////PushInstruction("constant 0")
@SP // 14884
AM=M+1 // 14885
A=A-1 // 14886
M=0 // 14887

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=83}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14888
D=A // 14889
@14 // 14890
M=D // 14891
@Output.create // 14892
D=A // 14893
@13 // 14894
M=D // 14895
@Output.initMap.ret.83 // 14896
D=A // 14897
@CALL // 14898
0;JMP // 14899
(Output.initMap.ret.83)

////PopInstruction{address=temp 0}
@SP // 14900
AM=M-1 // 14901
D=M // 14902
@5 // 14903
M=D // 14904

////PushInstruction("constant 114")
@114 // 14905
D=A // 14906
@SP // 14907
AM=M+1 // 14908
A=A-1 // 14909
M=D // 14910

////PushInstruction("constant 0")
@SP // 14911
AM=M+1 // 14912
A=A-1 // 14913
M=0 // 14914

////PushInstruction("constant 0")
@SP // 14915
AM=M+1 // 14916
A=A-1 // 14917
M=0 // 14918

////PushInstruction("constant 0")
@SP // 14919
AM=M+1 // 14920
A=A-1 // 14921
M=0 // 14922

////PushInstruction("constant 29")
@29 // 14923
D=A // 14924
@SP // 14925
AM=M+1 // 14926
A=A-1 // 14927
M=D // 14928

////PushInstruction("constant 55")
@55 // 14929
D=A // 14930
@SP // 14931
AM=M+1 // 14932
A=A-1 // 14933
M=D // 14934

////PushInstruction("constant 51")
@51 // 14935
D=A // 14936
@SP // 14937
AM=M+1 // 14938
A=A-1 // 14939
M=D // 14940

////PushInstruction("constant 3")
@3 // 14941
D=A // 14942
@SP // 14943
AM=M+1 // 14944
A=A-1 // 14945
M=D // 14946

////PushInstruction("constant 3")
@3 // 14947
D=A // 14948
@SP // 14949
AM=M+1 // 14950
A=A-1 // 14951
M=D // 14952

////PushInstruction("constant 7")
@7 // 14953
D=A // 14954
@SP // 14955
AM=M+1 // 14956
A=A-1 // 14957
M=D // 14958

////PushInstruction("constant 0")
@SP // 14959
AM=M+1 // 14960
A=A-1 // 14961
M=0 // 14962

////PushInstruction("constant 0")
@SP // 14963
AM=M+1 // 14964
A=A-1 // 14965
M=0 // 14966

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=84}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14967
D=A // 14968
@14 // 14969
M=D // 14970
@Output.create // 14971
D=A // 14972
@13 // 14973
M=D // 14974
@Output.initMap.ret.84 // 14975
D=A // 14976
@CALL // 14977
0;JMP // 14978
(Output.initMap.ret.84)

////PopInstruction{address=temp 0}
@SP // 14979
AM=M-1 // 14980
D=M // 14981
@5 // 14982
M=D // 14983

////PushInstruction("constant 115")
@115 // 14984
D=A // 14985
@SP // 14986
AM=M+1 // 14987
A=A-1 // 14988
M=D // 14989

////PushInstruction("constant 0")
@SP // 14990
AM=M+1 // 14991
A=A-1 // 14992
M=0 // 14993

////PushInstruction("constant 0")
@SP // 14994
AM=M+1 // 14995
A=A-1 // 14996
M=0 // 14997

////PushInstruction("constant 0")
@SP // 14998
AM=M+1 // 14999
A=A-1 // 15000
M=0 // 15001

////PushInstruction("constant 30")
@30 // 15002
D=A // 15003
@SP // 15004
AM=M+1 // 15005
A=A-1 // 15006
M=D // 15007

////PushInstruction("constant 51")
@51 // 15008
D=A // 15009
@SP // 15010
AM=M+1 // 15011
A=A-1 // 15012
M=D // 15013

////PushInstruction("constant 6")
@6 // 15014
D=A // 15015
@SP // 15016
AM=M+1 // 15017
A=A-1 // 15018
M=D // 15019

////PushInstruction("constant 24")
@24 // 15020
D=A // 15021
@SP // 15022
AM=M+1 // 15023
A=A-1 // 15024
M=D // 15025

////PushInstruction("constant 51")
@51 // 15026
D=A // 15027
@SP // 15028
AM=M+1 // 15029
A=A-1 // 15030
M=D // 15031

////PushInstruction("constant 30")
@30 // 15032
D=A // 15033
@SP // 15034
AM=M+1 // 15035
A=A-1 // 15036
M=D // 15037

////PushInstruction("constant 0")
@SP // 15038
AM=M+1 // 15039
A=A-1 // 15040
M=0 // 15041

////PushInstruction("constant 0")
@SP // 15042
AM=M+1 // 15043
A=A-1 // 15044
M=0 // 15045

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=85}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15046
D=A // 15047
@14 // 15048
M=D // 15049
@Output.create // 15050
D=A // 15051
@13 // 15052
M=D // 15053
@Output.initMap.ret.85 // 15054
D=A // 15055
@CALL // 15056
0;JMP // 15057
(Output.initMap.ret.85)

////PopInstruction{address=temp 0}
@SP // 15058
AM=M-1 // 15059
D=M // 15060
@5 // 15061
M=D // 15062

////PushInstruction("constant 116")
@116 // 15063
D=A // 15064
@SP // 15065
AM=M+1 // 15066
A=A-1 // 15067
M=D // 15068

////PushInstruction("constant 4")
@4 // 15069
D=A // 15070
@SP // 15071
AM=M+1 // 15072
A=A-1 // 15073
M=D // 15074

////PushInstruction("constant 6")
@6 // 15075
D=A // 15076
@SP // 15077
AM=M+1 // 15078
A=A-1 // 15079
M=D // 15080

////PushInstruction("constant 6")
@6 // 15081
D=A // 15082
@SP // 15083
AM=M+1 // 15084
A=A-1 // 15085
M=D // 15086

////PushInstruction("constant 15")
@15 // 15087
D=A // 15088
@SP // 15089
AM=M+1 // 15090
A=A-1 // 15091
M=D // 15092

////PushInstruction("constant 6")
@6 // 15093
D=A // 15094
@SP // 15095
AM=M+1 // 15096
A=A-1 // 15097
M=D // 15098

////PushInstruction("constant 6")
@6 // 15099
D=A // 15100
@SP // 15101
AM=M+1 // 15102
A=A-1 // 15103
M=D // 15104

////PushInstruction("constant 6")
@6 // 15105
D=A // 15106
@SP // 15107
AM=M+1 // 15108
A=A-1 // 15109
M=D // 15110

////PushInstruction("constant 54")
@54 // 15111
D=A // 15112
@SP // 15113
AM=M+1 // 15114
A=A-1 // 15115
M=D // 15116

////PushInstruction("constant 28")
@28 // 15117
D=A // 15118
@SP // 15119
AM=M+1 // 15120
A=A-1 // 15121
M=D // 15122

////PushInstruction("constant 0")
@SP // 15123
AM=M+1 // 15124
A=A-1 // 15125
M=0 // 15126

////PushInstruction("constant 0")
@SP // 15127
AM=M+1 // 15128
A=A-1 // 15129
M=0 // 15130

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=86}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15131
D=A // 15132
@14 // 15133
M=D // 15134
@Output.create // 15135
D=A // 15136
@13 // 15137
M=D // 15138
@Output.initMap.ret.86 // 15139
D=A // 15140
@CALL // 15141
0;JMP // 15142
(Output.initMap.ret.86)

////PopInstruction{address=temp 0}
@SP // 15143
AM=M-1 // 15144
D=M // 15145
@5 // 15146
M=D // 15147

////PushInstruction("constant 117")
@117 // 15148
D=A // 15149
@SP // 15150
AM=M+1 // 15151
A=A-1 // 15152
M=D // 15153

////PushInstruction("constant 0")
@SP // 15154
AM=M+1 // 15155
A=A-1 // 15156
M=0 // 15157

////PushInstruction("constant 0")
@SP // 15158
AM=M+1 // 15159
A=A-1 // 15160
M=0 // 15161

////PushInstruction("constant 0")
@SP // 15162
AM=M+1 // 15163
A=A-1 // 15164
M=0 // 15165

////PushInstruction("constant 27")
@27 // 15166
D=A // 15167
@SP // 15168
AM=M+1 // 15169
A=A-1 // 15170
M=D // 15171

////PushInstruction("constant 27")
@27 // 15172
D=A // 15173
@SP // 15174
AM=M+1 // 15175
A=A-1 // 15176
M=D // 15177

////PushInstruction("constant 27")
@27 // 15178
D=A // 15179
@SP // 15180
AM=M+1 // 15181
A=A-1 // 15182
M=D // 15183

////PushInstruction("constant 27")
@27 // 15184
D=A // 15185
@SP // 15186
AM=M+1 // 15187
A=A-1 // 15188
M=D // 15189

////PushInstruction("constant 27")
@27 // 15190
D=A // 15191
@SP // 15192
AM=M+1 // 15193
A=A-1 // 15194
M=D // 15195

////PushInstruction("constant 54")
@54 // 15196
D=A // 15197
@SP // 15198
AM=M+1 // 15199
A=A-1 // 15200
M=D // 15201

////PushInstruction("constant 0")
@SP // 15202
AM=M+1 // 15203
A=A-1 // 15204
M=0 // 15205

////PushInstruction("constant 0")
@SP // 15206
AM=M+1 // 15207
A=A-1 // 15208
M=0 // 15209

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=87}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15210
D=A // 15211
@14 // 15212
M=D // 15213
@Output.create // 15214
D=A // 15215
@13 // 15216
M=D // 15217
@Output.initMap.ret.87 // 15218
D=A // 15219
@CALL // 15220
0;JMP // 15221
(Output.initMap.ret.87)

////PopInstruction{address=temp 0}
@SP // 15222
AM=M-1 // 15223
D=M // 15224
@5 // 15225
M=D // 15226

////PushInstruction("constant 118")
@118 // 15227
D=A // 15228
@SP // 15229
AM=M+1 // 15230
A=A-1 // 15231
M=D // 15232

////PushInstruction("constant 0")
@SP // 15233
AM=M+1 // 15234
A=A-1 // 15235
M=0 // 15236

////PushInstruction("constant 0")
@SP // 15237
AM=M+1 // 15238
A=A-1 // 15239
M=0 // 15240

////PushInstruction("constant 0")
@SP // 15241
AM=M+1 // 15242
A=A-1 // 15243
M=0 // 15244

////PushInstruction("constant 51")
@51 // 15245
D=A // 15246
@SP // 15247
AM=M+1 // 15248
A=A-1 // 15249
M=D // 15250

////PushInstruction("constant 51")
@51 // 15251
D=A // 15252
@SP // 15253
AM=M+1 // 15254
A=A-1 // 15255
M=D // 15256

////PushInstruction("constant 51")
@51 // 15257
D=A // 15258
@SP // 15259
AM=M+1 // 15260
A=A-1 // 15261
M=D // 15262

////PushInstruction("constant 51")
@51 // 15263
D=A // 15264
@SP // 15265
AM=M+1 // 15266
A=A-1 // 15267
M=D // 15268

////PushInstruction("constant 30")
@30 // 15269
D=A // 15270
@SP // 15271
AM=M+1 // 15272
A=A-1 // 15273
M=D // 15274

////PushInstruction("constant 12")
@12 // 15275
D=A // 15276
@SP // 15277
AM=M+1 // 15278
A=A-1 // 15279
M=D // 15280

////PushInstruction("constant 0")
@SP // 15281
AM=M+1 // 15282
A=A-1 // 15283
M=0 // 15284

////PushInstruction("constant 0")
@SP // 15285
AM=M+1 // 15286
A=A-1 // 15287
M=0 // 15288

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=88}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15289
D=A // 15290
@14 // 15291
M=D // 15292
@Output.create // 15293
D=A // 15294
@13 // 15295
M=D // 15296
@Output.initMap.ret.88 // 15297
D=A // 15298
@CALL // 15299
0;JMP // 15300
(Output.initMap.ret.88)

////PopInstruction{address=temp 0}
@SP // 15301
AM=M-1 // 15302
D=M // 15303
@5 // 15304
M=D // 15305

////PushInstruction("constant 119")
@119 // 15306
D=A // 15307
@SP // 15308
AM=M+1 // 15309
A=A-1 // 15310
M=D // 15311

////PushInstruction("constant 0")
@SP // 15312
AM=M+1 // 15313
A=A-1 // 15314
M=0 // 15315

////PushInstruction("constant 0")
@SP // 15316
AM=M+1 // 15317
A=A-1 // 15318
M=0 // 15319

////PushInstruction("constant 0")
@SP // 15320
AM=M+1 // 15321
A=A-1 // 15322
M=0 // 15323

////PushInstruction("constant 51")
@51 // 15324
D=A // 15325
@SP // 15326
AM=M+1 // 15327
A=A-1 // 15328
M=D // 15329

////PushInstruction("constant 51")
@51 // 15330
D=A // 15331
@SP // 15332
AM=M+1 // 15333
A=A-1 // 15334
M=D // 15335

////PushInstruction("constant 51")
@51 // 15336
D=A // 15337
@SP // 15338
AM=M+1 // 15339
A=A-1 // 15340
M=D // 15341

////PushInstruction("constant 63")
@63 // 15342
D=A // 15343
@SP // 15344
AM=M+1 // 15345
A=A-1 // 15346
M=D // 15347

////PushInstruction("constant 63")
@63 // 15348
D=A // 15349
@SP // 15350
AM=M+1 // 15351
A=A-1 // 15352
M=D // 15353

////PushInstruction("constant 18")
@18 // 15354
D=A // 15355
@SP // 15356
AM=M+1 // 15357
A=A-1 // 15358
M=D // 15359

////PushInstruction("constant 0")
@SP // 15360
AM=M+1 // 15361
A=A-1 // 15362
M=0 // 15363

////PushInstruction("constant 0")
@SP // 15364
AM=M+1 // 15365
A=A-1 // 15366
M=0 // 15367

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=89}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15368
D=A // 15369
@14 // 15370
M=D // 15371
@Output.create // 15372
D=A // 15373
@13 // 15374
M=D // 15375
@Output.initMap.ret.89 // 15376
D=A // 15377
@CALL // 15378
0;JMP // 15379
(Output.initMap.ret.89)

////PopInstruction{address=temp 0}
@SP // 15380
AM=M-1 // 15381
D=M // 15382
@5 // 15383
M=D // 15384

////PushInstruction("constant 120")
@120 // 15385
D=A // 15386
@SP // 15387
AM=M+1 // 15388
A=A-1 // 15389
M=D // 15390

////PushInstruction("constant 0")
@SP // 15391
AM=M+1 // 15392
A=A-1 // 15393
M=0 // 15394

////PushInstruction("constant 0")
@SP // 15395
AM=M+1 // 15396
A=A-1 // 15397
M=0 // 15398

////PushInstruction("constant 0")
@SP // 15399
AM=M+1 // 15400
A=A-1 // 15401
M=0 // 15402

////PushInstruction("constant 51")
@51 // 15403
D=A // 15404
@SP // 15405
AM=M+1 // 15406
A=A-1 // 15407
M=D // 15408

////PushInstruction("constant 30")
@30 // 15409
D=A // 15410
@SP // 15411
AM=M+1 // 15412
A=A-1 // 15413
M=D // 15414

////PushInstruction("constant 12")
@12 // 15415
D=A // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420

////PushInstruction("constant 12")
@12 // 15421
D=A // 15422
@SP // 15423
AM=M+1 // 15424
A=A-1 // 15425
M=D // 15426

////PushInstruction("constant 30")
@30 // 15427
D=A // 15428
@SP // 15429
AM=M+1 // 15430
A=A-1 // 15431
M=D // 15432

////PushInstruction("constant 51")
@51 // 15433
D=A // 15434
@SP // 15435
AM=M+1 // 15436
A=A-1 // 15437
M=D // 15438

////PushInstruction("constant 0")
@SP // 15439
AM=M+1 // 15440
A=A-1 // 15441
M=0 // 15442

////PushInstruction("constant 0")
@SP // 15443
AM=M+1 // 15444
A=A-1 // 15445
M=0 // 15446

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=90}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15447
D=A // 15448
@14 // 15449
M=D // 15450
@Output.create // 15451
D=A // 15452
@13 // 15453
M=D // 15454
@Output.initMap.ret.90 // 15455
D=A // 15456
@CALL // 15457
0;JMP // 15458
(Output.initMap.ret.90)

////PopInstruction{address=temp 0}
@SP // 15459
AM=M-1 // 15460
D=M // 15461
@5 // 15462
M=D // 15463

////PushInstruction("constant 121")
@121 // 15464
D=A // 15465
@SP // 15466
AM=M+1 // 15467
A=A-1 // 15468
M=D // 15469

////PushInstruction("constant 0")
@SP // 15470
AM=M+1 // 15471
A=A-1 // 15472
M=0 // 15473

////PushInstruction("constant 0")
@SP // 15474
AM=M+1 // 15475
A=A-1 // 15476
M=0 // 15477

////PushInstruction("constant 0")
@SP // 15478
AM=M+1 // 15479
A=A-1 // 15480
M=0 // 15481

////PushInstruction("constant 51")
@51 // 15482
D=A // 15483
@SP // 15484
AM=M+1 // 15485
A=A-1 // 15486
M=D // 15487

////PushInstruction("constant 51")
@51 // 15488
D=A // 15489
@SP // 15490
AM=M+1 // 15491
A=A-1 // 15492
M=D // 15493

////PushInstruction("constant 51")
@51 // 15494
D=A // 15495
@SP // 15496
AM=M+1 // 15497
A=A-1 // 15498
M=D // 15499

////PushInstruction("constant 62")
@62 // 15500
D=A // 15501
@SP // 15502
AM=M+1 // 15503
A=A-1 // 15504
M=D // 15505

////PushInstruction("constant 48")
@48 // 15506
D=A // 15507
@SP // 15508
AM=M+1 // 15509
A=A-1 // 15510
M=D // 15511

////PushInstruction("constant 24")
@24 // 15512
D=A // 15513
@SP // 15514
AM=M+1 // 15515
A=A-1 // 15516
M=D // 15517

////PushInstruction("constant 15")
@15 // 15518
D=A // 15519
@SP // 15520
AM=M+1 // 15521
A=A-1 // 15522
M=D // 15523

////PushInstruction("constant 0")
@SP // 15524
AM=M+1 // 15525
A=A-1 // 15526
M=0 // 15527

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=91}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15528
D=A // 15529
@14 // 15530
M=D // 15531
@Output.create // 15532
D=A // 15533
@13 // 15534
M=D // 15535
@Output.initMap.ret.91 // 15536
D=A // 15537
@CALL // 15538
0;JMP // 15539
(Output.initMap.ret.91)

////PopInstruction{address=temp 0}
@SP // 15540
AM=M-1 // 15541
D=M // 15542
@5 // 15543
M=D // 15544

////PushInstruction("constant 122")
@122 // 15545
D=A // 15546
@SP // 15547
AM=M+1 // 15548
A=A-1 // 15549
M=D // 15550

////PushInstruction("constant 0")
@SP // 15551
AM=M+1 // 15552
A=A-1 // 15553
M=0 // 15554

////PushInstruction("constant 0")
@SP // 15555
AM=M+1 // 15556
A=A-1 // 15557
M=0 // 15558

////PushInstruction("constant 0")
@SP // 15559
AM=M+1 // 15560
A=A-1 // 15561
M=0 // 15562

////PushInstruction("constant 63")
@63 // 15563
D=A // 15564
@SP // 15565
AM=M+1 // 15566
A=A-1 // 15567
M=D // 15568

////PushInstruction("constant 27")
@27 // 15569
D=A // 15570
@SP // 15571
AM=M+1 // 15572
A=A-1 // 15573
M=D // 15574

////PushInstruction("constant 12")
@12 // 15575
D=A // 15576
@SP // 15577
AM=M+1 // 15578
A=A-1 // 15579
M=D // 15580

////PushInstruction("constant 6")
@6 // 15581
D=A // 15582
@SP // 15583
AM=M+1 // 15584
A=A-1 // 15585
M=D // 15586

////PushInstruction("constant 51")
@51 // 15587
D=A // 15588
@SP // 15589
AM=M+1 // 15590
A=A-1 // 15591
M=D // 15592

////PushInstruction("constant 63")
@63 // 15593
D=A // 15594
@SP // 15595
AM=M+1 // 15596
A=A-1 // 15597
M=D // 15598

////PushInstruction("constant 0")
@SP // 15599
AM=M+1 // 15600
A=A-1 // 15601
M=0 // 15602

////PushInstruction("constant 0")
@SP // 15603
AM=M+1 // 15604
A=A-1 // 15605
M=0 // 15606

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=92}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15607
D=A // 15608
@14 // 15609
M=D // 15610
@Output.create // 15611
D=A // 15612
@13 // 15613
M=D // 15614
@Output.initMap.ret.92 // 15615
D=A // 15616
@CALL // 15617
0;JMP // 15618
(Output.initMap.ret.92)

////PopInstruction{address=temp 0}
@SP // 15619
AM=M-1 // 15620
D=M // 15621
@5 // 15622
M=D // 15623

////PushInstruction("constant 123")
@123 // 15624
D=A // 15625
@SP // 15626
AM=M+1 // 15627
A=A-1 // 15628
M=D // 15629

////PushInstruction("constant 56")
@56 // 15630
D=A // 15631
@SP // 15632
AM=M+1 // 15633
A=A-1 // 15634
M=D // 15635

////PushInstruction("constant 12")
@12 // 15636
D=A // 15637
@SP // 15638
AM=M+1 // 15639
A=A-1 // 15640
M=D // 15641

////PushInstruction("constant 12")
@12 // 15642
D=A // 15643
@SP // 15644
AM=M+1 // 15645
A=A-1 // 15646
M=D // 15647

////PushInstruction("constant 12")
@12 // 15648
D=A // 15649
@SP // 15650
AM=M+1 // 15651
A=A-1 // 15652
M=D // 15653

////PushInstruction("constant 7")
@7 // 15654
D=A // 15655
@SP // 15656
AM=M+1 // 15657
A=A-1 // 15658
M=D // 15659

////PushInstruction("constant 12")
@12 // 15660
D=A // 15661
@SP // 15662
AM=M+1 // 15663
A=A-1 // 15664
M=D // 15665

////PushInstruction("constant 12")
@12 // 15666
D=A // 15667
@SP // 15668
AM=M+1 // 15669
A=A-1 // 15670
M=D // 15671

////PushInstruction("constant 12")
@12 // 15672
D=A // 15673
@SP // 15674
AM=M+1 // 15675
A=A-1 // 15676
M=D // 15677

////PushInstruction("constant 56")
@56 // 15678
D=A // 15679
@SP // 15680
AM=M+1 // 15681
A=A-1 // 15682
M=D // 15683

////PushInstruction("constant 0")
@SP // 15684
AM=M+1 // 15685
A=A-1 // 15686
M=0 // 15687

////PushInstruction("constant 0")
@SP // 15688
AM=M+1 // 15689
A=A-1 // 15690
M=0 // 15691

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=93}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15692
D=A // 15693
@14 // 15694
M=D // 15695
@Output.create // 15696
D=A // 15697
@13 // 15698
M=D // 15699
@Output.initMap.ret.93 // 15700
D=A // 15701
@CALL // 15702
0;JMP // 15703
(Output.initMap.ret.93)

////PopInstruction{address=temp 0}
@SP // 15704
AM=M-1 // 15705
D=M // 15706
@5 // 15707
M=D // 15708

////PushInstruction("constant 124")
@124 // 15709
D=A // 15710
@SP // 15711
AM=M+1 // 15712
A=A-1 // 15713
M=D // 15714

////PushInstruction("constant 12")
@12 // 15715
D=A // 15716
@SP // 15717
AM=M+1 // 15718
A=A-1 // 15719
M=D // 15720

////PushInstruction("constant 12")
@12 // 15721
D=A // 15722
@SP // 15723
AM=M+1 // 15724
A=A-1 // 15725
M=D // 15726

////PushInstruction("constant 12")
@12 // 15727
D=A // 15728
@SP // 15729
AM=M+1 // 15730
A=A-1 // 15731
M=D // 15732

////PushInstruction("constant 12")
@12 // 15733
D=A // 15734
@SP // 15735
AM=M+1 // 15736
A=A-1 // 15737
M=D // 15738

////PushInstruction("constant 12")
@12 // 15739
D=A // 15740
@SP // 15741
AM=M+1 // 15742
A=A-1 // 15743
M=D // 15744

////PushInstruction("constant 12")
@12 // 15745
D=A // 15746
@SP // 15747
AM=M+1 // 15748
A=A-1 // 15749
M=D // 15750

////PushInstruction("constant 12")
@12 // 15751
D=A // 15752
@SP // 15753
AM=M+1 // 15754
A=A-1 // 15755
M=D // 15756

////PushInstruction("constant 12")
@12 // 15757
D=A // 15758
@SP // 15759
AM=M+1 // 15760
A=A-1 // 15761
M=D // 15762

////PushInstruction("constant 12")
@12 // 15763
D=A // 15764
@SP // 15765
AM=M+1 // 15766
A=A-1 // 15767
M=D // 15768

////PushInstruction("constant 0")
@SP // 15769
AM=M+1 // 15770
A=A-1 // 15771
M=0 // 15772

////PushInstruction("constant 0")
@SP // 15773
AM=M+1 // 15774
A=A-1 // 15775
M=0 // 15776

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=94}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15777
D=A // 15778
@14 // 15779
M=D // 15780
@Output.create // 15781
D=A // 15782
@13 // 15783
M=D // 15784
@Output.initMap.ret.94 // 15785
D=A // 15786
@CALL // 15787
0;JMP // 15788
(Output.initMap.ret.94)

////PopInstruction{address=temp 0}
@SP // 15789
AM=M-1 // 15790
D=M // 15791
@5 // 15792
M=D // 15793

////PushInstruction("constant 125")
@125 // 15794
D=A // 15795
@SP // 15796
AM=M+1 // 15797
A=A-1 // 15798
M=D // 15799

////PushInstruction("constant 7")
@7 // 15800
D=A // 15801
@SP // 15802
AM=M+1 // 15803
A=A-1 // 15804
M=D // 15805

////PushInstruction("constant 12")
@12 // 15806
D=A // 15807
@SP // 15808
AM=M+1 // 15809
A=A-1 // 15810
M=D // 15811

////PushInstruction("constant 12")
@12 // 15812
D=A // 15813
@SP // 15814
AM=M+1 // 15815
A=A-1 // 15816
M=D // 15817

////PushInstruction("constant 12")
@12 // 15818
D=A // 15819
@SP // 15820
AM=M+1 // 15821
A=A-1 // 15822
M=D // 15823

////PushInstruction("constant 56")
@56 // 15824
D=A // 15825
@SP // 15826
AM=M+1 // 15827
A=A-1 // 15828
M=D // 15829

////PushInstruction("constant 12")
@12 // 15830
D=A // 15831
@SP // 15832
AM=M+1 // 15833
A=A-1 // 15834
M=D // 15835

////PushInstruction("constant 12")
@12 // 15836
D=A // 15837
@SP // 15838
AM=M+1 // 15839
A=A-1 // 15840
M=D // 15841

////PushInstruction("constant 12")
@12 // 15842
D=A // 15843
@SP // 15844
AM=M+1 // 15845
A=A-1 // 15846
M=D // 15847

////PushInstruction("constant 7")
@7 // 15848
D=A // 15849
@SP // 15850
AM=M+1 // 15851
A=A-1 // 15852
M=D // 15853

////PushInstruction("constant 0")
@SP // 15854
AM=M+1 // 15855
A=A-1 // 15856
M=0 // 15857

////PushInstruction("constant 0")
@SP // 15858
AM=M+1 // 15859
A=A-1 // 15860
M=0 // 15861

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=95}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15862
D=A // 15863
@14 // 15864
M=D // 15865
@Output.create // 15866
D=A // 15867
@13 // 15868
M=D // 15869
@Output.initMap.ret.95 // 15870
D=A // 15871
@CALL // 15872
0;JMP // 15873
(Output.initMap.ret.95)

////PopInstruction{address=temp 0}
@SP // 15874
AM=M-1 // 15875
D=M // 15876
@5 // 15877
M=D // 15878

////PushInstruction("constant 126")
@126 // 15879
D=A // 15880
@SP // 15881
AM=M+1 // 15882
A=A-1 // 15883
M=D // 15884

////PushInstruction("constant 38")
@38 // 15885
D=A // 15886
@SP // 15887
AM=M+1 // 15888
A=A-1 // 15889
M=D // 15890

////PushInstruction("constant 45")
@45 // 15891
D=A // 15892
@SP // 15893
AM=M+1 // 15894
A=A-1 // 15895
M=D // 15896

////PushInstruction("constant 25")
@25 // 15897
D=A // 15898
@SP // 15899
AM=M+1 // 15900
A=A-1 // 15901
M=D // 15902

////PushInstruction("constant 0")
@SP // 15903
AM=M+1 // 15904
A=A-1 // 15905
M=0 // 15906

////PushInstruction("constant 0")
@SP // 15907
AM=M+1 // 15908
A=A-1 // 15909
M=0 // 15910

////PushInstruction("constant 0")
@SP // 15911
AM=M+1 // 15912
A=A-1 // 15913
M=0 // 15914

////PushInstruction("constant 0")
@SP // 15915
AM=M+1 // 15916
A=A-1 // 15917
M=0 // 15918

////PushInstruction("constant 0")
@SP // 15919
AM=M+1 // 15920
A=A-1 // 15921
M=0 // 15922

////PushInstruction("constant 0")
@SP // 15923
AM=M+1 // 15924
A=A-1 // 15925
M=0 // 15926

////PushInstruction("constant 0")
@SP // 15927
AM=M+1 // 15928
A=A-1 // 15929
M=0 // 15930

////PushInstruction("constant 0")
@SP // 15931
AM=M+1 // 15932
A=A-1 // 15933
M=0 // 15934

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=96}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15935
D=A // 15936
@14 // 15937
M=D // 15938
@Output.create // 15939
D=A // 15940
@13 // 15941
M=D // 15942
@Output.initMap.ret.96 // 15943
D=A // 15944
@CALL // 15945
0;JMP // 15946
(Output.initMap.ret.96)

////PopInstruction{address=temp 0}
@SP // 15947
AM=M-1 // 15948
D=M // 15949
@5 // 15950
M=D // 15951

////PushInstruction("constant 0")
@SP // 15952
AM=M+1 // 15953
A=A-1 // 15954
M=0 // 15955

////ReturnInstruction{}
@RETURN // 15956
0;JMP // 15957

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 15958
AM=M+1 // 15959
A=A-1 // 15960
M=0 // 15961

////PushInstruction("constant 11")
@11 // 15962
D=A // 15963
@SP // 15964
AM=M+1 // 15965
A=A-1 // 15966
M=D // 15967

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}
// call Array.new
@6 // 15968
D=A // 15969
@14 // 15970
M=D // 15971
@Array.new // 15972
D=A // 15973
@13 // 15974
M=D // 15975
@Output.create.ret.0 // 15976
D=A // 15977
@CALL // 15978
0;JMP // 15979
(Output.create.ret.0)

////PopInstruction{address=local 0}
@SP // 15980
AM=M-1 // 15981
D=M // 15982
@LCL // 15983
A=M // 15984
M=D // 15985

////PushInstruction("local 0")
@LCL // 15986
A=M // 15987
D=M // 15988
@SP // 15989
AM=M+1 // 15990
A=A-1 // 15991
M=D // 15992

////PushInstruction("static 0")
@Output.0 // 15993
D=M // 15994
@SP // 15995
AM=M+1 // 15996
A=A-1 // 15997
M=D // 15998

////PushInstruction("argument 0")
@ARG // 15999
A=M // 16000
D=M // 16001
@SP // 16002
AM=M+1 // 16003
A=A-1 // 16004
M=D // 16005

////ArithmeticInstruction{ADD}
@SP // 16006
AM=M-1 // 16007
D=M // 16008
A=A-1 // 16009
M=D+M // 16010

////PopInstruction{address=pointer 1}
@SP // 16011
AM=M-1 // 16012
D=M // 16013
@4 // 16014
M=D // 16015

////PopInstruction{address=that 0}
@SP // 16016
AM=M-1 // 16017
D=M // 16018
@THAT // 16019
A=M // 16020
M=D // 16021

////PushInstruction("argument 1")
@ARG // 16022
A=M+1 // 16023
D=M // 16024
@SP // 16025
AM=M+1 // 16026
A=A-1 // 16027
M=D // 16028

////PushInstruction("local 0")
@LCL // 16029
A=M // 16030
D=M // 16031
@SP // 16032
AM=M+1 // 16033
A=A-1 // 16034
M=D // 16035

////PushInstruction("constant 0")
@SP // 16036
AM=M+1 // 16037
A=A-1 // 16038
M=0 // 16039

////ArithmeticInstruction{ADD}
@SP // 16040
AM=M-1 // 16041
D=M // 16042
A=A-1 // 16043
M=D+M // 16044

////PopInstruction{address=pointer 1}
@SP // 16045
AM=M-1 // 16046
D=M // 16047
@4 // 16048
M=D // 16049

////PopInstruction{address=that 0}
@SP // 16050
AM=M-1 // 16051
D=M // 16052
@THAT // 16053
A=M // 16054
M=D // 16055

////PushInstruction("argument 2")
@ARG // 16056
A=M+1 // 16057
A=A+1 // 16058
D=M // 16059
@SP // 16060
AM=M+1 // 16061
A=A-1 // 16062
M=D // 16063

////PushInstruction("local 0")
@LCL // 16064
A=M // 16065
D=M // 16066
@SP // 16067
AM=M+1 // 16068
A=A-1 // 16069
M=D // 16070

////PushInstruction("constant 1")
@SP // 16071
AM=M+1 // 16072
A=A-1 // 16073
M=1 // 16074

////ArithmeticInstruction{ADD}
@SP // 16075
AM=M-1 // 16076
D=M // 16077
A=A-1 // 16078
M=D+M // 16079

////PopInstruction{address=pointer 1}
@SP // 16080
AM=M-1 // 16081
D=M // 16082
@4 // 16083
M=D // 16084

////PopInstruction{address=that 0}
@SP // 16085
AM=M-1 // 16086
D=M // 16087
@THAT // 16088
A=M // 16089
M=D // 16090

////PushInstruction("argument 3")
@ARG // 16091
A=M+1 // 16092
A=A+1 // 16093
A=A+1 // 16094
D=M // 16095
@SP // 16096
AM=M+1 // 16097
A=A-1 // 16098
M=D // 16099

////PushInstruction("local 0")
@LCL // 16100
A=M // 16101
D=M // 16102
@SP // 16103
AM=M+1 // 16104
A=A-1 // 16105
M=D // 16106

////PushInstruction("constant 2")
@2 // 16107
D=A // 16108
@SP // 16109
AM=M+1 // 16110
A=A-1 // 16111
M=D // 16112

////ArithmeticInstruction{ADD}
@SP // 16113
AM=M-1 // 16114
D=M // 16115
A=A-1 // 16116
M=D+M // 16117

////PopInstruction{address=pointer 1}
@SP // 16118
AM=M-1 // 16119
D=M // 16120
@4 // 16121
M=D // 16122

////PopInstruction{address=that 0}
@SP // 16123
AM=M-1 // 16124
D=M // 16125
@THAT // 16126
A=M // 16127
M=D // 16128

////PushInstruction("argument 4")
@ARG // 16129
D=M // 16130
@4 // 16131
A=D+A // 16132
D=M // 16133
@SP // 16134
AM=M+1 // 16135
A=A-1 // 16136
M=D // 16137

////PushInstruction("local 0")
@LCL // 16138
A=M // 16139
D=M // 16140
@SP // 16141
AM=M+1 // 16142
A=A-1 // 16143
M=D // 16144

////PushInstruction("constant 3")
@3 // 16145
D=A // 16146
@SP // 16147
AM=M+1 // 16148
A=A-1 // 16149
M=D // 16150

////ArithmeticInstruction{ADD}
@SP // 16151
AM=M-1 // 16152
D=M // 16153
A=A-1 // 16154
M=D+M // 16155

////PopInstruction{address=pointer 1}
@SP // 16156
AM=M-1 // 16157
D=M // 16158
@4 // 16159
M=D // 16160

////PopInstruction{address=that 0}
@SP // 16161
AM=M-1 // 16162
D=M // 16163
@THAT // 16164
A=M // 16165
M=D // 16166

////PushInstruction("argument 5")
@ARG // 16167
D=M // 16168
@5 // 16169
A=D+A // 16170
D=M // 16171
@SP // 16172
AM=M+1 // 16173
A=A-1 // 16174
M=D // 16175

////PushInstruction("local 0")
@LCL // 16176
A=M // 16177
D=M // 16178
@SP // 16179
AM=M+1 // 16180
A=A-1 // 16181
M=D // 16182

////PushInstruction("constant 4")
@4 // 16183
D=A // 16184
@SP // 16185
AM=M+1 // 16186
A=A-1 // 16187
M=D // 16188

////ArithmeticInstruction{ADD}
@SP // 16189
AM=M-1 // 16190
D=M // 16191
A=A-1 // 16192
M=D+M // 16193

////PopInstruction{address=pointer 1}
@SP // 16194
AM=M-1 // 16195
D=M // 16196
@4 // 16197
M=D // 16198

////PopInstruction{address=that 0}
@SP // 16199
AM=M-1 // 16200
D=M // 16201
@THAT // 16202
A=M // 16203
M=D // 16204

////PushInstruction("argument 6")
@ARG // 16205
D=M // 16206
@6 // 16207
A=D+A // 16208
D=M // 16209
@SP // 16210
AM=M+1 // 16211
A=A-1 // 16212
M=D // 16213

////PushInstruction("local 0")
@LCL // 16214
A=M // 16215
D=M // 16216
@SP // 16217
AM=M+1 // 16218
A=A-1 // 16219
M=D // 16220

////PushInstruction("constant 5")
@5 // 16221
D=A // 16222
@SP // 16223
AM=M+1 // 16224
A=A-1 // 16225
M=D // 16226

////ArithmeticInstruction{ADD}
@SP // 16227
AM=M-1 // 16228
D=M // 16229
A=A-1 // 16230
M=D+M // 16231

////PopInstruction{address=pointer 1}
@SP // 16232
AM=M-1 // 16233
D=M // 16234
@4 // 16235
M=D // 16236

////PopInstruction{address=that 0}
@SP // 16237
AM=M-1 // 16238
D=M // 16239
@THAT // 16240
A=M // 16241
M=D // 16242

////PushInstruction("argument 7")
@ARG // 16243
D=M // 16244
@7 // 16245
A=D+A // 16246
D=M // 16247
@SP // 16248
AM=M+1 // 16249
A=A-1 // 16250
M=D // 16251

////PushInstruction("local 0")
@LCL // 16252
A=M // 16253
D=M // 16254
@SP // 16255
AM=M+1 // 16256
A=A-1 // 16257
M=D // 16258

////PushInstruction("constant 6")
@6 // 16259
D=A // 16260
@SP // 16261
AM=M+1 // 16262
A=A-1 // 16263
M=D // 16264

////ArithmeticInstruction{ADD}
@SP // 16265
AM=M-1 // 16266
D=M // 16267
A=A-1 // 16268
M=D+M // 16269

////PopInstruction{address=pointer 1}
@SP // 16270
AM=M-1 // 16271
D=M // 16272
@4 // 16273
M=D // 16274

////PopInstruction{address=that 0}
@SP // 16275
AM=M-1 // 16276
D=M // 16277
@THAT // 16278
A=M // 16279
M=D // 16280

////PushInstruction("argument 8")
@ARG // 16281
D=M // 16282
@8 // 16283
A=D+A // 16284
D=M // 16285
@SP // 16286
AM=M+1 // 16287
A=A-1 // 16288
M=D // 16289

////PushInstruction("local 0")
@LCL // 16290
A=M // 16291
D=M // 16292
@SP // 16293
AM=M+1 // 16294
A=A-1 // 16295
M=D // 16296

////PushInstruction("constant 7")
@7 // 16297
D=A // 16298
@SP // 16299
AM=M+1 // 16300
A=A-1 // 16301
M=D // 16302

////ArithmeticInstruction{ADD}
@SP // 16303
AM=M-1 // 16304
D=M // 16305
A=A-1 // 16306
M=D+M // 16307

////PopInstruction{address=pointer 1}
@SP // 16308
AM=M-1 // 16309
D=M // 16310
@4 // 16311
M=D // 16312

////PopInstruction{address=that 0}
@SP // 16313
AM=M-1 // 16314
D=M // 16315
@THAT // 16316
A=M // 16317
M=D // 16318

////PushInstruction("argument 9")
@ARG // 16319
D=M // 16320
@9 // 16321
A=D+A // 16322
D=M // 16323
@SP // 16324
AM=M+1 // 16325
A=A-1 // 16326
M=D // 16327

////PushInstruction("local 0")
@LCL // 16328
A=M // 16329
D=M // 16330
@SP // 16331
AM=M+1 // 16332
A=A-1 // 16333
M=D // 16334

////PushInstruction("constant 8")
@8 // 16335
D=A // 16336
@SP // 16337
AM=M+1 // 16338
A=A-1 // 16339
M=D // 16340

////ArithmeticInstruction{ADD}
@SP // 16341
AM=M-1 // 16342
D=M // 16343
A=A-1 // 16344
M=D+M // 16345

////PopInstruction{address=pointer 1}
@SP // 16346
AM=M-1 // 16347
D=M // 16348
@4 // 16349
M=D // 16350

////PopInstruction{address=that 0}
@SP // 16351
AM=M-1 // 16352
D=M // 16353
@THAT // 16354
A=M // 16355
M=D // 16356

////PushInstruction("argument 10")
@ARG // 16357
D=M // 16358
@10 // 16359
A=D+A // 16360
D=M // 16361
@SP // 16362
AM=M+1 // 16363
A=A-1 // 16364
M=D // 16365

////PushInstruction("local 0")
@LCL // 16366
A=M // 16367
D=M // 16368
@SP // 16369
AM=M+1 // 16370
A=A-1 // 16371
M=D // 16372

////PushInstruction("constant 9")
@9 // 16373
D=A // 16374
@SP // 16375
AM=M+1 // 16376
A=A-1 // 16377
M=D // 16378

////ArithmeticInstruction{ADD}
@SP // 16379
AM=M-1 // 16380
D=M // 16381
A=A-1 // 16382
M=D+M // 16383

////PopInstruction{address=pointer 1}
@SP // 16384
AM=M-1 // 16385
D=M // 16386
@4 // 16387
M=D // 16388

////PopInstruction{address=that 0}
@SP // 16389
AM=M-1 // 16390
D=M // 16391
@THAT // 16392
A=M // 16393
M=D // 16394

////PushInstruction("argument 11")
@ARG // 16395
D=M // 16396
@11 // 16397
A=D+A // 16398
D=M // 16399
@SP // 16400
AM=M+1 // 16401
A=A-1 // 16402
M=D // 16403

////PushInstruction("local 0")
@LCL // 16404
A=M // 16405
D=M // 16406
@SP // 16407
AM=M+1 // 16408
A=A-1 // 16409
M=D // 16410

////PushInstruction("constant 10")
@10 // 16411
D=A // 16412
@SP // 16413
AM=M+1 // 16414
A=A-1 // 16415
M=D // 16416

////ArithmeticInstruction{ADD}
@SP // 16417
AM=M-1 // 16418
D=M // 16419
A=A-1 // 16420
M=D+M // 16421

////PopInstruction{address=pointer 1}
@SP // 16422
AM=M-1 // 16423
D=M // 16424
@4 // 16425
M=D // 16426

////PopInstruction{address=that 0}
@SP // 16427
AM=M-1 // 16428
D=M // 16429
@THAT // 16430
A=M // 16431
M=D // 16432

////PushInstruction("constant 0")
@SP // 16433
AM=M+1 // 16434
A=A-1 // 16435
M=0 // 16436

////ReturnInstruction{}
@RETURN // 16437
0;JMP // 16438

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////PushInstruction("argument 0")
@ARG // 16439
A=M // 16440
D=M // 16441
@SP // 16442
AM=M+1 // 16443
A=A-1 // 16444
M=D // 16445

////PushInstruction("constant 32")
@32 // 16446
D=A // 16447
@SP // 16448
AM=M+1 // 16449
A=A-1 // 16450
M=D // 16451

////ArithmeticInstruction{LT}
@COMPARE_Output.getMap_lt0 // 16452
D=A // 16453
@13 // 16454
M=D // 16455
@SP // 16456
AM=M-1 // 16457
D=M // 16458
A=A-1 // 16459
D=M-D // 16460
@DO_LT // 16461
0;JMP // 16462
(COMPARE_Output.getMap_lt0)
@SP // 16463
A=M-1 // 16464
M=D // 16465

////PushInstruction("argument 0")
@ARG // 16466
A=M // 16467
D=M // 16468
@SP // 16469
AM=M+1 // 16470
A=A-1 // 16471
M=D // 16472

////PushInstruction("constant 126")
@126 // 16473
D=A // 16474
@SP // 16475
AM=M+1 // 16476
A=A-1 // 16477
M=D // 16478

////ArithmeticInstruction{GT}
@COMPARE_Output.getMap_gt1 // 16479
D=A // 16480
@13 // 16481
M=D // 16482
@SP // 16483
AM=M-1 // 16484
D=M // 16485
A=A-1 // 16486
D=M-D // 16487
@DO_GT // 16488
0;JMP // 16489
(COMPARE_Output.getMap_gt1)
@SP // 16490
A=M-1 // 16491
M=D // 16492

////ArithmeticInstruction{OR}
@SP // 16493
AM=M-1 // 16494
D=M // 16495
A=A-1 // 16496
M=D|M // 16497

////PushInstruction("constant 0")
@SP // 16498
AM=M+1 // 16499
A=A-1 // 16500
M=0 // 16501

////ArithmeticInstruction{EQ}
@COMPARE_Output.getMap_eq2 // 16502
D=A // 16503
@13 // 16504
M=D // 16505
@SP // 16506
AM=M-1 // 16507
D=M // 16508
A=A-1 // 16509
D=M-D // 16510
@DO_EQ // 16511
0;JMP // 16512
(COMPARE_Output.getMap_eq2)
@SP // 16513
A=M-1 // 16514
M=D // 16515

////IfGotoInstruction{label='Output.getMap.IfElse1}
// if-goto Output.getMap.IfElse1
@SP // 16516
AM=M-1 // 16517
D=M // 16518
@Output.getMap.IfElse1 // 16519
D;JNE // 16520

////PushInstruction("constant 0")
@SP // 16521
AM=M+1 // 16522
A=A-1 // 16523
M=0 // 16524

////PopInstruction{address=argument 0}
@SP // 16525
AM=M-1 // 16526
D=M // 16527
@ARG // 16528
A=M // 16529
M=D // 16530

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 16531
0;JMP // 16532

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////PushInstruction("static 0")
@Output.0 // 16533
D=M // 16534
@SP // 16535
AM=M+1 // 16536
A=A-1 // 16537
M=D // 16538

////PushInstruction("argument 0")
@ARG // 16539
A=M // 16540
D=M // 16541
@SP // 16542
AM=M+1 // 16543
A=A-1 // 16544
M=D // 16545

////ArithmeticInstruction{ADD}
@SP // 16546
AM=M-1 // 16547
D=M // 16548
A=A-1 // 16549
M=D+M // 16550

////PopInstruction{address=pointer 1}
@SP // 16551
AM=M-1 // 16552
D=M // 16553
@4 // 16554
M=D // 16555

////PushInstruction("that 0")
@THAT // 16556
A=M // 16557
D=M // 16558
@SP // 16559
AM=M+1 // 16560
A=A-1 // 16561
M=D // 16562

////ReturnInstruction{}
@RETURN // 16563
0;JMP // 16564

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushInstruction("argument 1")
@ARG // 16565
A=M+1 // 16566
D=M // 16567
@SP // 16568
AM=M+1 // 16569
A=A-1 // 16570
M=D // 16571

////PopInstruction{address=Output.1}
@SP // 16572
AM=M-1 // 16573
D=M // 16574
@Output.1 // 16575
M=D // 16576

////PushInstruction("argument 0")
@ARG // 16577
A=M // 16578
D=M // 16579
@SP // 16580
AM=M+1 // 16581
A=A-1 // 16582
M=D // 16583

////PopInstruction{address=Output.2}
@SP // 16584
AM=M-1 // 16585
D=M // 16586
@Output.2 // 16587
M=D // 16588

////PushInstruction("constant 0")
@SP // 16589
AM=M+1 // 16590
A=A-1 // 16591
M=0 // 16592

////ReturnInstruction{}
@RETURN // 16593
0;JMP // 16594

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 16595
AM=M+1 // 16596
A=A-1 // 16597
M=0 // 16598
@SP // 16599
AM=M+1 // 16600
A=A-1 // 16601
M=0 // 16602
@SP // 16603
AM=M+1 // 16604
A=A-1 // 16605
M=0 // 16606
@SP // 16607
AM=M+1 // 16608
A=A-1 // 16609
M=0 // 16610

////PushInstruction("argument 0")
@ARG // 16611
A=M // 16612
D=M // 16613
@SP // 16614
AM=M+1 // 16615
A=A-1 // 16616
M=D // 16617

////CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}
// call Output.getMap
@6 // 16618
D=A // 16619
@14 // 16620
M=D // 16621
@Output.getMap // 16622
D=A // 16623
@13 // 16624
M=D // 16625
@Output.printChar.ret.0 // 16626
D=A // 16627
@CALL // 16628
0;JMP // 16629
(Output.printChar.ret.0)

////PopInstruction{address=local 0}
@SP // 16630
AM=M-1 // 16631
D=M // 16632
@LCL // 16633
A=M // 16634
M=D // 16635

////PushInstruction("constant 0")
@SP // 16636
AM=M+1 // 16637
A=A-1 // 16638
M=0 // 16639

////PopInstruction{address=local 3}
@SP // 16640
AM=M-1 // 16641
D=M // 16642
@LCL // 16643
A=M+1 // 16644
A=A+1 // 16645
A=A+1 // 16646
M=D // 16647

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////PushInstruction("local 3")
@LCL // 16648
A=M+1 // 16649
A=A+1 // 16650
A=A+1 // 16651
D=M // 16652
@SP // 16653
AM=M+1 // 16654
A=A-1 // 16655
M=D // 16656

////PushInstruction("constant 11")
@11 // 16657
D=A // 16658
@SP // 16659
AM=M+1 // 16660
A=A-1 // 16661
M=D // 16662

////ArithmeticInstruction{LT}
@COMPARE_Output.printChar_lt3 // 16663
D=A // 16664
@13 // 16665
M=D // 16666
@SP // 16667
AM=M-1 // 16668
D=M // 16669
A=A-1 // 16670
D=M-D // 16671
@DO_LT // 16672
0;JMP // 16673
(COMPARE_Output.printChar_lt3)
@SP // 16674
A=M-1 // 16675
M=D // 16676

////PushInstruction("constant 0")
@SP // 16677
AM=M+1 // 16678
A=A-1 // 16679
M=0 // 16680

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq4 // 16681
D=A // 16682
@13 // 16683
M=D // 16684
@SP // 16685
AM=M-1 // 16686
D=M // 16687
A=A-1 // 16688
D=M-D // 16689
@DO_EQ // 16690
0;JMP // 16691
(COMPARE_Output.printChar_eq4)
@SP // 16692
A=M-1 // 16693
M=D // 16694

////IfGotoInstruction{label='WHILE_END_Output.printChar1}
// if-goto WHILE_END_Output.printChar1
@SP // 16695
AM=M-1 // 16696
D=M // 16697
@WHILE_END_Output.printChar1 // 16698
D;JNE // 16699

////PushInstruction("constant 16384")
@16384 // 16700
D=A // 16701
@SP // 16702
AM=M+1 // 16703
A=A-1 // 16704
M=D // 16705

////PushInstruction("static 2")
@Output.2 // 16706
D=M // 16707
@SP // 16708
AM=M+1 // 16709
A=A-1 // 16710
M=D // 16711

////PushInstruction("constant 11")
@11 // 16712
D=A // 16713
@SP // 16714
AM=M+1 // 16715
A=A-1 // 16716
M=D // 16717

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16718
D=A // 16719
@14 // 16720
M=D // 16721
@Math.multiply // 16722
D=A // 16723
@13 // 16724
M=D // 16725
@Output.printChar.ret.1 // 16726
D=A // 16727
@CALL // 16728
0;JMP // 16729
(Output.printChar.ret.1)

////PushInstruction("local 3")
@LCL // 16730
A=M+1 // 16731
A=A+1 // 16732
A=A+1 // 16733
D=M // 16734
@SP // 16735
AM=M+1 // 16736
A=A-1 // 16737
M=D // 16738

////ArithmeticInstruction{ADD}
@SP // 16739
AM=M-1 // 16740
D=M // 16741
A=A-1 // 16742
M=D+M // 16743

////PushInstruction("constant 32")
@32 // 16744
D=A // 16745
@SP // 16746
AM=M+1 // 16747
A=A-1 // 16748
M=D // 16749

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=2, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16750
D=A // 16751
@14 // 16752
M=D // 16753
@Math.multiply // 16754
D=A // 16755
@13 // 16756
M=D // 16757
@Output.printChar.ret.2 // 16758
D=A // 16759
@CALL // 16760
0;JMP // 16761
(Output.printChar.ret.2)

////ArithmeticInstruction{ADD}
@SP // 16762
AM=M-1 // 16763
D=M // 16764
A=A-1 // 16765
M=D+M // 16766

////PushInstruction("static 1")
@Output.1 // 16767
D=M // 16768
@SP // 16769
AM=M+1 // 16770
A=A-1 // 16771
M=D // 16772

////PushInstruction("constant 2")
@2 // 16773
D=A // 16774
@SP // 16775
AM=M+1 // 16776
A=A-1 // 16777
M=D // 16778

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=3, Output.create=1}, currentFunction='Output.printChar'}
// call Math.divide
@7 // 16779
D=A // 16780
@14 // 16781
M=D // 16782
@Math.divide // 16783
D=A // 16784
@13 // 16785
M=D // 16786
@Output.printChar.ret.3 // 16787
D=A // 16788
@CALL // 16789
0;JMP // 16790
(Output.printChar.ret.3)

////ArithmeticInstruction{ADD}
@SP // 16791
AM=M-1 // 16792
D=M // 16793
A=A-1 // 16794
M=D+M // 16795

////PopInstruction{address=local 1}
@SP // 16796
AM=M-1 // 16797
D=M // 16798
@LCL // 16799
A=M+1 // 16800
M=D // 16801

////PushInstruction("static 1")
@Output.1 // 16802
D=M // 16803
@SP // 16804
AM=M+1 // 16805
A=A-1 // 16806
M=D // 16807

////PushInstruction("constant 1")
@SP // 16808
AM=M+1 // 16809
A=A-1 // 16810
M=1 // 16811

////ArithmeticInstruction{AND}
@SP // 16812
AM=M-1 // 16813
D=M // 16814
A=A-1 // 16815
M=D&M // 16816

////PushInstruction("constant 0")
@SP // 16817
AM=M+1 // 16818
A=A-1 // 16819
M=0 // 16820

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq5 // 16821
D=A // 16822
@13 // 16823
M=D // 16824
@SP // 16825
AM=M-1 // 16826
D=M // 16827
A=A-1 // 16828
D=M-D // 16829
@DO_EQ // 16830
0;JMP // 16831
(COMPARE_Output.printChar_eq5)
@SP // 16832
A=M-1 // 16833
M=D // 16834

////PushInstruction("constant 0")
@SP // 16835
AM=M+1 // 16836
A=A-1 // 16837
M=0 // 16838

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq6 // 16839
D=A // 16840
@13 // 16841
M=D // 16842
@SP // 16843
AM=M-1 // 16844
D=M // 16845
A=A-1 // 16846
D=M-D // 16847
@DO_EQ // 16848
0;JMP // 16849
(COMPARE_Output.printChar_eq6)
@SP // 16850
A=M-1 // 16851
M=D // 16852

////IfGotoInstruction{label='Output.printChar.IfElse1}
// if-goto Output.printChar.IfElse1
@SP // 16853
AM=M-1 // 16854
D=M // 16855
@Output.printChar.IfElse1 // 16856
D;JNE // 16857

////PushInstruction("local 0")
@LCL // 16858
A=M // 16859
D=M // 16860
@SP // 16861
AM=M+1 // 16862
A=A-1 // 16863
M=D // 16864

////PushInstruction("local 3")
@LCL // 16865
A=M+1 // 16866
A=A+1 // 16867
A=A+1 // 16868
D=M // 16869
@SP // 16870
AM=M+1 // 16871
A=A-1 // 16872
M=D // 16873

////ArithmeticInstruction{ADD}
@SP // 16874
AM=M-1 // 16875
D=M // 16876
A=A-1 // 16877
M=D+M // 16878

////PopInstruction{address=pointer 1}
@SP // 16879
AM=M-1 // 16880
D=M // 16881
@4 // 16882
M=D // 16883

////PushInstruction("that 0")
@THAT // 16884
A=M // 16885
D=M // 16886
@SP // 16887
AM=M+1 // 16888
A=A-1 // 16889
M=D // 16890

////PopInstruction{address=local 2}
@SP // 16891
AM=M-1 // 16892
D=M // 16893
@LCL // 16894
A=M+1 // 16895
A=A+1 // 16896
M=D // 16897

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 16898
0;JMP // 16899

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushInstruction("local 0")
@LCL // 16900
A=M // 16901
D=M // 16902
@SP // 16903
AM=M+1 // 16904
A=A-1 // 16905
M=D // 16906

////PushInstruction("local 3")
@LCL // 16907
A=M+1 // 16908
A=A+1 // 16909
A=A+1 // 16910
D=M // 16911
@SP // 16912
AM=M+1 // 16913
A=A-1 // 16914
M=D // 16915

////ArithmeticInstruction{ADD}
@SP // 16916
AM=M-1 // 16917
D=M // 16918
A=A-1 // 16919
M=D+M // 16920

////PopInstruction{address=pointer 1}
@SP // 16921
AM=M-1 // 16922
D=M // 16923
@4 // 16924
M=D // 16925

////PushInstruction("that 0")
@THAT // 16926
A=M // 16927
D=M // 16928
@SP // 16929
AM=M+1 // 16930
A=A-1 // 16931
M=D // 16932

////PushInstruction("constant 256")
@256 // 16933
D=A // 16934
@SP // 16935
AM=M+1 // 16936
A=A-1 // 16937
M=D // 16938

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=4, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16939
D=A // 16940
@14 // 16941
M=D // 16942
@Math.multiply // 16943
D=A // 16944
@13 // 16945
M=D // 16946
@Output.printChar.ret.4 // 16947
D=A // 16948
@CALL // 16949
0;JMP // 16950
(Output.printChar.ret.4)

////PopInstruction{address=local 2}
@SP // 16951
AM=M-1 // 16952
D=M // 16953
@LCL // 16954
A=M+1 // 16955
A=A+1 // 16956
M=D // 16957

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushInstruction("local 1")
@LCL // 16958
A=M+1 // 16959
D=M // 16960
@SP // 16961
AM=M+1 // 16962
A=A-1 // 16963
M=D // 16964

////PushInstruction("constant 0")
@SP // 16965
AM=M+1 // 16966
A=A-1 // 16967
M=0 // 16968

////ArithmeticInstruction{ADD}
@SP // 16969
AM=M-1 // 16970
D=M // 16971
A=A-1 // 16972
M=D+M // 16973

////PopInstruction{address=pointer 1}
@SP // 16974
AM=M-1 // 16975
D=M // 16976
@4 // 16977
M=D // 16978

////PushInstruction("that 0")
@THAT // 16979
A=M // 16980
D=M // 16981
@SP // 16982
AM=M+1 // 16983
A=A-1 // 16984
M=D // 16985

////PushInstruction("local 2")
@LCL // 16986
A=M+1 // 16987
A=A+1 // 16988
D=M // 16989
@SP // 16990
AM=M+1 // 16991
A=A-1 // 16992
M=D // 16993

////ArithmeticInstruction{OR}
@SP // 16994
AM=M-1 // 16995
D=M // 16996
A=A-1 // 16997
M=D|M // 16998

////PushInstruction("local 1")
@LCL // 16999
A=M+1 // 17000
D=M // 17001
@SP // 17002
AM=M+1 // 17003
A=A-1 // 17004
M=D // 17005

////PushInstruction("constant 0")
@SP // 17006
AM=M+1 // 17007
A=A-1 // 17008
M=0 // 17009

////ArithmeticInstruction{ADD}
@SP // 17010
AM=M-1 // 17011
D=M // 17012
A=A-1 // 17013
M=D+M // 17014

////PopInstruction{address=pointer 1}
@SP // 17015
AM=M-1 // 17016
D=M // 17017
@4 // 17018
M=D // 17019

////PopInstruction{address=that 0}
@SP // 17020
AM=M-1 // 17021
D=M // 17022
@THAT // 17023
A=M // 17024
M=D // 17025

////PushInstruction("local 3")
@LCL // 17026
A=M+1 // 17027
A=A+1 // 17028
A=A+1 // 17029
D=M // 17030
@SP // 17031
AM=M+1 // 17032
A=A-1 // 17033
M=D // 17034

////PushInstruction("constant 1")
@SP // 17035
AM=M+1 // 17036
A=A-1 // 17037
M=1 // 17038

////ArithmeticInstruction{ADD}
@SP // 17039
AM=M-1 // 17040
D=M // 17041
A=A-1 // 17042
M=D+M // 17043

////PopInstruction{address=local 3}
@SP // 17044
AM=M-1 // 17045
D=M // 17046
@LCL // 17047
A=M+1 // 17048
A=A+1 // 17049
A=A+1 // 17050
M=D // 17051

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 17052
0;JMP // 17053

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////PushInstruction("static 1")
@Output.1 // 17054
D=M // 17055
@SP // 17056
AM=M+1 // 17057
A=A-1 // 17058
M=D // 17059

////PushInstruction("constant 63")
@63 // 17060
D=A // 17061
@SP // 17062
AM=M+1 // 17063
A=A-1 // 17064
M=D // 17065

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq7 // 17066
D=A // 17067
@13 // 17068
M=D // 17069
@SP // 17070
AM=M-1 // 17071
D=M // 17072
A=A-1 // 17073
D=M-D // 17074
@DO_EQ // 17075
0;JMP // 17076
(COMPARE_Output.printChar_eq7)
@SP // 17077
A=M-1 // 17078
M=D // 17079

////PushInstruction("constant 0")
@SP // 17080
AM=M+1 // 17081
A=A-1 // 17082
M=0 // 17083

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq8 // 17084
D=A // 17085
@13 // 17086
M=D // 17087
@SP // 17088
AM=M-1 // 17089
D=M // 17090
A=A-1 // 17091
D=M-D // 17092
@DO_EQ // 17093
0;JMP // 17094
(COMPARE_Output.printChar_eq8)
@SP // 17095
A=M-1 // 17096
M=D // 17097

////IfGotoInstruction{label='Output.printChar.IfElse2}
// if-goto Output.printChar.IfElse2
@SP // 17098
AM=M-1 // 17099
D=M // 17100
@Output.printChar.IfElse2 // 17101
D;JNE // 17102

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}, currentFunction='Output.printChar'}
// call Output.println
@5 // 17103
D=A // 17104
@14 // 17105
M=D // 17106
@Output.println // 17107
D=A // 17108
@13 // 17109
M=D // 17110
@Output.printChar.ret.5 // 17111
D=A // 17112
@CALL // 17113
0;JMP // 17114
(Output.printChar.ret.5)

////PopInstruction{address=temp 0}
@SP // 17115
AM=M-1 // 17116
D=M // 17117
@5 // 17118
M=D // 17119

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 17120
0;JMP // 17121

////LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)

////PushInstruction("static 1")
@Output.1 // 17122
D=M // 17123
@SP // 17124
AM=M+1 // 17125
A=A-1 // 17126
M=D // 17127

////PushInstruction("constant 1")
@SP // 17128
AM=M+1 // 17129
A=A-1 // 17130
M=1 // 17131

////ArithmeticInstruction{ADD}
@SP // 17132
AM=M-1 // 17133
D=M // 17134
A=A-1 // 17135
M=D+M // 17136

////PopInstruction{address=Output.1}
@SP // 17137
AM=M-1 // 17138
D=M // 17139
@Output.1 // 17140
M=D // 17141

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 17142
AM=M+1 // 17143
A=A-1 // 17144
M=0 // 17145

////ReturnInstruction{}
@RETURN // 17146
0;JMP // 17147

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 17148
AM=M+1 // 17149
A=A-1 // 17150
M=0 // 17151

////PushInstruction("constant 0")
@SP // 17152
AM=M+1 // 17153
A=A-1 // 17154
M=0 // 17155

////PopInstruction{address=local 0}
@SP // 17156
AM=M-1 // 17157
D=M // 17158
@LCL // 17159
A=M // 17160
M=D // 17161

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////PushInstruction("local 0")
@LCL // 17162
A=M // 17163
D=M // 17164
@SP // 17165
AM=M+1 // 17166
A=A-1 // 17167
M=D // 17168

////PushInstruction("argument 0")
@ARG // 17169
A=M // 17170
D=M // 17171
@SP // 17172
AM=M+1 // 17173
A=A-1 // 17174
M=D // 17175

////CallInstruction{calleeFunction='String.length', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=0, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.length
@6 // 17176
D=A // 17177
@14 // 17178
M=D // 17179
@String.length // 17180
D=A // 17181
@13 // 17182
M=D // 17183
@Output.printString.ret.0 // 17184
D=A // 17185
@CALL // 17186
0;JMP // 17187
(Output.printString.ret.0)

////ArithmeticInstruction{LT}
@COMPARE_Output.printString_lt9 // 17188
D=A // 17189
@13 // 17190
M=D // 17191
@SP // 17192
AM=M-1 // 17193
D=M // 17194
A=A-1 // 17195
D=M-D // 17196
@DO_LT // 17197
0;JMP // 17198
(COMPARE_Output.printString_lt9)
@SP // 17199
A=M-1 // 17200
M=D // 17201

////PushInstruction("constant 0")
@SP // 17202
AM=M+1 // 17203
A=A-1 // 17204
M=0 // 17205

////ArithmeticInstruction{EQ}
@COMPARE_Output.printString_eq10 // 17206
D=A // 17207
@13 // 17208
M=D // 17209
@SP // 17210
AM=M-1 // 17211
D=M // 17212
A=A-1 // 17213
D=M-D // 17214
@DO_EQ // 17215
0;JMP // 17216
(COMPARE_Output.printString_eq10)
@SP // 17217
A=M-1 // 17218
M=D // 17219

////IfGotoInstruction{label='WHILE_END_Output.printString1}
// if-goto WHILE_END_Output.printString1
@SP // 17220
AM=M-1 // 17221
D=M // 17222
@WHILE_END_Output.printString1 // 17223
D;JNE // 17224

////PushInstruction("argument 0")
@ARG // 17225
A=M // 17226
D=M // 17227
@SP // 17228
AM=M+1 // 17229
A=A-1 // 17230
M=D // 17231

////PushInstruction("local 0")
@LCL // 17232
A=M // 17233
D=M // 17234
@SP // 17235
AM=M+1 // 17236
A=A-1 // 17237
M=D // 17238

////CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=1, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.charAt
@7 // 17239
D=A // 17240
@14 // 17241
M=D // 17242
@String.charAt // 17243
D=A // 17244
@13 // 17245
M=D // 17246
@Output.printString.ret.1 // 17247
D=A // 17248
@CALL // 17249
0;JMP // 17250
(Output.printString.ret.1)

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call Output.printChar
@6 // 17251
D=A // 17252
@14 // 17253
M=D // 17254
@Output.printChar // 17255
D=A // 17256
@13 // 17257
M=D // 17258
@Output.printString.ret.2 // 17259
D=A // 17260
@CALL // 17261
0;JMP // 17262
(Output.printString.ret.2)

////PopInstruction{address=temp 0}
@SP // 17263
AM=M-1 // 17264
D=M // 17265
@5 // 17266
M=D // 17267

////PushInstruction("local 0")
@LCL // 17268
A=M // 17269
D=M // 17270
@SP // 17271
AM=M+1 // 17272
A=A-1 // 17273
M=D // 17274

////PushInstruction("constant 1")
@SP // 17275
AM=M+1 // 17276
A=A-1 // 17277
M=1 // 17278

////ArithmeticInstruction{ADD}
@SP // 17279
AM=M-1 // 17280
D=M // 17281
A=A-1 // 17282
M=D+M // 17283

////PopInstruction{address=local 0}
@SP // 17284
AM=M-1 // 17285
D=M // 17286
@LCL // 17287
A=M // 17288
M=D // 17289

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 17290
0;JMP // 17291

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 17292
AM=M+1 // 17293
A=A-1 // 17294
M=0 // 17295

////ReturnInstruction{}
@RETURN // 17296
0;JMP // 17297

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 17298
AM=M+1 // 17299
A=A-1 // 17300
M=0 // 17301

////PushInstruction("constant 10")
@10 // 17302
D=A // 17303
@SP // 17304
AM=M+1 // 17305
A=A-1 // 17306
M=D // 17307

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.new
@6 // 17308
D=A // 17309
@14 // 17310
M=D // 17311
@String.new // 17312
D=A // 17313
@13 // 17314
M=D // 17315
@Output.printInt.ret.0 // 17316
D=A // 17317
@CALL // 17318
0;JMP // 17319
(Output.printInt.ret.0)

////PopInstruction{address=local 0}
@SP // 17320
AM=M-1 // 17321
D=M // 17322
@LCL // 17323
A=M // 17324
M=D // 17325

////PushInstruction("local 0")
@LCL // 17326
A=M // 17327
D=M // 17328
@SP // 17329
AM=M+1 // 17330
A=A-1 // 17331
M=D // 17332

////PushInstruction("argument 0")
@ARG // 17333
A=M // 17334
D=M // 17335
@SP // 17336
AM=M+1 // 17337
A=A-1 // 17338
M=D // 17339

////CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=1, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.setInt
@7 // 17340
D=A // 17341
@14 // 17342
M=D // 17343
@String.setInt // 17344
D=A // 17345
@13 // 17346
M=D // 17347
@Output.printInt.ret.1 // 17348
D=A // 17349
@CALL // 17350
0;JMP // 17351
(Output.printInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 17352
AM=M-1 // 17353
D=M // 17354
@5 // 17355
M=D // 17356

////PushInstruction("local 0")
@LCL // 17357
A=M // 17358
D=M // 17359
@SP // 17360
AM=M+1 // 17361
A=A-1 // 17362
M=D // 17363

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=2, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call Output.printString
@6 // 17364
D=A // 17365
@14 // 17366
M=D // 17367
@Output.printString // 17368
D=A // 17369
@13 // 17370
M=D // 17371
@Output.printInt.ret.2 // 17372
D=A // 17373
@CALL // 17374
0;JMP // 17375
(Output.printInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 17376
AM=M-1 // 17377
D=M // 17378
@5 // 17379
M=D // 17380

////PushInstruction("local 0")
@LCL // 17381
A=M // 17382
D=M // 17383
@SP // 17384
AM=M+1 // 17385
A=A-1 // 17386
M=D // 17387

////CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=3, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.dispose
@6 // 17388
D=A // 17389
@14 // 17390
M=D // 17391
@String.dispose // 17392
D=A // 17393
@13 // 17394
M=D // 17395
@Output.printInt.ret.3 // 17396
D=A // 17397
@CALL // 17398
0;JMP // 17399
(Output.printInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 17400
AM=M-1 // 17401
D=M // 17402
@5 // 17403
M=D // 17404

////PushInstruction("constant 0")
@SP // 17405
AM=M+1 // 17406
A=A-1 // 17407
M=0 // 17408

////ReturnInstruction{}
@RETURN // 17409
0;JMP // 17410

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushInstruction("constant 0")
@SP // 17411
AM=M+1 // 17412
A=A-1 // 17413
M=0 // 17414

////PopInstruction{address=Output.1}
@SP // 17415
AM=M-1 // 17416
D=M // 17417
@Output.1 // 17418
M=D // 17419

////PushInstruction("static 2")
@Output.2 // 17420
D=M // 17421
@SP // 17422
AM=M+1 // 17423
A=A-1 // 17424
M=D // 17425

////PushInstruction("constant 22")
@22 // 17426
D=A // 17427
@SP // 17428
AM=M+1 // 17429
A=A-1 // 17430
M=D // 17431

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq11 // 17432
D=A // 17433
@13 // 17434
M=D // 17435
@SP // 17436
AM=M-1 // 17437
D=M // 17438
A=A-1 // 17439
D=M-D // 17440
@DO_EQ // 17441
0;JMP // 17442
(COMPARE_Output.println_eq11)
@SP // 17443
A=M-1 // 17444
M=D // 17445

////PushInstruction("constant 0")
@SP // 17446
AM=M+1 // 17447
A=A-1 // 17448
M=0 // 17449

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq12 // 17450
D=A // 17451
@13 // 17452
M=D // 17453
@SP // 17454
AM=M-1 // 17455
D=M // 17456
A=A-1 // 17457
D=M-D // 17458
@DO_EQ // 17459
0;JMP // 17460
(COMPARE_Output.println_eq12)
@SP // 17461
A=M-1 // 17462
M=D // 17463

////IfGotoInstruction{label='Output.println.IfElse1}
// if-goto Output.println.IfElse1
@SP // 17464
AM=M-1 // 17465
D=M // 17466
@Output.println.IfElse1 // 17467
D;JNE // 17468

////PushInstruction("constant 0")
@SP // 17469
AM=M+1 // 17470
A=A-1 // 17471
M=0 // 17472

////PopInstruction{address=Output.2}
@SP // 17473
AM=M-1 // 17474
D=M // 17475
@Output.2 // 17476
M=D // 17477

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 17478
0;JMP // 17479

////LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)

////PushInstruction("static 2")
@Output.2 // 17480
D=M // 17481
@SP // 17482
AM=M+1 // 17483
A=A-1 // 17484
M=D // 17485

////PushInstruction("constant 1")
@SP // 17486
AM=M+1 // 17487
A=A-1 // 17488
M=1 // 17489

////ArithmeticInstruction{ADD}
@SP // 17490
AM=M-1 // 17491
D=M // 17492
A=A-1 // 17493
M=D+M // 17494

////PopInstruction{address=Output.2}
@SP // 17495
AM=M-1 // 17496
D=M // 17497
@Output.2 // 17498
M=D // 17499

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17500
AM=M+1 // 17501
A=A-1 // 17502
M=0 // 17503

////ReturnInstruction{}
@RETURN // 17504
0;JMP // 17505

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////PushInstruction("static 1")
@Output.1 // 17506
D=M // 17507
@SP // 17508
AM=M+1 // 17509
A=A-1 // 17510
M=D // 17511

////PushInstruction("constant 0")
@SP // 17512
AM=M+1 // 17513
A=A-1 // 17514
M=0 // 17515

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq13 // 17516
D=A // 17517
@13 // 17518
M=D // 17519
@SP // 17520
AM=M-1 // 17521
D=M // 17522
A=A-1 // 17523
D=M-D // 17524
@DO_EQ // 17525
0;JMP // 17526
(COMPARE_Output.backSpace_eq13)
@SP // 17527
A=M-1 // 17528
M=D // 17529

////PushInstruction("constant 0")
@SP // 17530
AM=M+1 // 17531
A=A-1 // 17532
M=0 // 17533

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq14 // 17534
D=A // 17535
@13 // 17536
M=D // 17537
@SP // 17538
AM=M-1 // 17539
D=M // 17540
A=A-1 // 17541
D=M-D // 17542
@DO_EQ // 17543
0;JMP // 17544
(COMPARE_Output.backSpace_eq14)
@SP // 17545
A=M-1 // 17546
M=D // 17547

////IfGotoInstruction{label='Output.backSpace.IfElse1}
// if-goto Output.backSpace.IfElse1
@SP // 17548
AM=M-1 // 17549
D=M // 17550
@Output.backSpace.IfElse1 // 17551
D;JNE // 17552

////PushInstruction("static 2")
@Output.2 // 17553
D=M // 17554
@SP // 17555
AM=M+1 // 17556
A=A-1 // 17557
M=D // 17558

////PushInstruction("constant 1")
@SP // 17559
AM=M+1 // 17560
A=A-1 // 17561
M=1 // 17562

////ArithmeticInstruction{SUB}
@SP // 17563
AM=M-1 // 17564
D=M // 17565
A=A-1 // 17566
M=M-D // 17567

////PopInstruction{address=Output.2}
@SP // 17568
AM=M-1 // 17569
D=M // 17570
@Output.2 // 17571
M=D // 17572

////PushInstruction("constant 63")
@63 // 17573
D=A // 17574
@SP // 17575
AM=M+1 // 17576
A=A-1 // 17577
M=D // 17578

////PopInstruction{address=Output.1}
@SP // 17579
AM=M-1 // 17580
D=M // 17581
@Output.1 // 17582
M=D // 17583

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 17584
0;JMP // 17585

////LabelInstruction{label='Output.backSpace.IfElse1}
// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)

////PushInstruction("static 1")
@Output.1 // 17586
D=M // 17587
@SP // 17588
AM=M+1 // 17589
A=A-1 // 17590
M=D // 17591

////PushInstruction("constant 1")
@SP // 17592
AM=M+1 // 17593
A=A-1 // 17594
M=1 // 17595

////ArithmeticInstruction{SUB}
@SP // 17596
AM=M-1 // 17597
D=M // 17598
A=A-1 // 17599
M=M-D // 17600

////PopInstruction{address=Output.1}
@SP // 17601
AM=M-1 // 17602
D=M // 17603
@Output.1 // 17604
M=D // 17605

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17606
AM=M+1 // 17607
A=A-1 // 17608
M=0 // 17609

////ReturnInstruction{}
@RETURN // 17610
0;JMP // 17611

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////PushInstruction("constant 0")
@SP // 17612
AM=M+1 // 17613
A=A-1 // 17614
M=0 // 17615

////PushInstruction("constant 220")
@220 // 17616
D=A // 17617
@SP // 17618
AM=M+1 // 17619
A=A-1 // 17620
M=D // 17621

////PushInstruction("constant 511")
@511 // 17622
D=A // 17623
@SP // 17624
AM=M+1 // 17625
A=A-1 // 17626
M=D // 17627

////PushInstruction("constant 220")
@220 // 17628
D=A // 17629
@SP // 17630
AM=M+1 // 17631
A=A-1 // 17632
M=D // 17633

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17634
D=A // 17635
@14 // 17636
M=D // 17637
@Screen.drawLine // 17638
D=A // 17639
@13 // 17640
M=D // 17641
@Main.main.ret.0 // 17642
D=A // 17643
@CALL // 17644
0;JMP // 17645
(Main.main.ret.0)

////PopInstruction{address=temp 0}
@SP // 17646
AM=M-1 // 17647
D=M // 17648
@5 // 17649
M=D // 17650

////PushInstruction("constant 280")
@280 // 17651
D=A // 17652
@SP // 17653
AM=M+1 // 17654
A=A-1 // 17655
M=D // 17656

////PushInstruction("constant 90")
@90 // 17657
D=A // 17658
@SP // 17659
AM=M+1 // 17660
A=A-1 // 17661
M=D // 17662

////PushInstruction("constant 410")
@410 // 17663
D=A // 17664
@SP // 17665
AM=M+1 // 17666
A=A-1 // 17667
M=D // 17668

////PushInstruction("constant 220")
@220 // 17669
D=A // 17670
@SP // 17671
AM=M+1 // 17672
A=A-1 // 17673
M=D // 17674

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=1}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17675
D=A // 17676
@14 // 17677
M=D // 17678
@Screen.drawRectangle // 17679
D=A // 17680
@13 // 17681
M=D // 17682
@Main.main.ret.1 // 17683
D=A // 17684
@CALL // 17685
0;JMP // 17686
(Main.main.ret.1)

////PopInstruction{address=temp 0}
@SP // 17687
AM=M-1 // 17688
D=M // 17689
@5 // 17690
M=D // 17691

////PushInstruction("constant 0")
@SP // 17692
AM=M+1 // 17693
A=A-1 // 17694
M=0 // 17695

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=2}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 17696
D=A // 17697
@14 // 17698
M=D // 17699
@Screen.setColor // 17700
D=A // 17701
@13 // 17702
M=D // 17703
@Main.main.ret.2 // 17704
D=A // 17705
@CALL // 17706
0;JMP // 17707
(Main.main.ret.2)

////PopInstruction{address=temp 0}
@SP // 17708
AM=M-1 // 17709
D=M // 17710
@5 // 17711
M=D // 17712

////PushInstruction("constant 350")
@350 // 17713
D=A // 17714
@SP // 17715
AM=M+1 // 17716
A=A-1 // 17717
M=D // 17718

////PushInstruction("constant 120")
@120 // 17719
D=A // 17720
@SP // 17721
AM=M+1 // 17722
A=A-1 // 17723
M=D // 17724

////PushInstruction("constant 390")
@390 // 17725
D=A // 17726
@SP // 17727
AM=M+1 // 17728
A=A-1 // 17729
M=D // 17730

////PushInstruction("constant 219")
@219 // 17731
D=A // 17732
@SP // 17733
AM=M+1 // 17734
A=A-1 // 17735
M=D // 17736

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=3}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17737
D=A // 17738
@14 // 17739
M=D // 17740
@Screen.drawRectangle // 17741
D=A // 17742
@13 // 17743
M=D // 17744
@Main.main.ret.3 // 17745
D=A // 17746
@CALL // 17747
0;JMP // 17748
(Main.main.ret.3)

////PopInstruction{address=temp 0}
@SP // 17749
AM=M-1 // 17750
D=M // 17751
@5 // 17752
M=D // 17753

////PushInstruction("constant 292")
@292 // 17754
D=A // 17755
@SP // 17756
AM=M+1 // 17757
A=A-1 // 17758
M=D // 17759

////PushInstruction("constant 120")
@120 // 17760
D=A // 17761
@SP // 17762
AM=M+1 // 17763
A=A-1 // 17764
M=D // 17765

////PushInstruction("constant 332")
@332 // 17766
D=A // 17767
@SP // 17768
AM=M+1 // 17769
A=A-1 // 17770
M=D // 17771

////PushInstruction("constant 150")
@150 // 17772
D=A // 17773
@SP // 17774
AM=M+1 // 17775
A=A-1 // 17776
M=D // 17777

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=4}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17778
D=A // 17779
@14 // 17780
M=D // 17781
@Screen.drawRectangle // 17782
D=A // 17783
@13 // 17784
M=D // 17785
@Main.main.ret.4 // 17786
D=A // 17787
@CALL // 17788
0;JMP // 17789
(Main.main.ret.4)

////PopInstruction{address=temp 0}
@SP // 17790
AM=M-1 // 17791
D=M // 17792
@5 // 17793
M=D // 17794

////PushInstruction("constant 0")
@SP // 17795
AM=M+1 // 17796
A=A-1 // 17797
M=0 // 17798

////ArithmeticInstruction{NOT}
@SP // 17799
A=M-1 // 17800
M=!M // 17801

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=5}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 17802
D=A // 17803
@14 // 17804
M=D // 17805
@Screen.setColor // 17806
D=A // 17807
@13 // 17808
M=D // 17809
@Main.main.ret.5 // 17810
D=A // 17811
@CALL // 17812
0;JMP // 17813
(Main.main.ret.5)

////PopInstruction{address=temp 0}
@SP // 17814
AM=M-1 // 17815
D=M // 17816
@5 // 17817
M=D // 17818

////PushInstruction("constant 360")
@360 // 17819
D=A // 17820
@SP // 17821
AM=M+1 // 17822
A=A-1 // 17823
M=D // 17824

////PushInstruction("constant 170")
@170 // 17825
D=A // 17826
@SP // 17827
AM=M+1 // 17828
A=A-1 // 17829
M=D // 17830

////PushInstruction("constant 3")
@3 // 17831
D=A // 17832
@SP // 17833
AM=M+1 // 17834
A=A-1 // 17835
M=D // 17836

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=6}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 17837
D=A // 17838
@14 // 17839
M=D // 17840
@Screen.drawCircle // 17841
D=A // 17842
@13 // 17843
M=D // 17844
@Main.main.ret.6 // 17845
D=A // 17846
@CALL // 17847
0;JMP // 17848
(Main.main.ret.6)

////PopInstruction{address=temp 0}
@SP // 17849
AM=M-1 // 17850
D=M // 17851
@5 // 17852
M=D // 17853

////PushInstruction("constant 280")
@280 // 17854
D=A // 17855
@SP // 17856
AM=M+1 // 17857
A=A-1 // 17858
M=D // 17859

////PushInstruction("constant 90")
@90 // 17860
D=A // 17861
@SP // 17862
AM=M+1 // 17863
A=A-1 // 17864
M=D // 17865

////PushInstruction("constant 345")
@345 // 17866
D=A // 17867
@SP // 17868
AM=M+1 // 17869
A=A-1 // 17870
M=D // 17871

////PushInstruction("constant 35")
@35 // 17872
D=A // 17873
@SP // 17874
AM=M+1 // 17875
A=A-1 // 17876
M=D // 17877

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=7}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17878
D=A // 17879
@14 // 17880
M=D // 17881
@Screen.drawLine // 17882
D=A // 17883
@13 // 17884
M=D // 17885
@Main.main.ret.7 // 17886
D=A // 17887
@CALL // 17888
0;JMP // 17889
(Main.main.ret.7)

////PopInstruction{address=temp 0}
@SP // 17890
AM=M-1 // 17891
D=M // 17892
@5 // 17893
M=D // 17894

////PushInstruction("constant 345")
@345 // 17895
D=A // 17896
@SP // 17897
AM=M+1 // 17898
A=A-1 // 17899
M=D // 17900

////PushInstruction("constant 35")
@35 // 17901
D=A // 17902
@SP // 17903
AM=M+1 // 17904
A=A-1 // 17905
M=D // 17906

////PushInstruction("constant 410")
@410 // 17907
D=A // 17908
@SP // 17909
AM=M+1 // 17910
A=A-1 // 17911
M=D // 17912

////PushInstruction("constant 90")
@90 // 17913
D=A // 17914
@SP // 17915
AM=M+1 // 17916
A=A-1 // 17917
M=D // 17918

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=8}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17919
D=A // 17920
@14 // 17921
M=D // 17922
@Screen.drawLine // 17923
D=A // 17924
@13 // 17925
M=D // 17926
@Main.main.ret.8 // 17927
D=A // 17928
@CALL // 17929
0;JMP // 17930
(Main.main.ret.8)

////PopInstruction{address=temp 0}
@SP // 17931
AM=M-1 // 17932
D=M // 17933
@5 // 17934
M=D // 17935

////PushInstruction("constant 140")
@140 // 17936
D=A // 17937
@SP // 17938
AM=M+1 // 17939
A=A-1 // 17940
M=D // 17941

////PushInstruction("constant 60")
@60 // 17942
D=A // 17943
@SP // 17944
AM=M+1 // 17945
A=A-1 // 17946
M=D // 17947

////PushInstruction("constant 30")
@30 // 17948
D=A // 17949
@SP // 17950
AM=M+1 // 17951
A=A-1 // 17952
M=D // 17953

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=9}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 17954
D=A // 17955
@14 // 17956
M=D // 17957
@Screen.drawCircle // 17958
D=A // 17959
@13 // 17960
M=D // 17961
@Main.main.ret.9 // 17962
D=A // 17963
@CALL // 17964
0;JMP // 17965
(Main.main.ret.9)

////PopInstruction{address=temp 0}
@SP // 17966
AM=M-1 // 17967
D=M // 17968
@5 // 17969
M=D // 17970

////PushInstruction("constant 140")
@140 // 17971
D=A // 17972
@SP // 17973
AM=M+1 // 17974
A=A-1 // 17975
M=D // 17976

////PushInstruction("constant 26")
@26 // 17977
D=A // 17978
@SP // 17979
AM=M+1 // 17980
A=A-1 // 17981
M=D // 17982

////PushInstruction("constant 140")
@140 // 17983
D=A // 17984
@SP // 17985
AM=M+1 // 17986
A=A-1 // 17987
M=D // 17988

////PushInstruction("constant 6")
@6 // 17989
D=A // 17990
@SP // 17991
AM=M+1 // 17992
A=A-1 // 17993
M=D // 17994

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=10}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17995
D=A // 17996
@14 // 17997
M=D // 17998
@Screen.drawLine // 17999
D=A // 18000
@13 // 18001
M=D // 18002
@Main.main.ret.10 // 18003
D=A // 18004
@CALL // 18005
0;JMP // 18006
(Main.main.ret.10)

////PopInstruction{address=temp 0}
@SP // 18007
AM=M-1 // 18008
D=M // 18009
@5 // 18010
M=D // 18011

////PushInstruction("constant 163")
@163 // 18012
D=A // 18013
@SP // 18014
AM=M+1 // 18015
A=A-1 // 18016
M=D // 18017

////PushInstruction("constant 35")
@35 // 18018
D=A // 18019
@SP // 18020
AM=M+1 // 18021
A=A-1 // 18022
M=D // 18023

////PushInstruction("constant 178")
@178 // 18024
D=A // 18025
@SP // 18026
AM=M+1 // 18027
A=A-1 // 18028
M=D // 18029

////PushInstruction("constant 20")
@20 // 18030
D=A // 18031
@SP // 18032
AM=M+1 // 18033
A=A-1 // 18034
M=D // 18035

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=11}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18036
D=A // 18037
@14 // 18038
M=D // 18039
@Screen.drawLine // 18040
D=A // 18041
@13 // 18042
M=D // 18043
@Main.main.ret.11 // 18044
D=A // 18045
@CALL // 18046
0;JMP // 18047
(Main.main.ret.11)

////PopInstruction{address=temp 0}
@SP // 18048
AM=M-1 // 18049
D=M // 18050
@5 // 18051
M=D // 18052

////PushInstruction("constant 174")
@174 // 18053
D=A // 18054
@SP // 18055
AM=M+1 // 18056
A=A-1 // 18057
M=D // 18058

////PushInstruction("constant 60")
@60 // 18059
D=A // 18060
@SP // 18061
AM=M+1 // 18062
A=A-1 // 18063
M=D // 18064

////PushInstruction("constant 194")
@194 // 18065
D=A // 18066
@SP // 18067
AM=M+1 // 18068
A=A-1 // 18069
M=D // 18070

////PushInstruction("constant 60")
@60 // 18071
D=A // 18072
@SP // 18073
AM=M+1 // 18074
A=A-1 // 18075
M=D // 18076

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=12}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18077
D=A // 18078
@14 // 18079
M=D // 18080
@Screen.drawLine // 18081
D=A // 18082
@13 // 18083
M=D // 18084
@Main.main.ret.12 // 18085
D=A // 18086
@CALL // 18087
0;JMP // 18088
(Main.main.ret.12)

////PopInstruction{address=temp 0}
@SP // 18089
AM=M-1 // 18090
D=M // 18091
@5 // 18092
M=D // 18093

////PushInstruction("constant 163")
@163 // 18094
D=A // 18095
@SP // 18096
AM=M+1 // 18097
A=A-1 // 18098
M=D // 18099

////PushInstruction("constant 85")
@85 // 18100
D=A // 18101
@SP // 18102
AM=M+1 // 18103
A=A-1 // 18104
M=D // 18105

////PushInstruction("constant 178")
@178 // 18106
D=A // 18107
@SP // 18108
AM=M+1 // 18109
A=A-1 // 18110
M=D // 18111

////PushInstruction("constant 100")
@100 // 18112
D=A // 18113
@SP // 18114
AM=M+1 // 18115
A=A-1 // 18116
M=D // 18117

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=13}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18118
D=A // 18119
@14 // 18120
M=D // 18121
@Screen.drawLine // 18122
D=A // 18123
@13 // 18124
M=D // 18125
@Main.main.ret.13 // 18126
D=A // 18127
@CALL // 18128
0;JMP // 18129
(Main.main.ret.13)

////PopInstruction{address=temp 0}
@SP // 18130
AM=M-1 // 18131
D=M // 18132
@5 // 18133
M=D // 18134

////PushInstruction("constant 140")
@140 // 18135
D=A // 18136
@SP // 18137
AM=M+1 // 18138
A=A-1 // 18139
M=D // 18140

////PushInstruction("constant 94")
@94 // 18141
D=A // 18142
@SP // 18143
AM=M+1 // 18144
A=A-1 // 18145
M=D // 18146

////PushInstruction("constant 140")
@140 // 18147
D=A // 18148
@SP // 18149
AM=M+1 // 18150
A=A-1 // 18151
M=D // 18152

////PushInstruction("constant 114")
@114 // 18153
D=A // 18154
@SP // 18155
AM=M+1 // 18156
A=A-1 // 18157
M=D // 18158

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=14}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18159
D=A // 18160
@14 // 18161
M=D // 18162
@Screen.drawLine // 18163
D=A // 18164
@13 // 18165
M=D // 18166
@Main.main.ret.14 // 18167
D=A // 18168
@CALL // 18169
0;JMP // 18170
(Main.main.ret.14)

////PopInstruction{address=temp 0}
@SP // 18171
AM=M-1 // 18172
D=M // 18173
@5 // 18174
M=D // 18175

////PushInstruction("constant 117")
@117 // 18176
D=A // 18177
@SP // 18178
AM=M+1 // 18179
A=A-1 // 18180
M=D // 18181

////PushInstruction("constant 85")
@85 // 18182
D=A // 18183
@SP // 18184
AM=M+1 // 18185
A=A-1 // 18186
M=D // 18187

////PushInstruction("constant 102")
@102 // 18188
D=A // 18189
@SP // 18190
AM=M+1 // 18191
A=A-1 // 18192
M=D // 18193

////PushInstruction("constant 100")
@100 // 18194
D=A // 18195
@SP // 18196
AM=M+1 // 18197
A=A-1 // 18198
M=D // 18199

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=15}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18200
D=A // 18201
@14 // 18202
M=D // 18203
@Screen.drawLine // 18204
D=A // 18205
@13 // 18206
M=D // 18207
@Main.main.ret.15 // 18208
D=A // 18209
@CALL // 18210
0;JMP // 18211
(Main.main.ret.15)

////PopInstruction{address=temp 0}
@SP // 18212
AM=M-1 // 18213
D=M // 18214
@5 // 18215
M=D // 18216

////PushInstruction("constant 106")
@106 // 18217
D=A // 18218
@SP // 18219
AM=M+1 // 18220
A=A-1 // 18221
M=D // 18222

////PushInstruction("constant 60")
@60 // 18223
D=A // 18224
@SP // 18225
AM=M+1 // 18226
A=A-1 // 18227
M=D // 18228

////PushInstruction("constant 86")
@86 // 18229
D=A // 18230
@SP // 18231
AM=M+1 // 18232
A=A-1 // 18233
M=D // 18234

////PushInstruction("constant 60")
@60 // 18235
D=A // 18236
@SP // 18237
AM=M+1 // 18238
A=A-1 // 18239
M=D // 18240

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=16}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18241
D=A // 18242
@14 // 18243
M=D // 18244
@Screen.drawLine // 18245
D=A // 18246
@13 // 18247
M=D // 18248
@Main.main.ret.16 // 18249
D=A // 18250
@CALL // 18251
0;JMP // 18252
(Main.main.ret.16)

////PopInstruction{address=temp 0}
@SP // 18253
AM=M-1 // 18254
D=M // 18255
@5 // 18256
M=D // 18257

////PushInstruction("constant 117")
@117 // 18258
D=A // 18259
@SP // 18260
AM=M+1 // 18261
A=A-1 // 18262
M=D // 18263

////PushInstruction("constant 35")
@35 // 18264
D=A // 18265
@SP // 18266
AM=M+1 // 18267
A=A-1 // 18268
M=D // 18269

////PushInstruction("constant 102")
@102 // 18270
D=A // 18271
@SP // 18272
AM=M+1 // 18273
A=A-1 // 18274
M=D // 18275

////PushInstruction("constant 20")
@20 // 18276
D=A // 18277
@SP // 18278
AM=M+1 // 18279
A=A-1 // 18280
M=D // 18281

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=17}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18282
D=A // 18283
@14 // 18284
M=D // 18285
@Screen.drawLine // 18286
D=A // 18287
@13 // 18288
M=D // 18289
@Main.main.ret.17 // 18290
D=A // 18291
@CALL // 18292
0;JMP // 18293
(Main.main.ret.17)

////PopInstruction{address=temp 0}
@SP // 18294
AM=M-1 // 18295
D=M // 18296
@5 // 18297
M=D // 18298

////PushInstruction("constant 0")
@SP // 18299
AM=M+1 // 18300
A=A-1 // 18301
M=0 // 18302

////ReturnInstruction{}
@RETURN // 18303
0;JMP // 18304

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 18305
AM=M+1 // 18306
A=A-1 // 18307
M=0 // 18308
@SP // 18309
AM=M+1 // 18310
A=A-1 // 18311
M=0 // 18312

////PushInstruction("constant 2048")
@2048 // 18313
D=A // 18314
@SP // 18315
AM=M+1 // 18316
A=A-1 // 18317
M=D // 18318

////PushInstruction("constant 7")
@7 // 18319
D=A // 18320
@SP // 18321
AM=M+1 // 18322
A=A-1 // 18323
M=D // 18324

////ArithmeticInstruction{ADD}
@SP // 18325
AM=M-1 // 18326
D=M // 18327
A=A-1 // 18328
M=D+M // 18329

////PopInstruction{address=local 0}
@SP // 18330
AM=M-1 // 18331
D=M // 18332
@LCL // 18333
A=M // 18334
M=D // 18335

////PushInstruction("constant 16384")
@16384 // 18336
D=A // 18337
@SP // 18338
AM=M+1 // 18339
A=A-1 // 18340
M=D // 18341

////PushInstruction("local 0")
@LCL // 18342
A=M // 18343
D=M // 18344
@SP // 18345
AM=M+1 // 18346
A=A-1 // 18347
M=D // 18348

////ArithmeticInstruction{SUB}
@SP // 18349
AM=M-1 // 18350
D=M // 18351
A=A-1 // 18352
M=M-D // 18353

////PushInstruction("constant 5")
@5 // 18354
D=A // 18355
@SP // 18356
AM=M+1 // 18357
A=A-1 // 18358
M=D // 18359

////ArithmeticInstruction{SUB}
@SP // 18360
AM=M-1 // 18361
D=M // 18362
A=A-1 // 18363
M=M-D // 18364

////PushInstruction("local 0")
@LCL // 18365
A=M // 18366
D=M // 18367
@SP // 18368
AM=M+1 // 18369
A=A-1 // 18370
M=D // 18371

////PushInstruction("constant 0")
@SP // 18372
AM=M+1 // 18373
A=A-1 // 18374
M=0 // 18375

////ArithmeticInstruction{ADD}
@SP // 18376
AM=M-1 // 18377
D=M // 18378
A=A-1 // 18379
M=D+M // 18380

////PopInstruction{address=pointer 1}
@SP // 18381
AM=M-1 // 18382
D=M // 18383
@4 // 18384
M=D // 18385

////PopInstruction{address=that 0}
@SP // 18386
AM=M-1 // 18387
D=M // 18388
@THAT // 18389
A=M // 18390
M=D // 18391

////PushInstruction("constant 1")
@SP // 18392
AM=M+1 // 18393
A=A-1 // 18394
M=1 // 18395

////PushInstruction("local 0")
@LCL // 18396
A=M // 18397
D=M // 18398
@SP // 18399
AM=M+1 // 18400
A=A-1 // 18401
M=D // 18402

////PushInstruction("constant 1")
@SP // 18403
AM=M+1 // 18404
A=A-1 // 18405
M=1 // 18406

////ArithmeticInstruction{ADD}
@SP // 18407
AM=M-1 // 18408
D=M // 18409
A=A-1 // 18410
M=D+M // 18411

////PopInstruction{address=pointer 1}
@SP // 18412
AM=M-1 // 18413
D=M // 18414
@4 // 18415
M=D // 18416

////PopInstruction{address=that 0}
@SP // 18417
AM=M-1 // 18418
D=M // 18419
@THAT // 18420
A=M // 18421
M=D // 18422

////PushInstruction("constant 0")
@SP // 18423
AM=M+1 // 18424
A=A-1 // 18425
M=0 // 18426

////PushInstruction("local 0")
@LCL // 18427
A=M // 18428
D=M // 18429
@SP // 18430
AM=M+1 // 18431
A=A-1 // 18432
M=D // 18433

////PushInstruction("constant 2")
@2 // 18434
D=A // 18435
@SP // 18436
AM=M+1 // 18437
A=A-1 // 18438
M=D // 18439

////ArithmeticInstruction{ADD}
@SP // 18440
AM=M-1 // 18441
D=M // 18442
A=A-1 // 18443
M=D+M // 18444

////PopInstruction{address=pointer 1}
@SP // 18445
AM=M-1 // 18446
D=M // 18447
@4 // 18448
M=D // 18449

////PopInstruction{address=that 0}
@SP // 18450
AM=M-1 // 18451
D=M // 18452
@THAT // 18453
A=M // 18454
M=D // 18455

////PushInstruction("constant 0")
@SP // 18456
AM=M+1 // 18457
A=A-1 // 18458
M=0 // 18459

////PushInstruction("local 0")
@LCL // 18460
A=M // 18461
D=M // 18462
@SP // 18463
AM=M+1 // 18464
A=A-1 // 18465
M=D // 18466

////PushInstruction("constant 3")
@3 // 18467
D=A // 18468
@SP // 18469
AM=M+1 // 18470
A=A-1 // 18471
M=D // 18472

////ArithmeticInstruction{ADD}
@SP // 18473
AM=M-1 // 18474
D=M // 18475
A=A-1 // 18476
M=D+M // 18477

////PopInstruction{address=pointer 1}
@SP // 18478
AM=M-1 // 18479
D=M // 18480
@4 // 18481
M=D // 18482

////PopInstruction{address=that 0}
@SP // 18483
AM=M-1 // 18484
D=M // 18485
@THAT // 18486
A=M // 18487
M=D // 18488

////PushInstruction("local 0")
@LCL // 18489
A=M // 18490
D=M // 18491
@SP // 18492
AM=M+1 // 18493
A=A-1 // 18494
M=D // 18495

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}
// call Memory.create_foot
@6 // 18496
D=A // 18497
@14 // 18498
M=D // 18499
@Memory.create_foot // 18500
D=A // 18501
@13 // 18502
M=D // 18503
@Memory.init.ret.0 // 18504
D=A // 18505
@CALL // 18506
0;JMP // 18507
(Memory.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 18508
AM=M-1 // 18509
D=M // 18510
@5 // 18511
M=D // 18512

////PushInstruction("constant 2048")
@2048 // 18513
D=A // 18514
@SP // 18515
AM=M+1 // 18516
A=A-1 // 18517
M=D // 18518

////PushInstruction("constant 6")
@6 // 18519
D=A // 18520
@SP // 18521
AM=M+1 // 18522
A=A-1 // 18523
M=D // 18524

////ArithmeticInstruction{ADD}
@SP // 18525
AM=M-1 // 18526
D=M // 18527
A=A-1 // 18528
M=D+M // 18529

////PushInstruction("local 0")
@LCL // 18530
A=M // 18531
D=M // 18532
@SP // 18533
AM=M+1 // 18534
A=A-1 // 18535
M=D // 18536

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}
// call Memory.add_node
@7 // 18537
D=A // 18538
@14 // 18539
M=D // 18540
@Memory.add_node // 18541
D=A // 18542
@13 // 18543
M=D // 18544
@Memory.init.ret.1 // 18545
D=A // 18546
@CALL // 18547
0;JMP // 18548
(Memory.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 18549
AM=M-1 // 18550
D=M // 18551
@5 // 18552
M=D // 18553

////PushInstruction("constant 0")
@SP // 18554
AM=M+1 // 18555
A=A-1 // 18556
M=0 // 18557

////ReturnInstruction{}
@RETURN // 18558
0;JMP // 18559

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 18560
AM=M+1 // 18561
A=A-1 // 18562
M=0 // 18563
@SP // 18564
AM=M+1 // 18565
A=A-1 // 18566
M=0 // 18567
@SP // 18568
AM=M+1 // 18569
A=A-1 // 18570
M=0 // 18571
@SP // 18572
AM=M+1 // 18573
A=A-1 // 18574
M=0 // 18575
@SP // 18576
AM=M+1 // 18577
A=A-1 // 18578
M=0 // 18579

////PushInstruction("argument 0")
@ARG // 18580
A=M // 18581
D=M // 18582
@SP // 18583
AM=M+1 // 18584
A=A-1 // 18585
M=D // 18586

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 18587
D=A // 18588
@14 // 18589
M=D // 18590
@Memory.getBinIndex // 18591
D=A // 18592
@13 // 18593
M=D // 18594
@Memory.alloc.ret.0 // 18595
D=A // 18596
@CALL // 18597
0;JMP // 18598
(Memory.alloc.ret.0)

////PopInstruction{address=local 0}
@SP // 18599
AM=M-1 // 18600
D=M // 18601
@LCL // 18602
A=M // 18603
M=D // 18604

////PushInstruction("constant 2048")
@2048 // 18605
D=A // 18606
@SP // 18607
AM=M+1 // 18608
A=A-1 // 18609
M=D // 18610

////PushInstruction("local 0")
@LCL // 18611
A=M // 18612
D=M // 18613
@SP // 18614
AM=M+1 // 18615
A=A-1 // 18616
M=D // 18617

////ArithmeticInstruction{ADD}
@SP // 18618
AM=M-1 // 18619
D=M // 18620
A=A-1 // 18621
M=D+M // 18622

////PopInstruction{address=local 1}
@SP // 18623
AM=M-1 // 18624
D=M // 18625
@LCL // 18626
A=M+1 // 18627
M=D // 18628

////PushInstruction("local 1")
@LCL // 18629
A=M+1 // 18630
D=M // 18631
@SP // 18632
AM=M+1 // 18633
A=A-1 // 18634
M=D // 18635

////PushInstruction("argument 0")
@ARG // 18636
A=M // 18637
D=M // 18638
@SP // 18639
AM=M+1 // 18640
A=A-1 // 18641
M=D // 18642

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 18643
D=A // 18644
@14 // 18645
M=D // 18646
@Memory.get_best_fit // 18647
D=A // 18648
@13 // 18649
M=D // 18650
@Memory.alloc.ret.1 // 18651
D=A // 18652
@CALL // 18653
0;JMP // 18654
(Memory.alloc.ret.1)

////PopInstruction{address=local 2}
@SP // 18655
AM=M-1 // 18656
D=M // 18657
@LCL // 18658
A=M+1 // 18659
A=A+1 // 18660
M=D // 18661

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

////PushInstruction("local 2")
@LCL // 18662
A=M+1 // 18663
A=A+1 // 18664
D=M // 18665
@SP // 18666
AM=M+1 // 18667
A=A-1 // 18668
M=D // 18669

////PushInstruction("constant 0")
@SP // 18670
AM=M+1 // 18671
A=A-1 // 18672
M=0 // 18673

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq0 // 18674
D=A // 18675
@13 // 18676
M=D // 18677
@SP // 18678
AM=M-1 // 18679
D=M // 18680
A=A-1 // 18681
D=M-D // 18682
@DO_EQ // 18683
0;JMP // 18684
(COMPARE_Memory.alloc_eq0)
@SP // 18685
A=M-1 // 18686
M=D // 18687

////PushInstruction("constant 0")
@SP // 18688
AM=M+1 // 18689
A=A-1 // 18690
M=0 // 18691

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq1 // 18692
D=A // 18693
@13 // 18694
M=D // 18695
@SP // 18696
AM=M-1 // 18697
D=M // 18698
A=A-1 // 18699
D=M-D // 18700
@DO_EQ // 18701
0;JMP // 18702
(COMPARE_Memory.alloc_eq1)
@SP // 18703
A=M-1 // 18704
M=D // 18705

////IfGotoInstruction{label='WHILE_END_Memory.alloc1}
// if-goto WHILE_END_Memory.alloc1
@SP // 18706
AM=M-1 // 18707
D=M // 18708
@WHILE_END_Memory.alloc1 // 18709
D;JNE // 18710

////PushInstruction("local 0")
@LCL // 18711
A=M // 18712
D=M // 18713
@SP // 18714
AM=M+1 // 18715
A=A-1 // 18716
M=D // 18717

////PushInstruction("constant 1")
@SP // 18718
AM=M+1 // 18719
A=A-1 // 18720
M=1 // 18721

////ArithmeticInstruction{ADD}
@SP // 18722
AM=M-1 // 18723
D=M // 18724
A=A-1 // 18725
M=D+M // 18726

////PushInstruction("constant 7")
@7 // 18727
D=A // 18728
@SP // 18729
AM=M+1 // 18730
A=A-1 // 18731
M=D // 18732

////ArithmeticInstruction{LT}
@COMPARE_Memory.alloc_lt2 // 18733
D=A // 18734
@13 // 18735
M=D // 18736
@SP // 18737
AM=M-1 // 18738
D=M // 18739
A=A-1 // 18740
D=M-D // 18741
@DO_LT // 18742
0;JMP // 18743
(COMPARE_Memory.alloc_lt2)
@SP // 18744
A=M-1 // 18745
M=D // 18746

////ArithmeticInstruction{NOT}
@SP // 18747
A=M-1 // 18748
M=!M // 18749

////PushInstruction("constant 0")
@SP // 18750
AM=M+1 // 18751
A=A-1 // 18752
M=0 // 18753

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq3 // 18754
D=A // 18755
@13 // 18756
M=D // 18757
@SP // 18758
AM=M-1 // 18759
D=M // 18760
A=A-1 // 18761
D=M-D // 18762
@DO_EQ // 18763
0;JMP // 18764
(COMPARE_Memory.alloc_eq3)
@SP // 18765
A=M-1 // 18766
M=D // 18767

////IfGotoInstruction{label='Memory.alloc.IfElse1}
// if-goto Memory.alloc.IfElse1
@SP // 18768
AM=M-1 // 18769
D=M // 18770
@Memory.alloc.IfElse1 // 18771
D;JNE // 18772

////PushInstruction("constant 0")
@SP // 18773
AM=M+1 // 18774
A=A-1 // 18775
M=0 // 18776

////ReturnInstruction{}
@RETURN // 18777
0;JMP // 18778

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 18779
0;JMP // 18780

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

////PushInstruction("local 0")
@LCL // 18781
A=M // 18782
D=M // 18783
@SP // 18784
AM=M+1 // 18785
A=A-1 // 18786
M=D // 18787

////PushInstruction("constant 1")
@SP // 18788
AM=M+1 // 18789
A=A-1 // 18790
M=1 // 18791

////ArithmeticInstruction{ADD}
@SP // 18792
AM=M-1 // 18793
D=M // 18794
A=A-1 // 18795
M=D+M // 18796

////PopInstruction{address=local 0}
@SP // 18797
AM=M-1 // 18798
D=M // 18799
@LCL // 18800
A=M // 18801
M=D // 18802

////PushInstruction("constant 2048")
@2048 // 18803
D=A // 18804
@SP // 18805
AM=M+1 // 18806
A=A-1 // 18807
M=D // 18808

////PushInstruction("local 0")
@LCL // 18809
A=M // 18810
D=M // 18811
@SP // 18812
AM=M+1 // 18813
A=A-1 // 18814
M=D // 18815

////ArithmeticInstruction{ADD}
@SP // 18816
AM=M-1 // 18817
D=M // 18818
A=A-1 // 18819
M=D+M // 18820

////PopInstruction{address=local 1}
@SP // 18821
AM=M-1 // 18822
D=M // 18823
@LCL // 18824
A=M+1 // 18825
M=D // 18826

////PushInstruction("local 1")
@LCL // 18827
A=M+1 // 18828
D=M // 18829
@SP // 18830
AM=M+1 // 18831
A=A-1 // 18832
M=D // 18833

////PushInstruction("argument 0")
@ARG // 18834
A=M // 18835
D=M // 18836
@SP // 18837
AM=M+1 // 18838
A=A-1 // 18839
M=D // 18840

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 18841
D=A // 18842
@14 // 18843
M=D // 18844
@Memory.get_best_fit // 18845
D=A // 18846
@13 // 18847
M=D // 18848
@Memory.alloc.ret.2 // 18849
D=A // 18850
@CALL // 18851
0;JMP // 18852
(Memory.alloc.ret.2)

////PopInstruction{address=local 2}
@SP // 18853
AM=M-1 // 18854
D=M // 18855
@LCL // 18856
A=M+1 // 18857
A=A+1 // 18858
M=D // 18859

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 18860
0;JMP // 18861

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushInstruction("constant 2048")
@2048 // 18862
D=A // 18863
@SP // 18864
AM=M+1 // 18865
A=A-1 // 18866
M=D // 18867

////PushInstruction("local 2")
@LCL // 18868
A=M+1 // 18869
A=A+1 // 18870
D=M // 18871
@SP // 18872
AM=M+1 // 18873
A=A-1 // 18874
M=D // 18875

////PushInstruction("constant 0")
@SP // 18876
AM=M+1 // 18877
A=A-1 // 18878
M=0 // 18879

////ArithmeticInstruction{ADD}
@SP // 18880
AM=M-1 // 18881
D=M // 18882
A=A-1 // 18883
M=D+M // 18884

////PopInstruction{address=pointer 1}
@SP // 18885
AM=M-1 // 18886
D=M // 18887
@4 // 18888
M=D // 18889

////PushInstruction("that 0")
@THAT // 18890
A=M // 18891
D=M // 18892
@SP // 18893
AM=M+1 // 18894
A=A-1 // 18895
M=D // 18896

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 18897
D=A // 18898
@14 // 18899
M=D // 18900
@Memory.getBinIndex // 18901
D=A // 18902
@13 // 18903
M=D // 18904
@Memory.alloc.ret.3 // 18905
D=A // 18906
@CALL // 18907
0;JMP // 18908
(Memory.alloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 18909
AM=M-1 // 18910
D=M // 18911
A=A-1 // 18912
M=D+M // 18913

////PushInstruction("local 2")
@LCL // 18914
A=M+1 // 18915
A=A+1 // 18916
D=M // 18917
@SP // 18918
AM=M+1 // 18919
A=A-1 // 18920
M=D // 18921

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=4, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.remove_node
@7 // 18922
D=A // 18923
@14 // 18924
M=D // 18925
@Memory.remove_node // 18926
D=A // 18927
@13 // 18928
M=D // 18929
@Memory.alloc.ret.4 // 18930
D=A // 18931
@CALL // 18932
0;JMP // 18933
(Memory.alloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 18934
AM=M-1 // 18935
D=M // 18936
@5 // 18937
M=D // 18938

////PushInstruction("local 2")
@LCL // 18939
A=M+1 // 18940
A=A+1 // 18941
D=M // 18942
@SP // 18943
AM=M+1 // 18944
A=A-1 // 18945
M=D // 18946

////PushInstruction("constant 0")
@SP // 18947
AM=M+1 // 18948
A=A-1 // 18949
M=0 // 18950

////ArithmeticInstruction{ADD}
@SP // 18951
AM=M-1 // 18952
D=M // 18953
A=A-1 // 18954
M=D+M // 18955

////PopInstruction{address=pointer 1}
@SP // 18956
AM=M-1 // 18957
D=M // 18958
@4 // 18959
M=D // 18960

////PushInstruction("that 0")
@THAT // 18961
A=M // 18962
D=M // 18963
@SP // 18964
AM=M+1 // 18965
A=A-1 // 18966
M=D // 18967

////PushInstruction("argument 0")
@ARG // 18968
A=M // 18969
D=M // 18970
@SP // 18971
AM=M+1 // 18972
A=A-1 // 18973
M=D // 18974

////ArithmeticInstruction{SUB}
@SP // 18975
AM=M-1 // 18976
D=M // 18977
A=A-1 // 18978
M=M-D // 18979

////PopInstruction{address=local 3}
@SP // 18980
AM=M-1 // 18981
D=M // 18982
@LCL // 18983
A=M+1 // 18984
A=A+1 // 18985
A=A+1 // 18986
M=D // 18987

////PushInstruction("local 3")
@LCL // 18988
A=M+1 // 18989
A=A+1 // 18990
A=A+1 // 18991
D=M // 18992
@SP // 18993
AM=M+1 // 18994
A=A-1 // 18995
M=D // 18996

////PushInstruction("constant 5")
@5 // 18997
D=A // 18998
@SP // 18999
AM=M+1 // 19000
A=A-1 // 19001
M=D // 19002

////ArithmeticInstruction{GT}
@COMPARE_Memory.alloc_gt4 // 19003
D=A // 19004
@13 // 19005
M=D // 19006
@SP // 19007
AM=M-1 // 19008
D=M // 19009
A=A-1 // 19010
D=M-D // 19011
@DO_GT // 19012
0;JMP // 19013
(COMPARE_Memory.alloc_gt4)
@SP // 19014
A=M-1 // 19015
M=D // 19016

////PushInstruction("constant 0")
@SP // 19017
AM=M+1 // 19018
A=A-1 // 19019
M=0 // 19020

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq5 // 19021
D=A // 19022
@13 // 19023
M=D // 19024
@SP // 19025
AM=M-1 // 19026
D=M // 19027
A=A-1 // 19028
D=M-D // 19029
@DO_EQ // 19030
0;JMP // 19031
(COMPARE_Memory.alloc_eq5)
@SP // 19032
A=M-1 // 19033
M=D // 19034

////IfGotoInstruction{label='Memory.alloc.IfElse2}
// if-goto Memory.alloc.IfElse2
@SP // 19035
AM=M-1 // 19036
D=M // 19037
@Memory.alloc.IfElse2 // 19038
D;JNE // 19039

////PushInstruction("argument 0")
@ARG // 19040
A=M // 19041
D=M // 19042
@SP // 19043
AM=M+1 // 19044
A=A-1 // 19045
M=D // 19046

////PushInstruction("local 2")
@LCL // 19047
A=M+1 // 19048
A=A+1 // 19049
D=M // 19050
@SP // 19051
AM=M+1 // 19052
A=A-1 // 19053
M=D // 19054

////PushInstruction("constant 0")
@SP // 19055
AM=M+1 // 19056
A=A-1 // 19057
M=0 // 19058

////ArithmeticInstruction{ADD}
@SP // 19059
AM=M-1 // 19060
D=M // 19061
A=A-1 // 19062
M=D+M // 19063

////PopInstruction{address=pointer 1}
@SP // 19064
AM=M-1 // 19065
D=M // 19066
@4 // 19067
M=D // 19068

////PopInstruction{address=that 0}
@SP // 19069
AM=M-1 // 19070
D=M // 19071
@THAT // 19072
A=M // 19073
M=D // 19074

////PushInstruction("constant 0")
@SP // 19075
AM=M+1 // 19076
A=A-1 // 19077
M=0 // 19078

////PushInstruction("local 2")
@LCL // 19079
A=M+1 // 19080
A=A+1 // 19081
D=M // 19082
@SP // 19083
AM=M+1 // 19084
A=A-1 // 19085
M=D // 19086

////PushInstruction("constant 1")
@SP // 19087
AM=M+1 // 19088
A=A-1 // 19089
M=1 // 19090

////ArithmeticInstruction{ADD}
@SP // 19091
AM=M-1 // 19092
D=M // 19093
A=A-1 // 19094
M=D+M // 19095

////PopInstruction{address=pointer 1}
@SP // 19096
AM=M-1 // 19097
D=M // 19098
@4 // 19099
M=D // 19100

////PopInstruction{address=that 0}
@SP // 19101
AM=M-1 // 19102
D=M // 19103
@THAT // 19104
A=M // 19105
M=D // 19106

////PushInstruction("local 2")
@LCL // 19107
A=M+1 // 19108
A=A+1 // 19109
D=M // 19110
@SP // 19111
AM=M+1 // 19112
A=A-1 // 19113
M=D // 19114

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=5, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19115
D=A // 19116
@14 // 19117
M=D // 19118
@Memory.create_foot // 19119
D=A // 19120
@13 // 19121
M=D // 19122
@Memory.alloc.ret.5 // 19123
D=A // 19124
@CALL // 19125
0;JMP // 19126
(Memory.alloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 19127
AM=M-1 // 19128
D=M // 19129
@5 // 19130
M=D // 19131

////PushInstruction("local 2")
@LCL // 19132
A=M+1 // 19133
A=A+1 // 19134
D=M // 19135
@SP // 19136
AM=M+1 // 19137
A=A-1 // 19138
M=D // 19139

////PushInstruction("argument 0")
@ARG // 19140
A=M // 19141
D=M // 19142
@SP // 19143
AM=M+1 // 19144
A=A-1 // 19145
M=D // 19146

////ArithmeticInstruction{ADD}
@SP // 19147
AM=M-1 // 19148
D=M // 19149
A=A-1 // 19150
M=D+M // 19151

////PushInstruction("constant 5")
@5 // 19152
D=A // 19153
@SP // 19154
AM=M+1 // 19155
A=A-1 // 19156
M=D // 19157

////ArithmeticInstruction{ADD}
@SP // 19158
AM=M-1 // 19159
D=M // 19160
A=A-1 // 19161
M=D+M // 19162

////PopInstruction{address=local 4}
@LCL // 19163
D=M // 19164
@4 // 19165
A=D+A // 19166
D=A // 19167
@R13 // 19168
M=D // 19169
@SP // 19170
AM=M-1 // 19171
D=M // 19172
@R13 // 19173
A=M // 19174
M=D // 19175

////PushInstruction("local 3")
@LCL // 19176
A=M+1 // 19177
A=A+1 // 19178
A=A+1 // 19179
D=M // 19180
@SP // 19181
AM=M+1 // 19182
A=A-1 // 19183
M=D // 19184

////PushInstruction("constant 5")
@5 // 19185
D=A // 19186
@SP // 19187
AM=M+1 // 19188
A=A-1 // 19189
M=D // 19190

////ArithmeticInstruction{SUB}
@SP // 19191
AM=M-1 // 19192
D=M // 19193
A=A-1 // 19194
M=M-D // 19195

////PushInstruction("local 4")
@LCL // 19196
D=M // 19197
@4 // 19198
A=D+A // 19199
D=M // 19200
@SP // 19201
AM=M+1 // 19202
A=A-1 // 19203
M=D // 19204

////PushInstruction("constant 0")
@SP // 19205
AM=M+1 // 19206
A=A-1 // 19207
M=0 // 19208

////ArithmeticInstruction{ADD}
@SP // 19209
AM=M-1 // 19210
D=M // 19211
A=A-1 // 19212
M=D+M // 19213

////PopInstruction{address=pointer 1}
@SP // 19214
AM=M-1 // 19215
D=M // 19216
@4 // 19217
M=D // 19218

////PopInstruction{address=that 0}
@SP // 19219
AM=M-1 // 19220
D=M // 19221
@THAT // 19222
A=M // 19223
M=D // 19224

////PushInstruction("constant 1")
@SP // 19225
AM=M+1 // 19226
A=A-1 // 19227
M=1 // 19228

////PushInstruction("local 4")
@LCL // 19229
D=M // 19230
@4 // 19231
A=D+A // 19232
D=M // 19233
@SP // 19234
AM=M+1 // 19235
A=A-1 // 19236
M=D // 19237

////PushInstruction("constant 1")
@SP // 19238
AM=M+1 // 19239
A=A-1 // 19240
M=1 // 19241

////ArithmeticInstruction{ADD}
@SP // 19242
AM=M-1 // 19243
D=M // 19244
A=A-1 // 19245
M=D+M // 19246

////PopInstruction{address=pointer 1}
@SP // 19247
AM=M-1 // 19248
D=M // 19249
@4 // 19250
M=D // 19251

////PopInstruction{address=that 0}
@SP // 19252
AM=M-1 // 19253
D=M // 19254
@THAT // 19255
A=M // 19256
M=D // 19257

////PushInstruction("local 4")
@LCL // 19258
D=M // 19259
@4 // 19260
A=D+A // 19261
D=M // 19262
@SP // 19263
AM=M+1 // 19264
A=A-1 // 19265
M=D // 19266

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19267
D=A // 19268
@14 // 19269
M=D // 19270
@Memory.create_foot // 19271
D=A // 19272
@13 // 19273
M=D // 19274
@Memory.alloc.ret.6 // 19275
D=A // 19276
@CALL // 19277
0;JMP // 19278
(Memory.alloc.ret.6)

////PopInstruction{address=temp 0}
@SP // 19279
AM=M-1 // 19280
D=M // 19281
@5 // 19282
M=D // 19283

////PushInstruction("constant 2048")
@2048 // 19284
D=A // 19285
@SP // 19286
AM=M+1 // 19287
A=A-1 // 19288
M=D // 19289

////PushInstruction("local 3")
@LCL // 19290
A=M+1 // 19291
A=A+1 // 19292
A=A+1 // 19293
D=M // 19294
@SP // 19295
AM=M+1 // 19296
A=A-1 // 19297
M=D // 19298

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 19299
D=A // 19300
@14 // 19301
M=D // 19302
@Memory.getBinIndex // 19303
D=A // 19304
@13 // 19305
M=D // 19306
@Memory.alloc.ret.7 // 19307
D=A // 19308
@CALL // 19309
0;JMP // 19310
(Memory.alloc.ret.7)

////ArithmeticInstruction{ADD}
@SP // 19311
AM=M-1 // 19312
D=M // 19313
A=A-1 // 19314
M=D+M // 19315

////PushInstruction("local 4")
@LCL // 19316
D=M // 19317
@4 // 19318
A=D+A // 19319
D=M // 19320
@SP // 19321
AM=M+1 // 19322
A=A-1 // 19323
M=D // 19324

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.add_node
@7 // 19325
D=A // 19326
@14 // 19327
M=D // 19328
@Memory.add_node // 19329
D=A // 19330
@13 // 19331
M=D // 19332
@Memory.alloc.ret.8 // 19333
D=A // 19334
@CALL // 19335
0;JMP // 19336
(Memory.alloc.ret.8)

////PopInstruction{address=temp 0}
@SP // 19337
AM=M-1 // 19338
D=M // 19339
@5 // 19340
M=D // 19341

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 19342
0;JMP // 19343

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushInstruction("constant 0")
@SP // 19344
AM=M+1 // 19345
A=A-1 // 19346
M=0 // 19347

////PushInstruction("local 2")
@LCL // 19348
A=M+1 // 19349
A=A+1 // 19350
D=M // 19351
@SP // 19352
AM=M+1 // 19353
A=A-1 // 19354
M=D // 19355

////PushInstruction("constant 1")
@SP // 19356
AM=M+1 // 19357
A=A-1 // 19358
M=1 // 19359

////ArithmeticInstruction{ADD}
@SP // 19360
AM=M-1 // 19361
D=M // 19362
A=A-1 // 19363
M=D+M // 19364

////PopInstruction{address=pointer 1}
@SP // 19365
AM=M-1 // 19366
D=M // 19367
@4 // 19368
M=D // 19369

////PopInstruction{address=that 0}
@SP // 19370
AM=M-1 // 19371
D=M // 19372
@THAT // 19373
A=M // 19374
M=D // 19375

////PushInstruction("local 2")
@LCL // 19376
A=M+1 // 19377
A=A+1 // 19378
D=M // 19379
@SP // 19380
AM=M+1 // 19381
A=A-1 // 19382
M=D // 19383

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=9, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19384
D=A // 19385
@14 // 19386
M=D // 19387
@Memory.create_foot // 19388
D=A // 19389
@13 // 19390
M=D // 19391
@Memory.alloc.ret.9 // 19392
D=A // 19393
@CALL // 19394
0;JMP // 19395
(Memory.alloc.ret.9)

////PopInstruction{address=temp 0}
@SP // 19396
AM=M-1 // 19397
D=M // 19398
@5 // 19399
M=D // 19400

////LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)

////PushInstruction("local 2")
@LCL // 19401
A=M+1 // 19402
A=A+1 // 19403
D=M // 19404
@SP // 19405
AM=M+1 // 19406
A=A-1 // 19407
M=D // 19408

////PushInstruction("constant 4")
@4 // 19409
D=A // 19410
@SP // 19411
AM=M+1 // 19412
A=A-1 // 19413
M=D // 19414

////ArithmeticInstruction{ADD}
@SP // 19415
AM=M-1 // 19416
D=M // 19417
A=A-1 // 19418
M=D+M // 19419

////ReturnInstruction{}
@RETURN // 19420
0;JMP // 19421

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 19422
AM=M+1 // 19423
A=A-1 // 19424
M=0 // 19425

////PushInstruction("argument 0")
@ARG // 19426
A=M // 19427
D=M // 19428
@SP // 19429
AM=M+1 // 19430
A=A-1 // 19431
M=D // 19432

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=10, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}
// call Memory.alloc
@6 // 19433
D=A // 19434
@14 // 19435
M=D // 19436
@Memory.alloc // 19437
D=A // 19438
@13 // 19439
M=D // 19440
@Memory.calloc.ret.0 // 19441
D=A // 19442
@CALL // 19443
0;JMP // 19444
(Memory.calloc.ret.0)

////PopInstruction{address=local 0}
@SP // 19445
AM=M-1 // 19446
D=M // 19447
@LCL // 19448
A=M // 19449
M=D // 19450

////PushInstruction("local 0")
@LCL // 19451
A=M // 19452
D=M // 19453
@SP // 19454
AM=M+1 // 19455
A=A-1 // 19456
M=D // 19457

////ArithmeticInstruction{NOT}
@SP // 19458
A=M-1 // 19459
M=!M // 19460

////PushInstruction("constant 0")
@SP // 19461
AM=M+1 // 19462
A=A-1 // 19463
M=0 // 19464

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq6 // 19465
D=A // 19466
@13 // 19467
M=D // 19468
@SP // 19469
AM=M-1 // 19470
D=M // 19471
A=A-1 // 19472
D=M-D // 19473
@DO_EQ // 19474
0;JMP // 19475
(COMPARE_Memory.calloc_eq6)
@SP // 19476
A=M-1 // 19477
M=D // 19478

////IfGotoInstruction{label='Memory.calloc.IfElse1}
// if-goto Memory.calloc.IfElse1
@SP // 19479
AM=M-1 // 19480
D=M // 19481
@Memory.calloc.IfElse1 // 19482
D;JNE // 19483

////PushInstruction("constant 0")
@SP // 19484
AM=M+1 // 19485
A=A-1 // 19486
M=0 // 19487

////ReturnInstruction{}
@RETURN // 19488
0;JMP // 19489

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 19490
0;JMP // 19491

////LabelInstruction{label='Memory.calloc.IfElse1}
// label Memory.calloc.IfElse1
(Memory.calloc.IfElse1)

////LabelInstruction{label='Memory.calloc.IfElseEND1}
// label Memory.calloc.IfElseEND1
(Memory.calloc.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.calloc1}
// label WHILE_START_Memory.calloc1
(WHILE_START_Memory.calloc1)

////PushInstruction("argument 0")
@ARG // 19492
A=M // 19493
D=M // 19494
@SP // 19495
AM=M+1 // 19496
A=A-1 // 19497
M=D // 19498

////PushInstruction("constant 0")
@SP // 19499
AM=M+1 // 19500
A=A-1 // 19501
M=0 // 19502

////ArithmeticInstruction{GT}
@COMPARE_Memory.calloc_gt7 // 19503
D=A // 19504
@13 // 19505
M=D // 19506
@SP // 19507
AM=M-1 // 19508
D=M // 19509
A=A-1 // 19510
D=M-D // 19511
@DO_GT // 19512
0;JMP // 19513
(COMPARE_Memory.calloc_gt7)
@SP // 19514
A=M-1 // 19515
M=D // 19516

////PushInstruction("constant 0")
@SP // 19517
AM=M+1 // 19518
A=A-1 // 19519
M=0 // 19520

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq8 // 19521
D=A // 19522
@13 // 19523
M=D // 19524
@SP // 19525
AM=M-1 // 19526
D=M // 19527
A=A-1 // 19528
D=M-D // 19529
@DO_EQ // 19530
0;JMP // 19531
(COMPARE_Memory.calloc_eq8)
@SP // 19532
A=M-1 // 19533
M=D // 19534

////IfGotoInstruction{label='WHILE_END_Memory.calloc1}
// if-goto WHILE_END_Memory.calloc1
@SP // 19535
AM=M-1 // 19536
D=M // 19537
@WHILE_END_Memory.calloc1 // 19538
D;JNE // 19539

////PushInstruction("argument 0")
@ARG // 19540
A=M // 19541
D=M // 19542
@SP // 19543
AM=M+1 // 19544
A=A-1 // 19545
M=D // 19546

////PushInstruction("constant 1")
@SP // 19547
AM=M+1 // 19548
A=A-1 // 19549
M=1 // 19550

////ArithmeticInstruction{SUB}
@SP // 19551
AM=M-1 // 19552
D=M // 19553
A=A-1 // 19554
M=M-D // 19555

////PopInstruction{address=argument 0}
@SP // 19556
AM=M-1 // 19557
D=M // 19558
@ARG // 19559
A=M // 19560
M=D // 19561

////PushInstruction("constant 0")
@SP // 19562
AM=M+1 // 19563
A=A-1 // 19564
M=0 // 19565

////PushInstruction("local 0")
@LCL // 19566
A=M // 19567
D=M // 19568
@SP // 19569
AM=M+1 // 19570
A=A-1 // 19571
M=D // 19572

////PushInstruction("argument 0")
@ARG // 19573
A=M // 19574
D=M // 19575
@SP // 19576
AM=M+1 // 19577
A=A-1 // 19578
M=D // 19579

////ArithmeticInstruction{ADD}
@SP // 19580
AM=M-1 // 19581
D=M // 19582
A=A-1 // 19583
M=D+M // 19584

////PopInstruction{address=pointer 1}
@SP // 19585
AM=M-1 // 19586
D=M // 19587
@4 // 19588
M=D // 19589

////PopInstruction{address=that 0}
@SP // 19590
AM=M-1 // 19591
D=M // 19592
@THAT // 19593
A=M // 19594
M=D // 19595

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 19596
0;JMP // 19597

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 19598
A=M // 19599
D=M // 19600
@SP // 19601
AM=M+1 // 19602
A=A-1 // 19603
M=D // 19604

////ReturnInstruction{}
@RETURN // 19605
0;JMP // 19606

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 19607
AM=M+1 // 19608
A=A-1 // 19609
M=0 // 19610
@SP // 19611
AM=M+1 // 19612
A=A-1 // 19613
M=0 // 19614
@SP // 19615
AM=M+1 // 19616
A=A-1 // 19617
M=0 // 19618

////PushInstruction("argument 0")
@ARG // 19619
A=M // 19620
D=M // 19621
@SP // 19622
AM=M+1 // 19623
A=A-1 // 19624
M=D // 19625

////PushInstruction("constant 4")
@4 // 19626
D=A // 19627
@SP // 19628
AM=M+1 // 19629
A=A-1 // 19630
M=D // 19631

////ArithmeticInstruction{SUB}
@SP // 19632
AM=M-1 // 19633
D=M // 19634
A=A-1 // 19635
M=M-D // 19636

////PopInstruction{address=local 0}
@SP // 19637
AM=M-1 // 19638
D=M // 19639
@LCL // 19640
A=M // 19641
M=D // 19642

////PushInstruction("constant 1")
@SP // 19643
AM=M+1 // 19644
A=A-1 // 19645
M=1 // 19646

////PushInstruction("local 0")
@LCL // 19647
A=M // 19648
D=M // 19649
@SP // 19650
AM=M+1 // 19651
A=A-1 // 19652
M=D // 19653

////PushInstruction("constant 1")
@SP // 19654
AM=M+1 // 19655
A=A-1 // 19656
M=1 // 19657

////ArithmeticInstruction{ADD}
@SP // 19658
AM=M-1 // 19659
D=M // 19660
A=A-1 // 19661
M=D+M // 19662

////PopInstruction{address=pointer 1}
@SP // 19663
AM=M-1 // 19664
D=M // 19665
@4 // 19666
M=D // 19667

////PopInstruction{address=that 0}
@SP // 19668
AM=M-1 // 19669
D=M // 19670
@THAT // 19671
A=M // 19672
M=D // 19673

////PushInstruction("local 0")
@LCL // 19674
A=M // 19675
D=M // 19676
@SP // 19677
AM=M+1 // 19678
A=A-1 // 19679
M=D // 19680

////PushInstruction("constant 2")
@2 // 19681
D=A // 19682
@SP // 19683
AM=M+1 // 19684
A=A-1 // 19685
M=D // 19686

////ArithmeticInstruction{ADD}
@SP // 19687
AM=M-1 // 19688
D=M // 19689
A=A-1 // 19690
M=D+M // 19691

////PopInstruction{address=pointer 1}
@SP // 19692
AM=M-1 // 19693
D=M // 19694
@4 // 19695
M=D // 19696

////PushInstruction("that 0")
@THAT // 19697
A=M // 19698
D=M // 19699
@SP // 19700
AM=M+1 // 19701
A=A-1 // 19702
M=D // 19703

////PopInstruction{address=local 1}
@SP // 19704
AM=M-1 // 19705
D=M // 19706
@LCL // 19707
A=M+1 // 19708
M=D // 19709

////PushInstruction("local 0")
@LCL // 19710
A=M // 19711
D=M // 19712
@SP // 19713
AM=M+1 // 19714
A=A-1 // 19715
M=D // 19716

////PushInstruction("constant 3")
@3 // 19717
D=A // 19718
@SP // 19719
AM=M+1 // 19720
A=A-1 // 19721
M=D // 19722

////ArithmeticInstruction{ADD}
@SP // 19723
AM=M-1 // 19724
D=M // 19725
A=A-1 // 19726
M=D+M // 19727

////PopInstruction{address=pointer 1}
@SP // 19728
AM=M-1 // 19729
D=M // 19730
@4 // 19731
M=D // 19732

////PushInstruction("that 0")
@THAT // 19733
A=M // 19734
D=M // 19735
@SP // 19736
AM=M+1 // 19737
A=A-1 // 19738
M=D // 19739

////PopInstruction{address=local 2}
@SP // 19740
AM=M-1 // 19741
D=M // 19742
@LCL // 19743
A=M+1 // 19744
A=A+1 // 19745
M=D // 19746

////PushInstruction("local 1")
@LCL // 19747
A=M+1 // 19748
D=M // 19749
@SP // 19750
AM=M+1 // 19751
A=A-1 // 19752
M=D // 19753

////PushInstruction("constant 0")
@SP // 19754
AM=M+1 // 19755
A=A-1 // 19756
M=0 // 19757

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq9 // 19758
D=A // 19759
@13 // 19760
M=D // 19761
@SP // 19762
AM=M-1 // 19763
D=M // 19764
A=A-1 // 19765
D=M-D // 19766
@DO_EQ // 19767
0;JMP // 19768
(COMPARE_Memory.deAlloc_eq9)
@SP // 19769
A=M-1 // 19770
M=D // 19771

////ArithmeticInstruction{NOT}
@SP // 19772
A=M-1 // 19773
M=!M // 19774

////PushInstruction("constant 0")
@SP // 19775
AM=M+1 // 19776
A=A-1 // 19777
M=0 // 19778

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq10 // 19779
D=A // 19780
@13 // 19781
M=D // 19782
@SP // 19783
AM=M-1 // 19784
D=M // 19785
A=A-1 // 19786
D=M-D // 19787
@DO_EQ // 19788
0;JMP // 19789
(COMPARE_Memory.deAlloc_eq10)
@SP // 19790
A=M-1 // 19791
M=D // 19792

////IfGotoInstruction{label='Memory.deAlloc.IfElse1}
// if-goto Memory.deAlloc.IfElse1
@SP // 19793
AM=M-1 // 19794
D=M // 19795
@Memory.deAlloc.IfElse1 // 19796
D;JNE // 19797

////PushInstruction("local 1")
@LCL // 19798
A=M+1 // 19799
D=M // 19800
@SP // 19801
AM=M+1 // 19802
A=A-1 // 19803
M=D // 19804

////PushInstruction("constant 1")
@SP // 19805
AM=M+1 // 19806
A=A-1 // 19807
M=1 // 19808

////ArithmeticInstruction{ADD}
@SP // 19809
AM=M-1 // 19810
D=M // 19811
A=A-1 // 19812
M=D+M // 19813

////PopInstruction{address=pointer 1}
@SP // 19814
AM=M-1 // 19815
D=M // 19816
@4 // 19817
M=D // 19818

////PushInstruction("that 0")
@THAT // 19819
A=M // 19820
D=M // 19821
@SP // 19822
AM=M+1 // 19823
A=A-1 // 19824
M=D // 19825

////PushInstruction("constant 1")
@SP // 19826
AM=M+1 // 19827
A=A-1 // 19828
M=1 // 19829

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq11 // 19830
D=A // 19831
@13 // 19832
M=D // 19833
@SP // 19834
AM=M-1 // 19835
D=M // 19836
A=A-1 // 19837
D=M-D // 19838
@DO_EQ // 19839
0;JMP // 19840
(COMPARE_Memory.deAlloc_eq11)
@SP // 19841
A=M-1 // 19842
M=D // 19843

////PushInstruction("constant 0")
@SP // 19844
AM=M+1 // 19845
A=A-1 // 19846
M=0 // 19847

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq12 // 19848
D=A // 19849
@13 // 19850
M=D // 19851
@SP // 19852
AM=M-1 // 19853
D=M // 19854
A=A-1 // 19855
D=M-D // 19856
@DO_EQ // 19857
0;JMP // 19858
(COMPARE_Memory.deAlloc_eq12)
@SP // 19859
A=M-1 // 19860
M=D // 19861

////IfGotoInstruction{label='Memory.deAlloc.IfElse2}
// if-goto Memory.deAlloc.IfElse2
@SP // 19862
AM=M-1 // 19863
D=M // 19864
@Memory.deAlloc.IfElse2 // 19865
D;JNE // 19866

////PushInstruction("constant 2048")
@2048 // 19867
D=A // 19868
@SP // 19869
AM=M+1 // 19870
A=A-1 // 19871
M=D // 19872

////PushInstruction("local 1")
@LCL // 19873
A=M+1 // 19874
D=M // 19875
@SP // 19876
AM=M+1 // 19877
A=A-1 // 19878
M=D // 19879

////PushInstruction("constant 0")
@SP // 19880
AM=M+1 // 19881
A=A-1 // 19882
M=0 // 19883

////ArithmeticInstruction{ADD}
@SP // 19884
AM=M-1 // 19885
D=M // 19886
A=A-1 // 19887
M=D+M // 19888

////PopInstruction{address=pointer 1}
@SP // 19889
AM=M-1 // 19890
D=M // 19891
@4 // 19892
M=D // 19893

////PushInstruction("that 0")
@THAT // 19894
A=M // 19895
D=M // 19896
@SP // 19897
AM=M+1 // 19898
A=A-1 // 19899
M=D // 19900

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 19901
D=A // 19902
@14 // 19903
M=D // 19904
@Memory.getBinIndex // 19905
D=A // 19906
@13 // 19907
M=D // 19908
@Memory.deAlloc.ret.0 // 19909
D=A // 19910
@CALL // 19911
0;JMP // 19912
(Memory.deAlloc.ret.0)

////ArithmeticInstruction{ADD}
@SP // 19913
AM=M-1 // 19914
D=M // 19915
A=A-1 // 19916
M=D+M // 19917

////PushInstruction("local 1")
@LCL // 19918
A=M+1 // 19919
D=M // 19920
@SP // 19921
AM=M+1 // 19922
A=A-1 // 19923
M=D // 19924

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=1, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 19925
D=A // 19926
@14 // 19927
M=D // 19928
@Memory.remove_node // 19929
D=A // 19930
@13 // 19931
M=D // 19932
@Memory.deAlloc.ret.1 // 19933
D=A // 19934
@CALL // 19935
0;JMP // 19936
(Memory.deAlloc.ret.1)

////PopInstruction{address=temp 0}
@SP // 19937
AM=M-1 // 19938
D=M // 19939
@5 // 19940
M=D // 19941

////PushInstruction("local 1")
@LCL // 19942
A=M+1 // 19943
D=M // 19944
@SP // 19945
AM=M+1 // 19946
A=A-1 // 19947
M=D // 19948

////PushInstruction("constant 0")
@SP // 19949
AM=M+1 // 19950
A=A-1 // 19951
M=0 // 19952

////ArithmeticInstruction{ADD}
@SP // 19953
AM=M-1 // 19954
D=M // 19955
A=A-1 // 19956
M=D+M // 19957

////PopInstruction{address=pointer 1}
@SP // 19958
AM=M-1 // 19959
D=M // 19960
@4 // 19961
M=D // 19962

////PushInstruction("that 0")
@THAT // 19963
A=M // 19964
D=M // 19965
@SP // 19966
AM=M+1 // 19967
A=A-1 // 19968
M=D // 19969

////PushInstruction("local 0")
@LCL // 19970
A=M // 19971
D=M // 19972
@SP // 19973
AM=M+1 // 19974
A=A-1 // 19975
M=D // 19976

////PushInstruction("constant 0")
@SP // 19977
AM=M+1 // 19978
A=A-1 // 19979
M=0 // 19980

////ArithmeticInstruction{ADD}
@SP // 19981
AM=M-1 // 19982
D=M // 19983
A=A-1 // 19984
M=D+M // 19985

////PopInstruction{address=pointer 1}
@SP // 19986
AM=M-1 // 19987
D=M // 19988
@4 // 19989
M=D // 19990

////PushInstruction("that 0")
@THAT // 19991
A=M // 19992
D=M // 19993
@SP // 19994
AM=M+1 // 19995
A=A-1 // 19996
M=D // 19997

////ArithmeticInstruction{ADD}
@SP // 19998
AM=M-1 // 19999
D=M // 20000
A=A-1 // 20001
M=D+M // 20002

////PushInstruction("constant 5")
@5 // 20003
D=A // 20004
@SP // 20005
AM=M+1 // 20006
A=A-1 // 20007
M=D // 20008

////ArithmeticInstruction{ADD}
@SP // 20009
AM=M-1 // 20010
D=M // 20011
A=A-1 // 20012
M=D+M // 20013

////PushInstruction("local 1")
@LCL // 20014
A=M+1 // 20015
D=M // 20016
@SP // 20017
AM=M+1 // 20018
A=A-1 // 20019
M=D // 20020

////PushInstruction("constant 0")
@SP // 20021
AM=M+1 // 20022
A=A-1 // 20023
M=0 // 20024

////ArithmeticInstruction{ADD}
@SP // 20025
AM=M-1 // 20026
D=M // 20027
A=A-1 // 20028
M=D+M // 20029

////PopInstruction{address=pointer 1}
@SP // 20030
AM=M-1 // 20031
D=M // 20032
@4 // 20033
M=D // 20034

////PopInstruction{address=that 0}
@SP // 20035
AM=M-1 // 20036
D=M // 20037
@THAT // 20038
A=M // 20039
M=D // 20040

////PushInstruction("local 1")
@LCL // 20041
A=M+1 // 20042
D=M // 20043
@SP // 20044
AM=M+1 // 20045
A=A-1 // 20046
M=D // 20047

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=2, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 20048
D=A // 20049
@14 // 20050
M=D // 20051
@Memory.create_foot // 20052
D=A // 20053
@13 // 20054
M=D // 20055
@Memory.deAlloc.ret.2 // 20056
D=A // 20057
@CALL // 20058
0;JMP // 20059
(Memory.deAlloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 20060
AM=M-1 // 20061
D=M // 20062
@5 // 20063
M=D // 20064

////PushInstruction("local 1")
@LCL // 20065
A=M+1 // 20066
D=M // 20067
@SP // 20068
AM=M+1 // 20069
A=A-1 // 20070
M=D // 20071

////PopInstruction{address=local 0}
@SP // 20072
AM=M-1 // 20073
D=M // 20074
@LCL // 20075
A=M // 20076
M=D // 20077

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 20078
0;JMP // 20079

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 20080
0;JMP // 20081

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////PushInstruction("local 2")
@LCL // 20082
A=M+1 // 20083
A=A+1 // 20084
D=M // 20085
@SP // 20086
AM=M+1 // 20087
A=A-1 // 20088
M=D // 20089

////PushInstruction("constant 0")
@SP // 20090
AM=M+1 // 20091
A=A-1 // 20092
M=0 // 20093

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq13 // 20094
D=A // 20095
@13 // 20096
M=D // 20097
@SP // 20098
AM=M-1 // 20099
D=M // 20100
A=A-1 // 20101
D=M-D // 20102
@DO_EQ // 20103
0;JMP // 20104
(COMPARE_Memory.deAlloc_eq13)
@SP // 20105
A=M-1 // 20106
M=D // 20107

////ArithmeticInstruction{NOT}
@SP // 20108
A=M-1 // 20109
M=!M // 20110

////PushInstruction("constant 0")
@SP // 20111
AM=M+1 // 20112
A=A-1 // 20113
M=0 // 20114

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq14 // 20115
D=A // 20116
@13 // 20117
M=D // 20118
@SP // 20119
AM=M-1 // 20120
D=M // 20121
A=A-1 // 20122
D=M-D // 20123
@DO_EQ // 20124
0;JMP // 20125
(COMPARE_Memory.deAlloc_eq14)
@SP // 20126
A=M-1 // 20127
M=D // 20128

////IfGotoInstruction{label='Memory.deAlloc.IfElse3}
// if-goto Memory.deAlloc.IfElse3
@SP // 20129
AM=M-1 // 20130
D=M // 20131
@Memory.deAlloc.IfElse3 // 20132
D;JNE // 20133

////PushInstruction("local 2")
@LCL // 20134
A=M+1 // 20135
A=A+1 // 20136
D=M // 20137
@SP // 20138
AM=M+1 // 20139
A=A-1 // 20140
M=D // 20141

////PushInstruction("constant 1")
@SP // 20142
AM=M+1 // 20143
A=A-1 // 20144
M=1 // 20145

////ArithmeticInstruction{ADD}
@SP // 20146
AM=M-1 // 20147
D=M // 20148
A=A-1 // 20149
M=D+M // 20150

////PopInstruction{address=pointer 1}
@SP // 20151
AM=M-1 // 20152
D=M // 20153
@4 // 20154
M=D // 20155

////PushInstruction("that 0")
@THAT // 20156
A=M // 20157
D=M // 20158
@SP // 20159
AM=M+1 // 20160
A=A-1 // 20161
M=D // 20162

////PushInstruction("constant 1")
@SP // 20163
AM=M+1 // 20164
A=A-1 // 20165
M=1 // 20166

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq15 // 20167
D=A // 20168
@13 // 20169
M=D // 20170
@SP // 20171
AM=M-1 // 20172
D=M // 20173
A=A-1 // 20174
D=M-D // 20175
@DO_EQ // 20176
0;JMP // 20177
(COMPARE_Memory.deAlloc_eq15)
@SP // 20178
A=M-1 // 20179
M=D // 20180

////PushInstruction("constant 0")
@SP // 20181
AM=M+1 // 20182
A=A-1 // 20183
M=0 // 20184

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq16 // 20185
D=A // 20186
@13 // 20187
M=D // 20188
@SP // 20189
AM=M-1 // 20190
D=M // 20191
A=A-1 // 20192
D=M-D // 20193
@DO_EQ // 20194
0;JMP // 20195
(COMPARE_Memory.deAlloc_eq16)
@SP // 20196
A=M-1 // 20197
M=D // 20198

////IfGotoInstruction{label='Memory.deAlloc.IfElse4}
// if-goto Memory.deAlloc.IfElse4
@SP // 20199
AM=M-1 // 20200
D=M // 20201
@Memory.deAlloc.IfElse4 // 20202
D;JNE // 20203

////PushInstruction("constant 2048")
@2048 // 20204
D=A // 20205
@SP // 20206
AM=M+1 // 20207
A=A-1 // 20208
M=D // 20209

////PushInstruction("local 2")
@LCL // 20210
A=M+1 // 20211
A=A+1 // 20212
D=M // 20213
@SP // 20214
AM=M+1 // 20215
A=A-1 // 20216
M=D // 20217

////PushInstruction("constant 0")
@SP // 20218
AM=M+1 // 20219
A=A-1 // 20220
M=0 // 20221

////ArithmeticInstruction{ADD}
@SP // 20222
AM=M-1 // 20223
D=M // 20224
A=A-1 // 20225
M=D+M // 20226

////PopInstruction{address=pointer 1}
@SP // 20227
AM=M-1 // 20228
D=M // 20229
@4 // 20230
M=D // 20231

////PushInstruction("that 0")
@THAT // 20232
A=M // 20233
D=M // 20234
@SP // 20235
AM=M+1 // 20236
A=A-1 // 20237
M=D // 20238

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 20239
D=A // 20240
@14 // 20241
M=D // 20242
@Memory.getBinIndex // 20243
D=A // 20244
@13 // 20245
M=D // 20246
@Memory.deAlloc.ret.3 // 20247
D=A // 20248
@CALL // 20249
0;JMP // 20250
(Memory.deAlloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 20251
AM=M-1 // 20252
D=M // 20253
A=A-1 // 20254
M=D+M // 20255

////PushInstruction("local 2")
@LCL // 20256
A=M+1 // 20257
A=A+1 // 20258
D=M // 20259
@SP // 20260
AM=M+1 // 20261
A=A-1 // 20262
M=D // 20263

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 20264
D=A // 20265
@14 // 20266
M=D // 20267
@Memory.remove_node // 20268
D=A // 20269
@13 // 20270
M=D // 20271
@Memory.deAlloc.ret.4 // 20272
D=A // 20273
@CALL // 20274
0;JMP // 20275
(Memory.deAlloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 20276
AM=M-1 // 20277
D=M // 20278
@5 // 20279
M=D // 20280

////PushInstruction("local 0")
@LCL // 20281
A=M // 20282
D=M // 20283
@SP // 20284
AM=M+1 // 20285
A=A-1 // 20286
M=D // 20287

////PushInstruction("constant 0")
@SP // 20288
AM=M+1 // 20289
A=A-1 // 20290
M=0 // 20291

////ArithmeticInstruction{ADD}
@SP // 20292
AM=M-1 // 20293
D=M // 20294
A=A-1 // 20295
M=D+M // 20296

////PopInstruction{address=pointer 1}
@SP // 20297
AM=M-1 // 20298
D=M // 20299
@4 // 20300
M=D // 20301

////PushInstruction("that 0")
@THAT // 20302
A=M // 20303
D=M // 20304
@SP // 20305
AM=M+1 // 20306
A=A-1 // 20307
M=D // 20308

////PushInstruction("local 2")
@LCL // 20309
A=M+1 // 20310
A=A+1 // 20311
D=M // 20312
@SP // 20313
AM=M+1 // 20314
A=A-1 // 20315
M=D // 20316

////PushInstruction("constant 0")
@SP // 20317
AM=M+1 // 20318
A=A-1 // 20319
M=0 // 20320

////ArithmeticInstruction{ADD}
@SP // 20321
AM=M-1 // 20322
D=M // 20323
A=A-1 // 20324
M=D+M // 20325

////PopInstruction{address=pointer 1}
@SP // 20326
AM=M-1 // 20327
D=M // 20328
@4 // 20329
M=D // 20330

////PushInstruction("that 0")
@THAT // 20331
A=M // 20332
D=M // 20333
@SP // 20334
AM=M+1 // 20335
A=A-1 // 20336
M=D // 20337

////ArithmeticInstruction{ADD}
@SP // 20338
AM=M-1 // 20339
D=M // 20340
A=A-1 // 20341
M=D+M // 20342

////PushInstruction("constant 5")
@5 // 20343
D=A // 20344
@SP // 20345
AM=M+1 // 20346
A=A-1 // 20347
M=D // 20348

////ArithmeticInstruction{ADD}
@SP // 20349
AM=M-1 // 20350
D=M // 20351
A=A-1 // 20352
M=D+M // 20353

////PushInstruction("local 0")
@LCL // 20354
A=M // 20355
D=M // 20356
@SP // 20357
AM=M+1 // 20358
A=A-1 // 20359
M=D // 20360

////PushInstruction("constant 0")
@SP // 20361
AM=M+1 // 20362
A=A-1 // 20363
M=0 // 20364

////ArithmeticInstruction{ADD}
@SP // 20365
AM=M-1 // 20366
D=M // 20367
A=A-1 // 20368
M=D+M // 20369

////PopInstruction{address=pointer 1}
@SP // 20370
AM=M-1 // 20371
D=M // 20372
@4 // 20373
M=D // 20374

////PopInstruction{address=that 0}
@SP // 20375
AM=M-1 // 20376
D=M // 20377
@THAT // 20378
A=M // 20379
M=D // 20380

////PushInstruction("local 0")
@LCL // 20381
A=M // 20382
D=M // 20383
@SP // 20384
AM=M+1 // 20385
A=A-1 // 20386
M=D // 20387

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=5, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 20388
D=A // 20389
@14 // 20390
M=D // 20391
@Memory.create_foot // 20392
D=A // 20393
@13 // 20394
M=D // 20395
@Memory.deAlloc.ret.5 // 20396
D=A // 20397
@CALL // 20398
0;JMP // 20399
(Memory.deAlloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 20400
AM=M-1 // 20401
D=M // 20402
@5 // 20403
M=D // 20404

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 20405
0;JMP // 20406

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 20407
0;JMP // 20408

////LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)

////LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)

////PushInstruction("constant 2048")
@2048 // 20409
D=A // 20410
@SP // 20411
AM=M+1 // 20412
A=A-1 // 20413
M=D // 20414

////PushInstruction("local 0")
@LCL // 20415
A=M // 20416
D=M // 20417
@SP // 20418
AM=M+1 // 20419
A=A-1 // 20420
M=D // 20421

////PushInstruction("constant 0")
@SP // 20422
AM=M+1 // 20423
A=A-1 // 20424
M=0 // 20425

////ArithmeticInstruction{ADD}
@SP // 20426
AM=M-1 // 20427
D=M // 20428
A=A-1 // 20429
M=D+M // 20430

////PopInstruction{address=pointer 1}
@SP // 20431
AM=M-1 // 20432
D=M // 20433
@4 // 20434
M=D // 20435

////PushInstruction("that 0")
@THAT // 20436
A=M // 20437
D=M // 20438
@SP // 20439
AM=M+1 // 20440
A=A-1 // 20441
M=D // 20442

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=6, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 20443
D=A // 20444
@14 // 20445
M=D // 20446
@Memory.getBinIndex // 20447
D=A // 20448
@13 // 20449
M=D // 20450
@Memory.deAlloc.ret.6 // 20451
D=A // 20452
@CALL // 20453
0;JMP // 20454
(Memory.deAlloc.ret.6)

////ArithmeticInstruction{ADD}
@SP // 20455
AM=M-1 // 20456
D=M // 20457
A=A-1 // 20458
M=D+M // 20459

////PushInstruction("local 0")
@LCL // 20460
A=M // 20461
D=M // 20462
@SP // 20463
AM=M+1 // 20464
A=A-1 // 20465
M=D // 20466

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=7, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.add_node
@7 // 20467
D=A // 20468
@14 // 20469
M=D // 20470
@Memory.add_node // 20471
D=A // 20472
@13 // 20473
M=D // 20474
@Memory.deAlloc.ret.7 // 20475
D=A // 20476
@CALL // 20477
0;JMP // 20478
(Memory.deAlloc.ret.7)

////PopInstruction{address=temp 0}
@SP // 20479
AM=M-1 // 20480
D=M // 20481
@5 // 20482
M=D // 20483

////PushInstruction("constant 0")
@SP // 20484
AM=M+1 // 20485
A=A-1 // 20486
M=0 // 20487

////ReturnInstruction{}
@RETURN // 20488
0;JMP // 20489

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 20490
AM=M+1 // 20491
A=A-1 // 20492
M=0 // 20493
@SP // 20494
AM=M+1 // 20495
A=A-1 // 20496
M=0 // 20497
@SP // 20498
AM=M+1 // 20499
A=A-1 // 20500
M=0 // 20501
@SP // 20502
AM=M+1 // 20503
A=A-1 // 20504
M=0 // 20505

////PushInstruction("argument 0")
@ARG // 20506
A=M // 20507
D=M // 20508
@SP // 20509
AM=M+1 // 20510
A=A-1 // 20511
M=D // 20512

////PushInstruction("constant 0")
@SP // 20513
AM=M+1 // 20514
A=A-1 // 20515
M=0 // 20516

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq17 // 20517
D=A // 20518
@13 // 20519
M=D // 20520
@SP // 20521
AM=M-1 // 20522
D=M // 20523
A=A-1 // 20524
D=M-D // 20525
@DO_EQ // 20526
0;JMP // 20527
(COMPARE_Memory.realloc_eq17)
@SP // 20528
A=M-1 // 20529
M=D // 20530

////PushInstruction("constant 0")
@SP // 20531
AM=M+1 // 20532
A=A-1 // 20533
M=0 // 20534

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq18 // 20535
D=A // 20536
@13 // 20537
M=D // 20538
@SP // 20539
AM=M-1 // 20540
D=M // 20541
A=A-1 // 20542
D=M-D // 20543
@DO_EQ // 20544
0;JMP // 20545
(COMPARE_Memory.realloc_eq18)
@SP // 20546
A=M-1 // 20547
M=D // 20548

////IfGotoInstruction{label='Memory.realloc.IfElse1}
// if-goto Memory.realloc.IfElse1
@SP // 20549
AM=M-1 // 20550
D=M // 20551
@Memory.realloc.IfElse1 // 20552
D;JNE // 20553

////PushInstruction("argument 1")
@ARG // 20554
A=M+1 // 20555
D=M // 20556
@SP // 20557
AM=M+1 // 20558
A=A-1 // 20559
M=D // 20560

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 20561
D=A // 20562
@14 // 20563
M=D // 20564
@Memory.alloc // 20565
D=A // 20566
@13 // 20567
M=D // 20568
@Memory.realloc.ret.0 // 20569
D=A // 20570
@CALL // 20571
0;JMP // 20572
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 20573
0;JMP // 20574

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 20575
0;JMP // 20576

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 20577
A=M // 20578
D=M // 20579
@SP // 20580
AM=M+1 // 20581
A=A-1 // 20582
M=D // 20583

////PushInstruction("constant 1")
@SP // 20584
AM=M+1 // 20585
A=A-1 // 20586
M=1 // 20587

////ArithmeticInstruction{SUB}
@SP // 20588
AM=M-1 // 20589
D=M // 20590
A=A-1 // 20591
M=M-D // 20592

////PopInstruction{address=local 3}
@SP // 20593
AM=M-1 // 20594
D=M // 20595
@LCL // 20596
A=M+1 // 20597
A=A+1 // 20598
A=A+1 // 20599
M=D // 20600

////PushInstruction("local 3")
@LCL // 20601
A=M+1 // 20602
A=A+1 // 20603
A=A+1 // 20604
D=M // 20605
@SP // 20606
AM=M+1 // 20607
A=A-1 // 20608
M=D // 20609

////PushInstruction("constant 0")
@SP // 20610
AM=M+1 // 20611
A=A-1 // 20612
M=0 // 20613

////ArithmeticInstruction{ADD}
@SP // 20614
AM=M-1 // 20615
D=M // 20616
A=A-1 // 20617
M=D+M // 20618

////PopInstruction{address=pointer 1}
@SP // 20619
AM=M-1 // 20620
D=M // 20621
@4 // 20622
M=D // 20623

////PushInstruction("that 0")
@THAT // 20624
A=M // 20625
D=M // 20626
@SP // 20627
AM=M+1 // 20628
A=A-1 // 20629
M=D // 20630

////PopInstruction{address=local 0}
@SP // 20631
AM=M-1 // 20632
D=M // 20633
@LCL // 20634
A=M // 20635
M=D // 20636

////PushInstruction("argument 1")
@ARG // 20637
A=M+1 // 20638
D=M // 20639
@SP // 20640
AM=M+1 // 20641
A=A-1 // 20642
M=D // 20643

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 20644
D=A // 20645
@14 // 20646
M=D // 20647
@Memory.alloc // 20648
D=A // 20649
@13 // 20650
M=D // 20651
@Memory.realloc.ret.1 // 20652
D=A // 20653
@CALL // 20654
0;JMP // 20655
(Memory.realloc.ret.1)

////PopInstruction{address=local 1}
@SP // 20656
AM=M-1 // 20657
D=M // 20658
@LCL // 20659
A=M+1 // 20660
M=D // 20661

////PushInstruction("local 1")
@LCL // 20662
A=M+1 // 20663
D=M // 20664
@SP // 20665
AM=M+1 // 20666
A=A-1 // 20667
M=D // 20668

////PushInstruction("constant 0")
@SP // 20669
AM=M+1 // 20670
A=A-1 // 20671
M=0 // 20672

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq19 // 20673
D=A // 20674
@13 // 20675
M=D // 20676
@SP // 20677
AM=M-1 // 20678
D=M // 20679
A=A-1 // 20680
D=M-D // 20681
@DO_EQ // 20682
0;JMP // 20683
(COMPARE_Memory.realloc_eq19)
@SP // 20684
A=M-1 // 20685
M=D // 20686

////PushInstruction("constant 0")
@SP // 20687
AM=M+1 // 20688
A=A-1 // 20689
M=0 // 20690

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq20 // 20691
D=A // 20692
@13 // 20693
M=D // 20694
@SP // 20695
AM=M-1 // 20696
D=M // 20697
A=A-1 // 20698
D=M-D // 20699
@DO_EQ // 20700
0;JMP // 20701
(COMPARE_Memory.realloc_eq20)
@SP // 20702
A=M-1 // 20703
M=D // 20704

////IfGotoInstruction{label='Memory.realloc.IfElse2}
// if-goto Memory.realloc.IfElse2
@SP // 20705
AM=M-1 // 20706
D=M // 20707
@Memory.realloc.IfElse2 // 20708
D;JNE // 20709

////PushInstruction("constant 0")
@SP // 20710
AM=M+1 // 20711
A=A-1 // 20712
M=0 // 20713

////ReturnInstruction{}
@RETURN // 20714
0;JMP // 20715

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 20716
0;JMP // 20717

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

////PushInstruction("local 0")
@LCL // 20718
A=M // 20719
D=M // 20720
@SP // 20721
AM=M+1 // 20722
A=A-1 // 20723
M=D // 20724

////PushInstruction("argument 1")
@ARG // 20725
A=M+1 // 20726
D=M // 20727
@SP // 20728
AM=M+1 // 20729
A=A-1 // 20730
M=D // 20731

////ArithmeticInstruction{GT}
@COMPARE_Memory.realloc_gt21 // 20732
D=A // 20733
@13 // 20734
M=D // 20735
@SP // 20736
AM=M-1 // 20737
D=M // 20738
A=A-1 // 20739
D=M-D // 20740
@DO_GT // 20741
0;JMP // 20742
(COMPARE_Memory.realloc_gt21)
@SP // 20743
A=M-1 // 20744
M=D // 20745

////ArithmeticInstruction{NOT}
@SP // 20746
A=M-1 // 20747
M=!M // 20748

////PushInstruction("constant 0")
@SP // 20749
AM=M+1 // 20750
A=A-1 // 20751
M=0 // 20752

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq22 // 20753
D=A // 20754
@13 // 20755
M=D // 20756
@SP // 20757
AM=M-1 // 20758
D=M // 20759
A=A-1 // 20760
D=M-D // 20761
@DO_EQ // 20762
0;JMP // 20763
(COMPARE_Memory.realloc_eq22)
@SP // 20764
A=M-1 // 20765
M=D // 20766

////IfGotoInstruction{label='Memory.realloc.IfElse3}
// if-goto Memory.realloc.IfElse3
@SP // 20767
AM=M-1 // 20768
D=M // 20769
@Memory.realloc.IfElse3 // 20770
D;JNE // 20771

////PushInstruction("local 0")
@LCL // 20772
A=M // 20773
D=M // 20774
@SP // 20775
AM=M+1 // 20776
A=A-1 // 20777
M=D // 20778

////PopInstruction{address=local 2}
@SP // 20779
AM=M-1 // 20780
D=M // 20781
@LCL // 20782
A=M+1 // 20783
A=A+1 // 20784
M=D // 20785

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 20786
0;JMP // 20787

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushInstruction("argument 1")
@ARG // 20788
A=M+1 // 20789
D=M // 20790
@SP // 20791
AM=M+1 // 20792
A=A-1 // 20793
M=D // 20794

////PopInstruction{address=local 2}
@SP // 20795
AM=M-1 // 20796
D=M // 20797
@LCL // 20798
A=M+1 // 20799
A=A+1 // 20800
M=D // 20801

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 20802
A=M // 20803
D=M // 20804
@SP // 20805
AM=M+1 // 20806
A=A-1 // 20807
M=D // 20808

////PushInstruction("local 1")
@LCL // 20809
A=M+1 // 20810
D=M // 20811
@SP // 20812
AM=M+1 // 20813
A=A-1 // 20814
M=D // 20815

////PushInstruction("local 2")
@LCL // 20816
A=M+1 // 20817
A=A+1 // 20818
D=M // 20819
@SP // 20820
AM=M+1 // 20821
A=A-1 // 20822
M=D // 20823

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.copy
@8 // 20824
D=A // 20825
@14 // 20826
M=D // 20827
@Memory.copy // 20828
D=A // 20829
@13 // 20830
M=D // 20831
@Memory.realloc.ret.2 // 20832
D=A // 20833
@CALL // 20834
0;JMP // 20835
(Memory.realloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 20836
AM=M-1 // 20837
D=M // 20838
@5 // 20839
M=D // 20840

////PushInstruction("argument 0")
@ARG // 20841
A=M // 20842
D=M // 20843
@SP // 20844
AM=M+1 // 20845
A=A-1 // 20846
M=D // 20847

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.deAlloc
@6 // 20848
D=A // 20849
@14 // 20850
M=D // 20851
@Memory.deAlloc // 20852
D=A // 20853
@13 // 20854
M=D // 20855
@Memory.realloc.ret.3 // 20856
D=A // 20857
@CALL // 20858
0;JMP // 20859
(Memory.realloc.ret.3)

////PopInstruction{address=temp 0}
@SP // 20860
AM=M-1 // 20861
D=M // 20862
@5 // 20863
M=D // 20864

////PushInstruction("local 1")
@LCL // 20865
A=M+1 // 20866
D=M // 20867
@SP // 20868
AM=M+1 // 20869
A=A-1 // 20870
M=D // 20871

////ReturnInstruction{}
@RETURN // 20872
0;JMP // 20873

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 20874
AM=M+1 // 20875
A=A-1 // 20876
M=0 // 20877

////PushInstruction("constant 0")
@SP // 20878
AM=M+1 // 20879
A=A-1 // 20880
M=0 // 20881

////PopInstruction{address=local 0}
@SP // 20882
AM=M-1 // 20883
D=M // 20884
@LCL // 20885
A=M // 20886
M=D // 20887

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////PushInstruction("local 0")
@LCL // 20888
A=M // 20889
D=M // 20890
@SP // 20891
AM=M+1 // 20892
A=A-1 // 20893
M=D // 20894

////PushInstruction("argument 2")
@ARG // 20895
A=M+1 // 20896
A=A+1 // 20897
D=M // 20898
@SP // 20899
AM=M+1 // 20900
A=A-1 // 20901
M=D // 20902

////ArithmeticInstruction{LT}
@COMPARE_Memory.copy_lt23 // 20903
D=A // 20904
@13 // 20905
M=D // 20906
@SP // 20907
AM=M-1 // 20908
D=M // 20909
A=A-1 // 20910
D=M-D // 20911
@DO_LT // 20912
0;JMP // 20913
(COMPARE_Memory.copy_lt23)
@SP // 20914
A=M-1 // 20915
M=D // 20916

////PushInstruction("constant 0")
@SP // 20917
AM=M+1 // 20918
A=A-1 // 20919
M=0 // 20920

////ArithmeticInstruction{EQ}
@COMPARE_Memory.copy_eq24 // 20921
D=A // 20922
@13 // 20923
M=D // 20924
@SP // 20925
AM=M-1 // 20926
D=M // 20927
A=A-1 // 20928
D=M-D // 20929
@DO_EQ // 20930
0;JMP // 20931
(COMPARE_Memory.copy_eq24)
@SP // 20932
A=M-1 // 20933
M=D // 20934

////IfGotoInstruction{label='WHILE_END_Memory.copy1}
// if-goto WHILE_END_Memory.copy1
@SP // 20935
AM=M-1 // 20936
D=M // 20937
@WHILE_END_Memory.copy1 // 20938
D;JNE // 20939

////PushInstruction("argument 0")
@ARG // 20940
A=M // 20941
D=M // 20942
@SP // 20943
AM=M+1 // 20944
A=A-1 // 20945
M=D // 20946

////PushInstruction("local 0")
@LCL // 20947
A=M // 20948
D=M // 20949
@SP // 20950
AM=M+1 // 20951
A=A-1 // 20952
M=D // 20953

////ArithmeticInstruction{ADD}
@SP // 20954
AM=M-1 // 20955
D=M // 20956
A=A-1 // 20957
M=D+M // 20958

////PopInstruction{address=pointer 1}
@SP // 20959
AM=M-1 // 20960
D=M // 20961
@4 // 20962
M=D // 20963

////PushInstruction("that 0")
@THAT // 20964
A=M // 20965
D=M // 20966
@SP // 20967
AM=M+1 // 20968
A=A-1 // 20969
M=D // 20970

////PushInstruction("argument 1")
@ARG // 20971
A=M+1 // 20972
D=M // 20973
@SP // 20974
AM=M+1 // 20975
A=A-1 // 20976
M=D // 20977

////PushInstruction("local 0")
@LCL // 20978
A=M // 20979
D=M // 20980
@SP // 20981
AM=M+1 // 20982
A=A-1 // 20983
M=D // 20984

////ArithmeticInstruction{ADD}
@SP // 20985
AM=M-1 // 20986
D=M // 20987
A=A-1 // 20988
M=D+M // 20989

////PopInstruction{address=pointer 1}
@SP // 20990
AM=M-1 // 20991
D=M // 20992
@4 // 20993
M=D // 20994

////PopInstruction{address=that 0}
@SP // 20995
AM=M-1 // 20996
D=M // 20997
@THAT // 20998
A=M // 20999
M=D // 21000

////PushInstruction("local 0")
@LCL // 21001
A=M // 21002
D=M // 21003
@SP // 21004
AM=M+1 // 21005
A=A-1 // 21006
M=D // 21007

////PushInstruction("constant 1")
@SP // 21008
AM=M+1 // 21009
A=A-1 // 21010
M=1 // 21011

////ArithmeticInstruction{ADD}
@SP // 21012
AM=M-1 // 21013
D=M // 21014
A=A-1 // 21015
M=D+M // 21016

////PopInstruction{address=local 0}
@SP // 21017
AM=M-1 // 21018
D=M // 21019
@LCL // 21020
A=M // 21021
M=D // 21022

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 21023
0;JMP // 21024

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 21025
AM=M+1 // 21026
A=A-1 // 21027
M=0 // 21028

////ReturnInstruction{}
@RETURN // 21029
0;JMP // 21030

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////PushInstruction("argument 1")
@ARG // 21031
A=M+1 // 21032
D=M // 21033
@SP // 21034
AM=M+1 // 21035
A=A-1 // 21036
M=D // 21037

////PushInstruction("constant 2")
@2 // 21038
D=A // 21039
@SP // 21040
AM=M+1 // 21041
A=A-1 // 21042
M=D // 21043

////ArithmeticInstruction{ADD}
@SP // 21044
AM=M-1 // 21045
D=M // 21046
A=A-1 // 21047
M=D+M // 21048

////PopInstruction{address=pointer 1}
@SP // 21049
AM=M-1 // 21050
D=M // 21051
@4 // 21052
M=D // 21053

////PushInstruction("that 0")
@THAT // 21054
A=M // 21055
D=M // 21056
@SP // 21057
AM=M+1 // 21058
A=A-1 // 21059
M=D // 21060

////PushInstruction("constant 0")
@SP // 21061
AM=M+1 // 21062
A=A-1 // 21063
M=0 // 21064

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq25 // 21065
D=A // 21066
@13 // 21067
M=D // 21068
@SP // 21069
AM=M-1 // 21070
D=M // 21071
A=A-1 // 21072
D=M-D // 21073
@DO_EQ // 21074
0;JMP // 21075
(COMPARE_Memory.remove_node_eq25)
@SP // 21076
A=M-1 // 21077
M=D // 21078

////ArithmeticInstruction{NOT}
@SP // 21079
A=M-1 // 21080
M=!M // 21081

////PushInstruction("constant 0")
@SP // 21082
AM=M+1 // 21083
A=A-1 // 21084
M=0 // 21085

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq26 // 21086
D=A // 21087
@13 // 21088
M=D // 21089
@SP // 21090
AM=M-1 // 21091
D=M // 21092
A=A-1 // 21093
D=M-D // 21094
@DO_EQ // 21095
0;JMP // 21096
(COMPARE_Memory.remove_node_eq26)
@SP // 21097
A=M-1 // 21098
M=D // 21099

////IfGotoInstruction{label='Memory.remove_node.IfElse1}
// if-goto Memory.remove_node.IfElse1
@SP // 21100
AM=M-1 // 21101
D=M // 21102
@Memory.remove_node.IfElse1 // 21103
D;JNE // 21104

////PushInstruction("argument 1")
@ARG // 21105
A=M+1 // 21106
D=M // 21107
@SP // 21108
AM=M+1 // 21109
A=A-1 // 21110
M=D // 21111

////PushInstruction("constant 3")
@3 // 21112
D=A // 21113
@SP // 21114
AM=M+1 // 21115
A=A-1 // 21116
M=D // 21117

////ArithmeticInstruction{ADD}
@SP // 21118
AM=M-1 // 21119
D=M // 21120
A=A-1 // 21121
M=D+M // 21122

////PopInstruction{address=pointer 1}
@SP // 21123
AM=M-1 // 21124
D=M // 21125
@4 // 21126
M=D // 21127

////PushInstruction("that 0")
@THAT // 21128
A=M // 21129
D=M // 21130
@SP // 21131
AM=M+1 // 21132
A=A-1 // 21133
M=D // 21134

////PushInstruction("argument 1")
@ARG // 21135
A=M+1 // 21136
D=M // 21137
@SP // 21138
AM=M+1 // 21139
A=A-1 // 21140
M=D // 21141

////PushInstruction("constant 2")
@2 // 21142
D=A // 21143
@SP // 21144
AM=M+1 // 21145
A=A-1 // 21146
M=D // 21147

////ArithmeticInstruction{ADD}
@SP // 21148
AM=M-1 // 21149
D=M // 21150
A=A-1 // 21151
M=D+M // 21152

////PushInstruction("constant 3")
@3 // 21153
D=A // 21154
@SP // 21155
AM=M+1 // 21156
A=A-1 // 21157
M=D // 21158

////ArithmeticInstruction{ADD}
@SP // 21159
AM=M-1 // 21160
D=M // 21161
A=A-1 // 21162
M=D+M // 21163

////PopInstruction{address=pointer 1}
@SP // 21164
AM=M-1 // 21165
D=M // 21166
@4 // 21167
M=D // 21168

////PopInstruction{address=that 0}
@SP // 21169
AM=M-1 // 21170
D=M // 21171
@THAT // 21172
A=M // 21173
M=D // 21174

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 21175
0;JMP // 21176

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushInstruction("argument 1")
@ARG // 21177
A=M+1 // 21178
D=M // 21179
@SP // 21180
AM=M+1 // 21181
A=A-1 // 21182
M=D // 21183

////PushInstruction("constant 3")
@3 // 21184
D=A // 21185
@SP // 21186
AM=M+1 // 21187
A=A-1 // 21188
M=D // 21189

////ArithmeticInstruction{ADD}
@SP // 21190
AM=M-1 // 21191
D=M // 21192
A=A-1 // 21193
M=D+M // 21194

////PopInstruction{address=pointer 1}
@SP // 21195
AM=M-1 // 21196
D=M // 21197
@4 // 21198
M=D // 21199

////PushInstruction("that 0")
@THAT // 21200
A=M // 21201
D=M // 21202
@SP // 21203
AM=M+1 // 21204
A=A-1 // 21205
M=D // 21206

////PushInstruction("argument 0")
@ARG // 21207
A=M // 21208
D=M // 21209
@SP // 21210
AM=M+1 // 21211
A=A-1 // 21212
M=D // 21213

////PushInstruction("constant 0")
@SP // 21214
AM=M+1 // 21215
A=A-1 // 21216
M=0 // 21217

////ArithmeticInstruction{ADD}
@SP // 21218
AM=M-1 // 21219
D=M // 21220
A=A-1 // 21221
M=D+M // 21222

////PopInstruction{address=pointer 1}
@SP // 21223
AM=M-1 // 21224
D=M // 21225
@4 // 21226
M=D // 21227

////PopInstruction{address=that 0}
@SP // 21228
AM=M-1 // 21229
D=M // 21230
@THAT // 21231
A=M // 21232
M=D // 21233

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 21234
A=M+1 // 21235
D=M // 21236
@SP // 21237
AM=M+1 // 21238
A=A-1 // 21239
M=D // 21240

////PushInstruction("constant 3")
@3 // 21241
D=A // 21242
@SP // 21243
AM=M+1 // 21244
A=A-1 // 21245
M=D // 21246

////ArithmeticInstruction{ADD}
@SP // 21247
AM=M-1 // 21248
D=M // 21249
A=A-1 // 21250
M=D+M // 21251

////PopInstruction{address=pointer 1}
@SP // 21252
AM=M-1 // 21253
D=M // 21254
@4 // 21255
M=D // 21256

////PushInstruction("that 0")
@THAT // 21257
A=M // 21258
D=M // 21259
@SP // 21260
AM=M+1 // 21261
A=A-1 // 21262
M=D // 21263

////PushInstruction("constant 0")
@SP // 21264
AM=M+1 // 21265
A=A-1 // 21266
M=0 // 21267

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq27 // 21268
D=A // 21269
@13 // 21270
M=D // 21271
@SP // 21272
AM=M-1 // 21273
D=M // 21274
A=A-1 // 21275
D=M-D // 21276
@DO_EQ // 21277
0;JMP // 21278
(COMPARE_Memory.remove_node_eq27)
@SP // 21279
A=M-1 // 21280
M=D // 21281

////ArithmeticInstruction{NOT}
@SP // 21282
A=M-1 // 21283
M=!M // 21284

////PushInstruction("constant 0")
@SP // 21285
AM=M+1 // 21286
A=A-1 // 21287
M=0 // 21288

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq28 // 21289
D=A // 21290
@13 // 21291
M=D // 21292
@SP // 21293
AM=M-1 // 21294
D=M // 21295
A=A-1 // 21296
D=M-D // 21297
@DO_EQ // 21298
0;JMP // 21299
(COMPARE_Memory.remove_node_eq28)
@SP // 21300
A=M-1 // 21301
M=D // 21302

////IfGotoInstruction{label='Memory.remove_node.IfElse2}
// if-goto Memory.remove_node.IfElse2
@SP // 21303
AM=M-1 // 21304
D=M // 21305
@Memory.remove_node.IfElse2 // 21306
D;JNE // 21307

////PushInstruction("argument 1")
@ARG // 21308
A=M+1 // 21309
D=M // 21310
@SP // 21311
AM=M+1 // 21312
A=A-1 // 21313
M=D // 21314

////PushInstruction("constant 2")
@2 // 21315
D=A // 21316
@SP // 21317
AM=M+1 // 21318
A=A-1 // 21319
M=D // 21320

////ArithmeticInstruction{ADD}
@SP // 21321
AM=M-1 // 21322
D=M // 21323
A=A-1 // 21324
M=D+M // 21325

////PopInstruction{address=pointer 1}
@SP // 21326
AM=M-1 // 21327
D=M // 21328
@4 // 21329
M=D // 21330

////PushInstruction("that 0")
@THAT // 21331
A=M // 21332
D=M // 21333
@SP // 21334
AM=M+1 // 21335
A=A-1 // 21336
M=D // 21337

////PushInstruction("argument 1")
@ARG // 21338
A=M+1 // 21339
D=M // 21340
@SP // 21341
AM=M+1 // 21342
A=A-1 // 21343
M=D // 21344

////PushInstruction("constant 3")
@3 // 21345
D=A // 21346
@SP // 21347
AM=M+1 // 21348
A=A-1 // 21349
M=D // 21350

////ArithmeticInstruction{ADD}
@SP // 21351
AM=M-1 // 21352
D=M // 21353
A=A-1 // 21354
M=D+M // 21355

////PushInstruction("constant 2")
@2 // 21356
D=A // 21357
@SP // 21358
AM=M+1 // 21359
A=A-1 // 21360
M=D // 21361

////ArithmeticInstruction{ADD}
@SP // 21362
AM=M-1 // 21363
D=M // 21364
A=A-1 // 21365
M=D+M // 21366

////PopInstruction{address=pointer 1}
@SP // 21367
AM=M-1 // 21368
D=M // 21369
@4 // 21370
M=D // 21371

////PopInstruction{address=that 0}
@SP // 21372
AM=M-1 // 21373
D=M // 21374
@THAT // 21375
A=M // 21376
M=D // 21377

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 21378
0;JMP // 21379

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 21380
AM=M+1 // 21381
A=A-1 // 21382
M=0 // 21383

////PushInstruction("argument 1")
@ARG // 21384
A=M+1 // 21385
D=M // 21386
@SP // 21387
AM=M+1 // 21388
A=A-1 // 21389
M=D // 21390

////PushInstruction("constant 2")
@2 // 21391
D=A // 21392
@SP // 21393
AM=M+1 // 21394
A=A-1 // 21395
M=D // 21396

////ArithmeticInstruction{ADD}
@SP // 21397
AM=M-1 // 21398
D=M // 21399
A=A-1 // 21400
M=D+M // 21401

////PopInstruction{address=pointer 1}
@SP // 21402
AM=M-1 // 21403
D=M // 21404
@4 // 21405
M=D // 21406

////PopInstruction{address=that 0}
@SP // 21407
AM=M-1 // 21408
D=M // 21409
@THAT // 21410
A=M // 21411
M=D // 21412

////PushInstruction("constant 0")
@SP // 21413
AM=M+1 // 21414
A=A-1 // 21415
M=0 // 21416

////PushInstruction("argument 1")
@ARG // 21417
A=M+1 // 21418
D=M // 21419
@SP // 21420
AM=M+1 // 21421
A=A-1 // 21422
M=D // 21423

////PushInstruction("constant 3")
@3 // 21424
D=A // 21425
@SP // 21426
AM=M+1 // 21427
A=A-1 // 21428
M=D // 21429

////ArithmeticInstruction{ADD}
@SP // 21430
AM=M-1 // 21431
D=M // 21432
A=A-1 // 21433
M=D+M // 21434

////PopInstruction{address=pointer 1}
@SP // 21435
AM=M-1 // 21436
D=M // 21437
@4 // 21438
M=D // 21439

////PopInstruction{address=that 0}
@SP // 21440
AM=M-1 // 21441
D=M // 21442
@THAT // 21443
A=M // 21444
M=D // 21445

////PushInstruction("constant 0")
@SP // 21446
AM=M+1 // 21447
A=A-1 // 21448
M=0 // 21449

////ReturnInstruction{}
@RETURN // 21450
0;JMP // 21451

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 21452
AM=M+1 // 21453
A=A-1 // 21454
M=0 // 21455

////PushInstruction("constant 0")
@SP // 21456
AM=M+1 // 21457
A=A-1 // 21458
M=0 // 21459

////PopInstruction{address=local 0}
@SP // 21460
AM=M-1 // 21461
D=M // 21462
@LCL // 21463
A=M // 21464
M=D // 21465

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

////PushInstruction("local 0")
@LCL // 21466
A=M // 21467
D=M // 21468
@SP // 21469
AM=M+1 // 21470
A=A-1 // 21471
M=D // 21472

////PushInstruction("constant 7")
@7 // 21473
D=A // 21474
@SP // 21475
AM=M+1 // 21476
A=A-1 // 21477
M=D // 21478

////ArithmeticInstruction{LT}
@COMPARE_Memory.getBinIndex_lt29 // 21479
D=A // 21480
@13 // 21481
M=D // 21482
@SP // 21483
AM=M-1 // 21484
D=M // 21485
A=A-1 // 21486
D=M-D // 21487
@DO_LT // 21488
0;JMP // 21489
(COMPARE_Memory.getBinIndex_lt29)
@SP // 21490
A=M-1 // 21491
M=D // 21492

////PushInstruction("constant 2048")
@2048 // 21493
D=A // 21494
@SP // 21495
AM=M+1 // 21496
A=A-1 // 21497
M=D // 21498

////PushInstruction("local 0")
@LCL // 21499
A=M // 21500
D=M // 21501
@SP // 21502
AM=M+1 // 21503
A=A-1 // 21504
M=D // 21505

////ArithmeticInstruction{ADD}
@SP // 21506
AM=M-1 // 21507
D=M // 21508
A=A-1 // 21509
M=D+M // 21510

////PopInstruction{address=pointer 1}
@SP // 21511
AM=M-1 // 21512
D=M // 21513
@4 // 21514
M=D // 21515

////PushInstruction("that 0")
@THAT // 21516
A=M // 21517
D=M // 21518
@SP // 21519
AM=M+1 // 21520
A=A-1 // 21521
M=D // 21522

////PushInstruction("constant 0")
@SP // 21523
AM=M+1 // 21524
A=A-1 // 21525
M=0 // 21526

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq30 // 21527
D=A // 21528
@13 // 21529
M=D // 21530
@SP // 21531
AM=M-1 // 21532
D=M // 21533
A=A-1 // 21534
D=M-D // 21535
@DO_EQ // 21536
0;JMP // 21537
(COMPARE_Memory.getBinIndex_eq30)
@SP // 21538
A=M-1 // 21539
M=D // 21540

////ArithmeticInstruction{NOT}
@SP // 21541
A=M-1 // 21542
M=!M // 21543

////ArithmeticInstruction{AND}
@SP // 21544
AM=M-1 // 21545
D=M // 21546
A=A-1 // 21547
M=D&M // 21548

////PushInstruction("constant 0")
@SP // 21549
AM=M+1 // 21550
A=A-1 // 21551
M=0 // 21552

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq31 // 21553
D=A // 21554
@13 // 21555
M=D // 21556
@SP // 21557
AM=M-1 // 21558
D=M // 21559
A=A-1 // 21560
D=M-D // 21561
@DO_EQ // 21562
0;JMP // 21563
(COMPARE_Memory.getBinIndex_eq31)
@SP // 21564
A=M-1 // 21565
M=D // 21566

////IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}
// if-goto WHILE_END_Memory.getBinIndex1
@SP // 21567
AM=M-1 // 21568
D=M // 21569
@WHILE_END_Memory.getBinIndex1 // 21570
D;JNE // 21571

////PushInstruction("argument 0")
@ARG // 21572
A=M // 21573
D=M // 21574
@SP // 21575
AM=M+1 // 21576
A=A-1 // 21577
M=D // 21578

////PushInstruction("local 0")
@LCL // 21579
A=M // 21580
D=M // 21581
@SP // 21582
AM=M+1 // 21583
A=A-1 // 21584
M=D // 21585

////PushInstruction("constant 1")
@SP // 21586
AM=M+1 // 21587
A=A-1 // 21588
M=1 // 21589

////ArithmeticInstruction{ADD}
@SP // 21590
AM=M-1 // 21591
D=M // 21592
A=A-1 // 21593
M=D+M // 21594

////PushInstruction("constant 16")
@16 // 21595
D=A // 21596
@SP // 21597
AM=M+1 // 21598
A=A-1 // 21599
M=D // 21600

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}
// call Math.multiply
@7 // 21601
D=A // 21602
@14 // 21603
M=D // 21604
@Math.multiply // 21605
D=A // 21606
@13 // 21607
M=D // 21608
@Memory.getBinIndex.ret.0 // 21609
D=A // 21610
@CALL // 21611
0;JMP // 21612
(Memory.getBinIndex.ret.0)

////ArithmeticInstruction{GT}
@COMPARE_Memory.getBinIndex_gt32 // 21613
D=A // 21614
@13 // 21615
M=D // 21616
@SP // 21617
AM=M-1 // 21618
D=M // 21619
A=A-1 // 21620
D=M-D // 21621
@DO_GT // 21622
0;JMP // 21623
(COMPARE_Memory.getBinIndex_gt32)
@SP // 21624
A=M-1 // 21625
M=D // 21626

////ArithmeticInstruction{NOT}
@SP // 21627
A=M-1 // 21628
M=!M // 21629

////PushInstruction("constant 0")
@SP // 21630
AM=M+1 // 21631
A=A-1 // 21632
M=0 // 21633

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq33 // 21634
D=A // 21635
@13 // 21636
M=D // 21637
@SP // 21638
AM=M-1 // 21639
D=M // 21640
A=A-1 // 21641
D=M-D // 21642
@DO_EQ // 21643
0;JMP // 21644
(COMPARE_Memory.getBinIndex_eq33)
@SP // 21645
A=M-1 // 21646
M=D // 21647

////IfGotoInstruction{label='Memory.getBinIndex.IfElse1}
// if-goto Memory.getBinIndex.IfElse1
@SP // 21648
AM=M-1 // 21649
D=M // 21650
@Memory.getBinIndex.IfElse1 // 21651
D;JNE // 21652

////PushInstruction("local 0")
@LCL // 21653
A=M // 21654
D=M // 21655
@SP // 21656
AM=M+1 // 21657
A=A-1 // 21658
M=D // 21659

////ReturnInstruction{}
@RETURN // 21660
0;JMP // 21661

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 21662
0;JMP // 21663

////LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)

////LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)

////PushInstruction("local 0")
@LCL // 21664
A=M // 21665
D=M // 21666
@SP // 21667
AM=M+1 // 21668
A=A-1 // 21669
M=D // 21670

////PushInstruction("constant 1")
@SP // 21671
AM=M+1 // 21672
A=A-1 // 21673
M=1 // 21674

////ArithmeticInstruction{ADD}
@SP // 21675
AM=M-1 // 21676
D=M // 21677
A=A-1 // 21678
M=D+M // 21679

////PopInstruction{address=local 0}
@SP // 21680
AM=M-1 // 21681
D=M // 21682
@LCL // 21683
A=M // 21684
M=D // 21685

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 21686
0;JMP // 21687

////LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)

////PushInstruction("constant 7")
@7 // 21688
D=A // 21689
@SP // 21690
AM=M+1 // 21691
A=A-1 // 21692
M=D // 21693

////PushInstruction("constant 1")
@SP // 21694
AM=M+1 // 21695
A=A-1 // 21696
M=1 // 21697

////ArithmeticInstruction{SUB}
@SP // 21698
AM=M-1 // 21699
D=M // 21700
A=A-1 // 21701
M=M-D // 21702

////ReturnInstruction{}
@RETURN // 21703
0;JMP // 21704

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 21705
AM=M+1 // 21706
A=A-1 // 21707
M=0 // 21708

////PushInstruction("argument 0")
@ARG // 21709
A=M // 21710
D=M // 21711
@SP // 21712
AM=M+1 // 21713
A=A-1 // 21714
M=D // 21715

////PushInstruction("constant 0")
@SP // 21716
AM=M+1 // 21717
A=A-1 // 21718
M=0 // 21719

////ArithmeticInstruction{ADD}
@SP // 21720
AM=M-1 // 21721
D=M // 21722
A=A-1 // 21723
M=D+M // 21724

////PopInstruction{address=pointer 1}
@SP // 21725
AM=M-1 // 21726
D=M // 21727
@4 // 21728
M=D // 21729

////PushInstruction("that 0")
@THAT // 21730
A=M // 21731
D=M // 21732
@SP // 21733
AM=M+1 // 21734
A=A-1 // 21735
M=D // 21736

////PopInstruction{address=local 0}
@SP // 21737
AM=M-1 // 21738
D=M // 21739
@LCL // 21740
A=M // 21741
M=D // 21742

////PushInstruction("local 0")
@LCL // 21743
A=M // 21744
D=M // 21745
@SP // 21746
AM=M+1 // 21747
A=A-1 // 21748
M=D // 21749

////PushInstruction("constant 0")
@SP // 21750
AM=M+1 // 21751
A=A-1 // 21752
M=0 // 21753

////ArithmeticInstruction{ADD}
@SP // 21754
AM=M-1 // 21755
D=M // 21756
A=A-1 // 21757
M=D+M // 21758

////PopInstruction{address=pointer 1}
@SP // 21759
AM=M-1 // 21760
D=M // 21761
@4 // 21762
M=D // 21763

////PushInstruction("that 0")
@THAT // 21764
A=M // 21765
D=M // 21766
@SP // 21767
AM=M+1 // 21768
A=A-1 // 21769
M=D // 21770

////PushInstruction("argument 1")
@ARG // 21771
A=M+1 // 21772
D=M // 21773
@SP // 21774
AM=M+1 // 21775
A=A-1 // 21776
M=D // 21777

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt34 // 21778
D=A // 21779
@13 // 21780
M=D // 21781
@SP // 21782
AM=M-1 // 21783
D=M // 21784
A=A-1 // 21785
D=M-D // 21786
@DO_LT // 21787
0;JMP // 21788
(COMPARE_Memory.get_best_fit_lt34)
@SP // 21789
A=M-1 // 21790
M=D // 21791

////ArithmeticInstruction{NOT}
@SP // 21792
A=M-1 // 21793
M=!M // 21794

////PushInstruction("constant 0")
@SP // 21795
AM=M+1 // 21796
A=A-1 // 21797
M=0 // 21798

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq35 // 21799
D=A // 21800
@13 // 21801
M=D // 21802
@SP // 21803
AM=M-1 // 21804
D=M // 21805
A=A-1 // 21806
D=M-D // 21807
@DO_EQ // 21808
0;JMP // 21809
(COMPARE_Memory.get_best_fit_eq35)
@SP // 21810
A=M-1 // 21811
M=D // 21812

////IfGotoInstruction{label='Memory.get_best_fit.IfElse1}
// if-goto Memory.get_best_fit.IfElse1
@SP // 21813
AM=M-1 // 21814
D=M // 21815
@Memory.get_best_fit.IfElse1 // 21816
D;JNE // 21817

////PushInstruction("local 0")
@LCL // 21818
A=M // 21819
D=M // 21820
@SP // 21821
AM=M+1 // 21822
A=A-1 // 21823
M=D // 21824

////ReturnInstruction{}
@RETURN // 21825
0;JMP // 21826

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 21827
0;JMP // 21828

////LabelInstruction{label='Memory.get_best_fit.IfElse1}
// label Memory.get_best_fit.IfElse1
(Memory.get_best_fit.IfElse1)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND1}
// label Memory.get_best_fit.IfElseEND1
(Memory.get_best_fit.IfElseEND1)

////LabelInstruction{label='WHILE_START_Memory.get_best_fit1}
// label WHILE_START_Memory.get_best_fit1
(WHILE_START_Memory.get_best_fit1)

////PushInstruction("local 0")
@LCL // 21829
A=M // 21830
D=M // 21831
@SP // 21832
AM=M+1 // 21833
A=A-1 // 21834
M=D // 21835

////PushInstruction("constant 3")
@3 // 21836
D=A // 21837
@SP // 21838
AM=M+1 // 21839
A=A-1 // 21840
M=D // 21841

////ArithmeticInstruction{ADD}
@SP // 21842
AM=M-1 // 21843
D=M // 21844
A=A-1 // 21845
M=D+M // 21846

////PopInstruction{address=pointer 1}
@SP // 21847
AM=M-1 // 21848
D=M // 21849
@4 // 21850
M=D // 21851

////PushInstruction("that 0")
@THAT // 21852
A=M // 21853
D=M // 21854
@SP // 21855
AM=M+1 // 21856
A=A-1 // 21857
M=D // 21858

////PushInstruction("constant 0")
@SP // 21859
AM=M+1 // 21860
A=A-1 // 21861
M=0 // 21862

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq36 // 21863
D=A // 21864
@13 // 21865
M=D // 21866
@SP // 21867
AM=M-1 // 21868
D=M // 21869
A=A-1 // 21870
D=M-D // 21871
@DO_EQ // 21872
0;JMP // 21873
(COMPARE_Memory.get_best_fit_eq36)
@SP // 21874
A=M-1 // 21875
M=D // 21876

////ArithmeticInstruction{NOT}
@SP // 21877
A=M-1 // 21878
M=!M // 21879

////PushInstruction("constant 0")
@SP // 21880
AM=M+1 // 21881
A=A-1 // 21882
M=0 // 21883

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq37 // 21884
D=A // 21885
@13 // 21886
M=D // 21887
@SP // 21888
AM=M-1 // 21889
D=M // 21890
A=A-1 // 21891
D=M-D // 21892
@DO_EQ // 21893
0;JMP // 21894
(COMPARE_Memory.get_best_fit_eq37)
@SP // 21895
A=M-1 // 21896
M=D // 21897

////IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}
// if-goto WHILE_END_Memory.get_best_fit1
@SP // 21898
AM=M-1 // 21899
D=M // 21900
@WHILE_END_Memory.get_best_fit1 // 21901
D;JNE // 21902

////PushInstruction("local 0")
@LCL // 21903
A=M // 21904
D=M // 21905
@SP // 21906
AM=M+1 // 21907
A=A-1 // 21908
M=D // 21909

////PushInstruction("constant 3")
@3 // 21910
D=A // 21911
@SP // 21912
AM=M+1 // 21913
A=A-1 // 21914
M=D // 21915

////ArithmeticInstruction{ADD}
@SP // 21916
AM=M-1 // 21917
D=M // 21918
A=A-1 // 21919
M=D+M // 21920

////PopInstruction{address=pointer 1}
@SP // 21921
AM=M-1 // 21922
D=M // 21923
@4 // 21924
M=D // 21925

////PushInstruction("that 0")
@THAT // 21926
A=M // 21927
D=M // 21928
@SP // 21929
AM=M+1 // 21930
A=A-1 // 21931
M=D // 21932

////PopInstruction{address=local 0}
@SP // 21933
AM=M-1 // 21934
D=M // 21935
@LCL // 21936
A=M // 21937
M=D // 21938

////PushInstruction("local 0")
@LCL // 21939
A=M // 21940
D=M // 21941
@SP // 21942
AM=M+1 // 21943
A=A-1 // 21944
M=D // 21945

////PushInstruction("constant 0")
@SP // 21946
AM=M+1 // 21947
A=A-1 // 21948
M=0 // 21949

////ArithmeticInstruction{ADD}
@SP // 21950
AM=M-1 // 21951
D=M // 21952
A=A-1 // 21953
M=D+M // 21954

////PopInstruction{address=pointer 1}
@SP // 21955
AM=M-1 // 21956
D=M // 21957
@4 // 21958
M=D // 21959

////PushInstruction("that 0")
@THAT // 21960
A=M // 21961
D=M // 21962
@SP // 21963
AM=M+1 // 21964
A=A-1 // 21965
M=D // 21966

////PushInstruction("argument 1")
@ARG // 21967
A=M+1 // 21968
D=M // 21969
@SP // 21970
AM=M+1 // 21971
A=A-1 // 21972
M=D // 21973

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt38 // 21974
D=A // 21975
@13 // 21976
M=D // 21977
@SP // 21978
AM=M-1 // 21979
D=M // 21980
A=A-1 // 21981
D=M-D // 21982
@DO_LT // 21983
0;JMP // 21984
(COMPARE_Memory.get_best_fit_lt38)
@SP // 21985
A=M-1 // 21986
M=D // 21987

////ArithmeticInstruction{NOT}
@SP // 21988
A=M-1 // 21989
M=!M // 21990

////PushInstruction("constant 0")
@SP // 21991
AM=M+1 // 21992
A=A-1 // 21993
M=0 // 21994

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq39 // 21995
D=A // 21996
@13 // 21997
M=D // 21998
@SP // 21999
AM=M-1 // 22000
D=M // 22001
A=A-1 // 22002
D=M-D // 22003
@DO_EQ // 22004
0;JMP // 22005
(COMPARE_Memory.get_best_fit_eq39)
@SP // 22006
A=M-1 // 22007
M=D // 22008

////IfGotoInstruction{label='Memory.get_best_fit.IfElse2}
// if-goto Memory.get_best_fit.IfElse2
@SP // 22009
AM=M-1 // 22010
D=M // 22011
@Memory.get_best_fit.IfElse2 // 22012
D;JNE // 22013

////PushInstruction("local 0")
@LCL // 22014
A=M // 22015
D=M // 22016
@SP // 22017
AM=M+1 // 22018
A=A-1 // 22019
M=D // 22020

////ReturnInstruction{}
@RETURN // 22021
0;JMP // 22022

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 22023
0;JMP // 22024

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 22025
0;JMP // 22026

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 22027
AM=M+1 // 22028
A=A-1 // 22029
M=0 // 22030

////ReturnInstruction{}
@RETURN // 22031
0;JMP // 22032

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushInstruction("argument 0")
@ARG // 22033
A=M // 22034
D=M // 22035
@SP // 22036
AM=M+1 // 22037
A=A-1 // 22038
M=D // 22039

////PushInstruction("argument 0")
@ARG // 22040
A=M // 22041
D=M // 22042
@SP // 22043
AM=M+1 // 22044
A=A-1 // 22045
M=D // 22046

////PushInstruction("argument 0")
@ARG // 22047
A=M // 22048
D=M // 22049
@SP // 22050
AM=M+1 // 22051
A=A-1 // 22052
M=D // 22053

////PushInstruction("constant 0")
@SP // 22054
AM=M+1 // 22055
A=A-1 // 22056
M=0 // 22057

////ArithmeticInstruction{ADD}
@SP // 22058
AM=M-1 // 22059
D=M // 22060
A=A-1 // 22061
M=D+M // 22062

////PopInstruction{address=pointer 1}
@SP // 22063
AM=M-1 // 22064
D=M // 22065
@4 // 22066
M=D // 22067

////PushInstruction("that 0")
@THAT // 22068
A=M // 22069
D=M // 22070
@SP // 22071
AM=M+1 // 22072
A=A-1 // 22073
M=D // 22074

////PushInstruction("constant 4")
@4 // 22075
D=A // 22076
@SP // 22077
AM=M+1 // 22078
A=A-1 // 22079
M=D // 22080

////ArithmeticInstruction{ADD}
@SP // 22081
AM=M-1 // 22082
D=M // 22083
A=A-1 // 22084
M=D+M // 22085

////ArithmeticInstruction{ADD}
@SP // 22086
AM=M-1 // 22087
D=M // 22088
A=A-1 // 22089
M=D+M // 22090

////PopInstruction{address=pointer 1}
@SP // 22091
AM=M-1 // 22092
D=M // 22093
@4 // 22094
M=D // 22095

////PopInstruction{address=that 0}
@SP // 22096
AM=M-1 // 22097
D=M // 22098
@THAT // 22099
A=M // 22100
M=D // 22101

////PushInstruction("constant 0")
@SP // 22102
AM=M+1 // 22103
A=A-1 // 22104
M=0 // 22105

////ReturnInstruction{}
@RETURN // 22106
0;JMP // 22107

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 22108
AM=M+1 // 22109
A=A-1 // 22110
M=0 // 22111
@SP // 22112
AM=M+1 // 22113
A=A-1 // 22114
M=0 // 22115

////PushInstruction("constant 0")
@SP // 22116
AM=M+1 // 22117
A=A-1 // 22118
M=0 // 22119

////PushInstruction("argument 1")
@ARG // 22120
A=M+1 // 22121
D=M // 22122
@SP // 22123
AM=M+1 // 22124
A=A-1 // 22125
M=D // 22126

////PushInstruction("constant 2")
@2 // 22127
D=A // 22128
@SP // 22129
AM=M+1 // 22130
A=A-1 // 22131
M=D // 22132

////ArithmeticInstruction{ADD}
@SP // 22133
AM=M-1 // 22134
D=M // 22135
A=A-1 // 22136
M=D+M // 22137

////PopInstruction{address=pointer 1}
@SP // 22138
AM=M-1 // 22139
D=M // 22140
@4 // 22141
M=D // 22142

////PopInstruction{address=that 0}
@SP // 22143
AM=M-1 // 22144
D=M // 22145
@THAT // 22146
A=M // 22147
M=D // 22148

////PushInstruction("constant 0")
@SP // 22149
AM=M+1 // 22150
A=A-1 // 22151
M=0 // 22152

////PushInstruction("argument 1")
@ARG // 22153
A=M+1 // 22154
D=M // 22155
@SP // 22156
AM=M+1 // 22157
A=A-1 // 22158
M=D // 22159

////PushInstruction("constant 3")
@3 // 22160
D=A // 22161
@SP // 22162
AM=M+1 // 22163
A=A-1 // 22164
M=D // 22165

////ArithmeticInstruction{ADD}
@SP // 22166
AM=M-1 // 22167
D=M // 22168
A=A-1 // 22169
M=D+M // 22170

////PopInstruction{address=pointer 1}
@SP // 22171
AM=M-1 // 22172
D=M // 22173
@4 // 22174
M=D // 22175

////PopInstruction{address=that 0}
@SP // 22176
AM=M-1 // 22177
D=M // 22178
@THAT // 22179
A=M // 22180
M=D // 22181

////PushInstruction("argument 0")
@ARG // 22182
A=M // 22183
D=M // 22184
@SP // 22185
AM=M+1 // 22186
A=A-1 // 22187
M=D // 22188

////PushInstruction("constant 0")
@SP // 22189
AM=M+1 // 22190
A=A-1 // 22191
M=0 // 22192

////ArithmeticInstruction{ADD}
@SP // 22193
AM=M-1 // 22194
D=M // 22195
A=A-1 // 22196
M=D+M // 22197

////PopInstruction{address=pointer 1}
@SP // 22198
AM=M-1 // 22199
D=M // 22200
@4 // 22201
M=D // 22202

////PushInstruction("that 0")
@THAT // 22203
A=M // 22204
D=M // 22205
@SP // 22206
AM=M+1 // 22207
A=A-1 // 22208
M=D // 22209

////PushInstruction("constant 0")
@SP // 22210
AM=M+1 // 22211
A=A-1 // 22212
M=0 // 22213

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq40 // 22214
D=A // 22215
@13 // 22216
M=D // 22217
@SP // 22218
AM=M-1 // 22219
D=M // 22220
A=A-1 // 22221
D=M-D // 22222
@DO_EQ // 22223
0;JMP // 22224
(COMPARE_Memory.add_node_eq40)
@SP // 22225
A=M-1 // 22226
M=D // 22227

////PushInstruction("constant 0")
@SP // 22228
AM=M+1 // 22229
A=A-1 // 22230
M=0 // 22231

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq41 // 22232
D=A // 22233
@13 // 22234
M=D // 22235
@SP // 22236
AM=M-1 // 22237
D=M // 22238
A=A-1 // 22239
D=M-D // 22240
@DO_EQ // 22241
0;JMP // 22242
(COMPARE_Memory.add_node_eq41)
@SP // 22243
A=M-1 // 22244
M=D // 22245

////IfGotoInstruction{label='Memory.add_node.IfElse1}
// if-goto Memory.add_node.IfElse1
@SP // 22246
AM=M-1 // 22247
D=M // 22248
@Memory.add_node.IfElse1 // 22249
D;JNE // 22250

////PushInstruction("argument 1")
@ARG // 22251
A=M+1 // 22252
D=M // 22253
@SP // 22254
AM=M+1 // 22255
A=A-1 // 22256
M=D // 22257

////PushInstruction("argument 0")
@ARG // 22258
A=M // 22259
D=M // 22260
@SP // 22261
AM=M+1 // 22262
A=A-1 // 22263
M=D // 22264

////PushInstruction("constant 0")
@SP // 22265
AM=M+1 // 22266
A=A-1 // 22267
M=0 // 22268

////ArithmeticInstruction{ADD}
@SP // 22269
AM=M-1 // 22270
D=M // 22271
A=A-1 // 22272
M=D+M // 22273

////PopInstruction{address=pointer 1}
@SP // 22274
AM=M-1 // 22275
D=M // 22276
@4 // 22277
M=D // 22278

////PopInstruction{address=that 0}
@SP // 22279
AM=M-1 // 22280
D=M // 22281
@THAT // 22282
A=M // 22283
M=D // 22284

////PushInstruction("constant 0")
@SP // 22285
AM=M+1 // 22286
A=A-1 // 22287
M=0 // 22288

////ReturnInstruction{}
@RETURN // 22289
0;JMP // 22290

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 22291
0;JMP // 22292

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 22293
A=M // 22294
D=M // 22295
@SP // 22296
AM=M+1 // 22297
A=A-1 // 22298
M=D // 22299

////PushInstruction("constant 0")
@SP // 22300
AM=M+1 // 22301
A=A-1 // 22302
M=0 // 22303

////ArithmeticInstruction{ADD}
@SP // 22304
AM=M-1 // 22305
D=M // 22306
A=A-1 // 22307
M=D+M // 22308

////PopInstruction{address=pointer 1}
@SP // 22309
AM=M-1 // 22310
D=M // 22311
@4 // 22312
M=D // 22313

////PushInstruction("that 0")
@THAT // 22314
A=M // 22315
D=M // 22316
@SP // 22317
AM=M+1 // 22318
A=A-1 // 22319
M=D // 22320

////PopInstruction{address=local 0}
@SP // 22321
AM=M-1 // 22322
D=M // 22323
@LCL // 22324
A=M // 22325
M=D // 22326

////PushInstruction("constant 0")
@SP // 22327
AM=M+1 // 22328
A=A-1 // 22329
M=0 // 22330

////PopInstruction{address=local 1}
@SP // 22331
AM=M-1 // 22332
D=M // 22333
@LCL // 22334
A=M+1 // 22335
M=D // 22336

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

////PushInstruction("local 0")
@LCL // 22337
A=M // 22338
D=M // 22339
@SP // 22340
AM=M+1 // 22341
A=A-1 // 22342
M=D // 22343

////PushInstruction("constant 0")
@SP // 22344
AM=M+1 // 22345
A=A-1 // 22346
M=0 // 22347

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq42 // 22348
D=A // 22349
@13 // 22350
M=D // 22351
@SP // 22352
AM=M-1 // 22353
D=M // 22354
A=A-1 // 22355
D=M-D // 22356
@DO_EQ // 22357
0;JMP // 22358
(COMPARE_Memory.add_node_eq42)
@SP // 22359
A=M-1 // 22360
M=D // 22361

////ArithmeticInstruction{NOT}
@SP // 22362
A=M-1 // 22363
M=!M // 22364

////PushInstruction("local 0")
@LCL // 22365
A=M // 22366
D=M // 22367
@SP // 22368
AM=M+1 // 22369
A=A-1 // 22370
M=D // 22371

////PushInstruction("constant 0")
@SP // 22372
AM=M+1 // 22373
A=A-1 // 22374
M=0 // 22375

////ArithmeticInstruction{ADD}
@SP // 22376
AM=M-1 // 22377
D=M // 22378
A=A-1 // 22379
M=D+M // 22380

////PopInstruction{address=pointer 1}
@SP // 22381
AM=M-1 // 22382
D=M // 22383
@4 // 22384
M=D // 22385

////PushInstruction("that 0")
@THAT // 22386
A=M // 22387
D=M // 22388
@SP // 22389
AM=M+1 // 22390
A=A-1 // 22391
M=D // 22392

////PushInstruction("argument 1")
@ARG // 22393
A=M+1 // 22394
D=M // 22395
@SP // 22396
AM=M+1 // 22397
A=A-1 // 22398
M=D // 22399

////PushInstruction("constant 0")
@SP // 22400
AM=M+1 // 22401
A=A-1 // 22402
M=0 // 22403

////ArithmeticInstruction{ADD}
@SP // 22404
AM=M-1 // 22405
D=M // 22406
A=A-1 // 22407
M=D+M // 22408

////PopInstruction{address=pointer 1}
@SP // 22409
AM=M-1 // 22410
D=M // 22411
@4 // 22412
M=D // 22413

////PushInstruction("that 0")
@THAT // 22414
A=M // 22415
D=M // 22416
@SP // 22417
AM=M+1 // 22418
A=A-1 // 22419
M=D // 22420

////ArithmeticInstruction{GT}
@COMPARE_Memory.add_node_gt43 // 22421
D=A // 22422
@13 // 22423
M=D // 22424
@SP // 22425
AM=M-1 // 22426
D=M // 22427
A=A-1 // 22428
D=M-D // 22429
@DO_GT // 22430
0;JMP // 22431
(COMPARE_Memory.add_node_gt43)
@SP // 22432
A=M-1 // 22433
M=D // 22434

////ArithmeticInstruction{NOT}
@SP // 22435
A=M-1 // 22436
M=!M // 22437

////ArithmeticInstruction{AND}
@SP // 22438
AM=M-1 // 22439
D=M // 22440
A=A-1 // 22441
M=D&M // 22442

////PushInstruction("constant 0")
@SP // 22443
AM=M+1 // 22444
A=A-1 // 22445
M=0 // 22446

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq44 // 22447
D=A // 22448
@13 // 22449
M=D // 22450
@SP // 22451
AM=M-1 // 22452
D=M // 22453
A=A-1 // 22454
D=M-D // 22455
@DO_EQ // 22456
0;JMP // 22457
(COMPARE_Memory.add_node_eq44)
@SP // 22458
A=M-1 // 22459
M=D // 22460

////IfGotoInstruction{label='WHILE_END_Memory.add_node1}
// if-goto WHILE_END_Memory.add_node1
@SP // 22461
AM=M-1 // 22462
D=M // 22463
@WHILE_END_Memory.add_node1 // 22464
D;JNE // 22465

////PushInstruction("local 0")
@LCL // 22466
A=M // 22467
D=M // 22468
@SP // 22469
AM=M+1 // 22470
A=A-1 // 22471
M=D // 22472

////PopInstruction{address=local 1}
@SP // 22473
AM=M-1 // 22474
D=M // 22475
@LCL // 22476
A=M+1 // 22477
M=D // 22478

////PushInstruction("local 0")
@LCL // 22479
A=M // 22480
D=M // 22481
@SP // 22482
AM=M+1 // 22483
A=A-1 // 22484
M=D // 22485

////PushInstruction("constant 3")
@3 // 22486
D=A // 22487
@SP // 22488
AM=M+1 // 22489
A=A-1 // 22490
M=D // 22491

////ArithmeticInstruction{ADD}
@SP // 22492
AM=M-1 // 22493
D=M // 22494
A=A-1 // 22495
M=D+M // 22496

////PopInstruction{address=pointer 1}
@SP // 22497
AM=M-1 // 22498
D=M // 22499
@4 // 22500
M=D // 22501

////PushInstruction("that 0")
@THAT // 22502
A=M // 22503
D=M // 22504
@SP // 22505
AM=M+1 // 22506
A=A-1 // 22507
M=D // 22508

////PopInstruction{address=local 0}
@SP // 22509
AM=M-1 // 22510
D=M // 22511
@LCL // 22512
A=M // 22513
M=D // 22514

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 22515
0;JMP // 22516

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////PushInstruction("local 1")
@LCL // 22517
A=M+1 // 22518
D=M // 22519
@SP // 22520
AM=M+1 // 22521
A=A-1 // 22522
M=D // 22523

////ArithmeticInstruction{NOT}
@SP // 22524
A=M-1 // 22525
M=!M // 22526

////PushInstruction("constant 0")
@SP // 22527
AM=M+1 // 22528
A=A-1 // 22529
M=0 // 22530

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq45 // 22531
D=A // 22532
@13 // 22533
M=D // 22534
@SP // 22535
AM=M-1 // 22536
D=M // 22537
A=A-1 // 22538
D=M-D // 22539
@DO_EQ // 22540
0;JMP // 22541
(COMPARE_Memory.add_node_eq45)
@SP // 22542
A=M-1 // 22543
M=D // 22544

////IfGotoInstruction{label='Memory.add_node.IfElse2}
// if-goto Memory.add_node.IfElse2
@SP // 22545
AM=M-1 // 22546
D=M // 22547
@Memory.add_node.IfElse2 // 22548
D;JNE // 22549

////PushInstruction("argument 0")
@ARG // 22550
A=M // 22551
D=M // 22552
@SP // 22553
AM=M+1 // 22554
A=A-1 // 22555
M=D // 22556

////PushInstruction("constant 0")
@SP // 22557
AM=M+1 // 22558
A=A-1 // 22559
M=0 // 22560

////ArithmeticInstruction{ADD}
@SP // 22561
AM=M-1 // 22562
D=M // 22563
A=A-1 // 22564
M=D+M // 22565

////PopInstruction{address=pointer 1}
@SP // 22566
AM=M-1 // 22567
D=M // 22568
@4 // 22569
M=D // 22570

////PushInstruction("that 0")
@THAT // 22571
A=M // 22572
D=M // 22573
@SP // 22574
AM=M+1 // 22575
A=A-1 // 22576
M=D // 22577

////PushInstruction("argument 1")
@ARG // 22578
A=M+1 // 22579
D=M // 22580
@SP // 22581
AM=M+1 // 22582
A=A-1 // 22583
M=D // 22584

////PushInstruction("constant 3")
@3 // 22585
D=A // 22586
@SP // 22587
AM=M+1 // 22588
A=A-1 // 22589
M=D // 22590

////ArithmeticInstruction{ADD}
@SP // 22591
AM=M-1 // 22592
D=M // 22593
A=A-1 // 22594
M=D+M // 22595

////PopInstruction{address=pointer 1}
@SP // 22596
AM=M-1 // 22597
D=M // 22598
@4 // 22599
M=D // 22600

////PopInstruction{address=that 0}
@SP // 22601
AM=M-1 // 22602
D=M // 22603
@THAT // 22604
A=M // 22605
M=D // 22606

////PushInstruction("argument 1")
@ARG // 22607
A=M+1 // 22608
D=M // 22609
@SP // 22610
AM=M+1 // 22611
A=A-1 // 22612
M=D // 22613

////PushInstruction("argument 0")
@ARG // 22614
A=M // 22615
D=M // 22616
@SP // 22617
AM=M+1 // 22618
A=A-1 // 22619
M=D // 22620

////PushInstruction("constant 0")
@SP // 22621
AM=M+1 // 22622
A=A-1 // 22623
M=0 // 22624

////ArithmeticInstruction{ADD}
@SP // 22625
AM=M-1 // 22626
D=M // 22627
A=A-1 // 22628
M=D+M // 22629

////PushInstruction("constant 2")
@2 // 22630
D=A // 22631
@SP // 22632
AM=M+1 // 22633
A=A-1 // 22634
M=D // 22635

////ArithmeticInstruction{ADD}
@SP // 22636
AM=M-1 // 22637
D=M // 22638
A=A-1 // 22639
M=D+M // 22640

////PopInstruction{address=pointer 1}
@SP // 22641
AM=M-1 // 22642
D=M // 22643
@4 // 22644
M=D // 22645

////PopInstruction{address=that 0}
@SP // 22646
AM=M-1 // 22647
D=M // 22648
@THAT // 22649
A=M // 22650
M=D // 22651

////PushInstruction("argument 1")
@ARG // 22652
A=M+1 // 22653
D=M // 22654
@SP // 22655
AM=M+1 // 22656
A=A-1 // 22657
M=D // 22658

////PushInstruction("argument 0")
@ARG // 22659
A=M // 22660
D=M // 22661
@SP // 22662
AM=M+1 // 22663
A=A-1 // 22664
M=D // 22665

////PushInstruction("constant 0")
@SP // 22666
AM=M+1 // 22667
A=A-1 // 22668
M=0 // 22669

////ArithmeticInstruction{ADD}
@SP // 22670
AM=M-1 // 22671
D=M // 22672
A=A-1 // 22673
M=D+M // 22674

////PopInstruction{address=pointer 1}
@SP // 22675
AM=M-1 // 22676
D=M // 22677
@4 // 22678
M=D // 22679

////PopInstruction{address=that 0}
@SP // 22680
AM=M-1 // 22681
D=M // 22682
@THAT // 22683
A=M // 22684
M=D // 22685

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 22686
0;JMP // 22687

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushInstruction("local 0")
@LCL // 22688
A=M // 22689
D=M // 22690
@SP // 22691
AM=M+1 // 22692
A=A-1 // 22693
M=D // 22694

////PushInstruction("argument 1")
@ARG // 22695
A=M+1 // 22696
D=M // 22697
@SP // 22698
AM=M+1 // 22699
A=A-1 // 22700
M=D // 22701

////PushInstruction("constant 3")
@3 // 22702
D=A // 22703
@SP // 22704
AM=M+1 // 22705
A=A-1 // 22706
M=D // 22707

////ArithmeticInstruction{ADD}
@SP // 22708
AM=M-1 // 22709
D=M // 22710
A=A-1 // 22711
M=D+M // 22712

////PopInstruction{address=pointer 1}
@SP // 22713
AM=M-1 // 22714
D=M // 22715
@4 // 22716
M=D // 22717

////PopInstruction{address=that 0}
@SP // 22718
AM=M-1 // 22719
D=M // 22720
@THAT // 22721
A=M // 22722
M=D // 22723

////PushInstruction("local 1")
@LCL // 22724
A=M+1 // 22725
D=M // 22726
@SP // 22727
AM=M+1 // 22728
A=A-1 // 22729
M=D // 22730

////PushInstruction("argument 1")
@ARG // 22731
A=M+1 // 22732
D=M // 22733
@SP // 22734
AM=M+1 // 22735
A=A-1 // 22736
M=D // 22737

////PushInstruction("constant 2")
@2 // 22738
D=A // 22739
@SP // 22740
AM=M+1 // 22741
A=A-1 // 22742
M=D // 22743

////ArithmeticInstruction{ADD}
@SP // 22744
AM=M-1 // 22745
D=M // 22746
A=A-1 // 22747
M=D+M // 22748

////PopInstruction{address=pointer 1}
@SP // 22749
AM=M-1 // 22750
D=M // 22751
@4 // 22752
M=D // 22753

////PopInstruction{address=that 0}
@SP // 22754
AM=M-1 // 22755
D=M // 22756
@THAT // 22757
A=M // 22758
M=D // 22759

////PushInstruction("local 0")
@LCL // 22760
A=M // 22761
D=M // 22762
@SP // 22763
AM=M+1 // 22764
A=A-1 // 22765
M=D // 22766

////PushInstruction("constant 0")
@SP // 22767
AM=M+1 // 22768
A=A-1 // 22769
M=0 // 22770

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq46 // 22771
D=A // 22772
@13 // 22773
M=D // 22774
@SP // 22775
AM=M-1 // 22776
D=M // 22777
A=A-1 // 22778
D=M-D // 22779
@DO_EQ // 22780
0;JMP // 22781
(COMPARE_Memory.add_node_eq46)
@SP // 22782
A=M-1 // 22783
M=D // 22784

////IfGotoInstruction{label='Memory.add_node.IfElse3}
// if-goto Memory.add_node.IfElse3
@SP // 22785
AM=M-1 // 22786
D=M // 22787
@Memory.add_node.IfElse3 // 22788
D;JNE // 22789

////PushInstruction("argument 1")
@ARG // 22790
A=M+1 // 22791
D=M // 22792
@SP // 22793
AM=M+1 // 22794
A=A-1 // 22795
M=D // 22796

////PushInstruction("local 0")
@LCL // 22797
A=M // 22798
D=M // 22799
@SP // 22800
AM=M+1 // 22801
A=A-1 // 22802
M=D // 22803

////PushInstruction("constant 2")
@2 // 22804
D=A // 22805
@SP // 22806
AM=M+1 // 22807
A=A-1 // 22808
M=D // 22809

////ArithmeticInstruction{ADD}
@SP // 22810
AM=M-1 // 22811
D=M // 22812
A=A-1 // 22813
M=D+M // 22814

////PopInstruction{address=pointer 1}
@SP // 22815
AM=M-1 // 22816
D=M // 22817
@4 // 22818
M=D // 22819

////PopInstruction{address=that 0}
@SP // 22820
AM=M-1 // 22821
D=M // 22822
@THAT // 22823
A=M // 22824
M=D // 22825

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 22826
0;JMP // 22827

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 22828
A=M+1 // 22829
D=M // 22830
@SP // 22831
AM=M+1 // 22832
A=A-1 // 22833
M=D // 22834

////PushInstruction("local 1")
@LCL // 22835
A=M+1 // 22836
D=M // 22837
@SP // 22838
AM=M+1 // 22839
A=A-1 // 22840
M=D // 22841

////PushInstruction("constant 3")
@3 // 22842
D=A // 22843
@SP // 22844
AM=M+1 // 22845
A=A-1 // 22846
M=D // 22847

////ArithmeticInstruction{ADD}
@SP // 22848
AM=M-1 // 22849
D=M // 22850
A=A-1 // 22851
M=D+M // 22852

////PopInstruction{address=pointer 1}
@SP // 22853
AM=M-1 // 22854
D=M // 22855
@4 // 22856
M=D // 22857

////PopInstruction{address=that 0}
@SP // 22858
AM=M-1 // 22859
D=M // 22860
@THAT // 22861
A=M // 22862
M=D // 22863

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 22864
AM=M+1 // 22865
A=A-1 // 22866
M=0 // 22867

////ReturnInstruction{}
@RETURN // 22868
0;JMP // 22869

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushInstruction("argument 1")
@ARG // 22870
A=M+1 // 22871
D=M // 22872
@SP // 22873
AM=M+1 // 22874
A=A-1 // 22875
M=D // 22876

////PushInstruction("argument 0")
@ARG // 22877
A=M // 22878
D=M // 22879
@SP // 22880
AM=M+1 // 22881
A=A-1 // 22882
M=D // 22883

////PushInstruction("constant 0")
@SP // 22884
AM=M+1 // 22885
A=A-1 // 22886
M=0 // 22887

////ArithmeticInstruction{ADD}
@SP // 22888
AM=M-1 // 22889
D=M // 22890
A=A-1 // 22891
M=D+M // 22892

////PopInstruction{address=pointer 1}
@SP // 22893
AM=M-1 // 22894
D=M // 22895
@4 // 22896
M=D // 22897

////PopInstruction{address=that 0}
@SP // 22898
AM=M-1 // 22899
D=M // 22900
@THAT // 22901
A=M // 22902
M=D // 22903

////PushInstruction("constant 0")
@SP // 22904
AM=M+1 // 22905
A=A-1 // 22906
M=0 // 22907

////ReturnInstruction{}
@RETURN // 22908
0;JMP // 22909

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////PushInstruction("argument 0")
@ARG // 22910
A=M // 22911
D=M // 22912
@SP // 22913
AM=M+1 // 22914
A=A-1 // 22915
M=D // 22916

////PushInstruction("constant 0")
@SP // 22917
AM=M+1 // 22918
A=A-1 // 22919
M=0 // 22920

////ArithmeticInstruction{ADD}
@SP // 22921
AM=M-1 // 22922
D=M // 22923
A=A-1 // 22924
M=D+M // 22925

////PopInstruction{address=pointer 1}
@SP // 22926
AM=M-1 // 22927
D=M // 22928
@4 // 22929
M=D // 22930

////PushInstruction("that 0")
@THAT // 22931
A=M // 22932
D=M // 22933
@SP // 22934
AM=M+1 // 22935
A=A-1 // 22936
M=D // 22937

////ReturnInstruction{}
@RETURN // 22938
0;JMP // 22939

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}
// call Memory.init
@5 // 22940
D=A // 22941
@14 // 22942
M=D // 22943
@Memory.init // 22944
D=A // 22945
@13 // 22946
M=D // 22947
@Sys.init.ret.0 // 22948
D=A // 22949
@CALL // 22950
0;JMP // 22951
(Sys.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 22952
AM=M-1 // 22953
D=M // 22954
@5 // 22955
M=D // 22956

////CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=1}, currentFunction='Sys.init'}
// call Math.init
@5 // 22957
D=A // 22958
@14 // 22959
M=D // 22960
@Math.init // 22961
D=A // 22962
@13 // 22963
M=D // 22964
@Sys.init.ret.1 // 22965
D=A // 22966
@CALL // 22967
0;JMP // 22968
(Sys.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 22969
AM=M-1 // 22970
D=M // 22971
@5 // 22972
M=D // 22973

////CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=2}, currentFunction='Sys.init'}
// call Screen.init
@5 // 22974
D=A // 22975
@14 // 22976
M=D // 22977
@Screen.init // 22978
D=A // 22979
@13 // 22980
M=D // 22981
@Sys.init.ret.2 // 22982
D=A // 22983
@CALL // 22984
0;JMP // 22985
(Sys.init.ret.2)

////PopInstruction{address=temp 0}
@SP // 22986
AM=M-1 // 22987
D=M // 22988
@5 // 22989
M=D // 22990

////CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=3}, currentFunction='Sys.init'}
// call Output.init
@5 // 22991
D=A // 22992
@14 // 22993
M=D // 22994
@Output.init // 22995
D=A // 22996
@13 // 22997
M=D // 22998
@Sys.init.ret.3 // 22999
D=A // 23000
@CALL // 23001
0;JMP // 23002
(Sys.init.ret.3)

////PopInstruction{address=temp 0}
@SP // 23003
AM=M-1 // 23004
D=M // 23005
@5 // 23006
M=D // 23007

////CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=4}, currentFunction='Sys.init'}
// call Keyboard.init
@5 // 23008
D=A // 23009
@14 // 23010
M=D // 23011
@Keyboard.init // 23012
D=A // 23013
@13 // 23014
M=D // 23015
@Sys.init.ret.4 // 23016
D=A // 23017
@CALL // 23018
0;JMP // 23019
(Sys.init.ret.4)

////PopInstruction{address=temp 0}
@SP // 23020
AM=M-1 // 23021
D=M // 23022
@5 // 23023
M=D // 23024

////CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=5}, currentFunction='Sys.init'}
// call Main.main
@5 // 23025
D=A // 23026
@14 // 23027
M=D // 23028
@Main.main // 23029
D=A // 23030
@13 // 23031
M=D // 23032
@Sys.init.ret.5 // 23033
D=A // 23034
@CALL // 23035
0;JMP // 23036
(Sys.init.ret.5)

////PopInstruction{address=temp 0}
@SP // 23037
AM=M-1 // 23038
D=M // 23039
@5 // 23040
M=D // 23041

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=6}, currentFunction='Sys.init'}
// call Sys.halt
@5 // 23042
D=A // 23043
@14 // 23044
M=D // 23045
@Sys.halt // 23046
D=A // 23047
@13 // 23048
M=D // 23049
@Sys.init.ret.6 // 23050
D=A // 23051
@CALL // 23052
0;JMP // 23053
(Sys.init.ret.6)

////PopInstruction{address=temp 0}
@SP // 23054
AM=M-1 // 23055
D=M // 23056
@5 // 23057
M=D // 23058

////PushInstruction("constant 0")
@SP // 23059
AM=M+1 // 23060
A=A-1 // 23061
M=0 // 23062

////ReturnInstruction{}
@RETURN // 23063
0;JMP // 23064

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23065
AM=M+1 // 23066
A=A-1 // 23067
M=0 // 23068

////ArithmeticInstruction{NOT}
@SP // 23069
A=M-1 // 23070
M=!M // 23071

////PushInstruction("constant 0")
@SP // 23072
AM=M+1 // 23073
A=A-1 // 23074
M=0 // 23075

////ArithmeticInstruction{EQ}
@COMPARE_Sys.halt_eq0 // 23076
D=A // 23077
@13 // 23078
M=D // 23079
@SP // 23080
AM=M-1 // 23081
D=M // 23082
A=A-1 // 23083
D=M-D // 23084
@DO_EQ // 23085
0;JMP // 23086
(COMPARE_Sys.halt_eq0)
@SP // 23087
A=M-1 // 23088
M=D // 23089

////IfGotoInstruction{label='WHILE_END_Sys.halt1}
// if-goto WHILE_END_Sys.halt1
@SP // 23090
AM=M-1 // 23091
D=M // 23092
@WHILE_END_Sys.halt1 // 23093
D;JNE // 23094

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 23095
0;JMP // 23096

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23097
AM=M+1 // 23098
A=A-1 // 23099
M=0 // 23100

////ReturnInstruction{}
@RETURN // 23101
0;JMP // 23102

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 23103
AM=M+1 // 23104
A=A-1 // 23105
M=0 // 23106

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

////PushInstruction("argument 0")
@ARG // 23107
A=M // 23108
D=M // 23109
@SP // 23110
AM=M+1 // 23111
A=A-1 // 23112
M=D // 23113

////PushInstruction("constant 0")
@SP // 23114
AM=M+1 // 23115
A=A-1 // 23116
M=0 // 23117

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt1 // 23118
D=A // 23119
@13 // 23120
M=D // 23121
@SP // 23122
AM=M-1 // 23123
D=M // 23124
A=A-1 // 23125
D=M-D // 23126
@DO_GT // 23127
0;JMP // 23128
(COMPARE_Sys.wait_gt1)
@SP // 23129
A=M-1 // 23130
M=D // 23131

////PushInstruction("constant 0")
@SP // 23132
AM=M+1 // 23133
A=A-1 // 23134
M=0 // 23135

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq2 // 23136
D=A // 23137
@13 // 23138
M=D // 23139
@SP // 23140
AM=M-1 // 23141
D=M // 23142
A=A-1 // 23143
D=M-D // 23144
@DO_EQ // 23145
0;JMP // 23146
(COMPARE_Sys.wait_eq2)
@SP // 23147
A=M-1 // 23148
M=D // 23149

////IfGotoInstruction{label='WHILE_END_Sys.wait1}
// if-goto WHILE_END_Sys.wait1
@SP // 23150
AM=M-1 // 23151
D=M // 23152
@WHILE_END_Sys.wait1 // 23153
D;JNE // 23154

////PushInstruction("argument 0")
@ARG // 23155
A=M // 23156
D=M // 23157
@SP // 23158
AM=M+1 // 23159
A=A-1 // 23160
M=D // 23161

////PushInstruction("constant 1")
@SP // 23162
AM=M+1 // 23163
A=A-1 // 23164
M=1 // 23165

////ArithmeticInstruction{SUB}
@SP // 23166
AM=M-1 // 23167
D=M // 23168
A=A-1 // 23169
M=M-D // 23170

////PopInstruction{address=argument 0}
@SP // 23171
AM=M-1 // 23172
D=M // 23173
@ARG // 23174
A=M // 23175
M=D // 23176

////PushInstruction("constant 70")
@70 // 23177
D=A // 23178
@SP // 23179
AM=M+1 // 23180
A=A-1 // 23181
M=D // 23182

////PopInstruction{address=local 0}
@SP // 23183
AM=M-1 // 23184
D=M // 23185
@LCL // 23186
A=M // 23187
M=D // 23188

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////PushInstruction("local 0")
@LCL // 23189
A=M // 23190
D=M // 23191
@SP // 23192
AM=M+1 // 23193
A=A-1 // 23194
M=D // 23195

////PushInstruction("constant 0")
@SP // 23196
AM=M+1 // 23197
A=A-1 // 23198
M=0 // 23199

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt3 // 23200
D=A // 23201
@13 // 23202
M=D // 23203
@SP // 23204
AM=M-1 // 23205
D=M // 23206
A=A-1 // 23207
D=M-D // 23208
@DO_GT // 23209
0;JMP // 23210
(COMPARE_Sys.wait_gt3)
@SP // 23211
A=M-1 // 23212
M=D // 23213

////PushInstruction("constant 0")
@SP // 23214
AM=M+1 // 23215
A=A-1 // 23216
M=0 // 23217

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq4 // 23218
D=A // 23219
@13 // 23220
M=D // 23221
@SP // 23222
AM=M-1 // 23223
D=M // 23224
A=A-1 // 23225
D=M-D // 23226
@DO_EQ // 23227
0;JMP // 23228
(COMPARE_Sys.wait_eq4)
@SP // 23229
A=M-1 // 23230
M=D // 23231

////IfGotoInstruction{label='WHILE_END_Sys.wait2}
// if-goto WHILE_END_Sys.wait2
@SP // 23232
AM=M-1 // 23233
D=M // 23234
@WHILE_END_Sys.wait2 // 23235
D;JNE // 23236

////PushInstruction("local 0")
@LCL // 23237
A=M // 23238
D=M // 23239
@SP // 23240
AM=M+1 // 23241
A=A-1 // 23242
M=D // 23243

////PushInstruction("constant 1")
@SP // 23244
AM=M+1 // 23245
A=A-1 // 23246
M=1 // 23247

////ArithmeticInstruction{SUB}
@SP // 23248
AM=M-1 // 23249
D=M // 23250
A=A-1 // 23251
M=M-D // 23252

////PopInstruction{address=local 0}
@SP // 23253
AM=M-1 // 23254
D=M // 23255
@LCL // 23256
A=M // 23257
M=D // 23258

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 23259
0;JMP // 23260

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 23261
0;JMP // 23262

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 23263
AM=M+1 // 23264
A=A-1 // 23265
M=0 // 23266

////ReturnInstruction{}
@RETURN // 23267
0;JMP // 23268

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushInstruction("argument 0")
@ARG // 23269
A=M // 23270
D=M // 23271
@SP // 23272
AM=M+1 // 23273
A=A-1 // 23274
M=D // 23275

////CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.printInt
@6 // 23276
D=A // 23277
@14 // 23278
M=D // 23279
@Output.printInt // 23280
D=A // 23281
@13 // 23282
M=D // 23283
@Sys.error.ret.0 // 23284
D=A // 23285
@CALL // 23286
0;JMP // 23287
(Sys.error.ret.0)

////PopInstruction{address=temp 0}
@SP // 23288
AM=M-1 // 23289
D=M // 23290
@5 // 23291
M=D // 23292

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.wait=0, Sys.error=1, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.println
@5 // 23293
D=A // 23294
@14 // 23295
M=D // 23296
@Output.println // 23297
D=A // 23298
@13 // 23299
M=D // 23300
@Sys.error.ret.1 // 23301
D=A // 23302
@CALL // 23303
0;JMP // 23304
(Sys.error.ret.1)

////PopInstruction{address=temp 0}
@SP // 23305
AM=M-1 // 23306
D=M // 23307
@5 // 23308
M=D // 23309

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.wait=0, Sys.error=2, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Sys.halt
@5 // 23310
D=A // 23311
@14 // 23312
M=D // 23313
@Sys.halt // 23314
D=A // 23315
@13 // 23316
M=D // 23317
@Sys.error.ret.2 // 23318
D=A // 23319
@CALL // 23320
0;JMP // 23321
(Sys.error.ret.2)

////PopInstruction{address=temp 0}
@SP // 23322
AM=M-1 // 23323
D=M // 23324
@5 // 23325
M=D // 23326

////PushInstruction("constant 0")
@SP // 23327
AM=M+1 // 23328
A=A-1 // 23329
M=0 // 23330

////ReturnInstruction{}
@RETURN // 23331
0;JMP // 23332

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 23333
AM=M+1 // 23334
A=A-1 // 23335
M=0 // 23336

////ReturnInstruction{}
@RETURN // 23337
0;JMP // 23338

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////PushInstruction("constant 24576")
@24576 // 23339
D=A // 23340
@SP // 23341
AM=M+1 // 23342
A=A-1 // 23343
M=D // 23344

////PushInstruction("constant 0")
@SP // 23345
AM=M+1 // 23346
A=A-1 // 23347
M=0 // 23348

////ArithmeticInstruction{ADD}
@SP // 23349
AM=M-1 // 23350
D=M // 23351
A=A-1 // 23352
M=D+M // 23353

////PopInstruction{address=pointer 1}
@SP // 23354
AM=M-1 // 23355
D=M // 23356
@4 // 23357
M=D // 23358

////PushInstruction("that 0")
@THAT // 23359
A=M // 23360
D=M // 23361
@SP // 23362
AM=M+1 // 23363
A=A-1 // 23364
M=D // 23365

////ReturnInstruction{}
@RETURN // 23366
0;JMP // 23367

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 23368
AM=M+1 // 23369
A=A-1 // 23370
M=0 // 23371

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 23372
D=A // 23373
@SP // 23374
AM=M+1 // 23375
A=A-1 // 23376
M=D // 23377

////PushInstruction("constant 0")
@SP // 23378
AM=M+1 // 23379
A=A-1 // 23380
M=0 // 23381

////ArithmeticInstruction{ADD}
@SP // 23382
AM=M-1 // 23383
D=M // 23384
A=A-1 // 23385
M=D+M // 23386

////PopInstruction{address=pointer 1}
@SP // 23387
AM=M-1 // 23388
D=M // 23389
@4 // 23390
M=D // 23391

////PushInstruction("that 0")
@THAT // 23392
A=M // 23393
D=M // 23394
@SP // 23395
AM=M+1 // 23396
A=A-1 // 23397
M=D // 23398

////PushInstruction("constant 0")
@SP // 23399
AM=M+1 // 23400
A=A-1 // 23401
M=0 // 23402

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq0 // 23403
D=A // 23404
@13 // 23405
M=D // 23406
@SP // 23407
AM=M-1 // 23408
D=M // 23409
A=A-1 // 23410
D=M-D // 23411
@DO_EQ // 23412
0;JMP // 23413
(COMPARE_Keyboard.readChar_eq0)
@SP // 23414
A=M-1 // 23415
M=D // 23416

////PushInstruction("constant 0")
@SP // 23417
AM=M+1 // 23418
A=A-1 // 23419
M=0 // 23420

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq1 // 23421
D=A // 23422
@13 // 23423
M=D // 23424
@SP // 23425
AM=M-1 // 23426
D=M // 23427
A=A-1 // 23428
D=M-D // 23429
@DO_EQ // 23430
0;JMP // 23431
(COMPARE_Keyboard.readChar_eq1)
@SP // 23432
A=M-1 // 23433
M=D // 23434

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}
// if-goto WHILE_END_Keyboard.readChar1
@SP // 23435
AM=M-1 // 23436
D=M // 23437
@WHILE_END_Keyboard.readChar1 // 23438
D;JNE // 23439

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 23440
0;JMP // 23441

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 23442
D=A // 23443
@SP // 23444
AM=M+1 // 23445
A=A-1 // 23446
M=D // 23447

////PushInstruction("constant 0")
@SP // 23448
AM=M+1 // 23449
A=A-1 // 23450
M=0 // 23451

////ArithmeticInstruction{ADD}
@SP // 23452
AM=M-1 // 23453
D=M // 23454
A=A-1 // 23455
M=D+M // 23456

////PopInstruction{address=pointer 1}
@SP // 23457
AM=M-1 // 23458
D=M // 23459
@4 // 23460
M=D // 23461

////PushInstruction("that 0")
@THAT // 23462
A=M // 23463
D=M // 23464
@SP // 23465
AM=M+1 // 23466
A=A-1 // 23467
M=D // 23468

////PopInstruction{address=local 0}
@SP // 23469
AM=M-1 // 23470
D=M // 23471
@LCL // 23472
A=M // 23473
M=D // 23474

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////PushInstruction("constant 24576")
@24576 // 23475
D=A // 23476
@SP // 23477
AM=M+1 // 23478
A=A-1 // 23479
M=D // 23480

////PushInstruction("constant 0")
@SP // 23481
AM=M+1 // 23482
A=A-1 // 23483
M=0 // 23484

////ArithmeticInstruction{ADD}
@SP // 23485
AM=M-1 // 23486
D=M // 23487
A=A-1 // 23488
M=D+M // 23489

////PopInstruction{address=pointer 1}
@SP // 23490
AM=M-1 // 23491
D=M // 23492
@4 // 23493
M=D // 23494

////PushInstruction("that 0")
@THAT // 23495
A=M // 23496
D=M // 23497
@SP // 23498
AM=M+1 // 23499
A=A-1 // 23500
M=D // 23501

////PushInstruction("constant 0")
@SP // 23502
AM=M+1 // 23503
A=A-1 // 23504
M=0 // 23505

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq2 // 23506
D=A // 23507
@13 // 23508
M=D // 23509
@SP // 23510
AM=M-1 // 23511
D=M // 23512
A=A-1 // 23513
D=M-D // 23514
@DO_EQ // 23515
0;JMP // 23516
(COMPARE_Keyboard.readChar_eq2)
@SP // 23517
A=M-1 // 23518
M=D // 23519

////ArithmeticInstruction{NOT}
@SP // 23520
A=M-1 // 23521
M=!M // 23522

////PushInstruction("constant 0")
@SP // 23523
AM=M+1 // 23524
A=A-1 // 23525
M=0 // 23526

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq3 // 23527
D=A // 23528
@13 // 23529
M=D // 23530
@SP // 23531
AM=M-1 // 23532
D=M // 23533
A=A-1 // 23534
D=M-D // 23535
@DO_EQ // 23536
0;JMP // 23537
(COMPARE_Keyboard.readChar_eq3)
@SP // 23538
A=M-1 // 23539
M=D // 23540

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}
// if-goto WHILE_END_Keyboard.readChar2
@SP // 23541
AM=M-1 // 23542
D=M // 23543
@WHILE_END_Keyboard.readChar2 // 23544
D;JNE // 23545

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 23546
0;JMP // 23547

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushInstruction("local 0")
@LCL // 23548
A=M // 23549
D=M // 23550
@SP // 23551
AM=M+1 // 23552
A=A-1 // 23553
M=D // 23554

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}
// call Output.printChar
@6 // 23555
D=A // 23556
@14 // 23557
M=D // 23558
@Output.printChar // 23559
D=A // 23560
@13 // 23561
M=D // 23562
@Keyboard.readChar.ret.0 // 23563
D=A // 23564
@CALL // 23565
0;JMP // 23566
(Keyboard.readChar.ret.0)

////PopInstruction{address=temp 0}
@SP // 23567
AM=M-1 // 23568
D=M // 23569
@5 // 23570
M=D // 23571

////PushInstruction("local 0")
@LCL // 23572
A=M // 23573
D=M // 23574
@SP // 23575
AM=M+1 // 23576
A=A-1 // 23577
M=D // 23578

////ReturnInstruction{}
@RETURN // 23579
0;JMP // 23580

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 23581
AM=M+1 // 23582
A=A-1 // 23583
M=0 // 23584
@SP // 23585
AM=M+1 // 23586
A=A-1 // 23587
M=0 // 23588

////PushInstruction("argument 0")
@ARG // 23589
A=M // 23590
D=M // 23591
@SP // 23592
AM=M+1 // 23593
A=A-1 // 23594
M=D // 23595

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}
// call Output.printString
@6 // 23596
D=A // 23597
@14 // 23598
M=D // 23599
@Output.printString // 23600
D=A // 23601
@13 // 23602
M=D // 23603
@Keyboard.readLine.ret.0 // 23604
D=A // 23605
@CALL // 23606
0;JMP // 23607
(Keyboard.readLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 23608
AM=M-1 // 23609
D=M // 23610
@5 // 23611
M=D // 23612

////PushInstruction("constant 50")
@50 // 23613
D=A // 23614
@SP // 23615
AM=M+1 // 23616
A=A-1 // 23617
M=D // 23618

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=1}, currentFunction='Keyboard.readLine'}
// call String.new
@6 // 23619
D=A // 23620
@14 // 23621
M=D // 23622
@String.new // 23623
D=A // 23624
@13 // 23625
M=D // 23626
@Keyboard.readLine.ret.1 // 23627
D=A // 23628
@CALL // 23629
0;JMP // 23630
(Keyboard.readLine.ret.1)

////PopInstruction{address=local 0}
@SP // 23631
AM=M-1 // 23632
D=M // 23633
@LCL // 23634
A=M // 23635
M=D // 23636

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=2}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 23637
D=A // 23638
@14 // 23639
M=D // 23640
@Keyboard.readChar // 23641
D=A // 23642
@13 // 23643
M=D // 23644
@Keyboard.readLine.ret.2 // 23645
D=A // 23646
@CALL // 23647
0;JMP // 23648
(Keyboard.readLine.ret.2)

////PopInstruction{address=local 1}
@SP // 23649
AM=M-1 // 23650
D=M // 23651
@LCL // 23652
A=M+1 // 23653
M=D // 23654

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////PushInstruction("local 1")
@LCL // 23655
A=M+1 // 23656
D=M // 23657
@SP // 23658
AM=M+1 // 23659
A=A-1 // 23660
M=D // 23661

////CallInstruction{calleeFunction='String.newLine', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=3}, currentFunction='Keyboard.readLine'}
// call String.newLine
@5 // 23662
D=A // 23663
@14 // 23664
M=D // 23665
@String.newLine // 23666
D=A // 23667
@13 // 23668
M=D // 23669
@Keyboard.readLine.ret.3 // 23670
D=A // 23671
@CALL // 23672
0;JMP // 23673
(Keyboard.readLine.ret.3)

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq4 // 23674
D=A // 23675
@13 // 23676
M=D // 23677
@SP // 23678
AM=M-1 // 23679
D=M // 23680
A=A-1 // 23681
D=M-D // 23682
@DO_EQ // 23683
0;JMP // 23684
(COMPARE_Keyboard.readLine_eq4)
@SP // 23685
A=M-1 // 23686
M=D // 23687

////ArithmeticInstruction{NOT}
@SP // 23688
A=M-1 // 23689
M=!M // 23690

////PushInstruction("constant 0")
@SP // 23691
AM=M+1 // 23692
A=A-1 // 23693
M=0 // 23694

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq5 // 23695
D=A // 23696
@13 // 23697
M=D // 23698
@SP // 23699
AM=M-1 // 23700
D=M // 23701
A=A-1 // 23702
D=M-D // 23703
@DO_EQ // 23704
0;JMP // 23705
(COMPARE_Keyboard.readLine_eq5)
@SP // 23706
A=M-1 // 23707
M=D // 23708

////IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}
// if-goto WHILE_END_Keyboard.readLine1
@SP // 23709
AM=M-1 // 23710
D=M // 23711
@WHILE_END_Keyboard.readLine1 // 23712
D;JNE // 23713

////PushInstruction("local 1")
@LCL // 23714
A=M+1 // 23715
D=M // 23716
@SP // 23717
AM=M+1 // 23718
A=A-1 // 23719
M=D // 23720

////PushInstruction("constant 129")
@129 // 23721
D=A // 23722
@SP // 23723
AM=M+1 // 23724
A=A-1 // 23725
M=D // 23726

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq6 // 23727
D=A // 23728
@13 // 23729
M=D // 23730
@SP // 23731
AM=M-1 // 23732
D=M // 23733
A=A-1 // 23734
D=M-D // 23735
@DO_EQ // 23736
0;JMP // 23737
(COMPARE_Keyboard.readLine_eq6)
@SP // 23738
A=M-1 // 23739
M=D // 23740

////PushInstruction("constant 0")
@SP // 23741
AM=M+1 // 23742
A=A-1 // 23743
M=0 // 23744

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq7 // 23745
D=A // 23746
@13 // 23747
M=D // 23748
@SP // 23749
AM=M-1 // 23750
D=M // 23751
A=A-1 // 23752
D=M-D // 23753
@DO_EQ // 23754
0;JMP // 23755
(COMPARE_Keyboard.readLine_eq7)
@SP // 23756
A=M-1 // 23757
M=D // 23758

////IfGotoInstruction{label='Keyboard.readLine.IfElse1}
// if-goto Keyboard.readLine.IfElse1
@SP // 23759
AM=M-1 // 23760
D=M // 23761
@Keyboard.readLine.IfElse1 // 23762
D;JNE // 23763

////PushInstruction("local 0")
@LCL // 23764
A=M // 23765
D=M // 23766
@SP // 23767
AM=M+1 // 23768
A=A-1 // 23769
M=D // 23770

////CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=4}, currentFunction='Keyboard.readLine'}
// call String.eraseLastChar
@6 // 23771
D=A // 23772
@14 // 23773
M=D // 23774
@String.eraseLastChar // 23775
D=A // 23776
@13 // 23777
M=D // 23778
@Keyboard.readLine.ret.4 // 23779
D=A // 23780
@CALL // 23781
0;JMP // 23782
(Keyboard.readLine.ret.4)

////PopInstruction{address=temp 0}
@SP // 23783
AM=M-1 // 23784
D=M // 23785
@5 // 23786
M=D // 23787

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 23788
0;JMP // 23789

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushInstruction("local 0")
@LCL // 23790
A=M // 23791
D=M // 23792
@SP // 23793
AM=M+1 // 23794
A=A-1 // 23795
M=D // 23796

////PushInstruction("local 1")
@LCL // 23797
A=M+1 // 23798
D=M // 23799
@SP // 23800
AM=M+1 // 23801
A=A-1 // 23802
M=D // 23803

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}
// call String.appendChar
@7 // 23804
D=A // 23805
@14 // 23806
M=D // 23807
@String.appendChar // 23808
D=A // 23809
@13 // 23810
M=D // 23811
@Keyboard.readLine.ret.5 // 23812
D=A // 23813
@CALL // 23814
0;JMP // 23815
(Keyboard.readLine.ret.5)

////PopInstruction{address=temp 0}
@SP // 23816
AM=M-1 // 23817
D=M // 23818
@5 // 23819
M=D // 23820

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 23821
D=A // 23822
@14 // 23823
M=D // 23824
@Keyboard.readChar // 23825
D=A // 23826
@13 // 23827
M=D // 23828
@Keyboard.readLine.ret.6 // 23829
D=A // 23830
@CALL // 23831
0;JMP // 23832
(Keyboard.readLine.ret.6)

////PopInstruction{address=local 1}
@SP // 23833
AM=M-1 // 23834
D=M // 23835
@LCL // 23836
A=M+1 // 23837
M=D // 23838

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 23839
0;JMP // 23840

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 23841
A=M // 23842
D=M // 23843
@SP // 23844
AM=M+1 // 23845
A=A-1 // 23846
M=D // 23847

////ReturnInstruction{}
@RETURN // 23848
0;JMP // 23849

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 23850
AM=M+1 // 23851
A=A-1 // 23852
M=0 // 23853

////PushInstruction("argument 0")
@ARG // 23854
A=M // 23855
D=M // 23856
@SP // 23857
AM=M+1 // 23858
A=A-1 // 23859
M=D // 23860

////CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=0, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call Keyboard.readLine
@6 // 23861
D=A // 23862
@14 // 23863
M=D // 23864
@Keyboard.readLine // 23865
D=A // 23866
@13 // 23867
M=D // 23868
@Keyboard.readInt.ret.0 // 23869
D=A // 23870
@CALL // 23871
0;JMP // 23872
(Keyboard.readInt.ret.0)

////PopInstruction{address=local 0}
@SP // 23873
AM=M-1 // 23874
D=M // 23875
@LCL // 23876
A=M // 23877
M=D // 23878

////PushInstruction("local 0")
@LCL // 23879
A=M // 23880
D=M // 23881
@SP // 23882
AM=M+1 // 23883
A=A-1 // 23884
M=D // 23885

////CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call String.intValue
@6 // 23886
D=A // 23887
@14 // 23888
M=D // 23889
@String.intValue // 23890
D=A // 23891
@13 // 23892
M=D // 23893
@Keyboard.readInt.ret.1 // 23894
D=A // 23895
@CALL // 23896
0;JMP // 23897
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 23898
0;JMP // 23899

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////PushInstruction("argument 0")
@ARG // 23900
A=M // 23901
D=M // 23902
@SP // 23903
AM=M+1 // 23904
A=A-1 // 23905
M=D // 23906

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}
// call Memory.alloc
@6 // 23907
D=A // 23908
@14 // 23909
M=D // 23910
@Memory.alloc // 23911
D=A // 23912
@13 // 23913
M=D // 23914
@Array.new.ret.0 // 23915
D=A // 23916
@CALL // 23917
0;JMP // 23918
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 23919
0;JMP // 23920

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

////PushInstruction("argument 0")
@ARG // 23921
A=M // 23922
D=M // 23923
@SP // 23924
AM=M+1 // 23925
A=A-1 // 23926
M=D // 23927

////PopInstruction{address=pointer 0}
@SP // 23928
AM=M-1 // 23929
D=M // 23930
@3 // 23931
M=D // 23932

////PushInstruction("pointer 0")
@3 // 23933
D=M // 23934
@SP // 23935
AM=M+1 // 23936
A=A-1 // 23937
M=D // 23938

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0, Array.new=1}, currentFunction='Array.dispose'}
// call Memory.deAlloc
@6 // 23939
D=A // 23940
@14 // 23941
M=D // 23942
@Memory.deAlloc // 23943
D=A // 23944
@13 // 23945
M=D // 23946
@Array.dispose.ret.0 // 23947
D=A // 23948
@CALL // 23949
0;JMP // 23950
(Array.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 23951
AM=M-1 // 23952
D=M // 23953
@5 // 23954
M=D // 23955

////PushInstruction("constant 0")
@SP // 23956
AM=M+1 // 23957
A=A-1 // 23958
M=0 // 23959

////ReturnInstruction{}
@RETURN // 23960
0;JMP // 23961

