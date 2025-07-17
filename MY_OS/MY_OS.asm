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
@Sys.error.ret.0 // 127
D=A // 128
@CALL // 129
0;JMP // 130
(Sys.error.ret.0)
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

@Output.1 // 179
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
@Output.2 // 187
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

@Output.2 // 197
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

@Output.2 // 201
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
@Screen.0 // 590
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
@Screen.0 // 891
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
@Screen.0 // 1048
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
@Screen.0 // 1294
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
@Output.0 // 1423
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

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 1518
D=M // 1519
@Screen.drawPixel$IF_TRUE1 // 1520
D;JNE // 1521

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 1522
0;JMP // 1523

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
@LCL // 1524
A=M // 1525
D=M // 1526
@SP // 1527
AM=M+1 // 1528
A=A-1 // 1529
M=D // 1530
@LCL // 1531
A=M // 1532
D=M // 1533
@0 // 1534
A=D+A // 1535
D=M // 1536
@SP // 1537
AM=M+1 // 1538
A=A-1 // 1539
M=D // 1540
@LCL // 1541
A=M+1 // 1542
D=M // 1543
@SP // 1544
AM=M+1 // 1545
A=A-1 // 1546
M=D // 1547
// call Math.twoToThe
@6 // 1548
D=A // 1549
@14 // 1550
M=D // 1551
@Math.twoToThe // 1552
D=A // 1553
@13 // 1554
M=D // 1555
@Screen.drawPixel.ret.2 // 1556
D=A // 1557
@CALL // 1558
0;JMP // 1559
(Screen.drawPixel.ret.2)
@SP // 1560
AM=M-1 // 1561
D=M // 1562
@SP // 1563
AM=M-1 // 1564
D=D|M // 1565
@SP // 1566
AM=M-1 // 1567
A=M // 1568
M=D // 1569

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 1570
0;JMP // 1571

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
@LCL // 1572
A=M // 1573
D=M // 1574
@SP // 1575
AM=M+1 // 1576
A=A-1 // 1577
M=D // 1578
@LCL // 1579
A=M // 1580
D=M // 1581
@0 // 1582
A=D+A // 1583
D=M // 1584
@SP // 1585
AM=M+1 // 1586
A=A-1 // 1587
M=D // 1588
@LCL // 1589
A=M+1 // 1590
D=M // 1591
@SP // 1592
AM=M+1 // 1593
A=A-1 // 1594
M=D // 1595
// call Math.twoToThe
@6 // 1596
D=A // 1597
@14 // 1598
M=D // 1599
@Math.twoToThe // 1600
D=A // 1601
@13 // 1602
M=D // 1603
@Screen.drawPixel.ret.3 // 1604
D=A // 1605
@CALL // 1606
0;JMP // 1607
(Screen.drawPixel.ret.3)
@SP // 1608
AM=M-1 // 1609
D=M // 1610
D=!D // 1611
@SP // 1612
AM=M-1 // 1613
D=D&M // 1614
@SP // 1615
AM=M-1 // 1616
A=M // 1617
M=D // 1618

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 1619
AM=M+1 // 1620
A=A-1 // 1621
M=0 // 1622
@RETURN // 1623
0;JMP // 1624

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1625
M=-1 // 1626

////PushInstruction("constant 0")
@SP // 1627
AM=M+1 // 1628
A=A-1 // 1629
M=0 // 1630
@RETURN // 1631
0;JMP // 1632

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.get_best_fit=0}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1633
D=A // 1634
@SP // 1635
AM=D+M // 1636
A=A-1 // 1637
M=0 // 1638
A=A-1 // 1639
M=0 // 1640
A=A-1 // 1641
M=0 // 1642
A=A-1 // 1643
M=0 // 1644
A=A-1 // 1645
M=0 // 1646

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1647
A=M // 1648
D=M // 1649
@SP // 1650
AM=M+1 // 1651
A=A-1 // 1652
M=D // 1653
// call Memory.getBinIndex
@6 // 1654
D=A // 1655
@14 // 1656
M=D // 1657
@Memory.getBinIndex // 1658
D=A // 1659
@13 // 1660
M=D // 1661
@Memory.alloc.ret.0 // 1662
D=A // 1663
@CALL // 1664
0;JMP // 1665
(Memory.alloc.ret.0)
@SP // 1666
AM=M-1 // 1667
D=M // 1668
@LCL // 1669
A=M // 1670
M=D // 1671

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

@LCL // 1672
A=M // 1673
D=M // 1674
@2048 // 1675
D=D+A // 1676
@LCL // 1677
A=M+1 // 1678
M=D // 1679

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1680
A=M+1 // 1681
D=M // 1682
@SP // 1683
AM=M+1 // 1684
A=A-1 // 1685
M=D // 1686
@ARG // 1687
A=M // 1688
D=M // 1689
@SP // 1690
AM=M+1 // 1691
A=A-1 // 1692
M=D // 1693
// call Memory.get_best_fit
@7 // 1694
D=A // 1695
@14 // 1696
M=D // 1697
@Memory.get_best_fit // 1698
D=A // 1699
@13 // 1700
M=D // 1701
@Memory.alloc.ret.1 // 1702
D=A // 1703
@CALL // 1704
0;JMP // 1705
(Memory.alloc.ret.1)
@SP // 1706
AM=M-1 // 1707
D=M // 1708
@LCL // 1709
A=M+1 // 1710
A=A+1 // 1711
M=D // 1712

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
@Memory.alloc.EQ.12 // 1713
D=A // 1714
@SP // 1715
AM=M+1 // 1716
A=A-1 // 1717
M=D // 1718
@LCL // 1719
A=M+1 // 1720
A=A+1 // 1721
D=M // 1722
@DO_EQ // 1723
0;JMP // 1724
(Memory.alloc.EQ.12)
D=!D // 1725
@Memory.alloc_WHILE_END1 // 1726
D;JNE // 1727

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
@Memory.alloc.LT.13 // 1728
D=A // 1729
@SP // 1730
AM=M+1 // 1731
A=A-1 // 1732
M=D // 1733
@LCL // 1734
A=M // 1735
D=M // 1736
D=D+1 // 1737
@7 // 1738
D=D-A // 1739
@DO_LT // 1740
0;JMP // 1741
(Memory.alloc.LT.13)
D=!D // 1742
@Memory.alloc$IF_TRUE1 // 1743
D;JNE // 1744

////GotoInstruction{label='Memory.alloc$IF_FALSE1}
// goto Memory.alloc$IF_FALSE1
@Memory.alloc$IF_FALSE1 // 1745
0;JMP // 1746

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1747
AM=M+1 // 1748
A=A-1 // 1749
M=0 // 1750
@RETURN // 1751
0;JMP // 1752

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

@LCL // 1753
A=M // 1754
M=M+1 // 1755

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

@LCL // 1756
A=M // 1757
D=M // 1758
@2048 // 1759
D=D+A // 1760
@LCL // 1761
A=M+1 // 1762
M=D // 1763

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1764
A=M+1 // 1765
D=M // 1766
@SP // 1767
AM=M+1 // 1768
A=A-1 // 1769
M=D // 1770
@ARG // 1771
A=M // 1772
D=M // 1773
@SP // 1774
AM=M+1 // 1775
A=A-1 // 1776
M=D // 1777
// call Memory.get_best_fit
@7 // 1778
D=A // 1779
@14 // 1780
M=D // 1781
@Memory.get_best_fit // 1782
D=A // 1783
@13 // 1784
M=D // 1785
@Memory.alloc.ret.2 // 1786
D=A // 1787
@CALL // 1788
0;JMP // 1789
(Memory.alloc.ret.2)
@SP // 1790
AM=M-1 // 1791
D=M // 1792
@LCL // 1793
A=M+1 // 1794
A=A+1 // 1795
M=D // 1796

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 1797
0;JMP // 1798

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

@LCL // 1799
A=M+1 // 1800
A=A+1 // 1801
D=M // 1802
@0 // 1803
A=D+A // 1804
D=M // 1805
@SP // 1806
AM=M+1 // 1807
A=A-1 // 1808
M=D // 1809
// call Memory.getBinIndex
@6 // 1810
D=A // 1811
@14 // 1812
M=D // 1813
@Memory.getBinIndex // 1814
D=A // 1815
@13 // 1816
M=D // 1817
@Memory.alloc.ret.3 // 1818
D=A // 1819
@CALL // 1820
0;JMP // 1821
(Memory.alloc.ret.3)
@SP // 1822
AM=M-1 // 1823
D=M // 1824
@2048 // 1825
D=D+A // 1826
@SP // 1827
AM=M+1 // 1828
A=A-1 // 1829
M=D // 1830
@LCL // 1831
A=M+1 // 1832
A=A+1 // 1833
D=M // 1834
@SP // 1835
AM=M+1 // 1836
A=A-1 // 1837
M=D // 1838
// call Memory.remove_node
@7 // 1839
D=A // 1840
@14 // 1841
M=D // 1842
@Memory.remove_node // 1843
D=A // 1844
@13 // 1845
M=D // 1846
@Memory.alloc.ret.4 // 1847
D=A // 1848
@CALL // 1849
0;JMP // 1850
(Memory.alloc.ret.4)
@SP // 1851
M=M-1 // 1852

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

@LCL // 1853
A=M+1 // 1854
A=A+1 // 1855
D=M // 1856
@0 // 1857
A=D+A // 1858
D=M // 1859
@SP // 1860
AM=M+1 // 1861
A=A-1 // 1862
M=D // 1863
@ARG // 1864
A=M // 1865
D=M // 1866
@SP // 1867
AM=M-1 // 1868
D=M-D // 1869
@LCL // 1870
A=M+1 // 1871
A=A+1 // 1872
A=A+1 // 1873
M=D // 1874

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.14 // 1875
D=A // 1876
@SP // 1877
AM=M+1 // 1878
A=A-1 // 1879
M=D // 1880
@LCL // 1881
A=M+1 // 1882
A=A+1 // 1883
A=A+1 // 1884
D=M // 1885
@5 // 1886
D=D-A // 1887
@DO_GT // 1888
0;JMP // 1889
(Memory.alloc.GT.14)
@Memory.alloc$IF_TRUE2 // 1890
D;JNE // 1891

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 1892
0;JMP // 1893

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
@LCL // 1894
A=M+1 // 1895
A=A+1 // 1896
D=M // 1897
@SP // 1898
AM=M+1 // 1899
A=A-1 // 1900
M=D // 1901
@ARG // 1902
A=M // 1903
D=M // 1904
@SP // 1905
AM=M-1 // 1906
A=M // 1907
M=D // 1908

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1909
A=M+1 // 1910
A=A+1 // 1911
D=M // 1912
@SP // 1913
AM=M+1 // 1914
A=A-1 // 1915
M=D+1 // 1916
D=0 // 1917
@SP // 1918
AM=M-1 // 1919
A=M // 1920
M=D // 1921

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1922
A=M+1 // 1923
A=A+1 // 1924
D=M // 1925
@SP // 1926
AM=M+1 // 1927
A=A-1 // 1928
M=D // 1929
// call Memory.create_foot
@6 // 1930
D=A // 1931
@14 // 1932
M=D // 1933
@Memory.create_foot // 1934
D=A // 1935
@13 // 1936
M=D // 1937
@Memory.alloc.ret.5 // 1938
D=A // 1939
@CALL // 1940
0;JMP // 1941
(Memory.alloc.ret.5)
@SP // 1942
M=M-1 // 1943

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

@LCL // 1944
A=M+1 // 1945
A=A+1 // 1946
D=M // 1947
@SP // 1948
AM=M+1 // 1949
A=A-1 // 1950
M=D // 1951
@ARG // 1952
A=M // 1953
D=M // 1954
@SP // 1955
AM=M-1 // 1956
D=D+M // 1957
@5 // 1958
D=D+A // 1959
@SP // 1960
AM=M+1 // 1961
A=A-1 // 1962
M=D // 1963
@LCL // 1964
D=M // 1965
@4 // 1966
A=D+A // 1967
D=A // 1968
@R13 // 1969
M=D // 1970
@SP // 1971
AM=M-1 // 1972
D=M // 1973
@R13 // 1974
A=M // 1975
M=D // 1976

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
@LCL // 1977
D=M // 1978
@4 // 1979
A=D+A // 1980
D=M // 1981
@SP // 1982
AM=M+1 // 1983
A=A-1 // 1984
M=D // 1985
@LCL // 1986
A=M+1 // 1987
A=A+1 // 1988
A=A+1 // 1989
D=M // 1990
@5 // 1991
D=D-A // 1992
@SP // 1993
AM=M-1 // 1994
A=M // 1995
M=D // 1996

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1997
D=M // 1998
@4 // 1999
A=D+A // 2000
D=M // 2001
@SP // 2002
AM=M+1 // 2003
A=A-1 // 2004
M=D+1 // 2005
D=1 // 2006
@SP // 2007
AM=M-1 // 2008
A=M // 2009
M=D // 2010

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2011
D=M // 2012
@4 // 2013
A=D+A // 2014
D=M // 2015
@SP // 2016
AM=M+1 // 2017
A=A-1 // 2018
M=D // 2019
// call Memory.create_foot
@6 // 2020
D=A // 2021
@14 // 2022
M=D // 2023
@Memory.create_foot // 2024
D=A // 2025
@13 // 2026
M=D // 2027
@Memory.alloc.ret.6 // 2028
D=A // 2029
@CALL // 2030
0;JMP // 2031
(Memory.alloc.ret.6)
@SP // 2032
M=M-1 // 2033

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

@LCL // 2034
A=M+1 // 2035
A=A+1 // 2036
A=A+1 // 2037
D=M // 2038
@SP // 2039
AM=M+1 // 2040
A=A-1 // 2041
M=D // 2042
// call Memory.getBinIndex
@6 // 2043
D=A // 2044
@14 // 2045
M=D // 2046
@Memory.getBinIndex // 2047
D=A // 2048
@13 // 2049
M=D // 2050
@Memory.alloc.ret.7 // 2051
D=A // 2052
@CALL // 2053
0;JMP // 2054
(Memory.alloc.ret.7)
@SP // 2055
AM=M-1 // 2056
D=M // 2057
@2048 // 2058
D=D+A // 2059
@SP // 2060
AM=M+1 // 2061
A=A-1 // 2062
M=D // 2063
@LCL // 2064
D=M // 2065
@4 // 2066
A=D+A // 2067
D=M // 2068
@SP // 2069
AM=M+1 // 2070
A=A-1 // 2071
M=D // 2072
// call Memory.add_node
@7 // 2073
D=A // 2074
@14 // 2075
M=D // 2076
@Memory.add_node // 2077
D=A // 2078
@13 // 2079
M=D // 2080
@Memory.alloc.ret.8 // 2081
D=A // 2082
@CALL // 2083
0;JMP // 2084
(Memory.alloc.ret.8)
@SP // 2085
M=M-1 // 2086

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 2087
0;JMP // 2088

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
@LCL // 2089
A=M+1 // 2090
A=A+1 // 2091
D=M // 2092
@SP // 2093
AM=M+1 // 2094
A=A-1 // 2095
M=D+1 // 2096
D=0 // 2097
@SP // 2098
AM=M-1 // 2099
A=M // 2100
M=D // 2101

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2102
A=M+1 // 2103
A=A+1 // 2104
D=M // 2105
@SP // 2106
AM=M+1 // 2107
A=A-1 // 2108
M=D // 2109
// call Memory.create_foot
@6 // 2110
D=A // 2111
@14 // 2112
M=D // 2113
@Memory.create_foot // 2114
D=A // 2115
@13 // 2116
M=D // 2117
@Memory.alloc.ret.9 // 2118
D=A // 2119
@CALL // 2120
0;JMP // 2121
(Memory.alloc.ret.9)
@SP // 2122
M=M-1 // 2123

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
@LCL // 2124
A=M+1 // 2125
A=A+1 // 2126
D=M // 2127
@4 // 2128
D=D+A // 2129
@SP // 2130
AM=M+1 // 2131
A=A-1 // 2132
M=D // 2133
@RETURN // 2134
0;JMP // 2135

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
@ARG // 2136
A=M // 2137
D=M // 2138
@SP // 2139
AM=M+1 // 2140
A=A-1 // 2141
M=D // 2142
@ARG // 2143
A=M // 2144
D=M // 2145
@0 // 2146
A=D+A // 2147
D=M // 2148
@4 // 2149
D=D+A // 2150
@SP // 2151
AM=M-1 // 2152
D=D+M // 2153
@SP // 2154
AM=M+1 // 2155
A=A-1 // 2156
M=D // 2157
@ARG // 2158
A=M // 2159
D=M // 2160
@SP // 2161
AM=M-1 // 2162
A=M // 2163
M=D // 2164

////PushInstruction("constant 0")
@SP // 2165
AM=M+1 // 2166
A=A-1 // 2167
M=0 // 2168
@RETURN // 2169
0;JMP // 2170

