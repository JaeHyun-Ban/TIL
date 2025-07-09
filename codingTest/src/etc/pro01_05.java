package etc;

import java.io.*;
import java.util.*;

public class pro01_05 {
    public static void main(String[] args) throws Exception {

        // L은 왼쪽으로 커서를 한칸이동
        // D는 오른쪽으로 커서를 한칸 이동
        // B는 커서 왼쪽에 있는 문자를 삭제
        // P는 커서 왼쪽에 문자를 삽입
        // 핵심 아이디어: 스택 두 개로 커서 표현
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // 01
        String str = br.readLine(); // 초기 문자열
        // 02
        int n = Integer.parseInt(br.readLine()); // 입력 횟수

        Stack<Character> left = new Stack<>(); // 왼쪽 스택
        Stack<Character> right = new Stack<>(); // 오른쪽 스택

        // 03
        for (char c : str.toCharArray()) {
            left.push(c); // 초기 문자열을 왼쪽 스택에 저장
        }

        // 04
        for (int i = 0; i < n; i++) {
            String command = br.readLine(); // 명령어

            switch (command.charAt(0)) {
                case 'L': // 커서 왼쪽 이동
                    if (!left.isEmpty()) {
                        right.push(left.pop()); // 왼쪽 스택에서 오른쪽 스택으로 이동
                    }
                    break;
                case 'D': // 커서 오른쪽 이동
                    if (!right.isEmpty()) {
                        left.push(right.pop()); // 오른쪽 스택에서 왼쪽 스택으로 이동
                    }
                    break;
                case 'B': // 현재 커서 왼쪽 삭제
                    if (!left.isEmpty()) {
                        left.pop(); // 왼쪽 스택에서 문자 삭제
                    }
                    break;
                case 'P': // 현재 커서 왼쪽에 문자 추가
                    char c = command.charAt(2);// EX) P x >> 2번쨰 문자 P공백x
                    left.push(c); // 왼쪽 스택에 문자 삽입
                    break;

                default:
                    break;
            }
        }
        // 05
        while (!left.isEmpty()) {
            right.push(left.pop()); // 왼쪽 스택의 문자를 오른쪽 스택으로 이동

        }
        // 06
        StringBuilder sb = new StringBuilder(); // 결과 문자열
        while (!right.isEmpty()) {
            sb.append(right.pop()); // 오른쪽 스택의 문자를 결과 문자열에 추가
        }

        System.out.println(sb.toString()); // 결과 문자열 출력
        br.close(); // BufferedReader 닫기

    }

}
