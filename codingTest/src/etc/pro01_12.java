package etc;

import java.io.*;
import java.util.*;

public class pro01_12 {

    static int n; // n까지
    static List<List<Integer>> result = new ArrayList<>(); // 완성된 경우의 수 를 담는 리스트
    static Stack<String> stack = new Stack<>();

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        n = Integer.parseInt(br.readLine());

        dfs(new Stack<>(), new ArrayList<>(), 1); // 스택, 배열, 최초시작 1

        for (int i = result.size() - 1; i >= 0; i--) {
            for (int j = 0; j < result.get(i).size(); j++) {
                System.out.print(result.get(i).get(j) + " ");
            }
            System.out.println();
        }

        br.close();
    }

    // DFS메서드
    // 백트래킹 >> 동굴탐험을 이미지 화 하면 좋음
    static void dfs(Stack<Integer> stack, List<Integer> output, int nextPush) {

        // 수열이 n개 완성되었을 때
        // 재귀함수는 첫번째 조건문에 탈출 조건이 있어야 한다.
        // 탈출 조건이 없으면 무한루프에 빠진다.
        // - 기저조건: 재귀를 멈출조건을 반드시 지정해야 한다
        // - 점진적 접근 : 매번 재귀 시 마다 종료조건에 점점 가까워져야 한다
        // - 자기 호출 : 함수 내부에서 자기 자신을 호출해야 재귀구조가 성립된다.
        if (output.size() == n) {
            result.add(new ArrayList<>(output)); // 리스트에 추가
            return;
        }

        // 아직 n개가 완성되지 않았을 떄
        if (nextPush <= n) {
            stack.push(nextPush);
            dfs(stack, output, nextPush + 1); // dfs실행 >> n개 까지 dfs 재귀 진행
            stack.pop(); // 백트래킹
        }

        // 스택이 비어있지 않다면
        if (!stack.isEmpty()) {
            int top = stack.pop();
            output.add(top); // 스택의 top을 output에 추가
            dfs(stack, output, nextPush);
            output.remove(output.size() - 1); // 백트래킹
            stack.push(top); // 스택에 다시 추가

        }
    }
}
