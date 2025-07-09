package etc;

import java.io.*;
import java.util.*;

public class pro01_28_nnnn {

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        boolean[] classRoom = new boolean[31]; // 31까지 학생

        for (int i = 0; i < 28; i++) {
            int num = Integer.parseInt(br.readLine());
            classRoom[num] = true; // 제출한 학생
        }

    }

}
