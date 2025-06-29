package leetcode;

import java.util.*;

public class ltc844 {

    public static void main(String[] args) {
        
        String s = "a##c";
        String t = "#a#c";

        boolean flag = backspaceCompare(s, t);
        System.out.println("flag: " + flag);
    }
    
    public static boolean backspaceCompare(String s, String t) {
        
        //String s와 t가 주어지고 return true를 한다.
        //#은 backspace를 의미하고 이것을 뺀 나머지의 
        //s와 t의 string 형태가 같다면 true를 반환
        //빈 텍스트를 backspacing한다면 그대로 empty일 것

        /*
         * Stack을 생성
         * string이 들어올 대 push, #이 들어올 대 pop을 실행하여 
         * s와 t두개를 비교하면 될 듯 해 보인다.
         */
        Stack<Character> sData = new Stack<>();
        Stack<Character> tData = new Stack<>();
        String sfull = "";
        String tfull = "";

        for(int i = 0; i < s.length(); i++){
            char c = s.charAt(i);

            if(c == '#') {
                if(sData.isEmpty()){
                    continue;
                } else {
                    sData.pop();
                }
            } else {
                sData.push(c);
            }
        }
        for(int i = 0; i < sData.size(); i++){
            sfull += sData.get(i);
        }

        for(int i = 0; i < t.length(); i++){
            char c = t.charAt(i);

            if(c == '#') {
                if(tData.isEmpty()){
                    continue;
                } else {
                    tData.pop();
                }
            } else {
                tData.push(c);
            }
        }
        for(int i = 0; i < tData.size(); i++){
            tfull += tData.get(i);
        }
        System.out.println("sfull:" + sfull +  "  " + "tfull:" + tfull);


        // if(sfull.equals(tfull)) {
        //     return true;
        // } else 
        //     return false;
        return sfull.equals(tfull) ? true : false;

        





    
    }


}
