package programers;

import java.util.*;

public class pgm015 {
    /* 17680 캐시 */
    public static void main(String[] args) {

    }

    public int soulution(int k, int[] tangerine) {
        // k = tangerine cnt
        // size of tangerine
        Map<Integer, Integer> cnt = new HashMap<>();

        for(int n : tangerine) {
            cnt.put(n, cnt.getOrDefault(n, 0) + 1);
        }

        // 개수를 내림차순으로 정렬
        List<Integer> counts = new ArrayList<>(cnt.values());
        counts.sort(Collections.reverseOrder());

        int result = 0;
        int total = 0;

        for(int count : counts) {
            total += count;
            result++;
            if(total >= k) break;
        }

        return result;
    }

}
