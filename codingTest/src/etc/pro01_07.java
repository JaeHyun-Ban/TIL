package etc;

import java.io.*;
import java.util.*;

public class pro01_07 {
    public static void main(String[] args) throws Exception {
        // N개의 막대기에 대한 높이 정보가 주어질 때,
        // 오른쪽에서 보아서 몇 개가 보이는지를 알아내는 프로그램을 작성하려고 한다.

        // 01 막대기의 수
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        Stack<Integer> input = new Stack<>(); // 입력받은 막대기

        // 02 n개의 막대기 입력
        for (int i = 0; i < n; i++) {
            input.push(Integer.parseInt(br.readLine()));
        }

        // 03 막대기 보이는 개수
        Stack<Integer> output = new Stack<>(); // 보이는 막대기
        int max = 0; // 가장 높은 막대기
        while (!input.isEmpty()) {
            int height = input.pop(); // 막대기 높이

            if (height > max) {
                max = height;
                output.push(height); // 보이는 막대기
            }
        }
        System.out.println(output.size());
        br.close();
    }
}
