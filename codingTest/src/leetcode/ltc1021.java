package leetcode;

import java.util.*;

/**
 * ltc1021
 */
public class ltc1021 {

    /*
     * string parentheses(괄호)가 주어짐
     * - 유효한 괄호형태가 주어짐 -> "()"인 것
     * "", "(" + A + ")", or A + B => 유효한 괄호
     */
    public static void main(String[] args) {
        
        String ans = "()()";
        System.out.println(removeOuterParentheses(ans));
    }

    public static String removeOuterParentheses(String s){

        Stack<Character> st = new Stack<>();   
        StringBuilder sb = new StringBuilder(); //괄호 저장
        // 정답 괄호 => stack에 쌓이는 것 없이 바로 사라짐
        // 오답 괄호 => stack에 '('가 하나 무조껀 남게 되며 마지막에 사라지게 된다.
        for(int i = 0; i < s.length(); i++){
            char c = s.charAt(i);
            if(c == '('){
                //stack이 비어있다면
                if(st.size() >= 1) {
                    sb.append(c);
                }
                st.push(c);
            // ')'가 들어올 차례
            // 2가지의 상황이 존재
            //1. pop이후 stack에 아무것도 남아있지 않을 때
            //2. pop이후 stack에 데이터가 존재할 때
            } else {
                st.pop();
                if(st.size() >= 1){
                    sb.append(c);
                } 
                
            }
        }
        return sb.toString();
    }
}