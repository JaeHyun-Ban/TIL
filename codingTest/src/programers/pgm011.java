package programers;

public class pgm011 {
    /* 43105 정수 삼각형 */
    public static void main(String[] args) {

    }
    // 효진이는 한번에 1칸 또는 2칸을 뛸 수 있다.
    public int soulution(int[][] triangle) {
        int height = triangle.length; // 삼각형의 높이
        int[][] dp = new int[height][height];  // 동적계획법

        dp[0][0] = triangle[0][0]; // 꼭대기의 초기값

        for(int i = 1; i < height; i++) {
            for(int j = 0; j <= i; j++){
                if(j == 0) { // 왼쪽 끝  >>> 0 번
                    // 왼쪽 끝 = 이전 왼쪽 끝의 합 + 현재 위치
                    dp[i][j] = dp[i-1][j] + triangle[i][j];
                } else if( j == i) {// [2][2], [3][3] >> 오른쪽끝
                    // 이전 오른쪽 끝의 합 + 현재 위치
                    dp[i][j] = dp[i - 1][j - 1] + triangle[i][j];
                } else { // 그 외 나머지
                    dp[i][j] = Math.max(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j];
                }
            }
        }

        // 마지막 줄에서 최대값을 찾기
        int max = 0;
        for(int i = 0; i < height; i++){
            max = Math.max(max, dp[height-1][i]);
        }


        return max;
    }

}
