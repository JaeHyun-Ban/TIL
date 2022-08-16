## 객체(JSON)

JSON(JavaScript Object Notaion>>자바스크립트 객체 표기법)
자바스크립트의 객체는 **{}로 표기**한다.
자바스크립트의 객체는 **함수로도 표기**한다

```
ver person = {
  name : '홍길동',
  age : 20,
  arr : [1,2,3]
}
>>자바스크립트의 객체(자바의 클래스 생성처럼 사용)
```

### 생성자 함수

생성자 함수로 객체 선언 가능

```
function People(name, age){
  this.name = name;
  this.age = age;
  //반드시 익명함수로 작성
  this.info = function(){
    return "이름: " + name + ", 나이:" + age;
  }
}
var people = new People('홍길순', 50);
```

---

JSON형태의 데이터를 전송할 때 문자열로 바꿔서 전송한다
