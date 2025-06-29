package programers;


public class pgm006 {
    /* 12911 */
    public static void main(String[] args) {

    }

    public int soulution(int n) {
        // 2진수로 변환 시 1의 개수가 같은 가장 작은 수
        // 최초 입력받은 숫자의 bitCount를 저장
        // > 이후 ++로 하나씩 증가해보면서 bitCount가 같은 숫자를 발견했다면 리턴
        int answer = 0;

        int cnt = Integer.bitCount(n); // 2진수로 변환 시 1의 개수를 반환

        while(true) {
            n++;
            if(Integer.bitCount(n) == cnt) {
                return n;
            }
        }


    }

}
