    .globl _tc
    .globl _after_tc
    .align 4
    // 各スレッドで足し算してfwd命令で受け渡しができたやつ
_thread1: // LTN 1
    nop // 必要
    # スレッド1 タスク===============
    addi a4, a4, 1
    addi a4, a4, 1
    addi a4, a4, 1
    addi a4, a4, 1
    addi a4, a4, 1  // a4 == 15
    # ==============================
    .align 4
    fwd a3, x0, a4
    nop // 必要
    .align 4
    publk a3, x0    // LTN 0 ロック解除
    nop // 必要
    li a1, 1
    .align 4
    pdall a3, a1    // LTN 1 消去
_tc:
    la a0, _thread1     // スレッド開始番地
    li a1, 1            // 論理スレッド番号(LTN) 指定
    .align 4
    pallc a3, a1, a0    // LTN 1 割り当て
    li a4, 10           // 10
    nop
    .align 4
    fwd a3, a1, a4      // データ転送
    nop
    .align 4
    publk a3, a1        // LTN 1 開始
    nop // 必要
    # スレッド0 タスク===============
    li a6, 10
    addi a6, a6, 10 // 20
    # ==============================
    .align 4
    pblk a3, x0         // LTN 0 のロック
    nop // 必要
    nop // 必要
    nop // 必要
    nop // 必要
    nop // 必要
    ret
_after_tc:
    addi a4, a4, 10 // 25
    addi a4, a4, 10 // 35
    add a4, a4, a6  // 55
    ret