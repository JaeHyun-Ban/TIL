### 정수로 이루어진 문자열을 실제 정수로 변환하는 메서드
- Interger.parseInt(문자열 or 문자열이 들어있는 변수)
```
String s1 = "10"; //문자열로 10을 저장
String s2 = "34"; //문자열로 34를 저장
System.out.println(s1 + s2); //1034 가 출력됨(단순히 문자열을 합친것)
		
int i1 = Integer.parseInt(s1); //Interger.parseInt를 통해 정수로 변환
int i2 = Integer.parseInt(s2);
System.out.println(i1 + i2); //44가 나옴
```
- 퀴즈
```
 1. 정수를 하나 받아서 해당하는 수의 약수의 총합을 구해서
그 총합을 리턴하는 메서드를 하나 선언하세요.
		 
2. 이 메서드는 매개값으로 받은 정수의 모든 약수를 가로로 출력한 후 
 그 약수들의 총합을 리턴해 주는 메서드 입니다.
 
 3. 메서드 선언을 완료한 후에 메서드를 호출하여 
 10의 약수의 총합, 72의 약수의 총 합을 구해보세요.
		 
 4. 메서드 이름은 sum으로 통일하겠습니다.

public class MathodQuiz {
	
  // 숫자를 계산해주는 메서드 생성
  static int sum(int x) { 
		int total = 0;
		System.out.print(x + "의 약수: ");
		for(int i = 1; i <= x; i++) {
			if(x%i == 0) {
			total += i;
			System.out.print(i + " ");
			}
		}
		System.out.println();
		return total;
	}
	

	public static void main(String[] args) {
		
    //생성한 계산 메서드를 메인 메서드에 호출해서 사용
		System.out.println("10의 약수의 총합: " + sum(10));
		System.out.println("72의 약수의 총합: " + sum(72));
	}

}
 
```
