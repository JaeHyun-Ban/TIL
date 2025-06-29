package programers;


public class pgm004 {
    /*코딩테스트 연습 > 연습문제 > JadenCase 문자열 만들기
도움말 */
    public static void main(String[] args) {

    }

    public String soulution(String s) {

        StringBuilder sb = new StringBuilder();
        boolean startWord = true;

        for(char c : s.toCharArray()) {
            if(startWord) { // 첫번째는 무조껀 대문자
                sb.append(Character.toUpperCase(c)); // 대문자 변경
            } else {
                sb.append(Character.toLowerCase(c));
            }
            startWord = (c == ' '); // 공백이라면 다음은 첫글자(여기서 boolean체크)
        }

        return sb.toString();
    }

    public String solution02(String s) {
        String answer = "";
        String[] sp = s.toLowerCase().split(""); //전부 나눠서 담기
        boolean flag = true;

        for(String ss : sp) {
            answer += flag ? ss.toUpperCase() : ss;
            flag = ss.equals(" ") ? true : false; // 공백이라면 다음글자는 첫번째 글자라는 이야기
        }

        return answer;
    }
}
