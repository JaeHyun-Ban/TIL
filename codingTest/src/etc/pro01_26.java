package etc;

import java.io.*;
import java.util.*;

public class pro01_26 {

    public static void main(String[] args) throws Exception {

        // 1. 바구니 N개 1~N까지 번호, M번 공을 넣예정
        // 2. i번 바구니부터 j번 바구니까지에 k번 번호가 적혀져 있는 공을 넣는다
        // >> 1번 바구니부터 N번 바구니에 들어있는 공의 번호를 공백으로 구분해 출력한다. 공이 들어있지 않은 바구니는 0을 출력한다.
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        st = new StringTokenizer(br.readLine(), " ");
        int[] basket = new int[Integer.parseInt(st.nextToken()) + 1];
        int n = Integer.parseInt(st.nextToken()); // 공을 넣을 예정 숫자

        for (int num : basket) {
            num = 0;
        }

        for (int i = 0; i < n; i++) {
            st = new StringTokenizer(br.readLine(), " "); // 입력받기
            int min = Integer.parseInt(st.nextToken()); // 바구니 시작 번호
            int max = Integer.parseInt(st.nextToken()); // 바구니 끝 번호
            int num = Integer.parseInt(st.nextToken()); // 공 번호
            for (int j = min; j <= max; j++) {
                basket[j] = num; // 바구니에 공 번호 넣기
            }
        }

        for (int i = 1; i < basket.length; i++) {
            if (i == basket.length - 1) {
                sb.append(basket[i]);
            } else {
                sb.append(basket[i]).append(" "); // 바구니에 들어있는 공 번호 출력
            }
        }

        System.out.println(sb.toString());
        br.close();
    }

}
