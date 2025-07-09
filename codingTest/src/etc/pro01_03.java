package etc;
import java.util.*;

public class pro01_03 {

    public int[] solution(int[] progresses, int[] speeds) {
        int[] answer = {};

        // 기능은 100%일 때 서비스에 반영 가능
        // 개발속도는 모두 다르다
        // 뒤에 있는 기능은 앞에 있는 기능이 배포될 때까지 기다리거나 함께 배포된다.
        // 각 배포마다 몇개의 기능이 배포되는지 값을 리턴
        /*
         * progresses speeds return
         * [93, 30, 55] [1, 30, 5] [2, 1]
         * [95, 90, 99, 99, 80, 99] [1, 1, 1, 1, 1, 1] [1, 3, 2] >> [5,10,1,1,20,1]
         */
        // 1. 각 기능의 배포일을 구한다.
        // 2. 배포일을 기준으로 기능을 묶는다.
        // 3. 배포일이 같은 기능은 함께 배포된다
        // 4. 배포일이 다르면 배포일을 기준으로 기능을 묶는다.
        // 5. 배포일이 같은 기능은 함께 배포된다.

        Queue<Integer> queue = new LinkedList<>(); // 배포일을 기준으로 기능을 묶기 위한 스택
        for (int i = 0; i < progresses.length; i++) {
            // 배포일 = (100 - progresses[i]) / speeds[i] + 1;
            queue.add((int) Math.ceil((100 - progresses[i]) / (double) speeds[i])); // 올림
        }

        int releaseCnt = 1;
        while (!queue.isEmpty()) {
            int releaseDay = queue.poll(); // 1번꺼내고

            if (releaseDay >= queue.peek()) { // 1번과 2번을 비교
                releaseCnt++;
            } else {
                answer = Arrays.copyOf(answer, answer.length + 1);
                answer[answer.length - 1] = releaseCnt;
                releaseCnt = 1;
            }

        }
        return answer;
    }
}
