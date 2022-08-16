# 변수

문장 끝에 세미콜론(;)을 입력한다
생략해도 무관하나 오류 방지를 위해 권장한다

## 변수의 선언

### var키워드 이용

동일 변수의 중복을 허용

### let키워드 이용(ES6문법에 추가된 변수)

동일 변수의 중복을 허용하지 않음

---

# 데이터 타입

## 기본타입

### 숫자(numver)

### 문자열(string)

### 불린(boolean)타입

### ★undefined

- 변수는 선언했으나 초기화 하지 않은경우
- 불린형은 false로 반환, 숫자느 NanN, 문자열은 "undefined"로 반환됨

### ★null

- 값은 저장했으나 존재하지 않을 때 나타난다

---

# 연산자

## 비교연산자

`===`, `!==`: 타입을 비교해준다

나머지 연산자들을 동일하게 사용된다.

---

# 배열

자바 스크립트의 배열은 []로 묶어 주기만 하면된다
자바 스크립트의 배열은 저장을 자바와 다르게 타입과 상관없다

## 배열의 선언, 생성

```
var arr1 = [];
var arr2 = [1,2,3];
var arr3 = [1,2,3, "가", "나"];

var arr4 = new Array();
```

## 배열의 사용

```
var arr1 = [];
arr1[0] = 1;
arr1[1] = 2;

document.write(arr1[0]);
document.write(arr1[1]);
```

## 배열의 길이, 문자열로 출력

```
var arr2 = [1,2,"가"];
document.write(arr2);
document.write(arr2.length);//길이
document.write(arr2.toString);
```
