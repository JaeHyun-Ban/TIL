package programers;

import java.util.Stack;

public class pgm018_12973 {
    public int solution(String s){

        int answer = -1;

        Stack<Character> stack = new Stack<Character>();

        for(char c : s.toCharArray()){
            if(!stack.isEmpty() && stack.peek() == c){
                stack.pop();
            } else {
                stack.push(c);
            }

        }
        // 결과값
        answer = stack.isEmpty() ? 1 : 0;

        return answer;
    }
}
