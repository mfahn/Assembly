#include <stdio.h>
int main() {
    int i = 10, j = 100;
    top_loop1:
    if(i<0) goto end_loop1;
        top_loop2:
        if(i <= 50) goto end_loop2;
            j++;j++;j++;j++;j++;
            j++;j++;j++;j++;j++;
            j++;j++;j++;j++;j++;
            j++;j++;j++;j++;j++;
            goto top_loop2;
        end_loop2:
        i--;
        if(i != 10) goto end_if2;
            j--;j--;j--;
        end_if2:
        if(i != 20) goto end_if3;
            j--;j--;j--;
            j--;j--;j--;
        end_if3:
        j++;
        goto top_loop1;
    end_loop1:
    i=0;
    start_loop3:
    if(j <= 0) goto end_loop3;
        if(j >= 99) goto end_loop4;
            j--;
        end_loop4:
        j--;j--;j--;j--;j--;
        j--;j--;j--;j--;j--;
        start_loop5:
        if(i>=5) goto end_loop5;
            j++;i++;
            goto start_loop5;
        end_loop5:
        goto start_loop3;
    end_loop3:
    printf("i=%d j=%d\n", i, j);
}