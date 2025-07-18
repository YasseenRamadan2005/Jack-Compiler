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
A=D // 222
D=M // 223
@LCL // 224
A=M // 225
M=D // 226

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
@Memory.get_best_fit.LT.2 // 227
D=A // 228
@SP // 229
AM=M+1 // 230
A=A-1 // 231
M=D // 232
@LCL // 233
A=M // 234
D=M // 235
A=D // 236
D=M // 237
@SP // 238
AM=M+1 // 239
A=A-1 // 240
M=D // 241
@ARG // 242
A=M+1 // 243
D=M // 244
@SP // 245
AM=M-1 // 246
D=M-D // 247
@DO_LT // 248
0;JMP // 249
(Memory.get_best_fit.LT.2)
D=!D // 250
@Memory.get_best_fit$IF_TRUE1 // 251
D;JNE // 252

////GotoInstruction{label='Memory.get_best_fit$IF_END1}
// goto Memory.get_best_fit$IF_END1
@Memory.get_best_fit$IF_END1 // 253
0;JMP // 254

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 255
A=M // 256
D=M // 257
@SP // 258
AM=M+1 // 259
A=A-1 // 260
M=D // 261
@RETURN // 262
0;JMP // 263

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
@Memory.get_best_fit.EQ.3 // 264
D=A // 265
@SP // 266
AM=M+1 // 267
A=A-1 // 268
M=D // 269
@LCL // 270
A=M // 271
D=M // 272
@LCL // 273
A=M // 274
D=M // 275
@3 // 276
D=D+A // 277
A=D // 278
D=M // 279
@DO_EQ // 280
0;JMP // 281
(Memory.get_best_fit.EQ.3)
@Memory.get_best_fit_WHILE_END1 // 282
D;JNE // 283

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

@LCL // 284
A=M // 285
D=M // 286
@LCL // 287
A=M // 288
D=M // 289
@3 // 290
D=D+A // 291
A=D // 292
D=M // 293
@LCL // 294
A=M // 295
M=D // 296

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
@Memory.get_best_fit.LT.4 // 297
D=A // 298
@SP // 299
AM=M+1 // 300
A=A-1 // 301
M=D // 302
@LCL // 303
A=M // 304
D=M // 305
A=D // 306
D=M // 307
@SP // 308
AM=M+1 // 309
A=A-1 // 310
M=D // 311
@ARG // 312
A=M+1 // 313
D=M // 314
@SP // 315
AM=M-1 // 316
D=M-D // 317
@DO_LT // 318
0;JMP // 319
(Memory.get_best_fit.LT.4)
D=!D // 320
@Memory.get_best_fit$IF_TRUE2 // 321
D;JNE // 322

////GotoInstruction{label='Memory.get_best_fit$IF_END2}
// goto Memory.get_best_fit$IF_END2
@Memory.get_best_fit$IF_END2 // 323
0;JMP // 324

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 325
A=M // 326
D=M // 327
@SP // 328
AM=M+1 // 329
A=A-1 // 330
M=D // 331
@RETURN // 332
0;JMP // 333

////LabelInstruction{label='Memory.get_best_fit$IF_END2}
// label Memory.get_best_fit$IF_END2
(Memory.get_best_fit$IF_END2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 334
0;JMP // 335

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 336
AM=M+1 // 337
A=A-1 // 338
M=0 // 339
@RETURN // 340
0;JMP // 341

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1}}
// function String.appendChar with 1
(String.appendChar)
@SP // 342
AM=M+1 // 343
A=A-1 // 344
M=0 // 345

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 346
A=M // 347
D=M // 348
@3 // 349
M=D // 350

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.5 // 351
D=A // 352
@SP // 353
AM=M+1 // 354
A=A-1 // 355
M=D // 356
@THIS // 357
A=M+1 // 358
A=A+1 // 359
D=M // 360
A=A-1 // 361
D=M-D // 362
@DO_EQ // 363
0;JMP // 364
(String.appendChar.EQ.5)
@String.appendChar$IF_TRUE1 // 365
D;JNE // 366

////GotoInstruction{label='String.appendChar$IF_END1}
// goto String.appendChar$IF_END1
@String.appendChar$IF_END1 // 367
0;JMP // 368

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

@THIS // 369
A=M+1 // 370
A=A+1 // 371
D=M // 372
D=D+M // 373
@SP // 374
AM=M+1 // 375
A=A-1 // 376
M=D // 377
// call Memory.alloc
@6 // 378
D=A // 379
@14 // 380
M=D // 381
@Memory.alloc // 382
D=A // 383
@13 // 384
M=D // 385
@String.appendChar.ret.0 // 386
D=A // 387
@CALL // 388
0;JMP // 389
(String.appendChar.ret.0)
@SP // 390
AM=M-1 // 391
D=M // 392
@LCL // 393
A=M // 394
M=D // 395

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 396
A=M // 397
D=M // 398
@SP // 399
AM=M+1 // 400
A=A-1 // 401
M=D // 402
@LCL // 403
A=M // 404
D=M // 405
@SP // 406
AM=M+1 // 407
A=A-1 // 408
M=D // 409
@THIS // 410
A=M+1 // 411
D=M // 412
@SP // 413
AM=M+1 // 414
A=A-1 // 415
M=D // 416
// call Memory.copy
@8 // 417
D=A // 418
@14 // 419
M=D // 420
@Memory.copy // 421
D=A // 422
@13 // 423
M=D // 424
@String.appendChar.ret.1 // 425
D=A // 426
@CALL // 427
0;JMP // 428
(String.appendChar.ret.1)
@SP // 429
M=M-1 // 430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 431
A=M // 432
D=M // 433
@SP // 434
AM=M+1 // 435
A=A-1 // 436
M=D // 437
// call Memory.deAlloc
@6 // 438
D=A // 439
@14 // 440
M=D // 441
@Memory.deAlloc // 442
D=A // 443
@13 // 444
M=D // 445
@String.appendChar.ret.2 // 446
D=A // 447
@CALL // 448
0;JMP // 449
(String.appendChar.ret.2)
@SP // 450
M=M-1 // 451

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

@THIS // 452
A=M+1 // 453
A=A+1 // 454
D=M // 455
@THIS // 456
A=M+1 // 457
A=A+1 // 458
M=D+M // 459

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 460
A=M // 461
D=M // 462
@THIS // 463
A=M // 464
M=D // 465

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
@THIS // 466
A=M+1 // 467
D=M // 468
A=A-1 // 469
D=D+M // 470
@SP // 471
AM=M+1 // 472
A=A-1 // 473
M=D // 474
@ARG // 475
A=M+1 // 476
D=M // 477
@SP // 478
AM=M-1 // 479
A=M // 480
M=D // 481

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

@THIS // 482
A=M+1 // 483
M=M+1 // 484

////PushInstruction("pointer 0")
@3 // 485
D=M // 486
@SP // 487
AM=M+1 // 488
A=A-1 // 489
M=D // 490
@RETURN // 491
0;JMP // 492

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 493
AM=M+1 // 494
A=A-1 // 495
M=0 // 496

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 497
A=M // 498
D=M // 499
@LCL // 500
A=M // 501
M=D // 502

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
@Screen.drawHorizontalLine.GT.6 // 503
D=A // 504
@SP // 505
AM=M+1 // 506
A=A-1 // 507
M=D // 508
@LCL // 509
A=M // 510
D=M // 511
@ARG // 512
A=M+1 // 513
D=M-D // 514
@DO_GT // 515
0;JMP // 516
(Screen.drawHorizontalLine.GT.6)
@Screen.drawHorizontalLine_WHILE_END1 // 517
D;JNE // 518

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 519
A=M // 520
D=M // 521
@SP // 522
AM=M+1 // 523
A=A-1 // 524
M=D // 525
@ARG // 526
A=M+1 // 527
A=A+1 // 528
D=M // 529
@SP // 530
AM=M+1 // 531
A=A-1 // 532
M=D // 533
// call Screen.drawPixel
@7 // 534
D=A // 535
@14 // 536
M=D // 537
@Screen.drawPixel // 538
D=A // 539
@13 // 540
M=D // 541
@Screen.drawHorizontalLine.ret.0 // 542
D=A // 543
@CALL // 544
0;JMP // 545
(Screen.drawHorizontalLine.ret.0)
@SP // 546
M=M-1 // 547

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

@LCL // 548
A=M // 549
M=M+1 // 550

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 551
0;JMP // 552

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 553
AM=M+1 // 554
A=A-1 // 555
M=0 // 556
@RETURN // 557
0;JMP // 558

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.drawHorizontalLine=1}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 559
D=A // 560
@SP // 561
AM=D+M // 562
A=A-1 // 563
M=0 // 564
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

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 583
D=M // 584
@9 // 585
A=D+A // 586
M=-1 // 587

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Screen.0 // 588
D=!M // 589
@Screen.drawRectangle$IF_TRUE1 // 590
D;JNE // 591

////GotoInstruction{label='Screen.drawRectangle$IF_END1}
// goto Screen.drawRectangle$IF_END1
@Screen.drawRectangle$IF_END1 // 592
0;JMP // 593

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 594
D=M // 595
@9 // 596
A=D+A // 597
M=0 // 598

////LabelInstruction{label='Screen.drawRectangle$IF_END1}
// label Screen.drawRectangle$IF_END1
(Screen.drawRectangle$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 599
A=M+1 // 600
D=M // 601
@LCL // 602
A=M // 603
M=D // 604

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
@Screen.drawRectangle.GT.7 // 605
D=A // 606
@SP // 607
AM=M+1 // 608
A=A-1 // 609
M=D // 610
@LCL // 611
A=M // 612
D=M // 613
@ARG // 614
A=M+1 // 615
A=A+1 // 616
A=A+1 // 617
D=M-D // 618
@DO_GT // 619
0;JMP // 620
(Screen.drawRectangle.GT.7)
@Screen.drawRectangle_WHILE_END1 // 621
D;JNE // 622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 623
A=M // 624
D=M // 625
@SP // 626
AM=M+1 // 627
A=A-1 // 628
M=D // 629
@16 // 630
D=A // 631
@SP // 632
AM=M+1 // 633
A=A-1 // 634
M=D // 635
// call Math.divide
@7 // 636
D=A // 637
@14 // 638
M=D // 639
@Math.divide // 640
D=A // 641
@13 // 642
M=D // 643
@Screen.drawRectangle.ret.0 // 644
D=A // 645
@CALL // 646
0;JMP // 647
(Screen.drawRectangle.ret.0)
@SP // 648
AM=M-1 // 649
D=M // 650
@LCL // 651
A=M+1 // 652
M=D // 653

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 654
A=M+1 // 655
A=A+1 // 656
D=M // 657
@SP // 658
AM=M+1 // 659
A=A-1 // 660
M=D // 661
@16 // 662
D=A // 663
@SP // 664
AM=M+1 // 665
A=A-1 // 666
M=D // 667
// call Math.divide
@7 // 668
D=A // 669
@14 // 670
M=D // 671
@Math.divide // 672
D=A // 673
@13 // 674
M=D // 675
@Screen.drawRectangle.ret.1 // 676
D=A // 677
@CALL // 678
0;JMP // 679
(Screen.drawRectangle.ret.1)
@SP // 680
AM=M-1 // 681
D=M // 682
@LCL // 683
A=M+1 // 684
A=A+1 // 685
M=D // 686

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

@ARG // 687
A=M // 688
D=M // 689
@15 // 690
D=D&A // 691
@LCL // 692
A=M+1 // 693
A=A+1 // 694
A=A+1 // 695
M=D // 696

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

@ARG // 697
A=M+1 // 698
A=A+1 // 699
D=M // 700
@15 // 701
D=D&A // 702
@SP // 703
AM=M+1 // 704
A=A-1 // 705
M=D // 706
@LCL // 707
D=M // 708
@4 // 709
A=D+A // 710
D=A // 711
@R13 // 712
M=D // 713
@SP // 714
AM=M-1 // 715
D=M // 716
@R13 // 717
A=M // 718
M=D // 719

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 720
A=M // 721
D=M // 722
@SP // 723
AM=M+1 // 724
A=A-1 // 725
M=D // 726
@32 // 727
D=A // 728
@SP // 729
AM=M+1 // 730
A=A-1 // 731
M=D // 732
// call Math.multiply
@7 // 733
D=A // 734
@14 // 735
M=D // 736
@Math.multiply // 737
D=A // 738
@13 // 739
M=D // 740
@Screen.drawRectangle.ret.2 // 741
D=A // 742
@CALL // 743
0;JMP // 744
(Screen.drawRectangle.ret.2)
@LCL // 745
D=M // 746
@5 // 747
A=D+A // 748
D=A // 749
@R13 // 750
M=D // 751
@SP // 752
AM=M-1 // 753
D=M // 754
@R13 // 755
A=M // 756
M=D // 757

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.8 // 758
D=A // 759
@SP // 760
AM=M+1 // 761
A=A-1 // 762
M=D // 763
@LCL // 764
A=M+1 // 765
A=A+1 // 766
D=M // 767
A=A-1 // 768
D=M-D // 769
@DO_EQ // 770
0;JMP // 771
(Screen.drawRectangle.EQ.8)
@Screen.drawRectangle$IF_TRUE2 // 772
D;JNE // 773

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 774
0;JMP // 775

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

@LCL // 776
D=M // 777
@4 // 778
A=D+A // 779
D=M // 780
@SP // 781
AM=M+1 // 782
A=A-1 // 783
M=D+1 // 784
// call Math.twoToThe
@6 // 785
D=A // 786
@14 // 787
M=D // 788
@Math.twoToThe // 789
D=A // 790
@13 // 791
M=D // 792
@Screen.drawRectangle.ret.3 // 793
D=A // 794
@CALL // 795
0;JMP // 796
(Screen.drawRectangle.ret.3)
@SP // 797
AM=M-1 // 798
D=M // 799
D=D-1 // 800
@SP // 801
AM=M+1 // 802
A=A-1 // 803
M=D // 804
@LCL // 805
A=M+1 // 806
A=A+1 // 807
A=A+1 // 808
D=M // 809
@SP // 810
AM=M+1 // 811
A=A-1 // 812
M=D // 813
// call Math.twoToThe
@6 // 814
D=A // 815
@14 // 816
M=D // 817
@Math.twoToThe // 818
D=A // 819
@13 // 820
M=D // 821
@Screen.drawRectangle.ret.4 // 822
D=A // 823
@CALL // 824
0;JMP // 825
(Screen.drawRectangle.ret.4)
@SP // 826
AM=M-1 // 827
D=M // 828
D=D-1 // 829
@SP // 830
AM=M-1 // 831
D=M-D // 832
@SP // 833
AM=M+1 // 834
A=A-1 // 835
M=D // 836
@LCL // 837
D=M // 838
@6 // 839
A=D+A // 840
D=A // 841
@R13 // 842
M=D // 843
@SP // 844
AM=M-1 // 845
D=M // 846
@R13 // 847
A=M // 848
M=D // 849

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

@LCL // 850
D=M // 851
@5 // 852
A=D+A // 853
D=M // 854
@SP // 855
AM=M+1 // 856
A=A-1 // 857
M=D // 858
@LCL // 859
A=M+1 // 860
D=M // 861
@SP // 862
AM=M-1 // 863
D=D+M // 864
@SP // 865
AM=M+1 // 866
A=A-1 // 867
M=D // 868
@LCL // 869
D=M // 870
@7 // 871
A=D+A // 872
D=A // 873
@R13 // 874
M=D // 875
@SP // 876
AM=M-1 // 877
D=M // 878
@R13 // 879
A=M // 880
M=D // 881

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Screen.0 // 882
D=M // 883
@Screen.drawRectangle$IF_TRUE3 // 884
D;JNE // 885

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 886
0;JMP // 887

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
@LCL // 888
D=M // 889
@7 // 890
A=D+A // 891
D=M // 892
@16384 // 893
D=D+A // 894
@SP // 895
AM=M+1 // 896
A=A-1 // 897
M=D // 898
@LCL // 899
D=M // 900
@7 // 901
A=D+A // 902
D=M // 903
@LCL // 904
D=M // 905
@7 // 906
A=D+A // 907
D=M // 908
@16384 // 909
D=D+A // 910
A=D // 911
D=M // 912
@SP // 913
AM=M+1 // 914
A=A-1 // 915
M=D // 916
@LCL // 917
D=M // 918
@6 // 919
A=D+A // 920
D=M // 921
@SP // 922
AM=M-1 // 923
D=D|M // 924
@SP // 925
AM=M-1 // 926
A=M // 927
M=D // 928

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 929
0;JMP // 930

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
@LCL // 931
D=M // 932
@7 // 933
A=D+A // 934
D=M // 935
@16384 // 936
D=D+A // 937
@SP // 938
AM=M+1 // 939
A=A-1 // 940
M=D // 941
@LCL // 942
D=M // 943
@7 // 944
A=D+A // 945
D=M // 946
@LCL // 947
D=M // 948
@7 // 949
A=D+A // 950
D=M // 951
@16384 // 952
D=D+A // 953
A=D // 954
D=M // 955
@SP // 956
AM=M+1 // 957
A=A-1 // 958
M=D // 959
@LCL // 960
D=M // 961
@6 // 962
A=D+A // 963
D=!M // 964
@SP // 965
AM=M-1 // 966
D=D&M // 967
@SP // 968
AM=M-1 // 969
A=M // 970
M=D // 971

////LabelInstruction{label='Screen.drawRectangle$IF_END3}
// label Screen.drawRectangle$IF_END3
(Screen.drawRectangle$IF_END3)

////GotoInstruction{label='Screen.drawRectangle$IF_END2}
// goto Screen.drawRectangle$IF_END2
@Screen.drawRectangle$IF_END2 // 972
0;JMP // 973

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

@LCL // 974
A=M+1 // 975
A=A+1 // 976
A=A+1 // 977
D=M // 978
@SP // 979
AM=M+1 // 980
A=A-1 // 981
M=D // 982
// call Math.twoToThe
@6 // 983
D=A // 984
@14 // 985
M=D // 986
@Math.twoToThe // 987
D=A // 988
@13 // 989
M=D // 990
@Screen.drawRectangle.ret.5 // 991
D=A // 992
@CALL // 993
0;JMP // 994
(Screen.drawRectangle.ret.5)
@SP // 995
AM=M-1 // 996
D=M // 997
D=D-1 // 998
@SP // 999
AM=M+1 // 1000
A=A-1 // 1001
M=D // 1002
@SP // 1003
A=M-1 // 1004
M=!D // 1005
@LCL // 1006
D=M // 1007
@6 // 1008
A=D+A // 1009
D=A // 1010
@R13 // 1011
M=D // 1012
@SP // 1013
AM=M-1 // 1014
D=M // 1015
@R13 // 1016
A=M // 1017
M=D // 1018

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

@LCL // 1019
D=M // 1020
@5 // 1021
A=D+A // 1022
D=M // 1023
@SP // 1024
AM=M+1 // 1025
A=A-1 // 1026
M=D // 1027
@LCL // 1028
A=M+1 // 1029
D=M // 1030
@SP // 1031
AM=M-1 // 1032
D=D+M // 1033
@SP // 1034
AM=M+1 // 1035
A=A-1 // 1036
M=D // 1037
@LCL // 1038
D=M // 1039
@7 // 1040
A=D+A // 1041
D=A // 1042
@R13 // 1043
M=D // 1044
@SP // 1045
AM=M-1 // 1046
D=M // 1047
@R13 // 1048
A=M // 1049
M=D // 1050

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE4}}
@Screen.0 // 1051
D=M // 1052
@Screen.drawRectangle$IF_TRUE4 // 1053
D;JNE // 1054

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE4}
// goto Screen.drawRectangle$IF_FALSE4
@Screen.drawRectangle$IF_FALSE4 // 1055
0;JMP // 1056

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
@LCL // 1057
D=M // 1058
@7 // 1059
A=D+A // 1060
D=M // 1061
@16384 // 1062
D=D+A // 1063
@SP // 1064
AM=M+1 // 1065
A=A-1 // 1066
M=D // 1067
@LCL // 1068
D=M // 1069
@7 // 1070
A=D+A // 1071
D=M // 1072
@LCL // 1073
D=M // 1074
@7 // 1075
A=D+A // 1076
D=M // 1077
@16384 // 1078
D=D+A // 1079
A=D // 1080
D=M // 1081
@SP // 1082
AM=M+1 // 1083
A=A-1 // 1084
M=D // 1085
@LCL // 1086
D=M // 1087
@6 // 1088
A=D+A // 1089
D=M // 1090
@SP // 1091
AM=M-1 // 1092
D=D|M // 1093
@SP // 1094
AM=M-1 // 1095
A=M // 1096
M=D // 1097

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 1098
0;JMP // 1099

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
@LCL // 1100
D=M // 1101
@7 // 1102
A=D+A // 1103
D=M // 1104
@16384 // 1105
D=D+A // 1106
@SP // 1107
AM=M+1 // 1108
A=A-1 // 1109
M=D // 1110
@LCL // 1111
D=M // 1112
@7 // 1113
A=D+A // 1114
D=M // 1115
@LCL // 1116
D=M // 1117
@7 // 1118
A=D+A // 1119
D=M // 1120
@16384 // 1121
D=D+A // 1122
A=D // 1123
D=M // 1124
@SP // 1125
AM=M+1 // 1126
A=A-1 // 1127
M=D // 1128
@LCL // 1129
D=M // 1130
@6 // 1131
A=D+A // 1132
D=!M // 1133
@SP // 1134
AM=M-1 // 1135
D=D&M // 1136
@SP // 1137
AM=M-1 // 1138
A=M // 1139
M=D // 1140

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

@LCL // 1141
A=M+1 // 1142
D=M // 1143
@SP // 1144
AM=M+1 // 1145
A=A-1 // 1146
M=D+1 // 1147
@LCL // 1148
D=M // 1149
@8 // 1150
A=D+A // 1151
D=A // 1152
@R13 // 1153
M=D // 1154
@SP // 1155
AM=M-1 // 1156
D=M // 1157
@R13 // 1158
A=M // 1159
M=D // 1160

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
@Screen.drawRectangle.LT.9 // 1161
D=A // 1162
@SP // 1163
AM=M+1 // 1164
A=A-1 // 1165
M=D // 1166
@LCL // 1167
D=M // 1168
@8 // 1169
A=D+A // 1170
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
D=M-D // 1182
@DO_LT // 1183
0;JMP // 1184
(Screen.drawRectangle.LT.9)
D=!D // 1185
@Screen.drawRectangle_WHILE_END2 // 1186
D;JNE // 1187

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

@LCL // 1188
D=M // 1189
@8 // 1190
A=D+A // 1191
D=M // 1192
A=A-1 // 1193
A=A-1 // 1194
A=A-1 // 1195
D=D+M // 1196
@SP // 1197
AM=M+1 // 1198
A=A-1 // 1199
M=D // 1200
@LCL // 1201
D=M // 1202
@7 // 1203
A=D+A // 1204
D=A // 1205
@R13 // 1206
M=D // 1207
@SP // 1208
AM=M-1 // 1209
D=M // 1210
@R13 // 1211
A=M // 1212
M=D // 1213

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1214
D=M // 1215
@7 // 1216
A=D+A // 1217
D=M // 1218
@16384 // 1219
D=D+A // 1220
@SP // 1221
AM=M+1 // 1222
A=A-1 // 1223
M=D // 1224
@LCL // 1225
D=M // 1226
@9 // 1227
A=D+A // 1228
D=M // 1229
@SP // 1230
AM=M-1 // 1231
A=M // 1232
M=D // 1233

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

@LCL // 1234
D=M // 1235
@8 // 1236
A=D+A // 1237
M=M+1 // 1238

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 1239
0;JMP // 1240

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

@LCL // 1241
D=M // 1242
@4 // 1243
A=D+A // 1244
D=M // 1245
@SP // 1246
AM=M+1 // 1247
A=A-1 // 1248
M=D+1 // 1249
// call Math.twoToThe
@6 // 1250
D=A // 1251
@14 // 1252
M=D // 1253
@Math.twoToThe // 1254
D=A // 1255
@13 // 1256
M=D // 1257
@Screen.drawRectangle.ret.6 // 1258
D=A // 1259
@CALL // 1260
0;JMP // 1261
(Screen.drawRectangle.ret.6)
@SP // 1262
AM=M-1 // 1263
D=M // 1264
D=D-1 // 1265
@SP // 1266
AM=M+1 // 1267
A=A-1 // 1268
M=D // 1269
@LCL // 1270
D=M // 1271
@6 // 1272
A=D+A // 1273
D=A // 1274
@R13 // 1275
M=D // 1276
@SP // 1277
AM=M-1 // 1278
D=M // 1279
@R13 // 1280
A=M // 1281
M=D // 1282

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

@LCL // 1283
D=M // 1284
@5 // 1285
A=D+A // 1286
D=M // 1287
A=A-1 // 1288
A=A-1 // 1289
A=A-1 // 1290
D=D+M // 1291
@SP // 1292
AM=M+1 // 1293
A=A-1 // 1294
M=D // 1295
@LCL // 1296
D=M // 1297
@7 // 1298
A=D+A // 1299
D=A // 1300
@R13 // 1301
M=D // 1302
@SP // 1303
AM=M-1 // 1304
D=M // 1305
@R13 // 1306
A=M // 1307
M=D // 1308

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Screen.0 // 1309
D=M // 1310
@Screen.drawRectangle$IF_TRUE5 // 1311
D;JNE // 1312

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 1313
0;JMP // 1314

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
@LCL // 1315
D=M // 1316
@7 // 1317
A=D+A // 1318
D=M // 1319
@16384 // 1320
D=D+A // 1321
@SP // 1322
AM=M+1 // 1323
A=A-1 // 1324
M=D // 1325
@LCL // 1326
D=M // 1327
@7 // 1328
A=D+A // 1329
D=M // 1330
@LCL // 1331
D=M // 1332
@7 // 1333
A=D+A // 1334
D=M // 1335
@16384 // 1336
D=D+A // 1337
A=D // 1338
D=M // 1339
@SP // 1340
AM=M+1 // 1341
A=A-1 // 1342
M=D // 1343
@LCL // 1344
D=M // 1345
@6 // 1346
A=D+A // 1347
D=M // 1348
@SP // 1349
AM=M-1 // 1350
D=D|M // 1351
@SP // 1352
AM=M-1 // 1353
A=M // 1354
M=D // 1355

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 1356
0;JMP // 1357

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
@LCL // 1358
D=M // 1359
@7 // 1360
A=D+A // 1361
D=M // 1362
@16384 // 1363
D=D+A // 1364
@SP // 1365
AM=M+1 // 1366
A=A-1 // 1367
M=D // 1368
@LCL // 1369
D=M // 1370
@7 // 1371
A=D+A // 1372
D=M // 1373
@LCL // 1374
D=M // 1375
@7 // 1376
A=D+A // 1377
D=M // 1378
@16384 // 1379
D=D+A // 1380
A=D // 1381
D=M // 1382
@SP // 1383
AM=M+1 // 1384
A=A-1 // 1385
M=D // 1386
@LCL // 1387
D=M // 1388
@6 // 1389
A=D+A // 1390
D=!M // 1391
@SP // 1392
AM=M-1 // 1393
D=D&M // 1394
@SP // 1395
AM=M-1 // 1396
A=M // 1397
M=D // 1398

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

@LCL // 1399
A=M // 1400
M=M+1 // 1401

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 1402
0;JMP // 1403

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 1404
AM=M+1 // 1405
A=A-1 // 1406
M=0 // 1407
@RETURN // 1408
0;JMP // 1409

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
@Output.getMap.LT.10 // 1410
D=A // 1411
@SP // 1412
AM=M+1 // 1413
A=A-1 // 1414
M=D // 1415
@ARG // 1416
A=M // 1417
D=M // 1418
@32 // 1419
D=D-A // 1420
@DO_LT // 1421
0;JMP // 1422
(Output.getMap.LT.10)
@SP // 1423
AM=M+1 // 1424
A=A-1 // 1425
M=D // 1426
@Output.getMap.GT.11 // 1427
D=A // 1428
@SP // 1429
AM=M+1 // 1430
A=A-1 // 1431
M=D // 1432
@ARG // 1433
A=M // 1434
D=M // 1435
@126 // 1436
D=D-A // 1437
@DO_GT // 1438
0;JMP // 1439
(Output.getMap.GT.11)
@SP // 1440
AM=M-1 // 1441
D=D|M // 1442
@Output.getMap$IF_TRUE1 // 1443
D;JNE // 1444

////GotoInstruction{label='Output.getMap$IF_END1}
// goto Output.getMap$IF_END1
@Output.getMap$IF_END1 // 1445
0;JMP // 1446

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 1447
A=M // 1448
M=0 // 1449

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
@Output.0 // 1450
D=M // 1451
@ARG // 1452
A=M // 1453
A=D+M // 1454
D=M // 1455
@SP // 1456
AM=M+1 // 1457
A=A-1 // 1458
M=D // 1459
@RETURN // 1460
0;JMP // 1461

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 1462
M=M+1 // 1463
AM=M+1 // 1464
A=A-1 // 1465
M=0 // 1466
A=A-1 // 1467
M=0 // 1468

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

@ARG // 1469
A=M+1 // 1470
D=M // 1471
@SP // 1472
AM=M+1 // 1473
A=A-1 // 1474
M=D // 1475
@32 // 1476
D=A // 1477
@SP // 1478
AM=M+1 // 1479
A=A-1 // 1480
M=D // 1481
// call Math.multiply
@7 // 1482
D=A // 1483
@14 // 1484
M=D // 1485
@Math.multiply // 1486
D=A // 1487
@13 // 1488
M=D // 1489
@Screen.drawPixel.ret.0 // 1490
D=A // 1491
@CALL // 1492
0;JMP // 1493
(Screen.drawPixel.ret.0)
@ARG // 1494
A=M // 1495
D=M // 1496
@SP // 1497
AM=M+1 // 1498
A=A-1 // 1499
M=D // 1500
@16 // 1501
D=A // 1502
@SP // 1503
AM=M+1 // 1504
A=A-1 // 1505
M=D // 1506
// call Math.divide
@7 // 1507
D=A // 1508
@14 // 1509
M=D // 1510
@Math.divide // 1511
D=A // 1512
@13 // 1513
M=D // 1514
@Screen.drawPixel.ret.1 // 1515
D=A // 1516
@CALL // 1517
0;JMP // 1518
(Screen.drawPixel.ret.1)
@SP // 1519
AM=M-1 // 1520
D=M // 1521
@SP // 1522
AM=M-1 // 1523
D=D+M // 1524
@16384 // 1525
D=D+A // 1526
@LCL // 1527
A=M // 1528
M=D // 1529

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

@ARG // 1530
A=M // 1531
D=M // 1532
@15 // 1533
D=D&A // 1534
@LCL // 1535
A=M+1 // 1536
M=D // 1537

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 1538
D=M // 1539
@Screen.drawPixel$IF_TRUE1 // 1540
D;JNE // 1541

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 1542
0;JMP // 1543

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
@LCL // 1544
A=M // 1545
D=M // 1546
@SP // 1547
AM=M+1 // 1548
A=A-1 // 1549
M=D // 1550
@LCL // 1551
A=M // 1552
D=M // 1553
A=D // 1554
D=M // 1555
@SP // 1556
AM=M+1 // 1557
A=A-1 // 1558
M=D // 1559
@LCL // 1560
A=M+1 // 1561
D=M // 1562
@SP // 1563
AM=M+1 // 1564
A=A-1 // 1565
M=D // 1566
// call Math.twoToThe
@6 // 1567
D=A // 1568
@14 // 1569
M=D // 1570
@Math.twoToThe // 1571
D=A // 1572
@13 // 1573
M=D // 1574
@Screen.drawPixel.ret.2 // 1575
D=A // 1576
@CALL // 1577
0;JMP // 1578
(Screen.drawPixel.ret.2)
@SP // 1579
AM=M-1 // 1580
D=M // 1581
@SP // 1582
AM=M-1 // 1583
D=D|M // 1584
@SP // 1585
AM=M-1 // 1586
A=M // 1587
M=D // 1588

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 1589
0;JMP // 1590

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
@LCL // 1591
A=M // 1592
D=M // 1593
@SP // 1594
AM=M+1 // 1595
A=A-1 // 1596
M=D // 1597
@LCL // 1598
A=M // 1599
D=M // 1600
A=D // 1601
D=M // 1602
@SP // 1603
AM=M+1 // 1604
A=A-1 // 1605
M=D // 1606
@LCL // 1607
A=M+1 // 1608
D=M // 1609
@SP // 1610
AM=M+1 // 1611
A=A-1 // 1612
M=D // 1613
// call Math.twoToThe
@6 // 1614
D=A // 1615
@14 // 1616
M=D // 1617
@Math.twoToThe // 1618
D=A // 1619
@13 // 1620
M=D // 1621
@Screen.drawPixel.ret.3 // 1622
D=A // 1623
@CALL // 1624
0;JMP // 1625
(Screen.drawPixel.ret.3)
@SP // 1626
AM=M-1 // 1627
D=M // 1628
D=!D // 1629
@SP // 1630
AM=M-1 // 1631
D=D&M // 1632
@SP // 1633
AM=M-1 // 1634
A=M // 1635
M=D // 1636

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 1637
AM=M+1 // 1638
A=A-1 // 1639
M=0 // 1640
@RETURN // 1641
0;JMP // 1642

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1643
M=-1 // 1644

////PushInstruction("constant 0")
@SP // 1645
AM=M+1 // 1646
A=A-1 // 1647
M=0 // 1648
@RETURN // 1649
0;JMP // 1650

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.get_best_fit=0}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1651
D=A // 1652
@SP // 1653
AM=D+M // 1654
A=A-1 // 1655
M=0 // 1656
A=A-1 // 1657
M=0 // 1658
A=A-1 // 1659
M=0 // 1660
A=A-1 // 1661
M=0 // 1662
A=A-1 // 1663
M=0 // 1664

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1665
A=M // 1666
D=M // 1667
@SP // 1668
AM=M+1 // 1669
A=A-1 // 1670
M=D // 1671
// call Memory.getBinIndex
@6 // 1672
D=A // 1673
@14 // 1674
M=D // 1675
@Memory.getBinIndex // 1676
D=A // 1677
@13 // 1678
M=D // 1679
@Memory.alloc.ret.0 // 1680
D=A // 1681
@CALL // 1682
0;JMP // 1683
(Memory.alloc.ret.0)
@SP // 1684
AM=M-1 // 1685
D=M // 1686
@LCL // 1687
A=M // 1688
M=D // 1689

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

@LCL // 1690
A=M // 1691
D=M // 1692
@2048 // 1693
D=D+A // 1694
@LCL // 1695
A=M+1 // 1696
M=D // 1697

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1698
A=M+1 // 1699
D=M // 1700
@SP // 1701
AM=M+1 // 1702
A=A-1 // 1703
M=D // 1704
@ARG // 1705
A=M // 1706
D=M // 1707
@SP // 1708
AM=M+1 // 1709
A=A-1 // 1710
M=D // 1711
// call Memory.get_best_fit
@7 // 1712
D=A // 1713
@14 // 1714
M=D // 1715
@Memory.get_best_fit // 1716
D=A // 1717
@13 // 1718
M=D // 1719
@Memory.alloc.ret.1 // 1720
D=A // 1721
@CALL // 1722
0;JMP // 1723
(Memory.alloc.ret.1)
@SP // 1724
AM=M-1 // 1725
D=M // 1726
@LCL // 1727
A=M+1 // 1728
A=A+1 // 1729
M=D // 1730

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
@Memory.alloc.EQ.12 // 1731
D=A // 1732
@SP // 1733
AM=M+1 // 1734
A=A-1 // 1735
M=D // 1736
@LCL // 1737
A=M+1 // 1738
A=A+1 // 1739
D=M // 1740
@DO_EQ // 1741
0;JMP // 1742
(Memory.alloc.EQ.12)
D=!D // 1743
@Memory.alloc_WHILE_END1 // 1744
D;JNE // 1745

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
@Memory.alloc.LT.13 // 1746
D=A // 1747
@SP // 1748
AM=M+1 // 1749
A=A-1 // 1750
M=D // 1751
@LCL // 1752
A=M // 1753
D=M // 1754
D=D+1 // 1755
@7 // 1756
D=D-A // 1757
@DO_LT // 1758
0;JMP // 1759
(Memory.alloc.LT.13)
D=!D // 1760
@Memory.alloc$IF_TRUE1 // 1761
D;JNE // 1762

////GotoInstruction{label='Memory.alloc$IF_END1}
// goto Memory.alloc$IF_END1
@Memory.alloc$IF_END1 // 1763
0;JMP // 1764

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1765
AM=M+1 // 1766
A=A-1 // 1767
M=0 // 1768
@RETURN // 1769
0;JMP // 1770

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

@LCL // 1771
A=M // 1772
M=M+1 // 1773

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

@LCL // 1774
A=M // 1775
D=M // 1776
@2048 // 1777
D=D+A // 1778
@LCL // 1779
A=M+1 // 1780
M=D // 1781

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1782
A=M+1 // 1783
D=M // 1784
@SP // 1785
AM=M+1 // 1786
A=A-1 // 1787
M=D // 1788
@ARG // 1789
A=M // 1790
D=M // 1791
@SP // 1792
AM=M+1 // 1793
A=A-1 // 1794
M=D // 1795
// call Memory.get_best_fit
@7 // 1796
D=A // 1797
@14 // 1798
M=D // 1799
@Memory.get_best_fit // 1800
D=A // 1801
@13 // 1802
M=D // 1803
@Memory.alloc.ret.2 // 1804
D=A // 1805
@CALL // 1806
0;JMP // 1807
(Memory.alloc.ret.2)
@SP // 1808
AM=M-1 // 1809
D=M // 1810
@LCL // 1811
A=M+1 // 1812
A=A+1 // 1813
M=D // 1814

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 1815
0;JMP // 1816

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

@LCL // 1817
A=M+1 // 1818
A=A+1 // 1819
D=M // 1820
A=D // 1821
D=M // 1822
@SP // 1823
AM=M+1 // 1824
A=A-1 // 1825
M=D // 1826
// call Memory.getBinIndex
@6 // 1827
D=A // 1828
@14 // 1829
M=D // 1830
@Memory.getBinIndex // 1831
D=A // 1832
@13 // 1833
M=D // 1834
@Memory.alloc.ret.3 // 1835
D=A // 1836
@CALL // 1837
0;JMP // 1838
(Memory.alloc.ret.3)
@SP // 1839
AM=M-1 // 1840
D=M // 1841
@2048 // 1842
D=D+A // 1843
@SP // 1844
AM=M+1 // 1845
A=A-1 // 1846
M=D // 1847
@LCL // 1848
A=M+1 // 1849
A=A+1 // 1850
D=M // 1851
@SP // 1852
AM=M+1 // 1853
A=A-1 // 1854
M=D // 1855
// call Memory.remove_node
@7 // 1856
D=A // 1857
@14 // 1858
M=D // 1859
@Memory.remove_node // 1860
D=A // 1861
@13 // 1862
M=D // 1863
@Memory.alloc.ret.4 // 1864
D=A // 1865
@CALL // 1866
0;JMP // 1867
(Memory.alloc.ret.4)
@SP // 1868
M=M-1 // 1869

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

