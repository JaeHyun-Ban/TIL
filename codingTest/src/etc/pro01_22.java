package etc;

import java.io.*;
import java.util.*;

public class pro01_22 {

    public static void main(String[] args) throws Exception {

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(bf.readLine(), " ");

        int n1 = Integer.parseInt(st.nextToken());
        int n2 = Integer.parseInt(st.nextToken());
        int n3 = Integer.parseInt(st.nextToken());

        if (n1 == n2 && n2 == n3) { // 3개동일
            System.out.println(10000 + n1 * 1000);
        } else if (n1 == n2 || n2 == n3 || n1 == n3) { // 2개동일
            if (n1 == n2) {
                System.out.println(1000 + n1 * 100);
            } else if (n2 == n3) {
                System.out.println(1000 + n2 * 100);
            } else {
                System.out.println(1000 + n3 * 100);
            }
        } else {
            int max = Math.max(n1, Math.max(n2, n3));
            System.out.println(max * 100);
        }

        bf.close();

    }

}
