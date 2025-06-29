package programers;

import java.util.*;

public class pgm014 {
    /* 17680 캐시 */
    public static void main(String[] args) {

    }

    public int soulution(int cacheSize, String[] cities) {

        int time = 0;
        LinkedList<String> cache = new LinkedList<>();

        for(String city : cities) {
            String cityLower = city.toLowerCase(); // 대소문자를 구분하지 않는다

            // 캐시에 이미 존재하는 도시일 경우
            if(cache.contains(cityLower)) {
                // Cache hit: 기존 위치 제거 후 맨 뒤에 추가
                cache.remove(cityLower); // 제거
                cache.add(cityLower); // 다시 추가
                time += 1; // 이미 존재하는 도시 >> +1

            } else {// Cache miss(다른 도시일 경우)

                if(cacheSize > 0 && cache.size() == cacheSize) { //0보다 큰데 캐시 용량이 가득 찻다면
                    cache.removeFirst(); // 가장 오래된 캐시(도시)를 제거
                }
                if(cacheSize > 0) { // 제거 후 새로운 도시 add
                    cache.add(cityLower);
                }
                time += 5; // 새로운도시니까 5추가
            }
        }

        return time;
    }

}
