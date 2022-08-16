/*
    1. 포인터를 이중으로 활용해보자
    
    2. 지시문
    2차원 배열을 선언한 후 포인터로 접근해 순서대로 출력하는 코드를 작성해보자

    int arr[6][5] = {
                    {1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}, 
                    {11, 12, 13, 14, 15},{16, 17, 18, 19, 20}, 
                    {21, 22, 23, 24, 25}, {26, 27, 28, 29, 30}
                    };

    - 2차원 배열의 경우 이중포인터로 접근할 수 있으니 활용해보자
====================================================================
    # 의사코드
    
    배열생성: int형 2차원 

    길이 구하기: 2차월 배열의 총 크기 
    길이 구하기: 2차원 배열의 가로 길이 
    길이 구하기: 2차원 배열의 세로 길이 

    반복문for: 세로길이 만큼(6개의 배열)
        반복문for: 가로길이 만큼
            출력: (세로 i번째)포인터 + j번째로 첫번째부터 끝짜지 출력 -> 배열포인터는 첫번째 값의 주소를 가르킨다
        출력: 가로길이 전부 출력 후 띄어쓰기용 개행을 해준다


*/
#include<stdio.h>

void output(int a, int b);
void revoutput(int a, int b);

//어디서든 사용하게 전역변수 설정
int arr[6][5] = {
                    {1, 2, 3, 4, 5},
                    {6, 7, 8, 9, 10},
                    {11, 12, 13, 14, 15},
                    {16, 17, 18, 19, 20},
                    {21, 22, 23, 24, 25},
                    {26, 27, 28, 29, 30}
                };

int n;
int row;
int col;

int main(void){

    n = sizeof(arr);                                //2차원 배열의 총 크기
    row = sizeof(arr[0]) / sizeof(int);             //가로길이
    col = sizeof(arr) / sizeof(arr[0]);             //세로길이

    printf("2차원 배열 크기: %d\n", n);
    printf("가로길이: %d\n", row);
    printf("세로길이: %d\n", col);
    printf("\n");

    printf("정방향 출력\n");
    output(row, col);
    printf("\n");                               //가로 세로를 입력 출력
    
    printf("역방향 출력\n");
    revoutput(row, col);
    

}

void output(int a, int b){

    for (int i = 0; i < col; i++)
    {
        for (int j = 0; j < row; j++)
        {
            printf("%d ", *(arr[i])+j);
        }

        printf("\n");
    }
}

void revoutput(int a, int b){

    for (int i = col-1; i >= 0; i--)
    {
        for (int j = 0; j < row; j++)
        {
            printf("%d ", *(arr[i])+j);
        }

        printf("\n");
    }
}

// int length(int *arr[]){

//     n = sizeof(arr);                                //2차원 배열의 총 크기
//     row = sizeof(arr[0]) / sizeof(int);             //가로길이
//     col = sizeof(arr) / sizeof(arr[0]); 

// }

