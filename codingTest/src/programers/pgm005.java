package programers;


public class pgm005 {
    /* 12924 */
    public static void main(String[] args) {

    }

    public int soulution(int n) {
        // 연속된 자연수로 n을 표현하는 방법들의
        // n = x + (x+1) + ... + (x + k - 1)
        int answer = 0;

        for(int i = 1; i * (i - 1) / 2 < n; i++) {
            int num = n - i * (i-1) / 2;
            if(num % i == 0) {
                answer++;
            }
        }


        return answer;
    }

}
