#include <asmio.h>
int main(){
    register int a, b, c;
    //scanf("%d", &a);
    //scanf("%d", &b);
    a=read_int();
    b = read_int();

    c= (36/a)-b;
    //printf("%d\n", c);
    print_int(c);
    print_nl();
}
//objdump -d -Wintel a.out