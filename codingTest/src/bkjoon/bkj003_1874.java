package bkjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Stack;

public class bkj003_1874 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuffer sb = new StringBuffer();
        Stack<Integer> st = new Stack<>();

        int num = Integer.parseInt(br.readLine());
        int[] target = new int[num];

        for(int i = 0; i < num; i++){
            target[i] = Integer.parseInt(br.readLine());
        }

        int n = 1; // push number
        boolean flag = true;
        for(int i = 0; i < num; i++){
            int current = target[i];


            // 현재 숫자보다 작거나 같을 때까지 push
            // 왜냐하면 오름차순으로 만들어야하기 때문이지
            while(num <= current) {
                st.push(num++);
                sb.append("+\n");
            }
            // 현재 숫자가 top에 존재하고있다면 pop
            if (st.peek() == current) {
                st.pop();
                sb.append("-\n");
            } else {
                // 불가능한 경우
                flag = false;
                break;
            }

        }
        if(flag){
            System.out.println(sb);
        } else System.out.println("NO");

    }


}
