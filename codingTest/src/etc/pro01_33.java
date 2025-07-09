package etc;

import java.io.*;
import java.util.*;

public class pro01_33 {

    public static void main(String[] args) throws Exception {

        // 소문자로만 이루어진 단어 S
        // 각각 알파벳이 단어에 포함되어있는경우 처음 등장하는 위치
        // 포함되지 않는 경우 -1을 출력
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine(); // 단어
        StringBuilder sb = new StringBuilder();

        // 아스키코드 사용
        // 97 ~ 122
        for (int i = 0; i < 26; i++) {
            char c = (char) (i + 97); // a ~ z
            int idx = str.indexOf(c); // 처음 등장하는 위치 >> 없을 시 -1을 리턴
            if (idx == -1) {
                sb.append(-1).append(" ");
            } else {
                sb.append(idx).append(" ");
            }
        }
        System.out.println(sb.toString());
        br.close();
    }

}
