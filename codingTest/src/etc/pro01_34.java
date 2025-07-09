package etc;

import java.io.*;
import java.util.*;

public class pro01_34 {

    public static void main(String[] args) throws Exception {

        // 문자열 S를 입력받음
        // 문자를 R번 반복
        // 새 문자열 P를 만들고 출력
        // ex) 3 ABC >> AAABBBCCC
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int n = Integer.parseInt(br.readLine());

        for (int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine(), " ");
            int loop = Integer.parseInt(st.nextToken()); // 반복
            String str = st.nextToken(); // 문자열

            for (int j = 0; j < str.length(); j++) {
                for (int k = 0; k < loop; k++) {
                    sb.append(str.charAt(j)); // 반복
                }
            }
            sb.append("\n"); // 줄바꿈
        }

        System.out.println(sb.toString());
        br.close();
    }

}
