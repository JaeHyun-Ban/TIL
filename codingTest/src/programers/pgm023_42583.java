package programers;

import java.util.*;

public class pgm023_42583 {
    public static void main(String[] args) {

    }

    /**
     * 다리를 지나는 트럭
     * https://programmers.co.kr/learn/courses/30/lessons/42583
     * 
     * @param bridge_length 다리 길이
     * @param weight        다리 최대 하중
     * @param truck_weights 트럭 무게 배열
     * @return 모든 트럭이 다리를 건너는 데 걸리는 시간
     */
    public int solution(int bridge_length, int weight, int[] truck_weights) {

        // 트럭이 다리를 지나가는데 최소 몇 초 가 걸리는지 계산

        int answer = 0;
        int time = 0; // 경과 시간
        int currentWeight = 0; // 현재 다리 위의 트럭 무게
        int index = 0; // 현재 트럭 인덱스

        Queue<Integer> que = new LinkedList<>();
        for (int w : truck_weights) {
            que.offer(w);
        }

        while (!que.isEmpty()) {
            time++; // 1. 시간 증가
            currentWeight -= que.poll(); // 2. 다리를 지나간 트럭 무게 빼기

            if (index < truck_weights.length) {
                int nextTruck = truck_weights[index]; // 3. 다음 트럭의 무게

                if (currentWeight + nextTruck <= weight) { // 4. 다리가 견딜 수 있는 무게와 비교
                    que.offer(nextTruck); // 5. 트럭을 다리에 올리기
                    currentWeight += nextTruck; // 6. 다리 위 트럭 무게 증가
                    index++;
                }
            } else {
                que.offer(0); // 7. 트럭을 못올리면 빈공간
            }

        }

        return time;

    }

}
