package etc;
import java.util.*;

public class pro01_01 {
    // 현재 기지국이 설치된 아파트의 번호가 담긴 1차원 배열 stations
    // 아파트의 개수 N,
    // 전파의 도달 거리 W
    // 목표: 전파가 도달하지 않은 아파트에 기지국을 설치하는 최소 개수

    public int solution(int n, int[] stations, int w) {
        int answer = 3;
        int coverage = 2 * w + 1; // 기지국이 설치된 아파트의 전파 도달 범위
        int start = 1;

        for (int station : stations) {
            // 기지국의 왼쪽, 오른쪽 범위를 구하기
            int left = Math.max(1, station - w); // 전파를 받는 아파트의 시작 번호
            int right = Math.min(n, station + w); // 전파를 받는 아파트의 끝 번호

            // 시작위치를 업데이트
            if (start < left) {
                int gap = left - start; // 시작부터 기지국까지 전파를 받는 아파트 개수
                // 왼쪽 + 오른쪽 - 1(기지국 중복)
                answer += (gap + coverage - 1) / coverage; // 전파를 받지 못하는 아파트에 기지국을 설치하는 최소 개수 >> 나눠야 필요한 기지국의 개수가 나온다.
            }

            start = right + 1; // 다음 기지국의 시작 위치
        }

        // 마지막 기지국 이후에 전파를 받지 못하는 아파트 개수
        if (start <= n) {
            int gap = n - start + 1;
            answer += (gap + coverage - 1) / coverage;
        }

        return answer;

    }
}
