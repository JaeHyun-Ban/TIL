package programers;

import java.util.*;

public class pgm021_12933 {

    public long solution(long n) throws Exception {
        // 1. char배열로 변환
        char[] c = String.valueOf(n).toCharArray();

        // 내림차순으로 정렬
        Arrays.sort(c);
        StringBuilder sb = new StringBuilder(new String(c));
        sb.reverse(); // 내림차순 정렬

        long answer = Long.parseLong(sb.toString());
        return answer;
    }
}
