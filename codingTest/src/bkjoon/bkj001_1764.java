package bkjoon;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

public class
bkj001_1764 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String[] num = br.readLine().split(" ");//듣지도 보지도 못한사람의 수

        int N = Integer.parseInt(num[0]); //듣지도못한사람의 수
        int M = Integer.parseInt(num[1]); //보지도못한사람의 수

        HashSet<String> nm = new HashSet<>(); // 듣지도 보지도 못한사람 비교용
        ArrayList<String> rs = new ArrayList<>();// 듣지도 보지도 못한사람 결과 저장

        // 듣지도 못한사람
        for(int i = 0; i < N; i ++) { //N명 저장
            nm.add(br.readLine());
        }

        // 보지도 못한 사람
        for(int i = 0; i < M; i++) {
            String name = br.readLine();
            //듣지도 못한사람에 보지도 못한사람이 포함되어있다면
            if(nm.contains(name)) {
                rs.add(name);   //반환 배열에 add
            }
        }

        Collections.sort(rs);// 오름차순 정렬

        //결과 반환
        StringBuilder sb = new StringBuilder();
        sb.append(rs.size()).append("\n"); //몇명인지 넣고
        for(String s : rs){ //이름 넣고
            sb.append(s).append("\n");
        }

        System.out.println(sb.toString());//전체 출력

    }
}
