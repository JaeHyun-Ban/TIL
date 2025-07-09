import java.io.*;
import java.util.*;

import org.xml.sax.InputSource;

class pro01_37 {

    public static void main(String[] args) throws Exception {

        // 다이얼 전화기를 사용
        // 1 >> 2초, 2 >> 3초...
        // 이해가 안됨

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine().toUpperCase();

        int time = 0;

        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);

            // 다이얼 범위 >> 아스키 코드로 계산
            if (c >= 'A' && c <= 'C') {
                time += 3;
            } else if (c >= 'D' && c <= 'F') {
                time += 4;
            } else if (c >= 'G' && c <= 'I') {
                time += 5;
            } else if (c >= 'J' && c <= 'L') {
                time += 6;
            } else if (c >= 'M' && c <= 'O') {
                time += 7;
            } else if (c >= 'P' && c <= 'S') {
                time += 8;
            } else if (c >= 'T' && c <= 'V') {
                time += 9;
            } else if (c >= 'W' && c <= 'Z') {
                time += 10;
            }
        }
        System.out.println(time);
        br.close();

    }
}
