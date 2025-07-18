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

////FunctionInstruction{functionName='Output.println', numLocals=0, funcMapping={}}
// function Output.println with 0
(Output.println)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 206
M=0 // 207

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("static 2"),
//    right:
//        PushInstruction("constant 22"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Output.println$IF_TRUE1}}
@Output.println.EQ.1 // 208
D=A // 209
@SP // 210
AM=M+1 // 211
A=A-1 // 212
M=D // 213
@Output.2 // 214
D=M // 215
@22 // 216
D=D-A // 217
@DO_EQ // 218
0;JMP // 219
(Output.println.EQ.1)
@Output.println$IF_TRUE1 // 220
D;JNE // 221

////GotoInstruction{label='Output.println$IF_FALSE1}
// goto Output.println$IF_FALSE1
@Output.println$IF_FALSE1 // 222
0;JMP // 223

////LabelInstruction{label='Output.println$IF_TRUE1}
// label Output.println$IF_TRUE1
(Output.println$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 224
M=0 // 225

////GotoInstruction{label='Output.println$IF_END1}
// goto Output.println$IF_END1
@Output.println$IF_END1 // 226
0;JMP // 227

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

@Output.2 // 228
M=M+1 // 229

////LabelInstruction{label='Output.println$IF_END1}
// label Output.println$IF_END1
(Output.println$IF_END1)

////PushInstruction("constant 0")
@SP // 230
AM=M+1 // 231
A=A-1 // 232
M=0 // 233
@RETURN // 234
0;JMP // 235

////FunctionInstruction{functionName='Keyboard.init', numLocals=0, funcMapping={}}
// function Keyboard.init with 0
(Keyboard.init)

////PushInstruction("constant 0")
@SP // 236
AM=M+1 // 237
A=A-1 // 238
M=0 // 239
@RETURN // 240
0;JMP // 241

////FunctionInstruction{functionName='Memory.get_best_fit', numLocals=1, funcMapping={}}
// function Memory.get_best_fit with 1
(Memory.get_best_fit)
@SP // 242
AM=M+1 // 243
A=A-1 // 244
M=0 // 245

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

@ARG // 246
A=M // 247
A=M // 248
D=M // 249
@LCL // 250
A=M // 251
M=D // 252

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
@Memory.get_best_fit.LT.2 // 253
D=A // 254
@SP // 255
AM=M+1 // 256
A=A-1 // 257
M=D // 258
@LCL // 259
A=M // 260
A=M // 261
D=M // 262
@SP // 263
AM=M+1 // 264
A=A-1 // 265
M=D // 266
@ARG // 267
A=M+1 // 268
D=M // 269
@SP // 270
AM=M-1 // 271
D=M-D // 272
@DO_LT // 273
0;JMP // 274
(Memory.get_best_fit.LT.2)
D=!D // 275
@Memory.get_best_fit$IF_TRUE1 // 276
D;JNE // 277

////GotoInstruction{label='Memory.get_best_fit$IF_END1}
// goto Memory.get_best_fit$IF_END1
@Memory.get_best_fit$IF_END1 // 278
0;JMP // 279

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 280
A=M // 281
D=M // 282
@SP // 283
AM=M+1 // 284
A=A-1 // 285
M=D // 286
@RETURN // 287
0;JMP // 288

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
@Memory.get_best_fit.EQ.3 // 289
D=A // 290
@SP // 291
AM=M+1 // 292
A=A-1 // 293
M=D // 294
@LCL // 295
A=M // 296
D=M // 297
@LCL // 298
A=M // 299
D=M // 300
@3 // 301
D=D+A // 302
A=D // 303
D=M // 304
@DO_EQ // 305
0;JMP // 306
(Memory.get_best_fit.EQ.3)
@Memory.get_best_fit_WHILE_END1 // 307
D;JNE // 308

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

@LCL // 309
A=M // 310
D=M // 311
@LCL // 312
A=M // 313
D=M // 314
@3 // 315
D=D+A // 316
A=D // 317
D=M // 318
@LCL // 319
A=M // 320
M=D // 321

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
@Memory.get_best_fit.LT.4 // 322
D=A // 323
@SP // 324
AM=M+1 // 325
A=A-1 // 326
M=D // 327
@LCL // 328
A=M // 329
A=M // 330
D=M // 331
@SP // 332
AM=M+1 // 333
A=A-1 // 334
M=D // 335
@ARG // 336
A=M+1 // 337
D=M // 338
@SP // 339
AM=M-1 // 340
D=M-D // 341
@DO_LT // 342
0;JMP // 343
(Memory.get_best_fit.LT.4)
D=!D // 344
@Memory.get_best_fit$IF_TRUE2 // 345
D;JNE // 346

////GotoInstruction{label='Memory.get_best_fit$IF_END2}
// goto Memory.get_best_fit$IF_END2
@Memory.get_best_fit$IF_END2 // 347
0;JMP // 348

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 349
A=M // 350
D=M // 351
@SP // 352
AM=M+1 // 353
A=A-1 // 354
M=D // 355
@RETURN // 356
0;JMP // 357

////LabelInstruction{label='Memory.get_best_fit$IF_END2}
// label Memory.get_best_fit$IF_END2
(Memory.get_best_fit$IF_END2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 358
0;JMP // 359

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 360
AM=M+1 // 361
A=A-1 // 362
M=0 // 363
@RETURN // 364
0;JMP // 365

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1}}
// function String.appendChar with 1
(String.appendChar)
@SP // 366
AM=M+1 // 367
A=A-1 // 368
M=0 // 369

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 370
A=M // 371
D=M // 372
@3 // 373
M=D // 374

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.5 // 375
D=A // 376
@SP // 377
AM=M+1 // 378
A=A-1 // 379
M=D // 380
@THIS // 381
A=M+1 // 382
A=A+1 // 383
D=M // 384
A=A-1 // 385
D=M-D // 386
@DO_EQ // 387
0;JMP // 388
(String.appendChar.EQ.5)
@String.appendChar$IF_TRUE1 // 389
D;JNE // 390

////GotoInstruction{label='String.appendChar$IF_END1}
// goto String.appendChar$IF_END1
@String.appendChar$IF_END1 // 391
0;JMP // 392

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

@THIS // 393
A=M+1 // 394
A=A+1 // 395
D=M // 396
D=D+M // 397
@SP // 398
AM=M+1 // 399
A=A-1 // 400
M=D // 401
// call Memory.alloc
@6 // 402
D=A // 403
@14 // 404
M=D // 405
@Memory.alloc // 406
D=A // 407
@13 // 408
M=D // 409
@String.appendChar.ret.0 // 410
D=A // 411
@CALL // 412
0;JMP // 413
(String.appendChar.ret.0)
@SP // 414
AM=M-1 // 415
D=M // 416
@LCL // 417
A=M // 418
M=D // 419

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 420
A=M // 421
D=M // 422
@SP // 423
AM=M+1 // 424
A=A-1 // 425
M=D // 426
@LCL // 427
A=M // 428
D=M // 429
@SP // 430
AM=M+1 // 431
A=A-1 // 432
M=D // 433
@THIS // 434
A=M+1 // 435
D=M // 436
@SP // 437
AM=M+1 // 438
A=A-1 // 439
M=D // 440
// call Memory.copy
@8 // 441
D=A // 442
@14 // 443
M=D // 444
@Memory.copy // 445
D=A // 446
@13 // 447
M=D // 448
@String.appendChar.ret.1 // 449
D=A // 450
@CALL // 451
0;JMP // 452
(String.appendChar.ret.1)
@SP // 453
M=M-1 // 454

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 455
A=M // 456
D=M // 457
@SP // 458
AM=M+1 // 459
A=A-1 // 460
M=D // 461
// call Memory.deAlloc
@6 // 462
D=A // 463
@14 // 464
M=D // 465
@Memory.deAlloc // 466
D=A // 467
@13 // 468
M=D // 469
@String.appendChar.ret.2 // 470
D=A // 471
@CALL // 472
0;JMP // 473
(String.appendChar.ret.2)
@SP // 474
M=M-1 // 475

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

@THIS // 476
A=M+1 // 477
A=A+1 // 478
D=M // 479
@THIS // 480
A=M+1 // 481
A=A+1 // 482
M=D+M // 483

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 484
A=M // 485
D=M // 486
@THIS // 487
A=M // 488
M=D // 489

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
@THIS // 490
A=M+1 // 491
D=M // 492
A=A-1 // 493
D=D+M // 494
@SP // 495
AM=M+1 // 496
A=A-1 // 497
M=D // 498
@ARG // 499
A=M+1 // 500
D=M // 501
@SP // 502
AM=M-1 // 503
A=M // 504
M=D // 505

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

@THIS // 506
A=M+1 // 507
M=M+1 // 508

////PushInstruction("pointer 0")
@3 // 509
D=M // 510
@SP // 511
AM=M+1 // 512
A=A-1 // 513
M=D // 514
@RETURN // 515
0;JMP // 516

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 517
AM=M+1 // 518
A=A-1 // 519
M=0 // 520

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 521
A=M // 522
D=M // 523
@LCL // 524
A=M // 525
M=D // 526

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
@Screen.drawHorizontalLine.GT.6 // 527
D=A // 528
@SP // 529
AM=M+1 // 530
A=A-1 // 531
M=D // 532
@LCL // 533
A=M // 534
D=M // 535
@ARG // 536
A=M+1 // 537
D=D-M // 538
@DO_GT // 539
0;JMP // 540
(Screen.drawHorizontalLine.GT.6)
@Screen.drawHorizontalLine_WHILE_END1 // 541
D;JNE // 542

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 543
A=M // 544
D=M // 545
@SP // 546
AM=M+1 // 547
A=A-1 // 548
M=D // 549
@ARG // 550
A=M+1 // 551
A=A+1 // 552
D=M // 553
@SP // 554
AM=M+1 // 555
A=A-1 // 556
M=D // 557
// call Screen.drawPixel
@7 // 558
D=A // 559
@14 // 560
M=D // 561
@Screen.drawPixel // 562
D=A // 563
@13 // 564
M=D // 565
@Screen.drawHorizontalLine.ret.0 // 566
D=A // 567
@CALL // 568
0;JMP // 569
(Screen.drawHorizontalLine.ret.0)
@SP // 570
M=M-1 // 571

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

@LCL // 572
A=M // 573
M=M+1 // 574

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 575
0;JMP // 576

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 577
AM=M+1 // 578
A=A-1 // 579
M=0 // 580
@RETURN // 581
0;JMP // 582

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.drawHorizontalLine=1}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 583
D=A // 584
@SP // 585
AM=D+M // 586
A=A-1 // 587
M=0 // 588
A=A-1 // 589
M=0 // 590
A=A-1 // 591
M=0 // 592
A=A-1 // 593
M=0 // 594
A=A-1 // 595
M=0 // 596
A=A-1 // 597
M=0 // 598
A=A-1 // 599
M=0 // 600
A=A-1 // 601
M=0 // 602
A=A-1 // 603
M=0 // 604
A=A-1 // 605
M=0 // 606

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 607
D=M // 608
@9 // 609
A=D+A // 610
M=-1 // 611

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Screen.0 // 612
D=!M // 613
@Screen.drawRectangle$IF_TRUE1 // 614
D;JNE // 615

////GotoInstruction{label='Screen.drawRectangle$IF_END1}
// goto Screen.drawRectangle$IF_END1
@Screen.drawRectangle$IF_END1 // 616
0;JMP // 617

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 618
D=M // 619
@9 // 620
A=D+A // 621
M=0 // 622

////LabelInstruction{label='Screen.drawRectangle$IF_END1}
// label Screen.drawRectangle$IF_END1
(Screen.drawRectangle$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 623
A=M+1 // 624
D=M // 625
@LCL // 626
A=M // 627
M=D // 628

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
@Screen.drawRectangle.GT.7 // 629
D=A // 630
@SP // 631
AM=M+1 // 632
A=A-1 // 633
M=D // 634
@LCL // 635
A=M // 636
D=M // 637
@ARG // 638
A=M+1 // 639
A=A+1 // 640
A=A+1 // 641
D=D-M // 642
@DO_GT // 643
0;JMP // 644
(Screen.drawRectangle.GT.7)
@Screen.drawRectangle_WHILE_END1 // 645
D;JNE // 646

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 647
A=M // 648
D=M // 649
@SP // 650
AM=M+1 // 651
A=A-1 // 652
M=D // 653
@16 // 654
D=A // 655
@SP // 656
AM=M+1 // 657
A=A-1 // 658
M=D // 659
// call Math.divide
@7 // 660
D=A // 661
@14 // 662
M=D // 663
@Math.divide // 664
D=A // 665
@13 // 666
M=D // 667
@Screen.drawRectangle.ret.0 // 668
D=A // 669
@CALL // 670
0;JMP // 671
(Screen.drawRectangle.ret.0)
@SP // 672
AM=M-1 // 673
D=M // 674
@LCL // 675
A=M+1 // 676
M=D // 677

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 678
A=M+1 // 679
A=A+1 // 680
D=M // 681
@SP // 682
AM=M+1 // 683
A=A-1 // 684
M=D // 685
@16 // 686
D=A // 687
@SP // 688
AM=M+1 // 689
A=A-1 // 690
M=D // 691
// call Math.divide
@7 // 692
D=A // 693
@14 // 694
M=D // 695
@Math.divide // 696
D=A // 697
@13 // 698
M=D // 699
@Screen.drawRectangle.ret.1 // 700
D=A // 701
@CALL // 702
0;JMP // 703
(Screen.drawRectangle.ret.1)
@SP // 704
AM=M-1 // 705
D=M // 706
@LCL // 707
A=M+1 // 708
A=A+1 // 709
M=D // 710

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

@ARG // 711
A=M // 712
D=M // 713
@15 // 714
D=D&A // 715
@LCL // 716
A=M+1 // 717
A=A+1 // 718
A=A+1 // 719
M=D // 720

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

@ARG // 721
A=M+1 // 722
A=A+1 // 723
D=M // 724
@15 // 725
D=D&A // 726
@SP // 727
AM=M+1 // 728
A=A-1 // 729
M=D // 730
@LCL // 731
D=M // 732
@4 // 733
A=D+A // 734
D=A // 735
@R13 // 736
M=D // 737
@SP // 738
AM=M-1 // 739
D=M // 740
@R13 // 741
A=M // 742
M=D // 743

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 744
A=M // 745
D=M // 746
@SP // 747
AM=M+1 // 748
A=A-1 // 749
M=D // 750
@32 // 751
D=A // 752
@SP // 753
AM=M+1 // 754
A=A-1 // 755
M=D // 756
// call Math.multiply
@7 // 757
D=A // 758
@14 // 759
M=D // 760
@Math.multiply // 761
D=A // 762
@13 // 763
M=D // 764
@Screen.drawRectangle.ret.2 // 765
D=A // 766
@CALL // 767
0;JMP // 768
(Screen.drawRectangle.ret.2)
@LCL // 769
D=M // 770
@5 // 771
A=D+A // 772
D=A // 773
@R13 // 774
M=D // 775
@SP // 776
AM=M-1 // 777
D=M // 778
@R13 // 779
A=M // 780
M=D // 781

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.8 // 782
D=A // 783
@SP // 784
AM=M+1 // 785
A=A-1 // 786
M=D // 787
@LCL // 788
A=M+1 // 789
A=A+1 // 790
D=M // 791
A=A-1 // 792
D=M-D // 793
@DO_EQ // 794
0;JMP // 795
(Screen.drawRectangle.EQ.8)
@Screen.drawRectangle$IF_TRUE2 // 796
D;JNE // 797

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 798
0;JMP // 799

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

@LCL // 800
D=M // 801
@4 // 802
A=D+A // 803
D=M // 804
D=D+1 // 805
@SP // 806
AM=M+1 // 807
A=A-1 // 808
M=D // 809
// call Math.twoToThe
@6 // 810
D=A // 811
@14 // 812
M=D // 813
@Math.twoToThe // 814
D=A // 815
@13 // 816
M=D // 817
@Screen.drawRectangle.ret.3 // 818
D=A // 819
@CALL // 820
0;JMP // 821
(Screen.drawRectangle.ret.3)
@SP // 822
AM=M-1 // 823
D=M // 824
D=D-1 // 825
@SP // 826
AM=M+1 // 827
A=A-1 // 828
M=D // 829
@LCL // 830
A=M+1 // 831
A=A+1 // 832
A=A+1 // 833
D=M // 834
@SP // 835
AM=M+1 // 836
A=A-1 // 837
M=D // 838
// call Math.twoToThe
@6 // 839
D=A // 840
@14 // 841
M=D // 842
@Math.twoToThe // 843
D=A // 844
@13 // 845
M=D // 846
@Screen.drawRectangle.ret.4 // 847
D=A // 848
@CALL // 849
0;JMP // 850
(Screen.drawRectangle.ret.4)
@SP // 851
AM=M-1 // 852
D=M // 853
D=D-1 // 854
@SP // 855
AM=M-1 // 856
D=M-D // 857
@SP // 858
AM=M+1 // 859
A=A-1 // 860
M=D // 861
@LCL // 862
D=M // 863
@6 // 864
A=D+A // 865
D=A // 866
@R13 // 867
M=D // 868
@SP // 869
AM=M-1 // 870
D=M // 871
@R13 // 872
A=M // 873
M=D // 874

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

@RETURN_PUSH_LABEL_0 // 875
D=A // 876
@13 // 877
M=D // 878
@5 // 879
D=A // 880
@LCL_PUSH // 881
0;JMP // 882
(RETURN_PUSH_LABEL_0)
@LCL // 883
A=M+1 // 884
D=M // 885
@SP // 886
AM=M-1 // 887
D=D+M // 888
@SP // 889
AM=M+1 // 890
A=A-1 // 891
M=D // 892
@LCL // 893
D=M // 894
@7 // 895
A=D+A // 896
D=A // 897
@R13 // 898
M=D // 899
@SP // 900
AM=M-1 // 901
D=M // 902
@R13 // 903
A=M // 904
M=D // 905

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Screen.0 // 906
D=M // 907
@Screen.drawRectangle$IF_TRUE3 // 908
D;JNE // 909

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 910
0;JMP // 911

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
@LCL // 912
D=M // 913
@7 // 914
A=D+A // 915
D=M // 916
@16384 // 917
D=D+A // 918
@SP // 919
AM=M+1 // 920
A=A-1 // 921
M=D // 922
@LCL // 923
D=M // 924
@7 // 925
A=D+A // 926
D=M // 927
@LCL // 928
D=M // 929
@7 // 930
A=D+A // 931
D=M // 932
@16384 // 933
D=D+A // 934
A=D // 935
D=M // 936
@SP // 937
AM=M+1 // 938
A=A-1 // 939
M=D // 940
@LCL // 941
D=M // 942
@6 // 943
A=D+A // 944
D=M // 945
@SP // 946
AM=M-1 // 947
D=D|M // 948
@SP // 949
AM=M-1 // 950
A=M // 951
M=D // 952

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 953
0;JMP // 954

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
@LCL // 955
D=M // 956
@7 // 957
A=D+A // 958
D=M // 959
@16384 // 960
D=D+A // 961
@SP // 962
AM=M+1 // 963
A=A-1 // 964
M=D // 965
@LCL // 966
D=M // 967
@7 // 968
A=D+A // 969
D=M // 970
@LCL // 971
D=M // 972
@7 // 973
A=D+A // 974
D=M // 975
@16384 // 976
D=D+A // 977
A=D // 978
D=M // 979
@SP // 980
AM=M+1 // 981
A=A-1 // 982
M=D // 983
@LCL // 984
D=M // 985
@6 // 986
A=D+A // 987
D=!M // 988
@SP // 989
AM=M-1 // 990
D=D&M // 991
@SP // 992
AM=M-1 // 993
A=M // 994
M=D // 995

////LabelInstruction{label='Screen.drawRectangle$IF_END3}
// label Screen.drawRectangle$IF_END3
(Screen.drawRectangle$IF_END3)

////GotoInstruction{label='Screen.drawRectangle$IF_END2}
// goto Screen.drawRectangle$IF_END2
@Screen.drawRectangle$IF_END2 // 996
0;JMP // 997

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

@LCL // 998
A=M+1 // 999
A=A+1 // 1000
A=A+1 // 1001
D=M // 1002
@SP // 1003
AM=M+1 // 1004
A=A-1 // 1005
M=D // 1006
// call Math.twoToThe
@6 // 1007
D=A // 1008
@14 // 1009
M=D // 1010
@Math.twoToThe // 1011
D=A // 1012
@13 // 1013
M=D // 1014
@Screen.drawRectangle.ret.5 // 1015
D=A // 1016
@CALL // 1017
0;JMP // 1018
(Screen.drawRectangle.ret.5)
@SP // 1019
AM=M-1 // 1020
D=M // 1021
D=D-1 // 1022
@SP // 1023
AM=M+1 // 1024
A=A-1 // 1025
M=D // 1026
@SP // 1027
A=M-1 // 1028
M=!D // 1029
@LCL // 1030
D=M // 1031
@6 // 1032
A=D+A // 1033
D=A // 1034
@R13 // 1035
M=D // 1036
@SP // 1037
AM=M-1 // 1038
D=M // 1039
@R13 // 1040
A=M // 1041
M=D // 1042

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

@RETURN_PUSH_LABEL_1 // 1043
D=A // 1044
@13 // 1045
M=D // 1046
@5 // 1047
D=A // 1048
@LCL_PUSH // 1049
0;JMP // 1050
(RETURN_PUSH_LABEL_1)
@LCL // 1051
A=M+1 // 1052
D=M // 1053
@SP // 1054
AM=M-1 // 1055
D=D+M // 1056
@SP // 1057
AM=M+1 // 1058
A=A-1 // 1059
M=D // 1060
@LCL // 1061
D=M // 1062
@7 // 1063
A=D+A // 1064
D=A // 1065
@R13 // 1066
M=D // 1067
@SP // 1068
AM=M-1 // 1069
D=M // 1070
@R13 // 1071
A=M // 1072
M=D // 1073

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE4}}
@Screen.0 // 1074
D=M // 1075
@Screen.drawRectangle$IF_TRUE4 // 1076
D;JNE // 1077

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE4}
// goto Screen.drawRectangle$IF_FALSE4
@Screen.drawRectangle$IF_FALSE4 // 1078
0;JMP // 1079

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
@LCL // 1080
D=M // 1081
@7 // 1082
A=D+A // 1083
D=M // 1084
@16384 // 1085
D=D+A // 1086
@SP // 1087
AM=M+1 // 1088
A=A-1 // 1089
M=D // 1090
@LCL // 1091
D=M // 1092
@7 // 1093
A=D+A // 1094
D=M // 1095
@LCL // 1096
D=M // 1097
@7 // 1098
A=D+A // 1099
D=M // 1100
@16384 // 1101
D=D+A // 1102
A=D // 1103
D=M // 1104
@SP // 1105
AM=M+1 // 1106
A=A-1 // 1107
M=D // 1108
@LCL // 1109
D=M // 1110
@6 // 1111
A=D+A // 1112
D=M // 1113
@SP // 1114
AM=M-1 // 1115
D=D|M // 1116
@SP // 1117
AM=M-1 // 1118
A=M // 1119
M=D // 1120

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 1121
0;JMP // 1122

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
@LCL // 1123
D=M // 1124
@7 // 1125
A=D+A // 1126
D=M // 1127
@16384 // 1128
D=D+A // 1129
@SP // 1130
AM=M+1 // 1131
A=A-1 // 1132
M=D // 1133
@LCL // 1134
D=M // 1135
@7 // 1136
A=D+A // 1137
D=M // 1138
@LCL // 1139
D=M // 1140
@7 // 1141
A=D+A // 1142
D=M // 1143
@16384 // 1144
D=D+A // 1145
A=D // 1146
D=M // 1147
@SP // 1148
AM=M+1 // 1149
A=A-1 // 1150
M=D // 1151
@LCL // 1152
D=M // 1153
@6 // 1154
A=D+A // 1155
D=!M // 1156
@SP // 1157
AM=M-1 // 1158
D=D&M // 1159
@SP // 1160
AM=M-1 // 1161
A=M // 1162
M=D // 1163

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

@LCL // 1164
A=M+1 // 1165
D=M // 1166
D=D+1 // 1167
@SP // 1168
AM=M+1 // 1169
A=A-1 // 1170
M=D // 1171
@LCL // 1172
D=M // 1173
@8 // 1174
A=D+A // 1175
D=A // 1176
@R13 // 1177
M=D // 1178
@SP // 1179
AM=M-1 // 1180
D=M // 1181
@R13 // 1182
A=M // 1183
M=D // 1184

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
@Screen.drawRectangle.LT.9 // 1185
D=A // 1186
@SP // 1187
AM=M+1 // 1188
A=A-1 // 1189
M=D // 1190
@RETURN_PUSH_LABEL_2 // 1191
D=A // 1192
@13 // 1193
M=D // 1194
@8 // 1195
D=A // 1196
@LCL_PUSH // 1197
0;JMP // 1198
(RETURN_PUSH_LABEL_2)
@LCL // 1199
A=M+1 // 1200
A=A+1 // 1201
D=M // 1202
@SP // 1203
AM=M-1 // 1204
D=M-D // 1205
@DO_LT // 1206
0;JMP // 1207
(Screen.drawRectangle.LT.9)
D=!D // 1208
@Screen.drawRectangle_WHILE_END2 // 1209
D;JNE // 1210

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

@LCL // 1211
D=M // 1212
@8 // 1213
A=D+A // 1214
D=M // 1215
A=A-1 // 1216
A=A-1 // 1217
A=A-1 // 1218
D=D+M // 1219
@SP // 1220
AM=M+1 // 1221
A=A-1 // 1222
M=D // 1223
@LCL // 1224
D=M // 1225
@7 // 1226
A=D+A // 1227
D=A // 1228
@R13 // 1229
M=D // 1230
@SP // 1231
AM=M-1 // 1232
D=M // 1233
@R13 // 1234
A=M // 1235
M=D // 1236

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1237
D=M // 1238
@7 // 1239
A=D+A // 1240
D=M // 1241
@16384 // 1242
D=D+A // 1243
@SP // 1244
AM=M+1 // 1245
A=A-1 // 1246
M=D // 1247
@LCL // 1248
D=M // 1249
@9 // 1250
A=D+A // 1251
D=M // 1252
@SP // 1253
AM=M-1 // 1254
A=M // 1255
M=D // 1256

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

@LCL // 1257
D=M // 1258
@8 // 1259
A=D+A // 1260
M=M+1 // 1261

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 1262
0;JMP // 1263

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

@LCL // 1264
D=M // 1265
@4 // 1266
A=D+A // 1267
D=M // 1268
D=D+1 // 1269
@SP // 1270
AM=M+1 // 1271
A=A-1 // 1272
M=D // 1273
// call Math.twoToThe
@6 // 1274
D=A // 1275
@14 // 1276
M=D // 1277
@Math.twoToThe // 1278
D=A // 1279
@13 // 1280
M=D // 1281
@Screen.drawRectangle.ret.6 // 1282
D=A // 1283
@CALL // 1284
0;JMP // 1285
(Screen.drawRectangle.ret.6)
@SP // 1286
AM=M-1 // 1287
D=M // 1288
D=D-1 // 1289
@SP // 1290
AM=M+1 // 1291
A=A-1 // 1292
M=D // 1293
@LCL // 1294
D=M // 1295
@6 // 1296
A=D+A // 1297
D=A // 1298
@R13 // 1299
M=D // 1300
@SP // 1301
AM=M-1 // 1302
D=M // 1303
@R13 // 1304
A=M // 1305
M=D // 1306

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

@LCL // 1307
D=M // 1308
@5 // 1309
A=D+A // 1310
D=M // 1311
A=A-1 // 1312
A=A-1 // 1313
A=A-1 // 1314
D=D+M // 1315
@SP // 1316
AM=M+1 // 1317
A=A-1 // 1318
M=D // 1319
@LCL // 1320
D=M // 1321
@7 // 1322
A=D+A // 1323
D=A // 1324
@R13 // 1325
M=D // 1326
@SP // 1327
AM=M-1 // 1328
D=M // 1329
@R13 // 1330
A=M // 1331
M=D // 1332

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Screen.0 // 1333
D=M // 1334
@Screen.drawRectangle$IF_TRUE5 // 1335
D;JNE // 1336

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 1337
0;JMP // 1338

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
@LCL // 1339
D=M // 1340
@7 // 1341
A=D+A // 1342
D=M // 1343
@16384 // 1344
D=D+A // 1345
@SP // 1346
AM=M+1 // 1347
A=A-1 // 1348
M=D // 1349
@LCL // 1350
D=M // 1351
@7 // 1352
A=D+A // 1353
D=M // 1354
@LCL // 1355
D=M // 1356
@7 // 1357
A=D+A // 1358
D=M // 1359
@16384 // 1360
D=D+A // 1361
A=D // 1362
D=M // 1363
@SP // 1364
AM=M+1 // 1365
A=A-1 // 1366
M=D // 1367
@LCL // 1368
D=M // 1369
@6 // 1370
A=D+A // 1371
D=M // 1372
@SP // 1373
AM=M-1 // 1374
D=D|M // 1375
@SP // 1376
AM=M-1 // 1377
A=M // 1378
M=D // 1379

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 1380
0;JMP // 1381

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
@LCL // 1382
D=M // 1383
@7 // 1384
A=D+A // 1385
D=M // 1386
@16384 // 1387
D=D+A // 1388
@SP // 1389
AM=M+1 // 1390
A=A-1 // 1391
M=D // 1392
@LCL // 1393
D=M // 1394
@7 // 1395
A=D+A // 1396
D=M // 1397
@LCL // 1398
D=M // 1399
@7 // 1400
A=D+A // 1401
D=M // 1402
@16384 // 1403
D=D+A // 1404
A=D // 1405
D=M // 1406
@SP // 1407
AM=M+1 // 1408
A=A-1 // 1409
M=D // 1410
@LCL // 1411
D=M // 1412
@6 // 1413
A=D+A // 1414
D=!M // 1415
@SP // 1416
AM=M-1 // 1417
D=D&M // 1418
@SP // 1419
AM=M-1 // 1420
A=M // 1421
M=D // 1422

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

@LCL // 1423
A=M // 1424
M=M+1 // 1425

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 1426
0;JMP // 1427

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 1428
AM=M+1 // 1429
A=A-1 // 1430
M=0 // 1431
@RETURN // 1432
0;JMP // 1433

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
@Output.getMap.LT.10 // 1434
D=A // 1435
@SP // 1436
AM=M+1 // 1437
A=A-1 // 1438
M=D // 1439
@ARG // 1440
A=M // 1441
D=M // 1442
@32 // 1443
D=D-A // 1444
@DO_LT // 1445
0;JMP // 1446
(Output.getMap.LT.10)
@SP // 1447
AM=M+1 // 1448
A=A-1 // 1449
M=D // 1450
@Output.getMap.GT.11 // 1451
D=A // 1452
@SP // 1453
AM=M+1 // 1454
A=A-1 // 1455
M=D // 1456
@ARG // 1457
A=M // 1458
D=M // 1459
@126 // 1460
D=D-A // 1461
@DO_GT // 1462
0;JMP // 1463
(Output.getMap.GT.11)
@SP // 1464
AM=M-1 // 1465
D=D|M // 1466
@Output.getMap$IF_TRUE1 // 1467
D;JNE // 1468

////GotoInstruction{label='Output.getMap$IF_END1}
// goto Output.getMap$IF_END1
@Output.getMap$IF_END1 // 1469
0;JMP // 1470

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 1471
A=M // 1472
M=0 // 1473

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
@Output.0 // 1474
D=M // 1475
@ARG // 1476
A=M // 1477
A=D+M // 1478
D=M // 1479
@SP // 1480
AM=M+1 // 1481
A=A-1 // 1482
M=D // 1483
@RETURN // 1484
0;JMP // 1485

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 1486
M=M+1 // 1487
AM=M+1 // 1488
A=A-1 // 1489
M=0 // 1490
A=A-1 // 1491
M=0 // 1492

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

@ARG // 1493
A=M+1 // 1494
D=M // 1495
@SP // 1496
AM=M+1 // 1497
A=A-1 // 1498
M=D // 1499
@32 // 1500
D=A // 1501
@SP // 1502
AM=M+1 // 1503
A=A-1 // 1504
M=D // 1505
// call Math.multiply
@7 // 1506
D=A // 1507
@14 // 1508
M=D // 1509
@Math.multiply // 1510
D=A // 1511
@13 // 1512
M=D // 1513
@Screen.drawPixel.ret.0 // 1514
D=A // 1515
@CALL // 1516
0;JMP // 1517
(Screen.drawPixel.ret.0)
@ARG // 1518
A=M // 1519
D=M // 1520
@SP // 1521
AM=M+1 // 1522
A=A-1 // 1523
M=D // 1524
@16 // 1525
D=A // 1526
@SP // 1527
AM=M+1 // 1528
A=A-1 // 1529
M=D // 1530
// call Math.divide
@7 // 1531
D=A // 1532
@14 // 1533
M=D // 1534
@Math.divide // 1535
D=A // 1536
@13 // 1537
M=D // 1538
@Screen.drawPixel.ret.1 // 1539
D=A // 1540
@CALL // 1541
0;JMP // 1542
(Screen.drawPixel.ret.1)
@SP // 1543
AM=M-1 // 1544
D=M // 1545
@SP // 1546
AM=M-1 // 1547
D=D+M // 1548
@16384 // 1549
D=D+A // 1550
@LCL // 1551
A=M // 1552
M=D // 1553

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

@ARG // 1554
A=M // 1555
D=M // 1556
@15 // 1557
D=D&A // 1558
@LCL // 1559
A=M+1 // 1560
M=D // 1561

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 1562
D=M // 1563
@Screen.drawPixel$IF_TRUE1 // 1564
D;JNE // 1565

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 1566
0;JMP // 1567

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
@LCL // 1568
A=M // 1569
D=M // 1570
@0 // 1571
D=D+A // 1572
@SP // 1573
AM=M+1 // 1574
A=A-1 // 1575
M=D // 1576
@LCL // 1577
A=M // 1578
A=M // 1579
D=M // 1580
@SP // 1581
AM=M+1 // 1582
A=A-1 // 1583
M=D // 1584
@LCL // 1585
A=M+1 // 1586
D=M // 1587
@SP // 1588
AM=M+1 // 1589
A=A-1 // 1590
M=D // 1591
// call Math.twoToThe
@6 // 1592
D=A // 1593
@14 // 1594
M=D // 1595
@Math.twoToThe // 1596
D=A // 1597
@13 // 1598
M=D // 1599
@Screen.drawPixel.ret.2 // 1600
D=A // 1601
@CALL // 1602
0;JMP // 1603
(Screen.drawPixel.ret.2)
@SP // 1604
AM=M-1 // 1605
D=M // 1606
@SP // 1607
AM=M-1 // 1608
D=D|M // 1609
@SP // 1610
AM=M-1 // 1611
A=M // 1612
M=D // 1613

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 1614
0;JMP // 1615

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
@LCL // 1616
A=M // 1617
D=M // 1618
@0 // 1619
D=D+A // 1620
@SP // 1621
AM=M+1 // 1622
A=A-1 // 1623
M=D // 1624
@LCL // 1625
A=M // 1626
A=M // 1627
D=M // 1628
@SP // 1629
AM=M+1 // 1630
A=A-1 // 1631
M=D // 1632
@LCL // 1633
A=M+1 // 1634
D=M // 1635
@SP // 1636
AM=M+1 // 1637
A=A-1 // 1638
M=D // 1639
// call Math.twoToThe
@6 // 1640
D=A // 1641
@14 // 1642
M=D // 1643
@Math.twoToThe // 1644
D=A // 1645
@13 // 1646
M=D // 1647
@Screen.drawPixel.ret.3 // 1648
D=A // 1649
@CALL // 1650
0;JMP // 1651
(Screen.drawPixel.ret.3)
@SP // 1652
AM=M-1 // 1653
D=M // 1654
D=!D // 1655
@SP // 1656
AM=M-1 // 1657
D=D&M // 1658
@SP // 1659
AM=M-1 // 1660
A=M // 1661
M=D // 1662

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 1663
AM=M+1 // 1664
A=A-1 // 1665
M=0 // 1666
@RETURN // 1667
0;JMP // 1668

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1669
M=-1 // 1670

////PushInstruction("constant 0")
@SP // 1671
AM=M+1 // 1672
A=A-1 // 1673
M=0 // 1674
@RETURN // 1675
0;JMP // 1676

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.get_best_fit=0}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1677
D=A // 1678
@SP // 1679
AM=D+M // 1680
A=A-1 // 1681
M=0 // 1682
A=A-1 // 1683
M=0 // 1684
A=A-1 // 1685
M=0 // 1686
A=A-1 // 1687
M=0 // 1688
A=A-1 // 1689
M=0 // 1690

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1691
A=M // 1692
D=M // 1693
@SP // 1694
AM=M+1 // 1695
A=A-1 // 1696
M=D // 1697
// call Memory.getBinIndex
@6 // 1698
D=A // 1699
@14 // 1700
M=D // 1701
@Memory.getBinIndex // 1702
D=A // 1703
@13 // 1704
M=D // 1705
@Memory.alloc.ret.0 // 1706
D=A // 1707
@CALL // 1708
0;JMP // 1709
(Memory.alloc.ret.0)
@SP // 1710
AM=M-1 // 1711
D=M // 1712
@LCL // 1713
A=M // 1714
M=D // 1715

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

@LCL // 1716
A=M // 1717
D=M // 1718
@2048 // 1719
D=D+A // 1720
@LCL // 1721
A=M+1 // 1722
M=D // 1723

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1724
A=M+1 // 1725
D=M // 1726
@SP // 1727
AM=M+1 // 1728
A=A-1 // 1729
M=D // 1730
@ARG // 1731
A=M // 1732
D=M // 1733
@SP // 1734
AM=M+1 // 1735
A=A-1 // 1736
M=D // 1737
// call Memory.get_best_fit
@7 // 1738
D=A // 1739
@14 // 1740
M=D // 1741
@Memory.get_best_fit // 1742
D=A // 1743
@13 // 1744
M=D // 1745
@Memory.alloc.ret.1 // 1746
D=A // 1747
@CALL // 1748
0;JMP // 1749
(Memory.alloc.ret.1)
@SP // 1750
AM=M-1 // 1751
D=M // 1752
@LCL // 1753
A=M+1 // 1754
A=A+1 // 1755
M=D // 1756

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
@Memory.alloc.EQ.12 // 1757
D=A // 1758
@SP // 1759
AM=M+1 // 1760
A=A-1 // 1761
M=D // 1762
@LCL // 1763
A=M+1 // 1764
A=A+1 // 1765
D=M // 1766
@DO_EQ // 1767
0;JMP // 1768
(Memory.alloc.EQ.12)
D=!D // 1769
@Memory.alloc_WHILE_END1 // 1770
D;JNE // 1771

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
@Memory.alloc.LT.13 // 1772
D=A // 1773
@SP // 1774
AM=M+1 // 1775
A=A-1 // 1776
M=D // 1777
@LCL // 1778
A=M // 1779
D=M // 1780
D=D+1 // 1781
@7 // 1782
D=D-A // 1783
@DO_LT // 1784
0;JMP // 1785
(Memory.alloc.LT.13)
D=!D // 1786
@Memory.alloc$IF_TRUE1 // 1787
D;JNE // 1788

////GotoInstruction{label='Memory.alloc$IF_END1}
// goto Memory.alloc$IF_END1
@Memory.alloc$IF_END1 // 1789
0;JMP // 1790

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1791
AM=M+1 // 1792
A=A-1 // 1793
M=0 // 1794
@RETURN // 1795
0;JMP // 1796

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

@LCL // 1797
A=M // 1798
M=M+1 // 1799

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

@LCL // 1800
A=M // 1801
D=M // 1802
@2048 // 1803
D=D+A // 1804
@LCL // 1805
A=M+1 // 1806
M=D // 1807

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1808
A=M+1 // 1809
D=M // 1810
@SP // 1811
AM=M+1 // 1812
A=A-1 // 1813
M=D // 1814
@ARG // 1815
A=M // 1816
D=M // 1817
@SP // 1818
AM=M+1 // 1819
A=A-1 // 1820
M=D // 1821
// call Memory.get_best_fit
@7 // 1822
D=A // 1823
@14 // 1824
M=D // 1825
@Memory.get_best_fit // 1826
D=A // 1827
@13 // 1828
M=D // 1829
@Memory.alloc.ret.2 // 1830
D=A // 1831
@CALL // 1832
0;JMP // 1833
(Memory.alloc.ret.2)
@SP // 1834
AM=M-1 // 1835
D=M // 1836
@LCL // 1837
A=M+1 // 1838
A=A+1 // 1839
M=D // 1840

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 1841
0;JMP // 1842

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

@LCL // 1843
A=M+1 // 1844
A=A+1 // 1845
A=M // 1846
D=M // 1847
@SP // 1848
AM=M+1 // 1849
A=A-1 // 1850
M=D // 1851
// call Memory.getBinIndex
@6 // 1852
D=A // 1853
@14 // 1854
M=D // 1855
@Memory.getBinIndex // 1856
D=A // 1857
@13 // 1858
M=D // 1859
@Memory.alloc.ret.3 // 1860
D=A // 1861
@CALL // 1862
0;JMP // 1863
(Memory.alloc.ret.3)
@SP // 1864
AM=M-1 // 1865
D=M // 1866
@2048 // 1867
D=D+A // 1868
@SP // 1869
AM=M+1 // 1870
A=A-1 // 1871
M=D // 1872
@LCL // 1873
A=M+1 // 1874
A=A+1 // 1875
D=M // 1876
@SP // 1877
AM=M+1 // 1878
A=A-1 // 1879
M=D // 1880
// call Memory.remove_node
@7 // 1881
D=A // 1882
@14 // 1883
M=D // 1884
@Memory.remove_node // 1885
D=A // 1886
@13 // 1887
M=D // 1888
@Memory.alloc.ret.4 // 1889
D=A // 1890
@CALL // 1891
0;JMP // 1892
(Memory.alloc.ret.4)
@SP // 1893
M=M-1 // 1894

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

@LCL // 1895
A=M+1 // 1896
A=A+1 // 1897
A=M // 1898
D=M // 1899
@SP // 1900
AM=M+1 // 1901
A=A-1 // 1902
M=D // 1903
@ARG // 1904
A=M // 1905
D=M // 1906
@SP // 1907
AM=M-1 // 1908
D=M-D // 1909
@LCL // 1910
A=M+1 // 1911
A=A+1 // 1912
A=A+1 // 1913
M=D // 1914

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 3"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Memory.alloc$IF_TRUE2}}
@Memory.alloc.GT.14 // 1915
D=A // 1916
@SP // 1917
AM=M+1 // 1918
A=A-1 // 1919
M=D // 1920
@LCL // 1921
A=M+1 // 1922
A=A+1 // 1923
A=A+1 // 1924
D=M // 1925
@5 // 1926
D=D-A // 1927
@DO_GT // 1928
0;JMP // 1929
(Memory.alloc.GT.14)
@Memory.alloc$IF_TRUE2 // 1930
D;JNE // 1931

////GotoInstruction{label='Memory.alloc$IF_FALSE2}
// goto Memory.alloc$IF_FALSE2
@Memory.alloc$IF_FALSE2 // 1932
0;JMP // 1933

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
@LCL // 1934
A=M+1 // 1935
A=A+1 // 1936
D=M // 1937
@0 // 1938
D=D+A // 1939
@SP // 1940
AM=M+1 // 1941
A=A-1 // 1942
M=D // 1943
@ARG // 1944
A=M // 1945
D=M // 1946
@SP // 1947
AM=M-1 // 1948
A=M // 1949
M=D // 1950

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1951
A=M+1 // 1952
A=A+1 // 1953
D=M // 1954
D=D+1 // 1955
@SP // 1956
AM=M+1 // 1957
A=A-1 // 1958
M=D // 1959
D=0 // 1960
@SP // 1961
AM=M-1 // 1962
A=M // 1963
M=D // 1964

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 1965
A=M+1 // 1966
A=A+1 // 1967
D=M // 1968
@SP // 1969
AM=M+1 // 1970
A=A-1 // 1971
M=D // 1972
// call Memory.create_foot
@6 // 1973
D=A // 1974
@14 // 1975
M=D // 1976
@Memory.create_foot // 1977
D=A // 1978
@13 // 1979
M=D // 1980
@Memory.alloc.ret.5 // 1981
D=A // 1982
@CALL // 1983
0;JMP // 1984
(Memory.alloc.ret.5)
@SP // 1985
M=M-1 // 1986

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

@LCL // 1987
A=M+1 // 1988
A=A+1 // 1989
D=M // 1990
@ARG // 1991
A=M // 1992
D=D+M // 1993
@5 // 1994
D=D+A // 1995
@SP // 1996
AM=M+1 // 1997
A=A-1 // 1998
M=D // 1999
@LCL // 2000
D=M // 2001
@4 // 2002
A=D+A // 2003
D=A // 2004
@R13 // 2005
M=D // 2006
@SP // 2007
AM=M-1 // 2008
D=M // 2009
@R13 // 2010
A=M // 2011
M=D // 2012

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
@LCL // 2013
D=M // 2014
@4 // 2015
A=D+A // 2016
D=M // 2017
@0 // 2018
D=D+A // 2019
@SP // 2020
AM=M+1 // 2021
A=A-1 // 2022
M=D // 2023
@LCL // 2024
A=M+1 // 2025
A=A+1 // 2026
A=A+1 // 2027
D=M // 2028
@5 // 2029
D=D-A // 2030
@SP // 2031
AM=M-1 // 2032
A=M // 2033
M=D // 2034

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2035
D=M // 2036
@4 // 2037
A=D+A // 2038
D=M // 2039
D=D+1 // 2040
@SP // 2041
AM=M+1 // 2042
A=A-1 // 2043
M=D // 2044
D=1 // 2045
@SP // 2046
AM=M-1 // 2047
A=M // 2048
M=D // 2049

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@RETURN_PUSH_LABEL_3 // 2050
D=A // 2051
@13 // 2052
M=D // 2053
@4 // 2054
D=A // 2055
@LCL_PUSH // 2056
0;JMP // 2057
(RETURN_PUSH_LABEL_3)
// call Memory.create_foot
@6 // 2058
D=A // 2059
@14 // 2060
M=D // 2061
@Memory.create_foot // 2062
D=A // 2063
@13 // 2064
M=D // 2065
@Memory.alloc.ret.6 // 2066
D=A // 2067
@CALL // 2068
0;JMP // 2069
(Memory.alloc.ret.6)
@SP // 2070
M=M-1 // 2071

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

@LCL // 2072
A=M+1 // 2073
A=A+1 // 2074
A=A+1 // 2075
D=M // 2076
@SP // 2077
AM=M+1 // 2078
A=A-1 // 2079
M=D // 2080
// call Memory.getBinIndex
@6 // 2081
D=A // 2082
@14 // 2083
M=D // 2084
@Memory.getBinIndex // 2085
D=A // 2086
@13 // 2087
M=D // 2088
@Memory.alloc.ret.7 // 2089
D=A // 2090
@CALL // 2091
0;JMP // 2092
(Memory.alloc.ret.7)
@SP // 2093
AM=M-1 // 2094
D=M // 2095
@2048 // 2096
D=D+A // 2097
@SP // 2098
AM=M+1 // 2099
A=A-1 // 2100
M=D // 2101
@RETURN_PUSH_LABEL_4 // 2102
D=A // 2103
@13 // 2104
M=D // 2105
@4 // 2106
D=A // 2107
@LCL_PUSH // 2108
0;JMP // 2109
(RETURN_PUSH_LABEL_4)
// call Memory.add_node
@7 // 2110
D=A // 2111
@14 // 2112
M=D // 2113
@Memory.add_node // 2114
D=A // 2115
@13 // 2116
M=D // 2117
@Memory.alloc.ret.8 // 2118
D=A // 2119
@CALL // 2120
0;JMP // 2121
(Memory.alloc.ret.8)
@SP // 2122
M=M-1 // 2123

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 2124
0;JMP // 2125

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
@LCL // 2126
A=M+1 // 2127
A=A+1 // 2128
D=M // 2129
D=D+1 // 2130
@SP // 2131
AM=M+1 // 2132
A=A-1 // 2133
M=D // 2134
D=0 // 2135
@SP // 2136
AM=M-1 // 2137
A=M // 2138
M=D // 2139

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2140
A=M+1 // 2141
A=A+1 // 2142
D=M // 2143
@SP // 2144
AM=M+1 // 2145
A=A-1 // 2146
M=D // 2147
// call Memory.create_foot
@6 // 2148
D=A // 2149
@14 // 2150
M=D // 2151
@Memory.create_foot // 2152
D=A // 2153
@13 // 2154
M=D // 2155
@Memory.alloc.ret.9 // 2156
D=A // 2157
@CALL // 2158
0;JMP // 2159
(Memory.alloc.ret.9)
@SP // 2160
M=M-1 // 2161

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
@LCL // 2162
A=M+1 // 2163
A=A+1 // 2164
D=M // 2165
@4 // 2166
D=D+A // 2167
@SP // 2168
AM=M+1 // 2169
A=A-1 // 2170
M=D // 2171
@RETURN // 2172
0;JMP // 2173

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
@ARG // 2174
A=M // 2175
D=M // 2176
@SP // 2177
AM=M+1 // 2178
A=A-1 // 2179
M=D // 2180
@ARG // 2181
A=M // 2182
A=M // 2183
D=M // 2184
@4 // 2185
D=D+A // 2186
@SP // 2187
AM=M-1 // 2188
D=D+M // 2189
@SP // 2190
AM=M+1 // 2191
A=A-1 // 2192
M=D // 2193
@ARG // 2194
A=M // 2195
D=M // 2196
@SP // 2197
AM=M-1 // 2198
A=M // 2199
M=D // 2200

////PushInstruction("constant 0")
@SP // 2201
AM=M+1 // 2202
A=A-1 // 2203
M=0 // 2204
@RETURN // 2205
0;JMP // 2206

////FunctionInstruction{functionName='Math.abs', numLocals=0, funcMapping={}}
// function Math.abs with 0
(Math.abs)

////CallGroup{pushes=[PushInstruction("argument 0"), UnaryPushGroup(    PushInstruction("argument 0"),
//NEG)], call=CallInstruction{Math.max}}
@ARG // 2207
A=M // 2208
D=M // 2209
@SP // 2210
AM=M+1 // 2211
A=A-1 // 2212
M=D // 2213
@ARG // 2214
A=M // 2215
D=M // 2216
@SP // 2217
AM=M+1 // 2218
A=A-1 // 2219
M=D // 2220
@SP // 2221
A=M-1 // 2222
M=-D // 2223
// call Math.max
@7 // 2224
D=A // 2225
@14 // 2226
M=D // 2227
@Math.max // 2228
D=A // 2229
@13 // 2230
M=D // 2231
@Math.abs.ret.0 // 2232
D=A // 2233
@CALL // 2234
0;JMP // 2235
(Math.abs.ret.0)
@RETURN // 2236
0;JMP // 2237

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
@Math.0 // 2238
D=M // 2239
@ARG // 2240
A=M // 2241
A=D+M // 2242
D=M // 2243
@SP // 2244
AM=M+1 // 2245
A=A-1 // 2246
M=D // 2247
@RETURN // 2248
0;JMP // 2249

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2250
M=M+1 // 2251
AM=M+1 // 2252
A=A-1 // 2253
M=0 // 2254
A=A-1 // 2255
M=0 // 2256

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2257
A=M // 2258
M=0 // 2259

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2260
A=M // 2261
D=M // 2262
@SP // 2263
AM=M+1 // 2264
A=A-1 // 2265
M=D // 2266
// call String.length
@6 // 2267
D=A // 2268
@14 // 2269
M=D // 2270
@String.length // 2271
D=A // 2272
@13 // 2273
M=D // 2274
@Output.printString.ret.0 // 2275
D=A // 2276
@CALL // 2277
0;JMP // 2278
(Output.printString.ret.0)
@SP // 2279
AM=M-1 // 2280
D=M // 2281
@LCL // 2282
A=M+1 // 2283
M=D // 2284

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
@Output.printString.LT.15 // 2285
D=A // 2286
@SP // 2287
AM=M+1 // 2288
A=A-1 // 2289
M=D // 2290
@LCL // 2291
A=M+1 // 2292
D=M // 2293
A=A-1 // 2294
D=M-D // 2295
@DO_LT // 2296
0;JMP // 2297
(Output.printString.LT.15)
D=!D // 2298
@Output.printString_WHILE_END1 // 2299
D;JNE // 2300

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2301
A=M // 2302
D=M // 2303
@SP // 2304
AM=M+1 // 2305
A=A-1 // 2306
M=D // 2307
@LCL // 2308
A=M // 2309
D=M // 2310
@SP // 2311
AM=M+1 // 2312
A=A-1 // 2313
M=D // 2314
// call String.charAt
@7 // 2315
D=A // 2316
@14 // 2317
M=D // 2318
@String.charAt // 2319
D=A // 2320
@13 // 2321
M=D // 2322
@Output.printString.ret.1 // 2323
D=A // 2324
@CALL // 2325
0;JMP // 2326
(Output.printString.ret.1)
// call Output.printChar
@6 // 2327
D=A // 2328
@14 // 2329
M=D // 2330
@Output.printChar // 2331
D=A // 2332
@13 // 2333
M=D // 2334
@Output.printString.ret.2 // 2335
D=A // 2336
@CALL // 2337
0;JMP // 2338
(Output.printString.ret.2)
@SP // 2339
M=M-1 // 2340

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

@LCL // 2341
A=M // 2342
M=M+1 // 2343

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2344
0;JMP // 2345

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2346
AM=M+1 // 2347
A=A-1 // 2348
M=0 // 2349
@RETURN // 2350
0;JMP // 2351

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2352
AM=M+1 // 2353
A=A-1 // 2354
M=0 // 2355

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2356
D=A // 2357
@SP // 2358
AM=M+1 // 2359
A=A-1 // 2360
M=D // 2361
// call Memory.alloc
@6 // 2362
D=A // 2363
@14 // 2364
M=D // 2365
@Memory.alloc // 2366
D=A // 2367
@13 // 2368
M=D // 2369
@Output.create.ret.0 // 2370
D=A // 2371
@CALL // 2372
0;JMP // 2373
(Output.create.ret.0)
@SP // 2374
AM=M-1 // 2375
D=M // 2376
@LCL // 2377
A=M // 2378
M=D // 2379

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 2380
D=M // 2381
@ARG // 2382
A=M // 2383
D=D+M // 2384
@SP // 2385
AM=M+1 // 2386
A=A-1 // 2387
M=D // 2388
@LCL // 2389
A=M // 2390
D=M // 2391
@SP // 2392
AM=M-1 // 2393
A=M // 2394
M=D // 2395

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2396
A=M // 2397
D=M // 2398
@0 // 2399
D=D+A // 2400
@SP // 2401
AM=M+1 // 2402
A=A-1 // 2403
M=D // 2404
@ARG // 2405
A=M+1 // 2406
D=M // 2407
@SP // 2408
AM=M-1 // 2409
A=M // 2410
M=D // 2411

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2412
A=M // 2413
D=M // 2414
D=D+1 // 2415
@SP // 2416
AM=M+1 // 2417
A=A-1 // 2418
M=D // 2419
@ARG // 2420
A=M+1 // 2421
A=A+1 // 2422
D=M // 2423
@SP // 2424
AM=M-1 // 2425
A=M // 2426
M=D // 2427

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2428
A=M // 2429
D=M // 2430
@2 // 2431
D=D+A // 2432
@SP // 2433
AM=M+1 // 2434
A=A-1 // 2435
M=D // 2436
@ARG // 2437
A=M+1 // 2438
A=A+1 // 2439
A=A+1 // 2440
D=M // 2441
@SP // 2442
AM=M-1 // 2443
A=M // 2444
M=D // 2445

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2446
A=M // 2447
D=M // 2448
@3 // 2449
D=D+A // 2450
@SP // 2451
AM=M+1 // 2452
A=A-1 // 2453
M=D // 2454
@ARG // 2455
D=M // 2456
@4 // 2457
A=D+A // 2458
D=M // 2459
@SP // 2460
AM=M-1 // 2461
A=M // 2462
M=D // 2463

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2464
A=M // 2465
D=M // 2466
@4 // 2467
D=D+A // 2468
@SP // 2469
AM=M+1 // 2470
A=A-1 // 2471
M=D // 2472
@ARG // 2473
D=M // 2474
@5 // 2475
A=D+A // 2476
D=M // 2477
@SP // 2478
AM=M-1 // 2479
A=M // 2480
M=D // 2481

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2482
A=M // 2483
D=M // 2484
@5 // 2485
D=D+A // 2486
@SP // 2487
AM=M+1 // 2488
A=A-1 // 2489
M=D // 2490
@ARG // 2491
D=M // 2492
@6 // 2493
A=D+A // 2494
D=M // 2495
@SP // 2496
AM=M-1 // 2497
A=M // 2498
M=D // 2499

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2500
A=M // 2501
D=M // 2502
@6 // 2503
D=D+A // 2504
@SP // 2505
AM=M+1 // 2506
A=A-1 // 2507
M=D // 2508
@ARG // 2509
D=M // 2510
@7 // 2511
A=D+A // 2512
D=M // 2513
@SP // 2514
AM=M-1 // 2515
A=M // 2516
M=D // 2517

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2518
A=M // 2519
D=M // 2520
@7 // 2521
D=D+A // 2522
@SP // 2523
AM=M+1 // 2524
A=A-1 // 2525
M=D // 2526
@ARG // 2527
D=M // 2528
@8 // 2529
A=D+A // 2530
D=M // 2531
@SP // 2532
AM=M-1 // 2533
A=M // 2534
M=D // 2535

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2536
A=M // 2537
D=M // 2538
@8 // 2539
D=D+A // 2540
@SP // 2541
AM=M+1 // 2542
A=A-1 // 2543
M=D // 2544
@ARG // 2545
D=M // 2546
@9 // 2547
A=D+A // 2548
D=M // 2549
@SP // 2550
AM=M-1 // 2551
A=M // 2552
M=D // 2553

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2554
A=M // 2555
D=M // 2556
@9 // 2557
D=D+A // 2558
@SP // 2559
AM=M+1 // 2560
A=A-1 // 2561
M=D // 2562
@ARG // 2563
D=M // 2564
@10 // 2565
A=D+A // 2566
D=M // 2567
@SP // 2568
AM=M-1 // 2569
A=M // 2570
M=D // 2571

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2572
A=M // 2573
D=M // 2574
@10 // 2575
D=D+A // 2576
@SP // 2577
AM=M+1 // 2578
A=A-1 // 2579
M=D // 2580
@ARG // 2581
D=M // 2582
@11 // 2583
A=D+A // 2584
D=M // 2585
@SP // 2586
AM=M-1 // 2587
A=M // 2588
M=D // 2589

////PushInstruction("constant 0")
@SP // 2590
AM=M+1 // 2591
A=A-1 // 2592
M=0 // 2593
@RETURN // 2594
0;JMP // 2595

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2596
A=M // 2597
D=M // 2598
@3 // 2599
M=D // 2600

////PushInstruction("this 1")
@THIS // 2601
A=M+1 // 2602
D=M // 2603
@SP // 2604
AM=M+1 // 2605
A=A-1 // 2606
M=D // 2607
@RETURN // 2608
0;JMP // 2609

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2610
D=A // 2611
@SP // 2612
AM=M+1 // 2613
A=A-1 // 2614
M=D // 2615
// call Memory.alloc
@6 // 2616
D=A // 2617
@14 // 2618
M=D // 2619
@Memory.alloc // 2620
D=A // 2621
@13 // 2622
M=D // 2623
@String.new.ret.0 // 2624
D=A // 2625
@CALL // 2626
0;JMP // 2627
(String.new.ret.0)
@SP // 2628
AM=M-1 // 2629
D=M // 2630
@3 // 2631
M=D // 2632

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.16 // 2633
D=A // 2634
@SP // 2635
AM=M+1 // 2636
A=A-1 // 2637
M=D // 2638
@ARG // 2639
A=M // 2640
D=M // 2641
@DO_EQ // 2642
0;JMP // 2643
(String.new.EQ.16)
@String.new$IF_TRUE1 // 2644
D;JNE // 2645

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2646
0;JMP // 2647

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2648
A=M // 2649
M=0 // 2650

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2651
0;JMP // 2652

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2653
A=M // 2654
D=M // 2655
@SP // 2656
AM=M+1 // 2657
A=A-1 // 2658
M=D // 2659
// call Memory.alloc
@6 // 2660
D=A // 2661
@14 // 2662
M=D // 2663
@Memory.alloc // 2664
D=A // 2665
@13 // 2666
M=D // 2667
@String.new.ret.1 // 2668
D=A // 2669
@CALL // 2670
0;JMP // 2671
(String.new.ret.1)
@SP // 2672
AM=M-1 // 2673
D=M // 2674
@THIS // 2675
A=M // 2676
M=D // 2677

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2678
A=M // 2679
D=M // 2680
@THIS // 2681
A=M+1 // 2682
A=A+1 // 2683
M=D // 2684

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2685
A=M+1 // 2686
M=0 // 2687

////PushInstruction("pointer 0")
@3 // 2688
D=M // 2689
@SP // 2690
AM=M+1 // 2691
A=A-1 // 2692
M=D // 2693
@RETURN // 2694
0;JMP // 2695

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2696
AM=M+1 // 2697
A=A-1 // 2698
M=0 // 2699

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2700
A=M // 2701
M=0 // 2702

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
@Memory.getBinIndex.LT.17 // 2703
D=A // 2704
@SP // 2705
AM=M+1 // 2706
A=A-1 // 2707
M=D // 2708
@LCL // 2709
A=M // 2710
D=M // 2711
@7 // 2712
D=D-A // 2713
@DO_LT // 2714
0;JMP // 2715
(Memory.getBinIndex.LT.17)
@SP // 2716
AM=M+1 // 2717
A=A-1 // 2718
M=D // 2719
@Memory.getBinIndex.EQ.18 // 2720
D=A // 2721
@SP // 2722
AM=M+1 // 2723
A=A-1 // 2724
M=D // 2725
@LCL // 2726
A=M // 2727
D=M // 2728
@LCL // 2729
A=M // 2730
D=M // 2731
@2048 // 2732
D=D+A // 2733
A=D // 2734
D=M // 2735
@DO_EQ // 2736
0;JMP // 2737
(Memory.getBinIndex.EQ.18)
D=!D // 2738
@SP // 2739
AM=M-1 // 2740
D=D&M // 2741
D=!D // 2742
@Memory.getBinIndex_WHILE_END1 // 2743
D;JNE // 2744

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
@Memory.getBinIndex.GT.19 // 2745
D=A // 2746
@SP // 2747
AM=M+1 // 2748
A=A-1 // 2749
M=D // 2750
@ARG // 2751
A=M // 2752
D=M // 2753
@SP // 2754
AM=M+1 // 2755
A=A-1 // 2756
M=D // 2757
@LCL // 2758
A=M // 2759
D=M // 2760
D=D+1 // 2761
@SP // 2762
AM=M+1 // 2763
A=A-1 // 2764
M=D // 2765
@16 // 2766
D=A // 2767
@SP // 2768
AM=M+1 // 2769
A=A-1 // 2770
M=D // 2771
// call Math.multiply
@7 // 2772
D=A // 2773
@14 // 2774
M=D // 2775
@Math.multiply // 2776
D=A // 2777
@13 // 2778
M=D // 2779
@Memory.getBinIndex.ret.0 // 2780
D=A // 2781
@CALL // 2782
0;JMP // 2783
(Memory.getBinIndex.ret.0)
@SP // 2784
AM=M-1 // 2785
D=M // 2786
@SP // 2787
AM=M-1 // 2788
D=M-D // 2789
@DO_GT // 2790
0;JMP // 2791
(Memory.getBinIndex.GT.19)
D=!D // 2792
@Memory.getBinIndex$IF_TRUE1 // 2793
D;JNE // 2794

////GotoInstruction{label='Memory.getBinIndex$IF_END1}
// goto Memory.getBinIndex$IF_END1
@Memory.getBinIndex$IF_END1 // 2795
0;JMP // 2796

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2797
A=M // 2798
D=M // 2799
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
@RETURN // 2804
0;JMP // 2805

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

@LCL // 2806
A=M // 2807
M=M+1 // 2808

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2809
0;JMP // 2810

////LabelInstruction{label='Memory.getBinIndex_WHILE_END1}
// label Memory.getBinIndex_WHILE_END1
(Memory.getBinIndex_WHILE_END1)

////PushInstruction("constant 6")
@6 // 2811
D=A // 2812
@SP // 2813
AM=M+1 // 2814
A=A-1 // 2815
M=D // 2816
@RETURN // 2817
0;JMP // 2818

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2819
D=A // 2820
@SP // 2821
AM=D+M // 2822
A=A-1 // 2823
M=0 // 2824
A=A-1 // 2825
M=0 // 2826
A=A-1 // 2827
M=0 // 2828

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
@Math.multiply.EQ.20 // 2829
D=A // 2830
@SP // 2831
AM=M+1 // 2832
A=A-1 // 2833
M=D // 2834
@ARG // 2835
A=M // 2836
D=M // 2837
@DO_EQ // 2838
0;JMP // 2839
(Math.multiply.EQ.20)
@SP // 2840
AM=M+1 // 2841
A=A-1 // 2842
M=D // 2843
@Math.multiply.EQ.21 // 2844
D=A // 2845
@SP // 2846
AM=M+1 // 2847
A=A-1 // 2848
M=D // 2849
@ARG // 2850
A=M+1 // 2851
D=M // 2852
@DO_EQ // 2853
0;JMP // 2854
(Math.multiply.EQ.21)
@SP // 2855
AM=M-1 // 2856
D=D|M // 2857
@Math.multiply$IF_TRUE1 // 2858
D;JNE // 2859

////GotoInstruction{label='Math.multiply$IF_END1}
// goto Math.multiply$IF_END1
@Math.multiply$IF_END1 // 2860
0;JMP // 2861

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2862
AM=M+1 // 2863
A=A-1 // 2864
M=0 // 2865
@RETURN // 2866
0;JMP // 2867

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
@Math.multiply.EQ.22 // 2868
D=A // 2869
@SP // 2870
AM=M+1 // 2871
A=A-1 // 2872
M=D // 2873
@ARG // 2874
A=M // 2875
D=M // 2876
D=D-1 // 2877
@DO_EQ // 2878
0;JMP // 2879
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE2 // 2880
D;JNE // 2881

////GotoInstruction{label='Math.multiply$IF_END2}
// goto Math.multiply$IF_END2
@Math.multiply$IF_END2 // 2882
0;JMP // 2883

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2884
A=M+1 // 2885
D=M // 2886
@SP // 2887
AM=M+1 // 2888
A=A-1 // 2889
M=D // 2890
@RETURN // 2891
0;JMP // 2892

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
@Math.multiply.EQ.23 // 2893
D=A // 2894
@SP // 2895
AM=M+1 // 2896
A=A-1 // 2897
M=D // 2898
@ARG // 2899
A=M+1 // 2900
D=M // 2901
D=D-1 // 2902
@DO_EQ // 2903
0;JMP // 2904
(Math.multiply.EQ.23)
@Math.multiply$IF_TRUE3 // 2905
D;JNE // 2906

////GotoInstruction{label='Math.multiply$IF_END3}
// goto Math.multiply$IF_END3
@Math.multiply$IF_END3 // 2907
0;JMP // 2908

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2909
A=M // 2910
D=M // 2911
@SP // 2912
AM=M+1 // 2913
A=A-1 // 2914
M=D // 2915
@RETURN // 2916
0;JMP // 2917

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
@Math.multiply.EQ.24 // 2918
D=A // 2919
@SP // 2920
AM=M+1 // 2921
A=A-1 // 2922
M=D // 2923
@ARG // 2924
A=M // 2925
D=M // 2926
@2 // 2927
D=D-A // 2928
@DO_EQ // 2929
0;JMP // 2930
(Math.multiply.EQ.24)
@Math.multiply$IF_TRUE4 // 2931
D;JNE // 2932

////GotoInstruction{label='Math.multiply$IF_END4}
// goto Math.multiply$IF_END4
@Math.multiply$IF_END4 // 2933
0;JMP // 2934

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
@ARG // 2935
A=M+1 // 2936
D=M // 2937
D=D+M // 2938
@SP // 2939
AM=M+1 // 2940
A=A-1 // 2941
M=D // 2942
@RETURN // 2943
0;JMP // 2944

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
@Math.multiply.EQ.25 // 2945
D=A // 2946
@SP // 2947
AM=M+1 // 2948
A=A-1 // 2949
M=D // 2950
@ARG // 2951
A=M+1 // 2952
D=M // 2953
@2 // 2954
D=D-A // 2955
@DO_EQ // 2956
0;JMP // 2957
(Math.multiply.EQ.25)
@Math.multiply$IF_TRUE5 // 2958
D;JNE // 2959

////GotoInstruction{label='Math.multiply$IF_END5}
// goto Math.multiply$IF_END5
@Math.multiply$IF_END5 // 2960
0;JMP // 2961

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
@ARG // 2962
A=M // 2963
D=M // 2964
D=D+M // 2965
@SP // 2966
AM=M+1 // 2967
A=A-1 // 2968
M=D // 2969
@RETURN // 2970
0;JMP // 2971

////LabelInstruction{label='Math.multiply$IF_END5}
// label Math.multiply$IF_END5
(Math.multiply$IF_END5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2972
A=M+1 // 2973
A=A+1 // 2974
M=1 // 2975

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2976
A=M+1 // 2977
M=0 // 2978

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2979
A=M // 2980
M=0 // 2981

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
@Math.multiply.LT.26 // 2982
D=A // 2983
@SP // 2984
AM=M+1 // 2985
A=A-1 // 2986
M=D // 2987
@LCL // 2988
A=M+1 // 2989
D=M // 2990
@16 // 2991
D=D-A // 2992
@DO_LT // 2993
0;JMP // 2994
(Math.multiply.LT.26)
D=!D // 2995
@Math.multiply_WHILE_END1 // 2996
D;JNE // 2997

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
@Math.multiply.EQ.27 // 2998
D=A // 2999
@SP // 3000
AM=M+1 // 3001
A=A-1 // 3002
M=D // 3003
@ARG // 3004
A=M+1 // 3005
D=M // 3006
@LCL // 3007
A=M+1 // 3008
A=A+1 // 3009
D=D&M // 3010
@DO_EQ // 3011
0;JMP // 3012
(Math.multiply.EQ.27)
D=!D // 3013
@Math.multiply$IF_TRUE6 // 3014
D;JNE // 3015

////GotoInstruction{label='Math.multiply$IF_END6}
// goto Math.multiply$IF_END6
@Math.multiply$IF_END6 // 3016
0;JMP // 3017

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

@ARG // 3018
A=M // 3019
D=M // 3020
@LCL // 3021
A=M // 3022
M=D+M // 3023

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

@ARG // 3024
A=M // 3025
D=M // 3026
@ARG // 3027
A=M // 3028
M=D+M // 3029

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

@LCL // 3030
A=M+1 // 3031
M=M+1 // 3032

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

@LCL // 3033
A=M+1 // 3034
A=A+1 // 3035
D=M // 3036
@LCL // 3037
A=M+1 // 3038
A=A+1 // 3039
M=D+M // 3040

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 3041
0;JMP // 3042

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 3043
A=M // 3044
D=M // 3045
@SP // 3046
AM=M+1 // 3047
A=A-1 // 3048
M=D // 3049
@RETURN // 3050
0;JMP // 3051

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3052
D=A // 3053
@SP // 3054
AM=D+M // 3055
A=A-1 // 3056
M=0 // 3057
A=A-1 // 3058
M=0 // 3059
A=A-1 // 3060
M=0 // 3061

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

@ARG // 3062
A=M // 3063
D=M // 3064
@4 // 3065
D=D-A // 3066
@LCL // 3067
A=M // 3068
M=D // 3069

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3070
A=M // 3071
D=M // 3072
D=D+1 // 3073
@SP // 3074
AM=M+1 // 3075
A=A-1 // 3076
M=D // 3077
D=1 // 3078
@SP // 3079
AM=M-1 // 3080
A=M // 3081
M=D // 3082

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

@LCL // 3083
A=M // 3084
D=M // 3085
@LCL // 3086
A=M // 3087
D=M // 3088
@2 // 3089
D=D+A // 3090
A=D // 3091
D=M // 3092
@LCL // 3093
A=M+1 // 3094
M=D // 3095

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

@LCL // 3096
A=M // 3097
D=M // 3098
@LCL // 3099
A=M // 3100
D=M // 3101
@3 // 3102
D=D+A // 3103
A=D // 3104
D=M // 3105
@LCL // 3106
A=M+1 // 3107
A=A+1 // 3108
M=D // 3109

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.28 // 3110
D=A // 3111
@SP // 3112
AM=M+1 // 3113
A=A-1 // 3114
M=D // 3115
@LCL // 3116
A=M+1 // 3117
D=M // 3118
@DO_EQ // 3119
0;JMP // 3120
(Memory.deAlloc.EQ.28)
D=!D // 3121
@Memory.deAlloc$IF_TRUE1 // 3122
D;JNE // 3123

////GotoInstruction{label='Memory.deAlloc$IF_END1}
// goto Memory.deAlloc$IF_END1
@Memory.deAlloc$IF_END1 // 3124
0;JMP // 3125

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
@Memory.deAlloc.EQ.29 // 3126
D=A // 3127
@SP // 3128
AM=M+1 // 3129
A=A-1 // 3130
M=D // 3131
@LCL // 3132
A=M+1 // 3133
A=M+1 // 3134
D=M // 3135
D=D-1 // 3136
@DO_EQ // 3137
0;JMP // 3138
(Memory.deAlloc.EQ.29)
@Memory.deAlloc$IF_TRUE2 // 3139
D;JNE // 3140

////GotoInstruction{label='Memory.deAlloc$IF_END2}
// goto Memory.deAlloc$IF_END2
@Memory.deAlloc$IF_END2 // 3141
0;JMP // 3142

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

@LCL // 3143
A=M+1 // 3144
A=M // 3145
D=M // 3146
@SP // 3147
AM=M+1 // 3148
A=A-1 // 3149
M=D // 3150
// call Memory.getBinIndex
@6 // 3151
D=A // 3152
@14 // 3153
M=D // 3154
@Memory.getBinIndex // 3155
D=A // 3156
@13 // 3157
M=D // 3158
@Memory.deAlloc.ret.0 // 3159
D=A // 3160
@CALL // 3161
0;JMP // 3162
(Memory.deAlloc.ret.0)
@SP // 3163
AM=M-1 // 3164
D=M // 3165
@2048 // 3166
D=D+A // 3167
@SP // 3168
AM=M+1 // 3169
A=A-1 // 3170
M=D // 3171
@LCL // 3172
A=M+1 // 3173
D=M // 3174
@SP // 3175
AM=M+1 // 3176
A=A-1 // 3177
M=D // 3178
// call Memory.remove_node
@7 // 3179
D=A // 3180
@14 // 3181
M=D // 3182
@Memory.remove_node // 3183
D=A // 3184
@13 // 3185
M=D // 3186
@Memory.deAlloc.ret.1 // 3187
D=A // 3188
@CALL // 3189
0;JMP // 3190
(Memory.deAlloc.ret.1)
@SP // 3191
M=M-1 // 3192

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
@LCL // 3193
A=M+1 // 3194
D=M // 3195
@0 // 3196
D=D+A // 3197
@SP // 3198
AM=M+1 // 3199
A=A-1 // 3200
M=D // 3201
@LCL // 3202
A=M+1 // 3203
A=M // 3204
D=M // 3205
@SP // 3206
AM=M+1 // 3207
A=A-1 // 3208
M=D // 3209
@LCL // 3210
A=M // 3211
A=M // 3212
D=M // 3213
@SP // 3214
AM=M-1 // 3215
D=D+M // 3216
@5 // 3217
D=D+A // 3218
@SP // 3219
AM=M-1 // 3220
A=M // 3221
M=D // 3222

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3223
A=M+1 // 3224
D=M // 3225
@SP // 3226
AM=M+1 // 3227
A=A-1 // 3228
M=D // 3229
// call Memory.create_foot
@6 // 3230
D=A // 3231
@14 // 3232
M=D // 3233
@Memory.create_foot // 3234
D=A // 3235
@13 // 3236
M=D // 3237
@Memory.deAlloc.ret.2 // 3238
D=A // 3239
@CALL // 3240
0;JMP // 3241
(Memory.deAlloc.ret.2)
@SP // 3242
M=M-1 // 3243

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3244
A=M+1 // 3245
D=M // 3246
@LCL // 3247
A=M // 3248
M=D // 3249

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
@Memory.deAlloc.EQ.30 // 3250
D=A // 3251
@SP // 3252
AM=M+1 // 3253
A=A-1 // 3254
M=D // 3255
@LCL // 3256
A=M+1 // 3257
A=A+1 // 3258
D=M // 3259
@DO_EQ // 3260
0;JMP // 3261
(Memory.deAlloc.EQ.30)
D=!D // 3262
@Memory.deAlloc$IF_TRUE3 // 3263
D;JNE // 3264

////GotoInstruction{label='Memory.deAlloc$IF_END3}
// goto Memory.deAlloc$IF_END3
@Memory.deAlloc$IF_END3 // 3265
0;JMP // 3266

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
@Memory.deAlloc.EQ.31 // 3267
D=A // 3268
@SP // 3269
AM=M+1 // 3270
A=A-1 // 3271
M=D // 3272
@LCL // 3273
A=M+1 // 3274
A=A+1 // 3275
A=M+1 // 3276
D=M // 3277
D=D-1 // 3278
@DO_EQ // 3279
0;JMP // 3280
(Memory.deAlloc.EQ.31)
@Memory.deAlloc$IF_TRUE4 // 3281
D;JNE // 3282

////GotoInstruction{label='Memory.deAlloc$IF_END4}
// goto Memory.deAlloc$IF_END4
@Memory.deAlloc$IF_END4 // 3283
0;JMP // 3284

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

@LCL // 3285
A=M+1 // 3286
A=A+1 // 3287
A=M // 3288
D=M // 3289
@SP // 3290
AM=M+1 // 3291
A=A-1 // 3292
M=D // 3293
// call Memory.getBinIndex
@6 // 3294
D=A // 3295
@14 // 3296
M=D // 3297
@Memory.getBinIndex // 3298
D=A // 3299
@13 // 3300
M=D // 3301
@Memory.deAlloc.ret.3 // 3302
D=A // 3303
@CALL // 3304
0;JMP // 3305
(Memory.deAlloc.ret.3)
@SP // 3306
AM=M-1 // 3307
D=M // 3308
@2048 // 3309
D=D+A // 3310
@SP // 3311
AM=M+1 // 3312
A=A-1 // 3313
M=D // 3314
@LCL // 3315
A=M+1 // 3316
A=A+1 // 3317
D=M // 3318
@SP // 3319
AM=M+1 // 3320
A=A-1 // 3321
M=D // 3322
// call Memory.remove_node
@7 // 3323
D=A // 3324
@14 // 3325
M=D // 3326
@Memory.remove_node // 3327
D=A // 3328
@13 // 3329
M=D // 3330
@Memory.deAlloc.ret.4 // 3331
D=A // 3332
@CALL // 3333
0;JMP // 3334
(Memory.deAlloc.ret.4)
@SP // 3335
M=M-1 // 3336

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
@LCL // 3337
A=M // 3338
D=M // 3339
@0 // 3340
D=D+A // 3341
@SP // 3342
AM=M+1 // 3343
A=A-1 // 3344
M=D // 3345
@LCL // 3346
A=M // 3347
A=M // 3348
D=M // 3349
@SP // 3350
AM=M+1 // 3351
A=A-1 // 3352
M=D // 3353
@LCL // 3354
A=M+1 // 3355
A=A+1 // 3356
A=M // 3357
D=M // 3358
@SP // 3359
AM=M-1 // 3360
D=D+M // 3361
@5 // 3362
D=D+A // 3363
@SP // 3364
AM=M-1 // 3365
A=M // 3366
M=D // 3367

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3368
A=M // 3369
D=M // 3370
@SP // 3371
AM=M+1 // 3372
A=A-1 // 3373
M=D // 3374
// call Memory.create_foot
@6 // 3375
D=A // 3376
@14 // 3377
M=D // 3378
@Memory.create_foot // 3379
D=A // 3380
@13 // 3381
M=D // 3382
@Memory.deAlloc.ret.5 // 3383
D=A // 3384
@CALL // 3385
0;JMP // 3386
(Memory.deAlloc.ret.5)
@SP // 3387
M=M-1 // 3388

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

@LCL // 3389
A=M // 3390
A=M // 3391
D=M // 3392
@SP // 3393
AM=M+1 // 3394
A=A-1 // 3395
M=D // 3396
// call Memory.getBinIndex
@6 // 3397
D=A // 3398
@14 // 3399
M=D // 3400
@Memory.getBinIndex // 3401
D=A // 3402
@13 // 3403
M=D // 3404
@Memory.deAlloc.ret.6 // 3405
D=A // 3406
@CALL // 3407
0;JMP // 3408
(Memory.deAlloc.ret.6)
@SP // 3409
AM=M-1 // 3410
D=M // 3411
@2048 // 3412
D=D+A // 3413
@SP // 3414
AM=M+1 // 3415
A=A-1 // 3416
M=D // 3417
@LCL // 3418
A=M // 3419
D=M // 3420
@SP // 3421
AM=M+1 // 3422
A=A-1 // 3423
M=D // 3424
// call Memory.add_node
@7 // 3425
D=A // 3426
@14 // 3427
M=D // 3428
@Memory.add_node // 3429
D=A // 3430
@13 // 3431
M=D // 3432
@Memory.deAlloc.ret.7 // 3433
D=A // 3434
@CALL // 3435
0;JMP // 3436
(Memory.deAlloc.ret.7)
@SP // 3437
M=M-1 // 3438

////PushInstruction("constant 0")
@SP // 3439
AM=M+1 // 3440
A=A-1 // 3441
M=0 // 3442
@RETURN // 3443
0;JMP // 3444

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3445
A=M // 3446
D=M // 3447
@3 // 3448
M=D // 3449

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
@THIS // 3450
A=M // 3451
D=M // 3452
@ARG // 3453
A=M+1 // 3454
A=D+M // 3455
D=M // 3456
@SP // 3457
AM=M+1 // 3458
A=A-1 // 3459
M=D // 3460
@RETURN // 3461
0;JMP // 3462

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3463
AM=M+1 // 3464
A=A-1 // 3465
M=0 // 3466

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3467
A=M // 3468
M=0 // 3469

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
@Memory.copy.LT.32 // 3470
D=A // 3471
@SP // 3472
AM=M+1 // 3473
A=A-1 // 3474
M=D // 3475
@LCL // 3476
A=M // 3477
D=M // 3478
@ARG // 3479
A=M+1 // 3480
A=A+1 // 3481
D=D-M // 3482
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
@LCL // 3491
A=M // 3492
D=D+M // 3493
@SP // 3494
AM=M+1 // 3495
A=A-1 // 3496
M=D // 3497
@ARG // 3498
A=M // 3499
D=M // 3500
@LCL // 3501
A=M // 3502
A=D+M // 3503
D=M // 3504
@SP // 3505
AM=M-1 // 3506
A=M // 3507
M=D // 3508

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

@LCL // 3509
A=M // 3510
M=M+1 // 3511

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3512
0;JMP // 3513

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3514
AM=M+1 // 3515
A=A-1 // 3516
M=0 // 3517
@RETURN // 3518
0;JMP // 3519

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3520
D=A // 3521
@SP // 3522
AM=D+M // 3523
A=A-1 // 3524
M=0 // 3525
A=A-1 // 3526
M=0 // 3527
A=A-1 // 3528
M=0 // 3529

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3530
A=M // 3531
D=M // 3532
@SP // 3533
AM=M+1 // 3534
A=A-1 // 3535
M=D // 3536
// call Math.abs
@6 // 3537
D=A // 3538
@14 // 3539
M=D // 3540
@Math.abs // 3541
D=A // 3542
@13 // 3543
M=D // 3544
@Math.divide.ret.0 // 3545
D=A // 3546
@CALL // 3547
0;JMP // 3548
(Math.divide.ret.0)
@SP // 3549
AM=M-1 // 3550
D=M // 3551
@LCL // 3552
A=M+1 // 3553
M=D // 3554

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3555
A=M+1 // 3556
D=M // 3557
@SP // 3558
AM=M+1 // 3559
A=A-1 // 3560
M=D // 3561
// call Math.abs
@6 // 3562
D=A // 3563
@14 // 3564
M=D // 3565
@Math.abs // 3566
D=A // 3567
@13 // 3568
M=D // 3569
@Math.divide.ret.1 // 3570
D=A // 3571
@CALL // 3572
0;JMP // 3573
(Math.divide.ret.1)
@SP // 3574
AM=M-1 // 3575
D=M // 3576
@LCL // 3577
A=M+1 // 3578
A=A+1 // 3579
M=D // 3580

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.33 // 3581
D=A // 3582
@SP // 3583
AM=M+1 // 3584
A=A-1 // 3585
M=D // 3586
@LCL // 3587
A=M+1 // 3588
A=A+1 // 3589
D=M // 3590
A=A-1 // 3591
D=D-M // 3592
@DO_GT // 3593
0;JMP // 3594
(Math.divide.GT.33)
@Math.divide$IF_TRUE1 // 3595
D;JNE // 3596

////GotoInstruction{label='Math.divide$IF_END1}
// goto Math.divide$IF_END1
@Math.divide$IF_END1 // 3597
0;JMP // 3598

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3599
AM=M+1 // 3600
A=A-1 // 3601
M=0 // 3602
@RETURN // 3603
0;JMP // 3604

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

@LCL // 3605
A=M+1 // 3606
D=M // 3607
@SP // 3608
AM=M+1 // 3609
A=A-1 // 3610
M=D // 3611
@LCL // 3612
A=M+1 // 3613
A=A+1 // 3614
D=M // 3615
D=D+M // 3616
@SP // 3617
AM=M+1 // 3618
A=A-1 // 3619
M=D // 3620
// call Math.divide
@7 // 3621
D=A // 3622
@14 // 3623
M=D // 3624
@Math.divide // 3625
D=A // 3626
@13 // 3627
M=D // 3628
@Math.divide.ret.2 // 3629
D=A // 3630
@CALL // 3631
0;JMP // 3632
(Math.divide.ret.2)
@SP // 3633
AM=M-1 // 3634
D=M // 3635
@LCL // 3636
A=M // 3637
M=D // 3638

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
@Math.divide.LT.34 // 3639
D=A // 3640
@SP // 3641
AM=M+1 // 3642
A=A-1 // 3643
M=D // 3644
@LCL // 3645
A=M+1 // 3646
D=M // 3647
@SP // 3648
AM=M+1 // 3649
A=A-1 // 3650
M=D // 3651
@LCL // 3652
A=M // 3653
D=M // 3654
D=D+M // 3655
@SP // 3656
AM=M+1 // 3657
A=A-1 // 3658
M=D // 3659
@LCL // 3660
A=M+1 // 3661
A=A+1 // 3662
D=M // 3663
@SP // 3664
AM=M+1 // 3665
A=A-1 // 3666
M=D // 3667
// call Math.multiply
@7 // 3668
D=A // 3669
@14 // 3670
M=D // 3671
@Math.multiply // 3672
D=A // 3673
@13 // 3674
M=D // 3675
@Math.divide.ret.3 // 3676
D=A // 3677
@CALL // 3678
0;JMP // 3679
(Math.divide.ret.3)
@SP // 3680
AM=M-1 // 3681
D=M // 3682
@SP // 3683
AM=M-1 // 3684
D=M-D // 3685
@SP // 3686
AM=M+1 // 3687
A=A-1 // 3688
M=D // 3689
@LCL // 3690
A=M+1 // 3691
A=A+1 // 3692
D=M // 3693
@SP // 3694
AM=M-1 // 3695
D=M-D // 3696
@DO_LT // 3697
0;JMP // 3698
(Math.divide.LT.34)
@Math.divide$IF_TRUE2 // 3699
D;JNE // 3700

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3701
0;JMP // 3702

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
@Math.divide.LT.35 // 3703
D=A // 3704
@SP // 3705
AM=M+1 // 3706
A=A-1 // 3707
M=D // 3708
@ARG // 3709
A=M // 3710
D=M // 3711
@DO_LT // 3712
0;JMP // 3713
(Math.divide.LT.35)
@SP // 3714
AM=M+1 // 3715
A=A-1 // 3716
M=D // 3717
@Math.divide.GT.36 // 3718
D=A // 3719
@SP // 3720
AM=M+1 // 3721
A=A-1 // 3722
M=D // 3723
@ARG // 3724
A=M+1 // 3725
D=M // 3726
@DO_GT // 3727
0;JMP // 3728
(Math.divide.GT.36)
@SP // 3729
AM=M-1 // 3730
D=D&M // 3731
@SP // 3732
AM=M+1 // 3733
A=A-1 // 3734
M=D // 3735
@Math.divide.GT.37 // 3736
D=A // 3737
@SP // 3738
AM=M+1 // 3739
A=A-1 // 3740
M=D // 3741
@ARG // 3742
A=M // 3743
D=M // 3744
@DO_GT // 3745
0;JMP // 3746
(Math.divide.GT.37)
@SP // 3747
AM=M+1 // 3748
A=A-1 // 3749
M=D // 3750
@Math.divide.LT.38 // 3751
D=A // 3752
@SP // 3753
AM=M+1 // 3754
A=A-1 // 3755
M=D // 3756
@ARG // 3757
A=M+1 // 3758
D=M // 3759
@DO_LT // 3760
0;JMP // 3761
(Math.divide.LT.38)
@SP // 3762
AM=M-1 // 3763
D=D&M // 3764
@SP // 3765
AM=M-1 // 3766
D=D|M // 3767
@Math.divide$IF_TRUE3 // 3768
D;JNE // 3769

////GotoInstruction{label='Math.divide$IF_END3}
// goto Math.divide$IF_END3
@Math.divide$IF_END3 // 3770
0;JMP // 3771

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3772
A=M // 3773
D=-M // 3774
@LCL // 3775
A=M // 3776
M=D // 3777

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
@LCL // 3778
A=M // 3779
D=M // 3780
D=D+M // 3781
@SP // 3782
AM=M+1 // 3783
A=A-1 // 3784
M=D // 3785
@RETURN // 3786
0;JMP // 3787

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3788
0;JMP // 3789

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
@Math.divide.LT.39 // 3790
D=A // 3791
@SP // 3792
AM=M+1 // 3793
A=A-1 // 3794
M=D // 3795
@ARG // 3796
A=M // 3797
D=M // 3798
@DO_LT // 3799
0;JMP // 3800
(Math.divide.LT.39)
@SP // 3801
AM=M+1 // 3802
A=A-1 // 3803
M=D // 3804
@Math.divide.GT.40 // 3805
D=A // 3806
@SP // 3807
AM=M+1 // 3808
A=A-1 // 3809
M=D // 3810
@ARG // 3811
A=M+1 // 3812
D=M // 3813
@DO_GT // 3814
0;JMP // 3815
(Math.divide.GT.40)
@SP // 3816
AM=M-1 // 3817
D=D&M // 3818
@SP // 3819
AM=M+1 // 3820
A=A-1 // 3821
M=D // 3822
@Math.divide.GT.41 // 3823
D=A // 3824
@SP // 3825
AM=M+1 // 3826
A=A-1 // 3827
M=D // 3828
@ARG // 3829
A=M // 3830
D=M // 3831
@DO_GT // 3832
0;JMP // 3833
(Math.divide.GT.41)
@SP // 3834
AM=M+1 // 3835
A=A-1 // 3836
M=D // 3837
@Math.divide.LT.42 // 3838
D=A // 3839
@SP // 3840
AM=M+1 // 3841
A=A-1 // 3842
M=D // 3843
@ARG // 3844
A=M+1 // 3845
D=M // 3846
@DO_LT // 3847
0;JMP // 3848
(Math.divide.LT.42)
@SP // 3849
AM=M-1 // 3850
D=D&M // 3851
@SP // 3852
AM=M-1 // 3853
D=D|M // 3854
@Math.divide$IF_TRUE4 // 3855
D;JNE // 3856

////GotoInstruction{label='Math.divide$IF_END4}
// goto Math.divide$IF_END4
@Math.divide$IF_END4 // 3857
0;JMP // 3858

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3859
A=M // 3860
D=-M // 3861
@LCL // 3862
A=M // 3863
M=D // 3864

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
@LCL // 3865
A=M // 3866
D=M // 3867
D=D+M // 3868
D=D+1 // 3869
@SP // 3870
AM=M+1 // 3871
A=A-1 // 3872
M=D // 3873
@RETURN // 3874
0;JMP // 3875

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3876
D=A // 3877
@SP // 3878
AM=D+M // 3879
A=A-1 // 3880
M=0 // 3881
A=A-1 // 3882
M=0 // 3883
A=A-1 // 3884
M=0 // 3885
A=A-1 // 3886
M=0 // 3887
A=A-1 // 3888
M=0 // 3889
A=A-1 // 3890
M=0 // 3891

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

@ARG // 3892
A=M+1 // 3893
A=A+1 // 3894
D=M // 3895
A=A-1 // 3896
A=A-1 // 3897
D=D-M // 3898
@SP // 3899
AM=M+1 // 3900
A=A-1 // 3901
M=D // 3902
// call Math.abs
@6 // 3903
D=A // 3904
@14 // 3905
M=D // 3906
@Math.abs // 3907
D=A // 3908
@13 // 3909
M=D // 3910
@Screen.drawLine.ret.0 // 3911
D=A // 3912
@CALL // 3913
0;JMP // 3914
(Screen.drawLine.ret.0)
@SP // 3915
AM=M-1 // 3916
D=M // 3917
@LCL // 3918
A=M // 3919
M=D // 3920

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

@ARG // 3921
A=M+1 // 3922
A=A+1 // 3923
A=A+1 // 3924
D=M // 3925
A=A-1 // 3926
A=A-1 // 3927
D=D-M // 3928
@SP // 3929
AM=M+1 // 3930
A=A-1 // 3931
M=D // 3932
// call Math.abs
@6 // 3933
D=A // 3934
@14 // 3935
M=D // 3936
@Math.abs // 3937
D=A // 3938
@13 // 3939
M=D // 3940
@Screen.drawLine.ret.1 // 3941
D=A // 3942
@CALL // 3943
0;JMP // 3944
(Screen.drawLine.ret.1)
@SP // 3945
AM=M-1 // 3946
D=M // 3947
@LCL // 3948
A=M+1 // 3949
M=D // 3950

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.43 // 3951
D=A // 3952
@SP // 3953
AM=M+1 // 3954
A=A-1 // 3955
M=D // 3956
@ARG // 3957
A=M+1 // 3958
A=A+1 // 3959
D=M // 3960
A=A-1 // 3961
A=A-1 // 3962
D=M-D // 3963
@DO_LT // 3964
0;JMP // 3965
(Screen.drawLine.LT.43)
@Screen.drawLine$IF_TRUE1 // 3966
D;JNE // 3967

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 3968
0;JMP // 3969

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3970
A=M+1 // 3971
A=A+1 // 3972
M=1 // 3973

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 3974
0;JMP // 3975

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3976
A=M+1 // 3977
A=A+1 // 3978
M=-1 // 3979

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
@Screen.drawLine.LT.44 // 3980
D=A // 3981
@SP // 3982
AM=M+1 // 3983
A=A-1 // 3984
M=D // 3985
@ARG // 3986
A=M+1 // 3987
A=A+1 // 3988
A=A+1 // 3989
D=M // 3990
A=A-1 // 3991
A=A-1 // 3992
D=M-D // 3993
@DO_LT // 3994
0;JMP // 3995
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE2 // 3996
D;JNE // 3997

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 3998
0;JMP // 3999

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4000
A=M+1 // 4001
A=A+1 // 4002
A=A+1 // 4003
M=1 // 4004

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 4005
0;JMP // 4006

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 4007
A=M+1 // 4008
A=A+1 // 4009
A=A+1 // 4010
M=-1 // 4011

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

@LCL // 4012
A=M+1 // 4013
D=M // 4014
A=A-1 // 4015
D=M-D // 4016
@SP // 4017
AM=M+1 // 4018
A=A-1 // 4019
M=D // 4020
@LCL // 4021
D=M // 4022
@4 // 4023
A=D+A // 4024
D=A // 4025
@R13 // 4026
M=D // 4027
@SP // 4028
AM=M-1 // 4029
D=M // 4030
@R13 // 4031
A=M // 4032
M=D // 4033

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 4034
@Screen.drawLine_WHILE_END1 // 4035
D;JNE // 4036

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 4037
A=M // 4038
D=M // 4039
@SP // 4040
AM=M+1 // 4041
A=A-1 // 4042
M=D // 4043
@ARG // 4044
A=M+1 // 4045
D=M // 4046
@SP // 4047
AM=M+1 // 4048
A=A-1 // 4049
M=D // 4050
// call Screen.drawPixel
@7 // 4051
D=A // 4052
@14 // 4053
M=D // 4054
@Screen.drawPixel // 4055
D=A // 4056
@13 // 4057
M=D // 4058
@Screen.drawLine.ret.2 // 4059
D=A // 4060
@CALL // 4061
0;JMP // 4062
(Screen.drawLine.ret.2)
@SP // 4063
M=M-1 // 4064

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
@Screen.drawLine.EQ.45 // 4065
D=A // 4066
@SP // 4067
AM=M+1 // 4068
A=A-1 // 4069
M=D // 4070
@ARG // 4071
A=M+1 // 4072
A=A+1 // 4073
D=M // 4074
A=A-1 // 4075
A=A-1 // 4076
D=M-D // 4077
@DO_EQ // 4078
0;JMP // 4079
(Screen.drawLine.EQ.45)
@SP // 4080
AM=M+1 // 4081
A=A-1 // 4082
M=D // 4083
@Screen.drawLine.EQ.46 // 4084
D=A // 4085
@SP // 4086
AM=M+1 // 4087
A=A-1 // 4088
M=D // 4089
@ARG // 4090
A=M+1 // 4091
A=A+1 // 4092
A=A+1 // 4093
D=M // 4094
A=A-1 // 4095
A=A-1 // 4096
D=M-D // 4097
@DO_EQ // 4098
0;JMP // 4099
(Screen.drawLine.EQ.46)
@SP // 4100
AM=M-1 // 4101
D=D&M // 4102
@Screen.drawLine$IF_TRUE3 // 4103
D;JNE // 4104

////GotoInstruction{label='Screen.drawLine$IF_END3}
// goto Screen.drawLine$IF_END3
@Screen.drawLine$IF_END3 // 4105
0;JMP // 4106

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4107
AM=M+1 // 4108
A=A-1 // 4109
M=0 // 4110
@RETURN // 4111
0;JMP // 4112

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

@LCL // 4113
D=M // 4114
@4 // 4115
A=D+A // 4116
D=M // 4117
D=D+M // 4118
@SP // 4119
AM=M+1 // 4120
A=A-1 // 4121
M=D // 4122
@LCL // 4123
D=M // 4124
@5 // 4125
A=D+A // 4126
D=A // 4127
@R13 // 4128
M=D // 4129
@SP // 4130
AM=M-1 // 4131
D=M // 4132
@R13 // 4133
A=M // 4134
M=D // 4135

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
@Screen.drawLine.GT.47 // 4136
D=A // 4137
@SP // 4138
AM=M+1 // 4139
A=A-1 // 4140
M=D // 4141
@RETURN_PUSH_LABEL_5 // 4142
D=A // 4143
@13 // 4144
M=D // 4145
@5 // 4146
D=A // 4147
@LCL_PUSH // 4148
0;JMP // 4149
(RETURN_PUSH_LABEL_5)
@LCL // 4150
A=M+1 // 4151
D=M // 4152
@SP // 4153
AM=M-1 // 4154
D=D+M // 4155
@DO_GT // 4156
0;JMP // 4157
(Screen.drawLine.GT.47)
@Screen.drawLine$IF_TRUE4 // 4158
D;JNE // 4159

////GotoInstruction{label='Screen.drawLine$IF_END4}
// goto Screen.drawLine$IF_END4
@Screen.drawLine$IF_END4 // 4160
0;JMP // 4161

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

@LCL // 4162
D=M // 4163
@4 // 4164
A=D+A // 4165
D=M // 4166
A=A-1 // 4167
A=A-1 // 4168
A=A-1 // 4169
D=D-M // 4170
@SP // 4171
AM=M+1 // 4172
A=A-1 // 4173
M=D // 4174
@LCL // 4175
D=M // 4176
@4 // 4177
A=D+A // 4178
D=A // 4179
@R13 // 4180
M=D // 4181
@SP // 4182
AM=M-1 // 4183
D=M // 4184
@R13 // 4185
A=M // 4186
M=D // 4187

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

@LCL // 4188
A=M+1 // 4189
A=A+1 // 4190
D=M // 4191
@ARG // 4192
A=M // 4193
M=D+M // 4194

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
@Screen.drawLine.LT.48 // 4195
D=A // 4196
@SP // 4197
AM=M+1 // 4198
A=A-1 // 4199
M=D // 4200
@RETURN_PUSH_LABEL_6 // 4201
D=A // 4202
@13 // 4203
M=D // 4204
@5 // 4205
D=A // 4206
@LCL_PUSH // 4207
0;JMP // 4208
(RETURN_PUSH_LABEL_6)
@LCL // 4209
A=M // 4210
D=M // 4211
@SP // 4212
AM=M-1 // 4213
D=M-D // 4214
@DO_LT // 4215
0;JMP // 4216
(Screen.drawLine.LT.48)
@Screen.drawLine$IF_TRUE5 // 4217
D;JNE // 4218

////GotoInstruction{label='Screen.drawLine$IF_END5}
// goto Screen.drawLine$IF_END5
@Screen.drawLine$IF_END5 // 4219
0;JMP // 4220

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

@RETURN_PUSH_LABEL_7 // 4221
D=A // 4222
@13 // 4223
M=D // 4224
@4 // 4225
D=A // 4226
@LCL_PUSH // 4227
0;JMP // 4228
(RETURN_PUSH_LABEL_7)
@LCL // 4229
A=M // 4230
D=M // 4231
@SP // 4232
AM=M-1 // 4233
D=D+M // 4234
@SP // 4235
AM=M+1 // 4236
A=A-1 // 4237
M=D // 4238
@LCL // 4239
D=M // 4240
@4 // 4241
A=D+A // 4242
D=A // 4243
@R13 // 4244
M=D // 4245
@SP // 4246
AM=M-1 // 4247
D=M // 4248
@R13 // 4249
A=M // 4250
M=D // 4251

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

@LCL // 4252
A=M+1 // 4253
A=A+1 // 4254
A=A+1 // 4255
D=M // 4256
@ARG // 4257
A=M+1 // 4258
M=D+M // 4259

////LabelInstruction{label='Screen.drawLine$IF_END5}
// label Screen.drawLine$IF_END5
(Screen.drawLine$IF_END5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4260
0;JMP // 4261

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4262
AM=M+1 // 4263
A=A-1 // 4264
M=0 // 4265
@RETURN // 4266
0;JMP // 4267

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
@Math.max.GT.49 // 4268
D=A // 4269
@SP // 4270
AM=M+1 // 4271
A=A-1 // 4272
M=D // 4273
@ARG // 4274
A=M+1 // 4275
D=M // 4276
A=A-1 // 4277
D=M-D // 4278
@DO_GT // 4279
0;JMP // 4280
(Math.max.GT.49)
@Math.max$IF_TRUE1 // 4281
D;JNE // 4282

////GotoInstruction{label='Math.max$IF_END1}
// goto Math.max$IF_END1
@Math.max$IF_END1 // 4283
0;JMP // 4284

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4285
A=M // 4286
D=M // 4287
@SP // 4288
AM=M+1 // 4289
A=A-1 // 4290
M=D // 4291
@RETURN // 4292
0;JMP // 4293

////LabelInstruction{label='Math.max$IF_END1}
// label Math.max$IF_END1
(Math.max$IF_END1)

////PushInstruction("argument 1")
@ARG // 4294
A=M+1 // 4295
D=M // 4296
@SP // 4297
AM=M+1 // 4298
A=A-1 // 4299
M=D // 4300
@RETURN // 4301
0;JMP // 4302

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=0 // 4306

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4307
AM=M+1 // 4308
A=A-1 // 4309
M=0 // 4310
@220 // 4311
D=A // 4312
@SP // 4313
AM=M+1 // 4314
A=A-1 // 4315
M=D // 4316
@511 // 4317
D=A // 4318
@SP // 4319
AM=M+1 // 4320
A=A-1 // 4321
M=D // 4322
@220 // 4323
D=A // 4324
@SP // 4325
AM=M+1 // 4326
A=A-1 // 4327
M=D // 4328
// call Screen.drawLine
@9 // 4329
D=A // 4330
@14 // 4331
M=D // 4332
@Screen.drawLine // 4333
D=A // 4334
@13 // 4335
M=D // 4336
@Main.main.ret.0 // 4337
D=A // 4338
@CALL // 4339
0;JMP // 4340
(Main.main.ret.0)
@SP // 4341
M=M-1 // 4342

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4343
D=A // 4344
@SP // 4345
AM=M+1 // 4346
A=A-1 // 4347
M=D // 4348
@90 // 4349
D=A // 4350
@SP // 4351
AM=M+1 // 4352
A=A-1 // 4353
M=D // 4354
@410 // 4355
D=A // 4356
@SP // 4357
AM=M+1 // 4358
A=A-1 // 4359
M=D // 4360
@220 // 4361
D=A // 4362
@SP // 4363
AM=M+1 // 4364
A=A-1 // 4365
M=D // 4366
// call Screen.drawRectangle
@9 // 4367
D=A // 4368
@14 // 4369
M=D // 4370
@Screen.drawRectangle // 4371
D=A // 4372
@13 // 4373
M=D // 4374
@Main.main.ret.1 // 4375
D=A // 4376
@CALL // 4377
0;JMP // 4378
(Main.main.ret.1)
@SP // 4379
M=M-1 // 4380

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4381
AM=M+1 // 4382
A=A-1 // 4383
M=0 // 4384
// call Screen.setColor
@6 // 4385
D=A // 4386
@14 // 4387
M=D // 4388
@Screen.setColor // 4389
D=A // 4390
@13 // 4391
M=D // 4392
@Main.main.ret.2 // 4393
D=A // 4394
@CALL // 4395
0;JMP // 4396
(Main.main.ret.2)
@SP // 4397
M=M-1 // 4398

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4399
D=A // 4400
@SP // 4401
AM=M+1 // 4402
A=A-1 // 4403
M=D // 4404
@120 // 4405
D=A // 4406
@SP // 4407
AM=M+1 // 4408
A=A-1 // 4409
M=D // 4410
@390 // 4411
D=A // 4412
@SP // 4413
AM=M+1 // 4414
A=A-1 // 4415
M=D // 4416
@219 // 4417
D=A // 4418
@SP // 4419
AM=M+1 // 4420
A=A-1 // 4421
M=D // 4422
// call Screen.drawRectangle
@9 // 4423
D=A // 4424
@14 // 4425
M=D // 4426
@Screen.drawRectangle // 4427
D=A // 4428
@13 // 4429
M=D // 4430
@Main.main.ret.3 // 4431
D=A // 4432
@CALL // 4433
0;JMP // 4434
(Main.main.ret.3)
@SP // 4435
M=M-1 // 4436

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4437
D=A // 4438
@SP // 4439
AM=M+1 // 4440
A=A-1 // 4441
M=D // 4442
@120 // 4443
D=A // 4444
@SP // 4445
AM=M+1 // 4446
A=A-1 // 4447
M=D // 4448
@332 // 4449
D=A // 4450
@SP // 4451
AM=M+1 // 4452
A=A-1 // 4453
M=D // 4454
@150 // 4455
D=A // 4456
@SP // 4457
AM=M+1 // 4458
A=A-1 // 4459
M=D // 4460
// call Screen.drawRectangle
@9 // 4461
D=A // 4462
@14 // 4463
M=D // 4464
@Screen.drawRectangle // 4465
D=A // 4466
@13 // 4467
M=D // 4468
@Main.main.ret.4 // 4469
D=A // 4470
@CALL // 4471
0;JMP // 4472
(Main.main.ret.4)
@SP // 4473
M=M-1 // 4474

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4475
AM=M+1 // 4476
A=A-1 // 4477
M=-1 // 4478
// call Screen.setColor
@6 // 4479
D=A // 4480
@14 // 4481
M=D // 4482
@Screen.setColor // 4483
D=A // 4484
@13 // 4485
M=D // 4486
@Main.main.ret.5 // 4487
D=A // 4488
@CALL // 4489
0;JMP // 4490
(Main.main.ret.5)
@SP // 4491
M=M-1 // 4492

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4493
D=A // 4494
@SP // 4495
AM=M+1 // 4496
A=A-1 // 4497
M=D // 4498
@170 // 4499
D=A // 4500
@SP // 4501
AM=M+1 // 4502
A=A-1 // 4503
M=D // 4504
@3 // 4505
D=A // 4506
@SP // 4507
AM=M+1 // 4508
A=A-1 // 4509
M=D // 4510
// call Screen.drawCircle
@8 // 4511
D=A // 4512
@14 // 4513
M=D // 4514
@Screen.drawCircle // 4515
D=A // 4516
@13 // 4517
M=D // 4518
@Main.main.ret.6 // 4519
D=A // 4520
@CALL // 4521
0;JMP // 4522
(Main.main.ret.6)
@SP // 4523
M=M-1 // 4524

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4525
D=A // 4526
@SP // 4527
AM=M+1 // 4528
A=A-1 // 4529
M=D // 4530
@90 // 4531
D=A // 4532
@SP // 4533
AM=M+1 // 4534
A=A-1 // 4535
M=D // 4536
@345 // 4537
D=A // 4538
@SP // 4539
AM=M+1 // 4540
A=A-1 // 4541
M=D // 4542
@35 // 4543
D=A // 4544
@SP // 4545
AM=M+1 // 4546
A=A-1 // 4547
M=D // 4548
// call Screen.drawLine
@9 // 4549
D=A // 4550
@14 // 4551
M=D // 4552
@Screen.drawLine // 4553
D=A // 4554
@13 // 4555
M=D // 4556
@Main.main.ret.7 // 4557
D=A // 4558
@CALL // 4559
0;JMP // 4560
(Main.main.ret.7)
@SP // 4561
M=M-1 // 4562

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4563
D=A // 4564
@SP // 4565
AM=M+1 // 4566
A=A-1 // 4567
M=D // 4568
@35 // 4569
D=A // 4570
@SP // 4571
AM=M+1 // 4572
A=A-1 // 4573
M=D // 4574
@410 // 4575
D=A // 4576
@SP // 4577
AM=M+1 // 4578
A=A-1 // 4579
M=D // 4580
@90 // 4581
D=A // 4582
@SP // 4583
AM=M+1 // 4584
A=A-1 // 4585
M=D // 4586
// call Screen.drawLine
@9 // 4587
D=A // 4588
@14 // 4589
M=D // 4590
@Screen.drawLine // 4591
D=A // 4592
@13 // 4593
M=D // 4594
@Main.main.ret.8 // 4595
D=A // 4596
@CALL // 4597
0;JMP // 4598
(Main.main.ret.8)
@SP // 4599
M=M-1 // 4600

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4601
D=A // 4602
@SP // 4603
AM=M+1 // 4604
A=A-1 // 4605
M=D // 4606
@60 // 4607
D=A // 4608
@SP // 4609
AM=M+1 // 4610
A=A-1 // 4611
M=D // 4612
@30 // 4613
D=A // 4614
@SP // 4615
AM=M+1 // 4616
A=A-1 // 4617
M=D // 4618
// call Screen.drawCircle
@8 // 4619
D=A // 4620
@14 // 4621
M=D // 4622
@Screen.drawCircle // 4623
D=A // 4624
@13 // 4625
M=D // 4626
@Main.main.ret.9 // 4627
D=A // 4628
@CALL // 4629
0;JMP // 4630
(Main.main.ret.9)
@SP // 4631
M=M-1 // 4632

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4633
D=A // 4634
@SP // 4635
AM=M+1 // 4636
A=A-1 // 4637
M=D // 4638
@26 // 4639
D=A // 4640
@SP // 4641
AM=M+1 // 4642
A=A-1 // 4643
M=D // 4644
@140 // 4645
D=A // 4646
@SP // 4647
AM=M+1 // 4648
A=A-1 // 4649
M=D // 4650
@6 // 4651
D=A // 4652
@SP // 4653
AM=M+1 // 4654
A=A-1 // 4655
M=D // 4656
// call Screen.drawLine
@9 // 4657
D=A // 4658
@14 // 4659
M=D // 4660
@Screen.drawLine // 4661
D=A // 4662
@13 // 4663
M=D // 4664
@Main.main.ret.10 // 4665
D=A // 4666
@CALL // 4667
0;JMP // 4668
(Main.main.ret.10)
@SP // 4669
M=M-1 // 4670

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4671
D=A // 4672
@SP // 4673
AM=M+1 // 4674
A=A-1 // 4675
M=D // 4676
@35 // 4677
D=A // 4678
@SP // 4679
AM=M+1 // 4680
A=A-1 // 4681
M=D // 4682
@178 // 4683
D=A // 4684
@SP // 4685
AM=M+1 // 4686
A=A-1 // 4687
M=D // 4688
@20 // 4689
D=A // 4690
@SP // 4691
AM=M+1 // 4692
A=A-1 // 4693
M=D // 4694
// call Screen.drawLine
@9 // 4695
D=A // 4696
@14 // 4697
M=D // 4698
@Screen.drawLine // 4699
D=A // 4700
@13 // 4701
M=D // 4702
@Main.main.ret.11 // 4703
D=A // 4704
@CALL // 4705
0;JMP // 4706
(Main.main.ret.11)
@SP // 4707
M=M-1 // 4708

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4709
D=A // 4710
@SP // 4711
AM=M+1 // 4712
A=A-1 // 4713
M=D // 4714
@60 // 4715
D=A // 4716
@SP // 4717
AM=M+1 // 4718
A=A-1 // 4719
M=D // 4720
@194 // 4721
D=A // 4722
@SP // 4723
AM=M+1 // 4724
A=A-1 // 4725
M=D // 4726
@60 // 4727
D=A // 4728
@SP // 4729
AM=M+1 // 4730
A=A-1 // 4731
M=D // 4732
// call Screen.drawLine
@9 // 4733
D=A // 4734
@14 // 4735
M=D // 4736
@Screen.drawLine // 4737
D=A // 4738
@13 // 4739
M=D // 4740
@Main.main.ret.12 // 4741
D=A // 4742
@CALL // 4743
0;JMP // 4744
(Main.main.ret.12)
@SP // 4745
M=M-1 // 4746

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4747
D=A // 4748
@SP // 4749
AM=M+1 // 4750
A=A-1 // 4751
M=D // 4752
@85 // 4753
D=A // 4754
@SP // 4755
AM=M+1 // 4756
A=A-1 // 4757
M=D // 4758
@178 // 4759
D=A // 4760
@SP // 4761
AM=M+1 // 4762
A=A-1 // 4763
M=D // 4764
@100 // 4765
D=A // 4766
@SP // 4767
AM=M+1 // 4768
A=A-1 // 4769
M=D // 4770
// call Screen.drawLine
@9 // 4771
D=A // 4772
@14 // 4773
M=D // 4774
@Screen.drawLine // 4775
D=A // 4776
@13 // 4777
M=D // 4778
@Main.main.ret.13 // 4779
D=A // 4780
@CALL // 4781
0;JMP // 4782
(Main.main.ret.13)
@SP // 4783
M=M-1 // 4784

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4785
D=A // 4786
@SP // 4787
AM=M+1 // 4788
A=A-1 // 4789
M=D // 4790
@94 // 4791
D=A // 4792
@SP // 4793
AM=M+1 // 4794
A=A-1 // 4795
M=D // 4796
@140 // 4797
D=A // 4798
@SP // 4799
AM=M+1 // 4800
A=A-1 // 4801
M=D // 4802
@114 // 4803
D=A // 4804
@SP // 4805
AM=M+1 // 4806
A=A-1 // 4807
M=D // 4808
// call Screen.drawLine
@9 // 4809
D=A // 4810
@14 // 4811
M=D // 4812
@Screen.drawLine // 4813
D=A // 4814
@13 // 4815
M=D // 4816
@Main.main.ret.14 // 4817
D=A // 4818
@CALL // 4819
0;JMP // 4820
(Main.main.ret.14)
@SP // 4821
M=M-1 // 4822

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4823
D=A // 4824
@SP // 4825
AM=M+1 // 4826
A=A-1 // 4827
M=D // 4828
@85 // 4829
D=A // 4830
@SP // 4831
AM=M+1 // 4832
A=A-1 // 4833
M=D // 4834
@102 // 4835
D=A // 4836
@SP // 4837
AM=M+1 // 4838
A=A-1 // 4839
M=D // 4840
@100 // 4841
D=A // 4842
@SP // 4843
AM=M+1 // 4844
A=A-1 // 4845
M=D // 4846
// call Screen.drawLine
@9 // 4847
D=A // 4848
@14 // 4849
M=D // 4850
@Screen.drawLine // 4851
D=A // 4852
@13 // 4853
M=D // 4854
@Main.main.ret.15 // 4855
D=A // 4856
@CALL // 4857
0;JMP // 4858
(Main.main.ret.15)
@SP // 4859
M=M-1 // 4860

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4861
D=A // 4862
@SP // 4863
AM=M+1 // 4864
A=A-1 // 4865
M=D // 4866
@60 // 4867
D=A // 4868
@SP // 4869
AM=M+1 // 4870
A=A-1 // 4871
M=D // 4872
@86 // 4873
D=A // 4874
@SP // 4875
AM=M+1 // 4876
A=A-1 // 4877
M=D // 4878
@60 // 4879
D=A // 4880
@SP // 4881
AM=M+1 // 4882
A=A-1 // 4883
M=D // 4884
// call Screen.drawLine
@9 // 4885
D=A // 4886
@14 // 4887
M=D // 4888
@Screen.drawLine // 4889
D=A // 4890
@13 // 4891
M=D // 4892
@Main.main.ret.16 // 4893
D=A // 4894
@CALL // 4895
0;JMP // 4896
(Main.main.ret.16)
@SP // 4897
M=M-1 // 4898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4899
D=A // 4900
@SP // 4901
AM=M+1 // 4902
A=A-1 // 4903
M=D // 4904
@35 // 4905
D=A // 4906
@SP // 4907
AM=M+1 // 4908
A=A-1 // 4909
M=D // 4910
@102 // 4911
D=A // 4912
@SP // 4913
AM=M+1 // 4914
A=A-1 // 4915
M=D // 4916
@20 // 4917
D=A // 4918
@SP // 4919
AM=M+1 // 4920
A=A-1 // 4921
M=D // 4922
// call Screen.drawLine
@9 // 4923
D=A // 4924
@14 // 4925
M=D // 4926
@Screen.drawLine // 4927
D=A // 4928
@13 // 4929
M=D // 4930
@Main.main.ret.17 // 4931
D=A // 4932
@CALL // 4933
0;JMP // 4934
(Main.main.ret.17)
@SP // 4935
M=M-1 // 4936

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 4937
D=A // 4938
@SP // 4939
AM=M+1 // 4940
A=A-1 // 4941
M=D // 4942
// call String.new
@6 // 4943
D=A // 4944
@14 // 4945
M=D // 4946
@String.new // 4947
D=A // 4948
@13 // 4949
M=D // 4950
@Main.main.ret.18 // 4951
D=A // 4952
@CALL // 4953
0;JMP // 4954
(Main.main.ret.18)
@72 // 4955
D=A // 4956
@SP // 4957
AM=M+1 // 4958
A=A-1 // 4959
M=D // 4960
// call String.appendChar
@7 // 4961
D=A // 4962
@14 // 4963
M=D // 4964
@String.appendChar // 4965
D=A // 4966
@13 // 4967
M=D // 4968
@Main.main.ret.19 // 4969
D=A // 4970
@CALL // 4971
0;JMP // 4972
(Main.main.ret.19)
@101 // 4973
D=A // 4974
@SP // 4975
AM=M+1 // 4976
A=A-1 // 4977
M=D // 4978
// call String.appendChar
@7 // 4979
D=A // 4980
@14 // 4981
M=D // 4982
@String.appendChar // 4983
D=A // 4984
@13 // 4985
M=D // 4986
@Main.main.ret.20 // 4987
D=A // 4988
@CALL // 4989
0;JMP // 4990
(Main.main.ret.20)
@108 // 4991
D=A // 4992
@SP // 4993
AM=M+1 // 4994
A=A-1 // 4995
M=D // 4996
// call String.appendChar
@7 // 4997
D=A // 4998
@14 // 4999
M=D // 5000
@String.appendChar // 5001
D=A // 5002
@13 // 5003
M=D // 5004
@Main.main.ret.21 // 5005
D=A // 5006
@CALL // 5007
0;JMP // 5008
(Main.main.ret.21)
@108 // 5009
D=A // 5010
@SP // 5011
AM=M+1 // 5012
A=A-1 // 5013
M=D // 5014
// call String.appendChar
@7 // 5015
D=A // 5016
@14 // 5017
M=D // 5018
@String.appendChar // 5019
D=A // 5020
@13 // 5021
M=D // 5022
@Main.main.ret.22 // 5023
D=A // 5024
@CALL // 5025
0;JMP // 5026
(Main.main.ret.22)
@111 // 5027
D=A // 5028
@SP // 5029
AM=M+1 // 5030
A=A-1 // 5031
M=D // 5032
// call String.appendChar
@7 // 5033
D=A // 5034
@14 // 5035
M=D // 5036
@String.appendChar // 5037
D=A // 5038
@13 // 5039
M=D // 5040
@Main.main.ret.23 // 5041
D=A // 5042
@CALL // 5043
0;JMP // 5044
(Main.main.ret.23)
@44 // 5045
D=A // 5046
@SP // 5047
AM=M+1 // 5048
A=A-1 // 5049
M=D // 5050
// call String.appendChar
@7 // 5051
D=A // 5052
@14 // 5053
M=D // 5054
@String.appendChar // 5055
D=A // 5056
@13 // 5057
M=D // 5058
@Main.main.ret.24 // 5059
D=A // 5060
@CALL // 5061
0;JMP // 5062
(Main.main.ret.24)
@32 // 5063
D=A // 5064
@SP // 5065
AM=M+1 // 5066
A=A-1 // 5067
M=D // 5068
// call String.appendChar
@7 // 5069
D=A // 5070
@14 // 5071
M=D // 5072
@String.appendChar // 5073
D=A // 5074
@13 // 5075
M=D // 5076
@Main.main.ret.25 // 5077
D=A // 5078
@CALL // 5079
0;JMP // 5080
(Main.main.ret.25)
@119 // 5081
D=A // 5082
@SP // 5083
AM=M+1 // 5084
A=A-1 // 5085
M=D // 5086
// call String.appendChar
@7 // 5087
D=A // 5088
@14 // 5089
M=D // 5090
@String.appendChar // 5091
D=A // 5092
@13 // 5093
M=D // 5094
@Main.main.ret.26 // 5095
D=A // 5096
@CALL // 5097
0;JMP // 5098
(Main.main.ret.26)
@111 // 5099
D=A // 5100
@SP // 5101
AM=M+1 // 5102
A=A-1 // 5103
M=D // 5104
// call String.appendChar
@7 // 5105
D=A // 5106
@14 // 5107
M=D // 5108
@String.appendChar // 5109
D=A // 5110
@13 // 5111
M=D // 5112
@Main.main.ret.27 // 5113
D=A // 5114
@CALL // 5115
0;JMP // 5116
(Main.main.ret.27)
@114 // 5117
D=A // 5118
@SP // 5119
AM=M+1 // 5120
A=A-1 // 5121
M=D // 5122
// call String.appendChar
@7 // 5123
D=A // 5124
@14 // 5125
M=D // 5126
@String.appendChar // 5127
D=A // 5128
@13 // 5129
M=D // 5130
@Main.main.ret.28 // 5131
D=A // 5132
@CALL // 5133
0;JMP // 5134
(Main.main.ret.28)
@108 // 5135
D=A // 5136
@SP // 5137
AM=M+1 // 5138
A=A-1 // 5139
M=D // 5140
// call String.appendChar
@7 // 5141
D=A // 5142
@14 // 5143
M=D // 5144
@String.appendChar // 5145
D=A // 5146
@13 // 5147
M=D // 5148
@Main.main.ret.29 // 5149
D=A // 5150
@CALL // 5151
0;JMP // 5152
(Main.main.ret.29)
@100 // 5153
D=A // 5154
@SP // 5155
AM=M+1 // 5156
A=A-1 // 5157
M=D // 5158
// call String.appendChar
@7 // 5159
D=A // 5160
@14 // 5161
M=D // 5162
@String.appendChar // 5163
D=A // 5164
@13 // 5165
M=D // 5166
@Main.main.ret.30 // 5167
D=A // 5168
@CALL // 5169
0;JMP // 5170
(Main.main.ret.30)
@33 // 5171
D=A // 5172
@SP // 5173
AM=M+1 // 5174
A=A-1 // 5175
M=D // 5176
// call String.appendChar
@7 // 5177
D=A // 5178
@14 // 5179
M=D // 5180
@String.appendChar // 5181
D=A // 5182
@13 // 5183
M=D // 5184
@Main.main.ret.31 // 5185
D=A // 5186
@CALL // 5187
0;JMP // 5188
(Main.main.ret.31)
@SP // 5189
AM=M-1 // 5190
D=M // 5191
@LCL // 5192
A=M // 5193
M=D // 5194

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5195
A=M // 5196
D=M // 5197
@SP // 5198
AM=M+1 // 5199
A=A-1 // 5200
M=D // 5201
// call Output.printString
@6 // 5202
D=A // 5203
@14 // 5204
M=D // 5205
@Output.printString // 5206
D=A // 5207
@13 // 5208
M=D // 5209
@Main.main.ret.32 // 5210
D=A // 5211
@CALL // 5212
0;JMP // 5213
(Main.main.ret.32)
@SP // 5214
M=M-1 // 5215

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5216
D=A // 5217
@14 // 5218
M=D // 5219
@Output.println // 5220
D=A // 5221
@13 // 5222
M=D // 5223
@Main.main.ret.33 // 5224
D=A // 5225
@CALL // 5226
0;JMP // 5227
(Main.main.ret.33)
@SP // 5228
M=M-1 // 5229

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5230
A=M // 5231
D=M // 5232
@SP // 5233
AM=M+1 // 5234
A=A-1 // 5235
M=D // 5236
// call String.dispose
@6 // 5237
D=A // 5238
@14 // 5239
M=D // 5240
@String.dispose // 5241
D=A // 5242
@13 // 5243
M=D // 5244
@Main.main.ret.34 // 5245
D=A // 5246
@CALL // 5247
0;JMP // 5248
(Main.main.ret.34)
@SP // 5249
M=M-1 // 5250

////PushInstruction("constant 0")
@SP // 5251
AM=M+1 // 5252
A=A-1 // 5253
M=0 // 5254
@RETURN // 5255
0;JMP // 5256

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5257
@Sys.halt_WHILE_END1 // 5258
D;JNE // 5259

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5260
0;JMP // 5261

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5262
AM=M+1 // 5263
A=A-1 // 5264
M=0 // 5265
@RETURN // 5266
0;JMP // 5267

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5268
D=A // 5269
@SP // 5270
AM=D+M // 5271
A=A-1 // 5272
M=0 // 5273
A=A-1 // 5274
M=0 // 5275
A=A-1 // 5276
M=0 // 5277
A=A-1 // 5278
M=0 // 5279

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5280
A=M // 5281
D=M // 5282
@SP // 5283
AM=M+1 // 5284
A=A-1 // 5285
M=D // 5286
// call Output.getMap
@6 // 5287
D=A // 5288
@14 // 5289
M=D // 5290
@Output.getMap // 5291
D=A // 5292
@13 // 5293
M=D // 5294
@Output.printChar.ret.0 // 5295
D=A // 5296
@CALL // 5297
0;JMP // 5298
(Output.printChar.ret.0)
@SP // 5299
AM=M-1 // 5300
D=M // 5301
@LCL // 5302
A=M // 5303
M=D // 5304

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5305
A=M+1 // 5306
A=A+1 // 5307
A=A+1 // 5308
M=0 // 5309

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
@Output.printChar.LT.50 // 5310
D=A // 5311
@SP // 5312
AM=M+1 // 5313
A=A-1 // 5314
M=D // 5315
@LCL // 5316
A=M+1 // 5317
A=A+1 // 5318
A=A+1 // 5319
D=M // 5320
@11 // 5321
D=D-A // 5322
@DO_LT // 5323
0;JMP // 5324
(Output.printChar.LT.50)
D=!D // 5325
@Output.printChar_WHILE_END1 // 5326
D;JNE // 5327

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

@Output.2 // 5328
D=M // 5329
@SP // 5330
AM=M+1 // 5331
A=A-1 // 5332
M=D // 5333
@11 // 5334
D=A // 5335
@SP // 5336
AM=M+1 // 5337
A=A-1 // 5338
M=D // 5339
// call Math.multiply
@7 // 5340
D=A // 5341
@14 // 5342
M=D // 5343
@Math.multiply // 5344
D=A // 5345
@13 // 5346
M=D // 5347
@Output.printChar.ret.1 // 5348
D=A // 5349
@CALL // 5350
0;JMP // 5351
(Output.printChar.ret.1)
@LCL // 5352
A=M+1 // 5353
A=A+1 // 5354
A=A+1 // 5355
D=M // 5356
@SP // 5357
AM=M-1 // 5358
D=D+M // 5359
@SP // 5360
AM=M+1 // 5361
A=A-1 // 5362
M=D // 5363
@32 // 5364
D=A // 5365
@SP // 5366
AM=M+1 // 5367
A=A-1 // 5368
M=D // 5369
// call Math.multiply
@7 // 5370
D=A // 5371
@14 // 5372
M=D // 5373
@Math.multiply // 5374
D=A // 5375
@13 // 5376
M=D // 5377
@Output.printChar.ret.2 // 5378
D=A // 5379
@CALL // 5380
0;JMP // 5381
(Output.printChar.ret.2)
@SP // 5382
AM=M-1 // 5383
D=M // 5384
@16384 // 5385
D=D+A // 5386
@SP // 5387
AM=M+1 // 5388
A=A-1 // 5389
M=D // 5390
@Output.1 // 5391
D=M // 5392
@SP // 5393
AM=M+1 // 5394
A=A-1 // 5395
M=D // 5396
@2 // 5397
D=A // 5398
@SP // 5399
AM=M+1 // 5400
A=A-1 // 5401
M=D // 5402
// call Math.divide
@7 // 5403
D=A // 5404
@14 // 5405
M=D // 5406
@Math.divide // 5407
D=A // 5408
@13 // 5409
M=D // 5410
@Output.printChar.ret.3 // 5411
D=A // 5412
@CALL // 5413
0;JMP // 5414
(Output.printChar.ret.3)
@SP // 5415
AM=M-1 // 5416
D=M // 5417
@SP // 5418
AM=M-1 // 5419
D=D+M // 5420
@LCL // 5421
A=M+1 // 5422
M=D // 5423

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
@Output.printChar.EQ.51 // 5424
D=A // 5425
@SP // 5426
AM=M+1 // 5427
A=A-1 // 5428
M=D // 5429
@Output.1 // 5430
D=M // 5431
@1 // 5432
D=D&A // 5433
@DO_EQ // 5434
0;JMP // 5435
(Output.printChar.EQ.51)
@Output.printChar$IF_TRUE1 // 5436
D;JNE // 5437

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5438
0;JMP // 5439

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

@LCL // 5440
A=M+1 // 5441
A=A+1 // 5442
A=A+1 // 5443
D=M // 5444
A=A-1 // 5445
A=A-1 // 5446
A=A-1 // 5447
A=D+M // 5448
D=M // 5449
@LCL // 5450
A=M+1 // 5451
A=A+1 // 5452
M=D // 5453

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5454
0;JMP // 5455

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

@LCL // 5456
A=M+1 // 5457
A=A+1 // 5458
A=A+1 // 5459
D=M // 5460
A=A-1 // 5461
A=A-1 // 5462
A=A-1 // 5463
A=D+M // 5464
D=M // 5465
@SP // 5466
AM=M+1 // 5467
A=A-1 // 5468
M=D // 5469
@256 // 5470
D=A // 5471
@SP // 5472
AM=M+1 // 5473
A=A-1 // 5474
M=D // 5475
// call Math.multiply
@7 // 5476
D=A // 5477
@14 // 5478
M=D // 5479
@Math.multiply // 5480
D=A // 5481
@13 // 5482
M=D // 5483
@Output.printChar.ret.4 // 5484
D=A // 5485
@CALL // 5486
0;JMP // 5487
(Output.printChar.ret.4)
@SP // 5488
AM=M-1 // 5489
D=M // 5490
@LCL // 5491
A=M+1 // 5492
A=A+1 // 5493
M=D // 5494

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
@LCL // 5495
A=M+1 // 5496
D=M // 5497
@0 // 5498
D=D+A // 5499
@SP // 5500
AM=M+1 // 5501
A=A-1 // 5502
M=D // 5503
@LCL // 5504
A=M+1 // 5505
A=M // 5506
D=M // 5507
@SP // 5508
AM=M+1 // 5509
A=A-1 // 5510
M=D // 5511
@LCL // 5512
A=M+1 // 5513
A=A+1 // 5514
D=M // 5515
@SP // 5516
AM=M-1 // 5517
D=D|M // 5518
@SP // 5519
AM=M-1 // 5520
A=M // 5521
M=D // 5522

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

@LCL // 5523
A=M+1 // 5524
A=A+1 // 5525
A=A+1 // 5526
M=M+1 // 5527

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5528
0;JMP // 5529

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
@Output.printChar.EQ.52 // 5530
D=A // 5531
@SP // 5532
AM=M+1 // 5533
A=A-1 // 5534
M=D // 5535
@Output.1 // 5536
D=M // 5537
@63 // 5538
D=D-A // 5539
@DO_EQ // 5540
0;JMP // 5541
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE2 // 5542
D;JNE // 5543

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5544
0;JMP // 5545

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5546
D=A // 5547
@14 // 5548
M=D // 5549
@Output.println // 5550
D=A // 5551
@13 // 5552
M=D // 5553
@Output.printChar.ret.5 // 5554
D=A // 5555
@CALL // 5556
0;JMP // 5557
(Output.printChar.ret.5)
@SP // 5558
M=M-1 // 5559

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5560
0;JMP // 5561

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

@Output.1 // 5562
M=M+1 // 5563

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5564
AM=M+1 // 5565
A=A-1 // 5566
M=0 // 5567
@RETURN // 5568
0;JMP // 5569

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
@Memory.remove_node.EQ.53 // 5570
D=A // 5571
@SP // 5572
AM=M+1 // 5573
A=A-1 // 5574
M=D // 5575
@ARG // 5576
A=M+1 // 5577
D=M // 5578
@ARG // 5579
A=M+1 // 5580
D=M // 5581
@2 // 5582
D=D+A // 5583
A=D // 5584
D=M // 5585
@DO_EQ // 5586
0;JMP // 5587
(Memory.remove_node.EQ.53)
D=!D // 5588
@Memory.remove_node$IF_TRUE1 // 5589
D;JNE // 5590

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5591
0;JMP // 5592

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
@ARG // 5593
A=M+1 // 5594
D=M // 5595
@ARG // 5596
A=M+1 // 5597
D=M // 5598
@2 // 5599
D=D+A // 5600
A=D // 5601
D=M // 5602
@3 // 5603
D=D+A // 5604
@SP // 5605
AM=M+1 // 5606
A=A-1 // 5607
M=D // 5608
@ARG // 5609
A=M+1 // 5610
D=M // 5611
@ARG // 5612
A=M+1 // 5613
D=M // 5614
@3 // 5615
D=D+A // 5616
A=D // 5617
D=M // 5618
@SP // 5619
AM=M-1 // 5620
A=M // 5621
M=D // 5622

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5623
0;JMP // 5624

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
@ARG // 5625
A=M // 5626
D=M // 5627
@0 // 5628
D=D+A // 5629
@SP // 5630
AM=M+1 // 5631
A=A-1 // 5632
M=D // 5633
@ARG // 5634
A=M+1 // 5635
D=M // 5636
@ARG // 5637
A=M+1 // 5638
D=M // 5639
@3 // 5640
D=D+A // 5641
A=D // 5642
D=M // 5643
@SP // 5644
AM=M-1 // 5645
A=M // 5646
M=D // 5647

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
@Memory.remove_node.EQ.54 // 5648
D=A // 5649
@SP // 5650
AM=M+1 // 5651
A=A-1 // 5652
M=D // 5653
@ARG // 5654
A=M+1 // 5655
D=M // 5656
@ARG // 5657
A=M+1 // 5658
D=M // 5659
@3 // 5660
D=D+A // 5661
A=D // 5662
D=M // 5663
@DO_EQ // 5664
0;JMP // 5665
(Memory.remove_node.EQ.54)
D=!D // 5666
@Memory.remove_node$IF_TRUE2 // 5667
D;JNE // 5668

////GotoInstruction{label='Memory.remove_node$IF_END2}
// goto Memory.remove_node$IF_END2
@Memory.remove_node$IF_END2 // 5669
0;JMP // 5670

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
@ARG // 5671
A=M+1 // 5672
D=M // 5673
@ARG // 5674
A=M+1 // 5675
D=M // 5676
@3 // 5677
D=D+A // 5678
A=D // 5679
D=M // 5680
@2 // 5681
D=D+A // 5682
@SP // 5683
AM=M+1 // 5684
A=A-1 // 5685
M=D // 5686
@ARG // 5687
A=M+1 // 5688
D=M // 5689
@ARG // 5690
A=M+1 // 5691
D=M // 5692
@2 // 5693
D=D+A // 5694
A=D // 5695
D=M // 5696
@SP // 5697
AM=M-1 // 5698
A=M // 5699
M=D // 5700

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
@ARG // 5701
A=M+1 // 5702
D=M // 5703
@2 // 5704
D=D+A // 5705
@SP // 5706
AM=M+1 // 5707
A=A-1 // 5708
M=D // 5709
D=0 // 5710
@SP // 5711
AM=M-1 // 5712
A=M // 5713
M=D // 5714

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5715
A=M+1 // 5716
D=M // 5717
@3 // 5718
D=D+A // 5719
@SP // 5720
AM=M+1 // 5721
A=A-1 // 5722
M=D // 5723
D=0 // 5724
@SP // 5725
AM=M-1 // 5726
A=M // 5727
M=D // 5728

////PushInstruction("constant 0")
@SP // 5729
AM=M+1 // 5730
A=A-1 // 5731
M=0 // 5732
@RETURN // 5733
0;JMP // 5734

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5735
AM=M+1 // 5736
A=A-1 // 5737
M=0 // 5738

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5739
D=A // 5740
@SP // 5741
AM=M+1 // 5742
A=A-1 // 5743
M=D // 5744
// call Memory.alloc
@6 // 5745
D=A // 5746
@14 // 5747
M=D // 5748
@Memory.alloc // 5749
D=A // 5750
@13 // 5751
M=D // 5752
@Output.init.ret.0 // 5753
D=A // 5754
@CALL // 5755
0;JMP // 5756
(Output.init.ret.0)
@SP // 5757
AM=M-1 // 5758
D=M // 5759
@Output.0 // 5760
M=D // 5761

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5762
D=A // 5763
@SP // 5764
M=D+M // 5765
@63 // 5766
D=A // 5767
@SP // 5768
A=M-1 // 5769
M=0 // 5770
A=A-1 // 5771
M=0 // 5772
A=A-1 // 5773
M=D // 5774
A=A-1 // 5775
M=D // 5776
A=A-1 // 5777
M=D // 5778
A=A-1 // 5779
M=D // 5780
A=A-1 // 5781
M=D // 5782
A=A-1 // 5783
M=D // 5784
A=A-1 // 5785
M=D // 5786
A=A-1 // 5787
M=D // 5788
A=A-1 // 5789
M=D // 5790
A=A-1 // 5791
M=0 // 5792
// call Output.create
@17 // 5793
D=A // 5794
@14 // 5795
M=D // 5796
@Output.create // 5797
D=A // 5798
@13 // 5799
M=D // 5800
@Output.init.ret.1 // 5801
D=A // 5802
@CALL // 5803
0;JMP // 5804
(Output.init.ret.1)
@SP // 5805
M=M-1 // 5806

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5807
D=A // 5808
@SP // 5809
M=D+M // 5810
@32 // 5811
D=A // 5812
@SP // 5813
A=M-1 // 5814
M=0 // 5815
A=A-1 // 5816
M=0 // 5817
A=A-1 // 5818
M=0 // 5819
A=A-1 // 5820
M=0 // 5821
A=A-1 // 5822
M=0 // 5823
A=A-1 // 5824
M=0 // 5825
A=A-1 // 5826
M=0 // 5827
A=A-1 // 5828
M=0 // 5829
A=A-1 // 5830
M=0 // 5831
A=A-1 // 5832
M=0 // 5833
A=A-1 // 5834
M=0 // 5835
A=A-1 // 5836
M=D // 5837
A=A-1 // 5838
// call Output.create
@17 // 5839
D=A // 5840
@14 // 5841
M=D // 5842
@Output.create // 5843
D=A // 5844
@13 // 5845
M=D // 5846
@Output.init.ret.2 // 5847
D=A // 5848
@CALL // 5849
0;JMP // 5850
(Output.init.ret.2)
@SP // 5851
M=M-1 // 5852

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5853
D=A // 5854
@SP // 5855
AM=M+1 // 5856
A=A-1 // 5857
M=D // 5858
@12 // 5859
D=A // 5860
@SP // 5861
AM=M+1 // 5862
A=A-1 // 5863
M=D // 5864
@30 // 5865
D=A // 5866
@SP // 5867
AM=M+1 // 5868
A=A-1 // 5869
M=D // 5870
@30 // 5871
D=A // 5872
@SP // 5873
AM=M+1 // 5874
A=A-1 // 5875
M=D // 5876
@30 // 5877
D=A // 5878
@SP // 5879
AM=M+1 // 5880
A=A-1 // 5881
M=D // 5882
@12 // 5883
D=A // 5884
@SP // 5885
AM=M+1 // 5886
A=A-1 // 5887
M=D // 5888
@12 // 5889
D=A // 5890
@SP // 5891
AM=M+1 // 5892
A=A-1 // 5893
M=D // 5894
@SP // 5895
AM=M+1 // 5896
A=A-1 // 5897
M=0 // 5898
@4 // 5899
D=A // 5900
@SP // 5901
M=D+M // 5902
@12 // 5903
D=A // 5904
@SP // 5905
A=M-1 // 5906
M=0 // 5907
A=A-1 // 5908
M=0 // 5909
A=A-1 // 5910
M=D // 5911
A=A-1 // 5912
M=D // 5913
A=A-1 // 5914
// call Output.create
@17 // 5915
D=A // 5916
@14 // 5917
M=D // 5918
@Output.create // 5919
D=A // 5920
@13 // 5921
M=D // 5922
@Output.init.ret.3 // 5923
D=A // 5924
@CALL // 5925
0;JMP // 5926
(Output.init.ret.3)
@SP // 5927
M=M-1 // 5928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5929
D=A // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=D // 5934
@54 // 5935
D=A // 5936
@SP // 5937
AM=M+1 // 5938
A=A-1 // 5939
M=D // 5940
@54 // 5941
D=A // 5942
@SP // 5943
AM=M+1 // 5944
A=A-1 // 5945
M=D // 5946
@20 // 5947
D=A // 5948
@SP // 5949
AM=M+1 // 5950
A=A-1 // 5951
M=D // 5952
@SP // 5953
AM=M+1 // 5954
A=A-1 // 5955
M=0 // 5956
@SP // 5957
AM=M+1 // 5958
A=A-1 // 5959
M=0 // 5960
@SP // 5961
AM=M+1 // 5962
A=A-1 // 5963
M=0 // 5964
@SP // 5965
AM=M+1 // 5966
A=A-1 // 5967
M=0 // 5968
@SP // 5969
AM=M+1 // 5970
A=A-1 // 5971
M=0 // 5972
@SP // 5973
AM=M+1 // 5974
A=A-1 // 5975
M=0 // 5976
@SP // 5977
AM=M+1 // 5978
A=A-1 // 5979
M=0 // 5980
@SP // 5981
AM=M+1 // 5982
A=A-1 // 5983
M=0 // 5984
// call Output.create
@17 // 5985
D=A // 5986
@14 // 5987
M=D // 5988
@Output.create // 5989
D=A // 5990
@13 // 5991
M=D // 5992
@Output.init.ret.4 // 5993
D=A // 5994
@CALL // 5995
0;JMP // 5996
(Output.init.ret.4)
@SP // 5997
M=M-1 // 5998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5999
D=A // 6000
@SP // 6001
M=D+M // 6002
@35 // 6003
D=A // 6004
@SP // 6005
A=M-1 // 6006
M=0 // 6007
A=A-1 // 6008
M=D // 6009
A=A-1 // 6010
@18 // 6011
D=A // 6012
@SP // 6013
AM=M+1 // 6014
A=A-1 // 6015
M=D // 6016
@18 // 6017
D=A // 6018
@SP // 6019
AM=M+1 // 6020
A=A-1 // 6021
M=D // 6022
@63 // 6023
D=A // 6024
@SP // 6025
AM=M+1 // 6026
A=A-1 // 6027
M=D // 6028
@18 // 6029
D=A // 6030
@SP // 6031
AM=M+1 // 6032
A=A-1 // 6033
M=D // 6034
@18 // 6035
D=A // 6036
@SP // 6037
AM=M+1 // 6038
A=A-1 // 6039
M=D // 6040
@63 // 6041
D=A // 6042
@SP // 6043
AM=M+1 // 6044
A=A-1 // 6045
M=D // 6046
@18 // 6047
D=A // 6048
@SP // 6049
AM=M+1 // 6050
A=A-1 // 6051
M=D // 6052
@18 // 6053
D=A // 6054
@SP // 6055
AM=M+1 // 6056
A=A-1 // 6057
M=D // 6058
@SP // 6059
AM=M+1 // 6060
A=A-1 // 6061
M=0 // 6062
@SP // 6063
AM=M+1 // 6064
A=A-1 // 6065
M=0 // 6066
// call Output.create
@17 // 6067
D=A // 6068
@14 // 6069
M=D // 6070
@Output.create // 6071
D=A // 6072
@13 // 6073
M=D // 6074
@Output.init.ret.5 // 6075
D=A // 6076
@CALL // 6077
0;JMP // 6078
(Output.init.ret.5)
@SP // 6079
M=M-1 // 6080

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6081
D=A // 6082
@SP // 6083
AM=M+1 // 6084
A=A-1 // 6085
M=D // 6086
@12 // 6087
D=A // 6088
@SP // 6089
AM=M+1 // 6090
A=A-1 // 6091
M=D // 6092
@30 // 6093
D=A // 6094
@SP // 6095
AM=M+1 // 6096
A=A-1 // 6097
M=D // 6098
@51 // 6099
D=A // 6100
@SP // 6101
AM=M+1 // 6102
A=A-1 // 6103
M=D // 6104
@3 // 6105
D=A // 6106
@SP // 6107
AM=M+1 // 6108
A=A-1 // 6109
M=D // 6110
@30 // 6111
D=A // 6112
@SP // 6113
AM=M+1 // 6114
A=A-1 // 6115
M=D // 6116
@48 // 6117
D=A // 6118
@SP // 6119
AM=M+1 // 6120
A=A-1 // 6121
M=D // 6122
@51 // 6123
D=A // 6124
@SP // 6125
AM=M+1 // 6126
A=A-1 // 6127
M=D // 6128
@30 // 6129
D=A // 6130
@SP // 6131
AM=M+1 // 6132
A=A-1 // 6133
M=D // 6134
@12 // 6135
D=A // 6136
@SP // 6137
AM=M+1 // 6138
A=A-1 // 6139
M=D // 6140
@12 // 6141
D=A // 6142
@SP // 6143
AM=M+1 // 6144
A=A-1 // 6145
M=D // 6146
@SP // 6147
AM=M+1 // 6148
A=A-1 // 6149
M=0 // 6150
// call Output.create
@17 // 6151
D=A // 6152
@14 // 6153
M=D // 6154
@Output.create // 6155
D=A // 6156
@13 // 6157
M=D // 6158
@Output.init.ret.6 // 6159
D=A // 6160
@CALL // 6161
0;JMP // 6162
(Output.init.ret.6)
@SP // 6163
M=M-1 // 6164

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6165
D=A // 6166
@SP // 6167
M=D+M // 6168
@37 // 6169
D=A // 6170
@SP // 6171
A=M-1 // 6172
M=0 // 6173
A=A-1 // 6174
M=0 // 6175
A=A-1 // 6176
M=D // 6177
A=A-1 // 6178
@35 // 6179
D=A // 6180
@SP // 6181
AM=M+1 // 6182
A=A-1 // 6183
M=D // 6184
@51 // 6185
D=A // 6186
@SP // 6187
AM=M+1 // 6188
A=A-1 // 6189
M=D // 6190
@24 // 6191
D=A // 6192
@SP // 6193
AM=M+1 // 6194
A=A-1 // 6195
M=D // 6196
@12 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202
@6 // 6203
D=A // 6204
@SP // 6205
AM=M+1 // 6206
A=A-1 // 6207
M=D // 6208
@51 // 6209
D=A // 6210
@SP // 6211
AM=M+1 // 6212
A=A-1 // 6213
M=D // 6214
@49 // 6215
D=A // 6216
@SP // 6217
AM=M+1 // 6218
A=A-1 // 6219
M=D // 6220
@SP // 6221
AM=M+1 // 6222
A=A-1 // 6223
M=0 // 6224
@SP // 6225
AM=M+1 // 6226
A=A-1 // 6227
M=0 // 6228
// call Output.create
@17 // 6229
D=A // 6230
@14 // 6231
M=D // 6232
@Output.create // 6233
D=A // 6234
@13 // 6235
M=D // 6236
@Output.init.ret.7 // 6237
D=A // 6238
@CALL // 6239
0;JMP // 6240
(Output.init.ret.7)
@SP // 6241
M=M-1 // 6242

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6243
D=A // 6244
@SP // 6245
AM=M+1 // 6246
A=A-1 // 6247
M=D // 6248
@12 // 6249
D=A // 6250
@SP // 6251
AM=M+1 // 6252
A=A-1 // 6253
M=D // 6254
@30 // 6255
D=A // 6256
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=D // 6260
@30 // 6261
D=A // 6262
@SP // 6263
AM=M+1 // 6264
A=A-1 // 6265
M=D // 6266
@12 // 6267
D=A // 6268
@SP // 6269
AM=M+1 // 6270
A=A-1 // 6271
M=D // 6272
@54 // 6273
D=A // 6274
@SP // 6275
AM=M+1 // 6276
A=A-1 // 6277
M=D // 6278
@27 // 6279
D=A // 6280
@SP // 6281
AM=M+1 // 6282
A=A-1 // 6283
M=D // 6284
@27 // 6285
D=A // 6286
@SP // 6287
AM=M+1 // 6288
A=A-1 // 6289
M=D // 6290
@27 // 6291
D=A // 6292
@SP // 6293
AM=M+1 // 6294
A=A-1 // 6295
M=D // 6296
@54 // 6297
D=A // 6298
@SP // 6299
AM=M+1 // 6300
A=A-1 // 6301
M=D // 6302
@SP // 6303
AM=M+1 // 6304
A=A-1 // 6305
M=0 // 6306
@SP // 6307
AM=M+1 // 6308
A=A-1 // 6309
M=0 // 6310
// call Output.create
@17 // 6311
D=A // 6312
@14 // 6313
M=D // 6314
@Output.create // 6315
D=A // 6316
@13 // 6317
M=D // 6318
@Output.init.ret.8 // 6319
D=A // 6320
@CALL // 6321
0;JMP // 6322
(Output.init.ret.8)
@SP // 6323
M=M-1 // 6324

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6325
D=A // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=D // 6330
@12 // 6331
D=A // 6332
@SP // 6333
AM=M+1 // 6334
A=A-1 // 6335
M=D // 6336
@12 // 6337
D=A // 6338
@SP // 6339
AM=M+1 // 6340
A=A-1 // 6341
M=D // 6342
@6 // 6343
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
@SP // 6357
AM=M+1 // 6358
A=A-1 // 6359
M=0 // 6360
@SP // 6361
AM=M+1 // 6362
A=A-1 // 6363
M=0 // 6364
@SP // 6365
AM=M+1 // 6366
A=A-1 // 6367
M=0 // 6368
@SP // 6369
AM=M+1 // 6370
A=A-1 // 6371
M=0 // 6372
@SP // 6373
AM=M+1 // 6374
A=A-1 // 6375
M=0 // 6376
@SP // 6377
AM=M+1 // 6378
A=A-1 // 6379
M=0 // 6380
// call Output.create
@17 // 6381
D=A // 6382
@14 // 6383
M=D // 6384
@Output.create // 6385
D=A // 6386
@13 // 6387
M=D // 6388
@Output.init.ret.9 // 6389
D=A // 6390
@CALL // 6391
0;JMP // 6392
(Output.init.ret.9)
@SP // 6393
M=M-1 // 6394

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6395
D=A // 6396
@SP // 6397
AM=M+1 // 6398
A=A-1 // 6399
M=D // 6400
@24 // 6401
D=A // 6402
@SP // 6403
AM=M+1 // 6404
A=A-1 // 6405
M=D // 6406
@12 // 6407
D=A // 6408
@SP // 6409
AM=M+1 // 6410
A=A-1 // 6411
M=D // 6412
@6 // 6413
D=A // 6414
@SP // 6415
AM=M+1 // 6416
A=A-1 // 6417
M=D // 6418
@6 // 6419
D=A // 6420
@SP // 6421
AM=M+1 // 6422
A=A-1 // 6423
M=D // 6424
@6 // 6425
D=A // 6426
@SP // 6427
AM=M+1 // 6428
A=A-1 // 6429
M=D // 6430
@6 // 6431
D=A // 6432
@SP // 6433
AM=M+1 // 6434
A=A-1 // 6435
M=D // 6436
@6 // 6437
D=A // 6438
@SP // 6439
AM=M+1 // 6440
A=A-1 // 6441
M=D // 6442
@12 // 6443
D=A // 6444
@SP // 6445
AM=M+1 // 6446
A=A-1 // 6447
M=D // 6448
@24 // 6449
D=A // 6450
@SP // 6451
AM=M+1 // 6452
A=A-1 // 6453
M=D // 6454
@SP // 6455
AM=M+1 // 6456
A=A-1 // 6457
M=0 // 6458
@SP // 6459
AM=M+1 // 6460
A=A-1 // 6461
M=0 // 6462
// call Output.create
@17 // 6463
D=A // 6464
@14 // 6465
M=D // 6466
@Output.create // 6467
D=A // 6468
@13 // 6469
M=D // 6470
@Output.init.ret.10 // 6471
D=A // 6472
@CALL // 6473
0;JMP // 6474
(Output.init.ret.10)
@SP // 6475
M=M-1 // 6476

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6477
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
@24 // 6501
D=A // 6502
@SP // 6503
AM=M+1 // 6504
A=A-1 // 6505
M=D // 6506
@24 // 6507
D=A // 6508
@SP // 6509
AM=M+1 // 6510
A=A-1 // 6511
M=D // 6512
@24 // 6513
D=A // 6514
@SP // 6515
AM=M+1 // 6516
A=A-1 // 6517
M=D // 6518
@24 // 6519
D=A // 6520
@SP // 6521
AM=M+1 // 6522
A=A-1 // 6523
M=D // 6524
@12 // 6525
D=A // 6526
@SP // 6527
AM=M+1 // 6528
A=A-1 // 6529
M=D // 6530
@6 // 6531
D=A // 6532
@SP // 6533
AM=M+1 // 6534
A=A-1 // 6535
M=D // 6536
@SP // 6537
AM=M+1 // 6538
A=A-1 // 6539
M=0 // 6540
@SP // 6541
AM=M+1 // 6542
A=A-1 // 6543
M=0 // 6544
// call Output.create
@17 // 6545
D=A // 6546
@14 // 6547
M=D // 6548
@Output.create // 6549
D=A // 6550
@13 // 6551
M=D // 6552
@Output.init.ret.11 // 6553
D=A // 6554
@CALL // 6555
0;JMP // 6556
(Output.init.ret.11)
@SP // 6557
M=M-1 // 6558

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6559
D=A // 6560
@SP // 6561
M=D+M // 6562
@42 // 6563
D=A // 6564
@SP // 6565
A=M-1 // 6566
M=0 // 6567
A=A-1 // 6568
M=0 // 6569
A=A-1 // 6570
M=0 // 6571
A=A-1 // 6572
M=D // 6573
A=A-1 // 6574
@51 // 6575
D=A // 6576
@SP // 6577
AM=M+1 // 6578
A=A-1 // 6579
M=D // 6580
@30 // 6581
D=A // 6582
@SP // 6583
AM=M+1 // 6584
A=A-1 // 6585
M=D // 6586
@63 // 6587
D=A // 6588
@SP // 6589
AM=M+1 // 6590
A=A-1 // 6591
M=D // 6592
@30 // 6593
D=A // 6594
@SP // 6595
AM=M+1 // 6596
A=A-1 // 6597
M=D // 6598
@51 // 6599
D=A // 6600
@SP // 6601
AM=M+1 // 6602
A=A-1 // 6603
M=D // 6604
@SP // 6605
AM=M+1 // 6606
A=A-1 // 6607
M=0 // 6608
@SP // 6609
AM=M+1 // 6610
A=A-1 // 6611
M=0 // 6612
@SP // 6613
AM=M+1 // 6614
A=A-1 // 6615
M=0 // 6616
// call Output.create
@17 // 6617
D=A // 6618
@14 // 6619
M=D // 6620
@Output.create // 6621
D=A // 6622
@13 // 6623
M=D // 6624
@Output.init.ret.12 // 6625
D=A // 6626
@CALL // 6627
0;JMP // 6628
(Output.init.ret.12)
@SP // 6629
M=M-1 // 6630

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6631
D=A // 6632
@SP // 6633
M=D+M // 6634
@43 // 6635
D=A // 6636
@SP // 6637
A=M-1 // 6638
M=0 // 6639
A=A-1 // 6640
M=0 // 6641
A=A-1 // 6642
M=0 // 6643
A=A-1 // 6644
M=D // 6645
A=A-1 // 6646
@12 // 6647
D=A // 6648
@SP // 6649
AM=M+1 // 6650
A=A-1 // 6651
M=D // 6652
@12 // 6653
D=A // 6654
@SP // 6655
AM=M+1 // 6656
A=A-1 // 6657
M=D // 6658
@63 // 6659
D=A // 6660
@SP // 6661
AM=M+1 // 6662
A=A-1 // 6663
M=D // 6664
@12 // 6665
D=A // 6666
@SP // 6667
AM=M+1 // 6668
A=A-1 // 6669
M=D // 6670
@12 // 6671
D=A // 6672
@SP // 6673
AM=M+1 // 6674
A=A-1 // 6675
M=D // 6676
@SP // 6677
AM=M+1 // 6678
A=A-1 // 6679
M=0 // 6680
@SP // 6681
AM=M+1 // 6682
A=A-1 // 6683
M=0 // 6684
@SP // 6685
AM=M+1 // 6686
A=A-1 // 6687
M=0 // 6688
// call Output.create
@17 // 6689
D=A // 6690
@14 // 6691
M=D // 6692
@Output.create // 6693
D=A // 6694
@13 // 6695
M=D // 6696
@Output.init.ret.13 // 6697
D=A // 6698
@CALL // 6699
0;JMP // 6700
(Output.init.ret.13)
@SP // 6701
M=M-1 // 6702

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6703
D=A // 6704
@SP // 6705
M=D+M // 6706
@44 // 6707
D=A // 6708
@SP // 6709
A=M-1 // 6710
M=0 // 6711
A=A-1 // 6712
M=0 // 6713
A=A-1 // 6714
M=0 // 6715
A=A-1 // 6716
M=0 // 6717
A=A-1 // 6718
M=0 // 6719
A=A-1 // 6720
M=0 // 6721
A=A-1 // 6722
M=0 // 6723
A=A-1 // 6724
M=D // 6725
A=A-1 // 6726
@12 // 6727
D=A // 6728
@SP // 6729
AM=M+1 // 6730
A=A-1 // 6731
M=D // 6732
@12 // 6733
D=A // 6734
@SP // 6735
AM=M+1 // 6736
A=A-1 // 6737
M=D // 6738
@6 // 6739
D=A // 6740
@SP // 6741
AM=M+1 // 6742
A=A-1 // 6743
M=D // 6744
@SP // 6745
AM=M+1 // 6746
A=A-1 // 6747
M=0 // 6748
// call Output.create
@17 // 6749
D=A // 6750
@14 // 6751
M=D // 6752
@Output.create // 6753
D=A // 6754
@13 // 6755
M=D // 6756
@Output.init.ret.14 // 6757
D=A // 6758
@CALL // 6759
0;JMP // 6760
(Output.init.ret.14)
@SP // 6761
M=M-1 // 6762

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6763
D=A // 6764
@SP // 6765
M=D+M // 6766
@45 // 6767
D=A // 6768
@SP // 6769
A=M-1 // 6770
M=0 // 6771
A=A-1 // 6772
M=0 // 6773
A=A-1 // 6774
M=0 // 6775
A=A-1 // 6776
M=0 // 6777
A=A-1 // 6778
M=0 // 6779
A=A-1 // 6780
M=D // 6781
A=A-1 // 6782
@6 // 6783
D=A // 6784
@SP // 6785
M=D+M // 6786
@63 // 6787
D=A // 6788
@SP // 6789
A=M-1 // 6790
M=0 // 6791
A=A-1 // 6792
M=0 // 6793
A=A-1 // 6794
M=0 // 6795
A=A-1 // 6796
M=0 // 6797
A=A-1 // 6798
M=0 // 6799
A=A-1 // 6800
M=D // 6801
A=A-1 // 6802
// call Output.create
@17 // 6803
D=A // 6804
@14 // 6805
M=D // 6806
@Output.create // 6807
D=A // 6808
@13 // 6809
M=D // 6810
@Output.init.ret.15 // 6811
D=A // 6812
@CALL // 6813
0;JMP // 6814
(Output.init.ret.15)
@SP // 6815
M=M-1 // 6816

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6817
D=A // 6818
@SP // 6819
M=D+M // 6820
@46 // 6821
D=A // 6822
@SP // 6823
A=M-1 // 6824
M=0 // 6825
A=A-1 // 6826
M=0 // 6827
A=A-1 // 6828
M=0 // 6829
A=A-1 // 6830
M=0 // 6831
A=A-1 // 6832
M=0 // 6833
A=A-1 // 6834
M=0 // 6835
A=A-1 // 6836
M=0 // 6837
A=A-1 // 6838
M=D // 6839
A=A-1 // 6840
@4 // 6841
D=A // 6842
@SP // 6843
M=D+M // 6844
@12 // 6845
D=A // 6846
@SP // 6847
A=M-1 // 6848
M=0 // 6849
A=A-1 // 6850
M=0 // 6851
A=A-1 // 6852
M=D // 6853
A=A-1 // 6854
M=D // 6855
A=A-1 // 6856
// call Output.create
@17 // 6857
D=A // 6858
@14 // 6859
M=D // 6860
@Output.create // 6861
D=A // 6862
@13 // 6863
M=D // 6864
@Output.init.ret.16 // 6865
D=A // 6866
@CALL // 6867
0;JMP // 6868
(Output.init.ret.16)
@SP // 6869
M=M-1 // 6870

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6871
D=A // 6872
@SP // 6873
M=D+M // 6874
@47 // 6875
D=A // 6876
@SP // 6877
A=M-1 // 6878
M=0 // 6879
A=A-1 // 6880
M=0 // 6881
A=A-1 // 6882
M=D // 6883
A=A-1 // 6884
@32 // 6885
D=A // 6886
@SP // 6887
AM=M+1 // 6888
A=A-1 // 6889
M=D // 6890
@48 // 6891
D=A // 6892
@SP // 6893
AM=M+1 // 6894
A=A-1 // 6895
M=D // 6896
@24 // 6897
D=A // 6898
@SP // 6899
AM=M+1 // 6900
A=A-1 // 6901
M=D // 6902
@12 // 6903
D=A // 6904
@SP // 6905
AM=M+1 // 6906
A=A-1 // 6907
M=D // 6908
@6 // 6909
D=A // 6910
@SP // 6911
AM=M+1 // 6912
A=A-1 // 6913
M=D // 6914
@3 // 6915
D=A // 6916
@SP // 6917
AM=M+1 // 6918
A=A-1 // 6919
M=D // 6920
@SP // 6921
AM=M+1 // 6922
A=A-1 // 6923
M=1 // 6924
@SP // 6925
AM=M+1 // 6926
A=A-1 // 6927
M=0 // 6928
@SP // 6929
AM=M+1 // 6930
A=A-1 // 6931
M=0 // 6932
// call Output.create
@17 // 6933
D=A // 6934
@14 // 6935
M=D // 6936
@Output.create // 6937
D=A // 6938
@13 // 6939
M=D // 6940
@Output.init.ret.17 // 6941
D=A // 6942
@CALL // 6943
0;JMP // 6944
(Output.init.ret.17)
@SP // 6945
M=M-1 // 6946

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6947
D=A // 6948
@SP // 6949
AM=M+1 // 6950
A=A-1 // 6951
M=D // 6952
@12 // 6953
D=A // 6954
@SP // 6955
AM=M+1 // 6956
A=A-1 // 6957
M=D // 6958
@30 // 6959
D=A // 6960
@SP // 6961
AM=M+1 // 6962
A=A-1 // 6963
M=D // 6964
@51 // 6965
D=A // 6966
@SP // 6967
AM=M+1 // 6968
A=A-1 // 6969
M=D // 6970
@51 // 6971
D=A // 6972
@SP // 6973
AM=M+1 // 6974
A=A-1 // 6975
M=D // 6976
@51 // 6977
D=A // 6978
@SP // 6979
AM=M+1 // 6980
A=A-1 // 6981
M=D // 6982
@51 // 6983
D=A // 6984
@SP // 6985
AM=M+1 // 6986
A=A-1 // 6987
M=D // 6988
@51 // 6989
D=A // 6990
@SP // 6991
AM=M+1 // 6992
A=A-1 // 6993
M=D // 6994
@30 // 6995
D=A // 6996
@SP // 6997
AM=M+1 // 6998
A=A-1 // 6999
M=D // 7000
@12 // 7001
D=A // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=D // 7006
@SP // 7007
AM=M+1 // 7008
A=A-1 // 7009
M=0 // 7010
@SP // 7011
AM=M+1 // 7012
A=A-1 // 7013
M=0 // 7014
// call Output.create
@17 // 7015
D=A // 7016
@14 // 7017
M=D // 7018
@Output.create // 7019
D=A // 7020
@13 // 7021
M=D // 7022
@Output.init.ret.18 // 7023
D=A // 7024
@CALL // 7025
0;JMP // 7026
(Output.init.ret.18)
@SP // 7027
M=M-1 // 7028

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 7029
D=A // 7030
@SP // 7031
AM=M+1 // 7032
A=A-1 // 7033
M=D // 7034
@12 // 7035
D=A // 7036
@SP // 7037
AM=M+1 // 7038
A=A-1 // 7039
M=D // 7040
@14 // 7041
D=A // 7042
@SP // 7043
AM=M+1 // 7044
A=A-1 // 7045
M=D // 7046
@15 // 7047
D=A // 7048
@SP // 7049
AM=M+1 // 7050
A=A-1 // 7051
M=D // 7052
@12 // 7053
D=A // 7054
@SP // 7055
AM=M+1 // 7056
A=A-1 // 7057
M=D // 7058
@12 // 7059
D=A // 7060
@SP // 7061
AM=M+1 // 7062
A=A-1 // 7063
M=D // 7064
@12 // 7065
D=A // 7066
@SP // 7067
AM=M+1 // 7068
A=A-1 // 7069
M=D // 7070
@12 // 7071
D=A // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=D // 7076
@12 // 7077
D=A // 7078
@SP // 7079
AM=M+1 // 7080
A=A-1 // 7081
M=D // 7082
@63 // 7083
D=A // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=D // 7088
@SP // 7089
AM=M+1 // 7090
A=A-1 // 7091
M=0 // 7092
@SP // 7093
AM=M+1 // 7094
A=A-1 // 7095
M=0 // 7096
// call Output.create
@17 // 7097
D=A // 7098
@14 // 7099
M=D // 7100
@Output.create // 7101
D=A // 7102
@13 // 7103
M=D // 7104
@Output.init.ret.19 // 7105
D=A // 7106
@CALL // 7107
0;JMP // 7108
(Output.init.ret.19)
@SP // 7109
M=M-1 // 7110

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7111
D=A // 7112
@SP // 7113
AM=M+1 // 7114
A=A-1 // 7115
M=D // 7116
@30 // 7117
D=A // 7118
@SP // 7119
AM=M+1 // 7120
A=A-1 // 7121
M=D // 7122
@51 // 7123
D=A // 7124
@SP // 7125
AM=M+1 // 7126
A=A-1 // 7127
M=D // 7128
@48 // 7129
D=A // 7130
@SP // 7131
AM=M+1 // 7132
A=A-1 // 7133
M=D // 7134
@24 // 7135
D=A // 7136
@SP // 7137
AM=M+1 // 7138
A=A-1 // 7139
M=D // 7140
@12 // 7141
D=A // 7142
@SP // 7143
AM=M+1 // 7144
A=A-1 // 7145
M=D // 7146
@6 // 7147
D=A // 7148
@SP // 7149
AM=M+1 // 7150
A=A-1 // 7151
M=D // 7152
@3 // 7153
D=A // 7154
@SP // 7155
AM=M+1 // 7156
A=A-1 // 7157
M=D // 7158
@51 // 7159
D=A // 7160
@SP // 7161
AM=M+1 // 7162
A=A-1 // 7163
M=D // 7164
@63 // 7165
D=A // 7166
@SP // 7167
AM=M+1 // 7168
A=A-1 // 7169
M=D // 7170
@SP // 7171
AM=M+1 // 7172
A=A-1 // 7173
M=0 // 7174
@SP // 7175
AM=M+1 // 7176
A=A-1 // 7177
M=0 // 7178
// call Output.create
@17 // 7179
D=A // 7180
@14 // 7181
M=D // 7182
@Output.create // 7183
D=A // 7184
@13 // 7185
M=D // 7186
@Output.init.ret.20 // 7187
D=A // 7188
@CALL // 7189
0;JMP // 7190
(Output.init.ret.20)
@SP // 7191
M=M-1 // 7192

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7193
D=A // 7194
@SP // 7195
AM=M+1 // 7196
A=A-1 // 7197
M=D // 7198
@30 // 7199
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
@48 // 7211
D=A // 7212
@SP // 7213
AM=M+1 // 7214
A=A-1 // 7215
M=D // 7216
@48 // 7217
D=A // 7218
@SP // 7219
AM=M+1 // 7220
A=A-1 // 7221
M=D // 7222
@28 // 7223
D=A // 7224
@SP // 7225
AM=M+1 // 7226
A=A-1 // 7227
M=D // 7228
@48 // 7229
D=A // 7230
@SP // 7231
AM=M+1 // 7232
A=A-1 // 7233
M=D // 7234
@48 // 7235
D=A // 7236
@SP // 7237
AM=M+1 // 7238
A=A-1 // 7239
M=D // 7240
@51 // 7241
D=A // 7242
@SP // 7243
AM=M+1 // 7244
A=A-1 // 7245
M=D // 7246
@30 // 7247
D=A // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=D // 7252
@SP // 7253
AM=M+1 // 7254
A=A-1 // 7255
M=0 // 7256
@SP // 7257
AM=M+1 // 7258
A=A-1 // 7259
M=0 // 7260
// call Output.create
@17 // 7261
D=A // 7262
@14 // 7263
M=D // 7264
@Output.create // 7265
D=A // 7266
@13 // 7267
M=D // 7268
@Output.init.ret.21 // 7269
D=A // 7270
@CALL // 7271
0;JMP // 7272
(Output.init.ret.21)
@SP // 7273
M=M-1 // 7274

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7275
D=A // 7276
@SP // 7277
AM=M+1 // 7278
A=A-1 // 7279
M=D // 7280
@16 // 7281
D=A // 7282
@SP // 7283
AM=M+1 // 7284
A=A-1 // 7285
M=D // 7286
@24 // 7287
D=A // 7288
@SP // 7289
AM=M+1 // 7290
A=A-1 // 7291
M=D // 7292
@28 // 7293
D=A // 7294
@SP // 7295
AM=M+1 // 7296
A=A-1 // 7297
M=D // 7298
@26 // 7299
D=A // 7300
@SP // 7301
AM=M+1 // 7302
A=A-1 // 7303
M=D // 7304
@25 // 7305
D=A // 7306
@SP // 7307
AM=M+1 // 7308
A=A-1 // 7309
M=D // 7310
@63 // 7311
D=A // 7312
@SP // 7313
AM=M+1 // 7314
A=A-1 // 7315
M=D // 7316
@24 // 7317
D=A // 7318
@SP // 7319
AM=M+1 // 7320
A=A-1 // 7321
M=D // 7322
@24 // 7323
D=A // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=D // 7328
@60 // 7329
D=A // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=D // 7334
@SP // 7335
AM=M+1 // 7336
A=A-1 // 7337
M=0 // 7338
@SP // 7339
AM=M+1 // 7340
A=A-1 // 7341
M=0 // 7342
// call Output.create
@17 // 7343
D=A // 7344
@14 // 7345
M=D // 7346
@Output.create // 7347
D=A // 7348
@13 // 7349
M=D // 7350
@Output.init.ret.22 // 7351
D=A // 7352
@CALL // 7353
0;JMP // 7354
(Output.init.ret.22)
@SP // 7355
M=M-1 // 7356

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7357
D=A // 7358
@SP // 7359
AM=M+1 // 7360
A=A-1 // 7361
M=D // 7362
@63 // 7363
D=A // 7364
@SP // 7365
AM=M+1 // 7366
A=A-1 // 7367
M=D // 7368
@3 // 7369
D=A // 7370
@SP // 7371
AM=M+1 // 7372
A=A-1 // 7373
M=D // 7374
@3 // 7375
D=A // 7376
@SP // 7377
AM=M+1 // 7378
A=A-1 // 7379
M=D // 7380
@31 // 7381
D=A // 7382
@SP // 7383
AM=M+1 // 7384
A=A-1 // 7385
M=D // 7386
@48 // 7387
D=A // 7388
@SP // 7389
AM=M+1 // 7390
A=A-1 // 7391
M=D // 7392
@48 // 7393
D=A // 7394
@SP // 7395
AM=M+1 // 7396
A=A-1 // 7397
M=D // 7398
@48 // 7399
D=A // 7400
@SP // 7401
AM=M+1 // 7402
A=A-1 // 7403
M=D // 7404
@51 // 7405
D=A // 7406
@SP // 7407
AM=M+1 // 7408
A=A-1 // 7409
M=D // 7410
@30 // 7411
D=A // 7412
@SP // 7413
AM=M+1 // 7414
A=A-1 // 7415
M=D // 7416
@SP // 7417
AM=M+1 // 7418
A=A-1 // 7419
M=0 // 7420
@SP // 7421
AM=M+1 // 7422
A=A-1 // 7423
M=0 // 7424
// call Output.create
@17 // 7425
D=A // 7426
@14 // 7427
M=D // 7428
@Output.create // 7429
D=A // 7430
@13 // 7431
M=D // 7432
@Output.init.ret.23 // 7433
D=A // 7434
@CALL // 7435
0;JMP // 7436
(Output.init.ret.23)
@SP // 7437
M=M-1 // 7438

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7439
D=A // 7440
@SP // 7441
AM=M+1 // 7442
A=A-1 // 7443
M=D // 7444
@28 // 7445
D=A // 7446
@SP // 7447
AM=M+1 // 7448
A=A-1 // 7449
M=D // 7450
@6 // 7451
D=A // 7452
@SP // 7453
AM=M+1 // 7454
A=A-1 // 7455
M=D // 7456
@3 // 7457
D=A // 7458
@SP // 7459
AM=M+1 // 7460
A=A-1 // 7461
M=D // 7462
@3 // 7463
D=A // 7464
@SP // 7465
AM=M+1 // 7466
A=A-1 // 7467
M=D // 7468
@31 // 7469
D=A // 7470
@SP // 7471
AM=M+1 // 7472
A=A-1 // 7473
M=D // 7474
@51 // 7475
D=A // 7476
@SP // 7477
AM=M+1 // 7478
A=A-1 // 7479
M=D // 7480
@51 // 7481
D=A // 7482
@SP // 7483
AM=M+1 // 7484
A=A-1 // 7485
M=D // 7486
@51 // 7487
D=A // 7488
@SP // 7489
AM=M+1 // 7490
A=A-1 // 7491
M=D // 7492
@30 // 7493
D=A // 7494
@SP // 7495
AM=M+1 // 7496
A=A-1 // 7497
M=D // 7498
@SP // 7499
AM=M+1 // 7500
A=A-1 // 7501
M=0 // 7502
@SP // 7503
AM=M+1 // 7504
A=A-1 // 7505
M=0 // 7506
// call Output.create
@17 // 7507
D=A // 7508
@14 // 7509
M=D // 7510
@Output.create // 7511
D=A // 7512
@13 // 7513
M=D // 7514
@Output.init.ret.24 // 7515
D=A // 7516
@CALL // 7517
0;JMP // 7518
(Output.init.ret.24)
@SP // 7519
M=M-1 // 7520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7521
D=A // 7522
@SP // 7523
AM=M+1 // 7524
A=A-1 // 7525
M=D // 7526
@63 // 7527
D=A // 7528
@SP // 7529
AM=M+1 // 7530
A=A-1 // 7531
M=D // 7532
@49 // 7533
D=A // 7534
@SP // 7535
AM=M+1 // 7536
A=A-1 // 7537
M=D // 7538
@48 // 7539
D=A // 7540
@SP // 7541
AM=M+1 // 7542
A=A-1 // 7543
M=D // 7544
@48 // 7545
D=A // 7546
@SP // 7547
AM=M+1 // 7548
A=A-1 // 7549
M=D // 7550
@24 // 7551
D=A // 7552
@SP // 7553
AM=M+1 // 7554
A=A-1 // 7555
M=D // 7556
@12 // 7557
D=A // 7558
@SP // 7559
AM=M+1 // 7560
A=A-1 // 7561
M=D // 7562
@12 // 7563
D=A // 7564
@SP // 7565
AM=M+1 // 7566
A=A-1 // 7567
M=D // 7568
@12 // 7569
D=A // 7570
@SP // 7571
AM=M+1 // 7572
A=A-1 // 7573
M=D // 7574
@12 // 7575
D=A // 7576
@SP // 7577
AM=M+1 // 7578
A=A-1 // 7579
M=D // 7580
@SP // 7581
AM=M+1 // 7582
A=A-1 // 7583
M=0 // 7584
@SP // 7585
AM=M+1 // 7586
A=A-1 // 7587
M=0 // 7588
// call Output.create
@17 // 7589
D=A // 7590
@14 // 7591
M=D // 7592
@Output.create // 7593
D=A // 7594
@13 // 7595
M=D // 7596
@Output.init.ret.25 // 7597
D=A // 7598
@CALL // 7599
0;JMP // 7600
(Output.init.ret.25)
@SP // 7601
M=M-1 // 7602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7603
D=A // 7604
@SP // 7605
AM=M+1 // 7606
A=A-1 // 7607
M=D // 7608
@30 // 7609
D=A // 7610
@SP // 7611
AM=M+1 // 7612
A=A-1 // 7613
M=D // 7614
@51 // 7615
D=A // 7616
@SP // 7617
AM=M+1 // 7618
A=A-1 // 7619
M=D // 7620
@51 // 7621
D=A // 7622
@SP // 7623
AM=M+1 // 7624
A=A-1 // 7625
M=D // 7626
@51 // 7627
D=A // 7628
@SP // 7629
AM=M+1 // 7630
A=A-1 // 7631
M=D // 7632
@30 // 7633
D=A // 7634
@SP // 7635
AM=M+1 // 7636
A=A-1 // 7637
M=D // 7638
@51 // 7639
D=A // 7640
@SP // 7641
AM=M+1 // 7642
A=A-1 // 7643
M=D // 7644
@51 // 7645
D=A // 7646
@SP // 7647
AM=M+1 // 7648
A=A-1 // 7649
M=D // 7650
@51 // 7651
D=A // 7652
@SP // 7653
AM=M+1 // 7654
A=A-1 // 7655
M=D // 7656
@30 // 7657
D=A // 7658
@SP // 7659
AM=M+1 // 7660
A=A-1 // 7661
M=D // 7662
@SP // 7663
AM=M+1 // 7664
A=A-1 // 7665
M=0 // 7666
@SP // 7667
AM=M+1 // 7668
A=A-1 // 7669
M=0 // 7670
// call Output.create
@17 // 7671
D=A // 7672
@14 // 7673
M=D // 7674
@Output.create // 7675
D=A // 7676
@13 // 7677
M=D // 7678
@Output.init.ret.26 // 7679
D=A // 7680
@CALL // 7681
0;JMP // 7682
(Output.init.ret.26)
@SP // 7683
M=M-1 // 7684

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7685
D=A // 7686
@SP // 7687
AM=M+1 // 7688
A=A-1 // 7689
M=D // 7690
@30 // 7691
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
@51 // 7703
D=A // 7704
@SP // 7705
AM=M+1 // 7706
A=A-1 // 7707
M=D // 7708
@51 // 7709
D=A // 7710
@SP // 7711
AM=M+1 // 7712
A=A-1 // 7713
M=D // 7714
@62 // 7715
D=A // 7716
@SP // 7717
AM=M+1 // 7718
A=A-1 // 7719
M=D // 7720
@48 // 7721
D=A // 7722
@SP // 7723
AM=M+1 // 7724
A=A-1 // 7725
M=D // 7726
@48 // 7727
D=A // 7728
@SP // 7729
AM=M+1 // 7730
A=A-1 // 7731
M=D // 7732
@24 // 7733
D=A // 7734
@SP // 7735
AM=M+1 // 7736
A=A-1 // 7737
M=D // 7738
@14 // 7739
D=A // 7740
@SP // 7741
AM=M+1 // 7742
A=A-1 // 7743
M=D // 7744
@SP // 7745
AM=M+1 // 7746
A=A-1 // 7747
M=0 // 7748
@SP // 7749
AM=M+1 // 7750
A=A-1 // 7751
M=0 // 7752
// call Output.create
@17 // 7753
D=A // 7754
@14 // 7755
M=D // 7756
@Output.create // 7757
D=A // 7758
@13 // 7759
M=D // 7760
@Output.init.ret.27 // 7761
D=A // 7762
@CALL // 7763
0;JMP // 7764
(Output.init.ret.27)
@SP // 7765
M=M-1 // 7766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7767
D=A // 7768
@SP // 7769
M=D+M // 7770
@58 // 7771
D=A // 7772
@SP // 7773
A=M-1 // 7774
M=0 // 7775
A=A-1 // 7776
M=0 // 7777
A=A-1 // 7778
M=D // 7779
A=A-1 // 7780
@4 // 7781
D=A // 7782
@SP // 7783
M=D+M // 7784
@12 // 7785
D=A // 7786
@SP // 7787
A=M-1 // 7788
M=0 // 7789
A=A-1 // 7790
M=0 // 7791
A=A-1 // 7792
M=D // 7793
A=A-1 // 7794
M=D // 7795
A=A-1 // 7796
@5 // 7797
D=A // 7798
@SP // 7799
M=D+M // 7800
@12 // 7801
D=A // 7802
@SP // 7803
A=M-1 // 7804
M=0 // 7805
A=A-1 // 7806
M=0 // 7807
A=A-1 // 7808
M=0 // 7809
A=A-1 // 7810
M=D // 7811
A=A-1 // 7812
M=D // 7813
A=A-1 // 7814
// call Output.create
@17 // 7815
D=A // 7816
@14 // 7817
M=D // 7818
@Output.create // 7819
D=A // 7820
@13 // 7821
M=D // 7822
@Output.init.ret.28 // 7823
D=A // 7824
@CALL // 7825
0;JMP // 7826
(Output.init.ret.28)
@SP // 7827
M=M-1 // 7828

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7829
D=A // 7830
@SP // 7831
M=D+M // 7832
@59 // 7833
D=A // 7834
@SP // 7835
A=M-1 // 7836
M=0 // 7837
A=A-1 // 7838
M=0 // 7839
A=A-1 // 7840
M=D // 7841
A=A-1 // 7842
@4 // 7843
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
M=D // 7855
A=A-1 // 7856
M=D // 7857
A=A-1 // 7858
@12 // 7859
D=A // 7860
@SP // 7861
AM=M+1 // 7862
A=A-1 // 7863
M=D // 7864
@12 // 7865
D=A // 7866
@SP // 7867
AM=M+1 // 7868
A=A-1 // 7869
M=D // 7870
@6 // 7871
D=A // 7872
@SP // 7873
AM=M+1 // 7874
A=A-1 // 7875
M=D // 7876
@SP // 7877
AM=M+1 // 7878
A=A-1 // 7879
M=0 // 7880
@SP // 7881
AM=M+1 // 7882
A=A-1 // 7883
M=0 // 7884
// call Output.create
@17 // 7885
D=A // 7886
@14 // 7887
M=D // 7888
@Output.create // 7889
D=A // 7890
@13 // 7891
M=D // 7892
@Output.init.ret.29 // 7893
D=A // 7894
@CALL // 7895
0;JMP // 7896
(Output.init.ret.29)
@SP // 7897
M=M-1 // 7898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7899
D=A // 7900
@SP // 7901
M=D+M // 7902
@60 // 7903
D=A // 7904
@SP // 7905
A=M-1 // 7906
M=0 // 7907
A=A-1 // 7908
M=0 // 7909
A=A-1 // 7910
M=D // 7911
A=A-1 // 7912
@24 // 7913
D=A // 7914
@SP // 7915
AM=M+1 // 7916
A=A-1 // 7917
M=D // 7918
@12 // 7919
D=A // 7920
@SP // 7921
AM=M+1 // 7922
A=A-1 // 7923
M=D // 7924
@6 // 7925
D=A // 7926
@SP // 7927
AM=M+1 // 7928
A=A-1 // 7929
M=D // 7930
@3 // 7931
D=A // 7932
@SP // 7933
AM=M+1 // 7934
A=A-1 // 7935
M=D // 7936
@6 // 7937
D=A // 7938
@SP // 7939
AM=M+1 // 7940
A=A-1 // 7941
M=D // 7942
@12 // 7943
D=A // 7944
@SP // 7945
AM=M+1 // 7946
A=A-1 // 7947
M=D // 7948
@24 // 7949
D=A // 7950
@SP // 7951
AM=M+1 // 7952
A=A-1 // 7953
M=D // 7954
@SP // 7955
AM=M+1 // 7956
A=A-1 // 7957
M=0 // 7958
@SP // 7959
AM=M+1 // 7960
A=A-1 // 7961
M=0 // 7962
// call Output.create
@17 // 7963
D=A // 7964
@14 // 7965
M=D // 7966
@Output.create // 7967
D=A // 7968
@13 // 7969
M=D // 7970
@Output.init.ret.30 // 7971
D=A // 7972
@CALL // 7973
0;JMP // 7974
(Output.init.ret.30)
@SP // 7975
M=M-1 // 7976

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7977
D=A // 7978
@SP // 7979
M=D+M // 7980
@61 // 7981
D=A // 7982
@SP // 7983
A=M-1 // 7984
M=0 // 7985
A=A-1 // 7986
M=0 // 7987
A=A-1 // 7988
M=0 // 7989
A=A-1 // 7990
M=D // 7991
A=A-1 // 7992
@3 // 7993
D=A // 7994
@SP // 7995
M=D+M // 7996
@63 // 7997
D=A // 7998
@SP // 7999
A=M-1 // 8000
M=0 // 8001
A=A-1 // 8002
M=0 // 8003
A=A-1 // 8004
M=D // 8005
A=A-1 // 8006
@5 // 8007
D=A // 8008
@SP // 8009
M=D+M // 8010
@63 // 8011
D=A // 8012
@SP // 8013
A=M-1 // 8014
M=0 // 8015
A=A-1 // 8016
M=0 // 8017
A=A-1 // 8018
M=0 // 8019
A=A-1 // 8020
M=0 // 8021
A=A-1 // 8022
M=D // 8023
A=A-1 // 8024
// call Output.create
@17 // 8025
D=A // 8026
@14 // 8027
M=D // 8028
@Output.create // 8029
D=A // 8030
@13 // 8031
M=D // 8032
@Output.init.ret.31 // 8033
D=A // 8034
@CALL // 8035
0;JMP // 8036
(Output.init.ret.31)
@SP // 8037
M=M-1 // 8038

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 8039
D=A // 8040
@SP // 8041
M=D+M // 8042
@62 // 8043
D=A // 8044
@SP // 8045
A=M-1 // 8046
M=0 // 8047
A=A-1 // 8048
M=0 // 8049
A=A-1 // 8050
M=D // 8051
A=A-1 // 8052
@3 // 8053
D=A // 8054
@SP // 8055
AM=M+1 // 8056
A=A-1 // 8057
M=D // 8058
@6 // 8059
D=A // 8060
@SP // 8061
AM=M+1 // 8062
A=A-1 // 8063
M=D // 8064
@12 // 8065
D=A // 8066
@SP // 8067
AM=M+1 // 8068
A=A-1 // 8069
M=D // 8070
@24 // 8071
D=A // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076
@12 // 8077
D=A // 8078
@SP // 8079
AM=M+1 // 8080
A=A-1 // 8081
M=D // 8082
@6 // 8083
D=A // 8084
@SP // 8085
AM=M+1 // 8086
A=A-1 // 8087
M=D // 8088
@3 // 8089
D=A // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=D // 8094
@SP // 8095
AM=M+1 // 8096
A=A-1 // 8097
M=0 // 8098
@SP // 8099
AM=M+1 // 8100
A=A-1 // 8101
M=0 // 8102
// call Output.create
@17 // 8103
D=A // 8104
@14 // 8105
M=D // 8106
@Output.create // 8107
D=A // 8108
@13 // 8109
M=D // 8110
@Output.init.ret.32 // 8111
D=A // 8112
@CALL // 8113
0;JMP // 8114
(Output.init.ret.32)
@SP // 8115
M=M-1 // 8116

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8117
D=A // 8118
@SP // 8119
AM=M+1 // 8120
A=A-1 // 8121
M=D // 8122
@30 // 8123
D=A // 8124
@SP // 8125
AM=M+1 // 8126
A=A-1 // 8127
M=D // 8128
@51 // 8129
D=A // 8130
@SP // 8131
AM=M+1 // 8132
A=A-1 // 8133
M=D // 8134
@51 // 8135
D=A // 8136
@SP // 8137
AM=M+1 // 8138
A=A-1 // 8139
M=D // 8140
@59 // 8141
D=A // 8142
@SP // 8143
AM=M+1 // 8144
A=A-1 // 8145
M=D // 8146
@59 // 8147
D=A // 8148
@SP // 8149
AM=M+1 // 8150
A=A-1 // 8151
M=D // 8152
@59 // 8153
D=A // 8154
@SP // 8155
AM=M+1 // 8156
A=A-1 // 8157
M=D // 8158
@27 // 8159
D=A // 8160
@SP // 8161
AM=M+1 // 8162
A=A-1 // 8163
M=D // 8164
@3 // 8165
D=A // 8166
@SP // 8167
AM=M+1 // 8168
A=A-1 // 8169
M=D // 8170
@30 // 8171
D=A // 8172
@SP // 8173
AM=M+1 // 8174
A=A-1 // 8175
M=D // 8176
@SP // 8177
AM=M+1 // 8178
A=A-1 // 8179
M=0 // 8180
@SP // 8181
AM=M+1 // 8182
A=A-1 // 8183
M=0 // 8184
// call Output.create
@17 // 8185
D=A // 8186
@14 // 8187
M=D // 8188
@Output.create // 8189
D=A // 8190
@13 // 8191
M=D // 8192
@Output.init.ret.33 // 8193
D=A // 8194
@CALL // 8195
0;JMP // 8196
(Output.init.ret.33)
@SP // 8197
M=M-1 // 8198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8199
D=A // 8200
@SP // 8201
AM=M+1 // 8202
A=A-1 // 8203
M=D // 8204
@30 // 8205
D=A // 8206
@SP // 8207
AM=M+1 // 8208
A=A-1 // 8209
M=D // 8210
@51 // 8211
D=A // 8212
@SP // 8213
AM=M+1 // 8214
A=A-1 // 8215
M=D // 8216
@51 // 8217
D=A // 8218
@SP // 8219
AM=M+1 // 8220
A=A-1 // 8221
M=D // 8222
@24 // 8223
D=A // 8224
@SP // 8225
AM=M+1 // 8226
A=A-1 // 8227
M=D // 8228
@12 // 8229
D=A // 8230
@SP // 8231
AM=M+1 // 8232
A=A-1 // 8233
M=D // 8234
@12 // 8235
D=A // 8236
@SP // 8237
AM=M+1 // 8238
A=A-1 // 8239
M=D // 8240
@SP // 8241
AM=M+1 // 8242
A=A-1 // 8243
M=0 // 8244
@4 // 8245
D=A // 8246
@SP // 8247
M=D+M // 8248
@12 // 8249
D=A // 8250
@SP // 8251
A=M-1 // 8252
M=0 // 8253
A=A-1 // 8254
M=0 // 8255
A=A-1 // 8256
M=D // 8257
A=A-1 // 8258
M=D // 8259
A=A-1 // 8260
// call Output.create
@17 // 8261
D=A // 8262
@14 // 8263
M=D // 8264
@Output.create // 8265
D=A // 8266
@13 // 8267
M=D // 8268
@Output.init.ret.34 // 8269
D=A // 8270
@CALL // 8271
0;JMP // 8272
(Output.init.ret.34)
@SP // 8273
M=M-1 // 8274

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8275
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
@30 // 8287
D=A // 8288
@SP // 8289
AM=M+1 // 8290
A=A-1 // 8291
M=D // 8292
@51 // 8293
D=A // 8294
@SP // 8295
AM=M+1 // 8296
A=A-1 // 8297
M=D // 8298
@51 // 8299
D=A // 8300
@SP // 8301
AM=M+1 // 8302
A=A-1 // 8303
M=D // 8304
@63 // 8305
D=A // 8306
@SP // 8307
AM=M+1 // 8308
A=A-1 // 8309
M=D // 8310
@51 // 8311
D=A // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=D // 8316
@51 // 8317
D=A // 8318
@SP // 8319
AM=M+1 // 8320
A=A-1 // 8321
M=D // 8322
@51 // 8323
D=A // 8324
@SP // 8325
AM=M+1 // 8326
A=A-1 // 8327
M=D // 8328
@51 // 8329
D=A // 8330
@SP // 8331
AM=M+1 // 8332
A=A-1 // 8333
M=D // 8334
@SP // 8335
AM=M+1 // 8336
A=A-1 // 8337
M=0 // 8338
@SP // 8339
AM=M+1 // 8340
A=A-1 // 8341
M=0 // 8342
// call Output.create
@17 // 8343
D=A // 8344
@14 // 8345
M=D // 8346
@Output.create // 8347
D=A // 8348
@13 // 8349
M=D // 8350
@Output.init.ret.35 // 8351
D=A // 8352
@CALL // 8353
0;JMP // 8354
(Output.init.ret.35)
@SP // 8355
M=M-1 // 8356

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8357
D=A // 8358
@SP // 8359
AM=M+1 // 8360
A=A-1 // 8361
M=D // 8362
@31 // 8363
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
@51 // 8381
D=A // 8382
@SP // 8383
AM=M+1 // 8384
A=A-1 // 8385
M=D // 8386
@31 // 8387
D=A // 8388
@SP // 8389
AM=M+1 // 8390
A=A-1 // 8391
M=D // 8392
@51 // 8393
D=A // 8394
@SP // 8395
AM=M+1 // 8396
A=A-1 // 8397
M=D // 8398
@51 // 8399
D=A // 8400
@SP // 8401
AM=M+1 // 8402
A=A-1 // 8403
M=D // 8404
@51 // 8405
D=A // 8406
@SP // 8407
AM=M+1 // 8408
A=A-1 // 8409
M=D // 8410
@31 // 8411
D=A // 8412
@SP // 8413
AM=M+1 // 8414
A=A-1 // 8415
M=D // 8416
@SP // 8417
AM=M+1 // 8418
A=A-1 // 8419
M=0 // 8420
@SP // 8421
AM=M+1 // 8422
A=A-1 // 8423
M=0 // 8424
// call Output.create
@17 // 8425
D=A // 8426
@14 // 8427
M=D // 8428
@Output.create // 8429
D=A // 8430
@13 // 8431
M=D // 8432
@Output.init.ret.36 // 8433
D=A // 8434
@CALL // 8435
0;JMP // 8436
(Output.init.ret.36)
@SP // 8437
M=M-1 // 8438

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8439
D=A // 8440
@SP // 8441
AM=M+1 // 8442
A=A-1 // 8443
M=D // 8444
@28 // 8445
D=A // 8446
@SP // 8447
AM=M+1 // 8448
A=A-1 // 8449
M=D // 8450
@54 // 8451
D=A // 8452
@SP // 8453
AM=M+1 // 8454
A=A-1 // 8455
M=D // 8456
@35 // 8457
D=A // 8458
@SP // 8459
AM=M+1 // 8460
A=A-1 // 8461
M=D // 8462
@3 // 8463
D=A // 8464
@SP // 8465
AM=M+1 // 8466
A=A-1 // 8467
M=D // 8468
@3 // 8469
D=A // 8470
@SP // 8471
AM=M+1 // 8472
A=A-1 // 8473
M=D // 8474
@3 // 8475
D=A // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=D // 8480
@35 // 8481
D=A // 8482
@SP // 8483
AM=M+1 // 8484
A=A-1 // 8485
M=D // 8486
@54 // 8487
D=A // 8488
@SP // 8489
AM=M+1 // 8490
A=A-1 // 8491
M=D // 8492
@28 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498
@SP // 8499
AM=M+1 // 8500
A=A-1 // 8501
M=0 // 8502
@SP // 8503
AM=M+1 // 8504
A=A-1 // 8505
M=0 // 8506
// call Output.create
@17 // 8507
D=A // 8508
@14 // 8509
M=D // 8510
@Output.create // 8511
D=A // 8512
@13 // 8513
M=D // 8514
@Output.init.ret.37 // 8515
D=A // 8516
@CALL // 8517
0;JMP // 8518
(Output.init.ret.37)
@SP // 8519
M=M-1 // 8520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8521
D=A // 8522
@SP // 8523
AM=M+1 // 8524
A=A-1 // 8525
M=D // 8526
@15 // 8527
D=A // 8528
@SP // 8529
AM=M+1 // 8530
A=A-1 // 8531
M=D // 8532
@27 // 8533
D=A // 8534
@SP // 8535
AM=M+1 // 8536
A=A-1 // 8537
M=D // 8538
@51 // 8539
D=A // 8540
@SP // 8541
AM=M+1 // 8542
A=A-1 // 8543
M=D // 8544
@51 // 8545
D=A // 8546
@SP // 8547
AM=M+1 // 8548
A=A-1 // 8549
M=D // 8550
@51 // 8551
D=A // 8552
@SP // 8553
AM=M+1 // 8554
A=A-1 // 8555
M=D // 8556
@51 // 8557
D=A // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=D // 8562
@51 // 8563
D=A // 8564
@SP // 8565
AM=M+1 // 8566
A=A-1 // 8567
M=D // 8568
@27 // 8569
D=A // 8570
@SP // 8571
AM=M+1 // 8572
A=A-1 // 8573
M=D // 8574
@15 // 8575
D=A // 8576
@SP // 8577
AM=M+1 // 8578
A=A-1 // 8579
M=D // 8580
@SP // 8581
AM=M+1 // 8582
A=A-1 // 8583
M=0 // 8584
@SP // 8585
AM=M+1 // 8586
A=A-1 // 8587
M=0 // 8588
// call Output.create
@17 // 8589
D=A // 8590
@14 // 8591
M=D // 8592
@Output.create // 8593
D=A // 8594
@13 // 8595
M=D // 8596
@Output.init.ret.38 // 8597
D=A // 8598
@CALL // 8599
0;JMP // 8600
(Output.init.ret.38)
@SP // 8601
M=M-1 // 8602

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8603
D=A // 8604
@SP // 8605
AM=M+1 // 8606
A=A-1 // 8607
M=D // 8608
@63 // 8609
D=A // 8610
@SP // 8611
AM=M+1 // 8612
A=A-1 // 8613
M=D // 8614
@51 // 8615
D=A // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=D // 8620
@35 // 8621
D=A // 8622
@SP // 8623
AM=M+1 // 8624
A=A-1 // 8625
M=D // 8626
@11 // 8627
D=A // 8628
@SP // 8629
AM=M+1 // 8630
A=A-1 // 8631
M=D // 8632
@15 // 8633
D=A // 8634
@SP // 8635
AM=M+1 // 8636
A=A-1 // 8637
M=D // 8638
@11 // 8639
D=A // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=D // 8644
@35 // 8645
D=A // 8646
@SP // 8647
AM=M+1 // 8648
A=A-1 // 8649
M=D // 8650
@51 // 8651
D=A // 8652
@SP // 8653
AM=M+1 // 8654
A=A-1 // 8655
M=D // 8656
@63 // 8657
D=A // 8658
@SP // 8659
AM=M+1 // 8660
A=A-1 // 8661
M=D // 8662
@SP // 8663
AM=M+1 // 8664
A=A-1 // 8665
M=0 // 8666
@SP // 8667
AM=M+1 // 8668
A=A-1 // 8669
M=0 // 8670
// call Output.create
@17 // 8671
D=A // 8672
@14 // 8673
M=D // 8674
@Output.create // 8675
D=A // 8676
@13 // 8677
M=D // 8678
@Output.init.ret.39 // 8679
D=A // 8680
@CALL // 8681
0;JMP // 8682
(Output.init.ret.39)
@SP // 8683
M=M-1 // 8684

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8685
D=A // 8686
@SP // 8687
AM=M+1 // 8688
A=A-1 // 8689
M=D // 8690
@63 // 8691
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
@35 // 8703
D=A // 8704
@SP // 8705
AM=M+1 // 8706
A=A-1 // 8707
M=D // 8708
@11 // 8709
D=A // 8710
@SP // 8711
AM=M+1 // 8712
A=A-1 // 8713
M=D // 8714
@15 // 8715
D=A // 8716
@SP // 8717
AM=M+1 // 8718
A=A-1 // 8719
M=D // 8720
@11 // 8721
D=A // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=D // 8726
@3 // 8727
D=A // 8728
@SP // 8729
AM=M+1 // 8730
A=A-1 // 8731
M=D // 8732
@3 // 8733
D=A // 8734
@SP // 8735
AM=M+1 // 8736
A=A-1 // 8737
M=D // 8738
@3 // 8739
D=A // 8740
@SP // 8741
AM=M+1 // 8742
A=A-1 // 8743
M=D // 8744
@SP // 8745
AM=M+1 // 8746
A=A-1 // 8747
M=0 // 8748
@SP // 8749
AM=M+1 // 8750
A=A-1 // 8751
M=0 // 8752
// call Output.create
@17 // 8753
D=A // 8754
@14 // 8755
M=D // 8756
@Output.create // 8757
D=A // 8758
@13 // 8759
M=D // 8760
@Output.init.ret.40 // 8761
D=A // 8762
@CALL // 8763
0;JMP // 8764
(Output.init.ret.40)
@SP // 8765
M=M-1 // 8766

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8767
D=A // 8768
@SP // 8769
AM=M+1 // 8770
A=A-1 // 8771
M=D // 8772
@28 // 8773
D=A // 8774
@SP // 8775
AM=M+1 // 8776
A=A-1 // 8777
M=D // 8778
@54 // 8779
D=A // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=D // 8784
@35 // 8785
D=A // 8786
@SP // 8787
AM=M+1 // 8788
A=A-1 // 8789
M=D // 8790
@3 // 8791
D=A // 8792
@SP // 8793
AM=M+1 // 8794
A=A-1 // 8795
M=D // 8796
@59 // 8797
D=A // 8798
@SP // 8799
AM=M+1 // 8800
A=A-1 // 8801
M=D // 8802
@51 // 8803
D=A // 8804
@SP // 8805
AM=M+1 // 8806
A=A-1 // 8807
M=D // 8808
@51 // 8809
D=A // 8810
@SP // 8811
AM=M+1 // 8812
A=A-1 // 8813
M=D // 8814
@54 // 8815
D=A // 8816
@SP // 8817
AM=M+1 // 8818
A=A-1 // 8819
M=D // 8820
@44 // 8821
D=A // 8822
@SP // 8823
AM=M+1 // 8824
A=A-1 // 8825
M=D // 8826
@SP // 8827
AM=M+1 // 8828
A=A-1 // 8829
M=0 // 8830
@SP // 8831
AM=M+1 // 8832
A=A-1 // 8833
M=0 // 8834
// call Output.create
@17 // 8835
D=A // 8836
@14 // 8837
M=D // 8838
@Output.create // 8839
D=A // 8840
@13 // 8841
M=D // 8842
@Output.init.ret.41 // 8843
D=A // 8844
@CALL // 8845
0;JMP // 8846
(Output.init.ret.41)
@SP // 8847
M=M-1 // 8848

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8849
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
@51 // 8861
D=A // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=D // 8866
@51 // 8867
D=A // 8868
@SP // 8869
AM=M+1 // 8870
A=A-1 // 8871
M=D // 8872
@51 // 8873
D=A // 8874
@SP // 8875
AM=M+1 // 8876
A=A-1 // 8877
M=D // 8878
@63 // 8879
D=A // 8880
@SP // 8881
AM=M+1 // 8882
A=A-1 // 8883
M=D // 8884
@51 // 8885
D=A // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=D // 8890
@51 // 8891
D=A // 8892
@SP // 8893
AM=M+1 // 8894
A=A-1 // 8895
M=D // 8896
@51 // 8897
D=A // 8898
@SP // 8899
AM=M+1 // 8900
A=A-1 // 8901
M=D // 8902
@51 // 8903
D=A // 8904
@SP // 8905
AM=M+1 // 8906
A=A-1 // 8907
M=D // 8908
@SP // 8909
AM=M+1 // 8910
A=A-1 // 8911
M=0 // 8912
@SP // 8913
AM=M+1 // 8914
A=A-1 // 8915
M=0 // 8916
// call Output.create
@17 // 8917
D=A // 8918
@14 // 8919
M=D // 8920
@Output.create // 8921
D=A // 8922
@13 // 8923
M=D // 8924
@Output.init.ret.42 // 8925
D=A // 8926
@CALL // 8927
0;JMP // 8928
(Output.init.ret.42)
@SP // 8929
M=M-1 // 8930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8931
D=A // 8932
@SP // 8933
AM=M+1 // 8934
A=A-1 // 8935
M=D // 8936
@30 // 8937
D=A // 8938
@SP // 8939
AM=M+1 // 8940
A=A-1 // 8941
M=D // 8942
@12 // 8943
D=A // 8944
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=D // 8948
@12 // 8949
D=A // 8950
@SP // 8951
AM=M+1 // 8952
A=A-1 // 8953
M=D // 8954
@12 // 8955
D=A // 8956
@SP // 8957
AM=M+1 // 8958
A=A-1 // 8959
M=D // 8960
@12 // 8961
D=A // 8962
@SP // 8963
AM=M+1 // 8964
A=A-1 // 8965
M=D // 8966
@12 // 8967
D=A // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=D // 8972
@12 // 8973
D=A // 8974
@SP // 8975
AM=M+1 // 8976
A=A-1 // 8977
M=D // 8978
@12 // 8979
D=A // 8980
@SP // 8981
AM=M+1 // 8982
A=A-1 // 8983
M=D // 8984
@30 // 8985
D=A // 8986
@SP // 8987
AM=M+1 // 8988
A=A-1 // 8989
M=D // 8990
@SP // 8991
AM=M+1 // 8992
A=A-1 // 8993
M=0 // 8994
@SP // 8995
AM=M+1 // 8996
A=A-1 // 8997
M=0 // 8998
// call Output.create
@17 // 8999
D=A // 9000
@14 // 9001
M=D // 9002
@Output.create // 9003
D=A // 9004
@13 // 9005
M=D // 9006
@Output.init.ret.43 // 9007
D=A // 9008
@CALL // 9009
0;JMP // 9010
(Output.init.ret.43)
@SP // 9011
M=M-1 // 9012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 9013
D=A // 9014
@SP // 9015
AM=M+1 // 9016
A=A-1 // 9017
M=D // 9018
@60 // 9019
D=A // 9020
@SP // 9021
AM=M+1 // 9022
A=A-1 // 9023
M=D // 9024
@24 // 9025
D=A // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=D // 9030
@24 // 9031
D=A // 9032
@SP // 9033
AM=M+1 // 9034
A=A-1 // 9035
M=D // 9036
@24 // 9037
D=A // 9038
@SP // 9039
AM=M+1 // 9040
A=A-1 // 9041
M=D // 9042
@24 // 9043
D=A // 9044
@SP // 9045
AM=M+1 // 9046
A=A-1 // 9047
M=D // 9048
@24 // 9049
D=A // 9050
@SP // 9051
AM=M+1 // 9052
A=A-1 // 9053
M=D // 9054
@27 // 9055
D=A // 9056
@SP // 9057
AM=M+1 // 9058
A=A-1 // 9059
M=D // 9060
@27 // 9061
D=A // 9062
@SP // 9063
AM=M+1 // 9064
A=A-1 // 9065
M=D // 9066
@14 // 9067
D=A // 9068
@SP // 9069
AM=M+1 // 9070
A=A-1 // 9071
M=D // 9072
@SP // 9073
AM=M+1 // 9074
A=A-1 // 9075
M=0 // 9076
@SP // 9077
AM=M+1 // 9078
A=A-1 // 9079
M=0 // 9080
// call Output.create
@17 // 9081
D=A // 9082
@14 // 9083
M=D // 9084
@Output.create // 9085
D=A // 9086
@13 // 9087
M=D // 9088
@Output.init.ret.44 // 9089
D=A // 9090
@CALL // 9091
0;JMP // 9092
(Output.init.ret.44)
@SP // 9093
M=M-1 // 9094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9095
D=A // 9096
@SP // 9097
AM=M+1 // 9098
A=A-1 // 9099
M=D // 9100
@51 // 9101
D=A // 9102
@SP // 9103
AM=M+1 // 9104
A=A-1 // 9105
M=D // 9106
@51 // 9107
D=A // 9108
@SP // 9109
AM=M+1 // 9110
A=A-1 // 9111
M=D // 9112
@51 // 9113
D=A // 9114
@SP // 9115
AM=M+1 // 9116
A=A-1 // 9117
M=D // 9118
@27 // 9119
D=A // 9120
@SP // 9121
AM=M+1 // 9122
A=A-1 // 9123
M=D // 9124
@15 // 9125
D=A // 9126
@SP // 9127
AM=M+1 // 9128
A=A-1 // 9129
M=D // 9130
@27 // 9131
D=A // 9132
@SP // 9133
AM=M+1 // 9134
A=A-1 // 9135
M=D // 9136
@51 // 9137
D=A // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=D // 9142
@51 // 9143
D=A // 9144
@SP // 9145
AM=M+1 // 9146
A=A-1 // 9147
M=D // 9148
@51 // 9149
D=A // 9150
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=D // 9154
@SP // 9155
AM=M+1 // 9156
A=A-1 // 9157
M=0 // 9158
@SP // 9159
AM=M+1 // 9160
A=A-1 // 9161
M=0 // 9162
// call Output.create
@17 // 9163
D=A // 9164
@14 // 9165
M=D // 9166
@Output.create // 9167
D=A // 9168
@13 // 9169
M=D // 9170
@Output.init.ret.45 // 9171
D=A // 9172
@CALL // 9173
0;JMP // 9174
(Output.init.ret.45)
@SP // 9175
M=M-1 // 9176

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9177
D=A // 9178
@SP // 9179
AM=M+1 // 9180
A=A-1 // 9181
M=D // 9182
@3 // 9183
D=A // 9184
@SP // 9185
AM=M+1 // 9186
A=A-1 // 9187
M=D // 9188
@3 // 9189
D=A // 9190
@SP // 9191
AM=M+1 // 9192
A=A-1 // 9193
M=D // 9194
@3 // 9195
D=A // 9196
@SP // 9197
AM=M+1 // 9198
A=A-1 // 9199
M=D // 9200
@3 // 9201
D=A // 9202
@SP // 9203
AM=M+1 // 9204
A=A-1 // 9205
M=D // 9206
@3 // 9207
D=A // 9208
@SP // 9209
AM=M+1 // 9210
A=A-1 // 9211
M=D // 9212
@3 // 9213
D=A // 9214
@SP // 9215
AM=M+1 // 9216
A=A-1 // 9217
M=D // 9218
@35 // 9219
D=A // 9220
@SP // 9221
AM=M+1 // 9222
A=A-1 // 9223
M=D // 9224
@51 // 9225
D=A // 9226
@SP // 9227
AM=M+1 // 9228
A=A-1 // 9229
M=D // 9230
@63 // 9231
D=A // 9232
@SP // 9233
AM=M+1 // 9234
A=A-1 // 9235
M=D // 9236
@SP // 9237
AM=M+1 // 9238
A=A-1 // 9239
M=0 // 9240
@SP // 9241
AM=M+1 // 9242
A=A-1 // 9243
M=0 // 9244
// call Output.create
@17 // 9245
D=A // 9246
@14 // 9247
M=D // 9248
@Output.create // 9249
D=A // 9250
@13 // 9251
M=D // 9252
@Output.init.ret.46 // 9253
D=A // 9254
@CALL // 9255
0;JMP // 9256
(Output.init.ret.46)
@SP // 9257
M=M-1 // 9258

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9259
D=A // 9260
@SP // 9261
AM=M+1 // 9262
A=A-1 // 9263
M=D // 9264
@33 // 9265
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
@63 // 9283
D=A // 9284
@SP // 9285
AM=M+1 // 9286
A=A-1 // 9287
M=D // 9288
@51 // 9289
D=A // 9290
@SP // 9291
AM=M+1 // 9292
A=A-1 // 9293
M=D // 9294
@51 // 9295
D=A // 9296
@SP // 9297
AM=M+1 // 9298
A=A-1 // 9299
M=D // 9300
@51 // 9301
D=A // 9302
@SP // 9303
AM=M+1 // 9304
A=A-1 // 9305
M=D // 9306
@51 // 9307
D=A // 9308
@SP // 9309
AM=M+1 // 9310
A=A-1 // 9311
M=D // 9312
@51 // 9313
D=A // 9314
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=D // 9318
@SP // 9319
AM=M+1 // 9320
A=A-1 // 9321
M=0 // 9322
@SP // 9323
AM=M+1 // 9324
A=A-1 // 9325
M=0 // 9326
// call Output.create
@17 // 9327
D=A // 9328
@14 // 9329
M=D // 9330
@Output.create // 9331
D=A // 9332
@13 // 9333
M=D // 9334
@Output.init.ret.47 // 9335
D=A // 9336
@CALL // 9337
0;JMP // 9338
(Output.init.ret.47)
@SP // 9339
M=M-1 // 9340

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9341
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
@55 // 9359
D=A // 9360
@SP // 9361
AM=M+1 // 9362
A=A-1 // 9363
M=D // 9364
@55 // 9365
D=A // 9366
@SP // 9367
AM=M+1 // 9368
A=A-1 // 9369
M=D // 9370
@63 // 9371
D=A // 9372
@SP // 9373
AM=M+1 // 9374
A=A-1 // 9375
M=D // 9376
@59 // 9377
D=A // 9378
@SP // 9379
AM=M+1 // 9380
A=A-1 // 9381
M=D // 9382
@59 // 9383
D=A // 9384
@SP // 9385
AM=M+1 // 9386
A=A-1 // 9387
M=D // 9388
@51 // 9389
D=A // 9390
@SP // 9391
AM=M+1 // 9392
A=A-1 // 9393
M=D // 9394
@51 // 9395
D=A // 9396
@SP // 9397
AM=M+1 // 9398
A=A-1 // 9399
M=D // 9400
@SP // 9401
AM=M+1 // 9402
A=A-1 // 9403
M=0 // 9404
@SP // 9405
AM=M+1 // 9406
A=A-1 // 9407
M=0 // 9408
// call Output.create
@17 // 9409
D=A // 9410
@14 // 9411
M=D // 9412
@Output.create // 9413
D=A // 9414
@13 // 9415
M=D // 9416
@Output.init.ret.48 // 9417
D=A // 9418
@CALL // 9419
0;JMP // 9420
(Output.init.ret.48)
@SP // 9421
M=M-1 // 9422

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9423
D=A // 9424
@SP // 9425
AM=M+1 // 9426
A=A-1 // 9427
M=D // 9428
@30 // 9429
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
@51 // 9447
D=A // 9448
@SP // 9449
AM=M+1 // 9450
A=A-1 // 9451
M=D // 9452
@51 // 9453
D=A // 9454
@SP // 9455
AM=M+1 // 9456
A=A-1 // 9457
M=D // 9458
@51 // 9459
D=A // 9460
@SP // 9461
AM=M+1 // 9462
A=A-1 // 9463
M=D // 9464
@51 // 9465
D=A // 9466
@SP // 9467
AM=M+1 // 9468
A=A-1 // 9469
M=D // 9470
@51 // 9471
D=A // 9472
@SP // 9473
AM=M+1 // 9474
A=A-1 // 9475
M=D // 9476
@30 // 9477
D=A // 9478
@SP // 9479
AM=M+1 // 9480
A=A-1 // 9481
M=D // 9482
@SP // 9483
AM=M+1 // 9484
A=A-1 // 9485
M=0 // 9486
@SP // 9487
AM=M+1 // 9488
A=A-1 // 9489
M=0 // 9490
// call Output.create
@17 // 9491
D=A // 9492
@14 // 9493
M=D // 9494
@Output.create // 9495
D=A // 9496
@13 // 9497
M=D // 9498
@Output.init.ret.49 // 9499
D=A // 9500
@CALL // 9501
0;JMP // 9502
(Output.init.ret.49)
@SP // 9503
M=M-1 // 9504

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9505
D=A // 9506
@SP // 9507
AM=M+1 // 9508
A=A-1 // 9509
M=D // 9510
@31 // 9511
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
@51 // 9523
D=A // 9524
@SP // 9525
AM=M+1 // 9526
A=A-1 // 9527
M=D // 9528
@51 // 9529
D=A // 9530
@SP // 9531
AM=M+1 // 9532
A=A-1 // 9533
M=D // 9534
@31 // 9535
D=A // 9536
@SP // 9537
AM=M+1 // 9538
A=A-1 // 9539
M=D // 9540
@3 // 9541
D=A // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=D // 9546
@3 // 9547
D=A // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=D // 9552
@3 // 9553
D=A // 9554
@SP // 9555
AM=M+1 // 9556
A=A-1 // 9557
M=D // 9558
@3 // 9559
D=A // 9560
@SP // 9561
AM=M+1 // 9562
A=A-1 // 9563
M=D // 9564
@SP // 9565
AM=M+1 // 9566
A=A-1 // 9567
M=0 // 9568
@SP // 9569
AM=M+1 // 9570
A=A-1 // 9571
M=0 // 9572
// call Output.create
@17 // 9573
D=A // 9574
@14 // 9575
M=D // 9576
@Output.create // 9577
D=A // 9578
@13 // 9579
M=D // 9580
@Output.init.ret.50 // 9581
D=A // 9582
@CALL // 9583
0;JMP // 9584
(Output.init.ret.50)
@SP // 9585
M=M-1 // 9586

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9587
D=A // 9588
@SP // 9589
AM=M+1 // 9590
A=A-1 // 9591
M=D // 9592
@30 // 9593
D=A // 9594
@SP // 9595
AM=M+1 // 9596
A=A-1 // 9597
M=D // 9598
@51 // 9599
D=A // 9600
@SP // 9601
AM=M+1 // 9602
A=A-1 // 9603
M=D // 9604
@51 // 9605
D=A // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=D // 9610
@51 // 9611
D=A // 9612
@SP // 9613
AM=M+1 // 9614
A=A-1 // 9615
M=D // 9616
@51 // 9617
D=A // 9618
@SP // 9619
AM=M+1 // 9620
A=A-1 // 9621
M=D // 9622
@51 // 9623
D=A // 9624
@SP // 9625
AM=M+1 // 9626
A=A-1 // 9627
M=D // 9628
@63 // 9629
D=A // 9630
@SP // 9631
AM=M+1 // 9632
A=A-1 // 9633
M=D // 9634
@59 // 9635
D=A // 9636
@SP // 9637
AM=M+1 // 9638
A=A-1 // 9639
M=D // 9640
@30 // 9641
D=A // 9642
@SP // 9643
AM=M+1 // 9644
A=A-1 // 9645
M=D // 9646
@48 // 9647
D=A // 9648
@SP // 9649
AM=M+1 // 9650
A=A-1 // 9651
M=D // 9652
@SP // 9653
AM=M+1 // 9654
A=A-1 // 9655
M=0 // 9656
// call Output.create
@17 // 9657
D=A // 9658
@14 // 9659
M=D // 9660
@Output.create // 9661
D=A // 9662
@13 // 9663
M=D // 9664
@Output.init.ret.51 // 9665
D=A // 9666
@CALL // 9667
0;JMP // 9668
(Output.init.ret.51)
@SP // 9669
M=M-1 // 9670

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9671
D=A // 9672
@SP // 9673
AM=M+1 // 9674
A=A-1 // 9675
M=D // 9676
@31 // 9677
D=A // 9678
@SP // 9679
AM=M+1 // 9680
A=A-1 // 9681
M=D // 9682
@51 // 9683
D=A // 9684
@SP // 9685
AM=M+1 // 9686
A=A-1 // 9687
M=D // 9688
@51 // 9689
D=A // 9690
@SP // 9691
AM=M+1 // 9692
A=A-1 // 9693
M=D // 9694
@51 // 9695
D=A // 9696
@SP // 9697
AM=M+1 // 9698
A=A-1 // 9699
M=D // 9700
@31 // 9701
D=A // 9702
@SP // 9703
AM=M+1 // 9704
A=A-1 // 9705
M=D // 9706
@27 // 9707
D=A // 9708
@SP // 9709
AM=M+1 // 9710
A=A-1 // 9711
M=D // 9712
@51 // 9713
D=A // 9714
@SP // 9715
AM=M+1 // 9716
A=A-1 // 9717
M=D // 9718
@51 // 9719
D=A // 9720
@SP // 9721
AM=M+1 // 9722
A=A-1 // 9723
M=D // 9724
@51 // 9725
D=A // 9726
@SP // 9727
AM=M+1 // 9728
A=A-1 // 9729
M=D // 9730
@SP // 9731
AM=M+1 // 9732
A=A-1 // 9733
M=0 // 9734
@SP // 9735
AM=M+1 // 9736
A=A-1 // 9737
M=0 // 9738
// call Output.create
@17 // 9739
D=A // 9740
@14 // 9741
M=D // 9742
@Output.create // 9743
D=A // 9744
@13 // 9745
M=D // 9746
@Output.init.ret.52 // 9747
D=A // 9748
@CALL // 9749
0;JMP // 9750
(Output.init.ret.52)
@SP // 9751
M=M-1 // 9752

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9753
D=A // 9754
@SP // 9755
AM=M+1 // 9756
A=A-1 // 9757
M=D // 9758
@30 // 9759
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
@6 // 9777
D=A // 9778
@SP // 9779
AM=M+1 // 9780
A=A-1 // 9781
M=D // 9782
@28 // 9783
D=A // 9784
@SP // 9785
AM=M+1 // 9786
A=A-1 // 9787
M=D // 9788
@48 // 9789
D=A // 9790
@SP // 9791
AM=M+1 // 9792
A=A-1 // 9793
M=D // 9794
@51 // 9795
D=A // 9796
@SP // 9797
AM=M+1 // 9798
A=A-1 // 9799
M=D // 9800
@51 // 9801
D=A // 9802
@SP // 9803
AM=M+1 // 9804
A=A-1 // 9805
M=D // 9806
@30 // 9807
D=A // 9808
@SP // 9809
AM=M+1 // 9810
A=A-1 // 9811
M=D // 9812
@SP // 9813
AM=M+1 // 9814
A=A-1 // 9815
M=0 // 9816
@SP // 9817
AM=M+1 // 9818
A=A-1 // 9819
M=0 // 9820
// call Output.create
@17 // 9821
D=A // 9822
@14 // 9823
M=D // 9824
@Output.create // 9825
D=A // 9826
@13 // 9827
M=D // 9828
@Output.init.ret.53 // 9829
D=A // 9830
@CALL // 9831
0;JMP // 9832
(Output.init.ret.53)
@SP // 9833
M=M-1 // 9834

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9835
D=A // 9836
@SP // 9837
AM=M+1 // 9838
A=A-1 // 9839
M=D // 9840
@63 // 9841
D=A // 9842
@SP // 9843
AM=M+1 // 9844
A=A-1 // 9845
M=D // 9846
@63 // 9847
D=A // 9848
@SP // 9849
AM=M+1 // 9850
A=A-1 // 9851
M=D // 9852
@45 // 9853
D=A // 9854
@SP // 9855
AM=M+1 // 9856
A=A-1 // 9857
M=D // 9858
@12 // 9859
D=A // 9860
@SP // 9861
AM=M+1 // 9862
A=A-1 // 9863
M=D // 9864
@12 // 9865
D=A // 9866
@SP // 9867
AM=M+1 // 9868
A=A-1 // 9869
M=D // 9870
@12 // 9871
D=A // 9872
@SP // 9873
AM=M+1 // 9874
A=A-1 // 9875
M=D // 9876
@12 // 9877
D=A // 9878
@SP // 9879
AM=M+1 // 9880
A=A-1 // 9881
M=D // 9882
@12 // 9883
D=A // 9884
@SP // 9885
AM=M+1 // 9886
A=A-1 // 9887
M=D // 9888
@30 // 9889
D=A // 9890
@SP // 9891
AM=M+1 // 9892
A=A-1 // 9893
M=D // 9894
@SP // 9895
AM=M+1 // 9896
A=A-1 // 9897
M=0 // 9898
@SP // 9899
AM=M+1 // 9900
A=A-1 // 9901
M=0 // 9902
// call Output.create
@17 // 9903
D=A // 9904
@14 // 9905
M=D // 9906
@Output.create // 9907
D=A // 9908
@13 // 9909
M=D // 9910
@Output.init.ret.54 // 9911
D=A // 9912
@CALL // 9913
0;JMP // 9914
(Output.init.ret.54)
@SP // 9915
M=M-1 // 9916

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9917
D=A // 9918
@SP // 9919
AM=M+1 // 9920
A=A-1 // 9921
M=D // 9922
@51 // 9923
D=A // 9924
@SP // 9925
AM=M+1 // 9926
A=A-1 // 9927
M=D // 9928
@51 // 9929
D=A // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=D // 9934
@51 // 9935
D=A // 9936
@SP // 9937
AM=M+1 // 9938
A=A-1 // 9939
M=D // 9940
@51 // 9941
D=A // 9942
@SP // 9943
AM=M+1 // 9944
A=A-1 // 9945
M=D // 9946
@51 // 9947
D=A // 9948
@SP // 9949
AM=M+1 // 9950
A=A-1 // 9951
M=D // 9952
@51 // 9953
D=A // 9954
@SP // 9955
AM=M+1 // 9956
A=A-1 // 9957
M=D // 9958
@51 // 9959
D=A // 9960
@SP // 9961
AM=M+1 // 9962
A=A-1 // 9963
M=D // 9964
@51 // 9965
D=A // 9966
@SP // 9967
AM=M+1 // 9968
A=A-1 // 9969
M=D // 9970
@30 // 9971
D=A // 9972
@SP // 9973
AM=M+1 // 9974
A=A-1 // 9975
M=D // 9976
@SP // 9977
AM=M+1 // 9978
A=A-1 // 9979
M=0 // 9980
@SP // 9981
AM=M+1 // 9982
A=A-1 // 9983
M=0 // 9984
// call Output.create
@17 // 9985
D=A // 9986
@14 // 9987
M=D // 9988
@Output.create // 9989
D=A // 9990
@13 // 9991
M=D // 9992
@Output.init.ret.55 // 9993
D=A // 9994
@CALL // 9995
0;JMP // 9996
(Output.init.ret.55)
@SP // 9997
M=M-1 // 9998

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9999
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
@51 // 10017
D=A // 10018
@SP // 10019
AM=M+1 // 10020
A=A-1 // 10021
M=D // 10022
@51 // 10023
D=A // 10024
@SP // 10025
AM=M+1 // 10026
A=A-1 // 10027
M=D // 10028
@51 // 10029
D=A // 10030
@SP // 10031
AM=M+1 // 10032
A=A-1 // 10033
M=D // 10034
@30 // 10035
D=A // 10036
@SP // 10037
AM=M+1 // 10038
A=A-1 // 10039
M=D // 10040
@30 // 10041
D=A // 10042
@SP // 10043
AM=M+1 // 10044
A=A-1 // 10045
M=D // 10046
@12 // 10047
D=A // 10048
@SP // 10049
AM=M+1 // 10050
A=A-1 // 10051
M=D // 10052
@12 // 10053
D=A // 10054
@SP // 10055
AM=M+1 // 10056
A=A-1 // 10057
M=D // 10058
@SP // 10059
AM=M+1 // 10060
A=A-1 // 10061
M=0 // 10062
@SP // 10063
AM=M+1 // 10064
A=A-1 // 10065
M=0 // 10066
// call Output.create
@17 // 10067
D=A // 10068
@14 // 10069
M=D // 10070
@Output.create // 10071
D=A // 10072
@13 // 10073
M=D // 10074
@Output.init.ret.56 // 10075
D=A // 10076
@CALL // 10077
0;JMP // 10078
(Output.init.ret.56)
@SP // 10079
M=M-1 // 10080

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10081
D=A // 10082
@SP // 10083
AM=M+1 // 10084
A=A-1 // 10085
M=D // 10086
@51 // 10087
D=A // 10088
@SP // 10089
AM=M+1 // 10090
A=A-1 // 10091
M=D // 10092
@51 // 10093
D=A // 10094
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=D // 10098
@51 // 10099
D=A // 10100
@SP // 10101
AM=M+1 // 10102
A=A-1 // 10103
M=D // 10104
@51 // 10105
D=A // 10106
@SP // 10107
AM=M+1 // 10108
A=A-1 // 10109
M=D // 10110
@51 // 10111
D=A // 10112
@SP // 10113
AM=M+1 // 10114
A=A-1 // 10115
M=D // 10116
@63 // 10117
D=A // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=D // 10122
@63 // 10123
D=A // 10124
@SP // 10125
AM=M+1 // 10126
A=A-1 // 10127
M=D // 10128
@63 // 10129
D=A // 10130
@SP // 10131
AM=M+1 // 10132
A=A-1 // 10133
M=D // 10134
@18 // 10135
D=A // 10136
@SP // 10137
AM=M+1 // 10138
A=A-1 // 10139
M=D // 10140
@SP // 10141
AM=M+1 // 10142
A=A-1 // 10143
M=0 // 10144
@SP // 10145
AM=M+1 // 10146
A=A-1 // 10147
M=0 // 10148
// call Output.create
@17 // 10149
D=A // 10150
@14 // 10151
M=D // 10152
@Output.create // 10153
D=A // 10154
@13 // 10155
M=D // 10156
@Output.init.ret.57 // 10157
D=A // 10158
@CALL // 10159
0;JMP // 10160
(Output.init.ret.57)
@SP // 10161
M=M-1 // 10162

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10163
D=A // 10164
@SP // 10165
AM=M+1 // 10166
A=A-1 // 10167
M=D // 10168
@51 // 10169
D=A // 10170
@SP // 10171
AM=M+1 // 10172
A=A-1 // 10173
M=D // 10174
@51 // 10175
D=A // 10176
@SP // 10177
AM=M+1 // 10178
A=A-1 // 10179
M=D // 10180
@30 // 10181
D=A // 10182
@SP // 10183
AM=M+1 // 10184
A=A-1 // 10185
M=D // 10186
@30 // 10187
D=A // 10188
@SP // 10189
AM=M+1 // 10190
A=A-1 // 10191
M=D // 10192
@12 // 10193
D=A // 10194
@SP // 10195
AM=M+1 // 10196
A=A-1 // 10197
M=D // 10198
@30 // 10199
D=A // 10200
@SP // 10201
AM=M+1 // 10202
A=A-1 // 10203
M=D // 10204
@30 // 10205
D=A // 10206
@SP // 10207
AM=M+1 // 10208
A=A-1 // 10209
M=D // 10210
@51 // 10211
D=A // 10212
@SP // 10213
AM=M+1 // 10214
A=A-1 // 10215
M=D // 10216
@51 // 10217
D=A // 10218
@SP // 10219
AM=M+1 // 10220
A=A-1 // 10221
M=D // 10222
@SP // 10223
AM=M+1 // 10224
A=A-1 // 10225
M=0 // 10226
@SP // 10227
AM=M+1 // 10228
A=A-1 // 10229
M=0 // 10230
// call Output.create
@17 // 10231
D=A // 10232
@14 // 10233
M=D // 10234
@Output.create // 10235
D=A // 10236
@13 // 10237
M=D // 10238
@Output.init.ret.58 // 10239
D=A // 10240
@CALL // 10241
0;JMP // 10242
(Output.init.ret.58)
@SP // 10243
M=M-1 // 10244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10245
D=A // 10246
@SP // 10247
AM=M+1 // 10248
A=A-1 // 10249
M=D // 10250
@51 // 10251
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
@51 // 10269
D=A // 10270
@SP // 10271
AM=M+1 // 10272
A=A-1 // 10273
M=D // 10274
@30 // 10275
D=A // 10276
@SP // 10277
AM=M+1 // 10278
A=A-1 // 10279
M=D // 10280
@12 // 10281
D=A // 10282
@SP // 10283
AM=M+1 // 10284
A=A-1 // 10285
M=D // 10286
@12 // 10287
D=A // 10288
@SP // 10289
AM=M+1 // 10290
A=A-1 // 10291
M=D // 10292
@12 // 10293
D=A // 10294
@SP // 10295
AM=M+1 // 10296
A=A-1 // 10297
M=D // 10298
@30 // 10299
D=A // 10300
@SP // 10301
AM=M+1 // 10302
A=A-1 // 10303
M=D // 10304
@SP // 10305
AM=M+1 // 10306
A=A-1 // 10307
M=0 // 10308
@SP // 10309
AM=M+1 // 10310
A=A-1 // 10311
M=0 // 10312
// call Output.create
@17 // 10313
D=A // 10314
@14 // 10315
M=D // 10316
@Output.create // 10317
D=A // 10318
@13 // 10319
M=D // 10320
@Output.init.ret.59 // 10321
D=A // 10322
@CALL // 10323
0;JMP // 10324
(Output.init.ret.59)
@SP // 10325
M=M-1 // 10326

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10327
D=A // 10328
@SP // 10329
AM=M+1 // 10330
A=A-1 // 10331
M=D // 10332
@63 // 10333
D=A // 10334
@SP // 10335
AM=M+1 // 10336
A=A-1 // 10337
M=D // 10338
@51 // 10339
D=A // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=D // 10344
@49 // 10345
D=A // 10346
@SP // 10347
AM=M+1 // 10348
A=A-1 // 10349
M=D // 10350
@24 // 10351
D=A // 10352
@SP // 10353
AM=M+1 // 10354
A=A-1 // 10355
M=D // 10356
@12 // 10357
D=A // 10358
@SP // 10359
AM=M+1 // 10360
A=A-1 // 10361
M=D // 10362
@6 // 10363
D=A // 10364
@SP // 10365
AM=M+1 // 10366
A=A-1 // 10367
M=D // 10368
@35 // 10369
D=A // 10370
@SP // 10371
AM=M+1 // 10372
A=A-1 // 10373
M=D // 10374
@51 // 10375
D=A // 10376
@SP // 10377
AM=M+1 // 10378
A=A-1 // 10379
M=D // 10380
@63 // 10381
D=A // 10382
@SP // 10383
AM=M+1 // 10384
A=A-1 // 10385
M=D // 10386
@SP // 10387
AM=M+1 // 10388
A=A-1 // 10389
M=0 // 10390
@SP // 10391
AM=M+1 // 10392
A=A-1 // 10393
M=0 // 10394
// call Output.create
@17 // 10395
D=A // 10396
@14 // 10397
M=D // 10398
@Output.create // 10399
D=A // 10400
@13 // 10401
M=D // 10402
@Output.init.ret.60 // 10403
D=A // 10404
@CALL // 10405
0;JMP // 10406
(Output.init.ret.60)
@SP // 10407
M=M-1 // 10408

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10409
D=A // 10410
@SP // 10411
AM=M+1 // 10412
A=A-1 // 10413
M=D // 10414
@30 // 10415
D=A // 10416
@SP // 10417
AM=M+1 // 10418
A=A-1 // 10419
M=D // 10420
@6 // 10421
D=A // 10422
@SP // 10423
AM=M+1 // 10424
A=A-1 // 10425
M=D // 10426
@6 // 10427
D=A // 10428
@SP // 10429
AM=M+1 // 10430
A=A-1 // 10431
M=D // 10432
@6 // 10433
D=A // 10434
@SP // 10435
AM=M+1 // 10436
A=A-1 // 10437
M=D // 10438
@6 // 10439
D=A // 10440
@SP // 10441
AM=M+1 // 10442
A=A-1 // 10443
M=D // 10444
@6 // 10445
D=A // 10446
@SP // 10447
AM=M+1 // 10448
A=A-1 // 10449
M=D // 10450
@6 // 10451
D=A // 10452
@SP // 10453
AM=M+1 // 10454
A=A-1 // 10455
M=D // 10456
@6 // 10457
D=A // 10458
@SP // 10459
AM=M+1 // 10460
A=A-1 // 10461
M=D // 10462
@30 // 10463
D=A // 10464
@SP // 10465
AM=M+1 // 10466
A=A-1 // 10467
M=D // 10468
@SP // 10469
AM=M+1 // 10470
A=A-1 // 10471
M=0 // 10472
@SP // 10473
AM=M+1 // 10474
A=A-1 // 10475
M=0 // 10476
// call Output.create
@17 // 10477
D=A // 10478
@14 // 10479
M=D // 10480
@Output.create // 10481
D=A // 10482
@13 // 10483
M=D // 10484
@Output.init.ret.61 // 10485
D=A // 10486
@CALL // 10487
0;JMP // 10488
(Output.init.ret.61)
@SP // 10489
M=M-1 // 10490

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10491
D=A // 10492
@SP // 10493
M=D+M // 10494
@92 // 10495
D=A // 10496
@SP // 10497
A=M-1 // 10498
M=1 // 10499
A=A-1 // 10500
M=0 // 10501
A=A-1 // 10502
M=0 // 10503
A=A-1 // 10504
M=D // 10505
A=A-1 // 10506
@3 // 10507
D=A // 10508
@SP // 10509
AM=M+1 // 10510
A=A-1 // 10511
M=D // 10512
@6 // 10513
D=A // 10514
@SP // 10515
AM=M+1 // 10516
A=A-1 // 10517
M=D // 10518
@12 // 10519
D=A // 10520
@SP // 10521
AM=M+1 // 10522
A=A-1 // 10523
M=D // 10524
@24 // 10525
D=A // 10526
@SP // 10527
AM=M+1 // 10528
A=A-1 // 10529
M=D // 10530
@48 // 10531
D=A // 10532
@SP // 10533
AM=M+1 // 10534
A=A-1 // 10535
M=D // 10536
@32 // 10537
D=A // 10538
@SP // 10539
AM=M+1 // 10540
A=A-1 // 10541
M=D // 10542
@SP // 10543
AM=M+1 // 10544
A=A-1 // 10545
M=0 // 10546
@SP // 10547
AM=M+1 // 10548
A=A-1 // 10549
M=0 // 10550
// call Output.create
@17 // 10551
D=A // 10552
@14 // 10553
M=D // 10554
@Output.create // 10555
D=A // 10556
@13 // 10557
M=D // 10558
@Output.init.ret.62 // 10559
D=A // 10560
@CALL // 10561
0;JMP // 10562
(Output.init.ret.62)
@SP // 10563
M=M-1 // 10564

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10565
D=A // 10566
@SP // 10567
AM=M+1 // 10568
A=A-1 // 10569
M=D // 10570
@30 // 10571
D=A // 10572
@SP // 10573
AM=M+1 // 10574
A=A-1 // 10575
M=D // 10576
@24 // 10577
D=A // 10578
@SP // 10579
AM=M+1 // 10580
A=A-1 // 10581
M=D // 10582
@24 // 10583
D=A // 10584
@SP // 10585
AM=M+1 // 10586
A=A-1 // 10587
M=D // 10588
@24 // 10589
D=A // 10590
@SP // 10591
AM=M+1 // 10592
A=A-1 // 10593
M=D // 10594
@24 // 10595
D=A // 10596
@SP // 10597
AM=M+1 // 10598
A=A-1 // 10599
M=D // 10600
@24 // 10601
D=A // 10602
@SP // 10603
AM=M+1 // 10604
A=A-1 // 10605
M=D // 10606
@24 // 10607
D=A // 10608
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=D // 10612
@24 // 10613
D=A // 10614
@SP // 10615
AM=M+1 // 10616
A=A-1 // 10617
M=D // 10618
@30 // 10619
D=A // 10620
@SP // 10621
AM=M+1 // 10622
A=A-1 // 10623
M=D // 10624
@SP // 10625
AM=M+1 // 10626
A=A-1 // 10627
M=0 // 10628
@SP // 10629
AM=M+1 // 10630
A=A-1 // 10631
M=0 // 10632
// call Output.create
@17 // 10633
D=A // 10634
@14 // 10635
M=D // 10636
@Output.create // 10637
D=A // 10638
@13 // 10639
M=D // 10640
@Output.init.ret.63 // 10641
D=A // 10642
@CALL // 10643
0;JMP // 10644
(Output.init.ret.63)
@SP // 10645
M=M-1 // 10646

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10647
D=A // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=D // 10652
@8 // 10653
D=A // 10654
@SP // 10655
AM=M+1 // 10656
A=A-1 // 10657
M=D // 10658
@28 // 10659
D=A // 10660
@SP // 10661
AM=M+1 // 10662
A=A-1 // 10663
M=D // 10664
@54 // 10665
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
@SP // 10679
AM=M+1 // 10680
A=A-1 // 10681
M=0 // 10682
@SP // 10683
AM=M+1 // 10684
A=A-1 // 10685
M=0 // 10686
@SP // 10687
AM=M+1 // 10688
A=A-1 // 10689
M=0 // 10690
@SP // 10691
AM=M+1 // 10692
A=A-1 // 10693
M=0 // 10694
@SP // 10695
AM=M+1 // 10696
A=A-1 // 10697
M=0 // 10698
@SP // 10699
AM=M+1 // 10700
A=A-1 // 10701
M=0 // 10702
// call Output.create
@17 // 10703
D=A // 10704
@14 // 10705
M=D // 10706
@Output.create // 10707
D=A // 10708
@13 // 10709
M=D // 10710
@Output.init.ret.64 // 10711
D=A // 10712
@CALL // 10713
0;JMP // 10714
(Output.init.ret.64)
@SP // 10715
M=M-1 // 10716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10717
D=A // 10718
@SP // 10719
M=D+M // 10720
@95 // 10721
D=A // 10722
@SP // 10723
A=M-1 // 10724
M=0 // 10725
A=A-1 // 10726
M=0 // 10727
A=A-1 // 10728
M=0 // 10729
A=A-1 // 10730
M=0 // 10731
A=A-1 // 10732
M=0 // 10733
A=A-1 // 10734
M=0 // 10735
A=A-1 // 10736
M=0 // 10737
A=A-1 // 10738
M=0 // 10739
A=A-1 // 10740
M=0 // 10741
A=A-1 // 10742
M=D // 10743
A=A-1 // 10744
@2 // 10745
D=A // 10746
@SP // 10747
M=D+M // 10748
@63 // 10749
D=A // 10750
@SP // 10751
A=M-1 // 10752
M=0 // 10753
A=A-1 // 10754
M=D // 10755
A=A-1 // 10756
// call Output.create
@17 // 10757
D=A // 10758
@14 // 10759
M=D // 10760
@Output.create // 10761
D=A // 10762
@13 // 10763
M=D // 10764
@Output.init.ret.65 // 10765
D=A // 10766
@CALL // 10767
0;JMP // 10768
(Output.init.ret.65)
@SP // 10769
M=M-1 // 10770

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10771
D=A // 10772
@SP // 10773
AM=M+1 // 10774
A=A-1 // 10775
M=D // 10776
@6 // 10777
D=A // 10778
@SP // 10779
AM=M+1 // 10780
A=A-1 // 10781
M=D // 10782
@12 // 10783
D=A // 10784
@SP // 10785
AM=M+1 // 10786
A=A-1 // 10787
M=D // 10788
@24 // 10789
D=A // 10790
@SP // 10791
AM=M+1 // 10792
A=A-1 // 10793
M=D // 10794
@SP // 10795
AM=M+1 // 10796
A=A-1 // 10797
M=0 // 10798
@SP // 10799
AM=M+1 // 10800
A=A-1 // 10801
M=0 // 10802
@SP // 10803
AM=M+1 // 10804
A=A-1 // 10805
M=0 // 10806
@SP // 10807
AM=M+1 // 10808
A=A-1 // 10809
M=0 // 10810
@SP // 10811
AM=M+1 // 10812
A=A-1 // 10813
M=0 // 10814
@SP // 10815
AM=M+1 // 10816
A=A-1 // 10817
M=0 // 10818
@SP // 10819
AM=M+1 // 10820
A=A-1 // 10821
M=0 // 10822
@SP // 10823
AM=M+1 // 10824
A=A-1 // 10825
M=0 // 10826
// call Output.create
@17 // 10827
D=A // 10828
@14 // 10829
M=D // 10830
@Output.create // 10831
D=A // 10832
@13 // 10833
M=D // 10834
@Output.init.ret.66 // 10835
D=A // 10836
@CALL // 10837
0;JMP // 10838
(Output.init.ret.66)
@SP // 10839
M=M-1 // 10840

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10841
D=A // 10842
@SP // 10843
M=D+M // 10844
@97 // 10845
D=A // 10846
@SP // 10847
A=M-1 // 10848
M=0 // 10849
A=A-1 // 10850
M=0 // 10851
A=A-1 // 10852
M=0 // 10853
A=A-1 // 10854
M=D // 10855
A=A-1 // 10856
@14 // 10857
D=A // 10858
@SP // 10859
AM=M+1 // 10860
A=A-1 // 10861
M=D // 10862
@24 // 10863
D=A // 10864
@SP // 10865
AM=M+1 // 10866
A=A-1 // 10867
M=D // 10868
@30 // 10869
D=A // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=D // 10874
@27 // 10875
D=A // 10876
@SP // 10877
AM=M+1 // 10878
A=A-1 // 10879
M=D // 10880
@27 // 10881
D=A // 10882
@SP // 10883
AM=M+1 // 10884
A=A-1 // 10885
M=D // 10886
@54 // 10887
D=A // 10888
@SP // 10889
AM=M+1 // 10890
A=A-1 // 10891
M=D // 10892
@SP // 10893
AM=M+1 // 10894
A=A-1 // 10895
M=0 // 10896
@SP // 10897
AM=M+1 // 10898
A=A-1 // 10899
M=0 // 10900
// call Output.create
@17 // 10901
D=A // 10902
@14 // 10903
M=D // 10904
@Output.create // 10905
D=A // 10906
@13 // 10907
M=D // 10908
@Output.init.ret.67 // 10909
D=A // 10910
@CALL // 10911
0;JMP // 10912
(Output.init.ret.67)
@SP // 10913
M=M-1 // 10914

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10915
D=A // 10916
@SP // 10917
AM=M+1 // 10918
A=A-1 // 10919
M=D // 10920
@3 // 10921
D=A // 10922
@SP // 10923
AM=M+1 // 10924
A=A-1 // 10925
M=D // 10926
@3 // 10927
D=A // 10928
@SP // 10929
AM=M+1 // 10930
A=A-1 // 10931
M=D // 10932
@3 // 10933
D=A // 10934
@SP // 10935
AM=M+1 // 10936
A=A-1 // 10937
M=D // 10938
@15 // 10939
D=A // 10940
@SP // 10941
AM=M+1 // 10942
A=A-1 // 10943
M=D // 10944
@27 // 10945
D=A // 10946
@SP // 10947
AM=M+1 // 10948
A=A-1 // 10949
M=D // 10950
@51 // 10951
D=A // 10952
@SP // 10953
AM=M+1 // 10954
A=A-1 // 10955
M=D // 10956
@51 // 10957
D=A // 10958
@SP // 10959
AM=M+1 // 10960
A=A-1 // 10961
M=D // 10962
@51 // 10963
D=A // 10964
@SP // 10965
AM=M+1 // 10966
A=A-1 // 10967
M=D // 10968
@30 // 10969
D=A // 10970
@SP // 10971
AM=M+1 // 10972
A=A-1 // 10973
M=D // 10974
@SP // 10975
AM=M+1 // 10976
A=A-1 // 10977
M=0 // 10978
@SP // 10979
AM=M+1 // 10980
A=A-1 // 10981
M=0 // 10982
// call Output.create
@17 // 10983
D=A // 10984
@14 // 10985
M=D // 10986
@Output.create // 10987
D=A // 10988
@13 // 10989
M=D // 10990
@Output.init.ret.68 // 10991
D=A // 10992
@CALL // 10993
0;JMP // 10994
(Output.init.ret.68)
@SP // 10995
M=M-1 // 10996

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10997
D=A // 10998
@SP // 10999
M=D+M // 11000
@99 // 11001
D=A // 11002
@SP // 11003
A=M-1 // 11004
M=0 // 11005
A=A-1 // 11006
M=0 // 11007
A=A-1 // 11008
M=0 // 11009
A=A-1 // 11010
M=D // 11011
A=A-1 // 11012
@30 // 11013
D=A // 11014
@SP // 11015
AM=M+1 // 11016
A=A-1 // 11017
M=D // 11018
@51 // 11019
D=A // 11020
@SP // 11021
AM=M+1 // 11022
A=A-1 // 11023
M=D // 11024
@3 // 11025
D=A // 11026
@SP // 11027
AM=M+1 // 11028
A=A-1 // 11029
M=D // 11030
@3 // 11031
D=A // 11032
@SP // 11033
AM=M+1 // 11034
A=A-1 // 11035
M=D // 11036
@51 // 11037
D=A // 11038
@SP // 11039
AM=M+1 // 11040
A=A-1 // 11041
M=D // 11042
@30 // 11043
D=A // 11044
@SP // 11045
AM=M+1 // 11046
A=A-1 // 11047
M=D // 11048
@SP // 11049
AM=M+1 // 11050
A=A-1 // 11051
M=0 // 11052
@SP // 11053
AM=M+1 // 11054
A=A-1 // 11055
M=0 // 11056
// call Output.create
@17 // 11057
D=A // 11058
@14 // 11059
M=D // 11060
@Output.create // 11061
D=A // 11062
@13 // 11063
M=D // 11064
@Output.init.ret.69 // 11065
D=A // 11066
@CALL // 11067
0;JMP // 11068
(Output.init.ret.69)
@SP // 11069
M=M-1 // 11070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11071
D=A // 11072
@SP // 11073
AM=M+1 // 11074
A=A-1 // 11075
M=D // 11076
@48 // 11077
D=A // 11078
@SP // 11079
AM=M+1 // 11080
A=A-1 // 11081
M=D // 11082
@48 // 11083
D=A // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=D // 11088
@48 // 11089
D=A // 11090
@SP // 11091
AM=M+1 // 11092
A=A-1 // 11093
M=D // 11094
@60 // 11095
D=A // 11096
@SP // 11097
AM=M+1 // 11098
A=A-1 // 11099
M=D // 11100
@54 // 11101
D=A // 11102
@SP // 11103
AM=M+1 // 11104
A=A-1 // 11105
M=D // 11106
@51 // 11107
D=A // 11108
@SP // 11109
AM=M+1 // 11110
A=A-1 // 11111
M=D // 11112
@51 // 11113
D=A // 11114
@SP // 11115
AM=M+1 // 11116
A=A-1 // 11117
M=D // 11118
@51 // 11119
D=A // 11120
@SP // 11121
AM=M+1 // 11122
A=A-1 // 11123
M=D // 11124
@30 // 11125
D=A // 11126
@SP // 11127
AM=M+1 // 11128
A=A-1 // 11129
M=D // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=0 // 11134
@SP // 11135
AM=M+1 // 11136
A=A-1 // 11137
M=0 // 11138
// call Output.create
@17 // 11139
D=A // 11140
@14 // 11141
M=D // 11142
@Output.create // 11143
D=A // 11144
@13 // 11145
M=D // 11146
@Output.init.ret.70 // 11147
D=A // 11148
@CALL // 11149
0;JMP // 11150
(Output.init.ret.70)
@SP // 11151
M=M-1 // 11152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11153
D=A // 11154
@SP // 11155
M=D+M // 11156
@101 // 11157
D=A // 11158
@SP // 11159
A=M-1 // 11160
M=0 // 11161
A=A-1 // 11162
M=0 // 11163
A=A-1 // 11164
M=0 // 11165
A=A-1 // 11166
M=D // 11167
A=A-1 // 11168
@30 // 11169
D=A // 11170
@SP // 11171
AM=M+1 // 11172
A=A-1 // 11173
M=D // 11174
@51 // 11175
D=A // 11176
@SP // 11177
AM=M+1 // 11178
A=A-1 // 11179
M=D // 11180
@63 // 11181
D=A // 11182
@SP // 11183
AM=M+1 // 11184
A=A-1 // 11185
M=D // 11186
@3 // 11187
D=A // 11188
@SP // 11189
AM=M+1 // 11190
A=A-1 // 11191
M=D // 11192
@51 // 11193
D=A // 11194
@SP // 11195
AM=M+1 // 11196
A=A-1 // 11197
M=D // 11198
@30 // 11199
D=A // 11200
@SP // 11201
AM=M+1 // 11202
A=A-1 // 11203
M=D // 11204
@SP // 11205
AM=M+1 // 11206
A=A-1 // 11207
M=0 // 11208
@SP // 11209
AM=M+1 // 11210
A=A-1 // 11211
M=0 // 11212
// call Output.create
@17 // 11213
D=A // 11214
@14 // 11215
M=D // 11216
@Output.create // 11217
D=A // 11218
@13 // 11219
M=D // 11220
@Output.init.ret.71 // 11221
D=A // 11222
@CALL // 11223
0;JMP // 11224
(Output.init.ret.71)
@SP // 11225
M=M-1 // 11226

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11227
D=A // 11228
@SP // 11229
AM=M+1 // 11230
A=A-1 // 11231
M=D // 11232
@28 // 11233
D=A // 11234
@SP // 11235
AM=M+1 // 11236
A=A-1 // 11237
M=D // 11238
@54 // 11239
D=A // 11240
@SP // 11241
AM=M+1 // 11242
A=A-1 // 11243
M=D // 11244
@38 // 11245
D=A // 11246
@SP // 11247
AM=M+1 // 11248
A=A-1 // 11249
M=D // 11250
@6 // 11251
D=A // 11252
@SP // 11253
AM=M+1 // 11254
A=A-1 // 11255
M=D // 11256
@15 // 11257
D=A // 11258
@SP // 11259
AM=M+1 // 11260
A=A-1 // 11261
M=D // 11262
@6 // 11263
D=A // 11264
@SP // 11265
AM=M+1 // 11266
A=A-1 // 11267
M=D // 11268
@6 // 11269
D=A // 11270
@SP // 11271
AM=M+1 // 11272
A=A-1 // 11273
M=D // 11274
@6 // 11275
D=A // 11276
@SP // 11277
AM=M+1 // 11278
A=A-1 // 11279
M=D // 11280
@15 // 11281
D=A // 11282
@SP // 11283
AM=M+1 // 11284
A=A-1 // 11285
M=D // 11286
@SP // 11287
AM=M+1 // 11288
A=A-1 // 11289
M=0 // 11290
@SP // 11291
AM=M+1 // 11292
A=A-1 // 11293
M=0 // 11294
// call Output.create
@17 // 11295
D=A // 11296
@14 // 11297
M=D // 11298
@Output.create // 11299
D=A // 11300
@13 // 11301
M=D // 11302
@Output.init.ret.72 // 11303
D=A // 11304
@CALL // 11305
0;JMP // 11306
(Output.init.ret.72)
@SP // 11307
M=M-1 // 11308

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11309
D=A // 11310
@SP // 11311
M=D+M // 11312
@103 // 11313
D=A // 11314
@SP // 11315
A=M-1 // 11316
M=0 // 11317
A=A-1 // 11318
M=0 // 11319
A=A-1 // 11320
M=D // 11321
A=A-1 // 11322
@30 // 11323
D=A // 11324
@SP // 11325
AM=M+1 // 11326
A=A-1 // 11327
M=D // 11328
@51 // 11329
D=A // 11330
@SP // 11331
AM=M+1 // 11332
A=A-1 // 11333
M=D // 11334
@51 // 11335
D=A // 11336
@SP // 11337
AM=M+1 // 11338
A=A-1 // 11339
M=D // 11340
@51 // 11341
D=A // 11342
@SP // 11343
AM=M+1 // 11344
A=A-1 // 11345
M=D // 11346
@62 // 11347
D=A // 11348
@SP // 11349
AM=M+1 // 11350
A=A-1 // 11351
M=D // 11352
@48 // 11353
D=A // 11354
@SP // 11355
AM=M+1 // 11356
A=A-1 // 11357
M=D // 11358
@51 // 11359
D=A // 11360
@SP // 11361
AM=M+1 // 11362
A=A-1 // 11363
M=D // 11364
@30 // 11365
D=A // 11366
@SP // 11367
AM=M+1 // 11368
A=A-1 // 11369
M=D // 11370
@SP // 11371
AM=M+1 // 11372
A=A-1 // 11373
M=0 // 11374
// call Output.create
@17 // 11375
D=A // 11376
@14 // 11377
M=D // 11378
@Output.create // 11379
D=A // 11380
@13 // 11381
M=D // 11382
@Output.init.ret.73 // 11383
D=A // 11384
@CALL // 11385
0;JMP // 11386
(Output.init.ret.73)
@SP // 11387
M=M-1 // 11388

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11389
D=A // 11390
@SP // 11391
AM=M+1 // 11392
A=A-1 // 11393
M=D // 11394
@3 // 11395
D=A // 11396
@SP // 11397
AM=M+1 // 11398
A=A-1 // 11399
M=D // 11400
@3 // 11401
D=A // 11402
@SP // 11403
AM=M+1 // 11404
A=A-1 // 11405
M=D // 11406
@3 // 11407
D=A // 11408
@SP // 11409
AM=M+1 // 11410
A=A-1 // 11411
M=D // 11412
@27 // 11413
D=A // 11414
@SP // 11415
AM=M+1 // 11416
A=A-1 // 11417
M=D // 11418
@55 // 11419
D=A // 11420
@SP // 11421
AM=M+1 // 11422
A=A-1 // 11423
M=D // 11424
@51 // 11425
D=A // 11426
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=D // 11430
@51 // 11431
D=A // 11432
@SP // 11433
AM=M+1 // 11434
A=A-1 // 11435
M=D // 11436
@51 // 11437
D=A // 11438
@SP // 11439
AM=M+1 // 11440
A=A-1 // 11441
M=D // 11442
@51 // 11443
D=A // 11444
@SP // 11445
AM=M+1 // 11446
A=A-1 // 11447
M=D // 11448
@SP // 11449
AM=M+1 // 11450
A=A-1 // 11451
M=0 // 11452
@SP // 11453
AM=M+1 // 11454
A=A-1 // 11455
M=0 // 11456
// call Output.create
@17 // 11457
D=A // 11458
@14 // 11459
M=D // 11460
@Output.create // 11461
D=A // 11462
@13 // 11463
M=D // 11464
@Output.init.ret.74 // 11465
D=A // 11466
@CALL // 11467
0;JMP // 11468
(Output.init.ret.74)
@SP // 11469
M=M-1 // 11470

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11471
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
@SP // 11489
AM=M+1 // 11490
A=A-1 // 11491
M=0 // 11492
@14 // 11493
D=A // 11494
@SP // 11495
AM=M+1 // 11496
A=A-1 // 11497
M=D // 11498
@12 // 11499
D=A // 11500
@SP // 11501
AM=M+1 // 11502
A=A-1 // 11503
M=D // 11504
@12 // 11505
D=A // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=D // 11510
@12 // 11511
D=A // 11512
@SP // 11513
AM=M+1 // 11514
A=A-1 // 11515
M=D // 11516
@12 // 11517
D=A // 11518
@SP // 11519
AM=M+1 // 11520
A=A-1 // 11521
M=D // 11522
@30 // 11523
D=A // 11524
@SP // 11525
AM=M+1 // 11526
A=A-1 // 11527
M=D // 11528
@SP // 11529
AM=M+1 // 11530
A=A-1 // 11531
M=0 // 11532
@SP // 11533
AM=M+1 // 11534
A=A-1 // 11535
M=0 // 11536
// call Output.create
@17 // 11537
D=A // 11538
@14 // 11539
M=D // 11540
@Output.create // 11541
D=A // 11542
@13 // 11543
M=D // 11544
@Output.init.ret.75 // 11545
D=A // 11546
@CALL // 11547
0;JMP // 11548
(Output.init.ret.75)
@SP // 11549
M=M-1 // 11550

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11551
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
@SP // 11569
AM=M+1 // 11570
A=A-1 // 11571
M=0 // 11572
@56 // 11573
D=A // 11574
@SP // 11575
AM=M+1 // 11576
A=A-1 // 11577
M=D // 11578
@48 // 11579
D=A // 11580
@SP // 11581
AM=M+1 // 11582
A=A-1 // 11583
M=D // 11584
@48 // 11585
D=A // 11586
@SP // 11587
AM=M+1 // 11588
A=A-1 // 11589
M=D // 11590
@48 // 11591
D=A // 11592
@SP // 11593
AM=M+1 // 11594
A=A-1 // 11595
M=D // 11596
@48 // 11597
D=A // 11598
@SP // 11599
AM=M+1 // 11600
A=A-1 // 11601
M=D // 11602
@51 // 11603
D=A // 11604
@SP // 11605
AM=M+1 // 11606
A=A-1 // 11607
M=D // 11608
@30 // 11609
D=A // 11610
@SP // 11611
AM=M+1 // 11612
A=A-1 // 11613
M=D // 11614
@SP // 11615
AM=M+1 // 11616
A=A-1 // 11617
M=0 // 11618
// call Output.create
@17 // 11619
D=A // 11620
@14 // 11621
M=D // 11622
@Output.create // 11623
D=A // 11624
@13 // 11625
M=D // 11626
@Output.init.ret.76 // 11627
D=A // 11628
@CALL // 11629
0;JMP // 11630
(Output.init.ret.76)
@SP // 11631
M=M-1 // 11632

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11633
D=A // 11634
@SP // 11635
AM=M+1 // 11636
A=A-1 // 11637
M=D // 11638
@3 // 11639
D=A // 11640
@SP // 11641
AM=M+1 // 11642
A=A-1 // 11643
M=D // 11644
@3 // 11645
D=A // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=D // 11650
@3 // 11651
D=A // 11652
@SP // 11653
AM=M+1 // 11654
A=A-1 // 11655
M=D // 11656
@51 // 11657
D=A // 11658
@SP // 11659
AM=M+1 // 11660
A=A-1 // 11661
M=D // 11662
@27 // 11663
D=A // 11664
@SP // 11665
AM=M+1 // 11666
A=A-1 // 11667
M=D // 11668
@15 // 11669
D=A // 11670
@SP // 11671
AM=M+1 // 11672
A=A-1 // 11673
M=D // 11674
@15 // 11675
D=A // 11676
@SP // 11677
AM=M+1 // 11678
A=A-1 // 11679
M=D // 11680
@27 // 11681
D=A // 11682
@SP // 11683
AM=M+1 // 11684
A=A-1 // 11685
M=D // 11686
@51 // 11687
D=A // 11688
@SP // 11689
AM=M+1 // 11690
A=A-1 // 11691
M=D // 11692
@SP // 11693
AM=M+1 // 11694
A=A-1 // 11695
M=0 // 11696
@SP // 11697
AM=M+1 // 11698
A=A-1 // 11699
M=0 // 11700
// call Output.create
@17 // 11701
D=A // 11702
@14 // 11703
M=D // 11704
@Output.create // 11705
D=A // 11706
@13 // 11707
M=D // 11708
@Output.init.ret.77 // 11709
D=A // 11710
@CALL // 11711
0;JMP // 11712
(Output.init.ret.77)
@SP // 11713
M=M-1 // 11714

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11715
D=A // 11716
@SP // 11717
AM=M+1 // 11718
A=A-1 // 11719
M=D // 11720
@14 // 11721
D=A // 11722
@SP // 11723
AM=M+1 // 11724
A=A-1 // 11725
M=D // 11726
@12 // 11727
D=A // 11728
@SP // 11729
AM=M+1 // 11730
A=A-1 // 11731
M=D // 11732
@12 // 11733
D=A // 11734
@SP // 11735
AM=M+1 // 11736
A=A-1 // 11737
M=D // 11738
@12 // 11739
D=A // 11740
@SP // 11741
AM=M+1 // 11742
A=A-1 // 11743
M=D // 11744
@12 // 11745
D=A // 11746
@SP // 11747
AM=M+1 // 11748
A=A-1 // 11749
M=D // 11750
@12 // 11751
D=A // 11752
@SP // 11753
AM=M+1 // 11754
A=A-1 // 11755
M=D // 11756
@12 // 11757
D=A // 11758
@SP // 11759
AM=M+1 // 11760
A=A-1 // 11761
M=D // 11762
@12 // 11763
D=A // 11764
@SP // 11765
AM=M+1 // 11766
A=A-1 // 11767
M=D // 11768
@30 // 11769
D=A // 11770
@SP // 11771
AM=M+1 // 11772
A=A-1 // 11773
M=D // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=0 // 11778
@SP // 11779
AM=M+1 // 11780
A=A-1 // 11781
M=0 // 11782
// call Output.create
@17 // 11783
D=A // 11784
@14 // 11785
M=D // 11786
@Output.create // 11787
D=A // 11788
@13 // 11789
M=D // 11790
@Output.init.ret.78 // 11791
D=A // 11792
@CALL // 11793
0;JMP // 11794
(Output.init.ret.78)
@SP // 11795
M=M-1 // 11796

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11797
D=A // 11798
@SP // 11799
M=D+M // 11800
@109 // 11801
D=A // 11802
@SP // 11803
A=M-1 // 11804
M=0 // 11805
A=A-1 // 11806
M=0 // 11807
A=A-1 // 11808
M=0 // 11809
A=A-1 // 11810
M=D // 11811
A=A-1 // 11812
@29 // 11813
D=A // 11814
@SP // 11815
AM=M+1 // 11816
A=A-1 // 11817
M=D // 11818
@63 // 11819
D=A // 11820
@SP // 11821
AM=M+1 // 11822
A=A-1 // 11823
M=D // 11824
@43 // 11825
D=A // 11826
@SP // 11827
AM=M+1 // 11828
A=A-1 // 11829
M=D // 11830
@43 // 11831
D=A // 11832
@SP // 11833
AM=M+1 // 11834
A=A-1 // 11835
M=D // 11836
@43 // 11837
D=A // 11838
@SP // 11839
AM=M+1 // 11840
A=A-1 // 11841
M=D // 11842
@43 // 11843
D=A // 11844
@SP // 11845
AM=M+1 // 11846
A=A-1 // 11847
M=D // 11848
@SP // 11849
AM=M+1 // 11850
A=A-1 // 11851
M=0 // 11852
@SP // 11853
AM=M+1 // 11854
A=A-1 // 11855
M=0 // 11856
// call Output.create
@17 // 11857
D=A // 11858
@14 // 11859
M=D // 11860
@Output.create // 11861
D=A // 11862
@13 // 11863
M=D // 11864
@Output.init.ret.79 // 11865
D=A // 11866
@CALL // 11867
0;JMP // 11868
(Output.init.ret.79)
@SP // 11869
M=M-1 // 11870

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11871
D=A // 11872
@SP // 11873
M=D+M // 11874
@110 // 11875
D=A // 11876
@SP // 11877
A=M-1 // 11878
M=0 // 11879
A=A-1 // 11880
M=0 // 11881
A=A-1 // 11882
M=0 // 11883
A=A-1 // 11884
M=D // 11885
A=A-1 // 11886
@29 // 11887
D=A // 11888
@SP // 11889
AM=M+1 // 11890
A=A-1 // 11891
M=D // 11892
@51 // 11893
D=A // 11894
@SP // 11895
AM=M+1 // 11896
A=A-1 // 11897
M=D // 11898
@51 // 11899
D=A // 11900
@SP // 11901
AM=M+1 // 11902
A=A-1 // 11903
M=D // 11904
@51 // 11905
D=A // 11906
@SP // 11907
AM=M+1 // 11908
A=A-1 // 11909
M=D // 11910
@51 // 11911
D=A // 11912
@SP // 11913
AM=M+1 // 11914
A=A-1 // 11915
M=D // 11916
@51 // 11917
D=A // 11918
@SP // 11919
AM=M+1 // 11920
A=A-1 // 11921
M=D // 11922
@SP // 11923
AM=M+1 // 11924
A=A-1 // 11925
M=0 // 11926
@SP // 11927
AM=M+1 // 11928
A=A-1 // 11929
M=0 // 11930
// call Output.create
@17 // 11931
D=A // 11932
@14 // 11933
M=D // 11934
@Output.create // 11935
D=A // 11936
@13 // 11937
M=D // 11938
@Output.init.ret.80 // 11939
D=A // 11940
@CALL // 11941
0;JMP // 11942
(Output.init.ret.80)
@SP // 11943
M=M-1 // 11944

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11945
D=A // 11946
@SP // 11947
M=D+M // 11948
@111 // 11949
D=A // 11950
@SP // 11951
A=M-1 // 11952
M=0 // 11953
A=A-1 // 11954
M=0 // 11955
A=A-1 // 11956
M=0 // 11957
A=A-1 // 11958
M=D // 11959
A=A-1 // 11960
@30 // 11961
D=A // 11962
@SP // 11963
AM=M+1 // 11964
A=A-1 // 11965
M=D // 11966
@51 // 11967
D=A // 11968
@SP // 11969
AM=M+1 // 11970
A=A-1 // 11971
M=D // 11972
@51 // 11973
D=A // 11974
@SP // 11975
AM=M+1 // 11976
A=A-1 // 11977
M=D // 11978
@51 // 11979
D=A // 11980
@SP // 11981
AM=M+1 // 11982
A=A-1 // 11983
M=D // 11984
@51 // 11985
D=A // 11986
@SP // 11987
AM=M+1 // 11988
A=A-1 // 11989
M=D // 11990
@30 // 11991
D=A // 11992
@SP // 11993
AM=M+1 // 11994
A=A-1 // 11995
M=D // 11996
@SP // 11997
AM=M+1 // 11998
A=A-1 // 11999
M=0 // 12000
@SP // 12001
AM=M+1 // 12002
A=A-1 // 12003
M=0 // 12004
// call Output.create
@17 // 12005
D=A // 12006
@14 // 12007
M=D // 12008
@Output.create // 12009
D=A // 12010
@13 // 12011
M=D // 12012
@Output.init.ret.81 // 12013
D=A // 12014
@CALL // 12015
0;JMP // 12016
(Output.init.ret.81)
@SP // 12017
M=M-1 // 12018

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12019
D=A // 12020
@SP // 12021
M=D+M // 12022
@112 // 12023
D=A // 12024
@SP // 12025
A=M-1 // 12026
M=0 // 12027
A=A-1 // 12028
M=0 // 12029
A=A-1 // 12030
M=0 // 12031
A=A-1 // 12032
M=D // 12033
A=A-1 // 12034
@30 // 12035
D=A // 12036
@SP // 12037
AM=M+1 // 12038
A=A-1 // 12039
M=D // 12040
@51 // 12041
D=A // 12042
@SP // 12043
AM=M+1 // 12044
A=A-1 // 12045
M=D // 12046
@51 // 12047
D=A // 12048
@SP // 12049
AM=M+1 // 12050
A=A-1 // 12051
M=D // 12052
@51 // 12053
D=A // 12054
@SP // 12055
AM=M+1 // 12056
A=A-1 // 12057
M=D // 12058
@31 // 12059
D=A // 12060
@SP // 12061
AM=M+1 // 12062
A=A-1 // 12063
M=D // 12064
@3 // 12065
D=A // 12066
@SP // 12067
AM=M+1 // 12068
A=A-1 // 12069
M=D // 12070
@3 // 12071
D=A // 12072
@SP // 12073
AM=M+1 // 12074
A=A-1 // 12075
M=D // 12076
@SP // 12077
AM=M+1 // 12078
A=A-1 // 12079
M=0 // 12080
// call Output.create
@17 // 12081
D=A // 12082
@14 // 12083
M=D // 12084
@Output.create // 12085
D=A // 12086
@13 // 12087
M=D // 12088
@Output.init.ret.82 // 12089
D=A // 12090
@CALL // 12091
0;JMP // 12092
(Output.init.ret.82)
@SP // 12093
M=M-1 // 12094

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12095
D=A // 12096
@SP // 12097
M=D+M // 12098
@113 // 12099
D=A // 12100
@SP // 12101
A=M-1 // 12102
M=0 // 12103
A=A-1 // 12104
M=0 // 12105
A=A-1 // 12106
M=0 // 12107
A=A-1 // 12108
M=D // 12109
A=A-1 // 12110
@30 // 12111
D=A // 12112
@SP // 12113
AM=M+1 // 12114
A=A-1 // 12115
M=D // 12116
@51 // 12117
D=A // 12118
@SP // 12119
AM=M+1 // 12120
A=A-1 // 12121
M=D // 12122
@51 // 12123
D=A // 12124
@SP // 12125
AM=M+1 // 12126
A=A-1 // 12127
M=D // 12128
@51 // 12129
D=A // 12130
@SP // 12131
AM=M+1 // 12132
A=A-1 // 12133
M=D // 12134
@62 // 12135
D=A // 12136
@SP // 12137
AM=M+1 // 12138
A=A-1 // 12139
M=D // 12140
@48 // 12141
D=A // 12142
@SP // 12143
AM=M+1 // 12144
A=A-1 // 12145
M=D // 12146
@48 // 12147
D=A // 12148
@SP // 12149
AM=M+1 // 12150
A=A-1 // 12151
M=D // 12152
@SP // 12153
AM=M+1 // 12154
A=A-1 // 12155
M=0 // 12156
// call Output.create
@17 // 12157
D=A // 12158
@14 // 12159
M=D // 12160
@Output.create // 12161
D=A // 12162
@13 // 12163
M=D // 12164
@Output.init.ret.83 // 12165
D=A // 12166
@CALL // 12167
0;JMP // 12168
(Output.init.ret.83)
@SP // 12169
M=M-1 // 12170

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12171
D=A // 12172
@SP // 12173
M=D+M // 12174
@114 // 12175
D=A // 12176
@SP // 12177
A=M-1 // 12178
M=0 // 12179
A=A-1 // 12180
M=0 // 12181
A=A-1 // 12182
M=0 // 12183
A=A-1 // 12184
M=D // 12185
A=A-1 // 12186
@29 // 12187
D=A // 12188
@SP // 12189
AM=M+1 // 12190
A=A-1 // 12191
M=D // 12192
@55 // 12193
D=A // 12194
@SP // 12195
AM=M+1 // 12196
A=A-1 // 12197
M=D // 12198
@51 // 12199
D=A // 12200
@SP // 12201
AM=M+1 // 12202
A=A-1 // 12203
M=D // 12204
@3 // 12205
D=A // 12206
@SP // 12207
AM=M+1 // 12208
A=A-1 // 12209
M=D // 12210
@3 // 12211
D=A // 12212
@SP // 12213
AM=M+1 // 12214
A=A-1 // 12215
M=D // 12216
@7 // 12217
D=A // 12218
@SP // 12219
AM=M+1 // 12220
A=A-1 // 12221
M=D // 12222
@SP // 12223
AM=M+1 // 12224
A=A-1 // 12225
M=0 // 12226
@SP // 12227
AM=M+1 // 12228
A=A-1 // 12229
M=0 // 12230
// call Output.create
@17 // 12231
D=A // 12232
@14 // 12233
M=D // 12234
@Output.create // 12235
D=A // 12236
@13 // 12237
M=D // 12238
@Output.init.ret.84 // 12239
D=A // 12240
@CALL // 12241
0;JMP // 12242
(Output.init.ret.84)
@SP // 12243
M=M-1 // 12244

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12245
D=A // 12246
@SP // 12247
M=D+M // 12248
@115 // 12249
D=A // 12250
@SP // 12251
A=M-1 // 12252
M=0 // 12253
A=A-1 // 12254
M=0 // 12255
A=A-1 // 12256
M=0 // 12257
A=A-1 // 12258
M=D // 12259
A=A-1 // 12260
@30 // 12261
D=A // 12262
@SP // 12263
AM=M+1 // 12264
A=A-1 // 12265
M=D // 12266
@51 // 12267
D=A // 12268
@SP // 12269
AM=M+1 // 12270
A=A-1 // 12271
M=D // 12272
@6 // 12273
D=A // 12274
@SP // 12275
AM=M+1 // 12276
A=A-1 // 12277
M=D // 12278
@24 // 12279
D=A // 12280
@SP // 12281
AM=M+1 // 12282
A=A-1 // 12283
M=D // 12284
@51 // 12285
D=A // 12286
@SP // 12287
AM=M+1 // 12288
A=A-1 // 12289
M=D // 12290
@30 // 12291
D=A // 12292
@SP // 12293
AM=M+1 // 12294
A=A-1 // 12295
M=D // 12296
@SP // 12297
AM=M+1 // 12298
A=A-1 // 12299
M=0 // 12300
@SP // 12301
AM=M+1 // 12302
A=A-1 // 12303
M=0 // 12304
// call Output.create
@17 // 12305
D=A // 12306
@14 // 12307
M=D // 12308
@Output.create // 12309
D=A // 12310
@13 // 12311
M=D // 12312
@Output.init.ret.85 // 12313
D=A // 12314
@CALL // 12315
0;JMP // 12316
(Output.init.ret.85)
@SP // 12317
M=M-1 // 12318

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12319
D=A // 12320
@SP // 12321
AM=M+1 // 12322
A=A-1 // 12323
M=D // 12324
@4 // 12325
D=A // 12326
@SP // 12327
AM=M+1 // 12328
A=A-1 // 12329
M=D // 12330
@6 // 12331
D=A // 12332
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=D // 12336
@6 // 12337
D=A // 12338
@SP // 12339
AM=M+1 // 12340
A=A-1 // 12341
M=D // 12342
@15 // 12343
D=A // 12344
@SP // 12345
AM=M+1 // 12346
A=A-1 // 12347
M=D // 12348
@6 // 12349
D=A // 12350
@SP // 12351
AM=M+1 // 12352
A=A-1 // 12353
M=D // 12354
@6 // 12355
D=A // 12356
@SP // 12357
AM=M+1 // 12358
A=A-1 // 12359
M=D // 12360
@6 // 12361
D=A // 12362
@SP // 12363
AM=M+1 // 12364
A=A-1 // 12365
M=D // 12366
@54 // 12367
D=A // 12368
@SP // 12369
AM=M+1 // 12370
A=A-1 // 12371
M=D // 12372
@28 // 12373
D=A // 12374
@SP // 12375
AM=M+1 // 12376
A=A-1 // 12377
M=D // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=0 // 12382
@SP // 12383
AM=M+1 // 12384
A=A-1 // 12385
M=0 // 12386
// call Output.create
@17 // 12387
D=A // 12388
@14 // 12389
M=D // 12390
@Output.create // 12391
D=A // 12392
@13 // 12393
M=D // 12394
@Output.init.ret.86 // 12395
D=A // 12396
@CALL // 12397
0;JMP // 12398
(Output.init.ret.86)
@SP // 12399
M=M-1 // 12400

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12401
D=A // 12402
@SP // 12403
M=D+M // 12404
@117 // 12405
D=A // 12406
@SP // 12407
A=M-1 // 12408
M=0 // 12409
A=A-1 // 12410
M=0 // 12411
A=A-1 // 12412
M=0 // 12413
A=A-1 // 12414
M=D // 12415
A=A-1 // 12416
@27 // 12417
D=A // 12418
@SP // 12419
AM=M+1 // 12420
A=A-1 // 12421
M=D // 12422
@27 // 12423
D=A // 12424
@SP // 12425
AM=M+1 // 12426
A=A-1 // 12427
M=D // 12428
@27 // 12429
D=A // 12430
@SP // 12431
AM=M+1 // 12432
A=A-1 // 12433
M=D // 12434
@27 // 12435
D=A // 12436
@SP // 12437
AM=M+1 // 12438
A=A-1 // 12439
M=D // 12440
@27 // 12441
D=A // 12442
@SP // 12443
AM=M+1 // 12444
A=A-1 // 12445
M=D // 12446
@54 // 12447
D=A // 12448
@SP // 12449
AM=M+1 // 12450
A=A-1 // 12451
M=D // 12452
@SP // 12453
AM=M+1 // 12454
A=A-1 // 12455
M=0 // 12456
@SP // 12457
AM=M+1 // 12458
A=A-1 // 12459
M=0 // 12460
// call Output.create
@17 // 12461
D=A // 12462
@14 // 12463
M=D // 12464
@Output.create // 12465
D=A // 12466
@13 // 12467
M=D // 12468
@Output.init.ret.87 // 12469
D=A // 12470
@CALL // 12471
0;JMP // 12472
(Output.init.ret.87)
@SP // 12473
M=M-1 // 12474

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12475
D=A // 12476
@SP // 12477
M=D+M // 12478
@118 // 12479
D=A // 12480
@SP // 12481
A=M-1 // 12482
M=0 // 12483
A=A-1 // 12484
M=0 // 12485
A=A-1 // 12486
M=0 // 12487
A=A-1 // 12488
M=D // 12489
A=A-1 // 12490
@51 // 12491
D=A // 12492
@SP // 12493
AM=M+1 // 12494
A=A-1 // 12495
M=D // 12496
@51 // 12497
D=A // 12498
@SP // 12499
AM=M+1 // 12500
A=A-1 // 12501
M=D // 12502
@51 // 12503
D=A // 12504
@SP // 12505
AM=M+1 // 12506
A=A-1 // 12507
M=D // 12508
@51 // 12509
D=A // 12510
@SP // 12511
AM=M+1 // 12512
A=A-1 // 12513
M=D // 12514
@30 // 12515
D=A // 12516
@SP // 12517
AM=M+1 // 12518
A=A-1 // 12519
M=D // 12520
@12 // 12521
D=A // 12522
@SP // 12523
AM=M+1 // 12524
A=A-1 // 12525
M=D // 12526
@SP // 12527
AM=M+1 // 12528
A=A-1 // 12529
M=0 // 12530
@SP // 12531
AM=M+1 // 12532
A=A-1 // 12533
M=0 // 12534
// call Output.create
@17 // 12535
D=A // 12536
@14 // 12537
M=D // 12538
@Output.create // 12539
D=A // 12540
@13 // 12541
M=D // 12542
@Output.init.ret.88 // 12543
D=A // 12544
@CALL // 12545
0;JMP // 12546
(Output.init.ret.88)
@SP // 12547
M=M-1 // 12548

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12549
D=A // 12550
@SP // 12551
M=D+M // 12552
@119 // 12553
D=A // 12554
@SP // 12555
A=M-1 // 12556
M=0 // 12557
A=A-1 // 12558
M=0 // 12559
A=A-1 // 12560
M=0 // 12561
A=A-1 // 12562
M=D // 12563
A=A-1 // 12564
@51 // 12565
D=A // 12566
@SP // 12567
AM=M+1 // 12568
A=A-1 // 12569
M=D // 12570
@51 // 12571
D=A // 12572
@SP // 12573
AM=M+1 // 12574
A=A-1 // 12575
M=D // 12576
@51 // 12577
D=A // 12578
@SP // 12579
AM=M+1 // 12580
A=A-1 // 12581
M=D // 12582
@63 // 12583
D=A // 12584
@SP // 12585
AM=M+1 // 12586
A=A-1 // 12587
M=D // 12588
@63 // 12589
D=A // 12590
@SP // 12591
AM=M+1 // 12592
A=A-1 // 12593
M=D // 12594
@18 // 12595
D=A // 12596
@SP // 12597
AM=M+1 // 12598
A=A-1 // 12599
M=D // 12600
@SP // 12601
AM=M+1 // 12602
A=A-1 // 12603
M=0 // 12604
@SP // 12605
AM=M+1 // 12606
A=A-1 // 12607
M=0 // 12608
// call Output.create
@17 // 12609
D=A // 12610
@14 // 12611
M=D // 12612
@Output.create // 12613
D=A // 12614
@13 // 12615
M=D // 12616
@Output.init.ret.89 // 12617
D=A // 12618
@CALL // 12619
0;JMP // 12620
(Output.init.ret.89)
@SP // 12621
M=M-1 // 12622

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12623
D=A // 12624
@SP // 12625
M=D+M // 12626
@120 // 12627
D=A // 12628
@SP // 12629
A=M-1 // 12630
M=0 // 12631
A=A-1 // 12632
M=0 // 12633
A=A-1 // 12634
M=0 // 12635
A=A-1 // 12636
M=D // 12637
A=A-1 // 12638
@51 // 12639
D=A // 12640
@SP // 12641
AM=M+1 // 12642
A=A-1 // 12643
M=D // 12644
@30 // 12645
D=A // 12646
@SP // 12647
AM=M+1 // 12648
A=A-1 // 12649
M=D // 12650
@12 // 12651
D=A // 12652
@SP // 12653
AM=M+1 // 12654
A=A-1 // 12655
M=D // 12656
@12 // 12657
D=A // 12658
@SP // 12659
AM=M+1 // 12660
A=A-1 // 12661
M=D // 12662
@30 // 12663
D=A // 12664
@SP // 12665
AM=M+1 // 12666
A=A-1 // 12667
M=D // 12668
@51 // 12669
D=A // 12670
@SP // 12671
AM=M+1 // 12672
A=A-1 // 12673
M=D // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=0 // 12678
@SP // 12679
AM=M+1 // 12680
A=A-1 // 12681
M=0 // 12682
// call Output.create
@17 // 12683
D=A // 12684
@14 // 12685
M=D // 12686
@Output.create // 12687
D=A // 12688
@13 // 12689
M=D // 12690
@Output.init.ret.90 // 12691
D=A // 12692
@CALL // 12693
0;JMP // 12694
(Output.init.ret.90)
@SP // 12695
M=M-1 // 12696

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12697
D=A // 12698
@SP // 12699
M=D+M // 12700
@121 // 12701
D=A // 12702
@SP // 12703
A=M-1 // 12704
M=0 // 12705
A=A-1 // 12706
M=0 // 12707
A=A-1 // 12708
M=0 // 12709
A=A-1 // 12710
M=D // 12711
A=A-1 // 12712
@51 // 12713
D=A // 12714
@SP // 12715
AM=M+1 // 12716
A=A-1 // 12717
M=D // 12718
@51 // 12719
D=A // 12720
@SP // 12721
AM=M+1 // 12722
A=A-1 // 12723
M=D // 12724
@51 // 12725
D=A // 12726
@SP // 12727
AM=M+1 // 12728
A=A-1 // 12729
M=D // 12730
@62 // 12731
D=A // 12732
@SP // 12733
AM=M+1 // 12734
A=A-1 // 12735
M=D // 12736
@48 // 12737
D=A // 12738
@SP // 12739
AM=M+1 // 12740
A=A-1 // 12741
M=D // 12742
@24 // 12743
D=A // 12744
@SP // 12745
AM=M+1 // 12746
A=A-1 // 12747
M=D // 12748
@15 // 12749
D=A // 12750
@SP // 12751
AM=M+1 // 12752
A=A-1 // 12753
M=D // 12754
@SP // 12755
AM=M+1 // 12756
A=A-1 // 12757
M=0 // 12758
// call Output.create
@17 // 12759
D=A // 12760
@14 // 12761
M=D // 12762
@Output.create // 12763
D=A // 12764
@13 // 12765
M=D // 12766
@Output.init.ret.91 // 12767
D=A // 12768
@CALL // 12769
0;JMP // 12770
(Output.init.ret.91)
@SP // 12771
M=M-1 // 12772

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12773
D=A // 12774
@SP // 12775
M=D+M // 12776
@122 // 12777
D=A // 12778
@SP // 12779
A=M-1 // 12780
M=0 // 12781
A=A-1 // 12782
M=0 // 12783
A=A-1 // 12784
M=0 // 12785
A=A-1 // 12786
M=D // 12787
A=A-1 // 12788
@63 // 12789
D=A // 12790
@SP // 12791
AM=M+1 // 12792
A=A-1 // 12793
M=D // 12794
@27 // 12795
D=A // 12796
@SP // 12797
AM=M+1 // 12798
A=A-1 // 12799
M=D // 12800
@12 // 12801
D=A // 12802
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=D // 12806
@6 // 12807
D=A // 12808
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=D // 12812
@51 // 12813
D=A // 12814
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=D // 12818
@63 // 12819
D=A // 12820
@SP // 12821
AM=M+1 // 12822
A=A-1 // 12823
M=D // 12824
@SP // 12825
AM=M+1 // 12826
A=A-1 // 12827
M=0 // 12828
@SP // 12829
AM=M+1 // 12830
A=A-1 // 12831
M=0 // 12832
// call Output.create
@17 // 12833
D=A // 12834
@14 // 12835
M=D // 12836
@Output.create // 12837
D=A // 12838
@13 // 12839
M=D // 12840
@Output.init.ret.92 // 12841
D=A // 12842
@CALL // 12843
0;JMP // 12844
(Output.init.ret.92)
@SP // 12845
M=M-1 // 12846

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12847
D=A // 12848
@SP // 12849
AM=M+1 // 12850
A=A-1 // 12851
M=D // 12852
@56 // 12853
D=A // 12854
@SP // 12855
AM=M+1 // 12856
A=A-1 // 12857
M=D // 12858
@12 // 12859
D=A // 12860
@SP // 12861
AM=M+1 // 12862
A=A-1 // 12863
M=D // 12864
@12 // 12865
D=A // 12866
@SP // 12867
AM=M+1 // 12868
A=A-1 // 12869
M=D // 12870
@12 // 12871
D=A // 12872
@SP // 12873
AM=M+1 // 12874
A=A-1 // 12875
M=D // 12876
@7 // 12877
D=A // 12878
@SP // 12879
AM=M+1 // 12880
A=A-1 // 12881
M=D // 12882
@12 // 12883
D=A // 12884
@SP // 12885
AM=M+1 // 12886
A=A-1 // 12887
M=D // 12888
@12 // 12889
D=A // 12890
@SP // 12891
AM=M+1 // 12892
A=A-1 // 12893
M=D // 12894
@12 // 12895
D=A // 12896
@SP // 12897
AM=M+1 // 12898
A=A-1 // 12899
M=D // 12900
@56 // 12901
D=A // 12902
@SP // 12903
AM=M+1 // 12904
A=A-1 // 12905
M=D // 12906
@SP // 12907
AM=M+1 // 12908
A=A-1 // 12909
M=0 // 12910
@SP // 12911
AM=M+1 // 12912
A=A-1 // 12913
M=0 // 12914
// call Output.create
@17 // 12915
D=A // 12916
@14 // 12917
M=D // 12918
@Output.create // 12919
D=A // 12920
@13 // 12921
M=D // 12922
@Output.init.ret.93 // 12923
D=A // 12924
@CALL // 12925
0;JMP // 12926
(Output.init.ret.93)
@SP // 12927
M=M-1 // 12928

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12929
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
@12 // 12947
D=A // 12948
@SP // 12949
AM=M+1 // 12950
A=A-1 // 12951
M=D // 12952
@12 // 12953
D=A // 12954
@SP // 12955
AM=M+1 // 12956
A=A-1 // 12957
M=D // 12958
@12 // 12959
D=A // 12960
@SP // 12961
AM=M+1 // 12962
A=A-1 // 12963
M=D // 12964
@12 // 12965
D=A // 12966
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=D // 12970
@12 // 12971
D=A // 12972
@SP // 12973
AM=M+1 // 12974
A=A-1 // 12975
M=D // 12976
@12 // 12977
D=A // 12978
@SP // 12979
AM=M+1 // 12980
A=A-1 // 12981
M=D // 12982
@12 // 12983
D=A // 12984
@SP // 12985
AM=M+1 // 12986
A=A-1 // 12987
M=D // 12988
@SP // 12989
AM=M+1 // 12990
A=A-1 // 12991
M=0 // 12992
@SP // 12993
AM=M+1 // 12994
A=A-1 // 12995
M=0 // 12996
// call Output.create
@17 // 12997
D=A // 12998
@14 // 12999
M=D // 13000
@Output.create // 13001
D=A // 13002
@13 // 13003
M=D // 13004
@Output.init.ret.94 // 13005
D=A // 13006
@CALL // 13007
0;JMP // 13008
(Output.init.ret.94)
@SP // 13009
M=M-1 // 13010

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 13011
D=A // 13012
@SP // 13013
AM=M+1 // 13014
A=A-1 // 13015
M=D // 13016
@7 // 13017
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
@12 // 13035
D=A // 13036
@SP // 13037
AM=M+1 // 13038
A=A-1 // 13039
M=D // 13040
@56 // 13041
D=A // 13042
@SP // 13043
AM=M+1 // 13044
A=A-1 // 13045
M=D // 13046
@12 // 13047
D=A // 13048
@SP // 13049
AM=M+1 // 13050
A=A-1 // 13051
M=D // 13052
@12 // 13053
D=A // 13054
@SP // 13055
AM=M+1 // 13056
A=A-1 // 13057
M=D // 13058
@12 // 13059
D=A // 13060
@SP // 13061
AM=M+1 // 13062
A=A-1 // 13063
M=D // 13064
@7 // 13065
D=A // 13066
@SP // 13067
AM=M+1 // 13068
A=A-1 // 13069
M=D // 13070
@SP // 13071
AM=M+1 // 13072
A=A-1 // 13073
M=0 // 13074
@SP // 13075
AM=M+1 // 13076
A=A-1 // 13077
M=0 // 13078
// call Output.create
@17 // 13079
D=A // 13080
@14 // 13081
M=D // 13082
@Output.create // 13083
D=A // 13084
@13 // 13085
M=D // 13086
@Output.init.ret.95 // 13087
D=A // 13088
@CALL // 13089
0;JMP // 13090
(Output.init.ret.95)
@SP // 13091
M=M-1 // 13092

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13093
D=A // 13094
@SP // 13095
AM=M+1 // 13096
A=A-1 // 13097
M=D // 13098
@38 // 13099
D=A // 13100
@SP // 13101
AM=M+1 // 13102
A=A-1 // 13103
M=D // 13104
@45 // 13105
D=A // 13106
@SP // 13107
AM=M+1 // 13108
A=A-1 // 13109
M=D // 13110
@25 // 13111
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
@SP // 13125
AM=M+1 // 13126
A=A-1 // 13127
M=0 // 13128
@SP // 13129
AM=M+1 // 13130
A=A-1 // 13131
M=0 // 13132
@SP // 13133
AM=M+1 // 13134
A=A-1 // 13135
M=0 // 13136
@SP // 13137
AM=M+1 // 13138
A=A-1 // 13139
M=0 // 13140
@SP // 13141
AM=M+1 // 13142
A=A-1 // 13143
M=0 // 13144
@SP // 13145
AM=M+1 // 13146
A=A-1 // 13147
M=0 // 13148
// call Output.create
@17 // 13149
D=A // 13150
@14 // 13151
M=D // 13152
@Output.create // 13153
D=A // 13154
@13 // 13155
M=D // 13156
@Output.init.ret.96 // 13157
D=A // 13158
@CALL // 13159
0;JMP // 13160
(Output.init.ret.96)
@SP // 13161
M=M-1 // 13162

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13163
M=0 // 13164

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13165
M=0 // 13166

////PushInstruction("constant 0")
@SP // 13167
AM=M+1 // 13168
A=A-1 // 13169
M=0 // 13170
@RETURN // 13171
0;JMP // 13172

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13173
M=M+1 // 13174
AM=M+1 // 13175
A=A-1 // 13176
M=0 // 13177
A=A-1 // 13178
M=0 // 13179

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13180
A=M+1 // 13181
D=M // 13182
@2 // 13183
D=D+A // 13184
@SP // 13185
AM=M+1 // 13186
A=A-1 // 13187
M=D // 13188
D=0 // 13189
@SP // 13190
AM=M-1 // 13191
A=M // 13192
M=D // 13193

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13194
A=M+1 // 13195
D=M // 13196
@3 // 13197
D=D+A // 13198
@SP // 13199
AM=M+1 // 13200
A=A-1 // 13201
M=D // 13202
D=0 // 13203
@SP // 13204
AM=M-1 // 13205
A=M // 13206
M=D // 13207

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
@Memory.add_node.EQ.55 // 13208
D=A // 13209
@SP // 13210
AM=M+1 // 13211
A=A-1 // 13212
M=D // 13213
@ARG // 13214
A=M // 13215
A=M // 13216
D=M // 13217
@DO_EQ // 13218
0;JMP // 13219
(Memory.add_node.EQ.55)
@Memory.add_node$IF_TRUE1 // 13220
D;JNE // 13221

////GotoInstruction{label='Memory.add_node$IF_END1}
// goto Memory.add_node$IF_END1
@Memory.add_node$IF_END1 // 13222
0;JMP // 13223

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
@ARG // 13224
A=M // 13225
D=M // 13226
@0 // 13227
D=D+A // 13228
@SP // 13229
AM=M+1 // 13230
A=A-1 // 13231
M=D // 13232
@ARG // 13233
A=M+1 // 13234
D=M // 13235
@SP // 13236
AM=M-1 // 13237
A=M // 13238
M=D // 13239

////PushInstruction("constant 0")
@SP // 13240
AM=M+1 // 13241
A=A-1 // 13242
M=0 // 13243
@RETURN // 13244
0;JMP // 13245

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

@ARG // 13246
A=M // 13247
A=M // 13248
D=M // 13249
@LCL // 13250
A=M // 13251
M=D // 13252

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13253
A=M+1 // 13254
M=0 // 13255

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
@Memory.add_node.EQ.56 // 13256
D=A // 13257
@SP // 13258
AM=M+1 // 13259
A=A-1 // 13260
M=D // 13261
@LCL // 13262
A=M // 13263
D=M // 13264
@DO_EQ // 13265
0;JMP // 13266
(Memory.add_node.EQ.56)
@SP // 13267
AM=M+1 // 13268
A=A-1 // 13269
M=D // 13270
@SP // 13271
A=M-1 // 13272
M=!D // 13273
@Memory.add_node.GT.57 // 13274
D=A // 13275
@SP // 13276
AM=M+1 // 13277
A=A-1 // 13278
M=D // 13279
@LCL // 13280
A=M // 13281
A=M // 13282
D=M // 13283
@SP // 13284
AM=M+1 // 13285
A=A-1 // 13286
M=D // 13287
@ARG // 13288
A=M+1 // 13289
A=M // 13290
D=M // 13291
@SP // 13292
AM=M-1 // 13293
D=M-D // 13294
@DO_GT // 13295
0;JMP // 13296
(Memory.add_node.GT.57)
D=!D // 13297
@SP // 13298
AM=M-1 // 13299
D=D&M // 13300
D=!D // 13301
@Memory.add_node_WHILE_END1 // 13302
D;JNE // 13303

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13304
A=M // 13305
D=M // 13306
@LCL // 13307
A=M+1 // 13308
M=D // 13309

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

@LCL // 13310
A=M // 13311
D=M // 13312
@LCL // 13313
A=M // 13314
D=M // 13315
@3 // 13316
D=D+A // 13317
A=D // 13318
D=M // 13319
@LCL // 13320
A=M // 13321
M=D // 13322

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13323
0;JMP // 13324

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13325
A=M+1 // 13326
D=!M // 13327
@Memory.add_node$IF_TRUE2 // 13328
D;JNE // 13329

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13330
0;JMP // 13331

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
@ARG // 13332
A=M+1 // 13333
D=M // 13334
@3 // 13335
D=D+A // 13336
@SP // 13337
AM=M+1 // 13338
A=A-1 // 13339
M=D // 13340
@ARG // 13341
A=M // 13342
A=M // 13343
D=M // 13344
@SP // 13345
AM=M-1 // 13346
A=M // 13347
M=D // 13348

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
@ARG // 13349
A=M // 13350
A=M // 13351
D=M // 13352
@2 // 13353
D=D+A // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358
@ARG // 13359
A=M+1 // 13360
D=M // 13361
@SP // 13362
AM=M-1 // 13363
A=M // 13364
M=D // 13365

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13366
A=M // 13367
D=M // 13368
@0 // 13369
D=D+A // 13370
@SP // 13371
AM=M+1 // 13372
A=A-1 // 13373
M=D // 13374
@ARG // 13375
A=M+1 // 13376
D=M // 13377
@SP // 13378
AM=M-1 // 13379
A=M // 13380
M=D // 13381

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13382
0;JMP // 13383

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
@ARG // 13384
A=M+1 // 13385
D=M // 13386
@3 // 13387
D=D+A // 13388
@SP // 13389
AM=M+1 // 13390
A=A-1 // 13391
M=D // 13392
@LCL // 13393
A=M // 13394
D=M // 13395
@SP // 13396
AM=M-1 // 13397
A=M // 13398
M=D // 13399

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13400
A=M+1 // 13401
D=M // 13402
@2 // 13403
D=D+A // 13404
@SP // 13405
AM=M+1 // 13406
A=A-1 // 13407
M=D // 13408
@LCL // 13409
A=M+1 // 13410
D=M // 13411
@SP // 13412
AM=M-1 // 13413
A=M // 13414
M=D // 13415

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13416
A=M // 13417
D=M // 13418
@Memory.add_node$IF_TRUE3 // 13419
D;JNE // 13420

////GotoInstruction{label='Memory.add_node$IF_END3}
// goto Memory.add_node$IF_END3
@Memory.add_node$IF_END3 // 13421
0;JMP // 13422

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
@LCL // 13423
A=M // 13424
D=M // 13425
@2 // 13426
D=D+A // 13427
@SP // 13428
AM=M+1 // 13429
A=A-1 // 13430
M=D // 13431
@ARG // 13432
A=M+1 // 13433
D=M // 13434
@SP // 13435
AM=M-1 // 13436
A=M // 13437
M=D // 13438

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
@LCL // 13439
A=M+1 // 13440
D=M // 13441
@3 // 13442
D=D+A // 13443
@SP // 13444
AM=M+1 // 13445
A=A-1 // 13446
M=D // 13447
@ARG // 13448
A=M+1 // 13449
D=M // 13450
@SP // 13451
AM=M-1 // 13452
A=M // 13453
M=D // 13454

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13455
AM=M+1 // 13456
A=A-1 // 13457
M=0 // 13458
@RETURN // 13459
0;JMP // 13460

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13461
D=A // 13462
@SP // 13463
AM=D+M // 13464
A=A-1 // 13465
M=0 // 13466
A=A-1 // 13467
M=0 // 13468
A=A-1 // 13469
M=0 // 13470
A=A-1 // 13471
M=0 // 13472
A=A-1 // 13473
M=0 // 13474

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13475
A=M // 13476
M=0 // 13477

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13478
A=M+1 // 13479
A=A+1 // 13480
D=M // 13481
@LCL // 13482
A=M+1 // 13483
M=D // 13484

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

@ARG // 13485
A=M+1 // 13486
A=A+1 // 13487
D=M // 13488
D=D-1 // 13489
D=-D // 13490
@LCL // 13491
A=M+1 // 13492
A=A+1 // 13493
M=D // 13494

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
@Screen.drawCircle.GT.58 // 13495
D=A // 13496
@SP // 13497
AM=M+1 // 13498
A=A-1 // 13499
M=D // 13500
@LCL // 13501
A=M+1 // 13502
D=M // 13503
A=A-1 // 13504
D=M-D // 13505
@DO_GT // 13506
0;JMP // 13507
(Screen.drawCircle.GT.58)
@Screen.drawCircle_WHILE_END1 // 13508
D;JNE // 13509

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

@ARG // 13510
A=M // 13511
D=M // 13512
@LCL // 13513
A=M // 13514
D=D-M // 13515
@SP // 13516
AM=M+1 // 13517
A=A-1 // 13518
M=D // 13519
@ARG // 13520
A=M // 13521
D=M // 13522
@LCL // 13523
A=M // 13524
D=D+M // 13525
@SP // 13526
AM=M+1 // 13527
A=A-1 // 13528
M=D // 13529
@ARG // 13530
A=M+1 // 13531
D=M // 13532
@LCL // 13533
A=M+1 // 13534
D=D+M // 13535
@SP // 13536
AM=M+1 // 13537
A=A-1 // 13538
M=D // 13539
// call Screen.drawHorizontalLine
@8 // 13540
D=A // 13541
@14 // 13542
M=D // 13543
@Screen.drawHorizontalLine // 13544
D=A // 13545
@13 // 13546
M=D // 13547
@Screen.drawCircle.ret.0 // 13548
D=A // 13549
@CALL // 13550
0;JMP // 13551
(Screen.drawCircle.ret.0)
@SP // 13552
M=M-1 // 13553

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

@ARG // 13554
A=M // 13555
D=M // 13556
@LCL // 13557
A=M // 13558
D=D-M // 13559
@SP // 13560
AM=M+1 // 13561
A=A-1 // 13562
M=D // 13563
@ARG // 13564
A=M // 13565
D=M // 13566
@LCL // 13567
A=M // 13568
D=D+M // 13569
@SP // 13570
AM=M+1 // 13571
A=A-1 // 13572
M=D // 13573
@ARG // 13574
A=M+1 // 13575
D=M // 13576
@LCL // 13577
A=M+1 // 13578
D=D-M // 13579
@SP // 13580
AM=M+1 // 13581
A=A-1 // 13582
M=D // 13583
// call Screen.drawHorizontalLine
@8 // 13584
D=A // 13585
@14 // 13586
M=D // 13587
@Screen.drawHorizontalLine // 13588
D=A // 13589
@13 // 13590
M=D // 13591
@Screen.drawCircle.ret.1 // 13592
D=A // 13593
@CALL // 13594
0;JMP // 13595
(Screen.drawCircle.ret.1)
@SP // 13596
M=M-1 // 13597

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

@ARG // 13598
A=M // 13599
D=M // 13600
@LCL // 13601
A=M+1 // 13602
D=D-M // 13603
@SP // 13604
AM=M+1 // 13605
A=A-1 // 13606
M=D // 13607
@ARG // 13608
A=M // 13609
D=M // 13610
@LCL // 13611
A=M+1 // 13612
D=D+M // 13613
@SP // 13614
AM=M+1 // 13615
A=A-1 // 13616
M=D // 13617
@ARG // 13618
A=M+1 // 13619
D=M // 13620
@LCL // 13621
A=M // 13622
D=D+M // 13623
@SP // 13624
AM=M+1 // 13625
A=A-1 // 13626
M=D // 13627
// call Screen.drawHorizontalLine
@8 // 13628
D=A // 13629
@14 // 13630
M=D // 13631
@Screen.drawHorizontalLine // 13632
D=A // 13633
@13 // 13634
M=D // 13635
@Screen.drawCircle.ret.2 // 13636
D=A // 13637
@CALL // 13638
0;JMP // 13639
(Screen.drawCircle.ret.2)
@SP // 13640
M=M-1 // 13641

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

@ARG // 13642
A=M // 13643
D=M // 13644
@LCL // 13645
A=M+1 // 13646
D=D-M // 13647
@SP // 13648
AM=M+1 // 13649
A=A-1 // 13650
M=D // 13651
@ARG // 13652
A=M // 13653
D=M // 13654
@LCL // 13655
A=M+1 // 13656
D=D+M // 13657
@SP // 13658
AM=M+1 // 13659
A=A-1 // 13660
M=D // 13661
@ARG // 13662
A=M+1 // 13663
D=M // 13664
@LCL // 13665
A=M // 13666
D=D-M // 13667
@SP // 13668
AM=M+1 // 13669
A=A-1 // 13670
M=D // 13671
// call Screen.drawHorizontalLine
@8 // 13672
D=A // 13673
@14 // 13674
M=D // 13675
@Screen.drawHorizontalLine // 13676
D=A // 13677
@13 // 13678
M=D // 13679
@Screen.drawCircle.ret.3 // 13680
D=A // 13681
@CALL // 13682
0;JMP // 13683
(Screen.drawCircle.ret.3)
@SP // 13684
M=M-1 // 13685

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.59 // 13686
D=A // 13687
@SP // 13688
AM=M+1 // 13689
A=A-1 // 13690
M=D // 13691
@LCL // 13692
A=M+1 // 13693
A=A+1 // 13694
D=M // 13695
@DO_LT // 13696
0;JMP // 13697
(Screen.drawCircle.LT.59)
@Screen.drawCircle$IF_TRUE1 // 13698
D;JNE // 13699

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13700
0;JMP // 13701

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

@LCL // 13702
A=M+1 // 13703
A=A+1 // 13704
D=M // 13705
@SP // 13706
AM=M+1 // 13707
A=A-1 // 13708
M=D // 13709
@LCL // 13710
A=M // 13711
D=M // 13712
D=D+M // 13713
@SP // 13714
AM=M-1 // 13715
D=D+M // 13716
@3 // 13717
D=D+A // 13718
@LCL // 13719
A=M+1 // 13720
A=A+1 // 13721
M=D // 13722

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13723
0;JMP // 13724

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

@LCL // 13725
A=M+1 // 13726
A=A+1 // 13727
D=M // 13728
@SP // 13729
AM=M+1 // 13730
A=A-1 // 13731
M=D // 13732
@LCL // 13733
A=M+1 // 13734
D=M // 13735
A=A-1 // 13736
D=M-D // 13737
@R13 // 13738
M=D // 13739
D=D+M // 13740
@SP // 13741
AM=M-1 // 13742
D=D+M // 13743
@5 // 13744
D=D+A // 13745
@LCL // 13746
A=M+1 // 13747
A=A+1 // 13748
M=D // 13749

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

@LCL // 13750
A=M+1 // 13751
M=M-1 // 13752

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

@LCL // 13753
A=M // 13754
M=M+1 // 13755

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13756
0;JMP // 13757

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13758
AM=M+1 // 13759
A=A-1 // 13760
M=0 // 13761
@RETURN // 13762
0;JMP // 13763

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13764
D=A // 13765
@14 // 13766
M=D // 13767
@Memory.init // 13768
D=A // 13769
@13 // 13770
M=D // 13771
@Sys.init.ret.0 // 13772
D=A // 13773
@CALL // 13774
0;JMP // 13775
(Sys.init.ret.0)
@SP // 13776
M=M-1 // 13777

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13778
D=A // 13779
@14 // 13780
M=D // 13781
@Math.init // 13782
D=A // 13783
@13 // 13784
M=D // 13785
@Sys.init.ret.1 // 13786
D=A // 13787
@CALL // 13788
0;JMP // 13789
(Sys.init.ret.1)
@SP // 13790
M=M-1 // 13791

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13792
D=A // 13793
@14 // 13794
M=D // 13795
@Screen.init // 13796
D=A // 13797
@13 // 13798
M=D // 13799
@Sys.init.ret.2 // 13800
D=A // 13801
@CALL // 13802
0;JMP // 13803
(Sys.init.ret.2)
@SP // 13804
M=M-1 // 13805

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13806
D=A // 13807
@14 // 13808
M=D // 13809
@Output.init // 13810
D=A // 13811
@13 // 13812
M=D // 13813
@Sys.init.ret.3 // 13814
D=A // 13815
@CALL // 13816
0;JMP // 13817
(Sys.init.ret.3)
@SP // 13818
M=M-1 // 13819

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13820
D=A // 13821
@14 // 13822
M=D // 13823
@Keyboard.init // 13824
D=A // 13825
@13 // 13826
M=D // 13827
@Sys.init.ret.4 // 13828
D=A // 13829
@CALL // 13830
0;JMP // 13831
(Sys.init.ret.4)
@SP // 13832
M=M-1 // 13833

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13834
D=A // 13835
@14 // 13836
M=D // 13837
@Main.main // 13838
D=A // 13839
@13 // 13840
M=D // 13841
@Sys.init.ret.5 // 13842
D=A // 13843
@CALL // 13844
0;JMP // 13845
(Sys.init.ret.5)
@SP // 13846
M=M-1 // 13847

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13848
D=A // 13849
@14 // 13850
M=D // 13851
@Sys.halt // 13852
D=A // 13853
@13 // 13854
M=D // 13855
@Sys.init.ret.6 // 13856
D=A // 13857
@CALL // 13858
0;JMP // 13859
(Sys.init.ret.6)
@SP // 13860
M=M-1 // 13861

////PushInstruction("constant 0")
@SP // 13862
AM=M+1 // 13863
A=A-1 // 13864
M=0 // 13865
@RETURN // 13866
0;JMP // 13867

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13868
A=M // 13869
D=M // 13870
@Screen.0 // 13871
M=D // 13872

////PushInstruction("constant 0")
@SP // 13873
AM=M+1 // 13874
A=A-1 // 13875
M=0 // 13876
@RETURN // 13877
0;JMP // 13878

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 13879
M=M+1 // 13880
AM=M+1 // 13881
A=A-1 // 13882
M=0 // 13883
A=A-1 // 13884
M=0 // 13885

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13886
A=M // 13887
M=1 // 13888

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13889
A=M+1 // 13890
M=0 // 13891

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 13892
D=A // 13893
@SP // 13894
AM=M+1 // 13895
A=A-1 // 13896
M=D // 13897
// call Memory.alloc
@6 // 13898
D=A // 13899
@14 // 13900
M=D // 13901
@Memory.alloc // 13902
D=A // 13903
@13 // 13904
M=D // 13905
@Math.init.ret.0 // 13906
D=A // 13907
@CALL // 13908
0;JMP // 13909
(Math.init.ret.0)
@SP // 13910
AM=M-1 // 13911
D=M // 13912
@Math.0 // 13913
M=D // 13914

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
@Math.init.LT.60 // 13915
D=A // 13916
@SP // 13917
AM=M+1 // 13918
A=A-1 // 13919
M=D // 13920
@LCL // 13921
A=M+1 // 13922
D=M // 13923
@16 // 13924
D=D-A // 13925
@DO_LT // 13926
0;JMP // 13927
(Math.init.LT.60)
D=!D // 13928
@Math.init_WHILE_END1 // 13929
D;JNE // 13930

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 13931
D=M // 13932
@LCL // 13933
A=M+1 // 13934
D=D+M // 13935
@SP // 13936
AM=M+1 // 13937
A=A-1 // 13938
M=D // 13939
@LCL // 13940
A=M // 13941
D=M // 13942
@SP // 13943
AM=M-1 // 13944
A=M // 13945
M=D // 13946

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

@LCL // 13947
A=M // 13948
D=M // 13949
@LCL // 13950
A=M // 13951
M=D+M // 13952

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

@LCL // 13953
A=M+1 // 13954
M=M+1 // 13955

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 13956
0;JMP // 13957

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13958
AM=M+1 // 13959
A=A-1 // 13960
M=0 // 13961
@RETURN // 13962
0;JMP // 13963

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 13964
M=M+1 // 13965
AM=M+1 // 13966
A=A-1 // 13967
M=0 // 13968
A=A-1 // 13969
M=0 // 13970

////PushPopPair {
//  push: PushInstruction("constant 2055")
//  pop:  PopInstruction{address=local 0}
//}

@2055 // 13971
D=A // 13972
@LCL // 13973
A=M // 13974
M=D // 13975

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
@LCL // 13976
A=M // 13977
D=M // 13978
@0 // 13979
D=D+A // 13980
@SP // 13981
AM=M+1 // 13982
A=A-1 // 13983
M=D // 13984
@LCL // 13985
A=M // 13986
D=M // 13987
@16384 // 13988
D=A-D // 13989
@5 // 13990
D=D-A // 13991
@SP // 13992
AM=M-1 // 13993
A=M // 13994
M=D // 13995

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13996
A=M // 13997
D=M // 13998
D=D+1 // 13999
@SP // 14000
AM=M+1 // 14001
A=A-1 // 14002
M=D // 14003
D=1 // 14004
@SP // 14005
AM=M-1 // 14006
A=M // 14007
M=D // 14008

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 14009
A=M // 14010
D=M // 14011
@2 // 14012
D=D+A // 14013
@SP // 14014
AM=M+1 // 14015
A=A-1 // 14016
M=D // 14017
D=0 // 14018
@SP // 14019
AM=M-1 // 14020
A=M // 14021
M=D // 14022

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 14023
A=M // 14024
D=M // 14025
@3 // 14026
D=D+A // 14027
@SP // 14028
AM=M+1 // 14029
A=A-1 // 14030
M=D // 14031
D=0 // 14032
@SP // 14033
AM=M-1 // 14034
A=M // 14035
M=D // 14036

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 14037
A=M // 14038
D=M // 14039
@SP // 14040
AM=M+1 // 14041
A=A-1 // 14042
M=D // 14043
// call Memory.create_foot
@6 // 14044
D=A // 14045
@14 // 14046
M=D // 14047
@Memory.create_foot // 14048
D=A // 14049
@13 // 14050
M=D // 14051
@Memory.init.ret.0 // 14052
D=A // 14053
@CALL // 14054
0;JMP // 14055
(Memory.init.ret.0)
@SP // 14056
M=M-1 // 14057

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2054"), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 14058
D=A // 14059
@SP // 14060
AM=M+1 // 14061
A=A-1 // 14062
M=D // 14063
@LCL // 14064
A=M // 14065
D=M // 14066
@SP // 14067
AM=M+1 // 14068
A=A-1 // 14069
M=D // 14070
// call Memory.add_node
@7 // 14071
D=A // 14072
@14 // 14073
M=D // 14074
@Memory.add_node // 14075
D=A // 14076
@13 // 14077
M=D // 14078
@Memory.init.ret.1 // 14079
D=A // 14080
@CALL // 14081
0;JMP // 14082
(Memory.init.ret.1)
@SP // 14083
M=M-1 // 14084

////PushInstruction("constant 0")
@SP // 14085
AM=M+1 // 14086
A=A-1 // 14087
M=0 // 14088
@RETURN // 14089
0;JMP // 14090

