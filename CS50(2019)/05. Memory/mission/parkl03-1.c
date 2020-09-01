#include <stdio.h>

int tmp;    // 임시 저장 공간.

void printArr(int arr[]);       //배열 출력 함수
void bublesort(int n, int arr[]);    //배열 정렬 함수

int main()
{
    int n = 7;
    int arr[7] = { 0, 25, 10, 17, 6, 12, 9 };
    
    printf("정렬 전 배열 : ");          //정렬 이전의 배열 출력
    printArr(arr);

    //배열 정렬하기
    bublesort(n, arr);                       //배열 정렬 함수

    //정렬 후 배열 출력
    printf("정렬 후 배열 : ");
    printArr(arr);                      //배열 출력 함수

    return 0;
}

//배열 출력 함수
void printArr(int arr[]){
    for (int i = 0; i < 7; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

//배열 정렬 함수
void bublesort(int n, int arr[]) {
    //buble sort
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (*(arr + i) > * (arr + j)) {
                tmp = *(arr + i);
                *(arr + i) = *(arr + j);
                *(arr + j) = tmp;

            }
            //sort 확인용
            //printf("%d ", arr[j]);
        }
       // printf("\n");
    }
}