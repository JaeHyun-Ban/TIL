package etc;

import java.io.*;
import java.util.*;

public class pro01_35 {

    public static void main(String[] args) throws Exception {

        // 영어 대소문자, 공백으로 이루어진 문자열이 주어짐
        // 문자열에 몇 개의 단어가 있을 까?
        // >> 공백으로 하나씩 세면 될 듯
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = null;

        st = new StringTokenizer(br.readLine().trim(), " ");
        int cnt = 0;

        while (st.hasMoreTokens()) { // 토큰검사
            st.nextToken(); // 토큰꺼내긴
            cnt++;
        }
        System.out.println(cnt);
        br.close();

    }

}
