package programers;

import java.util.*;

public class pgm016_12953 {
    /* N개의 최소공배수 */
    public static void main(String[] args) {

    }

    public int soulution(int[] arr) {
        int answer = arr[0];
        for(int i = 0; i < arr.length; i++){
            answer = lcm(answer, arr[i]);
        }



        return answer;
    }

    // 최대공약수 (유클리드 호제법)
    public int gcd(int a, int b) {
        while(b != 0) {
            int tmp = a%b;
            a = b;
            b = tmp;
        }
        return a;
    }
    // 최소공배수
    public int lcm(int a, int b) {
        return a * b / gcd(a, b);
    }
}
