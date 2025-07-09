package etc;

import java.io.*;
import java.util.*;

public class pro01_42 {

    public static void main(String[] args) throws Exception {

        // 배수와 약수
        // 0 0 이 입력받기 전까지는 반복을 입력을 진행
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int with = Integer.parseInt(br.readLine());
        int length = Integer.parseInt(br.readLine());

        System.out.println(with * length);

    }

}
