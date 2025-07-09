package etc;

import java.io.*;
import java.util.*;

public class pro01_14 {

    public static void main(String[] args) throws Exception {
        /*
         * 닫는괄호 시 레이저인지 파이프끝부분인지 구분
         */
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        String input = bf.readLine(); // 괄호 입력받기

        Stack<Character> stack = new Stack<>();

        int result = 0;
        // 입력받은 괄호만큼 반복
        for (int i = 0; i < input.length(); i++) {
            // 열린괄호일 경우 계속 push
            if (input.charAt(i) == '(') {
                stack.push('(');
                continue;
            }
            // 닫힌괄호의 경우
            if (input.charAt(i) == ')') {
                stack.pop();// 일단 pop
                // 열린괄호 >> 레이저
                if (input.charAt(i - 1) == '(') {// 이전 괄호가 열린괄호면 레이저를 의미
                    // 현재 stack의 사이즈만큼 더해줌 << ?
                    result += stack.size();
                } else { // 그 전 괄호가 닫힌괄호면 레이저가 아니다.
                    result++;
                }
            }
        } // for End

        bw.write(result + "\n"); // \n이 공백제거이던가∫
        bw.flush();
        bf.close();
        bw.close();
    }

}
