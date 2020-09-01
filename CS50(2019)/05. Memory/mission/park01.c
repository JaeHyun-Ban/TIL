#include <stdio.h>

int arr[6][5] = {
	{1, 2, 3, 4, 5},
	{6, 7, 8, 9, 10},
	{11, 12, 13, 14, 15},
	{16, 17, 18, 19, 20},
	{21, 22, 23, 24, 25},
	{26, 27, 28, 29, 30}
};
int col, row;
int* arr2[6][5];	//값을 옮길 배열

void printArr(int n[][5]);  //배열 출력 함수

int main(void) {
	//배열 가로, 세로 길이 구하기
	col = sizeof(arr[0]) / sizeof(int);
	row = sizeof(arr) / sizeof(arr[0]);
	//배열 가로 세로 길이 구하기 끝
	
	//배열 출력하기
	printArr(arr);
	printf("\n");
	//배열 출력하기 끝

	int(*ptr)[5] = arr;	//int형 5개를 담는 배열
	printArr(ptr);
	printf("\n");
	//printf("%p\n", ptr);
	//printf("%p\n", arr);

	//배열 순서 변경
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			arr2[6 - 1 - i][j] = &ptr[i][j];
		}
	}
	

	//배열 출력
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			printf("%d ", *arr2[i][j]);
		}
		printf("\n");
	}
	
}

//배열 출력 함수
void printArr(int n[][5]) {
	for (int i = 0; i < row; i++) {
		for (int j = 0; j < col; j++) {
			printf("%d ", n[i][j]);
		}
		printf("\n");
	}
}
