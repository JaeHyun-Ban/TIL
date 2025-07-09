package etc;

import java.io.*;
import java.util.*;

public class pro01_11 {
    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        Stack<Integer> stack = new Stack<>();

        for (int i = 0; i < n; i++) {
            if (st.hasMoreTokens()) { // st가 비어있지 않다면
                int num = Integer.parseInt(st.nextToken());
                if (!stack.isEmpty()) {
                    // 더하면 짝 수 일 떄
                    if ((stack.peek() + num) % 2 == 0) {
                        stack.pop();
                    } else {
                        stack.push(num);
                    }
                } else { // 비어있다면
                    stack.push(num);
                }
            }
        }
        System.out.println(stack.size());
        br.close();

    }
}
