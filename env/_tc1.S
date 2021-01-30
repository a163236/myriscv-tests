    .globl _tc1
    // 各スレッドで足し算してメモリ経由で受け渡しができたやつ
_thread1: // LTN 1
    nop // 必要
    # スレッド1 タスク
    li a5, 10
    add a5, a5, a5  
    sw a5, 0(x0)    // 20
    # 
    nop // 必要
    publk a3, x0    // LTN 0 ロック解除
    nop // 必要
    li a1, 1
    pdall a3, a1    // LTN 1 消去
    
_tc1:
    la a0, _thread1     // スレッド開始番地
    li a1, 1            // 論理スレッド番号(LTN) 指定
    pallc a3, a1, a0    // LTN 1 割り当て
    publk a3, a1        // LTN 1 開始
    nop // 必要
    # スレッド0 タスク
    li a4, 10
    add a4, a4, a4      // 20
    sw a4, 10(x0)
    #
    pblk a3, x0         // LTN 0 のロック
    nop // 必要
    nop // 必要
    lw a5, 0(x0)
    lw a4, 10(x0)
    add a5, a4, a5
    ret
