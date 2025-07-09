package programers;
import java.util.*;

public class pgm027_131704 {

    public static int solution02(int[] order) {

        // 박스는 1,2,3...순서대로 들어옴
        // order는 택배기사가 받고싶은 박스 순서
        // 순서와 맞지않는다면 보조벨트에 대기 >> Stack형식
        Stack<Integer> stack = new Stack<>();
        int currentBox = 1; // 박스는 1부터 순서대로 들어온다
        int i = 0;

        while (true) {
            // 박스범위를 넘었다면 break
            if (i >= order.length) {
                break;
            }
            // 박스 순서와 택배기사가 원하는 순서가 일치하면 i++
            if (currentBox == order[i]) {
                currentBox++;
                i++;
            }
            // 보조벨트의 박스와 순서가 일치하면 싣기
            else if (!stack.isEmpty() && stack.peek() == order[i]) {
                stack.pop(); // 보조벨트에서 꺼내고
                i++;
            }
            // 싣지못한 상자들을 보조벨트에 저장
            else if (currentBox <= order.length) {
                stack.push(currentBox++);
            } else {
                break;
            }
        }

        return i;
    }

    public static void main(String[] args) {
        int[] arr = { 4, 3, 1, 2, 5 };
        System.out.println(solution02(arr));
    }

    public int solution(int[] order) {
        int answer = 0;
        Stack<Integer> stack = new Stack<>(); // 보조 벨트
        int currentBox = 1;
        int i = 0;

        while (true) {
            if (i > order.length)
                break;

            // 박스 싣는 순서와 박스가 일치하면 싣기
            if (currentBox == order[i]) {
                currentBox++;
                i++;
            }
            // 보조 벨트의 박스가 순서와 일치하면 싣기
            else if (!stack.isEmpty() && stack.peek() == order[i]) {
                stack.pop();
                i++;
            }
            // 이건뭐지
            // 아직 트럭에 못 실은 상자를 보조 스택에 임시 저장 (단, 전체 상자 수 n을 넘지 않도록 제한)
            else if (currentBox <= order.length) {
                stack.push(currentBox);

            } else { // 처리할 상자가 없음
                break;
            }

        }

        return answer;
    }
}
