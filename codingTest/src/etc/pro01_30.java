package etc;

import java.io.*;
import java.util.*;

public class pro01_30 {

    public static void main(String[] args) throws Exception {

        // 1. 단어가 주어짐
        // 2. 단어의 길이를 출력
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine(); // 단어를 입력받음
        System.out.println(str.length()); // 단어의 길이
        br.close();
    }

}
