package etc;

import java.io.*;
import java.util.*;

public class pro01_04 {
    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer st = null;

        int n = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine());

        int[] p = new int[n];
        for (int i = 0; i < n; i++) {
            p[i] = Integer.parseInt(st.nextToken());
        }

        // 걸리는 시간 오름차순 정렬
        Arrays.sort(p);

        int totalTime = 0; // 총 걸리는 시간
        int sum = 0; // 누적 시간

        for (int i = 0; i < n; i++) {
            sum += p[i]; // 누적 시간
            totalTime += sum; // 총 걸리는 시간
        }

        bw.write(totalTime);
        bw.flush();
        bw.close();

    }

}
