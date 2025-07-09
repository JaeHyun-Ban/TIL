package etc;

import java.io.*;
import java.util.*;

public class pro01_23 {

    public static void main(String[] args) throws Exception {

        // 1. 총금액
        // 2. 구매한 물건의 종류
        // 3. 가격, 개수
        // 총금액과 일치하는지?
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int total = Integer.parseInt(br.readLine()); // 총금액
        int n = Integer.parseInt(br.readLine()); // 구매한 물건의 종류
        int sum = 0; // 총금액과 일치하는지?
        for (int i = 0; i < n; i++) {
            StringTokenizer st2 = new StringTokenizer(br.readLine(), " ");
            int price = Integer.parseInt(st2.nextToken()); // 가격
            int count = Integer.parseInt(st2.nextToken()); // 개수
            sum += price * count;
        }
        if (total == sum) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
        br.close();

    }

}
