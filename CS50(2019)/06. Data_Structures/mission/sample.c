/*
    ✔︎ 샘플미션.

    # 미션 제목: 2개의 리스트 합치기

 

 

    # 지시문

    EDWITH CS50 강좌를 모두 수강한 여러분은 유능한 개발자로 회사에 소문이나 핵심 부서로 배치되었습니다. 
    핵심부서의 주요 임무 중 하나는 다른 부서의 업무를 종합하는 일입니다. 
    부서 배치 첫 업무로 A부서에서 수행한 업무와 B부서에서 수행한 업무를 합치는 일을 맡게 되었습니다.

    A부서에서는 미국 지사들의 매출이 오름차순으로 정렬된 자료를 연결리스트 형태로 보내왔고, 
    B부서에서는 한국 지사들의 매출이 오름차순으로 정렬된 자료를 연결리스트 형태로 보내왔습니다.


    여러분의 업무는 이제 두 연결리스트를 하나의 연결리스트로 합치어 한국과 미국 지사들의 매출이 오름차순으로 정렬된 연결리스트를 만드시는 것입니다. 
    예를 들어, A부서에서 보내온 연결리스트가 2->6->9->10, 
    B부서에서 보내온 연결리스트가 1->5->7->8->11 이라면 
    여러분이 만들 연결리스트는 1->2->5->6->7->8->9->10->11 이 되어야 합니다.


    업무 수행을 위해 연결 리스트를 합치는 함수와 합쳐진 연결 리스트를 출력하는 함수를 만들어주세요.

*/

/*
 * 연결 리스트의 형태는 아래와 같습니다.
 * struct ListNode {
 *     int sales;
 *     struct ListNode *next;
 * } ListNode;
 */


#include <stdio.h>
#include <stdlib.h>

//노드 생성
typedef struct node {
    int data;
    struct node* next;
}ListNode;

//합병정렬
ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {               //두개의 노드를 받음
    ListNode* head = (ListNode *)malloc(sizeof(ListNode));          //무슨용도?
    ListNode* pt = head;                                            //헤드 포인터

    l1 = l1->next;
    l2 = l2->next;

    while (l1!=NULL && l2!=NULL) {
        if (l1->data <= l2->data) {
            pt->next = l1;
            l1 = l1->next;
        } else {
            pt->next = l2;
            l2 = l2->next;
        }
        pt = pt->next;
    }
    if (l1 != NULL)
        pt->next = l1;
    if (l2 != NULL)
        pt->next = l2;
    return head;
}

//노드 추가하기
void append(ListNode* l, int data) {                            //추가 받을 노드, 입력받은 숫자
    ListNode* item = (ListNode*)malloc(sizeof(ListNode));       //새로운 공간 할당
    item->data = data;                                          //data에 입력된 int값 주입
    item->next = NULL;                                          //next는 NULL로 처리

    ListNode* temp = (ListNode*)malloc(sizeof(ListNode));       //node를 추가해 주기 위한 임시 node생성
    temp = l;                                                   //tmp에 기존 listnode 추가
    while(temp->next != NULL) {                                 
        temp=temp->next;                                        //
    }
    temp->next = item;
}

void printList(ListNode* l) {
    while(l->next != NULL) {
        printf("%d ", l->next->data);
        l = l->next;
    }
    printf("\n");
}

int main() {
    ListNode* listA = (ListNode*)malloc(sizeof(ListNode));      //listA생성
    ListNode* listB = (ListNode*)malloc(sizeof(ListNode));      //listB생성


    append(listA, 2);
    append(listA, 6);
    append(listA, 9);
    append(listA, 10);
    printList(listA);

    append(listB, 1);
    append(listB, 5);
    append(listB, 7);
    append(listB, 8);
    append(listB, 11);
    printList(listB);

    ListNode* result = mergeTwoLists(listA, listB);
    printList(result);
}














