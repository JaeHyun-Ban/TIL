package etc;

import java.io.*;
import java.util.*;

public class pro01_38 {

    public static void main(String[] args) throws Exception {

        // 입력은 최대 100줄
        // 알파벳 소문자, 대문자, 공백, 숫자로만 이루어져있다.
        // 100글자를 넘지 않음
        // 빈줄은 주어지지 않음
        // 공백시작 x, 공백종료 x

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line;

        // EOF(End of File)까지 반복
        // >> 계속입력할 떄까지 받아야한다 >> 그렇군..
        while ((line = br.readLine()) != null) {
            System.out.println(line);
        }
        br.close();
    }
}
