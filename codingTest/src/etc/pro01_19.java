package etc;

import java.io.*;
import java.util.*;

public class pro01_19 {

    public static void main(String[] args) throws Exception {

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(bf.readLine(), " ");

        Long sum = 0L;
        sum = Long.parseLong(st.nextToken()) + Long.parseLong(st.nextToken()) + Long.parseLong(st.nextToken());

        System.out.println(sum);
        bf.close();

    }

}
