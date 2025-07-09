import java.io.*;
import java.util.*;

public class pro01_32 {

    public static void main(String[] args) throws Exception {

        // N개의 숫자가 공백없이 쓰여있다
        // 숫자를 모두 합해서 출력
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = null;

        int n = Integer.parseInt(br.readLine());
        String str = br.readLine(); // 숫자 입력받음
        // st = new StringTokenizer(br.readLine(), ""); // 공백없이
        int sum = 0;

        for (int i = 0; i < n; i++) {
            sum += str.charAt(i) - '0'; // 문자 -> 숫자
        }

        System.out.println(sum);
        br.close();
    }

}
