package leetcode;

import java.util.Stack;

public class ltc856 {

    /*
    # Score of Parentheses(괄호의 점수)
    - "()" 는 1점이다
    - AB는 A+B의 점수이고, AB는 밸런스가 맞는 String형 괄호이다
    >>()()는 2점
    - (A)는 2*A이며, A는 밸런스가 맞는 String형 괄호이다.
    >>(()) = 2 * (밸런스 괄호의 갯수)점
     */
    public static void main(String[] args) {
        
        scoreOfParentheses("(()(()))");

    }

    public static int scoreOfParentheses(String s){

        Stack<Integer> st = new Stack<>();

        int score = 0;

        for(int i = 0; i < s.length(); i++){
            char ch = s.charAt(i);
            if(ch == '(') {
                st.push(score);;
                score = 0;
            } else {
                //이게...
                //pop을 하고 점수 * 2, 아니면 +1을 해서 score에 대입
                //어... 이해가되면서 안되는 
                //Math 함수
                //이걸 어떻게 생각했지 진짜
                score = st.pop() + Math.max(2 *score, 1);
            }
        }
        return score;
    }
}
