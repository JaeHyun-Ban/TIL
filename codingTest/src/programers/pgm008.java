package programers;
import java.util.*;

public class pgm008 {
    /* 43163 단어 변환 */
    public static void main(String[] args) {

    }

    public int soulution(String begin, String target, String[] words) {
        // 그래프 모델링
        // 단어들을 노드로 보고
        // 한 글자만 다른 단어는 연결된 간선
        // begin -> target까지 가장 짧은 경로

        // 흐름 정리
        // BFS큐: 단어, 단계 수 형태로 탐색
        // 한 글자만 다른 단어를 다음 방문 대상으로 큐에 추가
        // 방문처리로 중복을 방지 -> boolean처리하나?
        int count = 0;
        // words에 target이 포함되어있다면 리턴
        if(!Arrays.asList(words).contains(target)) return 0;
        // Word로 생성
        Queue<Word> queue = new LinkedList<>();
        // 방문여부를 체크하는 배열
        // 단어의 길이만큼 생성한다
        boolean[] visited = new boolean[words.length];
        // begin을 큐의 0번째에 넣는다.
        queue.offer(new Word(begin, 0));

        while(!queue.isEmpty()){
            // 가장 최근에 입력된 단어를 꺼내기
            Word current = queue.poll();
            // 현재 단어가 target이라면 현재 단계를 리턴한다.
            if(current.word.equals(target)) {
                return current.step;
            }
            // 모든 단어들과 비교하면서 한 글자만 다른 단어 탐색
            for(int i = 0; i < words.length; i++) {
                // 아직 방문하지 않았고, 한 글자만 차이만 있다면
                // >> 방문 표시
                if(!visited[i] && isOneDiff(current.word, words[i])) {
                    visited[i] = true; // 방문 표시
                    queue.offer(new Word(words[i], current.step + 1));
                }
            }
        }
        // target까지 도달할 수 없다면 0을 리턴
        return 0;
    }
    // 두 단어 사이에 다른 문자가 딱 1개인지 확인하는 함수
    private boolean isOneDiff(String a, String b) {
        int diff = 0; // 다른문자 개수
        for(int i = 0; i < a.length(); i++){
            // 서로 다른 글자 수를 카운트한다.
            if(a.charAt(i) != b.charAt(i)) diff++;
            if(diff > 1) return false; // 2개 이상 다르면 false를 리턴
        }
        return diff == 1; // 정확히 1개만 다르다면 true

    }

    class Word {
        String word;
        int step;
        // 생성자 생성
        public Word(String word, int step) {
            this.word = word;
            this.step = step;
        }
    }



}
