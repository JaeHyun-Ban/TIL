package algorithym;

import java.util.Stack;

public class pro12906 {

    class MyQueue<T> {
        Stack<T>  stNew, stOld;

        MyQueue(){
            stNew = new Stack<T>();
            stOld = new Stack<>();
        }

        public void add(T value){
            stNew.push(value);
        }

        public void shiftStacks(){

        }
    }

    public int[] solution(int []arr) {
        int[] answer = {};
        Stack<Integer> stnew = new Stack<>();
        Stack<Integer> stold = new Stack<>();
        for(int num : arr){
            stnew.add(num);
        }
        // 중복확인
        while(stnew.isEmpty()){

        }

        // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
        System.out.println("Hello Java");

        return answer;
    }

    public static void main(String[] args) {

        int[] arr = {1,1,3,3,0,1,1};


    }


}
