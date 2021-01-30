extern int _pallc(int tid, int func); 
extern int _publk(int tid); 
extern int _pblk(int tid); 
extern int _pdall(int tid);

#pragma asm // アセンブリ埋め込み

int box[100];



int check(){
    for (int i = 1; i < 20; i++)
    {
        if(box[i] != i){
            return 888;
        }
    }
    return 777;
}

void add0(){

    for (int i = 1; i < 10; i++) 
    {
        box[i] = i;
    }
}

void add1(){

    for (int i = 10; i < 20; i++)
    {
        box[i] = i;
    }

    while(!_publk(0));
    
    _pdall(1);
}


int main(void){

    _pallc(1, add1);

    _publk(1);

    add0();    // a0=0にしたら_publk(0)になる
    
    _pblk(0);

    check();    
    
    return 1000+box[1];

}
