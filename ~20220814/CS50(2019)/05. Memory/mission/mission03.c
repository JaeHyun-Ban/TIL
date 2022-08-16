/*
    # 정렬을 해보자

    - 데이터를 정리하기위해 엑셀을 많이 사용할 것이다.
    게다가, 데이터들을 보기 좋게 하기 위해서 정렬 기능을 많이 사용할 텐데
    간단한 버블 정렬 코드를 배열이 아닌 포인터를 활용해서 완성해 보자


    예) main code는 다음과 같습니다. sort function 을 완성해보세요
    int main() 
    { 
        int n = 7; 
        int arr[7] = { 0, 25, 10, 17, 6, 12, 9 }; 

        sort(n, arr); 

        return 0; 
    }

    # 출력값 : 0, 6, 9, 10, 12, 17, 25


    # 핵심 개념
    - sort
    - bubblesort(버블정렬)

*/

/*
    # 버블정렬
    1 ~ 7번까지의 배열이 존재
    n과 n+1값을 비교해 나아감, 
    최종 정렬된 값은 제외하고 나머지를 다시 비교하는 반복문을 생성

    반복for: 0부터 점점 1개씩 비교갯수를 줄여가게 생성
        반복for: 0번부터 줄인만큼 남은 값끼리 비교
            조건문if: 만약 arr이 arr+1보다 크다면
                변수생성: 임시 저장소 tmp
                tmp = arr
                arr = arr+1
                arr+1 = tmp

    정렬된 값을 출력해준다
    반복 
*/

#include<stdio.h>

void sort(int num, int arr[]);                  //정렬과 출력을 해준다

int main() 
{ 
    int n = 7; 
    int arr[7] = { 0, 25, 10, 17, 6, 12, 9 }; 

    sort(n, arr); 

    return 0; 
}

void sort(int num, int arr[]){                  //버블정렬

    for(int i = num - 1; i > 0; i--){           // n번부터 n-1과 n번 까지 반복 비교
        
        for (int j = 0; j < i; j++){             

            if(*(arr+j) > *(arr+j+1)){
                
                int tmp;
                tmp = *(arr+j);
                *(arr+j) = *(arr+j+1);
                *(arr+j+1) = tmp;
            }
        }
          
    } 

    for(int i = 0; i < num; i++){

        printf("%d\t", arr[i]);
    }
    printf("\n");  
}



