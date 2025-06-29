package programers;

import java.util.*;


public class pg01 {
    
    public static void main(String[] args) {
        
        /*
         * 제목: 점프와 순간 이동
         * # 아이언 슈트
         * - 건전지 사용
         * - k칸 점프 or 현재까지 온 거리 * 2 -> 이동
         * ## 점프
         * - k만큼 건전지 사용
         * ## 순간이동
         * - 건전지 소모 x
         * 요구사항
         * - n거리를 이동하기 위한 가장 효율적인 건전지 사용
         */
        int n = 5000;
        solution(n);

    }

    public static int solution(int n){
        int answer = 0;

        //최적화를 구해야함
        while (n > 0) {
            //2로 나눈 나머지가 0이라면
            if(n % 2 == 0){
                n = n / 2;
            } else {
                n--;     //한칸 이동
                answer++;//이동거리 추가
            }
        }
        return answer;
    }
}
