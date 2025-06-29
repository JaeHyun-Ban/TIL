package bkjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class bkj9012 {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        for(int i = 0; i < n; i++) {
            String str = br.readLine();
            //검증메서드 결과에 따른 출력
            System.out.println(isValid(str) ? "YES" : "NO");
        }
    }

    //검증 메서드 생성
    public static boolean isValid(String str){
        // stack선언
        Stack<Character> st = new Stack<>();

        //LIFO구조로 진행
        for(char c : str.toCharArray()) { //문자열상태인 괄호를 char로 하나씩 검증
            // 열린괄호의 경우
            if(c == '(') {
                st.push(c); //스택에 넣기
            } else if (c == ')') { //닫힌괄호의 경우
                // 스택이 비어있다면 -> 올바르지 않음
                if(st.isEmpty()) {
                    return false;
                }
                //올바른 경우 열리는 열리는 괄호 꺼냄
                st.pop();
            }

        }
        return st.isEmpty();
    };



}
