# Data segment
	.data	100
# Text segment
  .text	
  .globl _start

_start:
  li sp, 200
  j main

