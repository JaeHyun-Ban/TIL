package etc;

import java.io.*;
import java.util.*;

public class pro01_17 {

    public static void main(String[] args) throws Exception {

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(bf.readLine()); // 불기 연도
        int m = n - 543; // 불기 연도에서 543을 빼면 서기 연도가 된다.

        System.out.println(m);
        bf.close();

    }

}
