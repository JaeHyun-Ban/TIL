package programers;

import java.sql.Array;
import java.util.*;

public class pgm012 {
    /* 42586 기능개발 */
    public static void main(String[] args) {

    }
    // 효진이는 한번에 1칸 또는 2칸을 뛸 수 있다.
    public int[] soulution(int[] progresses, int[] speeds) {
        // 각 프로그램의 남은 기간을 구해서 문제를 해결해보자
        List<Integer> answer = new ArrayList<>();

        Queue<Integer> days = new LinkedList<>();
        for(int i = 0; i < progresses.length; i++){
            // 반올림으로 남은기간을 계산
            int remain = (int)Math.ceil((double) (100 - progresses[i]) / speeds[i]);
            days.offer(remain);
        }
        // 배포할 그룹 만들기
        int current = days.poll();
        int count = 1;

        while (!days.isEmpty()) {
            if(days.peek() <= current) {
                count++;
                days.poll();
            } else {
                // 앞 작업이 끝나지 않았다면 다음 배포
                answer.add(count);
                // 초기값 세팅
                current = days.poll();
                count = 1;
            }
        }
        answer.add(count); // 마지막 배포도 추가

        // 배열로 변환
        return answer.stream().mapToInt(i -> i).toArray();
    }

}
