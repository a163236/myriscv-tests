    .globl _tc

_thread1: // LTN 1
    li a2, 150
    add a2, a2, a2
    sw a2, 0(x0)
    nop
    publk a3, x0    // LTN 0 ロック解除
    nop
    li a1, 1
    pdall a3, a1    // LTN 1 消去
    
_tc:
    la a0, _thread1     // スレッド開始番地
    li a1, 1            // 論理スレッド番号(LTN) 指定
    pallc a3, a1, a0    // LTN 1 割り当て
    nop
    publk a3, a1        // LTN 1 開始
    nop
    pblk a3, x0         // LTN 0 のロック
    nop
    ret
