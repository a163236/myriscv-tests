int main(void){

    int a[10],b[10], c[10];

    for (int i = 0; i < 10; i++)
    {
        a[i]=i; b[i]=i;
    }
    
    for (int i = 0; i < 10; i++)
    {
        c[i] += a[i] + b[i]; 
    }
     
    return c[1];

}
