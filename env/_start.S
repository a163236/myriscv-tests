# Data segment
	.data	100
# Text segment
  .text	
  .align 4
  .globl _start
_start:
  li sp, 20000  # スタックポインタ 変数格納できる場所確保
  li ra, 3000  # 最終的なreturn addres
  j main

  .globl _pallc
_pallc: // 引数 a0 アドレス, 引数 a1 スレッドid
    li a2, 0
    pallc a2, a0, a1
    fwd a2, a0, sp
    fwd a2, a0, s0
    mv a0, a2
    ret

  .globl _publk
_publk: // 引数 a0 スレッドid
    li a2, 0
    publk a2, a0
    mv a0, a2
    ret

  .globl _pblk
_pblk: // 引数 a0 スレッドid
    li a2, 0
    pblk a2, a0
    mv a0, a2
    ret

  .globl _pdall
_pdall: // 引数 a0 スレッドid
    li a2, 0
    pdall a2, a0
    nop
    nop
    nop
    nop
    
