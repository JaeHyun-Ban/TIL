package algorithym;

import java.util.Stack;

class MyQueue<T> {
    // 두개의 stack 을 이용한 queue만들기
    //Newest는 add를 관리
    //Oldest는 Peek, pop을 담당한다.
    Stack<T> stackNewest, stackOldest;  // stack 2개 생성

    MyQueue() { //queue 생성
        //Queue을 stack 2개를 넣어서 생성한다
        stackNewest = new Stack<T>();
        stackOldest = new Stack<>();
    }

    //queue의 크기를 = Newest사이즈 + Oldest사이즈
    public int size() {
        return stackNewest.size() + stackOldest.size();
    }

    //신규 add => StackNewest push()
    public void add(T value) {
        stackNewest.push(value);
    }

    //stack의 이동
    // 1. Oldest가 비어있다
    //  - Newest에서 pop으로 꺼낸 것을 Oldest에 push한다
    private void shiftStacks() {
        if (stackOldest.isEmpty()) {
            while (!stackNewest.isEmpty()) {
                stackOldest.push(stackNewest.pop());
            }
        }
    }

    public T peek() {
        shiftStacks();
        //peek은 꺼내서 보여주기만하지 꺼내고 사라지지 않는다.
        return stackOldest.peek();
    }

    public T remove() {
        shiftStacks();
        return stackOldest.pop();
    }
}

public class StackQueue {
    public static void main(String[] args) {
        MyQueue<Integer> q = new MyQueue<>();
        q.add(1);//최초로 들어간 이터가 먼저 나옴
        q.add(2);
        q.add(3);
        System.out.println(q.peek());
        System.out.println(q.peek());
        System.out.println(q.peek());
    }
}


