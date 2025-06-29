package programers;

public class pgm010 {
    /* 12945 피보나치 수 */
    public static void main(String[] args) {

    }
    // 효진이는 한번에 1칸 또는 2칸을 뛸 수 있다.
    public int soulution(int n) {
        int answer = 0;

        // 피보나치 수열의 1,2는 무조껀 1이다
        if(n == 1) return 1;
        if(n == 2) return 1;

        int[] dp = new int[n+1];
        dp[1] = 1;
        dp[2] = 1;

        // 3부터 점화식을 시작
        for(int i = 3; i <= n; i++) {
            dp[i] = (dp[i-1] + dp[i-2]) % 1234567;
        }

        answer = dp[n];

        return answer;
    }

}
