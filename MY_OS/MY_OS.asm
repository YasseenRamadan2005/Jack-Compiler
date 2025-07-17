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
//)], call=CallInstruction{Memory.alloc}}
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
// call Memory.alloc
@6 // 373
D=A // 374
@14 // 375
M=D // 376
@Memory.alloc // 377
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
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 426
A=M // 427
D=M // 428
@SP // 429
AM=M+1 // 430
A=A-1 // 431
M=D // 432
// call Memory.deAlloc
@6 // 433
D=A // 434
@14 // 435
M=D // 436
@Memory.deAlloc // 437
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

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2171
A=M // 2172
D=M // 2173
@SP // 2174
AM=M+1 // 2175
A=A-1 // 2176
M=D // 2177
@ARG // 2178
A=M // 2179
D=M // 2180
@SP // 2181
AM=M+1 // 2182
A=A-1 // 2183
M=D // 2184
@SP // 2185
A=M-1 // 2186
M=-D // 2187
// call Math.max
@7 // 2188
D=A // 2189
@14 // 2190
M=D // 2191
@Math.max // 2192
D=A // 2193
@13 // 2194
M=D // 2195
@Math.abs.ret.0 // 2196
D=A // 2197
@CALL // 2198
0;JMP // 2199
(Math.abs.ret.0)
@RETURN // 2200
0;JMP // 2201

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
@Math.0 // 2202
D=M // 2203
@SP // 2204
AM=M+1 // 2205
A=A-1 // 2206
M=D // 2207
@ARG // 2208
A=M // 2209
D=M // 2210
@SP // 2211
AM=M-1 // 2212
A=D+M // 2213
D=M // 2214
@SP // 2215
AM=M+1 // 2216
A=A-1 // 2217
M=D // 2218
@RETURN // 2219
0;JMP // 2220

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2221
M=M+1 // 2222
AM=M+1 // 2223
A=A-1 // 2224
M=0 // 2225
A=A-1 // 2226
M=0 // 2227

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2228
A=M // 2229
M=0 // 2230

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2231
A=M // 2232
D=M // 2233
@SP // 2234
AM=M+1 // 2235
A=A-1 // 2236
M=D // 2237
// call String.length
@6 // 2238
D=A // 2239
@14 // 2240
M=D // 2241
@String.length // 2242
D=A // 2243
@13 // 2244
M=D // 2245
@Output.printString.ret.0 // 2246
D=A // 2247
@CALL // 2248
0;JMP // 2249
(Output.printString.ret.0)
@SP // 2250
AM=M-1 // 2251
D=M // 2252
@LCL // 2253
A=M+1 // 2254
M=D // 2255

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
@Output.printString.LT.15 // 2256
D=A // 2257
@SP // 2258
AM=M+1 // 2259
A=A-1 // 2260
M=D // 2261
@LCL // 2262
A=M+1 // 2263
D=M // 2264
A=A-1 // 2265
D=M-D // 2266
@DO_LT // 2267
0;JMP // 2268
(Output.printString.LT.15)
D=!D // 2269
@Output.printString_WHILE_END1 // 2270
D;JNE // 2271

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2272
A=M // 2273
D=M // 2274
@SP // 2275
AM=M+1 // 2276
A=A-1 // 2277
M=D // 2278
@LCL // 2279
A=M // 2280
D=M // 2281
@SP // 2282
AM=M+1 // 2283
A=A-1 // 2284
M=D // 2285
// call String.charAt
@7 // 2286
D=A // 2287
@14 // 2288
M=D // 2289
@String.charAt // 2290
D=A // 2291
@13 // 2292
M=D // 2293
@Output.printString.ret.1 // 2294
D=A // 2295
@CALL // 2296
0;JMP // 2297
(Output.printString.ret.1)
// call Output.printChar
@6 // 2298
D=A // 2299
@14 // 2300
M=D // 2301
@Output.printChar // 2302
D=A // 2303
@13 // 2304
M=D // 2305
@Output.printString.ret.2 // 2306
D=A // 2307
@CALL // 2308
0;JMP // 2309
(Output.printString.ret.2)
@SP // 2310
M=M-1 // 2311

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

@LCL // 2312
A=M // 2313
M=M+1 // 2314

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2315
0;JMP // 2316

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2317
AM=M+1 // 2318
A=A-1 // 2319
M=0 // 2320
@RETURN // 2321
0;JMP // 2322

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2323
AM=M+1 // 2324
A=A-1 // 2325
M=0 // 2326

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2327
D=A // 2328
@SP // 2329
AM=M+1 // 2330
A=A-1 // 2331
M=D // 2332
// call Memory.alloc
@6 // 2333
D=A // 2334
@14 // 2335
M=D // 2336
@Memory.alloc // 2337
D=A // 2338
@13 // 2339
M=D // 2340
@Output.create.ret.0 // 2341
D=A // 2342
@CALL // 2343
0;JMP // 2344
(Output.create.ret.0)
@SP // 2345
AM=M-1 // 2346
D=M // 2347
@LCL // 2348
A=M // 2349
M=D // 2350

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 2351
D=M // 2352
@SP // 2353
AM=M+1 // 2354
A=A-1 // 2355
M=D // 2356
@ARG // 2357
A=M // 2358
D=M // 2359
@SP // 2360
AM=M-1 // 2361
D=D+M // 2362
@SP // 2363
AM=M+1 // 2364
A=A-1 // 2365
M=D // 2366
@LCL // 2367
A=M // 2368
D=M // 2369
@SP // 2370
AM=M-1 // 2371
A=M // 2372
M=D // 2373

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2374
A=M // 2375
D=M // 2376
@SP // 2377
AM=M+1 // 2378
A=A-1 // 2379
M=D // 2380
@ARG // 2381
A=M+1 // 2382
D=M // 2383
@SP // 2384
AM=M-1 // 2385
A=M // 2386
M=D // 2387

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2388
A=M // 2389
D=M // 2390
@SP // 2391
AM=M+1 // 2392
A=A-1 // 2393
M=D+1 // 2394
@ARG // 2395
A=M+1 // 2396
A=A+1 // 2397
D=M // 2398
@SP // 2399
AM=M-1 // 2400
A=M // 2401
M=D // 2402

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2403
A=M // 2404
D=M // 2405
@2 // 2406
D=D+A // 2407
@SP // 2408
AM=M+1 // 2409
A=A-1 // 2410
M=D // 2411
@ARG // 2412
A=M+1 // 2413
A=A+1 // 2414
A=A+1 // 2415
D=M // 2416
@SP // 2417
AM=M-1 // 2418
A=M // 2419
M=D // 2420

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2421
A=M // 2422
D=M // 2423
@3 // 2424
D=D+A // 2425
@SP // 2426
AM=M+1 // 2427
A=A-1 // 2428
M=D // 2429
@ARG // 2430
D=M // 2431
@4 // 2432
A=D+A // 2433
D=M // 2434
@SP // 2435
AM=M-1 // 2436
A=M // 2437
M=D // 2438

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2439
A=M // 2440
D=M // 2441
@4 // 2442
D=D+A // 2443
@SP // 2444
AM=M+1 // 2445
A=A-1 // 2446
M=D // 2447
@ARG // 2448
D=M // 2449
@5 // 2450
A=D+A // 2451
D=M // 2452
@SP // 2453
AM=M-1 // 2454
A=M // 2455
M=D // 2456

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2457
A=M // 2458
D=M // 2459
@5 // 2460
D=D+A // 2461
@SP // 2462
AM=M+1 // 2463
A=A-1 // 2464
M=D // 2465
@ARG // 2466
D=M // 2467
@6 // 2468
A=D+A // 2469
D=M // 2470
@SP // 2471
AM=M-1 // 2472
A=M // 2473
M=D // 2474

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2475
A=M // 2476
D=M // 2477
@6 // 2478
D=D+A // 2479
@SP // 2480
AM=M+1 // 2481
A=A-1 // 2482
M=D // 2483
@ARG // 2484
D=M // 2485
@7 // 2486
A=D+A // 2487
D=M // 2488
@SP // 2489
AM=M-1 // 2490
A=M // 2491
M=D // 2492

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2493
A=M // 2494
D=M // 2495
@7 // 2496
D=D+A // 2497
@SP // 2498
AM=M+1 // 2499
A=A-1 // 2500
M=D // 2501
@ARG // 2502
D=M // 2503
@8 // 2504
A=D+A // 2505
D=M // 2506
@SP // 2507
AM=M-1 // 2508
A=M // 2509
M=D // 2510

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2511
A=M // 2512
D=M // 2513
@8 // 2514
D=D+A // 2515
@SP // 2516
AM=M+1 // 2517
A=A-1 // 2518
M=D // 2519
@ARG // 2520
D=M // 2521
@9 // 2522
A=D+A // 2523
D=M // 2524
@SP // 2525
AM=M-1 // 2526
A=M // 2527
M=D // 2528

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2529
A=M // 2530
D=M // 2531
@9 // 2532
D=D+A // 2533
@SP // 2534
AM=M+1 // 2535
A=A-1 // 2536
M=D // 2537
@ARG // 2538
D=M // 2539
@10 // 2540
A=D+A // 2541
D=M // 2542
@SP // 2543
AM=M-1 // 2544
A=M // 2545
M=D // 2546

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2547
A=M // 2548
D=M // 2549
@10 // 2550
D=D+A // 2551
@SP // 2552
AM=M+1 // 2553
A=A-1 // 2554
M=D // 2555
@ARG // 2556
D=M // 2557
@11 // 2558
A=D+A // 2559
D=M // 2560
@SP // 2561
AM=M-1 // 2562
A=M // 2563
M=D // 2564

////PushInstruction("constant 0")
@SP // 2565
AM=M+1 // 2566
A=A-1 // 2567
M=0 // 2568
@RETURN // 2569
0;JMP // 2570

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2571
A=M // 2572
D=M // 2573
@3 // 2574
M=D // 2575

////PushInstruction("this 1")
@THIS // 2576
A=M+1 // 2577
D=M // 2578
@SP // 2579
AM=M+1 // 2580
A=A-1 // 2581
M=D // 2582
@RETURN // 2583
0;JMP // 2584

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2585
D=A // 2586
@SP // 2587
AM=M+1 // 2588
A=A-1 // 2589
M=D // 2590
// call Memory.alloc
@6 // 2591
D=A // 2592
@14 // 2593
M=D // 2594
@Memory.alloc // 2595
D=A // 2596
@13 // 2597
M=D // 2598
@String.new.ret.0 // 2599
D=A // 2600
@CALL // 2601
0;JMP // 2602
(String.new.ret.0)
@SP // 2603
AM=M-1 // 2604
D=M // 2605
@3 // 2606
M=D // 2607

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.16 // 2608
D=A // 2609
@SP // 2610
AM=M+1 // 2611
A=A-1 // 2612
M=D // 2613
@ARG // 2614
A=M // 2615
D=M // 2616
@DO_EQ // 2617
0;JMP // 2618
(String.new.EQ.16)
@String.new$IF_TRUE1 // 2619
D;JNE // 2620

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2621
0;JMP // 2622

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2623
A=M // 2624
M=0 // 2625

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2626
0;JMP // 2627

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2628
A=M // 2629
D=M // 2630
@SP // 2631
AM=M+1 // 2632
A=A-1 // 2633
M=D // 2634
// call Memory.alloc
@6 // 2635
D=A // 2636
@14 // 2637
M=D // 2638
@Memory.alloc // 2639
D=A // 2640
@13 // 2641
M=D // 2642
@String.new.ret.1 // 2643
D=A // 2644
@CALL // 2645
0;JMP // 2646
(String.new.ret.1)
@SP // 2647
AM=M-1 // 2648
D=M // 2649
@THIS // 2650
A=M // 2651
M=D // 2652

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2653
A=M // 2654
D=M // 2655
@THIS // 2656
A=M+1 // 2657
A=A+1 // 2658
M=D // 2659

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2660
A=M+1 // 2661
M=0 // 2662

////PushInstruction("pointer 0")
@3 // 2663
D=M // 2664
@SP // 2665
AM=M+1 // 2666
A=A-1 // 2667
M=D // 2668
@RETURN // 2669
0;JMP // 2670

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2671
AM=M+1 // 2672
A=A-1 // 2673
M=0 // 2674

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2675
A=M // 2676
M=0 // 2677

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
@Memory.getBinIndex.LT.17 // 2678
D=A // 2679
@SP // 2680
AM=M+1 // 2681
A=A-1 // 2682
M=D // 2683
@LCL // 2684
A=M // 2685
D=M // 2686
@7 // 2687
D=D-A // 2688
@DO_LT // 2689
0;JMP // 2690
(Memory.getBinIndex.LT.17)
@SP // 2691
AM=M+1 // 2692
A=A-1 // 2693
M=D // 2694
@Memory.getBinIndex.EQ.18 // 2695
D=A // 2696
@SP // 2697
AM=M+1 // 2698
A=A-1 // 2699
M=D // 2700
@LCL // 2701
A=M // 2702
D=M // 2703
@2048 // 2704
A=D+A // 2705
D=M // 2706
@DO_EQ // 2707
0;JMP // 2708
(Memory.getBinIndex.EQ.18)
D=!D // 2709
@SP // 2710
AM=M-1 // 2711
D=D&M // 2712
D=!D // 2713
@Memory.getBinIndex_WHILE_END1 // 2714
D;JNE // 2715

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
@Memory.getBinIndex.GT.19 // 2716
D=A // 2717
@SP // 2718
AM=M+1 // 2719
A=A-1 // 2720
M=D // 2721
@ARG // 2722
A=M // 2723
D=M // 2724
@SP // 2725
AM=M+1 // 2726
A=A-1 // 2727
M=D // 2728
@LCL // 2729
A=M // 2730
D=M // 2731
@SP // 2732
AM=M+1 // 2733
A=A-1 // 2734
M=D+1 // 2735
@16 // 2736
D=A // 2737
@SP // 2738
AM=M+1 // 2739
A=A-1 // 2740
M=D // 2741
// call Math.multiply
@7 // 2742
D=A // 2743
@14 // 2744
M=D // 2745
@Math.multiply // 2746
D=A // 2747
@13 // 2748
M=D // 2749
@Memory.getBinIndex.ret.0 // 2750
D=A // 2751
@CALL // 2752
0;JMP // 2753
(Memory.getBinIndex.ret.0)
@SP // 2754
AM=M-1 // 2755
D=M // 2756
@SP // 2757
AM=M-1 // 2758
D=M-D // 2759
@DO_GT // 2760
0;JMP // 2761
(Memory.getBinIndex.GT.19)
D=!D // 2762
@Memory.getBinIndex$IF_TRUE1 // 2763
D;JNE // 2764

////GotoInstruction{label='Memory.getBinIndex$IF_FALSE1}
// goto Memory.getBinIndex$IF_FALSE1
@Memory.getBinIndex$IF_FALSE1 // 2765
0;JMP // 2766

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2767
A=M // 2768
D=M // 2769
@SP // 2770
AM=M+1 // 2771
A=A-1 // 2772
M=D // 2773
@RETURN // 2774
0;JMP // 2775

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

@LCL // 2776
A=M // 2777
M=M+1 // 2778

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2779
0;JMP // 2780

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
@6 // 2781
D=A // 2782
@SP // 2783
AM=M+1 // 2784
A=A-1 // 2785
M=D // 2786
@7 // 2787
D=A // 2788
@SP // 2789
AM=M+1 // 2790
A=A-1 // 2791
M=D-1 // 2792
@RETURN // 2793
0;JMP // 2794

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2795
D=A // 2796
@SP // 2797
AM=D+M // 2798
A=A-1 // 2799
M=0 // 2800
A=A-1 // 2801
M=0 // 2802
A=A-1 // 2803
M=0 // 2804

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
@Math.multiply.EQ.20 // 2805
D=A // 2806
@SP // 2807
AM=M+1 // 2808
A=A-1 // 2809
M=D // 2810
@ARG // 2811
A=M // 2812
D=M // 2813
@DO_EQ // 2814
0;JMP // 2815
(Math.multiply.EQ.20)
@SP // 2816
AM=M+1 // 2817
A=A-1 // 2818
M=D // 2819
@Math.multiply.EQ.21 // 2820
D=A // 2821
@SP // 2822
AM=M+1 // 2823
A=A-1 // 2824
M=D // 2825
@ARG // 2826
A=M+1 // 2827
D=M // 2828
@DO_EQ // 2829
0;JMP // 2830
(Math.multiply.EQ.21)
@SP // 2831
AM=M-1 // 2832
D=D|M // 2833
@Math.multiply$IF_TRUE1 // 2834
D;JNE // 2835

////GotoInstruction{label='Math.multiply$IF_FALSE1}
// goto Math.multiply$IF_FALSE1
@Math.multiply$IF_FALSE1 // 2836
0;JMP // 2837

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2838
AM=M+1 // 2839
A=A-1 // 2840
M=0 // 2841
@RETURN // 2842
0;JMP // 2843

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
@Math.multiply.EQ.22 // 2844
D=A // 2845
@SP // 2846
AM=M+1 // 2847
A=A-1 // 2848
M=D // 2849
@ARG // 2850
A=M // 2851
D=M // 2852
D=D-1 // 2853
@DO_EQ // 2854
0;JMP // 2855
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE2 // 2856
D;JNE // 2857

////GotoInstruction{label='Math.multiply$IF_FALSE2}
// goto Math.multiply$IF_FALSE2
@Math.multiply$IF_FALSE2 // 2858
0;JMP // 2859

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2860
A=M+1 // 2861
D=M // 2862
@SP // 2863
AM=M+1 // 2864
A=A-1 // 2865
M=D // 2866
@RETURN // 2867
0;JMP // 2868

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
@Math.multiply.EQ.23 // 2869
D=A // 2870
@SP // 2871
AM=M+1 // 2872
A=A-1 // 2873
M=D // 2874
@ARG // 2875
A=M+1 // 2876
D=M // 2877
D=D-1 // 2878
@DO_EQ // 2879
0;JMP // 2880
(Math.multiply.EQ.23)
@Math.multiply$IF_TRUE3 // 2881
D;JNE // 2882

////GotoInstruction{label='Math.multiply$IF_FALSE3}
// goto Math.multiply$IF_FALSE3
@Math.multiply$IF_FALSE3 // 2883
0;JMP // 2884

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2885
A=M // 2886
D=M // 2887
@SP // 2888
AM=M+1 // 2889
A=A-1 // 2890
M=D // 2891
@RETURN // 2892
0;JMP // 2893

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
@Math.multiply.EQ.24 // 2894
D=A // 2895
@SP // 2896
AM=M+1 // 2897
A=A-1 // 2898
M=D // 2899
@ARG // 2900
A=M // 2901
D=M // 2902
@2 // 2903
D=D-A // 2904
@DO_EQ // 2905
0;JMP // 2906
(Math.multiply.EQ.24)
@Math.multiply$IF_TRUE4 // 2907
D;JNE // 2908

////GotoInstruction{label='Math.multiply$IF_FALSE4}
// goto Math.multiply$IF_FALSE4
@Math.multiply$IF_FALSE4 // 2909
0;JMP // 2910

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
@ARG // 2911
A=M+1 // 2912
D=M // 2913
D=D+M // 2914
@SP // 2915
AM=M+1 // 2916
A=A-1 // 2917
M=D // 2918
@RETURN // 2919
0;JMP // 2920

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
@Math.multiply.EQ.25 // 2921
D=A // 2922
@SP // 2923
AM=M+1 // 2924
A=A-1 // 2925
M=D // 2926
@ARG // 2927
A=M+1 // 2928
D=M // 2929
@2 // 2930
D=D-A // 2931
@DO_EQ // 2932
0;JMP // 2933
(Math.multiply.EQ.25)
@Math.multiply$IF_TRUE5 // 2934
D;JNE // 2935

////GotoInstruction{label='Math.multiply$IF_FALSE5}
// goto Math.multiply$IF_FALSE5
@Math.multiply$IF_FALSE5 // 2936
0;JMP // 2937

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
@ARG // 2938
A=M // 2939
D=M // 2940
D=D+M // 2941
@SP // 2942
AM=M+1 // 2943
A=A-1 // 2944
M=D // 2945
@RETURN // 2946
0;JMP // 2947

