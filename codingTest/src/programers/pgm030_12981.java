package programers;

import java.util.*;

public class pgm030_12981 {

    public int[] solution(int n, String[] words) {
        Set<String> used = new HashSet<>(); // 중복체크용
        used.add(words[0]); // 첫 단어

        for(int i = 1; i < words.length; i++){
            String prev = words[i - 1];
            String curr = words[i];

            // 끝말잇기 실패 조건
            boolean isWrong = used.contains(curr)
                    || prev.charAt(prev.length()-1) != curr.charAt(0);
        }
        return new int[0];
    }


    public int[] solution02(int n, String[] words) {
        // 매개변수: 사람의수, 순서대로 말한 단어
        // 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지
        int[] answer = new int[2];
        Map<String, Integer> wordMap = new HashMap<>(); // 중복단어체크
        int cnt = 0;
        String end = "";

        for (int i = 0; i < words.length; i++) {
            // 단어를 사용
            String word = words[i];

            // 최초가 아니라면 끝단어와 첫번째 단어가 이어지는지 확인
            if (cnt > 0) {
                if (!end.equals(word.substring(0, 1))) {
                    break;
                }
            }
            cnt++;
            // 중복단어가 없는경우
            if (!wordMap.containsKey(word)) {
                wordMap.put(word, wordMap.getOrDefault(word, 0) + 1);
                int len = word.length();
                end = word.substring(len - 1, len);
            }
            // 중복단어가 존재하는 경우
            else {
                break;
            }

        }
        int num = cnt % n == 0 ? 1 : cnt % n;
        System.out.println("cnt: " + cnt);
        System.out.println("num: " + num);

        answer[0] = num;
        answer[1] = cnt / n;
        return answer;
    }

}