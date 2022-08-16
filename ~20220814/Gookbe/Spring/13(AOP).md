# AOP

## Aspect-Oriented-Programming

- 관점지향 프로그래밍: 더욱 객체지향답게 의미를 갖는다
- 공통코드, 개별코드(비즈니스 로직)를 분리해서 작성한다
- ex) java의 공통 기능을 부모클래스로 정의하고 상속 관계로 사용

기존의 코드를 건들지 않고 외부에서ㅏ 원하는 기능에 접근하여 결합

---

## AOP의 용어

- (AOP)Proxy: 대리자(대리인의 역할을 하는 박스)

  > Target: 개발자가 작성한 Service클래스

- Join Point: Target의 메서드(Service클래스 `안의 메서드`)

  > 실제 적용시킬 메서드

- Advice: **공통 코드**(로깅, 에러처리 등...)
- PointCut: Advice를 **어떤 Joint Point에 결합할 것**인지 **설정**(공통 코드를 어떤 메서드에 적용할 것인가)

---

## AOP설정

1. AOP를 사용하기 위해서는 pom.xml에 라이브러리를 추가해서 사용한다
   https://mvnrepository.com/artifact/org.aspectj/aspectjweaver

```
클래스를 하나 생성해 context:component-scan에 등록할 어노테이션을 추가해 준다
```

2. namespace에 aop를 체크

3. servlet-xml에 태그를 추가한다(실제로는 interceptor-context에 추가했다)
   `<aop:aspectj-autoproxy />`

---

# 메모

외부에서 비즈니스 로직에 접근해서 세부적으로 처리 할 수 있다

더 객체지향스러운 프로그램

수정하고 싶은 공통메서드들을 묶어서 수정 후 다시 분리(?)

---

AOP(관점지향)라는건 다른곳에서도 존재한다, 하지만 스프링에서는 이질적인 느낌이지만 지원을 해준다
