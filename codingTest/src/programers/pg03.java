package programers;

import java.util.*;


public class pg03 {
    /*
     * #문제이해
     * 전체 학생 수 2 <= n <= 30
     * 체육복 도난당한 학생의 수 1<=n<=n2
     * 여벌의 체육복을 가져온 학생의 수 1<=n<=30
     * 
     * 전체 학생의 수 = n
     * 학생 번호 배열(잃어버린):    lost
     * 학생 번호 배열(여벌을 챙긴):  reserve
     * 
     * 체육수업을 들을 수 있는 학생의 최댓값을 return 
     * 
     */
    public static void main(String[] args) {
        

        // solution(s);

    }
    public static int solution(int n, int[] lost, int[] reserve){
        
        int answer = 0;

        ArrayList<Integer> arr = new ArrayList<>();

        Arrays.sort(lost);
        Arrays.sort(reserve);

        //학생번호 반복(잃어버린)
        for(int i = 0; i < lost.length; i++){
            //잃어버린 번호, 여벌의 번호 대조
            //일어버린 번호-1 
//            if(reserve.)
            if(reserve.equals(lost[i]-1)){
                arr.add(lost[i]);
            //잃어버린 번호+1
            } else if(reserve.equals(lost[i]+1)){

            }

        }


        return answer;
        
    }


}
