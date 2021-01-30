# Data segment
  .data	100
# Text segment
  .text	
  .globl _start

_start:
  li sp, 1000 # 動的なメモリ確保の領域
  li ra, 1000 # 戻りアドレス