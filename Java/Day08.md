## 2차원 배열
- 배열안에 배열을 생성한다
```
int[] arr1 = {1,2,3};
int[] arr2 = {4,5,6};
int[] arr3 = {7,8,9}; //int 배열을 3개 생성한 뒤

int[][] arr3by3 = {arr1, arr2, arr3}; //새로운 int배열을 생성해 배열을 넣어준다


System.out.println(Arrays.toString(arr3by3)); 
//>2차원 배열 안에는 주소값이 들어있다.(그 주소값을 통해 배열속 배열을 꺼내온다)
//>Arrays.toString(arr3by3)을 통해 주소값을 확인 할 수 있다

System.out.println(Arrays.toString(arr3by3[0])); //배열속 배열의 번호를 통해 직접 깨내보는것이 가능하다
System.out.println(Arrays.deepToString(arr3by3)); 
//> 다차원 배열에서 Arrays.deepToString(arr3by3)을 통해 내부의 모든 값을 문자열 형태로 출력 가능하다.

System.out.println(arr3by3[1][2]);//1번 인덱스 안의 2번 인덱스를 출력
```
## 메서드(Method)
- 메서드는 **반복되는 코드 블록**에 이름을 붙여 놓은 것 입니다.
- 메서드는 반복되는 코드를 줄여주고,   
좀 더 구조화시켜서 우리가 코드를 알아보기 쉽게 해준다.(코드의 모듈화)
- 메서드는 **선언하는 과정과 호출하는 과정으로 나누어진다.**
- 메서드 선언은 메서드 내부에서는 불가능 합니다.    
새로운 메서드의 선언은 반드시 메서드 블록 외부 and 클래스 블록 내부에서만 가능하다.
- 메서드 호출은 메서드 생성자 블록 내부에서만 가능하다.
```
public class MethodExample1 {

	//메서드의 선언.
	static int calcTotal(int x) {//(int x)정수값을 받아서 내부로 전달해준다(매개변수)
		int total = 0;
		for(int i = 0; i <= x; i++) {
			total += i;
		}
		return total;
	}
	
	
	public static void main(String[] args) {
		
    		//메서드 호출
		int result = calcTotal(10);
		System.out.println("int result에 대입: "+ result);
		System.out.println("calcTotal을 바로 출력: " + calcTotal(10));
		System.out.println("1~100까지의 누적합: " + calcTotal(100));
		System.out.println("1~200까지의 누적합: " + calcTotal(200));
		System.out.println("1~300까지의 누적합: " + calcTotal(300));
		System.out.println("1~400까지의 누적합: " + calcTotal(400));
		System.out.println("1~500까지의 누적합: " + calcTotal(500));
  	} 
}
```

## 매개 변수(Parameter, argument)
- 매개변수는 **메서드를 호출 할 때, 메서드 실행에 필요한 값들을**    
**메서드 내부로 전달하는 매개체 역활을 한다.**
- 메서드 호출부에서 어떤 매개값을 전달하느냐에 따라   
메서드의 실행 결과가 달라지게 된다.
- 매개값을 몇 개 받아 사용할지는 메서드를 선언 할 때   
선언부에서 ()안에 미리 갯수와 타입을 지정해놓는다.
- 매개변수를 하나도 선언하지 않을 수 있다.   
  - 이 때는 메서드의 선언부의 ()내부를 비워준다   
  그리고 호출할 때도 ()를 비워서 호출한다.
```
//x~y까지의 누적합을 구하는 메서드
static int calcRangeTotal(int start, int end) { //int start, int end = 매개변수
	int total = 0;
	for(int i = start; i <= end; i++) {
		total += i;
	}
	return total;
}
```
```
//매개값을 배열로 입력해 매개변수를 여러번 입력받을 수 있다.
static int calcNumberTotal(int[] nums) { 
		
	int total = 0;
	for(int i : nums){//향상for문 사용
		total += i;	
	}
	return total;
}
```
## 반환값, 반환 유형(return value, retyrn type)
- 반환값이라는 메서드의 실행 결과값을 의미한다.
- 매개변수는 여러개 존재할 수 있지만, 반환값은 오직 한 개만 존재해야 한다.
- return 이라는 키워드를 사용하며 return 뒤에 전달할 값을 지정한다.
- **전달되는 값의 데이터 타입을 반환유형이라고 하며,**   
메서드를 선언할 때 메서드 이름 앞에 반드시 반환 유형을 명시해야 한다.
- 반환값이 있는 메서드는 호출문이 하나의 값으로 처리될 수 있기 때문에   
반환값을 다른 변수에 대입할 수도 있고, 다른 메서드의 매개값으로 사용이 가능하다.
- 모든 메서드가 반환 유형이 있는것은 아니다.   
**메서드 실행 후 반환할 값이 딱히 없다면 return을 사용하지 않아도 된다.**
  - 이 때 반환유형을 메서드 선언시에 비워두지 말고, 반드시 void라는 키워드를 작성해 주어야 한다.
- 모든 메서드는 return을 만나면 강제로 메서드가 종료뇌다.   
따라서 조건없이 return문 아래에 코드를 작성할 수 없다.
  - void메서드에서는 return 키워드를 탈출 기능으로 사용할 수 있다.











