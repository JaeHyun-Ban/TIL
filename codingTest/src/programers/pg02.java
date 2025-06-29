package programers;

import java.util.*;


public class pg02 {
    
    public static void main(String[] args) {
        
        String s = "(())()";

        solution(s);

    }
        /*
         * 올바른 괄호
         * 괄호 열림,닫힘이 반드시 순서대로 한 쌍이 만들어져야 한다
         * ->올바른 예시: '()', '(())', '(())()'
         * '(', ')'로만 이루어진 문자열이 주어질 때
         * 올바른 괄호라면 true, 아니라면 false를 반남
         * 
         */

        /*
         * stack선언
         * '('이 들어온다
         *  - 이후 ')'4
         */
    public static boolean solution(String s){
        
        boolean answer = true;

        Stack<Character> stack = new Stack<>();//char형 스택
        
        /*
        - String 길이만큼 반복
          - '('일 때 stack.push
          - ')'라면 '('을 pop
          - 하지만 stack이 비어있다면 isEmpty 
            false로 조건문 끝내기


         */
        for(int i = 0; i < s.length(); i++){
            if(s.charAt(i) == '('){
                stack.push('(');
            } else if (s.charAt(i) == ')'){
                if(stack.isEmpty()){
                    return false;
                }    
                stack.pop();
            }
        }
        return stack.isEmpty();
        
    }


    public static int[] ex(int[] n){

        int[] ans = new int[n.length];

        for(int i = 0; i < n.length; i++){

            if(n[i] == 3) {
                ans[i] = n[i];
            } else
                return false;
            

        }

        return ans;
    }
}