////LabelInstruction{label='Math.multiply$IF_FALSE5}
// label Math.multiply$IF_FALSE5
(Math.multiply$IF_FALSE5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2948
A=M+1 // 2949
A=A+1 // 2950
M=1 // 2951

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2952
A=M+1 // 2953
M=0 // 2954

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2955
A=M // 2956
M=0 // 2957

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
@Math.multiply.LT.26 // 2958
D=A // 2959
@SP // 2960
AM=M+1 // 2961
A=A-1 // 2962
M=D // 2963
@LCL // 2964
A=M+1 // 2965
D=M // 2966
@16 // 2967
D=D-A // 2968
@DO_LT // 2969
0;JMP // 2970
(Math.multiply.LT.26)
D=!D // 2971
@Math.multiply_WHILE_END1 // 2972
D;JNE // 2973

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
@Math.multiply.EQ.27 // 2974
D=A // 2975
@SP // 2976
AM=M+1 // 2977
A=A-1 // 2978
M=D // 2979
@ARG // 2980
A=M+1 // 2981
D=M // 2982
@SP // 2983
AM=M+1 // 2984
A=A-1 // 2985
M=D // 2986
@LCL // 2987
A=M+1 // 2988
A=A+1 // 2989
D=M // 2990
@SP // 2991
AM=M-1 // 2992
D=D&M // 2993
@DO_EQ // 2994
0;JMP // 2995
(Math.multiply.EQ.27)
D=!D // 2996
@Math.multiply$IF_TRUE6 // 2997
D;JNE // 2998

////GotoInstruction{label='Math.multiply$IF_FALSE6}
// goto Math.multiply$IF_FALSE6
@Math.multiply$IF_FALSE6 // 2999
0;JMP // 3000

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

@ARG // 3001
A=M // 3002
D=M // 3003
@LCL // 3004
A=M // 3005
M=D+M // 3006

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

@ARG // 3007
A=M // 3008
D=M // 3009
@ARG // 3010
A=M // 3011
M=D+M // 3012

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

@LCL // 3013
A=M+1 // 3014
M=M+1 // 3015

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

@LCL // 3016
A=M+1 // 3017
A=A+1 // 3018
D=M // 3019
@LCL // 3020
A=M+1 // 3021
A=A+1 // 3022
M=D+M // 3023

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 3024
0;JMP // 3025

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 3026
A=M // 3027
D=M // 3028
@SP // 3029
AM=M+1 // 3030
A=A-1 // 3031
M=D // 3032
@RETURN // 3033
0;JMP // 3034

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3035
D=A // 3036
@SP // 3037
AM=D+M // 3038
A=A-1 // 3039
M=0 // 3040
A=A-1 // 3041
M=0 // 3042
A=A-1 // 3043
M=0 // 3044

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

@ARG // 3045
A=M // 3046
D=M // 3047
@4 // 3048
D=D-A // 3049
@LCL // 3050
A=M // 3051
M=D // 3052

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3053
A=M // 3054
D=M // 3055
@SP // 3056
AM=M+1 // 3057
A=A-1 // 3058
M=D+1 // 3059
D=1 // 3060
@SP // 3061
AM=M-1 // 3062
A=M // 3063
M=D // 3064

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

@LCL // 3065
A=M // 3066
D=M // 3067
@2 // 3068
A=D+A // 3069
D=M // 3070
@LCL // 3071
A=M+1 // 3072
M=D // 3073

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

@LCL // 3074
A=M // 3075
D=M // 3076
@3 // 3077
A=D+A // 3078
D=M // 3079
@LCL // 3080
A=M+1 // 3081
A=A+1 // 3082
M=D // 3083

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.28 // 3084
D=A // 3085
@SP // 3086
AM=M+1 // 3087
A=A-1 // 3088
M=D // 3089
@LCL // 3090
A=M+1 // 3091
D=M // 3092
@DO_EQ // 3093
0;JMP // 3094
(Memory.deAlloc.EQ.28)
D=!D // 3095
@Memory.deAlloc$IF_TRUE1 // 3096
D;JNE // 3097

////GotoInstruction{label='Memory.deAlloc$IF_FALSE1}
// goto Memory.deAlloc$IF_FALSE1
@Memory.deAlloc$IF_FALSE1 // 3098
0;JMP // 3099

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
@Memory.deAlloc.EQ.29 // 3100
D=A // 3101
@SP // 3102
AM=M+1 // 3103
A=A-1 // 3104
M=D // 3105
@LCL // 3106
A=M+1 // 3107
D=M // 3108
A=D+1 // 3109
D=M // 3110
D=D-1 // 3111
@DO_EQ // 3112
0;JMP // 3113
(Memory.deAlloc.EQ.29)
@Memory.deAlloc$IF_TRUE2 // 3114
D;JNE // 3115

////GotoInstruction{label='Memory.deAlloc$IF_FALSE2}
// goto Memory.deAlloc$IF_FALSE2
@Memory.deAlloc$IF_FALSE2 // 3116
0;JMP // 3117

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

@LCL // 3118
A=M+1 // 3119
D=M // 3120
@0 // 3121
A=D+A // 3122
D=M // 3123
@SP // 3124
AM=M+1 // 3125
A=A-1 // 3126
M=D // 3127
// call Memory.getBinIndex
@6 // 3128
D=A // 3129
@14 // 3130
M=D // 3131
@Memory.getBinIndex // 3132
D=A // 3133
@13 // 3134
M=D // 3135
@Memory.deAlloc.ret.0 // 3136
D=A // 3137
@CALL // 3138
0;JMP // 3139
(Memory.deAlloc.ret.0)
@SP // 3140
AM=M-1 // 3141
D=M // 3142
@2048 // 3143
D=D+A // 3144
@SP // 3145
AM=M+1 // 3146
A=A-1 // 3147
M=D // 3148
@LCL // 3149
A=M+1 // 3150
D=M // 3151
@SP // 3152
AM=M+1 // 3153
A=A-1 // 3154
M=D // 3155
// call Memory.remove_node
@7 // 3156
D=A // 3157
@14 // 3158
M=D // 3159
@Memory.remove_node // 3160
D=A // 3161
@13 // 3162
M=D // 3163
@Memory.deAlloc.ret.1 // 3164
D=A // 3165
@CALL // 3166
0;JMP // 3167
(Memory.deAlloc.ret.1)
@SP // 3168
M=M-1 // 3169

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
@LCL // 3170
A=M+1 // 3171
D=M // 3172
@SP // 3173
AM=M+1 // 3174
A=A-1 // 3175
M=D // 3176
@LCL // 3177
A=M+1 // 3178
D=M // 3179
@0 // 3180
A=D+A // 3181
D=M // 3182
@SP // 3183
AM=M+1 // 3184
A=A-1 // 3185
M=D // 3186
@LCL // 3187
A=M // 3188
D=M // 3189
@0 // 3190
A=D+A // 3191
D=M // 3192
@SP // 3193
AM=M-1 // 3194
D=D+M // 3195
@5 // 3196
D=D+A // 3197
@SP // 3198
AM=M-1 // 3199
A=M // 3200
M=D // 3201

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3202
A=M+1 // 3203
D=M // 3204
@SP // 3205
AM=M+1 // 3206
A=A-1 // 3207
M=D // 3208
// call Memory.create_foot
@6 // 3209
D=A // 3210
@14 // 3211
M=D // 3212
@Memory.create_foot // 3213
D=A // 3214
@13 // 3215
M=D // 3216
@Memory.deAlloc.ret.2 // 3217
D=A // 3218
@CALL // 3219
0;JMP // 3220
(Memory.deAlloc.ret.2)
@SP // 3221
M=M-1 // 3222

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3223
A=M+1 // 3224
D=M // 3225
@LCL // 3226
A=M // 3227
M=D // 3228

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
@Memory.deAlloc.EQ.30 // 3229
D=A // 3230
@SP // 3231
AM=M+1 // 3232
A=A-1 // 3233
M=D // 3234
@LCL // 3235
A=M+1 // 3236
A=A+1 // 3237
D=M // 3238
@DO_EQ // 3239
0;JMP // 3240
(Memory.deAlloc.EQ.30)
D=!D // 3241
@Memory.deAlloc$IF_TRUE3 // 3242
D;JNE // 3243

////GotoInstruction{label='Memory.deAlloc$IF_FALSE3}
// goto Memory.deAlloc$IF_FALSE3
@Memory.deAlloc$IF_FALSE3 // 3244
0;JMP // 3245

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
@Memory.deAlloc.EQ.31 // 3246
D=A // 3247
@SP // 3248
AM=M+1 // 3249
A=A-1 // 3250
M=D // 3251
@LCL // 3252
A=M+1 // 3253
A=A+1 // 3254
D=M // 3255
A=D+1 // 3256
D=M // 3257
D=D-1 // 3258
@DO_EQ // 3259
0;JMP // 3260
(Memory.deAlloc.EQ.31)
@Memory.deAlloc$IF_TRUE4 // 3261
D;JNE // 3262

////GotoInstruction{label='Memory.deAlloc$IF_FALSE4}
// goto Memory.deAlloc$IF_FALSE4
@Memory.deAlloc$IF_FALSE4 // 3263
0;JMP // 3264

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

@LCL // 3265
A=M+1 // 3266
A=A+1 // 3267
D=M // 3268
@0 // 3269
A=D+A // 3270
D=M // 3271
@SP // 3272
AM=M+1 // 3273
A=A-1 // 3274
M=D // 3275
// call Memory.getBinIndex
@6 // 3276
D=A // 3277
@14 // 3278
M=D // 3279
@Memory.getBinIndex // 3280
D=A // 3281
@13 // 3282
M=D // 3283
@Memory.deAlloc.ret.3 // 3284
D=A // 3285
@CALL // 3286
0;JMP // 3287
(Memory.deAlloc.ret.3)
@SP // 3288
AM=M-1 // 3289
D=M // 3290
@2048 // 3291
D=D+A // 3292
@SP // 3293
AM=M+1 // 3294
A=A-1 // 3295
M=D // 3296
@LCL // 3297
A=M+1 // 3298
A=A+1 // 3299
D=M // 3300
@SP // 3301
AM=M+1 // 3302
A=A-1 // 3303
M=D // 3304
// call Memory.remove_node
@7 // 3305
D=A // 3306
@14 // 3307
M=D // 3308
@Memory.remove_node // 3309
D=A // 3310
@13 // 3311
M=D // 3312
@Memory.deAlloc.ret.4 // 3313
D=A // 3314
@CALL // 3315
0;JMP // 3316
(Memory.deAlloc.ret.4)
@SP // 3317
M=M-1 // 3318

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
@LCL // 3319
A=M // 3320
D=M // 3321
@SP // 3322
AM=M+1 // 3323
A=A-1 // 3324
M=D // 3325
@LCL // 3326
A=M // 3327
D=M // 3328
@0 // 3329
A=D+A // 3330
D=M // 3331
@SP // 3332
AM=M+1 // 3333
A=A-1 // 3334
M=D // 3335
@LCL // 3336
A=M+1 // 3337
A=A+1 // 3338
D=M // 3339
@0 // 3340
A=D+A // 3341
D=M // 3342
@SP // 3343
AM=M-1 // 3344
D=D+M // 3345
@5 // 3346
D=D+A // 3347
@SP // 3348
AM=M-1 // 3349
A=M // 3350
M=D // 3351

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3352
A=M // 3353
D=M // 3354
@SP // 3355
AM=M+1 // 3356
A=A-1 // 3357
M=D // 3358
// call Memory.create_foot
@6 // 3359
D=A // 3360
@14 // 3361
M=D // 3362
@Memory.create_foot // 3363
D=A // 3364
@13 // 3365
M=D // 3366
@Memory.deAlloc.ret.5 // 3367
D=A // 3368
@CALL // 3369
0;JMP // 3370
(Memory.deAlloc.ret.5)
@SP // 3371
M=M-1 // 3372

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

@LCL // 3373
A=M // 3374
D=M // 3375
@0 // 3376
A=D+A // 3377
D=M // 3378
@SP // 3379
AM=M+1 // 3380
A=A-1 // 3381
M=D // 3382
// call Memory.getBinIndex
@6 // 3383
D=A // 3384
@14 // 3385
M=D // 3386
@Memory.getBinIndex // 3387
D=A // 3388
@13 // 3389
M=D // 3390
@Memory.deAlloc.ret.6 // 3391
D=A // 3392
@CALL // 3393
0;JMP // 3394
(Memory.deAlloc.ret.6)
@SP // 3395
AM=M-1 // 3396
D=M // 3397
@2048 // 3398
D=D+A // 3399
@SP // 3400
AM=M+1 // 3401
A=A-1 // 3402
M=D // 3403
@LCL // 3404
A=M // 3405
D=M // 3406
@SP // 3407
AM=M+1 // 3408
A=A-1 // 3409
M=D // 3410
// call Memory.add_node
@7 // 3411
D=A // 3412
@14 // 3413
M=D // 3414
@Memory.add_node // 3415
D=A // 3416
@13 // 3417
M=D // 3418
@Memory.deAlloc.ret.7 // 3419
D=A // 3420
@CALL // 3421
0;JMP // 3422
(Memory.deAlloc.ret.7)
@SP // 3423
M=M-1 // 3424

////PushInstruction("constant 0")
@SP // 3425
AM=M+1 // 3426
A=A-1 // 3427
M=0 // 3428
@RETURN // 3429
0;JMP // 3430

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3431
A=M // 3432
D=M // 3433
@3 // 3434
M=D // 3435

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
@THIS // 3436
A=M // 3437
D=M // 3438
@SP // 3439
AM=M+1 // 3440
A=A-1 // 3441
M=D // 3442
@ARG // 3443
A=M+1 // 3444
D=M // 3445
@SP // 3446
AM=M-1 // 3447
A=D+M // 3448
D=M // 3449
@SP // 3450
AM=M+1 // 3451
A=A-1 // 3452
M=D // 3453
@RETURN // 3454
0;JMP // 3455

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3456
AM=M+1 // 3457
A=A-1 // 3458
M=0 // 3459

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3460
A=M // 3461
M=0 // 3462

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
@Memory.copy.LT.32 // 3463
D=A // 3464
@SP // 3465
AM=M+1 // 3466
A=A-1 // 3467
M=D // 3468
@LCL // 3469
A=M // 3470
D=M // 3471
@SP // 3472
AM=M+1 // 3473
A=A-1 // 3474
M=D // 3475
@ARG // 3476
A=M+1 // 3477
A=A+1 // 3478
D=M // 3479
@SP // 3480
AM=M-1 // 3481
D=M-D // 3482
@DO_LT // 3483
0;JMP // 3484
(Memory.copy.LT.32)
D=!D // 3485
@Memory.copy_WHILE_END1 // 3486
D;JNE // 3487

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
@ARG // 3488
A=M+1 // 3489
D=M // 3490
@SP // 3491
AM=M+1 // 3492
A=A-1 // 3493
M=D // 3494
@LCL // 3495
A=M // 3496
D=M // 3497
@SP // 3498
AM=M-1 // 3499
D=D+M // 3500
@SP // 3501
AM=M+1 // 3502
A=A-1 // 3503
M=D // 3504
@ARG // 3505
A=M // 3506
D=M // 3507
@SP // 3508
AM=M+1 // 3509
A=A-1 // 3510
M=D // 3511
@LCL // 3512
A=M // 3513
D=M // 3514
@SP // 3515
AM=M-1 // 3516
A=D+M // 3517
D=M // 3518
@SP // 3519
AM=M-1 // 3520
A=M // 3521
M=D // 3522

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

@LCL // 3523
A=M // 3524
M=M+1 // 3525

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3526
0;JMP // 3527

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3528
AM=M+1 // 3529
A=A-1 // 3530
M=0 // 3531
@RETURN // 3532
0;JMP // 3533

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3534
D=A // 3535
@SP // 3536
AM=D+M // 3537
A=A-1 // 3538
M=0 // 3539
A=A-1 // 3540
M=0 // 3541
A=A-1 // 3542
M=0 // 3543

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3544
A=M // 3545
D=M // 3546
@SP // 3547
AM=M+1 // 3548
A=A-1 // 3549
M=D // 3550
// call Math.abs
@6 // 3551
D=A // 3552
@14 // 3553
M=D // 3554
@Math.abs // 3555
D=A // 3556
@13 // 3557
M=D // 3558
@Math.divide.ret.0 // 3559
D=A // 3560
@CALL // 3561
0;JMP // 3562
(Math.divide.ret.0)
@SP // 3563
AM=M-1 // 3564
D=M // 3565
@LCL // 3566
A=M+1 // 3567
M=D // 3568

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3569
A=M+1 // 3570
D=M // 3571
@SP // 3572
AM=M+1 // 3573
A=A-1 // 3574
M=D // 3575
// call Math.abs
@6 // 3576
D=A // 3577
@14 // 3578
M=D // 3579
@Math.abs // 3580
D=A // 3581
@13 // 3582
M=D // 3583
@Math.divide.ret.1 // 3584
D=A // 3585
@CALL // 3586
0;JMP // 3587
(Math.divide.ret.1)
@SP // 3588
AM=M-1 // 3589
D=M // 3590
@LCL // 3591
A=M+1 // 3592
A=A+1 // 3593
M=D // 3594

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.33 // 3595
D=A // 3596
@SP // 3597
AM=M+1 // 3598
A=A-1 // 3599
M=D // 3600
@LCL // 3601
A=M+1 // 3602
A=A+1 // 3603
D=M // 3604
A=A-1 // 3605
D=D-M // 3606
@DO_GT // 3607
0;JMP // 3608
(Math.divide.GT.33)
@Math.divide$IF_TRUE1 // 3609
D;JNE // 3610

////GotoInstruction{label='Math.divide$IF_FALSE1}
// goto Math.divide$IF_FALSE1
@Math.divide$IF_FALSE1 // 3611
0;JMP // 3612

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3613
AM=M+1 // 3614
A=A-1 // 3615
M=0 // 3616
@RETURN // 3617
0;JMP // 3618

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

@LCL // 3619
A=M+1 // 3620
D=M // 3621
@SP // 3622
AM=M+1 // 3623
A=A-1 // 3624
M=D // 3625
@LCL // 3626
A=M+1 // 3627
A=A+1 // 3628
D=M // 3629
D=D+M // 3630
@SP // 3631
AM=M+1 // 3632
A=A-1 // 3633
M=D // 3634
// call Math.divide
@7 // 3635
D=A // 3636
@14 // 3637
M=D // 3638
@Math.divide // 3639
D=A // 3640
@13 // 3641
M=D // 3642
@Math.divide.ret.2 // 3643
D=A // 3644
@CALL // 3645
0;JMP // 3646
(Math.divide.ret.2)
@SP // 3647
AM=M-1 // 3648
D=M // 3649
@LCL // 3650
A=M // 3651
M=D // 3652

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
@Math.divide.LT.34 // 3653
D=A // 3654
@SP // 3655
AM=M+1 // 3656
A=A-1 // 3657
M=D // 3658
@LCL // 3659
A=M+1 // 3660
D=M // 3661
@SP // 3662
AM=M+1 // 3663
A=A-1 // 3664
M=D // 3665
@LCL // 3666
A=M // 3667
D=M // 3668
D=D+M // 3669
@SP // 3670
AM=M+1 // 3671
A=A-1 // 3672
M=D // 3673
@LCL // 3674
A=M+1 // 3675
A=A+1 // 3676
D=M // 3677
@SP // 3678
AM=M+1 // 3679
A=A-1 // 3680
M=D // 3681
// call Math.multiply
@7 // 3682
D=A // 3683
@14 // 3684
M=D // 3685
@Math.multiply // 3686
D=A // 3687
@13 // 3688
M=D // 3689
@Math.divide.ret.3 // 3690
D=A // 3691
@CALL // 3692
0;JMP // 3693
(Math.divide.ret.3)
@SP // 3694
AM=M-1 // 3695
D=M // 3696
@SP // 3697
AM=M-1 // 3698
D=M-D // 3699
@SP // 3700
AM=M+1 // 3701
A=A-1 // 3702
M=D // 3703
@LCL // 3704
A=M+1 // 3705
A=A+1 // 3706
D=M // 3707
@SP // 3708
AM=M-1 // 3709
D=M-D // 3710
@DO_LT // 3711
0;JMP // 3712
(Math.divide.LT.34)
@Math.divide$IF_TRUE2 // 3713
D;JNE // 3714

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3715
0;JMP // 3716

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
@Math.divide.LT.35 // 3717
D=A // 3718
@SP // 3719
AM=M+1 // 3720
A=A-1 // 3721
M=D // 3722
@ARG // 3723
A=M // 3724
D=M // 3725
@DO_LT // 3726
0;JMP // 3727
(Math.divide.LT.35)
@SP // 3728
AM=M+1 // 3729
A=A-1 // 3730
M=D // 3731
@Math.divide.GT.36 // 3732
D=A // 3733
@SP // 3734
AM=M+1 // 3735
A=A-1 // 3736
M=D // 3737
@ARG // 3738
A=M+1 // 3739
D=M // 3740
@DO_GT // 3741
0;JMP // 3742
(Math.divide.GT.36)
@SP // 3743
AM=M-1 // 3744
D=D&M // 3745
@SP // 3746
AM=M+1 // 3747
A=A-1 // 3748
M=D // 3749
@Math.divide.GT.37 // 3750
D=A // 3751
@SP // 3752
AM=M+1 // 3753
A=A-1 // 3754
M=D // 3755
@ARG // 3756
A=M // 3757
D=M // 3758
@DO_GT // 3759
0;JMP // 3760
(Math.divide.GT.37)
@SP // 3761
AM=M+1 // 3762
A=A-1 // 3763
M=D // 3764
@Math.divide.LT.38 // 3765
D=A // 3766
@SP // 3767
AM=M+1 // 3768
A=A-1 // 3769
M=D // 3770
@ARG // 3771
A=M+1 // 3772
D=M // 3773
@DO_LT // 3774
0;JMP // 3775
(Math.divide.LT.38)
@SP // 3776
AM=M-1 // 3777
D=D&M // 3778
@SP // 3779
AM=M-1 // 3780
D=D|M // 3781
@Math.divide$IF_TRUE3 // 3782
D;JNE // 3783

////GotoInstruction{label='Math.divide$IF_FALSE3}
// goto Math.divide$IF_FALSE3
@Math.divide$IF_FALSE3 // 3784
0;JMP // 3785

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3786
A=M // 3787
D=-M // 3788
@LCL // 3789
A=M // 3790
M=D // 3791

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
@LCL // 3792
A=M // 3793
D=M // 3794
D=D+M // 3795
@SP // 3796
AM=M+1 // 3797
A=A-1 // 3798
M=D // 3799
@RETURN // 3800
0;JMP // 3801

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3802
0;JMP // 3803

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
@Math.divide.LT.39 // 3804
D=A // 3805
@SP // 3806
AM=M+1 // 3807
A=A-1 // 3808
M=D // 3809
@ARG // 3810
A=M // 3811
D=M // 3812
@DO_LT // 3813
0;JMP // 3814
(Math.divide.LT.39)
@SP // 3815
AM=M+1 // 3816
A=A-1 // 3817
M=D // 3818
@Math.divide.GT.40 // 3819
D=A // 3820
@SP // 3821
AM=M+1 // 3822
A=A-1 // 3823
M=D // 3824
@ARG // 3825
A=M+1 // 3826
D=M // 3827
@DO_GT // 3828
0;JMP // 3829
(Math.divide.GT.40)
@SP // 3830
AM=M-1 // 3831
D=D&M // 3832
@SP // 3833
AM=M+1 // 3834
A=A-1 // 3835
M=D // 3836
@Math.divide.GT.41 // 3837
D=A // 3838
@SP // 3839
AM=M+1 // 3840
A=A-1 // 3841
M=D // 3842
@ARG // 3843
A=M // 3844
D=M // 3845
@DO_GT // 3846
0;JMP // 3847
(Math.divide.GT.41)
@SP // 3848
AM=M+1 // 3849
A=A-1 // 3850
M=D // 3851
@Math.divide.LT.42 // 3852
D=A // 3853
@SP // 3854
AM=M+1 // 3855
A=A-1 // 3856
M=D // 3857
@ARG // 3858
A=M+1 // 3859
D=M // 3860
@DO_LT // 3861
0;JMP // 3862
(Math.divide.LT.42)
@SP // 3863
AM=M-1 // 3864
D=D&M // 3865
@SP // 3866
AM=M-1 // 3867
D=D|M // 3868
@Math.divide$IF_TRUE4 // 3869
D;JNE // 3870

////GotoInstruction{label='Math.divide$IF_FALSE4}
// goto Math.divide$IF_FALSE4
@Math.divide$IF_FALSE4 // 3871
0;JMP // 3872

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3873
A=M // 3874
D=-M // 3875
@LCL // 3876
A=M // 3877
M=D // 3878

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
@LCL // 3879
A=M // 3880
D=M // 3881
D=D+M // 3882
D=D+1 // 3883
@SP // 3884
AM=M+1 // 3885
A=A-1 // 3886
M=D // 3887
@RETURN // 3888
0;JMP // 3889

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3890
D=A // 3891
@SP // 3892
AM=D+M // 3893
A=A-1 // 3894
M=0 // 3895
A=A-1 // 3896
M=0 // 3897
A=A-1 // 3898
M=0 // 3899
A=A-1 // 3900
M=0 // 3901
A=A-1 // 3902
M=0 // 3903
A=A-1 // 3904
M=0 // 3905

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

@ARG // 3906
A=M+1 // 3907
A=A+1 // 3908
D=M // 3909
A=A-1 // 3910
A=A-1 // 3911
D=D-M // 3912
@SP // 3913
AM=M+1 // 3914
A=A-1 // 3915
M=D // 3916
// call Math.abs
@6 // 3917
D=A // 3918
@14 // 3919
M=D // 3920
@Math.abs // 3921
D=A // 3922
@13 // 3923
M=D // 3924
@Screen.drawLine.ret.0 // 3925
D=A // 3926
@CALL // 3927
0;JMP // 3928
(Screen.drawLine.ret.0)
@SP // 3929
AM=M-1 // 3930
D=M // 3931
@LCL // 3932
A=M // 3933
M=D // 3934

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

@ARG // 3935
A=M+1 // 3936
A=A+1 // 3937
A=A+1 // 3938
D=M // 3939
A=A-1 // 3940
A=A-1 // 3941
D=D-M // 3942
@SP // 3943
AM=M+1 // 3944
A=A-1 // 3945
M=D // 3946
// call Math.abs
@6 // 3947
D=A // 3948
@14 // 3949
M=D // 3950
@Math.abs // 3951
D=A // 3952
@13 // 3953
M=D // 3954
@Screen.drawLine.ret.1 // 3955
D=A // 3956
@CALL // 3957
0;JMP // 3958
(Screen.drawLine.ret.1)
@SP // 3959
AM=M-1 // 3960
D=M // 3961
@LCL // 3962
A=M+1 // 3963
M=D // 3964

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.43 // 3965
D=A // 3966
@SP // 3967
AM=M+1 // 3968
A=A-1 // 3969
M=D // 3970
@ARG // 3971
A=M+1 // 3972
A=A+1 // 3973
D=M // 3974
A=A-1 // 3975
A=A-1 // 3976
D=M-D // 3977
@DO_LT // 3978
0;JMP // 3979
(Screen.drawLine.LT.43)
@Screen.drawLine$IF_TRUE1 // 3980
D;JNE // 3981

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 3982
0;JMP // 3983

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3984
A=M+1 // 3985
A=A+1 // 3986
M=1 // 3987

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 3988
0;JMP // 3989

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3990
A=M+1 // 3991
A=A+1 // 3992
M=-1 // 3993

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
@Screen.drawLine.LT.44 // 3994
D=A // 3995
@SP // 3996
AM=M+1 // 3997
A=A-1 // 3998
M=D // 3999
@ARG // 4000
A=M+1 // 4001
A=A+1 // 4002
A=A+1 // 4003
D=M // 4004
A=A-1 // 4005
A=A-1 // 4006
D=M-D // 4007
@DO_LT // 4008
0;JMP // 4009
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE2 // 4010
D;JNE // 4011

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 4012
0;JMP // 4013

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4014
A=M+1 // 4015
A=A+1 // 4016
A=A+1 // 4017
M=1 // 4018

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 4019
0;JMP // 4020

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4021
A=M+1 // 4022
A=A+1 // 4023
A=A+1 // 4024
M=-1 // 4025

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

@LCL // 4026
A=M+1 // 4027
D=M // 4028
A=A-1 // 4029
D=M-D // 4030
@SP // 4031
AM=M+1 // 4032
A=A-1 // 4033
M=D // 4034
@LCL // 4035
D=M // 4036
@4 // 4037
A=D+A // 4038
D=A // 4039
@R13 // 4040
M=D // 4041
@SP // 4042
AM=M-1 // 4043
D=M // 4044
@R13 // 4045
A=M // 4046
M=D // 4047

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 4048
@Screen.drawLine_WHILE_END1 // 4049
D;JNE // 4050

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4051
A=M // 4052
D=M // 4053
@SP // 4054
AM=M+1 // 4055
A=A-1 // 4056
M=D // 4057
@ARG // 4058
A=M+1 // 4059
D=M // 4060
@SP // 4061
AM=M+1 // 4062
A=A-1 // 4063
M=D // 4064
// call Screen.drawPixel
@7 // 4065
D=A // 4066
@14 // 4067
M=D // 4068
@Screen.drawPixel // 4069
D=A // 4070
@13 // 4071
M=D // 4072
@Screen.drawLine.ret.2 // 4073
D=A // 4074
@CALL // 4075
0;JMP // 4076
(Screen.drawLine.ret.2)
@SP // 4077
M=M-1 // 4078

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
@Screen.drawLine.EQ.45 // 4079
D=A // 4080
@SP // 4081
AM=M+1 // 4082
A=A-1 // 4083
M=D // 4084
@ARG // 4085
A=M+1 // 4086
A=A+1 // 4087
D=M // 4088
A=A-1 // 4089
A=A-1 // 4090
D=M-D // 4091
@DO_EQ // 4092
0;JMP // 4093
(Screen.drawLine.EQ.45)
@SP // 4094
AM=M+1 // 4095
A=A-1 // 4096
M=D // 4097
@Screen.drawLine.EQ.46 // 4098
D=A // 4099
@SP // 4100
AM=M+1 // 4101
A=A-1 // 4102
M=D // 4103
@ARG // 4104
A=M+1 // 4105
A=A+1 // 4106
A=A+1 // 4107
D=M // 4108
A=A-1 // 4109
A=A-1 // 4110
D=M-D // 4111
@DO_EQ // 4112
0;JMP // 4113
(Screen.drawLine.EQ.46)
@SP // 4114
AM=M-1 // 4115
D=D&M // 4116
@Screen.drawLine$IF_TRUE3 // 4117
D;JNE // 4118

////GotoInstruction{label='Screen.drawLine$IF_FALSE3}
// goto Screen.drawLine$IF_FALSE3
@Screen.drawLine$IF_FALSE3 // 4119
0;JMP // 4120

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4121
AM=M+1 // 4122
A=A-1 // 4123
M=0 // 4124
@RETURN // 4125
0;JMP // 4126

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

@LCL // 4127
D=M // 4128
@4 // 4129
A=D+A // 4130
D=M // 4131
D=D+M // 4132
@SP // 4133
AM=M+1 // 4134
A=A-1 // 4135
M=D // 4136
@LCL // 4137
D=M // 4138
@5 // 4139
A=D+A // 4140
D=A // 4141
@R13 // 4142
M=D // 4143
@SP // 4144
AM=M-1 // 4145
D=M // 4146
@R13 // 4147
A=M // 4148
M=D // 4149

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
@Screen.drawLine.GT.47 // 4150
D=A // 4151
@SP // 4152
AM=M+1 // 4153
A=A-1 // 4154
M=D // 4155
@LCL // 4156
D=M // 4157
@5 // 4158
A=D+A // 4159
D=M // 4160
@SP // 4161
AM=M+1 // 4162
A=A-1 // 4163
M=D // 4164
@LCL // 4165
A=M+1 // 4166
D=M // 4167
@SP // 4168
AM=M-1 // 4169
D=D+M // 4170
@DO_GT // 4171
0;JMP // 4172
(Screen.drawLine.GT.47)
@Screen.drawLine$IF_TRUE4 // 4173
D;JNE // 4174

////GotoInstruction{label='Screen.drawLine$IF_FALSE4}
// goto Screen.drawLine$IF_FALSE4
@Screen.drawLine$IF_FALSE4 // 4175
0;JMP // 4176

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

@LCL // 4177
D=M // 4178
@4 // 4179
A=D+A // 4180
D=M // 4181
A=A-1 // 4182
A=A-1 // 4183
A=A-1 // 4184
D=D-M // 4185
@SP // 4186
AM=M+1 // 4187
A=A-1 // 4188
M=D // 4189
@LCL // 4190
D=M // 4191
@4 // 4192
A=D+A // 4193
D=A // 4194
@R13 // 4195
M=D // 4196
@SP // 4197
AM=M-1 // 4198
D=M // 4199
@R13 // 4200
A=M // 4201
M=D // 4202

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

@LCL // 4203
A=M+1 // 4204
A=A+1 // 4205
D=M // 4206
@ARG // 4207
A=M // 4208
M=D+M // 4209

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
@Screen.drawLine.LT.48 // 4210
D=A // 4211
@SP // 4212
AM=M+1 // 4213
A=A-1 // 4214
M=D // 4215
@LCL // 4216
D=M // 4217
@5 // 4218
A=D+A // 4219
D=M // 4220
@SP // 4221
AM=M+1 // 4222
A=A-1 // 4223
M=D // 4224
@LCL // 4225
A=M // 4226
D=M // 4227
@SP // 4228
AM=M-1 // 4229
D=M-D // 4230
@DO_LT // 4231
0;JMP // 4232
(Screen.drawLine.LT.48)
@Screen.drawLine$IF_TRUE5 // 4233
D;JNE // 4234

////GotoInstruction{label='Screen.drawLine$IF_FALSE5}
// goto Screen.drawLine$IF_FALSE5
@Screen.drawLine$IF_FALSE5 // 4235
0;JMP // 4236

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

@LCL // 4237
D=M // 4238
@4 // 4239
A=D+A // 4240
D=M // 4241
@SP // 4242
AM=M+1 // 4243
A=A-1 // 4244
M=D // 4245
@LCL // 4246
A=M // 4247
D=M // 4248
@SP // 4249
AM=M-1 // 4250
D=D+M // 4251
@SP // 4252
AM=M+1 // 4253
A=A-1 // 4254
M=D // 4255
@LCL // 4256
D=M // 4257
@4 // 4258
A=D+A // 4259
D=A // 4260
@R13 // 4261
M=D // 4262
@SP // 4263
AM=M-1 // 4264
D=M // 4265
@R13 // 4266
A=M // 4267
M=D // 4268

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

@LCL // 4269
A=M+1 // 4270
A=A+1 // 4271
A=A+1 // 4272
D=M // 4273
@ARG // 4274
A=M+1 // 4275
M=D+M // 4276

////LabelInstruction{label='Screen.drawLine$IF_FALSE5}
// label Screen.drawLine$IF_FALSE5
(Screen.drawLine$IF_FALSE5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4277
0;JMP // 4278

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4279
AM=M+1 // 4280
A=A-1 // 4281
M=0 // 4282
@RETURN // 4283
0;JMP // 4284

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
@Math.max.GT.49 // 4285
D=A // 4286
@SP // 4287
AM=M+1 // 4288
A=A-1 // 4289
M=D // 4290
@ARG // 4291
A=M+1 // 4292
D=M // 4293
A=A-1 // 4294
D=M-D // 4295
@DO_GT // 4296
0;JMP // 4297
(Math.max.GT.49)
@Math.max$IF_TRUE1 // 4298
D;JNE // 4299

////GotoInstruction{label='Math.max$IF_FALSE1}
// goto Math.max$IF_FALSE1
@Math.max$IF_FALSE1 // 4300
0;JMP // 4301

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4302
A=M // 4303
D=M // 4304
@SP // 4305
AM=M+1 // 4306
A=A-1 // 4307
M=D // 4308
@RETURN // 4309
0;JMP // 4310

////LabelInstruction{label='Math.max$IF_FALSE1}
// label Math.max$IF_FALSE1
(Math.max$IF_FALSE1)

////PushInstruction("argument 1")
@ARG // 4311
A=M+1 // 4312
D=M // 4313
@SP // 4314
AM=M+1 // 4315
A=A-1 // 4316
M=D // 4317
@RETURN // 4318
0;JMP // 4319

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4320
AM=M+1 // 4321
A=A-1 // 4322
M=0 // 4323

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4324
AM=M+1 // 4325
A=A-1 // 4326
M=0 // 4327
@220 // 4328
D=A // 4329
@SP // 4330
AM=M+1 // 4331
A=A-1 // 4332
M=D // 4333
@511 // 4334
D=A // 4335
@SP // 4336
AM=M+1 // 4337
A=A-1 // 4338
M=D // 4339
@220 // 4340
D=A // 4341
@SP // 4342
AM=M+1 // 4343
A=A-1 // 4344
M=D // 4345
// call Screen.drawLine
@9 // 4346
D=A // 4347
@14 // 4348
M=D // 4349
@Screen.drawLine // 4350
D=A // 4351
@13 // 4352
M=D // 4353
@Main.main.ret.0 // 4354
D=A // 4355
@CALL // 4356
0;JMP // 4357
(Main.main.ret.0)
@SP // 4358
M=M-1 // 4359

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4360
D=A // 4361
@SP // 4362
AM=M+1 // 4363
A=A-1 // 4364
M=D // 4365
@90 // 4366
D=A // 4367
@SP // 4368
AM=M+1 // 4369
A=A-1 // 4370
M=D // 4371
@410 // 4372
D=A // 4373
@SP // 4374
AM=M+1 // 4375
A=A-1 // 4376
M=D // 4377
@220 // 4378
D=A // 4379
@SP // 4380
AM=M+1 // 4381
A=A-1 // 4382
M=D // 4383
// call Screen.drawRectangle
@9 // 4384
D=A // 4385
@14 // 4386
M=D // 4387
@Screen.drawRectangle // 4388
D=A // 4389
@13 // 4390
M=D // 4391
@Main.main.ret.1 // 4392
D=A // 4393
@CALL // 4394
0;JMP // 4395
(Main.main.ret.1)
@SP // 4396
M=M-1 // 4397

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4398
AM=M+1 // 4399
A=A-1 // 4400
M=0 // 4401
// call Screen.setColor
@6 // 4402
D=A // 4403
@14 // 4404
M=D // 4405
@Screen.setColor // 4406
D=A // 4407
@13 // 4408
M=D // 4409
@Main.main.ret.2 // 4410
D=A // 4411
@CALL // 4412
0;JMP // 4413
(Main.main.ret.2)
@SP // 4414
M=M-1 // 4415

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4416
D=A // 4417
@SP // 4418
AM=M+1 // 4419
A=A-1 // 4420
M=D // 4421
@120 // 4422
D=A // 4423
@SP // 4424
AM=M+1 // 4425
A=A-1 // 4426
M=D // 4427
@390 // 4428
D=A // 4429
@SP // 4430
AM=M+1 // 4431
A=A-1 // 4432
M=D // 4433
@219 // 4434
D=A // 4435
@SP // 4436
AM=M+1 // 4437
A=A-1 // 4438
M=D // 4439
// call Screen.drawRectangle
@9 // 4440
D=A // 4441
@14 // 4442
M=D // 4443
@Screen.drawRectangle // 4444
D=A // 4445
@13 // 4446
M=D // 4447
@Main.main.ret.3 // 4448
D=A // 4449
@CALL // 4450
0;JMP // 4451
(Main.main.ret.3)
@SP // 4452
M=M-1 // 4453

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4454
D=A // 4455
@SP // 4456
AM=M+1 // 4457
A=A-1 // 4458
M=D // 4459
@120 // 4460
D=A // 4461
@SP // 4462
AM=M+1 // 4463
A=A-1 // 4464
M=D // 4465
@332 // 4466
D=A // 4467
@SP // 4468
AM=M+1 // 4469
A=A-1 // 4470
M=D // 4471
@150 // 4472
D=A // 4473
@SP // 4474
AM=M+1 // 4475
A=A-1 // 4476
M=D // 4477
// call Screen.drawRectangle
@9 // 4478
D=A // 4479
@14 // 4480
M=D // 4481
@Screen.drawRectangle // 4482
D=A // 4483
@13 // 4484
M=D // 4485
@Main.main.ret.4 // 4486
D=A // 4487
@CALL // 4488
0;JMP // 4489
(Main.main.ret.4)
@SP // 4490
M=M-1 // 4491

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4492
AM=M+1 // 4493
A=A-1 // 4494
M=-1 // 4495
// call Screen.setColor
@6 // 4496
D=A // 4497
@14 // 4498
M=D // 4499
@Screen.setColor // 4500
D=A // 4501
@13 // 4502
M=D // 4503
@Main.main.ret.5 // 4504
D=A // 4505
@CALL // 4506
0;JMP // 4507
(Main.main.ret.5)
@SP // 4508
M=M-1 // 4509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4510
D=A // 4511
@SP // 4512
AM=M+1 // 4513
A=A-1 // 4514
M=D // 4515
@170 // 4516
D=A // 4517
@SP // 4518
AM=M+1 // 4519
A=A-1 // 4520
M=D // 4521
@3 // 4522
D=A // 4523
@SP // 4524
AM=M+1 // 4525
A=A-1 // 4526
M=D // 4527
// call Screen.drawCircle
@8 // 4528
D=A // 4529
@14 // 4530
M=D // 4531
@Screen.drawCircle // 4532
D=A // 4533
@13 // 4534
M=D // 4535
@Main.main.ret.6 // 4536
D=A // 4537
@CALL // 4538
0;JMP // 4539
(Main.main.ret.6)
@SP // 4540
M=M-1 // 4541

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4542
D=A // 4543
@SP // 4544
AM=M+1 // 4545
A=A-1 // 4546
M=D // 4547
@90 // 4548
D=A // 4549
@SP // 4550
AM=M+1 // 4551
A=A-1 // 4552
M=D // 4553
@345 // 4554
D=A // 4555
@SP // 4556
AM=M+1 // 4557
A=A-1 // 4558
M=D // 4559
@35 // 4560
D=A // 4561
@SP // 4562
AM=M+1 // 4563
A=A-1 // 4564
M=D // 4565
// call Screen.drawLine
@9 // 4566
D=A // 4567
@14 // 4568
M=D // 4569
@Screen.drawLine // 4570
D=A // 4571
@13 // 4572
M=D // 4573
@Main.main.ret.7 // 4574
D=A // 4575
@CALL // 4576
0;JMP // 4577
(Main.main.ret.7)
@SP // 4578
M=M-1 // 4579

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4580
D=A // 4581
@SP // 4582
AM=M+1 // 4583
A=A-1 // 4584
M=D // 4585
@35 // 4586
D=A // 4587
@SP // 4588
AM=M+1 // 4589
A=A-1 // 4590
M=D // 4591
@410 // 4592
D=A // 4593
@SP // 4594
AM=M+1 // 4595
A=A-1 // 4596
M=D // 4597
@90 // 4598
D=A // 4599
@SP // 4600
AM=M+1 // 4601
A=A-1 // 4602
M=D // 4603
// call Screen.drawLine
@9 // 4604
D=A // 4605
@14 // 4606
M=D // 4607
@Screen.drawLine // 4608
D=A // 4609
@13 // 4610
M=D // 4611
@Main.main.ret.8 // 4612
D=A // 4613
@CALL // 4614
0;JMP // 4615
(Main.main.ret.8)
@SP // 4616
M=M-1 // 4617

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4618
D=A // 4619
@SP // 4620
AM=M+1 // 4621
A=A-1 // 4622
M=D // 4623
@60 // 4624
D=A // 4625
@SP // 4626
AM=M+1 // 4627
A=A-1 // 4628
M=D // 4629
@30 // 4630
D=A // 4631
@SP // 4632
AM=M+1 // 4633
A=A-1 // 4634
M=D // 4635
// call Screen.drawCircle
@8 // 4636
D=A // 4637
@14 // 4638
M=D // 4639
@Screen.drawCircle // 4640
D=A // 4641
@13 // 4642
M=D // 4643
@Main.main.ret.9 // 4644
D=A // 4645
@CALL // 4646
0;JMP // 4647
(Main.main.ret.9)
@SP // 4648
M=M-1 // 4649

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4650
D=A // 4651
@SP // 4652
AM=M+1 // 4653
A=A-1 // 4654
M=D // 4655
@26 // 4656
D=A // 4657
@SP // 4658
AM=M+1 // 4659
A=A-1 // 4660
M=D // 4661
@140 // 4662
D=A // 4663
@SP // 4664
AM=M+1 // 4665
A=A-1 // 4666
M=D // 4667
@6 // 4668
D=A // 4669
@SP // 4670
AM=M+1 // 4671
A=A-1 // 4672
M=D // 4673
// call Screen.drawLine
@9 // 4674
D=A // 4675
@14 // 4676
M=D // 4677
@Screen.drawLine // 4678
D=A // 4679
@13 // 4680
M=D // 4681
@Main.main.ret.10 // 4682
D=A // 4683
@CALL // 4684
0;JMP // 4685
(Main.main.ret.10)
@SP // 4686
M=M-1 // 4687

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4688
D=A // 4689
@SP // 4690
AM=M+1 // 4691
A=A-1 // 4692
M=D // 4693
@35 // 4694
D=A // 4695
@SP // 4696
AM=M+1 // 4697
A=A-1 // 4698
M=D // 4699
@178 // 4700
D=A // 4701
@SP // 4702
AM=M+1 // 4703
A=A-1 // 4704
M=D // 4705
@20 // 4706
D=A // 4707
@SP // 4708
AM=M+1 // 4709
A=A-1 // 4710
M=D // 4711
// call Screen.drawLine
@9 // 4712
D=A // 4713
@14 // 4714
M=D // 4715
@Screen.drawLine // 4716
D=A // 4717
@13 // 4718
M=D // 4719
@Main.main.ret.11 // 4720
D=A // 4721
@CALL // 4722
0;JMP // 4723
(Main.main.ret.11)
@SP // 4724
M=M-1 // 4725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4726
D=A // 4727
@SP // 4728
AM=M+1 // 4729
A=A-1 // 4730
M=D // 4731
@60 // 4732
D=A // 4733
@SP // 4734
AM=M+1 // 4735
A=A-1 // 4736
M=D // 4737
@194 // 4738
D=A // 4739
@SP // 4740
AM=M+1 // 4741
A=A-1 // 4742
M=D // 4743
@60 // 4744
D=A // 4745
@SP // 4746
AM=M+1 // 4747
A=A-1 // 4748
M=D // 4749
// call Screen.drawLine
@9 // 4750
D=A // 4751
@14 // 4752
M=D // 4753
@Screen.drawLine // 4754
D=A // 4755
@13 // 4756
M=D // 4757
@Main.main.ret.12 // 4758
D=A // 4759
@CALL // 4760
0;JMP // 4761
(Main.main.ret.12)
@SP // 4762
M=M-1 // 4763

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4764
D=A // 4765
@SP // 4766
AM=M+1 // 4767
A=A-1 // 4768
M=D // 4769
@85 // 4770
D=A // 4771
@SP // 4772
AM=M+1 // 4773
A=A-1 // 4774
M=D // 4775
@178 // 4776
D=A // 4777
@SP // 4778
AM=M+1 // 4779
A=A-1 // 4780
M=D // 4781
@100 // 4782
D=A // 4783
@SP // 4784
AM=M+1 // 4785
A=A-1 // 4786
M=D // 4787
// call Screen.drawLine
@9 // 4788
D=A // 4789
@14 // 4790
M=D // 4791
@Screen.drawLine // 4792
D=A // 4793
@13 // 4794
M=D // 4795
@Main.main.ret.13 // 4796
D=A // 4797
@CALL // 4798
0;JMP // 4799
(Main.main.ret.13)
@SP // 4800
M=M-1 // 4801

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4802
D=A // 4803
@SP // 4804
AM=M+1 // 4805
A=A-1 // 4806
M=D // 4807
@94 // 4808
D=A // 4809
@SP // 4810
AM=M+1 // 4811
A=A-1 // 4812
M=D // 4813
@140 // 4814
D=A // 4815
@SP // 4816
AM=M+1 // 4817
A=A-1 // 4818
M=D // 4819
@114 // 4820
D=A // 4821
@SP // 4822
AM=M+1 // 4823
A=A-1 // 4824
M=D // 4825
// call Screen.drawLine
@9 // 4826
D=A // 4827
@14 // 4828
M=D // 4829
@Screen.drawLine // 4830
D=A // 4831
@13 // 4832
M=D // 4833
@Main.main.ret.14 // 4834
D=A // 4835
@CALL // 4836
0;JMP // 4837
(Main.main.ret.14)
@SP // 4838
M=M-1 // 4839

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4840
D=A // 4841
@SP // 4842
AM=M+1 // 4843
A=A-1 // 4844
M=D // 4845
@85 // 4846
D=A // 4847
@SP // 4848
AM=M+1 // 4849
A=A-1 // 4850
M=D // 4851
@102 // 4852
D=A // 4853
@SP // 4854
AM=M+1 // 4855
A=A-1 // 4856
M=D // 4857
@100 // 4858
D=A // 4859
@SP // 4860
AM=M+1 // 4861
A=A-1 // 4862
M=D // 4863
// call Screen.drawLine
@9 // 4864
D=A // 4865
@14 // 4866
M=D // 4867
@Screen.drawLine // 4868
D=A // 4869
@13 // 4870
M=D // 4871
@Main.main.ret.15 // 4872
D=A // 4873
@CALL // 4874
0;JMP // 4875
(Main.main.ret.15)
@SP // 4876
M=M-1 // 4877

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4878
D=A // 4879
@SP // 4880
AM=M+1 // 4881
A=A-1 // 4882
M=D // 4883
@60 // 4884
D=A // 4885
@SP // 4886
AM=M+1 // 4887
A=A-1 // 4888
M=D // 4889
@86 // 4890
D=A // 4891
@SP // 4892
AM=M+1 // 4893
A=A-1 // 4894
M=D // 4895
@60 // 4896
D=A // 4897
@SP // 4898
AM=M+1 // 4899
A=A-1 // 4900
M=D // 4901
// call Screen.drawLine
@9 // 4902
D=A // 4903
@14 // 4904
M=D // 4905
@Screen.drawLine // 4906
D=A // 4907
@13 // 4908
M=D // 4909
@Main.main.ret.16 // 4910
D=A // 4911
@CALL // 4912
0;JMP // 4913
(Main.main.ret.16)
@SP // 4914
M=M-1 // 4915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4916
D=A // 4917
@SP // 4918
AM=M+1 // 4919
A=A-1 // 4920
M=D // 4921
@35 // 4922
D=A // 4923
@SP // 4924
AM=M+1 // 4925
A=A-1 // 4926
M=D // 4927
@102 // 4928
D=A // 4929
@SP // 4930
AM=M+1 // 4931
A=A-1 // 4932
M=D // 4933
@20 // 4934
D=A // 4935
@SP // 4936
AM=M+1 // 4937
A=A-1 // 4938
M=D // 4939
// call Screen.drawLine
@9 // 4940
D=A // 4941
@14 // 4942
M=D // 4943
@Screen.drawLine // 4944
D=A // 4945
@13 // 4946
M=D // 4947
@Main.main.ret.17 // 4948
D=A // 4949
@CALL // 4950
0;JMP // 4951
(Main.main.ret.17)
@SP // 4952
M=M-1 // 4953

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 4954
D=A // 4955
@SP // 4956
AM=M+1 // 4957
A=A-1 // 4958
M=D // 4959
// call String.new
@6 // 4960
D=A // 4961
@14 // 4962
M=D // 4963
@String.new // 4964
D=A // 4965
@13 // 4966
M=D // 4967
@Main.main.ret.18 // 4968
D=A // 4969
@CALL // 4970
0;JMP // 4971
(Main.main.ret.18)
@72 // 4972
D=A // 4973
@SP // 4974
AM=M+1 // 4975
A=A-1 // 4976
M=D // 4977
// call String.appendChar
@7 // 4978
D=A // 4979
@14 // 4980
M=D // 4981
@String.appendChar // 4982
D=A // 4983
@13 // 4984
M=D // 4985
@Main.main.ret.19 // 4986
D=A // 4987
@CALL // 4988
0;JMP // 4989
(Main.main.ret.19)
@101 // 4990
D=A // 4991
@SP // 4992
AM=M+1 // 4993
A=A-1 // 4994
M=D // 4995
// call String.appendChar
@7 // 4996
D=A // 4997
@14 // 4998
M=D // 4999
@String.appendChar // 5000
D=A // 5001
@13 // 5002
M=D // 5003
@Main.main.ret.20 // 5004
D=A // 5005
@CALL // 5006
0;JMP // 5007
(Main.main.ret.20)
@108 // 5008
D=A // 5009
@SP // 5010
AM=M+1 // 5011
A=A-1 // 5012
M=D // 5013
// call String.appendChar
@7 // 5014
D=A // 5015
@14 // 5016
M=D // 5017
@String.appendChar // 5018
D=A // 5019
@13 // 5020
M=D // 5021
@Main.main.ret.21 // 5022
D=A // 5023
@CALL // 5024
0;JMP // 5025
(Main.main.ret.21)
@108 // 5026
D=A // 5027
@SP // 5028
AM=M+1 // 5029
A=A-1 // 5030
M=D // 5031
// call String.appendChar
@7 // 5032
D=A // 5033
@14 // 5034
M=D // 5035
@String.appendChar // 5036
D=A // 5037
@13 // 5038
M=D // 5039
@Main.main.ret.22 // 5040
D=A // 5041
@CALL // 5042
0;JMP // 5043
(Main.main.ret.22)
@111 // 5044
D=A // 5045
@SP // 5046
AM=M+1 // 5047
A=A-1 // 5048
M=D // 5049
// call String.appendChar
@7 // 5050
D=A // 5051
@14 // 5052
M=D // 5053
@String.appendChar // 5054
D=A // 5055
@13 // 5056
M=D // 5057
@Main.main.ret.23 // 5058
D=A // 5059
@CALL // 5060
0;JMP // 5061
(Main.main.ret.23)
@44 // 5062
D=A // 5063
@SP // 5064
AM=M+1 // 5065
A=A-1 // 5066
M=D // 5067
// call String.appendChar
@7 // 5068
D=A // 5069
@14 // 5070
M=D // 5071
@String.appendChar // 5072
D=A // 5073
@13 // 5074
M=D // 5075
@Main.main.ret.24 // 5076
D=A // 5077
@CALL // 5078
0;JMP // 5079
(Main.main.ret.24)
@32 // 5080
D=A // 5081
@SP // 5082
AM=M+1 // 5083
A=A-1 // 5084
M=D // 5085
// call String.appendChar
@7 // 5086
D=A // 5087
@14 // 5088
M=D // 5089
@String.appendChar // 5090
D=A // 5091
@13 // 5092
M=D // 5093
@Main.main.ret.25 // 5094
D=A // 5095
@CALL // 5096
0;JMP // 5097
(Main.main.ret.25)
@119 // 5098
D=A // 5099
@SP // 5100
AM=M+1 // 5101
A=A-1 // 5102
M=D // 5103
// call String.appendChar
@7 // 5104
D=A // 5105
@14 // 5106
M=D // 5107
@String.appendChar // 5108
D=A // 5109
@13 // 5110
M=D // 5111
@Main.main.ret.26 // 5112
D=A // 5113
@CALL // 5114
0;JMP // 5115
(Main.main.ret.26)
@111 // 5116
D=A // 5117
@SP // 5118
AM=M+1 // 5119
A=A-1 // 5120
M=D // 5121
// call String.appendChar
@7 // 5122
D=A // 5123
@14 // 5124
M=D // 5125
@String.appendChar // 5126
D=A // 5127
@13 // 5128
M=D // 5129
@Main.main.ret.27 // 5130
D=A // 5131
@CALL // 5132
0;JMP // 5133
(Main.main.ret.27)
@114 // 5134
D=A // 5135
@SP // 5136
AM=M+1 // 5137
A=A-1 // 5138
M=D // 5139
// call String.appendChar
@7 // 5140
D=A // 5141
@14 // 5142
M=D // 5143
@String.appendChar // 5144
D=A // 5145
@13 // 5146
M=D // 5147
@Main.main.ret.28 // 5148
D=A // 5149
@CALL // 5150
0;JMP // 5151
(Main.main.ret.28)
@108 // 5152
D=A // 5153
@SP // 5154
AM=M+1 // 5155
A=A-1 // 5156
M=D // 5157
// call String.appendChar
@7 // 5158
D=A // 5159
@14 // 5160
M=D // 5161
@String.appendChar // 5162
D=A // 5163
@13 // 5164
M=D // 5165
@Main.main.ret.29 // 5166
D=A // 5167
@CALL // 5168
0;JMP // 5169
(Main.main.ret.29)
@100 // 5170
D=A // 5171
@SP // 5172
AM=M+1 // 5173
A=A-1 // 5174
M=D // 5175
// call String.appendChar
@7 // 5176
D=A // 5177
@14 // 5178
M=D // 5179
@String.appendChar // 5180
D=A // 5181
@13 // 5182
M=D // 5183
@Main.main.ret.30 // 5184
D=A // 5185
@CALL // 5186
0;JMP // 5187
(Main.main.ret.30)
@33 // 5188
D=A // 5189
@SP // 5190
AM=M+1 // 5191
A=A-1 // 5192
M=D // 5193
// call String.appendChar
@7 // 5194
D=A // 5195
@14 // 5196
M=D // 5197
@String.appendChar // 5198
D=A // 5199
@13 // 5200
M=D // 5201
@Main.main.ret.31 // 5202
D=A // 5203
@CALL // 5204
0;JMP // 5205
(Main.main.ret.31)
@SP // 5206
AM=M-1 // 5207
D=M // 5208
@LCL // 5209
A=M // 5210
M=D // 5211

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5212
A=M // 5213
D=M // 5214
@SP // 5215
AM=M+1 // 5216
A=A-1 // 5217
M=D // 5218
// call Output.printString
@6 // 5219
D=A // 5220
@14 // 5221
M=D // 5222
@Output.printString // 5223
D=A // 5224
@13 // 5225
M=D // 5226
@Main.main.ret.32 // 5227
D=A // 5228
@CALL // 5229
0;JMP // 5230
(Main.main.ret.32)
@SP // 5231
M=M-1 // 5232

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5233
D=A // 5234
@14 // 5235
M=D // 5236
@Output.println // 5237
D=A // 5238
@13 // 5239
M=D // 5240
@Main.main.ret.33 // 5241
D=A // 5242
@CALL // 5243
0;JMP // 5244
(Main.main.ret.33)
@SP // 5245
M=M-1 // 5246

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5247
A=M // 5248
D=M // 5249
@SP // 5250
AM=M+1 // 5251
A=A-1 // 5252
M=D // 5253
// call String.dispose
@6 // 5254
D=A // 5255
@14 // 5256
M=D // 5257
@String.dispose // 5258
D=A // 5259
@13 // 5260
M=D // 5261
@Main.main.ret.34 // 5262
D=A // 5263
@CALL // 5264
0;JMP // 5265
(Main.main.ret.34)
@SP // 5266
M=M-1 // 5267

////PushInstruction("constant 0")
@SP // 5268
AM=M+1 // 5269
A=A-1 // 5270
M=0 // 5271
@RETURN // 5272
0;JMP // 5273

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5274
@Sys.halt_WHILE_END1 // 5275
D;JNE // 5276

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5277
0;JMP // 5278

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5279
AM=M+1 // 5280
A=A-1 // 5281
M=0 // 5282
@RETURN // 5283
0;JMP // 5284

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5285
D=A // 5286
@SP // 5287
AM=D+M // 5288
A=A-1 // 5289
M=0 // 5290
A=A-1 // 5291
M=0 // 5292
A=A-1 // 5293
M=0 // 5294
A=A-1 // 5295
M=0 // 5296

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5297
A=M // 5298
D=M // 5299
@SP // 5300
AM=M+1 // 5301
A=A-1 // 5302
M=D // 5303
// call Output.getMap
@6 // 5304
D=A // 5305
@14 // 5306
M=D // 5307
@Output.getMap // 5308
D=A // 5309
@13 // 5310
M=D // 5311
@Output.printChar.ret.0 // 5312
D=A // 5313
@CALL // 5314
0;JMP // 5315
(Output.printChar.ret.0)
@SP // 5316
AM=M-1 // 5317
D=M // 5318
@LCL // 5319
A=M // 5320
M=D // 5321

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5322
A=M+1 // 5323
A=A+1 // 5324
A=A+1 // 5325
M=0 // 5326

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
@Output.printChar.LT.50 // 5327
D=A // 5328
@SP // 5329
AM=M+1 // 5330
A=A-1 // 5331
M=D // 5332
@LCL // 5333
A=M+1 // 5334
A=A+1 // 5335
A=A+1 // 5336
D=M // 5337
@11 // 5338
D=D-A // 5339
@DO_LT // 5340
0;JMP // 5341
(Output.printChar.LT.50)
D=!D // 5342
@Output.printChar_WHILE_END1 // 5343
D;JNE // 5344

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

@Output.2 // 5345
D=M // 5346
@SP // 5347
AM=M+1 // 5348
A=A-1 // 5349
M=D // 5350
@11 // 5351
D=A // 5352
@SP // 5353
AM=M+1 // 5354
A=A-1 // 5355
M=D // 5356
// call Math.multiply
@7 // 5357
D=A // 5358
@14 // 5359
M=D // 5360
@Math.multiply // 5361
D=A // 5362
@13 // 5363
M=D // 5364
@Output.printChar.ret.1 // 5365
D=A // 5366
@CALL // 5367
0;JMP // 5368
(Output.printChar.ret.1)
@LCL // 5369
A=M+1 // 5370
A=A+1 // 5371
A=A+1 // 5372
D=M // 5373
@SP // 5374
AM=M-1 // 5375
D=D+M // 5376
@SP // 5377
AM=M+1 // 5378
A=A-1 // 5379
M=D // 5380
@32 // 5381
D=A // 5382
@SP // 5383
AM=M+1 // 5384
A=A-1 // 5385
M=D // 5386
// call Math.multiply
@7 // 5387
D=A // 5388
@14 // 5389
M=D // 5390
@Math.multiply // 5391
D=A // 5392
@13 // 5393
M=D // 5394
@Output.printChar.ret.2 // 5395
D=A // 5396
@CALL // 5397
0;JMP // 5398
(Output.printChar.ret.2)
@SP // 5399
AM=M-1 // 5400
D=M // 5401
@16384 // 5402
D=D+A // 5403
@SP // 5404
AM=M+1 // 5405
A=A-1 // 5406
M=D // 5407
@Output.1 // 5408
D=M // 5409
@SP // 5410
AM=M+1 // 5411
A=A-1 // 5412
M=D // 5413
@2 // 5414
D=A // 5415
@SP // 5416
AM=M+1 // 5417
A=A-1 // 5418
M=D // 5419
// call Math.divide
@7 // 5420
D=A // 5421
@14 // 5422
M=D // 5423
@Math.divide // 5424
D=A // 5425
@13 // 5426
M=D // 5427
@Output.printChar.ret.3 // 5428
D=A // 5429
@CALL // 5430
0;JMP // 5431
(Output.printChar.ret.3)
@SP // 5432
AM=M-1 // 5433
D=M // 5434
@SP // 5435
AM=M-1 // 5436
D=D+M // 5437
@LCL // 5438
A=M+1 // 5439
M=D // 5440

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
@Output.printChar.EQ.51 // 5441
D=A // 5442
@SP // 5443
AM=M+1 // 5444
A=A-1 // 5445
M=D // 5446
@Output.1 // 5447
D=M // 5448
@1 // 5449
D=D&A // 5450
@DO_EQ // 5451
0;JMP // 5452
(Output.printChar.EQ.51)
@Output.printChar$IF_TRUE1 // 5453
D;JNE // 5454

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5455
0;JMP // 5456

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

@LCL // 5457
A=M+1 // 5458
A=A+1 // 5459
A=A+1 // 5460
D=M // 5461
A=A-1 // 5462
A=A-1 // 5463
A=A-1 // 5464
A=D+M // 5465
D=M // 5466
@LCL // 5467
A=M+1 // 5468
A=A+1 // 5469
M=D // 5470

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5471
0;JMP // 5472

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

@LCL // 5473
A=M+1 // 5474
A=A+1 // 5475
A=A+1 // 5476
D=M // 5477
A=A-1 // 5478
A=A-1 // 5479
A=A-1 // 5480
A=D+M // 5481
D=M // 5482
@SP // 5483
AM=M+1 // 5484
A=A-1 // 5485
M=D // 5486
@256 // 5487
D=A // 5488
@SP // 5489
AM=M+1 // 5490
A=A-1 // 5491
M=D // 5492
// call Math.multiply
@7 // 5493
D=A // 5494
@14 // 5495
M=D // 5496
@Math.multiply // 5497
D=A // 5498
@13 // 5499
M=D // 5500
@Output.printChar.ret.4 // 5501
D=A // 5502
@CALL // 5503
0;JMP // 5504
(Output.printChar.ret.4)
@SP // 5505
AM=M-1 // 5506
D=M // 5507
@LCL // 5508
A=M+1 // 5509
A=A+1 // 5510
M=D // 5511

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
@LCL // 5512
A=M+1 // 5513
D=M // 5514
@SP // 5515
AM=M+1 // 5516
A=A-1 // 5517
M=D // 5518
@LCL // 5519
A=M+1 // 5520
D=M // 5521
@0 // 5522
A=D+A // 5523
D=M // 5524
@SP // 5525
AM=M+1 // 5526
A=A-1 // 5527
M=D // 5528
@LCL // 5529
A=M+1 // 5530
A=A+1 // 5531
D=M // 5532
@SP // 5533
AM=M-1 // 5534
D=D|M // 5535
@SP // 5536
AM=M-1 // 5537
A=M // 5538
M=D // 5539

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

@LCL // 5540
A=M+1 // 5541
A=A+1 // 5542
A=A+1 // 5543
M=M+1 // 5544

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5545
0;JMP // 5546

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
@Output.printChar.EQ.52 // 5547
D=A // 5548
@SP // 5549
AM=M+1 // 5550
A=A-1 // 5551
M=D // 5552
@Output.1 // 5553
D=M // 5554
@63 // 5555
D=D-A // 5556
@DO_EQ // 5557
0;JMP // 5558
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE2 // 5559
D;JNE // 5560

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5561
0;JMP // 5562

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5563
D=A // 5564
@14 // 5565
M=D // 5566
@Output.println // 5567
D=A // 5568
@13 // 5569
M=D // 5570
@Output.printChar.ret.5 // 5571
D=A // 5572
@CALL // 5573
0;JMP // 5574
(Output.printChar.ret.5)
@SP // 5575
M=M-1 // 5576

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5577
0;JMP // 5578

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

@Output.1 // 5579
M=M+1 // 5580

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5581
AM=M+1 // 5582
A=A-1 // 5583
M=0 // 5584
@RETURN // 5585
0;JMP // 5586

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
@Memory.remove_node.EQ.53 // 5587
D=A // 5588
@SP // 5589
AM=M+1 // 5590
A=A-1 // 5591
M=D // 5592
@ARG // 5593
A=M+1 // 5594
D=M // 5595
@2 // 5596
A=D+A // 5597
D=M // 5598
@DO_EQ // 5599
0;JMP // 5600
(Memory.remove_node.EQ.53)
D=!D // 5601
@Memory.remove_node$IF_TRUE1 // 5602
D;JNE // 5603

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5604
0;JMP // 5605

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
@ARG // 5606
A=M+1 // 5607
D=M // 5608
@2 // 5609
A=D+A // 5610
D=M // 5611
@3 // 5612
D=D+A // 5613
@SP // 5614
AM=M+1 // 5615
A=A-1 // 5616
M=D // 5617
@ARG // 5618
A=M+1 // 5619
D=M // 5620
@3 // 5621
A=D+A // 5622
D=M // 5623
@SP // 5624
AM=M-1 // 5625
A=M // 5626
M=D // 5627

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5628
0;JMP // 5629

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
@ARG // 5630
A=M // 5631
D=M // 5632
@SP // 5633
AM=M+1 // 5634
A=A-1 // 5635
M=D // 5636
@ARG // 5637
A=M+1 // 5638
D=M // 5639
@3 // 5640
A=D+A // 5641
D=M // 5642
@SP // 5643
AM=M-1 // 5644
A=M // 5645
M=D // 5646

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
@Memory.remove_node.EQ.54 // 5647
D=A // 5648
@SP // 5649
AM=M+1 // 5650
A=A-1 // 5651
M=D // 5652
@ARG // 5653
A=M+1 // 5654
D=M // 5655
@3 // 5656
A=D+A // 5657
D=M // 5658
@DO_EQ // 5659
0;JMP // 5660
(Memory.remove_node.EQ.54)
D=!D // 5661
@Memory.remove_node$IF_TRUE2 // 5662
D;JNE // 5663

////GotoInstruction{label='Memory.remove_node$IF_FALSE2}
// goto Memory.remove_node$IF_FALSE2
@Memory.remove_node$IF_FALSE2 // 5664
0;JMP // 5665

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
@ARG // 5666
A=M+1 // 5667
D=M // 5668
@3 // 5669
A=D+A // 5670
D=M // 5671
@2 // 5672
D=D+A // 5673
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=D // 5677
@ARG // 5678
A=M+1 // 5679
D=M // 5680
@2 // 5681
A=D+A // 5682
D=M // 5683
@SP // 5684
AM=M-1 // 5685
A=M // 5686
M=D // 5687

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
@ARG // 5688
A=M+1 // 5689
D=M // 5690
@2 // 5691
D=D+A // 5692
@SP // 5693
AM=M+1 // 5694
A=A-1 // 5695
M=D // 5696
D=0 // 5697
@SP // 5698
AM=M-1 // 5699
A=M // 5700
M=D // 5701

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5702
A=M+1 // 5703
D=M // 5704
@3 // 5705
D=D+A // 5706
@SP // 5707
AM=M+1 // 5708
A=A-1 // 5709
M=D // 5710
D=0 // 5711
@SP // 5712
AM=M-1 // 5713
A=M // 5714
M=D // 5715

////PushInstruction("constant 0")
@SP // 5716
AM=M+1 // 5717
A=A-1 // 5718
M=0 // 5719
@RETURN // 5720
0;JMP // 5721

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5722
AM=M+1 // 5723
A=A-1 // 5724
M=0 // 5725

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5726
D=A // 5727
@SP // 5728
AM=M+1 // 5729
A=A-1 // 5730
M=D // 5731
// call Memory.alloc
@6 // 5732
D=A // 5733
@14 // 5734
M=D // 5735
@Memory.alloc // 5736
D=A // 5737
@13 // 5738
M=D // 5739
@Output.init.ret.0 // 5740
D=A // 5741
@CALL // 5742
0;JMP // 5743
(Output.init.ret.0)
@SP // 5744
AM=M-1 // 5745
D=M // 5746
@Output.0 // 5747
M=D // 5748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5749
D=A // 5750
@SP // 5751
M=D+M // 5752
@63 // 5753
D=A // 5754
@SP // 5755
A=M-1 // 5756
M=0 // 5757
A=A-1 // 5758
M=0 // 5759
A=A-1 // 5760
M=D // 5761
A=A-1 // 5762
M=D // 5763
A=A-1 // 5764
M=D // 5765
A=A-1 // 5766
M=D // 5767
A=A-1 // 5768
M=D // 5769
A=A-1 // 5770
M=D // 5771
A=A-1 // 5772
M=D // 5773
A=A-1 // 5774
M=D // 5775
A=A-1 // 5776
M=D // 5777
A=A-1 // 5778
M=0 // 5779
// call Output.create
@17 // 5780
D=A // 5781
@14 // 5782
M=D // 5783
@Output.create // 5784
D=A // 5785
@13 // 5786
M=D // 5787
@Output.init.ret.1 // 5788
D=A // 5789
@CALL // 5790
0;JMP // 5791
(Output.init.ret.1)
@SP // 5792
M=M-1 // 5793

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5794
D=A // 5795
@SP // 5796
M=D+M // 5797
@32 // 5798
D=A // 5799
@SP // 5800
A=M-1 // 5801
M=0 // 5802
A=A-1 // 5803
M=0 // 5804
A=A-1 // 5805
M=0 // 5806
A=A-1 // 5807
M=0 // 5808
A=A-1 // 5809
M=0 // 5810
A=A-1 // 5811
M=0 // 5812
A=A-1 // 5813
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
M=D // 5824
A=A-1 // 5825
// call Output.create
@17 // 5826
D=A // 5827
@14 // 5828
M=D // 5829
@Output.create // 5830
D=A // 5831
@13 // 5832
M=D // 5833
@Output.init.ret.2 // 5834
D=A // 5835
@CALL // 5836
0;JMP // 5837
(Output.init.ret.2)
@SP // 5838
M=M-1 // 5839

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5840
D=A // 5841
@SP // 5842
AM=M+1 // 5843
A=A-1 // 5844
M=D // 5845
@12 // 5846
D=A // 5847
@SP // 5848
AM=M+1 // 5849
A=A-1 // 5850
M=D // 5851
@30 // 5852
D=A // 5853
@SP // 5854
AM=M+1 // 5855
A=A-1 // 5856
M=D // 5857
@30 // 5858
D=A // 5859
@SP // 5860
AM=M+1 // 5861
A=A-1 // 5862
M=D // 5863
@30 // 5864
D=A // 5865
@SP // 5866
AM=M+1 // 5867
A=A-1 // 5868
M=D // 5869
@12 // 5870
D=A // 5871
@SP // 5872
AM=M+1 // 5873
A=A-1 // 5874
M=D // 5875
@12 // 5876
D=A // 5877
@SP // 5878
AM=M+1 // 5879
A=A-1 // 5880
M=D // 5881
@SP // 5882
AM=M+1 // 5883
A=A-1 // 5884
M=0 // 5885
@4 // 5886
D=A // 5887
@SP // 5888
M=D+M // 5889
@12 // 5890
D=A // 5891
@SP // 5892
A=M-1 // 5893
M=0 // 5894
A=A-1 // 5895
M=0 // 5896
A=A-1 // 5897
M=D // 5898
A=A-1 // 5899
M=D // 5900
A=A-1 // 5901
// call Output.create
@17 // 5902
D=A // 5903
@14 // 5904
M=D // 5905
@Output.create // 5906
D=A // 5907
@13 // 5908
M=D // 5909
@Output.init.ret.3 // 5910
D=A // 5911
@CALL // 5912
0;JMP // 5913
(Output.init.ret.3)
@SP // 5914
M=M-1 // 5915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5916
D=A // 5917
@SP // 5918
AM=M+1 // 5919
A=A-1 // 5920
M=D // 5921
@54 // 5922
D=A // 5923
@SP // 5924
AM=M+1 // 5925
A=A-1 // 5926
M=D // 5927
@54 // 5928
D=A // 5929
@SP // 5930
AM=M+1 // 5931
A=A-1 // 5932
M=D // 5933
@20 // 5934
D=A // 5935
@SP // 5936
AM=M+1 // 5937
A=A-1 // 5938
M=D // 5939
@SP // 5940
AM=M+1 // 5941
A=A-1 // 5942
M=0 // 5943
@SP // 5944
AM=M+1 // 5945
A=A-1 // 5946
M=0 // 5947
@SP // 5948
AM=M+1 // 5949
A=A-1 // 5950
M=0 // 5951
@SP // 5952
AM=M+1 // 5953
A=A-1 // 5954
M=0 // 5955
@SP // 5956
AM=M+1 // 5957
A=A-1 // 5958
M=0 // 5959
@SP // 5960
AM=M+1 // 5961
A=A-1 // 5962
M=0 // 5963
@SP // 5964
AM=M+1 // 5965
A=A-1 // 5966
M=0 // 5967
@SP // 5968
AM=M+1 // 5969
A=A-1 // 5970
M=0 // 5971
// call Output.create
@17 // 5972
D=A // 5973
@14 // 5974
M=D // 5975
@Output.create // 5976
D=A // 5977
@13 // 5978
M=D // 5979
@Output.init.ret.4 // 5980
D=A // 5981
@CALL // 5982
0;JMP // 5983
(Output.init.ret.4)
@SP // 5984
M=M-1 // 5985

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5986
D=A // 5987
@SP // 5988
M=D+M // 5989
@35 // 5990
D=A // 5991
@SP // 5992
A=M-1 // 5993
M=0 // 5994
A=A-1 // 5995
M=D // 5996
A=A-1 // 5997
@18 // 5998
D=A // 5999
@SP // 6000
AM=M+1 // 6001
A=A-1 // 6002
M=D // 6003
@18 // 6004
D=A // 6005
@SP // 6006
AM=M+1 // 6007
A=A-1 // 6008
M=D // 6009
@63 // 6010
D=A // 6011
@SP // 6012
AM=M+1 // 6013
A=A-1 // 6014
M=D // 6015
@18 // 6016
D=A // 6017
@SP // 6018
AM=M+1 // 6019
A=A-1 // 6020
M=D // 6021
@18 // 6022
D=A // 6023
@SP // 6024
AM=M+1 // 6025
A=A-1 // 6026
M=D // 6027
@63 // 6028
D=A // 6029
@SP // 6030
AM=M+1 // 6031
A=A-1 // 6032
M=D // 6033
@18 // 6034
D=A // 6035
@SP // 6036
AM=M+1 // 6037
A=A-1 // 6038
M=D // 6039
@18 // 6040
D=A // 6041
@SP // 6042
AM=M+1 // 6043
A=A-1 // 6044
M=D // 6045
@SP // 6046
AM=M+1 // 6047
A=A-1 // 6048
M=0 // 6049
@SP // 6050
AM=M+1 // 6051
A=A-1 // 6052
M=0 // 6053
// call Output.create
@17 // 6054
D=A // 6055
@14 // 6056
M=D // 6057
@Output.create // 6058
D=A // 6059
@13 // 6060
M=D // 6061
@Output.init.ret.5 // 6062
D=A // 6063
@CALL // 6064
0;JMP // 6065
(Output.init.ret.5)
@SP // 6066
M=M-1 // 6067

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6068
D=A // 6069
@SP // 6070
AM=M+1 // 6071
A=A-1 // 6072
M=D // 6073
@12 // 6074
D=A // 6075
@SP // 6076
AM=M+1 // 6077
A=A-1 // 6078
M=D // 6079
@30 // 6080
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
@3 // 6092
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
@48 // 6104
D=A // 6105
@SP // 6106
AM=M+1 // 6107
A=A-1 // 6108
M=D // 6109
@51 // 6110
D=A // 6111
@SP // 6112
AM=M+1 // 6113
A=A-1 // 6114
M=D // 6115
@30 // 6116
D=A // 6117
@SP // 6118
AM=M+1 // 6119
A=A-1 // 6120
M=D // 6121
@12 // 6122
D=A // 6123
@SP // 6124
AM=M+1 // 6125
A=A-1 // 6126
M=D // 6127
@12 // 6128
D=A // 6129
@SP // 6130
AM=M+1 // 6131
A=A-1 // 6132
M=D // 6133
@SP // 6134
AM=M+1 // 6135
A=A-1 // 6136
M=0 // 6137
// call Output.create
@17 // 6138
D=A // 6139
@14 // 6140
M=D // 6141
@Output.create // 6142
D=A // 6143
@13 // 6144
M=D // 6145
@Output.init.ret.6 // 6146
D=A // 6147
@CALL // 6148
0;JMP // 6149
(Output.init.ret.6)
@SP // 6150
M=M-1 // 6151

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6152
D=A // 6153
@SP // 6154
M=D+M // 6155
@37 // 6156
D=A // 6157
@SP // 6158
A=M-1 // 6159
M=0 // 6160
A=A-1 // 6161
M=0 // 6162
A=A-1 // 6163
M=D // 6164
A=A-1 // 6165
@35 // 6166
D=A // 6167
@SP // 6168
AM=M+1 // 6169
A=A-1 // 6170
M=D // 6171
@51 // 6172
D=A // 6173
@SP // 6174
AM=M+1 // 6175
A=A-1 // 6176
M=D // 6177
@24 // 6178
D=A // 6179
@SP // 6180
AM=M+1 // 6181
A=A-1 // 6182
M=D // 6183
@12 // 6184
D=A // 6185
@SP // 6186
AM=M+1 // 6187
A=A-1 // 6188
M=D // 6189
@6 // 6190
D=A // 6191
@SP // 6192
AM=M+1 // 6193
A=A-1 // 6194
M=D // 6195
@51 // 6196
D=A // 6197
@SP // 6198
AM=M+1 // 6199
A=A-1 // 6200
M=D // 6201
@49 // 6202
D=A // 6203
@SP // 6204
AM=M+1 // 6205
A=A-1 // 6206
M=D // 6207
@SP // 6208
AM=M+1 // 6209
A=A-1 // 6210
M=0 // 6211
@SP // 6212
AM=M+1 // 6213
A=A-1 // 6214
M=0 // 6215
// call Output.create
@17 // 6216
D=A // 6217
@14 // 6218
M=D // 6219
@Output.create // 6220
D=A // 6221
@13 // 6222
M=D // 6223
@Output.init.ret.7 // 6224
D=A // 6225
@CALL // 6226
0;JMP // 6227
(Output.init.ret.7)
@SP // 6228
M=M-1 // 6229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6230
D=A // 6231
@SP // 6232
AM=M+1 // 6233
A=A-1 // 6234
M=D // 6235
@12 // 6236
D=A // 6237
@SP // 6238
AM=M+1 // 6239
A=A-1 // 6240
M=D // 6241
@30 // 6242
D=A // 6243
@SP // 6244
AM=M+1 // 6245
A=A-1 // 6246
M=D // 6247
@30 // 6248
D=A // 6249
@SP // 6250
AM=M+1 // 6251
A=A-1 // 6252
M=D // 6253
@12 // 6254
D=A // 6255
@SP // 6256
AM=M+1 // 6257
A=A-1 // 6258
M=D // 6259
@54 // 6260
D=A // 6261
@SP // 6262
AM=M+1 // 6263
A=A-1 // 6264
M=D // 6265
@27 // 6266
D=A // 6267
@SP // 6268
AM=M+1 // 6269
A=A-1 // 6270
M=D // 6271
@27 // 6272
D=A // 6273
@SP // 6274
AM=M+1 // 6275
A=A-1 // 6276
M=D // 6277
@27 // 6278
D=A // 6279
@SP // 6280
AM=M+1 // 6281
A=A-1 // 6282
M=D // 6283
@54 // 6284
D=A // 6285
@SP // 6286
AM=M+1 // 6287
A=A-1 // 6288
M=D // 6289
@SP // 6290
AM=M+1 // 6291
A=A-1 // 6292
M=0 // 6293
@SP // 6294
AM=M+1 // 6295
A=A-1 // 6296
M=0 // 6297
// call Output.create
@17 // 6298
D=A // 6299
@14 // 6300
M=D // 6301
@Output.create // 6302
D=A // 6303
@13 // 6304
M=D // 6305
@Output.init.ret.8 // 6306
D=A // 6307
@CALL // 6308
0;JMP // 6309
(Output.init.ret.8)
@SP // 6310
M=M-1 // 6311

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6312
D=A // 6313
@SP // 6314
AM=M+1 // 6315
A=A-1 // 6316
M=D // 6317
@12 // 6318
D=A // 6319
@SP // 6320
AM=M+1 // 6321
A=A-1 // 6322
M=D // 6323
@12 // 6324
D=A // 6325
@SP // 6326
AM=M+1 // 6327
A=A-1 // 6328
M=D // 6329
@6 // 6330
D=A // 6331
@SP // 6332
AM=M+1 // 6333
A=A-1 // 6334
M=D // 6335
@SP // 6336
AM=M+1 // 6337
A=A-1 // 6338
M=0 // 6339
@SP // 6340
AM=M+1 // 6341
A=A-1 // 6342
M=0 // 6343
@SP // 6344
AM=M+1 // 6345
A=A-1 // 6346
M=0 // 6347
@SP // 6348
AM=M+1 // 6349
A=A-1 // 6350
M=0 // 6351
@SP // 6352
AM=M+1 // 6353
A=A-1 // 6354
M=0 // 6355
@SP // 6356
AM=M+1 // 6357
A=A-1 // 6358
M=0 // 6359
@SP // 6360
AM=M+1 // 6361
A=A-1 // 6362
M=0 // 6363
@SP // 6364
AM=M+1 // 6365
A=A-1 // 6366
M=0 // 6367
// call Output.create
@17 // 6368
D=A // 6369
@14 // 6370
M=D // 6371
@Output.create // 6372
D=A // 6373
@13 // 6374
M=D // 6375
@Output.init.ret.9 // 6376
D=A // 6377
@CALL // 6378
0;JMP // 6379
(Output.init.ret.9)
@SP // 6380
M=M-1 // 6381

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6382
D=A // 6383
@SP // 6384
AM=M+1 // 6385
A=A-1 // 6386
M=D // 6387
@24 // 6388
D=A // 6389
@SP // 6390
AM=M+1 // 6391
A=A-1 // 6392
M=D // 6393
@12 // 6394
D=A // 6395
@SP // 6396
AM=M+1 // 6397
A=A-1 // 6398
M=D // 6399
@6 // 6400
D=A // 6401
@SP // 6402
AM=M+1 // 6403
A=A-1 // 6404
M=D // 6405
@6 // 6406
D=A // 6407
@SP // 6408
AM=M+1 // 6409
A=A-1 // 6410
M=D // 6411
@6 // 6412
D=A // 6413
@SP // 6414
AM=M+1 // 6415
A=A-1 // 6416
M=D // 6417
@6 // 6418
D=A // 6419
@SP // 6420
AM=M+1 // 6421
A=A-1 // 6422
M=D // 6423
@6 // 6424
D=A // 6425
@SP // 6426
AM=M+1 // 6427
A=A-1 // 6428
M=D // 6429
@12 // 6430
D=A // 6431
@SP // 6432
AM=M+1 // 6433
A=A-1 // 6434
M=D // 6435
@24 // 6436
D=A // 6437
@SP // 6438
AM=M+1 // 6439
A=A-1 // 6440
M=D // 6441
@SP // 6442
AM=M+1 // 6443
A=A-1 // 6444
M=0 // 6445
@SP // 6446
AM=M+1 // 6447
A=A-1 // 6448
M=0 // 6449
// call Output.create
@17 // 6450
D=A // 6451
@14 // 6452
M=D // 6453
@Output.create // 6454
D=A // 6455
@13 // 6456
M=D // 6457
@Output.init.ret.10 // 6458
D=A // 6459
@CALL // 6460
0;JMP // 6461
(Output.init.ret.10)
@SP // 6462
M=M-1 // 6463

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6464
D=A // 6465
@SP // 6466
AM=M+1 // 6467
A=A-1 // 6468
M=D // 6469
@6 // 6470
D=A // 6471
@SP // 6472
AM=M+1 // 6473
A=A-1 // 6474
M=D // 6475
@12 // 6476
D=A // 6477
@SP // 6478
AM=M+1 // 6479
A=A-1 // 6480
M=D // 6481
@24 // 6482
D=A // 6483
@SP // 6484
AM=M+1 // 6485
A=A-1 // 6486
M=D // 6487
@24 // 6488
D=A // 6489
@SP // 6490
AM=M+1 // 6491
A=A-1 // 6492
M=D // 6493
@24 // 6494
D=A // 6495
@SP // 6496
AM=M+1 // 6497
A=A-1 // 6498
M=D // 6499
@24 // 6500
D=A // 6501
@SP // 6502
AM=M+1 // 6503
A=A-1 // 6504
M=D // 6505
@24 // 6506
D=A // 6507
@SP // 6508
AM=M+1 // 6509
A=A-1 // 6510
M=D // 6511
@12 // 6512
D=A // 6513
@SP // 6514
AM=M+1 // 6515
A=A-1 // 6516
M=D // 6517
@6 // 6518
D=A // 6519
@SP // 6520
AM=M+1 // 6521
A=A-1 // 6522
M=D // 6523
@SP // 6524
AM=M+1 // 6525
A=A-1 // 6526
M=0 // 6527
@SP // 6528
AM=M+1 // 6529
A=A-1 // 6530
M=0 // 6531
// call Output.create
@17 // 6532
D=A // 6533
@14 // 6534
M=D // 6535
@Output.create // 6536
D=A // 6537
@13 // 6538
M=D // 6539
@Output.init.ret.11 // 6540
D=A // 6541
@CALL // 6542
0;JMP // 6543
(Output.init.ret.11)
@SP // 6544
M=M-1 // 6545

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6546
D=A // 6547
@SP // 6548
M=D+M // 6549
@42 // 6550
D=A // 6551
@SP // 6552
A=M-1 // 6553
M=0 // 6554
A=A-1 // 6555
M=0 // 6556
A=A-1 // 6557
M=0 // 6558
A=A-1 // 6559
M=D // 6560
A=A-1 // 6561
@51 // 6562
D=A // 6563
@SP // 6564
AM=M+1 // 6565
A=A-1 // 6566
M=D // 6567
@30 // 6568
D=A // 6569
@SP // 6570
AM=M+1 // 6571
A=A-1 // 6572
M=D // 6573
@63 // 6574
D=A // 6575
@SP // 6576
AM=M+1 // 6577
A=A-1 // 6578
M=D // 6579
@30 // 6580
D=A // 6581
@SP // 6582
AM=M+1 // 6583
A=A-1 // 6584
M=D // 6585
@51 // 6586
D=A // 6587
@SP // 6588
AM=M+1 // 6589
A=A-1 // 6590
M=D // 6591
@SP // 6592
AM=M+1 // 6593
A=A-1 // 6594
M=0 // 6595
@SP // 6596
AM=M+1 // 6597
A=A-1 // 6598
M=0 // 6599
@SP // 6600
AM=M+1 // 6601
A=A-1 // 6602
M=0 // 6603
// call Output.create
@17 // 6604
D=A // 6605
@14 // 6606
M=D // 6607
@Output.create // 6608
D=A // 6609
@13 // 6610
M=D // 6611
@Output.init.ret.12 // 6612
D=A // 6613
@CALL // 6614
0;JMP // 6615
(Output.init.ret.12)
@SP // 6616
M=M-1 // 6617

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6618
D=A // 6619
@SP // 6620
M=D+M // 6621
@43 // 6622
D=A // 6623
@SP // 6624
A=M-1 // 6625
M=0 // 6626
A=A-1 // 6627
M=0 // 6628
A=A-1 // 6629
M=0 // 6630
A=A-1 // 6631
M=D // 6632
A=A-1 // 6633
@12 // 6634
D=A // 6635
@SP // 6636
AM=M+1 // 6637
A=A-1 // 6638
M=D // 6639
@12 // 6640
D=A // 6641
@SP // 6642
AM=M+1 // 6643
A=A-1 // 6644
M=D // 6645
@63 // 6646
D=A // 6647
@SP // 6648
AM=M+1 // 6649
A=A-1 // 6650
M=D // 6651
@12 // 6652
D=A // 6653
@SP // 6654
AM=M+1 // 6655
A=A-1 // 6656
M=D // 6657
@12 // 6658
D=A // 6659
@SP // 6660
AM=M+1 // 6661
A=A-1 // 6662
M=D // 6663
@SP // 6664
AM=M+1 // 6665
A=A-1 // 6666
M=0 // 6667
@SP // 6668
AM=M+1 // 6669
A=A-1 // 6670
M=0 // 6671
@SP // 6672
AM=M+1 // 6673
A=A-1 // 6674
M=0 // 6675
// call Output.create
@17 // 6676
D=A // 6677
@14 // 6678
M=D // 6679
@Output.create // 6680
D=A // 6681
@13 // 6682
M=D // 6683
@Output.init.ret.13 // 6684
D=A // 6685
@CALL // 6686
0;JMP // 6687
(Output.init.ret.13)
@SP // 6688
M=M-1 // 6689

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6690
D=A // 6691
@SP // 6692
M=D+M // 6693
@44 // 6694
D=A // 6695
@SP // 6696
A=M-1 // 6697
M=0 // 6698
A=A-1 // 6699
M=0 // 6700
A=A-1 // 6701
M=0 // 6702
A=A-1 // 6703
M=0 // 6704
A=A-1 // 6705
M=0 // 6706
A=A-1 // 6707
M=0 // 6708
A=A-1 // 6709
M=0 // 6710
A=A-1 // 6711
M=D // 6712
A=A-1 // 6713
@12 // 6714
D=A // 6715
@SP // 6716
AM=M+1 // 6717
A=A-1 // 6718
M=D // 6719
@12 // 6720
D=A // 6721
@SP // 6722
AM=M+1 // 6723
A=A-1 // 6724
M=D // 6725
@6 // 6726
D=A // 6727
@SP // 6728
AM=M+1 // 6729
A=A-1 // 6730
M=D // 6731
@SP // 6732
AM=M+1 // 6733
A=A-1 // 6734
M=0 // 6735
// call Output.create
@17 // 6736
D=A // 6737
@14 // 6738
M=D // 6739
@Output.create // 6740
D=A // 6741
@13 // 6742
M=D // 6743
@Output.init.ret.14 // 6744
D=A // 6745
@CALL // 6746
0;JMP // 6747
(Output.init.ret.14)
@SP // 6748
M=M-1 // 6749

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6750
D=A // 6751
@SP // 6752
M=D+M // 6753
@45 // 6754
D=A // 6755
@SP // 6756
A=M-1 // 6757
M=0 // 6758
A=A-1 // 6759
M=0 // 6760
A=A-1 // 6761
M=0 // 6762
A=A-1 // 6763
M=0 // 6764
A=A-1 // 6765
M=0 // 6766
A=A-1 // 6767
M=D // 6768
A=A-1 // 6769
@6 // 6770
D=A // 6771
@SP // 6772
M=D+M // 6773
@63 // 6774
D=A // 6775
@SP // 6776
A=M-1 // 6777
M=0 // 6778
A=A-1 // 6779
M=0 // 6780
A=A-1 // 6781
M=0 // 6782
A=A-1 // 6783
M=0 // 6784
A=A-1 // 6785
M=0 // 6786
A=A-1 // 6787
M=D // 6788
A=A-1 // 6789
// call Output.create
@17 // 6790
D=A // 6791
@14 // 6792
M=D // 6793
@Output.create // 6794
D=A // 6795
@13 // 6796
M=D // 6797
@Output.init.ret.15 // 6798
D=A // 6799
@CALL // 6800
0;JMP // 6801
(Output.init.ret.15)
@SP // 6802
M=M-1 // 6803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6804
D=A // 6805
@SP // 6806
M=D+M // 6807
@46 // 6808
D=A // 6809
@SP // 6810
A=M-1 // 6811
M=0 // 6812
A=A-1 // 6813
M=0 // 6814
A=A-1 // 6815
M=0 // 6816
A=A-1 // 6817
M=0 // 6818
A=A-1 // 6819
M=0 // 6820
A=A-1 // 6821
M=0 // 6822
A=A-1 // 6823
M=0 // 6824
A=A-1 // 6825
M=D // 6826
A=A-1 // 6827
@4 // 6828
D=A // 6829
@SP // 6830
M=D+M // 6831
@12 // 6832
D=A // 6833
@SP // 6834
A=M-1 // 6835
M=0 // 6836
A=A-1 // 6837
M=0 // 6838
A=A-1 // 6839
M=D // 6840
A=A-1 // 6841
M=D // 6842
A=A-1 // 6843
// call Output.create
@17 // 6844
D=A // 6845
@14 // 6846
M=D // 6847
@Output.create // 6848
D=A // 6849
@13 // 6850
M=D // 6851
@Output.init.ret.16 // 6852
D=A // 6853
@CALL // 6854
0;JMP // 6855
(Output.init.ret.16)
@SP // 6856
M=M-1 // 6857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6858
D=A // 6859
@SP // 6860
M=D+M // 6861
@47 // 6862
D=A // 6863
@SP // 6864
A=M-1 // 6865
M=0 // 6866
A=A-1 // 6867
M=0 // 6868
A=A-1 // 6869
M=D // 6870
A=A-1 // 6871
@32 // 6872
D=A // 6873
@SP // 6874
AM=M+1 // 6875
A=A-1 // 6876
M=D // 6877
@48 // 6878
D=A // 6879
@SP // 6880
AM=M+1 // 6881
A=A-1 // 6882
M=D // 6883
@24 // 6884
D=A // 6885
@SP // 6886
AM=M+1 // 6887
A=A-1 // 6888
M=D // 6889
@12 // 6890
D=A // 6891
@SP // 6892
AM=M+1 // 6893
A=A-1 // 6894
M=D // 6895
@6 // 6896
D=A // 6897
@SP // 6898
AM=M+1 // 6899
A=A-1 // 6900
M=D // 6901
@3 // 6902
D=A // 6903
@SP // 6904
AM=M+1 // 6905
A=A-1 // 6906
M=D // 6907
@SP // 6908
AM=M+1 // 6909
A=A-1 // 6910
M=1 // 6911
@SP // 6912
AM=M+1 // 6913
A=A-1 // 6914
M=0 // 6915
@SP // 6916
AM=M+1 // 6917
A=A-1 // 6918
M=0 // 6919
// call Output.create
@17 // 6920
D=A // 6921
@14 // 6922
M=D // 6923
@Output.create // 6924
D=A // 6925
@13 // 6926
M=D // 6927
@Output.init.ret.17 // 6928
D=A // 6929
@CALL // 6930
0;JMP // 6931
(Output.init.ret.17)
@SP // 6932
M=M-1 // 6933

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6934
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
@30 // 6946
D=A // 6947
@SP // 6948
AM=M+1 // 6949
A=A-1 // 6950
M=D // 6951
@51 // 6952
D=A // 6953
@SP // 6954
AM=M+1 // 6955
A=A-1 // 6956
M=D // 6957
@51 // 6958
D=A // 6959
@SP // 6960
AM=M+1 // 6961
A=A-1 // 6962
M=D // 6963
@51 // 6964
D=A // 6965
@SP // 6966
AM=M+1 // 6967
A=A-1 // 6968
M=D // 6969
@51 // 6970
D=A // 6971
@SP // 6972
AM=M+1 // 6973
A=A-1 // 6974
M=D // 6975
@51 // 6976
D=A // 6977
@SP // 6978
AM=M+1 // 6979
A=A-1 // 6980
M=D // 6981
@30 // 6982
D=A // 6983
@SP // 6984
AM=M+1 // 6985
A=A-1 // 6986
M=D // 6987
@12 // 6988
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
@Output.init.ret.18 // 7010
D=A // 7011
@CALL // 7012
0;JMP // 7013
(Output.init.ret.18)
@SP // 7014
M=M-1 // 7015

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 7016
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
@14 // 7028
D=A // 7029
@SP // 7030
AM=M+1 // 7031
A=A-1 // 7032
M=D // 7033
@15 // 7034
D=A // 7035
@SP // 7036
AM=M+1 // 7037
A=A-1 // 7038
M=D // 7039
@12 // 7040
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
@12 // 7052
D=A // 7053
@SP // 7054
AM=M+1 // 7055
A=A-1 // 7056
M=D // 7057
@12 // 7058
D=A // 7059
@SP // 7060
AM=M+1 // 7061
A=A-1 // 7062
M=D // 7063
@12 // 7064
D=A // 7065
@SP // 7066
AM=M+1 // 7067
A=A-1 // 7068
M=D // 7069
@63 // 7070
D=A // 7071
@SP // 7072
AM=M+1 // 7073
A=A-1 // 7074
M=D // 7075
@SP // 7076
AM=M+1 // 7077
A=A-1 // 7078
M=0 // 7079
@SP // 7080
AM=M+1 // 7081
A=A-1 // 7082
M=0 // 7083
// call Output.create
@17 // 7084
D=A // 7085
@14 // 7086
M=D // 7087
@Output.create // 7088
D=A // 7089
@13 // 7090
M=D // 7091
@Output.init.ret.19 // 7092
D=A // 7093
@CALL // 7094
0;JMP // 7095
(Output.init.ret.19)
@SP // 7096
M=M-1 // 7097

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7098
D=A // 7099
@SP // 7100
AM=M+1 // 7101
A=A-1 // 7102
M=D // 7103
@30 // 7104
D=A // 7105
@SP // 7106
AM=M+1 // 7107
A=A-1 // 7108
M=D // 7109
@51 // 7110
D=A // 7111
@SP // 7112
AM=M+1 // 7113
A=A-1 // 7114
M=D // 7115
@48 // 7116
D=A // 7117
@SP // 7118
AM=M+1 // 7119
A=A-1 // 7120
M=D // 7121
@24 // 7122
D=A // 7123
@SP // 7124
AM=M+1 // 7125
A=A-1 // 7126
M=D // 7127
@12 // 7128
D=A // 7129
@SP // 7130
AM=M+1 // 7131
A=A-1 // 7132
M=D // 7133
@6 // 7134
D=A // 7135
@SP // 7136
AM=M+1 // 7137
A=A-1 // 7138
M=D // 7139
@3 // 7140
D=A // 7141
@SP // 7142
AM=M+1 // 7143
A=A-1 // 7144
M=D // 7145
@51 // 7146
D=A // 7147
@SP // 7148
AM=M+1 // 7149
A=A-1 // 7150
M=D // 7151
@63 // 7152
D=A // 7153
@SP // 7154
AM=M+1 // 7155
A=A-1 // 7156
M=D // 7157
@SP // 7158
AM=M+1 // 7159
A=A-1 // 7160
M=0 // 7161
@SP // 7162
AM=M+1 // 7163
A=A-1 // 7164
M=0 // 7165
// call Output.create
@17 // 7166
D=A // 7167
@14 // 7168
M=D // 7169
@Output.create // 7170
D=A // 7171
@13 // 7172
M=D // 7173
@Output.init.ret.20 // 7174
D=A // 7175
@CALL // 7176
0;JMP // 7177
(Output.init.ret.20)
@SP // 7178
M=M-1 // 7179

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7180
D=A // 7181
@SP // 7182
AM=M+1 // 7183
A=A-1 // 7184
M=D // 7185
@30 // 7186
D=A // 7187
@SP // 7188
AM=M+1 // 7189
A=A-1 // 7190
M=D // 7191
@51 // 7192
D=A // 7193
@SP // 7194
AM=M+1 // 7195
A=A-1 // 7196
M=D // 7197
@48 // 7198
D=A // 7199
@SP // 7200
AM=M+1 // 7201
A=A-1 // 7202
M=D // 7203
@48 // 7204
D=A // 7205
@SP // 7206
AM=M+1 // 7207
A=A-1 // 7208
M=D // 7209
@28 // 7210
D=A // 7211
@SP // 7212
AM=M+1 // 7213
A=A-1 // 7214
M=D // 7215
@48 // 7216
D=A // 7217
@SP // 7218
AM=M+1 // 7219
A=A-1 // 7220
M=D // 7221
@48 // 7222
D=A // 7223
@SP // 7224
AM=M+1 // 7225
A=A-1 // 7226
M=D // 7227
@51 // 7228
D=A // 7229
@SP // 7230
AM=M+1 // 7231
A=A-1 // 7232
M=D // 7233
@30 // 7234
D=A // 7235
@SP // 7236
AM=M+1 // 7237
A=A-1 // 7238
M=D // 7239
@SP // 7240
AM=M+1 // 7241
A=A-1 // 7242
M=0 // 7243
@SP // 7244
AM=M+1 // 7245
A=A-1 // 7246
M=0 // 7247
// call Output.create
@17 // 7248
D=A // 7249
@14 // 7250
M=D // 7251
@Output.create // 7252
D=A // 7253
@13 // 7254
M=D // 7255
@Output.init.ret.21 // 7256
D=A // 7257
@CALL // 7258
0;JMP // 7259
(Output.init.ret.21)
@SP // 7260
M=M-1 // 7261

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7262
D=A // 7263
@SP // 7264
AM=M+1 // 7265
A=A-1 // 7266
M=D // 7267
@16 // 7268
D=A // 7269
@SP // 7270
AM=M+1 // 7271
A=A-1 // 7272
M=D // 7273
@24 // 7274
D=A // 7275
@SP // 7276
AM=M+1 // 7277
A=A-1 // 7278
M=D // 7279
@28 // 7280
D=A // 7281
@SP // 7282
AM=M+1 // 7283
A=A-1 // 7284
M=D // 7285
@26 // 7286
D=A // 7287
@SP // 7288
AM=M+1 // 7289
A=A-1 // 7290
M=D // 7291
@25 // 7292
D=A // 7293
@SP // 7294
AM=M+1 // 7295
A=A-1 // 7296
M=D // 7297
@63 // 7298
D=A // 7299
@SP // 7300
AM=M+1 // 7301
A=A-1 // 7302
M=D // 7303
@24 // 7304
D=A // 7305
@SP // 7306
AM=M+1 // 7307
A=A-1 // 7308
M=D // 7309
@24 // 7310
D=A // 7311
@SP // 7312
AM=M+1 // 7313
A=A-1 // 7314
M=D // 7315
@60 // 7316
D=A // 7317
@SP // 7318
AM=M+1 // 7319
A=A-1 // 7320
M=D // 7321
@SP // 7322
AM=M+1 // 7323
A=A-1 // 7324
M=0 // 7325
@SP // 7326
AM=M+1 // 7327
A=A-1 // 7328
M=0 // 7329
// call Output.create
@17 // 7330
D=A // 7331
@14 // 7332
M=D // 7333
@Output.create // 7334
D=A // 7335
@13 // 7336
M=D // 7337
@Output.init.ret.22 // 7338
D=A // 7339
@CALL // 7340
0;JMP // 7341
(Output.init.ret.22)
@SP // 7342
M=M-1 // 7343

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7344
D=A // 7345
@SP // 7346
AM=M+1 // 7347
A=A-1 // 7348
M=D // 7349
@63 // 7350
D=A // 7351
@SP // 7352
AM=M+1 // 7353
A=A-1 // 7354
M=D // 7355
@3 // 7356
D=A // 7357
@SP // 7358
AM=M+1 // 7359
A=A-1 // 7360
M=D // 7361
@3 // 7362
D=A // 7363
@SP // 7364
AM=M+1 // 7365
A=A-1 // 7366
M=D // 7367
@31 // 7368
D=A // 7369
@SP // 7370
AM=M+1 // 7371
A=A-1 // 7372
M=D // 7373
@48 // 7374
D=A // 7375
@SP // 7376
AM=M+1 // 7377
A=A-1 // 7378
M=D // 7379
@48 // 7380
D=A // 7381
@SP // 7382
AM=M+1 // 7383
A=A-1 // 7384
M=D // 7385
@48 // 7386
D=A // 7387
@SP // 7388
AM=M+1 // 7389
A=A-1 // 7390
M=D // 7391
@51 // 7392
D=A // 7393
@SP // 7394
AM=M+1 // 7395
A=A-1 // 7396
M=D // 7397
@30 // 7398
D=A // 7399
@SP // 7400
AM=M+1 // 7401
A=A-1 // 7402
M=D // 7403
@SP // 7404
AM=M+1 // 7405
A=A-1 // 7406
M=0 // 7407
@SP // 7408
AM=M+1 // 7409
A=A-1 // 7410
M=0 // 7411
// call Output.create
@17 // 7412
D=A // 7413
@14 // 7414
M=D // 7415
@Output.create // 7416
D=A // 7417
@13 // 7418
M=D // 7419
@Output.init.ret.23 // 7420
D=A // 7421
@CALL // 7422
0;JMP // 7423
(Output.init.ret.23)
@SP // 7424
M=M-1 // 7425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7426
D=A // 7427
@SP // 7428
AM=M+1 // 7429
A=A-1 // 7430
M=D // 7431
@28 // 7432
D=A // 7433
@SP // 7434
AM=M+1 // 7435
A=A-1 // 7436
M=D // 7437
@6 // 7438
D=A // 7439
@SP // 7440
AM=M+1 // 7441
A=A-1 // 7442
M=D // 7443
@3 // 7444
D=A // 7445
@SP // 7446
AM=M+1 // 7447
A=A-1 // 7448
M=D // 7449
@3 // 7450
D=A // 7451
@SP // 7452
AM=M+1 // 7453
A=A-1 // 7454
M=D // 7455
@31 // 7456
D=A // 7457
@SP // 7458
AM=M+1 // 7459
A=A-1 // 7460
M=D // 7461
@51 // 7462
D=A // 7463
@SP // 7464
AM=M+1 // 7465
A=A-1 // 7466
M=D // 7467
@51 // 7468
D=A // 7469
@SP // 7470
AM=M+1 // 7471
A=A-1 // 7472
M=D // 7473
@51 // 7474
D=A // 7475
@SP // 7476
AM=M+1 // 7477
A=A-1 // 7478
M=D // 7479
@30 // 7480
D=A // 7481
@SP // 7482
AM=M+1 // 7483
A=A-1 // 7484
M=D // 7485
@SP // 7486
AM=M+1 // 7487
A=A-1 // 7488
M=0 // 7489
@SP // 7490
AM=M+1 // 7491
A=A-1 // 7492
M=0 // 7493
// call Output.create
@17 // 7494
D=A // 7495
@14 // 7496
M=D // 7497
@Output.create // 7498
D=A // 7499
@13 // 7500
M=D // 7501
@Output.init.ret.24 // 7502
D=A // 7503
@CALL // 7504
0;JMP // 7505
(Output.init.ret.24)
@SP // 7506
M=M-1 // 7507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7508
D=A // 7509
@SP // 7510
AM=M+1 // 7511
A=A-1 // 7512
M=D // 7513
@63 // 7514
D=A // 7515
@SP // 7516
AM=M+1 // 7517
A=A-1 // 7518
M=D // 7519
@49 // 7520
D=A // 7521
@SP // 7522
AM=M+1 // 7523
A=A-1 // 7524
M=D // 7525
@48 // 7526
D=A // 7527
@SP // 7528
AM=M+1 // 7529
A=A-1 // 7530
M=D // 7531
@48 // 7532
D=A // 7533
@SP // 7534
AM=M+1 // 7535
A=A-1 // 7536
M=D // 7537
@24 // 7538
D=A // 7539
@SP // 7540
AM=M+1 // 7541
A=A-1 // 7542
M=D // 7543
@12 // 7544
D=A // 7545
@SP // 7546
AM=M+1 // 7547
A=A-1 // 7548
M=D // 7549
@12 // 7550
D=A // 7551
@SP // 7552
AM=M+1 // 7553
A=A-1 // 7554
M=D // 7555
@12 // 7556
D=A // 7557
@SP // 7558
AM=M+1 // 7559
A=A-1 // 7560
M=D // 7561
@12 // 7562
D=A // 7563
@SP // 7564
AM=M+1 // 7565
A=A-1 // 7566
M=D // 7567
@SP // 7568
AM=M+1 // 7569
A=A-1 // 7570
M=0 // 7571
@SP // 7572
AM=M+1 // 7573
A=A-1 // 7574
M=0 // 7575
// call Output.create
@17 // 7576
D=A // 7577
@14 // 7578
M=D // 7579
@Output.create // 7580
D=A // 7581
@13 // 7582
M=D // 7583
@Output.init.ret.25 // 7584
D=A // 7585
@CALL // 7586
0;JMP // 7587
(Output.init.ret.25)
@SP // 7588
M=M-1 // 7589

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7590
D=A // 7591
@SP // 7592
AM=M+1 // 7593
A=A-1 // 7594
M=D // 7595
@30 // 7596
D=A // 7597
@SP // 7598
AM=M+1 // 7599
A=A-1 // 7600
M=D // 7601
@51 // 7602
D=A // 7603
@SP // 7604
AM=M+1 // 7605
A=A-1 // 7606
M=D // 7607
@51 // 7608
D=A // 7609
@SP // 7610
AM=M+1 // 7611
A=A-1 // 7612
M=D // 7613
@51 // 7614
D=A // 7615
@SP // 7616
AM=M+1 // 7617
A=A-1 // 7618
M=D // 7619
@30 // 7620
D=A // 7621
@SP // 7622
AM=M+1 // 7623
A=A-1 // 7624
M=D // 7625
@51 // 7626
D=A // 7627
@SP // 7628
AM=M+1 // 7629
A=A-1 // 7630
M=D // 7631
@51 // 7632
D=A // 7633
@SP // 7634
AM=M+1 // 7635
A=A-1 // 7636
M=D // 7637
@51 // 7638
D=A // 7639
@SP // 7640
AM=M+1 // 7641
A=A-1 // 7642
M=D // 7643
@30 // 7644
D=A // 7645
@SP // 7646
AM=M+1 // 7647
A=A-1 // 7648
M=D // 7649
@SP // 7650
AM=M+1 // 7651
A=A-1 // 7652
M=0 // 7653
@SP // 7654
AM=M+1 // 7655
A=A-1 // 7656
M=0 // 7657
// call Output.create
@17 // 7658
D=A // 7659
@14 // 7660
M=D // 7661
@Output.create // 7662
D=A // 7663
@13 // 7664
M=D // 7665
@Output.init.ret.26 // 7666
D=A // 7667
@CALL // 7668
0;JMP // 7669
(Output.init.ret.26)
@SP // 7670
M=M-1 // 7671

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7672
D=A // 7673
@SP // 7674
AM=M+1 // 7675
A=A-1 // 7676
M=D // 7677
@30 // 7678
D=A // 7679
@SP // 7680
AM=M+1 // 7681
A=A-1 // 7682
M=D // 7683
@51 // 7684
D=A // 7685
@SP // 7686
AM=M+1 // 7687
A=A-1 // 7688
M=D // 7689
@51 // 7690
D=A // 7691
@SP // 7692
AM=M+1 // 7693
A=A-1 // 7694
M=D // 7695
@51 // 7696
D=A // 7697
@SP // 7698
AM=M+1 // 7699
A=A-1 // 7700
M=D // 7701
@62 // 7702
D=A // 7703
@SP // 7704
AM=M+1 // 7705
A=A-1 // 7706
M=D // 7707
@48 // 7708
D=A // 7709
@SP // 7710
AM=M+1 // 7711
A=A-1 // 7712
M=D // 7713
@48 // 7714
D=A // 7715
@SP // 7716
AM=M+1 // 7717
A=A-1 // 7718
M=D // 7719
@24 // 7720
D=A // 7721
@SP // 7722
AM=M+1 // 7723
A=A-1 // 7724
M=D // 7725
@14 // 7726
D=A // 7727
@SP // 7728
AM=M+1 // 7729
A=A-1 // 7730
M=D // 7731
@SP // 7732
AM=M+1 // 7733
A=A-1 // 7734
M=0 // 7735
@SP // 7736
AM=M+1 // 7737
A=A-1 // 7738
M=0 // 7739
// call Output.create
@17 // 7740
D=A // 7741
@14 // 7742
M=D // 7743
@Output.create // 7744
D=A // 7745
@13 // 7746
M=D // 7747
@Output.init.ret.27 // 7748
D=A // 7749
@CALL // 7750
0;JMP // 7751
(Output.init.ret.27)
@SP // 7752
M=M-1 // 7753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7754
D=A // 7755
@SP // 7756
M=D+M // 7757
@58 // 7758
D=A // 7759
@SP // 7760
A=M-1 // 7761
M=0 // 7762
A=A-1 // 7763
M=0 // 7764
A=A-1 // 7765
M=D // 7766
A=A-1 // 7767
@4 // 7768
D=A // 7769
@SP // 7770
M=D+M // 7771
@12 // 7772
D=A // 7773
@SP // 7774
A=M-1 // 7775
M=0 // 7776
A=A-1 // 7777
M=0 // 7778
A=A-1 // 7779
M=D // 7780
A=A-1 // 7781
M=D // 7782
A=A-1 // 7783
@5 // 7784
D=A // 7785
@SP // 7786
M=D+M // 7787
@12 // 7788
D=A // 7789
@SP // 7790
A=M-1 // 7791
M=0 // 7792
A=A-1 // 7793
M=0 // 7794
A=A-1 // 7795
M=0 // 7796
A=A-1 // 7797
M=D // 7798
A=A-1 // 7799
M=D // 7800
A=A-1 // 7801
// call Output.create
@17 // 7802
D=A // 7803
@14 // 7804
M=D // 7805
@Output.create // 7806
D=A // 7807
@13 // 7808
M=D // 7809
@Output.init.ret.28 // 7810
D=A // 7811
@CALL // 7812
0;JMP // 7813
(Output.init.ret.28)
@SP // 7814
M=M-1 // 7815

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7816
D=A // 7817
@SP // 7818
M=D+M // 7819
@59 // 7820
D=A // 7821
@SP // 7822
A=M-1 // 7823
M=0 // 7824
A=A-1 // 7825
M=0 // 7826
A=A-1 // 7827
M=D // 7828
A=A-1 // 7829
@4 // 7830
D=A // 7831
@SP // 7832
M=D+M // 7833
@12 // 7834
D=A // 7835
@SP // 7836
A=M-1 // 7837
M=0 // 7838
A=A-1 // 7839
M=0 // 7840
A=A-1 // 7841
M=D // 7842
A=A-1 // 7843
M=D // 7844
A=A-1 // 7845
@12 // 7846
D=A // 7847
@SP // 7848
AM=M+1 // 7849
A=A-1 // 7850
M=D // 7851
@12 // 7852
D=A // 7853
@SP // 7854
AM=M+1 // 7855
A=A-1 // 7856
M=D // 7857
@6 // 7858
D=A // 7859
@SP // 7860
AM=M+1 // 7861
A=A-1 // 7862
M=D // 7863
@SP // 7864
AM=M+1 // 7865
A=A-1 // 7866
M=0 // 7867
@SP // 7868
AM=M+1 // 7869
A=A-1 // 7870
M=0 // 7871
// call Output.create
@17 // 7872
D=A // 7873
@14 // 7874
M=D // 7875
@Output.create // 7876
D=A // 7877
@13 // 7878
M=D // 7879
@Output.init.ret.29 // 7880
D=A // 7881
@CALL // 7882
0;JMP // 7883
(Output.init.ret.29)
@SP // 7884
M=M-1 // 7885

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7886
D=A // 7887
@SP // 7888
M=D+M // 7889
@60 // 7890
D=A // 7891
@SP // 7892
A=M-1 // 7893
M=0 // 7894
A=A-1 // 7895
M=0 // 7896
A=A-1 // 7897
M=D // 7898
A=A-1 // 7899
@24 // 7900
D=A // 7901
@SP // 7902
AM=M+1 // 7903
A=A-1 // 7904
M=D // 7905
@12 // 7906
D=A // 7907
@SP // 7908
AM=M+1 // 7909
A=A-1 // 7910
M=D // 7911
@6 // 7912
D=A // 7913
@SP // 7914
AM=M+1 // 7915
A=A-1 // 7916
M=D // 7917
@3 // 7918
D=A // 7919
@SP // 7920
AM=M+1 // 7921
A=A-1 // 7922
M=D // 7923
@6 // 7924
D=A // 7925
@SP // 7926
AM=M+1 // 7927
A=A-1 // 7928
M=D // 7929
@12 // 7930
D=A // 7931
@SP // 7932
AM=M+1 // 7933
A=A-1 // 7934
M=D // 7935
@24 // 7936
D=A // 7937
@SP // 7938
AM=M+1 // 7939
A=A-1 // 7940
M=D // 7941
@SP // 7942
AM=M+1 // 7943
A=A-1 // 7944
M=0 // 7945
@SP // 7946
AM=M+1 // 7947
A=A-1 // 7948
M=0 // 7949
// call Output.create
@17 // 7950
D=A // 7951
@14 // 7952
M=D // 7953
@Output.create // 7954
D=A // 7955
@13 // 7956
M=D // 7957
@Output.init.ret.30 // 7958
D=A // 7959
@CALL // 7960
0;JMP // 7961
(Output.init.ret.30)
@SP // 7962
M=M-1 // 7963

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7964
D=A // 7965
@SP // 7966
M=D+M // 7967
@61 // 7968
D=A // 7969
@SP // 7970
A=M-1 // 7971
M=0 // 7972
A=A-1 // 7973
M=0 // 7974
A=A-1 // 7975
M=0 // 7976
A=A-1 // 7977
M=D // 7978
A=A-1 // 7979
@3 // 7980
D=A // 7981
@SP // 7982
M=D+M // 7983
@63 // 7984
D=A // 7985
@SP // 7986
A=M-1 // 7987
M=0 // 7988
A=A-1 // 7989
M=0 // 7990
A=A-1 // 7991
M=D // 7992
A=A-1 // 7993
@5 // 7994
D=A // 7995
@SP // 7996
M=D+M // 7997
@63 // 7998
D=A // 7999
@SP // 8000
A=M-1 // 8001
M=0 // 8002
A=A-1 // 8003
M=0 // 8004
A=A-1 // 8005
M=0 // 8006
A=A-1 // 8007
M=0 // 8008
A=A-1 // 8009
M=D // 8010
A=A-1 // 8011
// call Output.create
@17 // 8012
D=A // 8013
@14 // 8014
M=D // 8015
@Output.create // 8016
D=A // 8017
@13 // 8018
M=D // 8019
@Output.init.ret.31 // 8020
D=A // 8021
@CALL // 8022
0;JMP // 8023
(Output.init.ret.31)
@SP // 8024
M=M-1 // 8025

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 8026
D=A // 8027
@SP // 8028
M=D+M // 8029
@62 // 8030
D=A // 8031
@SP // 8032
A=M-1 // 8033
M=0 // 8034
A=A-1 // 8035
M=0 // 8036
A=A-1 // 8037
M=D // 8038
A=A-1 // 8039
@3 // 8040
D=A // 8041
@SP // 8042
AM=M+1 // 8043
A=A-1 // 8044
M=D // 8045
@6 // 8046
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
@24 // 8058
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
@6 // 8070
D=A // 8071
@SP // 8072
AM=M+1 // 8073
A=A-1 // 8074
M=D // 8075
@3 // 8076
D=A // 8077
@SP // 8078
AM=M+1 // 8079
A=A-1 // 8080
M=D // 8081
@SP // 8082
AM=M+1 // 8083
A=A-1 // 8084
M=0 // 8085
@SP // 8086
AM=M+1 // 8087
A=A-1 // 8088
M=0 // 8089
// call Output.create
@17 // 8090
D=A // 8091
@14 // 8092
M=D // 8093
@Output.create // 8094
D=A // 8095
@13 // 8096
M=D // 8097
@Output.init.ret.32 // 8098
D=A // 8099
@CALL // 8100
0;JMP // 8101
(Output.init.ret.32)
@SP // 8102
M=M-1 // 8103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8104
D=A // 8105
@SP // 8106
AM=M+1 // 8107
A=A-1 // 8108
M=D // 8109
@30 // 8110
D=A // 8111
@SP // 8112
AM=M+1 // 8113
A=A-1 // 8114
M=D // 8115
@51 // 8116
D=A // 8117
@SP // 8118
AM=M+1 // 8119
A=A-1 // 8120
M=D // 8121
@51 // 8122
D=A // 8123
@SP // 8124
AM=M+1 // 8125
A=A-1 // 8126
M=D // 8127
@59 // 8128
D=A // 8129
@SP // 8130
AM=M+1 // 8131
A=A-1 // 8132
M=D // 8133
@59 // 8134
D=A // 8135
@SP // 8136
AM=M+1 // 8137
A=A-1 // 8138
M=D // 8139
@59 // 8140
D=A // 8141
@SP // 8142
AM=M+1 // 8143
A=A-1 // 8144
M=D // 8145
@27 // 8146
D=A // 8147
@SP // 8148
AM=M+1 // 8149
A=A-1 // 8150
M=D // 8151
@3 // 8152
D=A // 8153
@SP // 8154
AM=M+1 // 8155
A=A-1 // 8156
M=D // 8157
@30 // 8158
D=A // 8159
@SP // 8160
AM=M+1 // 8161
A=A-1 // 8162
M=D // 8163
@SP // 8164
AM=M+1 // 8165
A=A-1 // 8166
M=0 // 8167
@SP // 8168
AM=M+1 // 8169
A=A-1 // 8170
M=0 // 8171
// call Output.create
@17 // 8172
D=A // 8173
@14 // 8174
M=D // 8175
@Output.create // 8176
D=A // 8177
@13 // 8178
M=D // 8179
@Output.init.ret.33 // 8180
D=A // 8181
@CALL // 8182
0;JMP // 8183
(Output.init.ret.33)
@SP // 8184
M=M-1 // 8185

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8186
D=A // 8187
@SP // 8188
AM=M+1 // 8189
A=A-1 // 8190
M=D // 8191
@30 // 8192
D=A // 8193
@SP // 8194
AM=M+1 // 8195
A=A-1 // 8196
M=D // 8197
@51 // 8198
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
@24 // 8210
D=A // 8211
@SP // 8212
AM=M+1 // 8213
A=A-1 // 8214
M=D // 8215
@12 // 8216
D=A // 8217
@SP // 8218
AM=M+1 // 8219
A=A-1 // 8220
M=D // 8221
@12 // 8222
D=A // 8223
@SP // 8224
AM=M+1 // 8225
A=A-1 // 8226
M=D // 8227
@SP // 8228
AM=M+1 // 8229
A=A-1 // 8230
M=0 // 8231
@4 // 8232
D=A // 8233
@SP // 8234
M=D+M // 8235
@12 // 8236
D=A // 8237
@SP // 8238
A=M-1 // 8239
M=0 // 8240
A=A-1 // 8241
M=0 // 8242
A=A-1 // 8243
M=D // 8244
A=A-1 // 8245
M=D // 8246
A=A-1 // 8247
// call Output.create
@17 // 8248
D=A // 8249
@14 // 8250
M=D // 8251
@Output.create // 8252
D=A // 8253
@13 // 8254
M=D // 8255
@Output.init.ret.34 // 8256
D=A // 8257
@CALL // 8258
0;JMP // 8259
(Output.init.ret.34)
@SP // 8260
M=M-1 // 8261

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8262
D=A // 8263
@SP // 8264
AM=M+1 // 8265
A=A-1 // 8266
M=D // 8267
@12 // 8268
D=A // 8269
@SP // 8270
AM=M+1 // 8271
A=A-1 // 8272
M=D // 8273
@30 // 8274
D=A // 8275
@SP // 8276
AM=M+1 // 8277
A=A-1 // 8278
M=D // 8279
@51 // 8280
D=A // 8281
@SP // 8282
AM=M+1 // 8283
A=A-1 // 8284
M=D // 8285
@51 // 8286
D=A // 8287
@SP // 8288
AM=M+1 // 8289
A=A-1 // 8290
M=D // 8291
@63 // 8292
D=A // 8293
@SP // 8294
AM=M+1 // 8295
A=A-1 // 8296
M=D // 8297
@51 // 8298
D=A // 8299
@SP // 8300
AM=M+1 // 8301
A=A-1 // 8302
M=D // 8303
@51 // 8304
D=A // 8305
@SP // 8306
AM=M+1 // 8307
A=A-1 // 8308
M=D // 8309
@51 // 8310
D=A // 8311
@SP // 8312
AM=M+1 // 8313
A=A-1 // 8314
M=D // 8315
@51 // 8316
D=A // 8317
@SP // 8318
AM=M+1 // 8319
A=A-1 // 8320
M=D // 8321
@SP // 8322
AM=M+1 // 8323
A=A-1 // 8324
M=0 // 8325
@SP // 8326
AM=M+1 // 8327
A=A-1 // 8328
M=0 // 8329
// call Output.create
@17 // 8330
D=A // 8331
@14 // 8332
M=D // 8333
@Output.create // 8334
D=A // 8335
@13 // 8336
M=D // 8337
@Output.init.ret.35 // 8338
D=A // 8339
@CALL // 8340
0;JMP // 8341
(Output.init.ret.35)
@SP // 8342
M=M-1 // 8343

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8344
D=A // 8345
@SP // 8346
AM=M+1 // 8347
A=A-1 // 8348
M=D // 8349
@31 // 8350
D=A // 8351
@SP // 8352
AM=M+1 // 8353
A=A-1 // 8354
M=D // 8355
@51 // 8356
D=A // 8357
@SP // 8358
AM=M+1 // 8359
A=A-1 // 8360
M=D // 8361
@51 // 8362
D=A // 8363
@SP // 8364
AM=M+1 // 8365
A=A-1 // 8366
M=D // 8367
@51 // 8368
D=A // 8369
@SP // 8370
AM=M+1 // 8371
A=A-1 // 8372
M=D // 8373
@31 // 8374
D=A // 8375
@SP // 8376
AM=M+1 // 8377
A=A-1 // 8378
M=D // 8379
@51 // 8380
D=A // 8381
@SP // 8382
AM=M+1 // 8383
A=A-1 // 8384
M=D // 8385
@51 // 8386
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
@31 // 8398
D=A // 8399
@SP // 8400
AM=M+1 // 8401
A=A-1 // 8402
M=D // 8403
@SP // 8404
AM=M+1 // 8405
A=A-1 // 8406
M=0 // 8407
@SP // 8408
AM=M+1 // 8409
A=A-1 // 8410
M=0 // 8411
// call Output.create
@17 // 8412
D=A // 8413
@14 // 8414
M=D // 8415
@Output.create // 8416
D=A // 8417
@13 // 8418
M=D // 8419
@Output.init.ret.36 // 8420
D=A // 8421
@CALL // 8422
0;JMP // 8423
(Output.init.ret.36)
@SP // 8424
M=M-1 // 8425

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8426
D=A // 8427
@SP // 8428
AM=M+1 // 8429
A=A-1 // 8430
M=D // 8431
@28 // 8432
D=A // 8433
@SP // 8434
AM=M+1 // 8435
A=A-1 // 8436
M=D // 8437
@54 // 8438
D=A // 8439
@SP // 8440
AM=M+1 // 8441
A=A-1 // 8442
M=D // 8443
@35 // 8444
D=A // 8445
@SP // 8446
AM=M+1 // 8447
A=A-1 // 8448
M=D // 8449
@3 // 8450
D=A // 8451
@SP // 8452
AM=M+1 // 8453
A=A-1 // 8454
M=D // 8455
@3 // 8456
D=A // 8457
@SP // 8458
AM=M+1 // 8459
A=A-1 // 8460
M=D // 8461
@3 // 8462
D=A // 8463
@SP // 8464
AM=M+1 // 8465
A=A-1 // 8466
M=D // 8467
@35 // 8468
D=A // 8469
@SP // 8470
AM=M+1 // 8471
A=A-1 // 8472
M=D // 8473
@54 // 8474
D=A // 8475
@SP // 8476
AM=M+1 // 8477
A=A-1 // 8478
M=D // 8479
@28 // 8480
D=A // 8481
@SP // 8482
AM=M+1 // 8483
A=A-1 // 8484
M=D // 8485
@SP // 8486
AM=M+1 // 8487
A=A-1 // 8488
M=0 // 8489
@SP // 8490
AM=M+1 // 8491
A=A-1 // 8492
M=0 // 8493
// call Output.create
@17 // 8494
D=A // 8495
@14 // 8496
M=D // 8497
@Output.create // 8498
D=A // 8499
@13 // 8500
M=D // 8501
@Output.init.ret.37 // 8502
D=A // 8503
@CALL // 8504
0;JMP // 8505
(Output.init.ret.37)
@SP // 8506
M=M-1 // 8507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8508
D=A // 8509
@SP // 8510
AM=M+1 // 8511
A=A-1 // 8512
M=D // 8513
@15 // 8514
D=A // 8515
@SP // 8516
AM=M+1 // 8517
A=A-1 // 8518
M=D // 8519
@27 // 8520
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
@51 // 8532
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
@27 // 8556
D=A // 8557
@SP // 8558
AM=M+1 // 8559
A=A-1 // 8560
M=D // 8561
@15 // 8562
D=A // 8563
@SP // 8564
AM=M+1 // 8565
A=A-1 // 8566
M=D // 8567
@SP // 8568
AM=M+1 // 8569
A=A-1 // 8570
M=0 // 8571
@SP // 8572
AM=M+1 // 8573
A=A-1 // 8574
M=0 // 8575
// call Output.create
@17 // 8576
D=A // 8577
@14 // 8578
M=D // 8579
@Output.create // 8580
D=A // 8581
@13 // 8582
M=D // 8583
@Output.init.ret.38 // 8584
D=A // 8585
@CALL // 8586
0;JMP // 8587
(Output.init.ret.38)
@SP // 8588
M=M-1 // 8589

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8590
D=A // 8591
@SP // 8592
AM=M+1 // 8593
A=A-1 // 8594
M=D // 8595
@63 // 8596
D=A // 8597
@SP // 8598
AM=M+1 // 8599
A=A-1 // 8600
M=D // 8601
@51 // 8602
D=A // 8603
@SP // 8604
AM=M+1 // 8605
A=A-1 // 8606
M=D // 8607
@35 // 8608
D=A // 8609
@SP // 8610
AM=M+1 // 8611
A=A-1 // 8612
M=D // 8613
@11 // 8614
D=A // 8615
@SP // 8616
AM=M+1 // 8617
A=A-1 // 8618
M=D // 8619
@15 // 8620
D=A // 8621
@SP // 8622
AM=M+1 // 8623
A=A-1 // 8624
M=D // 8625
@11 // 8626
D=A // 8627
@SP // 8628
AM=M+1 // 8629
A=A-1 // 8630
M=D // 8631
@35 // 8632
D=A // 8633
@SP // 8634
AM=M+1 // 8635
A=A-1 // 8636
M=D // 8637
@51 // 8638
D=A // 8639
@SP // 8640
AM=M+1 // 8641
A=A-1 // 8642
M=D // 8643
@63 // 8644
D=A // 8645
@SP // 8646
AM=M+1 // 8647
A=A-1 // 8648
M=D // 8649
@SP // 8650
AM=M+1 // 8651
A=A-1 // 8652
M=0 // 8653
@SP // 8654
AM=M+1 // 8655
A=A-1 // 8656
M=0 // 8657
// call Output.create
@17 // 8658
D=A // 8659
@14 // 8660
M=D // 8661
@Output.create // 8662
D=A // 8663
@13 // 8664
M=D // 8665
@Output.init.ret.39 // 8666
D=A // 8667
@CALL // 8668
0;JMP // 8669
(Output.init.ret.39)
@SP // 8670
M=M-1 // 8671

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8672
D=A // 8673
@SP // 8674
AM=M+1 // 8675
A=A-1 // 8676
M=D // 8677
@63 // 8678
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
@35 // 8690
D=A // 8691
@SP // 8692
AM=M+1 // 8693
A=A-1 // 8694
M=D // 8695
@11 // 8696
D=A // 8697
@SP // 8698
AM=M+1 // 8699
A=A-1 // 8700
M=D // 8701
@15 // 8702
D=A // 8703
@SP // 8704
AM=M+1 // 8705
A=A-1 // 8706
M=D // 8707
@11 // 8708
D=A // 8709
@SP // 8710
AM=M+1 // 8711
A=A-1 // 8712
M=D // 8713
@3 // 8714
D=A // 8715
@SP // 8716
AM=M+1 // 8717
A=A-1 // 8718
M=D // 8719
@3 // 8720
D=A // 8721
@SP // 8722
AM=M+1 // 8723
A=A-1 // 8724
M=D // 8725
@3 // 8726
D=A // 8727
@SP // 8728
AM=M+1 // 8729
A=A-1 // 8730
M=D // 8731
@SP // 8732
AM=M+1 // 8733
A=A-1 // 8734
M=0 // 8735
@SP // 8736
AM=M+1 // 8737
A=A-1 // 8738
M=0 // 8739
// call Output.create
@17 // 8740
D=A // 8741
@14 // 8742
M=D // 8743
@Output.create // 8744
D=A // 8745
@13 // 8746
M=D // 8747
@Output.init.ret.40 // 8748
D=A // 8749
@CALL // 8750
0;JMP // 8751
(Output.init.ret.40)
@SP // 8752
M=M-1 // 8753

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8754
D=A // 8755
@SP // 8756
AM=M+1 // 8757
A=A-1 // 8758
M=D // 8759
@28 // 8760
D=A // 8761
@SP // 8762
AM=M+1 // 8763
A=A-1 // 8764
M=D // 8765
@54 // 8766
D=A // 8767
@SP // 8768
AM=M+1 // 8769
A=A-1 // 8770
M=D // 8771
@35 // 8772
D=A // 8773
@SP // 8774
AM=M+1 // 8775
A=A-1 // 8776
M=D // 8777
@3 // 8778
D=A // 8779
@SP // 8780
AM=M+1 // 8781
A=A-1 // 8782
M=D // 8783
@59 // 8784
D=A // 8785
@SP // 8786
AM=M+1 // 8787
A=A-1 // 8788
M=D // 8789
@51 // 8790
D=A // 8791
@SP // 8792
AM=M+1 // 8793
A=A-1 // 8794
M=D // 8795
@51 // 8796
D=A // 8797
@SP // 8798
AM=M+1 // 8799
A=A-1 // 8800
M=D // 8801
@54 // 8802
D=A // 8803
@SP // 8804
AM=M+1 // 8805
A=A-1 // 8806
M=D // 8807
@44 // 8808
D=A // 8809
@SP // 8810
AM=M+1 // 8811
A=A-1 // 8812
M=D // 8813
@SP // 8814
AM=M+1 // 8815
A=A-1 // 8816
M=0 // 8817
@SP // 8818
AM=M+1 // 8819
A=A-1 // 8820
M=0 // 8821
// call Output.create
@17 // 8822
D=A // 8823
@14 // 8824
M=D // 8825
@Output.create // 8826
D=A // 8827
@13 // 8828
M=D // 8829
@Output.init.ret.41 // 8830
D=A // 8831
@CALL // 8832
0;JMP // 8833
(Output.init.ret.41)
@SP // 8834
M=M-1 // 8835

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8836
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
@51 // 8848
D=A // 8849
@SP // 8850
AM=M+1 // 8851
A=A-1 // 8852
M=D // 8853
@51 // 8854
D=A // 8855
@SP // 8856
AM=M+1 // 8857
A=A-1 // 8858
M=D // 8859
@51 // 8860
D=A // 8861
@SP // 8862
AM=M+1 // 8863
A=A-1 // 8864
M=D // 8865
@63 // 8866
D=A // 8867
@SP // 8868
AM=M+1 // 8869
A=A-1 // 8870
M=D // 8871
@51 // 8872
D=A // 8873
@SP // 8874
AM=M+1 // 8875
A=A-1 // 8876
M=D // 8877
@51 // 8878
D=A // 8879
@SP // 8880
AM=M+1 // 8881
A=A-1 // 8882
M=D // 8883
@51 // 8884
D=A // 8885
@SP // 8886
AM=M+1 // 8887
A=A-1 // 8888
M=D // 8889
@51 // 8890
D=A // 8891
@SP // 8892
AM=M+1 // 8893
A=A-1 // 8894
M=D // 8895
@SP // 8896
AM=M+1 // 8897
A=A-1 // 8898
M=0 // 8899
@SP // 8900
AM=M+1 // 8901
A=A-1 // 8902
M=0 // 8903
// call Output.create
@17 // 8904
D=A // 8905
@14 // 8906
M=D // 8907
@Output.create // 8908
D=A // 8909
@13 // 8910
M=D // 8911
@Output.init.ret.42 // 8912
D=A // 8913
@CALL // 8914
0;JMP // 8915
(Output.init.ret.42)
@SP // 8916
M=M-1 // 8917

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8918
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
@12 // 8930
D=A // 8931
@SP // 8932
AM=M+1 // 8933
A=A-1 // 8934
M=D // 8935
@12 // 8936
D=A // 8937
@SP // 8938
AM=M+1 // 8939
A=A-1 // 8940
M=D // 8941
@12 // 8942
D=A // 8943
@SP // 8944
AM=M+1 // 8945
A=A-1 // 8946
M=D // 8947
@12 // 8948
D=A // 8949
@SP // 8950
AM=M+1 // 8951
A=A-1 // 8952
M=D // 8953
@12 // 8954
D=A // 8955
@SP // 8956
AM=M+1 // 8957
A=A-1 // 8958
M=D // 8959
@12 // 8960
D=A // 8961
@SP // 8962
AM=M+1 // 8963
A=A-1 // 8964
M=D // 8965
@12 // 8966
D=A // 8967
@SP // 8968
AM=M+1 // 8969
A=A-1 // 8970
M=D // 8971
@30 // 8972
D=A // 8973
@SP // 8974
AM=M+1 // 8975
A=A-1 // 8976
M=D // 8977
@SP // 8978
AM=M+1 // 8979
A=A-1 // 8980
M=0 // 8981
@SP // 8982
AM=M+1 // 8983
A=A-1 // 8984
M=0 // 8985
// call Output.create
@17 // 8986
D=A // 8987
@14 // 8988
M=D // 8989
@Output.create // 8990
D=A // 8991
@13 // 8992
M=D // 8993
@Output.init.ret.43 // 8994
D=A // 8995
@CALL // 8996
0;JMP // 8997
(Output.init.ret.43)
@SP // 8998
M=M-1 // 8999

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 9000
D=A // 9001
@SP // 9002
AM=M+1 // 9003
A=A-1 // 9004
M=D // 9005
@60 // 9006
D=A // 9007
@SP // 9008
AM=M+1 // 9009
A=A-1 // 9010
M=D // 9011
@24 // 9012
D=A // 9013
@SP // 9014
AM=M+1 // 9015
A=A-1 // 9016
M=D // 9017
@24 // 9018
D=A // 9019
@SP // 9020
AM=M+1 // 9021
A=A-1 // 9022
M=D // 9023
@24 // 9024
D=A // 9025
@SP // 9026
AM=M+1 // 9027
A=A-1 // 9028
M=D // 9029
@24 // 9030
D=A // 9031
@SP // 9032
AM=M+1 // 9033
A=A-1 // 9034
M=D // 9035
@24 // 9036
D=A // 9037
@SP // 9038
AM=M+1 // 9039
A=A-1 // 9040
M=D // 9041
@27 // 9042
D=A // 9043
@SP // 9044
AM=M+1 // 9045
A=A-1 // 9046
M=D // 9047
@27 // 9048
D=A // 9049
@SP // 9050
AM=M+1 // 9051
A=A-1 // 9052
M=D // 9053
@14 // 9054
D=A // 9055
@SP // 9056
AM=M+1 // 9057
A=A-1 // 9058
M=D // 9059
@SP // 9060
AM=M+1 // 9061
A=A-1 // 9062
M=0 // 9063
@SP // 9064
AM=M+1 // 9065
A=A-1 // 9066
M=0 // 9067
// call Output.create
@17 // 9068
D=A // 9069
@14 // 9070
M=D // 9071
@Output.create // 9072
D=A // 9073
@13 // 9074
M=D // 9075
@Output.init.ret.44 // 9076
D=A // 9077
@CALL // 9078
0;JMP // 9079
(Output.init.ret.44)
@SP // 9080
M=M-1 // 9081

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9082
D=A // 9083
@SP // 9084
AM=M+1 // 9085
A=A-1 // 9086
M=D // 9087
@51 // 9088
D=A // 9089
@SP // 9090
AM=M+1 // 9091
A=A-1 // 9092
M=D // 9093
@51 // 9094
D=A // 9095
@SP // 9096
AM=M+1 // 9097
A=A-1 // 9098
M=D // 9099
@51 // 9100
D=A // 9101
@SP // 9102
AM=M+1 // 9103
A=A-1 // 9104
M=D // 9105
@27 // 9106
D=A // 9107
@SP // 9108
AM=M+1 // 9109
A=A-1 // 9110
M=D // 9111
@15 // 9112
D=A // 9113
@SP // 9114
AM=M+1 // 9115
A=A-1 // 9116
M=D // 9117
@27 // 9118
D=A // 9119
@SP // 9120
AM=M+1 // 9121
A=A-1 // 9122
M=D // 9123
@51 // 9124
D=A // 9125
@SP // 9126
AM=M+1 // 9127
A=A-1 // 9128
M=D // 9129
@51 // 9130
D=A // 9131
@SP // 9132
AM=M+1 // 9133
A=A-1 // 9134
M=D // 9135
@51 // 9136
D=A // 9137
@SP // 9138
AM=M+1 // 9139
A=A-1 // 9140
M=D // 9141
@SP // 9142
AM=M+1 // 9143
A=A-1 // 9144
M=0 // 9145
@SP // 9146
AM=M+1 // 9147
A=A-1 // 9148
M=0 // 9149
// call Output.create
@17 // 9150
D=A // 9151
@14 // 9152
M=D // 9153
@Output.create // 9154
D=A // 9155
@13 // 9156
M=D // 9157
@Output.init.ret.45 // 9158
D=A // 9159
@CALL // 9160
0;JMP // 9161
(Output.init.ret.45)
@SP // 9162
M=M-1 // 9163

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9164
D=A // 9165
@SP // 9166
AM=M+1 // 9167
A=A-1 // 9168
M=D // 9169
@3 // 9170
D=A // 9171
@SP // 9172
AM=M+1 // 9173
A=A-1 // 9174
M=D // 9175
@3 // 9176
D=A // 9177
@SP // 9178
AM=M+1 // 9179
A=A-1 // 9180
M=D // 9181
@3 // 9182
D=A // 9183
@SP // 9184
AM=M+1 // 9185
A=A-1 // 9186
M=D // 9187
@3 // 9188
D=A // 9189
@SP // 9190
AM=M+1 // 9191
A=A-1 // 9192
M=D // 9193
@3 // 9194
D=A // 9195
@SP // 9196
AM=M+1 // 9197
A=A-1 // 9198
M=D // 9199
@3 // 9200
D=A // 9201
@SP // 9202
AM=M+1 // 9203
A=A-1 // 9204
M=D // 9205
@35 // 9206
D=A // 9207
@SP // 9208
AM=M+1 // 9209
A=A-1 // 9210
M=D // 9211
@51 // 9212
D=A // 9213
@SP // 9214
AM=M+1 // 9215
A=A-1 // 9216
M=D // 9217
@63 // 9218
D=A // 9219
@SP // 9220
AM=M+1 // 9221
A=A-1 // 9222
M=D // 9223
@SP // 9224
AM=M+1 // 9225
A=A-1 // 9226
M=0 // 9227
@SP // 9228
AM=M+1 // 9229
A=A-1 // 9230
M=0 // 9231
// call Output.create
@17 // 9232
D=A // 9233
@14 // 9234
M=D // 9235
@Output.create // 9236
D=A // 9237
@13 // 9238
M=D // 9239
@Output.init.ret.46 // 9240
D=A // 9241
@CALL // 9242
0;JMP // 9243
(Output.init.ret.46)
@SP // 9244
M=M-1 // 9245

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9246
D=A // 9247
@SP // 9248
AM=M+1 // 9249
A=A-1 // 9250
M=D // 9251
@33 // 9252
D=A // 9253
@SP // 9254
AM=M+1 // 9255
A=A-1 // 9256
M=D // 9257
@51 // 9258
D=A // 9259
@SP // 9260
AM=M+1 // 9261
A=A-1 // 9262
M=D // 9263
@63 // 9264
D=A // 9265
@SP // 9266
AM=M+1 // 9267
A=A-1 // 9268
M=D // 9269
@63 // 9270
D=A // 9271
@SP // 9272
AM=M+1 // 9273
A=A-1 // 9274
M=D // 9275
@51 // 9276
D=A // 9277
@SP // 9278
AM=M+1 // 9279
A=A-1 // 9280
M=D // 9281
@51 // 9282
D=A // 9283
@SP // 9284
AM=M+1 // 9285
A=A-1 // 9286
M=D // 9287
@51 // 9288
D=A // 9289
@SP // 9290
AM=M+1 // 9291
A=A-1 // 9292
M=D // 9293
@51 // 9294
D=A // 9295
@SP // 9296
AM=M+1 // 9297
A=A-1 // 9298
M=D // 9299
@51 // 9300
D=A // 9301
@SP // 9302
AM=M+1 // 9303
A=A-1 // 9304
M=D // 9305
@SP // 9306
AM=M+1 // 9307
A=A-1 // 9308
M=0 // 9309
@SP // 9310
AM=M+1 // 9311
A=A-1 // 9312
M=0 // 9313
// call Output.create
@17 // 9314
D=A // 9315
@14 // 9316
M=D // 9317
@Output.create // 9318
D=A // 9319
@13 // 9320
M=D // 9321
@Output.init.ret.47 // 9322
D=A // 9323
@CALL // 9324
0;JMP // 9325
(Output.init.ret.47)
@SP // 9326
M=M-1 // 9327

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9328
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
@51 // 9340
D=A // 9341
@SP // 9342
AM=M+1 // 9343
A=A-1 // 9344
M=D // 9345
@55 // 9346
D=A // 9347
@SP // 9348
AM=M+1 // 9349
A=A-1 // 9350
M=D // 9351
@55 // 9352
D=A // 9353
@SP // 9354
AM=M+1 // 9355
A=A-1 // 9356
M=D // 9357
@63 // 9358
D=A // 9359
@SP // 9360
AM=M+1 // 9361
A=A-1 // 9362
M=D // 9363
@59 // 9364
D=A // 9365
@SP // 9366
AM=M+1 // 9367
A=A-1 // 9368
M=D // 9369
@59 // 9370
D=A // 9371
@SP // 9372
AM=M+1 // 9373
A=A-1 // 9374
M=D // 9375
@51 // 9376
D=A // 9377
@SP // 9378
AM=M+1 // 9379
A=A-1 // 9380
M=D // 9381
@51 // 9382
D=A // 9383
@SP // 9384
AM=M+1 // 9385
A=A-1 // 9386
M=D // 9387
@SP // 9388
AM=M+1 // 9389
A=A-1 // 9390
M=0 // 9391
@SP // 9392
AM=M+1 // 9393
A=A-1 // 9394
M=0 // 9395
// call Output.create
@17 // 9396
D=A // 9397
@14 // 9398
M=D // 9399
@Output.create // 9400
D=A // 9401
@13 // 9402
M=D // 9403
@Output.init.ret.48 // 9404
D=A // 9405
@CALL // 9406
0;JMP // 9407
(Output.init.ret.48)
@SP // 9408
M=M-1 // 9409

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9410
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
@51 // 9434
D=A // 9435
@SP // 9436
AM=M+1 // 9437
A=A-1 // 9438
M=D // 9439
@51 // 9440
D=A // 9441
@SP // 9442
AM=M+1 // 9443
A=A-1 // 9444
M=D // 9445
@51 // 9446
D=A // 9447
@SP // 9448
AM=M+1 // 9449
A=A-1 // 9450
M=D // 9451
@51 // 9452
D=A // 9453
@SP // 9454
AM=M+1 // 9455
A=A-1 // 9456
M=D // 9457
@51 // 9458
D=A // 9459
@SP // 9460
AM=M+1 // 9461
A=A-1 // 9462
M=D // 9463
@30 // 9464
D=A // 9465
@SP // 9466
AM=M+1 // 9467
A=A-1 // 9468
M=D // 9469
@SP // 9470
AM=M+1 // 9471
A=A-1 // 9472
M=0 // 9473
@SP // 9474
AM=M+1 // 9475
A=A-1 // 9476
M=0 // 9477
// call Output.create
@17 // 9478
D=A // 9479
@14 // 9480
M=D // 9481
@Output.create // 9482
D=A // 9483
@13 // 9484
M=D // 9485
@Output.init.ret.49 // 9486
D=A // 9487
@CALL // 9488
0;JMP // 9489
(Output.init.ret.49)
@SP // 9490
M=M-1 // 9491

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9492
D=A // 9493
@SP // 9494
AM=M+1 // 9495
A=A-1 // 9496
M=D // 9497
@31 // 9498
D=A // 9499
@SP // 9500
AM=M+1 // 9501
A=A-1 // 9502
M=D // 9503
@51 // 9504
D=A // 9505
@SP // 9506
AM=M+1 // 9507
A=A-1 // 9508
M=D // 9509
@51 // 9510
D=A // 9511
@SP // 9512
AM=M+1 // 9513
A=A-1 // 9514
M=D // 9515
@51 // 9516
D=A // 9517
@SP // 9518
AM=M+1 // 9519
A=A-1 // 9520
M=D // 9521
@31 // 9522
D=A // 9523
@SP // 9524
AM=M+1 // 9525
A=A-1 // 9526
M=D // 9527
@3 // 9528
D=A // 9529
@SP // 9530
AM=M+1 // 9531
A=A-1 // 9532
M=D // 9533
@3 // 9534
D=A // 9535
@SP // 9536
AM=M+1 // 9537
A=A-1 // 9538
M=D // 9539
@3 // 9540
D=A // 9541
@SP // 9542
AM=M+1 // 9543
A=A-1 // 9544
M=D // 9545
@3 // 9546
D=A // 9547
@SP // 9548
AM=M+1 // 9549
A=A-1 // 9550
M=D // 9551
@SP // 9552
AM=M+1 // 9553
A=A-1 // 9554
M=0 // 9555
@SP // 9556
AM=M+1 // 9557
A=A-1 // 9558
M=0 // 9559
// call Output.create
@17 // 9560
D=A // 9561
@14 // 9562
M=D // 9563
@Output.create // 9564
D=A // 9565
@13 // 9566
M=D // 9567
@Output.init.ret.50 // 9568
D=A // 9569
@CALL // 9570
0;JMP // 9571
(Output.init.ret.50)
@SP // 9572
M=M-1 // 9573

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9574
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
@51 // 9586
D=A // 9587
@SP // 9588
AM=M+1 // 9589
A=A-1 // 9590
M=D // 9591
@51 // 9592
D=A // 9593
@SP // 9594
AM=M+1 // 9595
A=A-1 // 9596
M=D // 9597
@51 // 9598
D=A // 9599
@SP // 9600
AM=M+1 // 9601
A=A-1 // 9602
M=D // 9603
@51 // 9604
D=A // 9605
@SP // 9606
AM=M+1 // 9607
A=A-1 // 9608
M=D // 9609
@51 // 9610
D=A // 9611
@SP // 9612
AM=M+1 // 9613
A=A-1 // 9614
M=D // 9615
@63 // 9616
D=A // 9617
@SP // 9618
AM=M+1 // 9619
A=A-1 // 9620
M=D // 9621
@59 // 9622
D=A // 9623
@SP // 9624
AM=M+1 // 9625
A=A-1 // 9626
M=D // 9627
@30 // 9628
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
@SP // 9640
AM=M+1 // 9641
A=A-1 // 9642
M=0 // 9643
// call Output.create
@17 // 9644
D=A // 9645
@14 // 9646
M=D // 9647
@Output.create // 9648
D=A // 9649
@13 // 9650
M=D // 9651
@Output.init.ret.51 // 9652
D=A // 9653
@CALL // 9654
0;JMP // 9655
(Output.init.ret.51)
@SP // 9656
M=M-1 // 9657

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9658
D=A // 9659
@SP // 9660
AM=M+1 // 9661
A=A-1 // 9662
M=D // 9663
@31 // 9664
D=A // 9665
@SP // 9666
AM=M+1 // 9667
A=A-1 // 9668
M=D // 9669
@51 // 9670
D=A // 9671
@SP // 9672
AM=M+1 // 9673
A=A-1 // 9674
M=D // 9675
@51 // 9676
D=A // 9677
@SP // 9678
AM=M+1 // 9679
A=A-1 // 9680
M=D // 9681
@51 // 9682
D=A // 9683
@SP // 9684
AM=M+1 // 9685
A=A-1 // 9686
M=D // 9687
@31 // 9688
D=A // 9689
@SP // 9690
AM=M+1 // 9691
A=A-1 // 9692
M=D // 9693
@27 // 9694
D=A // 9695
@SP // 9696
AM=M+1 // 9697
A=A-1 // 9698
M=D // 9699
@51 // 9700
D=A // 9701
@SP // 9702
AM=M+1 // 9703
A=A-1 // 9704
M=D // 9705
@51 // 9706
D=A // 9707
@SP // 9708
AM=M+1 // 9709
A=A-1 // 9710
M=D // 9711
@51 // 9712
D=A // 9713
@SP // 9714
AM=M+1 // 9715
A=A-1 // 9716
M=D // 9717
@SP // 9718
AM=M+1 // 9719
A=A-1 // 9720
M=0 // 9721
@SP // 9722
AM=M+1 // 9723
A=A-1 // 9724
M=0 // 9725
// call Output.create
@17 // 9726
D=A // 9727
@14 // 9728
M=D // 9729
@Output.create // 9730
D=A // 9731
@13 // 9732
M=D // 9733
@Output.init.ret.52 // 9734
D=A // 9735
@CALL // 9736
0;JMP // 9737
(Output.init.ret.52)
@SP // 9738
M=M-1 // 9739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9740
D=A // 9741
@SP // 9742
AM=M+1 // 9743
A=A-1 // 9744
M=D // 9745
@30 // 9746
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
@51 // 9758
D=A // 9759
@SP // 9760
AM=M+1 // 9761
A=A-1 // 9762
M=D // 9763
@6 // 9764
D=A // 9765
@SP // 9766
AM=M+1 // 9767
A=A-1 // 9768
M=D // 9769
@28 // 9770
D=A // 9771
@SP // 9772
AM=M+1 // 9773
A=A-1 // 9774
M=D // 9775
@48 // 9776
D=A // 9777
@SP // 9778
AM=M+1 // 9779
A=A-1 // 9780
M=D // 9781
@51 // 9782
D=A // 9783
@SP // 9784
AM=M+1 // 9785
A=A-1 // 9786
M=D // 9787
@51 // 9788
D=A // 9789
@SP // 9790
AM=M+1 // 9791
A=A-1 // 9792
M=D // 9793
@30 // 9794
D=A // 9795
@SP // 9796
AM=M+1 // 9797
A=A-1 // 9798
M=D // 9799
@SP // 9800
AM=M+1 // 9801
A=A-1 // 9802
M=0 // 9803
@SP // 9804
AM=M+1 // 9805
A=A-1 // 9806
M=0 // 9807
// call Output.create
@17 // 9808
D=A // 9809
@14 // 9810
M=D // 9811
@Output.create // 9812
D=A // 9813
@13 // 9814
M=D // 9815
@Output.init.ret.53 // 9816
D=A // 9817
@CALL // 9818
0;JMP // 9819
(Output.init.ret.53)
@SP // 9820
M=M-1 // 9821

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9822
D=A // 9823
@SP // 9824
AM=M+1 // 9825
A=A-1 // 9826
M=D // 9827
@63 // 9828
D=A // 9829
@SP // 9830
AM=M+1 // 9831
A=A-1 // 9832
M=D // 9833
@63 // 9834
D=A // 9835
@SP // 9836
AM=M+1 // 9837
A=A-1 // 9838
M=D // 9839
@45 // 9840
D=A // 9841
@SP // 9842
AM=M+1 // 9843
A=A-1 // 9844
M=D // 9845
@12 // 9846
D=A // 9847
@SP // 9848
AM=M+1 // 9849
A=A-1 // 9850
M=D // 9851
@12 // 9852
D=A // 9853
@SP // 9854
AM=M+1 // 9855
A=A-1 // 9856
M=D // 9857
@12 // 9858
D=A // 9859
@SP // 9860
AM=M+1 // 9861
A=A-1 // 9862
M=D // 9863
@12 // 9864
D=A // 9865
@SP // 9866
AM=M+1 // 9867
A=A-1 // 9868
M=D // 9869
@12 // 9870
D=A // 9871
@SP // 9872
AM=M+1 // 9873
A=A-1 // 9874
M=D // 9875
@30 // 9876
D=A // 9877
@SP // 9878
AM=M+1 // 9879
A=A-1 // 9880
M=D // 9881
@SP // 9882
AM=M+1 // 9883
A=A-1 // 9884
M=0 // 9885
@SP // 9886
AM=M+1 // 9887
A=A-1 // 9888
M=0 // 9889
// call Output.create
@17 // 9890
D=A // 9891
@14 // 9892
M=D // 9893
@Output.create // 9894
D=A // 9895
@13 // 9896
M=D // 9897
@Output.init.ret.54 // 9898
D=A // 9899
@CALL // 9900
0;JMP // 9901
(Output.init.ret.54)
@SP // 9902
M=M-1 // 9903

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9904
D=A // 9905
@SP // 9906
AM=M+1 // 9907
A=A-1 // 9908
M=D // 9909
@51 // 9910
D=A // 9911
@SP // 9912
AM=M+1 // 9913
A=A-1 // 9914
M=D // 9915
@51 // 9916
D=A // 9917
@SP // 9918
AM=M+1 // 9919
A=A-1 // 9920
M=D // 9921
@51 // 9922
D=A // 9923
@SP // 9924
AM=M+1 // 9925
A=A-1 // 9926
M=D // 9927
@51 // 9928
D=A // 9929
@SP // 9930
AM=M+1 // 9931
A=A-1 // 9932
M=D // 9933
@51 // 9934
D=A // 9935
@SP // 9936
AM=M+1 // 9937
A=A-1 // 9938
M=D // 9939
@51 // 9940
D=A // 9941
@SP // 9942
AM=M+1 // 9943
A=A-1 // 9944
M=D // 9945
@51 // 9946
D=A // 9947
@SP // 9948
AM=M+1 // 9949
A=A-1 // 9950
M=D // 9951
@51 // 9952
D=A // 9953
@SP // 9954
AM=M+1 // 9955
A=A-1 // 9956
M=D // 9957
@30 // 9958
D=A // 9959
@SP // 9960
AM=M+1 // 9961
A=A-1 // 9962
M=D // 9963
@SP // 9964
AM=M+1 // 9965
A=A-1 // 9966
M=0 // 9967
@SP // 9968
AM=M+1 // 9969
A=A-1 // 9970
M=0 // 9971
// call Output.create
@17 // 9972
D=A // 9973
@14 // 9974
M=D // 9975
@Output.create // 9976
D=A // 9977
@13 // 9978
M=D // 9979
@Output.init.ret.55 // 9980
D=A // 9981
@CALL // 9982
0;JMP // 9983
(Output.init.ret.55)
@SP // 9984
M=M-1 // 9985

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9986
D=A // 9987
@SP // 9988
AM=M+1 // 9989
A=A-1 // 9990
M=D // 9991
@51 // 9992
D=A // 9993
@SP // 9994
AM=M+1 // 9995
A=A-1 // 9996
M=D // 9997
@51 // 9998
D=A // 9999
@SP // 10000
AM=M+1 // 10001
A=A-1 // 10002
M=D // 10003
@51 // 10004
D=A // 10005
@SP // 10006
AM=M+1 // 10007
A=A-1 // 10008
M=D // 10009
@51 // 10010
D=A // 10011
@SP // 10012
AM=M+1 // 10013
A=A-1 // 10014
M=D // 10015
@51 // 10016
D=A // 10017
@SP // 10018
AM=M+1 // 10019
A=A-1 // 10020
M=D // 10021
@30 // 10022
D=A // 10023
@SP // 10024
AM=M+1 // 10025
A=A-1 // 10026
M=D // 10027
@30 // 10028
D=A // 10029
@SP // 10030
AM=M+1 // 10031
A=A-1 // 10032
M=D // 10033
@12 // 10034
D=A // 10035
@SP // 10036
AM=M+1 // 10037
A=A-1 // 10038
M=D // 10039
@12 // 10040
D=A // 10041
@SP // 10042
AM=M+1 // 10043
A=A-1 // 10044
M=D // 10045
@SP // 10046
AM=M+1 // 10047
A=A-1 // 10048
M=0 // 10049
@SP // 10050
AM=M+1 // 10051
A=A-1 // 10052
M=0 // 10053
// call Output.create
@17 // 10054
D=A // 10055
@14 // 10056
M=D // 10057
@Output.create // 10058
D=A // 10059
@13 // 10060
M=D // 10061
@Output.init.ret.56 // 10062
D=A // 10063
@CALL // 10064
0;JMP // 10065
(Output.init.ret.56)
@SP // 10066
M=M-1 // 10067

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10068
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
@51 // 10086
D=A // 10087
@SP // 10088
AM=M+1 // 10089
A=A-1 // 10090
M=D // 10091
@51 // 10092
D=A // 10093
@SP // 10094
AM=M+1 // 10095
A=A-1 // 10096
M=D // 10097
@51 // 10098
D=A // 10099
@SP // 10100
AM=M+1 // 10101
A=A-1 // 10102
M=D // 10103
@63 // 10104
D=A // 10105
@SP // 10106
AM=M+1 // 10107
A=A-1 // 10108
M=D // 10109
@63 // 10110
D=A // 10111
@SP // 10112
AM=M+1 // 10113
A=A-1 // 10114
M=D // 10115
@63 // 10116
D=A // 10117
@SP // 10118
AM=M+1 // 10119
A=A-1 // 10120
M=D // 10121
@18 // 10122
D=A // 10123
@SP // 10124
AM=M+1 // 10125
A=A-1 // 10126
M=D // 10127
@SP // 10128
AM=M+1 // 10129
A=A-1 // 10130
M=0 // 10131
@SP // 10132
AM=M+1 // 10133
A=A-1 // 10134
M=0 // 10135
// call Output.create
@17 // 10136
D=A // 10137
@14 // 10138
M=D // 10139
@Output.create // 10140
D=A // 10141
@13 // 10142
M=D // 10143
@Output.init.ret.57 // 10144
D=A // 10145
@CALL // 10146
0;JMP // 10147
(Output.init.ret.57)
@SP // 10148
M=M-1 // 10149

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10150
D=A // 10151
@SP // 10152
AM=M+1 // 10153
A=A-1 // 10154
M=D // 10155
@51 // 10156
D=A // 10157
@SP // 10158
AM=M+1 // 10159
A=A-1 // 10160
M=D // 10161
@51 // 10162
D=A // 10163
@SP // 10164
AM=M+1 // 10165
A=A-1 // 10166
M=D // 10167
@30 // 10168
D=A // 10169
@SP // 10170
AM=M+1 // 10171
A=A-1 // 10172
M=D // 10173
@30 // 10174
D=A // 10175
@SP // 10176
AM=M+1 // 10177
A=A-1 // 10178
M=D // 10179
@12 // 10180
D=A // 10181
@SP // 10182
AM=M+1 // 10183
A=A-1 // 10184
M=D // 10185
@30 // 10186
D=A // 10187
@SP // 10188
AM=M+1 // 10189
A=A-1 // 10190
M=D // 10191
@30 // 10192
D=A // 10193
@SP // 10194
AM=M+1 // 10195
A=A-1 // 10196
M=D // 10197
@51 // 10198
D=A // 10199
@SP // 10200
AM=M+1 // 10201
A=A-1 // 10202
M=D // 10203
@51 // 10204
D=A // 10205
@SP // 10206
AM=M+1 // 10207
A=A-1 // 10208
M=D // 10209
@SP // 10210
AM=M+1 // 10211
A=A-1 // 10212
M=0 // 10213
@SP // 10214
AM=M+1 // 10215
A=A-1 // 10216
M=0 // 10217
// call Output.create
@17 // 10218
D=A // 10219
@14 // 10220
M=D // 10221
@Output.create // 10222
D=A // 10223
@13 // 10224
M=D // 10225
@Output.init.ret.58 // 10226
D=A // 10227
@CALL // 10228
0;JMP // 10229
(Output.init.ret.58)
@SP // 10230
M=M-1 // 10231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10232
D=A // 10233
@SP // 10234
AM=M+1 // 10235
A=A-1 // 10236
M=D // 10237
@51 // 10238
D=A // 10239
@SP // 10240
AM=M+1 // 10241
A=A-1 // 10242
M=D // 10243
@51 // 10244
D=A // 10245
@SP // 10246
AM=M+1 // 10247
A=A-1 // 10248
M=D // 10249
@51 // 10250
D=A // 10251
@SP // 10252
AM=M+1 // 10253
A=A-1 // 10254
M=D // 10255
@51 // 10256
D=A // 10257
@SP // 10258
AM=M+1 // 10259
A=A-1 // 10260
M=D // 10261
@30 // 10262
D=A // 10263
@SP // 10264
AM=M+1 // 10265
A=A-1 // 10266
M=D // 10267
@12 // 10268
D=A // 10269
@SP // 10270
AM=M+1 // 10271
A=A-1 // 10272
M=D // 10273
@12 // 10274
D=A // 10275
@SP // 10276
AM=M+1 // 10277
A=A-1 // 10278
M=D // 10279
@12 // 10280
D=A // 10281
@SP // 10282
AM=M+1 // 10283
A=A-1 // 10284
M=D // 10285
@30 // 10286
D=A // 10287
@SP // 10288
AM=M+1 // 10289
A=A-1 // 10290
M=D // 10291
@SP // 10292
AM=M+1 // 10293
A=A-1 // 10294
M=0 // 10295
@SP // 10296
AM=M+1 // 10297
A=A-1 // 10298
M=0 // 10299
// call Output.create
@17 // 10300
D=A // 10301
@14 // 10302
M=D // 10303
@Output.create // 10304
D=A // 10305
@13 // 10306
M=D // 10307
@Output.init.ret.59 // 10308
D=A // 10309
@CALL // 10310
0;JMP // 10311
(Output.init.ret.59)
@SP // 10312
M=M-1 // 10313

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10314
D=A // 10315
@SP // 10316
AM=M+1 // 10317
A=A-1 // 10318
M=D // 10319
@63 // 10320
D=A // 10321
@SP // 10322
AM=M+1 // 10323
A=A-1 // 10324
M=D // 10325
@51 // 10326
D=A // 10327
@SP // 10328
AM=M+1 // 10329
A=A-1 // 10330
M=D // 10331
@49 // 10332
D=A // 10333
@SP // 10334
AM=M+1 // 10335
A=A-1 // 10336
M=D // 10337
@24 // 10338
D=A // 10339
@SP // 10340
AM=M+1 // 10341
A=A-1 // 10342
M=D // 10343
@12 // 10344
D=A // 10345
@SP // 10346
AM=M+1 // 10347
A=A-1 // 10348
M=D // 10349
@6 // 10350
D=A // 10351
@SP // 10352
AM=M+1 // 10353
A=A-1 // 10354
M=D // 10355
@35 // 10356
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
@63 // 10368
D=A // 10369
@SP // 10370
AM=M+1 // 10371
A=A-1 // 10372
M=D // 10373
@SP // 10374
AM=M+1 // 10375
A=A-1 // 10376
M=0 // 10377
@SP // 10378
AM=M+1 // 10379
A=A-1 // 10380
M=0 // 10381
// call Output.create
@17 // 10382
D=A // 10383
@14 // 10384
M=D // 10385
@Output.create // 10386
D=A // 10387
@13 // 10388
M=D // 10389
@Output.init.ret.60 // 10390
D=A // 10391
@CALL // 10392
0;JMP // 10393
(Output.init.ret.60)
@SP // 10394
M=M-1 // 10395

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10396
D=A // 10397
@SP // 10398
AM=M+1 // 10399
A=A-1 // 10400
M=D // 10401
@30 // 10402
D=A // 10403
@SP // 10404
AM=M+1 // 10405
A=A-1 // 10406
M=D // 10407
@6 // 10408
D=A // 10409
@SP // 10410
AM=M+1 // 10411
A=A-1 // 10412
M=D // 10413
@6 // 10414
D=A // 10415
@SP // 10416
AM=M+1 // 10417
A=A-1 // 10418
M=D // 10419
@6 // 10420
D=A // 10421
@SP // 10422
AM=M+1 // 10423
A=A-1 // 10424
M=D // 10425
@6 // 10426
D=A // 10427
@SP // 10428
AM=M+1 // 10429
A=A-1 // 10430
M=D // 10431
@6 // 10432
D=A // 10433
@SP // 10434
AM=M+1 // 10435
A=A-1 // 10436
M=D // 10437
@6 // 10438
D=A // 10439
@SP // 10440
AM=M+1 // 10441
A=A-1 // 10442
M=D // 10443
@6 // 10444
D=A // 10445
@SP // 10446
AM=M+1 // 10447
A=A-1 // 10448
M=D // 10449
@30 // 10450
D=A // 10451
@SP // 10452
AM=M+1 // 10453
A=A-1 // 10454
M=D // 10455
@SP // 10456
AM=M+1 // 10457
A=A-1 // 10458
M=0 // 10459
@SP // 10460
AM=M+1 // 10461
A=A-1 // 10462
M=0 // 10463
// call Output.create
@17 // 10464
D=A // 10465
@14 // 10466
M=D // 10467
@Output.create // 10468
D=A // 10469
@13 // 10470
M=D // 10471
@Output.init.ret.61 // 10472
D=A // 10473
@CALL // 10474
0;JMP // 10475
(Output.init.ret.61)
@SP // 10476
M=M-1 // 10477

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10478
D=A // 10479
@SP // 10480
M=D+M // 10481
@92 // 10482
D=A // 10483
@SP // 10484
A=M-1 // 10485
M=1 // 10486
A=A-1 // 10487
M=0 // 10488
A=A-1 // 10489
M=0 // 10490
A=A-1 // 10491
M=D // 10492
A=A-1 // 10493
@3 // 10494
D=A // 10495
@SP // 10496
AM=M+1 // 10497
A=A-1 // 10498
M=D // 10499
@6 // 10500
D=A // 10501
@SP // 10502
AM=M+1 // 10503
A=A-1 // 10504
M=D // 10505
@12 // 10506
D=A // 10507
@SP // 10508
AM=M+1 // 10509
A=A-1 // 10510
M=D // 10511
@24 // 10512
D=A // 10513
@SP // 10514
AM=M+1 // 10515
A=A-1 // 10516
M=D // 10517
@48 // 10518
D=A // 10519
@SP // 10520
AM=M+1 // 10521
A=A-1 // 10522
M=D // 10523
@32 // 10524
D=A // 10525
@SP // 10526
AM=M+1 // 10527
A=A-1 // 10528
M=D // 10529
@SP // 10530
AM=M+1 // 10531
A=A-1 // 10532
M=0 // 10533
@SP // 10534
AM=M+1 // 10535
A=A-1 // 10536
M=0 // 10537
// call Output.create
@17 // 10538
D=A // 10539
@14 // 10540
M=D // 10541
@Output.create // 10542
D=A // 10543
@13 // 10544
M=D // 10545
@Output.init.ret.62 // 10546
D=A // 10547
@CALL // 10548
0;JMP // 10549
(Output.init.ret.62)
@SP // 10550
M=M-1 // 10551

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10552
D=A // 10553
@SP // 10554
AM=M+1 // 10555
A=A-1 // 10556
M=D // 10557
@30 // 10558
D=A // 10559
@SP // 10560
AM=M+1 // 10561
A=A-1 // 10562
M=D // 10563
@24 // 10564
D=A // 10565
@SP // 10566
AM=M+1 // 10567
A=A-1 // 10568
M=D // 10569
@24 // 10570
D=A // 10571
@SP // 10572
AM=M+1 // 10573
A=A-1 // 10574
M=D // 10575
@24 // 10576
D=A // 10577
@SP // 10578
AM=M+1 // 10579
A=A-1 // 10580
M=D // 10581
@24 // 10582
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
@24 // 10594
D=A // 10595
@SP // 10596
AM=M+1 // 10597
A=A-1 // 10598
M=D // 10599
@24 // 10600
D=A // 10601
@SP // 10602
AM=M+1 // 10603
A=A-1 // 10604
M=D // 10605
@30 // 10606
D=A // 10607
@SP // 10608
AM=M+1 // 10609
A=A-1 // 10610
M=D // 10611
@SP // 10612
AM=M+1 // 10613
A=A-1 // 10614
M=0 // 10615
@SP // 10616
AM=M+1 // 10617
A=A-1 // 10618
M=0 // 10619
// call Output.create
@17 // 10620
D=A // 10621
@14 // 10622
M=D // 10623
@Output.create // 10624
D=A // 10625
@13 // 10626
M=D // 10627
@Output.init.ret.63 // 10628
D=A // 10629
@CALL // 10630
0;JMP // 10631
(Output.init.ret.63)
@SP // 10632
M=M-1 // 10633

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10634
D=A // 10635
@SP // 10636
AM=M+1 // 10637
A=A-1 // 10638
M=D // 10639
@8 // 10640
D=A // 10641
@SP // 10642
AM=M+1 // 10643
A=A-1 // 10644
M=D // 10645
@28 // 10646
D=A // 10647
@SP // 10648
AM=M+1 // 10649
A=A-1 // 10650
M=D // 10651
@54 // 10652
D=A // 10653
@SP // 10654
AM=M+1 // 10655
A=A-1 // 10656
M=D // 10657
@SP // 10658
AM=M+1 // 10659
A=A-1 // 10660
M=0 // 10661
@SP // 10662
AM=M+1 // 10663
A=A-1 // 10664
M=0 // 10665
@SP // 10666
AM=M+1 // 10667
A=A-1 // 10668
M=0 // 10669
@SP // 10670
AM=M+1 // 10671
A=A-1 // 10672
M=0 // 10673
@SP // 10674
AM=M+1 // 10675
A=A-1 // 10676
M=0 // 10677
@SP // 10678
AM=M+1 // 10679
A=A-1 // 10680
M=0 // 10681
@SP // 10682
AM=M+1 // 10683
A=A-1 // 10684
M=0 // 10685
@SP // 10686
AM=M+1 // 10687
A=A-1 // 10688
M=0 // 10689
// call Output.create
@17 // 10690
D=A // 10691
@14 // 10692
M=D // 10693
@Output.create // 10694
D=A // 10695
@13 // 10696
M=D // 10697
@Output.init.ret.64 // 10698
D=A // 10699
@CALL // 10700
0;JMP // 10701
(Output.init.ret.64)
@SP // 10702
M=M-1 // 10703

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10704
D=A // 10705
@SP // 10706
M=D+M // 10707
@95 // 10708
D=A // 10709
@SP // 10710
A=M-1 // 10711
M=0 // 10712
A=A-1 // 10713
M=0 // 10714
A=A-1 // 10715
M=0 // 10716
A=A-1 // 10717
M=0 // 10718
A=A-1 // 10719
M=0 // 10720
A=A-1 // 10721
M=0 // 10722
A=A-1 // 10723
M=0 // 10724
A=A-1 // 10725
M=0 // 10726
A=A-1 // 10727
M=0 // 10728
A=A-1 // 10729
M=D // 10730
A=A-1 // 10731
@2 // 10732
D=A // 10733
@SP // 10734
M=D+M // 10735
@63 // 10736
D=A // 10737
@SP // 10738
A=M-1 // 10739
M=0 // 10740
A=A-1 // 10741
M=D // 10742
A=A-1 // 10743
// call Output.create
@17 // 10744
D=A // 10745
@14 // 10746
M=D // 10747
@Output.create // 10748
D=A // 10749
@13 // 10750
M=D // 10751
@Output.init.ret.65 // 10752
D=A // 10753
@CALL // 10754
0;JMP // 10755
(Output.init.ret.65)
@SP // 10756
M=M-1 // 10757

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10758
D=A // 10759
@SP // 10760
AM=M+1 // 10761
A=A-1 // 10762
M=D // 10763
@6 // 10764
D=A // 10765
@SP // 10766
AM=M+1 // 10767
A=A-1 // 10768
M=D // 10769
@12 // 10770
D=A // 10771
@SP // 10772
AM=M+1 // 10773
A=A-1 // 10774
M=D // 10775
@24 // 10776
D=A // 10777
@SP // 10778
AM=M+1 // 10779
A=A-1 // 10780
M=D // 10781
@SP // 10782
AM=M+1 // 10783
A=A-1 // 10784
M=0 // 10785
@SP // 10786
AM=M+1 // 10787
A=A-1 // 10788
M=0 // 10789
@SP // 10790
AM=M+1 // 10791
A=A-1 // 10792
M=0 // 10793
@SP // 10794
AM=M+1 // 10795
A=A-1 // 10796
M=0 // 10797
@SP // 10798
AM=M+1 // 10799
A=A-1 // 10800
M=0 // 10801
@SP // 10802
AM=M+1 // 10803
A=A-1 // 10804
M=0 // 10805
@SP // 10806
AM=M+1 // 10807
A=A-1 // 10808
M=0 // 10809
@SP // 10810
AM=M+1 // 10811
A=A-1 // 10812
M=0 // 10813
// call Output.create
@17 // 10814
D=A // 10815
@14 // 10816
M=D // 10817
@Output.create // 10818
D=A // 10819
@13 // 10820
M=D // 10821
@Output.init.ret.66 // 10822
D=A // 10823
@CALL // 10824
0;JMP // 10825
(Output.init.ret.66)
@SP // 10826
M=M-1 // 10827

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10828
D=A // 10829
@SP // 10830
M=D+M // 10831
@97 // 10832
D=A // 10833
@SP // 10834
A=M-1 // 10835
M=0 // 10836
A=A-1 // 10837
M=0 // 10838
A=A-1 // 10839
M=0 // 10840
A=A-1 // 10841
M=D // 10842
A=A-1 // 10843
@14 // 10844
D=A // 10845
@SP // 10846
AM=M+1 // 10847
A=A-1 // 10848
M=D // 10849
@24 // 10850
D=A // 10851
@SP // 10852
AM=M+1 // 10853
A=A-1 // 10854
M=D // 10855
@30 // 10856
D=A // 10857
@SP // 10858
AM=M+1 // 10859
A=A-1 // 10860
M=D // 10861
@27 // 10862
D=A // 10863
@SP // 10864
AM=M+1 // 10865
A=A-1 // 10866
M=D // 10867
@27 // 10868
D=A // 10869
@SP // 10870
AM=M+1 // 10871
A=A-1 // 10872
M=D // 10873
@54 // 10874
D=A // 10875
@SP // 10876
AM=M+1 // 10877
A=A-1 // 10878
M=D // 10879
@SP // 10880
AM=M+1 // 10881
A=A-1 // 10882
M=0 // 10883
@SP // 10884
AM=M+1 // 10885
A=A-1 // 10886
M=0 // 10887
// call Output.create
@17 // 10888
D=A // 10889
@14 // 10890
M=D // 10891
@Output.create // 10892
D=A // 10893
@13 // 10894
M=D // 10895
@Output.init.ret.67 // 10896
D=A // 10897
@CALL // 10898
0;JMP // 10899
(Output.init.ret.67)
@SP // 10900
M=M-1 // 10901

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10902
D=A // 10903
@SP // 10904
AM=M+1 // 10905
A=A-1 // 10906
M=D // 10907
@3 // 10908
D=A // 10909
@SP // 10910
AM=M+1 // 10911
A=A-1 // 10912
M=D // 10913
@3 // 10914
D=A // 10915
@SP // 10916
AM=M+1 // 10917
A=A-1 // 10918
M=D // 10919
@3 // 10920
D=A // 10921
@SP // 10922
AM=M+1 // 10923
A=A-1 // 10924
M=D // 10925
@15 // 10926
D=A // 10927
@SP // 10928
AM=M+1 // 10929
A=A-1 // 10930
M=D // 10931
@27 // 10932
D=A // 10933
@SP // 10934
AM=M+1 // 10935
A=A-1 // 10936
M=D // 10937
@51 // 10938
D=A // 10939
@SP // 10940
AM=M+1 // 10941
A=A-1 // 10942
M=D // 10943
@51 // 10944
D=A // 10945
@SP // 10946
AM=M+1 // 10947
A=A-1 // 10948
M=D // 10949
@51 // 10950
D=A // 10951
@SP // 10952
AM=M+1 // 10953
A=A-1 // 10954
M=D // 10955
@30 // 10956
D=A // 10957
@SP // 10958
AM=M+1 // 10959
A=A-1 // 10960
M=D // 10961
@SP // 10962
AM=M+1 // 10963
A=A-1 // 10964
M=0 // 10965
@SP // 10966
AM=M+1 // 10967
A=A-1 // 10968
M=0 // 10969
// call Output.create
@17 // 10970
D=A // 10971
@14 // 10972
M=D // 10973
@Output.create // 10974
D=A // 10975
@13 // 10976
M=D // 10977
@Output.init.ret.68 // 10978
D=A // 10979
@CALL // 10980
0;JMP // 10981
(Output.init.ret.68)
@SP // 10982
M=M-1 // 10983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10984
D=A // 10985
@SP // 10986
M=D+M // 10987
@99 // 10988
D=A // 10989
@SP // 10990
A=M-1 // 10991
M=0 // 10992
A=A-1 // 10993
M=0 // 10994
A=A-1 // 10995
M=0 // 10996
A=A-1 // 10997
M=D // 10998
A=A-1 // 10999
@30 // 11000
D=A // 11001
@SP // 11002
AM=M+1 // 11003
A=A-1 // 11004
M=D // 11005
@51 // 11006
D=A // 11007
@SP // 11008
AM=M+1 // 11009
A=A-1 // 11010
M=D // 11011
@3 // 11012
D=A // 11013
@SP // 11014
AM=M+1 // 11015
A=A-1 // 11016
M=D // 11017
@3 // 11018
D=A // 11019
@SP // 11020
AM=M+1 // 11021
A=A-1 // 11022
M=D // 11023
@51 // 11024
D=A // 11025
@SP // 11026
AM=M+1 // 11027
A=A-1 // 11028
M=D // 11029
@30 // 11030
D=A // 11031
@SP // 11032
AM=M+1 // 11033
A=A-1 // 11034
M=D // 11035
@SP // 11036
AM=M+1 // 11037
A=A-1 // 11038
M=0 // 11039
@SP // 11040
AM=M+1 // 11041
A=A-1 // 11042
M=0 // 11043
// call Output.create
@17 // 11044
D=A // 11045
@14 // 11046
M=D // 11047
@Output.create // 11048
D=A // 11049
@13 // 11050
M=D // 11051
@Output.init.ret.69 // 11052
D=A // 11053
@CALL // 11054
0;JMP // 11055
(Output.init.ret.69)
@SP // 11056
M=M-1 // 11057

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11058
D=A // 11059
@SP // 11060
AM=M+1 // 11061
A=A-1 // 11062
M=D // 11063
@48 // 11064
D=A // 11065
@SP // 11066
AM=M+1 // 11067
A=A-1 // 11068
M=D // 11069
@48 // 11070
D=A // 11071
@SP // 11072
AM=M+1 // 11073
A=A-1 // 11074
M=D // 11075
@48 // 11076
D=A // 11077
@SP // 11078
AM=M+1 // 11079
A=A-1 // 11080
M=D // 11081
@60 // 11082
D=A // 11083
@SP // 11084
AM=M+1 // 11085
A=A-1 // 11086
M=D // 11087
@54 // 11088
D=A // 11089
@SP // 11090
AM=M+1 // 11091
A=A-1 // 11092
M=D // 11093
@51 // 11094
D=A // 11095
@SP // 11096
AM=M+1 // 11097
A=A-1 // 11098
M=D // 11099
@51 // 11100
D=A // 11101
@SP // 11102
AM=M+1 // 11103
A=A-1 // 11104
M=D // 11105
@51 // 11106
D=A // 11107
@SP // 11108
AM=M+1 // 11109
A=A-1 // 11110
M=D // 11111
@30 // 11112
D=A // 11113
@SP // 11114
AM=M+1 // 11115
A=A-1 // 11116
M=D // 11117
@SP // 11118
AM=M+1 // 11119
A=A-1 // 11120
M=0 // 11121
@SP // 11122
AM=M+1 // 11123
A=A-1 // 11124
M=0 // 11125
// call Output.create
@17 // 11126
D=A // 11127
@14 // 11128
M=D // 11129
@Output.create // 11130
D=A // 11131
@13 // 11132
M=D // 11133
@Output.init.ret.70 // 11134
D=A // 11135
@CALL // 11136
0;JMP // 11137
(Output.init.ret.70)
@SP // 11138
M=M-1 // 11139

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11140
D=A // 11141
@SP // 11142
M=D+M // 11143
@101 // 11144
D=A // 11145
@SP // 11146
A=M-1 // 11147
M=0 // 11148
A=A-1 // 11149
M=0 // 11150
A=A-1 // 11151
M=0 // 11152
A=A-1 // 11153
M=D // 11154
A=A-1 // 11155
@30 // 11156
D=A // 11157
@SP // 11158
AM=M+1 // 11159
A=A-1 // 11160
M=D // 11161
@51 // 11162
D=A // 11163
@SP // 11164
AM=M+1 // 11165
A=A-1 // 11166
M=D // 11167
@63 // 11168
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
@51 // 11180
D=A // 11181
@SP // 11182
AM=M+1 // 11183
A=A-1 // 11184
M=D // 11185
@30 // 11186
D=A // 11187
@SP // 11188
AM=M+1 // 11189
A=A-1 // 11190
M=D // 11191
@SP // 11192
AM=M+1 // 11193
A=A-1 // 11194
M=0 // 11195
@SP // 11196
AM=M+1 // 11197
A=A-1 // 11198
M=0 // 11199
// call Output.create
@17 // 11200
D=A // 11201
@14 // 11202
M=D // 11203
@Output.create // 11204
D=A // 11205
@13 // 11206
M=D // 11207
@Output.init.ret.71 // 11208
D=A // 11209
@CALL // 11210
0;JMP // 11211
(Output.init.ret.71)
@SP // 11212
M=M-1 // 11213

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11214
D=A // 11215
@SP // 11216
AM=M+1 // 11217
A=A-1 // 11218
M=D // 11219
@28 // 11220
D=A // 11221
@SP // 11222
AM=M+1 // 11223
A=A-1 // 11224
M=D // 11225
@54 // 11226
D=A // 11227
@SP // 11228
AM=M+1 // 11229
A=A-1 // 11230
M=D // 11231
@38 // 11232
D=A // 11233
@SP // 11234
AM=M+1 // 11235
A=A-1 // 11236
M=D // 11237
@6 // 11238
D=A // 11239
@SP // 11240
AM=M+1 // 11241
A=A-1 // 11242
M=D // 11243
@15 // 11244
D=A // 11245
@SP // 11246
AM=M+1 // 11247
A=A-1 // 11248
M=D // 11249
@6 // 11250
D=A // 11251
@SP // 11252
AM=M+1 // 11253
A=A-1 // 11254
M=D // 11255
@6 // 11256
D=A // 11257
@SP // 11258
AM=M+1 // 11259
A=A-1 // 11260
M=D // 11261
@6 // 11262
D=A // 11263
@SP // 11264
AM=M+1 // 11265
A=A-1 // 11266
M=D // 11267
@15 // 11268
D=A // 11269
@SP // 11270
AM=M+1 // 11271
A=A-1 // 11272
M=D // 11273
@SP // 11274
AM=M+1 // 11275
A=A-1 // 11276
M=0 // 11277
@SP // 11278
AM=M+1 // 11279
A=A-1 // 11280
M=0 // 11281
// call Output.create
@17 // 11282
D=A // 11283
@14 // 11284
M=D // 11285
@Output.create // 11286
D=A // 11287
@13 // 11288
M=D // 11289
@Output.init.ret.72 // 11290
D=A // 11291
@CALL // 11292
0;JMP // 11293
(Output.init.ret.72)
@SP // 11294
M=M-1 // 11295

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11296
D=A // 11297
@SP // 11298
M=D+M // 11299
@103 // 11300
D=A // 11301
@SP // 11302
A=M-1 // 11303
M=0 // 11304
A=A-1 // 11305
M=0 // 11306
A=A-1 // 11307
M=D // 11308
A=A-1 // 11309
@30 // 11310
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
@51 // 11322
D=A // 11323
@SP // 11324
AM=M+1 // 11325
A=A-1 // 11326
M=D // 11327
@51 // 11328
D=A // 11329
@SP // 11330
AM=M+1 // 11331
A=A-1 // 11332
M=D // 11333
@62 // 11334
D=A // 11335
@SP // 11336
AM=M+1 // 11337
A=A-1 // 11338
M=D // 11339
@48 // 11340
D=A // 11341
@SP // 11342
AM=M+1 // 11343
A=A-1 // 11344
M=D // 11345
@51 // 11346
D=A // 11347
@SP // 11348
AM=M+1 // 11349
A=A-1 // 11350
M=D // 11351
@30 // 11352
D=A // 11353
@SP // 11354
AM=M+1 // 11355
A=A-1 // 11356
M=D // 11357
@SP // 11358
AM=M+1 // 11359
A=A-1 // 11360
M=0 // 11361
// call Output.create
@17 // 11362
D=A // 11363
@14 // 11364
M=D // 11365
@Output.create // 11366
D=A // 11367
@13 // 11368
M=D // 11369
@Output.init.ret.73 // 11370
D=A // 11371
@CALL // 11372
0;JMP // 11373
(Output.init.ret.73)
@SP // 11374
M=M-1 // 11375

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11376
D=A // 11377
@SP // 11378
AM=M+1 // 11379
A=A-1 // 11380
M=D // 11381
@3 // 11382
D=A // 11383
@SP // 11384
AM=M+1 // 11385
A=A-1 // 11386
M=D // 11387
@3 // 11388
D=A // 11389
@SP // 11390
AM=M+1 // 11391
A=A-1 // 11392
M=D // 11393
@3 // 11394
D=A // 11395
@SP // 11396
AM=M+1 // 11397
A=A-1 // 11398
M=D // 11399
@27 // 11400
D=A // 11401
@SP // 11402
AM=M+1 // 11403
A=A-1 // 11404
M=D // 11405
@55 // 11406
D=A // 11407
@SP // 11408
AM=M+1 // 11409
A=A-1 // 11410
M=D // 11411
@51 // 11412
D=A // 11413
@SP // 11414
AM=M+1 // 11415
A=A-1 // 11416
M=D // 11417
@51 // 11418
D=A // 11419
@SP // 11420
AM=M+1 // 11421
A=A-1 // 11422
M=D // 11423
@51 // 11424
D=A // 11425
@SP // 11426
AM=M+1 // 11427
A=A-1 // 11428
M=D // 11429
@51 // 11430
D=A // 11431
@SP // 11432
AM=M+1 // 11433
A=A-1 // 11434
M=D // 11435
@SP // 11436
AM=M+1 // 11437
A=A-1 // 11438
M=0 // 11439
@SP // 11440
AM=M+1 // 11441
A=A-1 // 11442
M=0 // 11443
// call Output.create
@17 // 11444
D=A // 11445
@14 // 11446
M=D // 11447
@Output.create // 11448
D=A // 11449
@13 // 11450
M=D // 11451
@Output.init.ret.74 // 11452
D=A // 11453
@CALL // 11454
0;JMP // 11455
(Output.init.ret.74)
@SP // 11456
M=M-1 // 11457

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11458
D=A // 11459
@SP // 11460
AM=M+1 // 11461
A=A-1 // 11462
M=D // 11463
@12 // 11464
D=A // 11465
@SP // 11466
AM=M+1 // 11467
A=A-1 // 11468
M=D // 11469
@12 // 11470
D=A // 11471
@SP // 11472
AM=M+1 // 11473
A=A-1 // 11474
M=D // 11475
@SP // 11476
AM=M+1 // 11477
A=A-1 // 11478
M=0 // 11479
@14 // 11480
D=A // 11481
@SP // 11482
AM=M+1 // 11483
A=A-1 // 11484
M=D // 11485
@12 // 11486
D=A // 11487
@SP // 11488
AM=M+1 // 11489
A=A-1 // 11490
M=D // 11491
@12 // 11492
D=A // 11493
@SP // 11494
AM=M+1 // 11495
A=A-1 // 11496
M=D // 11497
@12 // 11498
D=A // 11499
@SP // 11500
AM=M+1 // 11501
A=A-1 // 11502
M=D // 11503
@12 // 11504
D=A // 11505
@SP // 11506
AM=M+1 // 11507
A=A-1 // 11508
M=D // 11509
@30 // 11510
D=A // 11511
@SP // 11512
AM=M+1 // 11513
A=A-1 // 11514
M=D // 11515
@SP // 11516
AM=M+1 // 11517
A=A-1 // 11518
M=0 // 11519
@SP // 11520
AM=M+1 // 11521
A=A-1 // 11522
M=0 // 11523
// call Output.create
@17 // 11524
D=A // 11525
@14 // 11526
M=D // 11527
@Output.create // 11528
D=A // 11529
@13 // 11530
M=D // 11531
@Output.init.ret.75 // 11532
D=A // 11533
@CALL // 11534
0;JMP // 11535
(Output.init.ret.75)
@SP // 11536
M=M-1 // 11537

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11538
D=A // 11539
@SP // 11540
AM=M+1 // 11541
A=A-1 // 11542
M=D // 11543
@48 // 11544
D=A // 11545
@SP // 11546
AM=M+1 // 11547
A=A-1 // 11548
M=D // 11549
@48 // 11550
D=A // 11551
@SP // 11552
AM=M+1 // 11553
A=A-1 // 11554
M=D // 11555
@SP // 11556
AM=M+1 // 11557
A=A-1 // 11558
M=0 // 11559
@56 // 11560
D=A // 11561
@SP // 11562
AM=M+1 // 11563
A=A-1 // 11564
M=D // 11565
@48 // 11566
D=A // 11567
@SP // 11568
AM=M+1 // 11569
A=A-1 // 11570
M=D // 11571
@48 // 11572
D=A // 11573
@SP // 11574
AM=M+1 // 11575
A=A-1 // 11576
M=D // 11577
@48 // 11578
D=A // 11579
@SP // 11580
AM=M+1 // 11581
A=A-1 // 11582
M=D // 11583
@48 // 11584
D=A // 11585
@SP // 11586
AM=M+1 // 11587
A=A-1 // 11588
M=D // 11589
@51 // 11590
D=A // 11591
@SP // 11592
AM=M+1 // 11593
A=A-1 // 11594
M=D // 11595
@30 // 11596
D=A // 11597
@SP // 11598
AM=M+1 // 11599
A=A-1 // 11600
M=D // 11601
@SP // 11602
AM=M+1 // 11603
A=A-1 // 11604
M=0 // 11605
// call Output.create
@17 // 11606
D=A // 11607
@14 // 11608
M=D // 11609
@Output.create // 11610
D=A // 11611
@13 // 11612
M=D // 11613
@Output.init.ret.76 // 11614
D=A // 11615
@CALL // 11616
0;JMP // 11617
(Output.init.ret.76)
@SP // 11618
M=M-1 // 11619

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11620
D=A // 11621
@SP // 11622
AM=M+1 // 11623
A=A-1 // 11624
M=D // 11625
@3 // 11626
D=A // 11627
@SP // 11628
AM=M+1 // 11629
A=A-1 // 11630
M=D // 11631
@3 // 11632
D=A // 11633
@SP // 11634
AM=M+1 // 11635
A=A-1 // 11636
M=D // 11637
@3 // 11638
D=A // 11639
@SP // 11640
AM=M+1 // 11641
A=A-1 // 11642
M=D // 11643
@51 // 11644
D=A // 11645
@SP // 11646
AM=M+1 // 11647
A=A-1 // 11648
M=D // 11649
@27 // 11650
D=A // 11651
@SP // 11652
AM=M+1 // 11653
A=A-1 // 11654
M=D // 11655
@15 // 11656
D=A // 11657
@SP // 11658
AM=M+1 // 11659
A=A-1 // 11660
M=D // 11661
@15 // 11662
D=A // 11663
@SP // 11664
AM=M+1 // 11665
A=A-1 // 11666
M=D // 11667
@27 // 11668
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
@SP // 11680
AM=M+1 // 11681
A=A-1 // 11682
M=0 // 11683
@SP // 11684
AM=M+1 // 11685
A=A-1 // 11686
M=0 // 11687
// call Output.create
@17 // 11688
D=A // 11689
@14 // 11690
M=D // 11691
@Output.create // 11692
D=A // 11693
@13 // 11694
M=D // 11695
@Output.init.ret.77 // 11696
D=A // 11697
@CALL // 11698
0;JMP // 11699
(Output.init.ret.77)
@SP // 11700
M=M-1 // 11701

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11702
D=A // 11703
@SP // 11704
AM=M+1 // 11705
A=A-1 // 11706
M=D // 11707
@14 // 11708
D=A // 11709
@SP // 11710
AM=M+1 // 11711
A=A-1 // 11712
M=D // 11713
@12 // 11714
D=A // 11715
@SP // 11716
AM=M+1 // 11717
A=A-1 // 11718
M=D // 11719
@12 // 11720
D=A // 11721
@SP // 11722
AM=M+1 // 11723
A=A-1 // 11724
M=D // 11725
@12 // 11726
D=A // 11727
@SP // 11728
AM=M+1 // 11729
A=A-1 // 11730
M=D // 11731
@12 // 11732
D=A // 11733
@SP // 11734
AM=M+1 // 11735
A=A-1 // 11736
M=D // 11737
@12 // 11738
D=A // 11739
@SP // 11740
AM=M+1 // 11741
A=A-1 // 11742
M=D // 11743
@12 // 11744
D=A // 11745
@SP // 11746
AM=M+1 // 11747
A=A-1 // 11748
M=D // 11749
@12 // 11750
D=A // 11751
@SP // 11752
AM=M+1 // 11753
A=A-1 // 11754
M=D // 11755
@30 // 11756
D=A // 11757
@SP // 11758
AM=M+1 // 11759
A=A-1 // 11760
M=D // 11761
@SP // 11762
AM=M+1 // 11763
A=A-1 // 11764
M=0 // 11765
@SP // 11766
AM=M+1 // 11767
A=A-1 // 11768
M=0 // 11769
// call Output.create
@17 // 11770
D=A // 11771
@14 // 11772
M=D // 11773
@Output.create // 11774
D=A // 11775
@13 // 11776
M=D // 11777
@Output.init.ret.78 // 11778
D=A // 11779
@CALL // 11780
0;JMP // 11781
(Output.init.ret.78)
@SP // 11782
M=M-1 // 11783

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11784
D=A // 11785
@SP // 11786
M=D+M // 11787
@109 // 11788
D=A // 11789
@SP // 11790
A=M-1 // 11791
M=0 // 11792
A=A-1 // 11793
M=0 // 11794
A=A-1 // 11795
M=0 // 11796
A=A-1 // 11797
M=D // 11798
A=A-1 // 11799
@29 // 11800
D=A // 11801
@SP // 11802
AM=M+1 // 11803
A=A-1 // 11804
M=D // 11805
@63 // 11806
D=A // 11807
@SP // 11808
AM=M+1 // 11809
A=A-1 // 11810
M=D // 11811
@43 // 11812
D=A // 11813
@SP // 11814
AM=M+1 // 11815
A=A-1 // 11816
M=D // 11817
@43 // 11818
D=A // 11819
@SP // 11820
AM=M+1 // 11821
A=A-1 // 11822
M=D // 11823
@43 // 11824
D=A // 11825
@SP // 11826
AM=M+1 // 11827
A=A-1 // 11828
M=D // 11829
@43 // 11830
D=A // 11831
@SP // 11832
AM=M+1 // 11833
A=A-1 // 11834
M=D // 11835
@SP // 11836
AM=M+1 // 11837
A=A-1 // 11838
M=0 // 11839
@SP // 11840
AM=M+1 // 11841
A=A-1 // 11842
M=0 // 11843
// call Output.create
@17 // 11844
D=A // 11845
@14 // 11846
M=D // 11847
@Output.create // 11848
D=A // 11849
@13 // 11850
M=D // 11851
@Output.init.ret.79 // 11852
D=A // 11853
@CALL // 11854
0;JMP // 11855
(Output.init.ret.79)
@SP // 11856
M=M-1 // 11857

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11858
D=A // 11859
@SP // 11860
M=D+M // 11861
@110 // 11862
D=A // 11863
@SP // 11864
A=M-1 // 11865
M=0 // 11866
A=A-1 // 11867
M=0 // 11868
A=A-1 // 11869
M=0 // 11870
A=A-1 // 11871
M=D // 11872
A=A-1 // 11873
@29 // 11874
D=A // 11875
@SP // 11876
AM=M+1 // 11877
A=A-1 // 11878
M=D // 11879
@51 // 11880
D=A // 11881
@SP // 11882
AM=M+1 // 11883
A=A-1 // 11884
M=D // 11885
@51 // 11886
D=A // 11887
@SP // 11888
AM=M+1 // 11889
A=A-1 // 11890
M=D // 11891
@51 // 11892
D=A // 11893
@SP // 11894
AM=M+1 // 11895
A=A-1 // 11896
M=D // 11897
@51 // 11898
D=A // 11899
@SP // 11900
AM=M+1 // 11901
A=A-1 // 11902
M=D // 11903
@51 // 11904
D=A // 11905
@SP // 11906
AM=M+1 // 11907
A=A-1 // 11908
M=D // 11909
@SP // 11910
AM=M+1 // 11911
A=A-1 // 11912
M=0 // 11913
@SP // 11914
AM=M+1 // 11915
A=A-1 // 11916
M=0 // 11917
// call Output.create
@17 // 11918
D=A // 11919
@14 // 11920
M=D // 11921
@Output.create // 11922
D=A // 11923
@13 // 11924
M=D // 11925
@Output.init.ret.80 // 11926
D=A // 11927
@CALL // 11928
0;JMP // 11929
(Output.init.ret.80)
@SP // 11930
M=M-1 // 11931

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11932
D=A // 11933
@SP // 11934
M=D+M // 11935
@111 // 11936
D=A // 11937
@SP // 11938
A=M-1 // 11939
M=0 // 11940
A=A-1 // 11941
M=0 // 11942
A=A-1 // 11943
M=0 // 11944
A=A-1 // 11945
M=D // 11946
A=A-1 // 11947
@30 // 11948
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
@51 // 11960
D=A // 11961
@SP // 11962
AM=M+1 // 11963
A=A-1 // 11964
M=D // 11965
@51 // 11966
D=A // 11967
@SP // 11968
AM=M+1 // 11969
A=A-1 // 11970
M=D // 11971
@51 // 11972
D=A // 11973
@SP // 11974
AM=M+1 // 11975
A=A-1 // 11976
M=D // 11977
@30 // 11978
D=A // 11979
@SP // 11980
AM=M+1 // 11981
A=A-1 // 11982
M=D // 11983
@SP // 11984
AM=M+1 // 11985
A=A-1 // 11986
M=0 // 11987
@SP // 11988
AM=M+1 // 11989
A=A-1 // 11990
M=0 // 11991
// call Output.create
@17 // 11992
D=A // 11993
@14 // 11994
M=D // 11995
@Output.create // 11996
D=A // 11997
@13 // 11998
M=D // 11999
@Output.init.ret.81 // 12000
D=A // 12001
@CALL // 12002
0;JMP // 12003
(Output.init.ret.81)
@SP // 12004
M=M-1 // 12005

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12006
D=A // 12007
@SP // 12008
M=D+M // 12009
@112 // 12010
D=A // 12011
@SP // 12012
A=M-1 // 12013
M=0 // 12014
A=A-1 // 12015
M=0 // 12016
A=A-1 // 12017
M=0 // 12018
A=A-1 // 12019
M=D // 12020
A=A-1 // 12021
@30 // 12022
D=A // 12023
@SP // 12024
AM=M+1 // 12025
A=A-1 // 12026
M=D // 12027
@51 // 12028
D=A // 12029
@SP // 12030
AM=M+1 // 12031
A=A-1 // 12032
M=D // 12033
@51 // 12034
D=A // 12035
@SP // 12036
AM=M+1 // 12037
A=A-1 // 12038
M=D // 12039
@51 // 12040
D=A // 12041
@SP // 12042
AM=M+1 // 12043
A=A-1 // 12044
M=D // 12045
@31 // 12046
D=A // 12047
@SP // 12048
AM=M+1 // 12049
A=A-1 // 12050
M=D // 12051
@3 // 12052
D=A // 12053
@SP // 12054
AM=M+1 // 12055
A=A-1 // 12056
M=D // 12057
@3 // 12058
D=A // 12059
@SP // 12060
AM=M+1 // 12061
A=A-1 // 12062
M=D // 12063
@SP // 12064
AM=M+1 // 12065
A=A-1 // 12066
M=0 // 12067
// call Output.create
@17 // 12068
D=A // 12069
@14 // 12070
M=D // 12071
@Output.create // 12072
D=A // 12073
@13 // 12074
M=D // 12075
@Output.init.ret.82 // 12076
D=A // 12077
@CALL // 12078
0;JMP // 12079
(Output.init.ret.82)
@SP // 12080
M=M-1 // 12081

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12082
D=A // 12083
@SP // 12084
M=D+M // 12085
@113 // 12086
D=A // 12087
@SP // 12088
A=M-1 // 12089
M=0 // 12090
A=A-1 // 12091
M=0 // 12092
A=A-1 // 12093
M=0 // 12094
A=A-1 // 12095
M=D // 12096
A=A-1 // 12097
@30 // 12098
D=A // 12099
@SP // 12100
AM=M+1 // 12101
A=A-1 // 12102
M=D // 12103
@51 // 12104
D=A // 12105
@SP // 12106
AM=M+1 // 12107
A=A-1 // 12108
M=D // 12109
@51 // 12110
D=A // 12111
@SP // 12112
AM=M+1 // 12113
A=A-1 // 12114
M=D // 12115
@51 // 12116
D=A // 12117
@SP // 12118
AM=M+1 // 12119
A=A-1 // 12120
M=D // 12121
@62 // 12122
D=A // 12123
@SP // 12124
AM=M+1 // 12125
A=A-1 // 12126
M=D // 12127
@48 // 12128
D=A // 12129
@SP // 12130
AM=M+1 // 12131
A=A-1 // 12132
M=D // 12133
@48 // 12134
D=A // 12135
@SP // 12136
AM=M+1 // 12137
A=A-1 // 12138
M=D // 12139
@SP // 12140
AM=M+1 // 12141
A=A-1 // 12142
M=0 // 12143
// call Output.create
@17 // 12144
D=A // 12145
@14 // 12146
M=D // 12147
@Output.create // 12148
D=A // 12149
@13 // 12150
M=D // 12151
@Output.init.ret.83 // 12152
D=A // 12153
@CALL // 12154
0;JMP // 12155
(Output.init.ret.83)
@SP // 12156
M=M-1 // 12157

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12158
D=A // 12159
@SP // 12160
M=D+M // 12161
@114 // 12162
D=A // 12163
@SP // 12164
A=M-1 // 12165
M=0 // 12166
A=A-1 // 12167
M=0 // 12168
A=A-1 // 12169
M=0 // 12170
A=A-1 // 12171
M=D // 12172
A=A-1 // 12173
@29 // 12174
D=A // 12175
@SP // 12176
AM=M+1 // 12177
A=A-1 // 12178
M=D // 12179
@55 // 12180
D=A // 12181
@SP // 12182
AM=M+1 // 12183
A=A-1 // 12184
M=D // 12185
@51 // 12186
D=A // 12187
@SP // 12188
AM=M+1 // 12189
A=A-1 // 12190
M=D // 12191
@3 // 12192
D=A // 12193
@SP // 12194
AM=M+1 // 12195
A=A-1 // 12196
M=D // 12197
@3 // 12198
D=A // 12199
@SP // 12200
AM=M+1 // 12201
A=A-1 // 12202
M=D // 12203
@7 // 12204
D=A // 12205
@SP // 12206
AM=M+1 // 12207
A=A-1 // 12208
M=D // 12209
@SP // 12210
AM=M+1 // 12211
A=A-1 // 12212
M=0 // 12213
@SP // 12214
AM=M+1 // 12215
A=A-1 // 12216
M=0 // 12217
// call Output.create
@17 // 12218
D=A // 12219
@14 // 12220
M=D // 12221
@Output.create // 12222
D=A // 12223
@13 // 12224
M=D // 12225
@Output.init.ret.84 // 12226
D=A // 12227
@CALL // 12228
0;JMP // 12229
(Output.init.ret.84)
@SP // 12230
M=M-1 // 12231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12232
D=A // 12233
@SP // 12234
M=D+M // 12235
@115 // 12236
D=A // 12237
@SP // 12238
A=M-1 // 12239
M=0 // 12240
A=A-1 // 12241
M=0 // 12242
A=A-1 // 12243
M=0 // 12244
A=A-1 // 12245
M=D // 12246
A=A-1 // 12247
@30 // 12248
D=A // 12249
@SP // 12250
AM=M+1 // 12251
A=A-1 // 12252
M=D // 12253
@51 // 12254
D=A // 12255
@SP // 12256
AM=M+1 // 12257
A=A-1 // 12258
M=D // 12259
@6 // 12260
D=A // 12261
@SP // 12262
AM=M+1 // 12263
A=A-1 // 12264
M=D // 12265
@24 // 12266
D=A // 12267
@SP // 12268
AM=M+1 // 12269
A=A-1 // 12270
M=D // 12271
@51 // 12272
D=A // 12273
@SP // 12274
AM=M+1 // 12275
A=A-1 // 12276
M=D // 12277
@30 // 12278
D=A // 12279
@SP // 12280
AM=M+1 // 12281
A=A-1 // 12282
M=D // 12283
@SP // 12284
AM=M+1 // 12285
A=A-1 // 12286
M=0 // 12287
@SP // 12288
AM=M+1 // 12289
A=A-1 // 12290
M=0 // 12291
// call Output.create
@17 // 12292
D=A // 12293
@14 // 12294
M=D // 12295
@Output.create // 12296
D=A // 12297
@13 // 12298
M=D // 12299
@Output.init.ret.85 // 12300
D=A // 12301
@CALL // 12302
0;JMP // 12303
(Output.init.ret.85)
@SP // 12304
M=M-1 // 12305

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12306
D=A // 12307
@SP // 12308
AM=M+1 // 12309
A=A-1 // 12310
M=D // 12311
@4 // 12312
D=A // 12313
@SP // 12314
AM=M+1 // 12315
A=A-1 // 12316
M=D // 12317
@6 // 12318
D=A // 12319
@SP // 12320
AM=M+1 // 12321
A=A-1 // 12322
M=D // 12323
@6 // 12324
D=A // 12325
@SP // 12326
AM=M+1 // 12327
A=A-1 // 12328
M=D // 12329
@15 // 12330
D=A // 12331
@SP // 12332
AM=M+1 // 12333
A=A-1 // 12334
M=D // 12335
@6 // 12336
D=A // 12337
@SP // 12338
AM=M+1 // 12339
A=A-1 // 12340
M=D // 12341
@6 // 12342
D=A // 12343
@SP // 12344
AM=M+1 // 12345
A=A-1 // 12346
M=D // 12347
@6 // 12348
D=A // 12349
@SP // 12350
AM=M+1 // 12351
A=A-1 // 12352
M=D // 12353
@54 // 12354
D=A // 12355
@SP // 12356
AM=M+1 // 12357
A=A-1 // 12358
M=D // 12359
@28 // 12360
D=A // 12361
@SP // 12362
AM=M+1 // 12363
A=A-1 // 12364
M=D // 12365
@SP // 12366
AM=M+1 // 12367
A=A-1 // 12368
M=0 // 12369
@SP // 12370
AM=M+1 // 12371
A=A-1 // 12372
M=0 // 12373
// call Output.create
@17 // 12374
D=A // 12375
@14 // 12376
M=D // 12377
@Output.create // 12378
D=A // 12379
@13 // 12380
M=D // 12381
@Output.init.ret.86 // 12382
D=A // 12383
@CALL // 12384
0;JMP // 12385
(Output.init.ret.86)
@SP // 12386
M=M-1 // 12387

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12388
D=A // 12389
@SP // 12390
M=D+M // 12391
@117 // 12392
D=A // 12393
@SP // 12394
A=M-1 // 12395
M=0 // 12396
A=A-1 // 12397
M=0 // 12398
A=A-1 // 12399
M=0 // 12400
A=A-1 // 12401
M=D // 12402
A=A-1 // 12403
@27 // 12404
D=A // 12405
@SP // 12406
AM=M+1 // 12407
A=A-1 // 12408
M=D // 12409
@27 // 12410
D=A // 12411
@SP // 12412
AM=M+1 // 12413
A=A-1 // 12414
M=D // 12415
@27 // 12416
D=A // 12417
@SP // 12418
AM=M+1 // 12419
A=A-1 // 12420
M=D // 12421
@27 // 12422
D=A // 12423
@SP // 12424
AM=M+1 // 12425
A=A-1 // 12426
M=D // 12427
@27 // 12428
D=A // 12429
@SP // 12430
AM=M+1 // 12431
A=A-1 // 12432
M=D // 12433
@54 // 12434
D=A // 12435
@SP // 12436
AM=M+1 // 12437
A=A-1 // 12438
M=D // 12439
@SP // 12440
AM=M+1 // 12441
A=A-1 // 12442
M=0 // 12443
@SP // 12444
AM=M+1 // 12445
A=A-1 // 12446
M=0 // 12447
// call Output.create
@17 // 12448
D=A // 12449
@14 // 12450
M=D // 12451
@Output.create // 12452
D=A // 12453
@13 // 12454
M=D // 12455
@Output.init.ret.87 // 12456
D=A // 12457
@CALL // 12458
0;JMP // 12459
(Output.init.ret.87)
@SP // 12460
M=M-1 // 12461

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12462
D=A // 12463
@SP // 12464
M=D+M // 12465
@118 // 12466
D=A // 12467
@SP // 12468
A=M-1 // 12469
M=0 // 12470
A=A-1 // 12471
M=0 // 12472
A=A-1 // 12473
M=0 // 12474
A=A-1 // 12475
M=D // 12476
A=A-1 // 12477
@51 // 12478
D=A // 12479
@SP // 12480
AM=M+1 // 12481
A=A-1 // 12482
M=D // 12483
@51 // 12484
D=A // 12485
@SP // 12486
AM=M+1 // 12487
A=A-1 // 12488
M=D // 12489
@51 // 12490
D=A // 12491
@SP // 12492
AM=M+1 // 12493
A=A-1 // 12494
M=D // 12495
@51 // 12496
D=A // 12497
@SP // 12498
AM=M+1 // 12499
A=A-1 // 12500
M=D // 12501
@30 // 12502
D=A // 12503
@SP // 12504
AM=M+1 // 12505
A=A-1 // 12506
M=D // 12507
@12 // 12508
D=A // 12509
@SP // 12510
AM=M+1 // 12511
A=A-1 // 12512
M=D // 12513
@SP // 12514
AM=M+1 // 12515
A=A-1 // 12516
M=0 // 12517
@SP // 12518
AM=M+1 // 12519
A=A-1 // 12520
M=0 // 12521
// call Output.create
@17 // 12522
D=A // 12523
@14 // 12524
M=D // 12525
@Output.create // 12526
D=A // 12527
@13 // 12528
M=D // 12529
@Output.init.ret.88 // 12530
D=A // 12531
@CALL // 12532
0;JMP // 12533
(Output.init.ret.88)
@SP // 12534
M=M-1 // 12535

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12536
D=A // 12537
@SP // 12538
M=D+M // 12539
@119 // 12540
D=A // 12541
@SP // 12542
A=M-1 // 12543
M=0 // 12544
A=A-1 // 12545
M=0 // 12546
A=A-1 // 12547
M=0 // 12548
A=A-1 // 12549
M=D // 12550
A=A-1 // 12551
@51 // 12552
D=A // 12553
@SP // 12554
AM=M+1 // 12555
A=A-1 // 12556
M=D // 12557
@51 // 12558
D=A // 12559
@SP // 12560
AM=M+1 // 12561
A=A-1 // 12562
M=D // 12563
@51 // 12564
D=A // 12565
@SP // 12566
AM=M+1 // 12567
A=A-1 // 12568
M=D // 12569
@63 // 12570
D=A // 12571
@SP // 12572
AM=M+1 // 12573
A=A-1 // 12574
M=D // 12575
@63 // 12576
D=A // 12577
@SP // 12578
AM=M+1 // 12579
A=A-1 // 12580
M=D // 12581
@18 // 12582
D=A // 12583
@SP // 12584
AM=M+1 // 12585
A=A-1 // 12586
M=D // 12587
@SP // 12588
AM=M+1 // 12589
A=A-1 // 12590
M=0 // 12591
@SP // 12592
AM=M+1 // 12593
A=A-1 // 12594
M=0 // 12595
// call Output.create
@17 // 12596
D=A // 12597
@14 // 12598
M=D // 12599
@Output.create // 12600
D=A // 12601
@13 // 12602
M=D // 12603
@Output.init.ret.89 // 12604
D=A // 12605
@CALL // 12606
0;JMP // 12607
(Output.init.ret.89)
@SP // 12608
M=M-1 // 12609

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12610
D=A // 12611
@SP // 12612
M=D+M // 12613
@120 // 12614
D=A // 12615
@SP // 12616
A=M-1 // 12617
M=0 // 12618
A=A-1 // 12619
M=0 // 12620
A=A-1 // 12621
M=0 // 12622
A=A-1 // 12623
M=D // 12624
A=A-1 // 12625
@51 // 12626
D=A // 12627
@SP // 12628
AM=M+1 // 12629
A=A-1 // 12630
M=D // 12631
@30 // 12632
D=A // 12633
@SP // 12634
AM=M+1 // 12635
A=A-1 // 12636
M=D // 12637
@12 // 12638
D=A // 12639
@SP // 12640
AM=M+1 // 12641
A=A-1 // 12642
M=D // 12643
@12 // 12644
D=A // 12645
@SP // 12646
AM=M+1 // 12647
A=A-1 // 12648
M=D // 12649
@30 // 12650
D=A // 12651
@SP // 12652
AM=M+1 // 12653
A=A-1 // 12654
M=D // 12655
@51 // 12656
D=A // 12657
@SP // 12658
AM=M+1 // 12659
A=A-1 // 12660
M=D // 12661
@SP // 12662
AM=M+1 // 12663
A=A-1 // 12664
M=0 // 12665
@SP // 12666
AM=M+1 // 12667
A=A-1 // 12668
M=0 // 12669
// call Output.create
@17 // 12670
D=A // 12671
@14 // 12672
M=D // 12673
@Output.create // 12674
D=A // 12675
@13 // 12676
M=D // 12677
@Output.init.ret.90 // 12678
D=A // 12679
@CALL // 12680
0;JMP // 12681
(Output.init.ret.90)
@SP // 12682
M=M-1 // 12683

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12684
D=A // 12685
@SP // 12686
M=D+M // 12687
@121 // 12688
D=A // 12689
@SP // 12690
A=M-1 // 12691
M=0 // 12692
A=A-1 // 12693
M=0 // 12694
A=A-1 // 12695
M=0 // 12696
A=A-1 // 12697
M=D // 12698
A=A-1 // 12699
@51 // 12700
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
@51 // 12712
D=A // 12713
@SP // 12714
AM=M+1 // 12715
A=A-1 // 12716
M=D // 12717
@62 // 12718
D=A // 12719
@SP // 12720
AM=M+1 // 12721
A=A-1 // 12722
M=D // 12723
@48 // 12724
D=A // 12725
@SP // 12726
AM=M+1 // 12727
A=A-1 // 12728
M=D // 12729
@24 // 12730
D=A // 12731
@SP // 12732
AM=M+1 // 12733
A=A-1 // 12734
M=D // 12735
@15 // 12736
D=A // 12737
@SP // 12738
AM=M+1 // 12739
A=A-1 // 12740
M=D // 12741
@SP // 12742
AM=M+1 // 12743
A=A-1 // 12744
M=0 // 12745
// call Output.create
@17 // 12746
D=A // 12747
@14 // 12748
M=D // 12749
@Output.create // 12750
D=A // 12751
@13 // 12752
M=D // 12753
@Output.init.ret.91 // 12754
D=A // 12755
@CALL // 12756
0;JMP // 12757
(Output.init.ret.91)
@SP // 12758
M=M-1 // 12759

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12760
D=A // 12761
@SP // 12762
M=D+M // 12763
@122 // 12764
D=A // 12765
@SP // 12766
A=M-1 // 12767
M=0 // 12768
A=A-1 // 12769
M=0 // 12770
A=A-1 // 12771
M=0 // 12772
A=A-1 // 12773
M=D // 12774
A=A-1 // 12775
@63 // 12776
D=A // 12777
@SP // 12778
AM=M+1 // 12779
A=A-1 // 12780
M=D // 12781
@27 // 12782
D=A // 12783
@SP // 12784
AM=M+1 // 12785
A=A-1 // 12786
M=D // 12787
@12 // 12788
D=A // 12789
@SP // 12790
AM=M+1 // 12791
A=A-1 // 12792
M=D // 12793
@6 // 12794
D=A // 12795
@SP // 12796
AM=M+1 // 12797
A=A-1 // 12798
M=D // 12799
@51 // 12800
D=A // 12801
@SP // 12802
AM=M+1 // 12803
A=A-1 // 12804
M=D // 12805
@63 // 12806
D=A // 12807
@SP // 12808
AM=M+1 // 12809
A=A-1 // 12810
M=D // 12811
@SP // 12812
AM=M+1 // 12813
A=A-1 // 12814
M=0 // 12815
@SP // 12816
AM=M+1 // 12817
A=A-1 // 12818
M=0 // 12819
// call Output.create
@17 // 12820
D=A // 12821
@14 // 12822
M=D // 12823
@Output.create // 12824
D=A // 12825
@13 // 12826
M=D // 12827
@Output.init.ret.92 // 12828
D=A // 12829
@CALL // 12830
0;JMP // 12831
(Output.init.ret.92)
@SP // 12832
M=M-1 // 12833

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12834
D=A // 12835
@SP // 12836
AM=M+1 // 12837
A=A-1 // 12838
M=D // 12839
@56 // 12840
D=A // 12841
@SP // 12842
AM=M+1 // 12843
A=A-1 // 12844
M=D // 12845
@12 // 12846
D=A // 12847
@SP // 12848
AM=M+1 // 12849
A=A-1 // 12850
M=D // 12851
@12 // 12852
D=A // 12853
@SP // 12854
AM=M+1 // 12855
A=A-1 // 12856
M=D // 12857
@12 // 12858
D=A // 12859
@SP // 12860
AM=M+1 // 12861
A=A-1 // 12862
M=D // 12863
@7 // 12864
D=A // 12865
@SP // 12866
AM=M+1 // 12867
A=A-1 // 12868
M=D // 12869
@12 // 12870
D=A // 12871
@SP // 12872
AM=M+1 // 12873
A=A-1 // 12874
M=D // 12875
@12 // 12876
D=A // 12877
@SP // 12878
AM=M+1 // 12879
A=A-1 // 12880
M=D // 12881
@12 // 12882
D=A // 12883
@SP // 12884
AM=M+1 // 12885
A=A-1 // 12886
M=D // 12887
@56 // 12888
D=A // 12889
@SP // 12890
AM=M+1 // 12891
A=A-1 // 12892
M=D // 12893
@SP // 12894
AM=M+1 // 12895
A=A-1 // 12896
M=0 // 12897
@SP // 12898
AM=M+1 // 12899
A=A-1 // 12900
M=0 // 12901
// call Output.create
@17 // 12902
D=A // 12903
@14 // 12904
M=D // 12905
@Output.create // 12906
D=A // 12907
@13 // 12908
M=D // 12909
@Output.init.ret.93 // 12910
D=A // 12911
@CALL // 12912
0;JMP // 12913
(Output.init.ret.93)
@SP // 12914
M=M-1 // 12915

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12916
D=A // 12917
@SP // 12918
AM=M+1 // 12919
A=A-1 // 12920
M=D // 12921
@12 // 12922
D=A // 12923
@SP // 12924
AM=M+1 // 12925
A=A-1 // 12926
M=D // 12927
@12 // 12928
D=A // 12929
@SP // 12930
AM=M+1 // 12931
A=A-1 // 12932
M=D // 12933
@12 // 12934
D=A // 12935
@SP // 12936
AM=M+1 // 12937
A=A-1 // 12938
M=D // 12939
@12 // 12940
D=A // 12941
@SP // 12942
AM=M+1 // 12943
A=A-1 // 12944
M=D // 12945
@12 // 12946
D=A // 12947
@SP // 12948
AM=M+1 // 12949
A=A-1 // 12950
M=D // 12951
@12 // 12952
D=A // 12953
@SP // 12954
AM=M+1 // 12955
A=A-1 // 12956
M=D // 12957
@12 // 12958
D=A // 12959
@SP // 12960
AM=M+1 // 12961
A=A-1 // 12962
M=D // 12963
@12 // 12964
D=A // 12965
@SP // 12966
AM=M+1 // 12967
A=A-1 // 12968
M=D // 12969
@12 // 12970
D=A // 12971
@SP // 12972
AM=M+1 // 12973
A=A-1 // 12974
M=D // 12975
@SP // 12976
AM=M+1 // 12977
A=A-1 // 12978
M=0 // 12979
@SP // 12980
AM=M+1 // 12981
A=A-1 // 12982
M=0 // 12983
// call Output.create
@17 // 12984
D=A // 12985
@14 // 12986
M=D // 12987
@Output.create // 12988
D=A // 12989
@13 // 12990
M=D // 12991
@Output.init.ret.94 // 12992
D=A // 12993
@CALL // 12994
0;JMP // 12995
(Output.init.ret.94)
@SP // 12996
M=M-1 // 12997

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12998
D=A // 12999
@SP // 13000
AM=M+1 // 13001
A=A-1 // 13002
M=D // 13003
@7 // 13004
D=A // 13005
@SP // 13006
AM=M+1 // 13007
A=A-1 // 13008
M=D // 13009
@12 // 13010
D=A // 13011
@SP // 13012
AM=M+1 // 13013
A=A-1 // 13014
M=D // 13015
@12 // 13016
D=A // 13017
@SP // 13018
AM=M+1 // 13019
A=A-1 // 13020
M=D // 13021
@12 // 13022
D=A // 13023
@SP // 13024
AM=M+1 // 13025
A=A-1 // 13026
M=D // 13027
@56 // 13028
D=A // 13029
@SP // 13030
AM=M+1 // 13031
A=A-1 // 13032
M=D // 13033
@12 // 13034
D=A // 13035
@SP // 13036
AM=M+1 // 13037
A=A-1 // 13038
M=D // 13039
@12 // 13040
D=A // 13041
@SP // 13042
AM=M+1 // 13043
A=A-1 // 13044
M=D // 13045
@12 // 13046
D=A // 13047
@SP // 13048
AM=M+1 // 13049
A=A-1 // 13050
M=D // 13051
@7 // 13052
D=A // 13053
@SP // 13054
AM=M+1 // 13055
A=A-1 // 13056
M=D // 13057
@SP // 13058
AM=M+1 // 13059
A=A-1 // 13060
M=0 // 13061
@SP // 13062
AM=M+1 // 13063
A=A-1 // 13064
M=0 // 13065
// call Output.create
@17 // 13066
D=A // 13067
@14 // 13068
M=D // 13069
@Output.create // 13070
D=A // 13071
@13 // 13072
M=D // 13073
@Output.init.ret.95 // 13074
D=A // 13075
@CALL // 13076
0;JMP // 13077
(Output.init.ret.95)
@SP // 13078
M=M-1 // 13079

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13080
D=A // 13081
@SP // 13082
AM=M+1 // 13083
A=A-1 // 13084
M=D // 13085
@38 // 13086
D=A // 13087
@SP // 13088
AM=M+1 // 13089
A=A-1 // 13090
M=D // 13091
@45 // 13092
D=A // 13093
@SP // 13094
AM=M+1 // 13095
A=A-1 // 13096
M=D // 13097
@25 // 13098
D=A // 13099
@SP // 13100
AM=M+1 // 13101
A=A-1 // 13102
M=D // 13103
@SP // 13104
AM=M+1 // 13105
A=A-1 // 13106
M=0 // 13107
@SP // 13108
AM=M+1 // 13109
A=A-1 // 13110
M=0 // 13111
@SP // 13112
AM=M+1 // 13113
A=A-1 // 13114
M=0 // 13115
@SP // 13116
AM=M+1 // 13117
A=A-1 // 13118
M=0 // 13119
@SP // 13120
AM=M+1 // 13121
A=A-1 // 13122
M=0 // 13123
@SP // 13124
AM=M+1 // 13125
A=A-1 // 13126
M=0 // 13127
@SP // 13128
AM=M+1 // 13129
A=A-1 // 13130
M=0 // 13131
@SP // 13132
AM=M+1 // 13133
A=A-1 // 13134
M=0 // 13135
// call Output.create
@17 // 13136
D=A // 13137
@14 // 13138
M=D // 13139
@Output.create // 13140
D=A // 13141
@13 // 13142
M=D // 13143
@Output.init.ret.96 // 13144
D=A // 13145
@CALL // 13146
0;JMP // 13147
(Output.init.ret.96)
@SP // 13148
M=M-1 // 13149

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13150
M=0 // 13151

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13152
M=0 // 13153

////PushInstruction("constant 0")
@SP // 13154
AM=M+1 // 13155
A=A-1 // 13156
M=0 // 13157
@RETURN // 13158
0;JMP // 13159

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13160
M=M+1 // 13161
AM=M+1 // 13162
A=A-1 // 13163
M=0 // 13164
A=A-1 // 13165
M=0 // 13166

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13167
A=M+1 // 13168
D=M // 13169
@2 // 13170
D=D+A // 13171
@SP // 13172
AM=M+1 // 13173
A=A-1 // 13174
M=D // 13175
D=0 // 13176
@SP // 13177
AM=M-1 // 13178
A=M // 13179
M=D // 13180

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13181
A=M+1 // 13182
D=M // 13183
@3 // 13184
D=D+A // 13185
@SP // 13186
AM=M+1 // 13187
A=A-1 // 13188
M=D // 13189
D=0 // 13190
@SP // 13191
AM=M-1 // 13192
A=M // 13193
M=D // 13194

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
@Memory.add_node.EQ.55 // 13195
D=A // 13196
@SP // 13197
AM=M+1 // 13198
A=A-1 // 13199
M=D // 13200
@ARG // 13201
A=M // 13202
D=M // 13203
@0 // 13204
A=D+A // 13205
D=M // 13206
@DO_EQ // 13207
0;JMP // 13208
(Memory.add_node.EQ.55)
@Memory.add_node$IF_TRUE1 // 13209
D;JNE // 13210

////GotoInstruction{label='Memory.add_node$IF_FALSE1}
// goto Memory.add_node$IF_FALSE1
@Memory.add_node$IF_FALSE1 // 13211
0;JMP // 13212

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
@ARG // 13213
A=M // 13214
D=M // 13215
@SP // 13216
AM=M+1 // 13217
A=A-1 // 13218
M=D // 13219
@ARG // 13220
A=M+1 // 13221
D=M // 13222
@SP // 13223
AM=M-1 // 13224
A=M // 13225
M=D // 13226

////PushInstruction("constant 0")
@SP // 13227
AM=M+1 // 13228
A=A-1 // 13229
M=0 // 13230
@RETURN // 13231
0;JMP // 13232

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

@ARG // 13233
A=M // 13234
D=M // 13235
@0 // 13236
A=D+A // 13237
D=M // 13238
@LCL // 13239
A=M // 13240
M=D // 13241

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13242
A=M+1 // 13243
M=0 // 13244

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
@Memory.add_node.EQ.56 // 13245
D=A // 13246
@SP // 13247
AM=M+1 // 13248
A=A-1 // 13249
M=D // 13250
@LCL // 13251
A=M // 13252
D=M // 13253
@DO_EQ // 13254
0;JMP // 13255
(Memory.add_node.EQ.56)
@SP // 13256
AM=M+1 // 13257
A=A-1 // 13258
M=D // 13259
@SP // 13260
A=M-1 // 13261
M=!D // 13262
@Memory.add_node.GT.57 // 13263
D=A // 13264
@SP // 13265
AM=M+1 // 13266
A=A-1 // 13267
M=D // 13268
@LCL // 13269
A=M // 13270
D=M // 13271
@0 // 13272
A=D+A // 13273
D=M // 13274
@SP // 13275
AM=M+1 // 13276
A=A-1 // 13277
M=D // 13278
@ARG // 13279
A=M+1 // 13280
D=M // 13281
@0 // 13282
A=D+A // 13283
D=M // 13284
@SP // 13285
AM=M-1 // 13286
D=M-D // 13287
@DO_GT // 13288
0;JMP // 13289
(Memory.add_node.GT.57)
D=!D // 13290
@SP // 13291
AM=M-1 // 13292
D=D&M // 13293
D=!D // 13294
@Memory.add_node_WHILE_END1 // 13295
D;JNE // 13296

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13297
A=M // 13298
D=M // 13299
@LCL // 13300
A=M+1 // 13301
M=D // 13302

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

@LCL // 13303
A=M // 13304
D=M // 13305
@3 // 13306
A=D+A // 13307
D=M // 13308
@LCL // 13309
A=M // 13310
M=D // 13311

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13312
0;JMP // 13313

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13314
A=M+1 // 13315
D=!M // 13316
@Memory.add_node$IF_TRUE2 // 13317
D;JNE // 13318

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13319
0;JMP // 13320

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
@ARG // 13321
A=M+1 // 13322
D=M // 13323
@3 // 13324
D=D+A // 13325
@SP // 13326
AM=M+1 // 13327
A=A-1 // 13328
M=D // 13329
@ARG // 13330
A=M // 13331
D=M // 13332
@0 // 13333
A=D+A // 13334
D=M // 13335
@SP // 13336
AM=M-1 // 13337
A=M // 13338
M=D // 13339

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
@ARG // 13340
A=M // 13341
D=M // 13342
@0 // 13343
A=D+A // 13344
D=M // 13345
@2 // 13346
D=D+A // 13347
@SP // 13348
AM=M+1 // 13349
A=A-1 // 13350
M=D // 13351
@ARG // 13352
A=M+1 // 13353
D=M // 13354
@SP // 13355
AM=M-1 // 13356
A=M // 13357
M=D // 13358

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13359
A=M // 13360
D=M // 13361
@SP // 13362
AM=M+1 // 13363
A=A-1 // 13364
M=D // 13365
@ARG // 13366
A=M+1 // 13367
D=M // 13368
@SP // 13369
AM=M-1 // 13370
A=M // 13371
M=D // 13372

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13373
0;JMP // 13374

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
@ARG // 13375
A=M+1 // 13376
D=M // 13377
@3 // 13378
D=D+A // 13379
@SP // 13380
AM=M+1 // 13381
A=A-1 // 13382
M=D // 13383
@LCL // 13384
A=M // 13385
D=M // 13386
@SP // 13387
AM=M-1 // 13388
A=M // 13389
M=D // 13390

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13391
A=M+1 // 13392
D=M // 13393
@2 // 13394
D=D+A // 13395
@SP // 13396
AM=M+1 // 13397
A=A-1 // 13398
M=D // 13399
@LCL // 13400
A=M+1 // 13401
D=M // 13402
@SP // 13403
AM=M-1 // 13404
A=M // 13405
M=D // 13406

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13407
A=M // 13408
D=M // 13409
@Memory.add_node$IF_TRUE3 // 13410
D;JNE // 13411

////GotoInstruction{label='Memory.add_node$IF_FALSE3}
// goto Memory.add_node$IF_FALSE3
@Memory.add_node$IF_FALSE3 // 13412
0;JMP // 13413

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
@LCL // 13414
A=M // 13415
D=M // 13416
@2 // 13417
D=D+A // 13418
@SP // 13419
AM=M+1 // 13420
A=A-1 // 13421
M=D // 13422
@ARG // 13423
A=M+1 // 13424
D=M // 13425
@SP // 13426
AM=M-1 // 13427
A=M // 13428
M=D // 13429

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
@LCL // 13430
A=M+1 // 13431
D=M // 13432
@3 // 13433
D=D+A // 13434
@SP // 13435
AM=M+1 // 13436
A=A-1 // 13437
M=D // 13438
@ARG // 13439
A=M+1 // 13440
D=M // 13441
@SP // 13442
AM=M-1 // 13443
A=M // 13444
M=D // 13445

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13446
AM=M+1 // 13447
A=A-1 // 13448
M=0 // 13449
@RETURN // 13450
0;JMP // 13451

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13452
D=A // 13453
@SP // 13454
AM=D+M // 13455
A=A-1 // 13456
M=0 // 13457
A=A-1 // 13458
M=0 // 13459
A=A-1 // 13460
M=0 // 13461
A=A-1 // 13462
M=0 // 13463
A=A-1 // 13464
M=0 // 13465

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13466
A=M // 13467
M=0 // 13468

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13469
A=M+1 // 13470
A=A+1 // 13471
D=M // 13472
@LCL // 13473
A=M+1 // 13474
M=D // 13475

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

@ARG // 13476
A=M+1 // 13477
A=A+1 // 13478
D=M // 13479
D=D-1 // 13480
D=-D // 13481
@LCL // 13482
A=M+1 // 13483
A=A+1 // 13484
M=D // 13485

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
@Screen.drawCircle.GT.58 // 13486
D=A // 13487
@SP // 13488
AM=M+1 // 13489
A=A-1 // 13490
M=D // 13491
@LCL // 13492
A=M+1 // 13493
D=M // 13494
A=A-1 // 13495
D=M-D // 13496
@DO_GT // 13497
0;JMP // 13498
(Screen.drawCircle.GT.58)
@Screen.drawCircle_WHILE_END1 // 13499
D;JNE // 13500

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

@ARG // 13501
A=M // 13502
D=M // 13503
@SP // 13504
AM=M+1 // 13505
A=A-1 // 13506
M=D // 13507
@LCL // 13508
A=M // 13509
D=M // 13510
@SP // 13511
AM=M-1 // 13512
D=M-D // 13513
@SP // 13514
AM=M+1 // 13515
A=A-1 // 13516
M=D // 13517
@ARG // 13518
A=M // 13519
D=M // 13520
@SP // 13521
AM=M+1 // 13522
A=A-1 // 13523
M=D // 13524
@LCL // 13525
A=M // 13526
D=M // 13527
@SP // 13528
AM=M-1 // 13529
D=D+M // 13530
@SP // 13531
AM=M+1 // 13532
A=A-1 // 13533
M=D // 13534
@ARG // 13535
A=M+1 // 13536
D=M // 13537
@SP // 13538
AM=M+1 // 13539
A=A-1 // 13540
M=D // 13541
@LCL // 13542
A=M+1 // 13543
D=M // 13544
@SP // 13545
AM=M-1 // 13546
D=D+M // 13547
@SP // 13548
AM=M+1 // 13549
A=A-1 // 13550
M=D // 13551
// call Screen.drawHorizontalLine
@8 // 13552
D=A // 13553
@14 // 13554
M=D // 13555
@Screen.drawHorizontalLine // 13556
D=A // 13557
@13 // 13558
M=D // 13559
@Screen.drawCircle.ret.0 // 13560
D=A // 13561
@CALL // 13562
0;JMP // 13563
(Screen.drawCircle.ret.0)
@SP // 13564
M=M-1 // 13565

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

@ARG // 13566
A=M // 13567
D=M // 13568
@SP // 13569
AM=M+1 // 13570
A=A-1 // 13571
M=D // 13572
@LCL // 13573
A=M // 13574
D=M // 13575
@SP // 13576
AM=M-1 // 13577
D=M-D // 13578
@SP // 13579
AM=M+1 // 13580
A=A-1 // 13581
M=D // 13582
@ARG // 13583
A=M // 13584
D=M // 13585
@SP // 13586
AM=M+1 // 13587
A=A-1 // 13588
M=D // 13589
@LCL // 13590
A=M // 13591
D=M // 13592
@SP // 13593
AM=M-1 // 13594
D=D+M // 13595
@SP // 13596
AM=M+1 // 13597
A=A-1 // 13598
M=D // 13599
@ARG // 13600
A=M+1 // 13601
D=M // 13602
@SP // 13603
AM=M+1 // 13604
A=A-1 // 13605
M=D // 13606
@LCL // 13607
A=M+1 // 13608
D=M // 13609
@SP // 13610
AM=M-1 // 13611
D=M-D // 13612
@SP // 13613
AM=M+1 // 13614
A=A-1 // 13615
M=D // 13616
// call Screen.drawHorizontalLine
@8 // 13617
D=A // 13618
@14 // 13619
M=D // 13620
@Screen.drawHorizontalLine // 13621
D=A // 13622
@13 // 13623
M=D // 13624
@Screen.drawCircle.ret.1 // 13625
D=A // 13626
@CALL // 13627
0;JMP // 13628
(Screen.drawCircle.ret.1)
@SP // 13629
M=M-1 // 13630

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

@ARG // 13631
A=M // 13632
D=M // 13633
@SP // 13634
AM=M+1 // 13635
A=A-1 // 13636
M=D // 13637
@LCL // 13638
A=M+1 // 13639
D=M // 13640
@SP // 13641
AM=M-1 // 13642
D=M-D // 13643
@SP // 13644
AM=M+1 // 13645
A=A-1 // 13646
M=D // 13647
@ARG // 13648
A=M // 13649
D=M // 13650
@SP // 13651
AM=M+1 // 13652
A=A-1 // 13653
M=D // 13654
@LCL // 13655
A=M+1 // 13656
D=M // 13657
@SP // 13658
AM=M-1 // 13659
D=D+M // 13660
@SP // 13661
AM=M+1 // 13662
A=A-1 // 13663
M=D // 13664
@ARG // 13665
A=M+1 // 13666
D=M // 13667
@SP // 13668
AM=M+1 // 13669
A=A-1 // 13670
M=D // 13671
@LCL // 13672
A=M // 13673
D=M // 13674
@SP // 13675
AM=M-1 // 13676
D=D+M // 13677
@SP // 13678
AM=M+1 // 13679
A=A-1 // 13680
M=D // 13681
// call Screen.drawHorizontalLine
@8 // 13682
D=A // 13683
@14 // 13684
M=D // 13685
@Screen.drawHorizontalLine // 13686
D=A // 13687
@13 // 13688
M=D // 13689
@Screen.drawCircle.ret.2 // 13690
D=A // 13691
@CALL // 13692
0;JMP // 13693
(Screen.drawCircle.ret.2)
@SP // 13694
M=M-1 // 13695

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

@ARG // 13696
A=M // 13697
D=M // 13698
@SP // 13699
AM=M+1 // 13700
A=A-1 // 13701
M=D // 13702
@LCL // 13703
A=M+1 // 13704
D=M // 13705
@SP // 13706
AM=M-1 // 13707
D=M-D // 13708
@SP // 13709
AM=M+1 // 13710
A=A-1 // 13711
M=D // 13712
@ARG // 13713
A=M // 13714
D=M // 13715
@SP // 13716
AM=M+1 // 13717
A=A-1 // 13718
M=D // 13719
@LCL // 13720
A=M+1 // 13721
D=M // 13722
@SP // 13723
AM=M-1 // 13724
D=D+M // 13725
@SP // 13726
AM=M+1 // 13727
A=A-1 // 13728
M=D // 13729
@ARG // 13730
A=M+1 // 13731
D=M // 13732
@SP // 13733
AM=M+1 // 13734
A=A-1 // 13735
M=D // 13736
@LCL // 13737
A=M // 13738
D=M // 13739
@SP // 13740
AM=M-1 // 13741
D=M-D // 13742
@SP // 13743
AM=M+1 // 13744
A=A-1 // 13745
M=D // 13746
// call Screen.drawHorizontalLine
@8 // 13747
D=A // 13748
@14 // 13749
M=D // 13750
@Screen.drawHorizontalLine // 13751
D=A // 13752
@13 // 13753
M=D // 13754
@Screen.drawCircle.ret.3 // 13755
D=A // 13756
@CALL // 13757
0;JMP // 13758
(Screen.drawCircle.ret.3)
@SP // 13759
M=M-1 // 13760

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.59 // 13761
D=A // 13762
@SP // 13763
AM=M+1 // 13764
A=A-1 // 13765
M=D // 13766
@LCL // 13767
A=M+1 // 13768
A=A+1 // 13769
D=M // 13770
@DO_LT // 13771
0;JMP // 13772
(Screen.drawCircle.LT.59)
@Screen.drawCircle$IF_TRUE1 // 13773
D;JNE // 13774

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13775
0;JMP // 13776

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

@LCL // 13777
A=M+1 // 13778
A=A+1 // 13779
D=M // 13780
@SP // 13781
AM=M+1 // 13782
A=A-1 // 13783
M=D // 13784
@LCL // 13785
A=M // 13786
D=M // 13787
D=D+M // 13788
@SP // 13789
AM=M-1 // 13790
D=D+M // 13791
@3 // 13792
D=D+A // 13793
@LCL // 13794
A=M+1 // 13795
A=A+1 // 13796
M=D // 13797

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13798
0;JMP // 13799

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

@LCL // 13800
A=M+1 // 13801
A=A+1 // 13802
D=M // 13803
@SP // 13804
AM=M+1 // 13805
A=A-1 // 13806
M=D // 13807
@LCL // 13808
A=M+1 // 13809
D=M // 13810
A=A-1 // 13811
D=M-D // 13812
@R13 // 13813
M=D // 13814
D=D+M // 13815
@SP // 13816
AM=M-1 // 13817
D=D+M // 13818
@5 // 13819
D=D+A // 13820
@LCL // 13821
A=M+1 // 13822
A=A+1 // 13823
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

@LCL // 13828
A=M // 13829
M=M+1 // 13830

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13831
0;JMP // 13832

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13833
AM=M+1 // 13834
A=A-1 // 13835
M=0 // 13836
@RETURN // 13837
0;JMP // 13838

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13839
D=A // 13840
@14 // 13841
M=D // 13842
@Memory.init // 13843
D=A // 13844
@13 // 13845
M=D // 13846
@Sys.init.ret.0 // 13847
D=A // 13848
@CALL // 13849
0;JMP // 13850
(Sys.init.ret.0)
@SP // 13851
M=M-1 // 13852

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13853
D=A // 13854
@14 // 13855
M=D // 13856
@Math.init // 13857
D=A // 13858
@13 // 13859
M=D // 13860
@Sys.init.ret.1 // 13861
D=A // 13862
@CALL // 13863
0;JMP // 13864
(Sys.init.ret.1)
@SP // 13865
M=M-1 // 13866

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13867
D=A // 13868
@14 // 13869
M=D // 13870
@Screen.init // 13871
D=A // 13872
@13 // 13873
M=D // 13874
@Sys.init.ret.2 // 13875
D=A // 13876
@CALL // 13877
0;JMP // 13878
(Sys.init.ret.2)
@SP // 13879
M=M-1 // 13880

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13881
D=A // 13882
@14 // 13883
M=D // 13884
@Output.init // 13885
D=A // 13886
@13 // 13887
M=D // 13888
@Sys.init.ret.3 // 13889
D=A // 13890
@CALL // 13891
0;JMP // 13892
(Sys.init.ret.3)
@SP // 13893
M=M-1 // 13894

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13895
D=A // 13896
@14 // 13897
M=D // 13898
@Keyboard.init // 13899
D=A // 13900
@13 // 13901
M=D // 13902
@Sys.init.ret.4 // 13903
D=A // 13904
@CALL // 13905
0;JMP // 13906
(Sys.init.ret.4)
@SP // 13907
M=M-1 // 13908

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13909
D=A // 13910
@14 // 13911
M=D // 13912
@Main.main // 13913
D=A // 13914
@13 // 13915
M=D // 13916
@Sys.init.ret.5 // 13917
D=A // 13918
@CALL // 13919
0;JMP // 13920
(Sys.init.ret.5)
@SP // 13921
M=M-1 // 13922

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13923
D=A // 13924
@14 // 13925
M=D // 13926
@Sys.halt // 13927
D=A // 13928
@13 // 13929
M=D // 13930
@Sys.init.ret.6 // 13931
D=A // 13932
@CALL // 13933
0;JMP // 13934
(Sys.init.ret.6)
@SP // 13935
M=M-1 // 13936

////PushInstruction("constant 0")
@SP // 13937
AM=M+1 // 13938
A=A-1 // 13939
M=0 // 13940
@RETURN // 13941
0;JMP // 13942

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13943
A=M // 13944
D=M // 13945
@Screen.0 // 13946
M=D // 13947

////PushInstruction("constant 0")
@SP // 13948
AM=M+1 // 13949
A=A-1 // 13950
M=0 // 13951
@RETURN // 13952
0;JMP // 13953

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 13954
M=M+1 // 13955
AM=M+1 // 13956
A=A-1 // 13957
M=0 // 13958
A=A-1 // 13959
M=0 // 13960

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13961
A=M // 13962
M=1 // 13963

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13964
A=M+1 // 13965
M=0 // 13966

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 13967
D=A // 13968
@SP // 13969
AM=M+1 // 13970
A=A-1 // 13971
M=D // 13972
// call Memory.alloc
@6 // 13973
D=A // 13974
@14 // 13975
M=D // 13976
@Memory.alloc // 13977
D=A // 13978
@13 // 13979
M=D // 13980
@Math.init.ret.0 // 13981
D=A // 13982
@CALL // 13983
0;JMP // 13984
(Math.init.ret.0)
@SP // 13985
AM=M-1 // 13986
D=M // 13987
@Math.0 // 13988
M=D // 13989

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
@Math.init.LT.60 // 13990
D=A // 13991
@SP // 13992
AM=M+1 // 13993
A=A-1 // 13994
M=D // 13995
@LCL // 13996
A=M+1 // 13997
D=M // 13998
@16 // 13999
D=D-A // 14000
@DO_LT // 14001
0;JMP // 14002
(Math.init.LT.60)
D=!D // 14003
@Math.init_WHILE_END1 // 14004
D;JNE // 14005

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 14006
D=M // 14007
@SP // 14008
AM=M+1 // 14009
A=A-1 // 14010
M=D // 14011
@LCL // 14012
A=M+1 // 14013
D=M // 14014
@SP // 14015
AM=M-1 // 14016
D=D+M // 14017
@SP // 14018
AM=M+1 // 14019
A=A-1 // 14020
M=D // 14021
@LCL // 14022
A=M // 14023
D=M // 14024
@SP // 14025
AM=M-1 // 14026
A=M // 14027
M=D // 14028

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

@LCL // 14029
A=M // 14030
D=M // 14031
@LCL // 14032
A=M // 14033
M=D+M // 14034

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

@LCL // 14035
A=M+1 // 14036
M=M+1 // 14037

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 14038
0;JMP // 14039

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 14040
AM=M+1 // 14041
A=A-1 // 14042
M=0 // 14043
@RETURN // 14044
0;JMP // 14045

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 14046
M=M+1 // 14047
AM=M+1 // 14048
A=A-1 // 14049
M=0 // 14050
A=A-1 // 14051
M=0 // 14052

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

@2055 // 14053
D=A // 14054
@LCL // 14055
A=M // 14056
M=D // 14057

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
@LCL // 14058
A=M // 14059
D=M // 14060
@SP // 14061
AM=M+1 // 14062
A=A-1 // 14063
M=D // 14064
@LCL // 14065
A=M // 14066
D=M // 14067
@16384 // 14068
D=A-D // 14069
@5 // 14070
D=D-A // 14071
@SP // 14072
AM=M-1 // 14073
A=M // 14074
M=D // 14075

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 14076
A=M // 14077
D=M // 14078
@SP // 14079
AM=M+1 // 14080
A=A-1 // 14081
M=D+1 // 14082
D=1 // 14083
@SP // 14084
AM=M-1 // 14085
A=M // 14086
M=D // 14087

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 14088
A=M // 14089
D=M // 14090
@2 // 14091
D=D+A // 14092
@SP // 14093
AM=M+1 // 14094
A=A-1 // 14095
M=D // 14096
D=0 // 14097
@SP // 14098
AM=M-1 // 14099
A=M // 14100
M=D // 14101

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 14102
A=M // 14103
D=M // 14104
@3 // 14105
D=D+A // 14106
@SP // 14107
AM=M+1 // 14108
A=A-1 // 14109
M=D // 14110
D=0 // 14111
@SP // 14112
AM=M-1 // 14113
A=M // 14114
M=D // 14115

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14116
A=M // 14117
D=M // 14118
@SP // 14119
AM=M+1 // 14120
A=A-1 // 14121
M=D // 14122
// call Memory.create_foot
@6 // 14123
D=A // 14124
@14 // 14125
M=D // 14126
@Memory.create_foot // 14127
D=A // 14128
@13 // 14129
M=D // 14130
@Memory.init.ret.0 // 14131
D=A // 14132
@CALL // 14133
0;JMP // 14134
(Memory.init.ret.0)
@SP // 14135
M=M-1 // 14136

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

@2054 // 14137
D=A // 14138
@SP // 14139
AM=M+1 // 14140
A=A-1 // 14141
M=D // 14142
@2054 // 14143
D=A // 14144
@SP // 14145
AM=M+1 // 14146
A=A-1 // 14147
M=D // 14148
@LCL // 14149
A=M // 14150
D=M // 14151
@SP // 14152
AM=M+1 // 14153
A=A-1 // 14154
M=D // 14155
// call Memory.add_node
@7 // 14156
D=A // 14157
@14 // 14158
M=D // 14159
@Memory.add_node // 14160
D=A // 14161
@13 // 14162
M=D // 14163
@Memory.init.ret.1 // 14164
D=A // 14165
@CALL // 14166
0;JMP // 14167
(Memory.init.ret.1)
@SP // 14168
M=M-1 // 14169

////PushInstruction("constant 0")
@SP // 14170
AM=M+1 // 14171
A=A-1 // 14172
M=0 // 14173
@RETURN // 14174
0;JMP // 14175

