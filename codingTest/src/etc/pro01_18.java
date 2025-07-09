package etc;

import java.io.*;
import java.util.*;

public class pro01_18 {

    public static void main(String[] args) throws Exception {

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        String num01 = bf.readLine(); // 곱셈1
        String num02 = bf.readLine(); // 곱셈2

        int num1 = (num02.charAt(2) - '0') * Integer.parseInt(num01);
        int num10 = (num02.charAt(1) - '0') * Integer.parseInt(num01);
        int num100 = (num02.charAt(0) - '0') * Integer.parseInt(num01);

        StringBuilder sb = new StringBuilder();

        sb.append(num1).append("\n");
        sb.append(num10).append("\n");
        sb.append(num100).append("\n");
        sb.append(num1 + num10 * 10 + num100 * 100).append("\n");
        System.out.println(sb.toString());
        bf.close();
    }

}
