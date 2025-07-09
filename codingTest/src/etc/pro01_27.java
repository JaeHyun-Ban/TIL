import java.io.*;
import java.util.*;

class pro01_27 {

    public static void main(String[] args) throws Exception {

        // 1. 바구니 N개
        // 2. 바구니는 1~N까지 번호
        // 3. M번 공을 바꿀예정
        // 4. 바구니 2개선택 후 두 바구니에 들어있는 공을 서로 교환
        // 5. 공을 바꾼 이후에 각 바구니에 어떤 공이 들어있는지?

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();
        st = new StringTokenizer(br.readLine(), " ");

        int[] basket = new int[Integer.parseInt(st.nextToken()) + 1];
        int m = Integer.parseInt(st.nextToken()); // 공을 바꿀 횟수
        for (int i = 1; i < basket.length; i++) {
            basket[i] = i; // 바구니에 공 번호 넣기
        }

        // 공바꾸기
        for (int i = 1; i < m + 1; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int num1 = Integer.parseInt(st.nextToken()); // 바구니 1
            int num2 = Integer.parseInt(st.nextToken()); // 바구니 2

            int tmp = basket[num1];
            basket[num1] = basket[num2];
            basket[num2] = tmp;
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
