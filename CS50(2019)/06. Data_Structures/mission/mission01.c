/*
    1. 미션 제목
    - 배열로 Stack 만들기

    2. 지시문
    - EDWITH CS50 강좌에서 배운 Stack을 C 언어로 구현해 보겠습니다.
    Stack을 구현하는 방법은 정말 많은데요, 
    이번 문제에서는 Stack을 배열을 이용해서 구현하는 방법에 대해서 알아보겠습니다. 
    아래 표에 함수의 주석 처리된 부분들에 여러분의 코드를 채워 넣어주세요.


    Main 함수를 실행시키면 Stack 출력 결과가 정상적으로 나와야 합니다.
    위의 문제라면
    10 pushed to stack
    20 pushed to stack
    30 pushed to stack
    40 pushed to stack
    40 pop from stack
    30 pop from stack
    50 pushed to stack
    50 pop from stack
    20 pop from stack
    10 pop from stack
    -9999 pop from stack

    위와 같은 결과가 나오도록 작성해 주세요. 다양한 숫자와 사례를 만들어서 실험해 보세요!

    3. 핵심 개념
    #Stack #배열 #Stack 구현
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct stack{
    int top;                                        //쌓이는 배열의 위치표시
    int capacity;                                   //크기
    int* array;                                     //배열의 포인터
} Stack;

Stack* createStack(int capacity) {
    Stack* stack = (Stack*)malloc(sizeof(Stack));                       //stack node를 생성
    stack->capacity = capacity;                                         //대입받은 값을 대입
    stack->top = -1;                                                    //아무것도 없을 시 -1로 존재, 이를통해 값이 비었는지 확인, 배열이 0번부터 시작하게됨
    stack->array = (int *)malloc(stack->capacity*sizeof(int));          //받은 값만큼 배열
    return stack;
}

int isFull(Stack* stack) {                                              //top이 -1이기 때문에 capacity-1과 같다면 가득찬 것
    return stack->top == stack->capacity-1;
}

int isEmpty(Stack* stack) {
    return stack->top == -1;                        //top기본이 -1이라서 -1이라면 stack이 비어있는것
}

void push(Stack* stack, int item) {
    //필수 확인 조건
    if (isFull(stack)){                             //stack이 가득 찻는지 확인?
        printf("Stack is full!");                   //문제 발생 출력
        return -1;                                  //종료 
    }
    stack->array[++stack->top] = item;              //top을 1만큼 증가, 스택에 int값을 저장
    printf("%d pushed to stack\n", item);
}

//https://velog.io/@polynomeer/%EC%8A%A4%ED%83%9DStack-%EC%9E%90%EB%A3%8C%EA%B5%AC%EC%A1%B0
int pop(Stack* stack) {
    //필수 확인 조건
    if(isEmpty(stack)){                             //stack이 비었는지 확인
        printf("Stack is empty!");                  //문제 발생 출력
        return -1;                                  //종료
    }
    return stack->array[stack->top--];              //top을 하나 내려주고, 그걸 가리키는 배열을 반환
}

//https://blog.naver.com/justkukaro/220503515118
//pop은 사용시 그대로 출력하고 자료값을 빼버리지만 peek는 맨 위의 데이터를 빼지않고 보여준다.
int peek(Stack* stack) {
    //필수 확인 조건
    if(isEmpty(stack)){
        printf("Stack is empty!");
        return -1;
    }
    return stack->array[stack->top];                 //top을 빼주지않고 있는 현재위치 그대로 값을 반환
}

int main() {
    Stack* stack = createStack(100);

    //테스트 입력
    push(stack, 10);
    push(stack, 20);
    push(stack, 30);
    push(stack, 40);

    printf("\n");
    printf("%d peek from stack\n\n", peek(stack));      //혹시 값이 빠져나가나 확인용

    printf("%d pop from stack\n", pop(stack));
    printf("%d pop from stack\n", pop(stack));

    push(stack, 50);
    printf("%d pop from stack\n", pop(stack));
    printf("%d pop from stack\n", pop(stack));
    printf("%d pop from stack\n", pop(stack));
    printf("%d pop from stack\n", pop(stack));          //pop이 더 많게되어 문구가 출력됨
    return 0;
}

