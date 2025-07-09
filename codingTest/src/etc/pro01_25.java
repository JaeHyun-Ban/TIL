package etc;

import java.io.*;
import java.util.*;

public class pro01_25 {

    public static void main(String[] args) throws Exception {

        // 입력받을 정수의 수
        // 정수 입력
        // 입력받은 정수 중 정수v의 개수
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[n];
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        int v = Integer.parseInt(br.readLine());

        int count = 0;
        for (int i = 0; i < n; i++) {
            if (Integer.parseInt(st.nextToken()) == v)
                count++;

        }

        System.out.println(count);
        br.close();

    }

}
