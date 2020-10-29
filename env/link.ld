OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY
{
ROM(rxai) : ORIGIN = 0, LENGTH = k
RAM(wxai) : ORIGIN = 0x00ffe000, LENGTH = k
}

SECTIONS
{
  . = 0x00000000;
  .text.init : { *(.text.init) }
  . = ALIGN(0x0000);
  .tohost : { *(.tohost) }
  . = ALIGN(0x0000);
  .text : { *(.text) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  .bss : { *(.bss) }
  _end = .;
}
