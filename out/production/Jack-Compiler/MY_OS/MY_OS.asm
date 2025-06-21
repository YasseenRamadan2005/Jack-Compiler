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
AM=M+1 // 292
A=A-1 // 293
M=D // 294

////ArithmeticInstruction{NOT}
@SP // 295
A=M-1 // 296
M=!M // 297

////PushInstruction("constant 0")
@SP // 298
AM=M+1 // 299
A=A-1 // 300
M=0 // 301

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawPixel_eq1 // 302
D=A // 303
@13 // 304
M=D // 305
@SP // 306
AM=M-1 // 307
D=M // 308
A=A-1 // 309
D=M-D // 310
@DO_EQ // 311
0;JMP // 312
(COMPARE_Screen.drawPixel_eq1)
@SP // 313
AM=M+1 // 314
A=A-1 // 315
M=D // 316

////IfGotoInstruction{label='Screen.drawPixel.IfElse1}
// if-goto Screen.drawPixel.IfElse1
@SP // 317
AM=M-1 // 318
D=M // 319
@Screen.drawPixel.IfElse1 // 320
D;JNE // 321

////PushInstruction("local 0")
@LCL // 322
A=M // 323
D=M // 324
@SP // 325
AM=M+1 // 326
A=A-1 // 327
M=D // 328

////PushInstruction("constant 0")
@SP // 329
AM=M+1 // 330
A=A-1 // 331
M=0 // 332

////ArithmeticInstruction{ADD}
@SP // 333
AM=M-1 // 334
D=M // 335
A=A-1 // 336
M=D+M // 337

////PopInstruction{address=pointer 1}
@SP // 338
AM=M-1 // 339
D=M // 340
@4 // 341
M=D // 342

////PushInstruction("that 0")
@THAT // 343
A=M // 344
D=M // 345
@SP // 346
AM=M+1 // 347
A=A-1 // 348
M=D // 349

////PushInstruction("local 1")
@LCL // 350
A=M+1 // 351
D=M // 352
@SP // 353
AM=M+1 // 354
A=A-1 // 355
M=D // 356

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=2}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 357
D=A // 358
@14 // 359
M=D // 360
@Math.twoToThe // 361
D=A // 362
@13 // 363
M=D // 364
@Screen.drawPixel.ret.2 // 365
D=A // 366
@CALL // 367
0;JMP // 368
(Screen.drawPixel.ret.2)

////ArithmeticInstruction{OR}
@SP // 369
AM=M-1 // 370
D=M // 371
A=A-1 // 372
M=D|M // 373

////PushInstruction("local 0")
@LCL // 374
A=M // 375
D=M // 376
@SP // 377
AM=M+1 // 378
A=A-1 // 379
M=D // 380

////PushInstruction("constant 0")
@SP // 381
AM=M+1 // 382
A=A-1 // 383
M=0 // 384

////ArithmeticInstruction{ADD}
@SP // 385
AM=M-1 // 386
D=M // 387
A=A-1 // 388
M=D+M // 389

////PopInstruction{address=pointer 1}
@SP // 390
AM=M-1 // 391
D=M // 392
@4 // 393
M=D // 394

////PopInstruction{address=that 0}
@SP // 395
AM=M-1 // 396
D=M // 397
@THAT // 398
A=M // 399
M=D // 400

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 401
0;JMP // 402

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushInstruction("local 0")
@LCL // 403
A=M // 404
D=M // 405
@SP // 406
AM=M+1 // 407
A=A-1 // 408
M=D // 409

////PushInstruction("constant 0")
@SP // 410
AM=M+1 // 411
A=A-1 // 412
M=0 // 413

////ArithmeticInstruction{ADD}
@SP // 414
AM=M-1 // 415
D=M // 416
A=A-1 // 417
M=D+M // 418

////PopInstruction{address=pointer 1}
@SP // 419
AM=M-1 // 420
D=M // 421
@4 // 422
M=D // 423

////PushInstruction("that 0")
@THAT // 424
A=M // 425
D=M // 426
@SP // 427
AM=M+1 // 428
A=A-1 // 429
M=D // 430

////PushInstruction("local 1")
@LCL // 431
A=M+1 // 432
D=M // 433
@SP // 434
AM=M+1 // 435
A=A-1 // 436
M=D // 437

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=3}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 438
D=A // 439
@14 // 440
M=D // 441
@Math.twoToThe // 442
D=A // 443
@13 // 444
M=D // 445
@Screen.drawPixel.ret.3 // 446
D=A // 447
@CALL // 448
0;JMP // 449
(Screen.drawPixel.ret.3)

////ArithmeticInstruction{NOT}
@SP // 450
A=M-1 // 451
M=!M // 452

////ArithmeticInstruction{AND}
@SP // 453
AM=M-1 // 454
D=M // 455
A=A-1 // 456
M=D&M // 457

////PushInstruction("local 0")
@LCL // 458
A=M // 459
D=M // 460
@SP // 461
AM=M+1 // 462
A=A-1 // 463
M=D // 464

////PushInstruction("constant 0")
@SP // 465
AM=M+1 // 466
A=A-1 // 467
M=0 // 468

////ArithmeticInstruction{ADD}
@SP // 469
AM=M-1 // 470
D=M // 471
A=A-1 // 472
M=D+M // 473

////PopInstruction{address=pointer 1}
@SP // 474
AM=M-1 // 475
D=M // 476
@4 // 477
M=D // 478

////PopInstruction{address=that 0}
@SP // 479
AM=M-1 // 480
D=M // 481
@THAT // 482
A=M // 483
M=D // 484

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 485
AM=M+1 // 486
A=A-1 // 487
M=0 // 488

////ReturnInstruction{}
@RETURN // 489
0;JMP // 490

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 491
AM=M+1 // 492
A=A-1 // 493
M=0 // 494
@SP // 495
AM=M+1 // 496
A=A-1 // 497
M=0 // 498
@SP // 499
AM=M+1 // 500
A=A-1 // 501
M=0 // 502
@SP // 503
AM=M+1 // 504
A=A-1 // 505
M=0 // 506
@SP // 507
AM=M+1 // 508
A=A-1 // 509
M=0 // 510
@SP // 511
AM=M+1 // 512
A=A-1 // 513
M=0 // 514

////PushInstruction("argument 2")
@ARG // 515
A=M+1 // 516
A=A+1 // 517
D=M // 518
@SP // 519
AM=M+1 // 520
A=A-1 // 521
M=D // 522

////PushInstruction("argument 0")
@ARG // 523
A=M // 524
D=M // 525
@SP // 526
AM=M+1 // 527
A=A-1 // 528
M=D // 529

////ArithmeticInstruction{SUB}
@SP // 530
AM=M-1 // 531
D=M // 532
A=A-1 // 533
M=M-D // 534

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 535
D=A // 536
@14 // 537
M=D // 538
@Math.abs // 539
D=A // 540
@13 // 541
M=D // 542
@Screen.drawLine.ret.0 // 543
D=A // 544
@CALL // 545
0;JMP // 546
(Screen.drawLine.ret.0)

////PopInstruction{address=local 0}
@SP // 547
AM=M-1 // 548
D=M // 549
@LCL // 550
A=M // 551
M=D // 552

////PushInstruction("argument 3")
@ARG // 553
A=M+1 // 554
A=A+1 // 555
A=A+1 // 556
D=M // 557
@SP // 558
AM=M+1 // 559
A=A-1 // 560
M=D // 561

////PushInstruction("argument 1")
@ARG // 562
A=M+1 // 563
D=M // 564
@SP // 565
AM=M+1 // 566
A=A-1 // 567
M=D // 568

////ArithmeticInstruction{SUB}
@SP // 569
AM=M-1 // 570
D=M // 571
A=A-1 // 572
M=M-D // 573

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 574
D=A // 575
@14 // 576
M=D // 577
@Math.abs // 578
D=A // 579
@13 // 580
M=D // 581
@Screen.drawLine.ret.1 // 582
D=A // 583
@CALL // 584
0;JMP // 585
(Screen.drawLine.ret.1)

////PopInstruction{address=local 1}
@SP // 586
AM=M-1 // 587
D=M // 588
@LCL // 589
A=M+1 // 590
M=D // 591

////PushInstruction("argument 0")
@ARG // 592
A=M // 593
D=M // 594
@SP // 595
AM=M+1 // 596
A=A-1 // 597
M=D // 598

////PushInstruction("argument 2")
@ARG // 599
A=M+1 // 600
A=A+1 // 601
D=M // 602
@SP // 603
AM=M+1 // 604
A=A-1 // 605
M=D // 606

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt2 // 607
D=A // 608
@13 // 609
M=D // 610
@SP // 611
AM=M-1 // 612
D=M // 613
A=A-1 // 614
D=M-D // 615
@DO_LT // 616
0;JMP // 617
(COMPARE_Screen.drawLine_lt2)
@SP // 618
AM=M+1 // 619
A=A-1 // 620
M=D // 621

////PushInstruction("constant 0")
@SP // 622
AM=M+1 // 623
A=A-1 // 624
M=0 // 625

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq3 // 626
D=A // 627
@13 // 628
M=D // 629
@SP // 630
AM=M-1 // 631
D=M // 632
A=A-1 // 633
D=M-D // 634
@DO_EQ // 635
0;JMP // 636
(COMPARE_Screen.drawLine_eq3)
@SP // 637
AM=M+1 // 638
A=A-1 // 639
M=D // 640

////IfGotoInstruction{label='Screen.drawLine.IfElse1}
// if-goto Screen.drawLine.IfElse1
@SP // 641
AM=M-1 // 642
D=M // 643
@Screen.drawLine.IfElse1 // 644
D;JNE // 645

////PushInstruction("constant 1")
@SP // 646
AM=M+1 // 647
A=A-1 // 648
M=1 // 649

////PopInstruction{address=local 2}
@SP // 650
AM=M-1 // 651
D=M // 652
@LCL // 653
A=M+1 // 654
A=A+1 // 655
M=D // 656

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 657
0;JMP // 658

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushInstruction("constant 1")
@SP // 659
AM=M+1 // 660
A=A-1 // 661
M=1 // 662

////ArithmeticInstruction{NEG}
@SP // 663
A=M-1 // 664
M=-M // 665

////PopInstruction{address=local 2}
@SP // 666
AM=M-1 // 667
D=M // 668
@LCL // 669
A=M+1 // 670
A=A+1 // 671
M=D // 672

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 673
A=M+1 // 674
D=M // 675
@SP // 676
AM=M+1 // 677
A=A-1 // 678
M=D // 679

////PushInstruction("argument 3")
@ARG // 680
A=M+1 // 681
A=A+1 // 682
A=A+1 // 683
D=M // 684
@SP // 685
AM=M+1 // 686
A=A-1 // 687
M=D // 688

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt4 // 689
D=A // 690
@13 // 691
M=D // 692
@SP // 693
AM=M-1 // 694
D=M // 695
A=A-1 // 696
D=M-D // 697
@DO_LT // 698
0;JMP // 699
(COMPARE_Screen.drawLine_lt4)
@SP // 700
AM=M+1 // 701
A=A-1 // 702
M=D // 703

////PushInstruction("constant 0")
@SP // 704
AM=M+1 // 705
A=A-1 // 706
M=0 // 707

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq5 // 708
D=A // 709
@13 // 710
M=D // 711
@SP // 712
AM=M-1 // 713
D=M // 714
A=A-1 // 715
D=M-D // 716
@DO_EQ // 717
0;JMP // 718
(COMPARE_Screen.drawLine_eq5)
@SP // 719
AM=M+1 // 720
A=A-1 // 721
M=D // 722

////IfGotoInstruction{label='Screen.drawLine.IfElse2}
// if-goto Screen.drawLine.IfElse2
@SP // 723
AM=M-1 // 724
D=M // 725
@Screen.drawLine.IfElse2 // 726
D;JNE // 727

////PushInstruction("constant 1")
@SP // 728
AM=M+1 // 729
A=A-1 // 730
M=1 // 731

////PopInstruction{address=local 3}
@SP // 732
AM=M-1 // 733
D=M // 734
@LCL // 735
A=M+1 // 736
A=A+1 // 737
A=A+1 // 738
M=D // 739

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 740
0;JMP // 741

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushInstruction("constant 1")
@SP // 742
AM=M+1 // 743
A=A-1 // 744
M=1 // 745

////ArithmeticInstruction{NEG}
@SP // 746
A=M-1 // 747
M=-M // 748

////PopInstruction{address=local 3}
@SP // 749
AM=M-1 // 750
D=M // 751
@LCL // 752
A=M+1 // 753
A=A+1 // 754
A=A+1 // 755
M=D // 756

////LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)

////PushInstruction("local 0")
@LCL // 757
A=M // 758
D=M // 759
@SP // 760
AM=M+1 // 761
A=A-1 // 762
M=D // 763

////PushInstruction("local 1")
@LCL // 764
A=M+1 // 765
D=M // 766
@SP // 767
AM=M+1 // 768
A=A-1 // 769
M=D // 770

////ArithmeticInstruction{SUB}
@SP // 771
AM=M-1 // 772
D=M // 773
A=A-1 // 774
M=M-D // 775

////PopInstruction{address=local 4}
@LCL // 776
D=M // 777
@4 // 778
A=D+A // 779
D=A // 780
@R13 // 781
M=D // 782
@SP // 783
AM=M-1 // 784
D=M // 785
@R13 // 786
A=M // 787
M=D // 788

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 789
AM=M+1 // 790
A=A-1 // 791
M=0 // 792

////ArithmeticInstruction{NOT}
@SP // 793
A=M-1 // 794
M=!M // 795

////PushInstruction("constant 0")
@SP // 796
AM=M+1 // 797
A=A-1 // 798
M=0 // 799

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq6 // 800
D=A // 801
@13 // 802
M=D // 803
@SP // 804
AM=M-1 // 805
D=M // 806
A=A-1 // 807
D=M-D // 808
@DO_EQ // 809
0;JMP // 810
(COMPARE_Screen.drawLine_eq6)
@SP // 811
AM=M+1 // 812
A=A-1 // 813
M=D // 814

////IfGotoInstruction{label='WHILE_END_Screen.drawLine1}
// if-goto WHILE_END_Screen.drawLine1
@SP // 815
AM=M-1 // 816
D=M // 817
@WHILE_END_Screen.drawLine1 // 818
D;JNE // 819

////PushInstruction("argument 0")
@ARG // 820
A=M // 821
D=M // 822
@SP // 823
AM=M+1 // 824
A=A-1 // 825
M=D // 826

////PushInstruction("argument 1")
@ARG // 827
A=M+1 // 828
D=M // 829
@SP // 830
AM=M+1 // 831
A=A-1 // 832
M=D // 833

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Screen.drawPixel
@7 // 834
D=A // 835
@14 // 836
M=D // 837
@Screen.drawPixel // 838
D=A // 839
@13 // 840
M=D // 841
@Screen.drawLine.ret.2 // 842
D=A // 843
@CALL // 844
0;JMP // 845
(Screen.drawLine.ret.2)

////PopInstruction{address=temp 0}
@SP // 846
AM=M-1 // 847
D=M // 848
@5 // 849
M=D // 850

////PushInstruction("argument 0")
@ARG // 851
A=M // 852
D=M // 853
@SP // 854
AM=M+1 // 855
A=A-1 // 856
M=D // 857

////PushInstruction("argument 2")
@ARG // 858
A=M+1 // 859
A=A+1 // 860
D=M // 861
@SP // 862
AM=M+1 // 863
A=A-1 // 864
M=D // 865

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq7 // 866
D=A // 867
@13 // 868
M=D // 869
@SP // 870
AM=M-1 // 871
D=M // 872
A=A-1 // 873
D=M-D // 874
@DO_EQ // 875
0;JMP // 876
(COMPARE_Screen.drawLine_eq7)
@SP // 877
AM=M+1 // 878
A=A-1 // 879
M=D // 880

////PushInstruction("argument 1")
@ARG // 881
A=M+1 // 882
D=M // 883
@SP // 884
AM=M+1 // 885
A=A-1 // 886
M=D // 887

////PushInstruction("argument 3")
@ARG // 888
A=M+1 // 889
A=A+1 // 890
A=A+1 // 891
D=M // 892
@SP // 893
AM=M+1 // 894
A=A-1 // 895
M=D // 896

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq8 // 897
D=A // 898
@13 // 899
M=D // 900
@SP // 901
AM=M-1 // 902
D=M // 903
A=A-1 // 904
D=M-D // 905
@DO_EQ // 906
0;JMP // 907
(COMPARE_Screen.drawLine_eq8)
@SP // 908
AM=M+1 // 909
A=A-1 // 910
M=D // 911

////ArithmeticInstruction{AND}
@SP // 912
AM=M-1 // 913
D=M // 914
A=A-1 // 915
M=D&M // 916

////PushInstruction("constant 0")
@SP // 917
AM=M+1 // 918
A=A-1 // 919
M=0 // 920

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq9 // 921
D=A // 922
@13 // 923
M=D // 924
@SP // 925
AM=M-1 // 926
D=M // 927
A=A-1 // 928
D=M-D // 929
@DO_EQ // 930
0;JMP // 931
(COMPARE_Screen.drawLine_eq9)
@SP // 932
AM=M+1 // 933
A=A-1 // 934
M=D // 935

////IfGotoInstruction{label='Screen.drawLine.IfElse3}
// if-goto Screen.drawLine.IfElse3
@SP // 936
AM=M-1 // 937
D=M // 938
@Screen.drawLine.IfElse3 // 939
D;JNE // 940

////PushInstruction("constant 0")
@SP // 941
AM=M+1 // 942
A=A-1 // 943
M=0 // 944

////ReturnInstruction{}
@RETURN // 945
0;JMP // 946

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 947
0;JMP // 948

////LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)

////LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)

////PushInstruction("local 4")
@LCL // 949
D=M // 950
@4 // 951
A=D+A // 952
D=M // 953
@SP // 954
AM=M+1 // 955
A=A-1 // 956
M=D // 957

////PushInstruction("local 4")
@LCL // 958
D=M // 959
@4 // 960
A=D+A // 961
D=M // 962
@SP // 963
AM=M+1 // 964
A=A-1 // 965
M=D // 966

////ArithmeticInstruction{ADD}
@SP // 967
AM=M-1 // 968
D=M // 969
A=A-1 // 970
M=D+M // 971

////PopInstruction{address=local 5}
@LCL // 972
D=M // 973
@5 // 974
A=D+A // 975
D=A // 976
@R13 // 977
M=D // 978
@SP // 979
AM=M-1 // 980
D=M // 981
@R13 // 982
A=M // 983
M=D // 984

////PushInstruction("local 5")
@LCL // 985
D=M // 986
@5 // 987
A=D+A // 988
D=M // 989
@SP // 990
AM=M+1 // 991
A=A-1 // 992
M=D // 993

////PushInstruction("local 1")
@LCL // 994
A=M+1 // 995
D=M // 996
@SP // 997
AM=M+1 // 998
A=A-1 // 999
M=D // 1000

////ArithmeticInstruction{ADD}
@SP // 1001
AM=M-1 // 1002
D=M // 1003
A=A-1 // 1004
M=D+M // 1005

////PushInstruction("constant 0")
@SP // 1006
AM=M+1 // 1007
A=A-1 // 1008
M=0 // 1009

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawLine_gt10 // 1010
D=A // 1011
@13 // 1012
M=D // 1013
@SP // 1014
AM=M-1 // 1015
D=M // 1016
A=A-1 // 1017
D=M-D // 1018
@DO_GT // 1019
0;JMP // 1020
(COMPARE_Screen.drawLine_gt10)
@SP // 1021
AM=M+1 // 1022
A=A-1 // 1023
M=D // 1024

////PushInstruction("constant 0")
@SP // 1025
AM=M+1 // 1026
A=A-1 // 1027
M=0 // 1028

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq11 // 1029
D=A // 1030
@13 // 1031
M=D // 1032
@SP // 1033
AM=M-1 // 1034
D=M // 1035
A=A-1 // 1036
D=M-D // 1037
@DO_EQ // 1038
0;JMP // 1039
(COMPARE_Screen.drawLine_eq11)
@SP // 1040
AM=M+1 // 1041
A=A-1 // 1042
M=D // 1043

////IfGotoInstruction{label='Screen.drawLine.IfElse4}
// if-goto Screen.drawLine.IfElse4
@SP // 1044
AM=M-1 // 1045
D=M // 1046
@Screen.drawLine.IfElse4 // 1047
D;JNE // 1048

////PushInstruction("local 4")
@LCL // 1049
D=M // 1050
@4 // 1051
A=D+A // 1052
D=M // 1053
@SP // 1054
AM=M+1 // 1055
A=A-1 // 1056
M=D // 1057

////PushInstruction("local 1")
@LCL // 1058
A=M+1 // 1059
D=M // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064

////ArithmeticInstruction{SUB}
@SP // 1065
AM=M-1 // 1066
D=M // 1067
A=A-1 // 1068
M=M-D // 1069

////PopInstruction{address=local 4}
@LCL // 1070
D=M // 1071
@4 // 1072
A=D+A // 1073
D=A // 1074
@R13 // 1075
M=D // 1076
@SP // 1077
AM=M-1 // 1078
D=M // 1079
@R13 // 1080
A=M // 1081
M=D // 1082

////PushInstruction("argument 0")
@ARG // 1083
A=M // 1084
D=M // 1085
@SP // 1086
AM=M+1 // 1087
A=A-1 // 1088
M=D // 1089

////PushInstruction("local 2")
@LCL // 1090
A=M+1 // 1091
A=A+1 // 1092
D=M // 1093
@SP // 1094
AM=M+1 // 1095
A=A-1 // 1096
M=D // 1097

////ArithmeticInstruction{ADD}
@SP // 1098
AM=M-1 // 1099
D=M // 1100
A=A-1 // 1101
M=D+M // 1102

////PopInstruction{address=argument 0}
@SP // 1103
AM=M-1 // 1104
D=M // 1105
@ARG // 1106
A=M // 1107
M=D // 1108

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 1109
0;JMP // 1110

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////PushInstruction("local 5")
@LCL // 1111
D=M // 1112
@5 // 1113
A=D+A // 1114
D=M // 1115
@SP // 1116
AM=M+1 // 1117
A=A-1 // 1118
M=D // 1119

////PushInstruction("local 0")
@LCL // 1120
A=M // 1121
D=M // 1122
@SP // 1123
AM=M+1 // 1124
A=A-1 // 1125
M=D // 1126

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt12 // 1127
D=A // 1128
@13 // 1129
M=D // 1130
@SP // 1131
AM=M-1 // 1132
D=M // 1133
A=A-1 // 1134
D=M-D // 1135
@DO_LT // 1136
0;JMP // 1137
(COMPARE_Screen.drawLine_lt12)
@SP // 1138
AM=M+1 // 1139
A=A-1 // 1140
M=D // 1141

////PushInstruction("constant 0")
@SP // 1142
AM=M+1 // 1143
A=A-1 // 1144
M=0 // 1145

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq13 // 1146
D=A // 1147
@13 // 1148
M=D // 1149
@SP // 1150
AM=M-1 // 1151
D=M // 1152
A=A-1 // 1153
D=M-D // 1154
@DO_EQ // 1155
0;JMP // 1156
(COMPARE_Screen.drawLine_eq13)
@SP // 1157
AM=M+1 // 1158
A=A-1 // 1159
M=D // 1160

////IfGotoInstruction{label='Screen.drawLine.IfElse5}
// if-goto Screen.drawLine.IfElse5
@SP // 1161
AM=M-1 // 1162
D=M // 1163
@Screen.drawLine.IfElse5 // 1164
D;JNE // 1165

////PushInstruction("local 4")
@LCL // 1166
D=M // 1167
@4 // 1168
A=D+A // 1169
D=M // 1170
@SP // 1171
AM=M+1 // 1172
A=A-1 // 1173
M=D // 1174

////PushInstruction("local 0")
@LCL // 1175
A=M // 1176
D=M // 1177
@SP // 1178
AM=M+1 // 1179
A=A-1 // 1180
M=D // 1181

////ArithmeticInstruction{ADD}
@SP // 1182
AM=M-1 // 1183
D=M // 1184
A=A-1 // 1185
M=D+M // 1186

////PopInstruction{address=local 4}
@LCL // 1187
D=M // 1188
@4 // 1189
A=D+A // 1190
D=A // 1191
@R13 // 1192
M=D // 1193
@SP // 1194
AM=M-1 // 1195
D=M // 1196
@R13 // 1197
A=M // 1198
M=D // 1199

////PushInstruction("argument 1")
@ARG // 1200
A=M+1 // 1201
D=M // 1202
@SP // 1203
AM=M+1 // 1204
A=A-1 // 1205
M=D // 1206

////PushInstruction("local 3")
@LCL // 1207
A=M+1 // 1208
A=A+1 // 1209
A=A+1 // 1210
D=M // 1211
@SP // 1212
AM=M+1 // 1213
A=A-1 // 1214
M=D // 1215

////ArithmeticInstruction{ADD}
@SP // 1216
AM=M-1 // 1217
D=M // 1218
A=A-1 // 1219
M=D+M // 1220

////PopInstruction{address=argument 1}
@SP // 1221
AM=M-1 // 1222
D=M // 1223
@ARG // 1224
A=M+1 // 1225
M=D // 1226

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 1227
0;JMP // 1228

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 1229
0;JMP // 1230

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 1231
AM=M+1 // 1232
A=A-1 // 1233
M=0 // 1234

////ReturnInstruction{}
@RETURN // 1235
0;JMP // 1236

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 1237
AM=M+1 // 1238
A=A-1 // 1239
M=0 // 1240

////PushInstruction("argument 0")
@ARG // 1241
A=M // 1242
D=M // 1243
@SP // 1244
AM=M+1 // 1245
A=A-1 // 1246
M=D // 1247

////PopInstruction{address=local 0}
@SP // 1248
AM=M-1 // 1249
D=M // 1250
@LCL // 1251
A=M // 1252
M=D // 1253

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////PushInstruction("local 0")
@LCL // 1254
A=M // 1255
D=M // 1256
@SP // 1257
AM=M+1 // 1258
A=A-1 // 1259
M=D // 1260

////PushInstruction("argument 1")
@ARG // 1261
A=M+1 // 1262
D=M // 1263
@SP // 1264
AM=M+1 // 1265
A=A-1 // 1266
M=D // 1267

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawHorizontalLine_gt14 // 1268
D=A // 1269
@13 // 1270
M=D // 1271
@SP // 1272
AM=M-1 // 1273
D=M // 1274
A=A-1 // 1275
D=M-D // 1276
@DO_GT // 1277
0;JMP // 1278
(COMPARE_Screen.drawHorizontalLine_gt14)
@SP // 1279
AM=M+1 // 1280
A=A-1 // 1281
M=D // 1282

////ArithmeticInstruction{NOT}
@SP // 1283
A=M-1 // 1284
M=!M // 1285

////PushInstruction("constant 0")
@SP // 1286
AM=M+1 // 1287
A=A-1 // 1288
M=0 // 1289

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawHorizontalLine_eq15 // 1290
D=A // 1291
@13 // 1292
M=D // 1293
@SP // 1294
AM=M-1 // 1295
D=M // 1296
A=A-1 // 1297
D=M-D // 1298
@DO_EQ // 1299
0;JMP // 1300
(COMPARE_Screen.drawHorizontalLine_eq15)
@SP // 1301
AM=M+1 // 1302
A=A-1 // 1303
M=D // 1304

////IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// if-goto WHILE_END_Screen.drawHorizontalLine1
@SP // 1305
AM=M-1 // 1306
D=M // 1307
@WHILE_END_Screen.drawHorizontalLine1 // 1308
D;JNE // 1309

////PushInstruction("local 0")
@LCL // 1310
A=M // 1311
D=M // 1312
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=D // 1316

////PushInstruction("argument 2")
@ARG // 1317
A=M+1 // 1318
A=A+1 // 1319
D=M // 1320
@SP // 1321
AM=M+1 // 1322
A=A-1 // 1323
M=D // 1324

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawHorizontalLine'}
// call Screen.drawPixel
@7 // 1325
D=A // 1326
@14 // 1327
M=D // 1328
@Screen.drawPixel // 1329
D=A // 1330
@13 // 1331
M=D // 1332
@Screen.drawHorizontalLine.ret.0 // 1333
D=A // 1334
@CALL // 1335
0;JMP // 1336
(Screen.drawHorizontalLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 1337
AM=M-1 // 1338
D=M // 1339
@5 // 1340
M=D // 1341

////PushInstruction("local 0")
@LCL // 1342
A=M // 1343
D=M // 1344
@SP // 1345
AM=M+1 // 1346
A=A-1 // 1347
M=D // 1348

////PushInstruction("constant 1")
@SP // 1349
AM=M+1 // 1350
A=A-1 // 1351
M=1 // 1352

////ArithmeticInstruction{ADD}
@SP // 1353
AM=M-1 // 1354
D=M // 1355
A=A-1 // 1356
M=D+M // 1357

////PopInstruction{address=local 0}
@SP // 1358
AM=M-1 // 1359
D=M // 1360
@LCL // 1361
A=M // 1362
M=D // 1363

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 1364
0;JMP // 1365

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 1366
AM=M+1 // 1367
A=A-1 // 1368
M=0 // 1369

////ReturnInstruction{}
@RETURN // 1370
0;JMP // 1371

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 1372
AM=M+1 // 1373
A=A-1 // 1374
M=0 // 1375
@SP // 1376
AM=M+1 // 1377
A=A-1 // 1378
M=0 // 1379
@SP // 1380
AM=M+1 // 1381
A=A-1 // 1382
M=0 // 1383
@SP // 1384
AM=M+1 // 1385
A=A-1 // 1386
M=0 // 1387
@SP // 1388
AM=M+1 // 1389
A=A-1 // 1390
M=0 // 1391

////PushInstruction("constant 0")
@SP // 1392
AM=M+1 // 1393
A=A-1 // 1394
M=0 // 1395

////PopInstruction{address=local 0}
@SP // 1396
AM=M-1 // 1397
D=M // 1398
@LCL // 1399
A=M // 1400
M=D // 1401

////PushInstruction("argument 2")
@ARG // 1402
A=M+1 // 1403
A=A+1 // 1404
D=M // 1405
@SP // 1406
AM=M+1 // 1407
A=A-1 // 1408
M=D // 1409

////PopInstruction{address=local 1}
@SP // 1410
AM=M-1 // 1411
D=M // 1412
@LCL // 1413
A=M+1 // 1414
M=D // 1415

////PushInstruction("constant 1")
@SP // 1416
AM=M+1 // 1417
A=A-1 // 1418
M=1 // 1419

////PushInstruction("argument 2")
@ARG // 1420
A=M+1 // 1421
A=A+1 // 1422
D=M // 1423
@SP // 1424
AM=M+1 // 1425
A=A-1 // 1426
M=D // 1427

////ArithmeticInstruction{SUB}
@SP // 1428
AM=M-1 // 1429
D=M // 1430
A=A-1 // 1431
M=M-D // 1432

////PopInstruction{address=local 2}
@SP // 1433
AM=M-1 // 1434
D=M // 1435
@LCL // 1436
A=M+1 // 1437
A=A+1 // 1438
M=D // 1439

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////PushInstruction("local 0")
@LCL // 1440
A=M // 1441
D=M // 1442
@SP // 1443
AM=M+1 // 1444
A=A-1 // 1445
M=D // 1446

////PushInstruction("local 1")
@LCL // 1447
A=M+1 // 1448
D=M // 1449
@SP // 1450
AM=M+1 // 1451
A=A-1 // 1452
M=D // 1453

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawCircle_gt16 // 1454
D=A // 1455
@13 // 1456
M=D // 1457
@SP // 1458
AM=M-1 // 1459
D=M // 1460
A=A-1 // 1461
D=M-D // 1462
@DO_GT // 1463
0;JMP // 1464
(COMPARE_Screen.drawCircle_gt16)
@SP // 1465
AM=M+1 // 1466
A=A-1 // 1467
M=D // 1468

////ArithmeticInstruction{NOT}
@SP // 1469
A=M-1 // 1470
M=!M // 1471

////PushInstruction("constant 0")
@SP // 1472
AM=M+1 // 1473
A=A-1 // 1474
M=0 // 1475

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq17 // 1476
D=A // 1477
@13 // 1478
M=D // 1479
@SP // 1480
AM=M-1 // 1481
D=M // 1482
A=A-1 // 1483
D=M-D // 1484
@DO_EQ // 1485
0;JMP // 1486
(COMPARE_Screen.drawCircle_eq17)
@SP // 1487
AM=M+1 // 1488
A=A-1 // 1489
M=D // 1490

////IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}
// if-goto WHILE_END_Screen.drawCircle1
@SP // 1491
AM=M-1 // 1492
D=M // 1493
@WHILE_END_Screen.drawCircle1 // 1494
D;JNE // 1495

////PushInstruction("argument 0")
@ARG // 1496
A=M // 1497
D=M // 1498
@SP // 1499
AM=M+1 // 1500
A=A-1 // 1501
M=D // 1502

////PushInstruction("local 0")
@LCL // 1503
A=M // 1504
D=M // 1505
@SP // 1506
AM=M+1 // 1507
A=A-1 // 1508
M=D // 1509

////ArithmeticInstruction{SUB}
@SP // 1510
AM=M-1 // 1511
D=M // 1512
A=A-1 // 1513
M=M-D // 1514

////PushInstruction("argument 0")
@ARG // 1515
A=M // 1516
D=M // 1517
@SP // 1518
AM=M+1 // 1519
A=A-1 // 1520
M=D // 1521

////PushInstruction("local 0")
@LCL // 1522
A=M // 1523
D=M // 1524
@SP // 1525
AM=M+1 // 1526
A=A-1 // 1527
M=D // 1528

////ArithmeticInstruction{ADD}
@SP // 1529
AM=M-1 // 1530
D=M // 1531
A=A-1 // 1532
M=D+M // 1533

////PushInstruction("argument 1")
@ARG // 1534
A=M+1 // 1535
D=M // 1536
@SP // 1537
AM=M+1 // 1538
A=A-1 // 1539
M=D // 1540

////PushInstruction("local 1")
@LCL // 1541
A=M+1 // 1542
D=M // 1543
@SP // 1544
AM=M+1 // 1545
A=A-1 // 1546
M=D // 1547

////ArithmeticInstruction{ADD}
@SP // 1548
AM=M-1 // 1549
D=M // 1550
A=A-1 // 1551
M=D+M // 1552

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1553
D=A // 1554
@14 // 1555
M=D // 1556
@Screen.drawHorizontalLine // 1557
D=A // 1558
@13 // 1559
M=D // 1560
@Screen.drawCircle.ret.0 // 1561
D=A // 1562
@CALL // 1563
0;JMP // 1564
(Screen.drawCircle.ret.0)

////PopInstruction{address=temp 0}
@SP // 1565
AM=M-1 // 1566
D=M // 1567
@5 // 1568
M=D // 1569

////PushInstruction("argument 0")
@ARG // 1570
A=M // 1571
D=M // 1572
@SP // 1573
AM=M+1 // 1574
A=A-1 // 1575
M=D // 1576

////PushInstruction("local 0")
@LCL // 1577
A=M // 1578
D=M // 1579
@SP // 1580
AM=M+1 // 1581
A=A-1 // 1582
M=D // 1583

////ArithmeticInstruction{SUB}
@SP // 1584
AM=M-1 // 1585
D=M // 1586
A=A-1 // 1587
M=M-D // 1588

////PushInstruction("argument 0")
@ARG // 1589
A=M // 1590
D=M // 1591
@SP // 1592
AM=M+1 // 1593
A=A-1 // 1594
M=D // 1595

////PushInstruction("local 0")
@LCL // 1596
A=M // 1597
D=M // 1598
@SP // 1599
AM=M+1 // 1600
A=A-1 // 1601
M=D // 1602

////ArithmeticInstruction{ADD}
@SP // 1603
AM=M-1 // 1604
D=M // 1605
A=A-1 // 1606
M=D+M // 1607

////PushInstruction("argument 1")
@ARG // 1608
A=M+1 // 1609
D=M // 1610
@SP // 1611
AM=M+1 // 1612
A=A-1 // 1613
M=D // 1614

////PushInstruction("local 1")
@LCL // 1615
A=M+1 // 1616
D=M // 1617
@SP // 1618
AM=M+1 // 1619
A=A-1 // 1620
M=D // 1621

////ArithmeticInstruction{SUB}
@SP // 1622
AM=M-1 // 1623
D=M // 1624
A=A-1 // 1625
M=M-D // 1626

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=1, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1627
D=A // 1628
@14 // 1629
M=D // 1630
@Screen.drawHorizontalLine // 1631
D=A // 1632
@13 // 1633
M=D // 1634
@Screen.drawCircle.ret.1 // 1635
D=A // 1636
@CALL // 1637
0;JMP // 1638
(Screen.drawCircle.ret.1)

////PopInstruction{address=temp 0}
@SP // 1639
AM=M-1 // 1640
D=M // 1641
@5 // 1642
M=D // 1643

////PushInstruction("argument 0")
@ARG // 1644
A=M // 1645
D=M // 1646
@SP // 1647
AM=M+1 // 1648
A=A-1 // 1649
M=D // 1650

////PushInstruction("local 1")
@LCL // 1651
A=M+1 // 1652
D=M // 1653
@SP // 1654
AM=M+1 // 1655
A=A-1 // 1656
M=D // 1657

////ArithmeticInstruction{SUB}
@SP // 1658
AM=M-1 // 1659
D=M // 1660
A=A-1 // 1661
M=M-D // 1662

////PushInstruction("argument 0")
@ARG // 1663
A=M // 1664
D=M // 1665
@SP // 1666
AM=M+1 // 1667
A=A-1 // 1668
M=D // 1669

////PushInstruction("local 1")
@LCL // 1670
A=M+1 // 1671
D=M // 1672
@SP // 1673
AM=M+1 // 1674
A=A-1 // 1675
M=D // 1676

////ArithmeticInstruction{ADD}
@SP // 1677
AM=M-1 // 1678
D=M // 1679
A=A-1 // 1680
M=D+M // 1681

////PushInstruction("argument 1")
@ARG // 1682
A=M+1 // 1683
D=M // 1684
@SP // 1685
AM=M+1 // 1686
A=A-1 // 1687
M=D // 1688

////PushInstruction("local 0")
@LCL // 1689
A=M // 1690
D=M // 1691
@SP // 1692
AM=M+1 // 1693
A=A-1 // 1694
M=D // 1695

////ArithmeticInstruction{ADD}
@SP // 1696
AM=M-1 // 1697
D=M // 1698
A=A-1 // 1699
M=D+M // 1700

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=2, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1701
D=A // 1702
@14 // 1703
M=D // 1704
@Screen.drawHorizontalLine // 1705
D=A // 1706
@13 // 1707
M=D // 1708
@Screen.drawCircle.ret.2 // 1709
D=A // 1710
@CALL // 1711
0;JMP // 1712
(Screen.drawCircle.ret.2)

////PopInstruction{address=temp 0}
@SP // 1713
AM=M-1 // 1714
D=M // 1715
@5 // 1716
M=D // 1717

////PushInstruction("argument 0")
@ARG // 1718
A=M // 1719
D=M // 1720
@SP // 1721
AM=M+1 // 1722
A=A-1 // 1723
M=D // 1724

////PushInstruction("local 1")
@LCL // 1725
A=M+1 // 1726
D=M // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D // 1731

////ArithmeticInstruction{SUB}
@SP // 1732
AM=M-1 // 1733
D=M // 1734
A=A-1 // 1735
M=M-D // 1736

////PushInstruction("argument 0")
@ARG // 1737
A=M // 1738
D=M // 1739
@SP // 1740
AM=M+1 // 1741
A=A-1 // 1742
M=D // 1743

////PushInstruction("local 1")
@LCL // 1744
A=M+1 // 1745
D=M // 1746
@SP // 1747
AM=M+1 // 1748
A=A-1 // 1749
M=D // 1750

////ArithmeticInstruction{ADD}
@SP // 1751
AM=M-1 // 1752
D=M // 1753
A=A-1 // 1754
M=D+M // 1755

////PushInstruction("argument 1")
@ARG // 1756
A=M+1 // 1757
D=M // 1758
@SP // 1759
AM=M+1 // 1760
A=A-1 // 1761
M=D // 1762

////PushInstruction("local 0")
@LCL // 1763
A=M // 1764
D=M // 1765
@SP // 1766
AM=M+1 // 1767
A=A-1 // 1768
M=D // 1769

////ArithmeticInstruction{SUB}
@SP // 1770
AM=M-1 // 1771
D=M // 1772
A=A-1 // 1773
M=M-D // 1774

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 1775
D=A // 1776
@14 // 1777
M=D // 1778
@Screen.drawHorizontalLine // 1779
D=A // 1780
@13 // 1781
M=D // 1782
@Screen.drawCircle.ret.3 // 1783
D=A // 1784
@CALL // 1785
0;JMP // 1786
(Screen.drawCircle.ret.3)

////PopInstruction{address=temp 0}
@SP // 1787
AM=M-1 // 1788
D=M // 1789
@5 // 1790
M=D // 1791

////PushInstruction("local 2")
@LCL // 1792
A=M+1 // 1793
A=A+1 // 1794
D=M // 1795
@SP // 1796
AM=M+1 // 1797
A=A-1 // 1798
M=D // 1799

////PushInstruction("constant 0")
@SP // 1800
AM=M+1 // 1801
A=A-1 // 1802
M=0 // 1803

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawCircle_lt18 // 1804
D=A // 1805
@13 // 1806
M=D // 1807
@SP // 1808
AM=M-1 // 1809
D=M // 1810
A=A-1 // 1811
D=M-D // 1812
@DO_LT // 1813
0;JMP // 1814
(COMPARE_Screen.drawCircle_lt18)
@SP // 1815
AM=M+1 // 1816
A=A-1 // 1817
M=D // 1818

////PushInstruction("constant 0")
@SP // 1819
AM=M+1 // 1820
A=A-1 // 1821
M=0 // 1822

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq19 // 1823
D=A // 1824
@13 // 1825
M=D // 1826
@SP // 1827
AM=M-1 // 1828
D=M // 1829
A=A-1 // 1830
D=M-D // 1831
@DO_EQ // 1832
0;JMP // 1833
(COMPARE_Screen.drawCircle_eq19)
@SP // 1834
AM=M+1 // 1835
A=A-1 // 1836
M=D // 1837

////IfGotoInstruction{label='Screen.drawCircle.IfElse1}
// if-goto Screen.drawCircle.IfElse1
@SP // 1838
AM=M-1 // 1839
D=M // 1840
@Screen.drawCircle.IfElse1 // 1841
D;JNE // 1842

////PushInstruction("local 2")
@LCL // 1843
A=M+1 // 1844
A=A+1 // 1845
D=M // 1846
@SP // 1847
AM=M+1 // 1848
A=A-1 // 1849
M=D // 1850

////PushInstruction("local 0")
@LCL // 1851
A=M // 1852
D=M // 1853
@SP // 1854
AM=M+1 // 1855
A=A-1 // 1856
M=D // 1857

////PushInstruction("local 0")
@LCL // 1858
A=M // 1859
D=M // 1860
@SP // 1861
AM=M+1 // 1862
A=A-1 // 1863
M=D // 1864

////ArithmeticInstruction{ADD}
@SP // 1865
AM=M-1 // 1866
D=M // 1867
A=A-1 // 1868
M=D+M // 1869

////ArithmeticInstruction{ADD}
@SP // 1870
AM=M-1 // 1871
D=M // 1872
A=A-1 // 1873
M=D+M // 1874

////PushInstruction("constant 3")
@3 // 1875
D=A // 1876
@SP // 1877
AM=M+1 // 1878
A=A-1 // 1879
M=D // 1880

////ArithmeticInstruction{ADD}
@SP // 1881
AM=M-1 // 1882
D=M // 1883
A=A-1 // 1884
M=D+M // 1885

////PopInstruction{address=local 2}
@SP // 1886
AM=M-1 // 1887
D=M // 1888
@LCL // 1889
A=M+1 // 1890
A=A+1 // 1891
M=D // 1892

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 1893
0;JMP // 1894

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushInstruction("local 2")
@LCL // 1895
A=M+1 // 1896
A=A+1 // 1897
D=M // 1898
@SP // 1899
AM=M+1 // 1900
A=A-1 // 1901
M=D // 1902

////PushInstruction("local 0")
@LCL // 1903
A=M // 1904
D=M // 1905
@SP // 1906
AM=M+1 // 1907
A=A-1 // 1908
M=D // 1909

////PushInstruction("local 1")
@LCL // 1910
A=M+1 // 1911
D=M // 1912
@SP // 1913
AM=M+1 // 1914
A=A-1 // 1915
M=D // 1916

////ArithmeticInstruction{SUB}
@SP // 1917
AM=M-1 // 1918
D=M // 1919
A=A-1 // 1920
M=M-D // 1921

////PushInstruction("local 0")
@LCL // 1922
A=M // 1923
D=M // 1924
@SP // 1925
AM=M+1 // 1926
A=A-1 // 1927
M=D // 1928

////PushInstruction("local 1")
@LCL // 1929
A=M+1 // 1930
D=M // 1931
@SP // 1932
AM=M+1 // 1933
A=A-1 // 1934
M=D // 1935

////ArithmeticInstruction{SUB}
@SP // 1936
AM=M-1 // 1937
D=M // 1938
A=A-1 // 1939
M=M-D // 1940

////ArithmeticInstruction{ADD}
@SP // 1941
AM=M-1 // 1942
D=M // 1943
A=A-1 // 1944
M=D+M // 1945

////ArithmeticInstruction{ADD}
@SP // 1946
AM=M-1 // 1947
D=M // 1948
A=A-1 // 1949
M=D+M // 1950

////PushInstruction("constant 5")
@5 // 1951
D=A // 1952
@SP // 1953
AM=M+1 // 1954
A=A-1 // 1955
M=D // 1956

////ArithmeticInstruction{ADD}
@SP // 1957
AM=M-1 // 1958
D=M // 1959
A=A-1 // 1960
M=D+M // 1961

////PopInstruction{address=local 2}
@SP // 1962
AM=M-1 // 1963
D=M // 1964
@LCL // 1965
A=M+1 // 1966
A=A+1 // 1967
M=D // 1968

////PushInstruction("local 1")
@LCL // 1969
A=M+1 // 1970
D=M // 1971
@SP // 1972
AM=M+1 // 1973
A=A-1 // 1974
M=D // 1975

////PushInstruction("constant 1")
@SP // 1976
AM=M+1 // 1977
A=A-1 // 1978
M=1 // 1979

////ArithmeticInstruction{SUB}
@SP // 1980
AM=M-1 // 1981
D=M // 1982
A=A-1 // 1983
M=M-D // 1984

////PopInstruction{address=local 1}
@SP // 1985
AM=M-1 // 1986
D=M // 1987
@LCL // 1988
A=M+1 // 1989
M=D // 1990

////LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)

////PushInstruction("local 0")
@LCL // 1991
A=M // 1992
D=M // 1993
@SP // 1994
AM=M+1 // 1995
A=A-1 // 1996
M=D // 1997

////PushInstruction("constant 1")
@SP // 1998
AM=M+1 // 1999
A=A-1 // 2000
M=1 // 2001

////ArithmeticInstruction{ADD}
@SP // 2002
AM=M-1 // 2003
D=M // 2004
A=A-1 // 2005
M=D+M // 2006

////PopInstruction{address=local 0}
@SP // 2007
AM=M-1 // 2008
D=M // 2009
@LCL // 2010
A=M // 2011
M=D // 2012

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 2013
0;JMP // 2014

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 2015
AM=M+1 // 2016
A=A-1 // 2017
M=0 // 2018

////ReturnInstruction{}
@RETURN // 2019
0;JMP // 2020

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
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
@SP // 2041
AM=M+1 // 2042
A=A-1 // 2043
M=0 // 2044
@SP // 2045
AM=M+1 // 2046
A=A-1 // 2047
M=0 // 2048
@SP // 2049
AM=M+1 // 2050
A=A-1 // 2051
M=0 // 2052
@SP // 2053
AM=M+1 // 2054
A=A-1 // 2055
M=0 // 2056
@SP // 2057
AM=M+1 // 2058
A=A-1 // 2059
M=0 // 2060

////PushInstruction("constant 1")
@SP // 2061
AM=M+1 // 2062
A=A-1 // 2063
M=1 // 2064

////ArithmeticInstruction{NEG}
@SP // 2065
A=M-1 // 2066
M=-M // 2067

////PopInstruction{address=local 9}
@LCL // 2068
D=M // 2069
@9 // 2070
A=D+A // 2071
D=A // 2072
@R13 // 2073
M=D // 2074
@SP // 2075
AM=M-1 // 2076
D=M // 2077
@R13 // 2078
A=M // 2079
M=D // 2080

////PushInstruction("static 0")
@Screen.0 // 2081
D=M // 2082
@SP // 2083
AM=M+1 // 2084
A=A-1 // 2085
M=D // 2086

////ArithmeticInstruction{NOT}
@SP // 2087
A=M-1 // 2088
M=!M // 2089

////PushInstruction("constant 0")
@SP // 2090
AM=M+1 // 2091
A=A-1 // 2092
M=0 // 2093

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq20 // 2094
D=A // 2095
@13 // 2096
M=D // 2097
@SP // 2098
AM=M-1 // 2099
D=M // 2100
A=A-1 // 2101
D=M-D // 2102
@DO_EQ // 2103
0;JMP // 2104
(COMPARE_Screen.drawRectangle_eq20)
@SP // 2105
AM=M+1 // 2106
A=A-1 // 2107
M=D // 2108

////IfGotoInstruction{label='Screen.drawRectangle.IfElse1}
// if-goto Screen.drawRectangle.IfElse1
@SP // 2109
AM=M-1 // 2110
D=M // 2111
@Screen.drawRectangle.IfElse1 // 2112
D;JNE // 2113

////PushInstruction("constant 0")
@SP // 2114
AM=M+1 // 2115
A=A-1 // 2116
M=0 // 2117

////PopInstruction{address=local 9}
@LCL // 2118
D=M // 2119
@9 // 2120
A=D+A // 2121
D=A // 2122
@R13 // 2123
M=D // 2124
@SP // 2125
AM=M-1 // 2126
D=M // 2127
@R13 // 2128
A=M // 2129
M=D // 2130

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 2131
0;JMP // 2132

////LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 2133
A=M+1 // 2134
D=M // 2135
@SP // 2136
AM=M+1 // 2137
A=A-1 // 2138
M=D // 2139

////PopInstruction{address=local 0}
@SP // 2140
AM=M-1 // 2141
D=M // 2142
@LCL // 2143
A=M // 2144
M=D // 2145

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////PushInstruction("local 0")
@LCL // 2146
A=M // 2147
D=M // 2148
@SP // 2149
AM=M+1 // 2150
A=A-1 // 2151
M=D // 2152

////PushInstruction("argument 3")
@ARG // 2153
A=M+1 // 2154
A=A+1 // 2155
A=A+1 // 2156
D=M // 2157
@SP // 2158
AM=M+1 // 2159
A=A-1 // 2160
M=D // 2161

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawRectangle_gt21 // 2162
D=A // 2163
@13 // 2164
M=D // 2165
@SP // 2166
AM=M-1 // 2167
D=M // 2168
A=A-1 // 2169
D=M-D // 2170
@DO_GT // 2171
0;JMP // 2172
(COMPARE_Screen.drawRectangle_gt21)
@SP // 2173
AM=M+1 // 2174
A=A-1 // 2175
M=D // 2176

////ArithmeticInstruction{NOT}
@SP // 2177
A=M-1 // 2178
M=!M // 2179

////PushInstruction("constant 0")
@SP // 2180
AM=M+1 // 2181
A=A-1 // 2182
M=0 // 2183

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq22 // 2184
D=A // 2185
@13 // 2186
M=D // 2187
@SP // 2188
AM=M-1 // 2189
D=M // 2190
A=A-1 // 2191
D=M-D // 2192
@DO_EQ // 2193
0;JMP // 2194
(COMPARE_Screen.drawRectangle_eq22)
@SP // 2195
AM=M+1 // 2196
A=A-1 // 2197
M=D // 2198

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}
// if-goto WHILE_END_Screen.drawRectangle1
@SP // 2199
AM=M-1 // 2200
D=M // 2201
@WHILE_END_Screen.drawRectangle1 // 2202
D;JNE // 2203

////PushInstruction("argument 0")
@ARG // 2204
A=M // 2205
D=M // 2206
@SP // 2207
AM=M+1 // 2208
A=A-1 // 2209
M=D // 2210

////PushInstruction("constant 16")
@16 // 2211
D=A // 2212
@SP // 2213
AM=M+1 // 2214
A=A-1 // 2215
M=D // 2216

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 2217
D=A // 2218
@14 // 2219
M=D // 2220
@Math.divide // 2221
D=A // 2222
@13 // 2223
M=D // 2224
@Screen.drawRectangle.ret.0 // 2225
D=A // 2226
@CALL // 2227
0;JMP // 2228
(Screen.drawRectangle.ret.0)

////PopInstruction{address=local 1}
@SP // 2229
AM=M-1 // 2230
D=M // 2231
@LCL // 2232
A=M+1 // 2233
M=D // 2234

////PushInstruction("argument 2")
@ARG // 2235
A=M+1 // 2236
A=A+1 // 2237
D=M // 2238
@SP // 2239
AM=M+1 // 2240
A=A-1 // 2241
M=D // 2242

////PushInstruction("constant 16")
@16 // 2243
D=A // 2244
@SP // 2245
AM=M+1 // 2246
A=A-1 // 2247
M=D // 2248

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 2249
D=A // 2250
@14 // 2251
M=D // 2252
@Math.divide // 2253
D=A // 2254
@13 // 2255
M=D // 2256
@Screen.drawRectangle.ret.1 // 2257
D=A // 2258
@CALL // 2259
0;JMP // 2260
(Screen.drawRectangle.ret.1)

////PopInstruction{address=local 2}
@SP // 2261
AM=M-1 // 2262
D=M // 2263
@LCL // 2264
A=M+1 // 2265
A=A+1 // 2266
M=D // 2267

////PushInstruction("argument 0")
@ARG // 2268
A=M // 2269
D=M // 2270
@SP // 2271
AM=M+1 // 2272
A=A-1 // 2273
M=D // 2274

////PushInstruction("constant 15")
@15 // 2275
D=A // 2276
@SP // 2277
AM=M+1 // 2278
A=A-1 // 2279
M=D // 2280

////ArithmeticInstruction{AND}
@SP // 2281
AM=M-1 // 2282
D=M // 2283
A=A-1 // 2284
M=D&M // 2285

////PopInstruction{address=local 3}
@SP // 2286
AM=M-1 // 2287
D=M // 2288
@LCL // 2289
A=M+1 // 2290
A=A+1 // 2291
A=A+1 // 2292
M=D // 2293

////PushInstruction("argument 2")
@ARG // 2294
A=M+1 // 2295
A=A+1 // 2296
D=M // 2297
@SP // 2298
AM=M+1 // 2299
A=A-1 // 2300
M=D // 2301

////PushInstruction("constant 15")
@15 // 2302
D=A // 2303
@SP // 2304
AM=M+1 // 2305
A=A-1 // 2306
M=D // 2307

////ArithmeticInstruction{AND}
@SP // 2308
AM=M-1 // 2309
D=M // 2310
A=A-1 // 2311
M=D&M // 2312

////PopInstruction{address=local 4}
@LCL // 2313
D=M // 2314
@4 // 2315
A=D+A // 2316
D=A // 2317
@R13 // 2318
M=D // 2319
@SP // 2320
AM=M-1 // 2321
D=M // 2322
@R13 // 2323
A=M // 2324
M=D // 2325

////PushInstruction("local 0")
@LCL // 2326
A=M // 2327
D=M // 2328
@SP // 2329
AM=M+1 // 2330
A=A-1 // 2331
M=D // 2332

////PushInstruction("constant 32")
@32 // 2333
D=A // 2334
@SP // 2335
AM=M+1 // 2336
A=A-1 // 2337
M=D // 2338

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.multiply
@7 // 2339
D=A // 2340
@14 // 2341
M=D // 2342
@Math.multiply // 2343
D=A // 2344
@13 // 2345
M=D // 2346
@Screen.drawRectangle.ret.2 // 2347
D=A // 2348
@CALL // 2349
0;JMP // 2350
(Screen.drawRectangle.ret.2)

////PopInstruction{address=local 5}
@LCL // 2351
D=M // 2352
@5 // 2353
A=D+A // 2354
D=A // 2355
@R13 // 2356
M=D // 2357
@SP // 2358
AM=M-1 // 2359
D=M // 2360
@R13 // 2361
A=M // 2362
M=D // 2363

////PushInstruction("local 1")
@LCL // 2364
A=M+1 // 2365
D=M // 2366
@SP // 2367
AM=M+1 // 2368
A=A-1 // 2369
M=D // 2370

////PushInstruction("local 2")
@LCL // 2371
A=M+1 // 2372
A=A+1 // 2373
D=M // 2374
@SP // 2375
AM=M+1 // 2376
A=A-1 // 2377
M=D // 2378

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq23 // 2379
D=A // 2380
@13 // 2381
M=D // 2382
@SP // 2383
AM=M-1 // 2384
D=M // 2385
A=A-1 // 2386
D=M-D // 2387
@DO_EQ // 2388
0;JMP // 2389
(COMPARE_Screen.drawRectangle_eq23)
@SP // 2390
AM=M+1 // 2391
A=A-1 // 2392
M=D // 2393

////PushInstruction("constant 0")
@SP // 2394
AM=M+1 // 2395
A=A-1 // 2396
M=0 // 2397

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq24 // 2398
D=A // 2399
@13 // 2400
M=D // 2401
@SP // 2402
AM=M-1 // 2403
D=M // 2404
A=A-1 // 2405
D=M-D // 2406
@DO_EQ // 2407
0;JMP // 2408
(COMPARE_Screen.drawRectangle_eq24)
@SP // 2409
AM=M+1 // 2410
A=A-1 // 2411
M=D // 2412

////IfGotoInstruction{label='Screen.drawRectangle.IfElse2}
// if-goto Screen.drawRectangle.IfElse2
@SP // 2413
AM=M-1 // 2414
D=M // 2415
@Screen.drawRectangle.IfElse2 // 2416
D;JNE // 2417

////PushInstruction("local 4")
@LCL // 2418
D=M // 2419
@4 // 2420
A=D+A // 2421
D=M // 2422
@SP // 2423
AM=M+1 // 2424
A=A-1 // 2425
M=D // 2426

////PushInstruction("constant 1")
@SP // 2427
AM=M+1 // 2428
A=A-1 // 2429
M=1 // 2430

////ArithmeticInstruction{ADD}
@SP // 2431
AM=M-1 // 2432
D=M // 2433
A=A-1 // 2434
M=D+M // 2435

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2436
D=A // 2437
@14 // 2438
M=D // 2439
@Math.twoToThe // 2440
D=A // 2441
@13 // 2442
M=D // 2443
@Screen.drawRectangle.ret.3 // 2444
D=A // 2445
@CALL // 2446
0;JMP // 2447
(Screen.drawRectangle.ret.3)

////PushInstruction("constant 1")
@SP // 2448
AM=M+1 // 2449
A=A-1 // 2450
M=1 // 2451

////ArithmeticInstruction{SUB}
@SP // 2452
AM=M-1 // 2453
D=M // 2454
A=A-1 // 2455
M=M-D // 2456

////PushInstruction("local 3")
@LCL // 2457
A=M+1 // 2458
A=A+1 // 2459
A=A+1 // 2460
D=M // 2461
@SP // 2462
AM=M+1 // 2463
A=A-1 // 2464
M=D // 2465

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=4, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2466
D=A // 2467
@14 // 2468
M=D // 2469
@Math.twoToThe // 2470
D=A // 2471
@13 // 2472
M=D // 2473
@Screen.drawRectangle.ret.4 // 2474
D=A // 2475
@CALL // 2476
0;JMP // 2477
(Screen.drawRectangle.ret.4)

////PushInstruction("constant 1")
@SP // 2478
AM=M+1 // 2479
A=A-1 // 2480
M=1 // 2481

////ArithmeticInstruction{SUB}
@SP // 2482
AM=M-1 // 2483
D=M // 2484
A=A-1 // 2485
M=M-D // 2486

////ArithmeticInstruction{SUB}
@SP // 2487
AM=M-1 // 2488
D=M // 2489
A=A-1 // 2490
M=M-D // 2491

////PopInstruction{address=local 6}
@LCL // 2492
D=M // 2493
@6 // 2494
A=D+A // 2495
D=A // 2496
@R13 // 2497
M=D // 2498
@SP // 2499
AM=M-1 // 2500
D=M // 2501
@R13 // 2502
A=M // 2503
M=D // 2504

////PushInstruction("local 5")
@LCL // 2505
D=M // 2506
@5 // 2507
A=D+A // 2508
D=M // 2509
@SP // 2510
AM=M+1 // 2511
A=A-1 // 2512
M=D // 2513

////PushInstruction("local 1")
@LCL // 2514
A=M+1 // 2515
D=M // 2516
@SP // 2517
AM=M+1 // 2518
A=A-1 // 2519
M=D // 2520

////ArithmeticInstruction{ADD}
@SP // 2521
AM=M-1 // 2522
D=M // 2523
A=A-1 // 2524
M=D+M // 2525

////PopInstruction{address=local 7}
@LCL // 2526
D=M // 2527
@7 // 2528
A=D+A // 2529
D=A // 2530
@R13 // 2531
M=D // 2532
@SP // 2533
AM=M-1 // 2534
D=M // 2535
@R13 // 2536
A=M // 2537
M=D // 2538

////PushInstruction("static 0")
@Screen.0 // 2539
D=M // 2540
@SP // 2541
AM=M+1 // 2542
A=A-1 // 2543
M=D // 2544

////PushInstruction("constant 0")
@SP // 2545
AM=M+1 // 2546
A=A-1 // 2547
M=0 // 2548

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq25 // 2549
D=A // 2550
@13 // 2551
M=D // 2552
@SP // 2553
AM=M-1 // 2554
D=M // 2555
A=A-1 // 2556
D=M-D // 2557
@DO_EQ // 2558
0;JMP // 2559
(COMPARE_Screen.drawRectangle_eq25)
@SP // 2560
AM=M+1 // 2561
A=A-1 // 2562
M=D // 2563

////IfGotoInstruction{label='Screen.drawRectangle.IfElse3}
// if-goto Screen.drawRectangle.IfElse3
@SP // 2564
AM=M-1 // 2565
D=M // 2566
@Screen.drawRectangle.IfElse3 // 2567
D;JNE // 2568

////PushInstruction("constant 16384")
@16384 // 2569
D=A // 2570
@SP // 2571
AM=M+1 // 2572
A=A-1 // 2573
M=D // 2574

////PushInstruction("local 7")
@LCL // 2575
D=M // 2576
@7 // 2577
A=D+A // 2578
D=M // 2579
@SP // 2580
AM=M+1 // 2581
A=A-1 // 2582
M=D // 2583

////ArithmeticInstruction{ADD}
@SP // 2584
AM=M-1 // 2585
D=M // 2586
A=A-1 // 2587
M=D+M // 2588

////PopInstruction{address=pointer 1}
@SP // 2589
AM=M-1 // 2590
D=M // 2591
@4 // 2592
M=D // 2593

////PushInstruction("that 0")
@THAT // 2594
A=M // 2595
D=M // 2596
@SP // 2597
AM=M+1 // 2598
A=A-1 // 2599
M=D // 2600

////PushInstruction("local 6")
@LCL // 2601
D=M // 2602
@6 // 2603
A=D+A // 2604
D=M // 2605
@SP // 2606
AM=M+1 // 2607
A=A-1 // 2608
M=D // 2609

////ArithmeticInstruction{OR}
@SP // 2610
AM=M-1 // 2611
D=M // 2612
A=A-1 // 2613
M=D|M // 2614

////PushInstruction("constant 16384")
@16384 // 2615
D=A // 2616
@SP // 2617
AM=M+1 // 2618
A=A-1 // 2619
M=D // 2620

////PushInstruction("local 7")
@LCL // 2621
D=M // 2622
@7 // 2623
A=D+A // 2624
D=M // 2625
@SP // 2626
AM=M+1 // 2627
A=A-1 // 2628
M=D // 2629

////ArithmeticInstruction{ADD}
@SP // 2630
AM=M-1 // 2631
D=M // 2632
A=A-1 // 2633
M=D+M // 2634

////PopInstruction{address=pointer 1}
@SP // 2635
AM=M-1 // 2636
D=M // 2637
@4 // 2638
M=D // 2639

////PopInstruction{address=that 0}
@SP // 2640
AM=M-1 // 2641
D=M // 2642
@THAT // 2643
A=M // 2644
M=D // 2645

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 2646
0;JMP // 2647

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushInstruction("constant 16384")
@16384 // 2648
D=A // 2649
@SP // 2650
AM=M+1 // 2651
A=A-1 // 2652
M=D // 2653

////PushInstruction("local 7")
@LCL // 2654
D=M // 2655
@7 // 2656
A=D+A // 2657
D=M // 2658
@SP // 2659
AM=M+1 // 2660
A=A-1 // 2661
M=D // 2662

////ArithmeticInstruction{ADD}
@SP // 2663
AM=M-1 // 2664
D=M // 2665
A=A-1 // 2666
M=D+M // 2667

////PopInstruction{address=pointer 1}
@SP // 2668
AM=M-1 // 2669
D=M // 2670
@4 // 2671
M=D // 2672

////PushInstruction("that 0")
@THAT // 2673
A=M // 2674
D=M // 2675
@SP // 2676
AM=M+1 // 2677
A=A-1 // 2678
M=D // 2679

////PushInstruction("local 6")
@LCL // 2680
D=M // 2681
@6 // 2682
A=D+A // 2683
D=M // 2684
@SP // 2685
AM=M+1 // 2686
A=A-1 // 2687
M=D // 2688

////ArithmeticInstruction{NOT}
@SP // 2689
A=M-1 // 2690
M=!M // 2691

////ArithmeticInstruction{AND}
@SP // 2692
AM=M-1 // 2693
D=M // 2694
A=A-1 // 2695
M=D&M // 2696

////PushInstruction("constant 16384")
@16384 // 2697
D=A // 2698
@SP // 2699
AM=M+1 // 2700
A=A-1 // 2701
M=D // 2702

////PushInstruction("local 7")
@LCL // 2703
D=M // 2704
@7 // 2705
A=D+A // 2706
D=M // 2707
@SP // 2708
AM=M+1 // 2709
A=A-1 // 2710
M=D // 2711

////ArithmeticInstruction{ADD}
@SP // 2712
AM=M-1 // 2713
D=M // 2714
A=A-1 // 2715
M=D+M // 2716

////PopInstruction{address=pointer 1}
@SP // 2717
AM=M-1 // 2718
D=M // 2719
@4 // 2720
M=D // 2721

////PopInstruction{address=that 0}
@SP // 2722
AM=M-1 // 2723
D=M // 2724
@THAT // 2725
A=M // 2726
M=D // 2727

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 2728
0;JMP // 2729

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushInstruction("local 3")
@LCL // 2730
A=M+1 // 2731
A=A+1 // 2732
A=A+1 // 2733
D=M // 2734
@SP // 2735
AM=M+1 // 2736
A=A-1 // 2737
M=D // 2738

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 2739
D=A // 2740
@14 // 2741
M=D // 2742
@Math.twoToThe // 2743
D=A // 2744
@13 // 2745
M=D // 2746
@Screen.drawRectangle.ret.5 // 2747
D=A // 2748
@CALL // 2749
0;JMP // 2750
(Screen.drawRectangle.ret.5)

////PushInstruction("constant 1")
@SP // 2751
AM=M+1 // 2752
A=A-1 // 2753
M=1 // 2754

////ArithmeticInstruction{SUB}
@SP // 2755
AM=M-1 // 2756
D=M // 2757
A=A-1 // 2758
M=M-D // 2759

////ArithmeticInstruction{NOT}
@SP // 2760
A=M-1 // 2761
M=!M // 2762

////PopInstruction{address=local 6}
@LCL // 2763
D=M // 2764
@6 // 2765
A=D+A // 2766
D=A // 2767
@R13 // 2768
M=D // 2769
@SP // 2770
AM=M-1 // 2771
D=M // 2772
@R13 // 2773
A=M // 2774
M=D // 2775

////PushInstruction("local 5")
@LCL // 2776
D=M // 2777
@5 // 2778
A=D+A // 2779
D=M // 2780
@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=D // 2784

////PushInstruction("local 1")
@LCL // 2785
A=M+1 // 2786
D=M // 2787
@SP // 2788
AM=M+1 // 2789
A=A-1 // 2790
M=D // 2791

////ArithmeticInstruction{ADD}
@SP // 2792
AM=M-1 // 2793
D=M // 2794
A=A-1 // 2795
M=D+M // 2796

////PopInstruction{address=local 7}
@LCL // 2797
D=M // 2798
@7 // 2799
A=D+A // 2800
D=A // 2801
@R13 // 2802
M=D // 2803
@SP // 2804
AM=M-1 // 2805
D=M // 2806
@R13 // 2807
A=M // 2808
M=D // 2809

////PushInstruction("static 0")
@Screen.0 // 2810
D=M // 2811
@SP // 2812
AM=M+1 // 2813
A=A-1 // 2814
M=D // 2815

////PushInstruction("constant 0")
@SP // 2816
AM=M+1 // 2817
A=A-1 // 2818
M=0 // 2819

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq26 // 2820
D=A // 2821
@13 // 2822
M=D // 2823
@SP // 2824
AM=M-1 // 2825
D=M // 2826
A=A-1 // 2827
D=M-D // 2828
@DO_EQ // 2829
0;JMP // 2830
(COMPARE_Screen.drawRectangle_eq26)
@SP // 2831
AM=M+1 // 2832
A=A-1 // 2833
M=D // 2834

////IfGotoInstruction{label='Screen.drawRectangle.IfElse4}
// if-goto Screen.drawRectangle.IfElse4
@SP // 2835
AM=M-1 // 2836
D=M // 2837
@Screen.drawRectangle.IfElse4 // 2838
D;JNE // 2839

////PushInstruction("constant 16384")
@16384 // 2840
D=A // 2841
@SP // 2842
AM=M+1 // 2843
A=A-1 // 2844
M=D // 2845

////PushInstruction("local 7")
@LCL // 2846
D=M // 2847
@7 // 2848
A=D+A // 2849
D=M // 2850
@SP // 2851
AM=M+1 // 2852
A=A-1 // 2853
M=D // 2854

////ArithmeticInstruction{ADD}
@SP // 2855
AM=M-1 // 2856
D=M // 2857
A=A-1 // 2858
M=D+M // 2859

////PopInstruction{address=pointer 1}
@SP // 2860
AM=M-1 // 2861
D=M // 2862
@4 // 2863
M=D // 2864

////PushInstruction("that 0")
@THAT // 2865
A=M // 2866
D=M // 2867
@SP // 2868
AM=M+1 // 2869
A=A-1 // 2870
M=D // 2871

////PushInstruction("local 6")
@LCL // 2872
D=M // 2873
@6 // 2874
A=D+A // 2875
D=M // 2876
@SP // 2877
AM=M+1 // 2878
A=A-1 // 2879
M=D // 2880

////ArithmeticInstruction{OR}
@SP // 2881
AM=M-1 // 2882
D=M // 2883
A=A-1 // 2884
M=D|M // 2885

////PushInstruction("constant 16384")
@16384 // 2886
D=A // 2887
@SP // 2888
AM=M+1 // 2889
A=A-1 // 2890
M=D // 2891

////PushInstruction("local 7")
@LCL // 2892
D=M // 2893
@7 // 2894
A=D+A // 2895
D=M // 2896
@SP // 2897
AM=M+1 // 2898
A=A-1 // 2899
M=D // 2900

////ArithmeticInstruction{ADD}
@SP // 2901
AM=M-1 // 2902
D=M // 2903
A=A-1 // 2904
M=D+M // 2905

////PopInstruction{address=pointer 1}
@SP // 2906
AM=M-1 // 2907
D=M // 2908
@4 // 2909
M=D // 2910

////PopInstruction{address=that 0}
@SP // 2911
AM=M-1 // 2912
D=M // 2913
@THAT // 2914
A=M // 2915
M=D // 2916

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 2917
0;JMP // 2918

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushInstruction("constant 16384")
@16384 // 2919
D=A // 2920
@SP // 2921
AM=M+1 // 2922
A=A-1 // 2923
M=D // 2924

////PushInstruction("local 7")
@LCL // 2925
D=M // 2926
@7 // 2927
A=D+A // 2928
D=M // 2929
@SP // 2930
AM=M+1 // 2931
A=A-1 // 2932
M=D // 2933

////ArithmeticInstruction{ADD}
@SP // 2934
AM=M-1 // 2935
D=M // 2936
A=A-1 // 2937
M=D+M // 2938

////PopInstruction{address=pointer 1}
@SP // 2939
AM=M-1 // 2940
D=M // 2941
@4 // 2942
M=D // 2943

////PushInstruction("that 0")
@THAT // 2944
A=M // 2945
D=M // 2946
@SP // 2947
AM=M+1 // 2948
A=A-1 // 2949
M=D // 2950

////PushInstruction("local 6")
@LCL // 2951
D=M // 2952
@6 // 2953
A=D+A // 2954
D=M // 2955
@SP // 2956
AM=M+1 // 2957
A=A-1 // 2958
M=D // 2959

////ArithmeticInstruction{NOT}
@SP // 2960
A=M-1 // 2961
M=!M // 2962

////ArithmeticInstruction{AND}
@SP // 2963
AM=M-1 // 2964
D=M // 2965
A=A-1 // 2966
M=D&M // 2967

////PushInstruction("constant 16384")
@16384 // 2968
D=A // 2969
@SP // 2970
AM=M+1 // 2971
A=A-1 // 2972
M=D // 2973

////PushInstruction("local 7")
@LCL // 2974
D=M // 2975
@7 // 2976
A=D+A // 2977
D=M // 2978
@SP // 2979
AM=M+1 // 2980
A=A-1 // 2981
M=D // 2982

////ArithmeticInstruction{ADD}
@SP // 2983
AM=M-1 // 2984
D=M // 2985
A=A-1 // 2986
M=D+M // 2987

////PopInstruction{address=pointer 1}
@SP // 2988
AM=M-1 // 2989
D=M // 2990
@4 // 2991
M=D // 2992

////PopInstruction{address=that 0}
@SP // 2993
AM=M-1 // 2994
D=M // 2995
@THAT // 2996
A=M // 2997
M=D // 2998

////LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)

////PushInstruction("local 1")
@LCL // 2999
A=M+1 // 3000
D=M // 3001
@SP // 3002
AM=M+1 // 3003
A=A-1 // 3004
M=D // 3005

////PushInstruction("constant 1")
@SP // 3006
AM=M+1 // 3007
A=A-1 // 3008
M=1 // 3009

////ArithmeticInstruction{ADD}
@SP // 3010
AM=M-1 // 3011
D=M // 3012
A=A-1 // 3013
M=D+M // 3014

////PopInstruction{address=local 8}
@LCL // 3015
D=M // 3016
@8 // 3017
A=D+A // 3018
D=A // 3019
@R13 // 3020
M=D // 3021
@SP // 3022
AM=M-1 // 3023
D=M // 3024
@R13 // 3025
A=M // 3026
M=D // 3027

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////PushInstruction("local 8")
@LCL // 3028
D=M // 3029
@8 // 3030
A=D+A // 3031
D=M // 3032
@SP // 3033
AM=M+1 // 3034
A=A-1 // 3035
M=D // 3036

////PushInstruction("local 2")
@LCL // 3037
A=M+1 // 3038
A=A+1 // 3039
D=M // 3040
@SP // 3041
AM=M+1 // 3042
A=A-1 // 3043
M=D // 3044

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawRectangle_lt27 // 3045
D=A // 3046
@13 // 3047
M=D // 3048
@SP // 3049
AM=M-1 // 3050
D=M // 3051
A=A-1 // 3052
D=M-D // 3053
@DO_LT // 3054
0;JMP // 3055
(COMPARE_Screen.drawRectangle_lt27)
@SP // 3056
AM=M+1 // 3057
A=A-1 // 3058
M=D // 3059

////PushInstruction("constant 0")
@SP // 3060
AM=M+1 // 3061
A=A-1 // 3062
M=0 // 3063

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq28 // 3064
D=A // 3065
@13 // 3066
M=D // 3067
@SP // 3068
AM=M-1 // 3069
D=M // 3070
A=A-1 // 3071
D=M-D // 3072
@DO_EQ // 3073
0;JMP // 3074
(COMPARE_Screen.drawRectangle_eq28)
@SP // 3075
AM=M+1 // 3076
A=A-1 // 3077
M=D // 3078

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}
// if-goto WHILE_END_Screen.drawRectangle2
@SP // 3079
AM=M-1 // 3080
D=M // 3081
@WHILE_END_Screen.drawRectangle2 // 3082
D;JNE // 3083

////PushInstruction("local 5")
@LCL // 3084
D=M // 3085
@5 // 3086
A=D+A // 3087
D=M // 3088
@SP // 3089
AM=M+1 // 3090
A=A-1 // 3091
M=D // 3092

////PushInstruction("local 8")
@LCL // 3093
D=M // 3094
@8 // 3095
A=D+A // 3096
D=M // 3097
@SP // 3098
AM=M+1 // 3099
A=A-1 // 3100
M=D // 3101

////ArithmeticInstruction{ADD}
@SP // 3102
AM=M-1 // 3103
D=M // 3104
A=A-1 // 3105
M=D+M // 3106

////PopInstruction{address=local 7}
@LCL // 3107
D=M // 3108
@7 // 3109
A=D+A // 3110
D=A // 3111
@R13 // 3112
M=D // 3113
@SP // 3114
AM=M-1 // 3115
D=M // 3116
@R13 // 3117
A=M // 3118
M=D // 3119

////PushInstruction("local 9")
@LCL // 3120
D=M // 3121
@9 // 3122
A=D+A // 3123
D=M // 3124
@SP // 3125
AM=M+1 // 3126
A=A-1 // 3127
M=D // 3128

////PushInstruction("constant 16384")
@16384 // 3129
D=A // 3130
@SP // 3131
AM=M+1 // 3132
A=A-1 // 3133
M=D // 3134

////PushInstruction("local 7")
@LCL // 3135
D=M // 3136
@7 // 3137
A=D+A // 3138
D=M // 3139
@SP // 3140
AM=M+1 // 3141
A=A-1 // 3142
M=D // 3143

////ArithmeticInstruction{ADD}
@SP // 3144
AM=M-1 // 3145
D=M // 3146
A=A-1 // 3147
M=D+M // 3148

////PopInstruction{address=pointer 1}
@SP // 3149
AM=M-1 // 3150
D=M // 3151
@4 // 3152
M=D // 3153

////PopInstruction{address=that 0}
@SP // 3154
AM=M-1 // 3155
D=M // 3156
@THAT // 3157
A=M // 3158
M=D // 3159

////PushInstruction("local 8")
@LCL // 3160
D=M // 3161
@8 // 3162
A=D+A // 3163
D=M // 3164
@SP // 3165
AM=M+1 // 3166
A=A-1 // 3167
M=D // 3168

////PushInstruction("constant 1")
@SP // 3169
AM=M+1 // 3170
A=A-1 // 3171
M=1 // 3172

////ArithmeticInstruction{ADD}
@SP // 3173
AM=M-1 // 3174
D=M // 3175
A=A-1 // 3176
M=D+M // 3177

////PopInstruction{address=local 8}
@LCL // 3178
D=M // 3179
@8 // 3180
A=D+A // 3181
D=A // 3182
@R13 // 3183
M=D // 3184
@SP // 3185
AM=M-1 // 3186
D=M // 3187
@R13 // 3188
A=M // 3189
M=D // 3190

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 3191
0;JMP // 3192

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushInstruction("local 4")
@LCL // 3193
D=M // 3194
@4 // 3195
A=D+A // 3196
D=M // 3197
@SP // 3198
AM=M+1 // 3199
A=A-1 // 3200
M=D // 3201

////PushInstruction("constant 1")
@SP // 3202
AM=M+1 // 3203
A=A-1 // 3204
M=1 // 3205

////ArithmeticInstruction{ADD}
@SP // 3206
AM=M-1 // 3207
D=M // 3208
A=A-1 // 3209
M=D+M // 3210

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=6, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 3211
D=A // 3212
@14 // 3213
M=D // 3214
@Math.twoToThe // 3215
D=A // 3216
@13 // 3217
M=D // 3218
@Screen.drawRectangle.ret.6 // 3219
D=A // 3220
@CALL // 3221
0;JMP // 3222
(Screen.drawRectangle.ret.6)

////PushInstruction("constant 1")
@SP // 3223
AM=M+1 // 3224
A=A-1 // 3225
M=1 // 3226

////ArithmeticInstruction{SUB}
@SP // 3227
AM=M-1 // 3228
D=M // 3229
A=A-1 // 3230
M=M-D // 3231

////PopInstruction{address=local 6}
@LCL // 3232
D=M // 3233
@6 // 3234
A=D+A // 3235
D=A // 3236
@R13 // 3237
M=D // 3238
@SP // 3239
AM=M-1 // 3240
D=M // 3241
@R13 // 3242
A=M // 3243
M=D // 3244

////PushInstruction("local 5")
@LCL // 3245
D=M // 3246
@5 // 3247
A=D+A // 3248
D=M // 3249
@SP // 3250
AM=M+1 // 3251
A=A-1 // 3252
M=D // 3253

////PushInstruction("local 2")
@LCL // 3254
A=M+1 // 3255
A=A+1 // 3256
D=M // 3257
@SP // 3258
AM=M+1 // 3259
A=A-1 // 3260
M=D // 3261

////ArithmeticInstruction{ADD}
@SP // 3262
AM=M-1 // 3263
D=M // 3264
A=A-1 // 3265
M=D+M // 3266

////PopInstruction{address=local 7}
@LCL // 3267
D=M // 3268
@7 // 3269
A=D+A // 3270
D=A // 3271
@R13 // 3272
M=D // 3273
@SP // 3274
AM=M-1 // 3275
D=M // 3276
@R13 // 3277
A=M // 3278
M=D // 3279

////PushInstruction("static 0")
@Screen.0 // 3280
D=M // 3281
@SP // 3282
AM=M+1 // 3283
A=A-1 // 3284
M=D // 3285

////PushInstruction("constant 0")
@SP // 3286
AM=M+1 // 3287
A=A-1 // 3288
M=0 // 3289

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq29 // 3290
D=A // 3291
@13 // 3292
M=D // 3293
@SP // 3294
AM=M-1 // 3295
D=M // 3296
A=A-1 // 3297
D=M-D // 3298
@DO_EQ // 3299
0;JMP // 3300
(COMPARE_Screen.drawRectangle_eq29)
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=D // 3304

////IfGotoInstruction{label='Screen.drawRectangle.IfElse5}
// if-goto Screen.drawRectangle.IfElse5
@SP // 3305
AM=M-1 // 3306
D=M // 3307
@Screen.drawRectangle.IfElse5 // 3308
D;JNE // 3309

////PushInstruction("constant 16384")
@16384 // 3310
D=A // 3311
@SP // 3312
AM=M+1 // 3313
A=A-1 // 3314
M=D // 3315

////PushInstruction("local 7")
@LCL // 3316
D=M // 3317
@7 // 3318
A=D+A // 3319
D=M // 3320
@SP // 3321
AM=M+1 // 3322
A=A-1 // 3323
M=D // 3324

////ArithmeticInstruction{ADD}
@SP // 3325
AM=M-1 // 3326
D=M // 3327
A=A-1 // 3328
M=D+M // 3329

////PopInstruction{address=pointer 1}
@SP // 3330
AM=M-1 // 3331
D=M // 3332
@4 // 3333
M=D // 3334

////PushInstruction("that 0")
@THAT // 3335
A=M // 3336
D=M // 3337
@SP // 3338
AM=M+1 // 3339
A=A-1 // 3340
M=D // 3341

////PushInstruction("local 6")
@LCL // 3342
D=M // 3343
@6 // 3344
A=D+A // 3345
D=M // 3346
@SP // 3347
AM=M+1 // 3348
A=A-1 // 3349
M=D // 3350

////ArithmeticInstruction{OR}
@SP // 3351
AM=M-1 // 3352
D=M // 3353
A=A-1 // 3354
M=D|M // 3355

////PushInstruction("constant 16384")
@16384 // 3356
D=A // 3357
@SP // 3358
AM=M+1 // 3359
A=A-1 // 3360
M=D // 3361

////PushInstruction("local 7")
@LCL // 3362
D=M // 3363
@7 // 3364
A=D+A // 3365
D=M // 3366
@SP // 3367
AM=M+1 // 3368
A=A-1 // 3369
M=D // 3370

////ArithmeticInstruction{ADD}
@SP // 3371
AM=M-1 // 3372
D=M // 3373
A=A-1 // 3374
M=D+M // 3375

////PopInstruction{address=pointer 1}
@SP // 3376
AM=M-1 // 3377
D=M // 3378
@4 // 3379
M=D // 3380

////PopInstruction{address=that 0}
@SP // 3381
AM=M-1 // 3382
D=M // 3383
@THAT // 3384
A=M // 3385
M=D // 3386

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 3387
0;JMP // 3388

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushInstruction("constant 16384")
@16384 // 3389
D=A // 3390
@SP // 3391
AM=M+1 // 3392
A=A-1 // 3393
M=D // 3394

////PushInstruction("local 7")
@LCL // 3395
D=M // 3396
@7 // 3397
A=D+A // 3398
D=M // 3399
@SP // 3400
AM=M+1 // 3401
A=A-1 // 3402
M=D // 3403

////ArithmeticInstruction{ADD}
@SP // 3404
AM=M-1 // 3405
D=M // 3406
A=A-1 // 3407
M=D+M // 3408

////PopInstruction{address=pointer 1}
@SP // 3409
AM=M-1 // 3410
D=M // 3411
@4 // 3412
M=D // 3413

////PushInstruction("that 0")
@THAT // 3414
A=M // 3415
D=M // 3416
@SP // 3417
AM=M+1 // 3418
A=A-1 // 3419
M=D // 3420

////PushInstruction("local 6")
@LCL // 3421
D=M // 3422
@6 // 3423
A=D+A // 3424
D=M // 3425
@SP // 3426
AM=M+1 // 3427
A=A-1 // 3428
M=D // 3429

////ArithmeticInstruction{NOT}
@SP // 3430
A=M-1 // 3431
M=!M // 3432

////ArithmeticInstruction{AND}
@SP // 3433
AM=M-1 // 3434
D=M // 3435
A=A-1 // 3436
M=D&M // 3437

////PushInstruction("constant 16384")
@16384 // 3438
D=A // 3439
@SP // 3440
AM=M+1 // 3441
A=A-1 // 3442
M=D // 3443

////PushInstruction("local 7")
@LCL // 3444
D=M // 3445
@7 // 3446
A=D+A // 3447
D=M // 3448
@SP // 3449
AM=M+1 // 3450
A=A-1 // 3451
M=D // 3452

////ArithmeticInstruction{ADD}
@SP // 3453
AM=M-1 // 3454
D=M // 3455
A=A-1 // 3456
M=D+M // 3457

////PopInstruction{address=pointer 1}
@SP // 3458
AM=M-1 // 3459
D=M // 3460
@4 // 3461
M=D // 3462

////PopInstruction{address=that 0}
@SP // 3463
AM=M-1 // 3464
D=M // 3465
@THAT // 3466
A=M // 3467
M=D // 3468

////LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)

////PushInstruction("local 0")
@LCL // 3469
A=M // 3470
D=M // 3471
@SP // 3472
AM=M+1 // 3473
A=A-1 // 3474
M=D // 3475

////PushInstruction("constant 1")
@SP // 3476
AM=M+1 // 3477
A=A-1 // 3478
M=1 // 3479

////ArithmeticInstruction{ADD}
@SP // 3480
AM=M-1 // 3481
D=M // 3482
A=A-1 // 3483
M=D+M // 3484

////PopInstruction{address=local 0}
@SP // 3485
AM=M-1 // 3486
D=M // 3487
@LCL // 3488
A=M // 3489
M=D // 3490

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 3491
0;JMP // 3492

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 3493
AM=M+1 // 3494
A=A-1 // 3495
M=0 // 3496

////ReturnInstruction{}
@RETURN // 3497
0;JMP // 3498

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 3499
AM=M+1 // 3500
A=A-1 // 3501
M=0 // 3502

////PushInstruction("constant 0")
@SP // 3503
AM=M+1 // 3504
A=A-1 // 3505
M=0 // 3506

////PopInstruction{address=local 0}
@SP // 3507
AM=M-1 // 3508
D=M // 3509
@LCL // 3510
A=M // 3511
M=D // 3512

////LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)

////PushInstruction("local 0")
@LCL // 3513
A=M // 3514
D=M // 3515
@SP // 3516
AM=M+1 // 3517
A=A-1 // 3518
M=D // 3519

////PushInstruction("constant 8192")
@8192 // 3520
D=A // 3521
@SP // 3522
AM=M+1 // 3523
A=A-1 // 3524
M=D // 3525

////ArithmeticInstruction{LT}
@COMPARE_Screen.clearScreen_lt30 // 3526
D=A // 3527
@13 // 3528
M=D // 3529
@SP // 3530
AM=M-1 // 3531
D=M // 3532
A=A-1 // 3533
D=M-D // 3534
@DO_LT // 3535
0;JMP // 3536
(COMPARE_Screen.clearScreen_lt30)
@SP // 3537
AM=M+1 // 3538
A=A-1 // 3539
M=D // 3540

////PushInstruction("constant 0")
@SP // 3541
AM=M+1 // 3542
A=A-1 // 3543
M=0 // 3544

////ArithmeticInstruction{EQ}
@COMPARE_Screen.clearScreen_eq31 // 3545
D=A // 3546
@13 // 3547
M=D // 3548
@SP // 3549
AM=M-1 // 3550
D=M // 3551
A=A-1 // 3552
D=M-D // 3553
@DO_EQ // 3554
0;JMP // 3555
(COMPARE_Screen.clearScreen_eq31)
@SP // 3556
AM=M+1 // 3557
A=A-1 // 3558
M=D // 3559

////IfGotoInstruction{label='WHILE_END_Screen.clearScreen1}
// if-goto WHILE_END_Screen.clearScreen1
@SP // 3560
AM=M-1 // 3561
D=M // 3562
@WHILE_END_Screen.clearScreen1 // 3563
D;JNE // 3564

////PushInstruction("constant 0")
@SP // 3565
AM=M+1 // 3566
A=A-1 // 3567
M=0 // 3568

////PushInstruction("constant 16384")
@16384 // 3569
D=A // 3570
@SP // 3571
AM=M+1 // 3572
A=A-1 // 3573
M=D // 3574

////PushInstruction("local 0")
@LCL // 3575
A=M // 3576
D=M // 3577
@SP // 3578
AM=M+1 // 3579
A=A-1 // 3580
M=D // 3581

////ArithmeticInstruction{ADD}
@SP // 3582
AM=M-1 // 3583
D=M // 3584
A=A-1 // 3585
M=D+M // 3586

////PopInstruction{address=pointer 1}
@SP // 3587
AM=M-1 // 3588
D=M // 3589
@4 // 3590
M=D // 3591

////PopInstruction{address=that 0}
@SP // 3592
AM=M-1 // 3593
D=M // 3594
@THAT // 3595
A=M // 3596
M=D // 3597

////PushInstruction("local 0")
@LCL // 3598
A=M // 3599
D=M // 3600
@SP // 3601
AM=M+1 // 3602
A=A-1 // 3603
M=D // 3604

////PushInstruction("constant 1")
@SP // 3605
AM=M+1 // 3606
A=A-1 // 3607
M=1 // 3608

////ArithmeticInstruction{ADD}
@SP // 3609
AM=M-1 // 3610
D=M // 3611
A=A-1 // 3612
M=D+M // 3613

////PopInstruction{address=local 0}
@SP // 3614
AM=M-1 // 3615
D=M // 3616
@LCL // 3617
A=M // 3618
M=D // 3619

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 3620
0;JMP // 3621

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 3622
AM=M+1 // 3623
A=A-1 // 3624
M=0 // 3625

////ReturnInstruction{}
@RETURN // 3626
0;JMP // 3627

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushInstruction("constant 3")
@3 // 3628
D=A // 3629
@SP // 3630
AM=M+1 // 3631
A=A-1 // 3632
M=D // 3633

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}
// call Memory.alloc
@6 // 3634
D=A // 3635
@14 // 3636
M=D // 3637
@Memory.alloc // 3638
D=A // 3639
@13 // 3640
M=D // 3641
@String.new.ret.0 // 3642
D=A // 3643
@CALL // 3644
0;JMP // 3645
(String.new.ret.0)

////PopInstruction{address=pointer 0}
@SP // 3646
AM=M-1 // 3647
D=M // 3648
@3 // 3649
M=D // 3650

////PushInstruction("argument 0")
@ARG // 3651
A=M // 3652
D=M // 3653
@SP // 3654
AM=M+1 // 3655
A=A-1 // 3656
M=D // 3657

////PushInstruction("constant 0")
@SP // 3658
AM=M+1 // 3659
A=A-1 // 3660
M=0 // 3661

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq0 // 3662
D=A // 3663
@13 // 3664
M=D // 3665
@SP // 3666
AM=M-1 // 3667
D=M // 3668
A=A-1 // 3669
D=M-D // 3670
@DO_EQ // 3671
0;JMP // 3672
(COMPARE_String.new_eq0)
@SP // 3673
AM=M+1 // 3674
A=A-1 // 3675
M=D // 3676

////PushInstruction("constant 0")
@SP // 3677
AM=M+1 // 3678
A=A-1 // 3679
M=0 // 3680

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq1 // 3681
D=A // 3682
@13 // 3683
M=D // 3684
@SP // 3685
AM=M-1 // 3686
D=M // 3687
A=A-1 // 3688
D=M-D // 3689
@DO_EQ // 3690
0;JMP // 3691
(COMPARE_String.new_eq1)
@SP // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=D // 3695

////IfGotoInstruction{label='String.new.IfElse1}
// if-goto String.new.IfElse1
@SP // 3696
AM=M-1 // 3697
D=M // 3698
@String.new.IfElse1 // 3699
D;JNE // 3700

////PushInstruction("constant 0")
@SP // 3701
AM=M+1 // 3702
A=A-1 // 3703
M=0 // 3704

////PopInstruction{address=this 0}
@SP // 3705
AM=M-1 // 3706
D=M // 3707
@THIS // 3708
A=M // 3709
M=D // 3710

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 3711
0;JMP // 3712

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushInstruction("argument 0")
@ARG // 3713
A=M // 3714
D=M // 3715
@SP // 3716
AM=M+1 // 3717
A=A-1 // 3718
M=D // 3719

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}
// call Array.new
@6 // 3720
D=A // 3721
@14 // 3722
M=D // 3723
@Array.new // 3724
D=A // 3725
@13 // 3726
M=D // 3727
@String.new.ret.1 // 3728
D=A // 3729
@CALL // 3730
0;JMP // 3731
(String.new.ret.1)

////PopInstruction{address=this 0}
@SP // 3732
AM=M-1 // 3733
D=M // 3734
@THIS // 3735
A=M // 3736
M=D // 3737

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 3738
A=M // 3739
D=M // 3740
@SP // 3741
AM=M+1 // 3742
A=A-1 // 3743
M=D // 3744

////PopInstruction{address=this 2}
@SP // 3745
AM=M-1 // 3746
D=M // 3747
@THIS // 3748
A=M+1 // 3749
A=A+1 // 3750
M=D // 3751

////PushInstruction("constant 0")
@SP // 3752
AM=M+1 // 3753
A=A-1 // 3754
M=0 // 3755

////PopInstruction{address=this 1}
@SP // 3756
AM=M-1 // 3757
D=M // 3758
@THIS // 3759
A=M+1 // 3760
M=D // 3761

////PushInstruction("pointer 0")
@3 // 3762
D=M // 3763
@SP // 3764
AM=M+1 // 3765
A=A-1 // 3766
M=D // 3767

////ReturnInstruction{}
@RETURN // 3768
0;JMP // 3769

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushInstruction("argument 0")
@ARG // 3770
A=M // 3771
D=M // 3772
@SP // 3773
AM=M+1 // 3774
A=A-1 // 3775
M=D // 3776

////PopInstruction{address=pointer 0}
@SP // 3777
AM=M-1 // 3778
D=M // 3779
@3 // 3780
M=D // 3781

////PushInstruction("this 0")
@THIS // 3782
A=M // 3783
D=M // 3784
@SP // 3785
AM=M+1 // 3786
A=A-1 // 3787
M=D // 3788

////PushInstruction("constant 0")
@SP // 3789
AM=M+1 // 3790
A=A-1 // 3791
M=0 // 3792

////ArithmeticInstruction{EQ}
@COMPARE_String.dispose_eq2 // 3793
D=A // 3794
@13 // 3795
M=D // 3796
@SP // 3797
AM=M-1 // 3798
D=M // 3799
A=A-1 // 3800
D=M-D // 3801
@DO_EQ // 3802
0;JMP // 3803
(COMPARE_String.dispose_eq2)
@SP // 3804
AM=M+1 // 3805
A=A-1 // 3806
M=D // 3807

////ArithmeticInstruction{NOT}
@SP // 3808
A=M-1 // 3809
M=!M // 3810

////PushInstruction("constant 0")
@SP // 3811
AM=M+1 // 3812
A=A-1 // 3813
M=0 // 3814

////ArithmeticInstruction{EQ}
@COMPARE_String.dispose_eq3 // 3815
D=A // 3816
@13 // 3817
M=D // 3818
@SP // 3819
AM=M-1 // 3820
D=M // 3821
A=A-1 // 3822
D=M-D // 3823
@DO_EQ // 3824
0;JMP // 3825
(COMPARE_String.dispose_eq3)
@SP // 3826
AM=M+1 // 3827
A=A-1 // 3828
M=D // 3829

////IfGotoInstruction{label='String.dispose.IfElse1}
// if-goto String.dispose.IfElse1
@SP // 3830
AM=M-1 // 3831
D=M // 3832
@String.dispose.IfElse1 // 3833
D;JNE // 3834

////PushInstruction("this 0")
@THIS // 3835
A=M // 3836
D=M // 3837
@SP // 3838
AM=M+1 // 3839
A=A-1 // 3840
M=D // 3841

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}
// call Array.dispose
@6 // 3842
D=A // 3843
@14 // 3844
M=D // 3845
@Array.dispose // 3846
D=A // 3847
@13 // 3848
M=D // 3849
@String.dispose.ret.0 // 3850
D=A // 3851
@CALL // 3852
0;JMP // 3853
(String.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 3854
AM=M-1 // 3855
D=M // 3856
@5 // 3857
M=D // 3858

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 3859
0;JMP // 3860

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 3861
AM=M+1 // 3862
A=A-1 // 3863
M=0 // 3864

////ReturnInstruction{}
@RETURN // 3865
0;JMP // 3866

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushInstruction("argument 0")
@ARG // 3867
A=M // 3868
D=M // 3869
@SP // 3870
AM=M+1 // 3871
A=A-1 // 3872
M=D // 3873

////PopInstruction{address=pointer 0}
@SP // 3874
AM=M-1 // 3875
D=M // 3876
@3 // 3877
M=D // 3878

////PushInstruction("this 1")
@THIS // 3879
A=M+1 // 3880
D=M // 3881
@SP // 3882
AM=M+1 // 3883
A=A-1 // 3884
M=D // 3885

////ReturnInstruction{}
@RETURN // 3886
0;JMP // 3887

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushInstruction("argument 0")
@ARG // 3888
A=M // 3889
D=M // 3890
@SP // 3891
AM=M+1 // 3892
A=A-1 // 3893
M=D // 3894

////PopInstruction{address=pointer 0}
@SP // 3895
AM=M-1 // 3896
D=M // 3897
@3 // 3898
M=D // 3899

////PushInstruction("this 0")
@THIS // 3900
A=M // 3901
D=M // 3902
@SP // 3903
AM=M+1 // 3904
A=A-1 // 3905
M=D // 3906

////PushInstruction("argument 1")
@ARG // 3907
A=M+1 // 3908
D=M // 3909
@SP // 3910
AM=M+1 // 3911
A=A-1 // 3912
M=D // 3913

////ArithmeticInstruction{ADD}
@SP // 3914
AM=M-1 // 3915
D=M // 3916
A=A-1 // 3917
M=D+M // 3918

////PopInstruction{address=pointer 1}
@SP // 3919
AM=M-1 // 3920
D=M // 3921
@4 // 3922
M=D // 3923

////PushInstruction("that 0")
@THAT // 3924
A=M // 3925
D=M // 3926
@SP // 3927
AM=M+1 // 3928
A=A-1 // 3929
M=D // 3930

////ReturnInstruction{}
@RETURN // 3931
0;JMP // 3932

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushInstruction("argument 0")
@ARG // 3933
A=M // 3934
D=M // 3935
@SP // 3936
AM=M+1 // 3937
A=A-1 // 3938
M=D // 3939

////PopInstruction{address=pointer 0}
@SP // 3940
AM=M-1 // 3941
D=M // 3942
@3 // 3943
M=D // 3944

////PushInstruction("argument 2")
@ARG // 3945
A=M+1 // 3946
A=A+1 // 3947
D=M // 3948
@SP // 3949
AM=M+1 // 3950
A=A-1 // 3951
M=D // 3952

////PushInstruction("this 0")
@THIS // 3953
A=M // 3954
D=M // 3955
@SP // 3956
AM=M+1 // 3957
A=A-1 // 3958
M=D // 3959

////PushInstruction("argument 1")
@ARG // 3960
A=M+1 // 3961
D=M // 3962
@SP // 3963
AM=M+1 // 3964
A=A-1 // 3965
M=D // 3966

////ArithmeticInstruction{ADD}
@SP // 3967
AM=M-1 // 3968
D=M // 3969
A=A-1 // 3970
M=D+M // 3971

////PopInstruction{address=pointer 1}
@SP // 3972
AM=M-1 // 3973
D=M // 3974
@4 // 3975
M=D // 3976

////PopInstruction{address=that 0}
@SP // 3977
AM=M-1 // 3978
D=M // 3979
@THAT // 3980
A=M // 3981
M=D // 3982

////PushInstruction("constant 0")
@SP // 3983
AM=M+1 // 3984
A=A-1 // 3985
M=0 // 3986

////ReturnInstruction{}
@RETURN // 3987
0;JMP // 3988

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 3989
AM=M+1 // 3990
A=A-1 // 3991
M=0 // 3992

////PushInstruction("argument 0")
@ARG // 3993
A=M // 3994
D=M // 3995
@SP // 3996
AM=M+1 // 3997
A=A-1 // 3998
M=D // 3999

////PopInstruction{address=pointer 0}
@SP // 4000
AM=M-1 // 4001
D=M // 4002
@3 // 4003
M=D // 4004

////PushInstruction("this 1")
@THIS // 4005
A=M+1 // 4006
D=M // 4007
@SP // 4008
AM=M+1 // 4009
A=A-1 // 4010
M=D // 4011

////PushInstruction("this 2")
@THIS // 4012
A=M+1 // 4013
A=A+1 // 4014
D=M // 4015
@SP // 4016
AM=M+1 // 4017
A=A-1 // 4018
M=D // 4019

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq4 // 4020
D=A // 4021
@13 // 4022
M=D // 4023
@SP // 4024
AM=M-1 // 4025
D=M // 4026
A=A-1 // 4027
D=M-D // 4028
@DO_EQ // 4029
0;JMP // 4030
(COMPARE_String.appendChar_eq4)
@SP // 4031
AM=M+1 // 4032
A=A-1 // 4033
M=D // 4034

////PushInstruction("constant 0")
@SP // 4035
AM=M+1 // 4036
A=A-1 // 4037
M=0 // 4038

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq5 // 4039
D=A // 4040
@13 // 4041
M=D // 4042
@SP // 4043
AM=M-1 // 4044
D=M // 4045
A=A-1 // 4046
D=M-D // 4047
@DO_EQ // 4048
0;JMP // 4049
(COMPARE_String.appendChar_eq5)
@SP // 4050
AM=M+1 // 4051
A=A-1 // 4052
M=D // 4053

////IfGotoInstruction{label='String.appendChar.IfElse1}
// if-goto String.appendChar.IfElse1
@SP // 4054
AM=M-1 // 4055
D=M // 4056
@String.appendChar.IfElse1 // 4057
D;JNE // 4058

////PushInstruction("this 2")
@THIS // 4059
A=M+1 // 4060
A=A+1 // 4061
D=M // 4062
@SP // 4063
AM=M+1 // 4064
A=A-1 // 4065
M=D // 4066

////PushInstruction("this 2")
@THIS // 4067
A=M+1 // 4068
A=A+1 // 4069
D=M // 4070
@SP // 4071
AM=M+1 // 4072
A=A-1 // 4073
M=D // 4074

////ArithmeticInstruction{ADD}
@SP // 4075
AM=M-1 // 4076
D=M // 4077
A=A-1 // 4078
M=D+M // 4079

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.new
@6 // 4080
D=A // 4081
@14 // 4082
M=D // 4083
@Array.new // 4084
D=A // 4085
@13 // 4086
M=D // 4087
@String.appendChar.ret.0 // 4088
D=A // 4089
@CALL // 4090
0;JMP // 4091
(String.appendChar.ret.0)

////PopInstruction{address=local 0}
@SP // 4092
AM=M-1 // 4093
D=M // 4094
@LCL // 4095
A=M // 4096
M=D // 4097

////PushInstruction("this 0")
@THIS // 4098
A=M // 4099
D=M // 4100
@SP // 4101
AM=M+1 // 4102
A=A-1 // 4103
M=D // 4104

////PushInstruction("local 0")
@LCL // 4105
A=M // 4106
D=M // 4107
@SP // 4108
AM=M+1 // 4109
A=A-1 // 4110
M=D // 4111

////PushInstruction("this 1")
@THIS // 4112
A=M+1 // 4113
D=M // 4114
@SP // 4115
AM=M+1 // 4116
A=A-1 // 4117
M=D // 4118

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Memory.copy
@8 // 4119
D=A // 4120
@14 // 4121
M=D // 4122
@Memory.copy // 4123
D=A // 4124
@13 // 4125
M=D // 4126
@String.appendChar.ret.1 // 4127
D=A // 4128
@CALL // 4129
0;JMP // 4130
(String.appendChar.ret.1)

////PopInstruction{address=temp 0}
@SP // 4131
AM=M-1 // 4132
D=M // 4133
@5 // 4134
M=D // 4135

////PushInstruction("this 0")
@THIS // 4136
A=M // 4137
D=M // 4138
@SP // 4139
AM=M+1 // 4140
A=A-1 // 4141
M=D // 4142

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.dispose
@6 // 4143
D=A // 4144
@14 // 4145
M=D // 4146
@Array.dispose // 4147
D=A // 4148
@13 // 4149
M=D // 4150
@String.appendChar.ret.2 // 4151
D=A // 4152
@CALL // 4153
0;JMP // 4154
(String.appendChar.ret.2)

////PopInstruction{address=temp 0}
@SP // 4155
AM=M-1 // 4156
D=M // 4157
@5 // 4158
M=D // 4159

////PushInstruction("this 2")
@THIS // 4160
A=M+1 // 4161
A=A+1 // 4162
D=M // 4163
@SP // 4164
AM=M+1 // 4165
A=A-1 // 4166
M=D // 4167

////PushInstruction("this 2")
@THIS // 4168
A=M+1 // 4169
A=A+1 // 4170
D=M // 4171
@SP // 4172
AM=M+1 // 4173
A=A-1 // 4174
M=D // 4175

////ArithmeticInstruction{ADD}
@SP // 4176
AM=M-1 // 4177
D=M // 4178
A=A-1 // 4179
M=D+M // 4180

////PopInstruction{address=this 2}
@SP // 4181
AM=M-1 // 4182
D=M // 4183
@THIS // 4184
A=M+1 // 4185
A=A+1 // 4186
M=D // 4187

////PushInstruction("local 0")
@LCL // 4188
A=M // 4189
D=M // 4190
@SP // 4191
AM=M+1 // 4192
A=A-1 // 4193
M=D // 4194

////PopInstruction{address=this 0}
@SP // 4195
AM=M-1 // 4196
D=M // 4197
@THIS // 4198
A=M // 4199
M=D // 4200

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 4201
0;JMP // 4202

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4203
A=M+1 // 4204
D=M // 4205
@SP // 4206
AM=M+1 // 4207
A=A-1 // 4208
M=D // 4209

////PushInstruction("this 0")
@THIS // 4210
A=M // 4211
D=M // 4212
@SP // 4213
AM=M+1 // 4214
A=A-1 // 4215
M=D // 4216

////PushInstruction("this 1")
@THIS // 4217
A=M+1 // 4218
D=M // 4219
@SP // 4220
AM=M+1 // 4221
A=A-1 // 4222
M=D // 4223

////ArithmeticInstruction{ADD}
@SP // 4224
AM=M-1 // 4225
D=M // 4226
A=A-1 // 4227
M=D+M // 4228

////PopInstruction{address=pointer 1}
@SP // 4229
AM=M-1 // 4230
D=M // 4231
@4 // 4232
M=D // 4233

////PopInstruction{address=that 0}
@SP // 4234
AM=M-1 // 4235
D=M // 4236
@THAT // 4237
A=M // 4238
M=D // 4239

////PushInstruction("this 1")
@THIS // 4240
A=M+1 // 4241
D=M // 4242
@SP // 4243
AM=M+1 // 4244
A=A-1 // 4245
M=D // 4246

////PushInstruction("constant 1")
@SP // 4247
AM=M+1 // 4248
A=A-1 // 4249
M=1 // 4250

////ArithmeticInstruction{ADD}
@SP // 4251
AM=M-1 // 4252
D=M // 4253
A=A-1 // 4254
M=D+M // 4255

////PopInstruction{address=this 1}
@SP // 4256
AM=M-1 // 4257
D=M // 4258
@THIS // 4259
A=M+1 // 4260
M=D // 4261

////PushInstruction("pointer 0")
@3 // 4262
D=M // 4263
@SP // 4264
AM=M+1 // 4265
A=A-1 // 4266
M=D // 4267

////ReturnInstruction{}
@RETURN // 4268
0;JMP // 4269

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushInstruction("argument 0")
@ARG // 4270
A=M // 4271
D=M // 4272
@SP // 4273
AM=M+1 // 4274
A=A-1 // 4275
M=D // 4276

////PopInstruction{address=pointer 0}
@SP // 4277
AM=M-1 // 4278
D=M // 4279
@3 // 4280
M=D // 4281

////PushInstruction("this 1")
@THIS // 4282
A=M+1 // 4283
D=M // 4284
@SP // 4285
AM=M+1 // 4286
A=A-1 // 4287
M=D // 4288

////PushInstruction("constant 1")
@SP // 4289
AM=M+1 // 4290
A=A-1 // 4291
M=1 // 4292

////ArithmeticInstruction{SUB}
@SP // 4293
AM=M-1 // 4294
D=M // 4295
A=A-1 // 4296
M=M-D // 4297

////PopInstruction{address=this 1}
@SP // 4298
AM=M-1 // 4299
D=M // 4300
@THIS // 4301
A=M+1 // 4302
M=D // 4303

////PushInstruction("constant 0")
@SP // 4304
AM=M+1 // 4305
A=A-1 // 4306
M=0 // 4307

////ReturnInstruction{}
@RETURN // 4308
0;JMP // 4309

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 4310
AM=M+1 // 4311
A=A-1 // 4312
M=0 // 4313
@SP // 4314
AM=M+1 // 4315
A=A-1 // 4316
M=0 // 4317

////PushInstruction("argument 0")
@ARG // 4318
A=M // 4319
D=M // 4320
@SP // 4321
AM=M+1 // 4322
A=A-1 // 4323
M=D // 4324

////PopInstruction{address=pointer 0}
@SP // 4325
AM=M-1 // 4326
D=M // 4327
@3 // 4328
M=D // 4329

////PushInstruction("constant 1")
@SP // 4330
AM=M+1 // 4331
A=A-1 // 4332
M=1 // 4333

////PopInstruction{address=local 1}
@SP // 4334
AM=M-1 // 4335
D=M // 4336
@LCL // 4337
A=M+1 // 4338
M=D // 4339

////PushInstruction("constant 0")
@SP // 4340
AM=M+1 // 4341
A=A-1 // 4342
M=0 // 4343

////PopInstruction{address=local 0}
@SP // 4344
AM=M-1 // 4345
D=M // 4346
@LCL // 4347
A=M // 4348
M=D // 4349

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////PushInstruction("local 1")
@LCL // 4350
A=M+1 // 4351
D=M // 4352
@SP // 4353
AM=M+1 // 4354
A=A-1 // 4355
M=D // 4356

////PushInstruction("this 1")
@THIS // 4357
A=M+1 // 4358
D=M // 4359
@SP // 4360
AM=M+1 // 4361
A=A-1 // 4362
M=D // 4363

////ArithmeticInstruction{LT}
@COMPARE_String.intValue_lt6 // 4364
D=A // 4365
@13 // 4366
M=D // 4367
@SP // 4368
AM=M-1 // 4369
D=M // 4370
A=A-1 // 4371
D=M-D // 4372
@DO_LT // 4373
0;JMP // 4374
(COMPARE_String.intValue_lt6)
@SP // 4375
AM=M+1 // 4376
A=A-1 // 4377
M=D // 4378

////PushInstruction("constant 0")
@SP // 4379
AM=M+1 // 4380
A=A-1 // 4381
M=0 // 4382

////ArithmeticInstruction{EQ}
@COMPARE_String.intValue_eq7 // 4383
D=A // 4384
@13 // 4385
M=D // 4386
@SP // 4387
AM=M-1 // 4388
D=M // 4389
A=A-1 // 4390
D=M-D // 4391
@DO_EQ // 4392
0;JMP // 4393
(COMPARE_String.intValue_eq7)
@SP // 4394
AM=M+1 // 4395
A=A-1 // 4396
M=D // 4397

////IfGotoInstruction{label='WHILE_END_String.intValue1}
// if-goto WHILE_END_String.intValue1
@SP // 4398
AM=M-1 // 4399
D=M // 4400
@WHILE_END_String.intValue1 // 4401
D;JNE // 4402

////PushInstruction("local 0")
@LCL // 4403
A=M // 4404
D=M // 4405
@SP // 4406
AM=M+1 // 4407
A=A-1 // 4408
M=D // 4409

////PushInstruction("constant 10")
@10 // 4410
D=A // 4411
@SP // 4412
AM=M+1 // 4413
A=A-1 // 4414
M=D // 4415

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}
// call Math.multiply
@7 // 4416
D=A // 4417
@14 // 4418
M=D // 4419
@Math.multiply // 4420
D=A // 4421
@13 // 4422
M=D // 4423
@String.intValue.ret.0 // 4424
D=A // 4425
@CALL // 4426
0;JMP // 4427
(String.intValue.ret.0)

////PushInstruction("this 0")
@THIS // 4428
A=M // 4429
D=M // 4430
@SP // 4431
AM=M+1 // 4432
A=A-1 // 4433
M=D // 4434

////PushInstruction("local 1")
@LCL // 4435
A=M+1 // 4436
D=M // 4437
@SP // 4438
AM=M+1 // 4439
A=A-1 // 4440
M=D // 4441

////ArithmeticInstruction{ADD}
@SP // 4442
AM=M-1 // 4443
D=M // 4444
A=A-1 // 4445
M=D+M // 4446

////PopInstruction{address=pointer 1}
@SP // 4447
AM=M-1 // 4448
D=M // 4449
@4 // 4450
M=D // 4451

////PushInstruction("that 0")
@THAT // 4452
A=M // 4453
D=M // 4454
@SP // 4455
AM=M+1 // 4456
A=A-1 // 4457
M=D // 4458

////PushInstruction("constant 48")
@48 // 4459
D=A // 4460
@SP // 4461
AM=M+1 // 4462
A=A-1 // 4463
M=D // 4464

////ArithmeticInstruction{SUB}
@SP // 4465
AM=M-1 // 4466
D=M // 4467
A=A-1 // 4468
M=M-D // 4469

////ArithmeticInstruction{ADD}
@SP // 4470
AM=M-1 // 4471
D=M // 4472
A=A-1 // 4473
M=D+M // 4474

////PopInstruction{address=local 0}
@SP // 4475
AM=M-1 // 4476
D=M // 4477
@LCL // 4478
A=M // 4479
M=D // 4480

////PushInstruction("local 1")
@LCL // 4481
A=M+1 // 4482
D=M // 4483
@SP // 4484
AM=M+1 // 4485
A=A-1 // 4486
M=D // 4487

////PushInstruction("constant 1")
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=1 // 4491

////ArithmeticInstruction{ADD}
@SP // 4492
AM=M-1 // 4493
D=M // 4494
A=A-1 // 4495
M=D+M // 4496

////PopInstruction{address=local 1}
@SP // 4497
AM=M-1 // 4498
D=M // 4499
@LCL // 4500
A=M+1 // 4501
M=D // 4502

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 4503
0;JMP // 4504

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 4505
A=M // 4506
D=M // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=D // 4511

////ReturnInstruction{}
@RETURN // 4512
0;JMP // 4513

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 4514
AM=M+1 // 4515
A=A-1 // 4516
M=0 // 4517
@SP // 4518
AM=M+1 // 4519
A=A-1 // 4520
M=0 // 4521
@SP // 4522
AM=M+1 // 4523
A=A-1 // 4524
M=0 // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=0 // 4529
@SP // 4530
AM=M+1 // 4531
A=A-1 // 4532
M=0 // 4533
@SP // 4534
AM=M+1 // 4535
A=A-1 // 4536
M=0 // 4537

////PushInstruction("argument 0")
@ARG // 4538
A=M // 4539
D=M // 4540
@SP // 4541
AM=M+1 // 4542
A=A-1 // 4543
M=D // 4544

////PopInstruction{address=pointer 0}
@SP // 4545
AM=M-1 // 4546
D=M // 4547
@3 // 4548
M=D // 4549

////PushInstruction("constant 0")
@SP // 4550
AM=M+1 // 4551
A=A-1 // 4552
M=0 // 4553

////PopInstruction{address=this 1}
@SP // 4554
AM=M-1 // 4555
D=M // 4556
@THIS // 4557
A=M+1 // 4558
M=D // 4559

////PushInstruction("constant 0")
@SP // 4560
AM=M+1 // 4561
A=A-1 // 4562
M=0 // 4563

////PopInstruction{address=local 4}
@LCL // 4564
D=M // 4565
@4 // 4566
A=D+A // 4567
D=A // 4568
@R13 // 4569
M=D // 4570
@SP // 4571
AM=M-1 // 4572
D=M // 4573
@R13 // 4574
A=M // 4575
M=D // 4576

////PushInstruction("argument 1")
@ARG // 4577
A=M+1 // 4578
D=M // 4579
@SP // 4580
AM=M+1 // 4581
A=A-1 // 4582
M=D // 4583

////PushInstruction("constant 0")
@SP // 4584
AM=M+1 // 4585
A=A-1 // 4586
M=0 // 4587

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq8 // 4588
D=A // 4589
@13 // 4590
M=D // 4591
@SP // 4592
AM=M-1 // 4593
D=M // 4594
A=A-1 // 4595
D=M-D // 4596
@DO_EQ // 4597
0;JMP // 4598
(COMPARE_String.setInt_eq8)
@SP // 4599
AM=M+1 // 4600
A=A-1 // 4601
M=D // 4602

////PushInstruction("constant 0")
@SP // 4603
AM=M+1 // 4604
A=A-1 // 4605
M=0 // 4606

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq9 // 4607
D=A // 4608
@13 // 4609
M=D // 4610
@SP // 4611
AM=M-1 // 4612
D=M // 4613
A=A-1 // 4614
D=M-D // 4615
@DO_EQ // 4616
0;JMP // 4617
(COMPARE_String.setInt_eq9)
@SP // 4618
AM=M+1 // 4619
A=A-1 // 4620
M=D // 4621

////IfGotoInstruction{label='String.setInt.IfElse1}
// if-goto String.setInt.IfElse1
@SP // 4622
AM=M-1 // 4623
D=M // 4624
@String.setInt.IfElse1 // 4625
D;JNE // 4626

////PushInstruction("pointer 0")
@3 // 4627
D=M // 4628
@SP // 4629
AM=M+1 // 4630
A=A-1 // 4631
M=D // 4632

////PushInstruction("constant 48")
@48 // 4633
D=A // 4634
@SP // 4635
AM=M+1 // 4636
A=A-1 // 4637
M=D // 4638

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4639
D=A // 4640
@14 // 4641
M=D // 4642
@String.appendChar // 4643
D=A // 4644
@13 // 4645
M=D // 4646
@String.setInt.ret.0 // 4647
D=A // 4648
@CALL // 4649
0;JMP // 4650
(String.setInt.ret.0)

////PopInstruction{address=temp 0}
@SP // 4651
AM=M-1 // 4652
D=M // 4653
@5 // 4654
M=D // 4655

////PushInstruction("constant 0")
@SP // 4656
AM=M+1 // 4657
A=A-1 // 4658
M=0 // 4659

////ReturnInstruction{}
@RETURN // 4660
0;JMP // 4661

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 4662
0;JMP // 4663

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 4664
A=M+1 // 4665
D=M // 4666
@SP // 4667
AM=M+1 // 4668
A=A-1 // 4669
M=D // 4670

////PushInstruction("constant 0")
@SP // 4671
AM=M+1 // 4672
A=A-1 // 4673
M=0 // 4674

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt10 // 4675
D=A // 4676
@13 // 4677
M=D // 4678
@SP // 4679
AM=M-1 // 4680
D=M // 4681
A=A-1 // 4682
D=M-D // 4683
@DO_LT // 4684
0;JMP // 4685
(COMPARE_String.setInt_lt10)
@SP // 4686
AM=M+1 // 4687
A=A-1 // 4688
M=D // 4689

////PushInstruction("constant 0")
@SP // 4690
AM=M+1 // 4691
A=A-1 // 4692
M=0 // 4693

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq11 // 4694
D=A // 4695
@13 // 4696
M=D // 4697
@SP // 4698
AM=M-1 // 4699
D=M // 4700
A=A-1 // 4701
D=M-D // 4702
@DO_EQ // 4703
0;JMP // 4704
(COMPARE_String.setInt_eq11)
@SP // 4705
AM=M+1 // 4706
A=A-1 // 4707
M=D // 4708

////IfGotoInstruction{label='String.setInt.IfElse2}
// if-goto String.setInt.IfElse2
@SP // 4709
AM=M-1 // 4710
D=M // 4711
@String.setInt.IfElse2 // 4712
D;JNE // 4713

////PushInstruction("constant 1")
@SP // 4714
AM=M+1 // 4715
A=A-1 // 4716
M=1 // 4717

////PopInstruction{address=local 4}
@LCL // 4718
D=M // 4719
@4 // 4720
A=D+A // 4721
D=A // 4722
@R13 // 4723
M=D // 4724
@SP // 4725
AM=M-1 // 4726
D=M // 4727
@R13 // 4728
A=M // 4729
M=D // 4730

////PushInstruction("argument 1")
@ARG // 4731
A=M+1 // 4732
D=M // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=D // 4737

////PushInstruction("constant 0")
@SP // 4738
AM=M+1 // 4739
A=A-1 // 4740
M=0 // 4741

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt12 // 4742
D=A // 4743
@13 // 4744
M=D // 4745
@SP // 4746
AM=M-1 // 4747
D=M // 4748
A=A-1 // 4749
D=M-D // 4750
@DO_LT // 4751
0;JMP // 4752
(COMPARE_String.setInt_lt12)
@SP // 4753
AM=M+1 // 4754
A=A-1 // 4755
M=D // 4756

////PushInstruction("argument 1")
@ARG // 4757
A=M+1 // 4758
D=M // 4759
@SP // 4760
AM=M+1 // 4761
A=A-1 // 4762
M=D // 4763

////PushInstruction("constant 32767")
@32767 // 4764
D=A // 4765
@SP // 4766
AM=M+1 // 4767
A=A-1 // 4768
M=D // 4769

////ArithmeticInstruction{AND}
@SP // 4770
AM=M-1 // 4771
D=M // 4772
A=A-1 // 4773
M=D&M // 4774

////PushInstruction("constant 32767")
@32767 // 4775
D=A // 4776
@SP // 4777
AM=M+1 // 4778
A=A-1 // 4779
M=D // 4780

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq13 // 4781
D=A // 4782
@13 // 4783
M=D // 4784
@SP // 4785
AM=M-1 // 4786
D=M // 4787
A=A-1 // 4788
D=M-D // 4789
@DO_EQ // 4790
0;JMP // 4791
(COMPARE_String.setInt_eq13)
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=D // 4795

////ArithmeticInstruction{AND}
@SP // 4796
AM=M-1 // 4797
D=M // 4798
A=A-1 // 4799
M=D&M // 4800

////PushInstruction("constant 0")
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=0 // 4804

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq14 // 4805
D=A // 4806
@13 // 4807
M=D // 4808
@SP // 4809
AM=M-1 // 4810
D=M // 4811
A=A-1 // 4812
D=M-D // 4813
@DO_EQ // 4814
0;JMP // 4815
(COMPARE_String.setInt_eq14)
@SP // 4816
AM=M+1 // 4817
A=A-1 // 4818
M=D // 4819

////IfGotoInstruction{label='String.setInt.IfElse3}
// if-goto String.setInt.IfElse3
@SP // 4820
AM=M-1 // 4821
D=M // 4822
@String.setInt.IfElse3 // 4823
D;JNE // 4824

////PushInstruction("pointer 0")
@3 // 4825
D=M // 4826
@SP // 4827
AM=M+1 // 4828
A=A-1 // 4829
M=D // 4830

////PushInstruction("constant 45")
@45 // 4831
D=A // 4832
@SP // 4833
AM=M+1 // 4834
A=A-1 // 4835
M=D // 4836

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4837
D=A // 4838
@14 // 4839
M=D // 4840
@String.appendChar // 4841
D=A // 4842
@13 // 4843
M=D // 4844
@String.setInt.ret.1 // 4845
D=A // 4846
@CALL // 4847
0;JMP // 4848
(String.setInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 4849
AM=M-1 // 4850
D=M // 4851
@5 // 4852
M=D // 4853

////PushInstruction("pointer 0")
@3 // 4854
D=M // 4855
@SP // 4856
AM=M+1 // 4857
A=A-1 // 4858
M=D // 4859

////PushInstruction("constant 51")
@51 // 4860
D=A // 4861
@SP // 4862
AM=M+1 // 4863
A=A-1 // 4864
M=D // 4865

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4866
D=A // 4867
@14 // 4868
M=D // 4869
@String.appendChar // 4870
D=A // 4871
@13 // 4872
M=D // 4873
@String.setInt.ret.2 // 4874
D=A // 4875
@CALL // 4876
0;JMP // 4877
(String.setInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 4878
AM=M-1 // 4879
D=M // 4880
@5 // 4881
M=D // 4882

////PushInstruction("pointer 0")
@3 // 4883
D=M // 4884
@SP // 4885
AM=M+1 // 4886
A=A-1 // 4887
M=D // 4888

////PushInstruction("constant 50")
@50 // 4889
D=A // 4890
@SP // 4891
AM=M+1 // 4892
A=A-1 // 4893
M=D // 4894

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4895
D=A // 4896
@14 // 4897
M=D // 4898
@String.appendChar // 4899
D=A // 4900
@13 // 4901
M=D // 4902
@String.setInt.ret.3 // 4903
D=A // 4904
@CALL // 4905
0;JMP // 4906
(String.setInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 4907
AM=M-1 // 4908
D=M // 4909
@5 // 4910
M=D // 4911

////PushInstruction("pointer 0")
@3 // 4912
D=M // 4913
@SP // 4914
AM=M+1 // 4915
A=A-1 // 4916
M=D // 4917

////PushInstruction("constant 55")
@55 // 4918
D=A // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=D // 4923

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=4, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4924
D=A // 4925
@14 // 4926
M=D // 4927
@String.appendChar // 4928
D=A // 4929
@13 // 4930
M=D // 4931
@String.setInt.ret.4 // 4932
D=A // 4933
@CALL // 4934
0;JMP // 4935
(String.setInt.ret.4)

////PopInstruction{address=temp 0}
@SP // 4936
AM=M-1 // 4937
D=M // 4938
@5 // 4939
M=D // 4940

////PushInstruction("pointer 0")
@3 // 4941
D=M // 4942
@SP // 4943
AM=M+1 // 4944
A=A-1 // 4945
M=D // 4946

////PushInstruction("constant 54")
@54 // 4947
D=A // 4948
@SP // 4949
AM=M+1 // 4950
A=A-1 // 4951
M=D // 4952

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=5, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4953
D=A // 4954
@14 // 4955
M=D // 4956
@String.appendChar // 4957
D=A // 4958
@13 // 4959
M=D // 4960
@String.setInt.ret.5 // 4961
D=A // 4962
@CALL // 4963
0;JMP // 4964
(String.setInt.ret.5)

////PopInstruction{address=temp 0}
@SP // 4965
AM=M-1 // 4966
D=M // 4967
@5 // 4968
M=D // 4969

////PushInstruction("pointer 0")
@3 // 4970
D=M // 4971
@SP // 4972
AM=M+1 // 4973
A=A-1 // 4974
M=D // 4975

////PushInstruction("constant 56")
@56 // 4976
D=A // 4977
@SP // 4978
AM=M+1 // 4979
A=A-1 // 4980
M=D // 4981

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=6, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 4982
D=A // 4983
@14 // 4984
M=D // 4985
@String.appendChar // 4986
D=A // 4987
@13 // 4988
M=D // 4989
@String.setInt.ret.6 // 4990
D=A // 4991
@CALL // 4992
0;JMP // 4993
(String.setInt.ret.6)

////PopInstruction{address=temp 0}
@SP // 4994
AM=M-1 // 4995
D=M // 4996
@5 // 4997
M=D // 4998

////PushInstruction("constant 0")
@SP // 4999
AM=M+1 // 5000
A=A-1 // 5001
M=0 // 5002

////ReturnInstruction{}
@RETURN // 5003
0;JMP // 5004

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 5005
0;JMP // 5006

////LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 5007
A=M+1 // 5008
D=M // 5009
@SP // 5010
AM=M+1 // 5011
A=A-1 // 5012
M=D // 5013

////ArithmeticInstruction{NEG}
@SP // 5014
A=M-1 // 5015
M=-M // 5016

////PopInstruction{address=argument 1}
@SP // 5017
AM=M-1 // 5018
D=M // 5019
@ARG // 5020
A=M+1 // 5021
M=D // 5022

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 5023
0;JMP // 5024

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 5025
A=M+1 // 5026
D=M // 5027
@SP // 5028
AM=M+1 // 5029
A=A-1 // 5030
M=D // 5031

////PopInstruction{address=local 2}
@SP // 5032
AM=M-1 // 5033
D=M // 5034
@LCL // 5035
A=M+1 // 5036
A=A+1 // 5037
M=D // 5038

////PushInstruction("constant 0")
@SP // 5039
AM=M+1 // 5040
A=A-1 // 5041
M=0 // 5042

////PopInstruction{address=local 3}
@SP // 5043
AM=M-1 // 5044
D=M // 5045
@LCL // 5046
A=M+1 // 5047
A=A+1 // 5048
A=A+1 // 5049
M=D // 5050

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////PushInstruction("local 2")
@LCL // 5051
A=M+1 // 5052
A=A+1 // 5053
D=M // 5054
@SP // 5055
AM=M+1 // 5056
A=A-1 // 5057
M=D // 5058

////PushInstruction("constant 0")
@SP // 5059
AM=M+1 // 5060
A=A-1 // 5061
M=0 // 5062

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt15 // 5063
D=A // 5064
@13 // 5065
M=D // 5066
@SP // 5067
AM=M-1 // 5068
D=M // 5069
A=A-1 // 5070
D=M-D // 5071
@DO_GT // 5072
0;JMP // 5073
(COMPARE_String.setInt_gt15)
@SP // 5074
AM=M+1 // 5075
A=A-1 // 5076
M=D // 5077

////PushInstruction("constant 0")
@SP // 5078
AM=M+1 // 5079
A=A-1 // 5080
M=0 // 5081

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq16 // 5082
D=A // 5083
@13 // 5084
M=D // 5085
@SP // 5086
AM=M-1 // 5087
D=M // 5088
A=A-1 // 5089
D=M-D // 5090
@DO_EQ // 5091
0;JMP // 5092
(COMPARE_String.setInt_eq16)
@SP // 5093
AM=M+1 // 5094
A=A-1 // 5095
M=D // 5096

////IfGotoInstruction{label='WHILE_END_String.setInt1}
// if-goto WHILE_END_String.setInt1
@SP // 5097
AM=M-1 // 5098
D=M // 5099
@WHILE_END_String.setInt1 // 5100
D;JNE // 5101

////PushInstruction("local 2")
@LCL // 5102
A=M+1 // 5103
A=A+1 // 5104
D=M // 5105
@SP // 5106
AM=M+1 // 5107
A=A-1 // 5108
M=D // 5109

////PushInstruction("constant 10")
@10 // 5110
D=A // 5111
@SP // 5112
AM=M+1 // 5113
A=A-1 // 5114
M=D // 5115

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5116
D=A // 5117
@14 // 5118
M=D // 5119
@Math.divide // 5120
D=A // 5121
@13 // 5122
M=D // 5123
@String.setInt.ret.7 // 5124
D=A // 5125
@CALL // 5126
0;JMP // 5127
(String.setInt.ret.7)

////PopInstruction{address=local 2}
@SP // 5128
AM=M-1 // 5129
D=M // 5130
@LCL // 5131
A=M+1 // 5132
A=A+1 // 5133
M=D // 5134

////PushInstruction("local 3")
@LCL // 5135
A=M+1 // 5136
A=A+1 // 5137
A=A+1 // 5138
D=M // 5139
@SP // 5140
AM=M+1 // 5141
A=A-1 // 5142
M=D // 5143

////PushInstruction("constant 1")
@SP // 5144
AM=M+1 // 5145
A=A-1 // 5146
M=1 // 5147

////ArithmeticInstruction{ADD}
@SP // 5148
AM=M-1 // 5149
D=M // 5150
A=A-1 // 5151
M=D+M // 5152

////PopInstruction{address=local 3}
@SP // 5153
AM=M-1 // 5154
D=M // 5155
@LCL // 5156
A=M+1 // 5157
A=A+1 // 5158
A=A+1 // 5159
M=D // 5160

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 5161
0;JMP // 5162

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushInstruction("local 3")
@LCL // 5163
A=M+1 // 5164
A=A+1 // 5165
A=A+1 // 5166
D=M // 5167
@SP // 5168
AM=M+1 // 5169
A=A-1 // 5170
M=D // 5171

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.new
@6 // 5172
D=A // 5173
@14 // 5174
M=D // 5175
@Array.new // 5176
D=A // 5177
@13 // 5178
M=D // 5179
@String.setInt.ret.8 // 5180
D=A // 5181
@CALL // 5182
0;JMP // 5183
(String.setInt.ret.8)

////PopInstruction{address=local 5}
@LCL // 5184
D=M // 5185
@5 // 5186
A=D+A // 5187
D=A // 5188
@R13 // 5189
M=D // 5190
@SP // 5191
AM=M-1 // 5192
D=M // 5193
@R13 // 5194
A=M // 5195
M=D // 5196

////PushInstruction("constant 0")
@SP // 5197
AM=M+1 // 5198
A=A-1 // 5199
M=0 // 5200

////PopInstruction{address=local 1}
@SP // 5201
AM=M-1 // 5202
D=M // 5203
@LCL // 5204
A=M+1 // 5205
M=D // 5206

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////PushInstruction("argument 1")
@ARG // 5207
A=M+1 // 5208
D=M // 5209
@SP // 5210
AM=M+1 // 5211
A=A-1 // 5212
M=D // 5213

////PushInstruction("constant 0")
@SP // 5214
AM=M+1 // 5215
A=A-1 // 5216
M=0 // 5217

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt17 // 5218
D=A // 5219
@13 // 5220
M=D // 5221
@SP // 5222
AM=M-1 // 5223
D=M // 5224
A=A-1 // 5225
D=M-D // 5226
@DO_GT // 5227
0;JMP // 5228
(COMPARE_String.setInt_gt17)
@SP // 5229
AM=M+1 // 5230
A=A-1 // 5231
M=D // 5232

////PushInstruction("constant 0")
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=0 // 5236

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq18 // 5237
D=A // 5238
@13 // 5239
M=D // 5240
@SP // 5241
AM=M-1 // 5242
D=M // 5243
A=A-1 // 5244
D=M-D // 5245
@DO_EQ // 5246
0;JMP // 5247
(COMPARE_String.setInt_eq18)
@SP // 5248
AM=M+1 // 5249
A=A-1 // 5250
M=D // 5251

////IfGotoInstruction{label='WHILE_END_String.setInt2}
// if-goto WHILE_END_String.setInt2
@SP // 5252
AM=M-1 // 5253
D=M // 5254
@WHILE_END_String.setInt2 // 5255
D;JNE // 5256

////PushInstruction("argument 1")
@ARG // 5257
A=M+1 // 5258
D=M // 5259
@SP // 5260
AM=M+1 // 5261
A=A-1 // 5262
M=D // 5263

////PushInstruction("argument 1")
@ARG // 5264
A=M+1 // 5265
D=M // 5266
@SP // 5267
AM=M+1 // 5268
A=A-1 // 5269
M=D // 5270

////PushInstruction("constant 10")
@10 // 5271
D=A // 5272
@SP // 5273
AM=M+1 // 5274
A=A-1 // 5275
M=D // 5276

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5277
D=A // 5278
@14 // 5279
M=D // 5280
@Math.divide // 5281
D=A // 5282
@13 // 5283
M=D // 5284
@String.setInt.ret.9 // 5285
D=A // 5286
@CALL // 5287
0;JMP // 5288
(String.setInt.ret.9)

////PushInstruction("constant 10")
@10 // 5289
D=A // 5290
@SP // 5291
AM=M+1 // 5292
A=A-1 // 5293
M=D // 5294

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=10, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.multiply
@7 // 5295
D=A // 5296
@14 // 5297
M=D // 5298
@Math.multiply // 5299
D=A // 5300
@13 // 5301
M=D // 5302
@String.setInt.ret.10 // 5303
D=A // 5304
@CALL // 5305
0;JMP // 5306
(String.setInt.ret.10)

////ArithmeticInstruction{SUB}
@SP // 5307
AM=M-1 // 5308
D=M // 5309
A=A-1 // 5310
M=M-D // 5311

////PopInstruction{address=local 0}
@SP // 5312
AM=M-1 // 5313
D=M // 5314
@LCL // 5315
A=M // 5316
M=D // 5317

////PushInstruction("local 0")
@LCL // 5318
A=M // 5319
D=M // 5320
@SP // 5321
AM=M+1 // 5322
A=A-1 // 5323
M=D // 5324

////PushInstruction("constant 48")
@48 // 5325
D=A // 5326
@SP // 5327
AM=M+1 // 5328
A=A-1 // 5329
M=D // 5330

////ArithmeticInstruction{ADD}
@SP // 5331
AM=M-1 // 5332
D=M // 5333
A=A-1 // 5334
M=D+M // 5335

////PushInstruction("local 5")
@LCL // 5336
D=M // 5337
@5 // 5338
A=D+A // 5339
D=M // 5340
@SP // 5341
AM=M+1 // 5342
A=A-1 // 5343
M=D // 5344

////PushInstruction("local 1")
@LCL // 5345
A=M+1 // 5346
D=M // 5347
@SP // 5348
AM=M+1 // 5349
A=A-1 // 5350
M=D // 5351

////ArithmeticInstruction{ADD}
@SP // 5352
AM=M-1 // 5353
D=M // 5354
A=A-1 // 5355
M=D+M // 5356

////PopInstruction{address=pointer 1}
@SP // 5357
AM=M-1 // 5358
D=M // 5359
@4 // 5360
M=D // 5361

////PopInstruction{address=that 0}
@SP // 5362
AM=M-1 // 5363
D=M // 5364
@THAT // 5365
A=M // 5366
M=D // 5367

////PushInstruction("argument 1")
@ARG // 5368
A=M+1 // 5369
D=M // 5370
@SP // 5371
AM=M+1 // 5372
A=A-1 // 5373
M=D // 5374

////PushInstruction("constant 10")
@10 // 5375
D=A // 5376
@SP // 5377
AM=M+1 // 5378
A=A-1 // 5379
M=D // 5380

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 5381
D=A // 5382
@14 // 5383
M=D // 5384
@Math.divide // 5385
D=A // 5386
@13 // 5387
M=D // 5388
@String.setInt.ret.11 // 5389
D=A // 5390
@CALL // 5391
0;JMP // 5392
(String.setInt.ret.11)

////PopInstruction{address=argument 1}
@SP // 5393
AM=M-1 // 5394
D=M // 5395
@ARG // 5396
A=M+1 // 5397
M=D // 5398

////PushInstruction("local 1")
@LCL // 5399
A=M+1 // 5400
D=M // 5401
@SP // 5402
AM=M+1 // 5403
A=A-1 // 5404
M=D // 5405

////PushInstruction("constant 1")
@SP // 5406
AM=M+1 // 5407
A=A-1 // 5408
M=1 // 5409

////ArithmeticInstruction{ADD}
@SP // 5410
AM=M-1 // 5411
D=M // 5412
A=A-1 // 5413
M=D+M // 5414

////PopInstruction{address=local 1}
@SP // 5415
AM=M-1 // 5416
D=M // 5417
@LCL // 5418
A=M+1 // 5419
M=D // 5420

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 5421
0;JMP // 5422

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////PushInstruction("local 4")
@LCL // 5423
D=M // 5424
@4 // 5425
A=D+A // 5426
D=M // 5427
@SP // 5428
AM=M+1 // 5429
A=A-1 // 5430
M=D // 5431

////PushInstruction("constant 1")
@SP // 5432
AM=M+1 // 5433
A=A-1 // 5434
M=1 // 5435

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq19 // 5436
D=A // 5437
@13 // 5438
M=D // 5439
@SP // 5440
AM=M-1 // 5441
D=M // 5442
A=A-1 // 5443
D=M-D // 5444
@DO_EQ // 5445
0;JMP // 5446
(COMPARE_String.setInt_eq19)
@SP // 5447
AM=M+1 // 5448
A=A-1 // 5449
M=D // 5450

////PushInstruction("constant 0")
@SP // 5451
AM=M+1 // 5452
A=A-1 // 5453
M=0 // 5454

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq20 // 5455
D=A // 5456
@13 // 5457
M=D // 5458
@SP // 5459
AM=M-1 // 5460
D=M // 5461
A=A-1 // 5462
D=M-D // 5463
@DO_EQ // 5464
0;JMP // 5465
(COMPARE_String.setInt_eq20)
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=D // 5469

////IfGotoInstruction{label='String.setInt.IfElse4}
// if-goto String.setInt.IfElse4
@SP // 5470
AM=M-1 // 5471
D=M // 5472
@String.setInt.IfElse4 // 5473
D;JNE // 5474

////PushInstruction("pointer 0")
@3 // 5475
D=M // 5476
@SP // 5477
AM=M+1 // 5478
A=A-1 // 5479
M=D // 5480

////PushInstruction("constant 45")
@45 // 5481
D=A // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=D // 5486

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 5487
D=A // 5488
@14 // 5489
M=D // 5490
@String.appendChar // 5491
D=A // 5492
@13 // 5493
M=D // 5494
@String.setInt.ret.12 // 5495
D=A // 5496
@CALL // 5497
0;JMP // 5498
(String.setInt.ret.12)

////PopInstruction{address=temp 0}
@SP // 5499
AM=M-1 // 5500
D=M // 5501
@5 // 5502
M=D // 5503

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 5504
0;JMP // 5505

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
@LCL // 5506
A=M+1 // 5507
D=M // 5508
@SP // 5509
AM=M+1 // 5510
A=A-1 // 5511
M=D // 5512

////PushInstruction("constant 0")
@SP // 5513
AM=M+1 // 5514
A=A-1 // 5515
M=0 // 5516

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt21 // 5517
D=A // 5518
@13 // 5519
M=D // 5520
@SP // 5521
AM=M-1 // 5522
D=M // 5523
A=A-1 // 5524
D=M-D // 5525
@DO_GT // 5526
0;JMP // 5527
(COMPARE_String.setInt_gt21)
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=D // 5531

////PushInstruction("constant 0")
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=0 // 5535

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq22 // 5536
D=A // 5537
@13 // 5538
M=D // 5539
@SP // 5540
AM=M-1 // 5541
D=M // 5542
A=A-1 // 5543
D=M-D // 5544
@DO_EQ // 5545
0;JMP // 5546
(COMPARE_String.setInt_eq22)
@SP // 5547
AM=M+1 // 5548
A=A-1 // 5549
M=D // 5550

////IfGotoInstruction{label='WHILE_END_String.setInt3}
// if-goto WHILE_END_String.setInt3
@SP // 5551
AM=M-1 // 5552
D=M // 5553
@WHILE_END_String.setInt3 // 5554
D;JNE // 5555

////PushInstruction("local 1")
@LCL // 5556
A=M+1 // 5557
D=M // 5558
@SP // 5559
AM=M+1 // 5560
A=A-1 // 5561
M=D // 5562

////PushInstruction("constant 1")
@SP // 5563
AM=M+1 // 5564
A=A-1 // 5565
M=1 // 5566

////ArithmeticInstruction{SUB}
@SP // 5567
AM=M-1 // 5568
D=M // 5569
A=A-1 // 5570
M=M-D // 5571

////PopInstruction{address=local 1}
@SP // 5572
AM=M-1 // 5573
D=M // 5574
@LCL // 5575
A=M+1 // 5576
M=D // 5577

////PushInstruction("pointer 0")
@3 // 5578
D=M // 5579
@SP // 5580
AM=M+1 // 5581
A=A-1 // 5582
M=D // 5583

////PushInstruction("local 5")
@LCL // 5584
D=M // 5585
@5 // 5586
A=D+A // 5587
D=M // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=D // 5592

////PushInstruction("local 1")
@LCL // 5593
A=M+1 // 5594
D=M // 5595
@SP // 5596
AM=M+1 // 5597
A=A-1 // 5598
M=D // 5599

////ArithmeticInstruction{ADD}
@SP // 5600
AM=M-1 // 5601
D=M // 5602
A=A-1 // 5603
M=D+M // 5604

////PopInstruction{address=pointer 1}
@SP // 5605
AM=M-1 // 5606
D=M // 5607
@4 // 5608
M=D // 5609

////PushInstruction("that 0")
@THAT // 5610
A=M // 5611
D=M // 5612
@SP // 5613
AM=M+1 // 5614
A=A-1 // 5615
M=D // 5616

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 5617
D=A // 5618
@14 // 5619
M=D // 5620
@String.appendChar // 5621
D=A // 5622
@13 // 5623
M=D // 5624
@String.setInt.ret.13 // 5625
D=A // 5626
@CALL // 5627
0;JMP // 5628
(String.setInt.ret.13)

////PopInstruction{address=temp 0}
@SP // 5629
AM=M-1 // 5630
D=M // 5631
@5 // 5632
M=D // 5633

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 5634
0;JMP // 5635

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushInstruction("local 5")
@LCL // 5636
D=M // 5637
@5 // 5638
A=D+A // 5639
D=M // 5640
@SP // 5641
AM=M+1 // 5642
A=A-1 // 5643
M=D // 5644

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.dispose
@6 // 5645
D=A // 5646
@14 // 5647
M=D // 5648
@Array.dispose // 5649
D=A // 5650
@13 // 5651
M=D // 5652
@String.setInt.ret.14 // 5653
D=A // 5654
@CALL // 5655
0;JMP // 5656
(String.setInt.ret.14)

////PopInstruction{address=temp 0}
@SP // 5657
AM=M-1 // 5658
D=M // 5659
@5 // 5660
M=D // 5661

////PushInstruction("constant 0")
@SP // 5662
AM=M+1 // 5663
A=A-1 // 5664
M=0 // 5665

////ReturnInstruction{}
@RETURN // 5666
0;JMP // 5667

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 5668
D=A // 5669
@SP // 5670
AM=M+1 // 5671
A=A-1 // 5672
M=D // 5673

////ReturnInstruction{}
@RETURN // 5674
0;JMP // 5675

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 5676
D=A // 5677
@SP // 5678
AM=M+1 // 5679
A=A-1 // 5680
M=D // 5681

////ReturnInstruction{}
@RETURN // 5682
0;JMP // 5683

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 5684
D=A // 5685
@SP // 5686
AM=M+1 // 5687
A=A-1 // 5688
M=D // 5689

////ReturnInstruction{}
@RETURN // 5690
0;JMP // 5691

////FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)

////PushInstruction("constant 16")
@16 // 5692
D=A // 5693
@SP // 5694
AM=M+1 // 5695
A=A-1 // 5696
M=D // 5697

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}
// call Array.new
@6 // 5698
D=A // 5699
@14 // 5700
M=D // 5701
@Array.new // 5702
D=A // 5703
@13 // 5704
M=D // 5705
@Math.init.ret.0 // 5706
D=A // 5707
@CALL // 5708
0;JMP // 5709
(Math.init.ret.0)

////PopInstruction{address=Math.0}
@SP // 5710
AM=M-1 // 5711
D=M // 5712
@Math.0 // 5713
M=D // 5714

////PushInstruction("constant 1")
@SP // 5715
AM=M+1 // 5716
A=A-1 // 5717
M=1 // 5718

////PushInstruction("static 0")
@Math.0 // 5719
D=M // 5720
@SP // 5721
AM=M+1 // 5722
A=A-1 // 5723
M=D // 5724

////PushInstruction("constant 0")
@SP // 5725
AM=M+1 // 5726
A=A-1 // 5727
M=0 // 5728

////ArithmeticInstruction{ADD}
@SP // 5729
AM=M-1 // 5730
D=M // 5731
A=A-1 // 5732
M=D+M // 5733

////PopInstruction{address=pointer 1}
@SP // 5734
AM=M-1 // 5735
D=M // 5736
@4 // 5737
M=D // 5738

////PopInstruction{address=that 0}
@SP // 5739
AM=M-1 // 5740
D=M // 5741
@THAT // 5742
A=M // 5743
M=D // 5744

////PushInstruction("constant 2")
@2 // 5745
D=A // 5746
@SP // 5747
AM=M+1 // 5748
A=A-1 // 5749
M=D // 5750

////PushInstruction("static 0")
@Math.0 // 5751
D=M // 5752
@SP // 5753
AM=M+1 // 5754
A=A-1 // 5755
M=D // 5756

////PushInstruction("constant 1")
@SP // 5757
AM=M+1 // 5758
A=A-1 // 5759
M=1 // 5760

////ArithmeticInstruction{ADD}
@SP // 5761
AM=M-1 // 5762
D=M // 5763
A=A-1 // 5764
M=D+M // 5765

////PopInstruction{address=pointer 1}
@SP // 5766
AM=M-1 // 5767
D=M // 5768
@4 // 5769
M=D // 5770

////PopInstruction{address=that 0}
@SP // 5771
AM=M-1 // 5772
D=M // 5773
@THAT // 5774
A=M // 5775
M=D // 5776

////PushInstruction("constant 4")
@4 // 5777
D=A // 5778
@SP // 5779
AM=M+1 // 5780
A=A-1 // 5781
M=D // 5782

////PushInstruction("static 0")
@Math.0 // 5783
D=M // 5784
@SP // 5785
AM=M+1 // 5786
A=A-1 // 5787
M=D // 5788

////PushInstruction("constant 2")
@2 // 5789
D=A // 5790
@SP // 5791
AM=M+1 // 5792
A=A-1 // 5793
M=D // 5794

////ArithmeticInstruction{ADD}
@SP // 5795
AM=M-1 // 5796
D=M // 5797
A=A-1 // 5798
M=D+M // 5799

////PopInstruction{address=pointer 1}
@SP // 5800
AM=M-1 // 5801
D=M // 5802
@4 // 5803
M=D // 5804

////PopInstruction{address=that 0}
@SP // 5805
AM=M-1 // 5806
D=M // 5807
@THAT // 5808
A=M // 5809
M=D // 5810

////PushInstruction("constant 8")
@8 // 5811
D=A // 5812
@SP // 5813
AM=M+1 // 5814
A=A-1 // 5815
M=D // 5816

////PushInstruction("static 0")
@Math.0 // 5817
D=M // 5818
@SP // 5819
AM=M+1 // 5820
A=A-1 // 5821
M=D // 5822

////PushInstruction("constant 3")
@3 // 5823
D=A // 5824
@SP // 5825
AM=M+1 // 5826
A=A-1 // 5827
M=D // 5828

////ArithmeticInstruction{ADD}
@SP // 5829
AM=M-1 // 5830
D=M // 5831
A=A-1 // 5832
M=D+M // 5833

////PopInstruction{address=pointer 1}
@SP // 5834
AM=M-1 // 5835
D=M // 5836
@4 // 5837
M=D // 5838

////PopInstruction{address=that 0}
@SP // 5839
AM=M-1 // 5840
D=M // 5841
@THAT // 5842
A=M // 5843
M=D // 5844

////PushInstruction("constant 16")
@16 // 5845
D=A // 5846
@SP // 5847
AM=M+1 // 5848
A=A-1 // 5849
M=D // 5850

////PushInstruction("static 0")
@Math.0 // 5851
D=M // 5852
@SP // 5853
AM=M+1 // 5854
A=A-1 // 5855
M=D // 5856

////PushInstruction("constant 4")
@4 // 5857
D=A // 5858
@SP // 5859
AM=M+1 // 5860
A=A-1 // 5861
M=D // 5862

////ArithmeticInstruction{ADD}
@SP // 5863
AM=M-1 // 5864
D=M // 5865
A=A-1 // 5866
M=D+M // 5867

////PopInstruction{address=pointer 1}
@SP // 5868
AM=M-1 // 5869
D=M // 5870
@4 // 5871
M=D // 5872

////PopInstruction{address=that 0}
@SP // 5873
AM=M-1 // 5874
D=M // 5875
@THAT // 5876
A=M // 5877
M=D // 5878

////PushInstruction("constant 32")
@32 // 5879
D=A // 5880
@SP // 5881
AM=M+1 // 5882
A=A-1 // 5883
M=D // 5884

////PushInstruction("static 0")
@Math.0 // 5885
D=M // 5886
@SP // 5887
AM=M+1 // 5888
A=A-1 // 5889
M=D // 5890

////PushInstruction("constant 5")
@5 // 5891
D=A // 5892
@SP // 5893
AM=M+1 // 5894
A=A-1 // 5895
M=D // 5896

////ArithmeticInstruction{ADD}
@SP // 5897
AM=M-1 // 5898
D=M // 5899
A=A-1 // 5900
M=D+M // 5901

////PopInstruction{address=pointer 1}
@SP // 5902
AM=M-1 // 5903
D=M // 5904
@4 // 5905
M=D // 5906

////PopInstruction{address=that 0}
@SP // 5907
AM=M-1 // 5908
D=M // 5909
@THAT // 5910
A=M // 5911
M=D // 5912

////PushInstruction("constant 64")
@64 // 5913
D=A // 5914
@SP // 5915
AM=M+1 // 5916
A=A-1 // 5917
M=D // 5918

////PushInstruction("static 0")
@Math.0 // 5919
D=M // 5920
@SP // 5921
AM=M+1 // 5922
A=A-1 // 5923
M=D // 5924

////PushInstruction("constant 6")
@6 // 5925
D=A // 5926
@SP // 5927
AM=M+1 // 5928
A=A-1 // 5929
M=D // 5930

////ArithmeticInstruction{ADD}
@SP // 5931
AM=M-1 // 5932
D=M // 5933
A=A-1 // 5934
M=D+M // 5935

////PopInstruction{address=pointer 1}
@SP // 5936
AM=M-1 // 5937
D=M // 5938
@4 // 5939
M=D // 5940

////PopInstruction{address=that 0}
@SP // 5941
AM=M-1 // 5942
D=M // 5943
@THAT // 5944
A=M // 5945
M=D // 5946

////PushInstruction("constant 128")
@128 // 5947
D=A // 5948
@SP // 5949
AM=M+1 // 5950
A=A-1 // 5951
M=D // 5952

////PushInstruction("static 0")
@Math.0 // 5953
D=M // 5954
@SP // 5955
AM=M+1 // 5956
A=A-1 // 5957
M=D // 5958

////PushInstruction("constant 7")
@7 // 5959
D=A // 5960
@SP // 5961
AM=M+1 // 5962
A=A-1 // 5963
M=D // 5964

////ArithmeticInstruction{ADD}
@SP // 5965
AM=M-1 // 5966
D=M // 5967
A=A-1 // 5968
M=D+M // 5969

////PopInstruction{address=pointer 1}
@SP // 5970
AM=M-1 // 5971
D=M // 5972
@4 // 5973
M=D // 5974

////PopInstruction{address=that 0}
@SP // 5975
AM=M-1 // 5976
D=M // 5977
@THAT // 5978
A=M // 5979
M=D // 5980

////PushInstruction("constant 256")
@256 // 5981
D=A // 5982
@SP // 5983
AM=M+1 // 5984
A=A-1 // 5985
M=D // 5986

////PushInstruction("static 0")
@Math.0 // 5987
D=M // 5988
@SP // 5989
AM=M+1 // 5990
A=A-1 // 5991
M=D // 5992

////PushInstruction("constant 8")
@8 // 5993
D=A // 5994
@SP // 5995
AM=M+1 // 5996
A=A-1 // 5997
M=D // 5998

////ArithmeticInstruction{ADD}
@SP // 5999
AM=M-1 // 6000
D=M // 6001
A=A-1 // 6002
M=D+M // 6003

////PopInstruction{address=pointer 1}
@SP // 6004
AM=M-1 // 6005
D=M // 6006
@4 // 6007
M=D // 6008

////PopInstruction{address=that 0}
@SP // 6009
AM=M-1 // 6010
D=M // 6011
@THAT // 6012
A=M // 6013
M=D // 6014

////PushInstruction("constant 512")
@512 // 6015
D=A // 6016
@SP // 6017
AM=M+1 // 6018
A=A-1 // 6019
M=D // 6020

////PushInstruction("static 0")
@Math.0 // 6021
D=M // 6022
@SP // 6023
AM=M+1 // 6024
A=A-1 // 6025
M=D // 6026

////PushInstruction("constant 9")
@9 // 6027
D=A // 6028
@SP // 6029
AM=M+1 // 6030
A=A-1 // 6031
M=D // 6032

////ArithmeticInstruction{ADD}
@SP // 6033
AM=M-1 // 6034
D=M // 6035
A=A-1 // 6036
M=D+M // 6037

////PopInstruction{address=pointer 1}
@SP // 6038
AM=M-1 // 6039
D=M // 6040
@4 // 6041
M=D // 6042

////PopInstruction{address=that 0}
@SP // 6043
AM=M-1 // 6044
D=M // 6045
@THAT // 6046
A=M // 6047
M=D // 6048

////PushInstruction("constant 1024")
@1024 // 6049
D=A // 6050
@SP // 6051
AM=M+1 // 6052
A=A-1 // 6053
M=D // 6054

////PushInstruction("static 0")
@Math.0 // 6055
D=M // 6056
@SP // 6057
AM=M+1 // 6058
A=A-1 // 6059
M=D // 6060

////PushInstruction("constant 10")
@10 // 6061
D=A // 6062
@SP // 6063
AM=M+1 // 6064
A=A-1 // 6065
M=D // 6066

////ArithmeticInstruction{ADD}
@SP // 6067
AM=M-1 // 6068
D=M // 6069
A=A-1 // 6070
M=D+M // 6071

////PopInstruction{address=pointer 1}
@SP // 6072
AM=M-1 // 6073
D=M // 6074
@4 // 6075
M=D // 6076

////PopInstruction{address=that 0}
@SP // 6077
AM=M-1 // 6078
D=M // 6079
@THAT // 6080
A=M // 6081
M=D // 6082

////PushInstruction("constant 2048")
@2048 // 6083
D=A // 6084
@SP // 6085
AM=M+1 // 6086
A=A-1 // 6087
M=D // 6088

////PushInstruction("static 0")
@Math.0 // 6089
D=M // 6090
@SP // 6091
AM=M+1 // 6092
A=A-1 // 6093
M=D // 6094

////PushInstruction("constant 11")
@11 // 6095
D=A // 6096
@SP // 6097
AM=M+1 // 6098
A=A-1 // 6099
M=D // 6100

////ArithmeticInstruction{ADD}
@SP // 6101
AM=M-1 // 6102
D=M // 6103
A=A-1 // 6104
M=D+M // 6105

////PopInstruction{address=pointer 1}
@SP // 6106
AM=M-1 // 6107
D=M // 6108
@4 // 6109
M=D // 6110

////PopInstruction{address=that 0}
@SP // 6111
AM=M-1 // 6112
D=M // 6113
@THAT // 6114
A=M // 6115
M=D // 6116

////PushInstruction("constant 4096")
@4096 // 6117
D=A // 6118
@SP // 6119
AM=M+1 // 6120
A=A-1 // 6121
M=D // 6122

////PushInstruction("static 0")
@Math.0 // 6123
D=M // 6124
@SP // 6125
AM=M+1 // 6126
A=A-1 // 6127
M=D // 6128

////PushInstruction("constant 12")
@12 // 6129
D=A // 6130
@SP // 6131
AM=M+1 // 6132
A=A-1 // 6133
M=D // 6134

////ArithmeticInstruction{ADD}
@SP // 6135
AM=M-1 // 6136
D=M // 6137
A=A-1 // 6138
M=D+M // 6139

////PopInstruction{address=pointer 1}
@SP // 6140
AM=M-1 // 6141
D=M // 6142
@4 // 6143
M=D // 6144

////PopInstruction{address=that 0}
@SP // 6145
AM=M-1 // 6146
D=M // 6147
@THAT // 6148
A=M // 6149
M=D // 6150

////PushInstruction("constant 8192")
@8192 // 6151
D=A // 6152
@SP // 6153
AM=M+1 // 6154
A=A-1 // 6155
M=D // 6156

////PushInstruction("static 0")
@Math.0 // 6157
D=M // 6158
@SP // 6159
AM=M+1 // 6160
A=A-1 // 6161
M=D // 6162

////PushInstruction("constant 13")
@13 // 6163
D=A // 6164
@SP // 6165
AM=M+1 // 6166
A=A-1 // 6167
M=D // 6168

////ArithmeticInstruction{ADD}
@SP // 6169
AM=M-1 // 6170
D=M // 6171
A=A-1 // 6172
M=D+M // 6173

////PopInstruction{address=pointer 1}
@SP // 6174
AM=M-1 // 6175
D=M // 6176
@4 // 6177
M=D // 6178

////PopInstruction{address=that 0}
@SP // 6179
AM=M-1 // 6180
D=M // 6181
@THAT // 6182
A=M // 6183
M=D // 6184

////PushInstruction("constant 16384")
@16384 // 6185
D=A // 6186
@SP // 6187
AM=M+1 // 6188
A=A-1 // 6189
M=D // 6190

////PushInstruction("static 0")
@Math.0 // 6191
D=M // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196

////PushInstruction("constant 14")
@14 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202

////ArithmeticInstruction{ADD}
@SP // 6203
AM=M-1 // 6204
D=M // 6205
A=A-1 // 6206
M=D+M // 6207

////PopInstruction{address=pointer 1}
@SP // 6208
AM=M-1 // 6209
D=M // 6210
@4 // 6211
M=D // 6212

////PopInstruction{address=that 0}
@SP // 6213
AM=M-1 // 6214
D=M // 6215
@THAT // 6216
A=M // 6217
M=D // 6218

////PushInstruction("constant 16384")
@16384 // 6219
D=A // 6220
@SP // 6221
AM=M+1 // 6222
A=A-1 // 6223
M=D // 6224

////PushInstruction("constant 16384")
@16384 // 6225
D=A // 6226
@SP // 6227
AM=M+1 // 6228
A=A-1 // 6229
M=D // 6230

////ArithmeticInstruction{ADD}
@SP // 6231
AM=M-1 // 6232
D=M // 6233
A=A-1 // 6234
M=D+M // 6235

////PushInstruction("static 0")
@Math.0 // 6236
D=M // 6237
@SP // 6238
AM=M+1 // 6239
A=A-1 // 6240
M=D // 6241

////PushInstruction("constant 15")
@15 // 6242
D=A // 6243
@SP // 6244
AM=M+1 // 6245
A=A-1 // 6246
M=D // 6247

////ArithmeticInstruction{ADD}
@SP // 6248
AM=M-1 // 6249
D=M // 6250
A=A-1 // 6251
M=D+M // 6252

////PopInstruction{address=pointer 1}
@SP // 6253
AM=M-1 // 6254
D=M // 6255
@4 // 6256
M=D // 6257

////PopInstruction{address=that 0}
@SP // 6258
AM=M-1 // 6259
D=M // 6260
@THAT // 6261
A=M // 6262
M=D // 6263

////PushInstruction("constant 0")
@SP // 6264
AM=M+1 // 6265
A=A-1 // 6266
M=0 // 6267

////ReturnInstruction{}
@RETURN // 6268
0;JMP // 6269

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////PushInstruction("argument 0")
@ARG // 6270
A=M // 6271
D=M // 6272
@SP // 6273
AM=M+1 // 6274
A=A-1 // 6275
M=D // 6276

////PushInstruction("static 0")
@Math.0 // 6277
D=M // 6278
@SP // 6279
AM=M+1 // 6280
A=A-1 // 6281
M=D // 6282

////PushInstruction("argument 1")
@ARG // 6283
A=M+1 // 6284
D=M // 6285
@SP // 6286
AM=M+1 // 6287
A=A-1 // 6288
M=D // 6289

////ArithmeticInstruction{ADD}
@SP // 6290
AM=M-1 // 6291
D=M // 6292
A=A-1 // 6293
M=D+M // 6294

////PopInstruction{address=pointer 1}
@SP // 6295
AM=M-1 // 6296
D=M // 6297
@4 // 6298
M=D // 6299

////PushInstruction("that 0")
@THAT // 6300
A=M // 6301
D=M // 6302
@SP // 6303
AM=M+1 // 6304
A=A-1 // 6305
M=D // 6306

////ArithmeticInstruction{AND}
@SP // 6307
AM=M-1 // 6308
D=M // 6309
A=A-1 // 6310
M=D&M // 6311

////ReturnInstruction{}
@RETURN // 6312
0;JMP // 6313

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 6314
AM=M+1 // 6315
A=A-1 // 6316
M=0 // 6317
@SP // 6318
AM=M+1 // 6319
A=A-1 // 6320
M=0 // 6321
@SP // 6322
AM=M+1 // 6323
A=A-1 // 6324
M=0 // 6325

////PushInstruction("argument 0")
@ARG // 6326
A=M // 6327
D=M // 6328
@SP // 6329
AM=M+1 // 6330
A=A-1 // 6331
M=D // 6332

////PushInstruction("constant 0")
@SP // 6333
AM=M+1 // 6334
A=A-1 // 6335
M=0 // 6336

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq0 // 6337
D=A // 6338
@13 // 6339
M=D // 6340
@SP // 6341
AM=M-1 // 6342
D=M // 6343
A=A-1 // 6344
D=M-D // 6345
@DO_EQ // 6346
0;JMP // 6347
(COMPARE_Math.multiply_eq0)
@SP // 6348
AM=M+1 // 6349
A=A-1 // 6350
M=D // 6351

////PushInstruction("argument 1")
@ARG // 6352
A=M+1 // 6353
D=M // 6354
@SP // 6355
AM=M+1 // 6356
A=A-1 // 6357
M=D // 6358

////PushInstruction("constant 0")
@SP // 6359
AM=M+1 // 6360
A=A-1 // 6361
M=0 // 6362

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq1 // 6363
D=A // 6364
@13 // 6365
M=D // 6366
@SP // 6367
AM=M-1 // 6368
D=M // 6369
A=A-1 // 6370
D=M-D // 6371
@DO_EQ // 6372
0;JMP // 6373
(COMPARE_Math.multiply_eq1)
@SP // 6374
AM=M+1 // 6375
A=A-1 // 6376
M=D // 6377

////ArithmeticInstruction{OR}
@SP // 6378
AM=M-1 // 6379
D=M // 6380
A=A-1 // 6381
M=D|M // 6382

////PushInstruction("constant 0")
@SP // 6383
AM=M+1 // 6384
A=A-1 // 6385
M=0 // 6386

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq2 // 6387
D=A // 6388
@13 // 6389
M=D // 6390
@SP // 6391
AM=M-1 // 6392
D=M // 6393
A=A-1 // 6394
D=M-D // 6395
@DO_EQ // 6396
0;JMP // 6397
(COMPARE_Math.multiply_eq2)
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=D // 6401

////IfGotoInstruction{label='Math.multiply.IfElse1}
// if-goto Math.multiply.IfElse1
@SP // 6402
AM=M-1 // 6403
D=M // 6404
@Math.multiply.IfElse1 // 6405
D;JNE // 6406

////PushInstruction("constant 0")
@SP // 6407
AM=M+1 // 6408
A=A-1 // 6409
M=0 // 6410

////ReturnInstruction{}
@RETURN // 6411
0;JMP // 6412

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 6413
0;JMP // 6414

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 6415
A=M // 6416
D=M // 6417
@SP // 6418
AM=M+1 // 6419
A=A-1 // 6420
M=D // 6421

////PushInstruction("constant 1")
@SP // 6422
AM=M+1 // 6423
A=A-1 // 6424
M=1 // 6425

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq3 // 6426
D=A // 6427
@13 // 6428
M=D // 6429
@SP // 6430
AM=M-1 // 6431
D=M // 6432
A=A-1 // 6433
D=M-D // 6434
@DO_EQ // 6435
0;JMP // 6436
(COMPARE_Math.multiply_eq3)
@SP // 6437
AM=M+1 // 6438
A=A-1 // 6439
M=D // 6440

////PushInstruction("constant 0")
@SP // 6441
AM=M+1 // 6442
A=A-1 // 6443
M=0 // 6444

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq4 // 6445
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
(COMPARE_Math.multiply_eq4)
@SP // 6456
AM=M+1 // 6457
A=A-1 // 6458
M=D // 6459

////IfGotoInstruction{label='Math.multiply.IfElse2}
// if-goto Math.multiply.IfElse2
@SP // 6460
AM=M-1 // 6461
D=M // 6462
@Math.multiply.IfElse2 // 6463
D;JNE // 6464

////PushInstruction("argument 1")
@ARG // 6465
A=M+1 // 6466
D=M // 6467
@SP // 6468
AM=M+1 // 6469
A=A-1 // 6470
M=D // 6471

////ReturnInstruction{}
@RETURN // 6472
0;JMP // 6473

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 6474
0;JMP // 6475

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 6476
A=M+1 // 6477
D=M // 6478
@SP // 6479
AM=M+1 // 6480
A=A-1 // 6481
M=D // 6482

////PushInstruction("constant 1")
@SP // 6483
AM=M+1 // 6484
A=A-1 // 6485
M=1 // 6486

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq5 // 6487
D=A // 6488
@13 // 6489
M=D // 6490
@SP // 6491
AM=M-1 // 6492
D=M // 6493
A=A-1 // 6494
D=M-D // 6495
@DO_EQ // 6496
0;JMP // 6497
(COMPARE_Math.multiply_eq5)
@SP // 6498
AM=M+1 // 6499
A=A-1 // 6500
M=D // 6501

////PushInstruction("constant 0")
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=0 // 6505

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq6 // 6506
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
(COMPARE_Math.multiply_eq6)
@SP // 6517
AM=M+1 // 6518
A=A-1 // 6519
M=D // 6520

////IfGotoInstruction{label='Math.multiply.IfElse3}
// if-goto Math.multiply.IfElse3
@SP // 6521
AM=M-1 // 6522
D=M // 6523
@Math.multiply.IfElse3 // 6524
D;JNE // 6525

////PushInstruction("argument 0")
@ARG // 6526
A=M // 6527
D=M // 6528
@SP // 6529
AM=M+1 // 6530
A=A-1 // 6531
M=D // 6532

////ReturnInstruction{}
@RETURN // 6533
0;JMP // 6534

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 6535
0;JMP // 6536

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 6537
A=M // 6538
D=M // 6539
@SP // 6540
AM=M+1 // 6541
A=A-1 // 6542
M=D // 6543

////PushInstruction("constant 2")
@2 // 6544
D=A // 6545
@SP // 6546
AM=M+1 // 6547
A=A-1 // 6548
M=D // 6549

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq7 // 6550
D=A // 6551
@13 // 6552
M=D // 6553
@SP // 6554
AM=M-1 // 6555
D=M // 6556
A=A-1 // 6557
D=M-D // 6558
@DO_EQ // 6559
0;JMP // 6560
(COMPARE_Math.multiply_eq7)
@SP // 6561
AM=M+1 // 6562
A=A-1 // 6563
M=D // 6564

////PushInstruction("constant 0")
@SP // 6565
AM=M+1 // 6566
A=A-1 // 6567
M=0 // 6568

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq8 // 6569
D=A // 6570
@13 // 6571
M=D // 6572
@SP // 6573
AM=M-1 // 6574
D=M // 6575
A=A-1 // 6576
D=M-D // 6577
@DO_EQ // 6578
0;JMP // 6579
(COMPARE_Math.multiply_eq8)
@SP // 6580
AM=M+1 // 6581
A=A-1 // 6582
M=D // 6583

////IfGotoInstruction{label='Math.multiply.IfElse4}
// if-goto Math.multiply.IfElse4
@SP // 6584
AM=M-1 // 6585
D=M // 6586
@Math.multiply.IfElse4 // 6587
D;JNE // 6588

////PushInstruction("argument 1")
@ARG // 6589
A=M+1 // 6590
D=M // 6591
@SP // 6592
AM=M+1 // 6593
A=A-1 // 6594
M=D // 6595

////PushInstruction("argument 1")
@ARG // 6596
A=M+1 // 6597
D=M // 6598
@SP // 6599
AM=M+1 // 6600
A=A-1 // 6601
M=D // 6602

////ArithmeticInstruction{ADD}
@SP // 6603
AM=M-1 // 6604
D=M // 6605
A=A-1 // 6606
M=D+M // 6607

////ReturnInstruction{}
@RETURN // 6608
0;JMP // 6609

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 6610
0;JMP // 6611

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////PushInstruction("argument 1")
@ARG // 6612
A=M+1 // 6613
D=M // 6614
@SP // 6615
AM=M+1 // 6616
A=A-1 // 6617
M=D // 6618

////PushInstruction("constant 2")
@2 // 6619
D=A // 6620
@SP // 6621
AM=M+1 // 6622
A=A-1 // 6623
M=D // 6624

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq9 // 6625
D=A // 6626
@13 // 6627
M=D // 6628
@SP // 6629
AM=M-1 // 6630
D=M // 6631
A=A-1 // 6632
D=M-D // 6633
@DO_EQ // 6634
0;JMP // 6635
(COMPARE_Math.multiply_eq9)
@SP // 6636
AM=M+1 // 6637
A=A-1 // 6638
M=D // 6639

////PushInstruction("constant 0")
@SP // 6640
AM=M+1 // 6641
A=A-1 // 6642
M=0 // 6643

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq10 // 6644
D=A // 6645
@13 // 6646
M=D // 6647
@SP // 6648
AM=M-1 // 6649
D=M // 6650
A=A-1 // 6651
D=M-D // 6652
@DO_EQ // 6653
0;JMP // 6654
(COMPARE_Math.multiply_eq10)
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=D // 6658

////IfGotoInstruction{label='Math.multiply.IfElse5}
// if-goto Math.multiply.IfElse5
@SP // 6659
AM=M-1 // 6660
D=M // 6661
@Math.multiply.IfElse5 // 6662
D;JNE // 6663

////PushInstruction("argument 0")
@ARG // 6664
A=M // 6665
D=M // 6666
@SP // 6667
AM=M+1 // 6668
A=A-1 // 6669
M=D // 6670

////PushInstruction("argument 0")
@ARG // 6671
A=M // 6672
D=M // 6673
@SP // 6674
AM=M+1 // 6675
A=A-1 // 6676
M=D // 6677

////ArithmeticInstruction{ADD}
@SP // 6678
AM=M-1 // 6679
D=M // 6680
A=A-1 // 6681
M=D+M // 6682

////ReturnInstruction{}
@RETURN // 6683
0;JMP // 6684

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 6685
0;JMP // 6686

////LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushInstruction("constant 1")
@SP // 6687
AM=M+1 // 6688
A=A-1 // 6689
M=1 // 6690

////PopInstruction{address=local 2}
@SP // 6691
AM=M-1 // 6692
D=M // 6693
@LCL // 6694
A=M+1 // 6695
A=A+1 // 6696
M=D // 6697

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////PushInstruction("local 1")
@LCL // 6698
A=M+1 // 6699
D=M // 6700
@SP // 6701
AM=M+1 // 6702
A=A-1 // 6703
M=D // 6704

////PushInstruction("constant 16")
@16 // 6705
D=A // 6706
@SP // 6707
AM=M+1 // 6708
A=A-1 // 6709
M=D // 6710

////ArithmeticInstruction{LT}
@COMPARE_Math.multiply_lt11 // 6711
D=A // 6712
@13 // 6713
M=D // 6714
@SP // 6715
AM=M-1 // 6716
D=M // 6717
A=A-1 // 6718
D=M-D // 6719
@DO_LT // 6720
0;JMP // 6721
(COMPARE_Math.multiply_lt11)
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=D // 6725

////PushInstruction("constant 0")
@SP // 6726
AM=M+1 // 6727
A=A-1 // 6728
M=0 // 6729

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq12 // 6730
D=A // 6731
@13 // 6732
M=D // 6733
@SP // 6734
AM=M-1 // 6735
D=M // 6736
A=A-1 // 6737
D=M-D // 6738
@DO_EQ // 6739
0;JMP // 6740
(COMPARE_Math.multiply_eq12)
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=D // 6744

////IfGotoInstruction{label='WHILE_END_Math.multiply1}
// if-goto WHILE_END_Math.multiply1
@SP // 6745
AM=M-1 // 6746
D=M // 6747
@WHILE_END_Math.multiply1 // 6748
D;JNE // 6749

////PushInstruction("argument 1")
@ARG // 6750
A=M+1 // 6751
D=M // 6752
@SP // 6753
AM=M+1 // 6754
A=A-1 // 6755
M=D // 6756

////PushInstruction("local 2")
@LCL // 6757
A=M+1 // 6758
A=A+1 // 6759
D=M // 6760
@SP // 6761
AM=M+1 // 6762
A=A-1 // 6763
M=D // 6764

////ArithmeticInstruction{AND}
@SP // 6765
AM=M-1 // 6766
D=M // 6767
A=A-1 // 6768
M=D&M // 6769

////PushInstruction("constant 0")
@SP // 6770
AM=M+1 // 6771
A=A-1 // 6772
M=0 // 6773

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq13 // 6774
D=A // 6775
@13 // 6776
M=D // 6777
@SP // 6778
AM=M-1 // 6779
D=M // 6780
A=A-1 // 6781
D=M-D // 6782
@DO_EQ // 6783
0;JMP // 6784
(COMPARE_Math.multiply_eq13)
@SP // 6785
AM=M+1 // 6786
A=A-1 // 6787
M=D // 6788

////IfGotoInstruction{label='Math.multiply.IfElse6}
// if-goto Math.multiply.IfElse6
@SP // 6789
AM=M-1 // 6790
D=M // 6791
@Math.multiply.IfElse6 // 6792
D;JNE // 6793

////PushInstruction("local 0")
@LCL // 6794
A=M // 6795
D=M // 6796
@SP // 6797
AM=M+1 // 6798
A=A-1 // 6799
M=D // 6800

////PushInstruction("argument 0")
@ARG // 6801
A=M // 6802
D=M // 6803
@SP // 6804
AM=M+1 // 6805
A=A-1 // 6806
M=D // 6807

////ArithmeticInstruction{ADD}
@SP // 6808
AM=M-1 // 6809
D=M // 6810
A=A-1 // 6811
M=D+M // 6812

////PopInstruction{address=local 0}
@SP // 6813
AM=M-1 // 6814
D=M // 6815
@LCL // 6816
A=M // 6817
M=D // 6818

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 6819
0;JMP // 6820

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushInstruction("argument 0")
@ARG // 6821
A=M // 6822
D=M // 6823
@SP // 6824
AM=M+1 // 6825
A=A-1 // 6826
M=D // 6827

////PushInstruction("argument 0")
@ARG // 6828
A=M // 6829
D=M // 6830
@SP // 6831
AM=M+1 // 6832
A=A-1 // 6833
M=D // 6834

////ArithmeticInstruction{ADD}
@SP // 6835
AM=M-1 // 6836
D=M // 6837
A=A-1 // 6838
M=D+M // 6839

////PopInstruction{address=argument 0}
@SP // 6840
AM=M-1 // 6841
D=M // 6842
@ARG // 6843
A=M // 6844
M=D // 6845

////PushInstruction("local 1")
@LCL // 6846
A=M+1 // 6847
D=M // 6848
@SP // 6849
AM=M+1 // 6850
A=A-1 // 6851
M=D // 6852

////PushInstruction("constant 1")
@SP // 6853
AM=M+1 // 6854
A=A-1 // 6855
M=1 // 6856

////ArithmeticInstruction{ADD}
@SP // 6857
AM=M-1 // 6858
D=M // 6859
A=A-1 // 6860
M=D+M // 6861

////PopInstruction{address=local 1}
@SP // 6862
AM=M-1 // 6863
D=M // 6864
@LCL // 6865
A=M+1 // 6866
M=D // 6867

////PushInstruction("local 2")
@LCL // 6868
A=M+1 // 6869
A=A+1 // 6870
D=M // 6871
@SP // 6872
AM=M+1 // 6873
A=A-1 // 6874
M=D // 6875

////PushInstruction("local 2")
@LCL // 6876
A=M+1 // 6877
A=A+1 // 6878
D=M // 6879
@SP // 6880
AM=M+1 // 6881
A=A-1 // 6882
M=D // 6883

////ArithmeticInstruction{ADD}
@SP // 6884
AM=M-1 // 6885
D=M // 6886
A=A-1 // 6887
M=D+M // 6888

////PopInstruction{address=local 2}
@SP // 6889
AM=M-1 // 6890
D=M // 6891
@LCL // 6892
A=M+1 // 6893
A=A+1 // 6894
M=D // 6895

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 6896
0;JMP // 6897

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 6898
A=M // 6899
D=M // 6900
@SP // 6901
AM=M+1 // 6902
A=A-1 // 6903
M=D // 6904

////ReturnInstruction{}
@RETURN // 6905
0;JMP // 6906

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 6907
AM=M+1 // 6908
A=A-1 // 6909
M=0 // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=0 // 6914
@SP // 6915
AM=M+1 // 6916
A=A-1 // 6917
M=0 // 6918

////PushInstruction("argument 0")
@ARG // 6919
A=M // 6920
D=M // 6921
@SP // 6922
AM=M+1 // 6923
A=A-1 // 6924
M=D // 6925

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 6926
D=A // 6927
@14 // 6928
M=D // 6929
@Math.abs // 6930
D=A // 6931
@13 // 6932
M=D // 6933
@Math.divide.ret.0 // 6934
D=A // 6935
@CALL // 6936
0;JMP // 6937
(Math.divide.ret.0)

////PopInstruction{address=local 2}
@SP // 6938
AM=M-1 // 6939
D=M // 6940
@LCL // 6941
A=M+1 // 6942
A=A+1 // 6943
M=D // 6944

////PushInstruction("argument 1")
@ARG // 6945
A=M+1 // 6946
D=M // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 6952
D=A // 6953
@14 // 6954
M=D // 6955
@Math.abs // 6956
D=A // 6957
@13 // 6958
M=D // 6959
@Math.divide.ret.1 // 6960
D=A // 6961
@CALL // 6962
0;JMP // 6963
(Math.divide.ret.1)

////PopInstruction{address=local 1}
@SP // 6964
AM=M-1 // 6965
D=M // 6966
@LCL // 6967
A=M+1 // 6968
M=D // 6969

////PushInstruction("argument 0")
@ARG // 6970
A=M // 6971
D=M // 6972
@SP // 6973
AM=M+1 // 6974
A=A-1 // 6975
M=D // 6976

////PushInstruction("constant 0")
@SP // 6977
AM=M+1 // 6978
A=A-1 // 6979
M=0 // 6980

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq14 // 6981
D=A // 6982
@13 // 6983
M=D // 6984
@SP // 6985
AM=M-1 // 6986
D=M // 6987
A=A-1 // 6988
D=M-D // 6989
@DO_EQ // 6990
0;JMP // 6991
(COMPARE_Math.divide_eq14)
@SP // 6992
AM=M+1 // 6993
A=A-1 // 6994
M=D // 6995

////PushInstruction("local 1")
@LCL // 6996
A=M+1 // 6997
D=M // 6998
@SP // 6999
AM=M+1 // 7000
A=A-1 // 7001
M=D // 7002

////PushInstruction("local 2")
@LCL // 7003
A=M+1 // 7004
A=A+1 // 7005
D=M // 7006
@SP // 7007
AM=M+1 // 7008
A=A-1 // 7009
M=D // 7010

////ArithmeticInstruction{GT}
@COMPARE_Math.divide_gt15 // 7011
D=A // 7012
@13 // 7013
M=D // 7014
@SP // 7015
AM=M-1 // 7016
D=M // 7017
A=A-1 // 7018
D=M-D // 7019
@DO_GT // 7020
0;JMP // 7021
(COMPARE_Math.divide_gt15)
@SP // 7022
AM=M+1 // 7023
A=A-1 // 7024
M=D // 7025

////ArithmeticInstruction{OR}
@SP // 7026
AM=M-1 // 7027
D=M // 7028
A=A-1 // 7029
M=D|M // 7030

////PushInstruction("constant 0")
@SP // 7031
AM=M+1 // 7032
A=A-1 // 7033
M=0 // 7034

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq16 // 7035
D=A // 7036
@13 // 7037
M=D // 7038
@SP // 7039
AM=M-1 // 7040
D=M // 7041
A=A-1 // 7042
D=M-D // 7043
@DO_EQ // 7044
0;JMP // 7045
(COMPARE_Math.divide_eq16)
@SP // 7046
AM=M+1 // 7047
A=A-1 // 7048
M=D // 7049

////IfGotoInstruction{label='Math.divide.IfElse1}
// if-goto Math.divide.IfElse1
@SP // 7050
AM=M-1 // 7051
D=M // 7052
@Math.divide.IfElse1 // 7053
D;JNE // 7054

////PushInstruction("constant 0")
@SP // 7055
AM=M+1 // 7056
A=A-1 // 7057
M=0 // 7058

////ReturnInstruction{}
@RETURN // 7059
0;JMP // 7060

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 7061
0;JMP // 7062

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 7063
A=M // 7064
D=M // 7065
@SP // 7066
AM=M+1 // 7067
A=A-1 // 7068
M=D // 7069

////PushInstruction("argument 1")
@ARG // 7070
A=M+1 // 7071
D=M // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=D // 7076

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq17 // 7077
D=A // 7078
@13 // 7079
M=D // 7080
@SP // 7081
AM=M-1 // 7082
D=M // 7083
A=A-1 // 7084
D=M-D // 7085
@DO_EQ // 7086
0;JMP // 7087
(COMPARE_Math.divide_eq17)
@SP // 7088
AM=M+1 // 7089
A=A-1 // 7090
M=D // 7091

////PushInstruction("constant 0")
@SP // 7092
AM=M+1 // 7093
A=A-1 // 7094
M=0 // 7095

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq18 // 7096
D=A // 7097
@13 // 7098
M=D // 7099
@SP // 7100
AM=M-1 // 7101
D=M // 7102
A=A-1 // 7103
D=M-D // 7104
@DO_EQ // 7105
0;JMP // 7106
(COMPARE_Math.divide_eq18)
@SP // 7107
AM=M+1 // 7108
A=A-1 // 7109
M=D // 7110

////IfGotoInstruction{label='Math.divide.IfElse2}
// if-goto Math.divide.IfElse2
@SP // 7111
AM=M-1 // 7112
D=M // 7113
@Math.divide.IfElse2 // 7114
D;JNE // 7115

////PushInstruction("constant 1")
@SP // 7116
AM=M+1 // 7117
A=A-1 // 7118
M=1 // 7119

////ReturnInstruction{}
@RETURN // 7120
0;JMP // 7121

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 7122
0;JMP // 7123

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////PushInstruction("argument 0")
@ARG // 7124
A=M // 7125
D=M // 7126
@SP // 7127
AM=M+1 // 7128
A=A-1 // 7129
M=D // 7130

////PushInstruction("constant 0")
@SP // 7131
AM=M+1 // 7132
A=A-1 // 7133
M=0 // 7134

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt19 // 7135
D=A // 7136
@13 // 7137
M=D // 7138
@SP // 7139
AM=M-1 // 7140
D=M // 7141
A=A-1 // 7142
D=M-D // 7143
@DO_LT // 7144
0;JMP // 7145
(COMPARE_Math.divide_lt19)
@SP // 7146
AM=M+1 // 7147
A=A-1 // 7148
M=D // 7149

////PushInstruction("argument 1")
@ARG // 7150
A=M+1 // 7151
D=M // 7152
@SP // 7153
AM=M+1 // 7154
A=A-1 // 7155
M=D // 7156

////PushInstruction("constant 0")
@SP // 7157
AM=M+1 // 7158
A=A-1 // 7159
M=0 // 7160

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt20 // 7161
D=A // 7162
@13 // 7163
M=D // 7164
@SP // 7165
AM=M-1 // 7166
D=M // 7167
A=A-1 // 7168
D=M-D // 7169
@DO_LT // 7170
0;JMP // 7171
(COMPARE_Math.divide_lt20)
@SP // 7172
AM=M+1 // 7173
A=A-1 // 7174
M=D // 7175

////ArithmeticInstruction{OR}
@SP // 7176
AM=M-1 // 7177
D=M // 7178
A=A-1 // 7179
M=D|M // 7180

////PushInstruction("constant 0")
@SP // 7181
AM=M+1 // 7182
A=A-1 // 7183
M=0 // 7184

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq21 // 7185
D=A // 7186
@13 // 7187
M=D // 7188
@SP // 7189
AM=M-1 // 7190
D=M // 7191
A=A-1 // 7192
D=M-D // 7193
@DO_EQ // 7194
0;JMP // 7195
(COMPARE_Math.divide_eq21)
@SP // 7196
AM=M+1 // 7197
A=A-1 // 7198
M=D // 7199

////IfGotoInstruction{label='Math.divide.IfElse3}
// if-goto Math.divide.IfElse3
@SP // 7200
AM=M-1 // 7201
D=M // 7202
@Math.divide.IfElse3 // 7203
D;JNE // 7204

////PushInstruction("local 2")
@LCL // 7205
A=M+1 // 7206
A=A+1 // 7207
D=M // 7208
@SP // 7209
AM=M+1 // 7210
A=A-1 // 7211
M=D // 7212

////PushInstruction("local 1")
@LCL // 7213
A=M+1 // 7214
D=M // 7215
@SP // 7216
AM=M+1 // 7217
A=A-1 // 7218
M=D // 7219

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 7220
D=A // 7221
@14 // 7222
M=D // 7223
@Math.divide // 7224
D=A // 7225
@13 // 7226
M=D // 7227
@Math.divide.ret.2 // 7228
D=A // 7229
@CALL // 7230
0;JMP // 7231
(Math.divide.ret.2)

////PopInstruction{address=local 0}
@SP // 7232
AM=M-1 // 7233
D=M // 7234
@LCL // 7235
A=M // 7236
M=D // 7237

////PushInstruction("argument 0")
@ARG // 7238
A=M // 7239
D=M // 7240
@SP // 7241
AM=M+1 // 7242
A=A-1 // 7243
M=D // 7244

////PushInstruction("constant 0")
@SP // 7245
AM=M+1 // 7246
A=A-1 // 7247
M=0 // 7248

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt22 // 7249
D=A // 7250
@13 // 7251
M=D // 7252
@SP // 7253
AM=M-1 // 7254
D=M // 7255
A=A-1 // 7256
D=M-D // 7257
@DO_LT // 7258
0;JMP // 7259
(COMPARE_Math.divide_lt22)
@SP // 7260
AM=M+1 // 7261
A=A-1 // 7262
M=D // 7263

////PushInstruction("argument 1")
@ARG // 7264
A=M+1 // 7265
D=M // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270

////PushInstruction("constant 0")
@SP // 7271
AM=M+1 // 7272
A=A-1 // 7273
M=0 // 7274

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt23 // 7275
D=A // 7276
@13 // 7277
M=D // 7278
@SP // 7279
AM=M-1 // 7280
D=M // 7281
A=A-1 // 7282
D=M-D // 7283
@DO_LT // 7284
0;JMP // 7285
(COMPARE_Math.divide_lt23)
@SP // 7286
AM=M+1 // 7287
A=A-1 // 7288
M=D // 7289

////ArithmeticInstruction{AND}
@SP // 7290
AM=M-1 // 7291
D=M // 7292
A=A-1 // 7293
M=D&M // 7294

////PushInstruction("constant 0")
@SP // 7295
AM=M+1 // 7296
A=A-1 // 7297
M=0 // 7298

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq24 // 7299
D=A // 7300
@13 // 7301
M=D // 7302
@SP // 7303
AM=M-1 // 7304
D=M // 7305
A=A-1 // 7306
D=M-D // 7307
@DO_EQ // 7308
0;JMP // 7309
(COMPARE_Math.divide_eq24)
@SP // 7310
AM=M+1 // 7311
A=A-1 // 7312
M=D // 7313

////IfGotoInstruction{label='Math.divide.IfElse4}
// if-goto Math.divide.IfElse4
@SP // 7314
AM=M-1 // 7315
D=M // 7316
@Math.divide.IfElse4 // 7317
D;JNE // 7318

////PushInstruction("local 0")
@LCL // 7319
A=M // 7320
D=M // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=D // 7325

////ReturnInstruction{}
@RETURN // 7326
0;JMP // 7327

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 7328
0;JMP // 7329

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////PushInstruction("local 0")
@LCL // 7330
A=M // 7331
D=M // 7332
@SP // 7333
AM=M+1 // 7334
A=A-1 // 7335
M=D // 7336

////ArithmeticInstruction{NEG}
@SP // 7337
A=M-1 // 7338
M=-M // 7339

////ReturnInstruction{}
@RETURN // 7340
0;JMP // 7341

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 7342
0;JMP // 7343

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 7344
A=M // 7345
D=M // 7346
@SP // 7347
AM=M+1 // 7348
A=A-1 // 7349
M=D // 7350

////PushInstruction("argument 1")
@ARG // 7351
A=M+1 // 7352
D=M // 7353
@SP // 7354
AM=M+1 // 7355
A=A-1 // 7356
M=D // 7357

////PushInstruction("argument 1")
@ARG // 7358
A=M+1 // 7359
D=M // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364

////ArithmeticInstruction{ADD}
@SP // 7365
AM=M-1 // 7366
D=M // 7367
A=A-1 // 7368
M=D+M // 7369

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 7370
D=A // 7371
@14 // 7372
M=D // 7373
@Math.divide // 7374
D=A // 7375
@13 // 7376
M=D // 7377
@Math.divide.ret.3 // 7378
D=A // 7379
@CALL // 7380
0;JMP // 7381
(Math.divide.ret.3)

////PopInstruction{address=local 0}
@SP // 7382
AM=M-1 // 7383
D=M // 7384
@LCL // 7385
A=M // 7386
M=D // 7387

////PushInstruction("argument 0")
@ARG // 7388
A=M // 7389
D=M // 7390
@SP // 7391
AM=M+1 // 7392
A=A-1 // 7393
M=D // 7394

////PushInstruction("local 0")
@LCL // 7395
A=M // 7396
D=M // 7397
@SP // 7398
AM=M+1 // 7399
A=A-1 // 7400
M=D // 7401

////PushInstruction("local 0")
@LCL // 7402
A=M // 7403
D=M // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408

////ArithmeticInstruction{ADD}
@SP // 7409
AM=M-1 // 7410
D=M // 7411
A=A-1 // 7412
M=D+M // 7413

////PushInstruction("argument 1")
@ARG // 7414
A=M+1 // 7415
D=M // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=D // 7420

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.multiply
@7 // 7421
D=A // 7422
@14 // 7423
M=D // 7424
@Math.multiply // 7425
D=A // 7426
@13 // 7427
M=D // 7428
@Math.divide.ret.4 // 7429
D=A // 7430
@CALL // 7431
0;JMP // 7432
(Math.divide.ret.4)

////ArithmeticInstruction{SUB}
@SP // 7433
AM=M-1 // 7434
D=M // 7435
A=A-1 // 7436
M=M-D // 7437

////PushInstruction("argument 1")
@ARG // 7438
A=M+1 // 7439
D=M // 7440
@SP // 7441
AM=M+1 // 7442
A=A-1 // 7443
M=D // 7444

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt25 // 7445
D=A // 7446
@13 // 7447
M=D // 7448
@SP // 7449
AM=M-1 // 7450
D=M // 7451
A=A-1 // 7452
D=M-D // 7453
@DO_LT // 7454
0;JMP // 7455
(COMPARE_Math.divide_lt25)
@SP // 7456
AM=M+1 // 7457
A=A-1 // 7458
M=D // 7459

////PushInstruction("constant 0")
@SP // 7460
AM=M+1 // 7461
A=A-1 // 7462
M=0 // 7463

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq26 // 7464
D=A // 7465
@13 // 7466
M=D // 7467
@SP // 7468
AM=M-1 // 7469
D=M // 7470
A=A-1 // 7471
D=M-D // 7472
@DO_EQ // 7473
0;JMP // 7474
(COMPARE_Math.divide_eq26)
@SP // 7475
AM=M+1 // 7476
A=A-1 // 7477
M=D // 7478

////IfGotoInstruction{label='Math.divide.IfElse5}
// if-goto Math.divide.IfElse5
@SP // 7479
AM=M-1 // 7480
D=M // 7481
@Math.divide.IfElse5 // 7482
D;JNE // 7483

////PushInstruction("local 0")
@LCL // 7484
A=M // 7485
D=M // 7486
@SP // 7487
AM=M+1 // 7488
A=A-1 // 7489
M=D // 7490

////PushInstruction("local 0")
@LCL // 7491
A=M // 7492
D=M // 7493
@SP // 7494
AM=M+1 // 7495
A=A-1 // 7496
M=D // 7497

////ArithmeticInstruction{ADD}
@SP // 7498
AM=M-1 // 7499
D=M // 7500
A=A-1 // 7501
M=D+M // 7502

////ReturnInstruction{}
@RETURN // 7503
0;JMP // 7504

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 7505
0;JMP // 7506

////LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)

////LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)

////PushInstruction("local 0")
@LCL // 7507
A=M // 7508
D=M // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=D // 7513

////PushInstruction("local 0")
@LCL // 7514
A=M // 7515
D=M // 7516
@SP // 7517
AM=M+1 // 7518
A=A-1 // 7519
M=D // 7520

////ArithmeticInstruction{ADD}
@SP // 7521
AM=M-1 // 7522
D=M // 7523
A=A-1 // 7524
M=D+M // 7525

////PushInstruction("constant 1")
@SP // 7526
AM=M+1 // 7527
A=A-1 // 7528
M=1 // 7529

////ArithmeticInstruction{ADD}
@SP // 7530
AM=M-1 // 7531
D=M // 7532
A=A-1 // 7533
M=D+M // 7534

////ReturnInstruction{}
@RETURN // 7535
0;JMP // 7536

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=5, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////PushInstruction("argument 0")
@ARG // 7537
A=M // 7538
D=M // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543

////PushInstruction("argument 0")
@ARG // 7544
A=M // 7545
D=M // 7546
@SP // 7547
AM=M+1 // 7548
A=A-1 // 7549
M=D // 7550

////PushInstruction("argument 1")
@ARG // 7551
A=M+1 // 7552
D=M // 7553
@SP // 7554
AM=M+1 // 7555
A=A-1 // 7556
M=D // 7557

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=5, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.divide
@7 // 7558
D=A // 7559
@14 // 7560
M=D // 7561
@Math.divide // 7562
D=A // 7563
@13 // 7564
M=D // 7565
@Math.mod.ret.0 // 7566
D=A // 7567
@CALL // 7568
0;JMP // 7569
(Math.mod.ret.0)

////PushInstruction("argument 1")
@ARG // 7570
A=M+1 // 7571
D=M // 7572
@SP // 7573
AM=M+1 // 7574
A=A-1 // 7575
M=D // 7576

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.multiply
@7 // 7577
D=A // 7578
@14 // 7579
M=D // 7580
@Math.multiply // 7581
D=A // 7582
@13 // 7583
M=D // 7584
@Math.mod.ret.1 // 7585
D=A // 7586
@CALL // 7587
0;JMP // 7588
(Math.mod.ret.1)

////ArithmeticInstruction{SUB}
@SP // 7589
AM=M-1 // 7590
D=M // 7591
A=A-1 // 7592
M=M-D // 7593

////ReturnInstruction{}
@RETURN // 7594
0;JMP // 7595

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////PushInstruction("static 0")
@Math.0 // 7596
D=M // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601

////PushInstruction("argument 0")
@ARG // 7602
A=M // 7603
D=M // 7604
@SP // 7605
AM=M+1 // 7606
A=A-1 // 7607
M=D // 7608

////ArithmeticInstruction{ADD}
@SP // 7609
AM=M-1 // 7610
D=M // 7611
A=A-1 // 7612
M=D+M // 7613

////PopInstruction{address=pointer 1}
@SP // 7614
AM=M-1 // 7615
D=M // 7616
@4 // 7617
M=D // 7618

////PushInstruction("that 0")
@THAT // 7619
A=M // 7620
D=M // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=D // 7625

////ReturnInstruction{}
@RETURN // 7626
0;JMP // 7627

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 7628
AM=M+1 // 7629
A=A-1 // 7630
M=0 // 7631
@SP // 7632
AM=M+1 // 7633
A=A-1 // 7634
M=0 // 7635
@SP // 7636
AM=M+1 // 7637
A=A-1 // 7638
M=0 // 7639
@SP // 7640
AM=M+1 // 7641
A=A-1 // 7642
M=0 // 7643

////PushInstruction("constant 0")
@SP // 7644
AM=M+1 // 7645
A=A-1 // 7646
M=0 // 7647

////PopInstruction{address=local 0}
@SP // 7648
AM=M-1 // 7649
D=M // 7650
@LCL // 7651
A=M // 7652
M=D // 7653

////PushInstruction("constant 7")
@7 // 7654
D=A // 7655
@SP // 7656
AM=M+1 // 7657
A=A-1 // 7658
M=D // 7659

////PopInstruction{address=local 1}
@SP // 7660
AM=M-1 // 7661
D=M // 7662
@LCL // 7663
A=M+1 // 7664
M=D // 7665

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////PushInstruction("local 1")
@LCL // 7666
A=M+1 // 7667
D=M // 7668
@SP // 7669
AM=M+1 // 7670
A=A-1 // 7671
M=D // 7672

////PushInstruction("constant 0")
@SP // 7673
AM=M+1 // 7674
A=A-1 // 7675
M=0 // 7676

////ArithmeticInstruction{LT}
@COMPARE_Math.sqrt_lt27 // 7677
D=A // 7678
@13 // 7679
M=D // 7680
@SP // 7681
AM=M-1 // 7682
D=M // 7683
A=A-1 // 7684
D=M-D // 7685
@DO_LT // 7686
0;JMP // 7687
(COMPARE_Math.sqrt_lt27)
@SP // 7688
AM=M+1 // 7689
A=A-1 // 7690
M=D // 7691

////ArithmeticInstruction{NOT}
@SP // 7692
A=M-1 // 7693
M=!M // 7694

////PushInstruction("constant 0")
@SP // 7695
AM=M+1 // 7696
A=A-1 // 7697
M=0 // 7698

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq28 // 7699
D=A // 7700
@13 // 7701
M=D // 7702
@SP // 7703
AM=M-1 // 7704
D=M // 7705
A=A-1 // 7706
D=M-D // 7707
@DO_EQ // 7708
0;JMP // 7709
(COMPARE_Math.sqrt_eq28)
@SP // 7710
AM=M+1 // 7711
A=A-1 // 7712
M=D // 7713

////IfGotoInstruction{label='WHILE_END_Math.sqrt1}
// if-goto WHILE_END_Math.sqrt1
@SP // 7714
AM=M-1 // 7715
D=M // 7716
@WHILE_END_Math.sqrt1 // 7717
D;JNE // 7718

////PushInstruction("local 0")
@LCL // 7719
A=M // 7720
D=M // 7721
@SP // 7722
AM=M+1 // 7723
A=A-1 // 7724
M=D // 7725

////PushInstruction("static 0")
@Math.0 // 7726
D=M // 7727
@SP // 7728
AM=M+1 // 7729
A=A-1 // 7730
M=D // 7731

////PushInstruction("local 1")
@LCL // 7732
A=M+1 // 7733
D=M // 7734
@SP // 7735
AM=M+1 // 7736
A=A-1 // 7737
M=D // 7738

////ArithmeticInstruction{ADD}
@SP // 7739
AM=M-1 // 7740
D=M // 7741
A=A-1 // 7742
M=D+M // 7743

////PopInstruction{address=pointer 1}
@SP // 7744
AM=M-1 // 7745
D=M // 7746
@4 // 7747
M=D // 7748

////PushInstruction("that 0")
@THAT // 7749
A=M // 7750
D=M // 7751
@SP // 7752
AM=M+1 // 7753
A=A-1 // 7754
M=D // 7755

////ArithmeticInstruction{ADD}
@SP // 7756
AM=M-1 // 7757
D=M // 7758
A=A-1 // 7759
M=D+M // 7760

////PopInstruction{address=local 2}
@SP // 7761
AM=M-1 // 7762
D=M // 7763
@LCL // 7764
A=M+1 // 7765
A=A+1 // 7766
M=D // 7767

////PushInstruction("local 2")
@LCL // 7768
A=M+1 // 7769
A=A+1 // 7770
D=M // 7771
@SP // 7772
AM=M+1 // 7773
A=A-1 // 7774
M=D // 7775

////PushInstruction("local 2")
@LCL // 7776
A=M+1 // 7777
A=A+1 // 7778
D=M // 7779
@SP // 7780
AM=M+1 // 7781
A=A-1 // 7782
M=D // 7783

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}
// call Math.multiply
@7 // 7784
D=A // 7785
@14 // 7786
M=D // 7787
@Math.multiply // 7788
D=A // 7789
@13 // 7790
M=D // 7791
@Math.sqrt.ret.0 // 7792
D=A // 7793
@CALL // 7794
0;JMP // 7795
(Math.sqrt.ret.0)

////PopInstruction{address=local 3}
@SP // 7796
AM=M-1 // 7797
D=M // 7798
@LCL // 7799
A=M+1 // 7800
A=A+1 // 7801
A=A+1 // 7802
M=D // 7803

////PushInstruction("local 3")
@LCL // 7804
A=M+1 // 7805
A=A+1 // 7806
A=A+1 // 7807
D=M // 7808
@SP // 7809
AM=M+1 // 7810
A=A-1 // 7811
M=D // 7812

////PushInstruction("argument 0")
@ARG // 7813
A=M // 7814
D=M // 7815
@SP // 7816
AM=M+1 // 7817
A=A-1 // 7818
M=D // 7819

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt29 // 7820
D=A // 7821
@13 // 7822
M=D // 7823
@SP // 7824
AM=M-1 // 7825
D=M // 7826
A=A-1 // 7827
D=M-D // 7828
@DO_GT // 7829
0;JMP // 7830
(COMPARE_Math.sqrt_gt29)
@SP // 7831
AM=M+1 // 7832
A=A-1 // 7833
M=D // 7834

////ArithmeticInstruction{NOT}
@SP // 7835
A=M-1 // 7836
M=!M // 7837

////PushInstruction("local 3")
@LCL // 7838
A=M+1 // 7839
A=A+1 // 7840
A=A+1 // 7841
D=M // 7842
@SP // 7843
AM=M+1 // 7844
A=A-1 // 7845
M=D // 7846

////PushInstruction("constant 0")
@SP // 7847
AM=M+1 // 7848
A=A-1 // 7849
M=0 // 7850

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt30 // 7851
D=A // 7852
@13 // 7853
M=D // 7854
@SP // 7855
AM=M-1 // 7856
D=M // 7857
A=A-1 // 7858
D=M-D // 7859
@DO_GT // 7860
0;JMP // 7861
(COMPARE_Math.sqrt_gt30)
@SP // 7862
AM=M+1 // 7863
A=A-1 // 7864
M=D // 7865

////ArithmeticInstruction{AND}
@SP // 7866
AM=M-1 // 7867
D=M // 7868
A=A-1 // 7869
M=D&M // 7870

////PushInstruction("constant 0")
@SP // 7871
AM=M+1 // 7872
A=A-1 // 7873
M=0 // 7874

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq31 // 7875
D=A // 7876
@13 // 7877
M=D // 7878
@SP // 7879
AM=M-1 // 7880
D=M // 7881
A=A-1 // 7882
D=M-D // 7883
@DO_EQ // 7884
0;JMP // 7885
(COMPARE_Math.sqrt_eq31)
@SP // 7886
AM=M+1 // 7887
A=A-1 // 7888
M=D // 7889

////IfGotoInstruction{label='Math.sqrt.IfElse1}
// if-goto Math.sqrt.IfElse1
@SP // 7890
AM=M-1 // 7891
D=M // 7892
@Math.sqrt.IfElse1 // 7893
D;JNE // 7894

////PushInstruction("local 2")
@LCL // 7895
A=M+1 // 7896
A=A+1 // 7897
D=M // 7898
@SP // 7899
AM=M+1 // 7900
A=A-1 // 7901
M=D // 7902

////PopInstruction{address=local 0}
@SP // 7903
AM=M-1 // 7904
D=M // 7905
@LCL // 7906
A=M // 7907
M=D // 7908

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 7909
0;JMP // 7910

////LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)

////LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)

////PushInstruction("local 1")
@LCL // 7911
A=M+1 // 7912
D=M // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=D // 7917

////PushInstruction("constant 1")
@SP // 7918
AM=M+1 // 7919
A=A-1 // 7920
M=1 // 7921

////ArithmeticInstruction{SUB}
@SP // 7922
AM=M-1 // 7923
D=M // 7924
A=A-1 // 7925
M=M-D // 7926

////PopInstruction{address=local 1}
@SP // 7927
AM=M-1 // 7928
D=M // 7929
@LCL // 7930
A=M+1 // 7931
M=D // 7932

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 7933
0;JMP // 7934

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 7935
A=M // 7936
D=M // 7937
@SP // 7938
AM=M+1 // 7939
A=A-1 // 7940
M=D // 7941

////ReturnInstruction{}
@RETURN // 7942
0;JMP // 7943

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////PushInstruction("argument 0")
@ARG // 7944
A=M // 7945
D=M // 7946
@SP // 7947
AM=M+1 // 7948
A=A-1 // 7949
M=D // 7950

////PushInstruction("argument 1")
@ARG // 7951
A=M+1 // 7952
D=M // 7953
@SP // 7954
AM=M+1 // 7955
A=A-1 // 7956
M=D // 7957

////ArithmeticInstruction{GT}
@COMPARE_Math.max_gt32 // 7958
D=A // 7959
@13 // 7960
M=D // 7961
@SP // 7962
AM=M-1 // 7963
D=M // 7964
A=A-1 // 7965
D=M-D // 7966
@DO_GT // 7967
0;JMP // 7968
(COMPARE_Math.max_gt32)
@SP // 7969
AM=M+1 // 7970
A=A-1 // 7971
M=D // 7972

////PushInstruction("constant 0")
@SP // 7973
AM=M+1 // 7974
A=A-1 // 7975
M=0 // 7976

////ArithmeticInstruction{EQ}
@COMPARE_Math.max_eq33 // 7977
D=A // 7978
@13 // 7979
M=D // 7980
@SP // 7981
AM=M-1 // 7982
D=M // 7983
A=A-1 // 7984
D=M-D // 7985
@DO_EQ // 7986
0;JMP // 7987
(COMPARE_Math.max_eq33)
@SP // 7988
AM=M+1 // 7989
A=A-1 // 7990
M=D // 7991

////IfGotoInstruction{label='Math.max.IfElse1}
// if-goto Math.max.IfElse1
@SP // 7992
AM=M-1 // 7993
D=M // 7994
@Math.max.IfElse1 // 7995
D;JNE // 7996

////PushInstruction("argument 0")
@ARG // 7997
A=M // 7998
D=M // 7999
@SP // 8000
AM=M+1 // 8001
A=A-1 // 8002
M=D // 8003

////ReturnInstruction{}
@RETURN // 8004
0;JMP // 8005

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 8006
0;JMP // 8007

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 8008
A=M+1 // 8009
D=M // 8010
@SP // 8011
AM=M+1 // 8012
A=A-1 // 8013
M=D // 8014

////ReturnInstruction{}
@RETURN // 8015
0;JMP // 8016

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////PushInstruction("argument 0")
@ARG // 8017
A=M // 8018
D=M // 8019
@SP // 8020
AM=M+1 // 8021
A=A-1 // 8022
M=D // 8023

////PushInstruction("argument 1")
@ARG // 8024
A=M+1 // 8025
D=M // 8026
@SP // 8027
AM=M+1 // 8028
A=A-1 // 8029
M=D // 8030

////ArithmeticInstruction{LT}
@COMPARE_Math.min_lt34 // 8031
D=A // 8032
@13 // 8033
M=D // 8034
@SP // 8035
AM=M-1 // 8036
D=M // 8037
A=A-1 // 8038
D=M-D // 8039
@DO_LT // 8040
0;JMP // 8041
(COMPARE_Math.min_lt34)
@SP // 8042
AM=M+1 // 8043
A=A-1 // 8044
M=D // 8045

////PushInstruction("constant 0")
@SP // 8046
AM=M+1 // 8047
A=A-1 // 8048
M=0 // 8049

////ArithmeticInstruction{EQ}
@COMPARE_Math.min_eq35 // 8050
D=A // 8051
@13 // 8052
M=D // 8053
@SP // 8054
AM=M-1 // 8055
D=M // 8056
A=A-1 // 8057
D=M-D // 8058
@DO_EQ // 8059
0;JMP // 8060
(COMPARE_Math.min_eq35)
@SP // 8061
AM=M+1 // 8062
A=A-1 // 8063
M=D // 8064

////IfGotoInstruction{label='Math.min.IfElse1}
// if-goto Math.min.IfElse1
@SP // 8065
AM=M-1 // 8066
D=M // 8067
@Math.min.IfElse1 // 8068
D;JNE // 8069

////PushInstruction("argument 0")
@ARG // 8070
A=M // 8071
D=M // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076

////ReturnInstruction{}
@RETURN // 8077
0;JMP // 8078

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 8079
0;JMP // 8080

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 8081
A=M+1 // 8082
D=M // 8083
@SP // 8084
AM=M+1 // 8085
A=A-1 // 8086
M=D // 8087

////ReturnInstruction{}
@RETURN // 8088
0;JMP // 8089

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////PushInstruction("argument 0")
@ARG // 8090
A=M // 8091
D=M // 8092
@SP // 8093
AM=M+1 // 8094
A=A-1 // 8095
M=D // 8096

////PushInstruction("argument 0")
@ARG // 8097
A=M // 8098
D=M // 8099
@SP // 8100
AM=M+1 // 8101
A=A-1 // 8102
M=D // 8103

////ArithmeticInstruction{NEG}
@SP // 8104
A=M-1 // 8105
M=-M // 8106

////CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.abs=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.abs'}
// call Math.max
@7 // 8107
D=A // 8108
@14 // 8109
M=D // 8110
@Math.max // 8111
D=A // 8112
@13 // 8113
M=D // 8114
@Math.abs.ret.0 // 8115
D=A // 8116
@CALL // 8117
0;JMP // 8118
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 8119
0;JMP // 8120

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}
// call Output.initMap
@5 // 8121
D=A // 8122
@14 // 8123
M=D // 8124
@Output.initMap // 8125
D=A // 8126
@13 // 8127
M=D // 8128
@Output.init.ret.0 // 8129
D=A // 8130
@CALL // 8131
0;JMP // 8132
(Output.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 8133
AM=M-1 // 8134
D=M // 8135
@5 // 8136
M=D // 8137

////PushInstruction("constant 0")
@SP // 8138
AM=M+1 // 8139
A=A-1 // 8140
M=0 // 8141

////PopInstruction{address=Output.1}
@SP // 8142
AM=M-1 // 8143
D=M // 8144
@Output.1 // 8145
M=D // 8146

////PushInstruction("constant 0")
@SP // 8147
AM=M+1 // 8148
A=A-1 // 8149
M=0 // 8150

////PopInstruction{address=Output.2}
@SP // 8151
AM=M-1 // 8152
D=M // 8153
@Output.2 // 8154
M=D // 8155

////PushInstruction("constant 0")
@SP // 8156
AM=M+1 // 8157
A=A-1 // 8158
M=0 // 8159

////ReturnInstruction{}
@RETURN // 8160
0;JMP // 8161

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 8162
AM=M+1 // 8163
A=A-1 // 8164
M=0 // 8165

////PushInstruction("constant 127")
@127 // 8166
D=A // 8167
@SP // 8168
AM=M+1 // 8169
A=A-1 // 8170
M=D // 8171

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}
// call Array.new
@6 // 8172
D=A // 8173
@14 // 8174
M=D // 8175
@Array.new // 8176
D=A // 8177
@13 // 8178
M=D // 8179
@Output.initMap.ret.0 // 8180
D=A // 8181
@CALL // 8182
0;JMP // 8183
(Output.initMap.ret.0)

////PopInstruction{address=Output.0}
@SP // 8184
AM=M-1 // 8185
D=M // 8186
@Output.0 // 8187
M=D // 8188

////PushInstruction("constant 0")
@SP // 8189
AM=M+1 // 8190
A=A-1 // 8191
M=0 // 8192

////PushInstruction("constant 63")
@63 // 8193
D=A // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=D // 8198

////PushInstruction("constant 63")
@63 // 8199
D=A // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204

////PushInstruction("constant 63")
@63 // 8205
D=A // 8206
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=D // 8210

////PushInstruction("constant 63")
@63 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216

////PushInstruction("constant 63")
@63 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222

////PushInstruction("constant 63")
@63 // 8223
D=A // 8224
@SP // 8225
AM=M+1 // 8226
A=A-1 // 8227
M=D // 8228

////PushInstruction("constant 63")
@63 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234

////PushInstruction("constant 63")
@63 // 8235
D=A // 8236
@SP // 8237
AM=M+1 // 8238
A=A-1 // 8239
M=D // 8240

////PushInstruction("constant 63")
@63 // 8241
D=A // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=D // 8246

////PushInstruction("constant 0")
@SP // 8247
AM=M+1 // 8248
A=A-1 // 8249
M=0 // 8250

////PushInstruction("constant 0")
@SP // 8251
AM=M+1 // 8252
A=A-1 // 8253
M=0 // 8254

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=1}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8255
D=A // 8256
@14 // 8257
M=D // 8258
@Output.create // 8259
D=A // 8260
@13 // 8261
M=D // 8262
@Output.initMap.ret.1 // 8263
D=A // 8264
@CALL // 8265
0;JMP // 8266
(Output.initMap.ret.1)

////PopInstruction{address=temp 0}
@SP // 8267
AM=M-1 // 8268
D=M // 8269
@5 // 8270
M=D // 8271

////PushInstruction("constant 32")
@32 // 8272
D=A // 8273
@SP // 8274
AM=M+1 // 8275
A=A-1 // 8276
M=D // 8277

////PushInstruction("constant 0")
@SP // 8278
AM=M+1 // 8279
A=A-1 // 8280
M=0 // 8281

////PushInstruction("constant 0")
@SP // 8282
AM=M+1 // 8283
A=A-1 // 8284
M=0 // 8285

////PushInstruction("constant 0")
@SP // 8286
AM=M+1 // 8287
A=A-1 // 8288
M=0 // 8289

////PushInstruction("constant 0")
@SP // 8290
AM=M+1 // 8291
A=A-1 // 8292
M=0 // 8293

////PushInstruction("constant 0")
@SP // 8294
AM=M+1 // 8295
A=A-1 // 8296
M=0 // 8297

////PushInstruction("constant 0")
@SP // 8298
AM=M+1 // 8299
A=A-1 // 8300
M=0 // 8301

////PushInstruction("constant 0")
@SP // 8302
AM=M+1 // 8303
A=A-1 // 8304
M=0 // 8305

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

////PushInstruction("constant 0")
@SP // 8314
AM=M+1 // 8315
A=A-1 // 8316
M=0 // 8317

////PushInstruction("constant 0")
@SP // 8318
AM=M+1 // 8319
A=A-1 // 8320
M=0 // 8321

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=2}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8322
D=A // 8323
@14 // 8324
M=D // 8325
@Output.create // 8326
D=A // 8327
@13 // 8328
M=D // 8329
@Output.initMap.ret.2 // 8330
D=A // 8331
@CALL // 8332
0;JMP // 8333
(Output.initMap.ret.2)

////PopInstruction{address=temp 0}
@SP // 8334
AM=M-1 // 8335
D=M // 8336
@5 // 8337
M=D // 8338

////PushInstruction("constant 33")
@33 // 8339
D=A // 8340
@SP // 8341
AM=M+1 // 8342
A=A-1 // 8343
M=D // 8344

////PushInstruction("constant 12")
@12 // 8345
D=A // 8346
@SP // 8347
AM=M+1 // 8348
A=A-1 // 8349
M=D // 8350

////PushInstruction("constant 30")
@30 // 8351
D=A // 8352
@SP // 8353
AM=M+1 // 8354
A=A-1 // 8355
M=D // 8356

////PushInstruction("constant 30")
@30 // 8357
D=A // 8358
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=D // 8362

////PushInstruction("constant 30")
@30 // 8363
D=A // 8364
@SP // 8365
AM=M+1 // 8366
A=A-1 // 8367
M=D // 8368

////PushInstruction("constant 12")
@12 // 8369
D=A // 8370
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=D // 8374

////PushInstruction("constant 12")
@12 // 8375
D=A // 8376
@SP // 8377
AM=M+1 // 8378
A=A-1 // 8379
M=D // 8380

////PushInstruction("constant 0")
@SP // 8381
AM=M+1 // 8382
A=A-1 // 8383
M=0 // 8384

////PushInstruction("constant 12")
@12 // 8385
D=A // 8386
@SP // 8387
AM=M+1 // 8388
A=A-1 // 8389
M=D // 8390

////PushInstruction("constant 12")
@12 // 8391
D=A // 8392
@SP // 8393
AM=M+1 // 8394
A=A-1 // 8395
M=D // 8396

////PushInstruction("constant 0")
@SP // 8397
AM=M+1 // 8398
A=A-1 // 8399
M=0 // 8400

////PushInstruction("constant 0")
@SP // 8401
AM=M+1 // 8402
A=A-1 // 8403
M=0 // 8404

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=3}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8405
D=A // 8406
@14 // 8407
M=D // 8408
@Output.create // 8409
D=A // 8410
@13 // 8411
M=D // 8412
@Output.initMap.ret.3 // 8413
D=A // 8414
@CALL // 8415
0;JMP // 8416
(Output.initMap.ret.3)

////PopInstruction{address=temp 0}
@SP // 8417
AM=M-1 // 8418
D=M // 8419
@5 // 8420
M=D // 8421

////PushInstruction("constant 34")
@34 // 8422
D=A // 8423
@SP // 8424
AM=M+1 // 8425
A=A-1 // 8426
M=D // 8427

////PushInstruction("constant 54")
@54 // 8428
D=A // 8429
@SP // 8430
AM=M+1 // 8431
A=A-1 // 8432
M=D // 8433

////PushInstruction("constant 54")
@54 // 8434
D=A // 8435
@SP // 8436
AM=M+1 // 8437
A=A-1 // 8438
M=D // 8439

////PushInstruction("constant 20")
@20 // 8440
D=A // 8441
@SP // 8442
AM=M+1 // 8443
A=A-1 // 8444
M=D // 8445

////PushInstruction("constant 0")
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=0 // 8449

////PushInstruction("constant 0")
@SP // 8450
AM=M+1 // 8451
A=A-1 // 8452
M=0 // 8453

////PushInstruction("constant 0")
@SP // 8454
AM=M+1 // 8455
A=A-1 // 8456
M=0 // 8457

////PushInstruction("constant 0")
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=0 // 8461

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

////PushInstruction("constant 0")
@SP // 8470
AM=M+1 // 8471
A=A-1 // 8472
M=0 // 8473

////PushInstruction("constant 0")
@SP // 8474
AM=M+1 // 8475
A=A-1 // 8476
M=0 // 8477

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=4}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8478
D=A // 8479
@14 // 8480
M=D // 8481
@Output.create // 8482
D=A // 8483
@13 // 8484
M=D // 8485
@Output.initMap.ret.4 // 8486
D=A // 8487
@CALL // 8488
0;JMP // 8489
(Output.initMap.ret.4)

////PopInstruction{address=temp 0}
@SP // 8490
AM=M-1 // 8491
D=M // 8492
@5 // 8493
M=D // 8494

////PushInstruction("constant 35")
@35 // 8495
D=A // 8496
@SP // 8497
AM=M+1 // 8498
A=A-1 // 8499
M=D // 8500

////PushInstruction("constant 0")
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=0 // 8504

////PushInstruction("constant 18")
@18 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510

////PushInstruction("constant 18")
@18 // 8511
D=A // 8512
@SP // 8513
AM=M+1 // 8514
A=A-1 // 8515
M=D // 8516

////PushInstruction("constant 63")
@63 // 8517
D=A // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=D // 8522

////PushInstruction("constant 18")
@18 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528

////PushInstruction("constant 18")
@18 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534

////PushInstruction("constant 63")
@63 // 8535
D=A // 8536
@SP // 8537
AM=M+1 // 8538
A=A-1 // 8539
M=D // 8540

////PushInstruction("constant 18")
@18 // 8541
D=A // 8542
@SP // 8543
AM=M+1 // 8544
A=A-1 // 8545
M=D // 8546

////PushInstruction("constant 18")
@18 // 8547
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

////PushInstruction("constant 0")
@SP // 8557
AM=M+1 // 8558
A=A-1 // 8559
M=0 // 8560

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=5}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8561
D=A // 8562
@14 // 8563
M=D // 8564
@Output.create // 8565
D=A // 8566
@13 // 8567
M=D // 8568
@Output.initMap.ret.5 // 8569
D=A // 8570
@CALL // 8571
0;JMP // 8572
(Output.initMap.ret.5)

////PopInstruction{address=temp 0}
@SP // 8573
AM=M-1 // 8574
D=M // 8575
@5 // 8576
M=D // 8577

////PushInstruction("constant 36")
@36 // 8578
D=A // 8579
@SP // 8580
AM=M+1 // 8581
A=A-1 // 8582
M=D // 8583

////PushInstruction("constant 12")
@12 // 8584
D=A // 8585
@SP // 8586
AM=M+1 // 8587
A=A-1 // 8588
M=D // 8589

////PushInstruction("constant 30")
@30 // 8590
D=A // 8591
@SP // 8592
AM=M+1 // 8593
A=A-1 // 8594
M=D // 8595

////PushInstruction("constant 51")
@51 // 8596
D=A // 8597
@SP // 8598
AM=M+1 // 8599
A=A-1 // 8600
M=D // 8601

////PushInstruction("constant 3")
@3 // 8602
D=A // 8603
@SP // 8604
AM=M+1 // 8605
A=A-1 // 8606
M=D // 8607

////PushInstruction("constant 30")
@30 // 8608
D=A // 8609
@SP // 8610
AM=M+1 // 8611
A=A-1 // 8612
M=D // 8613

////PushInstruction("constant 48")
@48 // 8614
D=A // 8615
@SP // 8616
AM=M+1 // 8617
A=A-1 // 8618
M=D // 8619

////PushInstruction("constant 51")
@51 // 8620
D=A // 8621
@SP // 8622
AM=M+1 // 8623
A=A-1 // 8624
M=D // 8625

////PushInstruction("constant 30")
@30 // 8626
D=A // 8627
@SP // 8628
AM=M+1 // 8629
A=A-1 // 8630
M=D // 8631

////PushInstruction("constant 12")
@12 // 8632
D=A // 8633
@SP // 8634
AM=M+1 // 8635
A=A-1 // 8636
M=D // 8637

////PushInstruction("constant 12")
@12 // 8638
D=A // 8639
@SP // 8640
AM=M+1 // 8641
A=A-1 // 8642
M=D // 8643

////PushInstruction("constant 0")
@SP // 8644
AM=M+1 // 8645
A=A-1 // 8646
M=0 // 8647

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=6}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8648
D=A // 8649
@14 // 8650
M=D // 8651
@Output.create // 8652
D=A // 8653
@13 // 8654
M=D // 8655
@Output.initMap.ret.6 // 8656
D=A // 8657
@CALL // 8658
0;JMP // 8659
(Output.initMap.ret.6)

////PopInstruction{address=temp 0}
@SP // 8660
AM=M-1 // 8661
D=M // 8662
@5 // 8663
M=D // 8664

////PushInstruction("constant 37")
@37 // 8665
D=A // 8666
@SP // 8667
AM=M+1 // 8668
A=A-1 // 8669
M=D // 8670

////PushInstruction("constant 0")
@SP // 8671
AM=M+1 // 8672
A=A-1 // 8673
M=0 // 8674

////PushInstruction("constant 0")
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=0 // 8678

////PushInstruction("constant 35")
@35 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684

////PushInstruction("constant 51")
@51 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690

////PushInstruction("constant 24")
@24 // 8691
D=A // 8692
@SP // 8693
AM=M+1 // 8694
A=A-1 // 8695
M=D // 8696

////PushInstruction("constant 12")
@12 // 8697
D=A // 8698
@SP // 8699
AM=M+1 // 8700
A=A-1 // 8701
M=D // 8702

////PushInstruction("constant 6")
@6 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708

////PushInstruction("constant 51")
@51 // 8709
D=A // 8710
@SP // 8711
AM=M+1 // 8712
A=A-1 // 8713
M=D // 8714

////PushInstruction("constant 49")
@49 // 8715
D=A // 8716
@SP // 8717
AM=M+1 // 8718
A=A-1 // 8719
M=D // 8720

////PushInstruction("constant 0")
@SP // 8721
AM=M+1 // 8722
A=A-1 // 8723
M=0 // 8724

////PushInstruction("constant 0")
@SP // 8725
AM=M+1 // 8726
A=A-1 // 8727
M=0 // 8728

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=7}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8729
D=A // 8730
@14 // 8731
M=D // 8732
@Output.create // 8733
D=A // 8734
@13 // 8735
M=D // 8736
@Output.initMap.ret.7 // 8737
D=A // 8738
@CALL // 8739
0;JMP // 8740
(Output.initMap.ret.7)

////PopInstruction{address=temp 0}
@SP // 8741
AM=M-1 // 8742
D=M // 8743
@5 // 8744
M=D // 8745

////PushInstruction("constant 38")
@38 // 8746
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

////PushInstruction("constant 30")
@30 // 8758
D=A // 8759
@SP // 8760
AM=M+1 // 8761
A=A-1 // 8762
M=D // 8763

////PushInstruction("constant 30")
@30 // 8764
D=A // 8765
@SP // 8766
AM=M+1 // 8767
A=A-1 // 8768
M=D // 8769

////PushInstruction("constant 12")
@12 // 8770
D=A // 8771
@SP // 8772
AM=M+1 // 8773
A=A-1 // 8774
M=D // 8775

////PushInstruction("constant 54")
@54 // 8776
D=A // 8777
@SP // 8778
AM=M+1 // 8779
A=A-1 // 8780
M=D // 8781

////PushInstruction("constant 27")
@27 // 8782
D=A // 8783
@SP // 8784
AM=M+1 // 8785
A=A-1 // 8786
M=D // 8787

////PushInstruction("constant 27")
@27 // 8788
D=A // 8789
@SP // 8790
AM=M+1 // 8791
A=A-1 // 8792
M=D // 8793

////PushInstruction("constant 27")
@27 // 8794
D=A // 8795
@SP // 8796
AM=M+1 // 8797
A=A-1 // 8798
M=D // 8799

////PushInstruction("constant 54")
@54 // 8800
D=A // 8801
@SP // 8802
AM=M+1 // 8803
A=A-1 // 8804
M=D // 8805

////PushInstruction("constant 0")
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=0 // 8809

////PushInstruction("constant 0")
@SP // 8810
AM=M+1 // 8811
A=A-1 // 8812
M=0 // 8813

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=8}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8814
D=A // 8815
@14 // 8816
M=D // 8817
@Output.create // 8818
D=A // 8819
@13 // 8820
M=D // 8821
@Output.initMap.ret.8 // 8822
D=A // 8823
@CALL // 8824
0;JMP // 8825
(Output.initMap.ret.8)

////PopInstruction{address=temp 0}
@SP // 8826
AM=M-1 // 8827
D=M // 8828
@5 // 8829
M=D // 8830

////PushInstruction("constant 39")
@39 // 8831
D=A // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=D // 8836

////PushInstruction("constant 12")
@12 // 8837
D=A // 8838
@SP // 8839
AM=M+1 // 8840
A=A-1 // 8841
M=D // 8842

////PushInstruction("constant 12")
@12 // 8843
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

////PushInstruction("constant 0")
@SP // 8855
AM=M+1 // 8856
A=A-1 // 8857
M=0 // 8858

////PushInstruction("constant 0")
@SP // 8859
AM=M+1 // 8860
A=A-1 // 8861
M=0 // 8862

////PushInstruction("constant 0")
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=0 // 8866

////PushInstruction("constant 0")
@SP // 8867
AM=M+1 // 8868
A=A-1 // 8869
M=0 // 8870

////PushInstruction("constant 0")
@SP // 8871
AM=M+1 // 8872
A=A-1 // 8873
M=0 // 8874

////PushInstruction("constant 0")
@SP // 8875
AM=M+1 // 8876
A=A-1 // 8877
M=0 // 8878

////PushInstruction("constant 0")
@SP // 8879
AM=M+1 // 8880
A=A-1 // 8881
M=0 // 8882

////PushInstruction("constant 0")
@SP // 8883
AM=M+1 // 8884
A=A-1 // 8885
M=0 // 8886

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=9}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8887
D=A // 8888
@14 // 8889
M=D // 8890
@Output.create // 8891
D=A // 8892
@13 // 8893
M=D // 8894
@Output.initMap.ret.9 // 8895
D=A // 8896
@CALL // 8897
0;JMP // 8898
(Output.initMap.ret.9)

////PopInstruction{address=temp 0}
@SP // 8899
AM=M-1 // 8900
D=M // 8901
@5 // 8902
M=D // 8903

////PushInstruction("constant 40")
@40 // 8904
D=A // 8905
@SP // 8906
AM=M+1 // 8907
A=A-1 // 8908
M=D // 8909

////PushInstruction("constant 24")
@24 // 8910
D=A // 8911
@SP // 8912
AM=M+1 // 8913
A=A-1 // 8914
M=D // 8915

////PushInstruction("constant 12")
@12 // 8916
D=A // 8917
@SP // 8918
AM=M+1 // 8919
A=A-1 // 8920
M=D // 8921

////PushInstruction("constant 6")
@6 // 8922
D=A // 8923
@SP // 8924
AM=M+1 // 8925
A=A-1 // 8926
M=D // 8927

////PushInstruction("constant 6")
@6 // 8928
D=A // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=D // 8933

////PushInstruction("constant 6")
@6 // 8934
D=A // 8935
@SP // 8936
AM=M+1 // 8937
A=A-1 // 8938
M=D // 8939

////PushInstruction("constant 6")
@6 // 8940
D=A // 8941
@SP // 8942
AM=M+1 // 8943
A=A-1 // 8944
M=D // 8945

////PushInstruction("constant 6")
@6 // 8946
D=A // 8947
@SP // 8948
AM=M+1 // 8949
A=A-1 // 8950
M=D // 8951

////PushInstruction("constant 12")
@12 // 8952
D=A // 8953
@SP // 8954
AM=M+1 // 8955
A=A-1 // 8956
M=D // 8957

////PushInstruction("constant 24")
@24 // 8958
D=A // 8959
@SP // 8960
AM=M+1 // 8961
A=A-1 // 8962
M=D // 8963

////PushInstruction("constant 0")
@SP // 8964
AM=M+1 // 8965
A=A-1 // 8966
M=0 // 8967

////PushInstruction("constant 0")
@SP // 8968
AM=M+1 // 8969
A=A-1 // 8970
M=0 // 8971

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=10}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8972
D=A // 8973
@14 // 8974
M=D // 8975
@Output.create // 8976
D=A // 8977
@13 // 8978
M=D // 8979
@Output.initMap.ret.10 // 8980
D=A // 8981
@CALL // 8982
0;JMP // 8983
(Output.initMap.ret.10)

////PopInstruction{address=temp 0}
@SP // 8984
AM=M-1 // 8985
D=M // 8986
@5 // 8987
M=D // 8988

////PushInstruction("constant 41")
@41 // 8989
D=A // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=D // 8994

////PushInstruction("constant 6")
@6 // 8995
D=A // 8996
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=D // 9000

////PushInstruction("constant 12")
@12 // 9001
D=A // 9002
@SP // 9003
AM=M+1 // 9004
A=A-1 // 9005
M=D // 9006

////PushInstruction("constant 24")
@24 // 9007
D=A // 9008
@SP // 9009
AM=M+1 // 9010
A=A-1 // 9011
M=D // 9012

////PushInstruction("constant 24")
@24 // 9013
D=A // 9014
@SP // 9015
AM=M+1 // 9016
A=A-1 // 9017
M=D // 9018

////PushInstruction("constant 24")
@24 // 9019
D=A // 9020
@SP // 9021
AM=M+1 // 9022
A=A-1 // 9023
M=D // 9024

////PushInstruction("constant 24")
@24 // 9025
D=A // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=D // 9030

////PushInstruction("constant 24")
@24 // 9031
D=A // 9032
@SP // 9033
AM=M+1 // 9034
A=A-1 // 9035
M=D // 9036

////PushInstruction("constant 12")
@12 // 9037
D=A // 9038
@SP // 9039
AM=M+1 // 9040
A=A-1 // 9041
M=D // 9042

////PushInstruction("constant 6")
@6 // 9043
D=A // 9044
@SP // 9045
AM=M+1 // 9046
A=A-1 // 9047
M=D // 9048

////PushInstruction("constant 0")
@SP // 9049
AM=M+1 // 9050
A=A-1 // 9051
M=0 // 9052

////PushInstruction("constant 0")
@SP // 9053
AM=M+1 // 9054
A=A-1 // 9055
M=0 // 9056

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=11}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9057
D=A // 9058
@14 // 9059
M=D // 9060
@Output.create // 9061
D=A // 9062
@13 // 9063
M=D // 9064
@Output.initMap.ret.11 // 9065
D=A // 9066
@CALL // 9067
0;JMP // 9068
(Output.initMap.ret.11)

////PopInstruction{address=temp 0}
@SP // 9069
AM=M-1 // 9070
D=M // 9071
@5 // 9072
M=D // 9073

////PushInstruction("constant 42")
@42 // 9074
D=A // 9075
@SP // 9076
AM=M+1 // 9077
A=A-1 // 9078
M=D // 9079

////PushInstruction("constant 0")
@SP // 9080
AM=M+1 // 9081
A=A-1 // 9082
M=0 // 9083

////PushInstruction("constant 0")
@SP // 9084
AM=M+1 // 9085
A=A-1 // 9086
M=0 // 9087

////PushInstruction("constant 0")
@SP // 9088
AM=M+1 // 9089
A=A-1 // 9090
M=0 // 9091

////PushInstruction("constant 51")
@51 // 9092
D=A // 9093
@SP // 9094
AM=M+1 // 9095
A=A-1 // 9096
M=D // 9097

////PushInstruction("constant 30")
@30 // 9098
D=A // 9099
@SP // 9100
AM=M+1 // 9101
A=A-1 // 9102
M=D // 9103

////PushInstruction("constant 63")
@63 // 9104
D=A // 9105
@SP // 9106
AM=M+1 // 9107
A=A-1 // 9108
M=D // 9109

////PushInstruction("constant 30")
@30 // 9110
D=A // 9111
@SP // 9112
AM=M+1 // 9113
A=A-1 // 9114
M=D // 9115

////PushInstruction("constant 51")
@51 // 9116
D=A // 9117
@SP // 9118
AM=M+1 // 9119
A=A-1 // 9120
M=D // 9121

////PushInstruction("constant 0")
@SP // 9122
AM=M+1 // 9123
A=A-1 // 9124
M=0 // 9125

////PushInstruction("constant 0")
@SP // 9126
AM=M+1 // 9127
A=A-1 // 9128
M=0 // 9129

////PushInstruction("constant 0")
@SP // 9130
AM=M+1 // 9131
A=A-1 // 9132
M=0 // 9133

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=12}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9134
D=A // 9135
@14 // 9136
M=D // 9137
@Output.create // 9138
D=A // 9139
@13 // 9140
M=D // 9141
@Output.initMap.ret.12 // 9142
D=A // 9143
@CALL // 9144
0;JMP // 9145
(Output.initMap.ret.12)

////PopInstruction{address=temp 0}
@SP // 9146
AM=M-1 // 9147
D=M // 9148
@5 // 9149
M=D // 9150

////PushInstruction("constant 43")
@43 // 9151
D=A // 9152
@SP // 9153
AM=M+1 // 9154
A=A-1 // 9155
M=D // 9156

////PushInstruction("constant 0")
@SP // 9157
AM=M+1 // 9158
A=A-1 // 9159
M=0 // 9160

////PushInstruction("constant 0")
@SP // 9161
AM=M+1 // 9162
A=A-1 // 9163
M=0 // 9164

////PushInstruction("constant 0")
@SP // 9165
AM=M+1 // 9166
A=A-1 // 9167
M=0 // 9168

////PushInstruction("constant 12")
@12 // 9169
D=A // 9170
@SP // 9171
AM=M+1 // 9172
A=A-1 // 9173
M=D // 9174

////PushInstruction("constant 12")
@12 // 9175
D=A // 9176
@SP // 9177
AM=M+1 // 9178
A=A-1 // 9179
M=D // 9180

////PushInstruction("constant 63")
@63 // 9181
D=A // 9182
@SP // 9183
AM=M+1 // 9184
A=A-1 // 9185
M=D // 9186

////PushInstruction("constant 12")
@12 // 9187
D=A // 9188
@SP // 9189
AM=M+1 // 9190
A=A-1 // 9191
M=D // 9192

////PushInstruction("constant 12")
@12 // 9193
D=A // 9194
@SP // 9195
AM=M+1 // 9196
A=A-1 // 9197
M=D // 9198

////PushInstruction("constant 0")
@SP // 9199
AM=M+1 // 9200
A=A-1 // 9201
M=0 // 9202

////PushInstruction("constant 0")
@SP // 9203
AM=M+1 // 9204
A=A-1 // 9205
M=0 // 9206

////PushInstruction("constant 0")
@SP // 9207
AM=M+1 // 9208
A=A-1 // 9209
M=0 // 9210

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=13}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9211
D=A // 9212
@14 // 9213
M=D // 9214
@Output.create // 9215
D=A // 9216
@13 // 9217
M=D // 9218
@Output.initMap.ret.13 // 9219
D=A // 9220
@CALL // 9221
0;JMP // 9222
(Output.initMap.ret.13)

////PopInstruction{address=temp 0}
@SP // 9223
AM=M-1 // 9224
D=M // 9225
@5 // 9226
M=D // 9227

////PushInstruction("constant 44")
@44 // 9228
D=A // 9229
@SP // 9230
AM=M+1 // 9231
A=A-1 // 9232
M=D // 9233

////PushInstruction("constant 0")
@SP // 9234
AM=M+1 // 9235
A=A-1 // 9236
M=0 // 9237

////PushInstruction("constant 0")
@SP // 9238
AM=M+1 // 9239
A=A-1 // 9240
M=0 // 9241

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

////PushInstruction("constant 12")
@12 // 9262
D=A // 9263
@SP // 9264
AM=M+1 // 9265
A=A-1 // 9266
M=D // 9267

////PushInstruction("constant 12")
@12 // 9268
D=A // 9269
@SP // 9270
AM=M+1 // 9271
A=A-1 // 9272
M=D // 9273

////PushInstruction("constant 6")
@6 // 9274
D=A // 9275
@SP // 9276
AM=M+1 // 9277
A=A-1 // 9278
M=D // 9279

////PushInstruction("constant 0")
@SP // 9280
AM=M+1 // 9281
A=A-1 // 9282
M=0 // 9283

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=14}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9284
D=A // 9285
@14 // 9286
M=D // 9287
@Output.create // 9288
D=A // 9289
@13 // 9290
M=D // 9291
@Output.initMap.ret.14 // 9292
D=A // 9293
@CALL // 9294
0;JMP // 9295
(Output.initMap.ret.14)

////PopInstruction{address=temp 0}
@SP // 9296
AM=M-1 // 9297
D=M // 9298
@5 // 9299
M=D // 9300

////PushInstruction("constant 45")
@45 // 9301
D=A // 9302
@SP // 9303
AM=M+1 // 9304
A=A-1 // 9305
M=D // 9306

////PushInstruction("constant 0")
@SP // 9307
AM=M+1 // 9308
A=A-1 // 9309
M=0 // 9310

////PushInstruction("constant 0")
@SP // 9311
AM=M+1 // 9312
A=A-1 // 9313
M=0 // 9314

////PushInstruction("constant 0")
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=0 // 9318

////PushInstruction("constant 0")
@SP // 9319
AM=M+1 // 9320
A=A-1 // 9321
M=0 // 9322

////PushInstruction("constant 0")
@SP // 9323
AM=M+1 // 9324
A=A-1 // 9325
M=0 // 9326

////PushInstruction("constant 63")
@63 // 9327
D=A // 9328
@SP // 9329
AM=M+1 // 9330
A=A-1 // 9331
M=D // 9332

////PushInstruction("constant 0")
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=0 // 9336

////PushInstruction("constant 0")
@SP // 9337
AM=M+1 // 9338
A=A-1 // 9339
M=0 // 9340

////PushInstruction("constant 0")
@SP // 9341
AM=M+1 // 9342
A=A-1 // 9343
M=0 // 9344

////PushInstruction("constant 0")
@SP // 9345
AM=M+1 // 9346
A=A-1 // 9347
M=0 // 9348

////PushInstruction("constant 0")
@SP // 9349
AM=M+1 // 9350
A=A-1 // 9351
M=0 // 9352

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=15}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9353
D=A // 9354
@14 // 9355
M=D // 9356
@Output.create // 9357
D=A // 9358
@13 // 9359
M=D // 9360
@Output.initMap.ret.15 // 9361
D=A // 9362
@CALL // 9363
0;JMP // 9364
(Output.initMap.ret.15)

////PopInstruction{address=temp 0}
@SP // 9365
AM=M-1 // 9366
D=M // 9367
@5 // 9368
M=D // 9369

////PushInstruction("constant 46")
@46 // 9370
D=A // 9371
@SP // 9372
AM=M+1 // 9373
A=A-1 // 9374
M=D // 9375

////PushInstruction("constant 0")
@SP // 9376
AM=M+1 // 9377
A=A-1 // 9378
M=0 // 9379

////PushInstruction("constant 0")
@SP // 9380
AM=M+1 // 9381
A=A-1 // 9382
M=0 // 9383

////PushInstruction("constant 0")
@SP // 9384
AM=M+1 // 9385
A=A-1 // 9386
M=0 // 9387

////PushInstruction("constant 0")
@SP // 9388
AM=M+1 // 9389
A=A-1 // 9390
M=0 // 9391

////PushInstruction("constant 0")
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=0 // 9395

////PushInstruction("constant 0")
@SP // 9396
AM=M+1 // 9397
A=A-1 // 9398
M=0 // 9399

////PushInstruction("constant 0")
@SP // 9400
AM=M+1 // 9401
A=A-1 // 9402
M=0 // 9403

////PushInstruction("constant 12")
@12 // 9404
D=A // 9405
@SP // 9406
AM=M+1 // 9407
A=A-1 // 9408
M=D // 9409

////PushInstruction("constant 12")
@12 // 9410
D=A // 9411
@SP // 9412
AM=M+1 // 9413
A=A-1 // 9414
M=D // 9415

////PushInstruction("constant 0")
@SP // 9416
AM=M+1 // 9417
A=A-1 // 9418
M=0 // 9419

////PushInstruction("constant 0")
@SP // 9420
AM=M+1 // 9421
A=A-1 // 9422
M=0 // 9423

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=16}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9424
D=A // 9425
@14 // 9426
M=D // 9427
@Output.create // 9428
D=A // 9429
@13 // 9430
M=D // 9431
@Output.initMap.ret.16 // 9432
D=A // 9433
@CALL // 9434
0;JMP // 9435
(Output.initMap.ret.16)

////PopInstruction{address=temp 0}
@SP // 9436
AM=M-1 // 9437
D=M // 9438
@5 // 9439
M=D // 9440

////PushInstruction("constant 47")
@47 // 9441
D=A // 9442
@SP // 9443
AM=M+1 // 9444
A=A-1 // 9445
M=D // 9446

////PushInstruction("constant 0")
@SP // 9447
AM=M+1 // 9448
A=A-1 // 9449
M=0 // 9450

////PushInstruction("constant 0")
@SP // 9451
AM=M+1 // 9452
A=A-1 // 9453
M=0 // 9454

////PushInstruction("constant 32")
@32 // 9455
D=A // 9456
@SP // 9457
AM=M+1 // 9458
A=A-1 // 9459
M=D // 9460

////PushInstruction("constant 48")
@48 // 9461
D=A // 9462
@SP // 9463
AM=M+1 // 9464
A=A-1 // 9465
M=D // 9466

////PushInstruction("constant 24")
@24 // 9467
D=A // 9468
@SP // 9469
AM=M+1 // 9470
A=A-1 // 9471
M=D // 9472

////PushInstruction("constant 12")
@12 // 9473
D=A // 9474
@SP // 9475
AM=M+1 // 9476
A=A-1 // 9477
M=D // 9478

////PushInstruction("constant 6")
@6 // 9479
D=A // 9480
@SP // 9481
AM=M+1 // 9482
A=A-1 // 9483
M=D // 9484

////PushInstruction("constant 3")
@3 // 9485
D=A // 9486
@SP // 9487
AM=M+1 // 9488
A=A-1 // 9489
M=D // 9490

////PushInstruction("constant 1")
@SP // 9491
AM=M+1 // 9492
A=A-1 // 9493
M=1 // 9494

////PushInstruction("constant 0")
@SP // 9495
AM=M+1 // 9496
A=A-1 // 9497
M=0 // 9498

////PushInstruction("constant 0")
@SP // 9499
AM=M+1 // 9500
A=A-1 // 9501
M=0 // 9502

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=17}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9503
D=A // 9504
@14 // 9505
M=D // 9506
@Output.create // 9507
D=A // 9508
@13 // 9509
M=D // 9510
@Output.initMap.ret.17 // 9511
D=A // 9512
@CALL // 9513
0;JMP // 9514
(Output.initMap.ret.17)

////PopInstruction{address=temp 0}
@SP // 9515
AM=M-1 // 9516
D=M // 9517
@5 // 9518
M=D // 9519

////PushInstruction("constant 48")
@48 // 9520
D=A // 9521
@SP // 9522
AM=M+1 // 9523
A=A-1 // 9524
M=D // 9525

////PushInstruction("constant 12")
@12 // 9526
D=A // 9527
@SP // 9528
AM=M+1 // 9529
A=A-1 // 9530
M=D // 9531

////PushInstruction("constant 30")
@30 // 9532
D=A // 9533
@SP // 9534
AM=M+1 // 9535
A=A-1 // 9536
M=D // 9537

////PushInstruction("constant 51")
@51 // 9538
D=A // 9539
@SP // 9540
AM=M+1 // 9541
A=A-1 // 9542
M=D // 9543

////PushInstruction("constant 51")
@51 // 9544
D=A // 9545
@SP // 9546
AM=M+1 // 9547
A=A-1 // 9548
M=D // 9549

////PushInstruction("constant 51")
@51 // 9550
D=A // 9551
@SP // 9552
AM=M+1 // 9553
A=A-1 // 9554
M=D // 9555

////PushInstruction("constant 51")
@51 // 9556
D=A // 9557
@SP // 9558
AM=M+1 // 9559
A=A-1 // 9560
M=D // 9561

////PushInstruction("constant 51")
@51 // 9562
D=A // 9563
@SP // 9564
AM=M+1 // 9565
A=A-1 // 9566
M=D // 9567

////PushInstruction("constant 30")
@30 // 9568
D=A // 9569
@SP // 9570
AM=M+1 // 9571
A=A-1 // 9572
M=D // 9573

////PushInstruction("constant 12")
@12 // 9574
D=A // 9575
@SP // 9576
AM=M+1 // 9577
A=A-1 // 9578
M=D // 9579

////PushInstruction("constant 0")
@SP // 9580
AM=M+1 // 9581
A=A-1 // 9582
M=0 // 9583

////PushInstruction("constant 0")
@SP // 9584
AM=M+1 // 9585
A=A-1 // 9586
M=0 // 9587

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=18}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9588
D=A // 9589
@14 // 9590
M=D // 9591
@Output.create // 9592
D=A // 9593
@13 // 9594
M=D // 9595
@Output.initMap.ret.18 // 9596
D=A // 9597
@CALL // 9598
0;JMP // 9599
(Output.initMap.ret.18)

////PopInstruction{address=temp 0}
@SP // 9600
AM=M-1 // 9601
D=M // 9602
@5 // 9603
M=D // 9604

////PushInstruction("constant 49")
@49 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610

////PushInstruction("constant 12")
@12 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616

////PushInstruction("constant 14")
@14 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622

////PushInstruction("constant 15")
@15 // 9623
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

////PushInstruction("constant 12")
@12 // 9635
D=A // 9636
@SP // 9637
AM=M+1 // 9638
A=A-1 // 9639
M=D // 9640

////PushInstruction("constant 12")
@12 // 9641
D=A // 9642
@SP // 9643
AM=M+1 // 9644
A=A-1 // 9645
M=D // 9646

////PushInstruction("constant 12")
@12 // 9647
D=A // 9648
@SP // 9649
AM=M+1 // 9650
A=A-1 // 9651
M=D // 9652

////PushInstruction("constant 12")
@12 // 9653
D=A // 9654
@SP // 9655
AM=M+1 // 9656
A=A-1 // 9657
M=D // 9658

////PushInstruction("constant 63")
@63 // 9659
D=A // 9660
@SP // 9661
AM=M+1 // 9662
A=A-1 // 9663
M=D // 9664

////PushInstruction("constant 0")
@SP // 9665
AM=M+1 // 9666
A=A-1 // 9667
M=0 // 9668

////PushInstruction("constant 0")
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=0 // 9672

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=19}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9673
D=A // 9674
@14 // 9675
M=D // 9676
@Output.create // 9677
D=A // 9678
@13 // 9679
M=D // 9680
@Output.initMap.ret.19 // 9681
D=A // 9682
@CALL // 9683
0;JMP // 9684
(Output.initMap.ret.19)

////PopInstruction{address=temp 0}
@SP // 9685
AM=M-1 // 9686
D=M // 9687
@5 // 9688
M=D // 9689

////PushInstruction("constant 50")
@50 // 9690
D=A // 9691
@SP // 9692
AM=M+1 // 9693
A=A-1 // 9694
M=D // 9695

////PushInstruction("constant 30")
@30 // 9696
D=A // 9697
@SP // 9698
AM=M+1 // 9699
A=A-1 // 9700
M=D // 9701

////PushInstruction("constant 51")
@51 // 9702
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

////PushInstruction("constant 24")
@24 // 9714
D=A // 9715
@SP // 9716
AM=M+1 // 9717
A=A-1 // 9718
M=D // 9719

////PushInstruction("constant 12")
@12 // 9720
D=A // 9721
@SP // 9722
AM=M+1 // 9723
A=A-1 // 9724
M=D // 9725

////PushInstruction("constant 6")
@6 // 9726
D=A // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=D // 9731

////PushInstruction("constant 3")
@3 // 9732
D=A // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=D // 9737

////PushInstruction("constant 51")
@51 // 9738
D=A // 9739
@SP // 9740
AM=M+1 // 9741
A=A-1 // 9742
M=D // 9743

////PushInstruction("constant 63")
@63 // 9744
D=A // 9745
@SP // 9746
AM=M+1 // 9747
A=A-1 // 9748
M=D // 9749

////PushInstruction("constant 0")
@SP // 9750
AM=M+1 // 9751
A=A-1 // 9752
M=0 // 9753

////PushInstruction("constant 0")
@SP // 9754
AM=M+1 // 9755
A=A-1 // 9756
M=0 // 9757

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=20}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9758
D=A // 9759
@14 // 9760
M=D // 9761
@Output.create // 9762
D=A // 9763
@13 // 9764
M=D // 9765
@Output.initMap.ret.20 // 9766
D=A // 9767
@CALL // 9768
0;JMP // 9769
(Output.initMap.ret.20)

////PopInstruction{address=temp 0}
@SP // 9770
AM=M-1 // 9771
D=M // 9772
@5 // 9773
M=D // 9774

////PushInstruction("constant 51")
@51 // 9775
D=A // 9776
@SP // 9777
AM=M+1 // 9778
A=A-1 // 9779
M=D // 9780

////PushInstruction("constant 30")
@30 // 9781
D=A // 9782
@SP // 9783
AM=M+1 // 9784
A=A-1 // 9785
M=D // 9786

////PushInstruction("constant 51")
@51 // 9787
D=A // 9788
@SP // 9789
AM=M+1 // 9790
A=A-1 // 9791
M=D // 9792

////PushInstruction("constant 48")
@48 // 9793
D=A // 9794
@SP // 9795
AM=M+1 // 9796
A=A-1 // 9797
M=D // 9798

////PushInstruction("constant 48")
@48 // 9799
D=A // 9800
@SP // 9801
AM=M+1 // 9802
A=A-1 // 9803
M=D // 9804

////PushInstruction("constant 28")
@28 // 9805
D=A // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=D // 9810

////PushInstruction("constant 48")
@48 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816

////PushInstruction("constant 48")
@48 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822

////PushInstruction("constant 51")
@51 // 9823
D=A // 9824
@SP // 9825
AM=M+1 // 9826
A=A-1 // 9827
M=D // 9828

////PushInstruction("constant 30")
@30 // 9829
D=A // 9830
@SP // 9831
AM=M+1 // 9832
A=A-1 // 9833
M=D // 9834

////PushInstruction("constant 0")
@SP // 9835
AM=M+1 // 9836
A=A-1 // 9837
M=0 // 9838

////PushInstruction("constant 0")
@SP // 9839
AM=M+1 // 9840
A=A-1 // 9841
M=0 // 9842

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=21}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9843
D=A // 9844
@14 // 9845
M=D // 9846
@Output.create // 9847
D=A // 9848
@13 // 9849
M=D // 9850
@Output.initMap.ret.21 // 9851
D=A // 9852
@CALL // 9853
0;JMP // 9854
(Output.initMap.ret.21)

////PopInstruction{address=temp 0}
@SP // 9855
AM=M-1 // 9856
D=M // 9857
@5 // 9858
M=D // 9859

////PushInstruction("constant 52")
@52 // 9860
D=A // 9861
@SP // 9862
AM=M+1 // 9863
A=A-1 // 9864
M=D // 9865

////PushInstruction("constant 16")
@16 // 9866
D=A // 9867
@SP // 9868
AM=M+1 // 9869
A=A-1 // 9870
M=D // 9871

////PushInstruction("constant 24")
@24 // 9872
D=A // 9873
@SP // 9874
AM=M+1 // 9875
A=A-1 // 9876
M=D // 9877

////PushInstruction("constant 28")
@28 // 9878
D=A // 9879
@SP // 9880
AM=M+1 // 9881
A=A-1 // 9882
M=D // 9883

////PushInstruction("constant 26")
@26 // 9884
D=A // 9885
@SP // 9886
AM=M+1 // 9887
A=A-1 // 9888
M=D // 9889

////PushInstruction("constant 25")
@25 // 9890
D=A // 9891
@SP // 9892
AM=M+1 // 9893
A=A-1 // 9894
M=D // 9895

////PushInstruction("constant 63")
@63 // 9896
D=A // 9897
@SP // 9898
AM=M+1 // 9899
A=A-1 // 9900
M=D // 9901

////PushInstruction("constant 24")
@24 // 9902
D=A // 9903
@SP // 9904
AM=M+1 // 9905
A=A-1 // 9906
M=D // 9907

////PushInstruction("constant 24")
@24 // 9908
D=A // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=D // 9913

////PushInstruction("constant 60")
@60 // 9914
D=A // 9915
@SP // 9916
AM=M+1 // 9917
A=A-1 // 9918
M=D // 9919

////PushInstruction("constant 0")
@SP // 9920
AM=M+1 // 9921
A=A-1 // 9922
M=0 // 9923

////PushInstruction("constant 0")
@SP // 9924
AM=M+1 // 9925
A=A-1 // 9926
M=0 // 9927

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=22}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9928
D=A // 9929
@14 // 9930
M=D // 9931
@Output.create // 9932
D=A // 9933
@13 // 9934
M=D // 9935
@Output.initMap.ret.22 // 9936
D=A // 9937
@CALL // 9938
0;JMP // 9939
(Output.initMap.ret.22)

////PopInstruction{address=temp 0}
@SP // 9940
AM=M-1 // 9941
D=M // 9942
@5 // 9943
M=D // 9944

////PushInstruction("constant 53")
@53 // 9945
D=A // 9946
@SP // 9947
AM=M+1 // 9948
A=A-1 // 9949
M=D // 9950

////PushInstruction("constant 63")
@63 // 9951
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

////PushInstruction("constant 48")
@48 // 9975
D=A // 9976
@SP // 9977
AM=M+1 // 9978
A=A-1 // 9979
M=D // 9980

////PushInstruction("constant 48")
@48 // 9981
D=A // 9982
@SP // 9983
AM=M+1 // 9984
A=A-1 // 9985
M=D // 9986

////PushInstruction("constant 48")
@48 // 9987
D=A // 9988
@SP // 9989
AM=M+1 // 9990
A=A-1 // 9991
M=D // 9992

////PushInstruction("constant 51")
@51 // 9993
D=A // 9994
@SP // 9995
AM=M+1 // 9996
A=A-1 // 9997
M=D // 9998

////PushInstruction("constant 30")
@30 // 9999
D=A // 10000
@SP // 10001
AM=M+1 // 10002
A=A-1 // 10003
M=D // 10004

////PushInstruction("constant 0")
@SP // 10005
AM=M+1 // 10006
A=A-1 // 10007
M=0 // 10008

////PushInstruction("constant 0")
@SP // 10009
AM=M+1 // 10010
A=A-1 // 10011
M=0 // 10012

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=23}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10013
D=A // 10014
@14 // 10015
M=D // 10016
@Output.create // 10017
D=A // 10018
@13 // 10019
M=D // 10020
@Output.initMap.ret.23 // 10021
D=A // 10022
@CALL // 10023
0;JMP // 10024
(Output.initMap.ret.23)

////PopInstruction{address=temp 0}
@SP // 10025
AM=M-1 // 10026
D=M // 10027
@5 // 10028
M=D // 10029

////PushInstruction("constant 54")
@54 // 10030
D=A // 10031
@SP // 10032
AM=M+1 // 10033
A=A-1 // 10034
M=D // 10035

////PushInstruction("constant 28")
@28 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041

////PushInstruction("constant 6")
@6 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047

////PushInstruction("constant 3")
@3 // 10048
D=A // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=D // 10053

////PushInstruction("constant 3")
@3 // 10054
D=A // 10055
@SP // 10056
AM=M+1 // 10057
A=A-1 // 10058
M=D // 10059

////PushInstruction("constant 31")
@31 // 10060
D=A // 10061
@SP // 10062
AM=M+1 // 10063
A=A-1 // 10064
M=D // 10065

////PushInstruction("constant 51")
@51 // 10066
D=A // 10067
@SP // 10068
AM=M+1 // 10069
A=A-1 // 10070
M=D // 10071

////PushInstruction("constant 51")
@51 // 10072
D=A // 10073
@SP // 10074
AM=M+1 // 10075
A=A-1 // 10076
M=D // 10077

////PushInstruction("constant 51")
@51 // 10078
D=A // 10079
@SP // 10080
AM=M+1 // 10081
A=A-1 // 10082
M=D // 10083

////PushInstruction("constant 30")
@30 // 10084
D=A // 10085
@SP // 10086
AM=M+1 // 10087
A=A-1 // 10088
M=D // 10089

////PushInstruction("constant 0")
@SP // 10090
AM=M+1 // 10091
A=A-1 // 10092
M=0 // 10093

////PushInstruction("constant 0")
@SP // 10094
AM=M+1 // 10095
A=A-1 // 10096
M=0 // 10097

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=24}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10098
D=A // 10099
@14 // 10100
M=D // 10101
@Output.create // 10102
D=A // 10103
@13 // 10104
M=D // 10105
@Output.initMap.ret.24 // 10106
D=A // 10107
@CALL // 10108
0;JMP // 10109
(Output.initMap.ret.24)

////PopInstruction{address=temp 0}
@SP // 10110
AM=M-1 // 10111
D=M // 10112
@5 // 10113
M=D // 10114

////PushInstruction("constant 55")
@55 // 10115
D=A // 10116
@SP // 10117
AM=M+1 // 10118
A=A-1 // 10119
M=D // 10120

////PushInstruction("constant 63")
@63 // 10121
D=A // 10122
@SP // 10123
AM=M+1 // 10124
A=A-1 // 10125
M=D // 10126

////PushInstruction("constant 49")
@49 // 10127
D=A // 10128
@SP // 10129
AM=M+1 // 10130
A=A-1 // 10131
M=D // 10132

////PushInstruction("constant 48")
@48 // 10133
D=A // 10134
@SP // 10135
AM=M+1 // 10136
A=A-1 // 10137
M=D // 10138

////PushInstruction("constant 48")
@48 // 10139
D=A // 10140
@SP // 10141
AM=M+1 // 10142
A=A-1 // 10143
M=D // 10144

////PushInstruction("constant 24")
@24 // 10145
D=A // 10146
@SP // 10147
AM=M+1 // 10148
A=A-1 // 10149
M=D // 10150

////PushInstruction("constant 12")
@12 // 10151
D=A // 10152
@SP // 10153
AM=M+1 // 10154
A=A-1 // 10155
M=D // 10156

////PushInstruction("constant 12")
@12 // 10157
D=A // 10158
@SP // 10159
AM=M+1 // 10160
A=A-1 // 10161
M=D // 10162

////PushInstruction("constant 12")
@12 // 10163
D=A // 10164
@SP // 10165
AM=M+1 // 10166
A=A-1 // 10167
M=D // 10168

////PushInstruction("constant 12")
@12 // 10169
D=A // 10170
@SP // 10171
AM=M+1 // 10172
A=A-1 // 10173
M=D // 10174

////PushInstruction("constant 0")
@SP // 10175
AM=M+1 // 10176
A=A-1 // 10177
M=0 // 10178

////PushInstruction("constant 0")
@SP // 10179
AM=M+1 // 10180
A=A-1 // 10181
M=0 // 10182

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=25}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10183
D=A // 10184
@14 // 10185
M=D // 10186
@Output.create // 10187
D=A // 10188
@13 // 10189
M=D // 10190
@Output.initMap.ret.25 // 10191
D=A // 10192
@CALL // 10193
0;JMP // 10194
(Output.initMap.ret.25)

////PopInstruction{address=temp 0}
@SP // 10195
AM=M-1 // 10196
D=M // 10197
@5 // 10198
M=D // 10199

////PushInstruction("constant 56")
@56 // 10200
D=A // 10201
@SP // 10202
AM=M+1 // 10203
A=A-1 // 10204
M=D // 10205

////PushInstruction("constant 30")
@30 // 10206
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

////PushInstruction("constant 51")
@51 // 10224
D=A // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=D // 10229

////PushInstruction("constant 30")
@30 // 10230
D=A // 10231
@SP // 10232
AM=M+1 // 10233
A=A-1 // 10234
M=D // 10235

////PushInstruction("constant 51")
@51 // 10236
D=A // 10237
@SP // 10238
AM=M+1 // 10239
A=A-1 // 10240
M=D // 10241

////PushInstruction("constant 51")
@51 // 10242
D=A // 10243
@SP // 10244
AM=M+1 // 10245
A=A-1 // 10246
M=D // 10247

////PushInstruction("constant 51")
@51 // 10248
D=A // 10249
@SP // 10250
AM=M+1 // 10251
A=A-1 // 10252
M=D // 10253

////PushInstruction("constant 30")
@30 // 10254
D=A // 10255
@SP // 10256
AM=M+1 // 10257
A=A-1 // 10258
M=D // 10259

////PushInstruction("constant 0")
@SP // 10260
AM=M+1 // 10261
A=A-1 // 10262
M=0 // 10263

////PushInstruction("constant 0")
@SP // 10264
AM=M+1 // 10265
A=A-1 // 10266
M=0 // 10267

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=26}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10268
D=A // 10269
@14 // 10270
M=D // 10271
@Output.create // 10272
D=A // 10273
@13 // 10274
M=D // 10275
@Output.initMap.ret.26 // 10276
D=A // 10277
@CALL // 10278
0;JMP // 10279
(Output.initMap.ret.26)

////PopInstruction{address=temp 0}
@SP // 10280
AM=M-1 // 10281
D=M // 10282
@5 // 10283
M=D // 10284

////PushInstruction("constant 57")
@57 // 10285
D=A // 10286
@SP // 10287
AM=M+1 // 10288
A=A-1 // 10289
M=D // 10290

////PushInstruction("constant 30")
@30 // 10291
D=A // 10292
@SP // 10293
AM=M+1 // 10294
A=A-1 // 10295
M=D // 10296

////PushInstruction("constant 51")
@51 // 10297
D=A // 10298
@SP // 10299
AM=M+1 // 10300
A=A-1 // 10301
M=D // 10302

////PushInstruction("constant 51")
@51 // 10303
D=A // 10304
@SP // 10305
AM=M+1 // 10306
A=A-1 // 10307
M=D // 10308

////PushInstruction("constant 51")
@51 // 10309
D=A // 10310
@SP // 10311
AM=M+1 // 10312
A=A-1 // 10313
M=D // 10314

////PushInstruction("constant 62")
@62 // 10315
D=A // 10316
@SP // 10317
AM=M+1 // 10318
A=A-1 // 10319
M=D // 10320

////PushInstruction("constant 48")
@48 // 10321
D=A // 10322
@SP // 10323
AM=M+1 // 10324
A=A-1 // 10325
M=D // 10326

////PushInstruction("constant 48")
@48 // 10327
D=A // 10328
@SP // 10329
AM=M+1 // 10330
A=A-1 // 10331
M=D // 10332

////PushInstruction("constant 24")
@24 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338

////PushInstruction("constant 14")
@14 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344

////PushInstruction("constant 0")
@SP // 10345
AM=M+1 // 10346
A=A-1 // 10347
M=0 // 10348

////PushInstruction("constant 0")
@SP // 10349
AM=M+1 // 10350
A=A-1 // 10351
M=0 // 10352

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=27}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10353
D=A // 10354
@14 // 10355
M=D // 10356
@Output.create // 10357
D=A // 10358
@13 // 10359
M=D // 10360
@Output.initMap.ret.27 // 10361
D=A // 10362
@CALL // 10363
0;JMP // 10364
(Output.initMap.ret.27)

////PopInstruction{address=temp 0}
@SP // 10365
AM=M-1 // 10366
D=M // 10367
@5 // 10368
M=D // 10369

////PushInstruction("constant 58")
@58 // 10370
D=A // 10371
@SP // 10372
AM=M+1 // 10373
A=A-1 // 10374
M=D // 10375

////PushInstruction("constant 0")
@SP // 10376
AM=M+1 // 10377
A=A-1 // 10378
M=0 // 10379

////PushInstruction("constant 0")
@SP // 10380
AM=M+1 // 10381
A=A-1 // 10382
M=0 // 10383

////PushInstruction("constant 12")
@12 // 10384
D=A // 10385
@SP // 10386
AM=M+1 // 10387
A=A-1 // 10388
M=D // 10389

////PushInstruction("constant 12")
@12 // 10390
D=A // 10391
@SP // 10392
AM=M+1 // 10393
A=A-1 // 10394
M=D // 10395

////PushInstruction("constant 0")
@SP // 10396
AM=M+1 // 10397
A=A-1 // 10398
M=0 // 10399

////PushInstruction("constant 0")
@SP // 10400
AM=M+1 // 10401
A=A-1 // 10402
M=0 // 10403

////PushInstruction("constant 12")
@12 // 10404
D=A // 10405
@SP // 10406
AM=M+1 // 10407
A=A-1 // 10408
M=D // 10409

////PushInstruction("constant 12")
@12 // 10410
D=A // 10411
@SP // 10412
AM=M+1 // 10413
A=A-1 // 10414
M=D // 10415

////PushInstruction("constant 0")
@SP // 10416
AM=M+1 // 10417
A=A-1 // 10418
M=0 // 10419

////PushInstruction("constant 0")
@SP // 10420
AM=M+1 // 10421
A=A-1 // 10422
M=0 // 10423

////PushInstruction("constant 0")
@SP // 10424
AM=M+1 // 10425
A=A-1 // 10426
M=0 // 10427

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=28}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10428
D=A // 10429
@14 // 10430
M=D // 10431
@Output.create // 10432
D=A // 10433
@13 // 10434
M=D // 10435
@Output.initMap.ret.28 // 10436
D=A // 10437
@CALL // 10438
0;JMP // 10439
(Output.initMap.ret.28)

////PopInstruction{address=temp 0}
@SP // 10440
AM=M-1 // 10441
D=M // 10442
@5 // 10443
M=D // 10444

////PushInstruction("constant 59")
@59 // 10445
D=A // 10446
@SP // 10447
AM=M+1 // 10448
A=A-1 // 10449
M=D // 10450

////PushInstruction("constant 0")
@SP // 10451
AM=M+1 // 10452
A=A-1 // 10453
M=0 // 10454

////PushInstruction("constant 0")
@SP // 10455
AM=M+1 // 10456
A=A-1 // 10457
M=0 // 10458

////PushInstruction("constant 12")
@12 // 10459
D=A // 10460
@SP // 10461
AM=M+1 // 10462
A=A-1 // 10463
M=D // 10464

////PushInstruction("constant 12")
@12 // 10465
D=A // 10466
@SP // 10467
AM=M+1 // 10468
A=A-1 // 10469
M=D // 10470

////PushInstruction("constant 0")
@SP // 10471
AM=M+1 // 10472
A=A-1 // 10473
M=0 // 10474

////PushInstruction("constant 0")
@SP // 10475
AM=M+1 // 10476
A=A-1 // 10477
M=0 // 10478

////PushInstruction("constant 12")
@12 // 10479
D=A // 10480
@SP // 10481
AM=M+1 // 10482
A=A-1 // 10483
M=D // 10484

////PushInstruction("constant 12")
@12 // 10485
D=A // 10486
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=D // 10490

////PushInstruction("constant 6")
@6 // 10491
D=A // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=D // 10496

////PushInstruction("constant 0")
@SP // 10497
AM=M+1 // 10498
A=A-1 // 10499
M=0 // 10500

////PushInstruction("constant 0")
@SP // 10501
AM=M+1 // 10502
A=A-1 // 10503
M=0 // 10504

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=29}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10505
D=A // 10506
@14 // 10507
M=D // 10508
@Output.create // 10509
D=A // 10510
@13 // 10511
M=D // 10512
@Output.initMap.ret.29 // 10513
D=A // 10514
@CALL // 10515
0;JMP // 10516
(Output.initMap.ret.29)

////PopInstruction{address=temp 0}
@SP // 10517
AM=M-1 // 10518
D=M // 10519
@5 // 10520
M=D // 10521

////PushInstruction("constant 60")
@60 // 10522
D=A // 10523
@SP // 10524
AM=M+1 // 10525
A=A-1 // 10526
M=D // 10527

////PushInstruction("constant 0")
@SP // 10528
AM=M+1 // 10529
A=A-1 // 10530
M=0 // 10531

////PushInstruction("constant 0")
@SP // 10532
AM=M+1 // 10533
A=A-1 // 10534
M=0 // 10535

////PushInstruction("constant 24")
@24 // 10536
D=A // 10537
@SP // 10538
AM=M+1 // 10539
A=A-1 // 10540
M=D // 10541

////PushInstruction("constant 12")
@12 // 10542
D=A // 10543
@SP // 10544
AM=M+1 // 10545
A=A-1 // 10546
M=D // 10547

////PushInstruction("constant 6")
@6 // 10548
D=A // 10549
@SP // 10550
AM=M+1 // 10551
A=A-1 // 10552
M=D // 10553

////PushInstruction("constant 3")
@3 // 10554
D=A // 10555
@SP // 10556
AM=M+1 // 10557
A=A-1 // 10558
M=D // 10559

////PushInstruction("constant 6")
@6 // 10560
D=A // 10561
@SP // 10562
AM=M+1 // 10563
A=A-1 // 10564
M=D // 10565

////PushInstruction("constant 12")
@12 // 10566
D=A // 10567
@SP // 10568
AM=M+1 // 10569
A=A-1 // 10570
M=D // 10571

////PushInstruction("constant 24")
@24 // 10572
D=A // 10573
@SP // 10574
AM=M+1 // 10575
A=A-1 // 10576
M=D // 10577

////PushInstruction("constant 0")
@SP // 10578
AM=M+1 // 10579
A=A-1 // 10580
M=0 // 10581

////PushInstruction("constant 0")
@SP // 10582
AM=M+1 // 10583
A=A-1 // 10584
M=0 // 10585

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=30}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10586
D=A // 10587
@14 // 10588
M=D // 10589
@Output.create // 10590
D=A // 10591
@13 // 10592
M=D // 10593
@Output.initMap.ret.30 // 10594
D=A // 10595
@CALL // 10596
0;JMP // 10597
(Output.initMap.ret.30)

////PopInstruction{address=temp 0}
@SP // 10598
AM=M-1 // 10599
D=M // 10600
@5 // 10601
M=D // 10602

////PushInstruction("constant 61")
@61 // 10603
D=A // 10604
@SP // 10605
AM=M+1 // 10606
A=A-1 // 10607
M=D // 10608

////PushInstruction("constant 0")
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=0 // 10612

////PushInstruction("constant 0")
@SP // 10613
AM=M+1 // 10614
A=A-1 // 10615
M=0 // 10616

////PushInstruction("constant 0")
@SP // 10617
AM=M+1 // 10618
A=A-1 // 10619
M=0 // 10620

////PushInstruction("constant 63")
@63 // 10621
D=A // 10622
@SP // 10623
AM=M+1 // 10624
A=A-1 // 10625
M=D // 10626

////PushInstruction("constant 0")
@SP // 10627
AM=M+1 // 10628
A=A-1 // 10629
M=0 // 10630

////PushInstruction("constant 0")
@SP // 10631
AM=M+1 // 10632
A=A-1 // 10633
M=0 // 10634

////PushInstruction("constant 63")
@63 // 10635
D=A // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=D // 10640

////PushInstruction("constant 0")
@SP // 10641
AM=M+1 // 10642
A=A-1 // 10643
M=0 // 10644

////PushInstruction("constant 0")
@SP // 10645
AM=M+1 // 10646
A=A-1 // 10647
M=0 // 10648

////PushInstruction("constant 0")
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=0 // 10652

////PushInstruction("constant 0")
@SP // 10653
AM=M+1 // 10654
A=A-1 // 10655
M=0 // 10656

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=31}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10657
D=A // 10658
@14 // 10659
M=D // 10660
@Output.create // 10661
D=A // 10662
@13 // 10663
M=D // 10664
@Output.initMap.ret.31 // 10665
D=A // 10666
@CALL // 10667
0;JMP // 10668
(Output.initMap.ret.31)

////PopInstruction{address=temp 0}
@SP // 10669
AM=M-1 // 10670
D=M // 10671
@5 // 10672
M=D // 10673

////PushInstruction("constant 62")
@62 // 10674
D=A // 10675
@SP // 10676
AM=M+1 // 10677
A=A-1 // 10678
M=D // 10679

////PushInstruction("constant 0")
@SP // 10680
AM=M+1 // 10681
A=A-1 // 10682
M=0 // 10683

////PushInstruction("constant 0")
@SP // 10684
AM=M+1 // 10685
A=A-1 // 10686
M=0 // 10687

////PushInstruction("constant 3")
@3 // 10688
D=A // 10689
@SP // 10690
AM=M+1 // 10691
A=A-1 // 10692
M=D // 10693

////PushInstruction("constant 6")
@6 // 10694
D=A // 10695
@SP // 10696
AM=M+1 // 10697
A=A-1 // 10698
M=D // 10699

////PushInstruction("constant 12")
@12 // 10700
D=A // 10701
@SP // 10702
AM=M+1 // 10703
A=A-1 // 10704
M=D // 10705

////PushInstruction("constant 24")
@24 // 10706
D=A // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=D // 10711

////PushInstruction("constant 12")
@12 // 10712
D=A // 10713
@SP // 10714
AM=M+1 // 10715
A=A-1 // 10716
M=D // 10717

////PushInstruction("constant 6")
@6 // 10718
D=A // 10719
@SP // 10720
AM=M+1 // 10721
A=A-1 // 10722
M=D // 10723

////PushInstruction("constant 3")
@3 // 10724
D=A // 10725
@SP // 10726
AM=M+1 // 10727
A=A-1 // 10728
M=D // 10729

////PushInstruction("constant 0")
@SP // 10730
AM=M+1 // 10731
A=A-1 // 10732
M=0 // 10733

////PushInstruction("constant 0")
@SP // 10734
AM=M+1 // 10735
A=A-1 // 10736
M=0 // 10737

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=32}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10738
D=A // 10739
@14 // 10740
M=D // 10741
@Output.create // 10742
D=A // 10743
@13 // 10744
M=D // 10745
@Output.initMap.ret.32 // 10746
D=A // 10747
@CALL // 10748
0;JMP // 10749
(Output.initMap.ret.32)

////PopInstruction{address=temp 0}
@SP // 10750
AM=M-1 // 10751
D=M // 10752
@5 // 10753
M=D // 10754

////PushInstruction("constant 64")
@64 // 10755
D=A // 10756
@SP // 10757
AM=M+1 // 10758
A=A-1 // 10759
M=D // 10760

////PushInstruction("constant 30")
@30 // 10761
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

////PushInstruction("constant 51")
@51 // 10773
D=A // 10774
@SP // 10775
AM=M+1 // 10776
A=A-1 // 10777
M=D // 10778

////PushInstruction("constant 59")
@59 // 10779
D=A // 10780
@SP // 10781
AM=M+1 // 10782
A=A-1 // 10783
M=D // 10784

////PushInstruction("constant 59")
@59 // 10785
D=A // 10786
@SP // 10787
AM=M+1 // 10788
A=A-1 // 10789
M=D // 10790

////PushInstruction("constant 59")
@59 // 10791
D=A // 10792
@SP // 10793
AM=M+1 // 10794
A=A-1 // 10795
M=D // 10796

////PushInstruction("constant 27")
@27 // 10797
D=A // 10798
@SP // 10799
AM=M+1 // 10800
A=A-1 // 10801
M=D // 10802

////PushInstruction("constant 3")
@3 // 10803
D=A // 10804
@SP // 10805
AM=M+1 // 10806
A=A-1 // 10807
M=D // 10808

////PushInstruction("constant 30")
@30 // 10809
D=A // 10810
@SP // 10811
AM=M+1 // 10812
A=A-1 // 10813
M=D // 10814

////PushInstruction("constant 0")
@SP // 10815
AM=M+1 // 10816
A=A-1 // 10817
M=0 // 10818

////PushInstruction("constant 0")
@SP // 10819
AM=M+1 // 10820
A=A-1 // 10821
M=0 // 10822

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=33}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10823
D=A // 10824
@14 // 10825
M=D // 10826
@Output.create // 10827
D=A // 10828
@13 // 10829
M=D // 10830
@Output.initMap.ret.33 // 10831
D=A // 10832
@CALL // 10833
0;JMP // 10834
(Output.initMap.ret.33)

////PopInstruction{address=temp 0}
@SP // 10835
AM=M-1 // 10836
D=M // 10837
@5 // 10838
M=D // 10839

////PushInstruction("constant 63")
@63 // 10840
D=A // 10841
@SP // 10842
AM=M+1 // 10843
A=A-1 // 10844
M=D // 10845

////PushInstruction("constant 30")
@30 // 10846
D=A // 10847
@SP // 10848
AM=M+1 // 10849
A=A-1 // 10850
M=D // 10851

////PushInstruction("constant 51")
@51 // 10852
D=A // 10853
@SP // 10854
AM=M+1 // 10855
A=A-1 // 10856
M=D // 10857

////PushInstruction("constant 51")
@51 // 10858
D=A // 10859
@SP // 10860
AM=M+1 // 10861
A=A-1 // 10862
M=D // 10863

////PushInstruction("constant 24")
@24 // 10864
D=A // 10865
@SP // 10866
AM=M+1 // 10867
A=A-1 // 10868
M=D // 10869

////PushInstruction("constant 12")
@12 // 10870
D=A // 10871
@SP // 10872
AM=M+1 // 10873
A=A-1 // 10874
M=D // 10875

////PushInstruction("constant 12")
@12 // 10876
D=A // 10877
@SP // 10878
AM=M+1 // 10879
A=A-1 // 10880
M=D // 10881

////PushInstruction("constant 0")
@SP // 10882
AM=M+1 // 10883
A=A-1 // 10884
M=0 // 10885

////PushInstruction("constant 12")
@12 // 10886
D=A // 10887
@SP // 10888
AM=M+1 // 10889
A=A-1 // 10890
M=D // 10891

////PushInstruction("constant 12")
@12 // 10892
D=A // 10893
@SP // 10894
AM=M+1 // 10895
A=A-1 // 10896
M=D // 10897

////PushInstruction("constant 0")
@SP // 10898
AM=M+1 // 10899
A=A-1 // 10900
M=0 // 10901

////PushInstruction("constant 0")
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=0 // 10905

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=34}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10906
D=A // 10907
@14 // 10908
M=D // 10909
@Output.create // 10910
D=A // 10911
@13 // 10912
M=D // 10913
@Output.initMap.ret.34 // 10914
D=A // 10915
@CALL // 10916
0;JMP // 10917
(Output.initMap.ret.34)

////PopInstruction{address=temp 0}
@SP // 10918
AM=M-1 // 10919
D=M // 10920
@5 // 10921
M=D // 10922

////PushInstruction("constant 65")
@65 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928

////PushInstruction("constant 12")
@12 // 10929
D=A // 10930
@SP // 10931
AM=M+1 // 10932
A=A-1 // 10933
M=D // 10934

////PushInstruction("constant 30")
@30 // 10935
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

////PushInstruction("constant 51")
@51 // 10947
D=A // 10948
@SP // 10949
AM=M+1 // 10950
A=A-1 // 10951
M=D // 10952

////PushInstruction("constant 63")
@63 // 10953
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

////PushInstruction("constant 51")
@51 // 10971
D=A // 10972
@SP // 10973
AM=M+1 // 10974
A=A-1 // 10975
M=D // 10976

////PushInstruction("constant 51")
@51 // 10977
D=A // 10978
@SP // 10979
AM=M+1 // 10980
A=A-1 // 10981
M=D // 10982

////PushInstruction("constant 0")
@SP // 10983
AM=M+1 // 10984
A=A-1 // 10985
M=0 // 10986

////PushInstruction("constant 0")
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=0 // 10990

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=35}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10991
D=A // 10992
@14 // 10993
M=D // 10994
@Output.create // 10995
D=A // 10996
@13 // 10997
M=D // 10998
@Output.initMap.ret.35 // 10999
D=A // 11000
@CALL // 11001
0;JMP // 11002
(Output.initMap.ret.35)

////PopInstruction{address=temp 0}
@SP // 11003
AM=M-1 // 11004
D=M // 11005
@5 // 11006
M=D // 11007

////PushInstruction("constant 66")
@66 // 11008
D=A // 11009
@SP // 11010
AM=M+1 // 11011
A=A-1 // 11012
M=D // 11013

////PushInstruction("constant 31")
@31 // 11014
D=A // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=D // 11019

////PushInstruction("constant 51")
@51 // 11020
D=A // 11021
@SP // 11022
AM=M+1 // 11023
A=A-1 // 11024
M=D // 11025

////PushInstruction("constant 51")
@51 // 11026
D=A // 11027
@SP // 11028
AM=M+1 // 11029
A=A-1 // 11030
M=D // 11031

////PushInstruction("constant 51")
@51 // 11032
D=A // 11033
@SP // 11034
AM=M+1 // 11035
A=A-1 // 11036
M=D // 11037

////PushInstruction("constant 31")
@31 // 11038
D=A // 11039
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=D // 11043

////PushInstruction("constant 51")
@51 // 11044
D=A // 11045
@SP // 11046
AM=M+1 // 11047
A=A-1 // 11048
M=D // 11049

////PushInstruction("constant 51")
@51 // 11050
D=A // 11051
@SP // 11052
AM=M+1 // 11053
A=A-1 // 11054
M=D // 11055

////PushInstruction("constant 51")
@51 // 11056
D=A // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=D // 11061

////PushInstruction("constant 31")
@31 // 11062
D=A // 11063
@SP // 11064
AM=M+1 // 11065
A=A-1 // 11066
M=D // 11067

////PushInstruction("constant 0")
@SP // 11068
AM=M+1 // 11069
A=A-1 // 11070
M=0 // 11071

////PushInstruction("constant 0")
@SP // 11072
AM=M+1 // 11073
A=A-1 // 11074
M=0 // 11075

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=36}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11076
D=A // 11077
@14 // 11078
M=D // 11079
@Output.create // 11080
D=A // 11081
@13 // 11082
M=D // 11083
@Output.initMap.ret.36 // 11084
D=A // 11085
@CALL // 11086
0;JMP // 11087
(Output.initMap.ret.36)

////PopInstruction{address=temp 0}
@SP // 11088
AM=M-1 // 11089
D=M // 11090
@5 // 11091
M=D // 11092

////PushInstruction("constant 67")
@67 // 11093
D=A // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=D // 11098

////PushInstruction("constant 28")
@28 // 11099
D=A // 11100
@SP // 11101
AM=M+1 // 11102
A=A-1 // 11103
M=D // 11104

////PushInstruction("constant 54")
@54 // 11105
D=A // 11106
@SP // 11107
AM=M+1 // 11108
A=A-1 // 11109
M=D // 11110

////PushInstruction("constant 35")
@35 // 11111
D=A // 11112
@SP // 11113
AM=M+1 // 11114
A=A-1 // 11115
M=D // 11116

////PushInstruction("constant 3")
@3 // 11117
D=A // 11118
@SP // 11119
AM=M+1 // 11120
A=A-1 // 11121
M=D // 11122

////PushInstruction("constant 3")
@3 // 11123
D=A // 11124
@SP // 11125
AM=M+1 // 11126
A=A-1 // 11127
M=D // 11128

////PushInstruction("constant 3")
@3 // 11129
D=A // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=D // 11134

////PushInstruction("constant 35")
@35 // 11135
D=A // 11136
@SP // 11137
AM=M+1 // 11138
A=A-1 // 11139
M=D // 11140

////PushInstruction("constant 54")
@54 // 11141
D=A // 11142
@SP // 11143
AM=M+1 // 11144
A=A-1 // 11145
M=D // 11146

////PushInstruction("constant 28")
@28 // 11147
D=A // 11148
@SP // 11149
AM=M+1 // 11150
A=A-1 // 11151
M=D // 11152

////PushInstruction("constant 0")
@SP // 11153
AM=M+1 // 11154
A=A-1 // 11155
M=0 // 11156

////PushInstruction("constant 0")
@SP // 11157
AM=M+1 // 11158
A=A-1 // 11159
M=0 // 11160

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=37}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11161
D=A // 11162
@14 // 11163
M=D // 11164
@Output.create // 11165
D=A // 11166
@13 // 11167
M=D // 11168
@Output.initMap.ret.37 // 11169
D=A // 11170
@CALL // 11171
0;JMP // 11172
(Output.initMap.ret.37)

////PopInstruction{address=temp 0}
@SP // 11173
AM=M-1 // 11174
D=M // 11175
@5 // 11176
M=D // 11177

////PushInstruction("constant 68")
@68 // 11178
D=A // 11179
@SP // 11180
AM=M+1 // 11181
A=A-1 // 11182
M=D // 11183

////PushInstruction("constant 15")
@15 // 11184
D=A // 11185
@SP // 11186
AM=M+1 // 11187
A=A-1 // 11188
M=D // 11189

////PushInstruction("constant 27")
@27 // 11190
D=A // 11191
@SP // 11192
AM=M+1 // 11193
A=A-1 // 11194
M=D // 11195

////PushInstruction("constant 51")
@51 // 11196
D=A // 11197
@SP // 11198
AM=M+1 // 11199
A=A-1 // 11200
M=D // 11201

////PushInstruction("constant 51")
@51 // 11202
D=A // 11203
@SP // 11204
AM=M+1 // 11205
A=A-1 // 11206
M=D // 11207

////PushInstruction("constant 51")
@51 // 11208
D=A // 11209
@SP // 11210
AM=M+1 // 11211
A=A-1 // 11212
M=D // 11213

////PushInstruction("constant 51")
@51 // 11214
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

////PushInstruction("constant 27")
@27 // 11226
D=A // 11227
@SP // 11228
AM=M+1 // 11229
A=A-1 // 11230
M=D // 11231

////PushInstruction("constant 15")
@15 // 11232
D=A // 11233
@SP // 11234
AM=M+1 // 11235
A=A-1 // 11236
M=D // 11237

////PushInstruction("constant 0")
@SP // 11238
AM=M+1 // 11239
A=A-1 // 11240
M=0 // 11241

////PushInstruction("constant 0")
@SP // 11242
AM=M+1 // 11243
A=A-1 // 11244
M=0 // 11245

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=38}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11246
D=A // 11247
@14 // 11248
M=D // 11249
@Output.create // 11250
D=A // 11251
@13 // 11252
M=D // 11253
@Output.initMap.ret.38 // 11254
D=A // 11255
@CALL // 11256
0;JMP // 11257
(Output.initMap.ret.38)

////PopInstruction{address=temp 0}
@SP // 11258
AM=M-1 // 11259
D=M // 11260
@5 // 11261
M=D // 11262

////PushInstruction("constant 69")
@69 // 11263
D=A // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=D // 11268

////PushInstruction("constant 63")
@63 // 11269
D=A // 11270
@SP // 11271
AM=M+1 // 11272
A=A-1 // 11273
M=D // 11274

////PushInstruction("constant 51")
@51 // 11275
D=A // 11276
@SP // 11277
AM=M+1 // 11278
A=A-1 // 11279
M=D // 11280

////PushInstruction("constant 35")
@35 // 11281
D=A // 11282
@SP // 11283
AM=M+1 // 11284
A=A-1 // 11285
M=D // 11286

////PushInstruction("constant 11")
@11 // 11287
D=A // 11288
@SP // 11289
AM=M+1 // 11290
A=A-1 // 11291
M=D // 11292

////PushInstruction("constant 15")
@15 // 11293
D=A // 11294
@SP // 11295
AM=M+1 // 11296
A=A-1 // 11297
M=D // 11298

////PushInstruction("constant 11")
@11 // 11299
D=A // 11300
@SP // 11301
AM=M+1 // 11302
A=A-1 // 11303
M=D // 11304

////PushInstruction("constant 35")
@35 // 11305
D=A // 11306
@SP // 11307
AM=M+1 // 11308
A=A-1 // 11309
M=D // 11310

////PushInstruction("constant 51")
@51 // 11311
D=A // 11312
@SP // 11313
AM=M+1 // 11314
A=A-1 // 11315
M=D // 11316

////PushInstruction("constant 63")
@63 // 11317
D=A // 11318
@SP // 11319
AM=M+1 // 11320
A=A-1 // 11321
M=D // 11322

////PushInstruction("constant 0")
@SP // 11323
AM=M+1 // 11324
A=A-1 // 11325
M=0 // 11326

////PushInstruction("constant 0")
@SP // 11327
AM=M+1 // 11328
A=A-1 // 11329
M=0 // 11330

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=39}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11331
D=A // 11332
@14 // 11333
M=D // 11334
@Output.create // 11335
D=A // 11336
@13 // 11337
M=D // 11338
@Output.initMap.ret.39 // 11339
D=A // 11340
@CALL // 11341
0;JMP // 11342
(Output.initMap.ret.39)

////PopInstruction{address=temp 0}
@SP // 11343
AM=M-1 // 11344
D=M // 11345
@5 // 11346
M=D // 11347

////PushInstruction("constant 70")
@70 // 11348
D=A // 11349
@SP // 11350
AM=M+1 // 11351
A=A-1 // 11352
M=D // 11353

////PushInstruction("constant 63")
@63 // 11354
D=A // 11355
@SP // 11356
AM=M+1 // 11357
A=A-1 // 11358
M=D // 11359

////PushInstruction("constant 51")
@51 // 11360
D=A // 11361
@SP // 11362
AM=M+1 // 11363
A=A-1 // 11364
M=D // 11365

////PushInstruction("constant 35")
@35 // 11366
D=A // 11367
@SP // 11368
AM=M+1 // 11369
A=A-1 // 11370
M=D // 11371

////PushInstruction("constant 11")
@11 // 11372
D=A // 11373
@SP // 11374
AM=M+1 // 11375
A=A-1 // 11376
M=D // 11377

////PushInstruction("constant 15")
@15 // 11378
D=A // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=D // 11383

////PushInstruction("constant 11")
@11 // 11384
D=A // 11385
@SP // 11386
AM=M+1 // 11387
A=A-1 // 11388
M=D // 11389

////PushInstruction("constant 3")
@3 // 11390
D=A // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=D // 11395

////PushInstruction("constant 3")
@3 // 11396
D=A // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=D // 11401

////PushInstruction("constant 3")
@3 // 11402
D=A // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=D // 11407

////PushInstruction("constant 0")
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=0 // 11411

////PushInstruction("constant 0")
@SP // 11412
AM=M+1 // 11413
A=A-1 // 11414
M=0 // 11415

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=40}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11416
D=A // 11417
@14 // 11418
M=D // 11419
@Output.create // 11420
D=A // 11421
@13 // 11422
M=D // 11423
@Output.initMap.ret.40 // 11424
D=A // 11425
@CALL // 11426
0;JMP // 11427
(Output.initMap.ret.40)

////PopInstruction{address=temp 0}
@SP // 11428
AM=M-1 // 11429
D=M // 11430
@5 // 11431
M=D // 11432

////PushInstruction("constant 71")
@71 // 11433
D=A // 11434
@SP // 11435
AM=M+1 // 11436
A=A-1 // 11437
M=D // 11438

////PushInstruction("constant 28")
@28 // 11439
D=A // 11440
@SP // 11441
AM=M+1 // 11442
A=A-1 // 11443
M=D // 11444

////PushInstruction("constant 54")
@54 // 11445
D=A // 11446
@SP // 11447
AM=M+1 // 11448
A=A-1 // 11449
M=D // 11450

////PushInstruction("constant 35")
@35 // 11451
D=A // 11452
@SP // 11453
AM=M+1 // 11454
A=A-1 // 11455
M=D // 11456

////PushInstruction("constant 3")
@3 // 11457
D=A // 11458
@SP // 11459
AM=M+1 // 11460
A=A-1 // 11461
M=D // 11462

////PushInstruction("constant 59")
@59 // 11463
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

////PushInstruction("constant 54")
@54 // 11481
D=A // 11482
@SP // 11483
AM=M+1 // 11484
A=A-1 // 11485
M=D // 11486

////PushInstruction("constant 44")
@44 // 11487
D=A // 11488
@SP // 11489
AM=M+1 // 11490
A=A-1 // 11491
M=D // 11492

////PushInstruction("constant 0")
@SP // 11493
AM=M+1 // 11494
A=A-1 // 11495
M=0 // 11496

////PushInstruction("constant 0")
@SP // 11497
AM=M+1 // 11498
A=A-1 // 11499
M=0 // 11500

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=41}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11501
D=A // 11502
@14 // 11503
M=D // 11504
@Output.create // 11505
D=A // 11506
@13 // 11507
M=D // 11508
@Output.initMap.ret.41 // 11509
D=A // 11510
@CALL // 11511
0;JMP // 11512
(Output.initMap.ret.41)

////PopInstruction{address=temp 0}
@SP // 11513
AM=M-1 // 11514
D=M // 11515
@5 // 11516
M=D // 11517

////PushInstruction("constant 72")
@72 // 11518
D=A // 11519
@SP // 11520
AM=M+1 // 11521
A=A-1 // 11522
M=D // 11523

////PushInstruction("constant 51")
@51 // 11524
D=A // 11525
@SP // 11526
AM=M+1 // 11527
A=A-1 // 11528
M=D // 11529

////PushInstruction("constant 51")
@51 // 11530
D=A // 11531
@SP // 11532
AM=M+1 // 11533
A=A-1 // 11534
M=D // 11535

////PushInstruction("constant 51")
@51 // 11536
D=A // 11537
@SP // 11538
AM=M+1 // 11539
A=A-1 // 11540
M=D // 11541

////PushInstruction("constant 51")
@51 // 11542
D=A // 11543
@SP // 11544
AM=M+1 // 11545
A=A-1 // 11546
M=D // 11547

////PushInstruction("constant 63")
@63 // 11548
D=A // 11549
@SP // 11550
AM=M+1 // 11551
A=A-1 // 11552
M=D // 11553

////PushInstruction("constant 51")
@51 // 11554
D=A // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=D // 11559

////PushInstruction("constant 51")
@51 // 11560
D=A // 11561
@SP // 11562
AM=M+1 // 11563
A=A-1 // 11564
M=D // 11565

////PushInstruction("constant 51")
@51 // 11566
D=A // 11567
@SP // 11568
AM=M+1 // 11569
A=A-1 // 11570
M=D // 11571

////PushInstruction("constant 51")
@51 // 11572
D=A // 11573
@SP // 11574
AM=M+1 // 11575
A=A-1 // 11576
M=D // 11577

////PushInstruction("constant 0")
@SP // 11578
AM=M+1 // 11579
A=A-1 // 11580
M=0 // 11581

////PushInstruction("constant 0")
@SP // 11582
AM=M+1 // 11583
A=A-1 // 11584
M=0 // 11585

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=42}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11586
D=A // 11587
@14 // 11588
M=D // 11589
@Output.create // 11590
D=A // 11591
@13 // 11592
M=D // 11593
@Output.initMap.ret.42 // 11594
D=A // 11595
@CALL // 11596
0;JMP // 11597
(Output.initMap.ret.42)

////PopInstruction{address=temp 0}
@SP // 11598
AM=M-1 // 11599
D=M // 11600
@5 // 11601
M=D // 11602

////PushInstruction("constant 73")
@73 // 11603
D=A // 11604
@SP // 11605
AM=M+1 // 11606
A=A-1 // 11607
M=D // 11608

////PushInstruction("constant 30")
@30 // 11609
D=A // 11610
@SP // 11611
AM=M+1 // 11612
A=A-1 // 11613
M=D // 11614

////PushInstruction("constant 12")
@12 // 11615
D=A // 11616
@SP // 11617
AM=M+1 // 11618
A=A-1 // 11619
M=D // 11620

////PushInstruction("constant 12")
@12 // 11621
D=A // 11622
@SP // 11623
AM=M+1 // 11624
A=A-1 // 11625
M=D // 11626

////PushInstruction("constant 12")
@12 // 11627
D=A // 11628
@SP // 11629
AM=M+1 // 11630
A=A-1 // 11631
M=D // 11632

////PushInstruction("constant 12")
@12 // 11633
D=A // 11634
@SP // 11635
AM=M+1 // 11636
A=A-1 // 11637
M=D // 11638

////PushInstruction("constant 12")
@12 // 11639
D=A // 11640
@SP // 11641
AM=M+1 // 11642
A=A-1 // 11643
M=D // 11644

////PushInstruction("constant 12")
@12 // 11645
D=A // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=D // 11650

////PushInstruction("constant 12")
@12 // 11651
D=A // 11652
@SP // 11653
AM=M+1 // 11654
A=A-1 // 11655
M=D // 11656

////PushInstruction("constant 30")
@30 // 11657
D=A // 11658
@SP // 11659
AM=M+1 // 11660
A=A-1 // 11661
M=D // 11662

////PushInstruction("constant 0")
@SP // 11663
AM=M+1 // 11664
A=A-1 // 11665
M=0 // 11666

////PushInstruction("constant 0")
@SP // 11667
AM=M+1 // 11668
A=A-1 // 11669
M=0 // 11670

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=43}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11671
D=A // 11672
@14 // 11673
M=D // 11674
@Output.create // 11675
D=A // 11676
@13 // 11677
M=D // 11678
@Output.initMap.ret.43 // 11679
D=A // 11680
@CALL // 11681
0;JMP // 11682
(Output.initMap.ret.43)

////PopInstruction{address=temp 0}
@SP // 11683
AM=M-1 // 11684
D=M // 11685
@5 // 11686
M=D // 11687

////PushInstruction("constant 74")
@74 // 11688
D=A // 11689
@SP // 11690
AM=M+1 // 11691
A=A-1 // 11692
M=D // 11693

////PushInstruction("constant 60")
@60 // 11694
D=A // 11695
@SP // 11696
AM=M+1 // 11697
A=A-1 // 11698
M=D // 11699

////PushInstruction("constant 24")
@24 // 11700
D=A // 11701
@SP // 11702
AM=M+1 // 11703
A=A-1 // 11704
M=D // 11705

////PushInstruction("constant 24")
@24 // 11706
D=A // 11707
@SP // 11708
AM=M+1 // 11709
A=A-1 // 11710
M=D // 11711

////PushInstruction("constant 24")
@24 // 11712
D=A // 11713
@SP // 11714
AM=M+1 // 11715
A=A-1 // 11716
M=D // 11717

////PushInstruction("constant 24")
@24 // 11718
D=A // 11719
@SP // 11720
AM=M+1 // 11721
A=A-1 // 11722
M=D // 11723

////PushInstruction("constant 24")
@24 // 11724
D=A // 11725
@SP // 11726
AM=M+1 // 11727
A=A-1 // 11728
M=D // 11729

////PushInstruction("constant 27")
@27 // 11730
D=A // 11731
@SP // 11732
AM=M+1 // 11733
A=A-1 // 11734
M=D // 11735

////PushInstruction("constant 27")
@27 // 11736
D=A // 11737
@SP // 11738
AM=M+1 // 11739
A=A-1 // 11740
M=D // 11741

////PushInstruction("constant 14")
@14 // 11742
D=A // 11743
@SP // 11744
AM=M+1 // 11745
A=A-1 // 11746
M=D // 11747

////PushInstruction("constant 0")
@SP // 11748
AM=M+1 // 11749
A=A-1 // 11750
M=0 // 11751

////PushInstruction("constant 0")
@SP // 11752
AM=M+1 // 11753
A=A-1 // 11754
M=0 // 11755

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=44}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11756
D=A // 11757
@14 // 11758
M=D // 11759
@Output.create // 11760
D=A // 11761
@13 // 11762
M=D // 11763
@Output.initMap.ret.44 // 11764
D=A // 11765
@CALL // 11766
0;JMP // 11767
(Output.initMap.ret.44)

////PopInstruction{address=temp 0}
@SP // 11768
AM=M-1 // 11769
D=M // 11770
@5 // 11771
M=D // 11772

////PushInstruction("constant 75")
@75 // 11773
D=A // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=D // 11778

////PushInstruction("constant 51")
@51 // 11779
D=A // 11780
@SP // 11781
AM=M+1 // 11782
A=A-1 // 11783
M=D // 11784

////PushInstruction("constant 51")
@51 // 11785
D=A // 11786
@SP // 11787
AM=M+1 // 11788
A=A-1 // 11789
M=D // 11790

////PushInstruction("constant 51")
@51 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796

////PushInstruction("constant 27")
@27 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802

////PushInstruction("constant 15")
@15 // 11803
D=A // 11804
@SP // 11805
AM=M+1 // 11806
A=A-1 // 11807
M=D // 11808

////PushInstruction("constant 27")
@27 // 11809
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

////PushInstruction("constant 51")
@51 // 11821
D=A // 11822
@SP // 11823
AM=M+1 // 11824
A=A-1 // 11825
M=D // 11826

////PushInstruction("constant 51")
@51 // 11827
D=A // 11828
@SP // 11829
AM=M+1 // 11830
A=A-1 // 11831
M=D // 11832

////PushInstruction("constant 0")
@SP // 11833
AM=M+1 // 11834
A=A-1 // 11835
M=0 // 11836

////PushInstruction("constant 0")
@SP // 11837
AM=M+1 // 11838
A=A-1 // 11839
M=0 // 11840

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=45}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11841
D=A // 11842
@14 // 11843
M=D // 11844
@Output.create // 11845
D=A // 11846
@13 // 11847
M=D // 11848
@Output.initMap.ret.45 // 11849
D=A // 11850
@CALL // 11851
0;JMP // 11852
(Output.initMap.ret.45)

////PopInstruction{address=temp 0}
@SP // 11853
AM=M-1 // 11854
D=M // 11855
@5 // 11856
M=D // 11857

////PushInstruction("constant 76")
@76 // 11858
D=A // 11859
@SP // 11860
AM=M+1 // 11861
A=A-1 // 11862
M=D // 11863

////PushInstruction("constant 3")
@3 // 11864
D=A // 11865
@SP // 11866
AM=M+1 // 11867
A=A-1 // 11868
M=D // 11869

////PushInstruction("constant 3")
@3 // 11870
D=A // 11871
@SP // 11872
AM=M+1 // 11873
A=A-1 // 11874
M=D // 11875

////PushInstruction("constant 3")
@3 // 11876
D=A // 11877
@SP // 11878
AM=M+1 // 11879
A=A-1 // 11880
M=D // 11881

////PushInstruction("constant 3")
@3 // 11882
D=A // 11883
@SP // 11884
AM=M+1 // 11885
A=A-1 // 11886
M=D // 11887

////PushInstruction("constant 3")
@3 // 11888
D=A // 11889
@SP // 11890
AM=M+1 // 11891
A=A-1 // 11892
M=D // 11893

////PushInstruction("constant 3")
@3 // 11894
D=A // 11895
@SP // 11896
AM=M+1 // 11897
A=A-1 // 11898
M=D // 11899

////PushInstruction("constant 35")
@35 // 11900
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

////PushInstruction("constant 63")
@63 // 11912
D=A // 11913
@SP // 11914
AM=M+1 // 11915
A=A-1 // 11916
M=D // 11917

////PushInstruction("constant 0")
@SP // 11918
AM=M+1 // 11919
A=A-1 // 11920
M=0 // 11921

////PushInstruction("constant 0")
@SP // 11922
AM=M+1 // 11923
A=A-1 // 11924
M=0 // 11925

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=46}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11926
D=A // 11927
@14 // 11928
M=D // 11929
@Output.create // 11930
D=A // 11931
@13 // 11932
M=D // 11933
@Output.initMap.ret.46 // 11934
D=A // 11935
@CALL // 11936
0;JMP // 11937
(Output.initMap.ret.46)

////PopInstruction{address=temp 0}
@SP // 11938
AM=M-1 // 11939
D=M // 11940
@5 // 11941
M=D // 11942

////PushInstruction("constant 77")
@77 // 11943
D=A // 11944
@SP // 11945
AM=M+1 // 11946
A=A-1 // 11947
M=D // 11948

////PushInstruction("constant 33")
@33 // 11949
D=A // 11950
@SP // 11951
AM=M+1 // 11952
A=A-1 // 11953
M=D // 11954

////PushInstruction("constant 51")
@51 // 11955
D=A // 11956
@SP // 11957
AM=M+1 // 11958
A=A-1 // 11959
M=D // 11960

////PushInstruction("constant 63")
@63 // 11961
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

////PushInstruction("constant 51")
@51 // 11973
D=A // 11974
@SP // 11975
AM=M+1 // 11976
A=A-1 // 11977
M=D // 11978

////PushInstruction("constant 51")
@51 // 11979
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

////PushInstruction("constant 51")
@51 // 11997
D=A // 11998
@SP // 11999
AM=M+1 // 12000
A=A-1 // 12001
M=D // 12002

////PushInstruction("constant 0")
@SP // 12003
AM=M+1 // 12004
A=A-1 // 12005
M=0 // 12006

////PushInstruction("constant 0")
@SP // 12007
AM=M+1 // 12008
A=A-1 // 12009
M=0 // 12010

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=47}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12011
D=A // 12012
@14 // 12013
M=D // 12014
@Output.create // 12015
D=A // 12016
@13 // 12017
M=D // 12018
@Output.initMap.ret.47 // 12019
D=A // 12020
@CALL // 12021
0;JMP // 12022
(Output.initMap.ret.47)

////PopInstruction{address=temp 0}
@SP // 12023
AM=M-1 // 12024
D=M // 12025
@5 // 12026
M=D // 12027

////PushInstruction("constant 78")
@78 // 12028
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

////PushInstruction("constant 55")
@55 // 12046
D=A // 12047
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=D // 12051

////PushInstruction("constant 55")
@55 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057

////PushInstruction("constant 63")
@63 // 12058
D=A // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=D // 12063

////PushInstruction("constant 59")
@59 // 12064
D=A // 12065
@SP // 12066
AM=M+1 // 12067
A=A-1 // 12068
M=D // 12069

////PushInstruction("constant 59")
@59 // 12070
D=A // 12071
@SP // 12072
AM=M+1 // 12073
A=A-1 // 12074
M=D // 12075

////PushInstruction("constant 51")
@51 // 12076
D=A // 12077
@SP // 12078
AM=M+1 // 12079
A=A-1 // 12080
M=D // 12081

////PushInstruction("constant 51")
@51 // 12082
D=A // 12083
@SP // 12084
AM=M+1 // 12085
A=A-1 // 12086
M=D // 12087

////PushInstruction("constant 0")
@SP // 12088
AM=M+1 // 12089
A=A-1 // 12090
M=0 // 12091

////PushInstruction("constant 0")
@SP // 12092
AM=M+1 // 12093
A=A-1 // 12094
M=0 // 12095

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=48}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12096
D=A // 12097
@14 // 12098
M=D // 12099
@Output.create // 12100
D=A // 12101
@13 // 12102
M=D // 12103
@Output.initMap.ret.48 // 12104
D=A // 12105
@CALL // 12106
0;JMP // 12107
(Output.initMap.ret.48)

////PopInstruction{address=temp 0}
@SP // 12108
AM=M-1 // 12109
D=M // 12110
@5 // 12111
M=D // 12112

////PushInstruction("constant 79")
@79 // 12113
D=A // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118

////PushInstruction("constant 30")
@30 // 12119
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

////PushInstruction("constant 51")
@51 // 12137
D=A // 12138
@SP // 12139
AM=M+1 // 12140
A=A-1 // 12141
M=D // 12142

////PushInstruction("constant 51")
@51 // 12143
D=A // 12144
@SP // 12145
AM=M+1 // 12146
A=A-1 // 12147
M=D // 12148

////PushInstruction("constant 51")
@51 // 12149
D=A // 12150
@SP // 12151
AM=M+1 // 12152
A=A-1 // 12153
M=D // 12154

////PushInstruction("constant 51")
@51 // 12155
D=A // 12156
@SP // 12157
AM=M+1 // 12158
A=A-1 // 12159
M=D // 12160

////PushInstruction("constant 51")
@51 // 12161
D=A // 12162
@SP // 12163
AM=M+1 // 12164
A=A-1 // 12165
M=D // 12166

////PushInstruction("constant 30")
@30 // 12167
D=A // 12168
@SP // 12169
AM=M+1 // 12170
A=A-1 // 12171
M=D // 12172

////PushInstruction("constant 0")
@SP // 12173
AM=M+1 // 12174
A=A-1 // 12175
M=0 // 12176

////PushInstruction("constant 0")
@SP // 12177
AM=M+1 // 12178
A=A-1 // 12179
M=0 // 12180

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=49}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12181
D=A // 12182
@14 // 12183
M=D // 12184
@Output.create // 12185
D=A // 12186
@13 // 12187
M=D // 12188
@Output.initMap.ret.49 // 12189
D=A // 12190
@CALL // 12191
0;JMP // 12192
(Output.initMap.ret.49)

////PopInstruction{address=temp 0}
@SP // 12193
AM=M-1 // 12194
D=M // 12195
@5 // 12196
M=D // 12197

////PushInstruction("constant 80")
@80 // 12198
D=A // 12199
@SP // 12200
AM=M+1 // 12201
A=A-1 // 12202
M=D // 12203

////PushInstruction("constant 31")
@31 // 12204
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

////PushInstruction("constant 31")
@31 // 12228
D=A // 12229
@SP // 12230
AM=M+1 // 12231
A=A-1 // 12232
M=D // 12233

////PushInstruction("constant 3")
@3 // 12234
D=A // 12235
@SP // 12236
AM=M+1 // 12237
A=A-1 // 12238
M=D // 12239

////PushInstruction("constant 3")
@3 // 12240
D=A // 12241
@SP // 12242
AM=M+1 // 12243
A=A-1 // 12244
M=D // 12245

////PushInstruction("constant 3")
@3 // 12246
D=A // 12247
@SP // 12248
AM=M+1 // 12249
A=A-1 // 12250
M=D // 12251

////PushInstruction("constant 3")
@3 // 12252
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

////PushInstruction("constant 0")
@SP // 12262
AM=M+1 // 12263
A=A-1 // 12264
M=0 // 12265

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=50}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12266
D=A // 12267
@14 // 12268
M=D // 12269
@Output.create // 12270
D=A // 12271
@13 // 12272
M=D // 12273
@Output.initMap.ret.50 // 12274
D=A // 12275
@CALL // 12276
0;JMP // 12277
(Output.initMap.ret.50)

////PopInstruction{address=temp 0}
@SP // 12278
AM=M-1 // 12279
D=M // 12280
@5 // 12281
M=D // 12282

////PushInstruction("constant 81")
@81 // 12283
D=A // 12284
@SP // 12285
AM=M+1 // 12286
A=A-1 // 12287
M=D // 12288

////PushInstruction("constant 30")
@30 // 12289
D=A // 12290
@SP // 12291
AM=M+1 // 12292
A=A-1 // 12293
M=D // 12294

////PushInstruction("constant 51")
@51 // 12295
D=A // 12296
@SP // 12297
AM=M+1 // 12298
A=A-1 // 12299
M=D // 12300

////PushInstruction("constant 51")
@51 // 12301
D=A // 12302
@SP // 12303
AM=M+1 // 12304
A=A-1 // 12305
M=D // 12306

////PushInstruction("constant 51")
@51 // 12307
D=A // 12308
@SP // 12309
AM=M+1 // 12310
A=A-1 // 12311
M=D // 12312

////PushInstruction("constant 51")
@51 // 12313
D=A // 12314
@SP // 12315
AM=M+1 // 12316
A=A-1 // 12317
M=D // 12318

////PushInstruction("constant 51")
@51 // 12319
D=A // 12320
@SP // 12321
AM=M+1 // 12322
A=A-1 // 12323
M=D // 12324

////PushInstruction("constant 63")
@63 // 12325
D=A // 12326
@SP // 12327
AM=M+1 // 12328
A=A-1 // 12329
M=D // 12330

////PushInstruction("constant 59")
@59 // 12331
D=A // 12332
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=D // 12336

////PushInstruction("constant 30")
@30 // 12337
D=A // 12338
@SP // 12339
AM=M+1 // 12340
A=A-1 // 12341
M=D // 12342

////PushInstruction("constant 48")
@48 // 12343
D=A // 12344
@SP // 12345
AM=M+1 // 12346
A=A-1 // 12347
M=D // 12348

////PushInstruction("constant 0")
@SP // 12349
AM=M+1 // 12350
A=A-1 // 12351
M=0 // 12352

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=51}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12353
D=A // 12354
@14 // 12355
M=D // 12356
@Output.create // 12357
D=A // 12358
@13 // 12359
M=D // 12360
@Output.initMap.ret.51 // 12361
D=A // 12362
@CALL // 12363
0;JMP // 12364
(Output.initMap.ret.51)

////PopInstruction{address=temp 0}
@SP // 12365
AM=M-1 // 12366
D=M // 12367
@5 // 12368
M=D // 12369

////PushInstruction("constant 82")
@82 // 12370
D=A // 12371
@SP // 12372
AM=M+1 // 12373
A=A-1 // 12374
M=D // 12375

////PushInstruction("constant 31")
@31 // 12376
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

////PushInstruction("constant 51")
@51 // 12388
D=A // 12389
@SP // 12390
AM=M+1 // 12391
A=A-1 // 12392
M=D // 12393

////PushInstruction("constant 51")
@51 // 12394
D=A // 12395
@SP // 12396
AM=M+1 // 12397
A=A-1 // 12398
M=D // 12399

////PushInstruction("constant 31")
@31 // 12400
D=A // 12401
@SP // 12402
AM=M+1 // 12403
A=A-1 // 12404
M=D // 12405

////PushInstruction("constant 27")
@27 // 12406
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

////PushInstruction("constant 51")
@51 // 12418
D=A // 12419
@SP // 12420
AM=M+1 // 12421
A=A-1 // 12422
M=D // 12423

////PushInstruction("constant 51")
@51 // 12424
D=A // 12425
@SP // 12426
AM=M+1 // 12427
A=A-1 // 12428
M=D // 12429

////PushInstruction("constant 0")
@SP // 12430
AM=M+1 // 12431
A=A-1 // 12432
M=0 // 12433

////PushInstruction("constant 0")
@SP // 12434
AM=M+1 // 12435
A=A-1 // 12436
M=0 // 12437

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=52}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12438
D=A // 12439
@14 // 12440
M=D // 12441
@Output.create // 12442
D=A // 12443
@13 // 12444
M=D // 12445
@Output.initMap.ret.52 // 12446
D=A // 12447
@CALL // 12448
0;JMP // 12449
(Output.initMap.ret.52)

////PopInstruction{address=temp 0}
@SP // 12450
AM=M-1 // 12451
D=M // 12452
@5 // 12453
M=D // 12454

////PushInstruction("constant 83")
@83 // 12455
D=A // 12456
@SP // 12457
AM=M+1 // 12458
A=A-1 // 12459
M=D // 12460

////PushInstruction("constant 30")
@30 // 12461
D=A // 12462
@SP // 12463
AM=M+1 // 12464
A=A-1 // 12465
M=D // 12466

////PushInstruction("constant 51")
@51 // 12467
D=A // 12468
@SP // 12469
AM=M+1 // 12470
A=A-1 // 12471
M=D // 12472

////PushInstruction("constant 51")
@51 // 12473
D=A // 12474
@SP // 12475
AM=M+1 // 12476
A=A-1 // 12477
M=D // 12478

////PushInstruction("constant 6")
@6 // 12479
D=A // 12480
@SP // 12481
AM=M+1 // 12482
A=A-1 // 12483
M=D // 12484

////PushInstruction("constant 28")
@28 // 12485
D=A // 12486
@SP // 12487
AM=M+1 // 12488
A=A-1 // 12489
M=D // 12490

////PushInstruction("constant 48")
@48 // 12491
D=A // 12492
@SP // 12493
AM=M+1 // 12494
A=A-1 // 12495
M=D // 12496

////PushInstruction("constant 51")
@51 // 12497
D=A // 12498
@SP // 12499
AM=M+1 // 12500
A=A-1 // 12501
M=D // 12502

////PushInstruction("constant 51")
@51 // 12503
D=A // 12504
@SP // 12505
AM=M+1 // 12506
A=A-1 // 12507
M=D // 12508

////PushInstruction("constant 30")
@30 // 12509
D=A // 12510
@SP // 12511
AM=M+1 // 12512
A=A-1 // 12513
M=D // 12514

////PushInstruction("constant 0")
@SP // 12515
AM=M+1 // 12516
A=A-1 // 12517
M=0 // 12518

////PushInstruction("constant 0")
@SP // 12519
AM=M+1 // 12520
A=A-1 // 12521
M=0 // 12522

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=53}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12523
D=A // 12524
@14 // 12525
M=D // 12526
@Output.create // 12527
D=A // 12528
@13 // 12529
M=D // 12530
@Output.initMap.ret.53 // 12531
D=A // 12532
@CALL // 12533
0;JMP // 12534
(Output.initMap.ret.53)

////PopInstruction{address=temp 0}
@SP // 12535
AM=M-1 // 12536
D=M // 12537
@5 // 12538
M=D // 12539

////PushInstruction("constant 84")
@84 // 12540
D=A // 12541
@SP // 12542
AM=M+1 // 12543
A=A-1 // 12544
M=D // 12545

////PushInstruction("constant 63")
@63 // 12546
D=A // 12547
@SP // 12548
AM=M+1 // 12549
A=A-1 // 12550
M=D // 12551

////PushInstruction("constant 63")
@63 // 12552
D=A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557

////PushInstruction("constant 45")
@45 // 12558
D=A // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563

////PushInstruction("constant 12")
@12 // 12564
D=A // 12565
@SP // 12566
AM=M+1 // 12567
A=A-1 // 12568
M=D // 12569

////PushInstruction("constant 12")
@12 // 12570
D=A // 12571
@SP // 12572
AM=M+1 // 12573
A=A-1 // 12574
M=D // 12575

////PushInstruction("constant 12")
@12 // 12576
D=A // 12577
@SP // 12578
AM=M+1 // 12579
A=A-1 // 12580
M=D // 12581

////PushInstruction("constant 12")
@12 // 12582
D=A // 12583
@SP // 12584
AM=M+1 // 12585
A=A-1 // 12586
M=D // 12587

////PushInstruction("constant 12")
@12 // 12588
D=A // 12589
@SP // 12590
AM=M+1 // 12591
A=A-1 // 12592
M=D // 12593

////PushInstruction("constant 30")
@30 // 12594
D=A // 12595
@SP // 12596
AM=M+1 // 12597
A=A-1 // 12598
M=D // 12599

////PushInstruction("constant 0")
@SP // 12600
AM=M+1 // 12601
A=A-1 // 12602
M=0 // 12603

////PushInstruction("constant 0")
@SP // 12604
AM=M+1 // 12605
A=A-1 // 12606
M=0 // 12607

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=54}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12608
D=A // 12609
@14 // 12610
M=D // 12611
@Output.create // 12612
D=A // 12613
@13 // 12614
M=D // 12615
@Output.initMap.ret.54 // 12616
D=A // 12617
@CALL // 12618
0;JMP // 12619
(Output.initMap.ret.54)

////PopInstruction{address=temp 0}
@SP // 12620
AM=M-1 // 12621
D=M // 12622
@5 // 12623
M=D // 12624

////PushInstruction("constant 85")
@85 // 12625
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

////PushInstruction("constant 51")
@51 // 12655
D=A // 12656
@SP // 12657
AM=M+1 // 12658
A=A-1 // 12659
M=D // 12660

////PushInstruction("constant 51")
@51 // 12661
D=A // 12662
@SP // 12663
AM=M+1 // 12664
A=A-1 // 12665
M=D // 12666

////PushInstruction("constant 51")
@51 // 12667
D=A // 12668
@SP // 12669
AM=M+1 // 12670
A=A-1 // 12671
M=D // 12672

////PushInstruction("constant 51")
@51 // 12673
D=A // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678

////PushInstruction("constant 30")
@30 // 12679
D=A // 12680
@SP // 12681
AM=M+1 // 12682
A=A-1 // 12683
M=D // 12684

////PushInstruction("constant 0")
@SP // 12685
AM=M+1 // 12686
A=A-1 // 12687
M=0 // 12688

////PushInstruction("constant 0")
@SP // 12689
AM=M+1 // 12690
A=A-1 // 12691
M=0 // 12692

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=55}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12693
D=A // 12694
@14 // 12695
M=D // 12696
@Output.create // 12697
D=A // 12698
@13 // 12699
M=D // 12700
@Output.initMap.ret.55 // 12701
D=A // 12702
@CALL // 12703
0;JMP // 12704
(Output.initMap.ret.55)

////PopInstruction{address=temp 0}
@SP // 12705
AM=M-1 // 12706
D=M // 12707
@5 // 12708
M=D // 12709

////PushInstruction("constant 86")
@86 // 12710
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

////PushInstruction("constant 51")
@51 // 12740
D=A // 12741
@SP // 12742
AM=M+1 // 12743
A=A-1 // 12744
M=D // 12745

////PushInstruction("constant 30")
@30 // 12746
D=A // 12747
@SP // 12748
AM=M+1 // 12749
A=A-1 // 12750
M=D // 12751

////PushInstruction("constant 30")
@30 // 12752
D=A // 12753
@SP // 12754
AM=M+1 // 12755
A=A-1 // 12756
M=D // 12757

////PushInstruction("constant 12")
@12 // 12758
D=A // 12759
@SP // 12760
AM=M+1 // 12761
A=A-1 // 12762
M=D // 12763

////PushInstruction("constant 12")
@12 // 12764
D=A // 12765
@SP // 12766
AM=M+1 // 12767
A=A-1 // 12768
M=D // 12769

////PushInstruction("constant 0")
@SP // 12770
AM=M+1 // 12771
A=A-1 // 12772
M=0 // 12773

////PushInstruction("constant 0")
@SP // 12774
AM=M+1 // 12775
A=A-1 // 12776
M=0 // 12777

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=56}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12778
D=A // 12779
@14 // 12780
M=D // 12781
@Output.create // 12782
D=A // 12783
@13 // 12784
M=D // 12785
@Output.initMap.ret.56 // 12786
D=A // 12787
@CALL // 12788
0;JMP // 12789
(Output.initMap.ret.56)

////PopInstruction{address=temp 0}
@SP // 12790
AM=M-1 // 12791
D=M // 12792
@5 // 12793
M=D // 12794

////PushInstruction("constant 87")
@87 // 12795
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

////PushInstruction("constant 51")
@51 // 12807
D=A // 12808
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=D // 12812

////PushInstruction("constant 51")
@51 // 12813
D=A // 12814
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=D // 12818

////PushInstruction("constant 51")
@51 // 12819
D=A // 12820
@SP // 12821
AM=M+1 // 12822
A=A-1 // 12823
M=D // 12824

////PushInstruction("constant 51")
@51 // 12825
D=A // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830

////PushInstruction("constant 63")
@63 // 12831
D=A // 12832
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=D // 12836

////PushInstruction("constant 63")
@63 // 12837
D=A // 12838
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=D // 12842

////PushInstruction("constant 63")
@63 // 12843
D=A // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848

////PushInstruction("constant 18")
@18 // 12849
D=A // 12850
@SP // 12851
AM=M+1 // 12852
A=A-1 // 12853
M=D // 12854

////PushInstruction("constant 0")
@SP // 12855
AM=M+1 // 12856
A=A-1 // 12857
M=0 // 12858

////PushInstruction("constant 0")
@SP // 12859
AM=M+1 // 12860
A=A-1 // 12861
M=0 // 12862

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=57}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12863
D=A // 12864
@14 // 12865
M=D // 12866
@Output.create // 12867
D=A // 12868
@13 // 12869
M=D // 12870
@Output.initMap.ret.57 // 12871
D=A // 12872
@CALL // 12873
0;JMP // 12874
(Output.initMap.ret.57)

////PopInstruction{address=temp 0}
@SP // 12875
AM=M-1 // 12876
D=M // 12877
@5 // 12878
M=D // 12879

////PushInstruction("constant 88")
@88 // 12880
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

////PushInstruction("constant 30")
@30 // 12898
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

////PushInstruction("constant 30")
@30 // 12916
D=A // 12917
@SP // 12918
AM=M+1 // 12919
A=A-1 // 12920
M=D // 12921

////PushInstruction("constant 30")
@30 // 12922
D=A // 12923
@SP // 12924
AM=M+1 // 12925
A=A-1 // 12926
M=D // 12927

////PushInstruction("constant 51")
@51 // 12928
D=A // 12929
@SP // 12930
AM=M+1 // 12931
A=A-1 // 12932
M=D // 12933

////PushInstruction("constant 51")
@51 // 12934
D=A // 12935
@SP // 12936
AM=M+1 // 12937
A=A-1 // 12938
M=D // 12939

////PushInstruction("constant 0")
@SP // 12940
AM=M+1 // 12941
A=A-1 // 12942
M=0 // 12943

////PushInstruction("constant 0")
@SP // 12944
AM=M+1 // 12945
A=A-1 // 12946
M=0 // 12947

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=58}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12948
D=A // 12949
@14 // 12950
M=D // 12951
@Output.create // 12952
D=A // 12953
@13 // 12954
M=D // 12955
@Output.initMap.ret.58 // 12956
D=A // 12957
@CALL // 12958
0;JMP // 12959
(Output.initMap.ret.58)

////PopInstruction{address=temp 0}
@SP // 12960
AM=M-1 // 12961
D=M // 12962
@5 // 12963
M=D // 12964

////PushInstruction("constant 89")
@89 // 12965
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

////PushInstruction("constant 51")
@51 // 12977
D=A // 12978
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=D // 12982

////PushInstruction("constant 51")
@51 // 12983
D=A // 12984
@SP // 12985
AM=M+1 // 12986
A=A-1 // 12987
M=D // 12988

////PushInstruction("constant 51")
@51 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994

////PushInstruction("constant 30")
@30 // 12995
D=A // 12996
@SP // 12997
AM=M+1 // 12998
A=A-1 // 12999
M=D // 13000

////PushInstruction("constant 12")
@12 // 13001
D=A // 13002
@SP // 13003
AM=M+1 // 13004
A=A-1 // 13005
M=D // 13006

////PushInstruction("constant 12")
@12 // 13007
D=A // 13008
@SP // 13009
AM=M+1 // 13010
A=A-1 // 13011
M=D // 13012

////PushInstruction("constant 12")
@12 // 13013
D=A // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018

////PushInstruction("constant 30")
@30 // 13019
D=A // 13020
@SP // 13021
AM=M+1 // 13022
A=A-1 // 13023
M=D // 13024

////PushInstruction("constant 0")
@SP // 13025
AM=M+1 // 13026
A=A-1 // 13027
M=0 // 13028

////PushInstruction("constant 0")
@SP // 13029
AM=M+1 // 13030
A=A-1 // 13031
M=0 // 13032

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=59}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13033
D=A // 13034
@14 // 13035
M=D // 13036
@Output.create // 13037
D=A // 13038
@13 // 13039
M=D // 13040
@Output.initMap.ret.59 // 13041
D=A // 13042
@CALL // 13043
0;JMP // 13044
(Output.initMap.ret.59)

////PopInstruction{address=temp 0}
@SP // 13045
AM=M-1 // 13046
D=M // 13047
@5 // 13048
M=D // 13049

////PushInstruction("constant 90")
@90 // 13050
D=A // 13051
@SP // 13052
AM=M+1 // 13053
A=A-1 // 13054
M=D // 13055

////PushInstruction("constant 63")
@63 // 13056
D=A // 13057
@SP // 13058
AM=M+1 // 13059
A=A-1 // 13060
M=D // 13061

////PushInstruction("constant 51")
@51 // 13062
D=A // 13063
@SP // 13064
AM=M+1 // 13065
A=A-1 // 13066
M=D // 13067

////PushInstruction("constant 49")
@49 // 13068
D=A // 13069
@SP // 13070
AM=M+1 // 13071
A=A-1 // 13072
M=D // 13073

////PushInstruction("constant 24")
@24 // 13074
D=A // 13075
@SP // 13076
AM=M+1 // 13077
A=A-1 // 13078
M=D // 13079

////PushInstruction("constant 12")
@12 // 13080
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

////PushInstruction("constant 35")
@35 // 13092
D=A // 13093
@SP // 13094
AM=M+1 // 13095
A=A-1 // 13096
M=D // 13097

////PushInstruction("constant 51")
@51 // 13098
D=A // 13099
@SP // 13100
AM=M+1 // 13101
A=A-1 // 13102
M=D // 13103

////PushInstruction("constant 63")
@63 // 13104
D=A // 13105
@SP // 13106
AM=M+1 // 13107
A=A-1 // 13108
M=D // 13109

////PushInstruction("constant 0")
@SP // 13110
AM=M+1 // 13111
A=A-1 // 13112
M=0 // 13113

////PushInstruction("constant 0")
@SP // 13114
AM=M+1 // 13115
A=A-1 // 13116
M=0 // 13117

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=60}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13118
D=A // 13119
@14 // 13120
M=D // 13121
@Output.create // 13122
D=A // 13123
@13 // 13124
M=D // 13125
@Output.initMap.ret.60 // 13126
D=A // 13127
@CALL // 13128
0;JMP // 13129
(Output.initMap.ret.60)

////PopInstruction{address=temp 0}
@SP // 13130
AM=M-1 // 13131
D=M // 13132
@5 // 13133
M=D // 13134

////PushInstruction("constant 91")
@91 // 13135
D=A // 13136
@SP // 13137
AM=M+1 // 13138
A=A-1 // 13139
M=D // 13140

////PushInstruction("constant 30")
@30 // 13141
D=A // 13142
@SP // 13143
AM=M+1 // 13144
A=A-1 // 13145
M=D // 13146

////PushInstruction("constant 6")
@6 // 13147
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

////PushInstruction("constant 6")
@6 // 13159
D=A // 13160
@SP // 13161
AM=M+1 // 13162
A=A-1 // 13163
M=D // 13164

////PushInstruction("constant 6")
@6 // 13165
D=A // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=D // 13170

////PushInstruction("constant 6")
@6 // 13171
D=A // 13172
@SP // 13173
AM=M+1 // 13174
A=A-1 // 13175
M=D // 13176

////PushInstruction("constant 6")
@6 // 13177
D=A // 13178
@SP // 13179
AM=M+1 // 13180
A=A-1 // 13181
M=D // 13182

////PushInstruction("constant 6")
@6 // 13183
D=A // 13184
@SP // 13185
AM=M+1 // 13186
A=A-1 // 13187
M=D // 13188

////PushInstruction("constant 30")
@30 // 13189
D=A // 13190
@SP // 13191
AM=M+1 // 13192
A=A-1 // 13193
M=D // 13194

////PushInstruction("constant 0")
@SP // 13195
AM=M+1 // 13196
A=A-1 // 13197
M=0 // 13198

////PushInstruction("constant 0")
@SP // 13199
AM=M+1 // 13200
A=A-1 // 13201
M=0 // 13202

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=61}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13203
D=A // 13204
@14 // 13205
M=D // 13206
@Output.create // 13207
D=A // 13208
@13 // 13209
M=D // 13210
@Output.initMap.ret.61 // 13211
D=A // 13212
@CALL // 13213
0;JMP // 13214
(Output.initMap.ret.61)

////PopInstruction{address=temp 0}
@SP // 13215
AM=M-1 // 13216
D=M // 13217
@5 // 13218
M=D // 13219

////PushInstruction("constant 92")
@92 // 13220
D=A // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225

////PushInstruction("constant 0")
@SP // 13226
AM=M+1 // 13227
A=A-1 // 13228
M=0 // 13229

////PushInstruction("constant 0")
@SP // 13230
AM=M+1 // 13231
A=A-1 // 13232
M=0 // 13233

////PushInstruction("constant 1")
@SP // 13234
AM=M+1 // 13235
A=A-1 // 13236
M=1 // 13237

////PushInstruction("constant 3")
@3 // 13238
D=A // 13239
@SP // 13240
AM=M+1 // 13241
A=A-1 // 13242
M=D // 13243

////PushInstruction("constant 6")
@6 // 13244
D=A // 13245
@SP // 13246
AM=M+1 // 13247
A=A-1 // 13248
M=D // 13249

////PushInstruction("constant 12")
@12 // 13250
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

////PushInstruction("constant 48")
@48 // 13262
D=A // 13263
@SP // 13264
AM=M+1 // 13265
A=A-1 // 13266
M=D // 13267

////PushInstruction("constant 32")
@32 // 13268
D=A // 13269
@SP // 13270
AM=M+1 // 13271
A=A-1 // 13272
M=D // 13273

////PushInstruction("constant 0")
@SP // 13274
AM=M+1 // 13275
A=A-1 // 13276
M=0 // 13277

////PushInstruction("constant 0")
@SP // 13278
AM=M+1 // 13279
A=A-1 // 13280
M=0 // 13281

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=62}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13282
D=A // 13283
@14 // 13284
M=D // 13285
@Output.create // 13286
D=A // 13287
@13 // 13288
M=D // 13289
@Output.initMap.ret.62 // 13290
D=A // 13291
@CALL // 13292
0;JMP // 13293
(Output.initMap.ret.62)

////PopInstruction{address=temp 0}
@SP // 13294
AM=M-1 // 13295
D=M // 13296
@5 // 13297
M=D // 13298

////PushInstruction("constant 93")
@93 // 13299
D=A // 13300
@SP // 13301
AM=M+1 // 13302
A=A-1 // 13303
M=D // 13304

////PushInstruction("constant 30")
@30 // 13305
D=A // 13306
@SP // 13307
AM=M+1 // 13308
A=A-1 // 13309
M=D // 13310

////PushInstruction("constant 24")
@24 // 13311
D=A // 13312
@SP // 13313
AM=M+1 // 13314
A=A-1 // 13315
M=D // 13316

////PushInstruction("constant 24")
@24 // 13317
D=A // 13318
@SP // 13319
AM=M+1 // 13320
A=A-1 // 13321
M=D // 13322

////PushInstruction("constant 24")
@24 // 13323
D=A // 13324
@SP // 13325
AM=M+1 // 13326
A=A-1 // 13327
M=D // 13328

////PushInstruction("constant 24")
@24 // 13329
D=A // 13330
@SP // 13331
AM=M+1 // 13332
A=A-1 // 13333
M=D // 13334

////PushInstruction("constant 24")
@24 // 13335
D=A // 13336
@SP // 13337
AM=M+1 // 13338
A=A-1 // 13339
M=D // 13340

////PushInstruction("constant 24")
@24 // 13341
D=A // 13342
@SP // 13343
AM=M+1 // 13344
A=A-1 // 13345
M=D // 13346

////PushInstruction("constant 24")
@24 // 13347
D=A // 13348
@SP // 13349
AM=M+1 // 13350
A=A-1 // 13351
M=D // 13352

////PushInstruction("constant 30")
@30 // 13353
D=A // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358

////PushInstruction("constant 0")
@SP // 13359
AM=M+1 // 13360
A=A-1 // 13361
M=0 // 13362

////PushInstruction("constant 0")
@SP // 13363
AM=M+1 // 13364
A=A-1 // 13365
M=0 // 13366

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=63}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13367
D=A // 13368
@14 // 13369
M=D // 13370
@Output.create // 13371
D=A // 13372
@13 // 13373
M=D // 13374
@Output.initMap.ret.63 // 13375
D=A // 13376
@CALL // 13377
0;JMP // 13378
(Output.initMap.ret.63)

////PopInstruction{address=temp 0}
@SP // 13379
AM=M-1 // 13380
D=M // 13381
@5 // 13382
M=D // 13383

////PushInstruction("constant 94")
@94 // 13384
D=A // 13385
@SP // 13386
AM=M+1 // 13387
A=A-1 // 13388
M=D // 13389

////PushInstruction("constant 8")
@8 // 13390
D=A // 13391
@SP // 13392
AM=M+1 // 13393
A=A-1 // 13394
M=D // 13395

////PushInstruction("constant 28")
@28 // 13396
D=A // 13397
@SP // 13398
AM=M+1 // 13399
A=A-1 // 13400
M=D // 13401

////PushInstruction("constant 54")
@54 // 13402
D=A // 13403
@SP // 13404
AM=M+1 // 13405
A=A-1 // 13406
M=D // 13407

////PushInstruction("constant 0")
@SP // 13408
AM=M+1 // 13409
A=A-1 // 13410
M=0 // 13411

////PushInstruction("constant 0")
@SP // 13412
AM=M+1 // 13413
A=A-1 // 13414
M=0 // 13415

////PushInstruction("constant 0")
@SP // 13416
AM=M+1 // 13417
A=A-1 // 13418
M=0 // 13419

////PushInstruction("constant 0")
@SP // 13420
AM=M+1 // 13421
A=A-1 // 13422
M=0 // 13423

////PushInstruction("constant 0")
@SP // 13424
AM=M+1 // 13425
A=A-1 // 13426
M=0 // 13427

////PushInstruction("constant 0")
@SP // 13428
AM=M+1 // 13429
A=A-1 // 13430
M=0 // 13431

////PushInstruction("constant 0")
@SP // 13432
AM=M+1 // 13433
A=A-1 // 13434
M=0 // 13435

////PushInstruction("constant 0")
@SP // 13436
AM=M+1 // 13437
A=A-1 // 13438
M=0 // 13439

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=64}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13440
D=A // 13441
@14 // 13442
M=D // 13443
@Output.create // 13444
D=A // 13445
@13 // 13446
M=D // 13447
@Output.initMap.ret.64 // 13448
D=A // 13449
@CALL // 13450
0;JMP // 13451
(Output.initMap.ret.64)

////PopInstruction{address=temp 0}
@SP // 13452
AM=M-1 // 13453
D=M // 13454
@5 // 13455
M=D // 13456

////PushInstruction("constant 95")
@95 // 13457
D=A // 13458
@SP // 13459
AM=M+1 // 13460
A=A-1 // 13461
M=D // 13462

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

////PushInstruction("constant 0")
@SP // 13491
AM=M+1 // 13492
A=A-1 // 13493
M=0 // 13494

////PushInstruction("constant 0")
@SP // 13495
AM=M+1 // 13496
A=A-1 // 13497
M=0 // 13498

////PushInstruction("constant 63")
@63 // 13499
D=A // 13500
@SP // 13501
AM=M+1 // 13502
A=A-1 // 13503
M=D // 13504

////PushInstruction("constant 0")
@SP // 13505
AM=M+1 // 13506
A=A-1 // 13507
M=0 // 13508

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=65}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13509
D=A // 13510
@14 // 13511
M=D // 13512
@Output.create // 13513
D=A // 13514
@13 // 13515
M=D // 13516
@Output.initMap.ret.65 // 13517
D=A // 13518
@CALL // 13519
0;JMP // 13520
(Output.initMap.ret.65)

////PopInstruction{address=temp 0}
@SP // 13521
AM=M-1 // 13522
D=M // 13523
@5 // 13524
M=D // 13525

////PushInstruction("constant 96")
@96 // 13526
D=A // 13527
@SP // 13528
AM=M+1 // 13529
A=A-1 // 13530
M=D // 13531

////PushInstruction("constant 6")
@6 // 13532
D=A // 13533
@SP // 13534
AM=M+1 // 13535
A=A-1 // 13536
M=D // 13537

////PushInstruction("constant 12")
@12 // 13538
D=A // 13539
@SP // 13540
AM=M+1 // 13541
A=A-1 // 13542
M=D // 13543

////PushInstruction("constant 24")
@24 // 13544
D=A // 13545
@SP // 13546
AM=M+1 // 13547
A=A-1 // 13548
M=D // 13549

////PushInstruction("constant 0")
@SP // 13550
AM=M+1 // 13551
A=A-1 // 13552
M=0 // 13553

////PushInstruction("constant 0")
@SP // 13554
AM=M+1 // 13555
A=A-1 // 13556
M=0 // 13557

////PushInstruction("constant 0")
@SP // 13558
AM=M+1 // 13559
A=A-1 // 13560
M=0 // 13561

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

////PushInstruction("constant 0")
@SP // 13570
AM=M+1 // 13571
A=A-1 // 13572
M=0 // 13573

////PushInstruction("constant 0")
@SP // 13574
AM=M+1 // 13575
A=A-1 // 13576
M=0 // 13577

////PushInstruction("constant 0")
@SP // 13578
AM=M+1 // 13579
A=A-1 // 13580
M=0 // 13581

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=66}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13582
D=A // 13583
@14 // 13584
M=D // 13585
@Output.create // 13586
D=A // 13587
@13 // 13588
M=D // 13589
@Output.initMap.ret.66 // 13590
D=A // 13591
@CALL // 13592
0;JMP // 13593
(Output.initMap.ret.66)

////PopInstruction{address=temp 0}
@SP // 13594
AM=M-1 // 13595
D=M // 13596
@5 // 13597
M=D // 13598

////PushInstruction("constant 97")
@97 // 13599
D=A // 13600
@SP // 13601
AM=M+1 // 13602
A=A-1 // 13603
M=D // 13604

////PushInstruction("constant 0")
@SP // 13605
AM=M+1 // 13606
A=A-1 // 13607
M=0 // 13608

////PushInstruction("constant 0")
@SP // 13609
AM=M+1 // 13610
A=A-1 // 13611
M=0 // 13612

////PushInstruction("constant 0")
@SP // 13613
AM=M+1 // 13614
A=A-1 // 13615
M=0 // 13616

////PushInstruction("constant 14")
@14 // 13617
D=A // 13618
@SP // 13619
AM=M+1 // 13620
A=A-1 // 13621
M=D // 13622

////PushInstruction("constant 24")
@24 // 13623
D=A // 13624
@SP // 13625
AM=M+1 // 13626
A=A-1 // 13627
M=D // 13628

////PushInstruction("constant 30")
@30 // 13629
D=A // 13630
@SP // 13631
AM=M+1 // 13632
A=A-1 // 13633
M=D // 13634

////PushInstruction("constant 27")
@27 // 13635
D=A // 13636
@SP // 13637
AM=M+1 // 13638
A=A-1 // 13639
M=D // 13640

////PushInstruction("constant 27")
@27 // 13641
D=A // 13642
@SP // 13643
AM=M+1 // 13644
A=A-1 // 13645
M=D // 13646

////PushInstruction("constant 54")
@54 // 13647
D=A // 13648
@SP // 13649
AM=M+1 // 13650
A=A-1 // 13651
M=D // 13652

////PushInstruction("constant 0")
@SP // 13653
AM=M+1 // 13654
A=A-1 // 13655
M=0 // 13656

////PushInstruction("constant 0")
@SP // 13657
AM=M+1 // 13658
A=A-1 // 13659
M=0 // 13660

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=67}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13661
D=A // 13662
@14 // 13663
M=D // 13664
@Output.create // 13665
D=A // 13666
@13 // 13667
M=D // 13668
@Output.initMap.ret.67 // 13669
D=A // 13670
@CALL // 13671
0;JMP // 13672
(Output.initMap.ret.67)

////PopInstruction{address=temp 0}
@SP // 13673
AM=M-1 // 13674
D=M // 13675
@5 // 13676
M=D // 13677

////PushInstruction("constant 98")
@98 // 13678
D=A // 13679
@SP // 13680
AM=M+1 // 13681
A=A-1 // 13682
M=D // 13683

////PushInstruction("constant 3")
@3 // 13684
D=A // 13685
@SP // 13686
AM=M+1 // 13687
A=A-1 // 13688
M=D // 13689

////PushInstruction("constant 3")
@3 // 13690
D=A // 13691
@SP // 13692
AM=M+1 // 13693
A=A-1 // 13694
M=D // 13695

////PushInstruction("constant 3")
@3 // 13696
D=A // 13697
@SP // 13698
AM=M+1 // 13699
A=A-1 // 13700
M=D // 13701

////PushInstruction("constant 15")
@15 // 13702
D=A // 13703
@SP // 13704
AM=M+1 // 13705
A=A-1 // 13706
M=D // 13707

////PushInstruction("constant 27")
@27 // 13708
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

////PushInstruction("constant 51")
@51 // 13720
D=A // 13721
@SP // 13722
AM=M+1 // 13723
A=A-1 // 13724
M=D // 13725

////PushInstruction("constant 51")
@51 // 13726
D=A // 13727
@SP // 13728
AM=M+1 // 13729
A=A-1 // 13730
M=D // 13731

////PushInstruction("constant 30")
@30 // 13732
D=A // 13733
@SP // 13734
AM=M+1 // 13735
A=A-1 // 13736
M=D // 13737

////PushInstruction("constant 0")
@SP // 13738
AM=M+1 // 13739
A=A-1 // 13740
M=0 // 13741

////PushInstruction("constant 0")
@SP // 13742
AM=M+1 // 13743
A=A-1 // 13744
M=0 // 13745

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=68}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13746
D=A // 13747
@14 // 13748
M=D // 13749
@Output.create // 13750
D=A // 13751
@13 // 13752
M=D // 13753
@Output.initMap.ret.68 // 13754
D=A // 13755
@CALL // 13756
0;JMP // 13757
(Output.initMap.ret.68)

////PopInstruction{address=temp 0}
@SP // 13758
AM=M-1 // 13759
D=M // 13760
@5 // 13761
M=D // 13762

////PushInstruction("constant 99")
@99 // 13763
D=A // 13764
@SP // 13765
AM=M+1 // 13766
A=A-1 // 13767
M=D // 13768

////PushInstruction("constant 0")
@SP // 13769
AM=M+1 // 13770
A=A-1 // 13771
M=0 // 13772

////PushInstruction("constant 0")
@SP // 13773
AM=M+1 // 13774
A=A-1 // 13775
M=0 // 13776

////PushInstruction("constant 0")
@SP // 13777
AM=M+1 // 13778
A=A-1 // 13779
M=0 // 13780

////PushInstruction("constant 30")
@30 // 13781
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

////PushInstruction("constant 3")
@3 // 13793
D=A // 13794
@SP // 13795
AM=M+1 // 13796
A=A-1 // 13797
M=D // 13798

////PushInstruction("constant 3")
@3 // 13799
D=A // 13800
@SP // 13801
AM=M+1 // 13802
A=A-1 // 13803
M=D // 13804

////PushInstruction("constant 51")
@51 // 13805
D=A // 13806
@SP // 13807
AM=M+1 // 13808
A=A-1 // 13809
M=D // 13810

////PushInstruction("constant 30")
@30 // 13811
D=A // 13812
@SP // 13813
AM=M+1 // 13814
A=A-1 // 13815
M=D // 13816

////PushInstruction("constant 0")
@SP // 13817
AM=M+1 // 13818
A=A-1 // 13819
M=0 // 13820

////PushInstruction("constant 0")
@SP // 13821
AM=M+1 // 13822
A=A-1 // 13823
M=0 // 13824

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=69}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13825
D=A // 13826
@14 // 13827
M=D // 13828
@Output.create // 13829
D=A // 13830
@13 // 13831
M=D // 13832
@Output.initMap.ret.69 // 13833
D=A // 13834
@CALL // 13835
0;JMP // 13836
(Output.initMap.ret.69)

////PopInstruction{address=temp 0}
@SP // 13837
AM=M-1 // 13838
D=M // 13839
@5 // 13840
M=D // 13841

////PushInstruction("constant 100")
@100 // 13842
D=A // 13843
@SP // 13844
AM=M+1 // 13845
A=A-1 // 13846
M=D // 13847

////PushInstruction("constant 48")
@48 // 13848
D=A // 13849
@SP // 13850
AM=M+1 // 13851
A=A-1 // 13852
M=D // 13853

////PushInstruction("constant 48")
@48 // 13854
D=A // 13855
@SP // 13856
AM=M+1 // 13857
A=A-1 // 13858
M=D // 13859

////PushInstruction("constant 48")
@48 // 13860
D=A // 13861
@SP // 13862
AM=M+1 // 13863
A=A-1 // 13864
M=D // 13865

////PushInstruction("constant 60")
@60 // 13866
D=A // 13867
@SP // 13868
AM=M+1 // 13869
A=A-1 // 13870
M=D // 13871

////PushInstruction("constant 54")
@54 // 13872
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

////PushInstruction("constant 51")
@51 // 13884
D=A // 13885
@SP // 13886
AM=M+1 // 13887
A=A-1 // 13888
M=D // 13889

////PushInstruction("constant 51")
@51 // 13890
D=A // 13891
@SP // 13892
AM=M+1 // 13893
A=A-1 // 13894
M=D // 13895

////PushInstruction("constant 30")
@30 // 13896
D=A // 13897
@SP // 13898
AM=M+1 // 13899
A=A-1 // 13900
M=D // 13901

////PushInstruction("constant 0")
@SP // 13902
AM=M+1 // 13903
A=A-1 // 13904
M=0 // 13905

////PushInstruction("constant 0")
@SP // 13906
AM=M+1 // 13907
A=A-1 // 13908
M=0 // 13909

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=70}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13910
D=A // 13911
@14 // 13912
M=D // 13913
@Output.create // 13914
D=A // 13915
@13 // 13916
M=D // 13917
@Output.initMap.ret.70 // 13918
D=A // 13919
@CALL // 13920
0;JMP // 13921
(Output.initMap.ret.70)

////PopInstruction{address=temp 0}
@SP // 13922
AM=M-1 // 13923
D=M // 13924
@5 // 13925
M=D // 13926

////PushInstruction("constant 101")
@101 // 13927
D=A // 13928
@SP // 13929
AM=M+1 // 13930
A=A-1 // 13931
M=D // 13932

////PushInstruction("constant 0")
@SP // 13933
AM=M+1 // 13934
A=A-1 // 13935
M=0 // 13936

////PushInstruction("constant 0")
@SP // 13937
AM=M+1 // 13938
A=A-1 // 13939
M=0 // 13940

////PushInstruction("constant 0")
@SP // 13941
AM=M+1 // 13942
A=A-1 // 13943
M=0 // 13944

////PushInstruction("constant 30")
@30 // 13945
D=A // 13946
@SP // 13947
AM=M+1 // 13948
A=A-1 // 13949
M=D // 13950

////PushInstruction("constant 51")
@51 // 13951
D=A // 13952
@SP // 13953
AM=M+1 // 13954
A=A-1 // 13955
M=D // 13956

////PushInstruction("constant 63")
@63 // 13957
D=A // 13958
@SP // 13959
AM=M+1 // 13960
A=A-1 // 13961
M=D // 13962

////PushInstruction("constant 3")
@3 // 13963
D=A // 13964
@SP // 13965
AM=M+1 // 13966
A=A-1 // 13967
M=D // 13968

////PushInstruction("constant 51")
@51 // 13969
D=A // 13970
@SP // 13971
AM=M+1 // 13972
A=A-1 // 13973
M=D // 13974

////PushInstruction("constant 30")
@30 // 13975
D=A // 13976
@SP // 13977
AM=M+1 // 13978
A=A-1 // 13979
M=D // 13980

////PushInstruction("constant 0")
@SP // 13981
AM=M+1 // 13982
A=A-1 // 13983
M=0 // 13984

////PushInstruction("constant 0")
@SP // 13985
AM=M+1 // 13986
A=A-1 // 13987
M=0 // 13988

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=71}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13989
D=A // 13990
@14 // 13991
M=D // 13992
@Output.create // 13993
D=A // 13994
@13 // 13995
M=D // 13996
@Output.initMap.ret.71 // 13997
D=A // 13998
@CALL // 13999
0;JMP // 14000
(Output.initMap.ret.71)

////PopInstruction{address=temp 0}
@SP // 14001
AM=M-1 // 14002
D=M // 14003
@5 // 14004
M=D // 14005

////PushInstruction("constant 102")
@102 // 14006
D=A // 14007
@SP // 14008
AM=M+1 // 14009
A=A-1 // 14010
M=D // 14011

////PushInstruction("constant 28")
@28 // 14012
D=A // 14013
@SP // 14014
AM=M+1 // 14015
A=A-1 // 14016
M=D // 14017

////PushInstruction("constant 54")
@54 // 14018
D=A // 14019
@SP // 14020
AM=M+1 // 14021
A=A-1 // 14022
M=D // 14023

////PushInstruction("constant 38")
@38 // 14024
D=A // 14025
@SP // 14026
AM=M+1 // 14027
A=A-1 // 14028
M=D // 14029

////PushInstruction("constant 6")
@6 // 14030
D=A // 14031
@SP // 14032
AM=M+1 // 14033
A=A-1 // 14034
M=D // 14035

////PushInstruction("constant 15")
@15 // 14036
D=A // 14037
@SP // 14038
AM=M+1 // 14039
A=A-1 // 14040
M=D // 14041

////PushInstruction("constant 6")
@6 // 14042
D=A // 14043
@SP // 14044
AM=M+1 // 14045
A=A-1 // 14046
M=D // 14047

////PushInstruction("constant 6")
@6 // 14048
D=A // 14049
@SP // 14050
AM=M+1 // 14051
A=A-1 // 14052
M=D // 14053

////PushInstruction("constant 6")
@6 // 14054
D=A // 14055
@SP // 14056
AM=M+1 // 14057
A=A-1 // 14058
M=D // 14059

////PushInstruction("constant 15")
@15 // 14060
D=A // 14061
@SP // 14062
AM=M+1 // 14063
A=A-1 // 14064
M=D // 14065

////PushInstruction("constant 0")
@SP // 14066
AM=M+1 // 14067
A=A-1 // 14068
M=0 // 14069

////PushInstruction("constant 0")
@SP // 14070
AM=M+1 // 14071
A=A-1 // 14072
M=0 // 14073

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=72}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14074
D=A // 14075
@14 // 14076
M=D // 14077
@Output.create // 14078
D=A // 14079
@13 // 14080
M=D // 14081
@Output.initMap.ret.72 // 14082
D=A // 14083
@CALL // 14084
0;JMP // 14085
(Output.initMap.ret.72)

////PopInstruction{address=temp 0}
@SP // 14086
AM=M-1 // 14087
D=M // 14088
@5 // 14089
M=D // 14090

////PushInstruction("constant 103")
@103 // 14091
D=A // 14092
@SP // 14093
AM=M+1 // 14094
A=A-1 // 14095
M=D // 14096

////PushInstruction("constant 0")
@SP // 14097
AM=M+1 // 14098
A=A-1 // 14099
M=0 // 14100

////PushInstruction("constant 0")
@SP // 14101
AM=M+1 // 14102
A=A-1 // 14103
M=0 // 14104

////PushInstruction("constant 30")
@30 // 14105
D=A // 14106
@SP // 14107
AM=M+1 // 14108
A=A-1 // 14109
M=D // 14110

////PushInstruction("constant 51")
@51 // 14111
D=A // 14112
@SP // 14113
AM=M+1 // 14114
A=A-1 // 14115
M=D // 14116

////PushInstruction("constant 51")
@51 // 14117
D=A // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122

////PushInstruction("constant 51")
@51 // 14123
D=A // 14124
@SP // 14125
AM=M+1 // 14126
A=A-1 // 14127
M=D // 14128

////PushInstruction("constant 62")
@62 // 14129
D=A // 14130
@SP // 14131
AM=M+1 // 14132
A=A-1 // 14133
M=D // 14134

////PushInstruction("constant 48")
@48 // 14135
D=A // 14136
@SP // 14137
AM=M+1 // 14138
A=A-1 // 14139
M=D // 14140

////PushInstruction("constant 51")
@51 // 14141
D=A // 14142
@SP // 14143
AM=M+1 // 14144
A=A-1 // 14145
M=D // 14146

////PushInstruction("constant 30")
@30 // 14147
D=A // 14148
@SP // 14149
AM=M+1 // 14150
A=A-1 // 14151
M=D // 14152

////PushInstruction("constant 0")
@SP // 14153
AM=M+1 // 14154
A=A-1 // 14155
M=0 // 14156

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=73}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14157
D=A // 14158
@14 // 14159
M=D // 14160
@Output.create // 14161
D=A // 14162
@13 // 14163
M=D // 14164
@Output.initMap.ret.73 // 14165
D=A // 14166
@CALL // 14167
0;JMP // 14168
(Output.initMap.ret.73)

////PopInstruction{address=temp 0}
@SP // 14169
AM=M-1 // 14170
D=M // 14171
@5 // 14172
M=D // 14173

////PushInstruction("constant 104")
@104 // 14174
D=A // 14175
@SP // 14176
AM=M+1 // 14177
A=A-1 // 14178
M=D // 14179

////PushInstruction("constant 3")
@3 // 14180
D=A // 14181
@SP // 14182
AM=M+1 // 14183
A=A-1 // 14184
M=D // 14185

////PushInstruction("constant 3")
@3 // 14186
D=A // 14187
@SP // 14188
AM=M+1 // 14189
A=A-1 // 14190
M=D // 14191

////PushInstruction("constant 3")
@3 // 14192
D=A // 14193
@SP // 14194
AM=M+1 // 14195
A=A-1 // 14196
M=D // 14197

////PushInstruction("constant 27")
@27 // 14198
D=A // 14199
@SP // 14200
AM=M+1 // 14201
A=A-1 // 14202
M=D // 14203

////PushInstruction("constant 55")
@55 // 14204
D=A // 14205
@SP // 14206
AM=M+1 // 14207
A=A-1 // 14208
M=D // 14209

////PushInstruction("constant 51")
@51 // 14210
D=A // 14211
@SP // 14212
AM=M+1 // 14213
A=A-1 // 14214
M=D // 14215

////PushInstruction("constant 51")
@51 // 14216
D=A // 14217
@SP // 14218
AM=M+1 // 14219
A=A-1 // 14220
M=D // 14221

////PushInstruction("constant 51")
@51 // 14222
D=A // 14223
@SP // 14224
AM=M+1 // 14225
A=A-1 // 14226
M=D // 14227

////PushInstruction("constant 51")
@51 // 14228
D=A // 14229
@SP // 14230
AM=M+1 // 14231
A=A-1 // 14232
M=D // 14233

////PushInstruction("constant 0")
@SP // 14234
AM=M+1 // 14235
A=A-1 // 14236
M=0 // 14237

////PushInstruction("constant 0")
@SP // 14238
AM=M+1 // 14239
A=A-1 // 14240
M=0 // 14241

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=74}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14242
D=A // 14243
@14 // 14244
M=D // 14245
@Output.create // 14246
D=A // 14247
@13 // 14248
M=D // 14249
@Output.initMap.ret.74 // 14250
D=A // 14251
@CALL // 14252
0;JMP // 14253
(Output.initMap.ret.74)

////PopInstruction{address=temp 0}
@SP // 14254
AM=M-1 // 14255
D=M // 14256
@5 // 14257
M=D // 14258

////PushInstruction("constant 105")
@105 // 14259
D=A // 14260
@SP // 14261
AM=M+1 // 14262
A=A-1 // 14263
M=D // 14264

////PushInstruction("constant 12")
@12 // 14265
D=A // 14266
@SP // 14267
AM=M+1 // 14268
A=A-1 // 14269
M=D // 14270

////PushInstruction("constant 12")
@12 // 14271
D=A // 14272
@SP // 14273
AM=M+1 // 14274
A=A-1 // 14275
M=D // 14276

////PushInstruction("constant 0")
@SP // 14277
AM=M+1 // 14278
A=A-1 // 14279
M=0 // 14280

////PushInstruction("constant 14")
@14 // 14281
D=A // 14282
@SP // 14283
AM=M+1 // 14284
A=A-1 // 14285
M=D // 14286

////PushInstruction("constant 12")
@12 // 14287
D=A // 14288
@SP // 14289
AM=M+1 // 14290
A=A-1 // 14291
M=D // 14292

////PushInstruction("constant 12")
@12 // 14293
D=A // 14294
@SP // 14295
AM=M+1 // 14296
A=A-1 // 14297
M=D // 14298

////PushInstruction("constant 12")
@12 // 14299
D=A // 14300
@SP // 14301
AM=M+1 // 14302
A=A-1 // 14303
M=D // 14304

////PushInstruction("constant 12")
@12 // 14305
D=A // 14306
@SP // 14307
AM=M+1 // 14308
A=A-1 // 14309
M=D // 14310

////PushInstruction("constant 30")
@30 // 14311
D=A // 14312
@SP // 14313
AM=M+1 // 14314
A=A-1 // 14315
M=D // 14316

////PushInstruction("constant 0")
@SP // 14317
AM=M+1 // 14318
A=A-1 // 14319
M=0 // 14320

////PushInstruction("constant 0")
@SP // 14321
AM=M+1 // 14322
A=A-1 // 14323
M=0 // 14324

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=75}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14325
D=A // 14326
@14 // 14327
M=D // 14328
@Output.create // 14329
D=A // 14330
@13 // 14331
M=D // 14332
@Output.initMap.ret.75 // 14333
D=A // 14334
@CALL // 14335
0;JMP // 14336
(Output.initMap.ret.75)

////PopInstruction{address=temp 0}
@SP // 14337
AM=M-1 // 14338
D=M // 14339
@5 // 14340
M=D // 14341

////PushInstruction("constant 106")
@106 // 14342
D=A // 14343
@SP // 14344
AM=M+1 // 14345
A=A-1 // 14346
M=D // 14347

////PushInstruction("constant 48")
@48 // 14348
D=A // 14349
@SP // 14350
AM=M+1 // 14351
A=A-1 // 14352
M=D // 14353

////PushInstruction("constant 48")
@48 // 14354
D=A // 14355
@SP // 14356
AM=M+1 // 14357
A=A-1 // 14358
M=D // 14359

////PushInstruction("constant 0")
@SP // 14360
AM=M+1 // 14361
A=A-1 // 14362
M=0 // 14363

////PushInstruction("constant 56")
@56 // 14364
D=A // 14365
@SP // 14366
AM=M+1 // 14367
A=A-1 // 14368
M=D // 14369

////PushInstruction("constant 48")
@48 // 14370
D=A // 14371
@SP // 14372
AM=M+1 // 14373
A=A-1 // 14374
M=D // 14375

////PushInstruction("constant 48")
@48 // 14376
D=A // 14377
@SP // 14378
AM=M+1 // 14379
A=A-1 // 14380
M=D // 14381

////PushInstruction("constant 48")
@48 // 14382
D=A // 14383
@SP // 14384
AM=M+1 // 14385
A=A-1 // 14386
M=D // 14387

////PushInstruction("constant 48")
@48 // 14388
D=A // 14389
@SP // 14390
AM=M+1 // 14391
A=A-1 // 14392
M=D // 14393

////PushInstruction("constant 51")
@51 // 14394
D=A // 14395
@SP // 14396
AM=M+1 // 14397
A=A-1 // 14398
M=D // 14399

////PushInstruction("constant 30")
@30 // 14400
D=A // 14401
@SP // 14402
AM=M+1 // 14403
A=A-1 // 14404
M=D // 14405

////PushInstruction("constant 0")
@SP // 14406
AM=M+1 // 14407
A=A-1 // 14408
M=0 // 14409

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=76}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14410
D=A // 14411
@14 // 14412
M=D // 14413
@Output.create // 14414
D=A // 14415
@13 // 14416
M=D // 14417
@Output.initMap.ret.76 // 14418
D=A // 14419
@CALL // 14420
0;JMP // 14421
(Output.initMap.ret.76)

////PopInstruction{address=temp 0}
@SP // 14422
AM=M-1 // 14423
D=M // 14424
@5 // 14425
M=D // 14426

////PushInstruction("constant 107")
@107 // 14427
D=A // 14428
@SP // 14429
AM=M+1 // 14430
A=A-1 // 14431
M=D // 14432

////PushInstruction("constant 3")
@3 // 14433
D=A // 14434
@SP // 14435
AM=M+1 // 14436
A=A-1 // 14437
M=D // 14438

////PushInstruction("constant 3")
@3 // 14439
D=A // 14440
@SP // 14441
AM=M+1 // 14442
A=A-1 // 14443
M=D // 14444

////PushInstruction("constant 3")
@3 // 14445
D=A // 14446
@SP // 14447
AM=M+1 // 14448
A=A-1 // 14449
M=D // 14450

////PushInstruction("constant 51")
@51 // 14451
D=A // 14452
@SP // 14453
AM=M+1 // 14454
A=A-1 // 14455
M=D // 14456

////PushInstruction("constant 27")
@27 // 14457
D=A // 14458
@SP // 14459
AM=M+1 // 14460
A=A-1 // 14461
M=D // 14462

////PushInstruction("constant 15")
@15 // 14463
D=A // 14464
@SP // 14465
AM=M+1 // 14466
A=A-1 // 14467
M=D // 14468

////PushInstruction("constant 15")
@15 // 14469
D=A // 14470
@SP // 14471
AM=M+1 // 14472
A=A-1 // 14473
M=D // 14474

////PushInstruction("constant 27")
@27 // 14475
D=A // 14476
@SP // 14477
AM=M+1 // 14478
A=A-1 // 14479
M=D // 14480

////PushInstruction("constant 51")
@51 // 14481
D=A // 14482
@SP // 14483
AM=M+1 // 14484
A=A-1 // 14485
M=D // 14486

////PushInstruction("constant 0")
@SP // 14487
AM=M+1 // 14488
A=A-1 // 14489
M=0 // 14490

////PushInstruction("constant 0")
@SP // 14491
AM=M+1 // 14492
A=A-1 // 14493
M=0 // 14494

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=77}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14495
D=A // 14496
@14 // 14497
M=D // 14498
@Output.create // 14499
D=A // 14500
@13 // 14501
M=D // 14502
@Output.initMap.ret.77 // 14503
D=A // 14504
@CALL // 14505
0;JMP // 14506
(Output.initMap.ret.77)

////PopInstruction{address=temp 0}
@SP // 14507
AM=M-1 // 14508
D=M // 14509
@5 // 14510
M=D // 14511

////PushInstruction("constant 108")
@108 // 14512
D=A // 14513
@SP // 14514
AM=M+1 // 14515
A=A-1 // 14516
M=D // 14517

////PushInstruction("constant 14")
@14 // 14518
D=A // 14519
@SP // 14520
AM=M+1 // 14521
A=A-1 // 14522
M=D // 14523

////PushInstruction("constant 12")
@12 // 14524
D=A // 14525
@SP // 14526
AM=M+1 // 14527
A=A-1 // 14528
M=D // 14529

////PushInstruction("constant 12")
@12 // 14530
D=A // 14531
@SP // 14532
AM=M+1 // 14533
A=A-1 // 14534
M=D // 14535

////PushInstruction("constant 12")
@12 // 14536
D=A // 14537
@SP // 14538
AM=M+1 // 14539
A=A-1 // 14540
M=D // 14541

////PushInstruction("constant 12")
@12 // 14542
D=A // 14543
@SP // 14544
AM=M+1 // 14545
A=A-1 // 14546
M=D // 14547

////PushInstruction("constant 12")
@12 // 14548
D=A // 14549
@SP // 14550
AM=M+1 // 14551
A=A-1 // 14552
M=D // 14553

////PushInstruction("constant 12")
@12 // 14554
D=A // 14555
@SP // 14556
AM=M+1 // 14557
A=A-1 // 14558
M=D // 14559

////PushInstruction("constant 12")
@12 // 14560
D=A // 14561
@SP // 14562
AM=M+1 // 14563
A=A-1 // 14564
M=D // 14565

////PushInstruction("constant 30")
@30 // 14566
D=A // 14567
@SP // 14568
AM=M+1 // 14569
A=A-1 // 14570
M=D // 14571

////PushInstruction("constant 0")
@SP // 14572
AM=M+1 // 14573
A=A-1 // 14574
M=0 // 14575

////PushInstruction("constant 0")
@SP // 14576
AM=M+1 // 14577
A=A-1 // 14578
M=0 // 14579

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=78}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14580
D=A // 14581
@14 // 14582
M=D // 14583
@Output.create // 14584
D=A // 14585
@13 // 14586
M=D // 14587
@Output.initMap.ret.78 // 14588
D=A // 14589
@CALL // 14590
0;JMP // 14591
(Output.initMap.ret.78)

////PopInstruction{address=temp 0}
@SP // 14592
AM=M-1 // 14593
D=M // 14594
@5 // 14595
M=D // 14596

////PushInstruction("constant 109")
@109 // 14597
D=A // 14598
@SP // 14599
AM=M+1 // 14600
A=A-1 // 14601
M=D // 14602

////PushInstruction("constant 0")
@SP // 14603
AM=M+1 // 14604
A=A-1 // 14605
M=0 // 14606

////PushInstruction("constant 0")
@SP // 14607
AM=M+1 // 14608
A=A-1 // 14609
M=0 // 14610

////PushInstruction("constant 0")
@SP // 14611
AM=M+1 // 14612
A=A-1 // 14613
M=0 // 14614

////PushInstruction("constant 29")
@29 // 14615
D=A // 14616
@SP // 14617
AM=M+1 // 14618
A=A-1 // 14619
M=D // 14620

////PushInstruction("constant 63")
@63 // 14621
D=A // 14622
@SP // 14623
AM=M+1 // 14624
A=A-1 // 14625
M=D // 14626

////PushInstruction("constant 43")
@43 // 14627
D=A // 14628
@SP // 14629
AM=M+1 // 14630
A=A-1 // 14631
M=D // 14632

////PushInstruction("constant 43")
@43 // 14633
D=A // 14634
@SP // 14635
AM=M+1 // 14636
A=A-1 // 14637
M=D // 14638

////PushInstruction("constant 43")
@43 // 14639
D=A // 14640
@SP // 14641
AM=M+1 // 14642
A=A-1 // 14643
M=D // 14644

////PushInstruction("constant 43")
@43 // 14645
D=A // 14646
@SP // 14647
AM=M+1 // 14648
A=A-1 // 14649
M=D // 14650

////PushInstruction("constant 0")
@SP // 14651
AM=M+1 // 14652
A=A-1 // 14653
M=0 // 14654

////PushInstruction("constant 0")
@SP // 14655
AM=M+1 // 14656
A=A-1 // 14657
M=0 // 14658

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=79}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14659
D=A // 14660
@14 // 14661
M=D // 14662
@Output.create // 14663
D=A // 14664
@13 // 14665
M=D // 14666
@Output.initMap.ret.79 // 14667
D=A // 14668
@CALL // 14669
0;JMP // 14670
(Output.initMap.ret.79)

////PopInstruction{address=temp 0}
@SP // 14671
AM=M-1 // 14672
D=M // 14673
@5 // 14674
M=D // 14675

////PushInstruction("constant 110")
@110 // 14676
D=A // 14677
@SP // 14678
AM=M+1 // 14679
A=A-1 // 14680
M=D // 14681

////PushInstruction("constant 0")
@SP // 14682
AM=M+1 // 14683
A=A-1 // 14684
M=0 // 14685

////PushInstruction("constant 0")
@SP // 14686
AM=M+1 // 14687
A=A-1 // 14688
M=0 // 14689

////PushInstruction("constant 0")
@SP // 14690
AM=M+1 // 14691
A=A-1 // 14692
M=0 // 14693

////PushInstruction("constant 29")
@29 // 14694
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

////PushInstruction("constant 51")
@51 // 14712
D=A // 14713
@SP // 14714
AM=M+1 // 14715
A=A-1 // 14716
M=D // 14717

////PushInstruction("constant 51")
@51 // 14718
D=A // 14719
@SP // 14720
AM=M+1 // 14721
A=A-1 // 14722
M=D // 14723

////PushInstruction("constant 51")
@51 // 14724
D=A // 14725
@SP // 14726
AM=M+1 // 14727
A=A-1 // 14728
M=D // 14729

////PushInstruction("constant 0")
@SP // 14730
AM=M+1 // 14731
A=A-1 // 14732
M=0 // 14733

////PushInstruction("constant 0")
@SP // 14734
AM=M+1 // 14735
A=A-1 // 14736
M=0 // 14737

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=80}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14738
D=A // 14739
@14 // 14740
M=D // 14741
@Output.create // 14742
D=A // 14743
@13 // 14744
M=D // 14745
@Output.initMap.ret.80 // 14746
D=A // 14747
@CALL // 14748
0;JMP // 14749
(Output.initMap.ret.80)

////PopInstruction{address=temp 0}
@SP // 14750
AM=M-1 // 14751
D=M // 14752
@5 // 14753
M=D // 14754

////PushInstruction("constant 111")
@111 // 14755
D=A // 14756
@SP // 14757
AM=M+1 // 14758
A=A-1 // 14759
M=D // 14760

////PushInstruction("constant 0")
@SP // 14761
AM=M+1 // 14762
A=A-1 // 14763
M=0 // 14764

////PushInstruction("constant 0")
@SP // 14765
AM=M+1 // 14766
A=A-1 // 14767
M=0 // 14768

////PushInstruction("constant 0")
@SP // 14769
AM=M+1 // 14770
A=A-1 // 14771
M=0 // 14772

////PushInstruction("constant 30")
@30 // 14773
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

////PushInstruction("constant 51")
@51 // 14785
D=A // 14786
@SP // 14787
AM=M+1 // 14788
A=A-1 // 14789
M=D // 14790

////PushInstruction("constant 51")
@51 // 14791
D=A // 14792
@SP // 14793
AM=M+1 // 14794
A=A-1 // 14795
M=D // 14796

////PushInstruction("constant 51")
@51 // 14797
D=A // 14798
@SP // 14799
AM=M+1 // 14800
A=A-1 // 14801
M=D // 14802

////PushInstruction("constant 30")
@30 // 14803
D=A // 14804
@SP // 14805
AM=M+1 // 14806
A=A-1 // 14807
M=D // 14808

////PushInstruction("constant 0")
@SP // 14809
AM=M+1 // 14810
A=A-1 // 14811
M=0 // 14812

////PushInstruction("constant 0")
@SP // 14813
AM=M+1 // 14814
A=A-1 // 14815
M=0 // 14816

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=81}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14817
D=A // 14818
@14 // 14819
M=D // 14820
@Output.create // 14821
D=A // 14822
@13 // 14823
M=D // 14824
@Output.initMap.ret.81 // 14825
D=A // 14826
@CALL // 14827
0;JMP // 14828
(Output.initMap.ret.81)

////PopInstruction{address=temp 0}
@SP // 14829
AM=M-1 // 14830
D=M // 14831
@5 // 14832
M=D // 14833

////PushInstruction("constant 112")
@112 // 14834
D=A // 14835
@SP // 14836
AM=M+1 // 14837
A=A-1 // 14838
M=D // 14839

////PushInstruction("constant 0")
@SP // 14840
AM=M+1 // 14841
A=A-1 // 14842
M=0 // 14843

////PushInstruction("constant 0")
@SP // 14844
AM=M+1 // 14845
A=A-1 // 14846
M=0 // 14847

////PushInstruction("constant 0")
@SP // 14848
AM=M+1 // 14849
A=A-1 // 14850
M=0 // 14851

////PushInstruction("constant 30")
@30 // 14852
D=A // 14853
@SP // 14854
AM=M+1 // 14855
A=A-1 // 14856
M=D // 14857

////PushInstruction("constant 51")
@51 // 14858
D=A // 14859
@SP // 14860
AM=M+1 // 14861
A=A-1 // 14862
M=D // 14863

////PushInstruction("constant 51")
@51 // 14864
D=A // 14865
@SP // 14866
AM=M+1 // 14867
A=A-1 // 14868
M=D // 14869

////PushInstruction("constant 51")
@51 // 14870
D=A // 14871
@SP // 14872
AM=M+1 // 14873
A=A-1 // 14874
M=D // 14875

////PushInstruction("constant 31")
@31 // 14876
D=A // 14877
@SP // 14878
AM=M+1 // 14879
A=A-1 // 14880
M=D // 14881

////PushInstruction("constant 3")
@3 // 14882
D=A // 14883
@SP // 14884
AM=M+1 // 14885
A=A-1 // 14886
M=D // 14887

////PushInstruction("constant 3")
@3 // 14888
D=A // 14889
@SP // 14890
AM=M+1 // 14891
A=A-1 // 14892
M=D // 14893

////PushInstruction("constant 0")
@SP // 14894
AM=M+1 // 14895
A=A-1 // 14896
M=0 // 14897

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=82}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14898
D=A // 14899
@14 // 14900
M=D // 14901
@Output.create // 14902
D=A // 14903
@13 // 14904
M=D // 14905
@Output.initMap.ret.82 // 14906
D=A // 14907
@CALL // 14908
0;JMP // 14909
(Output.initMap.ret.82)

////PopInstruction{address=temp 0}
@SP // 14910
AM=M-1 // 14911
D=M // 14912
@5 // 14913
M=D // 14914

////PushInstruction("constant 113")
@113 // 14915
D=A // 14916
@SP // 14917
AM=M+1 // 14918
A=A-1 // 14919
M=D // 14920

////PushInstruction("constant 0")
@SP // 14921
AM=M+1 // 14922
A=A-1 // 14923
M=0 // 14924

////PushInstruction("constant 0")
@SP // 14925
AM=M+1 // 14926
A=A-1 // 14927
M=0 // 14928

////PushInstruction("constant 0")
@SP // 14929
AM=M+1 // 14930
A=A-1 // 14931
M=0 // 14932

////PushInstruction("constant 30")
@30 // 14933
D=A // 14934
@SP // 14935
AM=M+1 // 14936
A=A-1 // 14937
M=D // 14938

////PushInstruction("constant 51")
@51 // 14939
D=A // 14940
@SP // 14941
AM=M+1 // 14942
A=A-1 // 14943
M=D // 14944

////PushInstruction("constant 51")
@51 // 14945
D=A // 14946
@SP // 14947
AM=M+1 // 14948
A=A-1 // 14949
M=D // 14950

////PushInstruction("constant 51")
@51 // 14951
D=A // 14952
@SP // 14953
AM=M+1 // 14954
A=A-1 // 14955
M=D // 14956

////PushInstruction("constant 62")
@62 // 14957
D=A // 14958
@SP // 14959
AM=M+1 // 14960
A=A-1 // 14961
M=D // 14962

////PushInstruction("constant 48")
@48 // 14963
D=A // 14964
@SP // 14965
AM=M+1 // 14966
A=A-1 // 14967
M=D // 14968

////PushInstruction("constant 48")
@48 // 14969
D=A // 14970
@SP // 14971
AM=M+1 // 14972
A=A-1 // 14973
M=D // 14974

////PushInstruction("constant 0")
@SP // 14975
AM=M+1 // 14976
A=A-1 // 14977
M=0 // 14978

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=83}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14979
D=A // 14980
@14 // 14981
M=D // 14982
@Output.create // 14983
D=A // 14984
@13 // 14985
M=D // 14986
@Output.initMap.ret.83 // 14987
D=A // 14988
@CALL // 14989
0;JMP // 14990
(Output.initMap.ret.83)

////PopInstruction{address=temp 0}
@SP // 14991
AM=M-1 // 14992
D=M // 14993
@5 // 14994
M=D // 14995

////PushInstruction("constant 114")
@114 // 14996
D=A // 14997
@SP // 14998
AM=M+1 // 14999
A=A-1 // 15000
M=D // 15001

////PushInstruction("constant 0")
@SP // 15002
AM=M+1 // 15003
A=A-1 // 15004
M=0 // 15005

////PushInstruction("constant 0")
@SP // 15006
AM=M+1 // 15007
A=A-1 // 15008
M=0 // 15009

////PushInstruction("constant 0")
@SP // 15010
AM=M+1 // 15011
A=A-1 // 15012
M=0 // 15013

////PushInstruction("constant 29")
@29 // 15014
D=A // 15015
@SP // 15016
AM=M+1 // 15017
A=A-1 // 15018
M=D // 15019

////PushInstruction("constant 55")
@55 // 15020
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

////PushInstruction("constant 3")
@3 // 15032
D=A // 15033
@SP // 15034
AM=M+1 // 15035
A=A-1 // 15036
M=D // 15037

////PushInstruction("constant 3")
@3 // 15038
D=A // 15039
@SP // 15040
AM=M+1 // 15041
A=A-1 // 15042
M=D // 15043

////PushInstruction("constant 7")
@7 // 15044
D=A // 15045
@SP // 15046
AM=M+1 // 15047
A=A-1 // 15048
M=D // 15049

////PushInstruction("constant 0")
@SP // 15050
AM=M+1 // 15051
A=A-1 // 15052
M=0 // 15053

////PushInstruction("constant 0")
@SP // 15054
AM=M+1 // 15055
A=A-1 // 15056
M=0 // 15057

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=84}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15058
D=A // 15059
@14 // 15060
M=D // 15061
@Output.create // 15062
D=A // 15063
@13 // 15064
M=D // 15065
@Output.initMap.ret.84 // 15066
D=A // 15067
@CALL // 15068
0;JMP // 15069
(Output.initMap.ret.84)

////PopInstruction{address=temp 0}
@SP // 15070
AM=M-1 // 15071
D=M // 15072
@5 // 15073
M=D // 15074

////PushInstruction("constant 115")
@115 // 15075
D=A // 15076
@SP // 15077
AM=M+1 // 15078
A=A-1 // 15079
M=D // 15080

////PushInstruction("constant 0")
@SP // 15081
AM=M+1 // 15082
A=A-1 // 15083
M=0 // 15084

////PushInstruction("constant 0")
@SP // 15085
AM=M+1 // 15086
A=A-1 // 15087
M=0 // 15088

////PushInstruction("constant 0")
@SP // 15089
AM=M+1 // 15090
A=A-1 // 15091
M=0 // 15092

////PushInstruction("constant 30")
@30 // 15093
D=A // 15094
@SP // 15095
AM=M+1 // 15096
A=A-1 // 15097
M=D // 15098

////PushInstruction("constant 51")
@51 // 15099
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

////PushInstruction("constant 24")
@24 // 15111
D=A // 15112
@SP // 15113
AM=M+1 // 15114
A=A-1 // 15115
M=D // 15116

////PushInstruction("constant 51")
@51 // 15117
D=A // 15118
@SP // 15119
AM=M+1 // 15120
A=A-1 // 15121
M=D // 15122

////PushInstruction("constant 30")
@30 // 15123
D=A // 15124
@SP // 15125
AM=M+1 // 15126
A=A-1 // 15127
M=D // 15128

////PushInstruction("constant 0")
@SP // 15129
AM=M+1 // 15130
A=A-1 // 15131
M=0 // 15132

////PushInstruction("constant 0")
@SP // 15133
AM=M+1 // 15134
A=A-1 // 15135
M=0 // 15136

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=85}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15137
D=A // 15138
@14 // 15139
M=D // 15140
@Output.create // 15141
D=A // 15142
@13 // 15143
M=D // 15144
@Output.initMap.ret.85 // 15145
D=A // 15146
@CALL // 15147
0;JMP // 15148
(Output.initMap.ret.85)

////PopInstruction{address=temp 0}
@SP // 15149
AM=M-1 // 15150
D=M // 15151
@5 // 15152
M=D // 15153

////PushInstruction("constant 116")
@116 // 15154
D=A // 15155
@SP // 15156
AM=M+1 // 15157
A=A-1 // 15158
M=D // 15159

////PushInstruction("constant 4")
@4 // 15160
D=A // 15161
@SP // 15162
AM=M+1 // 15163
A=A-1 // 15164
M=D // 15165

////PushInstruction("constant 6")
@6 // 15166
D=A // 15167
@SP // 15168
AM=M+1 // 15169
A=A-1 // 15170
M=D // 15171

////PushInstruction("constant 6")
@6 // 15172
D=A // 15173
@SP // 15174
AM=M+1 // 15175
A=A-1 // 15176
M=D // 15177

////PushInstruction("constant 15")
@15 // 15178
D=A // 15179
@SP // 15180
AM=M+1 // 15181
A=A-1 // 15182
M=D // 15183

////PushInstruction("constant 6")
@6 // 15184
D=A // 15185
@SP // 15186
AM=M+1 // 15187
A=A-1 // 15188
M=D // 15189

////PushInstruction("constant 6")
@6 // 15190
D=A // 15191
@SP // 15192
AM=M+1 // 15193
A=A-1 // 15194
M=D // 15195

////PushInstruction("constant 6")
@6 // 15196
D=A // 15197
@SP // 15198
AM=M+1 // 15199
A=A-1 // 15200
M=D // 15201

////PushInstruction("constant 54")
@54 // 15202
D=A // 15203
@SP // 15204
AM=M+1 // 15205
A=A-1 // 15206
M=D // 15207

////PushInstruction("constant 28")
@28 // 15208
D=A // 15209
@SP // 15210
AM=M+1 // 15211
A=A-1 // 15212
M=D // 15213

////PushInstruction("constant 0")
@SP // 15214
AM=M+1 // 15215
A=A-1 // 15216
M=0 // 15217

////PushInstruction("constant 0")
@SP // 15218
AM=M+1 // 15219
A=A-1 // 15220
M=0 // 15221

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=86}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15222
D=A // 15223
@14 // 15224
M=D // 15225
@Output.create // 15226
D=A // 15227
@13 // 15228
M=D // 15229
@Output.initMap.ret.86 // 15230
D=A // 15231
@CALL // 15232
0;JMP // 15233
(Output.initMap.ret.86)

////PopInstruction{address=temp 0}
@SP // 15234
AM=M-1 // 15235
D=M // 15236
@5 // 15237
M=D // 15238

////PushInstruction("constant 117")
@117 // 15239
D=A // 15240
@SP // 15241
AM=M+1 // 15242
A=A-1 // 15243
M=D // 15244

////PushInstruction("constant 0")
@SP // 15245
AM=M+1 // 15246
A=A-1 // 15247
M=0 // 15248

////PushInstruction("constant 0")
@SP // 15249
AM=M+1 // 15250
A=A-1 // 15251
M=0 // 15252

////PushInstruction("constant 0")
@SP // 15253
AM=M+1 // 15254
A=A-1 // 15255
M=0 // 15256

////PushInstruction("constant 27")
@27 // 15257
D=A // 15258
@SP // 15259
AM=M+1 // 15260
A=A-1 // 15261
M=D // 15262

////PushInstruction("constant 27")
@27 // 15263
D=A // 15264
@SP // 15265
AM=M+1 // 15266
A=A-1 // 15267
M=D // 15268

////PushInstruction("constant 27")
@27 // 15269
D=A // 15270
@SP // 15271
AM=M+1 // 15272
A=A-1 // 15273
M=D // 15274

////PushInstruction("constant 27")
@27 // 15275
D=A // 15276
@SP // 15277
AM=M+1 // 15278
A=A-1 // 15279
M=D // 15280

////PushInstruction("constant 27")
@27 // 15281
D=A // 15282
@SP // 15283
AM=M+1 // 15284
A=A-1 // 15285
M=D // 15286

////PushInstruction("constant 54")
@54 // 15287
D=A // 15288
@SP // 15289
AM=M+1 // 15290
A=A-1 // 15291
M=D // 15292

////PushInstruction("constant 0")
@SP // 15293
AM=M+1 // 15294
A=A-1 // 15295
M=0 // 15296

////PushInstruction("constant 0")
@SP // 15297
AM=M+1 // 15298
A=A-1 // 15299
M=0 // 15300

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=87}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15301
D=A // 15302
@14 // 15303
M=D // 15304
@Output.create // 15305
D=A // 15306
@13 // 15307
M=D // 15308
@Output.initMap.ret.87 // 15309
D=A // 15310
@CALL // 15311
0;JMP // 15312
(Output.initMap.ret.87)

////PopInstruction{address=temp 0}
@SP // 15313
AM=M-1 // 15314
D=M // 15315
@5 // 15316
M=D // 15317

////PushInstruction("constant 118")
@118 // 15318
D=A // 15319
@SP // 15320
AM=M+1 // 15321
A=A-1 // 15322
M=D // 15323

////PushInstruction("constant 0")
@SP // 15324
AM=M+1 // 15325
A=A-1 // 15326
M=0 // 15327

////PushInstruction("constant 0")
@SP // 15328
AM=M+1 // 15329
A=A-1 // 15330
M=0 // 15331

////PushInstruction("constant 0")
@SP // 15332
AM=M+1 // 15333
A=A-1 // 15334
M=0 // 15335

////PushInstruction("constant 51")
@51 // 15336
D=A // 15337
@SP // 15338
AM=M+1 // 15339
A=A-1 // 15340
M=D // 15341

////PushInstruction("constant 51")
@51 // 15342
D=A // 15343
@SP // 15344
AM=M+1 // 15345
A=A-1 // 15346
M=D // 15347

////PushInstruction("constant 51")
@51 // 15348
D=A // 15349
@SP // 15350
AM=M+1 // 15351
A=A-1 // 15352
M=D // 15353

////PushInstruction("constant 51")
@51 // 15354
D=A // 15355
@SP // 15356
AM=M+1 // 15357
A=A-1 // 15358
M=D // 15359

////PushInstruction("constant 30")
@30 // 15360
D=A // 15361
@SP // 15362
AM=M+1 // 15363
A=A-1 // 15364
M=D // 15365

////PushInstruction("constant 12")
@12 // 15366
D=A // 15367
@SP // 15368
AM=M+1 // 15369
A=A-1 // 15370
M=D // 15371

////PushInstruction("constant 0")
@SP // 15372
AM=M+1 // 15373
A=A-1 // 15374
M=0 // 15375

////PushInstruction("constant 0")
@SP // 15376
AM=M+1 // 15377
A=A-1 // 15378
M=0 // 15379

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=88}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15380
D=A // 15381
@14 // 15382
M=D // 15383
@Output.create // 15384
D=A // 15385
@13 // 15386
M=D // 15387
@Output.initMap.ret.88 // 15388
D=A // 15389
@CALL // 15390
0;JMP // 15391
(Output.initMap.ret.88)

////PopInstruction{address=temp 0}
@SP // 15392
AM=M-1 // 15393
D=M // 15394
@5 // 15395
M=D // 15396

////PushInstruction("constant 119")
@119 // 15397
D=A // 15398
@SP // 15399
AM=M+1 // 15400
A=A-1 // 15401
M=D // 15402

////PushInstruction("constant 0")
@SP // 15403
AM=M+1 // 15404
A=A-1 // 15405
M=0 // 15406

////PushInstruction("constant 0")
@SP // 15407
AM=M+1 // 15408
A=A-1 // 15409
M=0 // 15410

////PushInstruction("constant 0")
@SP // 15411
AM=M+1 // 15412
A=A-1 // 15413
M=0 // 15414

////PushInstruction("constant 51")
@51 // 15415
D=A // 15416
@SP // 15417
AM=M+1 // 15418
A=A-1 // 15419
M=D // 15420

////PushInstruction("constant 51")
@51 // 15421
D=A // 15422
@SP // 15423
AM=M+1 // 15424
A=A-1 // 15425
M=D // 15426

////PushInstruction("constant 51")
@51 // 15427
D=A // 15428
@SP // 15429
AM=M+1 // 15430
A=A-1 // 15431
M=D // 15432

////PushInstruction("constant 63")
@63 // 15433
D=A // 15434
@SP // 15435
AM=M+1 // 15436
A=A-1 // 15437
M=D // 15438

////PushInstruction("constant 63")
@63 // 15439
D=A // 15440
@SP // 15441
AM=M+1 // 15442
A=A-1 // 15443
M=D // 15444

////PushInstruction("constant 18")
@18 // 15445
D=A // 15446
@SP // 15447
AM=M+1 // 15448
A=A-1 // 15449
M=D // 15450

////PushInstruction("constant 0")
@SP // 15451
AM=M+1 // 15452
A=A-1 // 15453
M=0 // 15454

////PushInstruction("constant 0")
@SP // 15455
AM=M+1 // 15456
A=A-1 // 15457
M=0 // 15458

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=89}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15459
D=A // 15460
@14 // 15461
M=D // 15462
@Output.create // 15463
D=A // 15464
@13 // 15465
M=D // 15466
@Output.initMap.ret.89 // 15467
D=A // 15468
@CALL // 15469
0;JMP // 15470
(Output.initMap.ret.89)

////PopInstruction{address=temp 0}
@SP // 15471
AM=M-1 // 15472
D=M // 15473
@5 // 15474
M=D // 15475

////PushInstruction("constant 120")
@120 // 15476
D=A // 15477
@SP // 15478
AM=M+1 // 15479
A=A-1 // 15480
M=D // 15481

////PushInstruction("constant 0")
@SP // 15482
AM=M+1 // 15483
A=A-1 // 15484
M=0 // 15485

////PushInstruction("constant 0")
@SP // 15486
AM=M+1 // 15487
A=A-1 // 15488
M=0 // 15489

////PushInstruction("constant 0")
@SP // 15490
AM=M+1 // 15491
A=A-1 // 15492
M=0 // 15493

////PushInstruction("constant 51")
@51 // 15494
D=A // 15495
@SP // 15496
AM=M+1 // 15497
A=A-1 // 15498
M=D // 15499

////PushInstruction("constant 30")
@30 // 15500
D=A // 15501
@SP // 15502
AM=M+1 // 15503
A=A-1 // 15504
M=D // 15505

////PushInstruction("constant 12")
@12 // 15506
D=A // 15507
@SP // 15508
AM=M+1 // 15509
A=A-1 // 15510
M=D // 15511

////PushInstruction("constant 12")
@12 // 15512
D=A // 15513
@SP // 15514
AM=M+1 // 15515
A=A-1 // 15516
M=D // 15517

////PushInstruction("constant 30")
@30 // 15518
D=A // 15519
@SP // 15520
AM=M+1 // 15521
A=A-1 // 15522
M=D // 15523

////PushInstruction("constant 51")
@51 // 15524
D=A // 15525
@SP // 15526
AM=M+1 // 15527
A=A-1 // 15528
M=D // 15529

////PushInstruction("constant 0")
@SP // 15530
AM=M+1 // 15531
A=A-1 // 15532
M=0 // 15533

////PushInstruction("constant 0")
@SP // 15534
AM=M+1 // 15535
A=A-1 // 15536
M=0 // 15537

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=90}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15538
D=A // 15539
@14 // 15540
M=D // 15541
@Output.create // 15542
D=A // 15543
@13 // 15544
M=D // 15545
@Output.initMap.ret.90 // 15546
D=A // 15547
@CALL // 15548
0;JMP // 15549
(Output.initMap.ret.90)

////PopInstruction{address=temp 0}
@SP // 15550
AM=M-1 // 15551
D=M // 15552
@5 // 15553
M=D // 15554

////PushInstruction("constant 121")
@121 // 15555
D=A // 15556
@SP // 15557
AM=M+1 // 15558
A=A-1 // 15559
M=D // 15560

////PushInstruction("constant 0")
@SP // 15561
AM=M+1 // 15562
A=A-1 // 15563
M=0 // 15564

////PushInstruction("constant 0")
@SP // 15565
AM=M+1 // 15566
A=A-1 // 15567
M=0 // 15568

////PushInstruction("constant 0")
@SP // 15569
AM=M+1 // 15570
A=A-1 // 15571
M=0 // 15572

////PushInstruction("constant 51")
@51 // 15573
D=A // 15574
@SP // 15575
AM=M+1 // 15576
A=A-1 // 15577
M=D // 15578

////PushInstruction("constant 51")
@51 // 15579
D=A // 15580
@SP // 15581
AM=M+1 // 15582
A=A-1 // 15583
M=D // 15584

////PushInstruction("constant 51")
@51 // 15585
D=A // 15586
@SP // 15587
AM=M+1 // 15588
A=A-1 // 15589
M=D // 15590

////PushInstruction("constant 62")
@62 // 15591
D=A // 15592
@SP // 15593
AM=M+1 // 15594
A=A-1 // 15595
M=D // 15596

////PushInstruction("constant 48")
@48 // 15597
D=A // 15598
@SP // 15599
AM=M+1 // 15600
A=A-1 // 15601
M=D // 15602

////PushInstruction("constant 24")
@24 // 15603
D=A // 15604
@SP // 15605
AM=M+1 // 15606
A=A-1 // 15607
M=D // 15608

////PushInstruction("constant 15")
@15 // 15609
D=A // 15610
@SP // 15611
AM=M+1 // 15612
A=A-1 // 15613
M=D // 15614

////PushInstruction("constant 0")
@SP // 15615
AM=M+1 // 15616
A=A-1 // 15617
M=0 // 15618

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=91}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15619
D=A // 15620
@14 // 15621
M=D // 15622
@Output.create // 15623
D=A // 15624
@13 // 15625
M=D // 15626
@Output.initMap.ret.91 // 15627
D=A // 15628
@CALL // 15629
0;JMP // 15630
(Output.initMap.ret.91)

////PopInstruction{address=temp 0}
@SP // 15631
AM=M-1 // 15632
D=M // 15633
@5 // 15634
M=D // 15635

////PushInstruction("constant 122")
@122 // 15636
D=A // 15637
@SP // 15638
AM=M+1 // 15639
A=A-1 // 15640
M=D // 15641

////PushInstruction("constant 0")
@SP // 15642
AM=M+1 // 15643
A=A-1 // 15644
M=0 // 15645

////PushInstruction("constant 0")
@SP // 15646
AM=M+1 // 15647
A=A-1 // 15648
M=0 // 15649

////PushInstruction("constant 0")
@SP // 15650
AM=M+1 // 15651
A=A-1 // 15652
M=0 // 15653

////PushInstruction("constant 63")
@63 // 15654
D=A // 15655
@SP // 15656
AM=M+1 // 15657
A=A-1 // 15658
M=D // 15659

////PushInstruction("constant 27")
@27 // 15660
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

////PushInstruction("constant 6")
@6 // 15672
D=A // 15673
@SP // 15674
AM=M+1 // 15675
A=A-1 // 15676
M=D // 15677

////PushInstruction("constant 51")
@51 // 15678
D=A // 15679
@SP // 15680
AM=M+1 // 15681
A=A-1 // 15682
M=D // 15683

////PushInstruction("constant 63")
@63 // 15684
D=A // 15685
@SP // 15686
AM=M+1 // 15687
A=A-1 // 15688
M=D // 15689

////PushInstruction("constant 0")
@SP // 15690
AM=M+1 // 15691
A=A-1 // 15692
M=0 // 15693

////PushInstruction("constant 0")
@SP // 15694
AM=M+1 // 15695
A=A-1 // 15696
M=0 // 15697

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=92}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15698
D=A // 15699
@14 // 15700
M=D // 15701
@Output.create // 15702
D=A // 15703
@13 // 15704
M=D // 15705
@Output.initMap.ret.92 // 15706
D=A // 15707
@CALL // 15708
0;JMP // 15709
(Output.initMap.ret.92)

////PopInstruction{address=temp 0}
@SP // 15710
AM=M-1 // 15711
D=M // 15712
@5 // 15713
M=D // 15714

////PushInstruction("constant 123")
@123 // 15715
D=A // 15716
@SP // 15717
AM=M+1 // 15718
A=A-1 // 15719
M=D // 15720

////PushInstruction("constant 56")
@56 // 15721
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

////PushInstruction("constant 7")
@7 // 15745
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

////PushInstruction("constant 56")
@56 // 15769
D=A // 15770
@SP // 15771
AM=M+1 // 15772
A=A-1 // 15773
M=D // 15774

////PushInstruction("constant 0")
@SP // 15775
AM=M+1 // 15776
A=A-1 // 15777
M=0 // 15778

////PushInstruction("constant 0")
@SP // 15779
AM=M+1 // 15780
A=A-1 // 15781
M=0 // 15782

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=93}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15783
D=A // 15784
@14 // 15785
M=D // 15786
@Output.create // 15787
D=A // 15788
@13 // 15789
M=D // 15790
@Output.initMap.ret.93 // 15791
D=A // 15792
@CALL // 15793
0;JMP // 15794
(Output.initMap.ret.93)

////PopInstruction{address=temp 0}
@SP // 15795
AM=M-1 // 15796
D=M // 15797
@5 // 15798
M=D // 15799

////PushInstruction("constant 124")
@124 // 15800
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

////PushInstruction("constant 12")
@12 // 15824
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

////PushInstruction("constant 12")
@12 // 15848
D=A // 15849
@SP // 15850
AM=M+1 // 15851
A=A-1 // 15852
M=D // 15853

////PushInstruction("constant 12")
@12 // 15854
D=A // 15855
@SP // 15856
AM=M+1 // 15857
A=A-1 // 15858
M=D // 15859

////PushInstruction("constant 0")
@SP // 15860
AM=M+1 // 15861
A=A-1 // 15862
M=0 // 15863

////PushInstruction("constant 0")
@SP // 15864
AM=M+1 // 15865
A=A-1 // 15866
M=0 // 15867

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=94}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15868
D=A // 15869
@14 // 15870
M=D // 15871
@Output.create // 15872
D=A // 15873
@13 // 15874
M=D // 15875
@Output.initMap.ret.94 // 15876
D=A // 15877
@CALL // 15878
0;JMP // 15879
(Output.initMap.ret.94)

////PopInstruction{address=temp 0}
@SP // 15880
AM=M-1 // 15881
D=M // 15882
@5 // 15883
M=D // 15884

////PushInstruction("constant 125")
@125 // 15885
D=A // 15886
@SP // 15887
AM=M+1 // 15888
A=A-1 // 15889
M=D // 15890

////PushInstruction("constant 7")
@7 // 15891
D=A // 15892
@SP // 15893
AM=M+1 // 15894
A=A-1 // 15895
M=D // 15896

////PushInstruction("constant 12")
@12 // 15897
D=A // 15898
@SP // 15899
AM=M+1 // 15900
A=A-1 // 15901
M=D // 15902

////PushInstruction("constant 12")
@12 // 15903
D=A // 15904
@SP // 15905
AM=M+1 // 15906
A=A-1 // 15907
M=D // 15908

////PushInstruction("constant 12")
@12 // 15909
D=A // 15910
@SP // 15911
AM=M+1 // 15912
A=A-1 // 15913
M=D // 15914

////PushInstruction("constant 56")
@56 // 15915
D=A // 15916
@SP // 15917
AM=M+1 // 15918
A=A-1 // 15919
M=D // 15920

////PushInstruction("constant 12")
@12 // 15921
D=A // 15922
@SP // 15923
AM=M+1 // 15924
A=A-1 // 15925
M=D // 15926

////PushInstruction("constant 12")
@12 // 15927
D=A // 15928
@SP // 15929
AM=M+1 // 15930
A=A-1 // 15931
M=D // 15932

////PushInstruction("constant 12")
@12 // 15933
D=A // 15934
@SP // 15935
AM=M+1 // 15936
A=A-1 // 15937
M=D // 15938

////PushInstruction("constant 7")
@7 // 15939
D=A // 15940
@SP // 15941
AM=M+1 // 15942
A=A-1 // 15943
M=D // 15944

////PushInstruction("constant 0")
@SP // 15945
AM=M+1 // 15946
A=A-1 // 15947
M=0 // 15948

////PushInstruction("constant 0")
@SP // 15949
AM=M+1 // 15950
A=A-1 // 15951
M=0 // 15952

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=95}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15953
D=A // 15954
@14 // 15955
M=D // 15956
@Output.create // 15957
D=A // 15958
@13 // 15959
M=D // 15960
@Output.initMap.ret.95 // 15961
D=A // 15962
@CALL // 15963
0;JMP // 15964
(Output.initMap.ret.95)

////PopInstruction{address=temp 0}
@SP // 15965
AM=M-1 // 15966
D=M // 15967
@5 // 15968
M=D // 15969

////PushInstruction("constant 126")
@126 // 15970
D=A // 15971
@SP // 15972
AM=M+1 // 15973
A=A-1 // 15974
M=D // 15975

////PushInstruction("constant 38")
@38 // 15976
D=A // 15977
@SP // 15978
AM=M+1 // 15979
A=A-1 // 15980
M=D // 15981

////PushInstruction("constant 45")
@45 // 15982
D=A // 15983
@SP // 15984
AM=M+1 // 15985
A=A-1 // 15986
M=D // 15987

////PushInstruction("constant 25")
@25 // 15988
D=A // 15989
@SP // 15990
AM=M+1 // 15991
A=A-1 // 15992
M=D // 15993

////PushInstruction("constant 0")
@SP // 15994
AM=M+1 // 15995
A=A-1 // 15996
M=0 // 15997

////PushInstruction("constant 0")
@SP // 15998
AM=M+1 // 15999
A=A-1 // 16000
M=0 // 16001

////PushInstruction("constant 0")
@SP // 16002
AM=M+1 // 16003
A=A-1 // 16004
M=0 // 16005

////PushInstruction("constant 0")
@SP // 16006
AM=M+1 // 16007
A=A-1 // 16008
M=0 // 16009

////PushInstruction("constant 0")
@SP // 16010
AM=M+1 // 16011
A=A-1 // 16012
M=0 // 16013

////PushInstruction("constant 0")
@SP // 16014
AM=M+1 // 16015
A=A-1 // 16016
M=0 // 16017

////PushInstruction("constant 0")
@SP // 16018
AM=M+1 // 16019
A=A-1 // 16020
M=0 // 16021

////PushInstruction("constant 0")
@SP // 16022
AM=M+1 // 16023
A=A-1 // 16024
M=0 // 16025

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=96}, currentFunction='Output.initMap'}
// call Output.create
@17 // 16026
D=A // 16027
@14 // 16028
M=D // 16029
@Output.create // 16030
D=A // 16031
@13 // 16032
M=D // 16033
@Output.initMap.ret.96 // 16034
D=A // 16035
@CALL // 16036
0;JMP // 16037
(Output.initMap.ret.96)

////PopInstruction{address=temp 0}
@SP // 16038
AM=M-1 // 16039
D=M // 16040
@5 // 16041
M=D // 16042

////PushInstruction("constant 0")
@SP // 16043
AM=M+1 // 16044
A=A-1 // 16045
M=0 // 16046

////ReturnInstruction{}
@RETURN // 16047
0;JMP // 16048

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 16049
AM=M+1 // 16050
A=A-1 // 16051
M=0 // 16052

////PushInstruction("constant 11")
@11 // 16053
D=A // 16054
@SP // 16055
AM=M+1 // 16056
A=A-1 // 16057
M=D // 16058

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}
// call Array.new
@6 // 16059
D=A // 16060
@14 // 16061
M=D // 16062
@Array.new // 16063
D=A // 16064
@13 // 16065
M=D // 16066
@Output.create.ret.0 // 16067
D=A // 16068
@CALL // 16069
0;JMP // 16070
(Output.create.ret.0)

////PopInstruction{address=local 0}
@SP // 16071
AM=M-1 // 16072
D=M // 16073
@LCL // 16074
A=M // 16075
M=D // 16076

////PushInstruction("local 0")
@LCL // 16077
A=M // 16078
D=M // 16079
@SP // 16080
AM=M+1 // 16081
A=A-1 // 16082
M=D // 16083

////PushInstruction("static 0")
@Output.0 // 16084
D=M // 16085
@SP // 16086
AM=M+1 // 16087
A=A-1 // 16088
M=D // 16089

////PushInstruction("argument 0")
@ARG // 16090
A=M // 16091
D=M // 16092
@SP // 16093
AM=M+1 // 16094
A=A-1 // 16095
M=D // 16096

////ArithmeticInstruction{ADD}
@SP // 16097
AM=M-1 // 16098
D=M // 16099
A=A-1 // 16100
M=D+M // 16101

////PopInstruction{address=pointer 1}
@SP // 16102
AM=M-1 // 16103
D=M // 16104
@4 // 16105
M=D // 16106

////PopInstruction{address=that 0}
@SP // 16107
AM=M-1 // 16108
D=M // 16109
@THAT // 16110
A=M // 16111
M=D // 16112

////PushInstruction("argument 1")
@ARG // 16113
A=M+1 // 16114
D=M // 16115
@SP // 16116
AM=M+1 // 16117
A=A-1 // 16118
M=D // 16119

////PushInstruction("local 0")
@LCL // 16120
A=M // 16121
D=M // 16122
@SP // 16123
AM=M+1 // 16124
A=A-1 // 16125
M=D // 16126

////PushInstruction("constant 0")
@SP // 16127
AM=M+1 // 16128
A=A-1 // 16129
M=0 // 16130

////ArithmeticInstruction{ADD}
@SP // 16131
AM=M-1 // 16132
D=M // 16133
A=A-1 // 16134
M=D+M // 16135

////PopInstruction{address=pointer 1}
@SP // 16136
AM=M-1 // 16137
D=M // 16138
@4 // 16139
M=D // 16140

////PopInstruction{address=that 0}
@SP // 16141
AM=M-1 // 16142
D=M // 16143
@THAT // 16144
A=M // 16145
M=D // 16146

////PushInstruction("argument 2")
@ARG // 16147
A=M+1 // 16148
A=A+1 // 16149
D=M // 16150
@SP // 16151
AM=M+1 // 16152
A=A-1 // 16153
M=D // 16154

////PushInstruction("local 0")
@LCL // 16155
A=M // 16156
D=M // 16157
@SP // 16158
AM=M+1 // 16159
A=A-1 // 16160
M=D // 16161

////PushInstruction("constant 1")
@SP // 16162
AM=M+1 // 16163
A=A-1 // 16164
M=1 // 16165

////ArithmeticInstruction{ADD}
@SP // 16166
AM=M-1 // 16167
D=M // 16168
A=A-1 // 16169
M=D+M // 16170

////PopInstruction{address=pointer 1}
@SP // 16171
AM=M-1 // 16172
D=M // 16173
@4 // 16174
M=D // 16175

////PopInstruction{address=that 0}
@SP // 16176
AM=M-1 // 16177
D=M // 16178
@THAT // 16179
A=M // 16180
M=D // 16181

////PushInstruction("argument 3")
@ARG // 16182
A=M+1 // 16183
A=A+1 // 16184
A=A+1 // 16185
D=M // 16186
@SP // 16187
AM=M+1 // 16188
A=A-1 // 16189
M=D // 16190

////PushInstruction("local 0")
@LCL // 16191
A=M // 16192
D=M // 16193
@SP // 16194
AM=M+1 // 16195
A=A-1 // 16196
M=D // 16197

////PushInstruction("constant 2")
@2 // 16198
D=A // 16199
@SP // 16200
AM=M+1 // 16201
A=A-1 // 16202
M=D // 16203

////ArithmeticInstruction{ADD}
@SP // 16204
AM=M-1 // 16205
D=M // 16206
A=A-1 // 16207
M=D+M // 16208

////PopInstruction{address=pointer 1}
@SP // 16209
AM=M-1 // 16210
D=M // 16211
@4 // 16212
M=D // 16213

////PopInstruction{address=that 0}
@SP // 16214
AM=M-1 // 16215
D=M // 16216
@THAT // 16217
A=M // 16218
M=D // 16219

////PushInstruction("argument 4")
@ARG // 16220
D=M // 16221
@4 // 16222
A=D+A // 16223
D=M // 16224
@SP // 16225
AM=M+1 // 16226
A=A-1 // 16227
M=D // 16228

////PushInstruction("local 0")
@LCL // 16229
A=M // 16230
D=M // 16231
@SP // 16232
AM=M+1 // 16233
A=A-1 // 16234
M=D // 16235

////PushInstruction("constant 3")
@3 // 16236
D=A // 16237
@SP // 16238
AM=M+1 // 16239
A=A-1 // 16240
M=D // 16241

////ArithmeticInstruction{ADD}
@SP // 16242
AM=M-1 // 16243
D=M // 16244
A=A-1 // 16245
M=D+M // 16246

////PopInstruction{address=pointer 1}
@SP // 16247
AM=M-1 // 16248
D=M // 16249
@4 // 16250
M=D // 16251

////PopInstruction{address=that 0}
@SP // 16252
AM=M-1 // 16253
D=M // 16254
@THAT // 16255
A=M // 16256
M=D // 16257

////PushInstruction("argument 5")
@ARG // 16258
D=M // 16259
@5 // 16260
A=D+A // 16261
D=M // 16262
@SP // 16263
AM=M+1 // 16264
A=A-1 // 16265
M=D // 16266

////PushInstruction("local 0")
@LCL // 16267
A=M // 16268
D=M // 16269
@SP // 16270
AM=M+1 // 16271
A=A-1 // 16272
M=D // 16273

////PushInstruction("constant 4")
@4 // 16274
D=A // 16275
@SP // 16276
AM=M+1 // 16277
A=A-1 // 16278
M=D // 16279

////ArithmeticInstruction{ADD}
@SP // 16280
AM=M-1 // 16281
D=M // 16282
A=A-1 // 16283
M=D+M // 16284

////PopInstruction{address=pointer 1}
@SP // 16285
AM=M-1 // 16286
D=M // 16287
@4 // 16288
M=D // 16289

////PopInstruction{address=that 0}
@SP // 16290
AM=M-1 // 16291
D=M // 16292
@THAT // 16293
A=M // 16294
M=D // 16295

////PushInstruction("argument 6")
@ARG // 16296
D=M // 16297
@6 // 16298
A=D+A // 16299
D=M // 16300
@SP // 16301
AM=M+1 // 16302
A=A-1 // 16303
M=D // 16304

////PushInstruction("local 0")
@LCL // 16305
A=M // 16306
D=M // 16307
@SP // 16308
AM=M+1 // 16309
A=A-1 // 16310
M=D // 16311

////PushInstruction("constant 5")
@5 // 16312
D=A // 16313
@SP // 16314
AM=M+1 // 16315
A=A-1 // 16316
M=D // 16317

////ArithmeticInstruction{ADD}
@SP // 16318
AM=M-1 // 16319
D=M // 16320
A=A-1 // 16321
M=D+M // 16322

////PopInstruction{address=pointer 1}
@SP // 16323
AM=M-1 // 16324
D=M // 16325
@4 // 16326
M=D // 16327

////PopInstruction{address=that 0}
@SP // 16328
AM=M-1 // 16329
D=M // 16330
@THAT // 16331
A=M // 16332
M=D // 16333

////PushInstruction("argument 7")
@ARG // 16334
D=M // 16335
@7 // 16336
A=D+A // 16337
D=M // 16338
@SP // 16339
AM=M+1 // 16340
A=A-1 // 16341
M=D // 16342

////PushInstruction("local 0")
@LCL // 16343
A=M // 16344
D=M // 16345
@SP // 16346
AM=M+1 // 16347
A=A-1 // 16348
M=D // 16349

////PushInstruction("constant 6")
@6 // 16350
D=A // 16351
@SP // 16352
AM=M+1 // 16353
A=A-1 // 16354
M=D // 16355

////ArithmeticInstruction{ADD}
@SP // 16356
AM=M-1 // 16357
D=M // 16358
A=A-1 // 16359
M=D+M // 16360

////PopInstruction{address=pointer 1}
@SP // 16361
AM=M-1 // 16362
D=M // 16363
@4 // 16364
M=D // 16365

////PopInstruction{address=that 0}
@SP // 16366
AM=M-1 // 16367
D=M // 16368
@THAT // 16369
A=M // 16370
M=D // 16371

////PushInstruction("argument 8")
@ARG // 16372
D=M // 16373
@8 // 16374
A=D+A // 16375
D=M // 16376
@SP // 16377
AM=M+1 // 16378
A=A-1 // 16379
M=D // 16380

////PushInstruction("local 0")
@LCL // 16381
A=M // 16382
D=M // 16383
@SP // 16384
AM=M+1 // 16385
A=A-1 // 16386
M=D // 16387

////PushInstruction("constant 7")
@7 // 16388
D=A // 16389
@SP // 16390
AM=M+1 // 16391
A=A-1 // 16392
M=D // 16393

////ArithmeticInstruction{ADD}
@SP // 16394
AM=M-1 // 16395
D=M // 16396
A=A-1 // 16397
M=D+M // 16398

////PopInstruction{address=pointer 1}
@SP // 16399
AM=M-1 // 16400
D=M // 16401
@4 // 16402
M=D // 16403

////PopInstruction{address=that 0}
@SP // 16404
AM=M-1 // 16405
D=M // 16406
@THAT // 16407
A=M // 16408
M=D // 16409

////PushInstruction("argument 9")
@ARG // 16410
D=M // 16411
@9 // 16412
A=D+A // 16413
D=M // 16414
@SP // 16415
AM=M+1 // 16416
A=A-1 // 16417
M=D // 16418

////PushInstruction("local 0")
@LCL // 16419
A=M // 16420
D=M // 16421
@SP // 16422
AM=M+1 // 16423
A=A-1 // 16424
M=D // 16425

////PushInstruction("constant 8")
@8 // 16426
D=A // 16427
@SP // 16428
AM=M+1 // 16429
A=A-1 // 16430
M=D // 16431

////ArithmeticInstruction{ADD}
@SP // 16432
AM=M-1 // 16433
D=M // 16434
A=A-1 // 16435
M=D+M // 16436

////PopInstruction{address=pointer 1}
@SP // 16437
AM=M-1 // 16438
D=M // 16439
@4 // 16440
M=D // 16441

////PopInstruction{address=that 0}
@SP // 16442
AM=M-1 // 16443
D=M // 16444
@THAT // 16445
A=M // 16446
M=D // 16447

////PushInstruction("argument 10")
@ARG // 16448
D=M // 16449
@10 // 16450
A=D+A // 16451
D=M // 16452
@SP // 16453
AM=M+1 // 16454
A=A-1 // 16455
M=D // 16456

////PushInstruction("local 0")
@LCL // 16457
A=M // 16458
D=M // 16459
@SP // 16460
AM=M+1 // 16461
A=A-1 // 16462
M=D // 16463

////PushInstruction("constant 9")
@9 // 16464
D=A // 16465
@SP // 16466
AM=M+1 // 16467
A=A-1 // 16468
M=D // 16469

////ArithmeticInstruction{ADD}
@SP // 16470
AM=M-1 // 16471
D=M // 16472
A=A-1 // 16473
M=D+M // 16474

////PopInstruction{address=pointer 1}
@SP // 16475
AM=M-1 // 16476
D=M // 16477
@4 // 16478
M=D // 16479

////PopInstruction{address=that 0}
@SP // 16480
AM=M-1 // 16481
D=M // 16482
@THAT // 16483
A=M // 16484
M=D // 16485

////PushInstruction("argument 11")
@ARG // 16486
D=M // 16487
@11 // 16488
A=D+A // 16489
D=M // 16490
@SP // 16491
AM=M+1 // 16492
A=A-1 // 16493
M=D // 16494

////PushInstruction("local 0")
@LCL // 16495
A=M // 16496
D=M // 16497
@SP // 16498
AM=M+1 // 16499
A=A-1 // 16500
M=D // 16501

////PushInstruction("constant 10")
@10 // 16502
D=A // 16503
@SP // 16504
AM=M+1 // 16505
A=A-1 // 16506
M=D // 16507

////ArithmeticInstruction{ADD}
@SP // 16508
AM=M-1 // 16509
D=M // 16510
A=A-1 // 16511
M=D+M // 16512

////PopInstruction{address=pointer 1}
@SP // 16513
AM=M-1 // 16514
D=M // 16515
@4 // 16516
M=D // 16517

////PopInstruction{address=that 0}
@SP // 16518
AM=M-1 // 16519
D=M // 16520
@THAT // 16521
A=M // 16522
M=D // 16523

////PushInstruction("constant 0")
@SP // 16524
AM=M+1 // 16525
A=A-1 // 16526
M=0 // 16527

////ReturnInstruction{}
@RETURN // 16528
0;JMP // 16529

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////PushInstruction("argument 0")
@ARG // 16530
A=M // 16531
D=M // 16532
@SP // 16533
AM=M+1 // 16534
A=A-1 // 16535
M=D // 16536

////PushInstruction("constant 32")
@32 // 16537
D=A // 16538
@SP // 16539
AM=M+1 // 16540
A=A-1 // 16541
M=D // 16542

////ArithmeticInstruction{LT}
@COMPARE_Output.getMap_lt0 // 16543
D=A // 16544
@13 // 16545
M=D // 16546
@SP // 16547
AM=M-1 // 16548
D=M // 16549
A=A-1 // 16550
D=M-D // 16551
@DO_LT // 16552
0;JMP // 16553
(COMPARE_Output.getMap_lt0)
@SP // 16554
AM=M+1 // 16555
A=A-1 // 16556
M=D // 16557

////PushInstruction("argument 0")
@ARG // 16558
A=M // 16559
D=M // 16560
@SP // 16561
AM=M+1 // 16562
A=A-1 // 16563
M=D // 16564

////PushInstruction("constant 126")
@126 // 16565
D=A // 16566
@SP // 16567
AM=M+1 // 16568
A=A-1 // 16569
M=D // 16570

////ArithmeticInstruction{GT}
@COMPARE_Output.getMap_gt1 // 16571
D=A // 16572
@13 // 16573
M=D // 16574
@SP // 16575
AM=M-1 // 16576
D=M // 16577
A=A-1 // 16578
D=M-D // 16579
@DO_GT // 16580
0;JMP // 16581
(COMPARE_Output.getMap_gt1)
@SP // 16582
AM=M+1 // 16583
A=A-1 // 16584
M=D // 16585

////ArithmeticInstruction{OR}
@SP // 16586
AM=M-1 // 16587
D=M // 16588
A=A-1 // 16589
M=D|M // 16590

////PushInstruction("constant 0")
@SP // 16591
AM=M+1 // 16592
A=A-1 // 16593
M=0 // 16594

////ArithmeticInstruction{EQ}
@COMPARE_Output.getMap_eq2 // 16595
D=A // 16596
@13 // 16597
M=D // 16598
@SP // 16599
AM=M-1 // 16600
D=M // 16601
A=A-1 // 16602
D=M-D // 16603
@DO_EQ // 16604
0;JMP // 16605
(COMPARE_Output.getMap_eq2)
@SP // 16606
AM=M+1 // 16607
A=A-1 // 16608
M=D // 16609

////IfGotoInstruction{label='Output.getMap.IfElse1}
// if-goto Output.getMap.IfElse1
@SP // 16610
AM=M-1 // 16611
D=M // 16612
@Output.getMap.IfElse1 // 16613
D;JNE // 16614

////PushInstruction("constant 0")
@SP // 16615
AM=M+1 // 16616
A=A-1 // 16617
M=0 // 16618

////PopInstruction{address=argument 0}
@SP // 16619
AM=M-1 // 16620
D=M // 16621
@ARG // 16622
A=M // 16623
M=D // 16624

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 16625
0;JMP // 16626

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////PushInstruction("static 0")
@Output.0 // 16627
D=M // 16628
@SP // 16629
AM=M+1 // 16630
A=A-1 // 16631
M=D // 16632

////PushInstruction("argument 0")
@ARG // 16633
A=M // 16634
D=M // 16635
@SP // 16636
AM=M+1 // 16637
A=A-1 // 16638
M=D // 16639

////ArithmeticInstruction{ADD}
@SP // 16640
AM=M-1 // 16641
D=M // 16642
A=A-1 // 16643
M=D+M // 16644

////PopInstruction{address=pointer 1}
@SP // 16645
AM=M-1 // 16646
D=M // 16647
@4 // 16648
M=D // 16649

////PushInstruction("that 0")
@THAT // 16650
A=M // 16651
D=M // 16652
@SP // 16653
AM=M+1 // 16654
A=A-1 // 16655
M=D // 16656

////ReturnInstruction{}
@RETURN // 16657
0;JMP // 16658

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushInstruction("argument 1")
@ARG // 16659
A=M+1 // 16660
D=M // 16661
@SP // 16662
AM=M+1 // 16663
A=A-1 // 16664
M=D // 16665

////PopInstruction{address=Output.1}
@SP // 16666
AM=M-1 // 16667
D=M // 16668
@Output.1 // 16669
M=D // 16670

////PushInstruction("argument 0")
@ARG // 16671
A=M // 16672
D=M // 16673
@SP // 16674
AM=M+1 // 16675
A=A-1 // 16676
M=D // 16677

////PopInstruction{address=Output.2}
@SP // 16678
AM=M-1 // 16679
D=M // 16680
@Output.2 // 16681
M=D // 16682

////PushInstruction("constant 0")
@SP // 16683
AM=M+1 // 16684
A=A-1 // 16685
M=0 // 16686

////ReturnInstruction{}
@RETURN // 16687
0;JMP // 16688

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 16689
AM=M+1 // 16690
A=A-1 // 16691
M=0 // 16692
@SP // 16693
AM=M+1 // 16694
A=A-1 // 16695
M=0 // 16696
@SP // 16697
AM=M+1 // 16698
A=A-1 // 16699
M=0 // 16700
@SP // 16701
AM=M+1 // 16702
A=A-1 // 16703
M=0 // 16704

////PushInstruction("argument 0")
@ARG // 16705
A=M // 16706
D=M // 16707
@SP // 16708
AM=M+1 // 16709
A=A-1 // 16710
M=D // 16711

////CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}
// call Output.getMap
@6 // 16712
D=A // 16713
@14 // 16714
M=D // 16715
@Output.getMap // 16716
D=A // 16717
@13 // 16718
M=D // 16719
@Output.printChar.ret.0 // 16720
D=A // 16721
@CALL // 16722
0;JMP // 16723
(Output.printChar.ret.0)

////PopInstruction{address=local 0}
@SP // 16724
AM=M-1 // 16725
D=M // 16726
@LCL // 16727
A=M // 16728
M=D // 16729

////PushInstruction("constant 0")
@SP // 16730
AM=M+1 // 16731
A=A-1 // 16732
M=0 // 16733

////PopInstruction{address=local 3}
@SP // 16734
AM=M-1 // 16735
D=M // 16736
@LCL // 16737
A=M+1 // 16738
A=A+1 // 16739
A=A+1 // 16740
M=D // 16741

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////PushInstruction("local 3")
@LCL // 16742
A=M+1 // 16743
A=A+1 // 16744
A=A+1 // 16745
D=M // 16746
@SP // 16747
AM=M+1 // 16748
A=A-1 // 16749
M=D // 16750

////PushInstruction("constant 11")
@11 // 16751
D=A // 16752
@SP // 16753
AM=M+1 // 16754
A=A-1 // 16755
M=D // 16756

////ArithmeticInstruction{LT}
@COMPARE_Output.printChar_lt3 // 16757
D=A // 16758
@13 // 16759
M=D // 16760
@SP // 16761
AM=M-1 // 16762
D=M // 16763
A=A-1 // 16764
D=M-D // 16765
@DO_LT // 16766
0;JMP // 16767
(COMPARE_Output.printChar_lt3)
@SP // 16768
AM=M+1 // 16769
A=A-1 // 16770
M=D // 16771

////PushInstruction("constant 0")
@SP // 16772
AM=M+1 // 16773
A=A-1 // 16774
M=0 // 16775

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq4 // 16776
D=A // 16777
@13 // 16778
M=D // 16779
@SP // 16780
AM=M-1 // 16781
D=M // 16782
A=A-1 // 16783
D=M-D // 16784
@DO_EQ // 16785
0;JMP // 16786
(COMPARE_Output.printChar_eq4)
@SP // 16787
AM=M+1 // 16788
A=A-1 // 16789
M=D // 16790

////IfGotoInstruction{label='WHILE_END_Output.printChar1}
// if-goto WHILE_END_Output.printChar1
@SP // 16791
AM=M-1 // 16792
D=M // 16793
@WHILE_END_Output.printChar1 // 16794
D;JNE // 16795

////PushInstruction("constant 16384")
@16384 // 16796
D=A // 16797
@SP // 16798
AM=M+1 // 16799
A=A-1 // 16800
M=D // 16801

////PushInstruction("static 2")
@Output.2 // 16802
D=M // 16803
@SP // 16804
AM=M+1 // 16805
A=A-1 // 16806
M=D // 16807

////PushInstruction("constant 11")
@11 // 16808
D=A // 16809
@SP // 16810
AM=M+1 // 16811
A=A-1 // 16812
M=D // 16813

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16814
D=A // 16815
@14 // 16816
M=D // 16817
@Math.multiply // 16818
D=A // 16819
@13 // 16820
M=D // 16821
@Output.printChar.ret.1 // 16822
D=A // 16823
@CALL // 16824
0;JMP // 16825
(Output.printChar.ret.1)

////PushInstruction("local 3")
@LCL // 16826
A=M+1 // 16827
A=A+1 // 16828
A=A+1 // 16829
D=M // 16830
@SP // 16831
AM=M+1 // 16832
A=A-1 // 16833
M=D // 16834

////ArithmeticInstruction{ADD}
@SP // 16835
AM=M-1 // 16836
D=M // 16837
A=A-1 // 16838
M=D+M // 16839

////PushInstruction("constant 32")
@32 // 16840
D=A // 16841
@SP // 16842
AM=M+1 // 16843
A=A-1 // 16844
M=D // 16845

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=2, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16846
D=A // 16847
@14 // 16848
M=D // 16849
@Math.multiply // 16850
D=A // 16851
@13 // 16852
M=D // 16853
@Output.printChar.ret.2 // 16854
D=A // 16855
@CALL // 16856
0;JMP // 16857
(Output.printChar.ret.2)

////ArithmeticInstruction{ADD}
@SP // 16858
AM=M-1 // 16859
D=M // 16860
A=A-1 // 16861
M=D+M // 16862

////PushInstruction("static 1")
@Output.1 // 16863
D=M // 16864
@SP // 16865
AM=M+1 // 16866
A=A-1 // 16867
M=D // 16868

////PushInstruction("constant 2")
@2 // 16869
D=A // 16870
@SP // 16871
AM=M+1 // 16872
A=A-1 // 16873
M=D // 16874

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=3, Output.create=1}, currentFunction='Output.printChar'}
// call Math.divide
@7 // 16875
D=A // 16876
@14 // 16877
M=D // 16878
@Math.divide // 16879
D=A // 16880
@13 // 16881
M=D // 16882
@Output.printChar.ret.3 // 16883
D=A // 16884
@CALL // 16885
0;JMP // 16886
(Output.printChar.ret.3)

////ArithmeticInstruction{ADD}
@SP // 16887
AM=M-1 // 16888
D=M // 16889
A=A-1 // 16890
M=D+M // 16891

////PopInstruction{address=local 1}
@SP // 16892
AM=M-1 // 16893
D=M // 16894
@LCL // 16895
A=M+1 // 16896
M=D // 16897

////PushInstruction("static 1")
@Output.1 // 16898
D=M // 16899
@SP // 16900
AM=M+1 // 16901
A=A-1 // 16902
M=D // 16903

////PushInstruction("constant 1")
@SP // 16904
AM=M+1 // 16905
A=A-1 // 16906
M=1 // 16907

////ArithmeticInstruction{AND}
@SP // 16908
AM=M-1 // 16909
D=M // 16910
A=A-1 // 16911
M=D&M // 16912

////PushInstruction("constant 0")
@SP // 16913
AM=M+1 // 16914
A=A-1 // 16915
M=0 // 16916

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq5 // 16917
D=A // 16918
@13 // 16919
M=D // 16920
@SP // 16921
AM=M-1 // 16922
D=M // 16923
A=A-1 // 16924
D=M-D // 16925
@DO_EQ // 16926
0;JMP // 16927
(COMPARE_Output.printChar_eq5)
@SP // 16928
AM=M+1 // 16929
A=A-1 // 16930
M=D // 16931

////PushInstruction("constant 0")
@SP // 16932
AM=M+1 // 16933
A=A-1 // 16934
M=0 // 16935

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq6 // 16936
D=A // 16937
@13 // 16938
M=D // 16939
@SP // 16940
AM=M-1 // 16941
D=M // 16942
A=A-1 // 16943
D=M-D // 16944
@DO_EQ // 16945
0;JMP // 16946
(COMPARE_Output.printChar_eq6)
@SP // 16947
AM=M+1 // 16948
A=A-1 // 16949
M=D // 16950

////IfGotoInstruction{label='Output.printChar.IfElse1}
// if-goto Output.printChar.IfElse1
@SP // 16951
AM=M-1 // 16952
D=M // 16953
@Output.printChar.IfElse1 // 16954
D;JNE // 16955

////PushInstruction("local 0")
@LCL // 16956
A=M // 16957
D=M // 16958
@SP // 16959
AM=M+1 // 16960
A=A-1 // 16961
M=D // 16962

////PushInstruction("local 3")
@LCL // 16963
A=M+1 // 16964
A=A+1 // 16965
A=A+1 // 16966
D=M // 16967
@SP // 16968
AM=M+1 // 16969
A=A-1 // 16970
M=D // 16971

////ArithmeticInstruction{ADD}
@SP // 16972
AM=M-1 // 16973
D=M // 16974
A=A-1 // 16975
M=D+M // 16976

////PopInstruction{address=pointer 1}
@SP // 16977
AM=M-1 // 16978
D=M // 16979
@4 // 16980
M=D // 16981

////PushInstruction("that 0")
@THAT // 16982
A=M // 16983
D=M // 16984
@SP // 16985
AM=M+1 // 16986
A=A-1 // 16987
M=D // 16988

////PopInstruction{address=local 2}
@SP // 16989
AM=M-1 // 16990
D=M // 16991
@LCL // 16992
A=M+1 // 16993
A=A+1 // 16994
M=D // 16995

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 16996
0;JMP // 16997

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushInstruction("local 0")
@LCL // 16998
A=M // 16999
D=M // 17000
@SP // 17001
AM=M+1 // 17002
A=A-1 // 17003
M=D // 17004

////PushInstruction("local 3")
@LCL // 17005
A=M+1 // 17006
A=A+1 // 17007
A=A+1 // 17008
D=M // 17009
@SP // 17010
AM=M+1 // 17011
A=A-1 // 17012
M=D // 17013

////ArithmeticInstruction{ADD}
@SP // 17014
AM=M-1 // 17015
D=M // 17016
A=A-1 // 17017
M=D+M // 17018

////PopInstruction{address=pointer 1}
@SP // 17019
AM=M-1 // 17020
D=M // 17021
@4 // 17022
M=D // 17023

////PushInstruction("that 0")
@THAT // 17024
A=M // 17025
D=M // 17026
@SP // 17027
AM=M+1 // 17028
A=A-1 // 17029
M=D // 17030

////PushInstruction("constant 256")
@256 // 17031
D=A // 17032
@SP // 17033
AM=M+1 // 17034
A=A-1 // 17035
M=D // 17036

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=4, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 17037
D=A // 17038
@14 // 17039
M=D // 17040
@Math.multiply // 17041
D=A // 17042
@13 // 17043
M=D // 17044
@Output.printChar.ret.4 // 17045
D=A // 17046
@CALL // 17047
0;JMP // 17048
(Output.printChar.ret.4)

////PopInstruction{address=local 2}
@SP // 17049
AM=M-1 // 17050
D=M // 17051
@LCL // 17052
A=M+1 // 17053
A=A+1 // 17054
M=D // 17055

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushInstruction("local 1")
@LCL // 17056
A=M+1 // 17057
D=M // 17058
@SP // 17059
AM=M+1 // 17060
A=A-1 // 17061
M=D // 17062

////PushInstruction("constant 0")
@SP // 17063
AM=M+1 // 17064
A=A-1 // 17065
M=0 // 17066

////ArithmeticInstruction{ADD}
@SP // 17067
AM=M-1 // 17068
D=M // 17069
A=A-1 // 17070
M=D+M // 17071

////PopInstruction{address=pointer 1}
@SP // 17072
AM=M-1 // 17073
D=M // 17074
@4 // 17075
M=D // 17076

////PushInstruction("that 0")
@THAT // 17077
A=M // 17078
D=M // 17079
@SP // 17080
AM=M+1 // 17081
A=A-1 // 17082
M=D // 17083

////PushInstruction("local 2")
@LCL // 17084
A=M+1 // 17085
A=A+1 // 17086
D=M // 17087
@SP // 17088
AM=M+1 // 17089
A=A-1 // 17090
M=D // 17091

////ArithmeticInstruction{OR}
@SP // 17092
AM=M-1 // 17093
D=M // 17094
A=A-1 // 17095
M=D|M // 17096

////PushInstruction("local 1")
@LCL // 17097
A=M+1 // 17098
D=M // 17099
@SP // 17100
AM=M+1 // 17101
A=A-1 // 17102
M=D // 17103

////PushInstruction("constant 0")
@SP // 17104
AM=M+1 // 17105
A=A-1 // 17106
M=0 // 17107

////ArithmeticInstruction{ADD}
@SP // 17108
AM=M-1 // 17109
D=M // 17110
A=A-1 // 17111
M=D+M // 17112

////PopInstruction{address=pointer 1}
@SP // 17113
AM=M-1 // 17114
D=M // 17115
@4 // 17116
M=D // 17117

////PopInstruction{address=that 0}
@SP // 17118
AM=M-1 // 17119
D=M // 17120
@THAT // 17121
A=M // 17122
M=D // 17123

////PushInstruction("local 3")
@LCL // 17124
A=M+1 // 17125
A=A+1 // 17126
A=A+1 // 17127
D=M // 17128
@SP // 17129
AM=M+1 // 17130
A=A-1 // 17131
M=D // 17132

////PushInstruction("constant 1")
@SP // 17133
AM=M+1 // 17134
A=A-1 // 17135
M=1 // 17136

////ArithmeticInstruction{ADD}
@SP // 17137
AM=M-1 // 17138
D=M // 17139
A=A-1 // 17140
M=D+M // 17141

////PopInstruction{address=local 3}
@SP // 17142
AM=M-1 // 17143
D=M // 17144
@LCL // 17145
A=M+1 // 17146
A=A+1 // 17147
A=A+1 // 17148
M=D // 17149

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 17150
0;JMP // 17151

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////PushInstruction("static 1")
@Output.1 // 17152
D=M // 17153
@SP // 17154
AM=M+1 // 17155
A=A-1 // 17156
M=D // 17157

////PushInstruction("constant 63")
@63 // 17158
D=A // 17159
@SP // 17160
AM=M+1 // 17161
A=A-1 // 17162
M=D // 17163

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq7 // 17164
D=A // 17165
@13 // 17166
M=D // 17167
@SP // 17168
AM=M-1 // 17169
D=M // 17170
A=A-1 // 17171
D=M-D // 17172
@DO_EQ // 17173
0;JMP // 17174
(COMPARE_Output.printChar_eq7)
@SP // 17175
AM=M+1 // 17176
A=A-1 // 17177
M=D // 17178

////PushInstruction("constant 0")
@SP // 17179
AM=M+1 // 17180
A=A-1 // 17181
M=0 // 17182

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq8 // 17183
D=A // 17184
@13 // 17185
M=D // 17186
@SP // 17187
AM=M-1 // 17188
D=M // 17189
A=A-1 // 17190
D=M-D // 17191
@DO_EQ // 17192
0;JMP // 17193
(COMPARE_Output.printChar_eq8)
@SP // 17194
AM=M+1 // 17195
A=A-1 // 17196
M=D // 17197

////IfGotoInstruction{label='Output.printChar.IfElse2}
// if-goto Output.printChar.IfElse2
@SP // 17198
AM=M-1 // 17199
D=M // 17200
@Output.printChar.IfElse2 // 17201
D;JNE // 17202

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}, currentFunction='Output.printChar'}
// call Output.println
@5 // 17203
D=A // 17204
@14 // 17205
M=D // 17206
@Output.println // 17207
D=A // 17208
@13 // 17209
M=D // 17210
@Output.printChar.ret.5 // 17211
D=A // 17212
@CALL // 17213
0;JMP // 17214
(Output.printChar.ret.5)

////PopInstruction{address=temp 0}
@SP // 17215
AM=M-1 // 17216
D=M // 17217
@5 // 17218
M=D // 17219

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 17220
0;JMP // 17221

////LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)

////PushInstruction("static 1")
@Output.1 // 17222
D=M // 17223
@SP // 17224
AM=M+1 // 17225
A=A-1 // 17226
M=D // 17227

////PushInstruction("constant 1")
@SP // 17228
AM=M+1 // 17229
A=A-1 // 17230
M=1 // 17231

////ArithmeticInstruction{ADD}
@SP // 17232
AM=M-1 // 17233
D=M // 17234
A=A-1 // 17235
M=D+M // 17236

////PopInstruction{address=Output.1}
@SP // 17237
AM=M-1 // 17238
D=M // 17239
@Output.1 // 17240
M=D // 17241

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 17242
AM=M+1 // 17243
A=A-1 // 17244
M=0 // 17245

////ReturnInstruction{}
@RETURN // 17246
0;JMP // 17247

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 17248
AM=M+1 // 17249
A=A-1 // 17250
M=0 // 17251

////PushInstruction("constant 0")
@SP // 17252
AM=M+1 // 17253
A=A-1 // 17254
M=0 // 17255

////PopInstruction{address=local 0}
@SP // 17256
AM=M-1 // 17257
D=M // 17258
@LCL // 17259
A=M // 17260
M=D // 17261

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////PushInstruction("local 0")
@LCL // 17262
A=M // 17263
D=M // 17264
@SP // 17265
AM=M+1 // 17266
A=A-1 // 17267
M=D // 17268

////PushInstruction("argument 0")
@ARG // 17269
A=M // 17270
D=M // 17271
@SP // 17272
AM=M+1 // 17273
A=A-1 // 17274
M=D // 17275

////CallInstruction{calleeFunction='String.length', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=0, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.length
@6 // 17276
D=A // 17277
@14 // 17278
M=D // 17279
@String.length // 17280
D=A // 17281
@13 // 17282
M=D // 17283
@Output.printString.ret.0 // 17284
D=A // 17285
@CALL // 17286
0;JMP // 17287
(Output.printString.ret.0)

////ArithmeticInstruction{LT}
@COMPARE_Output.printString_lt9 // 17288
D=A // 17289
@13 // 17290
M=D // 17291
@SP // 17292
AM=M-1 // 17293
D=M // 17294
A=A-1 // 17295
D=M-D // 17296
@DO_LT // 17297
0;JMP // 17298
(COMPARE_Output.printString_lt9)
@SP // 17299
AM=M+1 // 17300
A=A-1 // 17301
M=D // 17302

////PushInstruction("constant 0")
@SP // 17303
AM=M+1 // 17304
A=A-1 // 17305
M=0 // 17306

////ArithmeticInstruction{EQ}
@COMPARE_Output.printString_eq10 // 17307
D=A // 17308
@13 // 17309
M=D // 17310
@SP // 17311
AM=M-1 // 17312
D=M // 17313
A=A-1 // 17314
D=M-D // 17315
@DO_EQ // 17316
0;JMP // 17317
(COMPARE_Output.printString_eq10)
@SP // 17318
AM=M+1 // 17319
A=A-1 // 17320
M=D // 17321

////IfGotoInstruction{label='WHILE_END_Output.printString1}
// if-goto WHILE_END_Output.printString1
@SP // 17322
AM=M-1 // 17323
D=M // 17324
@WHILE_END_Output.printString1 // 17325
D;JNE // 17326

////PushInstruction("argument 0")
@ARG // 17327
A=M // 17328
D=M // 17329
@SP // 17330
AM=M+1 // 17331
A=A-1 // 17332
M=D // 17333

////PushInstruction("local 0")
@LCL // 17334
A=M // 17335
D=M // 17336
@SP // 17337
AM=M+1 // 17338
A=A-1 // 17339
M=D // 17340

////CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=1, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.charAt
@7 // 17341
D=A // 17342
@14 // 17343
M=D // 17344
@String.charAt // 17345
D=A // 17346
@13 // 17347
M=D // 17348
@Output.printString.ret.1 // 17349
D=A // 17350
@CALL // 17351
0;JMP // 17352
(Output.printString.ret.1)

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call Output.printChar
@6 // 17353
D=A // 17354
@14 // 17355
M=D // 17356
@Output.printChar // 17357
D=A // 17358
@13 // 17359
M=D // 17360
@Output.printString.ret.2 // 17361
D=A // 17362
@CALL // 17363
0;JMP // 17364
(Output.printString.ret.2)

////PopInstruction{address=temp 0}
@SP // 17365
AM=M-1 // 17366
D=M // 17367
@5 // 17368
M=D // 17369

////PushInstruction("local 0")
@LCL // 17370
A=M // 17371
D=M // 17372
@SP // 17373
AM=M+1 // 17374
A=A-1 // 17375
M=D // 17376

////PushInstruction("constant 1")
@SP // 17377
AM=M+1 // 17378
A=A-1 // 17379
M=1 // 17380

////ArithmeticInstruction{ADD}
@SP // 17381
AM=M-1 // 17382
D=M // 17383
A=A-1 // 17384
M=D+M // 17385

////PopInstruction{address=local 0}
@SP // 17386
AM=M-1 // 17387
D=M // 17388
@LCL // 17389
A=M // 17390
M=D // 17391

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 17392
0;JMP // 17393

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 17394
AM=M+1 // 17395
A=A-1 // 17396
M=0 // 17397

////ReturnInstruction{}
@RETURN // 17398
0;JMP // 17399

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 17400
AM=M+1 // 17401
A=A-1 // 17402
M=0 // 17403

////PushInstruction("constant 10")
@10 // 17404
D=A // 17405
@SP // 17406
AM=M+1 // 17407
A=A-1 // 17408
M=D // 17409

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.new
@6 // 17410
D=A // 17411
@14 // 17412
M=D // 17413
@String.new // 17414
D=A // 17415
@13 // 17416
M=D // 17417
@Output.printInt.ret.0 // 17418
D=A // 17419
@CALL // 17420
0;JMP // 17421
(Output.printInt.ret.0)

////PopInstruction{address=local 0}
@SP // 17422
AM=M-1 // 17423
D=M // 17424
@LCL // 17425
A=M // 17426
M=D // 17427

////PushInstruction("local 0")
@LCL // 17428
A=M // 17429
D=M // 17430
@SP // 17431
AM=M+1 // 17432
A=A-1 // 17433
M=D // 17434

////PushInstruction("argument 0")
@ARG // 17435
A=M // 17436
D=M // 17437
@SP // 17438
AM=M+1 // 17439
A=A-1 // 17440
M=D // 17441

////CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=1, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.setInt
@7 // 17442
D=A // 17443
@14 // 17444
M=D // 17445
@String.setInt // 17446
D=A // 17447
@13 // 17448
M=D // 17449
@Output.printInt.ret.1 // 17450
D=A // 17451
@CALL // 17452
0;JMP // 17453
(Output.printInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 17454
AM=M-1 // 17455
D=M // 17456
@5 // 17457
M=D // 17458

////PushInstruction("local 0")
@LCL // 17459
A=M // 17460
D=M // 17461
@SP // 17462
AM=M+1 // 17463
A=A-1 // 17464
M=D // 17465

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=2, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call Output.printString
@6 // 17466
D=A // 17467
@14 // 17468
M=D // 17469
@Output.printString // 17470
D=A // 17471
@13 // 17472
M=D // 17473
@Output.printInt.ret.2 // 17474
D=A // 17475
@CALL // 17476
0;JMP // 17477
(Output.printInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 17478
AM=M-1 // 17479
D=M // 17480
@5 // 17481
M=D // 17482

////PushInstruction("local 0")
@LCL // 17483
A=M // 17484
D=M // 17485
@SP // 17486
AM=M+1 // 17487
A=A-1 // 17488
M=D // 17489

////CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=3, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.dispose
@6 // 17490
D=A // 17491
@14 // 17492
M=D // 17493
@String.dispose // 17494
D=A // 17495
@13 // 17496
M=D // 17497
@Output.printInt.ret.3 // 17498
D=A // 17499
@CALL // 17500
0;JMP // 17501
(Output.printInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 17502
AM=M-1 // 17503
D=M // 17504
@5 // 17505
M=D // 17506

////PushInstruction("constant 0")
@SP // 17507
AM=M+1 // 17508
A=A-1 // 17509
M=0 // 17510

////ReturnInstruction{}
@RETURN // 17511
0;JMP // 17512

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushInstruction("constant 0")
@SP // 17513
AM=M+1 // 17514
A=A-1 // 17515
M=0 // 17516

////PopInstruction{address=Output.1}
@SP // 17517
AM=M-1 // 17518
D=M // 17519
@Output.1 // 17520
M=D // 17521

////PushInstruction("static 2")
@Output.2 // 17522
D=M // 17523
@SP // 17524
AM=M+1 // 17525
A=A-1 // 17526
M=D // 17527

////PushInstruction("constant 22")
@22 // 17528
D=A // 17529
@SP // 17530
AM=M+1 // 17531
A=A-1 // 17532
M=D // 17533

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq11 // 17534
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
(COMPARE_Output.println_eq11)
@SP // 17545
AM=M+1 // 17546
A=A-1 // 17547
M=D // 17548

////PushInstruction("constant 0")
@SP // 17549
AM=M+1 // 17550
A=A-1 // 17551
M=0 // 17552

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq12 // 17553
D=A // 17554
@13 // 17555
M=D // 17556
@SP // 17557
AM=M-1 // 17558
D=M // 17559
A=A-1 // 17560
D=M-D // 17561
@DO_EQ // 17562
0;JMP // 17563
(COMPARE_Output.println_eq12)
@SP // 17564
AM=M+1 // 17565
A=A-1 // 17566
M=D // 17567

////IfGotoInstruction{label='Output.println.IfElse1}
// if-goto Output.println.IfElse1
@SP // 17568
AM=M-1 // 17569
D=M // 17570
@Output.println.IfElse1 // 17571
D;JNE // 17572

////PushInstruction("constant 0")
@SP // 17573
AM=M+1 // 17574
A=A-1 // 17575
M=0 // 17576

////PopInstruction{address=Output.2}
@SP // 17577
AM=M-1 // 17578
D=M // 17579
@Output.2 // 17580
M=D // 17581

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 17582
0;JMP // 17583

////LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)

////PushInstruction("static 2")
@Output.2 // 17584
D=M // 17585
@SP // 17586
AM=M+1 // 17587
A=A-1 // 17588
M=D // 17589

////PushInstruction("constant 1")
@SP // 17590
AM=M+1 // 17591
A=A-1 // 17592
M=1 // 17593

////ArithmeticInstruction{ADD}
@SP // 17594
AM=M-1 // 17595
D=M // 17596
A=A-1 // 17597
M=D+M // 17598

////PopInstruction{address=Output.2}
@SP // 17599
AM=M-1 // 17600
D=M // 17601
@Output.2 // 17602
M=D // 17603

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17604
AM=M+1 // 17605
A=A-1 // 17606
M=0 // 17607

////ReturnInstruction{}
@RETURN // 17608
0;JMP // 17609

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////PushInstruction("static 1")
@Output.1 // 17610
D=M // 17611
@SP // 17612
AM=M+1 // 17613
A=A-1 // 17614
M=D // 17615

////PushInstruction("constant 0")
@SP // 17616
AM=M+1 // 17617
A=A-1 // 17618
M=0 // 17619

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq13 // 17620
D=A // 17621
@13 // 17622
M=D // 17623
@SP // 17624
AM=M-1 // 17625
D=M // 17626
A=A-1 // 17627
D=M-D // 17628
@DO_EQ // 17629
0;JMP // 17630
(COMPARE_Output.backSpace_eq13)
@SP // 17631
AM=M+1 // 17632
A=A-1 // 17633
M=D // 17634

////PushInstruction("constant 0")
@SP // 17635
AM=M+1 // 17636
A=A-1 // 17637
M=0 // 17638

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq14 // 17639
D=A // 17640
@13 // 17641
M=D // 17642
@SP // 17643
AM=M-1 // 17644
D=M // 17645
A=A-1 // 17646
D=M-D // 17647
@DO_EQ // 17648
0;JMP // 17649
(COMPARE_Output.backSpace_eq14)
@SP // 17650
AM=M+1 // 17651
A=A-1 // 17652
M=D // 17653

////IfGotoInstruction{label='Output.backSpace.IfElse1}
// if-goto Output.backSpace.IfElse1
@SP // 17654
AM=M-1 // 17655
D=M // 17656
@Output.backSpace.IfElse1 // 17657
D;JNE // 17658

////PushInstruction("static 2")
@Output.2 // 17659
D=M // 17660
@SP // 17661
AM=M+1 // 17662
A=A-1 // 17663
M=D // 17664

////PushInstruction("constant 1")
@SP // 17665
AM=M+1 // 17666
A=A-1 // 17667
M=1 // 17668

////ArithmeticInstruction{SUB}
@SP // 17669
AM=M-1 // 17670
D=M // 17671
A=A-1 // 17672
M=M-D // 17673

////PopInstruction{address=Output.2}
@SP // 17674
AM=M-1 // 17675
D=M // 17676
@Output.2 // 17677
M=D // 17678

////PushInstruction("constant 63")
@63 // 17679
D=A // 17680
@SP // 17681
AM=M+1 // 17682
A=A-1 // 17683
M=D // 17684

////PopInstruction{address=Output.1}
@SP // 17685
AM=M-1 // 17686
D=M // 17687
@Output.1 // 17688
M=D // 17689

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 17690
0;JMP // 17691

////LabelInstruction{label='Output.backSpace.IfElse1}
// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)

////PushInstruction("static 1")
@Output.1 // 17692
D=M // 17693
@SP // 17694
AM=M+1 // 17695
A=A-1 // 17696
M=D // 17697

////PushInstruction("constant 1")
@SP // 17698
AM=M+1 // 17699
A=A-1 // 17700
M=1 // 17701

////ArithmeticInstruction{SUB}
@SP // 17702
AM=M-1 // 17703
D=M // 17704
A=A-1 // 17705
M=M-D // 17706

////PopInstruction{address=Output.1}
@SP // 17707
AM=M-1 // 17708
D=M // 17709
@Output.1 // 17710
M=D // 17711

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17712
AM=M+1 // 17713
A=A-1 // 17714
M=0 // 17715

////ReturnInstruction{}
@RETURN // 17716
0;JMP // 17717

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////PushInstruction("constant 0")
@SP // 17718
AM=M+1 // 17719
A=A-1 // 17720
M=0 // 17721

////PushInstruction("constant 220")
@220 // 17722
D=A // 17723
@SP // 17724
AM=M+1 // 17725
A=A-1 // 17726
M=D // 17727

////PushInstruction("constant 511")
@511 // 17728
D=A // 17729
@SP // 17730
AM=M+1 // 17731
A=A-1 // 17732
M=D // 17733

////PushInstruction("constant 220")
@220 // 17734
D=A // 17735
@SP // 17736
AM=M+1 // 17737
A=A-1 // 17738
M=D // 17739

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17740
D=A // 17741
@14 // 17742
M=D // 17743
@Screen.drawLine // 17744
D=A // 17745
@13 // 17746
M=D // 17747
@Main.main.ret.0 // 17748
D=A // 17749
@CALL // 17750
0;JMP // 17751
(Main.main.ret.0)

////PopInstruction{address=temp 0}
@SP // 17752
AM=M-1 // 17753
D=M // 17754
@5 // 17755
M=D // 17756

////PushInstruction("constant 280")
@280 // 17757
D=A // 17758
@SP // 17759
AM=M+1 // 17760
A=A-1 // 17761
M=D // 17762

////PushInstruction("constant 90")
@90 // 17763
D=A // 17764
@SP // 17765
AM=M+1 // 17766
A=A-1 // 17767
M=D // 17768

////PushInstruction("constant 410")
@410 // 17769
D=A // 17770
@SP // 17771
AM=M+1 // 17772
A=A-1 // 17773
M=D // 17774

////PushInstruction("constant 220")
@220 // 17775
D=A // 17776
@SP // 17777
AM=M+1 // 17778
A=A-1 // 17779
M=D // 17780

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=1}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17781
D=A // 17782
@14 // 17783
M=D // 17784
@Screen.drawRectangle // 17785
D=A // 17786
@13 // 17787
M=D // 17788
@Main.main.ret.1 // 17789
D=A // 17790
@CALL // 17791
0;JMP // 17792
(Main.main.ret.1)

////PopInstruction{address=temp 0}
@SP // 17793
AM=M-1 // 17794
D=M // 17795
@5 // 17796
M=D // 17797

////PushInstruction("constant 0")
@SP // 17798
AM=M+1 // 17799
A=A-1 // 17800
M=0 // 17801

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=2}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 17802
D=A // 17803
@14 // 17804
M=D // 17805
@Screen.setColor // 17806
D=A // 17807
@13 // 17808
M=D // 17809
@Main.main.ret.2 // 17810
D=A // 17811
@CALL // 17812
0;JMP // 17813
(Main.main.ret.2)

////PopInstruction{address=temp 0}
@SP // 17814
AM=M-1 // 17815
D=M // 17816
@5 // 17817
M=D // 17818

////PushInstruction("constant 350")
@350 // 17819
D=A // 17820
@SP // 17821
AM=M+1 // 17822
A=A-1 // 17823
M=D // 17824

////PushInstruction("constant 120")
@120 // 17825
D=A // 17826
@SP // 17827
AM=M+1 // 17828
A=A-1 // 17829
M=D // 17830

////PushInstruction("constant 390")
@390 // 17831
D=A // 17832
@SP // 17833
AM=M+1 // 17834
A=A-1 // 17835
M=D // 17836

////PushInstruction("constant 219")
@219 // 17837
D=A // 17838
@SP // 17839
AM=M+1 // 17840
A=A-1 // 17841
M=D // 17842

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=3}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17843
D=A // 17844
@14 // 17845
M=D // 17846
@Screen.drawRectangle // 17847
D=A // 17848
@13 // 17849
M=D // 17850
@Main.main.ret.3 // 17851
D=A // 17852
@CALL // 17853
0;JMP // 17854
(Main.main.ret.3)

////PopInstruction{address=temp 0}
@SP // 17855
AM=M-1 // 17856
D=M // 17857
@5 // 17858
M=D // 17859

////PushInstruction("constant 292")
@292 // 17860
D=A // 17861
@SP // 17862
AM=M+1 // 17863
A=A-1 // 17864
M=D // 17865

////PushInstruction("constant 120")
@120 // 17866
D=A // 17867
@SP // 17868
AM=M+1 // 17869
A=A-1 // 17870
M=D // 17871

////PushInstruction("constant 332")
@332 // 17872
D=A // 17873
@SP // 17874
AM=M+1 // 17875
A=A-1 // 17876
M=D // 17877

////PushInstruction("constant 150")
@150 // 17878
D=A // 17879
@SP // 17880
AM=M+1 // 17881
A=A-1 // 17882
M=D // 17883

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=4}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 17884
D=A // 17885
@14 // 17886
M=D // 17887
@Screen.drawRectangle // 17888
D=A // 17889
@13 // 17890
M=D // 17891
@Main.main.ret.4 // 17892
D=A // 17893
@CALL // 17894
0;JMP // 17895
(Main.main.ret.4)

////PopInstruction{address=temp 0}
@SP // 17896
AM=M-1 // 17897
D=M // 17898
@5 // 17899
M=D // 17900

////PushInstruction("constant 0")
@SP // 17901
AM=M+1 // 17902
A=A-1 // 17903
M=0 // 17904

////ArithmeticInstruction{NOT}
@SP // 17905
A=M-1 // 17906
M=!M // 17907

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=5}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 17908
D=A // 17909
@14 // 17910
M=D // 17911
@Screen.setColor // 17912
D=A // 17913
@13 // 17914
M=D // 17915
@Main.main.ret.5 // 17916
D=A // 17917
@CALL // 17918
0;JMP // 17919
(Main.main.ret.5)

////PopInstruction{address=temp 0}
@SP // 17920
AM=M-1 // 17921
D=M // 17922
@5 // 17923
M=D // 17924

////PushInstruction("constant 360")
@360 // 17925
D=A // 17926
@SP // 17927
AM=M+1 // 17928
A=A-1 // 17929
M=D // 17930

////PushInstruction("constant 170")
@170 // 17931
D=A // 17932
@SP // 17933
AM=M+1 // 17934
A=A-1 // 17935
M=D // 17936

////PushInstruction("constant 3")
@3 // 17937
D=A // 17938
@SP // 17939
AM=M+1 // 17940
A=A-1 // 17941
M=D // 17942

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=6}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 17943
D=A // 17944
@14 // 17945
M=D // 17946
@Screen.drawCircle // 17947
D=A // 17948
@13 // 17949
M=D // 17950
@Main.main.ret.6 // 17951
D=A // 17952
@CALL // 17953
0;JMP // 17954
(Main.main.ret.6)

////PopInstruction{address=temp 0}
@SP // 17955
AM=M-1 // 17956
D=M // 17957
@5 // 17958
M=D // 17959

////PushInstruction("constant 280")
@280 // 17960
D=A // 17961
@SP // 17962
AM=M+1 // 17963
A=A-1 // 17964
M=D // 17965

////PushInstruction("constant 90")
@90 // 17966
D=A // 17967
@SP // 17968
AM=M+1 // 17969
A=A-1 // 17970
M=D // 17971

////PushInstruction("constant 345")
@345 // 17972
D=A // 17973
@SP // 17974
AM=M+1 // 17975
A=A-1 // 17976
M=D // 17977

////PushInstruction("constant 35")
@35 // 17978
D=A // 17979
@SP // 17980
AM=M+1 // 17981
A=A-1 // 17982
M=D // 17983

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=7}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 17984
D=A // 17985
@14 // 17986
M=D // 17987
@Screen.drawLine // 17988
D=A // 17989
@13 // 17990
M=D // 17991
@Main.main.ret.7 // 17992
D=A // 17993
@CALL // 17994
0;JMP // 17995
(Main.main.ret.7)

////PopInstruction{address=temp 0}
@SP // 17996
AM=M-1 // 17997
D=M // 17998
@5 // 17999
M=D // 18000

////PushInstruction("constant 345")
@345 // 18001
D=A // 18002
@SP // 18003
AM=M+1 // 18004
A=A-1 // 18005
M=D // 18006

////PushInstruction("constant 35")
@35 // 18007
D=A // 18008
@SP // 18009
AM=M+1 // 18010
A=A-1 // 18011
M=D // 18012

////PushInstruction("constant 410")
@410 // 18013
D=A // 18014
@SP // 18015
AM=M+1 // 18016
A=A-1 // 18017
M=D // 18018

////PushInstruction("constant 90")
@90 // 18019
D=A // 18020
@SP // 18021
AM=M+1 // 18022
A=A-1 // 18023
M=D // 18024

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=8}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18025
D=A // 18026
@14 // 18027
M=D // 18028
@Screen.drawLine // 18029
D=A // 18030
@13 // 18031
M=D // 18032
@Main.main.ret.8 // 18033
D=A // 18034
@CALL // 18035
0;JMP // 18036
(Main.main.ret.8)

////PopInstruction{address=temp 0}
@SP // 18037
AM=M-1 // 18038
D=M // 18039
@5 // 18040
M=D // 18041

////PushInstruction("constant 140")
@140 // 18042
D=A // 18043
@SP // 18044
AM=M+1 // 18045
A=A-1 // 18046
M=D // 18047

////PushInstruction("constant 60")
@60 // 18048
D=A // 18049
@SP // 18050
AM=M+1 // 18051
A=A-1 // 18052
M=D // 18053

////PushInstruction("constant 30")
@30 // 18054
D=A // 18055
@SP // 18056
AM=M+1 // 18057
A=A-1 // 18058
M=D // 18059

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=9}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 18060
D=A // 18061
@14 // 18062
M=D // 18063
@Screen.drawCircle // 18064
D=A // 18065
@13 // 18066
M=D // 18067
@Main.main.ret.9 // 18068
D=A // 18069
@CALL // 18070
0;JMP // 18071
(Main.main.ret.9)

////PopInstruction{address=temp 0}
@SP // 18072
AM=M-1 // 18073
D=M // 18074
@5 // 18075
M=D // 18076

////PushInstruction("constant 140")
@140 // 18077
D=A // 18078
@SP // 18079
AM=M+1 // 18080
A=A-1 // 18081
M=D // 18082

////PushInstruction("constant 26")
@26 // 18083
D=A // 18084
@SP // 18085
AM=M+1 // 18086
A=A-1 // 18087
M=D // 18088

////PushInstruction("constant 140")
@140 // 18089
D=A // 18090
@SP // 18091
AM=M+1 // 18092
A=A-1 // 18093
M=D // 18094

////PushInstruction("constant 6")
@6 // 18095
D=A // 18096
@SP // 18097
AM=M+1 // 18098
A=A-1 // 18099
M=D // 18100

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=10}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18101
D=A // 18102
@14 // 18103
M=D // 18104
@Screen.drawLine // 18105
D=A // 18106
@13 // 18107
M=D // 18108
@Main.main.ret.10 // 18109
D=A // 18110
@CALL // 18111
0;JMP // 18112
(Main.main.ret.10)

////PopInstruction{address=temp 0}
@SP // 18113
AM=M-1 // 18114
D=M // 18115
@5 // 18116
M=D // 18117

////PushInstruction("constant 163")
@163 // 18118
D=A // 18119
@SP // 18120
AM=M+1 // 18121
A=A-1 // 18122
M=D // 18123

////PushInstruction("constant 35")
@35 // 18124
D=A // 18125
@SP // 18126
AM=M+1 // 18127
A=A-1 // 18128
M=D // 18129

////PushInstruction("constant 178")
@178 // 18130
D=A // 18131
@SP // 18132
AM=M+1 // 18133
A=A-1 // 18134
M=D // 18135

////PushInstruction("constant 20")
@20 // 18136
D=A // 18137
@SP // 18138
AM=M+1 // 18139
A=A-1 // 18140
M=D // 18141

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=11}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18142
D=A // 18143
@14 // 18144
M=D // 18145
@Screen.drawLine // 18146
D=A // 18147
@13 // 18148
M=D // 18149
@Main.main.ret.11 // 18150
D=A // 18151
@CALL // 18152
0;JMP // 18153
(Main.main.ret.11)

////PopInstruction{address=temp 0}
@SP // 18154
AM=M-1 // 18155
D=M // 18156
@5 // 18157
M=D // 18158

////PushInstruction("constant 174")
@174 // 18159
D=A // 18160
@SP // 18161
AM=M+1 // 18162
A=A-1 // 18163
M=D // 18164

////PushInstruction("constant 60")
@60 // 18165
D=A // 18166
@SP // 18167
AM=M+1 // 18168
A=A-1 // 18169
M=D // 18170

////PushInstruction("constant 194")
@194 // 18171
D=A // 18172
@SP // 18173
AM=M+1 // 18174
A=A-1 // 18175
M=D // 18176

////PushInstruction("constant 60")
@60 // 18177
D=A // 18178
@SP // 18179
AM=M+1 // 18180
A=A-1 // 18181
M=D // 18182

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=12}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18183
D=A // 18184
@14 // 18185
M=D // 18186
@Screen.drawLine // 18187
D=A // 18188
@13 // 18189
M=D // 18190
@Main.main.ret.12 // 18191
D=A // 18192
@CALL // 18193
0;JMP // 18194
(Main.main.ret.12)

////PopInstruction{address=temp 0}
@SP // 18195
AM=M-1 // 18196
D=M // 18197
@5 // 18198
M=D // 18199

////PushInstruction("constant 163")
@163 // 18200
D=A // 18201
@SP // 18202
AM=M+1 // 18203
A=A-1 // 18204
M=D // 18205

////PushInstruction("constant 85")
@85 // 18206
D=A // 18207
@SP // 18208
AM=M+1 // 18209
A=A-1 // 18210
M=D // 18211

////PushInstruction("constant 178")
@178 // 18212
D=A // 18213
@SP // 18214
AM=M+1 // 18215
A=A-1 // 18216
M=D // 18217

////PushInstruction("constant 100")
@100 // 18218
D=A // 18219
@SP // 18220
AM=M+1 // 18221
A=A-1 // 18222
M=D // 18223

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=13}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18224
D=A // 18225
@14 // 18226
M=D // 18227
@Screen.drawLine // 18228
D=A // 18229
@13 // 18230
M=D // 18231
@Main.main.ret.13 // 18232
D=A // 18233
@CALL // 18234
0;JMP // 18235
(Main.main.ret.13)

////PopInstruction{address=temp 0}
@SP // 18236
AM=M-1 // 18237
D=M // 18238
@5 // 18239
M=D // 18240

////PushInstruction("constant 140")
@140 // 18241
D=A // 18242
@SP // 18243
AM=M+1 // 18244
A=A-1 // 18245
M=D // 18246

////PushInstruction("constant 94")
@94 // 18247
D=A // 18248
@SP // 18249
AM=M+1 // 18250
A=A-1 // 18251
M=D // 18252

////PushInstruction("constant 140")
@140 // 18253
D=A // 18254
@SP // 18255
AM=M+1 // 18256
A=A-1 // 18257
M=D // 18258

////PushInstruction("constant 114")
@114 // 18259
D=A // 18260
@SP // 18261
AM=M+1 // 18262
A=A-1 // 18263
M=D // 18264

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=14}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18265
D=A // 18266
@14 // 18267
M=D // 18268
@Screen.drawLine // 18269
D=A // 18270
@13 // 18271
M=D // 18272
@Main.main.ret.14 // 18273
D=A // 18274
@CALL // 18275
0;JMP // 18276
(Main.main.ret.14)

////PopInstruction{address=temp 0}
@SP // 18277
AM=M-1 // 18278
D=M // 18279
@5 // 18280
M=D // 18281

////PushInstruction("constant 117")
@117 // 18282
D=A // 18283
@SP // 18284
AM=M+1 // 18285
A=A-1 // 18286
M=D // 18287

////PushInstruction("constant 85")
@85 // 18288
D=A // 18289
@SP // 18290
AM=M+1 // 18291
A=A-1 // 18292
M=D // 18293

////PushInstruction("constant 102")
@102 // 18294
D=A // 18295
@SP // 18296
AM=M+1 // 18297
A=A-1 // 18298
M=D // 18299

////PushInstruction("constant 100")
@100 // 18300
D=A // 18301
@SP // 18302
AM=M+1 // 18303
A=A-1 // 18304
M=D // 18305

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=15}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18306
D=A // 18307
@14 // 18308
M=D // 18309
@Screen.drawLine // 18310
D=A // 18311
@13 // 18312
M=D // 18313
@Main.main.ret.15 // 18314
D=A // 18315
@CALL // 18316
0;JMP // 18317
(Main.main.ret.15)

////PopInstruction{address=temp 0}
@SP // 18318
AM=M-1 // 18319
D=M // 18320
@5 // 18321
M=D // 18322

////PushInstruction("constant 106")
@106 // 18323
D=A // 18324
@SP // 18325
AM=M+1 // 18326
A=A-1 // 18327
M=D // 18328

////PushInstruction("constant 60")
@60 // 18329
D=A // 18330
@SP // 18331
AM=M+1 // 18332
A=A-1 // 18333
M=D // 18334

////PushInstruction("constant 86")
@86 // 18335
D=A // 18336
@SP // 18337
AM=M+1 // 18338
A=A-1 // 18339
M=D // 18340

////PushInstruction("constant 60")
@60 // 18341
D=A // 18342
@SP // 18343
AM=M+1 // 18344
A=A-1 // 18345
M=D // 18346

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=16}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18347
D=A // 18348
@14 // 18349
M=D // 18350
@Screen.drawLine // 18351
D=A // 18352
@13 // 18353
M=D // 18354
@Main.main.ret.16 // 18355
D=A // 18356
@CALL // 18357
0;JMP // 18358
(Main.main.ret.16)

////PopInstruction{address=temp 0}
@SP // 18359
AM=M-1 // 18360
D=M // 18361
@5 // 18362
M=D // 18363

////PushInstruction("constant 117")
@117 // 18364
D=A // 18365
@SP // 18366
AM=M+1 // 18367
A=A-1 // 18368
M=D // 18369

////PushInstruction("constant 35")
@35 // 18370
D=A // 18371
@SP // 18372
AM=M+1 // 18373
A=A-1 // 18374
M=D // 18375

////PushInstruction("constant 102")
@102 // 18376
D=A // 18377
@SP // 18378
AM=M+1 // 18379
A=A-1 // 18380
M=D // 18381

////PushInstruction("constant 20")
@20 // 18382
D=A // 18383
@SP // 18384
AM=M+1 // 18385
A=A-1 // 18386
M=D // 18387

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=17}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 18388
D=A // 18389
@14 // 18390
M=D // 18391
@Screen.drawLine // 18392
D=A // 18393
@13 // 18394
M=D // 18395
@Main.main.ret.17 // 18396
D=A // 18397
@CALL // 18398
0;JMP // 18399
(Main.main.ret.17)

////PopInstruction{address=temp 0}
@SP // 18400
AM=M-1 // 18401
D=M // 18402
@5 // 18403
M=D // 18404

////PushInstruction("constant 0")
@SP // 18405
AM=M+1 // 18406
A=A-1 // 18407
M=0 // 18408

////ReturnInstruction{}
@RETURN // 18409
0;JMP // 18410

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 18411
AM=M+1 // 18412
A=A-1 // 18413
M=0 // 18414
@SP // 18415
AM=M+1 // 18416
A=A-1 // 18417
M=0 // 18418

////PushInstruction("constant 2048")
@2048 // 18419
D=A // 18420
@SP // 18421
AM=M+1 // 18422
A=A-1 // 18423
M=D // 18424

////PushInstruction("constant 7")
@7 // 18425
D=A // 18426
@SP // 18427
AM=M+1 // 18428
A=A-1 // 18429
M=D // 18430

////ArithmeticInstruction{ADD}
@SP // 18431
AM=M-1 // 18432
D=M // 18433
A=A-1 // 18434
M=D+M // 18435

////PopInstruction{address=local 0}
@SP // 18436
AM=M-1 // 18437
D=M // 18438
@LCL // 18439
A=M // 18440
M=D // 18441

////PushInstruction("constant 16384")
@16384 // 18442
D=A // 18443
@SP // 18444
AM=M+1 // 18445
A=A-1 // 18446
M=D // 18447

////PushInstruction("local 0")
@LCL // 18448
A=M // 18449
D=M // 18450
@SP // 18451
AM=M+1 // 18452
A=A-1 // 18453
M=D // 18454

////ArithmeticInstruction{SUB}
@SP // 18455
AM=M-1 // 18456
D=M // 18457
A=A-1 // 18458
M=M-D // 18459

////PushInstruction("constant 5")
@5 // 18460
D=A // 18461
@SP // 18462
AM=M+1 // 18463
A=A-1 // 18464
M=D // 18465

////ArithmeticInstruction{SUB}
@SP // 18466
AM=M-1 // 18467
D=M // 18468
A=A-1 // 18469
M=M-D // 18470

////PushInstruction("local 0")
@LCL // 18471
A=M // 18472
D=M // 18473
@SP // 18474
AM=M+1 // 18475
A=A-1 // 18476
M=D // 18477

////PushInstruction("constant 0")
@SP // 18478
AM=M+1 // 18479
A=A-1 // 18480
M=0 // 18481

////ArithmeticInstruction{ADD}
@SP // 18482
AM=M-1 // 18483
D=M // 18484
A=A-1 // 18485
M=D+M // 18486

////PopInstruction{address=pointer 1}
@SP // 18487
AM=M-1 // 18488
D=M // 18489
@4 // 18490
M=D // 18491

////PopInstruction{address=that 0}
@SP // 18492
AM=M-1 // 18493
D=M // 18494
@THAT // 18495
A=M // 18496
M=D // 18497

////PushInstruction("constant 1")
@SP // 18498
AM=M+1 // 18499
A=A-1 // 18500
M=1 // 18501

////PushInstruction("local 0")
@LCL // 18502
A=M // 18503
D=M // 18504
@SP // 18505
AM=M+1 // 18506
A=A-1 // 18507
M=D // 18508

////PushInstruction("constant 1")
@SP // 18509
AM=M+1 // 18510
A=A-1 // 18511
M=1 // 18512

////ArithmeticInstruction{ADD}
@SP // 18513
AM=M-1 // 18514
D=M // 18515
A=A-1 // 18516
M=D+M // 18517

////PopInstruction{address=pointer 1}
@SP // 18518
AM=M-1 // 18519
D=M // 18520
@4 // 18521
M=D // 18522

////PopInstruction{address=that 0}
@SP // 18523
AM=M-1 // 18524
D=M // 18525
@THAT // 18526
A=M // 18527
M=D // 18528

////PushInstruction("constant 0")
@SP // 18529
AM=M+1 // 18530
A=A-1 // 18531
M=0 // 18532

////PushInstruction("local 0")
@LCL // 18533
A=M // 18534
D=M // 18535
@SP // 18536
AM=M+1 // 18537
A=A-1 // 18538
M=D // 18539

////PushInstruction("constant 2")
@2 // 18540
D=A // 18541
@SP // 18542
AM=M+1 // 18543
A=A-1 // 18544
M=D // 18545

////ArithmeticInstruction{ADD}
@SP // 18546
AM=M-1 // 18547
D=M // 18548
A=A-1 // 18549
M=D+M // 18550

////PopInstruction{address=pointer 1}
@SP // 18551
AM=M-1 // 18552
D=M // 18553
@4 // 18554
M=D // 18555

////PopInstruction{address=that 0}
@SP // 18556
AM=M-1 // 18557
D=M // 18558
@THAT // 18559
A=M // 18560
M=D // 18561

////PushInstruction("constant 0")
@SP // 18562
AM=M+1 // 18563
A=A-1 // 18564
M=0 // 18565

////PushInstruction("local 0")
@LCL // 18566
A=M // 18567
D=M // 18568
@SP // 18569
AM=M+1 // 18570
A=A-1 // 18571
M=D // 18572

////PushInstruction("constant 3")
@3 // 18573
D=A // 18574
@SP // 18575
AM=M+1 // 18576
A=A-1 // 18577
M=D // 18578

////ArithmeticInstruction{ADD}
@SP // 18579
AM=M-1 // 18580
D=M // 18581
A=A-1 // 18582
M=D+M // 18583

////PopInstruction{address=pointer 1}
@SP // 18584
AM=M-1 // 18585
D=M // 18586
@4 // 18587
M=D // 18588

////PopInstruction{address=that 0}
@SP // 18589
AM=M-1 // 18590
D=M // 18591
@THAT // 18592
A=M // 18593
M=D // 18594

////PushInstruction("local 0")
@LCL // 18595
A=M // 18596
D=M // 18597
@SP // 18598
AM=M+1 // 18599
A=A-1 // 18600
M=D // 18601

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}
// call Memory.create_foot
@6 // 18602
D=A // 18603
@14 // 18604
M=D // 18605
@Memory.create_foot // 18606
D=A // 18607
@13 // 18608
M=D // 18609
@Memory.init.ret.0 // 18610
D=A // 18611
@CALL // 18612
0;JMP // 18613
(Memory.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 18614
AM=M-1 // 18615
D=M // 18616
@5 // 18617
M=D // 18618

////PushInstruction("constant 2048")
@2048 // 18619
D=A // 18620
@SP // 18621
AM=M+1 // 18622
A=A-1 // 18623
M=D // 18624

////PushInstruction("constant 6")
@6 // 18625
D=A // 18626
@SP // 18627
AM=M+1 // 18628
A=A-1 // 18629
M=D // 18630

////ArithmeticInstruction{ADD}
@SP // 18631
AM=M-1 // 18632
D=M // 18633
A=A-1 // 18634
M=D+M // 18635

////PushInstruction("local 0")
@LCL // 18636
A=M // 18637
D=M // 18638
@SP // 18639
AM=M+1 // 18640
A=A-1 // 18641
M=D // 18642

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}
// call Memory.add_node
@7 // 18643
D=A // 18644
@14 // 18645
M=D // 18646
@Memory.add_node // 18647
D=A // 18648
@13 // 18649
M=D // 18650
@Memory.init.ret.1 // 18651
D=A // 18652
@CALL // 18653
0;JMP // 18654
(Memory.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 18655
AM=M-1 // 18656
D=M // 18657
@5 // 18658
M=D // 18659

////PushInstruction("constant 0")
@SP // 18660
AM=M+1 // 18661
A=A-1 // 18662
M=0 // 18663

////ReturnInstruction{}
@RETURN // 18664
0;JMP // 18665

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 18666
AM=M+1 // 18667
A=A-1 // 18668
M=0 // 18669
@SP // 18670
AM=M+1 // 18671
A=A-1 // 18672
M=0 // 18673
@SP // 18674
AM=M+1 // 18675
A=A-1 // 18676
M=0 // 18677
@SP // 18678
AM=M+1 // 18679
A=A-1 // 18680
M=0 // 18681
@SP // 18682
AM=M+1 // 18683
A=A-1 // 18684
M=0 // 18685

////PushInstruction("argument 0")
@ARG // 18686
A=M // 18687
D=M // 18688
@SP // 18689
AM=M+1 // 18690
A=A-1 // 18691
M=D // 18692

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 18693
D=A // 18694
@14 // 18695
M=D // 18696
@Memory.getBinIndex // 18697
D=A // 18698
@13 // 18699
M=D // 18700
@Memory.alloc.ret.0 // 18701
D=A // 18702
@CALL // 18703
0;JMP // 18704
(Memory.alloc.ret.0)

////PopInstruction{address=local 0}
@SP // 18705
AM=M-1 // 18706
D=M // 18707
@LCL // 18708
A=M // 18709
M=D // 18710

////PushInstruction("constant 2048")
@2048 // 18711
D=A // 18712
@SP // 18713
AM=M+1 // 18714
A=A-1 // 18715
M=D // 18716

////PushInstruction("local 0")
@LCL // 18717
A=M // 18718
D=M // 18719
@SP // 18720
AM=M+1 // 18721
A=A-1 // 18722
M=D // 18723

////ArithmeticInstruction{ADD}
@SP // 18724
AM=M-1 // 18725
D=M // 18726
A=A-1 // 18727
M=D+M // 18728

////PopInstruction{address=local 1}
@SP // 18729
AM=M-1 // 18730
D=M // 18731
@LCL // 18732
A=M+1 // 18733
M=D // 18734

////PushInstruction("local 1")
@LCL // 18735
A=M+1 // 18736
D=M // 18737
@SP // 18738
AM=M+1 // 18739
A=A-1 // 18740
M=D // 18741

////PushInstruction("argument 0")
@ARG // 18742
A=M // 18743
D=M // 18744
@SP // 18745
AM=M+1 // 18746
A=A-1 // 18747
M=D // 18748

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 18749
D=A // 18750
@14 // 18751
M=D // 18752
@Memory.get_best_fit // 18753
D=A // 18754
@13 // 18755
M=D // 18756
@Memory.alloc.ret.1 // 18757
D=A // 18758
@CALL // 18759
0;JMP // 18760
(Memory.alloc.ret.1)

////PopInstruction{address=local 2}
@SP // 18761
AM=M-1 // 18762
D=M // 18763
@LCL // 18764
A=M+1 // 18765
A=A+1 // 18766
M=D // 18767

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

////PushInstruction("local 2")
@LCL // 18768
A=M+1 // 18769
A=A+1 // 18770
D=M // 18771
@SP // 18772
AM=M+1 // 18773
A=A-1 // 18774
M=D // 18775

////PushInstruction("constant 0")
@SP // 18776
AM=M+1 // 18777
A=A-1 // 18778
M=0 // 18779

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq0 // 18780
D=A // 18781
@13 // 18782
M=D // 18783
@SP // 18784
AM=M-1 // 18785
D=M // 18786
A=A-1 // 18787
D=M-D // 18788
@DO_EQ // 18789
0;JMP // 18790
(COMPARE_Memory.alloc_eq0)
@SP // 18791
AM=M+1 // 18792
A=A-1 // 18793
M=D // 18794

////PushInstruction("constant 0")
@SP // 18795
AM=M+1 // 18796
A=A-1 // 18797
M=0 // 18798

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq1 // 18799
D=A // 18800
@13 // 18801
M=D // 18802
@SP // 18803
AM=M-1 // 18804
D=M // 18805
A=A-1 // 18806
D=M-D // 18807
@DO_EQ // 18808
0;JMP // 18809
(COMPARE_Memory.alloc_eq1)
@SP // 18810
AM=M+1 // 18811
A=A-1 // 18812
M=D // 18813

////IfGotoInstruction{label='WHILE_END_Memory.alloc1}
// if-goto WHILE_END_Memory.alloc1
@SP // 18814
AM=M-1 // 18815
D=M // 18816
@WHILE_END_Memory.alloc1 // 18817
D;JNE // 18818

////PushInstruction("local 0")
@LCL // 18819
A=M // 18820
D=M // 18821
@SP // 18822
AM=M+1 // 18823
A=A-1 // 18824
M=D // 18825

////PushInstruction("constant 1")
@SP // 18826
AM=M+1 // 18827
A=A-1 // 18828
M=1 // 18829

////ArithmeticInstruction{ADD}
@SP // 18830
AM=M-1 // 18831
D=M // 18832
A=A-1 // 18833
M=D+M // 18834

////PushInstruction("constant 7")
@7 // 18835
D=A // 18836
@SP // 18837
AM=M+1 // 18838
A=A-1 // 18839
M=D // 18840

////ArithmeticInstruction{LT}
@COMPARE_Memory.alloc_lt2 // 18841
D=A // 18842
@13 // 18843
M=D // 18844
@SP // 18845
AM=M-1 // 18846
D=M // 18847
A=A-1 // 18848
D=M-D // 18849
@DO_LT // 18850
0;JMP // 18851
(COMPARE_Memory.alloc_lt2)
@SP // 18852
AM=M+1 // 18853
A=A-1 // 18854
M=D // 18855

////ArithmeticInstruction{NOT}
@SP // 18856
A=M-1 // 18857
M=!M // 18858

////PushInstruction("constant 0")
@SP // 18859
AM=M+1 // 18860
A=A-1 // 18861
M=0 // 18862

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq3 // 18863
D=A // 18864
@13 // 18865
M=D // 18866
@SP // 18867
AM=M-1 // 18868
D=M // 18869
A=A-1 // 18870
D=M-D // 18871
@DO_EQ // 18872
0;JMP // 18873
(COMPARE_Memory.alloc_eq3)
@SP // 18874
AM=M+1 // 18875
A=A-1 // 18876
M=D // 18877

////IfGotoInstruction{label='Memory.alloc.IfElse1}
// if-goto Memory.alloc.IfElse1
@SP // 18878
AM=M-1 // 18879
D=M // 18880
@Memory.alloc.IfElse1 // 18881
D;JNE // 18882

////PushInstruction("constant 0")
@SP // 18883
AM=M+1 // 18884
A=A-1 // 18885
M=0 // 18886

////ReturnInstruction{}
@RETURN // 18887
0;JMP // 18888

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 18889
0;JMP // 18890

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

////PushInstruction("local 0")
@LCL // 18891
A=M // 18892
D=M // 18893
@SP // 18894
AM=M+1 // 18895
A=A-1 // 18896
M=D // 18897

////PushInstruction("constant 1")
@SP // 18898
AM=M+1 // 18899
A=A-1 // 18900
M=1 // 18901

////ArithmeticInstruction{ADD}
@SP // 18902
AM=M-1 // 18903
D=M // 18904
A=A-1 // 18905
M=D+M // 18906

////PopInstruction{address=local 0}
@SP // 18907
AM=M-1 // 18908
D=M // 18909
@LCL // 18910
A=M // 18911
M=D // 18912

////PushInstruction("constant 2048")
@2048 // 18913
D=A // 18914
@SP // 18915
AM=M+1 // 18916
A=A-1 // 18917
M=D // 18918

////PushInstruction("local 0")
@LCL // 18919
A=M // 18920
D=M // 18921
@SP // 18922
AM=M+1 // 18923
A=A-1 // 18924
M=D // 18925

////ArithmeticInstruction{ADD}
@SP // 18926
AM=M-1 // 18927
D=M // 18928
A=A-1 // 18929
M=D+M // 18930

////PopInstruction{address=local 1}
@SP // 18931
AM=M-1 // 18932
D=M // 18933
@LCL // 18934
A=M+1 // 18935
M=D // 18936

////PushInstruction("local 1")
@LCL // 18937
A=M+1 // 18938
D=M // 18939
@SP // 18940
AM=M+1 // 18941
A=A-1 // 18942
M=D // 18943

////PushInstruction("argument 0")
@ARG // 18944
A=M // 18945
D=M // 18946
@SP // 18947
AM=M+1 // 18948
A=A-1 // 18949
M=D // 18950

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 18951
D=A // 18952
@14 // 18953
M=D // 18954
@Memory.get_best_fit // 18955
D=A // 18956
@13 // 18957
M=D // 18958
@Memory.alloc.ret.2 // 18959
D=A // 18960
@CALL // 18961
0;JMP // 18962
(Memory.alloc.ret.2)

////PopInstruction{address=local 2}
@SP // 18963
AM=M-1 // 18964
D=M // 18965
@LCL // 18966
A=M+1 // 18967
A=A+1 // 18968
M=D // 18969

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 18970
0;JMP // 18971

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushInstruction("constant 2048")
@2048 // 18972
D=A // 18973
@SP // 18974
AM=M+1 // 18975
A=A-1 // 18976
M=D // 18977

////PushInstruction("local 2")
@LCL // 18978
A=M+1 // 18979
A=A+1 // 18980
D=M // 18981
@SP // 18982
AM=M+1 // 18983
A=A-1 // 18984
M=D // 18985

////PushInstruction("constant 0")
@SP // 18986
AM=M+1 // 18987
A=A-1 // 18988
M=0 // 18989

////ArithmeticInstruction{ADD}
@SP // 18990
AM=M-1 // 18991
D=M // 18992
A=A-1 // 18993
M=D+M // 18994

////PopInstruction{address=pointer 1}
@SP // 18995
AM=M-1 // 18996
D=M // 18997
@4 // 18998
M=D // 18999

////PushInstruction("that 0")
@THAT // 19000
A=M // 19001
D=M // 19002
@SP // 19003
AM=M+1 // 19004
A=A-1 // 19005
M=D // 19006

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 19007
D=A // 19008
@14 // 19009
M=D // 19010
@Memory.getBinIndex // 19011
D=A // 19012
@13 // 19013
M=D // 19014
@Memory.alloc.ret.3 // 19015
D=A // 19016
@CALL // 19017
0;JMP // 19018
(Memory.alloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 19019
AM=M-1 // 19020
D=M // 19021
A=A-1 // 19022
M=D+M // 19023

////PushInstruction("local 2")
@LCL // 19024
A=M+1 // 19025
A=A+1 // 19026
D=M // 19027
@SP // 19028
AM=M+1 // 19029
A=A-1 // 19030
M=D // 19031

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=4, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.remove_node
@7 // 19032
D=A // 19033
@14 // 19034
M=D // 19035
@Memory.remove_node // 19036
D=A // 19037
@13 // 19038
M=D // 19039
@Memory.alloc.ret.4 // 19040
D=A // 19041
@CALL // 19042
0;JMP // 19043
(Memory.alloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 19044
AM=M-1 // 19045
D=M // 19046
@5 // 19047
M=D // 19048

////PushInstruction("local 2")
@LCL // 19049
A=M+1 // 19050
A=A+1 // 19051
D=M // 19052
@SP // 19053
AM=M+1 // 19054
A=A-1 // 19055
M=D // 19056

////PushInstruction("constant 0")
@SP // 19057
AM=M+1 // 19058
A=A-1 // 19059
M=0 // 19060

////ArithmeticInstruction{ADD}
@SP // 19061
AM=M-1 // 19062
D=M // 19063
A=A-1 // 19064
M=D+M // 19065

////PopInstruction{address=pointer 1}
@SP // 19066
AM=M-1 // 19067
D=M // 19068
@4 // 19069
M=D // 19070

////PushInstruction("that 0")
@THAT // 19071
A=M // 19072
D=M // 19073
@SP // 19074
AM=M+1 // 19075
A=A-1 // 19076
M=D // 19077

////PushInstruction("argument 0")
@ARG // 19078
A=M // 19079
D=M // 19080
@SP // 19081
AM=M+1 // 19082
A=A-1 // 19083
M=D // 19084

////ArithmeticInstruction{SUB}
@SP // 19085
AM=M-1 // 19086
D=M // 19087
A=A-1 // 19088
M=M-D // 19089

////PopInstruction{address=local 3}
@SP // 19090
AM=M-1 // 19091
D=M // 19092
@LCL // 19093
A=M+1 // 19094
A=A+1 // 19095
A=A+1 // 19096
M=D // 19097

////PushInstruction("local 3")
@LCL // 19098
A=M+1 // 19099
A=A+1 // 19100
A=A+1 // 19101
D=M // 19102
@SP // 19103
AM=M+1 // 19104
A=A-1 // 19105
M=D // 19106

////PushInstruction("constant 5")
@5 // 19107
D=A // 19108
@SP // 19109
AM=M+1 // 19110
A=A-1 // 19111
M=D // 19112

////ArithmeticInstruction{GT}
@COMPARE_Memory.alloc_gt4 // 19113
D=A // 19114
@13 // 19115
M=D // 19116
@SP // 19117
AM=M-1 // 19118
D=M // 19119
A=A-1 // 19120
D=M-D // 19121
@DO_GT // 19122
0;JMP // 19123
(COMPARE_Memory.alloc_gt4)
@SP // 19124
AM=M+1 // 19125
A=A-1 // 19126
M=D // 19127

////PushInstruction("constant 0")
@SP // 19128
AM=M+1 // 19129
A=A-1 // 19130
M=0 // 19131

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq5 // 19132
D=A // 19133
@13 // 19134
M=D // 19135
@SP // 19136
AM=M-1 // 19137
D=M // 19138
A=A-1 // 19139
D=M-D // 19140
@DO_EQ // 19141
0;JMP // 19142
(COMPARE_Memory.alloc_eq5)
@SP // 19143
AM=M+1 // 19144
A=A-1 // 19145
M=D // 19146

////IfGotoInstruction{label='Memory.alloc.IfElse2}
// if-goto Memory.alloc.IfElse2
@SP // 19147
AM=M-1 // 19148
D=M // 19149
@Memory.alloc.IfElse2 // 19150
D;JNE // 19151

////PushInstruction("argument 0")
@ARG // 19152
A=M // 19153
D=M // 19154
@SP // 19155
AM=M+1 // 19156
A=A-1 // 19157
M=D // 19158

////PushInstruction("local 2")
@LCL // 19159
A=M+1 // 19160
A=A+1 // 19161
D=M // 19162
@SP // 19163
AM=M+1 // 19164
A=A-1 // 19165
M=D // 19166

////PushInstruction("constant 0")
@SP // 19167
AM=M+1 // 19168
A=A-1 // 19169
M=0 // 19170

////ArithmeticInstruction{ADD}
@SP // 19171
AM=M-1 // 19172
D=M // 19173
A=A-1 // 19174
M=D+M // 19175

////PopInstruction{address=pointer 1}
@SP // 19176
AM=M-1 // 19177
D=M // 19178
@4 // 19179
M=D // 19180

////PopInstruction{address=that 0}
@SP // 19181
AM=M-1 // 19182
D=M // 19183
@THAT // 19184
A=M // 19185
M=D // 19186

////PushInstruction("constant 0")
@SP // 19187
AM=M+1 // 19188
A=A-1 // 19189
M=0 // 19190

////PushInstruction("local 2")
@LCL // 19191
A=M+1 // 19192
A=A+1 // 19193
D=M // 19194
@SP // 19195
AM=M+1 // 19196
A=A-1 // 19197
M=D // 19198

////PushInstruction("constant 1")
@SP // 19199
AM=M+1 // 19200
A=A-1 // 19201
M=1 // 19202

////ArithmeticInstruction{ADD}
@SP // 19203
AM=M-1 // 19204
D=M // 19205
A=A-1 // 19206
M=D+M // 19207

////PopInstruction{address=pointer 1}
@SP // 19208
AM=M-1 // 19209
D=M // 19210
@4 // 19211
M=D // 19212

////PopInstruction{address=that 0}
@SP // 19213
AM=M-1 // 19214
D=M // 19215
@THAT // 19216
A=M // 19217
M=D // 19218

////PushInstruction("local 2")
@LCL // 19219
A=M+1 // 19220
A=A+1 // 19221
D=M // 19222
@SP // 19223
AM=M+1 // 19224
A=A-1 // 19225
M=D // 19226

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=5, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19227
D=A // 19228
@14 // 19229
M=D // 19230
@Memory.create_foot // 19231
D=A // 19232
@13 // 19233
M=D // 19234
@Memory.alloc.ret.5 // 19235
D=A // 19236
@CALL // 19237
0;JMP // 19238
(Memory.alloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 19239
AM=M-1 // 19240
D=M // 19241
@5 // 19242
M=D // 19243

////PushInstruction("local 2")
@LCL // 19244
A=M+1 // 19245
A=A+1 // 19246
D=M // 19247
@SP // 19248
AM=M+1 // 19249
A=A-1 // 19250
M=D // 19251

////PushInstruction("argument 0")
@ARG // 19252
A=M // 19253
D=M // 19254
@SP // 19255
AM=M+1 // 19256
A=A-1 // 19257
M=D // 19258

////ArithmeticInstruction{ADD}
@SP // 19259
AM=M-1 // 19260
D=M // 19261
A=A-1 // 19262
M=D+M // 19263

////PushInstruction("constant 5")
@5 // 19264
D=A // 19265
@SP // 19266
AM=M+1 // 19267
A=A-1 // 19268
M=D // 19269

////ArithmeticInstruction{ADD}
@SP // 19270
AM=M-1 // 19271
D=M // 19272
A=A-1 // 19273
M=D+M // 19274

////PopInstruction{address=local 4}
@LCL // 19275
D=M // 19276
@4 // 19277
A=D+A // 19278
D=A // 19279
@R13 // 19280
M=D // 19281
@SP // 19282
AM=M-1 // 19283
D=M // 19284
@R13 // 19285
A=M // 19286
M=D // 19287

////PushInstruction("local 3")
@LCL // 19288
A=M+1 // 19289
A=A+1 // 19290
A=A+1 // 19291
D=M // 19292
@SP // 19293
AM=M+1 // 19294
A=A-1 // 19295
M=D // 19296

////PushInstruction("constant 5")
@5 // 19297
D=A // 19298
@SP // 19299
AM=M+1 // 19300
A=A-1 // 19301
M=D // 19302

////ArithmeticInstruction{SUB}
@SP // 19303
AM=M-1 // 19304
D=M // 19305
A=A-1 // 19306
M=M-D // 19307

////PushInstruction("local 4")
@LCL // 19308
D=M // 19309
@4 // 19310
A=D+A // 19311
D=M // 19312
@SP // 19313
AM=M+1 // 19314
A=A-1 // 19315
M=D // 19316

////PushInstruction("constant 0")
@SP // 19317
AM=M+1 // 19318
A=A-1 // 19319
M=0 // 19320

////ArithmeticInstruction{ADD}
@SP // 19321
AM=M-1 // 19322
D=M // 19323
A=A-1 // 19324
M=D+M // 19325

////PopInstruction{address=pointer 1}
@SP // 19326
AM=M-1 // 19327
D=M // 19328
@4 // 19329
M=D // 19330

////PopInstruction{address=that 0}
@SP // 19331
AM=M-1 // 19332
D=M // 19333
@THAT // 19334
A=M // 19335
M=D // 19336

////PushInstruction("constant 1")
@SP // 19337
AM=M+1 // 19338
A=A-1 // 19339
M=1 // 19340

////PushInstruction("local 4")
@LCL // 19341
D=M // 19342
@4 // 19343
A=D+A // 19344
D=M // 19345
@SP // 19346
AM=M+1 // 19347
A=A-1 // 19348
M=D // 19349

////PushInstruction("constant 1")
@SP // 19350
AM=M+1 // 19351
A=A-1 // 19352
M=1 // 19353

////ArithmeticInstruction{ADD}
@SP // 19354
AM=M-1 // 19355
D=M // 19356
A=A-1 // 19357
M=D+M // 19358

////PopInstruction{address=pointer 1}
@SP // 19359
AM=M-1 // 19360
D=M // 19361
@4 // 19362
M=D // 19363

////PopInstruction{address=that 0}
@SP // 19364
AM=M-1 // 19365
D=M // 19366
@THAT // 19367
A=M // 19368
M=D // 19369

////PushInstruction("local 4")
@LCL // 19370
D=M // 19371
@4 // 19372
A=D+A // 19373
D=M // 19374
@SP // 19375
AM=M+1 // 19376
A=A-1 // 19377
M=D // 19378

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19379
D=A // 19380
@14 // 19381
M=D // 19382
@Memory.create_foot // 19383
D=A // 19384
@13 // 19385
M=D // 19386
@Memory.alloc.ret.6 // 19387
D=A // 19388
@CALL // 19389
0;JMP // 19390
(Memory.alloc.ret.6)

////PopInstruction{address=temp 0}
@SP // 19391
AM=M-1 // 19392
D=M // 19393
@5 // 19394
M=D // 19395

////PushInstruction("constant 2048")
@2048 // 19396
D=A // 19397
@SP // 19398
AM=M+1 // 19399
A=A-1 // 19400
M=D // 19401

////PushInstruction("local 3")
@LCL // 19402
A=M+1 // 19403
A=A+1 // 19404
A=A+1 // 19405
D=M // 19406
@SP // 19407
AM=M+1 // 19408
A=A-1 // 19409
M=D // 19410

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 19411
D=A // 19412
@14 // 19413
M=D // 19414
@Memory.getBinIndex // 19415
D=A // 19416
@13 // 19417
M=D // 19418
@Memory.alloc.ret.7 // 19419
D=A // 19420
@CALL // 19421
0;JMP // 19422
(Memory.alloc.ret.7)

////ArithmeticInstruction{ADD}
@SP // 19423
AM=M-1 // 19424
D=M // 19425
A=A-1 // 19426
M=D+M // 19427

////PushInstruction("local 4")
@LCL // 19428
D=M // 19429
@4 // 19430
A=D+A // 19431
D=M // 19432
@SP // 19433
AM=M+1 // 19434
A=A-1 // 19435
M=D // 19436

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.add_node
@7 // 19437
D=A // 19438
@14 // 19439
M=D // 19440
@Memory.add_node // 19441
D=A // 19442
@13 // 19443
M=D // 19444
@Memory.alloc.ret.8 // 19445
D=A // 19446
@CALL // 19447
0;JMP // 19448
(Memory.alloc.ret.8)

////PopInstruction{address=temp 0}
@SP // 19449
AM=M-1 // 19450
D=M // 19451
@5 // 19452
M=D // 19453

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 19454
0;JMP // 19455

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushInstruction("constant 0")
@SP // 19456
AM=M+1 // 19457
A=A-1 // 19458
M=0 // 19459

////PushInstruction("local 2")
@LCL // 19460
A=M+1 // 19461
A=A+1 // 19462
D=M // 19463
@SP // 19464
AM=M+1 // 19465
A=A-1 // 19466
M=D // 19467

////PushInstruction("constant 1")
@SP // 19468
AM=M+1 // 19469
A=A-1 // 19470
M=1 // 19471

////ArithmeticInstruction{ADD}
@SP // 19472
AM=M-1 // 19473
D=M // 19474
A=A-1 // 19475
M=D+M // 19476

////PopInstruction{address=pointer 1}
@SP // 19477
AM=M-1 // 19478
D=M // 19479
@4 // 19480
M=D // 19481

////PopInstruction{address=that 0}
@SP // 19482
AM=M-1 // 19483
D=M // 19484
@THAT // 19485
A=M // 19486
M=D // 19487

////PushInstruction("local 2")
@LCL // 19488
A=M+1 // 19489
A=A+1 // 19490
D=M // 19491
@SP // 19492
AM=M+1 // 19493
A=A-1 // 19494
M=D // 19495

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=9, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 19496
D=A // 19497
@14 // 19498
M=D // 19499
@Memory.create_foot // 19500
D=A // 19501
@13 // 19502
M=D // 19503
@Memory.alloc.ret.9 // 19504
D=A // 19505
@CALL // 19506
0;JMP // 19507
(Memory.alloc.ret.9)

////PopInstruction{address=temp 0}
@SP // 19508
AM=M-1 // 19509
D=M // 19510
@5 // 19511
M=D // 19512

////LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)

////PushInstruction("local 2")
@LCL // 19513
A=M+1 // 19514
A=A+1 // 19515
D=M // 19516
@SP // 19517
AM=M+1 // 19518
A=A-1 // 19519
M=D // 19520

////PushInstruction("constant 4")
@4 // 19521
D=A // 19522
@SP // 19523
AM=M+1 // 19524
A=A-1 // 19525
M=D // 19526

////ArithmeticInstruction{ADD}
@SP // 19527
AM=M-1 // 19528
D=M // 19529
A=A-1 // 19530
M=D+M // 19531

////ReturnInstruction{}
@RETURN // 19532
0;JMP // 19533

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 19534
AM=M+1 // 19535
A=A-1 // 19536
M=0 // 19537

////PushInstruction("argument 0")
@ARG // 19538
A=M // 19539
D=M // 19540
@SP // 19541
AM=M+1 // 19542
A=A-1 // 19543
M=D // 19544

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=10, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}
// call Memory.alloc
@6 // 19545
D=A // 19546
@14 // 19547
M=D // 19548
@Memory.alloc // 19549
D=A // 19550
@13 // 19551
M=D // 19552
@Memory.calloc.ret.0 // 19553
D=A // 19554
@CALL // 19555
0;JMP // 19556
(Memory.calloc.ret.0)

////PopInstruction{address=local 0}
@SP // 19557
AM=M-1 // 19558
D=M // 19559
@LCL // 19560
A=M // 19561
M=D // 19562

////PushInstruction("local 0")
@LCL // 19563
A=M // 19564
D=M // 19565
@SP // 19566
AM=M+1 // 19567
A=A-1 // 19568
M=D // 19569

////ArithmeticInstruction{NOT}
@SP // 19570
A=M-1 // 19571
M=!M // 19572

////PushInstruction("constant 0")
@SP // 19573
AM=M+1 // 19574
A=A-1 // 19575
M=0 // 19576

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq6 // 19577
D=A // 19578
@13 // 19579
M=D // 19580
@SP // 19581
AM=M-1 // 19582
D=M // 19583
A=A-1 // 19584
D=M-D // 19585
@DO_EQ // 19586
0;JMP // 19587
(COMPARE_Memory.calloc_eq6)
@SP // 19588
AM=M+1 // 19589
A=A-1 // 19590
M=D // 19591

////IfGotoInstruction{label='Memory.calloc.IfElse1}
// if-goto Memory.calloc.IfElse1
@SP // 19592
AM=M-1 // 19593
D=M // 19594
@Memory.calloc.IfElse1 // 19595
D;JNE // 19596

////PushInstruction("constant 0")
@SP // 19597
AM=M+1 // 19598
A=A-1 // 19599
M=0 // 19600

////ReturnInstruction{}
@RETURN // 19601
0;JMP // 19602

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 19603
0;JMP // 19604

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
@ARG // 19605
A=M // 19606
D=M // 19607
@SP // 19608
AM=M+1 // 19609
A=A-1 // 19610
M=D // 19611

////PushInstruction("constant 0")
@SP // 19612
AM=M+1 // 19613
A=A-1 // 19614
M=0 // 19615

////ArithmeticInstruction{GT}
@COMPARE_Memory.calloc_gt7 // 19616
D=A // 19617
@13 // 19618
M=D // 19619
@SP // 19620
AM=M-1 // 19621
D=M // 19622
A=A-1 // 19623
D=M-D // 19624
@DO_GT // 19625
0;JMP // 19626
(COMPARE_Memory.calloc_gt7)
@SP // 19627
AM=M+1 // 19628
A=A-1 // 19629
M=D // 19630

////PushInstruction("constant 0")
@SP // 19631
AM=M+1 // 19632
A=A-1 // 19633
M=0 // 19634

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq8 // 19635
D=A // 19636
@13 // 19637
M=D // 19638
@SP // 19639
AM=M-1 // 19640
D=M // 19641
A=A-1 // 19642
D=M-D // 19643
@DO_EQ // 19644
0;JMP // 19645
(COMPARE_Memory.calloc_eq8)
@SP // 19646
AM=M+1 // 19647
A=A-1 // 19648
M=D // 19649

////IfGotoInstruction{label='WHILE_END_Memory.calloc1}
// if-goto WHILE_END_Memory.calloc1
@SP // 19650
AM=M-1 // 19651
D=M // 19652
@WHILE_END_Memory.calloc1 // 19653
D;JNE // 19654

////PushInstruction("argument 0")
@ARG // 19655
A=M // 19656
D=M // 19657
@SP // 19658
AM=M+1 // 19659
A=A-1 // 19660
M=D // 19661

////PushInstruction("constant 1")
@SP // 19662
AM=M+1 // 19663
A=A-1 // 19664
M=1 // 19665

////ArithmeticInstruction{SUB}
@SP // 19666
AM=M-1 // 19667
D=M // 19668
A=A-1 // 19669
M=M-D // 19670

////PopInstruction{address=argument 0}
@SP // 19671
AM=M-1 // 19672
D=M // 19673
@ARG // 19674
A=M // 19675
M=D // 19676

////PushInstruction("constant 0")
@SP // 19677
AM=M+1 // 19678
A=A-1 // 19679
M=0 // 19680

////PushInstruction("local 0")
@LCL // 19681
A=M // 19682
D=M // 19683
@SP // 19684
AM=M+1 // 19685
A=A-1 // 19686
M=D // 19687

////PushInstruction("argument 0")
@ARG // 19688
A=M // 19689
D=M // 19690
@SP // 19691
AM=M+1 // 19692
A=A-1 // 19693
M=D // 19694

////ArithmeticInstruction{ADD}
@SP // 19695
AM=M-1 // 19696
D=M // 19697
A=A-1 // 19698
M=D+M // 19699

////PopInstruction{address=pointer 1}
@SP // 19700
AM=M-1 // 19701
D=M // 19702
@4 // 19703
M=D // 19704

////PopInstruction{address=that 0}
@SP // 19705
AM=M-1 // 19706
D=M // 19707
@THAT // 19708
A=M // 19709
M=D // 19710

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 19711
0;JMP // 19712

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 19713
A=M // 19714
D=M // 19715
@SP // 19716
AM=M+1 // 19717
A=A-1 // 19718
M=D // 19719

////ReturnInstruction{}
@RETURN // 19720
0;JMP // 19721

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 19722
AM=M+1 // 19723
A=A-1 // 19724
M=0 // 19725
@SP // 19726
AM=M+1 // 19727
A=A-1 // 19728
M=0 // 19729
@SP // 19730
AM=M+1 // 19731
A=A-1 // 19732
M=0 // 19733

////PushInstruction("argument 0")
@ARG // 19734
A=M // 19735
D=M // 19736
@SP // 19737
AM=M+1 // 19738
A=A-1 // 19739
M=D // 19740

////PushInstruction("constant 4")
@4 // 19741
D=A // 19742
@SP // 19743
AM=M+1 // 19744
A=A-1 // 19745
M=D // 19746

////ArithmeticInstruction{SUB}
@SP // 19747
AM=M-1 // 19748
D=M // 19749
A=A-1 // 19750
M=M-D // 19751

////PopInstruction{address=local 0}
@SP // 19752
AM=M-1 // 19753
D=M // 19754
@LCL // 19755
A=M // 19756
M=D // 19757

////PushInstruction("constant 1")
@SP // 19758
AM=M+1 // 19759
A=A-1 // 19760
M=1 // 19761

////PushInstruction("local 0")
@LCL // 19762
A=M // 19763
D=M // 19764
@SP // 19765
AM=M+1 // 19766
A=A-1 // 19767
M=D // 19768

////PushInstruction("constant 1")
@SP // 19769
AM=M+1 // 19770
A=A-1 // 19771
M=1 // 19772

////ArithmeticInstruction{ADD}
@SP // 19773
AM=M-1 // 19774
D=M // 19775
A=A-1 // 19776
M=D+M // 19777

////PopInstruction{address=pointer 1}
@SP // 19778
AM=M-1 // 19779
D=M // 19780
@4 // 19781
M=D // 19782

////PopInstruction{address=that 0}
@SP // 19783
AM=M-1 // 19784
D=M // 19785
@THAT // 19786
A=M // 19787
M=D // 19788

////PushInstruction("local 0")
@LCL // 19789
A=M // 19790
D=M // 19791
@SP // 19792
AM=M+1 // 19793
A=A-1 // 19794
M=D // 19795

////PushInstruction("constant 2")
@2 // 19796
D=A // 19797
@SP // 19798
AM=M+1 // 19799
A=A-1 // 19800
M=D // 19801

////ArithmeticInstruction{ADD}
@SP // 19802
AM=M-1 // 19803
D=M // 19804
A=A-1 // 19805
M=D+M // 19806

////PopInstruction{address=pointer 1}
@SP // 19807
AM=M-1 // 19808
D=M // 19809
@4 // 19810
M=D // 19811

////PushInstruction("that 0")
@THAT // 19812
A=M // 19813
D=M // 19814
@SP // 19815
AM=M+1 // 19816
A=A-1 // 19817
M=D // 19818

////PopInstruction{address=local 1}
@SP // 19819
AM=M-1 // 19820
D=M // 19821
@LCL // 19822
A=M+1 // 19823
M=D // 19824

////PushInstruction("local 0")
@LCL // 19825
A=M // 19826
D=M // 19827
@SP // 19828
AM=M+1 // 19829
A=A-1 // 19830
M=D // 19831

////PushInstruction("constant 3")
@3 // 19832
D=A // 19833
@SP // 19834
AM=M+1 // 19835
A=A-1 // 19836
M=D // 19837

////ArithmeticInstruction{ADD}
@SP // 19838
AM=M-1 // 19839
D=M // 19840
A=A-1 // 19841
M=D+M // 19842

////PopInstruction{address=pointer 1}
@SP // 19843
AM=M-1 // 19844
D=M // 19845
@4 // 19846
M=D // 19847

////PushInstruction("that 0")
@THAT // 19848
A=M // 19849
D=M // 19850
@SP // 19851
AM=M+1 // 19852
A=A-1 // 19853
M=D // 19854

////PopInstruction{address=local 2}
@SP // 19855
AM=M-1 // 19856
D=M // 19857
@LCL // 19858
A=M+1 // 19859
A=A+1 // 19860
M=D // 19861

////PushInstruction("local 1")
@LCL // 19862
A=M+1 // 19863
D=M // 19864
@SP // 19865
AM=M+1 // 19866
A=A-1 // 19867
M=D // 19868

////PushInstruction("constant 0")
@SP // 19869
AM=M+1 // 19870
A=A-1 // 19871
M=0 // 19872

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq9 // 19873
D=A // 19874
@13 // 19875
M=D // 19876
@SP // 19877
AM=M-1 // 19878
D=M // 19879
A=A-1 // 19880
D=M-D // 19881
@DO_EQ // 19882
0;JMP // 19883
(COMPARE_Memory.deAlloc_eq9)
@SP // 19884
AM=M+1 // 19885
A=A-1 // 19886
M=D // 19887

////ArithmeticInstruction{NOT}
@SP // 19888
A=M-1 // 19889
M=!M // 19890

////PushInstruction("constant 0")
@SP // 19891
AM=M+1 // 19892
A=A-1 // 19893
M=0 // 19894

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq10 // 19895
D=A // 19896
@13 // 19897
M=D // 19898
@SP // 19899
AM=M-1 // 19900
D=M // 19901
A=A-1 // 19902
D=M-D // 19903
@DO_EQ // 19904
0;JMP // 19905
(COMPARE_Memory.deAlloc_eq10)
@SP // 19906
AM=M+1 // 19907
A=A-1 // 19908
M=D // 19909

////IfGotoInstruction{label='Memory.deAlloc.IfElse1}
// if-goto Memory.deAlloc.IfElse1
@SP // 19910
AM=M-1 // 19911
D=M // 19912
@Memory.deAlloc.IfElse1 // 19913
D;JNE // 19914

////PushInstruction("local 1")
@LCL // 19915
A=M+1 // 19916
D=M // 19917
@SP // 19918
AM=M+1 // 19919
A=A-1 // 19920
M=D // 19921

////PushInstruction("constant 1")
@SP // 19922
AM=M+1 // 19923
A=A-1 // 19924
M=1 // 19925

////ArithmeticInstruction{ADD}
@SP // 19926
AM=M-1 // 19927
D=M // 19928
A=A-1 // 19929
M=D+M // 19930

////PopInstruction{address=pointer 1}
@SP // 19931
AM=M-1 // 19932
D=M // 19933
@4 // 19934
M=D // 19935

////PushInstruction("that 0")
@THAT // 19936
A=M // 19937
D=M // 19938
@SP // 19939
AM=M+1 // 19940
A=A-1 // 19941
M=D // 19942

////PushInstruction("constant 1")
@SP // 19943
AM=M+1 // 19944
A=A-1 // 19945
M=1 // 19946

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq11 // 19947
D=A // 19948
@13 // 19949
M=D // 19950
@SP // 19951
AM=M-1 // 19952
D=M // 19953
A=A-1 // 19954
D=M-D // 19955
@DO_EQ // 19956
0;JMP // 19957
(COMPARE_Memory.deAlloc_eq11)
@SP // 19958
AM=M+1 // 19959
A=A-1 // 19960
M=D // 19961

////PushInstruction("constant 0")
@SP // 19962
AM=M+1 // 19963
A=A-1 // 19964
M=0 // 19965

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq12 // 19966
D=A // 19967
@13 // 19968
M=D // 19969
@SP // 19970
AM=M-1 // 19971
D=M // 19972
A=A-1 // 19973
D=M-D // 19974
@DO_EQ // 19975
0;JMP // 19976
(COMPARE_Memory.deAlloc_eq12)
@SP // 19977
AM=M+1 // 19978
A=A-1 // 19979
M=D // 19980

////IfGotoInstruction{label='Memory.deAlloc.IfElse2}
// if-goto Memory.deAlloc.IfElse2
@SP // 19981
AM=M-1 // 19982
D=M // 19983
@Memory.deAlloc.IfElse2 // 19984
D;JNE // 19985

////PushInstruction("constant 2048")
@2048 // 19986
D=A // 19987
@SP // 19988
AM=M+1 // 19989
A=A-1 // 19990
M=D // 19991

////PushInstruction("local 1")
@LCL // 19992
A=M+1 // 19993
D=M // 19994
@SP // 19995
AM=M+1 // 19996
A=A-1 // 19997
M=D // 19998

////PushInstruction("constant 0")
@SP // 19999
AM=M+1 // 20000
A=A-1 // 20001
M=0 // 20002

////ArithmeticInstruction{ADD}
@SP // 20003
AM=M-1 // 20004
D=M // 20005
A=A-1 // 20006
M=D+M // 20007

////PopInstruction{address=pointer 1}
@SP // 20008
AM=M-1 // 20009
D=M // 20010
@4 // 20011
M=D // 20012

////PushInstruction("that 0")
@THAT // 20013
A=M // 20014
D=M // 20015
@SP // 20016
AM=M+1 // 20017
A=A-1 // 20018
M=D // 20019

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 20020
D=A // 20021
@14 // 20022
M=D // 20023
@Memory.getBinIndex // 20024
D=A // 20025
@13 // 20026
M=D // 20027
@Memory.deAlloc.ret.0 // 20028
D=A // 20029
@CALL // 20030
0;JMP // 20031
(Memory.deAlloc.ret.0)

////ArithmeticInstruction{ADD}
@SP // 20032
AM=M-1 // 20033
D=M // 20034
A=A-1 // 20035
M=D+M // 20036

////PushInstruction("local 1")
@LCL // 20037
A=M+1 // 20038
D=M // 20039
@SP // 20040
AM=M+1 // 20041
A=A-1 // 20042
M=D // 20043

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=1, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 20044
D=A // 20045
@14 // 20046
M=D // 20047
@Memory.remove_node // 20048
D=A // 20049
@13 // 20050
M=D // 20051
@Memory.deAlloc.ret.1 // 20052
D=A // 20053
@CALL // 20054
0;JMP // 20055
(Memory.deAlloc.ret.1)

////PopInstruction{address=temp 0}
@SP // 20056
AM=M-1 // 20057
D=M // 20058
@5 // 20059
M=D // 20060

////PushInstruction("local 1")
@LCL // 20061
A=M+1 // 20062
D=M // 20063
@SP // 20064
AM=M+1 // 20065
A=A-1 // 20066
M=D // 20067

////PushInstruction("constant 0")
@SP // 20068
AM=M+1 // 20069
A=A-1 // 20070
M=0 // 20071

////ArithmeticInstruction{ADD}
@SP // 20072
AM=M-1 // 20073
D=M // 20074
A=A-1 // 20075
M=D+M // 20076

////PopInstruction{address=pointer 1}
@SP // 20077
AM=M-1 // 20078
D=M // 20079
@4 // 20080
M=D // 20081

////PushInstruction("that 0")
@THAT // 20082
A=M // 20083
D=M // 20084
@SP // 20085
AM=M+1 // 20086
A=A-1 // 20087
M=D // 20088

////PushInstruction("local 0")
@LCL // 20089
A=M // 20090
D=M // 20091
@SP // 20092
AM=M+1 // 20093
A=A-1 // 20094
M=D // 20095

////PushInstruction("constant 0")
@SP // 20096
AM=M+1 // 20097
A=A-1 // 20098
M=0 // 20099

////ArithmeticInstruction{ADD}
@SP // 20100
AM=M-1 // 20101
D=M // 20102
A=A-1 // 20103
M=D+M // 20104

////PopInstruction{address=pointer 1}
@SP // 20105
AM=M-1 // 20106
D=M // 20107
@4 // 20108
M=D // 20109

////PushInstruction("that 0")
@THAT // 20110
A=M // 20111
D=M // 20112
@SP // 20113
AM=M+1 // 20114
A=A-1 // 20115
M=D // 20116

////ArithmeticInstruction{ADD}
@SP // 20117
AM=M-1 // 20118
D=M // 20119
A=A-1 // 20120
M=D+M // 20121

////PushInstruction("constant 5")
@5 // 20122
D=A // 20123
@SP // 20124
AM=M+1 // 20125
A=A-1 // 20126
M=D // 20127

////ArithmeticInstruction{ADD}
@SP // 20128
AM=M-1 // 20129
D=M // 20130
A=A-1 // 20131
M=D+M // 20132

////PushInstruction("local 1")
@LCL // 20133
A=M+1 // 20134
D=M // 20135
@SP // 20136
AM=M+1 // 20137
A=A-1 // 20138
M=D // 20139

////PushInstruction("constant 0")
@SP // 20140
AM=M+1 // 20141
A=A-1 // 20142
M=0 // 20143

////ArithmeticInstruction{ADD}
@SP // 20144
AM=M-1 // 20145
D=M // 20146
A=A-1 // 20147
M=D+M // 20148

////PopInstruction{address=pointer 1}
@SP // 20149
AM=M-1 // 20150
D=M // 20151
@4 // 20152
M=D // 20153

////PopInstruction{address=that 0}
@SP // 20154
AM=M-1 // 20155
D=M // 20156
@THAT // 20157
A=M // 20158
M=D // 20159

////PushInstruction("local 1")
@LCL // 20160
A=M+1 // 20161
D=M // 20162
@SP // 20163
AM=M+1 // 20164
A=A-1 // 20165
M=D // 20166

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=2, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 20167
D=A // 20168
@14 // 20169
M=D // 20170
@Memory.create_foot // 20171
D=A // 20172
@13 // 20173
M=D // 20174
@Memory.deAlloc.ret.2 // 20175
D=A // 20176
@CALL // 20177
0;JMP // 20178
(Memory.deAlloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 20179
AM=M-1 // 20180
D=M // 20181
@5 // 20182
M=D // 20183

////PushInstruction("local 1")
@LCL // 20184
A=M+1 // 20185
D=M // 20186
@SP // 20187
AM=M+1 // 20188
A=A-1 // 20189
M=D // 20190

////PopInstruction{address=local 0}
@SP // 20191
AM=M-1 // 20192
D=M // 20193
@LCL // 20194
A=M // 20195
M=D // 20196

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 20197
0;JMP // 20198

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 20199
0;JMP // 20200

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////PushInstruction("local 2")
@LCL // 20201
A=M+1 // 20202
A=A+1 // 20203
D=M // 20204
@SP // 20205
AM=M+1 // 20206
A=A-1 // 20207
M=D // 20208

////PushInstruction("constant 0")
@SP // 20209
AM=M+1 // 20210
A=A-1 // 20211
M=0 // 20212

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq13 // 20213
D=A // 20214
@13 // 20215
M=D // 20216
@SP // 20217
AM=M-1 // 20218
D=M // 20219
A=A-1 // 20220
D=M-D // 20221
@DO_EQ // 20222
0;JMP // 20223
(COMPARE_Memory.deAlloc_eq13)
@SP // 20224
AM=M+1 // 20225
A=A-1 // 20226
M=D // 20227

////ArithmeticInstruction{NOT}
@SP // 20228
A=M-1 // 20229
M=!M // 20230

////PushInstruction("constant 0")
@SP // 20231
AM=M+1 // 20232
A=A-1 // 20233
M=0 // 20234

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq14 // 20235
D=A // 20236
@13 // 20237
M=D // 20238
@SP // 20239
AM=M-1 // 20240
D=M // 20241
A=A-1 // 20242
D=M-D // 20243
@DO_EQ // 20244
0;JMP // 20245
(COMPARE_Memory.deAlloc_eq14)
@SP // 20246
AM=M+1 // 20247
A=A-1 // 20248
M=D // 20249

////IfGotoInstruction{label='Memory.deAlloc.IfElse3}
// if-goto Memory.deAlloc.IfElse3
@SP // 20250
AM=M-1 // 20251
D=M // 20252
@Memory.deAlloc.IfElse3 // 20253
D;JNE // 20254

////PushInstruction("local 2")
@LCL // 20255
A=M+1 // 20256
A=A+1 // 20257
D=M // 20258
@SP // 20259
AM=M+1 // 20260
A=A-1 // 20261
M=D // 20262

////PushInstruction("constant 1")
@SP // 20263
AM=M+1 // 20264
A=A-1 // 20265
M=1 // 20266

////ArithmeticInstruction{ADD}
@SP // 20267
AM=M-1 // 20268
D=M // 20269
A=A-1 // 20270
M=D+M // 20271

////PopInstruction{address=pointer 1}
@SP // 20272
AM=M-1 // 20273
D=M // 20274
@4 // 20275
M=D // 20276

////PushInstruction("that 0")
@THAT // 20277
A=M // 20278
D=M // 20279
@SP // 20280
AM=M+1 // 20281
A=A-1 // 20282
M=D // 20283

////PushInstruction("constant 1")
@SP // 20284
AM=M+1 // 20285
A=A-1 // 20286
M=1 // 20287

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq15 // 20288
D=A // 20289
@13 // 20290
M=D // 20291
@SP // 20292
AM=M-1 // 20293
D=M // 20294
A=A-1 // 20295
D=M-D // 20296
@DO_EQ // 20297
0;JMP // 20298
(COMPARE_Memory.deAlloc_eq15)
@SP // 20299
AM=M+1 // 20300
A=A-1 // 20301
M=D // 20302

////PushInstruction("constant 0")
@SP // 20303
AM=M+1 // 20304
A=A-1 // 20305
M=0 // 20306

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq16 // 20307
D=A // 20308
@13 // 20309
M=D // 20310
@SP // 20311
AM=M-1 // 20312
D=M // 20313
A=A-1 // 20314
D=M-D // 20315
@DO_EQ // 20316
0;JMP // 20317
(COMPARE_Memory.deAlloc_eq16)
@SP // 20318
AM=M+1 // 20319
A=A-1 // 20320
M=D // 20321

////IfGotoInstruction{label='Memory.deAlloc.IfElse4}
// if-goto Memory.deAlloc.IfElse4
@SP // 20322
AM=M-1 // 20323
D=M // 20324
@Memory.deAlloc.IfElse4 // 20325
D;JNE // 20326

////PushInstruction("constant 2048")
@2048 // 20327
D=A // 20328
@SP // 20329
AM=M+1 // 20330
A=A-1 // 20331
M=D // 20332

////PushInstruction("local 2")
@LCL // 20333
A=M+1 // 20334
A=A+1 // 20335
D=M // 20336
@SP // 20337
AM=M+1 // 20338
A=A-1 // 20339
M=D // 20340

////PushInstruction("constant 0")
@SP // 20341
AM=M+1 // 20342
A=A-1 // 20343
M=0 // 20344

////ArithmeticInstruction{ADD}
@SP // 20345
AM=M-1 // 20346
D=M // 20347
A=A-1 // 20348
M=D+M // 20349

////PopInstruction{address=pointer 1}
@SP // 20350
AM=M-1 // 20351
D=M // 20352
@4 // 20353
M=D // 20354

////PushInstruction("that 0")
@THAT // 20355
A=M // 20356
D=M // 20357
@SP // 20358
AM=M+1 // 20359
A=A-1 // 20360
M=D // 20361

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 20362
D=A // 20363
@14 // 20364
M=D // 20365
@Memory.getBinIndex // 20366
D=A // 20367
@13 // 20368
M=D // 20369
@Memory.deAlloc.ret.3 // 20370
D=A // 20371
@CALL // 20372
0;JMP // 20373
(Memory.deAlloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 20374
AM=M-1 // 20375
D=M // 20376
A=A-1 // 20377
M=D+M // 20378

////PushInstruction("local 2")
@LCL // 20379
A=M+1 // 20380
A=A+1 // 20381
D=M // 20382
@SP // 20383
AM=M+1 // 20384
A=A-1 // 20385
M=D // 20386

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 20387
D=A // 20388
@14 // 20389
M=D // 20390
@Memory.remove_node // 20391
D=A // 20392
@13 // 20393
M=D // 20394
@Memory.deAlloc.ret.4 // 20395
D=A // 20396
@CALL // 20397
0;JMP // 20398
(Memory.deAlloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 20399
AM=M-1 // 20400
D=M // 20401
@5 // 20402
M=D // 20403

////PushInstruction("local 0")
@LCL // 20404
A=M // 20405
D=M // 20406
@SP // 20407
AM=M+1 // 20408
A=A-1 // 20409
M=D // 20410

////PushInstruction("constant 0")
@SP // 20411
AM=M+1 // 20412
A=A-1 // 20413
M=0 // 20414

////ArithmeticInstruction{ADD}
@SP // 20415
AM=M-1 // 20416
D=M // 20417
A=A-1 // 20418
M=D+M // 20419

////PopInstruction{address=pointer 1}
@SP // 20420
AM=M-1 // 20421
D=M // 20422
@4 // 20423
M=D // 20424

////PushInstruction("that 0")
@THAT // 20425
A=M // 20426
D=M // 20427
@SP // 20428
AM=M+1 // 20429
A=A-1 // 20430
M=D // 20431

////PushInstruction("local 2")
@LCL // 20432
A=M+1 // 20433
A=A+1 // 20434
D=M // 20435
@SP // 20436
AM=M+1 // 20437
A=A-1 // 20438
M=D // 20439

////PushInstruction("constant 0")
@SP // 20440
AM=M+1 // 20441
A=A-1 // 20442
M=0 // 20443

////ArithmeticInstruction{ADD}
@SP // 20444
AM=M-1 // 20445
D=M // 20446
A=A-1 // 20447
M=D+M // 20448

////PopInstruction{address=pointer 1}
@SP // 20449
AM=M-1 // 20450
D=M // 20451
@4 // 20452
M=D // 20453

////PushInstruction("that 0")
@THAT // 20454
A=M // 20455
D=M // 20456
@SP // 20457
AM=M+1 // 20458
A=A-1 // 20459
M=D // 20460

////ArithmeticInstruction{ADD}
@SP // 20461
AM=M-1 // 20462
D=M // 20463
A=A-1 // 20464
M=D+M // 20465

////PushInstruction("constant 5")
@5 // 20466
D=A // 20467
@SP // 20468
AM=M+1 // 20469
A=A-1 // 20470
M=D // 20471

////ArithmeticInstruction{ADD}
@SP // 20472
AM=M-1 // 20473
D=M // 20474
A=A-1 // 20475
M=D+M // 20476

////PushInstruction("local 0")
@LCL // 20477
A=M // 20478
D=M // 20479
@SP // 20480
AM=M+1 // 20481
A=A-1 // 20482
M=D // 20483

////PushInstruction("constant 0")
@SP // 20484
AM=M+1 // 20485
A=A-1 // 20486
M=0 // 20487

////ArithmeticInstruction{ADD}
@SP // 20488
AM=M-1 // 20489
D=M // 20490
A=A-1 // 20491
M=D+M // 20492

////PopInstruction{address=pointer 1}
@SP // 20493
AM=M-1 // 20494
D=M // 20495
@4 // 20496
M=D // 20497

////PopInstruction{address=that 0}
@SP // 20498
AM=M-1 // 20499
D=M // 20500
@THAT // 20501
A=M // 20502
M=D // 20503

////PushInstruction("local 0")
@LCL // 20504
A=M // 20505
D=M // 20506
@SP // 20507
AM=M+1 // 20508
A=A-1 // 20509
M=D // 20510

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=5, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 20511
D=A // 20512
@14 // 20513
M=D // 20514
@Memory.create_foot // 20515
D=A // 20516
@13 // 20517
M=D // 20518
@Memory.deAlloc.ret.5 // 20519
D=A // 20520
@CALL // 20521
0;JMP // 20522
(Memory.deAlloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 20523
AM=M-1 // 20524
D=M // 20525
@5 // 20526
M=D // 20527

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 20528
0;JMP // 20529

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 20530
0;JMP // 20531

////LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)

////LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)

////PushInstruction("constant 2048")
@2048 // 20532
D=A // 20533
@SP // 20534
AM=M+1 // 20535
A=A-1 // 20536
M=D // 20537

////PushInstruction("local 0")
@LCL // 20538
A=M // 20539
D=M // 20540
@SP // 20541
AM=M+1 // 20542
A=A-1 // 20543
M=D // 20544

////PushInstruction("constant 0")
@SP // 20545
AM=M+1 // 20546
A=A-1 // 20547
M=0 // 20548

////ArithmeticInstruction{ADD}
@SP // 20549
AM=M-1 // 20550
D=M // 20551
A=A-1 // 20552
M=D+M // 20553

////PopInstruction{address=pointer 1}
@SP // 20554
AM=M-1 // 20555
D=M // 20556
@4 // 20557
M=D // 20558

////PushInstruction("that 0")
@THAT // 20559
A=M // 20560
D=M // 20561
@SP // 20562
AM=M+1 // 20563
A=A-1 // 20564
M=D // 20565

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=6, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 20566
D=A // 20567
@14 // 20568
M=D // 20569
@Memory.getBinIndex // 20570
D=A // 20571
@13 // 20572
M=D // 20573
@Memory.deAlloc.ret.6 // 20574
D=A // 20575
@CALL // 20576
0;JMP // 20577
(Memory.deAlloc.ret.6)

////ArithmeticInstruction{ADD}
@SP // 20578
AM=M-1 // 20579
D=M // 20580
A=A-1 // 20581
M=D+M // 20582

////PushInstruction("local 0")
@LCL // 20583
A=M // 20584
D=M // 20585
@SP // 20586
AM=M+1 // 20587
A=A-1 // 20588
M=D // 20589

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=7, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.add_node
@7 // 20590
D=A // 20591
@14 // 20592
M=D // 20593
@Memory.add_node // 20594
D=A // 20595
@13 // 20596
M=D // 20597
@Memory.deAlloc.ret.7 // 20598
D=A // 20599
@CALL // 20600
0;JMP // 20601
(Memory.deAlloc.ret.7)

////PopInstruction{address=temp 0}
@SP // 20602
AM=M-1 // 20603
D=M // 20604
@5 // 20605
M=D // 20606

////PushInstruction("constant 0")
@SP // 20607
AM=M+1 // 20608
A=A-1 // 20609
M=0 // 20610

////ReturnInstruction{}
@RETURN // 20611
0;JMP // 20612

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 20613
AM=M+1 // 20614
A=A-1 // 20615
M=0 // 20616
@SP // 20617
AM=M+1 // 20618
A=A-1 // 20619
M=0 // 20620
@SP // 20621
AM=M+1 // 20622
A=A-1 // 20623
M=0 // 20624
@SP // 20625
AM=M+1 // 20626
A=A-1 // 20627
M=0 // 20628

////PushInstruction("argument 0")
@ARG // 20629
A=M // 20630
D=M // 20631
@SP // 20632
AM=M+1 // 20633
A=A-1 // 20634
M=D // 20635

////PushInstruction("constant 0")
@SP // 20636
AM=M+1 // 20637
A=A-1 // 20638
M=0 // 20639

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq17 // 20640
D=A // 20641
@13 // 20642
M=D // 20643
@SP // 20644
AM=M-1 // 20645
D=M // 20646
A=A-1 // 20647
D=M-D // 20648
@DO_EQ // 20649
0;JMP // 20650
(COMPARE_Memory.realloc_eq17)
@SP // 20651
AM=M+1 // 20652
A=A-1 // 20653
M=D // 20654

////PushInstruction("constant 0")
@SP // 20655
AM=M+1 // 20656
A=A-1 // 20657
M=0 // 20658

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq18 // 20659
D=A // 20660
@13 // 20661
M=D // 20662
@SP // 20663
AM=M-1 // 20664
D=M // 20665
A=A-1 // 20666
D=M-D // 20667
@DO_EQ // 20668
0;JMP // 20669
(COMPARE_Memory.realloc_eq18)
@SP // 20670
AM=M+1 // 20671
A=A-1 // 20672
M=D // 20673

////IfGotoInstruction{label='Memory.realloc.IfElse1}
// if-goto Memory.realloc.IfElse1
@SP // 20674
AM=M-1 // 20675
D=M // 20676
@Memory.realloc.IfElse1 // 20677
D;JNE // 20678

////PushInstruction("argument 1")
@ARG // 20679
A=M+1 // 20680
D=M // 20681
@SP // 20682
AM=M+1 // 20683
A=A-1 // 20684
M=D // 20685

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 20686
D=A // 20687
@14 // 20688
M=D // 20689
@Memory.alloc // 20690
D=A // 20691
@13 // 20692
M=D // 20693
@Memory.realloc.ret.0 // 20694
D=A // 20695
@CALL // 20696
0;JMP // 20697
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 20698
0;JMP // 20699

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 20700
0;JMP // 20701

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 20702
A=M // 20703
D=M // 20704
@SP // 20705
AM=M+1 // 20706
A=A-1 // 20707
M=D // 20708

////PushInstruction("constant 1")
@SP // 20709
AM=M+1 // 20710
A=A-1 // 20711
M=1 // 20712

////ArithmeticInstruction{SUB}
@SP // 20713
AM=M-1 // 20714
D=M // 20715
A=A-1 // 20716
M=M-D // 20717

////PopInstruction{address=local 3}
@SP // 20718
AM=M-1 // 20719
D=M // 20720
@LCL // 20721
A=M+1 // 20722
A=A+1 // 20723
A=A+1 // 20724
M=D // 20725

////PushInstruction("local 3")
@LCL // 20726
A=M+1 // 20727
A=A+1 // 20728
A=A+1 // 20729
D=M // 20730
@SP // 20731
AM=M+1 // 20732
A=A-1 // 20733
M=D // 20734

////PushInstruction("constant 0")
@SP // 20735
AM=M+1 // 20736
A=A-1 // 20737
M=0 // 20738

////ArithmeticInstruction{ADD}
@SP // 20739
AM=M-1 // 20740
D=M // 20741
A=A-1 // 20742
M=D+M // 20743

////PopInstruction{address=pointer 1}
@SP // 20744
AM=M-1 // 20745
D=M // 20746
@4 // 20747
M=D // 20748

////PushInstruction("that 0")
@THAT // 20749
A=M // 20750
D=M // 20751
@SP // 20752
AM=M+1 // 20753
A=A-1 // 20754
M=D // 20755

////PopInstruction{address=local 0}
@SP // 20756
AM=M-1 // 20757
D=M // 20758
@LCL // 20759
A=M // 20760
M=D // 20761

////PushInstruction("argument 1")
@ARG // 20762
A=M+1 // 20763
D=M // 20764
@SP // 20765
AM=M+1 // 20766
A=A-1 // 20767
M=D // 20768

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 20769
D=A // 20770
@14 // 20771
M=D // 20772
@Memory.alloc // 20773
D=A // 20774
@13 // 20775
M=D // 20776
@Memory.realloc.ret.1 // 20777
D=A // 20778
@CALL // 20779
0;JMP // 20780
(Memory.realloc.ret.1)

////PopInstruction{address=local 1}
@SP // 20781
AM=M-1 // 20782
D=M // 20783
@LCL // 20784
A=M+1 // 20785
M=D // 20786

////PushInstruction("local 1")
@LCL // 20787
A=M+1 // 20788
D=M // 20789
@SP // 20790
AM=M+1 // 20791
A=A-1 // 20792
M=D // 20793

////PushInstruction("constant 0")
@SP // 20794
AM=M+1 // 20795
A=A-1 // 20796
M=0 // 20797

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq19 // 20798
D=A // 20799
@13 // 20800
M=D // 20801
@SP // 20802
AM=M-1 // 20803
D=M // 20804
A=A-1 // 20805
D=M-D // 20806
@DO_EQ // 20807
0;JMP // 20808
(COMPARE_Memory.realloc_eq19)
@SP // 20809
AM=M+1 // 20810
A=A-1 // 20811
M=D // 20812

////PushInstruction("constant 0")
@SP // 20813
AM=M+1 // 20814
A=A-1 // 20815
M=0 // 20816

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq20 // 20817
D=A // 20818
@13 // 20819
M=D // 20820
@SP // 20821
AM=M-1 // 20822
D=M // 20823
A=A-1 // 20824
D=M-D // 20825
@DO_EQ // 20826
0;JMP // 20827
(COMPARE_Memory.realloc_eq20)
@SP // 20828
AM=M+1 // 20829
A=A-1 // 20830
M=D // 20831

////IfGotoInstruction{label='Memory.realloc.IfElse2}
// if-goto Memory.realloc.IfElse2
@SP // 20832
AM=M-1 // 20833
D=M // 20834
@Memory.realloc.IfElse2 // 20835
D;JNE // 20836

////PushInstruction("constant 0")
@SP // 20837
AM=M+1 // 20838
A=A-1 // 20839
M=0 // 20840

////ReturnInstruction{}
@RETURN // 20841
0;JMP // 20842

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 20843
0;JMP // 20844

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

////PushInstruction("local 0")
@LCL // 20845
A=M // 20846
D=M // 20847
@SP // 20848
AM=M+1 // 20849
A=A-1 // 20850
M=D // 20851

////PushInstruction("argument 1")
@ARG // 20852
A=M+1 // 20853
D=M // 20854
@SP // 20855
AM=M+1 // 20856
A=A-1 // 20857
M=D // 20858

////ArithmeticInstruction{GT}
@COMPARE_Memory.realloc_gt21 // 20859
D=A // 20860
@13 // 20861
M=D // 20862
@SP // 20863
AM=M-1 // 20864
D=M // 20865
A=A-1 // 20866
D=M-D // 20867
@DO_GT // 20868
0;JMP // 20869
(COMPARE_Memory.realloc_gt21)
@SP // 20870
AM=M+1 // 20871
A=A-1 // 20872
M=D // 20873

////ArithmeticInstruction{NOT}
@SP // 20874
A=M-1 // 20875
M=!M // 20876

////PushInstruction("constant 0")
@SP // 20877
AM=M+1 // 20878
A=A-1 // 20879
M=0 // 20880

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq22 // 20881
D=A // 20882
@13 // 20883
M=D // 20884
@SP // 20885
AM=M-1 // 20886
D=M // 20887
A=A-1 // 20888
D=M-D // 20889
@DO_EQ // 20890
0;JMP // 20891
(COMPARE_Memory.realloc_eq22)
@SP // 20892
AM=M+1 // 20893
A=A-1 // 20894
M=D // 20895

////IfGotoInstruction{label='Memory.realloc.IfElse3}
// if-goto Memory.realloc.IfElse3
@SP // 20896
AM=M-1 // 20897
D=M // 20898
@Memory.realloc.IfElse3 // 20899
D;JNE // 20900

////PushInstruction("local 0")
@LCL // 20901
A=M // 20902
D=M // 20903
@SP // 20904
AM=M+1 // 20905
A=A-1 // 20906
M=D // 20907

////PopInstruction{address=local 2}
@SP // 20908
AM=M-1 // 20909
D=M // 20910
@LCL // 20911
A=M+1 // 20912
A=A+1 // 20913
M=D // 20914

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 20915
0;JMP // 20916

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushInstruction("argument 1")
@ARG // 20917
A=M+1 // 20918
D=M // 20919
@SP // 20920
AM=M+1 // 20921
A=A-1 // 20922
M=D // 20923

////PopInstruction{address=local 2}
@SP // 20924
AM=M-1 // 20925
D=M // 20926
@LCL // 20927
A=M+1 // 20928
A=A+1 // 20929
M=D // 20930

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 20931
A=M // 20932
D=M // 20933
@SP // 20934
AM=M+1 // 20935
A=A-1 // 20936
M=D // 20937

////PushInstruction("local 1")
@LCL // 20938
A=M+1 // 20939
D=M // 20940
@SP // 20941
AM=M+1 // 20942
A=A-1 // 20943
M=D // 20944

////PushInstruction("local 2")
@LCL // 20945
A=M+1 // 20946
A=A+1 // 20947
D=M // 20948
@SP // 20949
AM=M+1 // 20950
A=A-1 // 20951
M=D // 20952

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.copy
@8 // 20953
D=A // 20954
@14 // 20955
M=D // 20956
@Memory.copy // 20957
D=A // 20958
@13 // 20959
M=D // 20960
@Memory.realloc.ret.2 // 20961
D=A // 20962
@CALL // 20963
0;JMP // 20964
(Memory.realloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 20965
AM=M-1 // 20966
D=M // 20967
@5 // 20968
M=D // 20969

////PushInstruction("argument 0")
@ARG // 20970
A=M // 20971
D=M // 20972
@SP // 20973
AM=M+1 // 20974
A=A-1 // 20975
M=D // 20976

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.deAlloc
@6 // 20977
D=A // 20978
@14 // 20979
M=D // 20980
@Memory.deAlloc // 20981
D=A // 20982
@13 // 20983
M=D // 20984
@Memory.realloc.ret.3 // 20985
D=A // 20986
@CALL // 20987
0;JMP // 20988
(Memory.realloc.ret.3)

////PopInstruction{address=temp 0}
@SP // 20989
AM=M-1 // 20990
D=M // 20991
@5 // 20992
M=D // 20993

////PushInstruction("local 1")
@LCL // 20994
A=M+1 // 20995
D=M // 20996
@SP // 20997
AM=M+1 // 20998
A=A-1 // 20999
M=D // 21000

////ReturnInstruction{}
@RETURN // 21001
0;JMP // 21002

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 21003
AM=M+1 // 21004
A=A-1 // 21005
M=0 // 21006

////PushInstruction("constant 0")
@SP // 21007
AM=M+1 // 21008
A=A-1 // 21009
M=0 // 21010

////PopInstruction{address=local 0}
@SP // 21011
AM=M-1 // 21012
D=M // 21013
@LCL // 21014
A=M // 21015
M=D // 21016

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////PushInstruction("local 0")
@LCL // 21017
A=M // 21018
D=M // 21019
@SP // 21020
AM=M+1 // 21021
A=A-1 // 21022
M=D // 21023

////PushInstruction("argument 2")
@ARG // 21024
A=M+1 // 21025
A=A+1 // 21026
D=M // 21027
@SP // 21028
AM=M+1 // 21029
A=A-1 // 21030
M=D // 21031

////ArithmeticInstruction{LT}
@COMPARE_Memory.copy_lt23 // 21032
D=A // 21033
@13 // 21034
M=D // 21035
@SP // 21036
AM=M-1 // 21037
D=M // 21038
A=A-1 // 21039
D=M-D // 21040
@DO_LT // 21041
0;JMP // 21042
(COMPARE_Memory.copy_lt23)
@SP // 21043
AM=M+1 // 21044
A=A-1 // 21045
M=D // 21046

////PushInstruction("constant 0")
@SP // 21047
AM=M+1 // 21048
A=A-1 // 21049
M=0 // 21050

////ArithmeticInstruction{EQ}
@COMPARE_Memory.copy_eq24 // 21051
D=A // 21052
@13 // 21053
M=D // 21054
@SP // 21055
AM=M-1 // 21056
D=M // 21057
A=A-1 // 21058
D=M-D // 21059
@DO_EQ // 21060
0;JMP // 21061
(COMPARE_Memory.copy_eq24)
@SP // 21062
AM=M+1 // 21063
A=A-1 // 21064
M=D // 21065

////IfGotoInstruction{label='WHILE_END_Memory.copy1}
// if-goto WHILE_END_Memory.copy1
@SP // 21066
AM=M-1 // 21067
D=M // 21068
@WHILE_END_Memory.copy1 // 21069
D;JNE // 21070

////PushInstruction("argument 0")
@ARG // 21071
A=M // 21072
D=M // 21073
@SP // 21074
AM=M+1 // 21075
A=A-1 // 21076
M=D // 21077

////PushInstruction("local 0")
@LCL // 21078
A=M // 21079
D=M // 21080
@SP // 21081
AM=M+1 // 21082
A=A-1 // 21083
M=D // 21084

////ArithmeticInstruction{ADD}
@SP // 21085
AM=M-1 // 21086
D=M // 21087
A=A-1 // 21088
M=D+M // 21089

////PopInstruction{address=pointer 1}
@SP // 21090
AM=M-1 // 21091
D=M // 21092
@4 // 21093
M=D // 21094

////PushInstruction("that 0")
@THAT // 21095
A=M // 21096
D=M // 21097
@SP // 21098
AM=M+1 // 21099
A=A-1 // 21100
M=D // 21101

////PushInstruction("argument 1")
@ARG // 21102
A=M+1 // 21103
D=M // 21104
@SP // 21105
AM=M+1 // 21106
A=A-1 // 21107
M=D // 21108

////PushInstruction("local 0")
@LCL // 21109
A=M // 21110
D=M // 21111
@SP // 21112
AM=M+1 // 21113
A=A-1 // 21114
M=D // 21115

////ArithmeticInstruction{ADD}
@SP // 21116
AM=M-1 // 21117
D=M // 21118
A=A-1 // 21119
M=D+M // 21120

////PopInstruction{address=pointer 1}
@SP // 21121
AM=M-1 // 21122
D=M // 21123
@4 // 21124
M=D // 21125

////PopInstruction{address=that 0}
@SP // 21126
AM=M-1 // 21127
D=M // 21128
@THAT // 21129
A=M // 21130
M=D // 21131

////PushInstruction("local 0")
@LCL // 21132
A=M // 21133
D=M // 21134
@SP // 21135
AM=M+1 // 21136
A=A-1 // 21137
M=D // 21138

////PushInstruction("constant 1")
@SP // 21139
AM=M+1 // 21140
A=A-1 // 21141
M=1 // 21142

////ArithmeticInstruction{ADD}
@SP // 21143
AM=M-1 // 21144
D=M // 21145
A=A-1 // 21146
M=D+M // 21147

////PopInstruction{address=local 0}
@SP // 21148
AM=M-1 // 21149
D=M // 21150
@LCL // 21151
A=M // 21152
M=D // 21153

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 21154
0;JMP // 21155

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 21156
AM=M+1 // 21157
A=A-1 // 21158
M=0 // 21159

////ReturnInstruction{}
@RETURN // 21160
0;JMP // 21161

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////PushInstruction("argument 1")
@ARG // 21162
A=M+1 // 21163
D=M // 21164
@SP // 21165
AM=M+1 // 21166
A=A-1 // 21167
M=D // 21168

////PushInstruction("constant 2")
@2 // 21169
D=A // 21170
@SP // 21171
AM=M+1 // 21172
A=A-1 // 21173
M=D // 21174

////ArithmeticInstruction{ADD}
@SP // 21175
AM=M-1 // 21176
D=M // 21177
A=A-1 // 21178
M=D+M // 21179

////PopInstruction{address=pointer 1}
@SP // 21180
AM=M-1 // 21181
D=M // 21182
@4 // 21183
M=D // 21184

////PushInstruction("that 0")
@THAT // 21185
A=M // 21186
D=M // 21187
@SP // 21188
AM=M+1 // 21189
A=A-1 // 21190
M=D // 21191

////PushInstruction("constant 0")
@SP // 21192
AM=M+1 // 21193
A=A-1 // 21194
M=0 // 21195

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq25 // 21196
D=A // 21197
@13 // 21198
M=D // 21199
@SP // 21200
AM=M-1 // 21201
D=M // 21202
A=A-1 // 21203
D=M-D // 21204
@DO_EQ // 21205
0;JMP // 21206
(COMPARE_Memory.remove_node_eq25)
@SP // 21207
AM=M+1 // 21208
A=A-1 // 21209
M=D // 21210

////ArithmeticInstruction{NOT}
@SP // 21211
A=M-1 // 21212
M=!M // 21213

////PushInstruction("constant 0")
@SP // 21214
AM=M+1 // 21215
A=A-1 // 21216
M=0 // 21217

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq26 // 21218
D=A // 21219
@13 // 21220
M=D // 21221
@SP // 21222
AM=M-1 // 21223
D=M // 21224
A=A-1 // 21225
D=M-D // 21226
@DO_EQ // 21227
0;JMP // 21228
(COMPARE_Memory.remove_node_eq26)
@SP // 21229
AM=M+1 // 21230
A=A-1 // 21231
M=D // 21232

////IfGotoInstruction{label='Memory.remove_node.IfElse1}
// if-goto Memory.remove_node.IfElse1
@SP // 21233
AM=M-1 // 21234
D=M // 21235
@Memory.remove_node.IfElse1 // 21236
D;JNE // 21237

////PushInstruction("argument 1")
@ARG // 21238
A=M+1 // 21239
D=M // 21240
@SP // 21241
AM=M+1 // 21242
A=A-1 // 21243
M=D // 21244

////PushInstruction("constant 3")
@3 // 21245
D=A // 21246
@SP // 21247
AM=M+1 // 21248
A=A-1 // 21249
M=D // 21250

////ArithmeticInstruction{ADD}
@SP // 21251
AM=M-1 // 21252
D=M // 21253
A=A-1 // 21254
M=D+M // 21255

////PopInstruction{address=pointer 1}
@SP // 21256
AM=M-1 // 21257
D=M // 21258
@4 // 21259
M=D // 21260

////PushInstruction("that 0")
@THAT // 21261
A=M // 21262
D=M // 21263
@SP // 21264
AM=M+1 // 21265
A=A-1 // 21266
M=D // 21267

////PushInstruction("argument 1")
@ARG // 21268
A=M+1 // 21269
D=M // 21270
@SP // 21271
AM=M+1 // 21272
A=A-1 // 21273
M=D // 21274

////PushInstruction("constant 2")
@2 // 21275
D=A // 21276
@SP // 21277
AM=M+1 // 21278
A=A-1 // 21279
M=D // 21280

////ArithmeticInstruction{ADD}
@SP // 21281
AM=M-1 // 21282
D=M // 21283
A=A-1 // 21284
M=D+M // 21285

////PushInstruction("constant 3")
@3 // 21286
D=A // 21287
@SP // 21288
AM=M+1 // 21289
A=A-1 // 21290
M=D // 21291

////ArithmeticInstruction{ADD}
@SP // 21292
AM=M-1 // 21293
D=M // 21294
A=A-1 // 21295
M=D+M // 21296

////PopInstruction{address=pointer 1}
@SP // 21297
AM=M-1 // 21298
D=M // 21299
@4 // 21300
M=D // 21301

////PopInstruction{address=that 0}
@SP // 21302
AM=M-1 // 21303
D=M // 21304
@THAT // 21305
A=M // 21306
M=D // 21307

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 21308
0;JMP // 21309

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushInstruction("argument 1")
@ARG // 21310
A=M+1 // 21311
D=M // 21312
@SP // 21313
AM=M+1 // 21314
A=A-1 // 21315
M=D // 21316

////PushInstruction("constant 3")
@3 // 21317
D=A // 21318
@SP // 21319
AM=M+1 // 21320
A=A-1 // 21321
M=D // 21322

////ArithmeticInstruction{ADD}
@SP // 21323
AM=M-1 // 21324
D=M // 21325
A=A-1 // 21326
M=D+M // 21327

////PopInstruction{address=pointer 1}
@SP // 21328
AM=M-1 // 21329
D=M // 21330
@4 // 21331
M=D // 21332

////PushInstruction("that 0")
@THAT // 21333
A=M // 21334
D=M // 21335
@SP // 21336
AM=M+1 // 21337
A=A-1 // 21338
M=D // 21339

////PushInstruction("argument 0")
@ARG // 21340
A=M // 21341
D=M // 21342
@SP // 21343
AM=M+1 // 21344
A=A-1 // 21345
M=D // 21346

////PushInstruction("constant 0")
@SP // 21347
AM=M+1 // 21348
A=A-1 // 21349
M=0 // 21350

////ArithmeticInstruction{ADD}
@SP // 21351
AM=M-1 // 21352
D=M // 21353
A=A-1 // 21354
M=D+M // 21355

////PopInstruction{address=pointer 1}
@SP // 21356
AM=M-1 // 21357
D=M // 21358
@4 // 21359
M=D // 21360

////PopInstruction{address=that 0}
@SP // 21361
AM=M-1 // 21362
D=M // 21363
@THAT // 21364
A=M // 21365
M=D // 21366

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 21367
A=M+1 // 21368
D=M // 21369
@SP // 21370
AM=M+1 // 21371
A=A-1 // 21372
M=D // 21373

////PushInstruction("constant 3")
@3 // 21374
D=A // 21375
@SP // 21376
AM=M+1 // 21377
A=A-1 // 21378
M=D // 21379

////ArithmeticInstruction{ADD}
@SP // 21380
AM=M-1 // 21381
D=M // 21382
A=A-1 // 21383
M=D+M // 21384

////PopInstruction{address=pointer 1}
@SP // 21385
AM=M-1 // 21386
D=M // 21387
@4 // 21388
M=D // 21389

////PushInstruction("that 0")
@THAT // 21390
A=M // 21391
D=M // 21392
@SP // 21393
AM=M+1 // 21394
A=A-1 // 21395
M=D // 21396

////PushInstruction("constant 0")
@SP // 21397
AM=M+1 // 21398
A=A-1 // 21399
M=0 // 21400

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq27 // 21401
D=A // 21402
@13 // 21403
M=D // 21404
@SP // 21405
AM=M-1 // 21406
D=M // 21407
A=A-1 // 21408
D=M-D // 21409
@DO_EQ // 21410
0;JMP // 21411
(COMPARE_Memory.remove_node_eq27)
@SP // 21412
AM=M+1 // 21413
A=A-1 // 21414
M=D // 21415

////ArithmeticInstruction{NOT}
@SP // 21416
A=M-1 // 21417
M=!M // 21418

////PushInstruction("constant 0")
@SP // 21419
AM=M+1 // 21420
A=A-1 // 21421
M=0 // 21422

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq28 // 21423
D=A // 21424
@13 // 21425
M=D // 21426
@SP // 21427
AM=M-1 // 21428
D=M // 21429
A=A-1 // 21430
D=M-D // 21431
@DO_EQ // 21432
0;JMP // 21433
(COMPARE_Memory.remove_node_eq28)
@SP // 21434
AM=M+1 // 21435
A=A-1 // 21436
M=D // 21437

////IfGotoInstruction{label='Memory.remove_node.IfElse2}
// if-goto Memory.remove_node.IfElse2
@SP // 21438
AM=M-1 // 21439
D=M // 21440
@Memory.remove_node.IfElse2 // 21441
D;JNE // 21442

////PushInstruction("argument 1")
@ARG // 21443
A=M+1 // 21444
D=M // 21445
@SP // 21446
AM=M+1 // 21447
A=A-1 // 21448
M=D // 21449

////PushInstruction("constant 2")
@2 // 21450
D=A // 21451
@SP // 21452
AM=M+1 // 21453
A=A-1 // 21454
M=D // 21455

////ArithmeticInstruction{ADD}
@SP // 21456
AM=M-1 // 21457
D=M // 21458
A=A-1 // 21459
M=D+M // 21460

////PopInstruction{address=pointer 1}
@SP // 21461
AM=M-1 // 21462
D=M // 21463
@4 // 21464
M=D // 21465

////PushInstruction("that 0")
@THAT // 21466
A=M // 21467
D=M // 21468
@SP // 21469
AM=M+1 // 21470
A=A-1 // 21471
M=D // 21472

////PushInstruction("argument 1")
@ARG // 21473
A=M+1 // 21474
D=M // 21475
@SP // 21476
AM=M+1 // 21477
A=A-1 // 21478
M=D // 21479

////PushInstruction("constant 3")
@3 // 21480
D=A // 21481
@SP // 21482
AM=M+1 // 21483
A=A-1 // 21484
M=D // 21485

////ArithmeticInstruction{ADD}
@SP // 21486
AM=M-1 // 21487
D=M // 21488
A=A-1 // 21489
M=D+M // 21490

////PushInstruction("constant 2")
@2 // 21491
D=A // 21492
@SP // 21493
AM=M+1 // 21494
A=A-1 // 21495
M=D // 21496

////ArithmeticInstruction{ADD}
@SP // 21497
AM=M-1 // 21498
D=M // 21499
A=A-1 // 21500
M=D+M // 21501

////PopInstruction{address=pointer 1}
@SP // 21502
AM=M-1 // 21503
D=M // 21504
@4 // 21505
M=D // 21506

////PopInstruction{address=that 0}
@SP // 21507
AM=M-1 // 21508
D=M // 21509
@THAT // 21510
A=M // 21511
M=D // 21512

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 21513
0;JMP // 21514

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 21515
AM=M+1 // 21516
A=A-1 // 21517
M=0 // 21518

////PushInstruction("argument 1")
@ARG // 21519
A=M+1 // 21520
D=M // 21521
@SP // 21522
AM=M+1 // 21523
A=A-1 // 21524
M=D // 21525

////PushInstruction("constant 2")
@2 // 21526
D=A // 21527
@SP // 21528
AM=M+1 // 21529
A=A-1 // 21530
M=D // 21531

////ArithmeticInstruction{ADD}
@SP // 21532
AM=M-1 // 21533
D=M // 21534
A=A-1 // 21535
M=D+M // 21536

////PopInstruction{address=pointer 1}
@SP // 21537
AM=M-1 // 21538
D=M // 21539
@4 // 21540
M=D // 21541

////PopInstruction{address=that 0}
@SP // 21542
AM=M-1 // 21543
D=M // 21544
@THAT // 21545
A=M // 21546
M=D // 21547

////PushInstruction("constant 0")
@SP // 21548
AM=M+1 // 21549
A=A-1 // 21550
M=0 // 21551

////PushInstruction("argument 1")
@ARG // 21552
A=M+1 // 21553
D=M // 21554
@SP // 21555
AM=M+1 // 21556
A=A-1 // 21557
M=D // 21558

////PushInstruction("constant 3")
@3 // 21559
D=A // 21560
@SP // 21561
AM=M+1 // 21562
A=A-1 // 21563
M=D // 21564

////ArithmeticInstruction{ADD}
@SP // 21565
AM=M-1 // 21566
D=M // 21567
A=A-1 // 21568
M=D+M // 21569

////PopInstruction{address=pointer 1}
@SP // 21570
AM=M-1 // 21571
D=M // 21572
@4 // 21573
M=D // 21574

////PopInstruction{address=that 0}
@SP // 21575
AM=M-1 // 21576
D=M // 21577
@THAT // 21578
A=M // 21579
M=D // 21580

////PushInstruction("constant 0")
@SP // 21581
AM=M+1 // 21582
A=A-1 // 21583
M=0 // 21584

////ReturnInstruction{}
@RETURN // 21585
0;JMP // 21586

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 21587
AM=M+1 // 21588
A=A-1 // 21589
M=0 // 21590

////PushInstruction("constant 0")
@SP // 21591
AM=M+1 // 21592
A=A-1 // 21593
M=0 // 21594

////PopInstruction{address=local 0}
@SP // 21595
AM=M-1 // 21596
D=M // 21597
@LCL // 21598
A=M // 21599
M=D // 21600

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

////PushInstruction("local 0")
@LCL // 21601
A=M // 21602
D=M // 21603
@SP // 21604
AM=M+1 // 21605
A=A-1 // 21606
M=D // 21607

////PushInstruction("constant 7")
@7 // 21608
D=A // 21609
@SP // 21610
AM=M+1 // 21611
A=A-1 // 21612
M=D // 21613

////ArithmeticInstruction{LT}
@COMPARE_Memory.getBinIndex_lt29 // 21614
D=A // 21615
@13 // 21616
M=D // 21617
@SP // 21618
AM=M-1 // 21619
D=M // 21620
A=A-1 // 21621
D=M-D // 21622
@DO_LT // 21623
0;JMP // 21624
(COMPARE_Memory.getBinIndex_lt29)
@SP // 21625
AM=M+1 // 21626
A=A-1 // 21627
M=D // 21628

////PushInstruction("constant 2048")
@2048 // 21629
D=A // 21630
@SP // 21631
AM=M+1 // 21632
A=A-1 // 21633
M=D // 21634

////PushInstruction("local 0")
@LCL // 21635
A=M // 21636
D=M // 21637
@SP // 21638
AM=M+1 // 21639
A=A-1 // 21640
M=D // 21641

////ArithmeticInstruction{ADD}
@SP // 21642
AM=M-1 // 21643
D=M // 21644
A=A-1 // 21645
M=D+M // 21646

////PopInstruction{address=pointer 1}
@SP // 21647
AM=M-1 // 21648
D=M // 21649
@4 // 21650
M=D // 21651

////PushInstruction("that 0")
@THAT // 21652
A=M // 21653
D=M // 21654
@SP // 21655
AM=M+1 // 21656
A=A-1 // 21657
M=D // 21658

////PushInstruction("constant 0")
@SP // 21659
AM=M+1 // 21660
A=A-1 // 21661
M=0 // 21662

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq30 // 21663
D=A // 21664
@13 // 21665
M=D // 21666
@SP // 21667
AM=M-1 // 21668
D=M // 21669
A=A-1 // 21670
D=M-D // 21671
@DO_EQ // 21672
0;JMP // 21673
(COMPARE_Memory.getBinIndex_eq30)
@SP // 21674
AM=M+1 // 21675
A=A-1 // 21676
M=D // 21677

////ArithmeticInstruction{NOT}
@SP // 21678
A=M-1 // 21679
M=!M // 21680

////ArithmeticInstruction{AND}
@SP // 21681
AM=M-1 // 21682
D=M // 21683
A=A-1 // 21684
M=D&M // 21685

////PushInstruction("constant 0")
@SP // 21686
AM=M+1 // 21687
A=A-1 // 21688
M=0 // 21689

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq31 // 21690
D=A // 21691
@13 // 21692
M=D // 21693
@SP // 21694
AM=M-1 // 21695
D=M // 21696
A=A-1 // 21697
D=M-D // 21698
@DO_EQ // 21699
0;JMP // 21700
(COMPARE_Memory.getBinIndex_eq31)
@SP // 21701
AM=M+1 // 21702
A=A-1 // 21703
M=D // 21704

////IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}
// if-goto WHILE_END_Memory.getBinIndex1
@SP // 21705
AM=M-1 // 21706
D=M // 21707
@WHILE_END_Memory.getBinIndex1 // 21708
D;JNE // 21709

////PushInstruction("argument 0")
@ARG // 21710
A=M // 21711
D=M // 21712
@SP // 21713
AM=M+1 // 21714
A=A-1 // 21715
M=D // 21716

////PushInstruction("local 0")
@LCL // 21717
A=M // 21718
D=M // 21719
@SP // 21720
AM=M+1 // 21721
A=A-1 // 21722
M=D // 21723

////PushInstruction("constant 1")
@SP // 21724
AM=M+1 // 21725
A=A-1 // 21726
M=1 // 21727

////ArithmeticInstruction{ADD}
@SP // 21728
AM=M-1 // 21729
D=M // 21730
A=A-1 // 21731
M=D+M // 21732

////PushInstruction("constant 16")
@16 // 21733
D=A // 21734
@SP // 21735
AM=M+1 // 21736
A=A-1 // 21737
M=D // 21738

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}
// call Math.multiply
@7 // 21739
D=A // 21740
@14 // 21741
M=D // 21742
@Math.multiply // 21743
D=A // 21744
@13 // 21745
M=D // 21746
@Memory.getBinIndex.ret.0 // 21747
D=A // 21748
@CALL // 21749
0;JMP // 21750
(Memory.getBinIndex.ret.0)

////ArithmeticInstruction{GT}
@COMPARE_Memory.getBinIndex_gt32 // 21751
D=A // 21752
@13 // 21753
M=D // 21754
@SP // 21755
AM=M-1 // 21756
D=M // 21757
A=A-1 // 21758
D=M-D // 21759
@DO_GT // 21760
0;JMP // 21761
(COMPARE_Memory.getBinIndex_gt32)
@SP // 21762
AM=M+1 // 21763
A=A-1 // 21764
M=D // 21765

////ArithmeticInstruction{NOT}
@SP // 21766
A=M-1 // 21767
M=!M // 21768

////PushInstruction("constant 0")
@SP // 21769
AM=M+1 // 21770
A=A-1 // 21771
M=0 // 21772

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq33 // 21773
D=A // 21774
@13 // 21775
M=D // 21776
@SP // 21777
AM=M-1 // 21778
D=M // 21779
A=A-1 // 21780
D=M-D // 21781
@DO_EQ // 21782
0;JMP // 21783
(COMPARE_Memory.getBinIndex_eq33)
@SP // 21784
AM=M+1 // 21785
A=A-1 // 21786
M=D // 21787

////IfGotoInstruction{label='Memory.getBinIndex.IfElse1}
// if-goto Memory.getBinIndex.IfElse1
@SP // 21788
AM=M-1 // 21789
D=M // 21790
@Memory.getBinIndex.IfElse1 // 21791
D;JNE // 21792

////PushInstruction("local 0")
@LCL // 21793
A=M // 21794
D=M // 21795
@SP // 21796
AM=M+1 // 21797
A=A-1 // 21798
M=D // 21799

////ReturnInstruction{}
@RETURN // 21800
0;JMP // 21801

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 21802
0;JMP // 21803

////LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)

////LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)

////PushInstruction("local 0")
@LCL // 21804
A=M // 21805
D=M // 21806
@SP // 21807
AM=M+1 // 21808
A=A-1 // 21809
M=D // 21810

////PushInstruction("constant 1")
@SP // 21811
AM=M+1 // 21812
A=A-1 // 21813
M=1 // 21814

////ArithmeticInstruction{ADD}
@SP // 21815
AM=M-1 // 21816
D=M // 21817
A=A-1 // 21818
M=D+M // 21819

////PopInstruction{address=local 0}
@SP // 21820
AM=M-1 // 21821
D=M // 21822
@LCL // 21823
A=M // 21824
M=D // 21825

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 21826
0;JMP // 21827

////LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)

////PushInstruction("constant 7")
@7 // 21828
D=A // 21829
@SP // 21830
AM=M+1 // 21831
A=A-1 // 21832
M=D // 21833

////PushInstruction("constant 1")
@SP // 21834
AM=M+1 // 21835
A=A-1 // 21836
M=1 // 21837

////ArithmeticInstruction{SUB}
@SP // 21838
AM=M-1 // 21839
D=M // 21840
A=A-1 // 21841
M=M-D // 21842

////ReturnInstruction{}
@RETURN // 21843
0;JMP // 21844

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 21845
AM=M+1 // 21846
A=A-1 // 21847
M=0 // 21848

////PushInstruction("argument 0")
@ARG // 21849
A=M // 21850
D=M // 21851
@SP // 21852
AM=M+1 // 21853
A=A-1 // 21854
M=D // 21855

////PushInstruction("constant 0")
@SP // 21856
AM=M+1 // 21857
A=A-1 // 21858
M=0 // 21859

////ArithmeticInstruction{ADD}
@SP // 21860
AM=M-1 // 21861
D=M // 21862
A=A-1 // 21863
M=D+M // 21864

////PopInstruction{address=pointer 1}
@SP // 21865
AM=M-1 // 21866
D=M // 21867
@4 // 21868
M=D // 21869

////PushInstruction("that 0")
@THAT // 21870
A=M // 21871
D=M // 21872
@SP // 21873
AM=M+1 // 21874
A=A-1 // 21875
M=D // 21876

////PopInstruction{address=local 0}
@SP // 21877
AM=M-1 // 21878
D=M // 21879
@LCL // 21880
A=M // 21881
M=D // 21882

////PushInstruction("local 0")
@LCL // 21883
A=M // 21884
D=M // 21885
@SP // 21886
AM=M+1 // 21887
A=A-1 // 21888
M=D // 21889

////PushInstruction("constant 0")
@SP // 21890
AM=M+1 // 21891
A=A-1 // 21892
M=0 // 21893

////ArithmeticInstruction{ADD}
@SP // 21894
AM=M-1 // 21895
D=M // 21896
A=A-1 // 21897
M=D+M // 21898

////PopInstruction{address=pointer 1}
@SP // 21899
AM=M-1 // 21900
D=M // 21901
@4 // 21902
M=D // 21903

////PushInstruction("that 0")
@THAT // 21904
A=M // 21905
D=M // 21906
@SP // 21907
AM=M+1 // 21908
A=A-1 // 21909
M=D // 21910

////PushInstruction("argument 1")
@ARG // 21911
A=M+1 // 21912
D=M // 21913
@SP // 21914
AM=M+1 // 21915
A=A-1 // 21916
M=D // 21917

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt34 // 21918
D=A // 21919
@13 // 21920
M=D // 21921
@SP // 21922
AM=M-1 // 21923
D=M // 21924
A=A-1 // 21925
D=M-D // 21926
@DO_LT // 21927
0;JMP // 21928
(COMPARE_Memory.get_best_fit_lt34)
@SP // 21929
AM=M+1 // 21930
A=A-1 // 21931
M=D // 21932

////ArithmeticInstruction{NOT}
@SP // 21933
A=M-1 // 21934
M=!M // 21935

////PushInstruction("constant 0")
@SP // 21936
AM=M+1 // 21937
A=A-1 // 21938
M=0 // 21939

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq35 // 21940
D=A // 21941
@13 // 21942
M=D // 21943
@SP // 21944
AM=M-1 // 21945
D=M // 21946
A=A-1 // 21947
D=M-D // 21948
@DO_EQ // 21949
0;JMP // 21950
(COMPARE_Memory.get_best_fit_eq35)
@SP // 21951
AM=M+1 // 21952
A=A-1 // 21953
M=D // 21954

////IfGotoInstruction{label='Memory.get_best_fit.IfElse1}
// if-goto Memory.get_best_fit.IfElse1
@SP // 21955
AM=M-1 // 21956
D=M // 21957
@Memory.get_best_fit.IfElse1 // 21958
D;JNE // 21959

////PushInstruction("local 0")
@LCL // 21960
A=M // 21961
D=M // 21962
@SP // 21963
AM=M+1 // 21964
A=A-1 // 21965
M=D // 21966

////ReturnInstruction{}
@RETURN // 21967
0;JMP // 21968

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 21969
0;JMP // 21970

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
@LCL // 21971
A=M // 21972
D=M // 21973
@SP // 21974
AM=M+1 // 21975
A=A-1 // 21976
M=D // 21977

////PushInstruction("constant 3")
@3 // 21978
D=A // 21979
@SP // 21980
AM=M+1 // 21981
A=A-1 // 21982
M=D // 21983

////ArithmeticInstruction{ADD}
@SP // 21984
AM=M-1 // 21985
D=M // 21986
A=A-1 // 21987
M=D+M // 21988

////PopInstruction{address=pointer 1}
@SP // 21989
AM=M-1 // 21990
D=M // 21991
@4 // 21992
M=D // 21993

////PushInstruction("that 0")
@THAT // 21994
A=M // 21995
D=M // 21996
@SP // 21997
AM=M+1 // 21998
A=A-1 // 21999
M=D // 22000

////PushInstruction("constant 0")
@SP // 22001
AM=M+1 // 22002
A=A-1 // 22003
M=0 // 22004

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq36 // 22005
D=A // 22006
@13 // 22007
M=D // 22008
@SP // 22009
AM=M-1 // 22010
D=M // 22011
A=A-1 // 22012
D=M-D // 22013
@DO_EQ // 22014
0;JMP // 22015
(COMPARE_Memory.get_best_fit_eq36)
@SP // 22016
AM=M+1 // 22017
A=A-1 // 22018
M=D // 22019

////ArithmeticInstruction{NOT}
@SP // 22020
A=M-1 // 22021
M=!M // 22022

////PushInstruction("constant 0")
@SP // 22023
AM=M+1 // 22024
A=A-1 // 22025
M=0 // 22026

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq37 // 22027
D=A // 22028
@13 // 22029
M=D // 22030
@SP // 22031
AM=M-1 // 22032
D=M // 22033
A=A-1 // 22034
D=M-D // 22035
@DO_EQ // 22036
0;JMP // 22037
(COMPARE_Memory.get_best_fit_eq37)
@SP // 22038
AM=M+1 // 22039
A=A-1 // 22040
M=D // 22041

////IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}
// if-goto WHILE_END_Memory.get_best_fit1
@SP // 22042
AM=M-1 // 22043
D=M // 22044
@WHILE_END_Memory.get_best_fit1 // 22045
D;JNE // 22046

////PushInstruction("local 0")
@LCL // 22047
A=M // 22048
D=M // 22049
@SP // 22050
AM=M+1 // 22051
A=A-1 // 22052
M=D // 22053

////PushInstruction("constant 3")
@3 // 22054
D=A // 22055
@SP // 22056
AM=M+1 // 22057
A=A-1 // 22058
M=D // 22059

////ArithmeticInstruction{ADD}
@SP // 22060
AM=M-1 // 22061
D=M // 22062
A=A-1 // 22063
M=D+M // 22064

////PopInstruction{address=pointer 1}
@SP // 22065
AM=M-1 // 22066
D=M // 22067
@4 // 22068
M=D // 22069

////PushInstruction("that 0")
@THAT // 22070
A=M // 22071
D=M // 22072
@SP // 22073
AM=M+1 // 22074
A=A-1 // 22075
M=D // 22076

////PopInstruction{address=local 0}
@SP // 22077
AM=M-1 // 22078
D=M // 22079
@LCL // 22080
A=M // 22081
M=D // 22082

////PushInstruction("local 0")
@LCL // 22083
A=M // 22084
D=M // 22085
@SP // 22086
AM=M+1 // 22087
A=A-1 // 22088
M=D // 22089

////PushInstruction("constant 0")
@SP // 22090
AM=M+1 // 22091
A=A-1 // 22092
M=0 // 22093

////ArithmeticInstruction{ADD}
@SP // 22094
AM=M-1 // 22095
D=M // 22096
A=A-1 // 22097
M=D+M // 22098

////PopInstruction{address=pointer 1}
@SP // 22099
AM=M-1 // 22100
D=M // 22101
@4 // 22102
M=D // 22103

////PushInstruction("that 0")
@THAT // 22104
A=M // 22105
D=M // 22106
@SP // 22107
AM=M+1 // 22108
A=A-1 // 22109
M=D // 22110

////PushInstruction("argument 1")
@ARG // 22111
A=M+1 // 22112
D=M // 22113
@SP // 22114
AM=M+1 // 22115
A=A-1 // 22116
M=D // 22117

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt38 // 22118
D=A // 22119
@13 // 22120
M=D // 22121
@SP // 22122
AM=M-1 // 22123
D=M // 22124
A=A-1 // 22125
D=M-D // 22126
@DO_LT // 22127
0;JMP // 22128
(COMPARE_Memory.get_best_fit_lt38)
@SP // 22129
AM=M+1 // 22130
A=A-1 // 22131
M=D // 22132

////ArithmeticInstruction{NOT}
@SP // 22133
A=M-1 // 22134
M=!M // 22135

////PushInstruction("constant 0")
@SP // 22136
AM=M+1 // 22137
A=A-1 // 22138
M=0 // 22139

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq39 // 22140
D=A // 22141
@13 // 22142
M=D // 22143
@SP // 22144
AM=M-1 // 22145
D=M // 22146
A=A-1 // 22147
D=M-D // 22148
@DO_EQ // 22149
0;JMP // 22150
(COMPARE_Memory.get_best_fit_eq39)
@SP // 22151
AM=M+1 // 22152
A=A-1 // 22153
M=D // 22154

////IfGotoInstruction{label='Memory.get_best_fit.IfElse2}
// if-goto Memory.get_best_fit.IfElse2
@SP // 22155
AM=M-1 // 22156
D=M // 22157
@Memory.get_best_fit.IfElse2 // 22158
D;JNE // 22159

////PushInstruction("local 0")
@LCL // 22160
A=M // 22161
D=M // 22162
@SP // 22163
AM=M+1 // 22164
A=A-1 // 22165
M=D // 22166

////ReturnInstruction{}
@RETURN // 22167
0;JMP // 22168

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 22169
0;JMP // 22170

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 22171
0;JMP // 22172

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 22173
AM=M+1 // 22174
A=A-1 // 22175
M=0 // 22176

////ReturnInstruction{}
@RETURN // 22177
0;JMP // 22178

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushInstruction("argument 0")
@ARG // 22179
A=M // 22180
D=M // 22181
@SP // 22182
AM=M+1 // 22183
A=A-1 // 22184
M=D // 22185

////PushInstruction("argument 0")
@ARG // 22186
A=M // 22187
D=M // 22188
@SP // 22189
AM=M+1 // 22190
A=A-1 // 22191
M=D // 22192

////PushInstruction("argument 0")
@ARG // 22193
A=M // 22194
D=M // 22195
@SP // 22196
AM=M+1 // 22197
A=A-1 // 22198
M=D // 22199

////PushInstruction("constant 0")
@SP // 22200
AM=M+1 // 22201
A=A-1 // 22202
M=0 // 22203

////ArithmeticInstruction{ADD}
@SP // 22204
AM=M-1 // 22205
D=M // 22206
A=A-1 // 22207
M=D+M // 22208

////PopInstruction{address=pointer 1}
@SP // 22209
AM=M-1 // 22210
D=M // 22211
@4 // 22212
M=D // 22213

////PushInstruction("that 0")
@THAT // 22214
A=M // 22215
D=M // 22216
@SP // 22217
AM=M+1 // 22218
A=A-1 // 22219
M=D // 22220

////PushInstruction("constant 4")
@4 // 22221
D=A // 22222
@SP // 22223
AM=M+1 // 22224
A=A-1 // 22225
M=D // 22226

////ArithmeticInstruction{ADD}
@SP // 22227
AM=M-1 // 22228
D=M // 22229
A=A-1 // 22230
M=D+M // 22231

////ArithmeticInstruction{ADD}
@SP // 22232
AM=M-1 // 22233
D=M // 22234
A=A-1 // 22235
M=D+M // 22236

////PopInstruction{address=pointer 1}
@SP // 22237
AM=M-1 // 22238
D=M // 22239
@4 // 22240
M=D // 22241

////PopInstruction{address=that 0}
@SP // 22242
AM=M-1 // 22243
D=M // 22244
@THAT // 22245
A=M // 22246
M=D // 22247

////PushInstruction("constant 0")
@SP // 22248
AM=M+1 // 22249
A=A-1 // 22250
M=0 // 22251

////ReturnInstruction{}
@RETURN // 22252
0;JMP // 22253

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 22254
AM=M+1 // 22255
A=A-1 // 22256
M=0 // 22257
@SP // 22258
AM=M+1 // 22259
A=A-1 // 22260
M=0 // 22261

////PushInstruction("constant 0")
@SP // 22262
AM=M+1 // 22263
A=A-1 // 22264
M=0 // 22265

////PushInstruction("argument 1")
@ARG // 22266
A=M+1 // 22267
D=M // 22268
@SP // 22269
AM=M+1 // 22270
A=A-1 // 22271
M=D // 22272

////PushInstruction("constant 2")
@2 // 22273
D=A // 22274
@SP // 22275
AM=M+1 // 22276
A=A-1 // 22277
M=D // 22278

////ArithmeticInstruction{ADD}
@SP // 22279
AM=M-1 // 22280
D=M // 22281
A=A-1 // 22282
M=D+M // 22283

////PopInstruction{address=pointer 1}
@SP // 22284
AM=M-1 // 22285
D=M // 22286
@4 // 22287
M=D // 22288

////PopInstruction{address=that 0}
@SP // 22289
AM=M-1 // 22290
D=M // 22291
@THAT // 22292
A=M // 22293
M=D // 22294

////PushInstruction("constant 0")
@SP // 22295
AM=M+1 // 22296
A=A-1 // 22297
M=0 // 22298

////PushInstruction("argument 1")
@ARG // 22299
A=M+1 // 22300
D=M // 22301
@SP // 22302
AM=M+1 // 22303
A=A-1 // 22304
M=D // 22305

////PushInstruction("constant 3")
@3 // 22306
D=A // 22307
@SP // 22308
AM=M+1 // 22309
A=A-1 // 22310
M=D // 22311

////ArithmeticInstruction{ADD}
@SP // 22312
AM=M-1 // 22313
D=M // 22314
A=A-1 // 22315
M=D+M // 22316

////PopInstruction{address=pointer 1}
@SP // 22317
AM=M-1 // 22318
D=M // 22319
@4 // 22320
M=D // 22321

////PopInstruction{address=that 0}
@SP // 22322
AM=M-1 // 22323
D=M // 22324
@THAT // 22325
A=M // 22326
M=D // 22327

////PushInstruction("argument 0")
@ARG // 22328
A=M // 22329
D=M // 22330
@SP // 22331
AM=M+1 // 22332
A=A-1 // 22333
M=D // 22334

////PushInstruction("constant 0")
@SP // 22335
AM=M+1 // 22336
A=A-1 // 22337
M=0 // 22338

////ArithmeticInstruction{ADD}
@SP // 22339
AM=M-1 // 22340
D=M // 22341
A=A-1 // 22342
M=D+M // 22343

////PopInstruction{address=pointer 1}
@SP // 22344
AM=M-1 // 22345
D=M // 22346
@4 // 22347
M=D // 22348

////PushInstruction("that 0")
@THAT // 22349
A=M // 22350
D=M // 22351
@SP // 22352
AM=M+1 // 22353
A=A-1 // 22354
M=D // 22355

////PushInstruction("constant 0")
@SP // 22356
AM=M+1 // 22357
A=A-1 // 22358
M=0 // 22359

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq40 // 22360
D=A // 22361
@13 // 22362
M=D // 22363
@SP // 22364
AM=M-1 // 22365
D=M // 22366
A=A-1 // 22367
D=M-D // 22368
@DO_EQ // 22369
0;JMP // 22370
(COMPARE_Memory.add_node_eq40)
@SP // 22371
AM=M+1 // 22372
A=A-1 // 22373
M=D // 22374

////PushInstruction("constant 0")
@SP // 22375
AM=M+1 // 22376
A=A-1 // 22377
M=0 // 22378

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq41 // 22379
D=A // 22380
@13 // 22381
M=D // 22382
@SP // 22383
AM=M-1 // 22384
D=M // 22385
A=A-1 // 22386
D=M-D // 22387
@DO_EQ // 22388
0;JMP // 22389
(COMPARE_Memory.add_node_eq41)
@SP // 22390
AM=M+1 // 22391
A=A-1 // 22392
M=D // 22393

////IfGotoInstruction{label='Memory.add_node.IfElse1}
// if-goto Memory.add_node.IfElse1
@SP // 22394
AM=M-1 // 22395
D=M // 22396
@Memory.add_node.IfElse1 // 22397
D;JNE // 22398

////PushInstruction("argument 1")
@ARG // 22399
A=M+1 // 22400
D=M // 22401
@SP // 22402
AM=M+1 // 22403
A=A-1 // 22404
M=D // 22405

////PushInstruction("argument 0")
@ARG // 22406
A=M // 22407
D=M // 22408
@SP // 22409
AM=M+1 // 22410
A=A-1 // 22411
M=D // 22412

////PushInstruction("constant 0")
@SP // 22413
AM=M+1 // 22414
A=A-1 // 22415
M=0 // 22416

////ArithmeticInstruction{ADD}
@SP // 22417
AM=M-1 // 22418
D=M // 22419
A=A-1 // 22420
M=D+M // 22421

////PopInstruction{address=pointer 1}
@SP // 22422
AM=M-1 // 22423
D=M // 22424
@4 // 22425
M=D // 22426

////PopInstruction{address=that 0}
@SP // 22427
AM=M-1 // 22428
D=M // 22429
@THAT // 22430
A=M // 22431
M=D // 22432

////PushInstruction("constant 0")
@SP // 22433
AM=M+1 // 22434
A=A-1 // 22435
M=0 // 22436

////ReturnInstruction{}
@RETURN // 22437
0;JMP // 22438

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 22439
0;JMP // 22440

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 22441
A=M // 22442
D=M // 22443
@SP // 22444
AM=M+1 // 22445
A=A-1 // 22446
M=D // 22447

////PushInstruction("constant 0")
@SP // 22448
AM=M+1 // 22449
A=A-1 // 22450
M=0 // 22451

////ArithmeticInstruction{ADD}
@SP // 22452
AM=M-1 // 22453
D=M // 22454
A=A-1 // 22455
M=D+M // 22456

////PopInstruction{address=pointer 1}
@SP // 22457
AM=M-1 // 22458
D=M // 22459
@4 // 22460
M=D // 22461

////PushInstruction("that 0")
@THAT // 22462
A=M // 22463
D=M // 22464
@SP // 22465
AM=M+1 // 22466
A=A-1 // 22467
M=D // 22468

////PopInstruction{address=local 0}
@SP // 22469
AM=M-1 // 22470
D=M // 22471
@LCL // 22472
A=M // 22473
M=D // 22474

////PushInstruction("constant 0")
@SP // 22475
AM=M+1 // 22476
A=A-1 // 22477
M=0 // 22478

////PopInstruction{address=local 1}
@SP // 22479
AM=M-1 // 22480
D=M // 22481
@LCL // 22482
A=M+1 // 22483
M=D // 22484

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

////PushInstruction("local 0")
@LCL // 22485
A=M // 22486
D=M // 22487
@SP // 22488
AM=M+1 // 22489
A=A-1 // 22490
M=D // 22491

////PushInstruction("constant 0")
@SP // 22492
AM=M+1 // 22493
A=A-1 // 22494
M=0 // 22495

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq42 // 22496
D=A // 22497
@13 // 22498
M=D // 22499
@SP // 22500
AM=M-1 // 22501
D=M // 22502
A=A-1 // 22503
D=M-D // 22504
@DO_EQ // 22505
0;JMP // 22506
(COMPARE_Memory.add_node_eq42)
@SP // 22507
AM=M+1 // 22508
A=A-1 // 22509
M=D // 22510

////ArithmeticInstruction{NOT}
@SP // 22511
A=M-1 // 22512
M=!M // 22513

////PushInstruction("local 0")
@LCL // 22514
A=M // 22515
D=M // 22516
@SP // 22517
AM=M+1 // 22518
A=A-1 // 22519
M=D // 22520

////PushInstruction("constant 0")
@SP // 22521
AM=M+1 // 22522
A=A-1 // 22523
M=0 // 22524

////ArithmeticInstruction{ADD}
@SP // 22525
AM=M-1 // 22526
D=M // 22527
A=A-1 // 22528
M=D+M // 22529

////PopInstruction{address=pointer 1}
@SP // 22530
AM=M-1 // 22531
D=M // 22532
@4 // 22533
M=D // 22534

////PushInstruction("that 0")
@THAT // 22535
A=M // 22536
D=M // 22537
@SP // 22538
AM=M+1 // 22539
A=A-1 // 22540
M=D // 22541

////PushInstruction("argument 1")
@ARG // 22542
A=M+1 // 22543
D=M // 22544
@SP // 22545
AM=M+1 // 22546
A=A-1 // 22547
M=D // 22548

////PushInstruction("constant 0")
@SP // 22549
AM=M+1 // 22550
A=A-1 // 22551
M=0 // 22552

////ArithmeticInstruction{ADD}
@SP // 22553
AM=M-1 // 22554
D=M // 22555
A=A-1 // 22556
M=D+M // 22557

////PopInstruction{address=pointer 1}
@SP // 22558
AM=M-1 // 22559
D=M // 22560
@4 // 22561
M=D // 22562

////PushInstruction("that 0")
@THAT // 22563
A=M // 22564
D=M // 22565
@SP // 22566
AM=M+1 // 22567
A=A-1 // 22568
M=D // 22569

////ArithmeticInstruction{GT}
@COMPARE_Memory.add_node_gt43 // 22570
D=A // 22571
@13 // 22572
M=D // 22573
@SP // 22574
AM=M-1 // 22575
D=M // 22576
A=A-1 // 22577
D=M-D // 22578
@DO_GT // 22579
0;JMP // 22580
(COMPARE_Memory.add_node_gt43)
@SP // 22581
AM=M+1 // 22582
A=A-1 // 22583
M=D // 22584

////ArithmeticInstruction{NOT}
@SP // 22585
A=M-1 // 22586
M=!M // 22587

////ArithmeticInstruction{AND}
@SP // 22588
AM=M-1 // 22589
D=M // 22590
A=A-1 // 22591
M=D&M // 22592

////PushInstruction("constant 0")
@SP // 22593
AM=M+1 // 22594
A=A-1 // 22595
M=0 // 22596

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq44 // 22597
D=A // 22598
@13 // 22599
M=D // 22600
@SP // 22601
AM=M-1 // 22602
D=M // 22603
A=A-1 // 22604
D=M-D // 22605
@DO_EQ // 22606
0;JMP // 22607
(COMPARE_Memory.add_node_eq44)
@SP // 22608
AM=M+1 // 22609
A=A-1 // 22610
M=D // 22611

////IfGotoInstruction{label='WHILE_END_Memory.add_node1}
// if-goto WHILE_END_Memory.add_node1
@SP // 22612
AM=M-1 // 22613
D=M // 22614
@WHILE_END_Memory.add_node1 // 22615
D;JNE // 22616

////PushInstruction("local 0")
@LCL // 22617
A=M // 22618
D=M // 22619
@SP // 22620
AM=M+1 // 22621
A=A-1 // 22622
M=D // 22623

////PopInstruction{address=local 1}
@SP // 22624
AM=M-1 // 22625
D=M // 22626
@LCL // 22627
A=M+1 // 22628
M=D // 22629

////PushInstruction("local 0")
@LCL // 22630
A=M // 22631
D=M // 22632
@SP // 22633
AM=M+1 // 22634
A=A-1 // 22635
M=D // 22636

////PushInstruction("constant 3")
@3 // 22637
D=A // 22638
@SP // 22639
AM=M+1 // 22640
A=A-1 // 22641
M=D // 22642

////ArithmeticInstruction{ADD}
@SP // 22643
AM=M-1 // 22644
D=M // 22645
A=A-1 // 22646
M=D+M // 22647

////PopInstruction{address=pointer 1}
@SP // 22648
AM=M-1 // 22649
D=M // 22650
@4 // 22651
M=D // 22652

////PushInstruction("that 0")
@THAT // 22653
A=M // 22654
D=M // 22655
@SP // 22656
AM=M+1 // 22657
A=A-1 // 22658
M=D // 22659

////PopInstruction{address=local 0}
@SP // 22660
AM=M-1 // 22661
D=M // 22662
@LCL // 22663
A=M // 22664
M=D // 22665

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 22666
0;JMP // 22667

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////PushInstruction("local 1")
@LCL // 22668
A=M+1 // 22669
D=M // 22670
@SP // 22671
AM=M+1 // 22672
A=A-1 // 22673
M=D // 22674

////ArithmeticInstruction{NOT}
@SP // 22675
A=M-1 // 22676
M=!M // 22677

////PushInstruction("constant 0")
@SP // 22678
AM=M+1 // 22679
A=A-1 // 22680
M=0 // 22681

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq45 // 22682
D=A // 22683
@13 // 22684
M=D // 22685
@SP // 22686
AM=M-1 // 22687
D=M // 22688
A=A-1 // 22689
D=M-D // 22690
@DO_EQ // 22691
0;JMP // 22692
(COMPARE_Memory.add_node_eq45)
@SP // 22693
AM=M+1 // 22694
A=A-1 // 22695
M=D // 22696

////IfGotoInstruction{label='Memory.add_node.IfElse2}
// if-goto Memory.add_node.IfElse2
@SP // 22697
AM=M-1 // 22698
D=M // 22699
@Memory.add_node.IfElse2 // 22700
D;JNE // 22701

////PushInstruction("argument 0")
@ARG // 22702
A=M // 22703
D=M // 22704
@SP // 22705
AM=M+1 // 22706
A=A-1 // 22707
M=D // 22708

////PushInstruction("constant 0")
@SP // 22709
AM=M+1 // 22710
A=A-1 // 22711
M=0 // 22712

////ArithmeticInstruction{ADD}
@SP // 22713
AM=M-1 // 22714
D=M // 22715
A=A-1 // 22716
M=D+M // 22717

////PopInstruction{address=pointer 1}
@SP // 22718
AM=M-1 // 22719
D=M // 22720
@4 // 22721
M=D // 22722

////PushInstruction("that 0")
@THAT // 22723
A=M // 22724
D=M // 22725
@SP // 22726
AM=M+1 // 22727
A=A-1 // 22728
M=D // 22729

////PushInstruction("argument 1")
@ARG // 22730
A=M+1 // 22731
D=M // 22732
@SP // 22733
AM=M+1 // 22734
A=A-1 // 22735
M=D // 22736

////PushInstruction("constant 3")
@3 // 22737
D=A // 22738
@SP // 22739
AM=M+1 // 22740
A=A-1 // 22741
M=D // 22742

////ArithmeticInstruction{ADD}
@SP // 22743
AM=M-1 // 22744
D=M // 22745
A=A-1 // 22746
M=D+M // 22747

////PopInstruction{address=pointer 1}
@SP // 22748
AM=M-1 // 22749
D=M // 22750
@4 // 22751
M=D // 22752

////PopInstruction{address=that 0}
@SP // 22753
AM=M-1 // 22754
D=M // 22755
@THAT // 22756
A=M // 22757
M=D // 22758

////PushInstruction("argument 1")
@ARG // 22759
A=M+1 // 22760
D=M // 22761
@SP // 22762
AM=M+1 // 22763
A=A-1 // 22764
M=D // 22765

////PushInstruction("argument 0")
@ARG // 22766
A=M // 22767
D=M // 22768
@SP // 22769
AM=M+1 // 22770
A=A-1 // 22771
M=D // 22772

////PushInstruction("constant 0")
@SP // 22773
AM=M+1 // 22774
A=A-1 // 22775
M=0 // 22776

////ArithmeticInstruction{ADD}
@SP // 22777
AM=M-1 // 22778
D=M // 22779
A=A-1 // 22780
M=D+M // 22781

////PushInstruction("constant 2")
@2 // 22782
D=A // 22783
@SP // 22784
AM=M+1 // 22785
A=A-1 // 22786
M=D // 22787

////ArithmeticInstruction{ADD}
@SP // 22788
AM=M-1 // 22789
D=M // 22790
A=A-1 // 22791
M=D+M // 22792

////PopInstruction{address=pointer 1}
@SP // 22793
AM=M-1 // 22794
D=M // 22795
@4 // 22796
M=D // 22797

////PopInstruction{address=that 0}
@SP // 22798
AM=M-1 // 22799
D=M // 22800
@THAT // 22801
A=M // 22802
M=D // 22803

////PushInstruction("argument 1")
@ARG // 22804
A=M+1 // 22805
D=M // 22806
@SP // 22807
AM=M+1 // 22808
A=A-1 // 22809
M=D // 22810

////PushInstruction("argument 0")
@ARG // 22811
A=M // 22812
D=M // 22813
@SP // 22814
AM=M+1 // 22815
A=A-1 // 22816
M=D // 22817

////PushInstruction("constant 0")
@SP // 22818
AM=M+1 // 22819
A=A-1 // 22820
M=0 // 22821

////ArithmeticInstruction{ADD}
@SP // 22822
AM=M-1 // 22823
D=M // 22824
A=A-1 // 22825
M=D+M // 22826

////PopInstruction{address=pointer 1}
@SP // 22827
AM=M-1 // 22828
D=M // 22829
@4 // 22830
M=D // 22831

////PopInstruction{address=that 0}
@SP // 22832
AM=M-1 // 22833
D=M // 22834
@THAT // 22835
A=M // 22836
M=D // 22837

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 22838
0;JMP // 22839

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushInstruction("local 0")
@LCL // 22840
A=M // 22841
D=M // 22842
@SP // 22843
AM=M+1 // 22844
A=A-1 // 22845
M=D // 22846

////PushInstruction("argument 1")
@ARG // 22847
A=M+1 // 22848
D=M // 22849
@SP // 22850
AM=M+1 // 22851
A=A-1 // 22852
M=D // 22853

////PushInstruction("constant 3")
@3 // 22854
D=A // 22855
@SP // 22856
AM=M+1 // 22857
A=A-1 // 22858
M=D // 22859

////ArithmeticInstruction{ADD}
@SP // 22860
AM=M-1 // 22861
D=M // 22862
A=A-1 // 22863
M=D+M // 22864

////PopInstruction{address=pointer 1}
@SP // 22865
AM=M-1 // 22866
D=M // 22867
@4 // 22868
M=D // 22869

////PopInstruction{address=that 0}
@SP // 22870
AM=M-1 // 22871
D=M // 22872
@THAT // 22873
A=M // 22874
M=D // 22875

////PushInstruction("local 1")
@LCL // 22876
A=M+1 // 22877
D=M // 22878
@SP // 22879
AM=M+1 // 22880
A=A-1 // 22881
M=D // 22882

////PushInstruction("argument 1")
@ARG // 22883
A=M+1 // 22884
D=M // 22885
@SP // 22886
AM=M+1 // 22887
A=A-1 // 22888
M=D // 22889

////PushInstruction("constant 2")
@2 // 22890
D=A // 22891
@SP // 22892
AM=M+1 // 22893
A=A-1 // 22894
M=D // 22895

////ArithmeticInstruction{ADD}
@SP // 22896
AM=M-1 // 22897
D=M // 22898
A=A-1 // 22899
M=D+M // 22900

////PopInstruction{address=pointer 1}
@SP // 22901
AM=M-1 // 22902
D=M // 22903
@4 // 22904
M=D // 22905

////PopInstruction{address=that 0}
@SP // 22906
AM=M-1 // 22907
D=M // 22908
@THAT // 22909
A=M // 22910
M=D // 22911

////PushInstruction("local 0")
@LCL // 22912
A=M // 22913
D=M // 22914
@SP // 22915
AM=M+1 // 22916
A=A-1 // 22917
M=D // 22918

////PushInstruction("constant 0")
@SP // 22919
AM=M+1 // 22920
A=A-1 // 22921
M=0 // 22922

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq46 // 22923
D=A // 22924
@13 // 22925
M=D // 22926
@SP // 22927
AM=M-1 // 22928
D=M // 22929
A=A-1 // 22930
D=M-D // 22931
@DO_EQ // 22932
0;JMP // 22933
(COMPARE_Memory.add_node_eq46)
@SP // 22934
AM=M+1 // 22935
A=A-1 // 22936
M=D // 22937

////IfGotoInstruction{label='Memory.add_node.IfElse3}
// if-goto Memory.add_node.IfElse3
@SP // 22938
AM=M-1 // 22939
D=M // 22940
@Memory.add_node.IfElse3 // 22941
D;JNE // 22942

////PushInstruction("argument 1")
@ARG // 22943
A=M+1 // 22944
D=M // 22945
@SP // 22946
AM=M+1 // 22947
A=A-1 // 22948
M=D // 22949

////PushInstruction("local 0")
@LCL // 22950
A=M // 22951
D=M // 22952
@SP // 22953
AM=M+1 // 22954
A=A-1 // 22955
M=D // 22956

////PushInstruction("constant 2")
@2 // 22957
D=A // 22958
@SP // 22959
AM=M+1 // 22960
A=A-1 // 22961
M=D // 22962

////ArithmeticInstruction{ADD}
@SP // 22963
AM=M-1 // 22964
D=M // 22965
A=A-1 // 22966
M=D+M // 22967

////PopInstruction{address=pointer 1}
@SP // 22968
AM=M-1 // 22969
D=M // 22970
@4 // 22971
M=D // 22972

////PopInstruction{address=that 0}
@SP // 22973
AM=M-1 // 22974
D=M // 22975
@THAT // 22976
A=M // 22977
M=D // 22978

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 22979
0;JMP // 22980

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 22981
A=M+1 // 22982
D=M // 22983
@SP // 22984
AM=M+1 // 22985
A=A-1 // 22986
M=D // 22987

////PushInstruction("local 1")
@LCL // 22988
A=M+1 // 22989
D=M // 22990
@SP // 22991
AM=M+1 // 22992
A=A-1 // 22993
M=D // 22994

////PushInstruction("constant 3")
@3 // 22995
D=A // 22996
@SP // 22997
AM=M+1 // 22998
A=A-1 // 22999
M=D // 23000

////ArithmeticInstruction{ADD}
@SP // 23001
AM=M-1 // 23002
D=M // 23003
A=A-1 // 23004
M=D+M // 23005

////PopInstruction{address=pointer 1}
@SP // 23006
AM=M-1 // 23007
D=M // 23008
@4 // 23009
M=D // 23010

////PopInstruction{address=that 0}
@SP // 23011
AM=M-1 // 23012
D=M // 23013
@THAT // 23014
A=M // 23015
M=D // 23016

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 23017
AM=M+1 // 23018
A=A-1 // 23019
M=0 // 23020

////ReturnInstruction{}
@RETURN // 23021
0;JMP // 23022

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushInstruction("argument 1")
@ARG // 23023
A=M+1 // 23024
D=M // 23025
@SP // 23026
AM=M+1 // 23027
A=A-1 // 23028
M=D // 23029

////PushInstruction("argument 0")
@ARG // 23030
A=M // 23031
D=M // 23032
@SP // 23033
AM=M+1 // 23034
A=A-1 // 23035
M=D // 23036

////PushInstruction("constant 0")
@SP // 23037
AM=M+1 // 23038
A=A-1 // 23039
M=0 // 23040

////ArithmeticInstruction{ADD}
@SP // 23041
AM=M-1 // 23042
D=M // 23043
A=A-1 // 23044
M=D+M // 23045

////PopInstruction{address=pointer 1}
@SP // 23046
AM=M-1 // 23047
D=M // 23048
@4 // 23049
M=D // 23050

////PopInstruction{address=that 0}
@SP // 23051
AM=M-1 // 23052
D=M // 23053
@THAT // 23054
A=M // 23055
M=D // 23056

////PushInstruction("constant 0")
@SP // 23057
AM=M+1 // 23058
A=A-1 // 23059
M=0 // 23060

////ReturnInstruction{}
@RETURN // 23061
0;JMP // 23062

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////PushInstruction("argument 0")
@ARG // 23063
A=M // 23064
D=M // 23065
@SP // 23066
AM=M+1 // 23067
A=A-1 // 23068
M=D // 23069

////PushInstruction("constant 0")
@SP // 23070
AM=M+1 // 23071
A=A-1 // 23072
M=0 // 23073

////ArithmeticInstruction{ADD}
@SP // 23074
AM=M-1 // 23075
D=M // 23076
A=A-1 // 23077
M=D+M // 23078

////PopInstruction{address=pointer 1}
@SP // 23079
AM=M-1 // 23080
D=M // 23081
@4 // 23082
M=D // 23083

////PushInstruction("that 0")
@THAT // 23084
A=M // 23085
D=M // 23086
@SP // 23087
AM=M+1 // 23088
A=A-1 // 23089
M=D // 23090

////ReturnInstruction{}
@RETURN // 23091
0;JMP // 23092

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}
// call Memory.init
@5 // 23093
D=A // 23094
@14 // 23095
M=D // 23096
@Memory.init // 23097
D=A // 23098
@13 // 23099
M=D // 23100
@Sys.init.ret.0 // 23101
D=A // 23102
@CALL // 23103
0;JMP // 23104
(Sys.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 23105
AM=M-1 // 23106
D=M // 23107
@5 // 23108
M=D // 23109

////CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=1}, currentFunction='Sys.init'}
// call Math.init
@5 // 23110
D=A // 23111
@14 // 23112
M=D // 23113
@Math.init // 23114
D=A // 23115
@13 // 23116
M=D // 23117
@Sys.init.ret.1 // 23118
D=A // 23119
@CALL // 23120
0;JMP // 23121
(Sys.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 23122
AM=M-1 // 23123
D=M // 23124
@5 // 23125
M=D // 23126

////CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=2}, currentFunction='Sys.init'}
// call Screen.init
@5 // 23127
D=A // 23128
@14 // 23129
M=D // 23130
@Screen.init // 23131
D=A // 23132
@13 // 23133
M=D // 23134
@Sys.init.ret.2 // 23135
D=A // 23136
@CALL // 23137
0;JMP // 23138
(Sys.init.ret.2)

////PopInstruction{address=temp 0}
@SP // 23139
AM=M-1 // 23140
D=M // 23141
@5 // 23142
M=D // 23143

////CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=3}, currentFunction='Sys.init'}
// call Output.init
@5 // 23144
D=A // 23145
@14 // 23146
M=D // 23147
@Output.init // 23148
D=A // 23149
@13 // 23150
M=D // 23151
@Sys.init.ret.3 // 23152
D=A // 23153
@CALL // 23154
0;JMP // 23155
(Sys.init.ret.3)

////PopInstruction{address=temp 0}
@SP // 23156
AM=M-1 // 23157
D=M // 23158
@5 // 23159
M=D // 23160

////CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=4}, currentFunction='Sys.init'}
// call Keyboard.init
@5 // 23161
D=A // 23162
@14 // 23163
M=D // 23164
@Keyboard.init // 23165
D=A // 23166
@13 // 23167
M=D // 23168
@Sys.init.ret.4 // 23169
D=A // 23170
@CALL // 23171
0;JMP // 23172
(Sys.init.ret.4)

////PopInstruction{address=temp 0}
@SP // 23173
AM=M-1 // 23174
D=M // 23175
@5 // 23176
M=D // 23177

////CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=5}, currentFunction='Sys.init'}
// call Main.main
@5 // 23178
D=A // 23179
@14 // 23180
M=D // 23181
@Main.main // 23182
D=A // 23183
@13 // 23184
M=D // 23185
@Sys.init.ret.5 // 23186
D=A // 23187
@CALL // 23188
0;JMP // 23189
(Sys.init.ret.5)

////PopInstruction{address=temp 0}
@SP // 23190
AM=M-1 // 23191
D=M // 23192
@5 // 23193
M=D // 23194

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=6}, currentFunction='Sys.init'}
// call Sys.halt
@5 // 23195
D=A // 23196
@14 // 23197
M=D // 23198
@Sys.halt // 23199
D=A // 23200
@13 // 23201
M=D // 23202
@Sys.init.ret.6 // 23203
D=A // 23204
@CALL // 23205
0;JMP // 23206
(Sys.init.ret.6)

////PopInstruction{address=temp 0}
@SP // 23207
AM=M-1 // 23208
D=M // 23209
@5 // 23210
M=D // 23211

////PushInstruction("constant 0")
@SP // 23212
AM=M+1 // 23213
A=A-1 // 23214
M=0 // 23215

////ReturnInstruction{}
@RETURN // 23216
0;JMP // 23217

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23218
AM=M+1 // 23219
A=A-1 // 23220
M=0 // 23221

////ArithmeticInstruction{NOT}
@SP // 23222
A=M-1 // 23223
M=!M // 23224

////PushInstruction("constant 0")
@SP // 23225
AM=M+1 // 23226
A=A-1 // 23227
M=0 // 23228

////ArithmeticInstruction{EQ}
@COMPARE_Sys.halt_eq0 // 23229
D=A // 23230
@13 // 23231
M=D // 23232
@SP // 23233
AM=M-1 // 23234
D=M // 23235
A=A-1 // 23236
D=M-D // 23237
@DO_EQ // 23238
0;JMP // 23239
(COMPARE_Sys.halt_eq0)
@SP // 23240
AM=M+1 // 23241
A=A-1 // 23242
M=D // 23243

////IfGotoInstruction{label='WHILE_END_Sys.halt1}
// if-goto WHILE_END_Sys.halt1
@SP // 23244
AM=M-1 // 23245
D=M // 23246
@WHILE_END_Sys.halt1 // 23247
D;JNE // 23248

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 23249
0;JMP // 23250

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23251
AM=M+1 // 23252
A=A-1 // 23253
M=0 // 23254

////ReturnInstruction{}
@RETURN // 23255
0;JMP // 23256

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 23257
AM=M+1 // 23258
A=A-1 // 23259
M=0 // 23260

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

////PushInstruction("argument 0")
@ARG // 23261
A=M // 23262
D=M // 23263
@SP // 23264
AM=M+1 // 23265
A=A-1 // 23266
M=D // 23267

////PushInstruction("constant 0")
@SP // 23268
AM=M+1 // 23269
A=A-1 // 23270
M=0 // 23271

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt1 // 23272
D=A // 23273
@13 // 23274
M=D // 23275
@SP // 23276
AM=M-1 // 23277
D=M // 23278
A=A-1 // 23279
D=M-D // 23280
@DO_GT // 23281
0;JMP // 23282
(COMPARE_Sys.wait_gt1)
@SP // 23283
AM=M+1 // 23284
A=A-1 // 23285
M=D // 23286

////PushInstruction("constant 0")
@SP // 23287
AM=M+1 // 23288
A=A-1 // 23289
M=0 // 23290

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq2 // 23291
D=A // 23292
@13 // 23293
M=D // 23294
@SP // 23295
AM=M-1 // 23296
D=M // 23297
A=A-1 // 23298
D=M-D // 23299
@DO_EQ // 23300
0;JMP // 23301
(COMPARE_Sys.wait_eq2)
@SP // 23302
AM=M+1 // 23303
A=A-1 // 23304
M=D // 23305

////IfGotoInstruction{label='WHILE_END_Sys.wait1}
// if-goto WHILE_END_Sys.wait1
@SP // 23306
AM=M-1 // 23307
D=M // 23308
@WHILE_END_Sys.wait1 // 23309
D;JNE // 23310

////PushInstruction("argument 0")
@ARG // 23311
A=M // 23312
D=M // 23313
@SP // 23314
AM=M+1 // 23315
A=A-1 // 23316
M=D // 23317

////PushInstruction("constant 1")
@SP // 23318
AM=M+1 // 23319
A=A-1 // 23320
M=1 // 23321

////ArithmeticInstruction{SUB}
@SP // 23322
AM=M-1 // 23323
D=M // 23324
A=A-1 // 23325
M=M-D // 23326

////PopInstruction{address=argument 0}
@SP // 23327
AM=M-1 // 23328
D=M // 23329
@ARG // 23330
A=M // 23331
M=D // 23332

////PushInstruction("constant 70")
@70 // 23333
D=A // 23334
@SP // 23335
AM=M+1 // 23336
A=A-1 // 23337
M=D // 23338

////PopInstruction{address=local 0}
@SP // 23339
AM=M-1 // 23340
D=M // 23341
@LCL // 23342
A=M // 23343
M=D // 23344

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////PushInstruction("local 0")
@LCL // 23345
A=M // 23346
D=M // 23347
@SP // 23348
AM=M+1 // 23349
A=A-1 // 23350
M=D // 23351

////PushInstruction("constant 0")
@SP // 23352
AM=M+1 // 23353
A=A-1 // 23354
M=0 // 23355

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt3 // 23356
D=A // 23357
@13 // 23358
M=D // 23359
@SP // 23360
AM=M-1 // 23361
D=M // 23362
A=A-1 // 23363
D=M-D // 23364
@DO_GT // 23365
0;JMP // 23366
(COMPARE_Sys.wait_gt3)
@SP // 23367
AM=M+1 // 23368
A=A-1 // 23369
M=D // 23370

////PushInstruction("constant 0")
@SP // 23371
AM=M+1 // 23372
A=A-1 // 23373
M=0 // 23374

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq4 // 23375
D=A // 23376
@13 // 23377
M=D // 23378
@SP // 23379
AM=M-1 // 23380
D=M // 23381
A=A-1 // 23382
D=M-D // 23383
@DO_EQ // 23384
0;JMP // 23385
(COMPARE_Sys.wait_eq4)
@SP // 23386
AM=M+1 // 23387
A=A-1 // 23388
M=D // 23389

////IfGotoInstruction{label='WHILE_END_Sys.wait2}
// if-goto WHILE_END_Sys.wait2
@SP // 23390
AM=M-1 // 23391
D=M // 23392
@WHILE_END_Sys.wait2 // 23393
D;JNE // 23394

////PushInstruction("local 0")
@LCL // 23395
A=M // 23396
D=M // 23397
@SP // 23398
AM=M+1 // 23399
A=A-1 // 23400
M=D // 23401

////PushInstruction("constant 1")
@SP // 23402
AM=M+1 // 23403
A=A-1 // 23404
M=1 // 23405

////ArithmeticInstruction{SUB}
@SP // 23406
AM=M-1 // 23407
D=M // 23408
A=A-1 // 23409
M=M-D // 23410

////PopInstruction{address=local 0}
@SP // 23411
AM=M-1 // 23412
D=M // 23413
@LCL // 23414
A=M // 23415
M=D // 23416

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 23417
0;JMP // 23418

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 23419
0;JMP // 23420

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 23421
AM=M+1 // 23422
A=A-1 // 23423
M=0 // 23424

////ReturnInstruction{}
@RETURN // 23425
0;JMP // 23426

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushInstruction("argument 0")
@ARG // 23427
A=M // 23428
D=M // 23429
@SP // 23430
AM=M+1 // 23431
A=A-1 // 23432
M=D // 23433

////CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.printInt
@6 // 23434
D=A // 23435
@14 // 23436
M=D // 23437
@Output.printInt // 23438
D=A // 23439
@13 // 23440
M=D // 23441
@Sys.error.ret.0 // 23442
D=A // 23443
@CALL // 23444
0;JMP // 23445
(Sys.error.ret.0)

////PopInstruction{address=temp 0}
@SP // 23446
AM=M-1 // 23447
D=M // 23448
@5 // 23449
M=D // 23450

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.wait=0, Sys.error=1, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.println
@5 // 23451
D=A // 23452
@14 // 23453
M=D // 23454
@Output.println // 23455
D=A // 23456
@13 // 23457
M=D // 23458
@Sys.error.ret.1 // 23459
D=A // 23460
@CALL // 23461
0;JMP // 23462
(Sys.error.ret.1)

////PopInstruction{address=temp 0}
@SP // 23463
AM=M-1 // 23464
D=M // 23465
@5 // 23466
M=D // 23467

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.wait=0, Sys.error=2, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Sys.halt
@5 // 23468
D=A // 23469
@14 // 23470
M=D // 23471
@Sys.halt // 23472
D=A // 23473
@13 // 23474
M=D // 23475
@Sys.error.ret.2 // 23476
D=A // 23477
@CALL // 23478
0;JMP // 23479
(Sys.error.ret.2)

////PopInstruction{address=temp 0}
@SP // 23480
AM=M-1 // 23481
D=M // 23482
@5 // 23483
M=D // 23484

////PushInstruction("constant 0")
@SP // 23485
AM=M+1 // 23486
A=A-1 // 23487
M=0 // 23488

////ReturnInstruction{}
@RETURN // 23489
0;JMP // 23490

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 23491
AM=M+1 // 23492
A=A-1 // 23493
M=0 // 23494

////ReturnInstruction{}
@RETURN // 23495
0;JMP // 23496

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////PushInstruction("constant 24576")
@24576 // 23497
D=A // 23498
@SP // 23499
AM=M+1 // 23500
A=A-1 // 23501
M=D // 23502

////PushInstruction("constant 0")
@SP // 23503
AM=M+1 // 23504
A=A-1 // 23505
M=0 // 23506

////ArithmeticInstruction{ADD}
@SP // 23507
AM=M-1 // 23508
D=M // 23509
A=A-1 // 23510
M=D+M // 23511

////PopInstruction{address=pointer 1}
@SP // 23512
AM=M-1 // 23513
D=M // 23514
@4 // 23515
M=D // 23516

////PushInstruction("that 0")
@THAT // 23517
A=M // 23518
D=M // 23519
@SP // 23520
AM=M+1 // 23521
A=A-1 // 23522
M=D // 23523

////ReturnInstruction{}
@RETURN // 23524
0;JMP // 23525

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 23526
AM=M+1 // 23527
A=A-1 // 23528
M=0 // 23529

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 23530
D=A // 23531
@SP // 23532
AM=M+1 // 23533
A=A-1 // 23534
M=D // 23535

////PushInstruction("constant 0")
@SP // 23536
AM=M+1 // 23537
A=A-1 // 23538
M=0 // 23539

////ArithmeticInstruction{ADD}
@SP // 23540
AM=M-1 // 23541
D=M // 23542
A=A-1 // 23543
M=D+M // 23544

////PopInstruction{address=pointer 1}
@SP // 23545
AM=M-1 // 23546
D=M // 23547
@4 // 23548
M=D // 23549

////PushInstruction("that 0")
@THAT // 23550
A=M // 23551
D=M // 23552
@SP // 23553
AM=M+1 // 23554
A=A-1 // 23555
M=D // 23556

////PushInstruction("constant 0")
@SP // 23557
AM=M+1 // 23558
A=A-1 // 23559
M=0 // 23560

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq0 // 23561
D=A // 23562
@13 // 23563
M=D // 23564
@SP // 23565
AM=M-1 // 23566
D=M // 23567
A=A-1 // 23568
D=M-D // 23569
@DO_EQ // 23570
0;JMP // 23571
(COMPARE_Keyboard.readChar_eq0)
@SP // 23572
AM=M+1 // 23573
A=A-1 // 23574
M=D // 23575

////PushInstruction("constant 0")
@SP // 23576
AM=M+1 // 23577
A=A-1 // 23578
M=0 // 23579

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq1 // 23580
D=A // 23581
@13 // 23582
M=D // 23583
@SP // 23584
AM=M-1 // 23585
D=M // 23586
A=A-1 // 23587
D=M-D // 23588
@DO_EQ // 23589
0;JMP // 23590
(COMPARE_Keyboard.readChar_eq1)
@SP // 23591
AM=M+1 // 23592
A=A-1 // 23593
M=D // 23594

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}
// if-goto WHILE_END_Keyboard.readChar1
@SP // 23595
AM=M-1 // 23596
D=M // 23597
@WHILE_END_Keyboard.readChar1 // 23598
D;JNE // 23599

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 23600
0;JMP // 23601

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 23602
D=A // 23603
@SP // 23604
AM=M+1 // 23605
A=A-1 // 23606
M=D // 23607

////PushInstruction("constant 0")
@SP // 23608
AM=M+1 // 23609
A=A-1 // 23610
M=0 // 23611

////ArithmeticInstruction{ADD}
@SP // 23612
AM=M-1 // 23613
D=M // 23614
A=A-1 // 23615
M=D+M // 23616

////PopInstruction{address=pointer 1}
@SP // 23617
AM=M-1 // 23618
D=M // 23619
@4 // 23620
M=D // 23621

////PushInstruction("that 0")
@THAT // 23622
A=M // 23623
D=M // 23624
@SP // 23625
AM=M+1 // 23626
A=A-1 // 23627
M=D // 23628

////PopInstruction{address=local 0}
@SP // 23629
AM=M-1 // 23630
D=M // 23631
@LCL // 23632
A=M // 23633
M=D // 23634

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////PushInstruction("constant 24576")
@24576 // 23635
D=A // 23636
@SP // 23637
AM=M+1 // 23638
A=A-1 // 23639
M=D // 23640

////PushInstruction("constant 0")
@SP // 23641
AM=M+1 // 23642
A=A-1 // 23643
M=0 // 23644

////ArithmeticInstruction{ADD}
@SP // 23645
AM=M-1 // 23646
D=M // 23647
A=A-1 // 23648
M=D+M // 23649

////PopInstruction{address=pointer 1}
@SP // 23650
AM=M-1 // 23651
D=M // 23652
@4 // 23653
M=D // 23654

////PushInstruction("that 0")
@THAT // 23655
A=M // 23656
D=M // 23657
@SP // 23658
AM=M+1 // 23659
A=A-1 // 23660
M=D // 23661

////PushInstruction("constant 0")
@SP // 23662
AM=M+1 // 23663
A=A-1 // 23664
M=0 // 23665

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq2 // 23666
D=A // 23667
@13 // 23668
M=D // 23669
@SP // 23670
AM=M-1 // 23671
D=M // 23672
A=A-1 // 23673
D=M-D // 23674
@DO_EQ // 23675
0;JMP // 23676
(COMPARE_Keyboard.readChar_eq2)
@SP // 23677
AM=M+1 // 23678
A=A-1 // 23679
M=D // 23680

////ArithmeticInstruction{NOT}
@SP // 23681
A=M-1 // 23682
M=!M // 23683

////PushInstruction("constant 0")
@SP // 23684
AM=M+1 // 23685
A=A-1 // 23686
M=0 // 23687

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq3 // 23688
D=A // 23689
@13 // 23690
M=D // 23691
@SP // 23692
AM=M-1 // 23693
D=M // 23694
A=A-1 // 23695
D=M-D // 23696
@DO_EQ // 23697
0;JMP // 23698
(COMPARE_Keyboard.readChar_eq3)
@SP // 23699
AM=M+1 // 23700
A=A-1 // 23701
M=D // 23702

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}
// if-goto WHILE_END_Keyboard.readChar2
@SP // 23703
AM=M-1 // 23704
D=M // 23705
@WHILE_END_Keyboard.readChar2 // 23706
D;JNE // 23707

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 23708
0;JMP // 23709

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushInstruction("local 0")
@LCL // 23710
A=M // 23711
D=M // 23712
@SP // 23713
AM=M+1 // 23714
A=A-1 // 23715
M=D // 23716

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}
// call Output.printChar
@6 // 23717
D=A // 23718
@14 // 23719
M=D // 23720
@Output.printChar // 23721
D=A // 23722
@13 // 23723
M=D // 23724
@Keyboard.readChar.ret.0 // 23725
D=A // 23726
@CALL // 23727
0;JMP // 23728
(Keyboard.readChar.ret.0)

////PopInstruction{address=temp 0}
@SP // 23729
AM=M-1 // 23730
D=M // 23731
@5 // 23732
M=D // 23733

////PushInstruction("local 0")
@LCL // 23734
A=M // 23735
D=M // 23736
@SP // 23737
AM=M+1 // 23738
A=A-1 // 23739
M=D // 23740

////ReturnInstruction{}
@RETURN // 23741
0;JMP // 23742

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 23743
AM=M+1 // 23744
A=A-1 // 23745
M=0 // 23746
@SP // 23747
AM=M+1 // 23748
A=A-1 // 23749
M=0 // 23750

////PushInstruction("argument 0")
@ARG // 23751
A=M // 23752
D=M // 23753
@SP // 23754
AM=M+1 // 23755
A=A-1 // 23756
M=D // 23757

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}
// call Output.printString
@6 // 23758
D=A // 23759
@14 // 23760
M=D // 23761
@Output.printString // 23762
D=A // 23763
@13 // 23764
M=D // 23765
@Keyboard.readLine.ret.0 // 23766
D=A // 23767
@CALL // 23768
0;JMP // 23769
(Keyboard.readLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 23770
AM=M-1 // 23771
D=M // 23772
@5 // 23773
M=D // 23774

////PushInstruction("constant 50")
@50 // 23775
D=A // 23776
@SP // 23777
AM=M+1 // 23778
A=A-1 // 23779
M=D // 23780

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=1}, currentFunction='Keyboard.readLine'}
// call String.new
@6 // 23781
D=A // 23782
@14 // 23783
M=D // 23784
@String.new // 23785
D=A // 23786
@13 // 23787
M=D // 23788
@Keyboard.readLine.ret.1 // 23789
D=A // 23790
@CALL // 23791
0;JMP // 23792
(Keyboard.readLine.ret.1)

////PopInstruction{address=local 0}
@SP // 23793
AM=M-1 // 23794
D=M // 23795
@LCL // 23796
A=M // 23797
M=D // 23798

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=2}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 23799
D=A // 23800
@14 // 23801
M=D // 23802
@Keyboard.readChar // 23803
D=A // 23804
@13 // 23805
M=D // 23806
@Keyboard.readLine.ret.2 // 23807
D=A // 23808
@CALL // 23809
0;JMP // 23810
(Keyboard.readLine.ret.2)

////PopInstruction{address=local 1}
@SP // 23811
AM=M-1 // 23812
D=M // 23813
@LCL // 23814
A=M+1 // 23815
M=D // 23816

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////PushInstruction("local 1")
@LCL // 23817
A=M+1 // 23818
D=M // 23819
@SP // 23820
AM=M+1 // 23821
A=A-1 // 23822
M=D // 23823

////CallInstruction{calleeFunction='String.newLine', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=3}, currentFunction='Keyboard.readLine'}
// call String.newLine
@5 // 23824
D=A // 23825
@14 // 23826
M=D // 23827
@String.newLine // 23828
D=A // 23829
@13 // 23830
M=D // 23831
@Keyboard.readLine.ret.3 // 23832
D=A // 23833
@CALL // 23834
0;JMP // 23835
(Keyboard.readLine.ret.3)

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq4 // 23836
D=A // 23837
@13 // 23838
M=D // 23839
@SP // 23840
AM=M-1 // 23841
D=M // 23842
A=A-1 // 23843
D=M-D // 23844
@DO_EQ // 23845
0;JMP // 23846
(COMPARE_Keyboard.readLine_eq4)
@SP // 23847
AM=M+1 // 23848
A=A-1 // 23849
M=D // 23850

////ArithmeticInstruction{NOT}
@SP // 23851
A=M-1 // 23852
M=!M // 23853

////PushInstruction("constant 0")
@SP // 23854
AM=M+1 // 23855
A=A-1 // 23856
M=0 // 23857

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq5 // 23858
D=A // 23859
@13 // 23860
M=D // 23861
@SP // 23862
AM=M-1 // 23863
D=M // 23864
A=A-1 // 23865
D=M-D // 23866
@DO_EQ // 23867
0;JMP // 23868
(COMPARE_Keyboard.readLine_eq5)
@SP // 23869
AM=M+1 // 23870
A=A-1 // 23871
M=D // 23872

////IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}
// if-goto WHILE_END_Keyboard.readLine1
@SP // 23873
AM=M-1 // 23874
D=M // 23875
@WHILE_END_Keyboard.readLine1 // 23876
D;JNE // 23877

////PushInstruction("local 1")
@LCL // 23878
A=M+1 // 23879
D=M // 23880
@SP // 23881
AM=M+1 // 23882
A=A-1 // 23883
M=D // 23884

////PushInstruction("constant 129")
@129 // 23885
D=A // 23886
@SP // 23887
AM=M+1 // 23888
A=A-1 // 23889
M=D // 23890

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq6 // 23891
D=A // 23892
@13 // 23893
M=D // 23894
@SP // 23895
AM=M-1 // 23896
D=M // 23897
A=A-1 // 23898
D=M-D // 23899
@DO_EQ // 23900
0;JMP // 23901
(COMPARE_Keyboard.readLine_eq6)
@SP // 23902
AM=M+1 // 23903
A=A-1 // 23904
M=D // 23905

////PushInstruction("constant 0")
@SP // 23906
AM=M+1 // 23907
A=A-1 // 23908
M=0 // 23909

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq7 // 23910
D=A // 23911
@13 // 23912
M=D // 23913
@SP // 23914
AM=M-1 // 23915
D=M // 23916
A=A-1 // 23917
D=M-D // 23918
@DO_EQ // 23919
0;JMP // 23920
(COMPARE_Keyboard.readLine_eq7)
@SP // 23921
AM=M+1 // 23922
A=A-1 // 23923
M=D // 23924

////IfGotoInstruction{label='Keyboard.readLine.IfElse1}
// if-goto Keyboard.readLine.IfElse1
@SP // 23925
AM=M-1 // 23926
D=M // 23927
@Keyboard.readLine.IfElse1 // 23928
D;JNE // 23929

////PushInstruction("local 0")
@LCL // 23930
A=M // 23931
D=M // 23932
@SP // 23933
AM=M+1 // 23934
A=A-1 // 23935
M=D // 23936

////CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=4}, currentFunction='Keyboard.readLine'}
// call String.eraseLastChar
@6 // 23937
D=A // 23938
@14 // 23939
M=D // 23940
@String.eraseLastChar // 23941
D=A // 23942
@13 // 23943
M=D // 23944
@Keyboard.readLine.ret.4 // 23945
D=A // 23946
@CALL // 23947
0;JMP // 23948
(Keyboard.readLine.ret.4)

////PopInstruction{address=temp 0}
@SP // 23949
AM=M-1 // 23950
D=M // 23951
@5 // 23952
M=D // 23953

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 23954
0;JMP // 23955

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushInstruction("local 0")
@LCL // 23956
A=M // 23957
D=M // 23958
@SP // 23959
AM=M+1 // 23960
A=A-1 // 23961
M=D // 23962

////PushInstruction("local 1")
@LCL // 23963
A=M+1 // 23964
D=M // 23965
@SP // 23966
AM=M+1 // 23967
A=A-1 // 23968
M=D // 23969

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}
// call String.appendChar
@7 // 23970
D=A // 23971
@14 // 23972
M=D // 23973
@String.appendChar // 23974
D=A // 23975
@13 // 23976
M=D // 23977
@Keyboard.readLine.ret.5 // 23978
D=A // 23979
@CALL // 23980
0;JMP // 23981
(Keyboard.readLine.ret.5)

////PopInstruction{address=temp 0}
@SP // 23982
AM=M-1 // 23983
D=M // 23984
@5 // 23985
M=D // 23986

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 23987
D=A // 23988
@14 // 23989
M=D // 23990
@Keyboard.readChar // 23991
D=A // 23992
@13 // 23993
M=D // 23994
@Keyboard.readLine.ret.6 // 23995
D=A // 23996
@CALL // 23997
0;JMP // 23998
(Keyboard.readLine.ret.6)

////PopInstruction{address=local 1}
@SP // 23999
AM=M-1 // 24000
D=M // 24001
@LCL // 24002
A=M+1 // 24003
M=D // 24004

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 24005
0;JMP // 24006

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 24007
A=M // 24008
D=M // 24009
@SP // 24010
AM=M+1 // 24011
A=A-1 // 24012
M=D // 24013

////ReturnInstruction{}
@RETURN // 24014
0;JMP // 24015

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 24016
AM=M+1 // 24017
A=A-1 // 24018
M=0 // 24019

////PushInstruction("argument 0")
@ARG // 24020
A=M // 24021
D=M // 24022
@SP // 24023
AM=M+1 // 24024
A=A-1 // 24025
M=D // 24026

////CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=0, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call Keyboard.readLine
@6 // 24027
D=A // 24028
@14 // 24029
M=D // 24030
@Keyboard.readLine // 24031
D=A // 24032
@13 // 24033
M=D // 24034
@Keyboard.readInt.ret.0 // 24035
D=A // 24036
@CALL // 24037
0;JMP // 24038
(Keyboard.readInt.ret.0)

////PopInstruction{address=local 0}
@SP // 24039
AM=M-1 // 24040
D=M // 24041
@LCL // 24042
A=M // 24043
M=D // 24044

////PushInstruction("local 0")
@LCL // 24045
A=M // 24046
D=M // 24047
@SP // 24048
AM=M+1 // 24049
A=A-1 // 24050
M=D // 24051

////CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call String.intValue
@6 // 24052
D=A // 24053
@14 // 24054
M=D // 24055
@String.intValue // 24056
D=A // 24057
@13 // 24058
M=D // 24059
@Keyboard.readInt.ret.1 // 24060
D=A // 24061
@CALL // 24062
0;JMP // 24063
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 24064
0;JMP // 24065

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////PushInstruction("argument 0")
@ARG // 24066
A=M // 24067
D=M // 24068
@SP // 24069
AM=M+1 // 24070
A=A-1 // 24071
M=D // 24072

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}
// call Memory.alloc
@6 // 24073
D=A // 24074
@14 // 24075
M=D // 24076
@Memory.alloc // 24077
D=A // 24078
@13 // 24079
M=D // 24080
@Array.new.ret.0 // 24081
D=A // 24082
@CALL // 24083
0;JMP // 24084
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 24085
0;JMP // 24086

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

////PushInstruction("argument 0")
@ARG // 24087
A=M // 24088
D=M // 24089
@SP // 24090
AM=M+1 // 24091
A=A-1 // 24092
M=D // 24093

////PopInstruction{address=pointer 0}
@SP // 24094
AM=M-1 // 24095
D=M // 24096
@3 // 24097
M=D // 24098

////PushInstruction("pointer 0")
@3 // 24099
D=M // 24100
@SP // 24101
AM=M+1 // 24102
A=A-1 // 24103
M=D // 24104

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0, Array.new=1}, currentFunction='Array.dispose'}
// call Memory.deAlloc
@6 // 24105
D=A // 24106
@14 // 24107
M=D // 24108
@Memory.deAlloc // 24109
D=A // 24110
@13 // 24111
M=D // 24112
@Array.dispose.ret.0 // 24113
D=A // 24114
@CALL // 24115
0;JMP // 24116
(Array.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 24117
AM=M-1 // 24118
D=M // 24119
@5 // 24120
M=D // 24121

////PushInstruction("constant 0")
@SP // 24122
AM=M+1 // 24123
A=A-1 // 24124
M=0 // 24125

////ReturnInstruction{}
@RETURN // 24126
0;JMP // 24127

