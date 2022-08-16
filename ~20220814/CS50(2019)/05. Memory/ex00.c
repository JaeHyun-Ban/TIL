

#include<stdio.h>

int main(void)
{
    char *s = "EMMA";

    printf("%c\n", *s); //첫번째 문자 출력 = E
    
    // printf("%c\n", *s[1]);이 아래처럼 바뀌어서 컴파일 된다.
    printf("%c\n", *(s+1)); //두번째 문자 출력 = M
    printf("%c\n", *(s+2));
    printf("%c\n", *(s+3));

}


