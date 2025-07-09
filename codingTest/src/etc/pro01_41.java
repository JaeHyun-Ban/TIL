package etc;

import java.io.*;
import java.util.*;

public class pro01_41 {

    public static void main(String[] args) throws Exception {

        // 배수와 약수
        // 0 0 이 입력받기 전까지는 반복을 입력을 진행
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();
        boolean endFlag = true;

        while (endFlag) {
            st = new StringTokenizer(br.readLine(), " "); // 공백으로 구분
            int num01 = Integer.parseInt(st.nextToken());
            int num02 = Integer.parseInt(st.nextToken());

            if (num01 == 0 && num02 == 0) {
                endFlag = false;
                continue;
            }
            // 첫번째가 두번째 숫자의 ㅁㅁ다를 찾기
            // 약수, 배수, 약수나 배수가 아닌 3가지 경우
            sb.append(calc(num01, num02));

        }

        System.out.println(sb.toString());
        br.close();

    }

    static String calc(int num01, int num02) {
        int flag = 0;
        int rtn = 0; // 0:(num01>num02)

        if (num01 > num02) {
            rtn = num01 % num02;
            flag = 0;
        } else {
            rtn = num02 % num01;
            flag = 1;
        }

        if (rtn == 0) { // 배수
            if (flag == 0)
                return "multiple\n";
            else
                return "factor\n";
        } else {
            return "neither\n";
        }
    }
}
