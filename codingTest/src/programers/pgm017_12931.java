package programers;

import java.util.ArrayList;

public class pgm017_12931 {
    public static void main(String[] args) {

    }

    public int solution(int n) {
        int answer = 0;

        ArrayList<Integer> list = new ArrayList<>();

        while (n > 0) {
            list.add(n % 10);
            n = n / 10;
        }

        for(int i : list) {
            answer = answer + i;
        }


        return answer;
    }
}
