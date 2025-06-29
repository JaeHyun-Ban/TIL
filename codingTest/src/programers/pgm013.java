package programers;

import java.util.*;

public class pgm013 {
    /* 42578 의상 */
    public static void main(String[] args) {

    }
    // 효진이는 한번에 1칸 또는 2칸을 뛸 수 있다.
    public int soulution(String[][] clothes) {
        int answer = 1;

        // 경우의 수를 예상하여 공식을 세워야 한다.

        Map<String, Integer> map = new HashMap<>();

        // 의상 종류별 개수 저장
        for(String[] cloth : clothes) {
            String type = cloth[1]; // 의류타입 꺼내기
            map.put(type, map.getOrDefault(type, 0) + 1); // getOrDefault 기억하기
        }

        // 종류별 개수를 하나씩 구하기
        for(int cnt : map.values()) {
            answer *= (cnt + 1); // 종류 * 개수 + 1을 기억
        }
        answer = answer - 1; // 아무것도 입지않은 경우를 제외

        return answer;
    }

}
