package etc;

import java.io.*;
import java.util.*;

public class pro01_09 {
    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine(); // 괄호 입력

        Stack<Character> stack = new Stack<>(); // 괄호 스택
        int leftAdd = 0; // 왼쪽 붙히는 괄호
        int rightAdd = 0; // 오른쪽 붙히는 괄호

        // 01 괄호 개수 세기
        for (char c : str.toCharArray()) {
            if (c == '(') {
                stack.push(c);

            } else if (c == ')') {
                if (!stack.isEmpty()) {
                    stack.pop(); // 짝이 맞는다
                } else {
                    leftAdd++; // 여는 괄호가 없으므로 추가
                }

            }
        }
        rightAdd = stack.size();

        System.out.println(leftAdd + rightAdd); // 왼쪽과 오른쪽 붙히는 괄호의 개수
        br.close();

    }
}
