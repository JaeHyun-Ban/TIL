package etc;

import java.io.*;
import java.util.*;

public class pro01_44 {

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Stack<Integer> stack = new Stack<>();
        StringBuilder sb = new StringBuilder(); // 마지막 출력용
        int n = Integer.parseInt(br.readLine());

        for (int i = 0; i < n; i++) {
            String[] input = br.readLine().split(" ");
            switch (input[0]) {
                case "1": // 스택에 넣기
                    stack.push(Integer.parseInt(input[1]));
                    break;
                case "2": // 있으면 빼고 출력 >> pop
                    sb.append(stack.isEmpty() ? -1 : stack.pop()).append("\n");
                    break;
                case "3": // 정수 개수 >> size
                    sb.append(stack.size()).append("\n");
                    break;
                case "4": // 비어있을 때
                    sb.append(stack.isEmpty() ? 1 : 0).append("\n");
                    break;
                case "5": // 맨위
                    sb.append(stack.isEmpty() ? -1 : stack.peek()).append("\n");
                    break;
                default:
                    break;
            }

        }

        System.out.println(sb); // 최종 출력

    }

}
