src_dir := ./src/
env_dir := ./env/

XLEN = 64
# ターゲットアーキテクチャ
TARARCH = rv32i
TARMABI = ilp32

RISCV_PREFIX ?= riscv$(XLEN)-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -T $(env_dir)link.ld -march=$(TARARCH) -mabi=$(TARMABI)
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy -O binary 

# ソースファイル
CSRC = $(wildcard $(src_dir)*.c)			# srcディレクトリの全Cソースファイル
#CSRC_2 = $(subst ./src/, ./target/,$(CSRC))	# ./target/パス に変更
OUTSRC = $(patsubst %.c,%.out,$(CSRC))
DUMPSRC = $(patsubst %.c,%.dump,$(CSRC))
BINSRC = $(patsubst %.c,%.bin,$(CSRC))
HEXSRC = $(patsubst %.c,%.hex,$(CSRC))

# dumpとhexの出力
all: $(HEXSRC) $(DUMPSRC)

# hexファイル
%.hex: $(BINSRC)
	# 4byteごとの出力
	hexdump -v -e '1/4 "%08x" "\n"' $*.bin > $@
	# 1byteごとのリトルエンディアンの出力
	#hexdump -v -e '4/1 "%02x " "\n"' $*.bin > $@

# binファイル作成
%.bin: $(OUTSRC)
	$(RISCV_OBJCOPY) $*.out $@

# dumpファイル
%.dump: $(OUTSRC)
	$(RISCV_OBJDUMP) $*.out > $@

# outファイル
%.out: $(CSRC)
	$(RISCV_GCC) $(RISCV_GCC_OPTS) $*.c -o $@   
	
# ファイル削除
clean:
	rm -f $(src_dir)*.o $(src_dir)*.bin $(src_dir)*.out $(src_dir)*.dump $(src_dir)*.hex