@LCL // 1870
A=M+1 // 1871
A=A+1 // 1872
D=M // 1873
A=D // 1874
D=M // 1875
@SP // 1876
AM=M+1 // 1877
A=A-1 // 1878
M=D // 1879
@ARG // 1880
A=M // 1881
D=M // 1882
@SP // 1883
AM=M-1 // 1884
D=M-D // 1885
@LCL // 1886
A=M+1 // 1887
A=A+1 // 1888
A=A+1 // 1889
M=D // 1890

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.14 // 1891
D=A // 1892
@SP // 1893
AM=M+1 // 1894
A=A-1 // 1895
M=D // 1896
@LCL // 1897
A=M+1 // 1898
A=A+1 // 1899
A=A+1 // 1900
D=M // 1901
@5 // 1902
D=D-A // 1903
@DO_GT // 1904
0;JMP // 1905
(Memory.alloc.GT.14)
@Memory.alloc$IF_TRUE2 // 1906
D;JNE // 1907

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 1908
0;JMP // 1909

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
@LCL // 1910
A=M+1 // 1911
A=A+1 // 1912
D=M // 1913
@SP // 1914
AM=M+1 // 1915
A=A-1 // 1916
M=D // 1917
@ARG // 1918
A=M // 1919
D=M // 1920
@SP // 1921
AM=M-1 // 1922
A=M // 1923
M=D // 1924

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1925
A=M+1 // 1926
A=A+1 // 1927
D=M // 1928
@SP // 1929
AM=M+1 // 1930
A=A-1 // 1931
M=D+1 // 1932
D=0 // 1933
@SP // 1934
AM=M-1 // 1935
A=M // 1936
M=D // 1937

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1938
A=M+1 // 1939
A=A+1 // 1940
D=M // 1941
@SP // 1942
AM=M+1 // 1943
A=A-1 // 1944
M=D // 1945
// call Memory.create_foot
@6 // 1946
D=A // 1947
@14 // 1948
M=D // 1949
@Memory.create_foot // 1950
D=A // 1951
@13 // 1952
M=D // 1953
@Memory.alloc.ret.5 // 1954
D=A // 1955
@CALL // 1956
0;JMP // 1957
(Memory.alloc.ret.5)
@SP // 1958
M=M-1 // 1959

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

@LCL // 1960
A=M+1 // 1961
A=A+1 // 1962
D=M // 1963
@ARG // 1964
A=M // 1965
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
A=D // 2155
D=M // 2156
@4 // 2157
D=D+A // 2158
@SP // 2159
AM=M-1 // 2160
D=D+M // 2161
@SP // 2162
AM=M+1 // 2163
A=A-1 // 2164
M=D // 2165
@ARG // 2166
A=M // 2167
D=M // 2168
@SP // 2169
AM=M-1 // 2170
A=M // 2171
M=D // 2172

////PushInstruction("constant 0")
@SP // 2173
AM=M+1 // 2174
A=A-1 // 2175
M=0 // 2176
@RETURN // 2177
0;JMP // 2178

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2179
A=M // 2180
D=M // 2181
@SP // 2182
AM=M+1 // 2183
A=A-1 // 2184
M=D // 2185
@ARG // 2186
A=M // 2187
D=M // 2188
@SP // 2189
AM=M+1 // 2190
A=A-1 // 2191
M=D // 2192
@SP // 2193
A=M-1 // 2194
M=-D // 2195
// call Math.max
@7 // 2196
D=A // 2197
@14 // 2198
M=D // 2199
@Math.max // 2200
D=A // 2201
@13 // 2202
M=D // 2203
@Math.abs.ret.0 // 2204
D=A // 2205
@CALL // 2206
0;JMP // 2207
(Math.abs.ret.0)
@RETURN // 2208
0;JMP // 2209

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
@Math.0 // 2210
D=M // 2211
@ARG // 2212
A=M // 2213
A=D+M // 2214
D=M // 2215
@SP // 2216
AM=M+1 // 2217
A=A-1 // 2218
M=D // 2219
@RETURN // 2220
0;JMP // 2221

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2222
M=M+1 // 2223
AM=M+1 // 2224
A=A-1 // 2225
M=0 // 2226
A=A-1 // 2227
M=0 // 2228

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2229
A=M // 2230
M=0 // 2231

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2232
A=M // 2233
D=M // 2234
@SP // 2235
AM=M+1 // 2236
A=A-1 // 2237
M=D // 2238
// call String.length
@6 // 2239
D=A // 2240
@14 // 2241
M=D // 2242
@String.length // 2243
D=A // 2244
@13 // 2245
M=D // 2246
@Output.printString.ret.0 // 2247
D=A // 2248
@CALL // 2249
0;JMP // 2250
(Output.printString.ret.0)
@SP // 2251
AM=M-1 // 2252
D=M // 2253
@LCL // 2254
A=M+1 // 2255
M=D // 2256

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
@Output.printString.LT.15 // 2257
D=A // 2258
@SP // 2259
AM=M+1 // 2260
A=A-1 // 2261
M=D // 2262
@LCL // 2263
A=M+1 // 2264
D=M // 2265
A=A-1 // 2266
D=M-D // 2267
@DO_LT // 2268
0;JMP // 2269
(Output.printString.LT.15)
D=!D // 2270
@Output.printString_WHILE_END1 // 2271
D;JNE // 2272

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2273
A=M // 2274
D=M // 2275
@SP // 2276
AM=M+1 // 2277
A=A-1 // 2278
M=D // 2279
@LCL // 2280
A=M // 2281
D=M // 2282
@SP // 2283
AM=M+1 // 2284
A=A-1 // 2285
M=D // 2286
// call String.charAt
@7 // 2287
D=A // 2288
@14 // 2289
M=D // 2290
@String.charAt // 2291
D=A // 2292
@13 // 2293
M=D // 2294
@Output.printString.ret.1 // 2295
D=A // 2296
@CALL // 2297
0;JMP // 2298
(Output.printString.ret.1)
// call Output.printChar
@6 // 2299
D=A // 2300
@14 // 2301
M=D // 2302
@Output.printChar // 2303
D=A // 2304
@13 // 2305
M=D // 2306
@Output.printString.ret.2 // 2307
D=A // 2308
@CALL // 2309
0;JMP // 2310
(Output.printString.ret.2)
@SP // 2311
M=M-1 // 2312

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

@LCL // 2313
A=M // 2314
M=M+1 // 2315

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2316
0;JMP // 2317

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2318
AM=M+1 // 2319
A=A-1 // 2320
M=0 // 2321
@RETURN // 2322
0;JMP // 2323

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2324
AM=M+1 // 2325
A=A-1 // 2326
M=0 // 2327

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2328
D=A // 2329
@SP // 2330
AM=M+1 // 2331
A=A-1 // 2332
M=D // 2333
// call Memory.alloc
@6 // 2334
D=A // 2335
@14 // 2336
M=D // 2337
@Memory.alloc // 2338
D=A // 2339
@13 // 2340
M=D // 2341
@Output.create.ret.0 // 2342
D=A // 2343
@CALL // 2344
0;JMP // 2345
(Output.create.ret.0)
@SP // 2346
AM=M-1 // 2347
D=M // 2348
@LCL // 2349
A=M // 2350
M=D // 2351

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 2352
D=M // 2353
@ARG // 2354
A=M // 2355
D=D+M // 2356
@SP // 2357
AM=M+1 // 2358
A=A-1 // 2359
M=D // 2360
@LCL // 2361
A=M // 2362
D=M // 2363
@SP // 2364
AM=M-1 // 2365
A=M // 2366
M=D // 2367

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2368
A=M // 2369
D=M // 2370
@SP // 2371
AM=M+1 // 2372
A=A-1 // 2373
M=D // 2374
@ARG // 2375
A=M+1 // 2376
D=M // 2377
@SP // 2378
AM=M-1 // 2379
A=M // 2380
M=D // 2381

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2382
A=M // 2383
D=M // 2384
@SP // 2385
AM=M+1 // 2386
A=A-1 // 2387
M=D+1 // 2388
@ARG // 2389
A=M+1 // 2390
A=A+1 // 2391
D=M // 2392
@SP // 2393
AM=M-1 // 2394
A=M // 2395
M=D // 2396

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2397
A=M // 2398
D=M // 2399
@2 // 2400
D=D+A // 2401
@SP // 2402
AM=M+1 // 2403
A=A-1 // 2404
M=D // 2405
@ARG // 2406
A=M+1 // 2407
A=A+1 // 2408
A=A+1 // 2409
D=M // 2410
@SP // 2411
AM=M-1 // 2412
A=M // 2413
M=D // 2414

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2415
A=M // 2416
D=M // 2417
@3 // 2418
D=D+A // 2419
@SP // 2420
AM=M+1 // 2421
A=A-1 // 2422
M=D // 2423
@ARG // 2424
D=M // 2425
@4 // 2426
A=D+A // 2427
D=M // 2428
@SP // 2429
AM=M-1 // 2430
A=M // 2431
M=D // 2432

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2433
A=M // 2434
D=M // 2435
@4 // 2436
D=D+A // 2437
@SP // 2438
AM=M+1 // 2439
A=A-1 // 2440
M=D // 2441
@ARG // 2442
D=M // 2443
@5 // 2444
A=D+A // 2445
D=M // 2446
@SP // 2447
AM=M-1 // 2448
A=M // 2449
M=D // 2450

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2451
A=M // 2452
D=M // 2453
@5 // 2454
D=D+A // 2455
@SP // 2456
AM=M+1 // 2457
A=A-1 // 2458
M=D // 2459
@ARG // 2460
D=M // 2461
@6 // 2462
A=D+A // 2463
D=M // 2464
@SP // 2465
AM=M-1 // 2466
A=M // 2467
M=D // 2468

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2469
A=M // 2470
D=M // 2471
@6 // 2472
D=D+A // 2473
@SP // 2474
AM=M+1 // 2475
A=A-1 // 2476
M=D // 2477
@ARG // 2478
D=M // 2479
@7 // 2480
A=D+A // 2481
D=M // 2482
@SP // 2483
AM=M-1 // 2484
A=M // 2485
M=D // 2486

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2487
A=M // 2488
D=M // 2489
@7 // 2490
D=D+A // 2491
@SP // 2492
AM=M+1 // 2493
A=A-1 // 2494
M=D // 2495
@ARG // 2496
D=M // 2497
@8 // 2498
A=D+A // 2499
D=M // 2500
@SP // 2501
AM=M-1 // 2502
A=M // 2503
M=D // 2504

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2505
A=M // 2506
D=M // 2507
@8 // 2508
D=D+A // 2509
@SP // 2510
AM=M+1 // 2511
A=A-1 // 2512
M=D // 2513
@ARG // 2514
D=M // 2515
@9 // 2516
A=D+A // 2517
D=M // 2518
@SP // 2519
AM=M-1 // 2520
A=M // 2521
M=D // 2522

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2523
A=M // 2524
D=M // 2525
@9 // 2526
D=D+A // 2527
@SP // 2528
AM=M+1 // 2529
A=A-1 // 2530
M=D // 2531
@ARG // 2532
D=M // 2533
@10 // 2534
A=D+A // 2535
D=M // 2536
@SP // 2537
AM=M-1 // 2538
A=M // 2539
M=D // 2540

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2541
A=M // 2542
D=M // 2543
@10 // 2544
D=D+A // 2545
@SP // 2546
AM=M+1 // 2547
A=A-1 // 2548
M=D // 2549
@ARG // 2550
D=M // 2551
@11 // 2552
A=D+A // 2553
D=M // 2554
@SP // 2555
AM=M-1 // 2556
A=M // 2557
M=D // 2558

////PushInstruction("constant 0")
@SP // 2559
AM=M+1 // 2560
A=A-1 // 2561
M=0 // 2562
@RETURN // 2563
0;JMP // 2564

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2565
A=M // 2566
D=M // 2567
@3 // 2568
M=D // 2569

////PushInstruction("this 1")
@THIS // 2570
A=M+1 // 2571
D=M // 2572
@SP // 2573
AM=M+1 // 2574
A=A-1 // 2575
M=D // 2576
@RETURN // 2577
0;JMP // 2578

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2579
D=A // 2580
@SP // 2581
AM=M+1 // 2582
A=A-1 // 2583
M=D // 2584
// call Memory.alloc
@6 // 2585
D=A // 2586
@14 // 2587
M=D // 2588
@Memory.alloc // 2589
D=A // 2590
@13 // 2591
M=D // 2592
@String.new.ret.0 // 2593
D=A // 2594
@CALL // 2595
0;JMP // 2596
(String.new.ret.0)
@SP // 2597
AM=M-1 // 2598
D=M // 2599
@3 // 2600
M=D // 2601

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.16 // 2602
D=A // 2603
@SP // 2604
AM=M+1 // 2605
A=A-1 // 2606
M=D // 2607
@ARG // 2608
A=M // 2609
D=M // 2610
@DO_EQ // 2611
0;JMP // 2612
(String.new.EQ.16)
@String.new$IF_TRUE1 // 2613
D;JNE // 2614

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2615
0;JMP // 2616

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2617
A=M // 2618
M=0 // 2619

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2620
0;JMP // 2621

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2622
A=M // 2623
D=M // 2624
@SP // 2625
AM=M+1 // 2626
A=A-1 // 2627
M=D // 2628
// call Memory.alloc
@6 // 2629
D=A // 2630
@14 // 2631
M=D // 2632
@Memory.alloc // 2633
D=A // 2634
@13 // 2635
M=D // 2636
@String.new.ret.1 // 2637
D=A // 2638
@CALL // 2639
0;JMP // 2640
(String.new.ret.1)
@SP // 2641
AM=M-1 // 2642
D=M // 2643
@THIS // 2644
A=M // 2645
M=D // 2646

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2647
A=M // 2648
D=M // 2649
@THIS // 2650
A=M+1 // 2651
A=A+1 // 2652
M=D // 2653

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2654
A=M+1 // 2655
M=0 // 2656

////PushInstruction("pointer 0")
@3 // 2657
D=M // 2658
@SP // 2659
AM=M+1 // 2660
A=A-1 // 2661
M=D // 2662
@RETURN // 2663
0;JMP // 2664

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2665
AM=M+1 // 2666
A=A-1 // 2667
M=0 // 2668

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2669
A=M // 2670
M=0 // 2671

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
@Memory.getBinIndex.LT.17 // 2672
D=A // 2673
@SP // 2674
AM=M+1 // 2675
A=A-1 // 2676
M=D // 2677
@LCL // 2678
A=M // 2679
D=M // 2680
@7 // 2681
D=D-A // 2682
@DO_LT // 2683
0;JMP // 2684
(Memory.getBinIndex.LT.17)
@SP // 2685
AM=M+1 // 2686
A=A-1 // 2687
M=D // 2688
@Memory.getBinIndex.EQ.18 // 2689
D=A // 2690
@SP // 2691
AM=M+1 // 2692
A=A-1 // 2693
M=D // 2694
@LCL // 2695
A=M // 2696
D=M // 2697
@LCL // 2698
A=M // 2699
D=M // 2700
@2048 // 2701
D=D+A // 2702
A=D // 2703
D=M // 2704
@DO_EQ // 2705
0;JMP // 2706
(Memory.getBinIndex.EQ.18)
D=!D // 2707
@SP // 2708
AM=M-1 // 2709
D=D&M // 2710
D=!D // 2711
@Memory.getBinIndex_WHILE_END1 // 2712
D;JNE // 2713

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
@Memory.getBinIndex.GT.19 // 2714
D=A // 2715
@SP // 2716
AM=M+1 // 2717
A=A-1 // 2718
M=D // 2719
@ARG // 2720
A=M // 2721
D=M // 2722
@SP // 2723
AM=M+1 // 2724
A=A-1 // 2725
M=D // 2726
@LCL // 2727
A=M // 2728
D=M // 2729
@SP // 2730
AM=M+1 // 2731
A=A-1 // 2732
M=D+1 // 2733
@16 // 2734
D=A // 2735
@SP // 2736
AM=M+1 // 2737
A=A-1 // 2738
M=D // 2739
// call Math.multiply
@7 // 2740
D=A // 2741
@14 // 2742
M=D // 2743
@Math.multiply // 2744
D=A // 2745
@13 // 2746
M=D // 2747
@Memory.getBinIndex.ret.0 // 2748
D=A // 2749
@CALL // 2750
0;JMP // 2751
(Memory.getBinIndex.ret.0)
@SP // 2752
AM=M-1 // 2753
D=M // 2754
@SP // 2755
AM=M-1 // 2756
D=M-D // 2757
@DO_GT // 2758
0;JMP // 2759
(Memory.getBinIndex.GT.19)
D=!D // 2760
@Memory.getBinIndex$IF_TRUE1 // 2761
D;JNE // 2762

////GotoInstruction{label='Memory.getBinIndex$IF_END1}
// goto Memory.getBinIndex$IF_END1
@Memory.getBinIndex$IF_END1 // 2763
0;JMP // 2764

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2765
A=M // 2766
D=M // 2767
@SP // 2768
AM=M+1 // 2769
A=A-1 // 2770
M=D // 2771
@RETURN // 2772
0;JMP // 2773

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

@LCL // 2774
A=M // 2775
M=M+1 // 2776

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2777
0;JMP // 2778

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
@6 // 2779
D=A // 2780
@SP // 2781
AM=M+1 // 2782
A=A-1 // 2783
M=D // 2784
@7 // 2785
D=A // 2786
@SP // 2787
AM=M+1 // 2788
A=A-1 // 2789
M=D-1 // 2790
@RETURN // 2791
0;JMP // 2792

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2793
D=A // 2794
@SP // 2795
AM=D+M // 2796
A=A-1 // 2797
M=0 // 2798
A=A-1 // 2799
M=0 // 2800
A=A-1 // 2801
M=0 // 2802

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
@Math.multiply.EQ.20 // 2803
D=A // 2804
@SP // 2805
AM=M+1 // 2806
A=A-1 // 2807
M=D // 2808
@ARG // 2809
A=M // 2810
D=M // 2811
@DO_EQ // 2812
0;JMP // 2813
(Math.multiply.EQ.20)
@SP // 2814
AM=M+1 // 2815
A=A-1 // 2816
M=D // 2817
@Math.multiply.EQ.21 // 2818
D=A // 2819
@SP // 2820
AM=M+1 // 2821
A=A-1 // 2822
M=D // 2823
@ARG // 2824
A=M+1 // 2825
D=M // 2826
@DO_EQ // 2827
0;JMP // 2828
(Math.multiply.EQ.21)
@SP // 2829
AM=M-1 // 2830
D=D|M // 2831
@Math.multiply$IF_TRUE1 // 2832
D;JNE // 2833

////GotoInstruction{label='Math.multiply$IF_END1}
// goto Math.multiply$IF_END1
@Math.multiply$IF_END1 // 2834
0;JMP // 2835

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2836
AM=M+1 // 2837
A=A-1 // 2838
M=0 // 2839
@RETURN // 2840
0;JMP // 2841

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
@Math.multiply.EQ.22 // 2842
D=A // 2843
@SP // 2844
AM=M+1 // 2845
A=A-1 // 2846
M=D // 2847
@ARG // 2848
A=M // 2849
D=M // 2850
D=D-1 // 2851
@DO_EQ // 2852
0;JMP // 2853
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE2 // 2854
D;JNE // 2855

////GotoInstruction{label='Math.multiply$IF_END2}
// goto Math.multiply$IF_END2
@Math.multiply$IF_END2 // 2856
0;JMP // 2857

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2858
A=M+1 // 2859
D=M // 2860
@SP // 2861
AM=M+1 // 2862
A=A-1 // 2863
M=D // 2864
@RETURN // 2865
0;JMP // 2866

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
@Math.multiply.EQ.23 // 2867
D=A // 2868
@SP // 2869
AM=M+1 // 2870
A=A-1 // 2871
M=D // 2872
@ARG // 2873
A=M+1 // 2874
D=M // 2875
D=D-1 // 2876
@DO_EQ // 2877
0;JMP // 2878
(Math.multiply.EQ.23)
@Math.multiply$IF_TRUE3 // 2879
D;JNE // 2880

////GotoInstruction{label='Math.multiply$IF_END3}
// goto Math.multiply$IF_END3
@Math.multiply$IF_END3 // 2881
0;JMP // 2882

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2883
A=M // 2884
D=M // 2885
@SP // 2886
AM=M+1 // 2887
A=A-1 // 2888
M=D // 2889
@RETURN // 2890
0;JMP // 2891

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
@Math.multiply.EQ.24 // 2892
D=A // 2893
@SP // 2894
AM=M+1 // 2895
A=A-1 // 2896
M=D // 2897
@ARG // 2898
A=M // 2899
D=M // 2900
@2 // 2901
D=D-A // 2902
@DO_EQ // 2903
0;JMP // 2904
(Math.multiply.EQ.24)
@Math.multiply$IF_TRUE4 // 2905
D;JNE // 2906

////GotoInstruction{label='Math.multiply$IF_END4}
// goto Math.multiply$IF_END4
@Math.multiply$IF_END4 // 2907
0;JMP // 2908

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
@ARG // 2909
A=M+1 // 2910
D=M // 2911
D=D+M // 2912
@SP // 2913
AM=M+1 // 2914
A=A-1 // 2915
M=D // 2916
@RETURN // 2917
0;JMP // 2918

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
@Math.multiply.EQ.25 // 2919
D=A // 2920
@SP // 2921
AM=M+1 // 2922
A=A-1 // 2923
M=D // 2924
@ARG // 2925
A=M+1 // 2926
D=M // 2927
@2 // 2928
D=D-A // 2929
@DO_EQ // 2930
0;JMP // 2931
(Math.multiply.EQ.25)
@Math.multiply$IF_TRUE5 // 2932
D;JNE // 2933

////GotoInstruction{label='Math.multiply$IF_END5}
// goto Math.multiply$IF_END5
@Math.multiply$IF_END5 // 2934
0;JMP // 2935

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
@ARG // 2936
A=M // 2937
D=M // 2938
D=D+M // 2939
@SP // 2940
AM=M+1 // 2941
A=A-1 // 2942
M=D // 2943
@RETURN // 2944
0;JMP // 2945

