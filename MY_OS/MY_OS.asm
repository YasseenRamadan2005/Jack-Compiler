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
////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={}}
// function Array.new with 0
(Array.new)

////PushInstruction("argument 0")
@ARG // 130
A=M // 131
D=M // 132
@SP // 133
AM=M+1 // 134
A=A-1 // 135
M=D // 136

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Array.new=0}, currentFunction='Array.new'}
// call Memory.alloc
@6 // 137
D=A // 138
@14 // 139
M=D // 140
@Memory.alloc // 141
D=A // 142
@13 // 143
M=D // 144
@Array.new.ret.0 // 145
D=A // 146
@CALL // 147
0;JMP // 148
(Array.new.ret.0)

////ReturnInstruction{}
@RETURN // 149
0;JMP // 150

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={Array.new=1}}
// function Array.dispose with 0
(Array.dispose)

////PushInstruction("argument 0")
@ARG // 151
A=M // 152
D=M // 153
@SP // 154
AM=M+1 // 155
A=A-1 // 156
M=D // 157

////PopInstruction{address=pointer 0}
@SP // 158
AM=M-1 // 159
D=M // 160
@3 // 161
M=D // 162

////PushInstruction("pointer 0")
@3 // 163
D=M // 164
@SP // 165
AM=M+1 // 166
A=A-1 // 167
M=D // 168

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Array.dispose=0, Array.new=1}, currentFunction='Array.dispose'}
// call Memory.deAlloc
@6 // 169
D=A // 170
@14 // 171
M=D // 172
@Memory.deAlloc // 173
D=A // 174
@13 // 175
M=D // 176
@Array.dispose.ret.0 // 177
D=A // 178
@CALL // 179
0;JMP // 180
(Array.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 181
AM=M-1 // 182
D=M // 183
@5 // 184
M=D // 185

////PushInstruction("constant 0")
@SP // 186
AM=M+1 // 187
A=A-1 // 188
M=0 // 189

////ReturnInstruction{}
@RETURN // 190
0;JMP // 191

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 192
AM=M+1 // 193
A=A-1 // 194
M=0 // 195

////ReturnInstruction{}
@RETURN // 196
0;JMP // 197

////FunctionInstruction{functionName='Keyboard.keyPressed', numLocals=0, funcMapping={Keyboard.init=0}}
// function Keyboard.keyPressed with 0
(Keyboard.keyPressed)

////PushInstruction("constant 24576")
@24576 // 198
D=A // 199
@SP // 200
AM=M+1 // 201
A=A-1 // 202
M=D // 203

////PushInstruction("constant 0")
@SP // 204
AM=M+1 // 205
A=A-1 // 206
M=0 // 207

////ArithmeticInstruction{ADD}
@SP // 208
AM=M-1 // 209
D=M // 210
A=A-1 // 211
D=D+M // 212

////PopInstruction{address=pointer 1}
@SP // 213
AM=M-1 // 214
D=M // 215
@4 // 216
M=D // 217

////PushInstruction("that 0")
@THAT // 218
A=M // 219
D=M // 220
@SP // 221
AM=M+1 // 222
A=A-1 // 223
M=D // 224

////ReturnInstruction{}
@RETURN // 225
0;JMP // 226

////FunctionInstruction{functionName='Keyboard.readChar', numLocals=1, funcMapping={Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readChar with 1
(Keyboard.readChar)
@SP // 227
AM=M+1 // 228
A=A-1 // 229
M=0 // 230

////LabelInstruction{label='WHILE_START_Keyboard.readChar1}
// label WHILE_START_Keyboard.readChar1
(WHILE_START_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 231
D=A // 232
@SP // 233
AM=M+1 // 234
A=A-1 // 235
M=D // 236

////PushInstruction("constant 0")
@SP // 237
AM=M+1 // 238
A=A-1 // 239
M=0 // 240

////ArithmeticInstruction{ADD}
@SP // 241
AM=M-1 // 242
D=M // 243
A=A-1 // 244
D=D+M // 245

////PopInstruction{address=pointer 1}
@SP // 246
AM=M-1 // 247
D=M // 248
@4 // 249
M=D // 250

////PushInstruction("that 0")
@THAT // 251
A=M // 252
D=M // 253
@SP // 254
AM=M+1 // 255
A=A-1 // 256
M=D // 257

////PushInstruction("constant 0")
@SP // 258
AM=M+1 // 259
A=A-1 // 260
M=0 // 261

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq0 // 262
D=A // 263
@13 // 264
M=D // 265
@SP // 266
AM=M-1 // 267
D=M // 268
A=A-1 // 269
D=M-D // 270
@DO_EQ // 271
0;JMP // 272
(COMPARE_Keyboard.readChar_eq0)

////PushInstruction("constant 0")
@SP // 273
AM=M+1 // 274
A=A-1 // 275
M=0 // 276

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq1 // 277
D=A // 278
@13 // 279
M=D // 280
@SP // 281
AM=M-1 // 282
D=M // 283
A=A-1 // 284
D=M-D // 285
@DO_EQ // 286
0;JMP // 287
(COMPARE_Keyboard.readChar_eq1)

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar1}
// if-goto WHILE_END_Keyboard.readChar1
@SP // 288
AM=M-1 // 289
D=M // 290
@WHILE_END_Keyboard.readChar1 // 291
D;JNE // 292

////GotoInstruction{label='WHILE_START_Keyboard.readChar1}
// goto WHILE_START_Keyboard.readChar1
@WHILE_START_Keyboard.readChar1 // 293
0;JMP // 294

////LabelInstruction{label='WHILE_END_Keyboard.readChar1}
// label WHILE_END_Keyboard.readChar1
(WHILE_END_Keyboard.readChar1)

////PushInstruction("constant 24576")
@24576 // 295
D=A // 296
@SP // 297
AM=M+1 // 298
A=A-1 // 299
M=D // 300

////PushInstruction("constant 0")
@SP // 301
AM=M+1 // 302
A=A-1 // 303
M=0 // 304

////ArithmeticInstruction{ADD}
@SP // 305
AM=M-1 // 306
D=M // 307
A=A-1 // 308
D=D+M // 309

////PopInstruction{address=pointer 1}
@SP // 310
AM=M-1 // 311
D=M // 312
@4 // 313
M=D // 314

////PushInstruction("that 0")
@THAT // 315
A=M // 316
D=M // 317
@SP // 318
AM=M+1 // 319
A=A-1 // 320
M=D // 321

////PopInstruction{address=local 0}
@SP // 322
AM=M-1 // 323
D=M // 324
@LCL // 325
A=M // 326
M=D // 327

////LabelInstruction{label='WHILE_START_Keyboard.readChar2}
// label WHILE_START_Keyboard.readChar2
(WHILE_START_Keyboard.readChar2)

////PushInstruction("constant 24576")
@24576 // 328
D=A // 329
@SP // 330
AM=M+1 // 331
A=A-1 // 332
M=D // 333

////PushInstruction("constant 0")
@SP // 334
AM=M+1 // 335
A=A-1 // 336
M=0 // 337

////ArithmeticInstruction{ADD}
@SP // 338
AM=M-1 // 339
D=M // 340
A=A-1 // 341
D=D+M // 342

////PopInstruction{address=pointer 1}
@SP // 343
AM=M-1 // 344
D=M // 345
@4 // 346
M=D // 347

////PushInstruction("that 0")
@THAT // 348
A=M // 349
D=M // 350
@SP // 351
AM=M+1 // 352
A=A-1 // 353
M=D // 354

////PushInstruction("constant 0")
@SP // 355
AM=M+1 // 356
A=A-1 // 357
M=0 // 358

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq2 // 359
D=A // 360
@13 // 361
M=D // 362
@SP // 363
AM=M-1 // 364
D=M // 365
A=A-1 // 366
D=M-D // 367
@DO_EQ // 368
0;JMP // 369
(COMPARE_Keyboard.readChar_eq2)

////ArithmeticInstruction{NOT}
@SP // 370
A=M-1 // 371
M=!M // 372

////PushInstruction("constant 0")
@SP // 373
AM=M+1 // 374
A=A-1 // 375
M=0 // 376

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readChar_eq3 // 377
D=A // 378
@13 // 379
M=D // 380
@SP // 381
AM=M-1 // 382
D=M // 383
A=A-1 // 384
D=M-D // 385
@DO_EQ // 386
0;JMP // 387
(COMPARE_Keyboard.readChar_eq3)

////IfGotoInstruction{label='WHILE_END_Keyboard.readChar2}
// if-goto WHILE_END_Keyboard.readChar2
@SP // 388
AM=M-1 // 389
D=M // 390
@WHILE_END_Keyboard.readChar2 // 391
D;JNE // 392

////GotoInstruction{label='WHILE_START_Keyboard.readChar2}
// goto WHILE_START_Keyboard.readChar2
@WHILE_START_Keyboard.readChar2 // 393
0;JMP // 394

////LabelInstruction{label='WHILE_END_Keyboard.readChar2}
// label WHILE_END_Keyboard.readChar2
(WHILE_END_Keyboard.readChar2)

////PushInstruction("local 0")
@LCL // 395
A=M // 396
D=M // 397
@SP // 398
AM=M+1 // 399
A=A-1 // 400
M=D // 401

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Keyboard.readChar=0, Keyboard.init=0, Keyboard.keyPressed=0}, currentFunction='Keyboard.readChar'}
// call Output.printChar
@6 // 402
D=A // 403
@14 // 404
M=D // 405
@Output.printChar // 406
D=A // 407
@13 // 408
M=D // 409
@Keyboard.readChar.ret.0 // 410
D=A // 411
@CALL // 412
0;JMP // 413
(Keyboard.readChar.ret.0)

////PopInstruction{address=temp 0}
@SP // 414
AM=M-1 // 415
D=M // 416
@5 // 417
M=D // 418

////PushInstruction("local 0")
@LCL // 419
A=M // 420
D=M // 421
@SP // 422
AM=M+1 // 423
A=A-1 // 424
M=D // 425

////ReturnInstruction{}
@RETURN // 426
0;JMP // 427

////FunctionInstruction{functionName='Keyboard.readLine', numLocals=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0}}
// function Keyboard.readLine with 2
(Keyboard.readLine)
@SP // 428
AM=M+1 // 429
A=A-1 // 430
M=0 // 431
@SP // 432
AM=M+1 // 433
A=A-1 // 434
M=0 // 435

////PushInstruction("argument 0")
@ARG // 436
A=M // 437
D=M // 438
@SP // 439
AM=M+1 // 440
A=A-1 // 441
M=D // 442

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=0}, currentFunction='Keyboard.readLine'}
// call Output.printString
@6 // 443
D=A // 444
@14 // 445
M=D // 446
@Output.printString // 447
D=A // 448
@13 // 449
M=D // 450
@Keyboard.readLine.ret.0 // 451
D=A // 452
@CALL // 453
0;JMP // 454
(Keyboard.readLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 455
AM=M-1 // 456
D=M // 457
@5 // 458
M=D // 459

////PushInstruction("constant 50")
@50 // 460
D=A // 461
@SP // 462
AM=M+1 // 463
A=A-1 // 464
M=D // 465

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=1}, currentFunction='Keyboard.readLine'}
// call String.new
@6 // 466
D=A // 467
@14 // 468
M=D // 469
@String.new // 470
D=A // 471
@13 // 472
M=D // 473
@Keyboard.readLine.ret.1 // 474
D=A // 475
@CALL // 476
0;JMP // 477
(Keyboard.readLine.ret.1)

////PopInstruction{address=local 0}
@SP // 478
AM=M-1 // 479
D=M // 480
@LCL // 481
A=M // 482
M=D // 483

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=2}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 484
D=A // 485
@14 // 486
M=D // 487
@Keyboard.readChar // 488
D=A // 489
@13 // 490
M=D // 491
@Keyboard.readLine.ret.2 // 492
D=A // 493
@CALL // 494
0;JMP // 495
(Keyboard.readLine.ret.2)

////PopInstruction{address=local 1}
@SP // 496
AM=M-1 // 497
D=M // 498
@LCL // 499
A=M+1 // 500
M=D // 501

////LabelInstruction{label='WHILE_START_Keyboard.readLine1}
// label WHILE_START_Keyboard.readLine1
(WHILE_START_Keyboard.readLine1)

////PushInstruction("local 1")
@LCL // 502
A=M+1 // 503
D=M // 504
@SP // 505
AM=M+1 // 506
A=A-1 // 507
M=D // 508

////CallInstruction{calleeFunction='String.newLine', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=3}, currentFunction='Keyboard.readLine'}
// call String.newLine
@5 // 509
D=A // 510
@14 // 511
M=D // 512
@String.newLine // 513
D=A // 514
@13 // 515
M=D // 516
@Keyboard.readLine.ret.3 // 517
D=A // 518
@CALL // 519
0;JMP // 520
(Keyboard.readLine.ret.3)

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq4 // 521
D=A // 522
@13 // 523
M=D // 524
@SP // 525
AM=M-1 // 526
D=M // 527
A=A-1 // 528
D=M-D // 529
@DO_EQ // 530
0;JMP // 531
(COMPARE_Keyboard.readLine_eq4)

////ArithmeticInstruction{NOT}
@SP // 532
A=M-1 // 533
M=!M // 534

////PushInstruction("constant 0")
@SP // 535
AM=M+1 // 536
A=A-1 // 537
M=0 // 538

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq5 // 539
D=A // 540
@13 // 541
M=D // 542
@SP // 543
AM=M-1 // 544
D=M // 545
A=A-1 // 546
D=M-D // 547
@DO_EQ // 548
0;JMP // 549
(COMPARE_Keyboard.readLine_eq5)

////IfGotoInstruction{label='WHILE_END_Keyboard.readLine1}
// if-goto WHILE_END_Keyboard.readLine1
@SP // 550
AM=M-1 // 551
D=M // 552
@WHILE_END_Keyboard.readLine1 // 553
D;JNE // 554

////PushInstruction("local 1")
@LCL // 555
A=M+1 // 556
D=M // 557
@SP // 558
AM=M+1 // 559
A=A-1 // 560
M=D // 561

////PushInstruction("constant 129")
@129 // 562
D=A // 563
@SP // 564
AM=M+1 // 565
A=A-1 // 566
M=D // 567

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq6 // 568
D=A // 569
@13 // 570
M=D // 571
@SP // 572
AM=M-1 // 573
D=M // 574
A=A-1 // 575
D=M-D // 576
@DO_EQ // 577
0;JMP // 578
(COMPARE_Keyboard.readLine_eq6)

////PushInstruction("constant 0")
@SP // 579
AM=M+1 // 580
A=A-1 // 581
M=0 // 582

////ArithmeticInstruction{EQ}
@COMPARE_Keyboard.readLine_eq7 // 583
D=A // 584
@13 // 585
M=D // 586
@SP // 587
AM=M-1 // 588
D=M // 589
A=A-1 // 590
D=M-D // 591
@DO_EQ // 592
0;JMP // 593
(COMPARE_Keyboard.readLine_eq7)

////IfGotoInstruction{label='Keyboard.readLine.IfElse1}
// if-goto Keyboard.readLine.IfElse1
@SP // 594
AM=M-1 // 595
D=M // 596
@Keyboard.readLine.IfElse1 // 597
D;JNE // 598

////PushInstruction("local 0")
@LCL // 599
A=M // 600
D=M // 601
@SP // 602
AM=M+1 // 603
A=A-1 // 604
M=D // 605

////CallInstruction{calleeFunction='String.eraseLastChar', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=4}, currentFunction='Keyboard.readLine'}
// call String.eraseLastChar
@6 // 606
D=A // 607
@14 // 608
M=D // 609
@String.eraseLastChar // 610
D=A // 611
@13 // 612
M=D // 613
@Keyboard.readLine.ret.4 // 614
D=A // 615
@CALL // 616
0;JMP // 617
(Keyboard.readLine.ret.4)

////PopInstruction{address=temp 0}
@SP // 618
AM=M-1 // 619
D=M // 620
@5 // 621
M=D // 622

////GotoInstruction{label='Keyboard.readLine.IfElseEND1}
// goto Keyboard.readLine.IfElseEND1
@Keyboard.readLine.IfElseEND1 // 623
0;JMP // 624

////LabelInstruction{label='Keyboard.readLine.IfElse1}
// label Keyboard.readLine.IfElse1
(Keyboard.readLine.IfElse1)

////PushInstruction("local 0")
@LCL // 625
A=M // 626
D=M // 627
@SP // 628
AM=M+1 // 629
A=A-1 // 630
M=D // 631

////PushInstruction("local 1")
@LCL // 632
A=M+1 // 633
D=M // 634
@SP // 635
AM=M+1 // 636
A=A-1 // 637
M=D // 638

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=5}, currentFunction='Keyboard.readLine'}
// call String.appendChar
@7 // 639
D=A // 640
@14 // 641
M=D // 642
@String.appendChar // 643
D=A // 644
@13 // 645
M=D // 646
@Keyboard.readLine.ret.5 // 647
D=A // 648
@CALL // 649
0;JMP // 650
(Keyboard.readLine.ret.5)

////PopInstruction{address=temp 0}
@SP // 651
AM=M-1 // 652
D=M // 653
@5 // 654
M=D // 655

////LabelInstruction{label='Keyboard.readLine.IfElseEND1}
// label Keyboard.readLine.IfElseEND1
(Keyboard.readLine.IfElseEND1)

////CallInstruction{calleeFunction='Keyboard.readChar', numArgs=0, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=6}, currentFunction='Keyboard.readLine'}
// call Keyboard.readChar
@5 // 656
D=A // 657
@14 // 658
M=D // 659
@Keyboard.readChar // 660
D=A // 661
@13 // 662
M=D // 663
@Keyboard.readLine.ret.6 // 664
D=A // 665
@CALL // 666
0;JMP // 667
(Keyboard.readLine.ret.6)

////PopInstruction{address=local 1}
@SP // 668
AM=M-1 // 669
D=M // 670
@LCL // 671
A=M+1 // 672
M=D // 673

////GotoInstruction{label='WHILE_START_Keyboard.readLine1}
// goto WHILE_START_Keyboard.readLine1
@WHILE_START_Keyboard.readLine1 // 674
0;JMP // 675

////LabelInstruction{label='WHILE_END_Keyboard.readLine1}
// label WHILE_END_Keyboard.readLine1
(WHILE_END_Keyboard.readLine1)

////PushInstruction("local 0")
@LCL // 676
A=M // 677
D=M // 678
@SP // 679
AM=M+1 // 680
A=A-1 // 681
M=D // 682

////ReturnInstruction{}
@RETURN // 683
0;JMP // 684

////FunctionInstruction{functionName='Keyboard.readInt', numLocals=1, funcMapping={Keyboard.readChar=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}}
// function Keyboard.readInt with 1
(Keyboard.readInt)
@SP // 685
AM=M+1 // 686
A=A-1 // 687
M=0 // 688

////PushInstruction("argument 0")
@ARG // 689
A=M // 690
D=M // 691
@SP // 692
AM=M+1 // 693
A=A-1 // 694
M=D // 695

////CallInstruction{calleeFunction='Keyboard.readLine', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=0, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call Keyboard.readLine
@6 // 696
D=A // 697
@14 // 698
M=D // 699
@Keyboard.readLine // 700
D=A // 701
@13 // 702
M=D // 703
@Keyboard.readInt.ret.0 // 704
D=A // 705
@CALL // 706
0;JMP // 707
(Keyboard.readInt.ret.0)

////PopInstruction{address=local 0}
@SP // 708
AM=M-1 // 709
D=M // 710
@LCL // 711
A=M // 712
M=D // 713

////PushInstruction("local 0")
@LCL // 714
A=M // 715
D=M // 716
@SP // 717
AM=M+1 // 718
A=A-1 // 719
M=D // 720

////CallInstruction{calleeFunction='String.intValue', numArgs=1, funcMapping={Keyboard.readChar=1, Keyboard.readInt=1, Keyboard.init=0, Keyboard.keyPressed=0, Keyboard.readLine=7}, currentFunction='Keyboard.readInt'}
// call String.intValue
@6 // 721
D=A // 722
@14 // 723
M=D // 724
@String.intValue // 725
D=A // 726
@13 // 727
M=D // 728
@Keyboard.readInt.ret.1 // 729
D=A // 730
@CALL // 731
0;JMP // 732
(Keyboard.readInt.ret.1)

////ReturnInstruction{}
@RETURN // 733
0;JMP // 734

////FunctionInstruction{functionName='Main.main', numLocals=0, funcMapping={}}
// function Main.main with 0
(Main.main)

////PushInstruction("constant 0")
@SP // 735
AM=M+1 // 736
A=A-1 // 737
M=0 // 738

////PushInstruction("constant 220")
@220 // 739
D=A // 740
@SP // 741
AM=M+1 // 742
A=A-1 // 743
M=D // 744

////PushInstruction("constant 511")
@511 // 745
D=A // 746
@SP // 747
AM=M+1 // 748
A=A-1 // 749
M=D // 750

////PushInstruction("constant 220")
@220 // 751
D=A // 752
@SP // 753
AM=M+1 // 754
A=A-1 // 755
M=D // 756

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=0}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 757
D=A // 758
@14 // 759
M=D // 760
@Screen.drawLine // 761
D=A // 762
@13 // 763
M=D // 764
@Main.main.ret.0 // 765
D=A // 766
@CALL // 767
0;JMP // 768
(Main.main.ret.0)

////PopInstruction{address=temp 0}
@SP // 769
AM=M-1 // 770
D=M // 771
@5 // 772
M=D // 773

////PushInstruction("constant 280")
@280 // 774
D=A // 775
@SP // 776
AM=M+1 // 777
A=A-1 // 778
M=D // 779

////PushInstruction("constant 90")
@90 // 780
D=A // 781
@SP // 782
AM=M+1 // 783
A=A-1 // 784
M=D // 785

////PushInstruction("constant 410")
@410 // 786
D=A // 787
@SP // 788
AM=M+1 // 789
A=A-1 // 790
M=D // 791

////PushInstruction("constant 220")
@220 // 792
D=A // 793
@SP // 794
AM=M+1 // 795
A=A-1 // 796
M=D // 797

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=1}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 798
D=A // 799
@14 // 800
M=D // 801
@Screen.drawRectangle // 802
D=A // 803
@13 // 804
M=D // 805
@Main.main.ret.1 // 806
D=A // 807
@CALL // 808
0;JMP // 809
(Main.main.ret.1)

////PopInstruction{address=temp 0}
@SP // 810
AM=M-1 // 811
D=M // 812
@5 // 813
M=D // 814

////PushInstruction("constant 0")
@SP // 815
AM=M+1 // 816
A=A-1 // 817
M=0 // 818

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=2}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 819
D=A // 820
@14 // 821
M=D // 822
@Screen.setColor // 823
D=A // 824
@13 // 825
M=D // 826
@Main.main.ret.2 // 827
D=A // 828
@CALL // 829
0;JMP // 830
(Main.main.ret.2)

////PopInstruction{address=temp 0}
@SP // 831
AM=M-1 // 832
D=M // 833
@5 // 834
M=D // 835

////PushInstruction("constant 350")
@350 // 836
D=A // 837
@SP // 838
AM=M+1 // 839
A=A-1 // 840
M=D // 841

////PushInstruction("constant 120")
@120 // 842
D=A // 843
@SP // 844
AM=M+1 // 845
A=A-1 // 846
M=D // 847

////PushInstruction("constant 390")
@390 // 848
D=A // 849
@SP // 850
AM=M+1 // 851
A=A-1 // 852
M=D // 853

////PushInstruction("constant 219")
@219 // 854
D=A // 855
@SP // 856
AM=M+1 // 857
A=A-1 // 858
M=D // 859

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=3}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 860
D=A // 861
@14 // 862
M=D // 863
@Screen.drawRectangle // 864
D=A // 865
@13 // 866
M=D // 867
@Main.main.ret.3 // 868
D=A // 869
@CALL // 870
0;JMP // 871
(Main.main.ret.3)

////PopInstruction{address=temp 0}
@SP // 872
AM=M-1 // 873
D=M // 874
@5 // 875
M=D // 876

////PushInstruction("constant 292")
@292 // 877
D=A // 878
@SP // 879
AM=M+1 // 880
A=A-1 // 881
M=D // 882

////PushInstruction("constant 120")
@120 // 883
D=A // 884
@SP // 885
AM=M+1 // 886
A=A-1 // 887
M=D // 888

////PushInstruction("constant 332")
@332 // 889
D=A // 890
@SP // 891
AM=M+1 // 892
A=A-1 // 893
M=D // 894

////PushInstruction("constant 150")
@150 // 895
D=A // 896
@SP // 897
AM=M+1 // 898
A=A-1 // 899
M=D // 900

////CallInstruction{calleeFunction='Screen.drawRectangle', numArgs=4, funcMapping={Main.main=4}, currentFunction='Main.main'}
// call Screen.drawRectangle
@9 // 901
D=A // 902
@14 // 903
M=D // 904
@Screen.drawRectangle // 905
D=A // 906
@13 // 907
M=D // 908
@Main.main.ret.4 // 909
D=A // 910
@CALL // 911
0;JMP // 912
(Main.main.ret.4)

////PopInstruction{address=temp 0}
@SP // 913
AM=M-1 // 914
D=M // 915
@5 // 916
M=D // 917

////PushInstruction("constant 0")
@SP // 918
AM=M+1 // 919
A=A-1 // 920
M=0 // 921

////ArithmeticInstruction{NOT}
@SP // 922
A=M-1 // 923
M=!M // 924

////CallInstruction{calleeFunction='Screen.setColor', numArgs=1, funcMapping={Main.main=5}, currentFunction='Main.main'}
// call Screen.setColor
@6 // 925
D=A // 926
@14 // 927
M=D // 928
@Screen.setColor // 929
D=A // 930
@13 // 931
M=D // 932
@Main.main.ret.5 // 933
D=A // 934
@CALL // 935
0;JMP // 936
(Main.main.ret.5)

////PopInstruction{address=temp 0}
@SP // 937
AM=M-1 // 938
D=M // 939
@5 // 940
M=D // 941

////PushInstruction("constant 360")
@360 // 942
D=A // 943
@SP // 944
AM=M+1 // 945
A=A-1 // 946
M=D // 947

////PushInstruction("constant 170")
@170 // 948
D=A // 949
@SP // 950
AM=M+1 // 951
A=A-1 // 952
M=D // 953

////PushInstruction("constant 3")
@3 // 954
D=A // 955
@SP // 956
AM=M+1 // 957
A=A-1 // 958
M=D // 959

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=6}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 960
D=A // 961
@14 // 962
M=D // 963
@Screen.drawCircle // 964
D=A // 965
@13 // 966
M=D // 967
@Main.main.ret.6 // 968
D=A // 969
@CALL // 970
0;JMP // 971
(Main.main.ret.6)

////PopInstruction{address=temp 0}
@SP // 972
AM=M-1 // 973
D=M // 974
@5 // 975
M=D // 976

////PushInstruction("constant 280")
@280 // 977
D=A // 978
@SP // 979
AM=M+1 // 980
A=A-1 // 981
M=D // 982

////PushInstruction("constant 90")
@90 // 983
D=A // 984
@SP // 985
AM=M+1 // 986
A=A-1 // 987
M=D // 988

////PushInstruction("constant 345")
@345 // 989
D=A // 990
@SP // 991
AM=M+1 // 992
A=A-1 // 993
M=D // 994

////PushInstruction("constant 35")
@35 // 995
D=A // 996
@SP // 997
AM=M+1 // 998
A=A-1 // 999
M=D // 1000

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=7}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1001
D=A // 1002
@14 // 1003
M=D // 1004
@Screen.drawLine // 1005
D=A // 1006
@13 // 1007
M=D // 1008
@Main.main.ret.7 // 1009
D=A // 1010
@CALL // 1011
0;JMP // 1012
(Main.main.ret.7)

////PopInstruction{address=temp 0}
@SP // 1013
AM=M-1 // 1014
D=M // 1015
@5 // 1016
M=D // 1017

////PushInstruction("constant 345")
@345 // 1018
D=A // 1019
@SP // 1020
AM=M+1 // 1021
A=A-1 // 1022
M=D // 1023

////PushInstruction("constant 35")
@35 // 1024
D=A // 1025
@SP // 1026
AM=M+1 // 1027
A=A-1 // 1028
M=D // 1029

////PushInstruction("constant 410")
@410 // 1030
D=A // 1031
@SP // 1032
AM=M+1 // 1033
A=A-1 // 1034
M=D // 1035

////PushInstruction("constant 90")
@90 // 1036
D=A // 1037
@SP // 1038
AM=M+1 // 1039
A=A-1 // 1040
M=D // 1041

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=8}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1042
D=A // 1043
@14 // 1044
M=D // 1045
@Screen.drawLine // 1046
D=A // 1047
@13 // 1048
M=D // 1049
@Main.main.ret.8 // 1050
D=A // 1051
@CALL // 1052
0;JMP // 1053
(Main.main.ret.8)

////PopInstruction{address=temp 0}
@SP // 1054
AM=M-1 // 1055
D=M // 1056
@5 // 1057
M=D // 1058

////PushInstruction("constant 140")
@140 // 1059
D=A // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064

////PushInstruction("constant 60")
@60 // 1065
D=A // 1066
@SP // 1067
AM=M+1 // 1068
A=A-1 // 1069
M=D // 1070

////PushInstruction("constant 30")
@30 // 1071
D=A // 1072
@SP // 1073
AM=M+1 // 1074
A=A-1 // 1075
M=D // 1076

////CallInstruction{calleeFunction='Screen.drawCircle', numArgs=3, funcMapping={Main.main=9}, currentFunction='Main.main'}
// call Screen.drawCircle
@8 // 1077
D=A // 1078
@14 // 1079
M=D // 1080
@Screen.drawCircle // 1081
D=A // 1082
@13 // 1083
M=D // 1084
@Main.main.ret.9 // 1085
D=A // 1086
@CALL // 1087
0;JMP // 1088
(Main.main.ret.9)

////PopInstruction{address=temp 0}
@SP // 1089
AM=M-1 // 1090
D=M // 1091
@5 // 1092
M=D // 1093

////PushInstruction("constant 140")
@140 // 1094
D=A // 1095
@SP // 1096
AM=M+1 // 1097
A=A-1 // 1098
M=D // 1099

////PushInstruction("constant 26")
@26 // 1100
D=A // 1101
@SP // 1102
AM=M+1 // 1103
A=A-1 // 1104
M=D // 1105

////PushInstruction("constant 140")
@140 // 1106
D=A // 1107
@SP // 1108
AM=M+1 // 1109
A=A-1 // 1110
M=D // 1111

////PushInstruction("constant 6")
@6 // 1112
D=A // 1113
@SP // 1114
AM=M+1 // 1115
A=A-1 // 1116
M=D // 1117

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=10}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1118
D=A // 1119
@14 // 1120
M=D // 1121
@Screen.drawLine // 1122
D=A // 1123
@13 // 1124
M=D // 1125
@Main.main.ret.10 // 1126
D=A // 1127
@CALL // 1128
0;JMP // 1129
(Main.main.ret.10)

////PopInstruction{address=temp 0}
@SP // 1130
AM=M-1 // 1131
D=M // 1132
@5 // 1133
M=D // 1134

////PushInstruction("constant 163")
@163 // 1135
D=A // 1136
@SP // 1137
AM=M+1 // 1138
A=A-1 // 1139
M=D // 1140

////PushInstruction("constant 35")
@35 // 1141
D=A // 1142
@SP // 1143
AM=M+1 // 1144
A=A-1 // 1145
M=D // 1146

////PushInstruction("constant 178")
@178 // 1147
D=A // 1148
@SP // 1149
AM=M+1 // 1150
A=A-1 // 1151
M=D // 1152

////PushInstruction("constant 20")
@20 // 1153
D=A // 1154
@SP // 1155
AM=M+1 // 1156
A=A-1 // 1157
M=D // 1158

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=11}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1159
D=A // 1160
@14 // 1161
M=D // 1162
@Screen.drawLine // 1163
D=A // 1164
@13 // 1165
M=D // 1166
@Main.main.ret.11 // 1167
D=A // 1168
@CALL // 1169
0;JMP // 1170
(Main.main.ret.11)

////PopInstruction{address=temp 0}
@SP // 1171
AM=M-1 // 1172
D=M // 1173
@5 // 1174
M=D // 1175

////PushInstruction("constant 174")
@174 // 1176
D=A // 1177
@SP // 1178
AM=M+1 // 1179
A=A-1 // 1180
M=D // 1181

////PushInstruction("constant 60")
@60 // 1182
D=A // 1183
@SP // 1184
AM=M+1 // 1185
A=A-1 // 1186
M=D // 1187

////PushInstruction("constant 194")
@194 // 1188
D=A // 1189
@SP // 1190
AM=M+1 // 1191
A=A-1 // 1192
M=D // 1193

////PushInstruction("constant 60")
@60 // 1194
D=A // 1195
@SP // 1196
AM=M+1 // 1197
A=A-1 // 1198
M=D // 1199

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=12}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1200
D=A // 1201
@14 // 1202
M=D // 1203
@Screen.drawLine // 1204
D=A // 1205
@13 // 1206
M=D // 1207
@Main.main.ret.12 // 1208
D=A // 1209
@CALL // 1210
0;JMP // 1211
(Main.main.ret.12)

////PopInstruction{address=temp 0}
@SP // 1212
AM=M-1 // 1213
D=M // 1214
@5 // 1215
M=D // 1216

////PushInstruction("constant 163")
@163 // 1217
D=A // 1218
@SP // 1219
AM=M+1 // 1220
A=A-1 // 1221
M=D // 1222

////PushInstruction("constant 85")
@85 // 1223
D=A // 1224
@SP // 1225
AM=M+1 // 1226
A=A-1 // 1227
M=D // 1228

////PushInstruction("constant 178")
@178 // 1229
D=A // 1230
@SP // 1231
AM=M+1 // 1232
A=A-1 // 1233
M=D // 1234

////PushInstruction("constant 100")
@100 // 1235
D=A // 1236
@SP // 1237
AM=M+1 // 1238
A=A-1 // 1239
M=D // 1240

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=13}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1241
D=A // 1242
@14 // 1243
M=D // 1244
@Screen.drawLine // 1245
D=A // 1246
@13 // 1247
M=D // 1248
@Main.main.ret.13 // 1249
D=A // 1250
@CALL // 1251
0;JMP // 1252
(Main.main.ret.13)

////PopInstruction{address=temp 0}
@SP // 1253
AM=M-1 // 1254
D=M // 1255
@5 // 1256
M=D // 1257

////PushInstruction("constant 140")
@140 // 1258
D=A // 1259
@SP // 1260
AM=M+1 // 1261
A=A-1 // 1262
M=D // 1263

////PushInstruction("constant 94")
@94 // 1264
D=A // 1265
@SP // 1266
AM=M+1 // 1267
A=A-1 // 1268
M=D // 1269

////PushInstruction("constant 140")
@140 // 1270
D=A // 1271
@SP // 1272
AM=M+1 // 1273
A=A-1 // 1274
M=D // 1275

////PushInstruction("constant 114")
@114 // 1276
D=A // 1277
@SP // 1278
AM=M+1 // 1279
A=A-1 // 1280
M=D // 1281

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=14}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1282
D=A // 1283
@14 // 1284
M=D // 1285
@Screen.drawLine // 1286
D=A // 1287
@13 // 1288
M=D // 1289
@Main.main.ret.14 // 1290
D=A // 1291
@CALL // 1292
0;JMP // 1293
(Main.main.ret.14)

////PopInstruction{address=temp 0}
@SP // 1294
AM=M-1 // 1295
D=M // 1296
@5 // 1297
M=D // 1298

////PushInstruction("constant 117")
@117 // 1299
D=A // 1300
@SP // 1301
AM=M+1 // 1302
A=A-1 // 1303
M=D // 1304

////PushInstruction("constant 85")
@85 // 1305
D=A // 1306
@SP // 1307
AM=M+1 // 1308
A=A-1 // 1309
M=D // 1310

////PushInstruction("constant 102")
@102 // 1311
D=A // 1312
@SP // 1313
AM=M+1 // 1314
A=A-1 // 1315
M=D // 1316

////PushInstruction("constant 100")
@100 // 1317
D=A // 1318
@SP // 1319
AM=M+1 // 1320
A=A-1 // 1321
M=D // 1322

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=15}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1323
D=A // 1324
@14 // 1325
M=D // 1326
@Screen.drawLine // 1327
D=A // 1328
@13 // 1329
M=D // 1330
@Main.main.ret.15 // 1331
D=A // 1332
@CALL // 1333
0;JMP // 1334
(Main.main.ret.15)

////PopInstruction{address=temp 0}
@SP // 1335
AM=M-1 // 1336
D=M // 1337
@5 // 1338
M=D // 1339

////PushInstruction("constant 106")
@106 // 1340
D=A // 1341
@SP // 1342
AM=M+1 // 1343
A=A-1 // 1344
M=D // 1345

////PushInstruction("constant 60")
@60 // 1346
D=A // 1347
@SP // 1348
AM=M+1 // 1349
A=A-1 // 1350
M=D // 1351

////PushInstruction("constant 86")
@86 // 1352
D=A // 1353
@SP // 1354
AM=M+1 // 1355
A=A-1 // 1356
M=D // 1357

////PushInstruction("constant 60")
@60 // 1358
D=A // 1359
@SP // 1360
AM=M+1 // 1361
A=A-1 // 1362
M=D // 1363

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=16}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1364
D=A // 1365
@14 // 1366
M=D // 1367
@Screen.drawLine // 1368
D=A // 1369
@13 // 1370
M=D // 1371
@Main.main.ret.16 // 1372
D=A // 1373
@CALL // 1374
0;JMP // 1375
(Main.main.ret.16)

////PopInstruction{address=temp 0}
@SP // 1376
AM=M-1 // 1377
D=M // 1378
@5 // 1379
M=D // 1380

////PushInstruction("constant 117")
@117 // 1381
D=A // 1382
@SP // 1383
AM=M+1 // 1384
A=A-1 // 1385
M=D // 1386

////PushInstruction("constant 35")
@35 // 1387
D=A // 1388
@SP // 1389
AM=M+1 // 1390
A=A-1 // 1391
M=D // 1392

////PushInstruction("constant 102")
@102 // 1393
D=A // 1394
@SP // 1395
AM=M+1 // 1396
A=A-1 // 1397
M=D // 1398

////PushInstruction("constant 20")
@20 // 1399
D=A // 1400
@SP // 1401
AM=M+1 // 1402
A=A-1 // 1403
M=D // 1404

////CallInstruction{calleeFunction='Screen.drawLine', numArgs=4, funcMapping={Main.main=17}, currentFunction='Main.main'}
// call Screen.drawLine
@9 // 1405
D=A // 1406
@14 // 1407
M=D // 1408
@Screen.drawLine // 1409
D=A // 1410
@13 // 1411
M=D // 1412
@Main.main.ret.17 // 1413
D=A // 1414
@CALL // 1415
0;JMP // 1416
(Main.main.ret.17)

////PopInstruction{address=temp 0}
@SP // 1417
AM=M-1 // 1418
D=M // 1419
@5 // 1420
M=D // 1421

////PushInstruction("constant 0")
@SP // 1422
AM=M+1 // 1423
A=A-1 // 1424
M=0 // 1425

////ReturnInstruction{}
@RETURN // 1426
0;JMP // 1427

////FunctionInstruction{functionName='Math.init', numLocals=0, funcMapping={}}
// function Math.init with 0
(Math.init)

////PushInstruction("constant 16")
@16 // 1428
D=A // 1429
@SP // 1430
AM=M+1 // 1431
A=A-1 // 1432
M=D // 1433

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Math.init=0}, currentFunction='Math.init'}
// call Array.new
@6 // 1434
D=A // 1435
@14 // 1436
M=D // 1437
@Array.new // 1438
D=A // 1439
@13 // 1440
M=D // 1441
@Math.init.ret.0 // 1442
D=A // 1443
@CALL // 1444
0;JMP // 1445
(Math.init.ret.0)

////PopInstruction{address=Math.0}
@SP // 1446
AM=M-1 // 1447
D=M // 1448
@Math.0 // 1449
M=D // 1450

////PushInstruction("constant 1")
@SP // 1451
AM=M+1 // 1452
A=A-1 // 1453
M=1 // 1454

////PushInstruction("static 0")
@Math.0 // 1455
D=M // 1456
@SP // 1457
AM=M+1 // 1458
A=A-1 // 1459
M=D // 1460

////PushInstruction("constant 0")
@SP // 1461
AM=M+1 // 1462
A=A-1 // 1463
M=0 // 1464

////ArithmeticInstruction{ADD}
@SP // 1465
AM=M-1 // 1466
D=M // 1467
A=A-1 // 1468
D=D+M // 1469

////PopInstruction{address=pointer 1}
@SP // 1470
AM=M-1 // 1471
D=M // 1472
@4 // 1473
M=D // 1474

////PopInstruction{address=that 0}
@SP // 1475
AM=M-1 // 1476
D=M // 1477
@THAT // 1478
A=M // 1479
M=D // 1480

////PushInstruction("constant 2")
@2 // 1481
D=A // 1482
@SP // 1483
AM=M+1 // 1484
A=A-1 // 1485
M=D // 1486

////PushInstruction("static 0")
@Math.0 // 1487
D=M // 1488
@SP // 1489
AM=M+1 // 1490
A=A-1 // 1491
M=D // 1492

////PushInstruction("constant 1")
@SP // 1493
AM=M+1 // 1494
A=A-1 // 1495
M=1 // 1496

////ArithmeticInstruction{ADD}
@SP // 1497
AM=M-1 // 1498
D=M // 1499
A=A-1 // 1500
D=D+M // 1501

////PopInstruction{address=pointer 1}
@SP // 1502
AM=M-1 // 1503
D=M // 1504
@4 // 1505
M=D // 1506

////PopInstruction{address=that 0}
@SP // 1507
AM=M-1 // 1508
D=M // 1509
@THAT // 1510
A=M // 1511
M=D // 1512

////PushInstruction("constant 4")
@4 // 1513
D=A // 1514
@SP // 1515
AM=M+1 // 1516
A=A-1 // 1517
M=D // 1518

////PushInstruction("static 0")
@Math.0 // 1519
D=M // 1520
@SP // 1521
AM=M+1 // 1522
A=A-1 // 1523
M=D // 1524

////PushInstruction("constant 2")
@2 // 1525
D=A // 1526
@SP // 1527
AM=M+1 // 1528
A=A-1 // 1529
M=D // 1530

////ArithmeticInstruction{ADD}
@SP // 1531
AM=M-1 // 1532
D=M // 1533
A=A-1 // 1534
D=D+M // 1535

////PopInstruction{address=pointer 1}
@SP // 1536
AM=M-1 // 1537
D=M // 1538
@4 // 1539
M=D // 1540

////PopInstruction{address=that 0}
@SP // 1541
AM=M-1 // 1542
D=M // 1543
@THAT // 1544
A=M // 1545
M=D // 1546

////PushInstruction("constant 8")
@8 // 1547
D=A // 1548
@SP // 1549
AM=M+1 // 1550
A=A-1 // 1551
M=D // 1552

////PushInstruction("static 0")
@Math.0 // 1553
D=M // 1554
@SP // 1555
AM=M+1 // 1556
A=A-1 // 1557
M=D // 1558

////PushInstruction("constant 3")
@3 // 1559
D=A // 1560
@SP // 1561
AM=M+1 // 1562
A=A-1 // 1563
M=D // 1564

////ArithmeticInstruction{ADD}
@SP // 1565
AM=M-1 // 1566
D=M // 1567
A=A-1 // 1568
D=D+M // 1569

////PopInstruction{address=pointer 1}
@SP // 1570
AM=M-1 // 1571
D=M // 1572
@4 // 1573
M=D // 1574

////PopInstruction{address=that 0}
@SP // 1575
AM=M-1 // 1576
D=M // 1577
@THAT // 1578
A=M // 1579
M=D // 1580

////PushInstruction("constant 16")
@16 // 1581
D=A // 1582
@SP // 1583
AM=M+1 // 1584
A=A-1 // 1585
M=D // 1586

////PushInstruction("static 0")
@Math.0 // 1587
D=M // 1588
@SP // 1589
AM=M+1 // 1590
A=A-1 // 1591
M=D // 1592

////PushInstruction("constant 4")
@4 // 1593
D=A // 1594
@SP // 1595
AM=M+1 // 1596
A=A-1 // 1597
M=D // 1598

////ArithmeticInstruction{ADD}
@SP // 1599
AM=M-1 // 1600
D=M // 1601
A=A-1 // 1602
D=D+M // 1603

////PopInstruction{address=pointer 1}
@SP // 1604
AM=M-1 // 1605
D=M // 1606
@4 // 1607
M=D // 1608

////PopInstruction{address=that 0}
@SP // 1609
AM=M-1 // 1610
D=M // 1611
@THAT // 1612
A=M // 1613
M=D // 1614

////PushInstruction("constant 32")
@32 // 1615
D=A // 1616
@SP // 1617
AM=M+1 // 1618
A=A-1 // 1619
M=D // 1620

////PushInstruction("static 0")
@Math.0 // 1621
D=M // 1622
@SP // 1623
AM=M+1 // 1624
A=A-1 // 1625
M=D // 1626

////PushInstruction("constant 5")
@5 // 1627
D=A // 1628
@SP // 1629
AM=M+1 // 1630
A=A-1 // 1631
M=D // 1632

////ArithmeticInstruction{ADD}
@SP // 1633
AM=M-1 // 1634
D=M // 1635
A=A-1 // 1636
D=D+M // 1637

////PopInstruction{address=pointer 1}
@SP // 1638
AM=M-1 // 1639
D=M // 1640
@4 // 1641
M=D // 1642

////PopInstruction{address=that 0}
@SP // 1643
AM=M-1 // 1644
D=M // 1645
@THAT // 1646
A=M // 1647
M=D // 1648

////PushInstruction("constant 64")
@64 // 1649
D=A // 1650
@SP // 1651
AM=M+1 // 1652
A=A-1 // 1653
M=D // 1654

////PushInstruction("static 0")
@Math.0 // 1655
D=M // 1656
@SP // 1657
AM=M+1 // 1658
A=A-1 // 1659
M=D // 1660

////PushInstruction("constant 6")
@6 // 1661
D=A // 1662
@SP // 1663
AM=M+1 // 1664
A=A-1 // 1665
M=D // 1666

////ArithmeticInstruction{ADD}
@SP // 1667
AM=M-1 // 1668
D=M // 1669
A=A-1 // 1670
D=D+M // 1671

////PopInstruction{address=pointer 1}
@SP // 1672
AM=M-1 // 1673
D=M // 1674
@4 // 1675
M=D // 1676

////PopInstruction{address=that 0}
@SP // 1677
AM=M-1 // 1678
D=M // 1679
@THAT // 1680
A=M // 1681
M=D // 1682

////PushInstruction("constant 128")
@128 // 1683
D=A // 1684
@SP // 1685
AM=M+1 // 1686
A=A-1 // 1687
M=D // 1688

////PushInstruction("static 0")
@Math.0 // 1689
D=M // 1690
@SP // 1691
AM=M+1 // 1692
A=A-1 // 1693
M=D // 1694

////PushInstruction("constant 7")
@7 // 1695
D=A // 1696
@SP // 1697
AM=M+1 // 1698
A=A-1 // 1699
M=D // 1700

////ArithmeticInstruction{ADD}
@SP // 1701
AM=M-1 // 1702
D=M // 1703
A=A-1 // 1704
D=D+M // 1705

////PopInstruction{address=pointer 1}
@SP // 1706
AM=M-1 // 1707
D=M // 1708
@4 // 1709
M=D // 1710

////PopInstruction{address=that 0}
@SP // 1711
AM=M-1 // 1712
D=M // 1713
@THAT // 1714
A=M // 1715
M=D // 1716

////PushInstruction("constant 256")
@256 // 1717
D=A // 1718
@SP // 1719
AM=M+1 // 1720
A=A-1 // 1721
M=D // 1722

////PushInstruction("static 0")
@Math.0 // 1723
D=M // 1724
@SP // 1725
AM=M+1 // 1726
A=A-1 // 1727
M=D // 1728

////PushInstruction("constant 8")
@8 // 1729
D=A // 1730
@SP // 1731
AM=M+1 // 1732
A=A-1 // 1733
M=D // 1734

////ArithmeticInstruction{ADD}
@SP // 1735
AM=M-1 // 1736
D=M // 1737
A=A-1 // 1738
D=D+M // 1739

////PopInstruction{address=pointer 1}
@SP // 1740
AM=M-1 // 1741
D=M // 1742
@4 // 1743
M=D // 1744

////PopInstruction{address=that 0}
@SP // 1745
AM=M-1 // 1746
D=M // 1747
@THAT // 1748
A=M // 1749
M=D // 1750

////PushInstruction("constant 512")
@512 // 1751
D=A // 1752
@SP // 1753
AM=M+1 // 1754
A=A-1 // 1755
M=D // 1756

////PushInstruction("static 0")
@Math.0 // 1757
D=M // 1758
@SP // 1759
AM=M+1 // 1760
A=A-1 // 1761
M=D // 1762

////PushInstruction("constant 9")
@9 // 1763
D=A // 1764
@SP // 1765
AM=M+1 // 1766
A=A-1 // 1767
M=D // 1768

////ArithmeticInstruction{ADD}
@SP // 1769
AM=M-1 // 1770
D=M // 1771
A=A-1 // 1772
D=D+M // 1773

////PopInstruction{address=pointer 1}
@SP // 1774
AM=M-1 // 1775
D=M // 1776
@4 // 1777
M=D // 1778

////PopInstruction{address=that 0}
@SP // 1779
AM=M-1 // 1780
D=M // 1781
@THAT // 1782
A=M // 1783
M=D // 1784

////PushInstruction("constant 1024")
@1024 // 1785
D=A // 1786
@SP // 1787
AM=M+1 // 1788
A=A-1 // 1789
M=D // 1790

////PushInstruction("static 0")
@Math.0 // 1791
D=M // 1792
@SP // 1793
AM=M+1 // 1794
A=A-1 // 1795
M=D // 1796

////PushInstruction("constant 10")
@10 // 1797
D=A // 1798
@SP // 1799
AM=M+1 // 1800
A=A-1 // 1801
M=D // 1802

////ArithmeticInstruction{ADD}
@SP // 1803
AM=M-1 // 1804
D=M // 1805
A=A-1 // 1806
D=D+M // 1807

////PopInstruction{address=pointer 1}
@SP // 1808
AM=M-1 // 1809
D=M // 1810
@4 // 1811
M=D // 1812

////PopInstruction{address=that 0}
@SP // 1813
AM=M-1 // 1814
D=M // 1815
@THAT // 1816
A=M // 1817
M=D // 1818

////PushInstruction("constant 2048")
@2048 // 1819
D=A // 1820
@SP // 1821
AM=M+1 // 1822
A=A-1 // 1823
M=D // 1824

////PushInstruction("static 0")
@Math.0 // 1825
D=M // 1826
@SP // 1827
AM=M+1 // 1828
A=A-1 // 1829
M=D // 1830

////PushInstruction("constant 11")
@11 // 1831
D=A // 1832
@SP // 1833
AM=M+1 // 1834
A=A-1 // 1835
M=D // 1836

////ArithmeticInstruction{ADD}
@SP // 1837
AM=M-1 // 1838
D=M // 1839
A=A-1 // 1840
D=D+M // 1841

////PopInstruction{address=pointer 1}
@SP // 1842
AM=M-1 // 1843
D=M // 1844
@4 // 1845
M=D // 1846

////PopInstruction{address=that 0}
@SP // 1847
AM=M-1 // 1848
D=M // 1849
@THAT // 1850
A=M // 1851
M=D // 1852

////PushInstruction("constant 4096")
@4096 // 1853
D=A // 1854
@SP // 1855
AM=M+1 // 1856
A=A-1 // 1857
M=D // 1858

////PushInstruction("static 0")
@Math.0 // 1859
D=M // 1860
@SP // 1861
AM=M+1 // 1862
A=A-1 // 1863
M=D // 1864

////PushInstruction("constant 12")
@12 // 1865
D=A // 1866
@SP // 1867
AM=M+1 // 1868
A=A-1 // 1869
M=D // 1870

////ArithmeticInstruction{ADD}
@SP // 1871
AM=M-1 // 1872
D=M // 1873
A=A-1 // 1874
D=D+M // 1875

////PopInstruction{address=pointer 1}
@SP // 1876
AM=M-1 // 1877
D=M // 1878
@4 // 1879
M=D // 1880

////PopInstruction{address=that 0}
@SP // 1881
AM=M-1 // 1882
D=M // 1883
@THAT // 1884
A=M // 1885
M=D // 1886

////PushInstruction("constant 8192")
@8192 // 1887
D=A // 1888
@SP // 1889
AM=M+1 // 1890
A=A-1 // 1891
M=D // 1892

////PushInstruction("static 0")
@Math.0 // 1893
D=M // 1894
@SP // 1895
AM=M+1 // 1896
A=A-1 // 1897
M=D // 1898

////PushInstruction("constant 13")
@13 // 1899
D=A // 1900
@SP // 1901
AM=M+1 // 1902
A=A-1 // 1903
M=D // 1904

////ArithmeticInstruction{ADD}
@SP // 1905
AM=M-1 // 1906
D=M // 1907
A=A-1 // 1908
D=D+M // 1909

////PopInstruction{address=pointer 1}
@SP // 1910
AM=M-1 // 1911
D=M // 1912
@4 // 1913
M=D // 1914

////PopInstruction{address=that 0}
@SP // 1915
AM=M-1 // 1916
D=M // 1917
@THAT // 1918
A=M // 1919
M=D // 1920

////PushInstruction("constant 16384")
@16384 // 1921
D=A // 1922
@SP // 1923
AM=M+1 // 1924
A=A-1 // 1925
M=D // 1926

////PushInstruction("static 0")
@Math.0 // 1927
D=M // 1928
@SP // 1929
AM=M+1 // 1930
A=A-1 // 1931
M=D // 1932

////PushInstruction("constant 14")
@14 // 1933
D=A // 1934
@SP // 1935
AM=M+1 // 1936
A=A-1 // 1937
M=D // 1938

////ArithmeticInstruction{ADD}
@SP // 1939
AM=M-1 // 1940
D=M // 1941
A=A-1 // 1942
D=D+M // 1943

////PopInstruction{address=pointer 1}
@SP // 1944
AM=M-1 // 1945
D=M // 1946
@4 // 1947
M=D // 1948

////PopInstruction{address=that 0}
@SP // 1949
AM=M-1 // 1950
D=M // 1951
@THAT // 1952
A=M // 1953
M=D // 1954

////PushInstruction("constant 16384")
@16384 // 1955
D=A // 1956
@SP // 1957
AM=M+1 // 1958
A=A-1 // 1959
M=D // 1960

////PushInstruction("constant 16384")
@16384 // 1961
D=A // 1962
@SP // 1963
AM=M+1 // 1964
A=A-1 // 1965
M=D // 1966

////ArithmeticInstruction{ADD}
@SP // 1967
AM=M-1 // 1968
D=M // 1969
A=A-1 // 1970
D=D+M // 1971

////PushInstruction("static 0")
@Math.0 // 1972
D=M // 1973
@SP // 1974
AM=M+1 // 1975
A=A-1 // 1976
M=D // 1977

////PushInstruction("constant 15")
@15 // 1978
D=A // 1979
@SP // 1980
AM=M+1 // 1981
A=A-1 // 1982
M=D // 1983

////ArithmeticInstruction{ADD}
@SP // 1984
AM=M-1 // 1985
D=M // 1986
A=A-1 // 1987
D=D+M // 1988

////PopInstruction{address=pointer 1}
@SP // 1989
AM=M-1 // 1990
D=M // 1991
@4 // 1992
M=D // 1993

////PopInstruction{address=that 0}
@SP // 1994
AM=M-1 // 1995
D=M // 1996
@THAT // 1997
A=M // 1998
M=D // 1999

////PushInstruction("constant 0")
@SP // 2000
AM=M+1 // 2001
A=A-1 // 2002
M=0 // 2003

////ReturnInstruction{}
@RETURN // 2004
0;JMP // 2005

////FunctionInstruction{functionName='Math.bit', numLocals=0, funcMapping={Math.init=1}}
// function Math.bit with 0
(Math.bit)

////PushInstruction("argument 0")
@ARG // 2006
A=M // 2007
D=M // 2008
@SP // 2009
AM=M+1 // 2010
A=A-1 // 2011
M=D // 2012

////PushInstruction("static 0")
@Math.0 // 2013
D=M // 2014
@SP // 2015
AM=M+1 // 2016
A=A-1 // 2017
M=D // 2018

////PushInstruction("argument 1")
@ARG // 2019
A=M+1 // 2020
D=M // 2021
@SP // 2022
AM=M+1 // 2023
A=A-1 // 2024
M=D // 2025

////ArithmeticInstruction{ADD}
@SP // 2026
AM=M-1 // 2027
D=M // 2028
A=A-1 // 2029
D=D+M // 2030

////PopInstruction{address=pointer 1}
@SP // 2031
AM=M-1 // 2032
D=M // 2033
@4 // 2034
M=D // 2035

////PushInstruction("that 0")
@THAT // 2036
A=M // 2037
D=M // 2038
@SP // 2039
AM=M+1 // 2040
A=A-1 // 2041
M=D // 2042

////ArithmeticInstruction{AND}
@SP // 2043
AM=M-1 // 2044
D=M // 2045
A=A-1 // 2046
D=D&M // 2047

////ReturnInstruction{}
@RETURN // 2048
0;JMP // 2049

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.init=1, Math.bit=0}}
// function Math.multiply with 3
(Math.multiply)
@SP // 2050
AM=M+1 // 2051
A=A-1 // 2052
M=0 // 2053
@SP // 2054
AM=M+1 // 2055
A=A-1 // 2056
M=0 // 2057
@SP // 2058
AM=M+1 // 2059
A=A-1 // 2060
M=0 // 2061

////PushInstruction("argument 0")
@ARG // 2062
A=M // 2063
D=M // 2064
@SP // 2065
AM=M+1 // 2066
A=A-1 // 2067
M=D // 2068

////PushInstruction("constant 0")
@SP // 2069
AM=M+1 // 2070
A=A-1 // 2071
M=0 // 2072

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq0 // 2073
D=A // 2074
@13 // 2075
M=D // 2076
@SP // 2077
AM=M-1 // 2078
D=M // 2079
A=A-1 // 2080
D=M-D // 2081
@DO_EQ // 2082
0;JMP // 2083
(COMPARE_Math.multiply_eq0)

////PushInstruction("argument 1")
@ARG // 2084
A=M+1 // 2085
D=M // 2086
@SP // 2087
AM=M+1 // 2088
A=A-1 // 2089
M=D // 2090

////PushInstruction("constant 0")
@SP // 2091
AM=M+1 // 2092
A=A-1 // 2093
M=0 // 2094

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq1 // 2095
D=A // 2096
@13 // 2097
M=D // 2098
@SP // 2099
AM=M-1 // 2100
D=M // 2101
A=A-1 // 2102
D=M-D // 2103
@DO_EQ // 2104
0;JMP // 2105
(COMPARE_Math.multiply_eq1)

////ArithmeticInstruction{OR}
@SP // 2106
AM=M-1 // 2107
D=M // 2108
A=A-1 // 2109
D=D|M // 2110

////PushInstruction("constant 0")
@SP // 2111
AM=M+1 // 2112
A=A-1 // 2113
M=0 // 2114

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq2 // 2115
D=A // 2116
@13 // 2117
M=D // 2118
@SP // 2119
AM=M-1 // 2120
D=M // 2121
A=A-1 // 2122
D=M-D // 2123
@DO_EQ // 2124
0;JMP // 2125
(COMPARE_Math.multiply_eq2)

////IfGotoInstruction{label='Math.multiply.IfElse1}
// if-goto Math.multiply.IfElse1
@SP // 2126
AM=M-1 // 2127
D=M // 2128
@Math.multiply.IfElse1 // 2129
D;JNE // 2130

////PushInstruction("constant 0")
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=0 // 2134

////ReturnInstruction{}
@RETURN // 2135
0;JMP // 2136

////GotoInstruction{label='Math.multiply.IfElseEND1}
// goto Math.multiply.IfElseEND1
@Math.multiply.IfElseEND1 // 2137
0;JMP // 2138

////LabelInstruction{label='Math.multiply.IfElse1}
// label Math.multiply.IfElse1
(Math.multiply.IfElse1)

////LabelInstruction{label='Math.multiply.IfElseEND1}
// label Math.multiply.IfElseEND1
(Math.multiply.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 2139
A=M // 2140
D=M // 2141
@SP // 2142
AM=M+1 // 2143
A=A-1 // 2144
M=D // 2145

////PushInstruction("constant 1")
@SP // 2146
AM=M+1 // 2147
A=A-1 // 2148
M=1 // 2149

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq3 // 2150
D=A // 2151
@13 // 2152
M=D // 2153
@SP // 2154
AM=M-1 // 2155
D=M // 2156
A=A-1 // 2157
D=M-D // 2158
@DO_EQ // 2159
0;JMP // 2160
(COMPARE_Math.multiply_eq3)

////PushInstruction("constant 0")
@SP // 2161
AM=M+1 // 2162
A=A-1 // 2163
M=0 // 2164

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq4 // 2165
D=A // 2166
@13 // 2167
M=D // 2168
@SP // 2169
AM=M-1 // 2170
D=M // 2171
A=A-1 // 2172
D=M-D // 2173
@DO_EQ // 2174
0;JMP // 2175
(COMPARE_Math.multiply_eq4)

////IfGotoInstruction{label='Math.multiply.IfElse2}
// if-goto Math.multiply.IfElse2
@SP // 2176
AM=M-1 // 2177
D=M // 2178
@Math.multiply.IfElse2 // 2179
D;JNE // 2180

////PushInstruction("argument 1")
@ARG // 2181
A=M+1 // 2182
D=M // 2183
@SP // 2184
AM=M+1 // 2185
A=A-1 // 2186
M=D // 2187

////ReturnInstruction{}
@RETURN // 2188
0;JMP // 2189

////GotoInstruction{label='Math.multiply.IfElseEND2}
// goto Math.multiply.IfElseEND2
@Math.multiply.IfElseEND2 // 2190
0;JMP // 2191

////LabelInstruction{label='Math.multiply.IfElse2}
// label Math.multiply.IfElse2
(Math.multiply.IfElse2)

////LabelInstruction{label='Math.multiply.IfElseEND2}
// label Math.multiply.IfElseEND2
(Math.multiply.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 2192
A=M+1 // 2193
D=M // 2194
@SP // 2195
AM=M+1 // 2196
A=A-1 // 2197
M=D // 2198

////PushInstruction("constant 1")
@SP // 2199
AM=M+1 // 2200
A=A-1 // 2201
M=1 // 2202

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq5 // 2203
D=A // 2204
@13 // 2205
M=D // 2206
@SP // 2207
AM=M-1 // 2208
D=M // 2209
A=A-1 // 2210
D=M-D // 2211
@DO_EQ // 2212
0;JMP // 2213
(COMPARE_Math.multiply_eq5)

////PushInstruction("constant 0")
@SP // 2214
AM=M+1 // 2215
A=A-1 // 2216
M=0 // 2217

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq6 // 2218
D=A // 2219
@13 // 2220
M=D // 2221
@SP // 2222
AM=M-1 // 2223
D=M // 2224
A=A-1 // 2225
D=M-D // 2226
@DO_EQ // 2227
0;JMP // 2228
(COMPARE_Math.multiply_eq6)

////IfGotoInstruction{label='Math.multiply.IfElse3}
// if-goto Math.multiply.IfElse3
@SP // 2229
AM=M-1 // 2230
D=M // 2231
@Math.multiply.IfElse3 // 2232
D;JNE // 2233

////PushInstruction("argument 0")
@ARG // 2234
A=M // 2235
D=M // 2236
@SP // 2237
AM=M+1 // 2238
A=A-1 // 2239
M=D // 2240

////ReturnInstruction{}
@RETURN // 2241
0;JMP // 2242

////GotoInstruction{label='Math.multiply.IfElseEND3}
// goto Math.multiply.IfElseEND3
@Math.multiply.IfElseEND3 // 2243
0;JMP // 2244

////LabelInstruction{label='Math.multiply.IfElse3}
// label Math.multiply.IfElse3
(Math.multiply.IfElse3)

////LabelInstruction{label='Math.multiply.IfElseEND3}
// label Math.multiply.IfElseEND3
(Math.multiply.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 2245
A=M // 2246
D=M // 2247
@SP // 2248
AM=M+1 // 2249
A=A-1 // 2250
M=D // 2251

////PushInstruction("constant 2")
@2 // 2252
D=A // 2253
@SP // 2254
AM=M+1 // 2255
A=A-1 // 2256
M=D // 2257

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq7 // 2258
D=A // 2259
@13 // 2260
M=D // 2261
@SP // 2262
AM=M-1 // 2263
D=M // 2264
A=A-1 // 2265
D=M-D // 2266
@DO_EQ // 2267
0;JMP // 2268
(COMPARE_Math.multiply_eq7)

////PushInstruction("constant 0")
@SP // 2269
AM=M+1 // 2270
A=A-1 // 2271
M=0 // 2272

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq8 // 2273
D=A // 2274
@13 // 2275
M=D // 2276
@SP // 2277
AM=M-1 // 2278
D=M // 2279
A=A-1 // 2280
D=M-D // 2281
@DO_EQ // 2282
0;JMP // 2283
(COMPARE_Math.multiply_eq8)

////IfGotoInstruction{label='Math.multiply.IfElse4}
// if-goto Math.multiply.IfElse4
@SP // 2284
AM=M-1 // 2285
D=M // 2286
@Math.multiply.IfElse4 // 2287
D;JNE // 2288

////PushInstruction("argument 1")
@ARG // 2289
A=M+1 // 2290
D=M // 2291
@SP // 2292
AM=M+1 // 2293
A=A-1 // 2294
M=D // 2295

////PushInstruction("argument 1")
@ARG // 2296
A=M+1 // 2297
D=M // 2298
@SP // 2299
AM=M+1 // 2300
A=A-1 // 2301
M=D // 2302

////ArithmeticInstruction{ADD}
@SP // 2303
AM=M-1 // 2304
D=M // 2305
A=A-1 // 2306
D=D+M // 2307

////ReturnInstruction{}
@RETURN // 2308
0;JMP // 2309

////GotoInstruction{label='Math.multiply.IfElseEND4}
// goto Math.multiply.IfElseEND4
@Math.multiply.IfElseEND4 // 2310
0;JMP // 2311

////LabelInstruction{label='Math.multiply.IfElse4}
// label Math.multiply.IfElse4
(Math.multiply.IfElse4)

////LabelInstruction{label='Math.multiply.IfElseEND4}
// label Math.multiply.IfElseEND4
(Math.multiply.IfElseEND4)

////PushInstruction("argument 1")
@ARG // 2312
A=M+1 // 2313
D=M // 2314
@SP // 2315
AM=M+1 // 2316
A=A-1 // 2317
M=D // 2318

////PushInstruction("constant 2")
@2 // 2319
D=A // 2320
@SP // 2321
AM=M+1 // 2322
A=A-1 // 2323
M=D // 2324

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq9 // 2325
D=A // 2326
@13 // 2327
M=D // 2328
@SP // 2329
AM=M-1 // 2330
D=M // 2331
A=A-1 // 2332
D=M-D // 2333
@DO_EQ // 2334
0;JMP // 2335
(COMPARE_Math.multiply_eq9)

////PushInstruction("constant 0")
@SP // 2336
AM=M+1 // 2337
A=A-1 // 2338
M=0 // 2339

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq10 // 2340
D=A // 2341
@13 // 2342
M=D // 2343
@SP // 2344
AM=M-1 // 2345
D=M // 2346
A=A-1 // 2347
D=M-D // 2348
@DO_EQ // 2349
0;JMP // 2350
(COMPARE_Math.multiply_eq10)

////IfGotoInstruction{label='Math.multiply.IfElse5}
// if-goto Math.multiply.IfElse5
@SP // 2351
AM=M-1 // 2352
D=M // 2353
@Math.multiply.IfElse5 // 2354
D;JNE // 2355

////PushInstruction("argument 0")
@ARG // 2356
A=M // 2357
D=M // 2358
@SP // 2359
AM=M+1 // 2360
A=A-1 // 2361
M=D // 2362

////PushInstruction("argument 0")
@ARG // 2363
A=M // 2364
D=M // 2365
@SP // 2366
AM=M+1 // 2367
A=A-1 // 2368
M=D // 2369

////ArithmeticInstruction{ADD}
@SP // 2370
AM=M-1 // 2371
D=M // 2372
A=A-1 // 2373
D=D+M // 2374

////ReturnInstruction{}
@RETURN // 2375
0;JMP // 2376

////GotoInstruction{label='Math.multiply.IfElseEND5}
// goto Math.multiply.IfElseEND5
@Math.multiply.IfElseEND5 // 2377
0;JMP // 2378

////LabelInstruction{label='Math.multiply.IfElse5}
// label Math.multiply.IfElse5
(Math.multiply.IfElse5)

////LabelInstruction{label='Math.multiply.IfElseEND5}
// label Math.multiply.IfElseEND5
(Math.multiply.IfElseEND5)

////PushInstruction("constant 1")
@SP // 2379
AM=M+1 // 2380
A=A-1 // 2381
M=1 // 2382

////PopInstruction{address=local 2}
@SP // 2383
AM=M-1 // 2384
D=M // 2385
@LCL // 2386
A=M+1 // 2387
A=A+1 // 2388
M=D // 2389

////LabelInstruction{label='WHILE_START_Math.multiply1}
// label WHILE_START_Math.multiply1
(WHILE_START_Math.multiply1)

////PushInstruction("local 1")
@LCL // 2390
A=M+1 // 2391
D=M // 2392
@SP // 2393
AM=M+1 // 2394
A=A-1 // 2395
M=D // 2396

////PushInstruction("constant 16")
@16 // 2397
D=A // 2398
@SP // 2399
AM=M+1 // 2400
A=A-1 // 2401
M=D // 2402

////ArithmeticInstruction{LT}
@COMPARE_Math.multiply_lt11 // 2403
D=A // 2404
@13 // 2405
M=D // 2406
@SP // 2407
AM=M-1 // 2408
D=M // 2409
A=A-1 // 2410
D=M-D // 2411
@DO_LT // 2412
0;JMP // 2413
(COMPARE_Math.multiply_lt11)

////PushInstruction("constant 0")
@SP // 2414
AM=M+1 // 2415
A=A-1 // 2416
M=0 // 2417

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq12 // 2418
D=A // 2419
@13 // 2420
M=D // 2421
@SP // 2422
AM=M-1 // 2423
D=M // 2424
A=A-1 // 2425
D=M-D // 2426
@DO_EQ // 2427
0;JMP // 2428
(COMPARE_Math.multiply_eq12)

////IfGotoInstruction{label='WHILE_END_Math.multiply1}
// if-goto WHILE_END_Math.multiply1
@SP // 2429
AM=M-1 // 2430
D=M // 2431
@WHILE_END_Math.multiply1 // 2432
D;JNE // 2433

////PushInstruction("argument 1")
@ARG // 2434
A=M+1 // 2435
D=M // 2436
@SP // 2437
AM=M+1 // 2438
A=A-1 // 2439
M=D // 2440

////PushInstruction("local 2")
@LCL // 2441
A=M+1 // 2442
A=A+1 // 2443
D=M // 2444
@SP // 2445
AM=M+1 // 2446
A=A-1 // 2447
M=D // 2448

////ArithmeticInstruction{AND}
@SP // 2449
AM=M-1 // 2450
D=M // 2451
A=A-1 // 2452
D=D&M // 2453

////PushInstruction("constant 0")
@SP // 2454
AM=M+1 // 2455
A=A-1 // 2456
M=0 // 2457

////ArithmeticInstruction{EQ}
@COMPARE_Math.multiply_eq13 // 2458
D=A // 2459
@13 // 2460
M=D // 2461
@SP // 2462
AM=M-1 // 2463
D=M // 2464
A=A-1 // 2465
D=M-D // 2466
@DO_EQ // 2467
0;JMP // 2468
(COMPARE_Math.multiply_eq13)

////IfGotoInstruction{label='Math.multiply.IfElse6}
// if-goto Math.multiply.IfElse6
@SP // 2469
AM=M-1 // 2470
D=M // 2471
@Math.multiply.IfElse6 // 2472
D;JNE // 2473

////PushInstruction("local 0")
@LCL // 2474
A=M // 2475
D=M // 2476
@SP // 2477
AM=M+1 // 2478
A=A-1 // 2479
M=D // 2480

////PushInstruction("argument 0")
@ARG // 2481
A=M // 2482
D=M // 2483
@SP // 2484
AM=M+1 // 2485
A=A-1 // 2486
M=D // 2487

////ArithmeticInstruction{ADD}
@SP // 2488
AM=M-1 // 2489
D=M // 2490
A=A-1 // 2491
D=D+M // 2492

////PopInstruction{address=local 0}
@SP // 2493
AM=M-1 // 2494
D=M // 2495
@LCL // 2496
A=M // 2497
M=D // 2498

////GotoInstruction{label='Math.multiply.IfElseEND6}
// goto Math.multiply.IfElseEND6
@Math.multiply.IfElseEND6 // 2499
0;JMP // 2500

////LabelInstruction{label='Math.multiply.IfElse6}
// label Math.multiply.IfElse6
(Math.multiply.IfElse6)

////LabelInstruction{label='Math.multiply.IfElseEND6}
// label Math.multiply.IfElseEND6
(Math.multiply.IfElseEND6)

////PushInstruction("argument 0")
@ARG // 2501
A=M // 2502
D=M // 2503
@SP // 2504
AM=M+1 // 2505
A=A-1 // 2506
M=D // 2507

////PushInstruction("argument 0")
@ARG // 2508
A=M // 2509
D=M // 2510
@SP // 2511
AM=M+1 // 2512
A=A-1 // 2513
M=D // 2514

////ArithmeticInstruction{ADD}
@SP // 2515
AM=M-1 // 2516
D=M // 2517
A=A-1 // 2518
D=D+M // 2519

////PopInstruction{address=argument 0}
@SP // 2520
AM=M-1 // 2521
D=M // 2522
@ARG // 2523
A=M // 2524
M=D // 2525

////PushInstruction("local 1")
@LCL // 2526
A=M+1 // 2527
D=M // 2528
@SP // 2529
AM=M+1 // 2530
A=A-1 // 2531
M=D // 2532

////PushInstruction("constant 1")
@SP // 2533
AM=M+1 // 2534
A=A-1 // 2535
M=1 // 2536

////ArithmeticInstruction{ADD}
@SP // 2537
AM=M-1 // 2538
D=M // 2539
A=A-1 // 2540
D=D+M // 2541

////PopInstruction{address=local 1}
@SP // 2542
AM=M-1 // 2543
D=M // 2544
@LCL // 2545
A=M+1 // 2546
M=D // 2547

////PushInstruction("local 2")
@LCL // 2548
A=M+1 // 2549
A=A+1 // 2550
D=M // 2551
@SP // 2552
AM=M+1 // 2553
A=A-1 // 2554
M=D // 2555

////PushInstruction("local 2")
@LCL // 2556
A=M+1 // 2557
A=A+1 // 2558
D=M // 2559
@SP // 2560
AM=M+1 // 2561
A=A-1 // 2562
M=D // 2563

////ArithmeticInstruction{ADD}
@SP // 2564
AM=M-1 // 2565
D=M // 2566
A=A-1 // 2567
D=D+M // 2568

////PopInstruction{address=local 2}
@SP // 2569
AM=M-1 // 2570
D=M // 2571
@LCL // 2572
A=M+1 // 2573
A=A+1 // 2574
M=D // 2575

////GotoInstruction{label='WHILE_START_Math.multiply1}
// goto WHILE_START_Math.multiply1
@WHILE_START_Math.multiply1 // 2576
0;JMP // 2577

////LabelInstruction{label='WHILE_END_Math.multiply1}
// label WHILE_END_Math.multiply1
(WHILE_END_Math.multiply1)

////PushInstruction("local 0")
@LCL // 2578
A=M // 2579
D=M // 2580
@SP // 2581
AM=M+1 // 2582
A=A-1 // 2583
M=D // 2584

////ReturnInstruction{}
@RETURN // 2585
0;JMP // 2586

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@SP // 2587
AM=M+1 // 2588
A=A-1 // 2589
M=0 // 2590
@SP // 2591
AM=M+1 // 2592
A=A-1 // 2593
M=0 // 2594
@SP // 2595
AM=M+1 // 2596
A=A-1 // 2597
M=0 // 2598

////PushInstruction("argument 0")
@ARG // 2599
A=M // 2600
D=M // 2601
@SP // 2602
AM=M+1 // 2603
A=A-1 // 2604
M=D // 2605

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 2606
D=A // 2607
@14 // 2608
M=D // 2609
@Math.abs // 2610
D=A // 2611
@13 // 2612
M=D // 2613
@Math.divide.ret.0 // 2614
D=A // 2615
@CALL // 2616
0;JMP // 2617
(Math.divide.ret.0)

////PopInstruction{address=local 2}
@SP // 2618
AM=M-1 // 2619
D=M // 2620
@LCL // 2621
A=M+1 // 2622
A=A+1 // 2623
M=D // 2624

////PushInstruction("argument 1")
@ARG // 2625
A=M+1 // 2626
D=M // 2627
@SP // 2628
AM=M+1 // 2629
A=A-1 // 2630
M=D // 2631

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Math.divide=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.abs
@6 // 2632
D=A // 2633
@14 // 2634
M=D // 2635
@Math.abs // 2636
D=A // 2637
@13 // 2638
M=D // 2639
@Math.divide.ret.1 // 2640
D=A // 2641
@CALL // 2642
0;JMP // 2643
(Math.divide.ret.1)

////PopInstruction{address=local 1}
@SP // 2644
AM=M-1 // 2645
D=M // 2646
@LCL // 2647
A=M+1 // 2648
M=D // 2649

////PushInstruction("argument 0")
@ARG // 2650
A=M // 2651
D=M // 2652
@SP // 2653
AM=M+1 // 2654
A=A-1 // 2655
M=D // 2656

////PushInstruction("constant 0")
@SP // 2657
AM=M+1 // 2658
A=A-1 // 2659
M=0 // 2660

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq14 // 2661
D=A // 2662
@13 // 2663
M=D // 2664
@SP // 2665
AM=M-1 // 2666
D=M // 2667
A=A-1 // 2668
D=M-D // 2669
@DO_EQ // 2670
0;JMP // 2671
(COMPARE_Math.divide_eq14)

////PushInstruction("local 1")
@LCL // 2672
A=M+1 // 2673
D=M // 2674
@SP // 2675
AM=M+1 // 2676
A=A-1 // 2677
M=D // 2678

////PushInstruction("local 2")
@LCL // 2679
A=M+1 // 2680
A=A+1 // 2681
D=M // 2682
@SP // 2683
AM=M+1 // 2684
A=A-1 // 2685
M=D // 2686

////ArithmeticInstruction{GT}
@COMPARE_Math.divide_gt15 // 2687
D=A // 2688
@13 // 2689
M=D // 2690
@SP // 2691
AM=M-1 // 2692
D=M // 2693
A=A-1 // 2694
D=M-D // 2695
@DO_GT // 2696
0;JMP // 2697
(COMPARE_Math.divide_gt15)

////ArithmeticInstruction{OR}
@SP // 2698
AM=M-1 // 2699
D=M // 2700
A=A-1 // 2701
D=D|M // 2702

////PushInstruction("constant 0")
@SP // 2703
AM=M+1 // 2704
A=A-1 // 2705
M=0 // 2706

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq16 // 2707
D=A // 2708
@13 // 2709
M=D // 2710
@SP // 2711
AM=M-1 // 2712
D=M // 2713
A=A-1 // 2714
D=M-D // 2715
@DO_EQ // 2716
0;JMP // 2717
(COMPARE_Math.divide_eq16)

////IfGotoInstruction{label='Math.divide.IfElse1}
// if-goto Math.divide.IfElse1
@SP // 2718
AM=M-1 // 2719
D=M // 2720
@Math.divide.IfElse1 // 2721
D;JNE // 2722

////PushInstruction("constant 0")
@SP // 2723
AM=M+1 // 2724
A=A-1 // 2725
M=0 // 2726

////ReturnInstruction{}
@RETURN // 2727
0;JMP // 2728

////GotoInstruction{label='Math.divide.IfElseEND1}
// goto Math.divide.IfElseEND1
@Math.divide.IfElseEND1 // 2729
0;JMP // 2730

////LabelInstruction{label='Math.divide.IfElse1}
// label Math.divide.IfElse1
(Math.divide.IfElse1)

////LabelInstruction{label='Math.divide.IfElseEND1}
// label Math.divide.IfElseEND1
(Math.divide.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 2731
A=M // 2732
D=M // 2733
@SP // 2734
AM=M+1 // 2735
A=A-1 // 2736
M=D // 2737

////PushInstruction("argument 1")
@ARG // 2738
A=M+1 // 2739
D=M // 2740
@SP // 2741
AM=M+1 // 2742
A=A-1 // 2743
M=D // 2744

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq17 // 2745
D=A // 2746
@13 // 2747
M=D // 2748
@SP // 2749
AM=M-1 // 2750
D=M // 2751
A=A-1 // 2752
D=M-D // 2753
@DO_EQ // 2754
0;JMP // 2755
(COMPARE_Math.divide_eq17)

////PushInstruction("constant 0")
@SP // 2756
AM=M+1 // 2757
A=A-1 // 2758
M=0 // 2759

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq18 // 2760
D=A // 2761
@13 // 2762
M=D // 2763
@SP // 2764
AM=M-1 // 2765
D=M // 2766
A=A-1 // 2767
D=M-D // 2768
@DO_EQ // 2769
0;JMP // 2770
(COMPARE_Math.divide_eq18)

////IfGotoInstruction{label='Math.divide.IfElse2}
// if-goto Math.divide.IfElse2
@SP // 2771
AM=M-1 // 2772
D=M // 2773
@Math.divide.IfElse2 // 2774
D;JNE // 2775

////PushInstruction("constant 1")
@SP // 2776
AM=M+1 // 2777
A=A-1 // 2778
M=1 // 2779

////ReturnInstruction{}
@RETURN // 2780
0;JMP // 2781

////GotoInstruction{label='Math.divide.IfElseEND2}
// goto Math.divide.IfElseEND2
@Math.divide.IfElseEND2 // 2782
0;JMP // 2783

////LabelInstruction{label='Math.divide.IfElse2}
// label Math.divide.IfElse2
(Math.divide.IfElse2)

////LabelInstruction{label='Math.divide.IfElseEND2}
// label Math.divide.IfElseEND2
(Math.divide.IfElseEND2)

////PushInstruction("argument 0")
@ARG // 2784
A=M // 2785
D=M // 2786
@SP // 2787
AM=M+1 // 2788
A=A-1 // 2789
M=D // 2790

////PushInstruction("constant 0")
@SP // 2791
AM=M+1 // 2792
A=A-1 // 2793
M=0 // 2794

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt19 // 2795
D=A // 2796
@13 // 2797
M=D // 2798
@SP // 2799
AM=M-1 // 2800
D=M // 2801
A=A-1 // 2802
D=M-D // 2803
@DO_LT // 2804
0;JMP // 2805
(COMPARE_Math.divide_lt19)

////PushInstruction("argument 1")
@ARG // 2806
A=M+1 // 2807
D=M // 2808
@SP // 2809
AM=M+1 // 2810
A=A-1 // 2811
M=D // 2812

////PushInstruction("constant 0")
@SP // 2813
AM=M+1 // 2814
A=A-1 // 2815
M=0 // 2816

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt20 // 2817
D=A // 2818
@13 // 2819
M=D // 2820
@SP // 2821
AM=M-1 // 2822
D=M // 2823
A=A-1 // 2824
D=M-D // 2825
@DO_LT // 2826
0;JMP // 2827
(COMPARE_Math.divide_lt20)

////ArithmeticInstruction{OR}
@SP // 2828
AM=M-1 // 2829
D=M // 2830
A=A-1 // 2831
D=D|M // 2832

////PushInstruction("constant 0")
@SP // 2833
AM=M+1 // 2834
A=A-1 // 2835
M=0 // 2836

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq21 // 2837
D=A // 2838
@13 // 2839
M=D // 2840
@SP // 2841
AM=M-1 // 2842
D=M // 2843
A=A-1 // 2844
D=M-D // 2845
@DO_EQ // 2846
0;JMP // 2847
(COMPARE_Math.divide_eq21)

////IfGotoInstruction{label='Math.divide.IfElse3}
// if-goto Math.divide.IfElse3
@SP // 2848
AM=M-1 // 2849
D=M // 2850
@Math.divide.IfElse3 // 2851
D;JNE // 2852

////PushInstruction("local 2")
@LCL // 2853
A=M+1 // 2854
A=A+1 // 2855
D=M // 2856
@SP // 2857
AM=M+1 // 2858
A=A-1 // 2859
M=D // 2860

////PushInstruction("local 1")
@LCL // 2861
A=M+1 // 2862
D=M // 2863
@SP // 2864
AM=M+1 // 2865
A=A-1 // 2866
M=D // 2867

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=2, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 2868
D=A // 2869
@14 // 2870
M=D // 2871
@Math.divide // 2872
D=A // 2873
@13 // 2874
M=D // 2875
@Math.divide.ret.2 // 2876
D=A // 2877
@CALL // 2878
0;JMP // 2879
(Math.divide.ret.2)

////PopInstruction{address=local 0}
@SP // 2880
AM=M-1 // 2881
D=M // 2882
@LCL // 2883
A=M // 2884
M=D // 2885

////PushInstruction("argument 0")
@ARG // 2886
A=M // 2887
D=M // 2888
@SP // 2889
AM=M+1 // 2890
A=A-1 // 2891
M=D // 2892

////PushInstruction("constant 0")
@SP // 2893
AM=M+1 // 2894
A=A-1 // 2895
M=0 // 2896

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt22 // 2897
D=A // 2898
@13 // 2899
M=D // 2900
@SP // 2901
AM=M-1 // 2902
D=M // 2903
A=A-1 // 2904
D=M-D // 2905
@DO_LT // 2906
0;JMP // 2907
(COMPARE_Math.divide_lt22)

////PushInstruction("argument 1")
@ARG // 2908
A=M+1 // 2909
D=M // 2910
@SP // 2911
AM=M+1 // 2912
A=A-1 // 2913
M=D // 2914

////PushInstruction("constant 0")
@SP // 2915
AM=M+1 // 2916
A=A-1 // 2917
M=0 // 2918

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt23 // 2919
D=A // 2920
@13 // 2921
M=D // 2922
@SP // 2923
AM=M-1 // 2924
D=M // 2925
A=A-1 // 2926
D=M-D // 2927
@DO_LT // 2928
0;JMP // 2929
(COMPARE_Math.divide_lt23)

////ArithmeticInstruction{AND}
@SP // 2930
AM=M-1 // 2931
D=M // 2932
A=A-1 // 2933
D=D&M // 2934

////PushInstruction("constant 0")
@SP // 2935
AM=M+1 // 2936
A=A-1 // 2937
M=0 // 2938

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq24 // 2939
D=A // 2940
@13 // 2941
M=D // 2942
@SP // 2943
AM=M-1 // 2944
D=M // 2945
A=A-1 // 2946
D=M-D // 2947
@DO_EQ // 2948
0;JMP // 2949
(COMPARE_Math.divide_eq24)

////IfGotoInstruction{label='Math.divide.IfElse4}
// if-goto Math.divide.IfElse4
@SP // 2950
AM=M-1 // 2951
D=M // 2952
@Math.divide.IfElse4 // 2953
D;JNE // 2954

////PushInstruction("local 0")
@LCL // 2955
A=M // 2956
D=M // 2957
@SP // 2958
AM=M+1 // 2959
A=A-1 // 2960
M=D // 2961

////ReturnInstruction{}
@RETURN // 2962
0;JMP // 2963

////GotoInstruction{label='Math.divide.IfElseEND4}
// goto Math.divide.IfElseEND4
@Math.divide.IfElseEND4 // 2964
0;JMP // 2965

////LabelInstruction{label='Math.divide.IfElse4}
// label Math.divide.IfElse4
(Math.divide.IfElse4)

////LabelInstruction{label='Math.divide.IfElseEND4}
// label Math.divide.IfElseEND4
(Math.divide.IfElseEND4)

////PushInstruction("local 0")
@LCL // 2966
A=M // 2967
D=M // 2968
@SP // 2969
AM=M+1 // 2970
A=A-1 // 2971
M=D // 2972

////ArithmeticInstruction{NEG}
@SP // 2973
A=M-1 // 2974
M=-M // 2975

////ReturnInstruction{}
@RETURN // 2976
0;JMP // 2977

////GotoInstruction{label='Math.divide.IfElseEND3}
// goto Math.divide.IfElseEND3
@Math.divide.IfElseEND3 // 2978
0;JMP // 2979

////LabelInstruction{label='Math.divide.IfElse3}
// label Math.divide.IfElse3
(Math.divide.IfElse3)

////LabelInstruction{label='Math.divide.IfElseEND3}
// label Math.divide.IfElseEND3
(Math.divide.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 2980
A=M // 2981
D=M // 2982
@SP // 2983
AM=M+1 // 2984
A=A-1 // 2985
M=D // 2986

////PushInstruction("argument 1")
@ARG // 2987
A=M+1 // 2988
D=M // 2989
@SP // 2990
AM=M+1 // 2991
A=A-1 // 2992
M=D // 2993

////PushInstruction("argument 1")
@ARG // 2994
A=M+1 // 2995
D=M // 2996
@SP // 2997
AM=M+1 // 2998
A=A-1 // 2999
M=D // 3000

////ArithmeticInstruction{ADD}
@SP // 3001
AM=M-1 // 3002
D=M // 3003
A=A-1 // 3004
D=D+M // 3005

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=3, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.divide
@7 // 3006
D=A // 3007
@14 // 3008
M=D // 3009
@Math.divide // 3010
D=A // 3011
@13 // 3012
M=D // 3013
@Math.divide.ret.3 // 3014
D=A // 3015
@CALL // 3016
0;JMP // 3017
(Math.divide.ret.3)

////PopInstruction{address=local 0}
@SP // 3018
AM=M-1 // 3019
D=M // 3020
@LCL // 3021
A=M // 3022
M=D // 3023

////PushInstruction("argument 0")
@ARG // 3024
A=M // 3025
D=M // 3026
@SP // 3027
AM=M+1 // 3028
A=A-1 // 3029
M=D // 3030

////PushInstruction("local 0")
@LCL // 3031
A=M // 3032
D=M // 3033
@SP // 3034
AM=M+1 // 3035
A=A-1 // 3036
M=D // 3037

////PushInstruction("local 0")
@LCL // 3038
A=M // 3039
D=M // 3040
@SP // 3041
AM=M+1 // 3042
A=A-1 // 3043
M=D // 3044

////ArithmeticInstruction{ADD}
@SP // 3045
AM=M-1 // 3046
D=M // 3047
A=A-1 // 3048
D=D+M // 3049

////PushInstruction("argument 1")
@ARG // 3050
A=M+1 // 3051
D=M // 3052
@SP // 3053
AM=M+1 // 3054
A=A-1 // 3055
M=D // 3056

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=4, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.divide'}
// call Math.multiply
@7 // 3057
D=A // 3058
@14 // 3059
M=D // 3060
@Math.multiply // 3061
D=A // 3062
@13 // 3063
M=D // 3064
@Math.divide.ret.4 // 3065
D=A // 3066
@CALL // 3067
0;JMP // 3068
(Math.divide.ret.4)

////ArithmeticInstruction{SUB}
@SP // 3069
AM=M-1 // 3070
D=M // 3071
A=A-1 // 3072
D=M-D // 3073

////PushInstruction("argument 1")
@ARG // 3074
A=M+1 // 3075
D=M // 3076
@SP // 3077
AM=M+1 // 3078
A=A-1 // 3079
M=D // 3080

////ArithmeticInstruction{LT}
@COMPARE_Math.divide_lt25 // 3081
D=A // 3082
@13 // 3083
M=D // 3084
@SP // 3085
AM=M-1 // 3086
D=M // 3087
A=A-1 // 3088
D=M-D // 3089
@DO_LT // 3090
0;JMP // 3091
(COMPARE_Math.divide_lt25)

////PushInstruction("constant 0")
@SP // 3092
AM=M+1 // 3093
A=A-1 // 3094
M=0 // 3095

////ArithmeticInstruction{EQ}
@COMPARE_Math.divide_eq26 // 3096
D=A // 3097
@13 // 3098
M=D // 3099
@SP // 3100
AM=M-1 // 3101
D=M // 3102
A=A-1 // 3103
D=M-D // 3104
@DO_EQ // 3105
0;JMP // 3106
(COMPARE_Math.divide_eq26)

////IfGotoInstruction{label='Math.divide.IfElse5}
// if-goto Math.divide.IfElse5
@SP // 3107
AM=M-1 // 3108
D=M // 3109
@Math.divide.IfElse5 // 3110
D;JNE // 3111

////PushInstruction("local 0")
@LCL // 3112
A=M // 3113
D=M // 3114
@SP // 3115
AM=M+1 // 3116
A=A-1 // 3117
M=D // 3118

////PushInstruction("local 0")
@LCL // 3119
A=M // 3120
D=M // 3121
@SP // 3122
AM=M+1 // 3123
A=A-1 // 3124
M=D // 3125

////ArithmeticInstruction{ADD}
@SP // 3126
AM=M-1 // 3127
D=M // 3128
A=A-1 // 3129
D=D+M // 3130

////ReturnInstruction{}
@RETURN // 3131
0;JMP // 3132

////GotoInstruction{label='Math.divide.IfElseEND5}
// goto Math.divide.IfElseEND5
@Math.divide.IfElseEND5 // 3133
0;JMP // 3134

////LabelInstruction{label='Math.divide.IfElse5}
// label Math.divide.IfElse5
(Math.divide.IfElse5)

////LabelInstruction{label='Math.divide.IfElseEND5}
// label Math.divide.IfElseEND5
(Math.divide.IfElseEND5)

////PushInstruction("local 0")
@LCL // 3135
A=M // 3136
D=M // 3137
@SP // 3138
AM=M+1 // 3139
A=A-1 // 3140
M=D // 3141

////PushInstruction("local 0")
@LCL // 3142
A=M // 3143
D=M // 3144
@SP // 3145
AM=M+1 // 3146
A=A-1 // 3147
M=D // 3148

////ArithmeticInstruction{ADD}
@SP // 3149
AM=M-1 // 3150
D=M // 3151
A=A-1 // 3152
D=D+M // 3153

////PushInstruction("constant 1")
@SP // 3154
AM=M+1 // 3155
A=A-1 // 3156
M=1 // 3157

////ArithmeticInstruction{ADD}
@SP // 3158
AM=M-1 // 3159
D=M // 3160
A=A-1 // 3161
D=D+M // 3162

////ReturnInstruction{}
@RETURN // 3163
0;JMP // 3164

////FunctionInstruction{functionName='Math.mod', numLocals=0, funcMapping={Math.divide=5, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.mod with 0
(Math.mod)

////PushInstruction("argument 0")
@ARG // 3165
A=M // 3166
D=M // 3167
@SP // 3168
AM=M+1 // 3169
A=A-1 // 3170
M=D // 3171

////PushInstruction("argument 0")
@ARG // 3172
A=M // 3173
D=M // 3174
@SP // 3175
AM=M+1 // 3176
A=A-1 // 3177
M=D // 3178

////PushInstruction("argument 1")
@ARG // 3179
A=M+1 // 3180
D=M // 3181
@SP // 3182
AM=M+1 // 3183
A=A-1 // 3184
M=D // 3185

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Math.divide=5, Math.mod=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.divide
@7 // 3186
D=A // 3187
@14 // 3188
M=D // 3189
@Math.divide // 3190
D=A // 3191
@13 // 3192
M=D // 3193
@Math.mod.ret.0 // 3194
D=A // 3195
@CALL // 3196
0;JMP // 3197
(Math.mod.ret.0)

////PushInstruction("argument 1")
@ARG // 3198
A=M+1 // 3199
D=M // 3200
@SP // 3201
AM=M+1 // 3202
A=A-1 // 3203
M=D // 3204

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=1, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.mod'}
// call Math.multiply
@7 // 3205
D=A // 3206
@14 // 3207
M=D // 3208
@Math.multiply // 3209
D=A // 3210
@13 // 3211
M=D // 3212
@Math.mod.ret.1 // 3213
D=A // 3214
@CALL // 3215
0;JMP // 3216
(Math.mod.ret.1)

////ArithmeticInstruction{SUB}
@SP // 3217
AM=M-1 // 3218
D=M // 3219
A=A-1 // 3220
D=M-D // 3221

////ReturnInstruction{}
@RETURN // 3222
0;JMP // 3223

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.twoToThe with 0
(Math.twoToThe)

////PushInstruction("static 0")
@Math.0 // 3224
D=M // 3225
@SP // 3226
AM=M+1 // 3227
A=A-1 // 3228
M=D // 3229

////PushInstruction("argument 0")
@ARG // 3230
A=M // 3231
D=M // 3232
@SP // 3233
AM=M+1 // 3234
A=A-1 // 3235
M=D // 3236

////ArithmeticInstruction{ADD}
@SP // 3237
AM=M-1 // 3238
D=M // 3239
A=A-1 // 3240
D=D+M // 3241

////PopInstruction{address=pointer 1}
@SP // 3242
AM=M-1 // 3243
D=M // 3244
@4 // 3245
M=D // 3246

////PushInstruction("that 0")
@THAT // 3247
A=M // 3248
D=M // 3249
@SP // 3250
AM=M+1 // 3251
A=A-1 // 3252
M=D // 3253

////ReturnInstruction{}
@RETURN // 3254
0;JMP // 3255

////FunctionInstruction{functionName='Math.sqrt', numLocals=4, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.sqrt with 4
(Math.sqrt)
@SP // 3256
AM=M+1 // 3257
A=A-1 // 3258
M=0 // 3259
@SP // 3260
AM=M+1 // 3261
A=A-1 // 3262
M=0 // 3263
@SP // 3264
AM=M+1 // 3265
A=A-1 // 3266
M=0 // 3267
@SP // 3268
AM=M+1 // 3269
A=A-1 // 3270
M=0 // 3271

////PushInstruction("constant 0")
@SP // 3272
AM=M+1 // 3273
A=A-1 // 3274
M=0 // 3275

////PopInstruction{address=local 0}
@SP // 3276
AM=M-1 // 3277
D=M // 3278
@LCL // 3279
A=M // 3280
M=D // 3281

////PushInstruction("constant 7")
@7 // 3282
D=A // 3283
@SP // 3284
AM=M+1 // 3285
A=A-1 // 3286
M=D // 3287

////PopInstruction{address=local 1}
@SP // 3288
AM=M-1 // 3289
D=M // 3290
@LCL // 3291
A=M+1 // 3292
M=D // 3293

////LabelInstruction{label='WHILE_START_Math.sqrt1}
// label WHILE_START_Math.sqrt1
(WHILE_START_Math.sqrt1)

////PushInstruction("local 1")
@LCL // 3294
A=M+1 // 3295
D=M // 3296
@SP // 3297
AM=M+1 // 3298
A=A-1 // 3299
M=D // 3300

////PushInstruction("constant 0")
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=0 // 3304

////ArithmeticInstruction{LT}
@COMPARE_Math.sqrt_lt27 // 3305
D=A // 3306
@13 // 3307
M=D // 3308
@SP // 3309
AM=M-1 // 3310
D=M // 3311
A=A-1 // 3312
D=M-D // 3313
@DO_LT // 3314
0;JMP // 3315
(COMPARE_Math.sqrt_lt27)

////ArithmeticInstruction{NOT}
@SP // 3316
A=M-1 // 3317
M=!M // 3318

////PushInstruction("constant 0")
@SP // 3319
AM=M+1 // 3320
A=A-1 // 3321
M=0 // 3322

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq28 // 3323
D=A // 3324
@13 // 3325
M=D // 3326
@SP // 3327
AM=M-1 // 3328
D=M // 3329
A=A-1 // 3330
D=M-D // 3331
@DO_EQ // 3332
0;JMP // 3333
(COMPARE_Math.sqrt_eq28)

////IfGotoInstruction{label='WHILE_END_Math.sqrt1}
// if-goto WHILE_END_Math.sqrt1
@SP // 3334
AM=M-1 // 3335
D=M // 3336
@WHILE_END_Math.sqrt1 // 3337
D;JNE // 3338

////PushInstruction("local 0")
@LCL // 3339
A=M // 3340
D=M // 3341
@SP // 3342
AM=M+1 // 3343
A=A-1 // 3344
M=D // 3345

////PushInstruction("static 0")
@Math.0 // 3346
D=M // 3347
@SP // 3348
AM=M+1 // 3349
A=A-1 // 3350
M=D // 3351

////PushInstruction("local 1")
@LCL // 3352
A=M+1 // 3353
D=M // 3354
@SP // 3355
AM=M+1 // 3356
A=A-1 // 3357
M=D // 3358

////ArithmeticInstruction{ADD}
@SP // 3359
AM=M-1 // 3360
D=M // 3361
A=A-1 // 3362
D=D+M // 3363

////PopInstruction{address=pointer 1}
@SP // 3364
AM=M-1 // 3365
D=M // 3366
@4 // 3367
M=D // 3368

////PushInstruction("that 0")
@THAT // 3369
A=M // 3370
D=M // 3371
@SP // 3372
AM=M+1 // 3373
A=A-1 // 3374
M=D // 3375

////ArithmeticInstruction{ADD}
@SP // 3376
AM=M-1 // 3377
D=M // 3378
A=A-1 // 3379
D=D+M // 3380

////PopInstruction{address=local 2}
@SP // 3381
AM=M-1 // 3382
D=M // 3383
@LCL // 3384
A=M+1 // 3385
A=A+1 // 3386
M=D // 3387

////PushInstruction("local 2")
@LCL // 3388
A=M+1 // 3389
A=A+1 // 3390
D=M // 3391
@SP // 3392
AM=M+1 // 3393
A=A-1 // 3394
M=D // 3395

////PushInstruction("local 2")
@LCL // 3396
A=M+1 // 3397
A=A+1 // 3398
D=M // 3399
@SP // 3400
AM=M+1 // 3401
A=A-1 // 3402
M=D // 3403

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.sqrt'}
// call Math.multiply
@7 // 3404
D=A // 3405
@14 // 3406
M=D // 3407
@Math.multiply // 3408
D=A // 3409
@13 // 3410
M=D // 3411
@Math.sqrt.ret.0 // 3412
D=A // 3413
@CALL // 3414
0;JMP // 3415
(Math.sqrt.ret.0)

////PopInstruction{address=local 3}
@SP // 3416
AM=M-1 // 3417
D=M // 3418
@LCL // 3419
A=M+1 // 3420
A=A+1 // 3421
A=A+1 // 3422
M=D // 3423

////PushInstruction("local 3")
@LCL // 3424
A=M+1 // 3425
A=A+1 // 3426
A=A+1 // 3427
D=M // 3428
@SP // 3429
AM=M+1 // 3430
A=A-1 // 3431
M=D // 3432

////PushInstruction("argument 0")
@ARG // 3433
A=M // 3434
D=M // 3435
@SP // 3436
AM=M+1 // 3437
A=A-1 // 3438
M=D // 3439

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt29 // 3440
D=A // 3441
@13 // 3442
M=D // 3443
@SP // 3444
AM=M-1 // 3445
D=M // 3446
A=A-1 // 3447
D=M-D // 3448
@DO_GT // 3449
0;JMP // 3450
(COMPARE_Math.sqrt_gt29)

////ArithmeticInstruction{NOT}
@SP // 3451
A=M-1 // 3452
M=!M // 3453

////PushInstruction("local 3")
@LCL // 3454
A=M+1 // 3455
A=A+1 // 3456
A=A+1 // 3457
D=M // 3458
@SP // 3459
AM=M+1 // 3460
A=A-1 // 3461
M=D // 3462

////PushInstruction("constant 0")
@SP // 3463
AM=M+1 // 3464
A=A-1 // 3465
M=0 // 3466

////ArithmeticInstruction{GT}
@COMPARE_Math.sqrt_gt30 // 3467
D=A // 3468
@13 // 3469
M=D // 3470
@SP // 3471
AM=M-1 // 3472
D=M // 3473
A=A-1 // 3474
D=M-D // 3475
@DO_GT // 3476
0;JMP // 3477
(COMPARE_Math.sqrt_gt30)

////ArithmeticInstruction{AND}
@SP // 3478
AM=M-1 // 3479
D=M // 3480
A=A-1 // 3481
D=D&M // 3482

////PushInstruction("constant 0")
@SP // 3483
AM=M+1 // 3484
A=A-1 // 3485
M=0 // 3486

////ArithmeticInstruction{EQ}
@COMPARE_Math.sqrt_eq31 // 3487
D=A // 3488
@13 // 3489
M=D // 3490
@SP // 3491
AM=M-1 // 3492
D=M // 3493
A=A-1 // 3494
D=M-D // 3495
@DO_EQ // 3496
0;JMP // 3497
(COMPARE_Math.sqrt_eq31)

////IfGotoInstruction{label='Math.sqrt.IfElse1}
// if-goto Math.sqrt.IfElse1
@SP // 3498
AM=M-1 // 3499
D=M // 3500
@Math.sqrt.IfElse1 // 3501
D;JNE // 3502

////PushInstruction("local 2")
@LCL // 3503
A=M+1 // 3504
A=A+1 // 3505
D=M // 3506
@SP // 3507
AM=M+1 // 3508
A=A-1 // 3509
M=D // 3510

////PopInstruction{address=local 0}
@SP // 3511
AM=M-1 // 3512
D=M // 3513
@LCL // 3514
A=M // 3515
M=D // 3516

////GotoInstruction{label='Math.sqrt.IfElseEND1}
// goto Math.sqrt.IfElseEND1
@Math.sqrt.IfElseEND1 // 3517
0;JMP // 3518

////LabelInstruction{label='Math.sqrt.IfElse1}
// label Math.sqrt.IfElse1
(Math.sqrt.IfElse1)

////LabelInstruction{label='Math.sqrt.IfElseEND1}
// label Math.sqrt.IfElseEND1
(Math.sqrt.IfElseEND1)

////PushInstruction("local 1")
@LCL // 3519
A=M+1 // 3520
D=M // 3521
@SP // 3522
AM=M+1 // 3523
A=A-1 // 3524
M=D // 3525

////PushInstruction("constant 1")
@SP // 3526
AM=M+1 // 3527
A=A-1 // 3528
M=1 // 3529

////ArithmeticInstruction{SUB}
@SP // 3530
AM=M-1 // 3531
D=M // 3532
A=A-1 // 3533
D=M-D // 3534

////PopInstruction{address=local 1}
@SP // 3535
AM=M-1 // 3536
D=M // 3537
@LCL // 3538
A=M+1 // 3539
M=D // 3540

////GotoInstruction{label='WHILE_START_Math.sqrt1}
// goto WHILE_START_Math.sqrt1
@WHILE_START_Math.sqrt1 // 3541
0;JMP // 3542

////LabelInstruction{label='WHILE_END_Math.sqrt1}
// label WHILE_END_Math.sqrt1
(WHILE_END_Math.sqrt1)

////PushInstruction("local 0")
@LCL // 3543
A=M // 3544
D=M // 3545
@SP // 3546
AM=M+1 // 3547
A=A-1 // 3548
M=D // 3549

////ReturnInstruction{}
@RETURN // 3550
0;JMP // 3551

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////PushInstruction("argument 0")
@ARG // 3552
A=M // 3553
D=M // 3554
@SP // 3555
AM=M+1 // 3556
A=A-1 // 3557
M=D // 3558

////PushInstruction("argument 1")
@ARG // 3559
A=M+1 // 3560
D=M // 3561
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=D // 3565

////ArithmeticInstruction{GT}
@COMPARE_Math.max_gt32 // 3566
D=A // 3567
@13 // 3568
M=D // 3569
@SP // 3570
AM=M-1 // 3571
D=M // 3572
A=A-1 // 3573
D=M-D // 3574
@DO_GT // 3575
0;JMP // 3576
(COMPARE_Math.max_gt32)

////PushInstruction("constant 0")
@SP // 3577
AM=M+1 // 3578
A=A-1 // 3579
M=0 // 3580

////ArithmeticInstruction{EQ}
@COMPARE_Math.max_eq33 // 3581
D=A // 3582
@13 // 3583
M=D // 3584
@SP // 3585
AM=M-1 // 3586
D=M // 3587
A=A-1 // 3588
D=M-D // 3589
@DO_EQ // 3590
0;JMP // 3591
(COMPARE_Math.max_eq33)

////IfGotoInstruction{label='Math.max.IfElse1}
// if-goto Math.max.IfElse1
@SP // 3592
AM=M-1 // 3593
D=M // 3594
@Math.max.IfElse1 // 3595
D;JNE // 3596

////PushInstruction("argument 0")
@ARG // 3597
A=M // 3598
D=M // 3599
@SP // 3600
AM=M+1 // 3601
A=A-1 // 3602
M=D // 3603

////ReturnInstruction{}
@RETURN // 3604
0;JMP // 3605

////GotoInstruction{label='Math.max.IfElseEND1}
// goto Math.max.IfElseEND1
@Math.max.IfElseEND1 // 3606
0;JMP // 3607

////LabelInstruction{label='Math.max.IfElse1}
// label Math.max.IfElse1
(Math.max.IfElse1)

////LabelInstruction{label='Math.max.IfElseEND1}
// label Math.max.IfElseEND1
(Math.max.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 3608
A=M+1 // 3609
D=M // 3610
@SP // 3611
AM=M+1 // 3612
A=A-1 // 3613
M=D // 3614

////ReturnInstruction{}
@RETURN // 3615
0;JMP // 3616

////FunctionInstruction{functionName='Math.min', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.min with 0
(Math.min)

////PushInstruction("argument 0")
@ARG // 3617
A=M // 3618
D=M // 3619
@SP // 3620
AM=M+1 // 3621
A=A-1 // 3622
M=D // 3623

////PushInstruction("argument 1")
@ARG // 3624
A=M+1 // 3625
D=M // 3626
@SP // 3627
AM=M+1 // 3628
A=A-1 // 3629
M=D // 3630

////ArithmeticInstruction{LT}
@COMPARE_Math.min_lt34 // 3631
D=A // 3632
@13 // 3633
M=D // 3634
@SP // 3635
AM=M-1 // 3636
D=M // 3637
A=A-1 // 3638
D=M-D // 3639
@DO_LT // 3640
0;JMP // 3641
(COMPARE_Math.min_lt34)

////PushInstruction("constant 0")
@SP // 3642
AM=M+1 // 3643
A=A-1 // 3644
M=0 // 3645

////ArithmeticInstruction{EQ}
@COMPARE_Math.min_eq35 // 3646
D=A // 3647
@13 // 3648
M=D // 3649
@SP // 3650
AM=M-1 // 3651
D=M // 3652
A=A-1 // 3653
D=M-D // 3654
@DO_EQ // 3655
0;JMP // 3656
(COMPARE_Math.min_eq35)

////IfGotoInstruction{label='Math.min.IfElse1}
// if-goto Math.min.IfElse1
@SP // 3657
AM=M-1 // 3658
D=M // 3659
@Math.min.IfElse1 // 3660
D;JNE // 3661

////PushInstruction("argument 0")
@ARG // 3662
A=M // 3663
D=M // 3664
@SP // 3665
AM=M+1 // 3666
A=A-1 // 3667
M=D // 3668

////ReturnInstruction{}
@RETURN // 3669
0;JMP // 3670

////GotoInstruction{label='Math.min.IfElseEND1}
// goto Math.min.IfElseEND1
@Math.min.IfElseEND1 // 3671
0;JMP // 3672

////LabelInstruction{label='Math.min.IfElse1}
// label Math.min.IfElse1
(Math.min.IfElse1)

////LabelInstruction{label='Math.min.IfElseEND1}
// label Math.min.IfElseEND1
(Math.min.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 3673
A=M+1 // 3674
D=M // 3675
@SP // 3676
AM=M+1 // 3677
A=A-1 // 3678
M=D // 3679

////ReturnInstruction{}
@RETURN // 3680
0;JMP // 3681

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}}
// function Math.abs with 0
(Math.abs)

////PushInstruction("argument 0")
@ARG // 3682
A=M // 3683
D=M // 3684
@SP // 3685
AM=M+1 // 3686
A=A-1 // 3687
M=D // 3688

////PushInstruction("argument 0")
@ARG // 3689
A=M // 3690
D=M // 3691
@SP // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=D // 3695

////ArithmeticInstruction{NEG}
@SP // 3696
A=M-1 // 3697
M=-M // 3698

////CallInstruction{calleeFunction='Math.max', numArgs=2, funcMapping={Math.divide=5, Math.mod=2, Math.min=0, Math.abs=0, Math.twoToThe=0, Math.sqrt=1, Math.max=0, Math.init=1, Math.bit=0, Math.multiply=0}, currentFunction='Math.abs'}
// call Math.max
@7 // 3699
D=A // 3700
@14 // 3701
M=D // 3702
@Math.max // 3703
D=A // 3704
@13 // 3705
M=D // 3706
@Math.abs.ret.0 // 3707
D=A // 3708
@CALL // 3709
0;JMP // 3710
(Math.abs.ret.0)

////ReturnInstruction{}
@RETURN // 3711
0;JMP // 3712

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={}}
// function Memory.init with 2
(Memory.init)
@SP // 3713
AM=M+1 // 3714
A=A-1 // 3715
M=0 // 3716
@SP // 3717
AM=M+1 // 3718
A=A-1 // 3719
M=0 // 3720

////PushInstruction("constant 2048")
@2048 // 3721
D=A // 3722
@SP // 3723
AM=M+1 // 3724
A=A-1 // 3725
M=D // 3726

////PushInstruction("constant 7")
@7 // 3727
D=A // 3728
@SP // 3729
AM=M+1 // 3730
A=A-1 // 3731
M=D // 3732

////ArithmeticInstruction{ADD}
@SP // 3733
AM=M-1 // 3734
D=M // 3735
A=A-1 // 3736
D=D+M // 3737

////PopInstruction{address=local 0}
@SP // 3738
AM=M-1 // 3739
D=M // 3740
@LCL // 3741
A=M // 3742
M=D // 3743

////PushInstruction("constant 16384")
@16384 // 3744
D=A // 3745
@SP // 3746
AM=M+1 // 3747
A=A-1 // 3748
M=D // 3749

////PushInstruction("local 0")
@LCL // 3750
A=M // 3751
D=M // 3752
@SP // 3753
AM=M+1 // 3754
A=A-1 // 3755
M=D // 3756

////ArithmeticInstruction{SUB}
@SP // 3757
AM=M-1 // 3758
D=M // 3759
A=A-1 // 3760
D=M-D // 3761

////PushInstruction("constant 5")
@5 // 3762
D=A // 3763
@SP // 3764
AM=M+1 // 3765
A=A-1 // 3766
M=D // 3767

////ArithmeticInstruction{SUB}
@SP // 3768
AM=M-1 // 3769
D=M // 3770
A=A-1 // 3771
D=M-D // 3772

////PushInstruction("local 0")
@LCL // 3773
A=M // 3774
D=M // 3775
@SP // 3776
AM=M+1 // 3777
A=A-1 // 3778
M=D // 3779

////PushInstruction("constant 0")
@SP // 3780
AM=M+1 // 3781
A=A-1 // 3782
M=0 // 3783

////ArithmeticInstruction{ADD}
@SP // 3784
AM=M-1 // 3785
D=M // 3786
A=A-1 // 3787
D=D+M // 3788

////PopInstruction{address=pointer 1}
@SP // 3789
AM=M-1 // 3790
D=M // 3791
@4 // 3792
M=D // 3793

////PopInstruction{address=that 0}
@SP // 3794
AM=M-1 // 3795
D=M // 3796
@THAT // 3797
A=M // 3798
M=D // 3799

////PushInstruction("constant 1")
@SP // 3800
AM=M+1 // 3801
A=A-1 // 3802
M=1 // 3803

////PushInstruction("local 0")
@LCL // 3804
A=M // 3805
D=M // 3806
@SP // 3807
AM=M+1 // 3808
A=A-1 // 3809
M=D // 3810

////PushInstruction("constant 1")
@SP // 3811
AM=M+1 // 3812
A=A-1 // 3813
M=1 // 3814

////ArithmeticInstruction{ADD}
@SP // 3815
AM=M-1 // 3816
D=M // 3817
A=A-1 // 3818
D=D+M // 3819

////PopInstruction{address=pointer 1}
@SP // 3820
AM=M-1 // 3821
D=M // 3822
@4 // 3823
M=D // 3824

////PopInstruction{address=that 0}
@SP // 3825
AM=M-1 // 3826
D=M // 3827
@THAT // 3828
A=M // 3829
M=D // 3830

////PushInstruction("constant 0")
@SP // 3831
AM=M+1 // 3832
A=A-1 // 3833
M=0 // 3834

////PushInstruction("local 0")
@LCL // 3835
A=M // 3836
D=M // 3837
@SP // 3838
AM=M+1 // 3839
A=A-1 // 3840
M=D // 3841

////PushInstruction("constant 2")
@2 // 3842
D=A // 3843
@SP // 3844
AM=M+1 // 3845
A=A-1 // 3846
M=D // 3847

////ArithmeticInstruction{ADD}
@SP // 3848
AM=M-1 // 3849
D=M // 3850
A=A-1 // 3851
D=D+M // 3852

////PopInstruction{address=pointer 1}
@SP // 3853
AM=M-1 // 3854
D=M // 3855
@4 // 3856
M=D // 3857

////PopInstruction{address=that 0}
@SP // 3858
AM=M-1 // 3859
D=M // 3860
@THAT // 3861
A=M // 3862
M=D // 3863

////PushInstruction("constant 0")
@SP // 3864
AM=M+1 // 3865
A=A-1 // 3866
M=0 // 3867

////PushInstruction("local 0")
@LCL // 3868
A=M // 3869
D=M // 3870
@SP // 3871
AM=M+1 // 3872
A=A-1 // 3873
M=D // 3874

////PushInstruction("constant 3")
@3 // 3875
D=A // 3876
@SP // 3877
AM=M+1 // 3878
A=A-1 // 3879
M=D // 3880

////ArithmeticInstruction{ADD}
@SP // 3881
AM=M-1 // 3882
D=M // 3883
A=A-1 // 3884
D=D+M // 3885

////PopInstruction{address=pointer 1}
@SP // 3886
AM=M-1 // 3887
D=M // 3888
@4 // 3889
M=D // 3890

////PopInstruction{address=that 0}
@SP // 3891
AM=M-1 // 3892
D=M // 3893
@THAT // 3894
A=M // 3895
M=D // 3896

////PushInstruction("local 0")
@LCL // 3897
A=M // 3898
D=M // 3899
@SP // 3900
AM=M+1 // 3901
A=A-1 // 3902
M=D // 3903

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.init=0}, currentFunction='Memory.init'}
// call Memory.create_foot
@6 // 3904
D=A // 3905
@14 // 3906
M=D // 3907
@Memory.create_foot // 3908
D=A // 3909
@13 // 3910
M=D // 3911
@Memory.init.ret.0 // 3912
D=A // 3913
@CALL // 3914
0;JMP // 3915
(Memory.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 3916
AM=M-1 // 3917
D=M // 3918
@5 // 3919
M=D // 3920

////PushInstruction("constant 2048")
@2048 // 3921
D=A // 3922
@SP // 3923
AM=M+1 // 3924
A=A-1 // 3925
M=D // 3926

////PushInstruction("constant 6")
@6 // 3927
D=A // 3928
@SP // 3929
AM=M+1 // 3930
A=A-1 // 3931
M=D // 3932

////ArithmeticInstruction{ADD}
@SP // 3933
AM=M-1 // 3934
D=M // 3935
A=A-1 // 3936
D=D+M // 3937

////PushInstruction("local 0")
@LCL // 3938
A=M // 3939
D=M // 3940
@SP // 3941
AM=M+1 // 3942
A=A-1 // 3943
M=D // 3944

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.init=1}, currentFunction='Memory.init'}
// call Memory.add_node
@7 // 3945
D=A // 3946
@14 // 3947
M=D // 3948
@Memory.add_node // 3949
D=A // 3950
@13 // 3951
M=D // 3952
@Memory.init.ret.1 // 3953
D=A // 3954
@CALL // 3955
0;JMP // 3956
(Memory.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 3957
AM=M-1 // 3958
D=M // 3959
@5 // 3960
M=D // 3961

////PushInstruction("constant 0")
@SP // 3962
AM=M+1 // 3963
A=A-1 // 3964
M=0 // 3965

////ReturnInstruction{}
@RETURN // 3966
0;JMP // 3967

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.init=2}}
// function Memory.alloc with 5
(Memory.alloc)
@SP // 3968
AM=M+1 // 3969
A=A-1 // 3970
M=0 // 3971
@SP // 3972
AM=M+1 // 3973
A=A-1 // 3974
M=0 // 3975
@SP // 3976
AM=M+1 // 3977
A=A-1 // 3978
M=0 // 3979
@SP // 3980
AM=M+1 // 3981
A=A-1 // 3982
M=0 // 3983
@SP // 3984
AM=M+1 // 3985
A=A-1 // 3986
M=0 // 3987

////PushInstruction("argument 0")
@ARG // 3988
A=M // 3989
D=M // 3990
@SP // 3991
AM=M+1 // 3992
A=A-1 // 3993
M=D // 3994

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=0, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 3995
D=A // 3996
@14 // 3997
M=D // 3998
@Memory.getBinIndex // 3999
D=A // 4000
@13 // 4001
M=D // 4002
@Memory.alloc.ret.0 // 4003
D=A // 4004
@CALL // 4005
0;JMP // 4006
(Memory.alloc.ret.0)

////PopInstruction{address=local 0}
@SP // 4007
AM=M-1 // 4008
D=M // 4009
@LCL // 4010
A=M // 4011
M=D // 4012

////PushInstruction("constant 2048")
@2048 // 4013
D=A // 4014
@SP // 4015
AM=M+1 // 4016
A=A-1 // 4017
M=D // 4018

////PushInstruction("local 0")
@LCL // 4019
A=M // 4020
D=M // 4021
@SP // 4022
AM=M+1 // 4023
A=A-1 // 4024
M=D // 4025

////ArithmeticInstruction{ADD}
@SP // 4026
AM=M-1 // 4027
D=M // 4028
A=A-1 // 4029
D=D+M // 4030

////PopInstruction{address=local 1}
@SP // 4031
AM=M-1 // 4032
D=M // 4033
@LCL // 4034
A=M+1 // 4035
M=D // 4036

////PushInstruction("local 1")
@LCL // 4037
A=M+1 // 4038
D=M // 4039
@SP // 4040
AM=M+1 // 4041
A=A-1 // 4042
M=D // 4043

////PushInstruction("argument 0")
@ARG // 4044
A=M // 4045
D=M // 4046
@SP // 4047
AM=M+1 // 4048
A=A-1 // 4049
M=D // 4050

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=1, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 4051
D=A // 4052
@14 // 4053
M=D // 4054
@Memory.get_best_fit // 4055
D=A // 4056
@13 // 4057
M=D // 4058
@Memory.alloc.ret.1 // 4059
D=A // 4060
@CALL // 4061
0;JMP // 4062
(Memory.alloc.ret.1)

////PopInstruction{address=local 2}
@SP // 4063
AM=M-1 // 4064
D=M // 4065
@LCL // 4066
A=M+1 // 4067
A=A+1 // 4068
M=D // 4069

////LabelInstruction{label='WHILE_START_Memory.alloc1}
// label WHILE_START_Memory.alloc1
(WHILE_START_Memory.alloc1)

////PushInstruction("local 2")
@LCL // 4070
A=M+1 // 4071
A=A+1 // 4072
D=M // 4073
@SP // 4074
AM=M+1 // 4075
A=A-1 // 4076
M=D // 4077

////PushInstruction("constant 0")
@SP // 4078
AM=M+1 // 4079
A=A-1 // 4080
M=0 // 4081

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq0 // 4082
D=A // 4083
@13 // 4084
M=D // 4085
@SP // 4086
AM=M-1 // 4087
D=M // 4088
A=A-1 // 4089
D=M-D // 4090
@DO_EQ // 4091
0;JMP // 4092
(COMPARE_Memory.alloc_eq0)

////PushInstruction("constant 0")
@SP // 4093
AM=M+1 // 4094
A=A-1 // 4095
M=0 // 4096

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq1 // 4097
D=A // 4098
@13 // 4099
M=D // 4100
@SP // 4101
AM=M-1 // 4102
D=M // 4103
A=A-1 // 4104
D=M-D // 4105
@DO_EQ // 4106
0;JMP // 4107
(COMPARE_Memory.alloc_eq1)

////IfGotoInstruction{label='WHILE_END_Memory.alloc1}
// if-goto WHILE_END_Memory.alloc1
@SP // 4108
AM=M-1 // 4109
D=M // 4110
@WHILE_END_Memory.alloc1 // 4111
D;JNE // 4112

////PushInstruction("local 0")
@LCL // 4113
A=M // 4114
D=M // 4115
@SP // 4116
AM=M+1 // 4117
A=A-1 // 4118
M=D // 4119

////PushInstruction("constant 1")
@SP // 4120
AM=M+1 // 4121
A=A-1 // 4122
M=1 // 4123

////ArithmeticInstruction{ADD}
@SP // 4124
AM=M-1 // 4125
D=M // 4126
A=A-1 // 4127
D=D+M // 4128

////PushInstruction("constant 7")
@7 // 4129
D=A // 4130
@SP // 4131
AM=M+1 // 4132
A=A-1 // 4133
M=D // 4134

////ArithmeticInstruction{LT}
@COMPARE_Memory.alloc_lt2 // 4135
D=A // 4136
@13 // 4137
M=D // 4138
@SP // 4139
AM=M-1 // 4140
D=M // 4141
A=A-1 // 4142
D=M-D // 4143
@DO_LT // 4144
0;JMP // 4145
(COMPARE_Memory.alloc_lt2)

////ArithmeticInstruction{NOT}
@SP // 4146
A=M-1 // 4147
M=!M // 4148

////PushInstruction("constant 0")
@SP // 4149
AM=M+1 // 4150
A=A-1 // 4151
M=0 // 4152

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq3 // 4153
D=A // 4154
@13 // 4155
M=D // 4156
@SP // 4157
AM=M-1 // 4158
D=M // 4159
A=A-1 // 4160
D=M-D // 4161
@DO_EQ // 4162
0;JMP // 4163
(COMPARE_Memory.alloc_eq3)

////IfGotoInstruction{label='Memory.alloc.IfElse1}
// if-goto Memory.alloc.IfElse1
@SP // 4164
AM=M-1 // 4165
D=M // 4166
@Memory.alloc.IfElse1 // 4167
D;JNE // 4168

////PushInstruction("constant 0")
@SP // 4169
AM=M+1 // 4170
A=A-1 // 4171
M=0 // 4172

////ReturnInstruction{}
@RETURN // 4173
0;JMP // 4174

////GotoInstruction{label='Memory.alloc.IfElseEND1}
// goto Memory.alloc.IfElseEND1
@Memory.alloc.IfElseEND1 // 4175
0;JMP // 4176

////LabelInstruction{label='Memory.alloc.IfElse1}
// label Memory.alloc.IfElse1
(Memory.alloc.IfElse1)

////LabelInstruction{label='Memory.alloc.IfElseEND1}
// label Memory.alloc.IfElseEND1
(Memory.alloc.IfElseEND1)

////PushInstruction("local 0")
@LCL // 4177
A=M // 4178
D=M // 4179
@SP // 4180
AM=M+1 // 4181
A=A-1 // 4182
M=D // 4183

////PushInstruction("constant 1")
@SP // 4184
AM=M+1 // 4185
A=A-1 // 4186
M=1 // 4187

////ArithmeticInstruction{ADD}
@SP // 4188
AM=M-1 // 4189
D=M // 4190
A=A-1 // 4191
D=D+M // 4192

////PopInstruction{address=local 0}
@SP // 4193
AM=M-1 // 4194
D=M // 4195
@LCL // 4196
A=M // 4197
M=D // 4198

////PushInstruction("constant 2048")
@2048 // 4199
D=A // 4200
@SP // 4201
AM=M+1 // 4202
A=A-1 // 4203
M=D // 4204

////PushInstruction("local 0")
@LCL // 4205
A=M // 4206
D=M // 4207
@SP // 4208
AM=M+1 // 4209
A=A-1 // 4210
M=D // 4211

////ArithmeticInstruction{ADD}
@SP // 4212
AM=M-1 // 4213
D=M // 4214
A=A-1 // 4215
D=D+M // 4216

////PopInstruction{address=local 1}
@SP // 4217
AM=M-1 // 4218
D=M // 4219
@LCL // 4220
A=M+1 // 4221
M=D // 4222

////PushInstruction("local 1")
@LCL // 4223
A=M+1 // 4224
D=M // 4225
@SP // 4226
AM=M+1 // 4227
A=A-1 // 4228
M=D // 4229

////PushInstruction("argument 0")
@ARG // 4230
A=M // 4231
D=M // 4232
@SP // 4233
AM=M+1 // 4234
A=A-1 // 4235
M=D // 4236

////CallInstruction{calleeFunction='Memory.get_best_fit', numArgs=2, funcMapping={Memory.alloc=2, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.get_best_fit
@7 // 4237
D=A // 4238
@14 // 4239
M=D // 4240
@Memory.get_best_fit // 4241
D=A // 4242
@13 // 4243
M=D // 4244
@Memory.alloc.ret.2 // 4245
D=A // 4246
@CALL // 4247
0;JMP // 4248
(Memory.alloc.ret.2)

////PopInstruction{address=local 2}
@SP // 4249
AM=M-1 // 4250
D=M // 4251
@LCL // 4252
A=M+1 // 4253
A=A+1 // 4254
M=D // 4255

////GotoInstruction{label='WHILE_START_Memory.alloc1}
// goto WHILE_START_Memory.alloc1
@WHILE_START_Memory.alloc1 // 4256
0;JMP // 4257

////LabelInstruction{label='WHILE_END_Memory.alloc1}
// label WHILE_END_Memory.alloc1
(WHILE_END_Memory.alloc1)

////PushInstruction("constant 2048")
@2048 // 4258
D=A // 4259
@SP // 4260
AM=M+1 // 4261
A=A-1 // 4262
M=D // 4263

////PushInstruction("local 2")
@LCL // 4264
A=M+1 // 4265
A=A+1 // 4266
D=M // 4267
@SP // 4268
AM=M+1 // 4269
A=A-1 // 4270
M=D // 4271

////PushInstruction("constant 0")
@SP // 4272
AM=M+1 // 4273
A=A-1 // 4274
M=0 // 4275

////ArithmeticInstruction{ADD}
@SP // 4276
AM=M-1 // 4277
D=M // 4278
A=A-1 // 4279
D=D+M // 4280

////PopInstruction{address=pointer 1}
@SP // 4281
AM=M-1 // 4282
D=M // 4283
@4 // 4284
M=D // 4285

////PushInstruction("that 0")
@THAT // 4286
A=M // 4287
D=M // 4288
@SP // 4289
AM=M+1 // 4290
A=A-1 // 4291
M=D // 4292

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=3, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 4293
D=A // 4294
@14 // 4295
M=D // 4296
@Memory.getBinIndex // 4297
D=A // 4298
@13 // 4299
M=D // 4300
@Memory.alloc.ret.3 // 4301
D=A // 4302
@CALL // 4303
0;JMP // 4304
(Memory.alloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 4305
AM=M-1 // 4306
D=M // 4307
A=A-1 // 4308
D=D+M // 4309

////PushInstruction("local 2")
@LCL // 4310
A=M+1 // 4311
A=A+1 // 4312
D=M // 4313
@SP // 4314
AM=M+1 // 4315
A=A-1 // 4316
M=D // 4317

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.alloc=4, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.remove_node
@7 // 4318
D=A // 4319
@14 // 4320
M=D // 4321
@Memory.remove_node // 4322
D=A // 4323
@13 // 4324
M=D // 4325
@Memory.alloc.ret.4 // 4326
D=A // 4327
@CALL // 4328
0;JMP // 4329
(Memory.alloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 4330
AM=M-1 // 4331
D=M // 4332
@5 // 4333
M=D // 4334

////PushInstruction("local 2")
@LCL // 4335
A=M+1 // 4336
A=A+1 // 4337
D=M // 4338
@SP // 4339
AM=M+1 // 4340
A=A-1 // 4341
M=D // 4342

////PushInstruction("constant 0")
@SP // 4343
AM=M+1 // 4344
A=A-1 // 4345
M=0 // 4346

////ArithmeticInstruction{ADD}
@SP // 4347
AM=M-1 // 4348
D=M // 4349
A=A-1 // 4350
D=D+M // 4351

////PopInstruction{address=pointer 1}
@SP // 4352
AM=M-1 // 4353
D=M // 4354
@4 // 4355
M=D // 4356

////PushInstruction("that 0")
@THAT // 4357
A=M // 4358
D=M // 4359
@SP // 4360
AM=M+1 // 4361
A=A-1 // 4362
M=D // 4363

////PushInstruction("argument 0")
@ARG // 4364
A=M // 4365
D=M // 4366
@SP // 4367
AM=M+1 // 4368
A=A-1 // 4369
M=D // 4370

////ArithmeticInstruction{SUB}
@SP // 4371
AM=M-1 // 4372
D=M // 4373
A=A-1 // 4374
D=M-D // 4375

////PopInstruction{address=local 3}
@SP // 4376
AM=M-1 // 4377
D=M // 4378
@LCL // 4379
A=M+1 // 4380
A=A+1 // 4381
A=A+1 // 4382
M=D // 4383

////PushInstruction("local 3")
@LCL // 4384
A=M+1 // 4385
A=A+1 // 4386
A=A+1 // 4387
D=M // 4388
@SP // 4389
AM=M+1 // 4390
A=A-1 // 4391
M=D // 4392

////PushInstruction("constant 5")
@5 // 4393
D=A // 4394
@SP // 4395
AM=M+1 // 4396
A=A-1 // 4397
M=D // 4398

////ArithmeticInstruction{GT}
@COMPARE_Memory.alloc_gt4 // 4399
D=A // 4400
@13 // 4401
M=D // 4402
@SP // 4403
AM=M-1 // 4404
D=M // 4405
A=A-1 // 4406
D=M-D // 4407
@DO_GT // 4408
0;JMP // 4409
(COMPARE_Memory.alloc_gt4)

////PushInstruction("constant 0")
@SP // 4410
AM=M+1 // 4411
A=A-1 // 4412
M=0 // 4413

////ArithmeticInstruction{EQ}
@COMPARE_Memory.alloc_eq5 // 4414
D=A // 4415
@13 // 4416
M=D // 4417
@SP // 4418
AM=M-1 // 4419
D=M // 4420
A=A-1 // 4421
D=M-D // 4422
@DO_EQ // 4423
0;JMP // 4424
(COMPARE_Memory.alloc_eq5)

////IfGotoInstruction{label='Memory.alloc.IfElse2}
// if-goto Memory.alloc.IfElse2
@SP // 4425
AM=M-1 // 4426
D=M // 4427
@Memory.alloc.IfElse2 // 4428
D;JNE // 4429

////PushInstruction("argument 0")
@ARG // 4430
A=M // 4431
D=M // 4432
@SP // 4433
AM=M+1 // 4434
A=A-1 // 4435
M=D // 4436

////PushInstruction("local 2")
@LCL // 4437
A=M+1 // 4438
A=A+1 // 4439
D=M // 4440
@SP // 4441
AM=M+1 // 4442
A=A-1 // 4443
M=D // 4444

////PushInstruction("constant 0")
@SP // 4445
AM=M+1 // 4446
A=A-1 // 4447
M=0 // 4448

////ArithmeticInstruction{ADD}
@SP // 4449
AM=M-1 // 4450
D=M // 4451
A=A-1 // 4452
D=D+M // 4453

////PopInstruction{address=pointer 1}
@SP // 4454
AM=M-1 // 4455
D=M // 4456
@4 // 4457
M=D // 4458

////PopInstruction{address=that 0}
@SP // 4459
AM=M-1 // 4460
D=M // 4461
@THAT // 4462
A=M // 4463
M=D // 4464

////PushInstruction("constant 0")
@SP // 4465
AM=M+1 // 4466
A=A-1 // 4467
M=0 // 4468

////PushInstruction("local 2")
@LCL // 4469
A=M+1 // 4470
A=A+1 // 4471
D=M // 4472
@SP // 4473
AM=M+1 // 4474
A=A-1 // 4475
M=D // 4476

////PushInstruction("constant 1")
@SP // 4477
AM=M+1 // 4478
A=A-1 // 4479
M=1 // 4480

////ArithmeticInstruction{ADD}
@SP // 4481
AM=M-1 // 4482
D=M // 4483
A=A-1 // 4484
D=D+M // 4485

////PopInstruction{address=pointer 1}
@SP // 4486
AM=M-1 // 4487
D=M // 4488
@4 // 4489
M=D // 4490

////PopInstruction{address=that 0}
@SP // 4491
AM=M-1 // 4492
D=M // 4493
@THAT // 4494
A=M // 4495
M=D // 4496

////PushInstruction("local 2")
@LCL // 4497
A=M+1 // 4498
A=A+1 // 4499
D=M // 4500
@SP // 4501
AM=M+1 // 4502
A=A-1 // 4503
M=D // 4504

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=5, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 4505
D=A // 4506
@14 // 4507
M=D // 4508
@Memory.create_foot // 4509
D=A // 4510
@13 // 4511
M=D // 4512
@Memory.alloc.ret.5 // 4513
D=A // 4514
@CALL // 4515
0;JMP // 4516
(Memory.alloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 4517
AM=M-1 // 4518
D=M // 4519
@5 // 4520
M=D // 4521

////PushInstruction("local 2")
@LCL // 4522
A=M+1 // 4523
A=A+1 // 4524
D=M // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=D // 4529

////PushInstruction("argument 0")
@ARG // 4530
A=M // 4531
D=M // 4532
@SP // 4533
AM=M+1 // 4534
A=A-1 // 4535
M=D // 4536

////ArithmeticInstruction{ADD}
@SP // 4537
AM=M-1 // 4538
D=M // 4539
A=A-1 // 4540
D=D+M // 4541

////PushInstruction("constant 5")
@5 // 4542
D=A // 4543
@SP // 4544
AM=M+1 // 4545
A=A-1 // 4546
M=D // 4547

////ArithmeticInstruction{ADD}
@SP // 4548
AM=M-1 // 4549
D=M // 4550
A=A-1 // 4551
D=D+M // 4552

////PopInstruction{address=local 4}
@LCL // 4553
D=M // 4554
@4 // 4555
A=D+A // 4556
D=A // 4557
@R13 // 4558
M=D // 4559
@SP // 4560
AM=M-1 // 4561
D=M // 4562
@R13 // 4563
A=M // 4564
M=D // 4565

////PushInstruction("local 3")
@LCL // 4566
A=M+1 // 4567
A=A+1 // 4568
A=A+1 // 4569
D=M // 4570
@SP // 4571
AM=M+1 // 4572
A=A-1 // 4573
M=D // 4574

////PushInstruction("constant 5")
@5 // 4575
D=A // 4576
@SP // 4577
AM=M+1 // 4578
A=A-1 // 4579
M=D // 4580

////ArithmeticInstruction{SUB}
@SP // 4581
AM=M-1 // 4582
D=M // 4583
A=A-1 // 4584
D=M-D // 4585

////PushInstruction("local 4")
@LCL // 4586
D=M // 4587
@4 // 4588
A=D+A // 4589
D=M // 4590
@SP // 4591
AM=M+1 // 4592
A=A-1 // 4593
M=D // 4594

////PushInstruction("constant 0")
@SP // 4595
AM=M+1 // 4596
A=A-1 // 4597
M=0 // 4598

////ArithmeticInstruction{ADD}
@SP // 4599
AM=M-1 // 4600
D=M // 4601
A=A-1 // 4602
D=D+M // 4603

////PopInstruction{address=pointer 1}
@SP // 4604
AM=M-1 // 4605
D=M // 4606
@4 // 4607
M=D // 4608

////PopInstruction{address=that 0}
@SP // 4609
AM=M-1 // 4610
D=M // 4611
@THAT // 4612
A=M // 4613
M=D // 4614

////PushInstruction("constant 1")
@SP // 4615
AM=M+1 // 4616
A=A-1 // 4617
M=1 // 4618

////PushInstruction("local 4")
@LCL // 4619
D=M // 4620
@4 // 4621
A=D+A // 4622
D=M // 4623
@SP // 4624
AM=M+1 // 4625
A=A-1 // 4626
M=D // 4627

////PushInstruction("constant 1")
@SP // 4628
AM=M+1 // 4629
A=A-1 // 4630
M=1 // 4631

////ArithmeticInstruction{ADD}
@SP // 4632
AM=M-1 // 4633
D=M // 4634
A=A-1 // 4635
D=D+M // 4636

////PopInstruction{address=pointer 1}
@SP // 4637
AM=M-1 // 4638
D=M // 4639
@4 // 4640
M=D // 4641

////PopInstruction{address=that 0}
@SP // 4642
AM=M-1 // 4643
D=M // 4644
@THAT // 4645
A=M // 4646
M=D // 4647

////PushInstruction("local 4")
@LCL // 4648
D=M // 4649
@4 // 4650
A=D+A // 4651
D=M // 4652
@SP // 4653
AM=M+1 // 4654
A=A-1 // 4655
M=D // 4656

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=6, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 4657
D=A // 4658
@14 // 4659
M=D // 4660
@Memory.create_foot // 4661
D=A // 4662
@13 // 4663
M=D // 4664
@Memory.alloc.ret.6 // 4665
D=A // 4666
@CALL // 4667
0;JMP // 4668
(Memory.alloc.ret.6)

////PopInstruction{address=temp 0}
@SP // 4669
AM=M-1 // 4670
D=M // 4671
@5 // 4672
M=D // 4673

////PushInstruction("constant 2048")
@2048 // 4674
D=A // 4675
@SP // 4676
AM=M+1 // 4677
A=A-1 // 4678
M=D // 4679

////PushInstruction("local 3")
@LCL // 4680
A=M+1 // 4681
A=A+1 // 4682
A=A+1 // 4683
D=M // 4684
@SP // 4685
AM=M+1 // 4686
A=A-1 // 4687
M=D // 4688

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.alloc=7, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.getBinIndex
@6 // 4689
D=A // 4690
@14 // 4691
M=D // 4692
@Memory.getBinIndex // 4693
D=A // 4694
@13 // 4695
M=D // 4696
@Memory.alloc.ret.7 // 4697
D=A // 4698
@CALL // 4699
0;JMP // 4700
(Memory.alloc.ret.7)

////ArithmeticInstruction{ADD}
@SP // 4701
AM=M-1 // 4702
D=M // 4703
A=A-1 // 4704
D=D+M // 4705

////PushInstruction("local 4")
@LCL // 4706
D=M // 4707
@4 // 4708
A=D+A // 4709
D=M // 4710
@SP // 4711
AM=M+1 // 4712
A=A-1 // 4713
M=D // 4714

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.alloc=8, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.add_node
@7 // 4715
D=A // 4716
@14 // 4717
M=D // 4718
@Memory.add_node // 4719
D=A // 4720
@13 // 4721
M=D // 4722
@Memory.alloc.ret.8 // 4723
D=A // 4724
@CALL // 4725
0;JMP // 4726
(Memory.alloc.ret.8)

////PopInstruction{address=temp 0}
@SP // 4727
AM=M-1 // 4728
D=M // 4729
@5 // 4730
M=D // 4731

////GotoInstruction{label='Memory.alloc.IfElseEND2}
// goto Memory.alloc.IfElseEND2
@Memory.alloc.IfElseEND2 // 4732
0;JMP // 4733

////LabelInstruction{label='Memory.alloc.IfElse2}
// label Memory.alloc.IfElse2
(Memory.alloc.IfElse2)

////PushInstruction("constant 0")
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=0 // 4737

////PushInstruction("local 2")
@LCL // 4738
A=M+1 // 4739
A=A+1 // 4740
D=M // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745

////PushInstruction("constant 1")
@SP // 4746
AM=M+1 // 4747
A=A-1 // 4748
M=1 // 4749

////ArithmeticInstruction{ADD}
@SP // 4750
AM=M-1 // 4751
D=M // 4752
A=A-1 // 4753
D=D+M // 4754

////PopInstruction{address=pointer 1}
@SP // 4755
AM=M-1 // 4756
D=M // 4757
@4 // 4758
M=D // 4759

////PopInstruction{address=that 0}
@SP // 4760
AM=M-1 // 4761
D=M // 4762
@THAT // 4763
A=M // 4764
M=D // 4765

////PushInstruction("local 2")
@LCL // 4766
A=M+1 // 4767
A=A+1 // 4768
D=M // 4769
@SP // 4770
AM=M+1 // 4771
A=A-1 // 4772
M=D // 4773

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.alloc=9, Memory.init=2}, currentFunction='Memory.alloc'}
// call Memory.create_foot
@6 // 4774
D=A // 4775
@14 // 4776
M=D // 4777
@Memory.create_foot // 4778
D=A // 4779
@13 // 4780
M=D // 4781
@Memory.alloc.ret.9 // 4782
D=A // 4783
@CALL // 4784
0;JMP // 4785
(Memory.alloc.ret.9)

////PopInstruction{address=temp 0}
@SP // 4786
AM=M-1 // 4787
D=M // 4788
@5 // 4789
M=D // 4790

////LabelInstruction{label='Memory.alloc.IfElseEND2}
// label Memory.alloc.IfElseEND2
(Memory.alloc.IfElseEND2)

////PushInstruction("local 2")
@LCL // 4791
A=M+1 // 4792
A=A+1 // 4793
D=M // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=D // 4798

////PushInstruction("constant 4")
@4 // 4799
D=A // 4800
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=D // 4804

////ArithmeticInstruction{ADD}
@SP // 4805
AM=M-1 // 4806
D=M // 4807
A=A-1 // 4808
D=D+M // 4809

////ReturnInstruction{}
@RETURN // 4810
0;JMP // 4811

////FunctionInstruction{functionName='Memory.calloc', numLocals=1, funcMapping={Memory.alloc=10, Memory.init=2}}
// function Memory.calloc with 1
(Memory.calloc)
@SP // 4812
AM=M+1 // 4813
A=A-1 // 4814
M=0 // 4815

////PushInstruction("argument 0")
@ARG // 4816
A=M // 4817
D=M // 4818
@SP // 4819
AM=M+1 // 4820
A=A-1 // 4821
M=D // 4822

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.alloc=10, Memory.calloc=0, Memory.init=2}, currentFunction='Memory.calloc'}
// call Memory.alloc
@6 // 4823
D=A // 4824
@14 // 4825
M=D // 4826
@Memory.alloc // 4827
D=A // 4828
@13 // 4829
M=D // 4830
@Memory.calloc.ret.0 // 4831
D=A // 4832
@CALL // 4833
0;JMP // 4834
(Memory.calloc.ret.0)

////PopInstruction{address=local 0}
@SP // 4835
AM=M-1 // 4836
D=M // 4837
@LCL // 4838
A=M // 4839
M=D // 4840

////PushInstruction("local 0")
@LCL // 4841
A=M // 4842
D=M // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847

////ArithmeticInstruction{NOT}
@SP // 4848
A=M-1 // 4849
M=!M // 4850

////PushInstruction("constant 0")
@SP // 4851
AM=M+1 // 4852
A=A-1 // 4853
M=0 // 4854

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq6 // 4855
D=A // 4856
@13 // 4857
M=D // 4858
@SP // 4859
AM=M-1 // 4860
D=M // 4861
A=A-1 // 4862
D=M-D // 4863
@DO_EQ // 4864
0;JMP // 4865
(COMPARE_Memory.calloc_eq6)

////IfGotoInstruction{label='Memory.calloc.IfElse1}
// if-goto Memory.calloc.IfElse1
@SP // 4866
AM=M-1 // 4867
D=M // 4868
@Memory.calloc.IfElse1 // 4869
D;JNE // 4870

////PushInstruction("constant 0")
@SP // 4871
AM=M+1 // 4872
A=A-1 // 4873
M=0 // 4874

////ReturnInstruction{}
@RETURN // 4875
0;JMP // 4876

////GotoInstruction{label='Memory.calloc.IfElseEND1}
// goto Memory.calloc.IfElseEND1
@Memory.calloc.IfElseEND1 // 4877
0;JMP // 4878

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
@ARG // 4879
A=M // 4880
D=M // 4881
@SP // 4882
AM=M+1 // 4883
A=A-1 // 4884
M=D // 4885

////PushInstruction("constant 0")
@SP // 4886
AM=M+1 // 4887
A=A-1 // 4888
M=0 // 4889

////ArithmeticInstruction{GT}
@COMPARE_Memory.calloc_gt7 // 4890
D=A // 4891
@13 // 4892
M=D // 4893
@SP // 4894
AM=M-1 // 4895
D=M // 4896
A=A-1 // 4897
D=M-D // 4898
@DO_GT // 4899
0;JMP // 4900
(COMPARE_Memory.calloc_gt7)

////PushInstruction("constant 0")
@SP // 4901
AM=M+1 // 4902
A=A-1 // 4903
M=0 // 4904

////ArithmeticInstruction{EQ}
@COMPARE_Memory.calloc_eq8 // 4905
D=A // 4906
@13 // 4907
M=D // 4908
@SP // 4909
AM=M-1 // 4910
D=M // 4911
A=A-1 // 4912
D=M-D // 4913
@DO_EQ // 4914
0;JMP // 4915
(COMPARE_Memory.calloc_eq8)

////IfGotoInstruction{label='WHILE_END_Memory.calloc1}
// if-goto WHILE_END_Memory.calloc1
@SP // 4916
AM=M-1 // 4917
D=M // 4918
@WHILE_END_Memory.calloc1 // 4919
D;JNE // 4920

////PushInstruction("argument 0")
@ARG // 4921
A=M // 4922
D=M // 4923
@SP // 4924
AM=M+1 // 4925
A=A-1 // 4926
M=D // 4927

////PushInstruction("constant 1")
@SP // 4928
AM=M+1 // 4929
A=A-1 // 4930
M=1 // 4931

////ArithmeticInstruction{SUB}
@SP // 4932
AM=M-1 // 4933
D=M // 4934
A=A-1 // 4935
D=M-D // 4936

////PopInstruction{address=argument 0}
@SP // 4937
AM=M-1 // 4938
D=M // 4939
@ARG // 4940
A=M // 4941
M=D // 4942

////PushInstruction("constant 0")
@SP // 4943
AM=M+1 // 4944
A=A-1 // 4945
M=0 // 4946

////PushInstruction("local 0")
@LCL // 4947
A=M // 4948
D=M // 4949
@SP // 4950
AM=M+1 // 4951
A=A-1 // 4952
M=D // 4953

////PushInstruction("argument 0")
@ARG // 4954
A=M // 4955
D=M // 4956
@SP // 4957
AM=M+1 // 4958
A=A-1 // 4959
M=D // 4960

////ArithmeticInstruction{ADD}
@SP // 4961
AM=M-1 // 4962
D=M // 4963
A=A-1 // 4964
D=D+M // 4965

////PopInstruction{address=pointer 1}
@SP // 4966
AM=M-1 // 4967
D=M // 4968
@4 // 4969
M=D // 4970

////PopInstruction{address=that 0}
@SP // 4971
AM=M-1 // 4972
D=M // 4973
@THAT // 4974
A=M // 4975
M=D // 4976

////GotoInstruction{label='WHILE_START_Memory.calloc1}
// goto WHILE_START_Memory.calloc1
@WHILE_START_Memory.calloc1 // 4977
0;JMP // 4978

////LabelInstruction{label='WHILE_END_Memory.calloc1}
// label WHILE_END_Memory.calloc1
(WHILE_END_Memory.calloc1)

////PushInstruction("local 0")
@LCL // 4979
A=M // 4980
D=M // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985

////ReturnInstruction{}
@RETURN // 4986
0;JMP // 4987

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@SP // 4988
AM=M+1 // 4989
A=A-1 // 4990
M=0 // 4991
@SP // 4992
AM=M+1 // 4993
A=A-1 // 4994
M=0 // 4995
@SP // 4996
AM=M+1 // 4997
A=A-1 // 4998
M=0 // 4999

////PushInstruction("argument 0")
@ARG // 5000
A=M // 5001
D=M // 5002
@SP // 5003
AM=M+1 // 5004
A=A-1 // 5005
M=D // 5006

////PushInstruction("constant 4")
@4 // 5007
D=A // 5008
@SP // 5009
AM=M+1 // 5010
A=A-1 // 5011
M=D // 5012

////ArithmeticInstruction{SUB}
@SP // 5013
AM=M-1 // 5014
D=M // 5015
A=A-1 // 5016
D=M-D // 5017

////PopInstruction{address=local 0}
@SP // 5018
AM=M-1 // 5019
D=M // 5020
@LCL // 5021
A=M // 5022
M=D // 5023

////PushInstruction("constant 1")
@SP // 5024
AM=M+1 // 5025
A=A-1 // 5026
M=1 // 5027

////PushInstruction("local 0")
@LCL // 5028
A=M // 5029
D=M // 5030
@SP // 5031
AM=M+1 // 5032
A=A-1 // 5033
M=D // 5034

////PushInstruction("constant 1")
@SP // 5035
AM=M+1 // 5036
A=A-1 // 5037
M=1 // 5038

////ArithmeticInstruction{ADD}
@SP // 5039
AM=M-1 // 5040
D=M // 5041
A=A-1 // 5042
D=D+M // 5043

////PopInstruction{address=pointer 1}
@SP // 5044
AM=M-1 // 5045
D=M // 5046
@4 // 5047
M=D // 5048

////PopInstruction{address=that 0}
@SP // 5049
AM=M-1 // 5050
D=M // 5051
@THAT // 5052
A=M // 5053
M=D // 5054

////PushInstruction("local 0")
@LCL // 5055
A=M // 5056
D=M // 5057
@SP // 5058
AM=M+1 // 5059
A=A-1 // 5060
M=D // 5061

////PushInstruction("constant 2")
@2 // 5062
D=A // 5063
@SP // 5064
AM=M+1 // 5065
A=A-1 // 5066
M=D // 5067

////ArithmeticInstruction{ADD}
@SP // 5068
AM=M-1 // 5069
D=M // 5070
A=A-1 // 5071
D=D+M // 5072

////PopInstruction{address=pointer 1}
@SP // 5073
AM=M-1 // 5074
D=M // 5075
@4 // 5076
M=D // 5077

////PushInstruction("that 0")
@THAT // 5078
A=M // 5079
D=M // 5080
@SP // 5081
AM=M+1 // 5082
A=A-1 // 5083
M=D // 5084

////PopInstruction{address=local 1}
@SP // 5085
AM=M-1 // 5086
D=M // 5087
@LCL // 5088
A=M+1 // 5089
M=D // 5090

////PushInstruction("local 0")
@LCL // 5091
A=M // 5092
D=M // 5093
@SP // 5094
AM=M+1 // 5095
A=A-1 // 5096
M=D // 5097

////PushInstruction("constant 3")
@3 // 5098
D=A // 5099
@SP // 5100
AM=M+1 // 5101
A=A-1 // 5102
M=D // 5103

////ArithmeticInstruction{ADD}
@SP // 5104
AM=M-1 // 5105
D=M // 5106
A=A-1 // 5107
D=D+M // 5108

////PopInstruction{address=pointer 1}
@SP // 5109
AM=M-1 // 5110
D=M // 5111
@4 // 5112
M=D // 5113

////PushInstruction("that 0")
@THAT // 5114
A=M // 5115
D=M // 5116
@SP // 5117
AM=M+1 // 5118
A=A-1 // 5119
M=D // 5120

////PopInstruction{address=local 2}
@SP // 5121
AM=M-1 // 5122
D=M // 5123
@LCL // 5124
A=M+1 // 5125
A=A+1 // 5126
M=D // 5127

////PushInstruction("local 1")
@LCL // 5128
A=M+1 // 5129
D=M // 5130
@SP // 5131
AM=M+1 // 5132
A=A-1 // 5133
M=D // 5134

////PushInstruction("constant 0")
@SP // 5135
AM=M+1 // 5136
A=A-1 // 5137
M=0 // 5138

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq9 // 5139
D=A // 5140
@13 // 5141
M=D // 5142
@SP // 5143
AM=M-1 // 5144
D=M // 5145
A=A-1 // 5146
D=M-D // 5147
@DO_EQ // 5148
0;JMP // 5149
(COMPARE_Memory.deAlloc_eq9)

////ArithmeticInstruction{NOT}
@SP // 5150
A=M-1 // 5151
M=!M // 5152

////PushInstruction("constant 0")
@SP // 5153
AM=M+1 // 5154
A=A-1 // 5155
M=0 // 5156

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq10 // 5157
D=A // 5158
@13 // 5159
M=D // 5160
@SP // 5161
AM=M-1 // 5162
D=M // 5163
A=A-1 // 5164
D=M-D // 5165
@DO_EQ // 5166
0;JMP // 5167
(COMPARE_Memory.deAlloc_eq10)

////IfGotoInstruction{label='Memory.deAlloc.IfElse1}
// if-goto Memory.deAlloc.IfElse1
@SP // 5168
AM=M-1 // 5169
D=M // 5170
@Memory.deAlloc.IfElse1 // 5171
D;JNE // 5172

////PushInstruction("local 1")
@LCL // 5173
A=M+1 // 5174
D=M // 5175
@SP // 5176
AM=M+1 // 5177
A=A-1 // 5178
M=D // 5179

////PushInstruction("constant 1")
@SP // 5180
AM=M+1 // 5181
A=A-1 // 5182
M=1 // 5183

////ArithmeticInstruction{ADD}
@SP // 5184
AM=M-1 // 5185
D=M // 5186
A=A-1 // 5187
D=D+M // 5188

////PopInstruction{address=pointer 1}
@SP // 5189
AM=M-1 // 5190
D=M // 5191
@4 // 5192
M=D // 5193

////PushInstruction("that 0")
@THAT // 5194
A=M // 5195
D=M // 5196
@SP // 5197
AM=M+1 // 5198
A=A-1 // 5199
M=D // 5200

////PushInstruction("constant 1")
@SP // 5201
AM=M+1 // 5202
A=A-1 // 5203
M=1 // 5204

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq11 // 5205
D=A // 5206
@13 // 5207
M=D // 5208
@SP // 5209
AM=M-1 // 5210
D=M // 5211
A=A-1 // 5212
D=M-D // 5213
@DO_EQ // 5214
0;JMP // 5215
(COMPARE_Memory.deAlloc_eq11)

////PushInstruction("constant 0")
@SP // 5216
AM=M+1 // 5217
A=A-1 // 5218
M=0 // 5219

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq12 // 5220
D=A // 5221
@13 // 5222
M=D // 5223
@SP // 5224
AM=M-1 // 5225
D=M // 5226
A=A-1 // 5227
D=M-D // 5228
@DO_EQ // 5229
0;JMP // 5230
(COMPARE_Memory.deAlloc_eq12)

////IfGotoInstruction{label='Memory.deAlloc.IfElse2}
// if-goto Memory.deAlloc.IfElse2
@SP // 5231
AM=M-1 // 5232
D=M // 5233
@Memory.deAlloc.IfElse2 // 5234
D;JNE // 5235

////PushInstruction("constant 2048")
@2048 // 5236
D=A // 5237
@SP // 5238
AM=M+1 // 5239
A=A-1 // 5240
M=D // 5241

////PushInstruction("local 1")
@LCL // 5242
A=M+1 // 5243
D=M // 5244
@SP // 5245
AM=M+1 // 5246
A=A-1 // 5247
M=D // 5248

////PushInstruction("constant 0")
@SP // 5249
AM=M+1 // 5250
A=A-1 // 5251
M=0 // 5252

////ArithmeticInstruction{ADD}
@SP // 5253
AM=M-1 // 5254
D=M // 5255
A=A-1 // 5256
D=D+M // 5257

////PopInstruction{address=pointer 1}
@SP // 5258
AM=M-1 // 5259
D=M // 5260
@4 // 5261
M=D // 5262

////PushInstruction("that 0")
@THAT // 5263
A=M // 5264
D=M // 5265
@SP // 5266
AM=M+1 // 5267
A=A-1 // 5268
M=D // 5269

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=0, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 5270
D=A // 5271
@14 // 5272
M=D // 5273
@Memory.getBinIndex // 5274
D=A // 5275
@13 // 5276
M=D // 5277
@Memory.deAlloc.ret.0 // 5278
D=A // 5279
@CALL // 5280
0;JMP // 5281
(Memory.deAlloc.ret.0)

////ArithmeticInstruction{ADD}
@SP // 5282
AM=M-1 // 5283
D=M // 5284
A=A-1 // 5285
D=D+M // 5286

////PushInstruction("local 1")
@LCL // 5287
A=M+1 // 5288
D=M // 5289
@SP // 5290
AM=M+1 // 5291
A=A-1 // 5292
M=D // 5293

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=1, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 5294
D=A // 5295
@14 // 5296
M=D // 5297
@Memory.remove_node // 5298
D=A // 5299
@13 // 5300
M=D // 5301
@Memory.deAlloc.ret.1 // 5302
D=A // 5303
@CALL // 5304
0;JMP // 5305
(Memory.deAlloc.ret.1)

////PopInstruction{address=temp 0}
@SP // 5306
AM=M-1 // 5307
D=M // 5308
@5 // 5309
M=D // 5310

////PushInstruction("local 1")
@LCL // 5311
A=M+1 // 5312
D=M // 5313
@SP // 5314
AM=M+1 // 5315
A=A-1 // 5316
M=D // 5317

////PushInstruction("constant 0")
@SP // 5318
AM=M+1 // 5319
A=A-1 // 5320
M=0 // 5321

////ArithmeticInstruction{ADD}
@SP // 5322
AM=M-1 // 5323
D=M // 5324
A=A-1 // 5325
D=D+M // 5326

////PopInstruction{address=pointer 1}
@SP // 5327
AM=M-1 // 5328
D=M // 5329
@4 // 5330
M=D // 5331

////PushInstruction("that 0")
@THAT // 5332
A=M // 5333
D=M // 5334
@SP // 5335
AM=M+1 // 5336
A=A-1 // 5337
M=D // 5338

////PushInstruction("local 0")
@LCL // 5339
A=M // 5340
D=M // 5341
@SP // 5342
AM=M+1 // 5343
A=A-1 // 5344
M=D // 5345

////PushInstruction("constant 0")
@SP // 5346
AM=M+1 // 5347
A=A-1 // 5348
M=0 // 5349

////ArithmeticInstruction{ADD}
@SP // 5350
AM=M-1 // 5351
D=M // 5352
A=A-1 // 5353
D=D+M // 5354

////PopInstruction{address=pointer 1}
@SP // 5355
AM=M-1 // 5356
D=M // 5357
@4 // 5358
M=D // 5359

////PushInstruction("that 0")
@THAT // 5360
A=M // 5361
D=M // 5362
@SP // 5363
AM=M+1 // 5364
A=A-1 // 5365
M=D // 5366

////ArithmeticInstruction{ADD}
@SP // 5367
AM=M-1 // 5368
D=M // 5369
A=A-1 // 5370
D=D+M // 5371

////PushInstruction("constant 5")
@5 // 5372
D=A // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377

////ArithmeticInstruction{ADD}
@SP // 5378
AM=M-1 // 5379
D=M // 5380
A=A-1 // 5381
D=D+M // 5382

////PushInstruction("local 1")
@LCL // 5383
A=M+1 // 5384
D=M // 5385
@SP // 5386
AM=M+1 // 5387
A=A-1 // 5388
M=D // 5389

////PushInstruction("constant 0")
@SP // 5390
AM=M+1 // 5391
A=A-1 // 5392
M=0 // 5393

////ArithmeticInstruction{ADD}
@SP // 5394
AM=M-1 // 5395
D=M // 5396
A=A-1 // 5397
D=D+M // 5398

////PopInstruction{address=pointer 1}
@SP // 5399
AM=M-1 // 5400
D=M // 5401
@4 // 5402
M=D // 5403

////PopInstruction{address=that 0}
@SP // 5404
AM=M-1 // 5405
D=M // 5406
@THAT // 5407
A=M // 5408
M=D // 5409

////PushInstruction("local 1")
@LCL // 5410
A=M+1 // 5411
D=M // 5412
@SP // 5413
AM=M+1 // 5414
A=A-1 // 5415
M=D // 5416

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=2, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 5417
D=A // 5418
@14 // 5419
M=D // 5420
@Memory.create_foot // 5421
D=A // 5422
@13 // 5423
M=D // 5424
@Memory.deAlloc.ret.2 // 5425
D=A // 5426
@CALL // 5427
0;JMP // 5428
(Memory.deAlloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 5429
AM=M-1 // 5430
D=M // 5431
@5 // 5432
M=D // 5433

////PushInstruction("local 1")
@LCL // 5434
A=M+1 // 5435
D=M // 5436
@SP // 5437
AM=M+1 // 5438
A=A-1 // 5439
M=D // 5440

////PopInstruction{address=local 0}
@SP // 5441
AM=M-1 // 5442
D=M // 5443
@LCL // 5444
A=M // 5445
M=D // 5446

////GotoInstruction{label='Memory.deAlloc.IfElseEND2}
// goto Memory.deAlloc.IfElseEND2
@Memory.deAlloc.IfElseEND2 // 5447
0;JMP // 5448

////LabelInstruction{label='Memory.deAlloc.IfElse2}
// label Memory.deAlloc.IfElse2
(Memory.deAlloc.IfElse2)

////LabelInstruction{label='Memory.deAlloc.IfElseEND2}
// label Memory.deAlloc.IfElseEND2
(Memory.deAlloc.IfElseEND2)

////GotoInstruction{label='Memory.deAlloc.IfElseEND1}
// goto Memory.deAlloc.IfElseEND1
@Memory.deAlloc.IfElseEND1 // 5449
0;JMP // 5450

////LabelInstruction{label='Memory.deAlloc.IfElse1}
// label Memory.deAlloc.IfElse1
(Memory.deAlloc.IfElse1)

////LabelInstruction{label='Memory.deAlloc.IfElseEND1}
// label Memory.deAlloc.IfElseEND1
(Memory.deAlloc.IfElseEND1)

////PushInstruction("local 2")
@LCL // 5451
A=M+1 // 5452
A=A+1 // 5453
D=M // 5454
@SP // 5455
AM=M+1 // 5456
A=A-1 // 5457
M=D // 5458

////PushInstruction("constant 0")
@SP // 5459
AM=M+1 // 5460
A=A-1 // 5461
M=0 // 5462

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq13 // 5463
D=A // 5464
@13 // 5465
M=D // 5466
@SP // 5467
AM=M-1 // 5468
D=M // 5469
A=A-1 // 5470
D=M-D // 5471
@DO_EQ // 5472
0;JMP // 5473
(COMPARE_Memory.deAlloc_eq13)

////ArithmeticInstruction{NOT}
@SP // 5474
A=M-1 // 5475
M=!M // 5476

////PushInstruction("constant 0")
@SP // 5477
AM=M+1 // 5478
A=A-1 // 5479
M=0 // 5480

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq14 // 5481
D=A // 5482
@13 // 5483
M=D // 5484
@SP // 5485
AM=M-1 // 5486
D=M // 5487
A=A-1 // 5488
D=M-D // 5489
@DO_EQ // 5490
0;JMP // 5491
(COMPARE_Memory.deAlloc_eq14)

////IfGotoInstruction{label='Memory.deAlloc.IfElse3}
// if-goto Memory.deAlloc.IfElse3
@SP // 5492
AM=M-1 // 5493
D=M // 5494
@Memory.deAlloc.IfElse3 // 5495
D;JNE // 5496

////PushInstruction("local 2")
@LCL // 5497
A=M+1 // 5498
A=A+1 // 5499
D=M // 5500
@SP // 5501
AM=M+1 // 5502
A=A-1 // 5503
M=D // 5504

////PushInstruction("constant 1")
@SP // 5505
AM=M+1 // 5506
A=A-1 // 5507
M=1 // 5508

////ArithmeticInstruction{ADD}
@SP // 5509
AM=M-1 // 5510
D=M // 5511
A=A-1 // 5512
D=D+M // 5513

////PopInstruction{address=pointer 1}
@SP // 5514
AM=M-1 // 5515
D=M // 5516
@4 // 5517
M=D // 5518

////PushInstruction("that 0")
@THAT // 5519
A=M // 5520
D=M // 5521
@SP // 5522
AM=M+1 // 5523
A=A-1 // 5524
M=D // 5525

////PushInstruction("constant 1")
@SP // 5526
AM=M+1 // 5527
A=A-1 // 5528
M=1 // 5529

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq15 // 5530
D=A // 5531
@13 // 5532
M=D // 5533
@SP // 5534
AM=M-1 // 5535
D=M // 5536
A=A-1 // 5537
D=M-D // 5538
@DO_EQ // 5539
0;JMP // 5540
(COMPARE_Memory.deAlloc_eq15)

////PushInstruction("constant 0")
@SP // 5541
AM=M+1 // 5542
A=A-1 // 5543
M=0 // 5544

////ArithmeticInstruction{EQ}
@COMPARE_Memory.deAlloc_eq16 // 5545
D=A // 5546
@13 // 5547
M=D // 5548
@SP // 5549
AM=M-1 // 5550
D=M // 5551
A=A-1 // 5552
D=M-D // 5553
@DO_EQ // 5554
0;JMP // 5555
(COMPARE_Memory.deAlloc_eq16)

////IfGotoInstruction{label='Memory.deAlloc.IfElse4}
// if-goto Memory.deAlloc.IfElse4
@SP // 5556
AM=M-1 // 5557
D=M // 5558
@Memory.deAlloc.IfElse4 // 5559
D;JNE // 5560

////PushInstruction("constant 2048")
@2048 // 5561
D=A // 5562
@SP // 5563
AM=M+1 // 5564
A=A-1 // 5565
M=D // 5566

////PushInstruction("local 2")
@LCL // 5567
A=M+1 // 5568
A=A+1 // 5569
D=M // 5570
@SP // 5571
AM=M+1 // 5572
A=A-1 // 5573
M=D // 5574

////PushInstruction("constant 0")
@SP // 5575
AM=M+1 // 5576
A=A-1 // 5577
M=0 // 5578

////ArithmeticInstruction{ADD}
@SP // 5579
AM=M-1 // 5580
D=M // 5581
A=A-1 // 5582
D=D+M // 5583

////PopInstruction{address=pointer 1}
@SP // 5584
AM=M-1 // 5585
D=M // 5586
@4 // 5587
M=D // 5588

////PushInstruction("that 0")
@THAT // 5589
A=M // 5590
D=M // 5591
@SP // 5592
AM=M+1 // 5593
A=A-1 // 5594
M=D // 5595

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=3, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 5596
D=A // 5597
@14 // 5598
M=D // 5599
@Memory.getBinIndex // 5600
D=A // 5601
@13 // 5602
M=D // 5603
@Memory.deAlloc.ret.3 // 5604
D=A // 5605
@CALL // 5606
0;JMP // 5607
(Memory.deAlloc.ret.3)

////ArithmeticInstruction{ADD}
@SP // 5608
AM=M-1 // 5609
D=M // 5610
A=A-1 // 5611
D=D+M // 5612

////PushInstruction("local 2")
@LCL // 5613
A=M+1 // 5614
A=A+1 // 5615
D=M // 5616
@SP // 5617
AM=M+1 // 5618
A=A-1 // 5619
M=D // 5620

////CallInstruction{calleeFunction='Memory.remove_node', numArgs=2, funcMapping={Memory.deAlloc=4, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.remove_node
@7 // 5621
D=A // 5622
@14 // 5623
M=D // 5624
@Memory.remove_node // 5625
D=A // 5626
@13 // 5627
M=D // 5628
@Memory.deAlloc.ret.4 // 5629
D=A // 5630
@CALL // 5631
0;JMP // 5632
(Memory.deAlloc.ret.4)

////PopInstruction{address=temp 0}
@SP // 5633
AM=M-1 // 5634
D=M // 5635
@5 // 5636
M=D // 5637

////PushInstruction("local 0")
@LCL // 5638
A=M // 5639
D=M // 5640
@SP // 5641
AM=M+1 // 5642
A=A-1 // 5643
M=D // 5644

////PushInstruction("constant 0")
@SP // 5645
AM=M+1 // 5646
A=A-1 // 5647
M=0 // 5648

////ArithmeticInstruction{ADD}
@SP // 5649
AM=M-1 // 5650
D=M // 5651
A=A-1 // 5652
D=D+M // 5653

////PopInstruction{address=pointer 1}
@SP // 5654
AM=M-1 // 5655
D=M // 5656
@4 // 5657
M=D // 5658

////PushInstruction("that 0")
@THAT // 5659
A=M // 5660
D=M // 5661
@SP // 5662
AM=M+1 // 5663
A=A-1 // 5664
M=D // 5665

////PushInstruction("local 2")
@LCL // 5666
A=M+1 // 5667
A=A+1 // 5668
D=M // 5669
@SP // 5670
AM=M+1 // 5671
A=A-1 // 5672
M=D // 5673

////PushInstruction("constant 0")
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=0 // 5677

////ArithmeticInstruction{ADD}
@SP // 5678
AM=M-1 // 5679
D=M // 5680
A=A-1 // 5681
D=D+M // 5682

////PopInstruction{address=pointer 1}
@SP // 5683
AM=M-1 // 5684
D=M // 5685
@4 // 5686
M=D // 5687

////PushInstruction("that 0")
@THAT // 5688
A=M // 5689
D=M // 5690
@SP // 5691
AM=M+1 // 5692
A=A-1 // 5693
M=D // 5694

////ArithmeticInstruction{ADD}
@SP // 5695
AM=M-1 // 5696
D=M // 5697
A=A-1 // 5698
D=D+M // 5699

////PushInstruction("constant 5")
@5 // 5700
D=A // 5701
@SP // 5702
AM=M+1 // 5703
A=A-1 // 5704
M=D // 5705

////ArithmeticInstruction{ADD}
@SP // 5706
AM=M-1 // 5707
D=M // 5708
A=A-1 // 5709
D=D+M // 5710

////PushInstruction("local 0")
@LCL // 5711
A=M // 5712
D=M // 5713
@SP // 5714
AM=M+1 // 5715
A=A-1 // 5716
M=D // 5717

////PushInstruction("constant 0")
@SP // 5718
AM=M+1 // 5719
A=A-1 // 5720
M=0 // 5721

////ArithmeticInstruction{ADD}
@SP // 5722
AM=M-1 // 5723
D=M // 5724
A=A-1 // 5725
D=D+M // 5726

////PopInstruction{address=pointer 1}
@SP // 5727
AM=M-1 // 5728
D=M // 5729
@4 // 5730
M=D // 5731

////PopInstruction{address=that 0}
@SP // 5732
AM=M-1 // 5733
D=M // 5734
@THAT // 5735
A=M // 5736
M=D // 5737

////PushInstruction("local 0")
@LCL // 5738
A=M // 5739
D=M // 5740
@SP // 5741
AM=M+1 // 5742
A=A-1 // 5743
M=D // 5744

////CallInstruction{calleeFunction='Memory.create_foot', numArgs=1, funcMapping={Memory.deAlloc=5, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.create_foot
@6 // 5745
D=A // 5746
@14 // 5747
M=D // 5748
@Memory.create_foot // 5749
D=A // 5750
@13 // 5751
M=D // 5752
@Memory.deAlloc.ret.5 // 5753
D=A // 5754
@CALL // 5755
0;JMP // 5756
(Memory.deAlloc.ret.5)

////PopInstruction{address=temp 0}
@SP // 5757
AM=M-1 // 5758
D=M // 5759
@5 // 5760
M=D // 5761

////GotoInstruction{label='Memory.deAlloc.IfElseEND4}
// goto Memory.deAlloc.IfElseEND4
@Memory.deAlloc.IfElseEND4 // 5762
0;JMP // 5763

////LabelInstruction{label='Memory.deAlloc.IfElse4}
// label Memory.deAlloc.IfElse4
(Memory.deAlloc.IfElse4)

////LabelInstruction{label='Memory.deAlloc.IfElseEND4}
// label Memory.deAlloc.IfElseEND4
(Memory.deAlloc.IfElseEND4)

////GotoInstruction{label='Memory.deAlloc.IfElseEND3}
// goto Memory.deAlloc.IfElseEND3
@Memory.deAlloc.IfElseEND3 // 5764
0;JMP // 5765

////LabelInstruction{label='Memory.deAlloc.IfElse3}
// label Memory.deAlloc.IfElse3
(Memory.deAlloc.IfElse3)

////LabelInstruction{label='Memory.deAlloc.IfElseEND3}
// label Memory.deAlloc.IfElseEND3
(Memory.deAlloc.IfElseEND3)

////PushInstruction("constant 2048")
@2048 // 5766
D=A // 5767
@SP // 5768
AM=M+1 // 5769
A=A-1 // 5770
M=D // 5771

////PushInstruction("local 0")
@LCL // 5772
A=M // 5773
D=M // 5774
@SP // 5775
AM=M+1 // 5776
A=A-1 // 5777
M=D // 5778

////PushInstruction("constant 0")
@SP // 5779
AM=M+1 // 5780
A=A-1 // 5781
M=0 // 5782

////ArithmeticInstruction{ADD}
@SP // 5783
AM=M-1 // 5784
D=M // 5785
A=A-1 // 5786
D=D+M // 5787

////PopInstruction{address=pointer 1}
@SP // 5788
AM=M-1 // 5789
D=M // 5790
@4 // 5791
M=D // 5792

////PushInstruction("that 0")
@THAT // 5793
A=M // 5794
D=M // 5795
@SP // 5796
AM=M+1 // 5797
A=A-1 // 5798
M=D // 5799

////CallInstruction{calleeFunction='Memory.getBinIndex', numArgs=1, funcMapping={Memory.deAlloc=6, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.getBinIndex
@6 // 5800
D=A // 5801
@14 // 5802
M=D // 5803
@Memory.getBinIndex // 5804
D=A // 5805
@13 // 5806
M=D // 5807
@Memory.deAlloc.ret.6 // 5808
D=A // 5809
@CALL // 5810
0;JMP // 5811
(Memory.deAlloc.ret.6)

////ArithmeticInstruction{ADD}
@SP // 5812
AM=M-1 // 5813
D=M // 5814
A=A-1 // 5815
D=D+M // 5816

////PushInstruction("local 0")
@LCL // 5817
A=M // 5818
D=M // 5819
@SP // 5820
AM=M+1 // 5821
A=A-1 // 5822
M=D // 5823

////CallInstruction{calleeFunction='Memory.add_node', numArgs=2, funcMapping={Memory.deAlloc=7, Memory.alloc=10, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.deAlloc'}
// call Memory.add_node
@7 // 5824
D=A // 5825
@14 // 5826
M=D // 5827
@Memory.add_node // 5828
D=A // 5829
@13 // 5830
M=D // 5831
@Memory.deAlloc.ret.7 // 5832
D=A // 5833
@CALL // 5834
0;JMP // 5835
(Memory.deAlloc.ret.7)

////PopInstruction{address=temp 0}
@SP // 5836
AM=M-1 // 5837
D=M // 5838
@5 // 5839
M=D // 5840

////PushInstruction("constant 0")
@SP // 5841
AM=M+1 // 5842
A=A-1 // 5843
M=0 // 5844

////ReturnInstruction{}
@RETURN // 5845
0;JMP // 5846

////FunctionInstruction{functionName='Memory.realloc', numLocals=4, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.calloc=1, Memory.init=2}}
// function Memory.realloc with 4
(Memory.realloc)
@SP // 5847
AM=M+1 // 5848
A=A-1 // 5849
M=0 // 5850
@SP // 5851
AM=M+1 // 5852
A=A-1 // 5853
M=0 // 5854
@SP // 5855
AM=M+1 // 5856
A=A-1 // 5857
M=0 // 5858
@SP // 5859
AM=M+1 // 5860
A=A-1 // 5861
M=0 // 5862

////PushInstruction("argument 0")
@ARG // 5863
A=M // 5864
D=M // 5865
@SP // 5866
AM=M+1 // 5867
A=A-1 // 5868
M=D // 5869

////PushInstruction("constant 0")
@SP // 5870
AM=M+1 // 5871
A=A-1 // 5872
M=0 // 5873

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq17 // 5874
D=A // 5875
@13 // 5876
M=D // 5877
@SP // 5878
AM=M-1 // 5879
D=M // 5880
A=A-1 // 5881
D=M-D // 5882
@DO_EQ // 5883
0;JMP // 5884
(COMPARE_Memory.realloc_eq17)

////PushInstruction("constant 0")
@SP // 5885
AM=M+1 // 5886
A=A-1 // 5887
M=0 // 5888

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq18 // 5889
D=A // 5890
@13 // 5891
M=D // 5892
@SP // 5893
AM=M-1 // 5894
D=M // 5895
A=A-1 // 5896
D=M-D // 5897
@DO_EQ // 5898
0;JMP // 5899
(COMPARE_Memory.realloc_eq18)

////IfGotoInstruction{label='Memory.realloc.IfElse1}
// if-goto Memory.realloc.IfElse1
@SP // 5900
AM=M-1 // 5901
D=M // 5902
@Memory.realloc.IfElse1 // 5903
D;JNE // 5904

////PushInstruction("argument 1")
@ARG // 5905
A=M+1 // 5906
D=M // 5907
@SP // 5908
AM=M+1 // 5909
A=A-1 // 5910
M=D // 5911

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=0, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 5912
D=A // 5913
@14 // 5914
M=D // 5915
@Memory.alloc // 5916
D=A // 5917
@13 // 5918
M=D // 5919
@Memory.realloc.ret.0 // 5920
D=A // 5921
@CALL // 5922
0;JMP // 5923
(Memory.realloc.ret.0)

////ReturnInstruction{}
@RETURN // 5924
0;JMP // 5925

////GotoInstruction{label='Memory.realloc.IfElseEND1}
// goto Memory.realloc.IfElseEND1
@Memory.realloc.IfElseEND1 // 5926
0;JMP // 5927

////LabelInstruction{label='Memory.realloc.IfElse1}
// label Memory.realloc.IfElse1
(Memory.realloc.IfElse1)

////LabelInstruction{label='Memory.realloc.IfElseEND1}
// label Memory.realloc.IfElseEND1
(Memory.realloc.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 5928
A=M // 5929
D=M // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=D // 5934

////PushInstruction("constant 1")
@SP // 5935
AM=M+1 // 5936
A=A-1 // 5937
M=1 // 5938

////ArithmeticInstruction{SUB}
@SP // 5939
AM=M-1 // 5940
D=M // 5941
A=A-1 // 5942
D=M-D // 5943

////PopInstruction{address=local 3}
@SP // 5944
AM=M-1 // 5945
D=M // 5946
@LCL // 5947
A=M+1 // 5948
A=A+1 // 5949
A=A+1 // 5950
M=D // 5951

////PushInstruction("local 3")
@LCL // 5952
A=M+1 // 5953
A=A+1 // 5954
A=A+1 // 5955
D=M // 5956
@SP // 5957
AM=M+1 // 5958
A=A-1 // 5959
M=D // 5960

////PushInstruction("constant 0")
@SP // 5961
AM=M+1 // 5962
A=A-1 // 5963
M=0 // 5964

////ArithmeticInstruction{ADD}
@SP // 5965
AM=M-1 // 5966
D=M // 5967
A=A-1 // 5968
D=D+M // 5969

////PopInstruction{address=pointer 1}
@SP // 5970
AM=M-1 // 5971
D=M // 5972
@4 // 5973
M=D // 5974

////PushInstruction("that 0")
@THAT // 5975
A=M // 5976
D=M // 5977
@SP // 5978
AM=M+1 // 5979
A=A-1 // 5980
M=D // 5981

////PopInstruction{address=local 0}
@SP // 5982
AM=M-1 // 5983
D=M // 5984
@LCL // 5985
A=M // 5986
M=D // 5987

////PushInstruction("argument 1")
@ARG // 5988
A=M+1 // 5989
D=M // 5990
@SP // 5991
AM=M+1 // 5992
A=A-1 // 5993
M=D // 5994

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=1, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.alloc
@6 // 5995
D=A // 5996
@14 // 5997
M=D // 5998
@Memory.alloc // 5999
D=A // 6000
@13 // 6001
M=D // 6002
@Memory.realloc.ret.1 // 6003
D=A // 6004
@CALL // 6005
0;JMP // 6006
(Memory.realloc.ret.1)

////PopInstruction{address=local 1}
@SP // 6007
AM=M-1 // 6008
D=M // 6009
@LCL // 6010
A=M+1 // 6011
M=D // 6012

////PushInstruction("local 1")
@LCL // 6013
A=M+1 // 6014
D=M // 6015
@SP // 6016
AM=M+1 // 6017
A=A-1 // 6018
M=D // 6019

////PushInstruction("constant 0")
@SP // 6020
AM=M+1 // 6021
A=A-1 // 6022
M=0 // 6023

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq19 // 6024
D=A // 6025
@13 // 6026
M=D // 6027
@SP // 6028
AM=M-1 // 6029
D=M // 6030
A=A-1 // 6031
D=M-D // 6032
@DO_EQ // 6033
0;JMP // 6034
(COMPARE_Memory.realloc_eq19)

////PushInstruction("constant 0")
@SP // 6035
AM=M+1 // 6036
A=A-1 // 6037
M=0 // 6038

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq20 // 6039
D=A // 6040
@13 // 6041
M=D // 6042
@SP // 6043
AM=M-1 // 6044
D=M // 6045
A=A-1 // 6046
D=M-D // 6047
@DO_EQ // 6048
0;JMP // 6049
(COMPARE_Memory.realloc_eq20)

////IfGotoInstruction{label='Memory.realloc.IfElse2}
// if-goto Memory.realloc.IfElse2
@SP // 6050
AM=M-1 // 6051
D=M // 6052
@Memory.realloc.IfElse2 // 6053
D;JNE // 6054

////PushInstruction("constant 0")
@SP // 6055
AM=M+1 // 6056
A=A-1 // 6057
M=0 // 6058

////ReturnInstruction{}
@RETURN // 6059
0;JMP // 6060

////GotoInstruction{label='Memory.realloc.IfElseEND2}
// goto Memory.realloc.IfElseEND2
@Memory.realloc.IfElseEND2 // 6061
0;JMP // 6062

////LabelInstruction{label='Memory.realloc.IfElse2}
// label Memory.realloc.IfElse2
(Memory.realloc.IfElse2)

////LabelInstruction{label='Memory.realloc.IfElseEND2}
// label Memory.realloc.IfElseEND2
(Memory.realloc.IfElseEND2)

////PushInstruction("local 0")
@LCL // 6063
A=M // 6064
D=M // 6065
@SP // 6066
AM=M+1 // 6067
A=A-1 // 6068
M=D // 6069

////PushInstruction("argument 1")
@ARG // 6070
A=M+1 // 6071
D=M // 6072
@SP // 6073
AM=M+1 // 6074
A=A-1 // 6075
M=D // 6076

////ArithmeticInstruction{GT}
@COMPARE_Memory.realloc_gt21 // 6077
D=A // 6078
@13 // 6079
M=D // 6080
@SP // 6081
AM=M-1 // 6082
D=M // 6083
A=A-1 // 6084
D=M-D // 6085
@DO_GT // 6086
0;JMP // 6087
(COMPARE_Memory.realloc_gt21)

////ArithmeticInstruction{NOT}
@SP // 6088
A=M-1 // 6089
M=!M // 6090

////PushInstruction("constant 0")
@SP // 6091
AM=M+1 // 6092
A=A-1 // 6093
M=0 // 6094

////ArithmeticInstruction{EQ}
@COMPARE_Memory.realloc_eq22 // 6095
D=A // 6096
@13 // 6097
M=D // 6098
@SP // 6099
AM=M-1 // 6100
D=M // 6101
A=A-1 // 6102
D=M-D // 6103
@DO_EQ // 6104
0;JMP // 6105
(COMPARE_Memory.realloc_eq22)

////IfGotoInstruction{label='Memory.realloc.IfElse3}
// if-goto Memory.realloc.IfElse3
@SP // 6106
AM=M-1 // 6107
D=M // 6108
@Memory.realloc.IfElse3 // 6109
D;JNE // 6110

////PushInstruction("local 0")
@LCL // 6111
A=M // 6112
D=M // 6113
@SP // 6114
AM=M+1 // 6115
A=A-1 // 6116
M=D // 6117

////PopInstruction{address=local 2}
@SP // 6118
AM=M-1 // 6119
D=M // 6120
@LCL // 6121
A=M+1 // 6122
A=A+1 // 6123
M=D // 6124

////GotoInstruction{label='Memory.realloc.IfElseEND3}
// goto Memory.realloc.IfElseEND3
@Memory.realloc.IfElseEND3 // 6125
0;JMP // 6126

////LabelInstruction{label='Memory.realloc.IfElse3}
// label Memory.realloc.IfElse3
(Memory.realloc.IfElse3)

////PushInstruction("argument 1")
@ARG // 6127
A=M+1 // 6128
D=M // 6129
@SP // 6130
AM=M+1 // 6131
A=A-1 // 6132
M=D // 6133

////PopInstruction{address=local 2}
@SP // 6134
AM=M-1 // 6135
D=M // 6136
@LCL // 6137
A=M+1 // 6138
A=A+1 // 6139
M=D // 6140

////LabelInstruction{label='Memory.realloc.IfElseEND3}
// label Memory.realloc.IfElseEND3
(Memory.realloc.IfElseEND3)

////PushInstruction("argument 0")
@ARG // 6141
A=M // 6142
D=M // 6143
@SP // 6144
AM=M+1 // 6145
A=A-1 // 6146
M=D // 6147

////PushInstruction("local 1")
@LCL // 6148
A=M+1 // 6149
D=M // 6150
@SP // 6151
AM=M+1 // 6152
A=A-1 // 6153
M=D // 6154

////PushInstruction("local 2")
@LCL // 6155
A=M+1 // 6156
A=A+1 // 6157
D=M // 6158
@SP // 6159
AM=M+1 // 6160
A=A-1 // 6161
M=D // 6162

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=2, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.copy
@8 // 6163
D=A // 6164
@14 // 6165
M=D // 6166
@Memory.copy // 6167
D=A // 6168
@13 // 6169
M=D // 6170
@Memory.realloc.ret.2 // 6171
D=A // 6172
@CALL // 6173
0;JMP // 6174
(Memory.realloc.ret.2)

////PopInstruction{address=temp 0}
@SP // 6175
AM=M-1 // 6176
D=M // 6177
@5 // 6178
M=D // 6179

////PushInstruction("argument 0")
@ARG // 6180
A=M // 6181
D=M // 6182
@SP // 6183
AM=M+1 // 6184
A=A-1 // 6185
M=D // 6186

////CallInstruction{calleeFunction='Memory.deAlloc', numArgs=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=3, Memory.calloc=1, Memory.init=2}, currentFunction='Memory.realloc'}
// call Memory.deAlloc
@6 // 6187
D=A // 6188
@14 // 6189
M=D // 6190
@Memory.deAlloc // 6191
D=A // 6192
@13 // 6193
M=D // 6194
@Memory.realloc.ret.3 // 6195
D=A // 6196
@CALL // 6197
0;JMP // 6198
(Memory.realloc.ret.3)

////PopInstruction{address=temp 0}
@SP // 6199
AM=M-1 // 6200
D=M // 6201
@5 // 6202
M=D // 6203

////PushInstruction("local 1")
@LCL // 6204
A=M+1 // 6205
D=M // 6206
@SP // 6207
AM=M+1 // 6208
A=A-1 // 6209
M=D // 6210

////ReturnInstruction{}
@RETURN // 6211
0;JMP // 6212

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.copy with 1
(Memory.copy)
@SP // 6213
AM=M+1 // 6214
A=A-1 // 6215
M=0 // 6216

////PushInstruction("constant 0")
@SP // 6217
AM=M+1 // 6218
A=A-1 // 6219
M=0 // 6220

////PopInstruction{address=local 0}
@SP // 6221
AM=M-1 // 6222
D=M // 6223
@LCL // 6224
A=M // 6225
M=D // 6226

////LabelInstruction{label='WHILE_START_Memory.copy1}
// label WHILE_START_Memory.copy1
(WHILE_START_Memory.copy1)

////PushInstruction("local 0")
@LCL // 6227
A=M // 6228
D=M // 6229
@SP // 6230
AM=M+1 // 6231
A=A-1 // 6232
M=D // 6233

////PushInstruction("argument 2")
@ARG // 6234
A=M+1 // 6235
A=A+1 // 6236
D=M // 6237
@SP // 6238
AM=M+1 // 6239
A=A-1 // 6240
M=D // 6241

////ArithmeticInstruction{LT}
@COMPARE_Memory.copy_lt23 // 6242
D=A // 6243
@13 // 6244
M=D // 6245
@SP // 6246
AM=M-1 // 6247
D=M // 6248
A=A-1 // 6249
D=M-D // 6250
@DO_LT // 6251
0;JMP // 6252
(COMPARE_Memory.copy_lt23)

////PushInstruction("constant 0")
@SP // 6253
AM=M+1 // 6254
A=A-1 // 6255
M=0 // 6256

////ArithmeticInstruction{EQ}
@COMPARE_Memory.copy_eq24 // 6257
D=A // 6258
@13 // 6259
M=D // 6260
@SP // 6261
AM=M-1 // 6262
D=M // 6263
A=A-1 // 6264
D=M-D // 6265
@DO_EQ // 6266
0;JMP // 6267
(COMPARE_Memory.copy_eq24)

////IfGotoInstruction{label='WHILE_END_Memory.copy1}
// if-goto WHILE_END_Memory.copy1
@SP // 6268
AM=M-1 // 6269
D=M // 6270
@WHILE_END_Memory.copy1 // 6271
D;JNE // 6272

////PushInstruction("argument 0")
@ARG // 6273
A=M // 6274
D=M // 6275
@SP // 6276
AM=M+1 // 6277
A=A-1 // 6278
M=D // 6279

////PushInstruction("local 0")
@LCL // 6280
A=M // 6281
D=M // 6282
@SP // 6283
AM=M+1 // 6284
A=A-1 // 6285
M=D // 6286

////ArithmeticInstruction{ADD}
@SP // 6287
AM=M-1 // 6288
D=M // 6289
A=A-1 // 6290
D=D+M // 6291

////PopInstruction{address=pointer 1}
@SP // 6292
AM=M-1 // 6293
D=M // 6294
@4 // 6295
M=D // 6296

////PushInstruction("that 0")
@THAT // 6297
A=M // 6298
D=M // 6299
@SP // 6300
AM=M+1 // 6301
A=A-1 // 6302
M=D // 6303

////PushInstruction("argument 1")
@ARG // 6304
A=M+1 // 6305
D=M // 6306
@SP // 6307
AM=M+1 // 6308
A=A-1 // 6309
M=D // 6310

////PushInstruction("local 0")
@LCL // 6311
A=M // 6312
D=M // 6313
@SP // 6314
AM=M+1 // 6315
A=A-1 // 6316
M=D // 6317

////ArithmeticInstruction{ADD}
@SP // 6318
AM=M-1 // 6319
D=M // 6320
A=A-1 // 6321
D=D+M // 6322

////PopInstruction{address=pointer 1}
@SP // 6323
AM=M-1 // 6324
D=M // 6325
@4 // 6326
M=D // 6327

////PopInstruction{address=that 0}
@SP // 6328
AM=M-1 // 6329
D=M // 6330
@THAT // 6331
A=M // 6332
M=D // 6333

////PushInstruction("local 0")
@LCL // 6334
A=M // 6335
D=M // 6336
@SP // 6337
AM=M+1 // 6338
A=A-1 // 6339
M=D // 6340

////PushInstruction("constant 1")
@SP // 6341
AM=M+1 // 6342
A=A-1 // 6343
M=1 // 6344

////ArithmeticInstruction{ADD}
@SP // 6345
AM=M-1 // 6346
D=M // 6347
A=A-1 // 6348
D=D+M // 6349

////PopInstruction{address=local 0}
@SP // 6350
AM=M-1 // 6351
D=M // 6352
@LCL // 6353
A=M // 6354
M=D // 6355

////GotoInstruction{label='WHILE_START_Memory.copy1}
// goto WHILE_START_Memory.copy1
@WHILE_START_Memory.copy1 // 6356
0;JMP // 6357

////LabelInstruction{label='WHILE_END_Memory.copy1}
// label WHILE_END_Memory.copy1
(WHILE_END_Memory.copy1)

////PushInstruction("constant 0")
@SP // 6358
AM=M+1 // 6359
A=A-1 // 6360
M=0 // 6361

////ReturnInstruction{}
@RETURN // 6362
0;JMP // 6363

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2}}
// function Memory.remove_node with 0
(Memory.remove_node)

////PushInstruction("argument 1")
@ARG // 6364
A=M+1 // 6365
D=M // 6366
@SP // 6367
AM=M+1 // 6368
A=A-1 // 6369
M=D // 6370

////PushInstruction("constant 2")
@2 // 6371
D=A // 6372
@SP // 6373
AM=M+1 // 6374
A=A-1 // 6375
M=D // 6376

////ArithmeticInstruction{ADD}
@SP // 6377
AM=M-1 // 6378
D=M // 6379
A=A-1 // 6380
D=D+M // 6381

////PopInstruction{address=pointer 1}
@SP // 6382
AM=M-1 // 6383
D=M // 6384
@4 // 6385
M=D // 6386

////PushInstruction("that 0")
@THAT // 6387
A=M // 6388
D=M // 6389
@SP // 6390
AM=M+1 // 6391
A=A-1 // 6392
M=D // 6393

////PushInstruction("constant 0")
@SP // 6394
AM=M+1 // 6395
A=A-1 // 6396
M=0 // 6397

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq25 // 6398
D=A // 6399
@13 // 6400
M=D // 6401
@SP // 6402
AM=M-1 // 6403
D=M // 6404
A=A-1 // 6405
D=M-D // 6406
@DO_EQ // 6407
0;JMP // 6408
(COMPARE_Memory.remove_node_eq25)

////ArithmeticInstruction{NOT}
@SP // 6409
A=M-1 // 6410
M=!M // 6411

////PushInstruction("constant 0")
@SP // 6412
AM=M+1 // 6413
A=A-1 // 6414
M=0 // 6415

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq26 // 6416
D=A // 6417
@13 // 6418
M=D // 6419
@SP // 6420
AM=M-1 // 6421
D=M // 6422
A=A-1 // 6423
D=M-D // 6424
@DO_EQ // 6425
0;JMP // 6426
(COMPARE_Memory.remove_node_eq26)

////IfGotoInstruction{label='Memory.remove_node.IfElse1}
// if-goto Memory.remove_node.IfElse1
@SP // 6427
AM=M-1 // 6428
D=M // 6429
@Memory.remove_node.IfElse1 // 6430
D;JNE // 6431

////PushInstruction("argument 1")
@ARG // 6432
A=M+1 // 6433
D=M // 6434
@SP // 6435
AM=M+1 // 6436
A=A-1 // 6437
M=D // 6438

////PushInstruction("constant 3")
@3 // 6439
D=A // 6440
@SP // 6441
AM=M+1 // 6442
A=A-1 // 6443
M=D // 6444

////ArithmeticInstruction{ADD}
@SP // 6445
AM=M-1 // 6446
D=M // 6447
A=A-1 // 6448
D=D+M // 6449

////PopInstruction{address=pointer 1}
@SP // 6450
AM=M-1 // 6451
D=M // 6452
@4 // 6453
M=D // 6454

////PushInstruction("that 0")
@THAT // 6455
A=M // 6456
D=M // 6457
@SP // 6458
AM=M+1 // 6459
A=A-1 // 6460
M=D // 6461

////PushInstruction("argument 1")
@ARG // 6462
A=M+1 // 6463
D=M // 6464
@SP // 6465
AM=M+1 // 6466
A=A-1 // 6467
M=D // 6468

////PushInstruction("constant 2")
@2 // 6469
D=A // 6470
@SP // 6471
AM=M+1 // 6472
A=A-1 // 6473
M=D // 6474

////ArithmeticInstruction{ADD}
@SP // 6475
AM=M-1 // 6476
D=M // 6477
A=A-1 // 6478
D=D+M // 6479

////PushInstruction("constant 3")
@3 // 6480
D=A // 6481
@SP // 6482
AM=M+1 // 6483
A=A-1 // 6484
M=D // 6485

////ArithmeticInstruction{ADD}
@SP // 6486
AM=M-1 // 6487
D=M // 6488
A=A-1 // 6489
D=D+M // 6490

////PopInstruction{address=pointer 1}
@SP // 6491
AM=M-1 // 6492
D=M // 6493
@4 // 6494
M=D // 6495

////PopInstruction{address=that 0}
@SP // 6496
AM=M-1 // 6497
D=M // 6498
@THAT // 6499
A=M // 6500
M=D // 6501

////GotoInstruction{label='Memory.remove_node.IfElseEND1}
// goto Memory.remove_node.IfElseEND1
@Memory.remove_node.IfElseEND1 // 6502
0;JMP // 6503

////LabelInstruction{label='Memory.remove_node.IfElse1}
// label Memory.remove_node.IfElse1
(Memory.remove_node.IfElse1)

////PushInstruction("argument 1")
@ARG // 6504
A=M+1 // 6505
D=M // 6506
@SP // 6507
AM=M+1 // 6508
A=A-1 // 6509
M=D // 6510

////PushInstruction("constant 3")
@3 // 6511
D=A // 6512
@SP // 6513
AM=M+1 // 6514
A=A-1 // 6515
M=D // 6516

////ArithmeticInstruction{ADD}
@SP // 6517
AM=M-1 // 6518
D=M // 6519
A=A-1 // 6520
D=D+M // 6521

////PopInstruction{address=pointer 1}
@SP // 6522
AM=M-1 // 6523
D=M // 6524
@4 // 6525
M=D // 6526

////PushInstruction("that 0")
@THAT // 6527
A=M // 6528
D=M // 6529
@SP // 6530
AM=M+1 // 6531
A=A-1 // 6532
M=D // 6533

////PushInstruction("argument 0")
@ARG // 6534
A=M // 6535
D=M // 6536
@SP // 6537
AM=M+1 // 6538
A=A-1 // 6539
M=D // 6540

////PushInstruction("constant 0")
@SP // 6541
AM=M+1 // 6542
A=A-1 // 6543
M=0 // 6544

////ArithmeticInstruction{ADD}
@SP // 6545
AM=M-1 // 6546
D=M // 6547
A=A-1 // 6548
D=D+M // 6549

////PopInstruction{address=pointer 1}
@SP // 6550
AM=M-1 // 6551
D=M // 6552
@4 // 6553
M=D // 6554

////PopInstruction{address=that 0}
@SP // 6555
AM=M-1 // 6556
D=M // 6557
@THAT // 6558
A=M // 6559
M=D // 6560

////LabelInstruction{label='Memory.remove_node.IfElseEND1}
// label Memory.remove_node.IfElseEND1
(Memory.remove_node.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 6561
A=M+1 // 6562
D=M // 6563
@SP // 6564
AM=M+1 // 6565
A=A-1 // 6566
M=D // 6567

////PushInstruction("constant 3")
@3 // 6568
D=A // 6569
@SP // 6570
AM=M+1 // 6571
A=A-1 // 6572
M=D // 6573

////ArithmeticInstruction{ADD}
@SP // 6574
AM=M-1 // 6575
D=M // 6576
A=A-1 // 6577
D=D+M // 6578

////PopInstruction{address=pointer 1}
@SP // 6579
AM=M-1 // 6580
D=M // 6581
@4 // 6582
M=D // 6583

////PushInstruction("that 0")
@THAT // 6584
A=M // 6585
D=M // 6586
@SP // 6587
AM=M+1 // 6588
A=A-1 // 6589
M=D // 6590

////PushInstruction("constant 0")
@SP // 6591
AM=M+1 // 6592
A=A-1 // 6593
M=0 // 6594

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq27 // 6595
D=A // 6596
@13 // 6597
M=D // 6598
@SP // 6599
AM=M-1 // 6600
D=M // 6601
A=A-1 // 6602
D=M-D // 6603
@DO_EQ // 6604
0;JMP // 6605
(COMPARE_Memory.remove_node_eq27)

////ArithmeticInstruction{NOT}
@SP // 6606
A=M-1 // 6607
M=!M // 6608

////PushInstruction("constant 0")
@SP // 6609
AM=M+1 // 6610
A=A-1 // 6611
M=0 // 6612

////ArithmeticInstruction{EQ}
@COMPARE_Memory.remove_node_eq28 // 6613
D=A // 6614
@13 // 6615
M=D // 6616
@SP // 6617
AM=M-1 // 6618
D=M // 6619
A=A-1 // 6620
D=M-D // 6621
@DO_EQ // 6622
0;JMP // 6623
(COMPARE_Memory.remove_node_eq28)

////IfGotoInstruction{label='Memory.remove_node.IfElse2}
// if-goto Memory.remove_node.IfElse2
@SP // 6624
AM=M-1 // 6625
D=M // 6626
@Memory.remove_node.IfElse2 // 6627
D;JNE // 6628

////PushInstruction("argument 1")
@ARG // 6629
A=M+1 // 6630
D=M // 6631
@SP // 6632
AM=M+1 // 6633
A=A-1 // 6634
M=D // 6635

////PushInstruction("constant 2")
@2 // 6636
D=A // 6637
@SP // 6638
AM=M+1 // 6639
A=A-1 // 6640
M=D // 6641

////ArithmeticInstruction{ADD}
@SP // 6642
AM=M-1 // 6643
D=M // 6644
A=A-1 // 6645
D=D+M // 6646

////PopInstruction{address=pointer 1}
@SP // 6647
AM=M-1 // 6648
D=M // 6649
@4 // 6650
M=D // 6651

////PushInstruction("that 0")
@THAT // 6652
A=M // 6653
D=M // 6654
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=D // 6658

////PushInstruction("argument 1")
@ARG // 6659
A=M+1 // 6660
D=M // 6661
@SP // 6662
AM=M+1 // 6663
A=A-1 // 6664
M=D // 6665

////PushInstruction("constant 3")
@3 // 6666
D=A // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=D // 6671

////ArithmeticInstruction{ADD}
@SP // 6672
AM=M-1 // 6673
D=M // 6674
A=A-1 // 6675
D=D+M // 6676

////PushInstruction("constant 2")
@2 // 6677
D=A // 6678
@SP // 6679
AM=M+1 // 6680
A=A-1 // 6681
M=D // 6682

////ArithmeticInstruction{ADD}
@SP // 6683
AM=M-1 // 6684
D=M // 6685
A=A-1 // 6686
D=D+M // 6687

////PopInstruction{address=pointer 1}
@SP // 6688
AM=M-1 // 6689
D=M // 6690
@4 // 6691
M=D // 6692

////PopInstruction{address=that 0}
@SP // 6693
AM=M-1 // 6694
D=M // 6695
@THAT // 6696
A=M // 6697
M=D // 6698

////GotoInstruction{label='Memory.remove_node.IfElseEND2}
// goto Memory.remove_node.IfElseEND2
@Memory.remove_node.IfElseEND2 // 6699
0;JMP // 6700

////LabelInstruction{label='Memory.remove_node.IfElse2}
// label Memory.remove_node.IfElse2
(Memory.remove_node.IfElse2)

////LabelInstruction{label='Memory.remove_node.IfElseEND2}
// label Memory.remove_node.IfElseEND2
(Memory.remove_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 6701
AM=M+1 // 6702
A=A-1 // 6703
M=0 // 6704

////PushInstruction("argument 1")
@ARG // 6705
A=M+1 // 6706
D=M // 6707
@SP // 6708
AM=M+1 // 6709
A=A-1 // 6710
M=D // 6711

////PushInstruction("constant 2")
@2 // 6712
D=A // 6713
@SP // 6714
AM=M+1 // 6715
A=A-1 // 6716
M=D // 6717

////ArithmeticInstruction{ADD}
@SP // 6718
AM=M-1 // 6719
D=M // 6720
A=A-1 // 6721
D=D+M // 6722

////PopInstruction{address=pointer 1}
@SP // 6723
AM=M-1 // 6724
D=M // 6725
@4 // 6726
M=D // 6727

////PopInstruction{address=that 0}
@SP // 6728
AM=M-1 // 6729
D=M // 6730
@THAT // 6731
A=M // 6732
M=D // 6733

////PushInstruction("constant 0")
@SP // 6734
AM=M+1 // 6735
A=A-1 // 6736
M=0 // 6737

////PushInstruction("argument 1")
@ARG // 6738
A=M+1 // 6739
D=M // 6740
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=D // 6744

////PushInstruction("constant 3")
@3 // 6745
D=A // 6746
@SP // 6747
AM=M+1 // 6748
A=A-1 // 6749
M=D // 6750

////ArithmeticInstruction{ADD}
@SP // 6751
AM=M-1 // 6752
D=M // 6753
A=A-1 // 6754
D=D+M // 6755

////PopInstruction{address=pointer 1}
@SP // 6756
AM=M-1 // 6757
D=M // 6758
@4 // 6759
M=D // 6760

////PopInstruction{address=that 0}
@SP // 6761
AM=M-1 // 6762
D=M // 6763
@THAT // 6764
A=M // 6765
M=D // 6766

////PushInstruction("constant 0")
@SP // 6767
AM=M+1 // 6768
A=A-1 // 6769
M=0 // 6770

////ReturnInstruction{}
@RETURN // 6771
0;JMP // 6772

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.remove_node=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 6773
AM=M+1 // 6774
A=A-1 // 6775
M=0 // 6776

////PushInstruction("constant 0")
@SP // 6777
AM=M+1 // 6778
A=A-1 // 6779
M=0 // 6780

////PopInstruction{address=local 0}
@SP // 6781
AM=M-1 // 6782
D=M // 6783
@LCL // 6784
A=M // 6785
M=D // 6786

////LabelInstruction{label='WHILE_START_Memory.getBinIndex1}
// label WHILE_START_Memory.getBinIndex1
(WHILE_START_Memory.getBinIndex1)

////PushInstruction("local 0")
@LCL // 6787
A=M // 6788
D=M // 6789
@SP // 6790
AM=M+1 // 6791
A=A-1 // 6792
M=D // 6793

////PushInstruction("constant 7")
@7 // 6794
D=A // 6795
@SP // 6796
AM=M+1 // 6797
A=A-1 // 6798
M=D // 6799

////ArithmeticInstruction{LT}
@COMPARE_Memory.getBinIndex_lt29 // 6800
D=A // 6801
@13 // 6802
M=D // 6803
@SP // 6804
AM=M-1 // 6805
D=M // 6806
A=A-1 // 6807
D=M-D // 6808
@DO_LT // 6809
0;JMP // 6810
(COMPARE_Memory.getBinIndex_lt29)

////PushInstruction("constant 2048")
@2048 // 6811
D=A // 6812
@SP // 6813
AM=M+1 // 6814
A=A-1 // 6815
M=D // 6816

////PushInstruction("local 0")
@LCL // 6817
A=M // 6818
D=M // 6819
@SP // 6820
AM=M+1 // 6821
A=A-1 // 6822
M=D // 6823

////ArithmeticInstruction{ADD}
@SP // 6824
AM=M-1 // 6825
D=M // 6826
A=A-1 // 6827
D=D+M // 6828

////PopInstruction{address=pointer 1}
@SP // 6829
AM=M-1 // 6830
D=M // 6831
@4 // 6832
M=D // 6833

////PushInstruction("that 0")
@THAT // 6834
A=M // 6835
D=M // 6836
@SP // 6837
AM=M+1 // 6838
A=A-1 // 6839
M=D // 6840

////PushInstruction("constant 0")
@SP // 6841
AM=M+1 // 6842
A=A-1 // 6843
M=0 // 6844

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq30 // 6845
D=A // 6846
@13 // 6847
M=D // 6848
@SP // 6849
AM=M-1 // 6850
D=M // 6851
A=A-1 // 6852
D=M-D // 6853
@DO_EQ // 6854
0;JMP // 6855
(COMPARE_Memory.getBinIndex_eq30)

////ArithmeticInstruction{NOT}
@SP // 6856
A=M-1 // 6857
M=!M // 6858

////ArithmeticInstruction{AND}
@SP // 6859
AM=M-1 // 6860
D=M // 6861
A=A-1 // 6862
D=D&M // 6863

////PushInstruction("constant 0")
@SP // 6864
AM=M+1 // 6865
A=A-1 // 6866
M=0 // 6867

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq31 // 6868
D=A // 6869
@13 // 6870
M=D // 6871
@SP // 6872
AM=M-1 // 6873
D=M // 6874
A=A-1 // 6875
D=M-D // 6876
@DO_EQ // 6877
0;JMP // 6878
(COMPARE_Memory.getBinIndex_eq31)

////IfGotoInstruction{label='WHILE_END_Memory.getBinIndex1}
// if-goto WHILE_END_Memory.getBinIndex1
@SP // 6879
AM=M-1 // 6880
D=M // 6881
@WHILE_END_Memory.getBinIndex1 // 6882
D;JNE // 6883

////PushInstruction("argument 0")
@ARG // 6884
A=M // 6885
D=M // 6886
@SP // 6887
AM=M+1 // 6888
A=A-1 // 6889
M=D // 6890

////PushInstruction("local 0")
@LCL // 6891
A=M // 6892
D=M // 6893
@SP // 6894
AM=M+1 // 6895
A=A-1 // 6896
M=D // 6897

////PushInstruction("constant 1")
@SP // 6898
AM=M+1 // 6899
A=A-1 // 6900
M=1 // 6901

////ArithmeticInstruction{ADD}
@SP // 6902
AM=M-1 // 6903
D=M // 6904
A=A-1 // 6905
D=D+M // 6906

////PushInstruction("constant 16")
@16 // 6907
D=A // 6908
@SP // 6909
AM=M+1 // 6910
A=A-1 // 6911
M=D // 6912

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=0, Memory.remove_node=0}, currentFunction='Memory.getBinIndex'}
// call Math.multiply
@7 // 6913
D=A // 6914
@14 // 6915
M=D // 6916
@Math.multiply // 6917
D=A // 6918
@13 // 6919
M=D // 6920
@Memory.getBinIndex.ret.0 // 6921
D=A // 6922
@CALL // 6923
0;JMP // 6924
(Memory.getBinIndex.ret.0)

////ArithmeticInstruction{GT}
@COMPARE_Memory.getBinIndex_gt32 // 6925
D=A // 6926
@13 // 6927
M=D // 6928
@SP // 6929
AM=M-1 // 6930
D=M // 6931
A=A-1 // 6932
D=M-D // 6933
@DO_GT // 6934
0;JMP // 6935
(COMPARE_Memory.getBinIndex_gt32)

////ArithmeticInstruction{NOT}
@SP // 6936
A=M-1 // 6937
M=!M // 6938

////PushInstruction("constant 0")
@SP // 6939
AM=M+1 // 6940
A=A-1 // 6941
M=0 // 6942

////ArithmeticInstruction{EQ}
@COMPARE_Memory.getBinIndex_eq33 // 6943
D=A // 6944
@13 // 6945
M=D // 6946
@SP // 6947
AM=M-1 // 6948
D=M // 6949
A=A-1 // 6950
D=M-D // 6951
@DO_EQ // 6952
0;JMP // 6953
(COMPARE_Memory.getBinIndex_eq33)

////IfGotoInstruction{label='Memory.getBinIndex.IfElse1}
// if-goto Memory.getBinIndex.IfElse1
@SP // 6954
AM=M-1 // 6955
D=M // 6956
@Memory.getBinIndex.IfElse1 // 6957
D;JNE // 6958

////PushInstruction("local 0")
@LCL // 6959
A=M // 6960
D=M // 6961
@SP // 6962
AM=M+1 // 6963
A=A-1 // 6964
M=D // 6965

////ReturnInstruction{}
@RETURN // 6966
0;JMP // 6967

////GotoInstruction{label='Memory.getBinIndex.IfElseEND1}
// goto Memory.getBinIndex.IfElseEND1
@Memory.getBinIndex.IfElseEND1 // 6968
0;JMP // 6969

////LabelInstruction{label='Memory.getBinIndex.IfElse1}
// label Memory.getBinIndex.IfElse1
(Memory.getBinIndex.IfElse1)

////LabelInstruction{label='Memory.getBinIndex.IfElseEND1}
// label Memory.getBinIndex.IfElseEND1
(Memory.getBinIndex.IfElseEND1)

////PushInstruction("local 0")
@LCL // 6970
A=M // 6971
D=M // 6972
@SP // 6973
AM=M+1 // 6974
A=A-1 // 6975
M=D // 6976

////PushInstruction("constant 1")
@SP // 6977
AM=M+1 // 6978
A=A-1 // 6979
M=1 // 6980

////ArithmeticInstruction{ADD}
@SP // 6981
AM=M-1 // 6982
D=M // 6983
A=A-1 // 6984
D=D+M // 6985

////PopInstruction{address=local 0}
@SP // 6986
AM=M-1 // 6987
D=M // 6988
@LCL // 6989
A=M // 6990
M=D // 6991

////GotoInstruction{label='WHILE_START_Memory.getBinIndex1}
// goto WHILE_START_Memory.getBinIndex1
@WHILE_START_Memory.getBinIndex1 // 6992
0;JMP // 6993

////LabelInstruction{label='WHILE_END_Memory.getBinIndex1}
// label WHILE_END_Memory.getBinIndex1
(WHILE_END_Memory.getBinIndex1)

////PushInstruction("constant 7")
@7 // 6994
D=A // 6995
@SP // 6996
AM=M+1 // 6997
A=A-1 // 6998
M=D // 6999

////PushInstruction("constant 1")
@SP // 7000
AM=M+1 // 7001
A=A-1 // 7002
M=1 // 7003

////ArithmeticInstruction{SUB}
@SP // 7004
AM=M-1 // 7005
D=M // 7006
A=A-1 // 7007
D=M-D // 7008

////ReturnInstruction{}
@RETURN // 7009
0;JMP // 7010

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 7011
AM=M+1 // 7012
A=A-1 // 7013
M=0 // 7014

////PushInstruction("argument 0")
@ARG // 7015
A=M // 7016
D=M // 7017
@SP // 7018
AM=M+1 // 7019
A=A-1 // 7020
M=D // 7021

////PushInstruction("constant 0")
@SP // 7022
AM=M+1 // 7023
A=A-1 // 7024
M=0 // 7025

////ArithmeticInstruction{ADD}
@SP // 7026
AM=M-1 // 7027
D=M // 7028
A=A-1 // 7029
D=D+M // 7030

////PopInstruction{address=pointer 1}
@SP // 7031
AM=M-1 // 7032
D=M // 7033
@4 // 7034
M=D // 7035

////PushInstruction("that 0")
@THAT // 7036
A=M // 7037
D=M // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042

////PopInstruction{address=local 0}
@SP // 7043
AM=M-1 // 7044
D=M // 7045
@LCL // 7046
A=M // 7047
M=D // 7048

////PushInstruction("local 0")
@LCL // 7049
A=M // 7050
D=M // 7051
@SP // 7052
AM=M+1 // 7053
A=A-1 // 7054
M=D // 7055

////PushInstruction("constant 0")
@SP // 7056
AM=M+1 // 7057
A=A-1 // 7058
M=0 // 7059

////ArithmeticInstruction{ADD}
@SP // 7060
AM=M-1 // 7061
D=M // 7062
A=A-1 // 7063
D=D+M // 7064

////PopInstruction{address=pointer 1}
@SP // 7065
AM=M-1 // 7066
D=M // 7067
@4 // 7068
M=D // 7069

////PushInstruction("that 0")
@THAT // 7070
A=M // 7071
D=M // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=D // 7076

////PushInstruction("argument 1")
@ARG // 7077
A=M+1 // 7078
D=M // 7079
@SP // 7080
AM=M+1 // 7081
A=A-1 // 7082
M=D // 7083

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt34 // 7084
D=A // 7085
@13 // 7086
M=D // 7087
@SP // 7088
AM=M-1 // 7089
D=M // 7090
A=A-1 // 7091
D=M-D // 7092
@DO_LT // 7093
0;JMP // 7094
(COMPARE_Memory.get_best_fit_lt34)

////ArithmeticInstruction{NOT}
@SP // 7095
A=M-1 // 7096
M=!M // 7097

////PushInstruction("constant 0")
@SP // 7098
AM=M+1 // 7099
A=A-1 // 7100
M=0 // 7101

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq35 // 7102
D=A // 7103
@13 // 7104
M=D // 7105
@SP // 7106
AM=M-1 // 7107
D=M // 7108
A=A-1 // 7109
D=M-D // 7110
@DO_EQ // 7111
0;JMP // 7112
(COMPARE_Memory.get_best_fit_eq35)

////IfGotoInstruction{label='Memory.get_best_fit.IfElse1}
// if-goto Memory.get_best_fit.IfElse1
@SP // 7113
AM=M-1 // 7114
D=M // 7115
@Memory.get_best_fit.IfElse1 // 7116
D;JNE // 7117

////PushInstruction("local 0")
@LCL // 7118
A=M // 7119
D=M // 7120
@SP // 7121
AM=M+1 // 7122
A=A-1 // 7123
M=D // 7124

////ReturnInstruction{}
@RETURN // 7125
0;JMP // 7126

////GotoInstruction{label='Memory.get_best_fit.IfElseEND1}
// goto Memory.get_best_fit.IfElseEND1
@Memory.get_best_fit.IfElseEND1 // 7127
0;JMP // 7128

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
@LCL // 7129
A=M // 7130
D=M // 7131
@SP // 7132
AM=M+1 // 7133
A=A-1 // 7134
M=D // 7135

////PushInstruction("constant 3")
@3 // 7136
D=A // 7137
@SP // 7138
AM=M+1 // 7139
A=A-1 // 7140
M=D // 7141

////ArithmeticInstruction{ADD}
@SP // 7142
AM=M-1 // 7143
D=M // 7144
A=A-1 // 7145
D=D+M // 7146

////PopInstruction{address=pointer 1}
@SP // 7147
AM=M-1 // 7148
D=M // 7149
@4 // 7150
M=D // 7151

////PushInstruction("that 0")
@THAT // 7152
A=M // 7153
D=M // 7154
@SP // 7155
AM=M+1 // 7156
A=A-1 // 7157
M=D // 7158

////PushInstruction("constant 0")
@SP // 7159
AM=M+1 // 7160
A=A-1 // 7161
M=0 // 7162

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq36 // 7163
D=A // 7164
@13 // 7165
M=D // 7166
@SP // 7167
AM=M-1 // 7168
D=M // 7169
A=A-1 // 7170
D=M-D // 7171
@DO_EQ // 7172
0;JMP // 7173
(COMPARE_Memory.get_best_fit_eq36)

////ArithmeticInstruction{NOT}
@SP // 7174
A=M-1 // 7175
M=!M // 7176

////PushInstruction("constant 0")
@SP // 7177
AM=M+1 // 7178
A=A-1 // 7179
M=0 // 7180

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq37 // 7181
D=A // 7182
@13 // 7183
M=D // 7184
@SP // 7185
AM=M-1 // 7186
D=M // 7187
A=A-1 // 7188
D=M-D // 7189
@DO_EQ // 7190
0;JMP // 7191
(COMPARE_Memory.get_best_fit_eq37)

////IfGotoInstruction{label='WHILE_END_Memory.get_best_fit1}
// if-goto WHILE_END_Memory.get_best_fit1
@SP // 7192
AM=M-1 // 7193
D=M // 7194
@WHILE_END_Memory.get_best_fit1 // 7195
D;JNE // 7196

////PushInstruction("local 0")
@LCL // 7197
A=M // 7198
D=M // 7199
@SP // 7200
AM=M+1 // 7201
A=A-1 // 7202
M=D // 7203

////PushInstruction("constant 3")
@3 // 7204
D=A // 7205
@SP // 7206
AM=M+1 // 7207
A=A-1 // 7208
M=D // 7209

////ArithmeticInstruction{ADD}
@SP // 7210
AM=M-1 // 7211
D=M // 7212
A=A-1 // 7213
D=D+M // 7214

////PopInstruction{address=pointer 1}
@SP // 7215
AM=M-1 // 7216
D=M // 7217
@4 // 7218
M=D // 7219

////PushInstruction("that 0")
@THAT // 7220
A=M // 7221
D=M // 7222
@SP // 7223
AM=M+1 // 7224
A=A-1 // 7225
M=D // 7226

////PopInstruction{address=local 0}
@SP // 7227
AM=M-1 // 7228
D=M // 7229
@LCL // 7230
A=M // 7231
M=D // 7232

////PushInstruction("local 0")
@LCL // 7233
A=M // 7234
D=M // 7235
@SP // 7236
AM=M+1 // 7237
A=A-1 // 7238
M=D // 7239

////PushInstruction("constant 0")
@SP // 7240
AM=M+1 // 7241
A=A-1 // 7242
M=0 // 7243

////ArithmeticInstruction{ADD}
@SP // 7244
AM=M-1 // 7245
D=M // 7246
A=A-1 // 7247
D=D+M // 7248

////PopInstruction{address=pointer 1}
@SP // 7249
AM=M-1 // 7250
D=M // 7251
@4 // 7252
M=D // 7253

////PushInstruction("that 0")
@THAT // 7254
A=M // 7255
D=M // 7256
@SP // 7257
AM=M+1 // 7258
A=A-1 // 7259
M=D // 7260

////PushInstruction("argument 1")
@ARG // 7261
A=M+1 // 7262
D=M // 7263
@SP // 7264
AM=M+1 // 7265
A=A-1 // 7266
M=D // 7267

////ArithmeticInstruction{LT}
@COMPARE_Memory.get_best_fit_lt38 // 7268
D=A // 7269
@13 // 7270
M=D // 7271
@SP // 7272
AM=M-1 // 7273
D=M // 7274
A=A-1 // 7275
D=M-D // 7276
@DO_LT // 7277
0;JMP // 7278
(COMPARE_Memory.get_best_fit_lt38)

////ArithmeticInstruction{NOT}
@SP // 7279
A=M-1 // 7280
M=!M // 7281

////PushInstruction("constant 0")
@SP // 7282
AM=M+1 // 7283
A=A-1 // 7284
M=0 // 7285

////ArithmeticInstruction{EQ}
@COMPARE_Memory.get_best_fit_eq39 // 7286
D=A // 7287
@13 // 7288
M=D // 7289
@SP // 7290
AM=M-1 // 7291
D=M // 7292
A=A-1 // 7293
D=M-D // 7294
@DO_EQ // 7295
0;JMP // 7296
(COMPARE_Memory.get_best_fit_eq39)

////IfGotoInstruction{label='Memory.get_best_fit.IfElse2}
// if-goto Memory.get_best_fit.IfElse2
@SP // 7297
AM=M-1 // 7298
D=M // 7299
@Memory.get_best_fit.IfElse2 // 7300
D;JNE // 7301

////PushInstruction("local 0")
@LCL // 7302
A=M // 7303
D=M // 7304
@SP // 7305
AM=M+1 // 7306
A=A-1 // 7307
M=D // 7308

////ReturnInstruction{}
@RETURN // 7309
0;JMP // 7310

////GotoInstruction{label='Memory.get_best_fit.IfElseEND2}
// goto Memory.get_best_fit.IfElseEND2
@Memory.get_best_fit.IfElseEND2 // 7311
0;JMP // 7312

////LabelInstruction{label='Memory.get_best_fit.IfElse2}
// label Memory.get_best_fit.IfElse2
(Memory.get_best_fit.IfElse2)

////LabelInstruction{label='Memory.get_best_fit.IfElseEND2}
// label Memory.get_best_fit.IfElseEND2
(Memory.get_best_fit.IfElseEND2)

////GotoInstruction{label='WHILE_START_Memory.get_best_fit1}
// goto WHILE_START_Memory.get_best_fit1
@WHILE_START_Memory.get_best_fit1 // 7313
0;JMP // 7314

////LabelInstruction{label='WHILE_END_Memory.get_best_fit1}
// label WHILE_END_Memory.get_best_fit1
(WHILE_END_Memory.get_best_fit1)

////PushInstruction("constant 0")
@SP // 7315
AM=M+1 // 7316
A=A-1 // 7317
M=0 // 7318

////ReturnInstruction{}
@RETURN // 7319
0;JMP // 7320

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.create_foot with 0
(Memory.create_foot)

////PushInstruction("argument 0")
@ARG // 7321
A=M // 7322
D=M // 7323
@SP // 7324
AM=M+1 // 7325
A=A-1 // 7326
M=D // 7327

////PushInstruction("argument 0")
@ARG // 7328
A=M // 7329
D=M // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=D // 7334

////PushInstruction("argument 0")
@ARG // 7335
A=M // 7336
D=M // 7337
@SP // 7338
AM=M+1 // 7339
A=A-1 // 7340
M=D // 7341

////PushInstruction("constant 0")
@SP // 7342
AM=M+1 // 7343
A=A-1 // 7344
M=0 // 7345

////ArithmeticInstruction{ADD}
@SP // 7346
AM=M-1 // 7347
D=M // 7348
A=A-1 // 7349
D=D+M // 7350

////PopInstruction{address=pointer 1}
@SP // 7351
AM=M-1 // 7352
D=M // 7353
@4 // 7354
M=D // 7355

////PushInstruction("that 0")
@THAT // 7356
A=M // 7357
D=M // 7358
@SP // 7359
AM=M+1 // 7360
A=A-1 // 7361
M=D // 7362

////PushInstruction("constant 4")
@4 // 7363
D=A // 7364
@SP // 7365
AM=M+1 // 7366
A=A-1 // 7367
M=D // 7368

////ArithmeticInstruction{ADD}
@SP // 7369
AM=M-1 // 7370
D=M // 7371
A=A-1 // 7372
D=D+M // 7373

////ArithmeticInstruction{ADD}
@SP // 7374
AM=M-1 // 7375
D=M // 7376
A=A-1 // 7377
D=D+M // 7378

////PopInstruction{address=pointer 1}
@SP // 7379
AM=M-1 // 7380
D=M // 7381
@4 // 7382
M=D // 7383

////PopInstruction{address=that 0}
@SP // 7384
AM=M-1 // 7385
D=M // 7386
@THAT // 7387
A=M // 7388
M=D // 7389

////PushInstruction("constant 0")
@SP // 7390
AM=M+1 // 7391
A=A-1 // 7392
M=0 // 7393

////ReturnInstruction{}
@RETURN // 7394
0;JMP // 7395

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 7396
AM=M+1 // 7397
A=A-1 // 7398
M=0 // 7399
@SP // 7400
AM=M+1 // 7401
A=A-1 // 7402
M=0 // 7403

////PushInstruction("constant 0")
@SP // 7404
AM=M+1 // 7405
A=A-1 // 7406
M=0 // 7407

////PushInstruction("argument 1")
@ARG // 7408
A=M+1 // 7409
D=M // 7410
@SP // 7411
AM=M+1 // 7412
A=A-1 // 7413
M=D // 7414

////PushInstruction("constant 2")
@2 // 7415
D=A // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=D // 7420

////ArithmeticInstruction{ADD}
@SP // 7421
AM=M-1 // 7422
D=M // 7423
A=A-1 // 7424
D=D+M // 7425

////PopInstruction{address=pointer 1}
@SP // 7426
AM=M-1 // 7427
D=M // 7428
@4 // 7429
M=D // 7430

////PopInstruction{address=that 0}
@SP // 7431
AM=M-1 // 7432
D=M // 7433
@THAT // 7434
A=M // 7435
M=D // 7436

////PushInstruction("constant 0")
@SP // 7437
AM=M+1 // 7438
A=A-1 // 7439
M=0 // 7440

////PushInstruction("argument 1")
@ARG // 7441
A=M+1 // 7442
D=M // 7443
@SP // 7444
AM=M+1 // 7445
A=A-1 // 7446
M=D // 7447

////PushInstruction("constant 3")
@3 // 7448
D=A // 7449
@SP // 7450
AM=M+1 // 7451
A=A-1 // 7452
M=D // 7453

////ArithmeticInstruction{ADD}
@SP // 7454
AM=M-1 // 7455
D=M // 7456
A=A-1 // 7457
D=D+M // 7458

////PopInstruction{address=pointer 1}
@SP // 7459
AM=M-1 // 7460
D=M // 7461
@4 // 7462
M=D // 7463

////PopInstruction{address=that 0}
@SP // 7464
AM=M-1 // 7465
D=M // 7466
@THAT // 7467
A=M // 7468
M=D // 7469

////PushInstruction("argument 0")
@ARG // 7470
A=M // 7471
D=M // 7472
@SP // 7473
AM=M+1 // 7474
A=A-1 // 7475
M=D // 7476

////PushInstruction("constant 0")
@SP // 7477
AM=M+1 // 7478
A=A-1 // 7479
M=0 // 7480

////ArithmeticInstruction{ADD}
@SP // 7481
AM=M-1 // 7482
D=M // 7483
A=A-1 // 7484
D=D+M // 7485

////PopInstruction{address=pointer 1}
@SP // 7486
AM=M-1 // 7487
D=M // 7488
@4 // 7489
M=D // 7490

////PushInstruction("that 0")
@THAT // 7491
A=M // 7492
D=M // 7493
@SP // 7494
AM=M+1 // 7495
A=A-1 // 7496
M=D // 7497

////PushInstruction("constant 0")
@SP // 7498
AM=M+1 // 7499
A=A-1 // 7500
M=0 // 7501

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq40 // 7502
D=A // 7503
@13 // 7504
M=D // 7505
@SP // 7506
AM=M-1 // 7507
D=M // 7508
A=A-1 // 7509
D=M-D // 7510
@DO_EQ // 7511
0;JMP // 7512
(COMPARE_Memory.add_node_eq40)

////PushInstruction("constant 0")
@SP // 7513
AM=M+1 // 7514
A=A-1 // 7515
M=0 // 7516

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq41 // 7517
D=A // 7518
@13 // 7519
M=D // 7520
@SP // 7521
AM=M-1 // 7522
D=M // 7523
A=A-1 // 7524
D=M-D // 7525
@DO_EQ // 7526
0;JMP // 7527
(COMPARE_Memory.add_node_eq41)

////IfGotoInstruction{label='Memory.add_node.IfElse1}
// if-goto Memory.add_node.IfElse1
@SP // 7528
AM=M-1 // 7529
D=M // 7530
@Memory.add_node.IfElse1 // 7531
D;JNE // 7532

////PushInstruction("argument 1")
@ARG // 7533
A=M+1 // 7534
D=M // 7535
@SP // 7536
AM=M+1 // 7537
A=A-1 // 7538
M=D // 7539

////PushInstruction("argument 0")
@ARG // 7540
A=M // 7541
D=M // 7542
@SP // 7543
AM=M+1 // 7544
A=A-1 // 7545
M=D // 7546

////PushInstruction("constant 0")
@SP // 7547
AM=M+1 // 7548
A=A-1 // 7549
M=0 // 7550

////ArithmeticInstruction{ADD}
@SP // 7551
AM=M-1 // 7552
D=M // 7553
A=A-1 // 7554
D=D+M // 7555

////PopInstruction{address=pointer 1}
@SP // 7556
AM=M-1 // 7557
D=M // 7558
@4 // 7559
M=D // 7560

////PopInstruction{address=that 0}
@SP // 7561
AM=M-1 // 7562
D=M // 7563
@THAT // 7564
A=M // 7565
M=D // 7566

////PushInstruction("constant 0")
@SP // 7567
AM=M+1 // 7568
A=A-1 // 7569
M=0 // 7570

////ReturnInstruction{}
@RETURN // 7571
0;JMP // 7572

////GotoInstruction{label='Memory.add_node.IfElseEND1}
// goto Memory.add_node.IfElseEND1
@Memory.add_node.IfElseEND1 // 7573
0;JMP // 7574

////LabelInstruction{label='Memory.add_node.IfElse1}
// label Memory.add_node.IfElse1
(Memory.add_node.IfElse1)

////LabelInstruction{label='Memory.add_node.IfElseEND1}
// label Memory.add_node.IfElseEND1
(Memory.add_node.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 7575
A=M // 7576
D=M // 7577
@SP // 7578
AM=M+1 // 7579
A=A-1 // 7580
M=D // 7581

////PushInstruction("constant 0")
@SP // 7582
AM=M+1 // 7583
A=A-1 // 7584
M=0 // 7585

////ArithmeticInstruction{ADD}
@SP // 7586
AM=M-1 // 7587
D=M // 7588
A=A-1 // 7589
D=D+M // 7590

////PopInstruction{address=pointer 1}
@SP // 7591
AM=M-1 // 7592
D=M // 7593
@4 // 7594
M=D // 7595

////PushInstruction("that 0")
@THAT // 7596
A=M // 7597
D=M // 7598
@SP // 7599
AM=M+1 // 7600
A=A-1 // 7601
M=D // 7602

////PopInstruction{address=local 0}
@SP // 7603
AM=M-1 // 7604
D=M // 7605
@LCL // 7606
A=M // 7607
M=D // 7608

////PushInstruction("constant 0")
@SP // 7609
AM=M+1 // 7610
A=A-1 // 7611
M=0 // 7612

////PopInstruction{address=local 1}
@SP // 7613
AM=M-1 // 7614
D=M // 7615
@LCL // 7616
A=M+1 // 7617
M=D // 7618

////LabelInstruction{label='WHILE_START_Memory.add_node1}
// label WHILE_START_Memory.add_node1
(WHILE_START_Memory.add_node1)

////PushInstruction("local 0")
@LCL // 7619
A=M // 7620
D=M // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=D // 7625

////PushInstruction("constant 0")
@SP // 7626
AM=M+1 // 7627
A=A-1 // 7628
M=0 // 7629

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq42 // 7630
D=A // 7631
@13 // 7632
M=D // 7633
@SP // 7634
AM=M-1 // 7635
D=M // 7636
A=A-1 // 7637
D=M-D // 7638
@DO_EQ // 7639
0;JMP // 7640
(COMPARE_Memory.add_node_eq42)

////ArithmeticInstruction{NOT}
@SP // 7641
A=M-1 // 7642
M=!M // 7643

////PushInstruction("local 0")
@LCL // 7644
A=M // 7645
D=M // 7646
@SP // 7647
AM=M+1 // 7648
A=A-1 // 7649
M=D // 7650

////PushInstruction("constant 0")
@SP // 7651
AM=M+1 // 7652
A=A-1 // 7653
M=0 // 7654

////ArithmeticInstruction{ADD}
@SP // 7655
AM=M-1 // 7656
D=M // 7657
A=A-1 // 7658
D=D+M // 7659

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

////PushInstruction("argument 1")
@ARG // 7672
A=M+1 // 7673
D=M // 7674
@SP // 7675
AM=M+1 // 7676
A=A-1 // 7677
M=D // 7678

////PushInstruction("constant 0")
@SP // 7679
AM=M+1 // 7680
A=A-1 // 7681
M=0 // 7682

////ArithmeticInstruction{ADD}
@SP // 7683
AM=M-1 // 7684
D=M // 7685
A=A-1 // 7686
D=D+M // 7687

////PopInstruction{address=pointer 1}
@SP // 7688
AM=M-1 // 7689
D=M // 7690
@4 // 7691
M=D // 7692

////PushInstruction("that 0")
@THAT // 7693
A=M // 7694
D=M // 7695
@SP // 7696
AM=M+1 // 7697
A=A-1 // 7698
M=D // 7699

////ArithmeticInstruction{GT}
@COMPARE_Memory.add_node_gt43 // 7700
D=A // 7701
@13 // 7702
M=D // 7703
@SP // 7704
AM=M-1 // 7705
D=M // 7706
A=A-1 // 7707
D=M-D // 7708
@DO_GT // 7709
0;JMP // 7710
(COMPARE_Memory.add_node_gt43)

////ArithmeticInstruction{NOT}
@SP // 7711
A=M-1 // 7712
M=!M // 7713

////ArithmeticInstruction{AND}
@SP // 7714
AM=M-1 // 7715
D=M // 7716
A=A-1 // 7717
D=D&M // 7718

////PushInstruction("constant 0")
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=0 // 7722

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq44 // 7723
D=A // 7724
@13 // 7725
M=D // 7726
@SP // 7727
AM=M-1 // 7728
D=M // 7729
A=A-1 // 7730
D=M-D // 7731
@DO_EQ // 7732
0;JMP // 7733
(COMPARE_Memory.add_node_eq44)

////IfGotoInstruction{label='WHILE_END_Memory.add_node1}
// if-goto WHILE_END_Memory.add_node1
@SP // 7734
AM=M-1 // 7735
D=M // 7736
@WHILE_END_Memory.add_node1 // 7737
D;JNE // 7738

////PushInstruction("local 0")
@LCL // 7739
A=M // 7740
D=M // 7741
@SP // 7742
AM=M+1 // 7743
A=A-1 // 7744
M=D // 7745

////PopInstruction{address=local 1}
@SP // 7746
AM=M-1 // 7747
D=M // 7748
@LCL // 7749
A=M+1 // 7750
M=D // 7751

////PushInstruction("local 0")
@LCL // 7752
A=M // 7753
D=M // 7754
@SP // 7755
AM=M+1 // 7756
A=A-1 // 7757
M=D // 7758

////PushInstruction("constant 3")
@3 // 7759
D=A // 7760
@SP // 7761
AM=M+1 // 7762
A=A-1 // 7763
M=D // 7764

////ArithmeticInstruction{ADD}
@SP // 7765
AM=M-1 // 7766
D=M // 7767
A=A-1 // 7768
D=D+M // 7769

////PopInstruction{address=pointer 1}
@SP // 7770
AM=M-1 // 7771
D=M // 7772
@4 // 7773
M=D // 7774

////PushInstruction("that 0")
@THAT // 7775
A=M // 7776
D=M // 7777
@SP // 7778
AM=M+1 // 7779
A=A-1 // 7780
M=D // 7781

////PopInstruction{address=local 0}
@SP // 7782
AM=M-1 // 7783
D=M // 7784
@LCL // 7785
A=M // 7786
M=D // 7787

////GotoInstruction{label='WHILE_START_Memory.add_node1}
// goto WHILE_START_Memory.add_node1
@WHILE_START_Memory.add_node1 // 7788
0;JMP // 7789

////LabelInstruction{label='WHILE_END_Memory.add_node1}
// label WHILE_END_Memory.add_node1
(WHILE_END_Memory.add_node1)

////PushInstruction("local 1")
@LCL // 7790
A=M+1 // 7791
D=M // 7792
@SP // 7793
AM=M+1 // 7794
A=A-1 // 7795
M=D // 7796

////ArithmeticInstruction{NOT}
@SP // 7797
A=M-1 // 7798
M=!M // 7799

////PushInstruction("constant 0")
@SP // 7800
AM=M+1 // 7801
A=A-1 // 7802
M=0 // 7803

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq45 // 7804
D=A // 7805
@13 // 7806
M=D // 7807
@SP // 7808
AM=M-1 // 7809
D=M // 7810
A=A-1 // 7811
D=M-D // 7812
@DO_EQ // 7813
0;JMP // 7814
(COMPARE_Memory.add_node_eq45)

////IfGotoInstruction{label='Memory.add_node.IfElse2}
// if-goto Memory.add_node.IfElse2
@SP // 7815
AM=M-1 // 7816
D=M // 7817
@Memory.add_node.IfElse2 // 7818
D;JNE // 7819

////PushInstruction("argument 0")
@ARG // 7820
A=M // 7821
D=M // 7822
@SP // 7823
AM=M+1 // 7824
A=A-1 // 7825
M=D // 7826

////PushInstruction("constant 0")
@SP // 7827
AM=M+1 // 7828
A=A-1 // 7829
M=0 // 7830

////ArithmeticInstruction{ADD}
@SP // 7831
AM=M-1 // 7832
D=M // 7833
A=A-1 // 7834
D=D+M // 7835

////PopInstruction{address=pointer 1}
@SP // 7836
AM=M-1 // 7837
D=M // 7838
@4 // 7839
M=D // 7840

////PushInstruction("that 0")
@THAT // 7841
A=M // 7842
D=M // 7843
@SP // 7844
AM=M+1 // 7845
A=A-1 // 7846
M=D // 7847

////PushInstruction("argument 1")
@ARG // 7848
A=M+1 // 7849
D=M // 7850
@SP // 7851
AM=M+1 // 7852
A=A-1 // 7853
M=D // 7854

////PushInstruction("constant 3")
@3 // 7855
D=A // 7856
@SP // 7857
AM=M+1 // 7858
A=A-1 // 7859
M=D // 7860

////ArithmeticInstruction{ADD}
@SP // 7861
AM=M-1 // 7862
D=M // 7863
A=A-1 // 7864
D=D+M // 7865

////PopInstruction{address=pointer 1}
@SP // 7866
AM=M-1 // 7867
D=M // 7868
@4 // 7869
M=D // 7870

////PopInstruction{address=that 0}
@SP // 7871
AM=M-1 // 7872
D=M // 7873
@THAT // 7874
A=M // 7875
M=D // 7876

////PushInstruction("argument 1")
@ARG // 7877
A=M+1 // 7878
D=M // 7879
@SP // 7880
AM=M+1 // 7881
A=A-1 // 7882
M=D // 7883

////PushInstruction("argument 0")
@ARG // 7884
A=M // 7885
D=M // 7886
@SP // 7887
AM=M+1 // 7888
A=A-1 // 7889
M=D // 7890

////PushInstruction("constant 0")
@SP // 7891
AM=M+1 // 7892
A=A-1 // 7893
M=0 // 7894

////ArithmeticInstruction{ADD}
@SP // 7895
AM=M-1 // 7896
D=M // 7897
A=A-1 // 7898
D=D+M // 7899

////PushInstruction("constant 2")
@2 // 7900
D=A // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=D // 7905

////ArithmeticInstruction{ADD}
@SP // 7906
AM=M-1 // 7907
D=M // 7908
A=A-1 // 7909
D=D+M // 7910

////PopInstruction{address=pointer 1}
@SP // 7911
AM=M-1 // 7912
D=M // 7913
@4 // 7914
M=D // 7915

////PopInstruction{address=that 0}
@SP // 7916
AM=M-1 // 7917
D=M // 7918
@THAT // 7919
A=M // 7920
M=D // 7921

////PushInstruction("argument 1")
@ARG // 7922
A=M+1 // 7923
D=M // 7924
@SP // 7925
AM=M+1 // 7926
A=A-1 // 7927
M=D // 7928

////PushInstruction("argument 0")
@ARG // 7929
A=M // 7930
D=M // 7931
@SP // 7932
AM=M+1 // 7933
A=A-1 // 7934
M=D // 7935

////PushInstruction("constant 0")
@SP // 7936
AM=M+1 // 7937
A=A-1 // 7938
M=0 // 7939

////ArithmeticInstruction{ADD}
@SP // 7940
AM=M-1 // 7941
D=M // 7942
A=A-1 // 7943
D=D+M // 7944

////PopInstruction{address=pointer 1}
@SP // 7945
AM=M-1 // 7946
D=M // 7947
@4 // 7948
M=D // 7949

////PopInstruction{address=that 0}
@SP // 7950
AM=M-1 // 7951
D=M // 7952
@THAT // 7953
A=M // 7954
M=D // 7955

////GotoInstruction{label='Memory.add_node.IfElseEND2}
// goto Memory.add_node.IfElseEND2
@Memory.add_node.IfElseEND2 // 7956
0;JMP // 7957

////LabelInstruction{label='Memory.add_node.IfElse2}
// label Memory.add_node.IfElse2
(Memory.add_node.IfElse2)

////PushInstruction("local 0")
@LCL // 7958
A=M // 7959
D=M // 7960
@SP // 7961
AM=M+1 // 7962
A=A-1 // 7963
M=D // 7964

////PushInstruction("argument 1")
@ARG // 7965
A=M+1 // 7966
D=M // 7967
@SP // 7968
AM=M+1 // 7969
A=A-1 // 7970
M=D // 7971

////PushInstruction("constant 3")
@3 // 7972
D=A // 7973
@SP // 7974
AM=M+1 // 7975
A=A-1 // 7976
M=D // 7977

////ArithmeticInstruction{ADD}
@SP // 7978
AM=M-1 // 7979
D=M // 7980
A=A-1 // 7981
D=D+M // 7982

////PopInstruction{address=pointer 1}
@SP // 7983
AM=M-1 // 7984
D=M // 7985
@4 // 7986
M=D // 7987

////PopInstruction{address=that 0}
@SP // 7988
AM=M-1 // 7989
D=M // 7990
@THAT // 7991
A=M // 7992
M=D // 7993

////PushInstruction("local 1")
@LCL // 7994
A=M+1 // 7995
D=M // 7996
@SP // 7997
AM=M+1 // 7998
A=A-1 // 7999
M=D // 8000

////PushInstruction("argument 1")
@ARG // 8001
A=M+1 // 8002
D=M // 8003
@SP // 8004
AM=M+1 // 8005
A=A-1 // 8006
M=D // 8007

////PushInstruction("constant 2")
@2 // 8008
D=A // 8009
@SP // 8010
AM=M+1 // 8011
A=A-1 // 8012
M=D // 8013

////ArithmeticInstruction{ADD}
@SP // 8014
AM=M-1 // 8015
D=M // 8016
A=A-1 // 8017
D=D+M // 8018

////PopInstruction{address=pointer 1}
@SP // 8019
AM=M-1 // 8020
D=M // 8021
@4 // 8022
M=D // 8023

////PopInstruction{address=that 0}
@SP // 8024
AM=M-1 // 8025
D=M // 8026
@THAT // 8027
A=M // 8028
M=D // 8029

////PushInstruction("local 0")
@LCL // 8030
A=M // 8031
D=M // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=D // 8036

////PushInstruction("constant 0")
@SP // 8037
AM=M+1 // 8038
A=A-1 // 8039
M=0 // 8040

////ArithmeticInstruction{EQ}
@COMPARE_Memory.add_node_eq46 // 8041
D=A // 8042
@13 // 8043
M=D // 8044
@SP // 8045
AM=M-1 // 8046
D=M // 8047
A=A-1 // 8048
D=M-D // 8049
@DO_EQ // 8050
0;JMP // 8051
(COMPARE_Memory.add_node_eq46)

////IfGotoInstruction{label='Memory.add_node.IfElse3}
// if-goto Memory.add_node.IfElse3
@SP // 8052
AM=M-1 // 8053
D=M // 8054
@Memory.add_node.IfElse3 // 8055
D;JNE // 8056

////PushInstruction("argument 1")
@ARG // 8057
A=M+1 // 8058
D=M // 8059
@SP // 8060
AM=M+1 // 8061
A=A-1 // 8062
M=D // 8063

////PushInstruction("local 0")
@LCL // 8064
A=M // 8065
D=M // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=D // 8070

////PushInstruction("constant 2")
@2 // 8071
D=A // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076

////ArithmeticInstruction{ADD}
@SP // 8077
AM=M-1 // 8078
D=M // 8079
A=A-1 // 8080
D=D+M // 8081

////PopInstruction{address=pointer 1}
@SP // 8082
AM=M-1 // 8083
D=M // 8084
@4 // 8085
M=D // 8086

////PopInstruction{address=that 0}
@SP // 8087
AM=M-1 // 8088
D=M // 8089
@THAT // 8090
A=M // 8091
M=D // 8092

////GotoInstruction{label='Memory.add_node.IfElseEND3}
// goto Memory.add_node.IfElseEND3
@Memory.add_node.IfElseEND3 // 8093
0;JMP // 8094

////LabelInstruction{label='Memory.add_node.IfElse3}
// label Memory.add_node.IfElse3
(Memory.add_node.IfElse3)

////LabelInstruction{label='Memory.add_node.IfElseEND3}
// label Memory.add_node.IfElseEND3
(Memory.add_node.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 8095
A=M+1 // 8096
D=M // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=D // 8101

////PushInstruction("local 1")
@LCL // 8102
A=M+1 // 8103
D=M // 8104
@SP // 8105
AM=M+1 // 8106
A=A-1 // 8107
M=D // 8108

////PushInstruction("constant 3")
@3 // 8109
D=A // 8110
@SP // 8111
AM=M+1 // 8112
A=A-1 // 8113
M=D // 8114

////ArithmeticInstruction{ADD}
@SP // 8115
AM=M-1 // 8116
D=M // 8117
A=A-1 // 8118
D=D+M // 8119

////PopInstruction{address=pointer 1}
@SP // 8120
AM=M-1 // 8121
D=M // 8122
@4 // 8123
M=D // 8124

////PopInstruction{address=that 0}
@SP // 8125
AM=M-1 // 8126
D=M // 8127
@THAT // 8128
A=M // 8129
M=D // 8130

////LabelInstruction{label='Memory.add_node.IfElseEND2}
// label Memory.add_node.IfElseEND2
(Memory.add_node.IfElseEND2)

////PushInstruction("constant 0")
@SP // 8131
AM=M+1 // 8132
A=A-1 // 8133
M=0 // 8134

////ReturnInstruction{}
@RETURN // 8135
0;JMP // 8136

////FunctionInstruction{functionName='Memory.poke', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.poke with 0
(Memory.poke)

////PushInstruction("argument 1")
@ARG // 8137
A=M+1 // 8138
D=M // 8139
@SP // 8140
AM=M+1 // 8141
A=A-1 // 8142
M=D // 8143

////PushInstruction("argument 0")
@ARG // 8144
A=M // 8145
D=M // 8146
@SP // 8147
AM=M+1 // 8148
A=A-1 // 8149
M=D // 8150

////PushInstruction("constant 0")
@SP // 8151
AM=M+1 // 8152
A=A-1 // 8153
M=0 // 8154

////ArithmeticInstruction{ADD}
@SP // 8155
AM=M-1 // 8156
D=M // 8157
A=A-1 // 8158
D=D+M // 8159

////PopInstruction{address=pointer 1}
@SP // 8160
AM=M-1 // 8161
D=M // 8162
@4 // 8163
M=D // 8164

////PopInstruction{address=that 0}
@SP // 8165
AM=M-1 // 8166
D=M // 8167
@THAT // 8168
A=M // 8169
M=D // 8170

////PushInstruction("constant 0")
@SP // 8171
AM=M+1 // 8172
A=A-1 // 8173
M=0 // 8174

////ReturnInstruction{}
@RETURN // 8175
0;JMP // 8176

////FunctionInstruction{functionName='Memory.peek', numLocals=0, funcMapping={Memory.poke=0, Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.realloc=4, Memory.get_best_fit=0, Memory.calloc=1, Memory.init=2, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.peek with 0
(Memory.peek)

////PushInstruction("argument 0")
@ARG // 8177
A=M // 8178
D=M // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=D // 8183

////PushInstruction("constant 0")
@SP // 8184
AM=M+1 // 8185
A=A-1 // 8186
M=0 // 8187

////ArithmeticInstruction{ADD}
@SP // 8188
AM=M-1 // 8189
D=M // 8190
A=A-1 // 8191
D=D+M // 8192

////PopInstruction{address=pointer 1}
@SP // 8193
AM=M-1 // 8194
D=M // 8195
@4 // 8196
M=D // 8197

////PushInstruction("that 0")
@THAT // 8198
A=M // 8199
D=M // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204

////ReturnInstruction{}
@RETURN // 8205
0;JMP // 8206

////FunctionInstruction{functionName='Output.init', numLocals=0, funcMapping={}}
// function Output.init with 0
(Output.init)

////CallInstruction{calleeFunction='Output.initMap', numArgs=0, funcMapping={Output.init=0}, currentFunction='Output.init'}
// call Output.initMap
@5 // 8207
D=A // 8208
@14 // 8209
M=D // 8210
@Output.initMap // 8211
D=A // 8212
@13 // 8213
M=D // 8214
@Output.init.ret.0 // 8215
D=A // 8216
@CALL // 8217
0;JMP // 8218
(Output.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 8219
AM=M-1 // 8220
D=M // 8221
@5 // 8222
M=D // 8223

////PushInstruction("constant 0")
@SP // 8224
AM=M+1 // 8225
A=A-1 // 8226
M=0 // 8227

////PopInstruction{address=Output.1}
@SP // 8228
AM=M-1 // 8229
D=M // 8230
@Output.1 // 8231
M=D // 8232

////PushInstruction("constant 0")
@SP // 8233
AM=M+1 // 8234
A=A-1 // 8235
M=0 // 8236

////PopInstruction{address=Output.2}
@SP // 8237
AM=M-1 // 8238
D=M // 8239
@Output.2 // 8240
M=D // 8241

////PushInstruction("constant 0")
@SP // 8242
AM=M+1 // 8243
A=A-1 // 8244
M=0 // 8245

////ReturnInstruction{}
@RETURN // 8246
0;JMP // 8247

////FunctionInstruction{functionName='Output.initMap', numLocals=1, funcMapping={Output.init=1}}
// function Output.initMap with 1
(Output.initMap)
@SP // 8248
AM=M+1 // 8249
A=A-1 // 8250
M=0 // 8251

////PushInstruction("constant 127")
@127 // 8252
D=A // 8253
@SP // 8254
AM=M+1 // 8255
A=A-1 // 8256
M=D // 8257

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=0}, currentFunction='Output.initMap'}
// call Array.new
@6 // 8258
D=A // 8259
@14 // 8260
M=D // 8261
@Array.new // 8262
D=A // 8263
@13 // 8264
M=D // 8265
@Output.initMap.ret.0 // 8266
D=A // 8267
@CALL // 8268
0;JMP // 8269
(Output.initMap.ret.0)

////PopInstruction{address=Output.0}
@SP // 8270
AM=M-1 // 8271
D=M // 8272
@Output.0 // 8273
M=D // 8274

////PushInstruction("constant 0")
@SP // 8275
AM=M+1 // 8276
A=A-1 // 8277
M=0 // 8278

////PushInstruction("constant 63")
@63 // 8279
D=A // 8280
@SP // 8281
AM=M+1 // 8282
A=A-1 // 8283
M=D // 8284

////PushInstruction("constant 63")
@63 // 8285
D=A // 8286
@SP // 8287
AM=M+1 // 8288
A=A-1 // 8289
M=D // 8290

////PushInstruction("constant 63")
@63 // 8291
D=A // 8292
@SP // 8293
AM=M+1 // 8294
A=A-1 // 8295
M=D // 8296

////PushInstruction("constant 63")
@63 // 8297
D=A // 8298
@SP // 8299
AM=M+1 // 8300
A=A-1 // 8301
M=D // 8302

////PushInstruction("constant 63")
@63 // 8303
D=A // 8304
@SP // 8305
AM=M+1 // 8306
A=A-1 // 8307
M=D // 8308

////PushInstruction("constant 63")
@63 // 8309
D=A // 8310
@SP // 8311
AM=M+1 // 8312
A=A-1 // 8313
M=D // 8314

////PushInstruction("constant 63")
@63 // 8315
D=A // 8316
@SP // 8317
AM=M+1 // 8318
A=A-1 // 8319
M=D // 8320

////PushInstruction("constant 63")
@63 // 8321
D=A // 8322
@SP // 8323
AM=M+1 // 8324
A=A-1 // 8325
M=D // 8326

////PushInstruction("constant 63")
@63 // 8327
D=A // 8328
@SP // 8329
AM=M+1 // 8330
A=A-1 // 8331
M=D // 8332

////PushInstruction("constant 0")
@SP // 8333
AM=M+1 // 8334
A=A-1 // 8335
M=0 // 8336

////PushInstruction("constant 0")
@SP // 8337
AM=M+1 // 8338
A=A-1 // 8339
M=0 // 8340

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=1}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8341
D=A // 8342
@14 // 8343
M=D // 8344
@Output.create // 8345
D=A // 8346
@13 // 8347
M=D // 8348
@Output.initMap.ret.1 // 8349
D=A // 8350
@CALL // 8351
0;JMP // 8352
(Output.initMap.ret.1)

////PopInstruction{address=temp 0}
@SP // 8353
AM=M-1 // 8354
D=M // 8355
@5 // 8356
M=D // 8357

////PushInstruction("constant 32")
@32 // 8358
D=A // 8359
@SP // 8360
AM=M+1 // 8361
A=A-1 // 8362
M=D // 8363

////PushInstruction("constant 0")
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=0 // 8367

////PushInstruction("constant 0")
@SP // 8368
AM=M+1 // 8369
A=A-1 // 8370
M=0 // 8371

////PushInstruction("constant 0")
@SP // 8372
AM=M+1 // 8373
A=A-1 // 8374
M=0 // 8375

////PushInstruction("constant 0")
@SP // 8376
AM=M+1 // 8377
A=A-1 // 8378
M=0 // 8379

////PushInstruction("constant 0")
@SP // 8380
AM=M+1 // 8381
A=A-1 // 8382
M=0 // 8383

////PushInstruction("constant 0")
@SP // 8384
AM=M+1 // 8385
A=A-1 // 8386
M=0 // 8387

////PushInstruction("constant 0")
@SP // 8388
AM=M+1 // 8389
A=A-1 // 8390
M=0 // 8391

////PushInstruction("constant 0")
@SP // 8392
AM=M+1 // 8393
A=A-1 // 8394
M=0 // 8395

////PushInstruction("constant 0")
@SP // 8396
AM=M+1 // 8397
A=A-1 // 8398
M=0 // 8399

////PushInstruction("constant 0")
@SP // 8400
AM=M+1 // 8401
A=A-1 // 8402
M=0 // 8403

////PushInstruction("constant 0")
@SP // 8404
AM=M+1 // 8405
A=A-1 // 8406
M=0 // 8407

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=2}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8408
D=A // 8409
@14 // 8410
M=D // 8411
@Output.create // 8412
D=A // 8413
@13 // 8414
M=D // 8415
@Output.initMap.ret.2 // 8416
D=A // 8417
@CALL // 8418
0;JMP // 8419
(Output.initMap.ret.2)

////PopInstruction{address=temp 0}
@SP // 8420
AM=M-1 // 8421
D=M // 8422
@5 // 8423
M=D // 8424

////PushInstruction("constant 33")
@33 // 8425
D=A // 8426
@SP // 8427
AM=M+1 // 8428
A=A-1 // 8429
M=D // 8430

////PushInstruction("constant 12")
@12 // 8431
D=A // 8432
@SP // 8433
AM=M+1 // 8434
A=A-1 // 8435
M=D // 8436

////PushInstruction("constant 30")
@30 // 8437
D=A // 8438
@SP // 8439
AM=M+1 // 8440
A=A-1 // 8441
M=D // 8442

////PushInstruction("constant 30")
@30 // 8443
D=A // 8444
@SP // 8445
AM=M+1 // 8446
A=A-1 // 8447
M=D // 8448

////PushInstruction("constant 30")
@30 // 8449
D=A // 8450
@SP // 8451
AM=M+1 // 8452
A=A-1 // 8453
M=D // 8454

////PushInstruction("constant 12")
@12 // 8455
D=A // 8456
@SP // 8457
AM=M+1 // 8458
A=A-1 // 8459
M=D // 8460

////PushInstruction("constant 12")
@12 // 8461
D=A // 8462
@SP // 8463
AM=M+1 // 8464
A=A-1 // 8465
M=D // 8466

////PushInstruction("constant 0")
@SP // 8467
AM=M+1 // 8468
A=A-1 // 8469
M=0 // 8470

////PushInstruction("constant 12")
@12 // 8471
D=A // 8472
@SP // 8473
AM=M+1 // 8474
A=A-1 // 8475
M=D // 8476

////PushInstruction("constant 12")
@12 // 8477
D=A // 8478
@SP // 8479
AM=M+1 // 8480
A=A-1 // 8481
M=D // 8482

////PushInstruction("constant 0")
@SP // 8483
AM=M+1 // 8484
A=A-1 // 8485
M=0 // 8486

////PushInstruction("constant 0")
@SP // 8487
AM=M+1 // 8488
A=A-1 // 8489
M=0 // 8490

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=3}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8491
D=A // 8492
@14 // 8493
M=D // 8494
@Output.create // 8495
D=A // 8496
@13 // 8497
M=D // 8498
@Output.initMap.ret.3 // 8499
D=A // 8500
@CALL // 8501
0;JMP // 8502
(Output.initMap.ret.3)

////PopInstruction{address=temp 0}
@SP // 8503
AM=M-1 // 8504
D=M // 8505
@5 // 8506
M=D // 8507

////PushInstruction("constant 34")
@34 // 8508
D=A // 8509
@SP // 8510
AM=M+1 // 8511
A=A-1 // 8512
M=D // 8513

////PushInstruction("constant 54")
@54 // 8514
D=A // 8515
@SP // 8516
AM=M+1 // 8517
A=A-1 // 8518
M=D // 8519

////PushInstruction("constant 54")
@54 // 8520
D=A // 8521
@SP // 8522
AM=M+1 // 8523
A=A-1 // 8524
M=D // 8525

////PushInstruction("constant 20")
@20 // 8526
D=A // 8527
@SP // 8528
AM=M+1 // 8529
A=A-1 // 8530
M=D // 8531

////PushInstruction("constant 0")
@SP // 8532
AM=M+1 // 8533
A=A-1 // 8534
M=0 // 8535

////PushInstruction("constant 0")
@SP // 8536
AM=M+1 // 8537
A=A-1 // 8538
M=0 // 8539

////PushInstruction("constant 0")
@SP // 8540
AM=M+1 // 8541
A=A-1 // 8542
M=0 // 8543

////PushInstruction("constant 0")
@SP // 8544
AM=M+1 // 8545
A=A-1 // 8546
M=0 // 8547

////PushInstruction("constant 0")
@SP // 8548
AM=M+1 // 8549
A=A-1 // 8550
M=0 // 8551

////PushInstruction("constant 0")
@SP // 8552
AM=M+1 // 8553
A=A-1 // 8554
M=0 // 8555

////PushInstruction("constant 0")
@SP // 8556
AM=M+1 // 8557
A=A-1 // 8558
M=0 // 8559

////PushInstruction("constant 0")
@SP // 8560
AM=M+1 // 8561
A=A-1 // 8562
M=0 // 8563

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=4}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8564
D=A // 8565
@14 // 8566
M=D // 8567
@Output.create // 8568
D=A // 8569
@13 // 8570
M=D // 8571
@Output.initMap.ret.4 // 8572
D=A // 8573
@CALL // 8574
0;JMP // 8575
(Output.initMap.ret.4)

////PopInstruction{address=temp 0}
@SP // 8576
AM=M-1 // 8577
D=M // 8578
@5 // 8579
M=D // 8580

////PushInstruction("constant 35")
@35 // 8581
D=A // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=D // 8586

////PushInstruction("constant 0")
@SP // 8587
AM=M+1 // 8588
A=A-1 // 8589
M=0 // 8590

////PushInstruction("constant 18")
@18 // 8591
D=A // 8592
@SP // 8593
AM=M+1 // 8594
A=A-1 // 8595
M=D // 8596

////PushInstruction("constant 18")
@18 // 8597
D=A // 8598
@SP // 8599
AM=M+1 // 8600
A=A-1 // 8601
M=D // 8602

////PushInstruction("constant 63")
@63 // 8603
D=A // 8604
@SP // 8605
AM=M+1 // 8606
A=A-1 // 8607
M=D // 8608

////PushInstruction("constant 18")
@18 // 8609
D=A // 8610
@SP // 8611
AM=M+1 // 8612
A=A-1 // 8613
M=D // 8614

////PushInstruction("constant 18")
@18 // 8615
D=A // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=D // 8620

////PushInstruction("constant 63")
@63 // 8621
D=A // 8622
@SP // 8623
AM=M+1 // 8624
A=A-1 // 8625
M=D // 8626

////PushInstruction("constant 18")
@18 // 8627
D=A // 8628
@SP // 8629
AM=M+1 // 8630
A=A-1 // 8631
M=D // 8632

////PushInstruction("constant 18")
@18 // 8633
D=A // 8634
@SP // 8635
AM=M+1 // 8636
A=A-1 // 8637
M=D // 8638

////PushInstruction("constant 0")
@SP // 8639
AM=M+1 // 8640
A=A-1 // 8641
M=0 // 8642

////PushInstruction("constant 0")
@SP // 8643
AM=M+1 // 8644
A=A-1 // 8645
M=0 // 8646

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=5}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8647
D=A // 8648
@14 // 8649
M=D // 8650
@Output.create // 8651
D=A // 8652
@13 // 8653
M=D // 8654
@Output.initMap.ret.5 // 8655
D=A // 8656
@CALL // 8657
0;JMP // 8658
(Output.initMap.ret.5)

////PopInstruction{address=temp 0}
@SP // 8659
AM=M-1 // 8660
D=M // 8661
@5 // 8662
M=D // 8663

////PushInstruction("constant 36")
@36 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669

////PushInstruction("constant 12")
@12 // 8670
D=A // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=D // 8675

////PushInstruction("constant 30")
@30 // 8676
D=A // 8677
@SP // 8678
AM=M+1 // 8679
A=A-1 // 8680
M=D // 8681

////PushInstruction("constant 51")
@51 // 8682
D=A // 8683
@SP // 8684
AM=M+1 // 8685
A=A-1 // 8686
M=D // 8687

////PushInstruction("constant 3")
@3 // 8688
D=A // 8689
@SP // 8690
AM=M+1 // 8691
A=A-1 // 8692
M=D // 8693

////PushInstruction("constant 30")
@30 // 8694
D=A // 8695
@SP // 8696
AM=M+1 // 8697
A=A-1 // 8698
M=D // 8699

////PushInstruction("constant 48")
@48 // 8700
D=A // 8701
@SP // 8702
AM=M+1 // 8703
A=A-1 // 8704
M=D // 8705

////PushInstruction("constant 51")
@51 // 8706
D=A // 8707
@SP // 8708
AM=M+1 // 8709
A=A-1 // 8710
M=D // 8711

////PushInstruction("constant 30")
@30 // 8712
D=A // 8713
@SP // 8714
AM=M+1 // 8715
A=A-1 // 8716
M=D // 8717

////PushInstruction("constant 12")
@12 // 8718
D=A // 8719
@SP // 8720
AM=M+1 // 8721
A=A-1 // 8722
M=D // 8723

////PushInstruction("constant 12")
@12 // 8724
D=A // 8725
@SP // 8726
AM=M+1 // 8727
A=A-1 // 8728
M=D // 8729

////PushInstruction("constant 0")
@SP // 8730
AM=M+1 // 8731
A=A-1 // 8732
M=0 // 8733

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=6}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8734
D=A // 8735
@14 // 8736
M=D // 8737
@Output.create // 8738
D=A // 8739
@13 // 8740
M=D // 8741
@Output.initMap.ret.6 // 8742
D=A // 8743
@CALL // 8744
0;JMP // 8745
(Output.initMap.ret.6)

////PopInstruction{address=temp 0}
@SP // 8746
AM=M-1 // 8747
D=M // 8748
@5 // 8749
M=D // 8750

////PushInstruction("constant 37")
@37 // 8751
D=A // 8752
@SP // 8753
AM=M+1 // 8754
A=A-1 // 8755
M=D // 8756

////PushInstruction("constant 0")
@SP // 8757
AM=M+1 // 8758
A=A-1 // 8759
M=0 // 8760

////PushInstruction("constant 0")
@SP // 8761
AM=M+1 // 8762
A=A-1 // 8763
M=0 // 8764

////PushInstruction("constant 35")
@35 // 8765
D=A // 8766
@SP // 8767
AM=M+1 // 8768
A=A-1 // 8769
M=D // 8770

////PushInstruction("constant 51")
@51 // 8771
D=A // 8772
@SP // 8773
AM=M+1 // 8774
A=A-1 // 8775
M=D // 8776

////PushInstruction("constant 24")
@24 // 8777
D=A // 8778
@SP // 8779
AM=M+1 // 8780
A=A-1 // 8781
M=D // 8782

////PushInstruction("constant 12")
@12 // 8783
D=A // 8784
@SP // 8785
AM=M+1 // 8786
A=A-1 // 8787
M=D // 8788

////PushInstruction("constant 6")
@6 // 8789
D=A // 8790
@SP // 8791
AM=M+1 // 8792
A=A-1 // 8793
M=D // 8794

////PushInstruction("constant 51")
@51 // 8795
D=A // 8796
@SP // 8797
AM=M+1 // 8798
A=A-1 // 8799
M=D // 8800

////PushInstruction("constant 49")
@49 // 8801
D=A // 8802
@SP // 8803
AM=M+1 // 8804
A=A-1 // 8805
M=D // 8806

////PushInstruction("constant 0")
@SP // 8807
AM=M+1 // 8808
A=A-1 // 8809
M=0 // 8810

////PushInstruction("constant 0")
@SP // 8811
AM=M+1 // 8812
A=A-1 // 8813
M=0 // 8814

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=7}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8815
D=A // 8816
@14 // 8817
M=D // 8818
@Output.create // 8819
D=A // 8820
@13 // 8821
M=D // 8822
@Output.initMap.ret.7 // 8823
D=A // 8824
@CALL // 8825
0;JMP // 8826
(Output.initMap.ret.7)

////PopInstruction{address=temp 0}
@SP // 8827
AM=M-1 // 8828
D=M // 8829
@5 // 8830
M=D // 8831

////PushInstruction("constant 38")
@38 // 8832
D=A // 8833
@SP // 8834
AM=M+1 // 8835
A=A-1 // 8836
M=D // 8837

////PushInstruction("constant 12")
@12 // 8838
D=A // 8839
@SP // 8840
AM=M+1 // 8841
A=A-1 // 8842
M=D // 8843

////PushInstruction("constant 30")
@30 // 8844
D=A // 8845
@SP // 8846
AM=M+1 // 8847
A=A-1 // 8848
M=D // 8849

////PushInstruction("constant 30")
@30 // 8850
D=A // 8851
@SP // 8852
AM=M+1 // 8853
A=A-1 // 8854
M=D // 8855

////PushInstruction("constant 12")
@12 // 8856
D=A // 8857
@SP // 8858
AM=M+1 // 8859
A=A-1 // 8860
M=D // 8861

////PushInstruction("constant 54")
@54 // 8862
D=A // 8863
@SP // 8864
AM=M+1 // 8865
A=A-1 // 8866
M=D // 8867

////PushInstruction("constant 27")
@27 // 8868
D=A // 8869
@SP // 8870
AM=M+1 // 8871
A=A-1 // 8872
M=D // 8873

////PushInstruction("constant 27")
@27 // 8874
D=A // 8875
@SP // 8876
AM=M+1 // 8877
A=A-1 // 8878
M=D // 8879

////PushInstruction("constant 27")
@27 // 8880
D=A // 8881
@SP // 8882
AM=M+1 // 8883
A=A-1 // 8884
M=D // 8885

////PushInstruction("constant 54")
@54 // 8886
D=A // 8887
@SP // 8888
AM=M+1 // 8889
A=A-1 // 8890
M=D // 8891

////PushInstruction("constant 0")
@SP // 8892
AM=M+1 // 8893
A=A-1 // 8894
M=0 // 8895

////PushInstruction("constant 0")
@SP // 8896
AM=M+1 // 8897
A=A-1 // 8898
M=0 // 8899

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=8}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8900
D=A // 8901
@14 // 8902
M=D // 8903
@Output.create // 8904
D=A // 8905
@13 // 8906
M=D // 8907
@Output.initMap.ret.8 // 8908
D=A // 8909
@CALL // 8910
0;JMP // 8911
(Output.initMap.ret.8)

////PopInstruction{address=temp 0}
@SP // 8912
AM=M-1 // 8913
D=M // 8914
@5 // 8915
M=D // 8916

////PushInstruction("constant 39")
@39 // 8917
D=A // 8918
@SP // 8919
AM=M+1 // 8920
A=A-1 // 8921
M=D // 8922

////PushInstruction("constant 12")
@12 // 8923
D=A // 8924
@SP // 8925
AM=M+1 // 8926
A=A-1 // 8927
M=D // 8928

////PushInstruction("constant 12")
@12 // 8929
D=A // 8930
@SP // 8931
AM=M+1 // 8932
A=A-1 // 8933
M=D // 8934

////PushInstruction("constant 6")
@6 // 8935
D=A // 8936
@SP // 8937
AM=M+1 // 8938
A=A-1 // 8939
M=D // 8940

////PushInstruction("constant 0")
@SP // 8941
AM=M+1 // 8942
A=A-1 // 8943
M=0 // 8944

////PushInstruction("constant 0")
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=0 // 8948

////PushInstruction("constant 0")
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=0 // 8952

////PushInstruction("constant 0")
@SP // 8953
AM=M+1 // 8954
A=A-1 // 8955
M=0 // 8956

////PushInstruction("constant 0")
@SP // 8957
AM=M+1 // 8958
A=A-1 // 8959
M=0 // 8960

////PushInstruction("constant 0")
@SP // 8961
AM=M+1 // 8962
A=A-1 // 8963
M=0 // 8964

////PushInstruction("constant 0")
@SP // 8965
AM=M+1 // 8966
A=A-1 // 8967
M=0 // 8968

////PushInstruction("constant 0")
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=0 // 8972

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=9}, currentFunction='Output.initMap'}
// call Output.create
@17 // 8973
D=A // 8974
@14 // 8975
M=D // 8976
@Output.create // 8977
D=A // 8978
@13 // 8979
M=D // 8980
@Output.initMap.ret.9 // 8981
D=A // 8982
@CALL // 8983
0;JMP // 8984
(Output.initMap.ret.9)

////PopInstruction{address=temp 0}
@SP // 8985
AM=M-1 // 8986
D=M // 8987
@5 // 8988
M=D // 8989

////PushInstruction("constant 40")
@40 // 8990
D=A // 8991
@SP // 8992
AM=M+1 // 8993
A=A-1 // 8994
M=D // 8995

////PushInstruction("constant 24")
@24 // 8996
D=A // 8997
@SP // 8998
AM=M+1 // 8999
A=A-1 // 9000
M=D // 9001

////PushInstruction("constant 12")
@12 // 9002
D=A // 9003
@SP // 9004
AM=M+1 // 9005
A=A-1 // 9006
M=D // 9007

////PushInstruction("constant 6")
@6 // 9008
D=A // 9009
@SP // 9010
AM=M+1 // 9011
A=A-1 // 9012
M=D // 9013

////PushInstruction("constant 6")
@6 // 9014
D=A // 9015
@SP // 9016
AM=M+1 // 9017
A=A-1 // 9018
M=D // 9019

////PushInstruction("constant 6")
@6 // 9020
D=A // 9021
@SP // 9022
AM=M+1 // 9023
A=A-1 // 9024
M=D // 9025

////PushInstruction("constant 6")
@6 // 9026
D=A // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=D // 9031

////PushInstruction("constant 6")
@6 // 9032
D=A // 9033
@SP // 9034
AM=M+1 // 9035
A=A-1 // 9036
M=D // 9037

////PushInstruction("constant 12")
@12 // 9038
D=A // 9039
@SP // 9040
AM=M+1 // 9041
A=A-1 // 9042
M=D // 9043

////PushInstruction("constant 24")
@24 // 9044
D=A // 9045
@SP // 9046
AM=M+1 // 9047
A=A-1 // 9048
M=D // 9049

////PushInstruction("constant 0")
@SP // 9050
AM=M+1 // 9051
A=A-1 // 9052
M=0 // 9053

////PushInstruction("constant 0")
@SP // 9054
AM=M+1 // 9055
A=A-1 // 9056
M=0 // 9057

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=10}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9058
D=A // 9059
@14 // 9060
M=D // 9061
@Output.create // 9062
D=A // 9063
@13 // 9064
M=D // 9065
@Output.initMap.ret.10 // 9066
D=A // 9067
@CALL // 9068
0;JMP // 9069
(Output.initMap.ret.10)

////PopInstruction{address=temp 0}
@SP // 9070
AM=M-1 // 9071
D=M // 9072
@5 // 9073
M=D // 9074

////PushInstruction("constant 41")
@41 // 9075
D=A // 9076
@SP // 9077
AM=M+1 // 9078
A=A-1 // 9079
M=D // 9080

////PushInstruction("constant 6")
@6 // 9081
D=A // 9082
@SP // 9083
AM=M+1 // 9084
A=A-1 // 9085
M=D // 9086

////PushInstruction("constant 12")
@12 // 9087
D=A // 9088
@SP // 9089
AM=M+1 // 9090
A=A-1 // 9091
M=D // 9092

////PushInstruction("constant 24")
@24 // 9093
D=A // 9094
@SP // 9095
AM=M+1 // 9096
A=A-1 // 9097
M=D // 9098

////PushInstruction("constant 24")
@24 // 9099
D=A // 9100
@SP // 9101
AM=M+1 // 9102
A=A-1 // 9103
M=D // 9104

////PushInstruction("constant 24")
@24 // 9105
D=A // 9106
@SP // 9107
AM=M+1 // 9108
A=A-1 // 9109
M=D // 9110

////PushInstruction("constant 24")
@24 // 9111
D=A // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=D // 9116

////PushInstruction("constant 24")
@24 // 9117
D=A // 9118
@SP // 9119
AM=M+1 // 9120
A=A-1 // 9121
M=D // 9122

////PushInstruction("constant 12")
@12 // 9123
D=A // 9124
@SP // 9125
AM=M+1 // 9126
A=A-1 // 9127
M=D // 9128

////PushInstruction("constant 6")
@6 // 9129
D=A // 9130
@SP // 9131
AM=M+1 // 9132
A=A-1 // 9133
M=D // 9134

////PushInstruction("constant 0")
@SP // 9135
AM=M+1 // 9136
A=A-1 // 9137
M=0 // 9138

////PushInstruction("constant 0")
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=0 // 9142

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=11}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9143
D=A // 9144
@14 // 9145
M=D // 9146
@Output.create // 9147
D=A // 9148
@13 // 9149
M=D // 9150
@Output.initMap.ret.11 // 9151
D=A // 9152
@CALL // 9153
0;JMP // 9154
(Output.initMap.ret.11)

////PopInstruction{address=temp 0}
@SP // 9155
AM=M-1 // 9156
D=M // 9157
@5 // 9158
M=D // 9159

////PushInstruction("constant 42")
@42 // 9160
D=A // 9161
@SP // 9162
AM=M+1 // 9163
A=A-1 // 9164
M=D // 9165

////PushInstruction("constant 0")
@SP // 9166
AM=M+1 // 9167
A=A-1 // 9168
M=0 // 9169

////PushInstruction("constant 0")
@SP // 9170
AM=M+1 // 9171
A=A-1 // 9172
M=0 // 9173

////PushInstruction("constant 0")
@SP // 9174
AM=M+1 // 9175
A=A-1 // 9176
M=0 // 9177

////PushInstruction("constant 51")
@51 // 9178
D=A // 9179
@SP // 9180
AM=M+1 // 9181
A=A-1 // 9182
M=D // 9183

////PushInstruction("constant 30")
@30 // 9184
D=A // 9185
@SP // 9186
AM=M+1 // 9187
A=A-1 // 9188
M=D // 9189

////PushInstruction("constant 63")
@63 // 9190
D=A // 9191
@SP // 9192
AM=M+1 // 9193
A=A-1 // 9194
M=D // 9195

////PushInstruction("constant 30")
@30 // 9196
D=A // 9197
@SP // 9198
AM=M+1 // 9199
A=A-1 // 9200
M=D // 9201

////PushInstruction("constant 51")
@51 // 9202
D=A // 9203
@SP // 9204
AM=M+1 // 9205
A=A-1 // 9206
M=D // 9207

////PushInstruction("constant 0")
@SP // 9208
AM=M+1 // 9209
A=A-1 // 9210
M=0 // 9211

////PushInstruction("constant 0")
@SP // 9212
AM=M+1 // 9213
A=A-1 // 9214
M=0 // 9215

////PushInstruction("constant 0")
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=0 // 9219

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=12}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9220
D=A // 9221
@14 // 9222
M=D // 9223
@Output.create // 9224
D=A // 9225
@13 // 9226
M=D // 9227
@Output.initMap.ret.12 // 9228
D=A // 9229
@CALL // 9230
0;JMP // 9231
(Output.initMap.ret.12)

////PopInstruction{address=temp 0}
@SP // 9232
AM=M-1 // 9233
D=M // 9234
@5 // 9235
M=D // 9236

////PushInstruction("constant 43")
@43 // 9237
D=A // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=D // 9242

////PushInstruction("constant 0")
@SP // 9243
AM=M+1 // 9244
A=A-1 // 9245
M=0 // 9246

////PushInstruction("constant 0")
@SP // 9247
AM=M+1 // 9248
A=A-1 // 9249
M=0 // 9250

////PushInstruction("constant 0")
@SP // 9251
AM=M+1 // 9252
A=A-1 // 9253
M=0 // 9254

////PushInstruction("constant 12")
@12 // 9255
D=A // 9256
@SP // 9257
AM=M+1 // 9258
A=A-1 // 9259
M=D // 9260

////PushInstruction("constant 12")
@12 // 9261
D=A // 9262
@SP // 9263
AM=M+1 // 9264
A=A-1 // 9265
M=D // 9266

////PushInstruction("constant 63")
@63 // 9267
D=A // 9268
@SP // 9269
AM=M+1 // 9270
A=A-1 // 9271
M=D // 9272

////PushInstruction("constant 12")
@12 // 9273
D=A // 9274
@SP // 9275
AM=M+1 // 9276
A=A-1 // 9277
M=D // 9278

////PushInstruction("constant 12")
@12 // 9279
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

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=13}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9297
D=A // 9298
@14 // 9299
M=D // 9300
@Output.create // 9301
D=A // 9302
@13 // 9303
M=D // 9304
@Output.initMap.ret.13 // 9305
D=A // 9306
@CALL // 9307
0;JMP // 9308
(Output.initMap.ret.13)

////PopInstruction{address=temp 0}
@SP // 9309
AM=M-1 // 9310
D=M // 9311
@5 // 9312
M=D // 9313

////PushInstruction("constant 44")
@44 // 9314
D=A // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=D // 9319

////PushInstruction("constant 0")
@SP // 9320
AM=M+1 // 9321
A=A-1 // 9322
M=0 // 9323

////PushInstruction("constant 0")
@SP // 9324
AM=M+1 // 9325
A=A-1 // 9326
M=0 // 9327

////PushInstruction("constant 0")
@SP // 9328
AM=M+1 // 9329
A=A-1 // 9330
M=0 // 9331

////PushInstruction("constant 0")
@SP // 9332
AM=M+1 // 9333
A=A-1 // 9334
M=0 // 9335

////PushInstruction("constant 0")
@SP // 9336
AM=M+1 // 9337
A=A-1 // 9338
M=0 // 9339

////PushInstruction("constant 0")
@SP // 9340
AM=M+1 // 9341
A=A-1 // 9342
M=0 // 9343

////PushInstruction("constant 0")
@SP // 9344
AM=M+1 // 9345
A=A-1 // 9346
M=0 // 9347

////PushInstruction("constant 12")
@12 // 9348
D=A // 9349
@SP // 9350
AM=M+1 // 9351
A=A-1 // 9352
M=D // 9353

////PushInstruction("constant 12")
@12 // 9354
D=A // 9355
@SP // 9356
AM=M+1 // 9357
A=A-1 // 9358
M=D // 9359

////PushInstruction("constant 6")
@6 // 9360
D=A // 9361
@SP // 9362
AM=M+1 // 9363
A=A-1 // 9364
M=D // 9365

////PushInstruction("constant 0")
@SP // 9366
AM=M+1 // 9367
A=A-1 // 9368
M=0 // 9369

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=14}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9370
D=A // 9371
@14 // 9372
M=D // 9373
@Output.create // 9374
D=A // 9375
@13 // 9376
M=D // 9377
@Output.initMap.ret.14 // 9378
D=A // 9379
@CALL // 9380
0;JMP // 9381
(Output.initMap.ret.14)

////PopInstruction{address=temp 0}
@SP // 9382
AM=M-1 // 9383
D=M // 9384
@5 // 9385
M=D // 9386

////PushInstruction("constant 45")
@45 // 9387
D=A // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=D // 9392

////PushInstruction("constant 0")
@SP // 9393
AM=M+1 // 9394
A=A-1 // 9395
M=0 // 9396

////PushInstruction("constant 0")
@SP // 9397
AM=M+1 // 9398
A=A-1 // 9399
M=0 // 9400

////PushInstruction("constant 0")
@SP // 9401
AM=M+1 // 9402
A=A-1 // 9403
M=0 // 9404

////PushInstruction("constant 0")
@SP // 9405
AM=M+1 // 9406
A=A-1 // 9407
M=0 // 9408

////PushInstruction("constant 0")
@SP // 9409
AM=M+1 // 9410
A=A-1 // 9411
M=0 // 9412

////PushInstruction("constant 63")
@63 // 9413
D=A // 9414
@SP // 9415
AM=M+1 // 9416
A=A-1 // 9417
M=D // 9418

////PushInstruction("constant 0")
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=0 // 9422

////PushInstruction("constant 0")
@SP // 9423
AM=M+1 // 9424
A=A-1 // 9425
M=0 // 9426

////PushInstruction("constant 0")
@SP // 9427
AM=M+1 // 9428
A=A-1 // 9429
M=0 // 9430

////PushInstruction("constant 0")
@SP // 9431
AM=M+1 // 9432
A=A-1 // 9433
M=0 // 9434

////PushInstruction("constant 0")
@SP // 9435
AM=M+1 // 9436
A=A-1 // 9437
M=0 // 9438

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=15}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9439
D=A // 9440
@14 // 9441
M=D // 9442
@Output.create // 9443
D=A // 9444
@13 // 9445
M=D // 9446
@Output.initMap.ret.15 // 9447
D=A // 9448
@CALL // 9449
0;JMP // 9450
(Output.initMap.ret.15)

////PopInstruction{address=temp 0}
@SP // 9451
AM=M-1 // 9452
D=M // 9453
@5 // 9454
M=D // 9455

////PushInstruction("constant 46")
@46 // 9456
D=A // 9457
@SP // 9458
AM=M+1 // 9459
A=A-1 // 9460
M=D // 9461

////PushInstruction("constant 0")
@SP // 9462
AM=M+1 // 9463
A=A-1 // 9464
M=0 // 9465

////PushInstruction("constant 0")
@SP // 9466
AM=M+1 // 9467
A=A-1 // 9468
M=0 // 9469

////PushInstruction("constant 0")
@SP // 9470
AM=M+1 // 9471
A=A-1 // 9472
M=0 // 9473

////PushInstruction("constant 0")
@SP // 9474
AM=M+1 // 9475
A=A-1 // 9476
M=0 // 9477

////PushInstruction("constant 0")
@SP // 9478
AM=M+1 // 9479
A=A-1 // 9480
M=0 // 9481

////PushInstruction("constant 0")
@SP // 9482
AM=M+1 // 9483
A=A-1 // 9484
M=0 // 9485

////PushInstruction("constant 0")
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=0 // 9489

////PushInstruction("constant 12")
@12 // 9490
D=A // 9491
@SP // 9492
AM=M+1 // 9493
A=A-1 // 9494
M=D // 9495

////PushInstruction("constant 12")
@12 // 9496
D=A // 9497
@SP // 9498
AM=M+1 // 9499
A=A-1 // 9500
M=D // 9501

////PushInstruction("constant 0")
@SP // 9502
AM=M+1 // 9503
A=A-1 // 9504
M=0 // 9505

////PushInstruction("constant 0")
@SP // 9506
AM=M+1 // 9507
A=A-1 // 9508
M=0 // 9509

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=16}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9510
D=A // 9511
@14 // 9512
M=D // 9513
@Output.create // 9514
D=A // 9515
@13 // 9516
M=D // 9517
@Output.initMap.ret.16 // 9518
D=A // 9519
@CALL // 9520
0;JMP // 9521
(Output.initMap.ret.16)

////PopInstruction{address=temp 0}
@SP // 9522
AM=M-1 // 9523
D=M // 9524
@5 // 9525
M=D // 9526

////PushInstruction("constant 47")
@47 // 9527
D=A // 9528
@SP // 9529
AM=M+1 // 9530
A=A-1 // 9531
M=D // 9532

////PushInstruction("constant 0")
@SP // 9533
AM=M+1 // 9534
A=A-1 // 9535
M=0 // 9536

////PushInstruction("constant 0")
@SP // 9537
AM=M+1 // 9538
A=A-1 // 9539
M=0 // 9540

////PushInstruction("constant 32")
@32 // 9541
D=A // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=D // 9546

////PushInstruction("constant 48")
@48 // 9547
D=A // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=D // 9552

////PushInstruction("constant 24")
@24 // 9553
D=A // 9554
@SP // 9555
AM=M+1 // 9556
A=A-1 // 9557
M=D // 9558

////PushInstruction("constant 12")
@12 // 9559
D=A // 9560
@SP // 9561
AM=M+1 // 9562
A=A-1 // 9563
M=D // 9564

////PushInstruction("constant 6")
@6 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570

////PushInstruction("constant 3")
@3 // 9571
D=A // 9572
@SP // 9573
AM=M+1 // 9574
A=A-1 // 9575
M=D // 9576

////PushInstruction("constant 1")
@SP // 9577
AM=M+1 // 9578
A=A-1 // 9579
M=1 // 9580

////PushInstruction("constant 0")
@SP // 9581
AM=M+1 // 9582
A=A-1 // 9583
M=0 // 9584

////PushInstruction("constant 0")
@SP // 9585
AM=M+1 // 9586
A=A-1 // 9587
M=0 // 9588

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=17}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9589
D=A // 9590
@14 // 9591
M=D // 9592
@Output.create // 9593
D=A // 9594
@13 // 9595
M=D // 9596
@Output.initMap.ret.17 // 9597
D=A // 9598
@CALL // 9599
0;JMP // 9600
(Output.initMap.ret.17)

////PopInstruction{address=temp 0}
@SP // 9601
AM=M-1 // 9602
D=M // 9603
@5 // 9604
M=D // 9605

////PushInstruction("constant 48")
@48 // 9606
D=A // 9607
@SP // 9608
AM=M+1 // 9609
A=A-1 // 9610
M=D // 9611

////PushInstruction("constant 12")
@12 // 9612
D=A // 9613
@SP // 9614
AM=M+1 // 9615
A=A-1 // 9616
M=D // 9617

////PushInstruction("constant 30")
@30 // 9618
D=A // 9619
@SP // 9620
AM=M+1 // 9621
A=A-1 // 9622
M=D // 9623

////PushInstruction("constant 51")
@51 // 9624
D=A // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=D // 9629

////PushInstruction("constant 51")
@51 // 9630
D=A // 9631
@SP // 9632
AM=M+1 // 9633
A=A-1 // 9634
M=D // 9635

////PushInstruction("constant 51")
@51 // 9636
D=A // 9637
@SP // 9638
AM=M+1 // 9639
A=A-1 // 9640
M=D // 9641

////PushInstruction("constant 51")
@51 // 9642
D=A // 9643
@SP // 9644
AM=M+1 // 9645
A=A-1 // 9646
M=D // 9647

////PushInstruction("constant 51")
@51 // 9648
D=A // 9649
@SP // 9650
AM=M+1 // 9651
A=A-1 // 9652
M=D // 9653

////PushInstruction("constant 30")
@30 // 9654
D=A // 9655
@SP // 9656
AM=M+1 // 9657
A=A-1 // 9658
M=D // 9659

////PushInstruction("constant 12")
@12 // 9660
D=A // 9661
@SP // 9662
AM=M+1 // 9663
A=A-1 // 9664
M=D // 9665

////PushInstruction("constant 0")
@SP // 9666
AM=M+1 // 9667
A=A-1 // 9668
M=0 // 9669

////PushInstruction("constant 0")
@SP // 9670
AM=M+1 // 9671
A=A-1 // 9672
M=0 // 9673

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=18}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9674
D=A // 9675
@14 // 9676
M=D // 9677
@Output.create // 9678
D=A // 9679
@13 // 9680
M=D // 9681
@Output.initMap.ret.18 // 9682
D=A // 9683
@CALL // 9684
0;JMP // 9685
(Output.initMap.ret.18)

////PopInstruction{address=temp 0}
@SP // 9686
AM=M-1 // 9687
D=M // 9688
@5 // 9689
M=D // 9690

////PushInstruction("constant 49")
@49 // 9691
D=A // 9692
@SP // 9693
AM=M+1 // 9694
A=A-1 // 9695
M=D // 9696

////PushInstruction("constant 12")
@12 // 9697
D=A // 9698
@SP // 9699
AM=M+1 // 9700
A=A-1 // 9701
M=D // 9702

////PushInstruction("constant 14")
@14 // 9703
D=A // 9704
@SP // 9705
AM=M+1 // 9706
A=A-1 // 9707
M=D // 9708

////PushInstruction("constant 15")
@15 // 9709
D=A // 9710
@SP // 9711
AM=M+1 // 9712
A=A-1 // 9713
M=D // 9714

////PushInstruction("constant 12")
@12 // 9715
D=A // 9716
@SP // 9717
AM=M+1 // 9718
A=A-1 // 9719
M=D // 9720

////PushInstruction("constant 12")
@12 // 9721
D=A // 9722
@SP // 9723
AM=M+1 // 9724
A=A-1 // 9725
M=D // 9726

////PushInstruction("constant 12")
@12 // 9727
D=A // 9728
@SP // 9729
AM=M+1 // 9730
A=A-1 // 9731
M=D // 9732

////PushInstruction("constant 12")
@12 // 9733
D=A // 9734
@SP // 9735
AM=M+1 // 9736
A=A-1 // 9737
M=D // 9738

////PushInstruction("constant 12")
@12 // 9739
D=A // 9740
@SP // 9741
AM=M+1 // 9742
A=A-1 // 9743
M=D // 9744

////PushInstruction("constant 63")
@63 // 9745
D=A // 9746
@SP // 9747
AM=M+1 // 9748
A=A-1 // 9749
M=D // 9750

////PushInstruction("constant 0")
@SP // 9751
AM=M+1 // 9752
A=A-1 // 9753
M=0 // 9754

////PushInstruction("constant 0")
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=0 // 9758

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=19}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9759
D=A // 9760
@14 // 9761
M=D // 9762
@Output.create // 9763
D=A // 9764
@13 // 9765
M=D // 9766
@Output.initMap.ret.19 // 9767
D=A // 9768
@CALL // 9769
0;JMP // 9770
(Output.initMap.ret.19)

////PopInstruction{address=temp 0}
@SP // 9771
AM=M-1 // 9772
D=M // 9773
@5 // 9774
M=D // 9775

////PushInstruction("constant 50")
@50 // 9776
D=A // 9777
@SP // 9778
AM=M+1 // 9779
A=A-1 // 9780
M=D // 9781

////PushInstruction("constant 30")
@30 // 9782
D=A // 9783
@SP // 9784
AM=M+1 // 9785
A=A-1 // 9786
M=D // 9787

////PushInstruction("constant 51")
@51 // 9788
D=A // 9789
@SP // 9790
AM=M+1 // 9791
A=A-1 // 9792
M=D // 9793

////PushInstruction("constant 48")
@48 // 9794
D=A // 9795
@SP // 9796
AM=M+1 // 9797
A=A-1 // 9798
M=D // 9799

////PushInstruction("constant 24")
@24 // 9800
D=A // 9801
@SP // 9802
AM=M+1 // 9803
A=A-1 // 9804
M=D // 9805

////PushInstruction("constant 12")
@12 // 9806
D=A // 9807
@SP // 9808
AM=M+1 // 9809
A=A-1 // 9810
M=D // 9811

////PushInstruction("constant 6")
@6 // 9812
D=A // 9813
@SP // 9814
AM=M+1 // 9815
A=A-1 // 9816
M=D // 9817

////PushInstruction("constant 3")
@3 // 9818
D=A // 9819
@SP // 9820
AM=M+1 // 9821
A=A-1 // 9822
M=D // 9823

////PushInstruction("constant 51")
@51 // 9824
D=A // 9825
@SP // 9826
AM=M+1 // 9827
A=A-1 // 9828
M=D // 9829

////PushInstruction("constant 63")
@63 // 9830
D=A // 9831
@SP // 9832
AM=M+1 // 9833
A=A-1 // 9834
M=D // 9835

////PushInstruction("constant 0")
@SP // 9836
AM=M+1 // 9837
A=A-1 // 9838
M=0 // 9839

////PushInstruction("constant 0")
@SP // 9840
AM=M+1 // 9841
A=A-1 // 9842
M=0 // 9843

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=20}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9844
D=A // 9845
@14 // 9846
M=D // 9847
@Output.create // 9848
D=A // 9849
@13 // 9850
M=D // 9851
@Output.initMap.ret.20 // 9852
D=A // 9853
@CALL // 9854
0;JMP // 9855
(Output.initMap.ret.20)

////PopInstruction{address=temp 0}
@SP // 9856
AM=M-1 // 9857
D=M // 9858
@5 // 9859
M=D // 9860

////PushInstruction("constant 51")
@51 // 9861
D=A // 9862
@SP // 9863
AM=M+1 // 9864
A=A-1 // 9865
M=D // 9866

////PushInstruction("constant 30")
@30 // 9867
D=A // 9868
@SP // 9869
AM=M+1 // 9870
A=A-1 // 9871
M=D // 9872

////PushInstruction("constant 51")
@51 // 9873
D=A // 9874
@SP // 9875
AM=M+1 // 9876
A=A-1 // 9877
M=D // 9878

////PushInstruction("constant 48")
@48 // 9879
D=A // 9880
@SP // 9881
AM=M+1 // 9882
A=A-1 // 9883
M=D // 9884

////PushInstruction("constant 48")
@48 // 9885
D=A // 9886
@SP // 9887
AM=M+1 // 9888
A=A-1 // 9889
M=D // 9890

////PushInstruction("constant 28")
@28 // 9891
D=A // 9892
@SP // 9893
AM=M+1 // 9894
A=A-1 // 9895
M=D // 9896

////PushInstruction("constant 48")
@48 // 9897
D=A // 9898
@SP // 9899
AM=M+1 // 9900
A=A-1 // 9901
M=D // 9902

////PushInstruction("constant 48")
@48 // 9903
D=A // 9904
@SP // 9905
AM=M+1 // 9906
A=A-1 // 9907
M=D // 9908

////PushInstruction("constant 51")
@51 // 9909
D=A // 9910
@SP // 9911
AM=M+1 // 9912
A=A-1 // 9913
M=D // 9914

////PushInstruction("constant 30")
@30 // 9915
D=A // 9916
@SP // 9917
AM=M+1 // 9918
A=A-1 // 9919
M=D // 9920

////PushInstruction("constant 0")
@SP // 9921
AM=M+1 // 9922
A=A-1 // 9923
M=0 // 9924

////PushInstruction("constant 0")
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=0 // 9928

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=21}, currentFunction='Output.initMap'}
// call Output.create
@17 // 9929
D=A // 9930
@14 // 9931
M=D // 9932
@Output.create // 9933
D=A // 9934
@13 // 9935
M=D // 9936
@Output.initMap.ret.21 // 9937
D=A // 9938
@CALL // 9939
0;JMP // 9940
(Output.initMap.ret.21)

////PopInstruction{address=temp 0}
@SP // 9941
AM=M-1 // 9942
D=M // 9943
@5 // 9944
M=D // 9945

////PushInstruction("constant 52")
@52 // 9946
D=A // 9947
@SP // 9948
AM=M+1 // 9949
A=A-1 // 9950
M=D // 9951

////PushInstruction("constant 16")
@16 // 9952
D=A // 9953
@SP // 9954
AM=M+1 // 9955
A=A-1 // 9956
M=D // 9957

////PushInstruction("constant 24")
@24 // 9958
D=A // 9959
@SP // 9960
AM=M+1 // 9961
A=A-1 // 9962
M=D // 9963

////PushInstruction("constant 28")
@28 // 9964
D=A // 9965
@SP // 9966
AM=M+1 // 9967
A=A-1 // 9968
M=D // 9969

////PushInstruction("constant 26")
@26 // 9970
D=A // 9971
@SP // 9972
AM=M+1 // 9973
A=A-1 // 9974
M=D // 9975

////PushInstruction("constant 25")
@25 // 9976
D=A // 9977
@SP // 9978
AM=M+1 // 9979
A=A-1 // 9980
M=D // 9981

////PushInstruction("constant 63")
@63 // 9982
D=A // 9983
@SP // 9984
AM=M+1 // 9985
A=A-1 // 9986
M=D // 9987

////PushInstruction("constant 24")
@24 // 9988
D=A // 9989
@SP // 9990
AM=M+1 // 9991
A=A-1 // 9992
M=D // 9993

////PushInstruction("constant 24")
@24 // 9994
D=A // 9995
@SP // 9996
AM=M+1 // 9997
A=A-1 // 9998
M=D // 9999

////PushInstruction("constant 60")
@60 // 10000
D=A // 10001
@SP // 10002
AM=M+1 // 10003
A=A-1 // 10004
M=D // 10005

////PushInstruction("constant 0")
@SP // 10006
AM=M+1 // 10007
A=A-1 // 10008
M=0 // 10009

////PushInstruction("constant 0")
@SP // 10010
AM=M+1 // 10011
A=A-1 // 10012
M=0 // 10013

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=22}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10014
D=A // 10015
@14 // 10016
M=D // 10017
@Output.create // 10018
D=A // 10019
@13 // 10020
M=D // 10021
@Output.initMap.ret.22 // 10022
D=A // 10023
@CALL // 10024
0;JMP // 10025
(Output.initMap.ret.22)

////PopInstruction{address=temp 0}
@SP // 10026
AM=M-1 // 10027
D=M // 10028
@5 // 10029
M=D // 10030

////PushInstruction("constant 53")
@53 // 10031
D=A // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=D // 10036

////PushInstruction("constant 63")
@63 // 10037
D=A // 10038
@SP // 10039
AM=M+1 // 10040
A=A-1 // 10041
M=D // 10042

////PushInstruction("constant 3")
@3 // 10043
D=A // 10044
@SP // 10045
AM=M+1 // 10046
A=A-1 // 10047
M=D // 10048

////PushInstruction("constant 3")
@3 // 10049
D=A // 10050
@SP // 10051
AM=M+1 // 10052
A=A-1 // 10053
M=D // 10054

////PushInstruction("constant 31")
@31 // 10055
D=A // 10056
@SP // 10057
AM=M+1 // 10058
A=A-1 // 10059
M=D // 10060

////PushInstruction("constant 48")
@48 // 10061
D=A // 10062
@SP // 10063
AM=M+1 // 10064
A=A-1 // 10065
M=D // 10066

////PushInstruction("constant 48")
@48 // 10067
D=A // 10068
@SP // 10069
AM=M+1 // 10070
A=A-1 // 10071
M=D // 10072

////PushInstruction("constant 48")
@48 // 10073
D=A // 10074
@SP // 10075
AM=M+1 // 10076
A=A-1 // 10077
M=D // 10078

////PushInstruction("constant 51")
@51 // 10079
D=A // 10080
@SP // 10081
AM=M+1 // 10082
A=A-1 // 10083
M=D // 10084

////PushInstruction("constant 30")
@30 // 10085
D=A // 10086
@SP // 10087
AM=M+1 // 10088
A=A-1 // 10089
M=D // 10090

////PushInstruction("constant 0")
@SP // 10091
AM=M+1 // 10092
A=A-1 // 10093
M=0 // 10094

////PushInstruction("constant 0")
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=0 // 10098

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=23}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10099
D=A // 10100
@14 // 10101
M=D // 10102
@Output.create // 10103
D=A // 10104
@13 // 10105
M=D // 10106
@Output.initMap.ret.23 // 10107
D=A // 10108
@CALL // 10109
0;JMP // 10110
(Output.initMap.ret.23)

////PopInstruction{address=temp 0}
@SP // 10111
AM=M-1 // 10112
D=M // 10113
@5 // 10114
M=D // 10115

////PushInstruction("constant 54")
@54 // 10116
D=A // 10117
@SP // 10118
AM=M+1 // 10119
A=A-1 // 10120
M=D // 10121

////PushInstruction("constant 28")
@28 // 10122
D=A // 10123
@SP // 10124
AM=M+1 // 10125
A=A-1 // 10126
M=D // 10127

////PushInstruction("constant 6")
@6 // 10128
D=A // 10129
@SP // 10130
AM=M+1 // 10131
A=A-1 // 10132
M=D // 10133

////PushInstruction("constant 3")
@3 // 10134
D=A // 10135
@SP // 10136
AM=M+1 // 10137
A=A-1 // 10138
M=D // 10139

////PushInstruction("constant 3")
@3 // 10140
D=A // 10141
@SP // 10142
AM=M+1 // 10143
A=A-1 // 10144
M=D // 10145

////PushInstruction("constant 31")
@31 // 10146
D=A // 10147
@SP // 10148
AM=M+1 // 10149
A=A-1 // 10150
M=D // 10151

////PushInstruction("constant 51")
@51 // 10152
D=A // 10153
@SP // 10154
AM=M+1 // 10155
A=A-1 // 10156
M=D // 10157

////PushInstruction("constant 51")
@51 // 10158
D=A // 10159
@SP // 10160
AM=M+1 // 10161
A=A-1 // 10162
M=D // 10163

////PushInstruction("constant 51")
@51 // 10164
D=A // 10165
@SP // 10166
AM=M+1 // 10167
A=A-1 // 10168
M=D // 10169

////PushInstruction("constant 30")
@30 // 10170
D=A // 10171
@SP // 10172
AM=M+1 // 10173
A=A-1 // 10174
M=D // 10175

////PushInstruction("constant 0")
@SP // 10176
AM=M+1 // 10177
A=A-1 // 10178
M=0 // 10179

////PushInstruction("constant 0")
@SP // 10180
AM=M+1 // 10181
A=A-1 // 10182
M=0 // 10183

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=24}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10184
D=A // 10185
@14 // 10186
M=D // 10187
@Output.create // 10188
D=A // 10189
@13 // 10190
M=D // 10191
@Output.initMap.ret.24 // 10192
D=A // 10193
@CALL // 10194
0;JMP // 10195
(Output.initMap.ret.24)

////PopInstruction{address=temp 0}
@SP // 10196
AM=M-1 // 10197
D=M // 10198
@5 // 10199
M=D // 10200

////PushInstruction("constant 55")
@55 // 10201
D=A // 10202
@SP // 10203
AM=M+1 // 10204
A=A-1 // 10205
M=D // 10206

////PushInstruction("constant 63")
@63 // 10207
D=A // 10208
@SP // 10209
AM=M+1 // 10210
A=A-1 // 10211
M=D // 10212

////PushInstruction("constant 49")
@49 // 10213
D=A // 10214
@SP // 10215
AM=M+1 // 10216
A=A-1 // 10217
M=D // 10218

////PushInstruction("constant 48")
@48 // 10219
D=A // 10220
@SP // 10221
AM=M+1 // 10222
A=A-1 // 10223
M=D // 10224

////PushInstruction("constant 48")
@48 // 10225
D=A // 10226
@SP // 10227
AM=M+1 // 10228
A=A-1 // 10229
M=D // 10230

////PushInstruction("constant 24")
@24 // 10231
D=A // 10232
@SP // 10233
AM=M+1 // 10234
A=A-1 // 10235
M=D // 10236

////PushInstruction("constant 12")
@12 // 10237
D=A // 10238
@SP // 10239
AM=M+1 // 10240
A=A-1 // 10241
M=D // 10242

////PushInstruction("constant 12")
@12 // 10243
D=A // 10244
@SP // 10245
AM=M+1 // 10246
A=A-1 // 10247
M=D // 10248

////PushInstruction("constant 12")
@12 // 10249
D=A // 10250
@SP // 10251
AM=M+1 // 10252
A=A-1 // 10253
M=D // 10254

////PushInstruction("constant 12")
@12 // 10255
D=A // 10256
@SP // 10257
AM=M+1 // 10258
A=A-1 // 10259
M=D // 10260

////PushInstruction("constant 0")
@SP // 10261
AM=M+1 // 10262
A=A-1 // 10263
M=0 // 10264

////PushInstruction("constant 0")
@SP // 10265
AM=M+1 // 10266
A=A-1 // 10267
M=0 // 10268

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=25}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10269
D=A // 10270
@14 // 10271
M=D // 10272
@Output.create // 10273
D=A // 10274
@13 // 10275
M=D // 10276
@Output.initMap.ret.25 // 10277
D=A // 10278
@CALL // 10279
0;JMP // 10280
(Output.initMap.ret.25)

////PopInstruction{address=temp 0}
@SP // 10281
AM=M-1 // 10282
D=M // 10283
@5 // 10284
M=D // 10285

////PushInstruction("constant 56")
@56 // 10286
D=A // 10287
@SP // 10288
AM=M+1 // 10289
A=A-1 // 10290
M=D // 10291

////PushInstruction("constant 30")
@30 // 10292
D=A // 10293
@SP // 10294
AM=M+1 // 10295
A=A-1 // 10296
M=D // 10297

////PushInstruction("constant 51")
@51 // 10298
D=A // 10299
@SP // 10300
AM=M+1 // 10301
A=A-1 // 10302
M=D // 10303

////PushInstruction("constant 51")
@51 // 10304
D=A // 10305
@SP // 10306
AM=M+1 // 10307
A=A-1 // 10308
M=D // 10309

////PushInstruction("constant 51")
@51 // 10310
D=A // 10311
@SP // 10312
AM=M+1 // 10313
A=A-1 // 10314
M=D // 10315

////PushInstruction("constant 30")
@30 // 10316
D=A // 10317
@SP // 10318
AM=M+1 // 10319
A=A-1 // 10320
M=D // 10321

////PushInstruction("constant 51")
@51 // 10322
D=A // 10323
@SP // 10324
AM=M+1 // 10325
A=A-1 // 10326
M=D // 10327

////PushInstruction("constant 51")
@51 // 10328
D=A // 10329
@SP // 10330
AM=M+1 // 10331
A=A-1 // 10332
M=D // 10333

////PushInstruction("constant 51")
@51 // 10334
D=A // 10335
@SP // 10336
AM=M+1 // 10337
A=A-1 // 10338
M=D // 10339

////PushInstruction("constant 30")
@30 // 10340
D=A // 10341
@SP // 10342
AM=M+1 // 10343
A=A-1 // 10344
M=D // 10345

////PushInstruction("constant 0")
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=0 // 10349

////PushInstruction("constant 0")
@SP // 10350
AM=M+1 // 10351
A=A-1 // 10352
M=0 // 10353

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=26}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10354
D=A // 10355
@14 // 10356
M=D // 10357
@Output.create // 10358
D=A // 10359
@13 // 10360
M=D // 10361
@Output.initMap.ret.26 // 10362
D=A // 10363
@CALL // 10364
0;JMP // 10365
(Output.initMap.ret.26)

////PopInstruction{address=temp 0}
@SP // 10366
AM=M-1 // 10367
D=M // 10368
@5 // 10369
M=D // 10370

////PushInstruction("constant 57")
@57 // 10371
D=A // 10372
@SP // 10373
AM=M+1 // 10374
A=A-1 // 10375
M=D // 10376

////PushInstruction("constant 30")
@30 // 10377
D=A // 10378
@SP // 10379
AM=M+1 // 10380
A=A-1 // 10381
M=D // 10382

////PushInstruction("constant 51")
@51 // 10383
D=A // 10384
@SP // 10385
AM=M+1 // 10386
A=A-1 // 10387
M=D // 10388

////PushInstruction("constant 51")
@51 // 10389
D=A // 10390
@SP // 10391
AM=M+1 // 10392
A=A-1 // 10393
M=D // 10394

////PushInstruction("constant 51")
@51 // 10395
D=A // 10396
@SP // 10397
AM=M+1 // 10398
A=A-1 // 10399
M=D // 10400

////PushInstruction("constant 62")
@62 // 10401
D=A // 10402
@SP // 10403
AM=M+1 // 10404
A=A-1 // 10405
M=D // 10406

////PushInstruction("constant 48")
@48 // 10407
D=A // 10408
@SP // 10409
AM=M+1 // 10410
A=A-1 // 10411
M=D // 10412

////PushInstruction("constant 48")
@48 // 10413
D=A // 10414
@SP // 10415
AM=M+1 // 10416
A=A-1 // 10417
M=D // 10418

////PushInstruction("constant 24")
@24 // 10419
D=A // 10420
@SP // 10421
AM=M+1 // 10422
A=A-1 // 10423
M=D // 10424

////PushInstruction("constant 14")
@14 // 10425
D=A // 10426
@SP // 10427
AM=M+1 // 10428
A=A-1 // 10429
M=D // 10430

////PushInstruction("constant 0")
@SP // 10431
AM=M+1 // 10432
A=A-1 // 10433
M=0 // 10434

////PushInstruction("constant 0")
@SP // 10435
AM=M+1 // 10436
A=A-1 // 10437
M=0 // 10438

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=27}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10439
D=A // 10440
@14 // 10441
M=D // 10442
@Output.create // 10443
D=A // 10444
@13 // 10445
M=D // 10446
@Output.initMap.ret.27 // 10447
D=A // 10448
@CALL // 10449
0;JMP // 10450
(Output.initMap.ret.27)

////PopInstruction{address=temp 0}
@SP // 10451
AM=M-1 // 10452
D=M // 10453
@5 // 10454
M=D // 10455

////PushInstruction("constant 58")
@58 // 10456
D=A // 10457
@SP // 10458
AM=M+1 // 10459
A=A-1 // 10460
M=D // 10461

////PushInstruction("constant 0")
@SP // 10462
AM=M+1 // 10463
A=A-1 // 10464
M=0 // 10465

////PushInstruction("constant 0")
@SP // 10466
AM=M+1 // 10467
A=A-1 // 10468
M=0 // 10469

////PushInstruction("constant 12")
@12 // 10470
D=A // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=D // 10475

////PushInstruction("constant 12")
@12 // 10476
D=A // 10477
@SP // 10478
AM=M+1 // 10479
A=A-1 // 10480
M=D // 10481

////PushInstruction("constant 0")
@SP // 10482
AM=M+1 // 10483
A=A-1 // 10484
M=0 // 10485

////PushInstruction("constant 0")
@SP // 10486
AM=M+1 // 10487
A=A-1 // 10488
M=0 // 10489

////PushInstruction("constant 12")
@12 // 10490
D=A // 10491
@SP // 10492
AM=M+1 // 10493
A=A-1 // 10494
M=D // 10495

////PushInstruction("constant 12")
@12 // 10496
D=A // 10497
@SP // 10498
AM=M+1 // 10499
A=A-1 // 10500
M=D // 10501

////PushInstruction("constant 0")
@SP // 10502
AM=M+1 // 10503
A=A-1 // 10504
M=0 // 10505

////PushInstruction("constant 0")
@SP // 10506
AM=M+1 // 10507
A=A-1 // 10508
M=0 // 10509

////PushInstruction("constant 0")
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=0 // 10513

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=28}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10514
D=A // 10515
@14 // 10516
M=D // 10517
@Output.create // 10518
D=A // 10519
@13 // 10520
M=D // 10521
@Output.initMap.ret.28 // 10522
D=A // 10523
@CALL // 10524
0;JMP // 10525
(Output.initMap.ret.28)

////PopInstruction{address=temp 0}
@SP // 10526
AM=M-1 // 10527
D=M // 10528
@5 // 10529
M=D // 10530

////PushInstruction("constant 59")
@59 // 10531
D=A // 10532
@SP // 10533
AM=M+1 // 10534
A=A-1 // 10535
M=D // 10536

////PushInstruction("constant 0")
@SP // 10537
AM=M+1 // 10538
A=A-1 // 10539
M=0 // 10540

////PushInstruction("constant 0")
@SP // 10541
AM=M+1 // 10542
A=A-1 // 10543
M=0 // 10544

////PushInstruction("constant 12")
@12 // 10545
D=A // 10546
@SP // 10547
AM=M+1 // 10548
A=A-1 // 10549
M=D // 10550

////PushInstruction("constant 12")
@12 // 10551
D=A // 10552
@SP // 10553
AM=M+1 // 10554
A=A-1 // 10555
M=D // 10556

////PushInstruction("constant 0")
@SP // 10557
AM=M+1 // 10558
A=A-1 // 10559
M=0 // 10560

////PushInstruction("constant 0")
@SP // 10561
AM=M+1 // 10562
A=A-1 // 10563
M=0 // 10564

////PushInstruction("constant 12")
@12 // 10565
D=A // 10566
@SP // 10567
AM=M+1 // 10568
A=A-1 // 10569
M=D // 10570

////PushInstruction("constant 12")
@12 // 10571
D=A // 10572
@SP // 10573
AM=M+1 // 10574
A=A-1 // 10575
M=D // 10576

////PushInstruction("constant 6")
@6 // 10577
D=A // 10578
@SP // 10579
AM=M+1 // 10580
A=A-1 // 10581
M=D // 10582

////PushInstruction("constant 0")
@SP // 10583
AM=M+1 // 10584
A=A-1 // 10585
M=0 // 10586

////PushInstruction("constant 0")
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=0 // 10590

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=29}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10591
D=A // 10592
@14 // 10593
M=D // 10594
@Output.create // 10595
D=A // 10596
@13 // 10597
M=D // 10598
@Output.initMap.ret.29 // 10599
D=A // 10600
@CALL // 10601
0;JMP // 10602
(Output.initMap.ret.29)

////PopInstruction{address=temp 0}
@SP // 10603
AM=M-1 // 10604
D=M // 10605
@5 // 10606
M=D // 10607

////PushInstruction("constant 60")
@60 // 10608
D=A // 10609
@SP // 10610
AM=M+1 // 10611
A=A-1 // 10612
M=D // 10613

////PushInstruction("constant 0")
@SP // 10614
AM=M+1 // 10615
A=A-1 // 10616
M=0 // 10617

////PushInstruction("constant 0")
@SP // 10618
AM=M+1 // 10619
A=A-1 // 10620
M=0 // 10621

////PushInstruction("constant 24")
@24 // 10622
D=A // 10623
@SP // 10624
AM=M+1 // 10625
A=A-1 // 10626
M=D // 10627

////PushInstruction("constant 12")
@12 // 10628
D=A // 10629
@SP // 10630
AM=M+1 // 10631
A=A-1 // 10632
M=D // 10633

////PushInstruction("constant 6")
@6 // 10634
D=A // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=D // 10639

////PushInstruction("constant 3")
@3 // 10640
D=A // 10641
@SP // 10642
AM=M+1 // 10643
A=A-1 // 10644
M=D // 10645

////PushInstruction("constant 6")
@6 // 10646
D=A // 10647
@SP // 10648
AM=M+1 // 10649
A=A-1 // 10650
M=D // 10651

////PushInstruction("constant 12")
@12 // 10652
D=A // 10653
@SP // 10654
AM=M+1 // 10655
A=A-1 // 10656
M=D // 10657

////PushInstruction("constant 24")
@24 // 10658
D=A // 10659
@SP // 10660
AM=M+1 // 10661
A=A-1 // 10662
M=D // 10663

////PushInstruction("constant 0")
@SP // 10664
AM=M+1 // 10665
A=A-1 // 10666
M=0 // 10667

////PushInstruction("constant 0")
@SP // 10668
AM=M+1 // 10669
A=A-1 // 10670
M=0 // 10671

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=30}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10672
D=A // 10673
@14 // 10674
M=D // 10675
@Output.create // 10676
D=A // 10677
@13 // 10678
M=D // 10679
@Output.initMap.ret.30 // 10680
D=A // 10681
@CALL // 10682
0;JMP // 10683
(Output.initMap.ret.30)

////PopInstruction{address=temp 0}
@SP // 10684
AM=M-1 // 10685
D=M // 10686
@5 // 10687
M=D // 10688

////PushInstruction("constant 61")
@61 // 10689
D=A // 10690
@SP // 10691
AM=M+1 // 10692
A=A-1 // 10693
M=D // 10694

////PushInstruction("constant 0")
@SP // 10695
AM=M+1 // 10696
A=A-1 // 10697
M=0 // 10698

////PushInstruction("constant 0")
@SP // 10699
AM=M+1 // 10700
A=A-1 // 10701
M=0 // 10702

////PushInstruction("constant 0")
@SP // 10703
AM=M+1 // 10704
A=A-1 // 10705
M=0 // 10706

////PushInstruction("constant 63")
@63 // 10707
D=A // 10708
@SP // 10709
AM=M+1 // 10710
A=A-1 // 10711
M=D // 10712

////PushInstruction("constant 0")
@SP // 10713
AM=M+1 // 10714
A=A-1 // 10715
M=0 // 10716

////PushInstruction("constant 0")
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=0 // 10720

////PushInstruction("constant 63")
@63 // 10721
D=A // 10722
@SP // 10723
AM=M+1 // 10724
A=A-1 // 10725
M=D // 10726

////PushInstruction("constant 0")
@SP // 10727
AM=M+1 // 10728
A=A-1 // 10729
M=0 // 10730

////PushInstruction("constant 0")
@SP // 10731
AM=M+1 // 10732
A=A-1 // 10733
M=0 // 10734

////PushInstruction("constant 0")
@SP // 10735
AM=M+1 // 10736
A=A-1 // 10737
M=0 // 10738

////PushInstruction("constant 0")
@SP // 10739
AM=M+1 // 10740
A=A-1 // 10741
M=0 // 10742

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=31}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10743
D=A // 10744
@14 // 10745
M=D // 10746
@Output.create // 10747
D=A // 10748
@13 // 10749
M=D // 10750
@Output.initMap.ret.31 // 10751
D=A // 10752
@CALL // 10753
0;JMP // 10754
(Output.initMap.ret.31)

////PopInstruction{address=temp 0}
@SP // 10755
AM=M-1 // 10756
D=M // 10757
@5 // 10758
M=D // 10759

////PushInstruction("constant 62")
@62 // 10760
D=A // 10761
@SP // 10762
AM=M+1 // 10763
A=A-1 // 10764
M=D // 10765

////PushInstruction("constant 0")
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=0 // 10769

////PushInstruction("constant 0")
@SP // 10770
AM=M+1 // 10771
A=A-1 // 10772
M=0 // 10773

////PushInstruction("constant 3")
@3 // 10774
D=A // 10775
@SP // 10776
AM=M+1 // 10777
A=A-1 // 10778
M=D // 10779

////PushInstruction("constant 6")
@6 // 10780
D=A // 10781
@SP // 10782
AM=M+1 // 10783
A=A-1 // 10784
M=D // 10785

////PushInstruction("constant 12")
@12 // 10786
D=A // 10787
@SP // 10788
AM=M+1 // 10789
A=A-1 // 10790
M=D // 10791

////PushInstruction("constant 24")
@24 // 10792
D=A // 10793
@SP // 10794
AM=M+1 // 10795
A=A-1 // 10796
M=D // 10797

////PushInstruction("constant 12")
@12 // 10798
D=A // 10799
@SP // 10800
AM=M+1 // 10801
A=A-1 // 10802
M=D // 10803

////PushInstruction("constant 6")
@6 // 10804
D=A // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=D // 10809

////PushInstruction("constant 3")
@3 // 10810
D=A // 10811
@SP // 10812
AM=M+1 // 10813
A=A-1 // 10814
M=D // 10815

////PushInstruction("constant 0")
@SP // 10816
AM=M+1 // 10817
A=A-1 // 10818
M=0 // 10819

////PushInstruction("constant 0")
@SP // 10820
AM=M+1 // 10821
A=A-1 // 10822
M=0 // 10823

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=32}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10824
D=A // 10825
@14 // 10826
M=D // 10827
@Output.create // 10828
D=A // 10829
@13 // 10830
M=D // 10831
@Output.initMap.ret.32 // 10832
D=A // 10833
@CALL // 10834
0;JMP // 10835
(Output.initMap.ret.32)

////PopInstruction{address=temp 0}
@SP // 10836
AM=M-1 // 10837
D=M // 10838
@5 // 10839
M=D // 10840

////PushInstruction("constant 64")
@64 // 10841
D=A // 10842
@SP // 10843
AM=M+1 // 10844
A=A-1 // 10845
M=D // 10846

////PushInstruction("constant 30")
@30 // 10847
D=A // 10848
@SP // 10849
AM=M+1 // 10850
A=A-1 // 10851
M=D // 10852

////PushInstruction("constant 51")
@51 // 10853
D=A // 10854
@SP // 10855
AM=M+1 // 10856
A=A-1 // 10857
M=D // 10858

////PushInstruction("constant 51")
@51 // 10859
D=A // 10860
@SP // 10861
AM=M+1 // 10862
A=A-1 // 10863
M=D // 10864

////PushInstruction("constant 59")
@59 // 10865
D=A // 10866
@SP // 10867
AM=M+1 // 10868
A=A-1 // 10869
M=D // 10870

////PushInstruction("constant 59")
@59 // 10871
D=A // 10872
@SP // 10873
AM=M+1 // 10874
A=A-1 // 10875
M=D // 10876

////PushInstruction("constant 59")
@59 // 10877
D=A // 10878
@SP // 10879
AM=M+1 // 10880
A=A-1 // 10881
M=D // 10882

////PushInstruction("constant 27")
@27 // 10883
D=A // 10884
@SP // 10885
AM=M+1 // 10886
A=A-1 // 10887
M=D // 10888

////PushInstruction("constant 3")
@3 // 10889
D=A // 10890
@SP // 10891
AM=M+1 // 10892
A=A-1 // 10893
M=D // 10894

////PushInstruction("constant 30")
@30 // 10895
D=A // 10896
@SP // 10897
AM=M+1 // 10898
A=A-1 // 10899
M=D // 10900

////PushInstruction("constant 0")
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=0 // 10904

////PushInstruction("constant 0")
@SP // 10905
AM=M+1 // 10906
A=A-1 // 10907
M=0 // 10908

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=33}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10909
D=A // 10910
@14 // 10911
M=D // 10912
@Output.create // 10913
D=A // 10914
@13 // 10915
M=D // 10916
@Output.initMap.ret.33 // 10917
D=A // 10918
@CALL // 10919
0;JMP // 10920
(Output.initMap.ret.33)

////PopInstruction{address=temp 0}
@SP // 10921
AM=M-1 // 10922
D=M // 10923
@5 // 10924
M=D // 10925

////PushInstruction("constant 63")
@63 // 10926
D=A // 10927
@SP // 10928
AM=M+1 // 10929
A=A-1 // 10930
M=D // 10931

////PushInstruction("constant 30")
@30 // 10932
D=A // 10933
@SP // 10934
AM=M+1 // 10935
A=A-1 // 10936
M=D // 10937

////PushInstruction("constant 51")
@51 // 10938
D=A // 10939
@SP // 10940
AM=M+1 // 10941
A=A-1 // 10942
M=D // 10943

////PushInstruction("constant 51")
@51 // 10944
D=A // 10945
@SP // 10946
AM=M+1 // 10947
A=A-1 // 10948
M=D // 10949

////PushInstruction("constant 24")
@24 // 10950
D=A // 10951
@SP // 10952
AM=M+1 // 10953
A=A-1 // 10954
M=D // 10955

////PushInstruction("constant 12")
@12 // 10956
D=A // 10957
@SP // 10958
AM=M+1 // 10959
A=A-1 // 10960
M=D // 10961

////PushInstruction("constant 12")
@12 // 10962
D=A // 10963
@SP // 10964
AM=M+1 // 10965
A=A-1 // 10966
M=D // 10967

////PushInstruction("constant 0")
@SP // 10968
AM=M+1 // 10969
A=A-1 // 10970
M=0 // 10971

////PushInstruction("constant 12")
@12 // 10972
D=A // 10973
@SP // 10974
AM=M+1 // 10975
A=A-1 // 10976
M=D // 10977

////PushInstruction("constant 12")
@12 // 10978
D=A // 10979
@SP // 10980
AM=M+1 // 10981
A=A-1 // 10982
M=D // 10983

////PushInstruction("constant 0")
@SP // 10984
AM=M+1 // 10985
A=A-1 // 10986
M=0 // 10987

////PushInstruction("constant 0")
@SP // 10988
AM=M+1 // 10989
A=A-1 // 10990
M=0 // 10991

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=34}, currentFunction='Output.initMap'}
// call Output.create
@17 // 10992
D=A // 10993
@14 // 10994
M=D // 10995
@Output.create // 10996
D=A // 10997
@13 // 10998
M=D // 10999
@Output.initMap.ret.34 // 11000
D=A // 11001
@CALL // 11002
0;JMP // 11003
(Output.initMap.ret.34)

////PopInstruction{address=temp 0}
@SP // 11004
AM=M-1 // 11005
D=M // 11006
@5 // 11007
M=D // 11008

////PushInstruction("constant 65")
@65 // 11009
D=A // 11010
@SP // 11011
AM=M+1 // 11012
A=A-1 // 11013
M=D // 11014

////PushInstruction("constant 12")
@12 // 11015
D=A // 11016
@SP // 11017
AM=M+1 // 11018
A=A-1 // 11019
M=D // 11020

////PushInstruction("constant 30")
@30 // 11021
D=A // 11022
@SP // 11023
AM=M+1 // 11024
A=A-1 // 11025
M=D // 11026

////PushInstruction("constant 51")
@51 // 11027
D=A // 11028
@SP // 11029
AM=M+1 // 11030
A=A-1 // 11031
M=D // 11032

////PushInstruction("constant 51")
@51 // 11033
D=A // 11034
@SP // 11035
AM=M+1 // 11036
A=A-1 // 11037
M=D // 11038

////PushInstruction("constant 63")
@63 // 11039
D=A // 11040
@SP // 11041
AM=M+1 // 11042
A=A-1 // 11043
M=D // 11044

////PushInstruction("constant 51")
@51 // 11045
D=A // 11046
@SP // 11047
AM=M+1 // 11048
A=A-1 // 11049
M=D // 11050

////PushInstruction("constant 51")
@51 // 11051
D=A // 11052
@SP // 11053
AM=M+1 // 11054
A=A-1 // 11055
M=D // 11056

////PushInstruction("constant 51")
@51 // 11057
D=A // 11058
@SP // 11059
AM=M+1 // 11060
A=A-1 // 11061
M=D // 11062

////PushInstruction("constant 51")
@51 // 11063
D=A // 11064
@SP // 11065
AM=M+1 // 11066
A=A-1 // 11067
M=D // 11068

////PushInstruction("constant 0")
@SP // 11069
AM=M+1 // 11070
A=A-1 // 11071
M=0 // 11072

////PushInstruction("constant 0")
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=0 // 11076

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=35}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11077
D=A // 11078
@14 // 11079
M=D // 11080
@Output.create // 11081
D=A // 11082
@13 // 11083
M=D // 11084
@Output.initMap.ret.35 // 11085
D=A // 11086
@CALL // 11087
0;JMP // 11088
(Output.initMap.ret.35)

////PopInstruction{address=temp 0}
@SP // 11089
AM=M-1 // 11090
D=M // 11091
@5 // 11092
M=D // 11093

////PushInstruction("constant 66")
@66 // 11094
D=A // 11095
@SP // 11096
AM=M+1 // 11097
A=A-1 // 11098
M=D // 11099

////PushInstruction("constant 31")
@31 // 11100
D=A // 11101
@SP // 11102
AM=M+1 // 11103
A=A-1 // 11104
M=D // 11105

////PushInstruction("constant 51")
@51 // 11106
D=A // 11107
@SP // 11108
AM=M+1 // 11109
A=A-1 // 11110
M=D // 11111

////PushInstruction("constant 51")
@51 // 11112
D=A // 11113
@SP // 11114
AM=M+1 // 11115
A=A-1 // 11116
M=D // 11117

////PushInstruction("constant 51")
@51 // 11118
D=A // 11119
@SP // 11120
AM=M+1 // 11121
A=A-1 // 11122
M=D // 11123

////PushInstruction("constant 31")
@31 // 11124
D=A // 11125
@SP // 11126
AM=M+1 // 11127
A=A-1 // 11128
M=D // 11129

////PushInstruction("constant 51")
@51 // 11130
D=A // 11131
@SP // 11132
AM=M+1 // 11133
A=A-1 // 11134
M=D // 11135

////PushInstruction("constant 51")
@51 // 11136
D=A // 11137
@SP // 11138
AM=M+1 // 11139
A=A-1 // 11140
M=D // 11141

////PushInstruction("constant 51")
@51 // 11142
D=A // 11143
@SP // 11144
AM=M+1 // 11145
A=A-1 // 11146
M=D // 11147

////PushInstruction("constant 31")
@31 // 11148
D=A // 11149
@SP // 11150
AM=M+1 // 11151
A=A-1 // 11152
M=D // 11153

////PushInstruction("constant 0")
@SP // 11154
AM=M+1 // 11155
A=A-1 // 11156
M=0 // 11157

////PushInstruction("constant 0")
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=0 // 11161

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=36}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11162
D=A // 11163
@14 // 11164
M=D // 11165
@Output.create // 11166
D=A // 11167
@13 // 11168
M=D // 11169
@Output.initMap.ret.36 // 11170
D=A // 11171
@CALL // 11172
0;JMP // 11173
(Output.initMap.ret.36)

////PopInstruction{address=temp 0}
@SP // 11174
AM=M-1 // 11175
D=M // 11176
@5 // 11177
M=D // 11178

////PushInstruction("constant 67")
@67 // 11179
D=A // 11180
@SP // 11181
AM=M+1 // 11182
A=A-1 // 11183
M=D // 11184

////PushInstruction("constant 28")
@28 // 11185
D=A // 11186
@SP // 11187
AM=M+1 // 11188
A=A-1 // 11189
M=D // 11190

////PushInstruction("constant 54")
@54 // 11191
D=A // 11192
@SP // 11193
AM=M+1 // 11194
A=A-1 // 11195
M=D // 11196

////PushInstruction("constant 35")
@35 // 11197
D=A // 11198
@SP // 11199
AM=M+1 // 11200
A=A-1 // 11201
M=D // 11202

////PushInstruction("constant 3")
@3 // 11203
D=A // 11204
@SP // 11205
AM=M+1 // 11206
A=A-1 // 11207
M=D // 11208

////PushInstruction("constant 3")
@3 // 11209
D=A // 11210
@SP // 11211
AM=M+1 // 11212
A=A-1 // 11213
M=D // 11214

////PushInstruction("constant 3")
@3 // 11215
D=A // 11216
@SP // 11217
AM=M+1 // 11218
A=A-1 // 11219
M=D // 11220

////PushInstruction("constant 35")
@35 // 11221
D=A // 11222
@SP // 11223
AM=M+1 // 11224
A=A-1 // 11225
M=D // 11226

////PushInstruction("constant 54")
@54 // 11227
D=A // 11228
@SP // 11229
AM=M+1 // 11230
A=A-1 // 11231
M=D // 11232

////PushInstruction("constant 28")
@28 // 11233
D=A // 11234
@SP // 11235
AM=M+1 // 11236
A=A-1 // 11237
M=D // 11238

////PushInstruction("constant 0")
@SP // 11239
AM=M+1 // 11240
A=A-1 // 11241
M=0 // 11242

////PushInstruction("constant 0")
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=0 // 11246

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=37}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11247
D=A // 11248
@14 // 11249
M=D // 11250
@Output.create // 11251
D=A // 11252
@13 // 11253
M=D // 11254
@Output.initMap.ret.37 // 11255
D=A // 11256
@CALL // 11257
0;JMP // 11258
(Output.initMap.ret.37)

////PopInstruction{address=temp 0}
@SP // 11259
AM=M-1 // 11260
D=M // 11261
@5 // 11262
M=D // 11263

////PushInstruction("constant 68")
@68 // 11264
D=A // 11265
@SP // 11266
AM=M+1 // 11267
A=A-1 // 11268
M=D // 11269

////PushInstruction("constant 15")
@15 // 11270
D=A // 11271
@SP // 11272
AM=M+1 // 11273
A=A-1 // 11274
M=D // 11275

////PushInstruction("constant 27")
@27 // 11276
D=A // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=D // 11281

////PushInstruction("constant 51")
@51 // 11282
D=A // 11283
@SP // 11284
AM=M+1 // 11285
A=A-1 // 11286
M=D // 11287

////PushInstruction("constant 51")
@51 // 11288
D=A // 11289
@SP // 11290
AM=M+1 // 11291
A=A-1 // 11292
M=D // 11293

////PushInstruction("constant 51")
@51 // 11294
D=A // 11295
@SP // 11296
AM=M+1 // 11297
A=A-1 // 11298
M=D // 11299

////PushInstruction("constant 51")
@51 // 11300
D=A // 11301
@SP // 11302
AM=M+1 // 11303
A=A-1 // 11304
M=D // 11305

////PushInstruction("constant 51")
@51 // 11306
D=A // 11307
@SP // 11308
AM=M+1 // 11309
A=A-1 // 11310
M=D // 11311

////PushInstruction("constant 27")
@27 // 11312
D=A // 11313
@SP // 11314
AM=M+1 // 11315
A=A-1 // 11316
M=D // 11317

////PushInstruction("constant 15")
@15 // 11318
D=A // 11319
@SP // 11320
AM=M+1 // 11321
A=A-1 // 11322
M=D // 11323

////PushInstruction("constant 0")
@SP // 11324
AM=M+1 // 11325
A=A-1 // 11326
M=0 // 11327

////PushInstruction("constant 0")
@SP // 11328
AM=M+1 // 11329
A=A-1 // 11330
M=0 // 11331

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=38}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11332
D=A // 11333
@14 // 11334
M=D // 11335
@Output.create // 11336
D=A // 11337
@13 // 11338
M=D // 11339
@Output.initMap.ret.38 // 11340
D=A // 11341
@CALL // 11342
0;JMP // 11343
(Output.initMap.ret.38)

////PopInstruction{address=temp 0}
@SP // 11344
AM=M-1 // 11345
D=M // 11346
@5 // 11347
M=D // 11348

////PushInstruction("constant 69")
@69 // 11349
D=A // 11350
@SP // 11351
AM=M+1 // 11352
A=A-1 // 11353
M=D // 11354

////PushInstruction("constant 63")
@63 // 11355
D=A // 11356
@SP // 11357
AM=M+1 // 11358
A=A-1 // 11359
M=D // 11360

////PushInstruction("constant 51")
@51 // 11361
D=A // 11362
@SP // 11363
AM=M+1 // 11364
A=A-1 // 11365
M=D // 11366

////PushInstruction("constant 35")
@35 // 11367
D=A // 11368
@SP // 11369
AM=M+1 // 11370
A=A-1 // 11371
M=D // 11372

////PushInstruction("constant 11")
@11 // 11373
D=A // 11374
@SP // 11375
AM=M+1 // 11376
A=A-1 // 11377
M=D // 11378

////PushInstruction("constant 15")
@15 // 11379
D=A // 11380
@SP // 11381
AM=M+1 // 11382
A=A-1 // 11383
M=D // 11384

////PushInstruction("constant 11")
@11 // 11385
D=A // 11386
@SP // 11387
AM=M+1 // 11388
A=A-1 // 11389
M=D // 11390

////PushInstruction("constant 35")
@35 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396

////PushInstruction("constant 51")
@51 // 11397
D=A // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=D // 11402

////PushInstruction("constant 63")
@63 // 11403
D=A // 11404
@SP // 11405
AM=M+1 // 11406
A=A-1 // 11407
M=D // 11408

////PushInstruction("constant 0")
@SP // 11409
AM=M+1 // 11410
A=A-1 // 11411
M=0 // 11412

////PushInstruction("constant 0")
@SP // 11413
AM=M+1 // 11414
A=A-1 // 11415
M=0 // 11416

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=39}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11417
D=A // 11418
@14 // 11419
M=D // 11420
@Output.create // 11421
D=A // 11422
@13 // 11423
M=D // 11424
@Output.initMap.ret.39 // 11425
D=A // 11426
@CALL // 11427
0;JMP // 11428
(Output.initMap.ret.39)

////PopInstruction{address=temp 0}
@SP // 11429
AM=M-1 // 11430
D=M // 11431
@5 // 11432
M=D // 11433

////PushInstruction("constant 70")
@70 // 11434
D=A // 11435
@SP // 11436
AM=M+1 // 11437
A=A-1 // 11438
M=D // 11439

////PushInstruction("constant 63")
@63 // 11440
D=A // 11441
@SP // 11442
AM=M+1 // 11443
A=A-1 // 11444
M=D // 11445

////PushInstruction("constant 51")
@51 // 11446
D=A // 11447
@SP // 11448
AM=M+1 // 11449
A=A-1 // 11450
M=D // 11451

////PushInstruction("constant 35")
@35 // 11452
D=A // 11453
@SP // 11454
AM=M+1 // 11455
A=A-1 // 11456
M=D // 11457

////PushInstruction("constant 11")
@11 // 11458
D=A // 11459
@SP // 11460
AM=M+1 // 11461
A=A-1 // 11462
M=D // 11463

////PushInstruction("constant 15")
@15 // 11464
D=A // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=D // 11469

////PushInstruction("constant 11")
@11 // 11470
D=A // 11471
@SP // 11472
AM=M+1 // 11473
A=A-1 // 11474
M=D // 11475

////PushInstruction("constant 3")
@3 // 11476
D=A // 11477
@SP // 11478
AM=M+1 // 11479
A=A-1 // 11480
M=D // 11481

////PushInstruction("constant 3")
@3 // 11482
D=A // 11483
@SP // 11484
AM=M+1 // 11485
A=A-1 // 11486
M=D // 11487

////PushInstruction("constant 3")
@3 // 11488
D=A // 11489
@SP // 11490
AM=M+1 // 11491
A=A-1 // 11492
M=D // 11493

////PushInstruction("constant 0")
@SP // 11494
AM=M+1 // 11495
A=A-1 // 11496
M=0 // 11497

////PushInstruction("constant 0")
@SP // 11498
AM=M+1 // 11499
A=A-1 // 11500
M=0 // 11501

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=40}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11502
D=A // 11503
@14 // 11504
M=D // 11505
@Output.create // 11506
D=A // 11507
@13 // 11508
M=D // 11509
@Output.initMap.ret.40 // 11510
D=A // 11511
@CALL // 11512
0;JMP // 11513
(Output.initMap.ret.40)

////PopInstruction{address=temp 0}
@SP // 11514
AM=M-1 // 11515
D=M // 11516
@5 // 11517
M=D // 11518

////PushInstruction("constant 71")
@71 // 11519
D=A // 11520
@SP // 11521
AM=M+1 // 11522
A=A-1 // 11523
M=D // 11524

////PushInstruction("constant 28")
@28 // 11525
D=A // 11526
@SP // 11527
AM=M+1 // 11528
A=A-1 // 11529
M=D // 11530

////PushInstruction("constant 54")
@54 // 11531
D=A // 11532
@SP // 11533
AM=M+1 // 11534
A=A-1 // 11535
M=D // 11536

////PushInstruction("constant 35")
@35 // 11537
D=A // 11538
@SP // 11539
AM=M+1 // 11540
A=A-1 // 11541
M=D // 11542

////PushInstruction("constant 3")
@3 // 11543
D=A // 11544
@SP // 11545
AM=M+1 // 11546
A=A-1 // 11547
M=D // 11548

////PushInstruction("constant 59")
@59 // 11549
D=A // 11550
@SP // 11551
AM=M+1 // 11552
A=A-1 // 11553
M=D // 11554

////PushInstruction("constant 51")
@51 // 11555
D=A // 11556
@SP // 11557
AM=M+1 // 11558
A=A-1 // 11559
M=D // 11560

////PushInstruction("constant 51")
@51 // 11561
D=A // 11562
@SP // 11563
AM=M+1 // 11564
A=A-1 // 11565
M=D // 11566

////PushInstruction("constant 54")
@54 // 11567
D=A // 11568
@SP // 11569
AM=M+1 // 11570
A=A-1 // 11571
M=D // 11572

////PushInstruction("constant 44")
@44 // 11573
D=A // 11574
@SP // 11575
AM=M+1 // 11576
A=A-1 // 11577
M=D // 11578

////PushInstruction("constant 0")
@SP // 11579
AM=M+1 // 11580
A=A-1 // 11581
M=0 // 11582

////PushInstruction("constant 0")
@SP // 11583
AM=M+1 // 11584
A=A-1 // 11585
M=0 // 11586

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=41}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11587
D=A // 11588
@14 // 11589
M=D // 11590
@Output.create // 11591
D=A // 11592
@13 // 11593
M=D // 11594
@Output.initMap.ret.41 // 11595
D=A // 11596
@CALL // 11597
0;JMP // 11598
(Output.initMap.ret.41)

////PopInstruction{address=temp 0}
@SP // 11599
AM=M-1 // 11600
D=M // 11601
@5 // 11602
M=D // 11603

////PushInstruction("constant 72")
@72 // 11604
D=A // 11605
@SP // 11606
AM=M+1 // 11607
A=A-1 // 11608
M=D // 11609

////PushInstruction("constant 51")
@51 // 11610
D=A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615

////PushInstruction("constant 51")
@51 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621

////PushInstruction("constant 51")
@51 // 11622
D=A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627

////PushInstruction("constant 51")
@51 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633

////PushInstruction("constant 63")
@63 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639

////PushInstruction("constant 51")
@51 // 11640
D=A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645

////PushInstruction("constant 51")
@51 // 11646
D=A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651

////PushInstruction("constant 51")
@51 // 11652
D=A // 11653
@SP // 11654
AM=M+1 // 11655
A=A-1 // 11656
M=D // 11657

////PushInstruction("constant 51")
@51 // 11658
D=A // 11659
@SP // 11660
AM=M+1 // 11661
A=A-1 // 11662
M=D // 11663

////PushInstruction("constant 0")
@SP // 11664
AM=M+1 // 11665
A=A-1 // 11666
M=0 // 11667

////PushInstruction("constant 0")
@SP // 11668
AM=M+1 // 11669
A=A-1 // 11670
M=0 // 11671

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=42}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11672
D=A // 11673
@14 // 11674
M=D // 11675
@Output.create // 11676
D=A // 11677
@13 // 11678
M=D // 11679
@Output.initMap.ret.42 // 11680
D=A // 11681
@CALL // 11682
0;JMP // 11683
(Output.initMap.ret.42)

////PopInstruction{address=temp 0}
@SP // 11684
AM=M-1 // 11685
D=M // 11686
@5 // 11687
M=D // 11688

////PushInstruction("constant 73")
@73 // 11689
D=A // 11690
@SP // 11691
AM=M+1 // 11692
A=A-1 // 11693
M=D // 11694

////PushInstruction("constant 30")
@30 // 11695
D=A // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=D // 11700

////PushInstruction("constant 12")
@12 // 11701
D=A // 11702
@SP // 11703
AM=M+1 // 11704
A=A-1 // 11705
M=D // 11706

////PushInstruction("constant 12")
@12 // 11707
D=A // 11708
@SP // 11709
AM=M+1 // 11710
A=A-1 // 11711
M=D // 11712

////PushInstruction("constant 12")
@12 // 11713
D=A // 11714
@SP // 11715
AM=M+1 // 11716
A=A-1 // 11717
M=D // 11718

////PushInstruction("constant 12")
@12 // 11719
D=A // 11720
@SP // 11721
AM=M+1 // 11722
A=A-1 // 11723
M=D // 11724

////PushInstruction("constant 12")
@12 // 11725
D=A // 11726
@SP // 11727
AM=M+1 // 11728
A=A-1 // 11729
M=D // 11730

////PushInstruction("constant 12")
@12 // 11731
D=A // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=D // 11736

////PushInstruction("constant 12")
@12 // 11737
D=A // 11738
@SP // 11739
AM=M+1 // 11740
A=A-1 // 11741
M=D // 11742

////PushInstruction("constant 30")
@30 // 11743
D=A // 11744
@SP // 11745
AM=M+1 // 11746
A=A-1 // 11747
M=D // 11748

////PushInstruction("constant 0")
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=0 // 11752

////PushInstruction("constant 0")
@SP // 11753
AM=M+1 // 11754
A=A-1 // 11755
M=0 // 11756

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=43}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11757
D=A // 11758
@14 // 11759
M=D // 11760
@Output.create // 11761
D=A // 11762
@13 // 11763
M=D // 11764
@Output.initMap.ret.43 // 11765
D=A // 11766
@CALL // 11767
0;JMP // 11768
(Output.initMap.ret.43)

////PopInstruction{address=temp 0}
@SP // 11769
AM=M-1 // 11770
D=M // 11771
@5 // 11772
M=D // 11773

////PushInstruction("constant 74")
@74 // 11774
D=A // 11775
@SP // 11776
AM=M+1 // 11777
A=A-1 // 11778
M=D // 11779

////PushInstruction("constant 60")
@60 // 11780
D=A // 11781
@SP // 11782
AM=M+1 // 11783
A=A-1 // 11784
M=D // 11785

////PushInstruction("constant 24")
@24 // 11786
D=A // 11787
@SP // 11788
AM=M+1 // 11789
A=A-1 // 11790
M=D // 11791

////PushInstruction("constant 24")
@24 // 11792
D=A // 11793
@SP // 11794
AM=M+1 // 11795
A=A-1 // 11796
M=D // 11797

////PushInstruction("constant 24")
@24 // 11798
D=A // 11799
@SP // 11800
AM=M+1 // 11801
A=A-1 // 11802
M=D // 11803

////PushInstruction("constant 24")
@24 // 11804
D=A // 11805
@SP // 11806
AM=M+1 // 11807
A=A-1 // 11808
M=D // 11809

////PushInstruction("constant 24")
@24 // 11810
D=A // 11811
@SP // 11812
AM=M+1 // 11813
A=A-1 // 11814
M=D // 11815

////PushInstruction("constant 27")
@27 // 11816
D=A // 11817
@SP // 11818
AM=M+1 // 11819
A=A-1 // 11820
M=D // 11821

////PushInstruction("constant 27")
@27 // 11822
D=A // 11823
@SP // 11824
AM=M+1 // 11825
A=A-1 // 11826
M=D // 11827

////PushInstruction("constant 14")
@14 // 11828
D=A // 11829
@SP // 11830
AM=M+1 // 11831
A=A-1 // 11832
M=D // 11833

////PushInstruction("constant 0")
@SP // 11834
AM=M+1 // 11835
A=A-1 // 11836
M=0 // 11837

////PushInstruction("constant 0")
@SP // 11838
AM=M+1 // 11839
A=A-1 // 11840
M=0 // 11841

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=44}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11842
D=A // 11843
@14 // 11844
M=D // 11845
@Output.create // 11846
D=A // 11847
@13 // 11848
M=D // 11849
@Output.initMap.ret.44 // 11850
D=A // 11851
@CALL // 11852
0;JMP // 11853
(Output.initMap.ret.44)

////PopInstruction{address=temp 0}
@SP // 11854
AM=M-1 // 11855
D=M // 11856
@5 // 11857
M=D // 11858

////PushInstruction("constant 75")
@75 // 11859
D=A // 11860
@SP // 11861
AM=M+1 // 11862
A=A-1 // 11863
M=D // 11864

////PushInstruction("constant 51")
@51 // 11865
D=A // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=D // 11870

////PushInstruction("constant 51")
@51 // 11871
D=A // 11872
@SP // 11873
AM=M+1 // 11874
A=A-1 // 11875
M=D // 11876

////PushInstruction("constant 51")
@51 // 11877
D=A // 11878
@SP // 11879
AM=M+1 // 11880
A=A-1 // 11881
M=D // 11882

////PushInstruction("constant 27")
@27 // 11883
D=A // 11884
@SP // 11885
AM=M+1 // 11886
A=A-1 // 11887
M=D // 11888

////PushInstruction("constant 15")
@15 // 11889
D=A // 11890
@SP // 11891
AM=M+1 // 11892
A=A-1 // 11893
M=D // 11894

////PushInstruction("constant 27")
@27 // 11895
D=A // 11896
@SP // 11897
AM=M+1 // 11898
A=A-1 // 11899
M=D // 11900

////PushInstruction("constant 51")
@51 // 11901
D=A // 11902
@SP // 11903
AM=M+1 // 11904
A=A-1 // 11905
M=D // 11906

////PushInstruction("constant 51")
@51 // 11907
D=A // 11908
@SP // 11909
AM=M+1 // 11910
A=A-1 // 11911
M=D // 11912

////PushInstruction("constant 51")
@51 // 11913
D=A // 11914
@SP // 11915
AM=M+1 // 11916
A=A-1 // 11917
M=D // 11918

////PushInstruction("constant 0")
@SP // 11919
AM=M+1 // 11920
A=A-1 // 11921
M=0 // 11922

////PushInstruction("constant 0")
@SP // 11923
AM=M+1 // 11924
A=A-1 // 11925
M=0 // 11926

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=45}, currentFunction='Output.initMap'}
// call Output.create
@17 // 11927
D=A // 11928
@14 // 11929
M=D // 11930
@Output.create // 11931
D=A // 11932
@13 // 11933
M=D // 11934
@Output.initMap.ret.45 // 11935
D=A // 11936
@CALL // 11937
0;JMP // 11938
(Output.initMap.ret.45)

////PopInstruction{address=temp 0}
@SP // 11939
AM=M-1 // 11940
D=M // 11941
@5 // 11942
M=D // 11943

////PushInstruction("constant 76")
@76 // 11944
D=A // 11945
@SP // 11946
AM=M+1 // 11947
A=A-1 // 11948
M=D // 11949

////PushInstruction("constant 3")
@3 // 11950
D=A // 11951
@SP // 11952
AM=M+1 // 11953
A=A-1 // 11954
M=D // 11955

////PushInstruction("constant 3")
@3 // 11956
D=A // 11957
@SP // 11958
AM=M+1 // 11959
A=A-1 // 11960
M=D // 11961

////PushInstruction("constant 3")
@3 // 11962
D=A // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=D // 11967

////PushInstruction("constant 3")
@3 // 11968
D=A // 11969
@SP // 11970
AM=M+1 // 11971
A=A-1 // 11972
M=D // 11973

////PushInstruction("constant 3")
@3 // 11974
D=A // 11975
@SP // 11976
AM=M+1 // 11977
A=A-1 // 11978
M=D // 11979

////PushInstruction("constant 3")
@3 // 11980
D=A // 11981
@SP // 11982
AM=M+1 // 11983
A=A-1 // 11984
M=D // 11985

////PushInstruction("constant 35")
@35 // 11986
D=A // 11987
@SP // 11988
AM=M+1 // 11989
A=A-1 // 11990
M=D // 11991

////PushInstruction("constant 51")
@51 // 11992
D=A // 11993
@SP // 11994
AM=M+1 // 11995
A=A-1 // 11996
M=D // 11997

////PushInstruction("constant 63")
@63 // 11998
D=A // 11999
@SP // 12000
AM=M+1 // 12001
A=A-1 // 12002
M=D // 12003

////PushInstruction("constant 0")
@SP // 12004
AM=M+1 // 12005
A=A-1 // 12006
M=0 // 12007

////PushInstruction("constant 0")
@SP // 12008
AM=M+1 // 12009
A=A-1 // 12010
M=0 // 12011

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=46}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12012
D=A // 12013
@14 // 12014
M=D // 12015
@Output.create // 12016
D=A // 12017
@13 // 12018
M=D // 12019
@Output.initMap.ret.46 // 12020
D=A // 12021
@CALL // 12022
0;JMP // 12023
(Output.initMap.ret.46)

////PopInstruction{address=temp 0}
@SP // 12024
AM=M-1 // 12025
D=M // 12026
@5 // 12027
M=D // 12028

////PushInstruction("constant 77")
@77 // 12029
D=A // 12030
@SP // 12031
AM=M+1 // 12032
A=A-1 // 12033
M=D // 12034

////PushInstruction("constant 33")
@33 // 12035
D=A // 12036
@SP // 12037
AM=M+1 // 12038
A=A-1 // 12039
M=D // 12040

////PushInstruction("constant 51")
@51 // 12041
D=A // 12042
@SP // 12043
AM=M+1 // 12044
A=A-1 // 12045
M=D // 12046

////PushInstruction("constant 63")
@63 // 12047
D=A // 12048
@SP // 12049
AM=M+1 // 12050
A=A-1 // 12051
M=D // 12052

////PushInstruction("constant 63")
@63 // 12053
D=A // 12054
@SP // 12055
AM=M+1 // 12056
A=A-1 // 12057
M=D // 12058

////PushInstruction("constant 51")
@51 // 12059
D=A // 12060
@SP // 12061
AM=M+1 // 12062
A=A-1 // 12063
M=D // 12064

////PushInstruction("constant 51")
@51 // 12065
D=A // 12066
@SP // 12067
AM=M+1 // 12068
A=A-1 // 12069
M=D // 12070

////PushInstruction("constant 51")
@51 // 12071
D=A // 12072
@SP // 12073
AM=M+1 // 12074
A=A-1 // 12075
M=D // 12076

////PushInstruction("constant 51")
@51 // 12077
D=A // 12078
@SP // 12079
AM=M+1 // 12080
A=A-1 // 12081
M=D // 12082

////PushInstruction("constant 51")
@51 // 12083
D=A // 12084
@SP // 12085
AM=M+1 // 12086
A=A-1 // 12087
M=D // 12088

////PushInstruction("constant 0")
@SP // 12089
AM=M+1 // 12090
A=A-1 // 12091
M=0 // 12092

////PushInstruction("constant 0")
@SP // 12093
AM=M+1 // 12094
A=A-1 // 12095
M=0 // 12096

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=47}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12097
D=A // 12098
@14 // 12099
M=D // 12100
@Output.create // 12101
D=A // 12102
@13 // 12103
M=D // 12104
@Output.initMap.ret.47 // 12105
D=A // 12106
@CALL // 12107
0;JMP // 12108
(Output.initMap.ret.47)

////PopInstruction{address=temp 0}
@SP // 12109
AM=M-1 // 12110
D=M // 12111
@5 // 12112
M=D // 12113

////PushInstruction("constant 78")
@78 // 12114
D=A // 12115
@SP // 12116
AM=M+1 // 12117
A=A-1 // 12118
M=D // 12119

////PushInstruction("constant 51")
@51 // 12120
D=A // 12121
@SP // 12122
AM=M+1 // 12123
A=A-1 // 12124
M=D // 12125

////PushInstruction("constant 51")
@51 // 12126
D=A // 12127
@SP // 12128
AM=M+1 // 12129
A=A-1 // 12130
M=D // 12131

////PushInstruction("constant 55")
@55 // 12132
D=A // 12133
@SP // 12134
AM=M+1 // 12135
A=A-1 // 12136
M=D // 12137

////PushInstruction("constant 55")
@55 // 12138
D=A // 12139
@SP // 12140
AM=M+1 // 12141
A=A-1 // 12142
M=D // 12143

////PushInstruction("constant 63")
@63 // 12144
D=A // 12145
@SP // 12146
AM=M+1 // 12147
A=A-1 // 12148
M=D // 12149

////PushInstruction("constant 59")
@59 // 12150
D=A // 12151
@SP // 12152
AM=M+1 // 12153
A=A-1 // 12154
M=D // 12155

////PushInstruction("constant 59")
@59 // 12156
D=A // 12157
@SP // 12158
AM=M+1 // 12159
A=A-1 // 12160
M=D // 12161

////PushInstruction("constant 51")
@51 // 12162
D=A // 12163
@SP // 12164
AM=M+1 // 12165
A=A-1 // 12166
M=D // 12167

////PushInstruction("constant 51")
@51 // 12168
D=A // 12169
@SP // 12170
AM=M+1 // 12171
A=A-1 // 12172
M=D // 12173

////PushInstruction("constant 0")
@SP // 12174
AM=M+1 // 12175
A=A-1 // 12176
M=0 // 12177

////PushInstruction("constant 0")
@SP // 12178
AM=M+1 // 12179
A=A-1 // 12180
M=0 // 12181

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=48}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12182
D=A // 12183
@14 // 12184
M=D // 12185
@Output.create // 12186
D=A // 12187
@13 // 12188
M=D // 12189
@Output.initMap.ret.48 // 12190
D=A // 12191
@CALL // 12192
0;JMP // 12193
(Output.initMap.ret.48)

////PopInstruction{address=temp 0}
@SP // 12194
AM=M-1 // 12195
D=M // 12196
@5 // 12197
M=D // 12198

////PushInstruction("constant 79")
@79 // 12199
D=A // 12200
@SP // 12201
AM=M+1 // 12202
A=A-1 // 12203
M=D // 12204

////PushInstruction("constant 30")
@30 // 12205
D=A // 12206
@SP // 12207
AM=M+1 // 12208
A=A-1 // 12209
M=D // 12210

////PushInstruction("constant 51")
@51 // 12211
D=A // 12212
@SP // 12213
AM=M+1 // 12214
A=A-1 // 12215
M=D // 12216

////PushInstruction("constant 51")
@51 // 12217
D=A // 12218
@SP // 12219
AM=M+1 // 12220
A=A-1 // 12221
M=D // 12222

////PushInstruction("constant 51")
@51 // 12223
D=A // 12224
@SP // 12225
AM=M+1 // 12226
A=A-1 // 12227
M=D // 12228

////PushInstruction("constant 51")
@51 // 12229
D=A // 12230
@SP // 12231
AM=M+1 // 12232
A=A-1 // 12233
M=D // 12234

////PushInstruction("constant 51")
@51 // 12235
D=A // 12236
@SP // 12237
AM=M+1 // 12238
A=A-1 // 12239
M=D // 12240

////PushInstruction("constant 51")
@51 // 12241
D=A // 12242
@SP // 12243
AM=M+1 // 12244
A=A-1 // 12245
M=D // 12246

////PushInstruction("constant 51")
@51 // 12247
D=A // 12248
@SP // 12249
AM=M+1 // 12250
A=A-1 // 12251
M=D // 12252

////PushInstruction("constant 30")
@30 // 12253
D=A // 12254
@SP // 12255
AM=M+1 // 12256
A=A-1 // 12257
M=D // 12258

////PushInstruction("constant 0")
@SP // 12259
AM=M+1 // 12260
A=A-1 // 12261
M=0 // 12262

////PushInstruction("constant 0")
@SP // 12263
AM=M+1 // 12264
A=A-1 // 12265
M=0 // 12266

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=49}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12267
D=A // 12268
@14 // 12269
M=D // 12270
@Output.create // 12271
D=A // 12272
@13 // 12273
M=D // 12274
@Output.initMap.ret.49 // 12275
D=A // 12276
@CALL // 12277
0;JMP // 12278
(Output.initMap.ret.49)

////PopInstruction{address=temp 0}
@SP // 12279
AM=M-1 // 12280
D=M // 12281
@5 // 12282
M=D // 12283

////PushInstruction("constant 80")
@80 // 12284
D=A // 12285
@SP // 12286
AM=M+1 // 12287
A=A-1 // 12288
M=D // 12289

////PushInstruction("constant 31")
@31 // 12290
D=A // 12291
@SP // 12292
AM=M+1 // 12293
A=A-1 // 12294
M=D // 12295

////PushInstruction("constant 51")
@51 // 12296
D=A // 12297
@SP // 12298
AM=M+1 // 12299
A=A-1 // 12300
M=D // 12301

////PushInstruction("constant 51")
@51 // 12302
D=A // 12303
@SP // 12304
AM=M+1 // 12305
A=A-1 // 12306
M=D // 12307

////PushInstruction("constant 51")
@51 // 12308
D=A // 12309
@SP // 12310
AM=M+1 // 12311
A=A-1 // 12312
M=D // 12313

////PushInstruction("constant 31")
@31 // 12314
D=A // 12315
@SP // 12316
AM=M+1 // 12317
A=A-1 // 12318
M=D // 12319

////PushInstruction("constant 3")
@3 // 12320
D=A // 12321
@SP // 12322
AM=M+1 // 12323
A=A-1 // 12324
M=D // 12325

////PushInstruction("constant 3")
@3 // 12326
D=A // 12327
@SP // 12328
AM=M+1 // 12329
A=A-1 // 12330
M=D // 12331

////PushInstruction("constant 3")
@3 // 12332
D=A // 12333
@SP // 12334
AM=M+1 // 12335
A=A-1 // 12336
M=D // 12337

////PushInstruction("constant 3")
@3 // 12338
D=A // 12339
@SP // 12340
AM=M+1 // 12341
A=A-1 // 12342
M=D // 12343

////PushInstruction("constant 0")
@SP // 12344
AM=M+1 // 12345
A=A-1 // 12346
M=0 // 12347

////PushInstruction("constant 0")
@SP // 12348
AM=M+1 // 12349
A=A-1 // 12350
M=0 // 12351

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=50}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12352
D=A // 12353
@14 // 12354
M=D // 12355
@Output.create // 12356
D=A // 12357
@13 // 12358
M=D // 12359
@Output.initMap.ret.50 // 12360
D=A // 12361
@CALL // 12362
0;JMP // 12363
(Output.initMap.ret.50)

////PopInstruction{address=temp 0}
@SP // 12364
AM=M-1 // 12365
D=M // 12366
@5 // 12367
M=D // 12368

////PushInstruction("constant 81")
@81 // 12369
D=A // 12370
@SP // 12371
AM=M+1 // 12372
A=A-1 // 12373
M=D // 12374

////PushInstruction("constant 30")
@30 // 12375
D=A // 12376
@SP // 12377
AM=M+1 // 12378
A=A-1 // 12379
M=D // 12380

////PushInstruction("constant 51")
@51 // 12381
D=A // 12382
@SP // 12383
AM=M+1 // 12384
A=A-1 // 12385
M=D // 12386

////PushInstruction("constant 51")
@51 // 12387
D=A // 12388
@SP // 12389
AM=M+1 // 12390
A=A-1 // 12391
M=D // 12392

////PushInstruction("constant 51")
@51 // 12393
D=A // 12394
@SP // 12395
AM=M+1 // 12396
A=A-1 // 12397
M=D // 12398

////PushInstruction("constant 51")
@51 // 12399
D=A // 12400
@SP // 12401
AM=M+1 // 12402
A=A-1 // 12403
M=D // 12404

////PushInstruction("constant 51")
@51 // 12405
D=A // 12406
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=D // 12410

////PushInstruction("constant 63")
@63 // 12411
D=A // 12412
@SP // 12413
AM=M+1 // 12414
A=A-1 // 12415
M=D // 12416

////PushInstruction("constant 59")
@59 // 12417
D=A // 12418
@SP // 12419
AM=M+1 // 12420
A=A-1 // 12421
M=D // 12422

////PushInstruction("constant 30")
@30 // 12423
D=A // 12424
@SP // 12425
AM=M+1 // 12426
A=A-1 // 12427
M=D // 12428

////PushInstruction("constant 48")
@48 // 12429
D=A // 12430
@SP // 12431
AM=M+1 // 12432
A=A-1 // 12433
M=D // 12434

////PushInstruction("constant 0")
@SP // 12435
AM=M+1 // 12436
A=A-1 // 12437
M=0 // 12438

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=51}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12439
D=A // 12440
@14 // 12441
M=D // 12442
@Output.create // 12443
D=A // 12444
@13 // 12445
M=D // 12446
@Output.initMap.ret.51 // 12447
D=A // 12448
@CALL // 12449
0;JMP // 12450
(Output.initMap.ret.51)

////PopInstruction{address=temp 0}
@SP // 12451
AM=M-1 // 12452
D=M // 12453
@5 // 12454
M=D // 12455

////PushInstruction("constant 82")
@82 // 12456
D=A // 12457
@SP // 12458
AM=M+1 // 12459
A=A-1 // 12460
M=D // 12461

////PushInstruction("constant 31")
@31 // 12462
D=A // 12463
@SP // 12464
AM=M+1 // 12465
A=A-1 // 12466
M=D // 12467

////PushInstruction("constant 51")
@51 // 12468
D=A // 12469
@SP // 12470
AM=M+1 // 12471
A=A-1 // 12472
M=D // 12473

////PushInstruction("constant 51")
@51 // 12474
D=A // 12475
@SP // 12476
AM=M+1 // 12477
A=A-1 // 12478
M=D // 12479

////PushInstruction("constant 51")
@51 // 12480
D=A // 12481
@SP // 12482
AM=M+1 // 12483
A=A-1 // 12484
M=D // 12485

////PushInstruction("constant 31")
@31 // 12486
D=A // 12487
@SP // 12488
AM=M+1 // 12489
A=A-1 // 12490
M=D // 12491

////PushInstruction("constant 27")
@27 // 12492
D=A // 12493
@SP // 12494
AM=M+1 // 12495
A=A-1 // 12496
M=D // 12497

////PushInstruction("constant 51")
@51 // 12498
D=A // 12499
@SP // 12500
AM=M+1 // 12501
A=A-1 // 12502
M=D // 12503

////PushInstruction("constant 51")
@51 // 12504
D=A // 12505
@SP // 12506
AM=M+1 // 12507
A=A-1 // 12508
M=D // 12509

////PushInstruction("constant 51")
@51 // 12510
D=A // 12511
@SP // 12512
AM=M+1 // 12513
A=A-1 // 12514
M=D // 12515

////PushInstruction("constant 0")
@SP // 12516
AM=M+1 // 12517
A=A-1 // 12518
M=0 // 12519

////PushInstruction("constant 0")
@SP // 12520
AM=M+1 // 12521
A=A-1 // 12522
M=0 // 12523

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=52}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12524
D=A // 12525
@14 // 12526
M=D // 12527
@Output.create // 12528
D=A // 12529
@13 // 12530
M=D // 12531
@Output.initMap.ret.52 // 12532
D=A // 12533
@CALL // 12534
0;JMP // 12535
(Output.initMap.ret.52)

////PopInstruction{address=temp 0}
@SP // 12536
AM=M-1 // 12537
D=M // 12538
@5 // 12539
M=D // 12540

////PushInstruction("constant 83")
@83 // 12541
D=A // 12542
@SP // 12543
AM=M+1 // 12544
A=A-1 // 12545
M=D // 12546

////PushInstruction("constant 30")
@30 // 12547
D=A // 12548
@SP // 12549
AM=M+1 // 12550
A=A-1 // 12551
M=D // 12552

////PushInstruction("constant 51")
@51 // 12553
D=A // 12554
@SP // 12555
AM=M+1 // 12556
A=A-1 // 12557
M=D // 12558

////PushInstruction("constant 51")
@51 // 12559
D=A // 12560
@SP // 12561
AM=M+1 // 12562
A=A-1 // 12563
M=D // 12564

////PushInstruction("constant 6")
@6 // 12565
D=A // 12566
@SP // 12567
AM=M+1 // 12568
A=A-1 // 12569
M=D // 12570

////PushInstruction("constant 28")
@28 // 12571
D=A // 12572
@SP // 12573
AM=M+1 // 12574
A=A-1 // 12575
M=D // 12576

////PushInstruction("constant 48")
@48 // 12577
D=A // 12578
@SP // 12579
AM=M+1 // 12580
A=A-1 // 12581
M=D // 12582

////PushInstruction("constant 51")
@51 // 12583
D=A // 12584
@SP // 12585
AM=M+1 // 12586
A=A-1 // 12587
M=D // 12588

////PushInstruction("constant 51")
@51 // 12589
D=A // 12590
@SP // 12591
AM=M+1 // 12592
A=A-1 // 12593
M=D // 12594

////PushInstruction("constant 30")
@30 // 12595
D=A // 12596
@SP // 12597
AM=M+1 // 12598
A=A-1 // 12599
M=D // 12600

////PushInstruction("constant 0")
@SP // 12601
AM=M+1 // 12602
A=A-1 // 12603
M=0 // 12604

////PushInstruction("constant 0")
@SP // 12605
AM=M+1 // 12606
A=A-1 // 12607
M=0 // 12608

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=53}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12609
D=A // 12610
@14 // 12611
M=D // 12612
@Output.create // 12613
D=A // 12614
@13 // 12615
M=D // 12616
@Output.initMap.ret.53 // 12617
D=A // 12618
@CALL // 12619
0;JMP // 12620
(Output.initMap.ret.53)

////PopInstruction{address=temp 0}
@SP // 12621
AM=M-1 // 12622
D=M // 12623
@5 // 12624
M=D // 12625

////PushInstruction("constant 84")
@84 // 12626
D=A // 12627
@SP // 12628
AM=M+1 // 12629
A=A-1 // 12630
M=D // 12631

////PushInstruction("constant 63")
@63 // 12632
D=A // 12633
@SP // 12634
AM=M+1 // 12635
A=A-1 // 12636
M=D // 12637

////PushInstruction("constant 63")
@63 // 12638
D=A // 12639
@SP // 12640
AM=M+1 // 12641
A=A-1 // 12642
M=D // 12643

////PushInstruction("constant 45")
@45 // 12644
D=A // 12645
@SP // 12646
AM=M+1 // 12647
A=A-1 // 12648
M=D // 12649

////PushInstruction("constant 12")
@12 // 12650
D=A // 12651
@SP // 12652
AM=M+1 // 12653
A=A-1 // 12654
M=D // 12655

////PushInstruction("constant 12")
@12 // 12656
D=A // 12657
@SP // 12658
AM=M+1 // 12659
A=A-1 // 12660
M=D // 12661

////PushInstruction("constant 12")
@12 // 12662
D=A // 12663
@SP // 12664
AM=M+1 // 12665
A=A-1 // 12666
M=D // 12667

////PushInstruction("constant 12")
@12 // 12668
D=A // 12669
@SP // 12670
AM=M+1 // 12671
A=A-1 // 12672
M=D // 12673

////PushInstruction("constant 12")
@12 // 12674
D=A // 12675
@SP // 12676
AM=M+1 // 12677
A=A-1 // 12678
M=D // 12679

////PushInstruction("constant 30")
@30 // 12680
D=A // 12681
@SP // 12682
AM=M+1 // 12683
A=A-1 // 12684
M=D // 12685

////PushInstruction("constant 0")
@SP // 12686
AM=M+1 // 12687
A=A-1 // 12688
M=0 // 12689

////PushInstruction("constant 0")
@SP // 12690
AM=M+1 // 12691
A=A-1 // 12692
M=0 // 12693

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=54}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12694
D=A // 12695
@14 // 12696
M=D // 12697
@Output.create // 12698
D=A // 12699
@13 // 12700
M=D // 12701
@Output.initMap.ret.54 // 12702
D=A // 12703
@CALL // 12704
0;JMP // 12705
(Output.initMap.ret.54)

////PopInstruction{address=temp 0}
@SP // 12706
AM=M-1 // 12707
D=M // 12708
@5 // 12709
M=D // 12710

////PushInstruction("constant 85")
@85 // 12711
D=A // 12712
@SP // 12713
AM=M+1 // 12714
A=A-1 // 12715
M=D // 12716

////PushInstruction("constant 51")
@51 // 12717
D=A // 12718
@SP // 12719
AM=M+1 // 12720
A=A-1 // 12721
M=D // 12722

////PushInstruction("constant 51")
@51 // 12723
D=A // 12724
@SP // 12725
AM=M+1 // 12726
A=A-1 // 12727
M=D // 12728

////PushInstruction("constant 51")
@51 // 12729
D=A // 12730
@SP // 12731
AM=M+1 // 12732
A=A-1 // 12733
M=D // 12734

////PushInstruction("constant 51")
@51 // 12735
D=A // 12736
@SP // 12737
AM=M+1 // 12738
A=A-1 // 12739
M=D // 12740

////PushInstruction("constant 51")
@51 // 12741
D=A // 12742
@SP // 12743
AM=M+1 // 12744
A=A-1 // 12745
M=D // 12746

////PushInstruction("constant 51")
@51 // 12747
D=A // 12748
@SP // 12749
AM=M+1 // 12750
A=A-1 // 12751
M=D // 12752

////PushInstruction("constant 51")
@51 // 12753
D=A // 12754
@SP // 12755
AM=M+1 // 12756
A=A-1 // 12757
M=D // 12758

////PushInstruction("constant 51")
@51 // 12759
D=A // 12760
@SP // 12761
AM=M+1 // 12762
A=A-1 // 12763
M=D // 12764

////PushInstruction("constant 30")
@30 // 12765
D=A // 12766
@SP // 12767
AM=M+1 // 12768
A=A-1 // 12769
M=D // 12770

////PushInstruction("constant 0")
@SP // 12771
AM=M+1 // 12772
A=A-1 // 12773
M=0 // 12774

////PushInstruction("constant 0")
@SP // 12775
AM=M+1 // 12776
A=A-1 // 12777
M=0 // 12778

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=55}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12779
D=A // 12780
@14 // 12781
M=D // 12782
@Output.create // 12783
D=A // 12784
@13 // 12785
M=D // 12786
@Output.initMap.ret.55 // 12787
D=A // 12788
@CALL // 12789
0;JMP // 12790
(Output.initMap.ret.55)

////PopInstruction{address=temp 0}
@SP // 12791
AM=M-1 // 12792
D=M // 12793
@5 // 12794
M=D // 12795

////PushInstruction("constant 86")
@86 // 12796
D=A // 12797
@SP // 12798
AM=M+1 // 12799
A=A-1 // 12800
M=D // 12801

////PushInstruction("constant 51")
@51 // 12802
D=A // 12803
@SP // 12804
AM=M+1 // 12805
A=A-1 // 12806
M=D // 12807

////PushInstruction("constant 51")
@51 // 12808
D=A // 12809
@SP // 12810
AM=M+1 // 12811
A=A-1 // 12812
M=D // 12813

////PushInstruction("constant 51")
@51 // 12814
D=A // 12815
@SP // 12816
AM=M+1 // 12817
A=A-1 // 12818
M=D // 12819

////PushInstruction("constant 51")
@51 // 12820
D=A // 12821
@SP // 12822
AM=M+1 // 12823
A=A-1 // 12824
M=D // 12825

////PushInstruction("constant 51")
@51 // 12826
D=A // 12827
@SP // 12828
AM=M+1 // 12829
A=A-1 // 12830
M=D // 12831

////PushInstruction("constant 30")
@30 // 12832
D=A // 12833
@SP // 12834
AM=M+1 // 12835
A=A-1 // 12836
M=D // 12837

////PushInstruction("constant 30")
@30 // 12838
D=A // 12839
@SP // 12840
AM=M+1 // 12841
A=A-1 // 12842
M=D // 12843

////PushInstruction("constant 12")
@12 // 12844
D=A // 12845
@SP // 12846
AM=M+1 // 12847
A=A-1 // 12848
M=D // 12849

////PushInstruction("constant 12")
@12 // 12850
D=A // 12851
@SP // 12852
AM=M+1 // 12853
A=A-1 // 12854
M=D // 12855

////PushInstruction("constant 0")
@SP // 12856
AM=M+1 // 12857
A=A-1 // 12858
M=0 // 12859

////PushInstruction("constant 0")
@SP // 12860
AM=M+1 // 12861
A=A-1 // 12862
M=0 // 12863

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=56}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12864
D=A // 12865
@14 // 12866
M=D // 12867
@Output.create // 12868
D=A // 12869
@13 // 12870
M=D // 12871
@Output.initMap.ret.56 // 12872
D=A // 12873
@CALL // 12874
0;JMP // 12875
(Output.initMap.ret.56)

////PopInstruction{address=temp 0}
@SP // 12876
AM=M-1 // 12877
D=M // 12878
@5 // 12879
M=D // 12880

////PushInstruction("constant 87")
@87 // 12881
D=A // 12882
@SP // 12883
AM=M+1 // 12884
A=A-1 // 12885
M=D // 12886

////PushInstruction("constant 51")
@51 // 12887
D=A // 12888
@SP // 12889
AM=M+1 // 12890
A=A-1 // 12891
M=D // 12892

////PushInstruction("constant 51")
@51 // 12893
D=A // 12894
@SP // 12895
AM=M+1 // 12896
A=A-1 // 12897
M=D // 12898

////PushInstruction("constant 51")
@51 // 12899
D=A // 12900
@SP // 12901
AM=M+1 // 12902
A=A-1 // 12903
M=D // 12904

////PushInstruction("constant 51")
@51 // 12905
D=A // 12906
@SP // 12907
AM=M+1 // 12908
A=A-1 // 12909
M=D // 12910

////PushInstruction("constant 51")
@51 // 12911
D=A // 12912
@SP // 12913
AM=M+1 // 12914
A=A-1 // 12915
M=D // 12916

////PushInstruction("constant 63")
@63 // 12917
D=A // 12918
@SP // 12919
AM=M+1 // 12920
A=A-1 // 12921
M=D // 12922

////PushInstruction("constant 63")
@63 // 12923
D=A // 12924
@SP // 12925
AM=M+1 // 12926
A=A-1 // 12927
M=D // 12928

////PushInstruction("constant 63")
@63 // 12929
D=A // 12930
@SP // 12931
AM=M+1 // 12932
A=A-1 // 12933
M=D // 12934

////PushInstruction("constant 18")
@18 // 12935
D=A // 12936
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=D // 12940

////PushInstruction("constant 0")
@SP // 12941
AM=M+1 // 12942
A=A-1 // 12943
M=0 // 12944

////PushInstruction("constant 0")
@SP // 12945
AM=M+1 // 12946
A=A-1 // 12947
M=0 // 12948

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=57}, currentFunction='Output.initMap'}
// call Output.create
@17 // 12949
D=A // 12950
@14 // 12951
M=D // 12952
@Output.create // 12953
D=A // 12954
@13 // 12955
M=D // 12956
@Output.initMap.ret.57 // 12957
D=A // 12958
@CALL // 12959
0;JMP // 12960
(Output.initMap.ret.57)

////PopInstruction{address=temp 0}
@SP // 12961
AM=M-1 // 12962
D=M // 12963
@5 // 12964
M=D // 12965

////PushInstruction("constant 88")
@88 // 12966
D=A // 12967
@SP // 12968
AM=M+1 // 12969
A=A-1 // 12970
M=D // 12971

////PushInstruction("constant 51")
@51 // 12972
D=A // 12973
@SP // 12974
AM=M+1 // 12975
A=A-1 // 12976
M=D // 12977

////PushInstruction("constant 51")
@51 // 12978
D=A // 12979
@SP // 12980
AM=M+1 // 12981
A=A-1 // 12982
M=D // 12983

////PushInstruction("constant 30")
@30 // 12984
D=A // 12985
@SP // 12986
AM=M+1 // 12987
A=A-1 // 12988
M=D // 12989

////PushInstruction("constant 30")
@30 // 12990
D=A // 12991
@SP // 12992
AM=M+1 // 12993
A=A-1 // 12994
M=D // 12995

////PushInstruction("constant 12")
@12 // 12996
D=A // 12997
@SP // 12998
AM=M+1 // 12999
A=A-1 // 13000
M=D // 13001

////PushInstruction("constant 30")
@30 // 13002
D=A // 13003
@SP // 13004
AM=M+1 // 13005
A=A-1 // 13006
M=D // 13007

////PushInstruction("constant 30")
@30 // 13008
D=A // 13009
@SP // 13010
AM=M+1 // 13011
A=A-1 // 13012
M=D // 13013

////PushInstruction("constant 51")
@51 // 13014
D=A // 13015
@SP // 13016
AM=M+1 // 13017
A=A-1 // 13018
M=D // 13019

////PushInstruction("constant 51")
@51 // 13020
D=A // 13021
@SP // 13022
AM=M+1 // 13023
A=A-1 // 13024
M=D // 13025

////PushInstruction("constant 0")
@SP // 13026
AM=M+1 // 13027
A=A-1 // 13028
M=0 // 13029

////PushInstruction("constant 0")
@SP // 13030
AM=M+1 // 13031
A=A-1 // 13032
M=0 // 13033

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=58}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13034
D=A // 13035
@14 // 13036
M=D // 13037
@Output.create // 13038
D=A // 13039
@13 // 13040
M=D // 13041
@Output.initMap.ret.58 // 13042
D=A // 13043
@CALL // 13044
0;JMP // 13045
(Output.initMap.ret.58)

////PopInstruction{address=temp 0}
@SP // 13046
AM=M-1 // 13047
D=M // 13048
@5 // 13049
M=D // 13050

////PushInstruction("constant 89")
@89 // 13051
D=A // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=D // 13056

////PushInstruction("constant 51")
@51 // 13057
D=A // 13058
@SP // 13059
AM=M+1 // 13060
A=A-1 // 13061
M=D // 13062

////PushInstruction("constant 51")
@51 // 13063
D=A // 13064
@SP // 13065
AM=M+1 // 13066
A=A-1 // 13067
M=D // 13068

////PushInstruction("constant 51")
@51 // 13069
D=A // 13070
@SP // 13071
AM=M+1 // 13072
A=A-1 // 13073
M=D // 13074

////PushInstruction("constant 51")
@51 // 13075
D=A // 13076
@SP // 13077
AM=M+1 // 13078
A=A-1 // 13079
M=D // 13080

////PushInstruction("constant 30")
@30 // 13081
D=A // 13082
@SP // 13083
AM=M+1 // 13084
A=A-1 // 13085
M=D // 13086

////PushInstruction("constant 12")
@12 // 13087
D=A // 13088
@SP // 13089
AM=M+1 // 13090
A=A-1 // 13091
M=D // 13092

////PushInstruction("constant 12")
@12 // 13093
D=A // 13094
@SP // 13095
AM=M+1 // 13096
A=A-1 // 13097
M=D // 13098

////PushInstruction("constant 12")
@12 // 13099
D=A // 13100
@SP // 13101
AM=M+1 // 13102
A=A-1 // 13103
M=D // 13104

////PushInstruction("constant 30")
@30 // 13105
D=A // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=D // 13110

////PushInstruction("constant 0")
@SP // 13111
AM=M+1 // 13112
A=A-1 // 13113
M=0 // 13114

////PushInstruction("constant 0")
@SP // 13115
AM=M+1 // 13116
A=A-1 // 13117
M=0 // 13118

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=59}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13119
D=A // 13120
@14 // 13121
M=D // 13122
@Output.create // 13123
D=A // 13124
@13 // 13125
M=D // 13126
@Output.initMap.ret.59 // 13127
D=A // 13128
@CALL // 13129
0;JMP // 13130
(Output.initMap.ret.59)

////PopInstruction{address=temp 0}
@SP // 13131
AM=M-1 // 13132
D=M // 13133
@5 // 13134
M=D // 13135

////PushInstruction("constant 90")
@90 // 13136
D=A // 13137
@SP // 13138
AM=M+1 // 13139
A=A-1 // 13140
M=D // 13141

////PushInstruction("constant 63")
@63 // 13142
D=A // 13143
@SP // 13144
AM=M+1 // 13145
A=A-1 // 13146
M=D // 13147

////PushInstruction("constant 51")
@51 // 13148
D=A // 13149
@SP // 13150
AM=M+1 // 13151
A=A-1 // 13152
M=D // 13153

////PushInstruction("constant 49")
@49 // 13154
D=A // 13155
@SP // 13156
AM=M+1 // 13157
A=A-1 // 13158
M=D // 13159

////PushInstruction("constant 24")
@24 // 13160
D=A // 13161
@SP // 13162
AM=M+1 // 13163
A=A-1 // 13164
M=D // 13165

////PushInstruction("constant 12")
@12 // 13166
D=A // 13167
@SP // 13168
AM=M+1 // 13169
A=A-1 // 13170
M=D // 13171

////PushInstruction("constant 6")
@6 // 13172
D=A // 13173
@SP // 13174
AM=M+1 // 13175
A=A-1 // 13176
M=D // 13177

////PushInstruction("constant 35")
@35 // 13178
D=A // 13179
@SP // 13180
AM=M+1 // 13181
A=A-1 // 13182
M=D // 13183

////PushInstruction("constant 51")
@51 // 13184
D=A // 13185
@SP // 13186
AM=M+1 // 13187
A=A-1 // 13188
M=D // 13189

////PushInstruction("constant 63")
@63 // 13190
D=A // 13191
@SP // 13192
AM=M+1 // 13193
A=A-1 // 13194
M=D // 13195

////PushInstruction("constant 0")
@SP // 13196
AM=M+1 // 13197
A=A-1 // 13198
M=0 // 13199

////PushInstruction("constant 0")
@SP // 13200
AM=M+1 // 13201
A=A-1 // 13202
M=0 // 13203

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=60}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13204
D=A // 13205
@14 // 13206
M=D // 13207
@Output.create // 13208
D=A // 13209
@13 // 13210
M=D // 13211
@Output.initMap.ret.60 // 13212
D=A // 13213
@CALL // 13214
0;JMP // 13215
(Output.initMap.ret.60)

////PopInstruction{address=temp 0}
@SP // 13216
AM=M-1 // 13217
D=M // 13218
@5 // 13219
M=D // 13220

////PushInstruction("constant 91")
@91 // 13221
D=A // 13222
@SP // 13223
AM=M+1 // 13224
A=A-1 // 13225
M=D // 13226

////PushInstruction("constant 30")
@30 // 13227
D=A // 13228
@SP // 13229
AM=M+1 // 13230
A=A-1 // 13231
M=D // 13232

////PushInstruction("constant 6")
@6 // 13233
D=A // 13234
@SP // 13235
AM=M+1 // 13236
A=A-1 // 13237
M=D // 13238

////PushInstruction("constant 6")
@6 // 13239
D=A // 13240
@SP // 13241
AM=M+1 // 13242
A=A-1 // 13243
M=D // 13244

////PushInstruction("constant 6")
@6 // 13245
D=A // 13246
@SP // 13247
AM=M+1 // 13248
A=A-1 // 13249
M=D // 13250

////PushInstruction("constant 6")
@6 // 13251
D=A // 13252
@SP // 13253
AM=M+1 // 13254
A=A-1 // 13255
M=D // 13256

////PushInstruction("constant 6")
@6 // 13257
D=A // 13258
@SP // 13259
AM=M+1 // 13260
A=A-1 // 13261
M=D // 13262

////PushInstruction("constant 6")
@6 // 13263
D=A // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268

////PushInstruction("constant 6")
@6 // 13269
D=A // 13270
@SP // 13271
AM=M+1 // 13272
A=A-1 // 13273
M=D // 13274

////PushInstruction("constant 30")
@30 // 13275
D=A // 13276
@SP // 13277
AM=M+1 // 13278
A=A-1 // 13279
M=D // 13280

////PushInstruction("constant 0")
@SP // 13281
AM=M+1 // 13282
A=A-1 // 13283
M=0 // 13284

////PushInstruction("constant 0")
@SP // 13285
AM=M+1 // 13286
A=A-1 // 13287
M=0 // 13288

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=61}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13289
D=A // 13290
@14 // 13291
M=D // 13292
@Output.create // 13293
D=A // 13294
@13 // 13295
M=D // 13296
@Output.initMap.ret.61 // 13297
D=A // 13298
@CALL // 13299
0;JMP // 13300
(Output.initMap.ret.61)

////PopInstruction{address=temp 0}
@SP // 13301
AM=M-1 // 13302
D=M // 13303
@5 // 13304
M=D // 13305

////PushInstruction("constant 92")
@92 // 13306
D=A // 13307
@SP // 13308
AM=M+1 // 13309
A=A-1 // 13310
M=D // 13311

////PushInstruction("constant 0")
@SP // 13312
AM=M+1 // 13313
A=A-1 // 13314
M=0 // 13315

////PushInstruction("constant 0")
@SP // 13316
AM=M+1 // 13317
A=A-1 // 13318
M=0 // 13319

////PushInstruction("constant 1")
@SP // 13320
AM=M+1 // 13321
A=A-1 // 13322
M=1 // 13323

////PushInstruction("constant 3")
@3 // 13324
D=A // 13325
@SP // 13326
AM=M+1 // 13327
A=A-1 // 13328
M=D // 13329

////PushInstruction("constant 6")
@6 // 13330
D=A // 13331
@SP // 13332
AM=M+1 // 13333
A=A-1 // 13334
M=D // 13335

////PushInstruction("constant 12")
@12 // 13336
D=A // 13337
@SP // 13338
AM=M+1 // 13339
A=A-1 // 13340
M=D // 13341

////PushInstruction("constant 24")
@24 // 13342
D=A // 13343
@SP // 13344
AM=M+1 // 13345
A=A-1 // 13346
M=D // 13347

////PushInstruction("constant 48")
@48 // 13348
D=A // 13349
@SP // 13350
AM=M+1 // 13351
A=A-1 // 13352
M=D // 13353

////PushInstruction("constant 32")
@32 // 13354
D=A // 13355
@SP // 13356
AM=M+1 // 13357
A=A-1 // 13358
M=D // 13359

////PushInstruction("constant 0")
@SP // 13360
AM=M+1 // 13361
A=A-1 // 13362
M=0 // 13363

////PushInstruction("constant 0")
@SP // 13364
AM=M+1 // 13365
A=A-1 // 13366
M=0 // 13367

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=62}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13368
D=A // 13369
@14 // 13370
M=D // 13371
@Output.create // 13372
D=A // 13373
@13 // 13374
M=D // 13375
@Output.initMap.ret.62 // 13376
D=A // 13377
@CALL // 13378
0;JMP // 13379
(Output.initMap.ret.62)

////PopInstruction{address=temp 0}
@SP // 13380
AM=M-1 // 13381
D=M // 13382
@5 // 13383
M=D // 13384

////PushInstruction("constant 93")
@93 // 13385
D=A // 13386
@SP // 13387
AM=M+1 // 13388
A=A-1 // 13389
M=D // 13390

////PushInstruction("constant 30")
@30 // 13391
D=A // 13392
@SP // 13393
AM=M+1 // 13394
A=A-1 // 13395
M=D // 13396

////PushInstruction("constant 24")
@24 // 13397
D=A // 13398
@SP // 13399
AM=M+1 // 13400
A=A-1 // 13401
M=D // 13402

////PushInstruction("constant 24")
@24 // 13403
D=A // 13404
@SP // 13405
AM=M+1 // 13406
A=A-1 // 13407
M=D // 13408

////PushInstruction("constant 24")
@24 // 13409
D=A // 13410
@SP // 13411
AM=M+1 // 13412
A=A-1 // 13413
M=D // 13414

////PushInstruction("constant 24")
@24 // 13415
D=A // 13416
@SP // 13417
AM=M+1 // 13418
A=A-1 // 13419
M=D // 13420

////PushInstruction("constant 24")
@24 // 13421
D=A // 13422
@SP // 13423
AM=M+1 // 13424
A=A-1 // 13425
M=D // 13426

////PushInstruction("constant 24")
@24 // 13427
D=A // 13428
@SP // 13429
AM=M+1 // 13430
A=A-1 // 13431
M=D // 13432

////PushInstruction("constant 24")
@24 // 13433
D=A // 13434
@SP // 13435
AM=M+1 // 13436
A=A-1 // 13437
M=D // 13438

////PushInstruction("constant 30")
@30 // 13439
D=A // 13440
@SP // 13441
AM=M+1 // 13442
A=A-1 // 13443
M=D // 13444

////PushInstruction("constant 0")
@SP // 13445
AM=M+1 // 13446
A=A-1 // 13447
M=0 // 13448

////PushInstruction("constant 0")
@SP // 13449
AM=M+1 // 13450
A=A-1 // 13451
M=0 // 13452

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=63}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13453
D=A // 13454
@14 // 13455
M=D // 13456
@Output.create // 13457
D=A // 13458
@13 // 13459
M=D // 13460
@Output.initMap.ret.63 // 13461
D=A // 13462
@CALL // 13463
0;JMP // 13464
(Output.initMap.ret.63)

////PopInstruction{address=temp 0}
@SP // 13465
AM=M-1 // 13466
D=M // 13467
@5 // 13468
M=D // 13469

////PushInstruction("constant 94")
@94 // 13470
D=A // 13471
@SP // 13472
AM=M+1 // 13473
A=A-1 // 13474
M=D // 13475

////PushInstruction("constant 8")
@8 // 13476
D=A // 13477
@SP // 13478
AM=M+1 // 13479
A=A-1 // 13480
M=D // 13481

////PushInstruction("constant 28")
@28 // 13482
D=A // 13483
@SP // 13484
AM=M+1 // 13485
A=A-1 // 13486
M=D // 13487

////PushInstruction("constant 54")
@54 // 13488
D=A // 13489
@SP // 13490
AM=M+1 // 13491
A=A-1 // 13492
M=D // 13493

////PushInstruction("constant 0")
@SP // 13494
AM=M+1 // 13495
A=A-1 // 13496
M=0 // 13497

////PushInstruction("constant 0")
@SP // 13498
AM=M+1 // 13499
A=A-1 // 13500
M=0 // 13501

////PushInstruction("constant 0")
@SP // 13502
AM=M+1 // 13503
A=A-1 // 13504
M=0 // 13505

////PushInstruction("constant 0")
@SP // 13506
AM=M+1 // 13507
A=A-1 // 13508
M=0 // 13509

////PushInstruction("constant 0")
@SP // 13510
AM=M+1 // 13511
A=A-1 // 13512
M=0 // 13513

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

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=64}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13526
D=A // 13527
@14 // 13528
M=D // 13529
@Output.create // 13530
D=A // 13531
@13 // 13532
M=D // 13533
@Output.initMap.ret.64 // 13534
D=A // 13535
@CALL // 13536
0;JMP // 13537
(Output.initMap.ret.64)

////PopInstruction{address=temp 0}
@SP // 13538
AM=M-1 // 13539
D=M // 13540
@5 // 13541
M=D // 13542

////PushInstruction("constant 95")
@95 // 13543
D=A // 13544
@SP // 13545
AM=M+1 // 13546
A=A-1 // 13547
M=D // 13548

////PushInstruction("constant 0")
@SP // 13549
AM=M+1 // 13550
A=A-1 // 13551
M=0 // 13552

////PushInstruction("constant 0")
@SP // 13553
AM=M+1 // 13554
A=A-1 // 13555
M=0 // 13556

////PushInstruction("constant 0")
@SP // 13557
AM=M+1 // 13558
A=A-1 // 13559
M=0 // 13560

////PushInstruction("constant 0")
@SP // 13561
AM=M+1 // 13562
A=A-1 // 13563
M=0 // 13564

////PushInstruction("constant 0")
@SP // 13565
AM=M+1 // 13566
A=A-1 // 13567
M=0 // 13568

////PushInstruction("constant 0")
@SP // 13569
AM=M+1 // 13570
A=A-1 // 13571
M=0 // 13572

////PushInstruction("constant 0")
@SP // 13573
AM=M+1 // 13574
A=A-1 // 13575
M=0 // 13576

////PushInstruction("constant 0")
@SP // 13577
AM=M+1 // 13578
A=A-1 // 13579
M=0 // 13580

////PushInstruction("constant 0")
@SP // 13581
AM=M+1 // 13582
A=A-1 // 13583
M=0 // 13584

////PushInstruction("constant 63")
@63 // 13585
D=A // 13586
@SP // 13587
AM=M+1 // 13588
A=A-1 // 13589
M=D // 13590

////PushInstruction("constant 0")
@SP // 13591
AM=M+1 // 13592
A=A-1 // 13593
M=0 // 13594

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=65}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13595
D=A // 13596
@14 // 13597
M=D // 13598
@Output.create // 13599
D=A // 13600
@13 // 13601
M=D // 13602
@Output.initMap.ret.65 // 13603
D=A // 13604
@CALL // 13605
0;JMP // 13606
(Output.initMap.ret.65)

////PopInstruction{address=temp 0}
@SP // 13607
AM=M-1 // 13608
D=M // 13609
@5 // 13610
M=D // 13611

////PushInstruction("constant 96")
@96 // 13612
D=A // 13613
@SP // 13614
AM=M+1 // 13615
A=A-1 // 13616
M=D // 13617

////PushInstruction("constant 6")
@6 // 13618
D=A // 13619
@SP // 13620
AM=M+1 // 13621
A=A-1 // 13622
M=D // 13623

////PushInstruction("constant 12")
@12 // 13624
D=A // 13625
@SP // 13626
AM=M+1 // 13627
A=A-1 // 13628
M=D // 13629

////PushInstruction("constant 24")
@24 // 13630
D=A // 13631
@SP // 13632
AM=M+1 // 13633
A=A-1 // 13634
M=D // 13635

////PushInstruction("constant 0")
@SP // 13636
AM=M+1 // 13637
A=A-1 // 13638
M=0 // 13639

////PushInstruction("constant 0")
@SP // 13640
AM=M+1 // 13641
A=A-1 // 13642
M=0 // 13643

////PushInstruction("constant 0")
@SP // 13644
AM=M+1 // 13645
A=A-1 // 13646
M=0 // 13647

////PushInstruction("constant 0")
@SP // 13648
AM=M+1 // 13649
A=A-1 // 13650
M=0 // 13651

////PushInstruction("constant 0")
@SP // 13652
AM=M+1 // 13653
A=A-1 // 13654
M=0 // 13655

////PushInstruction("constant 0")
@SP // 13656
AM=M+1 // 13657
A=A-1 // 13658
M=0 // 13659

////PushInstruction("constant 0")
@SP // 13660
AM=M+1 // 13661
A=A-1 // 13662
M=0 // 13663

////PushInstruction("constant 0")
@SP // 13664
AM=M+1 // 13665
A=A-1 // 13666
M=0 // 13667

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=66}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13668
D=A // 13669
@14 // 13670
M=D // 13671
@Output.create // 13672
D=A // 13673
@13 // 13674
M=D // 13675
@Output.initMap.ret.66 // 13676
D=A // 13677
@CALL // 13678
0;JMP // 13679
(Output.initMap.ret.66)

////PopInstruction{address=temp 0}
@SP // 13680
AM=M-1 // 13681
D=M // 13682
@5 // 13683
M=D // 13684

////PushInstruction("constant 97")
@97 // 13685
D=A // 13686
@SP // 13687
AM=M+1 // 13688
A=A-1 // 13689
M=D // 13690

////PushInstruction("constant 0")
@SP // 13691
AM=M+1 // 13692
A=A-1 // 13693
M=0 // 13694

////PushInstruction("constant 0")
@SP // 13695
AM=M+1 // 13696
A=A-1 // 13697
M=0 // 13698

////PushInstruction("constant 0")
@SP // 13699
AM=M+1 // 13700
A=A-1 // 13701
M=0 // 13702

////PushInstruction("constant 14")
@14 // 13703
D=A // 13704
@SP // 13705
AM=M+1 // 13706
A=A-1 // 13707
M=D // 13708

////PushInstruction("constant 24")
@24 // 13709
D=A // 13710
@SP // 13711
AM=M+1 // 13712
A=A-1 // 13713
M=D // 13714

////PushInstruction("constant 30")
@30 // 13715
D=A // 13716
@SP // 13717
AM=M+1 // 13718
A=A-1 // 13719
M=D // 13720

////PushInstruction("constant 27")
@27 // 13721
D=A // 13722
@SP // 13723
AM=M+1 // 13724
A=A-1 // 13725
M=D // 13726

////PushInstruction("constant 27")
@27 // 13727
D=A // 13728
@SP // 13729
AM=M+1 // 13730
A=A-1 // 13731
M=D // 13732

////PushInstruction("constant 54")
@54 // 13733
D=A // 13734
@SP // 13735
AM=M+1 // 13736
A=A-1 // 13737
M=D // 13738

////PushInstruction("constant 0")
@SP // 13739
AM=M+1 // 13740
A=A-1 // 13741
M=0 // 13742

////PushInstruction("constant 0")
@SP // 13743
AM=M+1 // 13744
A=A-1 // 13745
M=0 // 13746

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=67}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13747
D=A // 13748
@14 // 13749
M=D // 13750
@Output.create // 13751
D=A // 13752
@13 // 13753
M=D // 13754
@Output.initMap.ret.67 // 13755
D=A // 13756
@CALL // 13757
0;JMP // 13758
(Output.initMap.ret.67)

////PopInstruction{address=temp 0}
@SP // 13759
AM=M-1 // 13760
D=M // 13761
@5 // 13762
M=D // 13763

////PushInstruction("constant 98")
@98 // 13764
D=A // 13765
@SP // 13766
AM=M+1 // 13767
A=A-1 // 13768
M=D // 13769

////PushInstruction("constant 3")
@3 // 13770
D=A // 13771
@SP // 13772
AM=M+1 // 13773
A=A-1 // 13774
M=D // 13775

////PushInstruction("constant 3")
@3 // 13776
D=A // 13777
@SP // 13778
AM=M+1 // 13779
A=A-1 // 13780
M=D // 13781

////PushInstruction("constant 3")
@3 // 13782
D=A // 13783
@SP // 13784
AM=M+1 // 13785
A=A-1 // 13786
M=D // 13787

////PushInstruction("constant 15")
@15 // 13788
D=A // 13789
@SP // 13790
AM=M+1 // 13791
A=A-1 // 13792
M=D // 13793

////PushInstruction("constant 27")
@27 // 13794
D=A // 13795
@SP // 13796
AM=M+1 // 13797
A=A-1 // 13798
M=D // 13799

////PushInstruction("constant 51")
@51 // 13800
D=A // 13801
@SP // 13802
AM=M+1 // 13803
A=A-1 // 13804
M=D // 13805

////PushInstruction("constant 51")
@51 // 13806
D=A // 13807
@SP // 13808
AM=M+1 // 13809
A=A-1 // 13810
M=D // 13811

////PushInstruction("constant 51")
@51 // 13812
D=A // 13813
@SP // 13814
AM=M+1 // 13815
A=A-1 // 13816
M=D // 13817

////PushInstruction("constant 30")
@30 // 13818
D=A // 13819
@SP // 13820
AM=M+1 // 13821
A=A-1 // 13822
M=D // 13823

////PushInstruction("constant 0")
@SP // 13824
AM=M+1 // 13825
A=A-1 // 13826
M=0 // 13827

////PushInstruction("constant 0")
@SP // 13828
AM=M+1 // 13829
A=A-1 // 13830
M=0 // 13831

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=68}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13832
D=A // 13833
@14 // 13834
M=D // 13835
@Output.create // 13836
D=A // 13837
@13 // 13838
M=D // 13839
@Output.initMap.ret.68 // 13840
D=A // 13841
@CALL // 13842
0;JMP // 13843
(Output.initMap.ret.68)

////PopInstruction{address=temp 0}
@SP // 13844
AM=M-1 // 13845
D=M // 13846
@5 // 13847
M=D // 13848

////PushInstruction("constant 99")
@99 // 13849
D=A // 13850
@SP // 13851
AM=M+1 // 13852
A=A-1 // 13853
M=D // 13854

////PushInstruction("constant 0")
@SP // 13855
AM=M+1 // 13856
A=A-1 // 13857
M=0 // 13858

////PushInstruction("constant 0")
@SP // 13859
AM=M+1 // 13860
A=A-1 // 13861
M=0 // 13862

////PushInstruction("constant 0")
@SP // 13863
AM=M+1 // 13864
A=A-1 // 13865
M=0 // 13866

////PushInstruction("constant 30")
@30 // 13867
D=A // 13868
@SP // 13869
AM=M+1 // 13870
A=A-1 // 13871
M=D // 13872

////PushInstruction("constant 51")
@51 // 13873
D=A // 13874
@SP // 13875
AM=M+1 // 13876
A=A-1 // 13877
M=D // 13878

////PushInstruction("constant 3")
@3 // 13879
D=A // 13880
@SP // 13881
AM=M+1 // 13882
A=A-1 // 13883
M=D // 13884

////PushInstruction("constant 3")
@3 // 13885
D=A // 13886
@SP // 13887
AM=M+1 // 13888
A=A-1 // 13889
M=D // 13890

////PushInstruction("constant 51")
@51 // 13891
D=A // 13892
@SP // 13893
AM=M+1 // 13894
A=A-1 // 13895
M=D // 13896

////PushInstruction("constant 30")
@30 // 13897
D=A // 13898
@SP // 13899
AM=M+1 // 13900
A=A-1 // 13901
M=D // 13902

////PushInstruction("constant 0")
@SP // 13903
AM=M+1 // 13904
A=A-1 // 13905
M=0 // 13906

////PushInstruction("constant 0")
@SP // 13907
AM=M+1 // 13908
A=A-1 // 13909
M=0 // 13910

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=69}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13911
D=A // 13912
@14 // 13913
M=D // 13914
@Output.create // 13915
D=A // 13916
@13 // 13917
M=D // 13918
@Output.initMap.ret.69 // 13919
D=A // 13920
@CALL // 13921
0;JMP // 13922
(Output.initMap.ret.69)

////PopInstruction{address=temp 0}
@SP // 13923
AM=M-1 // 13924
D=M // 13925
@5 // 13926
M=D // 13927

////PushInstruction("constant 100")
@100 // 13928
D=A // 13929
@SP // 13930
AM=M+1 // 13931
A=A-1 // 13932
M=D // 13933

////PushInstruction("constant 48")
@48 // 13934
D=A // 13935
@SP // 13936
AM=M+1 // 13937
A=A-1 // 13938
M=D // 13939

////PushInstruction("constant 48")
@48 // 13940
D=A // 13941
@SP // 13942
AM=M+1 // 13943
A=A-1 // 13944
M=D // 13945

////PushInstruction("constant 48")
@48 // 13946
D=A // 13947
@SP // 13948
AM=M+1 // 13949
A=A-1 // 13950
M=D // 13951

////PushInstruction("constant 60")
@60 // 13952
D=A // 13953
@SP // 13954
AM=M+1 // 13955
A=A-1 // 13956
M=D // 13957

////PushInstruction("constant 54")
@54 // 13958
D=A // 13959
@SP // 13960
AM=M+1 // 13961
A=A-1 // 13962
M=D // 13963

////PushInstruction("constant 51")
@51 // 13964
D=A // 13965
@SP // 13966
AM=M+1 // 13967
A=A-1 // 13968
M=D // 13969

////PushInstruction("constant 51")
@51 // 13970
D=A // 13971
@SP // 13972
AM=M+1 // 13973
A=A-1 // 13974
M=D // 13975

////PushInstruction("constant 51")
@51 // 13976
D=A // 13977
@SP // 13978
AM=M+1 // 13979
A=A-1 // 13980
M=D // 13981

////PushInstruction("constant 30")
@30 // 13982
D=A // 13983
@SP // 13984
AM=M+1 // 13985
A=A-1 // 13986
M=D // 13987

////PushInstruction("constant 0")
@SP // 13988
AM=M+1 // 13989
A=A-1 // 13990
M=0 // 13991

////PushInstruction("constant 0")
@SP // 13992
AM=M+1 // 13993
A=A-1 // 13994
M=0 // 13995

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=70}, currentFunction='Output.initMap'}
// call Output.create
@17 // 13996
D=A // 13997
@14 // 13998
M=D // 13999
@Output.create // 14000
D=A // 14001
@13 // 14002
M=D // 14003
@Output.initMap.ret.70 // 14004
D=A // 14005
@CALL // 14006
0;JMP // 14007
(Output.initMap.ret.70)

////PopInstruction{address=temp 0}
@SP // 14008
AM=M-1 // 14009
D=M // 14010
@5 // 14011
M=D // 14012

////PushInstruction("constant 101")
@101 // 14013
D=A // 14014
@SP // 14015
AM=M+1 // 14016
A=A-1 // 14017
M=D // 14018

////PushInstruction("constant 0")
@SP // 14019
AM=M+1 // 14020
A=A-1 // 14021
M=0 // 14022

////PushInstruction("constant 0")
@SP // 14023
AM=M+1 // 14024
A=A-1 // 14025
M=0 // 14026

////PushInstruction("constant 0")
@SP // 14027
AM=M+1 // 14028
A=A-1 // 14029
M=0 // 14030

////PushInstruction("constant 30")
@30 // 14031
D=A // 14032
@SP // 14033
AM=M+1 // 14034
A=A-1 // 14035
M=D // 14036

////PushInstruction("constant 51")
@51 // 14037
D=A // 14038
@SP // 14039
AM=M+1 // 14040
A=A-1 // 14041
M=D // 14042

////PushInstruction("constant 63")
@63 // 14043
D=A // 14044
@SP // 14045
AM=M+1 // 14046
A=A-1 // 14047
M=D // 14048

////PushInstruction("constant 3")
@3 // 14049
D=A // 14050
@SP // 14051
AM=M+1 // 14052
A=A-1 // 14053
M=D // 14054

////PushInstruction("constant 51")
@51 // 14055
D=A // 14056
@SP // 14057
AM=M+1 // 14058
A=A-1 // 14059
M=D // 14060

////PushInstruction("constant 30")
@30 // 14061
D=A // 14062
@SP // 14063
AM=M+1 // 14064
A=A-1 // 14065
M=D // 14066

////PushInstruction("constant 0")
@SP // 14067
AM=M+1 // 14068
A=A-1 // 14069
M=0 // 14070

////PushInstruction("constant 0")
@SP // 14071
AM=M+1 // 14072
A=A-1 // 14073
M=0 // 14074

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=71}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14075
D=A // 14076
@14 // 14077
M=D // 14078
@Output.create // 14079
D=A // 14080
@13 // 14081
M=D // 14082
@Output.initMap.ret.71 // 14083
D=A // 14084
@CALL // 14085
0;JMP // 14086
(Output.initMap.ret.71)

////PopInstruction{address=temp 0}
@SP // 14087
AM=M-1 // 14088
D=M // 14089
@5 // 14090
M=D // 14091

////PushInstruction("constant 102")
@102 // 14092
D=A // 14093
@SP // 14094
AM=M+1 // 14095
A=A-1 // 14096
M=D // 14097

////PushInstruction("constant 28")
@28 // 14098
D=A // 14099
@SP // 14100
AM=M+1 // 14101
A=A-1 // 14102
M=D // 14103

////PushInstruction("constant 54")
@54 // 14104
D=A // 14105
@SP // 14106
AM=M+1 // 14107
A=A-1 // 14108
M=D // 14109

////PushInstruction("constant 38")
@38 // 14110
D=A // 14111
@SP // 14112
AM=M+1 // 14113
A=A-1 // 14114
M=D // 14115

////PushInstruction("constant 6")
@6 // 14116
D=A // 14117
@SP // 14118
AM=M+1 // 14119
A=A-1 // 14120
M=D // 14121

////PushInstruction("constant 15")
@15 // 14122
D=A // 14123
@SP // 14124
AM=M+1 // 14125
A=A-1 // 14126
M=D // 14127

////PushInstruction("constant 6")
@6 // 14128
D=A // 14129
@SP // 14130
AM=M+1 // 14131
A=A-1 // 14132
M=D // 14133

////PushInstruction("constant 6")
@6 // 14134
D=A // 14135
@SP // 14136
AM=M+1 // 14137
A=A-1 // 14138
M=D // 14139

////PushInstruction("constant 6")
@6 // 14140
D=A // 14141
@SP // 14142
AM=M+1 // 14143
A=A-1 // 14144
M=D // 14145

////PushInstruction("constant 15")
@15 // 14146
D=A // 14147
@SP // 14148
AM=M+1 // 14149
A=A-1 // 14150
M=D // 14151

////PushInstruction("constant 0")
@SP // 14152
AM=M+1 // 14153
A=A-1 // 14154
M=0 // 14155

////PushInstruction("constant 0")
@SP // 14156
AM=M+1 // 14157
A=A-1 // 14158
M=0 // 14159

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=72}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14160
D=A // 14161
@14 // 14162
M=D // 14163
@Output.create // 14164
D=A // 14165
@13 // 14166
M=D // 14167
@Output.initMap.ret.72 // 14168
D=A // 14169
@CALL // 14170
0;JMP // 14171
(Output.initMap.ret.72)

////PopInstruction{address=temp 0}
@SP // 14172
AM=M-1 // 14173
D=M // 14174
@5 // 14175
M=D // 14176

////PushInstruction("constant 103")
@103 // 14177
D=A // 14178
@SP // 14179
AM=M+1 // 14180
A=A-1 // 14181
M=D // 14182

////PushInstruction("constant 0")
@SP // 14183
AM=M+1 // 14184
A=A-1 // 14185
M=0 // 14186

////PushInstruction("constant 0")
@SP // 14187
AM=M+1 // 14188
A=A-1 // 14189
M=0 // 14190

////PushInstruction("constant 30")
@30 // 14191
D=A // 14192
@SP // 14193
AM=M+1 // 14194
A=A-1 // 14195
M=D // 14196

////PushInstruction("constant 51")
@51 // 14197
D=A // 14198
@SP // 14199
AM=M+1 // 14200
A=A-1 // 14201
M=D // 14202

////PushInstruction("constant 51")
@51 // 14203
D=A // 14204
@SP // 14205
AM=M+1 // 14206
A=A-1 // 14207
M=D // 14208

////PushInstruction("constant 51")
@51 // 14209
D=A // 14210
@SP // 14211
AM=M+1 // 14212
A=A-1 // 14213
M=D // 14214

////PushInstruction("constant 62")
@62 // 14215
D=A // 14216
@SP // 14217
AM=M+1 // 14218
A=A-1 // 14219
M=D // 14220

////PushInstruction("constant 48")
@48 // 14221
D=A // 14222
@SP // 14223
AM=M+1 // 14224
A=A-1 // 14225
M=D // 14226

////PushInstruction("constant 51")
@51 // 14227
D=A // 14228
@SP // 14229
AM=M+1 // 14230
A=A-1 // 14231
M=D // 14232

////PushInstruction("constant 30")
@30 // 14233
D=A // 14234
@SP // 14235
AM=M+1 // 14236
A=A-1 // 14237
M=D // 14238

////PushInstruction("constant 0")
@SP // 14239
AM=M+1 // 14240
A=A-1 // 14241
M=0 // 14242

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=73}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14243
D=A // 14244
@14 // 14245
M=D // 14246
@Output.create // 14247
D=A // 14248
@13 // 14249
M=D // 14250
@Output.initMap.ret.73 // 14251
D=A // 14252
@CALL // 14253
0;JMP // 14254
(Output.initMap.ret.73)

////PopInstruction{address=temp 0}
@SP // 14255
AM=M-1 // 14256
D=M // 14257
@5 // 14258
M=D // 14259

////PushInstruction("constant 104")
@104 // 14260
D=A // 14261
@SP // 14262
AM=M+1 // 14263
A=A-1 // 14264
M=D // 14265

////PushInstruction("constant 3")
@3 // 14266
D=A // 14267
@SP // 14268
AM=M+1 // 14269
A=A-1 // 14270
M=D // 14271

////PushInstruction("constant 3")
@3 // 14272
D=A // 14273
@SP // 14274
AM=M+1 // 14275
A=A-1 // 14276
M=D // 14277

////PushInstruction("constant 3")
@3 // 14278
D=A // 14279
@SP // 14280
AM=M+1 // 14281
A=A-1 // 14282
M=D // 14283

////PushInstruction("constant 27")
@27 // 14284
D=A // 14285
@SP // 14286
AM=M+1 // 14287
A=A-1 // 14288
M=D // 14289

////PushInstruction("constant 55")
@55 // 14290
D=A // 14291
@SP // 14292
AM=M+1 // 14293
A=A-1 // 14294
M=D // 14295

////PushInstruction("constant 51")
@51 // 14296
D=A // 14297
@SP // 14298
AM=M+1 // 14299
A=A-1 // 14300
M=D // 14301

////PushInstruction("constant 51")
@51 // 14302
D=A // 14303
@SP // 14304
AM=M+1 // 14305
A=A-1 // 14306
M=D // 14307

////PushInstruction("constant 51")
@51 // 14308
D=A // 14309
@SP // 14310
AM=M+1 // 14311
A=A-1 // 14312
M=D // 14313

////PushInstruction("constant 51")
@51 // 14314
D=A // 14315
@SP // 14316
AM=M+1 // 14317
A=A-1 // 14318
M=D // 14319

////PushInstruction("constant 0")
@SP // 14320
AM=M+1 // 14321
A=A-1 // 14322
M=0 // 14323

////PushInstruction("constant 0")
@SP // 14324
AM=M+1 // 14325
A=A-1 // 14326
M=0 // 14327

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=74}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14328
D=A // 14329
@14 // 14330
M=D // 14331
@Output.create // 14332
D=A // 14333
@13 // 14334
M=D // 14335
@Output.initMap.ret.74 // 14336
D=A // 14337
@CALL // 14338
0;JMP // 14339
(Output.initMap.ret.74)

////PopInstruction{address=temp 0}
@SP // 14340
AM=M-1 // 14341
D=M // 14342
@5 // 14343
M=D // 14344

////PushInstruction("constant 105")
@105 // 14345
D=A // 14346
@SP // 14347
AM=M+1 // 14348
A=A-1 // 14349
M=D // 14350

////PushInstruction("constant 12")
@12 // 14351
D=A // 14352
@SP // 14353
AM=M+1 // 14354
A=A-1 // 14355
M=D // 14356

////PushInstruction("constant 12")
@12 // 14357
D=A // 14358
@SP // 14359
AM=M+1 // 14360
A=A-1 // 14361
M=D // 14362

////PushInstruction("constant 0")
@SP // 14363
AM=M+1 // 14364
A=A-1 // 14365
M=0 // 14366

////PushInstruction("constant 14")
@14 // 14367
D=A // 14368
@SP // 14369
AM=M+1 // 14370
A=A-1 // 14371
M=D // 14372

////PushInstruction("constant 12")
@12 // 14373
D=A // 14374
@SP // 14375
AM=M+1 // 14376
A=A-1 // 14377
M=D // 14378

////PushInstruction("constant 12")
@12 // 14379
D=A // 14380
@SP // 14381
AM=M+1 // 14382
A=A-1 // 14383
M=D // 14384

////PushInstruction("constant 12")
@12 // 14385
D=A // 14386
@SP // 14387
AM=M+1 // 14388
A=A-1 // 14389
M=D // 14390

////PushInstruction("constant 12")
@12 // 14391
D=A // 14392
@SP // 14393
AM=M+1 // 14394
A=A-1 // 14395
M=D // 14396

////PushInstruction("constant 30")
@30 // 14397
D=A // 14398
@SP // 14399
AM=M+1 // 14400
A=A-1 // 14401
M=D // 14402

////PushInstruction("constant 0")
@SP // 14403
AM=M+1 // 14404
A=A-1 // 14405
M=0 // 14406

////PushInstruction("constant 0")
@SP // 14407
AM=M+1 // 14408
A=A-1 // 14409
M=0 // 14410

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=75}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14411
D=A // 14412
@14 // 14413
M=D // 14414
@Output.create // 14415
D=A // 14416
@13 // 14417
M=D // 14418
@Output.initMap.ret.75 // 14419
D=A // 14420
@CALL // 14421
0;JMP // 14422
(Output.initMap.ret.75)

////PopInstruction{address=temp 0}
@SP // 14423
AM=M-1 // 14424
D=M // 14425
@5 // 14426
M=D // 14427

////PushInstruction("constant 106")
@106 // 14428
D=A // 14429
@SP // 14430
AM=M+1 // 14431
A=A-1 // 14432
M=D // 14433

////PushInstruction("constant 48")
@48 // 14434
D=A // 14435
@SP // 14436
AM=M+1 // 14437
A=A-1 // 14438
M=D // 14439

////PushInstruction("constant 48")
@48 // 14440
D=A // 14441
@SP // 14442
AM=M+1 // 14443
A=A-1 // 14444
M=D // 14445

////PushInstruction("constant 0")
@SP // 14446
AM=M+1 // 14447
A=A-1 // 14448
M=0 // 14449

////PushInstruction("constant 56")
@56 // 14450
D=A // 14451
@SP // 14452
AM=M+1 // 14453
A=A-1 // 14454
M=D // 14455

////PushInstruction("constant 48")
@48 // 14456
D=A // 14457
@SP // 14458
AM=M+1 // 14459
A=A-1 // 14460
M=D // 14461

////PushInstruction("constant 48")
@48 // 14462
D=A // 14463
@SP // 14464
AM=M+1 // 14465
A=A-1 // 14466
M=D // 14467

////PushInstruction("constant 48")
@48 // 14468
D=A // 14469
@SP // 14470
AM=M+1 // 14471
A=A-1 // 14472
M=D // 14473

////PushInstruction("constant 48")
@48 // 14474
D=A // 14475
@SP // 14476
AM=M+1 // 14477
A=A-1 // 14478
M=D // 14479

////PushInstruction("constant 51")
@51 // 14480
D=A // 14481
@SP // 14482
AM=M+1 // 14483
A=A-1 // 14484
M=D // 14485

////PushInstruction("constant 30")
@30 // 14486
D=A // 14487
@SP // 14488
AM=M+1 // 14489
A=A-1 // 14490
M=D // 14491

////PushInstruction("constant 0")
@SP // 14492
AM=M+1 // 14493
A=A-1 // 14494
M=0 // 14495

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=76}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14496
D=A // 14497
@14 // 14498
M=D // 14499
@Output.create // 14500
D=A // 14501
@13 // 14502
M=D // 14503
@Output.initMap.ret.76 // 14504
D=A // 14505
@CALL // 14506
0;JMP // 14507
(Output.initMap.ret.76)

////PopInstruction{address=temp 0}
@SP // 14508
AM=M-1 // 14509
D=M // 14510
@5 // 14511
M=D // 14512

////PushInstruction("constant 107")
@107 // 14513
D=A // 14514
@SP // 14515
AM=M+1 // 14516
A=A-1 // 14517
M=D // 14518

////PushInstruction("constant 3")
@3 // 14519
D=A // 14520
@SP // 14521
AM=M+1 // 14522
A=A-1 // 14523
M=D // 14524

////PushInstruction("constant 3")
@3 // 14525
D=A // 14526
@SP // 14527
AM=M+1 // 14528
A=A-1 // 14529
M=D // 14530

////PushInstruction("constant 3")
@3 // 14531
D=A // 14532
@SP // 14533
AM=M+1 // 14534
A=A-1 // 14535
M=D // 14536

////PushInstruction("constant 51")
@51 // 14537
D=A // 14538
@SP // 14539
AM=M+1 // 14540
A=A-1 // 14541
M=D // 14542

////PushInstruction("constant 27")
@27 // 14543
D=A // 14544
@SP // 14545
AM=M+1 // 14546
A=A-1 // 14547
M=D // 14548

////PushInstruction("constant 15")
@15 // 14549
D=A // 14550
@SP // 14551
AM=M+1 // 14552
A=A-1 // 14553
M=D // 14554

////PushInstruction("constant 15")
@15 // 14555
D=A // 14556
@SP // 14557
AM=M+1 // 14558
A=A-1 // 14559
M=D // 14560

////PushInstruction("constant 27")
@27 // 14561
D=A // 14562
@SP // 14563
AM=M+1 // 14564
A=A-1 // 14565
M=D // 14566

////PushInstruction("constant 51")
@51 // 14567
D=A // 14568
@SP // 14569
AM=M+1 // 14570
A=A-1 // 14571
M=D // 14572

////PushInstruction("constant 0")
@SP // 14573
AM=M+1 // 14574
A=A-1 // 14575
M=0 // 14576

////PushInstruction("constant 0")
@SP // 14577
AM=M+1 // 14578
A=A-1 // 14579
M=0 // 14580

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=77}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14581
D=A // 14582
@14 // 14583
M=D // 14584
@Output.create // 14585
D=A // 14586
@13 // 14587
M=D // 14588
@Output.initMap.ret.77 // 14589
D=A // 14590
@CALL // 14591
0;JMP // 14592
(Output.initMap.ret.77)

////PopInstruction{address=temp 0}
@SP // 14593
AM=M-1 // 14594
D=M // 14595
@5 // 14596
M=D // 14597

////PushInstruction("constant 108")
@108 // 14598
D=A // 14599
@SP // 14600
AM=M+1 // 14601
A=A-1 // 14602
M=D // 14603

////PushInstruction("constant 14")
@14 // 14604
D=A // 14605
@SP // 14606
AM=M+1 // 14607
A=A-1 // 14608
M=D // 14609

////PushInstruction("constant 12")
@12 // 14610
D=A // 14611
@SP // 14612
AM=M+1 // 14613
A=A-1 // 14614
M=D // 14615

////PushInstruction("constant 12")
@12 // 14616
D=A // 14617
@SP // 14618
AM=M+1 // 14619
A=A-1 // 14620
M=D // 14621

////PushInstruction("constant 12")
@12 // 14622
D=A // 14623
@SP // 14624
AM=M+1 // 14625
A=A-1 // 14626
M=D // 14627

////PushInstruction("constant 12")
@12 // 14628
D=A // 14629
@SP // 14630
AM=M+1 // 14631
A=A-1 // 14632
M=D // 14633

////PushInstruction("constant 12")
@12 // 14634
D=A // 14635
@SP // 14636
AM=M+1 // 14637
A=A-1 // 14638
M=D // 14639

////PushInstruction("constant 12")
@12 // 14640
D=A // 14641
@SP // 14642
AM=M+1 // 14643
A=A-1 // 14644
M=D // 14645

////PushInstruction("constant 12")
@12 // 14646
D=A // 14647
@SP // 14648
AM=M+1 // 14649
A=A-1 // 14650
M=D // 14651

////PushInstruction("constant 30")
@30 // 14652
D=A // 14653
@SP // 14654
AM=M+1 // 14655
A=A-1 // 14656
M=D // 14657

////PushInstruction("constant 0")
@SP // 14658
AM=M+1 // 14659
A=A-1 // 14660
M=0 // 14661

////PushInstruction("constant 0")
@SP // 14662
AM=M+1 // 14663
A=A-1 // 14664
M=0 // 14665

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=78}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14666
D=A // 14667
@14 // 14668
M=D // 14669
@Output.create // 14670
D=A // 14671
@13 // 14672
M=D // 14673
@Output.initMap.ret.78 // 14674
D=A // 14675
@CALL // 14676
0;JMP // 14677
(Output.initMap.ret.78)

////PopInstruction{address=temp 0}
@SP // 14678
AM=M-1 // 14679
D=M // 14680
@5 // 14681
M=D // 14682

////PushInstruction("constant 109")
@109 // 14683
D=A // 14684
@SP // 14685
AM=M+1 // 14686
A=A-1 // 14687
M=D // 14688

////PushInstruction("constant 0")
@SP // 14689
AM=M+1 // 14690
A=A-1 // 14691
M=0 // 14692

////PushInstruction("constant 0")
@SP // 14693
AM=M+1 // 14694
A=A-1 // 14695
M=0 // 14696

////PushInstruction("constant 0")
@SP // 14697
AM=M+1 // 14698
A=A-1 // 14699
M=0 // 14700

////PushInstruction("constant 29")
@29 // 14701
D=A // 14702
@SP // 14703
AM=M+1 // 14704
A=A-1 // 14705
M=D // 14706

////PushInstruction("constant 63")
@63 // 14707
D=A // 14708
@SP // 14709
AM=M+1 // 14710
A=A-1 // 14711
M=D // 14712

////PushInstruction("constant 43")
@43 // 14713
D=A // 14714
@SP // 14715
AM=M+1 // 14716
A=A-1 // 14717
M=D // 14718

////PushInstruction("constant 43")
@43 // 14719
D=A // 14720
@SP // 14721
AM=M+1 // 14722
A=A-1 // 14723
M=D // 14724

////PushInstruction("constant 43")
@43 // 14725
D=A // 14726
@SP // 14727
AM=M+1 // 14728
A=A-1 // 14729
M=D // 14730

////PushInstruction("constant 43")
@43 // 14731
D=A // 14732
@SP // 14733
AM=M+1 // 14734
A=A-1 // 14735
M=D // 14736

////PushInstruction("constant 0")
@SP // 14737
AM=M+1 // 14738
A=A-1 // 14739
M=0 // 14740

////PushInstruction("constant 0")
@SP // 14741
AM=M+1 // 14742
A=A-1 // 14743
M=0 // 14744

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=79}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14745
D=A // 14746
@14 // 14747
M=D // 14748
@Output.create // 14749
D=A // 14750
@13 // 14751
M=D // 14752
@Output.initMap.ret.79 // 14753
D=A // 14754
@CALL // 14755
0;JMP // 14756
(Output.initMap.ret.79)

////PopInstruction{address=temp 0}
@SP // 14757
AM=M-1 // 14758
D=M // 14759
@5 // 14760
M=D // 14761

////PushInstruction("constant 110")
@110 // 14762
D=A // 14763
@SP // 14764
AM=M+1 // 14765
A=A-1 // 14766
M=D // 14767

////PushInstruction("constant 0")
@SP // 14768
AM=M+1 // 14769
A=A-1 // 14770
M=0 // 14771

////PushInstruction("constant 0")
@SP // 14772
AM=M+1 // 14773
A=A-1 // 14774
M=0 // 14775

////PushInstruction("constant 0")
@SP // 14776
AM=M+1 // 14777
A=A-1 // 14778
M=0 // 14779

////PushInstruction("constant 29")
@29 // 14780
D=A // 14781
@SP // 14782
AM=M+1 // 14783
A=A-1 // 14784
M=D // 14785

////PushInstruction("constant 51")
@51 // 14786
D=A // 14787
@SP // 14788
AM=M+1 // 14789
A=A-1 // 14790
M=D // 14791

////PushInstruction("constant 51")
@51 // 14792
D=A // 14793
@SP // 14794
AM=M+1 // 14795
A=A-1 // 14796
M=D // 14797

////PushInstruction("constant 51")
@51 // 14798
D=A // 14799
@SP // 14800
AM=M+1 // 14801
A=A-1 // 14802
M=D // 14803

////PushInstruction("constant 51")
@51 // 14804
D=A // 14805
@SP // 14806
AM=M+1 // 14807
A=A-1 // 14808
M=D // 14809

////PushInstruction("constant 51")
@51 // 14810
D=A // 14811
@SP // 14812
AM=M+1 // 14813
A=A-1 // 14814
M=D // 14815

////PushInstruction("constant 0")
@SP // 14816
AM=M+1 // 14817
A=A-1 // 14818
M=0 // 14819

////PushInstruction("constant 0")
@SP // 14820
AM=M+1 // 14821
A=A-1 // 14822
M=0 // 14823

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=80}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14824
D=A // 14825
@14 // 14826
M=D // 14827
@Output.create // 14828
D=A // 14829
@13 // 14830
M=D // 14831
@Output.initMap.ret.80 // 14832
D=A // 14833
@CALL // 14834
0;JMP // 14835
(Output.initMap.ret.80)

////PopInstruction{address=temp 0}
@SP // 14836
AM=M-1 // 14837
D=M // 14838
@5 // 14839
M=D // 14840

////PushInstruction("constant 111")
@111 // 14841
D=A // 14842
@SP // 14843
AM=M+1 // 14844
A=A-1 // 14845
M=D // 14846

////PushInstruction("constant 0")
@SP // 14847
AM=M+1 // 14848
A=A-1 // 14849
M=0 // 14850

////PushInstruction("constant 0")
@SP // 14851
AM=M+1 // 14852
A=A-1 // 14853
M=0 // 14854

////PushInstruction("constant 0")
@SP // 14855
AM=M+1 // 14856
A=A-1 // 14857
M=0 // 14858

////PushInstruction("constant 30")
@30 // 14859
D=A // 14860
@SP // 14861
AM=M+1 // 14862
A=A-1 // 14863
M=D // 14864

////PushInstruction("constant 51")
@51 // 14865
D=A // 14866
@SP // 14867
AM=M+1 // 14868
A=A-1 // 14869
M=D // 14870

////PushInstruction("constant 51")
@51 // 14871
D=A // 14872
@SP // 14873
AM=M+1 // 14874
A=A-1 // 14875
M=D // 14876

////PushInstruction("constant 51")
@51 // 14877
D=A // 14878
@SP // 14879
AM=M+1 // 14880
A=A-1 // 14881
M=D // 14882

////PushInstruction("constant 51")
@51 // 14883
D=A // 14884
@SP // 14885
AM=M+1 // 14886
A=A-1 // 14887
M=D // 14888

////PushInstruction("constant 30")
@30 // 14889
D=A // 14890
@SP // 14891
AM=M+1 // 14892
A=A-1 // 14893
M=D // 14894

////PushInstruction("constant 0")
@SP // 14895
AM=M+1 // 14896
A=A-1 // 14897
M=0 // 14898

////PushInstruction("constant 0")
@SP // 14899
AM=M+1 // 14900
A=A-1 // 14901
M=0 // 14902

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=81}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14903
D=A // 14904
@14 // 14905
M=D // 14906
@Output.create // 14907
D=A // 14908
@13 // 14909
M=D // 14910
@Output.initMap.ret.81 // 14911
D=A // 14912
@CALL // 14913
0;JMP // 14914
(Output.initMap.ret.81)

////PopInstruction{address=temp 0}
@SP // 14915
AM=M-1 // 14916
D=M // 14917
@5 // 14918
M=D // 14919

////PushInstruction("constant 112")
@112 // 14920
D=A // 14921
@SP // 14922
AM=M+1 // 14923
A=A-1 // 14924
M=D // 14925

////PushInstruction("constant 0")
@SP // 14926
AM=M+1 // 14927
A=A-1 // 14928
M=0 // 14929

////PushInstruction("constant 0")
@SP // 14930
AM=M+1 // 14931
A=A-1 // 14932
M=0 // 14933

////PushInstruction("constant 0")
@SP // 14934
AM=M+1 // 14935
A=A-1 // 14936
M=0 // 14937

////PushInstruction("constant 30")
@30 // 14938
D=A // 14939
@SP // 14940
AM=M+1 // 14941
A=A-1 // 14942
M=D // 14943

////PushInstruction("constant 51")
@51 // 14944
D=A // 14945
@SP // 14946
AM=M+1 // 14947
A=A-1 // 14948
M=D // 14949

////PushInstruction("constant 51")
@51 // 14950
D=A // 14951
@SP // 14952
AM=M+1 // 14953
A=A-1 // 14954
M=D // 14955

////PushInstruction("constant 51")
@51 // 14956
D=A // 14957
@SP // 14958
AM=M+1 // 14959
A=A-1 // 14960
M=D // 14961

////PushInstruction("constant 31")
@31 // 14962
D=A // 14963
@SP // 14964
AM=M+1 // 14965
A=A-1 // 14966
M=D // 14967

////PushInstruction("constant 3")
@3 // 14968
D=A // 14969
@SP // 14970
AM=M+1 // 14971
A=A-1 // 14972
M=D // 14973

////PushInstruction("constant 3")
@3 // 14974
D=A // 14975
@SP // 14976
AM=M+1 // 14977
A=A-1 // 14978
M=D // 14979

////PushInstruction("constant 0")
@SP // 14980
AM=M+1 // 14981
A=A-1 // 14982
M=0 // 14983

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=82}, currentFunction='Output.initMap'}
// call Output.create
@17 // 14984
D=A // 14985
@14 // 14986
M=D // 14987
@Output.create // 14988
D=A // 14989
@13 // 14990
M=D // 14991
@Output.initMap.ret.82 // 14992
D=A // 14993
@CALL // 14994
0;JMP // 14995
(Output.initMap.ret.82)

////PopInstruction{address=temp 0}
@SP // 14996
AM=M-1 // 14997
D=M // 14998
@5 // 14999
M=D // 15000

////PushInstruction("constant 113")
@113 // 15001
D=A // 15002
@SP // 15003
AM=M+1 // 15004
A=A-1 // 15005
M=D // 15006

////PushInstruction("constant 0")
@SP // 15007
AM=M+1 // 15008
A=A-1 // 15009
M=0 // 15010

////PushInstruction("constant 0")
@SP // 15011
AM=M+1 // 15012
A=A-1 // 15013
M=0 // 15014

////PushInstruction("constant 0")
@SP // 15015
AM=M+1 // 15016
A=A-1 // 15017
M=0 // 15018

////PushInstruction("constant 30")
@30 // 15019
D=A // 15020
@SP // 15021
AM=M+1 // 15022
A=A-1 // 15023
M=D // 15024

////PushInstruction("constant 51")
@51 // 15025
D=A // 15026
@SP // 15027
AM=M+1 // 15028
A=A-1 // 15029
M=D // 15030

////PushInstruction("constant 51")
@51 // 15031
D=A // 15032
@SP // 15033
AM=M+1 // 15034
A=A-1 // 15035
M=D // 15036

////PushInstruction("constant 51")
@51 // 15037
D=A // 15038
@SP // 15039
AM=M+1 // 15040
A=A-1 // 15041
M=D // 15042

////PushInstruction("constant 62")
@62 // 15043
D=A // 15044
@SP // 15045
AM=M+1 // 15046
A=A-1 // 15047
M=D // 15048

////PushInstruction("constant 48")
@48 // 15049
D=A // 15050
@SP // 15051
AM=M+1 // 15052
A=A-1 // 15053
M=D // 15054

////PushInstruction("constant 48")
@48 // 15055
D=A // 15056
@SP // 15057
AM=M+1 // 15058
A=A-1 // 15059
M=D // 15060

////PushInstruction("constant 0")
@SP // 15061
AM=M+1 // 15062
A=A-1 // 15063
M=0 // 15064

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=83}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15065
D=A // 15066
@14 // 15067
M=D // 15068
@Output.create // 15069
D=A // 15070
@13 // 15071
M=D // 15072
@Output.initMap.ret.83 // 15073
D=A // 15074
@CALL // 15075
0;JMP // 15076
(Output.initMap.ret.83)

////PopInstruction{address=temp 0}
@SP // 15077
AM=M-1 // 15078
D=M // 15079
@5 // 15080
M=D // 15081

////PushInstruction("constant 114")
@114 // 15082
D=A // 15083
@SP // 15084
AM=M+1 // 15085
A=A-1 // 15086
M=D // 15087

////PushInstruction("constant 0")
@SP // 15088
AM=M+1 // 15089
A=A-1 // 15090
M=0 // 15091

////PushInstruction("constant 0")
@SP // 15092
AM=M+1 // 15093
A=A-1 // 15094
M=0 // 15095

////PushInstruction("constant 0")
@SP // 15096
AM=M+1 // 15097
A=A-1 // 15098
M=0 // 15099

////PushInstruction("constant 29")
@29 // 15100
D=A // 15101
@SP // 15102
AM=M+1 // 15103
A=A-1 // 15104
M=D // 15105

////PushInstruction("constant 55")
@55 // 15106
D=A // 15107
@SP // 15108
AM=M+1 // 15109
A=A-1 // 15110
M=D // 15111

////PushInstruction("constant 51")
@51 // 15112
D=A // 15113
@SP // 15114
AM=M+1 // 15115
A=A-1 // 15116
M=D // 15117

////PushInstruction("constant 3")
@3 // 15118
D=A // 15119
@SP // 15120
AM=M+1 // 15121
A=A-1 // 15122
M=D // 15123

////PushInstruction("constant 3")
@3 // 15124
D=A // 15125
@SP // 15126
AM=M+1 // 15127
A=A-1 // 15128
M=D // 15129

////PushInstruction("constant 7")
@7 // 15130
D=A // 15131
@SP // 15132
AM=M+1 // 15133
A=A-1 // 15134
M=D // 15135

////PushInstruction("constant 0")
@SP // 15136
AM=M+1 // 15137
A=A-1 // 15138
M=0 // 15139

////PushInstruction("constant 0")
@SP // 15140
AM=M+1 // 15141
A=A-1 // 15142
M=0 // 15143

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=84}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15144
D=A // 15145
@14 // 15146
M=D // 15147
@Output.create // 15148
D=A // 15149
@13 // 15150
M=D // 15151
@Output.initMap.ret.84 // 15152
D=A // 15153
@CALL // 15154
0;JMP // 15155
(Output.initMap.ret.84)

////PopInstruction{address=temp 0}
@SP // 15156
AM=M-1 // 15157
D=M // 15158
@5 // 15159
M=D // 15160

////PushInstruction("constant 115")
@115 // 15161
D=A // 15162
@SP // 15163
AM=M+1 // 15164
A=A-1 // 15165
M=D // 15166

////PushInstruction("constant 0")
@SP // 15167
AM=M+1 // 15168
A=A-1 // 15169
M=0 // 15170

////PushInstruction("constant 0")
@SP // 15171
AM=M+1 // 15172
A=A-1 // 15173
M=0 // 15174

////PushInstruction("constant 0")
@SP // 15175
AM=M+1 // 15176
A=A-1 // 15177
M=0 // 15178

////PushInstruction("constant 30")
@30 // 15179
D=A // 15180
@SP // 15181
AM=M+1 // 15182
A=A-1 // 15183
M=D // 15184

////PushInstruction("constant 51")
@51 // 15185
D=A // 15186
@SP // 15187
AM=M+1 // 15188
A=A-1 // 15189
M=D // 15190

////PushInstruction("constant 6")
@6 // 15191
D=A // 15192
@SP // 15193
AM=M+1 // 15194
A=A-1 // 15195
M=D // 15196

////PushInstruction("constant 24")
@24 // 15197
D=A // 15198
@SP // 15199
AM=M+1 // 15200
A=A-1 // 15201
M=D // 15202

////PushInstruction("constant 51")
@51 // 15203
D=A // 15204
@SP // 15205
AM=M+1 // 15206
A=A-1 // 15207
M=D // 15208

////PushInstruction("constant 30")
@30 // 15209
D=A // 15210
@SP // 15211
AM=M+1 // 15212
A=A-1 // 15213
M=D // 15214

////PushInstruction("constant 0")
@SP // 15215
AM=M+1 // 15216
A=A-1 // 15217
M=0 // 15218

////PushInstruction("constant 0")
@SP // 15219
AM=M+1 // 15220
A=A-1 // 15221
M=0 // 15222

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=85}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15223
D=A // 15224
@14 // 15225
M=D // 15226
@Output.create // 15227
D=A // 15228
@13 // 15229
M=D // 15230
@Output.initMap.ret.85 // 15231
D=A // 15232
@CALL // 15233
0;JMP // 15234
(Output.initMap.ret.85)

////PopInstruction{address=temp 0}
@SP // 15235
AM=M-1 // 15236
D=M // 15237
@5 // 15238
M=D // 15239

////PushInstruction("constant 116")
@116 // 15240
D=A // 15241
@SP // 15242
AM=M+1 // 15243
A=A-1 // 15244
M=D // 15245

////PushInstruction("constant 4")
@4 // 15246
D=A // 15247
@SP // 15248
AM=M+1 // 15249
A=A-1 // 15250
M=D // 15251

////PushInstruction("constant 6")
@6 // 15252
D=A // 15253
@SP // 15254
AM=M+1 // 15255
A=A-1 // 15256
M=D // 15257

////PushInstruction("constant 6")
@6 // 15258
D=A // 15259
@SP // 15260
AM=M+1 // 15261
A=A-1 // 15262
M=D // 15263

////PushInstruction("constant 15")
@15 // 15264
D=A // 15265
@SP // 15266
AM=M+1 // 15267
A=A-1 // 15268
M=D // 15269

////PushInstruction("constant 6")
@6 // 15270
D=A // 15271
@SP // 15272
AM=M+1 // 15273
A=A-1 // 15274
M=D // 15275

////PushInstruction("constant 6")
@6 // 15276
D=A // 15277
@SP // 15278
AM=M+1 // 15279
A=A-1 // 15280
M=D // 15281

////PushInstruction("constant 6")
@6 // 15282
D=A // 15283
@SP // 15284
AM=M+1 // 15285
A=A-1 // 15286
M=D // 15287

////PushInstruction("constant 54")
@54 // 15288
D=A // 15289
@SP // 15290
AM=M+1 // 15291
A=A-1 // 15292
M=D // 15293

////PushInstruction("constant 28")
@28 // 15294
D=A // 15295
@SP // 15296
AM=M+1 // 15297
A=A-1 // 15298
M=D // 15299

////PushInstruction("constant 0")
@SP // 15300
AM=M+1 // 15301
A=A-1 // 15302
M=0 // 15303

////PushInstruction("constant 0")
@SP // 15304
AM=M+1 // 15305
A=A-1 // 15306
M=0 // 15307

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=86}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15308
D=A // 15309
@14 // 15310
M=D // 15311
@Output.create // 15312
D=A // 15313
@13 // 15314
M=D // 15315
@Output.initMap.ret.86 // 15316
D=A // 15317
@CALL // 15318
0;JMP // 15319
(Output.initMap.ret.86)

////PopInstruction{address=temp 0}
@SP // 15320
AM=M-1 // 15321
D=M // 15322
@5 // 15323
M=D // 15324

////PushInstruction("constant 117")
@117 // 15325
D=A // 15326
@SP // 15327
AM=M+1 // 15328
A=A-1 // 15329
M=D // 15330

////PushInstruction("constant 0")
@SP // 15331
AM=M+1 // 15332
A=A-1 // 15333
M=0 // 15334

////PushInstruction("constant 0")
@SP // 15335
AM=M+1 // 15336
A=A-1 // 15337
M=0 // 15338

////PushInstruction("constant 0")
@SP // 15339
AM=M+1 // 15340
A=A-1 // 15341
M=0 // 15342

////PushInstruction("constant 27")
@27 // 15343
D=A // 15344
@SP // 15345
AM=M+1 // 15346
A=A-1 // 15347
M=D // 15348

////PushInstruction("constant 27")
@27 // 15349
D=A // 15350
@SP // 15351
AM=M+1 // 15352
A=A-1 // 15353
M=D // 15354

////PushInstruction("constant 27")
@27 // 15355
D=A // 15356
@SP // 15357
AM=M+1 // 15358
A=A-1 // 15359
M=D // 15360

////PushInstruction("constant 27")
@27 // 15361
D=A // 15362
@SP // 15363
AM=M+1 // 15364
A=A-1 // 15365
M=D // 15366

////PushInstruction("constant 27")
@27 // 15367
D=A // 15368
@SP // 15369
AM=M+1 // 15370
A=A-1 // 15371
M=D // 15372

////PushInstruction("constant 54")
@54 // 15373
D=A // 15374
@SP // 15375
AM=M+1 // 15376
A=A-1 // 15377
M=D // 15378

////PushInstruction("constant 0")
@SP // 15379
AM=M+1 // 15380
A=A-1 // 15381
M=0 // 15382

////PushInstruction("constant 0")
@SP // 15383
AM=M+1 // 15384
A=A-1 // 15385
M=0 // 15386

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=87}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15387
D=A // 15388
@14 // 15389
M=D // 15390
@Output.create // 15391
D=A // 15392
@13 // 15393
M=D // 15394
@Output.initMap.ret.87 // 15395
D=A // 15396
@CALL // 15397
0;JMP // 15398
(Output.initMap.ret.87)

////PopInstruction{address=temp 0}
@SP // 15399
AM=M-1 // 15400
D=M // 15401
@5 // 15402
M=D // 15403

////PushInstruction("constant 118")
@118 // 15404
D=A // 15405
@SP // 15406
AM=M+1 // 15407
A=A-1 // 15408
M=D // 15409

////PushInstruction("constant 0")
@SP // 15410
AM=M+1 // 15411
A=A-1 // 15412
M=0 // 15413

////PushInstruction("constant 0")
@SP // 15414
AM=M+1 // 15415
A=A-1 // 15416
M=0 // 15417

////PushInstruction("constant 0")
@SP // 15418
AM=M+1 // 15419
A=A-1 // 15420
M=0 // 15421

////PushInstruction("constant 51")
@51 // 15422
D=A // 15423
@SP // 15424
AM=M+1 // 15425
A=A-1 // 15426
M=D // 15427

////PushInstruction("constant 51")
@51 // 15428
D=A // 15429
@SP // 15430
AM=M+1 // 15431
A=A-1 // 15432
M=D // 15433

////PushInstruction("constant 51")
@51 // 15434
D=A // 15435
@SP // 15436
AM=M+1 // 15437
A=A-1 // 15438
M=D // 15439

////PushInstruction("constant 51")
@51 // 15440
D=A // 15441
@SP // 15442
AM=M+1 // 15443
A=A-1 // 15444
M=D // 15445

////PushInstruction("constant 30")
@30 // 15446
D=A // 15447
@SP // 15448
AM=M+1 // 15449
A=A-1 // 15450
M=D // 15451

////PushInstruction("constant 12")
@12 // 15452
D=A // 15453
@SP // 15454
AM=M+1 // 15455
A=A-1 // 15456
M=D // 15457

////PushInstruction("constant 0")
@SP // 15458
AM=M+1 // 15459
A=A-1 // 15460
M=0 // 15461

////PushInstruction("constant 0")
@SP // 15462
AM=M+1 // 15463
A=A-1 // 15464
M=0 // 15465

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=88}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15466
D=A // 15467
@14 // 15468
M=D // 15469
@Output.create // 15470
D=A // 15471
@13 // 15472
M=D // 15473
@Output.initMap.ret.88 // 15474
D=A // 15475
@CALL // 15476
0;JMP // 15477
(Output.initMap.ret.88)

////PopInstruction{address=temp 0}
@SP // 15478
AM=M-1 // 15479
D=M // 15480
@5 // 15481
M=D // 15482

////PushInstruction("constant 119")
@119 // 15483
D=A // 15484
@SP // 15485
AM=M+1 // 15486
A=A-1 // 15487
M=D // 15488

////PushInstruction("constant 0")
@SP // 15489
AM=M+1 // 15490
A=A-1 // 15491
M=0 // 15492

////PushInstruction("constant 0")
@SP // 15493
AM=M+1 // 15494
A=A-1 // 15495
M=0 // 15496

////PushInstruction("constant 0")
@SP // 15497
AM=M+1 // 15498
A=A-1 // 15499
M=0 // 15500

////PushInstruction("constant 51")
@51 // 15501
D=A // 15502
@SP // 15503
AM=M+1 // 15504
A=A-1 // 15505
M=D // 15506

////PushInstruction("constant 51")
@51 // 15507
D=A // 15508
@SP // 15509
AM=M+1 // 15510
A=A-1 // 15511
M=D // 15512

////PushInstruction("constant 51")
@51 // 15513
D=A // 15514
@SP // 15515
AM=M+1 // 15516
A=A-1 // 15517
M=D // 15518

////PushInstruction("constant 63")
@63 // 15519
D=A // 15520
@SP // 15521
AM=M+1 // 15522
A=A-1 // 15523
M=D // 15524

////PushInstruction("constant 63")
@63 // 15525
D=A // 15526
@SP // 15527
AM=M+1 // 15528
A=A-1 // 15529
M=D // 15530

////PushInstruction("constant 18")
@18 // 15531
D=A // 15532
@SP // 15533
AM=M+1 // 15534
A=A-1 // 15535
M=D // 15536

////PushInstruction("constant 0")
@SP // 15537
AM=M+1 // 15538
A=A-1 // 15539
M=0 // 15540

////PushInstruction("constant 0")
@SP // 15541
AM=M+1 // 15542
A=A-1 // 15543
M=0 // 15544

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=89}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15545
D=A // 15546
@14 // 15547
M=D // 15548
@Output.create // 15549
D=A // 15550
@13 // 15551
M=D // 15552
@Output.initMap.ret.89 // 15553
D=A // 15554
@CALL // 15555
0;JMP // 15556
(Output.initMap.ret.89)

////PopInstruction{address=temp 0}
@SP // 15557
AM=M-1 // 15558
D=M // 15559
@5 // 15560
M=D // 15561

////PushInstruction("constant 120")
@120 // 15562
D=A // 15563
@SP // 15564
AM=M+1 // 15565
A=A-1 // 15566
M=D // 15567

////PushInstruction("constant 0")
@SP // 15568
AM=M+1 // 15569
A=A-1 // 15570
M=0 // 15571

////PushInstruction("constant 0")
@SP // 15572
AM=M+1 // 15573
A=A-1 // 15574
M=0 // 15575

////PushInstruction("constant 0")
@SP // 15576
AM=M+1 // 15577
A=A-1 // 15578
M=0 // 15579

////PushInstruction("constant 51")
@51 // 15580
D=A // 15581
@SP // 15582
AM=M+1 // 15583
A=A-1 // 15584
M=D // 15585

////PushInstruction("constant 30")
@30 // 15586
D=A // 15587
@SP // 15588
AM=M+1 // 15589
A=A-1 // 15590
M=D // 15591

////PushInstruction("constant 12")
@12 // 15592
D=A // 15593
@SP // 15594
AM=M+1 // 15595
A=A-1 // 15596
M=D // 15597

////PushInstruction("constant 12")
@12 // 15598
D=A // 15599
@SP // 15600
AM=M+1 // 15601
A=A-1 // 15602
M=D // 15603

////PushInstruction("constant 30")
@30 // 15604
D=A // 15605
@SP // 15606
AM=M+1 // 15607
A=A-1 // 15608
M=D // 15609

////PushInstruction("constant 51")
@51 // 15610
D=A // 15611
@SP // 15612
AM=M+1 // 15613
A=A-1 // 15614
M=D // 15615

////PushInstruction("constant 0")
@SP // 15616
AM=M+1 // 15617
A=A-1 // 15618
M=0 // 15619

////PushInstruction("constant 0")
@SP // 15620
AM=M+1 // 15621
A=A-1 // 15622
M=0 // 15623

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=90}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15624
D=A // 15625
@14 // 15626
M=D // 15627
@Output.create // 15628
D=A // 15629
@13 // 15630
M=D // 15631
@Output.initMap.ret.90 // 15632
D=A // 15633
@CALL // 15634
0;JMP // 15635
(Output.initMap.ret.90)

////PopInstruction{address=temp 0}
@SP // 15636
AM=M-1 // 15637
D=M // 15638
@5 // 15639
M=D // 15640

////PushInstruction("constant 121")
@121 // 15641
D=A // 15642
@SP // 15643
AM=M+1 // 15644
A=A-1 // 15645
M=D // 15646

////PushInstruction("constant 0")
@SP // 15647
AM=M+1 // 15648
A=A-1 // 15649
M=0 // 15650

////PushInstruction("constant 0")
@SP // 15651
AM=M+1 // 15652
A=A-1 // 15653
M=0 // 15654

////PushInstruction("constant 0")
@SP // 15655
AM=M+1 // 15656
A=A-1 // 15657
M=0 // 15658

////PushInstruction("constant 51")
@51 // 15659
D=A // 15660
@SP // 15661
AM=M+1 // 15662
A=A-1 // 15663
M=D // 15664

////PushInstruction("constant 51")
@51 // 15665
D=A // 15666
@SP // 15667
AM=M+1 // 15668
A=A-1 // 15669
M=D // 15670

////PushInstruction("constant 51")
@51 // 15671
D=A // 15672
@SP // 15673
AM=M+1 // 15674
A=A-1 // 15675
M=D // 15676

////PushInstruction("constant 62")
@62 // 15677
D=A // 15678
@SP // 15679
AM=M+1 // 15680
A=A-1 // 15681
M=D // 15682

////PushInstruction("constant 48")
@48 // 15683
D=A // 15684
@SP // 15685
AM=M+1 // 15686
A=A-1 // 15687
M=D // 15688

////PushInstruction("constant 24")
@24 // 15689
D=A // 15690
@SP // 15691
AM=M+1 // 15692
A=A-1 // 15693
M=D // 15694

////PushInstruction("constant 15")
@15 // 15695
D=A // 15696
@SP // 15697
AM=M+1 // 15698
A=A-1 // 15699
M=D // 15700

////PushInstruction("constant 0")
@SP // 15701
AM=M+1 // 15702
A=A-1 // 15703
M=0 // 15704

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=91}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15705
D=A // 15706
@14 // 15707
M=D // 15708
@Output.create // 15709
D=A // 15710
@13 // 15711
M=D // 15712
@Output.initMap.ret.91 // 15713
D=A // 15714
@CALL // 15715
0;JMP // 15716
(Output.initMap.ret.91)

////PopInstruction{address=temp 0}
@SP // 15717
AM=M-1 // 15718
D=M // 15719
@5 // 15720
M=D // 15721

////PushInstruction("constant 122")
@122 // 15722
D=A // 15723
@SP // 15724
AM=M+1 // 15725
A=A-1 // 15726
M=D // 15727

////PushInstruction("constant 0")
@SP // 15728
AM=M+1 // 15729
A=A-1 // 15730
M=0 // 15731

////PushInstruction("constant 0")
@SP // 15732
AM=M+1 // 15733
A=A-1 // 15734
M=0 // 15735

////PushInstruction("constant 0")
@SP // 15736
AM=M+1 // 15737
A=A-1 // 15738
M=0 // 15739

////PushInstruction("constant 63")
@63 // 15740
D=A // 15741
@SP // 15742
AM=M+1 // 15743
A=A-1 // 15744
M=D // 15745

////PushInstruction("constant 27")
@27 // 15746
D=A // 15747
@SP // 15748
AM=M+1 // 15749
A=A-1 // 15750
M=D // 15751

////PushInstruction("constant 12")
@12 // 15752
D=A // 15753
@SP // 15754
AM=M+1 // 15755
A=A-1 // 15756
M=D // 15757

////PushInstruction("constant 6")
@6 // 15758
D=A // 15759
@SP // 15760
AM=M+1 // 15761
A=A-1 // 15762
M=D // 15763

////PushInstruction("constant 51")
@51 // 15764
D=A // 15765
@SP // 15766
AM=M+1 // 15767
A=A-1 // 15768
M=D // 15769

////PushInstruction("constant 63")
@63 // 15770
D=A // 15771
@SP // 15772
AM=M+1 // 15773
A=A-1 // 15774
M=D // 15775

////PushInstruction("constant 0")
@SP // 15776
AM=M+1 // 15777
A=A-1 // 15778
M=0 // 15779

////PushInstruction("constant 0")
@SP // 15780
AM=M+1 // 15781
A=A-1 // 15782
M=0 // 15783

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=92}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15784
D=A // 15785
@14 // 15786
M=D // 15787
@Output.create // 15788
D=A // 15789
@13 // 15790
M=D // 15791
@Output.initMap.ret.92 // 15792
D=A // 15793
@CALL // 15794
0;JMP // 15795
(Output.initMap.ret.92)

////PopInstruction{address=temp 0}
@SP // 15796
AM=M-1 // 15797
D=M // 15798
@5 // 15799
M=D // 15800

////PushInstruction("constant 123")
@123 // 15801
D=A // 15802
@SP // 15803
AM=M+1 // 15804
A=A-1 // 15805
M=D // 15806

////PushInstruction("constant 56")
@56 // 15807
D=A // 15808
@SP // 15809
AM=M+1 // 15810
A=A-1 // 15811
M=D // 15812

////PushInstruction("constant 12")
@12 // 15813
D=A // 15814
@SP // 15815
AM=M+1 // 15816
A=A-1 // 15817
M=D // 15818

////PushInstruction("constant 12")
@12 // 15819
D=A // 15820
@SP // 15821
AM=M+1 // 15822
A=A-1 // 15823
M=D // 15824

////PushInstruction("constant 12")
@12 // 15825
D=A // 15826
@SP // 15827
AM=M+1 // 15828
A=A-1 // 15829
M=D // 15830

////PushInstruction("constant 7")
@7 // 15831
D=A // 15832
@SP // 15833
AM=M+1 // 15834
A=A-1 // 15835
M=D // 15836

////PushInstruction("constant 12")
@12 // 15837
D=A // 15838
@SP // 15839
AM=M+1 // 15840
A=A-1 // 15841
M=D // 15842

////PushInstruction("constant 12")
@12 // 15843
D=A // 15844
@SP // 15845
AM=M+1 // 15846
A=A-1 // 15847
M=D // 15848

////PushInstruction("constant 12")
@12 // 15849
D=A // 15850
@SP // 15851
AM=M+1 // 15852
A=A-1 // 15853
M=D // 15854

////PushInstruction("constant 56")
@56 // 15855
D=A // 15856
@SP // 15857
AM=M+1 // 15858
A=A-1 // 15859
M=D // 15860

////PushInstruction("constant 0")
@SP // 15861
AM=M+1 // 15862
A=A-1 // 15863
M=0 // 15864

////PushInstruction("constant 0")
@SP // 15865
AM=M+1 // 15866
A=A-1 // 15867
M=0 // 15868

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=93}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15869
D=A // 15870
@14 // 15871
M=D // 15872
@Output.create // 15873
D=A // 15874
@13 // 15875
M=D // 15876
@Output.initMap.ret.93 // 15877
D=A // 15878
@CALL // 15879
0;JMP // 15880
(Output.initMap.ret.93)

////PopInstruction{address=temp 0}
@SP // 15881
AM=M-1 // 15882
D=M // 15883
@5 // 15884
M=D // 15885

////PushInstruction("constant 124")
@124 // 15886
D=A // 15887
@SP // 15888
AM=M+1 // 15889
A=A-1 // 15890
M=D // 15891

////PushInstruction("constant 12")
@12 // 15892
D=A // 15893
@SP // 15894
AM=M+1 // 15895
A=A-1 // 15896
M=D // 15897

////PushInstruction("constant 12")
@12 // 15898
D=A // 15899
@SP // 15900
AM=M+1 // 15901
A=A-1 // 15902
M=D // 15903

////PushInstruction("constant 12")
@12 // 15904
D=A // 15905
@SP // 15906
AM=M+1 // 15907
A=A-1 // 15908
M=D // 15909

////PushInstruction("constant 12")
@12 // 15910
D=A // 15911
@SP // 15912
AM=M+1 // 15913
A=A-1 // 15914
M=D // 15915

////PushInstruction("constant 12")
@12 // 15916
D=A // 15917
@SP // 15918
AM=M+1 // 15919
A=A-1 // 15920
M=D // 15921

////PushInstruction("constant 12")
@12 // 15922
D=A // 15923
@SP // 15924
AM=M+1 // 15925
A=A-1 // 15926
M=D // 15927

////PushInstruction("constant 12")
@12 // 15928
D=A // 15929
@SP // 15930
AM=M+1 // 15931
A=A-1 // 15932
M=D // 15933

////PushInstruction("constant 12")
@12 // 15934
D=A // 15935
@SP // 15936
AM=M+1 // 15937
A=A-1 // 15938
M=D // 15939

////PushInstruction("constant 12")
@12 // 15940
D=A // 15941
@SP // 15942
AM=M+1 // 15943
A=A-1 // 15944
M=D // 15945

////PushInstruction("constant 0")
@SP // 15946
AM=M+1 // 15947
A=A-1 // 15948
M=0 // 15949

////PushInstruction("constant 0")
@SP // 15950
AM=M+1 // 15951
A=A-1 // 15952
M=0 // 15953

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=94}, currentFunction='Output.initMap'}
// call Output.create
@17 // 15954
D=A // 15955
@14 // 15956
M=D // 15957
@Output.create // 15958
D=A // 15959
@13 // 15960
M=D // 15961
@Output.initMap.ret.94 // 15962
D=A // 15963
@CALL // 15964
0;JMP // 15965
(Output.initMap.ret.94)

////PopInstruction{address=temp 0}
@SP // 15966
AM=M-1 // 15967
D=M // 15968
@5 // 15969
M=D // 15970

////PushInstruction("constant 125")
@125 // 15971
D=A // 15972
@SP // 15973
AM=M+1 // 15974
A=A-1 // 15975
M=D // 15976

////PushInstruction("constant 7")
@7 // 15977
D=A // 15978
@SP // 15979
AM=M+1 // 15980
A=A-1 // 15981
M=D // 15982

////PushInstruction("constant 12")
@12 // 15983
D=A // 15984
@SP // 15985
AM=M+1 // 15986
A=A-1 // 15987
M=D // 15988

////PushInstruction("constant 12")
@12 // 15989
D=A // 15990
@SP // 15991
AM=M+1 // 15992
A=A-1 // 15993
M=D // 15994

////PushInstruction("constant 12")
@12 // 15995
D=A // 15996
@SP // 15997
AM=M+1 // 15998
A=A-1 // 15999
M=D // 16000

////PushInstruction("constant 56")
@56 // 16001
D=A // 16002
@SP // 16003
AM=M+1 // 16004
A=A-1 // 16005
M=D // 16006

////PushInstruction("constant 12")
@12 // 16007
D=A // 16008
@SP // 16009
AM=M+1 // 16010
A=A-1 // 16011
M=D // 16012

////PushInstruction("constant 12")
@12 // 16013
D=A // 16014
@SP // 16015
AM=M+1 // 16016
A=A-1 // 16017
M=D // 16018

////PushInstruction("constant 12")
@12 // 16019
D=A // 16020
@SP // 16021
AM=M+1 // 16022
A=A-1 // 16023
M=D // 16024

////PushInstruction("constant 7")
@7 // 16025
D=A // 16026
@SP // 16027
AM=M+1 // 16028
A=A-1 // 16029
M=D // 16030

////PushInstruction("constant 0")
@SP // 16031
AM=M+1 // 16032
A=A-1 // 16033
M=0 // 16034

////PushInstruction("constant 0")
@SP // 16035
AM=M+1 // 16036
A=A-1 // 16037
M=0 // 16038

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=95}, currentFunction='Output.initMap'}
// call Output.create
@17 // 16039
D=A // 16040
@14 // 16041
M=D // 16042
@Output.create // 16043
D=A // 16044
@13 // 16045
M=D // 16046
@Output.initMap.ret.95 // 16047
D=A // 16048
@CALL // 16049
0;JMP // 16050
(Output.initMap.ret.95)

////PopInstruction{address=temp 0}
@SP // 16051
AM=M-1 // 16052
D=M // 16053
@5 // 16054
M=D // 16055

////PushInstruction("constant 126")
@126 // 16056
D=A // 16057
@SP // 16058
AM=M+1 // 16059
A=A-1 // 16060
M=D // 16061

////PushInstruction("constant 38")
@38 // 16062
D=A // 16063
@SP // 16064
AM=M+1 // 16065
A=A-1 // 16066
M=D // 16067

////PushInstruction("constant 45")
@45 // 16068
D=A // 16069
@SP // 16070
AM=M+1 // 16071
A=A-1 // 16072
M=D // 16073

////PushInstruction("constant 25")
@25 // 16074
D=A // 16075
@SP // 16076
AM=M+1 // 16077
A=A-1 // 16078
M=D // 16079

////PushInstruction("constant 0")
@SP // 16080
AM=M+1 // 16081
A=A-1 // 16082
M=0 // 16083

////PushInstruction("constant 0")
@SP // 16084
AM=M+1 // 16085
A=A-1 // 16086
M=0 // 16087

////PushInstruction("constant 0")
@SP // 16088
AM=M+1 // 16089
A=A-1 // 16090
M=0 // 16091

////PushInstruction("constant 0")
@SP // 16092
AM=M+1 // 16093
A=A-1 // 16094
M=0 // 16095

////PushInstruction("constant 0")
@SP // 16096
AM=M+1 // 16097
A=A-1 // 16098
M=0 // 16099

////PushInstruction("constant 0")
@SP // 16100
AM=M+1 // 16101
A=A-1 // 16102
M=0 // 16103

////PushInstruction("constant 0")
@SP // 16104
AM=M+1 // 16105
A=A-1 // 16106
M=0 // 16107

////PushInstruction("constant 0")
@SP // 16108
AM=M+1 // 16109
A=A-1 // 16110
M=0 // 16111

////CallInstruction{calleeFunction='Output.create', numArgs=12, funcMapping={Output.init=1, Output.initMap=96}, currentFunction='Output.initMap'}
// call Output.create
@17 // 16112
D=A // 16113
@14 // 16114
M=D // 16115
@Output.create // 16116
D=A // 16117
@13 // 16118
M=D // 16119
@Output.initMap.ret.96 // 16120
D=A // 16121
@CALL // 16122
0;JMP // 16123
(Output.initMap.ret.96)

////PopInstruction{address=temp 0}
@SP // 16124
AM=M-1 // 16125
D=M // 16126
@5 // 16127
M=D // 16128

////PushInstruction("constant 0")
@SP // 16129
AM=M+1 // 16130
A=A-1 // 16131
M=0 // 16132

////ReturnInstruction{}
@RETURN // 16133
0;JMP // 16134

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.init=1, Output.initMap=97}}
// function Output.create with 1
(Output.create)
@SP // 16135
AM=M+1 // 16136
A=A-1 // 16137
M=0 // 16138

////PushInstruction("constant 11")
@11 // 16139
D=A // 16140
@SP // 16141
AM=M+1 // 16142
A=A-1 // 16143
M=D // 16144

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.create=0}, currentFunction='Output.create'}
// call Array.new
@6 // 16145
D=A // 16146
@14 // 16147
M=D // 16148
@Array.new // 16149
D=A // 16150
@13 // 16151
M=D // 16152
@Output.create.ret.0 // 16153
D=A // 16154
@CALL // 16155
0;JMP // 16156
(Output.create.ret.0)

////PopInstruction{address=local 0}
@SP // 16157
AM=M-1 // 16158
D=M // 16159
@LCL // 16160
A=M // 16161
M=D // 16162

////PushInstruction("local 0")
@LCL // 16163
A=M // 16164
D=M // 16165
@SP // 16166
AM=M+1 // 16167
A=A-1 // 16168
M=D // 16169

////PushInstruction("static 0")
@Output.0 // 16170
D=M // 16171
@SP // 16172
AM=M+1 // 16173
A=A-1 // 16174
M=D // 16175

////PushInstruction("argument 0")
@ARG // 16176
A=M // 16177
D=M // 16178
@SP // 16179
AM=M+1 // 16180
A=A-1 // 16181
M=D // 16182

////ArithmeticInstruction{ADD}
@SP // 16183
AM=M-1 // 16184
D=M // 16185
A=A-1 // 16186
D=D+M // 16187

////PopInstruction{address=pointer 1}
@SP // 16188
AM=M-1 // 16189
D=M // 16190
@4 // 16191
M=D // 16192

////PopInstruction{address=that 0}
@SP // 16193
AM=M-1 // 16194
D=M // 16195
@THAT // 16196
A=M // 16197
M=D // 16198

////PushInstruction("argument 1")
@ARG // 16199
A=M+1 // 16200
D=M // 16201
@SP // 16202
AM=M+1 // 16203
A=A-1 // 16204
M=D // 16205

////PushInstruction("local 0")
@LCL // 16206
A=M // 16207
D=M // 16208
@SP // 16209
AM=M+1 // 16210
A=A-1 // 16211
M=D // 16212

////PushInstruction("constant 0")
@SP // 16213
AM=M+1 // 16214
A=A-1 // 16215
M=0 // 16216

////ArithmeticInstruction{ADD}
@SP // 16217
AM=M-1 // 16218
D=M // 16219
A=A-1 // 16220
D=D+M // 16221

////PopInstruction{address=pointer 1}
@SP // 16222
AM=M-1 // 16223
D=M // 16224
@4 // 16225
M=D // 16226

////PopInstruction{address=that 0}
@SP // 16227
AM=M-1 // 16228
D=M // 16229
@THAT // 16230
A=M // 16231
M=D // 16232

////PushInstruction("argument 2")
@ARG // 16233
A=M+1 // 16234
A=A+1 // 16235
D=M // 16236
@SP // 16237
AM=M+1 // 16238
A=A-1 // 16239
M=D // 16240

////PushInstruction("local 0")
@LCL // 16241
A=M // 16242
D=M // 16243
@SP // 16244
AM=M+1 // 16245
A=A-1 // 16246
M=D // 16247

////PushInstruction("constant 1")
@SP // 16248
AM=M+1 // 16249
A=A-1 // 16250
M=1 // 16251

////ArithmeticInstruction{ADD}
@SP // 16252
AM=M-1 // 16253
D=M // 16254
A=A-1 // 16255
D=D+M // 16256

////PopInstruction{address=pointer 1}
@SP // 16257
AM=M-1 // 16258
D=M // 16259
@4 // 16260
M=D // 16261

////PopInstruction{address=that 0}
@SP // 16262
AM=M-1 // 16263
D=M // 16264
@THAT // 16265
A=M // 16266
M=D // 16267

////PushInstruction("argument 3")
@ARG // 16268
A=M+1 // 16269
A=A+1 // 16270
A=A+1 // 16271
D=M // 16272
@SP // 16273
AM=M+1 // 16274
A=A-1 // 16275
M=D // 16276

////PushInstruction("local 0")
@LCL // 16277
A=M // 16278
D=M // 16279
@SP // 16280
AM=M+1 // 16281
A=A-1 // 16282
M=D // 16283

////PushInstruction("constant 2")
@2 // 16284
D=A // 16285
@SP // 16286
AM=M+1 // 16287
A=A-1 // 16288
M=D // 16289

////ArithmeticInstruction{ADD}
@SP // 16290
AM=M-1 // 16291
D=M // 16292
A=A-1 // 16293
D=D+M // 16294

////PopInstruction{address=pointer 1}
@SP // 16295
AM=M-1 // 16296
D=M // 16297
@4 // 16298
M=D // 16299

////PopInstruction{address=that 0}
@SP // 16300
AM=M-1 // 16301
D=M // 16302
@THAT // 16303
A=M // 16304
M=D // 16305

////PushInstruction("argument 4")
@ARG // 16306
D=M // 16307
@4 // 16308
A=D+A // 16309
D=M // 16310
@SP // 16311
AM=M+1 // 16312
A=A-1 // 16313
M=D // 16314

////PushInstruction("local 0")
@LCL // 16315
A=M // 16316
D=M // 16317
@SP // 16318
AM=M+1 // 16319
A=A-1 // 16320
M=D // 16321

////PushInstruction("constant 3")
@3 // 16322
D=A // 16323
@SP // 16324
AM=M+1 // 16325
A=A-1 // 16326
M=D // 16327

////ArithmeticInstruction{ADD}
@SP // 16328
AM=M-1 // 16329
D=M // 16330
A=A-1 // 16331
D=D+M // 16332

////PopInstruction{address=pointer 1}
@SP // 16333
AM=M-1 // 16334
D=M // 16335
@4 // 16336
M=D // 16337

////PopInstruction{address=that 0}
@SP // 16338
AM=M-1 // 16339
D=M // 16340
@THAT // 16341
A=M // 16342
M=D // 16343

////PushInstruction("argument 5")
@ARG // 16344
D=M // 16345
@5 // 16346
A=D+A // 16347
D=M // 16348
@SP // 16349
AM=M+1 // 16350
A=A-1 // 16351
M=D // 16352

////PushInstruction("local 0")
@LCL // 16353
A=M // 16354
D=M // 16355
@SP // 16356
AM=M+1 // 16357
A=A-1 // 16358
M=D // 16359

////PushInstruction("constant 4")
@4 // 16360
D=A // 16361
@SP // 16362
AM=M+1 // 16363
A=A-1 // 16364
M=D // 16365

////ArithmeticInstruction{ADD}
@SP // 16366
AM=M-1 // 16367
D=M // 16368
A=A-1 // 16369
D=D+M // 16370

////PopInstruction{address=pointer 1}
@SP // 16371
AM=M-1 // 16372
D=M // 16373
@4 // 16374
M=D // 16375

////PopInstruction{address=that 0}
@SP // 16376
AM=M-1 // 16377
D=M // 16378
@THAT // 16379
A=M // 16380
M=D // 16381

////PushInstruction("argument 6")
@ARG // 16382
D=M // 16383
@6 // 16384
A=D+A // 16385
D=M // 16386
@SP // 16387
AM=M+1 // 16388
A=A-1 // 16389
M=D // 16390

////PushInstruction("local 0")
@LCL // 16391
A=M // 16392
D=M // 16393
@SP // 16394
AM=M+1 // 16395
A=A-1 // 16396
M=D // 16397

////PushInstruction("constant 5")
@5 // 16398
D=A // 16399
@SP // 16400
AM=M+1 // 16401
A=A-1 // 16402
M=D // 16403

////ArithmeticInstruction{ADD}
@SP // 16404
AM=M-1 // 16405
D=M // 16406
A=A-1 // 16407
D=D+M // 16408

////PopInstruction{address=pointer 1}
@SP // 16409
AM=M-1 // 16410
D=M // 16411
@4 // 16412
M=D // 16413

////PopInstruction{address=that 0}
@SP // 16414
AM=M-1 // 16415
D=M // 16416
@THAT // 16417
A=M // 16418
M=D // 16419

////PushInstruction("argument 7")
@ARG // 16420
D=M // 16421
@7 // 16422
A=D+A // 16423
D=M // 16424
@SP // 16425
AM=M+1 // 16426
A=A-1 // 16427
M=D // 16428

////PushInstruction("local 0")
@LCL // 16429
A=M // 16430
D=M // 16431
@SP // 16432
AM=M+1 // 16433
A=A-1 // 16434
M=D // 16435

////PushInstruction("constant 6")
@6 // 16436
D=A // 16437
@SP // 16438
AM=M+1 // 16439
A=A-1 // 16440
M=D // 16441

////ArithmeticInstruction{ADD}
@SP // 16442
AM=M-1 // 16443
D=M // 16444
A=A-1 // 16445
D=D+M // 16446

////PopInstruction{address=pointer 1}
@SP // 16447
AM=M-1 // 16448
D=M // 16449
@4 // 16450
M=D // 16451

////PopInstruction{address=that 0}
@SP // 16452
AM=M-1 // 16453
D=M // 16454
@THAT // 16455
A=M // 16456
M=D // 16457

////PushInstruction("argument 8")
@ARG // 16458
D=M // 16459
@8 // 16460
A=D+A // 16461
D=M // 16462
@SP // 16463
AM=M+1 // 16464
A=A-1 // 16465
M=D // 16466

////PushInstruction("local 0")
@LCL // 16467
A=M // 16468
D=M // 16469
@SP // 16470
AM=M+1 // 16471
A=A-1 // 16472
M=D // 16473

////PushInstruction("constant 7")
@7 // 16474
D=A // 16475
@SP // 16476
AM=M+1 // 16477
A=A-1 // 16478
M=D // 16479

////ArithmeticInstruction{ADD}
@SP // 16480
AM=M-1 // 16481
D=M // 16482
A=A-1 // 16483
D=D+M // 16484

////PopInstruction{address=pointer 1}
@SP // 16485
AM=M-1 // 16486
D=M // 16487
@4 // 16488
M=D // 16489

////PopInstruction{address=that 0}
@SP // 16490
AM=M-1 // 16491
D=M // 16492
@THAT // 16493
A=M // 16494
M=D // 16495

////PushInstruction("argument 9")
@ARG // 16496
D=M // 16497
@9 // 16498
A=D+A // 16499
D=M // 16500
@SP // 16501
AM=M+1 // 16502
A=A-1 // 16503
M=D // 16504

////PushInstruction("local 0")
@LCL // 16505
A=M // 16506
D=M // 16507
@SP // 16508
AM=M+1 // 16509
A=A-1 // 16510
M=D // 16511

////PushInstruction("constant 8")
@8 // 16512
D=A // 16513
@SP // 16514
AM=M+1 // 16515
A=A-1 // 16516
M=D // 16517

////ArithmeticInstruction{ADD}
@SP // 16518
AM=M-1 // 16519
D=M // 16520
A=A-1 // 16521
D=D+M // 16522

////PopInstruction{address=pointer 1}
@SP // 16523
AM=M-1 // 16524
D=M // 16525
@4 // 16526
M=D // 16527

////PopInstruction{address=that 0}
@SP // 16528
AM=M-1 // 16529
D=M // 16530
@THAT // 16531
A=M // 16532
M=D // 16533

////PushInstruction("argument 10")
@ARG // 16534
D=M // 16535
@10 // 16536
A=D+A // 16537
D=M // 16538
@SP // 16539
AM=M+1 // 16540
A=A-1 // 16541
M=D // 16542

////PushInstruction("local 0")
@LCL // 16543
A=M // 16544
D=M // 16545
@SP // 16546
AM=M+1 // 16547
A=A-1 // 16548
M=D // 16549

////PushInstruction("constant 9")
@9 // 16550
D=A // 16551
@SP // 16552
AM=M+1 // 16553
A=A-1 // 16554
M=D // 16555

////ArithmeticInstruction{ADD}
@SP // 16556
AM=M-1 // 16557
D=M // 16558
A=A-1 // 16559
D=D+M // 16560

////PopInstruction{address=pointer 1}
@SP // 16561
AM=M-1 // 16562
D=M // 16563
@4 // 16564
M=D // 16565

////PopInstruction{address=that 0}
@SP // 16566
AM=M-1 // 16567
D=M // 16568
@THAT // 16569
A=M // 16570
M=D // 16571

////PushInstruction("argument 11")
@ARG // 16572
D=M // 16573
@11 // 16574
A=D+A // 16575
D=M // 16576
@SP // 16577
AM=M+1 // 16578
A=A-1 // 16579
M=D // 16580

////PushInstruction("local 0")
@LCL // 16581
A=M // 16582
D=M // 16583
@SP // 16584
AM=M+1 // 16585
A=A-1 // 16586
M=D // 16587

////PushInstruction("constant 10")
@10 // 16588
D=A // 16589
@SP // 16590
AM=M+1 // 16591
A=A-1 // 16592
M=D // 16593

////ArithmeticInstruction{ADD}
@SP // 16594
AM=M-1 // 16595
D=M // 16596
A=A-1 // 16597
D=D+M // 16598

////PopInstruction{address=pointer 1}
@SP // 16599
AM=M-1 // 16600
D=M // 16601
@4 // 16602
M=D // 16603

////PopInstruction{address=that 0}
@SP // 16604
AM=M-1 // 16605
D=M // 16606
@THAT // 16607
A=M // 16608
M=D // 16609

////PushInstruction("constant 0")
@SP // 16610
AM=M+1 // 16611
A=A-1 // 16612
M=0 // 16613

////ReturnInstruction{}
@RETURN // 16614
0;JMP // 16615

////FunctionInstruction{functionName='Output.getMap', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.create=1}}
// function Output.getMap with 0
(Output.getMap)

////PushInstruction("argument 0")
@ARG // 16616
A=M // 16617
D=M // 16618
@SP // 16619
AM=M+1 // 16620
A=A-1 // 16621
M=D // 16622

////PushInstruction("constant 32")
@32 // 16623
D=A // 16624
@SP // 16625
AM=M+1 // 16626
A=A-1 // 16627
M=D // 16628

////ArithmeticInstruction{LT}
@COMPARE_Output.getMap_lt0 // 16629
D=A // 16630
@13 // 16631
M=D // 16632
@SP // 16633
AM=M-1 // 16634
D=M // 16635
A=A-1 // 16636
D=M-D // 16637
@DO_LT // 16638
0;JMP // 16639
(COMPARE_Output.getMap_lt0)

////PushInstruction("argument 0")
@ARG // 16640
A=M // 16641
D=M // 16642
@SP // 16643
AM=M+1 // 16644
A=A-1 // 16645
M=D // 16646

////PushInstruction("constant 126")
@126 // 16647
D=A // 16648
@SP // 16649
AM=M+1 // 16650
A=A-1 // 16651
M=D // 16652

////ArithmeticInstruction{GT}
@COMPARE_Output.getMap_gt1 // 16653
D=A // 16654
@13 // 16655
M=D // 16656
@SP // 16657
AM=M-1 // 16658
D=M // 16659
A=A-1 // 16660
D=M-D // 16661
@DO_GT // 16662
0;JMP // 16663
(COMPARE_Output.getMap_gt1)

////ArithmeticInstruction{OR}
@SP // 16664
AM=M-1 // 16665
D=M // 16666
A=A-1 // 16667
D=D|M // 16668

////PushInstruction("constant 0")
@SP // 16669
AM=M+1 // 16670
A=A-1 // 16671
M=0 // 16672

////ArithmeticInstruction{EQ}
@COMPARE_Output.getMap_eq2 // 16673
D=A // 16674
@13 // 16675
M=D // 16676
@SP // 16677
AM=M-1 // 16678
D=M // 16679
A=A-1 // 16680
D=M-D // 16681
@DO_EQ // 16682
0;JMP // 16683
(COMPARE_Output.getMap_eq2)

////IfGotoInstruction{label='Output.getMap.IfElse1}
// if-goto Output.getMap.IfElse1
@SP // 16684
AM=M-1 // 16685
D=M // 16686
@Output.getMap.IfElse1 // 16687
D;JNE // 16688

////PushInstruction("constant 0")
@SP // 16689
AM=M+1 // 16690
A=A-1 // 16691
M=0 // 16692

////PopInstruction{address=argument 0}
@SP // 16693
AM=M-1 // 16694
D=M // 16695
@ARG // 16696
A=M // 16697
M=D // 16698

////GotoInstruction{label='Output.getMap.IfElseEND1}
// goto Output.getMap.IfElseEND1
@Output.getMap.IfElseEND1 // 16699
0;JMP // 16700

////LabelInstruction{label='Output.getMap.IfElse1}
// label Output.getMap.IfElse1
(Output.getMap.IfElse1)

////LabelInstruction{label='Output.getMap.IfElseEND1}
// label Output.getMap.IfElseEND1
(Output.getMap.IfElseEND1)

////PushInstruction("static 0")
@Output.0 // 16701
D=M // 16702
@SP // 16703
AM=M+1 // 16704
A=A-1 // 16705
M=D // 16706

////PushInstruction("argument 0")
@ARG // 16707
A=M // 16708
D=M // 16709
@SP // 16710
AM=M+1 // 16711
A=A-1 // 16712
M=D // 16713

////ArithmeticInstruction{ADD}
@SP // 16714
AM=M-1 // 16715
D=M // 16716
A=A-1 // 16717
D=D+M // 16718

////PopInstruction{address=pointer 1}
@SP // 16719
AM=M-1 // 16720
D=M // 16721
@4 // 16722
M=D // 16723

////PushInstruction("that 0")
@THAT // 16724
A=M // 16725
D=M // 16726
@SP // 16727
AM=M+1 // 16728
A=A-1 // 16729
M=D // 16730

////ReturnInstruction{}
@RETURN // 16731
0;JMP // 16732

////FunctionInstruction{functionName='Output.moveCursor', numLocals=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.create=1}}
// function Output.moveCursor with 0
(Output.moveCursor)

////PushInstruction("argument 1")
@ARG // 16733
A=M+1 // 16734
D=M // 16735
@SP // 16736
AM=M+1 // 16737
A=A-1 // 16738
M=D // 16739

////PopInstruction{address=Output.1}
@SP // 16740
AM=M-1 // 16741
D=M // 16742
@Output.1 // 16743
M=D // 16744

////PushInstruction("argument 0")
@ARG // 16745
A=M // 16746
D=M // 16747
@SP // 16748
AM=M+1 // 16749
A=A-1 // 16750
M=D // 16751

////PopInstruction{address=Output.2}
@SP // 16752
AM=M-1 // 16753
D=M // 16754
@Output.2 // 16755
M=D // 16756

////PushInstruction("constant 0")
@SP // 16757
AM=M+1 // 16758
A=A-1 // 16759
M=0 // 16760

////ReturnInstruction{}
@RETURN // 16761
0;JMP // 16762

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@SP // 16763
AM=M+1 // 16764
A=A-1 // 16765
M=0 // 16766
@SP // 16767
AM=M+1 // 16768
A=A-1 // 16769
M=0 // 16770
@SP // 16771
AM=M+1 // 16772
A=A-1 // 16773
M=0 // 16774
@SP // 16775
AM=M+1 // 16776
A=A-1 // 16777
M=0 // 16778

////PushInstruction("argument 0")
@ARG // 16779
A=M // 16780
D=M // 16781
@SP // 16782
AM=M+1 // 16783
A=A-1 // 16784
M=D // 16785

////CallInstruction{calleeFunction='Output.getMap', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=0, Output.create=1}, currentFunction='Output.printChar'}
// call Output.getMap
@6 // 16786
D=A // 16787
@14 // 16788
M=D // 16789
@Output.getMap // 16790
D=A // 16791
@13 // 16792
M=D // 16793
@Output.printChar.ret.0 // 16794
D=A // 16795
@CALL // 16796
0;JMP // 16797
(Output.printChar.ret.0)

////PopInstruction{address=local 0}
@SP // 16798
AM=M-1 // 16799
D=M // 16800
@LCL // 16801
A=M // 16802
M=D // 16803

////PushInstruction("constant 0")
@SP // 16804
AM=M+1 // 16805
A=A-1 // 16806
M=0 // 16807

////PopInstruction{address=local 3}
@SP // 16808
AM=M-1 // 16809
D=M // 16810
@LCL // 16811
A=M+1 // 16812
A=A+1 // 16813
A=A+1 // 16814
M=D // 16815

////LabelInstruction{label='WHILE_START_Output.printChar1}
// label WHILE_START_Output.printChar1
(WHILE_START_Output.printChar1)

////PushInstruction("local 3")
@LCL // 16816
A=M+1 // 16817
A=A+1 // 16818
A=A+1 // 16819
D=M // 16820
@SP // 16821
AM=M+1 // 16822
A=A-1 // 16823
M=D // 16824

////PushInstruction("constant 11")
@11 // 16825
D=A // 16826
@SP // 16827
AM=M+1 // 16828
A=A-1 // 16829
M=D // 16830

////ArithmeticInstruction{LT}
@COMPARE_Output.printChar_lt3 // 16831
D=A // 16832
@13 // 16833
M=D // 16834
@SP // 16835
AM=M-1 // 16836
D=M // 16837
A=A-1 // 16838
D=M-D // 16839
@DO_LT // 16840
0;JMP // 16841
(COMPARE_Output.printChar_lt3)

////PushInstruction("constant 0")
@SP // 16842
AM=M+1 // 16843
A=A-1 // 16844
M=0 // 16845

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq4 // 16846
D=A // 16847
@13 // 16848
M=D // 16849
@SP // 16850
AM=M-1 // 16851
D=M // 16852
A=A-1 // 16853
D=M-D // 16854
@DO_EQ // 16855
0;JMP // 16856
(COMPARE_Output.printChar_eq4)

////IfGotoInstruction{label='WHILE_END_Output.printChar1}
// if-goto WHILE_END_Output.printChar1
@SP // 16857
AM=M-1 // 16858
D=M // 16859
@WHILE_END_Output.printChar1 // 16860
D;JNE // 16861

////PushInstruction("constant 16384")
@16384 // 16862
D=A // 16863
@SP // 16864
AM=M+1 // 16865
A=A-1 // 16866
M=D // 16867

////PushInstruction("static 2")
@Output.2 // 16868
D=M // 16869
@SP // 16870
AM=M+1 // 16871
A=A-1 // 16872
M=D // 16873

////PushInstruction("constant 11")
@11 // 16874
D=A // 16875
@SP // 16876
AM=M+1 // 16877
A=A-1 // 16878
M=D // 16879

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=1, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16880
D=A // 16881
@14 // 16882
M=D // 16883
@Math.multiply // 16884
D=A // 16885
@13 // 16886
M=D // 16887
@Output.printChar.ret.1 // 16888
D=A // 16889
@CALL // 16890
0;JMP // 16891
(Output.printChar.ret.1)

////PushInstruction("local 3")
@LCL // 16892
A=M+1 // 16893
A=A+1 // 16894
A=A+1 // 16895
D=M // 16896
@SP // 16897
AM=M+1 // 16898
A=A-1 // 16899
M=D // 16900

////ArithmeticInstruction{ADD}
@SP // 16901
AM=M-1 // 16902
D=M // 16903
A=A-1 // 16904
D=D+M // 16905

////PushInstruction("constant 32")
@32 // 16906
D=A // 16907
@SP // 16908
AM=M+1 // 16909
A=A-1 // 16910
M=D // 16911

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=2, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 16912
D=A // 16913
@14 // 16914
M=D // 16915
@Math.multiply // 16916
D=A // 16917
@13 // 16918
M=D // 16919
@Output.printChar.ret.2 // 16920
D=A // 16921
@CALL // 16922
0;JMP // 16923
(Output.printChar.ret.2)

////ArithmeticInstruction{ADD}
@SP // 16924
AM=M-1 // 16925
D=M // 16926
A=A-1 // 16927
D=D+M // 16928

////PushInstruction("static 1")
@Output.1 // 16929
D=M // 16930
@SP // 16931
AM=M+1 // 16932
A=A-1 // 16933
M=D // 16934

////PushInstruction("constant 2")
@2 // 16935
D=A // 16936
@SP // 16937
AM=M+1 // 16938
A=A-1 // 16939
M=D // 16940

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=3, Output.create=1}, currentFunction='Output.printChar'}
// call Math.divide
@7 // 16941
D=A // 16942
@14 // 16943
M=D // 16944
@Math.divide // 16945
D=A // 16946
@13 // 16947
M=D // 16948
@Output.printChar.ret.3 // 16949
D=A // 16950
@CALL // 16951
0;JMP // 16952
(Output.printChar.ret.3)

////ArithmeticInstruction{ADD}
@SP // 16953
AM=M-1 // 16954
D=M // 16955
A=A-1 // 16956
D=D+M // 16957

////PopInstruction{address=local 1}
@SP // 16958
AM=M-1 // 16959
D=M // 16960
@LCL // 16961
A=M+1 // 16962
M=D // 16963

////PushInstruction("static 1")
@Output.1 // 16964
D=M // 16965
@SP // 16966
AM=M+1 // 16967
A=A-1 // 16968
M=D // 16969

////PushInstruction("constant 1")
@SP // 16970
AM=M+1 // 16971
A=A-1 // 16972
M=1 // 16973

////ArithmeticInstruction{AND}
@SP // 16974
AM=M-1 // 16975
D=M // 16976
A=A-1 // 16977
D=D&M // 16978

////PushInstruction("constant 0")
@SP // 16979
AM=M+1 // 16980
A=A-1 // 16981
M=0 // 16982

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq5 // 16983
D=A // 16984
@13 // 16985
M=D // 16986
@SP // 16987
AM=M-1 // 16988
D=M // 16989
A=A-1 // 16990
D=M-D // 16991
@DO_EQ // 16992
0;JMP // 16993
(COMPARE_Output.printChar_eq5)

////PushInstruction("constant 0")
@SP // 16994
AM=M+1 // 16995
A=A-1 // 16996
M=0 // 16997

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq6 // 16998
D=A // 16999
@13 // 17000
M=D // 17001
@SP // 17002
AM=M-1 // 17003
D=M // 17004
A=A-1 // 17005
D=M-D // 17006
@DO_EQ // 17007
0;JMP // 17008
(COMPARE_Output.printChar_eq6)

////IfGotoInstruction{label='Output.printChar.IfElse1}
// if-goto Output.printChar.IfElse1
@SP // 17009
AM=M-1 // 17010
D=M // 17011
@Output.printChar.IfElse1 // 17012
D;JNE // 17013

////PushInstruction("local 0")
@LCL // 17014
A=M // 17015
D=M // 17016
@SP // 17017
AM=M+1 // 17018
A=A-1 // 17019
M=D // 17020

////PushInstruction("local 3")
@LCL // 17021
A=M+1 // 17022
A=A+1 // 17023
A=A+1 // 17024
D=M // 17025
@SP // 17026
AM=M+1 // 17027
A=A-1 // 17028
M=D // 17029

////ArithmeticInstruction{ADD}
@SP // 17030
AM=M-1 // 17031
D=M // 17032
A=A-1 // 17033
D=D+M // 17034

////PopInstruction{address=pointer 1}
@SP // 17035
AM=M-1 // 17036
D=M // 17037
@4 // 17038
M=D // 17039

////PushInstruction("that 0")
@THAT // 17040
A=M // 17041
D=M // 17042
@SP // 17043
AM=M+1 // 17044
A=A-1 // 17045
M=D // 17046

////PopInstruction{address=local 2}
@SP // 17047
AM=M-1 // 17048
D=M // 17049
@LCL // 17050
A=M+1 // 17051
A=A+1 // 17052
M=D // 17053

////GotoInstruction{label='Output.printChar.IfElseEND1}
// goto Output.printChar.IfElseEND1
@Output.printChar.IfElseEND1 // 17054
0;JMP // 17055

////LabelInstruction{label='Output.printChar.IfElse1}
// label Output.printChar.IfElse1
(Output.printChar.IfElse1)

////PushInstruction("local 0")
@LCL // 17056
A=M // 17057
D=M // 17058
@SP // 17059
AM=M+1 // 17060
A=A-1 // 17061
M=D // 17062

////PushInstruction("local 3")
@LCL // 17063
A=M+1 // 17064
A=A+1 // 17065
A=A+1 // 17066
D=M // 17067
@SP // 17068
AM=M+1 // 17069
A=A-1 // 17070
M=D // 17071

////ArithmeticInstruction{ADD}
@SP // 17072
AM=M-1 // 17073
D=M // 17074
A=A-1 // 17075
D=D+M // 17076

////PopInstruction{address=pointer 1}
@SP // 17077
AM=M-1 // 17078
D=M // 17079
@4 // 17080
M=D // 17081

////PushInstruction("that 0")
@THAT // 17082
A=M // 17083
D=M // 17084
@SP // 17085
AM=M+1 // 17086
A=A-1 // 17087
M=D // 17088

////PushInstruction("constant 256")
@256 // 17089
D=A // 17090
@SP // 17091
AM=M+1 // 17092
A=A-1 // 17093
M=D // 17094

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=4, Output.create=1}, currentFunction='Output.printChar'}
// call Math.multiply
@7 // 17095
D=A // 17096
@14 // 17097
M=D // 17098
@Math.multiply // 17099
D=A // 17100
@13 // 17101
M=D // 17102
@Output.printChar.ret.4 // 17103
D=A // 17104
@CALL // 17105
0;JMP // 17106
(Output.printChar.ret.4)

////PopInstruction{address=local 2}
@SP // 17107
AM=M-1 // 17108
D=M // 17109
@LCL // 17110
A=M+1 // 17111
A=A+1 // 17112
M=D // 17113

////LabelInstruction{label='Output.printChar.IfElseEND1}
// label Output.printChar.IfElseEND1
(Output.printChar.IfElseEND1)

////PushInstruction("local 1")
@LCL // 17114
A=M+1 // 17115
D=M // 17116
@SP // 17117
AM=M+1 // 17118
A=A-1 // 17119
M=D // 17120

////PushInstruction("constant 0")
@SP // 17121
AM=M+1 // 17122
A=A-1 // 17123
M=0 // 17124

////ArithmeticInstruction{ADD}
@SP // 17125
AM=M-1 // 17126
D=M // 17127
A=A-1 // 17128
D=D+M // 17129

////PopInstruction{address=pointer 1}
@SP // 17130
AM=M-1 // 17131
D=M // 17132
@4 // 17133
M=D // 17134

////PushInstruction("that 0")
@THAT // 17135
A=M // 17136
D=M // 17137
@SP // 17138
AM=M+1 // 17139
A=A-1 // 17140
M=D // 17141

////PushInstruction("local 2")
@LCL // 17142
A=M+1 // 17143
A=A+1 // 17144
D=M // 17145
@SP // 17146
AM=M+1 // 17147
A=A-1 // 17148
M=D // 17149

////ArithmeticInstruction{OR}
@SP // 17150
AM=M-1 // 17151
D=M // 17152
A=A-1 // 17153
D=D|M // 17154

////PushInstruction("local 1")
@LCL // 17155
A=M+1 // 17156
D=M // 17157
@SP // 17158
AM=M+1 // 17159
A=A-1 // 17160
M=D // 17161

////PushInstruction("constant 0")
@SP // 17162
AM=M+1 // 17163
A=A-1 // 17164
M=0 // 17165

////ArithmeticInstruction{ADD}
@SP // 17166
AM=M-1 // 17167
D=M // 17168
A=A-1 // 17169
D=D+M // 17170

////PopInstruction{address=pointer 1}
@SP // 17171
AM=M-1 // 17172
D=M // 17173
@4 // 17174
M=D // 17175

////PopInstruction{address=that 0}
@SP // 17176
AM=M-1 // 17177
D=M // 17178
@THAT // 17179
A=M // 17180
M=D // 17181

////PushInstruction("local 3")
@LCL // 17182
A=M+1 // 17183
A=A+1 // 17184
A=A+1 // 17185
D=M // 17186
@SP // 17187
AM=M+1 // 17188
A=A-1 // 17189
M=D // 17190

////PushInstruction("constant 1")
@SP // 17191
AM=M+1 // 17192
A=A-1 // 17193
M=1 // 17194

////ArithmeticInstruction{ADD}
@SP // 17195
AM=M-1 // 17196
D=M // 17197
A=A-1 // 17198
D=D+M // 17199

////PopInstruction{address=local 3}
@SP // 17200
AM=M-1 // 17201
D=M // 17202
@LCL // 17203
A=M+1 // 17204
A=A+1 // 17205
A=A+1 // 17206
M=D // 17207

////GotoInstruction{label='WHILE_START_Output.printChar1}
// goto WHILE_START_Output.printChar1
@WHILE_START_Output.printChar1 // 17208
0;JMP // 17209

////LabelInstruction{label='WHILE_END_Output.printChar1}
// label WHILE_END_Output.printChar1
(WHILE_END_Output.printChar1)

////PushInstruction("static 1")
@Output.1 // 17210
D=M // 17211
@SP // 17212
AM=M+1 // 17213
A=A-1 // 17214
M=D // 17215

////PushInstruction("constant 63")
@63 // 17216
D=A // 17217
@SP // 17218
AM=M+1 // 17219
A=A-1 // 17220
M=D // 17221

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq7 // 17222
D=A // 17223
@13 // 17224
M=D // 17225
@SP // 17226
AM=M-1 // 17227
D=M // 17228
A=A-1 // 17229
D=M-D // 17230
@DO_EQ // 17231
0;JMP // 17232
(COMPARE_Output.printChar_eq7)

////PushInstruction("constant 0")
@SP // 17233
AM=M+1 // 17234
A=A-1 // 17235
M=0 // 17236

////ArithmeticInstruction{EQ}
@COMPARE_Output.printChar_eq8 // 17237
D=A // 17238
@13 // 17239
M=D // 17240
@SP // 17241
AM=M-1 // 17242
D=M // 17243
A=A-1 // 17244
D=M-D // 17245
@DO_EQ // 17246
0;JMP // 17247
(COMPARE_Output.printChar_eq8)

////IfGotoInstruction{label='Output.printChar.IfElse2}
// if-goto Output.printChar.IfElse2
@SP // 17248
AM=M-1 // 17249
D=M // 17250
@Output.printChar.IfElse2 // 17251
D;JNE // 17252

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=5, Output.create=1}, currentFunction='Output.printChar'}
// call Output.println
@5 // 17253
D=A // 17254
@14 // 17255
M=D // 17256
@Output.println // 17257
D=A // 17258
@13 // 17259
M=D // 17260
@Output.printChar.ret.5 // 17261
D=A // 17262
@CALL // 17263
0;JMP // 17264
(Output.printChar.ret.5)

////PopInstruction{address=temp 0}
@SP // 17265
AM=M-1 // 17266
D=M // 17267
@5 // 17268
M=D // 17269

////GotoInstruction{label='Output.printChar.IfElseEND2}
// goto Output.printChar.IfElseEND2
@Output.printChar.IfElseEND2 // 17270
0;JMP // 17271

////LabelInstruction{label='Output.printChar.IfElse2}
// label Output.printChar.IfElse2
(Output.printChar.IfElse2)

////PushInstruction("static 1")
@Output.1 // 17272
D=M // 17273
@SP // 17274
AM=M+1 // 17275
A=A-1 // 17276
M=D // 17277

////PushInstruction("constant 1")
@SP // 17278
AM=M+1 // 17279
A=A-1 // 17280
M=1 // 17281

////ArithmeticInstruction{ADD}
@SP // 17282
AM=M-1 // 17283
D=M // 17284
A=A-1 // 17285
D=D+M // 17286

////PopInstruction{address=Output.1}
@SP // 17287
AM=M-1 // 17288
D=M // 17289
@Output.1 // 17290
M=D // 17291

////LabelInstruction{label='Output.printChar.IfElseEND2}
// label Output.printChar.IfElseEND2
(Output.printChar.IfElseEND2)

////PushInstruction("constant 0")
@SP // 17292
AM=M+1 // 17293
A=A-1 // 17294
M=0 // 17295

////ReturnInstruction{}
@RETURN // 17296
0;JMP // 17297

////FunctionInstruction{functionName='Output.printString', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printString with 1
(Output.printString)
@SP // 17298
AM=M+1 // 17299
A=A-1 // 17300
M=0 // 17301

////PushInstruction("constant 0")
@SP // 17302
AM=M+1 // 17303
A=A-1 // 17304
M=0 // 17305

////PopInstruction{address=local 0}
@SP // 17306
AM=M-1 // 17307
D=M // 17308
@LCL // 17309
A=M // 17310
M=D // 17311

////LabelInstruction{label='WHILE_START_Output.printString1}
// label WHILE_START_Output.printString1
(WHILE_START_Output.printString1)

////PushInstruction("local 0")
@LCL // 17312
A=M // 17313
D=M // 17314
@SP // 17315
AM=M+1 // 17316
A=A-1 // 17317
M=D // 17318

////PushInstruction("argument 0")
@ARG // 17319
A=M // 17320
D=M // 17321
@SP // 17322
AM=M+1 // 17323
A=A-1 // 17324
M=D // 17325

////CallInstruction{calleeFunction='String.length', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=0, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.length
@6 // 17326
D=A // 17327
@14 // 17328
M=D // 17329
@String.length // 17330
D=A // 17331
@13 // 17332
M=D // 17333
@Output.printString.ret.0 // 17334
D=A // 17335
@CALL // 17336
0;JMP // 17337
(Output.printString.ret.0)

////ArithmeticInstruction{LT}
@COMPARE_Output.printString_lt9 // 17338
D=A // 17339
@13 // 17340
M=D // 17341
@SP // 17342
AM=M-1 // 17343
D=M // 17344
A=A-1 // 17345
D=M-D // 17346
@DO_LT // 17347
0;JMP // 17348
(COMPARE_Output.printString_lt9)

////PushInstruction("constant 0")
@SP // 17349
AM=M+1 // 17350
A=A-1 // 17351
M=0 // 17352

////ArithmeticInstruction{EQ}
@COMPARE_Output.printString_eq10 // 17353
D=A // 17354
@13 // 17355
M=D // 17356
@SP // 17357
AM=M-1 // 17358
D=M // 17359
A=A-1 // 17360
D=M-D // 17361
@DO_EQ // 17362
0;JMP // 17363
(COMPARE_Output.printString_eq10)

////IfGotoInstruction{label='WHILE_END_Output.printString1}
// if-goto WHILE_END_Output.printString1
@SP // 17364
AM=M-1 // 17365
D=M // 17366
@WHILE_END_Output.printString1 // 17367
D;JNE // 17368

////PushInstruction("argument 0")
@ARG // 17369
A=M // 17370
D=M // 17371
@SP // 17372
AM=M+1 // 17373
A=A-1 // 17374
M=D // 17375

////PushInstruction("local 0")
@LCL // 17376
A=M // 17377
D=M // 17378
@SP // 17379
AM=M+1 // 17380
A=A-1 // 17381
M=D // 17382

////CallInstruction{calleeFunction='String.charAt', numArgs=2, funcMapping={Output.init=1, Output.initMap=97, Output.printString=1, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call String.charAt
@7 // 17383
D=A // 17384
@14 // 17385
M=D // 17386
@String.charAt // 17387
D=A // 17388
@13 // 17389
M=D // 17390
@Output.printString.ret.1 // 17391
D=A // 17392
@CALL // 17393
0;JMP // 17394
(Output.printString.ret.1)

////CallInstruction{calleeFunction='Output.printChar', numArgs=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=2, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printString'}
// call Output.printChar
@6 // 17395
D=A // 17396
@14 // 17397
M=D // 17398
@Output.printChar // 17399
D=A // 17400
@13 // 17401
M=D // 17402
@Output.printString.ret.2 // 17403
D=A // 17404
@CALL // 17405
0;JMP // 17406
(Output.printString.ret.2)

////PopInstruction{address=temp 0}
@SP // 17407
AM=M-1 // 17408
D=M // 17409
@5 // 17410
M=D // 17411

////PushInstruction("local 0")
@LCL // 17412
A=M // 17413
D=M // 17414
@SP // 17415
AM=M+1 // 17416
A=A-1 // 17417
M=D // 17418

////PushInstruction("constant 1")
@SP // 17419
AM=M+1 // 17420
A=A-1 // 17421
M=1 // 17422

////ArithmeticInstruction{ADD}
@SP // 17423
AM=M-1 // 17424
D=M // 17425
A=A-1 // 17426
D=D+M // 17427

////PopInstruction{address=local 0}
@SP // 17428
AM=M-1 // 17429
D=M // 17430
@LCL // 17431
A=M // 17432
M=D // 17433

////GotoInstruction{label='WHILE_START_Output.printString1}
// goto WHILE_START_Output.printString1
@WHILE_START_Output.printString1 // 17434
0;JMP // 17435

////LabelInstruction{label='WHILE_END_Output.printString1}
// label WHILE_END_Output.printString1
(WHILE_END_Output.printString1)

////PushInstruction("constant 0")
@SP // 17436
AM=M+1 // 17437
A=A-1 // 17438
M=0 // 17439

////ReturnInstruction{}
@RETURN // 17440
0;JMP // 17441

////FunctionInstruction{functionName='Output.printInt', numLocals=1, funcMapping={Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.printInt with 1
(Output.printInt)
@SP // 17442
AM=M+1 // 17443
A=A-1 // 17444
M=0 // 17445

////PushInstruction("constant 10")
@10 // 17446
D=A // 17447
@SP // 17448
AM=M+1 // 17449
A=A-1 // 17450
M=D // 17451

////CallInstruction{calleeFunction='String.new', numArgs=1, funcMapping={Output.printInt=0, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.new
@6 // 17452
D=A // 17453
@14 // 17454
M=D // 17455
@String.new // 17456
D=A // 17457
@13 // 17458
M=D // 17459
@Output.printInt.ret.0 // 17460
D=A // 17461
@CALL // 17462
0;JMP // 17463
(Output.printInt.ret.0)

////PopInstruction{address=local 0}
@SP // 17464
AM=M-1 // 17465
D=M // 17466
@LCL // 17467
A=M // 17468
M=D // 17469

////PushInstruction("local 0")
@LCL // 17470
A=M // 17471
D=M // 17472
@SP // 17473
AM=M+1 // 17474
A=A-1 // 17475
M=D // 17476

////PushInstruction("argument 0")
@ARG // 17477
A=M // 17478
D=M // 17479
@SP // 17480
AM=M+1 // 17481
A=A-1 // 17482
M=D // 17483

////CallInstruction{calleeFunction='String.setInt', numArgs=2, funcMapping={Output.printInt=1, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.setInt
@7 // 17484
D=A // 17485
@14 // 17486
M=D // 17487
@String.setInt // 17488
D=A // 17489
@13 // 17490
M=D // 17491
@Output.printInt.ret.1 // 17492
D=A // 17493
@CALL // 17494
0;JMP // 17495
(Output.printInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 17496
AM=M-1 // 17497
D=M // 17498
@5 // 17499
M=D // 17500

////PushInstruction("local 0")
@LCL // 17501
A=M // 17502
D=M // 17503
@SP // 17504
AM=M+1 // 17505
A=A-1 // 17506
M=D // 17507

////CallInstruction{calleeFunction='Output.printString', numArgs=1, funcMapping={Output.printInt=2, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call Output.printString
@6 // 17508
D=A // 17509
@14 // 17510
M=D // 17511
@Output.printString // 17512
D=A // 17513
@13 // 17514
M=D // 17515
@Output.printInt.ret.2 // 17516
D=A // 17517
@CALL // 17518
0;JMP // 17519
(Output.printInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 17520
AM=M-1 // 17521
D=M // 17522
@5 // 17523
M=D // 17524

////PushInstruction("local 0")
@LCL // 17525
A=M // 17526
D=M // 17527
@SP // 17528
AM=M+1 // 17529
A=A-1 // 17530
M=D // 17531

////CallInstruction{calleeFunction='String.dispose', numArgs=1, funcMapping={Output.printInt=3, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}, currentFunction='Output.printInt'}
// call String.dispose
@6 // 17532
D=A // 17533
@14 // 17534
M=D // 17535
@String.dispose // 17536
D=A // 17537
@13 // 17538
M=D // 17539
@Output.printInt.ret.3 // 17540
D=A // 17541
@CALL // 17542
0;JMP // 17543
(Output.printInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 17544
AM=M-1 // 17545
D=M // 17546
@5 // 17547
M=D // 17548

////PushInstruction("constant 0")
@SP // 17549
AM=M+1 // 17550
A=A-1 // 17551
M=0 // 17552

////ReturnInstruction{}
@RETURN // 17553
0;JMP // 17554

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.println with 0
(Output.println)

////PushInstruction("constant 0")
@SP // 17555
AM=M+1 // 17556
A=A-1 // 17557
M=0 // 17558

////PopInstruction{address=Output.1}
@SP // 17559
AM=M-1 // 17560
D=M // 17561
@Output.1 // 17562
M=D // 17563

////PushInstruction("static 2")
@Output.2 // 17564
D=M // 17565
@SP // 17566
AM=M+1 // 17567
A=A-1 // 17568
M=D // 17569

////PushInstruction("constant 22")
@22 // 17570
D=A // 17571
@SP // 17572
AM=M+1 // 17573
A=A-1 // 17574
M=D // 17575

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq11 // 17576
D=A // 17577
@13 // 17578
M=D // 17579
@SP // 17580
AM=M-1 // 17581
D=M // 17582
A=A-1 // 17583
D=M-D // 17584
@DO_EQ // 17585
0;JMP // 17586
(COMPARE_Output.println_eq11)

////PushInstruction("constant 0")
@SP // 17587
AM=M+1 // 17588
A=A-1 // 17589
M=0 // 17590

////ArithmeticInstruction{EQ}
@COMPARE_Output.println_eq12 // 17591
D=A // 17592
@13 // 17593
M=D // 17594
@SP // 17595
AM=M-1 // 17596
D=M // 17597
A=A-1 // 17598
D=M-D // 17599
@DO_EQ // 17600
0;JMP // 17601
(COMPARE_Output.println_eq12)

////IfGotoInstruction{label='Output.println.IfElse1}
// if-goto Output.println.IfElse1
@SP // 17602
AM=M-1 // 17603
D=M // 17604
@Output.println.IfElse1 // 17605
D;JNE // 17606

////PushInstruction("constant 0")
@SP // 17607
AM=M+1 // 17608
A=A-1 // 17609
M=0 // 17610

////PopInstruction{address=Output.2}
@SP // 17611
AM=M-1 // 17612
D=M // 17613
@Output.2 // 17614
M=D // 17615

////GotoInstruction{label='Output.println.IfElseEND1}
// goto Output.println.IfElseEND1
@Output.println.IfElseEND1 // 17616
0;JMP // 17617

////LabelInstruction{label='Output.println.IfElse1}
// label Output.println.IfElse1
(Output.println.IfElse1)

////PushInstruction("static 2")
@Output.2 // 17618
D=M // 17619
@SP // 17620
AM=M+1 // 17621
A=A-1 // 17622
M=D // 17623

////PushInstruction("constant 1")
@SP // 17624
AM=M+1 // 17625
A=A-1 // 17626
M=1 // 17627

////ArithmeticInstruction{ADD}
@SP // 17628
AM=M-1 // 17629
D=M // 17630
A=A-1 // 17631
D=D+M // 17632

////PopInstruction{address=Output.2}
@SP // 17633
AM=M-1 // 17634
D=M // 17635
@Output.2 // 17636
M=D // 17637

////LabelInstruction{label='Output.println.IfElseEND1}
// label Output.println.IfElseEND1
(Output.println.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17638
AM=M+1 // 17639
A=A-1 // 17640
M=0 // 17641

////ReturnInstruction{}
@RETURN // 17642
0;JMP // 17643

////FunctionInstruction{functionName='Output.backSpace', numLocals=0, funcMapping={Output.printInt=4, Output.init=1, Output.initMap=97, Output.println=0, Output.printString=3, Output.getMap=0, Output.moveCursor=0, Output.printChar=6, Output.create=1}}
// function Output.backSpace with 0
(Output.backSpace)

////PushInstruction("static 1")
@Output.1 // 17644
D=M // 17645
@SP // 17646
AM=M+1 // 17647
A=A-1 // 17648
M=D // 17649

////PushInstruction("constant 0")
@SP // 17650
AM=M+1 // 17651
A=A-1 // 17652
M=0 // 17653

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq13 // 17654
D=A // 17655
@13 // 17656
M=D // 17657
@SP // 17658
AM=M-1 // 17659
D=M // 17660
A=A-1 // 17661
D=M-D // 17662
@DO_EQ // 17663
0;JMP // 17664
(COMPARE_Output.backSpace_eq13)

////PushInstruction("constant 0")
@SP // 17665
AM=M+1 // 17666
A=A-1 // 17667
M=0 // 17668

////ArithmeticInstruction{EQ}
@COMPARE_Output.backSpace_eq14 // 17669
D=A // 17670
@13 // 17671
M=D // 17672
@SP // 17673
AM=M-1 // 17674
D=M // 17675
A=A-1 // 17676
D=M-D // 17677
@DO_EQ // 17678
0;JMP // 17679
(COMPARE_Output.backSpace_eq14)

////IfGotoInstruction{label='Output.backSpace.IfElse1}
// if-goto Output.backSpace.IfElse1
@SP // 17680
AM=M-1 // 17681
D=M // 17682
@Output.backSpace.IfElse1 // 17683
D;JNE // 17684

////PushInstruction("static 2")
@Output.2 // 17685
D=M // 17686
@SP // 17687
AM=M+1 // 17688
A=A-1 // 17689
M=D // 17690

////PushInstruction("constant 1")
@SP // 17691
AM=M+1 // 17692
A=A-1 // 17693
M=1 // 17694

////ArithmeticInstruction{SUB}
@SP // 17695
AM=M-1 // 17696
D=M // 17697
A=A-1 // 17698
D=M-D // 17699

////PopInstruction{address=Output.2}
@SP // 17700
AM=M-1 // 17701
D=M // 17702
@Output.2 // 17703
M=D // 17704

////PushInstruction("constant 63")
@63 // 17705
D=A // 17706
@SP // 17707
AM=M+1 // 17708
A=A-1 // 17709
M=D // 17710

////PopInstruction{address=Output.1}
@SP // 17711
AM=M-1 // 17712
D=M // 17713
@Output.1 // 17714
M=D // 17715

////GotoInstruction{label='Output.backSpace.IfElseEND1}
// goto Output.backSpace.IfElseEND1
@Output.backSpace.IfElseEND1 // 17716
0;JMP // 17717

////LabelInstruction{label='Output.backSpace.IfElse1}
// label Output.backSpace.IfElse1
(Output.backSpace.IfElse1)

////PushInstruction("static 1")
@Output.1 // 17718
D=M // 17719
@SP // 17720
AM=M+1 // 17721
A=A-1 // 17722
M=D // 17723

////PushInstruction("constant 1")
@SP // 17724
AM=M+1 // 17725
A=A-1 // 17726
M=1 // 17727

////ArithmeticInstruction{SUB}
@SP // 17728
AM=M-1 // 17729
D=M // 17730
A=A-1 // 17731
D=M-D // 17732

////PopInstruction{address=Output.1}
@SP // 17733
AM=M-1 // 17734
D=M // 17735
@Output.1 // 17736
M=D // 17737

////LabelInstruction{label='Output.backSpace.IfElseEND1}
// label Output.backSpace.IfElseEND1
(Output.backSpace.IfElseEND1)

////PushInstruction("constant 0")
@SP // 17738
AM=M+1 // 17739
A=A-1 // 17740
M=0 // 17741

////ReturnInstruction{}
@RETURN // 17742
0;JMP // 17743

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={}}
// function Screen.init with 0
(Screen.init)

////PushInstruction("constant 0")
@SP // 17744
AM=M+1 // 17745
A=A-1 // 17746
M=0 // 17747

////ArithmeticInstruction{NOT}
@SP // 17748
A=M-1 // 17749
M=!M // 17750

////PopInstruction{address=Screen.0}
@SP // 17751
AM=M-1 // 17752
D=M // 17753
@Screen.0 // 17754
M=D // 17755

////PushInstruction("constant 0")
@SP // 17756
AM=M+1 // 17757
A=A-1 // 17758
M=0 // 17759

////ReturnInstruction{}
@RETURN // 17760
0;JMP // 17761

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0}}
// function Screen.setColor with 0
(Screen.setColor)

////PushInstruction("argument 0")
@ARG // 17762
A=M // 17763
D=M // 17764
@SP // 17765
AM=M+1 // 17766
A=A-1 // 17767
M=D // 17768

////PopInstruction{address=Screen.0}
@SP // 17769
AM=M-1 // 17770
D=M // 17771
@Screen.0 // 17772
M=D // 17773

////PushInstruction("constant 0")
@SP // 17774
AM=M+1 // 17775
A=A-1 // 17776
M=0 // 17777

////ReturnInstruction{}
@RETURN // 17778
0;JMP // 17779

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.init=0, Screen.setColor=0}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 17780
AM=M+1 // 17781
A=A-1 // 17782
M=0 // 17783
@SP // 17784
AM=M+1 // 17785
A=A-1 // 17786
M=0 // 17787

////PushInstruction("constant 16384")
@16384 // 17788
D=A // 17789
@SP // 17790
AM=M+1 // 17791
A=A-1 // 17792
M=D // 17793

////PushInstruction("argument 1")
@ARG // 17794
A=M+1 // 17795
D=M // 17796
@SP // 17797
AM=M+1 // 17798
A=A-1 // 17799
M=D // 17800

////PushInstruction("constant 32")
@32 // 17801
D=A // 17802
@SP // 17803
AM=M+1 // 17804
A=A-1 // 17805
M=D // 17806

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=0}, currentFunction='Screen.drawPixel'}
// call Math.multiply
@7 // 17807
D=A // 17808
@14 // 17809
M=D // 17810
@Math.multiply // 17811
D=A // 17812
@13 // 17813
M=D // 17814
@Screen.drawPixel.ret.0 // 17815
D=A // 17816
@CALL // 17817
0;JMP // 17818
(Screen.drawPixel.ret.0)

////PushInstruction("argument 0")
@ARG // 17819
A=M // 17820
D=M // 17821
@SP // 17822
AM=M+1 // 17823
A=A-1 // 17824
M=D // 17825

////PushInstruction("constant 16")
@16 // 17826
D=A // 17827
@SP // 17828
AM=M+1 // 17829
A=A-1 // 17830
M=D // 17831

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=1}, currentFunction='Screen.drawPixel'}
// call Math.divide
@7 // 17832
D=A // 17833
@14 // 17834
M=D // 17835
@Math.divide // 17836
D=A // 17837
@13 // 17838
M=D // 17839
@Screen.drawPixel.ret.1 // 17840
D=A // 17841
@CALL // 17842
0;JMP // 17843
(Screen.drawPixel.ret.1)

////ArithmeticInstruction{ADD}
@SP // 17844
AM=M-1 // 17845
D=M // 17846
A=A-1 // 17847
D=D+M // 17848

////ArithmeticInstruction{ADD}
@SP // 17849
AM=M-1 // 17850
D=M // 17851
A=A-1 // 17852
D=D+M // 17853

////PopInstruction{address=local 0}
@SP // 17854
AM=M-1 // 17855
D=M // 17856
@LCL // 17857
A=M // 17858
M=D // 17859

////PushInstruction("argument 0")
@ARG // 17860
A=M // 17861
D=M // 17862
@SP // 17863
AM=M+1 // 17864
A=A-1 // 17865
M=D // 17866

////PushInstruction("constant 15")
@15 // 17867
D=A // 17868
@SP // 17869
AM=M+1 // 17870
A=A-1 // 17871
M=D // 17872

////ArithmeticInstruction{AND}
@SP // 17873
AM=M-1 // 17874
D=M // 17875
A=A-1 // 17876
D=D&M // 17877

////PopInstruction{address=local 1}
@SP // 17878
AM=M-1 // 17879
D=M // 17880
@LCL // 17881
A=M+1 // 17882
M=D // 17883

////PushInstruction("static 0")
@Screen.0 // 17884
D=M // 17885
@SP // 17886
AM=M+1 // 17887
A=A-1 // 17888
M=D // 17889

////PushInstruction("constant 0")
@SP // 17890
AM=M+1 // 17891
A=A-1 // 17892
M=0 // 17893

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawPixel_eq0 // 17894
D=A // 17895
@13 // 17896
M=D // 17897
@SP // 17898
AM=M-1 // 17899
D=M // 17900
A=A-1 // 17901
D=M-D // 17902
@DO_EQ // 17903
0;JMP // 17904
(COMPARE_Screen.drawPixel_eq0)

////ArithmeticInstruction{NOT}
@SP // 17905
A=M-1 // 17906
M=!M // 17907

////PushInstruction("constant 0")
@SP // 17908
AM=M+1 // 17909
A=A-1 // 17910
M=0 // 17911

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawPixel_eq1 // 17912
D=A // 17913
@13 // 17914
M=D // 17915
@SP // 17916
AM=M-1 // 17917
D=M // 17918
A=A-1 // 17919
D=M-D // 17920
@DO_EQ // 17921
0;JMP // 17922
(COMPARE_Screen.drawPixel_eq1)

////IfGotoInstruction{label='Screen.drawPixel.IfElse1}
// if-goto Screen.drawPixel.IfElse1
@SP // 17923
AM=M-1 // 17924
D=M // 17925
@Screen.drawPixel.IfElse1 // 17926
D;JNE // 17927

////PushInstruction("local 0")
@LCL // 17928
A=M // 17929
D=M // 17930
@SP // 17931
AM=M+1 // 17932
A=A-1 // 17933
M=D // 17934

////PushInstruction("constant 0")
@SP // 17935
AM=M+1 // 17936
A=A-1 // 17937
M=0 // 17938

////ArithmeticInstruction{ADD}
@SP // 17939
AM=M-1 // 17940
D=M // 17941
A=A-1 // 17942
D=D+M // 17943

////PopInstruction{address=pointer 1}
@SP // 17944
AM=M-1 // 17945
D=M // 17946
@4 // 17947
M=D // 17948

////PushInstruction("that 0")
@THAT // 17949
A=M // 17950
D=M // 17951
@SP // 17952
AM=M+1 // 17953
A=A-1 // 17954
M=D // 17955

////PushInstruction("local 1")
@LCL // 17956
A=M+1 // 17957
D=M // 17958
@SP // 17959
AM=M+1 // 17960
A=A-1 // 17961
M=D // 17962

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=2}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 17963
D=A // 17964
@14 // 17965
M=D // 17966
@Math.twoToThe // 17967
D=A // 17968
@13 // 17969
M=D // 17970
@Screen.drawPixel.ret.2 // 17971
D=A // 17972
@CALL // 17973
0;JMP // 17974
(Screen.drawPixel.ret.2)

////ArithmeticInstruction{OR}
@SP // 17975
AM=M-1 // 17976
D=M // 17977
A=A-1 // 17978
D=D|M // 17979

////PushInstruction("local 0")
@LCL // 17980
A=M // 17981
D=M // 17982
@SP // 17983
AM=M+1 // 17984
A=A-1 // 17985
M=D // 17986

////PushInstruction("constant 0")
@SP // 17987
AM=M+1 // 17988
A=A-1 // 17989
M=0 // 17990

////ArithmeticInstruction{ADD}
@SP // 17991
AM=M-1 // 17992
D=M // 17993
A=A-1 // 17994
D=D+M // 17995

////PopInstruction{address=pointer 1}
@SP // 17996
AM=M-1 // 17997
D=M // 17998
@4 // 17999
M=D // 18000

////PopInstruction{address=that 0}
@SP // 18001
AM=M-1 // 18002
D=M // 18003
@THAT // 18004
A=M // 18005
M=D // 18006

////GotoInstruction{label='Screen.drawPixel.IfElseEND1}
// goto Screen.drawPixel.IfElseEND1
@Screen.drawPixel.IfElseEND1 // 18007
0;JMP // 18008

////LabelInstruction{label='Screen.drawPixel.IfElse1}
// label Screen.drawPixel.IfElse1
(Screen.drawPixel.IfElse1)

////PushInstruction("local 0")
@LCL // 18009
A=M // 18010
D=M // 18011
@SP // 18012
AM=M+1 // 18013
A=A-1 // 18014
M=D // 18015

////PushInstruction("constant 0")
@SP // 18016
AM=M+1 // 18017
A=A-1 // 18018
M=0 // 18019

////ArithmeticInstruction{ADD}
@SP // 18020
AM=M-1 // 18021
D=M // 18022
A=A-1 // 18023
D=D+M // 18024

////PopInstruction{address=pointer 1}
@SP // 18025
AM=M-1 // 18026
D=M // 18027
@4 // 18028
M=D // 18029

////PushInstruction("that 0")
@THAT // 18030
A=M // 18031
D=M // 18032
@SP // 18033
AM=M+1 // 18034
A=A-1 // 18035
M=D // 18036

////PushInstruction("local 1")
@LCL // 18037
A=M+1 // 18038
D=M // 18039
@SP // 18040
AM=M+1 // 18041
A=A-1 // 18042
M=D // 18043

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=3}, currentFunction='Screen.drawPixel'}
// call Math.twoToThe
@6 // 18044
D=A // 18045
@14 // 18046
M=D // 18047
@Math.twoToThe // 18048
D=A // 18049
@13 // 18050
M=D // 18051
@Screen.drawPixel.ret.3 // 18052
D=A // 18053
@CALL // 18054
0;JMP // 18055
(Screen.drawPixel.ret.3)

////ArithmeticInstruction{NOT}
@SP // 18056
A=M-1 // 18057
M=!M // 18058

////ArithmeticInstruction{AND}
@SP // 18059
AM=M-1 // 18060
D=M // 18061
A=A-1 // 18062
D=D&M // 18063

////PushInstruction("local 0")
@LCL // 18064
A=M // 18065
D=M // 18066
@SP // 18067
AM=M+1 // 18068
A=A-1 // 18069
M=D // 18070

////PushInstruction("constant 0")
@SP // 18071
AM=M+1 // 18072
A=A-1 // 18073
M=0 // 18074

////ArithmeticInstruction{ADD}
@SP // 18075
AM=M-1 // 18076
D=M // 18077
A=A-1 // 18078
D=D+M // 18079

////PopInstruction{address=pointer 1}
@SP // 18080
AM=M-1 // 18081
D=M // 18082
@4 // 18083
M=D // 18084

////PopInstruction{address=that 0}
@SP // 18085
AM=M-1 // 18086
D=M // 18087
@THAT // 18088
A=M // 18089
M=D // 18090

////LabelInstruction{label='Screen.drawPixel.IfElseEND1}
// label Screen.drawPixel.IfElseEND1
(Screen.drawPixel.IfElseEND1)

////PushInstruction("constant 0")
@SP // 18091
AM=M+1 // 18092
A=A-1 // 18093
M=0 // 18094

////ReturnInstruction{}
@RETURN // 18095
0;JMP // 18096

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@SP // 18097
AM=M+1 // 18098
A=A-1 // 18099
M=0 // 18100
@SP // 18101
AM=M+1 // 18102
A=A-1 // 18103
M=0 // 18104
@SP // 18105
AM=M+1 // 18106
A=A-1 // 18107
M=0 // 18108
@SP // 18109
AM=M+1 // 18110
A=A-1 // 18111
M=0 // 18112
@SP // 18113
AM=M+1 // 18114
A=A-1 // 18115
M=0 // 18116
@SP // 18117
AM=M+1 // 18118
A=A-1 // 18119
M=0 // 18120

////PushInstruction("argument 2")
@ARG // 18121
A=M+1 // 18122
A=A+1 // 18123
D=M // 18124
@SP // 18125
AM=M+1 // 18126
A=A-1 // 18127
M=D // 18128

////PushInstruction("argument 0")
@ARG // 18129
A=M // 18130
D=M // 18131
@SP // 18132
AM=M+1 // 18133
A=A-1 // 18134
M=D // 18135

////ArithmeticInstruction{SUB}
@SP // 18136
AM=M-1 // 18137
D=M // 18138
A=A-1 // 18139
D=M-D // 18140

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 18141
D=A // 18142
@14 // 18143
M=D // 18144
@Math.abs // 18145
D=A // 18146
@13 // 18147
M=D // 18148
@Screen.drawLine.ret.0 // 18149
D=A // 18150
@CALL // 18151
0;JMP // 18152
(Screen.drawLine.ret.0)

////PopInstruction{address=local 0}
@SP // 18153
AM=M-1 // 18154
D=M // 18155
@LCL // 18156
A=M // 18157
M=D // 18158

////PushInstruction("argument 3")
@ARG // 18159
A=M+1 // 18160
A=A+1 // 18161
A=A+1 // 18162
D=M // 18163
@SP // 18164
AM=M+1 // 18165
A=A-1 // 18166
M=D // 18167

////PushInstruction("argument 1")
@ARG // 18168
A=M+1 // 18169
D=M // 18170
@SP // 18171
AM=M+1 // 18172
A=A-1 // 18173
M=D // 18174

////ArithmeticInstruction{SUB}
@SP // 18175
AM=M-1 // 18176
D=M // 18177
A=A-1 // 18178
D=M-D // 18179

////CallInstruction{calleeFunction='Math.abs', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Math.abs
@6 // 18180
D=A // 18181
@14 // 18182
M=D // 18183
@Math.abs // 18184
D=A // 18185
@13 // 18186
M=D // 18187
@Screen.drawLine.ret.1 // 18188
D=A // 18189
@CALL // 18190
0;JMP // 18191
(Screen.drawLine.ret.1)

////PopInstruction{address=local 1}
@SP // 18192
AM=M-1 // 18193
D=M // 18194
@LCL // 18195
A=M+1 // 18196
M=D // 18197

////PushInstruction("argument 0")
@ARG // 18198
A=M // 18199
D=M // 18200
@SP // 18201
AM=M+1 // 18202
A=A-1 // 18203
M=D // 18204

////PushInstruction("argument 2")
@ARG // 18205
A=M+1 // 18206
A=A+1 // 18207
D=M // 18208
@SP // 18209
AM=M+1 // 18210
A=A-1 // 18211
M=D // 18212

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt2 // 18213
D=A // 18214
@13 // 18215
M=D // 18216
@SP // 18217
AM=M-1 // 18218
D=M // 18219
A=A-1 // 18220
D=M-D // 18221
@DO_LT // 18222
0;JMP // 18223
(COMPARE_Screen.drawLine_lt2)

////PushInstruction("constant 0")
@SP // 18224
AM=M+1 // 18225
A=A-1 // 18226
M=0 // 18227

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq3 // 18228
D=A // 18229
@13 // 18230
M=D // 18231
@SP // 18232
AM=M-1 // 18233
D=M // 18234
A=A-1 // 18235
D=M-D // 18236
@DO_EQ // 18237
0;JMP // 18238
(COMPARE_Screen.drawLine_eq3)

////IfGotoInstruction{label='Screen.drawLine.IfElse1}
// if-goto Screen.drawLine.IfElse1
@SP // 18239
AM=M-1 // 18240
D=M // 18241
@Screen.drawLine.IfElse1 // 18242
D;JNE // 18243

////PushInstruction("constant 1")
@SP // 18244
AM=M+1 // 18245
A=A-1 // 18246
M=1 // 18247

////PopInstruction{address=local 2}
@SP // 18248
AM=M-1 // 18249
D=M // 18250
@LCL // 18251
A=M+1 // 18252
A=A+1 // 18253
M=D // 18254

////GotoInstruction{label='Screen.drawLine.IfElseEND1}
// goto Screen.drawLine.IfElseEND1
@Screen.drawLine.IfElseEND1 // 18255
0;JMP // 18256

////LabelInstruction{label='Screen.drawLine.IfElse1}
// label Screen.drawLine.IfElse1
(Screen.drawLine.IfElse1)

////PushInstruction("constant 1")
@SP // 18257
AM=M+1 // 18258
A=A-1 // 18259
M=1 // 18260

////ArithmeticInstruction{NEG}
@SP // 18261
A=M-1 // 18262
M=-M // 18263

////PopInstruction{address=local 2}
@SP // 18264
AM=M-1 // 18265
D=M // 18266
@LCL // 18267
A=M+1 // 18268
A=A+1 // 18269
M=D // 18270

////LabelInstruction{label='Screen.drawLine.IfElseEND1}
// label Screen.drawLine.IfElseEND1
(Screen.drawLine.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 18271
A=M+1 // 18272
D=M // 18273
@SP // 18274
AM=M+1 // 18275
A=A-1 // 18276
M=D // 18277

////PushInstruction("argument 3")
@ARG // 18278
A=M+1 // 18279
A=A+1 // 18280
A=A+1 // 18281
D=M // 18282
@SP // 18283
AM=M+1 // 18284
A=A-1 // 18285
M=D // 18286

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt4 // 18287
D=A // 18288
@13 // 18289
M=D // 18290
@SP // 18291
AM=M-1 // 18292
D=M // 18293
A=A-1 // 18294
D=M-D // 18295
@DO_LT // 18296
0;JMP // 18297
(COMPARE_Screen.drawLine_lt4)

////PushInstruction("constant 0")
@SP // 18298
AM=M+1 // 18299
A=A-1 // 18300
M=0 // 18301

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq5 // 18302
D=A // 18303
@13 // 18304
M=D // 18305
@SP // 18306
AM=M-1 // 18307
D=M // 18308
A=A-1 // 18309
D=M-D // 18310
@DO_EQ // 18311
0;JMP // 18312
(COMPARE_Screen.drawLine_eq5)

////IfGotoInstruction{label='Screen.drawLine.IfElse2}
// if-goto Screen.drawLine.IfElse2
@SP // 18313
AM=M-1 // 18314
D=M // 18315
@Screen.drawLine.IfElse2 // 18316
D;JNE // 18317

////PushInstruction("constant 1")
@SP // 18318
AM=M+1 // 18319
A=A-1 // 18320
M=1 // 18321

////PopInstruction{address=local 3}
@SP // 18322
AM=M-1 // 18323
D=M // 18324
@LCL // 18325
A=M+1 // 18326
A=A+1 // 18327
A=A+1 // 18328
M=D // 18329

////GotoInstruction{label='Screen.drawLine.IfElseEND2}
// goto Screen.drawLine.IfElseEND2
@Screen.drawLine.IfElseEND2 // 18330
0;JMP // 18331

////LabelInstruction{label='Screen.drawLine.IfElse2}
// label Screen.drawLine.IfElse2
(Screen.drawLine.IfElse2)

////PushInstruction("constant 1")
@SP // 18332
AM=M+1 // 18333
A=A-1 // 18334
M=1 // 18335

////ArithmeticInstruction{NEG}
@SP // 18336
A=M-1 // 18337
M=-M // 18338

////PopInstruction{address=local 3}
@SP // 18339
AM=M-1 // 18340
D=M // 18341
@LCL // 18342
A=M+1 // 18343
A=A+1 // 18344
A=A+1 // 18345
M=D // 18346

////LabelInstruction{label='Screen.drawLine.IfElseEND2}
// label Screen.drawLine.IfElseEND2
(Screen.drawLine.IfElseEND2)

////PushInstruction("local 0")
@LCL // 18347
A=M // 18348
D=M // 18349
@SP // 18350
AM=M+1 // 18351
A=A-1 // 18352
M=D // 18353

////PushInstruction("local 1")
@LCL // 18354
A=M+1 // 18355
D=M // 18356
@SP // 18357
AM=M+1 // 18358
A=A-1 // 18359
M=D // 18360

////ArithmeticInstruction{SUB}
@SP // 18361
AM=M-1 // 18362
D=M // 18363
A=A-1 // 18364
D=M-D // 18365

////PopInstruction{address=local 4}
@LCL // 18366
D=M // 18367
@4 // 18368
A=D+A // 18369
D=A // 18370
@R13 // 18371
M=D // 18372
@SP // 18373
AM=M-1 // 18374
D=M // 18375
@R13 // 18376
A=M // 18377
M=D // 18378

////LabelInstruction{label='WHILE_START_Screen.drawLine1}
// label WHILE_START_Screen.drawLine1
(WHILE_START_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 18379
AM=M+1 // 18380
A=A-1 // 18381
M=0 // 18382

////ArithmeticInstruction{NOT}
@SP // 18383
A=M-1 // 18384
M=!M // 18385

////PushInstruction("constant 0")
@SP // 18386
AM=M+1 // 18387
A=A-1 // 18388
M=0 // 18389

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq6 // 18390
D=A // 18391
@13 // 18392
M=D // 18393
@SP // 18394
AM=M-1 // 18395
D=M // 18396
A=A-1 // 18397
D=M-D // 18398
@DO_EQ // 18399
0;JMP // 18400
(COMPARE_Screen.drawLine_eq6)

////IfGotoInstruction{label='WHILE_END_Screen.drawLine1}
// if-goto WHILE_END_Screen.drawLine1
@SP // 18401
AM=M-1 // 18402
D=M // 18403
@WHILE_END_Screen.drawLine1 // 18404
D;JNE // 18405

////PushInstruction("argument 0")
@ARG // 18406
A=M // 18407
D=M // 18408
@SP // 18409
AM=M+1 // 18410
A=A-1 // 18411
M=D // 18412

////PushInstruction("argument 1")
@ARG // 18413
A=M+1 // 18414
D=M // 18415
@SP // 18416
AM=M+1 // 18417
A=A-1 // 18418
M=D // 18419

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawLine'}
// call Screen.drawPixel
@7 // 18420
D=A // 18421
@14 // 18422
M=D // 18423
@Screen.drawPixel // 18424
D=A // 18425
@13 // 18426
M=D // 18427
@Screen.drawLine.ret.2 // 18428
D=A // 18429
@CALL // 18430
0;JMP // 18431
(Screen.drawLine.ret.2)

////PopInstruction{address=temp 0}
@SP // 18432
AM=M-1 // 18433
D=M // 18434
@5 // 18435
M=D // 18436

////PushInstruction("argument 0")
@ARG // 18437
A=M // 18438
D=M // 18439
@SP // 18440
AM=M+1 // 18441
A=A-1 // 18442
M=D // 18443

////PushInstruction("argument 2")
@ARG // 18444
A=M+1 // 18445
A=A+1 // 18446
D=M // 18447
@SP // 18448
AM=M+1 // 18449
A=A-1 // 18450
M=D // 18451

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq7 // 18452
D=A // 18453
@13 // 18454
M=D // 18455
@SP // 18456
AM=M-1 // 18457
D=M // 18458
A=A-1 // 18459
D=M-D // 18460
@DO_EQ // 18461
0;JMP // 18462
(COMPARE_Screen.drawLine_eq7)

////PushInstruction("argument 1")
@ARG // 18463
A=M+1 // 18464
D=M // 18465
@SP // 18466
AM=M+1 // 18467
A=A-1 // 18468
M=D // 18469

////PushInstruction("argument 3")
@ARG // 18470
A=M+1 // 18471
A=A+1 // 18472
A=A+1 // 18473
D=M // 18474
@SP // 18475
AM=M+1 // 18476
A=A-1 // 18477
M=D // 18478

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq8 // 18479
D=A // 18480
@13 // 18481
M=D // 18482
@SP // 18483
AM=M-1 // 18484
D=M // 18485
A=A-1 // 18486
D=M-D // 18487
@DO_EQ // 18488
0;JMP // 18489
(COMPARE_Screen.drawLine_eq8)

////ArithmeticInstruction{AND}
@SP // 18490
AM=M-1 // 18491
D=M // 18492
A=A-1 // 18493
D=D&M // 18494

////PushInstruction("constant 0")
@SP // 18495
AM=M+1 // 18496
A=A-1 // 18497
M=0 // 18498

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq9 // 18499
D=A // 18500
@13 // 18501
M=D // 18502
@SP // 18503
AM=M-1 // 18504
D=M // 18505
A=A-1 // 18506
D=M-D // 18507
@DO_EQ // 18508
0;JMP // 18509
(COMPARE_Screen.drawLine_eq9)

////IfGotoInstruction{label='Screen.drawLine.IfElse3}
// if-goto Screen.drawLine.IfElse3
@SP // 18510
AM=M-1 // 18511
D=M // 18512
@Screen.drawLine.IfElse3 // 18513
D;JNE // 18514

////PushInstruction("constant 0")
@SP // 18515
AM=M+1 // 18516
A=A-1 // 18517
M=0 // 18518

////ReturnInstruction{}
@RETURN // 18519
0;JMP // 18520

////GotoInstruction{label='Screen.drawLine.IfElseEND3}
// goto Screen.drawLine.IfElseEND3
@Screen.drawLine.IfElseEND3 // 18521
0;JMP // 18522

////LabelInstruction{label='Screen.drawLine.IfElse3}
// label Screen.drawLine.IfElse3
(Screen.drawLine.IfElse3)

////LabelInstruction{label='Screen.drawLine.IfElseEND3}
// label Screen.drawLine.IfElseEND3
(Screen.drawLine.IfElseEND3)

////PushInstruction("local 4")
@LCL // 18523
D=M // 18524
@4 // 18525
A=D+A // 18526
D=M // 18527
@SP // 18528
AM=M+1 // 18529
A=A-1 // 18530
M=D // 18531

////PushInstruction("local 4")
@LCL // 18532
D=M // 18533
@4 // 18534
A=D+A // 18535
D=M // 18536
@SP // 18537
AM=M+1 // 18538
A=A-1 // 18539
M=D // 18540

////ArithmeticInstruction{ADD}
@SP // 18541
AM=M-1 // 18542
D=M // 18543
A=A-1 // 18544
D=D+M // 18545

////PopInstruction{address=local 5}
@LCL // 18546
D=M // 18547
@5 // 18548
A=D+A // 18549
D=A // 18550
@R13 // 18551
M=D // 18552
@SP // 18553
AM=M-1 // 18554
D=M // 18555
@R13 // 18556
A=M // 18557
M=D // 18558

////PushInstruction("local 5")
@LCL // 18559
D=M // 18560
@5 // 18561
A=D+A // 18562
D=M // 18563
@SP // 18564
AM=M+1 // 18565
A=A-1 // 18566
M=D // 18567

////PushInstruction("local 1")
@LCL // 18568
A=M+1 // 18569
D=M // 18570
@SP // 18571
AM=M+1 // 18572
A=A-1 // 18573
M=D // 18574

////ArithmeticInstruction{ADD}
@SP // 18575
AM=M-1 // 18576
D=M // 18577
A=A-1 // 18578
D=D+M // 18579

////PushInstruction("constant 0")
@SP // 18580
AM=M+1 // 18581
A=A-1 // 18582
M=0 // 18583

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawLine_gt10 // 18584
D=A // 18585
@13 // 18586
M=D // 18587
@SP // 18588
AM=M-1 // 18589
D=M // 18590
A=A-1 // 18591
D=M-D // 18592
@DO_GT // 18593
0;JMP // 18594
(COMPARE_Screen.drawLine_gt10)

////PushInstruction("constant 0")
@SP // 18595
AM=M+1 // 18596
A=A-1 // 18597
M=0 // 18598

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq11 // 18599
D=A // 18600
@13 // 18601
M=D // 18602
@SP // 18603
AM=M-1 // 18604
D=M // 18605
A=A-1 // 18606
D=M-D // 18607
@DO_EQ // 18608
0;JMP // 18609
(COMPARE_Screen.drawLine_eq11)

////IfGotoInstruction{label='Screen.drawLine.IfElse4}
// if-goto Screen.drawLine.IfElse4
@SP // 18610
AM=M-1 // 18611
D=M // 18612
@Screen.drawLine.IfElse4 // 18613
D;JNE // 18614

////PushInstruction("local 4")
@LCL // 18615
D=M // 18616
@4 // 18617
A=D+A // 18618
D=M // 18619
@SP // 18620
AM=M+1 // 18621
A=A-1 // 18622
M=D // 18623

////PushInstruction("local 1")
@LCL // 18624
A=M+1 // 18625
D=M // 18626
@SP // 18627
AM=M+1 // 18628
A=A-1 // 18629
M=D // 18630

////ArithmeticInstruction{SUB}
@SP // 18631
AM=M-1 // 18632
D=M // 18633
A=A-1 // 18634
D=M-D // 18635

////PopInstruction{address=local 4}
@LCL // 18636
D=M // 18637
@4 // 18638
A=D+A // 18639
D=A // 18640
@R13 // 18641
M=D // 18642
@SP // 18643
AM=M-1 // 18644
D=M // 18645
@R13 // 18646
A=M // 18647
M=D // 18648

////PushInstruction("argument 0")
@ARG // 18649
A=M // 18650
D=M // 18651
@SP // 18652
AM=M+1 // 18653
A=A-1 // 18654
M=D // 18655

////PushInstruction("local 2")
@LCL // 18656
A=M+1 // 18657
A=A+1 // 18658
D=M // 18659
@SP // 18660
AM=M+1 // 18661
A=A-1 // 18662
M=D // 18663

////ArithmeticInstruction{ADD}
@SP // 18664
AM=M-1 // 18665
D=M // 18666
A=A-1 // 18667
D=D+M // 18668

////PopInstruction{address=argument 0}
@SP // 18669
AM=M-1 // 18670
D=M // 18671
@ARG // 18672
A=M // 18673
M=D // 18674

////GotoInstruction{label='Screen.drawLine.IfElseEND4}
// goto Screen.drawLine.IfElseEND4
@Screen.drawLine.IfElseEND4 // 18675
0;JMP // 18676

////LabelInstruction{label='Screen.drawLine.IfElse4}
// label Screen.drawLine.IfElse4
(Screen.drawLine.IfElse4)

////LabelInstruction{label='Screen.drawLine.IfElseEND4}
// label Screen.drawLine.IfElseEND4
(Screen.drawLine.IfElseEND4)

////PushInstruction("local 5")
@LCL // 18677
D=M // 18678
@5 // 18679
A=D+A // 18680
D=M // 18681
@SP // 18682
AM=M+1 // 18683
A=A-1 // 18684
M=D // 18685

////PushInstruction("local 0")
@LCL // 18686
A=M // 18687
D=M // 18688
@SP // 18689
AM=M+1 // 18690
A=A-1 // 18691
M=D // 18692

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawLine_lt12 // 18693
D=A // 18694
@13 // 18695
M=D // 18696
@SP // 18697
AM=M-1 // 18698
D=M // 18699
A=A-1 // 18700
D=M-D // 18701
@DO_LT // 18702
0;JMP // 18703
(COMPARE_Screen.drawLine_lt12)

////PushInstruction("constant 0")
@SP // 18704
AM=M+1 // 18705
A=A-1 // 18706
M=0 // 18707

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawLine_eq13 // 18708
D=A // 18709
@13 // 18710
M=D // 18711
@SP // 18712
AM=M-1 // 18713
D=M // 18714
A=A-1 // 18715
D=M-D // 18716
@DO_EQ // 18717
0;JMP // 18718
(COMPARE_Screen.drawLine_eq13)

////IfGotoInstruction{label='Screen.drawLine.IfElse5}
// if-goto Screen.drawLine.IfElse5
@SP // 18719
AM=M-1 // 18720
D=M // 18721
@Screen.drawLine.IfElse5 // 18722
D;JNE // 18723

////PushInstruction("local 4")
@LCL // 18724
D=M // 18725
@4 // 18726
A=D+A // 18727
D=M // 18728
@SP // 18729
AM=M+1 // 18730
A=A-1 // 18731
M=D // 18732

////PushInstruction("local 0")
@LCL // 18733
A=M // 18734
D=M // 18735
@SP // 18736
AM=M+1 // 18737
A=A-1 // 18738
M=D // 18739

////ArithmeticInstruction{ADD}
@SP // 18740
AM=M-1 // 18741
D=M // 18742
A=A-1 // 18743
D=D+M // 18744

////PopInstruction{address=local 4}
@LCL // 18745
D=M // 18746
@4 // 18747
A=D+A // 18748
D=A // 18749
@R13 // 18750
M=D // 18751
@SP // 18752
AM=M-1 // 18753
D=M // 18754
@R13 // 18755
A=M // 18756
M=D // 18757

////PushInstruction("argument 1")
@ARG // 18758
A=M+1 // 18759
D=M // 18760
@SP // 18761
AM=M+1 // 18762
A=A-1 // 18763
M=D // 18764

////PushInstruction("local 3")
@LCL // 18765
A=M+1 // 18766
A=A+1 // 18767
A=A+1 // 18768
D=M // 18769
@SP // 18770
AM=M+1 // 18771
A=A-1 // 18772
M=D // 18773

////ArithmeticInstruction{ADD}
@SP // 18774
AM=M-1 // 18775
D=M // 18776
A=A-1 // 18777
D=D+M // 18778

////PopInstruction{address=argument 1}
@SP // 18779
AM=M-1 // 18780
D=M // 18781
@ARG // 18782
A=M+1 // 18783
M=D // 18784

////GotoInstruction{label='Screen.drawLine.IfElseEND5}
// goto Screen.drawLine.IfElseEND5
@Screen.drawLine.IfElseEND5 // 18785
0;JMP // 18786

////LabelInstruction{label='Screen.drawLine.IfElse5}
// label Screen.drawLine.IfElse5
(Screen.drawLine.IfElse5)

////LabelInstruction{label='Screen.drawLine.IfElseEND5}
// label Screen.drawLine.IfElseEND5
(Screen.drawLine.IfElseEND5)

////GotoInstruction{label='WHILE_START_Screen.drawLine1}
// goto WHILE_START_Screen.drawLine1
@WHILE_START_Screen.drawLine1 // 18787
0;JMP // 18788

////LabelInstruction{label='WHILE_END_Screen.drawLine1}
// label WHILE_END_Screen.drawLine1
(WHILE_END_Screen.drawLine1)

////PushInstruction("constant 0")
@SP // 18789
AM=M+1 // 18790
A=A-1 // 18791
M=0 // 18792

////ReturnInstruction{}
@RETURN // 18793
0;JMP // 18794

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 18795
AM=M+1 // 18796
A=A-1 // 18797
M=0 // 18798

////PushInstruction("argument 0")
@ARG // 18799
A=M // 18800
D=M // 18801
@SP // 18802
AM=M+1 // 18803
A=A-1 // 18804
M=D // 18805

////PopInstruction{address=local 0}
@SP // 18806
AM=M-1 // 18807
D=M // 18808
@LCL // 18809
A=M // 18810
M=D // 18811

////LabelInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// label WHILE_START_Screen.drawHorizontalLine1
(WHILE_START_Screen.drawHorizontalLine1)

////PushInstruction("local 0")
@LCL // 18812
A=M // 18813
D=M // 18814
@SP // 18815
AM=M+1 // 18816
A=A-1 // 18817
M=D // 18818

////PushInstruction("argument 1")
@ARG // 18819
A=M+1 // 18820
D=M // 18821
@SP // 18822
AM=M+1 // 18823
A=A-1 // 18824
M=D // 18825

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawHorizontalLine_gt14 // 18826
D=A // 18827
@13 // 18828
M=D // 18829
@SP // 18830
AM=M-1 // 18831
D=M // 18832
A=A-1 // 18833
D=M-D // 18834
@DO_GT // 18835
0;JMP // 18836
(COMPARE_Screen.drawHorizontalLine_gt14)

////ArithmeticInstruction{NOT}
@SP // 18837
A=M-1 // 18838
M=!M // 18839

////PushInstruction("constant 0")
@SP // 18840
AM=M+1 // 18841
A=A-1 // 18842
M=0 // 18843

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawHorizontalLine_eq15 // 18844
D=A // 18845
@13 // 18846
M=D // 18847
@SP // 18848
AM=M-1 // 18849
D=M // 18850
A=A-1 // 18851
D=M-D // 18852
@DO_EQ // 18853
0;JMP // 18854
(COMPARE_Screen.drawHorizontalLine_eq15)

////IfGotoInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// if-goto WHILE_END_Screen.drawHorizontalLine1
@SP // 18855
AM=M-1 // 18856
D=M // 18857
@WHILE_END_Screen.drawHorizontalLine1 // 18858
D;JNE // 18859

////PushInstruction("local 0")
@LCL // 18860
A=M // 18861
D=M // 18862
@SP // 18863
AM=M+1 // 18864
A=A-1 // 18865
M=D // 18866

////PushInstruction("argument 2")
@ARG // 18867
A=M+1 // 18868
A=A+1 // 18869
D=M // 18870
@SP // 18871
AM=M+1 // 18872
A=A-1 // 18873
M=D // 18874

////CallInstruction{calleeFunction='Screen.drawPixel', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawHorizontalLine'}
// call Screen.drawPixel
@7 // 18875
D=A // 18876
@14 // 18877
M=D // 18878
@Screen.drawPixel // 18879
D=A // 18880
@13 // 18881
M=D // 18882
@Screen.drawHorizontalLine.ret.0 // 18883
D=A // 18884
@CALL // 18885
0;JMP // 18886
(Screen.drawHorizontalLine.ret.0)

////PopInstruction{address=temp 0}
@SP // 18887
AM=M-1 // 18888
D=M // 18889
@5 // 18890
M=D // 18891

////PushInstruction("local 0")
@LCL // 18892
A=M // 18893
D=M // 18894
@SP // 18895
AM=M+1 // 18896
A=A-1 // 18897
M=D // 18898

////PushInstruction("constant 1")
@SP // 18899
AM=M+1 // 18900
A=A-1 // 18901
M=1 // 18902

////ArithmeticInstruction{ADD}
@SP // 18903
AM=M-1 // 18904
D=M // 18905
A=A-1 // 18906
D=D+M // 18907

////PopInstruction{address=local 0}
@SP // 18908
AM=M-1 // 18909
D=M // 18910
@LCL // 18911
A=M // 18912
M=D // 18913

////GotoInstruction{label='WHILE_START_Screen.drawHorizontalLine1}
// goto WHILE_START_Screen.drawHorizontalLine1
@WHILE_START_Screen.drawHorizontalLine1 // 18914
0;JMP // 18915

////LabelInstruction{label='WHILE_END_Screen.drawHorizontalLine1}
// label WHILE_END_Screen.drawHorizontalLine1
(WHILE_END_Screen.drawHorizontalLine1)

////PushInstruction("constant 0")
@SP // 18916
AM=M+1 // 18917
A=A-1 // 18918
M=0 // 18919

////ReturnInstruction{}
@RETURN // 18920
0;JMP // 18921

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@SP // 18922
AM=M+1 // 18923
A=A-1 // 18924
M=0 // 18925
@SP // 18926
AM=M+1 // 18927
A=A-1 // 18928
M=0 // 18929
@SP // 18930
AM=M+1 // 18931
A=A-1 // 18932
M=0 // 18933
@SP // 18934
AM=M+1 // 18935
A=A-1 // 18936
M=0 // 18937
@SP // 18938
AM=M+1 // 18939
A=A-1 // 18940
M=0 // 18941

////PushInstruction("constant 0")
@SP // 18942
AM=M+1 // 18943
A=A-1 // 18944
M=0 // 18945

////PopInstruction{address=local 0}
@SP // 18946
AM=M-1 // 18947
D=M // 18948
@LCL // 18949
A=M // 18950
M=D // 18951

////PushInstruction("argument 2")
@ARG // 18952
A=M+1 // 18953
A=A+1 // 18954
D=M // 18955
@SP // 18956
AM=M+1 // 18957
A=A-1 // 18958
M=D // 18959

////PopInstruction{address=local 1}
@SP // 18960
AM=M-1 // 18961
D=M // 18962
@LCL // 18963
A=M+1 // 18964
M=D // 18965

////PushInstruction("constant 1")
@SP // 18966
AM=M+1 // 18967
A=A-1 // 18968
M=1 // 18969

////PushInstruction("argument 2")
@ARG // 18970
A=M+1 // 18971
A=A+1 // 18972
D=M // 18973
@SP // 18974
AM=M+1 // 18975
A=A-1 // 18976
M=D // 18977

////ArithmeticInstruction{SUB}
@SP // 18978
AM=M-1 // 18979
D=M // 18980
A=A-1 // 18981
D=M-D // 18982

////PopInstruction{address=local 2}
@SP // 18983
AM=M-1 // 18984
D=M // 18985
@LCL // 18986
A=M+1 // 18987
A=A+1 // 18988
M=D // 18989

////LabelInstruction{label='WHILE_START_Screen.drawCircle1}
// label WHILE_START_Screen.drawCircle1
(WHILE_START_Screen.drawCircle1)

////PushInstruction("local 0")
@LCL // 18990
A=M // 18991
D=M // 18992
@SP // 18993
AM=M+1 // 18994
A=A-1 // 18995
M=D // 18996

////PushInstruction("local 1")
@LCL // 18997
A=M+1 // 18998
D=M // 18999
@SP // 19000
AM=M+1 // 19001
A=A-1 // 19002
M=D // 19003

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawCircle_gt16 // 19004
D=A // 19005
@13 // 19006
M=D // 19007
@SP // 19008
AM=M-1 // 19009
D=M // 19010
A=A-1 // 19011
D=M-D // 19012
@DO_GT // 19013
0;JMP // 19014
(COMPARE_Screen.drawCircle_gt16)

////ArithmeticInstruction{NOT}
@SP // 19015
A=M-1 // 19016
M=!M // 19017

////PushInstruction("constant 0")
@SP // 19018
AM=M+1 // 19019
A=A-1 // 19020
M=0 // 19021

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq17 // 19022
D=A // 19023
@13 // 19024
M=D // 19025
@SP // 19026
AM=M-1 // 19027
D=M // 19028
A=A-1 // 19029
D=M-D // 19030
@DO_EQ // 19031
0;JMP // 19032
(COMPARE_Screen.drawCircle_eq17)

////IfGotoInstruction{label='WHILE_END_Screen.drawCircle1}
// if-goto WHILE_END_Screen.drawCircle1
@SP // 19033
AM=M-1 // 19034
D=M // 19035
@WHILE_END_Screen.drawCircle1 // 19036
D;JNE // 19037

////PushInstruction("argument 0")
@ARG // 19038
A=M // 19039
D=M // 19040
@SP // 19041
AM=M+1 // 19042
A=A-1 // 19043
M=D // 19044

////PushInstruction("local 0")
@LCL // 19045
A=M // 19046
D=M // 19047
@SP // 19048
AM=M+1 // 19049
A=A-1 // 19050
M=D // 19051

////ArithmeticInstruction{SUB}
@SP // 19052
AM=M-1 // 19053
D=M // 19054
A=A-1 // 19055
D=M-D // 19056

////PushInstruction("argument 0")
@ARG // 19057
A=M // 19058
D=M // 19059
@SP // 19060
AM=M+1 // 19061
A=A-1 // 19062
M=D // 19063

////PushInstruction("local 0")
@LCL // 19064
A=M // 19065
D=M // 19066
@SP // 19067
AM=M+1 // 19068
A=A-1 // 19069
M=D // 19070

////ArithmeticInstruction{ADD}
@SP // 19071
AM=M-1 // 19072
D=M // 19073
A=A-1 // 19074
D=D+M // 19075

////PushInstruction("argument 1")
@ARG // 19076
A=M+1 // 19077
D=M // 19078
@SP // 19079
AM=M+1 // 19080
A=A-1 // 19081
M=D // 19082

////PushInstruction("local 1")
@LCL // 19083
A=M+1 // 19084
D=M // 19085
@SP // 19086
AM=M+1 // 19087
A=A-1 // 19088
M=D // 19089

////ArithmeticInstruction{ADD}
@SP // 19090
AM=M-1 // 19091
D=M // 19092
A=A-1 // 19093
D=D+M // 19094

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=0, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 19095
D=A // 19096
@14 // 19097
M=D // 19098
@Screen.drawHorizontalLine // 19099
D=A // 19100
@13 // 19101
M=D // 19102
@Screen.drawCircle.ret.0 // 19103
D=A // 19104
@CALL // 19105
0;JMP // 19106
(Screen.drawCircle.ret.0)

////PopInstruction{address=temp 0}
@SP // 19107
AM=M-1 // 19108
D=M // 19109
@5 // 19110
M=D // 19111

////PushInstruction("argument 0")
@ARG // 19112
A=M // 19113
D=M // 19114
@SP // 19115
AM=M+1 // 19116
A=A-1 // 19117
M=D // 19118

////PushInstruction("local 0")
@LCL // 19119
A=M // 19120
D=M // 19121
@SP // 19122
AM=M+1 // 19123
A=A-1 // 19124
M=D // 19125

////ArithmeticInstruction{SUB}
@SP // 19126
AM=M-1 // 19127
D=M // 19128
A=A-1 // 19129
D=M-D // 19130

////PushInstruction("argument 0")
@ARG // 19131
A=M // 19132
D=M // 19133
@SP // 19134
AM=M+1 // 19135
A=A-1 // 19136
M=D // 19137

////PushInstruction("local 0")
@LCL // 19138
A=M // 19139
D=M // 19140
@SP // 19141
AM=M+1 // 19142
A=A-1 // 19143
M=D // 19144

////ArithmeticInstruction{ADD}
@SP // 19145
AM=M-1 // 19146
D=M // 19147
A=A-1 // 19148
D=D+M // 19149

////PushInstruction("argument 1")
@ARG // 19150
A=M+1 // 19151
D=M // 19152
@SP // 19153
AM=M+1 // 19154
A=A-1 // 19155
M=D // 19156

////PushInstruction("local 1")
@LCL // 19157
A=M+1 // 19158
D=M // 19159
@SP // 19160
AM=M+1 // 19161
A=A-1 // 19162
M=D // 19163

////ArithmeticInstruction{SUB}
@SP // 19164
AM=M-1 // 19165
D=M // 19166
A=A-1 // 19167
D=M-D // 19168

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=1, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 19169
D=A // 19170
@14 // 19171
M=D // 19172
@Screen.drawHorizontalLine // 19173
D=A // 19174
@13 // 19175
M=D // 19176
@Screen.drawCircle.ret.1 // 19177
D=A // 19178
@CALL // 19179
0;JMP // 19180
(Screen.drawCircle.ret.1)

////PopInstruction{address=temp 0}
@SP // 19181
AM=M-1 // 19182
D=M // 19183
@5 // 19184
M=D // 19185

////PushInstruction("argument 0")
@ARG // 19186
A=M // 19187
D=M // 19188
@SP // 19189
AM=M+1 // 19190
A=A-1 // 19191
M=D // 19192

////PushInstruction("local 1")
@LCL // 19193
A=M+1 // 19194
D=M // 19195
@SP // 19196
AM=M+1 // 19197
A=A-1 // 19198
M=D // 19199

////ArithmeticInstruction{SUB}
@SP // 19200
AM=M-1 // 19201
D=M // 19202
A=A-1 // 19203
D=M-D // 19204

////PushInstruction("argument 0")
@ARG // 19205
A=M // 19206
D=M // 19207
@SP // 19208
AM=M+1 // 19209
A=A-1 // 19210
M=D // 19211

////PushInstruction("local 1")
@LCL // 19212
A=M+1 // 19213
D=M // 19214
@SP // 19215
AM=M+1 // 19216
A=A-1 // 19217
M=D // 19218

////ArithmeticInstruction{ADD}
@SP // 19219
AM=M-1 // 19220
D=M // 19221
A=A-1 // 19222
D=D+M // 19223

////PushInstruction("argument 1")
@ARG // 19224
A=M+1 // 19225
D=M // 19226
@SP // 19227
AM=M+1 // 19228
A=A-1 // 19229
M=D // 19230

////PushInstruction("local 0")
@LCL // 19231
A=M // 19232
D=M // 19233
@SP // 19234
AM=M+1 // 19235
A=A-1 // 19236
M=D // 19237

////ArithmeticInstruction{ADD}
@SP // 19238
AM=M-1 // 19239
D=M // 19240
A=A-1 // 19241
D=D+M // 19242

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=2, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 19243
D=A // 19244
@14 // 19245
M=D // 19246
@Screen.drawHorizontalLine // 19247
D=A // 19248
@13 // 19249
M=D // 19250
@Screen.drawCircle.ret.2 // 19251
D=A // 19252
@CALL // 19253
0;JMP // 19254
(Screen.drawCircle.ret.2)

////PopInstruction{address=temp 0}
@SP // 19255
AM=M-1 // 19256
D=M // 19257
@5 // 19258
M=D // 19259

////PushInstruction("argument 0")
@ARG // 19260
A=M // 19261
D=M // 19262
@SP // 19263
AM=M+1 // 19264
A=A-1 // 19265
M=D // 19266

////PushInstruction("local 1")
@LCL // 19267
A=M+1 // 19268
D=M // 19269
@SP // 19270
AM=M+1 // 19271
A=A-1 // 19272
M=D // 19273

////ArithmeticInstruction{SUB}
@SP // 19274
AM=M-1 // 19275
D=M // 19276
A=A-1 // 19277
D=M-D // 19278

////PushInstruction("argument 0")
@ARG // 19279
A=M // 19280
D=M // 19281
@SP // 19282
AM=M+1 // 19283
A=A-1 // 19284
M=D // 19285

////PushInstruction("local 1")
@LCL // 19286
A=M+1 // 19287
D=M // 19288
@SP // 19289
AM=M+1 // 19290
A=A-1 // 19291
M=D // 19292

////ArithmeticInstruction{ADD}
@SP // 19293
AM=M-1 // 19294
D=M // 19295
A=A-1 // 19296
D=D+M // 19297

////PushInstruction("argument 1")
@ARG // 19298
A=M+1 // 19299
D=M // 19300
@SP // 19301
AM=M+1 // 19302
A=A-1 // 19303
M=D // 19304

////PushInstruction("local 0")
@LCL // 19305
A=M // 19306
D=M // 19307
@SP // 19308
AM=M+1 // 19309
A=A-1 // 19310
M=D // 19311

////ArithmeticInstruction{SUB}
@SP // 19312
AM=M-1 // 19313
D=M // 19314
A=A-1 // 19315
D=M-D // 19316

////CallInstruction{calleeFunction='Screen.drawHorizontalLine', numArgs=3, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=3, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawCircle'}
// call Screen.drawHorizontalLine
@8 // 19317
D=A // 19318
@14 // 19319
M=D // 19320
@Screen.drawHorizontalLine // 19321
D=A // 19322
@13 // 19323
M=D // 19324
@Screen.drawCircle.ret.3 // 19325
D=A // 19326
@CALL // 19327
0;JMP // 19328
(Screen.drawCircle.ret.3)

////PopInstruction{address=temp 0}
@SP // 19329
AM=M-1 // 19330
D=M // 19331
@5 // 19332
M=D // 19333

////PushInstruction("local 2")
@LCL // 19334
A=M+1 // 19335
A=A+1 // 19336
D=M // 19337
@SP // 19338
AM=M+1 // 19339
A=A-1 // 19340
M=D // 19341

////PushInstruction("constant 0")
@SP // 19342
AM=M+1 // 19343
A=A-1 // 19344
M=0 // 19345

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawCircle_lt18 // 19346
D=A // 19347
@13 // 19348
M=D // 19349
@SP // 19350
AM=M-1 // 19351
D=M // 19352
A=A-1 // 19353
D=M-D // 19354
@DO_LT // 19355
0;JMP // 19356
(COMPARE_Screen.drawCircle_lt18)

////PushInstruction("constant 0")
@SP // 19357
AM=M+1 // 19358
A=A-1 // 19359
M=0 // 19360

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawCircle_eq19 // 19361
D=A // 19362
@13 // 19363
M=D // 19364
@SP // 19365
AM=M-1 // 19366
D=M // 19367
A=A-1 // 19368
D=M-D // 19369
@DO_EQ // 19370
0;JMP // 19371
(COMPARE_Screen.drawCircle_eq19)

////IfGotoInstruction{label='Screen.drawCircle.IfElse1}
// if-goto Screen.drawCircle.IfElse1
@SP // 19372
AM=M-1 // 19373
D=M // 19374
@Screen.drawCircle.IfElse1 // 19375
D;JNE // 19376

////PushInstruction("local 2")
@LCL // 19377
A=M+1 // 19378
A=A+1 // 19379
D=M // 19380
@SP // 19381
AM=M+1 // 19382
A=A-1 // 19383
M=D // 19384

////PushInstruction("local 0")
@LCL // 19385
A=M // 19386
D=M // 19387
@SP // 19388
AM=M+1 // 19389
A=A-1 // 19390
M=D // 19391

////PushInstruction("local 0")
@LCL // 19392
A=M // 19393
D=M // 19394
@SP // 19395
AM=M+1 // 19396
A=A-1 // 19397
M=D // 19398

////ArithmeticInstruction{ADD}
@SP // 19399
AM=M-1 // 19400
D=M // 19401
A=A-1 // 19402
D=D+M // 19403

////ArithmeticInstruction{ADD}
@SP // 19404
AM=M-1 // 19405
D=M // 19406
A=A-1 // 19407
D=D+M // 19408

////PushInstruction("constant 3")
@3 // 19409
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
D=D+M // 19419

////PopInstruction{address=local 2}
@SP // 19420
AM=M-1 // 19421
D=M // 19422
@LCL // 19423
A=M+1 // 19424
A=A+1 // 19425
M=D // 19426

////GotoInstruction{label='Screen.drawCircle.IfElseEND1}
// goto Screen.drawCircle.IfElseEND1
@Screen.drawCircle.IfElseEND1 // 19427
0;JMP // 19428

////LabelInstruction{label='Screen.drawCircle.IfElse1}
// label Screen.drawCircle.IfElse1
(Screen.drawCircle.IfElse1)

////PushInstruction("local 2")
@LCL // 19429
A=M+1 // 19430
A=A+1 // 19431
D=M // 19432
@SP // 19433
AM=M+1 // 19434
A=A-1 // 19435
M=D // 19436

////PushInstruction("local 0")
@LCL // 19437
A=M // 19438
D=M // 19439
@SP // 19440
AM=M+1 // 19441
A=A-1 // 19442
M=D // 19443

////PushInstruction("local 1")
@LCL // 19444
A=M+1 // 19445
D=M // 19446
@SP // 19447
AM=M+1 // 19448
A=A-1 // 19449
M=D // 19450

////ArithmeticInstruction{SUB}
@SP // 19451
AM=M-1 // 19452
D=M // 19453
A=A-1 // 19454
D=M-D // 19455

////PushInstruction("local 0")
@LCL // 19456
A=M // 19457
D=M // 19458
@SP // 19459
AM=M+1 // 19460
A=A-1 // 19461
M=D // 19462

////PushInstruction("local 1")
@LCL // 19463
A=M+1 // 19464
D=M // 19465
@SP // 19466
AM=M+1 // 19467
A=A-1 // 19468
M=D // 19469

////ArithmeticInstruction{SUB}
@SP // 19470
AM=M-1 // 19471
D=M // 19472
A=A-1 // 19473
D=M-D // 19474

////ArithmeticInstruction{ADD}
@SP // 19475
AM=M-1 // 19476
D=M // 19477
A=A-1 // 19478
D=D+M // 19479

////ArithmeticInstruction{ADD}
@SP // 19480
AM=M-1 // 19481
D=M // 19482
A=A-1 // 19483
D=D+M // 19484

////PushInstruction("constant 5")
@5 // 19485
D=A // 19486
@SP // 19487
AM=M+1 // 19488
A=A-1 // 19489
M=D // 19490

////ArithmeticInstruction{ADD}
@SP // 19491
AM=M-1 // 19492
D=M // 19493
A=A-1 // 19494
D=D+M // 19495

////PopInstruction{address=local 2}
@SP // 19496
AM=M-1 // 19497
D=M // 19498
@LCL // 19499
A=M+1 // 19500
A=A+1 // 19501
M=D // 19502

////PushInstruction("local 1")
@LCL // 19503
A=M+1 // 19504
D=M // 19505
@SP // 19506
AM=M+1 // 19507
A=A-1 // 19508
M=D // 19509

////PushInstruction("constant 1")
@SP // 19510
AM=M+1 // 19511
A=A-1 // 19512
M=1 // 19513

////ArithmeticInstruction{SUB}
@SP // 19514
AM=M-1 // 19515
D=M // 19516
A=A-1 // 19517
D=M-D // 19518

////PopInstruction{address=local 1}
@SP // 19519
AM=M-1 // 19520
D=M // 19521
@LCL // 19522
A=M+1 // 19523
M=D // 19524

////LabelInstruction{label='Screen.drawCircle.IfElseEND1}
// label Screen.drawCircle.IfElseEND1
(Screen.drawCircle.IfElseEND1)

////PushInstruction("local 0")
@LCL // 19525
A=M // 19526
D=M // 19527
@SP // 19528
AM=M+1 // 19529
A=A-1 // 19530
M=D // 19531

////PushInstruction("constant 1")
@SP // 19532
AM=M+1 // 19533
A=A-1 // 19534
M=1 // 19535

////ArithmeticInstruction{ADD}
@SP // 19536
AM=M-1 // 19537
D=M // 19538
A=A-1 // 19539
D=D+M // 19540

////PopInstruction{address=local 0}
@SP // 19541
AM=M-1 // 19542
D=M // 19543
@LCL // 19544
A=M // 19545
M=D // 19546

////GotoInstruction{label='WHILE_START_Screen.drawCircle1}
// goto WHILE_START_Screen.drawCircle1
@WHILE_START_Screen.drawCircle1 // 19547
0;JMP // 19548

////LabelInstruction{label='WHILE_END_Screen.drawCircle1}
// label WHILE_END_Screen.drawCircle1
(WHILE_END_Screen.drawCircle1)

////PushInstruction("constant 0")
@SP // 19549
AM=M+1 // 19550
A=A-1 // 19551
M=0 // 19552

////ReturnInstruction{}
@RETURN // 19553
0;JMP // 19554

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@SP // 19555
AM=M+1 // 19556
A=A-1 // 19557
M=0 // 19558
@SP // 19559
AM=M+1 // 19560
A=A-1 // 19561
M=0 // 19562
@SP // 19563
AM=M+1 // 19564
A=A-1 // 19565
M=0 // 19566
@SP // 19567
AM=M+1 // 19568
A=A-1 // 19569
M=0 // 19570
@SP // 19571
AM=M+1 // 19572
A=A-1 // 19573
M=0 // 19574
@SP // 19575
AM=M+1 // 19576
A=A-1 // 19577
M=0 // 19578
@SP // 19579
AM=M+1 // 19580
A=A-1 // 19581
M=0 // 19582
@SP // 19583
AM=M+1 // 19584
A=A-1 // 19585
M=0 // 19586
@SP // 19587
AM=M+1 // 19588
A=A-1 // 19589
M=0 // 19590
@SP // 19591
AM=M+1 // 19592
A=A-1 // 19593
M=0 // 19594

////PushInstruction("constant 1")
@SP // 19595
AM=M+1 // 19596
A=A-1 // 19597
M=1 // 19598

////ArithmeticInstruction{NEG}
@SP // 19599
A=M-1 // 19600
M=-M // 19601

////PopInstruction{address=local 9}
@LCL // 19602
D=M // 19603
@9 // 19604
A=D+A // 19605
D=A // 19606
@R13 // 19607
M=D // 19608
@SP // 19609
AM=M-1 // 19610
D=M // 19611
@R13 // 19612
A=M // 19613
M=D // 19614

////PushInstruction("static 0")
@Screen.0 // 19615
D=M // 19616
@SP // 19617
AM=M+1 // 19618
A=A-1 // 19619
M=D // 19620

////ArithmeticInstruction{NOT}
@SP // 19621
A=M-1 // 19622
M=!M // 19623

////PushInstruction("constant 0")
@SP // 19624
AM=M+1 // 19625
A=A-1 // 19626
M=0 // 19627

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq20 // 19628
D=A // 19629
@13 // 19630
M=D // 19631
@SP // 19632
AM=M-1 // 19633
D=M // 19634
A=A-1 // 19635
D=M-D // 19636
@DO_EQ // 19637
0;JMP // 19638
(COMPARE_Screen.drawRectangle_eq20)

////IfGotoInstruction{label='Screen.drawRectangle.IfElse1}
// if-goto Screen.drawRectangle.IfElse1
@SP // 19639
AM=M-1 // 19640
D=M // 19641
@Screen.drawRectangle.IfElse1 // 19642
D;JNE // 19643

////PushInstruction("constant 0")
@SP // 19644
AM=M+1 // 19645
A=A-1 // 19646
M=0 // 19647

////PopInstruction{address=local 9}
@LCL // 19648
D=M // 19649
@9 // 19650
A=D+A // 19651
D=A // 19652
@R13 // 19653
M=D // 19654
@SP // 19655
AM=M-1 // 19656
D=M // 19657
@R13 // 19658
A=M // 19659
M=D // 19660

////GotoInstruction{label='Screen.drawRectangle.IfElseEND1}
// goto Screen.drawRectangle.IfElseEND1
@Screen.drawRectangle.IfElseEND1 // 19661
0;JMP // 19662

////LabelInstruction{label='Screen.drawRectangle.IfElse1}
// label Screen.drawRectangle.IfElse1
(Screen.drawRectangle.IfElse1)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND1}
// label Screen.drawRectangle.IfElseEND1
(Screen.drawRectangle.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 19663
A=M+1 // 19664
D=M // 19665
@SP // 19666
AM=M+1 // 19667
A=A-1 // 19668
M=D // 19669

////PopInstruction{address=local 0}
@SP // 19670
AM=M-1 // 19671
D=M // 19672
@LCL // 19673
A=M // 19674
M=D // 19675

////LabelInstruction{label='WHILE_START_Screen.drawRectangle1}
// label WHILE_START_Screen.drawRectangle1
(WHILE_START_Screen.drawRectangle1)

////PushInstruction("local 0")
@LCL // 19676
A=M // 19677
D=M // 19678
@SP // 19679
AM=M+1 // 19680
A=A-1 // 19681
M=D // 19682

////PushInstruction("argument 3")
@ARG // 19683
A=M+1 // 19684
A=A+1 // 19685
A=A+1 // 19686
D=M // 19687
@SP // 19688
AM=M+1 // 19689
A=A-1 // 19690
M=D // 19691

////ArithmeticInstruction{GT}
@COMPARE_Screen.drawRectangle_gt21 // 19692
D=A // 19693
@13 // 19694
M=D // 19695
@SP // 19696
AM=M-1 // 19697
D=M // 19698
A=A-1 // 19699
D=M-D // 19700
@DO_GT // 19701
0;JMP // 19702
(COMPARE_Screen.drawRectangle_gt21)

////ArithmeticInstruction{NOT}
@SP // 19703
A=M-1 // 19704
M=!M // 19705

////PushInstruction("constant 0")
@SP // 19706
AM=M+1 // 19707
A=A-1 // 19708
M=0 // 19709

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq22 // 19710
D=A // 19711
@13 // 19712
M=D // 19713
@SP // 19714
AM=M-1 // 19715
D=M // 19716
A=A-1 // 19717
D=M-D // 19718
@DO_EQ // 19719
0;JMP // 19720
(COMPARE_Screen.drawRectangle_eq22)

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle1}
// if-goto WHILE_END_Screen.drawRectangle1
@SP // 19721
AM=M-1 // 19722
D=M // 19723
@WHILE_END_Screen.drawRectangle1 // 19724
D;JNE // 19725

////PushInstruction("argument 0")
@ARG // 19726
A=M // 19727
D=M // 19728
@SP // 19729
AM=M+1 // 19730
A=A-1 // 19731
M=D // 19732

////PushInstruction("constant 16")
@16 // 19733
D=A // 19734
@SP // 19735
AM=M+1 // 19736
A=A-1 // 19737
M=D // 19738

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=0, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 19739
D=A // 19740
@14 // 19741
M=D // 19742
@Math.divide // 19743
D=A // 19744
@13 // 19745
M=D // 19746
@Screen.drawRectangle.ret.0 // 19747
D=A // 19748
@CALL // 19749
0;JMP // 19750
(Screen.drawRectangle.ret.0)

////PopInstruction{address=local 1}
@SP // 19751
AM=M-1 // 19752
D=M // 19753
@LCL // 19754
A=M+1 // 19755
M=D // 19756

////PushInstruction("argument 2")
@ARG // 19757
A=M+1 // 19758
A=A+1 // 19759
D=M // 19760
@SP // 19761
AM=M+1 // 19762
A=A-1 // 19763
M=D // 19764

////PushInstruction("constant 16")
@16 // 19765
D=A // 19766
@SP // 19767
AM=M+1 // 19768
A=A-1 // 19769
M=D // 19770

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=1, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.divide
@7 // 19771
D=A // 19772
@14 // 19773
M=D // 19774
@Math.divide // 19775
D=A // 19776
@13 // 19777
M=D // 19778
@Screen.drawRectangle.ret.1 // 19779
D=A // 19780
@CALL // 19781
0;JMP // 19782
(Screen.drawRectangle.ret.1)

////PopInstruction{address=local 2}
@SP // 19783
AM=M-1 // 19784
D=M // 19785
@LCL // 19786
A=M+1 // 19787
A=A+1 // 19788
M=D // 19789

////PushInstruction("argument 0")
@ARG // 19790
A=M // 19791
D=M // 19792
@SP // 19793
AM=M+1 // 19794
A=A-1 // 19795
M=D // 19796

////PushInstruction("constant 15")
@15 // 19797
D=A // 19798
@SP // 19799
AM=M+1 // 19800
A=A-1 // 19801
M=D // 19802

////ArithmeticInstruction{AND}
@SP // 19803
AM=M-1 // 19804
D=M // 19805
A=A-1 // 19806
D=D&M // 19807

////PopInstruction{address=local 3}
@SP // 19808
AM=M-1 // 19809
D=M // 19810
@LCL // 19811
A=M+1 // 19812
A=A+1 // 19813
A=A+1 // 19814
M=D // 19815

////PushInstruction("argument 2")
@ARG // 19816
A=M+1 // 19817
A=A+1 // 19818
D=M // 19819
@SP // 19820
AM=M+1 // 19821
A=A-1 // 19822
M=D // 19823

////PushInstruction("constant 15")
@15 // 19824
D=A // 19825
@SP // 19826
AM=M+1 // 19827
A=A-1 // 19828
M=D // 19829

////ArithmeticInstruction{AND}
@SP // 19830
AM=M-1 // 19831
D=M // 19832
A=A-1 // 19833
D=D&M // 19834

////PopInstruction{address=local 4}
@LCL // 19835
D=M // 19836
@4 // 19837
A=D+A // 19838
D=A // 19839
@R13 // 19840
M=D // 19841
@SP // 19842
AM=M-1 // 19843
D=M // 19844
@R13 // 19845
A=M // 19846
M=D // 19847

////PushInstruction("local 0")
@LCL // 19848
A=M // 19849
D=M // 19850
@SP // 19851
AM=M+1 // 19852
A=A-1 // 19853
M=D // 19854

////PushInstruction("constant 32")
@32 // 19855
D=A // 19856
@SP // 19857
AM=M+1 // 19858
A=A-1 // 19859
M=D // 19860

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=2, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.multiply
@7 // 19861
D=A // 19862
@14 // 19863
M=D // 19864
@Math.multiply // 19865
D=A // 19866
@13 // 19867
M=D // 19868
@Screen.drawRectangle.ret.2 // 19869
D=A // 19870
@CALL // 19871
0;JMP // 19872
(Screen.drawRectangle.ret.2)

////PopInstruction{address=local 5}
@LCL // 19873
D=M // 19874
@5 // 19875
A=D+A // 19876
D=A // 19877
@R13 // 19878
M=D // 19879
@SP // 19880
AM=M-1 // 19881
D=M // 19882
@R13 // 19883
A=M // 19884
M=D // 19885

////PushInstruction("local 1")
@LCL // 19886
A=M+1 // 19887
D=M // 19888
@SP // 19889
AM=M+1 // 19890
A=A-1 // 19891
M=D // 19892

////PushInstruction("local 2")
@LCL // 19893
A=M+1 // 19894
A=A+1 // 19895
D=M // 19896
@SP // 19897
AM=M+1 // 19898
A=A-1 // 19899
M=D // 19900

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq23 // 19901
D=A // 19902
@13 // 19903
M=D // 19904
@SP // 19905
AM=M-1 // 19906
D=M // 19907
A=A-1 // 19908
D=M-D // 19909
@DO_EQ // 19910
0;JMP // 19911
(COMPARE_Screen.drawRectangle_eq23)

////PushInstruction("constant 0")
@SP // 19912
AM=M+1 // 19913
A=A-1 // 19914
M=0 // 19915

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq24 // 19916
D=A // 19917
@13 // 19918
M=D // 19919
@SP // 19920
AM=M-1 // 19921
D=M // 19922
A=A-1 // 19923
D=M-D // 19924
@DO_EQ // 19925
0;JMP // 19926
(COMPARE_Screen.drawRectangle_eq24)

////IfGotoInstruction{label='Screen.drawRectangle.IfElse2}
// if-goto Screen.drawRectangle.IfElse2
@SP // 19927
AM=M-1 // 19928
D=M // 19929
@Screen.drawRectangle.IfElse2 // 19930
D;JNE // 19931

////PushInstruction("local 4")
@LCL // 19932
D=M // 19933
@4 // 19934
A=D+A // 19935
D=M // 19936
@SP // 19937
AM=M+1 // 19938
A=A-1 // 19939
M=D // 19940

////PushInstruction("constant 1")
@SP // 19941
AM=M+1 // 19942
A=A-1 // 19943
M=1 // 19944

////ArithmeticInstruction{ADD}
@SP // 19945
AM=M-1 // 19946
D=M // 19947
A=A-1 // 19948
D=D+M // 19949

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=3, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 19950
D=A // 19951
@14 // 19952
M=D // 19953
@Math.twoToThe // 19954
D=A // 19955
@13 // 19956
M=D // 19957
@Screen.drawRectangle.ret.3 // 19958
D=A // 19959
@CALL // 19960
0;JMP // 19961
(Screen.drawRectangle.ret.3)

////PushInstruction("constant 1")
@SP // 19962
AM=M+1 // 19963
A=A-1 // 19964
M=1 // 19965

////ArithmeticInstruction{SUB}
@SP // 19966
AM=M-1 // 19967
D=M // 19968
A=A-1 // 19969
D=M-D // 19970

////PushInstruction("local 3")
@LCL // 19971
A=M+1 // 19972
A=A+1 // 19973
A=A+1 // 19974
D=M // 19975
@SP // 19976
AM=M+1 // 19977
A=A-1 // 19978
M=D // 19979

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=4, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 19980
D=A // 19981
@14 // 19982
M=D // 19983
@Math.twoToThe // 19984
D=A // 19985
@13 // 19986
M=D // 19987
@Screen.drawRectangle.ret.4 // 19988
D=A // 19989
@CALL // 19990
0;JMP // 19991
(Screen.drawRectangle.ret.4)

////PushInstruction("constant 1")
@SP // 19992
AM=M+1 // 19993
A=A-1 // 19994
M=1 // 19995

////ArithmeticInstruction{SUB}
@SP // 19996
AM=M-1 // 19997
D=M // 19998
A=A-1 // 19999
D=M-D // 20000

////ArithmeticInstruction{SUB}
@SP // 20001
AM=M-1 // 20002
D=M // 20003
A=A-1 // 20004
D=M-D // 20005

////PopInstruction{address=local 6}
@LCL // 20006
D=M // 20007
@6 // 20008
A=D+A // 20009
D=A // 20010
@R13 // 20011
M=D // 20012
@SP // 20013
AM=M-1 // 20014
D=M // 20015
@R13 // 20016
A=M // 20017
M=D // 20018

////PushInstruction("local 5")
@LCL // 20019
D=M // 20020
@5 // 20021
A=D+A // 20022
D=M // 20023
@SP // 20024
AM=M+1 // 20025
A=A-1 // 20026
M=D // 20027

////PushInstruction("local 1")
@LCL // 20028
A=M+1 // 20029
D=M // 20030
@SP // 20031
AM=M+1 // 20032
A=A-1 // 20033
M=D // 20034

////ArithmeticInstruction{ADD}
@SP // 20035
AM=M-1 // 20036
D=M // 20037
A=A-1 // 20038
D=D+M // 20039

////PopInstruction{address=local 7}
@LCL // 20040
D=M // 20041
@7 // 20042
A=D+A // 20043
D=A // 20044
@R13 // 20045
M=D // 20046
@SP // 20047
AM=M-1 // 20048
D=M // 20049
@R13 // 20050
A=M // 20051
M=D // 20052

////PushInstruction("static 0")
@Screen.0 // 20053
D=M // 20054
@SP // 20055
AM=M+1 // 20056
A=A-1 // 20057
M=D // 20058

////PushInstruction("constant 0")
@SP // 20059
AM=M+1 // 20060
A=A-1 // 20061
M=0 // 20062

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq25 // 20063
D=A // 20064
@13 // 20065
M=D // 20066
@SP // 20067
AM=M-1 // 20068
D=M // 20069
A=A-1 // 20070
D=M-D // 20071
@DO_EQ // 20072
0;JMP // 20073
(COMPARE_Screen.drawRectangle_eq25)

////IfGotoInstruction{label='Screen.drawRectangle.IfElse3}
// if-goto Screen.drawRectangle.IfElse3
@SP // 20074
AM=M-1 // 20075
D=M // 20076
@Screen.drawRectangle.IfElse3 // 20077
D;JNE // 20078

////PushInstruction("constant 16384")
@16384 // 20079
D=A // 20080
@SP // 20081
AM=M+1 // 20082
A=A-1 // 20083
M=D // 20084

////PushInstruction("local 7")
@LCL // 20085
D=M // 20086
@7 // 20087
A=D+A // 20088
D=M // 20089
@SP // 20090
AM=M+1 // 20091
A=A-1 // 20092
M=D // 20093

////ArithmeticInstruction{ADD}
@SP // 20094
AM=M-1 // 20095
D=M // 20096
A=A-1 // 20097
D=D+M // 20098

////PopInstruction{address=pointer 1}
@SP // 20099
AM=M-1 // 20100
D=M // 20101
@4 // 20102
M=D // 20103

////PushInstruction("that 0")
@THAT // 20104
A=M // 20105
D=M // 20106
@SP // 20107
AM=M+1 // 20108
A=A-1 // 20109
M=D // 20110

////PushInstruction("local 6")
@LCL // 20111
D=M // 20112
@6 // 20113
A=D+A // 20114
D=M // 20115
@SP // 20116
AM=M+1 // 20117
A=A-1 // 20118
M=D // 20119

////ArithmeticInstruction{OR}
@SP // 20120
AM=M-1 // 20121
D=M // 20122
A=A-1 // 20123
D=D|M // 20124

////PushInstruction("constant 16384")
@16384 // 20125
D=A // 20126
@SP // 20127
AM=M+1 // 20128
A=A-1 // 20129
M=D // 20130

////PushInstruction("local 7")
@LCL // 20131
D=M // 20132
@7 // 20133
A=D+A // 20134
D=M // 20135
@SP // 20136
AM=M+1 // 20137
A=A-1 // 20138
M=D // 20139

////ArithmeticInstruction{ADD}
@SP // 20140
AM=M-1 // 20141
D=M // 20142
A=A-1 // 20143
D=D+M // 20144

////PopInstruction{address=pointer 1}
@SP // 20145
AM=M-1 // 20146
D=M // 20147
@4 // 20148
M=D // 20149

////PopInstruction{address=that 0}
@SP // 20150
AM=M-1 // 20151
D=M // 20152
@THAT // 20153
A=M // 20154
M=D // 20155

////GotoInstruction{label='Screen.drawRectangle.IfElseEND3}
// goto Screen.drawRectangle.IfElseEND3
@Screen.drawRectangle.IfElseEND3 // 20156
0;JMP // 20157

////LabelInstruction{label='Screen.drawRectangle.IfElse3}
// label Screen.drawRectangle.IfElse3
(Screen.drawRectangle.IfElse3)

////PushInstruction("constant 16384")
@16384 // 20158
D=A // 20159
@SP // 20160
AM=M+1 // 20161
A=A-1 // 20162
M=D // 20163

////PushInstruction("local 7")
@LCL // 20164
D=M // 20165
@7 // 20166
A=D+A // 20167
D=M // 20168
@SP // 20169
AM=M+1 // 20170
A=A-1 // 20171
M=D // 20172

////ArithmeticInstruction{ADD}
@SP // 20173
AM=M-1 // 20174
D=M // 20175
A=A-1 // 20176
D=D+M // 20177

////PopInstruction{address=pointer 1}
@SP // 20178
AM=M-1 // 20179
D=M // 20180
@4 // 20181
M=D // 20182

////PushInstruction("that 0")
@THAT // 20183
A=M // 20184
D=M // 20185
@SP // 20186
AM=M+1 // 20187
A=A-1 // 20188
M=D // 20189

////PushInstruction("local 6")
@LCL // 20190
D=M // 20191
@6 // 20192
A=D+A // 20193
D=M // 20194
@SP // 20195
AM=M+1 // 20196
A=A-1 // 20197
M=D // 20198

////ArithmeticInstruction{NOT}
@SP // 20199
A=M-1 // 20200
M=!M // 20201

////ArithmeticInstruction{AND}
@SP // 20202
AM=M-1 // 20203
D=M // 20204
A=A-1 // 20205
D=D&M // 20206

////PushInstruction("constant 16384")
@16384 // 20207
D=A // 20208
@SP // 20209
AM=M+1 // 20210
A=A-1 // 20211
M=D // 20212

////PushInstruction("local 7")
@LCL // 20213
D=M // 20214
@7 // 20215
A=D+A // 20216
D=M // 20217
@SP // 20218
AM=M+1 // 20219
A=A-1 // 20220
M=D // 20221

////ArithmeticInstruction{ADD}
@SP // 20222
AM=M-1 // 20223
D=M // 20224
A=A-1 // 20225
D=D+M // 20226

////PopInstruction{address=pointer 1}
@SP // 20227
AM=M-1 // 20228
D=M // 20229
@4 // 20230
M=D // 20231

////PopInstruction{address=that 0}
@SP // 20232
AM=M-1 // 20233
D=M // 20234
@THAT // 20235
A=M // 20236
M=D // 20237

////LabelInstruction{label='Screen.drawRectangle.IfElseEND3}
// label Screen.drawRectangle.IfElseEND3
(Screen.drawRectangle.IfElseEND3)

////GotoInstruction{label='Screen.drawRectangle.IfElseEND2}
// goto Screen.drawRectangle.IfElseEND2
@Screen.drawRectangle.IfElseEND2 // 20238
0;JMP // 20239

////LabelInstruction{label='Screen.drawRectangle.IfElse2}
// label Screen.drawRectangle.IfElse2
(Screen.drawRectangle.IfElse2)

////PushInstruction("local 3")
@LCL // 20240
A=M+1 // 20241
A=A+1 // 20242
A=A+1 // 20243
D=M // 20244
@SP // 20245
AM=M+1 // 20246
A=A-1 // 20247
M=D // 20248

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=5, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 20249
D=A // 20250
@14 // 20251
M=D // 20252
@Math.twoToThe // 20253
D=A // 20254
@13 // 20255
M=D // 20256
@Screen.drawRectangle.ret.5 // 20257
D=A // 20258
@CALL // 20259
0;JMP // 20260
(Screen.drawRectangle.ret.5)

////PushInstruction("constant 1")
@SP // 20261
AM=M+1 // 20262
A=A-1 // 20263
M=1 // 20264

////ArithmeticInstruction{SUB}
@SP // 20265
AM=M-1 // 20266
D=M // 20267
A=A-1 // 20268
D=M-D // 20269

////ArithmeticInstruction{NOT}
@SP // 20270
A=M-1 // 20271
M=!M // 20272

////PopInstruction{address=local 6}
@LCL // 20273
D=M // 20274
@6 // 20275
A=D+A // 20276
D=A // 20277
@R13 // 20278
M=D // 20279
@SP // 20280
AM=M-1 // 20281
D=M // 20282
@R13 // 20283
A=M // 20284
M=D // 20285

////PushInstruction("local 5")
@LCL // 20286
D=M // 20287
@5 // 20288
A=D+A // 20289
D=M // 20290
@SP // 20291
AM=M+1 // 20292
A=A-1 // 20293
M=D // 20294

////PushInstruction("local 1")
@LCL // 20295
A=M+1 // 20296
D=M // 20297
@SP // 20298
AM=M+1 // 20299
A=A-1 // 20300
M=D // 20301

////ArithmeticInstruction{ADD}
@SP // 20302
AM=M-1 // 20303
D=M // 20304
A=A-1 // 20305
D=D+M // 20306

////PopInstruction{address=local 7}
@LCL // 20307
D=M // 20308
@7 // 20309
A=D+A // 20310
D=A // 20311
@R13 // 20312
M=D // 20313
@SP // 20314
AM=M-1 // 20315
D=M // 20316
@R13 // 20317
A=M // 20318
M=D // 20319

////PushInstruction("static 0")
@Screen.0 // 20320
D=M // 20321
@SP // 20322
AM=M+1 // 20323
A=A-1 // 20324
M=D // 20325

////PushInstruction("constant 0")
@SP // 20326
AM=M+1 // 20327
A=A-1 // 20328
M=0 // 20329

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq26 // 20330
D=A // 20331
@13 // 20332
M=D // 20333
@SP // 20334
AM=M-1 // 20335
D=M // 20336
A=A-1 // 20337
D=M-D // 20338
@DO_EQ // 20339
0;JMP // 20340
(COMPARE_Screen.drawRectangle_eq26)

////IfGotoInstruction{label='Screen.drawRectangle.IfElse4}
// if-goto Screen.drawRectangle.IfElse4
@SP // 20341
AM=M-1 // 20342
D=M // 20343
@Screen.drawRectangle.IfElse4 // 20344
D;JNE // 20345

////PushInstruction("constant 16384")
@16384 // 20346
D=A // 20347
@SP // 20348
AM=M+1 // 20349
A=A-1 // 20350
M=D // 20351

////PushInstruction("local 7")
@LCL // 20352
D=M // 20353
@7 // 20354
A=D+A // 20355
D=M // 20356
@SP // 20357
AM=M+1 // 20358
A=A-1 // 20359
M=D // 20360

////ArithmeticInstruction{ADD}
@SP // 20361
AM=M-1 // 20362
D=M // 20363
A=A-1 // 20364
D=D+M // 20365

////PopInstruction{address=pointer 1}
@SP // 20366
AM=M-1 // 20367
D=M // 20368
@4 // 20369
M=D // 20370

////PushInstruction("that 0")
@THAT // 20371
A=M // 20372
D=M // 20373
@SP // 20374
AM=M+1 // 20375
A=A-1 // 20376
M=D // 20377

////PushInstruction("local 6")
@LCL // 20378
D=M // 20379
@6 // 20380
A=D+A // 20381
D=M // 20382
@SP // 20383
AM=M+1 // 20384
A=A-1 // 20385
M=D // 20386

////ArithmeticInstruction{OR}
@SP // 20387
AM=M-1 // 20388
D=M // 20389
A=A-1 // 20390
D=D|M // 20391

////PushInstruction("constant 16384")
@16384 // 20392
D=A // 20393
@SP // 20394
AM=M+1 // 20395
A=A-1 // 20396
M=D // 20397

////PushInstruction("local 7")
@LCL // 20398
D=M // 20399
@7 // 20400
A=D+A // 20401
D=M // 20402
@SP // 20403
AM=M+1 // 20404
A=A-1 // 20405
M=D // 20406

////ArithmeticInstruction{ADD}
@SP // 20407
AM=M-1 // 20408
D=M // 20409
A=A-1 // 20410
D=D+M // 20411

////PopInstruction{address=pointer 1}
@SP // 20412
AM=M-1 // 20413
D=M // 20414
@4 // 20415
M=D // 20416

////PopInstruction{address=that 0}
@SP // 20417
AM=M-1 // 20418
D=M // 20419
@THAT // 20420
A=M // 20421
M=D // 20422

////GotoInstruction{label='Screen.drawRectangle.IfElseEND4}
// goto Screen.drawRectangle.IfElseEND4
@Screen.drawRectangle.IfElseEND4 // 20423
0;JMP // 20424

////LabelInstruction{label='Screen.drawRectangle.IfElse4}
// label Screen.drawRectangle.IfElse4
(Screen.drawRectangle.IfElse4)

////PushInstruction("constant 16384")
@16384 // 20425
D=A // 20426
@SP // 20427
AM=M+1 // 20428
A=A-1 // 20429
M=D // 20430

////PushInstruction("local 7")
@LCL // 20431
D=M // 20432
@7 // 20433
A=D+A // 20434
D=M // 20435
@SP // 20436
AM=M+1 // 20437
A=A-1 // 20438
M=D // 20439

////ArithmeticInstruction{ADD}
@SP // 20440
AM=M-1 // 20441
D=M // 20442
A=A-1 // 20443
D=D+M // 20444

////PopInstruction{address=pointer 1}
@SP // 20445
AM=M-1 // 20446
D=M // 20447
@4 // 20448
M=D // 20449

////PushInstruction("that 0")
@THAT // 20450
A=M // 20451
D=M // 20452
@SP // 20453
AM=M+1 // 20454
A=A-1 // 20455
M=D // 20456

////PushInstruction("local 6")
@LCL // 20457
D=M // 20458
@6 // 20459
A=D+A // 20460
D=M // 20461
@SP // 20462
AM=M+1 // 20463
A=A-1 // 20464
M=D // 20465

////ArithmeticInstruction{NOT}
@SP // 20466
A=M-1 // 20467
M=!M // 20468

////ArithmeticInstruction{AND}
@SP // 20469
AM=M-1 // 20470
D=M // 20471
A=A-1 // 20472
D=D&M // 20473

////PushInstruction("constant 16384")
@16384 // 20474
D=A // 20475
@SP // 20476
AM=M+1 // 20477
A=A-1 // 20478
M=D // 20479

////PushInstruction("local 7")
@LCL // 20480
D=M // 20481
@7 // 20482
A=D+A // 20483
D=M // 20484
@SP // 20485
AM=M+1 // 20486
A=A-1 // 20487
M=D // 20488

////ArithmeticInstruction{ADD}
@SP // 20489
AM=M-1 // 20490
D=M // 20491
A=A-1 // 20492
D=D+M // 20493

////PopInstruction{address=pointer 1}
@SP // 20494
AM=M-1 // 20495
D=M // 20496
@4 // 20497
M=D // 20498

////PopInstruction{address=that 0}
@SP // 20499
AM=M-1 // 20500
D=M // 20501
@THAT // 20502
A=M // 20503
M=D // 20504

////LabelInstruction{label='Screen.drawRectangle.IfElseEND4}
// label Screen.drawRectangle.IfElseEND4
(Screen.drawRectangle.IfElseEND4)

////PushInstruction("local 1")
@LCL // 20505
A=M+1 // 20506
D=M // 20507
@SP // 20508
AM=M+1 // 20509
A=A-1 // 20510
M=D // 20511

////PushInstruction("constant 1")
@SP // 20512
AM=M+1 // 20513
A=A-1 // 20514
M=1 // 20515

////ArithmeticInstruction{ADD}
@SP // 20516
AM=M-1 // 20517
D=M // 20518
A=A-1 // 20519
D=D+M // 20520

////PopInstruction{address=local 8}
@LCL // 20521
D=M // 20522
@8 // 20523
A=D+A // 20524
D=A // 20525
@R13 // 20526
M=D // 20527
@SP // 20528
AM=M-1 // 20529
D=M // 20530
@R13 // 20531
A=M // 20532
M=D // 20533

////LabelInstruction{label='WHILE_START_Screen.drawRectangle2}
// label WHILE_START_Screen.drawRectangle2
(WHILE_START_Screen.drawRectangle2)

////PushInstruction("local 8")
@LCL // 20534
D=M // 20535
@8 // 20536
A=D+A // 20537
D=M // 20538
@SP // 20539
AM=M+1 // 20540
A=A-1 // 20541
M=D // 20542

////PushInstruction("local 2")
@LCL // 20543
A=M+1 // 20544
A=A+1 // 20545
D=M // 20546
@SP // 20547
AM=M+1 // 20548
A=A-1 // 20549
M=D // 20550

////ArithmeticInstruction{LT}
@COMPARE_Screen.drawRectangle_lt27 // 20551
D=A // 20552
@13 // 20553
M=D // 20554
@SP // 20555
AM=M-1 // 20556
D=M // 20557
A=A-1 // 20558
D=M-D // 20559
@DO_LT // 20560
0;JMP // 20561
(COMPARE_Screen.drawRectangle_lt27)

////PushInstruction("constant 0")
@SP // 20562
AM=M+1 // 20563
A=A-1 // 20564
M=0 // 20565

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq28 // 20566
D=A // 20567
@13 // 20568
M=D // 20569
@SP // 20570
AM=M-1 // 20571
D=M // 20572
A=A-1 // 20573
D=M-D // 20574
@DO_EQ // 20575
0;JMP // 20576
(COMPARE_Screen.drawRectangle_eq28)

////IfGotoInstruction{label='WHILE_END_Screen.drawRectangle2}
// if-goto WHILE_END_Screen.drawRectangle2
@SP // 20577
AM=M-1 // 20578
D=M // 20579
@WHILE_END_Screen.drawRectangle2 // 20580
D;JNE // 20581

////PushInstruction("local 5")
@LCL // 20582
D=M // 20583
@5 // 20584
A=D+A // 20585
D=M // 20586
@SP // 20587
AM=M+1 // 20588
A=A-1 // 20589
M=D // 20590

////PushInstruction("local 8")
@LCL // 20591
D=M // 20592
@8 // 20593
A=D+A // 20594
D=M // 20595
@SP // 20596
AM=M+1 // 20597
A=A-1 // 20598
M=D // 20599

////ArithmeticInstruction{ADD}
@SP // 20600
AM=M-1 // 20601
D=M // 20602
A=A-1 // 20603
D=D+M // 20604

////PopInstruction{address=local 7}
@LCL // 20605
D=M // 20606
@7 // 20607
A=D+A // 20608
D=A // 20609
@R13 // 20610
M=D // 20611
@SP // 20612
AM=M-1 // 20613
D=M // 20614
@R13 // 20615
A=M // 20616
M=D // 20617

////PushInstruction("local 9")
@LCL // 20618
D=M // 20619
@9 // 20620
A=D+A // 20621
D=M // 20622
@SP // 20623
AM=M+1 // 20624
A=A-1 // 20625
M=D // 20626

////PushInstruction("constant 16384")
@16384 // 20627
D=A // 20628
@SP // 20629
AM=M+1 // 20630
A=A-1 // 20631
M=D // 20632

////PushInstruction("local 7")
@LCL // 20633
D=M // 20634
@7 // 20635
A=D+A // 20636
D=M // 20637
@SP // 20638
AM=M+1 // 20639
A=A-1 // 20640
M=D // 20641

////ArithmeticInstruction{ADD}
@SP // 20642
AM=M-1 // 20643
D=M // 20644
A=A-1 // 20645
D=D+M // 20646

////PopInstruction{address=pointer 1}
@SP // 20647
AM=M-1 // 20648
D=M // 20649
@4 // 20650
M=D // 20651

////PopInstruction{address=that 0}
@SP // 20652
AM=M-1 // 20653
D=M // 20654
@THAT // 20655
A=M // 20656
M=D // 20657

////PushInstruction("local 8")
@LCL // 20658
D=M // 20659
@8 // 20660
A=D+A // 20661
D=M // 20662
@SP // 20663
AM=M+1 // 20664
A=A-1 // 20665
M=D // 20666

////PushInstruction("constant 1")
@SP // 20667
AM=M+1 // 20668
A=A-1 // 20669
M=1 // 20670

////ArithmeticInstruction{ADD}
@SP // 20671
AM=M-1 // 20672
D=M // 20673
A=A-1 // 20674
D=D+M // 20675

////PopInstruction{address=local 8}
@LCL // 20676
D=M // 20677
@8 // 20678
A=D+A // 20679
D=A // 20680
@R13 // 20681
M=D // 20682
@SP // 20683
AM=M-1 // 20684
D=M // 20685
@R13 // 20686
A=M // 20687
M=D // 20688

////GotoInstruction{label='WHILE_START_Screen.drawRectangle2}
// goto WHILE_START_Screen.drawRectangle2
@WHILE_START_Screen.drawRectangle2 // 20689
0;JMP // 20690

////LabelInstruction{label='WHILE_END_Screen.drawRectangle2}
// label WHILE_END_Screen.drawRectangle2
(WHILE_END_Screen.drawRectangle2)

////PushInstruction("local 4")
@LCL // 20691
D=M // 20692
@4 // 20693
A=D+A // 20694
D=M // 20695
@SP // 20696
AM=M+1 // 20697
A=A-1 // 20698
M=D // 20699

////PushInstruction("constant 1")
@SP // 20700
AM=M+1 // 20701
A=A-1 // 20702
M=1 // 20703

////ArithmeticInstruction{ADD}
@SP // 20704
AM=M-1 // 20705
D=M // 20706
A=A-1 // 20707
D=D+M // 20708

////CallInstruction{calleeFunction='Math.twoToThe', numArgs=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=6, Screen.setColor=0, Screen.drawPixel=4}, currentFunction='Screen.drawRectangle'}
// call Math.twoToThe
@6 // 20709
D=A // 20710
@14 // 20711
M=D // 20712
@Math.twoToThe // 20713
D=A // 20714
@13 // 20715
M=D // 20716
@Screen.drawRectangle.ret.6 // 20717
D=A // 20718
@CALL // 20719
0;JMP // 20720
(Screen.drawRectangle.ret.6)

////PushInstruction("constant 1")
@SP // 20721
AM=M+1 // 20722
A=A-1 // 20723
M=1 // 20724

////ArithmeticInstruction{SUB}
@SP // 20725
AM=M-1 // 20726
D=M // 20727
A=A-1 // 20728
D=M-D // 20729

////PopInstruction{address=local 6}
@LCL // 20730
D=M // 20731
@6 // 20732
A=D+A // 20733
D=A // 20734
@R13 // 20735
M=D // 20736
@SP // 20737
AM=M-1 // 20738
D=M // 20739
@R13 // 20740
A=M // 20741
M=D // 20742

////PushInstruction("local 5")
@LCL // 20743
D=M // 20744
@5 // 20745
A=D+A // 20746
D=M // 20747
@SP // 20748
AM=M+1 // 20749
A=A-1 // 20750
M=D // 20751

////PushInstruction("local 2")
@LCL // 20752
A=M+1 // 20753
A=A+1 // 20754
D=M // 20755
@SP // 20756
AM=M+1 // 20757
A=A-1 // 20758
M=D // 20759

////ArithmeticInstruction{ADD}
@SP // 20760
AM=M-1 // 20761
D=M // 20762
A=A-1 // 20763
D=D+M // 20764

////PopInstruction{address=local 7}
@LCL // 20765
D=M // 20766
@7 // 20767
A=D+A // 20768
D=A // 20769
@R13 // 20770
M=D // 20771
@SP // 20772
AM=M-1 // 20773
D=M // 20774
@R13 // 20775
A=M // 20776
M=D // 20777

////PushInstruction("static 0")
@Screen.0 // 20778
D=M // 20779
@SP // 20780
AM=M+1 // 20781
A=A-1 // 20782
M=D // 20783

////PushInstruction("constant 0")
@SP // 20784
AM=M+1 // 20785
A=A-1 // 20786
M=0 // 20787

////ArithmeticInstruction{EQ}
@COMPARE_Screen.drawRectangle_eq29 // 20788
D=A // 20789
@13 // 20790
M=D // 20791
@SP // 20792
AM=M-1 // 20793
D=M // 20794
A=A-1 // 20795
D=M-D // 20796
@DO_EQ // 20797
0;JMP // 20798
(COMPARE_Screen.drawRectangle_eq29)

////IfGotoInstruction{label='Screen.drawRectangle.IfElse5}
// if-goto Screen.drawRectangle.IfElse5
@SP // 20799
AM=M-1 // 20800
D=M // 20801
@Screen.drawRectangle.IfElse5 // 20802
D;JNE // 20803

////PushInstruction("constant 16384")
@16384 // 20804
D=A // 20805
@SP // 20806
AM=M+1 // 20807
A=A-1 // 20808
M=D // 20809

////PushInstruction("local 7")
@LCL // 20810
D=M // 20811
@7 // 20812
A=D+A // 20813
D=M // 20814
@SP // 20815
AM=M+1 // 20816
A=A-1 // 20817
M=D // 20818

////ArithmeticInstruction{ADD}
@SP // 20819
AM=M-1 // 20820
D=M // 20821
A=A-1 // 20822
D=D+M // 20823

////PopInstruction{address=pointer 1}
@SP // 20824
AM=M-1 // 20825
D=M // 20826
@4 // 20827
M=D // 20828

////PushInstruction("that 0")
@THAT // 20829
A=M // 20830
D=M // 20831
@SP // 20832
AM=M+1 // 20833
A=A-1 // 20834
M=D // 20835

////PushInstruction("local 6")
@LCL // 20836
D=M // 20837
@6 // 20838
A=D+A // 20839
D=M // 20840
@SP // 20841
AM=M+1 // 20842
A=A-1 // 20843
M=D // 20844

////ArithmeticInstruction{OR}
@SP // 20845
AM=M-1 // 20846
D=M // 20847
A=A-1 // 20848
D=D|M // 20849

////PushInstruction("constant 16384")
@16384 // 20850
D=A // 20851
@SP // 20852
AM=M+1 // 20853
A=A-1 // 20854
M=D // 20855

////PushInstruction("local 7")
@LCL // 20856
D=M // 20857
@7 // 20858
A=D+A // 20859
D=M // 20860
@SP // 20861
AM=M+1 // 20862
A=A-1 // 20863
M=D // 20864

////ArithmeticInstruction{ADD}
@SP // 20865
AM=M-1 // 20866
D=M // 20867
A=A-1 // 20868
D=D+M // 20869

////PopInstruction{address=pointer 1}
@SP // 20870
AM=M-1 // 20871
D=M // 20872
@4 // 20873
M=D // 20874

////PopInstruction{address=that 0}
@SP // 20875
AM=M-1 // 20876
D=M // 20877
@THAT // 20878
A=M // 20879
M=D // 20880

////GotoInstruction{label='Screen.drawRectangle.IfElseEND5}
// goto Screen.drawRectangle.IfElseEND5
@Screen.drawRectangle.IfElseEND5 // 20881
0;JMP // 20882

////LabelInstruction{label='Screen.drawRectangle.IfElse5}
// label Screen.drawRectangle.IfElse5
(Screen.drawRectangle.IfElse5)

////PushInstruction("constant 16384")
@16384 // 20883
D=A // 20884
@SP // 20885
AM=M+1 // 20886
A=A-1 // 20887
M=D // 20888

////PushInstruction("local 7")
@LCL // 20889
D=M // 20890
@7 // 20891
A=D+A // 20892
D=M // 20893
@SP // 20894
AM=M+1 // 20895
A=A-1 // 20896
M=D // 20897

////ArithmeticInstruction{ADD}
@SP // 20898
AM=M-1 // 20899
D=M // 20900
A=A-1 // 20901
D=D+M // 20902

////PopInstruction{address=pointer 1}
@SP // 20903
AM=M-1 // 20904
D=M // 20905
@4 // 20906
M=D // 20907

////PushInstruction("that 0")
@THAT // 20908
A=M // 20909
D=M // 20910
@SP // 20911
AM=M+1 // 20912
A=A-1 // 20913
M=D // 20914

////PushInstruction("local 6")
@LCL // 20915
D=M // 20916
@6 // 20917
A=D+A // 20918
D=M // 20919
@SP // 20920
AM=M+1 // 20921
A=A-1 // 20922
M=D // 20923

////ArithmeticInstruction{NOT}
@SP // 20924
A=M-1 // 20925
M=!M // 20926

////ArithmeticInstruction{AND}
@SP // 20927
AM=M-1 // 20928
D=M // 20929
A=A-1 // 20930
D=D&M // 20931

////PushInstruction("constant 16384")
@16384 // 20932
D=A // 20933
@SP // 20934
AM=M+1 // 20935
A=A-1 // 20936
M=D // 20937

////PushInstruction("local 7")
@LCL // 20938
D=M // 20939
@7 // 20940
A=D+A // 20941
D=M // 20942
@SP // 20943
AM=M+1 // 20944
A=A-1 // 20945
M=D // 20946

////ArithmeticInstruction{ADD}
@SP // 20947
AM=M-1 // 20948
D=M // 20949
A=A-1 // 20950
D=D+M // 20951

////PopInstruction{address=pointer 1}
@SP // 20952
AM=M-1 // 20953
D=M // 20954
@4 // 20955
M=D // 20956

////PopInstruction{address=that 0}
@SP // 20957
AM=M-1 // 20958
D=M // 20959
@THAT // 20960
A=M // 20961
M=D // 20962

////LabelInstruction{label='Screen.drawRectangle.IfElseEND5}
// label Screen.drawRectangle.IfElseEND5
(Screen.drawRectangle.IfElseEND5)

////LabelInstruction{label='Screen.drawRectangle.IfElseEND2}
// label Screen.drawRectangle.IfElseEND2
(Screen.drawRectangle.IfElseEND2)

////PushInstruction("local 0")
@LCL // 20963
A=M // 20964
D=M // 20965
@SP // 20966
AM=M+1 // 20967
A=A-1 // 20968
M=D // 20969

////PushInstruction("constant 1")
@SP // 20970
AM=M+1 // 20971
A=A-1 // 20972
M=1 // 20973

////ArithmeticInstruction{ADD}
@SP // 20974
AM=M-1 // 20975
D=M // 20976
A=A-1 // 20977
D=D+M // 20978

////PopInstruction{address=local 0}
@SP // 20979
AM=M-1 // 20980
D=M // 20981
@LCL // 20982
A=M // 20983
M=D // 20984

////GotoInstruction{label='WHILE_START_Screen.drawRectangle1}
// goto WHILE_START_Screen.drawRectangle1
@WHILE_START_Screen.drawRectangle1 // 20985
0;JMP // 20986

////LabelInstruction{label='WHILE_END_Screen.drawRectangle1}
// label WHILE_END_Screen.drawRectangle1
(WHILE_END_Screen.drawRectangle1)

////PushInstruction("constant 0")
@SP // 20987
AM=M+1 // 20988
A=A-1 // 20989
M=0 // 20990

////ReturnInstruction{}
@RETURN // 20991
0;JMP // 20992

////FunctionInstruction{functionName='Screen.clearScreen', numLocals=1, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.setColor=0, Screen.drawPixel=4}}
// function Screen.clearScreen with 1
(Screen.clearScreen)
@SP // 20993
AM=M+1 // 20994
A=A-1 // 20995
M=0 // 20996

////PushInstruction("constant 0")
@SP // 20997
AM=M+1 // 20998
A=A-1 // 20999
M=0 // 21000

////PopInstruction{address=local 0}
@SP // 21001
AM=M-1 // 21002
D=M // 21003
@LCL // 21004
A=M // 21005
M=D // 21006

////LabelInstruction{label='WHILE_START_Screen.clearScreen1}
// label WHILE_START_Screen.clearScreen1
(WHILE_START_Screen.clearScreen1)

////PushInstruction("local 0")
@LCL // 21007
A=M // 21008
D=M // 21009
@SP // 21010
AM=M+1 // 21011
A=A-1 // 21012
M=D // 21013

////PushInstruction("constant 8192")
@8192 // 21014
D=A // 21015
@SP // 21016
AM=M+1 // 21017
A=A-1 // 21018
M=D // 21019

////ArithmeticInstruction{LT}
@COMPARE_Screen.clearScreen_lt30 // 21020
D=A // 21021
@13 // 21022
M=D // 21023
@SP // 21024
AM=M-1 // 21025
D=M // 21026
A=A-1 // 21027
D=M-D // 21028
@DO_LT // 21029
0;JMP // 21030
(COMPARE_Screen.clearScreen_lt30)

////PushInstruction("constant 0")
@SP // 21031
AM=M+1 // 21032
A=A-1 // 21033
M=0 // 21034

////ArithmeticInstruction{EQ}
@COMPARE_Screen.clearScreen_eq31 // 21035
D=A // 21036
@13 // 21037
M=D // 21038
@SP // 21039
AM=M-1 // 21040
D=M // 21041
A=A-1 // 21042
D=M-D // 21043
@DO_EQ // 21044
0;JMP // 21045
(COMPARE_Screen.clearScreen_eq31)

////IfGotoInstruction{label='WHILE_END_Screen.clearScreen1}
// if-goto WHILE_END_Screen.clearScreen1
@SP // 21046
AM=M-1 // 21047
D=M // 21048
@WHILE_END_Screen.clearScreen1 // 21049
D;JNE // 21050

////PushInstruction("constant 0")
@SP // 21051
AM=M+1 // 21052
A=A-1 // 21053
M=0 // 21054

////PushInstruction("constant 16384")
@16384 // 21055
D=A // 21056
@SP // 21057
AM=M+1 // 21058
A=A-1 // 21059
M=D // 21060

////PushInstruction("local 0")
@LCL // 21061
A=M // 21062
D=M // 21063
@SP // 21064
AM=M+1 // 21065
A=A-1 // 21066
M=D // 21067

////ArithmeticInstruction{ADD}
@SP // 21068
AM=M-1 // 21069
D=M // 21070
A=A-1 // 21071
D=D+M // 21072

////PopInstruction{address=pointer 1}
@SP // 21073
AM=M-1 // 21074
D=M // 21075
@4 // 21076
M=D // 21077

////PopInstruction{address=that 0}
@SP // 21078
AM=M-1 // 21079
D=M // 21080
@THAT // 21081
A=M // 21082
M=D // 21083

////PushInstruction("local 0")
@LCL // 21084
A=M // 21085
D=M // 21086
@SP // 21087
AM=M+1 // 21088
A=A-1 // 21089
M=D // 21090

////PushInstruction("constant 1")
@SP // 21091
AM=M+1 // 21092
A=A-1 // 21093
M=1 // 21094

////ArithmeticInstruction{ADD}
@SP // 21095
AM=M-1 // 21096
D=M // 21097
A=A-1 // 21098
D=D+M // 21099

////PopInstruction{address=local 0}
@SP // 21100
AM=M-1 // 21101
D=M // 21102
@LCL // 21103
A=M // 21104
M=D // 21105

////GotoInstruction{label='WHILE_START_Screen.clearScreen1}
// goto WHILE_START_Screen.clearScreen1
@WHILE_START_Screen.clearScreen1 // 21106
0;JMP // 21107

////LabelInstruction{label='WHILE_END_Screen.clearScreen1}
// label WHILE_END_Screen.clearScreen1
(WHILE_END_Screen.clearScreen1)

////PushInstruction("constant 0")
@SP // 21108
AM=M+1 // 21109
A=A-1 // 21110
M=0 // 21111

////ReturnInstruction{}
@RETURN // 21112
0;JMP // 21113

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={}}
// function String.new with 0
(String.new)

////PushInstruction("constant 3")
@3 // 21114
D=A // 21115
@SP // 21116
AM=M+1 // 21117
A=A-1 // 21118
M=D // 21119

////CallInstruction{calleeFunction='Memory.alloc', numArgs=1, funcMapping={String.new=0}, currentFunction='String.new'}
// call Memory.alloc
@6 // 21120
D=A // 21121
@14 // 21122
M=D // 21123
@Memory.alloc // 21124
D=A // 21125
@13 // 21126
M=D // 21127
@String.new.ret.0 // 21128
D=A // 21129
@CALL // 21130
0;JMP // 21131
(String.new.ret.0)

////PopInstruction{address=pointer 0}
@SP // 21132
AM=M-1 // 21133
D=M // 21134
@3 // 21135
M=D // 21136

////PushInstruction("argument 0")
@ARG // 21137
A=M // 21138
D=M // 21139
@SP // 21140
AM=M+1 // 21141
A=A-1 // 21142
M=D // 21143

////PushInstruction("constant 0")
@SP // 21144
AM=M+1 // 21145
A=A-1 // 21146
M=0 // 21147

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq0 // 21148
D=A // 21149
@13 // 21150
M=D // 21151
@SP // 21152
AM=M-1 // 21153
D=M // 21154
A=A-1 // 21155
D=M-D // 21156
@DO_EQ // 21157
0;JMP // 21158
(COMPARE_String.new_eq0)

////PushInstruction("constant 0")
@SP // 21159
AM=M+1 // 21160
A=A-1 // 21161
M=0 // 21162

////ArithmeticInstruction{EQ}
@COMPARE_String.new_eq1 // 21163
D=A // 21164
@13 // 21165
M=D // 21166
@SP // 21167
AM=M-1 // 21168
D=M // 21169
A=A-1 // 21170
D=M-D // 21171
@DO_EQ // 21172
0;JMP // 21173
(COMPARE_String.new_eq1)

////IfGotoInstruction{label='String.new.IfElse1}
// if-goto String.new.IfElse1
@SP // 21174
AM=M-1 // 21175
D=M // 21176
@String.new.IfElse1 // 21177
D;JNE // 21178

////PushInstruction("constant 0")
@SP // 21179
AM=M+1 // 21180
A=A-1 // 21181
M=0 // 21182

////PopInstruction{address=this 0}
@SP // 21183
AM=M-1 // 21184
D=M // 21185
@THIS // 21186
A=M // 21187
M=D // 21188

////GotoInstruction{label='String.new.IfElseEND1}
// goto String.new.IfElseEND1
@String.new.IfElseEND1 // 21189
0;JMP // 21190

////LabelInstruction{label='String.new.IfElse1}
// label String.new.IfElse1
(String.new.IfElse1)

////PushInstruction("argument 0")
@ARG // 21191
A=M // 21192
D=M // 21193
@SP // 21194
AM=M+1 // 21195
A=A-1 // 21196
M=D // 21197

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.new=1}, currentFunction='String.new'}
// call Array.new
@6 // 21198
D=A // 21199
@14 // 21200
M=D // 21201
@Array.new // 21202
D=A // 21203
@13 // 21204
M=D // 21205
@String.new.ret.1 // 21206
D=A // 21207
@CALL // 21208
0;JMP // 21209
(String.new.ret.1)

////PopInstruction{address=this 0}
@SP // 21210
AM=M-1 // 21211
D=M // 21212
@THIS // 21213
A=M // 21214
M=D // 21215

////LabelInstruction{label='String.new.IfElseEND1}
// label String.new.IfElseEND1
(String.new.IfElseEND1)

////PushInstruction("argument 0")
@ARG // 21216
A=M // 21217
D=M // 21218
@SP // 21219
AM=M+1 // 21220
A=A-1 // 21221
M=D // 21222

////PopInstruction{address=this 2}
@SP // 21223
AM=M-1 // 21224
D=M // 21225
@THIS // 21226
A=M+1 // 21227
A=A+1 // 21228
M=D // 21229

////PushInstruction("constant 0")
@SP // 21230
AM=M+1 // 21231
A=A-1 // 21232
M=0 // 21233

////PopInstruction{address=this 1}
@SP // 21234
AM=M-1 // 21235
D=M // 21236
@THIS // 21237
A=M+1 // 21238
M=D // 21239

////PushInstruction("pointer 0")
@3 // 21240
D=M // 21241
@SP // 21242
AM=M+1 // 21243
A=A-1 // 21244
M=D // 21245

////ReturnInstruction{}
@RETURN // 21246
0;JMP // 21247

////FunctionInstruction{functionName='String.dispose', numLocals=0, funcMapping={String.new=2}}
// function String.dispose with 0
(String.dispose)

////PushInstruction("argument 0")
@ARG // 21248
A=M // 21249
D=M // 21250
@SP // 21251
AM=M+1 // 21252
A=A-1 // 21253
M=D // 21254

////PopInstruction{address=pointer 0}
@SP // 21255
AM=M-1 // 21256
D=M // 21257
@3 // 21258
M=D // 21259

////PushInstruction("this 0")
@THIS // 21260
A=M // 21261
D=M // 21262
@SP // 21263
AM=M+1 // 21264
A=A-1 // 21265
M=D // 21266

////PushInstruction("constant 0")
@SP // 21267
AM=M+1 // 21268
A=A-1 // 21269
M=0 // 21270

////ArithmeticInstruction{EQ}
@COMPARE_String.dispose_eq2 // 21271
D=A // 21272
@13 // 21273
M=D // 21274
@SP // 21275
AM=M-1 // 21276
D=M // 21277
A=A-1 // 21278
D=M-D // 21279
@DO_EQ // 21280
0;JMP // 21281
(COMPARE_String.dispose_eq2)

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
@COMPARE_String.dispose_eq3 // 21289
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
(COMPARE_String.dispose_eq3)

////IfGotoInstruction{label='String.dispose.IfElse1}
// if-goto String.dispose.IfElse1
@SP // 21300
AM=M-1 // 21301
D=M // 21302
@String.dispose.IfElse1 // 21303
D;JNE // 21304

////PushInstruction("this 0")
@THIS // 21305
A=M // 21306
D=M // 21307
@SP // 21308
AM=M+1 // 21309
A=A-1 // 21310
M=D // 21311

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=0, String.new=2}, currentFunction='String.dispose'}
// call Array.dispose
@6 // 21312
D=A // 21313
@14 // 21314
M=D // 21315
@Array.dispose // 21316
D=A // 21317
@13 // 21318
M=D // 21319
@String.dispose.ret.0 // 21320
D=A // 21321
@CALL // 21322
0;JMP // 21323
(String.dispose.ret.0)

////PopInstruction{address=temp 0}
@SP // 21324
AM=M-1 // 21325
D=M // 21326
@5 // 21327
M=D // 21328

////GotoInstruction{label='String.dispose.IfElseEND1}
// goto String.dispose.IfElseEND1
@String.dispose.IfElseEND1 // 21329
0;JMP // 21330

////LabelInstruction{label='String.dispose.IfElse1}
// label String.dispose.IfElse1
(String.dispose.IfElse1)

////LabelInstruction{label='String.dispose.IfElseEND1}
// label String.dispose.IfElseEND1
(String.dispose.IfElseEND1)

////PushInstruction("constant 0")
@SP // 21331
AM=M+1 // 21332
A=A-1 // 21333
M=0 // 21334

////ReturnInstruction{}
@RETURN // 21335
0;JMP // 21336

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.new=2}}
// function String.length with 0
(String.length)

////PushInstruction("argument 0")
@ARG // 21337
A=M // 21338
D=M // 21339
@SP // 21340
AM=M+1 // 21341
A=A-1 // 21342
M=D // 21343

////PopInstruction{address=pointer 0}
@SP // 21344
AM=M-1 // 21345
D=M // 21346
@3 // 21347
M=D // 21348

////PushInstruction("this 1")
@THIS // 21349
A=M+1 // 21350
D=M // 21351
@SP // 21352
AM=M+1 // 21353
A=A-1 // 21354
M=D // 21355

////ReturnInstruction{}
@RETURN // 21356
0;JMP // 21357

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushInstruction("argument 0")
@ARG // 21358
A=M // 21359
D=M // 21360
@SP // 21361
AM=M+1 // 21362
A=A-1 // 21363
M=D // 21364

////PopInstruction{address=pointer 0}
@SP // 21365
AM=M-1 // 21366
D=M // 21367
@3 // 21368
M=D // 21369

////PushInstruction("this 0")
@THIS // 21370
A=M // 21371
D=M // 21372
@SP // 21373
AM=M+1 // 21374
A=A-1 // 21375
M=D // 21376

////PushInstruction("argument 1")
@ARG // 21377
A=M+1 // 21378
D=M // 21379
@SP // 21380
AM=M+1 // 21381
A=A-1 // 21382
M=D // 21383

////ArithmeticInstruction{ADD}
@SP // 21384
AM=M-1 // 21385
D=M // 21386
A=A-1 // 21387
D=D+M // 21388

////PopInstruction{address=pointer 1}
@SP // 21389
AM=M-1 // 21390
D=M // 21391
@4 // 21392
M=D // 21393

////PushInstruction("that 0")
@THAT // 21394
A=M // 21395
D=M // 21396
@SP // 21397
AM=M+1 // 21398
A=A-1 // 21399
M=D // 21400

////ReturnInstruction{}
@RETURN // 21401
0;JMP // 21402

////FunctionInstruction{functionName='String.setCharAt', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.length=0, String.new=2}}
// function String.setCharAt with 0
(String.setCharAt)

////PushInstruction("argument 0")
@ARG // 21403
A=M // 21404
D=M // 21405
@SP // 21406
AM=M+1 // 21407
A=A-1 // 21408
M=D // 21409

////PopInstruction{address=pointer 0}
@SP // 21410
AM=M-1 // 21411
D=M // 21412
@3 // 21413
M=D // 21414

////PushInstruction("argument 2")
@ARG // 21415
A=M+1 // 21416
A=A+1 // 21417
D=M // 21418
@SP // 21419
AM=M+1 // 21420
A=A-1 // 21421
M=D // 21422

////PushInstruction("this 0")
@THIS // 21423
A=M // 21424
D=M // 21425
@SP // 21426
AM=M+1 // 21427
A=A-1 // 21428
M=D // 21429

////PushInstruction("argument 1")
@ARG // 21430
A=M+1 // 21431
D=M // 21432
@SP // 21433
AM=M+1 // 21434
A=A-1 // 21435
M=D // 21436

////ArithmeticInstruction{ADD}
@SP // 21437
AM=M-1 // 21438
D=M // 21439
A=A-1 // 21440
D=D+M // 21441

////PopInstruction{address=pointer 1}
@SP // 21442
AM=M-1 // 21443
D=M // 21444
@4 // 21445
M=D // 21446

////PopInstruction{address=that 0}
@SP // 21447
AM=M-1 // 21448
D=M // 21449
@THAT // 21450
A=M // 21451
M=D // 21452

////PushInstruction("constant 0")
@SP // 21453
AM=M+1 // 21454
A=A-1 // 21455
M=0 // 21456

////ReturnInstruction{}
@RETURN // 21457
0;JMP // 21458

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1, String.charAt=0, String.setCharAt=0, String.length=0, String.new=2}}
// function String.appendChar with 1
(String.appendChar)
@SP // 21459
AM=M+1 // 21460
A=A-1 // 21461
M=0 // 21462

////PushInstruction("argument 0")
@ARG // 21463
A=M // 21464
D=M // 21465
@SP // 21466
AM=M+1 // 21467
A=A-1 // 21468
M=D // 21469

////PopInstruction{address=pointer 0}
@SP // 21470
AM=M-1 // 21471
D=M // 21472
@3 // 21473
M=D // 21474

////PushInstruction("this 1")
@THIS // 21475
A=M+1 // 21476
D=M // 21477
@SP // 21478
AM=M+1 // 21479
A=A-1 // 21480
M=D // 21481

////PushInstruction("this 2")
@THIS // 21482
A=M+1 // 21483
A=A+1 // 21484
D=M // 21485
@SP // 21486
AM=M+1 // 21487
A=A-1 // 21488
M=D // 21489

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq4 // 21490
D=A // 21491
@13 // 21492
M=D // 21493
@SP // 21494
AM=M-1 // 21495
D=M // 21496
A=A-1 // 21497
D=M-D // 21498
@DO_EQ // 21499
0;JMP // 21500
(COMPARE_String.appendChar_eq4)

////PushInstruction("constant 0")
@SP // 21501
AM=M+1 // 21502
A=A-1 // 21503
M=0 // 21504

////ArithmeticInstruction{EQ}
@COMPARE_String.appendChar_eq5 // 21505
D=A // 21506
@13 // 21507
M=D // 21508
@SP // 21509
AM=M-1 // 21510
D=M // 21511
A=A-1 // 21512
D=M-D // 21513
@DO_EQ // 21514
0;JMP // 21515
(COMPARE_String.appendChar_eq5)

////IfGotoInstruction{label='String.appendChar.IfElse1}
// if-goto String.appendChar.IfElse1
@SP // 21516
AM=M-1 // 21517
D=M // 21518
@String.appendChar.IfElse1 // 21519
D;JNE // 21520

////PushInstruction("this 2")
@THIS // 21521
A=M+1 // 21522
A=A+1 // 21523
D=M // 21524
@SP // 21525
AM=M+1 // 21526
A=A-1 // 21527
M=D // 21528

////PushInstruction("this 2")
@THIS // 21529
A=M+1 // 21530
A=A+1 // 21531
D=M // 21532
@SP // 21533
AM=M+1 // 21534
A=A-1 // 21535
M=D // 21536

////ArithmeticInstruction{ADD}
@SP // 21537
AM=M-1 // 21538
D=M // 21539
A=A-1 // 21540
D=D+M // 21541

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.new
@6 // 21542
D=A // 21543
@14 // 21544
M=D // 21545
@Array.new // 21546
D=A // 21547
@13 // 21548
M=D // 21549
@String.appendChar.ret.0 // 21550
D=A // 21551
@CALL // 21552
0;JMP // 21553
(String.appendChar.ret.0)

////PopInstruction{address=local 0}
@SP // 21554
AM=M-1 // 21555
D=M // 21556
@LCL // 21557
A=M // 21558
M=D // 21559

////PushInstruction("this 0")
@THIS // 21560
A=M // 21561
D=M // 21562
@SP // 21563
AM=M+1 // 21564
A=A-1 // 21565
M=D // 21566

////PushInstruction("local 0")
@LCL // 21567
A=M // 21568
D=M // 21569
@SP // 21570
AM=M+1 // 21571
A=A-1 // 21572
M=D // 21573

////PushInstruction("this 1")
@THIS // 21574
A=M+1 // 21575
D=M // 21576
@SP // 21577
AM=M+1 // 21578
A=A-1 // 21579
M=D // 21580

////CallInstruction{calleeFunction='Memory.copy', numArgs=3, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Memory.copy
@8 // 21581
D=A // 21582
@14 // 21583
M=D // 21584
@Memory.copy // 21585
D=A // 21586
@13 // 21587
M=D // 21588
@String.appendChar.ret.1 // 21589
D=A // 21590
@CALL // 21591
0;JMP // 21592
(String.appendChar.ret.1)

////PopInstruction{address=temp 0}
@SP // 21593
AM=M-1 // 21594
D=M // 21595
@5 // 21596
M=D // 21597

////PushInstruction("this 0")
@THIS // 21598
A=M // 21599
D=M // 21600
@SP // 21601
AM=M+1 // 21602
A=A-1 // 21603
M=D // 21604

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.appendChar'}
// call Array.dispose
@6 // 21605
D=A // 21606
@14 // 21607
M=D // 21608
@Array.dispose // 21609
D=A // 21610
@13 // 21611
M=D // 21612
@String.appendChar.ret.2 // 21613
D=A // 21614
@CALL // 21615
0;JMP // 21616
(String.appendChar.ret.2)

////PopInstruction{address=temp 0}
@SP // 21617
AM=M-1 // 21618
D=M // 21619
@5 // 21620
M=D // 21621

////PushInstruction("this 2")
@THIS // 21622
A=M+1 // 21623
A=A+1 // 21624
D=M // 21625
@SP // 21626
AM=M+1 // 21627
A=A-1 // 21628
M=D // 21629

////PushInstruction("this 2")
@THIS // 21630
A=M+1 // 21631
A=A+1 // 21632
D=M // 21633
@SP // 21634
AM=M+1 // 21635
A=A-1 // 21636
M=D // 21637

////ArithmeticInstruction{ADD}
@SP // 21638
AM=M-1 // 21639
D=M // 21640
A=A-1 // 21641
D=D+M // 21642

////PopInstruction{address=this 2}
@SP // 21643
AM=M-1 // 21644
D=M // 21645
@THIS // 21646
A=M+1 // 21647
A=A+1 // 21648
M=D // 21649

////PushInstruction("local 0")
@LCL // 21650
A=M // 21651
D=M // 21652
@SP // 21653
AM=M+1 // 21654
A=A-1 // 21655
M=D // 21656

////PopInstruction{address=this 0}
@SP // 21657
AM=M-1 // 21658
D=M // 21659
@THIS // 21660
A=M // 21661
M=D // 21662

////GotoInstruction{label='String.appendChar.IfElseEND1}
// goto String.appendChar.IfElseEND1
@String.appendChar.IfElseEND1 // 21663
0;JMP // 21664

////LabelInstruction{label='String.appendChar.IfElse1}
// label String.appendChar.IfElse1
(String.appendChar.IfElse1)

////LabelInstruction{label='String.appendChar.IfElseEND1}
// label String.appendChar.IfElseEND1
(String.appendChar.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 21665
A=M+1 // 21666
D=M // 21667
@SP // 21668
AM=M+1 // 21669
A=A-1 // 21670
M=D // 21671

////PushInstruction("this 0")
@THIS // 21672
A=M // 21673
D=M // 21674
@SP // 21675
AM=M+1 // 21676
A=A-1 // 21677
M=D // 21678

////PushInstruction("this 1")
@THIS // 21679
A=M+1 // 21680
D=M // 21681
@SP // 21682
AM=M+1 // 21683
A=A-1 // 21684
M=D // 21685

////ArithmeticInstruction{ADD}
@SP // 21686
AM=M-1 // 21687
D=M // 21688
A=A-1 // 21689
D=D+M // 21690

////PopInstruction{address=pointer 1}
@SP // 21691
AM=M-1 // 21692
D=M // 21693
@4 // 21694
M=D // 21695

////PopInstruction{address=that 0}
@SP // 21696
AM=M-1 // 21697
D=M // 21698
@THAT // 21699
A=M // 21700
M=D // 21701

////PushInstruction("this 1")
@THIS // 21702
A=M+1 // 21703
D=M // 21704
@SP // 21705
AM=M+1 // 21706
A=A-1 // 21707
M=D // 21708

////PushInstruction("constant 1")
@SP // 21709
AM=M+1 // 21710
A=A-1 // 21711
M=1 // 21712

////ArithmeticInstruction{ADD}
@SP // 21713
AM=M-1 // 21714
D=M // 21715
A=A-1 // 21716
D=D+M // 21717

////PopInstruction{address=this 1}
@SP // 21718
AM=M-1 // 21719
D=M // 21720
@THIS // 21721
A=M+1 // 21722
M=D // 21723

////PushInstruction("pointer 0")
@3 // 21724
D=M // 21725
@SP // 21726
AM=M+1 // 21727
A=A-1 // 21728
M=D // 21729

////ReturnInstruction{}
@RETURN // 21730
0;JMP // 21731

////FunctionInstruction{functionName='String.eraseLastChar', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.eraseLastChar with 0
(String.eraseLastChar)

////PushInstruction("argument 0")
@ARG // 21732
A=M // 21733
D=M // 21734
@SP // 21735
AM=M+1 // 21736
A=A-1 // 21737
M=D // 21738

////PopInstruction{address=pointer 0}
@SP // 21739
AM=M-1 // 21740
D=M // 21741
@3 // 21742
M=D // 21743

////PushInstruction("this 1")
@THIS // 21744
A=M+1 // 21745
D=M // 21746
@SP // 21747
AM=M+1 // 21748
A=A-1 // 21749
M=D // 21750

////PushInstruction("constant 1")
@SP // 21751
AM=M+1 // 21752
A=A-1 // 21753
M=1 // 21754

////ArithmeticInstruction{SUB}
@SP // 21755
AM=M-1 // 21756
D=M // 21757
A=A-1 // 21758
D=M-D // 21759

////PopInstruction{address=this 1}
@SP // 21760
AM=M-1 // 21761
D=M // 21762
@THIS // 21763
A=M+1 // 21764
M=D // 21765

////PushInstruction("constant 0")
@SP // 21766
AM=M+1 // 21767
A=A-1 // 21768
M=0 // 21769

////ReturnInstruction{}
@RETURN // 21770
0;JMP // 21771

////FunctionInstruction{functionName='String.intValue', numLocals=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.intValue with 2
(String.intValue)
@SP // 21772
AM=M+1 // 21773
A=A-1 // 21774
M=0 // 21775
@SP // 21776
AM=M+1 // 21777
A=A-1 // 21778
M=0 // 21779

////PushInstruction("argument 0")
@ARG // 21780
A=M // 21781
D=M // 21782
@SP // 21783
AM=M+1 // 21784
A=A-1 // 21785
M=D // 21786

////PopInstruction{address=pointer 0}
@SP // 21787
AM=M-1 // 21788
D=M // 21789
@3 // 21790
M=D // 21791

////PushInstruction("constant 1")
@SP // 21792
AM=M+1 // 21793
A=A-1 // 21794
M=1 // 21795

////PopInstruction{address=local 1}
@SP // 21796
AM=M-1 // 21797
D=M // 21798
@LCL // 21799
A=M+1 // 21800
M=D // 21801

////PushInstruction("constant 0")
@SP // 21802
AM=M+1 // 21803
A=A-1 // 21804
M=0 // 21805

////PopInstruction{address=local 0}
@SP // 21806
AM=M-1 // 21807
D=M // 21808
@LCL // 21809
A=M // 21810
M=D // 21811

////LabelInstruction{label='WHILE_START_String.intValue1}
// label WHILE_START_String.intValue1
(WHILE_START_String.intValue1)

////PushInstruction("local 1")
@LCL // 21812
A=M+1 // 21813
D=M // 21814
@SP // 21815
AM=M+1 // 21816
A=A-1 // 21817
M=D // 21818

////PushInstruction("this 1")
@THIS // 21819
A=M+1 // 21820
D=M // 21821
@SP // 21822
AM=M+1 // 21823
A=A-1 // 21824
M=D // 21825

////ArithmeticInstruction{LT}
@COMPARE_String.intValue_lt6 // 21826
D=A // 21827
@13 // 21828
M=D // 21829
@SP // 21830
AM=M-1 // 21831
D=M // 21832
A=A-1 // 21833
D=M-D // 21834
@DO_LT // 21835
0;JMP // 21836
(COMPARE_String.intValue_lt6)

////PushInstruction("constant 0")
@SP // 21837
AM=M+1 // 21838
A=A-1 // 21839
M=0 // 21840

////ArithmeticInstruction{EQ}
@COMPARE_String.intValue_eq7 // 21841
D=A // 21842
@13 // 21843
M=D // 21844
@SP // 21845
AM=M-1 // 21846
D=M // 21847
A=A-1 // 21848
D=M-D // 21849
@DO_EQ // 21850
0;JMP // 21851
(COMPARE_String.intValue_eq7)

////IfGotoInstruction{label='WHILE_END_String.intValue1}
// if-goto WHILE_END_String.intValue1
@SP // 21852
AM=M-1 // 21853
D=M // 21854
@WHILE_END_String.intValue1 // 21855
D;JNE // 21856

////PushInstruction("local 0")
@LCL // 21857
A=M // 21858
D=M // 21859
@SP // 21860
AM=M+1 // 21861
A=A-1 // 21862
M=D // 21863

////PushInstruction("constant 10")
@10 // 21864
D=A // 21865
@SP // 21866
AM=M+1 // 21867
A=A-1 // 21868
M=D // 21869

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=0, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.intValue'}
// call Math.multiply
@7 // 21870
D=A // 21871
@14 // 21872
M=D // 21873
@Math.multiply // 21874
D=A // 21875
@13 // 21876
M=D // 21877
@String.intValue.ret.0 // 21878
D=A // 21879
@CALL // 21880
0;JMP // 21881
(String.intValue.ret.0)

////PushInstruction("this 0")
@THIS // 21882
A=M // 21883
D=M // 21884
@SP // 21885
AM=M+1 // 21886
A=A-1 // 21887
M=D // 21888

////PushInstruction("local 1")
@LCL // 21889
A=M+1 // 21890
D=M // 21891
@SP // 21892
AM=M+1 // 21893
A=A-1 // 21894
M=D // 21895

////ArithmeticInstruction{ADD}
@SP // 21896
AM=M-1 // 21897
D=M // 21898
A=A-1 // 21899
D=D+M // 21900

////PopInstruction{address=pointer 1}
@SP // 21901
AM=M-1 // 21902
D=M // 21903
@4 // 21904
M=D // 21905

////PushInstruction("that 0")
@THAT // 21906
A=M // 21907
D=M // 21908
@SP // 21909
AM=M+1 // 21910
A=A-1 // 21911
M=D // 21912

////PushInstruction("constant 48")
@48 // 21913
D=A // 21914
@SP // 21915
AM=M+1 // 21916
A=A-1 // 21917
M=D // 21918

////ArithmeticInstruction{SUB}
@SP // 21919
AM=M-1 // 21920
D=M // 21921
A=A-1 // 21922
D=M-D // 21923

////ArithmeticInstruction{ADD}
@SP // 21924
AM=M-1 // 21925
D=M // 21926
A=A-1 // 21927
D=D+M // 21928

////PopInstruction{address=local 0}
@SP // 21929
AM=M-1 // 21930
D=M // 21931
@LCL // 21932
A=M // 21933
M=D // 21934

////PushInstruction("local 1")
@LCL // 21935
A=M+1 // 21936
D=M // 21937
@SP // 21938
AM=M+1 // 21939
A=A-1 // 21940
M=D // 21941

////PushInstruction("constant 1")
@SP // 21942
AM=M+1 // 21943
A=A-1 // 21944
M=1 // 21945

////ArithmeticInstruction{ADD}
@SP // 21946
AM=M-1 // 21947
D=M // 21948
A=A-1 // 21949
D=D+M // 21950

////PopInstruction{address=local 1}
@SP // 21951
AM=M-1 // 21952
D=M // 21953
@LCL // 21954
A=M+1 // 21955
M=D // 21956

////GotoInstruction{label='WHILE_START_String.intValue1}
// goto WHILE_START_String.intValue1
@WHILE_START_String.intValue1 // 21957
0;JMP // 21958

////LabelInstruction{label='WHILE_END_String.intValue1}
// label WHILE_END_String.intValue1
(WHILE_END_String.intValue1)

////PushInstruction("local 0")
@LCL // 21959
A=M // 21960
D=M // 21961
@SP // 21962
AM=M+1 // 21963
A=A-1 // 21964
M=D // 21965

////ReturnInstruction{}
@RETURN // 21966
0;JMP // 21967

////FunctionInstruction{functionName='String.setInt', numLocals=6, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setCharAt=0, String.length=0, String.new=2}}
// function String.setInt with 6
(String.setInt)
@SP // 21968
AM=M+1 // 21969
A=A-1 // 21970
M=0 // 21971
@SP // 21972
AM=M+1 // 21973
A=A-1 // 21974
M=0 // 21975
@SP // 21976
AM=M+1 // 21977
A=A-1 // 21978
M=0 // 21979
@SP // 21980
AM=M+1 // 21981
A=A-1 // 21982
M=0 // 21983
@SP // 21984
AM=M+1 // 21985
A=A-1 // 21986
M=0 // 21987
@SP // 21988
AM=M+1 // 21989
A=A-1 // 21990
M=0 // 21991

////PushInstruction("argument 0")
@ARG // 21992
A=M // 21993
D=M // 21994
@SP // 21995
AM=M+1 // 21996
A=A-1 // 21997
M=D // 21998

////PopInstruction{address=pointer 0}
@SP // 21999
AM=M-1 // 22000
D=M // 22001
@3 // 22002
M=D // 22003

////PushInstruction("constant 0")
@SP // 22004
AM=M+1 // 22005
A=A-1 // 22006
M=0 // 22007

////PopInstruction{address=this 1}
@SP // 22008
AM=M-1 // 22009
D=M // 22010
@THIS // 22011
A=M+1 // 22012
M=D // 22013

////PushInstruction("constant 0")
@SP // 22014
AM=M+1 // 22015
A=A-1 // 22016
M=0 // 22017

////PopInstruction{address=local 4}
@LCL // 22018
D=M // 22019
@4 // 22020
A=D+A // 22021
D=A // 22022
@R13 // 22023
M=D // 22024
@SP // 22025
AM=M-1 // 22026
D=M // 22027
@R13 // 22028
A=M // 22029
M=D // 22030

////PushInstruction("argument 1")
@ARG // 22031
A=M+1 // 22032
D=M // 22033
@SP // 22034
AM=M+1 // 22035
A=A-1 // 22036
M=D // 22037

////PushInstruction("constant 0")
@SP // 22038
AM=M+1 // 22039
A=A-1 // 22040
M=0 // 22041

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq8 // 22042
D=A // 22043
@13 // 22044
M=D // 22045
@SP // 22046
AM=M-1 // 22047
D=M // 22048
A=A-1 // 22049
D=M-D // 22050
@DO_EQ // 22051
0;JMP // 22052
(COMPARE_String.setInt_eq8)

////PushInstruction("constant 0")
@SP // 22053
AM=M+1 // 22054
A=A-1 // 22055
M=0 // 22056

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq9 // 22057
D=A // 22058
@13 // 22059
M=D // 22060
@SP // 22061
AM=M-1 // 22062
D=M // 22063
A=A-1 // 22064
D=M-D // 22065
@DO_EQ // 22066
0;JMP // 22067
(COMPARE_String.setInt_eq9)

////IfGotoInstruction{label='String.setInt.IfElse1}
// if-goto String.setInt.IfElse1
@SP // 22068
AM=M-1 // 22069
D=M // 22070
@String.setInt.IfElse1 // 22071
D;JNE // 22072

////PushInstruction("pointer 0")
@3 // 22073
D=M // 22074
@SP // 22075
AM=M+1 // 22076
A=A-1 // 22077
M=D // 22078

////PushInstruction("constant 48")
@48 // 22079
D=A // 22080
@SP // 22081
AM=M+1 // 22082
A=A-1 // 22083
M=D // 22084

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=0, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22085
D=A // 22086
@14 // 22087
M=D // 22088
@String.appendChar // 22089
D=A // 22090
@13 // 22091
M=D // 22092
@String.setInt.ret.0 // 22093
D=A // 22094
@CALL // 22095
0;JMP // 22096
(String.setInt.ret.0)

////PopInstruction{address=temp 0}
@SP // 22097
AM=M-1 // 22098
D=M // 22099
@5 // 22100
M=D // 22101

////PushInstruction("constant 0")
@SP // 22102
AM=M+1 // 22103
A=A-1 // 22104
M=0 // 22105

////ReturnInstruction{}
@RETURN // 22106
0;JMP // 22107

////GotoInstruction{label='String.setInt.IfElseEND1}
// goto String.setInt.IfElseEND1
@String.setInt.IfElseEND1 // 22108
0;JMP // 22109

////LabelInstruction{label='String.setInt.IfElse1}
// label String.setInt.IfElse1
(String.setInt.IfElse1)

////LabelInstruction{label='String.setInt.IfElseEND1}
// label String.setInt.IfElseEND1
(String.setInt.IfElseEND1)

////PushInstruction("argument 1")
@ARG // 22110
A=M+1 // 22111
D=M // 22112
@SP // 22113
AM=M+1 // 22114
A=A-1 // 22115
M=D // 22116

////PushInstruction("constant 0")
@SP // 22117
AM=M+1 // 22118
A=A-1 // 22119
M=0 // 22120

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt10 // 22121
D=A // 22122
@13 // 22123
M=D // 22124
@SP // 22125
AM=M-1 // 22126
D=M // 22127
A=A-1 // 22128
D=M-D // 22129
@DO_LT // 22130
0;JMP // 22131
(COMPARE_String.setInt_lt10)

////PushInstruction("constant 0")
@SP // 22132
AM=M+1 // 22133
A=A-1 // 22134
M=0 // 22135

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq11 // 22136
D=A // 22137
@13 // 22138
M=D // 22139
@SP // 22140
AM=M-1 // 22141
D=M // 22142
A=A-1 // 22143
D=M-D // 22144
@DO_EQ // 22145
0;JMP // 22146
(COMPARE_String.setInt_eq11)

////IfGotoInstruction{label='String.setInt.IfElse2}
// if-goto String.setInt.IfElse2
@SP // 22147
AM=M-1 // 22148
D=M // 22149
@String.setInt.IfElse2 // 22150
D;JNE // 22151

////PushInstruction("constant 1")
@SP // 22152
AM=M+1 // 22153
A=A-1 // 22154
M=1 // 22155

////PopInstruction{address=local 4}
@LCL // 22156
D=M // 22157
@4 // 22158
A=D+A // 22159
D=A // 22160
@R13 // 22161
M=D // 22162
@SP // 22163
AM=M-1 // 22164
D=M // 22165
@R13 // 22166
A=M // 22167
M=D // 22168

////PushInstruction("argument 1")
@ARG // 22169
A=M+1 // 22170
D=M // 22171
@SP // 22172
AM=M+1 // 22173
A=A-1 // 22174
M=D // 22175

////PushInstruction("constant 0")
@SP // 22176
AM=M+1 // 22177
A=A-1 // 22178
M=0 // 22179

////ArithmeticInstruction{LT}
@COMPARE_String.setInt_lt12 // 22180
D=A // 22181
@13 // 22182
M=D // 22183
@SP // 22184
AM=M-1 // 22185
D=M // 22186
A=A-1 // 22187
D=M-D // 22188
@DO_LT // 22189
0;JMP // 22190
(COMPARE_String.setInt_lt12)

////PushInstruction("argument 1")
@ARG // 22191
A=M+1 // 22192
D=M // 22193
@SP // 22194
AM=M+1 // 22195
A=A-1 // 22196
M=D // 22197

////PushInstruction("constant 32767")
@32767 // 22198
D=A // 22199
@SP // 22200
AM=M+1 // 22201
A=A-1 // 22202
M=D // 22203

////ArithmeticInstruction{AND}
@SP // 22204
AM=M-1 // 22205
D=M // 22206
A=A-1 // 22207
D=D&M // 22208

////PushInstruction("constant 32767")
@32767 // 22209
D=A // 22210
@SP // 22211
AM=M+1 // 22212
A=A-1 // 22213
M=D // 22214

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq13 // 22215
D=A // 22216
@13 // 22217
M=D // 22218
@SP // 22219
AM=M-1 // 22220
D=M // 22221
A=A-1 // 22222
D=M-D // 22223
@DO_EQ // 22224
0;JMP // 22225
(COMPARE_String.setInt_eq13)

////ArithmeticInstruction{AND}
@SP // 22226
AM=M-1 // 22227
D=M // 22228
A=A-1 // 22229
D=D&M // 22230

////PushInstruction("constant 0")
@SP // 22231
AM=M+1 // 22232
A=A-1 // 22233
M=0 // 22234

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq14 // 22235
D=A // 22236
@13 // 22237
M=D // 22238
@SP // 22239
AM=M-1 // 22240
D=M // 22241
A=A-1 // 22242
D=M-D // 22243
@DO_EQ // 22244
0;JMP // 22245
(COMPARE_String.setInt_eq14)

////IfGotoInstruction{label='String.setInt.IfElse3}
// if-goto String.setInt.IfElse3
@SP // 22246
AM=M-1 // 22247
D=M // 22248
@String.setInt.IfElse3 // 22249
D;JNE // 22250

////PushInstruction("pointer 0")
@3 // 22251
D=M // 22252
@SP // 22253
AM=M+1 // 22254
A=A-1 // 22255
M=D // 22256

////PushInstruction("constant 45")
@45 // 22257
D=A // 22258
@SP // 22259
AM=M+1 // 22260
A=A-1 // 22261
M=D // 22262

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=1, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22263
D=A // 22264
@14 // 22265
M=D // 22266
@String.appendChar // 22267
D=A // 22268
@13 // 22269
M=D // 22270
@String.setInt.ret.1 // 22271
D=A // 22272
@CALL // 22273
0;JMP // 22274
(String.setInt.ret.1)

////PopInstruction{address=temp 0}
@SP // 22275
AM=M-1 // 22276
D=M // 22277
@5 // 22278
M=D // 22279

////PushInstruction("pointer 0")
@3 // 22280
D=M // 22281
@SP // 22282
AM=M+1 // 22283
A=A-1 // 22284
M=D // 22285

////PushInstruction("constant 51")
@51 // 22286
D=A // 22287
@SP // 22288
AM=M+1 // 22289
A=A-1 // 22290
M=D // 22291

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=2, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22292
D=A // 22293
@14 // 22294
M=D // 22295
@String.appendChar // 22296
D=A // 22297
@13 // 22298
M=D // 22299
@String.setInt.ret.2 // 22300
D=A // 22301
@CALL // 22302
0;JMP // 22303
(String.setInt.ret.2)

////PopInstruction{address=temp 0}
@SP // 22304
AM=M-1 // 22305
D=M // 22306
@5 // 22307
M=D // 22308

////PushInstruction("pointer 0")
@3 // 22309
D=M // 22310
@SP // 22311
AM=M+1 // 22312
A=A-1 // 22313
M=D // 22314

////PushInstruction("constant 50")
@50 // 22315
D=A // 22316
@SP // 22317
AM=M+1 // 22318
A=A-1 // 22319
M=D // 22320

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=3, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22321
D=A // 22322
@14 // 22323
M=D // 22324
@String.appendChar // 22325
D=A // 22326
@13 // 22327
M=D // 22328
@String.setInt.ret.3 // 22329
D=A // 22330
@CALL // 22331
0;JMP // 22332
(String.setInt.ret.3)

////PopInstruction{address=temp 0}
@SP // 22333
AM=M-1 // 22334
D=M // 22335
@5 // 22336
M=D // 22337

////PushInstruction("pointer 0")
@3 // 22338
D=M // 22339
@SP // 22340
AM=M+1 // 22341
A=A-1 // 22342
M=D // 22343

////PushInstruction("constant 55")
@55 // 22344
D=A // 22345
@SP // 22346
AM=M+1 // 22347
A=A-1 // 22348
M=D // 22349

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=4, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22350
D=A // 22351
@14 // 22352
M=D // 22353
@String.appendChar // 22354
D=A // 22355
@13 // 22356
M=D // 22357
@String.setInt.ret.4 // 22358
D=A // 22359
@CALL // 22360
0;JMP // 22361
(String.setInt.ret.4)

////PopInstruction{address=temp 0}
@SP // 22362
AM=M-1 // 22363
D=M // 22364
@5 // 22365
M=D // 22366

////PushInstruction("pointer 0")
@3 // 22367
D=M // 22368
@SP // 22369
AM=M+1 // 22370
A=A-1 // 22371
M=D // 22372

////PushInstruction("constant 54")
@54 // 22373
D=A // 22374
@SP // 22375
AM=M+1 // 22376
A=A-1 // 22377
M=D // 22378

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=5, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22379
D=A // 22380
@14 // 22381
M=D // 22382
@String.appendChar // 22383
D=A // 22384
@13 // 22385
M=D // 22386
@String.setInt.ret.5 // 22387
D=A // 22388
@CALL // 22389
0;JMP // 22390
(String.setInt.ret.5)

////PopInstruction{address=temp 0}
@SP // 22391
AM=M-1 // 22392
D=M // 22393
@5 // 22394
M=D // 22395

////PushInstruction("pointer 0")
@3 // 22396
D=M // 22397
@SP // 22398
AM=M+1 // 22399
A=A-1 // 22400
M=D // 22401

////PushInstruction("constant 56")
@56 // 22402
D=A // 22403
@SP // 22404
AM=M+1 // 22405
A=A-1 // 22406
M=D // 22407

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=6, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22408
D=A // 22409
@14 // 22410
M=D // 22411
@String.appendChar // 22412
D=A // 22413
@13 // 22414
M=D // 22415
@String.setInt.ret.6 // 22416
D=A // 22417
@CALL // 22418
0;JMP // 22419
(String.setInt.ret.6)

////PopInstruction{address=temp 0}
@SP // 22420
AM=M-1 // 22421
D=M // 22422
@5 // 22423
M=D // 22424

////PushInstruction("constant 0")
@SP // 22425
AM=M+1 // 22426
A=A-1 // 22427
M=0 // 22428

////ReturnInstruction{}
@RETURN // 22429
0;JMP // 22430

////GotoInstruction{label='String.setInt.IfElseEND3}
// goto String.setInt.IfElseEND3
@String.setInt.IfElseEND3 // 22431
0;JMP // 22432

////LabelInstruction{label='String.setInt.IfElse3}
// label String.setInt.IfElse3
(String.setInt.IfElse3)

////LabelInstruction{label='String.setInt.IfElseEND3}
// label String.setInt.IfElseEND3
(String.setInt.IfElseEND3)

////PushInstruction("argument 1")
@ARG // 22433
A=M+1 // 22434
D=M // 22435
@SP // 22436
AM=M+1 // 22437
A=A-1 // 22438
M=D // 22439

////ArithmeticInstruction{NEG}
@SP // 22440
A=M-1 // 22441
M=-M // 22442

////PopInstruction{address=argument 1}
@SP // 22443
AM=M-1 // 22444
D=M // 22445
@ARG // 22446
A=M+1 // 22447
M=D // 22448

////GotoInstruction{label='String.setInt.IfElseEND2}
// goto String.setInt.IfElseEND2
@String.setInt.IfElseEND2 // 22449
0;JMP // 22450

////LabelInstruction{label='String.setInt.IfElse2}
// label String.setInt.IfElse2
(String.setInt.IfElse2)

////LabelInstruction{label='String.setInt.IfElseEND2}
// label String.setInt.IfElseEND2
(String.setInt.IfElseEND2)

////PushInstruction("argument 1")
@ARG // 22451
A=M+1 // 22452
D=M // 22453
@SP // 22454
AM=M+1 // 22455
A=A-1 // 22456
M=D // 22457

////PopInstruction{address=local 2}
@SP // 22458
AM=M-1 // 22459
D=M // 22460
@LCL // 22461
A=M+1 // 22462
A=A+1 // 22463
M=D // 22464

////PushInstruction("constant 0")
@SP // 22465
AM=M+1 // 22466
A=A-1 // 22467
M=0 // 22468

////PopInstruction{address=local 3}
@SP // 22469
AM=M-1 // 22470
D=M // 22471
@LCL // 22472
A=M+1 // 22473
A=A+1 // 22474
A=A+1 // 22475
M=D // 22476

////LabelInstruction{label='WHILE_START_String.setInt1}
// label WHILE_START_String.setInt1
(WHILE_START_String.setInt1)

////PushInstruction("local 2")
@LCL // 22477
A=M+1 // 22478
A=A+1 // 22479
D=M // 22480
@SP // 22481
AM=M+1 // 22482
A=A-1 // 22483
M=D // 22484

////PushInstruction("constant 0")
@SP // 22485
AM=M+1 // 22486
A=A-1 // 22487
M=0 // 22488

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt15 // 22489
D=A // 22490
@13 // 22491
M=D // 22492
@SP // 22493
AM=M-1 // 22494
D=M // 22495
A=A-1 // 22496
D=M-D // 22497
@DO_GT // 22498
0;JMP // 22499
(COMPARE_String.setInt_gt15)

////PushInstruction("constant 0")
@SP // 22500
AM=M+1 // 22501
A=A-1 // 22502
M=0 // 22503

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq16 // 22504
D=A // 22505
@13 // 22506
M=D // 22507
@SP // 22508
AM=M-1 // 22509
D=M // 22510
A=A-1 // 22511
D=M-D // 22512
@DO_EQ // 22513
0;JMP // 22514
(COMPARE_String.setInt_eq16)

////IfGotoInstruction{label='WHILE_END_String.setInt1}
// if-goto WHILE_END_String.setInt1
@SP // 22515
AM=M-1 // 22516
D=M // 22517
@WHILE_END_String.setInt1 // 22518
D;JNE // 22519

////PushInstruction("local 2")
@LCL // 22520
A=M+1 // 22521
A=A+1 // 22522
D=M // 22523
@SP // 22524
AM=M+1 // 22525
A=A-1 // 22526
M=D // 22527

////PushInstruction("constant 10")
@10 // 22528
D=A // 22529
@SP // 22530
AM=M+1 // 22531
A=A-1 // 22532
M=D // 22533

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=7, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 22534
D=A // 22535
@14 // 22536
M=D // 22537
@Math.divide // 22538
D=A // 22539
@13 // 22540
M=D // 22541
@String.setInt.ret.7 // 22542
D=A // 22543
@CALL // 22544
0;JMP // 22545
(String.setInt.ret.7)

////PopInstruction{address=local 2}
@SP // 22546
AM=M-1 // 22547
D=M // 22548
@LCL // 22549
A=M+1 // 22550
A=A+1 // 22551
M=D // 22552

////PushInstruction("local 3")
@LCL // 22553
A=M+1 // 22554
A=A+1 // 22555
A=A+1 // 22556
D=M // 22557
@SP // 22558
AM=M+1 // 22559
A=A-1 // 22560
M=D // 22561

////PushInstruction("constant 1")
@SP // 22562
AM=M+1 // 22563
A=A-1 // 22564
M=1 // 22565

////ArithmeticInstruction{ADD}
@SP // 22566
AM=M-1 // 22567
D=M // 22568
A=A-1 // 22569
D=D+M // 22570

////PopInstruction{address=local 3}
@SP // 22571
AM=M-1 // 22572
D=M // 22573
@LCL // 22574
A=M+1 // 22575
A=A+1 // 22576
A=A+1 // 22577
M=D // 22578

////GotoInstruction{label='WHILE_START_String.setInt1}
// goto WHILE_START_String.setInt1
@WHILE_START_String.setInt1 // 22579
0;JMP // 22580

////LabelInstruction{label='WHILE_END_String.setInt1}
// label WHILE_END_String.setInt1
(WHILE_END_String.setInt1)

////PushInstruction("local 3")
@LCL // 22581
A=M+1 // 22582
A=A+1 // 22583
A=A+1 // 22584
D=M // 22585
@SP // 22586
AM=M+1 // 22587
A=A-1 // 22588
M=D // 22589

////CallInstruction{calleeFunction='Array.new', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=8, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.new
@6 // 22590
D=A // 22591
@14 // 22592
M=D // 22593
@Array.new // 22594
D=A // 22595
@13 // 22596
M=D // 22597
@String.setInt.ret.8 // 22598
D=A // 22599
@CALL // 22600
0;JMP // 22601
(String.setInt.ret.8)

////PopInstruction{address=local 5}
@LCL // 22602
D=M // 22603
@5 // 22604
A=D+A // 22605
D=A // 22606
@R13 // 22607
M=D // 22608
@SP // 22609
AM=M-1 // 22610
D=M // 22611
@R13 // 22612
A=M // 22613
M=D // 22614

////PushInstruction("constant 0")
@SP // 22615
AM=M+1 // 22616
A=A-1 // 22617
M=0 // 22618

////PopInstruction{address=local 1}
@SP // 22619
AM=M-1 // 22620
D=M // 22621
@LCL // 22622
A=M+1 // 22623
M=D // 22624

////LabelInstruction{label='WHILE_START_String.setInt2}
// label WHILE_START_String.setInt2
(WHILE_START_String.setInt2)

////PushInstruction("argument 1")
@ARG // 22625
A=M+1 // 22626
D=M // 22627
@SP // 22628
AM=M+1 // 22629
A=A-1 // 22630
M=D // 22631

////PushInstruction("constant 0")
@SP // 22632
AM=M+1 // 22633
A=A-1 // 22634
M=0 // 22635

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt17 // 22636
D=A // 22637
@13 // 22638
M=D // 22639
@SP // 22640
AM=M-1 // 22641
D=M // 22642
A=A-1 // 22643
D=M-D // 22644
@DO_GT // 22645
0;JMP // 22646
(COMPARE_String.setInt_gt17)

////PushInstruction("constant 0")
@SP // 22647
AM=M+1 // 22648
A=A-1 // 22649
M=0 // 22650

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq18 // 22651
D=A // 22652
@13 // 22653
M=D // 22654
@SP // 22655
AM=M-1 // 22656
D=M // 22657
A=A-1 // 22658
D=M-D // 22659
@DO_EQ // 22660
0;JMP // 22661
(COMPARE_String.setInt_eq18)

////IfGotoInstruction{label='WHILE_END_String.setInt2}
// if-goto WHILE_END_String.setInt2
@SP // 22662
AM=M-1 // 22663
D=M // 22664
@WHILE_END_String.setInt2 // 22665
D;JNE // 22666

////PushInstruction("argument 1")
@ARG // 22667
A=M+1 // 22668
D=M // 22669
@SP // 22670
AM=M+1 // 22671
A=A-1 // 22672
M=D // 22673

////PushInstruction("argument 1")
@ARG // 22674
A=M+1 // 22675
D=M // 22676
@SP // 22677
AM=M+1 // 22678
A=A-1 // 22679
M=D // 22680

////PushInstruction("constant 10")
@10 // 22681
D=A // 22682
@SP // 22683
AM=M+1 // 22684
A=A-1 // 22685
M=D // 22686

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=9, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 22687
D=A // 22688
@14 // 22689
M=D // 22690
@Math.divide // 22691
D=A // 22692
@13 // 22693
M=D // 22694
@String.setInt.ret.9 // 22695
D=A // 22696
@CALL // 22697
0;JMP // 22698
(String.setInt.ret.9)

////PushInstruction("constant 10")
@10 // 22699
D=A // 22700
@SP // 22701
AM=M+1 // 22702
A=A-1 // 22703
M=D // 22704

////CallInstruction{calleeFunction='Math.multiply', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=10, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.multiply
@7 // 22705
D=A // 22706
@14 // 22707
M=D // 22708
@Math.multiply // 22709
D=A // 22710
@13 // 22711
M=D // 22712
@String.setInt.ret.10 // 22713
D=A // 22714
@CALL // 22715
0;JMP // 22716
(String.setInt.ret.10)

////ArithmeticInstruction{SUB}
@SP // 22717
AM=M-1 // 22718
D=M // 22719
A=A-1 // 22720
D=M-D // 22721

////PopInstruction{address=local 0}
@SP // 22722
AM=M-1 // 22723
D=M // 22724
@LCL // 22725
A=M // 22726
M=D // 22727

////PushInstruction("local 0")
@LCL // 22728
A=M // 22729
D=M // 22730
@SP // 22731
AM=M+1 // 22732
A=A-1 // 22733
M=D // 22734

////PushInstruction("constant 48")
@48 // 22735
D=A // 22736
@SP // 22737
AM=M+1 // 22738
A=A-1 // 22739
M=D // 22740

////ArithmeticInstruction{ADD}
@SP // 22741
AM=M-1 // 22742
D=M // 22743
A=A-1 // 22744
D=D+M // 22745

////PushInstruction("local 5")
@LCL // 22746
D=M // 22747
@5 // 22748
A=D+A // 22749
D=M // 22750
@SP // 22751
AM=M+1 // 22752
A=A-1 // 22753
M=D // 22754

////PushInstruction("local 1")
@LCL // 22755
A=M+1 // 22756
D=M // 22757
@SP // 22758
AM=M+1 // 22759
A=A-1 // 22760
M=D // 22761

////ArithmeticInstruction{ADD}
@SP // 22762
AM=M-1 // 22763
D=M // 22764
A=A-1 // 22765
D=D+M // 22766

////PopInstruction{address=pointer 1}
@SP // 22767
AM=M-1 // 22768
D=M // 22769
@4 // 22770
M=D // 22771

////PopInstruction{address=that 0}
@SP // 22772
AM=M-1 // 22773
D=M // 22774
@THAT // 22775
A=M // 22776
M=D // 22777

////PushInstruction("argument 1")
@ARG // 22778
A=M+1 // 22779
D=M // 22780
@SP // 22781
AM=M+1 // 22782
A=A-1 // 22783
M=D // 22784

////PushInstruction("constant 10")
@10 // 22785
D=A // 22786
@SP // 22787
AM=M+1 // 22788
A=A-1 // 22789
M=D // 22790

////CallInstruction{calleeFunction='Math.divide', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=11, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Math.divide
@7 // 22791
D=A // 22792
@14 // 22793
M=D // 22794
@Math.divide // 22795
D=A // 22796
@13 // 22797
M=D // 22798
@String.setInt.ret.11 // 22799
D=A // 22800
@CALL // 22801
0;JMP // 22802
(String.setInt.ret.11)

////PopInstruction{address=argument 1}
@SP // 22803
AM=M-1 // 22804
D=M // 22805
@ARG // 22806
A=M+1 // 22807
M=D // 22808

////PushInstruction("local 1")
@LCL // 22809
A=M+1 // 22810
D=M // 22811
@SP // 22812
AM=M+1 // 22813
A=A-1 // 22814
M=D // 22815

////PushInstruction("constant 1")
@SP // 22816
AM=M+1 // 22817
A=A-1 // 22818
M=1 // 22819

////ArithmeticInstruction{ADD}
@SP // 22820
AM=M-1 // 22821
D=M // 22822
A=A-1 // 22823
D=D+M // 22824

////PopInstruction{address=local 1}
@SP // 22825
AM=M-1 // 22826
D=M // 22827
@LCL // 22828
A=M+1 // 22829
M=D // 22830

////GotoInstruction{label='WHILE_START_String.setInt2}
// goto WHILE_START_String.setInt2
@WHILE_START_String.setInt2 // 22831
0;JMP // 22832

////LabelInstruction{label='WHILE_END_String.setInt2}
// label WHILE_END_String.setInt2
(WHILE_END_String.setInt2)

////PushInstruction("local 4")
@LCL // 22833
D=M // 22834
@4 // 22835
A=D+A // 22836
D=M // 22837
@SP // 22838
AM=M+1 // 22839
A=A-1 // 22840
M=D // 22841

////PushInstruction("constant 1")
@SP // 22842
AM=M+1 // 22843
A=A-1 // 22844
M=1 // 22845

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq19 // 22846
D=A // 22847
@13 // 22848
M=D // 22849
@SP // 22850
AM=M-1 // 22851
D=M // 22852
A=A-1 // 22853
D=M-D // 22854
@DO_EQ // 22855
0;JMP // 22856
(COMPARE_String.setInt_eq19)

////PushInstruction("constant 0")
@SP // 22857
AM=M+1 // 22858
A=A-1 // 22859
M=0 // 22860

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq20 // 22861
D=A // 22862
@13 // 22863
M=D // 22864
@SP // 22865
AM=M-1 // 22866
D=M // 22867
A=A-1 // 22868
D=M-D // 22869
@DO_EQ // 22870
0;JMP // 22871
(COMPARE_String.setInt_eq20)

////IfGotoInstruction{label='String.setInt.IfElse4}
// if-goto String.setInt.IfElse4
@SP // 22872
AM=M-1 // 22873
D=M // 22874
@String.setInt.IfElse4 // 22875
D;JNE // 22876

////PushInstruction("pointer 0")
@3 // 22877
D=M // 22878
@SP // 22879
AM=M+1 // 22880
A=A-1 // 22881
M=D // 22882

////PushInstruction("constant 45")
@45 // 22883
D=A // 22884
@SP // 22885
AM=M+1 // 22886
A=A-1 // 22887
M=D // 22888

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=12, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 22889
D=A // 22890
@14 // 22891
M=D // 22892
@String.appendChar // 22893
D=A // 22894
@13 // 22895
M=D // 22896
@String.setInt.ret.12 // 22897
D=A // 22898
@CALL // 22899
0;JMP // 22900
(String.setInt.ret.12)

////PopInstruction{address=temp 0}
@SP // 22901
AM=M-1 // 22902
D=M // 22903
@5 // 22904
M=D // 22905

////GotoInstruction{label='String.setInt.IfElseEND4}
// goto String.setInt.IfElseEND4
@String.setInt.IfElseEND4 // 22906
0;JMP // 22907

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
@LCL // 22908
A=M+1 // 22909
D=M // 22910
@SP // 22911
AM=M+1 // 22912
A=A-1 // 22913
M=D // 22914

////PushInstruction("constant 0")
@SP // 22915
AM=M+1 // 22916
A=A-1 // 22917
M=0 // 22918

////ArithmeticInstruction{GT}
@COMPARE_String.setInt_gt21 // 22919
D=A // 22920
@13 // 22921
M=D // 22922
@SP // 22923
AM=M-1 // 22924
D=M // 22925
A=A-1 // 22926
D=M-D // 22927
@DO_GT // 22928
0;JMP // 22929
(COMPARE_String.setInt_gt21)

////PushInstruction("constant 0")
@SP // 22930
AM=M+1 // 22931
A=A-1 // 22932
M=0 // 22933

////ArithmeticInstruction{EQ}
@COMPARE_String.setInt_eq22 // 22934
D=A // 22935
@13 // 22936
M=D // 22937
@SP // 22938
AM=M-1 // 22939
D=M // 22940
A=A-1 // 22941
D=M-D // 22942
@DO_EQ // 22943
0;JMP // 22944
(COMPARE_String.setInt_eq22)

////IfGotoInstruction{label='WHILE_END_String.setInt3}
// if-goto WHILE_END_String.setInt3
@SP // 22945
AM=M-1 // 22946
D=M // 22947
@WHILE_END_String.setInt3 // 22948
D;JNE // 22949

////PushInstruction("local 1")
@LCL // 22950
A=M+1 // 22951
D=M // 22952
@SP // 22953
AM=M+1 // 22954
A=A-1 // 22955
M=D // 22956

////PushInstruction("constant 1")
@SP // 22957
AM=M+1 // 22958
A=A-1 // 22959
M=1 // 22960

////ArithmeticInstruction{SUB}
@SP // 22961
AM=M-1 // 22962
D=M // 22963
A=A-1 // 22964
D=M-D // 22965

////PopInstruction{address=local 1}
@SP // 22966
AM=M-1 // 22967
D=M // 22968
@LCL // 22969
A=M+1 // 22970
M=D // 22971

////PushInstruction("pointer 0")
@3 // 22972
D=M // 22973
@SP // 22974
AM=M+1 // 22975
A=A-1 // 22976
M=D // 22977

////PushInstruction("local 5")
@LCL // 22978
D=M // 22979
@5 // 22980
A=D+A // 22981
D=M // 22982
@SP // 22983
AM=M+1 // 22984
A=A-1 // 22985
M=D // 22986

////PushInstruction("local 1")
@LCL // 22987
A=M+1 // 22988
D=M // 22989
@SP // 22990
AM=M+1 // 22991
A=A-1 // 22992
M=D // 22993

////ArithmeticInstruction{ADD}
@SP // 22994
AM=M-1 // 22995
D=M // 22996
A=A-1 // 22997
D=D+M // 22998

////PopInstruction{address=pointer 1}
@SP // 22999
AM=M-1 // 23000
D=M // 23001
@4 // 23002
M=D // 23003

////PushInstruction("that 0")
@THAT // 23004
A=M // 23005
D=M // 23006
@SP // 23007
AM=M+1 // 23008
A=A-1 // 23009
M=D // 23010

////CallInstruction{calleeFunction='String.appendChar', numArgs=2, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=13, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call String.appendChar
@7 // 23011
D=A // 23012
@14 // 23013
M=D // 23014
@String.appendChar // 23015
D=A // 23016
@13 // 23017
M=D // 23018
@String.setInt.ret.13 // 23019
D=A // 23020
@CALL // 23021
0;JMP // 23022
(String.setInt.ret.13)

////PopInstruction{address=temp 0}
@SP // 23023
AM=M-1 // 23024
D=M // 23025
@5 // 23026
M=D // 23027

////GotoInstruction{label='WHILE_START_String.setInt3}
// goto WHILE_START_String.setInt3
@WHILE_START_String.setInt3 // 23028
0;JMP // 23029

////LabelInstruction{label='WHILE_END_String.setInt3}
// label WHILE_END_String.setInt3
(WHILE_END_String.setInt3)

////PushInstruction("local 5")
@LCL // 23030
D=M // 23031
@5 // 23032
A=D+A // 23033
D=M // 23034
@SP // 23035
AM=M+1 // 23036
A=A-1 // 23037
M=D // 23038

////CallInstruction{calleeFunction='Array.dispose', numArgs=1, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=14, String.setCharAt=0, String.length=0, String.new=2}, currentFunction='String.setInt'}
// call Array.dispose
@6 // 23039
D=A // 23040
@14 // 23041
M=D // 23042
@Array.dispose // 23043
D=A // 23044
@13 // 23045
M=D // 23046
@String.setInt.ret.14 // 23047
D=A // 23048
@CALL // 23049
0;JMP // 23050
(String.setInt.ret.14)

////PopInstruction{address=temp 0}
@SP // 23051
AM=M-1 // 23052
D=M // 23053
@5 // 23054
M=D // 23055

////PushInstruction("constant 0")
@SP // 23056
AM=M+1 // 23057
A=A-1 // 23058
M=0 // 23059

////ReturnInstruction{}
@RETURN // 23060
0;JMP // 23061

////FunctionInstruction{functionName='String.backSpace', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2}}
// function String.backSpace with 0
(String.backSpace)

////PushInstruction("constant 129")
@129 // 23062
D=A // 23063
@SP // 23064
AM=M+1 // 23065
A=A-1 // 23066
M=D // 23067

////ReturnInstruction{}
@RETURN // 23068
0;JMP // 23069

////FunctionInstruction{functionName='String.doubleQuote', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.doubleQuote with 0
(String.doubleQuote)

////PushInstruction("constant 34")
@34 // 23070
D=A // 23071
@SP // 23072
AM=M+1 // 23073
A=A-1 // 23074
M=D // 23075

////ReturnInstruction{}
@RETURN // 23076
0;JMP // 23077

////FunctionInstruction{functionName='String.newLine', numLocals=0, funcMapping={String.dispose=1, String.charAt=0, String.eraseLastChar=0, String.intValue=1, String.appendChar=3, String.setInt=15, String.doubleQuote=0, String.setCharAt=0, String.length=0, String.new=2, String.backSpace=0}}
// function String.newLine with 0
(String.newLine)

////PushInstruction("constant 128")
@128 // 23078
D=A // 23079
@SP // 23080
AM=M+1 // 23081
A=A-1 // 23082
M=D // 23083

////ReturnInstruction{}
@RETURN // 23084
0;JMP // 23085

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={}}
// function Sys.init with 0
(Sys.init)

////CallInstruction{calleeFunction='Memory.init', numArgs=0, funcMapping={Sys.init=0}, currentFunction='Sys.init'}
// call Memory.init
@5 // 23086
D=A // 23087
@14 // 23088
M=D // 23089
@Memory.init // 23090
D=A // 23091
@13 // 23092
M=D // 23093
@Sys.init.ret.0 // 23094
D=A // 23095
@CALL // 23096
0;JMP // 23097
(Sys.init.ret.0)

////PopInstruction{address=temp 0}
@SP // 23098
AM=M-1 // 23099
D=M // 23100
@5 // 23101
M=D // 23102

////CallInstruction{calleeFunction='Math.init', numArgs=0, funcMapping={Sys.init=1}, currentFunction='Sys.init'}
// call Math.init
@5 // 23103
D=A // 23104
@14 // 23105
M=D // 23106
@Math.init // 23107
D=A // 23108
@13 // 23109
M=D // 23110
@Sys.init.ret.1 // 23111
D=A // 23112
@CALL // 23113
0;JMP // 23114
(Sys.init.ret.1)

////PopInstruction{address=temp 0}
@SP // 23115
AM=M-1 // 23116
D=M // 23117
@5 // 23118
M=D // 23119

////CallInstruction{calleeFunction='Screen.init', numArgs=0, funcMapping={Sys.init=2}, currentFunction='Sys.init'}
// call Screen.init
@5 // 23120
D=A // 23121
@14 // 23122
M=D // 23123
@Screen.init // 23124
D=A // 23125
@13 // 23126
M=D // 23127
@Sys.init.ret.2 // 23128
D=A // 23129
@CALL // 23130
0;JMP // 23131
(Sys.init.ret.2)

////PopInstruction{address=temp 0}
@SP // 23132
AM=M-1 // 23133
D=M // 23134
@5 // 23135
M=D // 23136

////CallInstruction{calleeFunction='Output.init', numArgs=0, funcMapping={Sys.init=3}, currentFunction='Sys.init'}
// call Output.init
@5 // 23137
D=A // 23138
@14 // 23139
M=D // 23140
@Output.init // 23141
D=A // 23142
@13 // 23143
M=D // 23144
@Sys.init.ret.3 // 23145
D=A // 23146
@CALL // 23147
0;JMP // 23148
(Sys.init.ret.3)

////PopInstruction{address=temp 0}
@SP // 23149
AM=M-1 // 23150
D=M // 23151
@5 // 23152
M=D // 23153

////CallInstruction{calleeFunction='Keyboard.init', numArgs=0, funcMapping={Sys.init=4}, currentFunction='Sys.init'}
// call Keyboard.init
@5 // 23154
D=A // 23155
@14 // 23156
M=D // 23157
@Keyboard.init // 23158
D=A // 23159
@13 // 23160
M=D // 23161
@Sys.init.ret.4 // 23162
D=A // 23163
@CALL // 23164
0;JMP // 23165
(Sys.init.ret.4)

////PopInstruction{address=temp 0}
@SP // 23166
AM=M-1 // 23167
D=M // 23168
@5 // 23169
M=D // 23170

////CallInstruction{calleeFunction='Main.main', numArgs=0, funcMapping={Sys.init=5}, currentFunction='Sys.init'}
// call Main.main
@5 // 23171
D=A // 23172
@14 // 23173
M=D // 23174
@Main.main // 23175
D=A // 23176
@13 // 23177
M=D // 23178
@Sys.init.ret.5 // 23179
D=A // 23180
@CALL // 23181
0;JMP // 23182
(Sys.init.ret.5)

////PopInstruction{address=temp 0}
@SP // 23183
AM=M-1 // 23184
D=M // 23185
@5 // 23186
M=D // 23187

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.init=6}, currentFunction='Sys.init'}
// call Sys.halt
@5 // 23188
D=A // 23189
@14 // 23190
M=D // 23191
@Sys.halt // 23192
D=A // 23193
@13 // 23194
M=D // 23195
@Sys.init.ret.6 // 23196
D=A // 23197
@CALL // 23198
0;JMP // 23199
(Sys.init.ret.6)

////PopInstruction{address=temp 0}
@SP // 23200
AM=M-1 // 23201
D=M // 23202
@5 // 23203
M=D // 23204

////PushInstruction("constant 0")
@SP // 23205
AM=M+1 // 23206
A=A-1 // 23207
M=0 // 23208

////ReturnInstruction{}
@RETURN // 23209
0;JMP // 23210

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={Sys.init=7}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='WHILE_START_Sys.halt1}
// label WHILE_START_Sys.halt1
(WHILE_START_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23211
AM=M+1 // 23212
A=A-1 // 23213
M=0 // 23214

////ArithmeticInstruction{NOT}
@SP // 23215
A=M-1 // 23216
M=!M // 23217

////PushInstruction("constant 0")
@SP // 23218
AM=M+1 // 23219
A=A-1 // 23220
M=0 // 23221

////ArithmeticInstruction{EQ}
@COMPARE_Sys.halt_eq0 // 23222
D=A // 23223
@13 // 23224
M=D // 23225
@SP // 23226
AM=M-1 // 23227
D=M // 23228
A=A-1 // 23229
D=M-D // 23230
@DO_EQ // 23231
0;JMP // 23232
(COMPARE_Sys.halt_eq0)

////IfGotoInstruction{label='WHILE_END_Sys.halt1}
// if-goto WHILE_END_Sys.halt1
@SP // 23233
AM=M-1 // 23234
D=M // 23235
@WHILE_END_Sys.halt1 // 23236
D;JNE // 23237

////GotoInstruction{label='WHILE_START_Sys.halt1}
// goto WHILE_START_Sys.halt1
@WHILE_START_Sys.halt1 // 23238
0;JMP // 23239

////LabelInstruction{label='WHILE_END_Sys.halt1}
// label WHILE_END_Sys.halt1
(WHILE_END_Sys.halt1)

////PushInstruction("constant 0")
@SP // 23240
AM=M+1 // 23241
A=A-1 // 23242
M=0 // 23243

////ReturnInstruction{}
@RETURN // 23244
0;JMP // 23245

////FunctionInstruction{functionName='Sys.wait', numLocals=1, funcMapping={Sys.init=7, Sys.halt=0}}
// function Sys.wait with 1
(Sys.wait)
@SP // 23246
AM=M+1 // 23247
A=A-1 // 23248
M=0 // 23249

////LabelInstruction{label='WHILE_START_Sys.wait1}
// label WHILE_START_Sys.wait1
(WHILE_START_Sys.wait1)

////PushInstruction("argument 0")
@ARG // 23250
A=M // 23251
D=M // 23252
@SP // 23253
AM=M+1 // 23254
A=A-1 // 23255
M=D // 23256

////PushInstruction("constant 0")
@SP // 23257
AM=M+1 // 23258
A=A-1 // 23259
M=0 // 23260

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt1 // 23261
D=A // 23262
@13 // 23263
M=D // 23264
@SP // 23265
AM=M-1 // 23266
D=M // 23267
A=A-1 // 23268
D=M-D // 23269
@DO_GT // 23270
0;JMP // 23271
(COMPARE_Sys.wait_gt1)

////PushInstruction("constant 0")
@SP // 23272
AM=M+1 // 23273
A=A-1 // 23274
M=0 // 23275

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq2 // 23276
D=A // 23277
@13 // 23278
M=D // 23279
@SP // 23280
AM=M-1 // 23281
D=M // 23282
A=A-1 // 23283
D=M-D // 23284
@DO_EQ // 23285
0;JMP // 23286
(COMPARE_Sys.wait_eq2)

////IfGotoInstruction{label='WHILE_END_Sys.wait1}
// if-goto WHILE_END_Sys.wait1
@SP // 23287
AM=M-1 // 23288
D=M // 23289
@WHILE_END_Sys.wait1 // 23290
D;JNE // 23291

////PushInstruction("argument 0")
@ARG // 23292
A=M // 23293
D=M // 23294
@SP // 23295
AM=M+1 // 23296
A=A-1 // 23297
M=D // 23298

////PushInstruction("constant 1")
@SP // 23299
AM=M+1 // 23300
A=A-1 // 23301
M=1 // 23302

////ArithmeticInstruction{SUB}
@SP // 23303
AM=M-1 // 23304
D=M // 23305
A=A-1 // 23306
D=M-D // 23307

////PopInstruction{address=argument 0}
@SP // 23308
AM=M-1 // 23309
D=M // 23310
@ARG // 23311
A=M // 23312
M=D // 23313

////PushInstruction("constant 70")
@70 // 23314
D=A // 23315
@SP // 23316
AM=M+1 // 23317
A=A-1 // 23318
M=D // 23319

////PopInstruction{address=local 0}
@SP // 23320
AM=M-1 // 23321
D=M // 23322
@LCL // 23323
A=M // 23324
M=D // 23325

////LabelInstruction{label='WHILE_START_Sys.wait2}
// label WHILE_START_Sys.wait2
(WHILE_START_Sys.wait2)

////PushInstruction("local 0")
@LCL // 23326
A=M // 23327
D=M // 23328
@SP // 23329
AM=M+1 // 23330
A=A-1 // 23331
M=D // 23332

////PushInstruction("constant 0")
@SP // 23333
AM=M+1 // 23334
A=A-1 // 23335
M=0 // 23336

////ArithmeticInstruction{GT}
@COMPARE_Sys.wait_gt3 // 23337
D=A // 23338
@13 // 23339
M=D // 23340
@SP // 23341
AM=M-1 // 23342
D=M // 23343
A=A-1 // 23344
D=M-D // 23345
@DO_GT // 23346
0;JMP // 23347
(COMPARE_Sys.wait_gt3)

////PushInstruction("constant 0")
@SP // 23348
AM=M+1 // 23349
A=A-1 // 23350
M=0 // 23351

////ArithmeticInstruction{EQ}
@COMPARE_Sys.wait_eq4 // 23352
D=A // 23353
@13 // 23354
M=D // 23355
@SP // 23356
AM=M-1 // 23357
D=M // 23358
A=A-1 // 23359
D=M-D // 23360
@DO_EQ // 23361
0;JMP // 23362
(COMPARE_Sys.wait_eq4)

////IfGotoInstruction{label='WHILE_END_Sys.wait2}
// if-goto WHILE_END_Sys.wait2
@SP // 23363
AM=M-1 // 23364
D=M // 23365
@WHILE_END_Sys.wait2 // 23366
D;JNE // 23367

////PushInstruction("local 0")
@LCL // 23368
A=M // 23369
D=M // 23370
@SP // 23371
AM=M+1 // 23372
A=A-1 // 23373
M=D // 23374

////PushInstruction("constant 1")
@SP // 23375
AM=M+1 // 23376
A=A-1 // 23377
M=1 // 23378

////ArithmeticInstruction{SUB}
@SP // 23379
AM=M-1 // 23380
D=M // 23381
A=A-1 // 23382
D=M-D // 23383

////PopInstruction{address=local 0}
@SP // 23384
AM=M-1 // 23385
D=M // 23386
@LCL // 23387
A=M // 23388
M=D // 23389

////GotoInstruction{label='WHILE_START_Sys.wait2}
// goto WHILE_START_Sys.wait2
@WHILE_START_Sys.wait2 // 23390
0;JMP // 23391

////LabelInstruction{label='WHILE_END_Sys.wait2}
// label WHILE_END_Sys.wait2
(WHILE_END_Sys.wait2)

////GotoInstruction{label='WHILE_START_Sys.wait1}
// goto WHILE_START_Sys.wait1
@WHILE_START_Sys.wait1 // 23392
0;JMP // 23393

////LabelInstruction{label='WHILE_END_Sys.wait1}
// label WHILE_END_Sys.wait1
(WHILE_END_Sys.wait1)

////PushInstruction("constant 0")
@SP // 23394
AM=M+1 // 23395
A=A-1 // 23396
M=0 // 23397

////ReturnInstruction{}
@RETURN // 23398
0;JMP // 23399

////FunctionInstruction{functionName='Sys.error', numLocals=0, funcMapping={Sys.wait=0, Sys.init=7, Sys.halt=0}}
// function Sys.error with 0
(Sys.error)

////PushInstruction("argument 0")
@ARG // 23400
A=M // 23401
D=M // 23402
@SP // 23403
AM=M+1 // 23404
A=A-1 // 23405
M=D // 23406

////CallInstruction{calleeFunction='Output.printInt', numArgs=1, funcMapping={Sys.wait=0, Sys.error=0, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.printInt
@6 // 23407
D=A // 23408
@14 // 23409
M=D // 23410
@Output.printInt // 23411
D=A // 23412
@13 // 23413
M=D // 23414
@Sys.error.ret.0 // 23415
D=A // 23416
@CALL // 23417
0;JMP // 23418
(Sys.error.ret.0)

////PopInstruction{address=temp 0}
@SP // 23419
AM=M-1 // 23420
D=M // 23421
@5 // 23422
M=D // 23423

////CallInstruction{calleeFunction='Output.println', numArgs=0, funcMapping={Sys.wait=0, Sys.error=1, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Output.println
@5 // 23424
D=A // 23425
@14 // 23426
M=D // 23427
@Output.println // 23428
D=A // 23429
@13 // 23430
M=D // 23431
@Sys.error.ret.1 // 23432
D=A // 23433
@CALL // 23434
0;JMP // 23435
(Sys.error.ret.1)

////PopInstruction{address=temp 0}
@SP // 23436
AM=M-1 // 23437
D=M // 23438
@5 // 23439
M=D // 23440

////CallInstruction{calleeFunction='Sys.halt', numArgs=0, funcMapping={Sys.wait=0, Sys.error=2, Sys.init=7, Sys.halt=0}, currentFunction='Sys.error'}
// call Sys.halt
@5 // 23441
D=A // 23442
@14 // 23443
M=D // 23444
@Sys.halt // 23445
D=A // 23446
@13 // 23447
M=D // 23448
@Sys.error.ret.2 // 23449
D=A // 23450
@CALL // 23451
0;JMP // 23452
(Sys.error.ret.2)

////PopInstruction{address=temp 0}
@SP // 23453
AM=M-1 // 23454
D=M // 23455
@5 // 23456
M=D // 23457

////PushInstruction("constant 0")
@SP // 23458
AM=M+1 // 23459
A=A-1 // 23460
M=0 // 23461

////ReturnInstruction{}
@RETURN // 23462
0;JMP // 23463

