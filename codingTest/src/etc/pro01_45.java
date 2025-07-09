package etc;

import java.io.*;
import java.util.*;

public class pro01_45 {

    public static void main(String[] args) throws Exception {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Queue<Integer> que = new LinkedList<>();
        int size = Integer.parseInt(br.readLine());

        for (int i = 0; i < size; i++) {
            que.add(i + 1);
        }

        while (que.size() != 1) {
            que.poll(); // 첫 번째 제거
            que.add(que.poll()); // 두 번째를 마지막으로 이동

        }

        System.out.println(que.peek()); // 최종 출력

    }

}
