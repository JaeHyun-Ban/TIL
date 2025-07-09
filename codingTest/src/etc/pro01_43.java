package etc;

import java.io.*;
import java.util.*;

public class pro01_43 {

    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        if (n == 1) {
            n = 2;
            System.out.println(n); // 수행 횟수: 항상 1회
        } else {
            System.out.println(n * n);
        }
        System.out.println(2); // 시간 복잡도: O(1) = 차수 0
        sc.close();

    }

}
