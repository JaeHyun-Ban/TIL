package etc;

import java.io.*;
import java.util.*;

public class pro01_31 {

    public static void main(String[] args) throws Exception {

        // 1. 문자열이 주어짐
        // 2. 문자열의 첫 글자와 마지막 글자를 출력
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int cnt = Integer.parseInt(br.readLine());

        for (int i = 0; i < cnt; i++) {
            String str = br.readLine(); // 단어를 입력받음
            String first = str.substring(0, 1); // 첫 글자
            String last = str.substring(str.length() - 1); // 마지막 글자
            if (i == cnt - 1) {
                sb.append(first).append(last);
            } else {
                sb.append(first).append(last).append("\n");
            }
        }
        System.out.println(sb.toString());
    }

}
