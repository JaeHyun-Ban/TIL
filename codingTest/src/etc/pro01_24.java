package etc;

import java.io.*;
import java.util.*;

public class pro01_24 {

    public static void main(String[] args) throws Exception {

        // 1. long int는 4바이트 정수까지 저장
        // 2. long long int는 8바이트 정수까지 저장
        // 3. long long long int는 12바이트
        // 4. long long long long int는 16바이트 정수까지 저장
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int n = Integer.parseInt(br.readLine()); // 정수
        int cnt = n / 4;

        for (int i = 0; i < cnt; i++) {
            sb.append("long ");
        }
        sb.append("int");
        System.out.println(sb.toString());
        br.close();

    }

}
