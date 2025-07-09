package etc;

import java.io.*;
import java.util.*;

public class pro01_29 {

    public static void main(String[] args) throws Exception {

        // 1. 단어 S가 주어지
        // 2. i번째 글자를 출력
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String str = br.readLine();
        char c = str.charAt(Integer.parseInt(br.readLine()) - 1); // 0부터 시작

        System.out.println(c);
    }

}
