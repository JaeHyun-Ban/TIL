- [다양한 예외처리](https://deftkang.tistory.com/45)
- [자주 쓰이는 예외처리](https://best421.tistory.com/10)

- ctrl + t 로 코드들의 상속관계를 확인할 수 있다

- [이클립스 단축키 모음](https://blog.outsider.ne.kr/243)

# 18. 예외 처리

## 예외란?

예외에는 **컴파일러 체크예외(Exception)**와 **실행예외(Runtime Exception)**가 있다.

- 컴파일러 체크 예외는 자바 소스를 컴파일하는 과정에서 예외 코드를 검사하여 예외 처리 코드가 없다면 컴파일 오류가 발생합니다
- 실행 예외는 컴파일하는 과정에서 예외처리 코드를 검사하지 않는 예외를 말한다.

### 1. 예외 넘기기(예외 떠넘기기)

**throws**

- try ~ catch 구문이 예외가 발생했을 때 직접 해결하고자 하는 코드라면 **thorws**는 메서드나 생성자를 **호출한 곳으로 예외를 떠넘기는** 코드이다.

- 즉 예외처리를 직접 수행하지 않고 **메서드 호출자에게 예외를 던지는 방법**이다.

- throws키워드가 붙어있는 메서드는 반드시 try블록 내부에서 호출되어야 한다. 그리고 catch블록에서 떠넘겨 받은 예외를 처리해야 한다.

- main도 throws를 사용할 수 있다.

### 예외 강제 발생 시키기

- 사용자가 직접 선언한 예외 클래스나 자바가 제공하는 예외 API에서 예외를 강제로 발생시키려면 **throw**라는 키워드를 이용한다.
- 예외를 강제 발생시키며 메서드를 **강제 종료**한다.

```
잘못된 값이 전달되면 반드시 강제 종료해야 하는 예

public static int calcSum(int n) throws Exception {

    if(n <= 0) {
        throw new Exception("매개값을 반드시 양수로 전달하세요.");
        //>thorw구문은 강제 예외를 발생시키고, 메서드를 종료한다.
    }

    int sum = 0;
    for(int i=1; i<=n; i++) {
        sum += i;
    }

    return sum;
}

```

### 사용자 정의 예외

- 프로그램을 개발하다 보면 자바 **표준API**에서 제공하는 **예외 클래스**만으로 **다양한 종류의 예외를 표현할 수 없습니다.**
- 개발자가 만든 어플리케이션에서 자체적으로 생길 수 있는 예외는 개발자가 직접 예외 클래스를 정의해서 만들어야 한다.
- 사용자 정의 예외 클래스는 **Execption 클래스를 상속하여 사용**하면 된다.
- 사용자 정의 예외클래스의 이름은 Exception으로 끝나는 것이 좋다(추천)

```
public class MyException extends Exception {

    //기본생성자
    public MyException() {}

    //메세지를 받는 생성자
    public MyException(String message) {
         super(message);
    }
    ………
}
```
