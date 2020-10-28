# About

C言語からRISC-Vのアセンブリや機械語のテストファイルを作成したいときにmakeコマンドで作れるツール。
riscv-tests(https://github.com/riscv/riscv-tests)で生成されたテストコードはCSRの実装が必須となるが、これではCSRがなくてもよい。


main関数の
```return x;```
のxはa0レジスタに入るので、そこが任意の値になってるかチェックするとよい。

## 入力のCファイル

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/575388/9d49b2eb-d8e3-2508-1339-b291d1f2c36e.png)

## 出力されたdumpファイル

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/575388/c6a952d4-6dd3-994c-285f-d2141380c6cc.png)

## 出力されたHexファイル

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/575388/0c63c01d-d917-b55c-cb7f-3599f1aec422.png)


# インストール


```bash
# このリポジトリのクローン
git clone https://github.com/a163236/myRISCVcompilerEnv.git

# RISC-Vコンパイラのインストール
sudo apt install gcc-riscv64-unknown-elf 
# sudo apt install gcc-riscv64-linux-gnu
```

# How To Use
簡単な使い方を記す。
1. まずsrcディレクトリの中にc言語(.c)のファイルを作る

## コンパイル方法

```bash
make
```
これによってsrcディレクトリ内に .dump .hex のファイルが作られる

## 作成されたファイル類を消去

srcディレクトリ内の.dump.hexファイルを消去する

```bash
make clean
```

# カスタマイズ方法

Makefileに修正を加えることで、ターゲットアーキテクチャを変えたり、hexファイルの出力を指定することができる。また、リンカスクリプトも変更することで開始アドレスやスタートアップルーチンも指定できる。

## ターゲットのアーキテクチャを変更するには
./Makefile
```
TARARCH = rv32i
```
を変更する。

## Hexファイルへの出力方法を変更するには
./Makefileのコメントアウトの箇所を変える
```bash
# hexファイル
%.hex: $(BINSRC)
	# 4byteごとの出力
	hexdump -v -e '1/4 "%08x" "\n"' $*.bin > $@
	# 1byteごとのリトルエンディアンの出力
	#hexdump -v -e '4/1 "%02x " "\n"' $*.bin > $@
```
を変更する。


# アンインストール

クローンしたリポジトリを削除するだけ。

```bash
sudo rm -r myRISCVcompilerEnv
```