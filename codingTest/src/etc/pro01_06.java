package etc;

import java.io.*;
import java.util.*;

public class pro01_06 {
    public static void main(String[] args) throws Exception {
        // 이번학기 3분
        // 만점 100점, 3분 걸림
        // 과제없음
        // 과제없음

        // 이번학기 5분
        // 10점만점, 3분
        // 과제없음
        // 100점만점, 2분
        //

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        Stack<Homework> stack = new Stack<>(); // 과제 스택 선언

        int minite = Integer.parseInt(br.readLine()); // 학기 몇분?
        int totalScore = 0; // 점수는 몇점?

        for (int i = 0; i < minite; i++) {
            String command = br.readLine();
            String[] commandSplit = command.split(" "); // 공백으로 나누기
            switch (commandSplit[0]) {
                case "1": // 과제 있음
                    int score = Integer.parseInt(commandSplit[1]); // 점수
                    int time = Integer.parseInt(commandSplit[2]); // 시간
                    stack.push(new Homework(score, time)); // 과제 객체 생성 후 스택에 저장

                    break;
                case "0": // 과제 없음
                    // 없으면 아무것도 안함
                    break;

                default:
                    break;
            }

            if (!stack.isEmpty()) { // 과제를 하는 중...
                Homework current = stack.peek(); // 스택의 제일 위에 있는 과제(가장 마지막에 들어온 과제)
                current.time--; // 과제 시간 감소

                if (current.time == 0) { // 과제 시간이 다 되면
                    totalScore += current.score; // 점수 추가
                    stack.pop(); // 완료 과제 삭제
                }

            }

        }
        System.out.println(totalScore); // 총 점수 출력
        br.close(); // BufferedReader 닫기

    }

    static class Homework {
        int score; // 점수
        int time; // 시간

        Homework(int score, int time) { // 객체 선언
            this.score = score;
            this.time = time;
        }
    }

}
