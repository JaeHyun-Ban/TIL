package programers;

public class pgm022_12912 {

    public long solution(int a, int b){

        //
        int start = Math.min(a, b);
        int end = Math.max(a, b);

        // 가우스 공식을 사용
        long count = (long)(end - start + 1);
        long sum = count * (start + end) / 2;

        return sum;
    }
}
