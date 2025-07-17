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
@Array.dispose.ret.0 // 127
D=A // 128
@CALL // 129
0;JMP // 130
(Array.dispose.ret.0)
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

////GotoInstruction{label='String.dispose$IF_FALSE1}
// goto String.dispose$IF_FALSE1
@String.dispose$IF_FALSE1 // 150
0;JMP // 151

////LabelInstruction{label='String.dispose$IF_TRUE1}
// label String.dispose$IF_TRUE1
(String.dispose$IF_TRUE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 152
A=M // 153
D=M // 154
@SP // 155
AM=M+1 // 156
A=A-1 // 157
M=D // 158
// call Array.dispose
@6 // 159
D=A // 160
@14 // 161
M=D // 162
@Array.dispose // 163
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

////LabelInstruction{label='String.dispose$IF_FALSE1}
// label String.dispose$IF_FALSE1
(String.dispose$IF_FALSE1)

////PushInstruction("constant 0")
@SP // 173
AM=M+1 // 174
A=A-1 // 175
M=0 // 176
@RETURN // 177
0;JMP // 178

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Array.1 // 179
M=0 // 180

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.1 // 181
D=A // 182
@SP // 183
AM=M+1 // 184
A=A-1 // 185
M=D // 186
@Array.2 // 187
D=M // 188
@22 // 189
D=D-A // 190
@DO_EQ // 191
0;JMP // 192
(Output.println.EQ.1)
@Output.println$IF_TRUE1 // 193
D;JNE // 194

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 195
0;JMP // 196

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Array.2 // 197
M=0 // 198

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 199
0;JMP // 200

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

@Array.2 // 201
M=M+1 // 202

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 203
AM=M+1 // 204
A=A-1 // 205
M=0 // 206
@RETURN // 207
0;JMP // 208

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 209
AM=M+1 // 210
A=A-1 // 211
M=0 // 212
@RETURN // 213
0;JMP // 214

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 215
AM=M+1 // 216
A=A-1 // 217
M=0 // 218

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

@ARG // 219
A=M // 220
D=M // 221
@0 // 222
A=D+A // 223
D=M // 224
@LCL // 225
A=M // 226
M=D // 227

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
@Memory.get_best_fit.LT.2 // 228
D=A // 229
@SP // 230
AM=M+1 // 231
A=A-1 // 232
M=D // 233
@LCL // 234
A=M // 235
D=M // 236
@0 // 237
A=D+A // 238
D=M // 239
@SP // 240
AM=M+1 // 241
A=A-1 // 242
M=D // 243
@ARG // 244
A=M+1 // 245
D=M // 246
@SP // 247
AM=M-1 // 248
D=M-D // 249
@DO_LT // 250
0;JMP // 251
(Memory.get_best_fit.LT.2)
D=!D // 252
@Memory.get_best_fit$IF_TRUE1 // 253
D;JNE // 254

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE1}
// goto Memory.get_best_fit$IF_FALSE1
@Memory.get_best_fit$IF_FALSE1 // 255
0;JMP // 256

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 257
A=M // 258
D=M // 259
@SP // 260
AM=M+1 // 261
A=A-1 // 262
M=D // 263
@RETURN // 264
0;JMP // 265

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
@Memory.get_best_fit.EQ.3 // 266
D=A // 267
@SP // 268
AM=M+1 // 269
A=A-1 // 270
M=D // 271
@LCL // 272
A=M // 273
D=M // 274
@3 // 275
A=D+A // 276
D=M // 277
@DO_EQ // 278
0;JMP // 279
(Memory.get_best_fit.EQ.3)
@Memory.get_best_fit_WHILE_END1 // 280
D;JNE // 281

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

@LCL // 282
A=M // 283
D=M // 284
@3 // 285
A=D+A // 286
D=M // 287
@LCL // 288
A=M // 289
M=D // 290

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
@Memory.get_best_fit.LT.4 // 291
D=A // 292
@SP // 293
AM=M+1 // 294
A=A-1 // 295
M=D // 296
@LCL // 297
A=M // 298
D=M // 299
@0 // 300
A=D+A // 301
D=M // 302
@SP // 303
AM=M+1 // 304
A=A-1 // 305
M=D // 306
@ARG // 307
A=M+1 // 308
D=M // 309
@SP // 310
AM=M-1 // 311
D=M-D // 312
@DO_LT // 313
0;JMP // 314
(Memory.get_best_fit.LT.4)
D=!D // 315
@Memory.get_best_fit$IF_TRUE2 // 316
D;JNE // 317

////GotoInstruction{label='Memory.get_best_fit$IF_FALSE2}
// goto Memory.get_best_fit$IF_FALSE2
@Memory.get_best_fit$IF_FALSE2 // 318
0;JMP // 319

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 320
A=M // 321
D=M // 322
@SP // 323
AM=M+1 // 324
A=A-1 // 325
M=D // 326
@RETURN // 327
0;JMP // 328

////LabelInstruction{label='Memory.get_best_fit$IF_FALSE2}
// label Memory.get_best_fit$IF_FALSE2
(Memory.get_best_fit$IF_FALSE2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 329
0;JMP // 330

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 331
AM=M+1 // 332
A=A-1 // 333
M=0 // 334
@RETURN // 335
0;JMP // 336

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1}}
// function String.appendChar with 1
(String.appendChar)
@SP // 337
AM=M+1 // 338
A=A-1 // 339
M=0 // 340

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 341
A=M // 342
D=M // 343
@3 // 344
M=D // 345

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.5 // 346
D=A // 347
@SP // 348
AM=M+1 // 349
A=A-1 // 350
M=D // 351
@THIS // 352
A=M+1 // 353
A=A+1 // 354
D=M // 355
A=A-1 // 356
D=M-D // 357
@DO_EQ // 358
0;JMP // 359
(String.appendChar.EQ.5)
@String.appendChar$IF_TRUE1 // 360
D;JNE // 361

////GotoInstruction{label='String.appendChar$IF_FALSE1}
// goto String.appendChar$IF_FALSE1
@String.appendChar$IF_FALSE1 // 362
0;JMP // 363

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

@THIS // 364
A=M+1 // 365
A=A+1 // 366
D=M // 367
D=D+M // 368
@SP // 369
AM=M+1 // 370
A=A-1 // 371
M=D // 372
// call Array.new
@6 // 373
D=A // 374
@14 // 375
M=D // 376
@Array.new // 377
D=A // 378
@13 // 379
M=D // 380
@String.appendChar.ret.0 // 381
D=A // 382
@CALL // 383
0;JMP // 384
(String.appendChar.ret.0)
@SP // 385
AM=M-1 // 386
D=M // 387
@LCL // 388
A=M // 389
M=D // 390

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 391
A=M // 392
D=M // 393
@SP // 394
AM=M+1 // 395
A=A-1 // 396
M=D // 397
@LCL // 398
A=M // 399
D=M // 400
@SP // 401
AM=M+1 // 402
A=A-1 // 403
M=D // 404
@THIS // 405
A=M+1 // 406
D=M // 407
@SP // 408
AM=M+1 // 409
A=A-1 // 410
M=D // 411
// call Memory.copy
@8 // 412
D=A // 413
@14 // 414
M=D // 415
@Memory.copy // 416
D=A // 417
@13 // 418
M=D // 419
@String.appendChar.ret.1 // 420
D=A // 421
@CALL // 422
0;JMP // 423
(String.appendChar.ret.1)
@SP // 424
M=M-1 // 425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Array.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 426
A=M // 427
D=M // 428
@SP // 429
AM=M+1 // 430
A=A-1 // 431
M=D // 432
// call Array.dispose
@6 // 433
D=A // 434
@14 // 435
M=D // 436
@Array.dispose // 437
D=A // 438
@13 // 439
M=D // 440
@String.appendChar.ret.2 // 441
D=A // 442
@CALL // 443
0;JMP // 444
(String.appendChar.ret.2)
@SP // 445
M=M-1 // 446

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

@THIS // 447
A=M+1 // 448
A=A+1 // 449
D=M // 450
@THIS // 451
A=M+1 // 452
A=A+1 // 453
M=D+M // 454

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 455
A=M // 456
D=M // 457
@THIS // 458
A=M // 459
M=D // 460

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
@THIS // 461
A=M+1 // 462
D=M // 463
A=A-1 // 464
D=D+M // 465
@SP // 466
AM=M+1 // 467
A=A-1 // 468
M=D // 469
@ARG // 470
A=M+1 // 471
D=M // 472
@SP // 473
AM=M-1 // 474
A=M // 475
M=D // 476

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

@THIS // 477
A=M+1 // 478
M=M+1 // 479

////PushInstruction("pointer 0")
@3 // 480
D=M // 481
@SP // 482
AM=M+1 // 483
A=A-1 // 484
M=D // 485
@RETURN // 486
0;JMP // 487

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 488
AM=M+1 // 489
A=A-1 // 490
M=0 // 491

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 492
A=M // 493
D=M // 494
@LCL // 495
A=M // 496
M=D // 497

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
@Screen.drawHorizontalLine.GT.6 // 498
D=A // 499
@SP // 500
AM=M+1 // 501
A=A-1 // 502
M=D // 503
@LCL // 504
A=M // 505
D=M // 506
@SP // 507
AM=M+1 // 508
A=A-1 // 509
M=D // 510
@ARG // 511
A=M+1 // 512
D=M // 513
@SP // 514
AM=M-1 // 515
D=M-D // 516
@DO_GT // 517
0;JMP // 518
(Screen.drawHorizontalLine.GT.6)
@Screen.drawHorizontalLine_WHILE_END1 // 519
D;JNE // 520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 521
A=M // 522
D=M // 523
@SP // 524
AM=M+1 // 525
A=A-1 // 526
M=D // 527
@ARG // 528
A=M+1 // 529
A=A+1 // 530
D=M // 531
@SP // 532
AM=M+1 // 533
A=A-1 // 534
M=D // 535
// call Screen.drawPixel
@7 // 536
D=A // 537
@14 // 538
M=D // 539
@Screen.drawPixel // 540
D=A // 541
@13 // 542
M=D // 543
@Screen.drawHorizontalLine.ret.0 // 544
D=A // 545
@CALL // 546
0;JMP // 547
(Screen.drawHorizontalLine.ret.0)
@SP // 548
M=M-1 // 549

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

@LCL // 550
A=M // 551
M=M+1 // 552

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 553
0;JMP // 554

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 555
AM=M+1 // 556
A=A-1 // 557
M=0 // 558
@RETURN // 559
0;JMP // 560

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.drawHorizontalLine=1}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 561
D=A // 562
@SP // 563
AM=D+M // 564
A=A-1 // 565
M=0 // 566
A=A-1 // 567
M=0 // 568
A=A-1 // 569
M=0 // 570
A=A-1 // 571
M=0 // 572
A=A-1 // 573
M=0 // 574
A=A-1 // 575
M=0 // 576
A=A-1 // 577
M=0 // 578
A=A-1 // 579
M=0 // 580
A=A-1 // 581
M=0 // 582
A=A-1 // 583
M=0 // 584

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 585
D=M // 586
@9 // 587
A=D+A // 588
M=-1 // 589

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Array.0 // 590
D=!M // 591
@Screen.drawRectangle$IF_TRUE1 // 592
D;JNE // 593

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE1}
// goto Screen.drawRectangle$IF_FALSE1
@Screen.drawRectangle$IF_FALSE1 // 594
0;JMP // 595

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 596
D=M // 597
@9 // 598
A=D+A // 599
M=0 // 600

////LabelInstruction{label='Screen.drawRectangle$IF_FALSE1}
// label Screen.drawRectangle$IF_FALSE1
(Screen.drawRectangle$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 601
A=M+1 // 602
D=M // 603
@LCL // 604
A=M // 605
M=D // 606

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
@Screen.drawRectangle.GT.7 // 607
D=A // 608
@SP // 609
AM=M+1 // 610
A=A-1 // 611
M=D // 612
@LCL // 613
A=M // 614
D=M // 615
@SP // 616
AM=M+1 // 617
A=A-1 // 618
M=D // 619
@ARG // 620
A=M+1 // 621
A=A+1 // 622
A=A+1 // 623
D=M // 624
@SP // 625
AM=M-1 // 626
D=M-D // 627
@DO_GT // 628
0;JMP // 629
(Screen.drawRectangle.GT.7)
@Screen.drawRectangle_WHILE_END1 // 630
D;JNE // 631

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 632
A=M // 633
D=M // 634
@SP // 635
AM=M+1 // 636
A=A-1 // 637
M=D // 638
@16 // 639
D=A // 640
@SP // 641
AM=M+1 // 642
A=A-1 // 643
M=D // 644
// call Math.divide
@7 // 645
D=A // 646
@14 // 647
M=D // 648
@Math.divide // 649
D=A // 650
@13 // 651
M=D // 652
@Screen.drawRectangle.ret.0 // 653
D=A // 654
@CALL // 655
0;JMP // 656
(Screen.drawRectangle.ret.0)
@SP // 657
AM=M-1 // 658
D=M // 659
@LCL // 660
A=M+1 // 661
M=D // 662

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 663
A=M+1 // 664
A=A+1 // 665
D=M // 666
@SP // 667
AM=M+1 // 668
A=A-1 // 669
M=D // 670
@16 // 671
D=A // 672
@SP // 673
AM=M+1 // 674
A=A-1 // 675
M=D // 676
// call Math.divide
@7 // 677
D=A // 678
@14 // 679
M=D // 680
@Math.divide // 681
D=A // 682
@13 // 683
M=D // 684
@Screen.drawRectangle.ret.1 // 685
D=A // 686
@CALL // 687
0;JMP // 688
(Screen.drawRectangle.ret.1)
@SP // 689
AM=M-1 // 690
D=M // 691
@LCL // 692
A=M+1 // 693
A=A+1 // 694
M=D // 695

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

@ARG // 696
A=M // 697
D=M // 698
@15 // 699
D=D&A // 700
@LCL // 701
A=M+1 // 702
A=A+1 // 703
A=A+1 // 704
M=D // 705

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

@ARG // 706
A=M+1 // 707
A=A+1 // 708
D=M // 709
@15 // 710
D=D&A // 711
@SP // 712
AM=M+1 // 713
A=A-1 // 714
M=D // 715
@LCL // 716
D=M // 717
@4 // 718
A=D+A // 719
D=A // 720
@R13 // 721
M=D // 722
@SP // 723
AM=M-1 // 724
D=M // 725
@R13 // 726
A=M // 727
M=D // 728

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 729
A=M // 730
D=M // 731
@SP // 732
AM=M+1 // 733
A=A-1 // 734
M=D // 735
@32 // 736
D=A // 737
@SP // 738
AM=M+1 // 739
A=A-1 // 740
M=D // 741
// call Math.multiply
@7 // 742
D=A // 743
@14 // 744
M=D // 745
@Math.multiply // 746
D=A // 747
@13 // 748
M=D // 749
@Screen.drawRectangle.ret.2 // 750
D=A // 751
@CALL // 752
0;JMP // 753
(Screen.drawRectangle.ret.2)
@LCL // 754
D=M // 755
@5 // 756
A=D+A // 757
D=A // 758
@R13 // 759
M=D // 760
@SP // 761
AM=M-1 // 762
D=M // 763
@R13 // 764
A=M // 765
M=D // 766

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.8 // 767
D=A // 768
@SP // 769
AM=M+1 // 770
A=A-1 // 771
M=D // 772
@LCL // 773
A=M+1 // 774
A=A+1 // 775
D=M // 776
A=A-1 // 777
D=M-D // 778
@DO_EQ // 779
0;JMP // 780
(Screen.drawRectangle.EQ.8)
@Screen.drawRectangle$IF_TRUE2 // 781
D;JNE // 782

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 783
0;JMP // 784

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

@LCL // 785
D=M // 786
@4 // 787
A=D+A // 788
D=M // 789
@SP // 790
AM=M+1 // 791
A=A-1 // 792
M=D+1 // 793
// call Math.twoToThe
@6 // 794
D=A // 795
@14 // 796
M=D // 797
@Math.twoToThe // 798
D=A // 799
@13 // 800
M=D // 801
@Screen.drawRectangle.ret.3 // 802
D=A // 803
@CALL // 804
0;JMP // 805
(Screen.drawRectangle.ret.3)
@SP // 806
AM=M-1 // 807
D=M // 808
D=D-1 // 809
@SP // 810
AM=M+1 // 811
A=A-1 // 812
M=D // 813
@LCL // 814
A=M+1 // 815
A=A+1 // 816
A=A+1 // 817
D=M // 818
@SP // 819
AM=M+1 // 820
A=A-1 // 821
M=D // 822
// call Math.twoToThe
@6 // 823
D=A // 824
@14 // 825
M=D // 826
@Math.twoToThe // 827
D=A // 828
@13 // 829
M=D // 830
@Screen.drawRectangle.ret.4 // 831
D=A // 832
@CALL // 833
0;JMP // 834
(Screen.drawRectangle.ret.4)
@SP // 835
AM=M-1 // 836
D=M // 837
D=D-1 // 838
@SP // 839
AM=M-1 // 840
D=M-D // 841
@SP // 842
AM=M+1 // 843
A=A-1 // 844
M=D // 845
@LCL // 846
D=M // 847
@6 // 848
A=D+A // 849
D=A // 850
@R13 // 851
M=D // 852
@SP // 853
AM=M-1 // 854
D=M // 855
@R13 // 856
A=M // 857
M=D // 858

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

@LCL // 859
D=M // 860
@5 // 861
A=D+A // 862
D=M // 863
@SP // 864
AM=M+1 // 865
A=A-1 // 866
M=D // 867
@LCL // 868
A=M+1 // 869
D=M // 870
@SP // 871
AM=M-1 // 872
D=D+M // 873
@SP // 874
AM=M+1 // 875
A=A-1 // 876
M=D // 877
@LCL // 878
D=M // 879
@7 // 880
A=D+A // 881
D=A // 882
@R13 // 883
M=D // 884
@SP // 885
AM=M-1 // 886
D=M // 887
@R13 // 888
A=M // 889
M=D // 890

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Array.0 // 891
D=M // 892
@Screen.drawRectangle$IF_TRUE3 // 893
D;JNE // 894

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 895
0;JMP // 896

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
@LCL // 897
D=M // 898
@7 // 899
A=D+A // 900
D=M // 901
@16384 // 902
D=D+A // 903
@SP // 904
AM=M+1 // 905
A=A-1 // 906
M=D // 907
@LCL // 908
D=M // 909
@7 // 910
A=D+A // 911
D=M // 912
@16384 // 913
A=D+A // 914
D=M // 915
@SP // 916
AM=M+1 // 917
A=A-1 // 918
M=D // 919
@LCL // 920
D=M // 921
@6 // 922
A=D+A // 923
D=M // 924
@SP // 925
AM=M-1 // 926
D=D|M // 927
@SP // 928
AM=M-1 // 929
A=M // 930
M=D // 931

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 932
0;JMP // 933

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
@LCL // 934
D=M // 935
@7 // 936
A=D+A // 937
D=M // 938
@16384 // 939
D=D+A // 940
@SP // 941
AM=M+1 // 942
A=A-1 // 943
M=D // 944
@LCL // 945
D=M // 946
@7 // 947
A=D+A // 948
D=M // 949
@16384 // 950
A=D+A // 951
D=M // 952
@SP // 953
AM=M+1 // 954
A=A-1 // 955
M=D // 956
@LCL // 957
D=M // 958
@6 // 959
A=D+A // 960
D=!M // 961
@SP // 962
AM=M-1 // 963
D=D&M // 964
@SP // 965
AM=M-1 // 966
A=M // 967
M=D // 968

////LabelInstruction{label='Screen.drawRectangle$IF_END3}
// label Screen.drawRectangle$IF_END3
(Screen.drawRectangle$IF_END3)

////GotoInstruction{label='Screen.drawRectangle$IF_END2}
// goto Screen.drawRectangle$IF_END2
@Screen.drawRectangle$IF_END2 // 969
0;JMP // 970

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

@LCL // 971
A=M+1 // 972
A=A+1 // 973
A=A+1 // 974
D=M // 975
@SP // 976
AM=M+1 // 977
A=A-1 // 978
M=D // 979
// call Math.twoToThe
@6 // 980
D=A // 981
@14 // 982
M=D // 983
@Math.twoToThe // 984
D=A // 985
@13 // 986
M=D // 987
@Screen.drawRectangle.ret.5 // 988
D=A // 989
@CALL // 990
0;JMP // 991
(Screen.drawRectangle.ret.5)
@SP // 992
AM=M-1 // 993
D=M // 994
D=D-1 // 995
@SP // 996
AM=M+1 // 997
A=A-1 // 998
M=D // 999
@SP // 1000
A=M-1 // 1001
M=!D // 1002
@LCL // 1003
D=M // 1004
@6 // 1005
A=D+A // 1006
D=A // 1007
@R13 // 1008
M=D // 1009
@SP // 1010
AM=M-1 // 1011
D=M // 1012
@R13 // 1013
A=M // 1014
M=D // 1015

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

@LCL // 1016
D=M // 1017
@5 // 1018
A=D+A // 1019
D=M // 1020
@SP // 1021
AM=M+1 // 1022
A=A-1 // 1023
M=D // 1024
@LCL // 1025
A=M+1 // 1026
D=M // 1027
@SP // 1028
AM=M-1 // 1029
D=D+M // 1030
@SP // 1031
AM=M+1 // 1032
A=A-1 // 1033
M=D // 1034
@LCL // 1035
D=M // 1036
@7 // 1037
A=D+A // 1038
D=A // 1039
@R13 // 1040
M=D // 1041
@SP // 1042
AM=M-1 // 1043
D=M // 1044
@R13 // 1045
A=M // 1046
M=D // 1047

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE4}}
@Array.0 // 1048
D=M // 1049
@Screen.drawRectangle$IF_TRUE4 // 1050
D;JNE // 1051

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE4}
// goto Screen.drawRectangle$IF_FALSE4
@Screen.drawRectangle$IF_FALSE4 // 1052
0;JMP // 1053

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
@LCL // 1054
D=M // 1055
@7 // 1056
A=D+A // 1057
D=M // 1058
@16384 // 1059
D=D+A // 1060
@SP // 1061
AM=M+1 // 1062
A=A-1 // 1063
M=D // 1064
@LCL // 1065
D=M // 1066
@7 // 1067
A=D+A // 1068
D=M // 1069
@16384 // 1070
A=D+A // 1071
D=M // 1072
@SP // 1073
AM=M+1 // 1074
A=A-1 // 1075
M=D // 1076
@LCL // 1077
D=M // 1078
@6 // 1079
A=D+A // 1080
D=M // 1081
@SP // 1082
AM=M-1 // 1083
D=D|M // 1084
@SP // 1085
AM=M-1 // 1086
A=M // 1087
M=D // 1088

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 1089
0;JMP // 1090

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
@LCL // 1091
D=M // 1092
@7 // 1093
A=D+A // 1094
D=M // 1095
@16384 // 1096
D=D+A // 1097
@SP // 1098
AM=M+1 // 1099
A=A-1 // 1100
M=D // 1101
@LCL // 1102
D=M // 1103
@7 // 1104
A=D+A // 1105
D=M // 1106
@16384 // 1107
A=D+A // 1108
D=M // 1109
@SP // 1110
AM=M+1 // 1111
A=A-1 // 1112
M=D // 1113
@LCL // 1114
D=M // 1115
@6 // 1116
A=D+A // 1117
D=!M // 1118
@SP // 1119
AM=M-1 // 1120
D=D&M // 1121
@SP // 1122
AM=M-1 // 1123
A=M // 1124
M=D // 1125

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

@LCL // 1126
A=M+1 // 1127
D=M // 1128
@SP // 1129
AM=M+1 // 1130
A=A-1 // 1131
M=D+1 // 1132
@LCL // 1133
D=M // 1134
@8 // 1135
A=D+A // 1136
D=A // 1137
@R13 // 1138
M=D // 1139
@SP // 1140
AM=M-1 // 1141
D=M // 1142
@R13 // 1143
A=M // 1144
M=D // 1145

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
@Screen.drawRectangle.LT.9 // 1146
D=A // 1147
@SP // 1148
AM=M+1 // 1149
A=A-1 // 1150
M=D // 1151
@LCL // 1152
D=M // 1153
@8 // 1154
A=D+A // 1155
D=M // 1156
@SP // 1157
AM=M+1 // 1158
A=A-1 // 1159
M=D // 1160
@LCL // 1161
A=M+1 // 1162
A=A+1 // 1163
D=M // 1164
@SP // 1165
AM=M-1 // 1166
D=M-D // 1167
@DO_LT // 1168
0;JMP // 1169
(Screen.drawRectangle.LT.9)
D=!D // 1170
@Screen.drawRectangle_WHILE_END2 // 1171
D;JNE // 1172

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

@LCL // 1173
D=M // 1174
@8 // 1175
A=D+A // 1176
D=M // 1177
A=A-1 // 1178
A=A-1 // 1179
A=A-1 // 1180
D=D+M // 1181
@SP // 1182
AM=M+1 // 1183
A=A-1 // 1184
M=D // 1185
@LCL // 1186
D=M // 1187
@7 // 1188
A=D+A // 1189
D=A // 1190
@R13 // 1191
M=D // 1192
@SP // 1193
AM=M-1 // 1194
D=M // 1195
@R13 // 1196
A=M // 1197
M=D // 1198

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1199
D=M // 1200
@7 // 1201
A=D+A // 1202
D=M // 1203
@16384 // 1204
D=D+A // 1205
@SP // 1206
AM=M+1 // 1207
A=A-1 // 1208
M=D // 1209
@LCL // 1210
D=M // 1211
@9 // 1212
A=D+A // 1213
D=M // 1214
@SP // 1215
AM=M-1 // 1216
A=M // 1217
M=D // 1218

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

@LCL // 1219
D=M // 1220
@8 // 1221
A=D+A // 1222
M=M+1 // 1223

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 1224
0;JMP // 1225

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

@LCL // 1226
D=M // 1227
@4 // 1228
A=D+A // 1229
D=M // 1230
@SP // 1231
AM=M+1 // 1232
A=A-1 // 1233
M=D+1 // 1234
// call Math.twoToThe
@6 // 1235
D=A // 1236
@14 // 1237
M=D // 1238
@Math.twoToThe // 1239
D=A // 1240
@13 // 1241
M=D // 1242
@Screen.drawRectangle.ret.6 // 1243
D=A // 1244
@CALL // 1245
0;JMP // 1246
(Screen.drawRectangle.ret.6)
@SP // 1247
AM=M-1 // 1248
D=M // 1249
D=D-1 // 1250
@SP // 1251
AM=M+1 // 1252
A=A-1 // 1253
M=D // 1254
@LCL // 1255
D=M // 1256
@6 // 1257
A=D+A // 1258
D=A // 1259
@R13 // 1260
M=D // 1261
@SP // 1262
AM=M-1 // 1263
D=M // 1264
@R13 // 1265
A=M // 1266
M=D // 1267

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

@LCL // 1268
D=M // 1269
@5 // 1270
A=D+A // 1271
D=M // 1272
A=A-1 // 1273
A=A-1 // 1274
A=A-1 // 1275
D=D+M // 1276
@SP // 1277
AM=M+1 // 1278
A=A-1 // 1279
M=D // 1280
@LCL // 1281
D=M // 1282
@7 // 1283
A=D+A // 1284
D=A // 1285
@R13 // 1286
M=D // 1287
@SP // 1288
AM=M-1 // 1289
D=M // 1290
@R13 // 1291
A=M // 1292
M=D // 1293

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Array.0 // 1294
D=M // 1295
@Screen.drawRectangle$IF_TRUE5 // 1296
D;JNE // 1297

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 1298
0;JMP // 1299

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
@LCL // 1300
D=M // 1301
@7 // 1302
A=D+A // 1303
D=M // 1304
@16384 // 1305
D=D+A // 1306
@SP // 1307
AM=M+1 // 1308
A=A-1 // 1309
M=D // 1310
@LCL // 1311
D=M // 1312
@7 // 1313
A=D+A // 1314
D=M // 1315
@16384 // 1316
A=D+A // 1317
D=M // 1318
@SP // 1319
AM=M+1 // 1320
A=A-1 // 1321
M=D // 1322
@LCL // 1323
D=M // 1324
@6 // 1325
A=D+A // 1326
D=M // 1327
@SP // 1328
AM=M-1 // 1329
D=D|M // 1330
@SP // 1331
AM=M-1 // 1332
A=M // 1333
M=D // 1334

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 1335
0;JMP // 1336

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
@LCL // 1337
D=M // 1338
@7 // 1339
A=D+A // 1340
D=M // 1341
@16384 // 1342
D=D+A // 1343
@SP // 1344
AM=M+1 // 1345
A=A-1 // 1346
M=D // 1347
@LCL // 1348
D=M // 1349
@7 // 1350
A=D+A // 1351
D=M // 1352
@16384 // 1353
A=D+A // 1354
D=M // 1355
@SP // 1356
AM=M+1 // 1357
A=A-1 // 1358
M=D // 1359
@LCL // 1360
D=M // 1361
@6 // 1362
A=D+A // 1363
D=!M // 1364
@SP // 1365
AM=M-1 // 1366
D=D&M // 1367
@SP // 1368
AM=M-1 // 1369
A=M // 1370
M=D // 1371

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

@LCL // 1372
A=M // 1373
M=M+1 // 1374

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 1375
0;JMP // 1376

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 1377
AM=M+1 // 1378
A=A-1 // 1379
M=0 // 1380
@RETURN // 1381
0;JMP // 1382

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
@Output.getMap.LT.10 // 1383
D=A // 1384
@SP // 1385
AM=M+1 // 1386
A=A-1 // 1387
M=D // 1388
@ARG // 1389
A=M // 1390
D=M // 1391
@32 // 1392
D=D-A // 1393
@DO_LT // 1394
0;JMP // 1395
(Output.getMap.LT.10)
@SP // 1396
AM=M+1 // 1397
A=A-1 // 1398
M=D // 1399
@Output.getMap.GT.11 // 1400
D=A // 1401
@SP // 1402
AM=M+1 // 1403
A=A-1 // 1404
M=D // 1405
@ARG // 1406
A=M // 1407
D=M // 1408
@126 // 1409
D=D-A // 1410
@DO_GT // 1411
0;JMP // 1412
(Output.getMap.GT.11)
@SP // 1413
AM=M-1 // 1414
D=D|M // 1415
@Output.getMap$IF_TRUE1 // 1416
D;JNE // 1417

////GotoInstruction{label='Output.getMap$IF_FALSE1}
// goto Output.getMap$IF_FALSE1
@Output.getMap$IF_FALSE1 // 1418
0;JMP // 1419

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 1420
A=M // 1421
M=0 // 1422

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
@Array.0 // 1423
D=M // 1424
@SP // 1425
AM=M+1 // 1426
A=A-1 // 1427
M=D // 1428
@ARG // 1429
A=M // 1430
D=M // 1431
@SP // 1432
AM=M-1 // 1433
A=D+M // 1434
D=M // 1435
@SP // 1436
AM=M+1 // 1437
A=A-1 // 1438
M=D // 1439
@RETURN // 1440
0;JMP // 1441

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 1442
M=M+1 // 1443
AM=M+1 // 1444
A=A-1 // 1445
M=0 // 1446
A=A-1 // 1447
M=0 // 1448

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

@ARG // 1449
A=M+1 // 1450
D=M // 1451
@SP // 1452
AM=M+1 // 1453
A=A-1 // 1454
M=D // 1455
@32 // 1456
D=A // 1457
@SP // 1458
AM=M+1 // 1459
A=A-1 // 1460
M=D // 1461
// call Math.multiply
@7 // 1462
D=A // 1463
@14 // 1464
M=D // 1465
@Math.multiply // 1466
D=A // 1467
@13 // 1468
M=D // 1469
@Screen.drawPixel.ret.0 // 1470
D=A // 1471
@CALL // 1472
0;JMP // 1473
(Screen.drawPixel.ret.0)
@ARG // 1474
A=M // 1475
D=M // 1476
@SP // 1477
AM=M+1 // 1478
A=A-1 // 1479
M=D // 1480
@16 // 1481
D=A // 1482
@SP // 1483
AM=M+1 // 1484
A=A-1 // 1485
M=D // 1486
// call Math.divide
@7 // 1487
D=A // 1488
@14 // 1489
M=D // 1490
@Math.divide // 1491
D=A // 1492
@13 // 1493
M=D // 1494
@Screen.drawPixel.ret.1 // 1495
D=A // 1496
@CALL // 1497
0;JMP // 1498
(Screen.drawPixel.ret.1)
@SP // 1499
AM=M-1 // 1500
D=M // 1501
@SP // 1502
AM=M-1 // 1503
D=D+M // 1504
@16384 // 1505
D=D+A // 1506
@LCL // 1507
A=M // 1508
M=D // 1509

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

@ARG // 1510
A=M // 1511
D=M // 1512
@15 // 1513
D=D&A // 1514
@LCL // 1515
A=M+1 // 1516
M=D // 1517

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("static 0"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.drawPixel.EQ.12 // 1518
D=A // 1519
@SP // 1520
AM=M+1 // 1521
A=A-1 // 1522
M=D // 1523
@Array.0 // 1524
D=M // 1525
@DO_EQ // 1526
0;JMP // 1527
(Screen.drawPixel.EQ.12)
D=!D // 1528
@Screen.drawPixel$IF_TRUE1 // 1529
D;JNE // 1530

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 1531
0;JMP // 1532

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
@LCL // 1533
A=M // 1534
D=M // 1535
@SP // 1536
AM=M+1 // 1537
A=A-1 // 1538
M=D // 1539
@LCL // 1540
A=M // 1541
D=M // 1542
@0 // 1543
A=D+A // 1544
D=M // 1545
@SP // 1546
AM=M+1 // 1547
A=A-1 // 1548
M=D // 1549
@LCL // 1550
A=M+1 // 1551
D=M // 1552
@SP // 1553
AM=M+1 // 1554
A=A-1 // 1555
M=D // 1556
// call Math.twoToThe
@6 // 1557
D=A // 1558
@14 // 1559
M=D // 1560
@Math.twoToThe // 1561
D=A // 1562
@13 // 1563
M=D // 1564
@Screen.drawPixel.ret.2 // 1565
D=A // 1566
@CALL // 1567
0;JMP // 1568
(Screen.drawPixel.ret.2)
@SP // 1569
AM=M-1 // 1570
D=M // 1571
@SP // 1572
AM=M-1 // 1573
D=D|M // 1574
@SP // 1575
AM=M-1 // 1576
A=M // 1577
M=D // 1578

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 1579
0;JMP // 1580

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
@LCL // 1581
A=M // 1582
D=M // 1583
@SP // 1584
AM=M+1 // 1585
A=A-1 // 1586
M=D // 1587
@LCL // 1588
A=M // 1589
D=M // 1590
@0 // 1591
A=D+A // 1592
D=M // 1593
@SP // 1594
AM=M+1 // 1595
A=A-1 // 1596
M=D // 1597
@LCL // 1598
A=M+1 // 1599
D=M // 1600
@SP // 1601
AM=M+1 // 1602
A=A-1 // 1603
M=D // 1604
// call Math.twoToThe
@6 // 1605
D=A // 1606
@14 // 1607
M=D // 1608
@Math.twoToThe // 1609
D=A // 1610
@13 // 1611
M=D // 1612
@Screen.drawPixel.ret.3 // 1613
D=A // 1614
@CALL // 1615
0;JMP // 1616
(Screen.drawPixel.ret.3)
@SP // 1617
AM=M-1 // 1618
D=M // 1619
D=!D // 1620
@SP // 1621
AM=M-1 // 1622
D=D&M // 1623
@SP // 1624
AM=M-1 // 1625
A=M // 1626
M=D // 1627

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 1628
AM=M+1 // 1629
A=A-1 // 1630
M=0 // 1631
@RETURN // 1632
0;JMP // 1633

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Array.0 // 1634
M=-1 // 1635

////PushInstruction("constant 0")
@SP // 1636
AM=M+1 // 1637
A=A-1 // 1638
M=0 // 1639
@RETURN // 1640
0;JMP // 1641

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.get_best_fit=0}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1642
D=A // 1643
@SP // 1644
AM=D+M // 1645
A=A-1 // 1646
M=0 // 1647
A=A-1 // 1648
M=0 // 1649
A=A-1 // 1650
M=0 // 1651
A=A-1 // 1652
M=0 // 1653
A=A-1 // 1654
M=0 // 1655

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1656
A=M // 1657
D=M // 1658
@SP // 1659
AM=M+1 // 1660
A=A-1 // 1661
M=D // 1662
// call Memory.getBinIndex
@6 // 1663
D=A // 1664
@14 // 1665
M=D // 1666
@Memory.getBinIndex // 1667
D=A // 1668
@13 // 1669
M=D // 1670
@Memory.alloc.ret.0 // 1671
D=A // 1672
@CALL // 1673
0;JMP // 1674
(Memory.alloc.ret.0)
@SP // 1675
AM=M-1 // 1676
D=M // 1677
@LCL // 1678
A=M // 1679
M=D // 1680

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

@LCL // 1681
A=M // 1682
D=M // 1683
@2048 // 1684
D=D+A // 1685
@LCL // 1686
A=M+1 // 1687
M=D // 1688

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1689
A=M+1 // 1690
D=M // 1691
@SP // 1692
AM=M+1 // 1693
A=A-1 // 1694
M=D // 1695
@ARG // 1696
A=M // 1697
D=M // 1698
@SP // 1699
AM=M+1 // 1700
A=A-1 // 1701
M=D // 1702
// call Memory.get_best_fit
@7 // 1703
D=A // 1704
@14 // 1705
M=D // 1706
@Memory.get_best_fit // 1707
D=A // 1708
@13 // 1709
M=D // 1710
@Memory.alloc.ret.1 // 1711
D=A // 1712
@CALL // 1713
0;JMP // 1714
(Memory.alloc.ret.1)
@SP // 1715
AM=M-1 // 1716
D=M // 1717
@LCL // 1718
A=M+1 // 1719
A=A+1 // 1720
M=D // 1721

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
@Memory.alloc.EQ.13 // 1722
D=A // 1723
@SP // 1724
AM=M+1 // 1725
A=A-1 // 1726
M=D // 1727
@LCL // 1728
A=M+1 // 1729
A=A+1 // 1730
D=M // 1731
@DO_EQ // 1732
0;JMP // 1733
(Memory.alloc.EQ.13)
D=!D // 1734
@Memory.alloc_WHILE_END1 // 1735
D;JNE // 1736

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
@Memory.alloc.LT.14 // 1737
D=A // 1738
@SP // 1739
AM=M+1 // 1740
A=A-1 // 1741
M=D // 1742
@LCL // 1743
A=M // 1744
D=M // 1745
D=D+1 // 1746
@7 // 1747
D=D-A // 1748
@DO_LT // 1749
0;JMP // 1750
(Memory.alloc.LT.14)
D=!D // 1751
@Memory.alloc$IF_TRUE1 // 1752
D;JNE // 1753

////GotoInstruction{label='Memory.alloc$IF_FALSE1}
// goto Memory.alloc$IF_FALSE1
@Memory.alloc$IF_FALSE1 // 1754
0;JMP // 1755

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1756
AM=M+1 // 1757
A=A-1 // 1758
M=0 // 1759
@RETURN // 1760
0;JMP // 1761

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

@LCL // 1762
A=M // 1763
M=M+1 // 1764

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

@LCL // 1765
A=M // 1766
D=M // 1767
@2048 // 1768
D=D+A // 1769
@LCL // 1770
A=M+1 // 1771
M=D // 1772

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1773
A=M+1 // 1774
D=M // 1775
@SP // 1776
AM=M+1 // 1777
A=A-1 // 1778
M=D // 1779
@ARG // 1780
A=M // 1781
D=M // 1782
@SP // 1783
AM=M+1 // 1784
A=A-1 // 1785
M=D // 1786
// call Memory.get_best_fit
@7 // 1787
D=A // 1788
@14 // 1789
M=D // 1790
@Memory.get_best_fit // 1791
D=A // 1792
@13 // 1793
M=D // 1794
@Memory.alloc.ret.2 // 1795
D=A // 1796
@CALL // 1797
0;JMP // 1798
(Memory.alloc.ret.2)
@SP // 1799
AM=M-1 // 1800
D=M // 1801
@LCL // 1802
A=M+1 // 1803
A=A+1 // 1804
M=D // 1805

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 1806
0;JMP // 1807

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

@LCL // 1808
A=M+1 // 1809
A=A+1 // 1810
D=M // 1811
@0 // 1812
A=D+A // 1813
D=M // 1814
@SP // 1815
AM=M+1 // 1816
A=A-1 // 1817
M=D // 1818
// call Memory.getBinIndex
@6 // 1819
D=A // 1820
@14 // 1821
M=D // 1822
@Memory.getBinIndex // 1823
D=A // 1824
@13 // 1825
M=D // 1826
@Memory.alloc.ret.3 // 1827
D=A // 1828
@CALL // 1829
0;JMP // 1830
(Memory.alloc.ret.3)
@SP // 1831
AM=M-1 // 1832
D=M // 1833
@2048 // 1834
D=D+A // 1835
@SP // 1836
AM=M+1 // 1837
A=A-1 // 1838
M=D // 1839
@LCL // 1840
A=M+1 // 1841
A=A+1 // 1842
D=M // 1843
@SP // 1844
AM=M+1 // 1845
A=A-1 // 1846
M=D // 1847
// call Memory.remove_node
@7 // 1848
D=A // 1849
@14 // 1850
M=D // 1851
@Memory.remove_node // 1852
D=A // 1853
@13 // 1854
M=D // 1855
@Memory.alloc.ret.4 // 1856
D=A // 1857
@CALL // 1858
0;JMP // 1859
(Memory.alloc.ret.4)
@SP // 1860
M=M-1 // 1861

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

@LCL // 1862
A=M+1 // 1863
A=A+1 // 1864
D=M // 1865
@0 // 1866
A=D+A // 1867
D=M // 1868
@SP // 1869
AM=M+1 // 1870
A=A-1 // 1871
M=D // 1872
@ARG // 1873
A=M // 1874
D=M // 1875
@SP // 1876
AM=M-1 // 1877
D=M-D // 1878
@LCL // 1879
A=M+1 // 1880
A=A+1 // 1881
A=A+1 // 1882
M=D // 1883

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.15 // 1884
D=A // 1885
@SP // 1886
AM=M+1 // 1887
A=A-1 // 1888
M=D // 1889
@LCL // 1890
A=M+1 // 1891
A=A+1 // 1892
A=A+1 // 1893
D=M // 1894
@5 // 1895
D=D-A // 1896
@DO_GT // 1897
0;JMP // 1898
(Memory.alloc.GT.15)
@Memory.alloc$IF_TRUE2 // 1899
D;JNE // 1900

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 1901
0;JMP // 1902

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
@LCL // 1903
A=M+1 // 1904
A=A+1 // 1905
D=M // 1906
@SP // 1907
AM=M+1 // 1908
A=A-1 // 1909
M=D // 1910
@ARG // 1911
A=M // 1912
D=M // 1913
@SP // 1914
AM=M-1 // 1915
A=M // 1916
M=D // 1917

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1918
A=M+1 // 1919
A=A+1 // 1920
D=M // 1921
@SP // 1922
AM=M+1 // 1923
A=A-1 // 1924
M=D+1 // 1925
D=0 // 1926
@SP // 1927
AM=M-1 // 1928
A=M // 1929
M=D // 1930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1931
A=M+1 // 1932
A=A+1 // 1933
D=M // 1934
@SP // 1935
AM=M+1 // 1936
A=A-1 // 1937
M=D // 1938
// call Memory.create_foot
@6 // 1939
D=A // 1940
@14 // 1941
M=D // 1942
@Memory.create_foot // 1943
D=A // 1944
@13 // 1945
M=D // 1946
@Memory.alloc.ret.5 // 1947
D=A // 1948
@CALL // 1949
0;JMP // 1950
(Memory.alloc.ret.5)
@SP // 1951
M=M-1 // 1952

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

@LCL // 1953
A=M+1 // 1954
A=A+1 // 1955
D=M // 1956
@SP // 1957
AM=M+1 // 1958
A=A-1 // 1959
M=D // 1960
@ARG // 1961
A=M // 1962
D=M // 1963
@SP // 1964
AM=M-1 // 1965
D=D+M // 1966
@5 // 1967
D=D+A // 1968
@SP // 1969
AM=M+1 // 1970
A=A-1 // 1971
M=D // 1972
@LCL // 1973
D=M // 1974
@4 // 1975
A=D+A // 1976
D=A // 1977
@R13 // 1978
M=D // 1979
@SP // 1980
AM=M-1 // 1981
D=M // 1982
@R13 // 1983
A=M // 1984
M=D // 1985

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
@LCL // 1986
D=M // 1987
@4 // 1988
A=D+A // 1989
D=M // 1990
@SP // 1991
AM=M+1 // 1992
A=A-1 // 1993
M=D // 1994
@LCL // 1995
A=M+1 // 1996
A=A+1 // 1997
A=A+1 // 1998
D=M // 1999
@5 // 2000
D=D-A // 2001
@SP // 2002
AM=M-1 // 2003
A=M // 2004
M=D // 2005

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2006
D=M // 2007
@4 // 2008
A=D+A // 2009
D=M // 2010
@SP // 2011
AM=M+1 // 2012
A=A-1 // 2013
M=D+1 // 2014
D=1 // 2015
@SP // 2016
AM=M-1 // 2017
A=M // 2018
M=D // 2019

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2020
D=M // 2021
@4 // 2022
A=D+A // 2023
D=M // 2024
@SP // 2025
AM=M+1 // 2026
A=A-1 // 2027
M=D // 2028
// call Memory.create_foot
@6 // 2029
D=A // 2030
@14 // 2031
M=D // 2032
@Memory.create_foot // 2033
D=A // 2034
@13 // 2035
M=D // 2036
@Memory.alloc.ret.6 // 2037
D=A // 2038
@CALL // 2039
0;JMP // 2040
(Memory.alloc.ret.6)
@SP // 2041
M=M-1 // 2042

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

@LCL // 2043
A=M+1 // 2044
A=A+1 // 2045
A=A+1 // 2046
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
@Memory.alloc.ret.7 // 2060
D=A // 2061
@CALL // 2062
0;JMP // 2063
(Memory.alloc.ret.7)
@SP // 2064
AM=M-1 // 2065
D=M // 2066
@2048 // 2067
D=D+A // 2068
@SP // 2069
AM=M+1 // 2070
A=A-1 // 2071
M=D // 2072
@LCL // 2073
D=M // 2074
@4 // 2075
A=D+A // 2076
D=M // 2077
@SP // 2078
AM=M+1 // 2079
A=A-1 // 2080
M=D // 2081
// call Memory.add_node
@7 // 2082
D=A // 2083
@14 // 2084
M=D // 2085
@Memory.add_node // 2086
D=A // 2087
@13 // 2088
M=D // 2089
@Memory.alloc.ret.8 // 2090
D=A // 2091
@CALL // 2092
0;JMP // 2093
(Memory.alloc.ret.8)
@SP // 2094
M=M-1 // 2095

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 2096
0;JMP // 2097

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
@LCL // 2098
A=M+1 // 2099
A=A+1 // 2100
D=M // 2101
@SP // 2102
AM=M+1 // 2103
A=A-1 // 2104
M=D+1 // 2105
D=0 // 2106
@SP // 2107
AM=M-1 // 2108
A=M // 2109
M=D // 2110

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2111
A=M+1 // 2112
A=A+1 // 2113
D=M // 2114
@SP // 2115
AM=M+1 // 2116
A=A-1 // 2117
M=D // 2118
// call Memory.create_foot
@6 // 2119
D=A // 2120
@14 // 2121
M=D // 2122
@Memory.create_foot // 2123
D=A // 2124
@13 // 2125
M=D // 2126
@Memory.alloc.ret.9 // 2127
D=A // 2128
@CALL // 2129
0;JMP // 2130
(Memory.alloc.ret.9)
@SP // 2131
M=M-1 // 2132

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
@LCL // 2133
A=M+1 // 2134
A=A+1 // 2135
D=M // 2136
@4 // 2137
D=D+A // 2138
@SP // 2139
AM=M+1 // 2140
A=A-1 // 2141
M=D // 2142
@RETURN // 2143
0;JMP // 2144

////FunctionInstruction{functionName='Memory.create_foot', numLocals=0, funcMapping={Memory.alloc=10, Memory.get_best_fit=0}}
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
@ARG // 2145
A=M // 2146
D=M // 2147
@SP // 2148
AM=M+1 // 2149
A=A-1 // 2150
M=D // 2151
@ARG // 2152
A=M // 2153
D=M // 2154
@0 // 2155
A=D+A // 2156
D=M // 2157
@4 // 2158
D=D+A // 2159
@SP // 2160
AM=M-1 // 2161
D=D+M // 2162
@SP // 2163
AM=M+1 // 2164
A=A-1 // 2165
M=D // 2166
@ARG // 2167
A=M // 2168
D=M // 2169
@SP // 2170
AM=M-1 // 2171
A=M // 2172
M=D // 2173

////PushInstruction("constant 0")
@SP // 2174
AM=M+1 // 2175
A=A-1 // 2176
M=0 // 2177
@RETURN // 2178
0;JMP // 2179

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={}}
// function Array.dispose with 0
(Array.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2180
A=M // 2181
D=M // 2182
@3 // 2183
M=D // 2184

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2185
D=M // 2186
@SP // 2187
AM=M+1 // 2188
A=A-1 // 2189
M=D // 2190
// call Memory.deAlloc
@6 // 2191
D=A // 2192
@14 // 2193
M=D // 2194
@Memory.deAlloc // 2195
D=A // 2196
@13 // 2197
M=D // 2198
@Array.dispose.ret.0 // 2199
D=A // 2200
@CALL // 2201
0;JMP // 2202
(Array.dispose.ret.0)
@SP // 2203
M=M-1 // 2204

////PushInstruction("constant 0")
@SP // 2205
AM=M+1 // 2206
A=A-1 // 2207
M=0 // 2208
@RETURN // 2209
0;JMP // 2210

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2211
A=M // 2212
D=M // 2213
@SP // 2214
AM=M+1 // 2215
A=A-1 // 2216
M=D // 2217
@ARG // 2218
A=M // 2219
D=M // 2220
@SP // 2221
AM=M+1 // 2222
A=A-1 // 2223
M=D // 2224
@SP // 2225
A=M-1 // 2226
M=-D // 2227
// call Math.max
@7 // 2228
D=A // 2229
@14 // 2230
M=D // 2231
@Math.max // 2232
D=A // 2233
@13 // 2234
M=D // 2235
@Math.abs.ret.0 // 2236
D=A // 2237
@CALL // 2238
0;JMP // 2239
(Math.abs.ret.0)
@RETURN // 2240
0;JMP // 2241

////FunctionInstruction{functionName='Math.twoToThe', numLocals=0, funcMapping={Math.abs=1}}
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
@Array.0 // 2242
D=M // 2243
@SP // 2244
AM=M+1 // 2245
A=A-1 // 2246
M=D // 2247
@ARG // 2248
A=M // 2249
D=M // 2250
@SP // 2251
AM=M-1 // 2252
A=D+M // 2253
D=M // 2254
@SP // 2255
AM=M+1 // 2256
A=A-1 // 2257
M=D // 2258
@RETURN // 2259
0;JMP // 2260

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={Array.dispose=1}}
// function Array.new with 0
(Array.new)

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
@ARG // 2261
A=M // 2262
D=M // 2263
@SP // 2264
AM=M+1 // 2265
A=A-1 // 2266
M=D // 2267
// call Memory.alloc
@6 // 2268
D=A // 2269
@14 // 2270
M=D // 2271
@Memory.alloc // 2272
D=A // 2273
@13 // 2274
M=D // 2275
@Array.new.ret.0 // 2276
D=A // 2277
@CALL // 2278
0;JMP // 2279
(Array.new.ret.0)
@RETURN // 2280
0;JMP // 2281

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2282
M=M+1 // 2283
AM=M+1 // 2284
A=A-1 // 2285
M=0 // 2286
A=A-1 // 2287
M=0 // 2288

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2289
A=M // 2290
M=0 // 2291

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2292
A=M // 2293
D=M // 2294
@SP // 2295
AM=M+1 // 2296
A=A-1 // 2297
M=D // 2298
// call String.length
@6 // 2299
D=A // 2300
@14 // 2301
M=D // 2302
@String.length // 2303
D=A // 2304
@13 // 2305
M=D // 2306
@Output.printString.ret.0 // 2307
D=A // 2308
@CALL // 2309
0;JMP // 2310
(Output.printString.ret.0)
@SP // 2311
AM=M-1 // 2312
D=M // 2313
@LCL // 2314
A=M+1 // 2315
M=D // 2316

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
@Output.printString.LT.16 // 2317
D=A // 2318
@SP // 2319
AM=M+1 // 2320
A=A-1 // 2321
M=D // 2322
@LCL // 2323
A=M+1 // 2324
D=M // 2325
A=A-1 // 2326
D=M-D // 2327
@DO_LT // 2328
0;JMP // 2329
(Output.printString.LT.16)
D=!D // 2330
@Output.printString_WHILE_END1 // 2331
D;JNE // 2332

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2333
A=M // 2334
D=M // 2335
@SP // 2336
AM=M+1 // 2337
A=A-1 // 2338
M=D // 2339
@LCL // 2340
A=M // 2341
D=M // 2342
@SP // 2343
AM=M+1 // 2344
A=A-1 // 2345
M=D // 2346
// call String.charAt
@7 // 2347
D=A // 2348
@14 // 2349
M=D // 2350
@String.charAt // 2351
D=A // 2352
@13 // 2353
M=D // 2354
@Output.printString.ret.1 // 2355
D=A // 2356
@CALL // 2357
0;JMP // 2358
(Output.printString.ret.1)
// call Output.printChar
@6 // 2359
D=A // 2360
@14 // 2361
M=D // 2362
@Output.printChar // 2363
D=A // 2364
@13 // 2365
M=D // 2366
@Output.printString.ret.2 // 2367
D=A // 2368
@CALL // 2369
0;JMP // 2370
(Output.printString.ret.2)
@SP // 2371
M=M-1 // 2372

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

@LCL // 2373
A=M // 2374
M=M+1 // 2375

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2376
0;JMP // 2377

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2378
AM=M+1 // 2379
A=A-1 // 2380
M=0 // 2381
@RETURN // 2382
0;JMP // 2383

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2384
AM=M+1 // 2385
A=A-1 // 2386
M=0 // 2387

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2388
D=A // 2389
@SP // 2390
AM=M+1 // 2391
A=A-1 // 2392
M=D // 2393
// call Array.new
@6 // 2394
D=A // 2395
@14 // 2396
M=D // 2397
@Array.new // 2398
D=A // 2399
@13 // 2400
M=D // 2401
@Output.create.ret.0 // 2402
D=A // 2403
@CALL // 2404
0;JMP // 2405
(Output.create.ret.0)
@SP // 2406
AM=M-1 // 2407
D=M // 2408
@LCL // 2409
A=M // 2410
M=D // 2411

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Array.0 // 2412
D=M // 2413
@SP // 2414
AM=M+1 // 2415
A=A-1 // 2416
M=D // 2417
@ARG // 2418
A=M // 2419
D=M // 2420
@SP // 2421
AM=M-1 // 2422
D=D+M // 2423
@SP // 2424
AM=M+1 // 2425
A=A-1 // 2426
M=D // 2427
@LCL // 2428
A=M // 2429
D=M // 2430
@SP // 2431
AM=M-1 // 2432
A=M // 2433
M=D // 2434

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2435
A=M // 2436
D=M // 2437
@SP // 2438
AM=M+1 // 2439
A=A-1 // 2440
M=D // 2441
@ARG // 2442
A=M+1 // 2443
D=M // 2444
@SP // 2445
AM=M-1 // 2446
A=M // 2447
M=D // 2448

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2449
A=M // 2450
D=M // 2451
@SP // 2452
AM=M+1 // 2453
A=A-1 // 2454
M=D+1 // 2455
@ARG // 2456
A=M+1 // 2457
A=A+1 // 2458
D=M // 2459
@SP // 2460
AM=M-1 // 2461
A=M // 2462
M=D // 2463

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2464
A=M // 2465
D=M // 2466
@2 // 2467
D=D+A // 2468
@SP // 2469
AM=M+1 // 2470
A=A-1 // 2471
M=D // 2472
@ARG // 2473
A=M+1 // 2474
A=A+1 // 2475
A=A+1 // 2476
D=M // 2477
@SP // 2478
AM=M-1 // 2479
A=M // 2480
M=D // 2481

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2482
A=M // 2483
D=M // 2484
@3 // 2485
D=D+A // 2486
@SP // 2487
AM=M+1 // 2488
A=A-1 // 2489
M=D // 2490
@ARG // 2491
D=M // 2492
@4 // 2493
A=D+A // 2494
D=M // 2495
@SP // 2496
AM=M-1 // 2497
A=M // 2498
M=D // 2499

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2500
A=M // 2501
D=M // 2502
@4 // 2503
D=D+A // 2504
@SP // 2505
AM=M+1 // 2506
A=A-1 // 2507
M=D // 2508
@ARG // 2509
D=M // 2510
@5 // 2511
A=D+A // 2512
D=M // 2513
@SP // 2514
AM=M-1 // 2515
A=M // 2516
M=D // 2517

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2518
A=M // 2519
D=M // 2520
@5 // 2521
D=D+A // 2522
@SP // 2523
AM=M+1 // 2524
A=A-1 // 2525
M=D // 2526
@ARG // 2527
D=M // 2528
@6 // 2529
A=D+A // 2530
D=M // 2531
@SP // 2532
AM=M-1 // 2533
A=M // 2534
M=D // 2535

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2536
A=M // 2537
D=M // 2538
@6 // 2539
D=D+A // 2540
@SP // 2541
AM=M+1 // 2542
A=A-1 // 2543
M=D // 2544
@ARG // 2545
D=M // 2546
@7 // 2547
A=D+A // 2548
D=M // 2549
@SP // 2550
AM=M-1 // 2551
A=M // 2552
M=D // 2553

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2554
A=M // 2555
D=M // 2556
@7 // 2557
D=D+A // 2558
@SP // 2559
AM=M+1 // 2560
A=A-1 // 2561
M=D // 2562
@ARG // 2563
D=M // 2564
@8 // 2565
A=D+A // 2566
D=M // 2567
@SP // 2568
AM=M-1 // 2569
A=M // 2570
M=D // 2571

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2572
A=M // 2573
D=M // 2574
@8 // 2575
D=D+A // 2576
@SP // 2577
AM=M+1 // 2578
A=A-1 // 2579
M=D // 2580
@ARG // 2581
D=M // 2582
@9 // 2583
A=D+A // 2584
D=M // 2585
@SP // 2586
AM=M-1 // 2587
A=M // 2588
M=D // 2589

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2590
A=M // 2591
D=M // 2592
@9 // 2593
D=D+A // 2594
@SP // 2595
AM=M+1 // 2596
A=A-1 // 2597
M=D // 2598
@ARG // 2599
D=M // 2600
@10 // 2601
A=D+A // 2602
D=M // 2603
@SP // 2604
AM=M-1 // 2605
A=M // 2606
M=D // 2607

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2608
A=M // 2609
D=M // 2610
@10 // 2611
D=D+A // 2612
@SP // 2613
AM=M+1 // 2614
A=A-1 // 2615
M=D // 2616
@ARG // 2617
D=M // 2618
@11 // 2619
A=D+A // 2620
D=M // 2621
@SP // 2622
AM=M-1 // 2623
A=M // 2624
M=D // 2625

////PushInstruction("constant 0")
@SP // 2626
AM=M+1 // 2627
A=A-1 // 2628
M=0 // 2629
@RETURN // 2630
0;JMP // 2631

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2632
A=M // 2633
D=M // 2634
@3 // 2635
M=D // 2636

////PushInstruction("this 1")
@THIS // 2637
A=M+1 // 2638
D=M // 2639
@SP // 2640
AM=M+1 // 2641
A=A-1 // 2642
M=D // 2643
@RETURN // 2644
0;JMP // 2645

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2646
D=A // 2647
@SP // 2648
AM=M+1 // 2649
A=A-1 // 2650
M=D // 2651
// call Memory.alloc
@6 // 2652
D=A // 2653
@14 // 2654
M=D // 2655
@Memory.alloc // 2656
D=A // 2657
@13 // 2658
M=D // 2659
@String.new.ret.0 // 2660
D=A // 2661
@CALL // 2662
0;JMP // 2663
(String.new.ret.0)
@SP // 2664
AM=M-1 // 2665
D=M // 2666
@3 // 2667
M=D // 2668

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.17 // 2669
D=A // 2670
@SP // 2671
AM=M+1 // 2672
A=A-1 // 2673
M=D // 2674
@ARG // 2675
A=M // 2676
D=M // 2677
@DO_EQ // 2678
0;JMP // 2679
(String.new.EQ.17)
@String.new$IF_TRUE1 // 2680
D;JNE // 2681

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2682
0;JMP // 2683

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2684
A=M // 2685
M=0 // 2686

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2687
0;JMP // 2688

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2689
A=M // 2690
D=M // 2691
@SP // 2692
AM=M+1 // 2693
A=A-1 // 2694
M=D // 2695
// call Array.new
@6 // 2696
D=A // 2697
@14 // 2698
M=D // 2699
@Array.new // 2700
D=A // 2701
@13 // 2702
M=D // 2703
@String.new.ret.1 // 2704
D=A // 2705
@CALL // 2706
0;JMP // 2707
(String.new.ret.1)
@SP // 2708
AM=M-1 // 2709
D=M // 2710
@THIS // 2711
A=M // 2712
M=D // 2713

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2714
A=M // 2715
D=M // 2716
@THIS // 2717
A=M+1 // 2718
A=A+1 // 2719
M=D // 2720

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2721
A=M+1 // 2722
M=0 // 2723

////PushInstruction("pointer 0")
@3 // 2724
D=M // 2725
@SP // 2726
AM=M+1 // 2727
A=A-1 // 2728
M=D // 2729
@RETURN // 2730
0;JMP // 2731

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2732
D=A // 2733
@SP // 2734
AM=D+M // 2735
A=A-1 // 2736
M=0 // 2737
A=A-1 // 2738
M=0 // 2739
A=A-1 // 2740
M=0 // 2741

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
@Math.multiply.EQ.18 // 2742
D=A // 2743
@SP // 2744
AM=M+1 // 2745
A=A-1 // 2746
M=D // 2747
@ARG // 2748
A=M // 2749
D=M // 2750
@DO_EQ // 2751
0;JMP // 2752
(Math.multiply.EQ.18)
@SP // 2753
AM=M+1 // 2754
A=A-1 // 2755
M=D // 2756
@Math.multiply.EQ.19 // 2757
D=A // 2758
@SP // 2759
AM=M+1 // 2760
A=A-1 // 2761
M=D // 2762
@ARG // 2763
A=M+1 // 2764
D=M // 2765
@DO_EQ // 2766
0;JMP // 2767
(Math.multiply.EQ.19)
@SP // 2768
AM=M-1 // 2769
D=D|M // 2770
@Math.multiply$IF_TRUE1 // 2771
D;JNE // 2772

////GotoInstruction{label='Math.multiply$IF_FALSE1}
// goto Math.multiply$IF_FALSE1
@Math.multiply$IF_FALSE1 // 2773
0;JMP // 2774

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2775
AM=M+1 // 2776
A=A-1 // 2777
M=0 // 2778
@RETURN // 2779
0;JMP // 2780

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
@Math.multiply.EQ.20 // 2781
D=A // 2782
@SP // 2783
AM=M+1 // 2784
A=A-1 // 2785
M=D // 2786
@ARG // 2787
A=M // 2788
D=M // 2789
D=D-1 // 2790
@DO_EQ // 2791
0;JMP // 2792
(Math.multiply.EQ.20)
@Math.multiply$IF_TRUE2 // 2793
D;JNE // 2794

////GotoInstruction{label='Math.multiply$IF_FALSE2}
// goto Math.multiply$IF_FALSE2
@Math.multiply$IF_FALSE2 // 2795
0;JMP // 2796

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2797
A=M+1 // 2798
D=M // 2799
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
@RETURN // 2804
0;JMP // 2805

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
@Math.multiply.EQ.21 // 2806
D=A // 2807
@SP // 2808
AM=M+1 // 2809
A=A-1 // 2810
M=D // 2811
@ARG // 2812
A=M+1 // 2813
D=M // 2814
D=D-1 // 2815
@DO_EQ // 2816
0;JMP // 2817
(Math.multiply.EQ.21)
@Math.multiply$IF_TRUE3 // 2818
D;JNE // 2819

////GotoInstruction{label='Math.multiply$IF_FALSE3}
// goto Math.multiply$IF_FALSE3
@Math.multiply$IF_FALSE3 // 2820
0;JMP // 2821

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2822
A=M // 2823
D=M // 2824
@SP // 2825
AM=M+1 // 2826
A=A-1 // 2827
M=D // 2828
@RETURN // 2829
0;JMP // 2830

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
@Math.multiply.EQ.22 // 2831
D=A // 2832
@SP // 2833
AM=M+1 // 2834
A=A-1 // 2835
M=D // 2836
@ARG // 2837
A=M // 2838
D=M // 2839
@2 // 2840
D=D-A // 2841
@DO_EQ // 2842
0;JMP // 2843
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE4 // 2844
D;JNE // 2845

////GotoInstruction{label='Math.multiply$IF_FALSE4}
// goto Math.multiply$IF_FALSE4
@Math.multiply$IF_FALSE4 // 2846
0;JMP // 2847

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
@ARG // 2848
A=M+1 // 2849
D=M // 2850
D=D+M // 2851
@SP // 2852
AM=M+1 // 2853
A=A-1 // 2854
M=D // 2855
@RETURN // 2856
0;JMP // 2857

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
@Math.multiply.EQ.23 // 2858
D=A // 2859
@SP // 2860
AM=M+1 // 2861
A=A-1 // 2862
M=D // 2863
@ARG // 2864
A=M+1 // 2865
D=M // 2866
@2 // 2867
D=D-A // 2868
@DO_EQ // 2869
0;JMP // 2870
(Math.multiply.EQ.23)
@Math.multiply$IF_TRUE5 // 2871
D;JNE // 2872

////GotoInstruction{label='Math.multiply$IF_FALSE5}
// goto Math.multiply$IF_FALSE5
@Math.multiply$IF_FALSE5 // 2873
0;JMP // 2874

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
@ARG // 2875
A=M // 2876
D=M // 2877
D=D+M // 2878
@SP // 2879
AM=M+1 // 2880
A=A-1 // 2881
M=D // 2882
@RETURN // 2883
0;JMP // 2884

////LabelInstruction{label='Math.multiply$IF_FALSE5}
// label Math.multiply$IF_FALSE5
(Math.multiply$IF_FALSE5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2885
A=M+1 // 2886
A=A+1 // 2887
M=1 // 2888

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2889
A=M+1 // 2890
M=0 // 2891

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2892
A=M // 2893
M=0 // 2894

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
@Math.multiply.LT.24 // 2895
D=A // 2896
@SP // 2897
AM=M+1 // 2898
A=A-1 // 2899
M=D // 2900
@LCL // 2901
A=M+1 // 2902
D=M // 2903
@16 // 2904
D=D-A // 2905
@DO_LT // 2906
0;JMP // 2907
(Math.multiply.LT.24)
D=!D // 2908
@Math.multiply_WHILE_END1 // 2909
D;JNE // 2910

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
@Math.multiply.EQ.25 // 2911
D=A // 2912
@SP // 2913
AM=M+1 // 2914
A=A-1 // 2915
M=D // 2916
@ARG // 2917
A=M+1 // 2918
D=M // 2919
@SP // 2920
AM=M+1 // 2921
A=A-1 // 2922
M=D // 2923
@LCL // 2924
A=M+1 // 2925
A=A+1 // 2926
D=M // 2927
@SP // 2928
AM=M-1 // 2929
D=D&M // 2930
@DO_EQ // 2931
0;JMP // 2932
(Math.multiply.EQ.25)
D=!D // 2933
@Math.multiply$IF_TRUE6 // 2934
D;JNE // 2935

////GotoInstruction{label='Math.multiply$IF_FALSE6}
// goto Math.multiply$IF_FALSE6
@Math.multiply$IF_FALSE6 // 2936
0;JMP // 2937

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

@ARG // 2938
A=M // 2939
D=M // 2940
@LCL // 2941
A=M // 2942
M=D+M // 2943

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

@ARG // 2944
A=M // 2945
D=M // 2946
@ARG // 2947
A=M // 2948
M=D+M // 2949

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

@LCL // 2950
A=M+1 // 2951
M=M+1 // 2952

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

@LCL // 2953
A=M+1 // 2954
A=A+1 // 2955
D=M // 2956
@LCL // 2957
A=M+1 // 2958
A=A+1 // 2959
M=D+M // 2960

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 2961
0;JMP // 2962

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 2963
A=M // 2964
D=M // 2965
@SP // 2966
AM=M+1 // 2967
A=A-1 // 2968
M=D // 2969
@RETURN // 2970
0;JMP // 2971

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2972
AM=M+1 // 2973
A=A-1 // 2974
M=0 // 2975

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2976
A=M // 2977
M=0 // 2978

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
@Memory.getBinIndex.LT.26 // 2979
D=A // 2980
@SP // 2981
AM=M+1 // 2982
A=A-1 // 2983
M=D // 2984
@LCL // 2985
A=M // 2986
D=M // 2987
@7 // 2988
D=D-A // 2989
@DO_LT // 2990
0;JMP // 2991
(Memory.getBinIndex.LT.26)
@SP // 2992
AM=M+1 // 2993
A=A-1 // 2994
M=D // 2995
@Memory.getBinIndex.EQ.27 // 2996
D=A // 2997
@SP // 2998
AM=M+1 // 2999
A=A-1 // 3000
M=D // 3001
@LCL // 3002
A=M // 3003
D=M // 3004
@2048 // 3005
A=D+A // 3006
D=M // 3007
@DO_EQ // 3008
0;JMP // 3009
(Memory.getBinIndex.EQ.27)
D=!D // 3010
@SP // 3011
AM=M-1 // 3012
D=D&M // 3013
D=!D // 3014
@Memory.getBinIndex_WHILE_END1 // 3015
D;JNE // 3016

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
@Memory.getBinIndex.GT.28 // 3017
D=A // 3018
@SP // 3019
AM=M+1 // 3020
A=A-1 // 3021
M=D // 3022
@ARG // 3023
A=M // 3024
D=M // 3025
@SP // 3026
AM=M+1 // 3027
A=A-1 // 3028
M=D // 3029
@LCL // 3030
A=M // 3031
D=M // 3032
@SP // 3033
AM=M+1 // 3034
A=A-1 // 3035
M=D+1 // 3036
@16 // 3037
D=A // 3038
@SP // 3039
AM=M+1 // 3040
A=A-1 // 3041
M=D // 3042
// call Math.multiply
@7 // 3043
D=A // 3044
@14 // 3045
M=D // 3046
@Math.multiply // 3047
D=A // 3048
@13 // 3049
M=D // 3050
@Memory.getBinIndex.ret.0 // 3051
D=A // 3052
@CALL // 3053
0;JMP // 3054
(Memory.getBinIndex.ret.0)
@SP // 3055
AM=M-1 // 3056
D=M // 3057
@SP // 3058
AM=M-1 // 3059
D=M-D // 3060
@DO_GT // 3061
0;JMP // 3062
(Memory.getBinIndex.GT.28)
D=!D // 3063
@Memory.getBinIndex$IF_TRUE1 // 3064
D;JNE // 3065

////GotoInstruction{label='Memory.getBinIndex$IF_FALSE1}
// goto Memory.getBinIndex$IF_FALSE1
@Memory.getBinIndex$IF_FALSE1 // 3066
0;JMP // 3067

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 3068
A=M // 3069
D=M // 3070
@SP // 3071
AM=M+1 // 3072
A=A-1 // 3073
M=D // 3074
@RETURN // 3075
0;JMP // 3076

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

@LCL // 3077
A=M // 3078
M=M+1 // 3079

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 3080
0;JMP // 3081

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
@6 // 3082
D=A // 3083
@SP // 3084
AM=M+1 // 3085
A=A-1 // 3086
M=D // 3087
@7 // 3088
D=A // 3089
@SP // 3090
AM=M+1 // 3091
A=A-1 // 3092
M=D-1 // 3093
@RETURN // 3094
0;JMP // 3095

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3096
A=M // 3097
D=M // 3098
@3 // 3099
M=D // 3100

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
@THIS // 3101
A=M // 3102
D=M // 3103
@SP // 3104
AM=M+1 // 3105
A=A-1 // 3106
M=D // 3107
@ARG // 3108
A=M+1 // 3109
D=M // 3110
@SP // 3111
AM=M-1 // 3112
A=D+M // 3113
D=M // 3114
@SP // 3115
AM=M+1 // 3116
A=A-1 // 3117
M=D // 3118
@RETURN // 3119
0;JMP // 3120

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3121
D=A // 3122
@SP // 3123
AM=D+M // 3124
A=A-1 // 3125
M=0 // 3126
A=A-1 // 3127
M=0 // 3128
A=A-1 // 3129
M=0 // 3130

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

@ARG // 3131
A=M // 3132
D=M // 3133
@4 // 3134
D=D-A // 3135
@LCL // 3136
A=M // 3137
M=D // 3138

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3139
A=M // 3140
D=M // 3141
@SP // 3142
AM=M+1 // 3143
A=A-1 // 3144
M=D+1 // 3145
D=1 // 3146
@SP // 3147
AM=M-1 // 3148
A=M // 3149
M=D // 3150

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

@LCL // 3151
A=M // 3152
D=M // 3153
@2 // 3154
A=D+A // 3155
D=M // 3156
@LCL // 3157
A=M+1 // 3158
M=D // 3159

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

@LCL // 3160
A=M // 3161
D=M // 3162
@3 // 3163
A=D+A // 3164
D=M // 3165
@LCL // 3166
A=M+1 // 3167
A=A+1 // 3168
M=D // 3169

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.29 // 3170
D=A // 3171
@SP // 3172
AM=M+1 // 3173
A=A-1 // 3174
M=D // 3175
@LCL // 3176
A=M+1 // 3177
D=M // 3178
@DO_EQ // 3179
0;JMP // 3180
(Memory.deAlloc.EQ.29)
D=!D // 3181
@Memory.deAlloc$IF_TRUE1 // 3182
D;JNE // 3183

////GotoInstruction{label='Memory.deAlloc$IF_FALSE1}
// goto Memory.deAlloc$IF_FALSE1
@Memory.deAlloc$IF_FALSE1 // 3184
0;JMP // 3185

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
@Memory.deAlloc.EQ.30 // 3186
D=A // 3187
@SP // 3188
AM=M+1 // 3189
A=A-1 // 3190
M=D // 3191
@LCL // 3192
A=M+1 // 3193
D=M // 3194
A=D+1 // 3195
D=M // 3196
D=D-1 // 3197
@DO_EQ // 3198
0;JMP // 3199
(Memory.deAlloc.EQ.30)
@Memory.deAlloc$IF_TRUE2 // 3200
D;JNE // 3201

////GotoInstruction{label='Memory.deAlloc$IF_FALSE2}
// goto Memory.deAlloc$IF_FALSE2
@Memory.deAlloc$IF_FALSE2 // 3202
0;JMP // 3203

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

@LCL // 3204
A=M+1 // 3205
D=M // 3206
@0 // 3207
A=D+A // 3208
D=M // 3209
@SP // 3210
AM=M+1 // 3211
A=A-1 // 3212
M=D // 3213
// call Memory.getBinIndex
@6 // 3214
D=A // 3215
@14 // 3216
M=D // 3217
@Memory.getBinIndex // 3218
D=A // 3219
@13 // 3220
M=D // 3221
@Memory.deAlloc.ret.0 // 3222
D=A // 3223
@CALL // 3224
0;JMP // 3225
(Memory.deAlloc.ret.0)
@SP // 3226
AM=M-1 // 3227
D=M // 3228
@2048 // 3229
D=D+A // 3230
@SP // 3231
AM=M+1 // 3232
A=A-1 // 3233
M=D // 3234
@LCL // 3235
A=M+1 // 3236
D=M // 3237
@SP // 3238
AM=M+1 // 3239
A=A-1 // 3240
M=D // 3241
// call Memory.remove_node
@7 // 3242
D=A // 3243
@14 // 3244
M=D // 3245
@Memory.remove_node // 3246
D=A // 3247
@13 // 3248
M=D // 3249
@Memory.deAlloc.ret.1 // 3250
D=A // 3251
@CALL // 3252
0;JMP // 3253
(Memory.deAlloc.ret.1)
@SP // 3254
M=M-1 // 3255

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
@LCL // 3256
A=M+1 // 3257
D=M // 3258
@SP // 3259
AM=M+1 // 3260
A=A-1 // 3261
M=D // 3262
@LCL // 3263
A=M+1 // 3264
D=M // 3265
@0 // 3266
A=D+A // 3267
D=M // 3268
@SP // 3269
AM=M+1 // 3270
A=A-1 // 3271
M=D // 3272
@LCL // 3273
A=M // 3274
D=M // 3275
@0 // 3276
A=D+A // 3277
D=M // 3278
@SP // 3279
AM=M-1 // 3280
D=D+M // 3281
@5 // 3282
D=D+A // 3283
@SP // 3284
AM=M-1 // 3285
A=M // 3286
M=D // 3287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3288
A=M+1 // 3289
D=M // 3290
@SP // 3291
AM=M+1 // 3292
A=A-1 // 3293
M=D // 3294
// call Memory.create_foot
@6 // 3295
D=A // 3296
@14 // 3297
M=D // 3298
@Memory.create_foot // 3299
D=A // 3300
@13 // 3301
M=D // 3302
@Memory.deAlloc.ret.2 // 3303
D=A // 3304
@CALL // 3305
0;JMP // 3306
(Memory.deAlloc.ret.2)
@SP // 3307
M=M-1 // 3308

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3309
A=M+1 // 3310
D=M // 3311
@LCL // 3312
A=M // 3313
M=D // 3314

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
@Memory.deAlloc.EQ.31 // 3315
D=A // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=D // 3320
@LCL // 3321
A=M+1 // 3322
A=A+1 // 3323
D=M // 3324
@DO_EQ // 3325
0;JMP // 3326
(Memory.deAlloc.EQ.31)
D=!D // 3327
@Memory.deAlloc$IF_TRUE3 // 3328
D;JNE // 3329

////GotoInstruction{label='Memory.deAlloc$IF_FALSE3}
// goto Memory.deAlloc$IF_FALSE3
@Memory.deAlloc$IF_FALSE3 // 3330
0;JMP // 3331

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
@Memory.deAlloc.EQ.32 // 3332
D=A // 3333
@SP // 3334
AM=M+1 // 3335
A=A-1 // 3336
M=D // 3337
@LCL // 3338
A=M+1 // 3339
A=A+1 // 3340
D=M // 3341
A=D+1 // 3342
D=M // 3343
D=D-1 // 3344
@DO_EQ // 3345
0;JMP // 3346
(Memory.deAlloc.EQ.32)
@Memory.deAlloc$IF_TRUE4 // 3347
D;JNE // 3348

////GotoInstruction{label='Memory.deAlloc$IF_FALSE4}
// goto Memory.deAlloc$IF_FALSE4
@Memory.deAlloc$IF_FALSE4 // 3349
0;JMP // 3350

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

@LCL // 3351
A=M+1 // 3352
A=A+1 // 3353
D=M // 3354
@0 // 3355
A=D+A // 3356
D=M // 3357
@SP // 3358
AM=M+1 // 3359
A=A-1 // 3360
M=D // 3361
// call Memory.getBinIndex
@6 // 3362
D=A // 3363
@14 // 3364
M=D // 3365
@Memory.getBinIndex // 3366
D=A // 3367
@13 // 3368
M=D // 3369
@Memory.deAlloc.ret.3 // 3370
D=A // 3371
@CALL // 3372
0;JMP // 3373
(Memory.deAlloc.ret.3)
@SP // 3374
AM=M-1 // 3375
D=M // 3376
@2048 // 3377
D=D+A // 3378
@SP // 3379
AM=M+1 // 3380
A=A-1 // 3381
M=D // 3382
@LCL // 3383
A=M+1 // 3384
A=A+1 // 3385
D=M // 3386
@SP // 3387
AM=M+1 // 3388
A=A-1 // 3389
M=D // 3390
// call Memory.remove_node
@7 // 3391
D=A // 3392
@14 // 3393
M=D // 3394
@Memory.remove_node // 3395
D=A // 3396
@13 // 3397
M=D // 3398
@Memory.deAlloc.ret.4 // 3399
D=A // 3400
@CALL // 3401
0;JMP // 3402
(Memory.deAlloc.ret.4)
@SP // 3403
M=M-1 // 3404

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
@LCL // 3405
A=M // 3406
D=M // 3407
@SP // 3408
AM=M+1 // 3409
A=A-1 // 3410
M=D // 3411
@LCL // 3412
A=M // 3413
D=M // 3414
@0 // 3415
A=D+A // 3416
D=M // 3417
@SP // 3418
AM=M+1 // 3419
A=A-1 // 3420
M=D // 3421
@LCL // 3422
A=M+1 // 3423
A=A+1 // 3424
D=M // 3425
@0 // 3426
A=D+A // 3427
D=M // 3428
@SP // 3429
AM=M-1 // 3430
D=D+M // 3431
@5 // 3432
D=D+A // 3433
@SP // 3434
AM=M-1 // 3435
A=M // 3436
M=D // 3437

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3438
A=M // 3439
D=M // 3440
@SP // 3441
AM=M+1 // 3442
A=A-1 // 3443
M=D // 3444
// call Memory.create_foot
@6 // 3445
D=A // 3446
@14 // 3447
M=D // 3448
@Memory.create_foot // 3449
D=A // 3450
@13 // 3451
M=D // 3452
@Memory.deAlloc.ret.5 // 3453
D=A // 3454
@CALL // 3455
0;JMP // 3456
(Memory.deAlloc.ret.5)
@SP // 3457
M=M-1 // 3458

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

@LCL // 3459
A=M // 3460
D=M // 3461
@0 // 3462
A=D+A // 3463
D=M // 3464
@SP // 3465
AM=M+1 // 3466
A=A-1 // 3467
M=D // 3468
// call Memory.getBinIndex
@6 // 3469
D=A // 3470
@14 // 3471
M=D // 3472
@Memory.getBinIndex // 3473
D=A // 3474
@13 // 3475
M=D // 3476
@Memory.deAlloc.ret.6 // 3477
D=A // 3478
@CALL // 3479
0;JMP // 3480
(Memory.deAlloc.ret.6)
@SP // 3481
AM=M-1 // 3482
D=M // 3483
@2048 // 3484
D=D+A // 3485
@SP // 3486
AM=M+1 // 3487
A=A-1 // 3488
M=D // 3489
@LCL // 3490
A=M // 3491
D=M // 3492
@SP // 3493
AM=M+1 // 3494
A=A-1 // 3495
M=D // 3496
// call Memory.add_node
@7 // 3497
D=A // 3498
@14 // 3499
M=D // 3500
@Memory.add_node // 3501
D=A // 3502
@13 // 3503
M=D // 3504
@Memory.deAlloc.ret.7 // 3505
D=A // 3506
@CALL // 3507
0;JMP // 3508
(Memory.deAlloc.ret.7)
@SP // 3509
M=M-1 // 3510

////PushInstruction("constant 0")
@SP // 3511
AM=M+1 // 3512
A=A-1 // 3513
M=0 // 3514
@RETURN // 3515
0;JMP // 3516

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3517
AM=M+1 // 3518
A=A-1 // 3519
M=0 // 3520

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3521
A=M // 3522
M=0 // 3523

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
@Memory.copy.LT.33 // 3524
D=A // 3525
@SP // 3526
AM=M+1 // 3527
A=A-1 // 3528
M=D // 3529
@LCL // 3530
A=M // 3531
D=M // 3532
@SP // 3533
AM=M+1 // 3534
A=A-1 // 3535
M=D // 3536
@ARG // 3537
A=M+1 // 3538
A=A+1 // 3539
D=M // 3540
@SP // 3541
AM=M-1 // 3542
D=M-D // 3543
@DO_LT // 3544
0;JMP // 3545
(Memory.copy.LT.33)
D=!D // 3546
@Memory.copy_WHILE_END1 // 3547
D;JNE // 3548

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
@ARG // 3549
A=M+1 // 3550
D=M // 3551
@SP // 3552
AM=M+1 // 3553
A=A-1 // 3554
M=D // 3555
@LCL // 3556
A=M // 3557
D=M // 3558
@SP // 3559
AM=M-1 // 3560
D=D+M // 3561
@SP // 3562
AM=M+1 // 3563
A=A-1 // 3564
M=D // 3565
@ARG // 3566
A=M // 3567
D=M // 3568
@SP // 3569
AM=M+1 // 3570
A=A-1 // 3571
M=D // 3572
@LCL // 3573
A=M // 3574
D=M // 3575
@SP // 3576
AM=M-1 // 3577
A=D+M // 3578
D=M // 3579
@SP // 3580
AM=M-1 // 3581
A=M // 3582
M=D // 3583

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

@LCL // 3584
A=M // 3585
M=M+1 // 3586

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3587
0;JMP // 3588

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3589
AM=M+1 // 3590
A=A-1 // 3591
M=0 // 3592
@RETURN // 3593
0;JMP // 3594

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3595
D=A // 3596
@SP // 3597
AM=D+M // 3598
A=A-1 // 3599
M=0 // 3600
A=A-1 // 3601
M=0 // 3602
A=A-1 // 3603
M=0 // 3604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3605
A=M // 3606
D=M // 3607
@SP // 3608
AM=M+1 // 3609
A=A-1 // 3610
M=D // 3611
// call Math.abs
@6 // 3612
D=A // 3613
@14 // 3614
M=D // 3615
@Math.abs // 3616
D=A // 3617
@13 // 3618
M=D // 3619
@Math.divide.ret.0 // 3620
D=A // 3621
@CALL // 3622
0;JMP // 3623
(Math.divide.ret.0)
@SP // 3624
AM=M-1 // 3625
D=M // 3626
@LCL // 3627
A=M+1 // 3628
M=D // 3629

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3630
A=M+1 // 3631
D=M // 3632
@SP // 3633
AM=M+1 // 3634
A=A-1 // 3635
M=D // 3636
// call Math.abs
@6 // 3637
D=A // 3638
@14 // 3639
M=D // 3640
@Math.abs // 3641
D=A // 3642
@13 // 3643
M=D // 3644
@Math.divide.ret.1 // 3645
D=A // 3646
@CALL // 3647
0;JMP // 3648
(Math.divide.ret.1)
@SP // 3649
AM=M-1 // 3650
D=M // 3651
@LCL // 3652
A=M+1 // 3653
A=A+1 // 3654
M=D // 3655

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.34 // 3656
D=A // 3657
@SP // 3658
AM=M+1 // 3659
A=A-1 // 3660
M=D // 3661
@LCL // 3662
A=M+1 // 3663
A=A+1 // 3664
D=M // 3665
A=A-1 // 3666
D=D-M // 3667
@DO_GT // 3668
0;JMP // 3669
(Math.divide.GT.34)
@Math.divide$IF_TRUE1 // 3670
D;JNE // 3671

////GotoInstruction{label='Math.divide$IF_FALSE1}
// goto Math.divide$IF_FALSE1
@Math.divide$IF_FALSE1 // 3672
0;JMP // 3673

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3674
AM=M+1 // 3675
A=A-1 // 3676
M=0 // 3677
@RETURN // 3678
0;JMP // 3679

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

@LCL // 3680
A=M+1 // 3681
D=M // 3682
@SP // 3683
AM=M+1 // 3684
A=A-1 // 3685
M=D // 3686
@LCL // 3687
A=M+1 // 3688
A=A+1 // 3689
D=M // 3690
D=D+M // 3691
@SP // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=D // 3695
// call Math.divide
@7 // 3696
D=A // 3697
@14 // 3698
M=D // 3699
@Math.divide // 3700
D=A // 3701
@13 // 3702
M=D // 3703
@Math.divide.ret.2 // 3704
D=A // 3705
@CALL // 3706
0;JMP // 3707
(Math.divide.ret.2)
@SP // 3708
AM=M-1 // 3709
D=M // 3710
@LCL // 3711
A=M // 3712
M=D // 3713

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
@Math.divide.LT.35 // 3714
D=A // 3715
@SP // 3716
AM=M+1 // 3717
A=A-1 // 3718
M=D // 3719
@LCL // 3720
A=M+1 // 3721
D=M // 3722
@SP // 3723
AM=M+1 // 3724
A=A-1 // 3725
M=D // 3726
@LCL // 3727
A=M // 3728
D=M // 3729
D=D+M // 3730
@SP // 3731
AM=M+1 // 3732
A=A-1 // 3733
M=D // 3734
@LCL // 3735
A=M+1 // 3736
A=A+1 // 3737
D=M // 3738
@SP // 3739
AM=M+1 // 3740
A=A-1 // 3741
M=D // 3742
// call Math.multiply
@7 // 3743
D=A // 3744
@14 // 3745
M=D // 3746
@Math.multiply // 3747
D=A // 3748
@13 // 3749
M=D // 3750
@Math.divide.ret.3 // 3751
D=A // 3752
@CALL // 3753
0;JMP // 3754
(Math.divide.ret.3)
@SP // 3755
AM=M-1 // 3756
D=M // 3757
@SP // 3758
AM=M-1 // 3759
D=M-D // 3760
@SP // 3761
AM=M+1 // 3762
A=A-1 // 3763
M=D // 3764
@LCL // 3765
A=M+1 // 3766
A=A+1 // 3767
D=M // 3768
@SP // 3769
AM=M-1 // 3770
D=M-D // 3771
@DO_LT // 3772
0;JMP // 3773
(Math.divide.LT.35)
@Math.divide$IF_TRUE2 // 3774
D;JNE // 3775

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3776
0;JMP // 3777

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
@Math.divide.LT.36 // 3778
D=A // 3779
@SP // 3780
AM=M+1 // 3781
A=A-1 // 3782
M=D // 3783
@ARG // 3784
A=M // 3785
D=M // 3786
@DO_LT // 3787
0;JMP // 3788
(Math.divide.LT.36)
@SP // 3789
AM=M+1 // 3790
A=A-1 // 3791
M=D // 3792
@Math.divide.GT.37 // 3793
D=A // 3794
@SP // 3795
AM=M+1 // 3796
A=A-1 // 3797
M=D // 3798
@ARG // 3799
A=M+1 // 3800
D=M // 3801
@DO_GT // 3802
0;JMP // 3803
(Math.divide.GT.37)
@SP // 3804
AM=M-1 // 3805
D=D&M // 3806
@SP // 3807
AM=M+1 // 3808
A=A-1 // 3809
M=D // 3810
@Math.divide.GT.38 // 3811
D=A // 3812
@SP // 3813
AM=M+1 // 3814
A=A-1 // 3815
M=D // 3816
@ARG // 3817
A=M // 3818
D=M // 3819
@DO_GT // 3820
0;JMP // 3821
(Math.divide.GT.38)
@SP // 3822
AM=M+1 // 3823
A=A-1 // 3824
M=D // 3825
@Math.divide.LT.39 // 3826
D=A // 3827
@SP // 3828
AM=M+1 // 3829
A=A-1 // 3830
M=D // 3831
@ARG // 3832
A=M+1 // 3833
D=M // 3834
@DO_LT // 3835
0;JMP // 3836
(Math.divide.LT.39)
@SP // 3837
AM=M-1 // 3838
D=D&M // 3839
@SP // 3840
AM=M-1 // 3841
D=D|M // 3842
@Math.divide$IF_TRUE3 // 3843
D;JNE // 3844

////GotoInstruction{label='Math.divide$IF_FALSE3}
// goto Math.divide$IF_FALSE3
@Math.divide$IF_FALSE3 // 3845
0;JMP // 3846

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3847
A=M // 3848
D=-M // 3849
@LCL // 3850
A=M // 3851
M=D // 3852

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
@LCL // 3853
A=M // 3854
D=M // 3855
D=D+M // 3856
@SP // 3857
AM=M+1 // 3858
A=A-1 // 3859
M=D // 3860
@RETURN // 3861
0;JMP // 3862

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3863
0;JMP // 3864

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
@Math.divide.LT.40 // 3865
D=A // 3866
@SP // 3867
AM=M+1 // 3868
A=A-1 // 3869
M=D // 3870
@ARG // 3871
A=M // 3872
D=M // 3873
@DO_LT // 3874
0;JMP // 3875
(Math.divide.LT.40)
@SP // 3876
AM=M+1 // 3877
A=A-1 // 3878
M=D // 3879
@Math.divide.GT.41 // 3880
D=A // 3881
@SP // 3882
AM=M+1 // 3883
A=A-1 // 3884
M=D // 3885
@ARG // 3886
A=M+1 // 3887
D=M // 3888
@DO_GT // 3889
0;JMP // 3890
(Math.divide.GT.41)
@SP // 3891
AM=M-1 // 3892
D=D&M // 3893
@SP // 3894
AM=M+1 // 3895
A=A-1 // 3896
M=D // 3897
@Math.divide.GT.42 // 3898
D=A // 3899
@SP // 3900
AM=M+1 // 3901
A=A-1 // 3902
M=D // 3903
@ARG // 3904
A=M // 3905
D=M // 3906
@DO_GT // 3907
0;JMP // 3908
(Math.divide.GT.42)
@SP // 3909
AM=M+1 // 3910
A=A-1 // 3911
M=D // 3912
@Math.divide.LT.43 // 3913
D=A // 3914
@SP // 3915
AM=M+1 // 3916
A=A-1 // 3917
M=D // 3918
@ARG // 3919
A=M+1 // 3920
D=M // 3921
@DO_LT // 3922
0;JMP // 3923
(Math.divide.LT.43)
@SP // 3924
AM=M-1 // 3925
D=D&M // 3926
@SP // 3927
AM=M-1 // 3928
D=D|M // 3929
@Math.divide$IF_TRUE4 // 3930
D;JNE // 3931

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 3932
0;JMP // 3933

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3934
A=M // 3935
D=-M // 3936
@LCL // 3937
A=M // 3938
M=D // 3939

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
@LCL // 3940
A=M // 3941
D=M // 3942
D=D+M // 3943
D=D+1 // 3944
@SP // 3945
AM=M+1 // 3946
A=A-1 // 3947
M=D // 3948
@RETURN // 3949
0;JMP // 3950

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3951
D=A // 3952
@SP // 3953
AM=D+M // 3954
A=A-1 // 3955
M=0 // 3956
A=A-1 // 3957
M=0 // 3958
A=A-1 // 3959
M=0 // 3960
A=A-1 // 3961
M=0 // 3962
A=A-1 // 3963
M=0 // 3964
A=A-1 // 3965
M=0 // 3966

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

@ARG // 3967
A=M+1 // 3968
A=A+1 // 3969
D=M // 3970
A=A-1 // 3971
A=A-1 // 3972
D=D-M // 3973
@SP // 3974
AM=M+1 // 3975
A=A-1 // 3976
M=D // 3977
// call Math.abs
@6 // 3978
D=A // 3979
@14 // 3980
M=D // 3981
@Math.abs // 3982
D=A // 3983
@13 // 3984
M=D // 3985
@Screen.drawLine.ret.0 // 3986
D=A // 3987
@CALL // 3988
0;JMP // 3989
(Screen.drawLine.ret.0)
@SP // 3990
AM=M-1 // 3991
D=M // 3992
@LCL // 3993
A=M // 3994
M=D // 3995

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

@ARG // 3996
A=M+1 // 3997
A=A+1 // 3998
A=A+1 // 3999
D=M // 4000
A=A-1 // 4001
A=A-1 // 4002
D=D-M // 4003
@SP // 4004
AM=M+1 // 4005
A=A-1 // 4006
M=D // 4007
// call Math.abs
@6 // 4008
D=A // 4009
@14 // 4010
M=D // 4011
@Math.abs // 4012
D=A // 4013
@13 // 4014
M=D // 4015
@Screen.drawLine.ret.1 // 4016
D=A // 4017
@CALL // 4018
0;JMP // 4019
(Screen.drawLine.ret.1)
@SP // 4020
AM=M-1 // 4021
D=M // 4022
@LCL // 4023
A=M+1 // 4024
M=D // 4025

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.44 // 4026
D=A // 4027
@SP // 4028
AM=M+1 // 4029
A=A-1 // 4030
M=D // 4031
@ARG // 4032
A=M+1 // 4033
A=A+1 // 4034
D=M // 4035
A=A-1 // 4036
A=A-1 // 4037
D=M-D // 4038
@DO_LT // 4039
0;JMP // 4040
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE1 // 4041
D;JNE // 4042

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 4043
0;JMP // 4044

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4045
A=M+1 // 4046
A=A+1 // 4047
M=1 // 4048

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 4049
0;JMP // 4050

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4051
A=M+1 // 4052
A=A+1 // 4053
M=-1 // 4054

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
@Screen.drawLine.LT.45 // 4055
D=A // 4056
@SP // 4057
AM=M+1 // 4058
A=A-1 // 4059
M=D // 4060
@ARG // 4061
A=M+1 // 4062
A=A+1 // 4063
A=A+1 // 4064
D=M // 4065
A=A-1 // 4066
A=A-1 // 4067
D=M-D // 4068
@DO_LT // 4069
0;JMP // 4070
(Screen.drawLine.LT.45)
@Screen.drawLine$IF_TRUE2 // 4071
D;JNE // 4072

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 4073
0;JMP // 4074

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4075
A=M+1 // 4076
A=A+1 // 4077
A=A+1 // 4078
M=1 // 4079

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 4080
0;JMP // 4081

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4082
A=M+1 // 4083
A=A+1 // 4084
A=A+1 // 4085
M=-1 // 4086

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

@LCL // 4087
A=M+1 // 4088
D=M // 4089
A=A-1 // 4090
D=M-D // 4091
@SP // 4092
AM=M+1 // 4093
A=A-1 // 4094
M=D // 4095
@LCL // 4096
D=M // 4097
@4 // 4098
A=D+A // 4099
D=A // 4100
@R13 // 4101
M=D // 4102
@SP // 4103
AM=M-1 // 4104
D=M // 4105
@R13 // 4106
A=M // 4107
M=D // 4108

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 4109
@Screen.drawLine_WHILE_END1 // 4110
D;JNE // 4111

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4112
A=M // 4113
D=M // 4114
@SP // 4115
AM=M+1 // 4116
A=A-1 // 4117
M=D // 4118
@ARG // 4119
A=M+1 // 4120
D=M // 4121
@SP // 4122
AM=M+1 // 4123
A=A-1 // 4124
M=D // 4125
// call Screen.drawPixel
@7 // 4126
D=A // 4127
@14 // 4128
M=D // 4129
@Screen.drawPixel // 4130
D=A // 4131
@13 // 4132
M=D // 4133
@Screen.drawLine.ret.2 // 4134
D=A // 4135
@CALL // 4136
0;JMP // 4137
(Screen.drawLine.ret.2)
@SP // 4138
M=M-1 // 4139

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
@Screen.drawLine.EQ.46 // 4140
D=A // 4141
@SP // 4142
AM=M+1 // 4143
A=A-1 // 4144
M=D // 4145
@ARG // 4146
A=M+1 // 4147
A=A+1 // 4148
D=M // 4149
A=A-1 // 4150
A=A-1 // 4151
D=M-D // 4152
@DO_EQ // 4153
0;JMP // 4154
(Screen.drawLine.EQ.46)
@SP // 4155
AM=M+1 // 4156
A=A-1 // 4157
M=D // 4158
@Screen.drawLine.EQ.47 // 4159
D=A // 4160
@SP // 4161
AM=M+1 // 4162
A=A-1 // 4163
M=D // 4164
@ARG // 4165
A=M+1 // 4166
A=A+1 // 4167
A=A+1 // 4168
D=M // 4169
A=A-1 // 4170
A=A-1 // 4171
D=M-D // 4172
@DO_EQ // 4173
0;JMP // 4174
(Screen.drawLine.EQ.47)
@SP // 4175
AM=M-1 // 4176
D=D&M // 4177
@Screen.drawLine$IF_TRUE3 // 4178
D;JNE // 4179

////GotoInstruction{label='Screen.drawLine$IF_FALSE3}
// goto Screen.drawLine$IF_FALSE3
@Screen.drawLine$IF_FALSE3 // 4180
0;JMP // 4181

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4182
AM=M+1 // 4183
A=A-1 // 4184
M=0 // 4185
@RETURN // 4186
0;JMP // 4187

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

@LCL // 4188
D=M // 4189
@4 // 4190
A=D+A // 4191
D=M // 4192
D=D+M // 4193
@SP // 4194
AM=M+1 // 4195
A=A-1 // 4196
M=D // 4197
@LCL // 4198
D=M // 4199
@5 // 4200
A=D+A // 4201
D=A // 4202
@R13 // 4203
M=D // 4204
@SP // 4205
AM=M-1 // 4206
D=M // 4207
@R13 // 4208
A=M // 4209
M=D // 4210

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
@Screen.drawLine.GT.48 // 4211
D=A // 4212
@SP // 4213
AM=M+1 // 4214
A=A-1 // 4215
M=D // 4216
@LCL // 4217
D=M // 4218
@5 // 4219
A=D+A // 4220
D=M // 4221
@SP // 4222
AM=M+1 // 4223
A=A-1 // 4224
M=D // 4225
@LCL // 4226
A=M+1 // 4227
D=M // 4228
@SP // 4229
AM=M-1 // 4230
D=D+M // 4231
@DO_GT // 4232
0;JMP // 4233
(Screen.drawLine.GT.48)
@Screen.drawLine$IF_TRUE4 // 4234
D;JNE // 4235

////GotoInstruction{label='Screen.drawLine$IF_FALSE4}
// goto Screen.drawLine$IF_FALSE4
@Screen.drawLine$IF_FALSE4 // 4236
0;JMP // 4237

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

@LCL // 4238
D=M // 4239
@4 // 4240
A=D+A // 4241
D=M // 4242
A=A-1 // 4243
A=A-1 // 4244
A=A-1 // 4245
D=D-M // 4246
@SP // 4247
AM=M+1 // 4248
A=A-1 // 4249
M=D // 4250
@LCL // 4251
D=M // 4252
@4 // 4253
A=D+A // 4254
D=A // 4255
@R13 // 4256
M=D // 4257
@SP // 4258
AM=M-1 // 4259
D=M // 4260
@R13 // 4261
A=M // 4262
M=D // 4263

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

@LCL // 4264
A=M+1 // 4265
A=A+1 // 4266
D=M // 4267
@ARG // 4268
A=M // 4269
M=D+M // 4270

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
@Screen.drawLine.LT.49 // 4271
D=A // 4272
@SP // 4273
AM=M+1 // 4274
A=A-1 // 4275
M=D // 4276
@LCL // 4277
D=M // 4278
@5 // 4279
A=D+A // 4280
D=M // 4281
@SP // 4282
AM=M+1 // 4283
A=A-1 // 4284
M=D // 4285
@LCL // 4286
A=M // 4287
D=M // 4288
@SP // 4289
AM=M-1 // 4290
D=M-D // 4291
@DO_LT // 4292
0;JMP // 4293
(Screen.drawLine.LT.49)
@Screen.drawLine$IF_TRUE5 // 4294
D;JNE // 4295

////GotoInstruction{label='Screen.drawLine$IF_FALSE5}
// goto Screen.drawLine$IF_FALSE5
@Screen.drawLine$IF_FALSE5 // 4296
0;JMP // 4297

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

@LCL // 4298
D=M // 4299
@4 // 4300
A=D+A // 4301
D=M // 4302
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=D // 4306
@LCL // 4307
A=M // 4308
D=M // 4309
@SP // 4310
AM=M-1 // 4311
D=D+M // 4312
@SP // 4313
AM=M+1 // 4314
A=A-1 // 4315
M=D // 4316
@LCL // 4317
D=M // 4318
@4 // 4319
A=D+A // 4320
D=A // 4321
@R13 // 4322
M=D // 4323
@SP // 4324
AM=M-1 // 4325
D=M // 4326
@R13 // 4327
A=M // 4328
M=D // 4329

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

@LCL // 4330
A=M+1 // 4331
A=A+1 // 4332
A=A+1 // 4333
D=M // 4334
@ARG // 4335
A=M+1 // 4336
M=D+M // 4337

////LabelInstruction{label='Screen.drawLine$IF_FALSE5}
// label Screen.drawLine$IF_FALSE5
(Screen.drawLine$IF_FALSE5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4338
0;JMP // 4339

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4340
AM=M+1 // 4341
A=A-1 // 4342
M=0 // 4343
@RETURN // 4344
0;JMP // 4345

////FunctionInstruction{functionName='Math.max', numLocals=0, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.max with 0
(Math.max)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.max$IF_TRUE1}}
@Math.max.GT.50 // 4346
D=A // 4347
@SP // 4348
AM=M+1 // 4349
A=A-1 // 4350
M=D // 4351
@ARG // 4352
A=M+1 // 4353
D=M // 4354
A=A-1 // 4355
D=M-D // 4356
@DO_GT // 4357
0;JMP // 4358
(Math.max.GT.50)
@Math.max$IF_TRUE1 // 4359
D;JNE // 4360

////GotoInstruction{label='Math.max$IF_FALSE1}
// goto Math.max$IF_FALSE1
@Math.max$IF_FALSE1 // 4361
0;JMP // 4362

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4363
A=M // 4364
D=M // 4365
@SP // 4366
AM=M+1 // 4367
A=A-1 // 4368
M=D // 4369
@RETURN // 4370
0;JMP // 4371

////LabelInstruction{label='Math.max$IF_FALSE1}
// label Math.max$IF_FALSE1
(Math.max$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 4372
A=M+1 // 4373
D=M // 4374
@SP // 4375
AM=M+1 // 4376
A=A-1 // 4377
M=D // 4378
@RETURN // 4379
0;JMP // 4380

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4381
AM=M+1 // 4382
A=A-1 // 4383
M=0 // 4384

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4385
AM=M+1 // 4386
A=A-1 // 4387
M=0 // 4388
@220 // 4389
D=A // 4390
@SP // 4391
AM=M+1 // 4392
A=A-1 // 4393
M=D // 4394
@511 // 4395
D=A // 4396
@SP // 4397
AM=M+1 // 4398
A=A-1 // 4399
M=D // 4400
@220 // 4401
D=A // 4402
@SP // 4403
AM=M+1 // 4404
A=A-1 // 4405
M=D // 4406
// call Screen.drawLine
@9 // 4407
D=A // 4408
@14 // 4409
M=D // 4410
@Screen.drawLine // 4411
D=A // 4412
@13 // 4413
M=D // 4414
@Main.main.ret.0 // 4415
D=A // 4416
@CALL // 4417
0;JMP // 4418
(Main.main.ret.0)
@SP // 4419
M=M-1 // 4420

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4421
D=A // 4422
@SP // 4423
AM=M+1 // 4424
A=A-1 // 4425
M=D // 4426
@90 // 4427
D=A // 4428
@SP // 4429
AM=M+1 // 4430
A=A-1 // 4431
M=D // 4432
@410 // 4433
D=A // 4434
@SP // 4435
AM=M+1 // 4436
A=A-1 // 4437
M=D // 4438
@220 // 4439
D=A // 4440
@SP // 4441
AM=M+1 // 4442
A=A-1 // 4443
M=D // 4444
// call Screen.drawRectangle
@9 // 4445
D=A // 4446
@14 // 4447
M=D // 4448
@Screen.drawRectangle // 4449
D=A // 4450
@13 // 4451
M=D // 4452
@Main.main.ret.1 // 4453
D=A // 4454
@CALL // 4455
0;JMP // 4456
(Main.main.ret.1)
@SP // 4457
M=M-1 // 4458

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4459
AM=M+1 // 4460
A=A-1 // 4461
M=0 // 4462
// call Screen.setColor
@6 // 4463
D=A // 4464
@14 // 4465
M=D // 4466
@Screen.setColor // 4467
D=A // 4468
@13 // 4469
M=D // 4470
@Main.main.ret.2 // 4471
D=A // 4472
@CALL // 4473
0;JMP // 4474
(Main.main.ret.2)
@SP // 4475
M=M-1 // 4476

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4477
D=A // 4478
@SP // 4479
AM=M+1 // 4480
A=A-1 // 4481
M=D // 4482
@120 // 4483
D=A // 4484
@SP // 4485
AM=M+1 // 4486
A=A-1 // 4487
M=D // 4488
@390 // 4489
D=A // 4490
@SP // 4491
AM=M+1 // 4492
A=A-1 // 4493
M=D // 4494
@219 // 4495
D=A // 4496
@SP // 4497
AM=M+1 // 4498
A=A-1 // 4499
M=D // 4500
// call Screen.drawRectangle
@9 // 4501
D=A // 4502
@14 // 4503
M=D // 4504
@Screen.drawRectangle // 4505
D=A // 4506
@13 // 4507
M=D // 4508
@Main.main.ret.3 // 4509
D=A // 4510
@CALL // 4511
0;JMP // 4512
(Main.main.ret.3)
@SP // 4513
M=M-1 // 4514

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4515
D=A // 4516
@SP // 4517
AM=M+1 // 4518
A=A-1 // 4519
M=D // 4520
@120 // 4521
D=A // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=D // 4526
@332 // 4527
D=A // 4528
@SP // 4529
AM=M+1 // 4530
A=A-1 // 4531
M=D // 4532
@150 // 4533
D=A // 4534
@SP // 4535
AM=M+1 // 4536
A=A-1 // 4537
M=D // 4538
// call Screen.drawRectangle
@9 // 4539
D=A // 4540
@14 // 4541
M=D // 4542
@Screen.drawRectangle // 4543
D=A // 4544
@13 // 4545
M=D // 4546
@Main.main.ret.4 // 4547
D=A // 4548
@CALL // 4549
0;JMP // 4550
(Main.main.ret.4)
@SP // 4551
M=M-1 // 4552

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4553
AM=M+1 // 4554
A=A-1 // 4555
M=-1 // 4556
// call Screen.setColor
@6 // 4557
D=A // 4558
@14 // 4559
M=D // 4560
@Screen.setColor // 4561
D=A // 4562
@13 // 4563
M=D // 4564
@Main.main.ret.5 // 4565
D=A // 4566
@CALL // 4567
0;JMP // 4568
(Main.main.ret.5)
@SP // 4569
M=M-1 // 4570

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4571
D=A // 4572
@SP // 4573
AM=M+1 // 4574
A=A-1 // 4575
M=D // 4576
@170 // 4577
D=A // 4578
@SP // 4579
AM=M+1 // 4580
A=A-1 // 4581
M=D // 4582
@3 // 4583
D=A // 4584
@SP // 4585
AM=M+1 // 4586
A=A-1 // 4587
M=D // 4588
// call Screen.drawCircle
@8 // 4589
D=A // 4590
@14 // 4591
M=D // 4592
@Screen.drawCircle // 4593
D=A // 4594
@13 // 4595
M=D // 4596
@Main.main.ret.6 // 4597
D=A // 4598
@CALL // 4599
0;JMP // 4600
(Main.main.ret.6)
@SP // 4601
M=M-1 // 4602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4603
D=A // 4604
@SP // 4605
AM=M+1 // 4606
A=A-1 // 4607
M=D // 4608
@90 // 4609
D=A // 4610
@SP // 4611
AM=M+1 // 4612
A=A-1 // 4613
M=D // 4614
@345 // 4615
D=A // 4616
@SP // 4617
AM=M+1 // 4618
A=A-1 // 4619
M=D // 4620
@35 // 4621
D=A // 4622
@SP // 4623
AM=M+1 // 4624
A=A-1 // 4625
M=D // 4626
// call Screen.drawLine
@9 // 4627
D=A // 4628
@14 // 4629
M=D // 4630
@Screen.drawLine // 4631
D=A // 4632
@13 // 4633
M=D // 4634
@Main.main.ret.7 // 4635
D=A // 4636
@CALL // 4637
0;JMP // 4638
(Main.main.ret.7)
@SP // 4639
M=M-1 // 4640

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4641
D=A // 4642
@SP // 4643
AM=M+1 // 4644
A=A-1 // 4645
M=D // 4646
@35 // 4647
D=A // 4648
@SP // 4649
AM=M+1 // 4650
A=A-1 // 4651
M=D // 4652
@410 // 4653
D=A // 4654
@SP // 4655
AM=M+1 // 4656
A=A-1 // 4657
M=D // 4658
@90 // 4659
D=A // 4660
@SP // 4661
AM=M+1 // 4662
A=A-1 // 4663
M=D // 4664
// call Screen.drawLine
@9 // 4665
D=A // 4666
@14 // 4667
M=D // 4668
@Screen.drawLine // 4669
D=A // 4670
@13 // 4671
M=D // 4672
@Main.main.ret.8 // 4673
D=A // 4674
@CALL // 4675
0;JMP // 4676
(Main.main.ret.8)
@SP // 4677
M=M-1 // 4678

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4679
D=A // 4680
@SP // 4681
AM=M+1 // 4682
A=A-1 // 4683
M=D // 4684
@60 // 4685
D=A // 4686
@SP // 4687
AM=M+1 // 4688
A=A-1 // 4689
M=D // 4690
@30 // 4691
D=A // 4692
@SP // 4693
AM=M+1 // 4694
A=A-1 // 4695
M=D // 4696
// call Screen.drawCircle
@8 // 4697
D=A // 4698
@14 // 4699
M=D // 4700
@Screen.drawCircle // 4701
D=A // 4702
@13 // 4703
M=D // 4704
@Main.main.ret.9 // 4705
D=A // 4706
@CALL // 4707
0;JMP // 4708
(Main.main.ret.9)
@SP // 4709
M=M-1 // 4710

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4711
D=A // 4712
@SP // 4713
AM=M+1 // 4714
A=A-1 // 4715
M=D // 4716
@26 // 4717
D=A // 4718
@SP // 4719
AM=M+1 // 4720
A=A-1 // 4721
M=D // 4722
@140 // 4723
D=A // 4724
@SP // 4725
AM=M+1 // 4726
A=A-1 // 4727
M=D // 4728
@6 // 4729
D=A // 4730
@SP // 4731
AM=M+1 // 4732
A=A-1 // 4733
M=D // 4734
// call Screen.drawLine
@9 // 4735
D=A // 4736
@14 // 4737
M=D // 4738
@Screen.drawLine // 4739
D=A // 4740
@13 // 4741
M=D // 4742
@Main.main.ret.10 // 4743
D=A // 4744
@CALL // 4745
0;JMP // 4746
(Main.main.ret.10)
@SP // 4747
M=M-1 // 4748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4749
D=A // 4750
@SP // 4751
AM=M+1 // 4752
A=A-1 // 4753
M=D // 4754
@35 // 4755
D=A // 4756
@SP // 4757
AM=M+1 // 4758
A=A-1 // 4759
M=D // 4760
@178 // 4761
D=A // 4762
@SP // 4763
AM=M+1 // 4764
A=A-1 // 4765
M=D // 4766
@20 // 4767
D=A // 4768
@SP // 4769
AM=M+1 // 4770
A=A-1 // 4771
M=D // 4772
// call Screen.drawLine
@9 // 4773
D=A // 4774
@14 // 4775
M=D // 4776
@Screen.drawLine // 4777
D=A // 4778
@13 // 4779
M=D // 4780
@Main.main.ret.11 // 4781
D=A // 4782
@CALL // 4783
0;JMP // 4784
(Main.main.ret.11)
@SP // 4785
M=M-1 // 4786

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4787
D=A // 4788
@SP // 4789
AM=M+1 // 4790
A=A-1 // 4791
M=D // 4792
@60 // 4793
D=A // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=D // 4798
@194 // 4799
D=A // 4800
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=D // 4804
@60 // 4805
D=A // 4806
@SP // 4807
AM=M+1 // 4808
A=A-1 // 4809
M=D // 4810
// call Screen.drawLine
@9 // 4811
D=A // 4812
@14 // 4813
M=D // 4814
@Screen.drawLine // 4815
D=A // 4816
@13 // 4817
M=D // 4818
@Main.main.ret.12 // 4819
D=A // 4820
@CALL // 4821
0;JMP // 4822
(Main.main.ret.12)
@SP // 4823
M=M-1 // 4824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4825
D=A // 4826
@SP // 4827
AM=M+1 // 4828
A=A-1 // 4829
M=D // 4830
@85 // 4831
D=A // 4832
@SP // 4833
AM=M+1 // 4834
A=A-1 // 4835
M=D // 4836
@178 // 4837
D=A // 4838
@SP // 4839
AM=M+1 // 4840
A=A-1 // 4841
M=D // 4842
@100 // 4843
D=A // 4844
@SP // 4845
AM=M+1 // 4846
A=A-1 // 4847
M=D // 4848
// call Screen.drawLine
@9 // 4849
D=A // 4850
@14 // 4851
M=D // 4852
@Screen.drawLine // 4853
D=A // 4854
@13 // 4855
M=D // 4856
@Main.main.ret.13 // 4857
D=A // 4858
@CALL // 4859
0;JMP // 4860
(Main.main.ret.13)
@SP // 4861
M=M-1 // 4862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4863
D=A // 4864
@SP // 4865
AM=M+1 // 4866
A=A-1 // 4867
M=D // 4868
@94 // 4869
D=A // 4870
@SP // 4871
AM=M+1 // 4872
A=A-1 // 4873
M=D // 4874
@140 // 4875
D=A // 4876
@SP // 4877
AM=M+1 // 4878
A=A-1 // 4879
M=D // 4880
@114 // 4881
D=A // 4882
@SP // 4883
AM=M+1 // 4884
A=A-1 // 4885
M=D // 4886
// call Screen.drawLine
@9 // 4887
D=A // 4888
@14 // 4889
M=D // 4890
@Screen.drawLine // 4891
D=A // 4892
@13 // 4893
M=D // 4894
@Main.main.ret.14 // 4895
D=A // 4896
@CALL // 4897
0;JMP // 4898
(Main.main.ret.14)
@SP // 4899
M=M-1 // 4900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4901
D=A // 4902
@SP // 4903
AM=M+1 // 4904
A=A-1 // 4905
M=D // 4906
@85 // 4907
D=A // 4908
@SP // 4909
AM=M+1 // 4910
A=A-1 // 4911
M=D // 4912
@102 // 4913
D=A // 4914
@SP // 4915
AM=M+1 // 4916
A=A-1 // 4917
M=D // 4918
@100 // 4919
D=A // 4920
@SP // 4921
AM=M+1 // 4922
A=A-1 // 4923
M=D // 4924
// call Screen.drawLine
@9 // 4925
D=A // 4926
@14 // 4927
M=D // 4928
@Screen.drawLine // 4929
D=A // 4930
@13 // 4931
M=D // 4932
@Main.main.ret.15 // 4933
D=A // 4934
@CALL // 4935
0;JMP // 4936
(Main.main.ret.15)
@SP // 4937
M=M-1 // 4938

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4939
D=A // 4940
@SP // 4941
AM=M+1 // 4942
A=A-1 // 4943
M=D // 4944
@60 // 4945
D=A // 4946
@SP // 4947
AM=M+1 // 4948
A=A-1 // 4949
M=D // 4950
@86 // 4951
D=A // 4952
@SP // 4953
AM=M+1 // 4954
A=A-1 // 4955
M=D // 4956
@60 // 4957
D=A // 4958
@SP // 4959
AM=M+1 // 4960
A=A-1 // 4961
M=D // 4962
// call Screen.drawLine
@9 // 4963
D=A // 4964
@14 // 4965
M=D // 4966
@Screen.drawLine // 4967
D=A // 4968
@13 // 4969
M=D // 4970
@Main.main.ret.16 // 4971
D=A // 4972
@CALL // 4973
0;JMP // 4974
(Main.main.ret.16)
@SP // 4975
M=M-1 // 4976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4977
D=A // 4978
@SP // 4979
AM=M+1 // 4980
A=A-1 // 4981
M=D // 4982
@35 // 4983
D=A // 4984
@SP // 4985
AM=M+1 // 4986
A=A-1 // 4987
M=D // 4988
@102 // 4989
D=A // 4990
@SP // 4991
AM=M+1 // 4992
A=A-1 // 4993
M=D // 4994
@20 // 4995
D=A // 4996
@SP // 4997
AM=M+1 // 4998
A=A-1 // 4999
M=D // 5000
// call Screen.drawLine
@9 // 5001
D=A // 5002
@14 // 5003
M=D // 5004
@Screen.drawLine // 5005
D=A // 5006
@13 // 5007
M=D // 5008
@Main.main.ret.17 // 5009
D=A // 5010
@CALL // 5011
0;JMP // 5012
(Main.main.ret.17)
@SP // 5013
M=M-1 // 5014

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 5015
D=A // 5016
@SP // 5017
AM=M+1 // 5018
A=A-1 // 5019
M=D // 5020
// call String.new
@6 // 5021
D=A // 5022
@14 // 5023
M=D // 5024
@String.new // 5025
D=A // 5026
@13 // 5027
M=D // 5028
@Main.main.ret.18 // 5029
D=A // 5030
@CALL // 5031
0;JMP // 5032
(Main.main.ret.18)
@72 // 5033
D=A // 5034
@SP // 5035
AM=M+1 // 5036
A=A-1 // 5037
M=D // 5038
// call String.appendChar
@7 // 5039
D=A // 5040
@14 // 5041
M=D // 5042
@String.appendChar // 5043
D=A // 5044
@13 // 5045
M=D // 5046
@Main.main.ret.19 // 5047
D=A // 5048
@CALL // 5049
0;JMP // 5050
(Main.main.ret.19)
@101 // 5051
D=A // 5052
@SP // 5053
AM=M+1 // 5054
A=A-1 // 5055
M=D // 5056
// call String.appendChar
@7 // 5057
D=A // 5058
@14 // 5059
M=D // 5060
@String.appendChar // 5061
D=A // 5062
@13 // 5063
M=D // 5064
@Main.main.ret.20 // 5065
D=A // 5066
@CALL // 5067
0;JMP // 5068
(Main.main.ret.20)
@108 // 5069
D=A // 5070
@SP // 5071
AM=M+1 // 5072
A=A-1 // 5073
M=D // 5074
// call String.appendChar
@7 // 5075
D=A // 5076
@14 // 5077
M=D // 5078
@String.appendChar // 5079
D=A // 5080
@13 // 5081
M=D // 5082
@Main.main.ret.21 // 5083
D=A // 5084
@CALL // 5085
0;JMP // 5086
(Main.main.ret.21)
@108 // 5087
D=A // 5088
@SP // 5089
AM=M+1 // 5090
A=A-1 // 5091
M=D // 5092
// call String.appendChar
@7 // 5093
D=A // 5094
@14 // 5095
M=D // 5096
@String.appendChar // 5097
D=A // 5098
@13 // 5099
M=D // 5100
@Main.main.ret.22 // 5101
D=A // 5102
@CALL // 5103
0;JMP // 5104
(Main.main.ret.22)
@111 // 5105
D=A // 5106
@SP // 5107
AM=M+1 // 5108
A=A-1 // 5109
M=D // 5110
// call String.appendChar
@7 // 5111
D=A // 5112
@14 // 5113
M=D // 5114
@String.appendChar // 5115
D=A // 5116
@13 // 5117
M=D // 5118
@Main.main.ret.23 // 5119
D=A // 5120
@CALL // 5121
0;JMP // 5122
(Main.main.ret.23)
@44 // 5123
D=A // 5124
@SP // 5125
AM=M+1 // 5126
A=A-1 // 5127
M=D // 5128
// call String.appendChar
@7 // 5129
D=A // 5130
@14 // 5131
M=D // 5132
@String.appendChar // 5133
D=A // 5134
@13 // 5135
M=D // 5136
@Main.main.ret.24 // 5137
D=A // 5138
@CALL // 5139
0;JMP // 5140
(Main.main.ret.24)
@32 // 5141
D=A // 5142
@SP // 5143
AM=M+1 // 5144
A=A-1 // 5145
M=D // 5146
// call String.appendChar
@7 // 5147
D=A // 5148
@14 // 5149
M=D // 5150
@String.appendChar // 5151
D=A // 5152
@13 // 5153
M=D // 5154
@Main.main.ret.25 // 5155
D=A // 5156
@CALL // 5157
0;JMP // 5158
(Main.main.ret.25)
@119 // 5159
D=A // 5160
@SP // 5161
AM=M+1 // 5162
A=A-1 // 5163
M=D // 5164
// call String.appendChar
@7 // 5165
D=A // 5166
@14 // 5167
M=D // 5168
@String.appendChar // 5169
D=A // 5170
@13 // 5171
M=D // 5172
@Main.main.ret.26 // 5173
D=A // 5174
@CALL // 5175
0;JMP // 5176
(Main.main.ret.26)
@111 // 5177
D=A // 5178
@SP // 5179
AM=M+1 // 5180
A=A-1 // 5181
M=D // 5182
// call String.appendChar
@7 // 5183
D=A // 5184
@14 // 5185
M=D // 5186
@String.appendChar // 5187
D=A // 5188
@13 // 5189
M=D // 5190
@Main.main.ret.27 // 5191
D=A // 5192
@CALL // 5193
0;JMP // 5194
(Main.main.ret.27)
@114 // 5195
D=A // 5196
@SP // 5197
AM=M+1 // 5198
A=A-1 // 5199
M=D // 5200
// call String.appendChar
@7 // 5201
D=A // 5202
@14 // 5203
M=D // 5204
@String.appendChar // 5205
D=A // 5206
@13 // 5207
M=D // 5208
@Main.main.ret.28 // 5209
D=A // 5210
@CALL // 5211
0;JMP // 5212
(Main.main.ret.28)
@108 // 5213
D=A // 5214
@SP // 5215
AM=M+1 // 5216
A=A-1 // 5217
M=D // 5218
// call String.appendChar
@7 // 5219
D=A // 5220
@14 // 5221
M=D // 5222
@String.appendChar // 5223
D=A // 5224
@13 // 5225
M=D // 5226
@Main.main.ret.29 // 5227
D=A // 5228
@CALL // 5229
0;JMP // 5230
(Main.main.ret.29)
@100 // 5231
D=A // 5232
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=D // 5236
// call String.appendChar
@7 // 5237
D=A // 5238
@14 // 5239
M=D // 5240
@String.appendChar // 5241
D=A // 5242
@13 // 5243
M=D // 5244
@Main.main.ret.30 // 5245
D=A // 5246
@CALL // 5247
0;JMP // 5248
(Main.main.ret.30)
@33 // 5249
D=A // 5250
@SP // 5251
AM=M+1 // 5252
A=A-1 // 5253
M=D // 5254
// call String.appendChar
@7 // 5255
D=A // 5256
@14 // 5257
M=D // 5258
@String.appendChar // 5259
D=A // 5260
@13 // 5261
M=D // 5262
@Main.main.ret.31 // 5263
D=A // 5264
@CALL // 5265
0;JMP // 5266
(Main.main.ret.31)
@SP // 5267
AM=M-1 // 5268
D=M // 5269
@LCL // 5270
A=M // 5271
M=D // 5272

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5273
A=M // 5274
D=M // 5275
@SP // 5276
AM=M+1 // 5277
A=A-1 // 5278
M=D // 5279
// call Output.printString
@6 // 5280
D=A // 5281
@14 // 5282
M=D // 5283
@Output.printString // 5284
D=A // 5285
@13 // 5286
M=D // 5287
@Main.main.ret.32 // 5288
D=A // 5289
@CALL // 5290
0;JMP // 5291
(Main.main.ret.32)
@SP // 5292
M=M-1 // 5293

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5294
D=A // 5295
@14 // 5296
M=D // 5297
@Output.println // 5298
D=A // 5299
@13 // 5300
M=D // 5301
@Main.main.ret.33 // 5302
D=A // 5303
@CALL // 5304
0;JMP // 5305
(Main.main.ret.33)
@SP // 5306
M=M-1 // 5307

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5308
A=M // 5309
D=M // 5310
@SP // 5311
AM=M+1 // 5312
A=A-1 // 5313
M=D // 5314
// call String.dispose
@6 // 5315
D=A // 5316
@14 // 5317
M=D // 5318
@String.dispose // 5319
D=A // 5320
@13 // 5321
M=D // 5322
@Main.main.ret.34 // 5323
D=A // 5324
@CALL // 5325
0;JMP // 5326
(Main.main.ret.34)
@SP // 5327
M=M-1 // 5328

////PushInstruction("constant 0")
@SP // 5329
AM=M+1 // 5330
A=A-1 // 5331
M=0 // 5332
@RETURN // 5333
0;JMP // 5334

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5335
@Sys.halt_WHILE_END1 // 5336
D;JNE // 5337

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5338
0;JMP // 5339

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5340
AM=M+1 // 5341
A=A-1 // 5342
M=0 // 5343
@RETURN // 5344
0;JMP // 5345

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5346
D=A // 5347
@SP // 5348
AM=D+M // 5349
A=A-1 // 5350
M=0 // 5351
A=A-1 // 5352
M=0 // 5353
A=A-1 // 5354
M=0 // 5355
A=A-1 // 5356
M=0 // 5357

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5358
A=M // 5359
D=M // 5360
@SP // 5361
AM=M+1 // 5362
A=A-1 // 5363
M=D // 5364
// call Output.getMap
@6 // 5365
D=A // 5366
@14 // 5367
M=D // 5368
@Output.getMap // 5369
D=A // 5370
@13 // 5371
M=D // 5372
@Output.printChar.ret.0 // 5373
D=A // 5374
@CALL // 5375
0;JMP // 5376
(Output.printChar.ret.0)
@SP // 5377
AM=M-1 // 5378
D=M // 5379
@LCL // 5380
A=M // 5381
M=D // 5382

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5383
A=M+1 // 5384
A=A+1 // 5385
A=A+1 // 5386
M=0 // 5387

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
@Output.printChar.LT.51 // 5388
D=A // 5389
@SP // 5390
AM=M+1 // 5391
A=A-1 // 5392
M=D // 5393
@LCL // 5394
A=M+1 // 5395
A=A+1 // 5396
A=A+1 // 5397
D=M // 5398
@11 // 5399
D=D-A // 5400
@DO_LT // 5401
0;JMP // 5402
(Output.printChar.LT.51)
D=!D // 5403
@Output.printChar_WHILE_END1 // 5404
D;JNE // 5405

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

@Array.2 // 5406
D=M // 5407
@SP // 5408
AM=M+1 // 5409
A=A-1 // 5410
M=D // 5411
@11 // 5412
D=A // 5413
@SP // 5414
AM=M+1 // 5415
A=A-1 // 5416
M=D // 5417
// call Math.multiply
@7 // 5418
D=A // 5419
@14 // 5420
M=D // 5421
@Math.multiply // 5422
D=A // 5423
@13 // 5424
M=D // 5425
@Output.printChar.ret.1 // 5426
D=A // 5427
@CALL // 5428
0;JMP // 5429
(Output.printChar.ret.1)
@LCL // 5430
A=M+1 // 5431
A=A+1 // 5432
A=A+1 // 5433
D=M // 5434
@SP // 5435
AM=M-1 // 5436
D=D+M // 5437
@SP // 5438
AM=M+1 // 5439
A=A-1 // 5440
M=D // 5441
@32 // 5442
D=A // 5443
@SP // 5444
AM=M+1 // 5445
A=A-1 // 5446
M=D // 5447
// call Math.multiply
@7 // 5448
D=A // 5449
@14 // 5450
M=D // 5451
@Math.multiply // 5452
D=A // 5453
@13 // 5454
M=D // 5455
@Output.printChar.ret.2 // 5456
D=A // 5457
@CALL // 5458
0;JMP // 5459
(Output.printChar.ret.2)
@SP // 5460
AM=M-1 // 5461
D=M // 5462
@16384 // 5463
D=D+A // 5464
@SP // 5465
AM=M+1 // 5466
A=A-1 // 5467
M=D // 5468
@Array.1 // 5469
D=M // 5470
@SP // 5471
AM=M+1 // 5472
A=A-1 // 5473
M=D // 5474
@2 // 5475
D=A // 5476
@SP // 5477
AM=M+1 // 5478
A=A-1 // 5479
M=D // 5480
// call Math.divide
@7 // 5481
D=A // 5482
@14 // 5483
M=D // 5484
@Math.divide // 5485
D=A // 5486
@13 // 5487
M=D // 5488
@Output.printChar.ret.3 // 5489
D=A // 5490
@CALL // 5491
0;JMP // 5492
(Output.printChar.ret.3)
@SP // 5493
AM=M-1 // 5494
D=M // 5495
@SP // 5496
AM=M-1 // 5497
D=D+M // 5498
@LCL // 5499
A=M+1 // 5500
M=D // 5501

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
@Output.printChar.EQ.52 // 5502
D=A // 5503
@SP // 5504
AM=M+1 // 5505
A=A-1 // 5506
M=D // 5507
@Array.1 // 5508
D=M // 5509
@1 // 5510
D=D&A // 5511
@DO_EQ // 5512
0;JMP // 5513
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE1 // 5514
D;JNE // 5515

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5516
0;JMP // 5517

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

@LCL // 5518
A=M+1 // 5519
A=A+1 // 5520
A=A+1 // 5521
D=M // 5522
A=A-1 // 5523
A=A-1 // 5524
A=A-1 // 5525
A=D+M // 5526
D=M // 5527
@LCL // 5528
A=M+1 // 5529
A=A+1 // 5530
M=D // 5531

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5532
0;JMP // 5533

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

@LCL // 5534
A=M+1 // 5535
A=A+1 // 5536
A=A+1 // 5537
D=M // 5538
A=A-1 // 5539
A=A-1 // 5540
A=A-1 // 5541
A=D+M // 5542
D=M // 5543
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=D // 5547
@256 // 5548
D=A // 5549
@SP // 5550
AM=M+1 // 5551
A=A-1 // 5552
M=D // 5553
// call Math.multiply
@7 // 5554
D=A // 5555
@14 // 5556
M=D // 5557
@Math.multiply // 5558
D=A // 5559
@13 // 5560
M=D // 5561
@Output.printChar.ret.4 // 5562
D=A // 5563
@CALL // 5564
0;JMP // 5565
(Output.printChar.ret.4)
@SP // 5566
AM=M-1 // 5567
D=M // 5568
@LCL // 5569
A=M+1 // 5570
A=A+1 // 5571
M=D // 5572

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
@LCL // 5573
A=M+1 // 5574
D=M // 5575
@SP // 5576
AM=M+1 // 5577
A=A-1 // 5578
M=D // 5579
@LCL // 5580
A=M+1 // 5581
D=M // 5582
@0 // 5583
A=D+A // 5584
D=M // 5585
@SP // 5586
AM=M+1 // 5587
A=A-1 // 5588
M=D // 5589
@LCL // 5590
A=M+1 // 5591
A=A+1 // 5592
D=M // 5593
@SP // 5594
AM=M-1 // 5595
D=D|M // 5596
@SP // 5597
AM=M-1 // 5598
A=M // 5599
M=D // 5600

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

@LCL // 5601
A=M+1 // 5602
A=A+1 // 5603
A=A+1 // 5604
M=M+1 // 5605

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5606
0;JMP // 5607

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
@Output.printChar.EQ.53 // 5608
D=A // 5609
@SP // 5610
AM=M+1 // 5611
A=A-1 // 5612
M=D // 5613
@Array.1 // 5614
D=M // 5615
@63 // 5616
D=D-A // 5617
@DO_EQ // 5618
0;JMP // 5619
(Output.printChar.EQ.53)
@Output.printChar$IF_TRUE2 // 5620
D;JNE // 5621

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5622
0;JMP // 5623

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5624
D=A // 5625
@14 // 5626
M=D // 5627
@Output.println // 5628
D=A // 5629
@13 // 5630
M=D // 5631
@Output.printChar.ret.5 // 5632
D=A // 5633
@CALL // 5634
0;JMP // 5635
(Output.printChar.ret.5)
@SP // 5636
M=M-1 // 5637

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5638
0;JMP // 5639

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

@Array.1 // 5640
M=M+1 // 5641

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5642
AM=M+1 // 5643
A=A-1 // 5644
M=0 // 5645
@RETURN // 5646
0;JMP // 5647

////FunctionInstruction{functionName='Memory.remove_node', numLocals=0, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
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
@Memory.remove_node.EQ.54 // 5648
D=A // 5649
@SP // 5650
AM=M+1 // 5651
A=A-1 // 5652
M=D // 5653
@ARG // 5654
A=M+1 // 5655
D=M // 5656
@2 // 5657
A=D+A // 5658
D=M // 5659
@DO_EQ // 5660
0;JMP // 5661
(Memory.remove_node.EQ.54)
D=!D // 5662
@Memory.remove_node$IF_TRUE1 // 5663
D;JNE // 5664

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5665
0;JMP // 5666

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
@ARG // 5667
A=M+1 // 5668
D=M // 5669
@2 // 5670
D=D+A // 5671
@3 // 5672
D=D+A // 5673
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=D // 5677
@ARG // 5678
A=M+1 // 5679
D=M // 5680
@3 // 5681
A=D+A // 5682
D=M // 5683
@SP // 5684
AM=M-1 // 5685
A=M // 5686
M=D // 5687

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5688
0;JMP // 5689

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
@ARG // 5690
A=M // 5691
D=M // 5692
@SP // 5693
AM=M+1 // 5694
A=A-1 // 5695
M=D // 5696
@ARG // 5697
A=M+1 // 5698
D=M // 5699
@3 // 5700
A=D+A // 5701
D=M // 5702
@SP // 5703
AM=M-1 // 5704
A=M // 5705
M=D // 5706

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
@Memory.remove_node.EQ.55 // 5707
D=A // 5708
@SP // 5709
AM=M+1 // 5710
A=A-1 // 5711
M=D // 5712
@ARG // 5713
A=M+1 // 5714
D=M // 5715
@3 // 5716
A=D+A // 5717
D=M // 5718
@DO_EQ // 5719
0;JMP // 5720
(Memory.remove_node.EQ.55)
D=!D // 5721
@Memory.remove_node$IF_TRUE2 // 5722
D;JNE // 5723

////GotoInstruction{label='Memory.remove_node$IF_FALSE2}
// goto Memory.remove_node$IF_FALSE2
@Memory.remove_node$IF_FALSE2 // 5724
0;JMP // 5725

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
@ARG // 5726
A=M+1 // 5727
D=M // 5728
@3 // 5729
D=D+A // 5730
@2 // 5731
D=D+A // 5732
@SP // 5733
AM=M+1 // 5734
A=A-1 // 5735
M=D // 5736
@ARG // 5737
A=M+1 // 5738
D=M // 5739
@2 // 5740
A=D+A // 5741
D=M // 5742
@SP // 5743
AM=M-1 // 5744
A=M // 5745
M=D // 5746

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
@ARG // 5747
A=M+1 // 5748
D=M // 5749
@2 // 5750
D=D+A // 5751
@SP // 5752
AM=M+1 // 5753
A=A-1 // 5754
M=D // 5755
D=0 // 5756
@SP // 5757
AM=M-1 // 5758
A=M // 5759
M=D // 5760

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5761
A=M+1 // 5762
D=M // 5763
@3 // 5764
D=D+A // 5765
@SP // 5766
AM=M+1 // 5767
A=A-1 // 5768
M=D // 5769
D=0 // 5770
@SP // 5771
AM=M-1 // 5772
A=M // 5773
M=D // 5774

////PushInstruction("constant 0")
@SP // 5775
AM=M+1 // 5776
A=A-1 // 5777
M=0 // 5778
@RETURN // 5779
0;JMP // 5780

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5781
AM=M+1 // 5782
A=A-1 // 5783
M=0 // 5784

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5785
D=A // 5786
@SP // 5787
AM=M+1 // 5788
A=A-1 // 5789
M=D // 5790
// call Array.new
@6 // 5791
D=A // 5792
@14 // 5793
M=D // 5794
@Array.new // 5795
D=A // 5796
@13 // 5797
M=D // 5798
@Output.init.ret.0 // 5799
D=A // 5800
@CALL // 5801
0;JMP // 5802
(Output.init.ret.0)
@SP // 5803
AM=M-1 // 5804
D=M // 5805
@Array.0 // 5806
M=D // 5807

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5808
D=A // 5809
@SP // 5810
M=D+M // 5811
@63 // 5812
D=A // 5813
@SP // 5814
A=M-1 // 5815
M=0 // 5816
A=A-1 // 5817
M=0 // 5818
A=A-1 // 5819
M=D // 5820
A=A-1 // 5821
M=D // 5822
A=A-1 // 5823
M=D // 5824
A=A-1 // 5825
M=D // 5826
A=A-1 // 5827
M=D // 5828
A=A-1 // 5829
M=D // 5830
A=A-1 // 5831
M=D // 5832
A=A-1 // 5833
M=D // 5834
A=A-1 // 5835
M=D // 5836
A=A-1 // 5837
M=0 // 5838
// call Output.create
@17 // 5839
D=A // 5840
@14 // 5841
M=D // 5842
@Output.create // 5843
D=A // 5844
@13 // 5845
M=D // 5846
@Output.init.ret.1 // 5847
D=A // 5848
@CALL // 5849
0;JMP // 5850
(Output.init.ret.1)
@SP // 5851
M=M-1 // 5852

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5853
D=A // 5854
@SP // 5855
M=D+M // 5856
@32 // 5857
D=A // 5858
@SP // 5859
A=M-1 // 5860
M=0 // 5861
A=A-1 // 5862
M=0 // 5863
A=A-1 // 5864
M=0 // 5865
A=A-1 // 5866
M=0 // 5867
A=A-1 // 5868
M=0 // 5869
A=A-1 // 5870
M=0 // 5871
A=A-1 // 5872
M=0 // 5873
A=A-1 // 5874
M=0 // 5875
A=A-1 // 5876
M=0 // 5877
A=A-1 // 5878
M=0 // 5879
A=A-1 // 5880
M=0 // 5881
A=A-1 // 5882
M=D // 5883
A=A-1 // 5884
// call Output.create
@17 // 5885
D=A // 5886
@14 // 5887
M=D // 5888
@Output.create // 5889
D=A // 5890
@13 // 5891
M=D // 5892
@Output.init.ret.2 // 5893
D=A // 5894
@CALL // 5895
0;JMP // 5896
(Output.init.ret.2)
@SP // 5897
M=M-1 // 5898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5899
D=A // 5900
@SP // 5901
AM=M+1 // 5902
A=A-1 // 5903
M=D // 5904
@12 // 5905
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
@30 // 5917
D=A // 5918
@SP // 5919
AM=M+1 // 5920
A=A-1 // 5921
M=D // 5922
@30 // 5923
D=A // 5924
@SP // 5925
AM=M+1 // 5926
A=A-1 // 5927
M=D // 5928
@12 // 5929
D=A // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=D // 5934
@12 // 5935
D=A // 5936
@SP // 5937
AM=M+1 // 5938
A=A-1 // 5939
M=D // 5940
@SP // 5941
AM=M+1 // 5942
A=A-1 // 5943
M=0 // 5944
@4 // 5945
D=A // 5946
@SP // 5947
M=D+M // 5948
@12 // 5949
D=A // 5950
@SP // 5951
A=M-1 // 5952
M=0 // 5953
A=A-1 // 5954
M=0 // 5955
A=A-1 // 5956
M=D // 5957
A=A-1 // 5958
M=D // 5959
A=A-1 // 5960
// call Output.create
@17 // 5961
D=A // 5962
@14 // 5963
M=D // 5964
@Output.create // 5965
D=A // 5966
@13 // 5967
M=D // 5968
@Output.init.ret.3 // 5969
D=A // 5970
@CALL // 5971
0;JMP // 5972
(Output.init.ret.3)
@SP // 5973
M=M-1 // 5974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5975
D=A // 5976
@SP // 5977
AM=M+1 // 5978
A=A-1 // 5979
M=D // 5980
@54 // 5981
D=A // 5982
@SP // 5983
AM=M+1 // 5984
A=A-1 // 5985
M=D // 5986
@54 // 5987
D=A // 5988
@SP // 5989
AM=M+1 // 5990
A=A-1 // 5991
M=D // 5992
@20 // 5993
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
@SP // 6007
AM=M+1 // 6008
A=A-1 // 6009
M=0 // 6010
@SP // 6011
AM=M+1 // 6012
A=A-1 // 6013
M=0 // 6014
@SP // 6015
AM=M+1 // 6016
A=A-1 // 6017
M=0 // 6018
@SP // 6019
AM=M+1 // 6020
A=A-1 // 6021
M=0 // 6022
@SP // 6023
AM=M+1 // 6024
A=A-1 // 6025
M=0 // 6026
@SP // 6027
AM=M+1 // 6028
A=A-1 // 6029
M=0 // 6030
// call Output.create
@17 // 6031
D=A // 6032
@14 // 6033
M=D // 6034
@Output.create // 6035
D=A // 6036
@13 // 6037
M=D // 6038
@Output.init.ret.4 // 6039
D=A // 6040
@CALL // 6041
0;JMP // 6042
(Output.init.ret.4)
@SP // 6043
M=M-1 // 6044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 6045
D=A // 6046
@SP // 6047
M=D+M // 6048
@35 // 6049
D=A // 6050
@SP // 6051
A=M-1 // 6052
M=0 // 6053
A=A-1 // 6054
M=D // 6055
A=A-1 // 6056
@18 // 6057
D=A // 6058
@SP // 6059
AM=M+1 // 6060
A=A-1 // 6061
M=D // 6062
@18 // 6063
D=A // 6064
@SP // 6065
AM=M+1 // 6066
A=A-1 // 6067
M=D // 6068
@63 // 6069
D=A // 6070
@SP // 6071
AM=M+1 // 6072
A=A-1 // 6073
M=D // 6074
@18 // 6075
D=A // 6076
@SP // 6077
AM=M+1 // 6078
A=A-1 // 6079
M=D // 6080
@18 // 6081
D=A // 6082
@SP // 6083
AM=M+1 // 6084
A=A-1 // 6085
M=D // 6086
@63 // 6087
D=A // 6088
@SP // 6089
AM=M+1 // 6090
A=A-1 // 6091
M=D // 6092
@18 // 6093
D=A // 6094
@SP // 6095
AM=M+1 // 6096
A=A-1 // 6097
M=D // 6098
@18 // 6099
D=A // 6100
@SP // 6101
AM=M+1 // 6102
A=A-1 // 6103
M=D // 6104
@SP // 6105
AM=M+1 // 6106
A=A-1 // 6107
M=0 // 6108
@SP // 6109
AM=M+1 // 6110
A=A-1 // 6111
M=0 // 6112
// call Output.create
@17 // 6113
D=A // 6114
@14 // 6115
M=D // 6116
@Output.create // 6117
D=A // 6118
@13 // 6119
M=D // 6120
@Output.init.ret.5 // 6121
D=A // 6122
@CALL // 6123
0;JMP // 6124
(Output.init.ret.5)
@SP // 6125
M=M-1 // 6126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6127
D=A // 6128
@SP // 6129
AM=M+1 // 6130
A=A-1 // 6131
M=D // 6132
@12 // 6133
D=A // 6134
@SP // 6135
AM=M+1 // 6136
A=A-1 // 6137
M=D // 6138
@30 // 6139
D=A // 6140
@SP // 6141
AM=M+1 // 6142
A=A-1 // 6143
M=D // 6144
@51 // 6145
D=A // 6146
@SP // 6147
AM=M+1 // 6148
A=A-1 // 6149
M=D // 6150
@3 // 6151
D=A // 6152
@SP // 6153
AM=M+1 // 6154
A=A-1 // 6155
M=D // 6156
@30 // 6157
D=A // 6158
@SP // 6159
AM=M+1 // 6160
A=A-1 // 6161
M=D // 6162
@48 // 6163
D=A // 6164
@SP // 6165
AM=M+1 // 6166
A=A-1 // 6167
M=D // 6168
@51 // 6169
D=A // 6170
@SP // 6171
AM=M+1 // 6172
A=A-1 // 6173
M=D // 6174
@30 // 6175
D=A // 6176
@SP // 6177
AM=M+1 // 6178
A=A-1 // 6179
M=D // 6180
@12 // 6181
D=A // 6182
@SP // 6183
AM=M+1 // 6184
A=A-1 // 6185
M=D // 6186
@12 // 6187
D=A // 6188
@SP // 6189
AM=M+1 // 6190
A=A-1 // 6191
M=D // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=0 // 6196
// call Output.create
@17 // 6197
D=A // 6198
@14 // 6199
M=D // 6200
@Output.create // 6201
D=A // 6202
@13 // 6203
M=D // 6204
@Output.init.ret.6 // 6205
D=A // 6206
@CALL // 6207
0;JMP // 6208
(Output.init.ret.6)
@SP // 6209
M=M-1 // 6210

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6211
D=A // 6212
@SP // 6213
M=D+M // 6214
@37 // 6215
D=A // 6216
@SP // 6217
A=M-1 // 6218
M=0 // 6219
A=A-1 // 6220
M=0 // 6221
A=A-1 // 6222
M=D // 6223
A=A-1 // 6224
@35 // 6225
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
@24 // 6237
D=A // 6238
@SP // 6239
AM=M+1 // 6240
A=A-1 // 6241
M=D // 6242
@12 // 6243
D=A // 6244
@SP // 6245
AM=M+1 // 6246
A=A-1 // 6247
M=D // 6248
@6 // 6249
D=A // 6250
@SP // 6251
AM=M+1 // 6252
A=A-1 // 6253
M=D // 6254
@51 // 6255
D=A // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=D // 6260
@49 // 6261
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
@Output.init.ret.7 // 6283
D=A // 6284
@CALL // 6285
0;JMP // 6286
(Output.init.ret.7)
@SP // 6287
M=M-1 // 6288

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6289
D=A // 6290
@SP // 6291
AM=M+1 // 6292
A=A-1 // 6293
M=D // 6294
@12 // 6295
D=A // 6296
@SP // 6297
AM=M+1 // 6298
A=A-1 // 6299
M=D // 6300
@30 // 6301
D=A // 6302
@SP // 6303
AM=M+1 // 6304
A=A-1 // 6305
M=D // 6306
@30 // 6307
D=A // 6308
@SP // 6309
AM=M+1 // 6310
A=A-1 // 6311
M=D // 6312
@12 // 6313
D=A // 6314
@SP // 6315
AM=M+1 // 6316
A=A-1 // 6317
M=D // 6318
@54 // 6319
D=A // 6320
@SP // 6321
AM=M+1 // 6322
A=A-1 // 6323
M=D // 6324
@27 // 6325
D=A // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=D // 6330
@27 // 6331
D=A // 6332
@SP // 6333
AM=M+1 // 6334
A=A-1 // 6335
M=D // 6336
@27 // 6337
D=A // 6338
@SP // 6339
AM=M+1 // 6340
A=A-1 // 6341
M=D // 6342
@54 // 6343
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
@Output.init.ret.8 // 6365
D=A // 6366
@CALL // 6367
0;JMP // 6368
(Output.init.ret.8)
@SP // 6369
M=M-1 // 6370

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6371
D=A // 6372
@SP // 6373
AM=M+1 // 6374
A=A-1 // 6375
M=D // 6376
@12 // 6377
D=A // 6378
@SP // 6379
AM=M+1 // 6380
A=A-1 // 6381
M=D // 6382
@12 // 6383
D=A // 6384
@SP // 6385
AM=M+1 // 6386
A=A-1 // 6387
M=D // 6388
@6 // 6389
D=A // 6390
@SP // 6391
AM=M+1 // 6392
A=A-1 // 6393
M=D // 6394
@SP // 6395
AM=M+1 // 6396
A=A-1 // 6397
M=0 // 6398
@SP // 6399
AM=M+1 // 6400
A=A-1 // 6401
M=0 // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=0 // 6406
@SP // 6407
AM=M+1 // 6408
A=A-1 // 6409
M=0 // 6410
@SP // 6411
AM=M+1 // 6412
A=A-1 // 6413
M=0 // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=0 // 6418
@SP // 6419
AM=M+1 // 6420
A=A-1 // 6421
M=0 // 6422
@SP // 6423
AM=M+1 // 6424
A=A-1 // 6425
M=0 // 6426
// call Output.create
@17 // 6427
D=A // 6428
@14 // 6429
M=D // 6430
@Output.create // 6431
D=A // 6432
@13 // 6433
M=D // 6434
@Output.init.ret.9 // 6435
D=A // 6436
@CALL // 6437
0;JMP // 6438
(Output.init.ret.9)
@SP // 6439
M=M-1 // 6440

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6441
D=A // 6442
@SP // 6443
AM=M+1 // 6444
A=A-1 // 6445
M=D // 6446
@24 // 6447
D=A // 6448
@SP // 6449
AM=M+1 // 6450
A=A-1 // 6451
M=D // 6452
@12 // 6453
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
@6 // 6465
D=A // 6466
@SP // 6467
AM=M+1 // 6468
A=A-1 // 6469
M=D // 6470
@6 // 6471
D=A // 6472
@SP // 6473
AM=M+1 // 6474
A=A-1 // 6475
M=D // 6476
@6 // 6477
D=A // 6478
@SP // 6479
AM=M+1 // 6480
A=A-1 // 6481
M=D // 6482
@6 // 6483
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
@24 // 6495
D=A // 6496
@SP // 6497
AM=M+1 // 6498
A=A-1 // 6499
M=D // 6500
@SP // 6501
AM=M+1 // 6502
A=A-1 // 6503
M=0 // 6504
@SP // 6505
AM=M+1 // 6506
A=A-1 // 6507
M=0 // 6508
// call Output.create
@17 // 6509
D=A // 6510
@14 // 6511
M=D // 6512
@Output.create // 6513
D=A // 6514
@13 // 6515
M=D // 6516
@Output.init.ret.10 // 6517
D=A // 6518
@CALL // 6519
0;JMP // 6520
(Output.init.ret.10)
@SP // 6521
M=M-1 // 6522

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6523
D=A // 6524
@SP // 6525
AM=M+1 // 6526
A=A-1 // 6527
M=D // 6528
@6 // 6529
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
@24 // 6541
D=A // 6542
@SP // 6543
AM=M+1 // 6544
A=A-1 // 6545
M=D // 6546
@24 // 6547
D=A // 6548
@SP // 6549
AM=M+1 // 6550
A=A-1 // 6551
M=D // 6552
@24 // 6553
D=A // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=D // 6558
@24 // 6559
D=A // 6560
@SP // 6561
AM=M+1 // 6562
A=A-1 // 6563
M=D // 6564
@24 // 6565
D=A // 6566
@SP // 6567
AM=M+1 // 6568
A=A-1 // 6569
M=D // 6570
@12 // 6571
D=A // 6572
@SP // 6573
AM=M+1 // 6574
A=A-1 // 6575
M=D // 6576
@6 // 6577
D=A // 6578
@SP // 6579
AM=M+1 // 6580
A=A-1 // 6581
M=D // 6582
@SP // 6583
AM=M+1 // 6584
A=A-1 // 6585
M=0 // 6586
@SP // 6587
AM=M+1 // 6588
A=A-1 // 6589
M=0 // 6590
// call Output.create
@17 // 6591
D=A // 6592
@14 // 6593
M=D // 6594
@Output.create // 6595
D=A // 6596
@13 // 6597
M=D // 6598
@Output.init.ret.11 // 6599
D=A // 6600
@CALL // 6601
0;JMP // 6602
(Output.init.ret.11)
@SP // 6603
M=M-1 // 6604

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6605
D=A // 6606
@SP // 6607
M=D+M // 6608
@42 // 6609
D=A // 6610
@SP // 6611
A=M-1 // 6612
M=0 // 6613
A=A-1 // 6614
M=0 // 6615
A=A-1 // 6616
M=0 // 6617
A=A-1 // 6618
M=D // 6619
A=A-1 // 6620
@51 // 6621
D=A // 6622
@SP // 6623
AM=M+1 // 6624
A=A-1 // 6625
M=D // 6626
@30 // 6627
D=A // 6628
@SP // 6629
AM=M+1 // 6630
A=A-1 // 6631
M=D // 6632
@63 // 6633
D=A // 6634
@SP // 6635
AM=M+1 // 6636
A=A-1 // 6637
M=D // 6638
@30 // 6639
D=A // 6640
@SP // 6641
AM=M+1 // 6642
A=A-1 // 6643
M=D // 6644
@51 // 6645
D=A // 6646
@SP // 6647
AM=M+1 // 6648
A=A-1 // 6649
M=D // 6650
@SP // 6651
AM=M+1 // 6652
A=A-1 // 6653
M=0 // 6654
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=0 // 6658
@SP // 6659
AM=M+1 // 6660
A=A-1 // 6661
M=0 // 6662
// call Output.create
@17 // 6663
D=A // 6664
@14 // 6665
M=D // 6666
@Output.create // 6667
D=A // 6668
@13 // 6669
M=D // 6670
@Output.init.ret.12 // 6671
D=A // 6672
@CALL // 6673
0;JMP // 6674
(Output.init.ret.12)
@SP // 6675
M=M-1 // 6676

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6677
D=A // 6678
@SP // 6679
M=D+M // 6680
@43 // 6681
D=A // 6682
@SP // 6683
A=M-1 // 6684
M=0 // 6685
A=A-1 // 6686
M=0 // 6687
A=A-1 // 6688
M=0 // 6689
A=A-1 // 6690
M=D // 6691
A=A-1 // 6692
@12 // 6693
D=A // 6694
@SP // 6695
AM=M+1 // 6696
A=A-1 // 6697
M=D // 6698
@12 // 6699
D=A // 6700
@SP // 6701
AM=M+1 // 6702
A=A-1 // 6703
M=D // 6704
@63 // 6705
D=A // 6706
@SP // 6707
AM=M+1 // 6708
A=A-1 // 6709
M=D // 6710
@12 // 6711
D=A // 6712
@SP // 6713
AM=M+1 // 6714
A=A-1 // 6715
M=D // 6716
@12 // 6717
D=A // 6718
@SP // 6719
AM=M+1 // 6720
A=A-1 // 6721
M=D // 6722
@SP // 6723
AM=M+1 // 6724
A=A-1 // 6725
M=0 // 6726
@SP // 6727
AM=M+1 // 6728
A=A-1 // 6729
M=0 // 6730
@SP // 6731
AM=M+1 // 6732
A=A-1 // 6733
M=0 // 6734
// call Output.create
@17 // 6735
D=A // 6736
@14 // 6737
M=D // 6738
@Output.create // 6739
D=A // 6740
@13 // 6741
M=D // 6742
@Output.init.ret.13 // 6743
D=A // 6744
@CALL // 6745
0;JMP // 6746
(Output.init.ret.13)
@SP // 6747
M=M-1 // 6748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6749
D=A // 6750
@SP // 6751
M=D+M // 6752
@44 // 6753
D=A // 6754
@SP // 6755
A=M-1 // 6756
M=0 // 6757
A=A-1 // 6758
M=0 // 6759
A=A-1 // 6760
M=0 // 6761
A=A-1 // 6762
M=0 // 6763
A=A-1 // 6764
M=0 // 6765
A=A-1 // 6766
M=0 // 6767
A=A-1 // 6768
M=0 // 6769
A=A-1 // 6770
M=D // 6771
A=A-1 // 6772
@12 // 6773
D=A // 6774
@SP // 6775
AM=M+1 // 6776
A=A-1 // 6777
M=D // 6778
@12 // 6779
D=A // 6780
@SP // 6781
AM=M+1 // 6782
A=A-1 // 6783
M=D // 6784
@6 // 6785
D=A // 6786
@SP // 6787
AM=M+1 // 6788
A=A-1 // 6789
M=D // 6790
@SP // 6791
AM=M+1 // 6792
A=A-1 // 6793
M=0 // 6794
// call Output.create
@17 // 6795
D=A // 6796
@14 // 6797
M=D // 6798
@Output.create // 6799
D=A // 6800
@13 // 6801
M=D // 6802
@Output.init.ret.14 // 6803
D=A // 6804
@CALL // 6805
0;JMP // 6806
(Output.init.ret.14)
@SP // 6807
M=M-1 // 6808

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6809
D=A // 6810
@SP // 6811
M=D+M // 6812
@45 // 6813
D=A // 6814
@SP // 6815
A=M-1 // 6816
M=0 // 6817
A=A-1 // 6818
M=0 // 6819
A=A-1 // 6820
M=0 // 6821
A=A-1 // 6822
M=0 // 6823
A=A-1 // 6824
M=0 // 6825
A=A-1 // 6826
M=D // 6827
A=A-1 // 6828
@6 // 6829
D=A // 6830
@SP // 6831
M=D+M // 6832
@63 // 6833
D=A // 6834
@SP // 6835
A=M-1 // 6836
M=0 // 6837
A=A-1 // 6838
M=0 // 6839
A=A-1 // 6840
M=0 // 6841
A=A-1 // 6842
M=0 // 6843
A=A-1 // 6844
M=0 // 6845
A=A-1 // 6846
M=D // 6847
A=A-1 // 6848
// call Output.create
@17 // 6849
D=A // 6850
@14 // 6851
M=D // 6852
@Output.create // 6853
D=A // 6854
@13 // 6855
M=D // 6856
@Output.init.ret.15 // 6857
D=A // 6858
@CALL // 6859
0;JMP // 6860
(Output.init.ret.15)
@SP // 6861
M=M-1 // 6862

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6863
D=A // 6864
@SP // 6865
M=D+M // 6866
@46 // 6867
D=A // 6868
@SP // 6869
A=M-1 // 6870
M=0 // 6871
A=A-1 // 6872
M=0 // 6873
A=A-1 // 6874
M=0 // 6875
A=A-1 // 6876
M=0 // 6877
A=A-1 // 6878
M=0 // 6879
A=A-1 // 6880
M=0 // 6881
A=A-1 // 6882
M=0 // 6883
A=A-1 // 6884
M=D // 6885
A=A-1 // 6886
@4 // 6887
D=A // 6888
@SP // 6889
M=D+M // 6890
@12 // 6891
D=A // 6892
@SP // 6893
A=M-1 // 6894
M=0 // 6895
A=A-1 // 6896
M=0 // 6897
A=A-1 // 6898
M=D // 6899
A=A-1 // 6900
M=D // 6901
A=A-1 // 6902
// call Output.create
@17 // 6903
D=A // 6904
@14 // 6905
M=D // 6906
@Output.create // 6907
D=A // 6908
@13 // 6909
M=D // 6910
@Output.init.ret.16 // 6911
D=A // 6912
@CALL // 6913
0;JMP // 6914
(Output.init.ret.16)
@SP // 6915
M=M-1 // 6916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6917
D=A // 6918
@SP // 6919
M=D+M // 6920
@47 // 6921
D=A // 6922
@SP // 6923
A=M-1 // 6924
M=0 // 6925
A=A-1 // 6926
M=0 // 6927
A=A-1 // 6928
M=D // 6929
A=A-1 // 6930
@32 // 6931
D=A // 6932
@SP // 6933
AM=M+1 // 6934
A=A-1 // 6935
M=D // 6936
@48 // 6937
D=A // 6938
@SP // 6939
AM=M+1 // 6940
A=A-1 // 6941
M=D // 6942
@24 // 6943
D=A // 6944
@SP // 6945
AM=M+1 // 6946
A=A-1 // 6947
M=D // 6948
@12 // 6949
D=A // 6950
@SP // 6951
AM=M+1 // 6952
A=A-1 // 6953
M=D // 6954
@6 // 6955
D=A // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=D // 6960
@3 // 6961
D=A // 6962
@SP // 6963
AM=M+1 // 6964
A=A-1 // 6965
M=D // 6966
@SP // 6967
AM=M+1 // 6968
A=A-1 // 6969
M=1 // 6970
@SP // 6971
AM=M+1 // 6972
A=A-1 // 6973
M=0 // 6974
@SP // 6975
AM=M+1 // 6976
A=A-1 // 6977
M=0 // 6978
// call Output.create
@17 // 6979
D=A // 6980
@14 // 6981
M=D // 6982
@Output.create // 6983
D=A // 6984
@13 // 6985
M=D // 6986
@Output.init.ret.17 // 6987
D=A // 6988
@CALL // 6989
0;JMP // 6990
(Output.init.ret.17)
@SP // 6991
M=M-1 // 6992

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6993
D=A // 6994
@SP // 6995
AM=M+1 // 6996
A=A-1 // 6997
M=D // 6998
@12 // 6999
D=A // 7000
@SP // 7001
AM=M+1 // 7002
A=A-1 // 7003
M=D // 7004
@30 // 7005
D=A // 7006
@SP // 7007
AM=M+1 // 7008
A=A-1 // 7009
M=D // 7010
@51 // 7011
D=A // 7012
@SP // 7013
AM=M+1 // 7014
A=A-1 // 7015
M=D // 7016
@51 // 7017
D=A // 7018
@SP // 7019
AM=M+1 // 7020
A=A-1 // 7021
M=D // 7022
@51 // 7023
D=A // 7024
@SP // 7025
AM=M+1 // 7026
A=A-1 // 7027
M=D // 7028
@51 // 7029
D=A // 7030
@SP // 7031
AM=M+1 // 7032
A=A-1 // 7033
M=D // 7034
@51 // 7035
D=A // 7036
@SP // 7037
AM=M+1 // 7038
A=A-1 // 7039
M=D // 7040
@30 // 7041
D=A // 7042
@SP // 7043
AM=M+1 // 7044
A=A-1 // 7045
M=D // 7046
@12 // 7047
D=A // 7048
@SP // 7049
AM=M+1 // 7050
A=A-1 // 7051
M=D // 7052
@SP // 7053
AM=M+1 // 7054
A=A-1 // 7055
M=0 // 7056
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=0 // 7060
// call Output.create
@17 // 7061
D=A // 7062
@14 // 7063
M=D // 7064
@Output.create // 7065
D=A // 7066
@13 // 7067
M=D // 7068
@Output.init.ret.18 // 7069
D=A // 7070
@CALL // 7071
0;JMP // 7072
(Output.init.ret.18)
@SP // 7073
M=M-1 // 7074

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 7075
D=A // 7076
@SP // 7077
AM=M+1 // 7078
A=A-1 // 7079
M=D // 7080
@12 // 7081
D=A // 7082
@SP // 7083
AM=M+1 // 7084
A=A-1 // 7085
M=D // 7086
@14 // 7087
D=A // 7088
@SP // 7089
AM=M+1 // 7090
A=A-1 // 7091
M=D // 7092
@15 // 7093
D=A // 7094
@SP // 7095
AM=M+1 // 7096
A=A-1 // 7097
M=D // 7098
@12 // 7099
D=A // 7100
@SP // 7101
AM=M+1 // 7102
A=A-1 // 7103
M=D // 7104
@12 // 7105
D=A // 7106
@SP // 7107
AM=M+1 // 7108
A=A-1 // 7109
M=D // 7110
@12 // 7111
D=A // 7112
@SP // 7113
AM=M+1 // 7114
A=A-1 // 7115
M=D // 7116
@12 // 7117
D=A // 7118
@SP // 7119
AM=M+1 // 7120
A=A-1 // 7121
M=D // 7122
@12 // 7123
D=A // 7124
@SP // 7125
AM=M+1 // 7126
A=A-1 // 7127
M=D // 7128
@63 // 7129
D=A // 7130
@SP // 7131
AM=M+1 // 7132
A=A-1 // 7133
M=D // 7134
@SP // 7135
AM=M+1 // 7136
A=A-1 // 7137
M=0 // 7138
@SP // 7139
AM=M+1 // 7140
A=A-1 // 7141
M=0 // 7142
// call Output.create
@17 // 7143
D=A // 7144
@14 // 7145
M=D // 7146
@Output.create // 7147
D=A // 7148
@13 // 7149
M=D // 7150
@Output.init.ret.19 // 7151
D=A // 7152
@CALL // 7153
0;JMP // 7154
(Output.init.ret.19)
@SP // 7155
M=M-1 // 7156

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7157
D=A // 7158
@SP // 7159
AM=M+1 // 7160
A=A-1 // 7161
M=D // 7162
@30 // 7163
D=A // 7164
@SP // 7165
AM=M+1 // 7166
A=A-1 // 7167
M=D // 7168
@51 // 7169
D=A // 7170
@SP // 7171
AM=M+1 // 7172
A=A-1 // 7173
M=D // 7174
@48 // 7175
D=A // 7176
@SP // 7177
AM=M+1 // 7178
A=A-1 // 7179
M=D // 7180
@24 // 7181
D=A // 7182
@SP // 7183
AM=M+1 // 7184
A=A-1 // 7185
M=D // 7186
@12 // 7187
D=A // 7188
@SP // 7189
AM=M+1 // 7190
A=A-1 // 7191
M=D // 7192
@6 // 7193
D=A // 7194
@SP // 7195
AM=M+1 // 7196
A=A-1 // 7197
M=D // 7198
@3 // 7199
D=A // 7200
@SP // 7201
AM=M+1 // 7202
A=A-1 // 7203
M=D // 7204
@51 // 7205
D=A // 7206
@SP // 7207
AM=M+1 // 7208
A=A-1 // 7209
M=D // 7210
@63 // 7211
D=A // 7212
@SP // 7213
AM=M+1 // 7214
A=A-1 // 7215
M=D // 7216
@SP // 7217
AM=M+1 // 7218
A=A-1 // 7219
M=0 // 7220
@SP // 7221
AM=M+1 // 7222
A=A-1 // 7223
M=0 // 7224
// call Output.create
@17 // 7225
D=A // 7226
@14 // 7227
M=D // 7228
@Output.create // 7229
D=A // 7230
@13 // 7231
M=D // 7232
@Output.init.ret.20 // 7233
D=A // 7234
@CALL // 7235
0;JMP // 7236
(Output.init.ret.20)
@SP // 7237
M=M-1 // 7238

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7239
D=A // 7240
@SP // 7241
AM=M+1 // 7242
A=A-1 // 7243
M=D // 7244
@30 // 7245
D=A // 7246
@SP // 7247
AM=M+1 // 7248
A=A-1 // 7249
M=D // 7250
@51 // 7251
D=A // 7252
@SP // 7253
AM=M+1 // 7254
A=A-1 // 7255
M=D // 7256
@48 // 7257
D=A // 7258
@SP // 7259
AM=M+1 // 7260
A=A-1 // 7261
M=D // 7262
@48 // 7263
D=A // 7264
@SP // 7265
AM=M+1 // 7266
A=A-1 // 7267
M=D // 7268
@28 // 7269
D=A // 7270
@SP // 7271
AM=M+1 // 7272
A=A-1 // 7273
M=D // 7274
@48 // 7275
D=A // 7276
@SP // 7277
AM=M+1 // 7278
A=A-1 // 7279
M=D // 7280
@48 // 7281
D=A // 7282
@SP // 7283
AM=M+1 // 7284
A=A-1 // 7285
M=D // 7286
@51 // 7287
D=A // 7288
@SP // 7289
AM=M+1 // 7290
A=A-1 // 7291
M=D // 7292
@30 // 7293
D=A // 7294
@SP // 7295
AM=M+1 // 7296
A=A-1 // 7297
M=D // 7298
@SP // 7299
AM=M+1 // 7300
A=A-1 // 7301
M=0 // 7302
@SP // 7303
AM=M+1 // 7304
A=A-1 // 7305
M=0 // 7306
// call Output.create
@17 // 7307
D=A // 7308
@14 // 7309
M=D // 7310
@Output.create // 7311
D=A // 7312
@13 // 7313
M=D // 7314
@Output.init.ret.21 // 7315
D=A // 7316
@CALL // 7317
0;JMP // 7318
(Output.init.ret.21)
@SP // 7319
M=M-1 // 7320

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7321
D=A // 7322
@SP // 7323
AM=M+1 // 7324
A=A-1 // 7325
M=D // 7326
@16 // 7327
D=A // 7328
@SP // 7329
AM=M+1 // 7330
A=A-1 // 7331
M=D // 7332
@24 // 7333
D=A // 7334
@SP // 7335
AM=M+1 // 7336
A=A-1 // 7337
M=D // 7338
@28 // 7339
D=A // 7340
@SP // 7341
AM=M+1 // 7342
A=A-1 // 7343
M=D // 7344
@26 // 7345
D=A // 7346
@SP // 7347
AM=M+1 // 7348
A=A-1 // 7349
M=D // 7350
@25 // 7351
D=A // 7352
@SP // 7353
AM=M+1 // 7354
A=A-1 // 7355
M=D // 7356
@63 // 7357
D=A // 7358
@SP // 7359
AM=M+1 // 7360
A=A-1 // 7361
M=D // 7362
@24 // 7363
D=A // 7364
@SP // 7365
AM=M+1 // 7366
A=A-1 // 7367
M=D // 7368
@24 // 7369
D=A // 7370
@SP // 7371
AM=M+1 // 7372
A=A-1 // 7373
M=D // 7374
@60 // 7375
D=A // 7376
@SP // 7377
AM=M+1 // 7378
A=A-1 // 7379
M=D // 7380
@SP // 7381
AM=M+1 // 7382
A=A-1 // 7383
M=0 // 7384
@SP // 7385
AM=M+1 // 7386
A=A-1 // 7387
M=0 // 7388
// call Output.create
@17 // 7389
D=A // 7390
@14 // 7391
M=D // 7392
@Output.create // 7393
D=A // 7394
@13 // 7395
M=D // 7396
@Output.init.ret.22 // 7397
D=A // 7398
@CALL // 7399
0;JMP // 7400
(Output.init.ret.22)
@SP // 7401
M=M-1 // 7402

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7403
D=A // 7404
@SP // 7405
AM=M+1 // 7406
A=A-1 // 7407
M=D // 7408
@63 // 7409
D=A // 7410
@SP // 7411
AM=M+1 // 7412
A=A-1 // 7413
M=D // 7414
@3 // 7415
D=A // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=D // 7420
@3 // 7421
D=A // 7422
@SP // 7423
AM=M+1 // 7424
A=A-1 // 7425
M=D // 7426
@31 // 7427
D=A // 7428
@SP // 7429
AM=M+1 // 7430
A=A-1 // 7431
M=D // 7432
@48 // 7433
D=A // 7434
@SP // 7435
AM=M+1 // 7436
A=A-1 // 7437
M=D // 7438
@48 // 7439
D=A // 7440
@SP // 7441
AM=M+1 // 7442
A=A-1 // 7443
M=D // 7444
@48 // 7445
D=A // 7446
@SP // 7447
AM=M+1 // 7448
A=A-1 // 7449
M=D // 7450
@51 // 7451
D=A // 7452
@SP // 7453
AM=M+1 // 7454
A=A-1 // 7455
M=D // 7456
@30 // 7457
D=A // 7458
@SP // 7459
AM=M+1 // 7460
A=A-1 // 7461
M=D // 7462
@SP // 7463
AM=M+1 // 7464
A=A-1 // 7465
M=0 // 7466
@SP // 7467
AM=M+1 // 7468
A=A-1 // 7469
M=0 // 7470
// call Output.create
@17 // 7471
D=A // 7472
@14 // 7473
M=D // 7474
@Output.create // 7475
D=A // 7476
@13 // 7477
M=D // 7478
@Output.init.ret.23 // 7479
D=A // 7480
@CALL // 7481
0;JMP // 7482
(Output.init.ret.23)
@SP // 7483
M=M-1 // 7484

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7485
D=A // 7486
@SP // 7487
AM=M+1 // 7488
A=A-1 // 7489
M=D // 7490
@28 // 7491
D=A // 7492
@SP // 7493
AM=M+1 // 7494
A=A-1 // 7495
M=D // 7496
@6 // 7497
D=A // 7498
@SP // 7499
AM=M+1 // 7500
A=A-1 // 7501
M=D // 7502
@3 // 7503
D=A // 7504
@SP // 7505
AM=M+1 // 7506
A=A-1 // 7507
M=D // 7508
@3 // 7509
D=A // 7510
@SP // 7511
AM=M+1 // 7512
A=A-1 // 7513
M=D // 7514
@31 // 7515
D=A // 7516
@SP // 7517
AM=M+1 // 7518
A=A-1 // 7519
M=D // 7520
@51 // 7521
D=A // 7522
@SP // 7523
AM=M+1 // 7524
A=A-1 // 7525
M=D // 7526
@51 // 7527
D=A // 7528
@SP // 7529
AM=M+1 // 7530
A=A-1 // 7531
M=D // 7532
@51 // 7533
D=A // 7534
@SP // 7535
AM=M+1 // 7536
A=A-1 // 7537
M=D // 7538
@30 // 7539
D=A // 7540
@SP // 7541
AM=M+1 // 7542
A=A-1 // 7543
M=D // 7544
@SP // 7545
AM=M+1 // 7546
A=A-1 // 7547
M=0 // 7548
@SP // 7549
AM=M+1 // 7550
A=A-1 // 7551
M=0 // 7552
// call Output.create
@17 // 7553
D=A // 7554
@14 // 7555
M=D // 7556
@Output.create // 7557
D=A // 7558
@13 // 7559
M=D // 7560
@Output.init.ret.24 // 7561
D=A // 7562
@CALL // 7563
0;JMP // 7564
(Output.init.ret.24)
@SP // 7565
M=M-1 // 7566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7567
D=A // 7568
@SP // 7569
AM=M+1 // 7570
A=A-1 // 7571
M=D // 7572
@63 // 7573
D=A // 7574
@SP // 7575
AM=M+1 // 7576
A=A-1 // 7577
M=D // 7578
@49 // 7579
D=A // 7580
@SP // 7581
AM=M+1 // 7582
A=A-1 // 7583
M=D // 7584
@48 // 7585
D=A // 7586
@SP // 7587
AM=M+1 // 7588
A=A-1 // 7589
M=D // 7590
@48 // 7591
D=A // 7592
@SP // 7593
AM=M+1 // 7594
A=A-1 // 7595
M=D // 7596
@24 // 7597
D=A // 7598
@SP // 7599
AM=M+1 // 7600
A=A-1 // 7601
M=D // 7602
@12 // 7603
D=A // 7604
@SP // 7605
AM=M+1 // 7606
A=A-1 // 7607
M=D // 7608
@12 // 7609
D=A // 7610
@SP // 7611
AM=M+1 // 7612
A=A-1 // 7613
M=D // 7614
@12 // 7615
D=A // 7616
@SP // 7617
AM=M+1 // 7618
A=A-1 // 7619
M=D // 7620
@12 // 7621
D=A // 7622
@SP // 7623
AM=M+1 // 7624
A=A-1 // 7625
M=D // 7626
@SP // 7627
AM=M+1 // 7628
A=A-1 // 7629
M=0 // 7630
@SP // 7631
AM=M+1 // 7632
A=A-1 // 7633
M=0 // 7634
// call Output.create
@17 // 7635
D=A // 7636
@14 // 7637
M=D // 7638
@Output.create // 7639
D=A // 7640
@13 // 7641
M=D // 7642
@Output.init.ret.25 // 7643
D=A // 7644
@CALL // 7645
0;JMP // 7646
(Output.init.ret.25)
@SP // 7647
M=M-1 // 7648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7649
D=A // 7650
@SP // 7651
AM=M+1 // 7652
A=A-1 // 7653
M=D // 7654
@30 // 7655
D=A // 7656
@SP // 7657
AM=M+1 // 7658
A=A-1 // 7659
M=D // 7660
@51 // 7661
D=A // 7662
@SP // 7663
AM=M+1 // 7664
A=A-1 // 7665
M=D // 7666
@51 // 7667
D=A // 7668
@SP // 7669
AM=M+1 // 7670
A=A-1 // 7671
M=D // 7672
@51 // 7673
D=A // 7674
@SP // 7675
AM=M+1 // 7676
A=A-1 // 7677
M=D // 7678
@30 // 7679
D=A // 7680
@SP // 7681
AM=M+1 // 7682
A=A-1 // 7683
M=D // 7684
@51 // 7685
D=A // 7686
@SP // 7687
AM=M+1 // 7688
A=A-1 // 7689
M=D // 7690
@51 // 7691
D=A // 7692
@SP // 7693
AM=M+1 // 7694
A=A-1 // 7695
M=D // 7696
@51 // 7697
D=A // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=D // 7702
@30 // 7703
D=A // 7704
@SP // 7705
AM=M+1 // 7706
A=A-1 // 7707
M=D // 7708
@SP // 7709
AM=M+1 // 7710
A=A-1 // 7711
M=0 // 7712
@SP // 7713
AM=M+1 // 7714
A=A-1 // 7715
M=0 // 7716
// call Output.create
@17 // 7717
D=A // 7718
@14 // 7719
M=D // 7720
@Output.create // 7721
D=A // 7722
@13 // 7723
M=D // 7724
@Output.init.ret.26 // 7725
D=A // 7726
@CALL // 7727
0;JMP // 7728
(Output.init.ret.26)
@SP // 7729
M=M-1 // 7730

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7731
D=A // 7732
@SP // 7733
AM=M+1 // 7734
A=A-1 // 7735
M=D // 7736
@30 // 7737
D=A // 7738
@SP // 7739
AM=M+1 // 7740
A=A-1 // 7741
M=D // 7742
@51 // 7743
D=A // 7744
@SP // 7745
AM=M+1 // 7746
A=A-1 // 7747
M=D // 7748
@51 // 7749
D=A // 7750
@SP // 7751
AM=M+1 // 7752
A=A-1 // 7753
M=D // 7754
@51 // 7755
D=A // 7756
@SP // 7757
AM=M+1 // 7758
A=A-1 // 7759
M=D // 7760
@62 // 7761
D=A // 7762
@SP // 7763
AM=M+1 // 7764
A=A-1 // 7765
M=D // 7766
@48 // 7767
D=A // 7768
@SP // 7769
AM=M+1 // 7770
A=A-1 // 7771
M=D // 7772
@48 // 7773
D=A // 7774
@SP // 7775
AM=M+1 // 7776
A=A-1 // 7777
M=D // 7778
@24 // 7779
D=A // 7780
@SP // 7781
AM=M+1 // 7782
A=A-1 // 7783
M=D // 7784
@14 // 7785
D=A // 7786
@SP // 7787
AM=M+1 // 7788
A=A-1 // 7789
M=D // 7790
@SP // 7791
AM=M+1 // 7792
A=A-1 // 7793
M=0 // 7794
@SP // 7795
AM=M+1 // 7796
A=A-1 // 7797
M=0 // 7798
// call Output.create
@17 // 7799
D=A // 7800
@14 // 7801
M=D // 7802
@Output.create // 7803
D=A // 7804
@13 // 7805
M=D // 7806
@Output.init.ret.27 // 7807
D=A // 7808
@CALL // 7809
0;JMP // 7810
(Output.init.ret.27)
@SP // 7811
M=M-1 // 7812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7813
D=A // 7814
@SP // 7815
M=D+M // 7816
@58 // 7817
D=A // 7818
@SP // 7819
A=M-1 // 7820
M=0 // 7821
A=A-1 // 7822
M=0 // 7823
A=A-1 // 7824
M=D // 7825
A=A-1 // 7826
@4 // 7827
D=A // 7828
@SP // 7829
M=D+M // 7830
@12 // 7831
D=A // 7832
@SP // 7833
A=M-1 // 7834
M=0 // 7835
A=A-1 // 7836
M=0 // 7837
A=A-1 // 7838
M=D // 7839
A=A-1 // 7840
M=D // 7841
A=A-1 // 7842
@5 // 7843
D=A // 7844
@SP // 7845
M=D+M // 7846
@12 // 7847
D=A // 7848
@SP // 7849
A=M-1 // 7850
M=0 // 7851
A=A-1 // 7852
M=0 // 7853
A=A-1 // 7854
M=0 // 7855
A=A-1 // 7856
M=D // 7857
A=A-1 // 7858
M=D // 7859
A=A-1 // 7860
// call Output.create
@17 // 7861
D=A // 7862
@14 // 7863
M=D // 7864
@Output.create // 7865
D=A // 7866
@13 // 7867
M=D // 7868
@Output.init.ret.28 // 7869
D=A // 7870
@CALL // 7871
0;JMP // 7872
(Output.init.ret.28)
@SP // 7873
M=M-1 // 7874

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7875
D=A // 7876
@SP // 7877
M=D+M // 7878
@59 // 7879
D=A // 7880
@SP // 7881
A=M-1 // 7882
M=0 // 7883
A=A-1 // 7884
M=0 // 7885
A=A-1 // 7886
M=D // 7887
A=A-1 // 7888
@4 // 7889
D=A // 7890
@SP // 7891
M=D+M // 7892
@12 // 7893
D=A // 7894
@SP // 7895
A=M-1 // 7896
M=0 // 7897
A=A-1 // 7898
M=0 // 7899
A=A-1 // 7900
M=D // 7901
A=A-1 // 7902
M=D // 7903
A=A-1 // 7904
@12 // 7905
D=A // 7906
@SP // 7907
AM=M+1 // 7908
A=A-1 // 7909
M=D // 7910
@12 // 7911
D=A // 7912
@SP // 7913
AM=M+1 // 7914
A=A-1 // 7915
M=D // 7916
@6 // 7917
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
@Output.init.ret.29 // 7939
D=A // 7940
@CALL // 7941
0;JMP // 7942
(Output.init.ret.29)
@SP // 7943
M=M-1 // 7944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7945
D=A // 7946
@SP // 7947
M=D+M // 7948
@60 // 7949
D=A // 7950
@SP // 7951
A=M-1 // 7952
M=0 // 7953
A=A-1 // 7954
M=0 // 7955
A=A-1 // 7956
M=D // 7957
A=A-1 // 7958
@24 // 7959
D=A // 7960
@SP // 7961
AM=M+1 // 7962
A=A-1 // 7963
M=D // 7964
@12 // 7965
D=A // 7966
@SP // 7967
AM=M+1 // 7968
A=A-1 // 7969
M=D // 7970
@6 // 7971
D=A // 7972
@SP // 7973
AM=M+1 // 7974
A=A-1 // 7975
M=D // 7976
@3 // 7977
D=A // 7978
@SP // 7979
AM=M+1 // 7980
A=A-1 // 7981
M=D // 7982
@6 // 7983
D=A // 7984
@SP // 7985
AM=M+1 // 7986
A=A-1 // 7987
M=D // 7988
@12 // 7989
D=A // 7990
@SP // 7991
AM=M+1 // 7992
A=A-1 // 7993
M=D // 7994
@24 // 7995
D=A // 7996
@SP // 7997
AM=M+1 // 7998
A=A-1 // 7999
M=D // 8000
@SP // 8001
AM=M+1 // 8002
A=A-1 // 8003
M=0 // 8004
@SP // 8005
AM=M+1 // 8006
A=A-1 // 8007
M=0 // 8008
// call Output.create
@17 // 8009
D=A // 8010
@14 // 8011
M=D // 8012
@Output.create // 8013
D=A // 8014
@13 // 8015
M=D // 8016
@Output.init.ret.30 // 8017
D=A // 8018
@CALL // 8019
0;JMP // 8020
(Output.init.ret.30)
@SP // 8021
M=M-1 // 8022

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8023
D=A // 8024
@SP // 8025
M=D+M // 8026
@61 // 8027
D=A // 8028
@SP // 8029
A=M-1 // 8030
M=0 // 8031
A=A-1 // 8032
M=0 // 8033
A=A-1 // 8034
M=0 // 8035
A=A-1 // 8036
M=D // 8037
A=A-1 // 8038
@3 // 8039
D=A // 8040
@SP // 8041
M=D+M // 8042
@63 // 8043
D=A // 8044
@SP // 8045
A=M-1 // 8046
M=0 // 8047
A=A-1 // 8048
M=0 // 8049
A=A-1 // 8050
M=D // 8051
A=A-1 // 8052
@5 // 8053
D=A // 8054
@SP // 8055
M=D+M // 8056
@63 // 8057
D=A // 8058
@SP // 8059
A=M-1 // 8060
M=0 // 8061
A=A-1 // 8062
M=0 // 8063
A=A-1 // 8064
M=0 // 8065
A=A-1 // 8066
M=0 // 8067
A=A-1 // 8068
M=D // 8069
A=A-1 // 8070
// call Output.create
@17 // 8071
D=A // 8072
@14 // 8073
M=D // 8074
@Output.create // 8075
D=A // 8076
@13 // 8077
M=D // 8078
@Output.init.ret.31 // 8079
D=A // 8080
@CALL // 8081
0;JMP // 8082
(Output.init.ret.31)
@SP // 8083
M=M-1 // 8084

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 8085
D=A // 8086
@SP // 8087
M=D+M // 8088
@62 // 8089
D=A // 8090
@SP // 8091
A=M-1 // 8092
M=0 // 8093
A=A-1 // 8094
M=0 // 8095
A=A-1 // 8096
M=D // 8097
A=A-1 // 8098
@3 // 8099
D=A // 8100
@SP // 8101
AM=M+1 // 8102
A=A-1 // 8103
M=D // 8104
@6 // 8105
D=A // 8106
@SP // 8107
AM=M+1 // 8108
A=A-1 // 8109
M=D // 8110
@12 // 8111
D=A // 8112
@SP // 8113
AM=M+1 // 8114
A=A-1 // 8115
M=D // 8116
@24 // 8117
D=A // 8118
@SP // 8119
AM=M+1 // 8120
A=A-1 // 8121
M=D // 8122
@12 // 8123
D=A // 8124
@SP // 8125
AM=M+1 // 8126
A=A-1 // 8127
M=D // 8128
@6 // 8129
D=A // 8130
@SP // 8131
AM=M+1 // 8132
A=A-1 // 8133
M=D // 8134
@3 // 8135
D=A // 8136
@SP // 8137
AM=M+1 // 8138
A=A-1 // 8139
M=D // 8140
@SP // 8141
AM=M+1 // 8142
A=A-1 // 8143
M=0 // 8144
@SP // 8145
AM=M+1 // 8146
A=A-1 // 8147
M=0 // 8148
// call Output.create
@17 // 8149
D=A // 8150
@14 // 8151
M=D // 8152
@Output.create // 8153
D=A // 8154
@13 // 8155
M=D // 8156
@Output.init.ret.32 // 8157
D=A // 8158
@CALL // 8159
0;JMP // 8160
(Output.init.ret.32)
@SP // 8161
M=M-1 // 8162

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8163
D=A // 8164
@SP // 8165
AM=M+1 // 8166
A=A-1 // 8167
M=D // 8168
@30 // 8169
D=A // 8170
@SP // 8171
AM=M+1 // 8172
A=A-1 // 8173
M=D // 8174
@51 // 8175
D=A // 8176
@SP // 8177
AM=M+1 // 8178
A=A-1 // 8179
M=D // 8180
@51 // 8181
D=A // 8182
@SP // 8183
AM=M+1 // 8184
A=A-1 // 8185
M=D // 8186
@59 // 8187
D=A // 8188
@SP // 8189
AM=M+1 // 8190
A=A-1 // 8191
M=D // 8192
@59 // 8193
D=A // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=D // 8198
@59 // 8199
D=A // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204
@27 // 8205
D=A // 8206
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=D // 8210
@3 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216
@30 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222
@SP // 8223
AM=M+1 // 8224
A=A-1 // 8225
M=0 // 8226
@SP // 8227
AM=M+1 // 8228
A=A-1 // 8229
M=0 // 8230
// call Output.create
@17 // 8231
D=A // 8232
@14 // 8233
M=D // 8234
@Output.create // 8235
D=A // 8236
@13 // 8237
M=D // 8238
@Output.init.ret.33 // 8239
D=A // 8240
@CALL // 8241
0;JMP // 8242
(Output.init.ret.33)
@SP // 8243
M=M-1 // 8244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8245
D=A // 8246
@SP // 8247
AM=M+1 // 8248
A=A-1 // 8249
M=D // 8250
@30 // 8251
D=A // 8252
@SP // 8253
AM=M+1 // 8254
A=A-1 // 8255
M=D // 8256
@51 // 8257
D=A // 8258
@SP // 8259
AM=M+1 // 8260
A=A-1 // 8261
M=D // 8262
@51 // 8263
D=A // 8264
@SP // 8265
AM=M+1 // 8266
A=A-1 // 8267
M=D // 8268
@24 // 8269
D=A // 8270
@SP // 8271
AM=M+1 // 8272
A=A-1 // 8273
M=D // 8274
@12 // 8275
D=A // 8276
@SP // 8277
AM=M+1 // 8278
A=A-1 // 8279
M=D // 8280
@12 // 8281
D=A // 8282
@SP // 8283
AM=M+1 // 8284
A=A-1 // 8285
M=D // 8286
@SP // 8287
AM=M+1 // 8288
A=A-1 // 8289
M=0 // 8290
@4 // 8291
D=A // 8292
@SP // 8293
M=D+M // 8294
@12 // 8295
D=A // 8296
@SP // 8297
A=M-1 // 8298
M=0 // 8299
A=A-1 // 8300
M=0 // 8301
A=A-1 // 8302
M=D // 8303
A=A-1 // 8304
M=D // 8305
A=A-1 // 8306
// call Output.create
@17 // 8307
D=A // 8308
@14 // 8309
M=D // 8310
@Output.create // 8311
D=A // 8312
@13 // 8313
M=D // 8314
@Output.init.ret.34 // 8315
D=A // 8316
@CALL // 8317
0;JMP // 8318
(Output.init.ret.34)
@SP // 8319
M=M-1 // 8320

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8321
D=A // 8322
@SP // 8323
AM=M+1 // 8324
A=A-1 // 8325
M=D // 8326
@12 // 8327
D=A // 8328
@SP // 8329
AM=M+1 // 8330
A=A-1 // 8331
M=D // 8332
@30 // 8333
D=A // 8334
@SP // 8335
AM=M+1 // 8336
A=A-1 // 8337
M=D // 8338
@51 // 8339
D=A // 8340
@SP // 8341
AM=M+1 // 8342
A=A-1 // 8343
M=D // 8344
@51 // 8345
D=A // 8346
@SP // 8347
AM=M+1 // 8348
A=A-1 // 8349
M=D // 8350
@63 // 8351
D=A // 8352
@SP // 8353
AM=M+1 // 8354
A=A-1 // 8355
M=D // 8356
@51 // 8357
D=A // 8358
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=D // 8362
@51 // 8363
D=A // 8364
@SP // 8365
AM=M+1 // 8366
A=A-1 // 8367
M=D // 8368
@51 // 8369
D=A // 8370
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=D // 8374
@51 // 8375
D=A // 8376
@SP // 8377
AM=M+1 // 8378
A=A-1 // 8379
M=D // 8380
@SP // 8381
AM=M+1 // 8382
A=A-1 // 8383
M=0 // 8384
@SP // 8385
AM=M+1 // 8386
A=A-1 // 8387
M=0 // 8388
// call Output.create
@17 // 8389
D=A // 8390
@14 // 8391
M=D // 8392
@Output.create // 8393
D=A // 8394
@13 // 8395
M=D // 8396
@Output.init.ret.35 // 8397
D=A // 8398
@CALL // 8399
0;JMP // 8400
(Output.init.ret.35)
@SP // 8401
M=M-1 // 8402

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8403
D=A // 8404
@SP // 8405
AM=M+1 // 8406
A=A-1 // 8407
M=D // 8408
@31 // 8409
D=A // 8410
@SP // 8411
AM=M+1 // 8412
A=A-1 // 8413
M=D // 8414
@51 // 8415
D=A // 8416
@SP // 8417
AM=M+1 // 8418
A=A-1 // 8419
M=D // 8420
@51 // 8421
D=A // 8422
@SP // 8423
AM=M+1 // 8424
A=A-1 // 8425
M=D // 8426
@51 // 8427
D=A // 8428
@SP // 8429
AM=M+1 // 8430
A=A-1 // 8431
M=D // 8432
@31 // 8433
D=A // 8434
@SP // 8435
AM=M+1 // 8436
A=A-1 // 8437
M=D // 8438
@51 // 8439
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
@31 // 8457
D=A // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=D // 8462
@SP // 8463
AM=M+1 // 8464
A=A-1 // 8465
M=0 // 8466
@SP // 8467
AM=M+1 // 8468
A=A-1 // 8469
M=0 // 8470
// call Output.create
@17 // 8471
D=A // 8472
@14 // 8473
M=D // 8474
@Output.create // 8475
D=A // 8476
@13 // 8477
M=D // 8478
@Output.init.ret.36 // 8479
D=A // 8480
@CALL // 8481
0;JMP // 8482
(Output.init.ret.36)
@SP // 8483
M=M-1 // 8484

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8485
D=A // 8486
@SP // 8487
AM=M+1 // 8488
A=A-1 // 8489
M=D // 8490
@28 // 8491
D=A // 8492
@SP // 8493
AM=M+1 // 8494
A=A-1 // 8495
M=D // 8496
@54 // 8497
D=A // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=D // 8502
@35 // 8503
D=A // 8504
@SP // 8505
AM=M+1 // 8506
A=A-1 // 8507
M=D // 8508
@3 // 8509
D=A // 8510
@SP // 8511
AM=M+1 // 8512
A=A-1 // 8513
M=D // 8514
@3 // 8515
D=A // 8516
@SP // 8517
AM=M+1 // 8518
A=A-1 // 8519
M=D // 8520
@3 // 8521
D=A // 8522
@SP // 8523
AM=M+1 // 8524
A=A-1 // 8525
M=D // 8526
@35 // 8527
D=A // 8528
@SP // 8529
AM=M+1 // 8530
A=A-1 // 8531
M=D // 8532
@54 // 8533
D=A // 8534
@SP // 8535
AM=M+1 // 8536
A=A-1 // 8537
M=D // 8538
@28 // 8539
D=A // 8540
@SP // 8541
AM=M+1 // 8542
A=A-1 // 8543
M=D // 8544
@SP // 8545
AM=M+1 // 8546
A=A-1 // 8547
M=0 // 8548
@SP // 8549
AM=M+1 // 8550
A=A-1 // 8551
M=0 // 8552
// call Output.create
@17 // 8553
D=A // 8554
@14 // 8555
M=D // 8556
@Output.create // 8557
D=A // 8558
@13 // 8559
M=D // 8560
@Output.init.ret.37 // 8561
D=A // 8562
@CALL // 8563
0;JMP // 8564
(Output.init.ret.37)
@SP // 8565
M=M-1 // 8566

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8567
D=A // 8568
@SP // 8569
AM=M+1 // 8570
A=A-1 // 8571
M=D // 8572
@15 // 8573
D=A // 8574
@SP // 8575
AM=M+1 // 8576
A=A-1 // 8577
M=D // 8578
@27 // 8579
D=A // 8580
@SP // 8581
AM=M+1 // 8582
A=A-1 // 8583
M=D // 8584
@51 // 8585
D=A // 8586
@SP // 8587
AM=M+1 // 8588
A=A-1 // 8589
M=D // 8590
@51 // 8591
D=A // 8592
@SP // 8593
AM=M+1 // 8594
A=A-1 // 8595
M=D // 8596
@51 // 8597
D=A // 8598
@SP // 8599
AM=M+1 // 8600
A=A-1 // 8601
M=D // 8602
@51 // 8603
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
@27 // 8615
D=A // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=D // 8620
@15 // 8621
D=A // 8622
@SP // 8623
AM=M+1 // 8624
A=A-1 // 8625
M=D // 8626
@SP // 8627
AM=M+1 // 8628
A=A-1 // 8629
M=0 // 8630
@SP // 8631
AM=M+1 // 8632
A=A-1 // 8633
M=0 // 8634
// call Output.create
@17 // 8635
D=A // 8636
@14 // 8637
M=D // 8638
@Output.create // 8639
D=A // 8640
@13 // 8641
M=D // 8642
@Output.init.ret.38 // 8643
D=A // 8644
@CALL // 8645
0;JMP // 8646
(Output.init.ret.38)
@SP // 8647
M=M-1 // 8648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8649
D=A // 8650
@SP // 8651
AM=M+1 // 8652
A=A-1 // 8653
M=D // 8654
@63 // 8655
D=A // 8656
@SP // 8657
AM=M+1 // 8658
A=A-1 // 8659
M=D // 8660
@51 // 8661
D=A // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=D // 8666
@35 // 8667
D=A // 8668
@SP // 8669
AM=M+1 // 8670
A=A-1 // 8671
M=D // 8672
@11 // 8673
D=A // 8674
@SP // 8675
AM=M+1 // 8676
A=A-1 // 8677
M=D // 8678
@15 // 8679
D=A // 8680
@SP // 8681
AM=M+1 // 8682
A=A-1 // 8683
M=D // 8684
@11 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690
@35 // 8691
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
@63 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708
@SP // 8709
AM=M+1 // 8710
A=A-1 // 8711
M=0 // 8712
@SP // 8713
AM=M+1 // 8714
A=A-1 // 8715
M=0 // 8716
// call Output.create
@17 // 8717
D=A // 8718
@14 // 8719
M=D // 8720
@Output.create // 8721
D=A // 8722
@13 // 8723
M=D // 8724
@Output.init.ret.39 // 8725
D=A // 8726
@CALL // 8727
0;JMP // 8728
(Output.init.ret.39)
@SP // 8729
M=M-1 // 8730

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8731
D=A // 8732
@SP // 8733
AM=M+1 // 8734
A=A-1 // 8735
M=D // 8736
@63 // 8737
D=A // 8738
@SP // 8739
AM=M+1 // 8740
A=A-1 // 8741
M=D // 8742
@51 // 8743
D=A // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=D // 8748
@35 // 8749
D=A // 8750
@SP // 8751
AM=M+1 // 8752
A=A-1 // 8753
M=D // 8754
@11 // 8755
D=A // 8756
@SP // 8757
AM=M+1 // 8758
A=A-1 // 8759
M=D // 8760
@15 // 8761
D=A // 8762
@SP // 8763
AM=M+1 // 8764
A=A-1 // 8765
M=D // 8766
@11 // 8767
D=A // 8768
@SP // 8769
AM=M+1 // 8770
A=A-1 // 8771
M=D // 8772
@3 // 8773
D=A // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=D // 8778
@3 // 8779
D=A // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=D // 8784
@3 // 8785
D=A // 8786
@SP // 8787
AM=M+1 // 8788
A=A-1 // 8789
M=D // 8790
@SP // 8791
AM=M+1 // 8792
A=A-1 // 8793
M=0 // 8794
@SP // 8795
AM=M+1 // 8796
A=A-1 // 8797
M=0 // 8798
// call Output.create
@17 // 8799
D=A // 8800
@14 // 8801
M=D // 8802
@Output.create // 8803
D=A // 8804
@13 // 8805
M=D // 8806
@Output.init.ret.40 // 8807
D=A // 8808
@CALL // 8809
0;JMP // 8810
(Output.init.ret.40)
@SP // 8811
M=M-1 // 8812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8813
D=A // 8814
@SP // 8815
AM=M+1 // 8816
A=A-1 // 8817
M=D // 8818
@28 // 8819
D=A // 8820
@SP // 8821
AM=M+1 // 8822
A=A-1 // 8823
M=D // 8824
@54 // 8825
D=A // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=D // 8830
@35 // 8831
D=A // 8832
@SP // 8833
AM=M+1 // 8834
A=A-1 // 8835
M=D // 8836
@3 // 8837
D=A // 8838
@SP // 8839
AM=M+1 // 8840
A=A-1 // 8841
M=D // 8842
@59 // 8843
D=A // 8844
@SP // 8845
AM=M+1 // 8846
A=A-1 // 8847
M=D // 8848
@51 // 8849
D=A // 8850
@SP // 8851
AM=M+1 // 8852
A=A-1 // 8853
M=D // 8854
@51 // 8855
D=A // 8856
@SP // 8857
AM=M+1 // 8858
A=A-1 // 8859
M=D // 8860
@54 // 8861
D=A // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=D // 8866
@44 // 8867
D=A // 8868
@SP // 8869
AM=M+1 // 8870
A=A-1 // 8871
M=D // 8872
@SP // 8873
AM=M+1 // 8874
A=A-1 // 8875
M=0 // 8876
@SP // 8877
AM=M+1 // 8878
A=A-1 // 8879
M=0 // 8880
// call Output.create
@17 // 8881
D=A // 8882
@14 // 8883
M=D // 8884
@Output.create // 8885
D=A // 8886
@13 // 8887
M=D // 8888
@Output.init.ret.41 // 8889
D=A // 8890
@CALL // 8891
0;JMP // 8892
(Output.init.ret.41)
@SP // 8893
M=M-1 // 8894

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8895
D=A // 8896
@SP // 8897
AM=M+1 // 8898
A=A-1 // 8899
M=D // 8900
@51 // 8901
D=A // 8902
@SP // 8903
AM=M+1 // 8904
A=A-1 // 8905
M=D // 8906
@51 // 8907
D=A // 8908
@SP // 8909
AM=M+1 // 8910
A=A-1 // 8911
M=D // 8912
@51 // 8913
D=A // 8914
@SP // 8915
AM=M+1 // 8916
A=A-1 // 8917
M=D // 8918
@51 // 8919
D=A // 8920
@SP // 8921
AM=M+1 // 8922
A=A-1 // 8923
M=D // 8924
@63 // 8925
D=A // 8926
@SP // 8927
AM=M+1 // 8928
A=A-1 // 8929
M=D // 8930
@51 // 8931
D=A // 8932
@SP // 8933
AM=M+1 // 8934
A=A-1 // 8935
M=D // 8936
@51 // 8937
D=A // 8938
@SP // 8939
AM=M+1 // 8940
A=A-1 // 8941
M=D // 8942
@51 // 8943
D=A // 8944
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=D // 8948
@51 // 8949
D=A // 8950
@SP // 8951
AM=M+1 // 8952
A=A-1 // 8953
M=D // 8954
@SP // 8955
AM=M+1 // 8956
A=A-1 // 8957
M=0 // 8958
@SP // 8959
AM=M+1 // 8960
A=A-1 // 8961
M=0 // 8962
// call Output.create
@17 // 8963
D=A // 8964
@14 // 8965
M=D // 8966
@Output.create // 8967
D=A // 8968
@13 // 8969
M=D // 8970
@Output.init.ret.42 // 8971
D=A // 8972
@CALL // 8973
0;JMP // 8974
(Output.init.ret.42)
@SP // 8975
M=M-1 // 8976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8977
D=A // 8978
@SP // 8979
AM=M+1 // 8980
A=A-1 // 8981
M=D // 8982
@30 // 8983
D=A // 8984
@SP // 8985
AM=M+1 // 8986
A=A-1 // 8987
M=D // 8988
@12 // 8989
D=A // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=D // 8994
@12 // 8995
D=A // 8996
@SP // 8997
AM=M+1 // 8998
A=A-1 // 8999
M=D // 9000
@12 // 9001
D=A // 9002
@SP // 9003
AM=M+1 // 9004
A=A-1 // 9005
M=D // 9006
@12 // 9007
D=A // 9008
@SP // 9009
AM=M+1 // 9010
A=A-1 // 9011
M=D // 9012
@12 // 9013
D=A // 9014
@SP // 9015
AM=M+1 // 9016
A=A-1 // 9017
M=D // 9018
@12 // 9019
D=A // 9020
@SP // 9021
AM=M+1 // 9022
A=A-1 // 9023
M=D // 9024
@12 // 9025
D=A // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=D // 9030
@30 // 9031
D=A // 9032
@SP // 9033
AM=M+1 // 9034
A=A-1 // 9035
M=D // 9036
@SP // 9037
AM=M+1 // 9038
A=A-1 // 9039
M=0 // 9040
@SP // 9041
AM=M+1 // 9042
A=A-1 // 9043
M=0 // 9044
// call Output.create
@17 // 9045
D=A // 9046
@14 // 9047
M=D // 9048
@Output.create // 9049
D=A // 9050
@13 // 9051
M=D // 9052
@Output.init.ret.43 // 9053
D=A // 9054
@CALL // 9055
0;JMP // 9056
(Output.init.ret.43)
@SP // 9057
M=M-1 // 9058

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 9059
D=A // 9060
@SP // 9061
AM=M+1 // 9062
A=A-1 // 9063
M=D // 9064
@60 // 9065
D=A // 9066
@SP // 9067
AM=M+1 // 9068
A=A-1 // 9069
M=D // 9070
@24 // 9071
D=A // 9072
@SP // 9073
AM=M+1 // 9074
A=A-1 // 9075
M=D // 9076
@24 // 9077
D=A // 9078
@SP // 9079
AM=M+1 // 9080
A=A-1 // 9081
M=D // 9082
@24 // 9083
D=A // 9084
@SP // 9085
AM=M+1 // 9086
A=A-1 // 9087
M=D // 9088
@24 // 9089
D=A // 9090
@SP // 9091
AM=M+1 // 9092
A=A-1 // 9093
M=D // 9094
@24 // 9095
D=A // 9096
@SP // 9097
AM=M+1 // 9098
A=A-1 // 9099
M=D // 9100
@27 // 9101
D=A // 9102
@SP // 9103
AM=M+1 // 9104
A=A-1 // 9105
M=D // 9106
@27 // 9107
D=A // 9108
@SP // 9109
AM=M+1 // 9110
A=A-1 // 9111
M=D // 9112
@14 // 9113
D=A // 9114
@SP // 9115
AM=M+1 // 9116
A=A-1 // 9117
M=D // 9118
@SP // 9119
AM=M+1 // 9120
A=A-1 // 9121
M=0 // 9122
@SP // 9123
AM=M+1 // 9124
A=A-1 // 9125
M=0 // 9126
// call Output.create
@17 // 9127
D=A // 9128
@14 // 9129
M=D // 9130
@Output.create // 9131
D=A // 9132
@13 // 9133
M=D // 9134
@Output.init.ret.44 // 9135
D=A // 9136
@CALL // 9137
0;JMP // 9138
(Output.init.ret.44)
@SP // 9139
M=M-1 // 9140

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9141
D=A // 9142
@SP // 9143
AM=M+1 // 9144
A=A-1 // 9145
M=D // 9146
@51 // 9147
D=A // 9148
@SP // 9149
AM=M+1 // 9150
A=A-1 // 9151
M=D // 9152
@51 // 9153
D=A // 9154
@SP // 9155
AM=M+1 // 9156
A=A-1 // 9157
M=D // 9158
@51 // 9159
D=A // 9160
@SP // 9161
AM=M+1 // 9162
A=A-1 // 9163
M=D // 9164
@27 // 9165
D=A // 9166
@SP // 9167
AM=M+1 // 9168
A=A-1 // 9169
M=D // 9170
@15 // 9171
D=A // 9172
@SP // 9173
AM=M+1 // 9174
A=A-1 // 9175
M=D // 9176
@27 // 9177
D=A // 9178
@SP // 9179
AM=M+1 // 9180
A=A-1 // 9181
M=D // 9182
@51 // 9183
D=A // 9184
@SP // 9185
AM=M+1 // 9186
A=A-1 // 9187
M=D // 9188
@51 // 9189
D=A // 9190
@SP // 9191
AM=M+1 // 9192
A=A-1 // 9193
M=D // 9194
@51 // 9195
D=A // 9196
@SP // 9197
AM=M+1 // 9198
A=A-1 // 9199
M=D // 9200
@SP // 9201
AM=M+1 // 9202
A=A-1 // 9203
M=0 // 9204
@SP // 9205
AM=M+1 // 9206
A=A-1 // 9207
M=0 // 9208
// call Output.create
@17 // 9209
D=A // 9210
@14 // 9211
M=D // 9212
@Output.create // 9213
D=A // 9214
@13 // 9215
M=D // 9216
@Output.init.ret.45 // 9217
D=A // 9218
@CALL // 9219
0;JMP // 9220
(Output.init.ret.45)
@SP // 9221
M=M-1 // 9222

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9223
D=A // 9224
@SP // 9225
AM=M+1 // 9226
A=A-1 // 9227
M=D // 9228
@3 // 9229
D=A // 9230
@SP // 9231
AM=M+1 // 9232
A=A-1 // 9233
M=D // 9234
@3 // 9235
D=A // 9236
@SP // 9237
AM=M+1 // 9238
A=A-1 // 9239
M=D // 9240
@3 // 9241
D=A // 9242
@SP // 9243
AM=M+1 // 9244
A=A-1 // 9245
M=D // 9246
@3 // 9247
D=A // 9248
@SP // 9249
AM=M+1 // 9250
A=A-1 // 9251
M=D // 9252
@3 // 9253
D=A // 9254
@SP // 9255
AM=M+1 // 9256
A=A-1 // 9257
M=D // 9258
@3 // 9259
D=A // 9260
@SP // 9261
AM=M+1 // 9262
A=A-1 // 9263
M=D // 9264
@35 // 9265
D=A // 9266
@SP // 9267
AM=M+1 // 9268
A=A-1 // 9269
M=D // 9270
@51 // 9271
D=A // 9272
@SP // 9273
AM=M+1 // 9274
A=A-1 // 9275
M=D // 9276
@63 // 9277
D=A // 9278
@SP // 9279
AM=M+1 // 9280
A=A-1 // 9281
M=D // 9282
@SP // 9283
AM=M+1 // 9284
A=A-1 // 9285
M=0 // 9286
@SP // 9287
AM=M+1 // 9288
A=A-1 // 9289
M=0 // 9290
// call Output.create
@17 // 9291
D=A // 9292
@14 // 9293
M=D // 9294
@Output.create // 9295
D=A // 9296
@13 // 9297
M=D // 9298
@Output.init.ret.46 // 9299
D=A // 9300
@CALL // 9301
0;JMP // 9302
(Output.init.ret.46)
@SP // 9303
M=M-1 // 9304

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9305
D=A // 9306
@SP // 9307
AM=M+1 // 9308
A=A-1 // 9309
M=D // 9310
@33 // 9311
D=A // 9312
@SP // 9313
AM=M+1 // 9314
A=A-1 // 9315
M=D // 9316
@51 // 9317
D=A // 9318
@SP // 9319
AM=M+1 // 9320
A=A-1 // 9321
M=D // 9322
@63 // 9323
D=A // 9324
@SP // 9325
AM=M+1 // 9326
A=A-1 // 9327
M=D // 9328
@63 // 9329
D=A // 9330
@SP // 9331
AM=M+1 // 9332
A=A-1 // 9333
M=D // 9334
@51 // 9335
D=A // 9336
@SP // 9337
AM=M+1 // 9338
A=A-1 // 9339
M=D // 9340
@51 // 9341
D=A // 9342
@SP // 9343
AM=M+1 // 9344
A=A-1 // 9345
M=D // 9346
@51 // 9347
D=A // 9348
@SP // 9349
AM=M+1 // 9350
A=A-1 // 9351
M=D // 9352
@51 // 9353
D=A // 9354
@SP // 9355
AM=M+1 // 9356
A=A-1 // 9357
M=D // 9358
@51 // 9359
D=A // 9360
@SP // 9361
AM=M+1 // 9362
A=A-1 // 9363
M=D // 9364
@SP // 9365
AM=M+1 // 9366
A=A-1 // 9367
M=0 // 9368
@SP // 9369
AM=M+1 // 9370
A=A-1 // 9371
M=0 // 9372
// call Output.create
@17 // 9373
D=A // 9374
@14 // 9375
M=D // 9376
@Output.create // 9377
D=A // 9378
@13 // 9379
M=D // 9380
@Output.init.ret.47 // 9381
D=A // 9382
@CALL // 9383
0;JMP // 9384
(Output.init.ret.47)
@SP // 9385
M=M-1 // 9386

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9387
D=A // 9388
@SP // 9389
AM=M+1 // 9390
A=A-1 // 9391
M=D // 9392
@51 // 9393
D=A // 9394
@SP // 9395
AM=M+1 // 9396
A=A-1 // 9397
M=D // 9398
@51 // 9399
D=A // 9400
@SP // 9401
AM=M+1 // 9402
A=A-1 // 9403
M=D // 9404
@55 // 9405
D=A // 9406
@SP // 9407
AM=M+1 // 9408
A=A-1 // 9409
M=D // 9410
@55 // 9411
D=A // 9412
@SP // 9413
AM=M+1 // 9414
A=A-1 // 9415
M=D // 9416
@63 // 9417
D=A // 9418
@SP // 9419
AM=M+1 // 9420
A=A-1 // 9421
M=D // 9422
@59 // 9423
D=A // 9424
@SP // 9425
AM=M+1 // 9426
A=A-1 // 9427
M=D // 9428
@59 // 9429
D=A // 9430
@SP // 9431
AM=M+1 // 9432
A=A-1 // 9433
M=D // 9434
@51 // 9435
D=A // 9436
@SP // 9437
AM=M+1 // 9438
A=A-1 // 9439
M=D // 9440
@51 // 9441
D=A // 9442
@SP // 9443
AM=M+1 // 9444
A=A-1 // 9445
M=D // 9446
@SP // 9447
AM=M+1 // 9448
A=A-1 // 9449
M=0 // 9450
@SP // 9451
AM=M+1 // 9452
A=A-1 // 9453
M=0 // 9454
// call Output.create
@17 // 9455
D=A // 9456
@14 // 9457
M=D // 9458
@Output.create // 9459
D=A // 9460
@13 // 9461
M=D // 9462
@Output.init.ret.48 // 9463
D=A // 9464
@CALL // 9465
0;JMP // 9466
(Output.init.ret.48)
@SP // 9467
M=M-1 // 9468

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9469
D=A // 9470
@SP // 9471
AM=M+1 // 9472
A=A-1 // 9473
M=D // 9474
@30 // 9475
D=A // 9476
@SP // 9477
AM=M+1 // 9478
A=A-1 // 9479
M=D // 9480
@51 // 9481
D=A // 9482
@SP // 9483
AM=M+1 // 9484
A=A-1 // 9485
M=D // 9486
@51 // 9487
D=A // 9488
@SP // 9489
AM=M+1 // 9490
A=A-1 // 9491
M=D // 9492
@51 // 9493
D=A // 9494
@SP // 9495
AM=M+1 // 9496
A=A-1 // 9497
M=D // 9498
@51 // 9499
D=A // 9500
@SP // 9501
AM=M+1 // 9502
A=A-1 // 9503
M=D // 9504
@51 // 9505
D=A // 9506
@SP // 9507
AM=M+1 // 9508
A=A-1 // 9509
M=D // 9510
@51 // 9511
D=A // 9512
@SP // 9513
AM=M+1 // 9514
A=A-1 // 9515
M=D // 9516
@51 // 9517
D=A // 9518
@SP // 9519
AM=M+1 // 9520
A=A-1 // 9521
M=D // 9522
@30 // 9523
D=A // 9524
@SP // 9525
AM=M+1 // 9526
A=A-1 // 9527
M=D // 9528
@SP // 9529
AM=M+1 // 9530
A=A-1 // 9531
M=0 // 9532
@SP // 9533
AM=M+1 // 9534
A=A-1 // 9535
M=0 // 9536
// call Output.create
@17 // 9537
D=A // 9538
@14 // 9539
M=D // 9540
@Output.create // 9541
D=A // 9542
@13 // 9543
M=D // 9544
@Output.init.ret.49 // 9545
D=A // 9546
@CALL // 9547
0;JMP // 9548
(Output.init.ret.49)
@SP // 9549
M=M-1 // 9550

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9551
D=A // 9552
@SP // 9553
AM=M+1 // 9554
A=A-1 // 9555
M=D // 9556
@31 // 9557
D=A // 9558
@SP // 9559
AM=M+1 // 9560
A=A-1 // 9561
M=D // 9562
@51 // 9563
D=A // 9564
@SP // 9565
AM=M+1 // 9566
A=A-1 // 9567
M=D // 9568
@51 // 9569
D=A // 9570
@SP // 9571
AM=M+1 // 9572
A=A-1 // 9573
M=D // 9574
@51 // 9575
D=A // 9576
@SP // 9577
AM=M+1 // 9578
A=A-1 // 9579
M=D // 9580
@31 // 9581
D=A // 9582
@SP // 9583
AM=M+1 // 9584
A=A-1 // 9585
M=D // 9586
@3 // 9587
D=A // 9588
@SP // 9589
AM=M+1 // 9590
A=A-1 // 9591
M=D // 9592
@3 // 9593
D=A // 9594
@SP // 9595
AM=M+1 // 9596
A=A-1 // 9597
M=D // 9598
@3 // 9599
D=A // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=D // 9604
@3 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610
@SP // 9611
AM=M+1 // 9612
A=A-1 // 9613
M=0 // 9614
@SP // 9615
AM=M+1 // 9616
A=A-1 // 9617
M=0 // 9618
// call Output.create
@17 // 9619
D=A // 9620
@14 // 9621
M=D // 9622
@Output.create // 9623
D=A // 9624
@13 // 9625
M=D // 9626
@Output.init.ret.50 // 9627
D=A // 9628
@CALL // 9629
0;JMP // 9630
(Output.init.ret.50)
@SP // 9631
M=M-1 // 9632

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9633
D=A // 9634
@SP // 9635
AM=M+1 // 9636
A=A-1 // 9637
M=D // 9638
@30 // 9639
D=A // 9640
@SP // 9641
AM=M+1 // 9642
A=A-1 // 9643
M=D // 9644
@51 // 9645
D=A // 9646
@SP // 9647
AM=M+1 // 9648
A=A-1 // 9649
M=D // 9650
@51 // 9651
D=A // 9652
@SP // 9653
AM=M+1 // 9654
A=A-1 // 9655
M=D // 9656
@51 // 9657
D=A // 9658
@SP // 9659
AM=M+1 // 9660
A=A-1 // 9661
M=D // 9662
@51 // 9663
D=A // 9664
@SP // 9665
AM=M+1 // 9666
A=A-1 // 9667
M=D // 9668
@51 // 9669
D=A // 9670
@SP // 9671
AM=M+1 // 9672
A=A-1 // 9673
M=D // 9674
@63 // 9675
D=A // 9676
@SP // 9677
AM=M+1 // 9678
A=A-1 // 9679
M=D // 9680
@59 // 9681
D=A // 9682
@SP // 9683
AM=M+1 // 9684
A=A-1 // 9685
M=D // 9686
@30 // 9687
D=A // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=D // 9692
@48 // 9693
D=A // 9694
@SP // 9695
AM=M+1 // 9696
A=A-1 // 9697
M=D // 9698
@SP // 9699
AM=M+1 // 9700
A=A-1 // 9701
M=0 // 9702
// call Output.create
@17 // 9703
D=A // 9704
@14 // 9705
M=D // 9706
@Output.create // 9707
D=A // 9708
@13 // 9709
M=D // 9710
@Output.init.ret.51 // 9711
D=A // 9712
@CALL // 9713
0;JMP // 9714
(Output.init.ret.51)
@SP // 9715
M=M-1 // 9716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9717
D=A // 9718
@SP // 9719
AM=M+1 // 9720
A=A-1 // 9721
M=D // 9722
@31 // 9723
D=A // 9724
@SP // 9725
AM=M+1 // 9726
A=A-1 // 9727
M=D // 9728
@51 // 9729
D=A // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=D // 9734
@51 // 9735
D=A // 9736
@SP // 9737
AM=M+1 // 9738
A=A-1 // 9739
M=D // 9740
@51 // 9741
D=A // 9742
@SP // 9743
AM=M+1 // 9744
A=A-1 // 9745
M=D // 9746
@31 // 9747
D=A // 9748
@SP // 9749
AM=M+1 // 9750
A=A-1 // 9751
M=D // 9752
@27 // 9753
D=A // 9754
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=D // 9758
@51 // 9759
D=A // 9760
@SP // 9761
AM=M+1 // 9762
A=A-1 // 9763
M=D // 9764
@51 // 9765
D=A // 9766
@SP // 9767
AM=M+1 // 9768
A=A-1 // 9769
M=D // 9770
@51 // 9771
D=A // 9772
@SP // 9773
AM=M+1 // 9774
A=A-1 // 9775
M=D // 9776
@SP // 9777
AM=M+1 // 9778
A=A-1 // 9779
M=0 // 9780
@SP // 9781
AM=M+1 // 9782
A=A-1 // 9783
M=0 // 9784
// call Output.create
@17 // 9785
D=A // 9786
@14 // 9787
M=D // 9788
@Output.create // 9789
D=A // 9790
@13 // 9791
M=D // 9792
@Output.init.ret.52 // 9793
D=A // 9794
@CALL // 9795
0;JMP // 9796
(Output.init.ret.52)
@SP // 9797
M=M-1 // 9798

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9799
D=A // 9800
@SP // 9801
AM=M+1 // 9802
A=A-1 // 9803
M=D // 9804
@30 // 9805
D=A // 9806
@SP // 9807
AM=M+1 // 9808
A=A-1 // 9809
M=D // 9810
@51 // 9811
D=A // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=D // 9816
@51 // 9817
D=A // 9818
@SP // 9819
AM=M+1 // 9820
A=A-1 // 9821
M=D // 9822
@6 // 9823
D=A // 9824
@SP // 9825
AM=M+1 // 9826
A=A-1 // 9827
M=D // 9828
@28 // 9829
D=A // 9830
@SP // 9831
AM=M+1 // 9832
A=A-1 // 9833
M=D // 9834
@48 // 9835
D=A // 9836
@SP // 9837
AM=M+1 // 9838
A=A-1 // 9839
M=D // 9840
@51 // 9841
D=A // 9842
@SP // 9843
AM=M+1 // 9844
A=A-1 // 9845
M=D // 9846
@51 // 9847
D=A // 9848
@SP // 9849
AM=M+1 // 9850
A=A-1 // 9851
M=D // 9852
@30 // 9853
D=A // 9854
@SP // 9855
AM=M+1 // 9856
A=A-1 // 9857
M=D // 9858
@SP // 9859
AM=M+1 // 9860
A=A-1 // 9861
M=0 // 9862
@SP // 9863
AM=M+1 // 9864
A=A-1 // 9865
M=0 // 9866
// call Output.create
@17 // 9867
D=A // 9868
@14 // 9869
M=D // 9870
@Output.create // 9871
D=A // 9872
@13 // 9873
M=D // 9874
@Output.init.ret.53 // 9875
D=A // 9876
@CALL // 9877
0;JMP // 9878
(Output.init.ret.53)
@SP // 9879
M=M-1 // 9880

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9881
D=A // 9882
@SP // 9883
AM=M+1 // 9884
A=A-1 // 9885
M=D // 9886
@63 // 9887
D=A // 9888
@SP // 9889
AM=M+1 // 9890
A=A-1 // 9891
M=D // 9892
@63 // 9893
D=A // 9894
@SP // 9895
AM=M+1 // 9896
A=A-1 // 9897
M=D // 9898
@45 // 9899
D=A // 9900
@SP // 9901
AM=M+1 // 9902
A=A-1 // 9903
M=D // 9904
@12 // 9905
D=A // 9906
@SP // 9907
AM=M+1 // 9908
A=A-1 // 9909
M=D // 9910
@12 // 9911
D=A // 9912
@SP // 9913
AM=M+1 // 9914
A=A-1 // 9915
M=D // 9916
@12 // 9917
D=A // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=D // 9922
@12 // 9923
D=A // 9924
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=D // 9928
@12 // 9929
D=A // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=D // 9934
@30 // 9935
D=A // 9936
@SP // 9937
AM=M+1 // 9938
A=A-1 // 9939
M=D // 9940
@SP // 9941
AM=M+1 // 9942
A=A-1 // 9943
M=0 // 9944
@SP // 9945
AM=M+1 // 9946
A=A-1 // 9947
M=0 // 9948
// call Output.create
@17 // 9949
D=A // 9950
@14 // 9951
M=D // 9952
@Output.create // 9953
D=A // 9954
@13 // 9955
M=D // 9956
@Output.init.ret.54 // 9957
D=A // 9958
@CALL // 9959
0;JMP // 9960
(Output.init.ret.54)
@SP // 9961
M=M-1 // 9962

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9963
D=A // 9964
@SP // 9965
AM=M+1 // 9966
A=A-1 // 9967
M=D // 9968
@51 // 9969
D=A // 9970
@SP // 9971
AM=M+1 // 9972
A=A-1 // 9973
M=D // 9974
@51 // 9975
D=A // 9976
@SP // 9977
AM=M+1 // 9978
A=A-1 // 9979
M=D // 9980
@51 // 9981
D=A // 9982
@SP // 9983
AM=M+1 // 9984
A=A-1 // 9985
M=D // 9986
@51 // 9987
D=A // 9988
@SP // 9989
AM=M+1 // 9990
A=A-1 // 9991
M=D // 9992
@51 // 9993
D=A // 9994
@SP // 9995
AM=M+1 // 9996
A=A-1 // 9997
M=D // 9998
@51 // 9999
D=A // 10000
@SP // 10001
AM=M+1 // 10002
A=A-1 // 10003
M=D // 10004
@51 // 10005
D=A // 10006
@SP // 10007
AM=M+1 // 10008
A=A-1 // 10009
M=D // 10010
@51 // 10011
D=A // 10012
@SP // 10013
AM=M+1 // 10014
A=A-1 // 10015
M=D // 10016
@30 // 10017
D=A // 10018
@SP // 10019
AM=M+1 // 10020
A=A-1 // 10021
M=D // 10022
@SP // 10023
AM=M+1 // 10024
A=A-1 // 10025
M=0 // 10026
@SP // 10027
AM=M+1 // 10028
A=A-1 // 10029
M=0 // 10030
// call Output.create
@17 // 10031
D=A // 10032
@14 // 10033
M=D // 10034
@Output.create // 10035
D=A // 10036
@13 // 10037
M=D // 10038
@Output.init.ret.55 // 10039
D=A // 10040
@CALL // 10041
0;JMP // 10042
(Output.init.ret.55)
@SP // 10043
M=M-1 // 10044

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 10045
D=A // 10046
@SP // 10047
AM=M+1 // 10048
A=A-1 // 10049
M=D // 10050
@51 // 10051
D=A // 10052
@SP // 10053
AM=M+1 // 10054
A=A-1 // 10055
M=D // 10056
@51 // 10057
D=A // 10058
@SP // 10059
AM=M+1 // 10060
A=A-1 // 10061
M=D // 10062
@51 // 10063
D=A // 10064
@SP // 10065
AM=M+1 // 10066
A=A-1 // 10067
M=D // 10068
@51 // 10069
D=A // 10070
@SP // 10071
AM=M+1 // 10072
A=A-1 // 10073
M=D // 10074
@51 // 10075
D=A // 10076
@SP // 10077
AM=M+1 // 10078
A=A-1 // 10079
M=D // 10080
@30 // 10081
D=A // 10082
@SP // 10083
AM=M+1 // 10084
A=A-1 // 10085
M=D // 10086
@30 // 10087
D=A // 10088
@SP // 10089
AM=M+1 // 10090
A=A-1 // 10091
M=D // 10092
@12 // 10093
D=A // 10094
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=D // 10098
@12 // 10099
D=A // 10100
@SP // 10101
AM=M+1 // 10102
A=A-1 // 10103
M=D // 10104
@SP // 10105
AM=M+1 // 10106
A=A-1 // 10107
M=0 // 10108
@SP // 10109
AM=M+1 // 10110
A=A-1 // 10111
M=0 // 10112
// call Output.create
@17 // 10113
D=A // 10114
@14 // 10115
M=D // 10116
@Output.create // 10117
D=A // 10118
@13 // 10119
M=D // 10120
@Output.init.ret.56 // 10121
D=A // 10122
@CALL // 10123
0;JMP // 10124
(Output.init.ret.56)
@SP // 10125
M=M-1 // 10126

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10127
D=A // 10128
@SP // 10129
AM=M+1 // 10130
A=A-1 // 10131
M=D // 10132
@51 // 10133
D=A // 10134
@SP // 10135
AM=M+1 // 10136
A=A-1 // 10137
M=D // 10138
@51 // 10139
D=A // 10140
@SP // 10141
AM=M+1 // 10142
A=A-1 // 10143
M=D // 10144
@51 // 10145
D=A // 10146
@SP // 10147
AM=M+1 // 10148
A=A-1 // 10149
M=D // 10150
@51 // 10151
D=A // 10152
@SP // 10153
AM=M+1 // 10154
A=A-1 // 10155
M=D // 10156
@51 // 10157
D=A // 10158
@SP // 10159
AM=M+1 // 10160
A=A-1 // 10161
M=D // 10162
@63 // 10163
D=A // 10164
@SP // 10165
AM=M+1 // 10166
A=A-1 // 10167
M=D // 10168
@63 // 10169
D=A // 10170
@SP // 10171
AM=M+1 // 10172
A=A-1 // 10173
M=D // 10174
@63 // 10175
D=A // 10176
@SP // 10177
AM=M+1 // 10178
A=A-1 // 10179
M=D // 10180
@18 // 10181
D=A // 10182
@SP // 10183
AM=M+1 // 10184
A=A-1 // 10185
M=D // 10186
@SP // 10187
AM=M+1 // 10188
A=A-1 // 10189
M=0 // 10190
@SP // 10191
AM=M+1 // 10192
A=A-1 // 10193
M=0 // 10194
// call Output.create
@17 // 10195
D=A // 10196
@14 // 10197
M=D // 10198
@Output.create // 10199
D=A // 10200
@13 // 10201
M=D // 10202
@Output.init.ret.57 // 10203
D=A // 10204
@CALL // 10205
0;JMP // 10206
(Output.init.ret.57)
@SP // 10207
M=M-1 // 10208

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10209
D=A // 10210
@SP // 10211
AM=M+1 // 10212
A=A-1 // 10213
M=D // 10214
@51 // 10215
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
@30 // 10227
D=A // 10228
@SP // 10229
AM=M+1 // 10230
A=A-1 // 10231
M=D // 10232
@30 // 10233
D=A // 10234
@SP // 10235
AM=M+1 // 10236
A=A-1 // 10237
M=D // 10238
@12 // 10239
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
@30 // 10251
D=A // 10252
@SP // 10253
AM=M+1 // 10254
A=A-1 // 10255
M=D // 10256
@51 // 10257
D=A // 10258
@SP // 10259
AM=M+1 // 10260
A=A-1 // 10261
M=D // 10262
@51 // 10263
D=A // 10264
@SP // 10265
AM=M+1 // 10266
A=A-1 // 10267
M=D // 10268
@SP // 10269
AM=M+1 // 10270
A=A-1 // 10271
M=0 // 10272
@SP // 10273
AM=M+1 // 10274
A=A-1 // 10275
M=0 // 10276
// call Output.create
@17 // 10277
D=A // 10278
@14 // 10279
M=D // 10280
@Output.create // 10281
D=A // 10282
@13 // 10283
M=D // 10284
@Output.init.ret.58 // 10285
D=A // 10286
@CALL // 10287
0;JMP // 10288
(Output.init.ret.58)
@SP // 10289
M=M-1 // 10290

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10291
D=A // 10292
@SP // 10293
AM=M+1 // 10294
A=A-1 // 10295
M=D // 10296
@51 // 10297
D=A // 10298
@SP // 10299
AM=M+1 // 10300
A=A-1 // 10301
M=D // 10302
@51 // 10303
D=A // 10304
@SP // 10305
AM=M+1 // 10306
A=A-1 // 10307
M=D // 10308
@51 // 10309
D=A // 10310
@SP // 10311
AM=M+1 // 10312
A=A-1 // 10313
M=D // 10314
@51 // 10315
D=A // 10316
@SP // 10317
AM=M+1 // 10318
A=A-1 // 10319
M=D // 10320
@30 // 10321
D=A // 10322
@SP // 10323
AM=M+1 // 10324
A=A-1 // 10325
M=D // 10326
@12 // 10327
D=A // 10328
@SP // 10329
AM=M+1 // 10330
A=A-1 // 10331
M=D // 10332
@12 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338
@12 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344
@30 // 10345
D=A // 10346
@SP // 10347
AM=M+1 // 10348
A=A-1 // 10349
M=D // 10350
@SP // 10351
AM=M+1 // 10352
A=A-1 // 10353
M=0 // 10354
@SP // 10355
AM=M+1 // 10356
A=A-1 // 10357
M=0 // 10358
// call Output.create
@17 // 10359
D=A // 10360
@14 // 10361
M=D // 10362
@Output.create // 10363
D=A // 10364
@13 // 10365
M=D // 10366
@Output.init.ret.59 // 10367
D=A // 10368
@CALL // 10369
0;JMP // 10370
(Output.init.ret.59)
@SP // 10371
M=M-1 // 10372

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10373
D=A // 10374
@SP // 10375
AM=M+1 // 10376
A=A-1 // 10377
M=D // 10378
@63 // 10379
D=A // 10380
@SP // 10381
AM=M+1 // 10382
A=A-1 // 10383
M=D // 10384
@51 // 10385
D=A // 10386
@SP // 10387
AM=M+1 // 10388
A=A-1 // 10389
M=D // 10390
@49 // 10391
D=A // 10392
@SP // 10393
AM=M+1 // 10394
A=A-1 // 10395
M=D // 10396
@24 // 10397
D=A // 10398
@SP // 10399
AM=M+1 // 10400
A=A-1 // 10401
M=D // 10402
@12 // 10403
D=A // 10404
@SP // 10405
AM=M+1 // 10406
A=A-1 // 10407
M=D // 10408
@6 // 10409
D=A // 10410
@SP // 10411
AM=M+1 // 10412
A=A-1 // 10413
M=D // 10414
@35 // 10415
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
@63 // 10427
D=A // 10428
@SP // 10429
AM=M+1 // 10430
A=A-1 // 10431
M=D // 10432
@SP // 10433
AM=M+1 // 10434
A=A-1 // 10435
M=0 // 10436
@SP // 10437
AM=M+1 // 10438
A=A-1 // 10439
M=0 // 10440
// call Output.create
@17 // 10441
D=A // 10442
@14 // 10443
M=D // 10444
@Output.create // 10445
D=A // 10446
@13 // 10447
M=D // 10448
@Output.init.ret.60 // 10449
D=A // 10450
@CALL // 10451
0;JMP // 10452
(Output.init.ret.60)
@SP // 10453
M=M-1 // 10454

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10455
D=A // 10456
@SP // 10457
AM=M+1 // 10458
A=A-1 // 10459
M=D // 10460
@30 // 10461
D=A // 10462
@SP // 10463
AM=M+1 // 10464
A=A-1 // 10465
M=D // 10466
@6 // 10467
D=A // 10468
@SP // 10469
AM=M+1 // 10470
A=A-1 // 10471
M=D // 10472
@6 // 10473
D=A // 10474
@SP // 10475
AM=M+1 // 10476
A=A-1 // 10477
M=D // 10478
@6 // 10479
D=A // 10480
@SP // 10481
AM=M+1 // 10482
A=A-1 // 10483
M=D // 10484
@6 // 10485
D=A // 10486
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=D // 10490
@6 // 10491
D=A // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=D // 10496
@6 // 10497
D=A // 10498
@SP // 10499
AM=M+1 // 10500
A=A-1 // 10501
M=D // 10502
@6 // 10503
D=A // 10504
@SP // 10505
AM=M+1 // 10506
A=A-1 // 10507
M=D // 10508
@30 // 10509
D=A // 10510
@SP // 10511
AM=M+1 // 10512
A=A-1 // 10513
M=D // 10514
@SP // 10515
AM=M+1 // 10516
A=A-1 // 10517
M=0 // 10518
@SP // 10519
AM=M+1 // 10520
A=A-1 // 10521
M=0 // 10522
// call Output.create
@17 // 10523
D=A // 10524
@14 // 10525
M=D // 10526
@Output.create // 10527
D=A // 10528
@13 // 10529
M=D // 10530
@Output.init.ret.61 // 10531
D=A // 10532
@CALL // 10533
0;JMP // 10534
(Output.init.ret.61)
@SP // 10535
M=M-1 // 10536

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10537
D=A // 10538
@SP // 10539
M=D+M // 10540
@92 // 10541
D=A // 10542
@SP // 10543
A=M-1 // 10544
M=1 // 10545
A=A-1 // 10546
M=0 // 10547
A=A-1 // 10548
M=0 // 10549
A=A-1 // 10550
M=D // 10551
A=A-1 // 10552
@3 // 10553
D=A // 10554
@SP // 10555
AM=M+1 // 10556
A=A-1 // 10557
M=D // 10558
@6 // 10559
D=A // 10560
@SP // 10561
AM=M+1 // 10562
A=A-1 // 10563
M=D // 10564
@12 // 10565
D=A // 10566
@SP // 10567
AM=M+1 // 10568
A=A-1 // 10569
M=D // 10570
@24 // 10571
D=A // 10572
@SP // 10573
AM=M+1 // 10574
A=A-1 // 10575
M=D // 10576
@48 // 10577
D=A // 10578
@SP // 10579
AM=M+1 // 10580
A=A-1 // 10581
M=D // 10582
@32 // 10583
D=A // 10584
@SP // 10585
AM=M+1 // 10586
A=A-1 // 10587
M=D // 10588
@SP // 10589
AM=M+1 // 10590
A=A-1 // 10591
M=0 // 10592
@SP // 10593
AM=M+1 // 10594
A=A-1 // 10595
M=0 // 10596
// call Output.create
@17 // 10597
D=A // 10598
@14 // 10599
M=D // 10600
@Output.create // 10601
D=A // 10602
@13 // 10603
M=D // 10604
@Output.init.ret.62 // 10605
D=A // 10606
@CALL // 10607
0;JMP // 10608
(Output.init.ret.62)
@SP // 10609
M=M-1 // 10610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10611
D=A // 10612
@SP // 10613
AM=M+1 // 10614
A=A-1 // 10615
M=D // 10616
@30 // 10617
D=A // 10618
@SP // 10619
AM=M+1 // 10620
A=A-1 // 10621
M=D // 10622
@24 // 10623
D=A // 10624
@SP // 10625
AM=M+1 // 10626
A=A-1 // 10627
M=D // 10628
@24 // 10629
D=A // 10630
@SP // 10631
AM=M+1 // 10632
A=A-1 // 10633
M=D // 10634
@24 // 10635
D=A // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=D // 10640
@24 // 10641
D=A // 10642
@SP // 10643
AM=M+1 // 10644
A=A-1 // 10645
M=D // 10646
@24 // 10647
D=A // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=D // 10652
@24 // 10653
D=A // 10654
@SP // 10655
AM=M+1 // 10656
A=A-1 // 10657
M=D // 10658
@24 // 10659
D=A // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=D // 10664
@30 // 10665
D=A // 10666
@SP // 10667
AM=M+1 // 10668
A=A-1 // 10669
M=D // 10670
@SP // 10671
AM=M+1 // 10672
A=A-1 // 10673
M=0 // 10674
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
@Output.init.ret.63 // 10687
D=A // 10688
@CALL // 10689
0;JMP // 10690
(Output.init.ret.63)
@SP // 10691
M=M-1 // 10692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10693
D=A // 10694
@SP // 10695
AM=M+1 // 10696
A=A-1 // 10697
M=D // 10698
@8 // 10699
D=A // 10700
@SP // 10701
AM=M+1 // 10702
A=A-1 // 10703
M=D // 10704
@28 // 10705
D=A // 10706
@SP // 10707
AM=M+1 // 10708
A=A-1 // 10709
M=D // 10710
@54 // 10711
D=A // 10712
@SP // 10713
AM=M+1 // 10714
A=A-1 // 10715
M=D // 10716
@SP // 10717
AM=M+1 // 10718
A=A-1 // 10719
M=0 // 10720
@SP // 10721
AM=M+1 // 10722
A=A-1 // 10723
M=0 // 10724
@SP // 10725
AM=M+1 // 10726
A=A-1 // 10727
M=0 // 10728
@SP // 10729
AM=M+1 // 10730
A=A-1 // 10731
M=0 // 10732
@SP // 10733
AM=M+1 // 10734
A=A-1 // 10735
M=0 // 10736
@SP // 10737
AM=M+1 // 10738
A=A-1 // 10739
M=0 // 10740
@SP // 10741
AM=M+1 // 10742
A=A-1 // 10743
M=0 // 10744
@SP // 10745
AM=M+1 // 10746
A=A-1 // 10747
M=0 // 10748
// call Output.create
@17 // 10749
D=A // 10750
@14 // 10751
M=D // 10752
@Output.create // 10753
D=A // 10754
@13 // 10755
M=D // 10756
@Output.init.ret.64 // 10757
D=A // 10758
@CALL // 10759
0;JMP // 10760
(Output.init.ret.64)
@SP // 10761
M=M-1 // 10762

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10763
D=A // 10764
@SP // 10765
M=D+M // 10766
@95 // 10767
D=A // 10768
@SP // 10769
A=M-1 // 10770
M=0 // 10771
A=A-1 // 10772
M=0 // 10773
A=A-1 // 10774
M=0 // 10775
A=A-1 // 10776
M=0 // 10777
A=A-1 // 10778
M=0 // 10779
A=A-1 // 10780
M=0 // 10781
A=A-1 // 10782
M=0 // 10783
A=A-1 // 10784
M=0 // 10785
A=A-1 // 10786
M=0 // 10787
A=A-1 // 10788
M=D // 10789
A=A-1 // 10790
@2 // 10791
D=A // 10792
@SP // 10793
M=D+M // 10794
@63 // 10795
D=A // 10796
@SP // 10797
A=M-1 // 10798
M=0 // 10799
A=A-1 // 10800
M=D // 10801
A=A-1 // 10802
// call Output.create
@17 // 10803
D=A // 10804
@14 // 10805
M=D // 10806
@Output.create // 10807
D=A // 10808
@13 // 10809
M=D // 10810
@Output.init.ret.65 // 10811
D=A // 10812
@CALL // 10813
0;JMP // 10814
(Output.init.ret.65)
@SP // 10815
M=M-1 // 10816

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10817
D=A // 10818
@SP // 10819
AM=M+1 // 10820
A=A-1 // 10821
M=D // 10822
@6 // 10823
D=A // 10824
@SP // 10825
AM=M+1 // 10826
A=A-1 // 10827
M=D // 10828
@12 // 10829
D=A // 10830
@SP // 10831
AM=M+1 // 10832
A=A-1 // 10833
M=D // 10834
@24 // 10835
D=A // 10836
@SP // 10837
AM=M+1 // 10838
A=A-1 // 10839
M=D // 10840
@SP // 10841
AM=M+1 // 10842
A=A-1 // 10843
M=0 // 10844
@SP // 10845
AM=M+1 // 10846
A=A-1 // 10847
M=0 // 10848
@SP // 10849
AM=M+1 // 10850
A=A-1 // 10851
M=0 // 10852
@SP // 10853
AM=M+1 // 10854
A=A-1 // 10855
M=0 // 10856
@SP // 10857
AM=M+1 // 10858
A=A-1 // 10859
M=0 // 10860
@SP // 10861
AM=M+1 // 10862
A=A-1 // 10863
M=0 // 10864
@SP // 10865
AM=M+1 // 10866
A=A-1 // 10867
M=0 // 10868
@SP // 10869
AM=M+1 // 10870
A=A-1 // 10871
M=0 // 10872
// call Output.create
@17 // 10873
D=A // 10874
@14 // 10875
M=D // 10876
@Output.create // 10877
D=A // 10878
@13 // 10879
M=D // 10880
@Output.init.ret.66 // 10881
D=A // 10882
@CALL // 10883
0;JMP // 10884
(Output.init.ret.66)
@SP // 10885
M=M-1 // 10886

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10887
D=A // 10888
@SP // 10889
M=D+M // 10890
@97 // 10891
D=A // 10892
@SP // 10893
A=M-1 // 10894
M=0 // 10895
A=A-1 // 10896
M=0 // 10897
A=A-1 // 10898
M=0 // 10899
A=A-1 // 10900
M=D // 10901
A=A-1 // 10902
@14 // 10903
D=A // 10904
@SP // 10905
AM=M+1 // 10906
A=A-1 // 10907
M=D // 10908
@24 // 10909
D=A // 10910
@SP // 10911
AM=M+1 // 10912
A=A-1 // 10913
M=D // 10914
@30 // 10915
D=A // 10916
@SP // 10917
AM=M+1 // 10918
A=A-1 // 10919
M=D // 10920
@27 // 10921
D=A // 10922
@SP // 10923
AM=M+1 // 10924
A=A-1 // 10925
M=D // 10926
@27 // 10927
D=A // 10928
@SP // 10929
AM=M+1 // 10930
A=A-1 // 10931
M=D // 10932
@54 // 10933
D=A // 10934
@SP // 10935
AM=M+1 // 10936
A=A-1 // 10937
M=D // 10938
@SP // 10939
AM=M+1 // 10940
A=A-1 // 10941
M=0 // 10942
@SP // 10943
AM=M+1 // 10944
A=A-1 // 10945
M=0 // 10946
// call Output.create
@17 // 10947
D=A // 10948
@14 // 10949
M=D // 10950
@Output.create // 10951
D=A // 10952
@13 // 10953
M=D // 10954
@Output.init.ret.67 // 10955
D=A // 10956
@CALL // 10957
0;JMP // 10958
(Output.init.ret.67)
@SP // 10959
M=M-1 // 10960

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10961
D=A // 10962
@SP // 10963
AM=M+1 // 10964
A=A-1 // 10965
M=D // 10966
@3 // 10967
D=A // 10968
@SP // 10969
AM=M+1 // 10970
A=A-1 // 10971
M=D // 10972
@3 // 10973
D=A // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=D // 10978
@3 // 10979
D=A // 10980
@SP // 10981
AM=M+1 // 10982
A=A-1 // 10983
M=D // 10984
@15 // 10985
D=A // 10986
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=D // 10990
@27 // 10991
D=A // 10992
@SP // 10993
AM=M+1 // 10994
A=A-1 // 10995
M=D // 10996
@51 // 10997
D=A // 10998
@SP // 10999
AM=M+1 // 11000
A=A-1 // 11001
M=D // 11002
@51 // 11003
D=A // 11004
@SP // 11005
AM=M+1 // 11006
A=A-1 // 11007
M=D // 11008
@51 // 11009
D=A // 11010
@SP // 11011
AM=M+1 // 11012
A=A-1 // 11013
M=D // 11014
@30 // 11015
D=A // 11016
@SP // 11017
AM=M+1 // 11018
A=A-1 // 11019
M=D // 11020
@SP // 11021
AM=M+1 // 11022
A=A-1 // 11023
M=0 // 11024
@SP // 11025
AM=M+1 // 11026
A=A-1 // 11027
M=0 // 11028
// call Output.create
@17 // 11029
D=A // 11030
@14 // 11031
M=D // 11032
@Output.create // 11033
D=A // 11034
@13 // 11035
M=D // 11036
@Output.init.ret.68 // 11037
D=A // 11038
@CALL // 11039
0;JMP // 11040
(Output.init.ret.68)
@SP // 11041
M=M-1 // 11042

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11043
D=A // 11044
@SP // 11045
M=D+M // 11046
@99 // 11047
D=A // 11048
@SP // 11049
A=M-1 // 11050
M=0 // 11051
A=A-1 // 11052
M=0 // 11053
A=A-1 // 11054
M=0 // 11055
A=A-1 // 11056
M=D // 11057
A=A-1 // 11058
@30 // 11059
D=A // 11060
@SP // 11061
AM=M+1 // 11062
A=A-1 // 11063
M=D // 11064
@51 // 11065
D=A // 11066
@SP // 11067
AM=M+1 // 11068
A=A-1 // 11069
M=D // 11070
@3 // 11071
D=A // 11072
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=D // 11076
@3 // 11077
D=A // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=D // 11082
@51 // 11083
D=A // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=D // 11088
@30 // 11089
D=A // 11090
@SP // 11091
AM=M+1 // 11092
A=A-1 // 11093
M=D // 11094
@SP // 11095
AM=M+1 // 11096
A=A-1 // 11097
M=0 // 11098
@SP // 11099
AM=M+1 // 11100
A=A-1 // 11101
M=0 // 11102
// call Output.create
@17 // 11103
D=A // 11104
@14 // 11105
M=D // 11106
@Output.create // 11107
D=A // 11108
@13 // 11109
M=D // 11110
@Output.init.ret.69 // 11111
D=A // 11112
@CALL // 11113
0;JMP // 11114
(Output.init.ret.69)
@SP // 11115
M=M-1 // 11116

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11117
D=A // 11118
@SP // 11119
AM=M+1 // 11120
A=A-1 // 11121
M=D // 11122
@48 // 11123
D=A // 11124
@SP // 11125
AM=M+1 // 11126
A=A-1 // 11127
M=D // 11128
@48 // 11129
D=A // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=D // 11134
@48 // 11135
D=A // 11136
@SP // 11137
AM=M+1 // 11138
A=A-1 // 11139
M=D // 11140
@60 // 11141
D=A // 11142
@SP // 11143
AM=M+1 // 11144
A=A-1 // 11145
M=D // 11146
@54 // 11147
D=A // 11148
@SP // 11149
AM=M+1 // 11150
A=A-1 // 11151
M=D // 11152
@51 // 11153
D=A // 11154
@SP // 11155
AM=M+1 // 11156
A=A-1 // 11157
M=D // 11158
@51 // 11159
D=A // 11160
@SP // 11161
AM=M+1 // 11162
A=A-1 // 11163
M=D // 11164
@51 // 11165
D=A // 11166
@SP // 11167
AM=M+1 // 11168
A=A-1 // 11169
M=D // 11170
@30 // 11171
D=A // 11172
@SP // 11173
AM=M+1 // 11174
A=A-1 // 11175
M=D // 11176
@SP // 11177
AM=M+1 // 11178
A=A-1 // 11179
M=0 // 11180
@SP // 11181
AM=M+1 // 11182
A=A-1 // 11183
M=0 // 11184
// call Output.create
@17 // 11185
D=A // 11186
@14 // 11187
M=D // 11188
@Output.create // 11189
D=A // 11190
@13 // 11191
M=D // 11192
@Output.init.ret.70 // 11193
D=A // 11194
@CALL // 11195
0;JMP // 11196
(Output.init.ret.70)
@SP // 11197
M=M-1 // 11198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11199
D=A // 11200
@SP // 11201
M=D+M // 11202
@101 // 11203
D=A // 11204
@SP // 11205
A=M-1 // 11206
M=0 // 11207
A=A-1 // 11208
M=0 // 11209
A=A-1 // 11210
M=0 // 11211
A=A-1 // 11212
M=D // 11213
A=A-1 // 11214
@30 // 11215
D=A // 11216
@SP // 11217
AM=M+1 // 11218
A=A-1 // 11219
M=D // 11220
@51 // 11221
D=A // 11222
@SP // 11223
AM=M+1 // 11224
A=A-1 // 11225
M=D // 11226
@63 // 11227
D=A // 11228
@SP // 11229
AM=M+1 // 11230
A=A-1 // 11231
M=D // 11232
@3 // 11233
D=A // 11234
@SP // 11235
AM=M+1 // 11236
A=A-1 // 11237
M=D // 11238
@51 // 11239
D=A // 11240
@SP // 11241
AM=M+1 // 11242
A=A-1 // 11243
M=D // 11244
@30 // 11245
D=A // 11246
@SP // 11247
AM=M+1 // 11248
A=A-1 // 11249
M=D // 11250
@SP // 11251
AM=M+1 // 11252
A=A-1 // 11253
M=0 // 11254
@SP // 11255
AM=M+1 // 11256
A=A-1 // 11257
M=0 // 11258
// call Output.create
@17 // 11259
D=A // 11260
@14 // 11261
M=D // 11262
@Output.create // 11263
D=A // 11264
@13 // 11265
M=D // 11266
@Output.init.ret.71 // 11267
D=A // 11268
@CALL // 11269
0;JMP // 11270
(Output.init.ret.71)
@SP // 11271
M=M-1 // 11272

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11273
D=A // 11274
@SP // 11275
AM=M+1 // 11276
A=A-1 // 11277
M=D // 11278
@28 // 11279
D=A // 11280
@SP // 11281
AM=M+1 // 11282
A=A-1 // 11283
M=D // 11284
@54 // 11285
D=A // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=D // 11290
@38 // 11291
D=A // 11292
@SP // 11293
AM=M+1 // 11294
A=A-1 // 11295
M=D // 11296
@6 // 11297
D=A // 11298
@SP // 11299
AM=M+1 // 11300
A=A-1 // 11301
M=D // 11302
@15 // 11303
D=A // 11304
@SP // 11305
AM=M+1 // 11306
A=A-1 // 11307
M=D // 11308
@6 // 11309
D=A // 11310
@SP // 11311
AM=M+1 // 11312
A=A-1 // 11313
M=D // 11314
@6 // 11315
D=A // 11316
@SP // 11317
AM=M+1 // 11318
A=A-1 // 11319
M=D // 11320
@6 // 11321
D=A // 11322
@SP // 11323
AM=M+1 // 11324
A=A-1 // 11325
M=D // 11326
@15 // 11327
D=A // 11328
@SP // 11329
AM=M+1 // 11330
A=A-1 // 11331
M=D // 11332
@SP // 11333
AM=M+1 // 11334
A=A-1 // 11335
M=0 // 11336
@SP // 11337
AM=M+1 // 11338
A=A-1 // 11339
M=0 // 11340
// call Output.create
@17 // 11341
D=A // 11342
@14 // 11343
M=D // 11344
@Output.create // 11345
D=A // 11346
@13 // 11347
M=D // 11348
@Output.init.ret.72 // 11349
D=A // 11350
@CALL // 11351
0;JMP // 11352
(Output.init.ret.72)
@SP // 11353
M=M-1 // 11354

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11355
D=A // 11356
@SP // 11357
M=D+M // 11358
@103 // 11359
D=A // 11360
@SP // 11361
A=M-1 // 11362
M=0 // 11363
A=A-1 // 11364
M=0 // 11365
A=A-1 // 11366
M=D // 11367
A=A-1 // 11368
@30 // 11369
D=A // 11370
@SP // 11371
AM=M+1 // 11372
A=A-1 // 11373
M=D // 11374
@51 // 11375
D=A // 11376
@SP // 11377
AM=M+1 // 11378
A=A-1 // 11379
M=D // 11380
@51 // 11381
D=A // 11382
@SP // 11383
AM=M+1 // 11384
A=A-1 // 11385
M=D // 11386
@51 // 11387
D=A // 11388
@SP // 11389
AM=M+1 // 11390
A=A-1 // 11391
M=D // 11392
@62 // 11393
D=A // 11394
@SP // 11395
AM=M+1 // 11396
A=A-1 // 11397
M=D // 11398
@48 // 11399
D=A // 11400
@SP // 11401
AM=M+1 // 11402
A=A-1 // 11403
M=D // 11404
@51 // 11405
D=A // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=D // 11410
@30 // 11411
D=A // 11412
@SP // 11413
AM=M+1 // 11414
A=A-1 // 11415
M=D // 11416
@SP // 11417
AM=M+1 // 11418
A=A-1 // 11419
M=0 // 11420
// call Output.create
@17 // 11421
D=A // 11422
@14 // 11423
M=D // 11424
@Output.create // 11425
D=A // 11426
@13 // 11427
M=D // 11428
@Output.init.ret.73 // 11429
D=A // 11430
@CALL // 11431
0;JMP // 11432
(Output.init.ret.73)
@SP // 11433
M=M-1 // 11434

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11435
D=A // 11436
@SP // 11437
AM=M+1 // 11438
A=A-1 // 11439
M=D // 11440
@3 // 11441
D=A // 11442
@SP // 11443
AM=M+1 // 11444
A=A-1 // 11445
M=D // 11446
@3 // 11447
D=A // 11448
@SP // 11449
AM=M+1 // 11450
A=A-1 // 11451
M=D // 11452
@3 // 11453
D=A // 11454
@SP // 11455
AM=M+1 // 11456
A=A-1 // 11457
M=D // 11458
@27 // 11459
D=A // 11460
@SP // 11461
AM=M+1 // 11462
A=A-1 // 11463
M=D // 11464
@55 // 11465
D=A // 11466
@SP // 11467
AM=M+1 // 11468
A=A-1 // 11469
M=D // 11470
@51 // 11471
D=A // 11472
@SP // 11473
AM=M+1 // 11474
A=A-1 // 11475
M=D // 11476
@51 // 11477
D=A // 11478
@SP // 11479
AM=M+1 // 11480
A=A-1 // 11481
M=D // 11482
@51 // 11483
D=A // 11484
@SP // 11485
AM=M+1 // 11486
A=A-1 // 11487
M=D // 11488
@51 // 11489
D=A // 11490
@SP // 11491
AM=M+1 // 11492
A=A-1 // 11493
M=D // 11494
@SP // 11495
AM=M+1 // 11496
A=A-1 // 11497
M=0 // 11498
@SP // 11499
AM=M+1 // 11500
A=A-1 // 11501
M=0 // 11502
// call Output.create
@17 // 11503
D=A // 11504
@14 // 11505
M=D // 11506
@Output.create // 11507
D=A // 11508
@13 // 11509
M=D // 11510
@Output.init.ret.74 // 11511
D=A // 11512
@CALL // 11513
0;JMP // 11514
(Output.init.ret.74)
@SP // 11515
M=M-1 // 11516

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11517
D=A // 11518
@SP // 11519
AM=M+1 // 11520
A=A-1 // 11521
M=D // 11522
@12 // 11523
D=A // 11524
@SP // 11525
AM=M+1 // 11526
A=A-1 // 11527
M=D // 11528
@12 // 11529
D=A // 11530
@SP // 11531
AM=M+1 // 11532
A=A-1 // 11533
M=D // 11534
@SP // 11535
AM=M+1 // 11536
A=A-1 // 11537
M=0 // 11538
@14 // 11539
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
@12 // 11563
D=A // 11564
@SP // 11565
AM=M+1 // 11566
A=A-1 // 11567
M=D // 11568
@30 // 11569
D=A // 11570
@SP // 11571
AM=M+1 // 11572
A=A-1 // 11573
M=D // 11574
@SP // 11575
AM=M+1 // 11576
A=A-1 // 11577
M=0 // 11578
@SP // 11579
AM=M+1 // 11580
A=A-1 // 11581
M=0 // 11582
// call Output.create
@17 // 11583
D=A // 11584
@14 // 11585
M=D // 11586
@Output.create // 11587
D=A // 11588
@13 // 11589
M=D // 11590
@Output.init.ret.75 // 11591
D=A // 11592
@CALL // 11593
0;JMP // 11594
(Output.init.ret.75)
@SP // 11595
M=M-1 // 11596

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11597
D=A // 11598
@SP // 11599
AM=M+1 // 11600
A=A-1 // 11601
M=D // 11602
@48 // 11603
D=A // 11604
@SP // 11605
AM=M+1 // 11606
A=A-1 // 11607
M=D // 11608
@48 // 11609
D=A // 11610
@SP // 11611
AM=M+1 // 11612
A=A-1 // 11613
M=D // 11614
@SP // 11615
AM=M+1 // 11616
A=A-1 // 11617
M=0 // 11618
@56 // 11619
D=A // 11620
@SP // 11621
AM=M+1 // 11622
A=A-1 // 11623
M=D // 11624
@48 // 11625
D=A // 11626
@SP // 11627
AM=M+1 // 11628
A=A-1 // 11629
M=D // 11630
@48 // 11631
D=A // 11632
@SP // 11633
AM=M+1 // 11634
A=A-1 // 11635
M=D // 11636
@48 // 11637
D=A // 11638
@SP // 11639
AM=M+1 // 11640
A=A-1 // 11641
M=D // 11642
@48 // 11643
D=A // 11644
@SP // 11645
AM=M+1 // 11646
A=A-1 // 11647
M=D // 11648
@51 // 11649
D=A // 11650
@SP // 11651
AM=M+1 // 11652
A=A-1 // 11653
M=D // 11654
@30 // 11655
D=A // 11656
@SP // 11657
AM=M+1 // 11658
A=A-1 // 11659
M=D // 11660
@SP // 11661
AM=M+1 // 11662
A=A-1 // 11663
M=0 // 11664
// call Output.create
@17 // 11665
D=A // 11666
@14 // 11667
M=D // 11668
@Output.create // 11669
D=A // 11670
@13 // 11671
M=D // 11672
@Output.init.ret.76 // 11673
D=A // 11674
@CALL // 11675
0;JMP // 11676
(Output.init.ret.76)
@SP // 11677
M=M-1 // 11678

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11679
D=A // 11680
@SP // 11681
AM=M+1 // 11682
A=A-1 // 11683
M=D // 11684
@3 // 11685
D=A // 11686
@SP // 11687
AM=M+1 // 11688
A=A-1 // 11689
M=D // 11690
@3 // 11691
D=A // 11692
@SP // 11693
AM=M+1 // 11694
A=A-1 // 11695
M=D // 11696
@3 // 11697
D=A // 11698
@SP // 11699
AM=M+1 // 11700
A=A-1 // 11701
M=D // 11702
@51 // 11703
D=A // 11704
@SP // 11705
AM=M+1 // 11706
A=A-1 // 11707
M=D // 11708
@27 // 11709
D=A // 11710
@SP // 11711
AM=M+1 // 11712
A=A-1 // 11713
M=D // 11714
@15 // 11715
D=A // 11716
@SP // 11717
AM=M+1 // 11718
A=A-1 // 11719
M=D // 11720
@15 // 11721
D=A // 11722
@SP // 11723
AM=M+1 // 11724
A=A-1 // 11725
M=D // 11726
@27 // 11727
D=A // 11728
@SP // 11729
AM=M+1 // 11730
A=A-1 // 11731
M=D // 11732
@51 // 11733
D=A // 11734
@SP // 11735
AM=M+1 // 11736
A=A-1 // 11737
M=D // 11738
@SP // 11739
AM=M+1 // 11740
A=A-1 // 11741
M=0 // 11742
@SP // 11743
AM=M+1 // 11744
A=A-1 // 11745
M=0 // 11746
// call Output.create
@17 // 11747
D=A // 11748
@14 // 11749
M=D // 11750
@Output.create // 11751
D=A // 11752
@13 // 11753
M=D // 11754
@Output.init.ret.77 // 11755
D=A // 11756
@CALL // 11757
0;JMP // 11758
(Output.init.ret.77)
@SP // 11759
M=M-1 // 11760

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11761
D=A // 11762
@SP // 11763
AM=M+1 // 11764
A=A-1 // 11765
M=D // 11766
@14 // 11767
D=A // 11768
@SP // 11769
AM=M+1 // 11770
A=A-1 // 11771
M=D // 11772
@12 // 11773
D=A // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=D // 11778
@12 // 11779
D=A // 11780
@SP // 11781
AM=M+1 // 11782
A=A-1 // 11783
M=D // 11784
@12 // 11785
D=A // 11786
@SP // 11787
AM=M+1 // 11788
A=A-1 // 11789
M=D // 11790
@12 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796
@12 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802
@12 // 11803
D=A // 11804
@SP // 11805
AM=M+1 // 11806
A=A-1 // 11807
M=D // 11808
@12 // 11809
D=A // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=D // 11814
@30 // 11815
D=A // 11816
@SP // 11817
AM=M+1 // 11818
A=A-1 // 11819
M=D // 11820
@SP // 11821
AM=M+1 // 11822
A=A-1 // 11823
M=0 // 11824
@SP // 11825
AM=M+1 // 11826
A=A-1 // 11827
M=0 // 11828
// call Output.create
@17 // 11829
D=A // 11830
@14 // 11831
M=D // 11832
@Output.create // 11833
D=A // 11834
@13 // 11835
M=D // 11836
@Output.init.ret.78 // 11837
D=A // 11838
@CALL // 11839
0;JMP // 11840
(Output.init.ret.78)
@SP // 11841
M=M-1 // 11842

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11843
D=A // 11844
@SP // 11845
M=D+M // 11846
@109 // 11847
D=A // 11848
@SP // 11849
A=M-1 // 11850
M=0 // 11851
A=A-1 // 11852
M=0 // 11853
A=A-1 // 11854
M=0 // 11855
A=A-1 // 11856
M=D // 11857
A=A-1 // 11858
@29 // 11859
D=A // 11860
@SP // 11861
AM=M+1 // 11862
A=A-1 // 11863
M=D // 11864
@63 // 11865
D=A // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=D // 11870
@43 // 11871
D=A // 11872
@SP // 11873
AM=M+1 // 11874
A=A-1 // 11875
M=D // 11876
@43 // 11877
D=A // 11878
@SP // 11879
AM=M+1 // 11880
A=A-1 // 11881
M=D // 11882
@43 // 11883
D=A // 11884
@SP // 11885
AM=M+1 // 11886
A=A-1 // 11887
M=D // 11888
@43 // 11889
D=A // 11890
@SP // 11891
AM=M+1 // 11892
A=A-1 // 11893
M=D // 11894
@SP // 11895
AM=M+1 // 11896
A=A-1 // 11897
M=0 // 11898
@SP // 11899
AM=M+1 // 11900
A=A-1 // 11901
M=0 // 11902
// call Output.create
@17 // 11903
D=A // 11904
@14 // 11905
M=D // 11906
@Output.create // 11907
D=A // 11908
@13 // 11909
M=D // 11910
@Output.init.ret.79 // 11911
D=A // 11912
@CALL // 11913
0;JMP // 11914
(Output.init.ret.79)
@SP // 11915
M=M-1 // 11916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11917
D=A // 11918
@SP // 11919
M=D+M // 11920
@110 // 11921
D=A // 11922
@SP // 11923
A=M-1 // 11924
M=0 // 11925
A=A-1 // 11926
M=0 // 11927
A=A-1 // 11928
M=0 // 11929
A=A-1 // 11930
M=D // 11931
A=A-1 // 11932
@29 // 11933
D=A // 11934
@SP // 11935
AM=M+1 // 11936
A=A-1 // 11937
M=D // 11938
@51 // 11939
D=A // 11940
@SP // 11941
AM=M+1 // 11942
A=A-1 // 11943
M=D // 11944
@51 // 11945
D=A // 11946
@SP // 11947
AM=M+1 // 11948
A=A-1 // 11949
M=D // 11950
@51 // 11951
D=A // 11952
@SP // 11953
AM=M+1 // 11954
A=A-1 // 11955
M=D // 11956
@51 // 11957
D=A // 11958
@SP // 11959
AM=M+1 // 11960
A=A-1 // 11961
M=D // 11962
@51 // 11963
D=A // 11964
@SP // 11965
AM=M+1 // 11966
A=A-1 // 11967
M=D // 11968
@SP // 11969
AM=M+1 // 11970
A=A-1 // 11971
M=0 // 11972
@SP // 11973
AM=M+1 // 11974
A=A-1 // 11975
M=0 // 11976
// call Output.create
@17 // 11977
D=A // 11978
@14 // 11979
M=D // 11980
@Output.create // 11981
D=A // 11982
@13 // 11983
M=D // 11984
@Output.init.ret.80 // 11985
D=A // 11986
@CALL // 11987
0;JMP // 11988
(Output.init.ret.80)
@SP // 11989
M=M-1 // 11990

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11991
D=A // 11992
@SP // 11993
M=D+M // 11994
@111 // 11995
D=A // 11996
@SP // 11997
A=M-1 // 11998
M=0 // 11999
A=A-1 // 12000
M=0 // 12001
A=A-1 // 12002
M=0 // 12003
A=A-1 // 12004
M=D // 12005
A=A-1 // 12006
@30 // 12007
D=A // 12008
@SP // 12009
AM=M+1 // 12010
A=A-1 // 12011
M=D // 12012
@51 // 12013
D=A // 12014
@SP // 12015
AM=M+1 // 12016
A=A-1 // 12017
M=D // 12018
@51 // 12019
D=A // 12020
@SP // 12021
AM=M+1 // 12022
A=A-1 // 12023
M=D // 12024
@51 // 12025
D=A // 12026
@SP // 12027
AM=M+1 // 12028
A=A-1 // 12029
M=D // 12030
@51 // 12031
D=A // 12032
@SP // 12033
AM=M+1 // 12034
A=A-1 // 12035
M=D // 12036
@30 // 12037
D=A // 12038
@SP // 12039
AM=M+1 // 12040
A=A-1 // 12041
M=D // 12042
@SP // 12043
AM=M+1 // 12044
A=A-1 // 12045
M=0 // 12046
@SP // 12047
AM=M+1 // 12048
A=A-1 // 12049
M=0 // 12050
// call Output.create
@17 // 12051
D=A // 12052
@14 // 12053
M=D // 12054
@Output.create // 12055
D=A // 12056
@13 // 12057
M=D // 12058
@Output.init.ret.81 // 12059
D=A // 12060
@CALL // 12061
0;JMP // 12062
(Output.init.ret.81)
@SP // 12063
M=M-1 // 12064

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12065
D=A // 12066
@SP // 12067
M=D+M // 12068
@112 // 12069
D=A // 12070
@SP // 12071
A=M-1 // 12072
M=0 // 12073
A=A-1 // 12074
M=0 // 12075
A=A-1 // 12076
M=0 // 12077
A=A-1 // 12078
M=D // 12079
A=A-1 // 12080
@30 // 12081
D=A // 12082
@SP // 12083
AM=M+1 // 12084
A=A-1 // 12085
M=D // 12086
@51 // 12087
D=A // 12088
@SP // 12089
AM=M+1 // 12090
A=A-1 // 12091
M=D // 12092
@51 // 12093
D=A // 12094
@SP // 12095
AM=M+1 // 12096
A=A-1 // 12097
M=D // 12098
@51 // 12099
D=A // 12100
@SP // 12101
AM=M+1 // 12102
A=A-1 // 12103
M=D // 12104
@31 // 12105
D=A // 12106
@SP // 12107
AM=M+1 // 12108
A=A-1 // 12109
M=D // 12110
@3 // 12111
D=A // 12112
@SP // 12113
AM=M+1 // 12114
A=A-1 // 12115
M=D // 12116
@3 // 12117
D=A // 12118
@SP // 12119
AM=M+1 // 12120
A=A-1 // 12121
M=D // 12122
@SP // 12123
AM=M+1 // 12124
A=A-1 // 12125
M=0 // 12126
// call Output.create
@17 // 12127
D=A // 12128
@14 // 12129
M=D // 12130
@Output.create // 12131
D=A // 12132
@13 // 12133
M=D // 12134
@Output.init.ret.82 // 12135
D=A // 12136
@CALL // 12137
0;JMP // 12138
(Output.init.ret.82)
@SP // 12139
M=M-1 // 12140

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12141
D=A // 12142
@SP // 12143
M=D+M // 12144
@113 // 12145
D=A // 12146
@SP // 12147
A=M-1 // 12148
M=0 // 12149
A=A-1 // 12150
M=0 // 12151
A=A-1 // 12152
M=0 // 12153
A=A-1 // 12154
M=D // 12155
A=A-1 // 12156
@30 // 12157
D=A // 12158
@SP // 12159
AM=M+1 // 12160
A=A-1 // 12161
M=D // 12162
@51 // 12163
D=A // 12164
@SP // 12165
AM=M+1 // 12166
A=A-1 // 12167
M=D // 12168
@51 // 12169
D=A // 12170
@SP // 12171
AM=M+1 // 12172
A=A-1 // 12173
M=D // 12174
@51 // 12175
D=A // 12176
@SP // 12177
AM=M+1 // 12178
A=A-1 // 12179
M=D // 12180
@62 // 12181
D=A // 12182
@SP // 12183
AM=M+1 // 12184
A=A-1 // 12185
M=D // 12186
@48 // 12187
D=A // 12188
@SP // 12189
AM=M+1 // 12190
A=A-1 // 12191
M=D // 12192
@48 // 12193
D=A // 12194
@SP // 12195
AM=M+1 // 12196
A=A-1 // 12197
M=D // 12198
@SP // 12199
AM=M+1 // 12200
A=A-1 // 12201
M=0 // 12202
// call Output.create
@17 // 12203
D=A // 12204
@14 // 12205
M=D // 12206
@Output.create // 12207
D=A // 12208
@13 // 12209
M=D // 12210
@Output.init.ret.83 // 12211
D=A // 12212
@CALL // 12213
0;JMP // 12214
(Output.init.ret.83)
@SP // 12215
M=M-1 // 12216

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12217
D=A // 12218
@SP // 12219
M=D+M // 12220
@114 // 12221
D=A // 12222
@SP // 12223
A=M-1 // 12224
M=0 // 12225
A=A-1 // 12226
M=0 // 12227
A=A-1 // 12228
M=0 // 12229
A=A-1 // 12230
M=D // 12231
A=A-1 // 12232
@29 // 12233
D=A // 12234
@SP // 12235
AM=M+1 // 12236
A=A-1 // 12237
M=D // 12238
@55 // 12239
D=A // 12240
@SP // 12241
AM=M+1 // 12242
A=A-1 // 12243
M=D // 12244
@51 // 12245
D=A // 12246
@SP // 12247
AM=M+1 // 12248
A=A-1 // 12249
M=D // 12250
@3 // 12251
D=A // 12252
@SP // 12253
AM=M+1 // 12254
A=A-1 // 12255
M=D // 12256
@3 // 12257
D=A // 12258
@SP // 12259
AM=M+1 // 12260
A=A-1 // 12261
M=D // 12262
@7 // 12263
D=A // 12264
@SP // 12265
AM=M+1 // 12266
A=A-1 // 12267
M=D // 12268
@SP // 12269
AM=M+1 // 12270
A=A-1 // 12271
M=0 // 12272
@SP // 12273
AM=M+1 // 12274
A=A-1 // 12275
M=0 // 12276
// call Output.create
@17 // 12277
D=A // 12278
@14 // 12279
M=D // 12280
@Output.create // 12281
D=A // 12282
@13 // 12283
M=D // 12284
@Output.init.ret.84 // 12285
D=A // 12286
@CALL // 12287
0;JMP // 12288
(Output.init.ret.84)
@SP // 12289
M=M-1 // 12290

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12291
D=A // 12292
@SP // 12293
M=D+M // 12294
@115 // 12295
D=A // 12296
@SP // 12297
A=M-1 // 12298
M=0 // 12299
A=A-1 // 12300
M=0 // 12301
A=A-1 // 12302
M=0 // 12303
A=A-1 // 12304
M=D // 12305
A=A-1 // 12306
@30 // 12307
D=A // 12308
@SP // 12309
AM=M+1 // 12310
A=A-1 // 12311
M=D // 12312
@51 // 12313
D=A // 12314
@SP // 12315
AM=M+1 // 12316
A=A-1 // 12317
M=D // 12318
@6 // 12319
D=A // 12320
@SP // 12321
AM=M+1 // 12322
A=A-1 // 12323
M=D // 12324
@24 // 12325
D=A // 12326
@SP // 12327
AM=M+1 // 12328
A=A-1 // 12329
M=D // 12330
@51 // 12331
D=A // 12332
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=D // 12336
@30 // 12337
D=A // 12338
@SP // 12339
AM=M+1 // 12340
A=A-1 // 12341
M=D // 12342
@SP // 12343
AM=M+1 // 12344
A=A-1 // 12345
M=0 // 12346
@SP // 12347
AM=M+1 // 12348
A=A-1 // 12349
M=0 // 12350
// call Output.create
@17 // 12351
D=A // 12352
@14 // 12353
M=D // 12354
@Output.create // 12355
D=A // 12356
@13 // 12357
M=D // 12358
@Output.init.ret.85 // 12359
D=A // 12360
@CALL // 12361
0;JMP // 12362
(Output.init.ret.85)
@SP // 12363
M=M-1 // 12364

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12365
D=A // 12366
@SP // 12367
AM=M+1 // 12368
A=A-1 // 12369
M=D // 12370
@4 // 12371
D=A // 12372
@SP // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=D // 12376
@6 // 12377
D=A // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=D // 12382
@6 // 12383
D=A // 12384
@SP // 12385
AM=M+1 // 12386
A=A-1 // 12387
M=D // 12388
@15 // 12389
D=A // 12390
@SP // 12391
AM=M+1 // 12392
A=A-1 // 12393
M=D // 12394
@6 // 12395
D=A // 12396
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@6 // 12401
D=A // 12402
@SP // 12403
AM=M+1 // 12404
A=A-1 // 12405
M=D // 12406
@6 // 12407
D=A // 12408
@SP // 12409
AM=M+1 // 12410
A=A-1 // 12411
M=D // 12412
@54 // 12413
D=A // 12414
@SP // 12415
AM=M+1 // 12416
A=A-1 // 12417
M=D // 12418
@28 // 12419
D=A // 12420
@SP // 12421
AM=M+1 // 12422
A=A-1 // 12423
M=D // 12424
@SP // 12425
AM=M+1 // 12426
A=A-1 // 12427
M=0 // 12428
@SP // 12429
AM=M+1 // 12430
A=A-1 // 12431
M=0 // 12432
// call Output.create
@17 // 12433
D=A // 12434
@14 // 12435
M=D // 12436
@Output.create // 12437
D=A // 12438
@13 // 12439
M=D // 12440
@Output.init.ret.86 // 12441
D=A // 12442
@CALL // 12443
0;JMP // 12444
(Output.init.ret.86)
@SP // 12445
M=M-1 // 12446

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12447
D=A // 12448
@SP // 12449
M=D+M // 12450
@117 // 12451
D=A // 12452
@SP // 12453
A=M-1 // 12454
M=0 // 12455
A=A-1 // 12456
M=0 // 12457
A=A-1 // 12458
M=0 // 12459
A=A-1 // 12460
M=D // 12461
A=A-1 // 12462
@27 // 12463
D=A // 12464
@SP // 12465
AM=M+1 // 12466
A=A-1 // 12467
M=D // 12468
@27 // 12469
D=A // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@27 // 12475
D=A // 12476
@SP // 12477
AM=M+1 // 12478
A=A-1 // 12479
M=D // 12480
@27 // 12481
D=A // 12482
@SP // 12483
AM=M+1 // 12484
A=A-1 // 12485
M=D // 12486
@27 // 12487
D=A // 12488
@SP // 12489
AM=M+1 // 12490
A=A-1 // 12491
M=D // 12492
@54 // 12493
D=A // 12494
@SP // 12495
AM=M+1 // 12496
A=A-1 // 12497
M=D // 12498
@SP // 12499
AM=M+1 // 12500
A=A-1 // 12501
M=0 // 12502
@SP // 12503
AM=M+1 // 12504
A=A-1 // 12505
M=0 // 12506
// call Output.create
@17 // 12507
D=A // 12508
@14 // 12509
M=D // 12510
@Output.create // 12511
D=A // 12512
@13 // 12513
M=D // 12514
@Output.init.ret.87 // 12515
D=A // 12516
@CALL // 12517
0;JMP // 12518
(Output.init.ret.87)
@SP // 12519
M=M-1 // 12520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12521
D=A // 12522
@SP // 12523
M=D+M // 12524
@118 // 12525
D=A // 12526
@SP // 12527
A=M-1 // 12528
M=0 // 12529
A=A-1 // 12530
M=0 // 12531
A=A-1 // 12532
M=0 // 12533
A=A-1 // 12534
M=D // 12535
A=A-1 // 12536
@51 // 12537
D=A // 12538
@SP // 12539
AM=M+1 // 12540
A=A-1 // 12541
M=D // 12542
@51 // 12543
D=A // 12544
@SP // 12545
AM=M+1 // 12546
A=A-1 // 12547
M=D // 12548
@51 // 12549
D=A // 12550
@SP // 12551
AM=M+1 // 12552
A=A-1 // 12553
M=D // 12554
@51 // 12555
D=A // 12556
@SP // 12557
AM=M+1 // 12558
A=A-1 // 12559
M=D // 12560
@30 // 12561
D=A // 12562
@SP // 12563
AM=M+1 // 12564
A=A-1 // 12565
M=D // 12566
@12 // 12567
D=A // 12568
@SP // 12569
AM=M+1 // 12570
A=A-1 // 12571
M=D // 12572
@SP // 12573
AM=M+1 // 12574
A=A-1 // 12575
M=0 // 12576
@SP // 12577
AM=M+1 // 12578
A=A-1 // 12579
M=0 // 12580
// call Output.create
@17 // 12581
D=A // 12582
@14 // 12583
M=D // 12584
@Output.create // 12585
D=A // 12586
@13 // 12587
M=D // 12588
@Output.init.ret.88 // 12589
D=A // 12590
@CALL // 12591
0;JMP // 12592
(Output.init.ret.88)
@SP // 12593
M=M-1 // 12594

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12595
D=A // 12596
@SP // 12597
M=D+M // 12598
@119 // 12599
D=A // 12600
@SP // 12601
A=M-1 // 12602
M=0 // 12603
A=A-1 // 12604
M=0 // 12605
A=A-1 // 12606
M=0 // 12607
A=A-1 // 12608
M=D // 12609
A=A-1 // 12610
@51 // 12611
D=A // 12612
@SP // 12613
AM=M+1 // 12614
A=A-1 // 12615
M=D // 12616
@51 // 12617
D=A // 12618
@SP // 12619
AM=M+1 // 12620
A=A-1 // 12621
M=D // 12622
@51 // 12623
D=A // 12624
@SP // 12625
AM=M+1 // 12626
A=A-1 // 12627
M=D // 12628
@63 // 12629
D=A // 12630
@SP // 12631
AM=M+1 // 12632
A=A-1 // 12633
M=D // 12634
@63 // 12635
D=A // 12636
@SP // 12637
AM=M+1 // 12638
A=A-1 // 12639
M=D // 12640
@18 // 12641
D=A // 12642
@SP // 12643
AM=M+1 // 12644
A=A-1 // 12645
M=D // 12646
@SP // 12647
AM=M+1 // 12648
A=A-1 // 12649
M=0 // 12650
@SP // 12651
AM=M+1 // 12652
A=A-1 // 12653
M=0 // 12654
// call Output.create
@17 // 12655
D=A // 12656
@14 // 12657
M=D // 12658
@Output.create // 12659
D=A // 12660
@13 // 12661
M=D // 12662
@Output.init.ret.89 // 12663
D=A // 12664
@CALL // 12665
0;JMP // 12666
(Output.init.ret.89)
@SP // 12667
M=M-1 // 12668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12669
D=A // 12670
@SP // 12671
M=D+M // 12672
@120 // 12673
D=A // 12674
@SP // 12675
A=M-1 // 12676
M=0 // 12677
A=A-1 // 12678
M=0 // 12679
A=A-1 // 12680
M=0 // 12681
A=A-1 // 12682
M=D // 12683
A=A-1 // 12684
@51 // 12685
D=A // 12686
@SP // 12687
AM=M+1 // 12688
A=A-1 // 12689
M=D // 12690
@30 // 12691
D=A // 12692
@SP // 12693
AM=M+1 // 12694
A=A-1 // 12695
M=D // 12696
@12 // 12697
D=A // 12698
@SP // 12699
AM=M+1 // 12700
A=A-1 // 12701
M=D // 12702
@12 // 12703
D=A // 12704
@SP // 12705
AM=M+1 // 12706
A=A-1 // 12707
M=D // 12708
@30 // 12709
D=A // 12710
@SP // 12711
AM=M+1 // 12712
A=A-1 // 12713
M=D // 12714
@51 // 12715
D=A // 12716
@SP // 12717
AM=M+1 // 12718
A=A-1 // 12719
M=D // 12720
@SP // 12721
AM=M+1 // 12722
A=A-1 // 12723
M=0 // 12724
@SP // 12725
AM=M+1 // 12726
A=A-1 // 12727
M=0 // 12728
// call Output.create
@17 // 12729
D=A // 12730
@14 // 12731
M=D // 12732
@Output.create // 12733
D=A // 12734
@13 // 12735
M=D // 12736
@Output.init.ret.90 // 12737
D=A // 12738
@CALL // 12739
0;JMP // 12740
(Output.init.ret.90)
@SP // 12741
M=M-1 // 12742

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12743
D=A // 12744
@SP // 12745
M=D+M // 12746
@121 // 12747
D=A // 12748
@SP // 12749
A=M-1 // 12750
M=0 // 12751
A=A-1 // 12752
M=0 // 12753
A=A-1 // 12754
M=0 // 12755
A=A-1 // 12756
M=D // 12757
A=A-1 // 12758
@51 // 12759
D=A // 12760
@SP // 12761
AM=M+1 // 12762
A=A-1 // 12763
M=D // 12764
@51 // 12765
D=A // 12766
@SP // 12767
AM=M+1 // 12768
A=A-1 // 12769
M=D // 12770
@51 // 12771
D=A // 12772
@SP // 12773
AM=M+1 // 12774
A=A-1 // 12775
M=D // 12776
@62 // 12777
D=A // 12778
@SP // 12779
AM=M+1 // 12780
A=A-1 // 12781
M=D // 12782
@48 // 12783
D=A // 12784
@SP // 12785
AM=M+1 // 12786
A=A-1 // 12787
M=D // 12788
@24 // 12789
D=A // 12790
@SP // 12791
AM=M+1 // 12792
A=A-1 // 12793
M=D // 12794
@15 // 12795
D=A // 12796
@SP // 12797
AM=M+1 // 12798
A=A-1 // 12799
M=D // 12800
@SP // 12801
AM=M+1 // 12802
A=A-1 // 12803
M=0 // 12804
// call Output.create
@17 // 12805
D=A // 12806
@14 // 12807
M=D // 12808
@Output.create // 12809
D=A // 12810
@13 // 12811
M=D // 12812
@Output.init.ret.91 // 12813
D=A // 12814
@CALL // 12815
0;JMP // 12816
(Output.init.ret.91)
@SP // 12817
M=M-1 // 12818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12819
D=A // 12820
@SP // 12821
M=D+M // 12822
@122 // 12823
D=A // 12824
@SP // 12825
A=M-1 // 12826
M=0 // 12827
A=A-1 // 12828
M=0 // 12829
A=A-1 // 12830
M=0 // 12831
A=A-1 // 12832
M=D // 12833
A=A-1 // 12834
@63 // 12835
D=A // 12836
@SP // 12837
AM=M+1 // 12838
A=A-1 // 12839
M=D // 12840
@27 // 12841
D=A // 12842
@SP // 12843
AM=M+1 // 12844
A=A-1 // 12845
M=D // 12846
@12 // 12847
D=A // 12848
@SP // 12849
AM=M+1 // 12850
A=A-1 // 12851
M=D // 12852
@6 // 12853
D=A // 12854
@SP // 12855
AM=M+1 // 12856
A=A-1 // 12857
M=D // 12858
@51 // 12859
D=A // 12860
@SP // 12861
AM=M+1 // 12862
A=A-1 // 12863
M=D // 12864
@63 // 12865
D=A // 12866
@SP // 12867
AM=M+1 // 12868
A=A-1 // 12869
M=D // 12870
@SP // 12871
AM=M+1 // 12872
A=A-1 // 12873
M=0 // 12874
@SP // 12875
AM=M+1 // 12876
A=A-1 // 12877
M=0 // 12878
// call Output.create
@17 // 12879
D=A // 12880
@14 // 12881
M=D // 12882
@Output.create // 12883
D=A // 12884
@13 // 12885
M=D // 12886
@Output.init.ret.92 // 12887
D=A // 12888
@CALL // 12889
0;JMP // 12890
(Output.init.ret.92)
@SP // 12891
M=M-1 // 12892

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12893
D=A // 12894
@SP // 12895
AM=M+1 // 12896
A=A-1 // 12897
M=D // 12898
@56 // 12899
D=A // 12900
@SP // 12901
AM=M+1 // 12902
A=A-1 // 12903
M=D // 12904
@12 // 12905
D=A // 12906
@SP // 12907
AM=M+1 // 12908
A=A-1 // 12909
M=D // 12910
@12 // 12911
D=A // 12912
@SP // 12913
AM=M+1 // 12914
A=A-1 // 12915
M=D // 12916
@12 // 12917
D=A // 12918
@SP // 12919
AM=M+1 // 12920
A=A-1 // 12921
M=D // 12922
@7 // 12923
D=A // 12924
@SP // 12925
AM=M+1 // 12926
A=A-1 // 12927
M=D // 12928
@12 // 12929
D=A // 12930
@SP // 12931
AM=M+1 // 12932
A=A-1 // 12933
M=D // 12934
@12 // 12935
D=A // 12936
@SP // 12937
AM=M+1 // 12938
A=A-1 // 12939
M=D // 12940
@12 // 12941
D=A // 12942
@SP // 12943
AM=M+1 // 12944
A=A-1 // 12945
M=D // 12946
@56 // 12947
D=A // 12948
@SP // 12949
AM=M+1 // 12950
A=A-1 // 12951
M=D // 12952
@SP // 12953
AM=M+1 // 12954
A=A-1 // 12955
M=0 // 12956
@SP // 12957
AM=M+1 // 12958
A=A-1 // 12959
M=0 // 12960
// call Output.create
@17 // 12961
D=A // 12962
@14 // 12963
M=D // 12964
@Output.create // 12965
D=A // 12966
@13 // 12967
M=D // 12968
@Output.init.ret.93 // 12969
D=A // 12970
@CALL // 12971
0;JMP // 12972
(Output.init.ret.93)
@SP // 12973
M=M-1 // 12974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12975
D=A // 12976
@SP // 12977
AM=M+1 // 12978
A=A-1 // 12979
M=D // 12980
@12 // 12981
D=A // 12982
@SP // 12983
AM=M+1 // 12984
A=A-1 // 12985
M=D // 12986
@12 // 12987
D=A // 12988
@SP // 12989
AM=M+1 // 12990
A=A-1 // 12991
M=D // 12992
@12 // 12993
D=A // 12994
@SP // 12995
AM=M+1 // 12996
A=A-1 // 12997
M=D // 12998
@12 // 12999
D=A // 13000
@SP // 13001
AM=M+1 // 13002
A=A-1 // 13003
M=D // 13004
@12 // 13005
D=A // 13006
@SP // 13007
AM=M+1 // 13008
A=A-1 // 13009
M=D // 13010
@12 // 13011
D=A // 13012
@SP // 13013
AM=M+1 // 13014
A=A-1 // 13015
M=D // 13016
@12 // 13017
D=A // 13018
@SP // 13019
AM=M+1 // 13020
A=A-1 // 13021
M=D // 13022
@12 // 13023
D=A // 13024
@SP // 13025
AM=M+1 // 13026
A=A-1 // 13027
M=D // 13028
@12 // 13029
D=A // 13030
@SP // 13031
AM=M+1 // 13032
A=A-1 // 13033
M=D // 13034
@SP // 13035
AM=M+1 // 13036
A=A-1 // 13037
M=0 // 13038
@SP // 13039
AM=M+1 // 13040
A=A-1 // 13041
M=0 // 13042
// call Output.create
@17 // 13043
D=A // 13044
@14 // 13045
M=D // 13046
@Output.create // 13047
D=A // 13048
@13 // 13049
M=D // 13050
@Output.init.ret.94 // 13051
D=A // 13052
@CALL // 13053
0;JMP // 13054
(Output.init.ret.94)
@SP // 13055
M=M-1 // 13056

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 13057
D=A // 13058
@SP // 13059
AM=M+1 // 13060
A=A-1 // 13061
M=D // 13062
@7 // 13063
D=A // 13064
@SP // 13065
AM=M+1 // 13066
A=A-1 // 13067
M=D // 13068
@12 // 13069
D=A // 13070
@SP // 13071
AM=M+1 // 13072
A=A-1 // 13073
M=D // 13074
@12 // 13075
D=A // 13076
@SP // 13077
AM=M+1 // 13078
A=A-1 // 13079
M=D // 13080
@12 // 13081
D=A // 13082
@SP // 13083
AM=M+1 // 13084
A=A-1 // 13085
M=D // 13086
@56 // 13087
D=A // 13088
@SP // 13089
AM=M+1 // 13090
A=A-1 // 13091
M=D // 13092
@12 // 13093
D=A // 13094
@SP // 13095
AM=M+1 // 13096
A=A-1 // 13097
M=D // 13098
@12 // 13099
D=A // 13100
@SP // 13101
AM=M+1 // 13102
A=A-1 // 13103
M=D // 13104
@12 // 13105
D=A // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=D // 13110
@7 // 13111
D=A // 13112
@SP // 13113
AM=M+1 // 13114
A=A-1 // 13115
M=D // 13116
@SP // 13117
AM=M+1 // 13118
A=A-1 // 13119
M=0 // 13120
@SP // 13121
AM=M+1 // 13122
A=A-1 // 13123
M=0 // 13124
// call Output.create
@17 // 13125
D=A // 13126
@14 // 13127
M=D // 13128
@Output.create // 13129
D=A // 13130
@13 // 13131
M=D // 13132
@Output.init.ret.95 // 13133
D=A // 13134
@CALL // 13135
0;JMP // 13136
(Output.init.ret.95)
@SP // 13137
M=M-1 // 13138

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13139
D=A // 13140
@SP // 13141
AM=M+1 // 13142
A=A-1 // 13143
M=D // 13144
@38 // 13145
D=A // 13146
@SP // 13147
AM=M+1 // 13148
A=A-1 // 13149
M=D // 13150
@45 // 13151
D=A // 13152
@SP // 13153
AM=M+1 // 13154
A=A-1 // 13155
M=D // 13156
@25 // 13157
D=A // 13158
@SP // 13159
AM=M+1 // 13160
A=A-1 // 13161
M=D // 13162
@SP // 13163
AM=M+1 // 13164
A=A-1 // 13165
M=0 // 13166
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=0 // 13170
@SP // 13171
AM=M+1 // 13172
A=A-1 // 13173
M=0 // 13174
@SP // 13175
AM=M+1 // 13176
A=A-1 // 13177
M=0 // 13178
@SP // 13179
AM=M+1 // 13180
A=A-1 // 13181
M=0 // 13182
@SP // 13183
AM=M+1 // 13184
A=A-1 // 13185
M=0 // 13186
@SP // 13187
AM=M+1 // 13188
A=A-1 // 13189
M=0 // 13190
@SP // 13191
AM=M+1 // 13192
A=A-1 // 13193
M=0 // 13194
// call Output.create
@17 // 13195
D=A // 13196
@14 // 13197
M=D // 13198
@Output.create // 13199
D=A // 13200
@13 // 13201
M=D // 13202
@Output.init.ret.96 // 13203
D=A // 13204
@CALL // 13205
0;JMP // 13206
(Output.init.ret.96)
@SP // 13207
M=M-1 // 13208

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Array.1 // 13209
M=0 // 13210

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Array.2 // 13211
M=0 // 13212

////PushInstruction("constant 0")
@SP // 13213
AM=M+1 // 13214
A=A-1 // 13215
M=0 // 13216
@RETURN // 13217
0;JMP // 13218

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13219
M=M+1 // 13220
AM=M+1 // 13221
A=A-1 // 13222
M=0 // 13223
A=A-1 // 13224
M=0 // 13225

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13226
A=M+1 // 13227
D=M // 13228
@2 // 13229
D=D+A // 13230
@SP // 13231
AM=M+1 // 13232
A=A-1 // 13233
M=D // 13234
D=0 // 13235
@SP // 13236
AM=M-1 // 13237
A=M // 13238
M=D // 13239

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13240
A=M+1 // 13241
D=M // 13242
@3 // 13243
D=D+A // 13244
@SP // 13245
AM=M+1 // 13246
A=A-1 // 13247
M=D // 13248
D=0 // 13249
@SP // 13250
AM=M-1 // 13251
A=M // 13252
M=D // 13253

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
@Memory.add_node.EQ.56 // 13254
D=A // 13255
@SP // 13256
AM=M+1 // 13257
A=A-1 // 13258
M=D // 13259
@ARG // 13260
A=M // 13261
D=M // 13262
@0 // 13263
A=D+A // 13264
D=M // 13265
@DO_EQ // 13266
0;JMP // 13267
(Memory.add_node.EQ.56)
@Memory.add_node$IF_TRUE1 // 13268
D;JNE // 13269

////GotoInstruction{label='Memory.add_node$IF_FALSE1}
// goto Memory.add_node$IF_FALSE1
@Memory.add_node$IF_FALSE1 // 13270
0;JMP // 13271

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
@ARG // 13272
A=M // 13273
D=M // 13274
@SP // 13275
AM=M+1 // 13276
A=A-1 // 13277
M=D // 13278
@ARG // 13279
A=M+1 // 13280
D=M // 13281
@SP // 13282
AM=M-1 // 13283
A=M // 13284
M=D // 13285

////PushInstruction("constant 0")
@SP // 13286
AM=M+1 // 13287
A=A-1 // 13288
M=0 // 13289
@RETURN // 13290
0;JMP // 13291

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

@ARG // 13292
A=M // 13293
D=M // 13294
@0 // 13295
A=D+A // 13296
D=M // 13297
@LCL // 13298
A=M // 13299
M=D // 13300

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13301
A=M+1 // 13302
M=0 // 13303

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
@Memory.add_node.EQ.57 // 13304
D=A // 13305
@SP // 13306
AM=M+1 // 13307
A=A-1 // 13308
M=D // 13309
@LCL // 13310
A=M // 13311
D=M // 13312
@DO_EQ // 13313
0;JMP // 13314
(Memory.add_node.EQ.57)
@SP // 13315
AM=M+1 // 13316
A=A-1 // 13317
M=D // 13318
@SP // 13319
A=M-1 // 13320
M=!D // 13321
@Memory.add_node.GT.58 // 13322
D=A // 13323
@SP // 13324
AM=M+1 // 13325
A=A-1 // 13326
M=D // 13327
@LCL // 13328
A=M // 13329
D=M // 13330
@0 // 13331
A=D+A // 13332
D=M // 13333
@SP // 13334
AM=M+1 // 13335
A=A-1 // 13336
M=D // 13337
@ARG // 13338
A=M+1 // 13339
D=M // 13340
@0 // 13341
A=D+A // 13342
D=M // 13343
@SP // 13344
AM=M-1 // 13345
D=M-D // 13346
@DO_GT // 13347
0;JMP // 13348
(Memory.add_node.GT.58)
D=!D // 13349
@SP // 13350
AM=M-1 // 13351
D=D&M // 13352
D=!D // 13353
@Memory.add_node_WHILE_END1 // 13354
D;JNE // 13355

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13356
A=M // 13357
D=M // 13358
@LCL // 13359
A=M+1 // 13360
M=D // 13361

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

@LCL // 13362
A=M // 13363
D=M // 13364
@3 // 13365
A=D+A // 13366
D=M // 13367
@LCL // 13368
A=M // 13369
M=D // 13370

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13371
0;JMP // 13372

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13373
A=M+1 // 13374
D=!M // 13375
@Memory.add_node$IF_TRUE2 // 13376
D;JNE // 13377

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13378
0;JMP // 13379

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
@ARG // 13380
A=M+1 // 13381
D=M // 13382
@3 // 13383
D=D+A // 13384
@SP // 13385
AM=M+1 // 13386
A=A-1 // 13387
M=D // 13388
@ARG // 13389
A=M // 13390
D=M // 13391
@0 // 13392
A=D+A // 13393
D=M // 13394
@SP // 13395
AM=M-1 // 13396
A=M // 13397
M=D // 13398

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
@ARG // 13399
A=M // 13400
D=M // 13401
@0 // 13402
D=D+A // 13403
@2 // 13404
D=D+A // 13405
@SP // 13406
AM=M+1 // 13407
A=A-1 // 13408
M=D // 13409
@ARG // 13410
A=M+1 // 13411
D=M // 13412
@SP // 13413
AM=M-1 // 13414
A=M // 13415
M=D // 13416

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13417
A=M // 13418
D=M // 13419
@SP // 13420
AM=M+1 // 13421
A=A-1 // 13422
M=D // 13423
@ARG // 13424
A=M+1 // 13425
D=M // 13426
@SP // 13427
AM=M-1 // 13428
A=M // 13429
M=D // 13430

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13431
0;JMP // 13432

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
@ARG // 13433
A=M+1 // 13434
D=M // 13435
@3 // 13436
D=D+A // 13437
@SP // 13438
AM=M+1 // 13439
A=A-1 // 13440
M=D // 13441
@LCL // 13442
A=M // 13443
D=M // 13444
@SP // 13445
AM=M-1 // 13446
A=M // 13447
M=D // 13448

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13449
A=M+1 // 13450
D=M // 13451
@2 // 13452
D=D+A // 13453
@SP // 13454
AM=M+1 // 13455
A=A-1 // 13456
M=D // 13457
@LCL // 13458
A=M+1 // 13459
D=M // 13460
@SP // 13461
AM=M-1 // 13462
A=M // 13463
M=D // 13464

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13465
A=M // 13466
D=M // 13467
@Memory.add_node$IF_TRUE3 // 13468
D;JNE // 13469

////GotoInstruction{label='Memory.add_node$IF_FALSE3}
// goto Memory.add_node$IF_FALSE3
@Memory.add_node$IF_FALSE3 // 13470
0;JMP // 13471

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
@LCL // 13472
A=M // 13473
D=M // 13474
@2 // 13475
D=D+A // 13476
@SP // 13477
AM=M+1 // 13478
A=A-1 // 13479
M=D // 13480
@ARG // 13481
A=M+1 // 13482
D=M // 13483
@SP // 13484
AM=M-1 // 13485
A=M // 13486
M=D // 13487

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
@LCL // 13488
A=M+1 // 13489
D=M // 13490
@3 // 13491
D=D+A // 13492
@SP // 13493
AM=M+1 // 13494
A=A-1 // 13495
M=D // 13496
@ARG // 13497
A=M+1 // 13498
D=M // 13499
@SP // 13500
AM=M-1 // 13501
A=M // 13502
M=D // 13503

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13504
AM=M+1 // 13505
A=A-1 // 13506
M=0 // 13507
@RETURN // 13508
0;JMP // 13509

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13510
D=A // 13511
@SP // 13512
AM=D+M // 13513
A=A-1 // 13514
M=0 // 13515
A=A-1 // 13516
M=0 // 13517
A=A-1 // 13518
M=0 // 13519
A=A-1 // 13520
M=0 // 13521
A=A-1 // 13522
M=0 // 13523

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13524
A=M // 13525
M=0 // 13526

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13527
A=M+1 // 13528
A=A+1 // 13529
D=M // 13530
@LCL // 13531
A=M+1 // 13532
M=D // 13533

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

@ARG // 13534
A=M+1 // 13535
A=A+1 // 13536
D=M // 13537
D=D-1 // 13538
D=-D // 13539
@LCL // 13540
A=M+1 // 13541
A=A+1 // 13542
M=D // 13543

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
@Screen.drawCircle.GT.59 // 13544
D=A // 13545
@SP // 13546
AM=M+1 // 13547
A=A-1 // 13548
M=D // 13549
@LCL // 13550
A=M+1 // 13551
D=M // 13552
A=A-1 // 13553
D=M-D // 13554
@DO_GT // 13555
0;JMP // 13556
(Screen.drawCircle.GT.59)
@Screen.drawCircle_WHILE_END1 // 13557
D;JNE // 13558

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

@ARG // 13559
A=M // 13560
D=M // 13561
@SP // 13562
AM=M+1 // 13563
A=A-1 // 13564
M=D // 13565
@LCL // 13566
A=M // 13567
D=M // 13568
@SP // 13569
AM=M-1 // 13570
D=M-D // 13571
@SP // 13572
AM=M+1 // 13573
A=A-1 // 13574
M=D // 13575
@ARG // 13576
A=M // 13577
D=M // 13578
@SP // 13579
AM=M+1 // 13580
A=A-1 // 13581
M=D // 13582
@LCL // 13583
A=M // 13584
D=M // 13585
@SP // 13586
AM=M-1 // 13587
D=D+M // 13588
@SP // 13589
AM=M+1 // 13590
A=A-1 // 13591
M=D // 13592
@ARG // 13593
A=M+1 // 13594
D=M // 13595
@SP // 13596
AM=M+1 // 13597
A=A-1 // 13598
M=D // 13599
@LCL // 13600
A=M+1 // 13601
D=M // 13602
@SP // 13603
AM=M-1 // 13604
D=D+M // 13605
@SP // 13606
AM=M+1 // 13607
A=A-1 // 13608
M=D // 13609
// call Screen.drawHorizontalLine
@8 // 13610
D=A // 13611
@14 // 13612
M=D // 13613
@Screen.drawHorizontalLine // 13614
D=A // 13615
@13 // 13616
M=D // 13617
@Screen.drawCircle.ret.0 // 13618
D=A // 13619
@CALL // 13620
0;JMP // 13621
(Screen.drawCircle.ret.0)
@SP // 13622
M=M-1 // 13623

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

@ARG // 13624
A=M // 13625
D=M // 13626
@SP // 13627
AM=M+1 // 13628
A=A-1 // 13629
M=D // 13630
@LCL // 13631
A=M // 13632
D=M // 13633
@SP // 13634
AM=M-1 // 13635
D=M-D // 13636
@SP // 13637
AM=M+1 // 13638
A=A-1 // 13639
M=D // 13640
@ARG // 13641
A=M // 13642
D=M // 13643
@SP // 13644
AM=M+1 // 13645
A=A-1 // 13646
M=D // 13647
@LCL // 13648
A=M // 13649
D=M // 13650
@SP // 13651
AM=M-1 // 13652
D=D+M // 13653
@SP // 13654
AM=M+1 // 13655
A=A-1 // 13656
M=D // 13657
@ARG // 13658
A=M+1 // 13659
D=M // 13660
@SP // 13661
AM=M+1 // 13662
A=A-1 // 13663
M=D // 13664
@LCL // 13665
A=M+1 // 13666
D=M // 13667
@SP // 13668
AM=M-1 // 13669
D=M-D // 13670
@SP // 13671
AM=M+1 // 13672
A=A-1 // 13673
M=D // 13674
// call Screen.drawHorizontalLine
@8 // 13675
D=A // 13676
@14 // 13677
M=D // 13678
@Screen.drawHorizontalLine // 13679
D=A // 13680
@13 // 13681
M=D // 13682
@Screen.drawCircle.ret.1 // 13683
D=A // 13684
@CALL // 13685
0;JMP // 13686
(Screen.drawCircle.ret.1)
@SP // 13687
M=M-1 // 13688

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

@ARG // 13689
A=M // 13690
D=M // 13691
@SP // 13692
AM=M+1 // 13693
A=A-1 // 13694
M=D // 13695
@LCL // 13696
A=M+1 // 13697
D=M // 13698
@SP // 13699
AM=M-1 // 13700
D=M-D // 13701
@SP // 13702
AM=M+1 // 13703
A=A-1 // 13704
M=D // 13705
@ARG // 13706
A=M // 13707
D=M // 13708
@SP // 13709
AM=M+1 // 13710
A=A-1 // 13711
M=D // 13712
@LCL // 13713
A=M+1 // 13714
D=M // 13715
@SP // 13716
AM=M-1 // 13717
D=D+M // 13718
@SP // 13719
AM=M+1 // 13720
A=A-1 // 13721
M=D // 13722
@ARG // 13723
A=M+1 // 13724
D=M // 13725
@SP // 13726
AM=M+1 // 13727
A=A-1 // 13728
M=D // 13729
@LCL // 13730
A=M // 13731
D=M // 13732
@SP // 13733
AM=M-1 // 13734
D=D+M // 13735
@SP // 13736
AM=M+1 // 13737
A=A-1 // 13738
M=D // 13739
// call Screen.drawHorizontalLine
@8 // 13740
D=A // 13741
@14 // 13742
M=D // 13743
@Screen.drawHorizontalLine // 13744
D=A // 13745
@13 // 13746
M=D // 13747
@Screen.drawCircle.ret.2 // 13748
D=A // 13749
@CALL // 13750
0;JMP // 13751
(Screen.drawCircle.ret.2)
@SP // 13752
M=M-1 // 13753

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

@ARG // 13754
A=M // 13755
D=M // 13756
@SP // 13757
AM=M+1 // 13758
A=A-1 // 13759
M=D // 13760
@LCL // 13761
A=M+1 // 13762
D=M // 13763
@SP // 13764
AM=M-1 // 13765
D=M-D // 13766
@SP // 13767
AM=M+1 // 13768
A=A-1 // 13769
M=D // 13770
@ARG // 13771
A=M // 13772
D=M // 13773
@SP // 13774
AM=M+1 // 13775
A=A-1 // 13776
M=D // 13777
@LCL // 13778
A=M+1 // 13779
D=M // 13780
@SP // 13781
AM=M-1 // 13782
D=D+M // 13783
@SP // 13784
AM=M+1 // 13785
A=A-1 // 13786
M=D // 13787
@ARG // 13788
A=M+1 // 13789
D=M // 13790
@SP // 13791
AM=M+1 // 13792
A=A-1 // 13793
M=D // 13794
@LCL // 13795
A=M // 13796
D=M // 13797
@SP // 13798
AM=M-1 // 13799
D=M-D // 13800
@SP // 13801
AM=M+1 // 13802
A=A-1 // 13803
M=D // 13804
// call Screen.drawHorizontalLine
@8 // 13805
D=A // 13806
@14 // 13807
M=D // 13808
@Screen.drawHorizontalLine // 13809
D=A // 13810
@13 // 13811
M=D // 13812
@Screen.drawCircle.ret.3 // 13813
D=A // 13814
@CALL // 13815
0;JMP // 13816
(Screen.drawCircle.ret.3)
@SP // 13817
M=M-1 // 13818

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.60 // 13819
D=A // 13820
@SP // 13821
AM=M+1 // 13822
A=A-1 // 13823
M=D // 13824
@LCL // 13825
A=M+1 // 13826
A=A+1 // 13827
D=M // 13828
@DO_LT // 13829
0;JMP // 13830
(Screen.drawCircle.LT.60)
@Screen.drawCircle$IF_TRUE1 // 13831
D;JNE // 13832

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13833
0;JMP // 13834

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

@LCL // 13835
A=M+1 // 13836
A=A+1 // 13837
D=M // 13838
@SP // 13839
AM=M+1 // 13840
A=A-1 // 13841
M=D // 13842
@LCL // 13843
A=M // 13844
D=M // 13845
D=D+M // 13846
@SP // 13847
AM=M-1 // 13848
D=D+M // 13849
@3 // 13850
D=D+A // 13851
@LCL // 13852
A=M+1 // 13853
A=A+1 // 13854
M=D // 13855

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13856
0;JMP // 13857

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

@LCL // 13858
A=M+1 // 13859
A=A+1 // 13860
D=M // 13861
@SP // 13862
AM=M+1 // 13863
A=A-1 // 13864
M=D // 13865
@LCL // 13866
A=M+1 // 13867
D=M // 13868
A=A-1 // 13869
D=M-D // 13870
@R13 // 13871
M=D // 13872
D=D+M // 13873
@SP // 13874
AM=M-1 // 13875
D=D+M // 13876
@5 // 13877
D=D+A // 13878
@LCL // 13879
A=M+1 // 13880
A=A+1 // 13881
M=D // 13882

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

@LCL // 13883
A=M+1 // 13884
M=M-1 // 13885

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

@LCL // 13886
A=M // 13887
M=M+1 // 13888

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13889
0;JMP // 13890

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13891
AM=M+1 // 13892
A=A-1 // 13893
M=0 // 13894
@RETURN // 13895
0;JMP // 13896

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13897
D=A // 13898
@14 // 13899
M=D // 13900
@Memory.init // 13901
D=A // 13902
@13 // 13903
M=D // 13904
@Sys.init.ret.0 // 13905
D=A // 13906
@CALL // 13907
0;JMP // 13908
(Sys.init.ret.0)
@SP // 13909
M=M-1 // 13910

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13911
D=A // 13912
@14 // 13913
M=D // 13914
@Math.init // 13915
D=A // 13916
@13 // 13917
M=D // 13918
@Sys.init.ret.1 // 13919
D=A // 13920
@CALL // 13921
0;JMP // 13922
(Sys.init.ret.1)
@SP // 13923
M=M-1 // 13924

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13925
D=A // 13926
@14 // 13927
M=D // 13928
@Screen.init // 13929
D=A // 13930
@13 // 13931
M=D // 13932
@Sys.init.ret.2 // 13933
D=A // 13934
@CALL // 13935
0;JMP // 13936
(Sys.init.ret.2)
@SP // 13937
M=M-1 // 13938

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13939
D=A // 13940
@14 // 13941
M=D // 13942
@Output.init // 13943
D=A // 13944
@13 // 13945
M=D // 13946
@Sys.init.ret.3 // 13947
D=A // 13948
@CALL // 13949
0;JMP // 13950
(Sys.init.ret.3)
@SP // 13951
M=M-1 // 13952

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13953
D=A // 13954
@14 // 13955
M=D // 13956
@Keyboard.init // 13957
D=A // 13958
@13 // 13959
M=D // 13960
@Sys.init.ret.4 // 13961
D=A // 13962
@CALL // 13963
0;JMP // 13964
(Sys.init.ret.4)
@SP // 13965
M=M-1 // 13966

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13967
D=A // 13968
@14 // 13969
M=D // 13970
@Main.main // 13971
D=A // 13972
@13 // 13973
M=D // 13974
@Sys.init.ret.5 // 13975
D=A // 13976
@CALL // 13977
0;JMP // 13978
(Sys.init.ret.5)
@SP // 13979
M=M-1 // 13980

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13981
D=A // 13982
@14 // 13983
M=D // 13984
@Sys.halt // 13985
D=A // 13986
@13 // 13987
M=D // 13988
@Sys.init.ret.6 // 13989
D=A // 13990
@CALL // 13991
0;JMP // 13992
(Sys.init.ret.6)
@SP // 13993
M=M-1 // 13994

////PushInstruction("constant 0")
@SP // 13995
AM=M+1 // 13996
A=A-1 // 13997
M=0 // 13998
@RETURN // 13999
0;JMP // 14000

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 14001
A=M // 14002
D=M // 14003
@Array.0 // 14004
M=D // 14005

////PushInstruction("constant 0")
@SP // 14006
AM=M+1 // 14007
A=A-1 // 14008
M=0 // 14009
@RETURN // 14010
0;JMP // 14011

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 14012
M=M+1 // 14013
AM=M+1 // 14014
A=A-1 // 14015
M=0 // 14016
A=A-1 // 14017
M=0 // 14018

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14019
A=M // 14020
M=1 // 14021

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14022
A=M+1 // 14023
M=0 // 14024

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 14025
D=A // 14026
@SP // 14027
AM=M+1 // 14028
A=A-1 // 14029
M=D // 14030
// call Array.new
@6 // 14031
D=A // 14032
@14 // 14033
M=D // 14034
@Array.new // 14035
D=A // 14036
@13 // 14037
M=D // 14038
@Math.init.ret.0 // 14039
D=A // 14040
@CALL // 14041
0;JMP // 14042
(Math.init.ret.0)
@SP // 14043
AM=M-1 // 14044
D=M // 14045
@Array.0 // 14046
M=D // 14047

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
@Math.init.LT.61 // 14048
D=A // 14049
@SP // 14050
AM=M+1 // 14051
A=A-1 // 14052
M=D // 14053
@LCL // 14054
A=M+1 // 14055
D=M // 14056
@16 // 14057
D=D-A // 14058
@DO_LT // 14059
0;JMP // 14060
(Math.init.LT.61)
D=!D // 14061
@Math.init_WHILE_END1 // 14062
D;JNE // 14063

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Array.0 // 14064
D=M // 14065
@SP // 14066
AM=M+1 // 14067
A=A-1 // 14068
M=D // 14069
@LCL // 14070
A=M+1 // 14071
D=M // 14072
@SP // 14073
AM=M-1 // 14074
D=D+M // 14075
@SP // 14076
AM=M+1 // 14077
A=A-1 // 14078
M=D // 14079
@LCL // 14080
A=M // 14081
D=M // 14082
@SP // 14083
AM=M-1 // 14084
A=M // 14085
M=D // 14086

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

@LCL // 14087
A=M // 14088
D=M // 14089
@LCL // 14090
A=M // 14091
M=D+M // 14092

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

@LCL // 14093
A=M+1 // 14094
M=M+1 // 14095

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 14096
0;JMP // 14097

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14098
AM=M+1 // 14099
A=A-1 // 14100
M=0 // 14101
@RETURN // 14102
0;JMP // 14103

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 14104
M=M+1 // 14105
AM=M+1 // 14106
A=A-1 // 14107
M=0 // 14108
A=A-1 // 14109
M=0 // 14110

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

@2055 // 14111
D=A // 14112
@LCL // 14113
A=M // 14114
M=D // 14115

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
@LCL // 14116
A=M // 14117
D=M // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122
@LCL // 14123
A=M // 14124
D=M // 14125
@16384 // 14126
D=A-D // 14127
@5 // 14128
D=D-A // 14129
@SP // 14130
AM=M-1 // 14131
A=M // 14132
M=D // 14133

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 14134
A=M // 14135
D=M // 14136
@SP // 14137
AM=M+1 // 14138
A=A-1 // 14139
M=D+1 // 14140
D=1 // 14141
@SP // 14142
AM=M-1 // 14143
A=M // 14144
M=D // 14145

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 14146
A=M // 14147
D=M // 14148
@2 // 14149
D=D+A // 14150
@SP // 14151
AM=M+1 // 14152
A=A-1 // 14153
M=D // 14154
D=0 // 14155
@SP // 14156
AM=M-1 // 14157
A=M // 14158
M=D // 14159

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 14160
A=M // 14161
D=M // 14162
@3 // 14163
D=D+A // 14164
@SP // 14165
AM=M+1 // 14166
A=A-1 // 14167
M=D // 14168
D=0 // 14169
@SP // 14170
AM=M-1 // 14171
A=M // 14172
M=D // 14173

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14174
A=M // 14175
D=M // 14176
@SP // 14177
AM=M+1 // 14178
A=A-1 // 14179
M=D // 14180
// call Memory.create_foot
@6 // 14181
D=A // 14182
@14 // 14183
M=D // 14184
@Memory.create_foot // 14185
D=A // 14186
@13 // 14187
M=D // 14188
@Memory.init.ret.0 // 14189
D=A // 14190
@CALL // 14191
0;JMP // 14192
(Memory.init.ret.0)
@SP // 14193
M=M-1 // 14194

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

@2054 // 14195
D=A // 14196
@SP // 14197
AM=M+1 // 14198
A=A-1 // 14199
M=D // 14200
@2054 // 14201
D=A // 14202
@SP // 14203
AM=M+1 // 14204
A=A-1 // 14205
M=D // 14206
@LCL // 14207
A=M // 14208
D=M // 14209
@SP // 14210
AM=M+1 // 14211
A=A-1 // 14212
M=D // 14213
// call Memory.add_node
@7 // 14214
D=A // 14215
@14 // 14216
M=D // 14217
@Memory.add_node // 14218
D=A // 14219
@13 // 14220
M=D // 14221
@Memory.init.ret.1 // 14222
D=A // 14223
@CALL // 14224
0;JMP // 14225
(Memory.init.ret.1)
@SP // 14226
M=M-1 // 14227

////PushInstruction("constant 0")
@SP // 14228
AM=M+1 // 14229
A=A-1 // 14230
M=0 // 14231
@RETURN // 14232
0;JMP // 14233

