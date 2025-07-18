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
A=M // 221
D=M // 222
@LCL // 223
A=M // 224
M=D // 225

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
@Memory.get_best_fit.LT.2 // 226
D=A // 227
@SP // 228
AM=M+1 // 229
A=A-1 // 230
M=D // 231
@LCL // 232
A=M // 233
A=M // 234
D=M // 235
@SP // 236
AM=M+1 // 237
A=A-1 // 238
M=D // 239
@ARG // 240
A=M+1 // 241
D=M // 242
@SP // 243
AM=M-1 // 244
D=M-D // 245
@DO_LT // 246
0;JMP // 247
(Memory.get_best_fit.LT.2)
D=!D // 248
@Memory.get_best_fit$IF_TRUE1 // 249
D;JNE // 250

////GotoInstruction{label='Memory.get_best_fit$IF_END1}
// goto Memory.get_best_fit$IF_END1
@Memory.get_best_fit$IF_END1 // 251
0;JMP // 252

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE1}
// label Memory.get_best_fit$IF_TRUE1
(Memory.get_best_fit$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 253
A=M // 254
D=M // 255
@SP // 256
AM=M+1 // 257
A=A-1 // 258
M=D // 259
@RETURN // 260
0;JMP // 261

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
@Memory.get_best_fit.EQ.3 // 262
D=A // 263
@SP // 264
AM=M+1 // 265
A=A-1 // 266
M=D // 267
@LCL // 268
A=M // 269
D=M // 270
@LCL // 271
A=M // 272
D=M // 273
@3 // 274
D=D+A // 275
A=D // 276
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
@LCL // 285
A=M // 286
D=M // 287
@3 // 288
D=D+A // 289
A=D // 290
D=M // 291
@LCL // 292
A=M // 293
M=D // 294

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
@Memory.get_best_fit.LT.4 // 295
D=A // 296
@SP // 297
AM=M+1 // 298
A=A-1 // 299
M=D // 300
@LCL // 301
A=M // 302
A=M // 303
D=M // 304
@SP // 305
AM=M+1 // 306
A=A-1 // 307
M=D // 308
@ARG // 309
A=M+1 // 310
D=M // 311
@SP // 312
AM=M-1 // 313
D=M-D // 314
@DO_LT // 315
0;JMP // 316
(Memory.get_best_fit.LT.4)
D=!D // 317
@Memory.get_best_fit$IF_TRUE2 // 318
D;JNE // 319

////GotoInstruction{label='Memory.get_best_fit$IF_END2}
// goto Memory.get_best_fit$IF_END2
@Memory.get_best_fit$IF_END2 // 320
0;JMP // 321

////LabelInstruction{label='Memory.get_best_fit$IF_TRUE2}
// label Memory.get_best_fit$IF_TRUE2
(Memory.get_best_fit$IF_TRUE2)

////PushInstruction("local 0")
@LCL // 322
A=M // 323
D=M // 324
@SP // 325
AM=M+1 // 326
A=A-1 // 327
M=D // 328
@RETURN // 329
0;JMP // 330

////LabelInstruction{label='Memory.get_best_fit$IF_END2}
// label Memory.get_best_fit$IF_END2
(Memory.get_best_fit$IF_END2)

////GotoInstruction{label='Memory.get_best_fit_WHILE_EXP1}
// goto Memory.get_best_fit_WHILE_EXP1
@Memory.get_best_fit_WHILE_EXP1 // 331
0;JMP // 332

////LabelInstruction{label='Memory.get_best_fit_WHILE_END1}
// label Memory.get_best_fit_WHILE_END1
(Memory.get_best_fit_WHILE_END1)

////PushInstruction("constant 0")
@SP // 333
AM=M+1 // 334
A=A-1 // 335
M=0 // 336
@RETURN // 337
0;JMP // 338

////FunctionInstruction{functionName='String.appendChar', numLocals=1, funcMapping={String.dispose=1}}
// function String.appendChar with 1
(String.appendChar)
@SP // 339
AM=M+1 // 340
A=A-1 // 341
M=0 // 342

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 343
A=M // 344
D=M // 345
@3 // 346
M=D // 347

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("this 1"),
//    right:
//        PushInstruction("this 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.appendChar$IF_TRUE1}}
@String.appendChar.EQ.5 // 348
D=A // 349
@SP // 350
AM=M+1 // 351
A=A-1 // 352
M=D // 353
@THIS // 354
A=M+1 // 355
A=A+1 // 356
D=M // 357
A=A-1 // 358
D=M-D // 359
@DO_EQ // 360
0;JMP // 361
(String.appendChar.EQ.5)
@String.appendChar$IF_TRUE1 // 362
D;JNE // 363

////GotoInstruction{label='String.appendChar$IF_END1}
// goto String.appendChar$IF_END1
@String.appendChar$IF_END1 // 364
0;JMP // 365

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

@THIS // 366
A=M+1 // 367
A=A+1 // 368
D=M // 369
D=D+M // 370
@SP // 371
AM=M+1 // 372
A=A-1 // 373
M=D // 374
// call Memory.alloc
@6 // 375
D=A // 376
@14 // 377
M=D // 378
@Memory.alloc // 379
D=A // 380
@13 // 381
M=D // 382
@String.appendChar.ret.0 // 383
D=A // 384
@CALL // 385
0;JMP // 386
(String.appendChar.ret.0)
@SP // 387
AM=M-1 // 388
D=M // 389
@LCL // 390
A=M // 391
M=D // 392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0"), PushInstruction("local 0"), PushInstruction("this 1")], call=CallInstruction{Memory.copy}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 393
A=M // 394
D=M // 395
@SP // 396
AM=M+1 // 397
A=A-1 // 398
M=D // 399
@LCL // 400
A=M // 401
D=M // 402
@SP // 403
AM=M+1 // 404
A=A-1 // 405
M=D // 406
@THIS // 407
A=M+1 // 408
D=M // 409
@SP // 410
AM=M+1 // 411
A=A-1 // 412
M=D // 413
// call Memory.copy
@8 // 414
D=A // 415
@14 // 416
M=D // 417
@Memory.copy // 418
D=A // 419
@13 // 420
M=D // 421
@String.appendChar.ret.1 // 422
D=A // 423
@CALL // 424
0;JMP // 425
(String.appendChar.ret.1)
@SP // 426
M=M-1 // 427

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("this 0")], call=CallInstruction{Memory.deAlloc}}
//  pop:  PopInstruction{address=temp 0}
//}

@THIS // 428
A=M // 429
D=M // 430
@SP // 431
AM=M+1 // 432
A=A-1 // 433
M=D // 434
// call Memory.deAlloc
@6 // 435
D=A // 436
@14 // 437
M=D // 438
@Memory.deAlloc // 439
D=A // 440
@13 // 441
M=D // 442
@String.appendChar.ret.2 // 443
D=A // 444
@CALL // 445
0;JMP // 446
(String.appendChar.ret.2)
@SP // 447
M=M-1 // 448

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

@THIS // 449
A=M+1 // 450
A=A+1 // 451
D=M // 452
@THIS // 453
A=M+1 // 454
A=A+1 // 455
M=D+M // 456

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=this 0}
//}

@LCL // 457
A=M // 458
D=M // 459
@THIS // 460
A=M // 461
M=D // 462

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
@THIS // 463
A=M+1 // 464
D=M // 465
A=A-1 // 466
D=D+M // 467
@SP // 468
AM=M+1 // 469
A=A-1 // 470
M=D // 471
@ARG // 472
A=M+1 // 473
D=M // 474
@SP // 475
AM=M-1 // 476
A=M // 477
M=D // 478

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

@THIS // 479
A=M+1 // 480
M=M+1 // 481

////PushInstruction("pointer 0")
@3 // 482
D=M // 483
@SP // 484
AM=M+1 // 485
A=A-1 // 486
M=D // 487
@RETURN // 488
0;JMP // 489

////FunctionInstruction{functionName='Screen.drawHorizontalLine', numLocals=1, funcMapping={}}
// function Screen.drawHorizontalLine with 1
(Screen.drawHorizontalLine)
@SP // 490
AM=M+1 // 491
A=A-1 // 492
M=0 // 493

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 494
A=M // 495
D=M // 496
@LCL // 497
A=M // 498
M=D // 499

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
@Screen.drawHorizontalLine.GT.6 // 500
D=A // 501
@SP // 502
AM=M+1 // 503
A=A-1 // 504
M=D // 505
@LCL // 506
A=M // 507
D=M // 508
@ARG // 509
A=M+1 // 510
D=D-M // 511
@DO_GT // 512
0;JMP // 513
(Screen.drawHorizontalLine.GT.6)
@Screen.drawHorizontalLine_WHILE_END1 // 514
D;JNE // 515

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("argument 2")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 516
A=M // 517
D=M // 518
@SP // 519
AM=M+1 // 520
A=A-1 // 521
M=D // 522
@ARG // 523
A=M+1 // 524
A=A+1 // 525
D=M // 526
@SP // 527
AM=M+1 // 528
A=A-1 // 529
M=D // 530
// call Screen.drawPixel
@7 // 531
D=A // 532
@14 // 533
M=D // 534
@Screen.drawPixel // 535
D=A // 536
@13 // 537
M=D // 538
@Screen.drawHorizontalLine.ret.0 // 539
D=A // 540
@CALL // 541
0;JMP // 542
(Screen.drawHorizontalLine.ret.0)
@SP // 543
M=M-1 // 544

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

@LCL // 545
A=M // 546
M=M+1 // 547

////GotoInstruction{label='Screen.drawHorizontalLine_WHILE_EXP1}
// goto Screen.drawHorizontalLine_WHILE_EXP1
@Screen.drawHorizontalLine_WHILE_EXP1 // 548
0;JMP // 549

////LabelInstruction{label='Screen.drawHorizontalLine_WHILE_END1}
// label Screen.drawHorizontalLine_WHILE_END1
(Screen.drawHorizontalLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 550
AM=M+1 // 551
A=A-1 // 552
M=0 // 553
@RETURN // 554
0;JMP // 555

////FunctionInstruction{functionName='Screen.drawRectangle', numLocals=10, funcMapping={Screen.drawHorizontalLine=1}}
// function Screen.drawRectangle with 10
(Screen.drawRectangle)
@10 // 556
D=A // 557
@SP // 558
AM=D+M // 559
A=A-1 // 560
M=0 // 561
A=A-1 // 562
M=0 // 563
A=A-1 // 564
M=0 // 565
A=A-1 // 566
M=0 // 567
A=A-1 // 568
M=0 // 569
A=A-1 // 570
M=0 // 571
A=A-1 // 572
M=0 // 573
A=A-1 // 574
M=0 // 575
A=A-1 // 576
M=0 // 577
A=A-1 // 578
M=0 // 579

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 580
D=M // 581
@9 // 582
A=D+A // 583
M=-1 // 584

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("static 0"),
//NOT), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE1}}
@Screen.0 // 585
D=!M // 586
@Screen.drawRectangle$IF_TRUE1 // 587
D;JNE // 588

////GotoInstruction{label='Screen.drawRectangle$IF_END1}
// goto Screen.drawRectangle$IF_END1
@Screen.drawRectangle$IF_END1 // 589
0;JMP // 590

////LabelInstruction{label='Screen.drawRectangle$IF_TRUE1}
// label Screen.drawRectangle$IF_TRUE1
(Screen.drawRectangle$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 9}
//}

@LCL // 591
D=M // 592
@9 // 593
A=D+A // 594
M=0 // 595

////LabelInstruction{label='Screen.drawRectangle$IF_END1}
// label Screen.drawRectangle$IF_END1
(Screen.drawRectangle$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 1")
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 596
A=M+1 // 597
D=M // 598
@LCL // 599
A=M // 600
M=D // 601

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
@Screen.drawRectangle.GT.7 // 602
D=A // 603
@SP // 604
AM=M+1 // 605
A=A-1 // 606
M=D // 607
@LCL // 608
A=M // 609
D=M // 610
@ARG // 611
A=M+1 // 612
A=A+1 // 613
A=A+1 // 614
D=D-M // 615
@DO_GT // 616
0;JMP // 617
(Screen.drawRectangle.GT.7)
@Screen.drawRectangle_WHILE_END1 // 618
D;JNE // 619

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 620
A=M // 621
D=M // 622
@SP // 623
AM=M+1 // 624
A=A-1 // 625
M=D // 626
@16 // 627
D=A // 628
@SP // 629
AM=M+1 // 630
A=A-1 // 631
M=D // 632
// call Math.divide
@7 // 633
D=A // 634
@14 // 635
M=D // 636
@Math.divide // 637
D=A // 638
@13 // 639
M=D // 640
@Screen.drawRectangle.ret.0 // 641
D=A // 642
@CALL // 643
0;JMP // 644
(Screen.drawRectangle.ret.0)
@SP // 645
AM=M-1 // 646
D=M // 647
@LCL // 648
A=M+1 // 649
M=D // 650

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 2"), PushInstruction("constant 16")], call=CallInstruction{Math.divide}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 651
A=M+1 // 652
A=A+1 // 653
D=M // 654
@SP // 655
AM=M+1 // 656
A=A-1 // 657
M=D // 658
@16 // 659
D=A // 660
@SP // 661
AM=M+1 // 662
A=A-1 // 663
M=D // 664
// call Math.divide
@7 // 665
D=A // 666
@14 // 667
M=D // 668
@Math.divide // 669
D=A // 670
@13 // 671
M=D // 672
@Screen.drawRectangle.ret.1 // 673
D=A // 674
@CALL // 675
0;JMP // 676
(Screen.drawRectangle.ret.1)
@SP // 677
AM=M-1 // 678
D=M // 679
@LCL // 680
A=M+1 // 681
A=A+1 // 682
M=D // 683

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

@ARG // 684
A=M // 685
D=M // 686
@15 // 687
D=D&A // 688
@LCL // 689
A=M+1 // 690
A=A+1 // 691
A=A+1 // 692
M=D // 693

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

@ARG // 694
A=M+1 // 695
A=A+1 // 696
D=M // 697
@15 // 698
D=D&A // 699
@SP // 700
AM=M+1 // 701
A=A-1 // 702
M=D // 703
@LCL // 704
D=M // 705
@4 // 706
A=D+A // 707
D=A // 708
@R13 // 709
M=D // 710
@SP // 711
AM=M-1 // 712
D=M // 713
@R13 // 714
A=M // 715
M=D // 716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0"), PushInstruction("constant 32")], call=CallInstruction{Math.multiply}}
//  pop:  PopInstruction{address=local 5}
//}

@LCL // 717
A=M // 718
D=M // 719
@SP // 720
AM=M+1 // 721
A=A-1 // 722
M=D // 723
@32 // 724
D=A // 725
@SP // 726
AM=M+1 // 727
A=A-1 // 728
M=D // 729
// call Math.multiply
@7 // 730
D=A // 731
@14 // 732
M=D // 733
@Math.multiply // 734
D=A // 735
@13 // 736
M=D // 737
@Screen.drawRectangle.ret.2 // 738
D=A // 739
@CALL // 740
0;JMP // 741
(Screen.drawRectangle.ret.2)
@LCL // 742
D=M // 743
@5 // 744
A=D+A // 745
D=A // 746
@R13 // 747
M=D // 748
@SP // 749
AM=M-1 // 750
D=M // 751
@R13 // 752
A=M // 753
M=D // 754

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 1"),
//    right:
//        PushInstruction("local 2"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE2}}
@Screen.drawRectangle.EQ.8 // 755
D=A // 756
@SP // 757
AM=M+1 // 758
A=A-1 // 759
M=D // 760
@LCL // 761
A=M+1 // 762
A=A+1 // 763
D=M // 764
A=A-1 // 765
D=M-D // 766
@DO_EQ // 767
0;JMP // 768
(Screen.drawRectangle.EQ.8)
@Screen.drawRectangle$IF_TRUE2 // 769
D;JNE // 770

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE2}
// goto Screen.drawRectangle$IF_FALSE2
@Screen.drawRectangle$IF_FALSE2 // 771
0;JMP // 772

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

@LCL // 773
D=M // 774
@4 // 775
A=D+A // 776
D=M // 777
@SP // 778
AM=M+1 // 779
A=A-1 // 780
M=D+1 // 781
// call Math.twoToThe
@6 // 782
D=A // 783
@14 // 784
M=D // 785
@Math.twoToThe // 786
D=A // 787
@13 // 788
M=D // 789
@Screen.drawRectangle.ret.3 // 790
D=A // 791
@CALL // 792
0;JMP // 793
(Screen.drawRectangle.ret.3)
@SP // 794
AM=M-1 // 795
D=M // 796
D=D-1 // 797
@SP // 798
AM=M+1 // 799
A=A-1 // 800
M=D // 801
@LCL // 802
A=M+1 // 803
A=A+1 // 804
A=A+1 // 805
D=M // 806
@SP // 807
AM=M+1 // 808
A=A-1 // 809
M=D // 810
// call Math.twoToThe
@6 // 811
D=A // 812
@14 // 813
M=D // 814
@Math.twoToThe // 815
D=A // 816
@13 // 817
M=D // 818
@Screen.drawRectangle.ret.4 // 819
D=A // 820
@CALL // 821
0;JMP // 822
(Screen.drawRectangle.ret.4)
@SP // 823
AM=M-1 // 824
D=M // 825
D=D-1 // 826
@SP // 827
AM=M-1 // 828
D=M-D // 829
@SP // 830
AM=M+1 // 831
A=A-1 // 832
M=D // 833
@LCL // 834
D=M // 835
@6 // 836
A=D+A // 837
D=A // 838
@R13 // 839
M=D // 840
@SP // 841
AM=M-1 // 842
D=M // 843
@R13 // 844
A=M // 845
M=D // 846

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

@LCL // 847
D=M // 848
@5 // 849
A=D+A // 850
D=M // 851
@SP // 852
AM=M+1 // 853
A=A-1 // 854
M=D // 855
@LCL // 856
A=M+1 // 857
D=M // 858
@SP // 859
AM=M-1 // 860
D=D+M // 861
@SP // 862
AM=M+1 // 863
A=A-1 // 864
M=D // 865
@LCL // 866
D=M // 867
@7 // 868
A=D+A // 869
D=A // 870
@R13 // 871
M=D // 872
@SP // 873
AM=M-1 // 874
D=M // 875
@R13 // 876
A=M // 877
M=D // 878

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE3}}
@Screen.0 // 879
D=M // 880
@Screen.drawRectangle$IF_TRUE3 // 881
D;JNE // 882

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE3}
// goto Screen.drawRectangle$IF_FALSE3
@Screen.drawRectangle$IF_FALSE3 // 883
0;JMP // 884

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
@LCL // 885
D=M // 886
@7 // 887
A=D+A // 888
D=M // 889
@16384 // 890
D=D+A // 891
@SP // 892
AM=M+1 // 893
A=A-1 // 894
M=D // 895
@LCL // 896
D=M // 897
@7 // 898
A=D+A // 899
D=M // 900
@LCL // 901
D=M // 902
@7 // 903
A=D+A // 904
D=M // 905
@16384 // 906
D=D+A // 907
A=D // 908
D=M // 909
@SP // 910
AM=M+1 // 911
A=A-1 // 912
M=D // 913
@LCL // 914
D=M // 915
@6 // 916
A=D+A // 917
D=M // 918
@SP // 919
AM=M-1 // 920
D=D|M // 921
@SP // 922
AM=M-1 // 923
A=M // 924
M=D // 925

////GotoInstruction{label='Screen.drawRectangle$IF_END3}
// goto Screen.drawRectangle$IF_END3
@Screen.drawRectangle$IF_END3 // 926
0;JMP // 927

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
@LCL // 928
D=M // 929
@7 // 930
A=D+A // 931
D=M // 932
@16384 // 933
D=D+A // 934
@SP // 935
AM=M+1 // 936
A=A-1 // 937
M=D // 938
@LCL // 939
D=M // 940
@7 // 941
A=D+A // 942
D=M // 943
@LCL // 944
D=M // 945
@7 // 946
A=D+A // 947
D=M // 948
@16384 // 949
D=D+A // 950
A=D // 951
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
@LCL // 1070
D=M // 1071
@7 // 1072
A=D+A // 1073
D=M // 1074
@16384 // 1075
D=D+A // 1076
A=D // 1077
D=M // 1078
@SP // 1079
AM=M+1 // 1080
A=A-1 // 1081
M=D // 1082
@LCL // 1083
D=M // 1084
@6 // 1085
A=D+A // 1086
D=M // 1087
@SP // 1088
AM=M-1 // 1089
D=D|M // 1090
@SP // 1091
AM=M-1 // 1092
A=M // 1093
M=D // 1094

////GotoInstruction{label='Screen.drawRectangle$IF_END4}
// goto Screen.drawRectangle$IF_END4
@Screen.drawRectangle$IF_END4 // 1095
0;JMP // 1096

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
@LCL // 1097
D=M // 1098
@7 // 1099
A=D+A // 1100
D=M // 1101
@16384 // 1102
D=D+A // 1103
@SP // 1104
AM=M+1 // 1105
A=A-1 // 1106
M=D // 1107
@LCL // 1108
D=M // 1109
@7 // 1110
A=D+A // 1111
D=M // 1112
@LCL // 1113
D=M // 1114
@7 // 1115
A=D+A // 1116
D=M // 1117
@16384 // 1118
D=D+A // 1119
A=D // 1120
D=M // 1121
@SP // 1122
AM=M+1 // 1123
A=A-1 // 1124
M=D // 1125
@LCL // 1126
D=M // 1127
@6 // 1128
A=D+A // 1129
D=!M // 1130
@SP // 1131
AM=M-1 // 1132
D=D&M // 1133
@SP // 1134
AM=M-1 // 1135
A=M // 1136
M=D // 1137

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

@LCL // 1138
A=M+1 // 1139
D=M // 1140
@SP // 1141
AM=M+1 // 1142
A=A-1 // 1143
M=D+1 // 1144
@LCL // 1145
D=M // 1146
@8 // 1147
A=D+A // 1148
D=A // 1149
@R13 // 1150
M=D // 1151
@SP // 1152
AM=M-1 // 1153
D=M // 1154
@R13 // 1155
A=M // 1156
M=D // 1157

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
@Screen.drawRectangle.LT.9 // 1158
D=A // 1159
@SP // 1160
AM=M+1 // 1161
A=A-1 // 1162
M=D // 1163
@LCL // 1164
D=M // 1165
@8 // 1166
A=D+A // 1167
D=M // 1168
@SP // 1169
AM=M+1 // 1170
A=A-1 // 1171
M=D // 1172
@LCL // 1173
A=M+1 // 1174
A=A+1 // 1175
D=M // 1176
@SP // 1177
AM=M-1 // 1178
D=M-D // 1179
@DO_LT // 1180
0;JMP // 1181
(Screen.drawRectangle.LT.9)
D=!D // 1182
@Screen.drawRectangle_WHILE_END2 // 1183
D;JNE // 1184

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

@LCL // 1185
D=M // 1186
@8 // 1187
A=D+A // 1188
D=M // 1189
A=A-1 // 1190
A=A-1 // 1191
A=A-1 // 1192
D=D+M // 1193
@SP // 1194
AM=M+1 // 1195
A=A-1 // 1196
M=D // 1197
@LCL // 1198
D=M // 1199
@7 // 1200
A=D+A // 1201
D=A // 1202
@R13 // 1203
M=D // 1204
@SP // 1205
AM=M-1 // 1206
D=M // 1207
@R13 // 1208
A=M // 1209
M=D // 1210

////PushWriter{source=PushInstruction("local 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("constant 16384"),
//    right:
//        PushInstruction("local 7"),
//    binaryOp: "ADD"
//)}
@LCL // 1211
D=M // 1212
@7 // 1213
A=D+A // 1214
D=M // 1215
@16384 // 1216
D=D+A // 1217
@SP // 1218
AM=M+1 // 1219
A=A-1 // 1220
M=D // 1221
@LCL // 1222
D=M // 1223
@9 // 1224
A=D+A // 1225
D=M // 1226
@SP // 1227
AM=M-1 // 1228
A=M // 1229
M=D // 1230

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

@LCL // 1231
D=M // 1232
@8 // 1233
A=D+A // 1234
M=M+1 // 1235

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP2}
// goto Screen.drawRectangle_WHILE_EXP2
@Screen.drawRectangle_WHILE_EXP2 // 1236
0;JMP // 1237

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

@LCL // 1238
D=M // 1239
@4 // 1240
A=D+A // 1241
D=M // 1242
@SP // 1243
AM=M+1 // 1244
A=A-1 // 1245
M=D+1 // 1246
// call Math.twoToThe
@6 // 1247
D=A // 1248
@14 // 1249
M=D // 1250
@Math.twoToThe // 1251
D=A // 1252
@13 // 1253
M=D // 1254
@Screen.drawRectangle.ret.6 // 1255
D=A // 1256
@CALL // 1257
0;JMP // 1258
(Screen.drawRectangle.ret.6)
@SP // 1259
AM=M-1 // 1260
D=M // 1261
D=D-1 // 1262
@SP // 1263
AM=M+1 // 1264
A=A-1 // 1265
M=D // 1266
@LCL // 1267
D=M // 1268
@6 // 1269
A=D+A // 1270
D=A // 1271
@R13 // 1272
M=D // 1273
@SP // 1274
AM=M-1 // 1275
D=M // 1276
@R13 // 1277
A=M // 1278
M=D // 1279

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

@LCL // 1280
D=M // 1281
@5 // 1282
A=D+A // 1283
D=M // 1284
A=A-1 // 1285
A=A-1 // 1286
A=A-1 // 1287
D=D+M // 1288
@SP // 1289
AM=M+1 // 1290
A=A-1 // 1291
M=D // 1292
@LCL // 1293
D=M // 1294
@7 // 1295
A=D+A // 1296
D=A // 1297
@R13 // 1298
M=D // 1299
@SP // 1300
AM=M-1 // 1301
D=M // 1302
@R13 // 1303
A=M // 1304
M=D // 1305

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawRectangle$IF_TRUE5}}
@Screen.0 // 1306
D=M // 1307
@Screen.drawRectangle$IF_TRUE5 // 1308
D;JNE // 1309

////GotoInstruction{label='Screen.drawRectangle$IF_FALSE5}
// goto Screen.drawRectangle$IF_FALSE5
@Screen.drawRectangle$IF_FALSE5 // 1310
0;JMP // 1311

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
@LCL // 1312
D=M // 1313
@7 // 1314
A=D+A // 1315
D=M // 1316
@16384 // 1317
D=D+A // 1318
@SP // 1319
AM=M+1 // 1320
A=A-1 // 1321
M=D // 1322
@LCL // 1323
D=M // 1324
@7 // 1325
A=D+A // 1326
D=M // 1327
@LCL // 1328
D=M // 1329
@7 // 1330
A=D+A // 1331
D=M // 1332
@16384 // 1333
D=D+A // 1334
A=D // 1335
D=M // 1336
@SP // 1337
AM=M+1 // 1338
A=A-1 // 1339
M=D // 1340
@LCL // 1341
D=M // 1342
@6 // 1343
A=D+A // 1344
D=M // 1345
@SP // 1346
AM=M-1 // 1347
D=D|M // 1348
@SP // 1349
AM=M-1 // 1350
A=M // 1351
M=D // 1352

////GotoInstruction{label='Screen.drawRectangle$IF_END5}
// goto Screen.drawRectangle$IF_END5
@Screen.drawRectangle$IF_END5 // 1353
0;JMP // 1354

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
@LCL // 1355
D=M // 1356
@7 // 1357
A=D+A // 1358
D=M // 1359
@16384 // 1360
D=D+A // 1361
@SP // 1362
AM=M+1 // 1363
A=A-1 // 1364
M=D // 1365
@LCL // 1366
D=M // 1367
@7 // 1368
A=D+A // 1369
D=M // 1370
@LCL // 1371
D=M // 1372
@7 // 1373
A=D+A // 1374
D=M // 1375
@16384 // 1376
D=D+A // 1377
A=D // 1378
D=M // 1379
@SP // 1380
AM=M+1 // 1381
A=A-1 // 1382
M=D // 1383
@LCL // 1384
D=M // 1385
@6 // 1386
A=D+A // 1387
D=!M // 1388
@SP // 1389
AM=M-1 // 1390
D=D&M // 1391
@SP // 1392
AM=M-1 // 1393
A=M // 1394
M=D // 1395

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

@LCL // 1396
A=M // 1397
M=M+1 // 1398

////GotoInstruction{label='Screen.drawRectangle_WHILE_EXP1}
// goto Screen.drawRectangle_WHILE_EXP1
@Screen.drawRectangle_WHILE_EXP1 // 1399
0;JMP // 1400

////LabelInstruction{label='Screen.drawRectangle_WHILE_END1}
// label Screen.drawRectangle_WHILE_END1
(Screen.drawRectangle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 1401
AM=M+1 // 1402
A=A-1 // 1403
M=0 // 1404
@RETURN // 1405
0;JMP // 1406

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
@Output.getMap.LT.10 // 1407
D=A // 1408
@SP // 1409
AM=M+1 // 1410
A=A-1 // 1411
M=D // 1412
@ARG // 1413
A=M // 1414
D=M // 1415
@32 // 1416
D=D-A // 1417
@DO_LT // 1418
0;JMP // 1419
(Output.getMap.LT.10)
@SP // 1420
AM=M+1 // 1421
A=A-1 // 1422
M=D // 1423
@Output.getMap.GT.11 // 1424
D=A // 1425
@SP // 1426
AM=M+1 // 1427
A=A-1 // 1428
M=D // 1429
@ARG // 1430
A=M // 1431
D=M // 1432
@126 // 1433
D=D-A // 1434
@DO_GT // 1435
0;JMP // 1436
(Output.getMap.GT.11)
@SP // 1437
AM=M-1 // 1438
D=D|M // 1439
@Output.getMap$IF_TRUE1 // 1440
D;JNE // 1441

////GotoInstruction{label='Output.getMap$IF_END1}
// goto Output.getMap$IF_END1
@Output.getMap$IF_END1 // 1442
0;JMP // 1443

////LabelInstruction{label='Output.getMap$IF_TRUE1}
// label Output.getMap$IF_TRUE1
(Output.getMap$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=argument 0}
//}

@ARG // 1444
A=M // 1445
M=0 // 1446

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
@Output.0 // 1447
D=M // 1448
@ARG // 1449
A=M // 1450
A=D+M // 1451
D=M // 1452
@SP // 1453
AM=M+1 // 1454
A=A-1 // 1455
M=D // 1456
@RETURN // 1457
0;JMP // 1458

////FunctionInstruction{functionName='Screen.drawPixel', numLocals=2, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7}}
// function Screen.drawPixel with 2
(Screen.drawPixel)
@SP // 1459
M=M+1 // 1460
AM=M+1 // 1461
A=A-1 // 1462
M=0 // 1463
A=A-1 // 1464
M=0 // 1465

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

@ARG // 1466
A=M+1 // 1467
D=M // 1468
@SP // 1469
AM=M+1 // 1470
A=A-1 // 1471
M=D // 1472
@32 // 1473
D=A // 1474
@SP // 1475
AM=M+1 // 1476
A=A-1 // 1477
M=D // 1478
// call Math.multiply
@7 // 1479
D=A // 1480
@14 // 1481
M=D // 1482
@Math.multiply // 1483
D=A // 1484
@13 // 1485
M=D // 1486
@Screen.drawPixel.ret.0 // 1487
D=A // 1488
@CALL // 1489
0;JMP // 1490
(Screen.drawPixel.ret.0)
@ARG // 1491
A=M // 1492
D=M // 1493
@SP // 1494
AM=M+1 // 1495
A=A-1 // 1496
M=D // 1497
@16 // 1498
D=A // 1499
@SP // 1500
AM=M+1 // 1501
A=A-1 // 1502
M=D // 1503
// call Math.divide
@7 // 1504
D=A // 1505
@14 // 1506
M=D // 1507
@Math.divide // 1508
D=A // 1509
@13 // 1510
M=D // 1511
@Screen.drawPixel.ret.1 // 1512
D=A // 1513
@CALL // 1514
0;JMP // 1515
(Screen.drawPixel.ret.1)
@SP // 1516
AM=M-1 // 1517
D=M // 1518
@SP // 1519
AM=M-1 // 1520
D=D+M // 1521
@16384 // 1522
D=D+A // 1523
@LCL // 1524
A=M // 1525
M=D // 1526

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

@ARG // 1527
A=M // 1528
D=M // 1529
@15 // 1530
D=D&A // 1531
@LCL // 1532
A=M+1 // 1533
M=D // 1534

////ConditionalGroup{push=PushInstruction("static 0"), ifGoto=IfGotoInstruction{label='Screen.drawPixel$IF_TRUE1}}
@Screen.0 // 1535
D=M // 1536
@Screen.drawPixel$IF_TRUE1 // 1537
D;JNE // 1538

////GotoInstruction{label='Screen.drawPixel$IF_FALSE1}
// goto Screen.drawPixel$IF_FALSE1
@Screen.drawPixel$IF_FALSE1 // 1539
0;JMP // 1540

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
@LCL // 1541
A=M // 1542
D=M // 1543
@SP // 1544
AM=M+1 // 1545
A=A-1 // 1546
M=D // 1547
@LCL // 1548
A=M // 1549
A=M // 1550
D=M // 1551
@SP // 1552
AM=M+1 // 1553
A=A-1 // 1554
M=D // 1555
@LCL // 1556
A=M+1 // 1557
D=M // 1558
@SP // 1559
AM=M+1 // 1560
A=A-1 // 1561
M=D // 1562
// call Math.twoToThe
@6 // 1563
D=A // 1564
@14 // 1565
M=D // 1566
@Math.twoToThe // 1567
D=A // 1568
@13 // 1569
M=D // 1570
@Screen.drawPixel.ret.2 // 1571
D=A // 1572
@CALL // 1573
0;JMP // 1574
(Screen.drawPixel.ret.2)
@SP // 1575
AM=M-1 // 1576
D=M // 1577
@SP // 1578
AM=M-1 // 1579
D=D|M // 1580
@SP // 1581
AM=M-1 // 1582
A=M // 1583
M=D // 1584

////GotoInstruction{label='Screen.drawPixel$IF_END1}
// goto Screen.drawPixel$IF_END1
@Screen.drawPixel$IF_END1 // 1585
0;JMP // 1586

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
@LCL // 1587
A=M // 1588
D=M // 1589
@SP // 1590
AM=M+1 // 1591
A=A-1 // 1592
M=D // 1593
@LCL // 1594
A=M // 1595
A=M // 1596
D=M // 1597
@SP // 1598
AM=M+1 // 1599
A=A-1 // 1600
M=D // 1601
@LCL // 1602
A=M+1 // 1603
D=M // 1604
@SP // 1605
AM=M+1 // 1606
A=A-1 // 1607
M=D // 1608
// call Math.twoToThe
@6 // 1609
D=A // 1610
@14 // 1611
M=D // 1612
@Math.twoToThe // 1613
D=A // 1614
@13 // 1615
M=D // 1616
@Screen.drawPixel.ret.3 // 1617
D=A // 1618
@CALL // 1619
0;JMP // 1620
(Screen.drawPixel.ret.3)
@SP // 1621
AM=M-1 // 1622
D=M // 1623
D=!D // 1624
@SP // 1625
AM=M-1 // 1626
D=D&M // 1627
@SP // 1628
AM=M-1 // 1629
A=M // 1630
M=D // 1631

////LabelInstruction{label='Screen.drawPixel$IF_END1}
// label Screen.drawPixel$IF_END1
(Screen.drawPixel$IF_END1)

////PushInstruction("constant 0")
@SP // 1632
AM=M+1 // 1633
A=A-1 // 1634
M=0 // 1635
@RETURN // 1636
0;JMP // 1637

////FunctionInstruction{functionName='Screen.init', numLocals=0, funcMapping={Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.init with 0
(Screen.init)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=static 0}
//}

@Screen.0 // 1638
M=-1 // 1639

////PushInstruction("constant 0")
@SP // 1640
AM=M+1 // 1641
A=A-1 // 1642
M=0 // 1643
@RETURN // 1644
0;JMP // 1645

////FunctionInstruction{functionName='Memory.alloc', numLocals=5, funcMapping={Memory.get_best_fit=0}}
// function Memory.alloc with 5
(Memory.alloc)
@5 // 1646
D=A // 1647
@SP // 1648
AM=D+M // 1649
A=A-1 // 1650
M=0 // 1651
A=A-1 // 1652
M=0 // 1653
A=A-1 // 1654
M=0 // 1655
A=A-1 // 1656
M=0 // 1657
A=A-1 // 1658
M=0 // 1659

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.getBinIndex}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 1660
A=M // 1661
D=M // 1662
@SP // 1663
AM=M+1 // 1664
A=A-1 // 1665
M=D // 1666
// call Memory.getBinIndex
@6 // 1667
D=A // 1668
@14 // 1669
M=D // 1670
@Memory.getBinIndex // 1671
D=A // 1672
@13 // 1673
M=D // 1674
@Memory.alloc.ret.0 // 1675
D=A // 1676
@CALL // 1677
0;JMP // 1678
(Memory.alloc.ret.0)
@SP // 1679
AM=M-1 // 1680
D=M // 1681
@LCL // 1682
A=M // 1683
M=D // 1684

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

@LCL // 1685
A=M // 1686
D=M // 1687
@2048 // 1688
D=D+A // 1689
@LCL // 1690
A=M+1 // 1691
M=D // 1692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1693
A=M+1 // 1694
D=M // 1695
@SP // 1696
AM=M+1 // 1697
A=A-1 // 1698
M=D // 1699
@ARG // 1700
A=M // 1701
D=M // 1702
@SP // 1703
AM=M+1 // 1704
A=A-1 // 1705
M=D // 1706
// call Memory.get_best_fit
@7 // 1707
D=A // 1708
@14 // 1709
M=D // 1710
@Memory.get_best_fit // 1711
D=A // 1712
@13 // 1713
M=D // 1714
@Memory.alloc.ret.1 // 1715
D=A // 1716
@CALL // 1717
0;JMP // 1718
(Memory.alloc.ret.1)
@SP // 1719
AM=M-1 // 1720
D=M // 1721
@LCL // 1722
A=M+1 // 1723
A=A+1 // 1724
M=D // 1725

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
@Memory.alloc.EQ.12 // 1726
D=A // 1727
@SP // 1728
AM=M+1 // 1729
A=A-1 // 1730
M=D // 1731
@LCL // 1732
A=M+1 // 1733
A=A+1 // 1734
D=M // 1735
@DO_EQ // 1736
0;JMP // 1737
(Memory.alloc.EQ.12)
D=!D // 1738
@Memory.alloc_WHILE_END1 // 1739
D;JNE // 1740

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
@Memory.alloc.LT.13 // 1741
D=A // 1742
@SP // 1743
AM=M+1 // 1744
A=A-1 // 1745
M=D // 1746
@LCL // 1747
A=M // 1748
D=M // 1749
D=D+1 // 1750
@7 // 1751
D=D-A // 1752
@DO_LT // 1753
0;JMP // 1754
(Memory.alloc.LT.13)
D=!D // 1755
@Memory.alloc$IF_TRUE1 // 1756
D;JNE // 1757

////GotoInstruction{label='Memory.alloc$IF_END1}
// goto Memory.alloc$IF_END1
@Memory.alloc$IF_END1 // 1758
0;JMP // 1759

////LabelInstruction{label='Memory.alloc$IF_TRUE1}
// label Memory.alloc$IF_TRUE1
(Memory.alloc$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 1760
AM=M+1 // 1761
A=A-1 // 1762
M=0 // 1763
@RETURN // 1764
0;JMP // 1765

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

@LCL // 1766
A=M // 1767
M=M+1 // 1768

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

@LCL // 1769
A=M // 1770
D=M // 1771
@2048 // 1772
D=D+A // 1773
@LCL // 1774
A=M+1 // 1775
M=D // 1776

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1"), PushInstruction("argument 0")], call=CallInstruction{Memory.get_best_fit}}
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 1777
A=M+1 // 1778
D=M // 1779
@SP // 1780
AM=M+1 // 1781
A=A-1 // 1782
M=D // 1783
@ARG // 1784
A=M // 1785
D=M // 1786
@SP // 1787
AM=M+1 // 1788
A=A-1 // 1789
M=D // 1790
// call Memory.get_best_fit
@7 // 1791
D=A // 1792
@14 // 1793
M=D // 1794
@Memory.get_best_fit // 1795
D=A // 1796
@13 // 1797
M=D // 1798
@Memory.alloc.ret.2 // 1799
D=A // 1800
@CALL // 1801
0;JMP // 1802
(Memory.alloc.ret.2)
@SP // 1803
AM=M-1 // 1804
D=M // 1805
@LCL // 1806
A=M+1 // 1807
A=A+1 // 1808
M=D // 1809

////GotoInstruction{label='Memory.alloc_WHILE_EXP1}
// goto Memory.alloc_WHILE_EXP1
@Memory.alloc_WHILE_EXP1 // 1810
0;JMP // 1811

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

@LCL // 1812
A=M+1 // 1813
A=A+1 // 1814
A=M // 1815
D=M // 1816
@SP // 1817
AM=M+1 // 1818
A=A-1 // 1819
M=D // 1820
// call Memory.getBinIndex
@6 // 1821
D=A // 1822
@14 // 1823
M=D // 1824
@Memory.getBinIndex // 1825
D=A // 1826
@13 // 1827
M=D // 1828
@Memory.alloc.ret.3 // 1829
D=A // 1830
@CALL // 1831
0;JMP // 1832
(Memory.alloc.ret.3)
@SP // 1833
AM=M-1 // 1834
D=M // 1835
@2048 // 1836
D=D+A // 1837
@SP // 1838
AM=M+1 // 1839
A=A-1 // 1840
M=D // 1841
@LCL // 1842
A=M+1 // 1843
A=A+1 // 1844
D=M // 1845
@SP // 1846
AM=M+1 // 1847
A=A-1 // 1848
M=D // 1849
// call Memory.remove_node
@7 // 1850
D=A // 1851
@14 // 1852
M=D // 1853
@Memory.remove_node // 1854
D=A // 1855
@13 // 1856
M=D // 1857
@Memory.alloc.ret.4 // 1858
D=A // 1859
@CALL // 1860
0;JMP // 1861
(Memory.alloc.ret.4)
@SP // 1862
M=M-1 // 1863

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

@LCL // 1864
A=M+1 // 1865
A=A+1 // 1866
A=M // 1867
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
@Memory.alloc.GT.14 // 1884
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
(Memory.alloc.GT.14)
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
@ARG // 1957
A=M // 1958
D=D+M // 1959
@5 // 1960
D=D+A // 1961
@SP // 1962
AM=M+1 // 1963
A=A-1 // 1964
M=D // 1965
@LCL // 1966
D=M // 1967
@4 // 1968
A=D+A // 1969
D=A // 1970
@R13 // 1971
M=D // 1972
@SP // 1973
AM=M-1 // 1974
D=M // 1975
@R13 // 1976
A=M // 1977
M=D // 1978

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
@LCL // 1979
D=M // 1980
@4 // 1981
A=D+A // 1982
D=M // 1983
@SP // 1984
AM=M+1 // 1985
A=A-1 // 1986
M=D // 1987
@LCL // 1988
A=M+1 // 1989
A=A+1 // 1990
A=A+1 // 1991
D=M // 1992
@5 // 1993
D=D-A // 1994
@SP // 1995
AM=M-1 // 1996
A=M // 1997
M=D // 1998

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 4"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 1999
D=M // 2000
@4 // 2001
A=D+A // 2002
D=M // 2003
@SP // 2004
AM=M+1 // 2005
A=A-1 // 2006
M=D+1 // 2007
D=1 // 2008
@SP // 2009
AM=M-1 // 2010
A=M // 2011
M=D // 2012

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 4")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2013
D=M // 2014
@4 // 2015
A=D+A // 2016
D=M // 2017
@SP // 2018
AM=M+1 // 2019
A=A-1 // 2020
M=D // 2021
// call Memory.create_foot
@6 // 2022
D=A // 2023
@14 // 2024
M=D // 2025
@Memory.create_foot // 2026
D=A // 2027
@13 // 2028
M=D // 2029
@Memory.alloc.ret.6 // 2030
D=A // 2031
@CALL // 2032
0;JMP // 2033
(Memory.alloc.ret.6)
@SP // 2034
M=M-1 // 2035

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

@LCL // 2036
A=M+1 // 2037
A=A+1 // 2038
A=A+1 // 2039
D=M // 2040
@SP // 2041
AM=M+1 // 2042
A=A-1 // 2043
M=D // 2044
// call Memory.getBinIndex
@6 // 2045
D=A // 2046
@14 // 2047
M=D // 2048
@Memory.getBinIndex // 2049
D=A // 2050
@13 // 2051
M=D // 2052
@Memory.alloc.ret.7 // 2053
D=A // 2054
@CALL // 2055
0;JMP // 2056
(Memory.alloc.ret.7)
@SP // 2057
AM=M-1 // 2058
D=M // 2059
@2048 // 2060
D=D+A // 2061
@SP // 2062
AM=M+1 // 2063
A=A-1 // 2064
M=D // 2065
@LCL // 2066
D=M // 2067
@4 // 2068
A=D+A // 2069
D=M // 2070
@SP // 2071
AM=M+1 // 2072
A=A-1 // 2073
M=D // 2074
// call Memory.add_node
@7 // 2075
D=A // 2076
@14 // 2077
M=D // 2078
@Memory.add_node // 2079
D=A // 2080
@13 // 2081
M=D // 2082
@Memory.alloc.ret.8 // 2083
D=A // 2084
@CALL // 2085
0;JMP // 2086
(Memory.alloc.ret.8)
@SP // 2087
M=M-1 // 2088

////GotoInstruction{label='Memory.alloc$IF_END2}
// goto Memory.alloc$IF_END2
@Memory.alloc$IF_END2 // 2089
0;JMP // 2090

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
@LCL // 2091
A=M+1 // 2092
A=A+1 // 2093
D=M // 2094
@SP // 2095
AM=M+1 // 2096
A=A-1 // 2097
M=D+1 // 2098
D=0 // 2099
@SP // 2100
AM=M-1 // 2101
A=M // 2102
M=D // 2103

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 2")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 2104
A=M+1 // 2105
A=A+1 // 2106
D=M // 2107
@SP // 2108
AM=M+1 // 2109
A=A-1 // 2110
M=D // 2111
// call Memory.create_foot
@6 // 2112
D=A // 2113
@14 // 2114
M=D // 2115
@Memory.create_foot // 2116
D=A // 2117
@13 // 2118
M=D // 2119
@Memory.alloc.ret.9 // 2120
D=A // 2121
@CALL // 2122
0;JMP // 2123
(Memory.alloc.ret.9)
@SP // 2124
M=M-1 // 2125

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
@LCL // 2126
A=M+1 // 2127
A=A+1 // 2128
D=M // 2129
@4 // 2130
D=D+A // 2131
@SP // 2132
AM=M+1 // 2133
A=A-1 // 2134
M=D // 2135
@RETURN // 2136
0;JMP // 2137

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
@ARG // 2138
A=M // 2139
D=M // 2140
@SP // 2141
AM=M+1 // 2142
A=A-1 // 2143
M=D // 2144
@ARG // 2145
A=M // 2146
A=M // 2147
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
@ARG // 2204
A=M // 2205
A=D+M // 2206
D=M // 2207
@SP // 2208
AM=M+1 // 2209
A=A-1 // 2210
M=D // 2211
@RETURN // 2212
0;JMP // 2213

////FunctionInstruction{functionName='Output.printString', numLocals=2, funcMapping={Output.println=0, Output.getMap=0}}
// function Output.printString with 2
(Output.printString)
@SP // 2214
M=M+1 // 2215
AM=M+1 // 2216
A=A-1 // 2217
M=0 // 2218
A=A-1 // 2219
M=0 // 2220

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2221
A=M // 2222
M=0 // 2223

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{String.length}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 2224
A=M // 2225
D=M // 2226
@SP // 2227
AM=M+1 // 2228
A=A-1 // 2229
M=D // 2230
// call String.length
@6 // 2231
D=A // 2232
@14 // 2233
M=D // 2234
@String.length // 2235
D=A // 2236
@13 // 2237
M=D // 2238
@Output.printString.ret.0 // 2239
D=A // 2240
@CALL // 2241
0;JMP // 2242
(Output.printString.ret.0)
@SP // 2243
AM=M-1 // 2244
D=M // 2245
@LCL // 2246
A=M+1 // 2247
M=D // 2248

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
@Output.printString.LT.15 // 2249
D=A // 2250
@SP // 2251
AM=M+1 // 2252
A=A-1 // 2253
M=D // 2254
@LCL // 2255
A=M+1 // 2256
D=M // 2257
A=A-1 // 2258
D=M-D // 2259
@DO_LT // 2260
0;JMP // 2261
(Output.printString.LT.15)
D=!D // 2262
@Output.printString_WHILE_END1 // 2263
D;JNE // 2264

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("local 0")], call=CallInstruction{String.charAt}}], call=CallInstruction{Output.printChar}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 2265
A=M // 2266
D=M // 2267
@SP // 2268
AM=M+1 // 2269
A=A-1 // 2270
M=D // 2271
@LCL // 2272
A=M // 2273
D=M // 2274
@SP // 2275
AM=M+1 // 2276
A=A-1 // 2277
M=D // 2278
// call String.charAt
@7 // 2279
D=A // 2280
@14 // 2281
M=D // 2282
@String.charAt // 2283
D=A // 2284
@13 // 2285
M=D // 2286
@Output.printString.ret.1 // 2287
D=A // 2288
@CALL // 2289
0;JMP // 2290
(Output.printString.ret.1)
// call Output.printChar
@6 // 2291
D=A // 2292
@14 // 2293
M=D // 2294
@Output.printChar // 2295
D=A // 2296
@13 // 2297
M=D // 2298
@Output.printString.ret.2 // 2299
D=A // 2300
@CALL // 2301
0;JMP // 2302
(Output.printString.ret.2)
@SP // 2303
M=M-1 // 2304

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

@LCL // 2305
A=M // 2306
M=M+1 // 2307

////GotoInstruction{label='Output.printString_WHILE_EXP1}
// goto Output.printString_WHILE_EXP1
@Output.printString_WHILE_EXP1 // 2308
0;JMP // 2309

////LabelInstruction{label='Output.printString_WHILE_END1}
// label Output.printString_WHILE_END1
(Output.printString_WHILE_END1)

////PushInstruction("constant 0")
@SP // 2310
AM=M+1 // 2311
A=A-1 // 2312
M=0 // 2313
@RETURN // 2314
0;JMP // 2315

////FunctionInstruction{functionName='Output.create', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0}}
// function Output.create with 1
(Output.create)
@SP // 2316
AM=M+1 // 2317
A=A-1 // 2318
M=0 // 2319

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 11")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=local 0}
//}

@11 // 2320
D=A // 2321
@SP // 2322
AM=M+1 // 2323
A=A-1 // 2324
M=D // 2325
// call Memory.alloc
@6 // 2326
D=A // 2327
@14 // 2328
M=D // 2329
@Memory.alloc // 2330
D=A // 2331
@13 // 2332
M=D // 2333
@Output.create.ret.0 // 2334
D=A // 2335
@CALL // 2336
0;JMP // 2337
(Output.create.ret.0)
@SP // 2338
AM=M-1 // 2339
D=M // 2340
@LCL // 2341
A=M // 2342
M=D // 2343

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("argument 0"),
//    binaryOp: "ADD"
//)}
@Output.0 // 2344
D=M // 2345
@ARG // 2346
A=M // 2347
D=D+M // 2348
@SP // 2349
AM=M+1 // 2350
A=A-1 // 2351
M=D // 2352
@LCL // 2353
A=M // 2354
D=M // 2355
@SP // 2356
AM=M-1 // 2357
A=M // 2358
M=D // 2359

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@LCL // 2360
A=M // 2361
D=M // 2362
@SP // 2363
AM=M+1 // 2364
A=A-1 // 2365
M=D // 2366
@ARG // 2367
A=M+1 // 2368
D=M // 2369
@SP // 2370
AM=M-1 // 2371
A=M // 2372
M=D // 2373

////PushWriter{source=PushInstruction("argument 2"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 2374
A=M // 2375
D=M // 2376
@SP // 2377
AM=M+1 // 2378
A=A-1 // 2379
M=D+1 // 2380
@ARG // 2381
A=M+1 // 2382
A=A+1 // 2383
D=M // 2384
@SP // 2385
AM=M-1 // 2386
A=M // 2387
M=D // 2388

////PushWriter{source=PushInstruction("argument 3"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 2389
A=M // 2390
D=M // 2391
@2 // 2392
D=D+A // 2393
@SP // 2394
AM=M+1 // 2395
A=A-1 // 2396
M=D // 2397
@ARG // 2398
A=M+1 // 2399
A=A+1 // 2400
A=A+1 // 2401
D=M // 2402
@SP // 2403
AM=M-1 // 2404
A=M // 2405
M=D // 2406

////PushWriter{source=PushInstruction("argument 4"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 2407
A=M // 2408
D=M // 2409
@3 // 2410
D=D+A // 2411
@SP // 2412
AM=M+1 // 2413
A=A-1 // 2414
M=D // 2415
@ARG // 2416
D=M // 2417
@4 // 2418
A=D+A // 2419
D=M // 2420
@SP // 2421
AM=M-1 // 2422
A=M // 2423
M=D // 2424

////PushWriter{source=PushInstruction("argument 5"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 4"),
//    binaryOp: "ADD"
//)}
@LCL // 2425
A=M // 2426
D=M // 2427
@4 // 2428
D=D+A // 2429
@SP // 2430
AM=M+1 // 2431
A=A-1 // 2432
M=D // 2433
@ARG // 2434
D=M // 2435
@5 // 2436
A=D+A // 2437
D=M // 2438
@SP // 2439
AM=M-1 // 2440
A=M // 2441
M=D // 2442

////PushWriter{source=PushInstruction("argument 6"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 5"),
//    binaryOp: "ADD"
//)}
@LCL // 2443
A=M // 2444
D=M // 2445
@5 // 2446
D=D+A // 2447
@SP // 2448
AM=M+1 // 2449
A=A-1 // 2450
M=D // 2451
@ARG // 2452
D=M // 2453
@6 // 2454
A=D+A // 2455
D=M // 2456
@SP // 2457
AM=M-1 // 2458
A=M // 2459
M=D // 2460

////PushWriter{source=PushInstruction("argument 7"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 6"),
//    binaryOp: "ADD"
//)}
@LCL // 2461
A=M // 2462
D=M // 2463
@6 // 2464
D=D+A // 2465
@SP // 2466
AM=M+1 // 2467
A=A-1 // 2468
M=D // 2469
@ARG // 2470
D=M // 2471
@7 // 2472
A=D+A // 2473
D=M // 2474
@SP // 2475
AM=M-1 // 2476
A=M // 2477
M=D // 2478

////PushWriter{source=PushInstruction("argument 8"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 7"),
//    binaryOp: "ADD"
//)}
@LCL // 2479
A=M // 2480
D=M // 2481
@7 // 2482
D=D+A // 2483
@SP // 2484
AM=M+1 // 2485
A=A-1 // 2486
M=D // 2487
@ARG // 2488
D=M // 2489
@8 // 2490
A=D+A // 2491
D=M // 2492
@SP // 2493
AM=M-1 // 2494
A=M // 2495
M=D // 2496

////PushWriter{source=PushInstruction("argument 9"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 8"),
//    binaryOp: "ADD"
//)}
@LCL // 2497
A=M // 2498
D=M // 2499
@8 // 2500
D=D+A // 2501
@SP // 2502
AM=M+1 // 2503
A=A-1 // 2504
M=D // 2505
@ARG // 2506
D=M // 2507
@9 // 2508
A=D+A // 2509
D=M // 2510
@SP // 2511
AM=M-1 // 2512
A=M // 2513
M=D // 2514

////PushWriter{source=PushInstruction("argument 10"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 9"),
//    binaryOp: "ADD"
//)}
@LCL // 2515
A=M // 2516
D=M // 2517
@9 // 2518
D=D+A // 2519
@SP // 2520
AM=M+1 // 2521
A=A-1 // 2522
M=D // 2523
@ARG // 2524
D=M // 2525
@10 // 2526
A=D+A // 2527
D=M // 2528
@SP // 2529
AM=M-1 // 2530
A=M // 2531
M=D // 2532

////PushWriter{source=PushInstruction("argument 11"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 10"),
//    binaryOp: "ADD"
//)}
@LCL // 2533
A=M // 2534
D=M // 2535
@10 // 2536
D=D+A // 2537
@SP // 2538
AM=M+1 // 2539
A=A-1 // 2540
M=D // 2541
@ARG // 2542
D=M // 2543
@11 // 2544
A=D+A // 2545
D=M // 2546
@SP // 2547
AM=M-1 // 2548
A=M // 2549
M=D // 2550

////PushInstruction("constant 0")
@SP // 2551
AM=M+1 // 2552
A=A-1 // 2553
M=0 // 2554
@RETURN // 2555
0;JMP // 2556

////FunctionInstruction{functionName='String.length', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3}}
// function String.length with 0
(String.length)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 2557
A=M // 2558
D=M // 2559
@3 // 2560
M=D // 2561

////PushInstruction("this 1")
@THIS // 2562
A=M+1 // 2563
D=M // 2564
@SP // 2565
AM=M+1 // 2566
A=A-1 // 2567
M=D // 2568
@RETURN // 2569
0;JMP // 2570

////FunctionInstruction{functionName='String.new', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0}}
// function String.new with 0
(String.new)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 3")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=pointer 0}
//}

@3 // 2571
D=A // 2572
@SP // 2573
AM=M+1 // 2574
A=A-1 // 2575
M=D // 2576
// call Memory.alloc
@6 // 2577
D=A // 2578
@14 // 2579
M=D // 2580
@Memory.alloc // 2581
D=A // 2582
@13 // 2583
M=D // 2584
@String.new.ret.0 // 2585
D=A // 2586
@CALL // 2587
0;JMP // 2588
(String.new.ret.0)
@SP // 2589
AM=M-1 // 2590
D=M // 2591
@3 // 2592
M=D // 2593

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "EQ"
//), ifGoto=IfGotoInstruction{label='String.new$IF_TRUE1}}
@String.new.EQ.16 // 2594
D=A // 2595
@SP // 2596
AM=M+1 // 2597
A=A-1 // 2598
M=D // 2599
@ARG // 2600
A=M // 2601
D=M // 2602
@DO_EQ // 2603
0;JMP // 2604
(String.new.EQ.16)
@String.new$IF_TRUE1 // 2605
D;JNE // 2606

////GotoInstruction{label='String.new$IF_FALSE1}
// goto String.new$IF_FALSE1
@String.new$IF_FALSE1 // 2607
0;JMP // 2608

////LabelInstruction{label='String.new$IF_TRUE1}
// label String.new$IF_TRUE1
(String.new$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 0}
//}

@THIS // 2609
A=M // 2610
M=0 // 2611

////GotoInstruction{label='String.new$IF_END1}
// goto String.new$IF_END1
@String.new$IF_END1 // 2612
0;JMP // 2613

////LabelInstruction{label='String.new$IF_FALSE1}
// label String.new$IF_FALSE1
(String.new$IF_FALSE1)

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=this 0}
//}

@ARG // 2614
A=M // 2615
D=M // 2616
@SP // 2617
AM=M+1 // 2618
A=A-1 // 2619
M=D // 2620
// call Memory.alloc
@6 // 2621
D=A // 2622
@14 // 2623
M=D // 2624
@Memory.alloc // 2625
D=A // 2626
@13 // 2627
M=D // 2628
@String.new.ret.1 // 2629
D=A // 2630
@CALL // 2631
0;JMP // 2632
(String.new.ret.1)
@SP // 2633
AM=M-1 // 2634
D=M // 2635
@THIS // 2636
A=M // 2637
M=D // 2638

////LabelInstruction{label='String.new$IF_END1}
// label String.new$IF_END1
(String.new$IF_END1)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=this 2}
//}

@ARG // 2639
A=M // 2640
D=M // 2641
@THIS // 2642
A=M+1 // 2643
A=A+1 // 2644
M=D // 2645

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=this 1}
//}

@THIS // 2646
A=M+1 // 2647
M=0 // 2648

////PushInstruction("pointer 0")
@3 // 2649
D=M // 2650
@SP // 2651
AM=M+1 // 2652
A=A-1 // 2653
M=D // 2654
@RETURN // 2655
0;JMP // 2656

////FunctionInstruction{functionName='Memory.getBinIndex', numLocals=1, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0}}
// function Memory.getBinIndex with 1
(Memory.getBinIndex)
@SP // 2657
AM=M+1 // 2658
A=A-1 // 2659
M=0 // 2660

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2661
A=M // 2662
M=0 // 2663

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
@Memory.getBinIndex.LT.17 // 2664
D=A // 2665
@SP // 2666
AM=M+1 // 2667
A=A-1 // 2668
M=D // 2669
@LCL // 2670
A=M // 2671
D=M // 2672
@7 // 2673
D=D-A // 2674
@DO_LT // 2675
0;JMP // 2676
(Memory.getBinIndex.LT.17)
@SP // 2677
AM=M+1 // 2678
A=A-1 // 2679
M=D // 2680
@Memory.getBinIndex.EQ.18 // 2681
D=A // 2682
@SP // 2683
AM=M+1 // 2684
A=A-1 // 2685
M=D // 2686
@LCL // 2687
A=M // 2688
D=M // 2689
@LCL // 2690
A=M // 2691
D=M // 2692
@2048 // 2693
D=D+A // 2694
A=D // 2695
D=M // 2696
@DO_EQ // 2697
0;JMP // 2698
(Memory.getBinIndex.EQ.18)
D=!D // 2699
@SP // 2700
AM=M-1 // 2701
D=D&M // 2702
D=!D // 2703
@Memory.getBinIndex_WHILE_END1 // 2704
D;JNE // 2705

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
@Memory.getBinIndex.GT.19 // 2706
D=A // 2707
@SP // 2708
AM=M+1 // 2709
A=A-1 // 2710
M=D // 2711
@ARG // 2712
A=M // 2713
D=M // 2714
@SP // 2715
AM=M+1 // 2716
A=A-1 // 2717
M=D // 2718
@LCL // 2719
A=M // 2720
D=M // 2721
@SP // 2722
AM=M+1 // 2723
A=A-1 // 2724
M=D+1 // 2725
@16 // 2726
D=A // 2727
@SP // 2728
AM=M+1 // 2729
A=A-1 // 2730
M=D // 2731
// call Math.multiply
@7 // 2732
D=A // 2733
@14 // 2734
M=D // 2735
@Math.multiply // 2736
D=A // 2737
@13 // 2738
M=D // 2739
@Memory.getBinIndex.ret.0 // 2740
D=A // 2741
@CALL // 2742
0;JMP // 2743
(Memory.getBinIndex.ret.0)
@SP // 2744
AM=M-1 // 2745
D=M // 2746
@SP // 2747
AM=M-1 // 2748
D=M-D // 2749
@DO_GT // 2750
0;JMP // 2751
(Memory.getBinIndex.GT.19)
D=!D // 2752
@Memory.getBinIndex$IF_TRUE1 // 2753
D;JNE // 2754

////GotoInstruction{label='Memory.getBinIndex$IF_END1}
// goto Memory.getBinIndex$IF_END1
@Memory.getBinIndex$IF_END1 // 2755
0;JMP // 2756

////LabelInstruction{label='Memory.getBinIndex$IF_TRUE1}
// label Memory.getBinIndex$IF_TRUE1
(Memory.getBinIndex$IF_TRUE1)

////PushInstruction("local 0")
@LCL // 2757
A=M // 2758
D=M // 2759
@SP // 2760
AM=M+1 // 2761
A=A-1 // 2762
M=D // 2763
@RETURN // 2764
0;JMP // 2765

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

@LCL // 2766
A=M // 2767
M=M+1 // 2768

////GotoInstruction{label='Memory.getBinIndex_WHILE_EXP1}
// goto Memory.getBinIndex_WHILE_EXP1
@Memory.getBinIndex_WHILE_EXP1 // 2769
0;JMP // 2770

////LabelInstruction{label='Memory.getBinIndex_WHILE_END1}
// label Memory.getBinIndex_WHILE_END1
(Memory.getBinIndex_WHILE_END1)

////PushInstruction("constant 6")
@6 // 2771
D=A // 2772
@SP // 2773
AM=M+1 // 2774
A=A-1 // 2775
M=D // 2776
@RETURN // 2777
0;JMP // 2778

////FunctionInstruction{functionName='Math.multiply', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0}}
// function Math.multiply with 3
(Math.multiply)
@3 // 2779
D=A // 2780
@SP // 2781
AM=D+M // 2782
A=A-1 // 2783
M=0 // 2784
A=A-1 // 2785
M=0 // 2786
A=A-1 // 2787
M=0 // 2788

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
@Math.multiply.EQ.20 // 2789
D=A // 2790
@SP // 2791
AM=M+1 // 2792
A=A-1 // 2793
M=D // 2794
@ARG // 2795
A=M // 2796
D=M // 2797
@DO_EQ // 2798
0;JMP // 2799
(Math.multiply.EQ.20)
@SP // 2800
AM=M+1 // 2801
A=A-1 // 2802
M=D // 2803
@Math.multiply.EQ.21 // 2804
D=A // 2805
@SP // 2806
AM=M+1 // 2807
A=A-1 // 2808
M=D // 2809
@ARG // 2810
A=M+1 // 2811
D=M // 2812
@DO_EQ // 2813
0;JMP // 2814
(Math.multiply.EQ.21)
@SP // 2815
AM=M-1 // 2816
D=D|M // 2817
@Math.multiply$IF_TRUE1 // 2818
D;JNE // 2819

////GotoInstruction{label='Math.multiply$IF_END1}
// goto Math.multiply$IF_END1
@Math.multiply$IF_END1 // 2820
0;JMP // 2821

////LabelInstruction{label='Math.multiply$IF_TRUE1}
// label Math.multiply$IF_TRUE1
(Math.multiply$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 2822
AM=M+1 // 2823
A=A-1 // 2824
M=0 // 2825
@RETURN // 2826
0;JMP // 2827

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
@Math.multiply.EQ.22 // 2828
D=A // 2829
@SP // 2830
AM=M+1 // 2831
A=A-1 // 2832
M=D // 2833
@ARG // 2834
A=M // 2835
D=M // 2836
D=D-1 // 2837
@DO_EQ // 2838
0;JMP // 2839
(Math.multiply.EQ.22)
@Math.multiply$IF_TRUE2 // 2840
D;JNE // 2841

////GotoInstruction{label='Math.multiply$IF_END2}
// goto Math.multiply$IF_END2
@Math.multiply$IF_END2 // 2842
0;JMP // 2843

////LabelInstruction{label='Math.multiply$IF_TRUE2}
// label Math.multiply$IF_TRUE2
(Math.multiply$IF_TRUE2)

////PushInstruction("argument 1")
@ARG // 2844
A=M+1 // 2845
D=M // 2846
@SP // 2847
AM=M+1 // 2848
A=A-1 // 2849
M=D // 2850
@RETURN // 2851
0;JMP // 2852

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
@Math.multiply.EQ.23 // 2853
D=A // 2854
@SP // 2855
AM=M+1 // 2856
A=A-1 // 2857
M=D // 2858
@ARG // 2859
A=M+1 // 2860
D=M // 2861
D=D-1 // 2862
@DO_EQ // 2863
0;JMP // 2864
(Math.multiply.EQ.23)
@Math.multiply$IF_TRUE3 // 2865
D;JNE // 2866

////GotoInstruction{label='Math.multiply$IF_END3}
// goto Math.multiply$IF_END3
@Math.multiply$IF_END3 // 2867
0;JMP // 2868

////LabelInstruction{label='Math.multiply$IF_TRUE3}
// label Math.multiply$IF_TRUE3
(Math.multiply$IF_TRUE3)

////PushInstruction("argument 0")
@ARG // 2869
A=M // 2870
D=M // 2871
@SP // 2872
AM=M+1 // 2873
A=A-1 // 2874
M=D // 2875
@RETURN // 2876
0;JMP // 2877

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
@Math.multiply.EQ.24 // 2878
D=A // 2879
@SP // 2880
AM=M+1 // 2881
A=A-1 // 2882
M=D // 2883
@ARG // 2884
A=M // 2885
D=M // 2886
@2 // 2887
D=D-A // 2888
@DO_EQ // 2889
0;JMP // 2890
(Math.multiply.EQ.24)
@Math.multiply$IF_TRUE4 // 2891
D;JNE // 2892

////GotoInstruction{label='Math.multiply$IF_END4}
// goto Math.multiply$IF_END4
@Math.multiply$IF_END4 // 2893
0;JMP // 2894

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
@ARG // 2895
A=M+1 // 2896
D=M // 2897
D=D+M // 2898
@SP // 2899
AM=M+1 // 2900
A=A-1 // 2901
M=D // 2902
@RETURN // 2903
0;JMP // 2904

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
@Math.multiply.EQ.25 // 2905
D=A // 2906
@SP // 2907
AM=M+1 // 2908
A=A-1 // 2909
M=D // 2910
@ARG // 2911
A=M+1 // 2912
D=M // 2913
@2 // 2914
D=D-A // 2915
@DO_EQ // 2916
0;JMP // 2917
(Math.multiply.EQ.25)
@Math.multiply$IF_TRUE5 // 2918
D;JNE // 2919

////GotoInstruction{label='Math.multiply$IF_END5}
// goto Math.multiply$IF_END5
@Math.multiply$IF_END5 // 2920
0;JMP // 2921

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
@ARG // 2922
A=M // 2923
D=M // 2924
D=D+M // 2925
@SP // 2926
AM=M+1 // 2927
A=A-1 // 2928
M=D // 2929
@RETURN // 2930
0;JMP // 2931

////LabelInstruction{label='Math.multiply$IF_END5}
// label Math.multiply$IF_END5
(Math.multiply$IF_END5)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 2932
A=M+1 // 2933
A=A+1 // 2934
M=1 // 2935

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 2936
A=M+1 // 2937
M=0 // 2938

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 2939
A=M // 2940
M=0 // 2941

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
@Math.multiply.LT.26 // 2942
D=A // 2943
@SP // 2944
AM=M+1 // 2945
A=A-1 // 2946
M=D // 2947
@LCL // 2948
A=M+1 // 2949
D=M // 2950
@16 // 2951
D=D-A // 2952
@DO_LT // 2953
0;JMP // 2954
(Math.multiply.LT.26)
D=!D // 2955
@Math.multiply_WHILE_END1 // 2956
D;JNE // 2957

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
@Math.multiply.EQ.27 // 2958
D=A // 2959
@SP // 2960
AM=M+1 // 2961
A=A-1 // 2962
M=D // 2963
@ARG // 2964
A=M+1 // 2965
D=M // 2966
@LCL // 2967
A=M+1 // 2968
A=A+1 // 2969
D=D&M // 2970
@DO_EQ // 2971
0;JMP // 2972
(Math.multiply.EQ.27)
D=!D // 2973
@Math.multiply$IF_TRUE6 // 2974
D;JNE // 2975

////GotoInstruction{label='Math.multiply$IF_END6}
// goto Math.multiply$IF_END6
@Math.multiply$IF_END6 // 2976
0;JMP // 2977

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

@ARG // 2978
A=M // 2979
D=M // 2980
@LCL // 2981
A=M // 2982
M=D+M // 2983

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

@ARG // 2984
A=M // 2985
D=M // 2986
@ARG // 2987
A=M // 2988
M=D+M // 2989

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

@LCL // 2990
A=M+1 // 2991
M=M+1 // 2992

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

@LCL // 2993
A=M+1 // 2994
A=A+1 // 2995
D=M // 2996
@LCL // 2997
A=M+1 // 2998
A=A+1 // 2999
M=D+M // 3000

////GotoInstruction{label='Math.multiply_WHILE_EXP1}
// goto Math.multiply_WHILE_EXP1
@Math.multiply_WHILE_EXP1 // 3001
0;JMP // 3002

////LabelInstruction{label='Math.multiply_WHILE_END1}
// label Math.multiply_WHILE_END1
(Math.multiply_WHILE_END1)

////PushInstruction("local 0")
@LCL // 3003
A=M // 3004
D=M // 3005
@SP // 3006
AM=M+1 // 3007
A=A-1 // 3008
M=D // 3009
@RETURN // 3010
0;JMP // 3011

////FunctionInstruction{functionName='Memory.deAlloc', numLocals=3, funcMapping={Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.deAlloc with 3
(Memory.deAlloc)
@3 // 3012
D=A // 3013
@SP // 3014
AM=D+M // 3015
A=A-1 // 3016
M=0 // 3017
A=A-1 // 3018
M=0 // 3019
A=A-1 // 3020
M=0 // 3021

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

@ARG // 3022
A=M // 3023
D=M // 3024
@4 // 3025
D=D-A // 3026
@LCL // 3027
A=M // 3028
M=D // 3029

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 3030
A=M // 3031
D=M // 3032
@SP // 3033
AM=M+1 // 3034
A=A-1 // 3035
M=D+1 // 3036
D=1 // 3037
@SP // 3038
AM=M-1 // 3039
A=M // 3040
M=D // 3041

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

@LCL // 3042
A=M // 3043
D=M // 3044
@LCL // 3045
A=M // 3046
D=M // 3047
@2 // 3048
D=D+A // 3049
A=D // 3050
D=M // 3051
@LCL // 3052
A=M+1 // 3053
M=D // 3054

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

@LCL // 3055
A=M // 3056
D=M // 3057
@LCL // 3058
A=M // 3059
D=M // 3060
@3 // 3061
D=D+A // 3062
A=D // 3063
D=M // 3064
@LCL // 3065
A=M+1 // 3066
A=A+1 // 3067
M=D // 3068

////ConditionalGroup{push=UnaryPushGroup(    BinaryPushGroup(
//        left:
//            PushInstruction("local 1"),
//        right:
//            PushInstruction("constant 0"),
//        binaryOp: "EQ"
//    ),
//NOT), ifGoto=IfGotoInstruction{label='Memory.deAlloc$IF_TRUE1}}
@Memory.deAlloc.EQ.28 // 3069
D=A // 3070
@SP // 3071
AM=M+1 // 3072
A=A-1 // 3073
M=D // 3074
@LCL // 3075
A=M+1 // 3076
D=M // 3077
@DO_EQ // 3078
0;JMP // 3079
(Memory.deAlloc.EQ.28)
D=!D // 3080
@Memory.deAlloc$IF_TRUE1 // 3081
D;JNE // 3082

////GotoInstruction{label='Memory.deAlloc$IF_END1}
// goto Memory.deAlloc$IF_END1
@Memory.deAlloc$IF_END1 // 3083
0;JMP // 3084

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
@Memory.deAlloc.EQ.29 // 3085
D=A // 3086
@SP // 3087
AM=M+1 // 3088
A=A-1 // 3089
M=D // 3090
@LCL // 3091
A=M+1 // 3092
A=M+1 // 3093
D=M // 3094
D=D-1 // 3095
@DO_EQ // 3096
0;JMP // 3097
(Memory.deAlloc.EQ.29)
@Memory.deAlloc$IF_TRUE2 // 3098
D;JNE // 3099

////GotoInstruction{label='Memory.deAlloc$IF_END2}
// goto Memory.deAlloc$IF_END2
@Memory.deAlloc$IF_END2 // 3100
0;JMP // 3101

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

@LCL // 3102
A=M+1 // 3103
A=M // 3104
D=M // 3105
@SP // 3106
AM=M+1 // 3107
A=A-1 // 3108
M=D // 3109
// call Memory.getBinIndex
@6 // 3110
D=A // 3111
@14 // 3112
M=D // 3113
@Memory.getBinIndex // 3114
D=A // 3115
@13 // 3116
M=D // 3117
@Memory.deAlloc.ret.0 // 3118
D=A // 3119
@CALL // 3120
0;JMP // 3121
(Memory.deAlloc.ret.0)
@SP // 3122
AM=M-1 // 3123
D=M // 3124
@2048 // 3125
D=D+A // 3126
@SP // 3127
AM=M+1 // 3128
A=A-1 // 3129
M=D // 3130
@LCL // 3131
A=M+1 // 3132
D=M // 3133
@SP // 3134
AM=M+1 // 3135
A=A-1 // 3136
M=D // 3137
// call Memory.remove_node
@7 // 3138
D=A // 3139
@14 // 3140
M=D // 3141
@Memory.remove_node // 3142
D=A // 3143
@13 // 3144
M=D // 3145
@Memory.deAlloc.ret.1 // 3146
D=A // 3147
@CALL // 3148
0;JMP // 3149
(Memory.deAlloc.ret.1)
@SP // 3150
M=M-1 // 3151

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
@LCL // 3152
A=M+1 // 3153
D=M // 3154
@SP // 3155
AM=M+1 // 3156
A=A-1 // 3157
M=D // 3158
@LCL // 3159
A=M+1 // 3160
A=M // 3161
D=M // 3162
@SP // 3163
AM=M+1 // 3164
A=A-1 // 3165
M=D // 3166
@LCL // 3167
A=M // 3168
A=M // 3169
D=M // 3170
@SP // 3171
AM=M-1 // 3172
D=D+M // 3173
@5 // 3174
D=D+A // 3175
@SP // 3176
AM=M-1 // 3177
A=M // 3178
M=D // 3179

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 1")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3180
A=M+1 // 3181
D=M // 3182
@SP // 3183
AM=M+1 // 3184
A=A-1 // 3185
M=D // 3186
// call Memory.create_foot
@6 // 3187
D=A // 3188
@14 // 3189
M=D // 3190
@Memory.create_foot // 3191
D=A // 3192
@13 // 3193
M=D // 3194
@Memory.deAlloc.ret.2 // 3195
D=A // 3196
@CALL // 3197
0;JMP // 3198
(Memory.deAlloc.ret.2)
@SP // 3199
M=M-1 // 3200

////PushPopPair {
//  push: PushInstruction("local 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3201
A=M+1 // 3202
D=M // 3203
@LCL // 3204
A=M // 3205
M=D // 3206

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
@Memory.deAlloc.EQ.30 // 3207
D=A // 3208
@SP // 3209
AM=M+1 // 3210
A=A-1 // 3211
M=D // 3212
@LCL // 3213
A=M+1 // 3214
A=A+1 // 3215
D=M // 3216
@DO_EQ // 3217
0;JMP // 3218
(Memory.deAlloc.EQ.30)
D=!D // 3219
@Memory.deAlloc$IF_TRUE3 // 3220
D;JNE // 3221

////GotoInstruction{label='Memory.deAlloc$IF_END3}
// goto Memory.deAlloc$IF_END3
@Memory.deAlloc$IF_END3 // 3222
0;JMP // 3223

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
@Memory.deAlloc.EQ.31 // 3224
D=A // 3225
@SP // 3226
AM=M+1 // 3227
A=A-1 // 3228
M=D // 3229
@LCL // 3230
A=M+1 // 3231
A=A+1 // 3232
A=M+1 // 3233
D=M // 3234
D=D-1 // 3235
@DO_EQ // 3236
0;JMP // 3237
(Memory.deAlloc.EQ.31)
@Memory.deAlloc$IF_TRUE4 // 3238
D;JNE // 3239

////GotoInstruction{label='Memory.deAlloc$IF_END4}
// goto Memory.deAlloc$IF_END4
@Memory.deAlloc$IF_END4 // 3240
0;JMP // 3241

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

@LCL // 3242
A=M+1 // 3243
A=A+1 // 3244
A=M // 3245
D=M // 3246
@SP // 3247
AM=M+1 // 3248
A=A-1 // 3249
M=D // 3250
// call Memory.getBinIndex
@6 // 3251
D=A // 3252
@14 // 3253
M=D // 3254
@Memory.getBinIndex // 3255
D=A // 3256
@13 // 3257
M=D // 3258
@Memory.deAlloc.ret.3 // 3259
D=A // 3260
@CALL // 3261
0;JMP // 3262
(Memory.deAlloc.ret.3)
@SP // 3263
AM=M-1 // 3264
D=M // 3265
@2048 // 3266
D=D+A // 3267
@SP // 3268
AM=M+1 // 3269
A=A-1 // 3270
M=D // 3271
@LCL // 3272
A=M+1 // 3273
A=A+1 // 3274
D=M // 3275
@SP // 3276
AM=M+1 // 3277
A=A-1 // 3278
M=D // 3279
// call Memory.remove_node
@7 // 3280
D=A // 3281
@14 // 3282
M=D // 3283
@Memory.remove_node // 3284
D=A // 3285
@13 // 3286
M=D // 3287
@Memory.deAlloc.ret.4 // 3288
D=A // 3289
@CALL // 3290
0;JMP // 3291
(Memory.deAlloc.ret.4)
@SP // 3292
M=M-1 // 3293

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
@LCL // 3294
A=M // 3295
D=M // 3296
@SP // 3297
AM=M+1 // 3298
A=A-1 // 3299
M=D // 3300
@LCL // 3301
A=M // 3302
A=M // 3303
D=M // 3304
@SP // 3305
AM=M+1 // 3306
A=A-1 // 3307
M=D // 3308
@LCL // 3309
A=M+1 // 3310
A=A+1 // 3311
A=M // 3312
D=M // 3313
@SP // 3314
AM=M-1 // 3315
D=D+M // 3316
@5 // 3317
D=D+A // 3318
@SP // 3319
AM=M-1 // 3320
A=M // 3321
M=D // 3322

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 3323
A=M // 3324
D=M // 3325
@SP // 3326
AM=M+1 // 3327
A=A-1 // 3328
M=D // 3329
// call Memory.create_foot
@6 // 3330
D=A // 3331
@14 // 3332
M=D // 3333
@Memory.create_foot // 3334
D=A // 3335
@13 // 3336
M=D // 3337
@Memory.deAlloc.ret.5 // 3338
D=A // 3339
@CALL // 3340
0;JMP // 3341
(Memory.deAlloc.ret.5)
@SP // 3342
M=M-1 // 3343

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

@LCL // 3344
A=M // 3345
A=M // 3346
D=M // 3347
@SP // 3348
AM=M+1 // 3349
A=A-1 // 3350
M=D // 3351
// call Memory.getBinIndex
@6 // 3352
D=A // 3353
@14 // 3354
M=D // 3355
@Memory.getBinIndex // 3356
D=A // 3357
@13 // 3358
M=D // 3359
@Memory.deAlloc.ret.6 // 3360
D=A // 3361
@CALL // 3362
0;JMP // 3363
(Memory.deAlloc.ret.6)
@SP // 3364
AM=M-1 // 3365
D=M // 3366
@2048 // 3367
D=D+A // 3368
@SP // 3369
AM=M+1 // 3370
A=A-1 // 3371
M=D // 3372
@LCL // 3373
A=M // 3374
D=M // 3375
@SP // 3376
AM=M+1 // 3377
A=A-1 // 3378
M=D // 3379
// call Memory.add_node
@7 // 3380
D=A // 3381
@14 // 3382
M=D // 3383
@Memory.add_node // 3384
D=A // 3385
@13 // 3386
M=D // 3387
@Memory.deAlloc.ret.7 // 3388
D=A // 3389
@CALL // 3390
0;JMP // 3391
(Memory.deAlloc.ret.7)
@SP // 3392
M=M-1 // 3393

////PushInstruction("constant 0")
@SP // 3394
AM=M+1 // 3395
A=A-1 // 3396
M=0 // 3397
@RETURN // 3398
0;JMP // 3399

////FunctionInstruction{functionName='String.charAt', numLocals=0, funcMapping={String.dispose=1, String.appendChar=3, String.length=0, String.new=2}}
// function String.charAt with 0
(String.charAt)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=pointer 0}
//}

@ARG // 3400
A=M // 3401
D=M // 3402
@3 // 3403
M=D // 3404

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
@THIS // 3405
A=M // 3406
D=M // 3407
@ARG // 3408
A=M+1 // 3409
A=D+M // 3410
D=M // 3411
@SP // 3412
AM=M+1 // 3413
A=A-1 // 3414
M=D // 3415
@RETURN // 3416
0;JMP // 3417

////FunctionInstruction{functionName='Memory.copy', numLocals=1, funcMapping={Memory.deAlloc=8, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1}}
// function Memory.copy with 1
(Memory.copy)
@SP // 3418
AM=M+1 // 3419
A=A-1 // 3420
M=0 // 3421

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3422
A=M // 3423
M=0 // 3424

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
@Memory.copy.LT.32 // 3425
D=A // 3426
@SP // 3427
AM=M+1 // 3428
A=A-1 // 3429
M=D // 3430
@LCL // 3431
A=M // 3432
D=M // 3433
@ARG // 3434
A=M+1 // 3435
A=A+1 // 3436
D=D-M // 3437
@DO_LT // 3438
0;JMP // 3439
(Memory.copy.LT.32)
D=!D // 3440
@Memory.copy_WHILE_END1 // 3441
D;JNE // 3442

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
@ARG // 3443
A=M+1 // 3444
D=M // 3445
@LCL // 3446
A=M // 3447
D=D+M // 3448
@SP // 3449
AM=M+1 // 3450
A=A-1 // 3451
M=D // 3452
@ARG // 3453
A=M // 3454
D=M // 3455
@LCL // 3456
A=M // 3457
A=D+M // 3458
D=M // 3459
@SP // 3460
AM=M-1 // 3461
A=M // 3462
M=D // 3463

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

@LCL // 3464
A=M // 3465
M=M+1 // 3466

////GotoInstruction{label='Memory.copy_WHILE_EXP1}
// goto Memory.copy_WHILE_EXP1
@Memory.copy_WHILE_EXP1 // 3467
0;JMP // 3468

////LabelInstruction{label='Memory.copy_WHILE_END1}
// label Memory.copy_WHILE_END1
(Memory.copy_WHILE_END1)

////PushInstruction("constant 0")
@SP // 3469
AM=M+1 // 3470
A=A-1 // 3471
M=0 // 3472
@RETURN // 3473
0;JMP // 3474

////FunctionInstruction{functionName='Math.divide', numLocals=3, funcMapping={Math.abs=1, Math.twoToThe=0, Math.multiply=0}}
// function Math.divide with 3
(Math.divide)
@3 // 3475
D=A // 3476
@SP // 3477
AM=D+M // 3478
A=A-1 // 3479
M=0 // 3480
A=A-1 // 3481
M=0 // 3482
A=A-1 // 3483
M=0 // 3484

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 3485
A=M // 3486
D=M // 3487
@SP // 3488
AM=M+1 // 3489
A=A-1 // 3490
M=D // 3491
// call Math.abs
@6 // 3492
D=A // 3493
@14 // 3494
M=D // 3495
@Math.abs // 3496
D=A // 3497
@13 // 3498
M=D // 3499
@Math.divide.ret.0 // 3500
D=A // 3501
@CALL // 3502
0;JMP // 3503
(Math.divide.ret.0)
@SP // 3504
AM=M-1 // 3505
D=M // 3506
@LCL // 3507
A=M+1 // 3508
M=D // 3509

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 1")], call=CallInstruction{Math.abs}}
//  pop:  PopInstruction{address=local 2}
//}

@ARG // 3510
A=M+1 // 3511
D=M // 3512
@SP // 3513
AM=M+1 // 3514
A=A-1 // 3515
M=D // 3516
// call Math.abs
@6 // 3517
D=A // 3518
@14 // 3519
M=D // 3520
@Math.abs // 3521
D=A // 3522
@13 // 3523
M=D // 3524
@Math.divide.ret.1 // 3525
D=A // 3526
@CALL // 3527
0;JMP // 3528
(Math.divide.ret.1)
@SP // 3529
AM=M-1 // 3530
D=M // 3531
@LCL // 3532
A=M+1 // 3533
A=A+1 // 3534
M=D // 3535

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "GT"
//), ifGoto=IfGotoInstruction{label='Math.divide$IF_TRUE1}}
@Math.divide.GT.33 // 3536
D=A // 3537
@SP // 3538
AM=M+1 // 3539
A=A-1 // 3540
M=D // 3541
@LCL // 3542
A=M+1 // 3543
A=A+1 // 3544
D=M // 3545
A=A-1 // 3546
D=D-M // 3547
@DO_GT // 3548
0;JMP // 3549
(Math.divide.GT.33)
@Math.divide$IF_TRUE1 // 3550
D;JNE // 3551

////GotoInstruction{label='Math.divide$IF_END1}
// goto Math.divide$IF_END1
@Math.divide$IF_END1 // 3552
0;JMP // 3553

////LabelInstruction{label='Math.divide$IF_TRUE1}
// label Math.divide$IF_TRUE1
(Math.divide$IF_TRUE1)

////PushInstruction("constant 0")
@SP // 3554
AM=M+1 // 3555
A=A-1 // 3556
M=0 // 3557
@RETURN // 3558
0;JMP // 3559

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

@LCL // 3560
A=M+1 // 3561
D=M // 3562
@SP // 3563
AM=M+1 // 3564
A=A-1 // 3565
M=D // 3566
@LCL // 3567
A=M+1 // 3568
A=A+1 // 3569
D=M // 3570
D=D+M // 3571
@SP // 3572
AM=M+1 // 3573
A=A-1 // 3574
M=D // 3575
// call Math.divide
@7 // 3576
D=A // 3577
@14 // 3578
M=D // 3579
@Math.divide // 3580
D=A // 3581
@13 // 3582
M=D // 3583
@Math.divide.ret.2 // 3584
D=A // 3585
@CALL // 3586
0;JMP // 3587
(Math.divide.ret.2)
@SP // 3588
AM=M-1 // 3589
D=M // 3590
@LCL // 3591
A=M // 3592
M=D // 3593

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
@Math.divide.LT.34 // 3594
D=A // 3595
@SP // 3596
AM=M+1 // 3597
A=A-1 // 3598
M=D // 3599
@LCL // 3600
A=M+1 // 3601
D=M // 3602
@SP // 3603
AM=M+1 // 3604
A=A-1 // 3605
M=D // 3606
@LCL // 3607
A=M // 3608
D=M // 3609
D=D+M // 3610
@SP // 3611
AM=M+1 // 3612
A=A-1 // 3613
M=D // 3614
@LCL // 3615
A=M+1 // 3616
A=A+1 // 3617
D=M // 3618
@SP // 3619
AM=M+1 // 3620
A=A-1 // 3621
M=D // 3622
// call Math.multiply
@7 // 3623
D=A // 3624
@14 // 3625
M=D // 3626
@Math.multiply // 3627
D=A // 3628
@13 // 3629
M=D // 3630
@Math.divide.ret.3 // 3631
D=A // 3632
@CALL // 3633
0;JMP // 3634
(Math.divide.ret.3)
@SP // 3635
AM=M-1 // 3636
D=M // 3637
@SP // 3638
AM=M-1 // 3639
D=M-D // 3640
@SP // 3641
AM=M+1 // 3642
A=A-1 // 3643
M=D // 3644
@LCL // 3645
A=M+1 // 3646
A=A+1 // 3647
D=M // 3648
@SP // 3649
AM=M-1 // 3650
D=M-D // 3651
@DO_LT // 3652
0;JMP // 3653
(Math.divide.LT.34)
@Math.divide$IF_TRUE2 // 3654
D;JNE // 3655

////GotoInstruction{label='Math.divide$IF_FALSE2}
// goto Math.divide$IF_FALSE2
@Math.divide$IF_FALSE2 // 3656
0;JMP // 3657

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
@Math.divide.LT.35 // 3658
D=A // 3659
@SP // 3660
AM=M+1 // 3661
A=A-1 // 3662
M=D // 3663
@ARG // 3664
A=M // 3665
D=M // 3666
@DO_LT // 3667
0;JMP // 3668
(Math.divide.LT.35)
@SP // 3669
AM=M+1 // 3670
A=A-1 // 3671
M=D // 3672
@Math.divide.GT.36 // 3673
D=A // 3674
@SP // 3675
AM=M+1 // 3676
A=A-1 // 3677
M=D // 3678
@ARG // 3679
A=M+1 // 3680
D=M // 3681
@DO_GT // 3682
0;JMP // 3683
(Math.divide.GT.36)
@SP // 3684
AM=M-1 // 3685
D=D&M // 3686
@SP // 3687
AM=M+1 // 3688
A=A-1 // 3689
M=D // 3690
@Math.divide.GT.37 // 3691
D=A // 3692
@SP // 3693
AM=M+1 // 3694
A=A-1 // 3695
M=D // 3696
@ARG // 3697
A=M // 3698
D=M // 3699
@DO_GT // 3700
0;JMP // 3701
(Math.divide.GT.37)
@SP // 3702
AM=M+1 // 3703
A=A-1 // 3704
M=D // 3705
@Math.divide.LT.38 // 3706
D=A // 3707
@SP // 3708
AM=M+1 // 3709
A=A-1 // 3710
M=D // 3711
@ARG // 3712
A=M+1 // 3713
D=M // 3714
@DO_LT // 3715
0;JMP // 3716
(Math.divide.LT.38)
@SP // 3717
AM=M-1 // 3718
D=D&M // 3719
@SP // 3720
AM=M-1 // 3721
D=D|M // 3722
@Math.divide$IF_TRUE3 // 3723
D;JNE // 3724

////GotoInstruction{label='Math.divide$IF_END3}
// goto Math.divide$IF_END3
@Math.divide$IF_END3 // 3725
0;JMP // 3726

////LabelInstruction{label='Math.divide$IF_TRUE3}
// label Math.divide$IF_TRUE3
(Math.divide$IF_TRUE3)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3727
A=M // 3728
D=-M // 3729
@LCL // 3730
A=M // 3731
M=D // 3732

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
@LCL // 3733
A=M // 3734
D=M // 3735
D=D+M // 3736
@SP // 3737
AM=M+1 // 3738
A=A-1 // 3739
M=D // 3740
@RETURN // 3741
0;JMP // 3742

////GotoInstruction{label='Math.divide$IF_END2}
// goto Math.divide$IF_END2
@Math.divide$IF_END2 // 3743
0;JMP // 3744

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
@Math.divide.LT.39 // 3745
D=A // 3746
@SP // 3747
AM=M+1 // 3748
A=A-1 // 3749
M=D // 3750
@ARG // 3751
A=M // 3752
D=M // 3753
@DO_LT // 3754
0;JMP // 3755
(Math.divide.LT.39)
@SP // 3756
AM=M+1 // 3757
A=A-1 // 3758
M=D // 3759
@Math.divide.GT.40 // 3760
D=A // 3761
@SP // 3762
AM=M+1 // 3763
A=A-1 // 3764
M=D // 3765
@ARG // 3766
A=M+1 // 3767
D=M // 3768
@DO_GT // 3769
0;JMP // 3770
(Math.divide.GT.40)
@SP // 3771
AM=M-1 // 3772
D=D&M // 3773
@SP // 3774
AM=M+1 // 3775
A=A-1 // 3776
M=D // 3777
@Math.divide.GT.41 // 3778
D=A // 3779
@SP // 3780
AM=M+1 // 3781
A=A-1 // 3782
M=D // 3783
@ARG // 3784
A=M // 3785
D=M // 3786
@DO_GT // 3787
0;JMP // 3788
(Math.divide.GT.41)
@SP // 3789
AM=M+1 // 3790
A=A-1 // 3791
M=D // 3792
@Math.divide.LT.42 // 3793
D=A // 3794
@SP // 3795
AM=M+1 // 3796
A=A-1 // 3797
M=D // 3798
@ARG // 3799
A=M+1 // 3800
D=M // 3801
@DO_LT // 3802
0;JMP // 3803
(Math.divide.LT.42)
@SP // 3804
AM=M-1 // 3805
D=D&M // 3806
@SP // 3807
AM=M-1 // 3808
D=D|M // 3809
@Math.divide$IF_TRUE4 // 3810
D;JNE // 3811

////GotoInstruction{label='Math.divide$IF_END4}
// goto Math.divide$IF_END4
@Math.divide$IF_END4 // 3812
0;JMP // 3813

////LabelInstruction{label='Math.divide$IF_TRUE4}
// label Math.divide$IF_TRUE4
(Math.divide$IF_TRUE4)

////PushPopPair {
//  push: UnaryPushGroup(    PushInstruction("local 0"),
//NEG)
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 3814
A=M // 3815
D=-M // 3816
@LCL // 3817
A=M // 3818
M=D // 3819

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
@LCL // 3820
A=M // 3821
D=M // 3822
D=D+M // 3823
D=D+1 // 3824
@SP // 3825
AM=M+1 // 3826
A=A-1 // 3827
M=D // 3828
@RETURN // 3829
0;JMP // 3830

////LabelInstruction{label='Math.divide$IF_END2}
// label Math.divide$IF_END2
(Math.divide$IF_END2)

////FunctionInstruction{functionName='Screen.drawLine', numLocals=6, funcMapping={Screen.init=0, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawLine with 6
(Screen.drawLine)
@6 // 3831
D=A // 3832
@SP // 3833
AM=D+M // 3834
A=A-1 // 3835
M=0 // 3836
A=A-1 // 3837
M=0 // 3838
A=A-1 // 3839
M=0 // 3840
A=A-1 // 3841
M=0 // 3842
A=A-1 // 3843
M=0 // 3844
A=A-1 // 3845
M=0 // 3846

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

@ARG // 3847
A=M+1 // 3848
A=A+1 // 3849
D=M // 3850
A=A-1 // 3851
A=A-1 // 3852
D=D-M // 3853
@SP // 3854
AM=M+1 // 3855
A=A-1 // 3856
M=D // 3857
// call Math.abs
@6 // 3858
D=A // 3859
@14 // 3860
M=D // 3861
@Math.abs // 3862
D=A // 3863
@13 // 3864
M=D // 3865
@Screen.drawLine.ret.0 // 3866
D=A // 3867
@CALL // 3868
0;JMP // 3869
(Screen.drawLine.ret.0)
@SP // 3870
AM=M-1 // 3871
D=M // 3872
@LCL // 3873
A=M // 3874
M=D // 3875

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

@ARG // 3876
A=M+1 // 3877
A=A+1 // 3878
A=A+1 // 3879
D=M // 3880
A=A-1 // 3881
A=A-1 // 3882
D=D-M // 3883
@SP // 3884
AM=M+1 // 3885
A=A-1 // 3886
M=D // 3887
// call Math.abs
@6 // 3888
D=A // 3889
@14 // 3890
M=D // 3891
@Math.abs // 3892
D=A // 3893
@13 // 3894
M=D // 3895
@Screen.drawLine.ret.1 // 3896
D=A // 3897
@CALL // 3898
0;JMP // 3899
(Screen.drawLine.ret.1)
@SP // 3900
AM=M-1 // 3901
D=M // 3902
@LCL // 3903
A=M+1 // 3904
M=D // 3905

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("argument 2"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawLine$IF_TRUE1}}
@Screen.drawLine.LT.43 // 3906
D=A // 3907
@SP // 3908
AM=M+1 // 3909
A=A-1 // 3910
M=D // 3911
@ARG // 3912
A=M+1 // 3913
A=A+1 // 3914
D=M // 3915
A=A-1 // 3916
A=A-1 // 3917
D=M-D // 3918
@DO_LT // 3919
0;JMP // 3920
(Screen.drawLine.LT.43)
@Screen.drawLine$IF_TRUE1 // 3921
D;JNE // 3922

////GotoInstruction{label='Screen.drawLine$IF_FALSE1}
// goto Screen.drawLine$IF_FALSE1
@Screen.drawLine$IF_FALSE1 // 3923
0;JMP // 3924

////LabelInstruction{label='Screen.drawLine$IF_TRUE1}
// label Screen.drawLine$IF_TRUE1
(Screen.drawLine$IF_TRUE1)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3925
A=M+1 // 3926
A=A+1 // 3927
M=1 // 3928

////GotoInstruction{label='Screen.drawLine$IF_END1}
// goto Screen.drawLine$IF_END1
@Screen.drawLine$IF_END1 // 3929
0;JMP // 3930

////LabelInstruction{label='Screen.drawLine$IF_FALSE1}
// label Screen.drawLine$IF_FALSE1
(Screen.drawLine$IF_FALSE1)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 2}
//}

@LCL // 3931
A=M+1 // 3932
A=A+1 // 3933
M=-1 // 3934

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
@Screen.drawLine.LT.44 // 3935
D=A // 3936
@SP // 3937
AM=M+1 // 3938
A=A-1 // 3939
M=D // 3940
@ARG // 3941
A=M+1 // 3942
A=A+1 // 3943
A=A+1 // 3944
D=M // 3945
A=A-1 // 3946
A=A-1 // 3947
D=M-D // 3948
@DO_LT // 3949
0;JMP // 3950
(Screen.drawLine.LT.44)
@Screen.drawLine$IF_TRUE2 // 3951
D;JNE // 3952

////GotoInstruction{label='Screen.drawLine$IF_FALSE2}
// goto Screen.drawLine$IF_FALSE2
@Screen.drawLine$IF_FALSE2 // 3953
0;JMP // 3954

////LabelInstruction{label='Screen.drawLine$IF_TRUE2}
// label Screen.drawLine$IF_TRUE2
(Screen.drawLine$IF_TRUE2)

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 3955
A=M+1 // 3956
A=A+1 // 3957
A=A+1 // 3958
M=1 // 3959

////GotoInstruction{label='Screen.drawLine$IF_END2}
// goto Screen.drawLine$IF_END2
@Screen.drawLine$IF_END2 // 3960
0;JMP // 3961

////LabelInstruction{label='Screen.drawLine$IF_FALSE2}
// label Screen.drawLine$IF_FALSE2
(Screen.drawLine$IF_FALSE2)

////PushPopPair {
//  push: PushInstruction("constant -1")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 3962
A=M+1 // 3963
A=A+1 // 3964
A=A+1 // 3965
M=-1 // 3966

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

@LCL // 3967
A=M+1 // 3968
D=M // 3969
A=A-1 // 3970
D=M-D // 3971
@SP // 3972
AM=M+1 // 3973
A=A-1 // 3974
M=D // 3975
@LCL // 3976
D=M // 3977
@4 // 3978
A=D+A // 3979
D=A // 3980
@R13 // 3981
M=D // 3982
@SP // 3983
AM=M-1 // 3984
D=M // 3985
@R13 // 3986
A=M // 3987
M=D // 3988

////LabelInstruction{label='Screen.drawLine_WHILE_EXP1}
// label Screen.drawLine_WHILE_EXP1
(Screen.drawLine_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Screen.drawLine_WHILE_END1}}
D=0 // 3989
@Screen.drawLine_WHILE_END1 // 3990
D;JNE // 3991

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0"), PushInstruction("argument 1")], call=CallInstruction{Screen.drawPixel}}
//  pop:  PopInstruction{address=temp 0}
//}

@ARG // 3992
A=M // 3993
D=M // 3994
@SP // 3995
AM=M+1 // 3996
A=A-1 // 3997
M=D // 3998
@ARG // 3999
A=M+1 // 4000
D=M // 4001
@SP // 4002
AM=M+1 // 4003
A=A-1 // 4004
M=D // 4005
// call Screen.drawPixel
@7 // 4006
D=A // 4007
@14 // 4008
M=D // 4009
@Screen.drawPixel // 4010
D=A // 4011
@13 // 4012
M=D // 4013
@Screen.drawLine.ret.2 // 4014
D=A // 4015
@CALL // 4016
0;JMP // 4017
(Screen.drawLine.ret.2)
@SP // 4018
M=M-1 // 4019

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
@Screen.drawLine.EQ.45 // 4020
D=A // 4021
@SP // 4022
AM=M+1 // 4023
A=A-1 // 4024
M=D // 4025
@ARG // 4026
A=M+1 // 4027
A=A+1 // 4028
D=M // 4029
A=A-1 // 4030
A=A-1 // 4031
D=M-D // 4032
@DO_EQ // 4033
0;JMP // 4034
(Screen.drawLine.EQ.45)
@SP // 4035
AM=M+1 // 4036
A=A-1 // 4037
M=D // 4038
@Screen.drawLine.EQ.46 // 4039
D=A // 4040
@SP // 4041
AM=M+1 // 4042
A=A-1 // 4043
M=D // 4044
@ARG // 4045
A=M+1 // 4046
A=A+1 // 4047
A=A+1 // 4048
D=M // 4049
A=A-1 // 4050
A=A-1 // 4051
D=M-D // 4052
@DO_EQ // 4053
0;JMP // 4054
(Screen.drawLine.EQ.46)
@SP // 4055
AM=M-1 // 4056
D=D&M // 4057
@Screen.drawLine$IF_TRUE3 // 4058
D;JNE // 4059

////GotoInstruction{label='Screen.drawLine$IF_END3}
// goto Screen.drawLine$IF_END3
@Screen.drawLine$IF_END3 // 4060
0;JMP // 4061

////LabelInstruction{label='Screen.drawLine$IF_TRUE3}
// label Screen.drawLine$IF_TRUE3
(Screen.drawLine$IF_TRUE3)

////PushInstruction("constant 0")
@SP // 4062
AM=M+1 // 4063
A=A-1 // 4064
M=0 // 4065
@RETURN // 4066
0;JMP // 4067

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

@LCL // 4068
D=M // 4069
@4 // 4070
A=D+A // 4071
D=M // 4072
D=D+M // 4073
@SP // 4074
AM=M+1 // 4075
A=A-1 // 4076
M=D // 4077
@LCL // 4078
D=M // 4079
@5 // 4080
A=D+A // 4081
D=A // 4082
@R13 // 4083
M=D // 4084
@SP // 4085
AM=M-1 // 4086
D=M // 4087
@R13 // 4088
A=M // 4089
M=D // 4090

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
@Screen.drawLine.GT.47 // 4091
D=A // 4092
@SP // 4093
AM=M+1 // 4094
A=A-1 // 4095
M=D // 4096
@LCL // 4097
D=M // 4098
@5 // 4099
A=D+A // 4100
D=M // 4101
@SP // 4102
AM=M+1 // 4103
A=A-1 // 4104
M=D // 4105
@LCL // 4106
A=M+1 // 4107
D=M // 4108
@SP // 4109
AM=M-1 // 4110
D=D+M // 4111
@DO_GT // 4112
0;JMP // 4113
(Screen.drawLine.GT.47)
@Screen.drawLine$IF_TRUE4 // 4114
D;JNE // 4115

////GotoInstruction{label='Screen.drawLine$IF_END4}
// goto Screen.drawLine$IF_END4
@Screen.drawLine$IF_END4 // 4116
0;JMP // 4117

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

@LCL // 4118
D=M // 4119
@4 // 4120
A=D+A // 4121
D=M // 4122
A=A-1 // 4123
A=A-1 // 4124
A=A-1 // 4125
D=D-M // 4126
@SP // 4127
AM=M+1 // 4128
A=A-1 // 4129
M=D // 4130
@LCL // 4131
D=M // 4132
@4 // 4133
A=D+A // 4134
D=A // 4135
@R13 // 4136
M=D // 4137
@SP // 4138
AM=M-1 // 4139
D=M // 4140
@R13 // 4141
A=M // 4142
M=D // 4143

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

@LCL // 4144
A=M+1 // 4145
A=A+1 // 4146
D=M // 4147
@ARG // 4148
A=M // 4149
M=D+M // 4150

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
@Screen.drawLine.LT.48 // 4151
D=A // 4152
@SP // 4153
AM=M+1 // 4154
A=A-1 // 4155
M=D // 4156
@LCL // 4157
D=M // 4158
@5 // 4159
A=D+A // 4160
D=M // 4161
@SP // 4162
AM=M+1 // 4163
A=A-1 // 4164
M=D // 4165
@LCL // 4166
A=M // 4167
D=M // 4168
@SP // 4169
AM=M-1 // 4170
D=M-D // 4171
@DO_LT // 4172
0;JMP // 4173
(Screen.drawLine.LT.48)
@Screen.drawLine$IF_TRUE5 // 4174
D;JNE // 4175

////GotoInstruction{label='Screen.drawLine$IF_END5}
// goto Screen.drawLine$IF_END5
@Screen.drawLine$IF_END5 // 4176
0;JMP // 4177

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

@LCL // 4178
D=M // 4179
@4 // 4180
A=D+A // 4181
D=M // 4182
@SP // 4183
AM=M+1 // 4184
A=A-1 // 4185
M=D // 4186
@LCL // 4187
A=M // 4188
D=M // 4189
@SP // 4190
AM=M-1 // 4191
D=D+M // 4192
@SP // 4193
AM=M+1 // 4194
A=A-1 // 4195
M=D // 4196
@LCL // 4197
D=M // 4198
@4 // 4199
A=D+A // 4200
D=A // 4201
@R13 // 4202
M=D // 4203
@SP // 4204
AM=M-1 // 4205
D=M // 4206
@R13 // 4207
A=M // 4208
M=D // 4209

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

@LCL // 4210
A=M+1 // 4211
A=A+1 // 4212
A=A+1 // 4213
D=M // 4214
@ARG // 4215
A=M+1 // 4216
M=D+M // 4217

////LabelInstruction{label='Screen.drawLine$IF_END5}
// label Screen.drawLine$IF_END5
(Screen.drawLine$IF_END5)

////GotoInstruction{label='Screen.drawLine_WHILE_EXP1}
// goto Screen.drawLine_WHILE_EXP1
@Screen.drawLine_WHILE_EXP1 // 4218
0;JMP // 4219

////LabelInstruction{label='Screen.drawLine_WHILE_END1}
// label Screen.drawLine_WHILE_END1
(Screen.drawLine_WHILE_END1)

////PushInstruction("constant 0")
@SP // 4220
AM=M+1 // 4221
A=A-1 // 4222
M=0 // 4223
@RETURN // 4224
0;JMP // 4225

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
@Math.max.GT.49 // 4226
D=A // 4227
@SP // 4228
AM=M+1 // 4229
A=A-1 // 4230
M=D // 4231
@ARG // 4232
A=M+1 // 4233
D=M // 4234
A=A-1 // 4235
D=M-D // 4236
@DO_GT // 4237
0;JMP // 4238
(Math.max.GT.49)
@Math.max$IF_TRUE1 // 4239
D;JNE // 4240

////GotoInstruction{label='Math.max$IF_END1}
// goto Math.max$IF_END1
@Math.max$IF_END1 // 4241
0;JMP // 4242

////LabelInstruction{label='Math.max$IF_TRUE1}
// label Math.max$IF_TRUE1
(Math.max$IF_TRUE1)

////PushInstruction("argument 0")
@ARG // 4243
A=M // 4244
D=M // 4245
@SP // 4246
AM=M+1 // 4247
A=A-1 // 4248
M=D // 4249
@RETURN // 4250
0;JMP // 4251

////LabelInstruction{label='Math.max$IF_END1}
// label Math.max$IF_END1
(Math.max$IF_END1)

////PushInstruction("argument 1")
@ARG // 4252
A=M+1 // 4253
D=M // 4254
@SP // 4255
AM=M+1 // 4256
A=A-1 // 4257
M=D // 4258
@RETURN // 4259
0;JMP // 4260

////FunctionInstruction{functionName='Main.main', numLocals=1, funcMapping={}}
// function Main.main with 1
(Main.main)
@SP // 4261
AM=M+1 // 4262
A=A-1 // 4263
M=0 // 4264

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 220"), PushInstruction("constant 511"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4265
AM=M+1 // 4266
A=A-1 // 4267
M=0 // 4268
@220 // 4269
D=A // 4270
@SP // 4271
AM=M+1 // 4272
A=A-1 // 4273
M=D // 4274
@511 // 4275
D=A // 4276
@SP // 4277
AM=M+1 // 4278
A=A-1 // 4279
M=D // 4280
@220 // 4281
D=A // 4282
@SP // 4283
AM=M+1 // 4284
A=A-1 // 4285
M=D // 4286
// call Screen.drawLine
@9 // 4287
D=A // 4288
@14 // 4289
M=D // 4290
@Screen.drawLine // 4291
D=A // 4292
@13 // 4293
M=D // 4294
@Main.main.ret.0 // 4295
D=A // 4296
@CALL // 4297
0;JMP // 4298
(Main.main.ret.0)
@SP // 4299
M=M-1 // 4300

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 410"), PushInstruction("constant 220")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4301
D=A // 4302
@SP // 4303
AM=M+1 // 4304
A=A-1 // 4305
M=D // 4306
@90 // 4307
D=A // 4308
@SP // 4309
AM=M+1 // 4310
A=A-1 // 4311
M=D // 4312
@410 // 4313
D=A // 4314
@SP // 4315
AM=M+1 // 4316
A=A-1 // 4317
M=D // 4318
@220 // 4319
D=A // 4320
@SP // 4321
AM=M+1 // 4322
A=A-1 // 4323
M=D // 4324
// call Screen.drawRectangle
@9 // 4325
D=A // 4326
@14 // 4327
M=D // 4328
@Screen.drawRectangle // 4329
D=A // 4330
@13 // 4331
M=D // 4332
@Main.main.ret.1 // 4333
D=A // 4334
@CALL // 4335
0;JMP // 4336
(Main.main.ret.1)
@SP // 4337
M=M-1 // 4338

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4339
AM=M+1 // 4340
A=A-1 // 4341
M=0 // 4342
// call Screen.setColor
@6 // 4343
D=A // 4344
@14 // 4345
M=D // 4346
@Screen.setColor // 4347
D=A // 4348
@13 // 4349
M=D // 4350
@Main.main.ret.2 // 4351
D=A // 4352
@CALL // 4353
0;JMP // 4354
(Main.main.ret.2)
@SP // 4355
M=M-1 // 4356

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 350"), PushInstruction("constant 120"), PushInstruction("constant 390"), PushInstruction("constant 219")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@350 // 4357
D=A // 4358
@SP // 4359
AM=M+1 // 4360
A=A-1 // 4361
M=D // 4362
@120 // 4363
D=A // 4364
@SP // 4365
AM=M+1 // 4366
A=A-1 // 4367
M=D // 4368
@390 // 4369
D=A // 4370
@SP // 4371
AM=M+1 // 4372
A=A-1 // 4373
M=D // 4374
@219 // 4375
D=A // 4376
@SP // 4377
AM=M+1 // 4378
A=A-1 // 4379
M=D // 4380
// call Screen.drawRectangle
@9 // 4381
D=A // 4382
@14 // 4383
M=D // 4384
@Screen.drawRectangle // 4385
D=A // 4386
@13 // 4387
M=D // 4388
@Main.main.ret.3 // 4389
D=A // 4390
@CALL // 4391
0;JMP // 4392
(Main.main.ret.3)
@SP // 4393
M=M-1 // 4394

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 292"), PushInstruction("constant 120"), PushInstruction("constant 332"), PushInstruction("constant 150")], call=CallInstruction{Screen.drawRectangle}}
//  pop:  PopInstruction{address=temp 0}
//}

@292 // 4395
D=A // 4396
@SP // 4397
AM=M+1 // 4398
A=A-1 // 4399
M=D // 4400
@120 // 4401
D=A // 4402
@SP // 4403
AM=M+1 // 4404
A=A-1 // 4405
M=D // 4406
@332 // 4407
D=A // 4408
@SP // 4409
AM=M+1 // 4410
A=A-1 // 4411
M=D // 4412
@150 // 4413
D=A // 4414
@SP // 4415
AM=M+1 // 4416
A=A-1 // 4417
M=D // 4418
// call Screen.drawRectangle
@9 // 4419
D=A // 4420
@14 // 4421
M=D // 4422
@Screen.drawRectangle // 4423
D=A // 4424
@13 // 4425
M=D // 4426
@Main.main.ret.4 // 4427
D=A // 4428
@CALL // 4429
0;JMP // 4430
(Main.main.ret.4)
@SP // 4431
M=M-1 // 4432

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant -1")], call=CallInstruction{Screen.setColor}}
//  pop:  PopInstruction{address=temp 0}
//}

@SP // 4433
AM=M+1 // 4434
A=A-1 // 4435
M=-1 // 4436
// call Screen.setColor
@6 // 4437
D=A // 4438
@14 // 4439
M=D // 4440
@Screen.setColor // 4441
D=A // 4442
@13 // 4443
M=D // 4444
@Main.main.ret.5 // 4445
D=A // 4446
@CALL // 4447
0;JMP // 4448
(Main.main.ret.5)
@SP // 4449
M=M-1 // 4450

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 360"), PushInstruction("constant 170"), PushInstruction("constant 3")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@360 // 4451
D=A // 4452
@SP // 4453
AM=M+1 // 4454
A=A-1 // 4455
M=D // 4456
@170 // 4457
D=A // 4458
@SP // 4459
AM=M+1 // 4460
A=A-1 // 4461
M=D // 4462
@3 // 4463
D=A // 4464
@SP // 4465
AM=M+1 // 4466
A=A-1 // 4467
M=D // 4468
// call Screen.drawCircle
@8 // 4469
D=A // 4470
@14 // 4471
M=D // 4472
@Screen.drawCircle // 4473
D=A // 4474
@13 // 4475
M=D // 4476
@Main.main.ret.6 // 4477
D=A // 4478
@CALL // 4479
0;JMP // 4480
(Main.main.ret.6)
@SP // 4481
M=M-1 // 4482

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 280"), PushInstruction("constant 90"), PushInstruction("constant 345"), PushInstruction("constant 35")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@280 // 4483
D=A // 4484
@SP // 4485
AM=M+1 // 4486
A=A-1 // 4487
M=D // 4488
@90 // 4489
D=A // 4490
@SP // 4491
AM=M+1 // 4492
A=A-1 // 4493
M=D // 4494
@345 // 4495
D=A // 4496
@SP // 4497
AM=M+1 // 4498
A=A-1 // 4499
M=D // 4500
@35 // 4501
D=A // 4502
@SP // 4503
AM=M+1 // 4504
A=A-1 // 4505
M=D // 4506
// call Screen.drawLine
@9 // 4507
D=A // 4508
@14 // 4509
M=D // 4510
@Screen.drawLine // 4511
D=A // 4512
@13 // 4513
M=D // 4514
@Main.main.ret.7 // 4515
D=A // 4516
@CALL // 4517
0;JMP // 4518
(Main.main.ret.7)
@SP // 4519
M=M-1 // 4520

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 345"), PushInstruction("constant 35"), PushInstruction("constant 410"), PushInstruction("constant 90")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@345 // 4521
D=A // 4522
@SP // 4523
AM=M+1 // 4524
A=A-1 // 4525
M=D // 4526
@35 // 4527
D=A // 4528
@SP // 4529
AM=M+1 // 4530
A=A-1 // 4531
M=D // 4532
@410 // 4533
D=A // 4534
@SP // 4535
AM=M+1 // 4536
A=A-1 // 4537
M=D // 4538
@90 // 4539
D=A // 4540
@SP // 4541
AM=M+1 // 4542
A=A-1 // 4543
M=D // 4544
// call Screen.drawLine
@9 // 4545
D=A // 4546
@14 // 4547
M=D // 4548
@Screen.drawLine // 4549
D=A // 4550
@13 // 4551
M=D // 4552
@Main.main.ret.8 // 4553
D=A // 4554
@CALL // 4555
0;JMP // 4556
(Main.main.ret.8)
@SP // 4557
M=M-1 // 4558

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 60"), PushInstruction("constant 30")], call=CallInstruction{Screen.drawCircle}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4559
D=A // 4560
@SP // 4561
AM=M+1 // 4562
A=A-1 // 4563
M=D // 4564
@60 // 4565
D=A // 4566
@SP // 4567
AM=M+1 // 4568
A=A-1 // 4569
M=D // 4570
@30 // 4571
D=A // 4572
@SP // 4573
AM=M+1 // 4574
A=A-1 // 4575
M=D // 4576
// call Screen.drawCircle
@8 // 4577
D=A // 4578
@14 // 4579
M=D // 4580
@Screen.drawCircle // 4581
D=A // 4582
@13 // 4583
M=D // 4584
@Main.main.ret.9 // 4585
D=A // 4586
@CALL // 4587
0;JMP // 4588
(Main.main.ret.9)
@SP // 4589
M=M-1 // 4590

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 26"), PushInstruction("constant 140"), PushInstruction("constant 6")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4591
D=A // 4592
@SP // 4593
AM=M+1 // 4594
A=A-1 // 4595
M=D // 4596
@26 // 4597
D=A // 4598
@SP // 4599
AM=M+1 // 4600
A=A-1 // 4601
M=D // 4602
@140 // 4603
D=A // 4604
@SP // 4605
AM=M+1 // 4606
A=A-1 // 4607
M=D // 4608
@6 // 4609
D=A // 4610
@SP // 4611
AM=M+1 // 4612
A=A-1 // 4613
M=D // 4614
// call Screen.drawLine
@9 // 4615
D=A // 4616
@14 // 4617
M=D // 4618
@Screen.drawLine // 4619
D=A // 4620
@13 // 4621
M=D // 4622
@Main.main.ret.10 // 4623
D=A // 4624
@CALL // 4625
0;JMP // 4626
(Main.main.ret.10)
@SP // 4627
M=M-1 // 4628

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 35"), PushInstruction("constant 178"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4629
D=A // 4630
@SP // 4631
AM=M+1 // 4632
A=A-1 // 4633
M=D // 4634
@35 // 4635
D=A // 4636
@SP // 4637
AM=M+1 // 4638
A=A-1 // 4639
M=D // 4640
@178 // 4641
D=A // 4642
@SP // 4643
AM=M+1 // 4644
A=A-1 // 4645
M=D // 4646
@20 // 4647
D=A // 4648
@SP // 4649
AM=M+1 // 4650
A=A-1 // 4651
M=D // 4652
// call Screen.drawLine
@9 // 4653
D=A // 4654
@14 // 4655
M=D // 4656
@Screen.drawLine // 4657
D=A // 4658
@13 // 4659
M=D // 4660
@Main.main.ret.11 // 4661
D=A // 4662
@CALL // 4663
0;JMP // 4664
(Main.main.ret.11)
@SP // 4665
M=M-1 // 4666

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 174"), PushInstruction("constant 60"), PushInstruction("constant 194"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@174 // 4667
D=A // 4668
@SP // 4669
AM=M+1 // 4670
A=A-1 // 4671
M=D // 4672
@60 // 4673
D=A // 4674
@SP // 4675
AM=M+1 // 4676
A=A-1 // 4677
M=D // 4678
@194 // 4679
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
// call Screen.drawLine
@9 // 4691
D=A // 4692
@14 // 4693
M=D // 4694
@Screen.drawLine // 4695
D=A // 4696
@13 // 4697
M=D // 4698
@Main.main.ret.12 // 4699
D=A // 4700
@CALL // 4701
0;JMP // 4702
(Main.main.ret.12)
@SP // 4703
M=M-1 // 4704

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 163"), PushInstruction("constant 85"), PushInstruction("constant 178"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@163 // 4705
D=A // 4706
@SP // 4707
AM=M+1 // 4708
A=A-1 // 4709
M=D // 4710
@85 // 4711
D=A // 4712
@SP // 4713
AM=M+1 // 4714
A=A-1 // 4715
M=D // 4716
@178 // 4717
D=A // 4718
@SP // 4719
AM=M+1 // 4720
A=A-1 // 4721
M=D // 4722
@100 // 4723
D=A // 4724
@SP // 4725
AM=M+1 // 4726
A=A-1 // 4727
M=D // 4728
// call Screen.drawLine
@9 // 4729
D=A // 4730
@14 // 4731
M=D // 4732
@Screen.drawLine // 4733
D=A // 4734
@13 // 4735
M=D // 4736
@Main.main.ret.13 // 4737
D=A // 4738
@CALL // 4739
0;JMP // 4740
(Main.main.ret.13)
@SP // 4741
M=M-1 // 4742

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 140"), PushInstruction("constant 94"), PushInstruction("constant 140"), PushInstruction("constant 114")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@140 // 4743
D=A // 4744
@SP // 4745
AM=M+1 // 4746
A=A-1 // 4747
M=D // 4748
@94 // 4749
D=A // 4750
@SP // 4751
AM=M+1 // 4752
A=A-1 // 4753
M=D // 4754
@140 // 4755
D=A // 4756
@SP // 4757
AM=M+1 // 4758
A=A-1 // 4759
M=D // 4760
@114 // 4761
D=A // 4762
@SP // 4763
AM=M+1 // 4764
A=A-1 // 4765
M=D // 4766
// call Screen.drawLine
@9 // 4767
D=A // 4768
@14 // 4769
M=D // 4770
@Screen.drawLine // 4771
D=A // 4772
@13 // 4773
M=D // 4774
@Main.main.ret.14 // 4775
D=A // 4776
@CALL // 4777
0;JMP // 4778
(Main.main.ret.14)
@SP // 4779
M=M-1 // 4780

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 85"), PushInstruction("constant 102"), PushInstruction("constant 100")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4781
D=A // 4782
@SP // 4783
AM=M+1 // 4784
A=A-1 // 4785
M=D // 4786
@85 // 4787
D=A // 4788
@SP // 4789
AM=M+1 // 4790
A=A-1 // 4791
M=D // 4792
@102 // 4793
D=A // 4794
@SP // 4795
AM=M+1 // 4796
A=A-1 // 4797
M=D // 4798
@100 // 4799
D=A // 4800
@SP // 4801
AM=M+1 // 4802
A=A-1 // 4803
M=D // 4804
// call Screen.drawLine
@9 // 4805
D=A // 4806
@14 // 4807
M=D // 4808
@Screen.drawLine // 4809
D=A // 4810
@13 // 4811
M=D // 4812
@Main.main.ret.15 // 4813
D=A // 4814
@CALL // 4815
0;JMP // 4816
(Main.main.ret.15)
@SP // 4817
M=M-1 // 4818

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 60"), PushInstruction("constant 86"), PushInstruction("constant 60")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 4819
D=A // 4820
@SP // 4821
AM=M+1 // 4822
A=A-1 // 4823
M=D // 4824
@60 // 4825
D=A // 4826
@SP // 4827
AM=M+1 // 4828
A=A-1 // 4829
M=D // 4830
@86 // 4831
D=A // 4832
@SP // 4833
AM=M+1 // 4834
A=A-1 // 4835
M=D // 4836
@60 // 4837
D=A // 4838
@SP // 4839
AM=M+1 // 4840
A=A-1 // 4841
M=D // 4842
// call Screen.drawLine
@9 // 4843
D=A // 4844
@14 // 4845
M=D // 4846
@Screen.drawLine // 4847
D=A // 4848
@13 // 4849
M=D // 4850
@Main.main.ret.16 // 4851
D=A // 4852
@CALL // 4853
0;JMP // 4854
(Main.main.ret.16)
@SP // 4855
M=M-1 // 4856

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 35"), PushInstruction("constant 102"), PushInstruction("constant 20")], call=CallInstruction{Screen.drawLine}}
//  pop:  PopInstruction{address=temp 0}
//}

@117 // 4857
D=A // 4858
@SP // 4859
AM=M+1 // 4860
A=A-1 // 4861
M=D // 4862
@35 // 4863
D=A // 4864
@SP // 4865
AM=M+1 // 4866
A=A-1 // 4867
M=D // 4868
@102 // 4869
D=A // 4870
@SP // 4871
AM=M+1 // 4872
A=A-1 // 4873
M=D // 4874
@20 // 4875
D=A // 4876
@SP // 4877
AM=M+1 // 4878
A=A-1 // 4879
M=D // 4880
// call Screen.drawLine
@9 // 4881
D=A // 4882
@14 // 4883
M=D // 4884
@Screen.drawLine // 4885
D=A // 4886
@13 // 4887
M=D // 4888
@Main.main.ret.17 // 4889
D=A // 4890
@CALL // 4891
0;JMP // 4892
(Main.main.ret.17)
@SP // 4893
M=M-1 // 4894

////PushPopPair {
//  push: CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[CallGroup{pushes=[PushInstruction("constant 13")], call=CallInstruction{String.new}}, PushInstruction("constant 72")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 101")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 44")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 32")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 119")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 111")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 114")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 108")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 100")], call=CallInstruction{String.appendChar}}, PushInstruction("constant 33")], call=CallInstruction{String.appendChar}}
//  pop:  PopInstruction{address=local 0}
//}

@13 // 4895
D=A // 4896
@SP // 4897
AM=M+1 // 4898
A=A-1 // 4899
M=D // 4900
// call String.new
@6 // 4901
D=A // 4902
@14 // 4903
M=D // 4904
@String.new // 4905
D=A // 4906
@13 // 4907
M=D // 4908
@Main.main.ret.18 // 4909
D=A // 4910
@CALL // 4911
0;JMP // 4912
(Main.main.ret.18)
@72 // 4913
D=A // 4914
@SP // 4915
AM=M+1 // 4916
A=A-1 // 4917
M=D // 4918
// call String.appendChar
@7 // 4919
D=A // 4920
@14 // 4921
M=D // 4922
@String.appendChar // 4923
D=A // 4924
@13 // 4925
M=D // 4926
@Main.main.ret.19 // 4927
D=A // 4928
@CALL // 4929
0;JMP // 4930
(Main.main.ret.19)
@101 // 4931
D=A // 4932
@SP // 4933
AM=M+1 // 4934
A=A-1 // 4935
M=D // 4936
// call String.appendChar
@7 // 4937
D=A // 4938
@14 // 4939
M=D // 4940
@String.appendChar // 4941
D=A // 4942
@13 // 4943
M=D // 4944
@Main.main.ret.20 // 4945
D=A // 4946
@CALL // 4947
0;JMP // 4948
(Main.main.ret.20)
@108 // 4949
D=A // 4950
@SP // 4951
AM=M+1 // 4952
A=A-1 // 4953
M=D // 4954
// call String.appendChar
@7 // 4955
D=A // 4956
@14 // 4957
M=D // 4958
@String.appendChar // 4959
D=A // 4960
@13 // 4961
M=D // 4962
@Main.main.ret.21 // 4963
D=A // 4964
@CALL // 4965
0;JMP // 4966
(Main.main.ret.21)
@108 // 4967
D=A // 4968
@SP // 4969
AM=M+1 // 4970
A=A-1 // 4971
M=D // 4972
// call String.appendChar
@7 // 4973
D=A // 4974
@14 // 4975
M=D // 4976
@String.appendChar // 4977
D=A // 4978
@13 // 4979
M=D // 4980
@Main.main.ret.22 // 4981
D=A // 4982
@CALL // 4983
0;JMP // 4984
(Main.main.ret.22)
@111 // 4985
D=A // 4986
@SP // 4987
AM=M+1 // 4988
A=A-1 // 4989
M=D // 4990
// call String.appendChar
@7 // 4991
D=A // 4992
@14 // 4993
M=D // 4994
@String.appendChar // 4995
D=A // 4996
@13 // 4997
M=D // 4998
@Main.main.ret.23 // 4999
D=A // 5000
@CALL // 5001
0;JMP // 5002
(Main.main.ret.23)
@44 // 5003
D=A // 5004
@SP // 5005
AM=M+1 // 5006
A=A-1 // 5007
M=D // 5008
// call String.appendChar
@7 // 5009
D=A // 5010
@14 // 5011
M=D // 5012
@String.appendChar // 5013
D=A // 5014
@13 // 5015
M=D // 5016
@Main.main.ret.24 // 5017
D=A // 5018
@CALL // 5019
0;JMP // 5020
(Main.main.ret.24)
@32 // 5021
D=A // 5022
@SP // 5023
AM=M+1 // 5024
A=A-1 // 5025
M=D // 5026
// call String.appendChar
@7 // 5027
D=A // 5028
@14 // 5029
M=D // 5030
@String.appendChar // 5031
D=A // 5032
@13 // 5033
M=D // 5034
@Main.main.ret.25 // 5035
D=A // 5036
@CALL // 5037
0;JMP // 5038
(Main.main.ret.25)
@119 // 5039
D=A // 5040
@SP // 5041
AM=M+1 // 5042
A=A-1 // 5043
M=D // 5044
// call String.appendChar
@7 // 5045
D=A // 5046
@14 // 5047
M=D // 5048
@String.appendChar // 5049
D=A // 5050
@13 // 5051
M=D // 5052
@Main.main.ret.26 // 5053
D=A // 5054
@CALL // 5055
0;JMP // 5056
(Main.main.ret.26)
@111 // 5057
D=A // 5058
@SP // 5059
AM=M+1 // 5060
A=A-1 // 5061
M=D // 5062
// call String.appendChar
@7 // 5063
D=A // 5064
@14 // 5065
M=D // 5066
@String.appendChar // 5067
D=A // 5068
@13 // 5069
M=D // 5070
@Main.main.ret.27 // 5071
D=A // 5072
@CALL // 5073
0;JMP // 5074
(Main.main.ret.27)
@114 // 5075
D=A // 5076
@SP // 5077
AM=M+1 // 5078
A=A-1 // 5079
M=D // 5080
// call String.appendChar
@7 // 5081
D=A // 5082
@14 // 5083
M=D // 5084
@String.appendChar // 5085
D=A // 5086
@13 // 5087
M=D // 5088
@Main.main.ret.28 // 5089
D=A // 5090
@CALL // 5091
0;JMP // 5092
(Main.main.ret.28)
@108 // 5093
D=A // 5094
@SP // 5095
AM=M+1 // 5096
A=A-1 // 5097
M=D // 5098
// call String.appendChar
@7 // 5099
D=A // 5100
@14 // 5101
M=D // 5102
@String.appendChar // 5103
D=A // 5104
@13 // 5105
M=D // 5106
@Main.main.ret.29 // 5107
D=A // 5108
@CALL // 5109
0;JMP // 5110
(Main.main.ret.29)
@100 // 5111
D=A // 5112
@SP // 5113
AM=M+1 // 5114
A=A-1 // 5115
M=D // 5116
// call String.appendChar
@7 // 5117
D=A // 5118
@14 // 5119
M=D // 5120
@String.appendChar // 5121
D=A // 5122
@13 // 5123
M=D // 5124
@Main.main.ret.30 // 5125
D=A // 5126
@CALL // 5127
0;JMP // 5128
(Main.main.ret.30)
@33 // 5129
D=A // 5130
@SP // 5131
AM=M+1 // 5132
A=A-1 // 5133
M=D // 5134
// call String.appendChar
@7 // 5135
D=A // 5136
@14 // 5137
M=D // 5138
@String.appendChar // 5139
D=A // 5140
@13 // 5141
M=D // 5142
@Main.main.ret.31 // 5143
D=A // 5144
@CALL // 5145
0;JMP // 5146
(Main.main.ret.31)
@SP // 5147
AM=M-1 // 5148
D=M // 5149
@LCL // 5150
A=M // 5151
M=D // 5152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Output.printString}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5153
A=M // 5154
D=M // 5155
@SP // 5156
AM=M+1 // 5157
A=A-1 // 5158
M=D // 5159
// call Output.printString
@6 // 5160
D=A // 5161
@14 // 5162
M=D // 5163
@Output.printString // 5164
D=A // 5165
@13 // 5166
M=D // 5167
@Main.main.ret.32 // 5168
D=A // 5169
@CALL // 5170
0;JMP // 5171
(Main.main.ret.32)
@SP // 5172
M=M-1 // 5173

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5174
D=A // 5175
@14 // 5176
M=D // 5177
@Output.println // 5178
D=A // 5179
@13 // 5180
M=D // 5181
@Main.main.ret.33 // 5182
D=A // 5183
@CALL // 5184
0;JMP // 5185
(Main.main.ret.33)
@SP // 5186
M=M-1 // 5187

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{String.dispose}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 5188
A=M // 5189
D=M // 5190
@SP // 5191
AM=M+1 // 5192
A=A-1 // 5193
M=D // 5194
// call String.dispose
@6 // 5195
D=A // 5196
@14 // 5197
M=D // 5198
@String.dispose // 5199
D=A // 5200
@13 // 5201
M=D // 5202
@Main.main.ret.34 // 5203
D=A // 5204
@CALL // 5205
0;JMP // 5206
(Main.main.ret.34)
@SP // 5207
M=M-1 // 5208

////PushInstruction("constant 0")
@SP // 5209
AM=M+1 // 5210
A=A-1 // 5211
M=0 // 5212
@RETURN // 5213
0;JMP // 5214

////FunctionInstruction{functionName='Sys.halt', numLocals=0, funcMapping={}}
// function Sys.halt with 0
(Sys.halt)

////LabelInstruction{label='Sys.halt_WHILE_EXP1}
// label Sys.halt_WHILE_EXP1
(Sys.halt_WHILE_EXP1)

////ConditionalGroup{push=PushInstruction("constant 0"), ifGoto=IfGotoInstruction{label='Sys.halt_WHILE_END1}}
D=0 // 5215
@Sys.halt_WHILE_END1 // 5216
D;JNE // 5217

////GotoInstruction{label='Sys.halt_WHILE_EXP1}
// goto Sys.halt_WHILE_EXP1
@Sys.halt_WHILE_EXP1 // 5218
0;JMP // 5219

////LabelInstruction{label='Sys.halt_WHILE_END1}
// label Sys.halt_WHILE_END1
(Sys.halt_WHILE_END1)

////PushInstruction("constant 0")
@SP // 5220
AM=M+1 // 5221
A=A-1 // 5222
M=0 // 5223
@RETURN // 5224
0;JMP // 5225

////FunctionInstruction{functionName='Output.printChar', numLocals=4, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.create=1}}
// function Output.printChar with 4
(Output.printChar)
@4 // 5226
D=A // 5227
@SP // 5228
AM=D+M // 5229
A=A-1 // 5230
M=0 // 5231
A=A-1 // 5232
M=0 // 5233
A=A-1 // 5234
M=0 // 5235
A=A-1 // 5236
M=0 // 5237

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("argument 0")], call=CallInstruction{Output.getMap}}
//  pop:  PopInstruction{address=local 0}
//}

@ARG // 5238
A=M // 5239
D=M // 5240
@SP // 5241
AM=M+1 // 5242
A=A-1 // 5243
M=D // 5244
// call Output.getMap
@6 // 5245
D=A // 5246
@14 // 5247
M=D // 5248
@Output.getMap // 5249
D=A // 5250
@13 // 5251
M=D // 5252
@Output.printChar.ret.0 // 5253
D=A // 5254
@CALL // 5255
0;JMP // 5256
(Output.printChar.ret.0)
@SP // 5257
AM=M-1 // 5258
D=M // 5259
@LCL // 5260
A=M // 5261
M=D // 5262

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 3}
//}

@LCL // 5263
A=M+1 // 5264
A=A+1 // 5265
A=A+1 // 5266
M=0 // 5267

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
@Output.printChar.LT.50 // 5268
D=A // 5269
@SP // 5270
AM=M+1 // 5271
A=A-1 // 5272
M=D // 5273
@LCL // 5274
A=M+1 // 5275
A=A+1 // 5276
A=A+1 // 5277
D=M // 5278
@11 // 5279
D=D-A // 5280
@DO_LT // 5281
0;JMP // 5282
(Output.printChar.LT.50)
D=!D // 5283
@Output.printChar_WHILE_END1 // 5284
D;JNE // 5285

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

@Output.2 // 5286
D=M // 5287
@SP // 5288
AM=M+1 // 5289
A=A-1 // 5290
M=D // 5291
@11 // 5292
D=A // 5293
@SP // 5294
AM=M+1 // 5295
A=A-1 // 5296
M=D // 5297
// call Math.multiply
@7 // 5298
D=A // 5299
@14 // 5300
M=D // 5301
@Math.multiply // 5302
D=A // 5303
@13 // 5304
M=D // 5305
@Output.printChar.ret.1 // 5306
D=A // 5307
@CALL // 5308
0;JMP // 5309
(Output.printChar.ret.1)
@LCL // 5310
A=M+1 // 5311
A=A+1 // 5312
A=A+1 // 5313
D=M // 5314
@SP // 5315
AM=M-1 // 5316
D=D+M // 5317
@SP // 5318
AM=M+1 // 5319
A=A-1 // 5320
M=D // 5321
@32 // 5322
D=A // 5323
@SP // 5324
AM=M+1 // 5325
A=A-1 // 5326
M=D // 5327
// call Math.multiply
@7 // 5328
D=A // 5329
@14 // 5330
M=D // 5331
@Math.multiply // 5332
D=A // 5333
@13 // 5334
M=D // 5335
@Output.printChar.ret.2 // 5336
D=A // 5337
@CALL // 5338
0;JMP // 5339
(Output.printChar.ret.2)
@SP // 5340
AM=M-1 // 5341
D=M // 5342
@16384 // 5343
D=D+A // 5344
@SP // 5345
AM=M+1 // 5346
A=A-1 // 5347
M=D // 5348
@Output.1 // 5349
D=M // 5350
@SP // 5351
AM=M+1 // 5352
A=A-1 // 5353
M=D // 5354
@2 // 5355
D=A // 5356
@SP // 5357
AM=M+1 // 5358
A=A-1 // 5359
M=D // 5360
// call Math.divide
@7 // 5361
D=A // 5362
@14 // 5363
M=D // 5364
@Math.divide // 5365
D=A // 5366
@13 // 5367
M=D // 5368
@Output.printChar.ret.3 // 5369
D=A // 5370
@CALL // 5371
0;JMP // 5372
(Output.printChar.ret.3)
@SP // 5373
AM=M-1 // 5374
D=M // 5375
@SP // 5376
AM=M-1 // 5377
D=D+M // 5378
@LCL // 5379
A=M+1 // 5380
M=D // 5381

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
@Output.printChar.EQ.51 // 5382
D=A // 5383
@SP // 5384
AM=M+1 // 5385
A=A-1 // 5386
M=D // 5387
@Output.1 // 5388
D=M // 5389
@1 // 5390
D=D&A // 5391
@DO_EQ // 5392
0;JMP // 5393
(Output.printChar.EQ.51)
@Output.printChar$IF_TRUE1 // 5394
D;JNE // 5395

////GotoInstruction{label='Output.printChar$IF_FALSE1}
// goto Output.printChar$IF_FALSE1
@Output.printChar$IF_FALSE1 // 5396
0;JMP // 5397

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

@LCL // 5398
A=M+1 // 5399
A=A+1 // 5400
A=A+1 // 5401
D=M // 5402
A=A-1 // 5403
A=A-1 // 5404
A=A-1 // 5405
A=D+M // 5406
D=M // 5407
@LCL // 5408
A=M+1 // 5409
A=A+1 // 5410
M=D // 5411

////GotoInstruction{label='Output.printChar$IF_END1}
// goto Output.printChar$IF_END1
@Output.printChar$IF_END1 // 5412
0;JMP // 5413

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

@LCL // 5414
A=M+1 // 5415
A=A+1 // 5416
A=A+1 // 5417
D=M // 5418
A=A-1 // 5419
A=A-1 // 5420
A=A-1 // 5421
A=D+M // 5422
D=M // 5423
@SP // 5424
AM=M+1 // 5425
A=A-1 // 5426
M=D // 5427
@256 // 5428
D=A // 5429
@SP // 5430
AM=M+1 // 5431
A=A-1 // 5432
M=D // 5433
// call Math.multiply
@7 // 5434
D=A // 5435
@14 // 5436
M=D // 5437
@Math.multiply // 5438
D=A // 5439
@13 // 5440
M=D // 5441
@Output.printChar.ret.4 // 5442
D=A // 5443
@CALL // 5444
0;JMP // 5445
(Output.printChar.ret.4)
@SP // 5446
AM=M-1 // 5447
D=M // 5448
@LCL // 5449
A=M+1 // 5450
A=A+1 // 5451
M=D // 5452

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
@LCL // 5453
A=M+1 // 5454
D=M // 5455
@SP // 5456
AM=M+1 // 5457
A=A-1 // 5458
M=D // 5459
@LCL // 5460
A=M+1 // 5461
A=M // 5462
D=M // 5463
@SP // 5464
AM=M+1 // 5465
A=A-1 // 5466
M=D // 5467
@LCL // 5468
A=M+1 // 5469
A=A+1 // 5470
D=M // 5471
@SP // 5472
AM=M-1 // 5473
D=D|M // 5474
@SP // 5475
AM=M-1 // 5476
A=M // 5477
M=D // 5478

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

@LCL // 5479
A=M+1 // 5480
A=A+1 // 5481
A=A+1 // 5482
M=M+1 // 5483

////GotoInstruction{label='Output.printChar_WHILE_EXP1}
// goto Output.printChar_WHILE_EXP1
@Output.printChar_WHILE_EXP1 // 5484
0;JMP // 5485

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
@Output.printChar.EQ.52 // 5486
D=A // 5487
@SP // 5488
AM=M+1 // 5489
A=A-1 // 5490
M=D // 5491
@Output.1 // 5492
D=M // 5493
@63 // 5494
D=D-A // 5495
@DO_EQ // 5496
0;JMP // 5497
(Output.printChar.EQ.52)
@Output.printChar$IF_TRUE2 // 5498
D;JNE // 5499

////GotoInstruction{label='Output.printChar$IF_FALSE2}
// goto Output.printChar$IF_FALSE2
@Output.printChar$IF_FALSE2 // 5500
0;JMP // 5501

////LabelInstruction{label='Output.printChar$IF_TRUE2}
// label Output.printChar$IF_TRUE2
(Output.printChar$IF_TRUE2)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.println}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.println
@5 // 5502
D=A // 5503
@14 // 5504
M=D // 5505
@Output.println // 5506
D=A // 5507
@13 // 5508
M=D // 5509
@Output.printChar.ret.5 // 5510
D=A // 5511
@CALL // 5512
0;JMP // 5513
(Output.printChar.ret.5)
@SP // 5514
M=M-1 // 5515

////GotoInstruction{label='Output.printChar$IF_END2}
// goto Output.printChar$IF_END2
@Output.printChar$IF_END2 // 5516
0;JMP // 5517

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

@Output.1 // 5518
M=M+1 // 5519

////LabelInstruction{label='Output.printChar$IF_END2}
// label Output.printChar$IF_END2
(Output.printChar$IF_END2)

////PushInstruction("constant 0")
@SP // 5520
AM=M+1 // 5521
A=A-1 // 5522
M=0 // 5523
@RETURN // 5524
0;JMP // 5525

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
@Memory.remove_node.EQ.53 // 5526
D=A // 5527
@SP // 5528
AM=M+1 // 5529
A=A-1 // 5530
M=D // 5531
@ARG // 5532
A=M+1 // 5533
D=M // 5534
@ARG // 5535
A=M+1 // 5536
D=M // 5537
@2 // 5538
D=D+A // 5539
A=D // 5540
D=M // 5541
@DO_EQ // 5542
0;JMP // 5543
(Memory.remove_node.EQ.53)
D=!D // 5544
@Memory.remove_node$IF_TRUE1 // 5545
D;JNE // 5546

////GotoInstruction{label='Memory.remove_node$IF_FALSE1}
// goto Memory.remove_node$IF_FALSE1
@Memory.remove_node$IF_FALSE1 // 5547
0;JMP // 5548

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
@ARG // 5549
A=M+1 // 5550
D=M // 5551
@ARG // 5552
A=M+1 // 5553
D=M // 5554
@2 // 5555
D=D+A // 5556
A=D // 5557
D=M // 5558
@3 // 5559
D=D+A // 5560
@SP // 5561
AM=M+1 // 5562
A=A-1 // 5563
M=D // 5564
@ARG // 5565
A=M+1 // 5566
D=M // 5567
@ARG // 5568
A=M+1 // 5569
D=M // 5570
@3 // 5571
D=D+A // 5572
A=D // 5573
D=M // 5574
@SP // 5575
AM=M-1 // 5576
A=M // 5577
M=D // 5578

////GotoInstruction{label='Memory.remove_node$IF_END1}
// goto Memory.remove_node$IF_END1
@Memory.remove_node$IF_END1 // 5579
0;JMP // 5580

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
@ARG // 5581
A=M // 5582
D=M // 5583
@SP // 5584
AM=M+1 // 5585
A=A-1 // 5586
M=D // 5587
@ARG // 5588
A=M+1 // 5589
D=M // 5590
@ARG // 5591
A=M+1 // 5592
D=M // 5593
@3 // 5594
D=D+A // 5595
A=D // 5596
D=M // 5597
@SP // 5598
AM=M-1 // 5599
A=M // 5600
M=D // 5601

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
@Memory.remove_node.EQ.54 // 5602
D=A // 5603
@SP // 5604
AM=M+1 // 5605
A=A-1 // 5606
M=D // 5607
@ARG // 5608
A=M+1 // 5609
D=M // 5610
@ARG // 5611
A=M+1 // 5612
D=M // 5613
@3 // 5614
D=D+A // 5615
A=D // 5616
D=M // 5617
@DO_EQ // 5618
0;JMP // 5619
(Memory.remove_node.EQ.54)
D=!D // 5620
@Memory.remove_node$IF_TRUE2 // 5621
D;JNE // 5622

////GotoInstruction{label='Memory.remove_node$IF_END2}
// goto Memory.remove_node$IF_END2
@Memory.remove_node$IF_END2 // 5623
0;JMP // 5624

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
@ARG // 5625
A=M+1 // 5626
D=M // 5627
@ARG // 5628
A=M+1 // 5629
D=M // 5630
@3 // 5631
D=D+A // 5632
A=D // 5633
D=M // 5634
@2 // 5635
D=D+A // 5636
@SP // 5637
AM=M+1 // 5638
A=A-1 // 5639
M=D // 5640
@ARG // 5641
A=M+1 // 5642
D=M // 5643
@ARG // 5644
A=M+1 // 5645
D=M // 5646
@2 // 5647
D=D+A // 5648
A=D // 5649
D=M // 5650
@SP // 5651
AM=M-1 // 5652
A=M // 5653
M=D // 5654

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
@ARG // 5655
A=M+1 // 5656
D=M // 5657
@2 // 5658
D=D+A // 5659
@SP // 5660
AM=M+1 // 5661
A=A-1 // 5662
M=D // 5663
D=0 // 5664
@SP // 5665
AM=M-1 // 5666
A=M // 5667
M=D // 5668

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 5669
A=M+1 // 5670
D=M // 5671
@3 // 5672
D=D+A // 5673
@SP // 5674
AM=M+1 // 5675
A=A-1 // 5676
M=D // 5677
D=0 // 5678
@SP // 5679
AM=M-1 // 5680
A=M // 5681
M=D // 5682

////PushInstruction("constant 0")
@SP // 5683
AM=M+1 // 5684
A=A-1 // 5685
M=0 // 5686
@RETURN // 5687
0;JMP // 5688

////FunctionInstruction{functionName='Output.init', numLocals=1, funcMapping={Output.println=0, Output.printString=3, Output.getMap=0, Output.printChar=6, Output.create=1}}
// function Output.init with 1
(Output.init)
@SP // 5689
AM=M+1 // 5690
A=A-1 // 5691
M=0 // 5692

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 127")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@127 // 5693
D=A // 5694
@SP // 5695
AM=M+1 // 5696
A=A-1 // 5697
M=D // 5698
// call Memory.alloc
@6 // 5699
D=A // 5700
@14 // 5701
M=D // 5702
@Memory.alloc // 5703
D=A // 5704
@13 // 5705
M=D // 5706
@Output.init.ret.0 // 5707
D=A // 5708
@CALL // 5709
0;JMP // 5710
(Output.init.ret.0)
@SP // 5711
AM=M-1 // 5712
D=M // 5713
@Output.0 // 5714
M=D // 5715

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5716
D=A // 5717
@SP // 5718
M=D+M // 5719
@63 // 5720
D=A // 5721
@SP // 5722
A=M-1 // 5723
M=0 // 5724
A=A-1 // 5725
M=0 // 5726
A=A-1 // 5727
M=D // 5728
A=A-1 // 5729
M=D // 5730
A=A-1 // 5731
M=D // 5732
A=A-1 // 5733
M=D // 5734
A=A-1 // 5735
M=D // 5736
A=A-1 // 5737
M=D // 5738
A=A-1 // 5739
M=D // 5740
A=A-1 // 5741
M=D // 5742
A=A-1 // 5743
M=D // 5744
A=A-1 // 5745
M=0 // 5746
// call Output.create
@17 // 5747
D=A // 5748
@14 // 5749
M=D // 5750
@Output.create // 5751
D=A // 5752
@13 // 5753
M=D // 5754
@Output.init.ret.1 // 5755
D=A // 5756
@CALL // 5757
0;JMP // 5758
(Output.init.ret.1)
@SP // 5759
M=M-1 // 5760

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@12 // 5761
D=A // 5762
@SP // 5763
M=D+M // 5764
@32 // 5765
D=A // 5766
@SP // 5767
A=M-1 // 5768
M=0 // 5769
A=A-1 // 5770
M=0 // 5771
A=A-1 // 5772
M=0 // 5773
A=A-1 // 5774
M=0 // 5775
A=A-1 // 5776
M=0 // 5777
A=A-1 // 5778
M=0 // 5779
A=A-1 // 5780
M=0 // 5781
A=A-1 // 5782
M=0 // 5783
A=A-1 // 5784
M=0 // 5785
A=A-1 // 5786
M=0 // 5787
A=A-1 // 5788
M=0 // 5789
A=A-1 // 5790
M=D // 5791
A=A-1 // 5792
// call Output.create
@17 // 5793
D=A // 5794
@14 // 5795
M=D // 5796
@Output.create // 5797
D=A // 5798
@13 // 5799
M=D // 5800
@Output.init.ret.2 // 5801
D=A // 5802
@CALL // 5803
0;JMP // 5804
(Output.init.ret.2)
@SP // 5805
M=M-1 // 5806

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 33"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@33 // 5807
D=A // 5808
@SP // 5809
AM=M+1 // 5810
A=A-1 // 5811
M=D // 5812
@12 // 5813
D=A // 5814
@SP // 5815
AM=M+1 // 5816
A=A-1 // 5817
M=D // 5818
@30 // 5819
D=A // 5820
@SP // 5821
AM=M+1 // 5822
A=A-1 // 5823
M=D // 5824
@30 // 5825
D=A // 5826
@SP // 5827
AM=M+1 // 5828
A=A-1 // 5829
M=D // 5830
@30 // 5831
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
@12 // 5843
D=A // 5844
@SP // 5845
AM=M+1 // 5846
A=A-1 // 5847
M=D // 5848
@SP // 5849
AM=M+1 // 5850
A=A-1 // 5851
M=0 // 5852
@4 // 5853
D=A // 5854
@SP // 5855
M=D+M // 5856
@12 // 5857
D=A // 5858
@SP // 5859
A=M-1 // 5860
M=0 // 5861
A=A-1 // 5862
M=0 // 5863
A=A-1 // 5864
M=D // 5865
A=A-1 // 5866
M=D // 5867
A=A-1 // 5868
// call Output.create
@17 // 5869
D=A // 5870
@14 // 5871
M=D // 5872
@Output.create // 5873
D=A // 5874
@13 // 5875
M=D // 5876
@Output.init.ret.3 // 5877
D=A // 5878
@CALL // 5879
0;JMP // 5880
(Output.init.ret.3)
@SP // 5881
M=M-1 // 5882

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 34"), PushInstruction("constant 54"), PushInstruction("constant 54"), PushInstruction("constant 20"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@34 // 5883
D=A // 5884
@SP // 5885
AM=M+1 // 5886
A=A-1 // 5887
M=D // 5888
@54 // 5889
D=A // 5890
@SP // 5891
AM=M+1 // 5892
A=A-1 // 5893
M=D // 5894
@54 // 5895
D=A // 5896
@SP // 5897
AM=M+1 // 5898
A=A-1 // 5899
M=D // 5900
@20 // 5901
D=A // 5902
@SP // 5903
AM=M+1 // 5904
A=A-1 // 5905
M=D // 5906
@SP // 5907
AM=M+1 // 5908
A=A-1 // 5909
M=0 // 5910
@SP // 5911
AM=M+1 // 5912
A=A-1 // 5913
M=0 // 5914
@SP // 5915
AM=M+1 // 5916
A=A-1 // 5917
M=0 // 5918
@SP // 5919
AM=M+1 // 5920
A=A-1 // 5921
M=0 // 5922
@SP // 5923
AM=M+1 // 5924
A=A-1 // 5925
M=0 // 5926
@SP // 5927
AM=M+1 // 5928
A=A-1 // 5929
M=0 // 5930
@SP // 5931
AM=M+1 // 5932
A=A-1 // 5933
M=0 // 5934
@SP // 5935
AM=M+1 // 5936
A=A-1 // 5937
M=0 // 5938
// call Output.create
@17 // 5939
D=A // 5940
@14 // 5941
M=D // 5942
@Output.create // 5943
D=A // 5944
@13 // 5945
M=D // 5946
@Output.init.ret.4 // 5947
D=A // 5948
@CALL // 5949
0;JMP // 5950
(Output.init.ret.4)
@SP // 5951
M=M-1 // 5952

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 35"), PushInstruction("constant 0"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@2 // 5953
D=A // 5954
@SP // 5955
M=D+M // 5956
@35 // 5957
D=A // 5958
@SP // 5959
A=M-1 // 5960
M=0 // 5961
A=A-1 // 5962
M=D // 5963
A=A-1 // 5964
@18 // 5965
D=A // 5966
@SP // 5967
AM=M+1 // 5968
A=A-1 // 5969
M=D // 5970
@18 // 5971
D=A // 5972
@SP // 5973
AM=M+1 // 5974
A=A-1 // 5975
M=D // 5976
@63 // 5977
D=A // 5978
@SP // 5979
AM=M+1 // 5980
A=A-1 // 5981
M=D // 5982
@18 // 5983
D=A // 5984
@SP // 5985
AM=M+1 // 5986
A=A-1 // 5987
M=D // 5988
@18 // 5989
D=A // 5990
@SP // 5991
AM=M+1 // 5992
A=A-1 // 5993
M=D // 5994
@63 // 5995
D=A // 5996
@SP // 5997
AM=M+1 // 5998
A=A-1 // 5999
M=D // 6000
@18 // 6001
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
@SP // 6013
AM=M+1 // 6014
A=A-1 // 6015
M=0 // 6016
@SP // 6017
AM=M+1 // 6018
A=A-1 // 6019
M=0 // 6020
// call Output.create
@17 // 6021
D=A // 6022
@14 // 6023
M=D // 6024
@Output.create // 6025
D=A // 6026
@13 // 6027
M=D // 6028
@Output.init.ret.5 // 6029
D=A // 6030
@CALL // 6031
0;JMP // 6032
(Output.init.ret.5)
@SP // 6033
M=M-1 // 6034

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 36"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@36 // 6035
D=A // 6036
@SP // 6037
AM=M+1 // 6038
A=A-1 // 6039
M=D // 6040
@12 // 6041
D=A // 6042
@SP // 6043
AM=M+1 // 6044
A=A-1 // 6045
M=D // 6046
@30 // 6047
D=A // 6048
@SP // 6049
AM=M+1 // 6050
A=A-1 // 6051
M=D // 6052
@51 // 6053
D=A // 6054
@SP // 6055
AM=M+1 // 6056
A=A-1 // 6057
M=D // 6058
@3 // 6059
D=A // 6060
@SP // 6061
AM=M+1 // 6062
A=A-1 // 6063
M=D // 6064
@30 // 6065
D=A // 6066
@SP // 6067
AM=M+1 // 6068
A=A-1 // 6069
M=D // 6070
@48 // 6071
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
@30 // 6083
D=A // 6084
@SP // 6085
AM=M+1 // 6086
A=A-1 // 6087
M=D // 6088
@12 // 6089
D=A // 6090
@SP // 6091
AM=M+1 // 6092
A=A-1 // 6093
M=D // 6094
@12 // 6095
D=A // 6096
@SP // 6097
AM=M+1 // 6098
A=A-1 // 6099
M=D // 6100
@SP // 6101
AM=M+1 // 6102
A=A-1 // 6103
M=0 // 6104
// call Output.create
@17 // 6105
D=A // 6106
@14 // 6107
M=D // 6108
@Output.create // 6109
D=A // 6110
@13 // 6111
M=D // 6112
@Output.init.ret.6 // 6113
D=A // 6114
@CALL // 6115
0;JMP // 6116
(Output.init.ret.6)
@SP // 6117
M=M-1 // 6118

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 37"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6119
D=A // 6120
@SP // 6121
M=D+M // 6122
@37 // 6123
D=A // 6124
@SP // 6125
A=M-1 // 6126
M=0 // 6127
A=A-1 // 6128
M=0 // 6129
A=A-1 // 6130
M=D // 6131
A=A-1 // 6132
@35 // 6133
D=A // 6134
@SP // 6135
AM=M+1 // 6136
A=A-1 // 6137
M=D // 6138
@51 // 6139
D=A // 6140
@SP // 6141
AM=M+1 // 6142
A=A-1 // 6143
M=D // 6144
@24 // 6145
D=A // 6146
@SP // 6147
AM=M+1 // 6148
A=A-1 // 6149
M=D // 6150
@12 // 6151
D=A // 6152
@SP // 6153
AM=M+1 // 6154
A=A-1 // 6155
M=D // 6156
@6 // 6157
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
@49 // 6169
D=A // 6170
@SP // 6171
AM=M+1 // 6172
A=A-1 // 6173
M=D // 6174
@SP // 6175
AM=M+1 // 6176
A=A-1 // 6177
M=0 // 6178
@SP // 6179
AM=M+1 // 6180
A=A-1 // 6181
M=0 // 6182
// call Output.create
@17 // 6183
D=A // 6184
@14 // 6185
M=D // 6186
@Output.create // 6187
D=A // 6188
@13 // 6189
M=D // 6190
@Output.init.ret.7 // 6191
D=A // 6192
@CALL // 6193
0;JMP // 6194
(Output.init.ret.7)
@SP // 6195
M=M-1 // 6196

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 38"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 54"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@38 // 6197
D=A // 6198
@SP // 6199
AM=M+1 // 6200
A=A-1 // 6201
M=D // 6202
@12 // 6203
D=A // 6204
@SP // 6205
AM=M+1 // 6206
A=A-1 // 6207
M=D // 6208
@30 // 6209
D=A // 6210
@SP // 6211
AM=M+1 // 6212
A=A-1 // 6213
M=D // 6214
@30 // 6215
D=A // 6216
@SP // 6217
AM=M+1 // 6218
A=A-1 // 6219
M=D // 6220
@12 // 6221
D=A // 6222
@SP // 6223
AM=M+1 // 6224
A=A-1 // 6225
M=D // 6226
@54 // 6227
D=A // 6228
@SP // 6229
AM=M+1 // 6230
A=A-1 // 6231
M=D // 6232
@27 // 6233
D=A // 6234
@SP // 6235
AM=M+1 // 6236
A=A-1 // 6237
M=D // 6238
@27 // 6239
D=A // 6240
@SP // 6241
AM=M+1 // 6242
A=A-1 // 6243
M=D // 6244
@27 // 6245
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
@SP // 6257
AM=M+1 // 6258
A=A-1 // 6259
M=0 // 6260
@SP // 6261
AM=M+1 // 6262
A=A-1 // 6263
M=0 // 6264
// call Output.create
@17 // 6265
D=A // 6266
@14 // 6267
M=D // 6268
@Output.create // 6269
D=A // 6270
@13 // 6271
M=D // 6272
@Output.init.ret.8 // 6273
D=A // 6274
@CALL // 6275
0;JMP // 6276
(Output.init.ret.8)
@SP // 6277
M=M-1 // 6278

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 39"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@39 // 6279
D=A // 6280
@SP // 6281
AM=M+1 // 6282
A=A-1 // 6283
M=D // 6284
@12 // 6285
D=A // 6286
@SP // 6287
AM=M+1 // 6288
A=A-1 // 6289
M=D // 6290
@12 // 6291
D=A // 6292
@SP // 6293
AM=M+1 // 6294
A=A-1 // 6295
M=D // 6296
@6 // 6297
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
@SP // 6311
AM=M+1 // 6312
A=A-1 // 6313
M=0 // 6314
@SP // 6315
AM=M+1 // 6316
A=A-1 // 6317
M=0 // 6318
@SP // 6319
AM=M+1 // 6320
A=A-1 // 6321
M=0 // 6322
@SP // 6323
AM=M+1 // 6324
A=A-1 // 6325
M=0 // 6326
@SP // 6327
AM=M+1 // 6328
A=A-1 // 6329
M=0 // 6330
@SP // 6331
AM=M+1 // 6332
A=A-1 // 6333
M=0 // 6334
// call Output.create
@17 // 6335
D=A // 6336
@14 // 6337
M=D // 6338
@Output.create // 6339
D=A // 6340
@13 // 6341
M=D // 6342
@Output.init.ret.9 // 6343
D=A // 6344
@CALL // 6345
0;JMP // 6346
(Output.init.ret.9)
@SP // 6347
M=M-1 // 6348

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 40"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@40 // 6349
D=A // 6350
@SP // 6351
AM=M+1 // 6352
A=A-1 // 6353
M=D // 6354
@24 // 6355
D=A // 6356
@SP // 6357
AM=M+1 // 6358
A=A-1 // 6359
M=D // 6360
@12 // 6361
D=A // 6362
@SP // 6363
AM=M+1 // 6364
A=A-1 // 6365
M=D // 6366
@6 // 6367
D=A // 6368
@SP // 6369
AM=M+1 // 6370
A=A-1 // 6371
M=D // 6372
@6 // 6373
D=A // 6374
@SP // 6375
AM=M+1 // 6376
A=A-1 // 6377
M=D // 6378
@6 // 6379
D=A // 6380
@SP // 6381
AM=M+1 // 6382
A=A-1 // 6383
M=D // 6384
@6 // 6385
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
@12 // 6397
D=A // 6398
@SP // 6399
AM=M+1 // 6400
A=A-1 // 6401
M=D // 6402
@24 // 6403
D=A // 6404
@SP // 6405
AM=M+1 // 6406
A=A-1 // 6407
M=D // 6408
@SP // 6409
AM=M+1 // 6410
A=A-1 // 6411
M=0 // 6412
@SP // 6413
AM=M+1 // 6414
A=A-1 // 6415
M=0 // 6416
// call Output.create
@17 // 6417
D=A // 6418
@14 // 6419
M=D // 6420
@Output.create // 6421
D=A // 6422
@13 // 6423
M=D // 6424
@Output.init.ret.10 // 6425
D=A // 6426
@CALL // 6427
0;JMP // 6428
(Output.init.ret.10)
@SP // 6429
M=M-1 // 6430

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 41"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@41 // 6431
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
@24 // 6455
D=A // 6456
@SP // 6457
AM=M+1 // 6458
A=A-1 // 6459
M=D // 6460
@24 // 6461
D=A // 6462
@SP // 6463
AM=M+1 // 6464
A=A-1 // 6465
M=D // 6466
@24 // 6467
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
@12 // 6479
D=A // 6480
@SP // 6481
AM=M+1 // 6482
A=A-1 // 6483
M=D // 6484
@6 // 6485
D=A // 6486
@SP // 6487
AM=M+1 // 6488
A=A-1 // 6489
M=D // 6490
@SP // 6491
AM=M+1 // 6492
A=A-1 // 6493
M=0 // 6494
@SP // 6495
AM=M+1 // 6496
A=A-1 // 6497
M=0 // 6498
// call Output.create
@17 // 6499
D=A // 6500
@14 // 6501
M=D // 6502
@Output.create // 6503
D=A // 6504
@13 // 6505
M=D // 6506
@Output.init.ret.11 // 6507
D=A // 6508
@CALL // 6509
0;JMP // 6510
(Output.init.ret.11)
@SP // 6511
M=M-1 // 6512

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 42"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6513
D=A // 6514
@SP // 6515
M=D+M // 6516
@42 // 6517
D=A // 6518
@SP // 6519
A=M-1 // 6520
M=0 // 6521
A=A-1 // 6522
M=0 // 6523
A=A-1 // 6524
M=0 // 6525
A=A-1 // 6526
M=D // 6527
A=A-1 // 6528
@51 // 6529
D=A // 6530
@SP // 6531
AM=M+1 // 6532
A=A-1 // 6533
M=D // 6534
@30 // 6535
D=A // 6536
@SP // 6537
AM=M+1 // 6538
A=A-1 // 6539
M=D // 6540
@63 // 6541
D=A // 6542
@SP // 6543
AM=M+1 // 6544
A=A-1 // 6545
M=D // 6546
@30 // 6547
D=A // 6548
@SP // 6549
AM=M+1 // 6550
A=A-1 // 6551
M=D // 6552
@51 // 6553
D=A // 6554
@SP // 6555
AM=M+1 // 6556
A=A-1 // 6557
M=D // 6558
@SP // 6559
AM=M+1 // 6560
A=A-1 // 6561
M=0 // 6562
@SP // 6563
AM=M+1 // 6564
A=A-1 // 6565
M=0 // 6566
@SP // 6567
AM=M+1 // 6568
A=A-1 // 6569
M=0 // 6570
// call Output.create
@17 // 6571
D=A // 6572
@14 // 6573
M=D // 6574
@Output.create // 6575
D=A // 6576
@13 // 6577
M=D // 6578
@Output.init.ret.12 // 6579
D=A // 6580
@CALL // 6581
0;JMP // 6582
(Output.init.ret.12)
@SP // 6583
M=M-1 // 6584

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 6585
D=A // 6586
@SP // 6587
M=D+M // 6588
@43 // 6589
D=A // 6590
@SP // 6591
A=M-1 // 6592
M=0 // 6593
A=A-1 // 6594
M=0 // 6595
A=A-1 // 6596
M=0 // 6597
A=A-1 // 6598
M=D // 6599
A=A-1 // 6600
@12 // 6601
D=A // 6602
@SP // 6603
AM=M+1 // 6604
A=A-1 // 6605
M=D // 6606
@12 // 6607
D=A // 6608
@SP // 6609
AM=M+1 // 6610
A=A-1 // 6611
M=D // 6612
@63 // 6613
D=A // 6614
@SP // 6615
AM=M+1 // 6616
A=A-1 // 6617
M=D // 6618
@12 // 6619
D=A // 6620
@SP // 6621
AM=M+1 // 6622
A=A-1 // 6623
M=D // 6624
@12 // 6625
D=A // 6626
@SP // 6627
AM=M+1 // 6628
A=A-1 // 6629
M=D // 6630
@SP // 6631
AM=M+1 // 6632
A=A-1 // 6633
M=0 // 6634
@SP // 6635
AM=M+1 // 6636
A=A-1 // 6637
M=0 // 6638
@SP // 6639
AM=M+1 // 6640
A=A-1 // 6641
M=0 // 6642
// call Output.create
@17 // 6643
D=A // 6644
@14 // 6645
M=D // 6646
@Output.create // 6647
D=A // 6648
@13 // 6649
M=D // 6650
@Output.init.ret.13 // 6651
D=A // 6652
@CALL // 6653
0;JMP // 6654
(Output.init.ret.13)
@SP // 6655
M=M-1 // 6656

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6657
D=A // 6658
@SP // 6659
M=D+M // 6660
@44 // 6661
D=A // 6662
@SP // 6663
A=M-1 // 6664
M=0 // 6665
A=A-1 // 6666
M=0 // 6667
A=A-1 // 6668
M=0 // 6669
A=A-1 // 6670
M=0 // 6671
A=A-1 // 6672
M=0 // 6673
A=A-1 // 6674
M=0 // 6675
A=A-1 // 6676
M=0 // 6677
A=A-1 // 6678
M=D // 6679
A=A-1 // 6680
@12 // 6681
D=A // 6682
@SP // 6683
AM=M+1 // 6684
A=A-1 // 6685
M=D // 6686
@12 // 6687
D=A // 6688
@SP // 6689
AM=M+1 // 6690
A=A-1 // 6691
M=D // 6692
@6 // 6693
D=A // 6694
@SP // 6695
AM=M+1 // 6696
A=A-1 // 6697
M=D // 6698
@SP // 6699
AM=M+1 // 6700
A=A-1 // 6701
M=0 // 6702
// call Output.create
@17 // 6703
D=A // 6704
@14 // 6705
M=D // 6706
@Output.create // 6707
D=A // 6708
@13 // 6709
M=D // 6710
@Output.init.ret.14 // 6711
D=A // 6712
@CALL // 6713
0;JMP // 6714
(Output.init.ret.14)
@SP // 6715
M=M-1 // 6716

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 45"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@6 // 6717
D=A // 6718
@SP // 6719
M=D+M // 6720
@45 // 6721
D=A // 6722
@SP // 6723
A=M-1 // 6724
M=0 // 6725
A=A-1 // 6726
M=0 // 6727
A=A-1 // 6728
M=0 // 6729
A=A-1 // 6730
M=0 // 6731
A=A-1 // 6732
M=0 // 6733
A=A-1 // 6734
M=D // 6735
A=A-1 // 6736
@6 // 6737
D=A // 6738
@SP // 6739
M=D+M // 6740
@63 // 6741
D=A // 6742
@SP // 6743
A=M-1 // 6744
M=0 // 6745
A=A-1 // 6746
M=0 // 6747
A=A-1 // 6748
M=0 // 6749
A=A-1 // 6750
M=0 // 6751
A=A-1 // 6752
M=0 // 6753
A=A-1 // 6754
M=D // 6755
A=A-1 // 6756
// call Output.create
@17 // 6757
D=A // 6758
@14 // 6759
M=D // 6760
@Output.create // 6761
D=A // 6762
@13 // 6763
M=D // 6764
@Output.init.ret.15 // 6765
D=A // 6766
@CALL // 6767
0;JMP // 6768
(Output.init.ret.15)
@SP // 6769
M=M-1 // 6770

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 46"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@8 // 6771
D=A // 6772
@SP // 6773
M=D+M // 6774
@46 // 6775
D=A // 6776
@SP // 6777
A=M-1 // 6778
M=0 // 6779
A=A-1 // 6780
M=0 // 6781
A=A-1 // 6782
M=0 // 6783
A=A-1 // 6784
M=0 // 6785
A=A-1 // 6786
M=0 // 6787
A=A-1 // 6788
M=0 // 6789
A=A-1 // 6790
M=0 // 6791
A=A-1 // 6792
M=D // 6793
A=A-1 // 6794
@4 // 6795
D=A // 6796
@SP // 6797
M=D+M // 6798
@12 // 6799
D=A // 6800
@SP // 6801
A=M-1 // 6802
M=0 // 6803
A=A-1 // 6804
M=0 // 6805
A=A-1 // 6806
M=D // 6807
A=A-1 // 6808
M=D // 6809
A=A-1 // 6810
// call Output.create
@17 // 6811
D=A // 6812
@14 // 6813
M=D // 6814
@Output.create // 6815
D=A // 6816
@13 // 6817
M=D // 6818
@Output.init.ret.16 // 6819
D=A // 6820
@CALL // 6821
0;JMP // 6822
(Output.init.ret.16)
@SP // 6823
M=M-1 // 6824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 47"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 32"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 1"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 6825
D=A // 6826
@SP // 6827
M=D+M // 6828
@47 // 6829
D=A // 6830
@SP // 6831
A=M-1 // 6832
M=0 // 6833
A=A-1 // 6834
M=0 // 6835
A=A-1 // 6836
M=D // 6837
A=A-1 // 6838
@32 // 6839
D=A // 6840
@SP // 6841
AM=M+1 // 6842
A=A-1 // 6843
M=D // 6844
@48 // 6845
D=A // 6846
@SP // 6847
AM=M+1 // 6848
A=A-1 // 6849
M=D // 6850
@24 // 6851
D=A // 6852
@SP // 6853
AM=M+1 // 6854
A=A-1 // 6855
M=D // 6856
@12 // 6857
D=A // 6858
@SP // 6859
AM=M+1 // 6860
A=A-1 // 6861
M=D // 6862
@6 // 6863
D=A // 6864
@SP // 6865
AM=M+1 // 6866
A=A-1 // 6867
M=D // 6868
@3 // 6869
D=A // 6870
@SP // 6871
AM=M+1 // 6872
A=A-1 // 6873
M=D // 6874
@SP // 6875
AM=M+1 // 6876
A=A-1 // 6877
M=1 // 6878
@SP // 6879
AM=M+1 // 6880
A=A-1 // 6881
M=0 // 6882
@SP // 6883
AM=M+1 // 6884
A=A-1 // 6885
M=0 // 6886
// call Output.create
@17 // 6887
D=A // 6888
@14 // 6889
M=D // 6890
@Output.create // 6891
D=A // 6892
@13 // 6893
M=D // 6894
@Output.init.ret.17 // 6895
D=A // 6896
@CALL // 6897
0;JMP // 6898
(Output.init.ret.17)
@SP // 6899
M=M-1 // 6900

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 48"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@48 // 6901
D=A // 6902
@SP // 6903
AM=M+1 // 6904
A=A-1 // 6905
M=D // 6906
@12 // 6907
D=A // 6908
@SP // 6909
AM=M+1 // 6910
A=A-1 // 6911
M=D // 6912
@30 // 6913
D=A // 6914
@SP // 6915
AM=M+1 // 6916
A=A-1 // 6917
M=D // 6918
@51 // 6919
D=A // 6920
@SP // 6921
AM=M+1 // 6922
A=A-1 // 6923
M=D // 6924
@51 // 6925
D=A // 6926
@SP // 6927
AM=M+1 // 6928
A=A-1 // 6929
M=D // 6930
@51 // 6931
D=A // 6932
@SP // 6933
AM=M+1 // 6934
A=A-1 // 6935
M=D // 6936
@51 // 6937
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
@30 // 6949
D=A // 6950
@SP // 6951
AM=M+1 // 6952
A=A-1 // 6953
M=D // 6954
@12 // 6955
D=A // 6956
@SP // 6957
AM=M+1 // 6958
A=A-1 // 6959
M=D // 6960
@SP // 6961
AM=M+1 // 6962
A=A-1 // 6963
M=0 // 6964
@SP // 6965
AM=M+1 // 6966
A=A-1 // 6967
M=0 // 6968
// call Output.create
@17 // 6969
D=A // 6970
@14 // 6971
M=D // 6972
@Output.create // 6973
D=A // 6974
@13 // 6975
M=D // 6976
@Output.init.ret.18 // 6977
D=A // 6978
@CALL // 6979
0;JMP // 6980
(Output.init.ret.18)
@SP // 6981
M=M-1 // 6982

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 49"), PushInstruction("constant 12"), PushInstruction("constant 14"), PushInstruction("constant 15"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@49 // 6983
D=A // 6984
@SP // 6985
AM=M+1 // 6986
A=A-1 // 6987
M=D // 6988
@12 // 6989
D=A // 6990
@SP // 6991
AM=M+1 // 6992
A=A-1 // 6993
M=D // 6994
@14 // 6995
D=A // 6996
@SP // 6997
AM=M+1 // 6998
A=A-1 // 6999
M=D // 7000
@15 // 7001
D=A // 7002
@SP // 7003
AM=M+1 // 7004
A=A-1 // 7005
M=D // 7006
@12 // 7007
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
@12 // 7019
D=A // 7020
@SP // 7021
AM=M+1 // 7022
A=A-1 // 7023
M=D // 7024
@12 // 7025
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
@63 // 7037
D=A // 7038
@SP // 7039
AM=M+1 // 7040
A=A-1 // 7041
M=D // 7042
@SP // 7043
AM=M+1 // 7044
A=A-1 // 7045
M=0 // 7046
@SP // 7047
AM=M+1 // 7048
A=A-1 // 7049
M=0 // 7050
// call Output.create
@17 // 7051
D=A // 7052
@14 // 7053
M=D // 7054
@Output.create // 7055
D=A // 7056
@13 // 7057
M=D // 7058
@Output.init.ret.19 // 7059
D=A // 7060
@CALL // 7061
0;JMP // 7062
(Output.init.ret.19)
@SP // 7063
M=M-1 // 7064

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 50"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@50 // 7065
D=A // 7066
@SP // 7067
AM=M+1 // 7068
A=A-1 // 7069
M=D // 7070
@30 // 7071
D=A // 7072
@SP // 7073
AM=M+1 // 7074
A=A-1 // 7075
M=D // 7076
@51 // 7077
D=A // 7078
@SP // 7079
AM=M+1 // 7080
A=A-1 // 7081
M=D // 7082
@48 // 7083
D=A // 7084
@SP // 7085
AM=M+1 // 7086
A=A-1 // 7087
M=D // 7088
@24 // 7089
D=A // 7090
@SP // 7091
AM=M+1 // 7092
A=A-1 // 7093
M=D // 7094
@12 // 7095
D=A // 7096
@SP // 7097
AM=M+1 // 7098
A=A-1 // 7099
M=D // 7100
@6 // 7101
D=A // 7102
@SP // 7103
AM=M+1 // 7104
A=A-1 // 7105
M=D // 7106
@3 // 7107
D=A // 7108
@SP // 7109
AM=M+1 // 7110
A=A-1 // 7111
M=D // 7112
@51 // 7113
D=A // 7114
@SP // 7115
AM=M+1 // 7116
A=A-1 // 7117
M=D // 7118
@63 // 7119
D=A // 7120
@SP // 7121
AM=M+1 // 7122
A=A-1 // 7123
M=D // 7124
@SP // 7125
AM=M+1 // 7126
A=A-1 // 7127
M=0 // 7128
@SP // 7129
AM=M+1 // 7130
A=A-1 // 7131
M=0 // 7132
// call Output.create
@17 // 7133
D=A // 7134
@14 // 7135
M=D // 7136
@Output.create // 7137
D=A // 7138
@13 // 7139
M=D // 7140
@Output.init.ret.20 // 7141
D=A // 7142
@CALL // 7143
0;JMP // 7144
(Output.init.ret.20)
@SP // 7145
M=M-1 // 7146

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@51 // 7147
D=A // 7148
@SP // 7149
AM=M+1 // 7150
A=A-1 // 7151
M=D // 7152
@30 // 7153
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
@48 // 7165
D=A // 7166
@SP // 7167
AM=M+1 // 7168
A=A-1 // 7169
M=D // 7170
@48 // 7171
D=A // 7172
@SP // 7173
AM=M+1 // 7174
A=A-1 // 7175
M=D // 7176
@28 // 7177
D=A // 7178
@SP // 7179
AM=M+1 // 7180
A=A-1 // 7181
M=D // 7182
@48 // 7183
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
@51 // 7195
D=A // 7196
@SP // 7197
AM=M+1 // 7198
A=A-1 // 7199
M=D // 7200
@30 // 7201
D=A // 7202
@SP // 7203
AM=M+1 // 7204
A=A-1 // 7205
M=D // 7206
@SP // 7207
AM=M+1 // 7208
A=A-1 // 7209
M=0 // 7210
@SP // 7211
AM=M+1 // 7212
A=A-1 // 7213
M=0 // 7214
// call Output.create
@17 // 7215
D=A // 7216
@14 // 7217
M=D // 7218
@Output.create // 7219
D=A // 7220
@13 // 7221
M=D // 7222
@Output.init.ret.21 // 7223
D=A // 7224
@CALL // 7225
0;JMP // 7226
(Output.init.ret.21)
@SP // 7227
M=M-1 // 7228

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 52"), PushInstruction("constant 16"), PushInstruction("constant 24"), PushInstruction("constant 28"), PushInstruction("constant 26"), PushInstruction("constant 25"), PushInstruction("constant 63"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@52 // 7229
D=A // 7230
@SP // 7231
AM=M+1 // 7232
A=A-1 // 7233
M=D // 7234
@16 // 7235
D=A // 7236
@SP // 7237
AM=M+1 // 7238
A=A-1 // 7239
M=D // 7240
@24 // 7241
D=A // 7242
@SP // 7243
AM=M+1 // 7244
A=A-1 // 7245
M=D // 7246
@28 // 7247
D=A // 7248
@SP // 7249
AM=M+1 // 7250
A=A-1 // 7251
M=D // 7252
@26 // 7253
D=A // 7254
@SP // 7255
AM=M+1 // 7256
A=A-1 // 7257
M=D // 7258
@25 // 7259
D=A // 7260
@SP // 7261
AM=M+1 // 7262
A=A-1 // 7263
M=D // 7264
@63 // 7265
D=A // 7266
@SP // 7267
AM=M+1 // 7268
A=A-1 // 7269
M=D // 7270
@24 // 7271
D=A // 7272
@SP // 7273
AM=M+1 // 7274
A=A-1 // 7275
M=D // 7276
@24 // 7277
D=A // 7278
@SP // 7279
AM=M+1 // 7280
A=A-1 // 7281
M=D // 7282
@60 // 7283
D=A // 7284
@SP // 7285
AM=M+1 // 7286
A=A-1 // 7287
M=D // 7288
@SP // 7289
AM=M+1 // 7290
A=A-1 // 7291
M=0 // 7292
@SP // 7293
AM=M+1 // 7294
A=A-1 // 7295
M=0 // 7296
// call Output.create
@17 // 7297
D=A // 7298
@14 // 7299
M=D // 7300
@Output.create // 7301
D=A // 7302
@13 // 7303
M=D // 7304
@Output.init.ret.22 // 7305
D=A // 7306
@CALL // 7307
0;JMP // 7308
(Output.init.ret.22)
@SP // 7309
M=M-1 // 7310

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 53"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@53 // 7311
D=A // 7312
@SP // 7313
AM=M+1 // 7314
A=A-1 // 7315
M=D // 7316
@63 // 7317
D=A // 7318
@SP // 7319
AM=M+1 // 7320
A=A-1 // 7321
M=D // 7322
@3 // 7323
D=A // 7324
@SP // 7325
AM=M+1 // 7326
A=A-1 // 7327
M=D // 7328
@3 // 7329
D=A // 7330
@SP // 7331
AM=M+1 // 7332
A=A-1 // 7333
M=D // 7334
@31 // 7335
D=A // 7336
@SP // 7337
AM=M+1 // 7338
A=A-1 // 7339
M=D // 7340
@48 // 7341
D=A // 7342
@SP // 7343
AM=M+1 // 7344
A=A-1 // 7345
M=D // 7346
@48 // 7347
D=A // 7348
@SP // 7349
AM=M+1 // 7350
A=A-1 // 7351
M=D // 7352
@48 // 7353
D=A // 7354
@SP // 7355
AM=M+1 // 7356
A=A-1 // 7357
M=D // 7358
@51 // 7359
D=A // 7360
@SP // 7361
AM=M+1 // 7362
A=A-1 // 7363
M=D // 7364
@30 // 7365
D=A // 7366
@SP // 7367
AM=M+1 // 7368
A=A-1 // 7369
M=D // 7370
@SP // 7371
AM=M+1 // 7372
A=A-1 // 7373
M=0 // 7374
@SP // 7375
AM=M+1 // 7376
A=A-1 // 7377
M=0 // 7378
// call Output.create
@17 // 7379
D=A // 7380
@14 // 7381
M=D // 7382
@Output.create // 7383
D=A // 7384
@13 // 7385
M=D // 7386
@Output.init.ret.23 // 7387
D=A // 7388
@CALL // 7389
0;JMP // 7390
(Output.init.ret.23)
@SP // 7391
M=M-1 // 7392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@54 // 7393
D=A // 7394
@SP // 7395
AM=M+1 // 7396
A=A-1 // 7397
M=D // 7398
@28 // 7399
D=A // 7400
@SP // 7401
AM=M+1 // 7402
A=A-1 // 7403
M=D // 7404
@6 // 7405
D=A // 7406
@SP // 7407
AM=M+1 // 7408
A=A-1 // 7409
M=D // 7410
@3 // 7411
D=A // 7412
@SP // 7413
AM=M+1 // 7414
A=A-1 // 7415
M=D // 7416
@3 // 7417
D=A // 7418
@SP // 7419
AM=M+1 // 7420
A=A-1 // 7421
M=D // 7422
@31 // 7423
D=A // 7424
@SP // 7425
AM=M+1 // 7426
A=A-1 // 7427
M=D // 7428
@51 // 7429
D=A // 7430
@SP // 7431
AM=M+1 // 7432
A=A-1 // 7433
M=D // 7434
@51 // 7435
D=A // 7436
@SP // 7437
AM=M+1 // 7438
A=A-1 // 7439
M=D // 7440
@51 // 7441
D=A // 7442
@SP // 7443
AM=M+1 // 7444
A=A-1 // 7445
M=D // 7446
@30 // 7447
D=A // 7448
@SP // 7449
AM=M+1 // 7450
A=A-1 // 7451
M=D // 7452
@SP // 7453
AM=M+1 // 7454
A=A-1 // 7455
M=0 // 7456
@SP // 7457
AM=M+1 // 7458
A=A-1 // 7459
M=0 // 7460
// call Output.create
@17 // 7461
D=A // 7462
@14 // 7463
M=D // 7464
@Output.create // 7465
D=A // 7466
@13 // 7467
M=D // 7468
@Output.init.ret.24 // 7469
D=A // 7470
@CALL // 7471
0;JMP // 7472
(Output.init.ret.24)
@SP // 7473
M=M-1 // 7474

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 49"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@55 // 7475
D=A // 7476
@SP // 7477
AM=M+1 // 7478
A=A-1 // 7479
M=D // 7480
@63 // 7481
D=A // 7482
@SP // 7483
AM=M+1 // 7484
A=A-1 // 7485
M=D // 7486
@49 // 7487
D=A // 7488
@SP // 7489
AM=M+1 // 7490
A=A-1 // 7491
M=D // 7492
@48 // 7493
D=A // 7494
@SP // 7495
AM=M+1 // 7496
A=A-1 // 7497
M=D // 7498
@48 // 7499
D=A // 7500
@SP // 7501
AM=M+1 // 7502
A=A-1 // 7503
M=D // 7504
@24 // 7505
D=A // 7506
@SP // 7507
AM=M+1 // 7508
A=A-1 // 7509
M=D // 7510
@12 // 7511
D=A // 7512
@SP // 7513
AM=M+1 // 7514
A=A-1 // 7515
M=D // 7516
@12 // 7517
D=A // 7518
@SP // 7519
AM=M+1 // 7520
A=A-1 // 7521
M=D // 7522
@12 // 7523
D=A // 7524
@SP // 7525
AM=M+1 // 7526
A=A-1 // 7527
M=D // 7528
@12 // 7529
D=A // 7530
@SP // 7531
AM=M+1 // 7532
A=A-1 // 7533
M=D // 7534
@SP // 7535
AM=M+1 // 7536
A=A-1 // 7537
M=0 // 7538
@SP // 7539
AM=M+1 // 7540
A=A-1 // 7541
M=0 // 7542
// call Output.create
@17 // 7543
D=A // 7544
@14 // 7545
M=D // 7546
@Output.create // 7547
D=A // 7548
@13 // 7549
M=D // 7550
@Output.init.ret.25 // 7551
D=A // 7552
@CALL // 7553
0;JMP // 7554
(Output.init.ret.25)
@SP // 7555
M=M-1 // 7556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 56"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@56 // 7557
D=A // 7558
@SP // 7559
AM=M+1 // 7560
A=A-1 // 7561
M=D // 7562
@30 // 7563
D=A // 7564
@SP // 7565
AM=M+1 // 7566
A=A-1 // 7567
M=D // 7568
@51 // 7569
D=A // 7570
@SP // 7571
AM=M+1 // 7572
A=A-1 // 7573
M=D // 7574
@51 // 7575
D=A // 7576
@SP // 7577
AM=M+1 // 7578
A=A-1 // 7579
M=D // 7580
@51 // 7581
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
@SP // 7617
AM=M+1 // 7618
A=A-1 // 7619
M=0 // 7620
@SP // 7621
AM=M+1 // 7622
A=A-1 // 7623
M=0 // 7624
// call Output.create
@17 // 7625
D=A // 7626
@14 // 7627
M=D // 7628
@Output.create // 7629
D=A // 7630
@13 // 7631
M=D // 7632
@Output.init.ret.26 // 7633
D=A // 7634
@CALL // 7635
0;JMP // 7636
(Output.init.ret.26)
@SP // 7637
M=M-1 // 7638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 57"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@57 // 7639
D=A // 7640
@SP // 7641
AM=M+1 // 7642
A=A-1 // 7643
M=D // 7644
@30 // 7645
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
@51 // 7657
D=A // 7658
@SP // 7659
AM=M+1 // 7660
A=A-1 // 7661
M=D // 7662
@51 // 7663
D=A // 7664
@SP // 7665
AM=M+1 // 7666
A=A-1 // 7667
M=D // 7668
@62 // 7669
D=A // 7670
@SP // 7671
AM=M+1 // 7672
A=A-1 // 7673
M=D // 7674
@48 // 7675
D=A // 7676
@SP // 7677
AM=M+1 // 7678
A=A-1 // 7679
M=D // 7680
@48 // 7681
D=A // 7682
@SP // 7683
AM=M+1 // 7684
A=A-1 // 7685
M=D // 7686
@24 // 7687
D=A // 7688
@SP // 7689
AM=M+1 // 7690
A=A-1 // 7691
M=D // 7692
@14 // 7693
D=A // 7694
@SP // 7695
AM=M+1 // 7696
A=A-1 // 7697
M=D // 7698
@SP // 7699
AM=M+1 // 7700
A=A-1 // 7701
M=0 // 7702
@SP // 7703
AM=M+1 // 7704
A=A-1 // 7705
M=0 // 7706
// call Output.create
@17 // 7707
D=A // 7708
@14 // 7709
M=D // 7710
@Output.create // 7711
D=A // 7712
@13 // 7713
M=D // 7714
@Output.init.ret.27 // 7715
D=A // 7716
@CALL // 7717
0;JMP // 7718
(Output.init.ret.27)
@SP // 7719
M=M-1 // 7720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 58"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7721
D=A // 7722
@SP // 7723
M=D+M // 7724
@58 // 7725
D=A // 7726
@SP // 7727
A=M-1 // 7728
M=0 // 7729
A=A-1 // 7730
M=0 // 7731
A=A-1 // 7732
M=D // 7733
A=A-1 // 7734
@4 // 7735
D=A // 7736
@SP // 7737
M=D+M // 7738
@12 // 7739
D=A // 7740
@SP // 7741
A=M-1 // 7742
M=0 // 7743
A=A-1 // 7744
M=0 // 7745
A=A-1 // 7746
M=D // 7747
A=A-1 // 7748
M=D // 7749
A=A-1 // 7750
@5 // 7751
D=A // 7752
@SP // 7753
M=D+M // 7754
@12 // 7755
D=A // 7756
@SP // 7757
A=M-1 // 7758
M=0 // 7759
A=A-1 // 7760
M=0 // 7761
A=A-1 // 7762
M=0 // 7763
A=A-1 // 7764
M=D // 7765
A=A-1 // 7766
M=D // 7767
A=A-1 // 7768
// call Output.create
@17 // 7769
D=A // 7770
@14 // 7771
M=D // 7772
@Output.create // 7773
D=A // 7774
@13 // 7775
M=D // 7776
@Output.init.ret.28 // 7777
D=A // 7778
@CALL // 7779
0;JMP // 7780
(Output.init.ret.28)
@SP // 7781
M=M-1 // 7782

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 59"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7783
D=A // 7784
@SP // 7785
M=D+M // 7786
@59 // 7787
D=A // 7788
@SP // 7789
A=M-1 // 7790
M=0 // 7791
A=A-1 // 7792
M=0 // 7793
A=A-1 // 7794
M=D // 7795
A=A-1 // 7796
@4 // 7797
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
M=D // 7809
A=A-1 // 7810
M=D // 7811
A=A-1 // 7812
@12 // 7813
D=A // 7814
@SP // 7815
AM=M+1 // 7816
A=A-1 // 7817
M=D // 7818
@12 // 7819
D=A // 7820
@SP // 7821
AM=M+1 // 7822
A=A-1 // 7823
M=D // 7824
@6 // 7825
D=A // 7826
@SP // 7827
AM=M+1 // 7828
A=A-1 // 7829
M=D // 7830
@SP // 7831
AM=M+1 // 7832
A=A-1 // 7833
M=0 // 7834
@SP // 7835
AM=M+1 // 7836
A=A-1 // 7837
M=0 // 7838
// call Output.create
@17 // 7839
D=A // 7840
@14 // 7841
M=D // 7842
@Output.create // 7843
D=A // 7844
@13 // 7845
M=D // 7846
@Output.init.ret.29 // 7847
D=A // 7848
@CALL // 7849
0;JMP // 7850
(Output.init.ret.29)
@SP // 7851
M=M-1 // 7852

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 60"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7853
D=A // 7854
@SP // 7855
M=D+M // 7856
@60 // 7857
D=A // 7858
@SP // 7859
A=M-1 // 7860
M=0 // 7861
A=A-1 // 7862
M=0 // 7863
A=A-1 // 7864
M=D // 7865
A=A-1 // 7866
@24 // 7867
D=A // 7868
@SP // 7869
AM=M+1 // 7870
A=A-1 // 7871
M=D // 7872
@12 // 7873
D=A // 7874
@SP // 7875
AM=M+1 // 7876
A=A-1 // 7877
M=D // 7878
@6 // 7879
D=A // 7880
@SP // 7881
AM=M+1 // 7882
A=A-1 // 7883
M=D // 7884
@3 // 7885
D=A // 7886
@SP // 7887
AM=M+1 // 7888
A=A-1 // 7889
M=D // 7890
@6 // 7891
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
@24 // 7903
D=A // 7904
@SP // 7905
AM=M+1 // 7906
A=A-1 // 7907
M=D // 7908
@SP // 7909
AM=M+1 // 7910
A=A-1 // 7911
M=0 // 7912
@SP // 7913
AM=M+1 // 7914
A=A-1 // 7915
M=0 // 7916
// call Output.create
@17 // 7917
D=A // 7918
@14 // 7919
M=D // 7920
@Output.create // 7921
D=A // 7922
@13 // 7923
M=D // 7924
@Output.init.ret.30 // 7925
D=A // 7926
@CALL // 7927
0;JMP // 7928
(Output.init.ret.30)
@SP // 7929
M=M-1 // 7930

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 61"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 7931
D=A // 7932
@SP // 7933
M=D+M // 7934
@61 // 7935
D=A // 7936
@SP // 7937
A=M-1 // 7938
M=0 // 7939
A=A-1 // 7940
M=0 // 7941
A=A-1 // 7942
M=0 // 7943
A=A-1 // 7944
M=D // 7945
A=A-1 // 7946
@3 // 7947
D=A // 7948
@SP // 7949
M=D+M // 7950
@63 // 7951
D=A // 7952
@SP // 7953
A=M-1 // 7954
M=0 // 7955
A=A-1 // 7956
M=0 // 7957
A=A-1 // 7958
M=D // 7959
A=A-1 // 7960
@5 // 7961
D=A // 7962
@SP // 7963
M=D+M // 7964
@63 // 7965
D=A // 7966
@SP // 7967
A=M-1 // 7968
M=0 // 7969
A=A-1 // 7970
M=0 // 7971
A=A-1 // 7972
M=0 // 7973
A=A-1 // 7974
M=0 // 7975
A=A-1 // 7976
M=D // 7977
A=A-1 // 7978
// call Output.create
@17 // 7979
D=A // 7980
@14 // 7981
M=D // 7982
@Output.create // 7983
D=A // 7984
@13 // 7985
M=D // 7986
@Output.init.ret.31 // 7987
D=A // 7988
@CALL // 7989
0;JMP // 7990
(Output.init.ret.31)
@SP // 7991
M=M-1 // 7992

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 62"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 7993
D=A // 7994
@SP // 7995
M=D+M // 7996
@62 // 7997
D=A // 7998
@SP // 7999
A=M-1 // 8000
M=0 // 8001
A=A-1 // 8002
M=0 // 8003
A=A-1 // 8004
M=D // 8005
A=A-1 // 8006
@3 // 8007
D=A // 8008
@SP // 8009
AM=M+1 // 8010
A=A-1 // 8011
M=D // 8012
@6 // 8013
D=A // 8014
@SP // 8015
AM=M+1 // 8016
A=A-1 // 8017
M=D // 8018
@12 // 8019
D=A // 8020
@SP // 8021
AM=M+1 // 8022
A=A-1 // 8023
M=D // 8024
@24 // 8025
D=A // 8026
@SP // 8027
AM=M+1 // 8028
A=A-1 // 8029
M=D // 8030
@12 // 8031
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
@3 // 8043
D=A // 8044
@SP // 8045
AM=M+1 // 8046
A=A-1 // 8047
M=D // 8048
@SP // 8049
AM=M+1 // 8050
A=A-1 // 8051
M=0 // 8052
@SP // 8053
AM=M+1 // 8054
A=A-1 // 8055
M=0 // 8056
// call Output.create
@17 // 8057
D=A // 8058
@14 // 8059
M=D // 8060
@Output.create // 8061
D=A // 8062
@13 // 8063
M=D // 8064
@Output.init.ret.32 // 8065
D=A // 8066
@CALL // 8067
0;JMP // 8068
(Output.init.ret.32)
@SP // 8069
M=M-1 // 8070

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 64"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 27"), PushInstruction("constant 3"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@64 // 8071
D=A // 8072
@SP // 8073
AM=M+1 // 8074
A=A-1 // 8075
M=D // 8076
@30 // 8077
D=A // 8078
@SP // 8079
AM=M+1 // 8080
A=A-1 // 8081
M=D // 8082
@51 // 8083
D=A // 8084
@SP // 8085
AM=M+1 // 8086
A=A-1 // 8087
M=D // 8088
@51 // 8089
D=A // 8090
@SP // 8091
AM=M+1 // 8092
A=A-1 // 8093
M=D // 8094
@59 // 8095
D=A // 8096
@SP // 8097
AM=M+1 // 8098
A=A-1 // 8099
M=D // 8100
@59 // 8101
D=A // 8102
@SP // 8103
AM=M+1 // 8104
A=A-1 // 8105
M=D // 8106
@59 // 8107
D=A // 8108
@SP // 8109
AM=M+1 // 8110
A=A-1 // 8111
M=D // 8112
@27 // 8113
D=A // 8114
@SP // 8115
AM=M+1 // 8116
A=A-1 // 8117
M=D // 8118
@3 // 8119
D=A // 8120
@SP // 8121
AM=M+1 // 8122
A=A-1 // 8123
M=D // 8124
@30 // 8125
D=A // 8126
@SP // 8127
AM=M+1 // 8128
A=A-1 // 8129
M=D // 8130
@SP // 8131
AM=M+1 // 8132
A=A-1 // 8133
M=0 // 8134
@SP // 8135
AM=M+1 // 8136
A=A-1 // 8137
M=0 // 8138
// call Output.create
@17 // 8139
D=A // 8140
@14 // 8141
M=D // 8142
@Output.create // 8143
D=A // 8144
@13 // 8145
M=D // 8146
@Output.init.ret.33 // 8147
D=A // 8148
@CALL // 8149
0;JMP // 8150
(Output.init.ret.33)
@SP // 8151
M=M-1 // 8152

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 63"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@63 // 8153
D=A // 8154
@SP // 8155
AM=M+1 // 8156
A=A-1 // 8157
M=D // 8158
@30 // 8159
D=A // 8160
@SP // 8161
AM=M+1 // 8162
A=A-1 // 8163
M=D // 8164
@51 // 8165
D=A // 8166
@SP // 8167
AM=M+1 // 8168
A=A-1 // 8169
M=D // 8170
@51 // 8171
D=A // 8172
@SP // 8173
AM=M+1 // 8174
A=A-1 // 8175
M=D // 8176
@24 // 8177
D=A // 8178
@SP // 8179
AM=M+1 // 8180
A=A-1 // 8181
M=D // 8182
@12 // 8183
D=A // 8184
@SP // 8185
AM=M+1 // 8186
A=A-1 // 8187
M=D // 8188
@12 // 8189
D=A // 8190
@SP // 8191
AM=M+1 // 8192
A=A-1 // 8193
M=D // 8194
@SP // 8195
AM=M+1 // 8196
A=A-1 // 8197
M=0 // 8198
@4 // 8199
D=A // 8200
@SP // 8201
M=D+M // 8202
@12 // 8203
D=A // 8204
@SP // 8205
A=M-1 // 8206
M=0 // 8207
A=A-1 // 8208
M=0 // 8209
A=A-1 // 8210
M=D // 8211
A=A-1 // 8212
M=D // 8213
A=A-1 // 8214
// call Output.create
@17 // 8215
D=A // 8216
@14 // 8217
M=D // 8218
@Output.create // 8219
D=A // 8220
@13 // 8221
M=D // 8222
@Output.init.ret.34 // 8223
D=A // 8224
@CALL // 8225
0;JMP // 8226
(Output.init.ret.34)
@SP // 8227
M=M-1 // 8228

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 65"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@65 // 8229
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
@30 // 8241
D=A // 8242
@SP // 8243
AM=M+1 // 8244
A=A-1 // 8245
M=D // 8246
@51 // 8247
D=A // 8248
@SP // 8249
AM=M+1 // 8250
A=A-1 // 8251
M=D // 8252
@51 // 8253
D=A // 8254
@SP // 8255
AM=M+1 // 8256
A=A-1 // 8257
M=D // 8258
@63 // 8259
D=A // 8260
@SP // 8261
AM=M+1 // 8262
A=A-1 // 8263
M=D // 8264
@51 // 8265
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
@51 // 8283
D=A // 8284
@SP // 8285
AM=M+1 // 8286
A=A-1 // 8287
M=D // 8288
@SP // 8289
AM=M+1 // 8290
A=A-1 // 8291
M=0 // 8292
@SP // 8293
AM=M+1 // 8294
A=A-1 // 8295
M=0 // 8296
// call Output.create
@17 // 8297
D=A // 8298
@14 // 8299
M=D // 8300
@Output.create // 8301
D=A // 8302
@13 // 8303
M=D // 8304
@Output.init.ret.35 // 8305
D=A // 8306
@CALL // 8307
0;JMP // 8308
(Output.init.ret.35)
@SP // 8309
M=M-1 // 8310

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 66"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@66 // 8311
D=A // 8312
@SP // 8313
AM=M+1 // 8314
A=A-1 // 8315
M=D // 8316
@31 // 8317
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
@51 // 8335
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
@SP // 8371
AM=M+1 // 8372
A=A-1 // 8373
M=0 // 8374
@SP // 8375
AM=M+1 // 8376
A=A-1 // 8377
M=0 // 8378
// call Output.create
@17 // 8379
D=A // 8380
@14 // 8381
M=D // 8382
@Output.create // 8383
D=A // 8384
@13 // 8385
M=D // 8386
@Output.init.ret.36 // 8387
D=A // 8388
@CALL // 8389
0;JMP // 8390
(Output.init.ret.36)
@SP // 8391
M=M-1 // 8392

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 67"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@67 // 8393
D=A // 8394
@SP // 8395
AM=M+1 // 8396
A=A-1 // 8397
M=D // 8398
@28 // 8399
D=A // 8400
@SP // 8401
AM=M+1 // 8402
A=A-1 // 8403
M=D // 8404
@54 // 8405
D=A // 8406
@SP // 8407
AM=M+1 // 8408
A=A-1 // 8409
M=D // 8410
@35 // 8411
D=A // 8412
@SP // 8413
AM=M+1 // 8414
A=A-1 // 8415
M=D // 8416
@3 // 8417
D=A // 8418
@SP // 8419
AM=M+1 // 8420
A=A-1 // 8421
M=D // 8422
@3 // 8423
D=A // 8424
@SP // 8425
AM=M+1 // 8426
A=A-1 // 8427
M=D // 8428
@3 // 8429
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
@54 // 8441
D=A // 8442
@SP // 8443
AM=M+1 // 8444
A=A-1 // 8445
M=D // 8446
@28 // 8447
D=A // 8448
@SP // 8449
AM=M+1 // 8450
A=A-1 // 8451
M=D // 8452
@SP // 8453
AM=M+1 // 8454
A=A-1 // 8455
M=0 // 8456
@SP // 8457
AM=M+1 // 8458
A=A-1 // 8459
M=0 // 8460
// call Output.create
@17 // 8461
D=A // 8462
@14 // 8463
M=D // 8464
@Output.create // 8465
D=A // 8466
@13 // 8467
M=D // 8468
@Output.init.ret.37 // 8469
D=A // 8470
@CALL // 8471
0;JMP // 8472
(Output.init.ret.37)
@SP // 8473
M=M-1 // 8474

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 68"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@68 // 8475
D=A // 8476
@SP // 8477
AM=M+1 // 8478
A=A-1 // 8479
M=D // 8480
@15 // 8481
D=A // 8482
@SP // 8483
AM=M+1 // 8484
A=A-1 // 8485
M=D // 8486
@27 // 8487
D=A // 8488
@SP // 8489
AM=M+1 // 8490
A=A-1 // 8491
M=D // 8492
@51 // 8493
D=A // 8494
@SP // 8495
AM=M+1 // 8496
A=A-1 // 8497
M=D // 8498
@51 // 8499
D=A // 8500
@SP // 8501
AM=M+1 // 8502
A=A-1 // 8503
M=D // 8504
@51 // 8505
D=A // 8506
@SP // 8507
AM=M+1 // 8508
A=A-1 // 8509
M=D // 8510
@51 // 8511
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
@27 // 8523
D=A // 8524
@SP // 8525
AM=M+1 // 8526
A=A-1 // 8527
M=D // 8528
@15 // 8529
D=A // 8530
@SP // 8531
AM=M+1 // 8532
A=A-1 // 8533
M=D // 8534
@SP // 8535
AM=M+1 // 8536
A=A-1 // 8537
M=0 // 8538
@SP // 8539
AM=M+1 // 8540
A=A-1 // 8541
M=0 // 8542
// call Output.create
@17 // 8543
D=A // 8544
@14 // 8545
M=D // 8546
@Output.create // 8547
D=A // 8548
@13 // 8549
M=D // 8550
@Output.init.ret.38 // 8551
D=A // 8552
@CALL // 8553
0;JMP // 8554
(Output.init.ret.38)
@SP // 8555
M=M-1 // 8556

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 69"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@69 // 8557
D=A // 8558
@SP // 8559
AM=M+1 // 8560
A=A-1 // 8561
M=D // 8562
@63 // 8563
D=A // 8564
@SP // 8565
AM=M+1 // 8566
A=A-1 // 8567
M=D // 8568
@51 // 8569
D=A // 8570
@SP // 8571
AM=M+1 // 8572
A=A-1 // 8573
M=D // 8574
@35 // 8575
D=A // 8576
@SP // 8577
AM=M+1 // 8578
A=A-1 // 8579
M=D // 8580
@11 // 8581
D=A // 8582
@SP // 8583
AM=M+1 // 8584
A=A-1 // 8585
M=D // 8586
@15 // 8587
D=A // 8588
@SP // 8589
AM=M+1 // 8590
A=A-1 // 8591
M=D // 8592
@11 // 8593
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
@51 // 8605
D=A // 8606
@SP // 8607
AM=M+1 // 8608
A=A-1 // 8609
M=D // 8610
@63 // 8611
D=A // 8612
@SP // 8613
AM=M+1 // 8614
A=A-1 // 8615
M=D // 8616
@SP // 8617
AM=M+1 // 8618
A=A-1 // 8619
M=0 // 8620
@SP // 8621
AM=M+1 // 8622
A=A-1 // 8623
M=0 // 8624
// call Output.create
@17 // 8625
D=A // 8626
@14 // 8627
M=D // 8628
@Output.create // 8629
D=A // 8630
@13 // 8631
M=D // 8632
@Output.init.ret.39 // 8633
D=A // 8634
@CALL // 8635
0;JMP // 8636
(Output.init.ret.39)
@SP // 8637
M=M-1 // 8638

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 70"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 35"), PushInstruction("constant 11"), PushInstruction("constant 15"), PushInstruction("constant 11"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@70 // 8639
D=A // 8640
@SP // 8641
AM=M+1 // 8642
A=A-1 // 8643
M=D // 8644
@63 // 8645
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
@35 // 8657
D=A // 8658
@SP // 8659
AM=M+1 // 8660
A=A-1 // 8661
M=D // 8662
@11 // 8663
D=A // 8664
@SP // 8665
AM=M+1 // 8666
A=A-1 // 8667
M=D // 8668
@15 // 8669
D=A // 8670
@SP // 8671
AM=M+1 // 8672
A=A-1 // 8673
M=D // 8674
@11 // 8675
D=A // 8676
@SP // 8677
AM=M+1 // 8678
A=A-1 // 8679
M=D // 8680
@3 // 8681
D=A // 8682
@SP // 8683
AM=M+1 // 8684
A=A-1 // 8685
M=D // 8686
@3 // 8687
D=A // 8688
@SP // 8689
AM=M+1 // 8690
A=A-1 // 8691
M=D // 8692
@3 // 8693
D=A // 8694
@SP // 8695
AM=M+1 // 8696
A=A-1 // 8697
M=D // 8698
@SP // 8699
AM=M+1 // 8700
A=A-1 // 8701
M=0 // 8702
@SP // 8703
AM=M+1 // 8704
A=A-1 // 8705
M=0 // 8706
// call Output.create
@17 // 8707
D=A // 8708
@14 // 8709
M=D // 8710
@Output.create // 8711
D=A // 8712
@13 // 8713
M=D // 8714
@Output.init.ret.40 // 8715
D=A // 8716
@CALL // 8717
0;JMP // 8718
(Output.init.ret.40)
@SP // 8719
M=M-1 // 8720

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 71"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 35"), PushInstruction("constant 3"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 54"), PushInstruction("constant 44"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@71 // 8721
D=A // 8722
@SP // 8723
AM=M+1 // 8724
A=A-1 // 8725
M=D // 8726
@28 // 8727
D=A // 8728
@SP // 8729
AM=M+1 // 8730
A=A-1 // 8731
M=D // 8732
@54 // 8733
D=A // 8734
@SP // 8735
AM=M+1 // 8736
A=A-1 // 8737
M=D // 8738
@35 // 8739
D=A // 8740
@SP // 8741
AM=M+1 // 8742
A=A-1 // 8743
M=D // 8744
@3 // 8745
D=A // 8746
@SP // 8747
AM=M+1 // 8748
A=A-1 // 8749
M=D // 8750
@59 // 8751
D=A // 8752
@SP // 8753
AM=M+1 // 8754
A=A-1 // 8755
M=D // 8756
@51 // 8757
D=A // 8758
@SP // 8759
AM=M+1 // 8760
A=A-1 // 8761
M=D // 8762
@51 // 8763
D=A // 8764
@SP // 8765
AM=M+1 // 8766
A=A-1 // 8767
M=D // 8768
@54 // 8769
D=A // 8770
@SP // 8771
AM=M+1 // 8772
A=A-1 // 8773
M=D // 8774
@44 // 8775
D=A // 8776
@SP // 8777
AM=M+1 // 8778
A=A-1 // 8779
M=D // 8780
@SP // 8781
AM=M+1 // 8782
A=A-1 // 8783
M=0 // 8784
@SP // 8785
AM=M+1 // 8786
A=A-1 // 8787
M=0 // 8788
// call Output.create
@17 // 8789
D=A // 8790
@14 // 8791
M=D // 8792
@Output.create // 8793
D=A // 8794
@13 // 8795
M=D // 8796
@Output.init.ret.41 // 8797
D=A // 8798
@CALL // 8799
0;JMP // 8800
(Output.init.ret.41)
@SP // 8801
M=M-1 // 8802

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 72"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@72 // 8803
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
@51 // 8815
D=A // 8816
@SP // 8817
AM=M+1 // 8818
A=A-1 // 8819
M=D // 8820
@51 // 8821
D=A // 8822
@SP // 8823
AM=M+1 // 8824
A=A-1 // 8825
M=D // 8826
@51 // 8827
D=A // 8828
@SP // 8829
AM=M+1 // 8830
A=A-1 // 8831
M=D // 8832
@63 // 8833
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
@51 // 8857
D=A // 8858
@SP // 8859
AM=M+1 // 8860
A=A-1 // 8861
M=D // 8862
@SP // 8863
AM=M+1 // 8864
A=A-1 // 8865
M=0 // 8866
@SP // 8867
AM=M+1 // 8868
A=A-1 // 8869
M=0 // 8870
// call Output.create
@17 // 8871
D=A // 8872
@14 // 8873
M=D // 8874
@Output.create // 8875
D=A // 8876
@13 // 8877
M=D // 8878
@Output.init.ret.42 // 8879
D=A // 8880
@CALL // 8881
0;JMP // 8882
(Output.init.ret.42)
@SP // 8883
M=M-1 // 8884

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 73"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@73 // 8885
D=A // 8886
@SP // 8887
AM=M+1 // 8888
A=A-1 // 8889
M=D // 8890
@30 // 8891
D=A // 8892
@SP // 8893
AM=M+1 // 8894
A=A-1 // 8895
M=D // 8896
@12 // 8897
D=A // 8898
@SP // 8899
AM=M+1 // 8900
A=A-1 // 8901
M=D // 8902
@12 // 8903
D=A // 8904
@SP // 8905
AM=M+1 // 8906
A=A-1 // 8907
M=D // 8908
@12 // 8909
D=A // 8910
@SP // 8911
AM=M+1 // 8912
A=A-1 // 8913
M=D // 8914
@12 // 8915
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
@30 // 8939
D=A // 8940
@SP // 8941
AM=M+1 // 8942
A=A-1 // 8943
M=D // 8944
@SP // 8945
AM=M+1 // 8946
A=A-1 // 8947
M=0 // 8948
@SP // 8949
AM=M+1 // 8950
A=A-1 // 8951
M=0 // 8952
// call Output.create
@17 // 8953
D=A // 8954
@14 // 8955
M=D // 8956
@Output.create // 8957
D=A // 8958
@13 // 8959
M=D // 8960
@Output.init.ret.43 // 8961
D=A // 8962
@CALL // 8963
0;JMP // 8964
(Output.init.ret.43)
@SP // 8965
M=M-1 // 8966

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 74"), PushInstruction("constant 60"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 14"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@74 // 8967
D=A // 8968
@SP // 8969
AM=M+1 // 8970
A=A-1 // 8971
M=D // 8972
@60 // 8973
D=A // 8974
@SP // 8975
AM=M+1 // 8976
A=A-1 // 8977
M=D // 8978
@24 // 8979
D=A // 8980
@SP // 8981
AM=M+1 // 8982
A=A-1 // 8983
M=D // 8984
@24 // 8985
D=A // 8986
@SP // 8987
AM=M+1 // 8988
A=A-1 // 8989
M=D // 8990
@24 // 8991
D=A // 8992
@SP // 8993
AM=M+1 // 8994
A=A-1 // 8995
M=D // 8996
@24 // 8997
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
@27 // 9009
D=A // 9010
@SP // 9011
AM=M+1 // 9012
A=A-1 // 9013
M=D // 9014
@27 // 9015
D=A // 9016
@SP // 9017
AM=M+1 // 9018
A=A-1 // 9019
M=D // 9020
@14 // 9021
D=A // 9022
@SP // 9023
AM=M+1 // 9024
A=A-1 // 9025
M=D // 9026
@SP // 9027
AM=M+1 // 9028
A=A-1 // 9029
M=0 // 9030
@SP // 9031
AM=M+1 // 9032
A=A-1 // 9033
M=0 // 9034
// call Output.create
@17 // 9035
D=A // 9036
@14 // 9037
M=D // 9038
@Output.create // 9039
D=A // 9040
@13 // 9041
M=D // 9042
@Output.init.ret.44 // 9043
D=A // 9044
@CALL // 9045
0;JMP // 9046
(Output.init.ret.44)
@SP // 9047
M=M-1 // 9048

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 75"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@75 // 9049
D=A // 9050
@SP // 9051
AM=M+1 // 9052
A=A-1 // 9053
M=D // 9054
@51 // 9055
D=A // 9056
@SP // 9057
AM=M+1 // 9058
A=A-1 // 9059
M=D // 9060
@51 // 9061
D=A // 9062
@SP // 9063
AM=M+1 // 9064
A=A-1 // 9065
M=D // 9066
@51 // 9067
D=A // 9068
@SP // 9069
AM=M+1 // 9070
A=A-1 // 9071
M=D // 9072
@27 // 9073
D=A // 9074
@SP // 9075
AM=M+1 // 9076
A=A-1 // 9077
M=D // 9078
@15 // 9079
D=A // 9080
@SP // 9081
AM=M+1 // 9082
A=A-1 // 9083
M=D // 9084
@27 // 9085
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
@51 // 9097
D=A // 9098
@SP // 9099
AM=M+1 // 9100
A=A-1 // 9101
M=D // 9102
@51 // 9103
D=A // 9104
@SP // 9105
AM=M+1 // 9106
A=A-1 // 9107
M=D // 9108
@SP // 9109
AM=M+1 // 9110
A=A-1 // 9111
M=0 // 9112
@SP // 9113
AM=M+1 // 9114
A=A-1 // 9115
M=0 // 9116
// call Output.create
@17 // 9117
D=A // 9118
@14 // 9119
M=D // 9120
@Output.create // 9121
D=A // 9122
@13 // 9123
M=D // 9124
@Output.init.ret.45 // 9125
D=A // 9126
@CALL // 9127
0;JMP // 9128
(Output.init.ret.45)
@SP // 9129
M=M-1 // 9130

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 76"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@76 // 9131
D=A // 9132
@SP // 9133
AM=M+1 // 9134
A=A-1 // 9135
M=D // 9136
@3 // 9137
D=A // 9138
@SP // 9139
AM=M+1 // 9140
A=A-1 // 9141
M=D // 9142
@3 // 9143
D=A // 9144
@SP // 9145
AM=M+1 // 9146
A=A-1 // 9147
M=D // 9148
@3 // 9149
D=A // 9150
@SP // 9151
AM=M+1 // 9152
A=A-1 // 9153
M=D // 9154
@3 // 9155
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
@35 // 9173
D=A // 9174
@SP // 9175
AM=M+1 // 9176
A=A-1 // 9177
M=D // 9178
@51 // 9179
D=A // 9180
@SP // 9181
AM=M+1 // 9182
A=A-1 // 9183
M=D // 9184
@63 // 9185
D=A // 9186
@SP // 9187
AM=M+1 // 9188
A=A-1 // 9189
M=D // 9190
@SP // 9191
AM=M+1 // 9192
A=A-1 // 9193
M=0 // 9194
@SP // 9195
AM=M+1 // 9196
A=A-1 // 9197
M=0 // 9198
// call Output.create
@17 // 9199
D=A // 9200
@14 // 9201
M=D // 9202
@Output.create // 9203
D=A // 9204
@13 // 9205
M=D // 9206
@Output.init.ret.46 // 9207
D=A // 9208
@CALL // 9209
0;JMP // 9210
(Output.init.ret.46)
@SP // 9211
M=M-1 // 9212

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 77"), PushInstruction("constant 33"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@77 // 9213
D=A // 9214
@SP // 9215
AM=M+1 // 9216
A=A-1 // 9217
M=D // 9218
@33 // 9219
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
@63 // 9237
D=A // 9238
@SP // 9239
AM=M+1 // 9240
A=A-1 // 9241
M=D // 9242
@51 // 9243
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
@51 // 9255
D=A // 9256
@SP // 9257
AM=M+1 // 9258
A=A-1 // 9259
M=D // 9260
@51 // 9261
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
@SP // 9273
AM=M+1 // 9274
A=A-1 // 9275
M=0 // 9276
@SP // 9277
AM=M+1 // 9278
A=A-1 // 9279
M=0 // 9280
// call Output.create
@17 // 9281
D=A // 9282
@14 // 9283
M=D // 9284
@Output.create // 9285
D=A // 9286
@13 // 9287
M=D // 9288
@Output.init.ret.47 // 9289
D=A // 9290
@CALL // 9291
0;JMP // 9292
(Output.init.ret.47)
@SP // 9293
M=M-1 // 9294

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 78"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 55"), PushInstruction("constant 55"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 59"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@78 // 9295
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
@55 // 9313
D=A // 9314
@SP // 9315
AM=M+1 // 9316
A=A-1 // 9317
M=D // 9318
@55 // 9319
D=A // 9320
@SP // 9321
AM=M+1 // 9322
A=A-1 // 9323
M=D // 9324
@63 // 9325
D=A // 9326
@SP // 9327
AM=M+1 // 9328
A=A-1 // 9329
M=D // 9330
@59 // 9331
D=A // 9332
@SP // 9333
AM=M+1 // 9334
A=A-1 // 9335
M=D // 9336
@59 // 9337
D=A // 9338
@SP // 9339
AM=M+1 // 9340
A=A-1 // 9341
M=D // 9342
@51 // 9343
D=A // 9344
@SP // 9345
AM=M+1 // 9346
A=A-1 // 9347
M=D // 9348
@51 // 9349
D=A // 9350
@SP // 9351
AM=M+1 // 9352
A=A-1 // 9353
M=D // 9354
@SP // 9355
AM=M+1 // 9356
A=A-1 // 9357
M=0 // 9358
@SP // 9359
AM=M+1 // 9360
A=A-1 // 9361
M=0 // 9362
// call Output.create
@17 // 9363
D=A // 9364
@14 // 9365
M=D // 9366
@Output.create // 9367
D=A // 9368
@13 // 9369
M=D // 9370
@Output.init.ret.48 // 9371
D=A // 9372
@CALL // 9373
0;JMP // 9374
(Output.init.ret.48)
@SP // 9375
M=M-1 // 9376

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 79"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@79 // 9377
D=A // 9378
@SP // 9379
AM=M+1 // 9380
A=A-1 // 9381
M=D // 9382
@30 // 9383
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
@51 // 9401
D=A // 9402
@SP // 9403
AM=M+1 // 9404
A=A-1 // 9405
M=D // 9406
@51 // 9407
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
@30 // 9431
D=A // 9432
@SP // 9433
AM=M+1 // 9434
A=A-1 // 9435
M=D // 9436
@SP // 9437
AM=M+1 // 9438
A=A-1 // 9439
M=0 // 9440
@SP // 9441
AM=M+1 // 9442
A=A-1 // 9443
M=0 // 9444
// call Output.create
@17 // 9445
D=A // 9446
@14 // 9447
M=D // 9448
@Output.create // 9449
D=A // 9450
@13 // 9451
M=D // 9452
@Output.init.ret.49 // 9453
D=A // 9454
@CALL // 9455
0;JMP // 9456
(Output.init.ret.49)
@SP // 9457
M=M-1 // 9458

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 80"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@80 // 9459
D=A // 9460
@SP // 9461
AM=M+1 // 9462
A=A-1 // 9463
M=D // 9464
@31 // 9465
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
@51 // 9477
D=A // 9478
@SP // 9479
AM=M+1 // 9480
A=A-1 // 9481
M=D // 9482
@51 // 9483
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
@3 // 9495
D=A // 9496
@SP // 9497
AM=M+1 // 9498
A=A-1 // 9499
M=D // 9500
@3 // 9501
D=A // 9502
@SP // 9503
AM=M+1 // 9504
A=A-1 // 9505
M=D // 9506
@3 // 9507
D=A // 9508
@SP // 9509
AM=M+1 // 9510
A=A-1 // 9511
M=D // 9512
@3 // 9513
D=A // 9514
@SP // 9515
AM=M+1 // 9516
A=A-1 // 9517
M=D // 9518
@SP // 9519
AM=M+1 // 9520
A=A-1 // 9521
M=0 // 9522
@SP // 9523
AM=M+1 // 9524
A=A-1 // 9525
M=0 // 9526
// call Output.create
@17 // 9527
D=A // 9528
@14 // 9529
M=D // 9530
@Output.create // 9531
D=A // 9532
@13 // 9533
M=D // 9534
@Output.init.ret.50 // 9535
D=A // 9536
@CALL // 9537
0;JMP // 9538
(Output.init.ret.50)
@SP // 9539
M=M-1 // 9540

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 81"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 59"), PushInstruction("constant 30"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@81 // 9541
D=A // 9542
@SP // 9543
AM=M+1 // 9544
A=A-1 // 9545
M=D // 9546
@30 // 9547
D=A // 9548
@SP // 9549
AM=M+1 // 9550
A=A-1 // 9551
M=D // 9552
@51 // 9553
D=A // 9554
@SP // 9555
AM=M+1 // 9556
A=A-1 // 9557
M=D // 9558
@51 // 9559
D=A // 9560
@SP // 9561
AM=M+1 // 9562
A=A-1 // 9563
M=D // 9564
@51 // 9565
D=A // 9566
@SP // 9567
AM=M+1 // 9568
A=A-1 // 9569
M=D // 9570
@51 // 9571
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
@63 // 9583
D=A // 9584
@SP // 9585
AM=M+1 // 9586
A=A-1 // 9587
M=D // 9588
@59 // 9589
D=A // 9590
@SP // 9591
AM=M+1 // 9592
A=A-1 // 9593
M=D // 9594
@30 // 9595
D=A // 9596
@SP // 9597
AM=M+1 // 9598
A=A-1 // 9599
M=D // 9600
@48 // 9601
D=A // 9602
@SP // 9603
AM=M+1 // 9604
A=A-1 // 9605
M=D // 9606
@SP // 9607
AM=M+1 // 9608
A=A-1 // 9609
M=0 // 9610
// call Output.create
@17 // 9611
D=A // 9612
@14 // 9613
M=D // 9614
@Output.create // 9615
D=A // 9616
@13 // 9617
M=D // 9618
@Output.init.ret.51 // 9619
D=A // 9620
@CALL // 9621
0;JMP // 9622
(Output.init.ret.51)
@SP // 9623
M=M-1 // 9624

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 82"), PushInstruction("constant 31"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@82 // 9625
D=A // 9626
@SP // 9627
AM=M+1 // 9628
A=A-1 // 9629
M=D // 9630
@31 // 9631
D=A // 9632
@SP // 9633
AM=M+1 // 9634
A=A-1 // 9635
M=D // 9636
@51 // 9637
D=A // 9638
@SP // 9639
AM=M+1 // 9640
A=A-1 // 9641
M=D // 9642
@51 // 9643
D=A // 9644
@SP // 9645
AM=M+1 // 9646
A=A-1 // 9647
M=D // 9648
@51 // 9649
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
@27 // 9661
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
@51 // 9679
D=A // 9680
@SP // 9681
AM=M+1 // 9682
A=A-1 // 9683
M=D // 9684
@SP // 9685
AM=M+1 // 9686
A=A-1 // 9687
M=0 // 9688
@SP // 9689
AM=M+1 // 9690
A=A-1 // 9691
M=0 // 9692
// call Output.create
@17 // 9693
D=A // 9694
@14 // 9695
M=D // 9696
@Output.create // 9697
D=A // 9698
@13 // 9699
M=D // 9700
@Output.init.ret.52 // 9701
D=A // 9702
@CALL // 9703
0;JMP // 9704
(Output.init.ret.52)
@SP // 9705
M=M-1 // 9706

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 83"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 28"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@83 // 9707
D=A // 9708
@SP // 9709
AM=M+1 // 9710
A=A-1 // 9711
M=D // 9712
@30 // 9713
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
@6 // 9731
D=A // 9732
@SP // 9733
AM=M+1 // 9734
A=A-1 // 9735
M=D // 9736
@28 // 9737
D=A // 9738
@SP // 9739
AM=M+1 // 9740
A=A-1 // 9741
M=D // 9742
@48 // 9743
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
@51 // 9755
D=A // 9756
@SP // 9757
AM=M+1 // 9758
A=A-1 // 9759
M=D // 9760
@30 // 9761
D=A // 9762
@SP // 9763
AM=M+1 // 9764
A=A-1 // 9765
M=D // 9766
@SP // 9767
AM=M+1 // 9768
A=A-1 // 9769
M=0 // 9770
@SP // 9771
AM=M+1 // 9772
A=A-1 // 9773
M=0 // 9774
// call Output.create
@17 // 9775
D=A // 9776
@14 // 9777
M=D // 9778
@Output.create // 9779
D=A // 9780
@13 // 9781
M=D // 9782
@Output.init.ret.53 // 9783
D=A // 9784
@CALL // 9785
0;JMP // 9786
(Output.init.ret.53)
@SP // 9787
M=M-1 // 9788

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 84"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 45"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@84 // 9789
D=A // 9790
@SP // 9791
AM=M+1 // 9792
A=A-1 // 9793
M=D // 9794
@63 // 9795
D=A // 9796
@SP // 9797
AM=M+1 // 9798
A=A-1 // 9799
M=D // 9800
@63 // 9801
D=A // 9802
@SP // 9803
AM=M+1 // 9804
A=A-1 // 9805
M=D // 9806
@45 // 9807
D=A // 9808
@SP // 9809
AM=M+1 // 9810
A=A-1 // 9811
M=D // 9812
@12 // 9813
D=A // 9814
@SP // 9815
AM=M+1 // 9816
A=A-1 // 9817
M=D // 9818
@12 // 9819
D=A // 9820
@SP // 9821
AM=M+1 // 9822
A=A-1 // 9823
M=D // 9824
@12 // 9825
D=A // 9826
@SP // 9827
AM=M+1 // 9828
A=A-1 // 9829
M=D // 9830
@12 // 9831
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
@30 // 9843
D=A // 9844
@SP // 9845
AM=M+1 // 9846
A=A-1 // 9847
M=D // 9848
@SP // 9849
AM=M+1 // 9850
A=A-1 // 9851
M=0 // 9852
@SP // 9853
AM=M+1 // 9854
A=A-1 // 9855
M=0 // 9856
// call Output.create
@17 // 9857
D=A // 9858
@14 // 9859
M=D // 9860
@Output.create // 9861
D=A // 9862
@13 // 9863
M=D // 9864
@Output.init.ret.54 // 9865
D=A // 9866
@CALL // 9867
0;JMP // 9868
(Output.init.ret.54)
@SP // 9869
M=M-1 // 9870

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 85"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@85 // 9871
D=A // 9872
@SP // 9873
AM=M+1 // 9874
A=A-1 // 9875
M=D // 9876
@51 // 9877
D=A // 9878
@SP // 9879
AM=M+1 // 9880
A=A-1 // 9881
M=D // 9882
@51 // 9883
D=A // 9884
@SP // 9885
AM=M+1 // 9886
A=A-1 // 9887
M=D // 9888
@51 // 9889
D=A // 9890
@SP // 9891
AM=M+1 // 9892
A=A-1 // 9893
M=D // 9894
@51 // 9895
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
@30 // 9925
D=A // 9926
@SP // 9927
AM=M+1 // 9928
A=A-1 // 9929
M=D // 9930
@SP // 9931
AM=M+1 // 9932
A=A-1 // 9933
M=0 // 9934
@SP // 9935
AM=M+1 // 9936
A=A-1 // 9937
M=0 // 9938
// call Output.create
@17 // 9939
D=A // 9940
@14 // 9941
M=D // 9942
@Output.create // 9943
D=A // 9944
@13 // 9945
M=D // 9946
@Output.init.ret.55 // 9947
D=A // 9948
@CALL // 9949
0;JMP // 9950
(Output.init.ret.55)
@SP // 9951
M=M-1 // 9952

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 86"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@86 // 9953
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
@51 // 9971
D=A // 9972
@SP // 9973
AM=M+1 // 9974
A=A-1 // 9975
M=D // 9976
@51 // 9977
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
@30 // 9989
D=A // 9990
@SP // 9991
AM=M+1 // 9992
A=A-1 // 9993
M=D // 9994
@30 // 9995
D=A // 9996
@SP // 9997
AM=M+1 // 9998
A=A-1 // 9999
M=D // 10000
@12 // 10001
D=A // 10002
@SP // 10003
AM=M+1 // 10004
A=A-1 // 10005
M=D // 10006
@12 // 10007
D=A // 10008
@SP // 10009
AM=M+1 // 10010
A=A-1 // 10011
M=D // 10012
@SP // 10013
AM=M+1 // 10014
A=A-1 // 10015
M=0 // 10016
@SP // 10017
AM=M+1 // 10018
A=A-1 // 10019
M=0 // 10020
// call Output.create
@17 // 10021
D=A // 10022
@14 // 10023
M=D // 10024
@Output.create // 10025
D=A // 10026
@13 // 10027
M=D // 10028
@Output.init.ret.56 // 10029
D=A // 10030
@CALL // 10031
0;JMP // 10032
(Output.init.ret.56)
@SP // 10033
M=M-1 // 10034

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 87"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@87 // 10035
D=A // 10036
@SP // 10037
AM=M+1 // 10038
A=A-1 // 10039
M=D // 10040
@51 // 10041
D=A // 10042
@SP // 10043
AM=M+1 // 10044
A=A-1 // 10045
M=D // 10046
@51 // 10047
D=A // 10048
@SP // 10049
AM=M+1 // 10050
A=A-1 // 10051
M=D // 10052
@51 // 10053
D=A // 10054
@SP // 10055
AM=M+1 // 10056
A=A-1 // 10057
M=D // 10058
@51 // 10059
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
@63 // 10071
D=A // 10072
@SP // 10073
AM=M+1 // 10074
A=A-1 // 10075
M=D // 10076
@63 // 10077
D=A // 10078
@SP // 10079
AM=M+1 // 10080
A=A-1 // 10081
M=D // 10082
@63 // 10083
D=A // 10084
@SP // 10085
AM=M+1 // 10086
A=A-1 // 10087
M=D // 10088
@18 // 10089
D=A // 10090
@SP // 10091
AM=M+1 // 10092
A=A-1 // 10093
M=D // 10094
@SP // 10095
AM=M+1 // 10096
A=A-1 // 10097
M=0 // 10098
@SP // 10099
AM=M+1 // 10100
A=A-1 // 10101
M=0 // 10102
// call Output.create
@17 // 10103
D=A // 10104
@14 // 10105
M=D // 10106
@Output.create // 10107
D=A // 10108
@13 // 10109
M=D // 10110
@Output.init.ret.57 // 10111
D=A // 10112
@CALL // 10113
0;JMP // 10114
(Output.init.ret.57)
@SP // 10115
M=M-1 // 10116

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 88"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@88 // 10117
D=A // 10118
@SP // 10119
AM=M+1 // 10120
A=A-1 // 10121
M=D // 10122
@51 // 10123
D=A // 10124
@SP // 10125
AM=M+1 // 10126
A=A-1 // 10127
M=D // 10128
@51 // 10129
D=A // 10130
@SP // 10131
AM=M+1 // 10132
A=A-1 // 10133
M=D // 10134
@30 // 10135
D=A // 10136
@SP // 10137
AM=M+1 // 10138
A=A-1 // 10139
M=D // 10140
@30 // 10141
D=A // 10142
@SP // 10143
AM=M+1 // 10144
A=A-1 // 10145
M=D // 10146
@12 // 10147
D=A // 10148
@SP // 10149
AM=M+1 // 10150
A=A-1 // 10151
M=D // 10152
@30 // 10153
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
@51 // 10165
D=A // 10166
@SP // 10167
AM=M+1 // 10168
A=A-1 // 10169
M=D // 10170
@51 // 10171
D=A // 10172
@SP // 10173
AM=M+1 // 10174
A=A-1 // 10175
M=D // 10176
@SP // 10177
AM=M+1 // 10178
A=A-1 // 10179
M=0 // 10180
@SP // 10181
AM=M+1 // 10182
A=A-1 // 10183
M=0 // 10184
// call Output.create
@17 // 10185
D=A // 10186
@14 // 10187
M=D // 10188
@Output.create // 10189
D=A // 10190
@13 // 10191
M=D // 10192
@Output.init.ret.58 // 10193
D=A // 10194
@CALL // 10195
0;JMP // 10196
(Output.init.ret.58)
@SP // 10197
M=M-1 // 10198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 89"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@89 // 10199
D=A // 10200
@SP // 10201
AM=M+1 // 10202
A=A-1 // 10203
M=D // 10204
@51 // 10205
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
@51 // 10223
D=A // 10224
@SP // 10225
AM=M+1 // 10226
A=A-1 // 10227
M=D // 10228
@30 // 10229
D=A // 10230
@SP // 10231
AM=M+1 // 10232
A=A-1 // 10233
M=D // 10234
@12 // 10235
D=A // 10236
@SP // 10237
AM=M+1 // 10238
A=A-1 // 10239
M=D // 10240
@12 // 10241
D=A // 10242
@SP // 10243
AM=M+1 // 10244
A=A-1 // 10245
M=D // 10246
@12 // 10247
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
@SP // 10259
AM=M+1 // 10260
A=A-1 // 10261
M=0 // 10262
@SP // 10263
AM=M+1 // 10264
A=A-1 // 10265
M=0 // 10266
// call Output.create
@17 // 10267
D=A // 10268
@14 // 10269
M=D // 10270
@Output.create // 10271
D=A // 10272
@13 // 10273
M=D // 10274
@Output.init.ret.59 // 10275
D=A // 10276
@CALL // 10277
0;JMP // 10278
(Output.init.ret.59)
@SP // 10279
M=M-1 // 10280

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 90"), PushInstruction("constant 63"), PushInstruction("constant 51"), PushInstruction("constant 49"), PushInstruction("constant 24"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 35"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@90 // 10281
D=A // 10282
@SP // 10283
AM=M+1 // 10284
A=A-1 // 10285
M=D // 10286
@63 // 10287
D=A // 10288
@SP // 10289
AM=M+1 // 10290
A=A-1 // 10291
M=D // 10292
@51 // 10293
D=A // 10294
@SP // 10295
AM=M+1 // 10296
A=A-1 // 10297
M=D // 10298
@49 // 10299
D=A // 10300
@SP // 10301
AM=M+1 // 10302
A=A-1 // 10303
M=D // 10304
@24 // 10305
D=A // 10306
@SP // 10307
AM=M+1 // 10308
A=A-1 // 10309
M=D // 10310
@12 // 10311
D=A // 10312
@SP // 10313
AM=M+1 // 10314
A=A-1 // 10315
M=D // 10316
@6 // 10317
D=A // 10318
@SP // 10319
AM=M+1 // 10320
A=A-1 // 10321
M=D // 10322
@35 // 10323
D=A // 10324
@SP // 10325
AM=M+1 // 10326
A=A-1 // 10327
M=D // 10328
@51 // 10329
D=A // 10330
@SP // 10331
AM=M+1 // 10332
A=A-1 // 10333
M=D // 10334
@63 // 10335
D=A // 10336
@SP // 10337
AM=M+1 // 10338
A=A-1 // 10339
M=D // 10340
@SP // 10341
AM=M+1 // 10342
A=A-1 // 10343
M=0 // 10344
@SP // 10345
AM=M+1 // 10346
A=A-1 // 10347
M=0 // 10348
// call Output.create
@17 // 10349
D=A // 10350
@14 // 10351
M=D // 10352
@Output.create // 10353
D=A // 10354
@13 // 10355
M=D // 10356
@Output.init.ret.60 // 10357
D=A // 10358
@CALL // 10359
0;JMP // 10360
(Output.init.ret.60)
@SP // 10361
M=M-1 // 10362

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 91"), PushInstruction("constant 30"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@91 // 10363
D=A // 10364
@SP // 10365
AM=M+1 // 10366
A=A-1 // 10367
M=D // 10368
@30 // 10369
D=A // 10370
@SP // 10371
AM=M+1 // 10372
A=A-1 // 10373
M=D // 10374
@6 // 10375
D=A // 10376
@SP // 10377
AM=M+1 // 10378
A=A-1 // 10379
M=D // 10380
@6 // 10381
D=A // 10382
@SP // 10383
AM=M+1 // 10384
A=A-1 // 10385
M=D // 10386
@6 // 10387
D=A // 10388
@SP // 10389
AM=M+1 // 10390
A=A-1 // 10391
M=D // 10392
@6 // 10393
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
@30 // 10417
D=A // 10418
@SP // 10419
AM=M+1 // 10420
A=A-1 // 10421
M=D // 10422
@SP // 10423
AM=M+1 // 10424
A=A-1 // 10425
M=0 // 10426
@SP // 10427
AM=M+1 // 10428
A=A-1 // 10429
M=0 // 10430
// call Output.create
@17 // 10431
D=A // 10432
@14 // 10433
M=D // 10434
@Output.create // 10435
D=A // 10436
@13 // 10437
M=D // 10438
@Output.init.ret.61 // 10439
D=A // 10440
@CALL // 10441
0;JMP // 10442
(Output.init.ret.61)
@SP // 10443
M=M-1 // 10444

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 92"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 1"), PushInstruction("constant 3"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 48"), PushInstruction("constant 32"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10445
D=A // 10446
@SP // 10447
M=D+M // 10448
@92 // 10449
D=A // 10450
@SP // 10451
A=M-1 // 10452
M=1 // 10453
A=A-1 // 10454
M=0 // 10455
A=A-1 // 10456
M=0 // 10457
A=A-1 // 10458
M=D // 10459
A=A-1 // 10460
@3 // 10461
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
@12 // 10473
D=A // 10474
@SP // 10475
AM=M+1 // 10476
A=A-1 // 10477
M=D // 10478
@24 // 10479
D=A // 10480
@SP // 10481
AM=M+1 // 10482
A=A-1 // 10483
M=D // 10484
@48 // 10485
D=A // 10486
@SP // 10487
AM=M+1 // 10488
A=A-1 // 10489
M=D // 10490
@32 // 10491
D=A // 10492
@SP // 10493
AM=M+1 // 10494
A=A-1 // 10495
M=D // 10496
@SP // 10497
AM=M+1 // 10498
A=A-1 // 10499
M=0 // 10500
@SP // 10501
AM=M+1 // 10502
A=A-1 // 10503
M=0 // 10504
// call Output.create
@17 // 10505
D=A // 10506
@14 // 10507
M=D // 10508
@Output.create // 10509
D=A // 10510
@13 // 10511
M=D // 10512
@Output.init.ret.62 // 10513
D=A // 10514
@CALL // 10515
0;JMP // 10516
(Output.init.ret.62)
@SP // 10517
M=M-1 // 10518

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 93"), PushInstruction("constant 30"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@93 // 10519
D=A // 10520
@SP // 10521
AM=M+1 // 10522
A=A-1 // 10523
M=D // 10524
@30 // 10525
D=A // 10526
@SP // 10527
AM=M+1 // 10528
A=A-1 // 10529
M=D // 10530
@24 // 10531
D=A // 10532
@SP // 10533
AM=M+1 // 10534
A=A-1 // 10535
M=D // 10536
@24 // 10537
D=A // 10538
@SP // 10539
AM=M+1 // 10540
A=A-1 // 10541
M=D // 10542
@24 // 10543
D=A // 10544
@SP // 10545
AM=M+1 // 10546
A=A-1 // 10547
M=D // 10548
@24 // 10549
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
@30 // 10573
D=A // 10574
@SP // 10575
AM=M+1 // 10576
A=A-1 // 10577
M=D // 10578
@SP // 10579
AM=M+1 // 10580
A=A-1 // 10581
M=0 // 10582
@SP // 10583
AM=M+1 // 10584
A=A-1 // 10585
M=0 // 10586
// call Output.create
@17 // 10587
D=A // 10588
@14 // 10589
M=D // 10590
@Output.create // 10591
D=A // 10592
@13 // 10593
M=D // 10594
@Output.init.ret.63 // 10595
D=A // 10596
@CALL // 10597
0;JMP // 10598
(Output.init.ret.63)
@SP // 10599
M=M-1 // 10600

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 94"), PushInstruction("constant 8"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@94 // 10601
D=A // 10602
@SP // 10603
AM=M+1 // 10604
A=A-1 // 10605
M=D // 10606
@8 // 10607
D=A // 10608
@SP // 10609
AM=M+1 // 10610
A=A-1 // 10611
M=D // 10612
@28 // 10613
D=A // 10614
@SP // 10615
AM=M+1 // 10616
A=A-1 // 10617
M=D // 10618
@54 // 10619
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
@SP // 10633
AM=M+1 // 10634
A=A-1 // 10635
M=0 // 10636
@SP // 10637
AM=M+1 // 10638
A=A-1 // 10639
M=0 // 10640
@SP // 10641
AM=M+1 // 10642
A=A-1 // 10643
M=0 // 10644
@SP // 10645
AM=M+1 // 10646
A=A-1 // 10647
M=0 // 10648
@SP // 10649
AM=M+1 // 10650
A=A-1 // 10651
M=0 // 10652
@SP // 10653
AM=M+1 // 10654
A=A-1 // 10655
M=0 // 10656
// call Output.create
@17 // 10657
D=A // 10658
@14 // 10659
M=D // 10660
@Output.create // 10661
D=A // 10662
@13 // 10663
M=D // 10664
@Output.init.ret.64 // 10665
D=A // 10666
@CALL // 10667
0;JMP // 10668
(Output.init.ret.64)
@SP // 10669
M=M-1 // 10670

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 95"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@10 // 10671
D=A // 10672
@SP // 10673
M=D+M // 10674
@95 // 10675
D=A // 10676
@SP // 10677
A=M-1 // 10678
M=0 // 10679
A=A-1 // 10680
M=0 // 10681
A=A-1 // 10682
M=0 // 10683
A=A-1 // 10684
M=0 // 10685
A=A-1 // 10686
M=0 // 10687
A=A-1 // 10688
M=0 // 10689
A=A-1 // 10690
M=0 // 10691
A=A-1 // 10692
M=0 // 10693
A=A-1 // 10694
M=0 // 10695
A=A-1 // 10696
M=D // 10697
A=A-1 // 10698
@2 // 10699
D=A // 10700
@SP // 10701
M=D+M // 10702
@63 // 10703
D=A // 10704
@SP // 10705
A=M-1 // 10706
M=0 // 10707
A=A-1 // 10708
M=D // 10709
A=A-1 // 10710
// call Output.create
@17 // 10711
D=A // 10712
@14 // 10713
M=D // 10714
@Output.create // 10715
D=A // 10716
@13 // 10717
M=D // 10718
@Output.init.ret.65 // 10719
D=A // 10720
@CALL // 10721
0;JMP // 10722
(Output.init.ret.65)
@SP // 10723
M=M-1 // 10724

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 96"), PushInstruction("constant 6"), PushInstruction("constant 12"), PushInstruction("constant 24"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@96 // 10725
D=A // 10726
@SP // 10727
AM=M+1 // 10728
A=A-1 // 10729
M=D // 10730
@6 // 10731
D=A // 10732
@SP // 10733
AM=M+1 // 10734
A=A-1 // 10735
M=D // 10736
@12 // 10737
D=A // 10738
@SP // 10739
AM=M+1 // 10740
A=A-1 // 10741
M=D // 10742
@24 // 10743
D=A // 10744
@SP // 10745
AM=M+1 // 10746
A=A-1 // 10747
M=D // 10748
@SP // 10749
AM=M+1 // 10750
A=A-1 // 10751
M=0 // 10752
@SP // 10753
AM=M+1 // 10754
A=A-1 // 10755
M=0 // 10756
@SP // 10757
AM=M+1 // 10758
A=A-1 // 10759
M=0 // 10760
@SP // 10761
AM=M+1 // 10762
A=A-1 // 10763
M=0 // 10764
@SP // 10765
AM=M+1 // 10766
A=A-1 // 10767
M=0 // 10768
@SP // 10769
AM=M+1 // 10770
A=A-1 // 10771
M=0 // 10772
@SP // 10773
AM=M+1 // 10774
A=A-1 // 10775
M=0 // 10776
@SP // 10777
AM=M+1 // 10778
A=A-1 // 10779
M=0 // 10780
// call Output.create
@17 // 10781
D=A // 10782
@14 // 10783
M=D // 10784
@Output.create // 10785
D=A // 10786
@13 // 10787
M=D // 10788
@Output.init.ret.66 // 10789
D=A // 10790
@CALL // 10791
0;JMP // 10792
(Output.init.ret.66)
@SP // 10793
M=M-1 // 10794

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 97"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 24"), PushInstruction("constant 30"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10795
D=A // 10796
@SP // 10797
M=D+M // 10798
@97 // 10799
D=A // 10800
@SP // 10801
A=M-1 // 10802
M=0 // 10803
A=A-1 // 10804
M=0 // 10805
A=A-1 // 10806
M=0 // 10807
A=A-1 // 10808
M=D // 10809
A=A-1 // 10810
@14 // 10811
D=A // 10812
@SP // 10813
AM=M+1 // 10814
A=A-1 // 10815
M=D // 10816
@24 // 10817
D=A // 10818
@SP // 10819
AM=M+1 // 10820
A=A-1 // 10821
M=D // 10822
@30 // 10823
D=A // 10824
@SP // 10825
AM=M+1 // 10826
A=A-1 // 10827
M=D // 10828
@27 // 10829
D=A // 10830
@SP // 10831
AM=M+1 // 10832
A=A-1 // 10833
M=D // 10834
@27 // 10835
D=A // 10836
@SP // 10837
AM=M+1 // 10838
A=A-1 // 10839
M=D // 10840
@54 // 10841
D=A // 10842
@SP // 10843
AM=M+1 // 10844
A=A-1 // 10845
M=D // 10846
@SP // 10847
AM=M+1 // 10848
A=A-1 // 10849
M=0 // 10850
@SP // 10851
AM=M+1 // 10852
A=A-1 // 10853
M=0 // 10854
// call Output.create
@17 // 10855
D=A // 10856
@14 // 10857
M=D // 10858
@Output.create // 10859
D=A // 10860
@13 // 10861
M=D // 10862
@Output.init.ret.67 // 10863
D=A // 10864
@CALL // 10865
0;JMP // 10866
(Output.init.ret.67)
@SP // 10867
M=M-1 // 10868

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 98"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@98 // 10869
D=A // 10870
@SP // 10871
AM=M+1 // 10872
A=A-1 // 10873
M=D // 10874
@3 // 10875
D=A // 10876
@SP // 10877
AM=M+1 // 10878
A=A-1 // 10879
M=D // 10880
@3 // 10881
D=A // 10882
@SP // 10883
AM=M+1 // 10884
A=A-1 // 10885
M=D // 10886
@3 // 10887
D=A // 10888
@SP // 10889
AM=M+1 // 10890
A=A-1 // 10891
M=D // 10892
@15 // 10893
D=A // 10894
@SP // 10895
AM=M+1 // 10896
A=A-1 // 10897
M=D // 10898
@27 // 10899
D=A // 10900
@SP // 10901
AM=M+1 // 10902
A=A-1 // 10903
M=D // 10904
@51 // 10905
D=A // 10906
@SP // 10907
AM=M+1 // 10908
A=A-1 // 10909
M=D // 10910
@51 // 10911
D=A // 10912
@SP // 10913
AM=M+1 // 10914
A=A-1 // 10915
M=D // 10916
@51 // 10917
D=A // 10918
@SP // 10919
AM=M+1 // 10920
A=A-1 // 10921
M=D // 10922
@30 // 10923
D=A // 10924
@SP // 10925
AM=M+1 // 10926
A=A-1 // 10927
M=D // 10928
@SP // 10929
AM=M+1 // 10930
A=A-1 // 10931
M=0 // 10932
@SP // 10933
AM=M+1 // 10934
A=A-1 // 10935
M=0 // 10936
// call Output.create
@17 // 10937
D=A // 10938
@14 // 10939
M=D // 10940
@Output.create // 10941
D=A // 10942
@13 // 10943
M=D // 10944
@Output.init.ret.68 // 10945
D=A // 10946
@CALL // 10947
0;JMP // 10948
(Output.init.ret.68)
@SP // 10949
M=M-1 // 10950

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 99"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 10951
D=A // 10952
@SP // 10953
M=D+M // 10954
@99 // 10955
D=A // 10956
@SP // 10957
A=M-1 // 10958
M=0 // 10959
A=A-1 // 10960
M=0 // 10961
A=A-1 // 10962
M=0 // 10963
A=A-1 // 10964
M=D // 10965
A=A-1 // 10966
@30 // 10967
D=A // 10968
@SP // 10969
AM=M+1 // 10970
A=A-1 // 10971
M=D // 10972
@51 // 10973
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
@3 // 10985
D=A // 10986
@SP // 10987
AM=M+1 // 10988
A=A-1 // 10989
M=D // 10990
@51 // 10991
D=A // 10992
@SP // 10993
AM=M+1 // 10994
A=A-1 // 10995
M=D // 10996
@30 // 10997
D=A // 10998
@SP // 10999
AM=M+1 // 11000
A=A-1 // 11001
M=D // 11002
@SP // 11003
AM=M+1 // 11004
A=A-1 // 11005
M=0 // 11006
@SP // 11007
AM=M+1 // 11008
A=A-1 // 11009
M=0 // 11010
// call Output.create
@17 // 11011
D=A // 11012
@14 // 11013
M=D // 11014
@Output.create // 11015
D=A // 11016
@13 // 11017
M=D // 11018
@Output.init.ret.69 // 11019
D=A // 11020
@CALL // 11021
0;JMP // 11022
(Output.init.ret.69)
@SP // 11023
M=M-1 // 11024

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 100"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 60"), PushInstruction("constant 54"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@100 // 11025
D=A // 11026
@SP // 11027
AM=M+1 // 11028
A=A-1 // 11029
M=D // 11030
@48 // 11031
D=A // 11032
@SP // 11033
AM=M+1 // 11034
A=A-1 // 11035
M=D // 11036
@48 // 11037
D=A // 11038
@SP // 11039
AM=M+1 // 11040
A=A-1 // 11041
M=D // 11042
@48 // 11043
D=A // 11044
@SP // 11045
AM=M+1 // 11046
A=A-1 // 11047
M=D // 11048
@60 // 11049
D=A // 11050
@SP // 11051
AM=M+1 // 11052
A=A-1 // 11053
M=D // 11054
@54 // 11055
D=A // 11056
@SP // 11057
AM=M+1 // 11058
A=A-1 // 11059
M=D // 11060
@51 // 11061
D=A // 11062
@SP // 11063
AM=M+1 // 11064
A=A-1 // 11065
M=D // 11066
@51 // 11067
D=A // 11068
@SP // 11069
AM=M+1 // 11070
A=A-1 // 11071
M=D // 11072
@51 // 11073
D=A // 11074
@SP // 11075
AM=M+1 // 11076
A=A-1 // 11077
M=D // 11078
@30 // 11079
D=A // 11080
@SP // 11081
AM=M+1 // 11082
A=A-1 // 11083
M=D // 11084
@SP // 11085
AM=M+1 // 11086
A=A-1 // 11087
M=0 // 11088
@SP // 11089
AM=M+1 // 11090
A=A-1 // 11091
M=0 // 11092
// call Output.create
@17 // 11093
D=A // 11094
@14 // 11095
M=D // 11096
@Output.create // 11097
D=A // 11098
@13 // 11099
M=D // 11100
@Output.init.ret.70 // 11101
D=A // 11102
@CALL // 11103
0;JMP // 11104
(Output.init.ret.70)
@SP // 11105
M=M-1 // 11106

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 101"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11107
D=A // 11108
@SP // 11109
M=D+M // 11110
@101 // 11111
D=A // 11112
@SP // 11113
A=M-1 // 11114
M=0 // 11115
A=A-1 // 11116
M=0 // 11117
A=A-1 // 11118
M=0 // 11119
A=A-1 // 11120
M=D // 11121
A=A-1 // 11122
@30 // 11123
D=A // 11124
@SP // 11125
AM=M+1 // 11126
A=A-1 // 11127
M=D // 11128
@51 // 11129
D=A // 11130
@SP // 11131
AM=M+1 // 11132
A=A-1 // 11133
M=D // 11134
@63 // 11135
D=A // 11136
@SP // 11137
AM=M+1 // 11138
A=A-1 // 11139
M=D // 11140
@3 // 11141
D=A // 11142
@SP // 11143
AM=M+1 // 11144
A=A-1 // 11145
M=D // 11146
@51 // 11147
D=A // 11148
@SP // 11149
AM=M+1 // 11150
A=A-1 // 11151
M=D // 11152
@30 // 11153
D=A // 11154
@SP // 11155
AM=M+1 // 11156
A=A-1 // 11157
M=D // 11158
@SP // 11159
AM=M+1 // 11160
A=A-1 // 11161
M=0 // 11162
@SP // 11163
AM=M+1 // 11164
A=A-1 // 11165
M=0 // 11166
// call Output.create
@17 // 11167
D=A // 11168
@14 // 11169
M=D // 11170
@Output.create // 11171
D=A // 11172
@13 // 11173
M=D // 11174
@Output.init.ret.71 // 11175
D=A // 11176
@CALL // 11177
0;JMP // 11178
(Output.init.ret.71)
@SP // 11179
M=M-1 // 11180

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 102"), PushInstruction("constant 28"), PushInstruction("constant 54"), PushInstruction("constant 38"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@102 // 11181
D=A // 11182
@SP // 11183
AM=M+1 // 11184
A=A-1 // 11185
M=D // 11186
@28 // 11187
D=A // 11188
@SP // 11189
AM=M+1 // 11190
A=A-1 // 11191
M=D // 11192
@54 // 11193
D=A // 11194
@SP // 11195
AM=M+1 // 11196
A=A-1 // 11197
M=D // 11198
@38 // 11199
D=A // 11200
@SP // 11201
AM=M+1 // 11202
A=A-1 // 11203
M=D // 11204
@6 // 11205
D=A // 11206
@SP // 11207
AM=M+1 // 11208
A=A-1 // 11209
M=D // 11210
@15 // 11211
D=A // 11212
@SP // 11213
AM=M+1 // 11214
A=A-1 // 11215
M=D // 11216
@6 // 11217
D=A // 11218
@SP // 11219
AM=M+1 // 11220
A=A-1 // 11221
M=D // 11222
@6 // 11223
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
@SP // 11241
AM=M+1 // 11242
A=A-1 // 11243
M=0 // 11244
@SP // 11245
AM=M+1 // 11246
A=A-1 // 11247
M=0 // 11248
// call Output.create
@17 // 11249
D=A // 11250
@14 // 11251
M=D // 11252
@Output.create // 11253
D=A // 11254
@13 // 11255
M=D // 11256
@Output.init.ret.72 // 11257
D=A // 11258
@CALL // 11259
0;JMP // 11260
(Output.init.ret.72)
@SP // 11261
M=M-1 // 11262

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 103"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@3 // 11263
D=A // 11264
@SP // 11265
M=D+M // 11266
@103 // 11267
D=A // 11268
@SP // 11269
A=M-1 // 11270
M=0 // 11271
A=A-1 // 11272
M=0 // 11273
A=A-1 // 11274
M=D // 11275
A=A-1 // 11276
@30 // 11277
D=A // 11278
@SP // 11279
AM=M+1 // 11280
A=A-1 // 11281
M=D // 11282
@51 // 11283
D=A // 11284
@SP // 11285
AM=M+1 // 11286
A=A-1 // 11287
M=D // 11288
@51 // 11289
D=A // 11290
@SP // 11291
AM=M+1 // 11292
A=A-1 // 11293
M=D // 11294
@51 // 11295
D=A // 11296
@SP // 11297
AM=M+1 // 11298
A=A-1 // 11299
M=D // 11300
@62 // 11301
D=A // 11302
@SP // 11303
AM=M+1 // 11304
A=A-1 // 11305
M=D // 11306
@48 // 11307
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
@30 // 11319
D=A // 11320
@SP // 11321
AM=M+1 // 11322
A=A-1 // 11323
M=D // 11324
@SP // 11325
AM=M+1 // 11326
A=A-1 // 11327
M=0 // 11328
// call Output.create
@17 // 11329
D=A // 11330
@14 // 11331
M=D // 11332
@Output.create // 11333
D=A // 11334
@13 // 11335
M=D // 11336
@Output.init.ret.73 // 11337
D=A // 11338
@CALL // 11339
0;JMP // 11340
(Output.init.ret.73)
@SP // 11341
M=M-1 // 11342

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 104"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 27"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@104 // 11343
D=A // 11344
@SP // 11345
AM=M+1 // 11346
A=A-1 // 11347
M=D // 11348
@3 // 11349
D=A // 11350
@SP // 11351
AM=M+1 // 11352
A=A-1 // 11353
M=D // 11354
@3 // 11355
D=A // 11356
@SP // 11357
AM=M+1 // 11358
A=A-1 // 11359
M=D // 11360
@3 // 11361
D=A // 11362
@SP // 11363
AM=M+1 // 11364
A=A-1 // 11365
M=D // 11366
@27 // 11367
D=A // 11368
@SP // 11369
AM=M+1 // 11370
A=A-1 // 11371
M=D // 11372
@55 // 11373
D=A // 11374
@SP // 11375
AM=M+1 // 11376
A=A-1 // 11377
M=D // 11378
@51 // 11379
D=A // 11380
@SP // 11381
AM=M+1 // 11382
A=A-1 // 11383
M=D // 11384
@51 // 11385
D=A // 11386
@SP // 11387
AM=M+1 // 11388
A=A-1 // 11389
M=D // 11390
@51 // 11391
D=A // 11392
@SP // 11393
AM=M+1 // 11394
A=A-1 // 11395
M=D // 11396
@51 // 11397
D=A // 11398
@SP // 11399
AM=M+1 // 11400
A=A-1 // 11401
M=D // 11402
@SP // 11403
AM=M+1 // 11404
A=A-1 // 11405
M=0 // 11406
@SP // 11407
AM=M+1 // 11408
A=A-1 // 11409
M=0 // 11410
// call Output.create
@17 // 11411
D=A // 11412
@14 // 11413
M=D // 11414
@Output.create // 11415
D=A // 11416
@13 // 11417
M=D // 11418
@Output.init.ret.74 // 11419
D=A // 11420
@CALL // 11421
0;JMP // 11422
(Output.init.ret.74)
@SP // 11423
M=M-1 // 11424

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 105"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@105 // 11425
D=A // 11426
@SP // 11427
AM=M+1 // 11428
A=A-1 // 11429
M=D // 11430
@12 // 11431
D=A // 11432
@SP // 11433
AM=M+1 // 11434
A=A-1 // 11435
M=D // 11436
@12 // 11437
D=A // 11438
@SP // 11439
AM=M+1 // 11440
A=A-1 // 11441
M=D // 11442
@SP // 11443
AM=M+1 // 11444
A=A-1 // 11445
M=0 // 11446
@14 // 11447
D=A // 11448
@SP // 11449
AM=M+1 // 11450
A=A-1 // 11451
M=D // 11452
@12 // 11453
D=A // 11454
@SP // 11455
AM=M+1 // 11456
A=A-1 // 11457
M=D // 11458
@12 // 11459
D=A // 11460
@SP // 11461
AM=M+1 // 11462
A=A-1 // 11463
M=D // 11464
@12 // 11465
D=A // 11466
@SP // 11467
AM=M+1 // 11468
A=A-1 // 11469
M=D // 11470
@12 // 11471
D=A // 11472
@SP // 11473
AM=M+1 // 11474
A=A-1 // 11475
M=D // 11476
@30 // 11477
D=A // 11478
@SP // 11479
AM=M+1 // 11480
A=A-1 // 11481
M=D // 11482
@SP // 11483
AM=M+1 // 11484
A=A-1 // 11485
M=0 // 11486
@SP // 11487
AM=M+1 // 11488
A=A-1 // 11489
M=0 // 11490
// call Output.create
@17 // 11491
D=A // 11492
@14 // 11493
M=D // 11494
@Output.create // 11495
D=A // 11496
@13 // 11497
M=D // 11498
@Output.init.ret.75 // 11499
D=A // 11500
@CALL // 11501
0;JMP // 11502
(Output.init.ret.75)
@SP // 11503
M=M-1 // 11504

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 106"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0"), PushInstruction("constant 56"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@106 // 11505
D=A // 11506
@SP // 11507
AM=M+1 // 11508
A=A-1 // 11509
M=D // 11510
@48 // 11511
D=A // 11512
@SP // 11513
AM=M+1 // 11514
A=A-1 // 11515
M=D // 11516
@48 // 11517
D=A // 11518
@SP // 11519
AM=M+1 // 11520
A=A-1 // 11521
M=D // 11522
@SP // 11523
AM=M+1 // 11524
A=A-1 // 11525
M=0 // 11526
@56 // 11527
D=A // 11528
@SP // 11529
AM=M+1 // 11530
A=A-1 // 11531
M=D // 11532
@48 // 11533
D=A // 11534
@SP // 11535
AM=M+1 // 11536
A=A-1 // 11537
M=D // 11538
@48 // 11539
D=A // 11540
@SP // 11541
AM=M+1 // 11542
A=A-1 // 11543
M=D // 11544
@48 // 11545
D=A // 11546
@SP // 11547
AM=M+1 // 11548
A=A-1 // 11549
M=D // 11550
@48 // 11551
D=A // 11552
@SP // 11553
AM=M+1 // 11554
A=A-1 // 11555
M=D // 11556
@51 // 11557
D=A // 11558
@SP // 11559
AM=M+1 // 11560
A=A-1 // 11561
M=D // 11562
@30 // 11563
D=A // 11564
@SP // 11565
AM=M+1 // 11566
A=A-1 // 11567
M=D // 11568
@SP // 11569
AM=M+1 // 11570
A=A-1 // 11571
M=0 // 11572
// call Output.create
@17 // 11573
D=A // 11574
@14 // 11575
M=D // 11576
@Output.create // 11577
D=A // 11578
@13 // 11579
M=D // 11580
@Output.init.ret.76 // 11581
D=A // 11582
@CALL // 11583
0;JMP // 11584
(Output.init.ret.76)
@SP // 11585
M=M-1 // 11586

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 107"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 51"), PushInstruction("constant 27"), PushInstruction("constant 15"), PushInstruction("constant 15"), PushInstruction("constant 27"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@107 // 11587
D=A // 11588
@SP // 11589
AM=M+1 // 11590
A=A-1 // 11591
M=D // 11592
@3 // 11593
D=A // 11594
@SP // 11595
AM=M+1 // 11596
A=A-1 // 11597
M=D // 11598
@3 // 11599
D=A // 11600
@SP // 11601
AM=M+1 // 11602
A=A-1 // 11603
M=D // 11604
@3 // 11605
D=A // 11606
@SP // 11607
AM=M+1 // 11608
A=A-1 // 11609
M=D // 11610
@51 // 11611
D=A // 11612
@SP // 11613
AM=M+1 // 11614
A=A-1 // 11615
M=D // 11616
@27 // 11617
D=A // 11618
@SP // 11619
AM=M+1 // 11620
A=A-1 // 11621
M=D // 11622
@15 // 11623
D=A // 11624
@SP // 11625
AM=M+1 // 11626
A=A-1 // 11627
M=D // 11628
@15 // 11629
D=A // 11630
@SP // 11631
AM=M+1 // 11632
A=A-1 // 11633
M=D // 11634
@27 // 11635
D=A // 11636
@SP // 11637
AM=M+1 // 11638
A=A-1 // 11639
M=D // 11640
@51 // 11641
D=A // 11642
@SP // 11643
AM=M+1 // 11644
A=A-1 // 11645
M=D // 11646
@SP // 11647
AM=M+1 // 11648
A=A-1 // 11649
M=0 // 11650
@SP // 11651
AM=M+1 // 11652
A=A-1 // 11653
M=0 // 11654
// call Output.create
@17 // 11655
D=A // 11656
@14 // 11657
M=D // 11658
@Output.create // 11659
D=A // 11660
@13 // 11661
M=D // 11662
@Output.init.ret.77 // 11663
D=A // 11664
@CALL // 11665
0;JMP // 11666
(Output.init.ret.77)
@SP // 11667
M=M-1 // 11668

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 108"), PushInstruction("constant 14"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@108 // 11669
D=A // 11670
@SP // 11671
AM=M+1 // 11672
A=A-1 // 11673
M=D // 11674
@14 // 11675
D=A // 11676
@SP // 11677
AM=M+1 // 11678
A=A-1 // 11679
M=D // 11680
@12 // 11681
D=A // 11682
@SP // 11683
AM=M+1 // 11684
A=A-1 // 11685
M=D // 11686
@12 // 11687
D=A // 11688
@SP // 11689
AM=M+1 // 11690
A=A-1 // 11691
M=D // 11692
@12 // 11693
D=A // 11694
@SP // 11695
AM=M+1 // 11696
A=A-1 // 11697
M=D // 11698
@12 // 11699
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
@30 // 11723
D=A // 11724
@SP // 11725
AM=M+1 // 11726
A=A-1 // 11727
M=D // 11728
@SP // 11729
AM=M+1 // 11730
A=A-1 // 11731
M=0 // 11732
@SP // 11733
AM=M+1 // 11734
A=A-1 // 11735
M=0 // 11736
// call Output.create
@17 // 11737
D=A // 11738
@14 // 11739
M=D // 11740
@Output.create // 11741
D=A // 11742
@13 // 11743
M=D // 11744
@Output.init.ret.78 // 11745
D=A // 11746
@CALL // 11747
0;JMP // 11748
(Output.init.ret.78)
@SP // 11749
M=M-1 // 11750

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 109"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 63"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 43"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11751
D=A // 11752
@SP // 11753
M=D+M // 11754
@109 // 11755
D=A // 11756
@SP // 11757
A=M-1 // 11758
M=0 // 11759
A=A-1 // 11760
M=0 // 11761
A=A-1 // 11762
M=0 // 11763
A=A-1 // 11764
M=D // 11765
A=A-1 // 11766
@29 // 11767
D=A // 11768
@SP // 11769
AM=M+1 // 11770
A=A-1 // 11771
M=D // 11772
@63 // 11773
D=A // 11774
@SP // 11775
AM=M+1 // 11776
A=A-1 // 11777
M=D // 11778
@43 // 11779
D=A // 11780
@SP // 11781
AM=M+1 // 11782
A=A-1 // 11783
M=D // 11784
@43 // 11785
D=A // 11786
@SP // 11787
AM=M+1 // 11788
A=A-1 // 11789
M=D // 11790
@43 // 11791
D=A // 11792
@SP // 11793
AM=M+1 // 11794
A=A-1 // 11795
M=D // 11796
@43 // 11797
D=A // 11798
@SP // 11799
AM=M+1 // 11800
A=A-1 // 11801
M=D // 11802
@SP // 11803
AM=M+1 // 11804
A=A-1 // 11805
M=0 // 11806
@SP // 11807
AM=M+1 // 11808
A=A-1 // 11809
M=0 // 11810
// call Output.create
@17 // 11811
D=A // 11812
@14 // 11813
M=D // 11814
@Output.create // 11815
D=A // 11816
@13 // 11817
M=D // 11818
@Output.init.ret.79 // 11819
D=A // 11820
@CALL // 11821
0;JMP // 11822
(Output.init.ret.79)
@SP // 11823
M=M-1 // 11824

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 110"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11825
D=A // 11826
@SP // 11827
M=D+M // 11828
@110 // 11829
D=A // 11830
@SP // 11831
A=M-1 // 11832
M=0 // 11833
A=A-1 // 11834
M=0 // 11835
A=A-1 // 11836
M=0 // 11837
A=A-1 // 11838
M=D // 11839
A=A-1 // 11840
@29 // 11841
D=A // 11842
@SP // 11843
AM=M+1 // 11844
A=A-1 // 11845
M=D // 11846
@51 // 11847
D=A // 11848
@SP // 11849
AM=M+1 // 11850
A=A-1 // 11851
M=D // 11852
@51 // 11853
D=A // 11854
@SP // 11855
AM=M+1 // 11856
A=A-1 // 11857
M=D // 11858
@51 // 11859
D=A // 11860
@SP // 11861
AM=M+1 // 11862
A=A-1 // 11863
M=D // 11864
@51 // 11865
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
@SP // 11877
AM=M+1 // 11878
A=A-1 // 11879
M=0 // 11880
@SP // 11881
AM=M+1 // 11882
A=A-1 // 11883
M=0 // 11884
// call Output.create
@17 // 11885
D=A // 11886
@14 // 11887
M=D // 11888
@Output.create // 11889
D=A // 11890
@13 // 11891
M=D // 11892
@Output.init.ret.80 // 11893
D=A // 11894
@CALL // 11895
0;JMP // 11896
(Output.init.ret.80)
@SP // 11897
M=M-1 // 11898

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 111"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11899
D=A // 11900
@SP // 11901
M=D+M // 11902
@111 // 11903
D=A // 11904
@SP // 11905
A=M-1 // 11906
M=0 // 11907
A=A-1 // 11908
M=0 // 11909
A=A-1 // 11910
M=0 // 11911
A=A-1 // 11912
M=D // 11913
A=A-1 // 11914
@30 // 11915
D=A // 11916
@SP // 11917
AM=M+1 // 11918
A=A-1 // 11919
M=D // 11920
@51 // 11921
D=A // 11922
@SP // 11923
AM=M+1 // 11924
A=A-1 // 11925
M=D // 11926
@51 // 11927
D=A // 11928
@SP // 11929
AM=M+1 // 11930
A=A-1 // 11931
M=D // 11932
@51 // 11933
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
@30 // 11945
D=A // 11946
@SP // 11947
AM=M+1 // 11948
A=A-1 // 11949
M=D // 11950
@SP // 11951
AM=M+1 // 11952
A=A-1 // 11953
M=0 // 11954
@SP // 11955
AM=M+1 // 11956
A=A-1 // 11957
M=0 // 11958
// call Output.create
@17 // 11959
D=A // 11960
@14 // 11961
M=D // 11962
@Output.create // 11963
D=A // 11964
@13 // 11965
M=D // 11966
@Output.init.ret.81 // 11967
D=A // 11968
@CALL // 11969
0;JMP // 11970
(Output.init.ret.81)
@SP // 11971
M=M-1 // 11972

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 112"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 31"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 11973
D=A // 11974
@SP // 11975
M=D+M // 11976
@112 // 11977
D=A // 11978
@SP // 11979
A=M-1 // 11980
M=0 // 11981
A=A-1 // 11982
M=0 // 11983
A=A-1 // 11984
M=0 // 11985
A=A-1 // 11986
M=D // 11987
A=A-1 // 11988
@30 // 11989
D=A // 11990
@SP // 11991
AM=M+1 // 11992
A=A-1 // 11993
M=D // 11994
@51 // 11995
D=A // 11996
@SP // 11997
AM=M+1 // 11998
A=A-1 // 11999
M=D // 12000
@51 // 12001
D=A // 12002
@SP // 12003
AM=M+1 // 12004
A=A-1 // 12005
M=D // 12006
@51 // 12007
D=A // 12008
@SP // 12009
AM=M+1 // 12010
A=A-1 // 12011
M=D // 12012
@31 // 12013
D=A // 12014
@SP // 12015
AM=M+1 // 12016
A=A-1 // 12017
M=D // 12018
@3 // 12019
D=A // 12020
@SP // 12021
AM=M+1 // 12022
A=A-1 // 12023
M=D // 12024
@3 // 12025
D=A // 12026
@SP // 12027
AM=M+1 // 12028
A=A-1 // 12029
M=D // 12030
@SP // 12031
AM=M+1 // 12032
A=A-1 // 12033
M=0 // 12034
// call Output.create
@17 // 12035
D=A // 12036
@14 // 12037
M=D // 12038
@Output.create // 12039
D=A // 12040
@13 // 12041
M=D // 12042
@Output.init.ret.82 // 12043
D=A // 12044
@CALL // 12045
0;JMP // 12046
(Output.init.ret.82)
@SP // 12047
M=M-1 // 12048

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 113"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 48"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12049
D=A // 12050
@SP // 12051
M=D+M // 12052
@113 // 12053
D=A // 12054
@SP // 12055
A=M-1 // 12056
M=0 // 12057
A=A-1 // 12058
M=0 // 12059
A=A-1 // 12060
M=0 // 12061
A=A-1 // 12062
M=D // 12063
A=A-1 // 12064
@30 // 12065
D=A // 12066
@SP // 12067
AM=M+1 // 12068
A=A-1 // 12069
M=D // 12070
@51 // 12071
D=A // 12072
@SP // 12073
AM=M+1 // 12074
A=A-1 // 12075
M=D // 12076
@51 // 12077
D=A // 12078
@SP // 12079
AM=M+1 // 12080
A=A-1 // 12081
M=D // 12082
@51 // 12083
D=A // 12084
@SP // 12085
AM=M+1 // 12086
A=A-1 // 12087
M=D // 12088
@62 // 12089
D=A // 12090
@SP // 12091
AM=M+1 // 12092
A=A-1 // 12093
M=D // 12094
@48 // 12095
D=A // 12096
@SP // 12097
AM=M+1 // 12098
A=A-1 // 12099
M=D // 12100
@48 // 12101
D=A // 12102
@SP // 12103
AM=M+1 // 12104
A=A-1 // 12105
M=D // 12106
@SP // 12107
AM=M+1 // 12108
A=A-1 // 12109
M=0 // 12110
// call Output.create
@17 // 12111
D=A // 12112
@14 // 12113
M=D // 12114
@Output.create // 12115
D=A // 12116
@13 // 12117
M=D // 12118
@Output.init.ret.83 // 12119
D=A // 12120
@CALL // 12121
0;JMP // 12122
(Output.init.ret.83)
@SP // 12123
M=M-1 // 12124

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 114"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 29"), PushInstruction("constant 55"), PushInstruction("constant 51"), PushInstruction("constant 3"), PushInstruction("constant 3"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12125
D=A // 12126
@SP // 12127
M=D+M // 12128
@114 // 12129
D=A // 12130
@SP // 12131
A=M-1 // 12132
M=0 // 12133
A=A-1 // 12134
M=0 // 12135
A=A-1 // 12136
M=0 // 12137
A=A-1 // 12138
M=D // 12139
A=A-1 // 12140
@29 // 12141
D=A // 12142
@SP // 12143
AM=M+1 // 12144
A=A-1 // 12145
M=D // 12146
@55 // 12147
D=A // 12148
@SP // 12149
AM=M+1 // 12150
A=A-1 // 12151
M=D // 12152
@51 // 12153
D=A // 12154
@SP // 12155
AM=M+1 // 12156
A=A-1 // 12157
M=D // 12158
@3 // 12159
D=A // 12160
@SP // 12161
AM=M+1 // 12162
A=A-1 // 12163
M=D // 12164
@3 // 12165
D=A // 12166
@SP // 12167
AM=M+1 // 12168
A=A-1 // 12169
M=D // 12170
@7 // 12171
D=A // 12172
@SP // 12173
AM=M+1 // 12174
A=A-1 // 12175
M=D // 12176
@SP // 12177
AM=M+1 // 12178
A=A-1 // 12179
M=0 // 12180
@SP // 12181
AM=M+1 // 12182
A=A-1 // 12183
M=0 // 12184
// call Output.create
@17 // 12185
D=A // 12186
@14 // 12187
M=D // 12188
@Output.create // 12189
D=A // 12190
@13 // 12191
M=D // 12192
@Output.init.ret.84 // 12193
D=A // 12194
@CALL // 12195
0;JMP // 12196
(Output.init.ret.84)
@SP // 12197
M=M-1 // 12198

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 115"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 6"), PushInstruction("constant 24"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12199
D=A // 12200
@SP // 12201
M=D+M // 12202
@115 // 12203
D=A // 12204
@SP // 12205
A=M-1 // 12206
M=0 // 12207
A=A-1 // 12208
M=0 // 12209
A=A-1 // 12210
M=0 // 12211
A=A-1 // 12212
M=D // 12213
A=A-1 // 12214
@30 // 12215
D=A // 12216
@SP // 12217
AM=M+1 // 12218
A=A-1 // 12219
M=D // 12220
@51 // 12221
D=A // 12222
@SP // 12223
AM=M+1 // 12224
A=A-1 // 12225
M=D // 12226
@6 // 12227
D=A // 12228
@SP // 12229
AM=M+1 // 12230
A=A-1 // 12231
M=D // 12232
@24 // 12233
D=A // 12234
@SP // 12235
AM=M+1 // 12236
A=A-1 // 12237
M=D // 12238
@51 // 12239
D=A // 12240
@SP // 12241
AM=M+1 // 12242
A=A-1 // 12243
M=D // 12244
@30 // 12245
D=A // 12246
@SP // 12247
AM=M+1 // 12248
A=A-1 // 12249
M=D // 12250
@SP // 12251
AM=M+1 // 12252
A=A-1 // 12253
M=0 // 12254
@SP // 12255
AM=M+1 // 12256
A=A-1 // 12257
M=0 // 12258
// call Output.create
@17 // 12259
D=A // 12260
@14 // 12261
M=D // 12262
@Output.create // 12263
D=A // 12264
@13 // 12265
M=D // 12266
@Output.init.ret.85 // 12267
D=A // 12268
@CALL // 12269
0;JMP // 12270
(Output.init.ret.85)
@SP // 12271
M=M-1 // 12272

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 116"), PushInstruction("constant 4"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 15"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 6"), PushInstruction("constant 54"), PushInstruction("constant 28"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@116 // 12273
D=A // 12274
@SP // 12275
AM=M+1 // 12276
A=A-1 // 12277
M=D // 12278
@4 // 12279
D=A // 12280
@SP // 12281
AM=M+1 // 12282
A=A-1 // 12283
M=D // 12284
@6 // 12285
D=A // 12286
@SP // 12287
AM=M+1 // 12288
A=A-1 // 12289
M=D // 12290
@6 // 12291
D=A // 12292
@SP // 12293
AM=M+1 // 12294
A=A-1 // 12295
M=D // 12296
@15 // 12297
D=A // 12298
@SP // 12299
AM=M+1 // 12300
A=A-1 // 12301
M=D // 12302
@6 // 12303
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
@54 // 12321
D=A // 12322
@SP // 12323
AM=M+1 // 12324
A=A-1 // 12325
M=D // 12326
@28 // 12327
D=A // 12328
@SP // 12329
AM=M+1 // 12330
A=A-1 // 12331
M=D // 12332
@SP // 12333
AM=M+1 // 12334
A=A-1 // 12335
M=0 // 12336
@SP // 12337
AM=M+1 // 12338
A=A-1 // 12339
M=0 // 12340
// call Output.create
@17 // 12341
D=A // 12342
@14 // 12343
M=D // 12344
@Output.create // 12345
D=A // 12346
@13 // 12347
M=D // 12348
@Output.init.ret.86 // 12349
D=A // 12350
@CALL // 12351
0;JMP // 12352
(Output.init.ret.86)
@SP // 12353
M=M-1 // 12354

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 117"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 27"), PushInstruction("constant 54"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12355
D=A // 12356
@SP // 12357
M=D+M // 12358
@117 // 12359
D=A // 12360
@SP // 12361
A=M-1 // 12362
M=0 // 12363
A=A-1 // 12364
M=0 // 12365
A=A-1 // 12366
M=0 // 12367
A=A-1 // 12368
M=D // 12369
A=A-1 // 12370
@27 // 12371
D=A // 12372
@SP // 12373
AM=M+1 // 12374
A=A-1 // 12375
M=D // 12376
@27 // 12377
D=A // 12378
@SP // 12379
AM=M+1 // 12380
A=A-1 // 12381
M=D // 12382
@27 // 12383
D=A // 12384
@SP // 12385
AM=M+1 // 12386
A=A-1 // 12387
M=D // 12388
@27 // 12389
D=A // 12390
@SP // 12391
AM=M+1 // 12392
A=A-1 // 12393
M=D // 12394
@27 // 12395
D=A // 12396
@SP // 12397
AM=M+1 // 12398
A=A-1 // 12399
M=D // 12400
@54 // 12401
D=A // 12402
@SP // 12403
AM=M+1 // 12404
A=A-1 // 12405
M=D // 12406
@SP // 12407
AM=M+1 // 12408
A=A-1 // 12409
M=0 // 12410
@SP // 12411
AM=M+1 // 12412
A=A-1 // 12413
M=0 // 12414
// call Output.create
@17 // 12415
D=A // 12416
@14 // 12417
M=D // 12418
@Output.create // 12419
D=A // 12420
@13 // 12421
M=D // 12422
@Output.init.ret.87 // 12423
D=A // 12424
@CALL // 12425
0;JMP // 12426
(Output.init.ret.87)
@SP // 12427
M=M-1 // 12428

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 118"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12429
D=A // 12430
@SP // 12431
M=D+M // 12432
@118 // 12433
D=A // 12434
@SP // 12435
A=M-1 // 12436
M=0 // 12437
A=A-1 // 12438
M=0 // 12439
A=A-1 // 12440
M=0 // 12441
A=A-1 // 12442
M=D // 12443
A=A-1 // 12444
@51 // 12445
D=A // 12446
@SP // 12447
AM=M+1 // 12448
A=A-1 // 12449
M=D // 12450
@51 // 12451
D=A // 12452
@SP // 12453
AM=M+1 // 12454
A=A-1 // 12455
M=D // 12456
@51 // 12457
D=A // 12458
@SP // 12459
AM=M+1 // 12460
A=A-1 // 12461
M=D // 12462
@51 // 12463
D=A // 12464
@SP // 12465
AM=M+1 // 12466
A=A-1 // 12467
M=D // 12468
@30 // 12469
D=A // 12470
@SP // 12471
AM=M+1 // 12472
A=A-1 // 12473
M=D // 12474
@12 // 12475
D=A // 12476
@SP // 12477
AM=M+1 // 12478
A=A-1 // 12479
M=D // 12480
@SP // 12481
AM=M+1 // 12482
A=A-1 // 12483
M=0 // 12484
@SP // 12485
AM=M+1 // 12486
A=A-1 // 12487
M=0 // 12488
// call Output.create
@17 // 12489
D=A // 12490
@14 // 12491
M=D // 12492
@Output.create // 12493
D=A // 12494
@13 // 12495
M=D // 12496
@Output.init.ret.88 // 12497
D=A // 12498
@CALL // 12499
0;JMP // 12500
(Output.init.ret.88)
@SP // 12501
M=M-1 // 12502

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 119"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 63"), PushInstruction("constant 18"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12503
D=A // 12504
@SP // 12505
M=D+M // 12506
@119 // 12507
D=A // 12508
@SP // 12509
A=M-1 // 12510
M=0 // 12511
A=A-1 // 12512
M=0 // 12513
A=A-1 // 12514
M=0 // 12515
A=A-1 // 12516
M=D // 12517
A=A-1 // 12518
@51 // 12519
D=A // 12520
@SP // 12521
AM=M+1 // 12522
A=A-1 // 12523
M=D // 12524
@51 // 12525
D=A // 12526
@SP // 12527
AM=M+1 // 12528
A=A-1 // 12529
M=D // 12530
@51 // 12531
D=A // 12532
@SP // 12533
AM=M+1 // 12534
A=A-1 // 12535
M=D // 12536
@63 // 12537
D=A // 12538
@SP // 12539
AM=M+1 // 12540
A=A-1 // 12541
M=D // 12542
@63 // 12543
D=A // 12544
@SP // 12545
AM=M+1 // 12546
A=A-1 // 12547
M=D // 12548
@18 // 12549
D=A // 12550
@SP // 12551
AM=M+1 // 12552
A=A-1 // 12553
M=D // 12554
@SP // 12555
AM=M+1 // 12556
A=A-1 // 12557
M=0 // 12558
@SP // 12559
AM=M+1 // 12560
A=A-1 // 12561
M=0 // 12562
// call Output.create
@17 // 12563
D=A // 12564
@14 // 12565
M=D // 12566
@Output.create // 12567
D=A // 12568
@13 // 12569
M=D // 12570
@Output.init.ret.89 // 12571
D=A // 12572
@CALL // 12573
0;JMP // 12574
(Output.init.ret.89)
@SP // 12575
M=M-1 // 12576

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 120"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 30"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 30"), PushInstruction("constant 51"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12577
D=A // 12578
@SP // 12579
M=D+M // 12580
@120 // 12581
D=A // 12582
@SP // 12583
A=M-1 // 12584
M=0 // 12585
A=A-1 // 12586
M=0 // 12587
A=A-1 // 12588
M=0 // 12589
A=A-1 // 12590
M=D // 12591
A=A-1 // 12592
@51 // 12593
D=A // 12594
@SP // 12595
AM=M+1 // 12596
A=A-1 // 12597
M=D // 12598
@30 // 12599
D=A // 12600
@SP // 12601
AM=M+1 // 12602
A=A-1 // 12603
M=D // 12604
@12 // 12605
D=A // 12606
@SP // 12607
AM=M+1 // 12608
A=A-1 // 12609
M=D // 12610
@12 // 12611
D=A // 12612
@SP // 12613
AM=M+1 // 12614
A=A-1 // 12615
M=D // 12616
@30 // 12617
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
@SP // 12629
AM=M+1 // 12630
A=A-1 // 12631
M=0 // 12632
@SP // 12633
AM=M+1 // 12634
A=A-1 // 12635
M=0 // 12636
// call Output.create
@17 // 12637
D=A // 12638
@14 // 12639
M=D // 12640
@Output.create // 12641
D=A // 12642
@13 // 12643
M=D // 12644
@Output.init.ret.90 // 12645
D=A // 12646
@CALL // 12647
0;JMP // 12648
(Output.init.ret.90)
@SP // 12649
M=M-1 // 12650

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 121"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 51"), PushInstruction("constant 62"), PushInstruction("constant 48"), PushInstruction("constant 24"), PushInstruction("constant 15"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12651
D=A // 12652
@SP // 12653
M=D+M // 12654
@121 // 12655
D=A // 12656
@SP // 12657
A=M-1 // 12658
M=0 // 12659
A=A-1 // 12660
M=0 // 12661
A=A-1 // 12662
M=0 // 12663
A=A-1 // 12664
M=D // 12665
A=A-1 // 12666
@51 // 12667
D=A // 12668
@SP // 12669
AM=M+1 // 12670
A=A-1 // 12671
M=D // 12672
@51 // 12673
D=A // 12674
@SP // 12675
AM=M+1 // 12676
A=A-1 // 12677
M=D // 12678
@51 // 12679
D=A // 12680
@SP // 12681
AM=M+1 // 12682
A=A-1 // 12683
M=D // 12684
@62 // 12685
D=A // 12686
@SP // 12687
AM=M+1 // 12688
A=A-1 // 12689
M=D // 12690
@48 // 12691
D=A // 12692
@SP // 12693
AM=M+1 // 12694
A=A-1 // 12695
M=D // 12696
@24 // 12697
D=A // 12698
@SP // 12699
AM=M+1 // 12700
A=A-1 // 12701
M=D // 12702
@15 // 12703
D=A // 12704
@SP // 12705
AM=M+1 // 12706
A=A-1 // 12707
M=D // 12708
@SP // 12709
AM=M+1 // 12710
A=A-1 // 12711
M=0 // 12712
// call Output.create
@17 // 12713
D=A // 12714
@14 // 12715
M=D // 12716
@Output.create // 12717
D=A // 12718
@13 // 12719
M=D // 12720
@Output.init.ret.91 // 12721
D=A // 12722
@CALL // 12723
0;JMP // 12724
(Output.init.ret.91)
@SP // 12725
M=M-1 // 12726

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 122"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 63"), PushInstruction("constant 27"), PushInstruction("constant 12"), PushInstruction("constant 6"), PushInstruction("constant 51"), PushInstruction("constant 63"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@4 // 12727
D=A // 12728
@SP // 12729
M=D+M // 12730
@122 // 12731
D=A // 12732
@SP // 12733
A=M-1 // 12734
M=0 // 12735
A=A-1 // 12736
M=0 // 12737
A=A-1 // 12738
M=0 // 12739
A=A-1 // 12740
M=D // 12741
A=A-1 // 12742
@63 // 12743
D=A // 12744
@SP // 12745
AM=M+1 // 12746
A=A-1 // 12747
M=D // 12748
@27 // 12749
D=A // 12750
@SP // 12751
AM=M+1 // 12752
A=A-1 // 12753
M=D // 12754
@12 // 12755
D=A // 12756
@SP // 12757
AM=M+1 // 12758
A=A-1 // 12759
M=D // 12760
@6 // 12761
D=A // 12762
@SP // 12763
AM=M+1 // 12764
A=A-1 // 12765
M=D // 12766
@51 // 12767
D=A // 12768
@SP // 12769
AM=M+1 // 12770
A=A-1 // 12771
M=D // 12772
@63 // 12773
D=A // 12774
@SP // 12775
AM=M+1 // 12776
A=A-1 // 12777
M=D // 12778
@SP // 12779
AM=M+1 // 12780
A=A-1 // 12781
M=0 // 12782
@SP // 12783
AM=M+1 // 12784
A=A-1 // 12785
M=0 // 12786
// call Output.create
@17 // 12787
D=A // 12788
@14 // 12789
M=D // 12790
@Output.create // 12791
D=A // 12792
@13 // 12793
M=D // 12794
@Output.init.ret.92 // 12795
D=A // 12796
@CALL // 12797
0;JMP // 12798
(Output.init.ret.92)
@SP // 12799
M=M-1 // 12800

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 123"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@123 // 12801
D=A // 12802
@SP // 12803
AM=M+1 // 12804
A=A-1 // 12805
M=D // 12806
@56 // 12807
D=A // 12808
@SP // 12809
AM=M+1 // 12810
A=A-1 // 12811
M=D // 12812
@12 // 12813
D=A // 12814
@SP // 12815
AM=M+1 // 12816
A=A-1 // 12817
M=D // 12818
@12 // 12819
D=A // 12820
@SP // 12821
AM=M+1 // 12822
A=A-1 // 12823
M=D // 12824
@12 // 12825
D=A // 12826
@SP // 12827
AM=M+1 // 12828
A=A-1 // 12829
M=D // 12830
@7 // 12831
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
@56 // 12855
D=A // 12856
@SP // 12857
AM=M+1 // 12858
A=A-1 // 12859
M=D // 12860
@SP // 12861
AM=M+1 // 12862
A=A-1 // 12863
M=0 // 12864
@SP // 12865
AM=M+1 // 12866
A=A-1 // 12867
M=0 // 12868
// call Output.create
@17 // 12869
D=A // 12870
@14 // 12871
M=D // 12872
@Output.create // 12873
D=A // 12874
@13 // 12875
M=D // 12876
@Output.init.ret.93 // 12877
D=A // 12878
@CALL // 12879
0;JMP // 12880
(Output.init.ret.93)
@SP // 12881
M=M-1 // 12882

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 124"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@124 // 12883
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
@12 // 12901
D=A // 12902
@SP // 12903
AM=M+1 // 12904
A=A-1 // 12905
M=D // 12906
@12 // 12907
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
@SP // 12943
AM=M+1 // 12944
A=A-1 // 12945
M=0 // 12946
@SP // 12947
AM=M+1 // 12948
A=A-1 // 12949
M=0 // 12950
// call Output.create
@17 // 12951
D=A // 12952
@14 // 12953
M=D // 12954
@Output.create // 12955
D=A // 12956
@13 // 12957
M=D // 12958
@Output.init.ret.94 // 12959
D=A // 12960
@CALL // 12961
0;JMP // 12962
(Output.init.ret.94)
@SP // 12963
M=M-1 // 12964

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 125"), PushInstruction("constant 7"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 56"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 12"), PushInstruction("constant 7"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@125 // 12965
D=A // 12966
@SP // 12967
AM=M+1 // 12968
A=A-1 // 12969
M=D // 12970
@7 // 12971
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
@12 // 12989
D=A // 12990
@SP // 12991
AM=M+1 // 12992
A=A-1 // 12993
M=D // 12994
@56 // 12995
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
@7 // 13019
D=A // 13020
@SP // 13021
AM=M+1 // 13022
A=A-1 // 13023
M=D // 13024
@SP // 13025
AM=M+1 // 13026
A=A-1 // 13027
M=0 // 13028
@SP // 13029
AM=M+1 // 13030
A=A-1 // 13031
M=0 // 13032
// call Output.create
@17 // 13033
D=A // 13034
@14 // 13035
M=D // 13036
@Output.create // 13037
D=A // 13038
@13 // 13039
M=D // 13040
@Output.init.ret.95 // 13041
D=A // 13042
@CALL // 13043
0;JMP // 13044
(Output.init.ret.95)
@SP // 13045
M=M-1 // 13046

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 126"), PushInstruction("constant 38"), PushInstruction("constant 45"), PushInstruction("constant 25"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0"), PushInstruction("constant 0")], call=CallInstruction{Output.create}}
//  pop:  PopInstruction{address=temp 0}
//}

@126 // 13047
D=A // 13048
@SP // 13049
AM=M+1 // 13050
A=A-1 // 13051
M=D // 13052
@38 // 13053
D=A // 13054
@SP // 13055
AM=M+1 // 13056
A=A-1 // 13057
M=D // 13058
@45 // 13059
D=A // 13060
@SP // 13061
AM=M+1 // 13062
A=A-1 // 13063
M=D // 13064
@25 // 13065
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
@SP // 13079
AM=M+1 // 13080
A=A-1 // 13081
M=0 // 13082
@SP // 13083
AM=M+1 // 13084
A=A-1 // 13085
M=0 // 13086
@SP // 13087
AM=M+1 // 13088
A=A-1 // 13089
M=0 // 13090
@SP // 13091
AM=M+1 // 13092
A=A-1 // 13093
M=0 // 13094
@SP // 13095
AM=M+1 // 13096
A=A-1 // 13097
M=0 // 13098
@SP // 13099
AM=M+1 // 13100
A=A-1 // 13101
M=0 // 13102
// call Output.create
@17 // 13103
D=A // 13104
@14 // 13105
M=D // 13106
@Output.create // 13107
D=A // 13108
@13 // 13109
M=D // 13110
@Output.init.ret.96 // 13111
D=A // 13112
@CALL // 13113
0;JMP // 13114
(Output.init.ret.96)
@SP // 13115
M=M-1 // 13116

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 1}
//}

@Output.1 // 13117
M=0 // 13118

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=static 2}
//}

@Output.2 // 13119
M=0 // 13120

////PushInstruction("constant 0")
@SP // 13121
AM=M+1 // 13122
A=A-1 // 13123
M=0 // 13124
@RETURN // 13125
0;JMP // 13126

////FunctionInstruction{functionName='Memory.add_node', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.add_node with 2
(Memory.add_node)
@SP // 13127
M=M+1 // 13128
AM=M+1 // 13129
A=A-1 // 13130
M=0 // 13131
A=A-1 // 13132
M=0 // 13133

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13134
A=M+1 // 13135
D=M // 13136
@2 // 13137
D=D+A // 13138
@SP // 13139
AM=M+1 // 13140
A=A-1 // 13141
M=D // 13142
D=0 // 13143
@SP // 13144
AM=M-1 // 13145
A=M // 13146
M=D // 13147

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@ARG // 13148
A=M+1 // 13149
D=M // 13150
@3 // 13151
D=D+A // 13152
@SP // 13153
AM=M+1 // 13154
A=A-1 // 13155
M=D // 13156
D=0 // 13157
@SP // 13158
AM=M-1 // 13159
A=M // 13160
M=D // 13161

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
@Memory.add_node.EQ.55 // 13162
D=A // 13163
@SP // 13164
AM=M+1 // 13165
A=A-1 // 13166
M=D // 13167
@ARG // 13168
A=M // 13169
A=M // 13170
D=M // 13171
@DO_EQ // 13172
0;JMP // 13173
(Memory.add_node.EQ.55)
@Memory.add_node$IF_TRUE1 // 13174
D;JNE // 13175

////GotoInstruction{label='Memory.add_node$IF_END1}
// goto Memory.add_node$IF_END1
@Memory.add_node$IF_END1 // 13176
0;JMP // 13177

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
@ARG // 13178
A=M // 13179
D=M // 13180
@SP // 13181
AM=M+1 // 13182
A=A-1 // 13183
M=D // 13184
@ARG // 13185
A=M+1 // 13186
D=M // 13187
@SP // 13188
AM=M-1 // 13189
A=M // 13190
M=D // 13191

////PushInstruction("constant 0")
@SP // 13192
AM=M+1 // 13193
A=A-1 // 13194
M=0 // 13195
@RETURN // 13196
0;JMP // 13197

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

@ARG // 13198
A=M // 13199
A=M // 13200
D=M // 13201
@LCL // 13202
A=M // 13203
M=D // 13204

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13205
A=M+1 // 13206
M=0 // 13207

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
@Memory.add_node.EQ.56 // 13208
D=A // 13209
@SP // 13210
AM=M+1 // 13211
A=A-1 // 13212
M=D // 13213
@LCL // 13214
A=M // 13215
D=M // 13216
@DO_EQ // 13217
0;JMP // 13218
(Memory.add_node.EQ.56)
@SP // 13219
AM=M+1 // 13220
A=A-1 // 13221
M=D // 13222
@SP // 13223
A=M-1 // 13224
M=!D // 13225
@Memory.add_node.GT.57 // 13226
D=A // 13227
@SP // 13228
AM=M+1 // 13229
A=A-1 // 13230
M=D // 13231
@LCL // 13232
A=M // 13233
A=M // 13234
D=M // 13235
@SP // 13236
AM=M+1 // 13237
A=A-1 // 13238
M=D // 13239
@ARG // 13240
A=M+1 // 13241
A=M // 13242
D=M // 13243
@SP // 13244
AM=M-1 // 13245
D=M-D // 13246
@DO_GT // 13247
0;JMP // 13248
(Memory.add_node.GT.57)
D=!D // 13249
@SP // 13250
AM=M-1 // 13251
D=D&M // 13252
D=!D // 13253
@Memory.add_node_WHILE_END1 // 13254
D;JNE // 13255

////PushPopPair {
//  push: PushInstruction("local 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13256
A=M // 13257
D=M // 13258
@LCL // 13259
A=M+1 // 13260
M=D // 13261

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

@LCL // 13262
A=M // 13263
D=M // 13264
@LCL // 13265
A=M // 13266
D=M // 13267
@3 // 13268
D=D+A // 13269
A=D // 13270
D=M // 13271
@LCL // 13272
A=M // 13273
M=D // 13274

////GotoInstruction{label='Memory.add_node_WHILE_EXP1}
// goto Memory.add_node_WHILE_EXP1
@Memory.add_node_WHILE_EXP1 // 13275
0;JMP // 13276

////LabelInstruction{label='Memory.add_node_WHILE_END1}
// label Memory.add_node_WHILE_END1
(Memory.add_node_WHILE_END1)

////ConditionalGroup{push=UnaryPushGroup(    PushInstruction("local 1"),
//NOT), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE2}}
@LCL // 13277
A=M+1 // 13278
D=!M // 13279
@Memory.add_node$IF_TRUE2 // 13280
D;JNE // 13281

////GotoInstruction{label='Memory.add_node$IF_FALSE2}
// goto Memory.add_node$IF_FALSE2
@Memory.add_node$IF_FALSE2 // 13282
0;JMP // 13283

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
@ARG // 13284
A=M+1 // 13285
D=M // 13286
@3 // 13287
D=D+A // 13288
@SP // 13289
AM=M+1 // 13290
A=A-1 // 13291
M=D // 13292
@ARG // 13293
A=M // 13294
A=M // 13295
D=M // 13296
@SP // 13297
AM=M-1 // 13298
A=M // 13299
M=D // 13300

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
@ARG // 13301
A=M // 13302
A=M // 13303
D=M // 13304
@2 // 13305
D=D+A // 13306
@SP // 13307
AM=M+1 // 13308
A=A-1 // 13309
M=D // 13310
@ARG // 13311
A=M+1 // 13312
D=M // 13313
@SP // 13314
AM=M-1 // 13315
A=M // 13316
M=D // 13317

////PushWriter{source=PushInstruction("argument 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 0"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "ADD"
//)}
@ARG // 13318
A=M // 13319
D=M // 13320
@SP // 13321
AM=M+1 // 13322
A=A-1 // 13323
M=D // 13324
@ARG // 13325
A=M+1 // 13326
D=M // 13327
@SP // 13328
AM=M-1 // 13329
A=M // 13330
M=D // 13331

////GotoInstruction{label='Memory.add_node$IF_END2}
// goto Memory.add_node$IF_END2
@Memory.add_node$IF_END2 // 13332
0;JMP // 13333

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
@ARG // 13334
A=M+1 // 13335
D=M // 13336
@3 // 13337
D=D+A // 13338
@SP // 13339
AM=M+1 // 13340
A=A-1 // 13341
M=D // 13342
@LCL // 13343
A=M // 13344
D=M // 13345
@SP // 13346
AM=M-1 // 13347
A=M // 13348
M=D // 13349

////PushWriter{source=PushInstruction("local 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("argument 1"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@ARG // 13350
A=M+1 // 13351
D=M // 13352
@2 // 13353
D=D+A // 13354
@SP // 13355
AM=M+1 // 13356
A=A-1 // 13357
M=D // 13358
@LCL // 13359
A=M+1 // 13360
D=M // 13361
@SP // 13362
AM=M-1 // 13363
A=M // 13364
M=D // 13365

////ConditionalGroup{push=PushInstruction("local 0"), ifGoto=IfGotoInstruction{label='Memory.add_node$IF_TRUE3}}
@LCL // 13366
A=M // 13367
D=M // 13368
@Memory.add_node$IF_TRUE3 // 13369
D;JNE // 13370

////GotoInstruction{label='Memory.add_node$IF_END3}
// goto Memory.add_node$IF_END3
@Memory.add_node$IF_END3 // 13371
0;JMP // 13372

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
@LCL // 13373
A=M // 13374
D=M // 13375
@2 // 13376
D=D+A // 13377
@SP // 13378
AM=M+1 // 13379
A=A-1 // 13380
M=D // 13381
@ARG // 13382
A=M+1 // 13383
D=M // 13384
@SP // 13385
AM=M-1 // 13386
A=M // 13387
M=D // 13388

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
@LCL // 13389
A=M+1 // 13390
D=M // 13391
@3 // 13392
D=D+A // 13393
@SP // 13394
AM=M+1 // 13395
A=A-1 // 13396
M=D // 13397
@ARG // 13398
A=M+1 // 13399
D=M // 13400
@SP // 13401
AM=M-1 // 13402
A=M // 13403
M=D // 13404

////LabelInstruction{label='Memory.add_node$IF_END2}
// label Memory.add_node$IF_END2
(Memory.add_node$IF_END2)

////PushInstruction("constant 0")
@SP // 13405
AM=M+1 // 13406
A=A-1 // 13407
M=0 // 13408
@RETURN // 13409
0;JMP // 13410

////FunctionInstruction{functionName='Screen.drawCircle', numLocals=5, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.drawCircle with 5
(Screen.drawCircle)
@5 // 13411
D=A // 13412
@SP // 13413
AM=D+M // 13414
A=A-1 // 13415
M=0 // 13416
A=A-1 // 13417
M=0 // 13418
A=A-1 // 13419
M=0 // 13420
A=A-1 // 13421
M=0 // 13422
A=A-1 // 13423
M=0 // 13424

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13425
A=M // 13426
M=0 // 13427

////PushPopPair {
//  push: PushInstruction("argument 2")
//  pop:  PopInstruction{address=local 1}
//}

@ARG // 13428
A=M+1 // 13429
A=A+1 // 13430
D=M // 13431
@LCL // 13432
A=M+1 // 13433
M=D // 13434

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

@ARG // 13435
A=M+1 // 13436
A=A+1 // 13437
D=M // 13438
D=D-1 // 13439
D=-D // 13440
@LCL // 13441
A=M+1 // 13442
A=A+1 // 13443
M=D // 13444

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
@Screen.drawCircle.GT.58 // 13445
D=A // 13446
@SP // 13447
AM=M+1 // 13448
A=A-1 // 13449
M=D // 13450
@LCL // 13451
A=M+1 // 13452
D=M // 13453
A=A-1 // 13454
D=M-D // 13455
@DO_GT // 13456
0;JMP // 13457
(Screen.drawCircle.GT.58)
@Screen.drawCircle_WHILE_END1 // 13458
D;JNE // 13459

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

@ARG // 13460
A=M // 13461
D=M // 13462
@LCL // 13463
A=M // 13464
D=D-M // 13465
@SP // 13466
AM=M+1 // 13467
A=A-1 // 13468
M=D // 13469
@ARG // 13470
A=M // 13471
D=M // 13472
@LCL // 13473
A=M // 13474
D=D+M // 13475
@SP // 13476
AM=M+1 // 13477
A=A-1 // 13478
M=D // 13479
@ARG // 13480
A=M+1 // 13481
D=M // 13482
@LCL // 13483
A=M+1 // 13484
D=D+M // 13485
@SP // 13486
AM=M+1 // 13487
A=A-1 // 13488
M=D // 13489
// call Screen.drawHorizontalLine
@8 // 13490
D=A // 13491
@14 // 13492
M=D // 13493
@Screen.drawHorizontalLine // 13494
D=A // 13495
@13 // 13496
M=D // 13497
@Screen.drawCircle.ret.0 // 13498
D=A // 13499
@CALL // 13500
0;JMP // 13501
(Screen.drawCircle.ret.0)
@SP // 13502
M=M-1 // 13503

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

@ARG // 13504
A=M // 13505
D=M // 13506
@LCL // 13507
A=M // 13508
D=D-M // 13509
@SP // 13510
AM=M+1 // 13511
A=A-1 // 13512
M=D // 13513
@ARG // 13514
A=M // 13515
D=M // 13516
@LCL // 13517
A=M // 13518
D=D+M // 13519
@SP // 13520
AM=M+1 // 13521
A=A-1 // 13522
M=D // 13523
@ARG // 13524
A=M+1 // 13525
D=M // 13526
@LCL // 13527
A=M+1 // 13528
D=D-M // 13529
@SP // 13530
AM=M+1 // 13531
A=A-1 // 13532
M=D // 13533
// call Screen.drawHorizontalLine
@8 // 13534
D=A // 13535
@14 // 13536
M=D // 13537
@Screen.drawHorizontalLine // 13538
D=A // 13539
@13 // 13540
M=D // 13541
@Screen.drawCircle.ret.1 // 13542
D=A // 13543
@CALL // 13544
0;JMP // 13545
(Screen.drawCircle.ret.1)
@SP // 13546
M=M-1 // 13547

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

@ARG // 13548
A=M // 13549
D=M // 13550
@LCL // 13551
A=M+1 // 13552
D=D-M // 13553
@SP // 13554
AM=M+1 // 13555
A=A-1 // 13556
M=D // 13557
@ARG // 13558
A=M // 13559
D=M // 13560
@LCL // 13561
A=M+1 // 13562
D=D+M // 13563
@SP // 13564
AM=M+1 // 13565
A=A-1 // 13566
M=D // 13567
@ARG // 13568
A=M+1 // 13569
D=M // 13570
@LCL // 13571
A=M // 13572
D=D+M // 13573
@SP // 13574
AM=M+1 // 13575
A=A-1 // 13576
M=D // 13577
// call Screen.drawHorizontalLine
@8 // 13578
D=A // 13579
@14 // 13580
M=D // 13581
@Screen.drawHorizontalLine // 13582
D=A // 13583
@13 // 13584
M=D // 13585
@Screen.drawCircle.ret.2 // 13586
D=A // 13587
@CALL // 13588
0;JMP // 13589
(Screen.drawCircle.ret.2)
@SP // 13590
M=M-1 // 13591

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

@ARG // 13592
A=M // 13593
D=M // 13594
@LCL // 13595
A=M+1 // 13596
D=D-M // 13597
@SP // 13598
AM=M+1 // 13599
A=A-1 // 13600
M=D // 13601
@ARG // 13602
A=M // 13603
D=M // 13604
@LCL // 13605
A=M+1 // 13606
D=D+M // 13607
@SP // 13608
AM=M+1 // 13609
A=A-1 // 13610
M=D // 13611
@ARG // 13612
A=M+1 // 13613
D=M // 13614
@LCL // 13615
A=M // 13616
D=D-M // 13617
@SP // 13618
AM=M+1 // 13619
A=A-1 // 13620
M=D // 13621
// call Screen.drawHorizontalLine
@8 // 13622
D=A // 13623
@14 // 13624
M=D // 13625
@Screen.drawHorizontalLine // 13626
D=A // 13627
@13 // 13628
M=D // 13629
@Screen.drawCircle.ret.3 // 13630
D=A // 13631
@CALL // 13632
0;JMP // 13633
(Screen.drawCircle.ret.3)
@SP // 13634
M=M-1 // 13635

////ConditionalGroup{push=BinaryPushGroup(
//    left:
//        PushInstruction("local 2"),
//    right:
//        PushInstruction("constant 0"),
//    binaryOp: "LT"
//), ifGoto=IfGotoInstruction{label='Screen.drawCircle$IF_TRUE1}}
@Screen.drawCircle.LT.59 // 13636
D=A // 13637
@SP // 13638
AM=M+1 // 13639
A=A-1 // 13640
M=D // 13641
@LCL // 13642
A=M+1 // 13643
A=A+1 // 13644
D=M // 13645
@DO_LT // 13646
0;JMP // 13647
(Screen.drawCircle.LT.59)
@Screen.drawCircle$IF_TRUE1 // 13648
D;JNE // 13649

////GotoInstruction{label='Screen.drawCircle$IF_FALSE1}
// goto Screen.drawCircle$IF_FALSE1
@Screen.drawCircle$IF_FALSE1 // 13650
0;JMP // 13651

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

@LCL // 13652
A=M+1 // 13653
A=A+1 // 13654
D=M // 13655
@SP // 13656
AM=M+1 // 13657
A=A-1 // 13658
M=D // 13659
@LCL // 13660
A=M // 13661
D=M // 13662
D=D+M // 13663
@SP // 13664
AM=M-1 // 13665
D=D+M // 13666
@3 // 13667
D=D+A // 13668
@LCL // 13669
A=M+1 // 13670
A=A+1 // 13671
M=D // 13672

////GotoInstruction{label='Screen.drawCircle$IF_END1}
// goto Screen.drawCircle$IF_END1
@Screen.drawCircle$IF_END1 // 13673
0;JMP // 13674

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

@LCL // 13675
A=M+1 // 13676
A=A+1 // 13677
D=M // 13678
@SP // 13679
AM=M+1 // 13680
A=A-1 // 13681
M=D // 13682
@LCL // 13683
A=M+1 // 13684
D=M // 13685
A=A-1 // 13686
D=M-D // 13687
@R13 // 13688
M=D // 13689
D=D+M // 13690
@SP // 13691
AM=M-1 // 13692
D=D+M // 13693
@5 // 13694
D=D+A // 13695
@LCL // 13696
A=M+1 // 13697
A=A+1 // 13698
M=D // 13699

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

@LCL // 13700
A=M+1 // 13701
M=M-1 // 13702

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

@LCL // 13703
A=M // 13704
M=M+1 // 13705

////GotoInstruction{label='Screen.drawCircle_WHILE_EXP1}
// goto Screen.drawCircle_WHILE_EXP1
@Screen.drawCircle_WHILE_EXP1 // 13706
0;JMP // 13707

////LabelInstruction{label='Screen.drawCircle_WHILE_END1}
// label Screen.drawCircle_WHILE_END1
(Screen.drawCircle_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13708
AM=M+1 // 13709
A=A-1 // 13710
M=0 // 13711
@RETURN // 13712
0;JMP // 13713

////FunctionInstruction{functionName='Sys.init', numLocals=0, funcMapping={Sys.halt=0}}
// function Sys.init with 0
(Sys.init)

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Memory.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Memory.init
@5 // 13714
D=A // 13715
@14 // 13716
M=D // 13717
@Memory.init // 13718
D=A // 13719
@13 // 13720
M=D // 13721
@Sys.init.ret.0 // 13722
D=A // 13723
@CALL // 13724
0;JMP // 13725
(Sys.init.ret.0)
@SP // 13726
M=M-1 // 13727

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Math.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Math.init
@5 // 13728
D=A // 13729
@14 // 13730
M=D // 13731
@Math.init // 13732
D=A // 13733
@13 // 13734
M=D // 13735
@Sys.init.ret.1 // 13736
D=A // 13737
@CALL // 13738
0;JMP // 13739
(Sys.init.ret.1)
@SP // 13740
M=M-1 // 13741

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Screen.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Screen.init
@5 // 13742
D=A // 13743
@14 // 13744
M=D // 13745
@Screen.init // 13746
D=A // 13747
@13 // 13748
M=D // 13749
@Sys.init.ret.2 // 13750
D=A // 13751
@CALL // 13752
0;JMP // 13753
(Sys.init.ret.2)
@SP // 13754
M=M-1 // 13755

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Output.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Output.init
@5 // 13756
D=A // 13757
@14 // 13758
M=D // 13759
@Output.init // 13760
D=A // 13761
@13 // 13762
M=D // 13763
@Sys.init.ret.3 // 13764
D=A // 13765
@CALL // 13766
0;JMP // 13767
(Sys.init.ret.3)
@SP // 13768
M=M-1 // 13769

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Keyboard.init}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Keyboard.init
@5 // 13770
D=A // 13771
@14 // 13772
M=D // 13773
@Keyboard.init // 13774
D=A // 13775
@13 // 13776
M=D // 13777
@Sys.init.ret.4 // 13778
D=A // 13779
@CALL // 13780
0;JMP // 13781
(Sys.init.ret.4)
@SP // 13782
M=M-1 // 13783

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Main.main}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Main.main
@5 // 13784
D=A // 13785
@14 // 13786
M=D // 13787
@Main.main // 13788
D=A // 13789
@13 // 13790
M=D // 13791
@Sys.init.ret.5 // 13792
D=A // 13793
@CALL // 13794
0;JMP // 13795
(Sys.init.ret.5)
@SP // 13796
M=M-1 // 13797

////PushPopPair {
//  push: CallGroup{pushes=[], call=CallInstruction{Sys.halt}}
//  pop:  PopInstruction{address=temp 0}
//}

// call Sys.halt
@5 // 13798
D=A // 13799
@14 // 13800
M=D // 13801
@Sys.halt // 13802
D=A // 13803
@13 // 13804
M=D // 13805
@Sys.init.ret.6 // 13806
D=A // 13807
@CALL // 13808
0;JMP // 13809
(Sys.init.ret.6)
@SP // 13810
M=M-1 // 13811

////PushInstruction("constant 0")
@SP // 13812
AM=M+1 // 13813
A=A-1 // 13814
M=0 // 13815
@RETURN // 13816
0;JMP // 13817

////FunctionInstruction{functionName='Screen.setColor', numLocals=0, funcMapping={Screen.init=0, Screen.drawLine=3, Screen.drawCircle=4, Screen.drawHorizontalLine=1, Screen.drawRectangle=7, Screen.drawPixel=4}}
// function Screen.setColor with 0
(Screen.setColor)

////PushPopPair {
//  push: PushInstruction("argument 0")
//  pop:  PopInstruction{address=static 0}
//}

@ARG // 13818
A=M // 13819
D=M // 13820
@Screen.0 // 13821
M=D // 13822

////PushInstruction("constant 0")
@SP // 13823
AM=M+1 // 13824
A=A-1 // 13825
M=0 // 13826
@RETURN // 13827
0;JMP // 13828

////FunctionInstruction{functionName='Math.init', numLocals=2, funcMapping={Math.divide=4, Math.abs=1, Math.twoToThe=0, Math.max=0, Math.multiply=0}}
// function Math.init with 2
(Math.init)
@SP // 13829
M=M+1 // 13830
AM=M+1 // 13831
A=A-1 // 13832
M=0 // 13833
A=A-1 // 13834
M=0 // 13835

////PushPopPair {
//  push: PushInstruction("constant 1")
//  pop:  PopInstruction{address=local 0}
//}

@LCL // 13836
A=M // 13837
M=1 // 13838

////PushPopPair {
//  push: PushInstruction("constant 0")
//  pop:  PopInstruction{address=local 1}
//}

@LCL // 13839
A=M+1 // 13840
M=0 // 13841

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 16")], call=CallInstruction{Memory.alloc}}
//  pop:  PopInstruction{address=static 0}
//}

@16 // 13842
D=A // 13843
@SP // 13844
AM=M+1 // 13845
A=A-1 // 13846
M=D // 13847
// call Memory.alloc
@6 // 13848
D=A // 13849
@14 // 13850
M=D // 13851
@Memory.alloc // 13852
D=A // 13853
@13 // 13854
M=D // 13855
@Math.init.ret.0 // 13856
D=A // 13857
@CALL // 13858
0;JMP // 13859
(Math.init.ret.0)
@SP // 13860
AM=M-1 // 13861
D=M // 13862
@Math.0 // 13863
M=D // 13864

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
@Math.init.LT.60 // 13865
D=A // 13866
@SP // 13867
AM=M+1 // 13868
A=A-1 // 13869
M=D // 13870
@LCL // 13871
A=M+1 // 13872
D=M // 13873
@16 // 13874
D=D-A // 13875
@DO_LT // 13876
0;JMP // 13877
(Math.init.LT.60)
D=!D // 13878
@Math.init_WHILE_END1 // 13879
D;JNE // 13880

////PushWriter{source=PushInstruction("local 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("static 0"),
//    right:
//        PushInstruction("local 1"),
//    binaryOp: "ADD"
//)}
@Math.0 // 13881
D=M // 13882
@LCL // 13883
A=M+1 // 13884
D=D+M // 13885
@SP // 13886
AM=M+1 // 13887
A=A-1 // 13888
M=D // 13889
@LCL // 13890
A=M // 13891
D=M // 13892
@SP // 13893
AM=M-1 // 13894
A=M // 13895
M=D // 13896

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

@LCL // 13897
A=M // 13898
D=M // 13899
@LCL // 13900
A=M // 13901
M=D+M // 13902

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

@LCL // 13903
A=M+1 // 13904
M=M+1 // 13905

////GotoInstruction{label='Math.init_WHILE_EXP1}
// goto Math.init_WHILE_EXP1
@Math.init_WHILE_EXP1 // 13906
0;JMP // 13907

////LabelInstruction{label='Math.init_WHILE_END1}
// label Math.init_WHILE_END1
(Math.init_WHILE_END1)

////PushInstruction("constant 0")
@SP // 13908
AM=M+1 // 13909
A=A-1 // 13910
M=0 // 13911
@RETURN // 13912
0;JMP // 13913

////FunctionInstruction{functionName='Memory.init', numLocals=2, funcMapping={Memory.deAlloc=8, Memory.copy=0, Memory.alloc=10, Memory.add_node=0, Memory.create_foot=0, Memory.get_best_fit=0, Memory.getBinIndex=1, Memory.remove_node=0}}
// function Memory.init with 2
(Memory.init)
@SP // 13914
M=M+1 // 13915
AM=M+1 // 13916
A=A-1 // 13917
M=0 // 13918
A=A-1 // 13919
M=0 // 13920

////PushPopPair {
//  push: PushInstruction("constant 2055")
//  pop:  PopInstruction{address=local 0}
//}

@2055 // 13921
D=A // 13922
@LCL // 13923
A=M // 13924
M=D // 13925

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
@LCL // 13926
A=M // 13927
D=M // 13928
@SP // 13929
AM=M+1 // 13930
A=A-1 // 13931
M=D // 13932
@LCL // 13933
A=M // 13934
D=M // 13935
@16384 // 13936
D=A-D // 13937
@5 // 13938
D=D-A // 13939
@SP // 13940
AM=M-1 // 13941
A=M // 13942
M=D // 13943

////PushWriter{source=PushInstruction("constant 1"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 1"),
//    binaryOp: "ADD"
//)}
@LCL // 13944
A=M // 13945
D=M // 13946
@SP // 13947
AM=M+1 // 13948
A=A-1 // 13949
M=D+1 // 13950
D=1 // 13951
@SP // 13952
AM=M-1 // 13953
A=M // 13954
M=D // 13955

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 2"),
//    binaryOp: "ADD"
//)}
@LCL // 13956
A=M // 13957
D=M // 13958
@2 // 13959
D=D+A // 13960
@SP // 13961
AM=M+1 // 13962
A=A-1 // 13963
M=D // 13964
D=0 // 13965
@SP // 13966
AM=M-1 // 13967
A=M // 13968
M=D // 13969

////PushWriter{source=PushInstruction("constant 0"), dest=BinaryPushGroup(
//    left:
//        PushInstruction("local 0"),
//    right:
//        PushInstruction("constant 3"),
//    binaryOp: "ADD"
//)}
@LCL // 13970
A=M // 13971
D=M // 13972
@3 // 13973
D=D+A // 13974
@SP // 13975
AM=M+1 // 13976
A=A-1 // 13977
M=D // 13978
D=0 // 13979
@SP // 13980
AM=M-1 // 13981
A=M // 13982
M=D // 13983

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("local 0")], call=CallInstruction{Memory.create_foot}}
//  pop:  PopInstruction{address=temp 0}
//}

@LCL // 13984
A=M // 13985
D=M // 13986
@SP // 13987
AM=M+1 // 13988
A=A-1 // 13989
M=D // 13990
// call Memory.create_foot
@6 // 13991
D=A // 13992
@14 // 13993
M=D // 13994
@Memory.create_foot // 13995
D=A // 13996
@13 // 13997
M=D // 13998
@Memory.init.ret.0 // 13999
D=A // 14000
@CALL // 14001
0;JMP // 14002
(Memory.init.ret.0)
@SP // 14003
M=M-1 // 14004

////PushPopPair {
//  push: CallGroup{pushes=[PushInstruction("constant 2054"), PushInstruction("local 0")], call=CallInstruction{Memory.add_node}}
//  pop:  PopInstruction{address=temp 0}
//}

@2054 // 14005
D=A // 14006
@SP // 14007
AM=M+1 // 14008
A=A-1 // 14009
M=D // 14010
@LCL // 14011
A=M // 14012
D=M // 14013
@SP // 14014
AM=M+1 // 14015
A=A-1 // 14016
M=D // 14017
// call Memory.add_node
@7 // 14018
D=A // 14019
@14 // 14020
M=D // 14021
@Memory.add_node // 14022
D=A // 14023
@13 // 14024
M=D // 14025
@Memory.init.ret.1 // 14026
D=A // 14027
@CALL // 14028
0;JMP // 14029
(Memory.init.ret.1)
@SP // 14030
M=M-1 // 14031

////PushInstruction("constant 0")
@SP // 14032
AM=M+1 // 14033
A=A-1 // 14034
M=0 // 14035
@RETURN // 14036
0;JMP // 14037

