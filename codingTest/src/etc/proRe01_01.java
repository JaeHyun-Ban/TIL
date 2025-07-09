package etc;

import java.io.*;
import java.util.*;

public class proRe01_01 {

    public static void main(String[] args) throws Exception {

        // 단어 뒤집기 2 다시 풀기
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder(); // 결과를 담을 StringBuilder
        Stack<Character> stack = new Stack<>(); // 스택 생성
        String str = bf.readLine(); // 입력받기
        boolean flag = false;

        for (Character c : str.toCharArray()) {

            // 열림이 나오면 닫힘이 나오기 전까지 계속 넣기
            if (c == '<') {
                if (!stack.isEmpty()) {
                    while (!stack.isEmpty()) {
                        sb.append(stack.pop()); // 스택에 있는 것들을 뒤집어서 넣기
                    }
                }
                flag = true;
                sb.append(c);
            } else if (c == '>') {
                flag = false;
                sb.append(c);
            } else if (flag) { // 괄호 열린 상태
                sb.append(c);
            } else { // 괄호 닫힌 상태
                if (c == ' ') {
                    if (!stack.isEmpty()) {
                        while (!stack.isEmpty()) {
                            sb.append(stack.pop()); // 스택에 있는 것들을 뒤집어서 넣기
                        }
                    }
                    sb.append(' ');
                } else {
                    stack.push(c); // 스택에 넣기
                }

            }

        }
        // 마지막 단어 남아있는 경우
        while (!stack.isEmpty()) {
            sb.append(stack.pop());
        }

        System.out.println(sb.toString()); // 결과 출력
    }

}