////FunctionInstruction{functionName='Array.dispose', numLocals=0, funcMapping={}}
// function Array.dispose with 0
(Array.dispose)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2171
A=M // 2172
D=M // 2173
@3 // 2174
M=D // 2175

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("pointer 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 2176
D=M // 2177
@SP // 2178
AM=M+1 // 2179
A=A-1 // 2180
M=D // 2181
// call Memory.deAlloc
@6 // 2182
D=A // 2183
@14 // 2184
M=D // 2185
@Memory.deAlloc // 2186
D=A // 2187
@13 // 2188
M=D // 2189
@Array.dispose.ret.0 // 2190
D=A // 2191
@CALL // 2192
0;JMP // 2193
(Array.dispose.ret.0)
@SP // 2194
M=M-1 // 2195

////PushInstruction("constant 0")
@SP // 2196
AM=M+1 // 2197
A=A-1 // 2198
M=0 // 2199
@RETURN // 2200
0;JMP // 2201

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2202
A=M // 2203
D=M // 2204
@SP // 2205
AM=M+1 // 2206
A=A-1 // 2207
M=D // 2208
@ARG // 2209
A=M // 2210
D=M // 2211
@SP // 2212
AM=M+1 // 2213
A=A-1 // 2214
M=D // 2215
@SP // 2216
A=M-1 // 2217
M=-D // 2218
// call Math.max
@7 // 2219
D=A // 2220
@14 // 2221
M=D // 2222
@Math.max // 2223
D=A // 2224
@13 // 2225
M=D // 2226
@Math.abs.ret.0 // 2227
D=A // 2228
@CALL // 2229
0;JMP // 2230
(Math.abs.ret.0)
@RETURN // 2231
0;JMP // 2232

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
@Math.0 // 2233
D=M // 2234
@SP // 2235
AM=M+1 // 2236
A=A-1 // 2237
M=D // 2238
@ARG // 2239
A=M // 2240
D=M // 2241
@SP // 2242
AM=M-1 // 2243
A=D+M // 2244
D=M // 2245
@SP // 2246
AM=M+1 // 2247
A=A-1 // 2248
M=D // 2249
@RETURN // 2250
0;JMP // 2251

////FunctionInstruction{functionName='Array.new', numLocals=0, funcMapping={Array.dispose=1}}
// function Array.new with 0
(Array.new)

////CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
@ARG // 2252
A=M // 2253
D=M // 2254
@SP // 2255
AM=M+1 // 2256
A=A-1 // 2257
M=D // 2258
// call Memory.alloc
@6 // 2259
D=A // 2260
@14 // 2261
M=D // 2262
@Memory.alloc // 2263
D=A // 2264
@13 // 2265
M=D // 2266
@Array.new.ret.0 // 2267
D=A // 2268
@CALL // 2269
0;JMP // 2270
(Array.new.ret.0)
@RETURN // 2271
0;JMP // 2272

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2273
M=M+1 // 2274
AM=M+1 // 2275
A=A-1 // 2276
M=0 // 2277
A=A-1 // 2278
M=0 // 2279

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2280
A=M // 2281
M=0 // 2282

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2283
A=M // 2284
D=M // 2285
@SP // 2286
AM=M+1 // 2287
A=A-1 // 2288
M=D // 2289
// call String.length
@6 // 2290
D=A // 2291
@14 // 2292
M=D // 2293
@String.length // 2294
D=A // 2295
@13 // 2296
M=D // 2297
@Output.printString.ret.0 // 2298
D=A // 2299
@CALL // 2300
0;JMP // 2301
(Output.printString.ret.0)
@SP // 2302
AM=M-1 // 2303
D=M // 2304
@LCL // 2305
A=M+1 // 2306
M=D // 2307

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
@Output.printString.LT.15 // 2308
D=A // 2309
@SP // 2310
AM=M+1 // 2311
A=A-1 // 2312
M=D // 2313
@LCL // 2314
A=M+1 // 2315
D=M // 2316
A=A-1 // 2317
D=M-D // 2318
@DO_LT // 2319
0;JMP // 2320
(Output.printString.LT.15)
D=!D // 2321
@Output.printString_WHILE_END1 // 2322
D;JNE // 2323

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2324
A=M // 2325
D=M // 2326
@SP // 2327
AM=M+1 // 2328
A=A-1 // 2329
M=D // 2330
@LCL // 2331
A=M // 2332
D=M // 2333
@SP // 2334
AM=M+1 // 2335
A=A-1 // 2336
M=D // 2337
// call String.charAt
@7 // 2338
D=A // 2339
@14 // 2340
M=D // 2341
@String.charAt // 2342
D=A // 2343
@13 // 2344
M=D // 2345
@Output.printString.ret.1 // 2346
D=A // 2347
@CALL // 2348
0;JMP // 2349
(Output.printString.ret.1)
// call Output.printChar
@6 // 2350
D=A // 2351
@14 // 2352
M=D // 2353
@Output.printChar // 2354
D=A // 2355
@13 // 2356
M=D // 2357
@Output.printString.ret.2 // 2358
D=A // 2359
@CALL // 2360
0;JMP // 2361
(Output.printString.ret.2)
@SP // 2362
M=M-1 // 2363

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

@LCL // 2364
A=M // 2365
M=M+1 // 2366

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2367
0;JMP // 2368

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2369
AM=M+1 // 2370
A=A-1 // 2371
M=0 // 2372
@RETURN // 2373
0;JMP // 2374

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2375
AM=M+1 // 2376
A=A-1 // 2377
M=0 // 2378

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2379
D=A // 2380
@SP // 2381
AM=M+1 // 2382
A=A-1 // 2383
M=D // 2384
// call Array.new
@6 // 2385
D=A // 2386
@14 // 2387
M=D // 2388
@Array.new // 2389
D=A // 2390
@13 // 2391
M=D // 2392
@Output.create.ret.0 // 2393
D=A // 2394
@CALL // 2395
0;JMP // 2396
(Output.create.ret.0)
@SP // 2397
AM=M-1 // 2398
D=M // 2399
@LCL // 2400
A=M // 2401
M=D // 2402

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 2403
D=M // 2404
@SP // 2405
AM=M+1 // 2406
A=A-1 // 2407
M=D // 2408
@ARG // 2409
A=M // 2410
D=M // 2411
@SP // 2412
AM=M-1 // 2413
D=D+M // 2414
@SP // 2415
AM=M+1 // 2416
A=A-1 // 2417
M=D // 2418
@LCL // 2419
A=M // 2420
D=M // 2421
@SP // 2422
AM=M-1 // 2423
A=M // 2424
M=D // 2425

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2426
A=M // 2427
D=M // 2428
@SP // 2429
AM=M+1 // 2430
A=A-1 // 2431
M=D // 2432
@ARG // 2433
A=M+1 // 2434
D=M // 2435
@SP // 2436
AM=M-1 // 2437
A=M // 2438
M=D // 2439

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2440
A=M // 2441
D=M // 2442
@SP // 2443
AM=M+1 // 2444
A=A-1 // 2445
M=D+1 // 2446
@ARG // 2447
A=M+1 // 2448
A=A+1 // 2449
D=M // 2450
@SP // 2451
AM=M-1 // 2452
A=M // 2453
M=D // 2454

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2455
A=M // 2456
D=M // 2457
@2 // 2458
D=D+A // 2459
@SP // 2460
AM=M+1 // 2461
A=A-1 // 2462
M=D // 2463
@ARG // 2464
A=M+1 // 2465
A=A+1 // 2466
A=A+1 // 2467
D=M // 2468
@SP // 2469
AM=M-1 // 2470
A=M // 2471
M=D // 2472

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2473
A=M // 2474
D=M // 2475
@3 // 2476
D=D+A // 2477
@SP // 2478
AM=M+1 // 2479
A=A-1 // 2480
M=D // 2481
@ARG // 2482
D=M // 2483
@4 // 2484
A=D+A // 2485
D=M // 2486
@SP // 2487
AM=M-1 // 2488
A=M // 2489
M=D // 2490

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2491
A=M // 2492
D=M // 2493
@4 // 2494
D=D+A // 2495
@SP // 2496
AM=M+1 // 2497
A=A-1 // 2498
M=D // 2499
@ARG // 2500
D=M // 2501
@5 // 2502
A=D+A // 2503
D=M // 2504
@SP // 2505
AM=M-1 // 2506
A=M // 2507
M=D // 2508

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2509
A=M // 2510
D=M // 2511
@5 // 2512
D=D+A // 2513
@SP // 2514
AM=M+1 // 2515
A=A-1 // 2516
M=D // 2517
@ARG // 2518
D=M // 2519
@6 // 2520
A=D+A // 2521
D=M // 2522
@SP // 2523
AM=M-1 // 2524
A=M // 2525
M=D // 2526

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2527
A=M // 2528
D=M // 2529
@6 // 2530
D=D+A // 2531
@SP // 2532
AM=M+1 // 2533
A=A-1 // 2534
M=D // 2535
@ARG // 2536
D=M // 2537
@7 // 2538
A=D+A // 2539
D=M // 2540
@SP // 2541
AM=M-1 // 2542
A=M // 2543
M=D // 2544

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2545
A=M // 2546
D=M // 2547
@7 // 2548
D=D+A // 2549
@SP // 2550
AM=M+1 // 2551
A=A-1 // 2552
M=D // 2553
@ARG // 2554
D=M // 2555
@8 // 2556
A=D+A // 2557
D=M // 2558
@SP // 2559
AM=M-1 // 2560
A=M // 2561
M=D // 2562

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2563
A=M // 2564
D=M // 2565
@8 // 2566
D=D+A // 2567
@SP // 2568
AM=M+1 // 2569
A=A-1 // 2570
M=D // 2571
@ARG // 2572
D=M // 2573
@9 // 2574
A=D+A // 2575
D=M // 2576
@SP // 2577
AM=M-1 // 2578
A=M // 2579
M=D // 2580

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2581
A=M // 2582
D=M // 2583
@9 // 2584
D=D+A // 2585
@SP // 2586
AM=M+1 // 2587
A=A-1 // 2588
M=D // 2589
@ARG // 2590
D=M // 2591
@10 // 2592
A=D+A // 2593
D=M // 2594
@SP // 2595
AM=M-1 // 2596
A=M // 2597
M=D // 2598

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2599
A=M // 2600
D=M // 2601
@10 // 2602
D=D+A // 2603
@SP // 2604
AM=M+1 // 2605
A=A-1 // 2606
M=D // 2607
@ARG // 2608
D=M // 2609
@11 // 2610
A=D+A // 2611
D=M // 2612
@SP // 2613
AM=M-1 // 2614
A=M // 2615
M=D // 2616

////PushInstruction("constant 0")
@SP // 2617
AM=M+1 // 2618
A=A-1 // 2619
M=0 // 2620
@RETURN // 2621
0;JMP // 2622

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2623
A=M // 2624
D=M // 2625
@3 // 2626
M=D // 2627

////PushInstruction("this 1")
@THIS // 2628
A=M+1 // 2629
D=M // 2630
@SP // 2631
AM=M+1 // 2632
A=A-1 // 2633
M=D // 2634
@RETURN // 2635
0;JMP // 2636

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2637
D=A // 2638
@SP // 2639
AM=M+1 // 2640
A=A-1 // 2641
M=D // 2642
// call Memory.alloc
@6 // 2643
D=A // 2644
@14 // 2645
M=D // 2646
@Memory.alloc // 2647
D=A // 2648
@13 // 2649
M=D // 2650
@String.new.ret.0 // 2651
D=A // 2652
@CALL // 2653
0;JMP // 2654
(String.new.ret.0)
@SP // 2655
AM=M-1 // 2656
D=M // 2657
@3 // 2658
M=D // 2659

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.16 // 2660
D=A // 2661
@SP // 2662
AM=M+1 // 2663
A=A-1 // 2664
M=D // 2665
@ARG // 2666
A=M // 2667
D=M // 2668
@DO_EQ // 2669
0;JMP // 2670
(String.new.EQ.16)
@String.new$IF_TRUE1 // 2671
D;JNE // 2672

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2673
0;JMP // 2674

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2675
A=M // 2676
M=0 // 2677

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2678
0;JMP // 2679

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2680
A=M // 2681
D=M // 2682
@SP // 2683
AM=M+1 // 2684
A=A-1 // 2685
M=D // 2686
// call Array.new
@6 // 2687
D=A // 2688
@14 // 2689
M=D // 2690
@Array.new // 2691
D=A // 2692
@13 // 2693
M=D // 2694
@String.new.ret.1 // 2695
D=A // 2696
@CALL // 2697
0;JMP // 2698
(String.new.ret.1)
@SP // 2699
AM=M-1 // 2700
D=M // 2701
@THIS // 2702
A=M // 2703
M=D // 2704

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2705
A=M // 2706
D=M // 2707
@THIS // 2708
A=M+1 // 2709
A=A+1 // 2710
M=D // 2711

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2712
A=M+1 // 2713
M=0 // 2714

////PushInstruction("pointer 0")
@3 // 2715
D=M // 2716
@SP // 2717
AM=M+1 // 2718
A=A-1 // 2719
M=D // 2720
@RETURN // 2721
0;JMP // 2722

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2723
D=A // 2724
@SP // 2725
AM=D+M // 2726
A=A-1 // 2727
M=0 // 2728
A=A-1 // 2729
M=0 // 2730
A=A-1 // 2731
M=0 // 2732

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
@Math.multiply.EQ.17 // 2733
D=A // 2734
@SP // 2735
AM=M+1 // 2736
A=A-1 // 2737
M=D // 2738
@ARG // 2739
A=M // 2740
D=M // 2741
@DO_EQ // 2742
0;JMP // 2743
(Math.multiply.EQ.17)
@SP // 2744
AM=M+1 // 2745
A=A-1 // 2746
M=D // 2747
@Math.multiply.EQ.18 // 2748
D=A // 2749
@SP // 2750
AM=M+1 // 2751
A=A-1 // 2752
M=D // 2753
@ARG // 2754
A=M+1 // 2755
D=M // 2756
@DO_EQ // 2757
0;JMP // 2758
(Math.multiply.EQ.18)
@SP // 2759
AM=M-1 // 2760
D=D|M // 2761
@Math.multiply$IF_TRUE1 // 2762
D;JNE // 2763

////GotoInstruction{label='Math.multiply$IF_FALSE1}
// goto Math.multiply$IF_FALSE1
@Math.multiply$IF_FALSE1 // 2764
0;JMP // 2765

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2766
AM=M+1 // 2767
A=A-1 // 2768
M=0 // 2769
@RETURN // 2770
0;JMP // 2771

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
@Math.multiply.EQ.19 // 2772
D=A // 2773
@SP // 2774
AM=M+1 // 2775
A=A-1 // 2776
M=D // 2777
@ARG // 2778
A=M // 2779
D=M // 2780
D=D-1 // 2781
@DO_EQ // 2782
0;JMP // 2783
(Math.multiply.EQ.19)
@Math.multiply$IF_TRUE2 // 2784
D;JNE // 2785

////GotoInstruction{label='Math.multiply$IF_FALSE2}
// goto Math.multiply$IF_FALSE2
@Math.multiply$IF_FALSE2 // 2786
0;JMP // 2787

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2788
A=M+1 // 2789
D=M // 2790
@SP // 2791
AM=M+1 // 2792
A=A-1 // 2793
M=D // 2794
@RETURN // 2795
0;JMP // 2796

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
@Math.multiply.EQ.20 // 2797
D=A // 2798
@SP // 2799
AM=M+1 // 2800
A=A-1 // 2801
M=D // 2802
@ARG // 2803
A=M+1 // 2804
D=M // 2805
D=D-1 // 2806
@DO_EQ // 2807
0;JMP // 2808
(Math.multiply.EQ.20)
@Math.multiply$IF_TRUE3 // 2809
D;JNE // 2810

////GotoInstruction{label='Math.multiply$IF_FALSE3}
// goto Math.multiply$IF_FALSE3
@Math.multiply$IF_FALSE3 // 2811
0;JMP // 2812

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2813
A=M // 2814
D=M // 2815
@SP // 2816
AM=M+1 // 2817
A=A-1 // 2818
M=D // 2819
@RETURN // 2820
0;JMP // 2821

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
@Math.multiply.EQ.21 // 2822
D=A // 2823
@SP // 2824
AM=M+1 // 2825
A=A-1 // 2826
M=D // 2827
@ARG // 2828
A=M // 2829
D=M // 2830
@2 // 2831
D=D-A // 2832
@DO_EQ // 2833
0;JMP // 2834
(Math.multiply.EQ.21)
@Math.multiply$IF_TRUE4 // 2835
D;JNE // 2836

////GotoInstruction{label='Math.multiply$IF_FALSE4}
// goto Math.multiply$IF_FALSE4
@Math.multiply$IF_FALSE4 // 2837
0;JMP // 2838

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
@ARG // 2839
A=M+1 // 2840
D=M // 2841
D=D+M // 2842
@SP // 2843
AM=M+1 // 2844
A=A-1 // 2845
M=D // 2846
@RETURN // 2847
0;JMP // 2848

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
@Math.multiply.EQ.22 // 2849
D=A // 2850
@SP // 2851
AM=M+1 // 2852
A=A-1 // 2853
M=D // 2854
@ARG // 2855
A=M+1 // 2856
D=M // 2857
@2 // 2858
D=D-A // 2859
@DO_EQ // 2860
0;JMP // 2861
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE5 // 2862
D;JNE // 2863

////GotoInstruction{label='Math.multiply$IF_FALSE5}
// goto Math.multiply$IF_FALSE5
@Math.multiply$IF_FALSE5 // 2864
0;JMP // 2865

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
@ARG // 2866
A=M // 2867
D=M // 2868
D=D+M // 2869
@SP // 2870
AM=M+1 // 2871
A=A-1 // 2872
M=D // 2873
@RETURN // 2874
0;JMP // 2875

////LabelInstruction{label='Math.multiply$IF_FALSE5}
// label Math.multiply$IF_FALSE5
(Math.multiply$IF_FALSE5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2876
A=M+1 // 2877
A=A+1 // 2878
M=1 // 2879

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2880
A=M+1 // 2881
M=0 // 2882

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2883
A=M // 2884
M=0 // 2885

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
@Math.multiply.LT.23 // 2886
D=A // 2887
@SP // 2888
AM=M+1 // 2889
A=A-1 // 2890
M=D // 2891
@LCL // 2892
A=M+1 // 2893
D=M // 2894
@16 // 2895
D=D-A // 2896
@DO_LT // 2897
0;JMP // 2898
(Math.multiply.LT.23)
D=!D // 2899
@Math.multiply_WHILE_END1 // 2900
D;JNE // 2901

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
@Math.multiply.EQ.24 // 2902
D=A // 2903
@SP // 2904
AM=M+1 // 2905
A=A-1 // 2906
M=D // 2907
@ARG // 2908
A=M+1 // 2909
D=M // 2910
@SP // 2911
AM=M+1 // 2912
A=A-1 // 2913
M=D // 2914
@LCL // 2915
A=M+1 // 2916
A=A+1 // 2917
D=M // 2918
@SP // 2919
AM=M-1 // 2920
D=D&M // 2921
@DO_EQ // 2922
0;JMP // 2923
(Math.multiply.EQ.24)
D=!D // 2924
@Math.multiply$IF_TRUE6 // 2925
D;JNE // 2926

////GotoInstruction{label='Math.multiply$IF_FALSE6}
// goto Math.multiply$IF_FALSE6
@Math.multiply$IF_FALSE6 // 2927
0;JMP // 2928

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

@ARG // 2929
A=M // 2930
D=M // 2931
@LCL // 2932
A=M // 2933
M=D+M // 2934

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

@ARG // 2935
A=M // 2936
D=M // 2937
@ARG // 2938
A=M // 2939
M=D+M // 2940

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

@LCL // 2941
A=M+1 // 2942
M=M+1 // 2943

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

@LCL // 2944
A=M+1 // 2945
A=A+1 // 2946
D=M // 2947
@LCL // 2948
A=M+1 // 2949
A=A+1 // 2950
M=D+M // 2951

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 2952
0;JMP // 2953

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 2954
A=M // 2955
D=M // 2956
@SP // 2957
AM=M+1 // 2958
A=A-1 // 2959
M=D // 2960
@RETURN // 2961
0;JMP // 2962

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2963
AM=M+1 // 2964
A=A-1 // 2965
M=0 // 2966

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2967
A=M // 2968
M=0 // 2969

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
@Memory.getBinIndex.LT.25 // 2970
D=A // 2971
@SP // 2972
AM=M+1 // 2973
A=A-1 // 2974
M=D // 2975
@LCL // 2976
A=M // 2977
D=M // 2978
@7 // 2979
D=D-A // 2980
@DO_LT // 2981
0;JMP // 2982
(Memory.getBinIndex.LT.25)
@SP // 2983
AM=M+1 // 2984
A=A-1 // 2985
M=D // 2986
@Memory.getBinIndex.EQ.26 // 2987
D=A // 2988
@SP // 2989
AM=M+1 // 2990
A=A-1 // 2991
M=D // 2992
@LCL // 2993
A=M // 2994
D=M // 2995
@2048 // 2996
A=D+A // 2997
D=M // 2998
@DO_EQ // 2999
0;JMP // 3000
(Memory.getBinIndex.EQ.26)
D=!D // 3001
@SP // 3002
AM=M-1 // 3003
D=D&M // 3004
D=!D // 3005
@Memory.getBinIndex_WHILE_END1 // 3006
D;JNE // 3007

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
@Memory.getBinIndex.GT.27 // 3008
D=A // 3009
@SP // 3010
AM=M+1 // 3011
A=A-1 // 3012
M=D // 3013
@ARG // 3014
A=M // 3015
D=M // 3016
@SP // 3017
AM=M+1 // 3018
A=A-1 // 3019
M=D // 3020
@LCL // 3021
A=M // 3022
D=M // 3023
@SP // 3024
AM=M+1 // 3025
A=A-1 // 3026
M=D+1 // 3027
@16 // 3028
D=A // 3029
@SP // 3030
AM=M+1 // 3031
A=A-1 // 3032
M=D // 3033
// call Math.multiply
@7 // 3034
D=A // 3035
@14 // 3036
M=D // 3037
@Math.multiply // 3038
D=A // 3039
@13 // 3040
M=D // 3041
@Memory.getBinIndex.ret.0 // 3042
D=A // 3043
@CALL // 3044
0;JMP // 3045
(Memory.getBinIndex.ret.0)
@SP // 3046
AM=M-1 // 3047
D=M // 3048
@SP // 3049
AM=M-1 // 3050
D=M-D // 3051
@DO_GT // 3052
0;JMP // 3053
(Memory.getBinIndex.GT.27)
D=!D // 3054
@Memory.getBinIndex$IF_TRUE1 // 3055
D;JNE // 3056

////GotoInstruction{label='Memory.getBinIndex$IF_FALSE1}
// goto Memory.getBinIndex$IF_FALSE1
@Memory.getBinIndex$IF_FALSE1 // 3057
0;JMP // 3058

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 3059
A=M // 3060
D=M // 3061
@SP // 3062
AM=M+1 // 3063
A=A-1 // 3064
M=D // 3065
@RETURN // 3066
0;JMP // 3067

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

@LCL // 3068
A=M // 3069
M=M+1 // 3070

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 3071
0;JMP // 3072

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
@6 // 3073
D=A // 3074
@SP // 3075
AM=M+1 // 3076
A=A-1 // 3077
M=D // 3078
@7 // 3079
D=A // 3080
@SP // 3081
AM=M+1 // 3082
A=A-1 // 3083
M=D-1 // 3084
@RETURN // 3085
0;JMP // 3086

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3087
A=M // 3088
D=M // 3089
@3 // 3090
M=D // 3091

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
@THIS // 3092
A=M // 3093
D=M // 3094
@SP // 3095
AM=M+1 // 3096
A=A-1 // 3097
M=D // 3098
@ARG // 3099
A=M+1 // 3100
D=M // 3101
@SP // 3102
AM=M-1 // 3103
A=D+M // 3104
D=M // 3105
@SP // 3106
AM=M+1 // 3107
A=A-1 // 3108
M=D // 3109
@RETURN // 3110
0;JMP // 3111

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3112
D=A // 3113
@SP // 3114
AM=D+M // 3115
A=A-1 // 3116
M=0 // 3117
A=A-1 // 3118
M=0 // 3119
A=A-1 // 3120
M=0 // 3121

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

@ARG // 3122
A=M // 3123
D=M // 3124
@4 // 3125
D=D-A // 3126
@LCL // 3127
A=M // 3128
M=D // 3129

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3130
A=M // 3131
D=M // 3132
@SP // 3133
AM=M+1 // 3134
A=A-1 // 3135
M=D+1 // 3136
D=1 // 3137
@SP // 3138
AM=M-1 // 3139
A=M // 3140
M=D // 3141

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

@LCL // 3142
A=M // 3143
D=M // 3144
@2 // 3145
A=D+A // 3146
D=M // 3147
@LCL // 3148
A=M+1 // 3149
M=D // 3150

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

@LCL // 3151
A=M // 3152
D=M // 3153
@3 // 3154
A=D+A // 3155
D=M // 3156
@LCL // 3157
A=M+1 // 3158
A=A+1 // 3159
M=D // 3160

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.28 // 3161
D=A // 3162
@SP // 3163
AM=M+1 // 3164
A=A-1 // 3165
M=D // 3166
@LCL // 3167
A=M+1 // 3168
D=M // 3169
@DO_EQ // 3170
0;JMP // 3171
(Memory.deAlloc.EQ.28)
D=!D // 3172
@Memory.deAlloc$IF_TRUE1 // 3173
D;JNE // 3174

////GotoInstruction{label='Memory.deAlloc$IF_FALSE1}
// goto Memory.deAlloc$IF_FALSE1
@Memory.deAlloc$IF_FALSE1 // 3175
0;JMP // 3176

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
@Memory.deAlloc.EQ.29 // 3177
D=A // 3178
@SP // 3179
AM=M+1 // 3180
A=A-1 // 3181
M=D // 3182
@LCL // 3183
A=M+1 // 3184
D=M // 3185
A=D+1 // 3186
D=M // 3187
D=D-1 // 3188
@DO_EQ // 3189
0;JMP // 3190
(Memory.deAlloc.EQ.29)
@Memory.deAlloc$IF_TRUE2 // 3191
D;JNE // 3192

////GotoInstruction{label='Memory.deAlloc$IF_FALSE2}
// goto Memory.deAlloc$IF_FALSE2
@Memory.deAlloc$IF_FALSE2 // 3193
0;JMP // 3194

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

@LCL // 3195
A=M+1 // 3196
D=M // 3197
@0 // 3198
A=D+A // 3199
D=M // 3200
@SP // 3201
AM=M+1 // 3202
A=A-1 // 3203
M=D // 3204
// call Memory.getBinIndex
@6 // 3205
D=A // 3206
@14 // 3207
M=D // 3208
@Memory.getBinIndex // 3209
D=A // 3210
@13 // 3211
M=D // 3212
@Memory.deAlloc.ret.0 // 3213
D=A // 3214
@CALL // 3215
0;JMP // 3216
(Memory.deAlloc.ret.0)
@SP // 3217
AM=M-1 // 3218
D=M // 3219
@2048 // 3220
D=D+A // 3221
@SP // 3222
AM=M+1 // 3223
A=A-1 // 3224
M=D // 3225
@LCL // 3226
A=M+1 // 3227
D=M // 3228
@SP // 3229
AM=M+1 // 3230
A=A-1 // 3231
M=D // 3232
// call Memory.remove_node
@7 // 3233
D=A // 3234
@14 // 3235
M=D // 3236
@Memory.remove_node // 3237
D=A // 3238
@13 // 3239
M=D // 3240
@Memory.deAlloc.ret.1 // 3241
D=A // 3242
@CALL // 3243
0;JMP // 3244
(Memory.deAlloc.ret.1)
@SP // 3245
M=M-1 // 3246

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
@LCL // 3247
A=M+1 // 3248
D=M // 3249
@SP // 3250
AM=M+1 // 3251
A=A-1 // 3252
M=D // 3253
@LCL // 3254
A=M+1 // 3255
D=M // 3256
@0 // 3257
A=D+A // 3258
D=M // 3259
@SP // 3260
AM=M+1 // 3261
A=A-1 // 3262
M=D // 3263
@LCL // 3264
A=M // 3265
D=M // 3266
@0 // 3267
A=D+A // 3268
D=M // 3269
@SP // 3270
AM=M-1 // 3271
D=D+M // 3272
@5 // 3273
D=D+A // 3274
@SP // 3275
AM=M-1 // 3276
A=M // 3277
M=D // 3278

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3279
A=M+1 // 3280
D=M // 3281
@SP // 3282
AM=M+1 // 3283
A=A-1 // 3284
M=D // 3285
// call Memory.create_foot
@6 // 3286
D=A // 3287
@14 // 3288
M=D // 3289
@Memory.create_foot // 3290
D=A // 3291
@13 // 3292
M=D // 3293
@Memory.deAlloc.ret.2 // 3294
D=A // 3295
@CALL // 3296
0;JMP // 3297
(Memory.deAlloc.ret.2)
@SP // 3298
M=M-1 // 3299

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3300
A=M+1 // 3301
D=M // 3302
@LCL // 3303
A=M // 3304
M=D // 3305

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
@Memory.deAlloc.EQ.30 // 3306
D=A // 3307
@SP // 3308
AM=M+1 // 3309
A=A-1 // 3310
M=D // 3311
@LCL // 3312
A=M+1 // 3313
A=A+1 // 3314
D=M // 3315
@DO_EQ // 3316
0;JMP // 3317
(Memory.deAlloc.EQ.30)
D=!D // 3318
@Memory.deAlloc$IF_TRUE3 // 3319
D;JNE // 3320

////GotoInstruction{label='Memory.deAlloc$IF_FALSE3}
// goto Memory.deAlloc$IF_FALSE3
@Memory.deAlloc$IF_FALSE3 // 3321
0;JMP // 3322

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
@Memory.deAlloc.EQ.31 // 3323
D=A // 3324
@SP // 3325
AM=M+1 // 3326
A=A-1 // 3327
M=D // 3328
@LCL // 3329
A=M+1 // 3330
A=A+1 // 3331
D=M // 3332
A=D+1 // 3333
D=M // 3334
D=D-1 // 3335
@DO_EQ // 3336
0;JMP // 3337
(Memory.deAlloc.EQ.31)
@Memory.deAlloc$IF_TRUE4 // 3338
D;JNE // 3339

////GotoInstruction{label='Memory.deAlloc$IF_FALSE4}
// goto Memory.deAlloc$IF_FALSE4
@Memory.deAlloc$IF_FALSE4 // 3340
0;JMP // 3341

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

@LCL // 3342
A=M+1 // 3343
A=A+1 // 3344
D=M // 3345
@0 // 3346
A=D+A // 3347
D=M // 3348
@SP // 3349
AM=M+1 // 3350
A=A-1 // 3351
M=D // 3352
// call Memory.getBinIndex
@6 // 3353
D=A // 3354
@14 // 3355
M=D // 3356
@Memory.getBinIndex // 3357
D=A // 3358
@13 // 3359
M=D // 3360
@Memory.deAlloc.ret.3 // 3361
D=A // 3362
@CALL // 3363
0;JMP // 3364
(Memory.deAlloc.ret.3)
@SP // 3365
AM=M-1 // 3366
D=M // 3367
@2048 // 3368
D=D+A // 3369
@SP // 3370
AM=M+1 // 3371
A=A-1 // 3372
M=D // 3373
@LCL // 3374
A=M+1 // 3375
A=A+1 // 3376
D=M // 3377
@SP // 3378
AM=M+1 // 3379
A=A-1 // 3380
M=D // 3381
// call Memory.remove_node
@7 // 3382
D=A // 3383
@14 // 3384
M=D // 3385
@Memory.remove_node // 3386
D=A // 3387
@13 // 3388
M=D // 3389
@Memory.deAlloc.ret.4 // 3390
D=A // 3391
@CALL // 3392
0;JMP // 3393
(Memory.deAlloc.ret.4)
@SP // 3394
M=M-1 // 3395

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
@LCL // 3396
A=M // 3397
D=M // 3398
@SP // 3399
AM=M+1 // 3400
A=A-1 // 3401
M=D // 3402
@LCL // 3403
A=M // 3404
D=M // 3405
@0 // 3406
A=D+A // 3407
D=M // 3408
@SP // 3409
AM=M+1 // 3410
A=A-1 // 3411
M=D // 3412
@LCL // 3413
A=M+1 // 3414
A=A+1 // 3415
D=M // 3416
@0 // 3417
A=D+A // 3418
D=M // 3419
@SP // 3420
AM=M-1 // 3421
D=D+M // 3422
@5 // 3423
D=D+A // 3424
@SP // 3425
AM=M-1 // 3426
A=M // 3427
M=D // 3428

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3429
A=M // 3430
D=M // 3431
@SP // 3432
AM=M+1 // 3433
A=A-1 // 3434
M=D // 3435
// call Memory.create_foot
@6 // 3436
D=A // 3437
@14 // 3438
M=D // 3439
@Memory.create_foot // 3440
D=A // 3441
@13 // 3442
M=D // 3443
@Memory.deAlloc.ret.5 // 3444
D=A // 3445
@CALL // 3446
0;JMP // 3447
(Memory.deAlloc.ret.5)
@SP // 3448
M=M-1 // 3449

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

@LCL // 3450
A=M // 3451
D=M // 3452
@0 // 3453
A=D+A // 3454
D=M // 3455
@SP // 3456
AM=M+1 // 3457
A=A-1 // 3458
M=D // 3459
// call Memory.getBinIndex
@6 // 3460
D=A // 3461
@14 // 3462
M=D // 3463
@Memory.getBinIndex // 3464
D=A // 3465
@13 // 3466
M=D // 3467
@Memory.deAlloc.ret.6 // 3468
D=A // 3469
@CALL // 3470
0;JMP // 3471
(Memory.deAlloc.ret.6)
@SP // 3472
AM=M-1 // 3473
D=M // 3474
@2048 // 3475
D=D+A // 3476
@SP // 3477
AM=M+1 // 3478
A=A-1 // 3479
M=D // 3480
@LCL // 3481
A=M // 3482
D=M // 3483
@SP // 3484
AM=M+1 // 3485
A=A-1 // 3486
M=D // 3487
// call Memory.add_node
@7 // 3488
D=A // 3489
@14 // 3490
M=D // 3491
@Memory.add_node // 3492
D=A // 3493
@13 // 3494
M=D // 3495
@Memory.deAlloc.ret.7 // 3496
D=A // 3497
@CALL // 3498
0;JMP // 3499
(Memory.deAlloc.ret.7)
@SP // 3500
M=M-1 // 3501

////PushInstruction("constant 0")
@SP // 3502
AM=M+1 // 3503
A=A-1 // 3504
M=0 // 3505
@RETURN // 3506
0;JMP // 3507

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3508
AM=M+1 // 3509
A=A-1 // 3510
M=0 // 3511

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3512
A=M // 3513
M=0 // 3514

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
@Memory.copy.LT.32 // 3515
D=A // 3516
@SP // 3517
AM=M+1 // 3518
A=A-1 // 3519
M=D // 3520
@LCL // 3521
A=M // 3522
D=M // 3523
@SP // 3524
AM=M+1 // 3525
A=A-1 // 3526
M=D // 3527
@ARG // 3528
A=M+1 // 3529
A=A+1 // 3530
D=M // 3531
@SP // 3532
AM=M-1 // 3533
D=M-D // 3534
@DO_LT // 3535
0;JMP // 3536
(Memory.copy.LT.32)
D=!D // 3537
@Memory.copy_WHILE_END1 // 3538
D;JNE // 3539

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
@ARG // 3540
A=M+1 // 3541
D=M // 3542
@SP // 3543
AM=M+1 // 3544
A=A-1 // 3545
M=D // 3546
@LCL // 3547
A=M // 3548
D=M // 3549
@SP // 3550
AM=M-1 // 3551
D=D+M // 3552
@SP // 3553
AM=M+1 // 3554
A=A-1 // 3555
M=D // 3556
@ARG // 3557
A=M // 3558
D=M // 3559
@SP // 3560
AM=M+1 // 3561
A=A-1 // 3562
M=D // 3563
@LCL // 3564
A=M // 3565
D=M // 3566
@SP // 3567
AM=M-1 // 3568
A=D+M // 3569
D=M // 3570
@SP // 3571
AM=M-1 // 3572
A=M // 3573
M=D // 3574

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

@LCL // 3575
A=M // 3576
M=M+1 // 3577

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3578
0;JMP // 3579

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3580
AM=M+1 // 3581
A=A-1 // 3582
M=0 // 3583
@RETURN // 3584
0;JMP // 3585

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3586
D=A // 3587
@SP // 3588
AM=D+M // 3589
A=A-1 // 3590
M=0 // 3591
A=A-1 // 3592
M=0 // 3593
A=A-1 // 3594
M=0 // 3595

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3596
A=M // 3597
D=M // 3598
@SP // 3599
AM=M+1 // 3600
A=A-1 // 3601
M=D // 3602
// call Math.abs
@6 // 3603
D=A // 3604
@14 // 3605
M=D // 3606
@Math.abs // 3607
D=A // 3608
@13 // 3609
M=D // 3610
@Math.divide.ret.0 // 3611
D=A // 3612
@CALL // 3613
0;JMP // 3614
(Math.divide.ret.0)
@SP // 3615
AM=M-1 // 3616
D=M // 3617
@LCL // 3618
A=M+1 // 3619
M=D // 3620

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3621
A=M+1 // 3622
D=M // 3623
@SP // 3624
AM=M+1 // 3625
A=A-1 // 3626
M=D // 3627
// call Math.abs
@6 // 3628
D=A // 3629
@14 // 3630
M=D // 3631
@Math.abs // 3632
D=A // 3633
@13 // 3634
M=D // 3635
@Math.divide.ret.1 // 3636
D=A // 3637
@CALL // 3638
0;JMP // 3639
(Math.divide.ret.1)
@SP // 3640
AM=M-1 // 3641
D=M // 3642
@LCL // 3643
A=M+1 // 3644
A=A+1 // 3645
M=D // 3646

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.33 // 3647
D=A // 3648
@SP // 3649
AM=M+1 // 3650
A=A-1 // 3651
M=D // 3652
@LCL // 3653
A=M+1 // 3654
A=A+1 // 3655
D=M // 3656
A=A-1 // 3657
D=D-M // 3658
@DO_GT // 3659
0;JMP // 3660
(Math.divide.GT.33)
@Math.divide$IF_TRUE1 // 3661
D;JNE // 3662

////GotoInstruction{label='Math.divide$IF_FALSE1}
// goto Math.divide$IF_FALSE1
@Math.divide$IF_FALSE1 // 3663
0;JMP // 3664

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3665
AM=M+1 // 3666
A=A-1 // 3667
M=0 // 3668
@RETURN // 3669
0;JMP // 3670

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

@LCL // 3671
A=M+1 // 3672
D=M // 3673
@SP // 3674
AM=M+1 // 3675
A=A-1 // 3676
M=D // 3677
@LCL // 3678
A=M+1 // 3679
A=A+1 // 3680
D=M // 3681
D=D+M // 3682
@SP // 3683
AM=M+1 // 3684
A=A-1 // 3685
M=D // 3686
// call Math.divide
@7 // 3687
D=A // 3688
@14 // 3689
M=D // 3690
@Math.divide // 3691
D=A // 3692
@13 // 3693
M=D // 3694
@Math.divide.ret.2 // 3695
D=A // 3696
@CALL // 3697
0;JMP // 3698
(Math.divide.ret.2)
@SP // 3699
AM=M-1 // 3700
D=M // 3701
@LCL // 3702
A=M // 3703
M=D // 3704

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
@Math.divide.LT.34 // 3705
D=A // 3706
@SP // 3707
AM=M+1 // 3708
A=A-1 // 3709
M=D // 3710
@LCL // 3711
A=M+1 // 3712
D=M // 3713
@SP // 3714
AM=M+1 // 3715
A=A-1 // 3716
M=D // 3717
@LCL // 3718
A=M // 3719
D=M // 3720
D=D+M // 3721
@SP // 3722
AM=M+1 // 3723
A=A-1 // 3724
M=D // 3725
@LCL // 3726
A=M+1 // 3727
A=A+1 // 3728
D=M // 3729
@SP // 3730
AM=M+1 // 3731
A=A-1 // 3732
M=D // 3733
// call Math.multiply
@7 // 3734
D=A // 3735
@14 // 3736
M=D // 3737
@Math.multiply // 3738
D=A // 3739
@13 // 3740
M=D // 3741
@Math.divide.ret.3 // 3742
D=A // 3743
@CALL // 3744
0;JMP // 3745
(Math.divide.ret.3)
@SP // 3746
AM=M-1 // 3747
D=M // 3748
@SP // 3749
AM=M-1 // 3750
D=M-D // 3751
@SP // 3752
AM=M+1 // 3753
A=A-1 // 3754
M=D // 3755
@LCL // 3756
A=M+1 // 3757
A=A+1 // 3758
D=M // 3759
@SP // 3760
AM=M-1 // 3761
D=M-D // 3762
@DO_LT // 3763
0;JMP // 3764
(Math.divide.LT.34)
@Math.divide$IF_TRUE2 // 3765
D;JNE // 3766

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3767
0;JMP // 3768

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
@Math.divide.LT.35 // 3769
D=A // 3770
@SP // 3771
AM=M+1 // 3772
A=A-1 // 3773
M=D // 3774
@ARG // 3775
A=M // 3776
D=M // 3777
@DO_LT // 3778
0;JMP // 3779
(Math.divide.LT.35)
@SP // 3780
AM=M+1 // 3781
A=A-1 // 3782
M=D // 3783
@Math.divide.GT.36 // 3784
D=A // 3785
@SP // 3786
AM=M+1 // 3787
A=A-1 // 3788
M=D // 3789
@ARG // 3790
A=M+1 // 3791
D=M // 3792
@DO_GT // 3793
0;JMP // 3794
(Math.divide.GT.36)
@SP // 3795
AM=M-1 // 3796
D=D&M // 3797
@SP // 3798
AM=M+1 // 3799
A=A-1 // 3800
M=D // 3801
@Math.divide.GT.37 // 3802
D=A // 3803
@SP // 3804
AM=M+1 // 3805
A=A-1 // 3806
M=D // 3807
@ARG // 3808
A=M // 3809
D=M // 3810
@DO_GT // 3811
0;JMP // 3812
(Math.divide.GT.37)
@SP // 3813
AM=M+1 // 3814
A=A-1 // 3815
M=D // 3816
@Math.divide.LT.38 // 3817
D=A // 3818
@SP // 3819
AM=M+1 // 3820
A=A-1 // 3821
M=D // 3822
@ARG // 3823
A=M+1 // 3824
D=M // 3825
@DO_LT // 3826
0;JMP // 3827
(Math.divide.LT.38)
@SP // 3828
AM=M-1 // 3829
D=D&M // 3830
@SP // 3831
AM=M-1 // 3832
D=D|M // 3833
@Math.divide$IF_TRUE3 // 3834
D;JNE // 3835

////GotoInstruction{label='Math.divide$IF_FALSE3}
// goto Math.divide$IF_FALSE3
@Math.divide$IF_FALSE3 // 3836
0;JMP // 3837

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3838
A=M // 3839
D=-M // 3840
@LCL // 3841
A=M // 3842
M=D // 3843

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
@LCL // 3844
A=M // 3845
D=M // 3846
D=D+M // 3847
@SP // 3848
AM=M+1 // 3849
A=A-1 // 3850
M=D // 3851
@RETURN // 3852
0;JMP // 3853

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3854
0;JMP // 3855

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
@Math.divide.LT.39 // 3856
D=A // 3857
@SP // 3858
AM=M+1 // 3859
A=A-1 // 3860
M=D // 3861
@ARG // 3862
A=M // 3863
D=M // 3864
@DO_LT // 3865
0;JMP // 3866
(Math.divide.LT.39)
@SP // 3867
AM=M+1 // 3868
A=A-1 // 3869
M=D // 3870
@Math.divide.GT.40 // 3871
D=A // 3872
@SP // 3873
AM=M+1 // 3874
A=A-1 // 3875
M=D // 3876
@ARG // 3877
A=M+1 // 3878
D=M // 3879
@DO_GT // 3880
0;JMP // 3881
(Math.divide.GT.40)
@SP // 3882
AM=M-1 // 3883
D=D&M // 3884
@SP // 3885
AM=M+1 // 3886
A=A-1 // 3887
M=D // 3888
@Math.divide.GT.41 // 3889
D=A // 3890
@SP // 3891
AM=M+1 // 3892
A=A-1 // 3893
M=D // 3894
@ARG // 3895
A=M // 3896
D=M // 3897
@DO_GT // 3898
0;JMP // 3899
(Math.divide.GT.41)
@SP // 3900
AM=M+1 // 3901
A=A-1 // 3902
M=D // 3903
@Math.divide.LT.42 // 3904
D=A // 3905
@SP // 3906
AM=M+1 // 3907
A=A-1 // 3908
M=D // 3909
@ARG // 3910
A=M+1 // 3911
D=M // 3912
@DO_LT // 3913
0;JMP // 3914
(Math.divide.LT.42)
@SP // 3915
AM=M-1 // 3916
D=D&M // 3917
@SP // 3918
AM=M-1 // 3919
D=D|M // 3920
@Math.divide$IF_TRUE4 // 3921
D;JNE // 3922

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 3923
0;JMP // 3924

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3925
A=M // 3926
D=-M // 3927
@LCL // 3928
A=M // 3929
M=D // 3930

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
@LCL // 3931
A=M // 3932
D=M // 3933
D=D+M // 3934
D=D+1 // 3935
@SP // 3936
AM=M+1 // 3937
A=A-1 // 3938
M=D // 3939
@RETURN // 3940
0;JMP // 3941

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3942
D=A // 3943
@SP // 3944
AM=D+M // 3945
A=A-1 // 3946
M=0 // 3947
A=A-1 // 3948
M=0 // 3949
A=A-1 // 3950
M=0 // 3951
A=A-1 // 3952
M=0 // 3953
A=A-1 // 3954
M=0 // 3955
A=A-1 // 3956
M=0 // 3957

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

@ARG // 3958
A=M+1 // 3959
A=A+1 // 3960
D=M // 3961
A=A-1 // 3962
A=A-1 // 3963
D=D-M // 3964
@SP // 3965
AM=M+1 // 3966
A=A-1 // 3967
M=D // 3968
// call Math.abs
@6 // 3969
D=A // 3970
@14 // 3971
M=D // 3972
@Math.abs // 3973
D=A // 3974
@13 // 3975
M=D // 3976
@Screen.drawLine.ret.0 // 3977
D=A // 3978
@CALL // 3979
0;JMP // 3980
(Screen.drawLine.ret.0)
@SP // 3981
AM=M-1 // 3982
D=M // 3983
@LCL // 3984
A=M // 3985
M=D // 3986

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

@ARG // 3987
A=M+1 // 3988
A=A+1 // 3989
A=A+1 // 3990
D=M // 3991
A=A-1 // 3992
A=A-1 // 3993
D=D-M // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
// call Math.abs
@6 // 3999
D=A // 4000
@14 // 4001
M=D // 4002
@Math.abs // 4003
D=A // 4004
@13 // 4005
M=D // 4006
@Screen.drawLine.ret.1 // 4007
D=A // 4008
@CALL // 4009
0;JMP // 4010
(Screen.drawLine.ret.1)
@SP // 4011
AM=M-1 // 4012
D=M // 4013
@LCL // 4014
A=M+1 // 4015
M=D // 4016

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.43 // 4017
D=A // 4018
@SP // 4019
AM=M+1 // 4020
A=A-1 // 4021
M=D // 4022
@ARG // 4023
A=M+1 // 4024
A=A+1 // 4025
D=M // 4026
A=A-1 // 4027
A=A-1 // 4028
D=M-D // 4029
@DO_LT // 4030
0;JMP // 4031
(Screen.drawLine.LT.43)
@Screen.drawLine$IF_TRUE1 // 4032
D;JNE // 4033

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 4034
0;JMP // 4035

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4036
A=M+1 // 4037
A=A+1 // 4038
M=1 // 4039

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 4040
0;JMP // 4041

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 4042
A=M+1 // 4043
A=A+1 // 4044
M=-1 // 4045

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
@Screen.drawLine.LT.44 // 4046
D=A // 4047
@SP // 4048
AM=M+1 // 4049
A=A-1 // 4050
M=D // 4051
@ARG // 4052
A=M+1 // 4053
A=A+1 // 4054
A=A+1 // 4055
D=M // 4056
A=A-1 // 4057
A=A-1 // 4058
D=M-D // 4059
@DO_LT // 4060
0;JMP // 4061
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE2 // 4062
D;JNE // 4063

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 4064
0;JMP // 4065

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4066
A=M+1 // 4067
A=A+1 // 4068
A=A+1 // 4069
M=1 // 4070

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 4071
0;JMP // 4072

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4073
A=M+1 // 4074
A=A+1 // 4075
A=A+1 // 4076
M=-1 // 4077

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

@LCL // 4078
A=M+1 // 4079
D=M // 4080
A=A-1 // 4081
D=M-D // 4082
@SP // 4083
AM=M+1 // 4084
A=A-1 // 4085
M=D // 4086
@LCL // 4087
D=M // 4088
@4 // 4089
A=D+A // 4090
D=A // 4091
@R13 // 4092
M=D // 4093
@SP // 4094
AM=M-1 // 4095
D=M // 4096
@R13 // 4097
A=M // 4098
M=D // 4099

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 4100
@Screen.drawLine_WHILE_END1 // 4101
D;JNE // 4102

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4103
A=M // 4104
D=M // 4105
@SP // 4106
AM=M+1 // 4107
A=A-1 // 4108
M=D // 4109
@ARG // 4110
A=M+1 // 4111
D=M // 4112
@SP // 4113
AM=M+1 // 4114
A=A-1 // 4115
M=D // 4116
// call Screen.drawPixel
@7 // 4117
D=A // 4118
@14 // 4119
M=D // 4120
@Screen.drawPixel // 4121
D=A // 4122
@13 // 4123
M=D // 4124
@Screen.drawLine.ret.2 // 4125
D=A // 4126
@CALL // 4127
0;JMP // 4128
(Screen.drawLine.ret.2)
@SP // 4129
M=M-1 // 4130

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
@Screen.drawLine.EQ.45 // 4131
D=A // 4132
@SP // 4133
AM=M+1 // 4134
A=A-1 // 4135
M=D // 4136
@ARG // 4137
A=M+1 // 4138
A=A+1 // 4139
D=M // 4140
A=A-1 // 4141
A=A-1 // 4142
D=M-D // 4143
@DO_EQ // 4144
0;JMP // 4145
(Screen.drawLine.EQ.45)
@SP // 4146
AM=M+1 // 4147
A=A-1 // 4148
M=D // 4149
@Screen.drawLine.EQ.46 // 4150
D=A // 4151
@SP // 4152
AM=M+1 // 4153
A=A-1 // 4154
M=D // 4155
@ARG // 4156
A=M+1 // 4157
A=A+1 // 4158
A=A+1 // 4159
D=M // 4160
A=A-1 // 4161
A=A-1 // 4162
D=M-D // 4163
@DO_EQ // 4164
0;JMP // 4165
(Screen.drawLine.EQ.46)
@SP // 4166
AM=M-1 // 4167
D=D&M // 4168
@Screen.drawLine$IF_TRUE3 // 4169
D;JNE // 4170

////GotoInstruction{label='Screen.drawLine$IF_FALSE3}
// goto Screen.drawLine$IF_FALSE3
@Screen.drawLine$IF_FALSE3 // 4171
0;JMP // 4172

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4173
AM=M+1 // 4174
A=A-1 // 4175
M=0 // 4176
@RETURN // 4177
0;JMP // 4178

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

@LCL // 4179
D=M // 4180
@4 // 4181
A=D+A // 4182
D=M // 4183
D=D+M // 4184
@SP // 4185
AM=M+1 // 4186
A=A-1 // 4187
M=D // 4188
@LCL // 4189
D=M // 4190
@5 // 4191
A=D+A // 4192
D=A // 4193
@R13 // 4194
M=D // 4195
@SP // 4196
AM=M-1 // 4197
D=M // 4198
@R13 // 4199
A=M // 4200
M=D // 4201

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
@Screen.drawLine.GT.47 // 4202
D=A // 4203
@SP // 4204
AM=M+1 // 4205
A=A-1 // 4206
M=D // 4207
@LCL // 4208
D=M // 4209
@5 // 4210
A=D+A // 4211
D=M // 4212
@SP // 4213
AM=M+1 // 4214
A=A-1 // 4215
M=D // 4216
@LCL // 4217
A=M+1 // 4218
D=M // 4219
@SP // 4220
AM=M-1 // 4221
D=D+M // 4222
@DO_GT // 4223
0;JMP // 4224
(Screen.drawLine.GT.47)
@Screen.drawLine$IF_TRUE4 // 4225
D;JNE // 4226

////GotoInstruction{label='Screen.drawLine$IF_FALSE4}
// goto Screen.drawLine$IF_FALSE4
@Screen.drawLine$IF_FALSE4 // 4227
0;JMP // 4228

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

@LCL // 4229
D=M // 4230
@4 // 4231
A=D+A // 4232
D=M // 4233
A=A-1 // 4234
A=A-1 // 4235
A=A-1 // 4236
D=D-M // 4237
@SP // 4238
AM=M+1 // 4239
A=A-1 // 4240
M=D // 4241
@LCL // 4242
D=M // 4243
@4 // 4244
A=D+A // 4245
D=A // 4246
@R13 // 4247
M=D // 4248
@SP // 4249
AM=M-1 // 4250
D=M // 4251
@R13 // 4252
A=M // 4253
M=D // 4254

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

@LCL // 4255
A=M+1 // 4256
A=A+1 // 4257
D=M // 4258
@ARG // 4259
A=M // 4260
M=D+M // 4261

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
@Screen.drawLine.LT.48 // 4262
D=A // 4263
@SP // 4264
AM=M+1 // 4265
A=A-1 // 4266
M=D // 4267
@LCL // 4268
D=M // 4269
@5 // 4270
A=D+A // 4271
D=M // 4272
@SP // 4273
AM=M+1 // 4274
A=A-1 // 4275
M=D // 4276
@LCL // 4277
A=M // 4278
D=M // 4279
@SP // 4280
AM=M-1 // 4281
D=M-D // 4282
@DO_LT // 4283
0;JMP // 4284
(Screen.drawLine.LT.48)
@Screen.drawLine$IF_TRUE5 // 4285
D;JNE // 4286

////GotoInstruction{label='Screen.drawLine$IF_FALSE5}
// goto Screen.drawLine$IF_FALSE5
@Screen.drawLine$IF_FALSE5 // 4287
0;JMP // 4288

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

@LCL // 4289
D=M // 4290
@4 // 4291
A=D+A // 4292
D=M // 4293
@SP // 4294
AM=M+1 // 4295
A=A-1 // 4296
M=D // 4297
@LCL // 4298
A=M // 4299
D=M // 4300
@SP // 4301
AM=M-1 // 4302
D=D+M // 4303
@SP // 4304
AM=M+1 // 4305
A=A-1 // 4306
M=D // 4307
@LCL // 4308
D=M // 4309
@4 // 4310
A=D+A // 4311
D=A // 4312
@R13 // 4313
M=D // 4314
@SP // 4315
AM=M-1 // 4316
D=M // 4317
@R13 // 4318
A=M // 4319
M=D // 4320

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

@LCL // 4321
A=M+1 // 4322
A=A+1 // 4323
A=A+1 // 4324
D=M // 4325
@ARG // 4326
A=M+1 // 4327
M=D+M // 4328

////LabelInstruction{label='Screen.drawLine$IF_FALSE5}
// label Screen.drawLine$IF_FALSE5
(Screen.drawLine$IF_FALSE5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4329
0;JMP // 4330

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4331
AM=M+1 // 4332
A=A-1 // 4333
M=0 // 4334
@RETURN // 4335
0;JMP // 4336

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
@Math.max.GT.49 // 4337
D=A // 4338
@SP // 4339
AM=M+1 // 4340
A=A-1 // 4341
M=D // 4342
@ARG // 4343
A=M+1 // 4344
D=M // 4345
A=A-1 // 4346
D=M-D // 4347
@DO_GT // 4348
0;JMP // 4349
(Math.max.GT.49)
@Math.max$IF_TRUE1 // 4350
D;JNE // 4351

////GotoInstruction{label='Math.max$IF_FALSE1}
// goto Math.max$IF_FALSE1
@Math.max$IF_FALSE1 // 4352
0;JMP // 4353

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4354
A=M // 4355
D=M // 4356
@SP // 4357
AM=M+1 // 4358
A=A-1 // 4359
M=D // 4360
@RETURN // 4361
0;JMP // 4362

////LabelInstruction{label='Math.max$IF_FALSE1}
// label Math.max$IF_FALSE1
(Math.max$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 4363
A=M+1 // 4364
D=M // 4365
@SP // 4366
AM=M+1 // 4367
A=A-1 // 4368
M=D // 4369
@RETURN // 4370
0;JMP // 4371

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4372
AM=M+1 // 4373
A=A-1 // 4374
M=0 // 4375

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4376
AM=M+1 // 4377
A=A-1 // 4378
M=0 // 4379
@220 // 4380
D=A // 4381
@SP // 4382
AM=M+1 // 4383
A=A-1 // 4384
M=D // 4385
@511 // 4386
D=A // 4387
@SP // 4388
AM=M+1 // 4389
A=A-1 // 4390
M=D // 4391
@220 // 4392
D=A // 4393
@SP // 4394
AM=M+1 // 4395
A=A-1 // 4396
M=D // 4397
// call Screen.drawLine
@9 // 4398
D=A // 4399
@14 // 4400
M=D // 4401
@Screen.drawLine // 4402
D=A // 4403
@13 // 4404
M=D // 4405
@Main.main.ret.0 // 4406
D=A // 4407
@CALL // 4408
0;JMP // 4409
(Main.main.ret.0)
@SP // 4410
M=M-1 // 4411

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4412
D=A // 4413
@SP // 4414
AM=M+1 // 4415
A=A-1 // 4416
M=D // 4417
@90 // 4418
D=A // 4419
@SP // 4420
AM=M+1 // 4421
A=A-1 // 4422
M=D // 4423
@410 // 4424
D=A // 4425
@SP // 4426
AM=M+1 // 4427
A=A-1 // 4428
M=D // 4429
@220 // 4430
D=A // 4431
@SP // 4432
AM=M+1 // 4433
A=A-1 // 4434
M=D // 4435
// call Screen.drawRectangle
@9 // 4436
D=A // 4437
@14 // 4438
M=D // 4439
@Screen.drawRectangle // 4440
D=A // 4441
@13 // 4442
M=D // 4443
@Main.main.ret.1 // 4444
D=A // 4445
@CALL // 4446
0;JMP // 4447
(Main.main.ret.1)
@SP // 4448
M=M-1 // 4449

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4450
AM=M+1 // 4451
A=A-1 // 4452
M=0 // 4453
// call Screen.setColor
@6 // 4454
D=A // 4455
@14 // 4456
M=D // 4457
@Screen.setColor // 4458
D=A // 4459
@13 // 4460
M=D // 4461
@Main.main.ret.2 // 4462
D=A // 4463
@CALL // 4464
0;JMP // 4465
(Main.main.ret.2)
@SP // 4466
M=M-1 // 4467

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4468
D=A // 4469
@SP // 4470
AM=M+1 // 4471
A=A-1 // 4472
M=D // 4473
@120 // 4474
D=A // 4475
@SP // 4476
AM=M+1 // 4477
A=A-1 // 4478
M=D // 4479
@390 // 4480
D=A // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=D // 4485
@219 // 4486
D=A // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=D // 4491
// call Screen.drawRectangle
@9 // 4492
D=A // 4493
@14 // 4494
M=D // 4495
@Screen.drawRectangle // 4496
D=A // 4497
@13 // 4498
M=D // 4499
@Main.main.ret.3 // 4500
D=A // 4501
@CALL // 4502
0;JMP // 4503
(Main.main.ret.3)
@SP // 4504
M=M-1 // 4505

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4506
D=A // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=D // 4511
@120 // 4512
D=A // 4513
@SP // 4514
AM=M+1 // 4515
A=A-1 // 4516
M=D // 4517
@332 // 4518
D=A // 4519
@SP // 4520
AM=M+1 // 4521
A=A-1 // 4522
M=D // 4523
@150 // 4524
D=A // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=D // 4529
// call Screen.drawRectangle
@9 // 4530
D=A // 4531
@14 // 4532
M=D // 4533
@Screen.drawRectangle // 4534
D=A // 4535
@13 // 4536
M=D // 4537
@Main.main.ret.4 // 4538
D=A // 4539
@CALL // 4540
0;JMP // 4541
(Main.main.ret.4)
@SP // 4542
M=M-1 // 4543

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4544
AM=M+1 // 4545
A=A-1 // 4546
M=-1 // 4547
// call Screen.setColor
@6 // 4548
D=A // 4549
@14 // 4550
M=D // 4551
@Screen.setColor // 4552
D=A // 4553
@13 // 4554
M=D // 4555
@Main.main.ret.5 // 4556
D=A // 4557
@CALL // 4558
0;JMP // 4559
(Main.main.ret.5)
@SP // 4560
M=M-1 // 4561

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4562
D=A // 4563
@SP // 4564
AM=M+1 // 4565
A=A-1 // 4566
M=D // 4567
@170 // 4568
D=A // 4569
@SP // 4570
AM=M+1 // 4571
A=A-1 // 4572
M=D // 4573
@3 // 4574
D=A // 4575
@SP // 4576
AM=M+1 // 4577
A=A-1 // 4578
M=D // 4579
// call Screen.drawCircle
@8 // 4580
D=A // 4581
@14 // 4582
M=D // 4583
@Screen.drawCircle // 4584
D=A // 4585
@13 // 4586
M=D // 4587
@Main.main.ret.6 // 4588
D=A // 4589
@CALL // 4590
0;JMP // 4591
(Main.main.ret.6)
@SP // 4592
M=M-1 // 4593

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4594
D=A // 4595
@SP // 4596
AM=M+1 // 4597
A=A-1 // 4598
M=D // 4599
@90 // 4600
D=A // 4601
@SP // 4602
AM=M+1 // 4603
A=A-1 // 4604
M=D // 4605
@345 // 4606
D=A // 4607
@SP // 4608
AM=M+1 // 4609
A=A-1 // 4610
M=D // 4611
@35 // 4612
D=A // 4613
@SP // 4614
AM=M+1 // 4615
A=A-1 // 4616
M=D // 4617
// call Screen.drawLine
@9 // 4618
D=A // 4619
@14 // 4620
M=D // 4621
@Screen.drawLine // 4622
D=A // 4623
@13 // 4624
M=D // 4625
@Main.main.ret.7 // 4626
D=A // 4627
@CALL // 4628
0;JMP // 4629
(Main.main.ret.7)
@SP // 4630
M=M-1 // 4631

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4632
D=A // 4633
@SP // 4634
AM=M+1 // 4635
A=A-1 // 4636
M=D // 4637
@35 // 4638
D=A // 4639
@SP // 4640
AM=M+1 // 4641
A=A-1 // 4642
M=D // 4643
@410 // 4644
D=A // 4645
@SP // 4646
AM=M+1 // 4647
A=A-1 // 4648
M=D // 4649
@90 // 4650
D=A // 4651
@SP // 4652
AM=M+1 // 4653
A=A-1 // 4654
M=D // 4655
// call Screen.drawLine
@9 // 4656
D=A // 4657
@14 // 4658
M=D // 4659
@Screen.drawLine // 4660
D=A // 4661
@13 // 4662
M=D // 4663
@Main.main.ret.8 // 4664
D=A // 4665
@CALL // 4666
0;JMP // 4667
(Main.main.ret.8)
@SP // 4668
M=M-1 // 4669

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4670
D=A // 4671
@SP // 4672
AM=M+1 // 4673
A=A-1 // 4674
M=D // 4675
@60 // 4676
D=A // 4677
@SP // 4678
AM=M+1 // 4679
A=A-1 // 4680
M=D // 4681
@30 // 4682
D=A // 4683
@SP // 4684
AM=M+1 // 4685
A=A-1 // 4686
M=D // 4687
// call Screen.drawCircle
@8 // 4688
D=A // 4689
@14 // 4690
M=D // 4691
@Screen.drawCircle // 4692
D=A // 4693
@13 // 4694
M=D // 4695
@Main.main.ret.9 // 4696
D=A // 4697
@CALL // 4698
0;JMP // 4699
(Main.main.ret.9)
@SP // 4700
M=M-1 // 4701

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4702
D=A // 4703
@SP // 4704
AM=M+1 // 4705
A=A-1 // 4706
M=D // 4707
@26 // 4708
D=A // 4709
@SP // 4710
AM=M+1 // 4711
A=A-1 // 4712
M=D // 4713
@140 // 4714
D=A // 4715
@SP // 4716
AM=M+1 // 4717
A=A-1 // 4718
M=D // 4719
@6 // 4720
D=A // 4721
@SP // 4722
AM=M+1 // 4723
A=A-1 // 4724
M=D // 4725
// call Screen.drawLine
@9 // 4726
D=A // 4727
@14 // 4728
M=D // 4729
@Screen.drawLine // 4730
D=A // 4731
@13 // 4732
M=D // 4733
@Main.main.ret.10 // 4734
D=A // 4735
@CALL // 4736
0;JMP // 4737
(Main.main.ret.10)
@SP // 4738
M=M-1 // 4739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4740
D=A // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745
@35 // 4746
D=A // 4747
@SP // 4748
AM=M+1 // 4749
A=A-1 // 4750
M=D // 4751
@178 // 4752
D=A // 4753
@SP // 4754
AM=M+1 // 4755
A=A-1 // 4756
M=D // 4757
@20 // 4758
D=A // 4759
@SP // 4760
AM=M+1 // 4761
A=A-1 // 4762
M=D // 4763
// call Screen.drawLine
@9 // 4764
D=A // 4765
@14 // 4766
M=D // 4767
@Screen.drawLine // 4768
D=A // 4769
@13 // 4770
M=D // 4771
@Main.main.ret.11 // 4772
D=A // 4773
@CALL // 4774
0;JMP // 4775
(Main.main.ret.11)
@SP // 4776
M=M-1 // 4777

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4778
D=A // 4779
@SP // 4780
AM=M+1 // 4781
A=A-1 // 4782
M=D // 4783
@60 // 4784
D=A // 4785
@SP // 4786
AM=M+1 // 4787
A=A-1 // 4788
M=D // 4789
@194 // 4790
D=A // 4791
@SP // 4792
AM=M+1 // 4793
A=A-1 // 4794
M=D // 4795
@60 // 4796
D=A // 4797
@SP // 4798
AM=M+1 // 4799
A=A-1 // 4800
M=D // 4801
// call Screen.drawLine
@9 // 4802
D=A // 4803
@14 // 4804
M=D // 4805
@Screen.drawLine // 4806
D=A // 4807
@13 // 4808
M=D // 4809
@Main.main.ret.12 // 4810
D=A // 4811
@CALL // 4812
0;JMP // 4813
(Main.main.ret.12)
@SP // 4814
M=M-1 // 4815

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4816
D=A // 4817
@SP // 4818
AM=M+1 // 4819
A=A-1 // 4820
M=D // 4821
@85 // 4822
D=A // 4823
@SP // 4824
AM=M+1 // 4825
A=A-1 // 4826
M=D // 4827
@178 // 4828
D=A // 4829
@SP // 4830
AM=M+1 // 4831
A=A-1 // 4832
M=D // 4833
@100 // 4834
D=A // 4835
@SP // 4836
AM=M+1 // 4837
A=A-1 // 4838
M=D // 4839
// call Screen.drawLine
@9 // 4840
D=A // 4841
@14 // 4842
M=D // 4843
@Screen.drawLine // 4844
D=A // 4845
@13 // 4846
M=D // 4847
@Main.main.ret.13 // 4848
D=A // 4849
@CALL // 4850
0;JMP // 4851
(Main.main.ret.13)
@SP // 4852
M=M-1 // 4853

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4854
D=A // 4855
@SP // 4856
AM=M+1 // 4857
A=A-1 // 4858
M=D // 4859
@94 // 4860
D=A // 4861
@SP // 4862
AM=M+1 // 4863
A=A-1 // 4864
M=D // 4865
@140 // 4866
D=A // 4867
@SP // 4868
AM=M+1 // 4869
A=A-1 // 4870
M=D // 4871
@114 // 4872
D=A // 4873
@SP // 4874
AM=M+1 // 4875
A=A-1 // 4876
M=D // 4877
// call Screen.drawLine
@9 // 4878
D=A // 4879
@14 // 4880
M=D // 4881
@Screen.drawLine // 4882
D=A // 4883
@13 // 4884
M=D // 4885
@Main.main.ret.14 // 4886
D=A // 4887
@CALL // 4888
0;JMP // 4889
(Main.main.ret.14)
@SP // 4890
M=M-1 // 4891

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4892
D=A // 4893
@SP // 4894
AM=M+1 // 4895
A=A-1 // 4896
M=D // 4897
@85 // 4898
D=A // 4899
@SP // 4900
AM=M+1 // 4901
A=A-1 // 4902
M=D // 4903
@102 // 4904
D=A // 4905
@SP // 4906
AM=M+1 // 4907
A=A-1 // 4908
M=D // 4909
@100 // 4910
D=A // 4911
@SP // 4912
AM=M+1 // 4913
A=A-1 // 4914
M=D // 4915
// call Screen.drawLine
@9 // 4916
D=A // 4917
@14 // 4918
M=D // 4919
@Screen.drawLine // 4920
D=A // 4921
@13 // 4922
M=D // 4923
@Main.main.ret.15 // 4924
D=A // 4925
@CALL // 4926
0;JMP // 4927
(Main.main.ret.15)
@SP // 4928
M=M-1 // 4929

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4930
D=A // 4931
@SP // 4932
AM=M+1 // 4933
A=A-1 // 4934
M=D // 4935
@60 // 4936
D=A // 4937
@SP // 4938
AM=M+1 // 4939
A=A-1 // 4940
M=D // 4941
@86 // 4942
D=A // 4943
@SP // 4944
AM=M+1 // 4945
A=A-1 // 4946
M=D // 4947
@60 // 4948
D=A // 4949
@SP // 4950
AM=M+1 // 4951
A=A-1 // 4952
M=D // 4953
// call Screen.drawLine
@9 // 4954
D=A // 4955
@14 // 4956
M=D // 4957
@Screen.drawLine // 4958
D=A // 4959
@13 // 4960
M=D // 4961
@Main.main.ret.16 // 4962
D=A // 4963
@CALL // 4964
0;JMP // 4965
(Main.main.ret.16)
@SP // 4966
M=M-1 // 4967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4968
D=A // 4969
@SP // 4970
AM=M+1 // 4971
A=A-1 // 4972
M=D // 4973
@35 // 4974
D=A // 4975
@SP // 4976
AM=M+1 // 4977
A=A-1 // 4978
M=D // 4979
@102 // 4980
D=A // 4981
@SP // 4982
AM=M+1 // 4983
A=A-1 // 4984
M=D // 4985
@20 // 4986
D=A // 4987
@SP // 4988
AM=M+1 // 4989
A=A-1 // 4990
M=D // 4991
// call Screen.drawLine
@9 // 4992
D=A // 4993
@14 // 4994
M=D // 4995
@Screen.drawLine // 4996
D=A // 4997
@13 // 4998
M=D // 4999
@Main.main.ret.17 // 5000
D=A // 5001
@CALL // 5002
0;JMP // 5003
(Main.main.ret.17)
@SP // 5004
M=M-1 // 5005

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 5006
D=A // 5007
@SP // 5008
AM=M+1 // 5009
A=A-1 // 5010
M=D // 5011
// call String.new
@6 // 5012
D=A // 5013
@14 // 5014
M=D // 5015
@String.new // 5016
D=A // 5017
@13 // 5018
M=D // 5019
@Main.main.ret.18 // 5020
D=A // 5021
@CALL // 5022
0;JMP // 5023
(Main.main.ret.18)
@72 // 5024
D=A // 5025
@SP // 5026
AM=M+1 // 5027
A=A-1 // 5028
M=D // 5029
// call String.appendChar
@7 // 5030
D=A // 5031
@14 // 5032
M=D // 5033
@String.appendChar // 5034
D=A // 5035
@13 // 5036
M=D // 5037
@Main.main.ret.19 // 5038
D=A // 5039
@CALL // 5040
0;JMP // 5041
(Main.main.ret.19)
@101 // 5042
D=A // 5043
@SP // 5044
AM=M+1 // 5045
A=A-1 // 5046
M=D // 5047
// call String.appendChar
@7 // 5048
D=A // 5049
@14 // 5050
M=D // 5051
@String.appendChar // 5052
D=A // 5053
@13 // 5054
M=D // 5055
@Main.main.ret.20 // 5056
D=A // 5057
@CALL // 5058
0;JMP // 5059
(Main.main.ret.20)
@108 // 5060
D=A // 5061
@SP // 5062
AM=M+1 // 5063
A=A-1 // 5064
M=D // 5065
// call String.appendChar
@7 // 5066
D=A // 5067
@14 // 5068
M=D // 5069
@String.appendChar // 5070
D=A // 5071
@13 // 5072
M=D // 5073
@Main.main.ret.21 // 5074
D=A // 5075
@CALL // 5076
0;JMP // 5077
(Main.main.ret.21)
@108 // 5078
D=A // 5079
@SP // 5080
AM=M+1 // 5081
A=A-1 // 5082
M=D // 5083
// call String.appendChar
@7 // 5084
D=A // 5085
@14 // 5086
M=D // 5087
@String.appendChar // 5088
D=A // 5089
@13 // 5090
M=D // 5091
@Main.main.ret.22 // 5092
D=A // 5093
@CALL // 5094
0;JMP // 5095
(Main.main.ret.22)
@111 // 5096
D=A // 5097
@SP // 5098
AM=M+1 // 5099
A=A-1 // 5100
M=D // 5101
// call String.appendChar
@7 // 5102
D=A // 5103
@14 // 5104
M=D // 5105
@String.appendChar // 5106
D=A // 5107
@13 // 5108
M=D // 5109
@Main.main.ret.23 // 5110
D=A // 5111
@CALL // 5112
0;JMP // 5113
(Main.main.ret.23)
@44 // 5114
D=A // 5115
@SP // 5116
AM=M+1 // 5117
A=A-1 // 5118
M=D // 5119
// call String.appendChar
@7 // 5120
D=A // 5121
@14 // 5122
M=D // 5123
@String.appendChar // 5124
D=A // 5125
@13 // 5126
M=D // 5127
@Main.main.ret.24 // 5128
D=A // 5129
@CALL // 5130
0;JMP // 5131
(Main.main.ret.24)
@32 // 5132
D=A // 5133
@SP // 5134
AM=M+1 // 5135
A=A-1 // 5136
M=D // 5137
// call String.appendChar
@7 // 5138
D=A // 5139
@14 // 5140
M=D // 5141
@String.appendChar // 5142
D=A // 5143
@13 // 5144
M=D // 5145
@Main.main.ret.25 // 5146
D=A // 5147
@CALL // 5148
0;JMP // 5149
(Main.main.ret.25)
@119 // 5150
D=A // 5151
@SP // 5152
AM=M+1 // 5153
A=A-1 // 5154
M=D // 5155
// call String.appendChar
@7 // 5156
D=A // 5157
@14 // 5158
M=D // 5159
@String.appendChar // 5160
D=A // 5161
@13 // 5162
M=D // 5163
@Main.main.ret.26 // 5164
D=A // 5165
@CALL // 5166
0;JMP // 5167
(Main.main.ret.26)
@111 // 5168
D=A // 5169
@SP // 5170
AM=M+1 // 5171
A=A-1 // 5172
M=D // 5173
// call String.appendChar
@7 // 5174
D=A // 5175
@14 // 5176
M=D // 5177
@String.appendChar // 5178
D=A // 5179
@13 // 5180
M=D // 5181
@Main.main.ret.27 // 5182
D=A // 5183
@CALL // 5184
0;JMP // 5185
(Main.main.ret.27)
@114 // 5186
D=A // 5187
@SP // 5188
AM=M+1 // 5189
A=A-1 // 5190
M=D // 5191
// call String.appendChar
@7 // 5192
D=A // 5193
@14 // 5194
M=D // 5195
@String.appendChar // 5196
D=A // 5197
@13 // 5198
M=D // 5199
@Main.main.ret.28 // 5200
D=A // 5201
@CALL // 5202
0;JMP // 5203
(Main.main.ret.28)
@108 // 5204
D=A // 5205
@SP // 5206
AM=M+1 // 5207
A=A-1 // 5208
M=D // 5209
// call String.appendChar
@7 // 5210
D=A // 5211
@14 // 5212
M=D // 5213
@String.appendChar // 5214
D=A // 5215
@13 // 5216
M=D // 5217
@Main.main.ret.29 // 5218
D=A // 5219
@CALL // 5220
0;JMP // 5221
(Main.main.ret.29)
@100 // 5222
D=A // 5223
@SP // 5224
AM=M+1 // 5225
A=A-1 // 5226
M=D // 5227
// call String.appendChar
@7 // 5228
D=A // 5229
@14 // 5230
M=D // 5231
@String.appendChar // 5232
D=A // 5233
@13 // 5234
M=D // 5235
@Main.main.ret.30 // 5236
D=A // 5237
@CALL // 5238
0;JMP // 5239
(Main.main.ret.30)
@33 // 5240
D=A // 5241
@SP // 5242
AM=M+1 // 5243
A=A-1 // 5244
M=D // 5245
// call String.appendChar
@7 // 5246
D=A // 5247
@14 // 5248
M=D // 5249
@String.appendChar // 5250
D=A // 5251
@13 // 5252
M=D // 5253
@Main.main.ret.31 // 5254
D=A // 5255
@CALL // 5256
0;JMP // 5257
(Main.main.ret.31)
@SP // 5258
AM=M-1 // 5259
D=M // 5260
@LCL // 5261
A=M // 5262
M=D // 5263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5264
A=M // 5265
D=M // 5266
@SP // 5267
AM=M+1 // 5268
A=A-1 // 5269
M=D // 5270
// call Output.printString
@6 // 5271
D=A // 5272
@14 // 5273
M=D // 5274
@Output.printString // 5275
D=A // 5276
@13 // 5277
M=D // 5278
@Main.main.ret.32 // 5279
D=A // 5280
@CALL // 5281
0;JMP // 5282
(Main.main.ret.32)
@SP // 5283
M=M-1 // 5284

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5285
D=A // 5286
@14 // 5287
M=D // 5288
@Output.println // 5289
D=A // 5290
@13 // 5291
M=D // 5292
@Main.main.ret.33 // 5293
D=A // 5294
@CALL // 5295
0;JMP // 5296
(Main.main.ret.33)
@SP // 5297
M=M-1 // 5298

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5299
A=M // 5300
D=M // 5301
@SP // 5302
AM=M+1 // 5303
A=A-1 // 5304
M=D // 5305
// call String.dispose
@6 // 5306
D=A // 5307
@14 // 5308
M=D // 5309
@String.dispose // 5310
D=A // 5311
@13 // 5312
M=D // 5313
@Main.main.ret.34 // 5314
D=A // 5315
@CALL // 5316
0;JMP // 5317
(Main.main.ret.34)
@SP // 5318
M=M-1 // 5319

////PushInstruction("constant 0")
@SP // 5320
AM=M+1 // 5321
A=A-1 // 5322
M=0 // 5323
@RETURN // 5324
0;JMP // 5325

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5326
@Sys.halt_WHILE_END1 // 5327
D;JNE // 5328

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5329
0;JMP // 5330

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5331
AM=M+1 // 5332
A=A-1 // 5333
M=0 // 5334
@RETURN // 5335
0;JMP // 5336

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5337
D=A // 5338
@SP // 5339
AM=D+M // 5340
A=A-1 // 5341
M=0 // 5342
A=A-1 // 5343
M=0 // 5344
A=A-1 // 5345
M=0 // 5346
A=A-1 // 5347
M=0 // 5348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5349
A=M // 5350
D=M // 5351
@SP // 5352
AM=M+1 // 5353
A=A-1 // 5354
M=D // 5355
// call Output.getMap
@6 // 5356
D=A // 5357
@14 // 5358
M=D // 5359
@Output.getMap // 5360
D=A // 5361
@13 // 5362
M=D // 5363
@Output.printChar.ret.0 // 5364
D=A // 5365
@CALL // 5366
0;JMP // 5367
(Output.printChar.ret.0)
@SP // 5368
AM=M-1 // 5369
D=M // 5370
@LCL // 5371
A=M // 5372
M=D // 5373

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5374
A=M+1 // 5375
A=A+1 // 5376
A=A+1 // 5377
M=0 // 5378

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
@Output.printChar.LT.50 // 5379
D=A // 5380
@SP // 5381
AM=M+1 // 5382
A=A-1 // 5383
M=D // 5384
@LCL // 5385
A=M+1 // 5386
A=A+1 // 5387
A=A+1 // 5388
D=M // 5389
@11 // 5390
D=D-A // 5391
@DO_LT // 5392
0;JMP // 5393
(Output.printChar.LT.50)
D=!D // 5394
@Output.printChar_WHILE_END1 // 5395
D;JNE // 5396

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

@Output.2 // 5397
D=M // 5398
@SP // 5399
AM=M+1 // 5400
A=A-1 // 5401
M=D // 5402
@11 // 5403
D=A // 5404
@SP // 5405
AM=M+1 // 5406
A=A-1 // 5407
M=D // 5408
// call Math.multiply
@7 // 5409
D=A // 5410
@14 // 5411
M=D // 5412
@Math.multiply // 5413
D=A // 5414
@13 // 5415
M=D // 5416
@Output.printChar.ret.1 // 5417
D=A // 5418
@CALL // 5419
0;JMP // 5420
(Output.printChar.ret.1)
@LCL // 5421
A=M+1 // 5422
A=A+1 // 5423
A=A+1 // 5424
D=M // 5425
@SP // 5426
AM=M-1 // 5427
D=D+M // 5428
@SP // 5429
AM=M+1 // 5430
A=A-1 // 5431
M=D // 5432
@32 // 5433
D=A // 5434
@SP // 5435
AM=M+1 // 5436
A=A-1 // 5437
M=D // 5438
// call Math.multiply
@7 // 5439
D=A // 5440
@14 // 5441
M=D // 5442
@Math.multiply // 5443
D=A // 5444
@13 // 5445
M=D // 5446
@Output.printChar.ret.2 // 5447
D=A // 5448
@CALL // 5449
0;JMP // 5450
(Output.printChar.ret.2)
@SP // 5451
AM=M-1 // 5452
D=M // 5453
@16384 // 5454
D=D+A // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=D // 5459
@Output.1 // 5460
D=M // 5461
@SP // 5462
AM=M+1 // 5463
A=A-1 // 5464
M=D // 5465
@2 // 5466
D=A // 5467
@SP // 5468
AM=M+1 // 5469
A=A-1 // 5470
M=D // 5471
// call Math.divide
@7 // 5472
D=A // 5473
@14 // 5474
M=D // 5475
@Math.divide // 5476
D=A // 5477
@13 // 5478
M=D // 5479
@Output.printChar.ret.3 // 5480
D=A // 5481
@CALL // 5482
0;JMP // 5483
(Output.printChar.ret.3)
@SP // 5484
AM=M-1 // 5485
D=M // 5486
@SP // 5487
AM=M-1 // 5488
D=D+M // 5489
@LCL // 5490
A=M+1 // 5491
M=D // 5492

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
@Output.printChar.EQ.51 // 5493
D=A // 5494
@SP // 5495
AM=M+1 // 5496
A=A-1 // 5497
M=D // 5498
@Output.1 // 5499
D=M // 5500
@1 // 5501
D=D&A // 5502
@DO_EQ // 5503
0;JMP // 5504
(Output.printChar.EQ.51)
@Output.printChar$IF_TRUE1 // 5505
D;JNE // 5506

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5507
0;JMP // 5508

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

@LCL // 5509
A=M+1 // 5510
A=A+1 // 5511
A=A+1 // 5512
D=M // 5513
A=A-1 // 5514
A=A-1 // 5515
A=A-1 // 5516
A=D+M // 5517
D=M // 5518
@LCL // 5519
A=M+1 // 5520
A=A+1 // 5521
M=D // 5522

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5523
0;JMP // 5524

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

@LCL // 5525
A=M+1 // 5526
A=A+1 // 5527
A=A+1 // 5528
D=M // 5529
A=A-1 // 5530
A=A-1 // 5531
A=A-1 // 5532
A=D+M // 5533
D=M // 5534
@SP // 5535
AM=M+1 // 5536
A=A-1 // 5537
M=D // 5538
@256 // 5539
D=A // 5540
@SP // 5541
AM=M+1 // 5542
A=A-1 // 5543
M=D // 5544
// call Math.multiply
@7 // 5545
D=A // 5546
@14 // 5547
M=D // 5548
@Math.multiply // 5549
D=A // 5550
@13 // 5551
M=D // 5552
@Output.printChar.ret.4 // 5553
D=A // 5554
@CALL // 5555
0;JMP // 5556
(Output.printChar.ret.4)
@SP // 5557
AM=M-1 // 5558
D=M // 5559
@LCL // 5560
A=M+1 // 5561
A=A+1 // 5562
M=D // 5563

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
@LCL // 5564
A=M+1 // 5565
D=M // 5566
@SP // 5567
AM=M+1 // 5568
A=A-1 // 5569
M=D // 5570
@LCL // 5571
A=M+1 // 5572
D=M // 5573
@0 // 5574
A=D+A // 5575
D=M // 5576
@SP // 5577
AM=M+1 // 5578
A=A-1 // 5579
M=D // 5580
@LCL // 5581
A=M+1 // 5582
A=A+1 // 5583
D=M // 5584
@SP // 5585
AM=M-1 // 5586
D=D|M // 5587
@SP // 5588
AM=M-1 // 5589
A=M // 5590
M=D // 5591

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

@LCL // 5592
A=M+1 // 5593
A=A+1 // 5594
A=A+1 // 5595
M=M+1 // 5596

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5597
0;JMP // 5598

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
@Output.printChar.EQ.52 // 5599
D=A // 5600
@SP // 5601
AM=M+1 // 5602
A=A-1 // 5603
M=D // 5604
@Output.1 // 5605
D=M // 5606
@63 // 5607
D=D-A // 5608
@DO_EQ // 5609
0;JMP // 5610
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE2 // 5611
D;JNE // 5612

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5613
0;JMP // 5614

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5615
D=A // 5616
@14 // 5617
M=D // 5618
@Output.println // 5619
D=A // 5620
@13 // 5621
M=D // 5622
@Output.printChar.ret.5 // 5623
D=A // 5624
@CALL // 5625
0;JMP // 5626
(Output.printChar.ret.5)
@SP // 5627
M=M-1 // 5628

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5629
0;JMP // 5630

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

@Output.1 // 5631
M=M+1 // 5632

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5633
AM=M+1 // 5634
A=A-1 // 5635
M=0 // 5636
@RETURN // 5637
0;JMP // 5638

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
@Memory.remove_node.EQ.53 // 5639
D=A // 5640
@SP // 5641
AM=M+1 // 5642
A=A-1 // 5643
M=D // 5644
@ARG // 5645
A=M+1 // 5646
D=M // 5647
@2 // 5648
A=D+A // 5649
D=M // 5650
@DO_EQ // 5651
0;JMP // 5652
(Memory.remove_node.EQ.53)
D=!D // 5653
@Memory.remove_node$IF_TRUE1 // 5654
D;JNE // 5655

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5656
0;JMP // 5657

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
@ARG // 5658
A=M+1 // 5659
D=M // 5660
@2 // 5661
D=D+A // 5662
@3 // 5663
D=D+A // 5664
@SP // 5665
AM=M+1 // 5666
A=A-1 // 5667
M=D // 5668
@ARG // 5669
A=M+1 // 5670
D=M // 5671
@3 // 5672
A=D+A // 5673
D=M // 5674
@SP // 5675
AM=M-1 // 5676
A=M // 5677
M=D // 5678

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5679
0;JMP // 5680

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
@ARG // 5681
A=M // 5682
D=M // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=D // 5687
@ARG // 5688
A=M+1 // 5689
D=M // 5690
@3 // 5691
A=D+A // 5692
D=M // 5693
@SP // 5694
AM=M-1 // 5695
A=M // 5696
M=D // 5697

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
@Memory.remove_node.EQ.54 // 5698
D=A // 5699
@SP // 5700
AM=M+1 // 5701
A=A-1 // 5702
M=D // 5703
@ARG // 5704
A=M+1 // 5705
D=M // 5706
@3 // 5707
A=D+A // 5708
D=M // 5709
@DO_EQ // 5710
0;JMP // 5711
(Memory.remove_node.EQ.54)
D=!D // 5712
@Memory.remove_node$IF_TRUE2 // 5713
D;JNE // 5714

////GotoInstruction{label='Memory.remove_node$IF_FALSE2}
// goto Memory.remove_node$IF_FALSE2
@Memory.remove_node$IF_FALSE2 // 5715
0;JMP // 5716

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
@ARG // 5717
A=M+1 // 5718
D=M // 5719
@3 // 5720
D=D+A // 5721
@2 // 5722
D=D+A // 5723
@SP // 5724
AM=M+1 // 5725
A=A-1 // 5726
M=D // 5727
@ARG // 5728
A=M+1 // 5729
D=M // 5730
@2 // 5731
A=D+A // 5732
D=M // 5733
@SP // 5734
AM=M-1 // 5735
A=M // 5736
M=D // 5737

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
@ARG // 5738
A=M+1 // 5739
D=M // 5740
@2 // 5741
D=D+A // 5742
@SP // 5743
AM=M+1 // 5744
A=A-1 // 5745
M=D // 5746
D=0 // 5747
@SP // 5748
AM=M-1 // 5749
A=M // 5750
M=D // 5751

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5752
A=M+1 // 5753
D=M // 5754
@3 // 5755
D=D+A // 5756
@SP // 5757
AM=M+1 // 5758
A=A-1 // 5759
M=D // 5760
D=0 // 5761
@SP // 5762
AM=M-1 // 5763
A=M // 5764
M=D // 5765

////PushInstruction("constant 0")
@SP // 5766
AM=M+1 // 5767
A=A-1 // 5768
M=0 // 5769
@RETURN // 5770
0;JMP // 5771

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5772
AM=M+1 // 5773
A=A-1 // 5774
M=0 // 5775

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5776
D=A // 5777
@SP // 5778
AM=M+1 // 5779
A=A-1 // 5780
M=D // 5781
// call Array.new
@6 // 5782
D=A // 5783
@14 // 5784
M=D // 5785
@Array.new // 5786
D=A // 5787
@13 // 5788
M=D // 5789
@Output.init.ret.0 // 5790
D=A // 5791
@CALL // 5792
0;JMP // 5793
(Output.init.ret.0)
@SP // 5794
AM=M-1 // 5795
D=M // 5796
@Output.0 // 5797
M=D // 5798

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5799
D=A // 5800
@SP // 5801
M=D+M // 5802
@63 // 5803
D=A // 5804
@SP // 5805
A=M-1 // 5806
M=0 // 5807
A=A-1 // 5808
M=0 // 5809
A=A-1 // 5810
M=D // 5811
A=A-1 // 5812
M=D // 5813
A=A-1 // 5814
M=D // 5815
A=A-1 // 5816
M=D // 5817
A=A-1 // 5818
M=D // 5819
A=A-1 // 5820
M=D // 5821
A=A-1 // 5822
M=D // 5823
A=A-1 // 5824
M=D // 5825
A=A-1 // 5826
M=D // 5827
A=A-1 // 5828
M=0 // 5829
// call Output.create
@17 // 5830
D=A // 5831
@14 // 5832
M=D // 5833
@Output.create // 5834
D=A // 5835
@13 // 5836
M=D // 5837
@Output.init.ret.1 // 5838
D=A // 5839
@CALL // 5840
0;JMP // 5841
(Output.init.ret.1)
@SP // 5842
M=M-1 // 5843

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5844
D=A // 5845
@SP // 5846
M=D+M // 5847
@32 // 5848
D=A // 5849
@SP // 5850
A=M-1 // 5851
M=0 // 5852
A=A-1 // 5853
M=0 // 5854
A=A-1 // 5855
M=0 // 5856
A=A-1 // 5857
M=0 // 5858
A=A-1 // 5859
M=0 // 5860
A=A-1 // 5861
M=0 // 5862
A=A-1 // 5863
M=0 // 5864
A=A-1 // 5865
M=0 // 5866
A=A-1 // 5867
M=0 // 5868
A=A-1 // 5869
M=0 // 5870
A=A-1 // 5871
M=0 // 5872
A=A-1 // 5873
M=D // 5874
A=A-1 // 5875
// call Output.create
@17 // 5876
D=A // 5877
@14 // 5878
M=D // 5879
@Output.create // 5880
D=A // 5881
@13 // 5882
M=D // 5883
@Output.init.ret.2 // 5884
D=A // 5885
@CALL // 5886
0;JMP // 5887
(Output.init.ret.2)
@SP // 5888
M=M-1 // 5889

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5890
D=A // 5891
@SP // 5892
AM=M+1 // 5893
A=A-1 // 5894
M=D // 5895
@12 // 5896
D=A // 5897
@SP // 5898
AM=M+1 // 5899
A=A-1 // 5900
M=D // 5901
@30 // 5902
D=A // 5903
@SP // 5904
AM=M+1 // 5905
A=A-1 // 5906
M=D // 5907
@30 // 5908
D=A // 5909
@SP // 5910
AM=M+1 // 5911
A=A-1 // 5912
M=D // 5913
@30 // 5914
D=A // 5915
@SP // 5916
AM=M+1 // 5917
A=A-1 // 5918
M=D // 5919
@12 // 5920
D=A // 5921
@SP // 5922
AM=M+1 // 5923
A=A-1 // 5924
M=D // 5925
@12 // 5926
D=A // 5927
@SP // 5928
AM=M+1 // 5929
A=A-1 // 5930
M=D // 5931
@SP // 5932
AM=M+1 // 5933
A=A-1 // 5934
M=0 // 5935
@4 // 5936
D=A // 5937
@SP // 5938
M=D+M // 5939
@12 // 5940
D=A // 5941
@SP // 5942
A=M-1 // 5943
M=0 // 5944
A=A-1 // 5945
M=0 // 5946
A=A-1 // 5947
M=D // 5948
A=A-1 // 5949
M=D // 5950
A=A-1 // 5951
// call Output.create
@17 // 5952
D=A // 5953
@14 // 5954
M=D // 5955
@Output.create // 5956
D=A // 5957
@13 // 5958
M=D // 5959
@Output.init.ret.3 // 5960
D=A // 5961
@CALL // 5962
0;JMP // 5963
(Output.init.ret.3)
@SP // 5964
M=M-1 // 5965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5966
D=A // 5967
@SP // 5968
AM=M+1 // 5969
A=A-1 // 5970
M=D // 5971
@54 // 5972
D=A // 5973
@SP // 5974
AM=M+1 // 5975
A=A-1 // 5976
M=D // 5977
@54 // 5978
D=A // 5979
@SP // 5980
AM=M+1 // 5981
A=A-1 // 5982
M=D // 5983
@20 // 5984
D=A // 5985
@SP // 5986
AM=M+1 // 5987
A=A-1 // 5988
M=D // 5989
@SP // 5990
AM=M+1 // 5991
A=A-1 // 5992
M=0 // 5993
@SP // 5994
AM=M+1 // 5995
A=A-1 // 5996
M=0 // 5997
@SP // 5998
AM=M+1 // 5999
A=A-1 // 6000
M=0 // 6001
@SP // 6002
AM=M+1 // 6003
A=A-1 // 6004
M=0 // 6005
@SP // 6006
AM=M+1 // 6007
A=A-1 // 6008
M=0 // 6009
@SP // 6010
AM=M+1 // 6011
A=A-1 // 6012
M=0 // 6013
@SP // 6014
AM=M+1 // 6015
A=A-1 // 6016
M=0 // 6017
@SP // 6018
AM=M+1 // 6019
A=A-1 // 6020
M=0 // 6021
// call Output.create
@17 // 6022
D=A // 6023
@14 // 6024
M=D // 6025
@Output.create // 6026
D=A // 6027
@13 // 6028
M=D // 6029
@Output.init.ret.4 // 6030
D=A // 6031
@CALL // 6032
0;JMP // 6033
(Output.init.ret.4)
@SP // 6034
M=M-1 // 6035

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 6036
D=A // 6037
@SP // 6038
M=D+M // 6039
@35 // 6040
D=A // 6041
@SP // 6042
A=M-1 // 6043
M=0 // 6044
A=A-1 // 6045
M=D // 6046
A=A-1 // 6047
@18 // 6048
D=A // 6049
@SP // 6050
AM=M+1 // 6051
A=A-1 // 6052
M=D // 6053
@18 // 6054
D=A // 6055
@SP // 6056
AM=M+1 // 6057
A=A-1 // 6058
M=D // 6059
@63 // 6060
D=A // 6061
@SP // 6062
AM=M+1 // 6063
A=A-1 // 6064
M=D // 6065
@18 // 6066
D=A // 6067
@SP // 6068
AM=M+1 // 6069
A=A-1 // 6070
M=D // 6071
@18 // 6072
D=A // 6073
@SP // 6074
AM=M+1 // 6075
A=A-1 // 6076
M=D // 6077
@63 // 6078
D=A // 6079
@SP // 6080
AM=M+1 // 6081
A=A-1 // 6082
M=D // 6083
@18 // 6084
D=A // 6085
@SP // 6086
AM=M+1 // 6087
A=A-1 // 6088
M=D // 6089
@18 // 6090
D=A // 6091
@SP // 6092
AM=M+1 // 6093
A=A-1 // 6094
M=D // 6095
@SP // 6096
AM=M+1 // 6097
A=A-1 // 6098
M=0 // 6099
@SP // 6100
AM=M+1 // 6101
A=A-1 // 6102
M=0 // 6103
// call Output.create
@17 // 6104
D=A // 6105
@14 // 6106
M=D // 6107
@Output.create // 6108
D=A // 6109
@13 // 6110
M=D // 6111
@Output.init.ret.5 // 6112
D=A // 6113
@CALL // 6114
0;JMP // 6115
(Output.init.ret.5)
@SP // 6116
M=M-1 // 6117

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6118
D=A // 6119
@SP // 6120
AM=M+1 // 6121
A=A-1 // 6122
M=D // 6123
@12 // 6124
D=A // 6125
@SP // 6126
AM=M+1 // 6127
A=A-1 // 6128
M=D // 6129
@30 // 6130
D=A // 6131
@SP // 6132
AM=M+1 // 6133
A=A-1 // 6134
M=D // 6135
@51 // 6136
D=A // 6137
@SP // 6138
AM=M+1 // 6139
A=A-1 // 6140
M=D // 6141
@3 // 6142
D=A // 6143
@SP // 6144
AM=M+1 // 6145
A=A-1 // 6146
M=D // 6147
@30 // 6148
D=A // 6149
@SP // 6150
AM=M+1 // 6151
A=A-1 // 6152
M=D // 6153
@48 // 6154
D=A // 6155
@SP // 6156
AM=M+1 // 6157
A=A-1 // 6158
M=D // 6159
@51 // 6160
D=A // 6161
@SP // 6162
AM=M+1 // 6163
A=A-1 // 6164
M=D // 6165
@30 // 6166
D=A // 6167
@SP // 6168
AM=M+1 // 6169
A=A-1 // 6170
M=D // 6171
@12 // 6172
D=A // 6173
@SP // 6174
AM=M+1 // 6175
A=A-1 // 6176
M=D // 6177
@12 // 6178
D=A // 6179
@SP // 6180
AM=M+1 // 6181
A=A-1 // 6182
M=D // 6183
@SP // 6184
AM=M+1 // 6185
A=A-1 // 6186
M=0 // 6187
// call Output.create
@17 // 6188
D=A // 6189
@14 // 6190
M=D // 6191
@Output.create // 6192
D=A // 6193
@13 // 6194
M=D // 6195
@Output.init.ret.6 // 6196
D=A // 6197
@CALL // 6198
0;JMP // 6199
(Output.init.ret.6)
@SP // 6200
M=M-1 // 6201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6202
D=A // 6203
@SP // 6204
M=D+M // 6205
@37 // 6206
D=A // 6207
@SP // 6208
A=M-1 // 6209
M=0 // 6210
A=A-1 // 6211
M=0 // 6212
A=A-1 // 6213
M=D // 6214
A=A-1 // 6215
@35 // 6216
D=A // 6217
@SP // 6218
AM=M+1 // 6219
A=A-1 // 6220
M=D // 6221
@51 // 6222
D=A // 6223
@SP // 6224
AM=M+1 // 6225
A=A-1 // 6226
M=D // 6227
@24 // 6228
D=A // 6229
@SP // 6230
AM=M+1 // 6231
A=A-1 // 6232
M=D // 6233
@12 // 6234
D=A // 6235
@SP // 6236
AM=M+1 // 6237
A=A-1 // 6238
M=D // 6239
@6 // 6240
D=A // 6241
@SP // 6242
AM=M+1 // 6243
A=A-1 // 6244
M=D // 6245
@51 // 6246
D=A // 6247
@SP // 6248
AM=M+1 // 6249
A=A-1 // 6250
M=D // 6251
@49 // 6252
D=A // 6253
@SP // 6254
AM=M+1 // 6255
A=A-1 // 6256
M=D // 6257
@SP // 6258
AM=M+1 // 6259
A=A-1 // 6260
M=0 // 6261
@SP // 6262
AM=M+1 // 6263
A=A-1 // 6264
M=0 // 6265
// call Output.create
@17 // 6266
D=A // 6267
@14 // 6268
M=D // 6269
@Output.create // 6270
D=A // 6271
@13 // 6272
M=D // 6273
@Output.init.ret.7 // 6274
D=A // 6275
@CALL // 6276
0;JMP // 6277
(Output.init.ret.7)
@SP // 6278
M=M-1 // 6279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6280
D=A // 6281
@SP // 6282
AM=M+1 // 6283
A=A-1 // 6284
M=D // 6285
@12 // 6286
D=A // 6287
@SP // 6288
AM=M+1 // 6289
A=A-1 // 6290
M=D // 6291
@30 // 6292
D=A // 6293
@SP // 6294
AM=M+1 // 6295
A=A-1 // 6296
M=D // 6297
@30 // 6298
D=A // 6299
@SP // 6300
AM=M+1 // 6301
A=A-1 // 6302
M=D // 6303
@12 // 6304
D=A // 6305
@SP // 6306
AM=M+1 // 6307
A=A-1 // 6308
M=D // 6309
@54 // 6310
D=A // 6311
@SP // 6312
AM=M+1 // 6313
A=A-1 // 6314
M=D // 6315
@27 // 6316
D=A // 6317
@SP // 6318
AM=M+1 // 6319
A=A-1 // 6320
M=D // 6321
@27 // 6322
D=A // 6323
@SP // 6324
AM=M+1 // 6325
A=A-1 // 6326
M=D // 6327
@27 // 6328
D=A // 6329
@SP // 6330
AM=M+1 // 6331
A=A-1 // 6332
M=D // 6333
@54 // 6334
D=A // 6335
@SP // 6336
AM=M+1 // 6337
A=A-1 // 6338
M=D // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=0 // 6343
@SP // 6344
AM=M+1 // 6345
A=A-1 // 6346
M=0 // 6347
// call Output.create
@17 // 6348
D=A // 6349
@14 // 6350
M=D // 6351
@Output.create // 6352
D=A // 6353
@13 // 6354
M=D // 6355
@Output.init.ret.8 // 6356
D=A // 6357
@CALL // 6358
0;JMP // 6359
(Output.init.ret.8)
@SP // 6360
M=M-1 // 6361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6362
D=A // 6363
@SP // 6364
AM=M+1 // 6365
A=A-1 // 6366
M=D // 6367
@12 // 6368
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
@6 // 6380
D=A // 6381
@SP // 6382
AM=M+1 // 6383
A=A-1 // 6384
M=D // 6385
@SP // 6386
AM=M+1 // 6387
A=A-1 // 6388
M=0 // 6389
@SP // 6390
AM=M+1 // 6391
A=A-1 // 6392
M=0 // 6393
@SP // 6394
AM=M+1 // 6395
A=A-1 // 6396
M=0 // 6397
@SP // 6398
AM=M+1 // 6399
A=A-1 // 6400
M=0 // 6401
@SP // 6402
AM=M+1 // 6403
A=A-1 // 6404
M=0 // 6405
@SP // 6406
AM=M+1 // 6407
A=A-1 // 6408
M=0 // 6409
@SP // 6410
AM=M+1 // 6411
A=A-1 // 6412
M=0 // 6413
@SP // 6414
AM=M+1 // 6415
A=A-1 // 6416
M=0 // 6417
// call Output.create
@17 // 6418
D=A // 6419
@14 // 6420
M=D // 6421
@Output.create // 6422
D=A // 6423
@13 // 6424
M=D // 6425
@Output.init.ret.9 // 6426
D=A // 6427
@CALL // 6428
0;JMP // 6429
(Output.init.ret.9)
@SP // 6430
M=M-1 // 6431

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6432
D=A // 6433
@SP // 6434
AM=M+1 // 6435
A=A-1 // 6436
M=D // 6437
@24 // 6438
D=A // 6439
@SP // 6440
AM=M+1 // 6441
A=A-1 // 6442
M=D // 6443
@12 // 6444
D=A // 6445
@SP // 6446
AM=M+1 // 6447
A=A-1 // 6448
M=D // 6449
@6 // 6450
D=A // 6451
@SP // 6452
AM=M+1 // 6453
A=A-1 // 6454
M=D // 6455
@6 // 6456
D=A // 6457
@SP // 6458
AM=M+1 // 6459
A=A-1 // 6460
M=D // 6461
@6 // 6462
D=A // 6463
@SP // 6464
AM=M+1 // 6465
A=A-1 // 6466
M=D // 6467
@6 // 6468
D=A // 6469
@SP // 6470
AM=M+1 // 6471
A=A-1 // 6472
M=D // 6473
@6 // 6474
D=A // 6475
@SP // 6476
AM=M+1 // 6477
A=A-1 // 6478
M=D // 6479
@12 // 6480
D=A // 6481
@SP // 6482
AM=M+1 // 6483
A=A-1 // 6484
M=D // 6485
@24 // 6486
D=A // 6487
@SP // 6488
AM=M+1 // 6489
A=A-1 // 6490
M=D // 6491
@SP // 6492
AM=M+1 // 6493
A=A-1 // 6494
M=0 // 6495
@SP // 6496
AM=M+1 // 6497
A=A-1 // 6498
M=0 // 6499
// call Output.create
@17 // 6500
D=A // 6501
@14 // 6502
M=D // 6503
@Output.create // 6504
D=A // 6505
@13 // 6506
M=D // 6507
@Output.init.ret.10 // 6508
D=A // 6509
@CALL // 6510
0;JMP // 6511
(Output.init.ret.10)
@SP // 6512
M=M-1 // 6513

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6514
D=A // 6515
@SP // 6516
AM=M+1 // 6517
A=A-1 // 6518
M=D // 6519
@6 // 6520
D=A // 6521
@SP // 6522
AM=M+1 // 6523
A=A-1 // 6524
M=D // 6525
@12 // 6526
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
@24 // 6538
D=A // 6539
@SP // 6540
AM=M+1 // 6541
A=A-1 // 6542
M=D // 6543
@24 // 6544
D=A // 6545
@SP // 6546
AM=M+1 // 6547
A=A-1 // 6548
M=D // 6549
@24 // 6550
D=A // 6551
@SP // 6552
AM=M+1 // 6553
A=A-1 // 6554
M=D // 6555
@24 // 6556
D=A // 6557
@SP // 6558
AM=M+1 // 6559
A=A-1 // 6560
M=D // 6561
@12 // 6562
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
@SP // 6574
AM=M+1 // 6575
A=A-1 // 6576
M=0 // 6577
@SP // 6578
AM=M+1 // 6579
A=A-1 // 6580
M=0 // 6581
// call Output.create
@17 // 6582
D=A // 6583
@14 // 6584
M=D // 6585
@Output.create // 6586
D=A // 6587
@13 // 6588
M=D // 6589
@Output.init.ret.11 // 6590
D=A // 6591
@CALL // 6592
0;JMP // 6593
(Output.init.ret.11)
@SP // 6594
M=M-1 // 6595

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6596
D=A // 6597
@SP // 6598
M=D+M // 6599
@42 // 6600
D=A // 6601
@SP // 6602
A=M-1 // 6603
M=0 // 6604
A=A-1 // 6605
M=0 // 6606
A=A-1 // 6607
M=0 // 6608
A=A-1 // 6609
M=D // 6610
A=A-1 // 6611
@51 // 6612
D=A // 6613
@SP // 6614
AM=M+1 // 6615
A=A-1 // 6616
M=D // 6617
@30 // 6618
D=A // 6619
@SP // 6620
AM=M+1 // 6621
A=A-1 // 6622
M=D // 6623
@63 // 6624
D=A // 6625
@SP // 6626
AM=M+1 // 6627
A=A-1 // 6628
M=D // 6629
@30 // 6630
D=A // 6631
@SP // 6632
AM=M+1 // 6633
A=A-1 // 6634
M=D // 6635
@51 // 6636
D=A // 6637
@SP // 6638
AM=M+1 // 6639
A=A-1 // 6640
M=D // 6641
@SP // 6642
AM=M+1 // 6643
A=A-1 // 6644
M=0 // 6645
@SP // 6646
AM=M+1 // 6647
A=A-1 // 6648
M=0 // 6649
@SP // 6650
AM=M+1 // 6651
A=A-1 // 6652
M=0 // 6653
// call Output.create
@17 // 6654
D=A // 6655
@14 // 6656
M=D // 6657
@Output.create // 6658
D=A // 6659
@13 // 6660
M=D // 6661
@Output.init.ret.12 // 6662
D=A // 6663
@CALL // 6664
0;JMP // 6665
(Output.init.ret.12)
@SP // 6666
M=M-1 // 6667

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6668
D=A // 6669
@SP // 6670
M=D+M // 6671
@43 // 6672
D=A // 6673
@SP // 6674
A=M-1 // 6675
M=0 // 6676
A=A-1 // 6677
M=0 // 6678
A=A-1 // 6679
M=0 // 6680
A=A-1 // 6681
M=D // 6682
A=A-1 // 6683
@12 // 6684
D=A // 6685
@SP // 6686
AM=M+1 // 6687
A=A-1 // 6688
M=D // 6689
@12 // 6690
D=A // 6691
@SP // 6692
AM=M+1 // 6693
A=A-1 // 6694
M=D // 6695
@63 // 6696
D=A // 6697
@SP // 6698
AM=M+1 // 6699
A=A-1 // 6700
M=D // 6701
@12 // 6702
D=A // 6703
@SP // 6704
AM=M+1 // 6705
A=A-1 // 6706
M=D // 6707
@12 // 6708
D=A // 6709
@SP // 6710
AM=M+1 // 6711
A=A-1 // 6712
M=D // 6713
@SP // 6714
AM=M+1 // 6715
A=A-1 // 6716
M=0 // 6717
@SP // 6718
AM=M+1 // 6719
A=A-1 // 6720
M=0 // 6721
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=0 // 6725
// call Output.create
@17 // 6726
D=A // 6727
@14 // 6728
M=D // 6729
@Output.create // 6730
D=A // 6731
@13 // 6732
M=D // 6733
@Output.init.ret.13 // 6734
D=A // 6735
@CALL // 6736
0;JMP // 6737
(Output.init.ret.13)
@SP // 6738
M=M-1 // 6739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6740
D=A // 6741
@SP // 6742
M=D+M // 6743
@44 // 6744
D=A // 6745
@SP // 6746
A=M-1 // 6747
M=0 // 6748
A=A-1 // 6749
M=0 // 6750
A=A-1 // 6751
M=0 // 6752
A=A-1 // 6753
M=0 // 6754
A=A-1 // 6755
M=0 // 6756
A=A-1 // 6757
M=0 // 6758
A=A-1 // 6759
M=0 // 6760
A=A-1 // 6761
M=D // 6762
A=A-1 // 6763
@12 // 6764
D=A // 6765
@SP // 6766
AM=M+1 // 6767
A=A-1 // 6768
M=D // 6769
@12 // 6770
D=A // 6771
@SP // 6772
AM=M+1 // 6773
A=A-1 // 6774
M=D // 6775
@6 // 6776
D=A // 6777
@SP // 6778
AM=M+1 // 6779
A=A-1 // 6780
M=D // 6781
@SP // 6782
AM=M+1 // 6783
A=A-1 // 6784
M=0 // 6785
// call Output.create
@17 // 6786
D=A // 6787
@14 // 6788
M=D // 6789
@Output.create // 6790
D=A // 6791
@13 // 6792
M=D // 6793
@Output.init.ret.14 // 6794
D=A // 6795
@CALL // 6796
0;JMP // 6797
(Output.init.ret.14)
@SP // 6798
M=M-1 // 6799

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6800
D=A // 6801
@SP // 6802
M=D+M // 6803
@45 // 6804
D=A // 6805
@SP // 6806
A=M-1 // 6807
M=0 // 6808
A=A-1 // 6809
M=0 // 6810
A=A-1 // 6811
M=0 // 6812
A=A-1 // 6813
M=0 // 6814
A=A-1 // 6815
M=0 // 6816
A=A-1 // 6817
M=D // 6818
A=A-1 // 6819
@6 // 6820
D=A // 6821
@SP // 6822
M=D+M // 6823
@63 // 6824
D=A // 6825
@SP // 6826
A=M-1 // 6827
M=0 // 6828
A=A-1 // 6829
M=0 // 6830
A=A-1 // 6831
M=0 // 6832
A=A-1 // 6833
M=0 // 6834
A=A-1 // 6835
M=0 // 6836
A=A-1 // 6837
M=D // 6838
A=A-1 // 6839
// call Output.create
@17 // 6840
D=A // 6841
@14 // 6842
M=D // 6843
@Output.create // 6844
D=A // 6845
@13 // 6846
M=D // 6847
@Output.init.ret.15 // 6848
D=A // 6849
@CALL // 6850
0;JMP // 6851
(Output.init.ret.15)
@SP // 6852
M=M-1 // 6853

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6854
D=A // 6855
@SP // 6856
M=D+M // 6857
@46 // 6858
D=A // 6859
@SP // 6860
A=M-1 // 6861
M=0 // 6862
A=A-1 // 6863
M=0 // 6864
A=A-1 // 6865
M=0 // 6866
A=A-1 // 6867
M=0 // 6868
A=A-1 // 6869
M=0 // 6870
A=A-1 // 6871
M=0 // 6872
A=A-1 // 6873
M=0 // 6874
A=A-1 // 6875
M=D // 6876
A=A-1 // 6877
@4 // 6878
D=A // 6879
@SP // 6880
M=D+M // 6881
@12 // 6882
D=A // 6883
@SP // 6884
A=M-1 // 6885
M=0 // 6886
A=A-1 // 6887
M=0 // 6888
A=A-1 // 6889
M=D // 6890
A=A-1 // 6891
M=D // 6892
A=A-1 // 6893
// call Output.create
@17 // 6894
D=A // 6895
@14 // 6896
M=D // 6897
@Output.create // 6898
D=A // 6899
@13 // 6900
M=D // 6901
@Output.init.ret.16 // 6902
D=A // 6903
@CALL // 6904
0;JMP // 6905
(Output.init.ret.16)
@SP // 6906
M=M-1 // 6907

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6908
D=A // 6909
@SP // 6910
M=D+M // 6911
@47 // 6912
D=A // 6913
@SP // 6914
A=M-1 // 6915
M=0 // 6916
A=A-1 // 6917
M=0 // 6918
A=A-1 // 6919
M=D // 6920
A=A-1 // 6921
@32 // 6922
D=A // 6923
@SP // 6924
AM=M+1 // 6925
A=A-1 // 6926
M=D // 6927
@48 // 6928
D=A // 6929
@SP // 6930
AM=M+1 // 6931
A=A-1 // 6932
M=D // 6933
@24 // 6934
D=A // 6935
@SP // 6936
AM=M+1 // 6937
A=A-1 // 6938
M=D // 6939
@12 // 6940
D=A // 6941
@SP // 6942
AM=M+1 // 6943
A=A-1 // 6944
M=D // 6945
@6 // 6946
D=A // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951
@3 // 6952
D=A // 6953
@SP // 6954
AM=M+1 // 6955
A=A-1 // 6956
M=D // 6957
@SP // 6958
AM=M+1 // 6959
A=A-1 // 6960
M=1 // 6961
@SP // 6962
AM=M+1 // 6963
A=A-1 // 6964
M=0 // 6965
@SP // 6966
AM=M+1 // 6967
A=A-1 // 6968
M=0 // 6969
// call Output.create
@17 // 6970
D=A // 6971
@14 // 6972
M=D // 6973
@Output.create // 6974
D=A // 6975
@13 // 6976
M=D // 6977
@Output.init.ret.17 // 6978
D=A // 6979
@CALL // 6980
0;JMP // 6981
(Output.init.ret.17)
@SP // 6982
M=M-1 // 6983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6984
D=A // 6985
@SP // 6986
AM=M+1 // 6987
A=A-1 // 6988
M=D // 6989
@12 // 6990
D=A // 6991
@SP // 6992
AM=M+1 // 6993
A=A-1 // 6994
M=D // 6995
@30 // 6996
D=A // 6997
@SP // 6998
AM=M+1 // 6999
A=A-1 // 7000
M=D // 7001
@51 // 7002
D=A // 7003
@SP // 7004
AM=M+1 // 7005
A=A-1 // 7006
M=D // 7007
@51 // 7008
D=A // 7009
@SP // 7010
AM=M+1 // 7011
A=A-1 // 7012
M=D // 7013
@51 // 7014
D=A // 7015
@SP // 7016
AM=M+1 // 7017
A=A-1 // 7018
M=D // 7019
@51 // 7020
D=A // 7021
@SP // 7022
AM=M+1 // 7023
A=A-1 // 7024
M=D // 7025
@51 // 7026
D=A // 7027
@SP // 7028
AM=M+1 // 7029
A=A-1 // 7030
M=D // 7031
@30 // 7032
D=A // 7033
@SP // 7034
AM=M+1 // 7035
A=A-1 // 7036
M=D // 7037
@12 // 7038
D=A // 7039
@SP // 7040
AM=M+1 // 7041
A=A-1 // 7042
M=D // 7043
@SP // 7044
AM=M+1 // 7045
A=A-1 // 7046
M=0 // 7047
@SP // 7048
AM=M+1 // 7049
A=A-1 // 7050
M=0 // 7051
// call Output.create
@17 // 7052
D=A // 7053
@14 // 7054
M=D // 7055
@Output.create // 7056
D=A // 7057
@13 // 7058
M=D // 7059
@Output.init.ret.18 // 7060
D=A // 7061
@CALL // 7062
0;JMP // 7063
(Output.init.ret.18)
@SP // 7064
M=M-1 // 7065

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 7066
D=A // 7067
@SP // 7068
AM=M+1 // 7069
A=A-1 // 7070
M=D // 7071
@12 // 7072
D=A // 7073
@SP // 7074
AM=M+1 // 7075
A=A-1 // 7076
M=D // 7077
@14 // 7078
D=A // 7079
@SP // 7080
AM=M+1 // 7081
A=A-1 // 7082
M=D // 7083
@15 // 7084
D=A // 7085
@SP // 7086
AM=M+1 // 7087
A=A-1 // 7088
M=D // 7089
@12 // 7090
D=A // 7091
@SP // 7092
AM=M+1 // 7093
A=A-1 // 7094
M=D // 7095
@12 // 7096
D=A // 7097
@SP // 7098
AM=M+1 // 7099
A=A-1 // 7100
M=D // 7101
@12 // 7102
D=A // 7103
@SP // 7104
AM=M+1 // 7105
A=A-1 // 7106
M=D // 7107
@12 // 7108
D=A // 7109
@SP // 7110
AM=M+1 // 7111
A=A-1 // 7112
M=D // 7113
@12 // 7114
D=A // 7115
@SP // 7116
AM=M+1 // 7117
A=A-1 // 7118
M=D // 7119
@63 // 7120
D=A // 7121
@SP // 7122
AM=M+1 // 7123
A=A-1 // 7124
M=D // 7125
@SP // 7126
AM=M+1 // 7127
A=A-1 // 7128
M=0 // 7129
@SP // 7130
AM=M+1 // 7131
A=A-1 // 7132
M=0 // 7133
// call Output.create
@17 // 7134
D=A // 7135
@14 // 7136
M=D // 7137
@Output.create // 7138
D=A // 7139
@13 // 7140
M=D // 7141
@Output.init.ret.19 // 7142
D=A // 7143
@CALL // 7144
0;JMP // 7145
(Output.init.ret.19)
@SP // 7146
M=M-1 // 7147

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7148
D=A // 7149
@SP // 7150
AM=M+1 // 7151
A=A-1 // 7152
M=D // 7153
@30 // 7154
D=A // 7155
@SP // 7156
AM=M+1 // 7157
A=A-1 // 7158
M=D // 7159
@51 // 7160
D=A // 7161
@SP // 7162
AM=M+1 // 7163
A=A-1 // 7164
M=D // 7165
@48 // 7166
D=A // 7167
@SP // 7168
AM=M+1 // 7169
A=A-1 // 7170
M=D // 7171
@24 // 7172
D=A // 7173
@SP // 7174
AM=M+1 // 7175
A=A-1 // 7176
M=D // 7177
@12 // 7178
D=A // 7179
@SP // 7180
AM=M+1 // 7181
A=A-1 // 7182
M=D // 7183
@6 // 7184
D=A // 7185
@SP // 7186
AM=M+1 // 7187
A=A-1 // 7188
M=D // 7189
@3 // 7190
D=A // 7191
@SP // 7192
AM=M+1 // 7193
A=A-1 // 7194
M=D // 7195
@51 // 7196
D=A // 7197
@SP // 7198
AM=M+1 // 7199
A=A-1 // 7200
M=D // 7201
@63 // 7202
D=A // 7203
@SP // 7204
AM=M+1 // 7205
A=A-1 // 7206
M=D // 7207
@SP // 7208
AM=M+1 // 7209
A=A-1 // 7210
M=0 // 7211
@SP // 7212
AM=M+1 // 7213
A=A-1 // 7214
M=0 // 7215
// call Output.create
@17 // 7216
D=A // 7217
@14 // 7218
M=D // 7219
@Output.create // 7220
D=A // 7221
@13 // 7222
M=D // 7223
@Output.init.ret.20 // 7224
D=A // 7225
@CALL // 7226
0;JMP // 7227
(Output.init.ret.20)
@SP // 7228
M=M-1 // 7229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7230
D=A // 7231
@SP // 7232
AM=M+1 // 7233
A=A-1 // 7234
M=D // 7235
@30 // 7236
D=A // 7237
@SP // 7238
AM=M+1 // 7239
A=A-1 // 7240
M=D // 7241
@51 // 7242
D=A // 7243
@SP // 7244
AM=M+1 // 7245
A=A-1 // 7246
M=D // 7247
@48 // 7248
D=A // 7249
@SP // 7250
AM=M+1 // 7251
A=A-1 // 7252
M=D // 7253
@48 // 7254
D=A // 7255
@SP // 7256
AM=M+1 // 7257
A=A-1 // 7258
M=D // 7259
@28 // 7260
D=A // 7261
@SP // 7262
AM=M+1 // 7263
A=A-1 // 7264
M=D // 7265
@48 // 7266
D=A // 7267
@SP // 7268
AM=M+1 // 7269
A=A-1 // 7270
M=D // 7271
@48 // 7272
D=A // 7273
@SP // 7274
AM=M+1 // 7275
A=A-1 // 7276
M=D // 7277
@51 // 7278
D=A // 7279
@SP // 7280
AM=M+1 // 7281
A=A-1 // 7282
M=D // 7283
@30 // 7284
D=A // 7285
@SP // 7286
AM=M+1 // 7287
A=A-1 // 7288
M=D // 7289
@SP // 7290
AM=M+1 // 7291
A=A-1 // 7292
M=0 // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=0 // 7297
// call Output.create
@17 // 7298
D=A // 7299
@14 // 7300
M=D // 7301
@Output.create // 7302
D=A // 7303
@13 // 7304
M=D // 7305
@Output.init.ret.21 // 7306
D=A // 7307
@CALL // 7308
0;JMP // 7309
(Output.init.ret.21)
@SP // 7310
M=M-1 // 7311

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7312
D=A // 7313
@SP // 7314
AM=M+1 // 7315
A=A-1 // 7316
M=D // 7317
@16 // 7318
D=A // 7319
@SP // 7320
AM=M+1 // 7321
A=A-1 // 7322
M=D // 7323
@24 // 7324
D=A // 7325
@SP // 7326
AM=M+1 // 7327
A=A-1 // 7328
M=D // 7329
@28 // 7330
D=A // 7331
@SP // 7332
AM=M+1 // 7333
A=A-1 // 7334
M=D // 7335
@26 // 7336
D=A // 7337
@SP // 7338
AM=M+1 // 7339
A=A-1 // 7340
M=D // 7341
@25 // 7342
D=A // 7343
@SP // 7344
AM=M+1 // 7345
A=A-1 // 7346
M=D // 7347
@63 // 7348
D=A // 7349
@SP // 7350
AM=M+1 // 7351
A=A-1 // 7352
M=D // 7353
@24 // 7354
D=A // 7355
@SP // 7356
AM=M+1 // 7357
A=A-1 // 7358
M=D // 7359
@24 // 7360
D=A // 7361
@SP // 7362
AM=M+1 // 7363
A=A-1 // 7364
M=D // 7365
@60 // 7366
D=A // 7367
@SP // 7368
AM=M+1 // 7369
A=A-1 // 7370
M=D // 7371
@SP // 7372
AM=M+1 // 7373
A=A-1 // 7374
M=0 // 7375
@SP // 7376
AM=M+1 // 7377
A=A-1 // 7378
M=0 // 7379
// call Output.create
@17 // 7380
D=A // 7381
@14 // 7382
M=D // 7383
@Output.create // 7384
D=A // 7385
@13 // 7386
M=D // 7387
@Output.init.ret.22 // 7388
D=A // 7389
@CALL // 7390
0;JMP // 7391
(Output.init.ret.22)
@SP // 7392
M=M-1 // 7393

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7394
D=A // 7395
@SP // 7396
AM=M+1 // 7397
A=A-1 // 7398
M=D // 7399
@63 // 7400
D=A // 7401
@SP // 7402
AM=M+1 // 7403
A=A-1 // 7404
M=D // 7405
@3 // 7406
D=A // 7407
@SP // 7408
AM=M+1 // 7409
A=A-1 // 7410
M=D // 7411
@3 // 7412
D=A // 7413
@SP // 7414
AM=M+1 // 7415
A=A-1 // 7416
M=D // 7417
@31 // 7418
D=A // 7419
@SP // 7420
AM=M+1 // 7421
A=A-1 // 7422
M=D // 7423
@48 // 7424
D=A // 7425
@SP // 7426
AM=M+1 // 7427
A=A-1 // 7428
M=D // 7429
@48 // 7430
D=A // 7431
@SP // 7432
AM=M+1 // 7433
A=A-1 // 7434
M=D // 7435
@48 // 7436
D=A // 7437
@SP // 7438
AM=M+1 // 7439
A=A-1 // 7440
M=D // 7441
@51 // 7442
D=A // 7443
@SP // 7444
AM=M+1 // 7445
A=A-1 // 7446
M=D // 7447
@30 // 7448
D=A // 7449
@SP // 7450
AM=M+1 // 7451
A=A-1 // 7452
M=D // 7453
@SP // 7454
AM=M+1 // 7455
A=A-1 // 7456
M=0 // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=0 // 7461
// call Output.create
@17 // 7462
D=A // 7463
@14 // 7464
M=D // 7465
@Output.create // 7466
D=A // 7467
@13 // 7468
M=D // 7469
@Output.init.ret.23 // 7470
D=A // 7471
@CALL // 7472
0;JMP // 7473
(Output.init.ret.23)
@SP // 7474
M=M-1 // 7475

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7476
D=A // 7477
@SP // 7478
AM=M+1 // 7479
A=A-1 // 7480
M=D // 7481
@28 // 7482
D=A // 7483
@SP // 7484
AM=M+1 // 7485
A=A-1 // 7486
M=D // 7487
@6 // 7488
D=A // 7489
@SP // 7490
AM=M+1 // 7491
A=A-1 // 7492
M=D // 7493
@3 // 7494
D=A // 7495
@SP // 7496
AM=M+1 // 7497
A=A-1 // 7498
M=D // 7499
@3 // 7500
D=A // 7501
@SP // 7502
AM=M+1 // 7503
A=A-1 // 7504
M=D // 7505
@31 // 7506
D=A // 7507
@SP // 7508
AM=M+1 // 7509
A=A-1 // 7510
M=D // 7511
@51 // 7512
D=A // 7513
@SP // 7514
AM=M+1 // 7515
A=A-1 // 7516
M=D // 7517
@51 // 7518
D=A // 7519
@SP // 7520
AM=M+1 // 7521
A=A-1 // 7522
M=D // 7523
@51 // 7524
D=A // 7525
@SP // 7526
AM=M+1 // 7527
A=A-1 // 7528
M=D // 7529
@30 // 7530
D=A // 7531
@SP // 7532
AM=M+1 // 7533
A=A-1 // 7534
M=D // 7535
@SP // 7536
AM=M+1 // 7537
A=A-1 // 7538
M=0 // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=0 // 7543
// call Output.create
@17 // 7544
D=A // 7545
@14 // 7546
M=D // 7547
@Output.create // 7548
D=A // 7549
@13 // 7550
M=D // 7551
@Output.init.ret.24 // 7552
D=A // 7553
@CALL // 7554
0;JMP // 7555
(Output.init.ret.24)
@SP // 7556
M=M-1 // 7557

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7558
D=A // 7559
@SP // 7560
AM=M+1 // 7561
A=A-1 // 7562
M=D // 7563
@63 // 7564
D=A // 7565
@SP // 7566
AM=M+1 // 7567
A=A-1 // 7568
M=D // 7569
@49 // 7570
D=A // 7571
@SP // 7572
AM=M+1 // 7573
A=A-1 // 7574
M=D // 7575
@48 // 7576
D=A // 7577
@SP // 7578
AM=M+1 // 7579
A=A-1 // 7580
M=D // 7581
@48 // 7582
D=A // 7583
@SP // 7584
AM=M+1 // 7585
A=A-1 // 7586
M=D // 7587
@24 // 7588
D=A // 7589
@SP // 7590
AM=M+1 // 7591
A=A-1 // 7592
M=D // 7593
@12 // 7594
D=A // 7595
@SP // 7596
AM=M+1 // 7597
A=A-1 // 7598
M=D // 7599
@12 // 7600
D=A // 7601
@SP // 7602
AM=M+1 // 7603
A=A-1 // 7604
M=D // 7605
@12 // 7606
D=A // 7607
@SP // 7608
AM=M+1 // 7609
A=A-1 // 7610
M=D // 7611
@12 // 7612
D=A // 7613
@SP // 7614
AM=M+1 // 7615
A=A-1 // 7616
M=D // 7617
@SP // 7618
AM=M+1 // 7619
A=A-1 // 7620
M=0 // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=0 // 7625
// call Output.create
@17 // 7626
D=A // 7627
@14 // 7628
M=D // 7629
@Output.create // 7630
D=A // 7631
@13 // 7632
M=D // 7633
@Output.init.ret.25 // 7634
D=A // 7635
@CALL // 7636
0;JMP // 7637
(Output.init.ret.25)
@SP // 7638
M=M-1 // 7639

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7640
D=A // 7641
@SP // 7642
AM=M+1 // 7643
A=A-1 // 7644
M=D // 7645
@30 // 7646
D=A // 7647
@SP // 7648
AM=M+1 // 7649
A=A-1 // 7650
M=D // 7651
@51 // 7652
D=A // 7653
@SP // 7654
AM=M+1 // 7655
A=A-1 // 7656
M=D // 7657
@51 // 7658
D=A // 7659
@SP // 7660
AM=M+1 // 7661
A=A-1 // 7662
M=D // 7663
@51 // 7664
D=A // 7665
@SP // 7666
AM=M+1 // 7667
A=A-1 // 7668
M=D // 7669
@30 // 7670
D=A // 7671
@SP // 7672
AM=M+1 // 7673
A=A-1 // 7674
M=D // 7675
@51 // 7676
D=A // 7677
@SP // 7678
AM=M+1 // 7679
A=A-1 // 7680
M=D // 7681
@51 // 7682
D=A // 7683
@SP // 7684
AM=M+1 // 7685
A=A-1 // 7686
M=D // 7687
@51 // 7688
D=A // 7689
@SP // 7690
AM=M+1 // 7691
A=A-1 // 7692
M=D // 7693
@30 // 7694
D=A // 7695
@SP // 7696
AM=M+1 // 7697
A=A-1 // 7698
M=D // 7699
@SP // 7700
AM=M+1 // 7701
A=A-1 // 7702
M=0 // 7703
@SP // 7704
AM=M+1 // 7705
A=A-1 // 7706
M=0 // 7707
// call Output.create
@17 // 7708
D=A // 7709
@14 // 7710
M=D // 7711
@Output.create // 7712
D=A // 7713
@13 // 7714
M=D // 7715
@Output.init.ret.26 // 7716
D=A // 7717
@CALL // 7718
0;JMP // 7719
(Output.init.ret.26)
@SP // 7720
M=M-1 // 7721

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7722
D=A // 7723
@SP // 7724
AM=M+1 // 7725
A=A-1 // 7726
M=D // 7727
@30 // 7728
D=A // 7729
@SP // 7730
AM=M+1 // 7731
A=A-1 // 7732
M=D // 7733
@51 // 7734
D=A // 7735
@SP // 7736
AM=M+1 // 7737
A=A-1 // 7738
M=D // 7739
@51 // 7740
D=A // 7741
@SP // 7742
AM=M+1 // 7743
A=A-1 // 7744
M=D // 7745
@51 // 7746
D=A // 7747
@SP // 7748
AM=M+1 // 7749
A=A-1 // 7750
M=D // 7751
@62 // 7752
D=A // 7753
@SP // 7754
AM=M+1 // 7755
A=A-1 // 7756
M=D // 7757
@48 // 7758
D=A // 7759
@SP // 7760
AM=M+1 // 7761
A=A-1 // 7762
M=D // 7763
@48 // 7764
D=A // 7765
@SP // 7766
AM=M+1 // 7767
A=A-1 // 7768
M=D // 7769
@24 // 7770
D=A // 7771
@SP // 7772
AM=M+1 // 7773
A=A-1 // 7774
M=D // 7775
@14 // 7776
D=A // 7777
@SP // 7778
AM=M+1 // 7779
A=A-1 // 7780
M=D // 7781
@SP // 7782
AM=M+1 // 7783
A=A-1 // 7784
M=0 // 7785
@SP // 7786
AM=M+1 // 7787
A=A-1 // 7788
M=0 // 7789
// call Output.create
@17 // 7790
D=A // 7791
@14 // 7792
M=D // 7793
@Output.create // 7794
D=A // 7795
@13 // 7796
M=D // 7797
@Output.init.ret.27 // 7798
D=A // 7799
@CALL // 7800
0;JMP // 7801
(Output.init.ret.27)
@SP // 7802
M=M-1 // 7803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7804
D=A // 7805
@SP // 7806
M=D+M // 7807
@58 // 7808
D=A // 7809
@SP // 7810
A=M-1 // 7811
M=0 // 7812
A=A-1 // 7813
M=0 // 7814
A=A-1 // 7815
M=D // 7816
A=A-1 // 7817
@4 // 7818
D=A // 7819
@SP // 7820
M=D+M // 7821
@12 // 7822
D=A // 7823
@SP // 7824
A=M-1 // 7825
M=0 // 7826
A=A-1 // 7827
M=0 // 7828
A=A-1 // 7829
M=D // 7830
A=A-1 // 7831
M=D // 7832
A=A-1 // 7833
@5 // 7834
D=A // 7835
@SP // 7836
M=D+M // 7837
@12 // 7838
D=A // 7839
@SP // 7840
A=M-1 // 7841
M=0 // 7842
A=A-1 // 7843
M=0 // 7844
A=A-1 // 7845
M=0 // 7846
A=A-1 // 7847
M=D // 7848
A=A-1 // 7849
M=D // 7850
A=A-1 // 7851
// call Output.create
@17 // 7852
D=A // 7853
@14 // 7854
M=D // 7855
@Output.create // 7856
D=A // 7857
@13 // 7858
M=D // 7859
@Output.init.ret.28 // 7860
D=A // 7861
@CALL // 7862
0;JMP // 7863
(Output.init.ret.28)
@SP // 7864
M=M-1 // 7865

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7866
D=A // 7867
@SP // 7868
M=D+M // 7869
@59 // 7870
D=A // 7871
@SP // 7872
A=M-1 // 7873
M=0 // 7874
A=A-1 // 7875
M=0 // 7876
A=A-1 // 7877
M=D // 7878
A=A-1 // 7879
@4 // 7880
D=A // 7881
@SP // 7882
M=D+M // 7883
@12 // 7884
D=A // 7885
@SP // 7886
A=M-1 // 7887
M=0 // 7888
A=A-1 // 7889
M=0 // 7890
A=A-1 // 7891
M=D // 7892
A=A-1 // 7893
M=D // 7894
A=A-1 // 7895
@12 // 7896
D=A // 7897
@SP // 7898
AM=M+1 // 7899
A=A-1 // 7900
M=D // 7901
@12 // 7902
D=A // 7903
@SP // 7904
AM=M+1 // 7905
A=A-1 // 7906
M=D // 7907
@6 // 7908
D=A // 7909
@SP // 7910
AM=M+1 // 7911
A=A-1 // 7912
M=D // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=0 // 7917
@SP // 7918
AM=M+1 // 7919
A=A-1 // 7920
M=0 // 7921
// call Output.create
@17 // 7922
D=A // 7923
@14 // 7924
M=D // 7925
@Output.create // 7926
D=A // 7927
@13 // 7928
M=D // 7929
@Output.init.ret.29 // 7930
D=A // 7931
@CALL // 7932
0;JMP // 7933
(Output.init.ret.29)
@SP // 7934
M=M-1 // 7935

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7936
D=A // 7937
@SP // 7938
M=D+M // 7939
@60 // 7940
D=A // 7941
@SP // 7942
A=M-1 // 7943
M=0 // 7944
A=A-1 // 7945
M=0 // 7946
A=A-1 // 7947
M=D // 7948
A=A-1 // 7949
@24 // 7950
D=A // 7951
@SP // 7952
AM=M+1 // 7953
A=A-1 // 7954
M=D // 7955
@12 // 7956
D=A // 7957
@SP // 7958
AM=M+1 // 7959
A=A-1 // 7960
M=D // 7961
@6 // 7962
D=A // 7963
@SP // 7964
AM=M+1 // 7965
A=A-1 // 7966
M=D // 7967
@3 // 7968
D=A // 7969
@SP // 7970
AM=M+1 // 7971
A=A-1 // 7972
M=D // 7973
@6 // 7974
D=A // 7975
@SP // 7976
AM=M+1 // 7977
A=A-1 // 7978
M=D // 7979
@12 // 7980
D=A // 7981
@SP // 7982
AM=M+1 // 7983
A=A-1 // 7984
M=D // 7985
@24 // 7986
D=A // 7987
@SP // 7988
AM=M+1 // 7989
A=A-1 // 7990
M=D // 7991
@SP // 7992
AM=M+1 // 7993
A=A-1 // 7994
M=0 // 7995
@SP // 7996
AM=M+1 // 7997
A=A-1 // 7998
M=0 // 7999
// call Output.create
@17 // 8000
D=A // 8001
@14 // 8002
M=D // 8003
@Output.create // 8004
D=A // 8005
@13 // 8006
M=D // 8007
@Output.init.ret.30 // 8008
D=A // 8009
@CALL // 8010
0;JMP // 8011
(Output.init.ret.30)
@SP // 8012
M=M-1 // 8013

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 8014
D=A // 8015
@SP // 8016
M=D+M // 8017
@61 // 8018
D=A // 8019
@SP // 8020
A=M-1 // 8021
M=0 // 8022
A=A-1 // 8023
M=0 // 8024
A=A-1 // 8025
M=0 // 8026
A=A-1 // 8027
M=D // 8028
A=A-1 // 8029
@3 // 8030
D=A // 8031
@SP // 8032
M=D+M // 8033
@63 // 8034
D=A // 8035
@SP // 8036
A=M-1 // 8037
M=0 // 8038
A=A-1 // 8039
M=0 // 8040
A=A-1 // 8041
M=D // 8042
A=A-1 // 8043
@5 // 8044
D=A // 8045
@SP // 8046
M=D+M // 8047
@63 // 8048
D=A // 8049
@SP // 8050
A=M-1 // 8051
M=0 // 8052
A=A-1 // 8053
M=0 // 8054
A=A-1 // 8055
M=0 // 8056
A=A-1 // 8057
M=0 // 8058
A=A-1 // 8059
M=D // 8060
A=A-1 // 8061
// call Output.create
@17 // 8062
D=A // 8063
@14 // 8064
M=D // 8065
@Output.create // 8066
D=A // 8067
@13 // 8068
M=D // 8069
@Output.init.ret.31 // 8070
D=A // 8071
@CALL // 8072
0;JMP // 8073
(Output.init.ret.31)
@SP // 8074
M=M-1 // 8075

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 8076
D=A // 8077
@SP // 8078
M=D+M // 8079
@62 // 8080
D=A // 8081
@SP // 8082
A=M-1 // 8083
M=0 // 8084
A=A-1 // 8085
M=0 // 8086
A=A-1 // 8087
M=D // 8088
A=A-1 // 8089
@3 // 8090
D=A // 8091
@SP // 8092
AM=M+1 // 8093
A=A-1 // 8094
M=D // 8095
@6 // 8096
D=A // 8097
@SP // 8098
AM=M+1 // 8099
A=A-1 // 8100
M=D // 8101
@12 // 8102
D=A // 8103
@SP // 8104
AM=M+1 // 8105
A=A-1 // 8106
M=D // 8107
@24 // 8108
D=A // 8109
@SP // 8110
AM=M+1 // 8111
A=A-1 // 8112
M=D // 8113
@12 // 8114
D=A // 8115
@SP // 8116
AM=M+1 // 8117
A=A-1 // 8118
M=D // 8119
@6 // 8120
D=A // 8121
@SP // 8122
AM=M+1 // 8123
A=A-1 // 8124
M=D // 8125
@3 // 8126
D=A // 8127
@SP // 8128
AM=M+1 // 8129
A=A-1 // 8130
M=D // 8131
@SP // 8132
AM=M+1 // 8133
A=A-1 // 8134
M=0 // 8135
@SP // 8136
AM=M+1 // 8137
A=A-1 // 8138
M=0 // 8139
// call Output.create
@17 // 8140
D=A // 8141
@14 // 8142
M=D // 8143
@Output.create // 8144
D=A // 8145
@13 // 8146
M=D // 8147
@Output.init.ret.32 // 8148
D=A // 8149
@CALL // 8150
0;JMP // 8151
(Output.init.ret.32)
@SP // 8152
M=M-1 // 8153

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8154
D=A // 8155
@SP // 8156
AM=M+1 // 8157
A=A-1 // 8158
M=D // 8159
@30 // 8160
D=A // 8161
@SP // 8162
AM=M+1 // 8163
A=A-1 // 8164
M=D // 8165
@51 // 8166
D=A // 8167
@SP // 8168
AM=M+1 // 8169
A=A-1 // 8170
M=D // 8171
@51 // 8172
D=A // 8173
@SP // 8174
AM=M+1 // 8175
A=A-1 // 8176
M=D // 8177
@59 // 8178
D=A // 8179
@SP // 8180
AM=M+1 // 8181
A=A-1 // 8182
M=D // 8183
@59 // 8184
D=A // 8185
@SP // 8186
AM=M+1 // 8187
A=A-1 // 8188
M=D // 8189
@59 // 8190
D=A // 8191
@SP // 8192
AM=M+1 // 8193
A=A-1 // 8194
M=D // 8195
@27 // 8196
D=A // 8197
@SP // 8198
AM=M+1 // 8199
A=A-1 // 8200
M=D // 8201
@3 // 8202
D=A // 8203
@SP // 8204
AM=M+1 // 8205
A=A-1 // 8206
M=D // 8207
@30 // 8208
D=A // 8209
@SP // 8210
AM=M+1 // 8211
A=A-1 // 8212
M=D // 8213
@SP // 8214
AM=M+1 // 8215
A=A-1 // 8216
M=0 // 8217
@SP // 8218
AM=M+1 // 8219
A=A-1 // 8220
M=0 // 8221
// call Output.create
@17 // 8222
D=A // 8223
@14 // 8224
M=D // 8225
@Output.create // 8226
D=A // 8227
@13 // 8228
M=D // 8229
@Output.init.ret.33 // 8230
D=A // 8231
@CALL // 8232
0;JMP // 8233
(Output.init.ret.33)
@SP // 8234
M=M-1 // 8235

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8236
D=A // 8237
@SP // 8238
AM=M+1 // 8239
A=A-1 // 8240
M=D // 8241
@30 // 8242
D=A // 8243
@SP // 8244
AM=M+1 // 8245
A=A-1 // 8246
M=D // 8247
@51 // 8248
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
@24 // 8260
D=A // 8261
@SP // 8262
AM=M+1 // 8263
A=A-1 // 8264
M=D // 8265
@12 // 8266
D=A // 8267
@SP // 8268
AM=M+1 // 8269
A=A-1 // 8270
M=D // 8271
@12 // 8272
D=A // 8273
@SP // 8274
AM=M+1 // 8275
A=A-1 // 8276
M=D // 8277
@SP // 8278
AM=M+1 // 8279
A=A-1 // 8280
M=0 // 8281
@4 // 8282
D=A // 8283
@SP // 8284
M=D+M // 8285
@12 // 8286
D=A // 8287
@SP // 8288
A=M-1 // 8289
M=0 // 8290
A=A-1 // 8291
M=0 // 8292
A=A-1 // 8293
M=D // 8294
A=A-1 // 8295
M=D // 8296
A=A-1 // 8297
// call Output.create
@17 // 8298
D=A // 8299
@14 // 8300
M=D // 8301
@Output.create // 8302
D=A // 8303
@13 // 8304
M=D // 8305
@Output.init.ret.34 // 8306
D=A // 8307
@CALL // 8308
0;JMP // 8309
(Output.init.ret.34)
@SP // 8310
M=M-1 // 8311

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8312
D=A // 8313
@SP // 8314
AM=M+1 // 8315
A=A-1 // 8316
M=D // 8317
@12 // 8318
D=A // 8319
@SP // 8320
AM=M+1 // 8321
A=A-1 // 8322
M=D // 8323
@30 // 8324
D=A // 8325
@SP // 8326
AM=M+1 // 8327
A=A-1 // 8328
M=D // 8329
@51 // 8330
D=A // 8331
@SP // 8332
AM=M+1 // 8333
A=A-1 // 8334
M=D // 8335
@51 // 8336
D=A // 8337
@SP // 8338
AM=M+1 // 8339
A=A-1 // 8340
M=D // 8341
@63 // 8342
D=A // 8343
@SP // 8344
AM=M+1 // 8345
A=A-1 // 8346
M=D // 8347
@51 // 8348
D=A // 8349
@SP // 8350
AM=M+1 // 8351
A=A-1 // 8352
M=D // 8353
@51 // 8354
D=A // 8355
@SP // 8356
AM=M+1 // 8357
A=A-1 // 8358
M=D // 8359
@51 // 8360
D=A // 8361
@SP // 8362
AM=M+1 // 8363
A=A-1 // 8364
M=D // 8365
@51 // 8366
D=A // 8367
@SP // 8368
AM=M+1 // 8369
A=A-1 // 8370
M=D // 8371
@SP // 8372
AM=M+1 // 8373
A=A-1 // 8374
M=0 // 8375
@SP // 8376
AM=M+1 // 8377
A=A-1 // 8378
M=0 // 8379
// call Output.create
@17 // 8380
D=A // 8381
@14 // 8382
M=D // 8383
@Output.create // 8384
D=A // 8385
@13 // 8386
M=D // 8387
@Output.init.ret.35 // 8388
D=A // 8389
@CALL // 8390
0;JMP // 8391
(Output.init.ret.35)
@SP // 8392
M=M-1 // 8393

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8394
D=A // 8395
@SP // 8396
AM=M+1 // 8397
A=A-1 // 8398
M=D // 8399
@31 // 8400
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
@31 // 8424
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
@51 // 8436
D=A // 8437
@SP // 8438
AM=M+1 // 8439
A=A-1 // 8440
M=D // 8441
@51 // 8442
D=A // 8443
@SP // 8444
AM=M+1 // 8445
A=A-1 // 8446
M=D // 8447
@31 // 8448
D=A // 8449
@SP // 8450
AM=M+1 // 8451
A=A-1 // 8452
M=D // 8453
@SP // 8454
AM=M+1 // 8455
A=A-1 // 8456
M=0 // 8457
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=0 // 8461
// call Output.create
@17 // 8462
D=A // 8463
@14 // 8464
M=D // 8465
@Output.create // 8466
D=A // 8467
@13 // 8468
M=D // 8469
@Output.init.ret.36 // 8470
D=A // 8471
@CALL // 8472
0;JMP // 8473
(Output.init.ret.36)
@SP // 8474
M=M-1 // 8475

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8476
D=A // 8477
@SP // 8478
AM=M+1 // 8479
A=A-1 // 8480
M=D // 8481
@28 // 8482
D=A // 8483
@SP // 8484
AM=M+1 // 8485
A=A-1 // 8486
M=D // 8487
@54 // 8488
D=A // 8489
@SP // 8490
AM=M+1 // 8491
A=A-1 // 8492
M=D // 8493
@35 // 8494
D=A // 8495
@SP // 8496
AM=M+1 // 8497
A=A-1 // 8498
M=D // 8499
@3 // 8500
D=A // 8501
@SP // 8502
AM=M+1 // 8503
A=A-1 // 8504
M=D // 8505
@3 // 8506
D=A // 8507
@SP // 8508
AM=M+1 // 8509
A=A-1 // 8510
M=D // 8511
@3 // 8512
D=A // 8513
@SP // 8514
AM=M+1 // 8515
A=A-1 // 8516
M=D // 8517
@35 // 8518
D=A // 8519
@SP // 8520
AM=M+1 // 8521
A=A-1 // 8522
M=D // 8523
@54 // 8524
D=A // 8525
@SP // 8526
AM=M+1 // 8527
A=A-1 // 8528
M=D // 8529
@28 // 8530
D=A // 8531
@SP // 8532
AM=M+1 // 8533
A=A-1 // 8534
M=D // 8535
@SP // 8536
AM=M+1 // 8537
A=A-1 // 8538
M=0 // 8539
@SP // 8540
AM=M+1 // 8541
A=A-1 // 8542
M=0 // 8543
// call Output.create
@17 // 8544
D=A // 8545
@14 // 8546
M=D // 8547
@Output.create // 8548
D=A // 8549
@13 // 8550
M=D // 8551
@Output.init.ret.37 // 8552
D=A // 8553
@CALL // 8554
0;JMP // 8555
(Output.init.ret.37)
@SP // 8556
M=M-1 // 8557

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8558
D=A // 8559
@SP // 8560
AM=M+1 // 8561
A=A-1 // 8562
M=D // 8563
@15 // 8564
D=A // 8565
@SP // 8566
AM=M+1 // 8567
A=A-1 // 8568
M=D // 8569
@27 // 8570
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
@51 // 8594
D=A // 8595
@SP // 8596
AM=M+1 // 8597
A=A-1 // 8598
M=D // 8599
@51 // 8600
D=A // 8601
@SP // 8602
AM=M+1 // 8603
A=A-1 // 8604
M=D // 8605
@27 // 8606
D=A // 8607
@SP // 8608
AM=M+1 // 8609
A=A-1 // 8610
M=D // 8611
@15 // 8612
D=A // 8613
@SP // 8614
AM=M+1 // 8615
A=A-1 // 8616
M=D // 8617
@SP // 8618
AM=M+1 // 8619
A=A-1 // 8620
M=0 // 8621
@SP // 8622
AM=M+1 // 8623
A=A-1 // 8624
M=0 // 8625
// call Output.create
@17 // 8626
D=A // 8627
@14 // 8628
M=D // 8629
@Output.create // 8630
D=A // 8631
@13 // 8632
M=D // 8633
@Output.init.ret.38 // 8634
D=A // 8635
@CALL // 8636
0;JMP // 8637
(Output.init.ret.38)
@SP // 8638
M=M-1 // 8639

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8640
D=A // 8641
@SP // 8642
AM=M+1 // 8643
A=A-1 // 8644
M=D // 8645
@63 // 8646
D=A // 8647
@SP // 8648
AM=M+1 // 8649
A=A-1 // 8650
M=D // 8651
@51 // 8652
D=A // 8653
@SP // 8654
AM=M+1 // 8655
A=A-1 // 8656
M=D // 8657
@35 // 8658
D=A // 8659
@SP // 8660
AM=M+1 // 8661
A=A-1 // 8662
M=D // 8663
@11 // 8664
D=A // 8665
@SP // 8666
AM=M+1 // 8667
A=A-1 // 8668
M=D // 8669
@15 // 8670
D=A // 8671
@SP // 8672
AM=M+1 // 8673
A=A-1 // 8674
M=D // 8675
@11 // 8676
D=A // 8677
@SP // 8678
AM=M+1 // 8679
A=A-1 // 8680
M=D // 8681
@35 // 8682
D=A // 8683
@SP // 8684
AM=M+1 // 8685
A=A-1 // 8686
M=D // 8687
@51 // 8688
D=A // 8689
@SP // 8690
AM=M+1 // 8691
A=A-1 // 8692
M=D // 8693
@63 // 8694
D=A // 8695
@SP // 8696
AM=M+1 // 8697
A=A-1 // 8698
M=D // 8699
@SP // 8700
AM=M+1 // 8701
A=A-1 // 8702
M=0 // 8703
@SP // 8704
AM=M+1 // 8705
A=A-1 // 8706
M=0 // 8707
// call Output.create
@17 // 8708
D=A // 8709
@14 // 8710
M=D // 8711
@Output.create // 8712
D=A // 8713
@13 // 8714
M=D // 8715
@Output.init.ret.39 // 8716
D=A // 8717
@CALL // 8718
0;JMP // 8719
(Output.init.ret.39)
@SP // 8720
M=M-1 // 8721

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8722
D=A // 8723
@SP // 8724
AM=M+1 // 8725
A=A-1 // 8726
M=D // 8727
@63 // 8728
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
@35 // 8740
D=A // 8741
@SP // 8742
AM=M+1 // 8743
A=A-1 // 8744
M=D // 8745
@11 // 8746
D=A // 8747
@SP // 8748
AM=M+1 // 8749
A=A-1 // 8750
M=D // 8751
@15 // 8752
D=A // 8753
@SP // 8754
AM=M+1 // 8755
A=A-1 // 8756
M=D // 8757
@11 // 8758
D=A // 8759
@SP // 8760
AM=M+1 // 8761
A=A-1 // 8762
M=D // 8763
@3 // 8764
D=A // 8765
@SP // 8766
AM=M+1 // 8767
A=A-1 // 8768
M=D // 8769
@3 // 8770
D=A // 8771
@SP // 8772
AM=M+1 // 8773
A=A-1 // 8774
M=D // 8775
@3 // 8776
D=A // 8777
@SP // 8778
AM=M+1 // 8779
A=A-1 // 8780
M=D // 8781
@SP // 8782
AM=M+1 // 8783
A=A-1 // 8784
M=0 // 8785
@SP // 8786
AM=M+1 // 8787
A=A-1 // 8788
M=0 // 8789
// call Output.create
@17 // 8790
D=A // 8791
@14 // 8792
M=D // 8793
@Output.create // 8794
D=A // 8795
@13 // 8796
M=D // 8797
@Output.init.ret.40 // 8798
D=A // 8799
@CALL // 8800
0;JMP // 8801
(Output.init.ret.40)
@SP // 8802
M=M-1 // 8803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8804
D=A // 8805
@SP // 8806
AM=M+1 // 8807
A=A-1 // 8808
M=D // 8809
@28 // 8810
D=A // 8811
@SP // 8812
AM=M+1 // 8813
A=A-1 // 8814
M=D // 8815
@54 // 8816
D=A // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=D // 8821
@35 // 8822
D=A // 8823
@SP // 8824
AM=M+1 // 8825
A=A-1 // 8826
M=D // 8827
@3 // 8828
D=A // 8829
@SP // 8830
AM=M+1 // 8831
A=A-1 // 8832
M=D // 8833
@59 // 8834
D=A // 8835
@SP // 8836
AM=M+1 // 8837
A=A-1 // 8838
M=D // 8839
@51 // 8840
D=A // 8841
@SP // 8842
AM=M+1 // 8843
A=A-1 // 8844
M=D // 8845
@51 // 8846
D=A // 8847
@SP // 8848
AM=M+1 // 8849
A=A-1 // 8850
M=D // 8851
@54 // 8852
D=A // 8853
@SP // 8854
AM=M+1 // 8855
A=A-1 // 8856
M=D // 8857
@44 // 8858
D=A // 8859
@SP // 8860
AM=M+1 // 8861
A=A-1 // 8862
M=D // 8863
@SP // 8864
AM=M+1 // 8865
A=A-1 // 8866
M=0 // 8867
@SP // 8868
AM=M+1 // 8869
A=A-1 // 8870
M=0 // 8871
// call Output.create
@17 // 8872
D=A // 8873
@14 // 8874
M=D // 8875
@Output.create // 8876
D=A // 8877
@13 // 8878
M=D // 8879
@Output.init.ret.41 // 8880
D=A // 8881
@CALL // 8882
0;JMP // 8883
(Output.init.ret.41)
@SP // 8884
M=M-1 // 8885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8886
D=A // 8887
@SP // 8888
AM=M+1 // 8889
A=A-1 // 8890
M=D // 8891
@51 // 8892
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
@51 // 8910
D=A // 8911
@SP // 8912
AM=M+1 // 8913
A=A-1 // 8914
M=D // 8915
@63 // 8916
D=A // 8917
@SP // 8918
AM=M+1 // 8919
A=A-1 // 8920
M=D // 8921
@51 // 8922
D=A // 8923
@SP // 8924
AM=M+1 // 8925
A=A-1 // 8926
M=D // 8927
@51 // 8928
D=A // 8929
@SP // 8930
AM=M+1 // 8931
A=A-1 // 8932
M=D // 8933
@51 // 8934
D=A // 8935
@SP // 8936
AM=M+1 // 8937
A=A-1 // 8938
M=D // 8939
@51 // 8940
D=A // 8941
@SP // 8942
AM=M+1 // 8943
A=A-1 // 8944
M=D // 8945
@SP // 8946
AM=M+1 // 8947
A=A-1 // 8948
M=0 // 8949
@SP // 8950
AM=M+1 // 8951
A=A-1 // 8952
M=0 // 8953
// call Output.create
@17 // 8954
D=A // 8955
@14 // 8956
M=D // 8957
@Output.create // 8958
D=A // 8959
@13 // 8960
M=D // 8961
@Output.init.ret.42 // 8962
D=A // 8963
@CALL // 8964
0;JMP // 8965
(Output.init.ret.42)
@SP // 8966
M=M-1 // 8967

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8968
D=A // 8969
@SP // 8970
AM=M+1 // 8971
A=A-1 // 8972
M=D // 8973
@30 // 8974
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
@12 // 8992
D=A // 8993
@SP // 8994
AM=M+1 // 8995
A=A-1 // 8996
M=D // 8997
@12 // 8998
D=A // 8999
@SP // 9000
AM=M+1 // 9001
A=A-1 // 9002
M=D // 9003
@12 // 9004
D=A // 9005
@SP // 9006
AM=M+1 // 9007
A=A-1 // 9008
M=D // 9009
@12 // 9010
D=A // 9011
@SP // 9012
AM=M+1 // 9013
A=A-1 // 9014
M=D // 9015
@12 // 9016
D=A // 9017
@SP // 9018
AM=M+1 // 9019
A=A-1 // 9020
M=D // 9021
@30 // 9022
D=A // 9023
@SP // 9024
AM=M+1 // 9025
A=A-1 // 9026
M=D // 9027
@SP // 9028
AM=M+1 // 9029
A=A-1 // 9030
M=0 // 9031
@SP // 9032
AM=M+1 // 9033
A=A-1 // 9034
M=0 // 9035
// call Output.create
@17 // 9036
D=A // 9037
@14 // 9038
M=D // 9039
@Output.create // 9040
D=A // 9041
@13 // 9042
M=D // 9043
@Output.init.ret.43 // 9044
D=A // 9045
@CALL // 9046
0;JMP // 9047
(Output.init.ret.43)
@SP // 9048
M=M-1 // 9049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 9050
D=A // 9051
@SP // 9052
AM=M+1 // 9053
A=A-1 // 9054
M=D // 9055
@60 // 9056
D=A // 9057
@SP // 9058
AM=M+1 // 9059
A=A-1 // 9060
M=D // 9061
@24 // 9062
D=A // 9063
@SP // 9064
AM=M+1 // 9065
A=A-1 // 9066
M=D // 9067
@24 // 9068
D=A // 9069
@SP // 9070
AM=M+1 // 9071
A=A-1 // 9072
M=D // 9073
@24 // 9074
D=A // 9075
@SP // 9076
AM=M+1 // 9077
A=A-1 // 9078
M=D // 9079
@24 // 9080
D=A // 9081
@SP // 9082
AM=M+1 // 9083
A=A-1 // 9084
M=D // 9085
@24 // 9086
D=A // 9087
@SP // 9088
AM=M+1 // 9089
A=A-1 // 9090
M=D // 9091
@27 // 9092
D=A // 9093
@SP // 9094
AM=M+1 // 9095
A=A-1 // 9096
M=D // 9097
@27 // 9098
D=A // 9099
@SP // 9100
AM=M+1 // 9101
A=A-1 // 9102
M=D // 9103
@14 // 9104
D=A // 9105
@SP // 9106
AM=M+1 // 9107
A=A-1 // 9108
M=D // 9109
@SP // 9110
AM=M+1 // 9111
A=A-1 // 9112
M=0 // 9113
@SP // 9114
AM=M+1 // 9115
A=A-1 // 9116
M=0 // 9117
// call Output.create
@17 // 9118
D=A // 9119
@14 // 9120
M=D // 9121
@Output.create // 9122
D=A // 9123
@13 // 9124
M=D // 9125
@Output.init.ret.44 // 9126
D=A // 9127
@CALL // 9128
0;JMP // 9129
(Output.init.ret.44)
@SP // 9130
M=M-1 // 9131

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9132
D=A // 9133
@SP // 9134
AM=M+1 // 9135
A=A-1 // 9136
M=D // 9137
@51 // 9138
D=A // 9139
@SP // 9140
AM=M+1 // 9141
A=A-1 // 9142
M=D // 9143
@51 // 9144
D=A // 9145
@SP // 9146
AM=M+1 // 9147
A=A-1 // 9148
M=D // 9149
@51 // 9150
D=A // 9151
@SP // 9152
AM=M+1 // 9153
A=A-1 // 9154
M=D // 9155
@27 // 9156
D=A // 9157
@SP // 9158
AM=M+1 // 9159
A=A-1 // 9160
M=D // 9161
@15 // 9162
D=A // 9163
@SP // 9164
AM=M+1 // 9165
A=A-1 // 9166
M=D // 9167
@27 // 9168
D=A // 9169
@SP // 9170
AM=M+1 // 9171
A=A-1 // 9172
M=D // 9173
@51 // 9174
D=A // 9175
@SP // 9176
AM=M+1 // 9177
A=A-1 // 9178
M=D // 9179
@51 // 9180
D=A // 9181
@SP // 9182
AM=M+1 // 9183
A=A-1 // 9184
M=D // 9185
@51 // 9186
D=A // 9187
@SP // 9188
AM=M+1 // 9189
A=A-1 // 9190
M=D // 9191
@SP // 9192
AM=M+1 // 9193
A=A-1 // 9194
M=0 // 9195
@SP // 9196
AM=M+1 // 9197
A=A-1 // 9198
M=0 // 9199
// call Output.create
@17 // 9200
D=A // 9201
@14 // 9202
M=D // 9203
@Output.create // 9204
D=A // 9205
@13 // 9206
M=D // 9207
@Output.init.ret.45 // 9208
D=A // 9209
@CALL // 9210
0;JMP // 9211
(Output.init.ret.45)
@SP // 9212
M=M-1 // 9213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9214
D=A // 9215
@SP // 9216
AM=M+1 // 9217
A=A-1 // 9218
M=D // 9219
@3 // 9220
D=A // 9221
@SP // 9222
AM=M+1 // 9223
A=A-1 // 9224
M=D // 9225
@3 // 9226
D=A // 9227
@SP // 9228
AM=M+1 // 9229
A=A-1 // 9230
M=D // 9231
@3 // 9232
D=A // 9233
@SP // 9234
AM=M+1 // 9235
A=A-1 // 9236
M=D // 9237
@3 // 9238
D=A // 9239
@SP // 9240
AM=M+1 // 9241
A=A-1 // 9242
M=D // 9243
@3 // 9244
D=A // 9245
@SP // 9246
AM=M+1 // 9247
A=A-1 // 9248
M=D // 9249
@3 // 9250
D=A // 9251
@SP // 9252
AM=M+1 // 9253
A=A-1 // 9254
M=D // 9255
@35 // 9256
D=A // 9257
@SP // 9258
AM=M+1 // 9259
A=A-1 // 9260
M=D // 9261
@51 // 9262
D=A // 9263
@SP // 9264
AM=M+1 // 9265
A=A-1 // 9266
M=D // 9267
@63 // 9268
D=A // 9269
@SP // 9270
AM=M+1 // 9271
A=A-1 // 9272
M=D // 9273
@SP // 9274
AM=M+1 // 9275
A=A-1 // 9276
M=0 // 9277
@SP // 9278
AM=M+1 // 9279
A=A-1 // 9280
M=0 // 9281
// call Output.create
@17 // 9282
D=A // 9283
@14 // 9284
M=D // 9285
@Output.create // 9286
D=A // 9287
@13 // 9288
M=D // 9289
@Output.init.ret.46 // 9290
D=A // 9291
@CALL // 9292
0;JMP // 9293
(Output.init.ret.46)
@SP // 9294
M=M-1 // 9295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9296
D=A // 9297
@SP // 9298
AM=M+1 // 9299
A=A-1 // 9300
M=D // 9301
@33 // 9302
D=A // 9303
@SP // 9304
AM=M+1 // 9305
A=A-1 // 9306
M=D // 9307
@51 // 9308
D=A // 9309
@SP // 9310
AM=M+1 // 9311
A=A-1 // 9312
M=D // 9313
@63 // 9314
D=A // 9315
@SP // 9316
AM=M+1 // 9317
A=A-1 // 9318
M=D // 9319
@63 // 9320
D=A // 9321
@SP // 9322
AM=M+1 // 9323
A=A-1 // 9324
M=D // 9325
@51 // 9326
D=A // 9327
@SP // 9328
AM=M+1 // 9329
A=A-1 // 9330
M=D // 9331
@51 // 9332
D=A // 9333
@SP // 9334
AM=M+1 // 9335
A=A-1 // 9336
M=D // 9337
@51 // 9338
D=A // 9339
@SP // 9340
AM=M+1 // 9341
A=A-1 // 9342
M=D // 9343
@51 // 9344
D=A // 9345
@SP // 9346
AM=M+1 // 9347
A=A-1 // 9348
M=D // 9349
@51 // 9350
D=A // 9351
@SP // 9352
AM=M+1 // 9353
A=A-1 // 9354
M=D // 9355
@SP // 9356
AM=M+1 // 9357
A=A-1 // 9358
M=0 // 9359
@SP // 9360
AM=M+1 // 9361
A=A-1 // 9362
M=0 // 9363
// call Output.create
@17 // 9364
D=A // 9365
@14 // 9366
M=D // 9367
@Output.create // 9368
D=A // 9369
@13 // 9370
M=D // 9371
@Output.init.ret.47 // 9372
D=A // 9373
@CALL // 9374
0;JMP // 9375
(Output.init.ret.47)
@SP // 9376
M=M-1 // 9377

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9378
D=A // 9379
@SP // 9380
AM=M+1 // 9381
A=A-1 // 9382
M=D // 9383
@51 // 9384
D=A // 9385
@SP // 9386
AM=M+1 // 9387
A=A-1 // 9388
M=D // 9389
@51 // 9390
D=A // 9391
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=D // 9395
@55 // 9396
D=A // 9397
@SP // 9398
AM=M+1 // 9399
A=A-1 // 9400
M=D // 9401
@55 // 9402
D=A // 9403
@SP // 9404
AM=M+1 // 9405
A=A-1 // 9406
M=D // 9407
@63 // 9408
D=A // 9409
@SP // 9410
AM=M+1 // 9411
A=A-1 // 9412
M=D // 9413
@59 // 9414
D=A // 9415
@SP // 9416
AM=M+1 // 9417
A=A-1 // 9418
M=D // 9419
@59 // 9420
D=A // 9421
@SP // 9422
AM=M+1 // 9423
A=A-1 // 9424
M=D // 9425
@51 // 9426
D=A // 9427
@SP // 9428
AM=M+1 // 9429
A=A-1 // 9430
M=D // 9431
@51 // 9432
D=A // 9433
@SP // 9434
AM=M+1 // 9435
A=A-1 // 9436
M=D // 9437
@SP // 9438
AM=M+1 // 9439
A=A-1 // 9440
M=0 // 9441
@SP // 9442
AM=M+1 // 9443
A=A-1 // 9444
M=0 // 9445
// call Output.create
@17 // 9446
D=A // 9447
@14 // 9448
M=D // 9449
@Output.create // 9450
D=A // 9451
@13 // 9452
M=D // 9453
@Output.init.ret.48 // 9454
D=A // 9455
@CALL // 9456
0;JMP // 9457
(Output.init.ret.48)
@SP // 9458
M=M-1 // 9459

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9460
D=A // 9461
@SP // 9462
AM=M+1 // 9463
A=A-1 // 9464
M=D // 9465
@30 // 9466
D=A // 9467
@SP // 9468
AM=M+1 // 9469
A=A-1 // 9470
M=D // 9471
@51 // 9472
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
@51 // 9484
D=A // 9485
@SP // 9486
AM=M+1 // 9487
A=A-1 // 9488
M=D // 9489
@51 // 9490
D=A // 9491
@SP // 9492
AM=M+1 // 9493
A=A-1 // 9494
M=D // 9495
@51 // 9496
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
@51 // 9508
D=A // 9509
@SP // 9510
AM=M+1 // 9511
A=A-1 // 9512
M=D // 9513
@30 // 9514
D=A // 9515
@SP // 9516
AM=M+1 // 9517
A=A-1 // 9518
M=D // 9519
@SP // 9520
AM=M+1 // 9521
A=A-1 // 9522
M=0 // 9523
@SP // 9524
AM=M+1 // 9525
A=A-1 // 9526
M=0 // 9527
// call Output.create
@17 // 9528
D=A // 9529
@14 // 9530
M=D // 9531
@Output.create // 9532
D=A // 9533
@13 // 9534
M=D // 9535
@Output.init.ret.49 // 9536
D=A // 9537
@CALL // 9538
0;JMP // 9539
(Output.init.ret.49)
@SP // 9540
M=M-1 // 9541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9542
D=A // 9543
@SP // 9544
AM=M+1 // 9545
A=A-1 // 9546
M=D // 9547
@31 // 9548
D=A // 9549
@SP // 9550
AM=M+1 // 9551
A=A-1 // 9552
M=D // 9553
@51 // 9554
D=A // 9555
@SP // 9556
AM=M+1 // 9557
A=A-1 // 9558
M=D // 9559
@51 // 9560
D=A // 9561
@SP // 9562
AM=M+1 // 9563
A=A-1 // 9564
M=D // 9565
@51 // 9566
D=A // 9567
@SP // 9568
AM=M+1 // 9569
A=A-1 // 9570
M=D // 9571
@31 // 9572
D=A // 9573
@SP // 9574
AM=M+1 // 9575
A=A-1 // 9576
M=D // 9577
@3 // 9578
D=A // 9579
@SP // 9580
AM=M+1 // 9581
A=A-1 // 9582
M=D // 9583
@3 // 9584
D=A // 9585
@SP // 9586
AM=M+1 // 9587
A=A-1 // 9588
M=D // 9589
@3 // 9590
D=A // 9591
@SP // 9592
AM=M+1 // 9593
A=A-1 // 9594
M=D // 9595
@3 // 9596
D=A // 9597
@SP // 9598
AM=M+1 // 9599
A=A-1 // 9600
M=D // 9601
@SP // 9602
AM=M+1 // 9603
A=A-1 // 9604
M=0 // 9605
@SP // 9606
AM=M+1 // 9607
A=A-1 // 9608
M=0 // 9609
// call Output.create
@17 // 9610
D=A // 9611
@14 // 9612
M=D // 9613
@Output.create // 9614
D=A // 9615
@13 // 9616
M=D // 9617
@Output.init.ret.50 // 9618
D=A // 9619
@CALL // 9620
0;JMP // 9621
(Output.init.ret.50)
@SP // 9622
M=M-1 // 9623

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9624
D=A // 9625
@SP // 9626
AM=M+1 // 9627
A=A-1 // 9628
M=D // 9629
@30 // 9630
D=A // 9631
@SP // 9632
AM=M+1 // 9633
A=A-1 // 9634
M=D // 9635
@51 // 9636
D=A // 9637
@SP // 9638
AM=M+1 // 9639
A=A-1 // 9640
M=D // 9641
@51 // 9642
D=A // 9643
@SP // 9644
AM=M+1 // 9645
A=A-1 // 9646
M=D // 9647
@51 // 9648
D=A // 9649
@SP // 9650
AM=M+1 // 9651
A=A-1 // 9652
M=D // 9653
@51 // 9654
D=A // 9655
@SP // 9656
AM=M+1 // 9657
A=A-1 // 9658
M=D // 9659
@51 // 9660
D=A // 9661
@SP // 9662
AM=M+1 // 9663
A=A-1 // 9664
M=D // 9665
@63 // 9666
D=A // 9667
@SP // 9668
AM=M+1 // 9669
A=A-1 // 9670
M=D // 9671
@59 // 9672
D=A // 9673
@SP // 9674
AM=M+1 // 9675
A=A-1 // 9676
M=D // 9677
@30 // 9678
D=A // 9679
@SP // 9680
AM=M+1 // 9681
A=A-1 // 9682
M=D // 9683
@48 // 9684
D=A // 9685
@SP // 9686
AM=M+1 // 9687
A=A-1 // 9688
M=D // 9689
@SP // 9690
AM=M+1 // 9691
A=A-1 // 9692
M=0 // 9693
// call Output.create
@17 // 9694
D=A // 9695
@14 // 9696
M=D // 9697
@Output.create // 9698
D=A // 9699
@13 // 9700
M=D // 9701
@Output.init.ret.51 // 9702
D=A // 9703
@CALL // 9704
0;JMP // 9705
(Output.init.ret.51)
@SP // 9706
M=M-1 // 9707

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9708
D=A // 9709
@SP // 9710
AM=M+1 // 9711
A=A-1 // 9712
M=D // 9713
@31 // 9714
D=A // 9715
@SP // 9716
AM=M+1 // 9717
A=A-1 // 9718
M=D // 9719
@51 // 9720
D=A // 9721
@SP // 9722
AM=M+1 // 9723
A=A-1 // 9724
M=D // 9725
@51 // 9726
D=A // 9727
@SP // 9728
AM=M+1 // 9729
A=A-1 // 9730
M=D // 9731
@51 // 9732
D=A // 9733
@SP // 9734
AM=M+1 // 9735
A=A-1 // 9736
M=D // 9737
@31 // 9738
D=A // 9739
@SP // 9740
AM=M+1 // 9741
A=A-1 // 9742
M=D // 9743
@27 // 9744
D=A // 9745
@SP // 9746
AM=M+1 // 9747
A=A-1 // 9748
M=D // 9749
@51 // 9750
D=A // 9751
@SP // 9752
AM=M+1 // 9753
A=A-1 // 9754
M=D // 9755
@51 // 9756
D=A // 9757
@SP // 9758
AM=M+1 // 9759
A=A-1 // 9760
M=D // 9761
@51 // 9762
D=A // 9763
@SP // 9764
AM=M+1 // 9765
A=A-1 // 9766
M=D // 9767
@SP // 9768
AM=M+1 // 9769
A=A-1 // 9770
M=0 // 9771
@SP // 9772
AM=M+1 // 9773
A=A-1 // 9774
M=0 // 9775
// call Output.create
@17 // 9776
D=A // 9777
@14 // 9778
M=D // 9779
@Output.create // 9780
D=A // 9781
@13 // 9782
M=D // 9783
@Output.init.ret.52 // 9784
D=A // 9785
@CALL // 9786
0;JMP // 9787
(Output.init.ret.52)
@SP // 9788
M=M-1 // 9789

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9790
D=A // 9791
@SP // 9792
AM=M+1 // 9793
A=A-1 // 9794
M=D // 9795
@30 // 9796
D=A // 9797
@SP // 9798
AM=M+1 // 9799
A=A-1 // 9800
M=D // 9801
@51 // 9802
D=A // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=D // 9807
@51 // 9808
D=A // 9809
@SP // 9810
AM=M+1 // 9811
A=A-1 // 9812
M=D // 9813
@6 // 9814
D=A // 9815
@SP // 9816
AM=M+1 // 9817
A=A-1 // 9818
M=D // 9819
@28 // 9820
D=A // 9821
@SP // 9822
AM=M+1 // 9823
A=A-1 // 9824
M=D // 9825
@48 // 9826
D=A // 9827
@SP // 9828
AM=M+1 // 9829
A=A-1 // 9830
M=D // 9831
@51 // 9832
D=A // 9833
@SP // 9834
AM=M+1 // 9835
A=A-1 // 9836
M=D // 9837
@51 // 9838
D=A // 9839
@SP // 9840
AM=M+1 // 9841
A=A-1 // 9842
M=D // 9843
@30 // 9844
D=A // 9845
@SP // 9846
AM=M+1 // 9847
A=A-1 // 9848
M=D // 9849
@SP // 9850
AM=M+1 // 9851
A=A-1 // 9852
M=0 // 9853
@SP // 9854
AM=M+1 // 9855
A=A-1 // 9856
M=0 // 9857
// call Output.create
@17 // 9858
D=A // 9859
@14 // 9860
M=D // 9861
@Output.create // 9862
D=A // 9863
@13 // 9864
M=D // 9865
@Output.init.ret.53 // 9866
D=A // 9867
@CALL // 9868
0;JMP // 9869
(Output.init.ret.53)
@SP // 9870
M=M-1 // 9871

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9872
D=A // 9873
@SP // 9874
AM=M+1 // 9875
A=A-1 // 9876
M=D // 9877
@63 // 9878
D=A // 9879
@SP // 9880
AM=M+1 // 9881
A=A-1 // 9882
M=D // 9883
@63 // 9884
D=A // 9885
@SP // 9886
AM=M+1 // 9887
A=A-1 // 9888
M=D // 9889
@45 // 9890
D=A // 9891
@SP // 9892
AM=M+1 // 9893
A=A-1 // 9894
M=D // 9895
@12 // 9896
D=A // 9897
@SP // 9898
AM=M+1 // 9899
A=A-1 // 9900
M=D // 9901
@12 // 9902
D=A // 9903
@SP // 9904
AM=M+1 // 9905
A=A-1 // 9906
M=D // 9907
@12 // 9908
D=A // 9909
@SP // 9910
AM=M+1 // 9911
A=A-1 // 9912
M=D // 9913
@12 // 9914
D=A // 9915
@SP // 9916
AM=M+1 // 9917
A=A-1 // 9918
M=D // 9919
@12 // 9920
D=A // 9921
@SP // 9922
AM=M+1 // 9923
A=A-1 // 9924
M=D // 9925
@30 // 9926
D=A // 9927
@SP // 9928
AM=M+1 // 9929
A=A-1 // 9930
M=D // 9931
@SP // 9932
AM=M+1 // 9933
A=A-1 // 9934
M=0 // 9935
@SP // 9936
AM=M+1 // 9937
A=A-1 // 9938
M=0 // 9939
// call Output.create
@17 // 9940
D=A // 9941
@14 // 9942
M=D // 9943
@Output.create // 9944
D=A // 9945
@13 // 9946
M=D // 9947
@Output.init.ret.54 // 9948
D=A // 9949
@CALL // 9950
0;JMP // 9951
(Output.init.ret.54)
@SP // 9952
M=M-1 // 9953

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9954
D=A // 9955
@SP // 9956
AM=M+1 // 9957
A=A-1 // 9958
M=D // 9959
@51 // 9960
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
@51 // 9972
D=A // 9973
@SP // 9974
AM=M+1 // 9975
A=A-1 // 9976
M=D // 9977
@51 // 9978
D=A // 9979
@SP // 9980
AM=M+1 // 9981
A=A-1 // 9982
M=D // 9983
@51 // 9984
D=A // 9985
@SP // 9986
AM=M+1 // 9987
A=A-1 // 9988
M=D // 9989
@51 // 9990
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
@51 // 10002
D=A // 10003
@SP // 10004
AM=M+1 // 10005
A=A-1 // 10006
M=D // 10007
@30 // 10008
D=A // 10009
@SP // 10010
AM=M+1 // 10011
A=A-1 // 10012
M=D // 10013
@SP // 10014
AM=M+1 // 10015
A=A-1 // 10016
M=0 // 10017
@SP // 10018
AM=M+1 // 10019
A=A-1 // 10020
M=0 // 10021
// call Output.create
@17 // 10022
D=A // 10023
@14 // 10024
M=D // 10025
@Output.create // 10026
D=A // 10027
@13 // 10028
M=D // 10029
@Output.init.ret.55 // 10030
D=A // 10031
@CALL // 10032
0;JMP // 10033
(Output.init.ret.55)
@SP // 10034
M=M-1 // 10035

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 10036
D=A // 10037
@SP // 10038
AM=M+1 // 10039
A=A-1 // 10040
M=D // 10041
@51 // 10042
D=A // 10043
@SP // 10044
AM=M+1 // 10045
A=A-1 // 10046
M=D // 10047
@51 // 10048
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
@30 // 10078
D=A // 10079
@SP // 10080
AM=M+1 // 10081
A=A-1 // 10082
M=D // 10083
@12 // 10084
D=A // 10085
@SP // 10086
AM=M+1 // 10087
A=A-1 // 10088
M=D // 10089
@12 // 10090
D=A // 10091
@SP // 10092
AM=M+1 // 10093
A=A-1 // 10094
M=D // 10095
@SP // 10096
AM=M+1 // 10097
A=A-1 // 10098
M=0 // 10099
@SP // 10100
AM=M+1 // 10101
A=A-1 // 10102
M=0 // 10103
// call Output.create
@17 // 10104
D=A // 10105
@14 // 10106
M=D // 10107
@Output.create // 10108
D=A // 10109
@13 // 10110
M=D // 10111
@Output.init.ret.56 // 10112
D=A // 10113
@CALL // 10114
0;JMP // 10115
(Output.init.ret.56)
@SP // 10116
M=M-1 // 10117

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10118
D=A // 10119
@SP // 10120
AM=M+1 // 10121
A=A-1 // 10122
M=D // 10123
@51 // 10124
D=A // 10125
@SP // 10126
AM=M+1 // 10127
A=A-1 // 10128
M=D // 10129
@51 // 10130
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
@51 // 10142
D=A // 10143
@SP // 10144
AM=M+1 // 10145
A=A-1 // 10146
M=D // 10147
@51 // 10148
D=A // 10149
@SP // 10150
AM=M+1 // 10151
A=A-1 // 10152
M=D // 10153
@63 // 10154
D=A // 10155
@SP // 10156
AM=M+1 // 10157
A=A-1 // 10158
M=D // 10159
@63 // 10160
D=A // 10161
@SP // 10162
AM=M+1 // 10163
A=A-1 // 10164
M=D // 10165
@63 // 10166
D=A // 10167
@SP // 10168
AM=M+1 // 10169
A=A-1 // 10170
M=D // 10171
@18 // 10172
D=A // 10173
@SP // 10174
AM=M+1 // 10175
A=A-1 // 10176
M=D // 10177
@SP // 10178
AM=M+1 // 10179
A=A-1 // 10180
M=0 // 10181
@SP // 10182
AM=M+1 // 10183
A=A-1 // 10184
M=0 // 10185
// call Output.create
@17 // 10186
D=A // 10187
@14 // 10188
M=D // 10189
@Output.create // 10190
D=A // 10191
@13 // 10192
M=D // 10193
@Output.init.ret.57 // 10194
D=A // 10195
@CALL // 10196
0;JMP // 10197
(Output.init.ret.57)
@SP // 10198
M=M-1 // 10199

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10200
D=A // 10201
@SP // 10202
AM=M+1 // 10203
A=A-1 // 10204
M=D // 10205
@51 // 10206
D=A // 10207
@SP // 10208
AM=M+1 // 10209
A=A-1 // 10210
M=D // 10211
@51 // 10212
D=A // 10213
@SP // 10214
AM=M+1 // 10215
A=A-1 // 10216
M=D // 10217
@30 // 10218
D=A // 10219
@SP // 10220
AM=M+1 // 10221
A=A-1 // 10222
M=D // 10223
@30 // 10224
D=A // 10225
@SP // 10226
AM=M+1 // 10227
A=A-1 // 10228
M=D // 10229
@12 // 10230
D=A // 10231
@SP // 10232
AM=M+1 // 10233
A=A-1 // 10234
M=D // 10235
@30 // 10236
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
@51 // 10248
D=A // 10249
@SP // 10250
AM=M+1 // 10251
A=A-1 // 10252
M=D // 10253
@51 // 10254
D=A // 10255
@SP // 10256
AM=M+1 // 10257
A=A-1 // 10258
M=D // 10259
@SP // 10260
AM=M+1 // 10261
A=A-1 // 10262
M=0 // 10263
@SP // 10264
AM=M+1 // 10265
A=A-1 // 10266
M=0 // 10267
// call Output.create
@17 // 10268
D=A // 10269
@14 // 10270
M=D // 10271
@Output.create // 10272
D=A // 10273
@13 // 10274
M=D // 10275
@Output.init.ret.58 // 10276
D=A // 10277
@CALL // 10278
0;JMP // 10279
(Output.init.ret.58)
@SP // 10280
M=M-1 // 10281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10282
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
@51 // 10300
D=A // 10301
@SP // 10302
AM=M+1 // 10303
A=A-1 // 10304
M=D // 10305
@51 // 10306
D=A // 10307
@SP // 10308
AM=M+1 // 10309
A=A-1 // 10310
M=D // 10311
@30 // 10312
D=A // 10313
@SP // 10314
AM=M+1 // 10315
A=A-1 // 10316
M=D // 10317
@12 // 10318
D=A // 10319
@SP // 10320
AM=M+1 // 10321
A=A-1 // 10322
M=D // 10323
@12 // 10324
D=A // 10325
@SP // 10326
AM=M+1 // 10327
A=A-1 // 10328
M=D // 10329
@12 // 10330
D=A // 10331
@SP // 10332
AM=M+1 // 10333
A=A-1 // 10334
M=D // 10335
@30 // 10336
D=A // 10337
@SP // 10338
AM=M+1 // 10339
A=A-1 // 10340
M=D // 10341
@SP // 10342
AM=M+1 // 10343
A=A-1 // 10344
M=0 // 10345
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=0 // 10349
// call Output.create
@17 // 10350
D=A // 10351
@14 // 10352
M=D // 10353
@Output.create // 10354
D=A // 10355
@13 // 10356
M=D // 10357
@Output.init.ret.59 // 10358
D=A // 10359
@CALL // 10360
0;JMP // 10361
(Output.init.ret.59)
@SP // 10362
M=M-1 // 10363

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10364
D=A // 10365
@SP // 10366
AM=M+1 // 10367
A=A-1 // 10368
M=D // 10369
@63 // 10370
D=A // 10371
@SP // 10372
AM=M+1 // 10373
A=A-1 // 10374
M=D // 10375
@51 // 10376
D=A // 10377
@SP // 10378
AM=M+1 // 10379
A=A-1 // 10380
M=D // 10381
@49 // 10382
D=A // 10383
@SP // 10384
AM=M+1 // 10385
A=A-1 // 10386
M=D // 10387
@24 // 10388
D=A // 10389
@SP // 10390
AM=M+1 // 10391
A=A-1 // 10392
M=D // 10393
@12 // 10394
D=A // 10395
@SP // 10396
AM=M+1 // 10397
A=A-1 // 10398
M=D // 10399
@6 // 10400
D=A // 10401
@SP // 10402
AM=M+1 // 10403
A=A-1 // 10404
M=D // 10405
@35 // 10406
D=A // 10407
@SP // 10408
AM=M+1 // 10409
A=A-1 // 10410
M=D // 10411
@51 // 10412
D=A // 10413
@SP // 10414
AM=M+1 // 10415
A=A-1 // 10416
M=D // 10417
@63 // 10418
D=A // 10419
@SP // 10420
AM=M+1 // 10421
A=A-1 // 10422
M=D // 10423
@SP // 10424
AM=M+1 // 10425
A=A-1 // 10426
M=0 // 10427
@SP // 10428
AM=M+1 // 10429
A=A-1 // 10430
M=0 // 10431
// call Output.create
@17 // 10432
D=A // 10433
@14 // 10434
M=D // 10435
@Output.create // 10436
D=A // 10437
@13 // 10438
M=D // 10439
@Output.init.ret.60 // 10440
D=A // 10441
@CALL // 10442
0;JMP // 10443
(Output.init.ret.60)
@SP // 10444
M=M-1 // 10445

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10446
D=A // 10447
@SP // 10448
AM=M+1 // 10449
A=A-1 // 10450
M=D // 10451
@30 // 10452
D=A // 10453
@SP // 10454
AM=M+1 // 10455
A=A-1 // 10456
M=D // 10457
@6 // 10458
D=A // 10459
@SP // 10460
AM=M+1 // 10461
A=A-1 // 10462
M=D // 10463
@6 // 10464
D=A // 10465
@SP // 10466
AM=M+1 // 10467
A=A-1 // 10468
M=D // 10469
@6 // 10470
D=A // 10471
@SP // 10472
AM=M+1 // 10473
A=A-1 // 10474
M=D // 10475
@6 // 10476
D=A // 10477
@SP // 10478
AM=M+1 // 10479
A=A-1 // 10480
M=D // 10481
@6 // 10482
D=A // 10483
@SP // 10484
AM=M+1 // 10485
A=A-1 // 10486
M=D // 10487
@6 // 10488
D=A // 10489
@SP // 10490
AM=M+1 // 10491
A=A-1 // 10492
M=D // 10493
@6 // 10494
D=A // 10495
@SP // 10496
AM=M+1 // 10497
A=A-1 // 10498
M=D // 10499
@30 // 10500
D=A // 10501
@SP // 10502
AM=M+1 // 10503
A=A-1 // 10504
M=D // 10505
@SP // 10506
AM=M+1 // 10507
A=A-1 // 10508
M=0 // 10509
@SP // 10510
AM=M+1 // 10511
A=A-1 // 10512
M=0 // 10513
// call Output.create
@17 // 10514
D=A // 10515
@14 // 10516
M=D // 10517
@Output.create // 10518
D=A // 10519
@13 // 10520
M=D // 10521
@Output.init.ret.61 // 10522
D=A // 10523
@CALL // 10524
0;JMP // 10525
(Output.init.ret.61)
@SP // 10526
M=M-1 // 10527

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10528
D=A // 10529
@SP // 10530
M=D+M // 10531
@92 // 10532
D=A // 10533
@SP // 10534
A=M-1 // 10535
M=1 // 10536
A=A-1 // 10537
M=0 // 10538
A=A-1 // 10539
M=0 // 10540
A=A-1 // 10541
M=D // 10542
A=A-1 // 10543
@3 // 10544
D=A // 10545
@SP // 10546
AM=M+1 // 10547
A=A-1 // 10548
M=D // 10549
@6 // 10550
D=A // 10551
@SP // 10552
AM=M+1 // 10553
A=A-1 // 10554
M=D // 10555
@12 // 10556
D=A // 10557
@SP // 10558
AM=M+1 // 10559
A=A-1 // 10560
M=D // 10561
@24 // 10562
D=A // 10563
@SP // 10564
AM=M+1 // 10565
A=A-1 // 10566
M=D // 10567
@48 // 10568
D=A // 10569
@SP // 10570
AM=M+1 // 10571
A=A-1 // 10572
M=D // 10573
@32 // 10574
D=A // 10575
@SP // 10576
AM=M+1 // 10577
A=A-1 // 10578
M=D // 10579
@SP // 10580
AM=M+1 // 10581
A=A-1 // 10582
M=0 // 10583
@SP // 10584
AM=M+1 // 10585
A=A-1 // 10586
M=0 // 10587
// call Output.create
@17 // 10588
D=A // 10589
@14 // 10590
M=D // 10591
@Output.create // 10592
D=A // 10593
@13 // 10594
M=D // 10595
@Output.init.ret.62 // 10596
D=A // 10597
@CALL // 10598
0;JMP // 10599
(Output.init.ret.62)
@SP // 10600
M=M-1 // 10601

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10602
D=A // 10603
@SP // 10604
AM=M+1 // 10605
A=A-1 // 10606
M=D // 10607
@30 // 10608
D=A // 10609
@SP // 10610
AM=M+1 // 10611
A=A-1 // 10612
M=D // 10613
@24 // 10614
D=A // 10615
@SP // 10616
AM=M+1 // 10617
A=A-1 // 10618
M=D // 10619
@24 // 10620
D=A // 10621
@SP // 10622
AM=M+1 // 10623
A=A-1 // 10624
M=D // 10625
@24 // 10626
D=A // 10627
@SP // 10628
AM=M+1 // 10629
A=A-1 // 10630
M=D // 10631
@24 // 10632
D=A // 10633
@SP // 10634
AM=M+1 // 10635
A=A-1 // 10636
M=D // 10637
@24 // 10638
D=A // 10639
@SP // 10640
AM=M+1 // 10641
A=A-1 // 10642
M=D // 10643
@24 // 10644
D=A // 10645
@SP // 10646
AM=M+1 // 10647
A=A-1 // 10648
M=D // 10649
@24 // 10650
D=A // 10651
@SP // 10652
AM=M+1 // 10653
A=A-1 // 10654
M=D // 10655
@30 // 10656
D=A // 10657
@SP // 10658
AM=M+1 // 10659
A=A-1 // 10660
M=D // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=0 // 10665
@SP // 10666
AM=M+1 // 10667
A=A-1 // 10668
M=0 // 10669
// call Output.create
@17 // 10670
D=A // 10671
@14 // 10672
M=D // 10673
@Output.create // 10674
D=A // 10675
@13 // 10676
M=D // 10677
@Output.init.ret.63 // 10678
D=A // 10679
@CALL // 10680
0;JMP // 10681
(Output.init.ret.63)
@SP // 10682
M=M-1 // 10683

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10684
D=A // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=D // 10689
@8 // 10690
D=A // 10691
@SP // 10692
AM=M+1 // 10693
A=A-1 // 10694
M=D // 10695
@28 // 10696
D=A // 10697
@SP // 10698
AM=M+1 // 10699
A=A-1 // 10700
M=D // 10701
@54 // 10702
D=A // 10703
@SP // 10704
AM=M+1 // 10705
A=A-1 // 10706
M=D // 10707
@SP // 10708
AM=M+1 // 10709
A=A-1 // 10710
M=0 // 10711
@SP // 10712
AM=M+1 // 10713
A=A-1 // 10714
M=0 // 10715
@SP // 10716
AM=M+1 // 10717
A=A-1 // 10718
M=0 // 10719
@SP // 10720
AM=M+1 // 10721
A=A-1 // 10722
M=0 // 10723
@SP // 10724
AM=M+1 // 10725
A=A-1 // 10726
M=0 // 10727
@SP // 10728
AM=M+1 // 10729
A=A-1 // 10730
M=0 // 10731
@SP // 10732
AM=M+1 // 10733
A=A-1 // 10734
M=0 // 10735
@SP // 10736
AM=M+1 // 10737
A=A-1 // 10738
M=0 // 10739
// call Output.create
@17 // 10740
D=A // 10741
@14 // 10742
M=D // 10743
@Output.create // 10744
D=A // 10745
@13 // 10746
M=D // 10747
@Output.init.ret.64 // 10748
D=A // 10749
@CALL // 10750
0;JMP // 10751
(Output.init.ret.64)
@SP // 10752
M=M-1 // 10753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10754
D=A // 10755
@SP // 10756
M=D+M // 10757
@95 // 10758
D=A // 10759
@SP // 10760
A=M-1 // 10761
M=0 // 10762
A=A-1 // 10763
M=0 // 10764
A=A-1 // 10765
M=0 // 10766
A=A-1 // 10767
M=0 // 10768
A=A-1 // 10769
M=0 // 10770
A=A-1 // 10771
M=0 // 10772
A=A-1 // 10773
M=0 // 10774
A=A-1 // 10775
M=0 // 10776
A=A-1 // 10777
M=0 // 10778
A=A-1 // 10779
M=D // 10780
A=A-1 // 10781
@2 // 10782
D=A // 10783
@SP // 10784
M=D+M // 10785
@63 // 10786
D=A // 10787
@SP // 10788
A=M-1 // 10789
M=0 // 10790
A=A-1 // 10791
M=D // 10792
A=A-1 // 10793
// call Output.create
@17 // 10794
D=A // 10795
@14 // 10796
M=D // 10797
@Output.create // 10798
D=A // 10799
@13 // 10800
M=D // 10801
@Output.init.ret.65 // 10802
D=A // 10803
@CALL // 10804
0;JMP // 10805
(Output.init.ret.65)
@SP // 10806
M=M-1 // 10807

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10808
D=A // 10809
@SP // 10810
AM=M+1 // 10811
A=A-1 // 10812
M=D // 10813
@6 // 10814
D=A // 10815
@SP // 10816
AM=M+1 // 10817
A=A-1 // 10818
M=D // 10819
@12 // 10820
D=A // 10821
@SP // 10822
AM=M+1 // 10823
A=A-1 // 10824
M=D // 10825
@24 // 10826
D=A // 10827
@SP // 10828
AM=M+1 // 10829
A=A-1 // 10830
M=D // 10831
@SP // 10832
AM=M+1 // 10833
A=A-1 // 10834
M=0 // 10835
@SP // 10836
AM=M+1 // 10837
A=A-1 // 10838
M=0 // 10839
@SP // 10840
AM=M+1 // 10841
A=A-1 // 10842
M=0 // 10843
@SP // 10844
AM=M+1 // 10845
A=A-1 // 10846
M=0 // 10847
@SP // 10848
AM=M+1 // 10849
A=A-1 // 10850
M=0 // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=0 // 10855
@SP // 10856
AM=M+1 // 10857
A=A-1 // 10858
M=0 // 10859
@SP // 10860
AM=M+1 // 10861
A=A-1 // 10862
M=0 // 10863
// call Output.create
@17 // 10864
D=A // 10865
@14 // 10866
M=D // 10867
@Output.create // 10868
D=A // 10869
@13 // 10870
M=D // 10871
@Output.init.ret.66 // 10872
D=A // 10873
@CALL // 10874
0;JMP // 10875
(Output.init.ret.66)
@SP // 10876
M=M-1 // 10877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10878
D=A // 10879
@SP // 10880
M=D+M // 10881
@97 // 10882
D=A // 10883
@SP // 10884
A=M-1 // 10885
M=0 // 10886
A=A-1 // 10887
M=0 // 10888
A=A-1 // 10889
M=0 // 10890
A=A-1 // 10891
M=D // 10892
A=A-1 // 10893
@14 // 10894
D=A // 10895
@SP // 10896
AM=M+1 // 10897
A=A-1 // 10898
M=D // 10899
@24 // 10900
D=A // 10901
@SP // 10902
AM=M+1 // 10903
A=A-1 // 10904
M=D // 10905
@30 // 10906
D=A // 10907
@SP // 10908
AM=M+1 // 10909
A=A-1 // 10910
M=D // 10911
@27 // 10912
D=A // 10913
@SP // 10914
AM=M+1 // 10915
A=A-1 // 10916
M=D // 10917
@27 // 10918
D=A // 10919
@SP // 10920
AM=M+1 // 10921
A=A-1 // 10922
M=D // 10923
@54 // 10924
D=A // 10925
@SP // 10926
AM=M+1 // 10927
A=A-1 // 10928
M=D // 10929
@SP // 10930
AM=M+1 // 10931
A=A-1 // 10932
M=0 // 10933
@SP // 10934
AM=M+1 // 10935
A=A-1 // 10936
M=0 // 10937
// call Output.create
@17 // 10938
D=A // 10939
@14 // 10940
M=D // 10941
@Output.create // 10942
D=A // 10943
@13 // 10944
M=D // 10945
@Output.init.ret.67 // 10946
D=A // 10947
@CALL // 10948
0;JMP // 10949
(Output.init.ret.67)
@SP // 10950
M=M-1 // 10951

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10952
D=A // 10953
@SP // 10954
AM=M+1 // 10955
A=A-1 // 10956
M=D // 10957
@3 // 10958
D=A // 10959
@SP // 10960
AM=M+1 // 10961
A=A-1 // 10962
M=D // 10963
@3 // 10964
D=A // 10965
@SP // 10966
AM=M+1 // 10967
A=A-1 // 10968
M=D // 10969
@3 // 10970
D=A // 10971
@SP // 10972
AM=M+1 // 10973
A=A-1 // 10974
M=D // 10975
@15 // 10976
D=A // 10977
@SP // 10978
AM=M+1 // 10979
A=A-1 // 10980
M=D // 10981
@27 // 10982
D=A // 10983
@SP // 10984
AM=M+1 // 10985
A=A-1 // 10986
M=D // 10987
@51 // 10988
D=A // 10989
@SP // 10990
AM=M+1 // 10991
A=A-1 // 10992
M=D // 10993
@51 // 10994
D=A // 10995
@SP // 10996
AM=M+1 // 10997
A=A-1 // 10998
M=D // 10999
@51 // 11000
D=A // 11001
@SP // 11002
AM=M+1 // 11003
A=A-1 // 11004
M=D // 11005
@30 // 11006
D=A // 11007
@SP // 11008
AM=M+1 // 11009
A=A-1 // 11010
M=D // 11011
@SP // 11012
AM=M+1 // 11013
A=A-1 // 11014
M=0 // 11015
@SP // 11016
AM=M+1 // 11017
A=A-1 // 11018
M=0 // 11019
// call Output.create
@17 // 11020
D=A // 11021
@14 // 11022
M=D // 11023
@Output.create // 11024
D=A // 11025
@13 // 11026
M=D // 11027
@Output.init.ret.68 // 11028
D=A // 11029
@CALL // 11030
0;JMP // 11031
(Output.init.ret.68)
@SP // 11032
M=M-1 // 11033

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11034
D=A // 11035
@SP // 11036
M=D+M // 11037
@99 // 11038
D=A // 11039
@SP // 11040
A=M-1 // 11041
M=0 // 11042
A=A-1 // 11043
M=0 // 11044
A=A-1 // 11045
M=0 // 11046
A=A-1 // 11047
M=D // 11048
A=A-1 // 11049
@30 // 11050
D=A // 11051
@SP // 11052
AM=M+1 // 11053
A=A-1 // 11054
M=D // 11055
@51 // 11056
D=A // 11057
@SP // 11058
AM=M+1 // 11059
A=A-1 // 11060
M=D // 11061
@3 // 11062
D=A // 11063
@SP // 11064
AM=M+1 // 11065
A=A-1 // 11066
M=D // 11067
@3 // 11068
D=A // 11069
@SP // 11070
AM=M+1 // 11071
A=A-1 // 11072
M=D // 11073
@51 // 11074
D=A // 11075
@SP // 11076
AM=M+1 // 11077
A=A-1 // 11078
M=D // 11079
@30 // 11080
D=A // 11081
@SP // 11082
AM=M+1 // 11083
A=A-1 // 11084
M=D // 11085
@SP // 11086
AM=M+1 // 11087
A=A-1 // 11088
M=0 // 11089
@SP // 11090
AM=M+1 // 11091
A=A-1 // 11092
M=0 // 11093
// call Output.create
@17 // 11094
D=A // 11095
@14 // 11096
M=D // 11097
@Output.create // 11098
D=A // 11099
@13 // 11100
M=D // 11101
@Output.init.ret.69 // 11102
D=A // 11103
@CALL // 11104
0;JMP // 11105
(Output.init.ret.69)
@SP // 11106
M=M-1 // 11107

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11108
D=A // 11109
@SP // 11110
AM=M+1 // 11111
A=A-1 // 11112
M=D // 11113
@48 // 11114
D=A // 11115
@SP // 11116
AM=M+1 // 11117
A=A-1 // 11118
M=D // 11119
@48 // 11120
D=A // 11121
@SP // 11122
AM=M+1 // 11123
A=A-1 // 11124
M=D // 11125
@48 // 11126
D=A // 11127
@SP // 11128
AM=M+1 // 11129
A=A-1 // 11130
M=D // 11131
@60 // 11132
D=A // 11133
@SP // 11134
AM=M+1 // 11135
A=A-1 // 11136
M=D // 11137
@54 // 11138
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
@30 // 11162
D=A // 11163
@SP // 11164
AM=M+1 // 11165
A=A-1 // 11166
M=D // 11167
@SP // 11168
AM=M+1 // 11169
A=A-1 // 11170
M=0 // 11171
@SP // 11172
AM=M+1 // 11173
A=A-1 // 11174
M=0 // 11175
// call Output.create
@17 // 11176
D=A // 11177
@14 // 11178
M=D // 11179
@Output.create // 11180
D=A // 11181
@13 // 11182
M=D // 11183
@Output.init.ret.70 // 11184
D=A // 11185
@CALL // 11186
0;JMP // 11187
(Output.init.ret.70)
@SP // 11188
M=M-1 // 11189

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11190
D=A // 11191
@SP // 11192
M=D+M // 11193
@101 // 11194
D=A // 11195
@SP // 11196
A=M-1 // 11197
M=0 // 11198
A=A-1 // 11199
M=0 // 11200
A=A-1 // 11201
M=0 // 11202
A=A-1 // 11203
M=D // 11204
A=A-1 // 11205
@30 // 11206
D=A // 11207
@SP // 11208
AM=M+1 // 11209
A=A-1 // 11210
M=D // 11211
@51 // 11212
D=A // 11213
@SP // 11214
AM=M+1 // 11215
A=A-1 // 11216
M=D // 11217
@63 // 11218
D=A // 11219
@SP // 11220
AM=M+1 // 11221
A=A-1 // 11222
M=D // 11223
@3 // 11224
D=A // 11225
@SP // 11226
AM=M+1 // 11227
A=A-1 // 11228
M=D // 11229
@51 // 11230
D=A // 11231
@SP // 11232
AM=M+1 // 11233
A=A-1 // 11234
M=D // 11235
@30 // 11236
D=A // 11237
@SP // 11238
AM=M+1 // 11239
A=A-1 // 11240
M=D // 11241
@SP // 11242
AM=M+1 // 11243
A=A-1 // 11244
M=0 // 11245
@SP // 11246
AM=M+1 // 11247
A=A-1 // 11248
M=0 // 11249
// call Output.create
@17 // 11250
D=A // 11251
@14 // 11252
M=D // 11253
@Output.create // 11254
D=A // 11255
@13 // 11256
M=D // 11257
@Output.init.ret.71 // 11258
D=A // 11259
@CALL // 11260
0;JMP // 11261
(Output.init.ret.71)
@SP // 11262
M=M-1 // 11263

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11264
D=A // 11265
@SP // 11266
AM=M+1 // 11267
A=A-1 // 11268
M=D // 11269
@28 // 11270
D=A // 11271
@SP // 11272
AM=M+1 // 11273
A=A-1 // 11274
M=D // 11275
@54 // 11276
D=A // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=D // 11281
@38 // 11282
D=A // 11283
@SP // 11284
AM=M+1 // 11285
A=A-1 // 11286
M=D // 11287
@6 // 11288
D=A // 11289
@SP // 11290
AM=M+1 // 11291
A=A-1 // 11292
M=D // 11293
@15 // 11294
D=A // 11295
@SP // 11296
AM=M+1 // 11297
A=A-1 // 11298
M=D // 11299
@6 // 11300
D=A // 11301
@SP // 11302
AM=M+1 // 11303
A=A-1 // 11304
M=D // 11305
@6 // 11306
D=A // 11307
@SP // 11308
AM=M+1 // 11309
A=A-1 // 11310
M=D // 11311
@6 // 11312
D=A // 11313
@SP // 11314
AM=M+1 // 11315
A=A-1 // 11316
M=D // 11317
@15 // 11318
D=A // 11319
@SP // 11320
AM=M+1 // 11321
A=A-1 // 11322
M=D // 11323
@SP // 11324
AM=M+1 // 11325
A=A-1 // 11326
M=0 // 11327
@SP // 11328
AM=M+1 // 11329
A=A-1 // 11330
M=0 // 11331
// call Output.create
@17 // 11332
D=A // 11333
@14 // 11334
M=D // 11335
@Output.create // 11336
D=A // 11337
@13 // 11338
M=D // 11339
@Output.init.ret.72 // 11340
D=A // 11341
@CALL // 11342
0;JMP // 11343
(Output.init.ret.72)
@SP // 11344
M=M-1 // 11345

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11346
D=A // 11347
@SP // 11348
M=D+M // 11349
@103 // 11350
D=A // 11351
@SP // 11352
A=M-1 // 11353
M=0 // 11354
A=A-1 // 11355
M=0 // 11356
A=A-1 // 11357
M=D // 11358
A=A-1 // 11359
@30 // 11360
D=A // 11361
@SP // 11362
AM=M+1 // 11363
A=A-1 // 11364
M=D // 11365
@51 // 11366
D=A // 11367
@SP // 11368
AM=M+1 // 11369
A=A-1 // 11370
M=D // 11371
@51 // 11372
D=A // 11373
@SP // 11374
AM=M+1 // 11375
A=A-1 // 11376
M=D // 11377
@51 // 11378
D=A // 11379
@SP // 11380
AM=M+1 // 11381
A=A-1 // 11382
M=D // 11383
@62 // 11384
D=A // 11385
@SP // 11386
AM=M+1 // 11387
A=A-1 // 11388
M=D // 11389
@48 // 11390
D=A // 11391
@SP // 11392
AM=M+1 // 11393
A=A-1 // 11394
M=D // 11395
@51 // 11396
D=A // 11397
@SP // 11398
AM=M+1 // 11399
A=A-1 // 11400
M=D // 11401
@30 // 11402
D=A // 11403
@SP // 11404
AM=M+1 // 11405
A=A-1 // 11406
M=D // 11407
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=0 // 11411
// call Output.create
@17 // 11412
D=A // 11413
@14 // 11414
M=D // 11415
@Output.create // 11416
D=A // 11417
@13 // 11418
M=D // 11419
@Output.init.ret.73 // 11420
D=A // 11421
@CALL // 11422
0;JMP // 11423
(Output.init.ret.73)
@SP // 11424
M=M-1 // 11425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11426
D=A // 11427
@SP // 11428
AM=M+1 // 11429
A=A-1 // 11430
M=D // 11431
@3 // 11432
D=A // 11433
@SP // 11434
AM=M+1 // 11435
A=A-1 // 11436
M=D // 11437
@3 // 11438
D=A // 11439
@SP // 11440
AM=M+1 // 11441
A=A-1 // 11442
M=D // 11443
@3 // 11444
D=A // 11445
@SP // 11446
AM=M+1 // 11447
A=A-1 // 11448
M=D // 11449
@27 // 11450
D=A // 11451
@SP // 11452
AM=M+1 // 11453
A=A-1 // 11454
M=D // 11455
@55 // 11456
D=A // 11457
@SP // 11458
AM=M+1 // 11459
A=A-1 // 11460
M=D // 11461
@51 // 11462
D=A // 11463
@SP // 11464
AM=M+1 // 11465
A=A-1 // 11466
M=D // 11467
@51 // 11468
D=A // 11469
@SP // 11470
AM=M+1 // 11471
A=A-1 // 11472
M=D // 11473
@51 // 11474
D=A // 11475
@SP // 11476
AM=M+1 // 11477
A=A-1 // 11478
M=D // 11479
@51 // 11480
D=A // 11481
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=D // 11485
@SP // 11486
AM=M+1 // 11487
A=A-1 // 11488
M=0 // 11489
@SP // 11490
AM=M+1 // 11491
A=A-1 // 11492
M=0 // 11493
// call Output.create
@17 // 11494
D=A // 11495
@14 // 11496
M=D // 11497
@Output.create // 11498
D=A // 11499
@13 // 11500
M=D // 11501
@Output.init.ret.74 // 11502
D=A // 11503
@CALL // 11504
0;JMP // 11505
(Output.init.ret.74)
@SP // 11506
M=M-1 // 11507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11508
D=A // 11509
@SP // 11510
AM=M+1 // 11511
A=A-1 // 11512
M=D // 11513
@12 // 11514
D=A // 11515
@SP // 11516
AM=M+1 // 11517
A=A-1 // 11518
M=D // 11519
@12 // 11520
D=A // 11521
@SP // 11522
AM=M+1 // 11523
A=A-1 // 11524
M=D // 11525
@SP // 11526
AM=M+1 // 11527
A=A-1 // 11528
M=0 // 11529
@14 // 11530
D=A // 11531
@SP // 11532
AM=M+1 // 11533
A=A-1 // 11534
M=D // 11535
@12 // 11536
D=A // 11537
@SP // 11538
AM=M+1 // 11539
A=A-1 // 11540
M=D // 11541
@12 // 11542
D=A // 11543
@SP // 11544
AM=M+1 // 11545
A=A-1 // 11546
M=D // 11547
@12 // 11548
D=A // 11549
@SP // 11550
AM=M+1 // 11551
A=A-1 // 11552
M=D // 11553
@12 // 11554
D=A // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=D // 11559
@30 // 11560
D=A // 11561
@SP // 11562
AM=M+1 // 11563
A=A-1 // 11564
M=D // 11565
@SP // 11566
AM=M+1 // 11567
A=A-1 // 11568
M=0 // 11569
@SP // 11570
AM=M+1 // 11571
A=A-1 // 11572
M=0 // 11573
// call Output.create
@17 // 11574
D=A // 11575
@14 // 11576
M=D // 11577
@Output.create // 11578
D=A // 11579
@13 // 11580
M=D // 11581
@Output.init.ret.75 // 11582
D=A // 11583
@CALL // 11584
0;JMP // 11585
(Output.init.ret.75)
@SP // 11586
M=M-1 // 11587

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11588
D=A // 11589
@SP // 11590
AM=M+1 // 11591
A=A-1 // 11592
M=D // 11593
@48 // 11594
D=A // 11595
@SP // 11596
AM=M+1 // 11597
A=A-1 // 11598
M=D // 11599
@48 // 11600
D=A // 11601
@SP // 11602
AM=M+1 // 11603
A=A-1 // 11604
M=D // 11605
@SP // 11606
AM=M+1 // 11607
A=A-1 // 11608
M=0 // 11609
@56 // 11610
D=A // 11611
@SP // 11612
AM=M+1 // 11613
A=A-1 // 11614
M=D // 11615
@48 // 11616
D=A // 11617
@SP // 11618
AM=M+1 // 11619
A=A-1 // 11620
M=D // 11621
@48 // 11622
D=A // 11623
@SP // 11624
AM=M+1 // 11625
A=A-1 // 11626
M=D // 11627
@48 // 11628
D=A // 11629
@SP // 11630
AM=M+1 // 11631
A=A-1 // 11632
M=D // 11633
@48 // 11634
D=A // 11635
@SP // 11636
AM=M+1 // 11637
A=A-1 // 11638
M=D // 11639
@51 // 11640
D=A // 11641
@SP // 11642
AM=M+1 // 11643
A=A-1 // 11644
M=D // 11645
@30 // 11646
D=A // 11647
@SP // 11648
AM=M+1 // 11649
A=A-1 // 11650
M=D // 11651
@SP // 11652
AM=M+1 // 11653
A=A-1 // 11654
M=0 // 11655
// call Output.create
@17 // 11656
D=A // 11657
@14 // 11658
M=D // 11659
@Output.create // 11660
D=A // 11661
@13 // 11662
M=D // 11663
@Output.init.ret.76 // 11664
D=A // 11665
@CALL // 11666
0;JMP // 11667
(Output.init.ret.76)
@SP // 11668
M=M-1 // 11669

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11670
D=A // 11671
@SP // 11672
AM=M+1 // 11673
A=A-1 // 11674
M=D // 11675
@3 // 11676
D=A // 11677
@SP // 11678
AM=M+1 // 11679
A=A-1 // 11680
M=D // 11681
@3 // 11682
D=A // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=D // 11687
@3 // 11688
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
@27 // 11700
D=A // 11701
@SP // 11702
AM=M+1 // 11703
A=A-1 // 11704
M=D // 11705
@15 // 11706
D=A // 11707
@SP // 11708
AM=M+1 // 11709
A=A-1 // 11710
M=D // 11711
@15 // 11712
D=A // 11713
@SP // 11714
AM=M+1 // 11715
A=A-1 // 11716
M=D // 11717
@27 // 11718
D=A // 11719
@SP // 11720
AM=M+1 // 11721
A=A-1 // 11722
M=D // 11723
@51 // 11724
D=A // 11725
@SP // 11726
AM=M+1 // 11727
A=A-1 // 11728
M=D // 11729
@SP // 11730
AM=M+1 // 11731
A=A-1 // 11732
M=0 // 11733
@SP // 11734
AM=M+1 // 11735
A=A-1 // 11736
M=0 // 11737
// call Output.create
@17 // 11738
D=A // 11739
@14 // 11740
M=D // 11741
@Output.create // 11742
D=A // 11743
@13 // 11744
M=D // 11745
@Output.init.ret.77 // 11746
D=A // 11747
@CALL // 11748
0;JMP // 11749
(Output.init.ret.77)
@SP // 11750
M=M-1 // 11751

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11752
D=A // 11753
@SP // 11754
AM=M+1 // 11755
A=A-1 // 11756
M=D // 11757
@14 // 11758
D=A // 11759
@SP // 11760
AM=M+1 // 11761
A=A-1 // 11762
M=D // 11763
@12 // 11764
D=A // 11765
@SP // 11766
AM=M+1 // 11767
A=A-1 // 11768
M=D // 11769
@12 // 11770
D=A // 11771
@SP // 11772
AM=M+1 // 11773
A=A-1 // 11774
M=D // 11775
@12 // 11776
D=A // 11777
@SP // 11778
AM=M+1 // 11779
A=A-1 // 11780
M=D // 11781
@12 // 11782
D=A // 11783
@SP // 11784
AM=M+1 // 11785
A=A-1 // 11786
M=D // 11787
@12 // 11788
D=A // 11789
@SP // 11790
AM=M+1 // 11791
A=A-1 // 11792
M=D // 11793
@12 // 11794
D=A // 11795
@SP // 11796
AM=M+1 // 11797
A=A-1 // 11798
M=D // 11799
@12 // 11800
D=A // 11801
@SP // 11802
AM=M+1 // 11803
A=A-1 // 11804
M=D // 11805
@30 // 11806
D=A // 11807
@SP // 11808
AM=M+1 // 11809
A=A-1 // 11810
M=D // 11811
@SP // 11812
AM=M+1 // 11813
A=A-1 // 11814
M=0 // 11815
@SP // 11816
AM=M+1 // 11817
A=A-1 // 11818
M=0 // 11819
// call Output.create
@17 // 11820
D=A // 11821
@14 // 11822
M=D // 11823
@Output.create // 11824
D=A // 11825
@13 // 11826
M=D // 11827
@Output.init.ret.78 // 11828
D=A // 11829
@CALL // 11830
0;JMP // 11831
(Output.init.ret.78)
@SP // 11832
M=M-1 // 11833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11834
D=A // 11835
@SP // 11836
M=D+M // 11837
@109 // 11838
D=A // 11839
@SP // 11840
A=M-1 // 11841
M=0 // 11842
A=A-1 // 11843
M=0 // 11844
A=A-1 // 11845
M=0 // 11846
A=A-1 // 11847
M=D // 11848
A=A-1 // 11849
@29 // 11850
D=A // 11851
@SP // 11852
AM=M+1 // 11853
A=A-1 // 11854
M=D // 11855
@63 // 11856
D=A // 11857
@SP // 11858
AM=M+1 // 11859
A=A-1 // 11860
M=D // 11861
@43 // 11862
D=A // 11863
@SP // 11864
AM=M+1 // 11865
A=A-1 // 11866
M=D // 11867
@43 // 11868
D=A // 11869
@SP // 11870
AM=M+1 // 11871
A=A-1 // 11872
M=D // 11873
@43 // 11874
D=A // 11875
@SP // 11876
AM=M+1 // 11877
A=A-1 // 11878
M=D // 11879
@43 // 11880
D=A // 11881
@SP // 11882
AM=M+1 // 11883
A=A-1 // 11884
M=D // 11885
@SP // 11886
AM=M+1 // 11887
A=A-1 // 11888
M=0 // 11889
@SP // 11890
AM=M+1 // 11891
A=A-1 // 11892
M=0 // 11893
// call Output.create
@17 // 11894
D=A // 11895
@14 // 11896
M=D // 11897
@Output.create // 11898
D=A // 11899
@13 // 11900
M=D // 11901
@Output.init.ret.79 // 11902
D=A // 11903
@CALL // 11904
0;JMP // 11905
(Output.init.ret.79)
@SP // 11906
M=M-1 // 11907

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11908
D=A // 11909
@SP // 11910
M=D+M // 11911
@110 // 11912
D=A // 11913
@SP // 11914
A=M-1 // 11915
M=0 // 11916
A=A-1 // 11917
M=0 // 11918
A=A-1 // 11919
M=0 // 11920
A=A-1 // 11921
M=D // 11922
A=A-1 // 11923
@29 // 11924
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
@51 // 11936
D=A // 11937
@SP // 11938
AM=M+1 // 11939
A=A-1 // 11940
M=D // 11941
@51 // 11942
D=A // 11943
@SP // 11944
AM=M+1 // 11945
A=A-1 // 11946
M=D // 11947
@51 // 11948
D=A // 11949
@SP // 11950
AM=M+1 // 11951
A=A-1 // 11952
M=D // 11953
@51 // 11954
D=A // 11955
@SP // 11956
AM=M+1 // 11957
A=A-1 // 11958
M=D // 11959
@SP // 11960
AM=M+1 // 11961
A=A-1 // 11962
M=0 // 11963
@SP // 11964
AM=M+1 // 11965
A=A-1 // 11966
M=0 // 11967
// call Output.create
@17 // 11968
D=A // 11969
@14 // 11970
M=D // 11971
@Output.create // 11972
D=A // 11973
@13 // 11974
M=D // 11975
@Output.init.ret.80 // 11976
D=A // 11977
@CALL // 11978
0;JMP // 11979
(Output.init.ret.80)
@SP // 11980
M=M-1 // 11981

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11982
D=A // 11983
@SP // 11984
M=D+M // 11985
@111 // 11986
D=A // 11987
@SP // 11988
A=M-1 // 11989
M=0 // 11990
A=A-1 // 11991
M=0 // 11992
A=A-1 // 11993
M=0 // 11994
A=A-1 // 11995
M=D // 11996
A=A-1 // 11997
@30 // 11998
D=A // 11999
@SP // 12000
AM=M+1 // 12001
A=A-1 // 12002
M=D // 12003
@51 // 12004
D=A // 12005
@SP // 12006
AM=M+1 // 12007
A=A-1 // 12008
M=D // 12009
@51 // 12010
D=A // 12011
@SP // 12012
AM=M+1 // 12013
A=A-1 // 12014
M=D // 12015
@51 // 12016
D=A // 12017
@SP // 12018
AM=M+1 // 12019
A=A-1 // 12020
M=D // 12021
@51 // 12022
D=A // 12023
@SP // 12024
AM=M+1 // 12025
A=A-1 // 12026
M=D // 12027
@30 // 12028
D=A // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=D // 12033
@SP // 12034
AM=M+1 // 12035
A=A-1 // 12036
M=0 // 12037
@SP // 12038
AM=M+1 // 12039
A=A-1 // 12040
M=0 // 12041
// call Output.create
@17 // 12042
D=A // 12043
@14 // 12044
M=D // 12045
@Output.create // 12046
D=A // 12047
@13 // 12048
M=D // 12049
@Output.init.ret.81 // 12050
D=A // 12051
@CALL // 12052
0;JMP // 12053
(Output.init.ret.81)
@SP // 12054
M=M-1 // 12055

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12056
D=A // 12057
@SP // 12058
M=D+M // 12059
@112 // 12060
D=A // 12061
@SP // 12062
A=M-1 // 12063
M=0 // 12064
A=A-1 // 12065
M=0 // 12066
A=A-1 // 12067
M=0 // 12068
A=A-1 // 12069
M=D // 12070
A=A-1 // 12071
@30 // 12072
D=A // 12073
@SP // 12074
AM=M+1 // 12075
A=A-1 // 12076
M=D // 12077
@51 // 12078
D=A // 12079
@SP // 12080
AM=M+1 // 12081
A=A-1 // 12082
M=D // 12083
@51 // 12084
D=A // 12085
@SP // 12086
AM=M+1 // 12087
A=A-1 // 12088
M=D // 12089
@51 // 12090
D=A // 12091
@SP // 12092
AM=M+1 // 12093
A=A-1 // 12094
M=D // 12095
@31 // 12096
D=A // 12097
@SP // 12098
AM=M+1 // 12099
A=A-1 // 12100
M=D // 12101
@3 // 12102
D=A // 12103
@SP // 12104
AM=M+1 // 12105
A=A-1 // 12106
M=D // 12107
@3 // 12108
D=A // 12109
@SP // 12110
AM=M+1 // 12111
A=A-1 // 12112
M=D // 12113
@SP // 12114
AM=M+1 // 12115
A=A-1 // 12116
M=0 // 12117
// call Output.create
@17 // 12118
D=A // 12119
@14 // 12120
M=D // 12121
@Output.create // 12122
D=A // 12123
@13 // 12124
M=D // 12125
@Output.init.ret.82 // 12126
D=A // 12127
@CALL // 12128
0;JMP // 12129
(Output.init.ret.82)
@SP // 12130
M=M-1 // 12131

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12132
D=A // 12133
@SP // 12134
M=D+M // 12135
@113 // 12136
D=A // 12137
@SP // 12138
A=M-1 // 12139
M=0 // 12140
A=A-1 // 12141
M=0 // 12142
A=A-1 // 12143
M=0 // 12144
A=A-1 // 12145
M=D // 12146
A=A-1 // 12147
@30 // 12148
D=A // 12149
@SP // 12150
AM=M+1 // 12151
A=A-1 // 12152
M=D // 12153
@51 // 12154
D=A // 12155
@SP // 12156
AM=M+1 // 12157
A=A-1 // 12158
M=D // 12159
@51 // 12160
D=A // 12161
@SP // 12162
AM=M+1 // 12163
A=A-1 // 12164
M=D // 12165
@51 // 12166
D=A // 12167
@SP // 12168
AM=M+1 // 12169
A=A-1 // 12170
M=D // 12171
@62 // 12172
D=A // 12173
@SP // 12174
AM=M+1 // 12175
A=A-1 // 12176
M=D // 12177
@48 // 12178
D=A // 12179
@SP // 12180
AM=M+1 // 12181
A=A-1 // 12182
M=D // 12183
@48 // 12184
D=A // 12185
@SP // 12186
AM=M+1 // 12187
A=A-1 // 12188
M=D // 12189
@SP // 12190
AM=M+1 // 12191
A=A-1 // 12192
M=0 // 12193
// call Output.create
@17 // 12194
D=A // 12195
@14 // 12196
M=D // 12197
@Output.create // 12198
D=A // 12199
@13 // 12200
M=D // 12201
@Output.init.ret.83 // 12202
D=A // 12203
@CALL // 12204
0;JMP // 12205
(Output.init.ret.83)
@SP // 12206
M=M-1 // 12207

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12208
D=A // 12209
@SP // 12210
M=D+M // 12211
@114 // 12212
D=A // 12213
@SP // 12214
A=M-1 // 12215
M=0 // 12216
A=A-1 // 12217
M=0 // 12218
A=A-1 // 12219
M=0 // 12220
A=A-1 // 12221
M=D // 12222
A=A-1 // 12223
@29 // 12224
D=A // 12225
@SP // 12226
AM=M+1 // 12227
A=A-1 // 12228
M=D // 12229
@55 // 12230
D=A // 12231
@SP // 12232
AM=M+1 // 12233
A=A-1 // 12234
M=D // 12235
@51 // 12236
D=A // 12237
@SP // 12238
AM=M+1 // 12239
A=A-1 // 12240
M=D // 12241
@3 // 12242
D=A // 12243
@SP // 12244
AM=M+1 // 12245
A=A-1 // 12246
M=D // 12247
@3 // 12248
D=A // 12249
@SP // 12250
AM=M+1 // 12251
A=A-1 // 12252
M=D // 12253
@7 // 12254
D=A // 12255
@SP // 12256
AM=M+1 // 12257
A=A-1 // 12258
M=D // 12259
@SP // 12260
AM=M+1 // 12261
A=A-1 // 12262
M=0 // 12263
@SP // 12264
AM=M+1 // 12265
A=A-1 // 12266
M=0 // 12267
// call Output.create
@17 // 12268
D=A // 12269
@14 // 12270
M=D // 12271
@Output.create // 12272
D=A // 12273
@13 // 12274
M=D // 12275
@Output.init.ret.84 // 12276
D=A // 12277
@CALL // 12278
0;JMP // 12279
(Output.init.ret.84)
@SP // 12280
M=M-1 // 12281

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12282
D=A // 12283
@SP // 12284
M=D+M // 12285
@115 // 12286
D=A // 12287
@SP // 12288
A=M-1 // 12289
M=0 // 12290
A=A-1 // 12291
M=0 // 12292
A=A-1 // 12293
M=0 // 12294
A=A-1 // 12295
M=D // 12296
A=A-1 // 12297
@30 // 12298
D=A // 12299
@SP // 12300
AM=M+1 // 12301
A=A-1 // 12302
M=D // 12303
@51 // 12304
D=A // 12305
@SP // 12306
AM=M+1 // 12307
A=A-1 // 12308
M=D // 12309
@6 // 12310
D=A // 12311
@SP // 12312
AM=M+1 // 12313
A=A-1 // 12314
M=D // 12315
@24 // 12316
D=A // 12317
@SP // 12318
AM=M+1 // 12319
A=A-1 // 12320
M=D // 12321
@51 // 12322
D=A // 12323
@SP // 12324
AM=M+1 // 12325
A=A-1 // 12326
M=D // 12327
@30 // 12328
D=A // 12329
@SP // 12330
AM=M+1 // 12331
A=A-1 // 12332
M=D // 12333
@SP // 12334
AM=M+1 // 12335
A=A-1 // 12336
M=0 // 12337
@SP // 12338
AM=M+1 // 12339
A=A-1 // 12340
M=0 // 12341
// call Output.create
@17 // 12342
D=A // 12343
@14 // 12344
M=D // 12345
@Output.create // 12346
D=A // 12347
@13 // 12348
M=D // 12349
@Output.init.ret.85 // 12350
D=A // 12351
@CALL // 12352
0;JMP // 12353
(Output.init.ret.85)
@SP // 12354
M=M-1 // 12355

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12356
D=A // 12357
@SP // 12358
AM=M+1 // 12359
A=A-1 // 12360
M=D // 12361
@4 // 12362
D=A // 12363
@SP // 12364
AM=M+1 // 12365
A=A-1 // 12366
M=D // 12367
@6 // 12368
D=A // 12369
@SP // 12370
AM=M+1 // 12371
A=A-1 // 12372
M=D // 12373
@6 // 12374
D=A // 12375
@SP // 12376
AM=M+1 // 12377
A=A-1 // 12378
M=D // 12379
@15 // 12380
D=A // 12381
@SP // 12382
AM=M+1 // 12383
A=A-1 // 12384
M=D // 12385
@6 // 12386
D=A // 12387
@SP // 12388
AM=M+1 // 12389
A=A-1 // 12390
M=D // 12391
@6 // 12392
D=A // 12393
@SP // 12394
AM=M+1 // 12395
A=A-1 // 12396
M=D // 12397
@6 // 12398
D=A // 12399
@SP // 12400
AM=M+1 // 12401
A=A-1 // 12402
M=D // 12403
@54 // 12404
D=A // 12405
@SP // 12406
AM=M+1 // 12407
A=A-1 // 12408
M=D // 12409
@28 // 12410
D=A // 12411
@SP // 12412
AM=M+1 // 12413
A=A-1 // 12414
M=D // 12415
@SP // 12416
AM=M+1 // 12417
A=A-1 // 12418
M=0 // 12419
@SP // 12420
AM=M+1 // 12421
A=A-1 // 12422
M=0 // 12423
// call Output.create
@17 // 12424
D=A // 12425
@14 // 12426
M=D // 12427
@Output.create // 12428
D=A // 12429
@13 // 12430
M=D // 12431
@Output.init.ret.86 // 12432
D=A // 12433
@CALL // 12434
0;JMP // 12435
(Output.init.ret.86)
@SP // 12436
M=M-1 // 12437

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12438
D=A // 12439
@SP // 12440
M=D+M // 12441
@117 // 12442
D=A // 12443
@SP // 12444
A=M-1 // 12445
M=0 // 12446
A=A-1 // 12447
M=0 // 12448
A=A-1 // 12449
M=0 // 12450
A=A-1 // 12451
M=D // 12452
A=A-1 // 12453
@27 // 12454
D=A // 12455
@SP // 12456
AM=M+1 // 12457
A=A-1 // 12458
M=D // 12459
@27 // 12460
D=A // 12461
@SP // 12462
AM=M+1 // 12463
A=A-1 // 12464
M=D // 12465
@27 // 12466
D=A // 12467
@SP // 12468
AM=M+1 // 12469
A=A-1 // 12470
M=D // 12471
@27 // 12472
D=A // 12473
@SP // 12474
AM=M+1 // 12475
A=A-1 // 12476
M=D // 12477
@27 // 12478
D=A // 12479
@SP // 12480
AM=M+1 // 12481
A=A-1 // 12482
M=D // 12483
@54 // 12484
D=A // 12485
@SP // 12486
AM=M+1 // 12487
A=A-1 // 12488
M=D // 12489
@SP // 12490
AM=M+1 // 12491
A=A-1 // 12492
M=0 // 12493
@SP // 12494
AM=M+1 // 12495
A=A-1 // 12496
M=0 // 12497
// call Output.create
@17 // 12498
D=A // 12499
@14 // 12500
M=D // 12501
@Output.create // 12502
D=A // 12503
@13 // 12504
M=D // 12505
@Output.init.ret.87 // 12506
D=A // 12507
@CALL // 12508
0;JMP // 12509
(Output.init.ret.87)
@SP // 12510
M=M-1 // 12511

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12512
D=A // 12513
@SP // 12514
M=D+M // 12515
@118 // 12516
D=A // 12517
@SP // 12518
A=M-1 // 12519
M=0 // 12520
A=A-1 // 12521
M=0 // 12522
A=A-1 // 12523
M=0 // 12524
A=A-1 // 12525
M=D // 12526
A=A-1 // 12527
@51 // 12528
D=A // 12529
@SP // 12530
AM=M+1 // 12531
A=A-1 // 12532
M=D // 12533
@51 // 12534
D=A // 12535
@SP // 12536
AM=M+1 // 12537
A=A-1 // 12538
M=D // 12539
@51 // 12540
D=A // 12541
@SP // 12542
AM=M+1 // 12543
A=A-1 // 12544
M=D // 12545
@51 // 12546
D=A // 12547
@SP // 12548
AM=M+1 // 12549
A=A-1 // 12550
M=D // 12551
@30 // 12552
D=A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557
@12 // 12558
D=A // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563
@SP // 12564
AM=M+1 // 12565
A=A-1 // 12566
M=0 // 12567
@SP // 12568
AM=M+1 // 12569
A=A-1 // 12570
M=0 // 12571
// call Output.create
@17 // 12572
D=A // 12573
@14 // 12574
M=D // 12575
@Output.create // 12576
D=A // 12577
@13 // 12578
M=D // 12579
@Output.init.ret.88 // 12580
D=A // 12581
@CALL // 12582
0;JMP // 12583
(Output.init.ret.88)
@SP // 12584
M=M-1 // 12585

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12586
D=A // 12587
@SP // 12588
M=D+M // 12589
@119 // 12590
D=A // 12591
@SP // 12592
A=M-1 // 12593
M=0 // 12594
A=A-1 // 12595
M=0 // 12596
A=A-1 // 12597
M=0 // 12598
A=A-1 // 12599
M=D // 12600
A=A-1 // 12601
@51 // 12602
D=A // 12603
@SP // 12604
AM=M+1 // 12605
A=A-1 // 12606
M=D // 12607
@51 // 12608
D=A // 12609
@SP // 12610
AM=M+1 // 12611
A=A-1 // 12612
M=D // 12613
@51 // 12614
D=A // 12615
@SP // 12616
AM=M+1 // 12617
A=A-1 // 12618
M=D // 12619
@63 // 12620
D=A // 12621
@SP // 12622
AM=M+1 // 12623
A=A-1 // 12624
M=D // 12625
@63 // 12626
D=A // 12627
@SP // 12628
AM=M+1 // 12629
A=A-1 // 12630
M=D // 12631
@18 // 12632
D=A // 12633
@SP // 12634
AM=M+1 // 12635
A=A-1 // 12636
M=D // 12637
@SP // 12638
AM=M+1 // 12639
A=A-1 // 12640
M=0 // 12641
@SP // 12642
AM=M+1 // 12643
A=A-1 // 12644
M=0 // 12645
// call Output.create
@17 // 12646
D=A // 12647
@14 // 12648
M=D // 12649
@Output.create // 12650
D=A // 12651
@13 // 12652
M=D // 12653
@Output.init.ret.89 // 12654
D=A // 12655
@CALL // 12656
0;JMP // 12657
(Output.init.ret.89)
@SP // 12658
M=M-1 // 12659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12660
D=A // 12661
@SP // 12662
M=D+M // 12663
@120 // 12664
D=A // 12665
@SP // 12666
A=M-1 // 12667
M=0 // 12668
A=A-1 // 12669
M=0 // 12670
A=A-1 // 12671
M=0 // 12672
A=A-1 // 12673
M=D // 12674
A=A-1 // 12675
@51 // 12676
D=A // 12677
@SP // 12678
AM=M+1 // 12679
A=A-1 // 12680
M=D // 12681
@30 // 12682
D=A // 12683
@SP // 12684
AM=M+1 // 12685
A=A-1 // 12686
M=D // 12687
@12 // 12688
D=A // 12689
@SP // 12690
AM=M+1 // 12691
A=A-1 // 12692
M=D // 12693
@12 // 12694
D=A // 12695
@SP // 12696
AM=M+1 // 12697
A=A-1 // 12698
M=D // 12699
@30 // 12700
D=A // 12701
@SP // 12702
AM=M+1 // 12703
A=A-1 // 12704
M=D // 12705
@51 // 12706
D=A // 12707
@SP // 12708
AM=M+1 // 12709
A=A-1 // 12710
M=D // 12711
@SP // 12712
AM=M+1 // 12713
A=A-1 // 12714
M=0 // 12715
@SP // 12716
AM=M+1 // 12717
A=A-1 // 12718
M=0 // 12719
// call Output.create
@17 // 12720
D=A // 12721
@14 // 12722
M=D // 12723
@Output.create // 12724
D=A // 12725
@13 // 12726
M=D // 12727
@Output.init.ret.90 // 12728
D=A // 12729
@CALL // 12730
0;JMP // 12731
(Output.init.ret.90)
@SP // 12732
M=M-1 // 12733

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12734
D=A // 12735
@SP // 12736
M=D+M // 12737
@121 // 12738
D=A // 12739
@SP // 12740
A=M-1 // 12741
M=0 // 12742
A=A-1 // 12743
M=0 // 12744
A=A-1 // 12745
M=0 // 12746
A=A-1 // 12747
M=D // 12748
A=A-1 // 12749
@51 // 12750
D=A // 12751
@SP // 12752
AM=M+1 // 12753
A=A-1 // 12754
M=D // 12755
@51 // 12756
D=A // 12757
@SP // 12758
AM=M+1 // 12759
A=A-1 // 12760
M=D // 12761
@51 // 12762
D=A // 12763
@SP // 12764
AM=M+1 // 12765
A=A-1 // 12766
M=D // 12767
@62 // 12768
D=A // 12769
@SP // 12770
AM=M+1 // 12771
A=A-1 // 12772
M=D // 12773
@48 // 12774
D=A // 12775
@SP // 12776
AM=M+1 // 12777
A=A-1 // 12778
M=D // 12779
@24 // 12780
D=A // 12781
@SP // 12782
AM=M+1 // 12783
A=A-1 // 12784
M=D // 12785
@15 // 12786
D=A // 12787
@SP // 12788
AM=M+1 // 12789
A=A-1 // 12790
M=D // 12791
@SP // 12792
AM=M+1 // 12793
A=A-1 // 12794
M=0 // 12795
// call Output.create
@17 // 12796
D=A // 12797
@14 // 12798
M=D // 12799
@Output.create // 12800
D=A // 12801
@13 // 12802
M=D // 12803
@Output.init.ret.91 // 12804
D=A // 12805
@CALL // 12806
0;JMP // 12807
(Output.init.ret.91)
@SP // 12808
M=M-1 // 12809

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12810
D=A // 12811
@SP // 12812
M=D+M // 12813
@122 // 12814
D=A // 12815
@SP // 12816
A=M-1 // 12817
M=0 // 12818
A=A-1 // 12819
M=0 // 12820
A=A-1 // 12821
M=0 // 12822
A=A-1 // 12823
M=D // 12824
A=A-1 // 12825
@63 // 12826
D=A // 12827
@SP // 12828
AM=M+1 // 12829
A=A-1 // 12830
M=D // 12831
@27 // 12832
D=A // 12833
@SP // 12834
AM=M+1 // 12835
A=A-1 // 12836
M=D // 12837
@12 // 12838
D=A // 12839
@SP // 12840
AM=M+1 // 12841
A=A-1 // 12842
M=D // 12843
@6 // 12844
D=A // 12845
@SP // 12846
AM=M+1 // 12847
A=A-1 // 12848
M=D // 12849
@51 // 12850
D=A // 12851
@SP // 12852
AM=M+1 // 12853
A=A-1 // 12854
M=D // 12855
@63 // 12856
D=A // 12857
@SP // 12858
AM=M+1 // 12859
A=A-1 // 12860
M=D // 12861
@SP // 12862
AM=M+1 // 12863
A=A-1 // 12864
M=0 // 12865
@SP // 12866
AM=M+1 // 12867
A=A-1 // 12868
M=0 // 12869
// call Output.create
@17 // 12870
D=A // 12871
@14 // 12872
M=D // 12873
@Output.create // 12874
D=A // 12875
@13 // 12876
M=D // 12877
@Output.init.ret.92 // 12878
D=A // 12879
@CALL // 12880
0;JMP // 12881
(Output.init.ret.92)
@SP // 12882
M=M-1 // 12883

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12884
D=A // 12885
@SP // 12886
AM=M+1 // 12887
A=A-1 // 12888
M=D // 12889
@56 // 12890
D=A // 12891
@SP // 12892
AM=M+1 // 12893
A=A-1 // 12894
M=D // 12895
@12 // 12896
D=A // 12897
@SP // 12898
AM=M+1 // 12899
A=A-1 // 12900
M=D // 12901
@12 // 12902
D=A // 12903
@SP // 12904
AM=M+1 // 12905
A=A-1 // 12906
M=D // 12907
@12 // 12908
D=A // 12909
@SP // 12910
AM=M+1 // 12911
A=A-1 // 12912
M=D // 12913
@7 // 12914
D=A // 12915
@SP // 12916
AM=M+1 // 12917
A=A-1 // 12918
M=D // 12919
@12 // 12920
D=A // 12921
@SP // 12922
AM=M+1 // 12923
A=A-1 // 12924
M=D // 12925
@12 // 12926
D=A // 12927
@SP // 12928
AM=M+1 // 12929
A=A-1 // 12930
M=D // 12931
@12 // 12932
D=A // 12933
@SP // 12934
AM=M+1 // 12935
A=A-1 // 12936
M=D // 12937
@56 // 12938
D=A // 12939
@SP // 12940
AM=M+1 // 12941
A=A-1 // 12942
M=D // 12943
@SP // 12944
AM=M+1 // 12945
A=A-1 // 12946
M=0 // 12947
@SP // 12948
AM=M+1 // 12949
A=A-1 // 12950
M=0 // 12951
// call Output.create
@17 // 12952
D=A // 12953
@14 // 12954
M=D // 12955
@Output.create // 12956
D=A // 12957
@13 // 12958
M=D // 12959
@Output.init.ret.93 // 12960
D=A // 12961
@CALL // 12962
0;JMP // 12963
(Output.init.ret.93)
@SP // 12964
M=M-1 // 12965

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12966
D=A // 12967
@SP // 12968
AM=M+1 // 12969
A=A-1 // 12970
M=D // 12971
@12 // 12972
D=A // 12973
@SP // 12974
AM=M+1 // 12975
A=A-1 // 12976
M=D // 12977
@12 // 12978
D=A // 12979
@SP // 12980
AM=M+1 // 12981
A=A-1 // 12982
M=D // 12983
@12 // 12984
D=A // 12985
@SP // 12986
AM=M+1 // 12987
A=A-1 // 12988
M=D // 12989
@12 // 12990
D=A // 12991
@SP // 12992
AM=M+1 // 12993
A=A-1 // 12994
M=D // 12995
@12 // 12996
D=A // 12997
@SP // 12998
AM=M+1 // 12999
A=A-1 // 13000
M=D // 13001
@12 // 13002
D=A // 13003
@SP // 13004
AM=M+1 // 13005
A=A-1 // 13006
M=D // 13007
@12 // 13008
D=A // 13009
@SP // 13010
AM=M+1 // 13011
A=A-1 // 13012
M=D // 13013
@12 // 13014
D=A // 13015
@SP // 13016
AM=M+1 // 13017
A=A-1 // 13018
M=D // 13019
@12 // 13020
D=A // 13021
@SP // 13022
AM=M+1 // 13023
A=A-1 // 13024
M=D // 13025
@SP // 13026
AM=M+1 // 13027
A=A-1 // 13028
M=0 // 13029
@SP // 13030
AM=M+1 // 13031
A=A-1 // 13032
M=0 // 13033
// call Output.create
@17 // 13034
D=A // 13035
@14 // 13036
M=D // 13037
@Output.create // 13038
D=A // 13039
@13 // 13040
M=D // 13041
@Output.init.ret.94 // 13042
D=A // 13043
@CALL // 13044
0;JMP // 13045
(Output.init.ret.94)
@SP // 13046
M=M-1 // 13047

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 13048
D=A // 13049
@SP // 13050
AM=M+1 // 13051
A=A-1 // 13052
M=D // 13053
@7 // 13054
D=A // 13055
@SP // 13056
AM=M+1 // 13057
A=A-1 // 13058
M=D // 13059
@12 // 13060
D=A // 13061
@SP // 13062
AM=M+1 // 13063
A=A-1 // 13064
M=D // 13065
@12 // 13066
D=A // 13067
@SP // 13068
AM=M+1 // 13069
A=A-1 // 13070
M=D // 13071
@12 // 13072
D=A // 13073
@SP // 13074
AM=M+1 // 13075
A=A-1 // 13076
M=D // 13077
@56 // 13078
D=A // 13079
@SP // 13080
AM=M+1 // 13081
A=A-1 // 13082
M=D // 13083
@12 // 13084
D=A // 13085
@SP // 13086
AM=M+1 // 13087
A=A-1 // 13088
M=D // 13089
@12 // 13090
D=A // 13091
@SP // 13092
AM=M+1 // 13093
A=A-1 // 13094
M=D // 13095
@12 // 13096
D=A // 13097
@SP // 13098
AM=M+1 // 13099
A=A-1 // 13100
M=D // 13101
@7 // 13102
D=A // 13103
@SP // 13104
AM=M+1 // 13105
A=A-1 // 13106
M=D // 13107
@SP // 13108
AM=M+1 // 13109
A=A-1 // 13110
M=0 // 13111
@SP // 13112
AM=M+1 // 13113
A=A-1 // 13114
M=0 // 13115
// call Output.create
@17 // 13116
D=A // 13117
@14 // 13118
M=D // 13119
@Output.create // 13120
D=A // 13121
@13 // 13122
M=D // 13123
@Output.init.ret.95 // 13124
D=A // 13125
@CALL // 13126
0;JMP // 13127
(Output.init.ret.95)
@SP // 13128
M=M-1 // 13129

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13130
D=A // 13131
@SP // 13132
AM=M+1 // 13133
A=A-1 // 13134
M=D // 13135
@38 // 13136
D=A // 13137
@SP // 13138
AM=M+1 // 13139
A=A-1 // 13140
M=D // 13141
@45 // 13142
D=A // 13143
@SP // 13144
AM=M+1 // 13145
A=A-1 // 13146
M=D // 13147
@25 // 13148
D=A // 13149
@SP // 13150
AM=M+1 // 13151
A=A-1 // 13152
M=D // 13153
@SP // 13154
AM=M+1 // 13155
A=A-1 // 13156
M=0 // 13157
@SP // 13158
AM=M+1 // 13159
A=A-1 // 13160
M=0 // 13161
@SP // 13162
AM=M+1 // 13163
A=A-1 // 13164
M=0 // 13165
@SP // 13166
AM=M+1 // 13167
A=A-1 // 13168
M=0 // 13169
@SP // 13170
AM=M+1 // 13171
A=A-1 // 13172
M=0 // 13173
@SP // 13174
AM=M+1 // 13175
A=A-1 // 13176
M=0 // 13177
@SP // 13178
AM=M+1 // 13179
A=A-1 // 13180
M=0 // 13181
@SP // 13182
AM=M+1 // 13183
A=A-1 // 13184
M=0 // 13185
// call Output.create
@17 // 13186
D=A // 13187
@14 // 13188
M=D // 13189
@Output.create // 13190
D=A // 13191
@13 // 13192
M=D // 13193
@Output.init.ret.96 // 13194
D=A // 13195
@CALL // 13196
0;JMP // 13197
(Output.init.ret.96)
@SP // 13198
M=M-1 // 13199

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13200
M=0 // 13201

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13202
M=0 // 13203

////PushInstruction("constant 0")
@SP // 13204
AM=M+1 // 13205
A=A-1 // 13206
M=0 // 13207
@RETURN // 13208
0;JMP // 13209

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13210
M=M+1 // 13211
AM=M+1 // 13212
A=A-1 // 13213
M=0 // 13214
A=A-1 // 13215
M=0 // 13216

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13217
A=M+1 // 13218
D=M // 13219
@2 // 13220
D=D+A // 13221
@SP // 13222
AM=M+1 // 13223
A=A-1 // 13224
M=D // 13225
D=0 // 13226
@SP // 13227
AM=M-1 // 13228
A=M // 13229
M=D // 13230

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13231
A=M+1 // 13232
D=M // 13233
@3 // 13234
D=D+A // 13235
@SP // 13236
AM=M+1 // 13237
A=A-1 // 13238
M=D // 13239
D=0 // 13240
@SP // 13241
AM=M-1 // 13242
A=M // 13243
M=D // 13244

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
@Memory.add_node.EQ.55 // 13245
D=A // 13246
@SP // 13247
AM=M+1 // 13248
A=A-1 // 13249
M=D // 13250
@ARG // 13251
A=M // 13252
D=M // 13253
@0 // 13254
A=D+A // 13255
D=M // 13256
@DO_EQ // 13257
0;JMP // 13258
(Memory.add_node.EQ.55)
@Memory.add_node$IF_TRUE1 // 13259
D;JNE // 13260

////GotoInstruction{label='Memory.add_node$IF_FALSE1}
// goto Memory.add_node$IF_FALSE1
@Memory.add_node$IF_FALSE1 // 13261
0;JMP // 13262

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
@ARG // 13263
A=M // 13264
D=M // 13265
@SP // 13266
AM=M+1 // 13267
A=A-1 // 13268
M=D // 13269
@ARG // 13270
A=M+1 // 13271
D=M // 13272
@SP // 13273
AM=M-1 // 13274
A=M // 13275
M=D // 13276

////PushInstruction("constant 0")
@SP // 13277
AM=M+1 // 13278
A=A-1 // 13279
M=0 // 13280
@RETURN // 13281
0;JMP // 13282

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

@ARG // 13283
A=M // 13284
D=M // 13285
@0 // 13286
A=D+A // 13287
D=M // 13288
@LCL // 13289
A=M // 13290
M=D // 13291

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13292
A=M+1 // 13293
M=0 // 13294

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
@Memory.add_node.EQ.56 // 13295
D=A // 13296
@SP // 13297
AM=M+1 // 13298
A=A-1 // 13299
M=D // 13300
@LCL // 13301
A=M // 13302
D=M // 13303
@DO_EQ // 13304
0;JMP // 13305
(Memory.add_node.EQ.56)
@SP // 13306
AM=M+1 // 13307
A=A-1 // 13308
M=D // 13309
@SP // 13310
A=M-1 // 13311
M=!D // 13312
@Memory.add_node.GT.57 // 13313
D=A // 13314
@SP // 13315
AM=M+1 // 13316
A=A-1 // 13317
M=D // 13318
@LCL // 13319
A=M // 13320
D=M // 13321
@0 // 13322
A=D+A // 13323
D=M // 13324
@SP // 13325
AM=M+1 // 13326
A=A-1 // 13327
M=D // 13328
@ARG // 13329
A=M+1 // 13330
D=M // 13331
@0 // 13332
A=D+A // 13333
D=M // 13334
@SP // 13335
AM=M-1 // 13336
D=M-D // 13337
@DO_GT // 13338
0;JMP // 13339
(Memory.add_node.GT.57)
D=!D // 13340
@SP // 13341
AM=M-1 // 13342
D=D&M // 13343
D=!D // 13344
@Memory.add_node_WHILE_END1 // 13345
D;JNE // 13346

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13347
A=M // 13348
D=M // 13349
@LCL // 13350
A=M+1 // 13351
M=D // 13352

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

@LCL // 13353
A=M // 13354
D=M // 13355
@3 // 13356
A=D+A // 13357
D=M // 13358
@LCL // 13359
A=M // 13360
M=D // 13361

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13362
0;JMP // 13363

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13364
A=M+1 // 13365
D=!M // 13366
@Memory.add_node$IF_TRUE2 // 13367
D;JNE // 13368

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13369
0;JMP // 13370

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
@ARG // 13371
A=M+1 // 13372
D=M // 13373
@3 // 13374
D=D+A // 13375
@SP // 13376
AM=M+1 // 13377
A=A-1 // 13378
M=D // 13379
@ARG // 13380
A=M // 13381
D=M // 13382
@0 // 13383
A=D+A // 13384
D=M // 13385
@SP // 13386
AM=M-1 // 13387
A=M // 13388
M=D // 13389

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
@ARG // 13390
A=M // 13391
D=M // 13392
@0 // 13393
D=D+A // 13394
@2 // 13395
D=D+A // 13396
@SP // 13397
AM=M+1 // 13398
A=A-1 // 13399
M=D // 13400
@ARG // 13401
A=M+1 // 13402
D=M // 13403
@SP // 13404
AM=M-1 // 13405
A=M // 13406
M=D // 13407

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13408
A=M // 13409
D=M // 13410
@SP // 13411
AM=M+1 // 13412
A=A-1 // 13413
M=D // 13414
@ARG // 13415
A=M+1 // 13416
D=M // 13417
@SP // 13418
AM=M-1 // 13419
A=M // 13420
M=D // 13421

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13422
0;JMP // 13423

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
@ARG // 13424
A=M+1 // 13425
D=M // 13426
@3 // 13427
D=D+A // 13428
@SP // 13429
AM=M+1 // 13430
A=A-1 // 13431
M=D // 13432
@LCL // 13433
A=M // 13434
D=M // 13435
@SP // 13436
AM=M-1 // 13437
A=M // 13438
M=D // 13439

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13440
A=M+1 // 13441
D=M // 13442
@2 // 13443
D=D+A // 13444
@SP // 13445
AM=M+1 // 13446
A=A-1 // 13447
M=D // 13448
@LCL // 13449
A=M+1 // 13450
D=M // 13451
@SP // 13452
AM=M-1 // 13453
A=M // 13454
M=D // 13455

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13456
A=M // 13457
D=M // 13458
@Memory.add_node$IF_TRUE3 // 13459
D;JNE // 13460

////GotoInstruction{label='Memory.add_node$IF_FALSE3}
// goto Memory.add_node$IF_FALSE3
@Memory.add_node$IF_FALSE3 // 13461
0;JMP // 13462

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
@LCL // 13463
A=M // 13464
D=M // 13465
@2 // 13466
D=D+A // 13467
@SP // 13468
AM=M+1 // 13469
A=A-1 // 13470
M=D // 13471
@ARG // 13472
A=M+1 // 13473
D=M // 13474
@SP // 13475
AM=M-1 // 13476
A=M // 13477
M=D // 13478

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
@LCL // 13479
A=M+1 // 13480
D=M // 13481
@3 // 13482
D=D+A // 13483
@SP // 13484
AM=M+1 // 13485
A=A-1 // 13486
M=D // 13487
@ARG // 13488
A=M+1 // 13489
D=M // 13490
@SP // 13491
AM=M-1 // 13492
A=M // 13493
M=D // 13494

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13495
AM=M+1 // 13496
A=A-1 // 13497
M=0 // 13498
@RETURN // 13499
0;JMP // 13500

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13501
D=A // 13502
@SP // 13503
AM=D+M // 13504
A=A-1 // 13505
M=0 // 13506
A=A-1 // 13507
M=0 // 13508
A=A-1 // 13509
M=0 // 13510
A=A-1 // 13511
M=0 // 13512
A=A-1 // 13513
M=0 // 13514

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13515
A=M // 13516
M=0 // 13517

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13518
A=M+1 // 13519
A=A+1 // 13520
D=M // 13521
@LCL // 13522
A=M+1 // 13523
M=D // 13524

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

@ARG // 13525
A=M+1 // 13526
A=A+1 // 13527
D=M // 13528
D=D-1 // 13529
D=-D // 13530
@LCL // 13531
A=M+1 // 13532
A=A+1 // 13533
M=D // 13534

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
@Screen.drawCircle.GT.58 // 13535
D=A // 13536
@SP // 13537
AM=M+1 // 13538
A=A-1 // 13539
M=D // 13540
@LCL // 13541
A=M+1 // 13542
D=M // 13543
A=A-1 // 13544
D=M-D // 13545
@DO_GT // 13546
0;JMP // 13547
(Screen.drawCircle.GT.58)
@Screen.drawCircle_WHILE_END1 // 13548
D;JNE // 13549

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

@ARG // 13550
A=M // 13551
D=M // 13552
@SP // 13553
AM=M+1 // 13554
A=A-1 // 13555
M=D // 13556
@LCL // 13557
A=M // 13558
D=M // 13559
@SP // 13560
AM=M-1 // 13561
D=M-D // 13562
@SP // 13563
AM=M+1 // 13564
A=A-1 // 13565
M=D // 13566
@ARG // 13567
A=M // 13568
D=M // 13569
@SP // 13570
AM=M+1 // 13571
A=A-1 // 13572
M=D // 13573
@LCL // 13574
A=M // 13575
D=M // 13576
@SP // 13577
AM=M-1 // 13578
D=D+M // 13579
@SP // 13580
AM=M+1 // 13581
A=A-1 // 13582
M=D // 13583
@ARG // 13584
A=M+1 // 13585
D=M // 13586
@SP // 13587
AM=M+1 // 13588
A=A-1 // 13589
M=D // 13590
@LCL // 13591
A=M+1 // 13592
D=M // 13593
@SP // 13594
AM=M-1 // 13595
D=D+M // 13596
@SP // 13597
AM=M+1 // 13598
A=A-1 // 13599
M=D // 13600
// call Screen.drawHorizontalLine
@8 // 13601
D=A // 13602
@14 // 13603
M=D // 13604
@Screen.drawHorizontalLine // 13605
D=A // 13606
@13 // 13607
M=D // 13608
@Screen.drawCircle.ret.0 // 13609
D=A // 13610
@CALL // 13611
0;JMP // 13612
(Screen.drawCircle.ret.0)
@SP // 13613
M=M-1 // 13614

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

@ARG // 13615
A=M // 13616
D=M // 13617
@SP // 13618
AM=M+1 // 13619
A=A-1 // 13620
M=D // 13621
@LCL // 13622
A=M // 13623
D=M // 13624
@SP // 13625
AM=M-1 // 13626
D=M-D // 13627
@SP // 13628
AM=M+1 // 13629
A=A-1 // 13630
M=D // 13631
@ARG // 13632
A=M // 13633
D=M // 13634
@SP // 13635
AM=M+1 // 13636
A=A-1 // 13637
M=D // 13638
@LCL // 13639
A=M // 13640
D=M // 13641
@SP // 13642
AM=M-1 // 13643
D=D+M // 13644
@SP // 13645
AM=M+1 // 13646
A=A-1 // 13647
M=D // 13648
@ARG // 13649
A=M+1 // 13650
D=M // 13651
@SP // 13652
AM=M+1 // 13653
A=A-1 // 13654
M=D // 13655
@LCL // 13656
A=M+1 // 13657
D=M // 13658
@SP // 13659
AM=M-1 // 13660
D=M-D // 13661
@SP // 13662
AM=M+1 // 13663
A=A-1 // 13664
M=D // 13665
// call Screen.drawHorizontalLine
@8 // 13666
D=A // 13667
@14 // 13668
M=D // 13669
@Screen.drawHorizontalLine // 13670
D=A // 13671
@13 // 13672
M=D // 13673
@Screen.drawCircle.ret.1 // 13674
D=A // 13675
@CALL // 13676
0;JMP // 13677
(Screen.drawCircle.ret.1)
@SP // 13678
M=M-1 // 13679

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

@ARG // 13680
A=M // 13681
D=M // 13682
@SP // 13683
AM=M+1 // 13684
A=A-1 // 13685
M=D // 13686
@LCL // 13687
A=M+1 // 13688
D=M // 13689
@SP // 13690
AM=M-1 // 13691
D=M-D // 13692
@SP // 13693
AM=M+1 // 13694
A=A-1 // 13695
M=D // 13696
@ARG // 13697
A=M // 13698
D=M // 13699
@SP // 13700
AM=M+1 // 13701
A=A-1 // 13702
M=D // 13703
@LCL // 13704
A=M+1 // 13705
D=M // 13706
@SP // 13707
AM=M-1 // 13708
D=D+M // 13709
@SP // 13710
AM=M+1 // 13711
A=A-1 // 13712
M=D // 13713
@ARG // 13714
A=M+1 // 13715
D=M // 13716
@SP // 13717
AM=M+1 // 13718
A=A-1 // 13719
M=D // 13720
@LCL // 13721
A=M // 13722
D=M // 13723
@SP // 13724
AM=M-1 // 13725
D=D+M // 13726
@SP // 13727
AM=M+1 // 13728
A=A-1 // 13729
M=D // 13730
// call Screen.drawHorizontalLine
@8 // 13731
D=A // 13732
@14 // 13733
M=D // 13734
@Screen.drawHorizontalLine // 13735
D=A // 13736
@13 // 13737
M=D // 13738
@Screen.drawCircle.ret.2 // 13739
D=A // 13740
@CALL // 13741
0;JMP // 13742
(Screen.drawCircle.ret.2)
@SP // 13743
M=M-1 // 13744

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

@ARG // 13745
A=M // 13746
D=M // 13747
@SP // 13748
AM=M+1 // 13749
A=A-1 // 13750
M=D // 13751
@LCL // 13752
A=M+1 // 13753
D=M // 13754
@SP // 13755
AM=M-1 // 13756
D=M-D // 13757
@SP // 13758
AM=M+1 // 13759
A=A-1 // 13760
M=D // 13761
@ARG // 13762
A=M // 13763
D=M // 13764
@SP // 13765
AM=M+1 // 13766
A=A-1 // 13767
M=D // 13768
@LCL // 13769
A=M+1 // 13770
D=M // 13771
@SP // 13772
AM=M-1 // 13773
D=D+M // 13774
@SP // 13775
AM=M+1 // 13776
A=A-1 // 13777
M=D // 13778
@ARG // 13779
A=M+1 // 13780
D=M // 13781
@SP // 13782
AM=M+1 // 13783
A=A-1 // 13784
M=D // 13785
@LCL // 13786
A=M // 13787
D=M // 13788
@SP // 13789
AM=M-1 // 13790
D=M-D // 13791
@SP // 13792
AM=M+1 // 13793
A=A-1 // 13794
M=D // 13795
// call Screen.drawHorizontalLine
@8 // 13796
D=A // 13797
@14 // 13798
M=D // 13799
@Screen.drawHorizontalLine // 13800
D=A // 13801
@13 // 13802
M=D // 13803
@Screen.drawCircle.ret.3 // 13804
D=A // 13805
@CALL // 13806
0;JMP // 13807
(Screen.drawCircle.ret.3)
@SP // 13808
M=M-1 // 13809

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.59 // 13810
D=A // 13811
@SP // 13812
AM=M+1 // 13813
A=A-1 // 13814
M=D // 13815
@LCL // 13816
A=M+1 // 13817
A=A+1 // 13818
D=M // 13819
@DO_LT // 13820
0;JMP // 13821
(Screen.drawCircle.LT.59)
@Screen.drawCircle$IF_TRUE1 // 13822
D;JNE // 13823

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13824
0;JMP // 13825

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

@LCL // 13826
A=M+1 // 13827
A=A+1 // 13828
D=M // 13829
@SP // 13830
AM=M+1 // 13831
A=A-1 // 13832
M=D // 13833
@LCL // 13834
A=M // 13835
D=M // 13836
D=D+M // 13837
@SP // 13838
AM=M-1 // 13839
D=D+M // 13840
@3 // 13841
D=D+A // 13842
@LCL // 13843
A=M+1 // 13844
A=A+1 // 13845
M=D // 13846

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13847
0;JMP // 13848

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

@LCL // 13849
A=M+1 // 13850
A=A+1 // 13851
D=M // 13852
@SP // 13853
AM=M+1 // 13854
A=A-1 // 13855
M=D // 13856
@LCL // 13857
A=M+1 // 13858
D=M // 13859
A=A-1 // 13860
D=M-D // 13861
@R13 // 13862
M=D // 13863
D=D+M // 13864
@SP // 13865
AM=M-1 // 13866
D=D+M // 13867
@5 // 13868
D=D+A // 13869
@LCL // 13870
A=M+1 // 13871
A=A+1 // 13872
M=D // 13873

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

@LCL // 13874
A=M+1 // 13875
M=M-1 // 13876

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

@LCL // 13877
A=M // 13878
M=M+1 // 13879

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13880
0;JMP // 13881

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13882
AM=M+1 // 13883
A=A-1 // 13884
M=0 // 13885
@RETURN // 13886
0;JMP // 13887

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13888
D=A // 13889
@14 // 13890
M=D // 13891
@Memory.init // 13892
D=A // 13893
@13 // 13894
M=D // 13895
@Sys.init.ret.0 // 13896
D=A // 13897
@CALL // 13898
0;JMP // 13899
(Sys.init.ret.0)
@SP // 13900
M=M-1 // 13901

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13902
D=A // 13903
@14 // 13904
M=D // 13905
@Math.init // 13906
D=A // 13907
@13 // 13908
M=D // 13909
@Sys.init.ret.1 // 13910
D=A // 13911
@CALL // 13912
0;JMP // 13913
(Sys.init.ret.1)
@SP // 13914
M=M-1 // 13915

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13916
D=A // 13917
@14 // 13918
M=D // 13919
@Screen.init // 13920
D=A // 13921
@13 // 13922
M=D // 13923
@Sys.init.ret.2 // 13924
D=A // 13925
@CALL // 13926
0;JMP // 13927
(Sys.init.ret.2)
@SP // 13928
M=M-1 // 13929

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13930
D=A // 13931
@14 // 13932
M=D // 13933
@Output.init // 13934
D=A // 13935
@13 // 13936
M=D // 13937
@Sys.init.ret.3 // 13938
D=A // 13939
@CALL // 13940
0;JMP // 13941
(Sys.init.ret.3)
@SP // 13942
M=M-1 // 13943

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13944
D=A // 13945
@14 // 13946
M=D // 13947
@Keyboard.init // 13948
D=A // 13949
@13 // 13950
M=D // 13951
@Sys.init.ret.4 // 13952
D=A // 13953
@CALL // 13954
0;JMP // 13955
(Sys.init.ret.4)
@SP // 13956
M=M-1 // 13957

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13958
D=A // 13959
@14 // 13960
M=D // 13961
@Main.main // 13962
D=A // 13963
@13 // 13964
M=D // 13965
@Sys.init.ret.5 // 13966
D=A // 13967
@CALL // 13968
0;JMP // 13969
(Sys.init.ret.5)
@SP // 13970
M=M-1 // 13971

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13972
D=A // 13973
@14 // 13974
M=D // 13975
@Sys.halt // 13976
D=A // 13977
@13 // 13978
M=D // 13979
@Sys.init.ret.6 // 13980
D=A // 13981
@CALL // 13982
0;JMP // 13983
(Sys.init.ret.6)
@SP // 13984
M=M-1 // 13985

////PushInstruction("constant 0")
@SP // 13986
AM=M+1 // 13987
A=A-1 // 13988
M=0 // 13989
@RETURN // 13990
0;JMP // 13991

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13992
A=M // 13993
D=M // 13994
@Screen.0 // 13995
M=D // 13996

////PushInstruction("constant 0")
@SP // 13997
AM=M+1 // 13998
A=A-1 // 13999
M=0 // 14000
@RETURN // 14001
0;JMP // 14002

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 14003
M=M+1 // 14004
AM=M+1 // 14005
A=A-1 // 14006
M=0 // 14007
A=A-1 // 14008
M=0 // 14009

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 14010
A=M // 14011
M=1 // 14012

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 14013
A=M+1 // 14014
M=0 // 14015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Array.new}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 14016
D=A // 14017
@SP // 14018
AM=M+1 // 14019
A=A-1 // 14020
M=D // 14021
// call Array.new
@6 // 14022
D=A // 14023
@14 // 14024
M=D // 14025
@Array.new // 14026
D=A // 14027
@13 // 14028
M=D // 14029
@Math.init.ret.0 // 14030
D=A // 14031
@CALL // 14032
0;JMP // 14033
(Math.init.ret.0)
@SP // 14034
AM=M-1 // 14035
D=M // 14036
@Math.0 // 14037
M=D // 14038

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
@Math.init.LT.60 // 14039
D=A // 14040
@SP // 14041
AM=M+1 // 14042
A=A-1 // 14043
M=D // 14044
@LCL // 14045
A=M+1 // 14046
D=M // 14047
@16 // 14048
D=D-A // 14049
@DO_LT // 14050
0;JMP // 14051
(Math.init.LT.60)
D=!D // 14052
@Math.init_WHILE_END1 // 14053
D;JNE // 14054

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 14055
D=M // 14056
@SP // 14057
AM=M+1 // 14058
A=A-1 // 14059
M=D // 14060
@LCL // 14061
A=M+1 // 14062
D=M // 14063
@SP // 14064
AM=M-1 // 14065
D=D+M // 14066
@SP // 14067
AM=M+1 // 14068
A=A-1 // 14069
M=D // 14070
@LCL // 14071
A=M // 14072
D=M // 14073
@SP // 14074
AM=M-1 // 14075
A=M // 14076
M=D // 14077

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

@LCL // 14078
A=M // 14079
D=M // 14080
@LCL // 14081
A=M // 14082
M=D+M // 14083

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

@LCL // 14084
A=M+1 // 14085
M=M+1 // 14086

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 14087
0;JMP // 14088

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14089
AM=M+1 // 14090
A=A-1 // 14091
M=0 // 14092
@RETURN // 14093
0;JMP // 14094

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 14095
M=M+1 // 14096
AM=M+1 // 14097
A=A-1 // 14098
M=0 // 14099
A=A-1 // 14100
M=0 // 14101

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

@2055 // 14102
D=A // 14103
@LCL // 14104
A=M // 14105
M=D // 14106

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
@LCL // 14107
A=M // 14108
D=M // 14109
@SP // 14110
AM=M+1 // 14111
A=A-1 // 14112
M=D // 14113
@LCL // 14114
A=M // 14115
D=M // 14116
@16384 // 14117
D=A-D // 14118
@5 // 14119
D=D-A // 14120
@SP // 14121
AM=M-1 // 14122
A=M // 14123
M=D // 14124

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 14125
A=M // 14126
D=M // 14127
@SP // 14128
AM=M+1 // 14129
A=A-1 // 14130
M=D+1 // 14131
D=1 // 14132
@SP // 14133
AM=M-1 // 14134
A=M // 14135
M=D // 14136

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 14137
A=M // 14138
D=M // 14139
@2 // 14140
D=D+A // 14141
@SP // 14142
AM=M+1 // 14143
A=A-1 // 14144
M=D // 14145
D=0 // 14146
@SP // 14147
AM=M-1 // 14148
A=M // 14149
M=D // 14150

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 14151
A=M // 14152
D=M // 14153
@3 // 14154
D=D+A // 14155
@SP // 14156
AM=M+1 // 14157
A=A-1 // 14158
M=D // 14159
D=0 // 14160
@SP // 14161
AM=M-1 // 14162
A=M // 14163
M=D // 14164

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14165
A=M // 14166
D=M // 14167
@SP // 14168
AM=M+1 // 14169
A=A-1 // 14170
M=D // 14171
// call Memory.create_foot
@6 // 14172
D=A // 14173
@14 // 14174
M=D // 14175
@Memory.create_foot // 14176
D=A // 14177
@13 // 14178
M=D // 14179
@Memory.init.ret.0 // 14180
D=A // 14181
@CALL // 14182
0;JMP // 14183
(Memory.init.ret.0)
@SP // 14184
M=M-1 // 14185

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

@2054 // 14186
D=A // 14187
@SP // 14188
AM=M+1 // 14189
A=A-1 // 14190
M=D // 14191
@2054 // 14192
D=A // 14193
@SP // 14194
AM=M+1 // 14195
A=A-1 // 14196
M=D // 14197
@LCL // 14198
A=M // 14199
D=M // 14200
@SP // 14201
AM=M+1 // 14202
A=A-1 // 14203
M=D // 14204
// call Memory.add_node
@7 // 14205
D=A // 14206
@14 // 14207
M=D // 14208
@Memory.add_node // 14209
D=A // 14210
@13 // 14211
M=D // 14212
@Memory.init.ret.1 // 14213
D=A // 14214
@CALL // 14215
0;JMP // 14216
(Memory.init.ret.1)
@SP // 14217
M=M-1 // 14218

////PushInstruction("constant 0")
@SP // 14219
AM=M+1 // 14220
A=A-1 // 14221
M=0 // 14222
@RETURN // 14223
0;JMP // 14224

