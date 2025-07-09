package etc;

import java.io.*;
import java.util.*;

public class pro01_16 {

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        sb.append(br.readLine());
        sb.append("??!");

        System.out.println(sb.toString());
        br.close();
    }

}
