package etc;

import java.io.*;
import java.util.*;

public class pro01_08 {
    public static void main(String[] args) throws Exception {

        // 실패~

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Stack<Integer> stack = new Stack<>(); // 오름차순을 담을 스택

        StringBuilder sb = new StringBuilder(); // 출력할 문자열
        int n = Integer.parseInt(br.readLine()); // 입력 개수
        int top = 1; // 스택의 top
        boolean flag = true; // 오름차순인지 확인하는 flag
        stack.push(top);
        for (int i = 0; i < n; i++) {
            int num = Integer.parseInt(br.readLine()); // 입력받은 수

            while (flag) {

            }

        }

        if (sb.length() == 0) {
            System.out.println("NO");
        } else {
            System.out.println(sb.toString()); // 스택에 있는 수 출력
        }
        br.close();

    }
}
