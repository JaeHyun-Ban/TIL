package etc;

import java.io.*;
import java.util.*;

public class pro01_39 {

    public static void main(String[] args) throws Exception {

        // 체스는 킹1, 퀸1 룩2, 비숍2, 나이트2, 폰8 개로 구성되어있음
        // >> 올바른 개수
        // 체스 피스의 값이 주어질 때 더하거나 빼야 올바른 세트가 되는지 작성

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine(), " ");
        StringBuilder sb = new StringBuilder();

        // 킹 1
        int king = Integer.parseInt(st.nextToken());
        sb.append(1 - king).append(" ");
        // 퀸 1
        int queen = Integer.parseInt(st.nextToken());
        sb.append(1 - queen).append(" ");
        // 룩 2
        int rook = Integer.parseInt(st.nextToken());
        sb.append(2 - rook).append(" ");
        // 비숍 2
        int bishop = Integer.parseInt(st.nextToken());
        sb.append(2 - bishop).append(" ");
        // 나이트2
        int night = Integer.parseInt(st.nextToken());
        sb.append(2 - night).append(" ");
        // 폰8
        int pawn = Integer.parseInt(st.nextToken());
        sb.append(8 - pawn).append(" ");

        System.out.println(sb.toString());
        br.close();

    }
}
