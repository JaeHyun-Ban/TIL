package etc;

import java.io.*;
import java.util.*;

public class pro01_15 {

    public static void main(String[] args) throws Exception {

        // 성화는 욕심쟁이라서 해당 일을 한 동안 중 가장 일급이 작을 때를 기준으로 급여를 지급한다.
        // >> 연속된 일 구간 중 최저 일급 x 일수의 최대값을 구하는 문제

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bf.readLine()); // 일을 할 수 있는 날
        StringTokenizer st = new StringTokenizer(bf.readLine(), " "); // 일할 수 있는날의 일급

        int[] arr = new int[n + 1]; // 마지막에 0을 붙여 계산 마무리용

        int top = 0; // 가장 높은 일급
        int result = 0; // 퇴사 후 받는 급여

        for (int i = 0; i < n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }
        arr[n] = 0; // 마지막에 0을 붙여 계산 마무리용

    }

}
