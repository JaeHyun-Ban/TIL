package etc;

import java.io.*;
import java.util.*;

public class pro01_40 {

    public static void main(String[] args) throws Exception {

        // 돈을 받음
        // 가장 최소한의 거스름돈을 주는 방법
        // 0.25, 0.10, 0.05, 0.01

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int loop = Integer.parseInt(br.readLine());

        for (int i = 0; i < loop; i++) {
            int money = Integer.parseInt(br.readLine());
            int quarter = 0; // 25
            int dime = 0; // 10
            int nickel = 0; // 5
            int penny = 0; // 1

            quarter = money / 25;
            money = money % 25;
            sb.append(quarter).append(" ");
            dime = money / 10;
            money = money % 10;
            sb.append(dime).append(" ");
            nickel = money / 5;
            money = money % 5;
            sb.append(nickel).append(" ");
            penny = money / 1;
            money = money % 1;
            sb.append(penny).append("\n");
        }
        System.out.println(sb.toString());
        br.close();
    }
}
