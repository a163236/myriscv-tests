# Text segment
    .text	
    .globl _cas
    .global _fail

# a0 holds address of memory location
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
_cas:
    li a1, 10
    li a0, 100
    sw a1, 0(a0)
    nop
    lr.w t0, (a0)       # Load original value. 今のところストールの原因
    bne t0, a1, _fail    # Doesn’t match, so fail.
    sc.w t0, a2, (a0)   # Try to update.　今のところストールの原因
    bnez t0, _cas        # Retry if store-conditional failed.
    li ra, 500
    li a0, 0            # Set return to success.
    jr ra               # Return.

_fail:
    li ra, 1000
    li a0, 1 # Set return to failure.
    jr ra # Return.

