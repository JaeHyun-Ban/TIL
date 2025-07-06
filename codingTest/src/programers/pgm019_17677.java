package programers;

import java.util.ArrayList;
import java.util.List;

public class pgm019_17677 {

    public int solution(String str1, String str2) {

        List<String> list1 = toBigrams(str1.toLowerCase());
        List<String> list2 = toBigrams(str2.toLowerCase());

        List<String> intersection = new ArrayList<>(); // 교집합
        List<String> union = new ArrayList<>(list1); // 전체집합

        // 교집합 구하기
        for(String s : list1) {
            if(list2.contains(s)) {
                intersection.add(s); // 교집합 구하기
                list2.remove(s);
            }
        }
        union.addAll(list2);

        double jaccard = union.size() == 0 ? 1 : (double) intersection.size() / union.size();

        return (int)(jaccard * 65536);
    }

    public List<String> toBigrams(String s){
        List<String> result = new ArrayList<>();
        for(int i = 0; i < s.length()-1; i++){
            String temp = s.substring(i, i + 2);
            if(temp.matches("[a-zA-Z]{2}")) {//특수문자를 제외하는 정규식_2자리
                result.add(temp);
            }
        }
        return result;
    }


    public static int solution02(String str1, String str2){
        int answer = -1;
        // 특수문자를 제거
        String s1 = str1.replaceAll("[^a-zA-Z0-9\\s]", "").toLowerCase();
        String s2 = str2.replaceAll("[^a-zA-Z0-9\\s]", "").toLowerCase();

        // 두글자씩 끊어서 다중집합 생성
        String[] sArr1 = {};
        String[] sArr2 = {};

        //s1의 다중집합 생성
        int index1 = 0;
        for(int i = 0; i < s1.length(); i++){
            if(i+1 == s1.length()) {
                break;
            } else {
                sArr1[index1++] = (String.valueOf(s1.charAt(i)) + String.valueOf(s1.charAt(i+1)));
            }
        }

        //s2의 다중집합 생성
        int index2 = 0;
        for(int i = 0; i < s2.length(); i++){
            if(i+1 == s2.length()) {
                break;
            } else {
                sArr2[index2++] = (String.valueOf(s1.charAt(i)) + String.valueOf(s1.charAt(i+1)));
            }
        }

        // * 서로의 교집합을 비교
        int inter = 0;
        for(int i = 0; i < sArr1.length; i++){
            for(int j = 0; j < sArr2.length; j++){
                if(sArr1[i].equals(sArr2[j])){
                    inter++;
                }
            }
        }
        answer = inter/(sArr1.length+sArr2.length);;
        return answer;
    }
    public static void main(String[] args) {
//        System.out.println(solution("FRANCE", "french"));
        System.out.println("hello".length());
    }
}