////LabelInstruction{label='Math.multiply$IF_END5}
// label Math.multiply$IF_END5
(Math.multiply$IF_END5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2946
A=M+1 // 2947
A=A+1 // 2948
M=1 // 2949

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2950
A=M+1 // 2951
M=0 // 2952

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2953
A=M // 2954
M=0 // 2955

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
@Math.multiply.LT.26 // 2956
D=A // 2957
@SP // 2958
AM=M+1 // 2959
A=A-1 // 2960
M=D // 2961
@LCL // 2962
A=M+1 // 2963
D=M // 2964
@16 // 2965
D=D-A // 2966
@DO_LT // 2967
0;JMP // 2968
(Math.multiply.LT.26)
D=!D // 2969
@Math.multiply_WHILE_END1 // 2970
D;JNE // 2971

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
@Math.multiply.EQ.27 // 2972
D=A // 2973
@SP // 2974
AM=M+1 // 2975
A=A-1 // 2976
M=D // 2977
@ARG // 2978
A=M+1 // 2979
D=M // 2980
@LCL // 2981
A=M+1 // 2982
A=A+1 // 2983
D=D&M // 2984
@DO_EQ // 2985
0;JMP // 2986
(Math.multiply.EQ.27)
D=!D // 2987
@Math.multiply$IF_TRUE6 // 2988
D;JNE // 2989

////GotoInstruction{label='Math.multiply$IF_END6}
// goto Math.multiply$IF_END6
@Math.multiply$IF_END6 // 2990
0;JMP // 2991

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

@ARG // 2992
A=M // 2993
D=M // 2994
@LCL // 2995
A=M // 2996
M=D+M // 2997

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

@ARG // 2998
A=M // 2999
D=M // 3000
@ARG // 3001
A=M // 3002
M=D+M // 3003

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

@LCL // 3004
A=M+1 // 3005
M=M+1 // 3006

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

@LCL // 3007
A=M+1 // 3008
A=A+1 // 3009
D=M // 3010
@LCL // 3011
A=M+1 // 3012
A=A+1 // 3013
M=D+M // 3014

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 3015
0;JMP // 3016

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 3017
A=M // 3018
D=M // 3019
@SP // 3020
AM=M+1 // 3021
A=A-1 // 3022
M=D // 3023
@RETURN // 3024
0;JMP // 3025

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3026
D=A // 3027
@SP // 3028
AM=D+M // 3029
A=A-1 // 3030
M=0 // 3031
A=A-1 // 3032
M=0 // 3033
A=A-1 // 3034
M=0 // 3035

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

@ARG // 3036
A=M // 3037
D=M // 3038
@4 // 3039
D=D-A // 3040
@LCL // 3041
A=M // 3042
M=D // 3043

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3044
A=M // 3045
D=M // 3046
@SP // 3047
AM=M+1 // 3048
A=A-1 // 3049
M=D+1 // 3050
D=1 // 3051
@SP // 3052
AM=M-1 // 3053
A=M // 3054
M=D // 3055

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

@LCL // 3056
A=M // 3057
D=M // 3058
@LCL // 3059
A=M // 3060
D=M // 3061
@2 // 3062
D=D+A // 3063
A=D // 3064
D=M // 3065
@LCL // 3066
A=M+1 // 3067
M=D // 3068

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

@LCL // 3069
A=M // 3070
D=M // 3071
@LCL // 3072
A=M // 3073
D=M // 3074
@3 // 3075
D=D+A // 3076
A=D // 3077
D=M // 3078
@LCL // 3079
A=M+1 // 3080
A=A+1 // 3081
M=D // 3082

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.28 // 3083
D=A // 3084
@SP // 3085
AM=M+1 // 3086
A=A-1 // 3087
M=D // 3088
@LCL // 3089
A=M+1 // 3090
D=M // 3091
@DO_EQ // 3092
0;JMP // 3093
(Memory.deAlloc.EQ.28)
D=!D // 3094
@Memory.deAlloc$IF_TRUE1 // 3095
D;JNE // 3096

////GotoInstruction{label='Memory.deAlloc$IF_END1}
// goto Memory.deAlloc$IF_END1
@Memory.deAlloc$IF_END1 // 3097
0;JMP // 3098

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
@Memory.deAlloc.EQ.29 // 3099
D=A // 3100
@SP // 3101
AM=M+1 // 3102
A=A-1 // 3103
M=D // 3104
@LCL // 3105
A=M+1 // 3106
D=M // 3107
A=D+1 // 3108
D=M // 3109
D=D-1 // 3110
@DO_EQ // 3111
0;JMP // 3112
(Memory.deAlloc.EQ.29)
@Memory.deAlloc$IF_TRUE2 // 3113
D;JNE // 3114

////GotoInstruction{label='Memory.deAlloc$IF_END2}
// goto Memory.deAlloc$IF_END2
@Memory.deAlloc$IF_END2 // 3115
0;JMP // 3116

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

@LCL // 3117
A=M+1 // 3118
D=M // 3119
A=D // 3120
D=M // 3121
@SP // 3122
AM=M+1 // 3123
A=A-1 // 3124
M=D // 3125
// call Memory.getBinIndex
@6 // 3126
D=A // 3127
@14 // 3128
M=D // 3129
@Memory.getBinIndex // 3130
D=A // 3131
@13 // 3132
M=D // 3133
@Memory.deAlloc.ret.0 // 3134
D=A // 3135
@CALL // 3136
0;JMP // 3137
(Memory.deAlloc.ret.0)
@SP // 3138
AM=M-1 // 3139
D=M // 3140
@2048 // 3141
D=D+A // 3142
@SP // 3143
AM=M+1 // 3144
A=A-1 // 3145
M=D // 3146
@LCL // 3147
A=M+1 // 3148
D=M // 3149
@SP // 3150
AM=M+1 // 3151
A=A-1 // 3152
M=D // 3153
// call Memory.remove_node
@7 // 3154
D=A // 3155
@14 // 3156
M=D // 3157
@Memory.remove_node // 3158
D=A // 3159
@13 // 3160
M=D // 3161
@Memory.deAlloc.ret.1 // 3162
D=A // 3163
@CALL // 3164
0;JMP // 3165
(Memory.deAlloc.ret.1)
@SP // 3166
M=M-1 // 3167

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
@LCL // 3168
A=M+1 // 3169
D=M // 3170
@SP // 3171
AM=M+1 // 3172
A=A-1 // 3173
M=D // 3174
@LCL // 3175
A=M+1 // 3176
D=M // 3177
A=D // 3178
D=M // 3179
@SP // 3180
AM=M+1 // 3181
A=A-1 // 3182
M=D // 3183
@LCL // 3184
A=M // 3185
D=M // 3186
A=D // 3187
D=M // 3188
@SP // 3189
AM=M-1 // 3190
D=D+M // 3191
@5 // 3192
D=D+A // 3193
@SP // 3194
AM=M-1 // 3195
A=M // 3196
M=D // 3197

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3198
A=M+1 // 3199
D=M // 3200
@SP // 3201
AM=M+1 // 3202
A=A-1 // 3203
M=D // 3204
// call Memory.create_foot
@6 // 3205
D=A // 3206
@14 // 3207
M=D // 3208
@Memory.create_foot // 3209
D=A // 3210
@13 // 3211
M=D // 3212
@Memory.deAlloc.ret.2 // 3213
D=A // 3214
@CALL // 3215
0;JMP // 3216
(Memory.deAlloc.ret.2)
@SP // 3217
M=M-1 // 3218

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3219
A=M+1 // 3220
D=M // 3221
@LCL // 3222
A=M // 3223
M=D // 3224

////LabelInstruction{label='Memory.deAlloc$IF_END2}
// label Memory.deAlloc$IF_END2
(Memory.deAlloc$IF_END2)

////LabelInstruction{label='Memory.deAlloc$IF_END1}
// label Memory.deAlloc$IF_END1
(Memory.deAlloc$IF_END1)

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 2"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE3}}
@Memory.deAlloc.EQ.30 // 3225
D=A // 3226
@SP // 3227
AM=M+1 // 3228
A=A-1 // 3229
M=D // 3230
@LCL // 3231
A=M+1 // 3232
A=A+1 // 3233
D=M // 3234
@DO_EQ // 3235
0;JMP // 3236
(Memory.deAlloc.EQ.30)
D=!D // 3237
@Memory.deAlloc$IF_TRUE3 // 3238
D;JNE // 3239

////GotoInstruction{label='Memory.deAlloc$IF_END3}
// goto Memory.deAlloc$IF_END3
@Memory.deAlloc$IF_END3 // 3240
0;JMP // 3241

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
@Memory.deAlloc.EQ.31 // 3242
D=A // 3243
@SP // 3244
AM=M+1 // 3245
A=A-1 // 3246
M=D // 3247
@LCL // 3248
A=M+1 // 3249
A=A+1 // 3250
D=M // 3251
A=D+1 // 3252
D=M // 3253
D=D-1 // 3254
@DO_EQ // 3255
0;JMP // 3256
(Memory.deAlloc.EQ.31)
@Memory.deAlloc$IF_TRUE4 // 3257
D;JNE // 3258

////GotoInstruction{label='Memory.deAlloc$IF_END4}
// goto Memory.deAlloc$IF_END4
@Memory.deAlloc$IF_END4 // 3259
0;JMP // 3260

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

@LCL // 3261
A=M+1 // 3262
A=A+1 // 3263
D=M // 3264
A=D // 3265
D=M // 3266
@SP // 3267
AM=M+1 // 3268
A=A-1 // 3269
M=D // 3270
// call Memory.getBinIndex
@6 // 3271
D=A // 3272
@14 // 3273
M=D // 3274
@Memory.getBinIndex // 3275
D=A // 3276
@13 // 3277
M=D // 3278
@Memory.deAlloc.ret.3 // 3279
D=A // 3280
@CALL // 3281
0;JMP // 3282
(Memory.deAlloc.ret.3)
@SP // 3283
AM=M-1 // 3284
D=M // 3285
@2048 // 3286
D=D+A // 3287
@SP // 3288
AM=M+1 // 3289
A=A-1 // 3290
M=D // 3291
@LCL // 3292
A=M+1 // 3293
A=A+1 // 3294
D=M // 3295
@SP // 3296
AM=M+1 // 3297
A=A-1 // 3298
M=D // 3299
// call Memory.remove_node
@7 // 3300
D=A // 3301
@14 // 3302
M=D // 3303
@Memory.remove_node // 3304
D=A // 3305
@13 // 3306
M=D // 3307
@Memory.deAlloc.ret.4 // 3308
D=A // 3309
@CALL // 3310
0;JMP // 3311
(Memory.deAlloc.ret.4)
@SP // 3312
M=M-1 // 3313

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
@LCL // 3314
A=M // 3315
D=M // 3316
@SP // 3317
AM=M+1 // 3318
A=A-1 // 3319
M=D // 3320
@LCL // 3321
A=M // 3322
D=M // 3323
A=D // 3324
D=M // 3325
@SP // 3326
AM=M+1 // 3327
A=A-1 // 3328
M=D // 3329
@LCL // 3330
A=M+1 // 3331
A=A+1 // 3332
D=M // 3333
A=D // 3334
D=M // 3335
@SP // 3336
AM=M-1 // 3337
D=D+M // 3338
@5 // 3339
D=D+A // 3340
@SP // 3341
AM=M-1 // 3342
A=M // 3343
M=D // 3344

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3345
A=M // 3346
D=M // 3347
@SP // 3348
AM=M+1 // 3349
A=A-1 // 3350
M=D // 3351
// call Memory.create_foot
@6 // 3352
D=A // 3353
@14 // 3354
M=D // 3355
@Memory.create_foot // 3356
D=A // 3357
@13 // 3358
M=D // 3359
@Memory.deAlloc.ret.5 // 3360
D=A // 3361
@CALL // 3362
0;JMP // 3363
(Memory.deAlloc.ret.5)
@SP // 3364
M=M-1 // 3365

////LabelInstruction{label='Memory.deAlloc$IF_END4}
// label Memory.deAlloc$IF_END4
(Memory.deAlloc$IF_END4)

////LabelInstruction{label='Memory.deAlloc$IF_END3}
// label Memory.deAlloc$IF_END3
(Memory.deAlloc$IF_END3)

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

@LCL // 3366
A=M // 3367
D=M // 3368
A=D // 3369
D=M // 3370
@SP // 3371
AM=M+1 // 3372
A=A-1 // 3373
M=D // 3374
// call Memory.getBinIndex
@6 // 3375
D=A // 3376
@14 // 3377
M=D // 3378
@Memory.getBinIndex // 3379
D=A // 3380
@13 // 3381
M=D // 3382
@Memory.deAlloc.ret.6 // 3383
D=A // 3384
@CALL // 3385
0;JMP // 3386
(Memory.deAlloc.ret.6)
@SP // 3387
AM=M-1 // 3388
D=M // 3389
@2048 // 3390
D=D+A // 3391
@SP // 3392
AM=M+1 // 3393
A=A-1 // 3394
M=D // 3395
@LCL // 3396
A=M // 3397
D=M // 3398
@SP // 3399
AM=M+1 // 3400
A=A-1 // 3401
M=D // 3402
// call Memory.add_node
@7 // 3403
D=A // 3404
@14 // 3405
M=D // 3406
@Memory.add_node // 3407
D=A // 3408
@13 // 3409
M=D // 3410
@Memory.deAlloc.ret.7 // 3411
D=A // 3412
@CALL // 3413
0;JMP // 3414
(Memory.deAlloc.ret.7)
@SP // 3415
M=M-1 // 3416

////PushInstruction("constant 0")
@SP // 3417
AM=M+1 // 3418
A=A-1 // 3419
M=0 // 3420
@RETURN // 3421
0;JMP // 3422

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3423
A=M // 3424
D=M // 3425
@3 // 3426
M=D // 3427

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
@THIS // 3428
A=M // 3429
D=M // 3430
@ARG // 3431
A=M+1 // 3432
A=D+M // 3433
D=M // 3434
@SP // 3435
AM=M+1 // 3436
A=A-1 // 3437
M=D // 3438
@RETURN // 3439
0;JMP // 3440

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3441
AM=M+1 // 3442
A=A-1 // 3443
M=0 // 3444

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3445
A=M // 3446
M=0 // 3447

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
@Memory.copy.LT.32 // 3448
D=A // 3449
@SP // 3450
AM=M+1 // 3451
A=A-1 // 3452
M=D // 3453
@LCL // 3454
A=M // 3455
D=M // 3456
@ARG // 3457
A=M+1 // 3458
A=A+1 // 3459
D=M-D // 3460
@DO_LT // 3461
0;JMP // 3462
(Memory.copy.LT.32)
D=!D // 3463
@Memory.copy_WHILE_END1 // 3464
D;JNE // 3465

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
@ARG // 3466
A=M+1 // 3467
D=M // 3468
@LCL // 3469
A=M // 3470
D=D+M // 3471
@SP // 3472
AM=M+1 // 3473
A=A-1 // 3474
M=D // 3475
@ARG // 3476
A=M // 3477
D=M // 3478
@LCL // 3479
A=M // 3480
A=D+M // 3481
D=M // 3482
@SP // 3483
AM=M-1 // 3484
A=M // 3485
M=D // 3486

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

@LCL // 3487
A=M // 3488
M=M+1 // 3489

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3490
0;JMP // 3491

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3492
AM=M+1 // 3493
A=A-1 // 3494
M=0 // 3495
@RETURN // 3496
0;JMP // 3497

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3498
D=A // 3499
@SP // 3500
AM=D+M // 3501
A=A-1 // 3502
M=0 // 3503
A=A-1 // 3504
M=0 // 3505
A=A-1 // 3506
M=0 // 3507

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3508
A=M // 3509
D=M // 3510
@SP // 3511
AM=M+1 // 3512
A=A-1 // 3513
M=D // 3514
// call Math.abs
@6 // 3515
D=A // 3516
@14 // 3517
M=D // 3518
@Math.abs // 3519
D=A // 3520
@13 // 3521
M=D // 3522
@Math.divide.ret.0 // 3523
D=A // 3524
@CALL // 3525
0;JMP // 3526
(Math.divide.ret.0)
@SP // 3527
AM=M-1 // 3528
D=M // 3529
@LCL // 3530
A=M+1 // 3531
M=D // 3532

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3533
A=M+1 // 3534
D=M // 3535
@SP // 3536
AM=M+1 // 3537
A=A-1 // 3538
M=D // 3539
// call Math.abs
@6 // 3540
D=A // 3541
@14 // 3542
M=D // 3543
@Math.abs // 3544
D=A // 3545
@13 // 3546
M=D // 3547
@Math.divide.ret.1 // 3548
D=A // 3549
@CALL // 3550
0;JMP // 3551
(Math.divide.ret.1)
@SP // 3552
AM=M-1 // 3553
D=M // 3554
@LCL // 3555
A=M+1 // 3556
A=A+1 // 3557
M=D // 3558

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.33 // 3559
D=A // 3560
@SP // 3561
AM=M+1 // 3562
A=A-1 // 3563
M=D // 3564
@LCL // 3565
A=M+1 // 3566
A=A+1 // 3567
D=M // 3568
A=A-1 // 3569
D=D-M // 3570
@DO_GT // 3571
0;JMP // 3572
(Math.divide.GT.33)
@Math.divide$IF_TRUE1 // 3573
D;JNE // 3574

////GotoInstruction{label='Math.divide$IF_END1}
// goto Math.divide$IF_END1
@Math.divide$IF_END1 // 3575
0;JMP // 3576

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3577
AM=M+1 // 3578
A=A-1 // 3579
M=0 // 3580
@RETURN // 3581
0;JMP // 3582

////LabelInstruction{label='Math.divide$IF_END1}
// label Math.divide$IF_END1
(Math.divide$IF_END1)

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

@LCL // 3583
A=M+1 // 3584
D=M // 3585
@SP // 3586
AM=M+1 // 3587
A=A-1 // 3588
M=D // 3589
@LCL // 3590
A=M+1 // 3591
A=A+1 // 3592
D=M // 3593
D=D+M // 3594
@SP // 3595
AM=M+1 // 3596
A=A-1 // 3597
M=D // 3598
// call Math.divide
@7 // 3599
D=A // 3600
@14 // 3601
M=D // 3602
@Math.divide // 3603
D=A // 3604
@13 // 3605
M=D // 3606
@Math.divide.ret.2 // 3607
D=A // 3608
@CALL // 3609
0;JMP // 3610
(Math.divide.ret.2)
@SP // 3611
AM=M-1 // 3612
D=M // 3613
@LCL // 3614
A=M // 3615
M=D // 3616

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
@Math.divide.LT.34 // 3617
D=A // 3618
@SP // 3619
AM=M+1 // 3620
A=A-1 // 3621
M=D // 3622
@LCL // 3623
A=M+1 // 3624
D=M // 3625
@SP // 3626
AM=M+1 // 3627
A=A-1 // 3628
M=D // 3629
@LCL // 3630
A=M // 3631
D=M // 3632
D=D+M // 3633
@SP // 3634
AM=M+1 // 3635
A=A-1 // 3636
M=D // 3637
@LCL // 3638
A=M+1 // 3639
A=A+1 // 3640
D=M // 3641
@SP // 3642
AM=M+1 // 3643
A=A-1 // 3644
M=D // 3645
// call Math.multiply
@7 // 3646
D=A // 3647
@14 // 3648
M=D // 3649
@Math.multiply // 3650
D=A // 3651
@13 // 3652
M=D // 3653
@Math.divide.ret.3 // 3654
D=A // 3655
@CALL // 3656
0;JMP // 3657
(Math.divide.ret.3)
@SP // 3658
AM=M-1 // 3659
D=M // 3660
@SP // 3661
AM=M-1 // 3662
D=M-D // 3663
@SP // 3664
AM=M+1 // 3665
A=A-1 // 3666
M=D // 3667
@LCL // 3668
A=M+1 // 3669
A=A+1 // 3670
D=M // 3671
@SP // 3672
AM=M-1 // 3673
D=M-D // 3674
@DO_LT // 3675
0;JMP // 3676
(Math.divide.LT.34)
@Math.divide$IF_TRUE2 // 3677
D;JNE // 3678

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3679
0;JMP // 3680

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
@Math.divide.LT.35 // 3681
D=A // 3682
@SP // 3683
AM=M+1 // 3684
A=A-1 // 3685
M=D // 3686
@ARG // 3687
A=M // 3688
D=M // 3689
@DO_LT // 3690
0;JMP // 3691
(Math.divide.LT.35)
@SP // 3692
AM=M+1 // 3693
A=A-1 // 3694
M=D // 3695
@Math.divide.GT.36 // 3696
D=A // 3697
@SP // 3698
AM=M+1 // 3699
A=A-1 // 3700
M=D // 3701
@ARG // 3702
A=M+1 // 3703
D=M // 3704
@DO_GT // 3705
0;JMP // 3706
(Math.divide.GT.36)
@SP // 3707
AM=M-1 // 3708
D=D&M // 3709
@SP // 3710
AM=M+1 // 3711
A=A-1 // 3712
M=D // 3713
@Math.divide.GT.37 // 3714
D=A // 3715
@SP // 3716
AM=M+1 // 3717
A=A-1 // 3718
M=D // 3719
@ARG // 3720
A=M // 3721
D=M // 3722
@DO_GT // 3723
0;JMP // 3724
(Math.divide.GT.37)
@SP // 3725
AM=M+1 // 3726
A=A-1 // 3727
M=D // 3728
@Math.divide.LT.38 // 3729
D=A // 3730
@SP // 3731
AM=M+1 // 3732
A=A-1 // 3733
M=D // 3734
@ARG // 3735
A=M+1 // 3736
D=M // 3737
@DO_LT // 3738
0;JMP // 3739
(Math.divide.LT.38)
@SP // 3740
AM=M-1 // 3741
D=D&M // 3742
@SP // 3743
AM=M-1 // 3744
D=D|M // 3745
@Math.divide$IF_TRUE3 // 3746
D;JNE // 3747

////GotoInstruction{label='Math.divide$IF_END3}
// goto Math.divide$IF_END3
@Math.divide$IF_END3 // 3748
0;JMP // 3749

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3750
A=M // 3751
D=-M // 3752
@LCL // 3753
A=M // 3754
M=D // 3755

////LabelInstruction{label='Math.divide$IF_END3}
// label Math.divide$IF_END3
(Math.divide$IF_END3)

////BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "ADD"
//)
@LCL // 3756
A=M // 3757
D=M // 3758
D=D+M // 3759
@SP // 3760
AM=M+1 // 3761
A=A-1 // 3762
M=D // 3763
@RETURN // 3764
0;JMP // 3765

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3766
0;JMP // 3767

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
@Math.divide.LT.39 // 3768
D=A // 3769
@SP // 3770
AM=M+1 // 3771
A=A-1 // 3772
M=D // 3773
@ARG // 3774
A=M // 3775
D=M // 3776
@DO_LT // 3777
0;JMP // 3778
(Math.divide.LT.39)
@SP // 3779
AM=M+1 // 3780
A=A-1 // 3781
M=D // 3782
@Math.divide.GT.40 // 3783
D=A // 3784
@SP // 3785
AM=M+1 // 3786
A=A-1 // 3787
M=D // 3788
@ARG // 3789
A=M+1 // 3790
D=M // 3791
@DO_GT // 3792
0;JMP // 3793
(Math.divide.GT.40)
@SP // 3794
AM=M-1 // 3795
D=D&M // 3796
@SP // 3797
AM=M+1 // 3798
A=A-1 // 3799
M=D // 3800
@Math.divide.GT.41 // 3801
D=A // 3802
@SP // 3803
AM=M+1 // 3804
A=A-1 // 3805
M=D // 3806
@ARG // 3807
A=M // 3808
D=M // 3809
@DO_GT // 3810
0;JMP // 3811
(Math.divide.GT.41)
@SP // 3812
AM=M+1 // 3813
A=A-1 // 3814
M=D // 3815
@Math.divide.LT.42 // 3816
D=A // 3817
@SP // 3818
AM=M+1 // 3819
A=A-1 // 3820
M=D // 3821
@ARG // 3822
A=M+1 // 3823
D=M // 3824
@DO_LT // 3825
0;JMP // 3826
(Math.divide.LT.42)
@SP // 3827
AM=M-1 // 3828
D=D&M // 3829
@SP // 3830
AM=M-1 // 3831
D=D|M // 3832
@Math.divide$IF_TRUE4 // 3833
D;JNE // 3834

////GotoInstruction{label='Math.divide$IF_END4}
// goto Math.divide$IF_END4
@Math.divide$IF_END4 // 3835
0;JMP // 3836

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3837
A=M // 3838
D=-M // 3839
@LCL // 3840
A=M // 3841
M=D // 3842

////LabelInstruction{label='Math.divide$IF_END4}
// label Math.divide$IF_END4
(Math.divide$IF_END4)

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
@LCL // 3843
A=M // 3844
D=M // 3845
D=D+M // 3846
D=D+1 // 3847
@SP // 3848
AM=M+1 // 3849
A=A-1 // 3850
M=D // 3851
@RETURN // 3852
0;JMP // 3853

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3854
D=A // 3855
@SP // 3856
AM=D+M // 3857
A=A-1 // 3858
M=0 // 3859
A=A-1 // 3860
M=0 // 3861
A=A-1 // 3862
M=0 // 3863
A=A-1 // 3864
M=0 // 3865
A=A-1 // 3866
M=0 // 3867
A=A-1 // 3868
M=0 // 3869

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

@ARG // 3870
A=M+1 // 3871
A=A+1 // 3872
D=M // 3873
A=A-1 // 3874
A=A-1 // 3875
D=D-M // 3876
@SP // 3877
AM=M+1 // 3878
A=A-1 // 3879
M=D // 3880
// call Math.abs
@6 // 3881
D=A // 3882
@14 // 3883
M=D // 3884
@Math.abs // 3885
D=A // 3886
@13 // 3887
M=D // 3888
@Screen.drawLine.ret.0 // 3889
D=A // 3890
@CALL // 3891
0;JMP // 3892
(Screen.drawLine.ret.0)
@SP // 3893
AM=M-1 // 3894
D=M // 3895
@LCL // 3896
A=M // 3897
M=D // 3898

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

@ARG // 3899
A=M+1 // 3900
A=A+1 // 3901
A=A+1 // 3902
D=M // 3903
A=A-1 // 3904
A=A-1 // 3905
D=D-M // 3906
@SP // 3907
AM=M+1 // 3908
A=A-1 // 3909
M=D // 3910
// call Math.abs
@6 // 3911
D=A // 3912
@14 // 3913
M=D // 3914
@Math.abs // 3915
D=A // 3916
@13 // 3917
M=D // 3918
@Screen.drawLine.ret.1 // 3919
D=A // 3920
@CALL // 3921
0;JMP // 3922
(Screen.drawLine.ret.1)
@SP // 3923
AM=M-1 // 3924
D=M // 3925
@LCL // 3926
A=M+1 // 3927
M=D // 3928

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.43 // 3929
D=A // 3930
@SP // 3931
AM=M+1 // 3932
A=A-1 // 3933
M=D // 3934
@ARG // 3935
A=M+1 // 3936
A=A+1 // 3937
D=M // 3938
A=A-1 // 3939
A=A-1 // 3940
D=M-D // 3941
@DO_LT // 3942
0;JMP // 3943
(Screen.drawLine.LT.43)
@Screen.drawLine$IF_TRUE1 // 3944
D;JNE // 3945

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 3946
0;JMP // 3947

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3948
A=M+1 // 3949
A=A+1 // 3950
M=1 // 3951

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 3952
0;JMP // 3953

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3954
A=M+1 // 3955
A=A+1 // 3956
M=-1 // 3957

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
@Screen.drawLine.LT.44 // 3958
D=A // 3959
@SP // 3960
AM=M+1 // 3961
A=A-1 // 3962
M=D // 3963
@ARG // 3964
A=M+1 // 3965
A=A+1 // 3966
A=A+1 // 3967
D=M // 3968
A=A-1 // 3969
A=A-1 // 3970
D=M-D // 3971
@DO_LT // 3972
0;JMP // 3973
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE2 // 3974
D;JNE // 3975

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 3976
0;JMP // 3977

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 3978
A=M+1 // 3979
A=A+1 // 3980
A=A+1 // 3981
M=1 // 3982

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 3983
0;JMP // 3984

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("constant 1"),
//NEG)
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 3985
A=M+1 // 3986
A=A+1 // 3987
A=A+1 // 3988
M=-1 // 3989

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

@LCL // 3990
A=M+1 // 3991
D=M // 3992
A=A-1 // 3993
D=M-D // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
@LCL // 3999
D=M // 4000
@4 // 4001
A=D+A // 4002
D=A // 4003
@R13 // 4004
M=D // 4005
@SP // 4006
AM=M-1 // 4007
D=M // 4008
@R13 // 4009
A=M // 4010
M=D // 4011

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 4012
@Screen.drawLine_WHILE_END1 // 4013
D;JNE // 4014

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4015
A=M // 4016
D=M // 4017
@SP // 4018
AM=M+1 // 4019
A=A-1 // 4020
M=D // 4021
@ARG // 4022
A=M+1 // 4023
D=M // 4024
@SP // 4025
AM=M+1 // 4026
A=A-1 // 4027
M=D // 4028
// call Screen.drawPixel
@7 // 4029
D=A // 4030
@14 // 4031
M=D // 4032
@Screen.drawPixel // 4033
D=A // 4034
@13 // 4035
M=D // 4036
@Screen.drawLine.ret.2 // 4037
D=A // 4038
@CALL // 4039
0;JMP // 4040
(Screen.drawLine.ret.2)
@SP // 4041
M=M-1 // 4042

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
@Screen.drawLine.EQ.45 // 4043
D=A // 4044
@SP // 4045
AM=M+1 // 4046
A=A-1 // 4047
M=D // 4048
@ARG // 4049
A=M+1 // 4050
A=A+1 // 4051
D=M // 4052
A=A-1 // 4053
A=A-1 // 4054
D=M-D // 4055
@DO_EQ // 4056
0;JMP // 4057
(Screen.drawLine.EQ.45)
@SP // 4058
AM=M+1 // 4059
A=A-1 // 4060
M=D // 4061
@Screen.drawLine.EQ.46 // 4062
D=A // 4063
@SP // 4064
AM=M+1 // 4065
A=A-1 // 4066
M=D // 4067
@ARG // 4068
A=M+1 // 4069
A=A+1 // 4070
A=A+1 // 4071
D=M // 4072
A=A-1 // 4073
A=A-1 // 4074
D=M-D // 4075
@DO_EQ // 4076
0;JMP // 4077
(Screen.drawLine.EQ.46)
@SP // 4078
AM=M-1 // 4079
D=D&M // 4080
@Screen.drawLine$IF_TRUE3 // 4081
D;JNE // 4082

////GotoInstruction{label='Screen.drawLine$IF_END3}
// goto Screen.drawLine$IF_END3
@Screen.drawLine$IF_END3 // 4083
0;JMP // 4084

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4085
AM=M+1 // 4086
A=A-1 // 4087
M=0 // 4088
@RETURN // 4089
0;JMP // 4090

////LabelInstruction{label='Screen.drawLine$IF_END3}
// label Screen.drawLine$IF_END3
(Screen.drawLine$IF_END3)

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

@LCL // 4091
D=M // 4092
@4 // 4093
A=D+A // 4094
D=M // 4095
D=D+M // 4096
@SP // 4097
AM=M+1 // 4098
A=A-1 // 4099
M=D // 4100
@LCL // 4101
D=M // 4102
@5 // 4103
A=D+A // 4104
D=A // 4105
@R13 // 4106
M=D // 4107
@SP // 4108
AM=M-1 // 4109
D=M // 4110
@R13 // 4111
A=M // 4112
M=D // 4113

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
@Screen.drawLine.GT.47 // 4114
D=A // 4115
@SP // 4116
AM=M+1 // 4117
A=A-1 // 4118
M=D // 4119
@LCL // 4120
D=M // 4121
@5 // 4122
A=D+A // 4123
D=M // 4124
@SP // 4125
AM=M+1 // 4126
A=A-1 // 4127
M=D // 4128
@LCL // 4129
A=M+1 // 4130
D=M // 4131
@SP // 4132
AM=M-1 // 4133
D=D+M // 4134
@DO_GT // 4135
0;JMP // 4136
(Screen.drawLine.GT.47)
@Screen.drawLine$IF_TRUE4 // 4137
D;JNE // 4138

////GotoInstruction{label='Screen.drawLine$IF_END4}
// goto Screen.drawLine$IF_END4
@Screen.drawLine$IF_END4 // 4139
0;JMP // 4140

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

@LCL // 4141
D=M // 4142
@4 // 4143
A=D+A // 4144
D=M // 4145
A=A-1 // 4146
A=A-1 // 4147
A=A-1 // 4148
D=D-M // 4149
@SP // 4150
AM=M+1 // 4151
A=A-1 // 4152
M=D // 4153
@LCL // 4154
D=M // 4155
@4 // 4156
A=D+A // 4157
D=A // 4158
@R13 // 4159
M=D // 4160
@SP // 4161
AM=M-1 // 4162
D=M // 4163
@R13 // 4164
A=M // 4165
M=D // 4166

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

@LCL // 4167
A=M+1 // 4168
A=A+1 // 4169
D=M // 4170
@ARG // 4171
A=M // 4172
M=D+M // 4173

////LabelInstruction{label='Screen.drawLine$IF_END4}
// label Screen.drawLine$IF_END4
(Screen.drawLine$IF_END4)

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 5"),
//    right:
//        PushInstruction("local 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE5}}
@Screen.drawLine.LT.48 // 4174
D=A // 4175
@SP // 4176
AM=M+1 // 4177
A=A-1 // 4178
M=D // 4179
@LCL // 4180
D=M // 4181
@5 // 4182
A=D+A // 4183
D=M // 4184
@SP // 4185
AM=M+1 // 4186
A=A-1 // 4187
M=D // 4188
@LCL // 4189
A=M // 4190
D=M // 4191
@SP // 4192
AM=M-1 // 4193
D=M-D // 4194
@DO_LT // 4195
0;JMP // 4196
(Screen.drawLine.LT.48)
@Screen.drawLine$IF_TRUE5 // 4197
D;JNE // 4198

////GotoInstruction{label='Screen.drawLine$IF_END5}
// goto Screen.drawLine$IF_END5
@Screen.drawLine$IF_END5 // 4199
0;JMP // 4200

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

@LCL // 4201
D=M // 4202
@4 // 4203
A=D+A // 4204
D=M // 4205
@SP // 4206
AM=M+1 // 4207
A=A-1 // 4208
M=D // 4209
@LCL // 4210
A=M // 4211
D=M // 4212
@SP // 4213
AM=M-1 // 4214
D=D+M // 4215
@SP // 4216
AM=M+1 // 4217
A=A-1 // 4218
M=D // 4219
@LCL // 4220
D=M // 4221
@4 // 4222
A=D+A // 4223
D=A // 4224
@R13 // 4225
M=D // 4226
@SP // 4227
AM=M-1 // 4228
D=M // 4229
@R13 // 4230
A=M // 4231
M=D // 4232

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

@LCL // 4233
A=M+1 // 4234
A=A+1 // 4235
A=A+1 // 4236
D=M // 4237
@ARG // 4238
A=M+1 // 4239
M=D+M // 4240

////LabelInstruction{label='Screen.drawLine$IF_END5}
// label Screen.drawLine$IF_END5
(Screen.drawLine$IF_END5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4241
0;JMP // 4242

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4243
AM=M+1 // 4244
A=A-1 // 4245
M=0 // 4246
@RETURN // 4247
0;JMP // 4248

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
@Math.max.GT.49 // 4249
D=A // 4250
@SP // 4251
AM=M+1 // 4252
A=A-1 // 4253
M=D // 4254
@ARG // 4255
A=M+1 // 4256
D=M // 4257
A=A-1 // 4258
D=M-D // 4259
@DO_GT // 4260
0;JMP // 4261
(Math.max.GT.49)
@Math.max$IF_TRUE1 // 4262
D;JNE // 4263

////GotoInstruction{label='Math.max$IF_END1}
// goto Math.max$IF_END1
@Math.max$IF_END1 // 4264
0;JMP // 4265

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4266
A=M // 4267
D=M // 4268
@SP // 4269
AM=M+1 // 4270
A=A-1 // 4271
M=D // 4272
@RETURN // 4273
0;JMP // 4274

////LabelInstruction{label='Math.max$IF_END1}
// label Math.max$IF_END1
(Math.max$IF_END1)

////PushInstruction("argument 1")
@ARG // 4275
A=M+1 // 4276
D=M // 4277
@SP // 4278
AM=M+1 // 4279
A=A-1 // 4280
M=D // 4281
@RETURN // 4282
0;JMP // 4283

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4284
AM=M+1 // 4285
A=A-1 // 4286
M=0 // 4287

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4288
AM=M+1 // 4289
A=A-1 // 4290
M=0 // 4291
@220 // 4292
D=A // 4293
@SP // 4294
AM=M+1 // 4295
A=A-1 // 4296
M=D // 4297
@511 // 4298
D=A // 4299
@SP // 4300
AM=M+1 // 4301
A=A-1 // 4302
M=D // 4303
@220 // 4304
D=A // 4305
@SP // 4306
AM=M+1 // 4307
A=A-1 // 4308
M=D // 4309
// call Screen.drawLine
@9 // 4310
D=A // 4311
@14 // 4312
M=D // 4313
@Screen.drawLine // 4314
D=A // 4315
@13 // 4316
M=D // 4317
@Main.main.ret.0 // 4318
D=A // 4319
@CALL // 4320
0;JMP // 4321
(Main.main.ret.0)
@SP // 4322
M=M-1 // 4323

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4324
D=A // 4325
@SP // 4326
AM=M+1 // 4327
A=A-1 // 4328
M=D // 4329
@90 // 4330
D=A // 4331
@SP // 4332
AM=M+1 // 4333
A=A-1 // 4334
M=D // 4335
@410 // 4336
D=A // 4337
@SP // 4338
AM=M+1 // 4339
A=A-1 // 4340
M=D // 4341
@220 // 4342
D=A // 4343
@SP // 4344
AM=M+1 // 4345
A=A-1 // 4346
M=D // 4347
// call Screen.drawRectangle
@9 // 4348
D=A // 4349
@14 // 4350
M=D // 4351
@Screen.drawRectangle // 4352
D=A // 4353
@13 // 4354
M=D // 4355
@Main.main.ret.1 // 4356
D=A // 4357
@CALL // 4358
0;JMP // 4359
(Main.main.ret.1)
@SP // 4360
M=M-1 // 4361

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4362
AM=M+1 // 4363
A=A-1 // 4364
M=0 // 4365
// call Screen.setColor
@6 // 4366
D=A // 4367
@14 // 4368
M=D // 4369
@Screen.setColor // 4370
D=A // 4371
@13 // 4372
M=D // 4373
@Main.main.ret.2 // 4374
D=A // 4375
@CALL // 4376
0;JMP // 4377
(Main.main.ret.2)
@SP // 4378
M=M-1 // 4379

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4380
D=A // 4381
@SP // 4382
AM=M+1 // 4383
A=A-1 // 4384
M=D // 4385
@120 // 4386
D=A // 4387
@SP // 4388
AM=M+1 // 4389
A=A-1 // 4390
M=D // 4391
@390 // 4392
D=A // 4393
@SP // 4394
AM=M+1 // 4395
A=A-1 // 4396
M=D // 4397
@219 // 4398
D=A // 4399
@SP // 4400
AM=M+1 // 4401
A=A-1 // 4402
M=D // 4403
// call Screen.drawRectangle
@9 // 4404
D=A // 4405
@14 // 4406
M=D // 4407
@Screen.drawRectangle // 4408
D=A // 4409
@13 // 4410
M=D // 4411
@Main.main.ret.3 // 4412
D=A // 4413
@CALL // 4414
0;JMP // 4415
(Main.main.ret.3)
@SP // 4416
M=M-1 // 4417

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4418
D=A // 4419
@SP // 4420
AM=M+1 // 4421
A=A-1 // 4422
M=D // 4423
@120 // 4424
D=A // 4425
@SP // 4426
AM=M+1 // 4427
A=A-1 // 4428
M=D // 4429
@332 // 4430
D=A // 4431
@SP // 4432
AM=M+1 // 4433
A=A-1 // 4434
M=D // 4435
@150 // 4436
D=A // 4437
@SP // 4438
AM=M+1 // 4439
A=A-1 // 4440
M=D // 4441
// call Screen.drawRectangle
@9 // 4442
D=A // 4443
@14 // 4444
M=D // 4445
@Screen.drawRectangle // 4446
D=A // 4447
@13 // 4448
M=D // 4449
@Main.main.ret.4 // 4450
D=A // 4451
@CALL // 4452
0;JMP // 4453
(Main.main.ret.4)
@SP // 4454
M=M-1 // 4455

////PushPopPair {
//  push: CallGroup{pushes=[UnaryPushGroup(    PushInstruction("constant 0"),
//NOT)], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4456
AM=M+1 // 4457
A=A-1 // 4458
M=-1 // 4459
// call Screen.setColor
@6 // 4460
D=A // 4461
@14 // 4462
M=D // 4463
@Screen.setColor // 4464
D=A // 4465
@13 // 4466
M=D // 4467
@Main.main.ret.5 // 4468
D=A // 4469
@CALL // 4470
0;JMP // 4471
(Main.main.ret.5)
@SP // 4472
M=M-1 // 4473

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4474
D=A // 4475
@SP // 4476
AM=M+1 // 4477
A=A-1 // 4478
M=D // 4479
@170 // 4480
D=A // 4481
@SP // 4482
AM=M+1 // 4483
A=A-1 // 4484
M=D // 4485
@3 // 4486
D=A // 4487
@SP // 4488
AM=M+1 // 4489
A=A-1 // 4490
M=D // 4491
// call Screen.drawCircle
@8 // 4492
D=A // 4493
@14 // 4494
M=D // 4495
@Screen.drawCircle // 4496
D=A // 4497
@13 // 4498
M=D // 4499
@Main.main.ret.6 // 4500
D=A // 4501
@CALL // 4502
0;JMP // 4503
(Main.main.ret.6)
@SP // 4504
M=M-1 // 4505

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4506
D=A // 4507
@SP // 4508
AM=M+1 // 4509
A=A-1 // 4510
M=D // 4511
@90 // 4512
D=A // 4513
@SP // 4514
AM=M+1 // 4515
A=A-1 // 4516
M=D // 4517
@345 // 4518
D=A // 4519
@SP // 4520
AM=M+1 // 4521
A=A-1 // 4522
M=D // 4523
@35 // 4524
D=A // 4525
@SP // 4526
AM=M+1 // 4527
A=A-1 // 4528
M=D // 4529
// call Screen.drawLine
@9 // 4530
D=A // 4531
@14 // 4532
M=D // 4533
@Screen.drawLine // 4534
D=A // 4535
@13 // 4536
M=D // 4537
@Main.main.ret.7 // 4538
D=A // 4539
@CALL // 4540
0;JMP // 4541
(Main.main.ret.7)
@SP // 4542
M=M-1 // 4543

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4544
D=A // 4545
@SP // 4546
AM=M+1 // 4547
A=A-1 // 4548
M=D // 4549
@35 // 4550
D=A // 4551
@SP // 4552
AM=M+1 // 4553
A=A-1 // 4554
M=D // 4555
@410 // 4556
D=A // 4557
@SP // 4558
AM=M+1 // 4559
A=A-1 // 4560
M=D // 4561
@90 // 4562
D=A // 4563
@SP // 4564
AM=M+1 // 4565
A=A-1 // 4566
M=D // 4567
// call Screen.drawLine
@9 // 4568
D=A // 4569
@14 // 4570
M=D // 4571
@Screen.drawLine // 4572
D=A // 4573
@13 // 4574
M=D // 4575
@Main.main.ret.8 // 4576
D=A // 4577
@CALL // 4578
0;JMP // 4579
(Main.main.ret.8)
@SP // 4580
M=M-1 // 4581

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4582
D=A // 4583
@SP // 4584
AM=M+1 // 4585
A=A-1 // 4586
M=D // 4587
@60 // 4588
D=A // 4589
@SP // 4590
AM=M+1 // 4591
A=A-1 // 4592
M=D // 4593
@30 // 4594
D=A // 4595
@SP // 4596
AM=M+1 // 4597
A=A-1 // 4598
M=D // 4599
// call Screen.drawCircle
@8 // 4600
D=A // 4601
@14 // 4602
M=D // 4603
@Screen.drawCircle // 4604
D=A // 4605
@13 // 4606
M=D // 4607
@Main.main.ret.9 // 4608
D=A // 4609
@CALL // 4610
0;JMP // 4611
(Main.main.ret.9)
@SP // 4612
M=M-1 // 4613

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4614
D=A // 4615
@SP // 4616
AM=M+1 // 4617
A=A-1 // 4618
M=D // 4619
@26 // 4620
D=A // 4621
@SP // 4622
AM=M+1 // 4623
A=A-1 // 4624
M=D // 4625
@140 // 4626
D=A // 4627
@SP // 4628
AM=M+1 // 4629
A=A-1 // 4630
M=D // 4631
@6 // 4632
D=A // 4633
@SP // 4634
AM=M+1 // 4635
A=A-1 // 4636
M=D // 4637
// call Screen.drawLine
@9 // 4638
D=A // 4639
@14 // 4640
M=D // 4641
@Screen.drawLine // 4642
D=A // 4643
@13 // 4644
M=D // 4645
@Main.main.ret.10 // 4646
D=A // 4647
@CALL // 4648
0;JMP // 4649
(Main.main.ret.10)
@SP // 4650
M=M-1 // 4651

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4652
D=A // 4653
@SP // 4654
AM=M+1 // 4655
A=A-1 // 4656
M=D // 4657
@35 // 4658
D=A // 4659
@SP // 4660
AM=M+1 // 4661
A=A-1 // 4662
M=D // 4663
@178 // 4664
D=A // 4665
@SP // 4666
AM=M+1 // 4667
A=A-1 // 4668
M=D // 4669
@20 // 4670
D=A // 4671
@SP // 4672
AM=M+1 // 4673
A=A-1 // 4674
M=D // 4675
// call Screen.drawLine
@9 // 4676
D=A // 4677
@14 // 4678
M=D // 4679
@Screen.drawLine // 4680
D=A // 4681
@13 // 4682
M=D // 4683
@Main.main.ret.11 // 4684
D=A // 4685
@CALL // 4686
0;JMP // 4687
(Main.main.ret.11)
@SP // 4688
M=M-1 // 4689

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4690
D=A // 4691
@SP // 4692
AM=M+1 // 4693
A=A-1 // 4694
M=D // 4695
@60 // 4696
D=A // 4697
@SP // 4698
AM=M+1 // 4699
A=A-1 // 4700
M=D // 4701
@194 // 4702
D=A // 4703
@SP // 4704
AM=M+1 // 4705
A=A-1 // 4706
M=D // 4707
@60 // 4708
D=A // 4709
@SP // 4710
AM=M+1 // 4711
A=A-1 // 4712
M=D // 4713
// call Screen.drawLine
@9 // 4714
D=A // 4715
@14 // 4716
M=D // 4717
@Screen.drawLine // 4718
D=A // 4719
@13 // 4720
M=D // 4721
@Main.main.ret.12 // 4722
D=A // 4723
@CALL // 4724
0;JMP // 4725
(Main.main.ret.12)
@SP // 4726
M=M-1 // 4727

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4728
D=A // 4729
@SP // 4730
AM=M+1 // 4731
A=A-1 // 4732
M=D // 4733
@85 // 4734
D=A // 4735
@SP // 4736
AM=M+1 // 4737
A=A-1 // 4738
M=D // 4739
@178 // 4740
D=A // 4741
@SP // 4742
AM=M+1 // 4743
A=A-1 // 4744
M=D // 4745
@100 // 4746
D=A // 4747
@SP // 4748
AM=M+1 // 4749
A=A-1 // 4750
M=D // 4751
// call Screen.drawLine
@9 // 4752
D=A // 4753
@14 // 4754
M=D // 4755
@Screen.drawLine // 4756
D=A // 4757
@13 // 4758
M=D // 4759
@Main.main.ret.13 // 4760
D=A // 4761
@CALL // 4762
0;JMP // 4763
(Main.main.ret.13)
@SP // 4764
M=M-1 // 4765

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4766
D=A // 4767
@SP // 4768
AM=M+1 // 4769
A=A-1 // 4770
M=D // 4771
@94 // 4772
D=A // 4773
@SP // 4774
AM=M+1 // 4775
A=A-1 // 4776
M=D // 4777
@140 // 4778
D=A // 4779
@SP // 4780
AM=M+1 // 4781
A=A-1 // 4782
M=D // 4783
@114 // 4784
D=A // 4785
@SP // 4786
AM=M+1 // 4787
A=A-1 // 4788
M=D // 4789
// call Screen.drawLine
@9 // 4790
D=A // 4791
@14 // 4792
M=D // 4793
@Screen.drawLine // 4794
D=A // 4795
@13 // 4796
M=D // 4797
@Main.main.ret.14 // 4798
D=A // 4799
@CALL // 4800
0;JMP // 4801
(Main.main.ret.14)
@SP // 4802
M=M-1 // 4803

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4804
D=A // 4805
@SP // 4806
AM=M+1 // 4807
A=A-1 // 4808
M=D // 4809
@85 // 4810
D=A // 4811
@SP // 4812
AM=M+1 // 4813
A=A-1 // 4814
M=D // 4815
@102 // 4816
D=A // 4817
@SP // 4818
AM=M+1 // 4819
A=A-1 // 4820
M=D // 4821
@100 // 4822
D=A // 4823
@SP // 4824
AM=M+1 // 4825
A=A-1 // 4826
M=D // 4827
// call Screen.drawLine
@9 // 4828
D=A // 4829
@14 // 4830
M=D // 4831
@Screen.drawLine // 4832
D=A // 4833
@13 // 4834
M=D // 4835
@Main.main.ret.15 // 4836
D=A // 4837
@CALL // 4838
0;JMP // 4839
(Main.main.ret.15)
@SP // 4840
M=M-1 // 4841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4842
D=A // 4843
@SP // 4844
AM=M+1 // 4845
A=A-1 // 4846
M=D // 4847
@60 // 4848
D=A // 4849
@SP // 4850
AM=M+1 // 4851
A=A-1 // 4852
M=D // 4853
@86 // 4854
D=A // 4855
@SP // 4856
AM=M+1 // 4857
A=A-1 // 4858
M=D // 4859
@60 // 4860
D=A // 4861
@SP // 4862
AM=M+1 // 4863
A=A-1 // 4864
M=D // 4865
// call Screen.drawLine
@9 // 4866
D=A // 4867
@14 // 4868
M=D // 4869
@Screen.drawLine // 4870
D=A // 4871
@13 // 4872
M=D // 4873
@Main.main.ret.16 // 4874
D=A // 4875
@CALL // 4876
0;JMP // 4877
(Main.main.ret.16)
@SP // 4878
M=M-1 // 4879

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4880
D=A // 4881
@SP // 4882
AM=M+1 // 4883
A=A-1 // 4884
M=D // 4885
@35 // 4886
D=A // 4887
@SP // 4888
AM=M+1 // 4889
A=A-1 // 4890
M=D // 4891
@102 // 4892
D=A // 4893
@SP // 4894
AM=M+1 // 4895
A=A-1 // 4896
M=D // 4897
@20 // 4898
D=A // 4899
@SP // 4900
AM=M+1 // 4901
A=A-1 // 4902
M=D // 4903
// call Screen.drawLine
@9 // 4904
D=A // 4905
@14 // 4906
M=D // 4907
@Screen.drawLine // 4908
D=A // 4909
@13 // 4910
M=D // 4911
@Main.main.ret.17 // 4912
D=A // 4913
@CALL // 4914
0;JMP // 4915
(Main.main.ret.17)
@SP // 4916
M=M-1 // 4917

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 4918
D=A // 4919
@SP // 4920
AM=M+1 // 4921
A=A-1 // 4922
M=D // 4923
// call String.new
@6 // 4924
D=A // 4925
@14 // 4926
M=D // 4927
@String.new // 4928
D=A // 4929
@13 // 4930
M=D // 4931
@Main.main.ret.18 // 4932
D=A // 4933
@CALL // 4934
0;JMP // 4935
(Main.main.ret.18)
@72 // 4936
D=A // 4937
@SP // 4938
AM=M+1 // 4939
A=A-1 // 4940
M=D // 4941
// call String.appendChar
@7 // 4942
D=A // 4943
@14 // 4944
M=D // 4945
@String.appendChar // 4946
D=A // 4947
@13 // 4948
M=D // 4949
@Main.main.ret.19 // 4950
D=A // 4951
@CALL // 4952
0;JMP // 4953
(Main.main.ret.19)
@101 // 4954
D=A // 4955
@SP // 4956
AM=M+1 // 4957
A=A-1 // 4958
M=D // 4959
// call String.appendChar
@7 // 4960
D=A // 4961
@14 // 4962
M=D // 4963
@String.appendChar // 4964
D=A // 4965
@13 // 4966
M=D // 4967
@Main.main.ret.20 // 4968
D=A // 4969
@CALL // 4970
0;JMP // 4971
(Main.main.ret.20)
@108 // 4972
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
@Main.main.ret.21 // 4986
D=A // 4987
@CALL // 4988
0;JMP // 4989
(Main.main.ret.21)
@108 // 4990
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
@Main.main.ret.22 // 5004
D=A // 5005
@CALL // 5006
0;JMP // 5007
(Main.main.ret.22)
@111 // 5008
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
@Main.main.ret.23 // 5022
D=A // 5023
@CALL // 5024
0;JMP // 5025
(Main.main.ret.23)
@44 // 5026
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
@Main.main.ret.24 // 5040
D=A // 5041
@CALL // 5042
0;JMP // 5043
(Main.main.ret.24)
@32 // 5044
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
@Main.main.ret.25 // 5058
D=A // 5059
@CALL // 5060
0;JMP // 5061
(Main.main.ret.25)
@119 // 5062
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
@Main.main.ret.26 // 5076
D=A // 5077
@CALL // 5078
0;JMP // 5079
(Main.main.ret.26)
@111 // 5080
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
@Main.main.ret.27 // 5094
D=A // 5095
@CALL // 5096
0;JMP // 5097
(Main.main.ret.27)
@114 // 5098
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
@Main.main.ret.28 // 5112
D=A // 5113
@CALL // 5114
0;JMP // 5115
(Main.main.ret.28)
@108 // 5116
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
@Main.main.ret.29 // 5130
D=A // 5131
@CALL // 5132
0;JMP // 5133
(Main.main.ret.29)
@100 // 5134
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
@Main.main.ret.30 // 5148
D=A // 5149
@CALL // 5150
0;JMP // 5151
(Main.main.ret.30)
@33 // 5152
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
@Main.main.ret.31 // 5166
D=A // 5167
@CALL // 5168
0;JMP // 5169
(Main.main.ret.31)
@SP // 5170
AM=M-1 // 5171
D=M // 5172
@LCL // 5173
A=M // 5174
M=D // 5175

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5176
A=M // 5177
D=M // 5178
@SP // 5179
AM=M+1 // 5180
A=A-1 // 5181
M=D // 5182
// call Output.printString
@6 // 5183
D=A // 5184
@14 // 5185
M=D // 5186
@Output.printString // 5187
D=A // 5188
@13 // 5189
M=D // 5190
@Main.main.ret.32 // 5191
D=A // 5192
@CALL // 5193
0;JMP // 5194
(Main.main.ret.32)
@SP // 5195
M=M-1 // 5196

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5197
D=A // 5198
@14 // 5199
M=D // 5200
@Output.println // 5201
D=A // 5202
@13 // 5203
M=D // 5204
@Main.main.ret.33 // 5205
D=A // 5206
@CALL // 5207
0;JMP // 5208
(Main.main.ret.33)
@SP // 5209
M=M-1 // 5210

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5211
A=M // 5212
D=M // 5213
@SP // 5214
AM=M+1 // 5215
A=A-1 // 5216
M=D // 5217
// call String.dispose
@6 // 5218
D=A // 5219
@14 // 5220
M=D // 5221
@String.dispose // 5222
D=A // 5223
@13 // 5224
M=D // 5225
@Main.main.ret.34 // 5226
D=A // 5227
@CALL // 5228
0;JMP // 5229
(Main.main.ret.34)
@SP // 5230
M=M-1 // 5231

////PushInstruction("constant 0")
@SP // 5232
AM=M+1 // 5233
A=A-1 // 5234
M=0 // 5235
@RETURN // 5236
0;JMP // 5237

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5238
@Sys.halt_WHILE_END1 // 5239
D;JNE // 5240

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5241
0;JMP // 5242

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5243
AM=M+1 // 5244
A=A-1 // 5245
M=0 // 5246
@RETURN // 5247
0;JMP // 5248

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5249
D=A // 5250
@SP // 5251
AM=D+M // 5252
A=A-1 // 5253
M=0 // 5254
A=A-1 // 5255
M=0 // 5256
A=A-1 // 5257
M=0 // 5258
A=A-1 // 5259
M=0 // 5260

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5261
A=M // 5262
D=M // 5263
@SP // 5264
AM=M+1 // 5265
A=A-1 // 5266
M=D // 5267
// call Output.getMap
@6 // 5268
D=A // 5269
@14 // 5270
M=D // 5271
@Output.getMap // 5272
D=A // 5273
@13 // 5274
M=D // 5275
@Output.printChar.ret.0 // 5276
D=A // 5277
@CALL // 5278
0;JMP // 5279
(Output.printChar.ret.0)
@SP // 5280
AM=M-1 // 5281
D=M // 5282
@LCL // 5283
A=M // 5284
M=D // 5285

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5286
A=M+1 // 5287
A=A+1 // 5288
A=A+1 // 5289
M=0 // 5290

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
@Output.printChar.LT.50 // 5291
D=A // 5292
@SP // 5293
AM=M+1 // 5294
A=A-1 // 5295
M=D // 5296
@LCL // 5297
A=M+1 // 5298
A=A+1 // 5299
A=A+1 // 5300
D=M // 5301
@11 // 5302
D=D-A // 5303
@DO_LT // 5304
0;JMP // 5305
(Output.printChar.LT.50)
D=!D // 5306
@Output.printChar_WHILE_END1 // 5307
D;JNE // 5308

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

@Output.2 // 5309
D=M // 5310
@SP // 5311
AM=M+1 // 5312
A=A-1 // 5313
M=D // 5314
@11 // 5315
D=A // 5316
@SP // 5317
AM=M+1 // 5318
A=A-1 // 5319
M=D // 5320
// call Math.multiply
@7 // 5321
D=A // 5322
@14 // 5323
M=D // 5324
@Math.multiply // 5325
D=A // 5326
@13 // 5327
M=D // 5328
@Output.printChar.ret.1 // 5329
D=A // 5330
@CALL // 5331
0;JMP // 5332
(Output.printChar.ret.1)
@LCL // 5333
A=M+1 // 5334
A=A+1 // 5335
A=A+1 // 5336
D=M // 5337
@SP // 5338
AM=M-1 // 5339
D=D+M // 5340
@SP // 5341
AM=M+1 // 5342
A=A-1 // 5343
M=D // 5344
@32 // 5345
D=A // 5346
@SP // 5347
AM=M+1 // 5348
A=A-1 // 5349
M=D // 5350
// call Math.multiply
@7 // 5351
D=A // 5352
@14 // 5353
M=D // 5354
@Math.multiply // 5355
D=A // 5356
@13 // 5357
M=D // 5358
@Output.printChar.ret.2 // 5359
D=A // 5360
@CALL // 5361
0;JMP // 5362
(Output.printChar.ret.2)
@SP // 5363
AM=M-1 // 5364
D=M // 5365
@16384 // 5366
D=D+A // 5367
@SP // 5368
AM=M+1 // 5369
A=A-1 // 5370
M=D // 5371
@Output.1 // 5372
D=M // 5373
@SP // 5374
AM=M+1 // 5375
A=A-1 // 5376
M=D // 5377
@2 // 5378
D=A // 5379
@SP // 5380
AM=M+1 // 5381
A=A-1 // 5382
M=D // 5383
// call Math.divide
@7 // 5384
D=A // 5385
@14 // 5386
M=D // 5387
@Math.divide // 5388
D=A // 5389
@13 // 5390
M=D // 5391
@Output.printChar.ret.3 // 5392
D=A // 5393
@CALL // 5394
0;JMP // 5395
(Output.printChar.ret.3)
@SP // 5396
AM=M-1 // 5397
D=M // 5398
@SP // 5399
AM=M-1 // 5400
D=D+M // 5401
@LCL // 5402
A=M+1 // 5403
M=D // 5404

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
@Output.printChar.EQ.51 // 5405
D=A // 5406
@SP // 5407
AM=M+1 // 5408
A=A-1 // 5409
M=D // 5410
@Output.1 // 5411
D=M // 5412
@1 // 5413
D=D&A // 5414
@DO_EQ // 5415
0;JMP // 5416
(Output.printChar.EQ.51)
@Output.printChar$IF_TRUE1 // 5417
D;JNE // 5418

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5419
0;JMP // 5420

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

@LCL // 5421
A=M+1 // 5422
A=A+1 // 5423
A=A+1 // 5424
D=M // 5425
A=A-1 // 5426
A=A-1 // 5427
A=A-1 // 5428
A=D+M // 5429
D=M // 5430
@LCL // 5431
A=M+1 // 5432
A=A+1 // 5433
M=D // 5434

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5435
0;JMP // 5436

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

@LCL // 5437
A=M+1 // 5438
A=A+1 // 5439
A=A+1 // 5440
D=M // 5441
A=A-1 // 5442
A=A-1 // 5443
A=A-1 // 5444
A=D+M // 5445
D=M // 5446
@SP // 5447
AM=M+1 // 5448
A=A-1 // 5449
M=D // 5450
@256 // 5451
D=A // 5452
@SP // 5453
AM=M+1 // 5454
A=A-1 // 5455
M=D // 5456
// call Math.multiply
@7 // 5457
D=A // 5458
@14 // 5459
M=D // 5460
@Math.multiply // 5461
D=A // 5462
@13 // 5463
M=D // 5464
@Output.printChar.ret.4 // 5465
D=A // 5466
@CALL // 5467
0;JMP // 5468
(Output.printChar.ret.4)
@SP // 5469
AM=M-1 // 5470
D=M // 5471
@LCL // 5472
A=M+1 // 5473
A=A+1 // 5474
M=D // 5475

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
@LCL // 5476
A=M+1 // 5477
D=M // 5478
@SP // 5479
AM=M+1 // 5480
A=A-1 // 5481
M=D // 5482
@LCL // 5483
A=M+1 // 5484
D=M // 5485
A=D // 5486
D=M // 5487
@SP // 5488
AM=M+1 // 5489
A=A-1 // 5490
M=D // 5491
@LCL // 5492
A=M+1 // 5493
A=A+1 // 5494
D=M // 5495
@SP // 5496
AM=M-1 // 5497
D=D|M // 5498
@SP // 5499
AM=M-1 // 5500
A=M // 5501
M=D // 5502

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

@LCL // 5503
A=M+1 // 5504
A=A+1 // 5505
A=A+1 // 5506
M=M+1 // 5507

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5508
0;JMP // 5509

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
@Output.printChar.EQ.52 // 5510
D=A // 5511
@SP // 5512
AM=M+1 // 5513
A=A-1 // 5514
M=D // 5515
@Output.1 // 5516
D=M // 5517
@63 // 5518
D=D-A // 5519
@DO_EQ // 5520
0;JMP // 5521
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE2 // 5522
D;JNE // 5523

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5524
0;JMP // 5525

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5526
D=A // 5527
@14 // 5528
M=D // 5529
@Output.println // 5530
D=A // 5531
@13 // 5532
M=D // 5533
@Output.printChar.ret.5 // 5534
D=A // 5535
@CALL // 5536
0;JMP // 5537
(Output.printChar.ret.5)
@SP // 5538
M=M-1 // 5539

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5540
0;JMP // 5541

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

@Output.1 // 5542
M=M+1 // 5543

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5544
AM=M+1 // 5545
A=A-1 // 5546
M=0 // 5547
@RETURN // 5548
0;JMP // 5549

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
@Memory.remove_node.EQ.53 // 5550
D=A // 5551
@SP // 5552
AM=M+1 // 5553
A=A-1 // 5554
M=D // 5555
@ARG // 5556
A=M+1 // 5557
D=M // 5558
@ARG // 5559
A=M+1 // 5560
D=M // 5561
@2 // 5562
D=D+A // 5563
A=D // 5564
D=M // 5565
@DO_EQ // 5566
0;JMP // 5567
(Memory.remove_node.EQ.53)
D=!D // 5568
@Memory.remove_node$IF_TRUE1 // 5569
D;JNE // 5570

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5571
0;JMP // 5572

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
@ARG // 5573
A=M+1 // 5574
D=M // 5575
@ARG // 5576
A=M+1 // 5577
D=M // 5578
@2 // 5579
D=D+A // 5580
A=D // 5581
D=M // 5582
@3 // 5583
D=D+A // 5584
@SP // 5585
AM=M+1 // 5586
A=A-1 // 5587
M=D // 5588
@ARG // 5589
A=M+1 // 5590
D=M // 5591
@ARG // 5592
A=M+1 // 5593
D=M // 5594
@3 // 5595
D=D+A // 5596
A=D // 5597
D=M // 5598
@SP // 5599
AM=M-1 // 5600
A=M // 5601
M=D // 5602

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5603
0;JMP // 5604

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
@ARG // 5605
A=M // 5606
D=M // 5607
@SP // 5608
AM=M+1 // 5609
A=A-1 // 5610
M=D // 5611
@ARG // 5612
A=M+1 // 5613
D=M // 5614
@ARG // 5615
A=M+1 // 5616
D=M // 5617
@3 // 5618
D=D+A // 5619
A=D // 5620
D=M // 5621
@SP // 5622
AM=M-1 // 5623
A=M // 5624
M=D // 5625

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
@Memory.remove_node.EQ.54 // 5626
D=A // 5627
@SP // 5628
AM=M+1 // 5629
A=A-1 // 5630
M=D // 5631
@ARG // 5632
A=M+1 // 5633
D=M // 5634
@ARG // 5635
A=M+1 // 5636
D=M // 5637
@3 // 5638
D=D+A // 5639
A=D // 5640
D=M // 5641
@DO_EQ // 5642
0;JMP // 5643
(Memory.remove_node.EQ.54)
D=!D // 5644
@Memory.remove_node$IF_TRUE2 // 5645
D;JNE // 5646

////GotoInstruction{label='Memory.remove_node$IF_END2}
// goto Memory.remove_node$IF_END2
@Memory.remove_node$IF_END2 // 5647
0;JMP // 5648

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
@ARG // 5649
A=M+1 // 5650
D=M // 5651
@ARG // 5652
A=M+1 // 5653
D=M // 5654
@3 // 5655
D=D+A // 5656
A=D // 5657
D=M // 5658
@2 // 5659
D=D+A // 5660
@SP // 5661
AM=M+1 // 5662
A=A-1 // 5663
M=D // 5664
@ARG // 5665
A=M+1 // 5666
D=M // 5667
@ARG // 5668
A=M+1 // 5669
D=M // 5670
@2 // 5671
D=D+A // 5672
A=D // 5673
D=M // 5674
@SP // 5675
AM=M-1 // 5676
A=M // 5677
M=D // 5678

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
@ARG // 5679
A=M+1 // 5680
D=M // 5681
@2 // 5682
D=D+A // 5683
@SP // 5684
AM=M+1 // 5685
A=A-1 // 5686
M=D // 5687
D=0 // 5688
@SP // 5689
AM=M-1 // 5690
A=M // 5691
M=D // 5692

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5693
A=M+1 // 5694
D=M // 5695
@3 // 5696
D=D+A // 5697
@SP // 5698
AM=M+1 // 5699
A=A-1 // 5700
M=D // 5701
D=0 // 5702
@SP // 5703
AM=M-1 // 5704
A=M // 5705
M=D // 5706

////PushInstruction("constant 0")
@SP // 5707
AM=M+1 // 5708
A=A-1 // 5709
M=0 // 5710
@RETURN // 5711
0;JMP // 5712

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5713
AM=M+1 // 5714
A=A-1 // 5715
M=0 // 5716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5717
D=A // 5718
@SP // 5719
AM=M+1 // 5720
A=A-1 // 5721
M=D // 5722
// call Memory.alloc
@6 // 5723
D=A // 5724
@14 // 5725
M=D // 5726
@Memory.alloc // 5727
D=A // 5728
@13 // 5729
M=D // 5730
@Output.init.ret.0 // 5731
D=A // 5732
@CALL // 5733
0;JMP // 5734
(Output.init.ret.0)
@SP // 5735
AM=M-1 // 5736
D=M // 5737
@Output.0 // 5738
M=D // 5739

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5740
D=A // 5741
@SP // 5742
M=D+M // 5743
@63 // 5744
D=A // 5745
@SP // 5746
A=M-1 // 5747
M=0 // 5748
A=A-1 // 5749
M=0 // 5750
A=A-1 // 5751
M=D // 5752
A=A-1 // 5753
M=D // 5754
A=A-1 // 5755
M=D // 5756
A=A-1 // 5757
M=D // 5758
A=A-1 // 5759
M=D // 5760
A=A-1 // 5761
M=D // 5762
A=A-1 // 5763
M=D // 5764
A=A-1 // 5765
M=D // 5766
A=A-1 // 5767
M=D // 5768
A=A-1 // 5769
M=0 // 5770
// call Output.create
@17 // 5771
D=A // 5772
@14 // 5773
M=D // 5774
@Output.create // 5775
D=A // 5776
@13 // 5777
M=D // 5778
@Output.init.ret.1 // 5779
D=A // 5780
@CALL // 5781
0;JMP // 5782
(Output.init.ret.1)
@SP // 5783
M=M-1 // 5784

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5785
D=A // 5786
@SP // 5787
M=D+M // 5788
@32 // 5789
D=A // 5790
@SP // 5791
A=M-1 // 5792
M=0 // 5793
A=A-1 // 5794
M=0 // 5795
A=A-1 // 5796
M=0 // 5797
A=A-1 // 5798
M=0 // 5799
A=A-1 // 5800
M=0 // 5801
A=A-1 // 5802
M=0 // 5803
A=A-1 // 5804
M=0 // 5805
A=A-1 // 5806
M=0 // 5807
A=A-1 // 5808
M=0 // 5809
A=A-1 // 5810
M=0 // 5811
A=A-1 // 5812
M=0 // 5813
A=A-1 // 5814
M=D // 5815
A=A-1 // 5816
// call Output.create
@17 // 5817
D=A // 5818
@14 // 5819
M=D // 5820
@Output.create // 5821
D=A // 5822
@13 // 5823
M=D // 5824
@Output.init.ret.2 // 5825
D=A // 5826
@CALL // 5827
0;JMP // 5828
(Output.init.ret.2)
@SP // 5829
M=M-1 // 5830

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5831
D=A // 5832
@SP // 5833
AM=M+1 // 5834
A=A-1 // 5835
M=D // 5836
@12 // 5837
D=A // 5838
@SP // 5839
AM=M+1 // 5840
A=A-1 // 5841
M=D // 5842
@30 // 5843
D=A // 5844
@SP // 5845
AM=M+1 // 5846
A=A-1 // 5847
M=D // 5848
@30 // 5849
D=A // 5850
@SP // 5851
AM=M+1 // 5852
A=A-1 // 5853
M=D // 5854
@30 // 5855
D=A // 5856
@SP // 5857
AM=M+1 // 5858
A=A-1 // 5859
M=D // 5860
@12 // 5861
D=A // 5862
@SP // 5863
AM=M+1 // 5864
A=A-1 // 5865
M=D // 5866
@12 // 5867
D=A // 5868
@SP // 5869
AM=M+1 // 5870
A=A-1 // 5871
M=D // 5872
@SP // 5873
AM=M+1 // 5874
A=A-1 // 5875
M=0 // 5876
@4 // 5877
D=A // 5878
@SP // 5879
M=D+M // 5880
@12 // 5881
D=A // 5882
@SP // 5883
A=M-1 // 5884
M=0 // 5885
A=A-1 // 5886
M=0 // 5887
A=A-1 // 5888
M=D // 5889
A=A-1 // 5890
M=D // 5891
A=A-1 // 5892
// call Output.create
@17 // 5893
D=A // 5894
@14 // 5895
M=D // 5896
@Output.create // 5897
D=A // 5898
@13 // 5899
M=D // 5900
@Output.init.ret.3 // 5901
D=A // 5902
@CALL // 5903
0;JMP // 5904
(Output.init.ret.3)
@SP // 5905
M=M-1 // 5906

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5907
D=A // 5908
@SP // 5909
AM=M+1 // 5910
A=A-1 // 5911
M=D // 5912
@54 // 5913
D=A // 5914
@SP // 5915
AM=M+1 // 5916
A=A-1 // 5917
M=D // 5918
@54 // 5919
D=A // 5920
@SP // 5921
AM=M+1 // 5922
A=A-1 // 5923
M=D // 5924
@20 // 5925
D=A // 5926
@SP // 5927
AM=M+1 // 5928
A=A-1 // 5929
M=D // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=0 // 5934
@SP // 5935
AM=M+1 // 5936
A=A-1 // 5937
M=0 // 5938
@SP // 5939
AM=M+1 // 5940
A=A-1 // 5941
M=0 // 5942
@SP // 5943
AM=M+1 // 5944
A=A-1 // 5945
M=0 // 5946
@SP // 5947
AM=M+1 // 5948
A=A-1 // 5949
M=0 // 5950
@SP // 5951
AM=M+1 // 5952
A=A-1 // 5953
M=0 // 5954
@SP // 5955
AM=M+1 // 5956
A=A-1 // 5957
M=0 // 5958
@SP // 5959
AM=M+1 // 5960
A=A-1 // 5961
M=0 // 5962
// call Output.create
@17 // 5963
D=A // 5964
@14 // 5965
M=D // 5966
@Output.create // 5967
D=A // 5968
@13 // 5969
M=D // 5970
@Output.init.ret.4 // 5971
D=A // 5972
@CALL // 5973
0;JMP // 5974
(Output.init.ret.4)
@SP // 5975
M=M-1 // 5976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5977
D=A // 5978
@SP // 5979
M=D+M // 5980
@35 // 5981
D=A // 5982
@SP // 5983
A=M-1 // 5984
M=0 // 5985
A=A-1 // 5986
M=D // 5987
A=A-1 // 5988
@18 // 5989
D=A // 5990
@SP // 5991
AM=M+1 // 5992
A=A-1 // 5993
M=D // 5994
@18 // 5995
D=A // 5996
@SP // 5997
AM=M+1 // 5998
A=A-1 // 5999
M=D // 6000
@63 // 6001
D=A // 6002
@SP // 6003
AM=M+1 // 6004
A=A-1 // 6005
M=D // 6006
@18 // 6007
D=A // 6008
@SP // 6009
AM=M+1 // 6010
A=A-1 // 6011
M=D // 6012
@18 // 6013
D=A // 6014
@SP // 6015
AM=M+1 // 6016
A=A-1 // 6017
M=D // 6018
@63 // 6019
D=A // 6020
@SP // 6021
AM=M+1 // 6022
A=A-1 // 6023
M=D // 6024
@18 // 6025
D=A // 6026
@SP // 6027
AM=M+1 // 6028
A=A-1 // 6029
M=D // 6030
@18 // 6031
D=A // 6032
@SP // 6033
AM=M+1 // 6034
A=A-1 // 6035
M=D // 6036
@SP // 6037
AM=M+1 // 6038
A=A-1 // 6039
M=0 // 6040
@SP // 6041
AM=M+1 // 6042
A=A-1 // 6043
M=0 // 6044
// call Output.create
@17 // 6045
D=A // 6046
@14 // 6047
M=D // 6048
@Output.create // 6049
D=A // 6050
@13 // 6051
M=D // 6052
@Output.init.ret.5 // 6053
D=A // 6054
@CALL // 6055
0;JMP // 6056
(Output.init.ret.5)
@SP // 6057
M=M-1 // 6058

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6059
D=A // 6060
@SP // 6061
AM=M+1 // 6062
A=A-1 // 6063
M=D // 6064
@12 // 6065
D=A // 6066
@SP // 6067
AM=M+1 // 6068
A=A-1 // 6069
M=D // 6070
@30 // 6071
D=A // 6072
@SP // 6073
AM=M+1 // 6074
A=A-1 // 6075
M=D // 6076
@51 // 6077
D=A // 6078
@SP // 6079
AM=M+1 // 6080
A=A-1 // 6081
M=D // 6082
@3 // 6083
D=A // 6084
@SP // 6085
AM=M+1 // 6086
A=A-1 // 6087
M=D // 6088
@30 // 6089
D=A // 6090
@SP // 6091
AM=M+1 // 6092
A=A-1 // 6093
M=D // 6094
@48 // 6095
D=A // 6096
@SP // 6097
AM=M+1 // 6098
A=A-1 // 6099
M=D // 6100
@51 // 6101
D=A // 6102
@SP // 6103
AM=M+1 // 6104
A=A-1 // 6105
M=D // 6106
@30 // 6107
D=A // 6108
@SP // 6109
AM=M+1 // 6110
A=A-1 // 6111
M=D // 6112
@12 // 6113
D=A // 6114
@SP // 6115
AM=M+1 // 6116
A=A-1 // 6117
M=D // 6118
@12 // 6119
D=A // 6120
@SP // 6121
AM=M+1 // 6122
A=A-1 // 6123
M=D // 6124
@SP // 6125
AM=M+1 // 6126
A=A-1 // 6127
M=0 // 6128
// call Output.create
@17 // 6129
D=A // 6130
@14 // 6131
M=D // 6132
@Output.create // 6133
D=A // 6134
@13 // 6135
M=D // 6136
@Output.init.ret.6 // 6137
D=A // 6138
@CALL // 6139
0;JMP // 6140
(Output.init.ret.6)
@SP // 6141
M=M-1 // 6142

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6143
D=A // 6144
@SP // 6145
M=D+M // 6146
@37 // 6147
D=A // 6148
@SP // 6149
A=M-1 // 6150
M=0 // 6151
A=A-1 // 6152
M=0 // 6153
A=A-1 // 6154
M=D // 6155
A=A-1 // 6156
@35 // 6157
D=A // 6158
@SP // 6159
AM=M+1 // 6160
A=A-1 // 6161
M=D // 6162
@51 // 6163
D=A // 6164
@SP // 6165
AM=M+1 // 6166
A=A-1 // 6167
M=D // 6168
@24 // 6169
D=A // 6170
@SP // 6171
AM=M+1 // 6172
A=A-1 // 6173
M=D // 6174
@12 // 6175
D=A // 6176
@SP // 6177
AM=M+1 // 6178
A=A-1 // 6179
M=D // 6180
@6 // 6181
D=A // 6182
@SP // 6183
AM=M+1 // 6184
A=A-1 // 6185
M=D // 6186
@51 // 6187
D=A // 6188
@SP // 6189
AM=M+1 // 6190
A=A-1 // 6191
M=D // 6192
@49 // 6193
D=A // 6194
@SP // 6195
AM=M+1 // 6196
A=A-1 // 6197
M=D // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=0 // 6202
@SP // 6203
AM=M+1 // 6204
A=A-1 // 6205
M=0 // 6206
// call Output.create
@17 // 6207
D=A // 6208
@14 // 6209
M=D // 6210
@Output.create // 6211
D=A // 6212
@13 // 6213
M=D // 6214
@Output.init.ret.7 // 6215
D=A // 6216
@CALL // 6217
0;JMP // 6218
(Output.init.ret.7)
@SP // 6219
M=M-1 // 6220

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6221
D=A // 6222
@SP // 6223
AM=M+1 // 6224
A=A-1 // 6225
M=D // 6226
@12 // 6227
D=A // 6228
@SP // 6229
AM=M+1 // 6230
A=A-1 // 6231
M=D // 6232
@30 // 6233
D=A // 6234
@SP // 6235
AM=M+1 // 6236
A=A-1 // 6237
M=D // 6238
@30 // 6239
D=A // 6240
@SP // 6241
AM=M+1 // 6242
A=A-1 // 6243
M=D // 6244
@12 // 6245
D=A // 6246
@SP // 6247
AM=M+1 // 6248
A=A-1 // 6249
M=D // 6250
@54 // 6251
D=A // 6252
@SP // 6253
AM=M+1 // 6254
A=A-1 // 6255
M=D // 6256
@27 // 6257
D=A // 6258
@SP // 6259
AM=M+1 // 6260
A=A-1 // 6261
M=D // 6262
@27 // 6263
D=A // 6264
@SP // 6265
AM=M+1 // 6266
A=A-1 // 6267
M=D // 6268
@27 // 6269
D=A // 6270
@SP // 6271
AM=M+1 // 6272
A=A-1 // 6273
M=D // 6274
@54 // 6275
D=A // 6276
@SP // 6277
AM=M+1 // 6278
A=A-1 // 6279
M=D // 6280
@SP // 6281
AM=M+1 // 6282
A=A-1 // 6283
M=0 // 6284
@SP // 6285
AM=M+1 // 6286
A=A-1 // 6287
M=0 // 6288
// call Output.create
@17 // 6289
D=A // 6290
@14 // 6291
M=D // 6292
@Output.create // 6293
D=A // 6294
@13 // 6295
M=D // 6296
@Output.init.ret.8 // 6297
D=A // 6298
@CALL // 6299
0;JMP // 6300
(Output.init.ret.8)
@SP // 6301
M=M-1 // 6302

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6303
D=A // 6304
@SP // 6305
AM=M+1 // 6306
A=A-1 // 6307
M=D // 6308
@12 // 6309
D=A // 6310
@SP // 6311
AM=M+1 // 6312
A=A-1 // 6313
M=D // 6314
@12 // 6315
D=A // 6316
@SP // 6317
AM=M+1 // 6318
A=A-1 // 6319
M=D // 6320
@6 // 6321
D=A // 6322
@SP // 6323
AM=M+1 // 6324
A=A-1 // 6325
M=D // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=0 // 6330
@SP // 6331
AM=M+1 // 6332
A=A-1 // 6333
M=0 // 6334
@SP // 6335
AM=M+1 // 6336
A=A-1 // 6337
M=0 // 6338
@SP // 6339
AM=M+1 // 6340
A=A-1 // 6341
M=0 // 6342
@SP // 6343
AM=M+1 // 6344
A=A-1 // 6345
M=0 // 6346
@SP // 6347
AM=M+1 // 6348
A=A-1 // 6349
M=0 // 6350
@SP // 6351
AM=M+1 // 6352
A=A-1 // 6353
M=0 // 6354
@SP // 6355
AM=M+1 // 6356
A=A-1 // 6357
M=0 // 6358
// call Output.create
@17 // 6359
D=A // 6360
@14 // 6361
M=D // 6362
@Output.create // 6363
D=A // 6364
@13 // 6365
M=D // 6366
@Output.init.ret.9 // 6367
D=A // 6368
@CALL // 6369
0;JMP // 6370
(Output.init.ret.9)
@SP // 6371
M=M-1 // 6372

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6373
D=A // 6374
@SP // 6375
AM=M+1 // 6376
A=A-1 // 6377
M=D // 6378
@24 // 6379
D=A // 6380
@SP // 6381
AM=M+1 // 6382
A=A-1 // 6383
M=D // 6384
@12 // 6385
D=A // 6386
@SP // 6387
AM=M+1 // 6388
A=A-1 // 6389
M=D // 6390
@6 // 6391
D=A // 6392
@SP // 6393
AM=M+1 // 6394
A=A-1 // 6395
M=D // 6396
@6 // 6397
D=A // 6398
@SP // 6399
AM=M+1 // 6400
A=A-1 // 6401
M=D // 6402
@6 // 6403
D=A // 6404
@SP // 6405
AM=M+1 // 6406
A=A-1 // 6407
M=D // 6408
@6 // 6409
D=A // 6410
@SP // 6411
AM=M+1 // 6412
A=A-1 // 6413
M=D // 6414
@6 // 6415
D=A // 6416
@SP // 6417
AM=M+1 // 6418
A=A-1 // 6419
M=D // 6420
@12 // 6421
D=A // 6422
@SP // 6423
AM=M+1 // 6424
A=A-1 // 6425
M=D // 6426
@24 // 6427
D=A // 6428
@SP // 6429
AM=M+1 // 6430
A=A-1 // 6431
M=D // 6432
@SP // 6433
AM=M+1 // 6434
A=A-1 // 6435
M=0 // 6436
@SP // 6437
AM=M+1 // 6438
A=A-1 // 6439
M=0 // 6440
// call Output.create
@17 // 6441
D=A // 6442
@14 // 6443
M=D // 6444
@Output.create // 6445
D=A // 6446
@13 // 6447
M=D // 6448
@Output.init.ret.10 // 6449
D=A // 6450
@CALL // 6451
0;JMP // 6452
(Output.init.ret.10)
@SP // 6453
M=M-1 // 6454

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6455
D=A // 6456
@SP // 6457
AM=M+1 // 6458
A=A-1 // 6459
M=D // 6460
@6 // 6461
D=A // 6462
@SP // 6463
AM=M+1 // 6464
A=A-1 // 6465
M=D // 6466
@12 // 6467
D=A // 6468
@SP // 6469
AM=M+1 // 6470
A=A-1 // 6471
M=D // 6472
@24 // 6473
D=A // 6474
@SP // 6475
AM=M+1 // 6476
A=A-1 // 6477
M=D // 6478
@24 // 6479
D=A // 6480
@SP // 6481
AM=M+1 // 6482
A=A-1 // 6483
M=D // 6484
@24 // 6485
D=A // 6486
@SP // 6487
AM=M+1 // 6488
A=A-1 // 6489
M=D // 6490
@24 // 6491
D=A // 6492
@SP // 6493
AM=M+1 // 6494
A=A-1 // 6495
M=D // 6496
@24 // 6497
D=A // 6498
@SP // 6499
AM=M+1 // 6500
A=A-1 // 6501
M=D // 6502
@12 // 6503
D=A // 6504
@SP // 6505
AM=M+1 // 6506
A=A-1 // 6507
M=D // 6508
@6 // 6509
D=A // 6510
@SP // 6511
AM=M+1 // 6512
A=A-1 // 6513
M=D // 6514
@SP // 6515
AM=M+1 // 6516
A=A-1 // 6517
M=0 // 6518
@SP // 6519
AM=M+1 // 6520
A=A-1 // 6521
M=0 // 6522
// call Output.create
@17 // 6523
D=A // 6524
@14 // 6525
M=D // 6526
@Output.create // 6527
D=A // 6528
@13 // 6529
M=D // 6530
@Output.init.ret.11 // 6531
D=A // 6532
@CALL // 6533
0;JMP // 6534
(Output.init.ret.11)
@SP // 6535
M=M-1 // 6536

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6537
D=A // 6538
@SP // 6539
M=D+M // 6540
@42 // 6541
D=A // 6542
@SP // 6543
A=M-1 // 6544
M=0 // 6545
A=A-1 // 6546
M=0 // 6547
A=A-1 // 6548
M=0 // 6549
A=A-1 // 6550
M=D // 6551
A=A-1 // 6552
@51 // 6553
D=A // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=D // 6558
@30 // 6559
D=A // 6560
@SP // 6561
AM=M+1 // 6562
A=A-1 // 6563
M=D // 6564
@63 // 6565
D=A // 6566
@SP // 6567
AM=M+1 // 6568
A=A-1 // 6569
M=D // 6570
@30 // 6571
D=A // 6572
@SP // 6573
AM=M+1 // 6574
A=A-1 // 6575
M=D // 6576
@51 // 6577
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
@SP // 6591
AM=M+1 // 6592
A=A-1 // 6593
M=0 // 6594
// call Output.create
@17 // 6595
D=A // 6596
@14 // 6597
M=D // 6598
@Output.create // 6599
D=A // 6600
@13 // 6601
M=D // 6602
@Output.init.ret.12 // 6603
D=A // 6604
@CALL // 6605
0;JMP // 6606
(Output.init.ret.12)
@SP // 6607
M=M-1 // 6608

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6609
D=A // 6610
@SP // 6611
M=D+M // 6612
@43 // 6613
D=A // 6614
@SP // 6615
A=M-1 // 6616
M=0 // 6617
A=A-1 // 6618
M=0 // 6619
A=A-1 // 6620
M=0 // 6621
A=A-1 // 6622
M=D // 6623
A=A-1 // 6624
@12 // 6625
D=A // 6626
@SP // 6627
AM=M+1 // 6628
A=A-1 // 6629
M=D // 6630
@12 // 6631
D=A // 6632
@SP // 6633
AM=M+1 // 6634
A=A-1 // 6635
M=D // 6636
@63 // 6637
D=A // 6638
@SP // 6639
AM=M+1 // 6640
A=A-1 // 6641
M=D // 6642
@12 // 6643
D=A // 6644
@SP // 6645
AM=M+1 // 6646
A=A-1 // 6647
M=D // 6648
@12 // 6649
D=A // 6650
@SP // 6651
AM=M+1 // 6652
A=A-1 // 6653
M=D // 6654
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=0 // 6658
@SP // 6659
AM=M+1 // 6660
A=A-1 // 6661
M=0 // 6662
@SP // 6663
AM=M+1 // 6664
A=A-1 // 6665
M=0 // 6666
// call Output.create
@17 // 6667
D=A // 6668
@14 // 6669
M=D // 6670
@Output.create // 6671
D=A // 6672
@13 // 6673
M=D // 6674
@Output.init.ret.13 // 6675
D=A // 6676
@CALL // 6677
0;JMP // 6678
(Output.init.ret.13)
@SP // 6679
M=M-1 // 6680

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6681
D=A // 6682
@SP // 6683
M=D+M // 6684
@44 // 6685
D=A // 6686
@SP // 6687
A=M-1 // 6688
M=0 // 6689
A=A-1 // 6690
M=0 // 6691
A=A-1 // 6692
M=0 // 6693
A=A-1 // 6694
M=0 // 6695
A=A-1 // 6696
M=0 // 6697
A=A-1 // 6698
M=0 // 6699
A=A-1 // 6700
M=0 // 6701
A=A-1 // 6702
M=D // 6703
A=A-1 // 6704
@12 // 6705
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
@6 // 6717
D=A // 6718
@SP // 6719
AM=M+1 // 6720
A=A-1 // 6721
M=D // 6722
@SP // 6723
AM=M+1 // 6724
A=A-1 // 6725
M=0 // 6726
// call Output.create
@17 // 6727
D=A // 6728
@14 // 6729
M=D // 6730
@Output.create // 6731
D=A // 6732
@13 // 6733
M=D // 6734
@Output.init.ret.14 // 6735
D=A // 6736
@CALL // 6737
0;JMP // 6738
(Output.init.ret.14)
@SP // 6739
M=M-1 // 6740

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6741
D=A // 6742
@SP // 6743
M=D+M // 6744
@45 // 6745
D=A // 6746
@SP // 6747
A=M-1 // 6748
M=0 // 6749
A=A-1 // 6750
M=0 // 6751
A=A-1 // 6752
M=0 // 6753
A=A-1 // 6754
M=0 // 6755
A=A-1 // 6756
M=0 // 6757
A=A-1 // 6758
M=D // 6759
A=A-1 // 6760
@6 // 6761
D=A // 6762
@SP // 6763
M=D+M // 6764
@63 // 6765
D=A // 6766
@SP // 6767
A=M-1 // 6768
M=0 // 6769
A=A-1 // 6770
M=0 // 6771
A=A-1 // 6772
M=0 // 6773
A=A-1 // 6774
M=0 // 6775
A=A-1 // 6776
M=0 // 6777
A=A-1 // 6778
M=D // 6779
A=A-1 // 6780
// call Output.create
@17 // 6781
D=A // 6782
@14 // 6783
M=D // 6784
@Output.create // 6785
D=A // 6786
@13 // 6787
M=D // 6788
@Output.init.ret.15 // 6789
D=A // 6790
@CALL // 6791
0;JMP // 6792
(Output.init.ret.15)
@SP // 6793
M=M-1 // 6794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6795
D=A // 6796
@SP // 6797
M=D+M // 6798
@46 // 6799
D=A // 6800
@SP // 6801
A=M-1 // 6802
M=0 // 6803
A=A-1 // 6804
M=0 // 6805
A=A-1 // 6806
M=0 // 6807
A=A-1 // 6808
M=0 // 6809
A=A-1 // 6810
M=0 // 6811
A=A-1 // 6812
M=0 // 6813
A=A-1 // 6814
M=0 // 6815
A=A-1 // 6816
M=D // 6817
A=A-1 // 6818
@4 // 6819
D=A // 6820
@SP // 6821
M=D+M // 6822
@12 // 6823
D=A // 6824
@SP // 6825
A=M-1 // 6826
M=0 // 6827
A=A-1 // 6828
M=0 // 6829
A=A-1 // 6830
M=D // 6831
A=A-1 // 6832
M=D // 6833
A=A-1 // 6834
// call Output.create
@17 // 6835
D=A // 6836
@14 // 6837
M=D // 6838
@Output.create // 6839
D=A // 6840
@13 // 6841
M=D // 6842
@Output.init.ret.16 // 6843
D=A // 6844
@CALL // 6845
0;JMP // 6846
(Output.init.ret.16)
@SP // 6847
M=M-1 // 6848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6849
D=A // 6850
@SP // 6851
M=D+M // 6852
@47 // 6853
D=A // 6854
@SP // 6855
A=M-1 // 6856
M=0 // 6857
A=A-1 // 6858
M=0 // 6859
A=A-1 // 6860
M=D // 6861
A=A-1 // 6862
@32 // 6863
D=A // 6864
@SP // 6865
AM=M+1 // 6866
A=A-1 // 6867
M=D // 6868
@48 // 6869
D=A // 6870
@SP // 6871
AM=M+1 // 6872
A=A-1 // 6873
M=D // 6874
@24 // 6875
D=A // 6876
@SP // 6877
AM=M+1 // 6878
A=A-1 // 6879
M=D // 6880
@12 // 6881
D=A // 6882
@SP // 6883
AM=M+1 // 6884
A=A-1 // 6885
M=D // 6886
@6 // 6887
D=A // 6888
@SP // 6889
AM=M+1 // 6890
A=A-1 // 6891
M=D // 6892
@3 // 6893
D=A // 6894
@SP // 6895
AM=M+1 // 6896
A=A-1 // 6897
M=D // 6898
@SP // 6899
AM=M+1 // 6900
A=A-1 // 6901
M=1 // 6902
@SP // 6903
AM=M+1 // 6904
A=A-1 // 6905
M=0 // 6906
@SP // 6907
AM=M+1 // 6908
A=A-1 // 6909
M=0 // 6910
// call Output.create
@17 // 6911
D=A // 6912
@14 // 6913
M=D // 6914
@Output.create // 6915
D=A // 6916
@13 // 6917
M=D // 6918
@Output.init.ret.17 // 6919
D=A // 6920
@CALL // 6921
0;JMP // 6922
(Output.init.ret.17)
@SP // 6923
M=M-1 // 6924

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6925
D=A // 6926
@SP // 6927
AM=M+1 // 6928
A=A-1 // 6929
M=D // 6930
@12 // 6931
D=A // 6932
@SP // 6933
AM=M+1 // 6934
A=A-1 // 6935
M=D // 6936
@30 // 6937
D=A // 6938
@SP // 6939
AM=M+1 // 6940
A=A-1 // 6941
M=D // 6942
@51 // 6943
D=A // 6944
@SP // 6945
AM=M+1 // 6946
A=A-1 // 6947
M=D // 6948
@51 // 6949
D=A // 6950
@SP // 6951
AM=M+1 // 6952
A=A-1 // 6953
M=D // 6954
@51 // 6955
D=A // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=D // 6960
@51 // 6961
D=A // 6962
@SP // 6963
AM=M+1 // 6964
A=A-1 // 6965
M=D // 6966
@51 // 6967
D=A // 6968
@SP // 6969
AM=M+1 // 6970
A=A-1 // 6971
M=D // 6972
@30 // 6973
D=A // 6974
@SP // 6975
AM=M+1 // 6976
A=A-1 // 6977
M=D // 6978
@12 // 6979
D=A // 6980
@SP // 6981
AM=M+1 // 6982
A=A-1 // 6983
M=D // 6984
@SP // 6985
AM=M+1 // 6986
A=A-1 // 6987
M=0 // 6988
@SP // 6989
AM=M+1 // 6990
A=A-1 // 6991
M=0 // 6992
// call Output.create
@17 // 6993
D=A // 6994
@14 // 6995
M=D // 6996
@Output.create // 6997
D=A // 6998
@13 // 6999
M=D // 7000
@Output.init.ret.18 // 7001
D=A // 7002
@CALL // 7003
0;JMP // 7004
(Output.init.ret.18)
@SP // 7005
M=M-1 // 7006

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 7007
D=A // 7008
@SP // 7009
AM=M+1 // 7010
A=A-1 // 7011
M=D // 7012
@12 // 7013
D=A // 7014
@SP // 7015
AM=M+1 // 7016
A=A-1 // 7017
M=D // 7018
@14 // 7019
D=A // 7020
@SP // 7021
AM=M+1 // 7022
A=A-1 // 7023
M=D // 7024
@15 // 7025
D=A // 7026
@SP // 7027
AM=M+1 // 7028
A=A-1 // 7029
M=D // 7030
@12 // 7031
D=A // 7032
@SP // 7033
AM=M+1 // 7034
A=A-1 // 7035
M=D // 7036
@12 // 7037
D=A // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042
@12 // 7043
D=A // 7044
@SP // 7045
AM=M+1 // 7046
A=A-1 // 7047
M=D // 7048
@12 // 7049
D=A // 7050
@SP // 7051
AM=M+1 // 7052
A=A-1 // 7053
M=D // 7054
@12 // 7055
D=A // 7056
@SP // 7057
AM=M+1 // 7058
A=A-1 // 7059
M=D // 7060
@63 // 7061
D=A // 7062
@SP // 7063
AM=M+1 // 7064
A=A-1 // 7065
M=D // 7066
@SP // 7067
AM=M+1 // 7068
A=A-1 // 7069
M=0 // 7070
@SP // 7071
AM=M+1 // 7072
A=A-1 // 7073
M=0 // 7074
// call Output.create
@17 // 7075
D=A // 7076
@14 // 7077
M=D // 7078
@Output.create // 7079
D=A // 7080
@13 // 7081
M=D // 7082
@Output.init.ret.19 // 7083
D=A // 7084
@CALL // 7085
0;JMP // 7086
(Output.init.ret.19)
@SP // 7087
M=M-1 // 7088

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7089
D=A // 7090
@SP // 7091
AM=M+1 // 7092
A=A-1 // 7093
M=D // 7094
@30 // 7095
D=A // 7096
@SP // 7097
AM=M+1 // 7098
A=A-1 // 7099
M=D // 7100
@51 // 7101
D=A // 7102
@SP // 7103
AM=M+1 // 7104
A=A-1 // 7105
M=D // 7106
@48 // 7107
D=A // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=D // 7112
@24 // 7113
D=A // 7114
@SP // 7115
AM=M+1 // 7116
A=A-1 // 7117
M=D // 7118
@12 // 7119
D=A // 7120
@SP // 7121
AM=M+1 // 7122
A=A-1 // 7123
M=D // 7124
@6 // 7125
D=A // 7126
@SP // 7127
AM=M+1 // 7128
A=A-1 // 7129
M=D // 7130
@3 // 7131
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
@63 // 7143
D=A // 7144
@SP // 7145
AM=M+1 // 7146
A=A-1 // 7147
M=D // 7148
@SP // 7149
AM=M+1 // 7150
A=A-1 // 7151
M=0 // 7152
@SP // 7153
AM=M+1 // 7154
A=A-1 // 7155
M=0 // 7156
// call Output.create
@17 // 7157
D=A // 7158
@14 // 7159
M=D // 7160
@Output.create // 7161
D=A // 7162
@13 // 7163
M=D // 7164
@Output.init.ret.20 // 7165
D=A // 7166
@CALL // 7167
0;JMP // 7168
(Output.init.ret.20)
@SP // 7169
M=M-1 // 7170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7171
D=A // 7172
@SP // 7173
AM=M+1 // 7174
A=A-1 // 7175
M=D // 7176
@30 // 7177
D=A // 7178
@SP // 7179
AM=M+1 // 7180
A=A-1 // 7181
M=D // 7182
@51 // 7183
D=A // 7184
@SP // 7185
AM=M+1 // 7186
A=A-1 // 7187
M=D // 7188
@48 // 7189
D=A // 7190
@SP // 7191
AM=M+1 // 7192
A=A-1 // 7193
M=D // 7194
@48 // 7195
D=A // 7196
@SP // 7197
AM=M+1 // 7198
A=A-1 // 7199
M=D // 7200
@28 // 7201
D=A // 7202
@SP // 7203
AM=M+1 // 7204
A=A-1 // 7205
M=D // 7206
@48 // 7207
D=A // 7208
@SP // 7209
AM=M+1 // 7210
A=A-1 // 7211
M=D // 7212
@48 // 7213
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
@30 // 7225
D=A // 7226
@SP // 7227
AM=M+1 // 7228
A=A-1 // 7229
M=D // 7230
@SP // 7231
AM=M+1 // 7232
A=A-1 // 7233
M=0 // 7234
@SP // 7235
AM=M+1 // 7236
A=A-1 // 7237
M=0 // 7238
// call Output.create
@17 // 7239
D=A // 7240
@14 // 7241
M=D // 7242
@Output.create // 7243
D=A // 7244
@13 // 7245
M=D // 7246
@Output.init.ret.21 // 7247
D=A // 7248
@CALL // 7249
0;JMP // 7250
(Output.init.ret.21)
@SP // 7251
M=M-1 // 7252

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7253
D=A // 7254
@SP // 7255
AM=M+1 // 7256
A=A-1 // 7257
M=D // 7258
@16 // 7259
D=A // 7260
@SP // 7261
AM=M+1 // 7262
A=A-1 // 7263
M=D // 7264
@24 // 7265
D=A // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270
@28 // 7271
D=A // 7272
@SP // 7273
AM=M+1 // 7274
A=A-1 // 7275
M=D // 7276
@26 // 7277
D=A // 7278
@SP // 7279
AM=M+1 // 7280
A=A-1 // 7281
M=D // 7282
@25 // 7283
D=A // 7284
@SP // 7285
AM=M+1 // 7286
A=A-1 // 7287
M=D // 7288
@63 // 7289
D=A // 7290
@SP // 7291
AM=M+1 // 7292
A=A-1 // 7293
M=D // 7294
@24 // 7295
D=A // 7296
@SP // 7297
AM=M+1 // 7298
A=A-1 // 7299
M=D // 7300
@24 // 7301
D=A // 7302
@SP // 7303
AM=M+1 // 7304
A=A-1 // 7305
M=D // 7306
@60 // 7307
D=A // 7308
@SP // 7309
AM=M+1 // 7310
A=A-1 // 7311
M=D // 7312
@SP // 7313
AM=M+1 // 7314
A=A-1 // 7315
M=0 // 7316
@SP // 7317
AM=M+1 // 7318
A=A-1 // 7319
M=0 // 7320
// call Output.create
@17 // 7321
D=A // 7322
@14 // 7323
M=D // 7324
@Output.create // 7325
D=A // 7326
@13 // 7327
M=D // 7328
@Output.init.ret.22 // 7329
D=A // 7330
@CALL // 7331
0;JMP // 7332
(Output.init.ret.22)
@SP // 7333
M=M-1 // 7334

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7335
D=A // 7336
@SP // 7337
AM=M+1 // 7338
A=A-1 // 7339
M=D // 7340
@63 // 7341
D=A // 7342
@SP // 7343
AM=M+1 // 7344
A=A-1 // 7345
M=D // 7346
@3 // 7347
D=A // 7348
@SP // 7349
AM=M+1 // 7350
A=A-1 // 7351
M=D // 7352
@3 // 7353
D=A // 7354
@SP // 7355
AM=M+1 // 7356
A=A-1 // 7357
M=D // 7358
@31 // 7359
D=A // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364
@48 // 7365
D=A // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=D // 7370
@48 // 7371
D=A // 7372
@SP // 7373
AM=M+1 // 7374
A=A-1 // 7375
M=D // 7376
@48 // 7377
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
@30 // 7389
D=A // 7390
@SP // 7391
AM=M+1 // 7392
A=A-1 // 7393
M=D // 7394
@SP // 7395
AM=M+1 // 7396
A=A-1 // 7397
M=0 // 7398
@SP // 7399
AM=M+1 // 7400
A=A-1 // 7401
M=0 // 7402
// call Output.create
@17 // 7403
D=A // 7404
@14 // 7405
M=D // 7406
@Output.create // 7407
D=A // 7408
@13 // 7409
M=D // 7410
@Output.init.ret.23 // 7411
D=A // 7412
@CALL // 7413
0;JMP // 7414
(Output.init.ret.23)
@SP // 7415
M=M-1 // 7416

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7417
D=A // 7418
@SP // 7419
AM=M+1 // 7420
A=A-1 // 7421
M=D // 7422
@28 // 7423
D=A // 7424
@SP // 7425
AM=M+1 // 7426
A=A-1 // 7427
M=D // 7428
@6 // 7429
D=A // 7430
@SP // 7431
AM=M+1 // 7432
A=A-1 // 7433
M=D // 7434
@3 // 7435
D=A // 7436
@SP // 7437
AM=M+1 // 7438
A=A-1 // 7439
M=D // 7440
@3 // 7441
D=A // 7442
@SP // 7443
AM=M+1 // 7444
A=A-1 // 7445
M=D // 7446
@31 // 7447
D=A // 7448
@SP // 7449
AM=M+1 // 7450
A=A-1 // 7451
M=D // 7452
@51 // 7453
D=A // 7454
@SP // 7455
AM=M+1 // 7456
A=A-1 // 7457
M=D // 7458
@51 // 7459
D=A // 7460
@SP // 7461
AM=M+1 // 7462
A=A-1 // 7463
M=D // 7464
@51 // 7465
D=A // 7466
@SP // 7467
AM=M+1 // 7468
A=A-1 // 7469
M=D // 7470
@30 // 7471
D=A // 7472
@SP // 7473
AM=M+1 // 7474
A=A-1 // 7475
M=D // 7476
@SP // 7477
AM=M+1 // 7478
A=A-1 // 7479
M=0 // 7480
@SP // 7481
AM=M+1 // 7482
A=A-1 // 7483
M=0 // 7484
// call Output.create
@17 // 7485
D=A // 7486
@14 // 7487
M=D // 7488
@Output.create // 7489
D=A // 7490
@13 // 7491
M=D // 7492
@Output.init.ret.24 // 7493
D=A // 7494
@CALL // 7495
0;JMP // 7496
(Output.init.ret.24)
@SP // 7497
M=M-1 // 7498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7499
D=A // 7500
@SP // 7501
AM=M+1 // 7502
A=A-1 // 7503
M=D // 7504
@63 // 7505
D=A // 7506
@SP // 7507
AM=M+1 // 7508
A=A-1 // 7509
M=D // 7510
@49 // 7511
D=A // 7512
@SP // 7513
AM=M+1 // 7514
A=A-1 // 7515
M=D // 7516
@48 // 7517
D=A // 7518
@SP // 7519
AM=M+1 // 7520
A=A-1 // 7521
M=D // 7522
@48 // 7523
D=A // 7524
@SP // 7525
AM=M+1 // 7526
A=A-1 // 7527
M=D // 7528
@24 // 7529
D=A // 7530
@SP // 7531
AM=M+1 // 7532
A=A-1 // 7533
M=D // 7534
@12 // 7535
D=A // 7536
@SP // 7537
AM=M+1 // 7538
A=A-1 // 7539
M=D // 7540
@12 // 7541
D=A // 7542
@SP // 7543
AM=M+1 // 7544
A=A-1 // 7545
M=D // 7546
@12 // 7547
D=A // 7548
@SP // 7549
AM=M+1 // 7550
A=A-1 // 7551
M=D // 7552
@12 // 7553
D=A // 7554
@SP // 7555
AM=M+1 // 7556
A=A-1 // 7557
M=D // 7558
@SP // 7559
AM=M+1 // 7560
A=A-1 // 7561
M=0 // 7562
@SP // 7563
AM=M+1 // 7564
A=A-1 // 7565
M=0 // 7566
// call Output.create
@17 // 7567
D=A // 7568
@14 // 7569
M=D // 7570
@Output.create // 7571
D=A // 7572
@13 // 7573
M=D // 7574
@Output.init.ret.25 // 7575
D=A // 7576
@CALL // 7577
0;JMP // 7578
(Output.init.ret.25)
@SP // 7579
M=M-1 // 7580

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7581
D=A // 7582
@SP // 7583
AM=M+1 // 7584
A=A-1 // 7585
M=D // 7586
@30 // 7587
D=A // 7588
@SP // 7589
AM=M+1 // 7590
A=A-1 // 7591
M=D // 7592
@51 // 7593
D=A // 7594
@SP // 7595
AM=M+1 // 7596
A=A-1 // 7597
M=D // 7598
@51 // 7599
D=A // 7600
@SP // 7601
AM=M+1 // 7602
A=A-1 // 7603
M=D // 7604
@51 // 7605
D=A // 7606
@SP // 7607
AM=M+1 // 7608
A=A-1 // 7609
M=D // 7610
@30 // 7611
D=A // 7612
@SP // 7613
AM=M+1 // 7614
A=A-1 // 7615
M=D // 7616
@51 // 7617
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
@30 // 7635
D=A // 7636
@SP // 7637
AM=M+1 // 7638
A=A-1 // 7639
M=D // 7640
@SP // 7641
AM=M+1 // 7642
A=A-1 // 7643
M=0 // 7644
@SP // 7645
AM=M+1 // 7646
A=A-1 // 7647
M=0 // 7648
// call Output.create
@17 // 7649
D=A // 7650
@14 // 7651
M=D // 7652
@Output.create // 7653
D=A // 7654
@13 // 7655
M=D // 7656
@Output.init.ret.26 // 7657
D=A // 7658
@CALL // 7659
0;JMP // 7660
(Output.init.ret.26)
@SP // 7661
M=M-1 // 7662

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7663
D=A // 7664
@SP // 7665
AM=M+1 // 7666
A=A-1 // 7667
M=D // 7668
@30 // 7669
D=A // 7670
@SP // 7671
AM=M+1 // 7672
A=A-1 // 7673
M=D // 7674
@51 // 7675
D=A // 7676
@SP // 7677
AM=M+1 // 7678
A=A-1 // 7679
M=D // 7680
@51 // 7681
D=A // 7682
@SP // 7683
AM=M+1 // 7684
A=A-1 // 7685
M=D // 7686
@51 // 7687
D=A // 7688
@SP // 7689
AM=M+1 // 7690
A=A-1 // 7691
M=D // 7692
@62 // 7693
D=A // 7694
@SP // 7695
AM=M+1 // 7696
A=A-1 // 7697
M=D // 7698
@48 // 7699
D=A // 7700
@SP // 7701
AM=M+1 // 7702
A=A-1 // 7703
M=D // 7704
@48 // 7705
D=A // 7706
@SP // 7707
AM=M+1 // 7708
A=A-1 // 7709
M=D // 7710
@24 // 7711
D=A // 7712
@SP // 7713
AM=M+1 // 7714
A=A-1 // 7715
M=D // 7716
@14 // 7717
D=A // 7718
@SP // 7719
AM=M+1 // 7720
A=A-1 // 7721
M=D // 7722
@SP // 7723
AM=M+1 // 7724
A=A-1 // 7725
M=0 // 7726
@SP // 7727
AM=M+1 // 7728
A=A-1 // 7729
M=0 // 7730
// call Output.create
@17 // 7731
D=A // 7732
@14 // 7733
M=D // 7734
@Output.create // 7735
D=A // 7736
@13 // 7737
M=D // 7738
@Output.init.ret.27 // 7739
D=A // 7740
@CALL // 7741
0;JMP // 7742
(Output.init.ret.27)
@SP // 7743
M=M-1 // 7744

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7745
D=A // 7746
@SP // 7747
M=D+M // 7748
@58 // 7749
D=A // 7750
@SP // 7751
A=M-1 // 7752
M=0 // 7753
A=A-1 // 7754
M=0 // 7755
A=A-1 // 7756
M=D // 7757
A=A-1 // 7758
@4 // 7759
D=A // 7760
@SP // 7761
M=D+M // 7762
@12 // 7763
D=A // 7764
@SP // 7765
A=M-1 // 7766
M=0 // 7767
A=A-1 // 7768
M=0 // 7769
A=A-1 // 7770
M=D // 7771
A=A-1 // 7772
M=D // 7773
A=A-1 // 7774
@5 // 7775
D=A // 7776
@SP // 7777
M=D+M // 7778
@12 // 7779
D=A // 7780
@SP // 7781
A=M-1 // 7782
M=0 // 7783
A=A-1 // 7784
M=0 // 7785
A=A-1 // 7786
M=0 // 7787
A=A-1 // 7788
M=D // 7789
A=A-1 // 7790
M=D // 7791
A=A-1 // 7792
// call Output.create
@17 // 7793
D=A // 7794
@14 // 7795
M=D // 7796
@Output.create // 7797
D=A // 7798
@13 // 7799
M=D // 7800
@Output.init.ret.28 // 7801
D=A // 7802
@CALL // 7803
0;JMP // 7804
(Output.init.ret.28)
@SP // 7805
M=M-1 // 7806

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7807
D=A // 7808
@SP // 7809
M=D+M // 7810
@59 // 7811
D=A // 7812
@SP // 7813
A=M-1 // 7814
M=0 // 7815
A=A-1 // 7816
M=0 // 7817
A=A-1 // 7818
M=D // 7819
A=A-1 // 7820
@4 // 7821
D=A // 7822
@SP // 7823
M=D+M // 7824
@12 // 7825
D=A // 7826
@SP // 7827
A=M-1 // 7828
M=0 // 7829
A=A-1 // 7830
M=0 // 7831
A=A-1 // 7832
M=D // 7833
A=A-1 // 7834
M=D // 7835
A=A-1 // 7836
@12 // 7837
D=A // 7838
@SP // 7839
AM=M+1 // 7840
A=A-1 // 7841
M=D // 7842
@12 // 7843
D=A // 7844
@SP // 7845
AM=M+1 // 7846
A=A-1 // 7847
M=D // 7848
@6 // 7849
D=A // 7850
@SP // 7851
AM=M+1 // 7852
A=A-1 // 7853
M=D // 7854
@SP // 7855
AM=M+1 // 7856
A=A-1 // 7857
M=0 // 7858
@SP // 7859
AM=M+1 // 7860
A=A-1 // 7861
M=0 // 7862
// call Output.create
@17 // 7863
D=A // 7864
@14 // 7865
M=D // 7866
@Output.create // 7867
D=A // 7868
@13 // 7869
M=D // 7870
@Output.init.ret.29 // 7871
D=A // 7872
@CALL // 7873
0;JMP // 7874
(Output.init.ret.29)
@SP // 7875
M=M-1 // 7876

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7877
D=A // 7878
@SP // 7879
M=D+M // 7880
@60 // 7881
D=A // 7882
@SP // 7883
A=M-1 // 7884
M=0 // 7885
A=A-1 // 7886
M=0 // 7887
A=A-1 // 7888
M=D // 7889
A=A-1 // 7890
@24 // 7891
D=A // 7892
@SP // 7893
AM=M+1 // 7894
A=A-1 // 7895
M=D // 7896
@12 // 7897
D=A // 7898
@SP // 7899
AM=M+1 // 7900
A=A-1 // 7901
M=D // 7902
@6 // 7903
D=A // 7904
@SP // 7905
AM=M+1 // 7906
A=A-1 // 7907
M=D // 7908
@3 // 7909
D=A // 7910
@SP // 7911
AM=M+1 // 7912
A=A-1 // 7913
M=D // 7914
@6 // 7915
D=A // 7916
@SP // 7917
AM=M+1 // 7918
A=A-1 // 7919
M=D // 7920
@12 // 7921
D=A // 7922
@SP // 7923
AM=M+1 // 7924
A=A-1 // 7925
M=D // 7926
@24 // 7927
D=A // 7928
@SP // 7929
AM=M+1 // 7930
A=A-1 // 7931
M=D // 7932
@SP // 7933
AM=M+1 // 7934
A=A-1 // 7935
M=0 // 7936
@SP // 7937
AM=M+1 // 7938
A=A-1 // 7939
M=0 // 7940
// call Output.create
@17 // 7941
D=A // 7942
@14 // 7943
M=D // 7944
@Output.create // 7945
D=A // 7946
@13 // 7947
M=D // 7948
@Output.init.ret.30 // 7949
D=A // 7950
@CALL // 7951
0;JMP // 7952
(Output.init.ret.30)
@SP // 7953
M=M-1 // 7954

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7955
D=A // 7956
@SP // 7957
M=D+M // 7958
@61 // 7959
D=A // 7960
@SP // 7961
A=M-1 // 7962
M=0 // 7963
A=A-1 // 7964
M=0 // 7965
A=A-1 // 7966
M=0 // 7967
A=A-1 // 7968
M=D // 7969
A=A-1 // 7970
@3 // 7971
D=A // 7972
@SP // 7973
M=D+M // 7974
@63 // 7975
D=A // 7976
@SP // 7977
A=M-1 // 7978
M=0 // 7979
A=A-1 // 7980
M=0 // 7981
A=A-1 // 7982
M=D // 7983
A=A-1 // 7984
@5 // 7985
D=A // 7986
@SP // 7987
M=D+M // 7988
@63 // 7989
D=A // 7990
@SP // 7991
A=M-1 // 7992
M=0 // 7993
A=A-1 // 7994
M=0 // 7995
A=A-1 // 7996
M=0 // 7997
A=A-1 // 7998
M=0 // 7999
A=A-1 // 8000
M=D // 8001
A=A-1 // 8002
// call Output.create
@17 // 8003
D=A // 8004
@14 // 8005
M=D // 8006
@Output.create // 8007
D=A // 8008
@13 // 8009
M=D // 8010
@Output.init.ret.31 // 8011
D=A // 8012
@CALL // 8013
0;JMP // 8014
(Output.init.ret.31)
@SP // 8015
M=M-1 // 8016

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 8017
D=A // 8018
@SP // 8019
M=D+M // 8020
@62 // 8021
D=A // 8022
@SP // 8023
A=M-1 // 8024
M=0 // 8025
A=A-1 // 8026
M=0 // 8027
A=A-1 // 8028
M=D // 8029
A=A-1 // 8030
@3 // 8031
D=A // 8032
@SP // 8033
AM=M+1 // 8034
A=A-1 // 8035
M=D // 8036
@6 // 8037
D=A // 8038
@SP // 8039
AM=M+1 // 8040
A=A-1 // 8041
M=D // 8042
@12 // 8043
D=A // 8044
@SP // 8045
AM=M+1 // 8046
A=A-1 // 8047
M=D // 8048
@24 // 8049
D=A // 8050
@SP // 8051
AM=M+1 // 8052
A=A-1 // 8053
M=D // 8054
@12 // 8055
D=A // 8056
@SP // 8057
AM=M+1 // 8058
A=A-1 // 8059
M=D // 8060
@6 // 8061
D=A // 8062
@SP // 8063
AM=M+1 // 8064
A=A-1 // 8065
M=D // 8066
@3 // 8067
D=A // 8068
@SP // 8069
AM=M+1 // 8070
A=A-1 // 8071
M=D // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=0 // 8076
@SP // 8077
AM=M+1 // 8078
A=A-1 // 8079
M=0 // 8080
// call Output.create
@17 // 8081
D=A // 8082
@14 // 8083
M=D // 8084
@Output.create // 8085
D=A // 8086
@13 // 8087
M=D // 8088
@Output.init.ret.32 // 8089
D=A // 8090
@CALL // 8091
0;JMP // 8092
(Output.init.ret.32)
@SP // 8093
M=M-1 // 8094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8095
D=A // 8096
@SP // 8097
AM=M+1 // 8098
A=A-1 // 8099
M=D // 8100
@30 // 8101
D=A // 8102
@SP // 8103
AM=M+1 // 8104
A=A-1 // 8105
M=D // 8106
@51 // 8107
D=A // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=D // 8112
@51 // 8113
D=A // 8114
@SP // 8115
AM=M+1 // 8116
A=A-1 // 8117
M=D // 8118
@59 // 8119
D=A // 8120
@SP // 8121
AM=M+1 // 8122
A=A-1 // 8123
M=D // 8124
@59 // 8125
D=A // 8126
@SP // 8127
AM=M+1 // 8128
A=A-1 // 8129
M=D // 8130
@59 // 8131
D=A // 8132
@SP // 8133
AM=M+1 // 8134
A=A-1 // 8135
M=D // 8136
@27 // 8137
D=A // 8138
@SP // 8139
AM=M+1 // 8140
A=A-1 // 8141
M=D // 8142
@3 // 8143
D=A // 8144
@SP // 8145
AM=M+1 // 8146
A=A-1 // 8147
M=D // 8148
@30 // 8149
D=A // 8150
@SP // 8151
AM=M+1 // 8152
A=A-1 // 8153
M=D // 8154
@SP // 8155
AM=M+1 // 8156
A=A-1 // 8157
M=0 // 8158
@SP // 8159
AM=M+1 // 8160
A=A-1 // 8161
M=0 // 8162
// call Output.create
@17 // 8163
D=A // 8164
@14 // 8165
M=D // 8166
@Output.create // 8167
D=A // 8168
@13 // 8169
M=D // 8170
@Output.init.ret.33 // 8171
D=A // 8172
@CALL // 8173
0;JMP // 8174
(Output.init.ret.33)
@SP // 8175
M=M-1 // 8176

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8177
D=A // 8178
@SP // 8179
AM=M+1 // 8180
A=A-1 // 8181
M=D // 8182
@30 // 8183
D=A // 8184
@SP // 8185
AM=M+1 // 8186
A=A-1 // 8187
M=D // 8188
@51 // 8189
D=A // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=D // 8194
@51 // 8195
D=A // 8196
@SP // 8197
AM=M+1 // 8198
A=A-1 // 8199
M=D // 8200
@24 // 8201
D=A // 8202
@SP // 8203
AM=M+1 // 8204
A=A-1 // 8205
M=D // 8206
@12 // 8207
D=A // 8208
@SP // 8209
AM=M+1 // 8210
A=A-1 // 8211
M=D // 8212
@12 // 8213
D=A // 8214
@SP // 8215
AM=M+1 // 8216
A=A-1 // 8217
M=D // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=0 // 8222
@4 // 8223
D=A // 8224
@SP // 8225
M=D+M // 8226
@12 // 8227
D=A // 8228
@SP // 8229
A=M-1 // 8230
M=0 // 8231
A=A-1 // 8232
M=0 // 8233
A=A-1 // 8234
M=D // 8235
A=A-1 // 8236
M=D // 8237
A=A-1 // 8238
// call Output.create
@17 // 8239
D=A // 8240
@14 // 8241
M=D // 8242
@Output.create // 8243
D=A // 8244
@13 // 8245
M=D // 8246
@Output.init.ret.34 // 8247
D=A // 8248
@CALL // 8249
0;JMP // 8250
(Output.init.ret.34)
@SP // 8251
M=M-1 // 8252

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8253
D=A // 8254
@SP // 8255
AM=M+1 // 8256
A=A-1 // 8257
M=D // 8258
@12 // 8259
D=A // 8260
@SP // 8261
AM=M+1 // 8262
A=A-1 // 8263
M=D // 8264
@30 // 8265
D=A // 8266
@SP // 8267
AM=M+1 // 8268
A=A-1 // 8269
M=D // 8270
@51 // 8271
D=A // 8272
@SP // 8273
AM=M+1 // 8274
A=A-1 // 8275
M=D // 8276
@51 // 8277
D=A // 8278
@SP // 8279
AM=M+1 // 8280
A=A-1 // 8281
M=D // 8282
@63 // 8283
D=A // 8284
@SP // 8285
AM=M+1 // 8286
A=A-1 // 8287
M=D // 8288
@51 // 8289
D=A // 8290
@SP // 8291
AM=M+1 // 8292
A=A-1 // 8293
M=D // 8294
@51 // 8295
D=A // 8296
@SP // 8297
AM=M+1 // 8298
A=A-1 // 8299
M=D // 8300
@51 // 8301
D=A // 8302
@SP // 8303
AM=M+1 // 8304
A=A-1 // 8305
M=D // 8306
@51 // 8307
D=A // 8308
@SP // 8309
AM=M+1 // 8310
A=A-1 // 8311
M=D // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=0 // 8316
@SP // 8317
AM=M+1 // 8318
A=A-1 // 8319
M=0 // 8320
// call Output.create
@17 // 8321
D=A // 8322
@14 // 8323
M=D // 8324
@Output.create // 8325
D=A // 8326
@13 // 8327
M=D // 8328
@Output.init.ret.35 // 8329
D=A // 8330
@CALL // 8331
0;JMP // 8332
(Output.init.ret.35)
@SP // 8333
M=M-1 // 8334

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8335
D=A // 8336
@SP // 8337
AM=M+1 // 8338
A=A-1 // 8339
M=D // 8340
@31 // 8341
D=A // 8342
@SP // 8343
AM=M+1 // 8344
A=A-1 // 8345
M=D // 8346
@51 // 8347
D=A // 8348
@SP // 8349
AM=M+1 // 8350
A=A-1 // 8351
M=D // 8352
@51 // 8353
D=A // 8354
@SP // 8355
AM=M+1 // 8356
A=A-1 // 8357
M=D // 8358
@51 // 8359
D=A // 8360
@SP // 8361
AM=M+1 // 8362
A=A-1 // 8363
M=D // 8364
@31 // 8365
D=A // 8366
@SP // 8367
AM=M+1 // 8368
A=A-1 // 8369
M=D // 8370
@51 // 8371
D=A // 8372
@SP // 8373
AM=M+1 // 8374
A=A-1 // 8375
M=D // 8376
@51 // 8377
D=A // 8378
@SP // 8379
AM=M+1 // 8380
A=A-1 // 8381
M=D // 8382
@51 // 8383
D=A // 8384
@SP // 8385
AM=M+1 // 8386
A=A-1 // 8387
M=D // 8388
@31 // 8389
D=A // 8390
@SP // 8391
AM=M+1 // 8392
A=A-1 // 8393
M=D // 8394
@SP // 8395
AM=M+1 // 8396
A=A-1 // 8397
M=0 // 8398
@SP // 8399
AM=M+1 // 8400
A=A-1 // 8401
M=0 // 8402
// call Output.create
@17 // 8403
D=A // 8404
@14 // 8405
M=D // 8406
@Output.create // 8407
D=A // 8408
@13 // 8409
M=D // 8410
@Output.init.ret.36 // 8411
D=A // 8412
@CALL // 8413
0;JMP // 8414
(Output.init.ret.36)
@SP // 8415
M=M-1 // 8416

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8417
D=A // 8418
@SP // 8419
AM=M+1 // 8420
A=A-1 // 8421
M=D // 8422
@28 // 8423
D=A // 8424
@SP // 8425
AM=M+1 // 8426
A=A-1 // 8427
M=D // 8428
@54 // 8429
D=A // 8430
@SP // 8431
AM=M+1 // 8432
A=A-1 // 8433
M=D // 8434
@35 // 8435
D=A // 8436
@SP // 8437
AM=M+1 // 8438
A=A-1 // 8439
M=D // 8440
@3 // 8441
D=A // 8442
@SP // 8443
AM=M+1 // 8444
A=A-1 // 8445
M=D // 8446
@3 // 8447
D=A // 8448
@SP // 8449
AM=M+1 // 8450
A=A-1 // 8451
M=D // 8452
@3 // 8453
D=A // 8454
@SP // 8455
AM=M+1 // 8456
A=A-1 // 8457
M=D // 8458
@35 // 8459
D=A // 8460
@SP // 8461
AM=M+1 // 8462
A=A-1 // 8463
M=D // 8464
@54 // 8465
D=A // 8466
@SP // 8467
AM=M+1 // 8468
A=A-1 // 8469
M=D // 8470
@28 // 8471
D=A // 8472
@SP // 8473
AM=M+1 // 8474
A=A-1 // 8475
M=D // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=0 // 8480
@SP // 8481
AM=M+1 // 8482
A=A-1 // 8483
M=0 // 8484
// call Output.create
@17 // 8485
D=A // 8486
@14 // 8487
M=D // 8488
@Output.create // 8489
D=A // 8490
@13 // 8491
M=D // 8492
@Output.init.ret.37 // 8493
D=A // 8494
@CALL // 8495
0;JMP // 8496
(Output.init.ret.37)
@SP // 8497
M=M-1 // 8498

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8499
D=A // 8500
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=D // 8504
@15 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510
@27 // 8511
D=A // 8512
@SP // 8513
AM=M+1 // 8514
A=A-1 // 8515
M=D // 8516
@51 // 8517
D=A // 8518
@SP // 8519
AM=M+1 // 8520
A=A-1 // 8521
M=D // 8522
@51 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528
@51 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534
@51 // 8535
D=A // 8536
@SP // 8537
AM=M+1 // 8538
A=A-1 // 8539
M=D // 8540
@51 // 8541
D=A // 8542
@SP // 8543
AM=M+1 // 8544
A=A-1 // 8545
M=D // 8546
@27 // 8547
D=A // 8548
@SP // 8549
AM=M+1 // 8550
A=A-1 // 8551
M=D // 8552
@15 // 8553
D=A // 8554
@SP // 8555
AM=M+1 // 8556
A=A-1 // 8557
M=D // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=0 // 8562
@SP // 8563
AM=M+1 // 8564
A=A-1 // 8565
M=0 // 8566
// call Output.create
@17 // 8567
D=A // 8568
@14 // 8569
M=D // 8570
@Output.create // 8571
D=A // 8572
@13 // 8573
M=D // 8574
@Output.init.ret.38 // 8575
D=A // 8576
@CALL // 8577
0;JMP // 8578
(Output.init.ret.38)
@SP // 8579
M=M-1 // 8580

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8581
D=A // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=D // 8586
@63 // 8587
D=A // 8588
@SP // 8589
AM=M+1 // 8590
A=A-1 // 8591
M=D // 8592
@51 // 8593
D=A // 8594
@SP // 8595
AM=M+1 // 8596
A=A-1 // 8597
M=D // 8598
@35 // 8599
D=A // 8600
@SP // 8601
AM=M+1 // 8602
A=A-1 // 8603
M=D // 8604
@11 // 8605
D=A // 8606
@SP // 8607
AM=M+1 // 8608
A=A-1 // 8609
M=D // 8610
@15 // 8611
D=A // 8612
@SP // 8613
AM=M+1 // 8614
A=A-1 // 8615
M=D // 8616
@11 // 8617
D=A // 8618
@SP // 8619
AM=M+1 // 8620
A=A-1 // 8621
M=D // 8622
@35 // 8623
D=A // 8624
@SP // 8625
AM=M+1 // 8626
A=A-1 // 8627
M=D // 8628
@51 // 8629
D=A // 8630
@SP // 8631
AM=M+1 // 8632
A=A-1 // 8633
M=D // 8634
@63 // 8635
D=A // 8636
@SP // 8637
AM=M+1 // 8638
A=A-1 // 8639
M=D // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=0 // 8644
@SP // 8645
AM=M+1 // 8646
A=A-1 // 8647
M=0 // 8648
// call Output.create
@17 // 8649
D=A // 8650
@14 // 8651
M=D // 8652
@Output.create // 8653
D=A // 8654
@13 // 8655
M=D // 8656
@Output.init.ret.39 // 8657
D=A // 8658
@CALL // 8659
0;JMP // 8660
(Output.init.ret.39)
@SP // 8661
M=M-1 // 8662

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8663
D=A // 8664
@SP // 8665
AM=M+1 // 8666
A=A-1 // 8667
M=D // 8668
@63 // 8669
D=A // 8670
@SP // 8671
AM=M+1 // 8672
A=A-1 // 8673
M=D // 8674
@51 // 8675
D=A // 8676
@SP // 8677
AM=M+1 // 8678
A=A-1 // 8679
M=D // 8680
@35 // 8681
D=A // 8682
@SP // 8683
AM=M+1 // 8684
A=A-1 // 8685
M=D // 8686
@11 // 8687
D=A // 8688
@SP // 8689
AM=M+1 // 8690
A=A-1 // 8691
M=D // 8692
@15 // 8693
D=A // 8694
@SP // 8695
AM=M+1 // 8696
A=A-1 // 8697
M=D // 8698
@11 // 8699
D=A // 8700
@SP // 8701
AM=M+1 // 8702
A=A-1 // 8703
M=D // 8704
@3 // 8705
D=A // 8706
@SP // 8707
AM=M+1 // 8708
A=A-1 // 8709
M=D // 8710
@3 // 8711
D=A // 8712
@SP // 8713
AM=M+1 // 8714
A=A-1 // 8715
M=D // 8716
@3 // 8717
D=A // 8718
@SP // 8719
AM=M+1 // 8720
A=A-1 // 8721
M=D // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=0 // 8726
@SP // 8727
AM=M+1 // 8728
A=A-1 // 8729
M=0 // 8730
// call Output.create
@17 // 8731
D=A // 8732
@14 // 8733
M=D // 8734
@Output.create // 8735
D=A // 8736
@13 // 8737
M=D // 8738
@Output.init.ret.40 // 8739
D=A // 8740
@CALL // 8741
0;JMP // 8742
(Output.init.ret.40)
@SP // 8743
M=M-1 // 8744

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8745
D=A // 8746
@SP // 8747
AM=M+1 // 8748
A=A-1 // 8749
M=D // 8750
@28 // 8751
D=A // 8752
@SP // 8753
AM=M+1 // 8754
A=A-1 // 8755
M=D // 8756
@54 // 8757
D=A // 8758
@SP // 8759
AM=M+1 // 8760
A=A-1 // 8761
M=D // 8762
@35 // 8763
D=A // 8764
@SP // 8765
AM=M+1 // 8766
A=A-1 // 8767
M=D // 8768
@3 // 8769
D=A // 8770
@SP // 8771
AM=M+1 // 8772
A=A-1 // 8773
M=D // 8774
@59 // 8775
D=A // 8776
@SP // 8777
AM=M+1 // 8778
A=A-1 // 8779
M=D // 8780
@51 // 8781
D=A // 8782
@SP // 8783
AM=M+1 // 8784
A=A-1 // 8785
M=D // 8786
@51 // 8787
D=A // 8788
@SP // 8789
AM=M+1 // 8790
A=A-1 // 8791
M=D // 8792
@54 // 8793
D=A // 8794
@SP // 8795
AM=M+1 // 8796
A=A-1 // 8797
M=D // 8798
@44 // 8799
D=A // 8800
@SP // 8801
AM=M+1 // 8802
A=A-1 // 8803
M=D // 8804
@SP // 8805
AM=M+1 // 8806
A=A-1 // 8807
M=0 // 8808
@SP // 8809
AM=M+1 // 8810
A=A-1 // 8811
M=0 // 8812
// call Output.create
@17 // 8813
D=A // 8814
@14 // 8815
M=D // 8816
@Output.create // 8817
D=A // 8818
@13 // 8819
M=D // 8820
@Output.init.ret.41 // 8821
D=A // 8822
@CALL // 8823
0;JMP // 8824
(Output.init.ret.41)
@SP // 8825
M=M-1 // 8826

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8827
D=A // 8828
@SP // 8829
AM=M+1 // 8830
A=A-1 // 8831
M=D // 8832
@51 // 8833
D=A // 8834
@SP // 8835
AM=M+1 // 8836
A=A-1 // 8837
M=D // 8838
@51 // 8839
D=A // 8840
@SP // 8841
AM=M+1 // 8842
A=A-1 // 8843
M=D // 8844
@51 // 8845
D=A // 8846
@SP // 8847
AM=M+1 // 8848
A=A-1 // 8849
M=D // 8850
@51 // 8851
D=A // 8852
@SP // 8853
AM=M+1 // 8854
A=A-1 // 8855
M=D // 8856
@63 // 8857
D=A // 8858
@SP // 8859
AM=M+1 // 8860
A=A-1 // 8861
M=D // 8862
@51 // 8863
D=A // 8864
@SP // 8865
AM=M+1 // 8866
A=A-1 // 8867
M=D // 8868
@51 // 8869
D=A // 8870
@SP // 8871
AM=M+1 // 8872
A=A-1 // 8873
M=D // 8874
@51 // 8875
D=A // 8876
@SP // 8877
AM=M+1 // 8878
A=A-1 // 8879
M=D // 8880
@51 // 8881
D=A // 8882
@SP // 8883
AM=M+1 // 8884
A=A-1 // 8885
M=D // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=0 // 8890
@SP // 8891
AM=M+1 // 8892
A=A-1 // 8893
M=0 // 8894
// call Output.create
@17 // 8895
D=A // 8896
@14 // 8897
M=D // 8898
@Output.create // 8899
D=A // 8900
@13 // 8901
M=D // 8902
@Output.init.ret.42 // 8903
D=A // 8904
@CALL // 8905
0;JMP // 8906
(Output.init.ret.42)
@SP // 8907
M=M-1 // 8908

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8909
D=A // 8910
@SP // 8911
AM=M+1 // 8912
A=A-1 // 8913
M=D // 8914
@30 // 8915
D=A // 8916
@SP // 8917
AM=M+1 // 8918
A=A-1 // 8919
M=D // 8920
@12 // 8921
D=A // 8922
@SP // 8923
AM=M+1 // 8924
A=A-1 // 8925
M=D // 8926
@12 // 8927
D=A // 8928
@SP // 8929
AM=M+1 // 8930
A=A-1 // 8931
M=D // 8932
@12 // 8933
D=A // 8934
@SP // 8935
AM=M+1 // 8936
A=A-1 // 8937
M=D // 8938
@12 // 8939
D=A // 8940
@SP // 8941
AM=M+1 // 8942
A=A-1 // 8943
M=D // 8944
@12 // 8945
D=A // 8946
@SP // 8947
AM=M+1 // 8948
A=A-1 // 8949
M=D // 8950
@12 // 8951
D=A // 8952
@SP // 8953
AM=M+1 // 8954
A=A-1 // 8955
M=D // 8956
@12 // 8957
D=A // 8958
@SP // 8959
AM=M+1 // 8960
A=A-1 // 8961
M=D // 8962
@30 // 8963
D=A // 8964
@SP // 8965
AM=M+1 // 8966
A=A-1 // 8967
M=D // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=0 // 8972
@SP // 8973
AM=M+1 // 8974
A=A-1 // 8975
M=0 // 8976
// call Output.create
@17 // 8977
D=A // 8978
@14 // 8979
M=D // 8980
@Output.create // 8981
D=A // 8982
@13 // 8983
M=D // 8984
@Output.init.ret.43 // 8985
D=A // 8986
@CALL // 8987
0;JMP // 8988
(Output.init.ret.43)
@SP // 8989
M=M-1 // 8990

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8991
D=A // 8992
@SP // 8993
AM=M+1 // 8994
A=A-1 // 8995
M=D // 8996
@60 // 8997
D=A // 8998
@SP // 8999
AM=M+1 // 9000
A=A-1 // 9001
M=D // 9002
@24 // 9003
D=A // 9004
@SP // 9005
AM=M+1 // 9006
A=A-1 // 9007
M=D // 9008
@24 // 9009
D=A // 9010
@SP // 9011
AM=M+1 // 9012
A=A-1 // 9013
M=D // 9014
@24 // 9015
D=A // 9016
@SP // 9017
AM=M+1 // 9018
A=A-1 // 9019
M=D // 9020
@24 // 9021
D=A // 9022
@SP // 9023
AM=M+1 // 9024
A=A-1 // 9025
M=D // 9026
@24 // 9027
D=A // 9028
@SP // 9029
AM=M+1 // 9030
A=A-1 // 9031
M=D // 9032
@27 // 9033
D=A // 9034
@SP // 9035
AM=M+1 // 9036
A=A-1 // 9037
M=D // 9038
@27 // 9039
D=A // 9040
@SP // 9041
AM=M+1 // 9042
A=A-1 // 9043
M=D // 9044
@14 // 9045
D=A // 9046
@SP // 9047
AM=M+1 // 9048
A=A-1 // 9049
M=D // 9050
@SP // 9051
AM=M+1 // 9052
A=A-1 // 9053
M=0 // 9054
@SP // 9055
AM=M+1 // 9056
A=A-1 // 9057
M=0 // 9058
// call Output.create
@17 // 9059
D=A // 9060
@14 // 9061
M=D // 9062
@Output.create // 9063
D=A // 9064
@13 // 9065
M=D // 9066
@Output.init.ret.44 // 9067
D=A // 9068
@CALL // 9069
0;JMP // 9070
(Output.init.ret.44)
@SP // 9071
M=M-1 // 9072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9073
D=A // 9074
@SP // 9075
AM=M+1 // 9076
A=A-1 // 9077
M=D // 9078
@51 // 9079
D=A // 9080
@SP // 9081
AM=M+1 // 9082
A=A-1 // 9083
M=D // 9084
@51 // 9085
D=A // 9086
@SP // 9087
AM=M+1 // 9088
A=A-1 // 9089
M=D // 9090
@51 // 9091
D=A // 9092
@SP // 9093
AM=M+1 // 9094
A=A-1 // 9095
M=D // 9096
@27 // 9097
D=A // 9098
@SP // 9099
AM=M+1 // 9100
A=A-1 // 9101
M=D // 9102
@15 // 9103
D=A // 9104
@SP // 9105
AM=M+1 // 9106
A=A-1 // 9107
M=D // 9108
@27 // 9109
D=A // 9110
@SP // 9111
AM=M+1 // 9112
A=A-1 // 9113
M=D // 9114
@51 // 9115
D=A // 9116
@SP // 9117
AM=M+1 // 9118
A=A-1 // 9119
M=D // 9120
@51 // 9121
D=A // 9122
@SP // 9123
AM=M+1 // 9124
A=A-1 // 9125
M=D // 9126
@51 // 9127
D=A // 9128
@SP // 9129
AM=M+1 // 9130
A=A-1 // 9131
M=D // 9132
@SP // 9133
AM=M+1 // 9134
A=A-1 // 9135
M=0 // 9136
@SP // 9137
AM=M+1 // 9138
A=A-1 // 9139
M=0 // 9140
// call Output.create
@17 // 9141
D=A // 9142
@14 // 9143
M=D // 9144
@Output.create // 9145
D=A // 9146
@13 // 9147
M=D // 9148
@Output.init.ret.45 // 9149
D=A // 9150
@CALL // 9151
0;JMP // 9152
(Output.init.ret.45)
@SP // 9153
M=M-1 // 9154

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9155
D=A // 9156
@SP // 9157
AM=M+1 // 9158
A=A-1 // 9159
M=D // 9160
@3 // 9161
D=A // 9162
@SP // 9163
AM=M+1 // 9164
A=A-1 // 9165
M=D // 9166
@3 // 9167
D=A // 9168
@SP // 9169
AM=M+1 // 9170
A=A-1 // 9171
M=D // 9172
@3 // 9173
D=A // 9174
@SP // 9175
AM=M+1 // 9176
A=A-1 // 9177
M=D // 9178
@3 // 9179
D=A // 9180
@SP // 9181
AM=M+1 // 9182
A=A-1 // 9183
M=D // 9184
@3 // 9185
D=A // 9186
@SP // 9187
AM=M+1 // 9188
A=A-1 // 9189
M=D // 9190
@3 // 9191
D=A // 9192
@SP // 9193
AM=M+1 // 9194
A=A-1 // 9195
M=D // 9196
@35 // 9197
D=A // 9198
@SP // 9199
AM=M+1 // 9200
A=A-1 // 9201
M=D // 9202
@51 // 9203
D=A // 9204
@SP // 9205
AM=M+1 // 9206
A=A-1 // 9207
M=D // 9208
@63 // 9209
D=A // 9210
@SP // 9211
AM=M+1 // 9212
A=A-1 // 9213
M=D // 9214
@SP // 9215
AM=M+1 // 9216
A=A-1 // 9217
M=0 // 9218
@SP // 9219
AM=M+1 // 9220
A=A-1 // 9221
M=0 // 9222
// call Output.create
@17 // 9223
D=A // 9224
@14 // 9225
M=D // 9226
@Output.create // 9227
D=A // 9228
@13 // 9229
M=D // 9230
@Output.init.ret.46 // 9231
D=A // 9232
@CALL // 9233
0;JMP // 9234
(Output.init.ret.46)
@SP // 9235
M=M-1 // 9236

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9237
D=A // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=D // 9242
@33 // 9243
D=A // 9244
@SP // 9245
AM=M+1 // 9246
A=A-1 // 9247
M=D // 9248
@51 // 9249
D=A // 9250
@SP // 9251
AM=M+1 // 9252
A=A-1 // 9253
M=D // 9254
@63 // 9255
D=A // 9256
@SP // 9257
AM=M+1 // 9258
A=A-1 // 9259
M=D // 9260
@63 // 9261
D=A // 9262
@SP // 9263
AM=M+1 // 9264
A=A-1 // 9265
M=D // 9266
@51 // 9267
D=A // 9268
@SP // 9269
AM=M+1 // 9270
A=A-1 // 9271
M=D // 9272
@51 // 9273
D=A // 9274
@SP // 9275
AM=M+1 // 9276
A=A-1 // 9277
M=D // 9278
@51 // 9279
D=A // 9280
@SP // 9281
AM=M+1 // 9282
A=A-1 // 9283
M=D // 9284
@51 // 9285
D=A // 9286
@SP // 9287
AM=M+1 // 9288
A=A-1 // 9289
M=D // 9290
@51 // 9291
D=A // 9292
@SP // 9293
AM=M+1 // 9294
A=A-1 // 9295
M=D // 9296
@SP // 9297
AM=M+1 // 9298
A=A-1 // 9299
M=0 // 9300
@SP // 9301
AM=M+1 // 9302
A=A-1 // 9303
M=0 // 9304
// call Output.create
@17 // 9305
D=A // 9306
@14 // 9307
M=D // 9308
@Output.create // 9309
D=A // 9310
@13 // 9311
M=D // 9312
@Output.init.ret.47 // 9313
D=A // 9314
@CALL // 9315
0;JMP // 9316
(Output.init.ret.47)
@SP // 9317
M=M-1 // 9318

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9319
D=A // 9320
@SP // 9321
AM=M+1 // 9322
A=A-1 // 9323
M=D // 9324
@51 // 9325
D=A // 9326
@SP // 9327
AM=M+1 // 9328
A=A-1 // 9329
M=D // 9330
@51 // 9331
D=A // 9332
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=D // 9336
@55 // 9337
D=A // 9338
@SP // 9339
AM=M+1 // 9340
A=A-1 // 9341
M=D // 9342
@55 // 9343
D=A // 9344
@SP // 9345
AM=M+1 // 9346
A=A-1 // 9347
M=D // 9348
@63 // 9349
D=A // 9350
@SP // 9351
AM=M+1 // 9352
A=A-1 // 9353
M=D // 9354
@59 // 9355
D=A // 9356
@SP // 9357
AM=M+1 // 9358
A=A-1 // 9359
M=D // 9360
@59 // 9361
D=A // 9362
@SP // 9363
AM=M+1 // 9364
A=A-1 // 9365
M=D // 9366
@51 // 9367
D=A // 9368
@SP // 9369
AM=M+1 // 9370
A=A-1 // 9371
M=D // 9372
@51 // 9373
D=A // 9374
@SP // 9375
AM=M+1 // 9376
A=A-1 // 9377
M=D // 9378
@SP // 9379
AM=M+1 // 9380
A=A-1 // 9381
M=0 // 9382
@SP // 9383
AM=M+1 // 9384
A=A-1 // 9385
M=0 // 9386
// call Output.create
@17 // 9387
D=A // 9388
@14 // 9389
M=D // 9390
@Output.create // 9391
D=A // 9392
@13 // 9393
M=D // 9394
@Output.init.ret.48 // 9395
D=A // 9396
@CALL // 9397
0;JMP // 9398
(Output.init.ret.48)
@SP // 9399
M=M-1 // 9400

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9401
D=A // 9402
@SP // 9403
AM=M+1 // 9404
A=A-1 // 9405
M=D // 9406
@30 // 9407
D=A // 9408
@SP // 9409
AM=M+1 // 9410
A=A-1 // 9411
M=D // 9412
@51 // 9413
D=A // 9414
@SP // 9415
AM=M+1 // 9416
A=A-1 // 9417
M=D // 9418
@51 // 9419
D=A // 9420
@SP // 9421
AM=M+1 // 9422
A=A-1 // 9423
M=D // 9424
@51 // 9425
D=A // 9426
@SP // 9427
AM=M+1 // 9428
A=A-1 // 9429
M=D // 9430
@51 // 9431
D=A // 9432
@SP // 9433
AM=M+1 // 9434
A=A-1 // 9435
M=D // 9436
@51 // 9437
D=A // 9438
@SP // 9439
AM=M+1 // 9440
A=A-1 // 9441
M=D // 9442
@51 // 9443
D=A // 9444
@SP // 9445
AM=M+1 // 9446
A=A-1 // 9447
M=D // 9448
@51 // 9449
D=A // 9450
@SP // 9451
AM=M+1 // 9452
A=A-1 // 9453
M=D // 9454
@30 // 9455
D=A // 9456
@SP // 9457
AM=M+1 // 9458
A=A-1 // 9459
M=D // 9460
@SP // 9461
AM=M+1 // 9462
A=A-1 // 9463
M=0 // 9464
@SP // 9465
AM=M+1 // 9466
A=A-1 // 9467
M=0 // 9468
// call Output.create
@17 // 9469
D=A // 9470
@14 // 9471
M=D // 9472
@Output.create // 9473
D=A // 9474
@13 // 9475
M=D // 9476
@Output.init.ret.49 // 9477
D=A // 9478
@CALL // 9479
0;JMP // 9480
(Output.init.ret.49)
@SP // 9481
M=M-1 // 9482

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9483
D=A // 9484
@SP // 9485
AM=M+1 // 9486
A=A-1 // 9487
M=D // 9488
@31 // 9489
D=A // 9490
@SP // 9491
AM=M+1 // 9492
A=A-1 // 9493
M=D // 9494
@51 // 9495
D=A // 9496
@SP // 9497
AM=M+1 // 9498
A=A-1 // 9499
M=D // 9500
@51 // 9501
D=A // 9502
@SP // 9503
AM=M+1 // 9504
A=A-1 // 9505
M=D // 9506
@51 // 9507
D=A // 9508
@SP // 9509
AM=M+1 // 9510
A=A-1 // 9511
M=D // 9512
@31 // 9513
D=A // 9514
@SP // 9515
AM=M+1 // 9516
A=A-1 // 9517
M=D // 9518
@3 // 9519
D=A // 9520
@SP // 9521
AM=M+1 // 9522
A=A-1 // 9523
M=D // 9524
@3 // 9525
D=A // 9526
@SP // 9527
AM=M+1 // 9528
A=A-1 // 9529
M=D // 9530
@3 // 9531
D=A // 9532
@SP // 9533
AM=M+1 // 9534
A=A-1 // 9535
M=D // 9536
@3 // 9537
D=A // 9538
@SP // 9539
AM=M+1 // 9540
A=A-1 // 9541
M=D // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=0 // 9546
@SP // 9547
AM=M+1 // 9548
A=A-1 // 9549
M=0 // 9550
// call Output.create
@17 // 9551
D=A // 9552
@14 // 9553
M=D // 9554
@Output.create // 9555
D=A // 9556
@13 // 9557
M=D // 9558
@Output.init.ret.50 // 9559
D=A // 9560
@CALL // 9561
0;JMP // 9562
(Output.init.ret.50)
@SP // 9563
M=M-1 // 9564

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570
@30 // 9571
D=A // 9572
@SP // 9573
AM=M+1 // 9574
A=A-1 // 9575
M=D // 9576
@51 // 9577
D=A // 9578
@SP // 9579
AM=M+1 // 9580
A=A-1 // 9581
M=D // 9582
@51 // 9583
D=A // 9584
@SP // 9585
AM=M+1 // 9586
A=A-1 // 9587
M=D // 9588
@51 // 9589
D=A // 9590
@SP // 9591
AM=M+1 // 9592
A=A-1 // 9593
M=D // 9594
@51 // 9595
D=A // 9596
@SP // 9597
AM=M+1 // 9598
A=A-1 // 9599
M=D // 9600
@51 // 9601
D=A // 9602
@SP // 9603
AM=M+1 // 9604
A=A-1 // 9605
M=D // 9606
@63 // 9607
D=A // 9608
@SP // 9609
AM=M+1 // 9610
A=A-1 // 9611
M=D // 9612
@59 // 9613
D=A // 9614
@SP // 9615
AM=M+1 // 9616
A=A-1 // 9617
M=D // 9618
@30 // 9619
D=A // 9620
@SP // 9621
AM=M+1 // 9622
A=A-1 // 9623
M=D // 9624
@48 // 9625
D=A // 9626
@SP // 9627
AM=M+1 // 9628
A=A-1 // 9629
M=D // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=0 // 9634
// call Output.create
@17 // 9635
D=A // 9636
@14 // 9637
M=D // 9638
@Output.create // 9639
D=A // 9640
@13 // 9641
M=D // 9642
@Output.init.ret.51 // 9643
D=A // 9644
@CALL // 9645
0;JMP // 9646
(Output.init.ret.51)
@SP // 9647
M=M-1 // 9648

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9649
D=A // 9650
@SP // 9651
AM=M+1 // 9652
A=A-1 // 9653
M=D // 9654
@31 // 9655
D=A // 9656
@SP // 9657
AM=M+1 // 9658
A=A-1 // 9659
M=D // 9660
@51 // 9661
D=A // 9662
@SP // 9663
AM=M+1 // 9664
A=A-1 // 9665
M=D // 9666
@51 // 9667
D=A // 9668
@SP // 9669
AM=M+1 // 9670
A=A-1 // 9671
M=D // 9672
@51 // 9673
D=A // 9674
@SP // 9675
AM=M+1 // 9676
A=A-1 // 9677
M=D // 9678
@31 // 9679
D=A // 9680
@SP // 9681
AM=M+1 // 9682
A=A-1 // 9683
M=D // 9684
@27 // 9685
D=A // 9686
@SP // 9687
AM=M+1 // 9688
A=A-1 // 9689
M=D // 9690
@51 // 9691
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
@51 // 9703
D=A // 9704
@SP // 9705
AM=M+1 // 9706
A=A-1 // 9707
M=D // 9708
@SP // 9709
AM=M+1 // 9710
A=A-1 // 9711
M=0 // 9712
@SP // 9713
AM=M+1 // 9714
A=A-1 // 9715
M=0 // 9716
// call Output.create
@17 // 9717
D=A // 9718
@14 // 9719
M=D // 9720
@Output.create // 9721
D=A // 9722
@13 // 9723
M=D // 9724
@Output.init.ret.52 // 9725
D=A // 9726
@CALL // 9727
0;JMP // 9728
(Output.init.ret.52)
@SP // 9729
M=M-1 // 9730

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9731
D=A // 9732
@SP // 9733
AM=M+1 // 9734
A=A-1 // 9735
M=D // 9736
@30 // 9737
D=A // 9738
@SP // 9739
AM=M+1 // 9740
A=A-1 // 9741
M=D // 9742
@51 // 9743
D=A // 9744
@SP // 9745
AM=M+1 // 9746
A=A-1 // 9747
M=D // 9748
@51 // 9749
D=A // 9750
@SP // 9751
AM=M+1 // 9752
A=A-1 // 9753
M=D // 9754
@6 // 9755
D=A // 9756
@SP // 9757
AM=M+1 // 9758
A=A-1 // 9759
M=D // 9760
@28 // 9761
D=A // 9762
@SP // 9763
AM=M+1 // 9764
A=A-1 // 9765
M=D // 9766
@48 // 9767
D=A // 9768
@SP // 9769
AM=M+1 // 9770
A=A-1 // 9771
M=D // 9772
@51 // 9773
D=A // 9774
@SP // 9775
AM=M+1 // 9776
A=A-1 // 9777
M=D // 9778
@51 // 9779
D=A // 9780
@SP // 9781
AM=M+1 // 9782
A=A-1 // 9783
M=D // 9784
@30 // 9785
D=A // 9786
@SP // 9787
AM=M+1 // 9788
A=A-1 // 9789
M=D // 9790
@SP // 9791
AM=M+1 // 9792
A=A-1 // 9793
M=0 // 9794
@SP // 9795
AM=M+1 // 9796
A=A-1 // 9797
M=0 // 9798
// call Output.create
@17 // 9799
D=A // 9800
@14 // 9801
M=D // 9802
@Output.create // 9803
D=A // 9804
@13 // 9805
M=D // 9806
@Output.init.ret.53 // 9807
D=A // 9808
@CALL // 9809
0;JMP // 9810
(Output.init.ret.53)
@SP // 9811
M=M-1 // 9812

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9813
D=A // 9814
@SP // 9815
AM=M+1 // 9816
A=A-1 // 9817
M=D // 9818
@63 // 9819
D=A // 9820
@SP // 9821
AM=M+1 // 9822
A=A-1 // 9823
M=D // 9824
@63 // 9825
D=A // 9826
@SP // 9827
AM=M+1 // 9828
A=A-1 // 9829
M=D // 9830
@45 // 9831
D=A // 9832
@SP // 9833
AM=M+1 // 9834
A=A-1 // 9835
M=D // 9836
@12 // 9837
D=A // 9838
@SP // 9839
AM=M+1 // 9840
A=A-1 // 9841
M=D // 9842
@12 // 9843
D=A // 9844
@SP // 9845
AM=M+1 // 9846
A=A-1 // 9847
M=D // 9848
@12 // 9849
D=A // 9850
@SP // 9851
AM=M+1 // 9852
A=A-1 // 9853
M=D // 9854
@12 // 9855
D=A // 9856
@SP // 9857
AM=M+1 // 9858
A=A-1 // 9859
M=D // 9860
@12 // 9861
D=A // 9862
@SP // 9863
AM=M+1 // 9864
A=A-1 // 9865
M=D // 9866
@30 // 9867
D=A // 9868
@SP // 9869
AM=M+1 // 9870
A=A-1 // 9871
M=D // 9872
@SP // 9873
AM=M+1 // 9874
A=A-1 // 9875
M=0 // 9876
@SP // 9877
AM=M+1 // 9878
A=A-1 // 9879
M=0 // 9880
// call Output.create
@17 // 9881
D=A // 9882
@14 // 9883
M=D // 9884
@Output.create // 9885
D=A // 9886
@13 // 9887
M=D // 9888
@Output.init.ret.54 // 9889
D=A // 9890
@CALL // 9891
0;JMP // 9892
(Output.init.ret.54)
@SP // 9893
M=M-1 // 9894

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9895
D=A // 9896
@SP // 9897
AM=M+1 // 9898
A=A-1 // 9899
M=D // 9900
@51 // 9901
D=A // 9902
@SP // 9903
AM=M+1 // 9904
A=A-1 // 9905
M=D // 9906
@51 // 9907
D=A // 9908
@SP // 9909
AM=M+1 // 9910
A=A-1 // 9911
M=D // 9912
@51 // 9913
D=A // 9914
@SP // 9915
AM=M+1 // 9916
A=A-1 // 9917
M=D // 9918
@51 // 9919
D=A // 9920
@SP // 9921
AM=M+1 // 9922
A=A-1 // 9923
M=D // 9924
@51 // 9925
D=A // 9926
@SP // 9927
AM=M+1 // 9928
A=A-1 // 9929
M=D // 9930
@51 // 9931
D=A // 9932
@SP // 9933
AM=M+1 // 9934
A=A-1 // 9935
M=D // 9936
@51 // 9937
D=A // 9938
@SP // 9939
AM=M+1 // 9940
A=A-1 // 9941
M=D // 9942
@51 // 9943
D=A // 9944
@SP // 9945
AM=M+1 // 9946
A=A-1 // 9947
M=D // 9948
@30 // 9949
D=A // 9950
@SP // 9951
AM=M+1 // 9952
A=A-1 // 9953
M=D // 9954
@SP // 9955
AM=M+1 // 9956
A=A-1 // 9957
M=0 // 9958
@SP // 9959
AM=M+1 // 9960
A=A-1 // 9961
M=0 // 9962
// call Output.create
@17 // 9963
D=A // 9964
@14 // 9965
M=D // 9966
@Output.create // 9967
D=A // 9968
@13 // 9969
M=D // 9970
@Output.init.ret.55 // 9971
D=A // 9972
@CALL // 9973
0;JMP // 9974
(Output.init.ret.55)
@SP // 9975
M=M-1 // 9976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9977
D=A // 9978
@SP // 9979
AM=M+1 // 9980
A=A-1 // 9981
M=D // 9982
@51 // 9983
D=A // 9984
@SP // 9985
AM=M+1 // 9986
A=A-1 // 9987
M=D // 9988
@51 // 9989
D=A // 9990
@SP // 9991
AM=M+1 // 9992
A=A-1 // 9993
M=D // 9994
@51 // 9995
D=A // 9996
@SP // 9997
AM=M+1 // 9998
A=A-1 // 9999
M=D // 10000
@51 // 10001
D=A // 10002
@SP // 10003
AM=M+1 // 10004
A=A-1 // 10005
M=D // 10006
@51 // 10007
D=A // 10008
@SP // 10009
AM=M+1 // 10010
A=A-1 // 10011
M=D // 10012
@30 // 10013
D=A // 10014
@SP // 10015
AM=M+1 // 10016
A=A-1 // 10017
M=D // 10018
@30 // 10019
D=A // 10020
@SP // 10021
AM=M+1 // 10022
A=A-1 // 10023
M=D // 10024
@12 // 10025
D=A // 10026
@SP // 10027
AM=M+1 // 10028
A=A-1 // 10029
M=D // 10030
@12 // 10031
D=A // 10032
@SP // 10033
AM=M+1 // 10034
A=A-1 // 10035
M=D // 10036
@SP // 10037
AM=M+1 // 10038
A=A-1 // 10039
M=0 // 10040
@SP // 10041
AM=M+1 // 10042
A=A-1 // 10043
M=0 // 10044
// call Output.create
@17 // 10045
D=A // 10046
@14 // 10047
M=D // 10048
@Output.create // 10049
D=A // 10050
@13 // 10051
M=D // 10052
@Output.init.ret.56 // 10053
D=A // 10054
@CALL // 10055
0;JMP // 10056
(Output.init.ret.56)
@SP // 10057
M=M-1 // 10058

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10059
D=A // 10060
@SP // 10061
AM=M+1 // 10062
A=A-1 // 10063
M=D // 10064
@51 // 10065
D=A // 10066
@SP // 10067
AM=M+1 // 10068
A=A-1 // 10069
M=D // 10070
@51 // 10071
D=A // 10072
@SP // 10073
AM=M+1 // 10074
A=A-1 // 10075
M=D // 10076
@51 // 10077
D=A // 10078
@SP // 10079
AM=M+1 // 10080
A=A-1 // 10081
M=D // 10082
@51 // 10083
D=A // 10084
@SP // 10085
AM=M+1 // 10086
A=A-1 // 10087
M=D // 10088
@51 // 10089
D=A // 10090
@SP // 10091
AM=M+1 // 10092
A=A-1 // 10093
M=D // 10094
@63 // 10095
D=A // 10096
@SP // 10097
AM=M+1 // 10098
A=A-1 // 10099
M=D // 10100
@63 // 10101
D=A // 10102
@SP // 10103
AM=M+1 // 10104
A=A-1 // 10105
M=D // 10106
@63 // 10107
D=A // 10108
@SP // 10109
AM=M+1 // 10110
A=A-1 // 10111
M=D // 10112
@18 // 10113
D=A // 10114
@SP // 10115
AM=M+1 // 10116
A=A-1 // 10117
M=D // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=0 // 10122
@SP // 10123
AM=M+1 // 10124
A=A-1 // 10125
M=0 // 10126
// call Output.create
@17 // 10127
D=A // 10128
@14 // 10129
M=D // 10130
@Output.create // 10131
D=A // 10132
@13 // 10133
M=D // 10134
@Output.init.ret.57 // 10135
D=A // 10136
@CALL // 10137
0;JMP // 10138
(Output.init.ret.57)
@SP // 10139
M=M-1 // 10140

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10141
D=A // 10142
@SP // 10143
AM=M+1 // 10144
A=A-1 // 10145
M=D // 10146
@51 // 10147
D=A // 10148
@SP // 10149
AM=M+1 // 10150
A=A-1 // 10151
M=D // 10152
@51 // 10153
D=A // 10154
@SP // 10155
AM=M+1 // 10156
A=A-1 // 10157
M=D // 10158
@30 // 10159
D=A // 10160
@SP // 10161
AM=M+1 // 10162
A=A-1 // 10163
M=D // 10164
@30 // 10165
D=A // 10166
@SP // 10167
AM=M+1 // 10168
A=A-1 // 10169
M=D // 10170
@12 // 10171
D=A // 10172
@SP // 10173
AM=M+1 // 10174
A=A-1 // 10175
M=D // 10176
@30 // 10177
D=A // 10178
@SP // 10179
AM=M+1 // 10180
A=A-1 // 10181
M=D // 10182
@30 // 10183
D=A // 10184
@SP // 10185
AM=M+1 // 10186
A=A-1 // 10187
M=D // 10188
@51 // 10189
D=A // 10190
@SP // 10191
AM=M+1 // 10192
A=A-1 // 10193
M=D // 10194
@51 // 10195
D=A // 10196
@SP // 10197
AM=M+1 // 10198
A=A-1 // 10199
M=D // 10200
@SP // 10201
AM=M+1 // 10202
A=A-1 // 10203
M=0 // 10204
@SP // 10205
AM=M+1 // 10206
A=A-1 // 10207
M=0 // 10208
// call Output.create
@17 // 10209
D=A // 10210
@14 // 10211
M=D // 10212
@Output.create // 10213
D=A // 10214
@13 // 10215
M=D // 10216
@Output.init.ret.58 // 10217
D=A // 10218
@CALL // 10219
0;JMP // 10220
(Output.init.ret.58)
@SP // 10221
M=M-1 // 10222

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10223
D=A // 10224
@SP // 10225
AM=M+1 // 10226
A=A-1 // 10227
M=D // 10228
@51 // 10229
D=A // 10230
@SP // 10231
AM=M+1 // 10232
A=A-1 // 10233
M=D // 10234
@51 // 10235
D=A // 10236
@SP // 10237
AM=M+1 // 10238
A=A-1 // 10239
M=D // 10240
@51 // 10241
D=A // 10242
@SP // 10243
AM=M+1 // 10244
A=A-1 // 10245
M=D // 10246
@51 // 10247
D=A // 10248
@SP // 10249
AM=M+1 // 10250
A=A-1 // 10251
M=D // 10252
@30 // 10253
D=A // 10254
@SP // 10255
AM=M+1 // 10256
A=A-1 // 10257
M=D // 10258
@12 // 10259
D=A // 10260
@SP // 10261
AM=M+1 // 10262
A=A-1 // 10263
M=D // 10264
@12 // 10265
D=A // 10266
@SP // 10267
AM=M+1 // 10268
A=A-1 // 10269
M=D // 10270
@12 // 10271
D=A // 10272
@SP // 10273
AM=M+1 // 10274
A=A-1 // 10275
M=D // 10276
@30 // 10277
D=A // 10278
@SP // 10279
AM=M+1 // 10280
A=A-1 // 10281
M=D // 10282
@SP // 10283
AM=M+1 // 10284
A=A-1 // 10285
M=0 // 10286
@SP // 10287
AM=M+1 // 10288
A=A-1 // 10289
M=0 // 10290
// call Output.create
@17 // 10291
D=A // 10292
@14 // 10293
M=D // 10294
@Output.create // 10295
D=A // 10296
@13 // 10297
M=D // 10298
@Output.init.ret.59 // 10299
D=A // 10300
@CALL // 10301
0;JMP // 10302
(Output.init.ret.59)
@SP // 10303
M=M-1 // 10304

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10305
D=A // 10306
@SP // 10307
AM=M+1 // 10308
A=A-1 // 10309
M=D // 10310
@63 // 10311
D=A // 10312
@SP // 10313
AM=M+1 // 10314
A=A-1 // 10315
M=D // 10316
@51 // 10317
D=A // 10318
@SP // 10319
AM=M+1 // 10320
A=A-1 // 10321
M=D // 10322
@49 // 10323
D=A // 10324
@SP // 10325
AM=M+1 // 10326
A=A-1 // 10327
M=D // 10328
@24 // 10329
D=A // 10330
@SP // 10331
AM=M+1 // 10332
A=A-1 // 10333
M=D // 10334
@12 // 10335
D=A // 10336
@SP // 10337
AM=M+1 // 10338
A=A-1 // 10339
M=D // 10340
@6 // 10341
D=A // 10342
@SP // 10343
AM=M+1 // 10344
A=A-1 // 10345
M=D // 10346
@35 // 10347
D=A // 10348
@SP // 10349
AM=M+1 // 10350
A=A-1 // 10351
M=D // 10352
@51 // 10353
D=A // 10354
@SP // 10355
AM=M+1 // 10356
A=A-1 // 10357
M=D // 10358
@63 // 10359
D=A // 10360
@SP // 10361
AM=M+1 // 10362
A=A-1 // 10363
M=D // 10364
@SP // 10365
AM=M+1 // 10366
A=A-1 // 10367
M=0 // 10368
@SP // 10369
AM=M+1 // 10370
A=A-1 // 10371
M=0 // 10372
// call Output.create
@17 // 10373
D=A // 10374
@14 // 10375
M=D // 10376
@Output.create // 10377
D=A // 10378
@13 // 10379
M=D // 10380
@Output.init.ret.60 // 10381
D=A // 10382
@CALL // 10383
0;JMP // 10384
(Output.init.ret.60)
@SP // 10385
M=M-1 // 10386

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10387
D=A // 10388
@SP // 10389
AM=M+1 // 10390
A=A-1 // 10391
M=D // 10392
@30 // 10393
D=A // 10394
@SP // 10395
AM=M+1 // 10396
A=A-1 // 10397
M=D // 10398
@6 // 10399
D=A // 10400
@SP // 10401
AM=M+1 // 10402
A=A-1 // 10403
M=D // 10404
@6 // 10405
D=A // 10406
@SP // 10407
AM=M+1 // 10408
A=A-1 // 10409
M=D // 10410
@6 // 10411
D=A // 10412
@SP // 10413
AM=M+1 // 10414
A=A-1 // 10415
M=D // 10416
@6 // 10417
D=A // 10418
@SP // 10419
AM=M+1 // 10420
A=A-1 // 10421
M=D // 10422
@6 // 10423
D=A // 10424
@SP // 10425
AM=M+1 // 10426
A=A-1 // 10427
M=D // 10428
@6 // 10429
D=A // 10430
@SP // 10431
AM=M+1 // 10432
A=A-1 // 10433
M=D // 10434
@6 // 10435
D=A // 10436
@SP // 10437
AM=M+1 // 10438
A=A-1 // 10439
M=D // 10440
@30 // 10441
D=A // 10442
@SP // 10443
AM=M+1 // 10444
A=A-1 // 10445
M=D // 10446
@SP // 10447
AM=M+1 // 10448
A=A-1 // 10449
M=0 // 10450
@SP // 10451
AM=M+1 // 10452
A=A-1 // 10453
M=0 // 10454
// call Output.create
@17 // 10455
D=A // 10456
@14 // 10457
M=D // 10458
@Output.create // 10459
D=A // 10460
@13 // 10461
M=D // 10462
@Output.init.ret.61 // 10463
D=A // 10464
@CALL // 10465
0;JMP // 10466
(Output.init.ret.61)
@SP // 10467
M=M-1 // 10468

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10469
D=A // 10470
@SP // 10471
M=D+M // 10472
@92 // 10473
D=A // 10474
@SP // 10475
A=M-1 // 10476
M=1 // 10477
A=A-1 // 10478
M=0 // 10479
A=A-1 // 10480
M=0 // 10481
A=A-1 // 10482
M=D // 10483
A=A-1 // 10484
@3 // 10485
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
@12 // 10497
D=A // 10498
@SP // 10499
AM=M+1 // 10500
A=A-1 // 10501
M=D // 10502
@24 // 10503
D=A // 10504
@SP // 10505
AM=M+1 // 10506
A=A-1 // 10507
M=D // 10508
@48 // 10509
D=A // 10510
@SP // 10511
AM=M+1 // 10512
A=A-1 // 10513
M=D // 10514
@32 // 10515
D=A // 10516
@SP // 10517
AM=M+1 // 10518
A=A-1 // 10519
M=D // 10520
@SP // 10521
AM=M+1 // 10522
A=A-1 // 10523
M=0 // 10524
@SP // 10525
AM=M+1 // 10526
A=A-1 // 10527
M=0 // 10528
// call Output.create
@17 // 10529
D=A // 10530
@14 // 10531
M=D // 10532
@Output.create // 10533
D=A // 10534
@13 // 10535
M=D // 10536
@Output.init.ret.62 // 10537
D=A // 10538
@CALL // 10539
0;JMP // 10540
(Output.init.ret.62)
@SP // 10541
M=M-1 // 10542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10543
D=A // 10544
@SP // 10545
AM=M+1 // 10546
A=A-1 // 10547
M=D // 10548
@30 // 10549
D=A // 10550
@SP // 10551
AM=M+1 // 10552
A=A-1 // 10553
M=D // 10554
@24 // 10555
D=A // 10556
@SP // 10557
AM=M+1 // 10558
A=A-1 // 10559
M=D // 10560
@24 // 10561
D=A // 10562
@SP // 10563
AM=M+1 // 10564
A=A-1 // 10565
M=D // 10566
@24 // 10567
D=A // 10568
@SP // 10569
AM=M+1 // 10570
A=A-1 // 10571
M=D // 10572
@24 // 10573
D=A // 10574
@SP // 10575
AM=M+1 // 10576
A=A-1 // 10577
M=D // 10578
@24 // 10579
D=A // 10580
@SP // 10581
AM=M+1 // 10582
A=A-1 // 10583
M=D // 10584
@24 // 10585
D=A // 10586
@SP // 10587
AM=M+1 // 10588
A=A-1 // 10589
M=D // 10590
@24 // 10591
D=A // 10592
@SP // 10593
AM=M+1 // 10594
A=A-1 // 10595
M=D // 10596
@30 // 10597
D=A // 10598
@SP // 10599
AM=M+1 // 10600
A=A-1 // 10601
M=D // 10602
@SP // 10603
AM=M+1 // 10604
A=A-1 // 10605
M=0 // 10606
@SP // 10607
AM=M+1 // 10608
A=A-1 // 10609
M=0 // 10610
// call Output.create
@17 // 10611
D=A // 10612
@14 // 10613
M=D // 10614
@Output.create // 10615
D=A // 10616
@13 // 10617
M=D // 10618
@Output.init.ret.63 // 10619
D=A // 10620
@CALL // 10621
0;JMP // 10622
(Output.init.ret.63)
@SP // 10623
M=M-1 // 10624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10625
D=A // 10626
@SP // 10627
AM=M+1 // 10628
A=A-1 // 10629
M=D // 10630
@8 // 10631
D=A // 10632
@SP // 10633
AM=M+1 // 10634
A=A-1 // 10635
M=D // 10636
@28 // 10637
D=A // 10638
@SP // 10639
AM=M+1 // 10640
A=A-1 // 10641
M=D // 10642
@54 // 10643
D=A // 10644
@SP // 10645
AM=M+1 // 10646
A=A-1 // 10647
M=D // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=0 // 10652
@SP // 10653
AM=M+1 // 10654
A=A-1 // 10655
M=0 // 10656
@SP // 10657
AM=M+1 // 10658
A=A-1 // 10659
M=0 // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=0 // 10664
@SP // 10665
AM=M+1 // 10666
A=A-1 // 10667
M=0 // 10668
@SP // 10669
AM=M+1 // 10670
A=A-1 // 10671
M=0 // 10672
@SP // 10673
AM=M+1 // 10674
A=A-1 // 10675
M=0 // 10676
@SP // 10677
AM=M+1 // 10678
A=A-1 // 10679
M=0 // 10680
// call Output.create
@17 // 10681
D=A // 10682
@14 // 10683
M=D // 10684
@Output.create // 10685
D=A // 10686
@13 // 10687
M=D // 10688
@Output.init.ret.64 // 10689
D=A // 10690
@CALL // 10691
0;JMP // 10692
(Output.init.ret.64)
@SP // 10693
M=M-1 // 10694

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10695
D=A // 10696
@SP // 10697
M=D+M // 10698
@95 // 10699
D=A // 10700
@SP // 10701
A=M-1 // 10702
M=0 // 10703
A=A-1 // 10704
M=0 // 10705
A=A-1 // 10706
M=0 // 10707
A=A-1 // 10708
M=0 // 10709
A=A-1 // 10710
M=0 // 10711
A=A-1 // 10712
M=0 // 10713
A=A-1 // 10714
M=0 // 10715
A=A-1 // 10716
M=0 // 10717
A=A-1 // 10718
M=0 // 10719
A=A-1 // 10720
M=D // 10721
A=A-1 // 10722
@2 // 10723
D=A // 10724
@SP // 10725
M=D+M // 10726
@63 // 10727
D=A // 10728
@SP // 10729
A=M-1 // 10730
M=0 // 10731
A=A-1 // 10732
M=D // 10733
A=A-1 // 10734
// call Output.create
@17 // 10735
D=A // 10736
@14 // 10737
M=D // 10738
@Output.create // 10739
D=A // 10740
@13 // 10741
M=D // 10742
@Output.init.ret.65 // 10743
D=A // 10744
@CALL // 10745
0;JMP // 10746
(Output.init.ret.65)
@SP // 10747
M=M-1 // 10748

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10749
D=A // 10750
@SP // 10751
AM=M+1 // 10752
A=A-1 // 10753
M=D // 10754
@6 // 10755
D=A // 10756
@SP // 10757
AM=M+1 // 10758
A=A-1 // 10759
M=D // 10760
@12 // 10761
D=A // 10762
@SP // 10763
AM=M+1 // 10764
A=A-1 // 10765
M=D // 10766
@24 // 10767
D=A // 10768
@SP // 10769
AM=M+1 // 10770
A=A-1 // 10771
M=D // 10772
@SP // 10773
AM=M+1 // 10774
A=A-1 // 10775
M=0 // 10776
@SP // 10777
AM=M+1 // 10778
A=A-1 // 10779
M=0 // 10780
@SP // 10781
AM=M+1 // 10782
A=A-1 // 10783
M=0 // 10784
@SP // 10785
AM=M+1 // 10786
A=A-1 // 10787
M=0 // 10788
@SP // 10789
AM=M+1 // 10790
A=A-1 // 10791
M=0 // 10792
@SP // 10793
AM=M+1 // 10794
A=A-1 // 10795
M=0 // 10796
@SP // 10797
AM=M+1 // 10798
A=A-1 // 10799
M=0 // 10800
@SP // 10801
AM=M+1 // 10802
A=A-1 // 10803
M=0 // 10804
// call Output.create
@17 // 10805
D=A // 10806
@14 // 10807
M=D // 10808
@Output.create // 10809
D=A // 10810
@13 // 10811
M=D // 10812
@Output.init.ret.66 // 10813
D=A // 10814
@CALL // 10815
0;JMP // 10816
(Output.init.ret.66)
@SP // 10817
M=M-1 // 10818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10819
D=A // 10820
@SP // 10821
M=D+M // 10822
@97 // 10823
D=A // 10824
@SP // 10825
A=M-1 // 10826
M=0 // 10827
A=A-1 // 10828
M=0 // 10829
A=A-1 // 10830
M=0 // 10831
A=A-1 // 10832
M=D // 10833
A=A-1 // 10834
@14 // 10835
D=A // 10836
@SP // 10837
AM=M+1 // 10838
A=A-1 // 10839
M=D // 10840
@24 // 10841
D=A // 10842
@SP // 10843
AM=M+1 // 10844
A=A-1 // 10845
M=D // 10846
@30 // 10847
D=A // 10848
@SP // 10849
AM=M+1 // 10850
A=A-1 // 10851
M=D // 10852
@27 // 10853
D=A // 10854
@SP // 10855
AM=M+1 // 10856
A=A-1 // 10857
M=D // 10858
@27 // 10859
D=A // 10860
@SP // 10861
AM=M+1 // 10862
A=A-1 // 10863
M=D // 10864
@54 // 10865
D=A // 10866
@SP // 10867
AM=M+1 // 10868
A=A-1 // 10869
M=D // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=0 // 10874
@SP // 10875
AM=M+1 // 10876
A=A-1 // 10877
M=0 // 10878
// call Output.create
@17 // 10879
D=A // 10880
@14 // 10881
M=D // 10882
@Output.create // 10883
D=A // 10884
@13 // 10885
M=D // 10886
@Output.init.ret.67 // 10887
D=A // 10888
@CALL // 10889
0;JMP // 10890
(Output.init.ret.67)
@SP // 10891
M=M-1 // 10892

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10893
D=A // 10894
@SP // 10895
AM=M+1 // 10896
A=A-1 // 10897
M=D // 10898
@3 // 10899
D=A // 10900
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=D // 10904
@3 // 10905
D=A // 10906
@SP // 10907
AM=M+1 // 10908
A=A-1 // 10909
M=D // 10910
@3 // 10911
D=A // 10912
@SP // 10913
AM=M+1 // 10914
A=A-1 // 10915
M=D // 10916
@15 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922
@27 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928
@51 // 10929
D=A // 10930
@SP // 10931
AM=M+1 // 10932
A=A-1 // 10933
M=D // 10934
@51 // 10935
D=A // 10936
@SP // 10937
AM=M+1 // 10938
A=A-1 // 10939
M=D // 10940
@51 // 10941
D=A // 10942
@SP // 10943
AM=M+1 // 10944
A=A-1 // 10945
M=D // 10946
@30 // 10947
D=A // 10948
@SP // 10949
AM=M+1 // 10950
A=A-1 // 10951
M=D // 10952
@SP // 10953
AM=M+1 // 10954
A=A-1 // 10955
M=0 // 10956
@SP // 10957
AM=M+1 // 10958
A=A-1 // 10959
M=0 // 10960
// call Output.create
@17 // 10961
D=A // 10962
@14 // 10963
M=D // 10964
@Output.create // 10965
D=A // 10966
@13 // 10967
M=D // 10968
@Output.init.ret.68 // 10969
D=A // 10970
@CALL // 10971
0;JMP // 10972
(Output.init.ret.68)
@SP // 10973
M=M-1 // 10974

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10975
D=A // 10976
@SP // 10977
M=D+M // 10978
@99 // 10979
D=A // 10980
@SP // 10981
A=M-1 // 10982
M=0 // 10983
A=A-1 // 10984
M=0 // 10985
A=A-1 // 10986
M=0 // 10987
A=A-1 // 10988
M=D // 10989
A=A-1 // 10990
@30 // 10991
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
@3 // 11003
D=A // 11004
@SP // 11005
AM=M+1 // 11006
A=A-1 // 11007
M=D // 11008
@3 // 11009
D=A // 11010
@SP // 11011
AM=M+1 // 11012
A=A-1 // 11013
M=D // 11014
@51 // 11015
D=A // 11016
@SP // 11017
AM=M+1 // 11018
A=A-1 // 11019
M=D // 11020
@30 // 11021
D=A // 11022
@SP // 11023
AM=M+1 // 11024
A=A-1 // 11025
M=D // 11026
@SP // 11027
AM=M+1 // 11028
A=A-1 // 11029
M=0 // 11030
@SP // 11031
AM=M+1 // 11032
A=A-1 // 11033
M=0 // 11034
// call Output.create
@17 // 11035
D=A // 11036
@14 // 11037
M=D // 11038
@Output.create // 11039
D=A // 11040
@13 // 11041
M=D // 11042
@Output.init.ret.69 // 11043
D=A // 11044
@CALL // 11045
0;JMP // 11046
(Output.init.ret.69)
@SP // 11047
M=M-1 // 11048

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11049
D=A // 11050
@SP // 11051
AM=M+1 // 11052
A=A-1 // 11053
M=D // 11054
@48 // 11055
D=A // 11056
@SP // 11057
AM=M+1 // 11058
A=A-1 // 11059
M=D // 11060
@48 // 11061
D=A // 11062
@SP // 11063
AM=M+1 // 11064
A=A-1 // 11065
M=D // 11066
@48 // 11067
D=A // 11068
@SP // 11069
AM=M+1 // 11070
A=A-1 // 11071
M=D // 11072
@60 // 11073
D=A // 11074
@SP // 11075
AM=M+1 // 11076
A=A-1 // 11077
M=D // 11078
@54 // 11079
D=A // 11080
@SP // 11081
AM=M+1 // 11082
A=A-1 // 11083
M=D // 11084
@51 // 11085
D=A // 11086
@SP // 11087
AM=M+1 // 11088
A=A-1 // 11089
M=D // 11090
@51 // 11091
D=A // 11092
@SP // 11093
AM=M+1 // 11094
A=A-1 // 11095
M=D // 11096
@51 // 11097
D=A // 11098
@SP // 11099
AM=M+1 // 11100
A=A-1 // 11101
M=D // 11102
@30 // 11103
D=A // 11104
@SP // 11105
AM=M+1 // 11106
A=A-1 // 11107
M=D // 11108
@SP // 11109
AM=M+1 // 11110
A=A-1 // 11111
M=0 // 11112
@SP // 11113
AM=M+1 // 11114
A=A-1 // 11115
M=0 // 11116
// call Output.create
@17 // 11117
D=A // 11118
@14 // 11119
M=D // 11120
@Output.create // 11121
D=A // 11122
@13 // 11123
M=D // 11124
@Output.init.ret.70 // 11125
D=A // 11126
@CALL // 11127
0;JMP // 11128
(Output.init.ret.70)
@SP // 11129
M=M-1 // 11130

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11131
D=A // 11132
@SP // 11133
M=D+M // 11134
@101 // 11135
D=A // 11136
@SP // 11137
A=M-1 // 11138
M=0 // 11139
A=A-1 // 11140
M=0 // 11141
A=A-1 // 11142
M=0 // 11143
A=A-1 // 11144
M=D // 11145
A=A-1 // 11146
@30 // 11147
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
@63 // 11159
D=A // 11160
@SP // 11161
AM=M+1 // 11162
A=A-1 // 11163
M=D // 11164
@3 // 11165
D=A // 11166
@SP // 11167
AM=M+1 // 11168
A=A-1 // 11169
M=D // 11170
@51 // 11171
D=A // 11172
@SP // 11173
AM=M+1 // 11174
A=A-1 // 11175
M=D // 11176
@30 // 11177
D=A // 11178
@SP // 11179
AM=M+1 // 11180
A=A-1 // 11181
M=D // 11182
@SP // 11183
AM=M+1 // 11184
A=A-1 // 11185
M=0 // 11186
@SP // 11187
AM=M+1 // 11188
A=A-1 // 11189
M=0 // 11190
// call Output.create
@17 // 11191
D=A // 11192
@14 // 11193
M=D // 11194
@Output.create // 11195
D=A // 11196
@13 // 11197
M=D // 11198
@Output.init.ret.71 // 11199
D=A // 11200
@CALL // 11201
0;JMP // 11202
(Output.init.ret.71)
@SP // 11203
M=M-1 // 11204

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11205
D=A // 11206
@SP // 11207
AM=M+1 // 11208
A=A-1 // 11209
M=D // 11210
@28 // 11211
D=A // 11212
@SP // 11213
AM=M+1 // 11214
A=A-1 // 11215
M=D // 11216
@54 // 11217
D=A // 11218
@SP // 11219
AM=M+1 // 11220
A=A-1 // 11221
M=D // 11222
@38 // 11223
D=A // 11224
@SP // 11225
AM=M+1 // 11226
A=A-1 // 11227
M=D // 11228
@6 // 11229
D=A // 11230
@SP // 11231
AM=M+1 // 11232
A=A-1 // 11233
M=D // 11234
@15 // 11235
D=A // 11236
@SP // 11237
AM=M+1 // 11238
A=A-1 // 11239
M=D // 11240
@6 // 11241
D=A // 11242
@SP // 11243
AM=M+1 // 11244
A=A-1 // 11245
M=D // 11246
@6 // 11247
D=A // 11248
@SP // 11249
AM=M+1 // 11250
A=A-1 // 11251
M=D // 11252
@6 // 11253
D=A // 11254
@SP // 11255
AM=M+1 // 11256
A=A-1 // 11257
M=D // 11258
@15 // 11259
D=A // 11260
@SP // 11261
AM=M+1 // 11262
A=A-1 // 11263
M=D // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=0 // 11268
@SP // 11269
AM=M+1 // 11270
A=A-1 // 11271
M=0 // 11272
// call Output.create
@17 // 11273
D=A // 11274
@14 // 11275
M=D // 11276
@Output.create // 11277
D=A // 11278
@13 // 11279
M=D // 11280
@Output.init.ret.72 // 11281
D=A // 11282
@CALL // 11283
0;JMP // 11284
(Output.init.ret.72)
@SP // 11285
M=M-1 // 11286

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11287
D=A // 11288
@SP // 11289
M=D+M // 11290
@103 // 11291
D=A // 11292
@SP // 11293
A=M-1 // 11294
M=0 // 11295
A=A-1 // 11296
M=0 // 11297
A=A-1 // 11298
M=D // 11299
A=A-1 // 11300
@30 // 11301
D=A // 11302
@SP // 11303
AM=M+1 // 11304
A=A-1 // 11305
M=D // 11306
@51 // 11307
D=A // 11308
@SP // 11309
AM=M+1 // 11310
A=A-1 // 11311
M=D // 11312
@51 // 11313
D=A // 11314
@SP // 11315
AM=M+1 // 11316
A=A-1 // 11317
M=D // 11318
@51 // 11319
D=A // 11320
@SP // 11321
AM=M+1 // 11322
A=A-1 // 11323
M=D // 11324
@62 // 11325
D=A // 11326
@SP // 11327
AM=M+1 // 11328
A=A-1 // 11329
M=D // 11330
@48 // 11331
D=A // 11332
@SP // 11333
AM=M+1 // 11334
A=A-1 // 11335
M=D // 11336
@51 // 11337
D=A // 11338
@SP // 11339
AM=M+1 // 11340
A=A-1 // 11341
M=D // 11342
@30 // 11343
D=A // 11344
@SP // 11345
AM=M+1 // 11346
A=A-1 // 11347
M=D // 11348
@SP // 11349
AM=M+1 // 11350
A=A-1 // 11351
M=0 // 11352
// call Output.create
@17 // 11353
D=A // 11354
@14 // 11355
M=D // 11356
@Output.create // 11357
D=A // 11358
@13 // 11359
M=D // 11360
@Output.init.ret.73 // 11361
D=A // 11362
@CALL // 11363
0;JMP // 11364
(Output.init.ret.73)
@SP // 11365
M=M-1 // 11366

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11367
D=A // 11368
@SP // 11369
AM=M+1 // 11370
A=A-1 // 11371
M=D // 11372
@3 // 11373
D=A // 11374
@SP // 11375
AM=M+1 // 11376
A=A-1 // 11377
M=D // 11378
@3 // 11379
D=A // 11380
@SP // 11381
AM=M+1 // 11382
A=A-1 // 11383
M=D // 11384
@3 // 11385
D=A // 11386
@SP // 11387
AM=M+1 // 11388
A=A-1 // 11389
M=D // 11390
@27 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396
@55 // 11397
D=A // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=D // 11402
@51 // 11403
D=A // 11404
@SP // 11405
AM=M+1 // 11406
A=A-1 // 11407
M=D // 11408
@51 // 11409
D=A // 11410
@SP // 11411
AM=M+1 // 11412
A=A-1 // 11413
M=D // 11414
@51 // 11415
D=A // 11416
@SP // 11417
AM=M+1 // 11418
A=A-1 // 11419
M=D // 11420
@51 // 11421
D=A // 11422
@SP // 11423
AM=M+1 // 11424
A=A-1 // 11425
M=D // 11426
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=0 // 11430
@SP // 11431
AM=M+1 // 11432
A=A-1 // 11433
M=0 // 11434
// call Output.create
@17 // 11435
D=A // 11436
@14 // 11437
M=D // 11438
@Output.create // 11439
D=A // 11440
@13 // 11441
M=D // 11442
@Output.init.ret.74 // 11443
D=A // 11444
@CALL // 11445
0;JMP // 11446
(Output.init.ret.74)
@SP // 11447
M=M-1 // 11448

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11449
D=A // 11450
@SP // 11451
AM=M+1 // 11452
A=A-1 // 11453
M=D // 11454
@12 // 11455
D=A // 11456
@SP // 11457
AM=M+1 // 11458
A=A-1 // 11459
M=D // 11460
@12 // 11461
D=A // 11462
@SP // 11463
AM=M+1 // 11464
A=A-1 // 11465
M=D // 11466
@SP // 11467
AM=M+1 // 11468
A=A-1 // 11469
M=0 // 11470
@14 // 11471
D=A // 11472
@SP // 11473
AM=M+1 // 11474
A=A-1 // 11475
M=D // 11476
@12 // 11477
D=A // 11478
@SP // 11479
AM=M+1 // 11480
A=A-1 // 11481
M=D // 11482
@12 // 11483
D=A // 11484
@SP // 11485
AM=M+1 // 11486
A=A-1 // 11487
M=D // 11488
@12 // 11489
D=A // 11490
@SP // 11491
AM=M+1 // 11492
A=A-1 // 11493
M=D // 11494
@12 // 11495
D=A // 11496
@SP // 11497
AM=M+1 // 11498
A=A-1 // 11499
M=D // 11500
@30 // 11501
D=A // 11502
@SP // 11503
AM=M+1 // 11504
A=A-1 // 11505
M=D // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=0 // 11510
@SP // 11511
AM=M+1 // 11512
A=A-1 // 11513
M=0 // 11514
// call Output.create
@17 // 11515
D=A // 11516
@14 // 11517
M=D // 11518
@Output.create // 11519
D=A // 11520
@13 // 11521
M=D // 11522
@Output.init.ret.75 // 11523
D=A // 11524
@CALL // 11525
0;JMP // 11526
(Output.init.ret.75)
@SP // 11527
M=M-1 // 11528

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11529
D=A // 11530
@SP // 11531
AM=M+1 // 11532
A=A-1 // 11533
M=D // 11534
@48 // 11535
D=A // 11536
@SP // 11537
AM=M+1 // 11538
A=A-1 // 11539
M=D // 11540
@48 // 11541
D=A // 11542
@SP // 11543
AM=M+1 // 11544
A=A-1 // 11545
M=D // 11546
@SP // 11547
AM=M+1 // 11548
A=A-1 // 11549
M=0 // 11550
@56 // 11551
D=A // 11552
@SP // 11553
AM=M+1 // 11554
A=A-1 // 11555
M=D // 11556
@48 // 11557
D=A // 11558
@SP // 11559
AM=M+1 // 11560
A=A-1 // 11561
M=D // 11562
@48 // 11563
D=A // 11564
@SP // 11565
AM=M+1 // 11566
A=A-1 // 11567
M=D // 11568
@48 // 11569
D=A // 11570
@SP // 11571
AM=M+1 // 11572
A=A-1 // 11573
M=D // 11574
@48 // 11575
D=A // 11576
@SP // 11577
AM=M+1 // 11578
A=A-1 // 11579
M=D // 11580
@51 // 11581
D=A // 11582
@SP // 11583
AM=M+1 // 11584
A=A-1 // 11585
M=D // 11586
@30 // 11587
D=A // 11588
@SP // 11589
AM=M+1 // 11590
A=A-1 // 11591
M=D // 11592
@SP // 11593
AM=M+1 // 11594
A=A-1 // 11595
M=0 // 11596
// call Output.create
@17 // 11597
D=A // 11598
@14 // 11599
M=D // 11600
@Output.create // 11601
D=A // 11602
@13 // 11603
M=D // 11604
@Output.init.ret.76 // 11605
D=A // 11606
@CALL // 11607
0;JMP // 11608
(Output.init.ret.76)
@SP // 11609
M=M-1 // 11610

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11611
D=A // 11612
@SP // 11613
AM=M+1 // 11614
A=A-1 // 11615
M=D // 11616
@3 // 11617
D=A // 11618
@SP // 11619
AM=M+1 // 11620
A=A-1 // 11621
M=D // 11622
@3 // 11623
D=A // 11624
@SP // 11625
AM=M+1 // 11626
A=A-1 // 11627
M=D // 11628
@3 // 11629
D=A // 11630
@SP // 11631
AM=M+1 // 11632
A=A-1 // 11633
M=D // 11634
@51 // 11635
D=A // 11636
@SP // 11637
AM=M+1 // 11638
A=A-1 // 11639
M=D // 11640
@27 // 11641
D=A // 11642
@SP // 11643
AM=M+1 // 11644
A=A-1 // 11645
M=D // 11646
@15 // 11647
D=A // 11648
@SP // 11649
AM=M+1 // 11650
A=A-1 // 11651
M=D // 11652
@15 // 11653
D=A // 11654
@SP // 11655
AM=M+1 // 11656
A=A-1 // 11657
M=D // 11658
@27 // 11659
D=A // 11660
@SP // 11661
AM=M+1 // 11662
A=A-1 // 11663
M=D // 11664
@51 // 11665
D=A // 11666
@SP // 11667
AM=M+1 // 11668
A=A-1 // 11669
M=D // 11670
@SP // 11671
AM=M+1 // 11672
A=A-1 // 11673
M=0 // 11674
@SP // 11675
AM=M+1 // 11676
A=A-1 // 11677
M=0 // 11678
// call Output.create
@17 // 11679
D=A // 11680
@14 // 11681
M=D // 11682
@Output.create // 11683
D=A // 11684
@13 // 11685
M=D // 11686
@Output.init.ret.77 // 11687
D=A // 11688
@CALL // 11689
0;JMP // 11690
(Output.init.ret.77)
@SP // 11691
M=M-1 // 11692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11693
D=A // 11694
@SP // 11695
AM=M+1 // 11696
A=A-1 // 11697
M=D // 11698
@14 // 11699
D=A // 11700
@SP // 11701
AM=M+1 // 11702
A=A-1 // 11703
M=D // 11704
@12 // 11705
D=A // 11706
@SP // 11707
AM=M+1 // 11708
A=A-1 // 11709
M=D // 11710
@12 // 11711
D=A // 11712
@SP // 11713
AM=M+1 // 11714
A=A-1 // 11715
M=D // 11716
@12 // 11717
D=A // 11718
@SP // 11719
AM=M+1 // 11720
A=A-1 // 11721
M=D // 11722
@12 // 11723
D=A // 11724
@SP // 11725
AM=M+1 // 11726
A=A-1 // 11727
M=D // 11728
@12 // 11729
D=A // 11730
@SP // 11731
AM=M+1 // 11732
A=A-1 // 11733
M=D // 11734
@12 // 11735
D=A // 11736
@SP // 11737
AM=M+1 // 11738
A=A-1 // 11739
M=D // 11740
@12 // 11741
D=A // 11742
@SP // 11743
AM=M+1 // 11744
A=A-1 // 11745
M=D // 11746
@30 // 11747
D=A // 11748
@SP // 11749
AM=M+1 // 11750
A=A-1 // 11751
M=D // 11752
@SP // 11753
AM=M+1 // 11754
A=A-1 // 11755
M=0 // 11756
@SP // 11757
AM=M+1 // 11758
A=A-1 // 11759
M=0 // 11760
// call Output.create
@17 // 11761
D=A // 11762
@14 // 11763
M=D // 11764
@Output.create // 11765
D=A // 11766
@13 // 11767
M=D // 11768
@Output.init.ret.78 // 11769
D=A // 11770
@CALL // 11771
0;JMP // 11772
(Output.init.ret.78)
@SP // 11773
M=M-1 // 11774

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11775
D=A // 11776
@SP // 11777
M=D+M // 11778
@109 // 11779
D=A // 11780
@SP // 11781
A=M-1 // 11782
M=0 // 11783
A=A-1 // 11784
M=0 // 11785
A=A-1 // 11786
M=0 // 11787
A=A-1 // 11788
M=D // 11789
A=A-1 // 11790
@29 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796
@63 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802
@43 // 11803
D=A // 11804
@SP // 11805
AM=M+1 // 11806
A=A-1 // 11807
M=D // 11808
@43 // 11809
D=A // 11810
@SP // 11811
AM=M+1 // 11812
A=A-1 // 11813
M=D // 11814
@43 // 11815
D=A // 11816
@SP // 11817
AM=M+1 // 11818
A=A-1 // 11819
M=D // 11820
@43 // 11821
D=A // 11822
@SP // 11823
AM=M+1 // 11824
A=A-1 // 11825
M=D // 11826
@SP // 11827
AM=M+1 // 11828
A=A-1 // 11829
M=0 // 11830
@SP // 11831
AM=M+1 // 11832
A=A-1 // 11833
M=0 // 11834
// call Output.create
@17 // 11835
D=A // 11836
@14 // 11837
M=D // 11838
@Output.create // 11839
D=A // 11840
@13 // 11841
M=D // 11842
@Output.init.ret.79 // 11843
D=A // 11844
@CALL // 11845
0;JMP // 11846
(Output.init.ret.79)
@SP // 11847
M=M-1 // 11848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11849
D=A // 11850
@SP // 11851
M=D+M // 11852
@110 // 11853
D=A // 11854
@SP // 11855
A=M-1 // 11856
M=0 // 11857
A=A-1 // 11858
M=0 // 11859
A=A-1 // 11860
M=0 // 11861
A=A-1 // 11862
M=D // 11863
A=A-1 // 11864
@29 // 11865
D=A // 11866
@SP // 11867
AM=M+1 // 11868
A=A-1 // 11869
M=D // 11870
@51 // 11871
D=A // 11872
@SP // 11873
AM=M+1 // 11874
A=A-1 // 11875
M=D // 11876
@51 // 11877
D=A // 11878
@SP // 11879
AM=M+1 // 11880
A=A-1 // 11881
M=D // 11882
@51 // 11883
D=A // 11884
@SP // 11885
AM=M+1 // 11886
A=A-1 // 11887
M=D // 11888
@51 // 11889
D=A // 11890
@SP // 11891
AM=M+1 // 11892
A=A-1 // 11893
M=D // 11894
@51 // 11895
D=A // 11896
@SP // 11897
AM=M+1 // 11898
A=A-1 // 11899
M=D // 11900
@SP // 11901
AM=M+1 // 11902
A=A-1 // 11903
M=0 // 11904
@SP // 11905
AM=M+1 // 11906
A=A-1 // 11907
M=0 // 11908
// call Output.create
@17 // 11909
D=A // 11910
@14 // 11911
M=D // 11912
@Output.create // 11913
D=A // 11914
@13 // 11915
M=D // 11916
@Output.init.ret.80 // 11917
D=A // 11918
@CALL // 11919
0;JMP // 11920
(Output.init.ret.80)
@SP // 11921
M=M-1 // 11922

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11923
D=A // 11924
@SP // 11925
M=D+M // 11926
@111 // 11927
D=A // 11928
@SP // 11929
A=M-1 // 11930
M=0 // 11931
A=A-1 // 11932
M=0 // 11933
A=A-1 // 11934
M=0 // 11935
A=A-1 // 11936
M=D // 11937
A=A-1 // 11938
@30 // 11939
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
@30 // 11969
D=A // 11970
@SP // 11971
AM=M+1 // 11972
A=A-1 // 11973
M=D // 11974
@SP // 11975
AM=M+1 // 11976
A=A-1 // 11977
M=0 // 11978
@SP // 11979
AM=M+1 // 11980
A=A-1 // 11981
M=0 // 11982
// call Output.create
@17 // 11983
D=A // 11984
@14 // 11985
M=D // 11986
@Output.create // 11987
D=A // 11988
@13 // 11989
M=D // 11990
@Output.init.ret.81 // 11991
D=A // 11992
@CALL // 11993
0;JMP // 11994
(Output.init.ret.81)
@SP // 11995
M=M-1 // 11996

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11997
D=A // 11998
@SP // 11999
M=D+M // 12000
@112 // 12001
D=A // 12002
@SP // 12003
A=M-1 // 12004
M=0 // 12005
A=A-1 // 12006
M=0 // 12007
A=A-1 // 12008
M=0 // 12009
A=A-1 // 12010
M=D // 12011
A=A-1 // 12012
@30 // 12013
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
@31 // 12037
D=A // 12038
@SP // 12039
AM=M+1 // 12040
A=A-1 // 12041
M=D // 12042
@3 // 12043
D=A // 12044
@SP // 12045
AM=M+1 // 12046
A=A-1 // 12047
M=D // 12048
@3 // 12049
D=A // 12050
@SP // 12051
AM=M+1 // 12052
A=A-1 // 12053
M=D // 12054
@SP // 12055
AM=M+1 // 12056
A=A-1 // 12057
M=0 // 12058
// call Output.create
@17 // 12059
D=A // 12060
@14 // 12061
M=D // 12062
@Output.create // 12063
D=A // 12064
@13 // 12065
M=D // 12066
@Output.init.ret.82 // 12067
D=A // 12068
@CALL // 12069
0;JMP // 12070
(Output.init.ret.82)
@SP // 12071
M=M-1 // 12072

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12073
D=A // 12074
@SP // 12075
M=D+M // 12076
@113 // 12077
D=A // 12078
@SP // 12079
A=M-1 // 12080
M=0 // 12081
A=A-1 // 12082
M=0 // 12083
A=A-1 // 12084
M=0 // 12085
A=A-1 // 12086
M=D // 12087
A=A-1 // 12088
@30 // 12089
D=A // 12090
@SP // 12091
AM=M+1 // 12092
A=A-1 // 12093
M=D // 12094
@51 // 12095
D=A // 12096
@SP // 12097
AM=M+1 // 12098
A=A-1 // 12099
M=D // 12100
@51 // 12101
D=A // 12102
@SP // 12103
AM=M+1 // 12104
A=A-1 // 12105
M=D // 12106
@51 // 12107
D=A // 12108
@SP // 12109
AM=M+1 // 12110
A=A-1 // 12111
M=D // 12112
@62 // 12113
D=A // 12114
@SP // 12115
AM=M+1 // 12116
A=A-1 // 12117
M=D // 12118
@48 // 12119
D=A // 12120
@SP // 12121
AM=M+1 // 12122
A=A-1 // 12123
M=D // 12124
@48 // 12125
D=A // 12126
@SP // 12127
AM=M+1 // 12128
A=A-1 // 12129
M=D // 12130
@SP // 12131
AM=M+1 // 12132
A=A-1 // 12133
M=0 // 12134
// call Output.create
@17 // 12135
D=A // 12136
@14 // 12137
M=D // 12138
@Output.create // 12139
D=A // 12140
@13 // 12141
M=D // 12142
@Output.init.ret.83 // 12143
D=A // 12144
@CALL // 12145
0;JMP // 12146
(Output.init.ret.83)
@SP // 12147
M=M-1 // 12148

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12149
D=A // 12150
@SP // 12151
M=D+M // 12152
@114 // 12153
D=A // 12154
@SP // 12155
A=M-1 // 12156
M=0 // 12157
A=A-1 // 12158
M=0 // 12159
A=A-1 // 12160
M=0 // 12161
A=A-1 // 12162
M=D // 12163
A=A-1 // 12164
@29 // 12165
D=A // 12166
@SP // 12167
AM=M+1 // 12168
A=A-1 // 12169
M=D // 12170
@55 // 12171
D=A // 12172
@SP // 12173
AM=M+1 // 12174
A=A-1 // 12175
M=D // 12176
@51 // 12177
D=A // 12178
@SP // 12179
AM=M+1 // 12180
A=A-1 // 12181
M=D // 12182
@3 // 12183
D=A // 12184
@SP // 12185
AM=M+1 // 12186
A=A-1 // 12187
M=D // 12188
@3 // 12189
D=A // 12190
@SP // 12191
AM=M+1 // 12192
A=A-1 // 12193
M=D // 12194
@7 // 12195
D=A // 12196
@SP // 12197
AM=M+1 // 12198
A=A-1 // 12199
M=D // 12200
@SP // 12201
AM=M+1 // 12202
A=A-1 // 12203
M=0 // 12204
@SP // 12205
AM=M+1 // 12206
A=A-1 // 12207
M=0 // 12208
// call Output.create
@17 // 12209
D=A // 12210
@14 // 12211
M=D // 12212
@Output.create // 12213
D=A // 12214
@13 // 12215
M=D // 12216
@Output.init.ret.84 // 12217
D=A // 12218
@CALL // 12219
0;JMP // 12220
(Output.init.ret.84)
@SP // 12221
M=M-1 // 12222

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12223
D=A // 12224
@SP // 12225
M=D+M // 12226
@115 // 12227
D=A // 12228
@SP // 12229
A=M-1 // 12230
M=0 // 12231
A=A-1 // 12232
M=0 // 12233
A=A-1 // 12234
M=0 // 12235
A=A-1 // 12236
M=D // 12237
A=A-1 // 12238
@30 // 12239
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
@6 // 12251
D=A // 12252
@SP // 12253
AM=M+1 // 12254
A=A-1 // 12255
M=D // 12256
@24 // 12257
D=A // 12258
@SP // 12259
AM=M+1 // 12260
A=A-1 // 12261
M=D // 12262
@51 // 12263
D=A // 12264
@SP // 12265
AM=M+1 // 12266
A=A-1 // 12267
M=D // 12268
@30 // 12269
D=A // 12270
@SP // 12271
AM=M+1 // 12272
A=A-1 // 12273
M=D // 12274
@SP // 12275
AM=M+1 // 12276
A=A-1 // 12277
M=0 // 12278
@SP // 12279
AM=M+1 // 12280
A=A-1 // 12281
M=0 // 12282
// call Output.create
@17 // 12283
D=A // 12284
@14 // 12285
M=D // 12286
@Output.create // 12287
D=A // 12288
@13 // 12289
M=D // 12290
@Output.init.ret.85 // 12291
D=A // 12292
@CALL // 12293
0;JMP // 12294
(Output.init.ret.85)
@SP // 12295
M=M-1 // 12296

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12297
D=A // 12298
@SP // 12299
AM=M+1 // 12300
A=A-1 // 12301
M=D // 12302
@4 // 12303
D=A // 12304
@SP // 12305
AM=M+1 // 12306
A=A-1 // 12307
M=D // 12308
@6 // 12309
D=A // 12310
@SP // 12311
AM=M+1 // 12312
A=A-1 // 12313
M=D // 12314
@6 // 12315
D=A // 12316
@SP // 12317
AM=M+1 // 12318
A=A-1 // 12319
M=D // 12320
@15 // 12321
D=A // 12322
@SP // 12323
AM=M+1 // 12324
A=A-1 // 12325
M=D // 12326
@6 // 12327
D=A // 12328
@SP // 12329
AM=M+1 // 12330
A=A-1 // 12331
M=D // 12332
@6 // 12333
D=A // 12334
@SP // 12335
AM=M+1 // 12336
A=A-1 // 12337
M=D // 12338
@6 // 12339
D=A // 12340
@SP // 12341
AM=M+1 // 12342
A=A-1 // 12343
M=D // 12344
@54 // 12345
D=A // 12346
@SP // 12347
AM=M+1 // 12348
A=A-1 // 12349
M=D // 12350
@28 // 12351
D=A // 12352
@SP // 12353
AM=M+1 // 12354
A=A-1 // 12355
M=D // 12356
@SP // 12357
AM=M+1 // 12358
A=A-1 // 12359
M=0 // 12360
@SP // 12361
AM=M+1 // 12362
A=A-1 // 12363
M=0 // 12364
// call Output.create
@17 // 12365
D=A // 12366
@14 // 12367
M=D // 12368
@Output.create // 12369
D=A // 12370
@13 // 12371
M=D // 12372
@Output.init.ret.86 // 12373
D=A // 12374
@CALL // 12375
0;JMP // 12376
(Output.init.ret.86)
@SP // 12377
M=M-1 // 12378

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12379
D=A // 12380
@SP // 12381
M=D+M // 12382
@117 // 12383
D=A // 12384
@SP // 12385
A=M-1 // 12386
M=0 // 12387
A=A-1 // 12388
M=0 // 12389
A=A-1 // 12390
M=0 // 12391
A=A-1 // 12392
M=D // 12393
A=A-1 // 12394
@27 // 12395
D=A // 12396
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@27 // 12401
D=A // 12402
@SP // 12403
AM=M+1 // 12404
A=A-1 // 12405
M=D // 12406
@27 // 12407
D=A // 12408
@SP // 12409
AM=M+1 // 12410
A=A-1 // 12411
M=D // 12412
@27 // 12413
D=A // 12414
@SP // 12415
AM=M+1 // 12416
A=A-1 // 12417
M=D // 12418
@27 // 12419
D=A // 12420
@SP // 12421
AM=M+1 // 12422
A=A-1 // 12423
M=D // 12424
@54 // 12425
D=A // 12426
@SP // 12427
AM=M+1 // 12428
A=A-1 // 12429
M=D // 12430
@SP // 12431
AM=M+1 // 12432
A=A-1 // 12433
M=0 // 12434
@SP // 12435
AM=M+1 // 12436
A=A-1 // 12437
M=0 // 12438
// call Output.create
@17 // 12439
D=A // 12440
@14 // 12441
M=D // 12442
@Output.create // 12443
D=A // 12444
@13 // 12445
M=D // 12446
@Output.init.ret.87 // 12447
D=A // 12448
@CALL // 12449
0;JMP // 12450
(Output.init.ret.87)
@SP // 12451
M=M-1 // 12452

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12453
D=A // 12454
@SP // 12455
M=D+M // 12456
@118 // 12457
D=A // 12458
@SP // 12459
A=M-1 // 12460
M=0 // 12461
A=A-1 // 12462
M=0 // 12463
A=A-1 // 12464
M=0 // 12465
A=A-1 // 12466
M=D // 12467
A=A-1 // 12468
@51 // 12469
D=A // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@51 // 12475
D=A // 12476
@SP // 12477
AM=M+1 // 12478
A=A-1 // 12479
M=D // 12480
@51 // 12481
D=A // 12482
@SP // 12483
AM=M+1 // 12484
A=A-1 // 12485
M=D // 12486
@51 // 12487
D=A // 12488
@SP // 12489
AM=M+1 // 12490
A=A-1 // 12491
M=D // 12492
@30 // 12493
D=A // 12494
@SP // 12495
AM=M+1 // 12496
A=A-1 // 12497
M=D // 12498
@12 // 12499
D=A // 12500
@SP // 12501
AM=M+1 // 12502
A=A-1 // 12503
M=D // 12504
@SP // 12505
AM=M+1 // 12506
A=A-1 // 12507
M=0 // 12508
@SP // 12509
AM=M+1 // 12510
A=A-1 // 12511
M=0 // 12512
// call Output.create
@17 // 12513
D=A // 12514
@14 // 12515
M=D // 12516
@Output.create // 12517
D=A // 12518
@13 // 12519
M=D // 12520
@Output.init.ret.88 // 12521
D=A // 12522
@CALL // 12523
0;JMP // 12524
(Output.init.ret.88)
@SP // 12525
M=M-1 // 12526

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12527
D=A // 12528
@SP // 12529
M=D+M // 12530
@119 // 12531
D=A // 12532
@SP // 12533
A=M-1 // 12534
M=0 // 12535
A=A-1 // 12536
M=0 // 12537
A=A-1 // 12538
M=0 // 12539
A=A-1 // 12540
M=D // 12541
A=A-1 // 12542
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
@63 // 12561
D=A // 12562
@SP // 12563
AM=M+1 // 12564
A=A-1 // 12565
M=D // 12566
@63 // 12567
D=A // 12568
@SP // 12569
AM=M+1 // 12570
A=A-1 // 12571
M=D // 12572
@18 // 12573
D=A // 12574
@SP // 12575
AM=M+1 // 12576
A=A-1 // 12577
M=D // 12578
@SP // 12579
AM=M+1 // 12580
A=A-1 // 12581
M=0 // 12582
@SP // 12583
AM=M+1 // 12584
A=A-1 // 12585
M=0 // 12586
// call Output.create
@17 // 12587
D=A // 12588
@14 // 12589
M=D // 12590
@Output.create // 12591
D=A // 12592
@13 // 12593
M=D // 12594
@Output.init.ret.89 // 12595
D=A // 12596
@CALL // 12597
0;JMP // 12598
(Output.init.ret.89)
@SP // 12599
M=M-1 // 12600

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12601
D=A // 12602
@SP // 12603
M=D+M // 12604
@120 // 12605
D=A // 12606
@SP // 12607
A=M-1 // 12608
M=0 // 12609
A=A-1 // 12610
M=0 // 12611
A=A-1 // 12612
M=0 // 12613
A=A-1 // 12614
M=D // 12615
A=A-1 // 12616
@51 // 12617
D=A // 12618
@SP // 12619
AM=M+1 // 12620
A=A-1 // 12621
M=D // 12622
@30 // 12623
D=A // 12624
@SP // 12625
AM=M+1 // 12626
A=A-1 // 12627
M=D // 12628
@12 // 12629
D=A // 12630
@SP // 12631
AM=M+1 // 12632
A=A-1 // 12633
M=D // 12634
@12 // 12635
D=A // 12636
@SP // 12637
AM=M+1 // 12638
A=A-1 // 12639
M=D // 12640
@30 // 12641
D=A // 12642
@SP // 12643
AM=M+1 // 12644
A=A-1 // 12645
M=D // 12646
@51 // 12647
D=A // 12648
@SP // 12649
AM=M+1 // 12650
A=A-1 // 12651
M=D // 12652
@SP // 12653
AM=M+1 // 12654
A=A-1 // 12655
M=0 // 12656
@SP // 12657
AM=M+1 // 12658
A=A-1 // 12659
M=0 // 12660
// call Output.create
@17 // 12661
D=A // 12662
@14 // 12663
M=D // 12664
@Output.create // 12665
D=A // 12666
@13 // 12667
M=D // 12668
@Output.init.ret.90 // 12669
D=A // 12670
@CALL // 12671
0;JMP // 12672
(Output.init.ret.90)
@SP // 12673
M=M-1 // 12674

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12675
D=A // 12676
@SP // 12677
M=D+M // 12678
@121 // 12679
D=A // 12680
@SP // 12681
A=M-1 // 12682
M=0 // 12683
A=A-1 // 12684
M=0 // 12685
A=A-1 // 12686
M=0 // 12687
A=A-1 // 12688
M=D // 12689
A=A-1 // 12690
@51 // 12691
D=A // 12692
@SP // 12693
AM=M+1 // 12694
A=A-1 // 12695
M=D // 12696
@51 // 12697
D=A // 12698
@SP // 12699
AM=M+1 // 12700
A=A-1 // 12701
M=D // 12702
@51 // 12703
D=A // 12704
@SP // 12705
AM=M+1 // 12706
A=A-1 // 12707
M=D // 12708
@62 // 12709
D=A // 12710
@SP // 12711
AM=M+1 // 12712
A=A-1 // 12713
M=D // 12714
@48 // 12715
D=A // 12716
@SP // 12717
AM=M+1 // 12718
A=A-1 // 12719
M=D // 12720
@24 // 12721
D=A // 12722
@SP // 12723
AM=M+1 // 12724
A=A-1 // 12725
M=D // 12726
@15 // 12727
D=A // 12728
@SP // 12729
AM=M+1 // 12730
A=A-1 // 12731
M=D // 12732
@SP // 12733
AM=M+1 // 12734
A=A-1 // 12735
M=0 // 12736
// call Output.create
@17 // 12737
D=A // 12738
@14 // 12739
M=D // 12740
@Output.create // 12741
D=A // 12742
@13 // 12743
M=D // 12744
@Output.init.ret.91 // 12745
D=A // 12746
@CALL // 12747
0;JMP // 12748
(Output.init.ret.91)
@SP // 12749
M=M-1 // 12750

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12751
D=A // 12752
@SP // 12753
M=D+M // 12754
@122 // 12755
D=A // 12756
@SP // 12757
A=M-1 // 12758
M=0 // 12759
A=A-1 // 12760
M=0 // 12761
A=A-1 // 12762
M=0 // 12763
A=A-1 // 12764
M=D // 12765
A=A-1 // 12766
@63 // 12767
D=A // 12768
@SP // 12769
AM=M+1 // 12770
A=A-1 // 12771
M=D // 12772
@27 // 12773
D=A // 12774
@SP // 12775
AM=M+1 // 12776
A=A-1 // 12777
M=D // 12778
@12 // 12779
D=A // 12780
@SP // 12781
AM=M+1 // 12782
A=A-1 // 12783
M=D // 12784
@6 // 12785
D=A // 12786
@SP // 12787
AM=M+1 // 12788
A=A-1 // 12789
M=D // 12790
@51 // 12791
D=A // 12792
@SP // 12793
AM=M+1 // 12794
A=A-1 // 12795
M=D // 12796
@63 // 12797
D=A // 12798
@SP // 12799
AM=M+1 // 12800
A=A-1 // 12801
M=D // 12802
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=0 // 12806
@SP // 12807
AM=M+1 // 12808
A=A-1 // 12809
M=0 // 12810
// call Output.create
@17 // 12811
D=A // 12812
@14 // 12813
M=D // 12814
@Output.create // 12815
D=A // 12816
@13 // 12817
M=D // 12818
@Output.init.ret.92 // 12819
D=A // 12820
@CALL // 12821
0;JMP // 12822
(Output.init.ret.92)
@SP // 12823
M=M-1 // 12824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12825
D=A // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830
@56 // 12831
D=A // 12832
@SP // 12833
AM=M+1 // 12834
A=A-1 // 12835
M=D // 12836
@12 // 12837
D=A // 12838
@SP // 12839
AM=M+1 // 12840
A=A-1 // 12841
M=D // 12842
@12 // 12843
D=A // 12844
@SP // 12845
AM=M+1 // 12846
A=A-1 // 12847
M=D // 12848
@12 // 12849
D=A // 12850
@SP // 12851
AM=M+1 // 12852
A=A-1 // 12853
M=D // 12854
@7 // 12855
D=A // 12856
@SP // 12857
AM=M+1 // 12858
A=A-1 // 12859
M=D // 12860
@12 // 12861
D=A // 12862
@SP // 12863
AM=M+1 // 12864
A=A-1 // 12865
M=D // 12866
@12 // 12867
D=A // 12868
@SP // 12869
AM=M+1 // 12870
A=A-1 // 12871
M=D // 12872
@12 // 12873
D=A // 12874
@SP // 12875
AM=M+1 // 12876
A=A-1 // 12877
M=D // 12878
@56 // 12879
D=A // 12880
@SP // 12881
AM=M+1 // 12882
A=A-1 // 12883
M=D // 12884
@SP // 12885
AM=M+1 // 12886
A=A-1 // 12887
M=0 // 12888
@SP // 12889
AM=M+1 // 12890
A=A-1 // 12891
M=0 // 12892
// call Output.create
@17 // 12893
D=A // 12894
@14 // 12895
M=D // 12896
@Output.create // 12897
D=A // 12898
@13 // 12899
M=D // 12900
@Output.init.ret.93 // 12901
D=A // 12902
@CALL // 12903
0;JMP // 12904
(Output.init.ret.93)
@SP // 12905
M=M-1 // 12906

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12907
D=A // 12908
@SP // 12909
AM=M+1 // 12910
A=A-1 // 12911
M=D // 12912
@12 // 12913
D=A // 12914
@SP // 12915
AM=M+1 // 12916
A=A-1 // 12917
M=D // 12918
@12 // 12919
D=A // 12920
@SP // 12921
AM=M+1 // 12922
A=A-1 // 12923
M=D // 12924
@12 // 12925
D=A // 12926
@SP // 12927
AM=M+1 // 12928
A=A-1 // 12929
M=D // 12930
@12 // 12931
D=A // 12932
@SP // 12933
AM=M+1 // 12934
A=A-1 // 12935
M=D // 12936
@12 // 12937
D=A // 12938
@SP // 12939
AM=M+1 // 12940
A=A-1 // 12941
M=D // 12942
@12 // 12943
D=A // 12944
@SP // 12945
AM=M+1 // 12946
A=A-1 // 12947
M=D // 12948
@12 // 12949
D=A // 12950
@SP // 12951
AM=M+1 // 12952
A=A-1 // 12953
M=D // 12954
@12 // 12955
D=A // 12956
@SP // 12957
AM=M+1 // 12958
A=A-1 // 12959
M=D // 12960
@12 // 12961
D=A // 12962
@SP // 12963
AM=M+1 // 12964
A=A-1 // 12965
M=D // 12966
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=0 // 12970
@SP // 12971
AM=M+1 // 12972
A=A-1 // 12973
M=0 // 12974
// call Output.create
@17 // 12975
D=A // 12976
@14 // 12977
M=D // 12978
@Output.create // 12979
D=A // 12980
@13 // 12981
M=D // 12982
@Output.init.ret.94 // 12983
D=A // 12984
@CALL // 12985
0;JMP // 12986
(Output.init.ret.94)
@SP // 12987
M=M-1 // 12988

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994
@7 // 12995
D=A // 12996
@SP // 12997
AM=M+1 // 12998
A=A-1 // 12999
M=D // 13000
@12 // 13001
D=A // 13002
@SP // 13003
AM=M+1 // 13004
A=A-1 // 13005
M=D // 13006
@12 // 13007
D=A // 13008
@SP // 13009
AM=M+1 // 13010
A=A-1 // 13011
M=D // 13012
@12 // 13013
D=A // 13014
@SP // 13015
AM=M+1 // 13016
A=A-1 // 13017
M=D // 13018
@56 // 13019
D=A // 13020
@SP // 13021
AM=M+1 // 13022
A=A-1 // 13023
M=D // 13024
@12 // 13025
D=A // 13026
@SP // 13027
AM=M+1 // 13028
A=A-1 // 13029
M=D // 13030
@12 // 13031
D=A // 13032
@SP // 13033
AM=M+1 // 13034
A=A-1 // 13035
M=D // 13036
@12 // 13037
D=A // 13038
@SP // 13039
AM=M+1 // 13040
A=A-1 // 13041
M=D // 13042
@7 // 13043
D=A // 13044
@SP // 13045
AM=M+1 // 13046
A=A-1 // 13047
M=D // 13048
@SP // 13049
AM=M+1 // 13050
A=A-1 // 13051
M=0 // 13052
@SP // 13053
AM=M+1 // 13054
A=A-1 // 13055
M=0 // 13056
// call Output.create
@17 // 13057
D=A // 13058
@14 // 13059
M=D // 13060
@Output.create // 13061
D=A // 13062
@13 // 13063
M=D // 13064
@Output.init.ret.95 // 13065
D=A // 13066
@CALL // 13067
0;JMP // 13068
(Output.init.ret.95)
@SP // 13069
M=M-1 // 13070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13071
D=A // 13072
@SP // 13073
AM=M+1 // 13074
A=A-1 // 13075
M=D // 13076
@38 // 13077
D=A // 13078
@SP // 13079
AM=M+1 // 13080
A=A-1 // 13081
M=D // 13082
@45 // 13083
D=A // 13084
@SP // 13085
AM=M+1 // 13086
A=A-1 // 13087
M=D // 13088
@25 // 13089
D=A // 13090
@SP // 13091
AM=M+1 // 13092
A=A-1 // 13093
M=D // 13094
@SP // 13095
AM=M+1 // 13096
A=A-1 // 13097
M=0 // 13098
@SP // 13099
AM=M+1 // 13100
A=A-1 // 13101
M=0 // 13102
@SP // 13103
AM=M+1 // 13104
A=A-1 // 13105
M=0 // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=0 // 13110
@SP // 13111
AM=M+1 // 13112
A=A-1 // 13113
M=0 // 13114
@SP // 13115
AM=M+1 // 13116
A=A-1 // 13117
M=0 // 13118
@SP // 13119
AM=M+1 // 13120
A=A-1 // 13121
M=0 // 13122
@SP // 13123
AM=M+1 // 13124
A=A-1 // 13125
M=0 // 13126
// call Output.create
@17 // 13127
D=A // 13128
@14 // 13129
M=D // 13130
@Output.create // 13131
D=A // 13132
@13 // 13133
M=D // 13134
@Output.init.ret.96 // 13135
D=A // 13136
@CALL // 13137
0;JMP // 13138
(Output.init.ret.96)
@SP // 13139
M=M-1 // 13140

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13141
M=0 // 13142

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13143
M=0 // 13144

////PushInstruction("constant 0")
@SP // 13145
AM=M+1 // 13146
A=A-1 // 13147
M=0 // 13148
@RETURN // 13149
0;JMP // 13150

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13151
M=M+1 // 13152
AM=M+1 // 13153
A=A-1 // 13154
M=0 // 13155
A=A-1 // 13156
M=0 // 13157

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13158
A=M+1 // 13159
D=M // 13160
@2 // 13161
D=D+A // 13162
@SP // 13163
AM=M+1 // 13164
A=A-1 // 13165
M=D // 13166
D=0 // 13167
@SP // 13168
AM=M-1 // 13169
A=M // 13170
M=D // 13171

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13172
A=M+1 // 13173
D=M // 13174
@3 // 13175
D=D+A // 13176
@SP // 13177
AM=M+1 // 13178
A=A-1 // 13179
M=D // 13180
D=0 // 13181
@SP // 13182
AM=M-1 // 13183
A=M // 13184
M=D // 13185

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
@Memory.add_node.EQ.55 // 13186
D=A // 13187
@SP // 13188
AM=M+1 // 13189
A=A-1 // 13190
M=D // 13191
@ARG // 13192
A=M // 13193
D=M // 13194
A=D // 13195
D=M // 13196
@DO_EQ // 13197
0;JMP // 13198
(Memory.add_node.EQ.55)
@Memory.add_node$IF_TRUE1 // 13199
D;JNE // 13200

////GotoInstruction{label='Memory.add_node$IF_END1}
// goto Memory.add_node$IF_END1
@Memory.add_node$IF_END1 // 13201
0;JMP // 13202

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
@ARG // 13203
A=M // 13204
D=M // 13205
@SP // 13206
AM=M+1 // 13207
A=A-1 // 13208
M=D // 13209
@ARG // 13210
A=M+1 // 13211
D=M // 13212
@SP // 13213
AM=M-1 // 13214
A=M // 13215
M=D // 13216

////PushInstruction("constant 0")
@SP // 13217
AM=M+1 // 13218
A=A-1 // 13219
M=0 // 13220
@RETURN // 13221
0;JMP // 13222

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

@ARG // 13223
A=M // 13224
D=M // 13225
A=D // 13226
D=M // 13227
@LCL // 13228
A=M // 13229
M=D // 13230

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13231
A=M+1 // 13232
M=0 // 13233

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
@Memory.add_node.EQ.56 // 13234
D=A // 13235
@SP // 13236
AM=M+1 // 13237
A=A-1 // 13238
M=D // 13239
@LCL // 13240
A=M // 13241
D=M // 13242
@DO_EQ // 13243
0;JMP // 13244
(Memory.add_node.EQ.56)
@SP // 13245
AM=M+1 // 13246
A=A-1 // 13247
M=D // 13248
@SP // 13249
A=M-1 // 13250
M=!D // 13251
@Memory.add_node.GT.57 // 13252
D=A // 13253
@SP // 13254
AM=M+1 // 13255
A=A-1 // 13256
M=D // 13257
@LCL // 13258
A=M // 13259
D=M // 13260
A=D // 13261
D=M // 13262
@SP // 13263
AM=M+1 // 13264
A=A-1 // 13265
M=D // 13266
@ARG // 13267
A=M+1 // 13268
D=M // 13269
A=D // 13270
D=M // 13271
@SP // 13272
AM=M-1 // 13273
D=M-D // 13274
@DO_GT // 13275
0;JMP // 13276
(Memory.add_node.GT.57)
D=!D // 13277
@SP // 13278
AM=M-1 // 13279
D=D&M // 13280
D=!D // 13281
@Memory.add_node_WHILE_END1 // 13282
D;JNE // 13283

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13284
A=M // 13285
D=M // 13286
@LCL // 13287
A=M+1 // 13288
M=D // 13289

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

@LCL // 13290
A=M // 13291
D=M // 13292
@LCL // 13293
A=M // 13294
D=M // 13295
@3 // 13296
D=D+A // 13297
A=D // 13298
D=M // 13299
@LCL // 13300
A=M // 13301
M=D // 13302

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13303
0;JMP // 13304

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13305
A=M+1 // 13306
D=!M // 13307
@Memory.add_node$IF_TRUE2 // 13308
D;JNE // 13309

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13310
0;JMP // 13311

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
@ARG // 13312
A=M+1 // 13313
D=M // 13314
@3 // 13315
D=D+A // 13316
@SP // 13317
AM=M+1 // 13318
A=A-1 // 13319
M=D // 13320
@ARG // 13321
A=M // 13322
D=M // 13323
A=D // 13324
D=M // 13325
@SP // 13326
AM=M-1 // 13327
A=M // 13328
M=D // 13329

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
@ARG // 13330
A=M // 13331
D=M // 13332
A=D // 13333
D=M // 13334
@2 // 13335
D=D+A // 13336
@SP // 13337
AM=M+1 // 13338
A=A-1 // 13339
M=D // 13340
@ARG // 13341
A=M+1 // 13342
D=M // 13343
@SP // 13344
AM=M-1 // 13345
A=M // 13346
M=D // 13347

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13348
A=M // 13349
D=M // 13350
@SP // 13351
AM=M+1 // 13352
A=A-1 // 13353
M=D // 13354
@ARG // 13355
A=M+1 // 13356
D=M // 13357
@SP // 13358
AM=M-1 // 13359
A=M // 13360
M=D // 13361

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13362
0;JMP // 13363

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
@ARG // 13364
A=M+1 // 13365
D=M // 13366
@3 // 13367
D=D+A // 13368
@SP // 13369
AM=M+1 // 13370
A=A-1 // 13371
M=D // 13372
@LCL // 13373
A=M // 13374
D=M // 13375
@SP // 13376
AM=M-1 // 13377
A=M // 13378
M=D // 13379

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13380
A=M+1 // 13381
D=M // 13382
@2 // 13383
D=D+A // 13384
@SP // 13385
AM=M+1 // 13386
A=A-1 // 13387
M=D // 13388
@LCL // 13389
A=M+1 // 13390
D=M // 13391
@SP // 13392
AM=M-1 // 13393
A=M // 13394
M=D // 13395

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13396
A=M // 13397
D=M // 13398
@Memory.add_node$IF_TRUE3 // 13399
D;JNE // 13400

////GotoInstruction{label='Memory.add_node$IF_END3}
// goto Memory.add_node$IF_END3
@Memory.add_node$IF_END3 // 13401
0;JMP // 13402

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
@LCL // 13403
A=M // 13404
D=M // 13405
@2 // 13406
D=D+A // 13407
@SP // 13408
AM=M+1 // 13409
A=A-1 // 13410
M=D // 13411
@ARG // 13412
A=M+1 // 13413
D=M // 13414
@SP // 13415
AM=M-1 // 13416
A=M // 13417
M=D // 13418

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
@LCL // 13419
A=M+1 // 13420
D=M // 13421
@3 // 13422
D=D+A // 13423
@SP // 13424
AM=M+1 // 13425
A=A-1 // 13426
M=D // 13427
@ARG // 13428
A=M+1 // 13429
D=M // 13430
@SP // 13431
AM=M-1 // 13432
A=M // 13433
M=D // 13434

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13435
AM=M+1 // 13436
A=A-1 // 13437
M=0 // 13438
@RETURN // 13439
0;JMP // 13440

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13441
D=A // 13442
@SP // 13443
AM=D+M // 13444
A=A-1 // 13445
M=0 // 13446
A=A-1 // 13447
M=0 // 13448
A=A-1 // 13449
M=0 // 13450
A=A-1 // 13451
M=0 // 13452
A=A-1 // 13453
M=0 // 13454

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13455
A=M // 13456
M=0 // 13457

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13458
A=M+1 // 13459
A=A+1 // 13460
D=M // 13461
@LCL // 13462
A=M+1 // 13463
M=D // 13464

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

@ARG // 13465
A=M+1 // 13466
A=A+1 // 13467
D=M // 13468
D=D-1 // 13469
D=-D // 13470
@LCL // 13471
A=M+1 // 13472
A=A+1 // 13473
M=D // 13474

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
@Screen.drawCircle.GT.58 // 13475
D=A // 13476
@SP // 13477
AM=M+1 // 13478
A=A-1 // 13479
M=D // 13480
@LCL // 13481
A=M+1 // 13482
D=M // 13483
A=A-1 // 13484
D=M-D // 13485
@DO_GT // 13486
0;JMP // 13487
(Screen.drawCircle.GT.58)
@Screen.drawCircle_WHILE_END1 // 13488
D;JNE // 13489

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

@ARG // 13490
A=M // 13491
D=M // 13492
@LCL // 13493
A=M // 13494
D=M-D // 13495
@SP // 13496
AM=M+1 // 13497
A=A-1 // 13498
M=D // 13499
@ARG // 13500
A=M // 13501
D=M // 13502
@LCL // 13503
A=M // 13504
D=D+M // 13505
@SP // 13506
AM=M+1 // 13507
A=A-1 // 13508
M=D // 13509
@ARG // 13510
A=M+1 // 13511
D=M // 13512
@LCL // 13513
A=M+1 // 13514
D=D+M // 13515
@SP // 13516
AM=M+1 // 13517
A=A-1 // 13518
M=D // 13519
// call Screen.drawHorizontalLine
@8 // 13520
D=A // 13521
@14 // 13522
M=D // 13523
@Screen.drawHorizontalLine // 13524
D=A // 13525
@13 // 13526
M=D // 13527
@Screen.drawCircle.ret.0 // 13528
D=A // 13529
@CALL // 13530
0;JMP // 13531
(Screen.drawCircle.ret.0)
@SP // 13532
M=M-1 // 13533

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

@ARG // 13534
A=M // 13535
D=M // 13536
@LCL // 13537
A=M // 13538
D=M-D // 13539
@SP // 13540
AM=M+1 // 13541
A=A-1 // 13542
M=D // 13543
@ARG // 13544
A=M // 13545
D=M // 13546
@LCL // 13547
A=M // 13548
D=D+M // 13549
@SP // 13550
AM=M+1 // 13551
A=A-1 // 13552
M=D // 13553
@ARG // 13554
A=M+1 // 13555
D=M // 13556
@LCL // 13557
A=M+1 // 13558
D=M-D // 13559
@SP // 13560
AM=M+1 // 13561
A=A-1 // 13562
M=D // 13563
// call Screen.drawHorizontalLine
@8 // 13564
D=A // 13565
@14 // 13566
M=D // 13567
@Screen.drawHorizontalLine // 13568
D=A // 13569
@13 // 13570
M=D // 13571
@Screen.drawCircle.ret.1 // 13572
D=A // 13573
@CALL // 13574
0;JMP // 13575
(Screen.drawCircle.ret.1)
@SP // 13576
M=M-1 // 13577

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

@ARG // 13578
A=M // 13579
D=M // 13580
@LCL // 13581
A=M+1 // 13582
D=M-D // 13583
@SP // 13584
AM=M+1 // 13585
A=A-1 // 13586
M=D // 13587
@ARG // 13588
A=M // 13589
D=M // 13590
@LCL // 13591
A=M+1 // 13592
D=D+M // 13593
@SP // 13594
AM=M+1 // 13595
A=A-1 // 13596
M=D // 13597
@ARG // 13598
A=M+1 // 13599
D=M // 13600
@LCL // 13601
A=M // 13602
D=D+M // 13603
@SP // 13604
AM=M+1 // 13605
A=A-1 // 13606
M=D // 13607
// call Screen.drawHorizontalLine
@8 // 13608
D=A // 13609
@14 // 13610
M=D // 13611
@Screen.drawHorizontalLine // 13612
D=A // 13613
@13 // 13614
M=D // 13615
@Screen.drawCircle.ret.2 // 13616
D=A // 13617
@CALL // 13618
0;JMP // 13619
(Screen.drawCircle.ret.2)
@SP // 13620
M=M-1 // 13621

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

@ARG // 13622
A=M // 13623
D=M // 13624
@LCL // 13625
A=M+1 // 13626
D=M-D // 13627
@SP // 13628
AM=M+1 // 13629
A=A-1 // 13630
M=D // 13631
@ARG // 13632
A=M // 13633
D=M // 13634
@LCL // 13635
A=M+1 // 13636
D=D+M // 13637
@SP // 13638
AM=M+1 // 13639
A=A-1 // 13640
M=D // 13641
@ARG // 13642
A=M+1 // 13643
D=M // 13644
@LCL // 13645
A=M // 13646
D=M-D // 13647
@SP // 13648
AM=M+1 // 13649
A=A-1 // 13650
M=D // 13651
// call Screen.drawHorizontalLine
@8 // 13652
D=A // 13653
@14 // 13654
M=D // 13655
@Screen.drawHorizontalLine // 13656
D=A // 13657
@13 // 13658
M=D // 13659
@Screen.drawCircle.ret.3 // 13660
D=A // 13661
@CALL // 13662
0;JMP // 13663
(Screen.drawCircle.ret.3)
@SP // 13664
M=M-1 // 13665

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.59 // 13666
D=A // 13667
@SP // 13668
AM=M+1 // 13669
A=A-1 // 13670
M=D // 13671
@LCL // 13672
A=M+1 // 13673
A=A+1 // 13674
D=M // 13675
@DO_LT // 13676
0;JMP // 13677
(Screen.drawCircle.LT.59)
@Screen.drawCircle$IF_TRUE1 // 13678
D;JNE // 13679

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13680
0;JMP // 13681

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

@LCL // 13682
A=M+1 // 13683
A=A+1 // 13684
D=M // 13685
@SP // 13686
AM=M+1 // 13687
A=A-1 // 13688
M=D // 13689
@LCL // 13690
A=M // 13691
D=M // 13692
D=D+M // 13693
@SP // 13694
AM=M-1 // 13695
D=D+M // 13696
@3 // 13697
D=D+A // 13698
@LCL // 13699
A=M+1 // 13700
A=A+1 // 13701
M=D // 13702

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13703
0;JMP // 13704

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

@LCL // 13705
A=M+1 // 13706
A=A+1 // 13707
D=M // 13708
@SP // 13709
AM=M+1 // 13710
A=A-1 // 13711
M=D // 13712
@LCL // 13713
A=M+1 // 13714
D=M // 13715
A=A-1 // 13716
D=M-D // 13717
@R13 // 13718
M=D // 13719
D=D+M // 13720
@SP // 13721
AM=M-1 // 13722
D=D+M // 13723
@5 // 13724
D=D+A // 13725
@LCL // 13726
A=M+1 // 13727
A=A+1 // 13728
M=D // 13729

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

@LCL // 13730
A=M+1 // 13731
M=M-1 // 13732

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

@LCL // 13733
A=M // 13734
M=M+1 // 13735

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13736
0;JMP // 13737

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13738
AM=M+1 // 13739
A=A-1 // 13740
M=0 // 13741
@RETURN // 13742
0;JMP // 13743

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13744
D=A // 13745
@14 // 13746
M=D // 13747
@Memory.init // 13748
D=A // 13749
@13 // 13750
M=D // 13751
@Sys.init.ret.0 // 13752
D=A // 13753
@CALL // 13754
0;JMP // 13755
(Sys.init.ret.0)
@SP // 13756
M=M-1 // 13757

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13758
D=A // 13759
@14 // 13760
M=D // 13761
@Math.init // 13762
D=A // 13763
@13 // 13764
M=D // 13765
@Sys.init.ret.1 // 13766
D=A // 13767
@CALL // 13768
0;JMP // 13769
(Sys.init.ret.1)
@SP // 13770
M=M-1 // 13771

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13772
D=A // 13773
@14 // 13774
M=D // 13775
@Screen.init // 13776
D=A // 13777
@13 // 13778
M=D // 13779
@Sys.init.ret.2 // 13780
D=A // 13781
@CALL // 13782
0;JMP // 13783
(Sys.init.ret.2)
@SP // 13784
M=M-1 // 13785

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13786
D=A // 13787
@14 // 13788
M=D // 13789
@Output.init // 13790
D=A // 13791
@13 // 13792
M=D // 13793
@Sys.init.ret.3 // 13794
D=A // 13795
@CALL // 13796
0;JMP // 13797
(Sys.init.ret.3)
@SP // 13798
M=M-1 // 13799

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13800
D=A // 13801
@14 // 13802
M=D // 13803
@Keyboard.init // 13804
D=A // 13805
@13 // 13806
M=D // 13807
@Sys.init.ret.4 // 13808
D=A // 13809
@CALL // 13810
0;JMP // 13811
(Sys.init.ret.4)
@SP // 13812
M=M-1 // 13813

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13814
D=A // 13815
@14 // 13816
M=D // 13817
@Main.main // 13818
D=A // 13819
@13 // 13820
M=D // 13821
@Sys.init.ret.5 // 13822
D=A // 13823
@CALL // 13824
0;JMP // 13825
(Sys.init.ret.5)
@SP // 13826
M=M-1 // 13827

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13828
D=A // 13829
@14 // 13830
M=D // 13831
@Sys.halt // 13832
D=A // 13833
@13 // 13834
M=D // 13835
@Sys.init.ret.6 // 13836
D=A // 13837
@CALL // 13838
0;JMP // 13839
(Sys.init.ret.6)
@SP // 13840
M=M-1 // 13841

////PushInstruction("constant 0")
@SP // 13842
AM=M+1 // 13843
A=A-1 // 13844
M=0 // 13845
@RETURN // 13846
0;JMP // 13847

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13848
A=M // 13849
D=M // 13850
@Screen.0 // 13851
M=D // 13852

////PushInstruction("constant 0")
@SP // 13853
AM=M+1 // 13854
A=A-1 // 13855
M=0 // 13856
@RETURN // 13857
0;JMP // 13858

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 13859
M=M+1 // 13860
AM=M+1 // 13861
A=A-1 // 13862
M=0 // 13863
A=A-1 // 13864
M=0 // 13865

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13866
A=M // 13867
M=1 // 13868

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13869
A=M+1 // 13870
M=0 // 13871

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 13872
D=A // 13873
@SP // 13874
AM=M+1 // 13875
A=A-1 // 13876
M=D // 13877
// call Memory.alloc
@6 // 13878
D=A // 13879
@14 // 13880
M=D // 13881
@Memory.alloc // 13882
D=A // 13883
@13 // 13884
M=D // 13885
@Math.init.ret.0 // 13886
D=A // 13887
@CALL // 13888
0;JMP // 13889
(Math.init.ret.0)
@SP // 13890
AM=M-1 // 13891
D=M // 13892
@Math.0 // 13893
M=D // 13894

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
@Math.init.LT.60 // 13895
D=A // 13896
@SP // 13897
AM=M+1 // 13898
A=A-1 // 13899
M=D // 13900
@LCL // 13901
A=M+1 // 13902
D=M // 13903
@16 // 13904
D=D-A // 13905
@DO_LT // 13906
0;JMP // 13907
(Math.init.LT.60)
D=!D // 13908
@Math.init_WHILE_END1 // 13909
D;JNE // 13910

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 13911
D=M // 13912
@LCL // 13913
A=M+1 // 13914
D=D+M // 13915
@SP // 13916
AM=M+1 // 13917
A=A-1 // 13918
M=D // 13919
@LCL // 13920
A=M // 13921
D=M // 13922
@SP // 13923
AM=M-1 // 13924
A=M // 13925
M=D // 13926

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

@LCL // 13927
A=M // 13928
D=M // 13929
@LCL // 13930
A=M // 13931
M=D+M // 13932

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

@LCL // 13933
A=M+1 // 13934
M=M+1 // 13935

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 13936
0;JMP // 13937

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13938
AM=M+1 // 13939
A=A-1 // 13940
M=0 // 13941
@RETURN // 13942
0;JMP // 13943

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 13944
M=M+1 // 13945
AM=M+1 // 13946
A=A-1 // 13947
M=0 // 13948
A=A-1 // 13949
M=0 // 13950

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

@2055 // 13951
D=A // 13952
@LCL // 13953
A=M // 13954
M=D // 13955

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
@LCL // 13956
A=M // 13957
D=M // 13958
@SP // 13959
AM=M+1 // 13960
A=A-1 // 13961
M=D // 13962
@LCL // 13963
A=M // 13964
D=M // 13965
@16384 // 13966
D=A-D // 13967
@5 // 13968
D=D-A // 13969
@SP // 13970
AM=M-1 // 13971
A=M // 13972
M=D // 13973

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13974
A=M // 13975
D=M // 13976
@SP // 13977
AM=M+1 // 13978
A=A-1 // 13979
M=D+1 // 13980
D=1 // 13981
@SP // 13982
AM=M-1 // 13983
A=M // 13984
M=D // 13985

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 13986
A=M // 13987
D=M // 13988
@2 // 13989
D=D+A // 13990
@SP // 13991
AM=M+1 // 13992
A=A-1 // 13993
M=D // 13994
D=0 // 13995
@SP // 13996
AM=M-1 // 13997
A=M // 13998
M=D // 13999

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 14000
A=M // 14001
D=M // 14002
@3 // 14003
D=D+A // 14004
@SP // 14005
AM=M+1 // 14006
A=A-1 // 14007
M=D // 14008
D=0 // 14009
@SP // 14010
AM=M-1 // 14011
A=M // 14012
M=D // 14013

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14014
A=M // 14015
D=M // 14016
@SP // 14017
AM=M+1 // 14018
A=A-1 // 14019
M=D // 14020
// call Memory.create_foot
@6 // 14021
D=A // 14022
@14 // 14023
M=D // 14024
@Memory.create_foot // 14025
D=A // 14026
@13 // 14027
M=D // 14028
@Memory.init.ret.0 // 14029
D=A // 14030
@CALL // 14031
0;JMP // 14032
(Memory.init.ret.0)
@SP // 14033
M=M-1 // 14034

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

@2054 // 14035
D=A // 14036
@SP // 14037
AM=M+1 // 14038
A=A-1 // 14039
M=D // 14040
@2054 // 14041
D=A // 14042
@SP // 14043
AM=M+1 // 14044
A=A-1 // 14045
M=D // 14046
@LCL // 14047
A=M // 14048
D=M // 14049
@SP // 14050
AM=M+1 // 14051
A=A-1 // 14052
M=D // 14053
// call Memory.add_node
@7 // 14054
D=A // 14055
@14 // 14056
M=D // 14057
@Memory.add_node // 14058
D=A // 14059
@13 // 14060
M=D // 14061
@Memory.init.ret.1 // 14062
D=A // 14063
@CALL // 14064
0;JMP // 14065
(Memory.init.ret.1)
@SP // 14066
M=M-1 // 14067

////PushInstruction("constant 0")
@SP // 14068
AM=M+1 // 14069
A=A-1 // 14070
M=0 // 14071
@RETURN // 14072
0;JMP // 14073

