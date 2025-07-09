package programers;
import java.util.Stack;

public class pgm028_154539 {
    public int[] solution(int[] numbers) {
        int[] answer = {};

        Stack<Integer> stack = new Stack<>();// 스택
        int[] ret = new int[numbers.length];// 배열의 길이만큼

        for (int i = 0; i < numbers.length; i++) {
            // 하강직선일 때는 push
            if (stack.isEmpty() || numbers[i] < numbers[i - 1]) {
                stack.push(i);
            } else {
                while (!stack.isEmpty() && numbers[stack.peek()] < numbers[i]) {
                    ret[stack.pop()] = numbers[i];
                }
                stack.push(i);
            }
        }
        // 나머지는 -1
        while (!stack.isEmpty()) {
            ret[stack.pop()] = -1;
        }
        answer = ret;

        return answer;
    }
}
