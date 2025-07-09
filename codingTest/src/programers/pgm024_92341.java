package programers;
import java.util.HashMap;
import java.util.Map;

public class pgm024_92341 {

    public static void main(String[] args) {

    }

    // pro_92341
    // 주차 요금 계산
    public int[] solution(int[] fees, String[] records) {
        int[] answer = {};
        // fees[0] = 기본시간
        // fees[1] = 기본요금
        // fees[2] = 단위시간
        // fees[3] = 단위요금
        Map<String, Integer> carMap = new HashMap<>(); // 차량번호와 주차시간을 저장
        Map<String, Integer> feeMap = new HashMap<>(); // 차량번호와 최종 요금을 저장

        for (String str : records) {
            String[] arr = str.split(" ");
            String[] mmss = arr[0].split(":"); // 시간
            int mm = Integer.parseInt(mmss[0]);
            int ss = Integer.parseInt(mmss[1]);
            int time = (mm * 60) + ss;
            String carNum = arr[1];// 차량번호
            String record = arr[2];// 내역

            // 차량이 입차인 경우
            if (record.equals("IN")) {
                carMap.put(carNum, time); // 차량번호와 주차시간을 저장
            } else {
                // 차량이 출차인 경우
                if (carMap.containsKey(carNum)) {
                    int parkedTime = time - carMap.get(carNum); // 주차시간 계산
                    carMap.remove(carNum); // 차량번호와 주차시간을 삭제
                    // 주차시간이 기본시간보다 작거나 같으면 기본요금
                    if (parkedTime <= fees[0]) {
                        feeMap.put(carNum, fees[1]);
                    } else {
                        // 주차시간이 기본시간보다 크면 단위시간과 단위요금을 계산
                        int extraTime = parkedTime - fees[0]; // 기본시간을 뺀 시간
                        int extraFee = (int) Math.ceil((double) extraTime / fees[2]) * fees[3]; // 단위시간과 단위요금을 계산
                        feeMap.put(carNum, fees[1] + extraFee); // 기본요금과 단위요금을 더해서 저장
                    }
                }
            }
        }
        // 출차를 안한 차량들의 주차시간 계산
        for (String carNum : carMap.keySet()) {
            int parkedTime = (23 * 60 + 59) - carMap.get(carNum); // 23:59까지
            carMap.remove(carNum); // 차량번호와 주차시간을 삭제
            // 주차시간이 기본시간보다 작거나 같으면 기본요금
            if (parkedTime <= fees[0]) {
                feeMap.put(carNum, fees[1]); // 기본요금 저장
            } else {
                // 주차시간이 기본시간보다 크면 단위시간과 단위요금을 계산
                int extraTime = parkedTime - fees[0]; // 기본시간을 뺀 시간
                int extraFee = (int) Math.ceil((double) extraTime / fees[2]) * fees[3]; // 단위시간과 단위요금을 계산
                feeMap.put(carNum, fees[1] + extraFee); // 기본요금과 단위요금을 더해서 저장
            }
        }
        // 차량번호를 오름차순으로 정렬하여 최종 요금을 반환
        answer = new int[feeMap.size()];
        int index = 0;
        for (String carNum : feeMap.keySet()) {
            answer[index++] = feeMap.get(carNum);
        }
        java.util.Arrays.sort(answer); // 차량번호를 오름차순으로 정렬

        return answer;
    }
}