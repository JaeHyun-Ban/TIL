# REST API

## @RestController란?

기존의 @Controller는 return에 Model을 담아서 JSP에 전달하는 방식을 사용했다

---

**비동기 요청 전용 컨트롤러**이며
RequestMapping으로 들어오는 요청을 받아들이는 것은 동일하지만 return의 결과는 뷰리졸버가 아니라 **요청한 화면으로 리턴**된다

> 객체를 보낼수도 있다, 단 자동으로 JSON형태로 변환해주는 **Jackson-databind라이브러리**가 반드시 필요하다

---

## @RestController 기본 어노테이션

@RestController: Controller가 rest방식임을 명시(ResponseBody가 포함되어있다)
@ResponseBody: 뷰리졸버로 전달하는게 아니라 데이터를 요청한 화면으로 전달함을 명시(RestController에는 이미 포함)
@PathVariable:
@RequestBoody: JSON데이터를 자동으로 바인딩처리

> @RestController가 버전문제로 존재하지 않는다면 @ResponseBody와 @RequestBody를 섞어서 잘 사용해야 한다

---

## @RestController의 전송방식

- 등록 : POST : (URL) /reply/등록
- 조회 : GET : (URL) /reply{id}
- 아래 두개는 잘 사용하지 않는다(어려움)
  - 수정 : PUT : (URL) /reply/{id}제이슨
  - 삭제 : DELETE : (URL) / reply/{id}

---

# 메모

기존에 사용하고있던 하나의 서버에 IOS, 안드로이드, 기타 여러가지들의 데이터를 요청받아 사용할 수 있다
각각 따로 만드는 짓은 하지 않는다

이러한 다양한 클라이언트들은 비동기처리방식을 사용해 서버에서 데이처만 가져간다

이 `비동기요청을 받는 서버`를 직접 구축하는 것이 `REST API`이다

REST API개발자란 각각 클라이언트에 맞게 비동기로 데이터를 줄 수 있는 서버를 만드는 개발자이다

---

주고 받는 방법에는 대표적으로 자바스크립트를 이용한 `JSON형식`이 있다

---

사용하는측(클라리언츠) -> 커스터머
웹서버(제공자) -> 프로듀서

---

크롬 웹스토어의 (YARC)를 설치해 사용한다
https://chrome.google.com/webstore/detail/yet-another-rest-client/ehafadccdcdedbhcbddihehiodgcddpl/related?hl=ko
