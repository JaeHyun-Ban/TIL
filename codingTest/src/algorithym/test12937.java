package algorithym;

import java.io.*;

public class test12937 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        int num = Integer.parseInt(br.readLine());
        if(num%2 == 0){
            bw.write("Even");
        } else{
            bw.write("Odd");
        }
        br.close();
        bw.close();
    }




}
