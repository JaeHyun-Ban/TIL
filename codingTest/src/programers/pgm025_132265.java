package programers;
import java.util.*;

public class pgm025_132265 {

    public int solution(int[] topping) {

        // 전체를 놓고 왼쪽으로 하나씩 자르는 크기를 늘려가며 양쪽을 비교

        int answer = 0;
        int n = topping.length;
        Map<Integer, Integer> rightMap = new HashMap<>(); /// 전체 토핑
        Set<Integer> lefSet = new HashSet<>(); // 왼쪽 자를 곳

        // 전체 토핑개수를 세기
        for (int t : topping) {
            rightMap.put(t, rightMap.getOrDefault(t, 0) + 1);
        }

        for (int i = 0; i < n - 1; i++) {
            int current = topping[i];

            // 왼쪽 조각 토핑 추가
            lefSet.add(current);

            // 오른쪽 조각에서 토핑 제거
            rightMap.put(current, rightMap.get(current) - 1);
            if (rightMap.get(current) == 0) { // 토핑이 0개면 제거
                rightMap.remove(current);
            }

            // 토핑 종류를 비교
            if (lefSet.size() == rightMap.size()) {
                answer++;
            }
        }
        return answer;

    }

    public int solution02(int[] topping) {
        // 각 조각에 동일한 가짓수의 토핑이 올라가면 공평하게 롤케이크가 나누어진 것으로 생각
        // 롤케이크를 공평하게 자르는 방법의 수를 return

        int cnt = 0; // 방법의 수
        int index = 1;
        // 롤케이크를 자르기
        while (index + 1 != topping.length) {

            int[] arr1 = {};
            int[] arr2 = {};

            int index01 = 0;
            for (int j = 0; j < index; j++) {
                arr1[index01] = topping[j];
                index01++;
            }
            int index02 = 0;
            for (int k = index + 1; k < index; k++) {
                arr2[index02] = topping[k];
            }

            arr1 = Arrays.stream(arr1).distinct().toArray();
            arr2 = Arrays.stream(arr2).distinct().toArray();

            if (arr1.length == arr2.length) {
                cnt++;
            }
            index++;
        }

        return cnt;
    }
}