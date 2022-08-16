#include <stdio.h>

int* sortArr;     // 임시 배열

int tmp;    // 임시 저장 공간.

void sort(int n, int arr[]);

int main()
{
    int n = 7;
    int arr[7] = { 0, 25, 10, 17, 6, 12, 9 };
    
    printf("정렬 이전의 배열\n");
    for (int i = 0; i < 7; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n\n");

    sortArr = arr;
    printf("버블 정렬 과정\n");
    sort(n, arr);
    printf("\n\n");

    printf("정렬 후 배열\n");
    for (int i = 0; i < 7; i++) {
        printf("%d ", sortArr[i]);
    }
    return 0;
}

void sort(int n, int arr[]) {
    //buble sort
    for (int i = 0; i < n-1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (*(sortArr + i) > *(sortArr + j)) {
                tmp = *(sortArr + i);
                *(sortArr + i) = *(sortArr + j);
                *(sortArr + j) = tmp;
                
            }
            printf("%d ", arr[j]);
        }
        printf("\n");
    }
}