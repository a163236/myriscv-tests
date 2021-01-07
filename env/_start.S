# Data segment
	.data	100
# Text segment
  .text	
  .globl _start

_start:
  li sp, 500  # スタックポインタ 変数格納できる場所確保
  li ra, 1000  # 最終的なreturn addres
  j main

