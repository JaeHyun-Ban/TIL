package programers;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

public class pgm009 {
    /* 12914 멀리 뛰기 */
    public static void main(String[] args) {

    }
    // 효진이는 한번에 1칸 또는 2칸을 뛸 수 있다.
    public long soulution(int n) {
        long answer = 0;
        // 초기값 n = 1 또는 2가 나오면 바로 값을 반환
        if(n == 1) return 1;
        if(n == 2) return 2;

        // 점화식 구현
        // dp[i]는 i칸까지 도달하는 방법의 수를 의미
        // dp배열의 크기는 n+1로 할당
        long[] dp = new long[n+1];
        dp[1] = 1;
        dp[2] = 2; // 초기값 할당

        // 3부터 점화식으로 n 까지
        for(int i = 3; i <= n; i++) {
            dp[i] = (dp[i-1] + dp[i-2]) % 1234567; // 매단계마다 모듈러 연산??
        }
        answer = dp[n];

        return answer;
    }

}
