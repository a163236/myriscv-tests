int main(void){

    int a[10];
    int b[10];
    int c = 0;

    for (int i = 0; i < 10; i++)
    {
        a[i]=i; b[i]=i;
    }
    
    for (int i = 0; i < 10; i++)
    {
        c += a[i] + b[i]; 
    }
    
    return c;

}