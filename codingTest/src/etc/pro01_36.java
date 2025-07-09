import java.io.*;
import java.util.*;

class pro01_36 {

    public static void main(String[] args) throws Exception {

        // 세 자리 수 두개를 작성
        // 크기가 큰 수를 말해라
        // but 상수는 수를 거꾸로 읽는다.

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = null;
        st = new StringTokenizer(br.readLine(), " ");

        int num01 = Integer.parseInt(replace(st.nextToken()));
        int num02 = Integer.parseInt(replace(st.nextToken()));

        if (num01 > num02) {
            System.out.println(num01);
        } else {
            System.out.println(num02);
        }
        br.close();
    }

    static String replace(String str) {

        String c1 = str.charAt(2) + "";
        String c2 = str.charAt(1) + "";
        String c3 = str.charAt(0) + "";

        String rtn = c1 + c2 + c3;

        return rtn;
    }
}
