/*
    ✔︎ 미션 2.
    1. 미션 제목
    - 연결리스트로 Stack 만들기

    2. 지시문
    - EDWITH CS50 강좌에서 배운 Stack을 보조미션 1에서 배열을 이용해서 구현해 보셨는데요, 
    이번에는 연결리스트를 이용해서 Stack을 구현하는 과제입니다. 
    지난 문제와 마찬가지로 아래 표에 함수의 주석 처리된 부분들에 여러분의 코드를 채워 넣어주세요.

    ===
    Main 함수를 실행시키면 Stack 출력 결과가 정상적으로 나와야 합니다. 
    배열과 연결리스트를 이용해서 구현을 해 보셨는데요, 
    어떤 것이 더 마음에 드셨나요? Main 함수의 내용을 수정해 보면서 실험도 해보시고, 
    Stack 을 구현할 때 리스트를 사용한 방식과 배열을 사용한 방식 중 어떤 방식이 더 좋았는지 느낀 점도 공유해 주세요! 

    3. 핵심 개념
    #Stack #연결리스트 #Stack 구현
*/


#include <stdio.h>
#include <stdlib.h>

typedef struct stackNode {
    int data;
    struct stackNode* next;
} StackNode;

StackNode* createStackNode(int data) {
    StackNode* node = (StackNode*)malloc(sizeof(StackNode));
    node->data = data;
    node->next = NULL;
    return node;
}

int isEmpty(StackNode* root) {
    return !root;
}

void push(StackNode** root, int data) {
    // 이 부분을 구현해 주세요!
    printf("%d pushed to stack\n", data);
}

int pop(StackNode** root) {
    if (isEmpty(*root))
        return -9999;
    int popped;
// 이 부분을 구현해 주세요!
return popped;
}

int peek(StackNode** root) {
    if (isEmpty(*root))
        return -9999;
    return (*root)->data;
}

int main() {
    StackNode* root = NULL;

    push(&root, 10);
    push(&root, 20);
    push(&root, 30);
    push(&root, 40);

    printf("%d pop from stack\n", pop(&root));
    printf("%d pop from stack\n", pop(&root));

    push(&root, 50);
    printf("%d peeked from stack\n", peek(&root));
    printf("%d pop from stack\n", pop(&root));
    printf("%d pop from stack\n", pop(&root));
    printf("%d pop from stack\n", pop(&root));
    return 0;
}