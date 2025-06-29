package leetcode;
import java.util.*;

public class BaseballGame {
    
    public static void main(String[] args) {
        
    }


    public static int calPoints(String[] operations){
        
        Stack<Integer> st = new Stack<>();


        for(String s : operations){
            
            if(1 <= Integer.parseInt(s) && Integer.parseInt(s) <= 1000){
                st.push(Integer.parseInt(s));
            }
            //Record a new score that is the sum of the previous two scores.
            if(s.equals("+")){
                int num01 = st.pop();
                int num02 = st.pop();
                int sum = num01 + num02;

                st.push(num01);
                st.push(num02);
                st.push(sum);

            }

            //Record a new score that is the double of the previous score.
            if(s.equals("D")){
                int num01 = st.pop();
                int dbl = num01 * 2;

                st.push(num01);
                st.push(dbl);
            }

            //Invalidate the previous score, removing it from the record
            if(s.equals("C")){
                st.pop();
            }
        }

        int sum = 0;
        while (st.isEmpty()) {
            sum += st.pop();
        }
        return sum;
    }
}
