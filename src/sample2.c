int main(void){
                // 初期で 12byteの領域が確保される
    int a[10];  // 4byte*10 = 40byteが確保されている
    int b[10];  // 4byte*10 = 40byteが確保されている

    // ここまでで96byte確保されている。　<- addi s0,sp,96

    return 0;

}
